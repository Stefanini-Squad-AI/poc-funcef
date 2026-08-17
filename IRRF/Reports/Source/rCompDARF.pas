{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Claudio Faria                   }
{ Atualizado Em: 22/11/2006                             }
{                                                       }
{*******************************************************}

unit rCompDARF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, Db, DBClient,
  uCMClientDataSet, Wwdatsrc, uCmSqlParams, ppDB, ppDBPipe, ppDBBDE,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands,
  ppCache, ppVar, ppParameter, uCtrRCompDARF, uCtrlPadroes;

type
  TFrmRptCompDARF = class(TFrmCmReport)
    cdsCompDARF: TCMClientDataSet;
    pprCompDARF: TppReport;
    pplCompDARF: TppBDEPipeline;
    sqlCompDARF: TCMSqlParams;
    dsCompDARF: TwwDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    lblConfIRRFAnaPeriodo: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel84: TppLabel;
    ppLine15: TppLine;
    ppVariable1: TppVariable;
    ppParameterList1: TppParameterList;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLine4: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppShape1: TppShape;
    ppLine5: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText9: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrRCompDARF : TCtrRCompDARF;
  public
    { Public declarations }
  end;

var
  FrmRptCompDARF: TFrmRptCompDARF;

implementation

{$R *.DFM}

procedure TFrmRptCompDARF.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

  lblConfIRRFAnaPeriodo.caption := 'Período: '+CmpRptCM.ParamValues[0].AsString+' a '+CmpRptCM.ParamValues[1].AsString;
  
  cdsCompDARF.Data := CtrRCompDARF.ListaCompDARF(CmpRptCM.ParamValues[0].AsDateTime, CmpRptCM.ParamValues[1].AsDateTime);
end;

procedure TFrmRptCompDARF.FormCreate(Sender: TObject);
begin
  inherited;
  CtrRCompDARF := TCtrRCompDARF.Create;
  CtrRCompDARF.InitializeAs(Padroes);
end;

procedure TFrmRptCompDARF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrRCompDARF);
end;

end.
