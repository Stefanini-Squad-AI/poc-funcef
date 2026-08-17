unit FConsLancCont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwdatsrc, Wwquery, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdbdatetimepicker, CMDateTimePicker,
  fcLabel;

type
  TfrmConsLancCont = class(TfrmOkCancelar)
    qryConsCarteira: TwwQuery;
    dtsConsCarteira: TwwDataSource;
    Label3: TLabel;
    qryOperacoes: TwwQuery;
    bt_Imprime: TBitBtn;
    qryAux: TwwQuery;
    pnlCombos: TPanel;
    edData: TCMDateTimePicker;
    dblConsCarteira: TwwDBLookupCombo;
    dblConsOperacao: TwwDBLookupCombo;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    dblTipoInvest: TwwDBLookupCombo;
    Label5: TLabel;
    pnlOperacoes: TPanel;
    dbgLancCont: TDBGrid;
    dbgTotais: TDBGrid;
    pnlLancamentos: TPanel;
    DBGrid1: TDBGrid;
    qryConsTipoInvest: TwwQuery;
    qryConsTipoInvestDESCTIPOINVEST: TStringField;
    qryConsTipoInvestIDTIPOINVEST: TFloatField;
    qryConsCarteiraIDCARTEIRAINVEST: TFloatField;
    qryConsCarteiraDESCCARTINVEST: TStringField;
    qryOperacoesDESCTIPOOPERACAO: TStringField;
    qryOperacoesIDTIPOOPERACAO: TFloatField;
    pnlGTotLancItem: TPanel;
    pnlGTLIDebitos: TPanel;
    pnlGTLICreditos: TPanel;
    lblTotDebitos: TfcLabel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    lblTotCreditos: TfcLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDataExit(Sender: TObject);
    procedure dblConsCarteiraExit(Sender: TObject);
    procedure dblTipoInvestExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Procedure FazQuery;
    procedure AtualizaControles(wInd: byte);
    { Private declarations }
  public
    Procedure AtualizaDados;
    Procedure AtualizaTotLanc;
    { Public declarations }
  end;

var
  FrmConsLancCont: TFrmConsLancCont;
  wTotQtd, wTotCart, wTotVar, wTotJur: Double;

implementation

{$R *.DFM}
Uses DBaseDados, UOperComum, UDiasUteisInv, FDmRelatorios, uMensErro, fPreview;

Procedure TfrmConsLancCont.FazQuery;
begin
   DmRelatorios.qryLancCont.DisableControls;
   DmRelatorios.qryLancContItens.DisableControls;
   Try
      OperComum.LimpaParametros(DmRelatorios.qryLancContItens);
      OperComum.LimpaParametros(DmRelatorios.qryLancCont);
      DmRelatorios.qryLancCont.ParamByName('DATAMOV').AsString := edData.Text;
      DmRelatorios.qryLancContItens.ParamByName('DATAMOV').AsString := edData.Text;
      DmRelatorios.qryLancCont.ParamByName('TIPOINVEST').AsInteger := StrToInt(dblTipoInvest.LookupValue);
      DmRelatorios.qryLancContItens.ParamByName('TIPOINVEST').AsInteger := StrToInt(dblTipoInvest.LookupValue);
      DmRelatorios.qryLancCont.ParamByName('CARTEIRA').AsInteger := StrToInt(dblConsCarteira.LookupValue);
      DmRelatorios.qryLancContItens.ParamByName('CARTEIRA').AsInteger := StrToInt(dblConsCarteira.LookupValue);
      if Trim(dblConsOperacao.Text) <> '' then
      begin
         DmRelatorios.qryLancCont.ParamByName('OPERACAO').AsInteger := StrToInt(dblConsOperacao.LookupValue);
         DmRelatorios.qryLancContItens.ParamByName('OPERACAO').AsInteger := StrToInt(dblConsOperacao.LookupValue);
      end;

      DmRelatorios.qryLancCont.Open;

      if DmRelatorios.qryLancContPLNCODIGO.IsNull then
         DmRelatorios.qryLancContItens.Filter := 'PLNCODIGO = 0'
      else
         DmRelatorios.qryLancContItens.Filter := 'PLNCODIGO = ' + DmRelatorios.qryLancContPLNCODIGO.AsString;
      DmRelatorios.qryLancContItens.Open;

      AtualizaDados;
      AtualizaTotLanc;
      DmRelatorios.qryLancCont.First;
      DmRelatorios.qryLancContItens.First;

   Finally;
      DmRelatorios.qryLancCont.EnableControls;
      DmRelatorios.qryLancContItens.EnableControls;
   end;

end;

Procedure TfrmConsLancCont.AtualizaDados;
begin

   With DmRelatorios Do
   begin
     dbgTotais.Columns[1].Title.Caption := FormatFloat('###,###,###,###,##0',qryLancContTQUANT.AsFloat);
     dbgTotais.Columns[2].Title.Caption := FormatFloat('###,###,###,##0.00', qryLancContTVALOR.AsFloat);
     dbgTotais.Columns[3].Title.Caption := FormatFloat('###,###,###,##0.00', qryLancContTVARIACAO.AsFloat);
     dbgTotais.Columns[4].Title.Caption := FormatFloat('###,###,###,##0.00', qryLancContTJUROS.AsFloat);
   end;

