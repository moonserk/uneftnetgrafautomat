select
Rownum as "Номер строки",
all_well.*
from(
select
 mo_well.*
 , mo_params.liq_rate_move_out
 , mo_params.oil_rate_move_out
 , mo_params.watering_move_out
 , mo_params.dynam_level_move_out
from
 (select
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
   , v.lr_mvc as "Qж расч."
   , round(v.or_mvc,1) as "Qн расч."
   , round((v.or_mvc - v.or_bs),1) as "Прирост"
   , v.r_comment as "комментарий"
   , (trunc(to_date('26.04.2017',  'dd.mm.yyyy')) - trunc(v.stop_date)) as "Дн. в простое"
   , (trunc(to_date('26.04.2017',  'dd.mm.yyyy')) - trunc(v.mo_date)) as "Дн. в кат."
   , v.wt_req_name as "вид гтм"
   , v.well_id well_id
   , v.mo_date mo_date
  from 
   ef9.fo_hsod v
where v.DT = to_date('26.04.2017',  'dd.mm.yyyy')
and   v.state_rem in ('Ремонтный', 'Работ.', 'Пер. ППД')
   and v.wc_req_id = 2
 and v.wc_curr_name = 'ВНР'
and (Cds_vars.GetregionID() is null or v.region_id = Cds_vars.GetregionID())
 Order by v.mo_date asc  ) mo_well
  inner join (select
    f_m.well_id well_id
    , f_m.event_date mo_date
    , round(f_m.liq_rate_move_out) liq_rate_move_out
    , round(f_m.oil_rate_move_out, 1) oil_rate_move_out
    , round(f_m.watering_move_out) watering_move_out
    , f_m.dynam_level_move_out dynam_level_move_out
   from 
    frm_moveout f_m
   where
    f_m.well_status_type_id = -1) mo_params
   on mo_params.well_id = mo_well.well_id and trunc(mo_params.mo_date) = trunc(mo_well.mo_date) 
) all_well
