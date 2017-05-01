SELECT
 Rownum as "Номер"
, t.*
FROM ( SELECT 
      
  v.region_name as "НГДУ"
   , v.field_name as "месторождение"
   , v.kust_name as "куст"
   , v.well_name as "номер скважины"
   , v.pump_type_cr as "насос до ост-ки"
   , v.pump_capacity_bs as "пр-ть насоса до ост-ки"
   , v.pump_lift_bs as "напор насоса до ост-ки"
   , v.lr_bs as "Qж до ост-ки"
   , v.w_bs as "Обв. до ост-ки"
   , round(v.or_bs,1) as "Qн до ост-ки"
   , v.dl_bs as "Hд до ост-ки"
   , v.stop_date as "Дата ост-ки"
   , v.sr_name as "Причина отс-ки"
   , v.mrp as "Наработка на отказ"
   , v.sr_d_name as "мероприятие"
   , v.lrc as "Qж расч."
   , round(v.orc,1) as "Qн расч."
   , round((v.orc - v.or_bs),1) as "Прирост"
   , v.r_comment as "комментарий"   /*Из Реестра ТКРС*/
   , (trunc(to_date('22.04.2017',  'dd.mm.yyyy')) - trunc(v.stop_date)) as "Дн. в простое"
   , (trunc(to_date('22.04.2017',  'dd.mm.yyyy')) - trunc(v.mo_date)) as "Дн. в кат."
   , v.wt_req_name as "вид гтм"
   , v.well_id well_id
   , v.mo_date mo_date
  , v.stop_date stop_date
  , v.state_curr state_curr
  , v.state_rem
  , v.sr_id  /*Код причины остановки*/
  , v.sr_d_id
  , v.r_sost_n 
  , v.wc_curr_name 
   from 
   ef9.fo_hsod v
   where v.DT = to_date('22.04.2017',  'dd.mm.yyyy')) t
WHERE
    t.state_rem = 'Ремонтный'
 AND t.sr_id = 21    /*Код причины остановки*/
 AND t.sr_d_id not in(71,69,60)  
 AND (t.r_sost_n = 'ожид.рем' or t.wc_curr_name = 'Ожид.рем.приор')
