//******************************************************************************
// Data     : 02/12/2004
// Motivo   : Implementacao do relatório de Operacoes
//******************************************************************************

unit FParamOperAmortFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, wwdblook, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel,
  ExtCtrls, FPreview, Db, DBTables, Wwquery;

type
  TfrmParamOperAmortFdo = class(TfrmOkCancelarInv)
    lblDtaIni: TLabel;
    dbdDtaIni: TCMDateTimePicker;
    dbDtaFinal: TCMDateTimePicker;
    lblDtaFinal: TLabel;
    lblPlanoPatro: TLabel;
    dblPlanoPatro: TwwDBLookupCombo;
    lblFundoInvest: TLabel;
    dblTipoFundoInvest: TwwDBLookupCombo;
    qryFundoInvest: TwwQuery;
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    qryTipoFundoInvest: TwwQuery;
    Label1: TLabel;
    dblFundoInvest: TwwDBLookupCombo;
    qryFundoInvestIDFUNDOINVEST: TFloatField;
    qryFundoInvestDESCFUNDOINVEST: TStringField;
    qryTipoFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    qryTipoFundoInvestIDTIPOINVEST: TFloatField;
    qryTipoFundoInvestDESCTIPOFUNDOINV: TStringField;
    qryTipoFundoInvestDATAULTFECH: TDateTimeField;
    qryTipoFundoInvestTRGDTINCLUSAO: TDateTimeField;
    qryTipoFundoInvestTRGUSERINCLUSAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dblTipoFundoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamOperAmortFdo: TfrmParamOperAmortFdo;

implementation

uses uOperComum, FDmRelConsAmortFdo, uMensErro;

{$R *.DFM}

procedure TfrmParamOperAmortFdo.FormShow(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(qryFundoInvest);
   qryFundoInvest.Open;
   OperComum.LimpaParametros(qryTipoFundoInvest);
   qryTipoFundoInvest.Open;
   qryPlanoPatro.Open;
   dbdDtaIni.Date := Date;
   dbDtaFinal.Date := Date;
end;

procedure TfrmParamOperAmortFdo.dblTipoFundoInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   OperComum.LimpaParametros(qryFundoInvest);
   if Trim(dblTipoFundoInvest.Text) <> '' then
      qryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := qryTipoFundoInvestIDTIPOFUNDOINVEST.AsInteger;
   qryFundoInvest.Open;
end;

procedure TfrmParamOperAmortFdo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryFundoInvest.Close;
   qryTipoFundoInvest.Close;
   qryPlanoPatro.Close;
end;

procedure TfrmParamOperAmortFdo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if Trim(dbdDtaIni.Text) = '' then
   begin
      MsgDlg('Data Inícial não informada.','Atenção',mtWarning,[mbOk],0);
      if dbdDtaIni.CanFocus then
         dbdDtaIni.SetFocus;
      Exit;
   end
   else if Trim(dbDtaFinal.Text) = '' then
   begin
      MsgDlg('Data Final não informada.','Atenção',mtWarning,[mbOk],0);
      if dbDtaFinal.CanFocus then
         dbDtaFinal.SetFocus;
      Exit;
   end;

   OperComum.LimpaParametros(DmRelConsAmortFdo.qryConsAmortFdo);
   DmRelConsAmortFdo.qryConsAmortFdo.ParamByName('DATAINI').asString := dbdDtaIni.Text;
   DmRelConsAmortFdo.qryConsAmortFdo.ParamByName('DATAFIM').asString := dbDtaFinal.Text;
   if Trim(dblPlanoPatro.Text) <> '' then
      DmRelConsAmortFdo.qryConsAmortFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := StrToInt(dblPlanoPatro.LookupValue);
   if Trim(dblFundoInvest.Text) <> '' then
      DmRelConsAmortFdo.qryConsAmortFdo.ParamByName('IDFUNDOINVEST').asInteger     := StrToInt(dblFundoInvest.LookupValue);
   if Trim(dblTipoFundoInvest.Text) <> '' then
      DmRelConsAmortFdo.qryConsAmortFdo.ParamByName('IDTIPOINVEST').asInteger      := qryTipoFundoInvestIDTIPOINVEST.AsInteger;
   DmRelConsAmortFdo.qryConsAmortFdo.Open;
   
   DmRelConsAmortFdo.lblDtIni.Caption := dbdDtaIni.Text;
   DmRelConsAmortFdo.lblDtFim.Caption := dbDtaFinal.Text;

   DmRelConsAmortFdo.rptConsAmortFdo.PrintToDevices;

   DmRelConsAmortFdo.qryConsAmortFdo.Close;
end;

end.
