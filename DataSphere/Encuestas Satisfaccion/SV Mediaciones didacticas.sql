SELECT
    BASE."Año"               AS "Año",
    BASE."Programa"          AS "Programa",
	BASE."Documento_identidad" AS "Documento_identidad",
	BASE."Facultad" ,

    COUNT(*) AS "Registros_Totales",

    /*"Atención Ean a tu lado"*/
    SUM(CASE WHEN BASE."Atención Ean a tu lado" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."Atención Ean a tu lado") ELSE 0 END)
        AS "Atención Ean a tu lado_SUM",
    COUNT(CASE WHEN BASE."Atención Ean a tu lado" IN ('1','2','3','4','5') THEN 1 END)
        AS "Atención Ean a tu lado_COUNT",
    COUNT(CASE WHEN BASE."Atención Ean a tu lado" = '1' THEN 1 END) AS "Atención Ean a tu lado_COUNT_1",
    COUNT(CASE WHEN BASE."Atención Ean a tu lado" = '2' THEN 1 END) AS "Atención Ean a tu lado_COUNT_2",
    COUNT(CASE WHEN BASE."Atención Ean a tu lado" = '3' THEN 1 END) AS "Atención Ean a tu lado_COUNT_3",
    COUNT(CASE WHEN BASE."Atención Ean a tu lado" = '4' THEN 1 END) AS "Atención Ean a tu lado_COUNT_4",
    COUNT(CASE WHEN BASE."Atención Ean a tu lado" = '5' THEN 1 END) AS "Atención Ean a tu lado_COUNT_5",
    COUNT(CASE WHEN BASE."Atención Ean a tu lado" IN ('4','5') THEN 1 END) AS "Atención Ean a tu lado_TTB_COUNT",
    COUNT(CASE WHEN BASE."Atención Ean a tu lado" IN ('1','2') THEN 1 END) AS "Atención Ean a tu lado_BTB_COUNT",

    /* Meli Turno */
    SUM(CASE WHEN BASE."Meli Turno" IN ('1','2','3','4','5') THEN TO_INTEGER(BASE."Meli Turno") ELSE 0 END)
        AS "Meli Turno_SUM",
    COUNT(CASE WHEN BASE."Meli Turno" IN ('1','2','3','4','5') THEN 1 END)
        AS "Meli Turno_COUNT",
    COUNT(CASE WHEN BASE."Meli Turno" = '1' THEN 1 END) AS "Meli Turno_COUNT_1",
    COUNT(CASE WHEN BASE."Meli Turno" = '2' THEN 1 END) AS "Meli Turno_COUNT_2",
    COUNT(CASE WHEN BASE."Meli Turno" = '3' THEN 1 END) AS "Meli Turno_COUNT_3",
    COUNT(CASE WHEN BASE."Meli Turno" = '4' THEN 1 END) AS "Meli Turno_COUNT_4",
    COUNT(CASE WHEN BASE."Meli Turno" = '5' THEN 1 END) AS "Meli Turno_COUNT_5",
    COUNT(CASE WHEN BASE."Meli Turno" IN ('4','5') THEN 1 END) AS "Meli Turno_TTB_COUNT",
    COUNT(CASE WHEN BASE."Meli Turno" IN ('1','2') THEN 1 END) AS "Meli Turno_BTB_COUNT"

   
FROM
(
    SELECT
    "Año" AS "Año",
    "cedula" As "Documento_identidad",
    "Modalidad" AS "Modalidad",
    "Facultad" AS "Facultad",
    "Tipo_de_Formacion" AS "Tipo_Formacion",
    "Programa" AS "Programa",
    "EXP1_2" As "Meli Turno",
    "EXP2_2" As "Atención Ean a tu lado"

    FROM "01_LT_AWS_ENCUSATIS2024_02"

    UNION ALL


    SELECT
    "Id_2023" As "Año",
    "Para iniciar, por favor indícanos el número de tu documento de identidad:" As "Documento_identidad",
    "Modalidad" As "Modalidad",
    NULL AS "Facultad",
    NULL AS "Tipo_Formacion",
    "Programa" As "Programa",
    NULL As "Meli Turno",
    "EXP42" As "Atención Ean a tu lado"

    FROM "01_LT_AWS_ENCUSATIS2023_01"

    UNION ALL

    SELECT
    "Año" As "Año",
    "Cedula" As "Documento_identidad",
    "Metododologia" As "Modalidad",
    "Facultad" As "Facultad",
    NULL AS "Tipo_Formacion",
    "Programa" As "Programa",
    "MD1" As "Meli Turno",
    "MD2" As "Atención Ean a tu lado"
  
    FROM "01_LT_AWS_ENCUSATIS2022_01"

    UNION ALL

    SELECT
    "ID_2021" As "Año",
    "CC" As "Documento_identidad",
    "Metodologia " As "Modalidad",
    NULL  As "Facultad",
    NULL AS "Tipo_Formacion",
    "Programa " As "Programa",
    "MD1" As "Meli Turno",
    "MD3" As "Atención Ean a tu lado"

    FROM "01_LT_AWS_ENCUSATIS2021_01"


    UNION ALL

    SELECT
    "Year" AS "Año",
    "Cedula" As "Documento_identidad",
    NULL As "Modalidad",
    NULL  As "Facultad",
    NULL AS "Tipo_Formacion",
    NULL As "Programa",
    "MD1" As "Meli Turno",
    "MD3" As "Atención Ean a tu lado"


    FROM "01_LT_AWS_ENCUSATIS2020_01"

    UNION ALL

    SELECT
    "ID_2019" As "Año",
    "cedula" As "Documento_identidad",
    "Modalidad" As "Modalidad",
    NULL  As "Facultad", 
    "Nivel Formacion" As "Tipo_Formacion",
    NULL As "Programa",
    "MD2" As "Meli Turno",
    "MD3" As "Atención Ean a tu lado"

	
    FROM "01_LT_AWS_ENCUSATIS2019_01"
) BASE

GROUP BY
    BASE."Año",
    BASE."Programa",
	BASE."Documento_identidad",
	BASE."Facultad"

ORDER BY
    BASE."Año",
    BASE."Programa",
	BASE."Documento_identidad",
	BASE."Facultad"