select
nvl(sum(round(v.ol_cds,3)),0) as "������"
from FO_HSOD v
where DT = to_date('##.##.####', 'dd.mm.yyyy') and v.REGION_NAME = '���� "�����"'
and v.ol_cds > 0
union all
select
nvl(sum(round(v.ol_cds,3)),0) as "������"
from FO_HSOD v
where DT = to_date('##.##.####', 'dd.mm.yyyy') and v.REGION_NAME = '���� "�����"'
and v.ol_cds > 0
union all
select
nvl(sum(round(v.ol_cds,3)),0) as "������"
from FO_HSOD v
where DT = to_date('##.##.####', 'dd.mm.yyyy') and v.REGION_NAME = '���� "��"'
and v.ol_cds > 0
