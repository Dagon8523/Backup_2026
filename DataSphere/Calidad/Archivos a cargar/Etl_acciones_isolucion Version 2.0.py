import pandas as pd
import numpy as np
from pathlib import Path

# ===== CONFIGURACIÓN =====
SRC_PATH = Path(r"C:\Users\degonzalez\Documents\2025\DataSphere\Calidad\Reporte acciones mejora isolucion.xlsx")
OUT_PATH = SRC_PATH.with_name("acciones de mejora isolucion procesadas.xlsx")

# Nombres finales estándar que quieres manejar en el archivo procesado
TARGET_COLS = [
    "Tipo",
    "Num",
    "Proceso",
    "Enviar A",
    "Fecha Hallazgo",
    "Estado",
    "Eficacia Global",
    "Descripción",
    "Fuente",
    "Dependencia",
    "Reportado Por",
    "Indicador",
    "Actividad",
    "Responsable",
    "Fecha Compromiso",
    "Eficacia",
    "Seguimiento",
    "Fecha Seguimiento",
    "Fecha Cierre Proyectada",
    "Avance %",
    "Dias",
    "Fecha Cierre",
    "Causa Raiz"
]

DATE_COLS = [
    "Fecha Hallazgo",
    "Fecha Compromiso",
    "Fecha Seguimiento",
    "Fecha Cierre Proyectada",
    "Fecha Cierre"
]

# =============================
# FUNCIÓN PARA CONSTRUIR ENCABEZADOS
# =============================
def build_headers_from_excel_rows(df: pd.DataFrame) -> list:
    """
    Construye encabezados con esta regla:
    - columnas 1 a 11  -> fila 1
    - columnas 12 a 18 -> fila 2
    - columnas 19+     -> fila 1
    """
    row1 = df.iloc[0].ffill()
    row2 = df.iloc[1].ffill()

    headers = []
    for i in range(df.shape[1]):
        if 11 <= i <= 17:
            header_value = row2.iloc[i]
        else:
            header_value = row1.iloc[i]

        if pd.isna(header_value) or str(header_value).strip() == "":
            header_value = f"COL_{i+1}"

        headers.append(str(header_value).strip())

    return headers

# =============================
# EXTRACCIÓN
# =============================
raw = pd.read_excel(SRC_PATH, header=None)

# quitar filas totalmente vacías
raw = raw.dropna(how="all").copy()

# =============================
# 1. CONSTRUIR ENCABEZADOS ANTES DE CORTAR FILAS
# =============================
source_headers = build_headers_from_excel_rows(raw)

# =============================
# 2. OMITIR LAS DOS PRIMERAS FILAS (ENCABEZADOS)
# =============================
raw = raw.iloc[2:, :].copy()

# =============================
# 3. RELLENAR CELDAS COMBINADAS HACIA ABAJO
# =============================
raw = raw.ffill(axis=0)

# =============================
# 4. MANTENER TU LÓGICA DE SELECCIÓN DE COLUMNAS
# =============================
# Si el archivo trae más columnas que las esperadas,
# conserva las últimas 24 columnas (como veníamos manejando)
if raw.shape[1] > len(TARGET_COLS):
    raw = raw.iloc[:, -len(TARGET_COLS):].copy()
    selected_headers = source_headers[-len(TARGET_COLS):]

# Si trae menos, completar columnas vacías
elif raw.shape[1] < len(TARGET_COLS):
    faltantes = len(TARGET_COLS) - raw.shape[1]
    for _ in range(faltantes):
        raw[raw.shape[1]] = np.nan
        source_headers.append(f"COL_{len(source_headers)+1}")
    selected_headers = source_headers[:len(TARGET_COLS)]

else:
    selected_headers = source_headers[:len(TARGET_COLS)]

# =============================
# 5. ASIGNAR ENCABEZADOS OBTENIDOS DEL EXCEL
# =============================
raw.columns = selected_headers

# =============================
# 6. RENOMBRAR A LOS NOMBRES FINALES ESTÁNDAR
# =============================
# Esto mantiene tu salida final limpia y estable
rename_map = dict(zip(raw.columns, TARGET_COLS))
raw = raw.rename(columns=rename_map)

# =============================
# TRANSFORMACIONES
# =============================
raw = raw.replace(r"^\s*$", np.nan, regex=True)

# Fechas
for c in DATE_COLS:
    raw[c] = pd.to_datetime(raw[c], errors="coerce", dayfirst=True)

# Num como texto
raw["Num"] = (
    raw["Num"]
    .astype("string")
    .str.strip()
    .replace({"<NA>": pd.NA, "nan": pd.NA, "None": pd.NA, "": pd.NA})
)

# Avance %
raw["Avance %"] = (
    raw["Avance %"]
    .astype("string")
    .str.replace("%", "", regex=False)
    .str.replace(",", ".", regex=False)
    .str.strip()
)
raw["Avance %"] = pd.to_numeric(raw["Avance %"], errors="coerce")

# Dias
raw["Dias"] = pd.to_numeric(raw["Dias"], errors="coerce")

# =============================
# LLAVE
# =============================
raw.insert(
    0,
    "llave",
    raw["Tipo"].astype("string").str.strip().fillna("") + "-" +
    raw["Num"].astype("string").str.strip().fillna("")
)

raw["llave"] = raw["llave"].replace("-", pd.NA)

# =============================
# LIMPIEZA FINAL
# =============================
raw = raw.dropna(how="all", subset=TARGET_COLS).copy()

# =============================
# EXPORTACIÓN
# =============================
raw.to_excel(OUT_PATH, index=False)

print("✅ ETL finalizada")
print("Salida:", OUT_PATH)
print("Shape:", raw.shape)

print("\n=== CHECKS ===")
print("Headers origen seleccionados:")
print(selected_headers)

print("\nColumnas finales:")
print(list(raw.columns))

print("\nPrimeras llaves:")
print(raw["llave"].dropna().head(10).tolist())

print("\nNulos por columna:")
print(raw.isna().sum().sort_values(ascending=False).head(15))