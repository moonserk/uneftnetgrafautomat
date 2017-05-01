Select
Rownum as "Номер",
n.*
from(
select
 v.region_name As "НГДУ",
 v.field_name As "местор",
 v.well_name As "скв",
 v.kust_name As "куст",
 v.pump_type_cr As "насос",
 v.pump_capacity_bs As "тип",
 v.pump_lift_bs As "глубина",
 v.lr_bs As "Жост",
 v.w_bs As "ОБВост",
 v.or_bs As "Ност",
 v.dl_bs As "Нд",
 v.stop_date As "датаост",
 v.sr_name As "Причина",
 v.mrp As "мрп",
 '' as "пробел",
 v.lrc As "Жрасч",
 v.orc As "Нрасч",
 nvl(v.orc, v.or_bs) - v.or_bs As "Прирост",
 case 
  when v.r_comment is not null then v.r_comment
  else v.remark
 end "пробел1",
 /*tr.coment as "пробел1",*/
 trunc(to_date('##.##.####',  'dd.mm.yyyy')) - trunc(v.stop_date) As "Днейпростой"
 from 
   ef9.fo_hsod v
where v.DT = to_date('##.##.####',  'dd.mm.yyyy')
and v.state_rem = 'Ремонтный'
  and v.sr_id <> 21
  and v.wc_curr_name in ('Ожид.рем.приор', 'Ожид.рем.не приор.','Ожид.доп.мер.')
    and v.sr_name not in ('Неиспр. ФА','РНО','Сез. конс.','ОРД','В/О','Огран.зак.','Сниж. Pпл','Порыв','по ТБ','замор.','Отсут. МТР','Исслед.','Прор. газа','В/О (нерент.)','Прор. пара','Огр.добычи (техн)')
and (Cds_vars.GetregionID() is null or v.region_id = Cds_vars.GetregionID())
    order by v.stop_date asc) n
