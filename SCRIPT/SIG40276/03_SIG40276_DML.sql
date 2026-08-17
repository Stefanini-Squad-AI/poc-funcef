--Exclusão/Estorno de Parcelas sem Medição - Estorno
--Form: frmExcluiParcelaMT
--Botão: btnEstorno

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
  vIdModulo    := 12; -- Contratos e Parcelas
  vIdFormPai   := -1;
  vIdFuncaoPai := -1;
  vIdOperacao  := -1;
  vIdFuncao    := -1;

  INSERT INTO FORM (IDFORM, NOMEFORM, IDMODULO, DESCFORM) VALUES ((SELECT MAX(IDFORM)+1 FROM FORM), 'frmExcluiParcelaMT',vIdModulo, 'Exclusão/Estorno de Parcelas sem Medição');
  
  begin
     Select IdFuncao into vIdFuncao from Funcao
     where nomeFuncao like 'Exclusão de Parcelas sem Medição' AND IDMODULO = 12; 
  end;
    
  begin
     Select IdForm into vIdFormPai From Form
     where NomeForm = 'frmExcluiParcelaMT'
     And idmodulo = 12;
  end;

  -- Validação da Variavel Sequencial da Tabela Funcao
  Begin
    -- Select
    Select IdObjeto Into vIdObjeto from Objeto
    where NomeObjeto = 'btnEstorno';
    -- Exception
    EXCEPTION WHEN OTHERS THEN vIdObjeto := -1;
    -- Criação do Registro
    If vIdObjeto = -1 then
      Select Max(IdObjeto)+1 Into vIdObjeto From Objeto;
      Insert Into Objeto(IdObjeto,NomeObjeto) Values( vIdObjeto, 'btnEstorno');
    End If;
  End;  
  
  -- INSERE OPERACAO
  Begin
    -- Select
    Select idoperacao Into vIdOperacao from operacao
    where nomeoperacao = 'ESTORNO';
    -- Exception
    EXCEPTION WHEN OTHERS THEN vIdOperacao := -1;
    -- Criação do Registro
    If vIdOperacao = -1 then
      Select Max(idoperacao)+1 Into vIdOperacao From operacao;
      Insert Into Operacao(IdOperacao,NomeOperacao) Values( vIdOperacao, 'ESTORNO');
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
      Select Max(IdOperFunc)+1 Into vIdOperFunc from OperFunc;
      Insert Into Operfunc(idOperfunc,Idmodulo,Idoperacao,Idfuncao)
                    Values(vIdOperFunc, vIdModulo, vIdOperacao, vIdFuncao);
      Insert into frobfnop(idOperfunc,idobjeto,idform)
                    values(vIdOperFunc, vIdObjeto, vIdFormPai);
    End If;
  End;

  -- Grava Todas Informações no Banco
  Commit;
end;