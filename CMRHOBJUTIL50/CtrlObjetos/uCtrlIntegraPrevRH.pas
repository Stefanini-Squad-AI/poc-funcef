{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Camille Monteiro Viana          }
{ Atualizado Em: 10/09/2003                             }
{ Descricao: Contém as rotinas de integraçao dos        }
{ sistemas previdenciários com o sistema de RH e Folha  }
{ de Pagamento da Fundação.                             }
{                                                       }
{*******************************************************}

unit uCtrlIntegraPrevRH;

interface

uses SysUtils, Forms, Db, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH;

type
  TCtrlIntegraPrevRH = class(TCtrlCustomRH)
  private
    sMatricula: string;

    function InsereFuncionarioElegivel(IdFundacao, IdPessoa: double): boolean;
    function InsereFuncionarioDependente(IdPessoa: double): boolean;
    function InsereFuncionarioDepentit(IdPessoa: double): boolean;
    function AlteraFuncionarioElegivel(IdFundacao, IdPessoa: double): boolean;
    function AlteraFuncionarioDepenTit(IdPessoa: double): boolean;
    function ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa, IdCargoElegPatro: double;
      Tipo: char; var IdCargo: double): boolean;
    function ProcessaDE_PARA_CONTABANCARIA(IdPessoa, IdAgencia: double; NumConta: string): boolean;
    function InsereCriticaInterface(IdFundacao, IdPessoa: double; ValorNoRH, ValorNoAdmPREV,
      Matricula, CodErro, TipoDado: string): boolean;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function AtualizaDadosPrevFuncionario(IdFundacao, IdPessoa: double): boolean;
    function AtualizaFaixasSalariais(IdFundacao: double): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

const
  ceEmprNovo             = '69';
  ceCCustoAlterado       = '70';
  ceMatriculaAlterada    = '72';
  ceDataAdmAlterada      = '4';
  ceDtDemissaoAlterada   = '61';
  ceSalarioAlterado      = '71';
  ceDtReadmissaoAlterada = '62';
  ceFilialAlterada       = '55';
  ceCargoAlterado        = '9';

{ TCtrlIntegraPrevRH }

constructor TCtrlIntegraPrevRH.Create;
begin
  inherited;       
end;

destructor TCtrlIntegraPrevRH.Destroy;
begin
  inherited;
end;

function TCtrlIntegraPrevRH.InsereFuncionarioElegivel(IdFundacao, IdPessoa: double): boolean;
var
  sSQL: string;
  dIdCargo, dIdFuncao: double;
  _CdsElegivel: TCMClientDataSet;
