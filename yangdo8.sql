 ---����

DROP TABLE users 
   CASCADE CONSTRAINTS;

drop sequence seq_users_no;

--��ü

DROP TABLE company 
   CASCADE CONSTRAINTS;
    
drop sequence seq_company_no;

--����

DROP TABLE business_type 
   CASCADE CONSTRAINTS;
    
drop sequence seq_business_type_no;

--��ü����

DROP TABLE c_b_type 
   CASCADE CONSTRAINTS;

drop sequence seq_cbt_no; -- cbt = company_business_type

--����

DROP TABLE business_group 
   CASCADE CONSTRAINTS;

drop sequence seq_business_group_no;

-- ��ü ����

DROP TABLE c_b_group 
   CASCADE CONSTRAINTS;

drop sequence seq_cbg_no;  -- cbg = company_business_group


--���
DROP TABLE pension 
   CASCADE CONSTRAINTS;
    
drop sequence seq_pension_no;    

--�õ�
DROP TABLE sido 
   CASCADE CONSTRAINTS;

drop sequence seq_sido_no; 

--����
DROP TABLE gugun 
   CASCADE CONSTRAINTS;
    
drop sequence seq_gugun_no; 

--����̹���

DROP TABLE pension_image 
   CASCADE CONSTRAINTS;

drop sequence seq_pension_img_no;

--���ǽü� ���� 
DROP TABLE s_amenities 
   CASCADE CONSTRAINTS;

drop sequence seq_s_amenities_no;

--��� ���ǽü�

DROP TABLE p_amenities 
   CASCADE CONSTRAINTS;

drop sequence seq_p_amenities_no;

--����ü� ����

DROP TABLE s_public 
   CASCADE CONSTRAINTS;

drop sequence seq_s_public_no;

--��� ����ü�

DROP TABLE p_public 
   CASCADE CONSTRAINTS;
    
drop sequence seq_p_public_no;


--������

DROP TABLE peck 
   CASCADE CONSTRAINTS;
    
drop sequence seq_peck_no;


--����

DROP TABLE rooms 
   CASCADE CONSTRAINTS;

drop sequence seq_rooms_no;
    

--���� �̹���

DROP TABLE room_image 
   CASCADE CONSTRAINTS;

drop sequence seq_room_image_no;

--���ǿ��
DROP TABLE prices 
   CASCADE CONSTRAINTS;

drop sequence seq_prices_no;

--����
DROP TABLE week 
   CASCADE CONSTRAINTS;
drop sequence seq_week_no;
--����

DROP TABLE reservations 
   CASCADE CONSTRAINTS;

drop sequence seq_reservations_no;

--����Ʈ

DROP TABLE points 
   CASCADE CONSTRAINTS;

drop sequence seq_points_no;

--����

DROP TABLE reviews 
   CASCADE CONSTRAINTS;

drop sequence seq_reviews_no;

--���� ���

DROP TABLE replys 
   CASCADE CONSTRAINTS;

drop sequence seq_replys_no;



--��������
create SEQUENCE seq_users_no
increment by 1
start with 1
nocache;

CREATE TABLE users (
   no NUMBER NOT NULL, /* ������ȣ */
   id VARCHAR2(100) NOT NULL, /* ���̵� */
   pw VARCHAR2(100) NOT NULL, /* �н����� */
   hp VARCHAR2(100) NOT NULL, /* ��ȭ��ȣ */
   nick_name VARCHAR2(100) NOT NULL, /* �г��� */
   email VARCHAR2(100) NOT NULL, /* �̸��� */
   identify VARCHAR2(10) NOT NULL /* ȸ������ */
);

COMMENT ON TABLE users IS '����';

COMMENT ON COLUMN users.no IS '������ȣ';

COMMENT ON COLUMN users.id IS '���̵�';

COMMENT ON COLUMN users.pw IS '�н�����';

COMMENT ON COLUMN users.hp IS '��ȭ��ȣ';

COMMENT ON COLUMN users.nick_name IS '�г���';

COMMENT ON COLUMN users.email IS '�̸���';

COMMENT ON COLUMN users.identify IS 'ȸ������';

CREATE UNIQUE INDEX PK_users
   ON users (
      no ASC
   );

ALTER TABLE users
   ADD
      CONSTRAINT PK_users
      PRIMARY KEY (
         no
      );

-------��ü
create sequence seq_company_no
increment by 1
start with 1
nocache;

CREATE TABLE company (
   no NUMBER NOT NULL, /* ��ü��ȣ */
   user_no NUMBER, /* ������ȣ */
   company_hp VARCHAR2(20) NOT NULL, /* ��ȭ��ȣ(��ü) */
   ceo_hp VARCHAR2(200) NOT NULL, /* �ڵ�����ȣ(��ü) */
   bank_name VARCHAR2(100), /* �������� */
   account_holder VARCHAR2(200), /* ������ */
   account VARCHAR2(100), /* ���¹�ȣ */
   settlement_cycle VARCHAR2(100), /* �����ֱ� */
   tax_Invoice number, /* ���ݰ�꼭���� */
   company_name VARCHAR2(300), /* ��ȣ�� */
   ceo_name VARCHAR2(20), /* ��ǥ�� */
   business_licensenumber VARCHAR2(100), /* ����ڵ�Ϲ�ȣ */
   postal_code VARCHAR2(100), /* �����ȣ */
   company_address VARCHAR2(100), /* ��ü�ּ� */
   detail_address VARCHAR2(100), /* ���ּ� */
   homepage VARCHAR2(1000), /* Ȩ������ */
   tax_Invoice_email VARCHAR2(100) /* ���ݰ�꼭�̸��� */
);

COMMENT ON TABLE company IS '��ü';

COMMENT ON COLUMN company.no IS '��ü��ȣ';

COMMENT ON COLUMN company.user_no IS '������ȣ';

COMMENT ON COLUMN company.company_hp IS '��ȭ��ȣ(��ü)';

COMMENT ON COLUMN company.ceo_hp IS '�ڵ�����ȣ(��ü)';

COMMENT ON COLUMN company.bank_name IS '��������';

COMMENT ON COLUMN company.account_holder IS '������';

COMMENT ON COLUMN company.account IS '���¹�ȣ';

COMMENT ON COLUMN company.settlement_cycle IS '�����ֱ�';

COMMENT ON COLUMN company.tax_Invoice IS '���ݰ�꼭����';

COMMENT ON COLUMN company.company_name IS '��ȣ��';

COMMENT ON COLUMN company.ceo_name IS '��ǥ��';

COMMENT ON COLUMN company.business_licensenumber IS '����ڵ�Ϲ�ȣ';

COMMENT ON COLUMN company.postal_code IS '�����ȣ';

COMMENT ON COLUMN company.company_address IS '��ü�ּ�';

COMMENT ON COLUMN company.detail_address IS '���ּ�';

COMMENT ON COLUMN company.homepage IS 'Ȩ������';

COMMENT ON COLUMN company.tax_Invoice_email IS '���ݰ�꼭�̸���';

CREATE UNIQUE INDEX PK_company
   ON company (
      no ASC
   );

ALTER TABLE company
   ADD
      CONSTRAINT PK_company
      PRIMARY KEY (
         no
      );

ALTER TABLE company
   ADD
      CONSTRAINT FK_users_TO_company
      FOREIGN KEY (
         user_no
      )
      REFERENCES users (
         no
      );
--����
create sequence seq_business_type_no
increment by 1
start with 1
nocache;


CREATE TABLE business_type (
   no NUMBER NOT NULL, /* ���¹�ȣ */
   name VARCHAR2(100) /* ���¸� */
);

COMMENT ON TABLE business_type IS '����';

COMMENT ON COLUMN business_type.no IS '���¹�ȣ';

COMMENT ON COLUMN business_type.name IS '���¸�';

CREATE UNIQUE INDEX PK_business_type
   ON business_type (
      no ASC
   );

ALTER TABLE business_type
   ADD
      CONSTRAINT PK_business_type
      PRIMARY KEY (
         no
      );


--��ü����
create sequence seq_cbt_no
increment by 1
start with 1
nocache;


CREATE TABLE c_b_type (
   no NUMBER NOT NULL, /* ��ü ���¹�ȣ */
   c_no NUMBER, /* ��ü��ȣ */
   b_type_no NUMBER /* ���¹�ȣ */
);

COMMENT ON TABLE c_b_type IS '��ü ����';

COMMENT ON COLUMN c_b_type.no IS '��ü ���¹�ȣ';

COMMENT ON COLUMN c_b_type.c_no IS '��ü��ȣ';

COMMENT ON COLUMN c_b_type.b_type_no IS '���¹�ȣ';

CREATE UNIQUE INDEX PK_c_b_type
   ON c_b_type (
      no ASC
   );

ALTER TABLE c_b_type
   ADD
      CONSTRAINT PK_c_b_type
      PRIMARY KEY (
         no
      );

ALTER TABLE c_b_type
   ADD
      CONSTRAINT FK_company_TO_c_b_type
      FOREIGN KEY (
         c_no
      )
      REFERENCES company (
         no
      );

ALTER TABLE c_b_type
   ADD
      CONSTRAINT FK_business_type_TO_c_b_type
      FOREIGN KEY (
         b_type_no
      )
      REFERENCES business_type (
         no
      );
--����
create sequence  seq_business_group_no
increment by 1
start with 1
nocache;

CREATE TABLE business_group (
   no NUMBER NOT NULL, /* ������ȣ */
   name VARCHAR2(100) /* ������ */
);

