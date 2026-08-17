unit uCtrlHstAlterCad;
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/06/2002                                 }
{                                                       }
{*******************************************************}
{
***************************************************************************************
Nº SOL: 229874/16589
Nº PPM: 1235881
Data da Alteração: 19/02/2016
Alteração Form: ER141 - Alteração na aba de dados pessoais e dados titular
Responsável: Michelle Suellyn Mota
Descrição: Inclusão de novos campos, alteração de leiaute e consultas.
**************************************************************************************
Rotina.............: ListHstAltPlanos
N. Sol.............: 183750
N. Kintana.........: 1731771
Data...............: 26/11/2013
Responsável........: Felipe A. Santos
Descrição..........: Foi incluido uma nova aba de alterações de planos de sáude
                     e odontológicos
--------------------------------------------------------------------------------
Rotina.............: -
N. Sol.............: 73915
N. Kintana.........: 524411
Data...............: 23/10/2009
Responsável........: Henrique Massao
Descrição..........: Foram incluidos novos campos no controle de histórico de
                       alterações
--------------------------------------------------------------------------------
}

interface

uses SysUtils, Forms, Db, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbHstEndPess, uDbHstAltCad;

type
  TCtrlHstAlterCad = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbHstEndPess: TDbHstEndPess;
    FDbHstAltCad: TDbHstAltCad;    

    FCdsHstEndPess: TCMClientDataSet;
    FCdsHstAltCad: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListMestre(IdPessoa: double): OleVariant;
    function ListHstAltCad(IdPessoa: double): OleVariant;
    function ListHstEndPess(IdPessoa: double): OleVariant;
    function ListCodAltCad: OleVariant;
    function ListHstAltPlanos(IdPessoa : double) : OleVariant; // Felipe A. Santos SOL 183750 KTN 1731771

    function Gravar: boolean;

    property CdsHstEndPess: TCMClientDataSet read FCdsHstEndPess write FCdsHstEndPess;
    property CdsHstAltCad: TCMClientDataSet read FCdsHstAltCad write FCdsHstAltCad;    
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlHstAlterCad }

constructor TCtrlHstAlterCad.Create;
begin
  inherited;
  FDbHstEndPess := TDbHstEndPess.Create(Self);
  FDbHstAltCad := TDbHstAltCad.Create(Self);
end;

destructor TCtrlHstAlterCad.Destroy;
begin
  FDbHstEndPess.Free;
  FDbHstAltCad.Free;
  if (IsAppServer) then
  begin
    FCdsHstEndPess.Free;
    FCdsHstAltCad.Free;
  end;
  inherited;
end;

procedure TCtrlHstAlterCad.OnCreateAppServer;
begin
  inherited;
  FCdsHstEndPess := TCMClientDataSet.Create(nil);
  FCdsHstAltCad := TCMClientDataSet.Create(nil);
end;

procedure TCtrlHstAlterCad.DoChangeDataBase;
begin
  inherited;
  FDbHstEndPess.DataBaseName := DataBaseName;
  FDbHstAltCad.DataBaseName := DataBaseName;
end;

function TCtrlHstAlterCad.ListMestre(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  (''  '' || P.NOME) AS NOME, P.IDPESSOA, ST.TIPOSIT, F.MATRICULA,'+CR_LF+
    '  DECODE(ST.TIPOSIT,''A'',''(Ativ'', ''F'',''(Afastad'', ''D'',''(Demitid'') ||'+CR_LF+
    '    DECODE(PEFIS.SEXO,''F'',''a)'',''o)'') AS SITUACAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOAFISICA PEFIS, FUNCIONARIO F, SITFUNC ST'+CR_LF+
    'WHERE'+CR_LF+
    '  (P.IDPESSOA  = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (P.IDPESSOA  = F.IDPESSOA) AND'+CR_LF+
    '  (F.IDSITFUNC = ST.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA  = PEFIS.IDPESSOA)');
end;

