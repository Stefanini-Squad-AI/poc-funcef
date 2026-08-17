unit rExtMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptExtMov = class(TFrmCmReport)
    bdeExtMov: TppBDEPipeline;
    dsExtMov: TwwDataSource;
    rptExtMov: TppReport;
    ppHeaderBand1: TppHeaderBand;
    LblEmpresa: TppLabel;
    lbAlmox: TppLabel;
    ppLabel1: TppLabel;
    rptExtMovLabel3: TppLabel;
    lbPeriodo: TppLabel;
    ppDetailBand1: TppDetailBand;
    rptExtMovDBText1: TppDBText;
    rptExtMovDBText2: TppDBText;
    rptExtMovDBText4: TppDBText;
    rptExtMovDBText5: TppDBText;
    rptExtMovDBText6: TppDBText;
    rptExtMovDBText8: TppDBText;
    rptExtMovDBText9: TppDBText;
    rptExtMovDBText10: TppDBText;
    rptExtMovDBText11: TppDBText;
    rptExtMovDBText12: TppDBText;
    rptExtMovDBText13: TppDBText;
    rptExtMovDBText16: TppDBText;
    ppFooterBand1: TppFooterBand;
    LblSistema: TppLabel;
    rptExtMovLine2: TppLine;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    rptExtMovGroup1: TppGroup;
    rptExtMovGroupHeaderBand1: TppGroupHeaderBand;
    rptExtMovLine1: TppLine;
    rptExtMovLabel24: TppLabel;
    rptExtMovLabel25: TppLabel;
    rptExtMovLine7: TppLine;
    rptExtMovLabel29: TppLabel;
    rptExtMovLabel30: TppLabel;
    rptExtMovLabel31: TppLabel;
    rptExtMovLabel33: TppLabel;
    rptExtMovLabel34: TppLabel;
    rptExtMovLabel35: TppLabel;
    rptExtMovLabel36: TppLabel;
    rptExtMovLabel37: TppLabel;
    rptExtMovLine8: TppLine;
    rptExtMovLine9: TppLine;
    rptExtMovLabel38: TppLabel;
    rptExtMovLine10: TppLine;
    rptExtMovLabel39: TppLabel;
    rptExtMovLabel40: TppLabel;
    rptExtMovLabel42: TppLabel;
    rptExtMovLabel43: TppLabel;
    rptExtMovLine11: TppLine;
    rptExtMovDBText3: TppDBText;
    rptExtMovLabel2: TppLabel;
    rptExtMovDBText7: TppDBText;
    rptExtMovLabel4: TppLabel;
    rptExtMovDBText14: TppDBText;
    rptExtMovLabel5: TppLabel;
    rptExtMovDBText15: TppDBText;
    rptExtMovLabel6: TppLabel;
    rptExtMovLabel7: TppLabel;
    rptExtMovDBText17: TppDBText;
    rptExtMovImage1: TppImage;
    rptExtMovGroupFooterBand1: TppGroupFooterBand;
    rptExtMovShape1: TppShape;
    rptExtMovLabel1: TppLabel;
    rptExtMovDBCalc1: TppDBCalc;
    rptExtMovDBCalc2: TppDBCalc;
    rptExtMovDBCalc3: TppDBCalc;
    rptExtMovDBCalc4: TppDBCalc;
    SqlParExtMov: TCMSqlParams;
    CdsExtMov: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptExtMov: TRptExtMov;
  sNomeAlmox: String = '';

implementation

{$R *.DFM}

Uses uSistema, uString;

procedure TRptExtMov.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlParExtMov Do Begin
       Prepare;

       If CmpRptCM.ParamValues[ 3 ].IsNull Then
          ParamByName( 'Item' ).ClearLine;

       If CmpRptCM.ParamValues[ 4 ].IsNull Then
          ParamByName( 'Grupo' ).ClearLine;

       ParamByName( 'Almox' ).AsInteger   := CmpRptCM.ParamValues[ 0 ].AsInteger;
       ParamByName( 'DataIni' ).AsDate    := CmpRptCM.ParamValues[ 1 ].AsDateTime;
       ParamByName( 'DataFim' ).AsDate    := CmpRptCM.ParamValues[ 2 ].AsDateTime;
       ParamByName( 'IdEmpresa' ).AsFloat := CrmRptCM.IdEmpresa;

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
          ParamByName( 'Item' ).AsString  := Espaco( CmpRptCM.ParamValues[ 3 ].AsString, 14 );

       If Not CmpRptCM.ParamValues[ 4 ].IsNull Then
          ParamByName( 'Grupo' ).AsString := CmpRptCM.ParamValues[ 4 ].AsString;

       Open;
  End;

  lbAlmox.Caption   := sNomeAlmox;
  lbPeriodo.Caption := 'De ' + CmpRptCM.ParamValues[ 1 ].AsString + ' a ' + CmpRptCM.ParamValues[ 2 ].AsString;
end;

procedure TRptExtMov.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT DESCALMOX, CODALMOXARIFADO FROM ALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa );
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptExtMov.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
  End;
end;

end.
