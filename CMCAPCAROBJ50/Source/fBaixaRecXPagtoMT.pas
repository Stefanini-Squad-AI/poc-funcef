{=======================================================================================
// Autor     : Marcus Oliveira
// Data      : 31/05/2007
// Pendência : 25196
// Descrição : No método AdicionaPlanosPrevidenciarios, o cdsDocPag não
               estava voltando para EnableControls.
{=======================================================================================
// Autor     : Marcus Oliveira
// Data      : 12/04/2007
// Pendência : 24823
// Descrição : Ativa o portadorconta.
{-----------------------------------------------------------------------------------------------------------
Data      : 27.02.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 24527
Descrição : Inserção de coluna Plano Previdenciário nos grids de pagamento e recebimento.
-----------------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Baixa de Documento CAP X CAR 3 Camadas              }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 06/01/2002                             }
{                                                       }
{*******************************************************}

Unit fBaixaRecXPagtoMT;

interface

uses
  fOKCancelar, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, MAHlpBtn, Buttons, Grids, DBCtrls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, Wwdbgrid, Db, Wwdatsrc, TREdit, MontaSelect, TB97,
  CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, TB97Tlwn, Wwdbigrd,
  ImgList, Menus, uCtrlBaixaRecXPag,uCtrlFinanc, uCtrlPortadorforma, uCMTypes;

type
  TFrmBaixaRecXPagtoMT = class(TfrmOkCancelar)
    dsDocPag: TwwDataSource;
    dsrecpagto: TwwDataSource;
    dsDocRec: TwwDataSource;
    MsDocrec: TMontaSelect;
    Label11: TLabel;
    DsLancFinanc: TwwDataSource;
    CMParamRec: TCmParamReport;
    CMParamPag: TCmParamReport;
    CMParamFinanceiro: TCmParamReport;
    cdsDocRec: TCMClientDataSet;
    cdsDocPag: TCMClientDataSet;
    sqlLancFinanc: TCMSqlParams;
    cdsLancFinanc: TCMClientDataSet;
    PnlFinancTot: TPanel;
    PnlDocCap: TPanel;
    Label19: TLabel;
    GrdDocCap: TwwDBGrid;
    PnlDocCar: TPanel;
    Label18: TLabel;
    GrdDocCar: TwwDBGrid;
    GrdLancFinanc: TwwDBGrid;
    Label20: TLabel;
    SplDocCar: TSplitter;
    SplDocCap: TSplitter;
    SQLDocPag: TCMSqlParams;
    SQLDocRec: TCMSqlParams;
    TwinTotais: TToolWindow97;
    LblSistema: TLabel;
    LblOutroSistema: TLabel;
    LblDiferenca: TLabel;
    LblTotDepositos: TLabel;
    LblValSistema: TLabel;
    LblValOutroSistema: TLabel;
    LblValTotDepositos: TLabel;
    LblValDiferenca: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape6: TShape;
    SQLSelecionaDoc: TCMSqlParams;
    CdsSelecionaDoc: TCMClientDataSet;
    ppmRecPag: TPopupMenu;
    ImlRecPag: TImageList;
    mnuMarcaTodos: TMenuItem;
    mnuDesmarcaTodos: TMenuItem;
    mnuInverteSelecao: TMenuItem;
    N1: TMenuItem;
    mnuSelecionar: TMenuItem;
    N2: TMenuItem;
    MnuMostraSel: TMenuItem;
    N3: TMenuItem;
    MnuSelDisSel: TMenuItem;
    CMParamsBaixa: TCmParamReport;
    procedure FormCreate(Sender: TObject);
    procedure ppmRecPagPopup(Sender: TObject);
    procedure mnuMarcaTodosClick(Sender: TObject);
    procedure mnuSelecionarClick(Sender: TObject);
    procedure MnuMostraSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure MnuSelDisSelClick(Sender: TObject);
    procedure cdsDocRecAfterOpen(DataSet: TDataSet);
    procedure GrdDocCarTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure GrdDocCarCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CMParamsBaixaAfterExecute(ActionExecute: TActionExecute);
  private
    { Private declarations }
    sSQLPortadorForma: String;
    sSQLFormaRecPag: String;
    sSQL: String;
    sSQLSub: String;
    rTotRec: Double;
    rTotPag: Double;
    rTotFinanc: Double;

    oGridAtivo: TwwDbGrid;
    OvDocRecVazio, OvDocPagVazio, OvLancFinancVazio: OleVariant;
    BaixaRecXPag: TCtrlBaixaRecXPag;
    _CtrlFinanc : TCtrlFinanc;
    _CtrlPortadorforma : TCtrlPortadorforma; //andre tavares - pendência 22486 - 17/11/2006
    _bValidParam, _bCancelouSaiu: boolean;

    procedure DisplayValues;
    procedure SelecionaDocPag;
    procedure SelecionaDocRec;
    procedure SelecionaFinanceiro;
    procedure SQLData(sRecPag: String);
    procedure SetaParametros( CMTela: TCMParamReport );

    procedure FieldValueChange(Sender: TField);

  public
    { Public declarations }


  end;

var
  FrmBaixaRecXPagtoMT: TFrmBaixaRecXPagtoMT;


implementation

Uses uSistema, uCMMath, uCmDialogs, uCtrlParamIntegra;

{$R *.DFM}

procedure TFrmBaixaRecXPagtoMT.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
  inherited;

  _bCancelouSaiu := false;
  _bValidParam := false;
  BaixaRecXPag := TCtrlBaixaRecXPag.Create;
  BaixaRecXPag.InitializeAs(ParamIntegra);

  _CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,True);
  _CtrlFInanc.InitiAlizeAs(ParamIntegra);

  _CtrlPortadorforma := TCtrlPortadorforma.Create; //andre tavares - pendência 22486 - 17/11/2006
  _CtrlPortadorforma.InitiAlizeAs(ParamIntegra);

  SQLDocRec.Open;
  SQLDocPag.Open;
  sqlLancFinanc.Open;

  OvDocRecVazio := CdsDocRec.Data;
  OvDocPagVazio := CdsDocPag.Data;
  OvLancFinancVazio := CdsLancFinanc.Data;

  sSQLPortadorForma := ' SELECT' +
                      '   DESCRICAO, CODPORTFORMA, DMAIS, LANCAFINANC, PLANO, PLACONTA, CODPORTADOR, DESCFINAN' +
                      ' FROM' +
                      '   PORTADORFORMA' +
                      ' WHERE' +
                      '   NVL(FLGATIVO, ''S'') = ''S'' AND ' +

                      '   IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) + ' AND FLGENCCONTAS = ''S'' AND '; // andré tavares - pendência 22486 - 17/11/2006

  sSQLFormaRecPag   := ' SELECT' +
                      '   CODFORMA,' +
                      '   DESCRICAO' +
                      ' FROM' +
                      '   FORMARECPAG' +
                      ' WHERE' +
                      ' (IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) + ') AND';

  CMParamFinanceiro.ParamValues[0].LookupSettings.SQL.Text := 'SELECT ' +
                                                              ' CODPORTADOR, ' +
                                                              ' DESCRICAO ' +
                                                              'FROM ' +
                                                              ' PORTADORCONTA ' +
                                                              'WHERE ' +
                                                              ' IDPESSOA = ' + IntToStr(Sistema.IDEmpresa);

  CMParamsBaixa.ParamValues[1].LookupSettings.SQL.Text := sSQLPortadorForma +
                                              ' RECPAG   = ''R'' ' +
                                              'ORDER BY DESCRICAO';
  CMParamsBaixa.ParamValues[2].LookupSettings.SQL.Text := sSQLPortadorForma +
                                              ' RECPAG   = ''P'' ' +
                                              'ORDER BY DESCRICAO';


  { ------------------------------------------------------------------------------
  CONTAS A RECEBER
  ------------------------------------------------------------------------------ }
  with CMParamRec do
  begin
    {Portador Forma}
    ParamValues[3].LookupSettings.SQL.Text := sSQLPortadorForma +
                                              ' RECPAG   = ''R'' ' +
                                              'ORDER BY DESCRICAO';
    {Tipo de Documento}
    ParamValues[4].LookupSettings.SQL.Text := 'SELECT ' +
                                              '  CODTIPDOC, ' +
                                              '  DESCRICAO, ' +
                                              '  DEBCRE, ' +
                                              '  FLGENGLOBAPARCELA, ' +
                                              '  FLGGERANUMDOC, ' +
                                              '  FLGDOCFISCAL ' +
                                              'FROM ' +
                                              '  TIPODOCRECPAG TD ' +
                                              'WHERE ' +
                                              ' TD.RECPAG = ''R'' ' +
                                              ' AND NOT EXISTS ' +
                                              ' (SELECT 1 ' +
                                              '  FROM USUARIOxTPDOCTO UTD ' +
                                              '  WHERE UTD.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario) + ' AND ' +
                                              '        RECPAG = ''R'') ' +
                                              ' UNION ' +
                                              ' SELECT ' +
                                              '   CODTIPDOC, ' +
                                              '   DESCRICAO, ' +
                                              '   DEBCRE, ' +
                                              '   FLGENGLOBAPARCELA, ' +
                                              '   FLGGERANUMDOC, ' +
                                              '   FLGDOCFISCAL ' +
                                              ' FROM TIPODOCRECPAG TD ' +
                                              ' WHERE TD.RECPAG = ''R'' AND ' +
                                              ' EXISTS ' +
                                              ' (SELECT 1 ' +
                                              '  FROM USUARIOxTPDOCTO UTD ' +
                                              '  WHERE TD.CODTIPDOC = UTD.CODTIPDOC AND ' +
                                              '        UTD.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario) + ' AND ' +
                                              '        RECPAG = ''R'' ) ' +
                                              'ORDER BY DESCRICAO';

    {Forma de Recebimento}
    ParamValues[5].LookupSettings.SQL.Text := sSQLFormaRecPag +
                                              ' (RECPAG = ''R'') '+
                                              'ORDER BY DESCRICAO';
  end;

