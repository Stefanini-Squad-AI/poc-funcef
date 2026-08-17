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
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//***************************************************************************************
//Rotina...........: function InsereCriticaInterface
//Nº SOL...........: 155521/9643
//Nº KINTANA.......: 1664446
//Data da Alteração: 28/05/2012
//Responsável......: André Oliveira
//Descrição........: Substiuição do "SELECT MAX(SEQCRITICA) SEQCRITICA FROM TABCRITICASCCP" por uma sequence motivo de performance.
//***************************************************************************************
//RESPONSÁVEL.: Douglas Siqueira
//Nº SOL......: 171426
//Nº KINTANA..: 1537613
//Data........: 06/01/2012
//Descrição...: Alteração do limite de faixas de 9 para 20.
//***************************************************************************************
//Rotina...........: CargoAntigo, SalarioAntigo, AtualizaDadosPrevFuncionario,AlteraFuncionarioElegivel
//Nº SOL...........: 142865/6462
//Nº KINTANA.......: 1417128
//Data da Alteração: 19/09/2011
//Responsável......: Arnaldo Vicente Scarin
//Descrição........: Correção da rotina de exclusao de detalhes do funcionario,
//                   fazendo com que os dados possam ser excluidos no previdenciario
//                   também.
//***************************************************************************************
//Rotina.............: ProcessaDE_PARA_CARGO
//N. Sol.............: 114634
//N. Kintana.........: 537509
//Data...............: 30/04/2009
//Responsável........: Ricardo Alves
//Descrição..........: Novos cargos na CARGOSEXT utilizam o mesmo código da
//                     tabela CARGO

// Autor(a)    : Claudio Faria
// Data        : 11/06/2008
// Pendência   : 27604
// Rotina      : ProcessaDE_PARA_CARGO
// Descricao   : Acerto na rotina que grava a tabela EVOLFUNCPREV
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 11/08/2006 - 01/11/2006
// Pendência   : 22488
// Rotina      : AlteraFuncionarioDepenTit
// Descricao   : Acerto no tratamento de funcionácio cedido demitido da fundação.
//------------------------------------------------------------------------------

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
    function AlteraFuncionarioElegivel(IdFundacao, IdPessoa: double;
                                       const sDataFiltro    : String;
                                       const bExcluiu : Boolean;
                                       const bUpdate  : Boolean): boolean;
    function AlteraFuncionarioDepenTit(IdPessoa: double): boolean;
    function ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa, IdCargoElegPatro: double;
      Tipo: char; var IdCargo: double): boolean;
    function ProcessaDE_PARA_CONTABANCARIA(IdPessoa, IdAgencia: double; NumConta: string): boolean;
    function InsereCriticaInterface(IdFundacao, IdPessoa: double; ValorNoRH, ValorNoAdmPREV,
      Matricula, CodErro, TipoDado: string; pIdEvolFunc : string): boolean; overload;
    function ExcluiCriticaInterface(idFundacao, IdPessoa: double; ValorNoRH, Matricula, CodErro, TipoDAdo : String) : Boolean;
  public
    constructor Create; override;
    destructor  Destroy; override;
    function CargoAntigo(IdPessoa: Integer; sDataFiltro: String): Double;
    function SalarioAntigo(IdPessoa: Integer; sDataFiltro: String): Double;
    function CCustoAntigo(IdPessoa: Integer; sDataFiltro: String): String;
    function DataAdmissaoAntiga(IdPessoa: Integer; sDataFiltro: String): TDateTime;
    function DataDemissaoAntiga(IdPessoa: Integer; sDataFiltro: String): TDateTime;
    function DataReadmissaoAntiga(IdPessoa: Integer; sDataFiltro: String): TDateTime;
    function EmpresaAntiga(IdPessoa: Integer; sDataFiltro: String): Integer;
    function FilialAntiga(IdPessoa: Integer; sDataFiltro: String): Integer;
    function MatriculaAntigo(IdPessoa: Integer; sDataFiltro: String): String;
    function AtualizaDadosPrevFuncionario(IdFundacao, IdPessoa: double;
                                          const sDataFiltro : String = '';
                                          bExcluiu : Boolean = False;
                                          bUpdate  : Boolean = True): boolean;
    function AtualizaFaixasSalariais(IdFundacao: double): boolean;
  protected
    function RecuperaInformacaoData(IdPessoa: Integer; pTipo,sDataFiltro: String): TdateTime;
    function RecuperaInformacaoNumerica(IdPessoa: Integer; pTipo,sDataFiltro: String): Double;
    function RecuperaInformacaoString(IdPessoa: Integer; pTipo,sDataFiltro: String): String;
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

    sSql := 'SELECT' +CR_LF+
            '  IDPESSOA, IDSITFUNC, IDEMPRESA AS IDEMPRESAPROP, CODCENTROCUSTO, MATRICULA,' +CR_LF+
            '  DATAADMISSAO, DATADESLIGAMENTO AS DATADEMISSAO, SALARIOATUAL AS SALTOTAL,' +CR_LF+
            '  DATARETORNO AS  DATAREADMISSAO, IDESTAB, IDCARGO, IDFUNCAO, IDFAIXACARGO,' +CR_LF+
            '  IDFAIXAFUNCAO, NIVELINDIV1, NIVELINDIV2, IDAGENCIASALARIO, IDAGENCIAFGTS,' +CR_LF+
            '  NUMCONTASALARIO, NUMCONTAFGTS' +CR_LF+
            'FROM' +CR_LF+
            '  FUNCIONARIO' +CR_LF+
            'WHERE' +CR_LF+
            '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')';

    _CdsElegivel.Data := GetDataPacket(sSql);

    sMatricula := _CdsElegivel.FieldByName('MATRICULA').asString;

    // Inserir pessoa na tabela ELEGPATRO
    sSQL := 'INSERT INTO ELEGPATRO' +CR_LF+
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

