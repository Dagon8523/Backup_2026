SELECT t1."IdOportunidad",
	t1."IDCliente",
	t1."TipoCliente",
	t1."IdentificacionCliente",
	t1."CorreoCliente",
	t1."TelefonoCliente",
	t1."TipoOportunidad",
	t1."Productos_Servicios",
	t1."FuenteVenta",
	t1."DetalleFuenteVenta",
	t1."MedioVenta",
	t1."DetalleMedioVenta",
	t1."fechaCreacion",
	CASE WHEN MONTH(t1."fechaCreacion") < 10 THEN '0' || TO_NVARCHAR(MONTH(t1."fechaCreacion")) ELSE TO_NVARCHAR(MONTH(t1."fechaCreacion")) END AS "Mes",
	t1."estadoOrganizado",
	t1."TipoMedioVenta",
	t1."DetalleMedioVentaF",
	t1."MedioVentaF",
	t1."ANHO_SEM",
	t1."SEM",
	t1."RedFuente",
	t1."FuenteVentaDepurada",
	t1."e_TIPO_ASPIRANTE",
	t1."e_FECHA_DE_MATRICULA",
	t1."e_FECHA_DE_INSCRIPCION",
	t1."e_NUMERO_DE_FACTURA",
	t1."e_ALIADO",
	t1."tipoDeAspirante",
	t1."e_ABREVIATURA_PLAN_DE_ESTUDIOS",
	t1."e_ADD_ANUNCIO",
	t1."e_ADD_MEDIO",
	t1."e_ADD_FUENTE",
	t1."periodoEAN",
	t1."NombreCampana",
	t1."TipoCampana",
	t1."cantidadInteracciones",
	t1."e_PERIODO",
	t1."e_CICLO",
	t1."e_ANO_MATRICULA_SAP",
	t1."e_PERIODO_EJECUCION_WS",
	t1."AgenteComision",
	t1."estadoOportunidad",
	t1."subRazonNombre",
	t1."cantidadInteracciones1",
	t1."RangoHoras1raGestion",
	t1."e_GRADO",
	t1."e_EVENTOS",
	t1."Oportunidades",
	t1."codigoExternoProductos",
	t1."YRSPER",
	t1."Canal",
	t1."Data no cualificada",
	t1."Días Gestión",
	t1."Días primera gestión",
	t1."Matriculados",
	t1."Admitidos",
	t1."Inscritos",
	t1."Pre-Inscritos",
	t1."Proceso Decisión",
	t1."Nuevo Lead",
	t1."En Proceso",
	t1."Aplazada",
	t2."ADM_ENRCATEG",
	t2."ADM_CATEG",
	t2."PARTNER",
	t2."ISTAT",
	t2."ADM_RECPT",
	t2."ZZINI_PROG",
	t2."ZZ_JORNADA",
	t2."BUDAT_MAT",
	CASE WHEN t2."BUDAT_MAT" IS NULL OR TO_DATE('19000101', 'YYYYMMDD') = t2."BUDAT_MAT" THEN 'Pendiente OM' ELSE 'Generada' END AS "Estado OM",
	CASE WHEN t2."HE_CONTA0" >= 1 THEN 1 ELSE 0 END AS "Candidatos",
	t3."TPEST",
	t3."SNIES",
	t3."MATCON",
	t3."MATCONF",
	t3."IMPORMAT",
	t3."IMPORDESC",
	t3."CICLO",
	t3."MODULOS",
	t3."Tipo_Ppto",
	t3."AGENCAV",
	t3."DATEPRIP"