begin
  _CdsElegivel := TCMClientDataSet.Create(nil);

  Result := true;

  try
    // Inserir pessoa na tabela ELEGIVEL
    ExecSQL('INSERT INTO ELEGIVEL (IDPESSOA) VALUES (' +FloatToStr(IdPessoa)+ ')');

    // Buscar dados da pessoa a inserir
    _CdsElegivel.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  IDPESSOA, IDSITFUNC, IDEMPRESA AS IDEMPRESAPROP, CODCENTROCUSTO, MATRICULA,' +CR_LF+
      '  DATAADMISSAO, DATADESLIGAMENTO AS DATADEMISSAO, SALARIOATUAL AS SALTOTAL,' +CR_LF+
      '  DATARETORNO AS  DATAREADMISSAO, IDESTAB, IDCARGO, IDFUNCAO, IDFAIXACARGO,' +CR_LF+
      '  IDFAIXAFUNCAO, NIVELINDIV1, NIVELINDIV2, IDAGENCIASALARIO, IDAGENCIAFGTS,' +CR_LF+
      '  NUMCONTASALARIO, NUMCONTAFGTS' +CR_LF+
      'FROM' +CR_LF+
      '  FUNCIONARIO' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');

    sMatricula := _CdsElegivel.FieldByName('MATRICULA').asString;

    // Inserir pessoa na tabela ELEGPATRO
    sSQL :=
      'INSERT INTO ELEGPATRO' +CR_LF+
      '  (IDPESSJUR, IDPESSOA, IDSITFUNC, IDEMPRESAPROP, CODCENTROCUSTO, MATRICULA,' +CR_LF+
      '   DATAADMISSAO, DATADEMISSAO, SALTOTAL, DATAREADMISSAO, IDESTAB,' +CR_LF+
      '   IDPESSJURCARGO, IDCARGOEXT, IDPESSJURFUNC, IDFUNCAOEXT, PARTICIPPREVID,' +CR_LF+
      '   PARTICIPASSIST, NIVEL, DATAINICIOAFAST, DATAFIMAFAST, TEMPONAOCREDITADO,' +CR_LF+
      '   TEMPOSERVANTERIOR, TEMPOSERVANTREAL, TEMPOSITESPECIAL, VALORBASE1,' +CR_LF+
      '   VALORBASE2, VALORBASE3, IDPESSJURORGAO, SIGLA, FLGDIRETOR, CODVINCULAFUNC)' +CR_LF+
      'VALUES ( ' +FloatToStr(IdFundacao) +', '+ FloatToStr(IdPessoa) +', ';

    if (Trim(_CdsElegivel.FieldByName('IDSITFUNC').asString) <> '') then
      sSQL := sSQL + _CdsElegivel.FieldByName('IDSITFUNC').asString+ ', '
    else
      sSQL := sSQL + 'NULL, ';

    if (Trim(_CdsElegivel.FieldByName('IDEMPRESAPROP').asString) <> '') then
      sSQL := sSQL + _CdsElegivel.FieldByName('IDEMPRESAPROP').asString+ ', '
    else
      sSQL := sSQL + 'NULL, ';

    if (Trim(_CdsElegivel.FieldByName('CODCENTROCUSTO').asString) <> '') then
      sSQL := sSQL +QuotedStr(_CdsElegivel.FieldByName('CODCENTROCUSTO').asString)+ ', '
    else
      sSQL := sSQL + 'NULL, ';

    if (Trim(_CdsElegivel.FieldByName('MATRICULA').asString) <> '') then
      sSQL := sSQL +QuotedStr(_CdsElegivel.FieldByName('MATRICULA').asString)+ ', '
    else
      sSQL := sSQL + 'NULL, ';

    if (Trim(_CdsElegivel.FieldByName('DATAADMISSAO').asString) <> '') then
      sSQL := sSQL + 'TO_DATE(' +QuotedStr(_CdsElegivel.FieldByName('DATAADMISSAO').asString)+ ',''DD/MM/YYYY''), '
    else
      sSQL := sSQL + 'NULL, ';

    if (Trim(_CdsElegivel.FieldByName('DATADEMISSAO').asString) <> '') then
      sSQL := sSQL + 'TO_DATE(' +QuotedStr(_CdsElegivel.FieldByName('DATADEMISSAO').asString)+ ',''DD/MM/YYYY''), '
    else
      sSQL := sSQL + 'NULL, ';

    if (Trim(_CdsElegivel.FieldByName('SALTOTAL').asString) <> '') then
      sSQL := sSQL + Float2String(_CdsElegivel.FieldByName('SALTOTAL').asFloat)+ ', '
    else
      sSQL := sSQL + 'NULL, ';

    if (Trim(_CdsElegivel.FieldByName('DATAREADMISSAO').asString) <> '') then
      sSQL := sSQL + 'TO_DATE(' +QuotedStr(_CdsElegivel.FieldByName('DATAREADMISSAO').asString)+ ',''DD/MM/YYYY''), '
    else
      sSQL := sSQL + 'NULL, ';

    if (Trim(_CdsElegivel.FieldByName('IDESTAB').asString) <> '') then
      sSQL := sSQL + _CdsElegivel.FieldByName('IDESTAB').asString+ ', '
    else
      sSQL := sSQL + 'NULL, ';

    if (dIdCargo > 0) then
      sSQL := sSQL +
        FloatToStr(IdFundacao)+ ', '+
        FloatToStr(dIdCargo)+ ', '
    else
      sSQL := sSQL +
        'NULL, '+
        'NULL, ';

    if (dIdFuncao > 0) then
      sSQL := sSQL +
        FloatToStr(IdFundacao)+ ', '+
        FloatToStr(dIdFuncao)+ ', '
    else
      sSQL := sSQL +
        'NULL, '+
        'NULL, ';

    sSQL := sSQL +
      '0, '+    // PARTICIPPREVID
      '0, '+    // PARTICIPASSIST
      'NULL, '+ // NIVEL
      'NULL, '+ // INICIOAFAST
      'NULL, '+ // FIMAFAST
      '0, '+    // TEMPONAOCREDITADO
      '0, '+    // TEMPOSERVANTERIOR
      '0, '+    // TEMPOSERVANTREAL
      '0, '+    // TEMPOSITESPECIAL
      'NULL, '+ // VALORBASE1
      'NULL, '+ // VALORBASE2
      'NULL, '+ // VALORBASE3
      'NULL, '+ // IDPESSJURORGAO
      'NULL, '+ // SIGLA
      '0, '+    // FLGDIRETOR
      'NULL'+   // CODVINCULAFUNC
      ')';

    if not(ExecSQL(sSQL)) then
      raise Exception.Create(MessageInfo);

    dIdCargo := _CdsElegivel.FieldByName('IDCARGO').asFloat;
    if not(ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa, -1, 'C', dIdCargo)) then
      raise Exception.Create(MessageInfo);

    dIdFuncao := _CdsElegivel.FieldByName('IDFUNCAO').asFloat;
    if not(ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa, -1, 'F', dIdFuncao)) then
      raise Exception.Create(MessageInfo);

    if (_CdsElegivel.FieldByName('IDAGENCIASALARIO').asFloat > 0) and
       (_CdsElegivel.FieldByName('NUMCONTASALARIO').asString <> '') then
    begin
      if not(ProcessaDE_PARA_CONTABANCARIA(IdPessoa,
             _CdsElegivel.FieldByName('IDAGENCIASALARIO').asFloat,
             _CdsElegivel.FieldByName('NUMCONTASALARIO').asString)) then
      begin
        raise Exception.Create(MessageInfo);
      end;
    end;

  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
  _CdsElegivel.Free;
end;

