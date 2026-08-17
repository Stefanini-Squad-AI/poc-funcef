unit RFichaFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports, Db,
  ppCtrls, ppBands, ppClass, ppPrnabl, ppProd, ppReport, DBTables, Wwdatsrc, ppComm, ppCache,
  ppDB, ppDBBDE, ppStrtch, ppMemo, ppRichTx, ppSubRpt, ppEndUsr, ppVar, ppRelatv, ppDBPipe,
  ppBarCod, ppRegion, FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlListTerceirosRH, Wwquery, ppModule, raCodMod;

type
  TRptFichaFunc = class(TFrmCmReport)
    rpFichaFunc: TppReport;
    rpFichaFuncHdrBnd: TppHeaderBand;
    rpFichaFuncDBTxt1: TppDBText;
    rpFichaFuncDtlBnd: TppDetailBand;
    rpFichaFuncFootBnd: TppFooterBand;
    rpFichaFuncSmryBnd: TppSummaryBand;
    rpFichaFuncLbl2: TppLabel;
    rpFichaFuncDBTxt2: TppDBText;
    rpFichaFuncDBTxt3: TppDBText;
    rpFichaFuncDBTxt4: TppDBText;
    rpFichaFuncDBTxt5: TppDBText;
    rpFichaFuncDBTxt6: TppDBText;
    ppFichaFunc: TppBDEPipeline;
    dsFichaFunc: TwwDataSource;
    rpFichaFuncLbl1: TppLabel;
    rpFichaFuncLine1: TppLine;
    rpFichaFuncLbl3: TppLabel;
    rpFichaFuncLbl4: TppLabel;
    rpFichaFuncLbl5: TppLabel;
    rpFichaFuncLbl6: TppLabel;
    rpFichaFuncLbl8: TppLabel;
    rpFichaFuncLbl9: TppLabel;
    rpFichaFuncLbl10: TppLabel;
    rpFichaFuncDBTxt7: TppDBText;
    rpFichaFuncDBTxt9: TppDBText;
    rpFichaFuncDBTxt10: TppDBText;
    rpFichaFuncDBTxt11: TppDBText;
    rpFichaFuncDBImage1: TppDBImage;
    ppIMG: TppBDEPipeline;
    dsIMG: TwwDataSource;
    rpFichaFuncLine2: TppLine;
    rpFichaFuncLabel4: TppLabel;
    rpFichaFuncLabel1: TppLabel;
    rpFichaFuncLabel2: TppLabel;
    rpFichaFuncLabel3: TppLabel;
    rpFichaFuncLabel5: TppLabel;
    rpFichaFuncLabel6: TppLabel;
    rpFichaFuncLabel7: TppLabel;
    rpFichaFuncLabel8: TppLabel;
    rpFichaFuncDBText1: TppDBText;
    rpFichaFuncDBText2: TppDBText;
    rpFichaFuncDBText3: TppDBText;
    rpFichaFuncDBText4: TppDBText;
    rpFichaFuncDBText5: TppDBText;
    rpFichaFuncDBText6: TppDBText;
    rpFichaFuncDBText7: TppDBText;
    rpFichaFuncDBText8: TppDBText;
    rpFichaFuncDBText9: TppDBText;
    rpFichaFuncDBText10: TppDBText;
    rpFichaFuncDBText11: TppDBText;
    rpFichaFuncDBText12: TppDBText;
    rpFichaFuncDBText13: TppDBText;
    rpFichaFuncDBText14: TppDBText;
    rpFichaFuncDBText15: TppDBText;
    rpFichaFuncDBText16: TppDBText;
    rpFichaFuncDBText17: TppDBText;
    ppFichaFunc1: TppBDEPipeline;
    dsFichaFunc1: TwwDataSource;
    rpFichaFuncSubReport1: TppSubReport;
    rpFichaFuncSubReport1DtlBnd: TppDetailBand;
    ppFichaFunc2: TppBDEPipeline;
    dsFichaFunc2: TwwDataSource;
    rpFichaFuncSubReport2: TppSubReport;
    rpFichaFuncCR2: TppChildReport;
    rpFichaFuncSubReport2DtlBnd: TppDetailBand;
    ppFichaFunc3: TppBDEPipeline;
    dsFichaFunc3: TwwDataSource;
    rpFichaFuncSubReport3: TppSubReport;
    rpFichaFuncCR3: TppChildReport;
    rpFichaFuncSubReport3DtlBnd: TppDetailBand;
    ppFichaFunc4: TppBDEPipeline;
    dsFichaFunc4: TwwDataSource;
    rpFichaFuncSubReport4: TppSubReport;
    rpFichaFuncCR4: TppChildReport;
    rpFichaFuncSubReport4DtlBnd: TppDetailBand;
    ppFichaFunc5: TppBDEPipeline;
    dsFichaFunc5: TwwDataSource;
    rpFichaFuncSubReport5: TppSubReport;
    rpFichaFuncCR5: TppChildReport;
    rpFichaFuncSubReport5DtlBnd: TppDetailBand;
    ppFichaFunc6: TppBDEPipeline;
    dsFichaFunc6: TwwDataSource;
    rpFichaFuncSubReport6: TppSubReport;
    rpFichaFuncCR6: TppChildReport;
    rpFichaFuncSubReport6DtlBnd: TppDetailBand;
    rpFichaFuncSubReport7: TppSubReport;
    rpFichaFuncCR7: TppChildReport;
    rpFichaFuncSubReport7DtlBnd: TppDetailBand;
    ppFichaFunc7: TppBDEPipeline;
    dsFichaFunc7: TwwDataSource;
    ppFichaFunc8: TppBDEPipeline;
    dsFichaFunc8: TwwDataSource;
    rpFichaFuncSubReport8: TppSubReport;
    rpFichaFuncCR8: TppChildReport;
    rpFichaFuncSubReport8Lbl1: TppLabel;
    rpFichaFuncSubReport8Lbl2: TppLabel;
    rpFichaFuncSubReport8Lbl3: TppLabel;
    rpFichaFuncSubReport8Lbl4: TppLabel;
    rpFichaFuncSubReport8DtlBnd: TppDetailBand;
    rpFichaFuncSubReport8DBTxt1: TppDBText;
    rpFichaFuncSubReport8DBTxt2: TppDBText;
    rpFichaFuncSubReport8DBTxt3: TppDBText;
    rpFichaFuncSubReport8Lbl5: TppLabel;
    rpFichaFuncCR1: TppChildReport;
    rpFichaFuncSubReport7Lbl1: TppLabel;
    rpFichaFuncSubReport7Lbl2: TppLabel;
    rpFichaFuncSubReport7Lbl3: TppLabel;
    rpFichaFuncSubReport7Lbl4: TppLabel;
    rpFichaFuncSubReport7Lbl5: TppLabel;
    rpFichaFuncSubReport7DBTxt1: TppDBText;
    rpFichaFuncSubReport7DBTxt2: TppDBText;
    rpFichaFuncSubReport7DBTxt3: TppDBText;
    rpFichaFuncSubReport7DBTxt4: TppDBText;
    rpFichaFuncSubReport7DBTxt5: TppDBText;
    rpFichaFuncSubReport6Lbl1: TppLabel;
    rpFichaFuncSubReport6Lbl2: TppLabel;
    rpFichaFuncSubReport6Lbl3: TppLabel;
    rpFichaFuncSubReport6Lbl4: TppLabel;
    rpFichaFuncSubReport6DBTxt1: TppDBText;
    rpFichaFuncSubReport6DBTxt2: TppDBText;
    rpFichaFuncSubReport6DBTxt3: TppDBText;
    rpFichaFuncSubReport6DBMemo1: TppDBMemo;
    rpFichaFuncSubReport6DBTxt4: TppDBText;
    rpFichaFuncSubReport5Lbl1: TppLabel;
    rpFichaFuncSubReport5Lbl2: TppLabel;
    rpFichaFuncSubReport5Lbl3: TppLabel;
    rpFichaFuncSubReport5Lbl4: TppLabel;
    rpFichaFuncSubReport5DBTxt1: TppDBText;
    rpFichaFuncSubReport5DBTxt2: TppDBText;
    rpFichaFuncSubReport5DBTxt3: TppDBText;
    rpFichaFuncSubReport5DBMemo1: TppDBMemo;
    rpFichaFuncSubReport5DBTxt4: TppDBText;
    rpFichaFuncSubReport4Lbl1: TppLabel;
    rpFichaFuncSubReport4Lbl2: TppLabel;
    rpFichaFuncSubReport4Lbl3: TppLabel;
    rpFichaFuncSubReportDBText1: TppDBText;
    rpFichaFuncSubReportDBText2: TppDBText;
    rpFichaFuncSubReportDBText3: TppDBText;
    rpFichaFuncSubReport3Lbl1: TppLabel;
    rpFichaFuncSubReport3Lbl2: TppLabel;
    rpFichaFuncSubReport3Lbl3: TppLabel;
    rpFichaFuncSubReport3Lbl4: TppLabel;
    rpFichaFuncSubReport3Lbl5: TppLabel;
    rpFichaFuncSubReport3Lbl6: TppLabel;
    rpFichaFuncSubReport3Lbl7: TppLabel;
    rpFichaFuncSubReport3DBTxt1: TppDBText;
    rpFichaFuncSubReport3DBTxt2: TppDBText;
    rpFichaFuncSubReport3DBTxt3: TppDBText;
    rpFichaFuncSubReport3DBTxt4: TppDBText;
    rpFichaFuncSubReport3LblAVALTEOR: TppLabel;
    rpFichaFuncSubReport3LblAVALPRAT: TppLabel;
    rpFichaFuncSubReport3LblRESULT: TppLabel;
    rpFichaFuncSubReport3DBMemo1: TppDBMemo;
    rpFichaFuncSubReport2Lbl1: TppLabel;
    rpFichaFuncSubReport2Lbl2: TppLabel;
    rpFichaFuncSubReport2Lbl3: TppLabel;
    rpFichaFuncSubReport2Lbl4: TppLabel;
    rpFichaFuncSubReport2Lbl5: TppLabel;
    rpFichaFuncSubReport2DBTxt1: TppDBText;
    rpFichaFuncSubReportDBTxt2: TppDBText;
    rpFichaFuncSubReport2DBTxt3: TppDBText;
    rpFichaFuncSubReport2DBTxt4: TppDBText;
    rpFichaFuncSubReport2DBTxt5: TppDBText;
    rpFichaFuncSubReport2DBTxt6: TppDBText;
    rpFichaFuncSubReport1Lbl1: TppLabel;
    rpFichaFuncSubReport1Lbl2: TppLabel;
    rpFichaFuncSubReport1Lbl3: TppLabel;
    rpFichaFuncSubReport1Lbl4: TppLabel;
    rpFichaFuncSubReport1Lbl5: TppLabel;
    rpFichaFuncSubReport1DBTxt1: TppDBText;
    rpFichaFuncSubReport1DBTxt2: TppDBText;
    rpFichaFuncSubReport1DBTxt3: TppDBText;
    rpFichaFuncSubReport1DBTxt4: TppDBText;
    rpFichaFuncSubReport1DBTxt5: TppDBText;
    rpFichaFuncGrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncGrpFootBnd: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLine2: TppLine;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel11: TppLabel;
    rpFichaFuncDbCNPJ: TppDBText;
    ppLabel12: TppLabel;
    ppDBText18: TppDBText;
    ppRegiaoEstrangeiro: TppRegion;
    ppLabel13: TppLabel;
    ppDBText17: TppDBText;
    ppDBText20: TppDBText;
    ppLabel15: TppLabel;
    ppDBText21: TppDBText;
    ppLabel16: TppLabel;
    ppDBText22: TppDBText;
    ppLabel17: TppLabel;
    ppDBText23: TppDBText;
    ppLabel19: TppLabel;
    ppDBText25: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText26: TppDBText;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBText28: TppDBText;
    ppLabel25: TppLabel;
    ppDBText29: TppDBText;
    ppLine3: TppLine;
    ppRegiaoDemitido: TppRegion;
    ppLabel26: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLabel27: TppLabel;
    ppLine4: TppLine;
    ppLabel28: TppLabel;
    ppLine5: TppLine;
    ppLabel29: TppLabel;
    ppDBText32: TppDBText;
    ppFichaFunc9: TppBDEPipeline;
    dsFichaFunc9: TwwDataSource;
    ppFichaFunc10: TppBDEPipeline;
    dsFichaFunc10: TwwDataSource;
    ppFichaFunc11: TppBDEPipeline;
    dsFichaFunc11: TwwDataSource;
    ppFichaFunc12: TppBDEPipeline;
    dsFichaFunc12: TwwDataSource;
    rpFichaFuncSubReport9: TppSubReport;
    rpFichaFuncCR9: TppChildReport;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    rpFichaFuncSubReport9DtlBnd: TppDetailBand;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    rpFichaFuncSubReport10: TppSubReport;
    rpFichaFuncCR10: TppChildReport;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    rpFichaFuncSubReport10DtlBnd: TppDetailBand;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    rpFichaFuncSubReport11: TppSubReport;
    rpFichaFuncCR11: TppChildReport;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    rpFichaFuncSubReport11DtlBnd: TppDetailBand;
    ppDBText41: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    rpFichaFuncSubReport12: TppSubReport;
    rpFichaFuncCR12: TppChildReport;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    rpFichaFuncSubReport12DtlBnd: TppDetailBand;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppLabel50: TppLabel;
    ppDBText51: TppDBText;
    ppRegiaoDescCargo: TppRegion;
    ppLabel41: TppLabel;
    rpFichaFuncDbDescCargo: TppDBMemo;
    CdsIMG: TCMClientDataSet;
    qryFichaFunc: TwwQuery;
    qryFichaFunc1: TwwQuery;
    qryFichaFunc2: TwwQuery;
    qryFichaFunc3: TwwQuery;
    qryFichaFunc4: TwwQuery;
    qryFichaFunc5: TwwQuery;
    qryFichaFunc6: TwwQuery;
    qryFichaFunc7: TwwQuery;
    qryFichaFunc9: TwwQuery;
    qryFichaFunc10: TwwQuery;
    qryFichaFunc11: TwwQuery;
    qryFichaFunc12: TwwQuery;
    qryFichaFunc8: TwwQuery;
    rpFichaFuncGrp1: TppGroup;
    rpFichaFuncSubReport1GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport1GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncGrp2: TppGroup;
    rpFichaFuncSubReport2GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport2GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncGrp3: TppGroup;
    rpFichaFuncSubReport3GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport3GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncGrp4: TppGroup;
    rpFichaFuncSubReport4GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport4GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncGrp5: TppGroup;
    rpFichaFuncSubReport5GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport5GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncGrp6: TppGroup;
    rpFichaFuncSubReport6GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport6GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncGrp7: TppGroup;
    rpFichaFuncSubReport7GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport7FootBnd: TppGroupFooterBand;
    rpFichaFuncGrp8: TppGroup;
    rpFichaFuncSubReport8GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport8GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncGrp9: TppGroup;
    rpFichaFuncSubReport9GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport9GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncGrp10: TppGroup;
    rpFichaFuncSubReport10GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport10GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncGrp11: TppGroup;
    rpFichaFuncSubReport11GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport11GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncGrp12: TppGroup;
    rpFichaFuncSubReport12GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport12GrpFootBnd: TppGroupFooterBand;
    ppFichaFunc13: TppBDEPipeline;
    dsFichaFunc13: TwwDataSource;
    qryFichaFunc13: TwwQuery;
    rpFichaFuncSubReport13: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel14: TppLabel;
    ppDBText11: TppDBText;
    ppDBText19: TppDBText;
    ppLabel18: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel44: TppLabel;
    ppDBText24: TppDBText;
    ppLabel48: TppLabel;
    ppDBText27: TppDBText;
    ppLabel49: TppLabel;
    ppDBText42: TppDBText;
    ppLabel51: TppLabel;
    ppDBText45: TppDBText;
    ppLabel52: TppLabel;
    ppDBText52: TppDBText;
    ppLabel53: TppLabel;
    ppDBText53: TppDBText;
    ppLabel54: TppLabel;
    ppDBText54: TppDBText;
    ppLabel55: TppLabel;
    ppDBText55: TppDBText;
    ppLabel56: TppLabel;
    ppDBText56: TppDBText;
    ppLine6: TppLine;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    rpFichaFuncLblNivel: TppLabel;
    rpFichaFuncDbNivel: TppDBText;
    procedure rpFichaFuncSmryBndAfterPrint(Sender: TObject);
    procedure rpFichaFuncGrpHdrBndBeforePrint(Sender: TObject);
    procedure rpFichaFuncSubReport8DtlBndBeforePrint(Sender: TObject);
    procedure rpFichaFuncSubReport1DBTxt2Print(Sender: TObject);
    procedure rpFichaFuncSubReport3DtlBndBeforePrint(Sender: TObject);
    procedure rpFichaFuncSubReport5DtlBndBeforePrint(Sender: TObject);
    procedure rpFichaFuncSubReport6DtlBndBeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qryFichaFuncAfterScroll(DataSet: TDataSet);
    procedure rpFichaFuncGrpFootBndBeforePrint(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    procedure SelFoto(IdImagem: double);
    procedure SelDados(IdPessoa: double);
  end;

var
  RptFichaFunc: TRptFichaFunc;

implementation

uses uSistema, uCtrlPadroes, fAguarde, dCds, uFuncoesUteisRH, uCtrlUsoGeralRH,
     uModulo;

{$R *.DFM}

procedure TRptFichaFunc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);
end;

