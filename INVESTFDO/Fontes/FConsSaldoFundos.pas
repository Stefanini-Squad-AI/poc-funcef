//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 26/10/2005
// Linha(s) : AL_7
// Linha(s) : Retirada do Componente pplblSaldoFundosTipoFundo
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 13/07/2005
// Linha(s) : AL_6
// Linha(s) : Ajuste no layout do relatorio.
//******************************************************************************
// Data     : 07/07/2005
// Linha(s) : AL_5
// Linha(s) : Retiradao a crítica pois foi colocado na funcao BuscaSaldos
//            QryVerSaldoFech e QrySaldoFundo e QrySaldoFundoTotal filtragem de
//            NATUREZAOPERACAO <> 'R' do TIPOOPERACAO
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 11/07/2005
// Linha(s) : AL_4
// Linha(s) : Retirada  a coluna de variação do Saldo.
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 29/06/2005
// Linha(s) : AL_3
// Linha(s) : Retiradao do tratamento de abertura e fechamento
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 30/03/2005
// Linha(s) : AL_01
// Linha(s) : Implementação do saldo de abertura e fechamento
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 12/01/2005
// Linha(s) : QryFundoInvestOperacao, QrySaldoFundo
// Motivo   : Ajuste na busca da DTAVIGENCIA da tabela FUNDOINVEST, não trazia o mais recente
//            registro
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 27/10/2004
// Linha(s) : Al_2
// Motivo   : Ajuste para buscar a ultima data de fechamento
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 04/10/2004
// Linha(s) : Al_1
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************

unit FConsSaldoFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdblook, StdCtrls, Mask, wwdbedit, MontaSelect, DBTables,
  Db, Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, ExtCtrls, TB97Ctls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, DBCtrls, uOperacaoInvest,
  Grids, DBGrids, Wwdbigrd, Wwdbgrid, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, Menus, ppDB, ppDBPipe,
  ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, FPreview, fcLabel, wwriched;

