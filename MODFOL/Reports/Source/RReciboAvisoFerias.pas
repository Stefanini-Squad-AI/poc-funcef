// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Edilaine Ferraresi
// Data        :  16/05/2012
// SOL         :  180106
// Kintana     :  1664886
// Descricao   :  Acrescentar a informação Função do funcionário junto com Cargo
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RReciboAvisoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, ppStrtch, ppMemo, ppVar, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, uExtensoCM, TXRB,USistema;

type
  TRptReciboAvisoFerias = class(TFrmCmReport)
    rpReciboAvisoFerias: TppReport;
    rpReciboAvisoFeriasDtlBnd1: TppDetailBand;
    rpReciboAvisoFeriasSmryBnd1: TppSummaryBand;
    ppGroup9: TppGroup;
    rpReciboAvisoFeriasGrpHdrBnd0: TppGroupHeaderBand;
    rpRPFeriasShape12: TppShape;
    rpReciboAvisoFeriasDBText2: TppDBText;
    rpReciboAvisoFeriasDBText1: TppDBText;
    rpReciboAvisoFeriasDBText3: TppDBText;
    rpReciboAvisoFeriasDBText4: TppDBText;
    rpReciboAvisoFeriasLabel2: TppLabel;
    rpFolhaNormalCalc1: TppCalc;
    rpRPFeriasLabel6: TppLabel;
    rpRPFeriasShape5: TppShape;
    rpRPFeriasMemo1: TppMemo;
    rpRPFeriasMemo3: TppMemo;
    rpRPFeriasMemo4: TppMemo;
    rpReciboAvisoFeriasLabel3: TppLabel;
    rpReciboAvisoFeriasDBText5: TppDBText;
    rpReciboAvisoFeriasLabel4: TppLabel;
    rpReciboAvisoFeriasDBText6: TppDBText;
    rpReciboAvisoFeriasLabel5: TppLabel;
    rpReciboAvisoFeriasDBText7: TppDBText;
    rpReciboAvisoFeriasLabel6: TppLabel;
    rpReciboAvisoFeriasDBText8: TppDBText;
    rpRPFeriasMemo7: TppMemo;
    rpNotificFeriasLabel1: TppLabel;
    rpRPFeriasShape1: TppShape;
    rpRPFeriasShape2: TppShape;
    rpRPFeriasLabel1: TppLabel;
    rpRPFeriasLabel2: TppLabel;
    rpRPFeriasLabel3: TppLabel;
    rpRPFeriasShape9: TppShape;
    rpRPFeriasLabel4: TppLabel;
    rpRPFeriasShape10: TppShape;
    rpRPFeriasLabel5: TppLabel;
    rpReciboAvisoFeriasShape1: TppShape;
    rpReciboAvisoFeriasShape2: TppShape;
    rpReciboAvisoFeriasLabel84: TppLabel;
    rpReciboAvisoFeriasLabel86: TppLabel;
    rpReciboAvisoFeriasShape3: TppShape;
    rpReciboAvisoFeriasShape4: TppShape;
    rpReciboAvisoFeriasLabel87: TppLabel;
    rpReciboAvisoFeriasLabel89: TppLabel;
    rpReciboAvisoFeriasShape5: TppShape;
    rpReciboAvisoFeriasLabel100: TppLabel;
    rpRPFeriasMemo10: TppMemo;
    rpReciboAvisoFeriasLabel1: TppLabel;
    rpReciboAvisoFeriasDBTextCTPS: TppDBText;
    rpReciboAvisoFeriasDBText15: TppDBText;
    rpReciboAvisoFeriasMemo1: TppMemo;
    rpReciboAvisoFeriasLabel90: TppLabel;
    rpReciboAvisoFeriasLabel92: TppLabel;
    rpReciboAvisoFeriasLabel94: TppLabel;
    rpReciboAvisoFeriasLabel96: TppLabel;
    rpReciboAvisoFeriasLabel98: TppLabel;
    rpReciboAvisoFeriasDBText14: TppDBText;
    rpReciboAvisoFeriasDBText16: TppDBText;
    rpReciboAvisoFeriasDBText17: TppDBText;
    rpReciboAvisoFeriasDBText18: TppDBText;
    rpReciboAvisoFeriasDBText19: TppDBText;
    rpReciboAvisoFeriasDBText20: TppDBText;
    rpReciboAvisoFeriasDBText21: TppDBText;
    rpReciboAvisoFeriasDBText22: TppDBText;
    rpReciboAvisoFeriasDBText23: TppDBText;
    rpReciboAvisoFeriasDBText24: TppDBText;
    rpReciboAvisoFeriasDBText25: TppDBText;
    rpReciboAvisoFeriasDBText26: TppDBText;
    rpReciboAvisoFeriasDBText27: TppDBText;
    rpReciboAvisoFeriasDBText28: TppDBText;
    rpReciboAvisoFeriasDBText29: TppDBText;
    rpReciboAvisoFeriasDBText30: TppDBText;
    rpReciboAvisoFeriasDBText31: TppDBText;
    rpReciboAvisoFeriasDBText32: TppDBText;
    rpReciboAvisoFeriasDBText33: TppDBText;
    rpReciboAvisoFeriasDBText34: TppDBText;
    rpReciboAvisoFeriasDBText35: TppDBText;
    rpReciboAvisoFeriasDBText36: TppDBText;
    rpReciboAvisoFeriasDBText37: TppDBText;
    rpReciboAvisoFeriasDBText38: TppDBText;
    rpReciboAvisoFeriasDBText39: TppDBText;
    rpReciboAvisoFeriasDBText40: TppDBText;
    rpReciboAvisoFeriasDBText41: TppDBText;
    rpReciboAvisoFeriasDBText42: TppDBText;
    rpReciboAvisoFeriasDBText43: TppDBText;
    rpReciboAvisoFeriasDBText44: TppDBText;
    rpReciboAvisoFeriasDBText45: TppDBText;
    rpReciboAvisoFeriasDBText46: TppDBText;
    rpReciboAvisoFeriasDBText47: TppDBText;
    rpReciboAvisoFeriasDBText48: TppDBText;
    rpReciboAvisoFeriasDBText49: TppDBText;
    rpReciboAvisoFeriasDBText50: TppDBText;
    rpReciboAvisoFeriasDBText51: TppDBText;
    rpReciboAvisoFeriasDBText52: TppDBText;
    rpReciboAvisoFeriasDBText53: TppDBText;
    rpReciboAvisoFeriasDBText54: TppDBText;
    rpReciboAvisoFeriasDBText55: TppDBText;
    rpReciboAvisoFeriasDBText56: TppDBText;
    rpReciboAvisoFeriasDBText57: TppDBText;
    rpReciboAvisoFeriasDBText58: TppDBText;
    rpReciboAvisoFeriasDBText59: TppDBText;
    rpReciboAvisoFeriasDBText60: TppDBText;
    rpReciboAvisoFeriasDBText61: TppDBText;
    rpReciboAvisoFeriasDBText62: TppDBText;
    rpReciboAvisoFeriasDBText63: TppDBText;
    rpReciboAvisoFeriasDBText64: TppDBText;
    rpReciboAvisoFeriasDBText65: TppDBText;
    rpReciboAvisoFeriasDBText66: TppDBText;
    rpReciboAvisoFeriasDBText67: TppDBText;
    rpReciboAvisoFeriasDBText68: TppDBText;
    rpReciboAvisoFeriasDBText69: TppDBText;
    rpReciboAvisoFeriasDBText70: TppDBText;
    rpReciboAvisoFeriasDBText71: TppDBText;
    rpReciboAvisoFeriasDBText72: TppDBText;
    rpReciboAvisoFeriasDBText73: TppDBText;
    rpReciboAvisoFeriasDBText74: TppDBText;
    rpReciboAvisoFeriasDBText75: TppDBText;
    rpReciboAvisoFeriasDBText76: TppDBText;
    rpReciboAvisoFeriasDBText77: TppDBText;
    rpReciboAvisoFeriasDBText78: TppDBText;
    rpReciboAvisoFeriasDBText79: TppDBText;
    rpReciboAvisoFeriasDBText80: TppDBText;
    rpReciboAvisoFeriasDBText81: TppDBText;
    rpReciboAvisoFeriasDBText82: TppDBText;
    rpReciboAvisoFeriasDBText83: TppDBText;
    rpReciboAvisoFeriasDBText84: TppDBText;
    rpReciboAvisoFeriasDBText85: TppDBText;
    rpReciboAvisoFeriasDBText86: TppDBText;
    rpReciboAvisoFeriasDBText87: TppDBText;
    rpReciboAvisoFeriasDBText88: TppDBText;
    rpReciboAvisoFeriasDBText89: TppDBText;
    rpReciboAvisoFeriasDBText90: TppDBText;
    rpReciboAvisoFeriasDBText91: TppDBText;
    rpReciboAvisoFeriasDBText92: TppDBText;
    rpReciboAvisoFeriasDBText93: TppDBText;
    rpReciboAvisoFeriasDBText94: TppDBText;
    rpReciboAvisoFeriasDBText95: TppDBText;
    rpReciboAvisoFeriasDBText96: TppDBText;
    rpReciboAvisoFeriasDBText97: TppDBText;
    rpReciboAvisoFeriasDBText98: TppDBText;
    rpReciboAvisoFeriasDBText99: TppDBText;
    rpReciboAvisoFeriasMemo2: TppMemo;
    rpReciboAvisoFeriasDBTextMAIOR_REM: TppDBText;
    rpReciboAvisoFeriasLabelMAIOR_REM: TppLabel;
    ReciboAvisoFeriasLbl11: TppLabel;
    ReciboAvisoFeriasLbl12: TppLabel;
    ReciboAvisoFeriasLbl13: TppLabel;
    ReciboAvisoFeriasLbl1: TppLabel;
    rpReciboAvisoFeriasGrpFootBnd0: TppGroupFooterBand;
    ppReciboAvisoFerias: TppBDEPipeline;
    dsReciboAvisoFerias: TwwDataSource;
    sqlReciboAvisoFerias: TCMSqlParams;
    CdsReciboAvisoFerias: TCMClientDataSet;
    ExtensoCM: TExtensoCM;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpReciboAvisoFeriasGrpHdrBnd0BeforePrint(Sender: TObject);
    procedure CdsReciboAvisoFeriasAfterScroll(DataSet: TDataSet);
    procedure rpReciboAvisoFeriasSmryBnd1AfterPrint(Sender: TObject);
  private
    sIniGozoFer, sMatricula: string;
    rMaiorRem, rSalBase, rBaseINSS, rBaseFGTS,
    rFGTSMes, rBaseIRRF, rProventos, rDescontos: real;
    
    procedure GerarDadosRelat;
    function  GetNumPagReciboAtual: integer;
    procedure CalcPaginaAtual;
    procedure CalcRubEspeciais;
  end;