COMMENT ON TABLE business_group IS '����';

COMMENT ON COLUMN business_group.no IS '������ȣ';

COMMENT ON COLUMN business_group.name IS '������';

CREATE UNIQUE INDEX PK_business_group
   ON business_group (
      no ASC
   );

ALTER TABLE business_group
   ADD
      CONSTRAINT PK_business_group
      PRIMARY KEY (
         no
      );
-- ��ü ����
create sequence seq_cbg_no
increment by 1
start with 1
nocache;


CREATE TABLE c_b_group (
   no NUMBER NOT NULL, /* ��ü ������ȣ */
   c_no NUMBER, /* ��ü��ȣ */
   b_group_no NUMBER /* ������ȣ */
);

COMMENT ON TABLE c_b_group IS '��ü ����';

COMMENT ON COLUMN c_b_group.no IS '��ü ������ȣ';

COMMENT ON COLUMN c_b_group.c_no IS '��ü��ȣ';

COMMENT ON COLUMN c_b_group.b_group_no IS '������ȣ';

CREATE UNIQUE INDEX PK_c_b_group
   ON c_b_group (
      no ASC
   );

ALTER TABLE c_b_group
   ADD
      CONSTRAINT PK_c_b_group
      PRIMARY KEY (
         no
      );

ALTER TABLE c_b_group
   ADD
      CONSTRAINT FK_company_TO_c_b_group
      FOREIGN KEY (
         c_no
      )
      REFERENCES company (
         no
      );

ALTER TABLE c_b_group
   ADD
      CONSTRAINT FK_business_group_TO_c_b_group
      FOREIGN KEY (
         b_group_no
      )
      REFERENCES business_group (
         no
      );


--���
create sequence seq_pension_no
increment by 1
start with 1
nocache;


CREATE TABLE pension (
   no NUMBER NOT NULL, /* ��ǹ�ȣ */
   company_no NUMBER, /* ��ü��ȣ */
   name VARCHAR2(100), /* ��Ǹ� */
   postal_code VARCHAR2(100), /* �����ȣ */
   address VARCHAR2(100), /* ����ּ� */
   detail_address VARCHAR2(100), /* ���ּ� */
   law_code NUMBER, /* �������ڵ� */
   law_name VARCHAR2(200), /* �������̸� */
   visit_road1 VARCHAR2(1000) NOT NULL, /* ���ô±�1 */
   visit_road2 VARCHAR2(1000) NOT NULL, /* ���ô±�2 */
   visit_road3 VARCHAR2(1000) NOT NULL, /* ���ô±�3 */
   area_info1 VARCHAR2(1000) NOT NULL, /* �ֺ�����1 */
   area_info2 VARCHAR2(1000) NOT NULL, /* �ֺ�����2 */
   area_info3 VARCHAR2(1000) NOT NULL, /* �ֺ�����3 */
   rules VARCHAR2(2000), /* �̿��Ģ */
   live_pay VARCHAR2(2000), /* ������ �߰����� */
   parking_info VARCHAR2(2000), /* ���������� */
   etc VARCHAR2(2000), /* ��Ÿ */
   check_in VARCHAR2(200), /* üũ�� */
   check_out VARCHAR2(200), /* üũ�ƿ� */
   add_adult_price NUMBER, /* ���ΰ��� */
   add_kid_price NUMBER, /* �Ƶ����� */
   add_baby_price NUMBER, /* �����ư��� */
   refund_no NUMBER /* ȯ�ұ�����ȣ */
);

COMMENT ON TABLE pension IS '���';

COMMENT ON COLUMN pension.no IS '��ǹ�ȣ';

COMMENT ON COLUMN pension.company_no IS '��ü��ȣ';

COMMENT ON COLUMN pension.name IS '��Ǹ�';

COMMENT ON COLUMN pension.postal_code IS '�����ȣ';

COMMENT ON COLUMN pension.address IS '����ּ�';

COMMENT ON COLUMN pension.detail_address IS '���ּ�';

COMMENT ON COLUMN pension.law_code IS '�������ڵ�';

COMMENT ON COLUMN pension.law_name IS '�������̸�';

COMMENT ON COLUMN pension.visit_road1 IS '���ô±�1';

COMMENT ON COLUMN pension.visit_road2 IS '���ô±�2';

COMMENT ON COLUMN pension.visit_road3 IS '���ô±�3';

COMMENT ON COLUMN pension.area_info1 IS '�ֺ�����1';

COMMENT ON COLUMN pension.area_info2 IS '�ֺ�����2';

COMMENT ON COLUMN pension.area_info3 IS '�ֺ�����3';

COMMENT ON COLUMN pension.rules IS '�̿��Ģ';

COMMENT ON COLUMN pension.live_pay IS '������ �߰�����';

COMMENT ON COLUMN pension.parking_info IS '����������';

COMMENT ON COLUMN pension.etc IS '��Ÿ';

COMMENT ON COLUMN pension.check_in IS 'üũ��';

COMMENT ON COLUMN pension.check_out IS 'üũ�ƿ�';

COMMENT ON COLUMN pension.add_adult_price IS '���ΰ���';

COMMENT ON COLUMN pension.add_kid_price IS '�Ƶ�����';

COMMENT ON COLUMN pension.add_baby_price IS '�����ư���';

COMMENT ON COLUMN pension.refund_no IS 'ȯ�ұ�����ȣ';

CREATE UNIQUE INDEX PK_pension
   ON pension (
      no ASC
   );

ALTER TABLE pension
   ADD
      CONSTRAINT PK_pension
      PRIMARY KEY (
         no
      );

ALTER TABLE pension
   ADD
      CONSTRAINT FK_company_TO_pension
      FOREIGN KEY (
         company_no
      )
      REFERENCES company (
         no
      );

--��� �̹���
create sequence seq_pension_img_no
increment by 1
start with 1
nocache;




CREATE TABLE pension_image (
	no NUMBER NOT NULL, /* �Ҽ��̹�����ȣ */
	pension_no NUMBER, /* ��ǹ�ȣ */
	save_name VARCHAR2(200), /* �̹��������̸� */
	image_path VARCHAR2(200) /* �̹������ */
);

COMMENT ON TABLE pension_image IS '�Ҽ��̹���';

COMMENT ON COLUMN pension_image.no IS '�Ҽ��̹�����ȣ';

COMMENT ON COLUMN pension_image.pension_no IS '��ǹ�ȣ';

COMMENT ON COLUMN pension_image.save_name IS '�̹��������̸�';

COMMENT ON COLUMN pension_image.image_path IS '�̹������';

CREATE UNIQUE INDEX PK_pension_image
	ON pension_image (
		no ASC
	);

ALTER TABLE pension_image
	ADD
		CONSTRAINT PK_pension_image
		PRIMARY KEY (
			no
		);

ALTER TABLE pension_image
	ADD
		CONSTRAINT FK_pension_TO_pension_image
		FOREIGN KEY (
			pension_no
		)
		REFERENCES pension (
			no
		);

-- ���ǽü� ����
create sequence seq_s_amenities_no
increment by 1
start with 1
nocache;



CREATE TABLE s_amenities (
   no NUMBER NOT NULL, /* ���ǽü����񽺹�ȣ */
   name VARCHAR2(100), /* ���ǽü��� */
   icon_path VARCHAR2(1000) /* ���ǽü������� */
);

COMMENT ON TABLE s_amenities IS '���ǽü� ����';

COMMENT ON COLUMN s_amenities.no IS '���ǽü����񽺹�ȣ';

COMMENT ON COLUMN s_amenities.name IS '���ǽü���';

COMMENT ON COLUMN s_amenities.icon_path IS '���ǽü�������';

CREATE UNIQUE INDEX PK_s_amenities
   ON s_amenities (
      no ASC
   );

ALTER TABLE s_amenities
   ADD
      CONSTRAINT PK_s_amenities
      PRIMARY KEY (
         no
      );

--��� ���ǽü�
create sequence seq_p_amenities_no
increment by 1
start with 1
nocache;


CREATE TABLE p_amenities (
   no NUMBER NOT NULL, /* ������ǽü���ȣ */
   pension_no NUMBER, /* ��ǹ�ȣ */
   s_amenities_no NUMBER /* ���ǽü����񽺹�ȣ */
);

COMMENT ON TABLE p_amenities IS '�Ҽ����ǽü�';

COMMENT ON COLUMN p_amenities.no IS '������ǽü���ȣ';

COMMENT ON COLUMN p_amenities.pension_no IS '��ǹ�ȣ';

COMMENT ON COLUMN p_amenities.s_amenities_no IS '���ǽü����񽺹�ȣ';

CREATE UNIQUE INDEX PK_p_amenities
   ON p_amenities (
      no ASC
   );

ALTER TABLE p_amenities
   ADD
      CONSTRAINT PK_p_amenities
      PRIMARY KEY (
         no
      );

ALTER TABLE p_amenities
   ADD
      CONSTRAINT FK_pension_TO_p_amenities
      FOREIGN KEY (
         pension_no
      )
      REFERENCES pension (
         no
      );

ALTER TABLE p_amenities
   ADD
      CONSTRAINT FK_s_amenities_TO_p_amenities
      FOREIGN KEY (
         s_amenities_no
      )
      REFERENCES s_amenities (
         no
      );


--����ü� ����
create sequence seq_s_public_no
increment by 1
start with 1
nocache;



