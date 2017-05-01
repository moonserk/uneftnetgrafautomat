select
null,
null,
null,
count(v.well_name) as "скв",
null,
null,
null,
null,
sum(v.lr_bs) as "жидост",
null,
sum(v.or_bs) as "нефост",
null,
null,
null,
null,
null,
sum(v.lrc) as "жидрас",
sum(v.orc) as "нефрас",
sum(v.orc - v.or_bs)  as "прирост"
 from 
   ef9.fo_hsod v
where v.DT = to_date('##.##.####',  'dd.mm.yyyy')
and v.state_rem = 'Ремонтный'
and v.sr_id <> 21
and v.wc_curr_name = 'ТКРС'
and (Cds_vars.GetregionID() is null or v.region_id = Cds_vars.GetregionID())
