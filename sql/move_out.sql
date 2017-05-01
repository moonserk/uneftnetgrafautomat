SELECT 
          ROWNUM ROW$$NUMBER,
          substr(event_date,0, 5) event_date,
          "FIELD_NAME",
          "WELL_NAME",
          
          "PUMP_NAME_DC",
          "PUMP_CAPACITY_DC",
          
          "WORKOVER_CLASS_NAME",
          "WORKOVER_TYPE_NAME",
          
          "LIQ_RATE_CALC",
          "OIL_RATE_CALC",
          "WATERING_CALC",
          "DYNAM_LEVEL_CALC",

          "COUNT_DAYS_MO",
          
          "LIQ_RATE_MOVE_OUT",
          "OIL_RATE_MOVE_OUT",
          "WATERING_MOVE_OUT",
          "DYNAM_LEVEL_MOVE_OUT",
          EVENT_DATE as dt   
     FROM frm_moveout_united
     WHERE event_date < to_date('##.##.####', 'dd.mm.yyyy') AND start_date >= to_date('##.##.####', 'dd.mm.yyyy')
