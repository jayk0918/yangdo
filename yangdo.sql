---------------------------����---------------------------------------------------

-------����
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
	ceo_hp VARCHAR2(20) NOT NULL, /* �ڵ�����ȣ(��ü) */
	bank_name VARCHAR2(10), /* �������� */
	account_holder VARCHAR2(20), /* ������ */
	account VARCHAR2(100), /* ���¹�ȣ */
	settlement_cycle VARCHAR2(10), /* �����ֱ� */
	tax_Invoice number, /* ���ݰ�꼭���� */
	company_name VARCHAR2(30), /* ��ȣ�� */
	ceo_name VARCHAR2(20), /* ��ǥ�� */
	business_licensenumber VARCHAR2(100), /* ����ڵ�Ϲ�ȣ */
	postal_code VARCHAR2(10), /* �����ȣ */
	company_address VARCHAR2(100), /* ��ü�ּ� */
	detail_address VARCHAR2(100), /* ���ּ� */
	homepage VARCHAR2(100), /* Ȩ������ */
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
	name VARCHAR2(10) /* ���¸� */
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
	name VARCHAR2(10) /* ������ */
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
	postal_code VARCHAR2(10), /* �����ȣ */
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
	check_in VARCHAR2(20), /* üũ�� */
	check_out VARCHAR2(20), /* üũ�ƿ� */
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

COMMENT ON COLUMN pension.cancel_refund IS '��� �� ȯ�� ����';

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
	image_path VARCHAR2(200), /* �̹������ */
	orders NUMBER /* ���� */
);

COMMENT ON TABLE pension_image IS '�Ҽ��̹���';

COMMENT ON COLUMN pension_image.no IS '�Ҽ��̹�����ȣ';

COMMENT ON COLUMN pension_image.pension_no IS '��ǹ�ȣ';

COMMENT ON COLUMN pension_image.image_path IS '�̹������';

COMMENT ON COLUMN pension_image.orders IS '����';

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
	name VARCHAR2(30) /* ���ǽü��� */
);

COMMENT ON TABLE s_amenities IS '���ǽü� ����';

COMMENT ON COLUMN s_amenities.no IS '���ǽü����񽺹�ȣ';

COMMENT ON COLUMN s_amenities.name IS '���ǽü���';

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
	name VARCHAR2(30) /* ����ü��� */
);

COMMENT ON TABLE s_public IS '����ü� ����';

COMMENT ON COLUMN s_public.no IS '����ü����񼭹�ȣ';

COMMENT ON COLUMN s_public.name IS '����ü���';

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
-- �ؼ�����
create sequence seq_sub_peck_no
increment by 1
start with 1
nocache;


CREATE TABLE sub_peck (
	no NUMBER NOT NULL, /* �ؼ����� ��ȣ */
	sub_peck_start DATE, /* �ؼ����� ���� */
	sub_peck_end DATE /* �ؼ����� �� */
);

COMMENT ON TABLE sub_peck IS '�ؼ�����';

COMMENT ON COLUMN sub_peck.no IS '�ؼ����� ��ȣ';

COMMENT ON COLUMN sub_peck.sub_peck_start IS '�ؼ����� ����';

COMMENT ON COLUMN sub_peck.sub_peck_end IS '�ؼ����� ��';

CREATE UNIQUE INDEX PK_sub_peck
	ON sub_peck (
		no ASC
	);

ALTER TABLE sub_peck
	ADD
		CONSTRAINT PK_sub_peck
		PRIMARY KEY (
			no
		);

--��� �ؼ�����
create sequence seq_p_sub_peck_no
increment by 1
start with 1
nocache;


CREATE TABLE p_sub_peck (
	no NUMBER NOT NULL, /* ������ �ؼ����� ��ȣ */
	pension_no NUMBER, /* ��ǹ�ȣ */
	sub_peck_no NUMBER /* �ؼ����� ��ȣ */
);

COMMENT ON TABLE p_sub_peck IS '�Ҽ��ؼ�����';

COMMENT ON COLUMN p_sub_peck.no IS '������ �ؼ����� ��ȣ';

COMMENT ON COLUMN p_sub_peck.pension_no IS '��ǹ�ȣ';

COMMENT ON COLUMN p_sub_peck.sub_peck_no IS '�ؼ����� ��ȣ';

CREATE UNIQUE INDEX PK_p_sub_peck
	ON p_sub_peck (
		no ASC
	);