function TCtrlIntegraPrevRH.InsereFuncionarioDependente(IdPessoa: double): boolean;
begin
  Result := true;
  try
    // Inserir pessoa na tabela DEPENDENTE
    ExecSQL('INSERT INTO DEPENDENTE (IDPESSOA, FLGDESIGNADO) VALUES (' +FloatToStr(IdPessoa)+ ',0)');
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlIntegraPrevRH.InsereFuncionarioDepentit(IdPessoa: double): boolean;
begin
  Result := true;
  try
    // Inserir pessoa na tabela DEPENTIT
    ExecSQL('INSERT INTO DEPENTIT (IDPESSOA,IDTITULAR,IDDEPENDENCIA,'+
             'NUMSEQUENCIA,FLGCONTAIMPOSTOR,FLGCONTASALARIOF,FLGBENEFICIARIO,MATRICULA)'+
             ' VALUES (' +FloatToStr(IdPessoa)+','+FloatToStr(IdPessoa)+ ',''PRP'',0,0,0,1,'+
             QuotedStr(sMatricula)+')');
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlIntegraPrevRH.AlteraFuncionarioElegivel(IdFundacao, IdPessoa: double): boolean;
var
  sSQL: string;
  _CdsAux, _CdsElegivel, _CdsFunc: TCMClientDataSet;
  dIdCargo: double;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsElegivel := TCMClientDataSet.Create(nil);
  _CdsFunc := TCMClientDataSet.Create(nil);

  Result := true;
  sSQL := '';

  try
    // Buscar dados da pessoa na tabela de funcionario
    _CdsFunc.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  F.IDPESSOA, F.IDSITFUNC, F.IDEMPRESA AS IDEMPRESAPROP, F.CODCENTROCUSTO,' +CR_LF+
      '  F.MATRICULA, F.DATAADMISSAO, DECODE(S.TIPOSIT,''D'',TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY''),'''') AS DATADEMISSAO,' +CR_LF+
      '  F.SALARIOATUAL AS SALTOTAL, DECODE(S.TIPOSIT,''D'','''',TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'')) AS DATAINICIOAFAST, F.DATARETORNO AS DATAFIMAFAST,' +CR_LF+
      '  F.IDESTAB, F.IDCARGO, F.IDFUNCAO, F.IDFAIXACARGO, F.IDFAIXAFUNCAO,' +CR_LF+
      '  F.NIVELINDIV1, F.NIVELINDIV2, F.IDAGENCIASALARIO, F.NUMCONTASALARIO,' +CR_LF+
      '  C.IDCARGO AS CODCARGO' +CR_LF+
      'FROM' +CR_LF+
      '  FUNCIONARIO F, CARGO C, SITFUNC S' +CR_LF+
      'WHERE' +CR_LF+
      '  (F.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      '  (F.IDSITFUNC = S.IDSITFUNC) AND' +CR_LF+
      '  (F.IDCARGO  = C.IDCARGO(+))');

    sMatricula := _CdsFunc.FieldByName('MATRICULA').asString;
    // Buscar dados da pessoa na tabela de elegpatro
    _CdsElegivel.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  EL.IDPESSOA,EL.IDSITFUNC, EL.IDEMPRESAPROP, EL.CODCENTROCUSTO, EL.MATRICULA,' +CR_LF+
      '  EL.DATAADMISSAO, EL.DATADEMISSAO, EL.SALTOTAL, EL.DATAREADMISSAO, EL.IDESTAB,' +CR_LF+
      '  EL.IDCARGOEXT, EL.IDFUNCAOEXT, C.IDAGENCIA, C.CONTACORRENTE,' +CR_LF+
      '  CEXT.CODIGO AS CODCARGO, EL.DATAFIMAFAST, EL.DATAINICIOAFAST' +CR_LF+
      'FROM' +CR_LF+
      '  CONTABANCARIA C, CARGOEXT CEXT, ELEGPATRO EL' +CR_LF+
      'WHERE' +CR_LF+
      '  (EL.IDPESSJUR  = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
      '  (EL.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      '  (EL.IDCARGOEXT = CEXT.IDCARGOEXT) AND' +CR_LF+
      '  (EL.IDPESSOA   = C.IDPESSOA(+))');

    if (_CdsElegivel.FieldByName('IDSITFUNC').asString <>
        _CdsFunc.FieldByName('IDSITFUNC').asString) then
    begin
      sSQL := sSQL + ', IDSITFUNC = '+_CdsFunc.FieldByName('IDSITFUNC').asString;
      InsereCriticaInterface(IdFundacao, IdPessoa,
        _CdsFunc.FieldByName('IDSITFUNC').asString,
        _CdsElegivel.FieldByName('IDSITFUNC').asString,
        _CdsFunc.FieldByName('MATRICULA').asString, ceEmprNovo, 'N');
    end;

    if (_CdsElegivel.FieldByName('CODCENTROCUSTO').asString <>
        _CdsFunc.FieldByName('CODCENTROCUSTO').asString) then
    begin
      sSQL := sSQL + ', IDEMPRESAPROP  = ' +_CdsFunc.FieldByName('IDEMPRESAPROP').asString+
                     ', CODCENTROCUSTO = ' +QuotedStr(_CdsFunc.FieldByName('CODCENTROCUSTO').asString);
      InsereCriticaInterface(IdFundacao, IdPessoa,
        _CdsFunc.FieldByName('CODCENTROCUSTO').asString,
        _CdsElegivel.FieldByName('CODCENTROCUSTO').asString,
        _CdsFunc.FieldByName('MATRICULA').asString, ceCCustoAlterado, 'C');
    end;

    if (_CdsElegivel.FieldByName('MATRICULA').asString <>
        _CdsFunc.FieldByName('MATRICULA').asString) then
    begin
      _CdsAux.Data := GetDataPacket('SELECT FLGATUMATRICULA FROM PARAMAPREV');

      if not(_CdsAux.IsEmpty) and (_CdsAux.FieldByName('FLGATUMATRICULA').asInteger = 1) then
      begin
        sSQL := sSQL + ', MATRICULA = '+ QuotedStr(_CdsFunc.FieldByName('MATRICULA').asString);
        InsereCriticaInterface(IdFundacao, IdPessoa,
          _CdsFunc.FieldByName('MATRICULA').asString,
          _CdsElegivel.FieldByName('MATRICULA').asString,
          _CdsFunc.FieldByName('MATRICULA').asString, ceMatriculaAlterada, 'C');
      end
      else
        sMatricula := '';
    end;

    if (_CdsElegivel.FieldByName('DATAADMISSAO').asString <>
        _CdsFunc.FieldByName('DATAADMISSAO').asString) then
    begin
      if (_CdsFunc.FieldByName('DATAADMISSAO').asString <> '') then
        sSQL := sSQL + ', DATAADMISSAO = TO_DATE(' +QuotedStr(_CdsFunc.FieldByName('DATAADMISSAO').asString)+ ', ''DD/MM/YYYY'')'
      else
        sSQL := sSQL + ', DATAADMISSAO = NULL ';

      InsereCriticaInterface(IdFundacao, IdPessoa,
        _CdsFunc.FieldByName('DATAADMISSAO').asString,
        _CdsElegivel.FieldByName('DATAADMISSAO').asString,
        _CdsFunc.FieldByName('MATRICULA').asString, ceDataAdmAlterada, 'D');
    end;

    if (_CdsElegivel.FieldByName('DATADEMISSAO').asString <>
        _CdsFunc.FieldByName('DATADEMISSAO').asString) then
    begin
      if (_CdsFunc.FieldByName('DATADEMISSAO').asString <> '') then
        sSQL := sSQL + ', DATADEMISSAO = TO_DATE(' +QuotedStr(_CdsFunc.FieldByName('DATADEMISSAO').asString)+ ', ''DD/MM/YYYY'')'
      else
        sSQL := sSQL + ', DATADEMISSAO = NULL ';

      InsereCriticaInterface(IdFundacao, IdPessoa,
        _CdsFunc.FieldByName('DATADEMISSAO').asString,
        _CdsElegivel.FieldByName('DATADEMISSAO').asString,
        _CdsFunc.FieldByName('MATRICULA').asString, ceDtDemissaoAlterada, 'D');
    end;

    if (_CdsElegivel.FieldByName('DATAINICIOAFAST').asString <>
        _CdsFunc.FieldByName('DATAINICIOAFAST').asString) then
    begin
      if (not _CdsFunc.FieldByName('DATAINICIOAFAST').isNull) then
        sSQL := sSQL + ', DATAINICIOAFAST = TO_DATE(' +QuotedStr(_CdsFunc.FieldByName('DATAINICIOAFAST').asString)+ ', ''DD/MM/YYYY'')'
      else
        sSQL := sSQL + ', DATAINICIOAFAST = NULL ';

      InsereCriticaInterface(IdFundacao, IdPessoa,
        _CdsFunc.FieldByName('DATAINICIOAFAST').asString,
        _CdsElegivel.FieldByName('DATAINICIOAFAST').asString,
        _CdsFunc.FieldByName('MATRICULA').asString, ceDtDemissaoAlterada, 'D');
    end;

    if (_CdsElegivel.FieldByName('DATAFIMAFAST').asString <>
        _CdsFunc.FieldByName('DATAFIMAFAST').asString) then
    begin
      if (_CdsFunc.FieldByName('DATAFIMAFAST').asString <> '') then
        sSQL := sSQL + ', DATAFIMAFAST = TO_DATE(' +QuotedStr(_CdsFunc.FieldByName('DATAFIMAFAST').asString)+ ', ''DD/MM/YYYY'')'
      else
        sSQL := sSQL + ', DATAFIMAFAST = NULL ';

      InsereCriticaInterface(IdFundacao, IdPessoa,
        _CdsFunc.FieldByName('DATAFIMAFAST').asString,
        _CdsElegivel.FieldByName('DATAFIMAFAST').asString,
        _CdsFunc.FieldByName('MATRICULA').asString, ceDtDemissaoAlterada, 'D');
    end;

    if (_CdsElegivel.FieldByName('SALTOTAL').asString <>
        _CdsFunc.FieldByName('SALTOTAL').asString) then
    begin
      sSQL := sSQL + ', SALTOTAL = '+Float2String(_CdsFunc.FieldByName('SALTOTAL').asFloat);
      InsereCriticaInterface(IdFundacao, IdPessoa,
        _CdsFunc.FieldByName('SALTOTAL').asString,
        _CdsElegivel.FieldByName('SALTOTAL').asString,
        _CdsFunc.FieldByName('MATRICULA').asString, ceSalarioAlterado, 'N');
    end;

    if (_CdsElegivel.FieldByName('IDESTAB').asString <>
        _CdsFunc.FieldByName('IDESTAB').asString) then
    begin
      sSQL := sSQL + ', IDESTAB = '+_CdsFunc.FieldByName('IDESTAB').asString;
      InsereCriticaInterface(IdFundacao, IdPessoa,
        _CdsFunc.FieldByName('IDESTAB').asString,
        _CdsElegivel.FieldByName('IDESTAB').asString,
        _CdsFunc.FieldByName('MATRICULA').asString, ceFilialAlterada, 'N');
    end;

    if (_CdsElegivel.FieldByName('CODCARGO').asString <>
        _CdsFunc.FieldByName('CODCARGO').asString) then
    begin
      dIdCargo := _CdsFunc.FieldByName('IDCARGO').asInteger;

      if not(ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa,
             _CdsElegivel.FieldByName('IDCARGOEXT').asFloat, 'C', dIdCargo)) then
        raise Exception.Create(MessageInfo);

      sSQL := sSQL + ', IDCARGOEXT = '+FloatToStr(dIdCargo);
      InsereCriticaInterface(IdFundacao, IdPessoa,
        _CdsFunc.FieldByName('CODCARGO').asString,
        _CdsElegivel.FieldByName('CODCARGO').asString,
        _CdsFunc.FieldByName('MATRICULA').asString, ceCargoAlterado, 'N');
    end;

    if (Trim(sSQL) <> '') then
    begin
      sSQL := Copy(sSQL, 2, Length(sSQL)-1);

      if not(ExecSQL(
        'UPDATE ELEGPATRO SET ' +sSQL+ CR_LF+
        'WHERE  (IDPESSJUR = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
        '       (IDPESSOA  = ' +FloatToStr(IdPessoa)+ ')')) then
      begin
        raise Exception.Create(MessageInfo);
      end;
    end;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
  _CdsFunc.Free;
  _CdsElegivel.Free;
  _CdsAux.Free;
