unit rExtMovUC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptExtMovUC = class(TFrmCmReport)
    BdeExtMovUC: TppBDEPipeline;
    dsExtMovUC: TwwDataSource;
    RptExtMovUC: TppReport;
    ppHeaderBand25: TppHeaderBand;
    LblEmpresa: TppLabel;
    ppLabel150: TppLabel;
    ppLabel153: TppLabel;
    LbUnCusteio: TppLabel;
    LbPeriodo: TppLabel;
    ppDetailBand19: TppDetailBand;
    ppDBText58: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    RptExtMovUCDBText1: TppDBText;
    RptExtMovUCDBText2: TppDBText;
    ppFooterBand25: TppFooterBand;
    LblSistema: TppLabel;
    ppLine63: TppLine;
    ppCalc48: TppSystemVariable;
    ppCalc49: TppSystemVariable;
    ppGroup11: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppLine64: TppLine;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppLine65: TppLine;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    ppLabel166: TppLabel;
    ppLabel167: TppLabel;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLabel168: TppLabel;
    ppLine68: TppLine;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLine69: TppLine;
    ppDBText72: TppDBText;
    ppLabel173: TppLabel;
    ppDBText73: TppDBText;
    ppLabel174: TppLabel;
    ppDBText74: TppDBText;
    ppLabel175: TppLabel;
    ppDBText75: TppDBText;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppDBText76: TppDBText;
    ppImage1: TppImage;
    RptExtMovUCLine1: TppLine;
    RptExtMovUCLine2: TppLine;
    RptExtMovUCLabel1: TppLabel;
    RptExtMovUCLabel2: TppLabel;
    RptExtMovUCLabel3: TppLabel;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppShape3: TppShape;
    ppLabel178: TppLabel;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    SqlParExtMovUC: TCMSqlParams;
    CdsExtMovUC: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptExtMovUC: TRptExtMovUC;
  sNomeUC: String = '';

implementation

{$R *.DFM}

Uses uSistema, uString;

procedure TRptExtMovUC.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlParExtMovUC Do Begin
       Prepare;

       If CmpRptCM.ParamValues[ 3 ].IsNull Then
          ParamByName( 'Item' ).ClearLine;

       If CmpRptCM.ParamValues[ 4 ].IsNull Then
          ParamByName( 'Grupo' ).ClearLine;

       ParamByName( 'UC' ).AsInteger      := CmpRptCM.ParamValues[ 0 ].AsInteger;
       ParamByName( 'DataIni' ).AsDate    := CmpRptCM.ParamValues[ 1 ].AsDateTime;
       ParamByName( 'DataFim' ).AsDate    := CmpRptCM.ParamValues[ 2 ].AsDateTime;
       ParamByName( 'IdEmpresa' ).AsFloat := CrmRptCM.IdEmpresa;

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
          ParamByName( 'Item' ).AsString  := Espaco( CmpRptCM.ParamValues[ 3 ].AsString, 14 );

       If Not CmpRptCM.ParamValues[ 4 ].IsNull Then
          ParamByName( 'Grupo' ).AsString := CmpRptCM.ParamValues[ 4 ].AsString;

       Open;
  End;

  lbUnCusteio.Caption := sNomeUC;
  lbPeriodo.Caption   := 'De ' + CmpRptCM.ParamValues[ 1 ].AsString + ' a ' + CmpRptCM.ParamValues[ 2 ].AsString;
end;

procedure TRptExtMovUC.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeUC := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptExtMovUC.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

end.
