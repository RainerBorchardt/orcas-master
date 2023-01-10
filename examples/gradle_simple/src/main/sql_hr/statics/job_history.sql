create table JOB_HISTORY
(
  EMPLOYEE_ID number(6) not null,
  START_DATE date not null,
  END_DATE date not null,
  JOB_ID varchar2(10) not null,
  DEPARTMENT_ID number(4),

  constraint JHIST_EMP_ID_ST_DATE_PK primary key (EMPLOYEE_ID,START_DATE),

  constraint JHIST_DATE_INTERVAL check ("end_date > start_date"),
  constraint JHIST_EMPLOYEE_NN check ("\"EMPLOYEE_ID\" IS NOT NULL"),
  constraint JHIST_END_DATE_NN check ("\"END_DATE\" IS NOT NULL"),
  constraint JHIST_JOB_NN check ("\"JOB_ID\" IS NOT NULL"),
  constraint JHIST_START_DATE_NN check ("\"START_DATE\" IS NOT NULL"),

  index JHIST_DEPARTMENT_IX (DEPARTMENT_ID),
  index JHIST_EMPLOYEE_IX (EMPLOYEE_ID),
  index JHIST_JOB_IX (JOB_ID),

  constraint JHIST_DEPT_FK foreign key (DEPARTMENT_ID) references DEPARTMENTS (DEPARTMENT_ID),
  constraint JHIST_EMP_FK foreign key (EMPLOYEE_ID) references EMPLOYEES (EMPLOYEE_ID),
  constraint JHIST_JOB_FK foreign key (JOB_ID) references JOBS (JOB_ID),

  comment on table is 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';
  comment on column DEPARTMENT_ID is 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';
  comment on column EMPLOYEE_ID is 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';
  comment on column END_DATE is 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';
  comment on column JOB_ID is 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';
  comment on column START_DATE is 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';
);