end;

function TCtrlIntegraPrevRH.AlteraFuncionarioDepenTit(IdPessoa: double): boolean;
var _CdsElegivel: TCMClientDataSet;
begin
  //P.RAMOS-24.03.2005-PEND.18908
  Result := true;

  _CdsElegivel := TCMClientDataSet.Create(nil);

  try
    try
      _CdsElegivel.Data := GetDataPacket(
        'SELECT E1.IDPESSJUR, E1.IDPESSOA' +CR_LF+
        'FROM ELEGPATRO E1' +CR_LF+
        'WHERE (E1.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') ' +CR_LF+
        'AND EXISTS (SELECT 1' +CR_LF+
        '            FROM ELEGPATRO E2' +CR_LF+
        '            WHERE E2.IDPESSOA = E1.IDPESSOA' +CR_LF+
        '            AND E2.IDPESSJUR = E1.IDPESSJURCEDIDO)');

      //SE RETORNAR REGISTRO É PORQUE A PESSOA É CEDIDA (NA FUNCEF CHAMA-SE LEF)
      if not _CdsElegivel.isempty then
        exit;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        Result := false;
        exit;
      end;
    end;
  finally
    _CdsElegivel.Free;
  end;
  //P.RAMOS-24.03.2005-PEND.18908-FIM

  try
    Result := ExecSQL(
      'UPDATE DEPENTIT SET MATRICULA = ' +QuotedStr(sMatricula)+ CR_LF+
      'WHERE  (IDTITULAR = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      '       (IDPESSOA  = ' +FloatToStr(IdPessoa)+ ')');

    if not(Result) then
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlIntegraPrevRH.ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa,
  IdCargoElegPatro: double; Tipo: char; var IdCargo: double): boolean;
var
  _CdsAux: TCMClientDataSet;
  dIdPCS, dIdCargoOriginal, dIdCargoPrev: double;
  sDataAlterFunc, sSQL: string;