function TCtrlIntegraPrevRH.AlteraFuncionarioElegivel(IdFundacao, IdPessoa: double;
                                                      const sDataFiltro    : String;
                                                      const bExcluiu : Boolean;
                                                      const bUpdate  : Boolean)     : boolean;
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
    If bExcluiu and bUpdate then
    begin
      sSql := 'SELECT' +CR_LF+
        '  H.rowid as LinhaRowId,' + CR_LF +
        '  F.IDPESSOA, F.IDSITFUNC, F.IDEMPRESA AS IDEMPRESAPROP, F.CODCENTROCUSTO,' +CR_LF+
        '  F.MATRICULA, F.DATAADMISSAO, DECODE(S.TIPOSIT,''D'',TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY''),'''') AS DATADEMISSAO,' +CR_LF+
        '  DECODE(S.TIPOSIT,''D'','''',TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'')) AS DATAINICIOAFAST, F.DATARETORNO AS DATAFIMAFAST,' +CR_LF+
        '  F.IDESTAB, H.IDFUNCAO, H.IDFAIXACARGO, H.IDFAIXAFUNCAO,' +CR_LF+
        '  H.NIVELINDIV1, H.NIVELINDIV2, F.IDAGENCIASALARIO, F.NUMCONTASALARIO,' +CR_LF+
        '  C.IDCARGO AS CODCARGO,' +CR_LF+
        '(select to_number(valornafundacao) from tabcriticasccp' +#13#10+
        ' where mescobranca = '+QuotedStr(sDataFiltro)+  #13#10 +
        '   and coderro = 71 and idpessoa = ' +FloatToStr(IdPessoa)+ #13#10 +
        '   and seqcritica = (select Max(seqcritica) from tabcriticasccp' + #13#10 +
        '                     where mescobranca = '+QuotedStr(sDataFiltro)+' and coderro = 71 and idpessoa = ' +FloatToStr(IdPessoa)+ ')) as SalTotal,'+cr_lf+
        '(select to_number(valornafundacao) from tabcriticasccp' + #13#10 +
        ' where mescobranca = '+QuotedStr(sDataFiltro)+ #13#10 +
        '   and coderro = 9 and idpessoa = ' +FloatToStr(IdPessoa)+ #13#10 +
        '   and seqcritica = (select Max(seqcritica) from tabcriticasccp' + #13#10 +
        '                     where mescobranca = '+QuotedStr(sDataFiltro)+' and coderro = 9 and idpessoa = ' +FloatToStr(IdPessoa)+ ')) as IdCargo'+cr_lf+
        'FROM' +CR_LF+
        '  FUNCIONARIO F, CARGO C, CARGO C2, SITFUNC S, EVOLFUNC H' +CR_LF+
        'WHERE' +CR_LF+
        '  (F.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
        '  (F.IDPESSOA = H.IDPESSOA) AND '+CR_LF+
        '  (F.IDSITFUNC = S.IDSITFUNC) AND' +CR_LF+
        '  (H.IDFUNCAO  = C2.IDCARGO(+)) AND' +CR_LF+
        '  (H.IDCARGO   = C.IDCARGO(+))';
    end
    else
    begin
      // Buscar dados da pessoa na tabela de funcionario
      sSql := 'SELECT' +CR_LF+
              '  H.rowid as LinhaRowId,' + CR_LF +
              '  F.IDPESSOA, F.IDSITFUNC, F.IDEMPRESA AS IDEMPRESAPROP, F.CODCENTROCUSTO,' +CR_LF+
              '  F.MATRICULA, F.DATAADMISSAO, DECODE(S.TIPOSIT,''D'',TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY''),'''') AS DATADEMISSAO,' +CR_LF+
              '  F.SALARIOATUAL AS SALTOTAL, DECODE(S.TIPOSIT,''D'','''',TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'')) AS DATAINICIOAFAST, F.DATARETORNO AS DATAFIMAFAST,' +CR_LF+
              '  F.IDESTAB, F.IDCARGO, F.IDFUNCAO, F.IDFAIXACARGO, F.IDFAIXAFUNCAO,' +CR_LF+
              '  F.NIVELINDIV1, F.NIVELINDIV2, F.IDAGENCIASALARIO, F.NUMCONTASALARIO,' +CR_LF+
              '  C.IDCARGO AS CODCARGO' +CR_LF+
              'FROM' +CR_LF+
              '  FUNCIONARIO F, CARGO C, SITFUNC S, EVOLFUNC H' +CR_LF+
              'WHERE' +CR_LF+
              '  (F.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
              '  (F.IDSITFUNC = S.IDSITFUNC) AND' +CR_LF+
              '  (F.IDPESSOA = H.IDPESSOA) AND '+CR_LF+
              '  (F.IDCARGO  = C.IDCARGO(+))';
    end;

    _CdsFunc.Data := GetDataPacket(sSql);

    sMatricula := _CdsFunc.FieldByName('MATRICULA').asString;
    // Buscar dados da pessoa na tabela de elegpatro
    sSql := 'SELECT' +CR_LF+
            '  EL.IDPESSOA,EL.IDSITFUNC, EL.IDEMPRESAPROP, EL.CODCENTROCUSTO, EL.MATRICULA,' +CR_LF+
            '  EL.DATAADMISSAO, EL.DATADEMISSAO, EL.SALTOTAL, EL.DATAREADMISSAO, EL.IDESTAB,' +CR_LF+
            '  EL.IDCARGOEXT, EL.IDFUNCAOEXT, C.IDAGENCIA, C.CONTACORRENTE,' +CR_LF+
            '  CEXT.CODIGO AS CODCARGO, EL.DATAFIMAFAST, EL.DATAINICIOAFAST' +CR_LF+
            'FROM' +CR_LF+
            '  CONTABANCARIA C, CARGOEXT CEXT, ELEGPATRO EL ' +CR_LF+
            'WHERE' +CR_LF+
            '  (EL.IDPESSJUR  = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
            '  (EL.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
            '  (EL.IDCARGOEXT = CEXT.IDCARGOEXT) AND' +CR_LF+
            '  (EL.IDPESSOA   = C.IDPESSOA(+))';
    _CdsElegivel.Data := GetDataPacket(sSql);

    sSql := '';

    if (_CdsElegivel.FieldByName('IDSITFUNC').asString <>
        _CdsFunc.FieldByName('IDSITFUNC').asString) then
    begin
      sSQL := sSQL + ', IDSITFUNC = '+_CdsFunc.FieldByName('IDSITFUNC').asString;
      //monica - nao faz mais o delete na critica, apenas inserção independente da alteração/exclusao feita.
      // If bUpdate and Not bExcluiu then
      If bUpdate or bExcluiu then
        InsereCriticaInterface(IdFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('IDSITFUNC').asString,
                               _CdsElegivel.FieldByName('IDSITFUNC').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceEmprNovo,
                               'N',
                               _CdsFunc.FieldByName('LinhaRowId').asString)
      {else If bExcluiu then
      excluiCriticaInterface(idFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('IDSITFUNC').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceEmprNovo,
                               'N'); }
    end;

    if (_CdsElegivel.FieldByName('CODCENTROCUSTO').asString <>
        _CdsFunc.FieldByName('CODCENTROCUSTO').asString) then
    begin
      sSQL := sSQL + ', IDEMPRESAPROP  = ' +_CdsFunc.FieldByName('IDEMPRESAPROP').asString+
                     ', CODCENTROCUSTO = ' +QuotedStr(_CdsFunc.FieldByName('CODCENTROCUSTO').asString);
       //monica - nao faz mais o delete na critica, apenas inserção independente da alteração/exclusao feita.
      // If bUpdate and Not bExcluiu then
      If bUpdate or bExcluiu then
        InsereCriticaInterface(IdFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('CODCENTROCUSTO').asString,
                               _CdsElegivel.FieldByName('CODCENTROCUSTO').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceCCustoAlterado,
                               'C',
                               _CdsFunc.FieldByName('LinhaRowId').asString)
      { else If bExcluiu then
       ExcluiCriticaInterface(idFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('CODCENTROCUSTO').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceCCustoAlterado,
                               'C');    }
    end;

    if (_CdsElegivel.FieldByName('MATRICULA').asString <>
        _CdsFunc.FieldByName('MATRICULA').asString) then
    begin
      _CdsAux.Data := GetDataPacket('SELECT FLGATUMATRICULA FROM PARAMAPREV');

      if not(_CdsAux.IsEmpty) and (_CdsAux.FieldByName('FLGATUMATRICULA').asInteger = 1) then
      begin
        sSQL := sSQL + ', MATRICULA = '+ QuotedStr(_CdsFunc.FieldByName('MATRICULA').asString);
       //monica - nao faz mais o delete na critica, apenas inserção independente da alteração/exclusao feita.
      // If bUpdate and Not bExcluiu then
      If bUpdate or bExcluiu then
          InsereCriticaInterface(IdFundacao,
                                 IdPessoa,
                                 _CdsFunc.FieldByName('MATRICULA').asString,
                                 _CdsElegivel.FieldByName('MATRICULA').asString,
                                 _CdsFunc.FieldByName('MATRICULA').asString,
                                 ceMatriculaAlterada,
                                 'C',
                                 _CdsFunc.FieldByName('LinhaRowId').asString)
       {   else If bExcluiu then
        ExcluiCriticaInterface(idFundacao,
                                 IdPessoa,
                                 _CdsFunc.FieldByName('MATRICULA').asString,
                                 _CdsFunc.FieldByName('MATRICULA').asString,
                                 ceMatriculaAlterada,
                                 'C');       }
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

       //monica - nao faz mais o delete na critica, apenas inserção independente da alteração/exclusao feita.
      // If bUpdate and Not bExcluiu then
      If bUpdate or bExcluiu then
        InsereCriticaInterface(IdFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('DATAADMISSAO').asString,
                               _CdsElegivel.FieldByName('DATAADMISSAO').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceDataAdmAlterada,
                               'D',
                               _CdsFunc.FieldByName('LinhaRowId').asString)
      { else If bExcluiu then
       ExcluiCriticaInterface(idFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('DATAADMISSAO').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceDataAdmAlterada,
                               'D');  }
    end;

    if (_CdsElegivel.FieldByName('DATADEMISSAO').asString <>
        _CdsFunc.FieldByName('DATADEMISSAO').asString) then
    begin
      if (_CdsFunc.FieldByName('DATADEMISSAO').asString <> '') then
        sSQL := sSQL + ', DATADEMISSAO = TO_DATE(' +QuotedStr(_CdsFunc.FieldByName('DATADEMISSAO').asString)+ ', ''DD/MM/YYYY'')'
      else
        sSQL := sSQL + ', DATADEMISSAO = NULL ';

       //monica - nao faz mais o delete na critica, apenas inserção independente da alteração/exclusao feita.
      // If bUpdate and Not bExcluiu then
      If bUpdate or bExcluiu then
        InsereCriticaInterface(IdFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('DATADEMISSAO').asString,
                               _CdsElegivel.FieldByName('DATADEMISSAO').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceDtDemissaoAlterada,
                               'D',
                               _CdsFunc.FieldByName('LinhaRowId').asString)
     {  else If bExcluiu then
       ExcluiCriticaInterface(idFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('DATADEMISSAO').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceDTDemissaoAlterada,
                               'D'); }
    end;

    if (_CdsElegivel.FieldByName('DATAINICIOAFAST').asString <>
        _CdsFunc.FieldByName('DATAINICIOAFAST').asString) then
    begin
      if (not _CdsFunc.FieldByName('DATAINICIOAFAST').isNull) then
        sSQL := sSQL + ', DATAINICIOAFAST = TO_DATE(' +QuotedStr(_CdsFunc.FieldByName('DATAINICIOAFAST').asString)+ ', ''DD/MM/YYYY'')'
      else
        sSQL := sSQL + ', DATAINICIOAFAST = NULL ';

       //monica - nao faz mais o delete na critica, apenas inserção independente da alteração/exclusao feita.
      // If bUpdate and Not bExcluiu then
      If bUpdate or bExcluiu then
        InsereCriticaInterface(IdFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('DATAINICIOAFAST').asString,
                               _CdsElegivel.FieldByName('DATAINICIOAFAST').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceDtDemissaoAlterada,
                               'D',
                               _CdsFunc.FieldByName('LinhaRowId').asString)
       { else If bExcluiu then
      ExcluiCriticaInterface(idFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('DATAINICIOAFAST').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceDtDemissaoAlterada,
                               'D');  }
    end;

    if (_CdsElegivel.FieldByName('DATAFIMAFAST').asString <>
        _CdsFunc.FieldByName('DATAFIMAFAST').asString) then
    begin
      if (_CdsFunc.FieldByName('DATAFIMAFAST').asString <> '') then
        sSQL := sSQL + ', DATAFIMAFAST = TO_DATE(' +QuotedStr(_CdsFunc.FieldByName('DATAFIMAFAST').asString)+ ', ''DD/MM/YYYY'')'
      else
        sSQL := sSQL + ', DATAFIMAFAST = NULL ';

       //monica - nao faz mais o delete na critica, apenas inserção independente da alteração/exclusao feita.
      // If bUpdate and Not bExcluiu then
      If bUpdate or bExcluiu then
        InsereCriticaInterface(IdFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('DATAFIMAFAST').asString,
                               _CdsElegivel.FieldByName('DATAFIMAFAST').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceDtDemissaoAlterada,
                               'D',
                               _CdsFunc.FieldByName('LinhaRowId').asString)
      { else If bExcluiu then
       ExcluiCriticaInterface(idFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('DATAFIMAFAST').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceDtDemissaoAlterada,
                               'D');  }
    end;

    if (_CdsElegivel.FieldByName('SALTOTAL').asString <> _CdsFunc.FieldByName('SALTOTAL').asString) and
       ( ( _CdsFunc.FieldByName('SALTOTAL').asString <> EmptyStr) and
         (_CdsFunc.FieldByName('SALTOTAL').asString <> '0' ) ) then
    begin
      sSQL := sSQL + ', SALTOTAL = '+Float2String(_CdsFunc.FieldByName('SALTOTAL').asFloat);
      //monica - nao faz mais o delete na critica, apenas inserção independente da alteração/exclusao feita.
      // If bUpdate and Not bExcluiu then
      If bUpdate or bExcluiu then
        InsereCriticaInterface(IdFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('SALTOTAL').asString,
                               _CdsElegivel.FieldByName('SALTOTAL').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceSalarioAlterado,
                               'N',
                               _CdsFunc.FieldByName('LinhaRowId').asString)
      { else If bExcluiu then
       ExcluiCriticaInterface(idFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('SALTOTAL').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceSalarioAlterado,
                               'N');     }
    end;

    if (_CdsElegivel.FieldByName('IDESTAB').asString <>
        _CdsFunc.FieldByName('IDESTAB').asString) then
    begin
      sSQL := sSQL + ', IDESTAB = '+_CdsFunc.FieldByName('IDESTAB').asString;
       //monica - nao faz mais o delete na critica, apenas inserção independente da alteração/exclusao feita.
      // If bUpdate and Not bExcluiu then
      If bUpdate or bExcluiu then
        InsereCriticaInterface(IdFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('IDESTAB').asString,
                               _CdsElegivel.FieldByName('IDESTAB').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceFilialAlterada,
                               'N',
                               _CdsFunc.FieldByName('LinhaRowId').asString)
     {  else If bExcluiu then
       ExcluiCriticaInterface(idFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('IDESTAB').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceFilialAlterada,
                               'N');    }
    end;

    if (_CdsElegivel.FieldByName('CODCARGO').asString <> _CdsFunc.FieldByName('CODCARGO').asString) and
       (_cdsFunc.FieldbyName('IDCARGO').asInteger <> 0) then
    begin
      dIdCargo := _CdsFunc.FieldByName('IDCARGO').asInteger;

      if not(ProcessaDE_PARA_CARGO(IdFundacao, IdPessoa,
             _CdsElegivel.FieldByName('IDCARGOEXT').asFloat, 'C', dIdCargo)) then
        raise Exception.Create(MessageInfo);

      sSQL := sSQL + ', IDCARGOEXT = '+FloatToStr(dIdCargo);
      //monica - nao faz mais o delete na critica, apenas inserção independente da alteração/exclusao feita.
      // If bUpdate and Not bExcluiu then
      If bUpdate or bExcluiu then
        InsereCriticaInterface(IdFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('CODCARGO').asString,
                               _CdsElegivel.FieldByName('CODCARGO').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceCargoAlterado,
                               'N',
                               _CdsFunc.FieldByName('LinhaRowId').asString)
      { else If bExcluiu then
       ExcluiCriticaInterface(idFundacao,
                               IdPessoa,
                               _CdsFunc.FieldByName('CODCARGO').asString,
                               _CdsFunc.FieldByName('MATRICULA').asString,
                               ceCargoAlterado,
                               'N');  }
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
        'FROM ELEGPATRO E1, FUNCIONARIO F, SITFUNC S' +CR_LF+    // Gleyber - 11/08/2006 - Pendência 22488
        'WHERE (E1.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') ' +CR_LF+
        '  AND (E1.IDPESSOA = F.IDPESSOA) ' +CR_LF+              // Gleyber - 11/08/2006 - Pendência 22488
        '  AND (F.IDSITFUNC = S.IDSITFUNC)' +CR_LF+              // Gleyber - 11/08/2006 - Pendência 22488
        '  AND (E1.IDPESSJUR = F.IDEMPRESA)'+CR_LF+              // Gleyber - 11/08/2006 - Pendência 22488
        '  AND (EXISTS (SELECT 1' +CR_LF+
        '               FROM ELEGPATRO E2' +CR_LF+
        '               WHERE E2.IDPESSOA = E1.IDPESSOA' +CR_LF+
        '                 AND E2.IDPESSJUR = E1.IDPESSJURCEDIDO) )'); // Gleyber - 11/08/2006 - Pendência 22488

      // Se a consulta retornar registro é por que o funcionário é cedido à Fundação.
      // Deve-se, então, atualizar a matrícula na DEPENTIT para a matrícula da FUNCEF.
      if _CdsElegivel.isempty then
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
      'WHERE  (IDTITULAR  = ' +FloatToStr(IdPessoa)+ ')' +CR_LF+
      '  AND  (IDPESSOA   = ' +FloatToStr(IdPessoa)+ ')' +CR_LF+
      '  AND  (MATRICULA <> ' +QuotedStr(sMatricula) );  // Gleyber - 01/11/2006 - Pendência 22488

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
    sSql := 'SELECT'+ CR_LF +
            '  IDCARGOEXT' +CR_LF+
            'FROM' +CR_LF+
            '  CARGOEXT' +CR_LF+
            'WHERE' +CR_LF+
            '  (IDPESSJUR     = ' +QuotedStr(FloatToStr(IdFundacao))+ ') AND' +CR_LF+
            '  (RTRIM(CODIGO) = ' +QuotedStr(FloatToStr(IdCargo))+ ')';
    _CdsAux.Data := GetDataPacket( sSql );

    if not(_CdsAux.IsEmpty) then
      IdCargo := _CdsAux.FieldByName('IDCARGOEXT').asFloat
    else
    begin
      // Cargo não está na tabela CARGOEXT. O cargo deverá ser inserido na tabela de cargos
      // Buscar PCS válido no momento

      sSql := 'SELECT' +CR_LF+
              '  IDPCS' +CR_LF+
              'FROM' +CR_LF+
              '  PCS' +CR_LF+
              'WHERE' +CR_LF+
              '  (IDPESSJUR      = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
              '  (FINALVIGENCIA IS NULL)';

      _CdsAux.Data := GetDataPacket(sSql);

      if not(_CdsAux.IsEmpty) then
        dIdPCS := _CdsAux.FieldByName('IDPCS').asFloat
      else
        dIdPCS := -1;

      sSql := 'SELECT' +CR_LF+
              '  IDCARGO, TITULO, DESCRICAO, CBO, IDFAIXASALARIAL, CODNIVEL' +CR_LF+
              'FROM' +CR_LF+
              '  CARGO' +CR_LF+
              'WHERE' +CR_LF+
              '  (IDCARGO = ' +FloatToStr(IdCargo)+ ')';

      _CdsAux.Data := GetDataPacket(sSql);

      // Ricardo A. SOL: 114634 KTN: 537509
      dIdCargoPrev := IdCargo;
