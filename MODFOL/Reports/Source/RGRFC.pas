// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RGRFC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, TXRB;

type
  TRptGRFC = class(TFrmCmReport)
    rpGRFC: TppReport;
    rpGRFCDtlBnd: TppDetailBand;
    rpGRFCShape4: TppShape;
    rpGRFCShape5: TppShape;
    rpGRFCShape3: TppShape;
    rpGRFCShape1: TppShape;
    rpGRFCShape2: TppShape;
    rpGRFCLbl5: TppLabel;
    rpGRFCLbl7: TppLabel;
    rpGRFCLine7: TppLine;
    rpGRFCLbl6: TppLabel;
    rpGRFCLine16: TppLine;
    rpGRFCLine17: TppLine;
    rpGRFCLbl4: TppLabel;
    rpGRFCLbl3: TppLabel;
    rpGRFCLine18: TppLine;
    rpGRFCLine6: TppLine;
    rpGRFCLine12: TppLine;
    rpGRFCLbl1: TppLabel;
    rpGRFCLbl2: TppLabel;
    rpGRFCLine5: TppLine;
    rpGRFCDBTxt1: TppDBText;
    rpGRFCDBTxt3: TppDBText;
    rpGRFCDBTxt4: TppDBText;
    rpGRFCDBTxt5: TppDBText;
    rpGRFCDBTxt2: TppDBText;
    rpGRFCLine8: TppLine;
    rpGRFCLine4: TppLine;
    rpGRFCLine9: TppLine;
    rpGRFCLine10: TppLine;
    rpGRFCLine11: TppLine;
    rpGRFCLbl8: TppLabel;
    rpGRFCDBTxt6: TppDBText;
    rpGRFCLine13: TppLine;
    rpGRFCLine14: TppLine;
    rpGRFCLine15: TppLine;
    rpGRFCLine19: TppLine;
    rpGRFCLbl9: TppLabel;
    rpGRFCDBTxt7: TppDBText;
    rpGRFCLine20: TppLine;
    rpGRFCLbl12: TppLabel;
    rpGRFCDBTxt10: TppDBText;
    rpGRFCLbl10: TppLabel;
    rpGRFCLine27: TppLine;
    rpGRFCDBTxt8: TppDBText;
    rpGRFCLbl11: TppLabel;
    rpGRFCDBTxt9: TppDBText;
    rpGRFCLine21: TppLine;
    rpGRFCLine22: TppLine;
    rpGRFCLine23: TppLine;
    rpGRFCLine24: TppLine;
    rpGRFCLbl13: TppLabel;
    rpGRFCDBTxt11: TppDBText;
    rpGRFCLine25: TppLine;
    rpGRFCLbl14: TppLabel;
    rpGRFCDBTxt12: TppDBText;
    rpGRFCLine26: TppLine;
    rpGRFCLine28: TppLine;
    rpGRFCLbl15: TppLabel;
    rpGRFCLbl16: TppLabel;
    rpGRFCLbl17: TppLabel;
    rpGRFCLine31: TppLine;
    rpGRFCLine29: TppLine;
    rpGRFCLine32: TppLine;
    rpGRFCLine33: TppLine;
    rpGRFCLine1: TppLine;
    rpGRFCLine3: TppLine;
    rpGRFCLine2: TppLine;
    rpGRFCImg1: TppImage;
    rpGRFCShape10: TppShape;
    rpGRFCShape8: TppShape;
    rpGRFCShape6: TppShape;
    rpGRFCShape7: TppShape;
    rpGRFCDBTxt13: TppDBText;
    rpGRFCDBTxt14: TppDBText;
    rpGRFCDBTxt15: TppDBText;
    rpGRFCLine30: TppLine;
    rpGRFCLbl18: TppLabel;
    rpGRFCLine34: TppLine;
    rpGRFCLbl19: TppLabel;
    rpGRFCLine35: TppLine;
    rpGRFCDBTxt16: TppDBText;
    rpGRFCLine36: TppLine;
    rpGRFCLbl20: TppLabel;
    rpGRFCDBTextPIS: TppDBText;
    rpGRFCDBTxt17: TppDBText;
    rpGRFCLbl21: TppLabel;
    rpGRFCLbl22: TppLabel;
    rpGRFCDBTxt18: TppDBText;
    rpGRFCLbl23: TppLabel;
    rpGRFCDBTxt19: TppDBText;
    rpGRFCLbl24: TppLabel;
    rpGRFCLine37: TppLine;
    rpGRFCLine38: TppLine;
    rpGRFCLine39: TppLine;
    rpGRFCLine40: TppLine;
    rpGRFCLine41: TppLine;
    rpGRFCLine42: TppLine;
    rpGRFCLine43: TppLine;
    rpGRFCLine44: TppLine;
    rpGRFCLbl25: TppLabel;
    rpGRFCDBTxt21: TppDBText;
    rpGRFCMemo1: TppMemo;
    rpGRFCLine45: TppLine;
    rpGRFCDBTxt22: TppDBText;
    rpGRFCLine46: TppLine;
    rpGRFCLine47: TppLine;
    rpGRFCMemo2: TppMemo;
    rpGRFCLbl26: TppLabel;
    rpGRFCDBTxt23: TppDBText;
    rpGRFCLbl27: TppLabel;
    rpGRFCDBTextCTPS_NUM: TppDBText;
    rpGRFCDBTxt24: TppDBText;
    rpGRFCLbl28: TppLabel;
    rpGRFCDBTxt25: TppDBText;
    rpGRFCLine48: TppLine;
    rpGRFCLine49: TppLine;
    rpGRFCLine50: TppLine;
    rpGRFCLine51: TppLine;
    rpGRFCLine52: TppLine;
    rpGRFCMemo3: TppMemo;
    rpGRFCLbl30: TppLabel;
    rpGRFCLbl31: TppLabel;
    rpGRFCLbl29: TppLabel;
    rpGRFCLine53: TppLine;
    rpGRFCLine54: TppLine;
    rpGRFCLine59: TppLine;
    rpGRFCLine55: TppLine;
    rpGRFCLine56: TppLine;
    rpGRFCLine57: TppLine;
    rpGRFCLine58: TppLine;
    rpGRFCLbl32: TppLabel;
    rpGRFCLbl33: TppLabel;
    rpGRFCLbl34: TppLabel;
    rpGRFCShape9: TppShape;
    rpGRFCMemo4: TppMemo;
    rpGRFCLbl35: TppLabel;
    rpGRFCLbl36: TppLabel;
    rpGRFCLbl37: TppLabel;
    rpGRFCLine60: TppLine;
    rpGRFCLine61: TppLine;
    rpGRFCLine62: TppLine;
    rpGRFCLine63: TppLine;
    rpGRFCLine64: TppLine;
    rpGRFCLine65: TppLine;
    rpGRFCLbl38: TppLabel;
    rpGRFCLbl39: TppLabel;
    rpGRFCLbl40: TppLabel;
    rpGRFCLine66: TppLine;
    rpGRFCDBTxt20: TppDBText;
    rpGRFCDBTxt36: TppDBText;
    rpGRFCLine67: TppLine;
    rpGRFCLbl41: TppLabel;
    rpGRFCLine68: TppLine;
    rpGRFCLbl42: TppLabel;
    rpGRFCLbl43: TppLabel;
    rpGRFCLine69: TppLine;
    rpGRFCDBTxt26: TppDBText;
    rpGRFCDBTxt27: TppDBText;
    rpGRFCDBTxt28: TppDBText;
    rpGRFCDBTxt29: TppDBText;
    rpGRFCDBTxt30: TppDBText;
    rpGRFCDBTxt31: TppDBText;
    rpGRFCDBTxt32: TppDBText;
    rpGRFCDBTxt33: TppDBText;
    rpGRFCDBTxt34: TppDBText;
    rpGRFCDBTxt35: TppDBText;
    rpGRFCSmryBnd: TppSummaryBand;
    ppGRFC: TppBDEPipeline;
    dsGRFC: TwwDataSource;
    sqlGRFC: TCMSqlParams;
    CdsGRFC: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsGRFCAfterScroll(DataSet: TDataSet);
    procedure rpGRFCSmryBndAfterPrint(Sender: TObject);
  private
    sAnoMes, sAno: string;

    procedure GerarDadosRelat;
  end;

