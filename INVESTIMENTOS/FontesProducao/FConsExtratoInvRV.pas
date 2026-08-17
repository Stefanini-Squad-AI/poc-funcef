//******************************************************************************
//Data	     : 30/10/2006
//Código     : AL_5
//Pendência  : 23667
//Motivo(S)  : Implementação de Plano e Patrocinadora
//******************************************************************************
//Data	     : 11/04/2006
//Código     : AL_4
//Pendência  : 20192
//Motivo(S)  : Ajuste no SQL para acertar os totalizadores de Conpras e Vendas
//             Melhoria de lay-out
//             Acerto na filtragem por boleta (tb nas queries de Sld ini e final)
//******************************************************************************
//Data	     : 13/03/2006
//Código     : AL_3
//Pendência  : 20192
//Motivo(S)  : Acerto na impressâo do somatório de compras e venda quando faz a quebra
//             de pagina;
//             Melhoria de lay-out e filtragem por boleta
//******************************************************************************
//Data	     : 20/07/2005
//Código     : AL_2
//Motivo(S)  : Inserido o campos VLRVARIACAO na QryOperacoes e no relatório
//******************************************************************************
//Data	     : 13/07/2005
//Código     : AL_1
//Motivo(S)  : Inserido os campos DESPESAS e LUCPREJ na QryOperacoes
//******************************************************************************

unit FConsExtratoInvRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, Db, DBTables, Wwquery, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls,checklst, wwdbdatetimepicker,
  CMDateTimePicker, fcLabel, Menus, TREdit, FPreview, Mask, DBCtrls;

