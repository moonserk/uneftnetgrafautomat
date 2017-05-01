select
e.r1 as "���",
e.r2 as "�����",
m.n1 as "������",
m.n2 as "��������"
from 
(
select
k.region_name,
nvl(count(k.well_name),0) AS r1,
nvl(sum(k.or_bs),0) AS r2
from FO_HSOD k
where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(k.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
and k.state_rem = '���������'
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
  and v.state_rem = '���������'
    group by v.region_name
 ) m
on m.region_name = e.region_name
where e.region_name = '���� "�����"'
union all
select
e.r1 as "���",
e.r2 as "�����",
m.n1 as "������",
m.n2 as "��������"
from 
(
select
k.region_name,
nvl(count(k.well_name),0) AS r1,
nvl(sum(k.or_bs),0) AS r2
from FO_HSOD k
where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(k.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
and k.state_rem = '���������'
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
  and v.state_rem = '���������'
    group by v.region_name
 ) m
on m.region_name = e.region_name
where e.region_name = '���� "�����"'
union all
select
e.r1 as "���",
e.r2 as "�����",
m.n1 as "������",
m.n2 as "��������"
from 
(
select
k.region_name,
nvl(count(k.well_name),0) AS r1,
nvl(sum(k.or_bs),0) AS r2
from FO_HSOD k
where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(k.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
and k.state_rem = '���������'
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
  and v.state_rem = '���������'
    group by v.region_name
 ) m
on m.region_name = e.region_name
where e.region_name = '���� "��"'
union all
select
e.r1 as "���",
e.r2 as "�����",
m.n1 as "������",
m.n2 as "��������"
from 
(
select
k.region_name,
nvl(count(k.well_name),0) AS r1,
nvl(sum(k.or_bs),0) AS r2
from FO_HSOD k
where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(k.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
and k.state_rem = '���������'
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
  and v.state_rem = '���������'
    group by v.region_name
 ) m
on m.region_name = e.region_name
where e.region_name = '���� "�������"'
union all
select
e.r1 as "���",
e.r2 as "�����",
m.n1 as "������",
m.n2 as "��������"
from 
(
select
k.region_name,
nvl(count(k.well_name),0) AS r1,
nvl(sum(k.or_bs),0) AS r2
from FO_HSOD k
where DT = to_date('##.##.####', 'dd.mm.yyyy') and trunc(k.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'))
and k.state_rem = '���������'
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
  and v.state_rem = '���������'
    group by v.region_name
 ) m
on m.region_name = e.region_name
where e.region_name = '���� "�������"'