var
  RptGRFC: TRptGRFC;

implementation

uses uSistema, dCds, uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptGRFC.CrmRptCMBeforePrint(Sender: TObject);
var
  c: integer;
  DocID: array[1..3] of integer;
  sQueryRecFGTS, sListaIdRubrica, sListaIdRubricaAtual: string;
begin
  inherited;
  sAno := CmpRptCM.ParamByName('AnoRef').asString;
  sAnoMes := sAno +'/'+ FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger);

  for c:=1 to 3 do
    DocID[c] := 0;

  // Documentos
  with (dmCds.sql) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CTPS:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CEI:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''PIS:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  while not(dmCds.Cds.EOF) do
  begin
    if (dmCds.Cds.FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
      DocID[1] := dmCds.Cds.FieldByName('IDDOCUMENTO').asInteger
    else
    if (dmCds.Cds.FieldByName('SIGLADOCUMENTO').asString = 'PIS:') or
       (dmCds.Cds.FieldByName('SIGLADOCUMENTO').asString = 'PIS/PASEP:') then
      DocID[2] := dmCds.Cds.FieldByName('IDDOCUMENTO').asInteger
    else
    if (dmCds.Cds.FieldByName('SIGLADOCUMENTO').asString = 'CEI:') then
      DocID[3] := dmCds.Cds.FieldByName('IDDOCUMENTO').asInteger;

    dmCds.Cds.Next;
  end;

  if (CmpRptCM.ParamByName('ListaIdRubrica1').asString <> '') then
    sQueryRecFGTS := sQueryRecFGTS + CmpRptCM.ParamByName('ListaIdRubrica1').asString +',';

  sQueryRecFGTS := sQueryRecFGTS +
    CmpRptCM.ParamByName('ListaIdRubrica2').asString +','+
    CmpRptCM.ParamByName('ListaIdRubrica3').asString +','+
    CmpRptCM.ParamByName('ListaIdRubrica4').asString;

  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados do Estabelecimento
    Add('  UPPER(RTRIM(PJ.RAZAOSOCIAL)) AS EMPRESA,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,'''',PJ.NUMDOCUMENTO) AS INSCRICAO,');
    Add('  TEL.DDD AS DDD,');
    Add('  TEL.NUMERO AS TELEFONE,');
    Add('  UPPER(RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO))) AS ENDERECO,');
    Add('  UPPER(E.BAIRRO) AS BAIRRO,');
    Add('  UPPER(CIDADES.NOME) AS CIDADE,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  FP.IDFPAS AS FPAS,');
    Add('  DECODE(F.TIPOCONTRATO,''3'',');
    Add('    DECODE(PF.NUMDOCUMENTO,NULL,'''',PF.NUMDOCUMENTO),');
    Add('    ''A'', CEI_TOMADOR.NUM,'''') AS INSCRICAO_TOMADOR,');
    Add('  UPPER(DECODE(F.TIPOCONTRATO,''3'',RTRIM(PF.NOME),''A'',RTRIM(PF.NOME),'''')) AS NOME_TOMADOR,');
    // Dados do Contato do Estabelecimento
    Add('  UPPER(SUBSTR('+QuotedStr(CmpRptCM.ParamByName('NomeResponsavel').asString)+
      ',1,30)) AS CONTATO_NOME,');
    // Dados do Empregado
    Add('  F.MATRICULA,');
    Add('  UPPER(RTRIM(PF.NOME)) AS EMPREGADO,');
    Add('  RTRIM(CTPS.NUM) AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,'''','''',''/''||CTPS.UF) AS CTPS_UF,');
    Add('  CTPS.MASCARA AS MASCARA_CTPS,');
    Add('  PIS.NUM AS PIS,');
    Add('  PIS.MASCARA AS MASCARA_PIS,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
    Add('  TO_CHAR(F.DATAOPCAOFGTS,''DD/MM/YYYY'') AS DATAOPCAOFGTS,');
    Add('  TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'') AS DATADESLIGAMENTO,');
    Add('  TO_CHAR(PFIS.DATANASC,''DD/MM/YYYY'') AS DATANASC,');
    Add('  DECODE(F.DATADESLIGAMENTO,F.DATAAVISO,''2'',DECODE(F.DATAAVISO,'''',''3'',''1'')) AS TIPO_AVISO,');
    Add('  NVL(F.IDCATEMPRGRE,1) AS CATEGORIA,');
    { Código da Rescisão
    I1 - Rescisão, sem justa causa, por iniciativa do empregador, inclusive a rescisão
         antecipada de contrato a termo
    I2 - Rescisão, por culpa recíproca ou força maior
    I3 - Rescisão por término de contrato de trabalho por prazo determinado
    I4 - Rescisão, sem justa causa, do contrato de trabalho do trabalhador doméstico,
         por iniciativa do empregador
    L  - Outros motivos de rescisão do contrato de trabalho
    S  - Falecimento}
    Add('  MO.MOTIVOFGTS,');
    Add('  P.FLGDESCONTO,');
    
    // Cálculos da guia
    // Remuneração mês anterior à rescisão
    if not(CmpRptCM.ParamByName('FGTSRecolhidoMesAnt').asBoolean) then
    begin
      Add('  NVL(DECODE(H.MES,'+QuotedStr(FU.IncDataAM(sAnoMes,-1))+',');
      Add('    DECODE(RP.CODPROVDESC,');
      c := 1;
      sListaIdRubrica := CmpRptCM.ParamByName('ListaIdRubrica1').asString;
      while (sListaIdRubrica <> '') do
      begin
        FU.ExtraiString(sListaIdRubrica, sListaIdRubricaAtual, ',');

        if (c = 1) then
        begin
          Add('      '+sListaIdRubricaAtual+',H.VALORPROVENTO');
          Inc(c);
        end
        else
          Add('      ,'+sListaIdRubricaAtual+',H.VALORPROVENTO');
      end;
      Add('  )),0) AS REM_MES_ANT,');
    end
    else
      Add('  (0) AS REM_MES_ANT,');

    // Remuneração mês de rescisão
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(RP.CODPROVDESC,');
    c := 1;
    sListaIdRubrica := CmpRptCM.ParamByName('ListaIdRubrica2').asString;
    while (sListaIdRubrica <> '') do
    begin
      FU.ExtraiString(sListaIdRubrica, sListaIdRubricaAtual, ',');

      if (c = 1) then
      begin
        Add('      '+sListaIdRubricaAtual+',H.VALORPROVENTO');
        Inc(c);
      end
      else
        Add('      ,'+sListaIdRubricaAtual+',H.VALORPROVENTO');
    end;
    Add('  )),0) AS REM_MES_RES,');

    // Aviso prévio indenizado
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(RP.CODPROVDESC,');
    c := 1;
    sListaIdRubrica := CmpRptCM.ParamByName('ListaIdRubrica3').asString;
    while (sListaIdRubrica <> '') do
    begin
      FU.ExtraiString(sListaIdRubrica, sListaIdRubricaAtual, ',');

      if (c = 1) then
      begin
        Add('      '+sListaIdRubricaAtual+',H.VALORPROVENTO');
        Inc(c);
      end
      else
        Add('      ,'+sListaIdRubricaAtual+',H.VALORPROVENTO');
    end;
    Add('  )),0) AS AVISO_PREVIO,');

    // Saldo para fins rescisórios
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(RP.CODPROVDESC,');
    c := 1;
    sListaIdRubrica := CmpRptCM.ParamByName('ListaIdRubrica4').asString;
    while (sListaIdRubrica <> '') do
    begin
      FU.ExtraiString(sListaIdRubrica, sListaIdRubricaAtual, ',');

      if (c = 1) then
      begin
        Add('      '+sListaIdRubricaAtual+',H.VALORPROVENTO');
        Inc(c);
      end
      else
        Add('      ,'+sListaIdRubricaAtual+',H.VALORPROVENTO');
    end;
    Add('  )),0) AS SALDO_RES,');

    // Multa Rescisória
    Add('  NVL(DECODE(H.MES,'+QuotedStr(sAnoMes)+',');
    Add('    DECODE(P.CODRUBCLT,''43689'',H.VALORPROVENTO)),0) AS MULTA_RES,');

    // Adiantamentos 13º
    if (CmpRptCM.ParamByName('ListaIdRubrica5').asString <> '') then
      Add('  VLR_ADTO13.VALOR AS ADTO13')
    else
      Add('  (0) ADTO13');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  '+CmpRptCM.ParamByName('NomeTabela').asString+' H, PESSOA PJ, PESSOA PF,'+
      ' PESSOAFISICA PFIS, RUBRICAXPESS RP, PROVDESC P,');
    Add('  ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, FPAS,');
    Add('  MOTIVO MO, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // Valor do Adiantamento do 13º
    if (CmpRptCM.ParamByName('ListaIdRubrica5').asString <> '') then
    begin
      Add('  (SELECT H.IDPESSOA,');
      Add('          SUM(DECODE(PD.FLGDESCONTO,0,H.VALORPROVENTO,1,-H.VALORPROVENTO)) AS VALOR');
      Add('   FROM   HISTRUBSAL H, PROVDESC PD');
      Add('   WHERE');

      if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
          Add('         (H.IDPESSOA    IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
        else
          Add('         (H.IDPESSOA     = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

      if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica5').asString) > 0) then
        Add('         (H.CODPROVDESC IN (' +CmpRptCM.ParamByName('ListaIdRubrica5').asString+ ')) AND')
      else
        Add('         (H.CODPROVDESC  = ' +CmpRptCM.ParamByName('ListaIdRubrica5').asString+ ') AND');

      Add('         (H.MES         >= ' +QuotedStr(sAno+'/01')+ ') AND');
      Add('         (H.MES         <= ' +QuotedStr(sAno+'/12')+ ') AND');
      Add('         (H.IDPESSJUR    = ' +FloatToStr(Sistema.IdEmpresa)+ ') AND');
      Add('         (H.IDRUBRICA    = PD.IDPROVENTO)');
      Add('   GROUP BY');
      Add('     H.IDPESSOA) VLR_ADTO13,');
    end;
    // -------------------------------------------------------------------------- //
    // Telefone do Estabelecimento
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TEL,');
    // -------------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, RTRIM(DP.NUMDOCUMENTO) AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, ESTADO ES, TIPODOCPESSOA TDP');
    Add('   WHERE (DP.IDDOCUMENTO = ' +IntToStr(DocID[1])+ ') AND');
    Add('         (DP.IDDOCUMENTO = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA    = F.IDPESSOA) AND');
    Add('         (DP.IDESTADO    = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, RTRIM(DP.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCPESSOA TDP');
    Add('   WHERE (DP.IDDOCUMENTO = ' +IntToStr(DocID[2])+ ') AND');
    Add('         (DP.IDDOCUMENTO = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA    = F.IDPESSOA)) PIS,');
    // -------------------------------------------------------------------------- //
    // CEI do Tomador de Serviços
    Add('  (SELECT F.IDPESSOA, RTRIM(DP.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCPESSOA TDP');
    Add('   WHERE (DP.IDDOCUMENTO = ' +IntToStr(DocID[3])+ ') AND');
    Add('         (DP.IDDOCUMENTO = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA    = F.IDPESSOA)) CEI_TOMADOR');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    // Estabelecimento selecionado
    Add('  (PJ.IDPESSOA         = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');

    // Funcionário selecionado
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (PF.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (PF.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
    end;

    Add('  ((P.CODRUBCLT       = ''43689'') OR');
    Add('   (RP.CODPROVDESC   IN (' +sQueryRecFGTS+ '))) AND');
    Add('  (RP.IDPESSOA        = ' +FloatToStr(Sistema.IdEmpresa)+ ') AND');

    // Selecionou Recolhimento de FGTS no mês anterior ?
    if not(CmpRptCM.ParamByName('FGTSRecolhidoMesAnt').asBoolean) then
    begin
      Add('  ((H.MES             = ' +QuotedStr(FU.IncDataAM(sAnoMes,-1))+ ') OR');
      Add('   (H.MES             = ' +QuotedStr(sAnoMes)+ ')) AND');
    end
    else
      Add('  (H.MES             = ' +QuotedStr(sAnoMes)+ ') AND');

    Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO) AND');
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (PF.IDPESSOA       = H.IDPESSOA) AND');
    Add('  (P.IDPROVENTO      = RP.IDRUBRICA) AND');
    Add('  (P.IDPROVENTO      = H.IDRUBRICA) AND');
    Add('  (FP.IDFPAS         = FPAS.IDFPAS) AND');
    Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PIS.IDPESSOA) AND');
    Add('  (FP.IDFILIALPESSOA = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');

    // Selecionou Adiantamento de 13º?
    if (CmpRptCM.ParamByName('ListaIdRubrica5').asString <> '') then
      Add('  (F.IDPESSOA        = VLR_ADTO13.IDPESSOA(+)) AND');

    Add('  (PJ.IDENDCOMERCIAL = TEL.IDENDERECO(+)) AND');
    Add('  (PF.IDPESSOA       = CEI_TOMADOR.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  UPPER(EMPREGADO)');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.sql.Open;

  // Monta Query Principal  
  GerarDadosRelat;

  frmAguarde.Max := CdsGRFC.RecordCount;
  frmAguarde.Min := 0;

  // Especifico a máscara dos Documentos
  if (Trim(dmCds.Cds.FieldByName('MASCARA_CTPS').asString) <> '') then
    rpGRFCDBTextCTPS_NUM.DisplayFormat := dmCds.Cds.FieldByName('MASCARA_CTPS').asString+';0;_';

  if (Trim(dmCds.Cds.FieldByName('MASCARA_PIS').asString) <> '') then
    rpGRFCDBTextPIS.DisplayFormat := dmCds.Cds.FieldByName('MASCARA_PIS').asString+';0;_';
end;

procedure TRptGRFC.CdsGRFCAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptGRFC.rpGRFCSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptGRFC.GerarDadosRelat;
var
  sMesAnt, sMatrFunc: string;
  dIndiceRecAtraso: double;
  rRemMesAnt, rRemMesRes, rAvisoPrevio, rSaldoRes, rMultaRes: real;
begin
  sqlGRFC.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    repeat
      CdsGRFC.Insert;
      CdsGRFC.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
      CdsGRFC.FieldByName('INSCRICAO').asString := dmCds.Cds.FieldByName('INSCRICAO').asString;
      CdsGRFC.FieldByName('CONTATO_NOME').asString := dmCds.Cds.FieldByName('CONTATO_NOME').asString;
      CdsGRFC.FieldByName('DDD').asString := dmCds.Cds.FieldByName('DDD').asString;
      CdsGRFC.FieldByName('TELEFONE').asString := dmCds.Cds.FieldByName('TELEFONE').asString;
      CdsGRFC.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
      CdsGRFC.FieldByName('BAIRRO').asString := dmCds.Cds.FieldByName('BAIRRO').asString;
      CdsGRFC.FieldByName('CIDADE').asString := dmCds.Cds.FieldByName('CIDADE').asString;
      CdsGRFC.FieldByName('UF').asString := dmCds.Cds.FieldByName('UF').asString;
      CdsGRFC.FieldByName('CEP').asString := dmCds.Cds.FieldByName('CEP').asString;
      CdsGRFC.FieldByName('INSCRICAO_TOMADOR').asString := dmCds.Cds.FieldByName('INSCRICAO_TOMADOR').asString;
      CdsGRFC.FieldByName('NOME_TOMADOR').asString := dmCds.Cds.FieldByName('NOME_TOMADOR').asString;
      CdsGRFC.FieldByName('FPAS').asString := dmCds.Cds.FieldByName('FPAS').asString;
      CdsGRFC.FieldByName('SIMPLES').asInteger := 1;
      CdsGRFC.FieldByName('CNAE').asString := dmCds.Cds.FieldByName('CNAE').asString;
      CdsGRFC.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsGRFC.FieldByName('PIS').asString := dmCds.Cds.FieldByName('PIS').asString;
      CdsGRFC.FieldByName('DATAADMISSAO').asString := dmCds.Cds.FieldByName('DATAADMISSAO').asString;
      CdsGRFC.FieldByName('CATEGORIA').asString := dmCds.Cds.FieldByName('CATEGORIA').asString;
      CdsGRFC.FieldByName('DATADESLIGAMENTO').asString := dmCds.Cds.FieldByName('DATADESLIGAMENTO').asString;
      CdsGRFC.FieldByName('CODIGO_MOV').asString := Trim(dmCds.Cds.FieldByName('MOTIVOFGTS').asString);
      CdsGRFC.FieldByName('TIPO_AVISO').asString := dmCds.Cds.FieldByName('TIPO_AVISO').asString;

      if (CmpRptCM.ParamByName('ReferenteDissidio').asBoolean) then
        CdsGRFC.FieldByName('DISSIDIO').asString := CmpRptCM.ParamByName('DataDissidio').asString
      else
        CdsGRFC.FieldByName('DISSIDIO').asString := '';

      CdsGRFC.FieldByName('DATANASC').asString := dmCds.Cds.FieldByName('DATANASC').asString;
      CdsGRFC.FieldByName('CTPS_NUM').asString := dmCds.Cds.FieldByName('CTPS_NUM').asString;
      CdsGRFC.FieldByName('CTPS_UF').asString := dmCds.Cds.FieldByName('CTPS_UF').asString;
      CdsGRFC.FieldByName('DATAOPCAOFGTS').asString := dmCds.Cds.FieldByName('DATAOPCAOFGTS').asString;
      CdsGRFC.FieldByName('LOCAL_DATA').asString := dmCds.Cds.FieldByName('CIDADE').asString +
        '  ' + Copy(CmpRptCM.ParamByName('DataEmissao').asString,1,2) +', '+
        FU.MesExtensoAno(Copy(CmpRptCM.ParamByName('DataEmissao').asString,7,4) +'/'+
        Copy(CmpRptCM.ParamByName('DataEmissao').asString,4,2));

      sMatrFunc := dmCds.Cds.FieldByName('MATRICULA').asString;
      sMesAnt := Copy(FU.IncDataAM(sAnoMes,-1),6,2)+'/'+Copy(FU.IncDataAM(sAnoMes,-1),1,4);
      rRemMesAnt := 0;
      rRemMesRes := 0;
      rAvisoPrevio := 0;
      rSaldoRes := 0;
      rMultaRes := 0;

      repeat
        if (dmCds.Cds.FieldByName('FLGDESCONTO').asString = '1') then
        begin
          rRemMesAnt := rRemMesAnt - dmCds.Cds.FieldByName('REM_MES_ANT').asFloat;
          rRemMesRes := rRemMesRes - dmCds.Cds.FieldByName('REM_MES_RES').asFloat;
          rAvisoPrevio := rAvisoPrevio - dmCds.Cds.FieldByName('AVISO_PREVIO').asFloat;
          rSaldoRes := rSaldoRes - dmCds.Cds.FieldByName('SALDO_RES').asFloat;
          rMultaRes := rMultaRes - dmCds.Cds.FieldByName('MULTA_RES').asFloat;
        end
        else
        begin
          rRemMesAnt := rRemMesAnt + dmCds.Cds.FieldByName('REM_MES_ANT').asFloat;
          rRemMesRes := rRemMesRes + dmCds.Cds.FieldByName('REM_MES_RES').asFloat;
          rAvisoPrevio := rAvisoPrevio + dmCds.Cds.FieldByName('AVISO_PREVIO').asFloat;
          rSaldoRes := rSaldoRes + dmCds.Cds.FieldByName('SALDO_RES').asFloat;
          rMultaRes := rMultaRes + dmCds.Cds.FieldByName('MULTA_RES').asFloat;
        end;

        dmCds.Cds.Next;
      until (dmCds.Cds.EOF) or
            (dmCds.Cds.FieldByName('MATRICULA').asString <> sMatrFunc);

      rRemMesRes := rRemMesRes - dmCds.Cds.FieldByName('ADTO13').asFloat;

      CdsGRFC.FieldByName('REM_MES_ANT').asFloat := rRemMesAnt;
      CdsGRFC.FieldByName('REM_MES_RES').asFloat := rRemMesRes;
      CdsGRFC.FieldByName('AVISO_PREVIO').asFloat := rAvisoPrevio;
      CdsGRFC.FieldByName('SALDO_RES').asFloat := rSaldoRes;
      CdsGRFC.FieldByName('SOMA25A28').asFloat := rRemMesAnt + rRemMesRes +
        rAvisoPrevio + rSaldoRes;

      // Índice para cálculo em atraso
{      if (CdsGRFC.FieldByName('CATEGORIA').asInteger in [1,3,5]) then
        dIndiceRecAtraso := 1.0625
      else
        dIndiceRecAtraso := 0.3125;}

      // Mês anterior à rescisão
      if (CmpRptCM.ParamByName('IndiceRecAtrasoRecolh1').asFloat = 0) then
        rRemMesAnt := rRemMesAnt * (CmpRptCM.ParamByName('PercentualRec').asFloat / 100)
      else
      begin
        //dIndiceRecAtraso := dIndiceRecAtraso * CmpRptCM.ParamByName('IndiceRecAtrasoRecolh1').asFloat;
        dIndiceRecAtraso := CmpRptCM.ParamByName('IndiceRecAtrasoRecolh1').asFloat;
        rRemMesAnt := Trunc(rRemMesAnt * dIndiceRecAtraso * 100) / 100;
      end;

      // Mês anterior da rescisão e Aviso Prévio
      if (CmpRptCM.ParamByName('IndiceRecAtrasoRecolh2').asFloat = 0) then
      begin
        rRemMesRes := rRemMesRes * (CmpRptCM.ParamByName('PercentualRec').asFloat / 100);
        rAvisoPrevio := rAvisoPrevio * (CmpRptCM.ParamByName('PercentualRec').asFloat / 100);
      end
      else
      begin
        //dIndiceRecAtraso := dIndiceRecAtraso * CmpRptCM.ParamByName('IndiceRecAtrasoRecolh2').asFloat;
        dIndiceRecAtraso := CmpRptCM.ParamByName('IndiceRecAtrasoRecolh2').asFloat;
        rRemMesRes := Trunc(rRemMesRes * dIndiceRecAtraso * 100) / 100;
        rAvisoPrevio := Trunc(rAvisoPrevio * dIndiceRecAtraso * 100) / 100;
      end;

      // Multa Rescisória
      if (CmpRptCM.ParamByName('IndiceRecAtrasoMultaRes').asFloat > 0) then
      begin
        {if (CdsGRFC.FieldByName('CODIGO_MOV').asString = 'I1') then
          dIndiceRecAtraso := CmpRptCM.ParamByName('IndiceRecAtrasoMultaRes').asFloat
        else
        if (CdsGRFC.FieldByName('CODIGO_MOV').asString = 'I2') then
          dIndiceRecAtraso := CmpRptCM.ParamByName('IndiceRecAtrasoMultaRes').asFloat * 0.4
        else
        if (CdsGRFC.FieldByName('CODIGO_MOV').asString = 'I3') then
          dIndiceRecAtraso := 0 // Não é devida a multa rescisória
        else
        if (CdsGRFC.FieldByName('CODIGO_MOV').asString = 'I4') or
           (CdsGRFC.FieldByName('CODIGO_MOV').asString = 'L') then
          dIndiceRecAtraso := CmpRptCM.ParamByName('IndiceRecAtrasoMultaRes').asFloat * 0.8;}

        dIndiceRecAtraso := CmpRptCM.ParamByName('IndiceRecAtrasoMultaRes').asFloat;
        rMultaRes := Trunc(rMultaRes * dIndiceRecAtraso * 100) / 100;
      end;

      CdsGRFC.FieldByName('REM_MES_ANT2').asFloat := rRemMesAnt;
      CdsGRFC.FieldByName('REM_MES_RES2').asFloat := rRemMesRes;
      CdsGRFC.FieldByName('AVISO_PREVIO2').asFloat := rAvisoPrevio;
      CdsGRFC.FieldByName('MULTA_RES').asFloat := rMultaRes;
      CdsGRFC.FieldByName('TOTAL_REC').asFloat :=
        FU.Arredondar(CdsGRFC.FieldByName('REM_MES_ANT2').asFloat,2) +
        FU.Arredondar(CdsGRFC.FieldByName('REM_MES_RES2').asFloat,2) +
        FU.Arredondar(CdsGRFC.FieldByName('AVISO_PREVIO2').asFloat,2) +
        FU.Arredondar(CdsGRFC.FieldByName('MULTA_RES').asFloat,2);
      CdsGRFC.Post;
    until (dmCds.Cds.EOF);
  end
  else
  begin
    CdsGRFC.Insert;
    CdsGRFC.Post;
  end;
  CdsGRFC.First;
end;

end.
