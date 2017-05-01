select
e.r1 as "скв",
e.r2 as "дебит",
m.n1 as "скв√“ћ",
m.n2 as "дебит√“ћ"
from 
(
select
k.region_name,
nvl(count(k.well_name),0) AS r1,
nvl(sum(k.or_bs),0) AS r2
from FO_HSOD k
where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(k.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
and k.state_rem = '–емонтный'
group by k.region_name
) e
 inner join
 (
  select
    v.region_name,
  nvl(count(v.well_name),0) AS n1,
  nvl(sum(v.or_bs),0) AS n2
  from FO_HSOD v
  where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
    and v.sr_id = 21
  and v.state_rem = '–емонтный'
    group by v.region_name
 ) m
on m.region_name = e.region_name
where e.region_name = '–»“— "—евер"'
union all
select
e.r1 as "скв",
e.r2 as "дебит",
m.n1 as "скв√“ћ",
m.n2 as "дебит√“ћ"
from 
(
select
k.region_name,
nvl(count(k.well_name),0) AS r1,
nvl(sum(k.or_bs),0) AS r2
from FO_HSOD k
where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(k.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
and k.state_rem = '–емонтный'
group by k.region_name
) e
 inner join
 (
  select
    v.region_name,
  nvl(count(v.well_name),0) AS n1,
  nvl(sum(v.or_bs),0) AS n2
  from FO_HSOD v
  where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
    and v.sr_id = 21
  and v.state_rem = '–емонтный'
    group by v.region_name
 ) m
on m.region_name = e.region_name
where e.region_name = '–»“— "÷ентр"'
union all
select
e.r1 as "скв",
e.r2 as "дебит",
m.n1 as "скв√“ћ",
m.n2 as "дебит√“ћ"
from 
(
select
k.region_name,
nvl(count(k.well_name),0) AS r1,
nvl(sum(k.or_bs),0) AS r2
from FO_HSOD k
where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(k.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
and k.state_rem = '–емонтный'
group by k.region_name
) e
 inner join
 (
  select
    v.region_name,
  nvl(count(v.well_name),0) AS n1,
  nvl(sum(v.or_bs),0) AS n2
  from FO_HSOD v
  where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
    and v.sr_id = 21
  and v.state_rem = '–емонтный'
    group by v.region_name
 ) m
on m.region_name = e.region_name
where e.region_name = '–»“— "ёг"'
union all
select
e.r1 as "скв",
e.r2 as "дебит",
m.n1 as "скв√“ћ",
m.n2 as "дебит√“ћ"
from 
(
select
k.region_name,
nvl(count(k.well_name),0) AS r1,
nvl(sum(k.or_bs),0) AS r2
from FO_HSOD k
where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(k.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
and k.state_rem = '–емонтный'
group by k.region_name
) e
 inner join
 (
  select
    v.region_name,
  nvl(count(v.well_name),0) AS n1,
  nvl(sum(v.or_bs),0) AS n2
  from FO_HSOD v
  where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
    and v.sr_id = 21
  and v.state_rem = '–емонтный'
    group by v.region_name
 ) m
on m.region_name = e.region_name
where e.region_name = 'Ќ√ƒ” "—арапул"'
union all
select
e.r1 as "скв",
e.r2 as "дебит",
m.n1 as "скв√“ћ",
m.n2 as "дебит√“ћ"
from 
(
select
k.region_name,
nvl(count(k.well_name),0) AS r1,
nvl(sum(k.or_bs),0) AS r2
from FO_HSOD k
where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(k.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
and k.state_rem = '–емонтный'
group by k.region_name
) e
 inner join
 (
  select
    v.region_name,
  nvl(count(v.well_name),0) AS n1,
  nvl(sum(v.or_bs),0) AS n2
  from FO_HSOD v
  where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
    and v.sr_id = 21
  and v.state_rem = '–емонтный'
    group by v.region_name
 ) m
on m.region_name = e.region_name
where e.region_name = 'Ќ√ƒ” "√ремиха"'
