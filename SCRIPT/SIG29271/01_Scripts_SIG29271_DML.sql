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
  vIdModulo    := 4;
  vIdFormPai   := 394;
  vIdFuncaoPai := 9049;
  vIdOperacao  := 1;

  -- Validação da Variavel Sequencial da Tabela Formularios
  Begin
    -- Select
    Select IdForm into vIdForm From Form
    where NomeForm = 'FrmRegistroCarteiraBoleto' and IdModulo = vIdModulo;
    -- Exception
    EXCEPTION WHEN OTHERS THEN vIdForm := -1;
    -- Criação do Registro
    If vIdForm = -1 then
      Select Max(IdForm)+1 Into vIdForm From Form;
      Insert Into Form(Idform,Nomeform,Idmodulo,Descform)
                values(vIdForm,'FrmRegistroCarteiraBoleto',vIdModulo,'Registro de Carteira - Boletos');
    End If;
  End;

  -- Validação da Variavel Sequencial da Tabela Funcao
  Begin
    -- Select
    Select Idfuncao Into vIdFuncao From Funcao
    where NomeFuncao = 'Registro de Carteira - Boletos'
      and IdModulo = vIdModulo and IdFuncaoPai = vIdFuncaoPai;
    -- Exception
    EXCEPTION WHEN OTHERS THEN vIdFuncao := -1;
    -- Criação do Registro
    If vIdFuncao = -1 then
      Select Max(IdFuncao)+1 Into vIdFuncao From Funcao;
      Insert Into Funcao(IdFuncao,NomeFuncao,IdModulo,IdFuncaoPai)
                  values(vIdFuncao,'Registro de Carteira - Boletos', vIdModulo, vIdFuncaoPai);
    End If;
  End;

  -- Validação da Variavel Sequencial da Tabela Funcao
  Begin
    -- Select
    Select IdObjeto Into vIdObjeto from Objeto
    where NomeObjeto = 'mnuRegistrodeCarteira';
    -- Exception
    EXCEPTION WHEN OTHERS THEN vIdObjeto := -1;
    -- Criação do Registro
    If vIdObjeto = -1 then
      Select Max(IdObjeto)+1 Into vIdObjeto From Objeto;
      Insert Into Objeto(IdObjeto,NomeObjeto) Values( vIdObjeto, 'mnuRegistrodeCarteira');
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