CREATE TABLE s_public (
   no NUMBER NOT NULL, /* ����ü����񼭹�ȣ */
   name VARCHAR2(100), /* ����ü��� */
   icon_path VARCHAR2(1000) /* ����ü������� */
);

COMMENT ON TABLE s_public IS '����ü� ����';

COMMENT ON COLUMN s_public.no IS '����ü����񼭹�ȣ';

COMMENT ON COLUMN s_public.name IS '����ü���';

COMMENT ON COLUMN s_public.icon_path IS '����ü�������';

CREATE UNIQUE INDEX PK_s_public
   ON s_public (
      no ASC
   );

ALTER TABLE s_public
   ADD
      CONSTRAINT PK_s_public
      PRIMARY KEY (
         no
      );
--��� ����ü�
create sequence seq_p_public_no
increment by 1
start with 1
nocache;


CREATE TABLE p_public (
   no NUMBER NOT NULL, /* ��ǰ���ü���ȣ */
   pension_no NUMBER, /* ��ǹ�ȣ */
   s_public_no NUMBER /* ����ü����񼭹�ȣ */
);

COMMENT ON TABLE p_public IS '�Ҽǰ���ü�';

COMMENT ON COLUMN p_public.no IS '��ǰ���ü���ȣ';

COMMENT ON COLUMN p_public.pension_no IS '��ǹ�ȣ';

COMMENT ON COLUMN p_public.s_public_no IS '����ü����񼭹�ȣ';

CREATE UNIQUE INDEX PK_p_public
   ON p_public (
      no ASC
   );

ALTER TABLE p_public
   ADD
      CONSTRAINT PK_p_public
      PRIMARY KEY (
         no
      );

ALTER TABLE p_public
   ADD
      CONSTRAINT FK_pension_TO_p_public
      FOREIGN KEY (
         pension_no
      )
      REFERENCES pension (
         no
      );

ALTER TABLE p_public
   ADD
      CONSTRAINT FK_s_public_TO_p_public
      FOREIGN KEY (
         s_public_no
      )
      REFERENCES s_public (
         no
      );
      
--��/��
create sequence seq_sido_no
increment by 1
start with 1
nocache;


CREATE TABLE sido (
   no NUMBER NOT NULL, /* ��/����ȣ */
   pension_no NUMBER, /* ��ǹ�ȣ */
   name VARCHAR2(100) /* �̸� */
);

COMMENT ON TABLE sido IS '��/��';

COMMENT ON COLUMN sido.no IS '��/����ȣ';

COMMENT ON COLUMN sido.pension_no IS '��ǹ�ȣ';

COMMENT ON COLUMN sido.name IS '�̸�';

CREATE UNIQUE INDEX PK_sido
   ON sido (
      no ASC
   );

ALTER TABLE sido
   ADD
      CONSTRAINT PK_sido
      PRIMARY KEY (
         no
      );

ALTER TABLE sido
   ADD
      CONSTRAINT FK_pension_TO_sido
      FOREIGN KEY (
         pension_no
      )
      REFERENCES pension (
         no
      );
        
        
--��/��
create sequence seq_gugun_no
increment by 1
start with 1
nocache;


CREATE TABLE gugun (
   no NUMBER NOT NULL, /* ��/����ȣ */
   sido_no NUMBER, /* ��/����ȣ */
   name VARCHAR2(100) /* �̸� */
);

COMMENT ON TABLE gugun IS '��/��';

COMMENT ON COLUMN gugun.no IS '��/����ȣ';

COMMENT ON COLUMN gugun.sido_no IS '��/����ȣ';

COMMENT ON COLUMN gugun.name IS '�̸�';

CREATE UNIQUE INDEX PK_gugun
   ON gugun (
      no ASC
   );

ALTER TABLE gugun
   ADD
      CONSTRAINT PK_gugun
      PRIMARY KEY (
         no
      );

ALTER TABLE gugun
   ADD
      CONSTRAINT FK_sido_TO_gugun
      FOREIGN KEY (
         sido_no
      )
      REFERENCES sido (
         no
      );
        
        


--������
create sequence seq_peck_no
increment by 1
start with 1
nocache;


CREATE TABLE peck (
	no NUMBER NOT NULL, /* ������ ��ȣ */
	pension_no NUMBER, /* ��ǹ�ȣ */
	peck_start DATE, /* ������ ���� */
	peck_end DATE, /* ������ �� */
	gubun VARCHAR2(100) /* ���� */
);

COMMENT ON TABLE peck IS '������';

COMMENT ON COLUMN peck.no IS '������ ��ȣ';

COMMENT ON COLUMN peck.pension_no IS '��ǹ�ȣ';

COMMENT ON COLUMN peck.peck_start IS '������ ����';

COMMENT ON COLUMN peck.peck_end IS '������ ��';

COMMENT ON COLUMN peck.gubun IS '����';

CREATE UNIQUE INDEX PK_peck
	ON peck (
		no ASC
	);

ALTER TABLE peck
	ADD
		CONSTRAINT PK_peck
		PRIMARY KEY (
			no
		);

ALTER TABLE peck
	ADD
		CONSTRAINT FK_pension_TO_peck
		FOREIGN KEY (
			pension_no
		)
		REFERENCES pension (
			no
		);


---����
create sequence seq_rooms_no
increment by 1
start with 1
nocache;


CREATE TABLE rooms (
   no NUMBER NOT NULL, /* ���ǹ�ȣ */
   pension_no NUMBER NOT NULL, /* ��ǹ�ȣ */
   room_name VARCHAR2(100), /* ���Ǹ� */
   standard_people NUMBER, /* �����ο� */
   max_people NUMBER, /* �ִ��ο� */
   room_amenities VARCHAR2(100), /* ���ǽü� */
   add_info VARCHAR2(100), /* �߰����� */
   reserve_avai VARCHAR2(10) /* ���డ�ɿ��� */
);

COMMENT ON TABLE rooms IS '����';

COMMENT ON COLUMN rooms.no IS '���ǹ�ȣ';

COMMENT ON COLUMN rooms.pension_no IS '��ǹ�ȣ';

COMMENT ON COLUMN rooms.room_name IS '���Ǹ�';

COMMENT ON COLUMN rooms.standard_people IS '�����ο�';

COMMENT ON COLUMN rooms.max_people IS '�ִ��ο�';

COMMENT ON COLUMN rooms.room_amenities IS '���ǽü�';

COMMENT ON COLUMN rooms.add_info IS '�߰�����';

COMMENT ON COLUMN rooms.reserve_avai IS '���డ�ɿ���';

CREATE UNIQUE INDEX PK_rooms
   ON rooms (
      no ASC
   );

ALTER TABLE rooms
   ADD
      CONSTRAINT PK_rooms
      PRIMARY KEY (
         no
      );

ALTER TABLE rooms
   ADD
      CONSTRAINT FK_pension_TO_rooms
      FOREIGN KEY (
         pension_no
      )
      REFERENCES pension (
         no
      );

--���� �̹���
create sequence seq_room_image_no
increment by 1
start with 1
nocache;


CREATE TABLE room_image (
   no NUMBER NOT NULL, /* �����̹�����ȣ */
   rooms_no NUMBER, /* ���ǹ�ȣ */
   save_name VARCHAR2(200), /* �̹��������̸� */
   image_path VARCHAR2(100) /* ��� */
);

COMMENT ON TABLE room_image IS '�����̹���';

COMMENT ON COLUMN room_image.no IS '�����̹�����ȣ';

COMMENT ON COLUMN room_image.rooms_no IS '���ǹ�ȣ';

COMMENT ON COLUMN room_image.save_name IS '�̹��������̸�';

COMMENT ON COLUMN room_image.image_path IS '���';

CREATE UNIQUE INDEX PK_room_image
   ON room_image (
      no ASC
   );

ALTER TABLE room_image
   ADD
      CONSTRAINT PK_room_image
      PRIMARY KEY (
         no
      );

ALTER TABLE room_image
   ADD
      CONSTRAINT FK_rooms_TO_room_image
      FOREIGN KEY (
         rooms_no
      )
      REFERENCES rooms (
         no
      );


--���ǿ��
create sequence seq_prices_no
increment by 1
start with 1
nocache;



CREATE TABLE prices (
   no NUMBER NOT NULL, /* ��ȣ */
   room_no NUMBER, /* ���ǹ�ȣ */
   sortation NUMBER, /* ����(��= 2,�� = 1,��  = 3) */
   divide NUMBER, /* ����(��1,��2) */
   price NUMBER /* ����(5000) */
);

COMMENT ON TABLE prices IS '���';

COMMENT ON COLUMN prices.no IS '��ȣ';

COMMENT ON COLUMN prices.room_no IS '���ǹ�ȣ';

COMMENT ON COLUMN prices.sortation IS '����(��,��,��)';

COMMENT ON COLUMN prices.divide IS '����(��1,��2)';

COMMENT ON COLUMN prices.price IS '����(5000)';

CREATE UNIQUE INDEX PK_prices
   ON prices (
      no ASC
   );

ALTER TABLE prices
   ADD
      CONSTRAINT PK_prices
      PRIMARY KEY (
         no
      );

ALTER TABLE prices
   ADD
      CONSTRAINT FK_rooms_TO_prices
      FOREIGN KEY (
         room_no
      )
      REFERENCES rooms (
         no
      );
        
--����
create sequence seq_week_no
increment by 1
start with 1
nocache;

