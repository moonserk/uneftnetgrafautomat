select
    ROWNUM ROW$$NUMBER, tt.* FROM
(SELECT  
    substr(f_m.event_date,0, 5),
    f_m.Field_name,  
    f_m.Oil_object_name,
    trim(f_m.Well_name) Well_name,
    f_m.Kust_name,
    f_m.Pump_Name_DC,
    f_m.Pump_capacity_DC,
    f_m.Stop_reason_name,        
    ROUND(f_m.Liquid_rate_tr), 
    ROUND(f_m.Oil_rate_tr,1),  
    f_m.Watering_tr,
    f_m.DYNAM_LEVEL_TR_STR,
    ROUNDl(f_m.Liquid_rate),                
    ROUNDo(f_m.Oil_rate),
    f_m.Watering,
    f_m.Dynam_level,
    f_m.Casing_pressure,
    f_m.MRP
FROM 
    FRM_WELL_STOP f_m
WHERE 
    NVL(f_m.stop_reason_type_id,0) <> 13  AND (f_m.event_date >= to_date('##.##.####', 'dd-mm-yyyy') and f_m.event_date < to_date('##.##.####', 'dd-mm-yyyy')) AND
    f_m.Stop_reason_name <> 'ÃÒÌ' AND f_m.Oil_rate >= 7
ORDER BY
    f_m.Event_date
    , f_m.CEH_NAME
    , f_m.KUST_NAME
    , f_m.WELL_NAME ) tt
