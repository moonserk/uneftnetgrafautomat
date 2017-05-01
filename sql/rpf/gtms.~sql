select
null,
null,
null,
count(n.well_name) skv,
null,
null,
null,
null,
sum(n.lr_bs) L_bs,
null,
sum(n.or_bs) O_bs,
null,
null,
null,
null,
null,
sum(n.lrc) Lcalc,
sum(n.orc) Ocalc,
sum(n.inc) inc
from(select
v.region_name,
v.field_name,
v.well_name,
v.kust_name,
v.pump_type_bs,
v.pump_capacity_bs,
v.pump_lift_bs,
v.lr_bs,
v.w_bs,
v.or_bs,
v.dl_bs,
v.stop_date,
v.sr_name,
v.mrp,
v.wt_curr_name,
v.lrc,
v.orc,
v.orc - v.or_bs inc,
v.r_comment,
trunc(to_date('##.##.####',  'dd.mm.yyyy')) - trunc(v.stop_date)+1 sto,
trunc(to_date('##.##.####',  'dd.mm.yyyy')) - trunc(v.wo_start)+1 kateg
 from 
   ef9.fo_hsod v
where v.DT = to_date('##.##.####',  'dd.mm.yyyy')
and v.state_rem = 'Ремонтный'
and v.sr_id = 21
and v.sr_d_id not in (60,71,69)
and v.wo_start is not null
and v.wo_stop is null
and v.r_sost_n = 'рем.'
--and (Cds_vars.GetregionID() is null or v.region_id = Cds_vars.GetregionID())
order by v.stop_date asc) n