CREATE TABLE week (
   no NUMBER NOT NULL, /* ���Ϲ�ȣ */
   price_no NUMBER, /* ��ݹ�ȣ */
   name VARCHAR2(100) /* ���ϸ� */
);

COMMENT ON TABLE week IS '����';

COMMENT ON COLUMN week.no IS '���Ϲ�ȣ';

COMMENT ON COLUMN week.price_no IS '��ݹ�ȣ';

COMMENT ON COLUMN week.name IS '���ϸ�';

CREATE UNIQUE INDEX PK_week
   ON week (
      no ASC
   );

ALTER TABLE week
   ADD
      CONSTRAINT PK_week
      PRIMARY KEY (
         no
      );

ALTER TABLE week
   ADD
      CONSTRAINT FK_prices_TO_week
      FOREIGN KEY (
         price_no
      )
      REFERENCES prices (
         no
      );


--����      
create sequence seq_reservations_no
increment by 1
start with 1
nocache;
        

CREATE TABLE reservations (
   no NUMBER NOT NULL, /* �����ȣ */
   room_no NUMBER, /* ���ǹ�ȣ */
   user_no NUMBER NOT NULL, /* ������ȣ */
   name VARCHAR2(100) NOT NULL, /* �������̸� */
   hp VARCHAR2(20) NOT NULL, /* �޴�����ȣ */
   check_in Date NOT NULL, /* üũ�γ�¥ */
   check_out Date NOT NULL, /* üũ�ƿ���¥ */
   adult NUMBER NOT NULL, /* ���� */
   kid NUMBER, /* �Ƶ� */
   baby NUMBER, /* ������ */
   total_price varchar2(100) NOT NULL, /* �Ѱ��� */
   reg_date DATE NOT NULL, /* ����� */
   pay_way VARCHAR2(20) NOT NULL, /* �������� */
   pay_status VARCHAR2(20), /* �������� */
   status number, /* ������� 1 ����Ϸ�
                             2 �̿���
                             3 �̿�Ϸ�
                             4 �Ϲ����
                             5 �絵���������(�絵�Ϸ�)
                             6 �絵��� */ 
   trans_price varchar2(100)   , /* �絵���� */
   p_r_no NUMBER /* �θ𿹾��ȣ */
);

COMMENT ON TABLE reservations IS '����';

COMMENT ON COLUMN reservations.no IS '�����ȣ';

COMMENT ON COLUMN reservations.room_no IS '���ǹ�ȣ';

COMMENT ON COLUMN reservations.user_no IS '������ȣ';

COMMENT ON COLUMN reservations.name IS '�������̸�';

COMMENT ON COLUMN reservations.hp IS '�޴�����ȣ';

COMMENT ON COLUMN reservations.check_in IS 'üũ�γ�¥';

COMMENT ON COLUMN reservations.check_out IS 'üũ�ƿ���¥';

COMMENT ON COLUMN reservations.adult IS '����';

COMMENT ON COLUMN reservations.kid IS '�Ƶ�';

COMMENT ON COLUMN reservations.baby IS '������';

COMMENT ON COLUMN reservations.total_price IS '�Ѱ���';

COMMENT ON COLUMN reservations.reg_date IS '�����';

COMMENT ON COLUMN reservations.pay_way IS '��������';

COMMENT ON COLUMN reservations.pay_status IS '��������';

COMMENT ON COLUMN reservations.status IS '�������';

COMMENT ON COLUMN reservations.trans_price IS '�絵����';

COMMENT ON COLUMN reservations.p_r_no IS '�θ𿹾��ȣ';

CREATE UNIQUE INDEX PK_reservations
   ON reservations (
      no ASC
   );

ALTER TABLE reservations
   ADD
      CONSTRAINT PK_reservations
      PRIMARY KEY (
         no
      );

ALTER TABLE reservations
   ADD
      CONSTRAINT FK_users_TO_reservations
      FOREIGN KEY (
         user_no
      )
      REFERENCES users (
         no
      );

ALTER TABLE reservations
   ADD
      CONSTRAINT FK_rooms_TO_reservations
      FOREIGN KEY (
         room_no
      )
      REFERENCES rooms (
         no
      );

--����Ʈ
create sequence seq_points_no
increment by 1
start with 1
nocache;


CREATE TABLE points (
   no NUMBER NOT NULL, /* ����Ʈ��ȣ */
   reserve_no NUMBER, /* �����ȣ */
   point varchar2(100), /* �ݾ� */
   reg_date DATE /* �̿볯¥ */
);

COMMENT ON TABLE points IS '����Ʈ';

COMMENT ON COLUMN points.no IS '����Ʈ��ȣ';

COMMENT ON COLUMN points.reserve_no IS '�����ȣ';

COMMENT ON COLUMN points.point IS '�ݾ�';

COMMENT ON COLUMN points.reg_date IS '�̿볯¥';

CREATE UNIQUE INDEX PK_points
   ON points (
      no ASC
   );

ALTER TABLE points
   ADD
      CONSTRAINT PK_points
      PRIMARY KEY (
         no
      );

ALTER TABLE points
   ADD
      CONSTRAINT FK_reservations_TO_points
      FOREIGN KEY (
         reserve_no
      )
      REFERENCES reservations (
         no
      );


--����
create sequence seq_reviews_no
increment by 1
start with 1
nocache;

CREATE TABLE reviews (
   review_no NUMBER NOT NULL, /* �����ȣ */
   no NUMBER, /* �����ȣ */
   title VARCHAR2(2000) NOT NULL, /* ���� */
   stars NUMBER NOT NULL, /* ���� */
   image1 VARCHAR2(20), /* �̹���1 */
   image2 VARCHAR2(20), /* �̹���2 */
   content VARCHAR2(1000) NOT NULL, /* ���� */
   reg_date DATE NOT NULL /* ����� */
);

COMMENT ON TABLE reviews IS '����';

COMMENT ON COLUMN reviews.review_no IS '�����ȣ';

COMMENT ON COLUMN reviews.no IS '�����ȣ';

COMMENT ON COLUMN reviews.title IS '����';

COMMENT ON COLUMN reviews.stars IS '����';

COMMENT ON COLUMN reviews.image1 IS '�̹���1';

COMMENT ON COLUMN reviews.image2 IS '�̹���2';

COMMENT ON COLUMN reviews.content IS '����';

COMMENT ON COLUMN reviews.reg_date IS '�����';

CREATE UNIQUE INDEX PK_reviews
   ON reviews (
      review_no ASC
   );

ALTER TABLE reviews
   ADD
      CONSTRAINT PK_reviews
      PRIMARY KEY (
         review_no
      );

ALTER TABLE reviews
   ADD
      CONSTRAINT FK_reservations_TO_reviews
      FOREIGN KEY (
         no
      )
      REFERENCES reservations (
         no
      );


--������
create sequence seq_replys_no
increment by 1
start with 1
nocache;



CREATE TABLE replys (
   reply_no NUMBER NOT NULL, /* ���������ȣ */
   review_no NUMBER NOT NULL, /* �����ȣ */
   content VARCHAR2(1000), /* ���� */
   reg_date DATE, /* ����� */
   owner NUMBER /* ������� */
);

COMMENT ON TABLE replys IS '������';

COMMENT ON COLUMN replys.reply_no IS '���������ȣ';

COMMENT ON COLUMN replys.review_no IS '�����ȣ';

COMMENT ON COLUMN replys.content IS '����';

COMMENT ON COLUMN replys.reg_date IS '�����';

COMMENT ON COLUMN replys.owner IS '�������';

CREATE UNIQUE INDEX PK_replys
   ON replys (
      reply_no ASC
   );

ALTER TABLE replys
   ADD
      CONSTRAINT PK_replys
      PRIMARY KEY (
         reply_no
      );

ALTER TABLE replys
   ADD
      CONSTRAINT FK_reviews_TO_replys
      FOREIGN KEY (
         review_no
      )
      REFERENCES reviews (
         review_no
      );

ALTER TABLE replys
   ADD
      CONSTRAINT FK_users_TO_replys
      FOREIGN KEY (
         owner
      )
      REFERENCES users (
         no
      );

--���� ȸ������
insert into users
values(seq_users_no.nextval,'aa','11','01012341234','�絵����','aa@gmail.com','user');  ----1

insert into users
values(seq_users_no.nextval,'cc','11','01012341254','�絵����','cc@gmail.com','user'); -----2

--ȣ��Ʈ ȸ������
insert into users
values(seq_users_no.nextval,'bb','11','01040012325','ȣ��Ʈ','bb@gmail.com','host'); -----3

insert into users
values(seq_users_no.nextval,'gg','11','01099821354','ȣ��','gg@gmail.com','host'); -----4

insert into users
values(seq_users_no.nextval,'ww','11','01077853320','���̹���','����@gmail.com','host'); -----5

insert into users
values(seq_users_no.nextval,'hh','11','01010041009','ü����','hh@gmail.com','host'); -----6

insert into users
values(seq_users_no.nextval,'pp','11','01065659989','������','pp@gmail.com','host'); -----7



--ȣ��Ʈ�� ��ü���
insert into company
values(SEQ_COMPANY_NO.nextval,3,'0266539875','01040012325','����','��α�','04680104232123','week',2,'�α����۴�','��α�','321312312','78567','������Ա������׿��ο�','123��','www.zxz.com','qqq@gmail.com');

insert into company
values(SEQ_COMPANY_NO.nextval,4,'0277345195','01099821354','����','�����̼���','04233354652154','week',2,'��Ű���۴�','���Ű','12312312312','22222','�����������~','14��','www.xxx.com','wwww@gmail.com');