begin
  Result := true;

  if (IdCargo <= 0) then
    exit;

  _CdsAux := TCMClientDataSet.Create(nil);

  dIdCargoOriginal := IdCargo;

  try
    // Verificar se cargo está na tabela CARGOEXT
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  IDCARGOEXT' +CR_LF+
      'FROM' +CR_LF+
      '  CARGOEXT' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSJUR     = ' +QuotedStr(FloatToStr(IdFundacao))+ ') AND' +CR_LF+
      '  (RTRIM(CODIGO) = ' +QuotedStr(FloatToStr(IdCargo))+ ')');

    if not(_CdsAux.IsEmpty) then
      IdCargo := _CdsAux.FieldByName('IDCARGOEXT').asFloat
    else
    begin
      // Cargo não está na tabela CARGOEXT. O cargo deverá ser inserido na tabela de cargos
      // Buscar PCS válido no momento
      _CdsAux.Data := GetDataPacket(
        'SELECT' +CR_LF+
        '  IDPCS' +CR_LF+
        'FROM' +CR_LF+
        '  PCS' +CR_LF+
        'WHERE' +CR_LF+
        '  (IDPESSJUR      = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
        '  (FINALVIGENCIA IS NULL)');

      if not(_CdsAux.IsEmpty) then
        dIdPCS := _CdsAux.FieldByName('IDPCS').asFloat
      else
        dIdPCS := -1;

      _CdsAux.Data := GetDataPacket(
        'SELECT' +CR_LF+
        '  IDCARGO, TITULO, DESCRICAO, CBO, IDFAIXASALARIAL, CODNIVEL' +CR_LF+
        'FROM' +CR_LF+
        '  CARGO' +CR_LF+
        'WHERE' +CR_LF+
        '  (IDCARGO = ' +FloatToStr(IdCargo)+ ')');

      dIdCargoPrev := GetSequence('CARGOEXT');
      IdCargo := dIdCargoPrev;

      sSQL :=
        'INSERT INTO CARGOEXT' +CR_LF+
        '  (IDCARGOEXT, IDFAIXASALEXT, TITULO, CBO, DESCRICAO, IDPESSJUR,' +CR_LF+
        '   IDPCS, IDCARREIRA, TIPO, JORNADA, FLGATIVO, IDTIPOFUNC,' +CR_LF+
        '   CODIGO, NOMERESUMIDO, FLGPCC, IDCARGOCORRESP, DATACRIACAO,' +CR_LF+
        '   ANOMESALT, ULTMESPROC)' +CR_LF+
        'VALUES (';

      sSQL := sSQL +
        FloatToStr(dIdCargoPrev)+ ', '+
        'NULL, '+ // idfaixasalext não é usado
        QuotedStr(_CdsAux.FieldByName('TITULO').asString)+ ', ';

      if (_CdsAux.FieldbyName('CBO').asString = '') then
        sSQL := sSQL +'NULL, '
      else
        sSQL := sSQL +_CdsAux.FieldbyName('CBO').asString+', ';

      sSQL := sSQL +
        'NULL, '+ // descricao é um campo memo
        FloatToStr(IdFundacao)+ ', ';

      if (dIdPCS > 0) then
        sSQL := sSQL +FloatToStr(dIdPCS)+ ', '
      else
        sSQL := sSQL +'NULL, ';

      sSQL := sSQL +
        'NULL, '+
        QuotedStr(Tipo)+ ', '+
        'NULL, '+
        '1, '+
        'NULL, '+
        FloatToStr(IdCargo)+ ', '+
        'NULL, '+
        '0, '+
        'NULL, '+
        'TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''), '+
        '''0000/00'', '+
        '''0000/00'')';
        
      if not(ExecSQL(sSQL)) then
        raise Exception.Create(MessageInfo);
    end;

    if (IdPessoa <= 0) then
    begin
      _CdsAux.Free;
      exit
    end;

    // Inserir CARGO na tabela EVOLFUNCPREV
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  MAX(E.DATAALTERFUNC) AS DATAALTERFUNC' +CR_LF+
      'FROM' +CR_LF+
      '  EVOLFUNC E, MOTIVO M' +CR_LF+
      'WHERE' +CR_LF+
      '  (E.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      IFF(Tipo = 'C',
        '  (E.IDCARGO     = ' +FloatToStr(dIdCargoOriginal)+ ') AND',
        '  (E.IDFUNCAO    = ' +FloatToStr(dIdCargoOriginal)+ ') AND') +CR_LF+
      '  (M.IDMOTIVO    = E.IDMOTIVO) AND' +CR_LF+
      '  (M.GRUPOMOTIVO = ''A'')');

    if (_CdsAux.IsEmpty) or (_CdsAux.FieldByName('DATAALTERFUNC').asString = '') then
    begin
      _CdsAux.Free;
      exit;
    end;

    sDataAlterFunc := _CdsAux.FieldbyName('DATAALTERFUNC').asString;

    // Atualizar cargo/função anterior com datafinal = (data inicio do novo cargo) - 1
    if not(ExecSQL(
      'UPDATE EVOLFUNCPREV SET'+
      '       DATAFINAL  = TO_DATE(' +QuotedStr(DateToStr(StrToDate(sDataAlterFunc)-1))+ ',''DD/MM/YYYY'')' +CR_LF+
      'WHERE (IDPESSJUR  = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
      '      (IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      IFF(Tipo = 'C',
        '      (IDCARGOEXT = ' +FloatToStr(IdCargoElegPatro)+ ') AND',
        '      (IDFUNCAO   = ' +FloatToStr(IdCargoElegPatro)+ ') AND') +CR_LF+
      '      (DATAINICIO = (SELECT MAX(DATAINICIO)' +CR_LF+
      '                     FROM   EVOLFUNCPREV' +CR_LF+
      '                     WHERE  (IDPESSJUR  = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
      '                            (IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      IFF(Tipo = 'C',
        '                            (IDCARGOEXT = ' +FloatToStr(IdCargoElegPatro)+ ')',
        '                            (IDFUNCAO   = ' +FloatToStr(IdCargoElegPatro)+ ')') +CR_LF+
      '                    ))')) then
    begin
      raise Exception.Create(MessageInfo);
    end;

    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  SEQHISTFUNC' +CR_LF+
      'FROM' +CR_LF+
      '  EVOLFUNCPREV' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      IFF(Tipo = 'C',
        '  (IDCARGOEXT = ' +FloatToStr(IdCargo)+ ') AND',
        '  (IDFUNCAO   = ' +FloatToStr(IdCargo)+ ') AND') +CR_LF+
      '  (DATAINICIO = TO_DATE(' +QuotedStr(sDataAlterFunc)+ ',''DD/MM/YYYY''))');

    if not(_CdsAux.IsEmpty) then
    begin
      _CdsAux.Free;
      exit;
    end;

    sSQL :=
      'INSERT INTO EVOLFUNCPREV' +CR_LF+
      '  (DATAINICIO, DATAFINAL, IDPESSJURCG, IDCARGOEXT, IDPESSJURFG, IDFUNCAO,' +CR_LF+
      '   IDPESSJURGR, IDGRUPOFUNC, IDPESSJUR, IDPESSOA, MODOFUNCAO, ORIGEM,' +CR_LF+
      '   PERCADNOT, PERCATS, PERCADICIONALNOT, PERCFUNCAO, PERCINSALUB,' +CR_LF+
      '   PERCPERICUL, PERC1AC, PERC2AC, QTDEMINUTOS, SEQHISTFUNC)' +CR_LF+
      'VALUES (' +
      '  TO_DATE(' +QuotedStr(sDataAlterFunc)+ ',''DD/MM/YYYY''), '+ // DATAINICIO
      'NULL, '; // DATAFINAL

    if (Tipo = 'C') then
      sSQL := sSQL +
        FloatToStr(IdFundacao)+ ', '+ // IDPESSJURCG
        FloatToStr(IdCargo)+ ', '+ // IDCARGOEXT
        'NULL, '+ // IDPESSJURFG
        'NULL, '+ // IDFUNCAO
        'NULL, '+ // IDPESSJURGR
        'NULL, '  // IDGRUPOFUNC
    else
      sSQL := sSQL +
        'NULL, '+ // IDPESSJURCG
        'NULL, '+ // IDCARGOEXT
        FloatToStr(IdFundacao)+ ', '+ // IDPESSJURFG
        FloatToStr(IdCargo)+ ', '+ // IDFUNCAO
        'NULL, '+ // IDPESSJURGR
        'NULL, '; // IDGRUPOFUNC

    sSQL := sSQL +
      FloatToStr(IdFundacao)+ ', '+ // IDPESSJUR
      FloatToStr(IdPessoa)+ ', '; // IDPESSOA

    if (Tipo = 'C') then
      sSQL := sSQL +'NULL, ' // MODOFUNCAO
    else
      sSQL := sSQL +'''ES'', '; // MODOFUNCAO : ES = EVENTUAL/SUBSTITUIÇÃO

    sSQL := sSQL +
      '''I'', '+ // ORIGEM
      'NULL, '+ // PERCADNOT
      'NULL, '+ // PERCATS
      'NULL, '+ // PERCADICIONALNOT
      'NULL, '+ // PERCFUNCAO
      'NULL, '+ // PERCINSALUB
      'NULL, '+ // PERCPERICUL
      'NULL, '+ // PERC1AC
      'NULL, '+ // PERC2AC
      'NULL, '+ // QTDEMINUTOS
      FloatToStr(GetSequence('EVOLFUNCPREV'))+ // SEQHISTFUNC
      ')';

    if not(ExecSQL(sSQL)) then
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
  _CdsAux.Free;
