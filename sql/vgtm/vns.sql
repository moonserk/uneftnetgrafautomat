select
tab1.h1 "ост.скв.п",
round(nvl(tab1.h2,0),1) "ост.д.п",
round(nvl(tab1.h3,0),1) "ост.д.нар",
tab2.p1 "внр.скв.п",
round(nvl(tab2.p2,0),1) "внр.д.п",
tab3.t1 "зап.скв.п",
round(nvl(tab3.t2,0),1) "зап.д.п",
round(nvl(tab3.t3,0),1) "зап.прир.п",
round(nvl(tab3.t4,0),1) "зап.нар.п",
tab4.n1 "ост.скв.ф",
round(nvl(tab4.n2,0),1) "ост.д.ф",
round(nvl(tab4.n3,0),1) "ост.нар.ф",
tab5.m1 "ок.рем.скв.ф",
round(nvl(tab5.m2,0),1) "ок.рем.д.ф",
tab6.r1 "внр.скв.ф",
round(nvl(tab6.r2,0),1) "внр.д.ф",
tab7.w1 "зап.скв.ф",
round(nvl(tab7.w2,0),1) "зап.д.ф",
round(nvl(tab7.w3,0),1) "зап.прир.ф",
round(nvl(tab7.w4,0),1) "зап.нар.ф"
from
( /* остановка ПЛАН */
  Select
  count(0)*0 as h0,
  count(gr.name) as h1,
  sum(round(gr.before_oil_rate,1)) as h2,
  sum(round(gr.before_oil_rate *(to_date('##.##.####', 'dd.mm.yyyy') - gr.plan_stop_date+1),1)) as h3
  from gtm_netgraph_full_v gr
  where
  gr.calc_month = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and
  gr.is_actual = 3 and
  gr.tab_id = 1 and
  gr.variant_type_id = 1 and
  gr.is_manual = 1 and
  gr.workover_type_id in (34,138) and
  gr.plan_stop_date between trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and to_date('##.##.####', 'dd.mm.yyyy') and
  gr.is_above_plan = 0
) tab1
left join
( /* кнопочный запуск ПЛАН */
  Select
  count(0)*0 as p0,
  count(gr.name) as p1,
  sum(round(gr.after_oil_rate_p,1)) as p2
  from gtm_netgraph_full_v gr
  where
  gr.calc_month = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and
  gr.is_actual = 3 and
  gr.tab_id = 1 and
  gr.variant_type_id = 1 and
  gr.is_manual = 1 and
  gr.workover_type_id in (34,138) and
  gr.plan_wo_end_date between trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and to_date('##.##.####', 'dd.mm.yyyy') and
  gr.is_above_plan = 0
) tab2
on tab1.h0 = tab2.p0
left join
( /* ввод в эксплуатацию ПЛАН */
  Select
  count(0)*0 as t0,
  count(gr.name) as t1,
  sum(gr.after_oil_rate_p) as t2,
  sum(gr.oil_rate_inc_p) as t3,
  sum((trunc(to_date('##.##.####', 'dd.mm.yyyy'),'dd')-trunc(gr.plan_moveout_date,'dd')+1)*gr.after_oil_rate_p) as t4
  from gtm_netgraph_full_v gr
  where
  gr.calc_month = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and
  gr.is_actual = 3 and
  gr.tab_id = 1 and
  gr.variant_type_id = 1 and
  gr.is_manual = 1 and
  gr.workover_type_id in (34,138) and
  gr.plan_moveout_date between trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and to_date('##.##.####', 'dd.mm.yyyy') and
  gr.is_above_plan = 0
) tab3
on tab1.h0 = tab3.t0
left join
( /* остановка ФАКТ */
  Select
  count(0)*0 as n0,
  count(gr.name) as n1,
  sum(gr.before_oil_rate_f) as n2,
  sum(round(gr.before_oil_rate_f *(to_date('##.##.####', 'dd.mm.yyyy') - trunc(gr.fact_stop_date,'dd')+1),1)) as n3
from gtm_netgraph_full_v gr
where
gr.calc_month = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and
gr.is_actual = 3 and
gr.tab_id = 1 and
gr.variant_type_id = 1 and
gr.workover_type_id in (34,138) and
trunc(gr.fact_stop_date,'dd') between trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and to_date('##.##.####', 'dd.mm.yyyy')
) tab4
on tab1.h0 = tab4.n0
left join
( /* окончание ремонта ФАКТ */
  Select
  count(0)*0 as m0,
  count(gr.name) as m1,
  sum(round(gr.after_oil_rate_p,1)) as m2
  from gtm_netgraph_full_v gr
  where
  gr.calc_month = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and
  gr.is_actual = 3 and
  gr.tab_id = 1 and
  gr.variant_type_id = 1 and
  gr.workover_type_id in (34,138) and
  gr.fact_wo_end_date between trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and to_date('##.##.####', 'dd.mm.yyyy')
) tab5
on tab1.h0 = tab5.m0
left join
( /* кнопочный запуск ФАКТ */
  Select
  count(0)*0 as r0,
  count(gr.name) as r1,
  sum(round(t.or_mvc,1)) as r2
  from gtm_netgraph_full_v gr
  inner join fo_hist_oil_day t on t.well_id=gr.well_id
  where
  t.dt= trunc(to_date('##.##.####', 'dd.mm.yyyy')) and
  gr.calc_month = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and
  gr.is_actual = 3 and
  gr.tab_id = 1 and
  gr.variant_type_id = 1 and
  gr.workover_type_id in (34,138) and
  trunc(gr.fact_mo_begin_date,'dd') between trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and to_date('##.##.####', 'dd.mm.yyyy')
) tab6
on tab1.h0 = tab6.r0
left join
( /* ввод в эксплуатацию ФАКТ */
  Select
  count(0)*0 as w0,
  count(gr.name) as w1,
  sum(round(gr.after_oil_rate_f,1)) as w2,
  sum(
  case
  when gr.before_oil_rate_f is null
  then gr.after_oil_rate_f
  else gr.after_oil_rate_f - gr.before_oil_rate_f
  end) as w3,
 sum((trunc(to_date('##.##.####', 'dd.mm.yyyy'),'dd')-trunc(gr.fact_moveout_date,'dd')+1)*gr.after_oil_rate_f) as w4
  from gtm_netgraph_full_v gr
  where
  gr.calc_month = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') and
  gr.is_actual = 3 and
  gr.tab_id = 1 and
  gr.variant_type_id = 1 and
  gr.workover_type_id in (34,138) and
  trunc(gr.fact_moveout_date,'dd') <= to_date('##.##.####', 'dd.mm.yyyy')
) tab7
on tab1.h0 = tab7.w0
