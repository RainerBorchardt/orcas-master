create table JOBS
(
  JOB_ID varchar2(10) not null,
  JOB_TITLE varchar2(35) not null,
  MIN_SALARY number(6),
  MAX_SALARY number(6),

  constraint JOB_ID_PK primary key (JOB_ID),

  constraint JOB_TITLE_NN check ("\"JOB_TITLE\" IS NOT NULL"),

  comment on table is 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';
  comment on column JOB_ID is 'Primary key of jobs table.';
  comment on column JOB_TITLE is 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
  comment on column MAX_SALARY is 'Maximum salary for a job title';
  comment on column MIN_SALARY is 'Minimum salary for a job title.';
);