{ ------------------------------------------------------------------------------
  CONTAS A PAGAR
  ------------------------------------------------------------------------------ }
  with CMParamPag do
  begin
    {Portador Forma}
    ParamValues[3].LookupSettings.SQL.Text := sSQLPortadorForma +
                                              ' RECPAG   = ''P'' ' +
                                              'ORDER BY DESCRICAO';
    {Tipo de Documento}
    ParamValues[4].LookupSettings.SQL.Text := 'SELECT ' +
                                              '  CODTIPDOC, ' +
                                              '  DESCRICAO, ' +
                                              '  DEBCRE, ' +
                                              '  FLGENGLOBAPARCELA, ' +
                                              '  FLGGERANUMDOC, ' +
                                              '  FLGDOCFISCAL ' +
                                              'FROM ' +
                                              '  TIPODOCRECPAG TD ' +
                                              'WHERE ' +
                                              ' TD.RECPAG = ''P'' ' +
                                              ' AND NOT EXISTS ' +
                                              ' (SELECT 1 ' +
                                              '  FROM USUARIOxTPDOCTO UTD ' +
                                              '  WHERE UTD.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario) + ' AND ' +
                                              '        RECPAG = ''P'' )' +
                                              ' UNION ' +
                                              ' SELECT ' +
                                              '   CODTIPDOC, ' +
                                              '   DESCRICAO, ' +
                                              '   DEBCRE, ' +
                                              '   FLGENGLOBAPARCELA, ' +
                                              '   FLGGERANUMDOC, ' +
                                              '   FLGDOCFISCAL ' +
                                              ' FROM TIPODOCRECPAG TD ' +
                                              ' WHERE TD.RECPAG = ''P'' AND ' +
                                              ' EXISTS ' +
                                              ' (SELECT 1 ' +
                                              '  FROM USUARIOxTPDOCTO UTD ' +
                                              '  WHERE TD.CODTIPDOC = UTD.CODTIPDOC AND ' +
                                              '        UTD.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario) + ' AND ' +
                                              '        RECPAG = ''P'') ' +
                                              'ORDER BY DESCRICAO';

    {Forma de Pagamento}
    ParamValues[5].LookupSettings.SQL.Text := sSQLFormaRecPag +
                                              ' (RECPAG = ''P'') '+
                                              'ORDER BY DESCRICAO';
  end;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30034;
    bbtnAjuda.HelpContext := 30034;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

