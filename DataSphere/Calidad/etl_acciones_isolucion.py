# etl_acciones_isolucion.py
# Requisitos (CMD/PowerShell):
#   pip openpyxl pywin32 lxml beautifulsoup4 html5lib

import pandas as pd
import numpy as np
from pathlib import Path
import time

# ===== CONFIGURACIÓN =====


SRC_PATH = Path(r"C:\Users\degonzalez\Documents\2025\DataSphere\Calidad\Reporte acciones mejora isolucion.xlsx")
OUT_PATH = SRC_PATH.with_name("acciones de mejora isolucion procesadas.xlsx")  # <— nombre pedido

TARGET_COLS = [
    "Tipo","Num","Proceso","Enviar A","Fecha Hallazgo","Estado","Eficacia Global",
    "Descripción","Fuente","Dependencia","Reportado Por","Indicador","Medición",
    "Actividad","Responsable","Fecha Compromiso","Eficacia","Seguimiento",
    "Fecha Seguimiento","Fecha Cierre Proyectada","Avance %","Dias","Fecha Cierre","Causa Raiz"
]

# ===== UTILIDADES =====
def try_read_excel(path: Path):
    """Intento directo con pandas; devuelve df o None."""
    try:
        # header=None para NO usar la primera fila como encabezado
        df = pd.read_excel(path, header=None)
        if df.shape[0] > 0 and df.shape[1] > 0:
            return df
    except Exception as e:
        print("read_excel falló:", e)
    return None

def convert_xls_to_xlsx_with_excel(xls_path: Path, xlsx_path: Path):
    """Convierte con Excel COM; requiere Excel instalado y pywin32."""
    import win32com.client as win32
    excel = win32.gencache.EnsureDispatch("Excel.Application")
    excel.DisplayAlerts = False
    try:
        wb = excel.Workbooks.Open(xls_path.as_posix())
        # Acepta el aviso de formato/extensión automáticamente
        wb.SaveAs(xlsx_path.as_posix(), FileFormat=51)  # 51 = .xlsx
        wb.Close(SaveChanges=False)
    finally:
        excel.Quit()
        time.sleep(1)

def try_read_html_like_xls(path: Path):
    """Plan C: algunos .xls son HTML renombrados."""
    try:
        tables = pd.read_html(path, header=None, encoding="latin1")
        if tables and len(tables[0]) > 0:
            return tables[0]
    except Exception as e:
        print("read_html falló:", e)
    return None

def read_source_any(path: Path) -> pd.DataFrame:
    """Lee el archivo; si es .xls ‘raro’, lo convierte y reintenta."""
    # 1) intentar directo
    df = try_read_excel(path)
    if df is not None:
        return df
    # 2) convertir con Excel a .xlsx
    xlsx_tmp = path.with_suffix(".xlsx")
    print("Convirtiendo con Excel a .xlsx…")
    convert_xls_to_xlsx_with_excel(path, xlsx_tmp)
    df = try_read_excel(xlsx_tmp)
    if df is not None:
        return df
    # 3) html disfrazado
    df = try_read_html_like_xls(path)
    if df is not None:
        return df
    raise RuntimeError("No fue posible leer el archivo ni convertirlo. Abre manualmente y 'Guardar como' .xlsx.")

def is_header_like_row(row_values) -> bool:
    """
    Detecta filas de encabezado (en cualquier posición) comparando con TARGET_COLS (case-insensitive,
    sin espacios) o si la primera celda es 'Tipo'.
    """
    norm = lambda s: str(s).strip().lower().replace(" ", "")
    if len(row_values) == 0:
        return False
    # si la primera celda es 'tipo'
    if not pd.isna(row_values[0]) and norm(row_values[0]) in {"tipo","típo"}:
        return True
    # si la fila coincide (parcialmente) con nombres destino
    upto = min(len(row_values), len(TARGET_COLS))
    row_norm = [norm(v) for v in row_values[:upto]]
    tgt_norm = [norm(c) for c in TARGET_COLS[:upto]]
    # si >70% de las primeras columnas coinciden con los nombres
    matches = sum(1 for a,b in zip(row_norm, tgt_norm) if a == b)
    return matches >= int(0.7 * upto)

# ===== EXTRACCIÓN =====
raw = read_source_any(SRC_PATH)

# ===== LIMPIEZA BASE =====
# eliminar filas totalmente vacías
raw = raw.dropna(how="all").copy()

# *** OMITIR PRIMERA FILA SIEMPRE ***
# (algunos libros vienen con una fila-título arriba; la quitamos sí o sí)
if raw.shape[0] > 0:
    raw = raw.iloc[2:, :].copy()

# quitar cualquier otra fila que parezca encabezado en el resto del archivo
mask_header_like = raw.apply(lambda r: is_header_like_row(list(r.values)), axis=1)
raw = raw[~mask_header_like].copy()

# rellenar celdas combinadas (forward-fill vertical)
raw = raw.ffill(axis=0)

# ajustar número de columnas al objetivo
if raw.shape[1] < len(TARGET_COLS):
    for i in range(len(TARGET_COLS) - raw.shape[1]):
        raw[raw.shape[1] + i] = np.nan
elif raw.shape[1] > len(TARGET_COLS):
    raw = raw.iloc[:, :len(TARGET_COLS)]

# renombrar columnas al orden solicitado
raw.columns = TARGET_COLS

# ===== TRANSFORMACIONES =====
# Fechas
for c in ["Fecha Hallazgo","Fecha Compromiso","Fecha Seguimiento","Fecha Cierre Proyectada","Fecha Cierre"]:
    raw[c] = pd.to_datetime(raw[c], errors="coerce")

# Num: mantener como texto (para no perder ceros a la izquierda)
raw["Num"] = raw["Num"].astype(str).str.strip().replace({"nan": np.nan, "None": np.nan, "": np.nan})

# Avance % → número (0..100)
raw["Avance %"] = (
    raw["Avance %"].astype(str)
    .str.replace("%","", regex=False)
    .str.replace(",",".", regex=False)
    .str.strip()
    .replace({"nan": np.nan, "": np.nan})
)
raw["Avance %"] = pd.to_numeric(raw["Avance %"], errors="coerce")

# Dias → entero
raw["Dias"] = pd.to_numeric(raw["Dias"], errors="coerce").astype("Int64")

# Crear llave = Tipo-Num (ambos tras ffill)
def build_key(tipo, num):
    t = "" if pd.isna(tipo) else str(tipo).strip()
    n = "" if pd.isna(num) else str(num).strip()
    return f"{t}-{n}" if (t or n) else np.nan

raw.insert(0, "llave", [build_key(t, n) for t, n in zip(raw["Tipo"], raw["Num"])])

# eliminar filas sin datos reales (todas NaN excepto llave)
raw = raw.dropna(how="all", subset=TARGET_COLS)

# ===== CARGA =====
raw.to_excel(OUT_PATH, index=False)
print("✅ ETL finalizada")
print("Salida:", OUT_PATH)
print("Shape:", raw.shape)

# ===== CHECKS RÁPIDOS =====
print("\n=== Checks ===")
print("Primeras llaves:", raw["llave"].dropna().head(10).tolist())
print("Nulos por columna (top10):\n", raw.isna().sum().sort_values(ascending=False).head(10))