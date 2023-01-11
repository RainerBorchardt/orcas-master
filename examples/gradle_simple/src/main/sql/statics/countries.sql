create table COUNTRIES
(
  COUNTRY_ID char(2) not null,
  COUNTRY_NAME varchar2(40),
  REGION_ID number,

  constraint COUNTRY_C_ID_PK primary key (COUNTRY_ID),

  constraint COUNTRY_ID_NN check ("\"COUNTRY_ID\" IS NOT NULL"),

  index COUNTR_REG_FK_GEN_IX (REGION_ID),

  constraint COUNTR_REG_FK foreign key (REGION_ID) references REGIONS (REGION_ID),

  comment on table is 'country table. Contains 25 rows. References with locations table.';
  comment on column COUNTRY_ID is 'Primary key of countries table.';
  comment on column COUNTRY_NAME is 'Country name';
  comment on column REGION_ID is 'Region ID for the country. Foreign key to region_id column in the departments table.';
) organization index;

