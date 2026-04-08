import pandas as pd
import re

# -----------------------------
# CONFIGURACIÓN
# -----------------------------
archivo_entrada = "Encuestas 2024.xlsx"
hoja = "2024"
archivo_salida = "Encuestas_2024_limpio.xlsx"

# -----------------------------
# REGEX PARA ELIMINAR EMOJIS
# -----------------------------
emoji_pattern = re.compile(
    "["
    "\U0001F600-\U0001F64F"  # emoticons
    "\U0001F300-\U0001F5FF"  # symbols
    "\U0001F680-\U0001F6FF"  # transport
    "\U0001F700-\U0001F77F"
    "\U0001F780-\U0001F7FF"
    "\U0001F800-\U0001F8FF"
    "\U0001F900-\U0001F9FF"
    "\U0001FA00-\U0001FA6F"
    "\U0001FA70-\U0001FAFF"
    "\U00002700-\U000027BF"
    "\U00002600-\U000026FF"
    "\U00002B00-\U00002BFF"
    "]+",
    flags=re.UNICODE
)

def eliminar_emojis(texto):
    if isinstance(texto, str):

        # eliminar emojis
        texto = emoji_pattern.sub('', texto)

        # eliminar espacios múltiples
        texto = re.sub(r'\s+', ' ', texto)

        # eliminar espacios al inicio y final
        texto = texto.strip()
    return texto

# -----------------------------
# CARGAR ARCHIVO
# -----------------------------
df = pd.read_excel(archivo_entrada, sheet_name=hoja)

# -----------------------------
# LIMPIAR TODAS LAS COLUMNAS
# -----------------------------
for col in df.columns:
    df[col] = df[col].apply(eliminar_emojis)

# -----------------------------
# GUARDAR ARCHIVO LIMPIO
# -----------------------------
df.to_excel(archivo_salida, index=False)

print("✅ Limpieza completada")
print("Archivo generado:", archivo_salida)