type
  TFrmConsExtratoInvRV = class(TfrmSairAjuda)
    QryInvestimento: TwwQuery;
    pgcExtrato: TPageControl;
    tbLancamentos: TTabSheet;
    dbgLancamentos: TwwDBGrid;
    DBGridIButton: TwwIButton;
    QryCarteira: TwwQuery;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryAux: TwwQuery;
    QryEmissor: TwwQuery;
    QryEmissorIDEMISSOR: TFloatField;
    QryEmissorSIGLAEMISSOR: TStringField;
    QryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryCarteiraDESCCARTINVEST: TStringField;
    tbEstoqueIni: TTabSheet;
    tbEstoqueFim: TTabSheet;
    dbgEstoqueIni: TwwDBGrid;
    dbgEstoqueFim: TwwDBGrid;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    bbtnImprimir: TBitBtn;
    pnlCombos: TPanel;
    Label2: TLabel;
    dblCarteira: TwwDBLookupCombo;
    Label4: TLabel;
    DbLkEmissor: TwwDBLookupCombo;
    Label1: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    Label6: TLabel;
    edDataIni: TCMDateTimePicker;
    Label8: TLabel;
    edDataFim: TCMDateTimePicker;
    pmnuConsExtLanc: TPopupMenu;
    mitLancFixCol: TMenuItem;
    mitLancLibCol: TMenuItem;
    N1: TMenuItem;
    mitLancLibColTodas: TMenuItem;
    pmnuConsExtSldIni: TPopupMenu;
    mitSldIniFixCol: TMenuItem;
    mitSldIniLibCol: TMenuItem;
    MenuItem3: TMenuItem;
    mitSldIniLibColTodas: TMenuItem;
    pmnuConsExtSldFim: TPopupMenu;
    mitSldFimFixCol: TMenuItem;
    mitSldFimLibCol: TMenuItem;
    MenuItem7: TMenuItem;
    mitSldFimLibColTodas: TMenuItem;
    dblTipoOperacao: TwwDBLookupCombo;
    Label3: TLabel;
    qryTipoOperacao: TwwQuery;
    pnlFundoValores: TPanel;
    pnlValores: TPanel;
    edtCPQtd: TRealEdit;
    lbNomItem: TfcLabel;
    edtCPVal: TRealEdit;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    Panel1: TPanel;
    fcLabel1: TfcLabel;
    fcLabel5: TfcLabel;
    fcLabel4: TfcLabel;
    edtVDVal: TRealEdit;
    edtVDQtd: TRealEdit;
    pnlSeparador: TPanel;
    qryBoleta: TwwQuery;
    lblBoleta: TLabel;
    dblkBoleta: TwwDBLookupCombo;
    dblkPlanPatro: TwwDBLookupCombo;
    lblPlanPatro: TLabel;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbLkEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure dbgLancamentosDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmnuConsExtLancPopup(Sender: TObject);
    procedure mitLancLibColTodasClick(Sender: TObject);
    procedure mitLancFixColClick(Sender: TObject);
    procedure mitLancLibColClick(Sender: TObject);
    procedure pmnuConsExtSldIniPopup(Sender: TObject);
    procedure mitSldIniFixColClick(Sender: TObject);
    procedure mitSldIniLibColClick(Sender: TObject);
    procedure mitSldIniLibColTodasClick(Sender: TObject);
    procedure pmnuConsExtSldFimPopup(Sender: TObject);
    procedure mitSldFimFixColClick(Sender: TObject);
    procedure mitSldFimLibColClick(Sender: TObject);
    procedure mitSldFimLibColTodasClick(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure dblTipoOperacaoExit(Sender: TObject);
    procedure dblCarteiraExit(Sender: TObject);
    procedure dblInvestimentoExit(Sender: TObject);
    procedure DbLkEmissorExit(Sender: TObject);
  private
    { Private declarations }
    procedure RefazQuery;
    procedure MontaNumDocumento;
  public
    { Public declarations }
  end;

var
  FrmConsExtratoInvRV: TFrmConsExtratoInvRV;
  wCotacaoMoeda:Double;
  wDataCotacao   :TDateTime;
implementation

Uses UBibliotecaInvest, UOperacaoInvest, UOperComum, dOperComum, UMensErro, FPrincipal,
  FDmRelExtratoInvRV;

{$R *.DFM}

procedure TFrmConsExtratoInvRV.FormShow(Sender: TObject);
Var
  TipoEmissor:String;
begin
  inherited;

  QryCarteira.Open;
  QryEmissor.Open;
  qryTipoOperacao.Open;

  QryInvestimento.Close;
  QryInvestimento.ParamByName('pIDEMISSOR').Clear;
  QryInvestimento.Open;

  //AL_3
  qryBoleta.Open;
  //AL_5
  QryPatroPlanPrevContab.Open;

  pgcExtrato.ActivePage := tbLancamentos;

  edtCPQtd.Value := 0;
  edtCPVal.Value := 0;
  edtVDQtd.Value := 0;
  edtVDVal.Value := 0;

// Busca Cotacao da Moeda Atuarial
  FazQuery(QryAux,'SELECT * FROM PARAMINVEST');
  If Not OperComum.BuscaCotacaoMoeda(QryAux.FieldByName('MOEDAATU').AsInteger, Date,
                           '<=', wCotacaoMoeda, wDataCotacao) Then Begin
     MsgDlg('Moeda Atuarial sem cotações .','Mensagem do Sistema',MtWarning,[MbOk],0);
     Exit;
  End;
end;

procedure TFrmConsExtratoInvRV.FormClose(Sender: TObject;  Var Action: TCloseAction);
begin
  inherited;

  QryEmissor.Close;
  QryCarteira.Close;
  QryInvestimento.Close;
  qryTipoOperacao.Close;

  //AL_3
  qryBoleta.Close;
  //AL_5
  QryPatroPlanPrevContab.Close;

  With DmRelExtratoInvRV Do
  Begin
     qryEstoqueIni.Close;
     qryOperacoes.Close;
     qryEstoqueFim.Close;
     qryExemplo.Close;
  end;
end;

Procedure TFrmConsExtratoInvRV.RefazQuery;
var
  bPrimeiro : boolean;
  sSQL : string;
  I : integer;
  fComprasQtd, fVendasQtd, fComprasVal, fVendasVal: Double;
begin
   DmRelExtratoInvRV.qryEstoqueIni.DisableControls;
   DmRelExtratoInvRV.qryOperacoes.DisableControls;
   DmRelExtratoInvRV.qryEstoqueFim.DisableControls;

   // AL_4
   OperComum.LimpaParametros(DmRelExtratoInvRV.qryEstoqueIni);
   OperComum.LimpaParametros(DmRelExtratoInvRV.qryOperacoes);
   OperComum.LimpaParametros(DmRelExtratoInvRV.qryEstoqueFim);

   // Saldo Inicial
   DmRelExtratoInvRV.qryEstoqueIni.ParamByName('DATAMOVCUSTOD').AsString := edDataIni.Text;
   if Trim(dblCarteira.Text) <> '' then
      DmRelExtratoInvRV.qryEstoqueIni.ParamByName('IDCARTEIRAINVEST').AsString := dblCarteira.LookupValue;
   if Trim(dblInvestimento.Text) = '' then
   begin
      if Trim(DbLkEmissor.Text) <> '' then
         DmRelExtratoInvRV.qryEstoqueIni.ParamByName('IDEMISSOR').AsString := DbLkEmissor.LookupValue;
   end else
      DmRelExtratoInvRV.qryEstoqueIni.ParamByName('IDINVESTIMENTO').AsString := dblInvestimento.LookupValue;
   // AL_4
   if Trim(dblkBoleta.Text) <> '' then
      DmRelExtratoInvRV.qryEstoqueIni.ParamByName('IDBOLETA').AsString := dblkBoleta.Text;
   // AL_5
   if Trim(dblkPlanPatro.Text) <> '' then
      DmRelExtratoInvRV.qryEstoqueIni.ParamByName('IDPLANPREVCTBPATR').AsString := dblkPlanPatro.LookupValue;

   // Operações
   DmRelExtratoInvRV.qryOperacoes.ParamByName('DTINI').AsString := edDataIni.Text;
   DmRelExtratoInvRV.qryOperacoes.ParamByName('DTFIM').AsString := edDataFim.Text;
   if Trim(dblTipoOperacao.text) <> '' then
      DmRelExtratoInvRV.qryOperacoes.ParamByName('IDTIPOOPERACAO').AsString := dblTipoOperacao.LookupValue;
   if Trim(dblCarteira.Text) <> '' then
      DmRelExtratoInvRV.qryOperacoes.ParamByName('IDCARTEIRAINVEST').AsString := dblCarteira.LookupValue;
   if Trim(dblInvestimento.Text) = '' then
   begin
      if Trim(DbLkEmissor.Text) <> '' then
         DmRelExtratoInvRV.qryOperacoes.ParamByName('IDEMISSOR').AsString := DbLkEmissor.LookupValue;
   end else
      DmRelExtratoInvRV.qryOperacoes.ParamByName('IDINVESTIMENTO').AsString := dblInvestimento.LookupValue;
   //AL_3
   if Trim(dblkBoleta.Text) <> '' then
      DmRelExtratoInvRV.qryOperacoes.ParamByName('NUMDOCUMENTO').AsString := dblkBoleta.Text;
   // AL_5
   if Trim(dblkPlanPatro.Text) <> '' then
      DmRelExtratoInvRV.qryOperacoes.ParamByName('IDPLANPREVCTBPATR').AsString := dblkPlanPatro.LookupValue;

   // Saldo Final
   DmRelExtratoInvRV.qryEstoqueFim.ParamByName('DTFIM').AsString := edDataFim.Text;
   if Trim(dblCarteira.Text) <> '' then
      DmRelExtratoInvRV.qryEstoqueFim.ParamByName('IDCARTEIRAINVEST').AsString := dblCarteira.LookupValue;
   if Trim(dblInvestimento.Text) = '' then
   begin
      if Trim(DbLkEmissor.Text) <> '' then
         DmRelExtratoInvRV.qryEstoqueFim.ParamByName('IDEMISSOR').AsString := DbLkEmissor.LookupValue;
   end else
      DmRelExtratoInvRV.qryEstoqueFim.ParamByName('IDINVESTIMENTO').AsString := dblInvestimento.LookupValue;
   // AL_4
   if Trim(dblkBoleta.Text) <> '' then
      DmRelExtratoInvRV.qryEstoqueFim.ParamByName('IDBOLETA').AsString := dblkBoleta.Text;
   // AL_5
   if Trim(dblkPlanPatro.Text) <> '' then
      DmRelExtratoInvRV.qryEstoqueFim.ParamByName('IDPLANPREVCTBPATR').AsString := dblkPlanPatro.LookupValue;

   DmRelExtratoInvRV.qryEstoqueIni.Open;
   DmRelExtratoInvRV.qryOperacoes.Open;
   DmRelExtratoInvRV.qryEstoqueFim.Open;

   DmRelExtratoInvRV.qryEstoqueIni.Filter := '';
   DmRelExtratoInvRV.qryEstoqueFim.Filter := '';

   edtCPQtd.Value := 0;
   edtCPVal.Value := 0;
   edtVDQtd.Value := 0;
   edtVDVal.Value := 0;

   while not DmRelExtratoInvRV.qryOperacoes.Eof do
   begin
      if DmRelExtratoInvRV.qryOperacoesNATURMOVCARTINV.AsString = 'A' then
      begin
         edtCPQtd.Value := edtCPQtd.Value + DmRelExtratoInvRV.qryOperacoesQTDEMOVINVCART.AsFloat;
         edtCPVal.Value := edtCPVal.Value + DmRelExtratoInvRV.qryOperacoesVLRMOVCARTINV.AsFloat;
      end else if DmRelExtratoInvRV.qryOperacoesNATURMOVCARTINV.AsString = 'D' then
      begin
         edtVDQtd.Value := edtVDQtd.Value + DmRelExtratoInvRV.qryOperacoesQTDEMOVINVCART.AsFloat;
         edtVDVal.Value := edtVDVal.Value + DmRelExtratoInvRV.qryOperacoesVLRMOVCARTINV.AsFloat;
      end;
      DmRelExtratoInvRV.qryOperacoes.Next;
   end;

   DmRelExtratoInvRV.qryOperacoes.First;

   dbgEstoqueIni.FixedCols := 0;
   dbgLancamentos.FixedCols := 0;
   dbgEstoqueFim.FixedCols := 0;
   mitLancLibColTodas.Enabled := False;
   mitLancLibCol.Enabled := False;
   mitLancFixCol.Enabled := True;

   DmRelExtratoInvRV.qryEstoqueIni.EnableControls;
   DmRelExtratoInvRV.qryOperacoes.EnableControls;
   DmRelExtratoInvRV.qryEstoqueFim.EnableControls;
end;

procedure TFrmConsExtratoInvRV.DbLkEmissorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
   begin
      // Refresh na combo de Investimento
      QryInvestimento.Close;

      if Trim(DbLkEmissor.Text) = '' then
         QryInvestimento.ParamByName('pIDEMISSOR').Clear
      else
         QryInvestimento.ParamByName('pIDEMISSOR').AsInteger
              := QryEmissor.FieldByName('IDEMISSOR').AsInteger;
      QryInvestimento.Open;
   end;
end;

procedure TFrmConsExtratoInvRV.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   DmRelExtratoInvRV.qryEstoqueIni.Close;
   DmRelExtratoInvRV.qryEstoqueFim.Close;
   DmRelExtratoInvRV.qryOperacoes.Close;

   dbgEstoqueIni.FixedCols := 0;
   dbgLancamentos.FixedCols := 0;
   dbgEstoqueFim.FixedCols := 0;
   mitLancLibColTodas.Enabled := False;
   mitLancLibCol.Enabled := False;
   mitLancFixCol.Enabled := False;

   edtCPQtd.Value := 0;
   edtCPVal.Value := 0;
   edtVDQtd.Value := 0;
   edtVDVal.Value := 0;
end;

procedure TFrmConsExtratoInvRV.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(edDataIni.Text) = '' then
  begin
     MsgDlg('Falta Data Inicio para o Relatório.','Mensagem do Sistema ',mtWarning,[mbOK],0);
     edDataIni.SetFocus;
     exit;
  end;
  if Trim(edDataFim.Text) = '' then
  begin
     MsgDlg('Falta Data Final para o Relatório.','Mensagem do Sistema ',mtWarning,[mbOK],0);
     edDataFim.SetFocus;
     exit;
  end;

  RefazQuery;

  if not ((DmRelExtratoInvRV.qryOperacoes.IsEmpty) and
          (DmRelExtratoInvRV.qryEstoqueIni.IsEmpty) and
          (DmRelExtratoInvRV.qryEstoqueFim.IsEmpty)) then
  begin
     bbtnImprimir.Enabled := True;
  end else begin
     bbtnImprimir.Enabled := False
  end;

  pgcExtrato.ActivePage := tbLancamentos;

end;

procedure TFrmConsExtratoInvRV.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
   DmRelExtratoInvRV.qryEstoqueIni.DisableControls;
   DmRelExtratoInvRV.qryOperacoes.DisableControls;
   DmRelExtratoInvRV.qryEstoqueFim.DisableControls;
   //AL_2
   DmRelExtratoInvRV.lblPeriodo.Caption   := 'Período : ' + edDataIni.Text + ' a ' + edDataFim.Text;
   //AL_3
   if Trim(dblkBoleta.Text) <> '' then
   begin
      DmRelExtratoInvRV.pplBoleta.Visible := True;
      DmRelExtratoInvRV.pplBoleta.Caption := 'Boleta : ' + dblkBoleta.Text;
   end;

   TfrmPreview.CreateModalPreview(Application,
                                  DmRelExtratoInvRV.rptHistInvRenVar,
                                  DmRelExtratoInvRV.rptHistInvRenVar.PrinterSetup.DocumentName);

   DmRelExtratoInvRV.qryEstoqueIni.Filter := '';
   DmRelExtratoInvRV.qryEstoqueFim.Filter := '';
   DmRelExtratoInvRV.qryEstoqueIni.EnableControls;
   DmRelExtratoInvRV.qryOperacoes.EnableControls;
   DmRelExtratoInvRV.qryEstoqueFim.EnableControls;
end;

procedure TFrmConsExtratoInvRV.dbgLancamentosDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if not ((gdSelected in State) or (gdFixed in State) or (gdFocused in State)) then
  begin
     if DmRelExtratoInvRV.qryOperacoesNATURMOVCARTINV.AsString = 'D' then
        dbgLancamentos.Canvas.Font.Color := clRed
     else If DmRelExtratoInvRV.qryOperacoesNATURMOVCARTINV.AsString = 'A' then
        dbgLancamentos.Canvas.Font.Color := clNavy
     else if DmRelExtratoInvRV.qryOperacoesNATURMOVCARTINV.AsString = 'N' then
        dbgLancamentos.Canvas.Font.Color := clOlive
     else if DmRelExtratoInvRV.qryOperacoesNATURMOVCARTINV.AsString = 'R' then
        dbgLancamentos.Canvas.Font.Color := clOlive
     else
        dbgLancamentos.Canvas.Font.Color := clWindowText;

     if (State = [gdSelected]) then
     begin
        if DmRelExtratoInvRV.qryOperacoesNATURMOVCARTINV.AsString = 'D' then
           dbgLancamentos.Canvas.Brush.Color := clAqua
        else if DmRelExtratoInvRV.qryOperacoesNATURMOVCARTINV.AsString = 'A' then
           dbgLancamentos.Canvas.Brush.Color := clAqua
        else if DmRelExtratoInvRV.qryOperacoesNATURMOVCARTINV.AsString = 'N' then
           dbgLancamentos.Canvas.Brush.Color := clAqua
        else if DmRelExtratoInvRV.qryOperacoesNATURMOVCARTINV.AsString = 'R' then
           dbgLancamentos.Canvas.Brush.Color := clAqua
        else
           dbgLancamentos.Canvas.Brush.Color := clWindowText;
     end;

     dbgLancamentos.DefaultDrawDataCell(Rect, Field, State);

  end;
end;

procedure TFrmConsExtratoInvRV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then
     SelectNext(ActiveControl,True,True);
end;

procedure TFrmConsExtratoInvRV.pmnuConsExtLancPopup(Sender: TObject);
begin
  inherited;
  if dbgLancamentos.DataSource.DataSet.Active then
  begin
     if dbgLancamentos.FixedCols = 0 then begin
        mitLancLibCol.Enabled := False;
        mitLancLibColTodas.Enabled := False;
        end
     else begin
        mitLancLibCol.Enabled := True;
        mitLancLibColTodas.Enabled := True;
     end;

     if dbgLancamentos.FixedCols = dbgLancamentos.GetColCount then
        mitLancFixCol.Enabled := False
     else
        mitLancFixCol.Enabled := True;
  end
  else
  begin
     mitLancLibCol.Enabled := False;
     mitLancLibColTodas.Enabled := False;
     mitLancFixCol.Enabled := False
  end;

end;

procedure TFrmConsExtratoInvRV.mitLancLibColTodasClick(Sender: TObject);
begin
  inherited;
  dbgLancamentos.FixedCols := 0;
end;

procedure TFrmConsExtratoInvRV.mitLancFixColClick(Sender: TObject);
begin
  inherited;
  dbgLancamentos.FixedCols := dbgLancamentos.FixedCols + 1;
end;

procedure TFrmConsExtratoInvRV.mitLancLibColClick(Sender: TObject);
begin
  inherited;
  dbgLancamentos.FixedCols := dbgLancamentos.FixedCols - 1;
end;

procedure TFrmConsExtratoInvRV.pmnuConsExtSldIniPopup(Sender: TObject);
begin
  inherited;
  if dbgEstoqueIni.DataSource.DataSet.Active then
  begin
     if dbgEstoqueIni.FixedCols = 0 then
     begin
        mitSldIniLibCol.Enabled := False;
        mitSldIniLibColTodas.Enabled := False;
     end
     else
     begin
        mitSldIniLibCol.Enabled := True;
        mitSldIniLibColTodas.Enabled := True;
     end;

     if dbgEstoqueIni.FixedCols = dbgEstoqueIni.GetColCount then
        mitSldIniFixCol.Enabled := False
     else
        mitSldIniFixCol.Enabled := True;
  end
  else
  begin
     mitSldIniLibCol.Enabled := False;
     mitSldIniLibColTodas.Enabled := False;
     mitSldIniFixCol.Enabled := False
  end;

end;

procedure TFrmConsExtratoInvRV.mitSldIniFixColClick(Sender: TObject);
begin
  inherited;
  dbgEstoqueIni.FixedCols := dbgEstoqueIni.FixedCols + 1;
end;

procedure TFrmConsExtratoInvRV.mitSldIniLibColClick(Sender: TObject);
begin
  inherited;
  dbgEstoqueIni.FixedCols := dbgEstoqueIni.FixedCols - 1;
end;

procedure TFrmConsExtratoInvRV.mitSldIniLibColTodasClick(Sender: TObject);
begin
  inherited;
  dbgEstoqueIni.FixedCols := 0;
end;

procedure TFrmConsExtratoInvRV.pmnuConsExtSldFimPopup(Sender: TObject);
begin
  inherited;
  if dbgEstoqueFim.DataSource.DataSet.Active then
  begin
     if dbgEstoqueFim.FixedCols = 0 then
     begin
        mitSldFimLibCol.Enabled := False;
        mitSldFimLibColTodas.Enabled := False;
     end
     else
     begin
        mitSldFimLibCol.Enabled := True;
        mitSldFimLibColTodas.Enabled := True;
     end;

     if dbgEstoqueFim.FixedCols = dbgEstoqueFim.GetColCount then
        mitSldFimFixCol.Enabled := False
     else
        mitSldFimFixCol.Enabled := True;
  end
  else
  begin
     mitSldFimLibCol.Enabled := False;
     mitSldFimLibColTodas.Enabled := False;
     mitSldFimFixCol.Enabled := False
  end;

end;

procedure TFrmConsExtratoInvRV.mitSldFimFixColClick(Sender: TObject);
begin
  inherited;
  dbgEstoqueFim.FixedCols := dbgEstoqueFim.FixedCols + 1;
end;

procedure TFrmConsExtratoInvRV.mitSldFimLibColClick(Sender: TObject);
begin
  inherited;
  dbgEstoqueFim.FixedCols := dbgEstoqueFim.FixedCols - 1;
end;

procedure TFrmConsExtratoInvRV.mitSldFimLibColTodasClick(Sender: TObject);
begin
  inherited;
  dbgEstoqueFim.FixedCols := 0;
end;

//AL_3
procedure TFrmConsExtratoInvRV.MontaNumDocumento;
begin
  inherited;
   if (Trim(edDataIni.Text) <> '') and (Trim(edDataFim.Text) <> '') then
   begin
      OperComum. LimpaParametros(qryBoleta);
      qryBoleta.ParamByName('DATAINI').AsString := edDataIni.Text;
      qryBoleta.ParamByName('DATAFIM').AsString := edDataFim.Text;
      if Trim(dblTipoOperacao.text) <> '' then
         qryBoleta.ParamByName('IDTIPOOPERACAO').AsString := dblTipoOperacao.LookupValue;
      if Trim(dblCarteira.Text) <> '' then
         qryBoleta.ParamByName('IDCARTEIRAINVEST').AsString := dblCarteira.LookupValue;
      if Trim(dblInvestimento.Text) = '' then
      begin
         if Trim(DbLkEmissor.Text) <> '' then
            qryBoleta.ParamByName('IDEMISSOR').AsString := DbLkEmissor.LookupValue;
      end
      else
         qryBoleta.ParamByName('IDINVESTIMENTO').AsString := dblInvestimento.LookupValue;
      qryBoleta.Open;
   end;
end;

procedure TFrmConsExtratoInvRV.edDataIniExit(Sender: TObject);
begin
  inherited;
   MontaNumDocumento;
end;

procedure TFrmConsExtratoInvRV.edDataFimExit(Sender: TObject);
begin
  inherited;
   MontaNumDocumento;
end;

procedure TFrmConsExtratoInvRV.dblTipoOperacaoExit(Sender: TObject);
begin
  inherited;
   MontaNumDocumento;
end;

procedure TFrmConsExtratoInvRV.dblCarteiraExit(Sender: TObject);
begin
  inherited;
   MontaNumDocumento;
end;

procedure TFrmConsExtratoInvRV.dblInvestimentoExit(Sender: TObject);
begin
  inherited;
   MontaNumDocumento;
end;

procedure TFrmConsExtratoInvRV.DbLkEmissorExit(Sender: TObject);
begin
  inherited;
   MontaNumDocumento;
end;

end.

