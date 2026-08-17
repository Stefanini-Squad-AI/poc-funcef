unit dRelLancamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppPrnabl, ppClass,
  ppCtrls, ppBands, ppCache, ppDB, ppProd, ppReport, Db, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, DBClient, uCMClientDataSet, Provider,
  DBTables, Wwquery, ppStrtch, ppMemo, ADOdb, uSistema, ppVar, uCMTypes,
  ppSubRpt, Grids, DBGrids, ppModule, raCodMod, ppRegion;

type
  TdtmRelLancamento = class(TFrmCmReport)
    qryLancamento: TwwQuery;
    pplLancamento: TppBDEPipeline;
    dsLancamento: TwwDataSource;
    rptLancamento: TppReport;
    qryLancamentoDESCCUSTORECIMO: TStringField;
    qryLancamentoNF_FORCLI: TStringField;
    qryLancamentoNODOCUMENTO: TFloatField;
    qryLancamentoANOCOMPETENCIA: TFloatField;
    qryLancamentoMESCOMPETENCIA: TFloatField;
    qryLancamentoDATALANCAMENTO: TDateTimeField;
    qryLancamentoDATAVENCIMENTO: TDateTimeField;
    qryLancamentoVALOR_LANC: TFloatField;
    qryLancamentoFLGORIGEMLANC: TStringField;
    qryLancamentoIMOVEL_EXTENSO: TStringField;
    qryLancamentoIMOCODIGO: TStringField;
    qryLancamentoCONTRATO_EXTENSO: TStringField;
    qryLancamentoOBS: TMemoField;
    qryLancamentoCOMPETENCIA: TStringField;
    qryLancamentoIDDOCUMENTO: TFloatField;
    qryLancamentoFORMA_RECTOPAGTO: TStringField;
    qryAlteraLanc: TwwQuery;
    qryAlteraLancIDDOCUMENTO: TFloatField;
    qryAlteraLancCODALTERADOR: TFloatField;
    qryAlteraLancVLRALTERADOR: TFloatField;
    qryAlteraLancDESCRICAO: TStringField;
    pplAlteraLanc: TppBDEPipeline;
    dsAlteraLanc: TwwDataSource;
    qryLancamentoFLGINTEGRADO: TFloatField;
    qryAlteraLancCODTIPIMOVEL: TStringField;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppLine41: TppLine;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel14: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText12: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppRegion1: TppRegion;
    ppLabel15: TppLabel;
    totPagar: TppVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel12: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    totLancamento: TppDBCalc;
    ppLabel13: TppLabel;
    ppDBMemo1: TppDBMemo;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    function DefineSQLAlterador(const bFlgIntegrado:Boolean; const iIdDocumento:Integer): String;
  public
    { Public declarations }

    Class function PrintRelLancamento(const iIdDocumento:Integer; Const iIdReport, iIOrigemCM :Integer; Const iIdEmpresa :Double; Const iIdUsuario, iIdModulo :Integer;
          Const sParams, sFileName, sDataBaseName :String; sNomeEmpresa, sNomeModulo :String; Var sMensagem :String; cAdoConnection :TADOConnection = nil;
          Const ConnectionType :TDbConnectionType = cntBDE; Const DeviceType :TReportDeviceType = rdtScreen; bShowCancelDialog :Boolean = True; bShowPrintDialog :Boolean = True;
          bExibeMensagem :Boolean = True; bExibeFormParams :Boolean = True; lstHtmlFormParam: TStrings = nil; bGeraHtmlFormParam: Boolean = false; iIdHotel: Integer = 0) :Boolean;

  end;

var
  dtmRelLancamento: TdtmRelLancamento;
  iIdDoc: integer;


implementation

uses uDataBase, uFuncoesImob;

{$R *.DFM}

procedure TdtmRelLancamento.CrmRptCMChangeDataBaseName(
  Sender: TObject; sDataBaseName: String);
begin
   inherited;
   ChangeDataBaseName([qryLancamento, qryAlteraLanc], sDataBaseName);
end;


procedure TdtmRelLancamento.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   LimpaParametros(qryLancamento);
   LimpaParametros(qryAlteraLanc);
   if iIdDoc <> -1 then begin
      qryLancamento.ParamByName('PIDMODULO').AsInteger    := Sistema.idModulo;
      qryLancamento.ParamByName('PIDDOCUMENTO').AsInteger := iIdDoc;
      qryLancamento.Open;

      qryAlteraLanc.Sql.Clear;
      qryAlteraLanc.Sql.Text := DefineSQLAlterador(qryLancamentoFLGINTEGRADO.IsNull, iIdDoc);
      qryAlteraLanc.Open;
   end;
end;


