//******************************************************************************
// Data      : 07/04/2006
// Pendência :
// SOL       :
// Código    : AL_2
// Motivo    : Implementado do relatório(impressão)
//******************************************************************************
// Data      : 23/02/2005
// Código    : Al_1
// Pendencia :
// SOL       :
// Motivo    : Ajuste no layout da tela.
//******************************************************************************

unit FConsSldCompFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, TREdit, Grids, Wwdbigrd, Wwdbgrid, Db,
  Wwdatsrc, wwdblook, wwdbdatetimepicker, CMDateTimePicker, DBTables,
  Wwquery;

type
  TFrmConsSldCompFundo = class(TfrmOkCancelarInv)
    QryComposicaoFundo: TwwQuery;
    qryInvest: TwwQuery;
    qryInvestDESCFUNDOINVEST: TStringField;
    qryInvestIDFUNDOINVEST: TFloatField;
    PnlConsulta: TPanel;
    Label2: TLabel;
    DtEdDataReferenciaGeral: TCMDateTimePicker;
    Label7: TLabel;
    dblInvest: TwwDBLookupCombo;
    PnlConsultaGrid: TPanel;
    Label1: TLabel;
    PnlTotalSaldo: TPanel;
    PnlSaldoGrid: TPanel;
    Label3: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label11: TLabel;
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
    dbGrdSaldos: TwwDBGrid;
    DBReQtd: TDBRealEdit;
    DBReBruto: TDBRealEdit;
    DBReIOF: TDBRealEdit;
    DBReIRRF: TDBRealEdit;
    DBReLiq: TDBRealEdit;
    DbLkcComposicaoFundo: TwwDBLookupCombo;
    QryUltDataFech: TwwQuery;
    QryVerSaldoFech: TwwQuery;
    //AL_2    
    bt_Imprime: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    procedure FormShow(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormActivate(Sender: TObject);
    //AL_2    
    procedure DtEdDataReferenciaGeralExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblInvestExit(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }

    procedure AbreQry;

  public
    { Public declarations }
  end;

var
  FrmConsSldCompFundo: TFrmConsSldCompFundo;
  bModif : Boolean;

implementation

Uses
  UmensErro,UDataBase, uBibliotecaInvest, UOperComum,  FPreview, FDmRelSldComposicaoFdoRF;

{$R *.DFM}

procedure TFrmConsSldCompFundo.FormShow(Sender: TObject);
begin
  inherited;
   qryInvest.Open;

  //Verifica a ultima data de fechamento
  QryUltDataFech.Close;
  QryUltDataFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
  QryUltDataFech.ParamByName('IDTIPOFUNDOINVEST').Clear;
  QryUltDataFech.Open;
  While Not QryUltDataFech.Eof Do
  Begin
     DtEdDataReferenciaGeral.Text := QryUltDataFech.FieldByName('DATAULTFECH').AsString;
     DtEdDataReferenciaGeral.Repaint;

     //Verifica se há saldo
     QryVerSaldoFech.Close;
     QryVerSaldoFech.ParamByName('IDFUNDOINVEST').Clear;
     QryVerSaldoFech.ParamByName('DATAMOVFUNDO').AsString       := DtEdDataReferenciaGeral.Text;
     QryVerSaldoFech.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     QryVerSaldoFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     QryVerSaldoFech.Open;
     If Not QryVerSaldoFech.IsEmpty Then
        QryUltDataFech.Last;
     QryUltDataFech.Next;
  End;

  QryVerSaldoFech.Close;
  QryUltDataFech.Close;

  AbreQry;

end;

procedure TFrmConsSldCompFundo.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   bModif := modified;
   if modified then
   begin
      OperComum.LimpaParametros(QryComposicaoFundo);
      if Trim(dblInvest.Text) <> '' then
         QryComposicaoFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.LookupValue);
      QryComposicaoFundo.Open;
   end;   
end;

procedure TFrmConsSldCompFundo.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

procedure TFrmConsSldCompFundo.AbreQry;
begin
   with DmRelSldComposicaoFdoRF do
   begin
      OperComum.LimpaParametros(qrySldComposicaoFdoRF);
      qrySldComposicaoFdoRF.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      If dblInvest.LookupValue <> '' Then
         qrySldComposicaoFdoRF.ParamByName('IDFUNDOINVEST').AsInteger  := StrToInt(dblInvest.LookupValue);

      If DbLkcComposicaoFundo.LookupValue <> '' Then
         qrySldComposicaoFdoRF.ParamByName('IDFUNDOINVESTCOMP').AsInteger   :=
                          QryComposicaoFundo.FieldByName('IDFUNDOINVESTCOMP').AsInteger;

      qrySldComposicaoFdoRF.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      qrySldComposicaoFdoRF.ParamByName('DATAMOVFUNDO').AsString       := DtEdDataReferenciaGeral.Text;
      qrySldComposicaoFdoRF.Open;
   end;

   OperComum.LimpaParametros(QrySaldoFundoTotal);
   QrySaldoFundoTotal.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   If dblInvest.LookupValue <> '' Then
      QrySaldoFundoTotal.ParamByName('IDFUNDOINVEST').AsInteger  := StrToInt(dblInvest.LookupValue);

   If DbLkcComposicaoFundo.LookupValue <> '' Then
      QrySaldoFundoTotal.ParamByName('IDFUNDOINVESTCOMP').AsInteger  := StrToInt(DbLkcComposicaoFundo.LookupValue);

   QrySaldoFundoTotal.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QrySaldoFundoTotal.ParamByName('DATAMOVFUNDO').AsString       := DtEdDataReferenciaGeral.Text;
   QrySaldoFundoTotal.Open;
end;

procedure TFrmConsSldCompFundo.DtEdDataReferenciaGeralExit(
  Sender: TObject);
begin
  inherited;

  bModif := False;  

  If DtEdDataReferenciaGeral.Text = '' Then
  Begin
     MsgDlg('Preencha o campo Data.','Informação',mtInformation,[mbOk],0);
     DtEdDataReferenciaGeral.SetFocus;
     Exit;
  End;
  //AL_1
  OperComum.LimpaParametros(QryComposicaoFundo);
  if Trim(dblInvest.Text) <> '' then
     QryComposicaoFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.LookupValue);
  QryComposicaoFundo.Open;
end;

procedure TFrmConsSldCompFundo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   AbreQry;
end;

procedure TFrmConsSldCompFundo.dblInvestExit(Sender: TObject);
begin
  inherited;
   if bModif then
   begin
      OperComum.LimpaParametros(QryComposicaoFundo);
      if Trim(dblInvest.Text) <> '' then
         QryComposicaoFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.LookupValue);
      QryComposicaoFundo.Open;
   end;
end;

//AL_2
procedure TFrmConsSldCompFundo.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   with DmRelSldComposicaoFdoRF do
   begin
      qrySldComposicaoFdoRF.DisableControls;
      lblPeriodoRef.Caption := DtEdDataReferenciaGeral.Text;
      TfrmPreview.CreateModalPreview(Application, rpSldComposicaoFdoRF,
                                     rpSldComposicaoFdoRF.PrinterSetup.DocumentName);
      qrySldComposicaoFdoRF.EnableControls;
   end;   
end;

end.
