-- WO28070
-- Paulo Nobre  - 08/12/2025
-- Remessa Eletronica

-- OWNER --> CM  

create index CM.IDX$$$$_15360001 on CM.DOCUMENTOXCODBARRAS("IDDOCUMENTOXCODBARRAS","CODDOCUMENTO") tablespace indices;
create index CM.IDX$$$$_15360002 on CM.DOCUMENTOXPESSOAS("IDDOCUMENTOXPESSOAS","CODDOCUMENTO")tablespace indices;
create index CM.IDX$$$$_15360003 on CM.DOCUMENTO("CODDOCUMENTO","STATUS")tablespace indices;
create index CM.IDX$$$$_15360004 on CM.ARQUIVOXDOCUM("IDARQUIVOPAGTO")tablespace indices;
create index CM.IDX$$$$_15360005 on CM.ARQUIVOPAGTO("CODPORTFORMA")tablespace indices;