ALTER TABLE p_sub_peck
	ADD
		CONSTRAINT PK_p_sub_peck
		PRIMARY KEY (
			no
		);

ALTER TABLE p_sub_peck
	ADD
		CONSTRAINT FK_sub_peck_TO_p_sub_peck
		FOREIGN KEY (
			sub_peck_no
		)
		REFERENCES sub_peck (
			no
		);

ALTER TABLE p_sub_peck
	ADD
		CONSTRAINT FK_pension_TO_p_sub_peck
		FOREIGN KEY (
			pension_no
		)
		REFERENCES pension (
			no
		);

--������
create sequence seq_peck_no
increment by 1
start with 1
nocache;


CREATE TABLE peck (
	no NUMBER NOT NULL, /* ������ ��ȣ */
	peck_start DATE, /* ������ ���� */
	peck_end DATE /* ������ �� */
);

COMMENT ON TABLE peck IS '������';

COMMENT ON COLUMN peck.no IS '������ ��ȣ';

COMMENT ON COLUMN peck.peck_start IS '������ ����';

COMMENT ON COLUMN peck.peck_end IS '������ ��';

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

--��� ������
create sequence seq_p_peck_no
increment by 1
start with 1
nocache;


CREATE TABLE p_peck (
	no NUMBER NOT NULL, /* ��� ������ ��ȣ */
	pension_no NUMBER, /* ��ǹ�ȣ */
	peck_no NUMBER /* ������ ��ȣ */
);

COMMENT ON TABLE p_peck IS '�ҼǼ�����';

COMMENT ON COLUMN p_peck.no IS '��� ������ ��ȣ';

COMMENT ON COLUMN p_peck.pension_no IS '��ǹ�ȣ';

COMMENT ON COLUMN p_peck.peck_no IS '������ ��ȣ';

CREATE UNIQUE INDEX PK_p_peck
	ON p_peck (
		no ASC
	);

ALTER TABLE p_peck
	ADD
		CONSTRAINT PK_p_peck
		PRIMARY KEY (
			no
		);

ALTER TABLE p_peck
	ADD
		CONSTRAINT FK_peck_TO_p_peck
		FOREIGN KEY (
			peck_no
		)
		REFERENCES peck (
			no
		);

ALTER TABLE p_peck
	ADD
		CONSTRAINT FK_pension_TO_p_peck
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
	image_path VARCHAR2(100) /* ��� */
);

COMMENT ON TABLE room_image IS '�����̹���';

COMMENT ON COLUMN room_image.no IS '�����̹�����ȣ';

COMMENT ON COLUMN room_image.rooms_no IS '���ǹ�ȣ';

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
	rooms_no NUMBER, /* ���ǹ�ȣ */
	sortation VARCHAR2(10), /* ����(��,��,��) */
	price NUMBER, /* ����(5000) */
	monday VARCHAR2(10), /* �� */
	tuesday VARCHAR2(10), /* ȭ */
	wednesday VARCHAR2(10), /* �� */
	thursday VARCHAR2(10), /* �� */
	friday VARCHAR2(10), /* �� */
	saturday VARCHAR2(10), /* �� */
	sunday VARCHAR2(10) /* �� */
);

COMMENT ON TABLE prices IS '���';

COMMENT ON COLUMN prices.no IS '��ȣ';

COMMENT ON COLUMN prices.rooms_no IS '���ǹ�ȣ';

COMMENT ON COLUMN prices.sortation IS '����(��,��,��)';

COMMENT ON COLUMN prices.price IS '����(5000)';

COMMENT ON COLUMN prices.monday IS '��';

COMMENT ON COLUMN prices.tuesday IS 'ȭ';

COMMENT ON COLUMN prices.wednesday IS '��';

COMMENT ON COLUMN prices.thursday IS '��';

COMMENT ON COLUMN prices.friday IS '��';

COMMENT ON COLUMN prices.saturday IS '��';

