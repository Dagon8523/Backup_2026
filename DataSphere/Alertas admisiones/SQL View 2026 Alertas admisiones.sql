SELECT 
--TABLA CANDIDATOS PRIMERO PARTE C1
c1."KEY_CS",
c1."KEY_CONSECUTIVO",
c1."ADM_ENRCATEG",
c1."FSHORT",
c1."ADM_CATEG",
c1."GBDAT",
c1."GESCHT",
c1."TYPET",
c1."IDNUMBER",
c1."INSTITUTE",
c1."VALID_DATE_TO",
c1."LTEXT",
c1."VISATYPET",
c1."VISANUMBER",
c1."VISABEGDA",
c1."VISAENDDA",
c1."ISSUE_COUNTRYT",
c1."PARTNER",
c1."ISTAT",
c1."ADM_RECPT",
c1."ZZINI_PROG",
c1."STOBJID",
c1."CSOBJID",
c1."SCOBJID",
c1."ZZ_JORNADA",
c1."SMTP_ADDR",
c1."SMTP_ADDR2",
c1."TEL_NUMBER",
c1."CEL_NUMBER",
c1."GBLNDT",
c1."BEZEI",
c1."GBORT",
c1."NATIOT",
c1."NATI2T",
c1."FTEXT",
c1."ZZ_TIENE_HIJOST",
c1."ZZ_NO_HIJOS",
c1."LAND1T",
c1."REGIOT",
c1."CITY1",
c1."STREET",
c1."TRANSPZONE",
c1."CITY2",
c1."XBLNR_INS",
c1."BUDAT_INS",
c1."AUGDT_INS",
c1."FECHA_ENT",
c1."XBLNR_MAT",
c1."BUDAT_MAT",
c1."ENTIT_NAME",
c1."ZZ_SANGRE",
c1."ZZ_RH",
c1."ZZ_TIPO_VIVIENDAT",
c1."SOCIALT",
c1."ETHNICT",
c1."ZZ_DISCAPACIDADT",
c1."CHTYPT",
c1."CHGRPT",
c1."ZZ_POSEE_TALENTOT",
c1."ZZ_TALENTOT",
c1."OESTEXT",
c1."OELAND1T",
c1."OEREGIOT",
c1."OEORT01",
c1."TRANSTYPET",
c1."REPSTATEX",
c1."REGPERIODFROM",
c1."SUBTESTRES01_ING",
c1."SUBTESTRES02_ING",
c1."SUBTESTRES03_ING",
c1."SUBTESTRES01_FRA",
c1."SUBTESTRES02_FRA",
c1."SUBTESTRES03_FRA",
c1."RPRELTEXTA_02",
c1."NAME_FIRST_02",
c1."HE_AGE",
c1."HE_MADVIV",
c1."HE_NAC",
c1."ADM_PERID",
c1."KEY_PERYR",

-- TABLA CANDIDATOS SEGUNDA PARTE C2
c2."ZZ_TIENE_HERMANOST",
c2."ZZ_NO_HERMANOS",
c2."ZZ_INGRESOST",
c2."ARBGB",
c2."ZZ_ACTIVIDADT",
c2."ZZ_TIPO_EMPRESAT",
c2."BRANC",
c2."ZZ_TAMANO_EMPT",
c2."ZZ_RANGO_SALARIALT",
c2."ZZ_NIVEL_CARGOT",
c2."LAND1_LABT",
c2."ORT01_LAB",
c2."TAETEBSCHR",
c2."ZZ_TEL_NUMBER",
c2."ZZ_ASPECTO_T",
c2."ZZ_MEDIOT",
c2."ZZ_DET_MEDIOT",
c2."ZZ_ACT_DEP",
c2."ZZ_ACT_DEP_T",
c2."ZZ_ACT_CUL",
c2."ZZ_ACT_CUL_T",
c2."ZZ_AREA_INFO",
c2."STFEECATT",
c2."BP_NAME",
c2."ZSTFEECAT",
c2."REASON",
c2."REACTIVACION",
c2."TITULACION",
c2."HE_PADVIV",
c2."HE_REACPO",
c2."HE_APLCPO",
c2."HE_CONTAD",
--TABLA PROGRAMAS P1
p1."HE_PROGRAMA_PRG",
p1."HE_PRGRMT",
p1."SNIES",
-- TABLA MATRICULADOS MAT1
mat1."STUDNT",
mat1."PRGRM",
mat1."NUEVO",
mat1."MATCON",
mat1."MATCONF",
--TABLA PHAPSEARCH
phap1."14",
phap1."49",
phap1."9",
--TABLA TEST ADMISIONES
test."19",
test."91",
test."Año_test",
--TABLA FACTORES DE SALUD

fact."Numero de identificacion",
fact."CATEGORIA",
fact."Codigo Plan de Estudios", 