end;

procedure TfrmConsLancCont.AtualizaTotLanc;
begin
   lblTotDebitos.Caption := FormatFloat('###,###,###,##0.00',
                                        DmRelatorios.qryLancContItensTDEBITOS.AsFloat) + '  ';
   lblTotCreditos.Caption := FormatFloat('###,###,###,##0.00',
                                         DmRelatorios.qryLancContItensTCREDITOS.AsFloat) + '  ';
end;

procedure TfrmConsLancCont.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)

end;

procedure TfrmConsLancCont.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   If (edData.Text = '') then
   begin
     MsgDlg('Informe a Data de Movimentação.','Mensagem do Sistema',MtError,[MbOk],0);
     edData.SetFocus;
     exit;
   end;

   If (dblTipoInvest.LookupValue = '') then
   begin
     MsgDlg('Informe a Tipo de Investimento da Movimentação.','Mensagem do Sistema',MtError,[MbOk],0);
     dblTipoInvest.SetFocus;
     exit;
   end;

   If (dblConsCarteira.LookupValue = '') then
   begin
     MsgDlg('Informe a Carteira de Movimentação.','Mensagem do Sistema',MtError,[MbOk],0);
     dblConsCarteira.SetFocus;
     exit;
   end;

   FazQuery;
end;

procedure TfrmConsLancCont.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edData.Text := '';
  dblConsCarteira.text := '';
  dblConsOperacao.Text := '';
  AtualizaControles(0);
  FazQuery;
  edData.SetFocus;
end;

procedure TfrmConsLancCont.FormShow(Sender: TObject);
begin
  inherited;
  qryConsCarteira.Open;
  qryConsTipoInvest.Open;
  qryOperacoes.Open;
end;

procedure TfrmConsLancCont.bt_ImprimeClick(Sender: TObject);
begin
   inherited;
   DmRelatorios.pplCarteira.Caption  := dblConsCarteira.Text;
   DmRelatorios.pplDataReferencia.Caption  := edData.Text;

   DmRelatorios.qryLancCont.DisableControls;
   DmRelatorios.qryLancContItens.DisableControls;

   TFrmPreview.CreateModalPreview(Application,
                                  DmRelatorios.RptLancCont,
                                  DmRelatorios.RptLancCont.PrinterSetup.DocumentName);

   DmRelatorios.qryLancCont.EnableControls;
   DmRelatorios.qryLancContItens.EnableControls;
end;

procedure TfrmConsLancCont.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryConsCarteira.Close;
  qryConsTipoInvest.Close;
  qryOperacoes.Close;

end;

procedure TfrmConsLancCont.edDataExit(Sender: TObject);
begin
   inherited;
   AtualizaControles(1);
end;

procedure TfrmConsLancCont.dblConsCarteiraExit(Sender: TObject);
begin
  inherited;
   AtualizaControles(3);
end;

procedure TfrmConsLancCont.AtualizaControles(wInd: byte);
begin
   case wInd of
   0: begin
         OperComum.LimpaParametros(qryConsTipoInvest);
         OperComum.LimpaParametros(qryConsCarteira);
         OperComum.LimpaParametros(qryOperacoes);
      end;

   1: begin
         OperComum.LimpaParametros(qryConsTipoInvest);
         OperComum.LimpaParametros(qryConsCarteira);
         OperComum.LimpaParametros(qryOperacoes);
         if Trim(edData.Text) <> '' then
         begin
            qryConsTipoInvest.ParamByName('DATAMOV').AsDateTime := edData.DateTime;
            qryConsCarteira.ParamByName('DATAMOV').AsDateTime := edData.DateTime;
            qryOperacoes.ParamByName('DATAMOV').AsDateTime := edData.DateTime;
         end;
         qryConsCarteira.Open;
         qryConsTipoInvest.Open;
         qryOperacoes.Open;
      end;
   2: begin
         qryConsCarteira.Close;
         qryOperacoes.Close;
         if Trim(dblTipoInvest.Text) <> '' then
         begin
            qryConsCarteira.ParamByName('TIPOINVEST').AsInteger := qryConsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger;
            qryOperacoes.ParamByName('TIPOINVEST').AsInteger := qryConsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger;
         end;
         qryConsCarteira.Open;
         qryOperacoes.Open;
      end;
   3: begin
         qryOperacoes.Close;
         if Trim(dblConsCarteira.Text) <> '' then
            qryOperacoes.ParamByName('CARTEIRA').AsInteger := qryConsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
         qryOperacoes.Open;
      end;
   end;

end;

procedure TfrmConsLancCont.dblTipoInvestExit(Sender: TObject);
begin
  inherited;
   AtualizaControles(2);
end;

procedure TfrmConsLancCont.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

end;

end.