end;

function TCtrlIntegraPrevRH.ProcessaDE_PARA_CONTABANCARIA(IdPessoa, IdAgencia: double;
  NumConta: string): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  Result := true;
  try
    // Verificar se conta bancária está na tabela CONTABANCARIA
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  IDCBANCARIA, CONTACORRENTE, IDAGENCIA,' +CR_LF+
      '  FLGCONTAPREF, IDPESSOA, TIPOCONTA, FLGCONTACONJUNTA' +CR_LF+
      'FROM' +CR_LF+
      '  CONTABANCARIA' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');

    if (_CdsAux.IsEmpty) then // pessoa nao tem contabancaria cadastrada
    begin
      if not(ExecSQL(
        'INSERT INTO CONTABANCARIA' +CR_LF+
        '  (IDCBANCARIA, CONTACORRENTE, IDAGENCIA,' +CR_LF+
        '   FLGCONTAPREF, IDPESSOA, TIPOCONTA, FLGCONTACONJUNTA)' +CR_LF+
        'VALUES (' +
        FloatToStr(GetSequence('CONTABANCARIA'))+ ', '+
        QuotedStr(NumConta)+ ', '+
        FloatToStr(IdAgencia)+ ', '+
        '1, '+
       FloatToStr(IdPessoa)+ ', '+
        '''0'', ''N'')')) then
      begin
        raise Exception.Create(MessageInfo);
      end;
    end
    else
    begin // pessoa já tem conta bancaria
      if ((_CdsAux.FieldByName('IDAGENCIA').asFloat = IdAgencia) and
          (_CdsAux.FieldByName('CONTACORRENTE').asString <> NumConta)) or
         ((_CdsAux.FieldByName('IDAGENCIA').asFloat <> IdAgencia) and
          (_CdsAux.FieldByName('CONTACORRENTE').asString = NumConta)) then
      begin // pessoa apenas mudou de agencia ou conta
        if not(ExecSQL(
          'UPDATE CONTABANCARIA' +CR_LF+
          'SET    IDAGENCIA = ' +FloatToStr(IdAgencia)+ ', CONTACORRENTE = ' +QuotedStr(NumConta)+
          'WHERE  IDCBANCARIA = '+_CdsAux.FieldByName('IDCBANCARIA').asString)) then
        begin
          raise Exception.Create(MessageInfo);
        end;
      end
      else
      begin // pessoa tem uma nova conta bancaria
            // Alterar a conta anterior para NAO-PREFERENCIAL e inserir a nova como PREFERENCIAL
        if not(ExecSQL(
          'UPDATE CONTABANCARIA SET FLGCONTAPREF = 0' +CR_LF+
          'WHERE  IDCBANCARIA = ' +_CdsAux.FieldByName('IDCBANCARIA').asString)) then
        begin
          raise Exception.Create(MessageInfo);
        end;

        if not(ExecSQL(
          'INSERT INTO CONTABANCARIA' +CR_LF+
          '  (IDCBANCARIA, CONTACORRENTE, IDAGENCIA,' +CR_LF+
          '   FLGCONTAPREF, IDPESSOA, TIPOCONTA, FLGCONTACONJUNTA)' +CR_LF+
          'VALUES (' +
          FloatToStr(GetSequence('CONTABANCARIA'))+ ', '+
          QuotedStr(NumConta)+ ', '+
          FloatToStr(IdAgencia)+ ', '+
          '1, '+
          FloatToStr(IdPessoa)+ ', '+
          '''0'', ''N'')')) then
        begin
          raise Exception.Create(MessageInfo);
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
  _CdsAux.Free;
end;

function TCtrlIntegraPrevRH.InsereCriticaInterface(IdFundacao, IdPessoa: double;
  ValorNoRH, ValorNoAdmPREV, Matricula, CodErro, TipoDado: string): boolean;
var
  iSeqCritica: LongInt;
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  Result := true;
  try
    _CdsAux.Data := GetDataPacket('SELECT MAX(SEQCRITICA) SEQCRITICA FROM TABCRITICASCCP');

    if (_CdsAux.IsEmpty) then
      iSeqCritica := 1
    else
      iSeqCritica := _CdsAux.FieldByName('SEQCRITICA').asInteger + 1;

    if not(ExecSQL(
      'INSERT INTO TABCRITICASCCP' +CR_LF+
      '  (IDPESSJUR, IDPESSOA, SEQCRITICA, MESCOBRANCA, VALORCHAVE, VALORNAFUNDACAO,' +CR_LF+
      '   VALORNOINTERFACE, CHAVE, CODERRO, TIPODADO, GRUPO, FLGPROCESSADO, DTPROCESSADO)' +CR_LF+
      'VALUES (' +
      FloatToStr(IdFundacao)+ ', '+
      FloatToStr(IdPessoa)+ ', '+
      FloatToStr(iSeqCritica)+ ', '+
      QuotedStr(Copy(DateToStr(Date),7,4) + Copy(DateToStr(Date),4,2))+ ', '+
      QuotedStr(Matricula)+ ', '+
      QuotedStr(ValorNoAdmPREV)+ ', '+
      QuotedStr(ValorNoRH)+ ', '+
      '''M'', '+
      CodErro+ ', '+
      QuotedStr(TipoDado)+', '+
      '''R'', '+
      '0, '+
      'SYSDATE)')) then
    begin
      raise Exception.Create(MessageInfo);
    end;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
  _CdsAux.Free;
end;

function TCtrlIntegraPrevRH.AtualizaDadosPrevFuncionario(IdFundacao, IdPessoa: double): boolean;
var
  _CdsElegivel: TCMClientDataSet;
begin
  _CdsElegivel := TCMClientDataSet.Create(nil);

  Result := true;
  try
    // Verificar se pessoa é elegivel da fundacao
    _CdsElegivel.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  MATRICULA' +CR_LF+
      'FROM' +CR_LF+
      '  ELEGPATRO' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSJUR         = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
      '  ((IDPESSJURCEDIDO IS NULL) OR' +CR_LF+
      '   (IDPESSJURCEDIDO  = ' +FloatToStr(IdFundacao)+ ')) AND' +CR_LF+
      '  (IDPESSOA          = ' +FloatToStr(IdPessoa)+ ')');

    StartTransaction;

    if (_CdsElegivel.IsEmpty) then
    begin
      if not(InsereFuncionarioElegivel(IdFundacao, IdPessoa)) then
        raise Exception.Create(MessageInfo);
    end
    else
    begin
      if not(AlteraFuncionarioElegivel(IdFundacao, IdPessoa)) then
        raise Exception.Create(MessageInfo);
    end;

    // Verificar se pessoa é dependente
    _CdsElegivel.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  IDPESSOA' +CR_LF+
      'FROM' +CR_LF+
      '  DEPENDENTE' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA          = ' +FloatToStr(IdPessoa)+ ')');

    if (_CdsElegivel.IsEmpty) then
    begin
      if not(InsereFuncionarioDependente(IdPessoa)) then
        raise Exception.Create(MessageInfo);
    end;

    // Verificar se pessoa está em depentit
    _CdsElegivel.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  MATRICULA' +CR_LF+
      'FROM' +CR_LF+
      '  DEPENTIT' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDTITULAR         = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      '  (IDPESSOA          = ' +FloatToStr(IdPessoa)+ ')');

    if (_CdsElegivel.IsEmpty) then
    begin
      if not(InsereFuncionarioDepentit(IdPessoa)) then
        raise Exception.Create(MessageInfo);
    end
    else 
    if (sMatricula <> _CdsElegivel.FieldByName('MATRICULA').asString) then
    begin
      if not(AlteraFuncionarioDepentit(IdPessoa)) then
        raise Exception.Create(MessageInfo);
    end;

    Commit;
  except
    on E: Exception do
    begin
      Rollback;
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
  _CdsElegivel.Free;
