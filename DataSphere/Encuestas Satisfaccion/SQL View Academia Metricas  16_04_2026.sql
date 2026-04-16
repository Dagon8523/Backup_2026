SELECT
    BASE."Año"               AS "Año",
    BASE."Modalidad"         AS "Modalidad",
    BASE."Facultad"          AS "Facultad",
    BASE."Tipo_Formacion"    AS "Tipo_Formacion",
    BASE."Programa"          AS "Programa",

    COUNT(*) AS "Registros_Totales",

    /* ACA1 - Plan de estudios */
    SUM(CASE WHEN BASE."ACA1" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA1") ELSE 0 END)
        AS "ACA1_SUM_Plan_Estudios",
    COUNT(CASE WHEN BASE."ACA1" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA1_COUNT_Plan_Estudios",
    COUNT(CASE WHEN BASE."ACA1" = '1' THEN 1 END) AS "ACA1_COUNT_1",
    COUNT(CASE WHEN BASE."ACA1" = '2' THEN 1 END) AS "ACA1_COUNT_2",
    COUNT(CASE WHEN BASE."ACA1" = '3' THEN 1 END) AS "ACA1_COUNT_3",
    COUNT(CASE WHEN BASE."ACA1" = '4' THEN 1 END) AS "ACA1_COUNT_4",
    COUNT(CASE WHEN BASE."ACA1" = '5' THEN 1 END) AS "ACA1_COUNT_5",
    COUNT(CASE WHEN BASE."ACA1" IN ('4','5') THEN 1 END) AS "ACA1_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA1" IN ('1','2') THEN 1 END) AS "ACA1_BTB_COUNT",

    /* ACA2 - Pertinencia conocimientos */
    SUM(CASE WHEN BASE."ACA2" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA2") ELSE 0 END)
        AS "ACA2_SUM_Pertinencia",
    COUNT(CASE WHEN BASE."ACA2" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA2_COUNT_Pertinencia",
    COUNT(CASE WHEN BASE."ACA2" = '1' THEN 1 END) AS "ACA2_COUNT_1",
    COUNT(CASE WHEN BASE."ACA2" = '2' THEN 1 END) AS "ACA2_COUNT_2",
    COUNT(CASE WHEN BASE."ACA2" = '3' THEN 1 END) AS "ACA2_COUNT_3",
    COUNT(CASE WHEN BASE."ACA2" = '4' THEN 1 END) AS "ACA2_COUNT_4",
    COUNT(CASE WHEN BASE."ACA2" = '5' THEN 1 END) AS "ACA2_COUNT_5",
    COUNT(CASE WHEN BASE."ACA2" IN ('4','5') THEN 1 END) AS "ACA2_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA2" IN ('1','2') THEN 1 END) AS "ACA2_BTB_COUNT",

    /* ACA3 - Contribución formación */
    SUM(CASE WHEN BASE."ACA3" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA3") ELSE 0 END)
        AS "ACA3_SUM_Contribucion",
    COUNT(CASE WHEN BASE."ACA3" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA3_COUNT_Contribucion",
    COUNT(CASE WHEN BASE."ACA3" = '1' THEN 1 END) AS "ACA3_COUNT_1",
    COUNT(CASE WHEN BASE."ACA3" = '2' THEN 1 END) AS "ACA3_COUNT_2",
    COUNT(CASE WHEN BASE."ACA3" = '3' THEN 1 END) AS "ACA3_COUNT_3",
    COUNT(CASE WHEN BASE."ACA3" = '4' THEN 1 END) AS "ACA3_COUNT_4",
    COUNT(CASE WHEN BASE."ACA3" = '5' THEN 1 END) AS "ACA3_COUNT_5",
    COUNT(CASE WHEN BASE."ACA3" IN ('4','5') THEN 1 END) AS "ACA3_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA3" IN ('1','2') THEN 1 END) AS "ACA3_BTB_COUNT",

    /* ACA4 - Cumplimiento promesa */
    SUM(CASE WHEN BASE."ACA4" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA4") ELSE 0 END)
        AS "ACA4_SUM_Promesa_Valor",
    COUNT(CASE WHEN BASE."ACA4" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA4_COUNT_Promesa_Valor",
    COUNT(CASE WHEN BASE."ACA4" = '1' THEN 1 END) AS "ACA4_COUNT_1",
    COUNT(CASE WHEN BASE."ACA4" = '2' THEN 1 END) AS "ACA4_COUNT_2",
    COUNT(CASE WHEN BASE."ACA4" = '3' THEN 1 END) AS "ACA4_COUNT_3",
    COUNT(CASE WHEN BASE."ACA4" = '4' THEN 1 END) AS "ACA4_COUNT_4",
    COUNT(CASE WHEN BASE."ACA4" = '5' THEN 1 END) AS "ACA4_COUNT_5",
    COUNT(CASE WHEN BASE."ACA4" IN ('4','5') THEN 1 END) AS "ACA4_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA4" IN ('1','2') THEN 1 END) AS "ACA4_BTB_COUNT",

    /* ACA6 - Conocimiento disciplinar */
    SUM(CASE WHEN BASE."ACA6" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA6") ELSE 0 END)
        AS "ACA6_SUM_Conocimiento_Disciplinar",
    COUNT(CASE WHEN BASE."ACA6" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA6_COUNT_Conocimiento_Disciplinar",
    COUNT(CASE WHEN BASE."ACA6" = '1' THEN 1 END) AS "ACA6_COUNT_1",
    COUNT(CASE WHEN BASE."ACA6" = '2' THEN 1 END) AS "ACA6_COUNT_2",
    COUNT(CASE WHEN BASE."ACA6" = '3' THEN 1 END) AS "ACA6_COUNT_3",
    COUNT(CASE WHEN BASE."ACA6" = '4' THEN 1 END) AS "ACA6_COUNT_4",
    COUNT(CASE WHEN BASE."ACA6" = '5' THEN 1 END) AS "ACA6_COUNT_5",
    COUNT(CASE WHEN BASE."ACA6" IN ('4','5') THEN 1 END) AS "ACA6_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA6" IN ('1','2') THEN 1 END) AS "ACA6_BTB_COUNT",

    /* ACA7 - Competencias docentes */
    SUM(CASE WHEN BASE."ACA7" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA7") ELSE 0 END)
        AS "ACA7_SUM_Competencias_Docentes",
    COUNT(CASE WHEN BASE."ACA7" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA7_COUNT_Competencias_Docentes",
    COUNT(CASE WHEN BASE."ACA7" = '1' THEN 1 END) AS "ACA7_COUNT_1",
    COUNT(CASE WHEN BASE."ACA7" = '2' THEN 1 END) AS "ACA7_COUNT_2",
    COUNT(CASE WHEN BASE."ACA7" = '3' THEN 1 END) AS "ACA7_COUNT_3",
    COUNT(CASE WHEN BASE."ACA7" = '4' THEN 1 END) AS "ACA7_COUNT_4",
    COUNT(CASE WHEN BASE."ACA7" = '5' THEN 1 END) AS "ACA7_COUNT_5",
    COUNT(CASE WHEN BASE."ACA7" IN ('4','5') THEN 1 END) AS "ACA7_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA7" IN ('1','2') THEN 1 END) AS "ACA7_BTB_COUNT",
    

    /* ACA8 - Cumplimiento syllabus */
    SUM(CASE WHEN BASE."ACA8" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA8") ELSE 0 END)
        AS "ACA8_SUM_Cumplimiento_Syllabus",
    COUNT(CASE WHEN BASE."ACA8" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA8_COUNT_Cumplimiento_Syllabus",
    COUNT(CASE WHEN BASE."ACA8" = '1' THEN 1 END) AS "ACA8_COUNT_1",
    COUNT(CASE WHEN BASE."ACA8" = '2' THEN 1 END) AS "ACA8_COUNT_2",
    COUNT(CASE WHEN BASE."ACA8" = '3' THEN 1 END) AS "ACA8_COUNT_3",
    COUNT(CASE WHEN BASE."ACA8" = '4' THEN 1 END) AS "ACA8_COUNT_4",
    COUNT(CASE WHEN BASE."ACA8" = '5' THEN 1 END) AS "ACA8_COUNT_5",
    COUNT(CASE WHEN BASE."ACA8" IN ('4','5') THEN 1 END) AS "ACA8_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA8" IN ('1','2') THEN 1 END) AS "ACA8_BTB_COUNT",
    

    /* ACA9 - Evaluación aprendizaje */
    SUM(CASE WHEN BASE."ACA9" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA9") ELSE 0 END)
        AS "ACA9_SUM_Evaluacion_Aprendizaje",
    COUNT(CASE WHEN BASE."ACA9" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA9_COUNT_Evaluacion_Aprendizaje",
    COUNT(CASE WHEN BASE."ACA9" = '1' THEN 1 END) AS "ACA9_COUNT_1",
    COUNT(CASE WHEN BASE."ACA9" = '2' THEN 1 END) AS "ACA9_COUNT_2",
    COUNT(CASE WHEN BASE."ACA9" = '3' THEN 1 END) AS "ACA9_COUNT_3",
    COUNT(CASE WHEN BASE."ACA9" = '4' THEN 1 END) AS "ACA9_COUNT_4",
    COUNT(CASE WHEN BASE."ACA9" = '5' THEN 1 END) AS "ACA9_COUNT_5",
    COUNT(CASE WHEN BASE."ACA9" IN ('4','5') THEN 1 END) AS "ACA9_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA9" IN ('1','2') THEN 1 END) AS "ACA9_BTB_COUNT",
    

    /* ACA10 - Retroalimentación */
    SUM(CASE WHEN BASE."ACA10" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA10") ELSE 0 END)
        AS "ACA10_SUM_Retroalimentacion",
    COUNT(CASE WHEN BASE."ACA10" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA10_COUNT_Retroalimentacion",
    COUNT(CASE WHEN BASE."ACA10" = '1' THEN 1 END) AS "ACA10_COUNT_1",
    COUNT(CASE WHEN BASE."ACA10" = '2' THEN 1 END) AS "ACA10_COUNT_2",
    COUNT(CASE WHEN BASE."ACA10" = '3' THEN 1 END) AS "ACA10_COUNT_3",
    COUNT(CASE WHEN BASE."ACA10" = '4' THEN 1 END) AS "ACA10_COUNT_4",
    COUNT(CASE WHEN BASE."ACA10" = '5' THEN 1 END) AS "ACA10_COUNT_5",
    COUNT(CASE WHEN BASE."ACA10" IN ('4','5') THEN 1 END) AS "ACA10_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA10" IN ('1','2') THEN 1 END) AS "ACA10_BTB_COUNT",
    

    /* ACA11 - Calidad humana */
    SUM(CASE WHEN BASE."ACA11" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA11") ELSE 0 END)
        AS "ACA11_SUM_Calidad_Humana",
    COUNT(CASE WHEN BASE."ACA11" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA11_COUNT_Calidad_Humana",
    COUNT(CASE WHEN BASE."ACA11" = '1' THEN 1 END) AS "ACA11_COUNT_1",
    COUNT(CASE WHEN BASE."ACA11" = '2' THEN 1 END) AS "ACA11_COUNT_2",
    COUNT(CASE WHEN BASE."ACA11" = '3' THEN 1 END) AS "ACA11_COUNT_3",
    COUNT(CASE WHEN BASE."ACA11" = '4' THEN 1 END) AS "ACA11_COUNT_4",
    COUNT(CASE WHEN BASE."ACA11" = '5' THEN 1 END) AS "ACA11_COUNT_5",
    COUNT(CASE WHEN BASE."ACA11" IN ('4','5') THEN 1 END) AS "ACA11_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA11" IN ('1','2') THEN 1 END) AS "ACA11_BTB_COUNT",

    /* ACA12 - Compromiso */
    SUM(CASE WHEN BASE."ACA12" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA12") ELSE 0 END)
        AS "ACA12_SUM_Compromiso",
    COUNT(CASE WHEN BASE."ACA12" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA12_COUNT_Compromiso",
    COUNT(CASE WHEN BASE."ACA12" = '1' THEN 1 END) AS "ACA12_COUNT_1",
    COUNT(CASE WHEN BASE."ACA12" = '2' THEN 1 END) AS "ACA12_COUNT_2",
    COUNT(CASE WHEN BASE."ACA12" = '3' THEN 1 END) AS "ACA12_COUNT_3",
    COUNT(CASE WHEN BASE."ACA12" = '4' THEN 1 END) AS "ACA12_COUNT_4",
    COUNT(CASE WHEN BASE."ACA12" = '5' THEN 1 END) AS "ACA12_COUNT_5",
    COUNT(CASE WHEN BASE."ACA12" IN ('4','5') THEN 1 END) AS "ACA12_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA12" IN ('1','2') THEN 1 END) AS "ACA12_BTB_COUNT",
    

    /* ACA13 - Manejo tecnológico */
    SUM(CASE WHEN BASE."ACA13" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA13") ELSE 0 END)
        AS "ACA13_SUM_Manejo_Tecnologico",
    COUNT(CASE WHEN BASE."ACA13" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA13_COUNT_Manejo_Tecnologico",
    COUNT(CASE WHEN BASE."ACA13" = '1' THEN 1 END) AS "ACA13_COUNT_1",
    COUNT(CASE WHEN BASE."ACA13" = '2' THEN 1 END) AS "ACA13_COUNT_2",
    COUNT(CASE WHEN BASE."ACA13" = '3' THEN 1 END) AS "ACA13_COUNT_3",
    COUNT(CASE WHEN BASE."ACA13" = '4' THEN 1 END) AS "ACA13_COUNT_4",
    COUNT(CASE WHEN BASE."ACA13" = '5' THEN 1 END) AS "ACA13_COUNT_5",
    COUNT(CASE WHEN BASE."ACA13" IN ('4','5') THEN 1 END) AS "ACA13_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA13" IN ('1','2') THEN 1 END) AS "ACA13_BTB_COUNT",

    /* ACA14 - Decano */
    SUM(CASE WHEN BASE."ACA14" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA14") ELSE 0 END)
        AS "ACA14_SUM_Decano",
    COUNT(CASE WHEN BASE."ACA14" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA14_COUNT_Decano",
    COUNT(CASE WHEN BASE."ACA14" = '1' THEN 1 END) AS "ACA14_COUNT_1",
    COUNT(CASE WHEN BASE."ACA14" = '2' THEN 1 END) AS "ACA14_COUNT_2",
    COUNT(CASE WHEN BASE."ACA14" = '3' THEN 1 END) AS "ACA14_COUNT_3",
    COUNT(CASE WHEN BASE."ACA14" = '4' THEN 1 END) AS "ACA14_COUNT_4",
    COUNT(CASE WHEN BASE."ACA14" = '5' THEN 1 END) AS "ACA14_COUNT_5",
    COUNT(CASE WHEN BASE."ACA14" IN ('4','5') THEN 1 END) AS "ACA14_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA14" IN ('1','2') THEN 1 END) AS "ACA14_BTB_COUNT",

    /* ACA15 - Director programa */
    SUM(CASE WHEN BASE."ACA15" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA15") ELSE 0 END)
        AS "ACA15_SUM_Director_Programa",
    COUNT(CASE WHEN BASE."ACA15" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA15_COUNT_Director_Programa",
    COUNT(CASE WHEN BASE."ACA15" = '1' THEN 1 END) AS "ACA15_COUNT_1",
    COUNT(CASE WHEN BASE."ACA15" = '2' THEN 1 END) AS "ACA15_COUNT_2",
    COUNT(CASE WHEN BASE."ACA15" = '3' THEN 1 END) AS "ACA15_COUNT_3",
    COUNT(CASE WHEN BASE."ACA15" = '4' THEN 1 END) AS "ACA15_COUNT_4",
    COUNT(CASE WHEN BASE."ACA15" = '5' THEN 1 END) AS "ACA15_COUNT_5",
    COUNT(CASE WHEN BASE."ACA15" IN ('4','5') THEN 1 END) AS "ACA15_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA15" IN ('1','2') THEN 1 END) AS "ACA15_BTB_COUNT",

    /* ACA16 - Material VAC */
    SUM(CASE WHEN BASE."ACA16" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA16") ELSE 0 END)
        AS "ACA16_SUM_Material_VAC",
    COUNT(CASE WHEN BASE."ACA16" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA16_COUNT_Material_VAC",
    COUNT(CASE WHEN BASE."ACA16" = '1' THEN 1 END) AS "ACA16_COUNT_1",
    COUNT(CASE WHEN BASE."ACA16" = '2' THEN 1 END) AS "ACA16_COUNT_2",
    COUNT(CASE WHEN BASE."ACA16" = '3' THEN 1 END) AS "ACA16_COUNT_3",
    COUNT(CASE WHEN BASE."ACA16" = '4' THEN 1 END) AS "ACA16_COUNT_4",
    COUNT(CASE WHEN BASE."ACA16" = '5' THEN 1 END) AS "ACA16_COUNT_5",
    COUNT(CASE WHEN BASE."ACA16" IN ('4','5') THEN 1 END) AS "ACA16_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA16" IN ('1','2') THEN 1 END) AS "ACA16_BTB_COUNT",

    /* ACA17 - Asistentes facultad */
    SUM(CASE WHEN BASE."ACA17" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."ACA17") ELSE 0 END)
        AS "ACA17_SUM_Asistentes_Facultad",
    COUNT(CASE WHEN BASE."ACA17" IN ('1','2','3','4','5') THEN 1 END)
        AS "ACA17_COUNT_Asistentes_Facultad",
    COUNT(CASE WHEN BASE."ACA17" = '1' THEN 1 END) AS "ACA17_COUNT_1",
    COUNT(CASE WHEN BASE."ACA17" = '2' THEN 1 END) AS "ACA17_COUNT_2",
    COUNT(CASE WHEN BASE."ACA17" = '3' THEN 1 END) AS "ACA17_COUNT_3",
    COUNT(CASE WHEN BASE."ACA17" = '4' THEN 1 END) AS "ACA17_COUNT_4",
    COUNT(CASE WHEN BASE."ACA17" = '5' THEN 1 END) AS "ACA17_COUNT_5",
    COUNT(CASE WHEN BASE."ACA17" IN ('4','5') THEN 1 END) AS "ACA17_TTB_COUNT",
    COUNT(CASE WHEN BASE."ACA17" IN ('1','2') THEN 1 END) AS "ACA17_BTB_COUNT",


    BASE."ACA5" AS "Conforme al avance de tu programa académico:",
    BASE."ACA20" AS "Cuerpo docente con experiencia profesional",
    
     /* =========================
       NPS 0 - 10
    ========================= */

    /* ACA18 - Recomendar programa académico */
    COUNT(CASE WHEN BASE."ACA18" IN ('0','1','2','3','4','5','6','7','8','9','10') THEN 1 END) AS "ACA18_COUNT_VALIDOS_NPS",
    COUNT(CASE WHEN BASE."ACA18" IN ('0','1','2','3','4','5','6') THEN 1 END) AS "ACA18_COUNT_DETRACTORES",
    COUNT(CASE WHEN BASE."ACA18" IN ('7','8') THEN 1 END) AS "ACA18_COUNT_PASIVOS",
    COUNT(CASE WHEN BASE."ACA18" IN ('9','10') THEN 1 END) AS "ACA18_COUNT_PROMOTORES",

    /* ACA19 - Volver a estudiar en EAN */
    COUNT(CASE WHEN BASE."ACA19" IN ('0','1','2','3','4','5','6','7','8','9','10') THEN 1 END) AS "ACA19_COUNT_VALIDOS_NPS",
    COUNT(CASE WHEN BASE."ACA19" IN ('0','1','2','3','4','5','6') THEN 1 END) AS "ACA19_COUNT_DETRACTORES",
    COUNT(CASE WHEN BASE."ACA19" IN ('7','8') THEN 1 END) AS "ACA19_COUNT_PASIVOS",
    COUNT(CASE WHEN BASE."ACA19" IN ('9','10') THEN 1 END) AS "ACA19_COUNT_PROMOTORES"
    
    

FROM
(
    SELECT
        "Año" AS "Año",
        "Modalidad" AS "Modalidad",
        "Facultad" AS "Facultad",
        "Tipo_de_Formacion" AS "Tipo_Formacion",
        "Programa" AS "Programa",
        "ACA1" AS "ACA1",
        "ACA2" AS "ACA2",
        "ACA3" AS "ACA3",
        "ACA4" AS "ACA4",
        "ACA5" AS "ACA5",
        "ACA6" AS "ACA6",
        "ACA7" AS "ACA7",
        "ACA8" AS "ACA8",
        "ACA9" AS "ACA9",
        "ACA10" AS "ACA10",
        "ACA11" AS "ACA11",
        "ACA12" AS "ACA12",
        "ACA13" AS "ACA13",
        "ACA14" AS "ACA14",
        "ACA15" AS "ACA15",
        "ACA16" AS "ACA16",
        "ACA17" AS "ACA17",
        "ACA18" AS "ACA18",
        "ACA19" AS "ACA19",
        "ACA20" AS "ACA20"
    FROM "01_LT_AWS_ENCUSATIS2024_02"

    UNION ALL

    SELECT
        "Id_2023" AS "Año",
        "Modalidad" AS "Modalidad",
        NULL AS "Facultad",
        NULL AS "Tipo_Formacion",
        "Programa" AS "Programa",
        "ACA1" AS "ACA1",
        "ACA2" AS "ACA2",
        "ACA3" AS "ACA3",
        "ACA4" AS "ACA4",
        "ACA5" AS "ACA5",
        "ACA6" AS "ACA6",
        "ACA7" AS "ACA7",
        "ACA8" AS "ACA8",
        "ACA9" AS "ACA9",
        "ACA10" AS "ACA10",
        "ACA11" AS "ACA11",
        "ACA12" AS "ACA12",
        "ACA13" AS "ACA13",
        "ACA14" AS "ACA14",
        "ACA15" AS "ACA15",
        "ACA17" AS "ACA16",
        "ACA18" AS "ACA17",
        "ACA29" AS "ACA18",
        "ACA30" AS "ACA19",
        NULL AS "ACA20"
    FROM "01_LT_AWS_ENCUSATIS2023_01"

    UNION ALL

    SELECT
        "Año" AS "Año",
        "Metododologia" AS "Modalidad",
        "Facultad" AS "Facultad",
        NULL AS "Tipo_Formacion",
        "Programa" AS "Programa",
        "AC1" AS "ACA1",
        NULL AS "ACA2",
        NULL AS "ACA3",
        "AC3" AS "ACA4",
        NULL AS "ACA5",
        "AC4" AS "ACA6",
        "AC5" AS "ACA7",
        "AC6" AS "ACA8",
        "AC7" AS "ACA9",
        "AC8" AS "ACA10",
        NULL AS "ACA11",
        NULL AS "ACA12",
        NULL AS "ACA13",
        "AC9" AS "ACA14",
        "AC10" AS "ACA15",
        "AC12" AS "ACA16",
        "AC13" AS "ACA17",
        "AC15" AS "ACA18",
        "AC16" AS "ACA19",
        NULL AS "ACA20"
    FROM "01_LT_AWS_ENCUSATIS2022_01"

    UNION ALL

    SELECT
        "ID_2021" AS "Año",
        "Metodologia " AS "Modalidad",
        NULL AS "Facultad",
        NULL AS "Tipo_Formacion",
        "Programa " AS "Programa",
        "AC1" AS "ACA1",
        NULL AS "ACA2",
        NULL AS "ACA3",
        "AC3" AS "ACA4",
        NULL AS "ACA5",
        "AC4" AS "ACA6",
        "AC5" AS "ACA7",
        "AC6" AS "ACA8",
        "AC7" AS "ACA9",
        "AC8" AS "ACA10",
        NULL AS "ACA11",
        NULL AS "ACA12",
        NULL AS "ACA13",
        "AC9" AS "ACA14",
        "AC10" AS "ACA15",
        "AC11" AS "ACA16",
        "AC12" AS "ACA17",
        "AC15" AS "ACA18",
        "AC16" AS "ACA19",
        NULL AS "ACA20"
    FROM "01_LT_AWS_ENCUSATIS2021_01"

    UNION ALL

    SELECT
        "Year" AS "Año",
        NULL AS "Modalidad",
        NULL AS "Facultad",
        NULL AS "Tipo_Formacion",
        NULL AS "Programa",
        "AC1" AS "ACA1",
        NULL AS "ACA2",
        NULL AS "ACA3",
        "AC2" AS "ACA4",
        NULL AS "ACA5",
        NULL AS "ACA6",
        NULL AS "ACA7",
        NULL AS "ACA8",
        NULL AS "ACA9",
        "AC4" AS "ACA10",
        NULL AS "ACA11",
        NULL AS "ACA12",
        "AC8" AS "ACA13",
        NULL AS "ACA14",
        NULL AS "ACA15",
        "AC7" AS "ACA16",
        "AC6" AS "ACA17",
        NULL AS "ACA18",
        "AC10" AS "ACA19",
        NULL AS "ACA20"
    FROM "01_LT_AWS_ENCUSATIS2020_01"

    UNION ALL

    SELECT
        "ID_2019" AS "Año",
        "Modalidad" AS "Modalidad",
        NULL AS "Facultad",
        NULL AS "Tipo_Formacion",
        NULL AS "Programa",
        "AC1" AS "ACA1",
        NULL AS "ACA2",
        NULL AS "ACA3",
        "AC9" AS "ACA4",
        NULL AS "ACA5",
        NULL AS "ACA6",
        "AC2" AS "ACA7",
        NULL AS "ACA8",
        "AC4" AS "ACA9",
        "AC5" AS "ACA10",
        "AC3" AS "ACA11",
        NULL AS "ACA12",
        NULL AS "ACA13",
        NULL AS "ACA14",
        "AC7" AS "ACA15",
        "AC10" AS "ACA16",
        "AC8" AS "ACA17",
        "AC11" AS "ACA18",
        NULL AS "ACA19",
        NULL AS "ACA20"
    FROM "01_LT_AWS_ENCUSATIS2019_01"
) BASE

GROUP BY
    BASE."Año",
    BASE."Modalidad",
    BASE."Facultad",
    BASE."Tipo_Formacion",
    BASE."Programa",
    BASE."ACA5",
    BASE."ACA20"

ORDER BY
    BASE."Año",
    BASE."Modalidad",
    BASE."Facultad",
    BASE."Tipo_Formacion",
    BASE."Programa",
    BASE."ACA5",
    BASE."ACA20"