procedure TRptFichaFunc.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TRptFichaFunc.CrmRptCMBeforePrint(Sender: TObject);
var
  c: byte;
  SubReport: TppSubReport;
begin
  inherited;
  rpFichaFuncFootBnd.Visible := (CmpRptCM.ParamByName('IncluirRodape').asBoolean);

  rpFichaFuncDbNivel.Visible := (Modulo.IdContraCheque = FUNCEF);
  rpFichaFuncLblNivel.Visible := (Modulo.IdContraCheque = FUNCEF);

  if (CmpRptCM.ParamByName('ImprimirAvalHay').asBoolean) then
  begin
    qryFichaFunc13.SQL[47] := '   WHERE  (H.MES       = ' + QuotedStr(CmpRptCM.ParamByName('MesRef').asString) + ') AND';
    qryFichaFunc13.SQL[48] := '       (H.CODPROVDESC IN (' + CmpRptCM.ParamByName('ListaIdRubrica').asString + ')) AND';
  end;

  // Máscara do CNPJ
  with (dmCds.sql) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE (TDO.SIGLADOCUMENTO = ''CNPJ:'') AND');
    SQL.Add('      (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO)');
    Open;
  end;

  if (Trim(dmCds.Cds.FieldByName('MASCARA').asString) <> '') then
    rpFichaFuncDbCNPJ.DisplayFormat := dmCds.Cds.FieldByName('MASCARA').asString+';0;_';

  with (qryFichaFunc.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados da Empresa
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    // Dados do Empregado
    Add('  RTRIM(PF.NOME) AS NOME,');
    Add('  PF.IDIMAGEM, PF.IDPESSOA, F.NIVELINDIV1,');
    Add('  PJ.NUMDOCUMENTO AS CNPJ, TO_CHAR(FIL.IDCATCNAE)||''-''||TO_CHAR(FIL.IDITEMCNAE) AS CNAE,');
    Add('  F.MATRICULA, PAIS.NOMENACIONALIDADE AS NACIONALIDADE,');
    Add('  TRIM(CIDADES.NOME) || ''-'' || PEFIS.CODESTADO AS NATURALIDADE,');
    Add('  PEFIS.DATANASC, PEFIS.NOMEPAI, PEFIS.NOMEMAE,');
    Add('  RTRIM(ST.DESCRICAO) AS SITUACAO, ST.TIPOSIT, F.DATAOPCAOFGTS,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
    Add('  TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'') AS DATADEMISSAO,');
    Add('  MO.DESCRICAO AS MOTIVODESLIG,');
    Add('  EST.ANOCHEGADA, EST.IDPESSOA AS IDESTRANGEIRO,');
    Add('  DECODE(NVL(EST.FLGNATURALIZADO,0),0,''Não'',''Sim'') AS NATURALIZADO,');
    Add('  DECODE(NVL(EST.FLGCASADOBRASILEIRO,0),0,''Não'',''Sim'') AS CASADOBRASILEIRO,');
    Add('  DECODE(NVL(EST.FLGFILHOSBRASILEIROS,0),0,''Não'',''Sim'') AS FILHOSBRASILEIROS,');
    Add('  EST.DECRETONATURALIZACAO, EST.MOD19NUMERO, EST.MOD19REGISTRO,');
    Add('  DECODE(PEFIS.SEXO,''F'',''Feminino'',''M'',''Masculino'','''') AS SEXO,');
    Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
    Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''O'',''Outro'') AS ESTCIVIL,');
    Add('  DECODE(F.TIPOCONTRATO, ''E'',''Efetivo'', ''S'',''Efetivo Especial'',');
    Add('    ''T'',''Temporário'', ''G'',''Estagiário'', ''3'',''Terceiro'',');
    Add('    ''P'',''Proprietário'', ''A'',''Autônomo'', ''Indefinido'') ||');
    Add('    DECODE(F.DATAFIMCONTRATO,NULL,'''','' (Até '' ||');
    Add('    TO_CHAR(F.DATAFIMCONTRATO,''DD/MM/YYYY'')) AS VINCULO,');
    Add('  EJ.LOGRADOURO AS LOGRAJ, EJ.BAIRRO AS BAIRROJ, EJ.CEP AS CEPJ, EJ.NUMERO AS NUMEROJ,');
    Add('  CJ.NOME AS CIDADEJ,EJ.CODESTADO AS UFJ, EJ.COMPLEMENTO AS COMPLEJ,');
    Add('  E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO, CI.NOME AS CIDADE,');
    Add('  E.CODESTADO, E.COMPLEMENTO, PJ.NOME AS ESTAB, C.TITULO AS CARGO,');

    if (CmpRptCM.ParamByName('ImprimirCargoAlternativo').asBoolean) then
      Add('  C.DESCRICAO AS DESCRCARGO,')
    else
      Add('  ('' '') AS DESCRCARGO,');

    Add('  PR.DESCRICAO AS PROFISSAO, CC.NOME AS C_CUSTO, NVL(F.SALARIOATUAL,0) AS SALARIOATUAL,');
    Add('  DECODE(F.TIPOPAGAMENTO, NULL,'''',');
    Add('    ''('' || DECODE(F.TIPOPAGAMENTO, ''H'',''Horista'', ''D'',''Diarista'',');
    Add('    ''M'', ''Mensalista'', ''T'',''Tarefa'') || '')'') AS TIPOPAGAMENTO,');
    Add('  GR.DESCRICAO AS GRINSTR,');
    Add('  DECODE(RTRIM(TELEFONE.DDI),NULL,'''',''(''||RTRIM(TELEFONE.DDI)||'')'') AS DDI,');
    Add('  DECODE(RTRIM(TELEFONE.DDD),NULL,'''',''(''||RTRIM(TELEFONE.DDD)||'')'') AS DDD,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE, HT.JORNADAMENSAL, HT.NOMEHORARIO ');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, ENDPESS EJ, FUNCIONARIO F,');
    Add('  SITFUNC ST, FILIALPESSOA FIL, CIDADES CI, CIDADES, CIDADES CJ, CARGO C,');
    Add('  PROFISS PR, CENTCUST CC, GRINSTR GR, PAIS, ESTRANGEIRO EST, HORATRAB HT, MOTIVO MO,');
    // -------------------------------------------------------------------- //
    // Telefone
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    // Funcionário selecionado
    if (CmpRptCM.ParamByName('ListaIdPessoa').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdPessoa').asString) > 0) then
        Add('  (F.IDPESSOA          IN (' +CmpRptCM.ParamByName('ListaIdPessoa').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA           = ' +CmpRptCM.ParamByName('ListaIdPessoa').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO    IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO     = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;
    end;

    Add('  (PF.IDPESSOA          = PEFIS.IDPESSOA) AND');
    Add('  (PF.IDPESSOA          = F.IDPESSOA) AND');
    Add('  (ST.IDSITFUNC         = F.IDSITFUNC) AND');
    Add('  (F.IDESTAB            = PJ.IDPESSOA) AND');
    Add('  (F.IDESTAB            = FIL.IDFILIALPESSOA) AND');
    Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO(+)) AND');
    Add('  (PF.IDPESSOA          = EST.IDPESSOA(+)) AND');
    Add('  (PEFIS.IDPAIS         = PAIS.IDPAIS(+)) AND');
    Add('  (PEFIS.IDCIDADES      = CIDADES.IDCIDADES(+)) AND');

    if (CmpRptCM.ParamByName('ImprimirCargoAlternativo').asBoolean) then
      Add(' (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO(+)) AND')
    else
      Add('  (F.IDCARGO           = C.IDCARGO(+)) AND');

    Add('  (F.IDHORARIO         = HT.IDHORARIO(+)) AND');
    Add('  (PEFIS.IDPROFISS     = PR.IDPROFISS(+)) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO(+)) AND');
    Add('  (F.IDEMPRESA         = CC.IDEMPRESA(+)) AND');
    Add('  (PEFIS.IDGRINSTR     = GR.IDGRINSTR(+)) AND');
    Add('  (PJ.IDPESSOA         = EJ.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL   = EJ.IDENDERECO(+)) AND');
    Add('  (EJ.IDCIDADES        = CJ.IDCIDADES(+)) AND');
    Add('  (PF.IDPESSOA         = E.IDPESSOA(+)) AND');
    Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
    Add('  (E.IDCIDADES         = CI.IDCIDADES(+)) AND');
    Add('  (PF.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+))');
    Add('ORDER BY NOME');
    SaveToFile('c:\qry.txt');
  end;

  for c:=1 to 13 do
  begin
    SubReport := TppSubReport(Self.FindComponent('rpFichaFuncSubReport'+IntToStr(c)));
    SubReport.Visible := CmpRptCM.ParamValues[c].asBoolean;
    if (SubReport.Visible) then
      SubReport.DataPipeline := TppBDEPipeLine(Self.FindComponent('ppFichaFunc'+IntToStr(c)))
    else
      SubReport.DataPipeline := nil;
  end;
  ppRegiaoDescCargo.Visible := CmpRptCM.ParamByName('ImprimirDescCargo').asBoolean;

  qryFichaFunc.Open;
  frmAguarde.Max := qryFichaFunc.RecordCount;
  frmAguarde.Min := 0;
  SelFoto(-1);
  SelDados(-1);
end;

procedure TRptFichaFunc.qryFichaFuncAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFichaFunc.rpFichaFuncGrpHdrBndBeforePrint(Sender: TObject);
begin
  if not(qryFichaFunc.IsEmpty) then
  begin
    SelFoto(qryFichaFunc.FieldByName('IDIMAGEM').asFloat);

    ppRegiaoEstrangeiro.Visible := (qryFichaFunc.FieldByName('IDESTRANGEIRO').asString <> '');
    ppRegiaoDemitido.Visible := (qryFichaFunc.FieldByName('TIPOSIT').asString = 'D');
    ppRegiaoDescCargo.Visible := (qryFichaFunc.FieldByName('DESCRCARGO').Value <> '');

    if (ppRegiaoDemitido.Visible) then
      ppRegiaoDescCargo.Top := 206
    else
      ppRegiaoDescCargo.Top := 164;
  end;
end;

procedure TRptFichaFunc.rpFichaFuncGrpFootBndBeforePrint(Sender: TObject);
begin
  //SelDados(qryFichaFunc.FieldByName('IDPESSOA').asFloat);
end;

procedure TRptFichaFunc.rpFichaFuncSubReport1DBTxt2Print(Sender: TObject);
begin
  if (Trim(qryFichaFunc1.FieldByName('MASCARA').asString) <> '') then
    rpFichaFuncSubReport1DBTxt2.DisplayFormat := qryFichaFunc1.FieldByName('MASCARA').asString + ';0'
  else
    rpFichaFuncSubReport1DBTxt2.DisplayFormat := '';
end;

procedure TRptFichaFunc.rpFichaFuncSubReport3DtlBndBeforePrint(Sender: TObject);
begin
  rpFichaFuncSubReport3LblAVALTEOR.Caption := 'N/A';
  rpFichaFuncSubReport3LblAVALPRAT.Caption := 'N/A';
  rpFichaFuncSubReport3LblRESULT.Caption := 'N/A';

  if (qryFichaFunc3.FieldByName('FLGAVALTEOR').asInteger = 1) then
    rpFichaFuncSubReport3LblAVALTEOR.Caption := qryFichaFunc3.FieldByName('AVALTEOR').asString;

  if (qryFichaFunc3.FieldByName('FLGAVALPRAT').asInteger = 1) then
    rpFichaFuncSubReport3LblAVALPRAT.Caption := qryFichaFunc3.FieldByName('AVALPRAT').asString;

  if ((qryFichaFunc3.FieldByName('TEMAVAL').asInteger = 1) and
      (qryFichaFunc3.FieldByName('FLGAVALTEOR').asInteger = 1) or
      (qryFichaFunc3.FieldByName('TEMAVPR').asInteger = 1) and
      (qryFichaFunc3.FieldByName('FLGAVALPRAT').asInteger = 1)) then
  begin
    if ((qryFichaFunc3.FieldByName('TEMAVAL').asInteger = 1) and
        (qryFichaFunc3.FieldByName('FLGAVALTEOR').asInteger = 1) and
        (qryFichaFunc3.FieldByName('AVALIACAO').asFloat >
         qryFichaFunc3.FieldByName('AVALTEOR').asFloat)) or
       ((qryFichaFunc3.FieldByName('TEMAVPR').asInteger = 1) and
        (qryFichaFunc3.FieldByName('FLGAVALPRAT').asInteger = 1) and
        (qryFichaFunc3.FieldByName('AVALPRAT').asFloat >
         qryFichaFunc3.FieldByName('AVALPRAT').asFloat)) then
      rpFichaFuncSubReport3LblRESULT.Caption := 'Reprovad'
    else
      rpFichaFuncSubReport3LblRESULT.Caption := 'Aprovad';

    if (qryFichaFunc.FieldByName('SEXO').asString = 'Masculino') then
      rpFichaFuncSubReport3LblRESULT.Caption := rpFichaFuncSubReport3LblRESULT.Caption + 'o'
    else
      rpFichaFuncSubReport3LblRESULT.Caption := rpFichaFuncSubReport3LblRESULT.Caption + 'a';
  end;

  if (CmpRptCM.ParamByName('ImprimirOBS').asBoolean) and
     (qryFichaFunc3.FieldByName('OBSERVACAO').Value <> '') then
    rpFichaFuncSubReport3DBMemo1.Visible := true
  else
    rpFichaFuncSubReport3DBMemo1.Visible := false;
end;

procedure TRptFichaFunc.rpFichaFuncSubReport5DtlBndBeforePrint(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('ImprimirOBS').asBoolean) and
     (qryFichaFunc5.FieldByName('COMENT').Value <> '') then
    rpFichaFuncSubReport5DBMemo1.Visible := true
  else
    rpFichaFuncSubReport5DBMemo1.Visible := false;
end;

procedure TRptFichaFunc.rpFichaFuncSubReport6DtlBndBeforePrint(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('ImprimirOBS').asBoolean) and
     (qryFichaFunc6.FieldByName('OBSERVACAO').Value <> '') then
    rpFichaFuncSubReport6DBMemo1.Visible := true
  else
    rpFichaFuncSubReport6DBMemo1.Visible := false;
end;

procedure TRptFichaFunc.rpFichaFuncSubReport8DtlBndBeforePrint(Sender: TObject);
var
  dbValCalc1: double;
  sRegRegra, sRegPessoa: string;
begin
  if (qryFichaFunc8.FieldByName('VALORRUBRICA').IsNull) then
    dbValCalc1 := 0
  else
    dbValCalc1 := qryFichaFunc8.FieldByName('VALORRUBRICA').asFloat;

  if not(qryFichaFunc8.FieldByName('IdRegraCalculo').IsNull) then
  begin
    sRegRegra := qryFichaFunc8.FieldByName('IdRegraCalculo').asString;
    sRegPessoa := qryFichaFunc.FieldByName('IDPESSOA').asString;
//    CalcBenef(sRegRegra, sRegPessoa, dbValCalc1);
  end;

  if (dbValCalc1 > 0) then
    rpFichaFuncSubReport8Lbl5.Caption := FloatToStrF(dbValCalc1, ffFixed, 10, 2)
  else
    rpFichaFuncSubReport8Lbl5.Caption := '';
end;

procedure TRptFichaFunc.rpFichaFuncSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptFichaFunc.SelFoto(IdImagem: double);
begin
  CdsIMG.Data := CtrlListTerceirosRH.ListImagem(IdImagem);
end;

procedure TRptFichaFunc.SelDados(IdPessoa: double);
{var
  c: byte;
  SqlParams: TCMSqlParams;}
begin
  {for c:=1 to 12 do
  begin
    if (CmpRptCM.ParamValues[c].asBoolean) then
    begin
      if (c = 1) then
        qryFichaFunc1.Data := CtrlListTerceirosRH.ListDocPessoa(IdPessoa)
      else
      begin
        SqlParams := TCMSqlParams(Self.FindComponent('sqlFichaFunc'+IntToStr(c)));
        SqlParams.Prepare;
        SqlParams.ParamByName('IDPESSOA').asFloat := IdPessoa;
        SqlParams.Open;
      end;
    end;
  end;}
end;

end.