procedure TFrmBaixaRecXPagtoMT.SelecionaDocRec;
begin
  rTotRec := 0;
  SetaParametros(CMParamRec);
  SQLData('R');
end;

procedure TFrmBaixaRecXPagtoMT.SelecionaFinanceiro;
begin
  rTotFinanc := 0;

  with sqlLancFinanc do
  begin
    SQL.Clear;
    SQL.Append('SELECT                                                       ');
    SQL.Append('  ''N'' AS SELECIONA,                                        ');
    SQL.Append('  CODLANCFINANC,                                             ');
    SQL.Append('  STATUSCONCILIA,                                            ');
    SQL.Append('  VALORLANCFINAN,                                            ');
    SQL.Append('  VALOROUTRAMOEDA,                                           ');
    SQL.Append('  NUMCHQBORDERO,                                             ');
    SQL.Append('  DATALANCFINAN,                                             ');
    SQL.Append('  ENTRADASAIDA,                                              ');
    SQL.Append('  HISTORICO                                                  ');
    SQL.Append('FROM                                                         ');
    SQL.Append('  MOVIMFINANC                                                ');
    SQL.Append('WHERE                                                        ');
    SQL.Append('  IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) + ' AND         ');
    SQL.Append('  STATUSCONCILIA = ''I''                                     ');
    {Verifica se a Conta Bancária\Caixa foi Informada}
    if not CMParamFinanceiro.ParamValues[0].ISNull then
      SQL.Append(' AND CODPORTADOR = ' + CMParamFinanceiro.ParamValues[0].AsString);
    if not CMParamFinanceiro.ParamValues[1].ISNull then
      SQL.Append(' AND IDMODULO = ' + CMParamFinanceiro.ParamValues[1].AsString);
    SQL.Append('ORDER BY DATALANCFINAN, NUMCHQBORDERO                        ');
    Open;
  end;
end;

procedure TFrmBaixaRecXPagtoMT.SelecionaDocPag;
begin
  rTotPag := 0;
  SetaParametros(CMParamPag);
  SQLData('P');
end;

procedure TFrmBaixaRecXPagtoMT.SetaParametros( CMTela: TCMParamReport );
begin
  sSQL    := '';
  sSQLSub := '';

  with CMTela do
  begin
    {Verifica se o Cliente foi selecionado}
    if ParamValues[0].AsInteger <> 0 then
    begin
      sSQL := 'D.IDFORCLI = ' + ParamValues[0].AsString + ' AND ';
      sSQLSub := ' D.IDFORCLI= ' + ParamValues[0].AsString + ' AND ';
    end;

    {Verifica se Número do Documento foi digitado}
    if ParamValues[1].AsInteger <> 0 then
    begin
      sSQL := sSQL + 'D.NODOCUMENTO = ' + ParamValues[1].AsString + ' AND ';
      sSQLSub := sSQLSub + 'D.NODOCUMENTO = '+  ParamValues[1].AsString + ' AND ';
    end;

    {Verifica se o CODGRUPOCNAB foi digitado}
    if ParamValues[2].AsInteger <> 0 then
    begin
      sSQL := sSQL + 'D.CODGRUPOCNAB = ' + ParamValues[2].AsString + ' AND ';
      sSQLSub := sSQLSub + 'D.CODGRUPOCNAB = ' + ParamValues[2].AsString + ' AND ';
    end;

    {Verifica se o Portador Forma foi selecionado}
    if not ParamValues[3].ISNull then
    begin
      sSQL := sSQL + 'D.CODPORTFORMA= ' + ParamValues[3].AsString + ' AND ';
      sSQLSub := sSQLSub + 'D.CODPORTFORMA= ' + ParamValues[3].AsString + ' AND ';
    end;

    {Verifica se o Tipo de Documento foi selecionado}
    if not ParamValues[4].ISNull then
    begin
      sSQL := sSQL + 'D.CODTIPDOC = ' + ParamValues[4].AsString + ' AND ';
      sSQLSub := sSQLSub + ' D.CODTIPDOC = ' + ParamValues[4].AsString + ' AND ';
    end;

    {Verifica se a Forma de Recebimento foi selecionada}
    if not ParamValues[5].ISNull then
    begin
      sSQL := sSQL + 'D.CODFORMA = ' + ParamValues[5].AsString + ' AND ';
      sSQLSub := sSQLSub + 'D.CODFORMA = ' + ParamValues[5].AsString + ' AND ';
    end;

    {Verifica se o Sistema de Origem foi selecionado}
    if not ParamValues[6].ISNull then
    begin
      sSQL := sSQL + 'D.IDMODULO = ' +  ParamValues[6].AsString + ' AND ';
      sSQLSub := sSQLSub + 'D.IDMODULO = ' + ParamValues[6].AsString + ' AND ';
    end;

    {Verifica se a Data Programada foi selecionada}
    if not ParamValues[7].IsNull then
    begin
      sSQL := sSQL + 'D.DATAPROGRAMADA ' + ParamValues[7].Comparador + '  TO_DATE('+ QuotedStr(ParamValues[7].AsString) + ',''DD/MM/YYYY'') AND ';
      sSQLSub := sSQLSub + 'D.DATAPROGRAMADA ' + ParamValues[7].Comparador + ' TO_DATE('+ QuotedStr(ParamValues[7].AsString) + ',''DD/MM/YYYY'') AND ';
    end;

    {Verifica se a Data de Lançamento foi selecionada}
    if not ParamValues[8].IsNull then
      sSQL := sSQL + 'L.DATALANCTO ' + ParamValues[7].Comparador + ' TO_DATE(' + QuotedStr(ParamValues[8].AsString) + ',''DD/MM/YYYY'') AND ';
  end;
end;

procedure TFrmBaixaRecXPagtoMT.SQLData(sRecPag : String);
Var
  SqlparamAux: TCMSQLParams;

  //amf 26.02.2007 24527
  cdsPlanPrev: TClientDataSet;

                //amf 27.02.2007 24527
               procedure AdicionaPlanosPrevidenciarios;
                     begin
                        try
                           if sRecPag = 'P' then //pagamentos
                           begin
                              cdsDocPag.DisableControls;
                              while (not cdsDocPag.eof) do
                              begin
                                 cdsPlanPrev.Data := BaixaRecXPag.GetPlanosPrevidDocumento
                                                    (cdsDocPag.FieldByName('CODDOCUMENTO').AsFloat);
                                 cdsPlanPrev.Open;

                                 while (not cdsPlanPrev.Eof) do
                                 begin
                                    cdsDocPag.Edit;
                                    if (cdsPlanPrev.recno > 1) then
                                      cdsDocPag.fieldByName('PLANOPREV').asString := cdsDocPag.fieldByName('PLANOPREV').asString + '; '+ cdsPlanPrev.fieldByName('NOME').asString
                                    else
                                      cdsDocPag.fieldByName('PLANOPREV').asString := cdsDocPag.fieldByName('PLANOPREV').asString + cdsPlanPrev.fieldByName('NOME').asString;
                                    cdsDocPag.Post;
                                    cdsPlanPrev.Next;
                                 end;

                                 cdsDocPag.Next;
                              end;
                              //Marcus Oliveira P.25196 31/05/2007
                              cdsDocPag.EnableControls;

                           end
                           else                  //recebimentos
                           begin
                              cdsDocRec.DisableControls;
                              while (not cdsDocRec.eof) do
                              begin
                                 cdsPlanPrev.Data := BaixaRecXPag.GetPlanosPrevidDocumento
                                                    (cdsDocRec.FieldByName('CODDOCUMENTO').AsFloat);
                                 cdsPlanPrev.Open;

                                 while (not cdsPlanPrev.Eof) do
                                 begin
                                    cdsDocRec.Edit;
                                    if (cdsPlanPrev.recno > 1) then
                                      cdsDocRec.fieldByName('PLANOPREV').asString := cdsDocRec.fieldByName('PLANOPREV').asString + '; '+ cdsPlanPrev.fieldByName('NOME').asString
                                    else
                                      cdsDocRec.fieldByName('PLANOPREV').asString := cdsDocRec.fieldByName('PLANOPREV').asString + cdsPlanPrev.fieldByName('NOME').asString;
                                    cdsDocRec.Post;
                                    cdsPlanPrev.Next;
                                 end;

                                 cdsDocRec.Next;
                              end;
                           end;
                        finally
                           cdsDocRec.EnableControls;
                        end;
               end;
begin
  if sRecPag = 'P' then
     SqlparamAux := SQLDocPag
  else
     SqlparamAux := SQLDocRec;

  //amf 26.02.2007 24527 - bloco de controle de exceção
  try

     cdsPlanPrev := TClientDataSet.Create(nil);

     with SqlparamAux do
     begin
       SQL.Clear;
       SQL.Append('SELECT');
       SQL.Append('  ''N'' AS SELECIONA,');
       SQL.Append('  ''N'' AS BAIXAPARCIAL,');
       SQL.Append('  0 AS VALORPAGO,');
       SQL.Append('  0 as VALORPAGOOOTRMOE,');
       SQL.Append('  U.SALDO,');
       SQL.Append('  U.SALDO1,');
       SQL.Append('  D.IDFORCLI,');
       SQL.Append('  D.OPERACAO,');
       SQL.Append('  D.IDPESSOA,');
       SQL.Append('  D.CODDOCUMENTO,');
       SQL.Append('  D.NODOCUMENTO,');
       SQL.Append('  D.COMPLDOCUMENTO,');
       SQL.Append('  D.DATAPROGRAMADA,');
       SQL.Append('  D.DATAVENCTO,');
       SQL.Append('  D.RECPAG,');
       SQL.Append('  P.NOME,');
       SQL.Append('  D.STATUS,');
       SQL.Append('  D.MOECODIGO,');
       SQL.Append('  D.PLANO,');
       SQL.Append('  D.PLACONTA,');
       SQL.Append('  D.CODCENTROCUSTO,');
       SQL.Append('  D.CODSUBCONTA,');
       SQL.Append('  D.CODGRUPOCNAB,');
       SQL.Append('  D.NOSSONUMERO,');
       SQL.Append('  L.NUMLANCTO,');
       SQL.Append('  L.VLRLIQUIDO,');
       SQL.Append('  DECODE(L.DEBCRE,''C'',''D'',''C'') AS DEBCRE,');
       SQL.Append('  L.VALOROUTRAMOEDA,');
       SQL.Append('  0 AS IMPRET,');
       SQL.Append('  0 AS IMP,');
       SQL.Append('  0 AS DIF,');
       // Alex 13/12/2005
       SQL.Append('  D.IDMODULO,');
       SQL.Append('  D.CODTIPDOC');

       //amf 26.02.2007 24527 - adição do field PLANOPREV
       SQL.Append(', ''                                        ''  AS PLANOPREV ');

       SQL.Append('FROM');
       SQL.Append('  DOCUMENTO D,');
       SQL.Append('  PESSOA P,');
       SQL.Append('  LANCTODOCUM L,');
       SQL.Append('  (SELECT L.CODDOCUMENTO,');
       SQL.Append('  SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * -1),DECODE(D.RECPAG,''R'',L.VALOR * -1,L.VALOR))) AS SALDO, ');
       SQL.Append('  SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA * -1,L.VALOROUTRAMOEDA))) AS SALDO1 ');
       SQL.Append('   FROM LANCTODOCUM L, DOCUMENTO D');
       SQL.Append('   WHERE ' + sSQLSub);
       SQL.Append('        D.CODDOCUMENTO = L.CODDOCUMENTO AND');
       SQL.Append('        D.RECPAG = ' + QuotedStr(sRecPag) + ' AND');
       SQL.Append('        D.STATUS <> ''2''');
       SQL.Append('   GROUP BY L.CODDOCUMENTO) U ');
       SQL.Append('WHERE');
       SQL.Append(' (D.RECPAG = ' + QuotedStr(sRecPag) + ' ) AND');
       SQL.Append('  D.CODTIPDOC IN');
       SQL.Append('       (SELECT CODTIPDOC');
       SQL.Append('        FROM TIPODOCRECPAG A');
       SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND NOT EXISTS');
       SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B');
       SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
       SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario));
       SQL.Append('                                )');
       SQL.Append('        UNION');
       SQL.Append('        SELECT CODTIPDOC FROM TIPODOCRECPAG A');
       SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND EXISTS');
       SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B');
       SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
       SQL.Append('                                      A.CODTIPDOC = B.CODTIPDOC AND');
       SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.iDUsuario) + ')) AND ');
       SQL.Append(' (D.OPERACAO = L.OPERACAO) AND');
       SQL.Append(' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND');
       SQL.Append(' (L.ESTORNO IS NULL) AND');
       SQL.Append(' (D.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)+ ') AND');
       SQL.Append(' (D.STATUS = ''0'' OR D.STATUS=''1'' OR (D.STATUS IS NULL)) AND');
       SQL.Append(' (RTrim(D.OPERACAO) IN (''1'',''2'',''3'')) AND');
       SQL.Append(' (D.IDFORCLI = P.IDPESSOA) AND');
       SQL.Append(   sSQL + ' (D.CODDOCUMENTO !=ALL (SELECT CODDOCUMENTO FROM LOTEXDOCUM ');
       SQL.Append('                                  WHERE FLGBAIXA IS NULL OR FLGBAIXA = ''N'')) AND ');
       SQL.Append(' (U.SALDO >0  ) AND');
       SQL.Append(' (U.CODDOCUMENTO = D.CODDOCUMENTO)');
       SQL.Append(' ORDER BY P.NOME, D.DATAPROGRAMADA, D.NoDOCUMENTO');
       Open;

       //amf 27.02.2007 24527 - Prepara para exibir os planos
       AdicionaPlanosPrevidenciarios;
    end;
  finally
       FreeAndNil(cdsPlanPrev);
  end;
