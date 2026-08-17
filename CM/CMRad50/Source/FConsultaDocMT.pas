{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - FConsultaDocMT                                                    }
{------------------------------------------------------------------------------}
// Data      : 10/01/2006
// Autor     : Daniel Simões Braga
// Pendência : 15386
// Descrição : Adicionado na query do componente SQLRateio o campo R.CODEXTERNO
//             da tabela CENTRESPON.
//------------------------------------------------------------------------------
// Rotinas   : bbtnSelecionaClick
// Data      : 21/09/2005
// Autor     : Rodolpho da Silva
// Pendência : 20282
// Descrição : Não mostrar a guia de rateio quando o documento for englobado.
//             Quando o usuário, na guia de parcelas, der um duplo click,
//             selecionar automaticamente o documento desejado.
//------------------------------------------------------------------------------
// Rotinas   :
// Data      : 03/05/2005
// Autor     : Andre Tavares
// Pendência : 19363
// Descrição : implementar a visualização do processo RAD do documento.
//------------------------------------------------------------------------------
// Rotinas   : bbtnSelecionaClick
// Data      : 04/05/2005
// Autor     : Rodolpho da Silva
// Pendência : 18943
// Descrição : Aparecer status de englobado quando o documento é englobado.
//             No botão parcelas, aparecer as parcelas vinculadas ao documento, conforrme era no padrão 4.
//------------------------------------------------------------------------------
// Rotinas   : Form.Create
// Data      : 01/02/2005
// Autor     : Rodolpho da Silva
// Pendência : 18605
// Descrição : Corrigir erro na tela quando o usuário clicava no btSair do MontaSelect
//------------------------------------------------------------------------------
// Rotinas   : Várias
// Data      : 19/08/2004 (término)
// Autor     : David Ayrolla
// Pendência : 17221
// Descrição : Implementar processo RAD por lote ou por documento.
//------------------------------------------------------------------------------

Unit FConsultaDocMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Mask, wwdbedit, Db, Wwdatsrc,
  MontaSelect, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCGrids, TREdit, IvDictio, IvMulti,
  IvEMulti, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, DBCtrls, uCtrlParamIntegra,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlDocumento, Menus, ImgList,
  ToolWin;



Type
  TfrmConsultaDocMT = Class(TfrmSairAjuda)
    msDoc: TMontaSelect;
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
    bbtnSeleciona: TSpeedButton;
    dbgEventos: TwwDBGrid;
    SqlEventos: TCMSqlParams;
    CdsEventos: TCMClientDataSet;
    dsEventos: TwwDataSource;
    SpeedButton2: TSpeedButton;
    dbDescricao: TDBMemo;
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
    procedure bbtnSelecionaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);



  private
    { Private declarations }
    flgContab, flgRateio, flgLancamento, flgParcelas, flgEmissao: Boolean;
    Documento: TCtrlDocumento;
    Procedure MudaChave(codDocumento: Integer);
    Procedure MudaChaveLote(codDocumento: Integer);
    Procedure MudaChaveContab(Coddocumento: Integer);
    Procedure MudaChaveRateio(Coddocumento: Integer);
    Procedure MudaChaveParcelas(Coddocumento: Integer);

    // Rodolpho da Silva - P: 20282 - 21/09/2005
    procedure SelecionarDoc(iCodDoc,iIdLote: integer; bExecutaMontaSelect: boolean);



  public
    //DAVID - Pendência 17221
    iCodDocumento : integer;
  End;

Var
  frmConsultaDocMT: TfrmConsultaDocMT;

Implementation
{$R *.DFM}

Uses uFuncaoGeral, uDataBase, DBaseDados, uSistema, DDadosBancarios, uCtrlPadroes, uModulo;