//      dIdCargoPrev := GetSequence( 'CARGOEXT' );
//      IdCargo := dIdCargoPrev;

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
    sSql := 'SELECT' +CR_LF+
            '  MAX(E.DATAALTERFUNC) AS DATAALTERFUNC' +CR_LF+
            'FROM' +CR_LF+
            '  EVOLFUNC E, MOTIVO M' +CR_LF+
            'WHERE' +CR_LF+
            '  (E.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
            IFF(Tipo = 'C',
              '  (E.IDCARGO     = ' +FloatToStr(dIdCargoOriginal)+ ') AND',
              '  (E.IDFUNCAO    = ' +FloatToStr(dIdCargoOriginal)+ ') AND') +CR_LF+
            '  (M.IDMOTIVO    = E.IDMOTIVO) AND' +CR_LF+
            '  (M.GRUPOMOTIVO = ''A'')';

    _CdsAux.Data := GetDataPacket(sSql);

    if (_CdsAux.IsEmpty) or (_CdsAux.FieldByName('DATAALTERFUNC').asString = '') then
    begin
      _CdsAux.Free;
      exit;
    end;

    sDataAlterFunc := _CdsAux.FieldbyName('DATAALTERFUNC').asString;

    // Atualizar cargo/função anterior com datafinal = (data inicio do novo cargo) - 1
    if not(ExecSQL('UPDATE EVOLFUNCPREV SET'+
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

    sSql := 'SELECT' +CR_LF+
            '  SEQHISTFUNC' +CR_LF+
            'FROM' +CR_LF+
            '  EVOLFUNCPREV' +CR_LF+
            'WHERE' +CR_LF+
            '  (IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
            IFF(Tipo = 'C',
              '  (IDCARGOEXT = ' +FloatToStr(IdCargo)+ ') AND',
              '  (IDFUNCAO   = ' +FloatToStr(IdCargo)+ ') AND') +CR_LF+
            '  (DATAINICIO = TO_DATE(' +QuotedStr(sDataAlterFunc)+ ',''DD/MM/YYYY''))';

    _CdsAux.Data := GetDataPacket(sSql);

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
      //sSQL := sSQL +'NULL, ' // MODOFUNCAO //CPrev - 27604
      sSQL := sSQL +'''EF'', '     //SOL94622 - NILTON
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
function TCtrlIntegraPrevRH.InsereCriticaInterface(IdFundacao,
                                                   IdPessoa: double;
                                                   ValorNoRH,
                                                   ValorNoAdmPREV,
                                                   Matricula,
                                                   CodErro,
                                                   TipoDado: string;
                                                   pIdEvolFunc: String): boolean;
var
  iSeqCritica: LongInt;
  _CdsAux: TCMClientDataSet;
  sSql : String;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  Result := true;
  try

    //INICIO - André Oliveira SOL - 155521/9643 - KIN -1664446
    {_CdsAux.Data := GetDataPacket('SELECT MAX(SEQCRITICA) SEQCRITICA FROM TABCRITICASCCP');
    if (_CdsAux.IsEmpty) then
      iSeqCritica := 1
    else
      iSeqCritica := _CdsAux.FieldByName('SEQCRITICA').asInteger + 1;}

     iSeqCritica := GetSequence('TABCRITICASCCP');
    //FIM - André Oliveira SOL - 155521/9643 - KIN -1664446
    sSql := 'INSERT INTO TABCRITICASCCP' +CR_LF+
            '  (IDPESSJUR, IDPESSOA, SEQCRITICA, MESCOBRANCA, VALORCHAVE, VALORNAFUNDACAO,' +CR_LF+
            //- André Oliveira SOL - 155521/9643 - KIN -1664446 '   VALORNOINTERFACE, CHAVE, CODERRO, TIPODADO, GRUPO, FLGPROCESSADO, DTPROCESSADO, VLRCHAVEAUX)' +CR_LF+
            '   VALORNOINTERFACE, CHAVE, CODERRO, TIPODADO, GRUPO, FLGPROCESSADO, DTPROCESSADO, VALORCHAVEAUX)' +CR_LF+
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
            'SYSDATE, '+
            QuotedStr(PIDEvolFunc)+')';

    if not(ExecSQL(sSql)) then
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


function TCtrlIntegraPrevRH.AtualizaDadosPrevFuncionario(IdFundacao, IdPessoa: double;
                                                         const sDataFiltro : String = '';
                                                         bExcluiu : Boolean = false;
                                                         bUpdate  : Boolean = true): boolean;
var
  _CdsElegivel: TCMClientDataSet;
  sSql : String;
begin
  _CdsElegivel := TCMClientDataSet.Create(nil);

  Result := true;
  try
    // Verificar se pessoa é elegivel da fundacao
    sSql := 'SELECT' +CR_LF+
            '  MATRICULA' +CR_LF+
            'FROM' +CR_LF+
            '  ELEGPATRO' +CR_LF+
            'WHERE' +CR_LF+
            '  (IDPESSJUR         = ' +FloatToStr(IdFundacao)+ ') AND' +CR_LF+
            '  ((IDPESSJURCEDIDO IS NULL) OR' +CR_LF+
            '   (IDPESSJURCEDIDO  = ' +FloatToStr(IdFundacao)+ ')) AND' +CR_LF+
            '  (IDPESSOA          = ' +FloatToStr(IdPessoa)+ ')';
    _CdsElegivel.Data := GetDataPacket(sSql);

    StartTransaction;

    if (_CdsElegivel.IsEmpty) then
    begin
      if not(InsereFuncionarioElegivel(IdFundacao, IdPessoa)) then
        raise Exception.Create(MessageInfo);
    end
    else
    begin
      //monica

      if not(AlteraFuncionarioElegivel(IdFundacao, IdPessoa, sDataFiltro, bExcluiu, bUpdate)) then
        raise Exception.Create(MessageInfo);
    end;

    sSql := 'SELECT' +CR_LF+
            '  IDPESSOA' +CR_LF+
            'FROM' +CR_LF+
            '  DEPENDENTE' +CR_LF+
            'WHERE' +CR_LF+
            '  (IDPESSOA          = ' +FloatToStr(IdPessoa)+ ')';

    // Verificar se pessoa é dependente
    _CdsElegivel.Data := GetDataPacket(sSql);

    if (_CdsElegivel.IsEmpty) then
    begin
      if not(InsereFuncionarioDependente(IdPessoa)) then
        raise Exception.Create(MessageInfo);
    end;

    sSql := 'SELECT' +CR_LF+
            '  MATRICULA' +CR_LF+
            'FROM' +CR_LF+
            '  DEPENTIT' +CR_LF+
            'WHERE' +CR_LF+
            '  (IDTITULAR         = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
            '  (IDPESSOA          = ' +FloatToStr(IdPessoa)+ ')';
    // Verificar se pessoa está em depentit
    _CdsElegivel.Data := GetDataPacket(sSql);

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
      '   F.STEP4, F.STEP5, F.STEP6, F.STEP7, F.STEP8, F.STEP9, F.Step10, F.Step11,'+CR_LF+ //Douglas.Siqueira SOL 171426 Kintana 1537613
      '   F.Step12,F.Step13,F.Step14,F.Step15,F.Step16,F.Step17,F.Step18,F.Step19,F.Step20,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '   F.DATAEFETIV' +CR_LF+
      ' FROM' +CR_LF+
      '   CARGO C, FAIXASAL F' +CR_LF+
      ' WHERE' +CR_LF+
      '   (F.IDFAIXASALARIAL = C.IDFAIXASALARIAL))' +CR_LF+
      'UNION' +CR_LF+
      '(SELECT' +CR_LF+
      '   C.IDCARGO, F.IDFAIXASALARIAL, F.STEP1, F.STEP2, F.STEP3,' +CR_LF+
      '   F.STEP4, F.STEP5, F.STEP6, F.STEP7, F.STEP8, F.STEP9, F.Step10, F.Step11,'+CR_LF+ //Douglas.Siqueira SOL 171426 Kintana 1537613
      '   F.Step12,F.Step13,F.Step14,F.Step15,F.Step16,F.Step17,F.Step18,F.Step19,F.Step20,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '   F.DATAEFETIV' +CR_LF+
      ' FROM' +CR_LF+
      '   FUNCIONARIO C, FAIXASAL F' +CR_LF+
      ' WHERE' +CR_LF+
      '   (F.IDFAIXASALARIAL = C.IDFAIXACARGO))' +CR_LF+
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
        for wFaixa:=1 to 20 do //Douglas.Siqueira SOL 171426 Kintana 1537613
        begin
          // Edilaine Ferraresi - SOL 171426 / KTN 1537613
          //sIdNivel := Trim(_CdsFaixasRH.FieldByName('IDFAIXASALARIAL').asString)+
          //         '0' + IntToStr(wFaixa);
          sIdNivel := Trim(_CdsFaixasRH.FieldByName('IDFAIXASALARIAL').asString);
          if wFaixa < 10 then
             sIdNivel := sIdNivel + '0';
          sIdNivel := sIdNivel+ IntToStr(wFaixa);
          // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim

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
                Float2String(_CdsFaixasRH.FieldByName('STEP'+IntToStr(wFaixa)).asFloat)+ ')')) then
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
                    Float2String(_CdsFaixasRH.FieldByName('STEP'+IntToStr(wFaixa)).asFloat)+CR_LF+
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

function TCtrlIntegraPrevRH.RecuperaInformacaoString(IdPessoa    : Integer;
                                                     pTipo       : String;
                                                     sDataFiltro : String) : String;
var oSql : TCMClientDataSet;
    sCampo : String;
begin
  oSql := TCMClientDataSet.Create(nil);
  sCampo := 'ValorNaFundacao';

  oSql.CommandText := 'SELECT '+sCampo+' Campo01'+#13#10+
                      'from tabcriticasccp' +#13#10+
                      ' where mescobranca = '+QuotedStr(sDataFiltro)+  #13#10 +
                      '   and coderro = ' + pTipo+ #13#10 +
                      '   and idpessoa = ' +IntToStr(IdPessoa)+ #13#10 +
                      '   and seqcritica = (select Max(seqcritica)'+#13#10+
                      '                     from tabcriticasccp' + #13#10 +
                      '                     where mescobranca = '+QuotedStr(sDataFiltro)+#13#10+
                      '                       and coderro = '+pTipo+#13#10+
                      '                       and idpessoa = ' +IntToStr(IdPessoa)+ ')';
  oSql.Data := GetDataPacket(oSql.CommandText);

  Result := oSql.FieldByName('Campo01').AsString;
  oSql.Close;
  oSql.Free;
end;

function TCtrlIntegraPrevRH.RecuperaInformacaoNumerica(IdPessoa    : Integer;
                                                       pTipo       : String;
                                                       sDataFiltro : String) : Double;
var oSql : TCMClientDataSet;
    sCampo : String;
begin
  oSql := TCMClientDataSet.Create(nil);
  sCampo := 'to_number(valornafundacao)';
  oSql.CommandText := 'SELECT '+sCampo+' Campo01'+#13#10+
                      'from tabcriticasccp' +#13#10+
                      ' where mescobranca = '+QuotedStr(sDataFiltro)+  #13#10 +
                      '   and coderro = ' + pTipo+ #13#10 +
                      '   and idpessoa = ' +IntToStr(IdPessoa)+ #13#10 +
                      '   and seqcritica = (select Max(seqcritica)'+#13#10+
                      '                     from tabcriticasccp' + #13#10 +
                      '                     where mescobranca = '+QuotedStr(sDataFiltro)+#13#10+
                      '                       and coderro = '+pTipo+#13#10+
                      '                       and idpessoa = ' +IntToStr(IdPessoa)+ ')';
  oSql.Data := GetDataPacket(oSql.CommandText);


  Result := oSql.FieldByName('Campo01').asFloat;
  oSql.Close;
  oSql.Free;
end;

function TCtrlIntegraPrevRH.RecuperaInformacaoData(IdPessoa    : Integer;
                                                   pTipo       : String;
                                                   sDataFiltro : String) : TdateTime;
var oSql : TCMClientDataSet;
    sCampo : String;
begin
  sCampo := 'To_Date(valornafundacao,''dd/mm/yyyy'')';
  oSql.CommandText := 'SELECT '+sCampo+' Campo01'+#13#10+
                      'from tabcriticasccp' +#13#10+
                      ' where mescobranca = '+QuotedStr(sDataFiltro)+  #13#10 +
                      '   and coderro = ' + pTipo+ #13#10 +
                      '   and idpessoa = ' +IntToStr(IdPessoa)+ #13#10 +
                      '   and seqcritica = (select Max(seqcritica)'+#13#10+
                      '                     from tabcriticasccp' + #13#10 +
                      '                     where mescobranca = '+QuotedStr(sDataFiltro)+#13#10+
                      '                       and coderro = '+pTipo+#13#10+
                      '                       and idpessoa = ' +IntToStr(IdPessoa)+ ')';
  oSql.Data := GetDataPacket(oSql.CommandText);


  Result := oSql.FieldByName('Campo01').asDateTime;
  oSql.Close;
  oSql.Free;
end;

Function TCtrlIntegraPrevRH.SalarioAntigo(IdPessoa : Integer;
                                          sDataFiltro : String) : Double;
begin
  Result := RecuperaInformacaoNumerica(IdPessoa,ceSalarioAlterado,sDataFiltro);
end;

function TCtrlIntegraPrevRH.CargoAntigo(IdPessoa    : Integer;
                                        sDataFiltro : String) : Double;
begin
  Result := RecuperaInformacaoNumerica(IdPessoa,ceCargoAlterado,sDataFiltro);
end;

Function TCtrlIntegraPrevRH.EmpresaAntiga(IdPessoa : Integer;
                                         sDataFiltro : String) : Integer;
begin
  Result := Trunc(RecuperaInformacaoNumerica(IdPessoa,ceEmprNovo,sDataFiltro));
end;

Function TCtrlIntegraPrevRH.FilialAntiga(IdPessoa : Integer;
                                         sDataFiltro : String) : Integer;
begin
  Result := Trunc(RecuperaInformacaoNumerica(IdPessoa,ceFilialAlterada,sDataFiltro));
end;

Function TCtrlIntegraPrevRH.DataAdmissaoAntiga(IdPessoa : Integer;
                                               sDataFiltro : String) : TDateTime;
begin
  Result := RecuperaInformacaoData(IdPessoa,ceDataAdmAlterada,sDataFiltro);
end;

Function TCtrlIntegraPrevRH.DataDemissaoAntiga(IdPessoa : Integer;
                                               sDataFiltro : String) : TDateTime;
begin
  Result := RecuperaInformacaoData(IdPessoa,ceDtDemissaoAlterada,sDataFiltro);
end;

Function TCtrlIntegraPrevRH.DataReadmissaoAntiga(IdPessoa : Integer;
                                                sDataFiltro : String) : TDateTime;
begin
  Result := RecuperaInformacaoData(IdPessoa,ceDtReadmissaoAlterada,sDataFiltro);
end;

function TCtrlIntegraPrevRH.CCustoAntigo(IdPessoa: Integer;sDataFiltro: String): String;
begin
  Result := RecuperaInformacaoString(IdPessoa,ceCCustoAlterado,sDataFiltro);
end;

function TCtrlIntegraPrevRH.MatriculaAntigo(IdPessoa: Integer;sDataFiltro: String): String;
begin
  Result := RecuperaInformacaoString(IdPessoa,ceMatriculaAlterada,sDataFiltro);
end;

function TCtrlIntegraPrevRH.ExcluiCriticaInterface(idFundacao,
                                                   IdPessoa    : double;
                                                   ValorNoRH,
                                                   Matricula,
                                                   CodErro,
                                                   TipoDado    : String): Boolean;
var sSql : String;
begin
  Result := true;
  try
    sSql := 'Delete from TABCRITICASCCP'                      + CR_LF +
            'where idpessoa        = '+FloatToStr(IDpessoa)   + CR_LF +
            '  and idpessjur       = '+FloatToStr(IdFundacao) + CR_LF +
            '  and Chave           = '+QuotedStr('M')         + CR_LF +
            '  and ValorChave      = '+QuotedStr(Matricula)   + CR_LF +
            '  and CodErro         = '+CodErro                + CR_LF +
            '  and TipoDado        = '+QuotedStr(TipoDado)    + CR_LF +
            '  and ValorNaFundacao = '+QuotedStr(ValorNoRh);

    if not(ExecSQL(sSql)) then
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;


end.