end;


procedure TFrmBaixaRecXPagtoMT.DisplayValues;
Var
  rTotDif: Double;
begin
  rTotDif := rTotRec - rTotPag + rTotFinanc;

  LblValTotDepositos.Caption := Trim(FloatToStrf(rTotFinanc, ffNumber, 15, 2));
  LblValOutroSistema.Caption := Trim(FloatToStrf(rTotPag, ffNumber, 15, 2));
  LblValSistema.Caption := Trim(FloatToStrf(rTotRec, ffNumber, 15, 2));
  LblValDiferenca.Caption := Trim(FloatToStrf(Abs(rTotDif), ffNumber, 15, 2));

  if rTotDif > 0 then
     LblDiferenca.Caption := 'Diferença a Receber'
  else
     LblDiferenca.Caption := 'Diferença a Pagar';
end;

procedure TFrmBaixaRecXPagtoMT.ppmRecPagPopup(Sender: TObject);
begin
  inherited;
  if GrdDocCar.Focused then
     oGridAtivo := GrdDocCar
  else
     if GrdDocCap.Focused then
        oGridAtivo := GrdDocCap
     else
        if GrdLancFinanc.Focused then
           oGridAtivo := GrdLancFinanc
        else
           oGridAtivo := nil;

  if ( oGridAtivo <> nil ) then
  begin
     MnuSelDisSel.Enabled := Not oGridAtivo.DataSource.DataSet.IsEmpty;
     mnuMarcaTodos.Enabled := MnuSelDisSel.Enabled;
     mnuDesmarcaTodos.Enabled := MnuSelDisSel.Enabled;
     mnuInverteSelecao.Enabled := MnuSelDisSel.Enabled;
     MnuMostraSel.Enabled := True;
     mnuSelecionar.Enabled := True;

     MnuMostraSel.Checked := oGridAtivo.DataSource.DataSet.Filtered;

     If oGridAtivo.DataSource.DataSet.FieldByName(oGridAtivo.Columns[0].FieldName).AsString = 'S' then
     begin
       MnuSelDisSel.ImageIndex := 4;
       MnuSelDisSel.Caption := 'Desmarcar'
     end
     Else
     begin
       MnuSelDisSel.ImageIndex := 5;
       MnuSelDisSel.Caption := 'Selecionar';
     end;
  end
  else
  begin
     MnuSelDisSel.Enabled := false;
     mnuMarcaTodos.Enabled := false;
     mnuDesmarcaTodos.Enabled := false;
     mnuInverteSelecao.Enabled := false;
     MnuMostraSel.Enabled := false;
     mnuSelecionar.Enabled := false;
  end;


