unit FParamOperacoesFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, FPreview;

type
  TfrmParamOperacoesFdo = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    lblDtaIni: TLabel;
    lblDtaFinal: TLabel;
    dbdDtaIni: TCMDateTimePicker;
    dbDtaFinal: TCMDateTimePicker;
    dblPlanoPatro: TwwDBLookupCombo;
    lblPlanoPatro: TLabel;
    lblFundoInvest: TLabel;
    dblFundoInvest: TwwDBLookupCombo;
    lblTipoOper: TLabel;
    dblTipoOper: TwwDBLookupCombo;
    qryFundoInvest: TwwQuery;
    qryFundoInvestDESCFUNDOINVEST: TStringField;
    qryFundoInvestIDFUNDOINVEST: TFloatField;
    qryFundoInvestIDGESTORCARTEIRA: TFloatField;
    qryFundoInvestTRGDTINCLUSAO: TDateTimeField;
    qryFundoInvestTRGUSERINCLUSAO: TStringField;
    qryFundoInvestMOECODIGO: TFloatField;
    qryFundoInvestIDCARTEIRAINVEST: TFloatField;
    qryFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    qryFundoInvestCNPJFUNDO: TStringField;
    qryFundoInvestSTAEXCLUSIVO: TStringField;
    qryFundoInvestPZOCARENCIA: TFloatField;
    qryFundoInvestPZOANIVERSARIO: TFloatField;
    qryFundoInvestPZOLIQAPLIC: TFloatField;
    qryFundoInvestPZOLIQRESG: TFloatField;
    qryFundoInvestQTDDECQTD: TFloatField;
    qryFundoInvestQTDDECVALOR: TFloatField;
    qryFundoInvestSTAFUNDO: TStringField;
    qryFundoInvestPZOAMORTIZACAO: TFloatField;
    qryFundoInvestPERCTXPERFORM: TFloatField;
    qryFundoInvestPERCTXADM: TFloatField;
    qryFundoInvestCODFUNCETIP: TStringField;
    qryFundoInvestSTAPROVISIONAIR: TStringField;
    qryFundoInvestSTAPROVISIONAIOF: TStringField;
    qryFundoInvestCONTRCETIP: TStringField;
    qryFundoInvestDATAREFERENCIA: TStringField;
    qryTipoOper: TwwQuery;
    qryTipoOperDESCTIPOOPERACAO: TStringField;
    qryTipoOperIDTIPOINVEST: TFloatField;
    qryTipoOperIDTIPOOPERACAO: TFloatField;
    qryTipoOperIDMERCADO: TFloatField;
    qryTipoOperCODTIPDOC: TFloatField;
    qryTipoOperNATUREZAOPERACAO: TStringField;
    qryTipoOperTIPOCUSTODIA: TStringField;
    qryTipoOperVENCIMENTO: TFloatField;
    qryTipoOperFLGGERACONTAB: TFloatField;
    qryTipoOperFLGGERACAPCAR: TFloatField;
    qryTipoOperRECPAG: TStringField;
    qryTipoOperTIPCREDOR: TStringField;
    qryTipoOperFLGGERACAF: TFloatField;
    qryTipoOperFLGTRANSF: TStringField;
    qryTipoOperTRGDTINCLUSAO: TDateTimeField;
    qryTipoOperTRGUSERINCLUSAO: TStringField;
    qryTipoOperFLGCORRET: TStringField;
    qryTipoOperFLGORDMOVINV: TStringField;
    qryTipoOperIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperFLGOPDIREITO: TStringField;
    qryTipoOperFLGAGE: TStringField;
    qryTipoOperFLGDATAEX: TStringField;
    qryTipoOperFLGDATACOM: TStringField;
    qryTipoOperFLGINVORIGEM: TStringField;
    qryTipoOperFLGPERC: TStringField;
    qryTipoOperFLGPARIDADE: TStringField;
    qryTipoOperFLGPRZBOLSA: TStringField;
    qryTipoOperFLGPRZEMP: TStringField;
    qryTipoOperFLGATADEC: TStringField;
    qryTipoOperFLGFORMAPAGREC: TStringField;
    qryTipoOperFLGDIVACAO: TStringField;
    qryTipoOperFLGINIPAG: TStringField;
    qryTipoOperFLGJUROS: TStringField;
    qryTipoOperMOTBLOQCARTORIG: TFloatField;
    qryTipoOperMOTBLOQCARTDEST: TFloatField;
    qryTipoOperTIPSALDOCARTORIG: TStringField;
    qryTipoOperTIPSALDOCARTDEST: TStringField;
    qryTipoOperFLGTRATAIR: TStringField;
    qryTipoOperSIGLATIPOOPER: TStringField;
    qryTipoOperFLGISENTOIR: TStringField;
    qryTipoOperFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperFLGOPGERENC: TStringField;
    qryTipoOperTIPOMOVTO: TStringField;
    qryTipoOperSTAATIVO: TStringField;
    qryTipoOperFLGRENTABILIDADE: TStringField;
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamOperacoesFdo: TfrmParamOperacoesFdo;

