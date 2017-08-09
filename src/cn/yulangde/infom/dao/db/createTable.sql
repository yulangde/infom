
drop table tbl_article;
drop table tbl_basicInfo;
drop table tbl_category;
drop table tbl_link;
drop table tbl_test;

--文章
create table tbl_article (
	id number(19,0), 
	author varchar2(255 char), 
	clickTimes number(10,0), 
	content varchar2(255 char), 
	publisurDate timestamp, 
	title varchar2(255 char), 
	c_id number(19,0), 
	primary key (id)
	);
					
--基础
create table tbl_basicInfo (
	id number(19,0),
	content varchar2(255 char),
	name varchar2(255 char), 
	copr varchar2(255 char), 
	primary key (id)
	);
--栏目类
create table tbl_category (
	id number(19,0), 
	code number(10,0), 
	name varchar2(255 char), 
	primary key (id)
	);
--友情链接
create table tbl_link (
	id number(19,0), 
	name varchar2(255 char),
	url varchar2(255 char), 
	primary key (id)
	);
--测试 
create table tbl_test (
	id number(19,0),
	name varchar2(255 char), 
	primary key (id)
	);

alter table tbl_article 
	add constraint FKE9859575C06FB1C7 foreign key (c_id) references tbl_category;

	


--网站访问计数
drop sequence cms_seq;
create sequence	tblcms_seq;
create table TBL_COUNT (
	id number(19,0),
	primary key (id)
	);
	
	
drop sequence cms_seq;
create sequence	cms_seq;
col author for a20;
col name for a20;
col url for a20;
col content for a20;
col title for a20;

