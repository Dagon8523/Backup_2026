
---------------Participantes_Psicosocial--------------------
CASE 
    WHEN UPPER(COALESCE("TXTMD",'')) LIKE '%PSICOSOCIAL%'
    THEN 1 
    ELSE 0 
END
---------------Participantes_Salud-------------------------

CASE 
    WHEN UPPER(COALESCE("TXTMD",'')) LIKE '%SALUD%'
    THEN 1 
    ELSE 0 
END
------------------Participantes_Gimnasio-------------------
CASE 
    WHEN UPPER(COALESCE("TXTMD",'')) LIKE '%GIMNASIO%'
    THEN 1 
    ELSE 0 
END
----------------Participantes_Juegos----------------
CASE 
    WHEN UPPER(COALESCE("TXTMD",'')) LIKE '%JUEGOS%'
    THEN 1 
    ELSE 0 
END
----------------Participantes_Grupos-----------
CASE 
    WHEN UPPER(COALESCE("TXTMD",'')) LIKE '%GRUPOS%'
    THEN 1 
    ELSE 0 
END
---------------Participantes_Pedaleando----------
CASE 
    WHEN UPPER(COALESCE("TXTMD",'')) LIKE '%PEDAL%'
    THEN 1 
    ELSE 0 
END
----------------Participantes_Promocion-----------
CASE 
    WHEN UPPER(COALESCE("TXTMD",'')) LIKE '%PROMOCI%'
    THEN 1 
    ELSE 0 
END

--------------%_Participación_Psicosocial-------------

[#Participantes_Psicosocial] / ["04_MA_DP_BIENESTAR_011":Matriculados]

--------------%_Participación_Salud-------------------
[#Participantes_Salud] / ["04_MA_DP_BIENESTAR_011":Matriculados ] 

--------------%_Participacion_gimnasio-------------------

[#Participantes_Gimnasio] / ["04_MA_DP_BIENESTAR_011":Matriculados]

--------------%_Participación_Juegos----------------------

[#Participantes_Salon] / ["04_MA_DP_BIENESTAR_011":Matriculados ]

--------------%_Participación_Grupos----------------------

[#Participantes_Grupos] / ["04_MA_DP_BIENESTAR_011":Matriculados]

--------------%_Participación_Pedaleando----------------------

[#Participantes_Pedaleando] / ["04_MA_DP_BIENESTAR_011":Matriculados]

--------------%_Participación_Promoción----------------------

[#Participantes_Promoción] / ["04_MA_DP_BIENESTAR_011":Matriculados] 






















 


