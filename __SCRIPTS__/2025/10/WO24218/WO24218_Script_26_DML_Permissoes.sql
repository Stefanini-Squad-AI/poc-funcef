-- criar permissoes
declare
  vIdModulo  number;

  vOperacao1 number;
  vOperFunc1 number; 
  vIdObjeto1 number;
  
  formPrincpal   number;
  formFolha      number; 
  vListaUserPROD varchar(200);
  vListaUserDEV  varchar(200);
begin  
  
  vIdModulo    := 18;
  formPrincpal := 117;
  formFolha    := 1566;
  
  vListaUserPROD   := '''F000011'', ''F000066''';
  vListaUserDEV    := '''F000011'', ''F000066'', ''P000725'', ''F000287'', ''F000160''';
  
  --//------------------------------------------------------------------- OPERACAO
    -- criar operacao Previa Auto
    Select Max(IDOPERACAO) + 1 into vOperacao1 From Operacao;
     insert into Operacao(IDOPERACAO,NOMEOPERACAO) values (vOperacao1, 'Habilita Prévia via ETL');


  --//------------------------------------------------------------------- OBJETO

    -- criar operacao Previa Auto
    Select Max(IdObjeto)+1 Into vIdObjeto1 From Objeto;
      Insert Into Objeto(IdObjeto,NomeObjeto) Values( vIdObjeto1, 'chkETL');

  
  --//------------------------------------------------------------------- OPERACAOxFUNCAO

    -- criar operacao Previa Auto
    Select CM.SEQOPERFUNC.NEXTVAL Into vOperFunc1 from DUAL;
     insert into Operfunc(IDOPERFUNC,IDMODULO,IDOPERACAO,IDFUNCAO) values
      (vOperFunc1, vIdModulo, vOperacao1, 9835);

  --//------------------------------------------------------------------- FormxObjxFuncxOper

    -- criar operacao Previa Auto
    Insert into frobfnop(idOperfunc,idobjeto,idform)
       values(vOperFunc1, vIdObjeto1, formFolha);

  --//------------------------------------------------------------------- AUTORIZA

  insert into AUTORIZA (IDPESSOA,IDOPERFUNC,IDESPACESSO)
  SELECT 1 AS IDPESSOA,
         vOperFunc1 AS IDOPERFUNC,
         U.IDESPACESSO
    FROM usuariosistema  U
   WHERE NOMEUSUARIO IN ( vListaUserPROD );


  -- Grava Todas Informações no Banco
  --Commit;
end;