function TCtrlHstAlterCad.ListHstEndPess(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.IDPESSOA, H.DATAALT, H.LOGRADOURO, H.COMPLEMENTO,'+CR_LF+
    '  H.BAIRRO, H.CEP, H.IDCIDADES, H.NUMERO,'+CR_LF+
    '  LTRIM(RTRIM(C.NOME)) AS CIDADE,'+CR_LF+
    '  LTRIM(RTRIM(E.NOMEESTADO)) AS ESTADO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTENDPESS H, CIDADES C, ESTADO E'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA  = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (H.IDCIDADES = C.IDCIDADES) AND'+CR_LF+
    '  (C.IDESTADO  = E.IDESTADO)');
end;
//SQL EXECUTADA PARA EXIBIR HISTÓRICO.
function TCtrlHstAlterCad.ListHstAltCad(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, DATAALT, CODALTERACAO, ALTERACAO,'+CR_LF+
    '  DECODE(CODALTERACAO,''ESTCV'','+CR_LF+
    '    DECODE(ALTERACAO,'+CR_LF+
    '      ''E'',''Solteiro(a)'','+CR_LF+
    '      ''S'',''Casado(a)'','+CR_LF+
    '      ''T'',''Separado(a)'','+CR_LF+
    '      ''G'',''Separado(a) Judicialmente'','+CR_LF+
    '      ''3'',''Desquitado(a)'','+CR_LF+
    '      ''P'',''Viúvo(a)'','+CR_LF+
    '      ''A'',''Outro''),'+CR_LF+

    '      ''TPCTR'','+CR_LF+
    '    DECODE(ALTERACAO,'+CR_LF+
    '      ''E'',''Efetivo'','+CR_LF+
    '      ''S'',''Efetivo Especial'','+CR_LF+
    '      ''T'',''Temporário'','+CR_LF+
    '      ''G'',''Estagiário'','+CR_LF+
    '      ''3'',''Terceiro'','+CR_LF+
    '      ''P'',''Prop/Dir s/ Vinc'','+CR_LF+
    '      ''A'',''Autônomo''),'+CR_LF+

    '      ''TPCON'','+CR_LF+
    '    DECODE(ALTERACAO,'+CR_LF+
    '      ''1'',''Corrente'','+CR_LF+
    '      ''2'',''Salário'','+CR_LF+
    '      ''3'',''Poupança''),'+CR_LF+

    '      ''COPRE'','+CR_LF+
    '    DECODE(ALTERACAO,'+CR_LF+
    '      ''0'',''Não'','+CR_LF+
    '      ''1'',''Sim''),'+CR_LF+

    '      ''CTGEM'','+CR_LF+
    '    DECODE(ALTERACAO,'+CR_LF+
    '      ''1'',''EMPREGADO'','+CR_LF+
    '      ''2'',''TRABALHADOR AVULSO'','+CR_LF+
    '      ''3'',''EMPREGADO AFAST P/ SERVIÇO MILITAR OBRIG'','+CR_LF+
    '      ''4'',''EMP SOBRE CONT TRAB IND'','+CR_LF+
    '      ''5'',''DIRETOR NÃO EMPREGADO COM FGTS'','+CR_LF+
    '      ''6'',''DIRETOR NÃO EMPREGADO SEM FGTS'','+CR_LF+
    '      ''7'',''MENOR APRENDIZ'','+CR_LF+
    '      ''12'',''AGENTE PUBLICO'','+CR_LF+
    '      ''13'',''TRABALHADOR AUTONOMO''),'+CR_LF+

    '      ''SITDR'','+CR_LF+
    '    DECODE(ALTERACAO,'+CR_LF+
    '   ''1'','+CR_LF+
    '   ''NAO ESPOSICAO A AGENTES NOCIVOS (UM VINCULO)'','+CR_LF+
    '   ''2'','+CR_LF+
    '   ''EXPOSICAO A AGENTE NOCIVO - APOSENTADORIA AOS 15 ANOS DE SERVICO (UM VINCULO)'','+CR_LF+
    '   ''3'','+CR_LF+
    '   ''EXPOSICAO A AGENTE NOCIVO - APOSENTADORIA AOS 20 ANOS DE SERVICO (UM VINCULO)'','+CR_LF+
    '   ''4'','+CR_LF+
    '   ''EXPOSICAO A AGENTE NOCIVO - APOSENTADORIA AOS 25 ANOS DE SERVICO (UM VINCULO)'','+CR_LF+
    '   ''5'','+CR_LF+
    '   ''NAO ESPOSICAO A AGENTES NOCIVOS (MAIS DE UM VINCULO)'','+CR_LF+
    '   ''6'','+CR_LF+
    '   ''EXPOSICAO A AGENTE NOCIVO - APOSENT. 15 ANOS DE SERVICO (MAIS DE UM VINCULO)'','+CR_LF+
    '   ''7'','+CR_LF+
    '   ''EXPOSICAO A AGENTE NOCIVO - APOSENT. 20 ANOS DE SERVICO (MAIS DE UM VINCULO)'','+CR_LF+
    '   ''8'','+CR_LF+
    '   ''EXPOSICAO A AGENTE NOCIVO - APOSENT. 25 ANOS DE SERVICO (MAIS DE UM VINCULO)''),'+CR_LF+

    '   ''NOBAN'','+CR_LF+
    '   (SELECT P.RAZAOSOCIAL FROM PESSOA P WHERE P.IDPESSOA = ALTERACAO ),'+CR_LF+

    ' ALTERACAO) AS VALORALTERACAO,'+CR_LF+
    '  DECODE(CODALTERACAO,'+CR_LF+
    '    ''MATRI'', ''Matrícula'','+CR_LF+
    '    ''NOME'', ''Nome'','+CR_LF+
    '    ''CPF'', ''CPF'','+CR_LF+
    '    ''CTPS'', ''CTPS'','+CR_LF+
    '    ''PIS'', ''PIS/PASEP'','+CR_LF+
    '    ''DTNAS'', ''Data de Nascimento'','+CR_LF+
    '    ''DTADM'', ''Data de Admissão'','+CR_LF+
    '    ''HORTR'', ''Horário de Trabalho'','+CR_LF+
    '    ''NOMCH'', ''Nome do Chefe'','+CR_LF+
    '    ''GRINS'', ''Grau de Instrução'','+CR_LF+
    '    ''ESTCV'', ''Estado Civil'','+CR_LF+
    '    ''NOMSI'', ''Sindicato'','+CR_LF+
    '    ''PROFI'', ''Profissão'','+CR_LF+
    '    ''NIRRF'', ''Qtde. Dependentes I. Renda'','+CR_LF+
    '    ''NSALF'', ''Qtde. Dependentes Sal. Fam.'','+CR_LF+
    '    ''TPCTR'', ''Tipo de Contrato'','+CR_LF+
    '    ''NTELE'', ''Telefone'','+CR_LF+
    '    ''CTGEM'', ''Categoria Empregado'','+CR_LF+
    '    ''NUDDD'', ''Número DDD'','+CR_LF+
    '    ''NUDDI'', ''Número DDI'','+CR_LF+
    '    ''NOBAN'', ''Nome do Banco'','+CR_LF+
    '    ''TPCON'', ''Tipo da Conta'','+CR_LF+
    '    ''NUAGE'', ''Número da Agência'','+CR_LF+
    '    ''NUCON'', ''Conta Corrente'','+CR_LF+
    '    ''COPRE'', ''Conta Preferencial'','+CR_LF+
    '    ''SITDR'', ''Situação de Risco'','+CR_LF+
    '    ''BANSA'', ''Banco da conta Salário'','+CR_LF+
    '    ''AGESA'', ''Agência da conta Salário'','+CR_LF+
    '    ''CONSA'', ''Número da conta Salário'','+CR_LF+
    '    ''MATCX'', ''Matrícula Caixa'') CAMPO,'+CR_LF+

    '  DECODE(CODALTERACAO, ''MATRI'',''C'', ''NOME'',''C'', ''CPF'',''N'','+CR_LF+
    '    ''CTPS'',''N'', ''PIS'',''N'', ''DTNAS'',''D'', ''DTADM'',''D'','+CR_LF+
    '    ''HORTR'',''C'', ''NOMCH'',''C'', ''GRINS'',''C'', ''ESTCV'',''L'','+CR_LF+
    '    ''NOMSI'',''C'', ''PROFI'',''C'', ''NIRRF'',''N'', ''NSALF'',''N'','+CR_LF+
    '    ''NTELE'',''C'', ''CTGEM'',''C'', ''NUDDD'',''C'', ''NUDDI'',''C'','+CR_LF+
    '    ''SITDR'',''C'', ''TPCON'',''N'', ''NUAGE'',''N'', ''COPRE'',''N'','+CR_LF+
    '    ''NUCON'',''C'', ''NOBAN'',''C'', ''NAGES'',''C'', ''AGESA'',''C'','+CR_LF+
    '    ''CONSA'',''C'', ''MATCX'',''N'') TIPOCAMPO,'+CR_LF+

    '  DECODE(CODALTERACAO, ''MATRI'',13, ''NOME'',60, ''CPF'',18,'+CR_LF+
    '    ''CTPS'',18, ''PIS'',18, ''DTNAS'',10, ''DTADM'',10,'+CR_LF+
    '    ''HORTR'',40, ''NOMCH'',60, ''GRINS'',30, ''ESTCV'',1,'+CR_LF+
    '    ''NOMSI'',60, ''PROFI'',60, ''NIRRF'',2,  ''NSALF'',2, ''TPCTR'',1,'+CR_LF+
    '    ''NTELE'',20, ''CTGEM'',40, ''NUDDD'',3,  ''NUDDI'',3, ''SITDR'',80,'+CR_LF+
    '    ''TPCON'',1,  ''NUAGE'',30, ''NUCON'',30, ''NOBAN'',60,''MATCX'',30,'+CR_LF+
    '    ''BANSA'',30, ''AGESA'',30, ''CONSA'',30, ''COPRE'',1) MAXLENGTHCAMPO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTALTCAD'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = '+FloatToStr(IdPessoa)+')');
