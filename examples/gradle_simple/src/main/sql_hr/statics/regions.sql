create table REGIONS
(
  REGION_ID number not null,
  REGION_NAME varchar2(25),

  constraint REG_ID_PK primary key (REGION_ID),

  constraint REGION_ID_NN check ("\"REGION_ID\" IS NOT NULL")
);

