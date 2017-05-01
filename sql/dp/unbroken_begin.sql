select
nvl(count(v.well_name),0) AS "����������",
nvl(sum(v.or_bs),0) AS "������"
from fo_hist_oil_day v
where v.REGION_NAME = '���� "�����"'
and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm')
and v.state_rem = '���������'
and v.dt between trunc(to_date('##.##.####', 'dd.mm.yyyy')-2,'mm') and trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm')
union all

select
nvl(count(v.well_name),0) AS "����������",
nvl(sum(v.or_bs),0) AS "������"
from fo_hist_oil_day v
where v.REGION_NAME = '���� "�����"'
and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm')
and v.state_rem = '���������'
and v.dt between trunc(to_date('##.##.####', 'dd.mm.yyyy')-2,'mm') and trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') 
union all

select
nvl(count(v.well_name),0) AS "����������",
nvl(sum(v.or_bs),0) AS "������"
from fo_hist_oil_day v
where v.REGION_NAME = '���� "��"'
and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm')
and v.state_rem = '���������'
and v.dt between trunc(to_date('##.##.####', 'dd.mm.yyyy')-2,'mm') and trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm') 