FROM (
		SELECT "IdOportunidad",
			"IDCliente",
			"TipoCliente",
			"IdentificacionCliente",
			"CorreoCliente",
			"TelefonoCliente",
			"TipoOportunidad", 
--"etapaActualOportunidad",

			"Productos_Servicios",
			"FuenteVenta",
			"DetalleFuenteVenta",
			"MedioVenta",
			"DetalleMedioVenta",
			"fechaCreacion",
			"estadoOrganizado",
			"TipoMedioVenta",
			"DetalleMedioVentaF",
			"MedioVentaF",
			"ANHO_SEM",
			"SEM",
			"RedFuente",
			"FuenteVentaDepurada",
			"e_TIPO_ASPIRANTE",
			"e_FECHA_DE_MATRICULA",
			"e_FECHA_DE_INSCRIPCION",
			"e_NUMERO_DE_FACTURA",
			"e_ALIADO",
			"tipoDeAspirante",
			"e_ABREVIATURA_PLAN_DE_ESTUDIOS",
			"e_ADD_ANUNCIO",
			"e_ADD_MEDIO",
			"e_ADD_FUENTE",
			"periodoEAN",
			"NombreCampana",
			"TipoCampana",
			"cantidadInteracciones",
			"e_PERIODO", --periodo académico

			"e_CICLO", --ciclo académico

			"e_ANO_MATRICULA_SAP", --año académico

			"e_PERIODO_EJECUCION_WS",
			"AgenteComision",
			"estadoOportunidad",
			"subRazonNombre",
			"cantidadInteracciones" AS "cantidadInteracciones1",
			"RangoHoras1raGestion",
			"e_GRADO",
			"e_EVENTOS",
			1 AS "Oportunidades",
			CASE WHEN LEFT("codigoExternoProductos", 1) = '2' THEN '0' || "codigoExternoProductos" ELSE '00000000' END AS "codigoExternoProductos",
			CASE WHEN SUBSTRING("fechaCreacion", 6, 2) IN ('04', '05', '06', '07', '08', '09') THEN LEFT("fechaCreacion", 4) || '002' ELSE LEFT("fechaCreacion", 4) || '001' END AS "YRSPER", --Periodos academicos CRM

			CASE WHEN "DetalleFuenteVenta" = 'LINEA INBOUND ZOOM' AND "MedioVenta" = 'MEDIO-VENTA-MARKET' THEN 'LINEA INBOUND' WHEN "DetalleFuenteVenta" = 'LINEA INBOUND ZOOM' AND "MedioVenta" = 'DIG - ORGANICO' THEN 'LINEA INBOUND' WHEN "DetalleFuenteVenta" = 'LINEA INBOUND ZOOM' AND "MedioVenta" = 'MKT - SOCIAL MEDIA' THEN 'LINEA INBOUND' WHEN "DetalleMedioVenta" = 'CAMPUS UNIVERSIDAD' THEN 'SEDE PRINCIPAL' WHEN LEFT("MedioVenta", 3) = 'ATL' THEN 'ATL' WHEN LEFT("MedioVenta", 3) = 'BTL' THEN 'BTL' WHEN "DetalleFuenteVenta" = 'CHAT WHATSAPP' THEN 'CHAT WHATSAPP' WHEN "MedioVenta" = 'DIG - ORGANICO' THEN 'DIG - ORGANICO' WHEN "DetalleMedioVenta" = 'EMAGISTER' THEN 'DIG - PAUTA' WHEN LEFT("DetalleMedioVenta", 8) = 'FACEBOOK' THEN 'DIG - PAUTA' WHEN LEFT("DetalleMedioVenta", 6) = 'GOOGLE' THEN 'DIG - PAUTA' WHEN LEFT("DetalleMedioVenta", 8) = 'LINKEDIN' THEN 'DIG - PAUTA' --ok
WHEN RIGHT("DetalleMedioVenta", 3) = 'WEB' THEN 'DIG - PAUTA' --
WHEN LEFT("DetalleMedioVenta", 3) = 'WEB' THEN 'DIG - PAUTA' --
WHEN LEFT("DetalleMedioVenta", 5) = 'GMAIL' THEN 'DIG - PAUTA' --ok
WHEN LEFT("DetalleMedioVenta", 7) = 'HUBSPOT' THEN 'DIG - PAUTA' --ok
WHEN LEFT("DetalleMedioVenta", 9) = 'INSTAGRAM' THEN 'DIG - PAUTA' --ok
WHEN LEFT("DetalleMedioVenta", 8) = 'YOU TUBE' THEN 'DIG - PAUTA' --ok
WHEN LEFT("DetalleMedioVenta", 6) = 'TIKTOK' THEN 'DIG - PAUTA' --ok
WHEN "DetalleMedioVenta" = 'UNIVERSIA' THEN 'DIG - PAUTA' WHEN "DetalleMedioVenta" = 'ERROR PROCESAMIENTO' THEN 'ERROR PROCESAMIENTO' WHEN "MedioVenta" = 'SIN MEDIO DE VENTA' THEN 'SIN MEDIO DE VENTA' WHEN "MedioVenta" = 'BD - BASES DE DATOS' THEN 'ATL' WHEN "MedioVenta" = 'CORRETAJE' THEN 'CORRETAJE' WHEN "DetalleMedioVenta" = 'SIN DETALLE MEDIO DE VENTA' THEN 'SIN MEDIO DE VENTA' ELSE 'VALIDAR' END AS "Canal",
			CASE WHEN "subRazonNombre" IN ('Nunca solicito información', 'Datos Incorrectos - ilocalizable', 'Datos incorrectos - Ilocalizable', 'No cumple con los requisitos', 'Pensaba que era gratuito', 'Pensaba que era gratuito - Subsidios') THEN 'Si' ELSE 'No' END AS "Data no cualificada",
			CASE WHEN "fechaPrimeraGestion" IS NOT NULL THEN DAYS_BETWEEN("fechaPrimeraGestion", "fechaUltimaGestion") ELSE DAYS_BETWEEN("fechaPrimeraGestion_Backup", "fechaUltimaGestion") END AS "Días Gestión",
			CASE WHEN "fechaPrimeraGestion" IS NOT NULL THEN DAYS_BETWEEN("fechaCreacion", "fechaPrimeraGestion") ELSE DAYS_BETWEEN("fechaCreacion", CURRENT_DATE) END AS "Días primera gestión",
			CASE WHEN "estadoOrganizado" = '6. Matriculado' THEN 1 ELSE 0 END AS "Matriculados",
			CASE WHEN "estadoOrganizado" IN ('6. Matriculado', '5. Admitido') THEN 1 ELSE 0 END AS "Admitidos",
			CASE WHEN "estadoOrganizado" IN ('6. Matriculado', '5. Admitido', '4. Inscrito') THEN 1 ELSE 0 END AS "Inscritos",
			CASE WHEN "estadoOrganizado" IN ('6. Matriculado', '5. Admitido', '4. Inscrito', '3. Pre-Inscrito') THEN 1 ELSE 0 END AS "Pre-Inscritos",
			CASE WHEN "estadoOrganizado" IN ('6. Matriculado', '5. Admitido', '4. Inscrito', '3. Pre-Inscrito', '2. Proceso Decision') THEN 1 ELSE 0 END AS "Proceso Decisión",
			CASE WHEN "estadoOrganizado" IN ('6. Matriculado', '5. Admitido', '4. Inscrito', '3. Pre-Inscrito', '2. Proceso Decision', '1. Nuevo Lead') THEN 1 ELSE 0 END AS "Nuevo Lead",
			CASE WHEN "estadoOportunidad" = 'En Proceso' THEN 1 ELSE 0 END AS "En Proceso",
			CASE WHEN "estadoOportunidad" = 'Aplazada' THEN 1 ELSE 0 END AS "Aplazada"
		FROM "1_LT_CRM_OPORT_01"
	) AS t1
	LEFT JOIN (
		SELECT "ZYRSP",
			"SCOBJID",
			"IDNUMBER",
			"ADM_ENRCATEG",
			"ADM_CATEG",
			"PARTNER",
			"ISTAT",
			"ADM_RECPT",
			"ZZINI_PROG",
			"ZZ_JORNADA",
			"BUDAT_MAT",
			SUM("HE_CONTA0") AS "HE_CONTA0"
		FROM "1_LT_S4_ZBW_SLCM099A3_01"
		GROUP BY "ZYRSP",
			"SCOBJID",
			"IDNUMBER",
			"ADM_ENRCATEG",
			"ADM_CATEG",
			"PARTNER",
			"ISTAT",
			"ADM_RECPT",
			"ZZINI_PROG",
			"ZZ_JORNADA",
			"BUDAT_MAT"
	) AS t2 ON t1."YRSPER" = t2."ZYRSP" AND t1."codigoExternoProductos" = t2."SCOBJID" AND t1."IdentificacionCliente" = t2."IDNUMBER"
	LEFT JOIN (
		SELECT "STUDNT",
			"YRSES",
			"PRGRM",
			"TPEST",
			"SNIES",
			"MATCON",
			"MATCONF",
			"IMPORMAT",
			"IMPORDESC",
			"CICLO",
			"MODULOS",
			"Tipo_Ppto",
			"AGENCAV",
			"DATEPRIP"
		FROM "3_LT_DP_MATEST_01"
		WHERE "HE_TPIND" = '01'
	) AS t3 ON t2."PARTNER" = t3."STUDNT" AND t1."YRSPER" = t3."YRSES" AND t1."codigoExternoProductos" = t3."PRGRM" 