COMMENT ON COLUMN prices.sunday IS '��';

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
			rooms_no
		)
		REFERENCES rooms (
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
	name VARCHAR2(10) NOT NULL, /* �������̸� */
	hp VARCHAR2(20) NOT NULL, /* �޴�����ȣ */
	check_in VARCHAR2(20) NOT NULL, /* üũ�γ�¥ */
	check_out VARCHAR2(20) NOT NULL, /* üũ�ƿ���¥ */
	adult NUMBER NOT NULL, /* ���� */
	kid NUMBER, /* �Ƶ� */
	baby NUMBER, /* ������ */
	total_price NUMBER NOT NULL, /* �Ѱ��� */
	reg_date DATE NOT NULL, /* ����� */
	pay_way VARCHAR2(20) NOT NULL, /* �������� */
	pay_status VARCHAR2(20), /* �������� */
	status VARCHAR2(100), /* ������� */
	trans_price VARCHAR2(20), /* �絵���� */
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
	point VARCHAR2(20), /* �ݾ� */
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








------����---------------------------------------------------------------------

---����
DROP INDEX PK_users;

DROP TABLE users 
	CASCADE CONSTRAINTS;

drop sequence seq_users_no;

--��ü
DROP INDEX PK_company;

DROP TABLE company 
	CASCADE CONSTRAINTS;
    
drop sequence seq_company_no;

--����
DROP INDEX PK_business_type;

DROP TABLE business_type 
	CASCADE CONSTRAINTS;
    
drop sequence seq_business_type_no;

--��ü����
DROP INDEX PK_c_b_type;

DROP TABLE c_b_type 
	CASCADE CONSTRAINTS;

drop sequence seq_cbt_no; -- cbt = company_business_type

--����
DROP INDEX PK_business_group;

DROP TABLE business_group 
	CASCADE CONSTRAINTS;

drop sequence seq_business_group_no;

-- ��ü ����
DROP INDEX PK_c_b_group;

DROP TABLE c_b_group 
	CASCADE CONSTRAINTS;

drop sequence seq_cbg_no;  -- cbg = company_business_group


--���

DROP INDEX PK_pension;

DROP TABLE pension 
	CASCADE CONSTRAINTS;
    
drop sequence seq_pension_no;    

--����̹���
DROP INDEX PK_pension_image;

DROP TABLE pension_image 
	CASCADE CONSTRAINTS;

drop sequence seq_pension_img_no;

--���ǽü� ���� 
DROP INDEX PK_s_amenities;

DROP TABLE s_amenities 
	CASCADE CONSTRAINTS;

drop sequence seq_s_amenities_no;

--��� ���ǽü�
DROP INDEX PK_p_amenities;

DROP TABLE p_amenities 
	CASCADE CONSTRAINTS;

drop sequence seq_p_amenities_no;

--����ü� ����
DROP INDEX PK_s_public;

DROP TABLE s_public 
	CASCADE CONSTRAINTS;

drop sequence seq_s_public_no;

--��� ����ü�
DROP INDEX PK_p_public;

DROP TABLE p_public 
	CASCADE CONSTRAINTS;
    
drop sequence seq_p_public_no;

--�ؼ�����
DROP INDEX PK_sub_peck;

DROP TABLE sub_peck 
	CASCADE CONSTRAINTS;

drop sequence seq_sub_peck_no;

--��� �ؼ�����
DROP INDEX PK_p_sub_peck;

DROP TABLE p_sub_peck 
	CASCADE CONSTRAINTS;

drop sequence seq_p_sub_peck_no;

--������
DROP INDEX PK_peck;

DROP TABLE peck 
	CASCADE CONSTRAINTS;
    
drop sequence seq_peck_no;

--��� ������
DROP INDEX PK_p_peck;

DROP TABLE p_peck 
	CASCADE CONSTRAINTS;

drop sequence seq_p_peck_no;

--����
DROP INDEX PK_rooms;

DROP TABLE rooms 
	CASCADE CONSTRAINTS;

drop sequence seq_rooms_no;
    

--���� �̹���
DROP INDEX PK_room_image;

DROP TABLE room_image 
	CASCADE CONSTRAINTS;

drop sequence seq_room_image_no;

--���ǿ��
DROP INDEX PK_prices;

DROP TABLE prices 
	CASCADE CONSTRAINTS;

drop sequence seq_prices_no;

--����
DROP INDEX PK_reservations;

DROP TABLE reservations 
	CASCADE CONSTRAINTS;

drop sequence seq_reservations_no;

--����Ʈ
DROP INDEX PK_points;

DROP TABLE points 
	CASCADE CONSTRAINTS;

drop sequence seq_points_no;

--����
DROP INDEX PK_reviews;

DROP TABLE reviews 
	CASCADE CONSTRAINTS;

drop sequence seq_reviews_no;

--���� ���
DROP INDEX PK_replys;

DROP TABLE replys 
	CASCADE CONSTRAINTS;

drop sequence seq_replys_no;