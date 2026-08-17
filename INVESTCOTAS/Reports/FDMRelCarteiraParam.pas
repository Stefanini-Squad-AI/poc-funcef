unit FDMRelCarteiraParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReportInv, ppCtrls, ppDB, ppVar, ppBands, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, TXRB, CmParamReport,
  uCtrlPadroes, uCtrlParamCotaInvest;

type
  TRelCarteiraParam = class(TFrmCmReportInv)
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel3: TppLabel;
    ppDBText6: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine23: TppLine;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptReportStartPage(Sender: TObject);
    procedure rptReportBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CtrlParamCotaInvest : TCtrlParamCotaInvest;

    cCorZebra : TColor;        
  public
    { Public declarations }
  end;

var
  RelCarteiraParam: TRelCarteiraParam;

implementation

{$R *.DFM}

procedure TRelCarteiraParam.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);
end;

procedure TRelCarteiraParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlParamCotaInvest);

  inherited;

end;

procedure TRelCarteiraParam.CrmRptCMBeforePrint(Sender: TObject);
var iCarteira : Integer;
begin
  inherited;
  iCarteira     := -1;

  if not CmpRptCM.ParamByName('Carteira').IsNull then
     iCarteira := CmpRptCM.ParamByName('Carteira').AsInteger;

  Cds.Data :=  CtrlParamCotaInvest.ListParamCotaInvest(-1, iCarteira);

end;

procedure TRelCarteiraParam.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelCarteiraParam.rptReportStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TRelCarteiraParam.rptReportBeforePrint(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

end.
