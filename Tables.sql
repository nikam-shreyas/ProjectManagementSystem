create database wtl;

use wtl;

create table UserValidationTable(id varchar(11), password varchar(100), role varchar(10));

insert into UserValidationTable values('C2K12345671','123456', 'student');
insert into UserValidationTable values('C2K12345672','123456', 'student');
insert into UserValidationTable values('C2K12345679','123456', 'student');
insert into UserValidationTable values('P2K12345671','123456', 'guide');
insert into UserValidationTable values('P2K12345672','123456', 'guide');
insert into UserValidationTable values('C2K12345673','123456', 'admin');
insert into UserValidationTable values('C2K12345674','123456', 'pct');

create table TeamInfoTable(id varchar(11), st1name varchar(200), st1roll varchar(20), st2name varchar(200), st2roll varchar(20), st3name varchar(200), st3roll varchar(20), st4name varchar(200), st4roll varchar(20));

insert into TeamInfoTable values('C2K12345672','Anish','31106', 'Apoorv', '31107', 'Ashutosh','31245',null,null);
insert into TeamInfoTable values('C2K12345679','Nirvi', '31176', 'Ashwin', '31116', null,null,null,null);
insert into TeamInfoTable values('C2K12345671','Anagha', '31242', 'Shreyas', '31241', 'Prathamesh','31239','Natasha','31240');

create table SynopsisTable(id varchar(11), proj_title varchar(200), proj_statement varchar(2000), proj_context varchar(2000),proj_concept varchar(3000), status char(1) default 'P'); 

insert into SynopsisTable values('C2K12345671', 'WTL', 'Project Management System', 'Mini Project for Academic Year 2019-2020', 'Platform for end-to-end B.E. Project Management.', 'A');

create table HardwareReq(id varchar(11), req1 varchar(100), req2 varchar(100), req3 varchar(100), req4 varchar(100), req5 varchar(100), req6 varchar(100), req7 varchar(100), req8 varchar(100), req9 varchar(100), req10 varchar(100));

create table SoftwareReq(id varchar(11), req1 varchar(100), req2 varchar(100), req3 varchar(100), req4 varchar(100), req5 varchar(100), req6 varchar(100), req7 varchar(100), req8 varchar(100), req9 varchar(100), req10 varchar(100));

create table ReferencesTable(id varchar(11), ref1 varchar(1000), ref2 varchar(1000), ref3 varchar(1000), ref4 varchar(1000), ref5 varchar(1000), ref6 varchar(1000), ref7 varchar(1000), ref8 varchar(1000), ref9 varchar(1000), ref10 varchar(1000), ref11 varchar(1000), ref12 varchar(1000), ref13 varchar(1000), ref14 varchar(1000), ref15 varchar(1000), ref16 varchar(1000), ref17 varchar(1000), ref18 varchar(1000), ref19 varchar(1000), ref20 varchar(1000));

create table GuidesTable(id varchar(20), name varchar(100), grpcount int);

