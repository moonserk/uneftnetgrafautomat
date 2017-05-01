select
nvl(sum(v.ol_cds),0) as "������"
from fo_hist_oil_day v
where v.REGION_NAME = '���� "�����"'
and v.ol_cds > 0
and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm')
and v.dt between trunc(to_date('##.##.####', 'dd.mm.yyyy')-1,'mm') and trunc(to_date('##.##.####', 'dd.mm.yyyy')+1,'mm')
union all

select
nvl(sum(v.ol_cds),0) as "������"
from fo_hist_oil_day v
where v.REGION_NAME = '���� "�����"'
and v.ol_cds > 0
and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm')
and v.dt between trunc(to_date('##.##.####', 'dd.mm.yyyy')-1,'mm') and trunc(to_date('##.##.####', 'dd.mm.yyyy')+1,'mm')
union all

select
nvl(sum(v.ol_cds),0) as "������"
from fo_hist_oil_day v
where v.REGION_NAME = '���� "��"'
and v.ol_cds > 0
and trunc(v.dt) = trunc(to_date('##.##.####', 'dd.mm.yyyy'),'mm')
and v.dt between trunc(to_date('##.##.####', 'dd.mm.yyyy')-1,'mm') and trunc(to_date('##.##.####', 'dd.mm.yyyy')+1,'mm')
