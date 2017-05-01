SELECT 
null,
null,
null,
     count(v.well_name) as "номер скважины",
null,
null,
null,
null,
    sum(v.lr_bs) as "Qж до ост-ки",
null,
    sum(round(v.or_bs,1)) as "Qн до ост-ки",
null,
null,
null,
null,
null,
   sum(v.lrc) as "Qж расч."
   , sum(round(v.orc,1)) as "Qн расч."
   , sum(round((v.orc - v.or_bs),1)) as "Прирост"
  from 
   ef9.fo_hsod v
   where v.DT = to_date('22.04.2017',  'dd.mm.yyyy')
   AND v.state_rem = 'Ремонтный'
 AND v.sr_id = 21    /*Код причины остановки*/
 AND v.sr_d_id  in(71,69) 
 AND v.mo_date is null
