select
tab1.h1 "ост.скв.п",
round(nvl(tab1.h2,0),1) "ост.д.п",
round(nvl(tab1.h3,0),1) "ост.д.нар",
null,
null,
null,
null,
null,
null,
tab4.n1 "ост.скв.ф",
round(nvl(tab4.n2,0),1) "ост.д.ф",
round(nvl(tab4.n3,0),1) "ост.нар.ф"
from
( /* остановка ПЛАН */
  Select
  count(0)*0 as h0,
  count(gr.name) as h1,
  sum(round(gr.before_oil_rate,1)) as h2,
  sum(round(gr.before_oil_rate *(to_date('##.##.####',  'dd.mm.yyyy') - gr.plan_stop_date+1),1)) as h3
  from gtm_netgraph_full_v gr
  where
  gr.calc_month = trunc(to_date('##.##.####',  'dd.mm.yyyy'),'mm') and
  gr.is_actual = 3 and
  gr.tab_id = 1 and
  gr.variant_type_id = 1 and
  gr.is_manual = 1 and
  gr.workover_type_id in (60) and
  (gr.plan_wo_begin_date between trunc(to_date('##.##.####',  'dd.mm.yyyy'),'mm') and to_date('##.##.####',  'dd.mm.yyyy') or gr.plan_stop_date between trunc(to_date('##.##.####',  'dd.mm.yyyy'),'mm') and to_date('##.##.####',  'dd.mm.yyyy') )and
  gr.is_above_plan = 0
) tab1
left join
( /* остановка ФАКТ */
  Select
  count(0)*0 as n0,
  count(gr.name) as n1,
  sum(gr.before_oil_rate_f) as n2,
  sum(round(gr.before_oil_rate_f *(to_date('##.##.####',  'dd.mm.yyyy') - trunc(gr.fact_stop_date,'dd')+1),1)) as n3
from gtm_netgraph_full_v gr
where
gr.calc_month = trunc(to_date('##.##.####',  'dd.mm.yyyy'),'mm') and
gr.is_actual = 3 and
gr.tab_id = 1 and
gr.variant_type_id = 1 and
gr.workover_type_id in (60) and
trunc(gr.fact_stop_date,'dd') between trunc(to_date('##.##.####',  'dd.mm.yyyy'),'mm') and to_date('##.##.####',  'dd.mm.yyyy')
) tab4
on tab1.h0 = tab4.n0
