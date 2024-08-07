DROP TABLE jjim;
DROP TABLE cart;
DROP TABLE qna;
DROP TABLE review;
DROP TABLE ordered;
DROP TABLE product;
DROP TABLE member;

CREATE TABLE member (
	member_id	varchar2(20)		NOT NULL,
	member_no	number		NOT NULL,
	member_pw	varchar2(20)		NOT NULL,
	member_name	varchar2(20)		NOT NULL,
	email	varchar2(50)		NULL,
	phone	varchar2(20)		NULL,
	created_date	date	DEFAULT sysdate	NULL,
	management	char(2)	DEFAULT 'U'	NULL,
	addr_no	varchar2(20)		NULL,
	addr_local	varchar2(50)		NULL,
	addr_road	varchar2(50)		NULL,
	addr_det	varchar2(50)		NULL
);

CREATE TABLE product (
	product_no	number		NOT NULL,
	member_id	varchar2(20)		NOT NULL,
	product_name	varchar2(200)		NOT NULL,
	image	varchar2(100)		NOT NULL,
	price	number		NOT NULL,
	category_name	varchar2(50)		NOT NULL,
	create_date	date	DEFAULT sysdate	NOT NULL,
	stock	number		NOT NULL,
	main_info	varchar2(4000)		NULL,
	semi_info	varchar2(100)		NULL,
	discount	number		NULL,
	sales	number		NULL
);
 

CREATE TABLE cart (
	cart_no	number		NOT NULL,
	product_no	number		NOT NULL,
	member_id	varchar2(20)		NOT NULL,
	count	number  DEFAULT 1		NULL
);



CREATE TABLE qna (
	qna_no	number		NOT NULL,
	product_no	number		NOT NULL,
	member_id	varchar2(20)		NOT NULL,
	qna_title	varchar2(50)		NOT NULL,
	qna_content	varchar2(200)		NOT NULL,
	qna_answer	varchar2(200)		NULL
);



CREATE TABLE jjim (
	member_id	varchar2(20)		NOT NULL,
	product_no	number		NOT NULL
);


CREATE TABLE review (
	review_no	number		NOT NULL,
	product_no	number		NOT NULL,
	member_id	varchar2(20)		NOT NULL,
	review_content	varchar2(200)		NULL,
	review_score	number		NULL,
	review_image	varchar2(100)		NULL,
	create_date	date	DEFAULT sysdate	NULL
);



CREATE TABLE ordered (
	order_no	number		NOT NULL,
	member_id	varchar2(20)		NOT NULL,
	product_no	number		NOT NULL,
	count	number		NOT NULL,
	how_much	number		NOT NULL,
	bought_date	date	DEFAULT sysdate	NULL,
	Order_Sta	number	DEFAULT 1	NULL,
	order_pak	varchar2(20)		NOT NULL
);


ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	member_id
);

ALTER TABLE product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	product_no
);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (
	cart_no
);

ALTER TABLE qna ADD CONSTRAINT PK_QNA PRIMARY KEY (
	qna_no
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	review_no
);

ALTER TABLE ordered ADD CONSTRAINT PK_ORDERED PRIMARY KEY (
	order_no
);

ALTER TABLE product ADD CONSTRAINT FK_member_TO_product_1 FOREIGN KEY (
	member_id
)
REFERENCES member (
	member_id
);

ALTER TABLE cart ADD CONSTRAINT FK_product_TO_cart_1 FOREIGN KEY (
	product_no
)
REFERENCES product (
	product_no
);

ALTER TABLE cart ADD CONSTRAINT FK_member_TO_cart_1 FOREIGN KEY (
	member_id
)
REFERENCES member (
	member_id
);

ALTER TABLE qna ADD CONSTRAINT FK_product_TO_qna_1 FOREIGN KEY (
	product_no
)
REFERENCES product (
	product_no
);

ALTER TABLE qna ADD CONSTRAINT FK_member_TO_qna_1 FOREIGN KEY (
	member_id
)
REFERENCES member (
	member_id
);

ALTER TABLE jjim ADD CONSTRAINT FK_member_TO_jjim_1 FOREIGN KEY (
	member_id
)
REFERENCES member (
	member_id
);

ALTER TABLE jjim ADD CONSTRAINT FK_product_TO_jjim_1 FOREIGN KEY (
	product_no
)
REFERENCES product (
	product_no
);

ALTER TABLE review ADD CONSTRAINT FK_product_TO_review_1 FOREIGN KEY (
	product_no
)
REFERENCES product (
	product_no
);

ALTER TABLE review ADD CONSTRAINT FK_member_TO_review_1 FOREIGN KEY (
	member_id
)
REFERENCES member (
	member_id
);

ALTER TABLE ordered ADD CONSTRAINT FK_member_TO_ordered_1 FOREIGN KEY (
	member_id
)
REFERENCES member (
	member_id
);

ALTER TABLE ordered ADD CONSTRAINT FK_product_TO_ordered_1 FOREIGN KEY (
	product_no
)
REFERENCES product (
	product_no
);


create SEQUENCE member_seq;
create SEQUENCE product_seq;
create SEQUENCE cart_seq;
create SEQUENCE jjim_seq;
create SEQUENCE ordered_seq;
create SEQUENCE qna_seq;
create SEQUENCE review_seq;

insert into member(member_no, member_id, member_name, member_pw, management)
values(member_seq.nextval, 'admin', '관리자', 'admin', 'A');

insert into member(member_no, member_id, member_name, member_pw)
values(member_seq.nextval, 'user01', '사용자', '1111');

insert into product
values(product_seq.nextval, 'user01', '아쿠아 오아시스 젤', 'aquaOasisGel', '12000', '스킨케어', sysdate, 100, null, null, null, null);

select * from member;