Procedure TfrmConsultaDocMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  grBoxRAD.visible := sistema.UsaRAD; // andre tavares - pendencia 19363


  //DAVID - Pendência 17221
  iCodDocumento := 0;

  Documento := TCtrlDocumento.Create;
  Documento.InitializeAs(Padroes);

  msDoc.Filtro.Add('D.RECPAG = ''' + ParamIntegra.RecPag + '''');
  msDoc.Filtro.Add('D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  msDoc.Descricao.Delete(0);

  If ParamIntegra.RecPag = 'R' Then
  Begin
    msDoc.Descricao.Insert(0, 'Cliente');
    HelpContext := 40088;
    bbtnAjuda.HelpContext := 40088;
  End
  Else
  Begin
    msDoc.Descricao.Insert(0, 'Fornecedor');
    HelpContext := 30082;
    bbtnAjuda.HelpContext := 30082;
  End;

  msDoc.Filtro.Add('TIPODOCRECPAG.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag +
    ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 + ' and b.idusuario=' +
    inttostr(sistema.IdUsuario) + ') ' + ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag +
    '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' + inttostr(sistema.idusuario) + '))');

  bbtnSeleciona.Click;
  spdLancto.Down := True;


  //  Início - Rodolpho da Silva - P: 18605 - 01/02/2005
  if msDoc.RetornouValor then
  //  Fim    - Rodolpho da Silva - P: 18605 - 01/02/2005

  begin
     If ParamIntegra.RecPag = 'R' Then
     Begin
       CdsDocs.FieldByName('CHEQUE').displayLabel := 'Nº Lote';
       SbtEmissoes.Enabled := False;
       LblForneCedor.Caption := 'Cliente';
       TabSheet2.free;
       LblFormaPag.Caption := 'Forma de Recebimento';
     End;
  end;

  PageControl1.ActivePage := TabSheet1;

End;




Procedure TfrmConsultaDocMT.MudaChaveLote(Coddocumento: Integer);
Begin
  If CdsLote.Active Then
    CdsLote.Close;
  SqlLote.Prepare;
  SqlLote.ParamByname('CODDOCUMENTO').AsInteger := coddocumento;
  SqlLote.Open;
  TFloatField(CdsDocs.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
End;




Procedure TfrmConsultaDocMT.MudaChaveContab(Coddocumento: Integer);
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




Procedure TfrmConsultaDocMT.MudaChaveRateio(Coddocumento: Integer);
Begin
  CdsRateio.Close;
  SqlRateio.Prepare;
  SqlRateio.ParamByname('CODDOCUMENTO').AsInteger := coddocumento;
  SqlRateio.Open;
  TFloatField(CdsRateio.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
End;




Procedure TfrmConsultaDocMT.MudaChaveParcelas(Coddocumento: Integer);
Var
  iOper: Integer;
  sOper, nop: String;
Begin
  //início - andre tavares - pendência 18771 - 12/04/2005
  if trunc(coddocumento) = 0 then
    coddocumento := -1;
  //fim - andre tavares - pendência 18771 - 12/04/2005

  If CdsParcelas.Active Then
    CdsParcelas.Close;
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
      nop := Modulo.PegaNumeroOP(CdsParcelas.FieldByName('CODDOCUMENTO').AsInteger);
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




Procedure TfrmConsultaDocMT.spdLanctoClick(Sender: TObject);
Begin
  Inherited;
  NtbConsDoc.PageIndex := 0;
//  PnlDisplay.Caption := 'Lançamentos';
End;




Procedure TfrmConsultaDocMT.sBtnContabilizacaoClick(Sender: TObject);
Begin
  Inherited;
  NtbConsDoc.PageIndex := 1;

  If Not flgContab Then
    //David - Pendência 17221
    //MudaChaveContab(strtoInt(trim(MsDoc.ValoresChave[0])));
    MudaChaveContab( iCodDocumento );
  flgContab := true;
//  PnlDisplay.Caption := 'Contabilizações';
End;




Procedure TfrmConsultaDocMT.SbtRateioClick(Sender: TObject);
Begin
  Inherited;
  NtbConsDoc.PageIndex := 2;

  If Not flgRateio Then
    //David - Pendência 17221
    //MudaChaveRateio(strtoInt(trim(MsDoc.ValoresChave[0])));
    MudaChaveRateio( iCodDocumento );

  flgRateio := true;
//  PnlDisplay.Caption := 'Rateios';
End;

Procedure TfrmConsultaDocMT.SbtEmissoesClick(Sender: TObject);
Begin
  Inherited;

  If Not flgEmissao Then
    //DAVID - Pendência 17221
    //MudaChaveLote(strtoInt(trim(MsDoc.ValoresChave[0])));
    MudaChaveLote( iCodDocumento );

  flgEmissao := true;
  NtbConsDoc.PageIndex := 3;
//  PnlDisplay.Caption := 'Fluxo de Emissões';
End;




Procedure TfrmConsultaDocMT.SbtParcelasClick(Sender: TObject);
Begin
  Inherited;

  If Not flgParcelas Then
    //DAVID - Pendência 17221
    //MudaChaveParcelas(strtoIntdef(trim(MsDoc.ValoresChave[1]), 0));

    // Rodolpho da Silva - P: 18943 - 05/04/2005
    //MudaChaveParcelas( iCodDocumento );
    if MsDoc.RetornouValor then
      MudaChaveParcelas(strtoIntdef(trim(MsDoc.ValoresChave[1]), 0)) 
    else
      MudaChaveParcelas( CdsDocs.FieldByName('NUMFATURA').asInteger );

  flgParcelas := true;
  NtbConsDoc.PageIndex := 4;
//  PnlDisplay.Caption := 'Parcelas';
End;




Procedure TfrmConsultaDocMT.MudaChave(Coddocumento: Integer);
var
  nop : String;
  DmDadosBancarios: TDtmDadosBancarios;
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
      nop := Modulo.PegaNumeroOP(CdsDocs.FieldByName('CODDOCUMENTO').AsInteger);
      if Trim(nop) <> '' then
      begin
         CdsDocs.Edit;
         CdsDocs.FieldByName('NUMOP').AsString := nop;
         CdsDocs.Post;
     end;
     CdsDocs.Next;
  end;
  CdsDocs.First;
  If Not CdsDocs.IsEmpty Then
  Begin
    try
      //amf 17.10.2006 21792:
       DmDadosBancarios := TDtmDadosBancarios.Create(nil);
       DmDadosBancarios.BuscaContaDoc(coddocumento);
       LblBanco.Caption := 'Banco: ' + DmDadosBancarios.ContaBancaria.Banco +
                           ' - ' + DmDadosBancarios.ContaBancaria.NomeBanco;
       LblAgencia.Caption := 'Agência: ' + DmDadosBancarios.ContaBancaria.Agencia +
                             ' - ' + DmDadosBancarios.ContaBancaria.Nomeagencia;
       LblConta.Caption := 'Conta: ' + DmDadosBancarios.ContaBancaria.Numero;
       LblTipoConta.Caption := 'Tipo: ' + DmDadosBancarios.ContaBancaria.DescTipo;
    finally
       FreeAndNil(DmDadosBancarios);
    end;
    {
    With DtmDadosBancarios Do
    Begin
      BuscaContaDoc(coddocumento);
      LblBanco.Caption := 'Banco: ' + ContaBancaria.Banco + ' - ' + ContaBancaria.NomeBanco;
      LblAgencia.Caption := 'Agência: ' + ContaBancaria.Agencia + ' - ' + ContaBancaria.Nomeagencia;
      LblConta.Caption := 'Conta: ' + ContaBancaria.Numero;
      LblTipoConta.Caption := 'Tipo: ' + ContaBancaria.DescTipo;
    End; }
  End;
End;




// início - andre tavares - pendência 18771 - 08/04/2005
procedure TfrmConsultaDocMT.SpeedButton1Click(Sender: TObject);
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




procedure TfrmConsultaDocMT.SelecionarDoc(iCodDoc,iIdLote: integer; bExecutaMontaSelect: boolean);
var
  rSaldo: Double;

begin
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
  Documento.Saldo.CalculaSaldo( iCodDocumento );

  rSaldo       := Documento.Saldo.Valor;
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




procedure TfrmConsultaDocMT.GrdParcelasDblClick(Sender: TObject);
begin
  inherited;
   SelecionarDoc(CdsParcelas.FieldByName('CODDOCUMENTO').AsInteger,CdsParcelas.FieldByName('IDPROCESSO').AsInteger,False);
end;




procedure TfrmConsultaDocMT.dbgrdContabTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsContab.IndexFieldNames := AFieldName;
end;




procedure TfrmConsultaDocMT.dbgrdContabCalcCellColors(Sender: TObject;
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




procedure TfrmConsultaDocMT.dbgrdContabTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TfrmConsultaDocMT.dbgRateioTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsRateio.IndexFieldNames := AFieldName;
end;




procedure TfrmConsultaDocMT.DbgLancamentosTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsDocs.IndexFieldNames := AFieldName;
end;

procedure TfrmConsultaDocMT.bbtnSelecionaClick(Sender: TObject);
begin
  inherited;
  // Rodolpho da Silva - P:20282 - 21/09/2005
  // Transferi toda a rotina do botão para o método abaixo
   SelecionarDoc(0,0,true);

end;

procedure TfrmConsultaDocMT.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  NtbConsDoc.ActivePage := 'Eventos';
  CdsEventos.Close;
  sqlEventos.Prepare;
  sqlEventos.ParamByName('CODDOCUMENTO').asInteger := iCodDocumento;
  sqlEventos.Open;
end;

End.

