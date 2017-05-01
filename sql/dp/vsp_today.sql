select
nvl(sum(round(v.ol_cds,3)),0) as "Потери"
from FO_HSOD v
where DT = to_date('##.##.####', 'dd.mm.yyyy') and v.REGION_NAME = 'РИТС "Север"'
and v.ol_cds > 0
union all
select
nvl(sum(round(v.ol_cds,3)),0) as "Потери"
from FO_HSOD v
where DT = to_date('##.##.####', 'dd.mm.yyyy') and v.REGION_NAME = 'РИТС "Центр"'
and v.ol_cds > 0
union all
select
nvl(sum(round(v.ol_cds,3)),0) as "Потери"
from FO_HSOD v
where DT = to_date('##.##.####', 'dd.mm.yyyy') and v.REGION_NAME = 'РИТС "Юг"'
and v.ol_cds > 0
