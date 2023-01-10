alter table TAB_NEW_PK drop primary key;
create unique index TAB_NEW_IX on TAB_NEW_PK ( ID1 );
alter table TAB_NEW_PK add constraint TAB_NEW_PK primary key (ID1) using index TAB_NEW_IX;
alter table TAB_MOD_PK drop primary key;
drop index TAB_MOD_IX on TAB_MOD_PK;
create unique index TAB_MOD_IX on TAB_MOD_PK ( ID1,ID2 );
alter table TAB_MOD_PK add constraint TAB_MOD_PK primary key (ID1,ID2) using index TAB_MOD_IX;
alter table TAB_WRONG_IX drop primary key;
drop index TAB_WRONG_IX_IX on TAB_WRONG_IX;
create unique index TAB_RIGHT_IX_IX on TAB_WRONG_IX ( ID1 );
alter table TAB_WRONG_IX add constraint TAB_WRONG_IX_PK primary key (ID1) using index TAB_RIGHT_IX_IX;
alter table TAB_WRONG_PK drop primary key;
alter table TAB_WRONG_PK add constraint TAB_RIGHT_PK_PK primary key (ID1) using index TAB_WRONG_PK_IX;