type

  TfrmConsSaldoFundos = class(TfrmCadastroCS)
    Label6: TLabel;
    QryFundoInvestOperacao: TwwQuery;
    QrySaldoFundo: TwwQuery;
    DsSaldoFundo: TwwDataSource;
    QrySaldoFundoIDHISTFUNDO: TFloatField;
    QrySaldoFundoCODDOCUMENTO: TFloatField;
    QrySaldoFundoPLNCODIGO: TFloatField;
    QrySaldoFundoPLANO: TFloatField;
    QrySaldoFundoIDTIPOINVEST: TFloatField;
    QrySaldoFundoIDTIPOOPERACAO: TFloatField;
    QrySaldoFundoIDCARTEIRAINVEST: TFloatField;
    QrySaldoFundoIDFUNDOINVEST: TFloatField;
    QrySaldoFundoDATAAPLICACAO: TDateTimeField;
    QrySaldoFundoDATAMOVFUNDO: TDateTimeField;
    QrySaldoFundoHISTMOVFUNDO: TStringField;
    QrySaldoFundoNATURMOVFUNDO: TStringField;
    QrySaldoFundoTIPMOVFUNDO: TStringField;
    QrySaldoFundoVLRAPLICADO: TFloatField;
    QrySaldoFundoVLRIRPROV: TFloatField;
    QrySaldoFundoVLRIOFPROV: TFloatField;
    QrySaldoFundoVLRVARIACAO: TFloatField;
    QrySaldoFundoCOTASMOVFUNDO: TFloatField;
    QrySaldoFundoVLRMOVFUNDO: TFloatField;
    QrySaldoFundoFLGCALCSALDO: TStringField;
    QrySaldoFundoSALDOQTDCOTAS: TFloatField;
    QrySaldoFundoSALDOVLRFUNDO: TFloatField;
    QrySaldoFundoDESCFUNDOINVEST: TStringField;
    QrySaldoFundoVLRCOTAAPLICACAO: TFloatField;
    QrySaldoFundoSALDOLIQUIDO: TFloatField;
    QrySaldoFundoTotal: TwwQuery;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField18: TFloatField;
    dsSaldoFundoTotal: TwwDataSource;
    QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField;
    QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField;
    QryFundoInvestOperacaoMOECODIGO: TFloatField;
    QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoCNPJFUNDO: TStringField;
    QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField;
    QryFundoInvestOperacaoPZOCARENCIA: TFloatField;
    QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField;
    QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField;
    QryFundoInvestOperacaoPZOLIQRESG: TFloatField;
    QryFundoInvestOperacaoQTDDECQTD: TFloatField;
    QryFundoInvestOperacaoQTDDECVALOR: TFloatField;
    QryFundoInvestOperacaoSTAFUNDO: TStringField;
    QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField;
    QryFundoInvestOperacaoPERCTXPERFORM: TFloatField;
    QryFundoInvestOperacaoPERCTXADM: TFloatField;
    QryFundoInvestOperacaoCODFUNCETIP: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField;
    QryFundoInvestOperacaoCONTRCETIP: TStringField;
    sbtnMovimento: TToolbarButton97;
    QryAux: TwwQuery;
    pnlDadosBase: TPanel;
    Label2: TLabel;
    DtEdDataReferenciaGeral: TCMDateTimePicker;
    Panel1: TPanel;
    PgcSaldos: TPageControl;
    TbsSaldo: TTabSheet;
    Panel11: TPanel;
    Panel5: TPanel;
    Label14: TLabel;
    BtProduraSaldo: TSpeedButton;
    DbLkcSaldo: TwwDBLookupCombo;
    Panel10: TPanel;
    QrySaldoFundoVLRCOTAATUAL: TFloatField;
    DblTipoFundo: TwwDBLookupCombo;
    Label7: TLabel;
    QryTipoFundo: TwwQuery;
    Label33: TLabel;
    dblGestorCarteira: TwwDBLookupCombo;
    QryGestorCart: TwwQuery;
    QryGestorCartNOME: TStringField;
    QryGestorCartIDGESTORCARTEIRA: TFloatField;
    QryGestorCartIDPESSOA: TFloatField;
    QryTipoFundoInvest: TwwQuery;
    sbtnSaldos: TToolbarButton97;
    dbGrdSaldos: TwwDBGrid;
    PopMnuSaldo: TPopupMenu;
    MnuUmPlanoAbert: TMenuItem;
    pnlSaldos: TPanel;
    pnlSaldosDetalhes: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel12: TPanel;
    Panel16: TPanel;
    DBReLiq: TDBRealEdit;
    DBReIRRF: TDBRealEdit;
    DBReIOF: TDBRealEdit;
    DBReBruto: TDBRealEdit;
    DBReQtd: TDBRealEdit;
    QryBuscaUsuario: TwwQuery;
    QryUltDataFech: TwwQuery;
    QryVerSaldoFech: TwwQuery;
    Label30: TLabel;
    CbxAplic: TComboBox;
    DbDtRefAplc: TCMDateTimePicker;
    Label5: TLabel;
    MnuTodosPlanosAbert: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtProduraSaldoClick(Sender: TObject);
    procedure DtEdDataReferenciaGeralExit(Sender: TObject);
    procedure DbLkcSaldoEnter(Sender: TObject);
    procedure MnuUmPlanoAbertClick(Sender: TObject);
    procedure MnuTodosPlanosAbertClick(Sender: TObject);
    procedure DbLkcSaldoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcSaldoExit(Sender: TObject);
    procedure dblGestorCarteiraEnter(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DblTipoFundoEnter(Sender: TObject);
    procedure DblTipoFundoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CbxAplicExit(Sender: TObject);

  private
    { Private declarations }
    wValAnt : String;
    bTodos  : Boolean;
    //TodosPlanos = False - apenas "1 plano"; True - "todos os planos"    
    Procedure SaldoFundos(TodosPlanos : Boolean;
                          iAbert, iFechto : Integer);
    Procedure BuscaSaldos;
    Procedure AbreQryFundoInvestOperacao;

  public
    { Public declarations }

  end;

var
  frmConsSaldoFundos: TfrmConsSaldoFundos;

implementation

Uses
  UmensErro, UDataBase, uBibliotecaInvest, uSistema, UDiasUteisInv,
  dBaseDados, FTelaAut, UOperComum, FAguarde, FDmRelFundosSaldo, FDmRelatoriosFundos,
  UFundoComum;

{$R *.DFM}

procedure TfrmConsSaldoFundos.FormActivate(Sender: TObject);
begin
  inherited;
   PnlFundo.Enabled := True;
   WindowState      := wsMaximized;
end;

procedure TfrmConsSaldoFundos.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   PnlFundo.Enabled := True;
end;

procedure TfrmConsSaldoFundos.FormShow(Sender: TObject);
begin
  inherited;

  CbxAplic.Text := '';  

  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundo.Open;

  QryGestorCart.Open;

  //Verifica a ultima data de fechamento
  QryUltDataFech.Close;
  QryUltDataFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
  QryUltDataFech.ParamByName('IDTIPOFUNDOINVEST').Clear;
  QryUltDataFech.Open;
  While Not QryUltDataFech.Eof Do
  Begin

     DtEdDataReferenciaGeral.Text     := QryUltDataFech.FieldByName('DATAULTFECH').AsString;
     DtEdDataReferenciaGeral.DateTime := QryUltDataFech.FieldByName('DATAULTFECH').AsDateTime;
     DtEdDataReferenciaGeral.Update;    

     //Verifica se há saldo
     QryVerSaldoFech.Close;
     QryVerSaldoFech.ParamByName('IDFUNDOINVEST').Clear;
     QryVerSaldoFech.ParamByName('DATAMOVFUNDO').AsString       := DtEdDataReferenciaGeral.Text;
     QryVerSaldoFech.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     QryVerSaldoFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     QryVerSaldoFech.Open;

     //Al_2 - RICARDO - 27/10/2004
     If QryUltDataFech.FieldByName('DATAULTFECH').AsDateTime < pRPI.DATAULTFECHFDO Then
     begin
        If (Not QryVerSaldoFech.IsEmpty) Then
           QryUltDataFech.Last;

        QryUltDataFech.Next;
     end
     Else
        QryUltDataFech.Last;
  End;

  If DtEdDataReferenciaGeral.Text = '' Then
  Begin
     DtEdDataReferenciaGeral.Text := DateToStr(Date);
     DtEdDataReferenciaGeral.DateTime := Date;
     DtEdDataReferenciaGeral.Update;
  End;

  QryVerSaldoFech.Close;
  QryUltDataFech.Close;

  //AL_01 - Ricardo - 30/03/2005
  MnuUmPlanoAbert.Caption  := sPlanPrevCtbPatro;
  //AL_01 - Fim

  SelectNext(ActiveControl,True,True);

  pnlSaldos.Visible := True;
  pnlSaldosDetalhes.Visible := True;

  AbreQryFundoInvestoperacao;

  BtProduraSaldoClick(Sender);

end;

procedure TfrmConsSaldoFundos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  QryFundoInvestOperacao.Close;
  QryTipoFundoInvest.Close;
  QrySaldoFundoTotal.Close;
  QryVerSaldoFech.Close;
  QryUltDataFech.Close;
  QrySaldoFundo.Close;
  QryGestorCart.Close;
  QryTipoFundo.Close;

  inherited;

end;

procedure TfrmConsSaldoFundos.BuscaSaldos;
begin
   If Trim(DtEdDataReferenciaGeral.Text) = '' Then
      Exit;

   If Trim(DbLkcSaldo.Text) <> '' Then
   Begin
      QrySaldoFundoVLRCOTAATUAL.DisplayFormat  :=
               MontaMascaraDecVlr(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger);
      QrySaldoFundoSALDOQTDCOTAS.DisplayFormat :=
               MontaMascaraDecQtd(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger);
   End
   Else
   Begin
      QrySaldoFundoVLRCOTAATUAL.DisplayFormat  :='###,#0.000000000';
      QrySaldoFundoSALDOQTDCOTAS.DisplayFormat :='###,#0.000000000';
   End;

   // Preenche os Paramentros e refaz a Consulta dos Saldos
   with QrySaldoFundo do
   begin
      Filtered := False;
      Filter   := '';
      OperComum.LimpaParametros(QrySaldoFundo);
      if Trim(DbLkcSaldo.Text) <> '' then
         ParamByName('IDFUNDOINVEST').AsString    := DbLkcSaldo.LookupValue;

      //Al_1 - Ricardo - 04/10/2004         
      if Trim(DbDtRefAplc.Text) <> '' then
      begin
         If CbxAplic.ItemIndex = 1 Then
         begin
            ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
            ParamByName('TIPOMENOR').AsInteger    := CbxAplic.ItemIndex;
         end
         Else If CbxAplic.ItemIndex = 2 Then
         begin
            ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
            ParamByName('TIPOMAIOR').AsInteger    := CbxAplic.ItemIndex;
         end;
      end;

      if Trim(DtEdDataReferenciaGeral.Text) <> '' then
         ParamByName('DATAMOVFUNDO').AsString     := DtEdDataReferenciaGeral.Text;

      if DblTipoFundo.Text <> ''  then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

      if dblGestorCarteira.Text <> ''  then
         ParamByName('IDGESTORCARTEIRA').AsInteger := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;

      ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

      Open;
      //AL_5 INI
      // Busca dados do Tipo de Operacao - Fdo Imobiliário, recebto de dividendo, não influência no saldo
      //FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+IntToStr(iTipoInvestUsu)+
      //                ' AND NATUREZAOPERACAO =  ''R''');
      //if not QryAux.FieldByName('IDTIPOOPERACAO').IsNull then
      //begin
      //   Filter   := 'IDTIPOOPERACAO <> '+QryAux.FieldByName('IDTIPOOPERACAO').AsString;
      //   Filtered := True;
      //end;
      //QryAux.Close;
      //AL_5 Fim
   end;

   with QrySaldoFundoTotal do
   begin
      OperComum.LimpaParametros(QrySaldoFundoTotal);

      if Trim(DbLkcSaldo.Text) <> '' then
         ParamByName('IDFUNDOINVEST').AsString := DbLkcSaldo.LookupValue;

      //Al_1 - Ricardo - 04/10/2004         
      if Trim(DbDtRefAplc.Text) <> '' then
      begin
         If CbxAplic.ItemIndex = 1 Then
         begin
            ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
            ParamByName('TIPOMENOR').AsInteger    := CbxAplic.ItemIndex;
         end
         Else If CbxAplic.ItemIndex = 2 Then
         begin
            ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
            ParamByName('TIPOMAIOR').AsInteger    := CbxAplic.ItemIndex;
         end;
      end;

      if Trim(DtEdDataReferenciaGeral.Text) <> '' then
         ParamByName('DATAMOVFUNDO').AsString  := DtEdDataReferenciaGeral.Text;

      if DblTipoFundo.Text <> ''  then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

      if dblGestorCarteira.Text <> '' then
         ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;

      ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      Open;
   End;
end;

procedure TfrmConsSaldoFundos.BtProduraSaldoClick(Sender: TObject);
begin
  inherited;
   //Al_1 - Ricardo - 04/10/2004
   If CbxAplic.ItemIndex = 0 then
      DbDtRefAplc.Clear;

   If (DbDtRefAplc.Text  = '') And (CbxAplic.ItemIndex > 0) then
      DbDtRefAplc.Text  := DateToStr(pRPI.DTMUDACPMF);

   BuscaSaldos;
end;

procedure TfrmConsSaldoFundos.DtEdDataReferenciaGeralExit(Sender: TObject);
begin
  inherited;

  If (Trim(DtEdDataReferenciaGeral.Text) <> '') Then
  begin
     AbreQryFundoInvestoperacao;
     BtProduraSaldoClick(Sender);
  end;
end;

procedure TfrmConsSaldoFundos.MnuUmPlanoAbertClick(Sender: TObject);
begin
  inherited;
   SaldoFundos(False,1,0);
end;

procedure TfrmConsSaldoFundos.MnuTodosPlanosAbertClick(Sender: TObject);
begin
  inherited;
   SaldoFundos(True,1,0);
end;

procedure TfrmConsSaldoFundos.SaldoFundos(TodosPlanos : Boolean;
                                          iAbert, iFechto : Integer);
begin
   with DmRelFundosSaldo, DmRelFundosSaldo.QrySaldoTot do
   begin
      OperComum.LimpaParametros(QrySaldoTot);
      if not TodosPlanos then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

      //Al_1 - Ricardo - 04/10/2004         
      if Trim(DbDtRefAplc.Text) <> '' then
      begin
         If CbxAplic.ItemIndex = 1 Then
         begin
            ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
            ParamByName('TIPOMENOR').AsInteger    := CbxAplic.ItemIndex;
         end
         Else If CbxAplic.ItemIndex = 2 Then
         begin
            ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
            ParamByName('TIPOMAIOR').AsInteger    := CbxAplic.ItemIndex;
         end;
      end;

      ParamByName('DATAMOVFUNDO').AsString          := DtEdDataReferenciaGeral.Text;
      ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
      if Trim(DbLkcSaldo.Text) <> '' then
         ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DbLkcSaldo.LookupValue);
      if DblTipoFundo.Text <> '' then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      if dblGestorCarteira.Text <> ''  then
         ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      //AL_3 Ini
      //AL_01 - Ricardo - 30/03/2005
      //if iAbert  > 0 Then
      //   ParamByName('ABERTURA').AsInteger          := iAbert;
      //AL_01 - Fim
      //AL_3 Fim
      Open;
   end;

   with DmRelFundosSaldo, DmRelFundosSaldo.QrySaldoDet do
   begin
      OperComum.LimpaParametros(QrySaldoDet);
      if not TodosPlanos then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

      //Al_1 - Ricardo - 04/10/2004
      if Trim(DbDtRefAplc.Text) <> '' then
      begin
         If CbxAplic.ItemIndex = 1 Then
         begin
            ParamByName('DATAAPLICACAO').AsString   := DbDtRefAplc.Text;
            ParamByName('TIPOMENOR').AsInteger      := CbxAplic.ItemIndex;
         end
         Else If CbxAplic.ItemIndex = 2 Then
         begin
            ParamByName('DATAAPLICACAO').AsString   := DbDtRefAplc.Text;
            ParamByName('TIPOMAIOR').AsInteger      := CbxAplic.ItemIndex;
         end;
      end;

      ParamByName('DATAMOVFUNDO').AsString          := DtEdDataReferenciaGeral.Text;
      ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
      if Trim(DbLkcSaldo.Text) <> '' then
         ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DbLkcSaldo.LookupValue);
      if DblTipoFundo.Text <> '' then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      if dblGestorCarteira.Text <> ''  then
         ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      //AL_3 Ini
      //AL_01 - Ricardo - 30/03/2005
      //if iAbert  > 0 Then
      //   ParamByName('ABERTURA').AsInteger          := iAbert;
      //AL_01 - Fim
      //AL_3 Fim
               
      if QrySaldoTot.RecordCount > 0 Then
         Filter := 'IDFUNDOINVEST = ' + QrySaldoTot.FieldByName('IDFUNDOINVEST').AsString;

      Open;
      pplblSaldoFundosDataRef.Caption := DtEdDataReferenciaGeral.Text;
      //AL_7
      //pplblSaldoFundosTipoFundo.Caption :=  'Tipo de Fundo : ';
      if Trim(DblTipoFundo.Text) = '' then
      begin
         QryTipoFundo.First;
         While Not QryTipoFundo.Eof Do
         begin
            //AL_7
            //pplblSaldoFundosTipoFundo.Caption := pplblSaldoFundosTipoFundo.Caption + QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
            QryTipoFundo.Next;
            //AL_7
            //If Not QryTipoFundo.Eof Then pplblSaldoFundosTipoFundo.Caption := pplblSaldoFundosTipoFundo.Caption+' / ';
         end;
      end;
      //AL_7
      //else
         //pplblSaldoFundosTipoFundo.Caption := 'Tipo de Fundo: ' + DblTipoFundo.Text;
      //AL_7
      //if Trim(DbLkcSaldo.Text) = '' then
         //pplblSaldoFundosFundoT.Caption := 'Fundo: TODOS OS FUNDOS'
      //else
         //pplblSaldoFundosFundoT.Caption := 'Fundo: ' + DbLkcSaldo.Text;

      if not TodosPlanos then
      begin
         ghbCabecalhoPlano.Visible := False;
         gfbRodapePlano.Visible := False;
         LblPlano.Visible := True;
      end
      else
      begin
         ghbCabecalhoPlano.Visible := True;
         gfbRodapePlano.Visible := True;
         LblPlano.Visible := False;
      end;
      //Al_6 - Ricardo - 13/07/2005
      TfrmPreview.CreateModalPreview(Application,
                                     rptSaldoFundos,
                                     rptSaldoFundos.PrinterSetup.DocumentName);

      QrySaldoDet.Close;
      QrySaldoTot.Close;
   end;

   pnlFundo.Enabled := True;
   
   sbtnSaldos.Down  := False;