insert into GuidesTable values
('P2K12345671','Dr._Sarang_A_Joshi',0),
('P2K12345672','Dr._Rajesh_Baliram_Ingle',0),
('P2K12345673','Dr._Balwant_Ambadas_Sonkamble',0),
('P2K12345674','Dr._Girish_Pandurang_Potdar',0),
('P2K12345675','Dr._Sheetal_Sagar_Sonawane',0),
('P2K12345676','Dr._Archana_Santosh_Ghotkar',0),
('P2K12345677','Rekha_A_kulkarni',0),
('P2K12345678','Kalyani_C_Waghmare',0),
('P2K12345679','Dr.Geetanjali_Vinayak_Kale',0),
('P2K12345680','Dr._Arati_R._Deshpande',0),
('P2K12345681','Anupama_G._Phakatkar',0),
('P2K12345682','PREETI_ANAND_JAIN',0),
('P2K12345683','Pranjali_Prashant_Joshi',0),
('P2K12345684','Madhuri_Sachin_Wakode',0),
('P2K12345685','Pravin_Ramdas_Patil',0),
('P2K12345686','Pujashree_Satish_Vidap',0),
('P2K12345687','Pravin_S._Game',0),
('P2K12345688','Shital_Nayan_Girme',0),
('P2K12345689','Dr._Amar_Ramesh_Buchade',0),
('P2K12345690','Ratnamala_S_Paswan',0),
('P2K12345691','Ashwini_Arunrao_Jewalikar',0),
('P2K12345692','Hemlata_P_Channe',0),
('P2K12345693','S_S_Shevtekar',0),
('P2K12345694','Arundhati_Atul_Chandorkar',0),
('P2K12345695','Yogesh_Ashok_Handge',0),
('P2K12345696','VIRENDRA_VISHNUDAS_BAGADE',0),
('P2K12345697','Mayur_Subhash_Chavan',0),
('P2K12345698','Dipali_Dattatray_Kadam',0),
('P2K12345699','Bhushan_Dhanraj_Zope',0),
('P2K12345700','Amit_R._Sharma',0),
('P2K12345701','Ranjeet_Vasant_Bidwe',0),
('P2K12345702','Priyanka_Richhpal_Makkar',0),
('P2K12345703','Snehal_Parag_Shintre',0),
('P2K12345704','Deepak_Tatyasaheb_Mane',0),
('P2K12345705','Parag_Jaygopal_Jambhulkar',0),
('P2K12345706','Pavan_Ramlal_Jaiswal',0),
('P2K12345707','Pallavi_Sanjay_Joshi',0),
('P2K12345708','Urmila_Shrikant_Pawar',0),
('P2K12345709','Sudhakar_Narse_Reddy',0),
('P2K12345710','SWARUPKUMAR_SHIVAJI_SURADKAR',0),
('P2K12345711','Rutuja_Abhijit_Kulkarni',0),
('P2K12345712','MANISH_RAVINDRA_JANSARI',0),
('P2K12345713','BHUMESH_PURUSHOTTAM_MASRAM',0),
('P2K12345714','Dr._Sunil_D._Kale',0),
('P2K12345715','Nikita_Jayantibhai_Bhalani',0);
create table GuidePreferences(id varchar(20), pref1 varchar(20), status1 char(1) , pref2 varchar(20), status2 char(1), pref3 varchar(20), status3 char(1), spdetails varchar(1000), extgd varchar(1000));

insert into GuidePreferences values('C2K12345671', 'P2K12345671', 'A', 'P2K12345672', 'P', 'P2K12345673', 'P', 'asdfghj', 'ertyuio');

create table CurrentAppliedGuide(id varchar(20), guide varchar(20));

insert into CurrentAppliedGuide values('C2K12345671', 'P2K12345671');

create table DeadlinesTable(name varchar(20), deadline date, buttonstate varchar(3));

insert into DeadlinesTable values('TeamInfo','11/04/20','on');
insert into DeadlinesTable values('Synopsis','11/05/20','on');
insert into DeadlinesTable values('Guide',null,'on');
insert into DeadlinesTable values('Report',null,'on');

create table PublicNoticeTable(pub_date date, notice varchar(10000),filename varchar(100), fileup blob);

create table PrivateNoticeTable(id varchar(20), pub_date date, notice varchar(10000));
insert into PrivateNoticeTable values('C2K12345671', '04/12/2019', 'P2K12345671 has been allocated as your guide.');

create table ReportsTable(id varchar(11), gid varchar(20), content BLOB);

insert into ReportsTable values('C2K12345671','P2K12345671','Hello World');

create table Projects(id varchar(11), guide varchar(20));

insert into Projects values('C2K12345671', 'P2K12345671');

create table ChatsTable(id varchar(20), msg_date date, msg_time time, msg varchar(2000));

insert into ChatsTable values('C2K12345671', '2020/03/12', '21:06:09', 'Guide: Change the header');