insert into company
values(SEQ_COMPANY_NO.nextval,5,'0266457335','01077853320','����','�̰ǹ���','01452154979865','week',2,'��Ű���۴�','���Ű','123213123123','43234','���ֵ�~','1433��','www.ccc.com','eeeee@gmail.com');

insert into company
values(SEQ_COMPANY_NO.nextval,6,'02327546195','01010041009','����','�����߸���','2123545232028','week',2,'¯�����۴�','��¯��','124213123123','12321','�뱸','5214��','www.fff.com','r@gmail.com');

insert into company
values(SEQ_COMPANY_NO.nextval,7,'0215151949','01065659989','����','����','6548951235545','week',2,'į�۴�','���۴�','12123124123','46545','�߱�','14321��','www.ggg.com','rrsda@gmail.com');


--���µ��
insert into business_type
values(SEQ_BUSINESS_TYPE_NO.nextval,'����');
insert into business_type
values(SEQ_BUSINESS_TYPE_NO.nextval,'���� �� ����');
insert into business_type
values(SEQ_BUSINESS_TYPE_NO.nextval,'�ε���');
insert into business_type
values(SEQ_BUSINESS_TYPE_NO.nextval,'����');
insert into business_type
values(SEQ_BUSINESS_TYPE_NO.nextval,'����');

--��ü ����
insert into c_b_type
values(SEQ_CBT_NO.nextval,1,1);

insert into c_b_type
values(SEQ_CBT_NO.nextval,2,2);

insert into c_b_type
values(SEQ_CBT_NO.nextval,3,2);

insert into c_b_type
values(SEQ_CBT_NO.nextval,4,2);

insert into c_b_type
values(SEQ_CBT_NO.nextval,5,1);

--����
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'�ι�');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'�ܱ��ε��ùι�');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'�Խ�Ʈ�Ͽ콺');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'�ѿ�ü��');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'����');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'����');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'���');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'ȣ����');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'����');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'����');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'�Ӵ�');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'ȣ��');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'����ȣ��');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'�Ϲݿ���');
insert into business_group
values(SEQ_BUSINESS_GROUP_NO.nextval,'������');

--��ü����
insert into c_b_group
values(SEQ_CBG_NO.nextval,1,1);

insert into c_b_group
values(SEQ_CBG_NO.nextval,1,3);

insert into c_b_group
values(SEQ_CBG_NO.nextval,1,2);

insert into c_b_group
values(SEQ_CBG_NO.nextval,2,1);

insert into c_b_group
values(SEQ_CBG_NO.nextval,2,6);

insert into c_b_group
values(SEQ_CBG_NO.nextval,2,3);

insert into c_b_group
values(SEQ_CBG_NO.nextval,3,5);

insert into c_b_group
values(SEQ_CBG_NO.nextval,3,6);

insert into c_b_group
values(SEQ_CBG_NO.nextval,3,7);

insert into c_b_group
values(SEQ_CBG_NO.nextval,4,1);

insert into c_b_group
values(SEQ_CBG_NO.nextval,4,7);

insert into c_b_group
values(SEQ_CBG_NO.nextval,5,3);

insert into c_b_group
values(SEQ_CBG_NO.nextval,5,7);

 
--���
insert into pension
values(SEQ_PENSION_NO.nextval,1,'�αԳ����','13494','��� ����� �Ͼȷ�288���� 2','��Ÿ������',4121010300,'��⵵ ����� �Ͼȷ�','�������� 20�ð� �ɸ��ϴ� �˾Ƽ� ������','�ɾ�� ���Ϳ� ������ ��Ÿ��','�����Ÿ��� 5��','������','����','��','�̿��Ģ�̿���','�ٺ�ť 20000��','������ �ð��� 2����','','13:00','10:00',20000,10000,0,10);

insert into pension
values(SEQ_PENSION_NO.nextval,2,'�������','13494','��� ������ �д籸 �Ǳ����� 235','�Ǳ����������',4113510900,'��� ������ �д籸 ����','��Ÿ�������','����Ÿ��͵��ſ�','�Ǳ��� 5��','������','����','��','�̿��Ģ�̿���','�ٺ�ť 20000��','������ �ð��� 12����','','13:00','10:00',20000,10000,0,7);

insert into pension
values(SEQ_PENSION_NO.nextval,3,'��Ű���','17028','��� ���ν� ó�α� ������ ��������� 12','�������忷',4146125023,'��� ���ν� ó�α� ������','�������� 20�ð� �ɸ��ϴ� �˾Ƽ� ������','�ɾ�� ���Ϳ� ������ ��Ÿ��','�������� 5��','������','����','��','�̿��Ģ�̿���','�ٺ�ť 20000��','������ �ð��� 30����','','13:00','10:00',20000,10000,0,7);

insert into pension
values(SEQ_PENSION_NO.nextval,4,'¯¯���','63309','����Ư����ġ�� ���ֽ� ÷�ܷ� 242','��������',5011013600,'����Ư����ġ�� ���ֽ� ����','�������� 20�ð� �ɸ��ϴ� �˾Ƽ� ������','�ɾ�� ���Ϳ� ������ ��Ÿ��','�����Ÿ�� 5��','������','����','��','�̿��Ģ�̿���','�ٺ�ť 20000��','������ �ð��� 25����','','13:00','10:00',20000,10000,0,6);

insert into pension
values(SEQ_PENSION_NO.nextval,5,'���������','06035','���� ������ ���μ��� 5','���μ���~',1168010700,'���� ������ �Ż絿','�������� 20�ð� �ɸ��ϴ� �˾Ƽ� ������','�ɾ�� ���Ϳ� ������ ��Ÿ��','�͸����Ǽ� 5��','������','����','��','�̿��Ģ�̿���','�ٺ�ť 20000��','������ �ð��� 99����','','13:00','10:00',20000,10000,0,10);

insert into sido
values(seq_sido_no.nextval,1,'��⵵');
insert into gugun
values(seq_gugun_no.nextval,1,'�����');

insert into sido
values(seq_sido_no.nextval,2,'��⵵');
insert into gugun
values(seq_gugun_no.nextval,1,'������');

insert into sido
values(seq_sido_no.nextval,3,'��⵵');
insert into gugun
values(seq_gugun_no.nextval,1,'���ν�');

insert into sido
values(seq_sido_no.nextval,4,'���ֵ�');
insert into gugun
values(seq_gugun_no.nextval,2,'���ֽ�');

insert into sido
values(seq_sido_no.nextval,5,'����Ư����');
insert into gugun
values(seq_gugun_no.nextval,3,'������');

--����̹���
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'1.jpg','1.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'2.jpg','2.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'3.jpg','3.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'4.jpg','4.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'5.jpg','5.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'6.jpg','6.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'7.jpg','7.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'8.jpg','8.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'9.jpg','9.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'10.jpg','10.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'11.jpg','11.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'12.jpg','12.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'13.jpg','13.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'14.jpg','14.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'15.jpg','15.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'16.jpg','16.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'17.jpg','17.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'18.jpg','18.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'19.jpg','19.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,1,'20.jpg','20.jpg');

insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'1.jpg','1.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'2.jpg','2.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'3.jpg','3.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'4.jpg','4.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'5.jpg','5.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'6.jpg','6.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'7.jpg','7.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'8.jpg','8.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'9.jpg','9.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'10.jpg','10.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'11.jpg','11.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'12.jpg','12.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'13.jpg','13.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'14.jpg','14.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'15.jpg','15.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'16.jpg','16.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'17.jpg','17.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'18.jpg','18.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'19.jpg','19.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,2,'20.jpg','20.jpg');

insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'1.jpg','1.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'2.jpg','2.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'3.jpg','3.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'4.jpg','4.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'5.jpg','5.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'6.jpg','6.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'7.jpg','7.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'8.jpg','8.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'9.jpg','9.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'10.jpg','10.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'11.jpg','11.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'12.jpg','12.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'13.jpg','13.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'14.jpg','14.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'15.jpg','15.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'16.jpg','16.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'17.jpg','17.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'18.jpg','18.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'19.jpg','19.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,3,'20.jpg','20.jpg');

insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'1.jpg','1.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'2.jpg','2.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'3.jpg','3.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'4.jpg','4.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'5.jpg','5.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'6.jpg','6.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'7.jpg','7.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'8.jpg','8.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'9.jpg','9.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'10.jpg','10.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'11.jpg','11.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'12.jpg','12.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'13.jpg','13.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'14.jpg','14.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'15.jpg','15.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'16.jpg','16.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'17.jpg','17.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'18.jpg','18.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'19.jpg','19.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,5,'20.jpg','20.jpg');

insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'1.jpg','1.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'2.jpg','2.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'3.jpg','3.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'4.jpg','4.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'5.jpg','5.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'6.jpg','6.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'7.jpg','7.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'8.jpg','8.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'9.jpg','9.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'10.jpg','10.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'11.jpg','11.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'12.jpg','12.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'13.jpg','13.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'14.jpg','14.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'15.jpg','15.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'16.jpg','16.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'17.jpg','17.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'18.jpg','18.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'19.jpg','19.jpg');
insert into pension_image
values(SEQ_PENSION_IMG_NO.nextval,4,'20.jpg','20.jpg');

