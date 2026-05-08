    SELECT
        BASE."Año",
        BASE."Modalidad",
        BASE."Facultad",
        BASE."Tipo_Formacion",
        BASE."Programa",
        BASE."ACA18",

        /* ACA18 */

        /* =====================================================
        aca18 - CONTEO
        Escala real 0 a 10
        ===================================================== */

        COUNT(CASE WHEN  BASE."ACA18" = '0' THEN 1 END) AS "ACA18_COUNT_0",
        COUNT(CASE WHEN  BASE."ACA18" = '1' THEN 1 END) AS "ACA18_COUNT_1",
        COUNT(CASE WHEN  BASE."ACA18" = '2' THEN 1 END) AS "ACA18_COUNT_2",
        COUNT(CASE WHEN  BASE."ACA18" = '3' THEN 1 END) AS "ACA18_COUNT_3",
        COUNT(CASE WHEN  BASE."ACA18" = '4' THEN 1 END) AS "ACA18_COUNT_4",
        COUNT(CASE WHEN  BASE."ACA18" = '5' THEN 1 END) AS "ACA18_COUNT_5",
        COUNT(CASE WHEN  BASE."ACA18" = '6' THEN 1 END) AS "ACA18_COUNT_6",
        COUNT(CASE WHEN  BASE."ACA18" = '7' THEN 1 END) AS "ACA18_COUNT_7",
        COUNT(CASE WHEN  BASE."ACA18" = '8' THEN 1 END) AS "ACA18_COUNT_8",
        COUNT(CASE WHEN  BASE."ACA18" = '9' THEN 1 END) AS "ACA18_COUNT_9",
        COUNT(CASE WHEN  BASE."ACA18" = '10' THEN 1 END) AS "ACA18_COUNT_10",


        COUNT(
            CASE 
                WHEN BASE."ACA18" IN ('0','1','2','3','4','5','6','7','8','9','10') 
                THEN 1 
            END
        ) AS "ACA18_COUNT_VALIDOS_NPS",

        COUNT(
            CASE 
                WHEN BASE."ACA18" IN ('0','1','2','3','4','5','6') 
                THEN 1 
            END
        ) AS "ACA18_COUNT_DETRACTORES",

        COUNT(
            CASE 
                WHEN BASE."ACA18" IN ('7','8') 
                THEN 1 
            END
        ) AS "ACA18_COUNT_PASIVOS",

        COUNT(
            CASE 
                WHEN BASE."ACA18" IN ('9','10') 
                THEN 1 
            END
        ) AS "ACA18_COUNT_PROMOTORES",


        /* ACA19 */
        COUNT(CASE WHEN  BASE."ACA19" = '0' THEN 1 END) AS "ACA19_COUNT_0",
        COUNT(CASE WHEN  BASE."ACA19" = '1' THEN 1 END) AS "ACA19_COUNT_1",
        COUNT(CASE WHEN  BASE."ACA19" = '2' THEN 1 END) AS "ACA19_COUNT_2",
        COUNT(CASE WHEN  BASE."ACA19" = '3' THEN 1 END) AS "ACA19_COUNT_3",
        COUNT(CASE WHEN  BASE."ACA19" = '4' THEN 1 END) AS "ACA19_COUNT_4",
        COUNT(CASE WHEN  BASE."ACA19" = '5' THEN 1 END) AS "ACA19_COUNT_5",
        COUNT(CASE WHEN  BASE."ACA19" = '6' THEN 1 END) AS "ACA19_COUNT_6",
        COUNT(CASE WHEN  BASE."ACA19" = '7' THEN 1 END) AS "ACA19_COUNT_7",
        COUNT(CASE WHEN  BASE."ACA19" = '8' THEN 1 END) AS "ACA19_COUNT_8",
        COUNT(CASE WHEN  BASE."ACA19" = '9' THEN 1 END) AS "ACA19_COUNT_9",
        COUNT(CASE WHEN  BASE."ACA19" = '10' THEN 1 END) AS "ACA19_COUNT_10",

        COUNT(
            CASE 
                WHEN BASE."ACA19" IN ('0','1','2','3','4','5','6','7','8','9','10') 
                THEN 1 
            END
        ) AS "ACA19_COUNT_VALIDOS_NPS",

        COUNT(
            CASE 
                WHEN BASE."ACA19" IN ('0','1','2','3','4','5','6') 
                THEN 1 
            END
        ) AS "ACA19_COUNT_DETRACTORES",

        COUNT(
            CASE 
                WHEN BASE."ACA19" IN ('7','8') 
                THEN 1 
            END
        ) AS "ACA19_COUNT_PASIVOS",

        COUNT(
            CASE 
                WHEN BASE."ACA19" IN ('9','10') 
                THEN 1 
            END
        ) AS "ACA19_COUNT_PROMOTORES",

        /* =====================================================
        PBX - CONTEO 2024
        Escala real 0 a 10
        ===================================================== */

        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '0' THEN 1 END) AS "PBX_2024_COUNT_0",
        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '1' THEN 1 END) AS "PBX_2024_COUNT_1",
        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '2' THEN 1 END) AS "PBX_2024_COUNT_2",
        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '3' THEN 1 END) AS "PBX_2024_COUNT_3",
        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '4' THEN 1 END) AS "PBX_2024_COUNT_4",
        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '5' THEN 1 END) AS "PBX_2024_COUNT_5",
        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '6' THEN 1 END) AS "PBX_2024_COUNT_6",
        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '7' THEN 1 END) AS "PBX_2024_COUNT_7",
        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '8' THEN 1 END) AS "PBX_2024_COUNT_8",
        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '9' THEN 1 END) AS "PBX_2024_COUNT_9",
        COUNT(CASE WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '10' THEN 1 END) AS "PBX_2024_COUNT_10",

        /* =====================================================
        PBX - TOTAL HOMOLOGADO PARA GRAFICAR 0 A 10
        Histórico 1-5 + 2024 0-10
        ===================================================== */

        /* Histórico 1 se suma al 0 */
        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") < 2024 AND BASE."PBX" = '1' THEN 1
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '0' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_0",

        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '1' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_1",

        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '2' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_2",

        /* Histórico 2 se suma al 3 */
        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") < 2024 AND BASE."PBX" = '2' THEN 1
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '3' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_3",

        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '4' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_4",

        /* Histórico 3 se suma al 5 */
        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") < 2024 AND BASE."PBX" = '3' THEN 1
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '5' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_5",

        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '6' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_6",

        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '7' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_7",

        /* Histórico 4 se suma al 8 */
        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") < 2024 AND BASE."PBX" = '4' THEN 1
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '8' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_8",

        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '9' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_9",

        /* Histórico 5 se suma al 10 */
        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") < 2024 AND BASE."PBX" = '5' THEN 1
                WHEN TO_INTEGER(BASE."Año") = 2024 AND BASE."PBX" = '10' THEN 1
            END
        ) AS "PBX_TOTAL_COUNT_10",



        
        
        /* PBX - válidos homologados */


        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") < 2024
                     AND BASE."PBX" IN ('1','2','3','4','5')
                THEN 1

                WHEN TO_INTEGER(BASE."Año") = 2024
                     AND BASE."PBX" IN ('0','1','2','3','4','5','6','7','8','9','10')
                THEN 1
            END
        ) AS "PBX_COUNT_VALIDOS_NPS",

        /* PBX - detractores homologados */
        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") < 2024
                     AND BASE."PBX" IN ('1','2')
                THEN 1

                WHEN TO_INTEGER(BASE."Año") = 2024
                     AND BASE."PBX" IN ('0','1','2','3','4','5','6')
                THEN 1
            END
        ) AS "PBX_COUNT_DETRACTORES",

        /* PBX - pasivos homologados */
        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") < 2024
                     AND BASE."PBX" = '3'
                THEN 1

                WHEN TO_INTEGER(BASE."Año") = 2024
                     AND BASE."PBX" IN ('7','8')
                THEN 1
            END
        ) AS "PBX_COUNT_PASIVOS",

        /* PBX - promotores homologados */
        COUNT(
            CASE 
                WHEN TO_INTEGER(BASE."Año") < 2024
                     AND BASE."PBX" IN ('4','5')
                THEN 1

                WHEN TO_INTEGER(BASE."Año") = 2024
                     AND BASE."PBX" IN ('9','10')
                THEN 1
            END
        ) AS "PBX_COUNT_PROMOTORES"

    FROM 
    (
        SELECT
            "Año" AS "Año",
            "Modalidad" AS "Modalidad",
            "Facultad" AS "Facultad",
            "Tipo_de_Formacion" AS "Tipo_Formacion",
            "Programa" AS "Programa",
            "ACA18" AS "ACA18",
            "ACA19" AS "ACA19",
            "COM14" AS "PBX"
        FROM "01_LT_AWS_ENCUSATIS2024_02"

        UNION ALL

        SELECT
            "Id_2023" AS "Año",
            "Modalidad" AS "Modalidad",
            NULL AS "Facultad",
            NULL AS "Tipo_Formacion",
            "Programa" AS "Programa",
            "ACA29" AS "ACA18",
            "ACA30" AS "ACA19",
            "COM1" AS "PBX"
        FROM "01_LT_AWS_ENCUSATIS2023_01"

        UNION ALL

        SELECT
            "Año" AS "Año",
            "Metododologia" AS "Modalidad",
            "Facultad" AS "Facultad",
            NULL AS "Tipo_Formacion",
            "Programa" AS "Programa",
            "AC15" AS "ACA18",
            "AC16" AS "ACA19",
            "MC1" AS "PBX"
        FROM "01_LT_AWS_ENCUSATIS2022_01"

        UNION ALL

        SELECT  
            "ID_2021" AS "Año",
            "Metodologia " AS "Modalidad",
            NULL AS "Facultad",
            NULL AS "Tipo_Formacion",
            "Programa " AS "Programa",
            "AC15" AS "ACA18",
            "AC16" AS "ACA19",
            "CC1" AS "PBX"
        FROM "01_LT_AWS_ENCUSATIS2021_01"

        UNION ALL

        SELECT
            "Year" AS "Año",
            NULL AS "Modalidad",
            NULL AS "Facultad",
            NULL AS "Tipo_Formacion",
            NULL AS "Programa",
            NULL AS "ACA18",
            "AC10" AS "ACA19",
            "MC1" AS "PBX"
        FROM "01_LT_AWS_ENCUSATIS2020_01"

        UNION ALL

        SELECT
            "ID_2019" AS "Año",
            "Modalidad" AS "Modalidad",
            NULL AS "Facultad",
            NULL AS "Tipo_Formacion",
            NULL AS "Programa",
            "AC11" AS "ACA18",
            NULL AS "ACA19",
            "GEE26" AS "PBX"
        FROM "01_LT_AWS_ENCUSATIS2019_01"

    ) BASE 

    GROUP BY
        BASE."Año",
        BASE."Modalidad",
        BASE."Facultad",
        BASE."Tipo_Formacion",
        BASE."Programa",
        BASE."ACA18"
    
    ORDER BY
        BASE."Año",
        BASE."Modalidad",
        BASE."Facultad",
        BASE."Tipo_Formacion",
        BASE."Programa",
        BASE."ACA18"

