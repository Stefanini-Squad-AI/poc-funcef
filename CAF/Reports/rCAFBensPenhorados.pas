unit rCAFBensPenhorados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, MontaSelect,
  ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, uCmSqlParams, ppStrtch, ppMemo;

type
  TRptCAFBensPenhorados = class(TFrmCmReport)
    sqlBensPenhorados: TCMSqlParams;
    cdsBensPenhorados: TCMClientDataSet;
    dsBensPenhorados: TwwDataSource;
    ppBensPenhorados: TppBDEPipeline;
    sqlParamCaf: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    rpBensPenhorados: TppReport;
    ppHeaderBand7: TppHeaderBand;
    lblTituloRelat: TppLabel;
    ppLine13: TppLine;
    LblEmpresa: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine15: TppLine;
    ppDetailBand7: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand7: TppFooterBand;
    ppLine14: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    LblSistema: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    MSBem: TMontaSelect;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    cdsBensPenhoradosIDBEM: TFloatField;
    cdsBensPenhoradosPLACA: TFloatField;
    cdsBensPenhoradosDESBEM: TStringField;
    cdsBensPenhoradosCONTROLE: TStringField;
    cdsBensPenhoradosDESCCCUSTO: TStringField;
    cdsBensPenhoradosDESCLOCAL: TStringField;
    cdsBensPenhoradosNOMERESP: TStringField;
    cdsBensPenhoradosDESCGRUPO: TStringField;
    cdsBensPenhoradosDESCCONJUNTO: TStringField;
    cdsBensPenhoradosIDOPCIONAL: TStringField;
    cdsBensPenhoradosDESCCLASSE: TStringField;
    cdsBensPenhoradosDESCSITUACAO: TStringField;
    cdsBensPenhoradosDATA_PENHORA: TDateTimeField;
    cdsBensPenhoradosNUMPROCTRAB: TFloatField;
    cdsBensPenhoradosVALOR_PENHORA: TFloatField;
    cdsBensPenhoradosVALOR: TFloatField;
    cdsBensPenhoradosINDVALOR: TFloatField;
    cdsBensPenhoradosVALCTB0: TFloatField;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  CR_LF = #13#10;

var
  RptCAFBensPenhorados: TRptCAFBensPenhorados;

implementation

{$R *.DFM}

uses
  uCMfileUtils, uSistema;

procedure TRptCAFBensPenhorados.CrmRptCMBeforePrint(Sender: TObject);
var
  sSql : String;
  iMoedaOficial : Integer;
begin
   inherited;

   try
      Screen.Cursor := crSQLWait;
      //----------------------------------------------------------------------------------
      with sqlParamCaf do
      begin
         Prepare;
         ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
         Close;
      end;
      //------------------------------------------------------------------------
      sqlBensPenhorados.Prepare;

      sqlBensPenhorados.ParamByName('IDEMPRESA').AsFloat   := CrmRptCM.IdEmpresa;
      sqlBensPenhorados.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;    // Real
      sqlBensPenhorados.ParamByName('IDTAXADEP').AsInteger := 1;                // Brasil
      //------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsDateTime > 0 then
        sqlBensPenhorados.ParamByName('DATASLD').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime
      else
        sqlBensPenhorados.ParamByName('DATASLD').AsDateTime := Date;
      // end if
      if CmpRptCM.ParamValues[2].AsDateTime > 0 then
        sqlBensPenhorados.SQL.Add('   AND EPT.DATAREALOCOR >= TO_DATE(' + QuotedStr(DateToStr(CmpRptCM.ParamValues[2].AsDateTime)) + ',''DD/MM/YYYY'')');
      // end if
      if CmpRptCM.ParamValues[3].AsDateTime > 0 then
        sqlBensPenhorados.SQL.Add('   AND EPT.DATAREALOCOR <= TO_DATE(' + QuotedStr(DateToStr(CmpRptCM.ParamValues[3].AsDateTime)) + ',''DD/MM/YYYY'')');
      // end if
      if MSBem.RetornouValor then
        sqlBensPenhorados.SQL.Add('   AND B.IDBEM = ' + MSBem.ValoresChave[1]);
      // end if
      sqlBensPenhorados.SQL.Add(' ORDER BY B.PLACA ');
      //------------------------------------------------------------------------
      sqlBensPenhorados.Open;
      //------------------------------------------------------------------------
      if cdsBensPenhorados.IsEmpty then
         Raise Exception.Create('Não existem bens com os parâmetros fornecidos!');
      //------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsDateTime > 0 then
        lblTituloRelat.Caption := 'Relatório de Penhorados em ' + DateToStr(CmpRptCM.ParamValues[1].AsDateTime)
      else
        lblTituloRelat.Caption := 'Relatório de Penhorados';
      // end if
   except
      On E : Exception do
      begin
         CMDebugToFile('Relatório de Bens Penhorados : ' + E.Message);
      end;
   end;
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
end;

procedure TRptCAFBensPenhorados.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[1].AsDateTime := Date;
end;

end.