--���ǽü�
insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'�����','�����.png');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'������','������.png');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'TV','TV.png');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'WIFI','WIFI.png');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'��ǿ�ǰ','��ǿ�ǰ.png');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'��Ź��','��Ź��.png');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'����̱�','����̱�.png');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'����','����.png');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'�ݷ��ߵ���','�ݷ��ߵ���.png');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'���ǳ� ��','���ǳ� ��.png');

insert into s_amenities
values(SEQ_S_AMENITIES_NO.nextval,'��簡��','��簡��.png');

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

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,10);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,1,11);


insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,2,1);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,2,2);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,2,3);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,2,4);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,2,5);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,2,6);


insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,3,3);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,3,4);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,3,5);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,3,6);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,3,7);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,3,8); 

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,3,9);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,3,10);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,3,11);


insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,1);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,2);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,3);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,4);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,5);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,6);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,7);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,8); 

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,9);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,10);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,4,11);


insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,1);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,2);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,3);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,4);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,5);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,6);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,7);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,8); 

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,9);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,10);

insert into p_amenities
values(SEQ_P_AMENITIES_NO.nextval,5,11);


--����ü� ����
insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'������','������.png');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'������','������.png');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'ī��','ī��.png');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'�뷡��','�뷡��.png');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'������','������.png');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'������','������.png');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'BBQ','BBQ.png');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'�ֹ�,�Ĵ�','�ֹ�,�Ĵ�.png');

insert into s_public
values(SEQ_S_PUBLIC_NO.nextval,'������','������.png');

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
values(SEQ_P_PUBLIC_NO.nextval,2,6);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,2,7);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,2,8);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,2,9);


insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,3,1);
insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,3,2);
insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,3,4);
insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,3,6);
insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,3,7);
insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,3,8);



insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,4,1);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,4,2);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,4,3);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,4,4);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,4,5);

insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,4,6);


insert into p_public
values(SEQ_P_PUBLIC_NO.nextval,5,1);

----------------------------------------------------------------------
--������
insert into peck
values(SEQ_PECK_NO.nextval,1,'2022-08-01','2022-08-31',1);
insert into peck
values(SEQ_PECK_NO.nextval,1,'2022-09-01','2022-09-20',2);

insert into peck
values(SEQ_PECK_NO.nextval,2,'2022-08-01','2022-08-31',1);
insert into peck
values(SEQ_PECK_NO.nextval,2,'2022-09-01','2022-09-20',2);

insert into peck
values(SEQ_PECK_NO.nextval,3,'2022-08-01','2022-08-31',1);
insert into peck
values(SEQ_PECK_NO.nextval,3,'2022-08-01','2022-08-31',1);

insert into peck
values(SEQ_PECK_NO.nextval,4,'2022-09-01','2022-09-20',2);
insert into peck
values(SEQ_PECK_NO.nextval,4,'2022-08-01','2022-08-31',1);

insert into peck
values(SEQ_PECK_NO.nextval,5,'2022-09-01','2022-09-20',2);
insert into peck
values(SEQ_PECK_NO.nextval,5,'2022-09-01','2022-09-20',2);

--����
insert into rooms
values(SEQ_ROOMS_NO.nextval,1,'�α����',2,4,'�ƹ��͵� �����..','���� ��Ż�Ⱑ��','Y');

insert into rooms
values(SEQ_ROOMS_NO.nextval,1,'�츮��',2,4,'�ƹ��͵� �����222','���� ��Ż�Ⱑ��22','Y');

insert into rooms
values(SEQ_ROOMS_NO.nextval,2,'����',3,4,'�ƹ��͵� �����3333','���� ��Ż�Ⱑ��33','Y');

insert into rooms
values(SEQ_ROOMS_NO.nextval,2,'�����̹�',4,6,'�ƹ��͵� �����4444','���� �Ӹ��о����44','Y');

insert into rooms
values(SEQ_ROOMS_NO.nextval,3,'�����̹�',5,6,'�ƹ��͵� �����555','���� �Ӹ��о����55','Y');

insert into rooms
values(SEQ_ROOMS_NO.nextval,3,'�������',2,5,'�ƹ��͵� �����66','���� �Ӹ��о����66','Y');

insert into rooms
values(SEQ_ROOMS_NO.nextval,4,'�����',3,4,'�ƹ��Ϳ�11','���� ����','Y');

insert into rooms
values(SEQ_ROOMS_NO.nextval,4,'����',4,4,'�ƹ��Ϳ�22','���� ����2','Y');

insert into rooms
values(SEQ_ROOMS_NO.nextval,5,'�Ƕ�',3,4,'�ƹ��Ϳ�11','���� ����','Y');

insert into rooms
values(SEQ_ROOMS_NO.nextval,5,'����',4,4,'�ƹ��Ϳ�22','���� ����2','Y');

--���� �̹���
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,1,'1.jpg','1.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,1,'2.jpg','2.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,1,'3.jpg','3.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,1,'4.jpg','4.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,2,'5.jpg','5.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,2,'6.jpg','6.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,2,'7.jpg','7.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,2,'8.jpg','8.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,3,'9.jpg','9.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,3,'10.jpg','10.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,3,'11.jpg','11.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,4,'3.jpg','3.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,4,'9.jpg','9.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,4,'18.jpg','18.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,4,'20.jpg','20.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,4,'1.jpg','1.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,5,'5.jpg','5.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,5,'6.jpg','6.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,5,'7.jpg','7.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,5,'8.jpg','8.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,5,'9.jpg','9.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,5,'10.jpg','10.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,6,'12.jpg','12.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,6,'13.jpg','13.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,7,'16.jpg','16.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,7,'1.jpg','1.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,7,'6.jpg','6.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,7,'5.jpg','5.jpg');
insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,7,'12.jpg','12.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,8,'20.jpg','20.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,8,'4.jpg','4.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,9,'1.jpg','1.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,9,'6.jpg','6.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,10,'5.jpg','5.jpg');

insert into room_image
values(SEQ_ROOM_IMAGE_NO.nextval,10,'12.jpg','12.jpg');


--���� ���
insert into prices
values(seq_prices_no.nextval,1,3,1,1);

insert into prices
values(seq_prices_no.nextval,1,3,2,2);

insert into prices
values(seq_prices_no.nextval,1,2,1,3);

insert into prices
values(seq_prices_no.nextval,1,2,2,4);

insert into prices
values(seq_prices_no.nextval,1,1,1,5);

insert into prices
values(seq_prices_no.nextval,1,1,2,6);


insert into prices
values(seq_prices_no.nextval,2,3,1,11);

insert into prices
values(seq_prices_no.nextval,2,3,2,22);

insert into prices
values(seq_prices_no.nextval,2,2,1,33);

insert into prices
values(seq_prices_no.nextval,2,2,2,44);

insert into prices
values(seq_prices_no.nextval,2,1,1,55);

insert into prices
values(seq_prices_no.nextval,2,1,2,66);

insert into prices
values(seq_prices_no.nextval,3,3,1,111);

insert into prices
values(seq_prices_no.nextval,3,3,2,222);

insert into prices
values(seq_prices_no.nextval,3,2,1,333);

insert into prices
values(seq_prices_no.nextval,3,2,2,444);

insert into prices
values(seq_prices_no.nextval,3,1,1,555);

insert into prices
values(seq_prices_no.nextval,3,1,2,666);

insert into prices
values(seq_prices_no.nextval,4,3,1,1111);

insert into prices
values(seq_prices_no.nextval,4,3,2,2222);

insert into prices
values(seq_prices_no.nextval,4,2,1,3333);

insert into prices
values(seq_prices_no.nextval,4,2,2,4444);

insert into prices
values(seq_prices_no.nextval,4,1,1,5555);

insert into prices
values(seq_prices_no.nextval,4,1,2,6666);

insert into prices
values(seq_prices_no.nextval,5,3,1,11111);

insert into prices
values(seq_prices_no.nextval,5,3,2,22222);

insert into prices
values(seq_prices_no.nextval,5,2,1,33333);

insert into prices
values(seq_prices_no.nextval,5,2,2,44444);

insert into prices
values(seq_prices_no.nextval,5,1,1,55555);

insert into prices
values(seq_prices_no.nextval,5,1,2,66666);

insert into prices
values(seq_prices_no.nextval,6,3,1,111111);

insert into prices
values(seq_prices_no.nextval,6,3,2,222222);

insert into prices
values(seq_prices_no.nextval,6,2,1,333333);

insert into prices
values(seq_prices_no.nextval,6,2,2,444444);

insert into prices
values(seq_prices_no.nextval,6,1,1,555555);

insert into prices
values(seq_prices_no.nextval,6,1,2,666666);


insert into prices
values(seq_prices_no.nextval,7,3,1,1111111);

insert into prices
values(seq_prices_no.nextval,7,3,2,2222222);

insert into prices
values(seq_prices_no.nextval,7,2,1,3333333);

insert into prices
values(seq_prices_no.nextval,7,2,2,4444444);

insert into prices
values(seq_prices_no.nextval,7,1,1,5555555);

insert into prices
values(seq_prices_no.nextval,7,1,2,6666666);

insert into prices
values(seq_prices_no.nextval,8,3,1,11111111);

insert into prices
values(seq_prices_no.nextval,8,3,2,22222222);

insert into prices
values(seq_prices_no.nextval,8,2,1,33333333);

insert into prices
values(seq_prices_no.nextval,8,2,2,44444444);

insert into prices
values(seq_prices_no.nextval,8,1,1,55555555);

