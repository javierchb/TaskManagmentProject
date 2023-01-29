create table tb_task_state(
	IdStateTsk INTEGER NOT NULL PRIMARY KEY,
	StateTskDescription VARCHAR(100) NOT NULL
);

create table tb_task_complexity(
	IdComplexTsk INTEGER NOT NULL PRIMARY KEY,
	ComplexTskDescription VARCHAR(100) NOT NULL
);


create table tb_type_task(
	IdTypeTsk INTEGER NOT NULL PRIMARY KEY,
	TypeTskDescription VARCHAR(100) NOT NULL
);

create table tb_type_user(
	IdTypeUsr INTEGER NOT NULL PRIMARY KEY,
	TypeUsrDescription VARCHAR(100) NOT NULL
);

create table tg_user(
	IdUsr INTEGER NOT NULL PRIMARY KEY,
	Names VARCHAR(100) NOT NULL,
	Lastname1 VARCHAR(100) NOT NULL,
	Lastname2 VARCHAR(100) NOT NULL,
	Username VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Phone VARCHAR(100) NOT NULL,
	UserPassword VARCHAR(100) NOT NULL
);

create table tg_group_task(
	IdGroupTsk INTEGER NOT NULL PRIMARY KEY,
	GroupTskDescription VARCHAR(100) NOT NULL ,
	GroupTskState INTEGER NOT NULL 
);




create table tg_task(
	IdTsk INTEGER NOT NULL PRIMARY KEY,
	TskDescription VARCHAR(100) NOT NULL,
	TskObservation VARCHAR(250) NOT NULL,
	TskCreatedDate DATETIME NOT NULL,
	TskEndDate DATETIME NOT NULL,
	TskCompletedDate DATETIME NOT NULL
);

create table tc_task_child(
	IdChildTsk INTEGER NOT NULL PRIMARY KEY,
	ChildTskDescription VARCHAR(100) NOT NULL,	
)

create table tc_task_grandchild(
	IdGChildTsk INTEGER NOT NULL PRIMARY KEY,
	GChildTskDescription VARCHAR(100) NOT NULL
);

create table tr_task_taskchild(
	IdTsk INTEGER NOT NULL,
	IdChildTsk INTEGER NOT NULL,		
	FOREIGN KEY (IdTsk) REFERENCES tg_task(IdTsk),
	FOREIGN KEY (IdChildTsk) REFERENCES tc_task_child(IdChildTsk)
);

alter table tr_task_taskchild
add constraint pk_task_taskchild primary key (IdTsk, IdChildTsk)

create table tr_taskchild_taskgrandchild(
	IdChildTsk INTEGER NOT NULL,
	IdGChildTsk INTEGER NOT NULL,
	FOREIGN KEY (IdChildTsk) REFERENCES tc_task_child(IdChildTsk),
	FOREIGN KEY (IdGChildTsk) REFERENCES tc_task_grandchild(IdGChildTsk)
);

alter table tr_taskchild_taskgrandchild
add constraint pk_taskchild_taskgchild primary key (IdChildTsk, IdGChildTsk)



select * from tg_task;

select * from tc_task_child;

select * from tc_task_grandchild;

insert into tg_task(IdTsk, TskDescription, TskObservation, TskCreatedDate, TskEndDate, TskCompletedDate) values (1, 'Homeworks', 'Keep order & clean house rooms', '2023-01-28','2024-01-28', '2024-01-28');

insert into tc_task_child(IdChildTsk, ChildTskDescription) values (1, 'Principal room');
insert into tc_task_child(IdChildTsk, ChildTskDescription) values (2, 'Office room');
insert into tc_task_child(IdChildTsk, ChildTskDescription) values (3, 'Bathroom');
insert into tc_task_child(IdChildTsk, ChildTskDescription) values (4, 'Kitchen');
insert into tc_task_child(IdChildTsk, ChildTskDescription) values (5, 'Living room');

