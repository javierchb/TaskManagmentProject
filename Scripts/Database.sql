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
	FOREIGN KEY (IdGChildTsk) REFERENCES tc_task_grandchild(IdChildTsk)
);