end;

procedure TfrmConsSaldoFundos.DbLkcSaldoEnter(Sender: TObject);
begin
  inherited;
  if Trim(DbLkcSaldo.Text) = '' then
     wValAnt := ''
  else
     wValAnt := DbLkcSaldo.LookupValue;
end;

procedure TfrmConsSaldoFundos.DbLkcSaldoCloseUp(Sender: TObject; LookupTable,
                                                   FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
     BuscaSaldos;
     if DbLkcSaldo.LookupValue = '' then
        bTodos := True
     else
        bTodos := False;
     wValAnt := DbLkcSaldo.LookupValue;
  end;
end;

procedure TfrmConsSaldoFundos.DbLkcSaldoExit(Sender: TObject);
begin
  inherited;
  if (wValAnt <> DbLkcSaldo.LookupValue) or
     ((wValAnt = '') and (not bTodos)) then
  begin
     if DbLkcSaldo.LookupValue = '' then
        bTodos := True
     else
        bTodos := False;
     BuscaSaldos;
  end;
end;

procedure TfrmConsSaldoFundos.AbreQryFundoInvestoperacao;
begin
   with QryFundoInvestOperacao do
   begin
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     if Trim(DblTipoFundo.Text) <> ''  then
        ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
            QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     if Trim(dblGestorCarteira.Text) <> ''  then
        ParamByName('IDGESTORCARTEIRA').AsInteger :=
            qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
     ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     if Trim(DtEdDataReferenciaGeral.Text) <> '' then
        ParamByName('DATAMOVFUNDO').AsString := DtEdDataReferenciaGeral.Text;
     Open;
   end;
end;

procedure TfrmConsSaldoFundos.dblGestorCarteiraEnter(Sender: TObject);
begin
  inherited;
  wValAnt := dblGestorCarteira.LookupValue;
end;

procedure TfrmConsSaldoFundos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   PnlFundo.Enabled := True;
end;

procedure TfrmConsSaldoFundos.DblTipoFundoEnter(Sender: TObject);
begin
  inherited;
  wValAnt := DblTipoFundo.LookupValue;
end;

procedure TfrmConsSaldoFundos.DblTipoFundoExit(Sender: TObject);
begin
  inherited;
  
  If ((Trim(DtEdDataReferenciaGeral.Text) <> '') And
           (wValAnt <> DblTipoFundo.LookupValue))  Then
     BtProduraSaldoClick(Sender);

end;

procedure TfrmConsSaldoFundos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := True;
end;

procedure TfrmConsSaldoFundos.CbxAplicExit(Sender: TObject);
begin
  inherited;
   //Al_1 - Ricardo - 04/10/2004  
   If CbxAplic.ItemIndex = 0 then
      DbDtRefAplc.Clear;

   If (DbDtRefAplc.Text  = '') And (CbxAplic.ItemIndex > 0) then
      DbDtRefAplc.Text  := DateToStr(pRPI.DTMUDACPMF);
end;

end.