end;

procedure TFrmBaixaRecXPagtoMT.mnuMarcaTodosClick(Sender: TObject);
begin
  inherited;
  //Marcar Todos
  if TMenuItem(Sender).tag = 0 then
     Case oGridAtivo.Tag of
       0: rTotRec := 0;
       1: rTotPag := 0;
       2: rTotFinanc := 0;
     end;

  with oGridAtivo.DataSource.DataSet do
  begin
    DisableControls;
    Try
      First;
      while not Eof do
      begin
        Edit;

        Case TMenuItem(Sender).tag of
          //Marca Todos
          0: FieldByName(oGridAtivo.Columns[0].FieldName).AsString := 'S';
          //Desmarca Todos
          1: FieldByName(oGridAtivo.Columns[0].FieldName).AsString := 'N';
          //Inverter Seleção
          2: If FieldByName(oGridAtivo.Columns[0].FieldName).AsString = 'S' then
                FieldByName(oGridAtivo.Columns[0].FieldName).AsString := 'N'
             Else
                FieldByName(oGridAtivo.Columns[0].FieldName).AsString := 'S';
        End;

        Post;

        Next;
      end;

    finally
      first;
      EnableControls;
    end;
  end;

  //DesMarcar Todos
  if TMenuItem(Sender).tag = 1 then
      Case oGridAtivo.Tag of
        0: rTotRec := 0;
        1: rTotPag := 0;
        2: rTotFinanc := 0;
      end;

  DisplayValues;
