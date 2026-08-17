//******************************************************************************
// Data     : 18/10/2004
// Motivo   : Implementacao do relatório de Operacoes
//******************************************************************************

unit FParamOperRecebtoFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, wwdblook, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, FPreview;

type
  TFrmParamOperRecebtoFdo = class(TfrmOkCancelarInv)
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
    lblDtaIni: TLabel;
    lblDtaFinal: TLabel;
    dbdDtaIni: TCMDateTimePicker;
    dbDtaFinal: TCMDateTimePicker;
    lblPlanoPatro: TLabel;
    dblPlanoPatro: TwwDBLookupCombo;
    lblFundoInvest: TLabel;
    dblFundoInvest: TwwDBLookupCombo;
    lblTipoOper: TLabel;
    dblTipoOper: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamOperRecebtoFdo: TFrmParamOperRecebtoFdo;

implementation

uses UmensErro, uOperComum, UBibliotecaInvest, FDMRelOperRecebtoFdo;

{$R *.DFM}

procedure TFrmParamOperRecebtoFdo.FormShow(Sender: TObject);
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

procedure TFrmParamOperRecebtoFdo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryFundoInvest.Close;
   qryTipoOper.Close;
   qryPlanoPatro.Close;
end;

procedure TFrmParamOperRecebtoFdo.bbtnConfirmarClick(Sender: TObject);
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

   OperComum.LimpaParametros(DMRelOperRecebtoFdo.qryOperRecebtoFdo);
   if Trim(dblPlanoPatro.Text) <> '' then
      DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDPLANPREVCTBPATR').asInteger := StrToInt(dblPlanoPatro.LookupValue);
   if Trim(dblFundoInvest.Text) <> '' then
      DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDFUNDOINVEST').asInteger     := StrToInt(dblFundoInvest.LookupValue);
   if Trim(dblTipoOper.Text) <> '' then
      DMRelOperRecebtoFdo.qryOperRecebtoFdo.ParamByName('IDTIPOOPERACAO').asInteger    := StrToInt(dblTipoOper.LookupValue);
   DMRelOperRecebtoFdo.qryOperRecebtoFdo.Open;


   DMRelOperRecebtoFdo.lblDtaIni.Caption := dbdDtaIni.Text;
   DMRelOperRecebtoFdo.lblDtaFin.Caption := dbDtaFinal.Text;

   DMRelOperRecebtoFdo.rptOperRecebtoFdo.PrintToDevices;

   DMRelOperRecebtoFdo.qryOperRecebtoFdo.Close;
end;

end.
