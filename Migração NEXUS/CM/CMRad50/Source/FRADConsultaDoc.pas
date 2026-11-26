{******************************************************************************}
{  Sistema - RAD+
{  Unit    - FRADConsultaDoc (Interface RAD para a consulta de documentos do CAP)                                                   }
{------------------------------------------------------------------------------
//Alteracao     : (dfm SqlContab)
//N. Chamado....: SIG130578
//Dt Alteração..: 07/05/2024
//Responsável...: Arnaldo Vicente Scarin
//Descrição.....: Foi criado no Objeto CtrlDocumento uma nova propriedade
//                que contem os planos previdenciarios que serão escolhidos
//                na tela de Lançamento de Alteradores, para que possam
//                ser utilizados no Rateio dos dados.
//                Essa propriedade conterá somente os planos escolhidos para
//                o Rateio dos Alteradores, e esses lançamentos serão
//                armazenados na tabela RateioDocum com o Campo Valor Zerado
//                Tambem será criada uma nova tabela, para que haja o
//                relacionamento entre a Linha do Alterador que está na
//                tabela LanctoDocum e as linhas que estão na Tabela RateioDocum
//                para que haja rastreabilidade e em caso de exclusão do
//                alterador, possam ser excluidos os rateios.
//******************************************************************************

 Data      : 19/10/2007
 Autor     : Marcus Oliveira
 Pendência : 26671
 Descrição : Associado ao evento de duplo clique na tela da parcela(navegação)
--------------------------------------------------------------------------------
 Data      : 16/10/2007
 Autor     : Marcus Oliveira
 Pendência : 26550
 Descrição : Filtro para mostrar apenas documentos do CAP quando for contas a pagar e do CAR quando for receber
--------------------------------------------------------------------------------
 Data      : 03.04.2007
 Autor     : Antonio Marcos Fernandes de Souza (amf)
 Pendência : 24704
 Descrição : Adequação da consulta para ser chamada pelos sistemas CAPe CAR.
--------------------------------------------------------------------------------
 Data      : 23.02.2007
 Autor     : Antonio Marcos Fernandes de Souza (amf)
 Pendência : 24526
 Descrição : Criada a aba Observação para exibir o texto digitado na observação do lançamento
             do documento (CAP - aba Geral)
--------------------------------------------------------------------------------
 Data      : 19.10.2006
 Autor     : Antonio Marcos Fernandes de Souza (amf)
 Pendência : 21792
 Descrição : Retirando o acoplamento com as demais BPLs.
---------------------------------------------------------------------------------}

Unit FRADConsultaDoc;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Mask, wwdbedit, Db, Wwdatsrc,
  MontaSelect, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCGrids, TREdit, IvDictio, IvMulti,
  IvEMulti, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, DBCtrls, uCtrlParamIntegra,
  DBClient, uCMClientDataSet, uCmSqlParams, {amf 19.10.2006 21792 uCtrlDocumento,} Menus, ImgList,
  ToolWin, uCtrlRadConsModulos, uSistema;



Type
  TfrmRADConsultaDoc = Class(TfrmSairAjuda)
    dsDocs: TwwDataSource;
    dsContab: TwwDataSource;
    dsRateio: TwwDataSource;
    ToolbarSep971: TToolbarSep97;
    Panel2: TPanel;
    sBtnContabilizacao: TSpeedButton;
    SbtParcelas: TSpeedButton;
    spdLancto: TSpeedButton;
    SbtRateio: TSpeedButton;
    SbtEmissoes: TSpeedButton;
    DsParcelas: TwwDataSource;
    DsLote: TwwDataSource;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    Label2: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    edValor: TRealEdit;
    Label8: TLabel;
    edSaldo: TRealEdit;
    wwDBEdit5: TwwDBEdit;
    LblForneCedor: TLabel;
    DBDateEdit1: TCMDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    DBDateEdit2: TCMDateTimePicker;
    DBDateEdit3: TCMDateTimePicker;
    Label5: TLabel;
    LblFormaPag: TLabel;
    wwDBEdit3: TwwDBEdit;
    Label6: TLabel;
    Label11: TLabel;
    GpConta: TGroupBox;
    Label13: TLabel;
    wwDBEdit4: TwwDBEdit;
    Label14: TLabel;
    wwDBEdit6: TwwDBEdit;
    LblBanco: TLabel;
    LblAgencia: TLabel;
    LblConta: TLabel;
    LblTipoConta: TLabel;
    Label10: TLabel;
    SqlRateio: TCMSqlParams;
    CdsRateio: TCMClientDataSet;
    CdsLote: TCMClientDataSet;
    SqlLote: TCMSqlParams;
    CdsParcelas: TCMClientDataSet;
    SqlParcelas: TCMSqlParams;
    CdsContab3: TCMClientDataSet;
    SqlContab3: TCMSqlParams;
    CdsContabLanc: TCMClientDataSet;
    SqlContabLanc: TCMSqlParams;
    CdsDocs: TCMClientDataSet;
    SqlDocs: TCMSqlParams;
    sSql: TCMSqlParams;
    Cds: TCMClientDataSet;
    SqlContab: TCMSqlParams;
    CdsContab: TCMClientDataSet;
    ToolbarSep973: TToolbarSep97;
    SqlRad: TCMSqlParams;
    cdsRAD: TCMClientDataSet;
    DBEdit5: TDBEdit;
    SpeedButton1: TSpeedButton;
    CdsCCBaixasXDocum: TCMClientDataSet;
    dsCCBaixasXDocum: TwwDataSource;
    sqlCCBaixasXDocum: TCMSqlParams;
    LblTipoDoc: TLabel;
    dbedTipodoc: TwwDBEdit;
    dbchkBoxFiscal: TDBCheckBox;
    DsRAD: TwwDataSource;
    sqlProcesso: TCMSqlParams;
    cdsProcesso: TCMClientDataSet;
    dsProcesso: TwwDataSource;
    grBoxRAD: TGroupBox;
    dbtxtNumProc: TDBText;
    lblProcesso: TLabel;
    Label19: TLabel;
    dbtxtStatusProc: TDBText;
    pmnParcelas: TPopupMenu;
    mnuSelDocumento: TMenuItem;
    DBEdit1: TDBEdit;
    Label15: TLabel;
    lblModulo: TLabel;
    DBEdit2: TDBEdit;
    pnlDetalhe: TPanel;
    NtbConsDoc: TNotebook;
    DbgLancamentos: TwwDBGrid;
    dbgrdContab: TwwDBGrid;
    dbgRateio: TwwDBGrid;
    dbgRateioIButton: TwwIButton;
    DbgLote: TwwDBGrid;
    GrdParcelas: TwwDBGrid;
    dbgCCBaixas: TwwDBGrid;
    dbgEventos: TwwDBGrid;
    SqlEventos: TCMSqlParams;
    CdsEventos: TCMClientDataSet;
    dsEventos: TwwDataSource;
    SpeedButton2: TSpeedButton;
    dbDescricao: TDBMemo;
    tabObs: TTabSheet;
    MemObs: TDBMemo;
    msDoc: TMontaSelect;
    bbtnSeleciona: TSpeedButton;
    ToolbarSep975: TToolbarSep97;
    Procedure FormCreate(Sender: TObject);
    Procedure spdLanctoClick(Sender: TObject);
    Procedure sBtnContabilizacaoClick(Sender: TObject);
    Procedure SbtRateioClick(Sender: TObject);
    Procedure SbtEmissoesClick(Sender: TObject);
    Procedure SbtParcelasClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure GrdParcelasDblClick(Sender: TObject);
    procedure dbgrdContabTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgrdContabCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdContabTopRowChanged(Sender: TObject);
    procedure dbgRateioTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure DbgLancamentosTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelecionaClick(Sender: TObject);
  private
    { Private declarations }
    RadConsultaDoc: TCtrlRadConsultaDoc;
    flgContab, flgRateio, flgLancamento, flgParcelas, flgEmissao: Boolean;
    FbFromMenuCAPCAR: boolean;
//    Documento: TCtrlDocumento;
    Procedure MudaChave(codDocumento: Integer);
    Procedure MudaChaveLote(codDocumento: Integer);
    Procedure MudaChaveContab(Coddocumento: Integer);
    Procedure MudaChaveRateio(Coddocumento: Integer);
    Procedure MudaChaveParcelas(Coddocumento: Integer);

  public
    iCodDocumento : integer;

    iIdProcesso : integer;

    procedure SelecionarDoc; overload;

    //amf 03.04.2007 - exportada da FConsultaDocMT (do CAP)
    procedure SelecionarDoc(iCodDoc,iIdLote: integer; bExecutaMontaSelect: boolean); overload;

    class procedure SetDisparadorCapCar(bCapCar: boolean = False);

  End;

var
 frmRADConsultaDoc: TfrmRADConsultaDoc;

Implementation
{$R *.DFM}

Uses uFuncaoGeral, uDataBase, DBaseDados, uCtrlPadroes;

var
  bMenuCapCar: boolean;


Procedure TfrmRADConsultaDoc.FormCreate(Sender: TObject);
Begin
  Inherited;

  iCodDocumento := 0;
  iIdProcesso := 0;

  RadConsultaDoc := TCtrlRadConsultaDoc.Create;
  RadConsultaDoc.InitializeAs(Padroes);

  spdLancto.Down := True;

  PageControl1.ActivePage := TabSheet1;

  { amf 03.04.2007 24704 - Se foi disparado pelo CAP ou CAR, já exibe o form de consulta padrão
                           e habilita botão para consultas posteriores. }
  if (bMenuCAPCAR) then
     SelecionarDoc(0, 0, True);

End;


Procedure TfrmRADConsultaDoc.MudaChaveLote(Coddocumento: Integer);
Begin
  if coddocumento > 0 then
  begin
    If CdsLote.Active Then
      CdsLote.Close;
    SqlLote.Prepare;
    SqlLote.ParamByname('CODDOCUMENTO').AsInteger := coddocumento;
    SqlLote.Open;
    TFloatField(CdsDocs.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  end;
End;


Procedure TfrmRADConsultaDoc.MudaChaveContab(Coddocumento: Integer);
Begin
  If CdsContab.Active Then
    CdsContab.Close;
  SqlContab.Prepare;
  SqlContab.ParamByname('CODDOCUMENTO').Asinteger := coddocumento;
  SqlContab.Open;
  //início - andre tavares - pendencia 18771
  CdsContab.FieldByName('PLACONTA').EditMask := ParamIntegra.MascaraPlano + ';0;_';
  TFloatField(CdsContab.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';
  //fim - andre tavares - pendencia 18771
End;




Procedure TfrmRADConsultaDoc.MudaChaveRateio(Coddocumento: Integer);
Begin
  CdsRateio.Close;
  SqlRateio.Prepare;
  SqlRateio.ParamByname('CODDOCUMENTO').AsInteger := coddocumento;
  SqlRateio.Open;
  TFloatField(CdsRateio.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
End;




Procedure TfrmRADConsultaDoc.MudaChaveParcelas(Coddocumento: Integer);
Var
  iOper: Integer;
  sOper, nop: String;
Begin
  //início - andre tavares - pendência 18771 - 12/04/2005
  if trunc(coddocumento) = 0 then
    coddocumento := -1;
  //fim - andre tavares - pendência 18771 - 12/04/2005

  If CdsParcelas.Active Then CdsParcelas.Close;
  SqlParcelas.Prepare;

  SqlParcelas.ParamByname('NUMFATURA').AsFloat := coddocumento;
  iOper := StrToIntDef(Trim(CdsDocs.FieldByName('OPERLANC').AsString), 1);
  Case iOper Of
    1: sOper := '3';
    11: sOper := '13';
    3: sOper := '1';
    13: sOper := '11';
  Else
    sOper := IntToStr(iOper);
  End;
  SqlParcelas.ParamByname('OPERACAO').AsString := sOper;
  SqlParcelas.Open;
  TFloatField(CdsParcelas.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  CdsParcelas.First;
  while not CdsParcelas.Eof do
  begin
      nop := RadConsultaDoc.GetNumSlip(CdsParcelas.FieldByName('CODDOCUMENTO').AsInteger);
      if Trim(nop) <> '' then
      begin
         CdsParcelas.Edit;
         CdsParcelas.FieldByName('NUMOP').AsString := nop;
         CdsParcelas.Post;
     end;
     CdsParcelas.Next;
  end;
  CdsParcelas.First;
End;




Procedure TfrmRADConsultaDoc.spdLanctoClick(Sender: TObject);
Begin
  Inherited;
  NtbConsDoc.PageIndex := 0;
//  PnlDisplay.Caption := 'Lançamentos';
End;




Procedure TfrmRADConsultaDoc.sBtnContabilizacaoClick(Sender: TObject);
Begin
  Inherited;
  NtbConsDoc.PageIndex := 1;

  If Not flgContab Then
    MudaChaveContab( iCodDocumento );
  flgContab := true;

End;




Procedure TfrmRADConsultaDoc.SbtRateioClick(Sender: TObject);
Begin
  Inherited;
  NtbConsDoc.PageIndex := 2;

  If Not flgRateio Then

    MudaChaveRateio( iCodDocumento );

  flgRateio := true;
End;

Procedure TfrmRADConsultaDoc.SbtEmissoesClick(Sender: TObject);
Begin
  Inherited;

  If Not flgEmissao Then
    MudaChaveLote( iCodDocumento );

  flgEmissao := true;
  NtbConsDoc.PageIndex := 3;
End;




Procedure TfrmRADConsultaDoc.SbtParcelasClick(Sender: TObject);
Begin
  Inherited;

  If Not flgParcelas Then

  if iCodDocumento > 0 then
    MudaChaveParcelas( CdsDocs.FieldByName('NUMFATURA').asInteger );

  flgParcelas := true;
  NtbConsDoc.PageIndex := 4;
End;




Procedure TfrmRADConsultaDoc.MudaChave(Coddocumento: Integer);
var
  nop : String;
Begin
  If CdsDocs.Active Then
    CdsDocs.close;
  With SqlDocs Do
  Begin
    Prepare;
    ParamByname('CODDOCUMENTO').AsInteger := coddocumento;
    Open;

    TFloatField(CdsDocs.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  End;
  CdsDocs.First;
  while not CdsDocs.Eof do
  begin
      nop := RadConsultaDoc.GetNumSlip(CdsDocs.FieldByName('CODDOCUMENTO').AsInteger);
      if Trim(nop) <> '' then
      begin
         CdsDocs.Edit;
         CdsDocs.FieldByName('NUMOP').AsString := nop;
         CdsDocs.Post;
     end;
     CdsDocs.Next;
  end;
  CdsDocs.First;

  LblBanco.Caption        := '';
  LblAgencia.Caption      := '';
  LblConta.Caption        := '';
  LblTipoConta.Caption    := '';

  If Not CdsDocs.IsEmpty Then
  Begin
    try
       //amf 22.10.2006 21792
       RadConsultaDoc.BuscaContaDoc(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger);
       LblBanco.Caption        := 'Banco: ' + RadConsultaDoc.ContaBancaria.Banco +
                                  ' - ' + RadConsultaDoc.ContaBancaria.NomeBanco;
       LblAgencia.Caption      := 'Agência: ' + RadConsultaDoc.ContaBancaria.Agencia +
                                  ' - ' + RadConsultaDoc.ContaBancaria.Nomeagencia;
       LblConta.Caption        := 'Conta: ' + RadConsultaDoc.ContaBancaria.Numero;
       LblTipoConta.Caption    := 'Tipo: ' + RadConsultaDoc.ContaBancaria.DescTipo;
    except
       raise;
    end;
  end;
End;


// início - andre tavares - pendência 18771 - 08/04/2005
procedure TfrmRADConsultaDoc.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  NtbConsDoc.ActivePage := 'PagCCBaixas';
//  PnlDisplay.Caption := 'Contas de Baixa';
  CdsCCBaixasXDocum.Close;
  sqlCCBaixasXDocum.Prepare;
  sqlCCBaixasXDocum.ParamByName('CODDOCUMENTO').asInteger := iCodDocumento;
  sqlCCBaixasXDocum.Open;
  CdsCCBaixasXDocum.FieldByName('PLACONTA').EditMask := ParamIntegra.MascaraPlano + ';0;_';
  TFloatField(CdsCCBaixasXDocum.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
end;
// fim - andre tavares - pendência 18771 - 08/04/2005


procedure TfrmRADConsultaDoc.SelecionarDoc;
var
  rSaldo: Double;
begin
  CdsRad.Close;
  SqlRad.SQL.Text := 'SELECT CODDOCUMENTO FROM DOCUMENTO WHERE IDPROCESSO = ' + IntToStr( iIdProcesso );
  SqlRad.Open;

  if cdsRAD.IsEmpty then exit;

  iCodDocumento := CdsRad.FieldByName('CODDOCUMENTO').AsInteger;

  if iCodDocumento <= 0 then exit;

  cdsProcesso.Close;
  sqlProcesso.Prepare;
  sqlProcesso.paramByName('IDPROCESSO').asInteger := iIdProcesso;
  sqlProcesso.Open;

  MudaChave( iCodDocumento );

  //amf 22.10.2006 21792 - em substituição da uCtrlDocumento
  RadConsultaDoc.CalculaSaldo(iCodDocumento);
  rSaldo       := RadConsultaDoc.Valor;

  edSaldo.Text := FloatToStr(rSaldo);
  If CdsDocs.FieldByName('OPERDOC').AsString = '10' Then
    edSaldo.Text := floattostr(CdsDocs.FieldByName('VALOR').asfloat - rSaldo);
  edValor.Text := CdsDocs.FieldByName('VALOR').AsString;

  If CdsContab.Active Then
    CdsContab.close;

  // Rodolpho da Silva - P: 20282 - 21/09/2005
  SbtRateio.Enabled := not ((CdsDocs.FieldByName('DESCSTATUSDOC').AsString = 'Documento Englobado') or
                            (CdsDocs.FieldByName('DESCSTATUSDOC').AsString = 'Documento Englobado Liquidado')) ;


  If (CdsDocs.FieldByName('STATUS').AsString <> '2') Then
  Begin
    MudaChaveLote( iCodDocumento );

    If Not CdsLote.IsEmpty Then
    Begin
      CdsDocs.Edit;
      If CdsLote.FieldByName('FLGBAIXA').AsString = 'B' Then
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString :=
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString + ' Cheque emitido Baixado'

      Else If CdsLote.FieldByName('FLGBAIXA').AsString = 'C' Then
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString :=
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString + ' Consta em Lote Cancelado'

       Else If CdsLote.FieldByName('FLAGEMISSAO').AsString = '1' Then
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString :=
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString + ' Cheque emitido'

      Else
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString :=
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString + ' Pendente de Emissão';
      CdsDocs.Post;
    End;
  End;

  If Cds.Active Then
    Cds.Close;
  sSql.SQL.Text := 'SELECT ESTORNO FROM LANCTODOCUM WHERE ESTORNO ' +
                   'IS NOT NULL AND CODDOCUMENTO = ' + CdsDocs.FieldByName('CODDOCUMENTO').AsString;
  sSql.Open;

  If (Not CdsDocs.FieldByName('ESTORNO').IsNull) Or (Not Cds.Eof) Then
  begin
    CdsDocs.Edit;
    CdsDocs.FieldByName('DESCSTATUSDOC').AsString :=
    CdsDocs.FieldByName('DESCSTATUSDOC').AsString + ' Cancelado\Estornado';
    CdsDocs.Post;
  end;


  flgContab     := false;
  flgRateio     := false;
  flgLancamento := true;
  flgParcelas   := false;
  flgEmissao    := false;
  CdsContabLanc.Close;
  CdsContab3.Close;
  spdLancto.Click;
  spdLancto.Down := True;
end;




procedure TfrmRADConsultaDoc.GrdParcelasDblClick(Sender: TObject);
begin
  inherited;
  if iIdProcesso <= 0 then
    SelecionarDoc( CdsParcelas.FieldByName('CODDOCUMENTO').AsInteger, CdsParcelas.FieldByName('IDPROCESSO').AsInteger, False );
end;


procedure TfrmRADConsultaDoc.dbgrdContabTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsContab.IndexFieldNames := AFieldName;
end;


procedure TfrmRADConsultaDoc.dbgrdContabCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TfrmRADConsultaDoc.dbgrdContabTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TfrmRADConsultaDoc.dbgRateioTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsRateio.IndexFieldNames := AFieldName;
end;




procedure TfrmRADConsultaDoc.DbgLancamentosTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsDocs.IndexFieldNames := AFieldName;
end;

procedure TfrmRADConsultaDoc.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  NtbConsDoc.ActivePage := 'Eventos';
  CdsEventos.Close;
  sqlEventos.Prepare;
  sqlEventos.ParamByName('CODDOCUMENTO').asInteger := iCodDocumento;
  sqlEventos.Open;
end;

procedure TfrmRADConsultaDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(RadConsultaDoc);
  inherited;
end;

procedure TfrmRADConsultaDoc.bbtnSelecionaClick(Sender: TObject);
begin
  inherited;
   SelecionarDoc(0,0,true);
end;

procedure TfrmRADConsultaDoc.SelecionarDoc(iCodDoc, iIdLote: integer;
  bExecutaMontaSelect: boolean);
var
  rSaldo: Double;

begin

  //Marcus Oliveira p. 26550 16/10/2007
  if Sistema.IdModulo in [3, 4] then
  begin
    msDoc.Filtro.Add('D.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));
    msDoc.Filtro.Add('TIPODOCRECPAG.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));
  end;

  if Sistema.idrad <> 0 Then
  begin
    CdsRad.Close;
    SqlRad.SQL.Text := 'SELECT CODDOCUMENTO FROM DOCUMENTO WHERE IDPROCESSO = ' + IntToStr( Sistema.idrad );
    SqlRad.Open;
    if not CdsRad.Eof Then
      iCodDocumento := CdsRad.FieldByName('CODDOCUMENTO').AsInteger
    else
      exit;

    if sistema.usaRad then
    begin
      cdsProcesso.Close;
      sqlProcesso.Prepare;
      sqlProcesso.paramByName('IDPROCESSO').asInteger := Sistema.idrad;
      sqlProcesso.Open;
    end;
  end
  else
  begin
     if bExecutaMontaSelect then
     begin
        MsDoc.Executar;
        if msDoc.RetornouValor Then
        begin
          iCodDocumento := StrToInt( trim( MsDoc.ValoresChave[0] ) );
          //início ANDRE TAVARES  - pendência 19363
          if sistema.usaRad then
          begin
            cdsProcesso.Close;
            sqlProcesso.Prepare;
            sqlProcesso.paramByName('IDPROCESSO').asInteger := StrToIntDef(trim(MsDoc.ValoresChave[2]), -1);
            sqlProcesso.Open;
          end;
          //fim ANDRE TAVARES  - pendência 19363
        end
        else
          Exit;
     end
     else
     begin
        iCodDocumento := iCodDoc;
        if sistema.usaRad then
        begin
           cdsProcesso.Close;
           sqlProcesso.Prepare;
           sqlProcesso.paramByName('IDPROCESSO').asInteger := iIdLote;
           sqlProcesso.Open;
        end;
     end;
  end;

  MudaChave( iCodDocumento );

  //amf 03.04.2007  Documento.Saldo.CalculaSaldo( iCodDocumento );
  //amf 03.04.2007  rSaldo       := Documento.Saldo.Valor;

  //amf 03.04.2007 24704
  RadConsultaDoc.CalculaSaldo(iCodDocumento);
  rSaldo       := RadConsultaDoc.Valor;

  edSaldo.Text := FloattoStr(rSaldo);
  If CdsDocs.FieldByName('OPERDOC').AsString = '10' Then
    edSaldo.Text := floattostr(CdsDocs.FieldByName('VALOR').asfloat - rSaldo);
  edValor.Text := CdsDocs.FieldByName('VALOR').AsString;

  If CdsContab.Active Then
    CdsContab.close;

  // Rodolpho da Silva - P: 20282 - 21/09/2005
  SbtRateio.Enabled := not ((CdsDocs.FieldByName('DESCSTATUSDOC').AsString = 'Documento Englobado') or
                            (CdsDocs.FieldByName('DESCSTATUSDOC').AsString = 'Documento Englobado Liquidado')) ;


  If (CdsDocs.FieldByName('STATUS').AsString <> '2') Then
  Begin
    MudaChaveLote( iCodDocumento );

    If Not CdsLote.IsEmpty Then
    Begin
      CdsDocs.Edit;
      If CdsLote.FieldByName('FLGBAIXA').AsString = 'B' Then
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString :=
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString + ' Cheque emitido Baixado'

      Else If CdsLote.FieldByName('FLGBAIXA').AsString = 'C' Then
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString :=
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString + ' Consta em Lote Cancelado'

       Else If CdsLote.FieldByName('FLAGEMISSAO').AsString = '1' Then
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString :=
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString + ' Cheque emitido'

      Else
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString :=
         CdsDocs.FieldByName('DESCSTATUSDOC').AsString + ' Pendente de Emissão';
      CdsDocs.Post;
    End;
  End;

  If Cds.Active Then
    Cds.Close;
  sSql.SQL.Text := 'SELECT ESTORNO FROM LANCTODOCUM WHERE ESTORNO ' +
                   'IS NOT NULL AND CODDOCUMENTO = ' + CdsDocs.FieldByName('CODDOCUMENTO').AsString;
  sSql.Open;

  If (Not CdsDocs.FieldByName('ESTORNO').IsNull) Or (Not Cds.Eof) Then
  begin
    CdsDocs.Edit;
    CdsDocs.FieldByName('DESCSTATUSDOC').AsString :=
    CdsDocs.FieldByName('DESCSTATUSDOC').AsString + ' Cancelado\Estornado';
    CdsDocs.Post;
  end;


  flgContab     := false;
  flgRateio     := false;
  flgLancamento := true;
  flgParcelas   := false;
  flgEmissao    := false;
  CdsContabLanc.Close;
  CdsContab3.Close;
  spdLancto.Click;
  spdLancto.Down := True;
end;

class procedure TfrmRADConsultaDoc.SetDisparadorCapCar(bCapCar: boolean);
begin
   bMenuCapCar := bCapCar;
end;

End.