--TABLA ESTUDIANTE OBJETO ID ESTUDIANTE
st1."STOBJID",

--TABLA ICFES
icf1."ZZ_TIPO_ICFES",
icf1."YEAR_ICFES",
icf1."PROM_MATE",

--CAMPOS CALCULADOS INDICADORES 
CASE 
    WHEN c2."ZZ_INGRESOST" = '01' 
        THEN 'Alerta Alta' 
    WHEN c2."ZZ_INGRESOST" = '02' 
        THEN 'Alerta Medio' 
    WHEN c2."ZZ_INGRESOST" in ('03', '04', '05') 
        THEN 'Alerta Baja' 
    WHEN c2."ZZ_INGRESOST" = '06' 
        THEN 'No informa' 
        ELSE 'No ingreso datos' 
END AS "Alerta_Ingresos",

CASE
    WHEN c1."ETHNICT" IS NULL OR "ETHNICT" = '' THEN 0
    WHEN TO_INTEGER(c1."ETHNICT") >= 1 THEN 1
        ELSE 0
END AS "Grupos_Etnicos",

CASE WHEN c1."ZZ_DISCAPACIDADT" = '01'
  THEN 1 
  ELSE 0 
END AS "Grupo_discapacidad",

CASE
    WHEN icf1."YEAR_ICFES" > 2014 AND icf1."ZZ_GLOBAL" <= 400 
        THEN 'Alerta Alta' 
    WHEN icf1."YEAR_ICFES" > 2014 AND icf1."ZZ_GLOBAL" > 400 AND icf1."ZZ_GLOBAL" <= 800 
        THEN 'Alerta Media' 
    WHEN icf1."YEAR_ICFES" > 2014 AND icf1."ZZ_GLOBAL" > 800 AND icf1."ZZ_GLOBAL" <= 1500 
        THEN 'Alerta Baja' 
    WHEN icf1."YEAR_ICFES" <= 1999 AND icf1."ZZ_PUNTAJE" <= 250 
        THEN 'Alerta Alta' 
    WHEN icf1."YEAR_ICFES" <= 1999 AND icf1."ZZ_PUNTAJE" > 250 AND icf1."ZZ_PUNTAJE" <= 374 
        THEN 'Alerta Media' 
    WHEN icf1."YEAR_ICFES" <= 1999 AND icf1."ZZ_PUNTAJE" > 375 AND icf1."ZZ_PUNTAJE" <= 500 
        THEN 'Alerta Baja' 
    WHEN icf1."YEAR_ICFES" between 2000 AND 2004 AND icf1."PROM_MATE" <= 33 
        THEN 'Alerta Baja' 
    WHEN icf1."YEAR_ICFES" between 2000 AND 2004 AND icf1."PROM_MATE" > 33 AND icf1."PROM_MATE" <= 64 
        THEN 'Alerta Media' 
    WHEN icf1."YEAR_ICFES" between 2000 AND 2004 AND icf1."PROM_MATE" > 64 AND icf1."PROM_MATE" <= 75 
        THEN 'Alerta Alta' 
    WHEN icf1."YEAR_ICFES" <= 2014 AND icf1."ZZ_PUESTO" <= 250 
        THEN 'Alerta Baja' 
    WHEN icf1."YEAR_ICFES" <= 2014 AND icf1."ZZ_PUESTO" > 250 AND icf1."ZZ_PUESTO" <= 500 
        THEN 'Alerta Media' 
    WHEN icf1."YEAR_ICFES" <= 2014 AND icf1."ZZ_PUESTO" > 500 AND icf1."ZZ_PUESTO" <= 1000 
        THEN 'Alerta Alta' 
    WHEN icf1."YEAR_ICFES" = '#' 
        THEN 'No asignado' 
        ELSE 'NO SE RECONOCE LA FECHA' 
END AS "ALERT_ICFES",



CASE
    WHEN TO_INTEGER(icf1."ZZ_TIPO_ICFES") in (1, 2) 
        THEN 
            CASE  
                WHEN icf1."ZZ_MATEMATICAS" <= 69 
                    THEN 'Alerta Alta' 
                WHEN icf1."ZZ_MATEMATICAS" <= 89 
                    THEN 'Alerta Media' 
                    ELSE 'Alerta Baja' 
            END 
    WHEN TO_INTEGER(icf1."ZZ_TIPO_ICFES") = 3 
        THEN 
            CASE
                WHEN icf1."ZZ_MATEMATICAS" <= 30 
                    THEN 'Alerta Alta' 
                WHEN icf1."ZZ_MATEMATICAS" <= 70 
                    THEN 'Alerta Media' 
                    ELSE 'Alerta Baja' 
            END 
    WHEN TO_INTEGER(icf1."ZZ_TIPO_ICFES") IN (4, 5) 
        THEN 
            CASE
                WHEN icf1."ZZ_MATEMATICAS" <= 59 
                    THEN 'Alerta Alta' 
                WHEN icf1."ZZ_MATEMATICAS" <= 79 
                    THEN 'Alerta Media' 
                    ELSE 'Alerta Baja'
            END 
        ELSE 'No se encuentra Tipo Examen' 
