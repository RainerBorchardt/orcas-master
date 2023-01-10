create table EMP_RANGE2
(
  EMPLOYEE_ID number(6),
  FIRST_NAME varchar2(20),
  LAST_NAME varchar2(25) not null,
  EMAIL varchar2(25) not null,
  PHONE_NUMBER varchar2(20),
  HIRE_DATE date not null,
  JOB_ID varchar2(10) not null,
  SALARY number(8,2),
  COMMISSION_PCT number(2,2),
  MANAGER_ID number(6),
  DEPARTMENT_ID number(4),

  constraint EMP_EMAIL_NN2 check ("\"EMAIL\" IS NOT NULL"),
  constraint EMP_HIRE_DATE_NN2 check ("\"HIRE_DATE\" IS NOT NULL"),
  constraint EMP_JOB_NN2 check ("\"JOB_ID\" IS NOT NULL"),
  constraint EMP_LAST_NAME_NN2 check ("\"LAST_NAME\" IS NOT NULL")
)
partition by range (HIRE_DATE)
    subpartition by hash (DEPARTMENT_ID)
(
  partition EMP_P1 values less than ("TO_DATE(' 1992-01-01 00:00:00'","'SYYYY-MM-DD HH24:MI:SS'","'NLS_CALENDAR=GREGORIAN')")
(
  subpartition SYS_SUBP876 tablespace USERS,
  subpartition SYS_SUBP877 tablespace USERS,
  subpartition SYS_SUBP878 tablespace USERS
),
  partition EMP_P2 values less than ("TO_DATE(' 1994-01-01 00:00:00'","'SYYYY-MM-DD HH24:MI:SS'","'NLS_CALENDAR=GREGORIAN')")
(
  subpartition SYS_SUBP879 tablespace USERS,
  subpartition SYS_SUBP880 tablespace USERS,
  subpartition SYS_SUBP881 tablespace USERS
),
  partition EMP_P3 values less than ("TO_DATE(' 1996-01-01 00:00:00'","'SYYYY-MM-DD HH24:MI:SS'","'NLS_CALENDAR=GREGORIAN')")
(
  subpartition SYS_SUBP882 tablespace USERS,
  subpartition SYS_SUBP883 tablespace USERS,
  subpartition SYS_SUBP884 tablespace USERS
),
  partition EMP_P4 values less than ("TO_DATE(' 1998-01-01 00:00:00'","'SYYYY-MM-DD HH24:MI:SS'","'NLS_CALENDAR=GREGORIAN')")
(
  subpartition SYS_SUBP885 tablespace USERS,
  subpartition SYS_SUBP886 tablespace USERS,
  subpartition SYS_SUBP887 tablespace USERS
),
  partition EMP_P5 values less than ("TO_DATE(' 2001-01-01 00:00:00'","'SYYYY-MM-DD HH24:MI:SS'","'NLS_CALENDAR=GREGORIAN')")
(
  subpartition SYS_SUBP888 tablespace USERS,
  subpartition SYS_SUBP889 tablespace USERS,
  subpartition SYS_SUBP890 tablespace USERS
)
) pctfree 0;

