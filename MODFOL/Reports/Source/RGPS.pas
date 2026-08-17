// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RGPS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppClass, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCtrlGuiaGPS, TXRB, USistema;

type
  TRptGPS = class(TFrmCmReport)
    rpGPS: TppReport;
    rpGPSDtlBnd: TppDetailBand;
    rpGPSShape1: TppShape;
    rpGPSShape2: TppShape;
    rpGPSShape4: TppShape;
    rpGPSShape5: TppShape;
    rpGPSShape3: TppShape;
    rpGPSShape6: TppShape;
    rpGPSLine2: TppLine;
    rpGPSLine3: TppLine;
    rpGPSLine1: TppLine;
    rpGPSLabel3: TppLabel;
    rpGPSLabel1: TppLabel;
    rpGPSLabel2: TppLabel;
    rpGPSLabel4: TppLabel;
    rpGPSLabel5: TppLabel;
    rpGPSLabel6: TppLabel;
    rpGPSLabel7: TppLabel;
    rpGPSLabel8: TppLabel;
    rpGPSLabel9: TppLabel;
    rpGPSLabel10: TppLabel;
    rpGPSLabel11: TppLabel;
    rpGPSLabel21: TppLabel;
    rpGPSLabel12: TppLabel;
    rpGPSLabel13: TppLabel;
    rpGPSLabel14: TppLabel;
    rpGPSLabel15: TppLabel;
    rpGPSLabel17: TppLabel;
    rpGPSLabel18: TppLabel;
    rpGPSLabel19: TppLabel;
    rpGPSLabel20: TppLabel;
    rpGPSDBText1: TppDBText;
    rpGPSImage1: TppImage;
    rpGPSDBText2: TppDBText;
    rpGPSDBText3: TppDBText;
    rpGPSDBText4: TppDBText;
    rpGPSLblMes1: TppLabel;
    rpGPSDBText6: TppDBText;
    rpGPSLblINSS1: TppLabel;
    rpGPSLbl7Valor1: TppLabel;
    rpGPSLbl71: TppLabel;
    rpGPSLbl81: TppLabel;
    rpGPSLbl8Valor1: TppLabel;
    rpGPSLblMultaJuros1: TppLabel;
    rpGPSLblTotal1: TppLabel;
    rpGPSLblTerceiros1: TppLabel;
    rpGPSLblCodPag1: TppLabel;
    rpGPSDBText5: TppDBText;
    rpGPSLabel16: TppLabel;
    rpGPSShape7: TppShape;
    rpGPSShape8: TppShape;
    rpGPSShape10: TppShape;
    rpGPSShape11: TppShape;
    rpGPSShape9: TppShape;
    rpGPSShape12: TppShape;
    rpGPSLine5: TppLine;
    rpGPSLine6: TppLine;
    rpGPSLine4: TppLine;
    rpGPSLabel24: TppLabel;
    rpGPSLabel22: TppLabel;
    rpGPSLabel23: TppLabel;
    rpGPSLabel25: TppLabel;
    rpGPSLabel26: TppLabel;
    rpGPSLabel27: TppLabel;
    rpGPSLabel28: TppLabel;
    rpGPSLabel29: TppLabel;
    rpGPSLabel30: TppLabel;
    rpGPSLabel31: TppLabel;
    rpGPSLabel32: TppLabel;
    rpGPSLabel42: TppLabel;
    rpGPSLabel33: TppLabel;
    rpGPSLabel34: TppLabel;
    rpGPSLabel35: TppLabel;
    rpGPSLabel36: TppLabel;
    rpGPSLabel38: TppLabel;
    rpGPSLabel39: TppLabel;
    rpGPSLabel40: TppLabel;
    rpGPSLabel41: TppLabel;
    rpGPSDBText7: TppDBText;
    rpGPSImage2: TppImage;
    rpGPSDBText8: TppDBText;
    rpGPSDBText9: TppDBText;
    rpGPSDBText10: TppDBText;
    rpGPSLblMes2: TppLabel;
    rpGPSDBText12: TppDBText;
    rpGPSLblINSS2: TppLabel;
    rpGPSLbl7Valor2: TppLabel;
    rpGPSLbl72: TppLabel;
    rpGPSLbl82: TppLabel;
    rpGPSLbl8Valor2: TppLabel;
    rpGPSLblMultaJuros2: TppLabel;
    rpGPSLblTotal2: TppLabel;
    rpGPSLblTerceiros2: TppLabel;
    rpGPSLblCodPag2: TppLabel;
    rpGPSDBText11: TppDBText;
    rpGPSLabel37: TppLabel;
    rpGPSSmryBnd: TppSummaryBand;
    rpGPSGrp: TppGroup;
    rpGPSGrpHdrBnd: TppGroupHeaderBand;
    rpGPSGrpFootBnd: TppGroupFooterBand;
    ppGPS: TppBDEPipeline;
    dsGPS: TwwDataSource;
    sqlGPS: TCMSqlParams;
    CdsGPS: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsGPSAfterOpen(DataSet: TDataSet);
    procedure CdsGPSAfterScroll(DataSet: TDataSet);
    procedure rpGPSStartPage(Sender: TObject);
    procedure rpGPSLblINSS1Print(Sender: TObject);
    procedure rpGPSLblTerceiros1Print(Sender: TObject);
    procedure rpGPSLblMultaJuros1Print(Sender: TObject);
    procedure rpGPSDBText2Print(Sender: TObject);
    procedure rpGPSDBText5Print(Sender: TObject);
    procedure rpGPSAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlGuiaGPS: TCtrlGuiaGPS;

    sAnoMesRef, sTotal, RefDataPag, RefDataVenc: string;

    procedure GerarQueryPessoaJuridica;
    procedure GerarQueryPessoaAutonomo;
    procedure GravarGuiaGPS;
  end;