insert into prices
values(seq_prices_no.nextval,8,1,2,66666666);


insert into prices
values(seq_prices_no.nextval,9,3,1,111111111);

insert into prices
values(seq_prices_no.nextval,9,3,2,222222222);

insert into prices
values(seq_prices_no.nextval,9,2,1,333333333);

insert into prices
values(seq_prices_no.nextval,9,2,2,444444444);

insert into prices
values(seq_prices_no.nextval,9,1,1,555555555);

insert into prices
values(seq_prices_no.nextval,9,1,2,666666666);



insert into prices
values(seq_prices_no.nextval,10,3,1,1111111111);

insert into prices
values(seq_prices_no.nextval,10,3,2,2222222222);

insert into prices
values(seq_prices_no.nextval,10,2,1,3333333333);

insert into prices
values(seq_prices_no.nextval,10,2,2,4444444444);

insert into prices
values(seq_prices_no.nextval,10,1,1,5555555555);

insert into prices
values(seq_prices_no.nextval,10,1,2,6666666666);

--����
insert into week
values(seq_week_no.nextval,1,'��');
insert into week
values(seq_week_no.nextval,1,'ȭ');
insert into week
values(seq_week_no.nextval,1,'��');
insert into week
values(seq_week_no.nextval,1,'��');
insert into week
values(seq_week_no.nextval,1,'��');
insert into week
values(seq_week_no.nextval,2,'��');
insert into week
values(seq_week_no.nextval,2,'��');

insert into week
values(seq_week_no.nextval,3,'��');
insert into week
values(seq_week_no.nextval,3,'ȭ');
insert into week
values(seq_week_no.nextval,3,'��');
insert into week
values(seq_week_no.nextval,3,'��');
insert into week
values(seq_week_no.nextval,3,'��');
insert into week
values(seq_week_no.nextval,4,'��');
insert into week
values(seq_week_no.nextval,4,'��');

insert into week
values(seq_week_no.nextval,5,'��');
insert into week
values(seq_week_no.nextval,5,'ȭ');
insert into week
values(seq_week_no.nextval,5,'��');
insert into week
values(seq_week_no.nextval,5,'��');
insert into week
values(seq_week_no.nextval,5,'��');
insert into week
values(seq_week_no.nextval,6,'��');
insert into week
values(seq_week_no.nextval,6,'��');

insert into week
values(seq_week_no.nextval,7,'��');
insert into week
values(seq_week_no.nextval,7,'ȭ');
insert into week
values(seq_week_no.nextval,7,'��');
insert into week
values(seq_week_no.nextval,7,'��');
insert into week
values(seq_week_no.nextval,7,'��');
insert into week
values(seq_week_no.nextval,8,'��');
insert into week
values(seq_week_no.nextval,8,'��');

insert into week
values(seq_week_no.nextval,9,'��');
insert into week
values(seq_week_no.nextval,9,'ȭ');
insert into week
values(seq_week_no.nextval,9,'��');
insert into week
values(seq_week_no.nextval,9,'��');
insert into week
values(seq_week_no.nextval,9,'��');
insert into week
values(seq_week_no.nextval,10,'��');
insert into week
values(seq_week_no.nextval,10,'��');

insert into week
values(seq_week_no.nextval,11,'��');
insert into week
values(seq_week_no.nextval,11,'ȭ');
insert into week
values(seq_week_no.nextval,11,'��');
insert into week
values(seq_week_no.nextval,11,'��');
insert into week
values(seq_week_no.nextval,11,'��');
insert into week
values(seq_week_no.nextval,12,'��');
insert into week
values(seq_week_no.nextval,12,'��');

insert into week
values(seq_week_no.nextval,13,'��');
insert into week
values(seq_week_no.nextval,13,'ȭ');
insert into week
values(seq_week_no.nextval,13,'��');
insert into week
values(seq_week_no.nextval,13,'��');
insert into week
values(seq_week_no.nextval,13,'��');
insert into week
values(seq_week_no.nextval,14,'��');
insert into week
values(seq_week_no.nextval,14,'��');

insert into week
values(seq_week_no.nextval,15,'��');
insert into week
values(seq_week_no.nextval,15,'ȭ');
insert into week
values(seq_week_no.nextval,15,'��');
insert into week
values(seq_week_no.nextval,15,'��');
insert into week
values(seq_week_no.nextval,15,'��');
insert into week
values(seq_week_no.nextval,16,'��');
insert into week
values(seq_week_no.nextval,16,'��');

insert into week
values(seq_week_no.nextval,17,'��');
insert into week
values(seq_week_no.nextval,17,'ȭ');
insert into week
values(seq_week_no.nextval,17,'��');
insert into week
values(seq_week_no.nextval,17,'��');
insert into week
values(seq_week_no.nextval,17,'��');
insert into week
values(seq_week_no.nextval,18,'��');
insert into week
values(seq_week_no.nextval,18,'��');

insert into week
values(seq_week_no.nextval,19,'��');
insert into week
values(seq_week_no.nextval,19,'ȭ');
insert into week
values(seq_week_no.nextval,19,'��');
insert into week
values(seq_week_no.nextval,19,'��');
insert into week
values(seq_week_no.nextval,19,'��');
insert into week
values(seq_week_no.nextval,20,'��');
insert into week
values(seq_week_no.nextval,20,'��');

insert into week
values(seq_week_no.nextval,21,'��');
insert into week
values(seq_week_no.nextval,21,'ȭ');
insert into week
values(seq_week_no.nextval,21,'��');
insert into week
values(seq_week_no.nextval,21,'��');
insert into week
values(seq_week_no.nextval,21,'��');
insert into week
values(seq_week_no.nextval,22,'��');
insert into week
values(seq_week_no.nextval,22,'��');

insert into week
values(seq_week_no.nextval,23,'��');
insert into week
values(seq_week_no.nextval,23,'ȭ');
insert into week
values(seq_week_no.nextval,23,'��');
insert into week
values(seq_week_no.nextval,23,'��');
insert into week
values(seq_week_no.nextval,23,'��');
insert into week
values(seq_week_no.nextval,24,'��');
insert into week
values(seq_week_no.nextval,24,'��');

insert into week
values(seq_week_no.nextval,25,'��');
insert into week
values(seq_week_no.nextval,25,'ȭ');
insert into week
values(seq_week_no.nextval,25,'��');
insert into week
values(seq_week_no.nextval,25,'��');
insert into week
values(seq_week_no.nextval,25,'��');
insert into week
values(seq_week_no.nextval,26,'��');
insert into week
values(seq_week_no.nextval,26,'��');

insert into week
values(seq_week_no.nextval,27,'��');
insert into week
values(seq_week_no.nextval,27,'ȭ');
insert into week
values(seq_week_no.nextval,27,'��');
insert into week
values(seq_week_no.nextval,27,'��');
insert into week
values(seq_week_no.nextval,27,'��');
insert into week
values(seq_week_no.nextval,28,'��');
insert into week
values(seq_week_no.nextval,28,'��');

insert into week
values(seq_week_no.nextval,29,'��');
insert into week
values(seq_week_no.nextval,29,'ȭ');
insert into week
values(seq_week_no.nextval,29,'��');
insert into week
values(seq_week_no.nextval,29,'��');
insert into week
values(seq_week_no.nextval,29,'��');
insert into week
values(seq_week_no.nextval,30,'��');
insert into week
values(seq_week_no.nextval,30,'��');

insert into week
values(seq_week_no.nextval,31,'��');
insert into week
values(seq_week_no.nextval,31,'ȭ');
insert into week
values(seq_week_no.nextval,31,'��');
insert into week
values(seq_week_no.nextval,31,'��');
insert into week
values(seq_week_no.nextval,31,'��');
insert into week
values(seq_week_no.nextval,32,'��');
insert into week
values(seq_week_no.nextval,32,'��');

insert into week
values(seq_week_no.nextval,33,'��');
insert into week
values(seq_week_no.nextval,33,'ȭ');
insert into week
values(seq_week_no.nextval,33,'��');
insert into week
values(seq_week_no.nextval,33,'��');
insert into week
values(seq_week_no.nextval,33,'��');
insert into week
values(seq_week_no.nextval,34,'��');
insert into week
values(seq_week_no.nextval,34,'��');

insert into week
values(seq_week_no.nextval,35,'��');
insert into week
values(seq_week_no.nextval,35,'ȭ');
insert into week
values(seq_week_no.nextval,35,'��');
insert into week
values(seq_week_no.nextval,35,'��');
insert into week
values(seq_week_no.nextval,35,'��');
insert into week
values(seq_week_no.nextval,36,'��');
insert into week
values(seq_week_no.nextval,36,'��');

insert into week
values(seq_week_no.nextval,37,'��');
insert into week
values(seq_week_no.nextval,37,'ȭ');
insert into week
values(seq_week_no.nextval,37,'��');
insert into week
values(seq_week_no.nextval,37,'��');
insert into week
values(seq_week_no.nextval,37,'��');
insert into week
values(seq_week_no.nextval,38,'��');
insert into week
values(seq_week_no.nextval,38,'��');

insert into week
values(seq_week_no.nextval,39,'��');
insert into week
values(seq_week_no.nextval,39,'ȭ');
insert into week
values(seq_week_no.nextval,39,'��');
insert into week
values(seq_week_no.nextval,39,'��');
insert into week
values(seq_week_no.nextval,39,'��');
insert into week
values(seq_week_no.nextval,40,'��');
insert into week
values(seq_week_no.nextval,40,'��');

