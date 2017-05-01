Select
Rownum as "�����",
n.*
from(
select
 v.region_name As "����",
 v.field_name As "������",
 v.well_name As "���",
 v.kust_name As "����",
 v.pump_type_cr As "�����",
 v.pump_capacity_bs As "���",
 v.pump_lift_bs As "�������",
 v.lr_bs As "����",
 v.w_bs As "������",
 v.or_bs As "����",
 v.dl_bs As "��",
 v.stop_date As "�������",
 v.sr_name As "�������",
 v.mrp As "���",
 '' as "������",
 v.lrc As "�����",
 v.orc As "�����",
 nvl(v.orc, v.or_bs) - v.or_bs As "�������",
 case 
  when v.r_comment is not null then v.r_comment
  else v.remark
 end "������1",
 /*tr.coment as "������1",*/
 trunc(to_date('##.##.####',  'dd.mm.yyyy')) - trunc(v.stop_date) As "�����������"
 from 
   ef9.fo_hsod v
where v.DT = to_date('##.##.####',  'dd.mm.yyyy')
and v.state_rem = '���������'
  and v.sr_id <> 21
  and v.wc_curr_name in ('����.���.�����', '����.���.�� �����.','����.���.���.')
    and v.sr_name not in ('������. ��','���','���. ����.','���','�/�','�����.���.','����. P��','�����','�� ��','�����.','�����. ���','������.','����. ����','�/� (������.)','����. ����','���.������ (����)')
and (Cds_vars.GetregionID() is null or v.region_id = Cds_vars.GetregionID())
    order by v.stop_date asc) n
