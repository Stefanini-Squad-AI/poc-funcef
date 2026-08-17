// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RRubIntegrContab;

interface                              

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppCtrls, ppClass, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmRptManager,
  TXComp, CmParamReport, TXRB, USistema;

type
  TRptRubIntegrContab = class(TFrmCmReport)
    rpRubIntegrContab: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDBText11: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppLine2: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppRubIntegrContab: TppBDEPipeline;
    ppCadRubIntegrContabppField1: TppField;
    ppCadRubIntegrContabppField2: TppField;
    ppCadRubIntegrContabppField3: TppField;
    ppCadRubIntegrContabppField4: TppField;
    ppCadRubIntegrContabppField5: TppField;
    ppCadRubIntegrContabppField6: TppField;
    ppCadRubIntegrContabppField7: TppField;
    ppCadRubIntegrContabppField8: TppField;
    ppCadRubIntegrContabppField9: TppField;
    ppCadRubIntegrContabppField10: TppField;
    ppCadRubIntegrContabppField11: TppField;
    dsRubIntegrContab: TwwDataSource;
    sqlRubIntegrContab: TCMSqlParams;
    CdsRubIntegrContab: TCMClientDataSet;
    ppDBText12: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsRubIntegrContabAfterScroll(DataSet: TDataSet);
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
  end;

var
  RptRubIntegrContab: TRptRubIntegrContab;

implementation

uses uCtrlFuncoesRH, fAguarde;

{$R *.DFM}

procedure TRptRubIntegrContab.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlRubIntegrContab.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  ' +QuotedStr(CmpRptCM.ParamByName('NOMEEMPRESA').asString)+ ' AS EMPRESA,');

    if (CmpRptCM.ParamByName('SELTIPOFOLHA').asBoolean) then
      Add('  TO_CHAR(DECODE(CF.IDPROVENTO,NULL,''Não Parametrizada'','''')) AS RUB_PARAMETRIZADA,');

    Add('  RP.CODPROVDESC,');
    Add('  RP.DESCRPROVDESC,');
    Add('  DECODE(PD.FLGDESCONTO,0,''PROVENTO'',1,''DESCONTO'',''OUTROS'') AS TIPO,');
    Add('  CF.CONTACREDITO,');
    Add('  CF.CONTADEBITO,');
    Add('  CC.NOME AS CENTRO_CUSTO,');
    Add('  TD.DESCRICAO AS TIPO_DESEMB,');
    Add('  P.NOME AS FAVORECIDO,');
    Add('  CR.NOME AS CENT_RESPON,');
    Add('  UN.NOME AS UNID_NEGOC');
    Add('FROM');
    Add('  PESSOA P, RUBRICAXPESS RP, PROVDESC PD, CONTABFOLHA CF,');
    Add('  CENTCUST CC, TIPORECEBDESEMB TD, FORNSERV FS, CENTRESPON CR,');
    Add('  UNIDNEGOCIO UN');

    if (CmpRptCM.ParamByName('SELTIPOFOLHA').asBoolean) then
    begin
      Add('  , (SELECT DISTINCT');
      Add('       IDRUBRICA');
      Add('     FROM');
      Add('       ' +CmpRptCM.ParamByName('NOMETABELA').asString);
      Add('     WHERE');
      Add('       (MES       = ' +
        QuotedStr(IntToStr(CmpRptCM.ParamByName('ANOREF').asInteger) +'/'+
                  FU.PoeZero(CmpRptCM.ParamByName('MESREF').asInteger))+ ') AND');
      Add(FU.MontaLinhaSelSQL('       (IDMOTIVO',CmpRptCM.ParamByName('LISTATIPOFOLHA').asString,1));
      Add('       (IDPESSJUR = ' +IntToStr(CmpRptCM.ParamByName('IDEMPRESA').asInteger)+ ')) HIST');
    end;

    Add('WHERE');

    // Rubrica(s) selecionada(s)
    if (Trim(CmpRptCM.ParamByName('LISTAIDRUBRICA').asString) <> '') then
      Add(FU.MontaLinhaSelSQL('  (RP.CODPROVDESC',CmpRptCM.ParamByName('LISTAIDRUBRICA').asString,4));

    Add('  (RP.IDPESSOA        = ' +IntToStr(CmpRptCM.ParamByName('IDEMPRESA').asInteger)+ ') AND');
    Add('  ((TD.RECPAG        IS NULL) OR');
    Add('   (TD.RECPAG         = ''P'')) AND');
    Add('  (PD.FLGTPRUBRICA LIKE ''%F%'') AND');
    Add('  (PD.IDPROVENTO      = RP.IDRUBRICA) AND');

    if (CmpRptCM.ParamByName('SELTIPOFOLHA').asBoolean) then
    begin
      Add('  (RP.IDRUBRICA       = HIST.IDRUBRICA) AND');
      Add('  (RP.IDRUBRICA       = CF.IDPROVENTO(+)) AND');
    end
      else
      Add('  (RP.IDRUBRICA       = CF.IDPROVENTO) AND');

    Add('  (CF.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND');
    Add('  (CF.IDEMPRESA       = CC.IDEMPRESA(+)) AND');
    Add('  (CF.CODTIPRECDES    = TD.CODTIPRECDES(+)) AND');
    Add('  (CF.IDEMPRESA       = TD.IDPESSOA(+)) AND');
    Add('  (CF.IDFAVORECIDO    = FS.IDPESSOA(+)) AND');
    Add('  (CF.IDFAVORECIDO    = P.IDPESSOA(+)) AND');
    Add('  (CF.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND');
    Add('  (CF.IDEMPRESA       = CR.IDPESSOA(+)) AND');
    Add('  (CF.UNIDNEGOC       = UN.UNIDNEGOC(+)) AND');
    Add('  (CF.IDEMPRESA       = UN.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('ORDENACAO').asInteger) of
      0 : Add('  RP.CODPROVDESC, RP.DESCRPROVDESC');
      1 : Add('  RP.DESCRPROVDESC, RP.CODPROVDESC');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlRubIntegrContab.Open;
  frmAguarde.Max := CdsRubIntegrContab.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptRubIntegrContab.CdsRubIntegrContabAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptRubIntegrContab.ppSummaryBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