end;

procedure TFrmBaixaRecXPagtoMT.mnuSelecionarClick(Sender: TObject);
begin
  inherited;
  oGridAtivo.DataSource.DataSet.Filtered := false;

  Case oGridAtivo.Tag of
    0: if CMParamRec.Execute then SelecionaDocRec;
    1: if CMParamPag.Execute then SelecionaDocPag;
    2: if CMParamFinanceiro.Execute then SelecionaFinanceiro;
  End;

  DisplayValues;
end;

procedure TFrmBaixaRecXPagtoMT.MnuMostraSelClick(Sender: TObject);
begin
  inherited;
  MnuMostraSel.Checked := Not MnuMostraSel.Checked;
  oGridAtivo.DataSource.DataSet.Filtered := MnuMostraSel.Checked;

  if oGridAtivo.DataSource.DataSet.Filtered then
     oGridAtivo.DataSource.DataSet.Filter := oGridAtivo.Columns[0].FieldName + ' = ''S'''
  else
     oGridAtivo.DataSource.DataSet.Filter := '';
end;

procedure TFrmBaixaRecXPagtoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  _bValidParam := false;
  _bCancelouSaiu := false;
  while (not _bValidParam) or (not _bCancelouSaiu) do //andre tavares - pendência 22486 - 17/11/2006
  begin
    If ( rTotRec = 0 ) Or ( rTotPag = 0 ) then
       MsgDlg('Não foram selecionados documento para Baixa','Atenção', mtInformation, [mbOk],0)
    Else
    begin
      if (CMParamsBaixa.Execute) then
      begin
         //início - andre tavares - pendência 22486 - 17/11/2006 - verifica se os portadorForma tem a mesma conta corrente associada
         if (CMParamsBaixa.ParamValues[0].asString = '') then
         begin
           _bValidParam := false;
           MsgDlg('A Data Programada é Obrigatória','Atenção', mtError, [mbOk],0);
           CMParamsBaixa.ParamValues[0].AsString := '';
           CMParamsBaixa.ParamValues[1].AsString := '';
           CMParamsBaixa.ParamValues[2].AsString := '';
         end
         else begin
           _bCancelouSaiu := true;
           _bValidParam   := true;
         end;

         if  (_bCancelouSaiu) and (_bValidParam) and ((CMParamsBaixa.ParamValues[1].asInteger = 0) or (CMParamsBaixa.ParamValues[2].asInteger = 0)) then
         begin
           _bValidParam := false;
           MsgDlg('As Contas Caixa X Forma de Pagamento/Recebimento são Obrigatórias','Atenção', mtError, [mbOk],0);
           CMParamsBaixa.ParamValues[0].AsString := '';
           CMParamsBaixa.ParamValues[1].AsString := '';
           CMParamsBaixa.ParamValues[2].AsString := '';
         end
         else begin
           _bCancelouSaiu := true;
           _bValidParam   := true;
         end;

         if (_bCancelouSaiu) and (_bValidParam) and (CMParamsBaixa.ParamValues[1].asInteger > 0 ) and (CMParamsBaixa.ParamValues[2].AsInteger > 0) and
            (not _CtrlPortadorforma.MesmaContaCorrente(CMParamsBaixa.ParamValues[1].AsInteger, CMParamsBaixa.ParamValues[2].AsInteger)) then
         begin
           _bValidParam := false;
           MsgDlg('As Contas Caixa X Forma de Pagamento/Recebimento Devem Ter a Mesma Conta Bancária Associada','Atenção', mtError, [mbOk],0);
           CMParamsBaixa.ParamValues[0].AsString := '';
           CMParamsBaixa.ParamValues[1].AsString := '';
           CMParamsBaixa.ParamValues[2].AsString := '';
         end
         else begin
           _bCancelouSaiu := true;
           _bValidParam   := true;
         end;
         //fim - andre tavares - pendência 22486 - 17/11/2006

         // Início - Rodolpho da Silva - P: 19425  - 15/06/2005
         if  (_bCancelouSaiu) and (_bValidParam) and (CMParamsBaixa.ParamValues[0].AsDateTime > date) then
         begin
            if MsgDlg('A data informada para a baixa do(s) documento(s) é superior a data atual. ' + #13 +
                       'Deseja continuar?',Sistema.NomeCompleto,mtConfirmation,[mbyes,mbNo],0) = mrNo then
            begin
              _bCancelouSaiu := true;
              _bValidParam   := false;
            end
            else begin
              _bCancelouSaiu := true;
              _bValidParam   := true;
           end;

         end;

         if _bValidParam then
         begin
           if not _CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,
                                              CMParamsBaixa.ParamValues[0].AsDateTime) then
           begin
              // Rodolpho da Silva - P: 19904 - 07/03/2006
              MsgDlg(_CtrlFinanc.MessageInfo, Caption, mtWarning, [mbOk], 0);
              Exit;
           end;

           if BaixaRecXPag.ProcessaBaixaDocumento(cdsDocPag.Data, cdsDocRec.Data, cdsLancFinanc.Data,
              Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdEspAcesso,
              Sistema.IdModulo, CMParamsBaixa.ParamValues[2].AsInteger, CMParamsBaixa.ParamValues[1].AsInteger,
              ParamIntegra.Plano, CMParamsBaixa.ParamValues[0].AsDateTime, Sistema.UsaPlanoPatro,
              ParamIntegra.PartidaDobrada, rTotPag, rTotRec) then
           begin
              MsgDlg('Documentos baixados com sucesso.','Atenção', mtInformation, [mbOk],0);
              bbtnCancelar.Click; //andre tavares - pendência 22486 - 17/11/2006
           end
           else
           begin
             _bValidParam := false;
             MsgDlg('Erro no processamento das Baixas:' + (#13+#10) + BaixaRecXPag.MessageInfo,'Atenção', mtError, [mbOk],0);
           end;
         end;
      end //if
    end;
  end;//while
end;

procedure TFrmBaixaRecXPagtoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  CdsDocRec.Data := OvDocRecVazio;
  CdsDocPag.Data := OvDocPagVazio;
  CdsLancFinanc.Data := OvLancFinancVazio;

  rTotRec := 0;
  rTotPag := 0;
  rTotFinanc := 0;
  DisplayValues;
end;

procedure TFrmBaixaRecXPagtoMT.MnuSelDisSelClick(Sender: TObject);
begin
  inherited;
  with oGridAtivo.DataSource.DataSet do
  begin
     Edit;
     If FieldByName(oGridAtivo.Columns[0].FieldName).AsString = 'S' then
        FieldByName(oGridAtivo.Columns[0].FieldName).AsString := 'N'
     Else
        FieldByName(oGridAtivo.Columns[0].FieldName).AsString := 'S';
     Post;
  end;
end;

procedure TFrmBaixaRecXPagtoMT.cdsDocRecAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';

  Case DataSet.Tag of
    0,1:
    begin
       TFloatField(DataSet.FieldByName('VALORPAGO')).DisplayFormat := '#,##0.00';
       TFloatField(DataSet.FieldByName('VALORPAGOOOTRMOE')).DisplayFormat := '#,##0.00';
       TFloatField(DataSet.FieldByName('SALDO')).DisplayFormat := '#,##0.00';
       TFloatField(DataSet.FieldByName('SALDO1')).DisplayFormat := '#,##0.00';
       TFloatField(DataSet.FieldByName('VLRLIQUIDO')).DisplayFormat := '#,##0.00';
    end;
    2: TFloatField(DataSet.FieldByName('VALORLANCFINAN')).DisplayFormat := '#,##0.00';
  End;

  DataSet.FieldByName('SELECIONA').OnChange := FieldValueChange;
end;

procedure TFrmBaixaRecXPagtoMT.FieldValueChange(Sender: TField);
begin
  Case Sender.DataSet.Tag of
    0: if Sender.AsString = 'S' then
          rTotRec := rTotRec + CdsDocRec.FieldByName('SALDO').AsFloat
       else
          rTotRec := rTotRec - CdsDocRec.FieldByName('SALDO').AsFloat;
    1: if Sender.AsString = 'S' then
         rTotPag := rTotPag + CdsDocPag.FieldByName('SALDO').AsFloat
       else
         rTotPag := rTotPag - CdsDocPag.FieldByName('SALDO').AsFloat;
    2: if Sender.AsString = 'S' then
          rTotFinanc := rTotFinanc + cdsLancFinanc.FieldByName('VALORLANCFINAN').AsFloat
        else
          rTotFinanc := rTotFinanc - cdsLancFinanc.FieldByName('VALORLANCFINAN').AsFloat;
  end;

  DisplayValues;
end;

procedure TFrmBaixaRecXPagtoMT.GrdDocCarTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  if AFieldName <> 'SELECIONA' then
  begin
     if AFieldName = TClientDataSet(TwwDbGrid(Sender).DataSource.DataSet).IndexFieldNames then
        TClientDataSet(TwwDbGrid(Sender).DataSource.DataSet).IndexFieldNames := ''
     Else
        TClientDataSet(TwwDbGrid(Sender).DataSource.DataSet).IndexFieldNames := AFieldName;
  End;
end;

procedure TFrmBaixaRecXPagtoMT.GrdDocCarCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
  inherited;
  TitleImageAttributes.Alignment := taLeftJustify;

  if Field.FieldName = TClientDataSet(Field.DataSet).IndexFieldNames then
     TitleImageAttributes.ImageIndex := 6
  Else
     TitleImageAttributes.ImageIndex := -1;
end;

procedure TFrmBaixaRecXPagtoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  BaixaRecXPag.Free;
  _CtrlFinanc.Free;
  _CtrlPortadorforma.Free;
end;


procedure TFrmBaixaRecXPagtoMT.CMParamsBaixaAfterExecute(ActionExecute: TActionExecute);
begin
  inherited;
  if ActionExecute in [aeCancelar, aeSair] then
  begin
    _bValidParam := true;
    _bCancelouSaiu := true;
  end;
end;

end.

