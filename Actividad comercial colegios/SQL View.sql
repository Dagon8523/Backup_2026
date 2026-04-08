SELECT
-- t1 Tabla de hecho Trabajos Academicos   
    t1."MODREG_ID",
	t1."HECICLO",
	t1."HE_MOD",
	t1."ZZJORN",
	t1."MODULE_OBJECTID",
	t1."EVPACK_OBJECTID",
	t1."EVENT_OBJECTID",
	t1."ACAD_YEARPERID",
	t1."PROGRAM_TYPE",
	t1."PROGRAM_OBJECTID",
	t1."BPARTNER",
	t1."HE_STUDNT",
	t1."AWRATING",
	t1."CHARGEFREE",
	t1."TRANSFERFLAG",
	t1."ANNULMENT",
	t1."COBOK",
	t1."AGRTYPE",
	t1."AGRSTAT",
	t1."SMSTATUS",
	t1."EVENT_OTYPE",
	t1."CPATTEMP",
	t1."CPEARNED",
	t1."CPGRADED",
	t1."CPUNIT",
	t1."GRADE",
	t1."ZHE_GRADSY",
	t1."AGRNOTRATED",
	t1."ZAGRDATE",
	t1."AGRCOMPLETED",
	t1."AGRREMARK",
	t1."ZAGRBEGDA",
	t1."ZAGRENDDA",
	t1."WAITL_BOOKING",
	t1."ZBOOKDATE",
	t1."BOOKREASON",
	t1."ZCANCELDATE",
	t1."CANCELREASON",
	t1."GRADESCALE",
	t1."HE_INSTRC",
	t1."HE_OTINST",
	t1."ZHE_CONTAD",
	t1."HE_EVPADS",
	t1."HE_CONTA0",
	t1."HE_EVPADS_0", 
-- t2 Matriculados

	t2."MATCON",
	t2."MATCONF", 
--t3  Programacion Eventos

	t3."OBJID_SE",
	t3."OBJID_EEL",
	t3."EVDAT",
	t3."BEGUZ",
	t3."ENDUZ", 
-- t4 Ingreso Torniquetes

    t4."Date",
    t4."Check_In_Time",
    t4."Check_Out_Time",
    t4."Doc_Estudiante",
	t4."BPARTNER_STUDENT"
FROM "2_LT_DP_HE_DS010_01" AS t1
	LEFT JOIN (
		SELECT "PRGRM",
			"YRSES",
			"STUDNT",
			"MATCON",
			"MATCONF"
		FROM "3_LT_DP_MATEST_01"
	) AS t2 ON t1."HE_STUDNT" = t2."STUDNT" AND t1."PROGRAM_OBJECTID" = t2."PRGRM" AND t1."ACAD_YEARPERID" = t2."YRSES"
	LEFT JOIN (
		SELECT "EVDAT",
			"BEGUZ",
			"ENDUZ",
			"OBJID_SE",
			"OBJID_EEL"
		FROM "1_LT_S4_ZHE_PROGA_EVENT_01"
	) AS t3 ON t1."EVPACK_OBJECTID" = t3."OBJID_SE" AND t1."EVENT_OBJECTID" = t3."OBJID_EEL"
	LEFT JOIN (
		SELECT 
            t22."Date",
   			t22."Check_In_Time",
    		t22."Check_Out_Time",
    		t22."Doc_Estudiante",
			(SELECT "BPARTNER" FROM "1_LT_DP_0HE_STUDNT_TEXT_01" AS t11 WHERE t11."STUDENT12" =   t22."Doc_Estudiante") AS "BPARTNER_STUDENT"  
		FROM "01_LT_DP_IngresoEstudiantes_01" AS t22
	) AS t4 ON t4."Date" = t3."EVDAT" AND t4."BPARTNER_STUDENT" = t1."BPARTNER"