end;

function TCtrlHstAlterCad.ListCodAltCad: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODALTERACAO, CODSEFIP'+CR_LF+
    'FROM'+CR_LF+
    '  CODALTCAD');
end;

function TCtrlHstAlterCad.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsHstAltCad.Data, FCdsHstAltCad.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsHstEndPess, FDbHstEndPess, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsHstAltCad, FDbHstAltCad, [], []);
        if not(Result) then
          raise Exception.Create(FDbHstAltCad.MessageInfo);
      end
      else
        raise Exception.Create(FDbHstEndPess.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlHstAlterCad.ListHstAltPlanos(IdPessoa: double): OleVariant;
var
  sSQL : string; // Felipe A. Santos SOL 183750 KTN 1731771
begin
  // Felipe A. Santos SOL 183750 KTN 1731771
  //sSQL := 'SELECT I.NOME,  ' + //Michelle Mota - SOL: 229874.16589 PPM: 1235881
  sSQL := 'SELECT DISTINCT I.NOME,  ' + //Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '       DECODE(I.TIPO, ''SAUDE'', ''SAÚDE'', DECODE(I.TIPO,''ALIME'',''ALIMENTÍCIA'', ''ODONTOLÓGICO'')) AS DESCTIPO,  ' + //Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '       I.DATA AS DATAINCLUSAO,                                                                  ' +
          //'       E.DATA AS DATAEXCLUSAO                                                                   ' +//Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '       E.DATA AS DATAEXCLUSAO,                                                                   ' +//Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '       I.VALOR AS PERCENTUAL                                                                   ' +//Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '  FROM (Select I1.*                                                                             ' +
          '          FROM (SELECT L.*,                                                                     ' +
          '                       P.NOME,                                                                  ' +
          '                       RANK() OVER(PARTITION BY L.IDPESSOA ORDER BY P.NOME, L.DATA, L.TIPO) IND ' +
          '                  FROM LOGCONTRDEPENSAUDODONT L, PESSOA P, DEPENTIT D                           ' +
          '                 WHERE D.IDTITULAR = ' + Float2String(IdPessoa) +
          '                   AND L.CAMPO = ''INCLUSAO''                                                   ' +
          '                   AND L.IDPESSOA = P.IDPESSOA                                                  ' +
          '                   AND L.IDPESSOA = D.IDPESSOA                                                  ' +
          '                   AND L.TIPO = ''SAUDE''                                                       ' +
          '                 ORDER BY P.NOME, L.TIPO, L.DATA) I1) I,                                        ' +
          '       (SELECT E1.*                                                                             ' +
          '          FROM (SELECT L.*,                                                                     ' +
          '                       P.NOME,                                                                  ' +
          '                       RANK() OVER(PARTITION BY L.IDPESSOA ORDER BY P.NOME, L.DATA, L.TIPO) IND ' +
          '                  FROM LOGCONTRDEPENSAUDODONT L, PESSOA P, DEPENTIT D                           ' +
          '                 WHERE D.IDTITULAR = ' + Float2String(IdPessoa) +
          '                   AND L.CAMPO = ''EXCLUSAO''                                                   ' +
          '                   AND L.IDPESSOA = P.IDPESSOA                                                  ' +
          '                   AND L.IDPESSOA = D.IDPESSOA                                                  ' +
          '                   AND L.TIPO = ''SAUDE''                                                       ' +
          '                 ORDER BY P.NOME, L.TIPO, L.DATA) E1) E                                         ' +
          ' WHERE I.IND = E.IND(+)                                                                         ' +
          '   AND I.IDPESSOA = E.IDPESSOA(+)                                                               ' +
          'UNION                                                                                           ' +
		  //'SELECT I.NOME,  ' + //Michelle Mota - SOL: 229874.16589 PPM: 1235881
          'SELECT DISTINCT I.NOME,  ' + //Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '       DECODE(I.TIPO, ''SAUDE'', ''SAÚDE'', DECODE(I.TIPO,''ALIME'',''ALIMENTÍCIA'', ''ODONTOLÓGICO'')) AS DESCTIPO,  ' + //Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '       I.DATA AS DATAINCLUSAO,                                                                  ' +
          //'       E.DATA AS DATAEXCLUSAO                                                                   ' +//Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '       E.DATA AS DATAEXCLUSAO,                                                                   ' +//Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '       I.VALOR AS PERCENTUAL                                                                   ' +//Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '  FROM (Select I1.*                                                                             ' +
          '          FROM (SELECT L.*,                                                                     ' +
          '                       P.NOME,                                                                  ' +
          '                       RANK() OVER(PARTITION BY L.IDPESSOA ORDER BY P.NOME, L.DATA, L.TIPO) IND ' +
          '                  FROM LOGCONTRDEPENSAUDODONT L, PESSOA P, DEPENTIT D                           ' +
          '                 WHERE D.IDTITULAR = ' + Float2String(IdPessoa) +
          '                   AND L.CAMPO = ''INCLUSAO''                                                     ' +
          '                   AND L.IDPESSOA = P.IDPESSOA                                                  ' +
          '                   AND L.IDPESSOA = D.IDPESSOA                                                  ' +
          '                   AND L.TIPO = ''ODONT''                                                         ' +
          '                 ORDER BY P.NOME, L.TIPO, L.DATA) I1) I,                                        ' +
          '       (SELECT E1.*                                                                             ' +
          '          FROM (SELECT L.*,                                                                     ' +
          '                       P.NOME,                                                                  ' +
          '                       RANK() OVER(PARTITION BY L.IDPESSOA ORDER BY P.NOME, L.DATA, L.TIPO) IND ' +
          '                  FROM LOGCONTRDEPENSAUDODONT L, PESSOA P, DEPENTIT D                           ' +
          '                 WHERE D.IDTITULAR = ' + Float2String(IdPessoa) +
          '                   AND L.CAMPO = ''EXCLUSAO''                                                   ' +
          '                   AND L.IDPESSOA = P.IDPESSOA                                                  ' +
          '                   AND L.IDPESSOA = D.IDPESSOA                                                  ' +
          '                   AND L.TIPO = ''ODONT''                                                       ' +
          '                 ORDER BY P.NOME, L.TIPO, L.DATA) E1) E                                         ' +
          ' WHERE I.IND = E.IND(+)                                                                         ' +
          '   AND I.IDPESSOA = E.IDPESSOA(+)                                                               ' +
// Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
          'UNION                                                                                           ' +
          'SELECT DISTINCT I.NOME,  ' + 
          '       DECODE(I.TIPO, ''SAUDE'', ''SAÚDE'', DECODE(I.TIPO,''ALIME'',''ALIMENTÍCIA'', ''ODONTOLÓGICO'')) AS DESCTIPO,  ' + 
          '       I.DATA AS DATAINCLUSAO,                                                                  ' +
          //'       E.DATA AS DATAEXCLUSAO                                                                   ' +//Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '       E.DATA AS DATAEXCLUSAO,                                                                   ' +//Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '       I.VALOR AS PERCENTUAL                                                                   ' +//Michelle Mota - SOL: 229874.16589 PPM: 1235881
          '  FROM (Select I1.*                                                                             ' +
          '          FROM (SELECT L.*,                                                                     ' +
          '                       P.NOME,                                                                  ' +
          '                       RANK() OVER(PARTITION BY L.IDPESSOA ORDER BY P.NOME, L.DATA, L.TIPO) IND ' +
          '                  FROM LOGCONTRDEPENSAUDODONT L, PESSOA P, DEPENTIT D                           ' +
          '                 WHERE D.IDTITULAR = ' + Float2String(IdPessoa) +
          '                   AND L.CAMPO = ''INCLUSAO''                                                     ' +
          '                   AND L.IDPESSOA = P.IDPESSOA                                                  ' +
          '                   AND L.IDPESSOA = D.IDPESSOA                                                  ' +
          '                   AND L.TIPO = ''ALIME''                                                         ' +
          '                 ORDER BY P.NOME, L.TIPO, L.DATA) I1) I,                                        ' +
          '       (SELECT E1.*                                                                             ' +
          '          FROM (SELECT L.*,                                                                     ' +
          '                       P.NOME,                                                                  ' +
          '                       RANK() OVER(PARTITION BY L.IDPESSOA ORDER BY P.NOME, L.DATA, L.TIPO) IND ' +
          '                  FROM LOGCONTRDEPENSAUDODONT L, PESSOA P, DEPENTIT D                           ' +
          '                 WHERE D.IDTITULAR = ' + Float2String(IdPessoa) +
          '                   AND L.CAMPO = ''EXCLUSAO''                                                   ' +
          '                   AND L.IDPESSOA = P.IDPESSOA                                                  ' +
          '                   AND L.IDPESSOA = D.IDPESSOA                                                  ' +
          '                   AND L.TIPO = ''ALIME''                                                       ' +
          '                 ORDER BY P.NOME, L.TIPO, L.DATA) E1) E                                         ' +
          ' WHERE I.IND = E.IND(+)                                                                         ' +
          '   AND I.IDPESSOA = E.IDPESSOA(+)                                                               ' +
// Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

          ' ORDER BY 3 DESC,2,1                                                                            ';


  Result := GetDataPacket(sSQL);
  // Felipe A. Santos SOL 183750 KTN 1731771 - FIM
end;

end.
