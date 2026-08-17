 -- Declaração das Variaveis

declare
  -- Variaveis Sequenciais
  vIdForm      Integer;
  vIdFuncao    Integer;
  vIdObjeto    Integer;
  vIdOperFunc  Integer;

  -- Variaveis definidas
  vIdModulo    Integer;
  vIdFormPai   Integer;
  vIdFuncaoPai Integer;
  vIdOperacao  Integer;

begin
  -- Variaveis definidas
  vIdModulo    := 3;
  vIdFormPai   := 117;
  vIdFuncaoPai := 1673;
  vIdOperacao  := 1;

  -- Validação da Variavel Sequencial da Tabela Objeto
  Begin
    -- Select
    Select IdObjeto Into vIdObjeto from Objeto
    where NomeObjeto = 'mnuPlanilhaModeloRateio1';
    -- Exception
    EXCEPTION WHEN OTHERS THEN vIdObjeto := -1;
    -- Criação do Registro
    If vIdObjeto = -1 then
      Select Max(IdObjeto)+1 Into vIdObjeto From Objeto;
      Insert Into Objeto(IdObjeto,NomeObjeto) Values( vIdObjeto, 'mnuPlanilhaModeloRateio1');
    End If;
  End;


  -- Validação da Variavel Sequencial da Tabela Funcao
  Begin
    -- Select
    Select Idfuncao Into vIdFuncao From Funcao
    where NomeFuncao = 'Planilha Modelo Rateio'
      and IdModulo = vIdModulo and IdFuncaoPai = vIdFuncaoPai;
    -- Exception
    EXCEPTION WHEN OTHERS THEN vIdFuncao := -1;
    -- Criação do Registro
    If vIdFuncao = -1 then
      Select Max(IdFuncao)+1 Into vIdFuncao From Funcao;
      Insert Into Funcao(IdFuncao,NomeFuncao,IdModulo,IdFuncaoPai)
                  values(vIdFuncao,'Planilha Modelo Rateio', vIdModulo, vIdFuncaoPai);
    End If;
  End;

  -- Validação da Variavel Sequencial da Tabela OperFunc
  Begin
    -- Select
    Select IdOperFunc into vIdOperFunc from OperFunc
    where idModulo = vIdModulo
      and idOperacao = vIdOperacao
      and IdFuncao = vIdFuncao;
    -- Exception
    EXCEPTION WHEN OTHERS THEN vIdOperFunc := -1;
    -- Criação do Registro
    If vIdOperFunc = -1 then
      Select seqoperfunc.nextval Into vIdOperFunc from dual;
      Select seqfrobfnop.nextval Into vIdOperFunc from dual;
      Insert Into Operfunc(idOperfunc,Idmodulo,Idoperacao,Idfuncao)
                    Values(vIdOperFunc, vIdModulo, vIdOperacao, vIdFuncao);
      Insert into frobfnop(idOperfunc,idobjeto,idform)
                    values(vIdOperFunc, vIdObjeto, vIdFormPai);
    End If;
  End;


  -- Grava Todas Informações no Banco
  Commit;
end;
