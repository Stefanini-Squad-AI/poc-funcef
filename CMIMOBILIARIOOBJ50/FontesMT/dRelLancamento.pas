{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
-------------------------------------------------------------------------------
//Pendência   : SIG25051
//Responsável : Peterson Victor
//Data        : 19/08/2016
//Descrição   :	melhora de performance(.dfm)
--------------------------------------------------------------------------------
//Pendência   : SOL 164841 KINTANA 1421543
//Responsável : Eraldo Silva
//Data        : 21/09/2011
//Descrição   :	Ao consultar uma AP de R$ 5.490,00 e depois selecionar o botão
                de impressão, o documento fica com um total de R$ 17.190,00.
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 26763
Responsável  : Daniel Simões
Data         : 08/01/2008
Descrição    : Ajuste na query da função 'DefineSQLAlterador' que abre em tempo
               de execução e estava passando parâmetro NULL errado...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit dRelLancamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppPrnabl, ppClass,
  ppCtrls, ppBands, ppCache, ppDB, ppProd, ppReport, Db, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, DBClient, uCMClientDataSet, Provider,
  DBTables, Wwquery, ppStrtch, ppMemo, ADOdb, uSistema, ppVar, uCMTypes,
  ppSubRpt, Grids, DBGrids, ppModule, raCodMod, ppRegion, uModuloImobiliario,
  TXRB;

type
  TdtmRelLancamento = class(TFrmCmReport)
    qryLancamento: TwwQuery;
    pplLancamento: TppBDEPipeline;
    dsLancamento: TwwDataSource;
    rptLancamento: TppReport;
    qryAlteraLanc: TwwQuery;
    qryAlteraLancIDDOCUMENTO: TFloatField;
    qryAlteraLancCODALTERADOR: TFloatField;
    qryAlteraLancVLRALTERADOR: TFloatField;
    qryAlteraLancDESCRICAO: TStringField;
    pplAlteraLanc: TppBDEPipeline;
    dsAlteraLanc: TwwDataSource;
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
    ppLogoTipo: TppImage;
    qryLancamentoDESCCUSTORECIMO: TStringField;
    qryLancamentoFORMA_RECTOPAGTO: TStringField;
    qryLancamentoNF_FORCLI: TStringField;
    qryLancamentoNODOCUMENTO: TFloatField;
    qryLancamentoANOCOMPETENCIA: TFloatField;
    qryLancamentoMESCOMPETENCIA: TFloatField;
    qryLancamentoFLGINTEGRADO: TFloatField;
    qryLancamentoCOMPETENCIA: TStringField;
    qryLancamentoDATALANCAMENTO: TDateTimeField;
    qryLancamentoDATAVENCIMENTO: TDateTimeField;
    qryLancamentoVALOR_LANC: TFloatField;
    qryLancamentoFLGORIGEMLANC: TStringField;
    qryLancamentoIMOVEL_EXTENSO: TStringField;
    qryLancamentoIMOCODIGO: TStringField;
    qryLancamentoCONTRATO_EXTENSO: TStringField;
    qryLancamentoIDDOCUMENTO: TFloatField;
    qryLancamentoOBS: TMemoField;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
    procedure ppSummaryBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand2AfterPrint(Sender: TObject);
    procedure rptLancamentoBeforePrint(Sender: TObject);
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
  fTotLancamento : Extended;
  fVlrAlterador  : Extended;
  ImpAlt : Boolean;

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
  // Carrega o Logotipo - Marcio Motta - 05/08/2004
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogotipo.Picture := nil;

   LimpaParametros(qryLancamento);
   LimpaParametros(qryAlteraLanc);

   if CmpRptCM.ParamValues[0].AsInteger > 0 then iIdDoc := CmpRptCM.ParamValues[0].AsInteger;

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
    Result := 'SELECT LD.CODDOCUMENTO AS IDDOCUMENTO, '+#13+
              '       LD.CODALTERADOR, A.DESCRICAO,   '+#13+
              '       DECODE(A.RECPAG,''P'',          '+#13+
              '             DECODE(A.ACRESDECRES, ''C'', LD.VALOR, LD.VALOR*(-1)), ' +#13+
              '             DECODE(A.ACRESDECRES, ''D'', LD.VALOR, LD.VALOR*(-1)) ) AS VLRALTERADOR '+#13+
              '  FROM LANCTODOCUM LD, TIPOALTERADOR A, DOCUMENTO D'+#13+
              ' WHERE LD.CODALTERADOR = A.CODALTERADOR ' +#13+
              '   AND LD.CODDOCUMENTO = D.CODDOCUMENTO ' +#13+
              '   AND RTRIM(LD.OPERACAO) = ''4''       ' +#13+
              '   AND LD.ESTORNO IS NULL               ' +#13+ // Daniel - 26763
              '   AND LD.CODDOCUMENTO  = ' + IntToStr(iIdDocumento) +#13+
              ' ORDER BY A.DESCRICAO ';
  end else begin
    Result := 'SELECT ALI.IDDOCUMENTO,  ALI.CODALTERADOR, TA.DESCRICAO, ' +#13+
              '       DECODE(TA.RECPAG,''P'',          ' +#13+
              '             DECODE(TA.ACRESDECRES, ''C'', ALI.VLRALTERADOR, ALI.VLRALTERADOR*(-1)), '+#13+
              '             DECODE(TA.ACRESDECRES, ''D'', ALI.VLRALTERADOR, ALI.VLRALTERADOR*(-1)) ) AS VLRALTERADOR '+#13+
              '  FROM ALTERALANCIMOVEL ALI, TIPOALTERADOR TA '+#13+
              ' WHERE ALI.CODALTERADOR = TA.CODALTERADOR '+#13+
              '   AND ALI.IDDOCUMENTO  = ' + IntToStr(iIdDocumento);
  end;
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

   fTotLancamento := 0;
   fVlrAlterador  := 0;
   if iIdDocumento > 0 then
        iIdDoc := iIdDocumento
   else iIdDoc := -1;

   PrintReport(iIdReport, iIOrigemCM, iIdEmpresa, iIdUsuario, iIdModulo, sParams,
          sFileName, sDataBaseName, sNomeEmpresa, sNomeModulo, sMensagem,
          cAdoConnection, ConnectionType, DeviceType, bShowCancelDialog,
          bShowPrintDialog, bExibeMensagem, bExibeFormParams, lstHtmlFormParam,
          bGeraHtmlFormParam, iIdHotel);
end;


procedure TdtmRelLancamento.ppGroupFooterBand1AfterPrint(Sender: TObject);
begin
   inherited;
   fTotLancamento := 0;   //ERALDO SILVA SOL 164841 KINTANA 1421543
   fTotLancamento := fTotLancamento + totLancamento.Value;
end;

procedure TdtmRelLancamento.ppSummaryBand2BeforePrint(Sender: TObject);
begin
   inherited;
   //ERALDO SILVA SOL 164841 KINTANA 1421543 INICIO
   totPagar.Value := fTotLancamento + fVlrAlterador;
   //fVlrAlterador  := 0;
   //fTotLancamento := 0;
   ImpAlt := true;
   //ERALDO SILVA SOL 164841 KINTANA 1421543 FIM
end;

procedure TdtmRelLancamento.ppDetailBand2AfterPrint(Sender: TObject);
begin
  inherited;
  if not ImpAlt then    //ERALDO SILVA SOL 164841 KINTANA 1421543
  fVlrAlterador := fVlrAlterador + qryAlteraLanc.FieldByName('VLRALTERADOR').AsFloat;
end;

   // ERALDO SILVA SOL 164841 KINTANA 1421543 INICIO
procedure TdtmRelLancamento.rptLancamentoBeforePrint(Sender: TObject);
begin
  inherited;
  ImpAlt := false;
  fVlrAlterador  := 0;
  fTotLancamento := 0;
end;
   // ERALDO SILVA SOL 164841 KINTANA 1421543 FIM
end.