var
  RptReciboAvisoFerias: TRptReciboAvisoFerias;

implementation

uses dCds, uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptReciboAvisoFerias.CrmRptCMBeforePrint(Sender: TObject);
var
  c: byte;
  DocID: array[1..3] of integer;
begin
  inherited;
  for c:=1 to 3 do
    DocID[c] := 0;

  // Documentos
  with (dmCds.sql) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''ESTADUAL:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CTPS:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'ESTADUAL:') then
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'MUNICIPAL:') then
        DocID[3] := FieldByName('IDDOCUMENTO').asInteger;
      Next;
    end;
  end;

  // Montar Query Auxiliar
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('Select X.*,         '); // Edilaine - SOL 180106 / KTN 1664886
    Add('       X.CARGO1 || DECODE(FN.TITULO, NULL, '''', ''/''||FN.TITULO) AS TITULO '); // Edilaine - SOL 180106 / KTN 1664886
    Add('From ( '); // Edilaine - SOL 180106 / KTN 1664886

    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  P.FLGDESCONTO AS TIPORUBRICA,');
    Add('  F.MATRICULA,');
    Add('  RTRIM(CC.NOME)AS NOMECENTROCUSTO,');
    Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
    Add('    ''Rescisao'','''',''Rescisão'','''',''13.o Salar'','''',H.REFERENCIA)) AS REFERENCIA,');
    Add('  DECODE(HST.IDFUNCAO,NULL,F.IDFUNCAO,HST.IDFUNCAO) AS IDFUNCAO, ');  // Edilaine - SOL 180106 / KTN 1664886
    Add('  C.TITULO AS CARGO1,');  // Edilaine - SOL 180106 / KTN 1664886 
    Add('  P.CODRUBCLT AS CODRUBRICA,');
    Add('  RP.CODPROVDESC AS CODRUBRICACLIENTE,');
    Add('  RTRIM(RP.DESCRPROVDESC) AS RUBRICA,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(CTPS.NUM) AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,NULL,NULL,''/'' || CTPS.UF) AS CTPS_UF,');
    Add('  CTPS.MASCARA AS MASCARA_CTPS,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(EP.LOGRADOURO) ||'', ''|| EP.NUMERO || DECODE(EP.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(EP.COMPLEMENTO)) ||'' - ''|| RTRIM(EP.BAIRRO) ||'' - ''|| RTRIM(CI.NOME) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(EP.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(EP.CEP,6,3)) AS ENDERECO,');
    Add('  H.VALORPROVENTO AS VALOR,');
    Add('  FERIAS.FLGABONO,');
    Add('  FERIAS.INIPERIODOFERIAS,');
    Add('  FERIAS.INIGOZOFERIAS,');
    Add('  FERIAS.FIMGOZOFERIAS,');
    Add('  (DECODE(SALCONTRA.SALARIOCONTRATUAL,NULL, F.SALARIOATUAL * (CASE');
    Add('                       WHEN F.TIPOPAGAMENTO = ''M'' THEN 1');
    Add('                       WHEN F.TIPOPAGAMENTO = ''D'' THEN 30');
    Add('                       WHEN F.TIPOPAGAMENTO = ''T'' THEN 1');
    Add('                       ELSE HT.JORNADAMENSAL');
    Add('                     END),SALCONTRA.SALARIOCONTRATUAL)) AS SALBASE,');

    if (CmpRptCM.ParamByName('ExibeMaiorRemuneracao').asBoolean) then
      Add('  NVL(MAIOR_REM.VALOR,0.00) AS MAIOR_REMUNERACAO')
    else
      Add('  0.00 AS MAIOR_REMUNERACAO');

    Add('FROM');
    Add('  ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PESSOA PJ, PESSOA PF,'+
      ' PROVDESC P, RUBRICAXPESS RP,');
    Add('  FUNCIONARIO F, ENDPESS EP, CENTCUST CC, CARGO C, CIDADES CI, HORATRAB HT,');
    // -------------------------------------------------------------------- //
    // Maior Remuneração
    if (CmpRptCM.ParamByName('ExibeMaiorRemuneracao').asBoolean) then
    begin
      Add('  (SELECT');
      Add('     H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
      Add('   FROM');
      Add('     ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P');
      Add('   WHERE');
      Add('     (P.CODRUBCLT  IN (''90007'',''63012'')) AND');

      // Funcionário(s) selecionado(s)
      if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
        Add(FU.MontaLinhaSelSQL('     (H.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString,2));

      Add('  (H.MES             = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
        FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');


      Add('     (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('TipoPagamento').asString+ ') AND');
      Add('     (P.IDPROVENTO = H.IDRUBRICA)');
      Add('   GROUP BY');
      Add('     H.IDPESSOA, P.IDPROVENTO) MAIOR_REM,');
    end;
    // -------------------------------------------------------------------------- //
    // Férias
    Add('  (SELECT');
    Add('     TO_CHAR(INIGOZOFERIAS,''YYYY/MM'') AS INIGOZO, IDPESSOA,');
    Add('     INIGOZOFERIAS, FIMGOZOFERIAS, FLGABONO, INIPERIODOFERIAS');
    Add('   FROM');
    Add('     FERIAS');
    Add('   WHERE');

    if (CmpRptCM.ParamByName('NomeTabela').asString = 'PREVIAFOLPAG') then
      Add('     (FLGOCORRIDA    = 0) AND')
    else
      Add('     (FLGOCORRIDA    = 1) AND');

    Add('     (INIGOZOFERIAS >= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('     (INIGOZOFERIAS <= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY''))) FERIAS,');
    // -------------------------------------------------------------------------- //
    // Última Evolução Funcional
    Add('  (SELECT');
    Add('     EF.IDCARGO, EF.IDFUNCAO, EF.IDPESSOA, EF.IDEMPRESA, EF.CODCENTROCUSTO');
    Add('   FROM');
    Add('     EVOLFUNC EF,');
    Add('     (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('      FROM   EVOLFUNC');
    Add('      WHERE (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY''))');
    Add('      GROUP BY IDPESSOA) HST2,');
    Add('     (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
    Add('      FROM   EVOLFUNC');
    Add('      WHERE (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY''))');
    Add('      GROUP BY IDPESSOA) HST3');
    Add('    WHERE  (EF.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('           (EF.IDPESSOA      = HST2.IDPESSOA) AND');
    Add('           (EF.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
    Add('           (EF.IDPESSOA      = HST3.IDPESSOA)) HST,');
    // -------------------------------------------------------------------------- //
    // CTPS
    Add('  (SELECT DP.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCPESSOA TDP, PAIS PA');
    Add('   WHERE (TDP.IDDOCUMENTO = ' +IntToStr(DocID[1])+ ') AND');
    Add('         (TDP.IDDOCUMENTO = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPAIS       = PA.IDPAIS) AND');
    Add('         (PA.IDPAIS       = ES.IDPAIS) AND');
    Add('         (DP.IDESTADO     = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // Salario Contratual (CLT = 60052)
    Add('  (SELECT DISTINCT');
    Add('     H.IDPESSOA, H.VALORPROVENTO AS SALARIOCONTRATUAL');
    Add('   FROM');
    Add('     ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P');
    Add('   WHERE');
    Add('  (H.MES             = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    Add('     (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('TipoPagamento').asString+ ') AND');
    Add('     (P.CODRUBCLT  = ''60052'') AND');
    Add('     (P.IDPROVENTO = H.IDRUBRICA)) SALCONTRA,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[2])+ ')) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[3])+ ')) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // Pessoa(s) selecionada(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (F.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString,7))
    else
    begin
      Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));

      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;
    end;

    Add('  (F.IDPESSOA        = FERIAS.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDHORARIO       = HT.IDHORARIO) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('  (H.IDMOTIVO        = ' +CmpRptCM.ParamByName('TipoPagamento').asString+ ') AND');
    Add('  (H.MES             = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    Add('  ((P.CODRUBCLT     <> ''60049'') OR');
    Add('   (P.CODRUBCLT     IS NULL)) AND');
    Add('  (C.IDCARGO         = DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO)) AND');
    Add('  (CC.CODCENTROCUSTO = DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) AND');
    Add('  (CC.IDEMPRESA      = DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA)) AND');
    Add('  (RP.IDRUBRICA      = H.IDRUBRICA) AND');
    Add('  (RP.IDPESSOA       = DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA)) AND');
    Add('  (H.IDRUBRICA       = P.IDPROVENTO) AND');

    if (CmpRptCM.ParamByName('ExibeMaiorRemuneracao').asBoolean) then
      Add('  (F.IDPESSOA        = MAIOR_REM.IDPESSOA(+)) AND');

    Add('  (F.IDPESSOA        = HST.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = SALCONTRA.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = EP.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL = EP.IDENDERECO(+)) AND');
    Add('  (EP.IDCIDADES      = CI.IDCIDADES(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  UPPER(EMPRESA), UPPER(EMPREGADO), INIGOZOFERIAS, TIPORUBRICA, CODRUBRICACLIENTE');
      1 : Add('  UPPER(EMPRESA), UPPER(NOMECENTROCUSTO), UPPER(EMPREGADO), INIGOZOFERIAS, TIPORUBRICA, CODRUBRICACLIENTE');
      2 : Add('  UPPER(EMPRESA), UPPER(NOMECENTROCUSTO), MATRICULA, INIGOZOFERIAS, TIPORUBRICA, CODRUBRICACLIENTE');
      3 : Add('  UPPER(EMPRESA), MATRICULA, FERIAS.INIGOZOFERIAS, TIPORUBRICA, CODRUBRICACLIENTE');
    end;

    Add(') X, CARGO FN '); // Edilaine - SOL 180106 / KTN 1664886
    Add('WHERE X.IDFUNCAO = FN.IDCARGO(+)  '); // Edilaine - SOL 180106 / KTN 1664886

    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.sql.Open;
  GerarDadosRelat;

  frmAguarde.Max := CdsReciboAvisoFerias.RecordCount;
  frmAguarde.Min := 0;

  if (Trim(dmCds.Cds.FieldByName('MASCARA_CTPS').asString) <> '') then
    rpReciboAvisoFeriasDBTextCTPS.DisplayFormat :=
      dmCds.Cds.FieldByName('MASCARA_CTPS').asString+';0;_';
end;

procedure TRptReciboAvisoFerias.CdsReciboAvisoFeriasAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptReciboAvisoFerias.rpReciboAvisoFeriasGrpHdrBnd0BeforePrint(Sender: TObject);
begin
  rpReciboAvisoFeriasLabelMAIOR_REM.Visible :=
    (CdsReciboAvisoFerias.FieldByName('MAIOR_REMUNERACAO').asFloat > 0);

  ReciboAvisoFeriasLbl1.Visible := (CdsReciboAvisoFerias.FieldByName('FLGABONO').asInteger = 1);
  rpRPFeriasMemo7.Visible := ReciboAvisoFeriasLbl1.Visible;

  ReciboAvisoFeriasLbl11.Caption := 'Período aquisitivo de '+
    CdsReciboAvisoFerias.FieldByName('INIPERIODOFERIAS').asString +
    ' a '+ CdsReciboAvisoFerias.FieldByName('FIMPERIODOFERIAS').asString;

  ReciboAvisoFeriasLbl12.Caption := 'Dias de duração: '+
    CdsReciboAvisoFerias.FieldByName('DIASDEFERIAS').asString;

  ReciboAvisoFeriasLbl13.Caption := 'Período de gozo de '+
    CdsReciboAvisoFerias.FieldByName('INIGOZOFERIAS').asString +
    ' a '+ CdsReciboAvisoFerias.FieldByName('FIMGOZOFERIAS').asString;
end;

procedure TRptReciboAvisoFerias.rpReciboAvisoFeriasSmryBnd1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptReciboAvisoFerias.GerarDadosRelat;
var
  dtPerAquiFinal: TDateTime;
  iNumTotPagina, iNumPagina, iNumPaginaAtual: integer;
begin
  CdsReciboAvisoFerias.IndexName := '';
  sqlReciboAvisoFerias.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    iNumTotPagina := 1;
    repeat
      repeat
        rBaseINSS := 0;
        rBaseFGTS := 0;
        rFGTSMes := 0;
        rBaseIRRF := 0;
        rProventos := 0;
        rDescontos := 0;
        sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
        sIniGozoFer := dmCds.Cds.FieldByName('INIGOZOFERIAS').asString;
        // Calcular o número de páginas do recibo atual do Empregado
        iNumPagina := GetNumPagReciboAtual;

        iNumPaginaAtual := 1;
        repeat
          CdsReciboAvisoFerias.Insert;
          CdsReciboAvisoFerias.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
          CdsReciboAvisoFerias.FieldByName('PAGINA').asInteger := iNumTotPagina;
          CdsReciboAvisoFerias.FieldByName('FOLHA').asString :=
            'Folha: '+ IntToStr(iNumPaginaAtual) +' de '+ IntToStr(iNumPagina);
          CdsReciboAvisoFerias.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
          CdsReciboAvisoFerias.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
          CdsReciboAvisoFerias.FieldByName('CARGO').asString := dmCds.Cds.FieldByName('TITULO').asString;
          CdsReciboAvisoFerias.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
          CdsReciboAvisoFerias.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;
          CdsReciboAvisoFerias.FieldByName('INSCRICAO').asString := dmCds.Cds.FieldByName('ESTADUALMUNICIPAL').asString;
          CdsReciboAvisoFerias.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
          CdsReciboAvisoFerias.FieldByName('INIPERIODOFERIAS').asString := dmCds.Cds.FieldByName('INIPERIODOFERIAS').asString;

          dtPerAquiFinal := StrToDate(FU.IncData(
            dmCds.Cds.FieldByName('INIPERIODOFERIAS').asString,0,0,1))-1;
          if (dtPerAquiFinal >= dmCds.Cds.FieldByName('INIGOZOFERIAS').asDateTime) then
            CdsReciboAvisoFerias.FieldByName('FIMPERIODOFERIAS').asString :=
              DateToStr(dmCds.Cds.FieldByName('INIGOZOFERIAS').asDateTime-1)
          else
            CdsReciboAvisoFerias.FieldByName('FIMPERIODOFERIAS').asString := DateToStr(dtPerAquiFinal);

          CdsReciboAvisoFerias.FieldByName('INIGOZOFERIAS').asString := dmCds.Cds.FieldByName('INIGOZOFERIAS').asString;
          CdsReciboAvisoFerias.FieldByName('FIMGOZOFERIAS').asString := dmCds.Cds.FieldByName('FIMGOZOFERIAS').asString;
          CdsReciboAvisoFerias.FieldByName('DIASDEFERIAS').asInteger :=
            (dmCds.Cds.FieldByName('FIMGOZOFERIAS').Value -
             dmCds.Cds.FieldByName('INIGOZOFERIAS').Value + 1);
          CdsReciboAvisoFerias.FieldByName('FLGABONO').asInteger := dmCds.Cds.FieldByName('FLGABONO').asInteger;
          CdsReciboAvisoFerias.FieldByName('CTPS_NUM').asString := dmCds.Cds.FieldByName('CTPS_NUM').asString;
          CdsReciboAvisoFerias.FieldByName('CTPS_UF').asString := dmCds.Cds.FieldByName('CTPS_UF').asString;

          rMaiorRem := dmCds.Cds.FieldByName('MAIOR_REMUNERACAO').asFloat;
          rSalBase := dmCds.Cds.FieldByName('SALBASE').asFloat;

          // Preencher cada linha da página com suas Rubricas
          CalcPaginaAtual;
          // Preencher o valor das Rubrica especiais
          CalcRubEspeciais;

          CdsReciboAvisoFerias.Post;
          Inc(iNumTotPagina);
          Inc(iNumPaginaAtual);
        until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
              (sIniGozoFer <> dmCds.Cds.FieldByName('INIGOZOFERIAS').asString) or
              (dmCds.Cds.EOF);
      until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
            (dmCds.Cds.EOF);
    until (dmCds.Cds.EOF);

    CdsReciboAvisoFerias.IndexName := 'CdsReciboAvisoFeriasIndex';
  end
  else
  begin
    CdsReciboAvisoFerias.Insert;
    CdsReciboAvisoFerias.Post;
  end;
  CdsReciboAvisoFerias.First;
end;

function TRptReciboAvisoFerias.GetNumPagReciboAtual: integer;
var
  iLin: integer;
  Marca: TBookmark;
begin
  Marca := dmCds.Cds.GetBookmark;
  Result := 1;
  iLin := 0;
  repeat
    if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) then
      Inc(iLin);

    if (iLin = 16) then
    begin
      iLin := 1;
      Inc(Result);
    end;
    dmCds.Cds.Next;
  until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
        (sIniGozoFer <> dmCds.Cds.FieldByName('INIGOZOFERIAS').asString) or
        (dmCds.Cds.EOF);
  dmCds.Cds.GotoBookmark(Marca);
  dmCds.Cds.FreeBookmark(Marca);
end;

procedure TRptReciboAvisoFerias.CalcPaginaAtual;
var
  iLin: integer;
  sIniGozoFer: string;
begin
  sIniGozoFer := dmCds.Cds.FieldByName('INIGOZOFERIAS').asString;
  iLin := 1;
  repeat
    if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) then
    begin
      CdsReciboAvisoFerias.FieldByName('CODRUBRICA'+IntToStr(iLin)).asString :=
        dmCds.Cds.FieldByName('CODRUBRICACLIENTE').asString;
      CdsReciboAvisoFerias.FieldByName('RUBRICA'+IntToStr(iLin)).asString :=
        dmCds.Cds.FieldByName('RUBRICA').asString;
      CdsReciboAvisoFerias.FieldByName('REFERENCIA'+IntToStr(iLin)).asString :=
        dmCds.Cds.FieldByName('REFERENCIA').asString;

      if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger = 0) then
      begin
        CdsReciboAvisoFerias.FieldByName('PROVENTO'+IntToStr(iLin)).asFloat :=
          dmCds.Cds.FieldByName('VALOR').asFloat;
        rProventos := rProventos + dmCds.Cds.FieldByName('VALOR').asFloat;
      end
      else
      begin
        CdsReciboAvisoFerias.FieldByName('DESCONTO'+IntToStr(iLin)).asFloat :=
          dmCds.Cds.FieldByName('VALOR').asFloat;
        rDescontos := rDescontos + dmCds.Cds.FieldByName('VALOR').asFloat;
      end;
      Inc(iLin);
    end
    else
    begin
      // Base do INSS
      if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60017') then
        rBaseINSS := rBaseINSS + dmCds.Cds.FieldByName('VALOR').asFloat
      else
      // FGTS do Mês
      if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '40695') or
         (dmCds.Cds.FieldByName('CODRUBRICA').asString = '43696') or
         (dmCds.Cds.FieldByName('CODRUBRICA').asString = '43700') then
        rFGTSMes := rFGTSMes + dmCds.Cds.FieldByName('VALOR').asFloat
      else
      // Base do FGTS
      if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60695') or
         (dmCds.Cds.FieldByName('CODRUBRICA').asString = '62022') then
        rBaseFGTS := rBaseFGTS + dmCds.Cds.FieldByName('VALOR').asFloat
      else
      // Base do IRRF
      if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60026') then
        rBaseIRRF := rBaseIRRF + dmCds.Cds.FieldByName('VALOR').asFloat;
    end;
    dmCds.Cds.Next;
  until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
        (sIniGozoFer <> dmCds.Cds.FieldByName('INIGOZOFERIAS').asString) or
        (dmCds.Cds.EOF) or
        ((sMatricula = dmCds.Cds.FieldByName('MATRICULA').asString) and
         (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) and
         (iLin = 16));
end;

procedure TRptReciboAvisoFerias.CalcRubEspeciais;
begin
  if (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
     (sIniGozoFer <> dmCds.Cds.FieldByName('INIGOZOFERIAS').asString) or
     (dmCds.Cds.EOF) then
  begin
    CdsReciboAvisoFerias.FieldByName('MAIOR_REMUNERACAO').asFloat := rMaiorRem;
    CdsReciboAvisoFerias.FieldByName('SALBASE').asFloat := rSalBase;
    CdsReciboAvisoFerias.FieldByName('BASEINSS').asFloat := rBaseINSS;
    CdsReciboAvisoFerias.FieldByName('BASEFGTS').asFloat := rBaseFGTS;
    CdsReciboAvisoFerias.FieldByName('FGTSMES').asFloat := rFGTSMes;
    CdsReciboAvisoFerias.FieldByName('BASEIRRF').asFloat := rBaseIRRF;
    CdsReciboAvisoFerias.FieldByName('TOT_PROVENTOS').asFloat := rProventos;
    CdsReciboAvisoFerias.FieldByName('TOT_DESCONTOS').asFloat := rDescontos;
    CdsReciboAvisoFerias.FieldByName('TOT_GERAL').asString :=
      FU.ValStr(rProventos - rDescontos,12,2,true,',');

    ExtensoCM.Valor := (rProventos - rDescontos);
    ExtensoCM.Escreve;
    CdsReciboAvisoFerias.FieldByName('DESC_TOT_GERAL').asString :=
      'Total Líquido por Extenso: '+ExtensoCM.Extenso;
  end
  else
    CdsReciboAvisoFerias.FieldByName('TOT_GERAL').asString := 'CONTINUA       ';
end;

end.