insert into tc_task_grandchild(IdGChildTsk, GChildTskDescription) values(1, 'Clean desktop');
insert into tc_task_grandchild(IdGChildTsk, GChildTskDescription) values(2, 'Clean floor');
insert into tc_task_grandchild(IdGChildTsk, GChildTskDescription) values(3, 'Clean accesories (Keyboard, mouse, mousepad, etc.)');
insert into tc_task_grandchild(IdGChildTsk, GChildTskDescription) values(4, 'Order desktop');

select * from tr_taskchild_taskgrandchild;

insert into tr_taskchild_taskgrandchild(IdChildTsk, IdGChildTsk) values (2,1);
insert into tr_taskchild_taskgrandchild(IdChildTsk, IdGChildTsk) values (2,2);
insert into tr_taskchild_taskgrandchild(IdChildTsk, IdGChildTsk) values (2,3);
insert into tr_taskchild_taskgrandchild(IdChildTsk, IdGChildTsk) values (2,4);

select * from tr_task_taskchild;

insert into tr_task_taskchild (IdTsk, IdChildTsk) values (1, 1);
insert into tr_task_taskchild (IdTsk, IdChildTsk) values (1, 2);
insert into tr_task_taskchild (IdTsk, IdChildTsk) values (1, 3);
insert into tr_task_taskchild (IdTsk, IdChildTsk) values (1, 4);
insert into tr_task_taskchild (IdTsk, IdChildTsk) values (1, 5);

-- Select child task from Homework (IdTsk = 1)
select * from tc_task_child tc inner join tr_task_taskchild ttc on (tc.IdChildTsk = ttc.IdChildTsk)
where ttc.IdTsk = 1;
-- select grandchild task for every child task belong to a father task.
select t.IdTsk, t.TskDescription, t.TskObservation, tc.IdChildTsk, tc.ChildTskDescription, tgc.IdGChildTsk, tgc.GChildTskDescription 
from tc_task_grandchild tgc 
inner join tr_taskchild_taskgrandchild tctgc on (tgc.IdGChildTsk = tctgc.IdGChildTsk)
inner join tc_task_child tc on (tctgc.IdChildTsk = tc.IdChildTsk)
inner join tr_task_taskchild ttc on (tctgc.IdChildTsk = ttc.IdChildTsk)
inner join tg_task t on (ttc.IdTsk = t.IdTsk)
where ttc.IdTsk = 1
and tc.IdChildTsk = 2;


select * from tg_task;



create table tb_task_periodicity(
	IdTskPeriod INTEGER NOT NULL PRIMARY KEY,
	TskPeriodValue VARCHAR(25) NOT NULL
)

insert into tb_task_periodicity(IdTskPeriod, TskPeriodValue) values (1,'1');
insert into tb_task_periodicity(IdTskPeriod, TskPeriodValue) values (2,'2');
insert into tb_task_periodicity(IdTskPeriod, TskPeriodValue) values (3,'3');
insert into tb_task_periodicity(IdTskPeriod, TskPeriodValue) values (4,'4');
insert into tb_task_periodicity(IdTskPeriod, TskPeriodValue) values (5,'5');
insert into tb_task_periodicity(IdTskPeriod, TskPeriodValue) values (6,'6');
insert into tb_task_periodicity(IdTskPeriod, TskPeriodValue) values (7,'7');

-- Task
alter table tg_task
add IdTskPeriod INTEGER;

alter table tg_task
add constraint fk_TskPeriod_Tsk
foreign key (IdTskPeriod) references tb_task_periodicity(IdTskPeriod);

alter table tg_task
add TskPeriodDays VARCHAR(25);

-- child task
alter table tc_task_child
add IdTskPeriod INTEGER;

alter table tc_task_child
add constraint fk_TskPeriod_TskChild
foreign key (IdTskPeriod) references tb_task_periodicity(IdTskPeriod);

alter table tc_task_child
add TskPeriodDays VARCHAR(25);

-- grandchild task
alter table tc_task_grandchild
add IdTskPeriod INTEGER;

alter table tc_task_grandchild
add constraint fk_TskPeriod_TskGrandchild
foreign key (IdTskPeriod) references tb_task_periodicity(IdTskPeriod);

alter table tc_task_grandchild
add TskPeriodDays VARCHAR(25);