var
  RptGPS: TRptGPS;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TRptGPS.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGuiaGPS := TCtrlGuiaGPS.Create;
  CtrlGuiaGPS.InitializeAs(Padroes);
end;

procedure TRptGPS.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlGuiaGPS);
  inherited;
end;

procedure TRptGPS.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  sAnoMesRef := QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger));

  if (CmpRptCM.ParamByName('TipoInformacao').asInteger = 0) then
    GerarQueryPessoaJuridica
  else
    GerarQueryPessoaAutonomo;

  sqlGPS.Open;

  RefDataPag := Copy(CmpRptCM.ParamByName('DataPagamento').asString,4,7);
  RefDataVenc := Copy(CmpRptCM.ParamByName('DataVencimento').asString,4,7);

  // --------------------------------------------------------------------------------------
  // Preenchimento dos campos da GPS
  // --------------------------------------------------------------------------------------
  // Mês de Competência
  if (CmpRptCM.ParamByName('GPS13Salario').asBoolean) then
    rpGPSLblMes1.Caption := '13/'+ CmpRptCM.ParamByName('AnoRef').asString
  else
    rpGPSLblMes1.Caption := FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger) +'/'+
      CmpRptCM.ParamByName('AnoRef').asString;

  rpGPSLblMes2.Caption := rpGPSLblMes1.Caption;
  // Código de Pagamento
  rpGPSLblCodPag1.Caption := CmpRptCM.ParamByName('CodPagamento').asString;
  rpGPSLblCodPag2.Caption := rpGPSLblCodPag1.Caption;
  // Descrição das Linhas Adicionais
  rpGPSLbl71.Caption := CmpRptCM.ParamByName('DescrAdicionalLinha7').asString;
  rpGPSLbl72.Caption := rpGPSLbl71.Caption;
  rpGPSLbl81.Caption := CmpRptCM.ParamByName('DescrAdicionalLinha8').asString;
  rpGPSLbl82.Caption := rpGPSLbl81.Caption;
  // Descrição das Linhas Adicionais
  rpGPSLbl7Valor1.Caption := FU.ValStr(CmpRptCM.ParamByName('ValorAdicionalLinha7').asFloat, 12, 2, true, ',');
  rpGPSLbl7Valor2.Caption := rpGPSLbl7Valor1.Caption;
  rpGPSLbl8Valor1.Caption := FU.ValStr(CmpRptCM.ParamByName('ValorAdicionalLinha8').asFloat, 12, 2, true, ',');
  rpGPSLbl8Valor2.Caption := rpGPSLbl8Valor1.Caption;
  // Atualização e Total
  rpGPSLblMultaJuros1.Visible := CmpRptCM.ParamByName('ImprimeAtualizacaoMonet').asBoolean;
  rpGPSLblTotal1.Visible := CmpRptCM.ParamByName('ImprimeTotal').asBoolean;

  // Visualizo ou não os componetes de acordo com o modo de impressão (Espelho, Imagem)
  // (para a primeira via da GPS)
  rpGPSImage1.Visible := CmpRptCM.ParamByName('ImprimeFormulario').asBoolean;
  rpGPSShape1.Visible := rpGPSImage1.Visible;
  rpGPSShape2.Visible := rpGPSImage1.Visible;
  rpGPSShape3.Visible := rpGPSImage1.Visible;
  rpGPSShape4.Visible := rpGPSImage1.Visible;
  rpGPSShape5.Visible := rpGPSImage1.Visible;
  rpGPSShape6.Visible := rpGPSImage1.Visible;

  rpGPSLine1.Visible := rpGPSImage1.Visible;
  rpGPSLine2.Visible := rpGPSImage1.Visible;
  rpGPSLine3.Visible := rpGPSImage1.Visible;

  rpGPSLabel1.Visible := rpGPSImage1.Visible;
  rpGPSLabel2.Visible := rpGPSImage1.Visible;
  rpGPSLabel3.Visible := rpGPSImage1.Visible;
  rpGPSLabel4.Visible := rpGPSImage1.Visible;
  rpGPSLabel5.Visible := rpGPSImage1.Visible;
  rpGPSLabel6.Visible := rpGPSImage1.Visible;
  rpGPSLabel7.Visible := rpGPSImage1.Visible;
  rpGPSLabel8.Visible := rpGPSImage1.Visible;
  rpGPSLabel9.Visible := rpGPSImage1.Visible;
  rpGPSLabel10.Visible := rpGPSImage1.Visible;
  rpGPSLabel11.Visible := rpGPSImage1.Visible;
  rpGPSLabel12.Visible := rpGPSImage1.Visible;
  rpGPSLabel13.Visible := rpGPSImage1.Visible;
  rpGPSLabel14.Visible := rpGPSImage1.Visible;
  rpGPSLabel15.Visible := rpGPSImage1.Visible;
  rpGPSLabel16.Visible := rpGPSImage1.Visible;
  rpGPSLabel17.Visible := rpGPSImage1.Visible;
  rpGPSLabel18.Visible := rpGPSImage1.Visible;
  rpGPSLabel19.Visible := rpGPSImage1.Visible;
  rpGPSLabel20.Visible := rpGPSImage1.Visible;
  rpGPSLabel21.Visible := rpGPSImage1.Visible;

  // Visualizo ou não os componetes de acordo com o modo de impressão (Espelho, Imagem)
  // e Número da Vias a Imprimir (para a segunda via da GPS)
  rpGPSImage2.Visible := (CmpRptCM.ParamByName('ImprimeFormulario').asBoolean) and
    (CmpRptCM.ParamByName('ImprimeEmDuasVias').asBoolean);

  rpGPSLine4.Visible := rpGPSImage2.Visible;
  rpGPSLine5.Visible := rpGPSImage2.Visible;
  rpGPSLine6.Visible := rpGPSImage2.Visible;

  rpGPSShape7.Visible := rpGPSImage2.Visible;
  rpGPSShape8.Visible := rpGPSImage2.Visible;
  rpGPSShape9.Visible := rpGPSImage2.Visible;
  rpGPSShape10.Visible := rpGPSImage2.Visible;
  rpGPSShape11.Visible := rpGPSImage2.Visible;
  rpGPSShape12.Visible := rpGPSImage2.Visible;

  rpGPSLabel22.Visible := rpGPSImage2.Visible;
  rpGPSLabel23.Visible := rpGPSImage2.Visible;
  rpGPSLabel24.Visible := rpGPSImage2.Visible;
  rpGPSLabel25.Visible := rpGPSImage2.Visible;
  rpGPSLabel26.Visible := rpGPSImage2.Visible;
  rpGPSLabel27.Visible := rpGPSImage2.Visible;
  rpGPSLabel28.Visible := rpGPSImage2.Visible;
  rpGPSLabel29.Visible := rpGPSImage2.Visible;
  rpGPSLabel30.Visible := rpGPSImage2.Visible;
  rpGPSLabel31.Visible := rpGPSImage2.Visible;
  rpGPSLabel32.Visible := rpGPSImage2.Visible;
  rpGPSLabel33.Visible := rpGPSImage2.Visible;
  rpGPSLabel34.Visible := rpGPSImage2.Visible;
  rpGPSLabel35.Visible := rpGPSImage2.Visible;
  rpGPSLabel36.Visible := rpGPSImage2.Visible;
  rpGPSLabel37.Visible := rpGPSImage2.Visible;
  rpGPSLabel38.Visible := rpGPSImage2.Visible;
  rpGPSLabel39.Visible := rpGPSImage2.Visible;
  rpGPSLabel40.Visible := rpGPSImage2.Visible;
  rpGPSLabel41.Visible := rpGPSImage2.Visible;
  rpGPSLabel42.Visible := rpGPSImage2.Visible;

  rpGPSDBText7.Visible := CmpRptCM.ParamByName('ImprimeEmDuasVias').asBoolean;
  rpGPSDBText8.Visible := rpGPSDBText7.Visible;
  rpGPSDBText9.Visible := rpGPSDBText7.Visible;
  rpGPSDBText10.Visible := rpGPSDBText7.Visible;
  rpGPSDBText11.Visible := rpGPSDBText7.Visible;
  rpGPSDBText12.Visible := rpGPSDBText7.Visible;
  rpGPSLblCodPag2.Visible := rpGPSDBText7.Visible;
  rpGPSLblMes2.Visible := rpGPSDBText7.Visible;
  rpGPSLblINSS2.Visible := rpGPSDBText7.Visible;
  rpGPSLbl7Valor2.Visible := rpGPSDBText7.Visible;
  rpGPSLbl8Valor2.Visible := rpGPSDBText7.Visible;
  rpGPSLblTerceiros2.Visible := rpGPSDBText7.Visible;
  rpGPSLblMultaJuros2.Visible := (rpGPSDBText7.Visible) and (rpGPSLblMultaJuros1.Visible);
  rpGPSLblTotal2.Visible := (rpGPSDBText7.Visible) and (rpGPSLblTotal1.Visible);