end;

function TCtrlIntegraPrevRH.AtualizaFaixasSalariais(IdFundacao: double): boolean;
var
  wFaixa: word;
  sIdNivel: string;
  dIdCargoRH, dIdCargoExt: double;
  _CdsFaixasRH, _CdsFaixasPREV: TCMClientDataSet;
begin
  _CdsFaixasRH := TCMClientDataSet.Create(nil);
  _CdsFaixasPREV := TCMClientDataSet.Create(nil);

  Result := true;

  try
    // Trazer todos os cargos e suas faixas
    _CdsFaixasRH.Data := GetDataPacket(
      '(SELECT' +CR_LF+
      '   C.IDCARGO, F.IDFAIXASALARIAL, F.STEP1, F.STEP2, F.STEP3,' +CR_LF+
      '   F.STEP4, F.STEP5, F.STEP6, F.STEP7, F.STEP8, F.STEP9, F.DATAEFETIV,' +CR_LF+
      '   0.00 AS FATOR' +CR_LF+
      ' FROM' +CR_LF+
      '   CARGO C, FAIXASAL F' +CR_LF+
      ' WHERE' +CR_LF+
      '   (F.IDFAIXASALARIAL = C.IDFAIXASALARIAL))' +CR_LF+
      'UNION' +CR_LF+
      '(SELECT' +CR_LF+
      '   C.IDCARGO, F.IDFAIXASALARIAL, F.STEP1, F.STEP2, F.STEP3,' +CR_LF+
      '   F.STEP4, F.STEP5, F.STEP6, F.STEP7, F.STEP8, F.STEP9, F.DATAEFETIV,' +CR_LF+
      '   NVL(FP.FATORFAIXA,1) AS FATOR' +CR_LF+
      ' FROM' +CR_LF+
      '   FUNCIONARIO C, FAIXASAL F, FILIALPESSOA FP' +CR_LF+
      ' WHERE' +CR_LF+
      '   (F.IDFAIXASALARIAL = C.IDFAIXACARGO) AND' +CR_LF+
      '   (C.IDESTAB         = FP.IDFILIALPESSOA))' +CR_LF+
      'ORDER BY' +CR_LF+
      '  1');

    StartTransaction;

    while not(_CdsFaixasRH.EOF) do
    begin
      dIdCargoRH := _CdsFaixasRH.FieldByName('IDCARGO').asFloat;

      while not(_CdsFaixasRH.EOF) and
            (dIdCargoRH = _CdsFaixasRH.FieldByName('IDCARGO').asFloat) do
      begin
        // Verificar se cargo já existe
        _CdsFaixasPREV.Data := GetDataPacket(
          'SELECT IDCARGOEXT' +CR_LF+
          'FROM   CARGOEXT' +CR_LF+
          'WHERE (IDPESSJUR     = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
          '      (RTRIM(CODIGO) = ' +QuotedStr(FloatToStr(dIdCargoRH))+ ')');

        if (_CdsFaixasPREV.IsEmpty) then
        begin
          dIdCargoExt := dIdCargoRH;
          if not(ProcessaDE_PARA_CARGO(IdFundacao, -1, -1, 'C', dIdCargoExt)) then
            raise Exception.Create(MessageInfo)
        end
        else
          dIdCargoExt := _CdsFaixasPREV.FieldByName('IDCARGOEXT').asFloat;

        // Verificar se faixa salarial existe
        for wFaixa:=1 to 9 do
        begin
          sIdNivel := Trim(_CdsFaixasRH.FieldByName('IDFAIXASALARIAL').asString) +
            '0'+ IntToStr(wFaixa);

          // Verificar se nivel existe
          _CdsFaixasPREV.Data := GetDataPacket(
            'SELECT IDNIVEL' +CR_LF+
            'FROM   NIVEL' +CR_LF+
            'WHERE (IDNIVEL   = ' +sIdNivel+ ') AND' +CR_LF+
            '      (IDPESSJUR = ' +FloatToStr(IdFundacao)+ ')');

          if (_CdsFaixasPREV.IsEmpty) then
          begin
            if not(ExecSQL(
              'INSERT INTO NIVEL (IDPESSJUR, IDNIVEL, CODIGO)' +CR_LF+
              'VALUES ( ' +FloatToStr(IdFundacao)+ ', '+
              sIdNivel+ ', '+
              QuotedStr(sIdNivel)+ ')')) then
            begin
              raise Exception.Create(MessageInfo);
            end;
          end;

          // Verificar se existe cargoxnivel
          _CdsFaixasPREV.Data := GetDataPacket(
            'SELECT IDNIVEL' +CR_LF+
            'FROM   CARGOXNIVEL' +CR_LF+
            'WHERE  (IDCARGOEXT = ' +FloatToStr(dIdCargoExt)+ ') AND' +CR_LF+
            '       (IDNIVEL    = ' +sIdNivel+ ') AND' +CR_LF+
            '       (IDPESSJUR  = ' +FloatToStr(IdFundacao)+ ')');

          if (_CdsFaixasPREV.IsEmpty) then
          begin
            if not(ExecSQL(
              'INSERT INTO CARGOXNIVEL (IDPESSJUR, IDCARGOEXT, IDPESSJURNIVEL, IDNIVEL, '+
              'DATAVIGENCIA, DATAFIM)' +CR_LF+
              'VALUES (' +
              FloatToStr(IdFundacao)+ ', '+
              FloatToStr(dIdCargoExt)+ ', '+
              FloatToStr(IdFundacao)+ ', '+
              sIdNivel+ ', '+
              'TO_DATE(' +QuotedStr(_CdsFaixasRH.FieldByName('DATAEFETIV').asString)+ ',''DD/MM/YYYY''), ' +
              'NULL)')) then
            begin
              raise Exception.Create(MessageInfo);
            end;
          end;

          _CdsFaixasPREV.Data := GetDataPacket(
            'SELECT VALOR' +CR_LF+
            'FROM   FAIXANIVEL' +CR_LF+
            'WHERE  (IDNIVEL        = ' +sIdNivel +') AND' +CR_LF+
            '       (DATAEFETIVACAO = TO_DATE(' +QuotedStr(_CdsFaixasRH.FieldByName('DATAEFETIV').asString)+ ',''DD/MM/YYYY'')) AND' +CR_LF+
            '       (IDPESSJUR      = ' +FloatToStr(IdFundacao)+ ')');

          if (_CdsFaixasPREV.IsEmpty) then
          begin
            if (_CdsFaixasRH.FieldByName('STEP'+IntToStr(wFaixa)).asFloat > 0) then
            begin
              if not(ExecSQL(
                'INSERT INTO FAIXANIVEL (IDPESSJUR, IDNIVEL, IDFAIXASALEXT, DATAEFETIVACAO, VALOR)' +CR_LF+
                'VALUES (' +
                FloatToStr(IdFundacao)+ ', '+
                sIdNivel+ ', '+
                FloatToStr(GetSequence('FAIXANIVEL'))+ ', '+
                'TO_DATE(' +QuotedStr(_CdsFaixasRH.FieldByName('DATAEFETIV').asString)+ ',''DD/MM/YYYY''), '+
                Float2String(_CdsFaixasRH.FieldByName('STEP'+IntToStr(wFaixa)).asFloat *
                _CdsFaixasRH.FieldByName('FATOR').asFloat)+ ')')) then
              begin
                raise Exception.Create(MessageInfo);
              end;
            end;
          end
          else
          begin
            if (_CdsFaixasPREV.FieldByName('VALOR').asString <>
                _CdsFaixasRH.FieldByName('STEP'+IntToStr(wFaixa)).asString) then
            begin // faixa foi apenas alterada
              if not(ExecSQL(
                'UPDATE FAIXANIVEL SET VALOR = ' +
                    Float2String(_CdsFaixasRH.FieldByName('STEP'+IntToStr(wFaixa)).asFloat *
                    _CdsFaixasRH.FieldByName('FATOR').asFloat)+CR_LF+
                'WHERE (IDPESSJUR      = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
                '      (IDNIVEL        = ' +sIdNivel+ ') AND' +CR_LF+
                '      (DATAEFETIVACAO = TO_DATE(' +QuotedStr(_CdsFaixasRH.FieldByName('DATAEFETIV').asString)+ ',''DD/MM/YYYY''))')) then
              begin
                raise Exception.Create(MessageInfo);
              end;
            end;
          end;
        end;
        _CdsFaixasRH.Next;
      end;
    end;
    Commit;
  except
    on E: Exception do
    begin
      Rollback;
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
  _CdsFaixasRH.Free;
  _CdsFaixasPREV.Free;
end;

end.
