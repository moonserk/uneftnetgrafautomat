SELECT    
          RowNum ROW$$NUMBER,
          substr(event_date,0, 5) event_date,
          FIELD_NAME,
          WELL_NAME,
          PUMP_NAME_DC,
          PUMP_CAPACITY_DC,
          WORKOVER_CLASS_NAME,
          WORKOVER_TYPE_NAME,
          LIQ_RATE_CALC,
          OIL_RATE_CALC,
          WATERING_CALC,
          DYNAM_LEVEL_CALC, 
          LIQ_RATE_MOVE_OUT,
          OIL_RATE_MOVE_OUT,
          WATERING_MOVE_OUT,
          DYNAM_LEVEL_MOVE_OUT,
          COMMENTS,
          EVENT_DATE as dt
     FROM (SELECT ws.field_name,
                  ws.well_name,
                  ws.event_date,
                  NVL ( pump_name ( DECODE (mo.pump_type_id, NULL, mo.pump_name, p.NAME)),DECODE (mo.pump_type_id, NULL, mo.pump_name, p.NAME)) pump_name_dc,
                  NVL ( pump_capacity ( DECODE (mo.pump_type_id, NULL, mo.pump_name, p.NAME)), DECODE (mo.pump_type_id, NULL, NVL (mo.rezerv_s1, mo.pump_capacity), p.capacity)) pump_capacity_dc,
                  wwt.short_name workover_type_name,
                  wwc.short_name workover_class_name,
                  CASE
                     WHEN (wst.event_date IS NOT NULL
                           AND wst.event_date < ADD_MONTHS (TRUNC (sysdate, 'MON'), -1) /* + cds_vars.gettimezone */
                           AND wst.GROUP_ID <> 13
                           AND (SELECT COUNT (sk_1) mcount
                                FROM db_sost ds
                                WHERE wst.WELL_ID = ds.sk_1
                                      AND TO_NUMBER (TO_CHAR (wst.event_date, 'yyyymmdd')) <= ds.dz_1
                                      AND TO_NUMBER (TO_CHAR (TRUNC (sysdate), 'yyyymmdd')) > ds.dz_1
                                      AND 'SS0001' = ss_1) = 0
                           AND (SELECT COUNT (sk_1) mcount
                                FROM db_sost ds
                                WHERE ws.WELL_ID = ds.sk_1
                                      AND ds.DZ_1 < TO_NUMBER (TO_CHAR (ws.event_date, 'yyyymmdd'))
                                      AND TO_NUMBER (TO_CHAR (ws.event_date, 'yyyymmdd')) <= ds.D2_1
                                      AND ss_1 IN
                                              ('SS0007',
                                               'SS0003',
                                               'SS0004',
                                               'SS0005',
                                               'SS0006',
                                               'SS0007',
                                               'SS0008',
                                               'SS0009',
                                               'SS0020',
                                               'SS0024',
                                               'SS0025',
                                               'SS0026',
                                               'SS0027',
                                               'SS0031',
                                               'SS0032')) = 0
                           AND (SELECT COUNT (sk_1) mcount
                                FROM db_fond df
                                WHERE wst.WELL_ID = df.sk_1
                                      AND TO_NUMBER (TO_CHAR (wst.event_date, 'yyyymmdd')) <= df.dz_1
                                      AND TO_NUMBER (TO_CHAR (TRUNC (sysdate), 'yyyymmdd')) > df.dz_1
                                      AND 'XR0011' <> df.xr_1) = 0)
                     THEN
                        2                                                -- ÁÄ
                     ELSE
                        mo.fund_type
                  END
                  fund_type,
                  roundl (mo.liq_rate_calc) liq_rate_calc,
                  mo.watering_calc,
                  roundo (roundl (mo.liq_rate_calc) * (1 - mo.watering_calc / 100) * mo.oil_density_mo) oil_rate_calc, 
                  DECODE (mo.dynam_level_calc, -1, 'ÀÏÂ', dynam_level_calc)
                  dynam_level_calc,
                  mo.pump_freq_calc,
                  /*  ÂÍÐ */
                  roundl (
                     NVL (mo.liq_rate_move_out, NVL (mos2.liquid_rate, mos.liquid_rate))) liq_rate_move_out,
                     NVL (mo.watering_move_out, NVL (mos2.watering, mos.watering)) watering_move_out,
                  roundo (
                       roundl (
                          NVL (mo.liq_rate_move_out, 
                          NVL (mos2.liquid_rate, mos.liquid_rate))) * ( 1  -   NVL (mo.watering_move_out, NVL (mos2.watering, mos.watering)) / 100) * mo.oil_density_mo) oil_rate_move_out,
                  DECODE (NVL (mo.dynam_level_move_out, NVL (mos2.dynam_level, mos.dynam_level)), -1, 'ÀÏÂ', NVL (mo.dynam_level_move_out, NVL (mos2.dynam_level, mos.dynam_level))) dynam_level_move_out,
                  ws.comments
             FROM (SELECT --+ Index(w)
                         ws.watering watering,
                          ws.dynam_level dynam_level,
                          ws.line_pressure line_pressure,
                          ws.buffer_pressure buffer_pressure,
                          ws.casing_pressure casing_pressure,
                          ws.pump_freq pump_freq,
                          ws.current_strength current_strength,
                          ws.injection injection,
                          ws.comments comments,
                          ws.hsp hsp,
                          ws.oil_rate oil_rate,
                          ws.oss_id oss_id,
                          ws.workover_type_id workover_type_id,
                          ws.workover_class_id workover_class_id,
                          ws.increase_liq_calc increase_liq_calc,
                          ws.increase_liq_gtm increase_liq_gtm,
                          ws.rezerv_1 rezerv_1,
                          ws.rezerv_2 rezerv_2,
                          ws.rezerv_3 rezerv_3,
                          ws.rezerv_4 rezerv_4,
                          ws.rezerv_1s rezerv_1s,
                          ws.rezerv_2s rezerv_2s,
                          ws.rezerv_3s rezerv_3s,
                          ws.rezerv_4s rezerv_4s,
                          ws.event_date_next event_date_next,
                          ws.well_category well_category,
                          ws.repair_category repair_category,
                          ws.lock_level lock_level,
                          ws.well_id well_id,
                          ws.event_date event_date,
                          ws.liquid_rate liquid_rate,
                          w.region_id,
                          w.region_name,
                          w.region_full_name,
                          w.ceh_id,
                          w.ceh_name ceh_name,
                          w.field_short_name field_name,
                          w.kust_name kust_name,
                          w.NAME well_name,
                          w.oil_object_id,
                          gzu_id,
                          gzu_name,
                          (SELECT MAX (SE_1)
                             FROM db_spons
                            WHERE     sk_1 = ws.well_id
                                  AND pkg_ois.date2ois (event_date) >= dz_1
                                  AND pkg_ois.date2ois (event_date) < d2_1)
                             SECode,
                          w.BRG_SHORT_NAME,
                          w.Mining_company_ID
                     FROM well_start ws, full_well w
                    WHERE     w.ID(+) = ws.well_id
                         /* AND (   w.ceh_id = cds_vars.getcehid ()
                               OR w.region_id = cds_vars.getregionid ()
                               OR w.Mining_company_ID = cds_vars.GetOAOID
                               OR cds_vars.GetOAOID() = cds_vars.GetOGID()
                               )*/
                          AND ws.event_date < sysdate
                          AND ws.event_date >= to_date(sysdate - (SUBSTR (sysdate - 1, 1, 2)), 'dd.mm.yyyy')) ws,
                  moveout mo,
                  move_out_sheet mos,
                  move_out_sheet mos2,
                  pump_type p,
                  workover_type wwt,
                  workover_class wwc,
                  oil_object o,
                  fund_type ft,
                  operating_stop_start_data ossd,
                  statement_distribute sd,
                  spos_eks sp,
                  well_stop wst,
                  class cl
            WHERE     mo.oss_id(+) = ws.oss_id
                  AND mo.oss_id = mos.oss_id(+)
                  AND mos.property_date(+) <= sysdate
                  AND sysdate < mos.date_next(+)
                  AND mo.oss_id = mos2.oss_id(+)
                  AND mos2.property_date(+) <= sysdate
                  AND sysdate < mos2.property_date_next2(+)
                  AND mos2.metering_type(+) = 2
                  AND p.ID(+) = mo.pump_type_id
                  AND wwt.ID(+) = mo.workover_type_id
                  AND wwc.ID(+) = mo.workover_class_id
                  AND ft.ID(+) = mo.fund_type
                  AND ws.oil_object_id = o.ID(+)
                  AND ossd.oss_id(+) = ws.oss_id
                  AND ws.ceh_id = sd.ceh_id(+)
                  AND   TRUNC (ws.event_date /*- cds_vars.gettimezone*/)
                      /*+ cds_vars.gettimezone*/ = sd.statement_date(+)
                  AND DECODE (sd.form_name(+),
                              'ALL', 1,
                              'WELL_START', 1,
                              NULL)
                         IS NOT NULL
                  AND mo.spos_id = sp.ID(+)
                  AND wst.well_id(+) = mo.well_id
                  AND wst.event_date(+) < mo.event_date
                  AND wst.event_date_next(+) > mo.event_date
                  AND ws.SECode = cl.cd_1(+))
        where event_date like to_date('##.##.####', 'dd.mm.yyyy')