insert into week
values(seq_week_no.nextval,41,'��');
insert into week
values(seq_week_no.nextval,41,'ȭ');
insert into week
values(seq_week_no.nextval,41,'��');
insert into week
values(seq_week_no.nextval,41,'��');
insert into week
values(seq_week_no.nextval,41,'��');
insert into week
values(seq_week_no.nextval,42,'��');
insert into week
values(seq_week_no.nextval,42,'��');

insert into week
values(seq_week_no.nextval,43,'��');
insert into week
values(seq_week_no.nextval,43,'ȭ');
insert into week
values(seq_week_no.nextval,43,'��');
insert into week
values(seq_week_no.nextval,43,'��');
insert into week
values(seq_week_no.nextval,43,'��');
insert into week
values(seq_week_no.nextval,44,'��');
insert into week
values(seq_week_no.nextval,44,'��');

insert into week
values(seq_week_no.nextval,45,'��');
insert into week
values(seq_week_no.nextval,45,'ȭ');
insert into week
values(seq_week_no.nextval,45,'��');
insert into week
values(seq_week_no.nextval,45,'��');
insert into week
values(seq_week_no.nextval,46,'��');
insert into week
values(seq_week_no.nextval,46,'��');
insert into week
values(seq_week_no.nextval,46,'��');

insert into week
values(seq_week_no.nextval,47,'��');
insert into week
values(seq_week_no.nextval,47,'ȭ');
insert into week
values(seq_week_no.nextval,47,'��');
insert into week
values(seq_week_no.nextval,47,'��');
insert into week
values(seq_week_no.nextval,48,'��');
insert into week
values(seq_week_no.nextval,48,'��');
insert into week
values(seq_week_no.nextval,48,'��');

insert into week
values(seq_week_no.nextval,49,'��');
insert into week
values(seq_week_no.nextval,49,'ȭ');
insert into week
values(seq_week_no.nextval,49,'��');
insert into week
values(seq_week_no.nextval,49,'��');
insert into week
values(seq_week_no.nextval,50,'��');
insert into week
values(seq_week_no.nextval,50,'��');
insert into week
values(seq_week_no.nextval,50,'��');

insert into week
values(seq_week_no.nextval,51,'��');
insert into week
values(seq_week_no.nextval,51,'ȭ');
insert into week
values(seq_week_no.nextval,51,'��');
insert into week
values(seq_week_no.nextval,51,'��');
insert into week
values(seq_week_no.nextval,52,'��');
insert into week
values(seq_week_no.nextval,52,'��');
insert into week
values(seq_week_no.nextval,52,'��');

insert into week
values(seq_week_no.nextval,53,'��');
insert into week
values(seq_week_no.nextval,53,'ȭ');
insert into week
values(seq_week_no.nextval,53,'��');
insert into week
values(seq_week_no.nextval,53,'��');
insert into week
values(seq_week_no.nextval,54,'��');
insert into week
values(seq_week_no.nextval,54,'��');
insert into week
values(seq_week_no.nextval,54,'��');

insert into week
values(seq_week_no.nextval,55,'��');
insert into week
values(seq_week_no.nextval,55,'ȭ');
insert into week
values(seq_week_no.nextval,55,'��');
insert into week
values(seq_week_no.nextval,55,'��');
insert into week
values(seq_week_no.nextval,56,'��');
insert into week
values(seq_week_no.nextval,56,'��');
insert into week
values(seq_week_no.nextval,56,'��');

insert into week
values(seq_week_no.nextval,57,'��');
insert into week
values(seq_week_no.nextval,57,'ȭ');
insert into week
values(seq_week_no.nextval,57,'��');
insert into week
values(seq_week_no.nextval,57,'��');
insert into week
values(seq_week_no.nextval,58,'��');
insert into week
values(seq_week_no.nextval,58,'��');
insert into week
values(seq_week_no.nextval,58,'��');

insert into week
values(seq_week_no.nextval,59,'��');
insert into week
values(seq_week_no.nextval,59,'ȭ');
insert into week
values(seq_week_no.nextval,59,'��');
insert into week
values(seq_week_no.nextval,59,'��');
insert into week
values(seq_week_no.nextval,60,'��');
insert into week
values(seq_week_no.nextval,60,'��');
insert into week
values(seq_week_no.nextval,60,'��');


--����
--���� ���1
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,1,1,'��α�','01025486545','2022-08-05','2022-08-06',2,2,0,190000,SYSDATE,'CARD','�����Ϸ�',3,0,0); --�̿�Ϸ� 1
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,1,1,'���Ű','01088574568','2022-08-26','2022-08-27',2,2,0,210000,SYSDATE,'CARD','�����Ϸ�',1,0,0); --����Ϸ� 2
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,2,2,'���','01023545854','2022-08-26','2022-08-27',2,2,0,210000,SYSDATE,'CARD','�����Ϸ�',6,150000,0); -- �絵��� 3
--��� 2
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,3,1,'�谡��','01033548978','2022-08-24','2022-08-25',2,2,0,200000,SYSDATE,'CARD','�����Ϸ�',1,100000,0); --�絵��� 4
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,3,2,'��⸸��','01099856656','2022-08-26','2022-08-28',2,2,0,250000,SYSDATE,'CARD','�����Ϸ�',3,0,0); --����Ϸ� 5
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,4,2,'��ġ����','010332578598','2022-09-05','2022-09-06',2,2,0,300000,SYSDATE,'CARD','�����Ϸ�',1,0,0); --����Ϸ� 6
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,4,1,'��α�','01023545854','2022-09-15','2022-09-16',2,2,0,800000,SYSDATE,'CARD','�����Ϸ�',1,0,0); --����Ϸ� 7

--���3
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,5,1,'��α�','01055428786','2022-08-05','2022-08-06',2,2,0,350000,SYSDATE,'CARD','�����Ϸ�',3,0,0); --�̿�Ϸ� 8
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,5,1,'��α�','01022578687','2022-08-10','2022-08-12',2,2,0,400000,SYSDATE,'CARD','�����Ϸ�',3,0,0); --�̿�Ϸ� 9
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,6,1,'��α�','0103753578','2022-08-25','2022-08-27',2,2,0,450000,SYSDATE,'CARD','�����Ϸ�',6,250000,0); --�絵��� 10
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,6,1,'��α�','0102537867','2022-09-13','2022-09-15',2,2,0,458000,SYSDATE,'CARD','�����Ϸ�',1,0,0); --����Ϸ� 11
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,6,1,'��α�','01052738687','2022-09-14','2022-09-15',2,2,0,80000,SYSDATE,'CARD','�����Ϸ�',1,0,0); --����Ϸ� 12
--���4
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,7,1,'��α�','01023012023','2022-08-02','2022-08-06',2,2,0,900000,SYSDATE,'CARD','�����Ϸ�',3,0,0); --�̿�Ϸ� 13
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,7,1,'��α�','01012312314','2022-08-23','2022-08-24',2,2,0,1000000,SYSDATE,'CARD','�����Ϸ�',2,0,0); --�̿��� 14
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,8,1,'��α�','0101231234','2022-08-25','2022-08-26',2,2,0,50000,SYSDATE,'CARD','�����Ϸ�',1,0,0); --����Ϸ� 15
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,8,1,'��α�','01099382737','2022-08-30','2022-08-31',2,2,0,70000,SYSDATE,'CARD','�����Ϸ�',1,0,0); --����Ϸ� 16
--���5
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,9,1,'��α�','01029384757','2022-08-25','2022-08-27',2,2,0,180000,SYSDATE,'CARD','�����Ϸ�',6,150000,0); --�絵��� 17
insert into reservations
values(SEQ_RESERVATIONS_NO.nextval,10,1,'��α�','01055123548','2022-08-29','2022-08-31',2,2,0,10000,SYSDATE,'CARD','�����Ϸ�',1,0,0); --����Ϸ� 18


--����Ʈ
insert into points
values(SEQ_POINTS_NO.nextval,1,1900,sysdate);
insert into points
values(SEQ_POINTS_NO.nextval,8,3500,sysdate);
insert into points
values(SEQ_POINTS_NO.nextval,9,4000,sysdate);
insert into points
values(SEQ_POINTS_NO.nextval,13,9000,sysdate);




--����
insert into reviews
values(SEQ_REVIEWS_NO.nextval,1,'�߸𸣰ھ��',1,'','','���� ����������',sysdate);

insert into reviews
values(SEQ_REVIEWS_NO.nextval,8,'�ʹ�����',5,'','','����',sysdate);

insert into reviews
values(SEQ_REVIEWS_NO.nextval,9,'��¥ �Ǹ��������ϴ�.',1,'','','�־��Դϴ�~~~~~~',sysdate);

insert into reviews
values(SEQ_REVIEWS_NO.nextval,13,'��..',3,'','','�׳� �׷����ϴ�.',sysdate);

--������
insert into replys
values(SEQ_REPLYS_NO.nextval,1,'���',sysdate,3); --dddddghkrd gȮ��
insert into replys
values(SEQ_REPLYS_NO.nextval,2,'¯��',sysdate,3); --dddddghkrd gȮ��
insert into replys
values(SEQ_REPLYS_NO.nextval,3,'ȥ����',sysdate,3); --dddddghkrd gȮ��
insert into replys
values(SEQ_REPLYS_NO.nextval,4,'¯�ư��ְ�',sysdate,4); --dddddghkrd gȮ��



commit;
