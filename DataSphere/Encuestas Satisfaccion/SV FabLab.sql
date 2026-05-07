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
    "Año" As "Año",
    "cedula" As "cedula",
    "Modalidad" As "Modalidad",
    "Facultad" As "Facultad",
    "Tipo_de_Formacion" As "Tipo de Formación",
    "Programa" As "Programa",
    NULL As "¿Que tan satisfecho te encuentras con la atencion y el servicio por parte del equipo de Assessment Center",
    "FAB1" As "Disponibilidad y funcionamiento de los equipos",
    "FAB2" As "Disponibilidad de materiales y/o reactivos",
    "FAB3" As "Conocimiento FabLab",
    "IMP1" As "Conocimiento servicios Ean Impacta",
    "IMP2" As "Enfoque en el emprendimiento",
    "IMP3" As "Satisfacción atención Ean Impacta",
    "SOS1" As "Influencia emprendimiento sostenible",
    "SOS2" As "Compromiso con la sostenibilidad",
    "SOS3" As "Conocimiento avances sostenibilidad",
    "SOS4" As "Acciones junto a Ean Sostenibilidad",
    "SOS5" As "Visión sostenibilidad EAN"
    

    


    FROM "01_LT_AWS_ENCUSATIS2024_02"

    UNION ALL


    SELECT
    "Id_2023" As "Año",
    "Para iniciar, por favor indícanos el número de tu documento de identidad:" As "cedula",
    "Modalidad" As "Modalidad",
     NULL As "Facultad",
     NULL As "Tipo de Formación",
    "Programa" As "Programa",
    NULL As "¿Que tan satisfecho te encuentras con la atencion y el servicio por parte del equipo de Assessment Center",
    NULL As "Disponibilidad y funcionamiento de los equipos",
    NULL As "Disponibilidad de materiales y/o reactivos",
    "FAB1" As "Conocimiento FabLab",
    "IMP1" As "Conocimiento servicios Ean Impacta",
    "IMP2" As "Enfoque en el emprendimiento",
    "IMP12" As "Satisfacción atención Ean Impacta",
    NULL As "Influencia emprendimiento sostenible",
    NULL As "Compromiso con la sostenibilidad",
    "SOS1" As "Conocimiento avances sostenibilidad",
    "SOS2" As "Acciones junto a Ean Sostenibilidad",
    NULL As "Visión sostenibilidad EAN"



    FROM "01_LT_AWS_ENCUSATIS2023_01"

    UNION ALL

    SELECT
    "Año" As "Año",
    "Cedula" As "cedula",
    "Metododologia" As "Modalidad",
    "Facultad" As "Facultad",
    NULL As "Tipo de Formación",
    "Programa" As "Programa",
    "ASSMC1" As "¿Que tan satisfecho te encuentras con la atencion y el servicio por parte del equipo de Assessment Center",
    "LAB1" As "Disponibilidad y funcionamiento de los equipos",
    "LAB2" As "Disponibilidad de materiales y/o reactivos",
    "LAB5" As "Conocimiento FabLab",
    "EANIMP1" As "Conocimiento servicios Ean Impacta",
    "EANIMP2" As "Enfoque en el emprendimiento",
    "EANIMP10" As "Satisfacción atención Ean Impacta",
    NULL As "Influencia emprendimiento sostenible",
    NULL As "Compromiso con la sostenibilidad",
    NULL As "Conocimiento avances sostenibilidad",
    NULL As "Acciones junto a Ean Sostenibilidad",
    NULL As "Visión sostenibilidad EAN"
    



  
    FROM "01_LT_AWS_ENCUSATIS2022_01"

    UNION ALL

    SELECT
    "ID_2021" As "Año",
    "CC" As "cedula",
    "Metodologia " As "Modalidad",
    NULL As "Facultad",
    NULL As "Tipo de Formación",
    "Programa " As "Programa ",
    NULL As "¿Que tan satisfecho te encuentras con la atencion y el servicio por parte del equipo de Assessment Center",
    NULL As "Disponibilidad y funcionamiento de los equipos",
    NULL As "Disponibilidad de materiales y/o reactivos",
    NULL As "Conocimiento FabLab",
    "IES1" As "Conocimiento servicios Ean Impacta",
    "IES2" As "Enfoque en el emprendimiento",
    NULL As "Satisfacción atención Ean Impacta",
    NULL As "Influencia emprendimiento sostenible",
    NULL As "Compromiso con la sostenibilidad",
    NULL As "Conocimiento avances sostenibilidad",
    NULL As "Acciones junto a Ean Sostenibilidad",
    NULL As "Visión sostenibilidad EAN"
    


 
    FROM "01_LT_AWS_ENCUSATIS2021_01"


    UNION ALL
    
    SELECT
    "Year" As "Año",
    "Cedula" As "cedula",
    NULL As "Modalidad",
    NULL As "Facultad",
    NULL As "Tipo de Formación",
    NULL As "Programa",
    NULL As "¿Que tan satisfecho te encuentras con la atencion y el servicio por parte del equipo de Assessment Center",
    NULL As "Disponibilidad y funcionamiento de los equipos",
    NULL As "Disponibilidad de materiales y/o reactivos",
    NULL As "Conocimiento FabLab",
    "IES1" As "Conocimiento servicios Ean Impacta",
    "IES2" As "Enfoque en el emprendimiento",
    NULL As "Satisfacción atención Ean Impacta",
    NULL As "Influencia emprendimiento sostenible",
    NULL As "Compromiso con la sostenibilidad",
    NULL As "Conocimiento avances sostenibilidad",
    NULL As "Acciones junto a Ean Sostenibilidad",
    NULL As "Visión sostenibilidad EAN"



    FROM "01_LT_AWS_ENCUSATIS2020_01"

    UNION ALL

    SELECT
    "ID_2019" As "Año",
    "cedula" As "cedula",
    "Modalidad" As "Modalidad",
    NULL As "Facultad",
    "Nivel Formacion" As "Tipo de Formación",
    NULL As "Programa",
    NULL As "¿Que tan satisfecho te encuentras con la atencion y el servicio por parte del equipo de Assessment Center",
    NULL As "Disponibilidad y funcionamiento de los equipos",
    NULL As "Disponibilidad de materiales y/o reactivos",
    NULL As "Conocimiento FabLab",
    "IES1" As "Conocimiento servicios Ean Impacta",
    "IES3" As "Enfoque en el emprendimiento",
    "IES4" As "Satisfacción atención Ean Impacta",
    "IES5" As "Influencia emprendimiento sostenible",
    NULL As "Compromiso con la sostenibilidad",
    NULL As "Conocimiento avances sostenibilidad",
    NULL As "Acciones junto a Ean Sostenibilidad",
    NULL As "Visión sostenibilidad EAN"


	
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