--WHERE "TipoOportunidad" NOT IN ('Educacion Continuada Presencial', 'Educacion Continuada Virtual')


------------------------------------------------------------------
--CONSULTA OPORTUNIDADES AGRUPADA POR IDENTIFICACION ESTUDIANTE
----------------------------------------------------------------- 


SELECT
t."IdentificacionCliente",
t."IDCliente",
t."IdOportunidad",
t."fechaCreacion" AS "Fecha_First_Touch",

 -- Origen del lead
t."FuenteVenta",
t."DetalleFuenteVenta",
t."MedioVenta",
t."DetalleMedioVenta",
t."e_ADD_FUENTE",
t."e_ADD_MEDIO",

-- Contexto negocio
t."TipoOportunidad",
t."estadoOportunidad",
t."estadoCicloVenta",
t."Matriculado",
t."recurrencia",
t."e_NIVEL_EDUCACION",
t."e_NOMBRE_DEL_COLEGIO"






FROM (
SELECT "o"."IdOportunidad","o"."Cliente","o"."IdentificacionCliente","o"."IDCliente","o"."TipoOportunidad","o"."FuenteVenta","o"."DetalleFuenteVenta","o"."MedioVenta","o"."DetalleMedioVenta","o"."recurrencia","o"."fechaCreacion","o"."estadoCicloVenta","o"."estadoOportunidad","o"."countOportunidades","o"."Matriculado","o"."e_ADD_FUENTE","o"."e_ADD_MEDIO","o"."e_NOMBRE_DEL_COLEGIO","o"."e_NIVEL_EDUCACION",
ROW_NUMBER() OVER(
    PARTITION BY o."IdentificacionCliente"
    ORDER BY
     o."fechaCreacion" ASC,
     o."IdOportunidad" ASC
) AS rn 
FROM "3_GV_DP_CRMOPORT_01" o
WHERE o."IdentificacionCliente" IS NOT NULL 
AND o."fechaCreacion"  IS NOT NULL
)t 
WHERE t.rn = 1