function TdtmRelLancamento.DefineSQLAlterador(const bFlgIntegrado:Boolean; const iIdDocumento:Integer): String;
begin
  if bFlgIntegrado then begin
    Result := 'SELECT DISTINCT LD.CODDOCUMENTO AS IDDOCUMENTO, '+#13+
              '       LD.CODALTERADOR, A.DESCRICAO,   '+#13+
              '       ALI.CODTIPIMOVEL,               '+#13+
              '       DECODE(A.RECPAG,''P'',          '+#13+
              '             DECODE(A.ACRESDECRES, ''C'', LD.VALOR, LD.VALOR*(-1)), ' +#13+
              '             DECODE(A.ACRESDECRES, ''D'', LD.VALOR, LD.VALOR*(-1)) ) AS VLRALTERADOR '+#13+
              '  FROM LANCTODOCUM LD, TIPOALTERADOR A, DOCUMENTO D, ALTERALANCIMOVEL ALI '+#13+
              ' WHERE LD.CODALTERADOR = A.CODALTERADOR ' +#13+
              '   AND LD.CODDOCUMENTO = ALI.IDDOCUMENTO (+)' +#13+
              '   AND LD.CODALTERADOR = ALI.CODALTERADOR (+)' +#13+
              '   AND LD.CODDOCUMENTO = D.CODDOCUMENTO ' +#13+
              '   AND RTRIM(LD.OPERACAO) = ''4''       ' +#13+
              '   AND LD.CODDOCUMENTO  = ' + IntToStr(iIdDocumento) +#13+
              ' ORDER BY A.DESCRICAO ';
  end else begin
    Result := 'SELECT ALI.IDDOCUMENTO,  ALI.CODALTERADOR, ALI.CODTIPOIMOVEL, TA.DESCRICAO, ' +#13+
              '       DECODE(TA.RECPAG,''P'',          ' +#13+
              '             DECODE(TA.ACRESDECRES, ''C'', ALI.VLRALTERADOR, ALI.VLRALTERADOR*(-1)), '+#13+
              '             DECODE(TA.ACRESDECRES, ''D'', ALI.VLRALTERADOR, ALI.VLRALTERADOR*(-1)) ) AS VLRALTERADOR '+#13+
              '  FROM ALTERALANCIMOVEL ALI, TIPOALTERADOR TA '+#13+
              ' WHERE ALI.CODALTERADOR = TA.CODALTERADOR '+#13+
              '   AND ALI.IDDOCUMENTO  = ' + IntToStr(iIdDocumento);
  end;

{
  if bFlgIntegrado then begin
    Result := 'SELECT LD.CODDOCUMENTO AS IDDOCUMENTO, '+#13+
              '       LD.CODALTERADOR, A.DESCRICAO,   '+#13+
              '       DECODE(A.ACRESDECRES, ''C'', LD.VALOR, LD.VALOR*(-1)) AS VLRALTERADOR '+#13+
              '  FROM LANCTODOCUM LD, TIPOALTERADOR A, DOCUMENTO D '+#13+
              ' WHERE LD.CODALTERADOR = A.CODALTERADOR ' +#13+
              '   AND LD.CODDOCUMENTO = D.CODDOCUMENTO ' +#13+
              '   AND RTRIM(LD.OPERACAO) = ''4''       ' +#13+
              '   AND LD.CODDOCUMENTO  = ' + IntToStr(iIdDocumento) +#13+
              ' ORDER BY A.DESCRICAO ';
  end else begin
    Result := 'SELECT ALI.IDDOCUMENTO,  ALI.CODALTERADOR, TA.DESCRICAO, ' +#13+
              '       DECODE(TA.ACRESDECRES, ''C'', ALI.VLRALTERADOR, ALI.VLRALTERADOR*(-1)) AS VLRALTERADOR '+#13+
              '  FROM ALTERALANCIMOVEL ALI, TIPOALTERADOR TA '+#13+
              ' WHERE ALI.CODALTERADOR = TA.CODALTERADOR '+#13+
              '   AND ALI.IDDOCUMENTO  = ' + IntToStr(iIdDocumento);
  end;
}
end;


class function TdtmRelLancamento.PrintRelLancamento(const iIdDocumento,
                  iIdReport, iIOrigemCM: Integer; const iIdEmpresa: Double;
                  const iIdUsuario, iIdModulo: Integer; const sParams, sFileName,
                  sDataBaseName: String; sNomeEmpresa, sNomeModulo: String;
                  var sMensagem: String; cAdoConnection: TADOConnection;
                  const ConnectionType: TDbConnectionType;
                  const DeviceType: TReportDeviceType; bShowCancelDialog, bShowPrintDialog,
                  bExibeMensagem, bExibeFormParams: Boolean; lstHtmlFormParam: TStrings;
                  bGeraHtmlFormParam: Boolean; iIdHotel: Integer): Boolean;
begin

   if iIdDocumento > 0 then
        iIdDoc := iIdDocumento
   else iIdDoc := -1;

   PrintReport(iIdReport, iIOrigemCM, iIdEmpresa, iIdUsuario, iIdModulo, sParams,
          sFileName, sDataBaseName, sNomeEmpresa, sNomeModulo, sMensagem,
          cAdoConnection, ConnectionType, DeviceType, bShowCancelDialog,
          bShowPrintDialog, bExibeMensagem, bExibeFormParams, lstHtmlFormParam,
          bGeraHtmlFormParam, iIdHotel);
end;


end.
