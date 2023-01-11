create table DEPARTMENTS
(
  DEPARTMENT_ID number(4) not null,
  DEPARTMENT_NAME varchar2(30) not null,
  MANAGER_ID number(6),
  LOCATION_ID number(4),

  constraint DEPT_ID_PK primary key (DEPARTMENT_ID),

  constraint DEPT_NAME_NN check ("\"DEPARTMENT_NAME\" IS NOT NULL"),

  index DEPT_LOCATION_IX (LOCATION_ID),
  index DEPT_MGR_FK_GEN_IX (MANAGER_ID),

  constraint DEPT_LOC_FK foreign key (LOCATION_ID) references LOCATIONS (LOCATION_ID),
  constraint DEPT_MGR_FK foreign key (MANAGER_ID) references EMPLOYEES (EMPLOYEE_ID),

  comment on table is 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';
  comment on column DEPARTMENT_ID is 'Primary key column of departments table.';
  comment on column DEPARTMENT_NAME is 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';
  comment on column LOCATION_ID is 'Location id where a department is located. Foreign key to location_id column of locations table.';
  comment on column MANAGER_ID is 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
);

