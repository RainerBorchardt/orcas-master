create table EMPLOYEES
(
  EMPLOYEE_ID number(6) not null,
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

  constraint EMP_EMP_ID_PK primary key (EMPLOYEE_ID),

  constraint EMP_EMAIL_NN check ("\"EMAIL\" IS NOT NULL"),
  constraint EMP_HIRE_DATE_NN check ("\"HIRE_DATE\" IS NOT NULL"),
  constraint EMP_JOB_NN check ("\"JOB_ID\" IS NOT NULL"),
  constraint EMP_LAST_NAME_NN check ("\"LAST_NAME\" IS NOT NULL"),
  constraint EMP_SALARY_MIN check ("salary > 0"),

  index EMP_DEPARTMENT_IX (DEPARTMENT_ID),
  index EMP_JOB_IX (JOB_ID),
  index EMP_MANAGER_IX (MANAGER_ID),
  index EMP_NAME_IX (LAST_NAME,FIRST_NAME),
  constraint EMP_EMAIL_UK unique (EMAIL),

  constraint EMP_DEPT_FK foreign key (DEPARTMENT_ID) references DEPARTMENTS (DEPARTMENT_ID),
  constraint EMP_JOB_FK foreign key (JOB_ID) references JOBS (JOB_ID),
  constraint EMP_MANAGER_FK foreign key (MANAGER_ID) references EMPLOYEES (EMPLOYEE_ID),

  comment on table is 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
  comment on column COMMISSION_PCT is 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';
  comment on column DEPARTMENT_ID is 'Department id where employee works; foreign key to department_id
column of the departments table';
  comment on column EMAIL is 'Email id of the employee';
  comment on column EMPLOYEE_ID is 'Primary key of employees table.';
  comment on column FIRST_NAME is 'First name of the employee. A not null column.';
  comment on column HIRE_DATE is 'Date when the employee started on this job. A not null column.';
  comment on column JOB_ID is 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';
  comment on column LAST_NAME is 'Last name of the employee. A not null column.';
  comment on column MANAGER_ID is 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
  comment on column PHONE_NUMBER is 'Phone number of the employee; includes country code and area code';
  comment on column SALARY is 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';
);

