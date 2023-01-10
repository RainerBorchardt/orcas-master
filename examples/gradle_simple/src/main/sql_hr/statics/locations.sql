create table LOCATIONS
(
  LOCATION_ID number(4) not null,
  STREET_ADDRESS varchar2(40),
  POSTAL_CODE varchar2(12),
  CITY varchar2(30) not null,
  STATE_PROVINCE varchar2(25),
  COUNTRY_ID char(2),

  constraint LOC_ID_PK primary key (LOCATION_ID),

  constraint LOC_CITY_NN check ("\"CITY\" IS NOT NULL"),

  index LOC_CITY_IX (CITY),
  index LOC_COUNTRY_IX (COUNTRY_ID),
  index LOC_STATE_PROVINCE_IX (STATE_PROVINCE),

  constraint LOC_C_ID_FK foreign key (COUNTRY_ID) references COUNTRIES (COUNTRY_ID),

  comment on table is 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';
  comment on column CITY is 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';
  comment on column COUNTRY_ID is 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';
  comment on column LOCATION_ID is 'Primary key of locations table';
  comment on column POSTAL_CODE is 'Postal code of the location of an office, warehouse, or production site
of a company. ';
  comment on column STATE_PROVINCE is 'State or Province where an office, warehouse, or production site of a
company is located.';
  comment on column STREET_ADDRESS is 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';
);

