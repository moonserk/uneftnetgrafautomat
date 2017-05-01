SELECT
 Rownum as "�����"
, t.*
FROM ( SELECT 
      
  v.region_name as "����"
   , v.field_name as "�������������"
   , v.kust_name as "����"
   , v.well_name as "����� ��������"
   , v.pump_type_cr as "����� �� ���-��"
   , v.pump_capacity_bs as "��-�� ������ �� ���-��"
   , v.pump_lift_bs as "����� ������ �� ���-��"
   , v.lr_bs as "Q� �� ���-��"
   , v.w_bs as "���. �� ���-��"
   , round(v.or_bs,1) as "Q� �� ���-��"
   , v.dl_bs as "H� �� ���-��"
   , v.stop_date as "���� ���-��"
   , v.sr_name as "������� ���-��"
   , v.mrp as "��������� �� �����"
   , v.sr_d_name as "�����������"
   , v.lrc as "Q� ����."
   , round(v.orc,1) as "Q� ����."
   , round((v.orc - v.or_bs),1) as "�������"
   , v.r_comment as "�����������"   /*�� ������� ����*/
   , (trunc(to_date('22.04.2017',  'dd.mm.yyyy')) - trunc(v.stop_date)) as "��. � �������"
   , (trunc(to_date('22.04.2017',  'dd.mm.yyyy')) - trunc(v.mo_date)) as "��. � ���."
   , v.wt_req_name as "��� ���"
   , v.well_id well_id
   , v.mo_date mo_date
  , v.stop_date stop_date
  , v.state_curr state_curr
  , v.state_rem
  , v.sr_id  /*��� ������� ���������*/
  , v.sr_d_id
  , v.r_sost_n 
  , v.wc_curr_name 
   from 
   ef9.fo_hsod v
   where v.DT = to_date('22.04.2017',  'dd.mm.yyyy')) t
WHERE
    t.state_rem = '���������'
 AND t.sr_id = 21    /*��� ������� ���������*/
 AND t.sr_d_id not in(71,69,60)  
 AND (t.r_sost_n = '����.���' or t.wc_curr_name = '����.���.�����')
