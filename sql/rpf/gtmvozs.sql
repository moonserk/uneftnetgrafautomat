SELECT 
null,
null,
null,
     count(v.well_name) as "����� ��������",
null,
null,
null,
null,
    sum(v.lr_bs) as "Q� �� ���-��",
null,
    sum(round(v.or_bs,1)) as "Q� �� ���-��",
null,
null,
null,
null,
null,
   sum(v.lrc) as "Q� ����."
   , sum(round(v.orc,1)) as "Q� ����."
   , sum(round((v.orc - v.or_bs),1)) as "�������"
  from 
   ef9.fo_hsod v
   where v.DT = to_date('22.04.2017',  'dd.mm.yyyy')
   AND v.state_rem = '���������'
 AND v.sr_id = 21    /*��� ������� ���������*/
 AND v.sr_d_id  in(71,69) 
 AND v.mo_date is null