end;

procedure TRptGPS.GerarQueryPessoaJuridica;
begin
  with (sqlGPS.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.IDPESSOA AS IDEMPRESA,');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) || '' - CEP: '' ||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS RUA,');
    Add('  (DECODE(TE.DDD,NULL,NULL,''('' || RTRIM(TE.DDD) || '')'') || TE.NUMERO) AS TELEFONE,');
    Add('  RTRIM(E.BAIRRO) AS BAIRRO,');
    Add('  RTRIM(CIDADES.NOME) AS CIDADE,');
    Add('  ROUND(CALCVLR.SAL_MATERNIDADE,2) AS SAL_MATERNIDADE,');
    Add('  ROUND(CALCVLR.SAL_FAMILIA,2) AS SAL_FAMILIA,');
    Add('  ROUND(CALCVLR.AUX_DOENCA,2) AS AUX_DOENCA,');
    Add('  ROUND(DECODE(SAT.PERCSEGACIDTRAB,NULL,0,SAT.PERCSEGACIDTRAB),2) AS SEG_ACID_TRAB,');
    Add('  ROUND(CALCVLR.VLRBASE,2) AS VLRBASE,');
    Add('  ROUND(CALCVLR.BASEINSS,2) AS BASEINSS,');
    Add('  ROUND(CALCVLR.SEGURO,2) AS SEGURO,');
    Add('  ROUND(CALCVLR.BASERPA,2) AS BASERPA,');
    Add('  ROUND(CALCVLR.FPAS,2) AS FPAS,');
    Add('  ROUND(CALCVLR.VLRBASE * (FP.PERCCONTRIBEMPRES +');
    Add('    DECODE(SAT.PERCSEGACIDTRAB,NULL,0,SAT.PERCSEGACIDTRAB)) / 100,2)+');
    Add('    ROUND(CALCVLR.BASESEMSAT * FP.PERCCONTRIBEMPRES / 100,2) AS VLREMPRESA,');
    Add('  ROUND((CALCVLR.VLRBASE * (CP.PERCCONVPREVID - CP1.PERCCONVPREVID)) / 100,2) AS TERCEIROS,');
    Add('  ROUND(((CALCVLR.SEGURO + (CALCVLR.VLRBASE * (FP.PERCCONTRIBEMPRES +');
    Add('    DECODE(SAT.PERCSEGACIDTRAB,NULL,0,SAT.PERCSEGACIDTRAB)) / 100)) +');
    Add('    ((CALCVLR.VLRBASE * (CP.PERCCONVPREVID - CP1.PERCCONVPREVID)) / 100)) -');
    Add('    CALCVLR.FPAS,2) AS SUBTOTAL');
    // ------------------------------------------------------------------------------- //
    // Se Existir Juros
    if (CmpRptCM.ParamByName('Juros').asFloat > 0) then
    begin
      Add('  ,(' +QuotedStr(FloatToStr(CmpRptCM.ParamByName('Juros').asFloat))+ ') AS JUROS');

      // Juros é por Percentual ou Valor
      if (CmpRptCM.ParamByName('PercentJuros').asBoolean) then
        Add('  ,(''P'') AS TJUROS')
      else
        Add('  ,(''V'') AS TJUROS');
    end
    else
      Add('  ,(0) AS JUROS, (''V'') AS TJUROS');

    // Se Existir Multa
    if (CmpRptCM.ParamByName('Multa').asFloat > 0) then
    begin
      Add('  ,(' +QuotedStr(FloatToStr(CmpRptCM.ParamByName('Multa').asFloat))+ ') AS MULTA');

      // Testa se Juros é por Percentual ou Valor
      if (CmpRptCM.ParamByName('PercentMulta').asBoolean) then
        Add('  ,(''P'') AS TMULTA')
      else
        Add('  ,(''V'') AS TMULTA');
    end
    else
      Add('  ,(0) AS MULTA, (''V'') AS TMULTA');
    // ------------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, TELENDPESS TE, FILIALPESSOA FI, FPAS FP, SEGACIDTRAB SAT,');
    Add('  CIDADES, CONVPREVID CP1,');
    // ------------------------------------------------------------------------------- //
    Add('  (SELECT IDFPAS, SUM(PERCCONVPREVID) AS PERCCONVPREVID');
    Add('   FROM   CONVPREVID');
    Add('   GROUP BY IDFPAS) CP,');
    // ------------------------------------------------------------------------------- //
    Add('  (SELECT F.IDESTAB AS CODIGO,');
    // Salário Maternidade
    Add('     SUM(DECODE(P.CODRUBCLT,''60570'',');
    Add('       DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO),0)) AS SAL_MATERNIDADE,');
    // Salário Família
    Add('     SUM(DECODE(P.CODRUBCLT,''40573'',');
    Add('       DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO),0)) AS SAL_FAMILIA,');
    // Auxílio doença
    Add('     SUM(DECODE(P.CODRUBCLT,''40560'',');
    Add('       DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO),0)) AS AUX_DOENCA,');
    // VLRBASE = Valor da Base INSS + Valor da Base INSS do 13º + Valor da Base INSS Férias +
    // Valor da Base INSS Salário Maternidade + Valor da Base INSS Diferença Salarial
    Add('     SUM(DECODE(P.CODRUBCLT,''60025'',');
    Add('       DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO),0)+');
    Add('       DECODE(P.CODRUBCLT,''60017'',');
    Add('       DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO),0)+');
    Add('       DECODE(P.CODRUBCLT,''60015'',');
    Add('       DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO),0)+');
    Add('       DECODE(P.CODRUBCLT,''60421'',');
    Add('       DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO),0)+');
    Add('       DECODE(P.CODRUBCLT,''62016'',');
    Add('       DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO),0)) AS VLRBASE,');
    // BASESEMSAT = Valor Base da Contribuição Global
    Add('     SUM(DECODE(P.CODRUBCLT,''60030'',H.VALORPROVENTO,0)) AS BASESEMSAT,');
    // Base do INSS = Valor da Base INSS + Valor Base Salário Maternidade
    Add('     SUM(DECODE(P.CODRUBCLT,''60025'',');
    Add('       DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO),0)+');
    Add('       DECODE(P.CODRUBCLT,''60570'',');
    Add('       DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO),0)) AS BASEINSS,');
    // Valor Base RPA
    Add('     SUM(DECODE(P.CODRUBCLT,''60002'',H.VALORPROVENTO,0)) AS BASERPA,');
    // Valor do INSS
    Add('     SUM(DECODE(P.CODRUBCLT,''50025'',');
    Add('       DECODE(P.FLGDESCONTO,0,-H.VALORPROVENTO,H.VALORPROVENTO),0)) AS SEGURO,');
    // FPAS = Valor Auxílio Doença + Valor Salário Família + Valor a Descontar por Afastamento +
    //        Maternidade + Valor a Descontar por Afastamento Paternidade
    Add('     SUM(DECODE(P.CODRUBCLT,''40560'',H.VALORPROVENTO,0)+');
    Add('       DECODE(P.CODRUBCLT,''40573'',H.VALORPROVENTO,0)+');
    Add('       DECODE(P.CODRUBCLT,''50570'',H.VALORPROVENTO,0)+');
    Add('       DECODE(P.CODRUBCLT,''50571'',H.VALORPROVENTO,0)) AS FPAS');
    Add('   FROM ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P, FUNCIONARIO F');
    Add('   WHERE');
    Add('     (P.CODRUBCLT IN (''60570'',''40573'',''40560'',''60025'',''60017'',''60030'','+
      '''60015'',''60421'',''60002'',''50025'',''50570'',''50571'',''62016'')) AND');
    Add('     (H.MES        = ' +sAnoMesRef+ ') AND');

    if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
        Add('     (H.IDMOTIVO  IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
      else
        Add('     (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

    Add('     (H.IDPESSJUR  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
    Add('     (H.IDPESSOA   = F.IDPESSOA) AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY F.IDESTAB) CALCVLR');
    // ------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA       = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');
    Add('  (PJ.IDPESSOA       = FI.IDFILIALPESSOA) AND');
    Add('  (FI.IDFPAS         = FP.IDFPAS) AND');
    Add('  (FI.IDCONVPREVID   = CP1.IDCONVPREVID) AND');
    Add('  (FP.IDFPAS         = CP1.IDFPAS) AND');
    Add('  (FP.IDFPAS         = CP.IDFPAS) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (E.IDENDERECO      = TE.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA       = CALCVLR.CODIGO) AND');
    Add('  (FI.IDSEGACIDTRAB  = SAT.IDSEGACIDTRAB(+)) AND');
    Add('  (ROWNUM            = 1)');
    Add('ORDER BY');
    Add('  EMPRESA');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
end;

procedure TRptGPS.GerarQueryPessoaAutonomo;
begin
  with (sqlGPS.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PF.NOME AS EMPRESA,');
    Add('  (:TIPO || DO.NUMDOCUMENTO) AS CGC,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) AS RUA,');
    Add('  (DECODE(TE.DDD,NULL,NULL,''('' || RTRIM(TE.DDD) || '')'') || TE.NUMERO) AS TELEFONE,');
    Add('  RTRIM(E.BAIRRO) AS BAIRRO,');
    Add('  RTRIM(CIDADES.NOME) AS CIDADE,');
    Add('  NVL(H.VALORPROVENTO,0) AS SUBTOTAL,');
    Add('  0 AS TERCEIROS,');
    Add('  0 AS VLREMPRESA,');
    Add('  0 AS SEGURO,');
    Add('  0 AS FPAS');

    // Se Existir Juros
    if (CmpRptCM.ParamByName('Juros').asFloat > 0) then
    begin
      Add('  ,(' +QuotedStr(FloatToStr(CmpRptCM.ParamByName('Juros').asFloat))+ ') AS JUROS');

      // Juros é por Percentual ou Valor
      if (CmpRptCM.ParamByName('PercentJuros').asBoolean) then
        Add('  ,(''P'') AS TJUROS')
      else
        Add('  ,(''V'') AS TJUROS');
    end
    else
      Add('  ,(0) AS JUROS, (''V'') AS TJUROS');

    // Se Existir Multa
    if (CmpRptCM.ParamByName('Multa').asFloat > 0) then
    begin
      Add('  ,(' +QuotedStr(FloatToStr(CmpRptCM.ParamByName('Multa').asFloat))+ ') AS MULTA');

      // Testa se Juros é por Percentual ou Valor
      if (CmpRptCM.ParamByName('PercentMulta').asBoolean) then
        Add('  ,(''P'') AS TMULTA')
      else
        Add('  ,(''V'') AS TMULTA');
    end
    else
      Add('  ,(0) AS MULTA, (''V'') AS TMULTA');

    Add('FROM');
    Add('  ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PESSOA PJ, PESSOA PF, DOCPESSOA DO,');
    Add('  ENDPESS E, TELENDPESS TE, PROVDESC P, TIPODOCOFICIAL TDO, CIDADES, FILIALPESSOA FI');
    Add('WHERE');
    Add('  (TDO.SIGLADOCUMENTO = :TIPO) AND');
    Add('  (P.CODRUBCLT        = ''60002'') AND');
    Add('  (PJ.IDPESSOA        = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');

    if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
        Add('  (H.IDMOTIVO        IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
      else
        Add('  (H.IDMOTIVO         = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');

    Add('  (H.MES              = '+sAnoMesRef+') AND');
    Add('  (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO) AND');
    Add('  (H.IDPESSJUR        = PJ.IDGRUPO) AND');
    Add('  (H.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (P.IDPROVENTO       = H.IDRUBRICA) AND');
    Add('  (DO.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (PF.IDPESSOA        = E.IDPESSOA) AND');
    Add('  (PF.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
    Add('  (E.IDENDERECO       = TE.IDENDERECO) AND');
    Add('  (ROWNUM             = 1)');
    Add('ORDER BY');
    Add('  EMPRESA');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlGPS.Prepare;
  case (CmpRptCM.ParamByName('TipoInformacao').asInteger) of
    1 : sqlGPS.ParamByName('TIPO').asString := 'NIT: ';
    2 : sqlGPS.ParamByName('TIPO').asString := 'CEI: ';
  end;
end;

procedure TRptGPS.CdsGPSAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptGPS.CdsGPSAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptGPS.rpGPSStartPage(Sender: TObject);
begin
  rpGPSLblINSS1.Caption := '';
  rpGPSLblTerceiros1.Caption := '';
  rpGPSLblMultaJuros1.Caption := '';
  rpGPSLblTotal1.Caption := '';
  rpGPSLblINSS2.Caption := '';
  rpGPSLblTerceiros2.Caption := '';
  rpGPSLblMultaJuros2.Caption := '';
  rpGPSLblTotal2.Caption := '';

  frmAguarde.Apaga;
end;

procedure TRptGPS.rpGPSLblINSS1Print(Sender: TObject);
begin
  if not(CdsGPS.FieldByName('EMPRESA').IsNull) then
  begin
    if (CmpRptCM.ParamByName('SomaAdicionalLinha6').asBoolean) then
      rpGPSLblINSS1.Caption := FU.ValStr((CdsGPS.FieldByName('VLREMPRESA').asFloat +
        CdsGPS.FieldByName('SEGURO').asFloat - CdsGPS.FieldByName('FPAS').asFloat) +
        CmpRptCM.ParamByName('ValorAdicionalLinha6').asFloat, 12, 2, true, ',')
    else
      rpGPSLblINSS1.Caption := FU.ValStr((CdsGPS.FieldByName('VLREMPRESA').asFloat +
        CdsGPS.FieldByName('SEGURO').asFloat - CdsGPS.FieldByName('FPAS').asFloat) -
        CmpRptCM.ParamByName('ValorAdicionalLinha6').asFloat, 12, 2, true, ',');

    rpGPSLblINSS2.Caption := rpGPSLblINSS1.Caption;
  end;
end;

procedure TRptGPS.rpGPSLblTerceiros1Print(Sender: TObject);
begin
  if not(CdsGPS.FieldByName('EMPRESA').IsNull) then
  begin
    rpGPSLblTerceiros1.Caption := FU.ValStr(CdsGPS.FieldByName('TERCEIROS').asFloat,12,2,true,',');
    rpGPSLblTerceiros2.Caption := rpGPSLblTerceiros1.Caption;
  end;
end;

procedure TRptGPS.rpGPSLblMultaJuros1Print(Sender: TObject);
var
  rSubTotal, rCorrecao, rJuros, rMulta: double;
begin
  rSubTotal := 0;

  // Calcula Sub Total
  if not(CdsGPS.FieldByName('EMPRESA').IsNull) then
    rSubTotal := CdsGPS.FieldByName('VLREMPRESA').asFloat +
      CdsGPS.FieldByName('SEGURO').asFloat - CdsGPS.FieldByName('FPAS').asFloat +
      CdsGPS.FieldByName('TERCEIROS').asFloat;

  // Adiciona ou Subtrai 7
  if (CmpRptCM.ParamByName('SomaAdicionalLinha7').asBoolean) then
    rSubTotal := rSubTotal + CmpRptCM.ParamByName('ValorAdicionalLinha7').asFloat
  else
    rSubTotal := rSubTotal - CmpRptCM.ParamByName('ValorAdicionalLinha7').asFloat;
    
  // Adiciona ou Subtrai 8
  if (CmpRptCM.ParamByName('SomaAdicionalLinha8').asBoolean) then
    rSubTotal := rSubTotal + CmpRptCM.ParamByName('ValorAdicionalLinha8').asFloat
  else
    rSubTotal := rSubTotal - CmpRptCM.ParamByName('ValorAdicionalLinha8').asFloat;

  // Calcula Correção
  rCorrecao := (rSubTotal * CmpRptCM.ParamByName('CotacaoMoedaDataPag').asFloat) -
    (rSubTotal * CmpRptCM.ParamByName('CotacaoMoedaDataVenc').asFloat);

  // Calcula Juros
  if not(CdsGPS.FieldByName('EMPRESA').IsNull) then
    if (CdsGPS.FieldByName('TJUROS').asString = 'P') then
      rJuros := ((rSubTotal + rCorrecao) * CdsGPS.FieldByName('JUROS').asFloat) / 100
    else
      rJuros := CdsGPS.FieldByName('JUROS').asFloat
  else
    rJuros := 0;

  // Calcula Multa
  if not(CdsGPS.FieldByName('EMPRESA').IsNull) then
  begin
    if (CdsGPS.FieldByName('TMULTA').asString = 'P') then
      rMulta := ((rSubTotal + rCorrecao) * CdsGPS.FieldByName('MULTA').asFloat) / 100
    else
      rMulta := CdsGPS.FieldByName('MULTA').asFloat;
  end    
  else
    rMulta := 0;

  // Imprime ATM / MULTA e JUROS
  rpGPSLblMultaJuros1.Caption := FU.ValStr((rCorrecao + rJuros + rMulta), 12, 2, true, ',');
  rpGPSLblMultaJuros2.Caption := rpGPSLblMultaJuros1.Caption;

  // Imprime Total
  if (CmpRptCM.ParamByName('SomaAdicionalLinha6').asBoolean) then
  begin
    rpGPSLblTotal1.Caption := FU.ValStr((rSubTotal + rCorrecao + rJuros + rMulta) +
      CmpRptCM.ParamByName('ValorAdicionalLinha6').asFloat, 12, 2, true, ',');
    sTotal := FU.Float2String((rSubTotal + rCorrecao + rJuros + rMulta) +
      CmpRptCM.ParamByName('ValorAdicionalLinha6').asFloat);
  end
  else
  begin
    rpGPSLblTotal1.Caption := FU.ValStr((rSubTotal + rCorrecao + rJuros + rMulta) -
      CmpRptCM.ParamByName('ValorAdicionalLinha6').asFloat, 12, 2, true, ',');
    sTotal := FU.Float2String((rSubTotal + rCorrecao + rJuros + rMulta) -
      CmpRptCM.ParamByName('ValorAdicionalLinha6').asFloat);
  end;

  rpGPSLblTotal2.Caption := rpGPSLblTotal1.Caption;
end;

procedure TRptGPS.rpGPSDBText2Print(Sender: TObject);
begin
  TppDBText(Sender).Visible := not(CdsGPS.FieldByName('RUA').IsNull) and
    (Trim(CdsGPS.FieldByName('RUA').asString) <> ', , Cep: -');
end;                                                 

procedure TRptGPS.rpGPSDBText5Print(Sender: TObject);
begin
  TppDBText(Sender).Visible := not(CdsGPS.FieldByName('TELEFONE').IsNull) and
    (Trim(CdsGPS.FieldByName('TELEFONE').asString) <> '');
end;

procedure TRptGPS.rpGPSAfterPrint(Sender: TObject);
begin
  GravarGuiaGPS;
end;

// Grava a guia de GPS
procedure TRptGPS.GravarGuiaGPS;
begin
  CtrlGuiaGPS.Cds := TCMClientDataSet(dmCds.Cds);
  dmCds.Cds.Data := CtrlGuiaGPS.ListGuiaGPS(CdsGPS.FieldByName('IDEMPRESA').asFloat,
    CmpRptCM.ParamByName('AnoRef').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger));

  with (dmCds.Cds) do
  begin
    if (IsEmpty) then
      Insert
    else
      Edit;

    // Estabelecimento que está emitindo a GPS
    FieldByName('IDFILIALPESSOA').asFloat := CmpRptCM.ParamByName('IdEstab').asFloat;
    // Mês de Referência
    FieldByName('MES').asString := CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger);
    // Data de pagamento da GPS
    FieldByName('DATAFIMGRPS').asDateTime := CmpRptCM.ParamByName('DataPagamento').asDateTime;
    // Data de vencimento da GPS
    FieldByName('DATAVENCGRPS').asDateTime := CmpRptCM.ParamByName('DataVencimento').asDateTime;
    // Pego o código da cotação de moeda para a data atual
    FieldByName('MOECODIGO').asString := CmpRptCM.ParamByName('MoeCodigo').asString;
    // Salário maternidade
    FieldByName('SALARMATERNIDADE').asFloat := CdsGPS.FieldByName('SAL_MATERNIDADE').asFloat;
    // Salário família
    FieldByName('SALARIOFAMILIA').asFloat := CdsGPS.FieldByName('SAL_FAMILIA').asFloat;
    // Seguro acidente de trabalho
    FieldByName('SEGACIDTRABALHO').asFloat := CdsGPS.FieldByName ('SEG_ACID_TRAB').asFloat;
    // Auxílio doença
    FieldByName('AUXILIODOENCA').asFloat := CdsGPS.FieldByName ('AUX_DOENCA').asFloat;
    // Auxílio natalidade
    FieldByName('AUXILIONATALIDADE').asFloat := 0;
    // Adicional de GPS A
    FieldByName('ADICGPSA').asFloat := CmpRptCM.ParamByName('ValorAdicionalLinha7').asFloat;
    // Adicional de GPS B
    FieldByName('ADICGPSB').asFloat := CmpRptCM.ParamByName('ValorAdicionalLinha8').asFloat;
    // Código de Pagamento
    FieldByName('CODIGOPAG').asString := rpGPSLblCodPag1.Caption;
    // Total da GPS
    FieldByName('TOTAL').asFloat := FU.String2Float(sTotal);
    Post;
  end;
  CtrlGuiaGPS.GravarGuiaGPS;
end;

end.
