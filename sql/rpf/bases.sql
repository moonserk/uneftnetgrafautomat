select
null,
null,
null,
count(v.well_name) as "���",
null,
null,
null,
null,
sum(v.lr_bs) as "������",
null,
sum(v.or_bs) as "������",
null,
null,
null,
null,
null,
sum(v.lrc) as "������",
sum(v.orc) as "������",
sum(v.orc - v.or_bs)  as "�������"
 from 
   ef9.fo_hsod v
where v.DT = to_date('##.##.####',  'dd.mm.yyyy')
and v.state_rem = '���������'
and v.sr_id <> 21
and v.wc_curr_name = '����'
and (Cds_vars.GetregionID() is null or v.region_id = Cds_vars.GetregionID())