implementation

uses UmensErro, uOperComum, UBibliotecaInvest, FDMRelOperacoesFdo;

{$R *.DFM}

procedure TfrmParamOperacoesFdo.bbtnConfirmarClick(Sender: TObject);
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

   OperComum.LimpaParametros(DMRelOperacoesFdo.qryOperacoesFdo);
   //AL_2 Ini
   DMRelOperacoesFdo.qryOperacoesFdo.ParamByName('DTOPERINI').AsString := dbdDtaIni.Text;
   DMRelOperacoesFdo.qryOperacoesFdo.ParamByName('DTOPERFIN').AsString := dbDtaFinal.Text;
   //AL_2 Fim
   if Trim(dblPlanoPatro.Text) <> '' then
      DMRelOperacoesFdo.qryOperacoesFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := StrToInt(dblPlanoPatro.LookupValue);
   if Trim(dblFundoInvest.Text) <> '' then
      DMRelOperacoesFdo.qryOperacoesFdo.ParamByName('IDFUNDOINVEST').asInteger     := StrToInt(dblFundoInvest.LookupValue);
   if Trim(dblTipoOper.Text) <> '' then
      DMRelOperacoesFdo.qryOperacoesFdo.ParamByName('IDTIPOOPERACAO').asInteger    := StrToInt(dblTipoOper.LookupValue);
   DMRelOperacoesFdo.qryOperacoesFdo.Open;

   //AL_2 Ini
   if not DMRelOperacoesFdo.qryOperacoesFdo.IsEmpty then
   begin
      DMRelOperacoesFdo.lblDtaIni.Caption := dbdDtaIni.Text;
      DMRelOperacoesFdo.lblDtaFin.Caption := dbDtaFinal.Text;

      DMRelOperacoesFdo.rptOperacoesFdo.PrintToDevices;
   end
   else
   begin
      MsgDlg('Nenhuma Operação foi encontrada neste período !','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbdDtaIni.CanFocus then
         dbdDtaIni.SetFocus;
   end;
   DMRelOperacoesFdo.qryOperacoesFdo.Close;
end;

procedure TfrmParamOperacoesFdo.FormShow(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(qryFundoInvest);
   qryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   qryFundoInvest.Open;
   OperComum.LimpaParametros(qryTipoOper);
   qryTipoOper.ParamByName('IDTIPOINVESTUSU').AsInteger := iTipoInvestUsu;
   qryTipoOper.Open;
   qryPlanoPatro.Open;
   dbdDtaIni.Date := Date;
   dbDtaFinal.Date := Date;
end;

procedure TfrmParamOperacoesFdo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryFundoInvest.Close;
   qryTipoOper.Close;
   qryPlanoPatro.Close;
end;

end.