END AS "Alertas_Matematicas",

CASE 
    WHEN icf1."ZZ_TIPO_ICFES" = 1 and icf1."ZZ_LENGUAJE" <= 69 
        THEN 'Alerta Alta' 
    WHEN icf1."ZZ_TIPO_ICFES" = 1 and icf1."ZZ_LENGUAJE" <= 89 
        THEN 'Alerta Media' 
    WHEN icf1."ZZ_TIPO_ICFES" = 1 and icf1."ZZ_LENGUAJE" > 89 
        THEN 'Alerta Baja' 
    WHEN icf1."ZZ_TIPO_ICFES" = 2 and icf1."ZZ_LENGUAJE" <= 69 
        THEN 'Alerta Alta' 
    WHEN icf1."ZZ_TIPO_ICFES" = 2 and icf1."ZZ_LENGUAJE" <= 89 
        THEN 'Alerta Media' 
    WHEN icf1."ZZ_TIPO_ICFES" = 2 and icf1."ZZ_LENGUAJE" > 89 
        THEN 'Alerta Baja' 
    WHEN icf1."ZZ_TIPO_ICFES" = 3 and icf1."ZZ_LENGUAJE" <= 30 
        THEN 'Alerta Alta' 
    WHEN icf1."ZZ_TIPO_ICFES" = 3 and icf1."ZZ_LENGUAJE" <= 70 
        THEN 'Alerta Media' 
    WHEN icf1."ZZ_TIPO_ICFES" = 3 and icf1."ZZ_LENGUAJE" > 70 
        THEN 'Alerta Baja' 
    WHEN icf1."ZZ_TIPO_ICFES" = 4 and icf1."ZZ_LECTURA_CRI" <= 59 
        THEN 'Alerta Alta' 
    WHEN icf1."ZZ_TIPO_ICFES" = 4 and icf1."ZZ_LECTURA_CRI" <= 79 
        THEN 'Alerta Media' 
    WHEN icf1."ZZ_TIPO_ICFES" = 4 and icf1."ZZ_LECTURA_CRI" > 79 
        THEN 'Alerta Baja' 
    WHEN icf1."ZZ_TIPO_ICFES" = 5 and icf1."ZZ_LECTURA_CRI" <= 59 
        THEN 'Alerta Alta' 
    WHEN icf1."ZZ_TIPO_ICFES" = 5 and icf1."ZZ_LECTURA_CRI" <= 79 
        THEN 'Alerta Media' 
    WHEN icf1."ZZ_TIPO_ICFES" = 5 and icf1."ZZ_LECTURA_CRI" > 79 
        THEN 'Alerta Baja' 
        ELSE 'No se encuentra Tipo Examen' 
END AS "Alerta_lenguaje",

CASE
  WHEN c1."ADM_PERID" IN ('012','001') THEN CONCAT(TO_NVARCHAR(c1."KEY_PERYR"), '-01')
  WHEN c1."ADM_PERID" = '002'         THEN CONCAT(TO_NVARCHAR(c1."KEY_PERYR"), '-02')
  ELSE 'Sin periodo' 
END AS "Periodo_Academico_F",


CASE WHEN test."19" = 'LGBTIQ+' THEN 1 ELSE 0 END AS "Conteo_Lgbti",
CASE WHEN fact."Numero de identificacion" is null  then 0 else 1 END AS "Estudiantes_Factores_Salud"






FROM "1_LT_S4_ZBW_SLCM099A3_01" AS c1 
LEFT JOIN "1_LT_S4_ZBW_SLCM099A4_01"  AS c2 
  ON   c1.KEY_CONSECUTIVO = c2.KEY_CONSECUTIVO 
  AND  c1.KEY_CS = c2.KEY_CS 
LEFT JOIN (
    SELECT
    snies1."SNIES",
    snies1."Programas",
    snies1."Tipo Programa",
    snies1."Facultad",
    snies1."Modalidad",
    snies1."Ubicacion",
    snies1."Nivel Formacion",
    snies1."Tipo Programa Global",
    snies1."Descripcion abreviado",
    progr1."HE_PRGRMT",
    progr1."HE_PRGRM" AS "HE_PROGRAMA_PRG"
    FROM  "1_LT_CSV_SNIES_01" AS snies1
        LEFT JOIN "1_0HE_PRGRM" AS progr1 
            ON progr1."HE_SNIES" = snies1."SNIES") AS p1 
    ON p1."HE_PROGRAMA_PRG" = c1."SCOBJID"
