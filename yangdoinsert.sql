--���� ȸ������
insert into users
values(seq_users_no.nextval,'aa','11','01012341234','�絵����','aa@gmail.com','user');

insert into users
values(seq_users_no.nextval,'cc','11','01012341254','�絵����','cc@gmail.com','user');

--ȣ��Ʈ ȸ������
insert into users
values(seq_users_no.nextval,'bb','123','01023452345','ȣ��Ʈ','bb@gmail.com','host');

--ȣ��Ʈ�� ��ü���
insert into company
values(SEQ_COMPANY_NO.nextval,2,'0212341234','01023452345','����','��α�','04680104232123','week',2,'�α����۴�','��α�','12312312312','04123','������Ա������׿��ο�','14��','www.naver.com','asd@gmail.com');

--���µ��
insert into business_type
values(SEQ_BUSINESS_TYPE_NO.nextval,'����');

--��ü ����
insert into c_b_type
values(SEQ_CBT_NO.nextval,2,1);

--����
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'���');

--��ü����
insert into c_b_group
values(SEQ_CBG_NO.nextval,2,1);

--���
insert into pension
values(SEQ_PENSION_NO.nextval,2,'�αԳ����','12345','��⵵ ����� �Ͼȷ� 1���� 1-1','��Ÿ������',123456,'��⵵ ����� �Ͼȷ�','�������� 20�ð� �ɸ��ϴ� �˾Ƽ� ������','�ɾ�� ���Ϳ� ������ ��Ÿ��','�����Ÿ��� 5��','������','����','��','�̿��Ģ�̿���','�ٺ�ť 20000��','������ �ð��� 200����','','13:00','10:00',20000,10000,0,10);

--����̹���
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'�̹������',1);

--���ǽü�
insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'������');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'������');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'ī��');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'�뷡��');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'������');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'������');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'BBQ');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'�ֹ�/�Ĵ�');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'���ν�');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'������');


--������ǽü�
insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,1);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,2);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,3);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,4);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,5);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,6);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,7);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,8); 

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,9);

--����ü� ����
insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'�����');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'������');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'TV');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'��������');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'��ǿ�ǰ');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'��Ź��');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'����̱�');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'����');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'�ݷ��ߵ���');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'���ǳ���');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'��簡��');

--��� ����ü�
insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,1);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,2);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,3);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,4);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,5);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,6);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,7);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,8);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,9);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,10);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,1,11);

--�ؼ�����
insert into sub_peck
values(SEQ_SUB_PECK_NO.nextval,'2022-07-17','2022-08-08');
--��� �ؼ�����
insert into p_sub_peck
values(SEQ_P_SUB_PECK_NO.nextval,1,1);
--������
insert into peck
values(SEQ_PECK_NO.nextval,'2022-08-09','2022-08-31');

--��Ǽ�����
insert into p_peck
values(SEQ_PECK_NO.nextval,1,1);

--����
insert into rooms
values(SEQ_ROOMS_NO.nextval,1,'�������',2,4,'�ƹ��͵� �����','���� ��Ż�Ⱑ��','Y');

--���� �̹���
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,1,'�̰� ����');

--���� ���(�����)
insert into prices
values(SEQ_PRICES_NO.nextval,1,'��',150000,'Y','Y','Y','Y','Y','N','N');
insert into prices
values(SEQ_PRICES_NO.nextval,1,'��',150000,'N','N','N','N','N','Y','Y');

insert into prices
values(SEQ_PRICES_NO.nextval,1,'��',250000,'Y','Y','Y','Y','Y','N','N');
insert into prices
values(SEQ_PRICES_NO.nextval,1,'��',250000,'N','N','N','N','N','Y','Y');

insert into prices
values(SEQ_PRICES_NO.nextval,1,'��',350000,'Y','Y','Y','Y','Y','N','N');
insert into prices
values(SEQ_PRICES_NO.nextval,1,'��',350000,'N','N','N','N','N','Y','Y');

--����
--����Ϸ�
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,1,1,'�达','01085231568','22.08.04 �� 15:00','22.08.05 �� 11:00',2,2,0,'170,000',SYSDATE,'CARD','�����Ϸ�','����Ϸ�','','');

--�̿���
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,1,1,'�达','01085231568','22.08.04 �� 15:00','22.08.05 �� 11:00',2,2,0,'170,000',SYSDATE,'CARD','�����Ϸ�','�̿���','','');

--�̿�Ϸ�
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,1,1,'�达','01085231568','22.08.04 �� 15:00','22.08.05 �� 11:00',2,2,0,'170,000',SYSDATE,'CARD','�����Ϸ�','�̿�Ϸ�','','');

--�Ϲ����
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,1,1,'�达','01085231568','22.08.04 �� 15:00','22.08.05 �� 11:00',2,2,0,'170,000',SYSDATE,'CARD','�����Ϸ�','�Ϲ����','','');

--�絵���������
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,1,1,'�达','01085231568','22.08.04 �� 15:00','22.08.05 �� 11:00',2,2,0,'170,000',SYSDATE,'CARD','�����Ϸ�','�絵���������','','');

--�絵���
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,1,1,'�达','01085231568','22.08.04 �� 15:00','22.08.05 �� 11:00',2,2,0,'170,000',SYSDATE,'CARD','�����Ϸ�','�絵���','140,000','1');

--�絵�� ����Ϸ�

insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,1,3,'�̾�','01012341568','22.08.04 �� 15:00','22.08.05 �� 11:00',2,1,0,'140,000',SYSDATE,'CARD','�����Ϸ�','����Ϸ�','140,000','1');

--����Ʈ
insert into points
values(SEQ_POINTS_NO.nextval,1,'1,700',sysdate);

--����
insert into reviews
values(SEQ_REVIEWS_NO.nextval,1,'�߸𸣰ھ��',1,'','','���� ����������',sysdate);

--������
insert into replys
values(SEQ_REPLYS_NO.nextval,1,'��¼����',sysdate,2);
