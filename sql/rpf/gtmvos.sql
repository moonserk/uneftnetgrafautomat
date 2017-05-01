SELECT
null,
null,
null,
   count(*) WellCount,
   null,
null,
null,
null,
   sum(lr_bs) As "Жидкость до рем",
  null,
   sum(or_bs) As "Нефть до рем.",
  null,
null,
null,
null,
null,
   sum(lrc) As "Расчетная жидкость"
  , sum(orc) As "Расчетная нефть"
  , (sum(nvl(orc, or_bs)) - sum(or_bs)) As "Прирост"
 from 
   ef9.fo_hsod v
where v.DT = to_date('##.##.####',  'dd.mm.yyyy')
  AND  v.state_rem = 'Ремонтный'
  AND  v.sr_id = 21
  AND  v.sr_d_id not in (71,69,60)
  AND (v.r_sost_n = 'ожид.рем' or v.wc_curr_name = 'Ожид.рем.приор')
and (Cds_vars.GetregionID() is null or v.region_id = Cds_vars.GetregionID())
   