LEFT JOIN  "3_LT_DP_MATEST_01" AS mat1 
    ON  mat1."YRSES" = c1."ZYRSP" 
    AND p1."HE_PROGRAMA_PRG" = mat1."PRGRM"
    AND mat1."STUDNT" = c1."PARTNER"
LEFT JOIN (
            SELECT 
            search."9",
            search."14",
            search."49",
            CASE 
                WHEN TO_INTEGER(SUBSTRING("14", 4, 2)) >= 6 
                THEN CONCAT(SUBSTRING("14", 7, 4), '002')
                WHEN TO_INTEGER(SUBSTRING("14", 4, 2)) < 6 
                THEN CONCAT(SUBSTRING("14", 7, 4), '001')
                ELSE 'Sin peridoo academico'
            END AS "PeriodoAca_PhapSearch"
            FROM  "03_LT_AWS_PHAPSEARCH_01" AS search) AS phap1 
   ON phap1."9" = c1."IDNUMBER"
   AND phap1."PeriodoAca_PhapSearch" = c1."ZYRSP"
LEFT JOIN (
     SELECT 
            t."4",
            t."19",
            t."91",
            SUBSTRING("91",0,4) AS "Año_test",
            CASE 
                WHEN TO_INTEGER(SUBSTRING("91",6,2)) BETWEEN 1 AND 6 
                    THEN CONCAT(SUBSTRING("91",0,4), '001')
                ELSE CONCAT(SUBSTRING("91",0,4), '002')
            END AS "PeriodoAcademico_Test"
  FROM "03_LT_AWS_TESTADMISIONES_01" AS t
WHERE TO_INTEGER(SUBSTRING("91", 0, 4)) >= YEAR(CURRENT_DATE) - 1
) AS test
    ON c1."IDNUMBER" = test."4"
    AND c1."ZYRSP" = test."PeriodoAcademico_Test"
LEFT JOIN(
    SELECT 
    f."Periodo Academico",
    f."Numero de identificacion",
    f."CATEGORIA",
    f."Codigo Plan de Estudios" 
    FROM "03_LT_AWS_FACTORESSALUD_01"  AS f 
) AS fact 
ON fact."Periodo Academico" = c1."ZYRSP"
AND fact."Numero de identificacion" = c1."IDNUMBER"
AND fact."Codigo Plan de Estudios"  = p1."HE_PRGRMT"
LEFT JOIN(
    SELECT 
    student."STOBJID",
    student."PARTNER"
    FROM  "1_LT_S4_ZBW_CMACBPST_01" AS student
) AS st1 
ON st1."PARTNER" = c1."PARTNER"
LEFT JOIN (
    SELECT
        ic."OBJID",
        ic."ZZ_TIPO_ICFES",
        ic."ZZ_BIOLOGIA",
        ic."ZZ_CIEN_SOCI",
        ic."ZZ_CIENCIAS",
        ic."ZZ_COMPETENCIAS",
        ic."ZZ_COMPONENTE",
        ic."ZZ_ELECTIVA",
        ic."ZZ_FECHA_ICFES",
        ic."ZZ_FILOSOFIA",
        ic."ZZ_FISICA",
        ic."ZZ_GEOGRAFIA",
        ic."ZZ_GLOBAL",
        ic."ZZ_HISTORIA",
        ic."ZZ_INGLES",
        ic."ZZ_LECTURA_CRI",
        ic."ZZ_LENGUAJE",
        ic."ZZ_MATEMATICAS",
        ic."ZZ_PUESTO",
        ic."ZZ_PUNTAJE",
        ic."ZZ_QUIMICA",
        ic."ZZ_RAZONAMIENTO",
        ic."ZZ_SOCI_CIUDA",
        ic."ZZ_SOCIALES",
        ic."YEAR_ICFES",
        (
        COALESCE(TO_DECIMAL(ic."ZZ_BIOLOGIA",        18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_CIEN_SOCI",       18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_COMPETENCIAS",    18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_COMPONENTE",      18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_ELECTIVA",        18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_FILOSOFIA",       18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_FISICA",          18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_GEOGRAFIA",       18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_HISTORIA",        18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_INGLES",          18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_LECTURA_CRI",     18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_LENGUAJE",        18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_MATEMATICAS",     18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_QUIMICA",         18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_SOCI_CIUDA",      18,2), 0) +
        COALESCE(TO_DECIMAL(ic."ZZ_SOCIALES",        18,2), 0)
        ) / 16 AS "PROM_MATE"
        
    
    FROM "02_LT_DP_ZHE_ICFES_01" AS ic) AS icf1
ON icf1."OBJID" = st1."STOBJID"















