SELECT
null,
null,
null,
   count(*) WellCount,
   null,
null,
null,
null,
   sum(lr_bs) As "�������� �� ���",
  null,
   sum(or_bs) As "����� �� ���.",
  null,
null,
null,
null,
null,
   sum(lrc) As "��������� ��������"
  , sum(orc) As "��������� �����"
  , (sum(nvl(orc, or_bs)) - sum(or_bs)) As "�������"
 from 
   ef9.fo_hsod v
where v.DT = to_date('##.##.####',  'dd.mm.yyyy')
  AND  v.state_rem = '���������'
  AND  v.sr_id = 21
  AND  v.sr_d_id not in (71,69,60)
  AND (v.r_sost_n = '����.���' or v.wc_curr_name = '����.���.�����')
and (Cds_vars.GetregionID() is null or v.region_id = Cds_vars.GetregionID())
   
