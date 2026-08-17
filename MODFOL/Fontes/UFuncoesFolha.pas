unit uFuncoesFolha;

interface

uses
  wwTable, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, Wwquery, Mask, StdCtrls, wwdblook, MAHlpBtn, Buttons,
  ExtCtrls, ComCtrls, FOkCancelar, Machklb, checklst, cmseldlg, Spin, TB97,
  uDocumento, uIntegraBack;

procedure RestauraIcone;

function RetornaNoDocumento: string;

function EscreveRubrica (
  pPrevia, pSeqRub, pIdPessoa, pIdPessJur, pIdRubrica, pCodProvDesc,
  pIdMotivo, pMes, pMesCobranca, pReferencia, pIdRegraCalculo,
  pFlgCompoeSalPart, pFlgCompoeSalBenef, pFlgIRRF, pCodMoeda, pValorCotas: string;
  pValorProvento: double
): boolean;

function LancaTmpDesc (
  qry: TwwQuery;
  pMesReferencia, pMesCobranca, pFlgTipoDesc, pValor, pValorRecebido, pMatricula,
  pInscricaoNumero, pIdTitular, pIdPessoa, pIdPessJur, pIdFundacao, pIdPlanoPrev,
  pIdPlanAss, pIdProvento, pCodProvDesc, pFlgDesconto, pIdDesconto, pNumPrioridade,
  pOrdem, pIdMotivo, pValorBase1, pValorBase2, pValorBase3, pNumDependSeguro,
  pFlgDescFolha, pDataReferencia, pDataRecebimento, pDescricao, pReferencia,
  pFlgFornPag, pFlgFornComiss, pPlnCodigoPrev, pCodTipRecDes, pRecPag,
  pIdEmpresaProp, pCodTipDoc, pCodSubConta, pPlaContaD, pPlano, pPlaContaC,
  pCodDocumentoPrev, pCodPortForma, pUnidNegoc, pCodCentroRespon, pCodCentroCustoD,
  pCodCentroCustoC, pIdEmpresa, pCodDocumentoEfet, pCodRetorno, pSistOrigem,
  pPlnCodigoEfet, pFlgAlterador, pPeriodo, pExercicio, pCodAlterador,
  pDataCobranca, pNoDocumento, pComplDocumento, pTipCodigo, pIdFavorecido, pSitEnvio: string
): boolean;

procedure BuscaInfIRRF (
  pIdFundacao, pIdPlanoPrev: integer;
  var sTipCodigoIRRF,sCodTipRecDesIRRF, sRecPagIRRF, sCodTipDocIRRF, sCodPortFormaIRRF,
      sCodCentroResponIRRF, sCodSubContaIRRF, sCodCentroCustoDIRRF, sIdEmpresaIRRF,
      sCodCentroCustoCIRRF, sPlaContaDIRRF, sPlanoIRRF, sPlaContaCIRRF, sUnidNegocIRRF,
      sIdEmpresaPropIRRF, sIdFavorecidoIRRF: string
);

function ProcDescFolha (
  TipoFolha, pIdProvento, pTipoProc, pIdPessJur, pIdPessoa: integer;
  pMesRef, pMesPagto, pFlgDescFolha, pValorTaxa, pMotNor, pMotPad, pMotFer, pMot13: string;
  var pTotDesc, dTotalBrutoGeral, dTotDescGeral: double;
  var pIdLotePrevia: integer;
  pIdTitular: integer
): boolean;

function AbreTempDocum(Table: TTable): boolean;

function AlimentaQryDocumentos (
  tblDocumentos: TTable;
  CodDocumento, NumLancto, Plano, UnidNegoc, iUltPortForma, iFavorecido: integer;
  PlaConta, CodCentroRespon, CodTipRecDes, sDebCre : string;
  Valor: real;
  var sMens: string;
  iPortFormaParticip: integer;
  sCodCentroCusto: string): boolean;

function DescarregaQryDocumentos (
  tblDocumentos: TTable;
  iIDPatroAtu, plnCodigo: integer;
  sCodPortForma, sMes, sAno: string;
  Valor: real;
  dtRecebimento: TDateTime;
  Documento: TDocumento;
  bRateio: Boolean): LongInt;

function ValidaDadosDoc(var CodCentroRespon, sMens:string; StiPrecDes:string;
                        var UnidNegoc:integer): boolean;

implementation

uses uSistema, uMensErro, uDataBase, uFuncoesUteisRH, uCalcRub, dFolha, fPrincipal,
     uFuncaoGeral;

procedure RestauraIcone;
begin
  with (dtmFolha.qryAux) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM DUAL');
    Open;
    Close;
  end;
end;

function RetornaNoDocumento: string;
var
  wAno, wMes,wDia, wHora, wMin, wSeg, wMSeg: word;
  valor: double;
begin
  DecodeDate(Now, wAno, wMes, wDia);
  DecodeTime(Now, wHora, wMin, wSeg, wMSeg);

  Valor := wMSeg + wSeg * 1000 + wMin * 100000 + wHora * 10000000 +
           wDia * 1000000000.0 + wMes * 100000000000.0 + wAno * 10000000000000.0;

  Result := OraNumero(FormatFloat('#.##',valor));
end;

function EscreveRubrica (
  pPrevia, pSeqRub, pIdPessoa, pIdPessJur, pIdRubrica, pCodProvDesc,
  pIdMotivo, pMes, pMesCobranca, pReferencia, pIdRegraCalculo,
  pFlgCompoeSalPart, pFlgCompoeSalBenef, pFlgIRRF, pCodMoeda, pValorCotas: string;
  pValorProvento: double
): boolean;
var
  NomeTabela: string;
begin
  if (pPrevia = '0') then
    NomeTabela := 'PREVIAFOLPAG'
  else
    NomeTabela := 'HISTRUBSAL';

  Result := false;

  with (dtmFolha.qryEscreveRubrica) do
  begin
    Close;
    SQL.Clear;
    SQL.Add (
      'SELECT MAX(SEQRUBRICA) AS SEQ FROM ' + NomeTabela +
      ' WHERE IDPESSOA  = ' + pIdPessoa +
      ' AND   MES       = ' + QuotedStr(pMes) +
      ' AND   IDRUBRICA = ' + pIdRubrica);
    Open;
    pSeqRub := IntToStr(FieldByName('SEQ').AsInteger + 1);

    Close;
    if (pIdRegraCalculo = '') then
      pIdRegraCalculo := 'NULL';

    if (pCodMoeda = '') then
      pCodMoeda := 'NULL';

    if (pValorCotas = '') then
      pValorCotas := 'NULL';

    SQL.Clear;
    if (NomeTabela = 'HISTRUBSAL') then
      SQL.Add (
        'INSERT INTO ' +NomeTabela+
        '  (SEQRUBRICA, IDPESSOA, IDPESSJUR, IDPATRO, IDRUBRICA, CODPROVDESC, IDMOTIVO, MES, '+
        '   MESCOBRANCA, REFERENCIA, IDREGRACALCULO, FLGCOMPOESALPART, FLGCOMPOESALBENEF, '+
        '   FLGIRRF, CODMOEDA, VALORPROVENTO, VALORCOTAS, IDMODULO) '+
        'VALUES '+
        '  ( '+ pSeqRub +','+ pIdPessoa +','+ pIdPessJur +','+
        IFF(Sistema.TipoEmpresa='P',pIdPessJur,'NULL')+','+ pIdRubrica +','+
        QuotedStr(pCodProvDesc) +','+ pIdMotivo +','+ QuotedStr(pMes) +','+
        QuotedStr(pMesCobranca) +','+ QuotedStr(pReferencia)+','+
        pIdRegraCalculo+','+pFlgCompoeSalPart+','+pFlgCompoeSalBenef+','+pFlgIRRF+','+
        pCodMoeda+','+OraNumero(FloatToStr(pValorProvento))+','+
        OraNumero(pValorCotas)+','+IntToStr(Sistema.IdModulo)+')')
    else
      SQL.Add (
      'INSERT INTO ' +NomeTabela+
      '  (SEQRUBRICA, IDPESSOA, IDPESSJUR, IDPATRO, IDRUBRICA, CODPROVDESC, IDMOTIVO, MES, '+
      '   MESCOBRANCA, REFERENCIA, IDREGRACALCULO, FLGCOMPOESALPART, FLGCOMPOESALBENEF, '+
      '   FLGIRRF, CODMOEDA, VALORPROVENTO, VALORCOTAS) '+
      'VALUES '+
      '  ( '+ pSeqRub +','+ pIdPessoa +','+ pIdPessJur +','+
      IFF(Sistema.TipoEmpresa='P',pIdPessJur,'NULL')+','+ pIdRubrica +','+
      QuotedStr(pCodProvDesc) +','+ pIdMotivo +','+ QuotedStr(pMes) +','+
      QuotedStr(pMesCobranca) +','+ QuotedStr(pReferencia) +','+ pIdRegraCalculo +','+
      pFlgCompoeSalPart+','+pFlgCompoeSalBenef+','+pFlgIRRF +','+ pCodMoeda +','+
      OraNumero(FloatToStr(pValorProvento)) +','+ OraNumero(pValorCotas) +')');

    //Grava Histórico de Rubricas Salariais
    try
      ExecSQL;
    except
      on E: EDBEngineError do
        Result := true;
    end;
    Close;
  end;
end;

function LancaTmpDesc (
  qry: TwwQuery;
  pMesReferencia, pMesCobranca, pFlgTipoDesc, pValor, pValorRecebido, pMatricula,
  pInscricaoNumero, pIdTitular, pIdPessoa, pIdPessJur, pIdFundacao, pIdPlanoPrev,
  pIdPlanAss, pIdProvento, pCodProvDesc, pFlgDesconto, pIdDesconto, pNumPrioridade,
  pOrdem, pIdMotivo, pValorBase1, pValorBase2, pValorBase3, pNumDependSeguro,
  pFlgDescFolha, pDataReferencia, pDataRecebimento, pDescricao, pReferencia,
  pFlgFornPag, pFlgFornComiss, pPlnCodigoPrev, pCodTipRecDes, pRecPag,
  pIdEmpresaProp, pCodTipDoc, pCodSubConta, pPlaContaD, pPlano, pPlaContaC,
  pCodDocumentoPrev, pCodPortForma, pUnidNegoc, pCodCentroRespon, pCodCentroCustoD,
  pCodCentroCustoC, pIdEmpresa, pCodDocumentoEfet, pCodRetorno, pSistOrigem,
  pPlnCodigoEfet, pFlgAlterador, pPeriodo, pExercicio, pCodAlterador,
  pDataCobranca, pNoDocumento, pComplDocumento, pTipCodigo, pIdFavorecido, pSitEnvio: string
): boolean;
var
  sSQL: string;
begin
  Result := false;
  sSQL   :=
    'INSERT INTO TMPDESC '+
    '  (MESREFERENCIA, MESCOBRANCA, FLGTIPODESC, VALOR, VALORRECEBIDO, MATRICULA, '+
    '   INSCRICAONUMERO, IDTITULAR, IDPESSOA, IDPESSJUR, IDFUNDACAO, IDPLANOPREV, '+
    '   IDPLANASS, IDPROVENTO, CODPROVDESC, FLGDESCONTO, IDDESCONTO, NUMPRIORIDADE, '+
    '   ORDEM, IDMOTIVO, VALORBASE1, VALORBASE2, VALORBASE3, NUMDEPENDSEGURO, '+
    '   FLGDESCFOLHA, DATAREFERENCIA, DATARECEBIMENTO, DESCRICAO, REFERENCIA, '+
    '   FLGFORNPAG, FLGFORNCOMISS, PLNCODIGOPREV, CODTIPRECDES, RECPAG, IDEMPRESAPROP, '+
    '   CODTIPDOC, CODSUBCONTA, PLACONTAD, PLANO, PLACONTAC, CODDOCUMENTOPREV, '+
    '   CODPORTFORMA, UNIDNEGOC, CODCENTRORESPON, CODCENTROCUSTOD, CODCENTROCUSTOC, '+
    '   IDEMPRESA, CODDOCUMENTOEFET, CODRETORNO, SISTORIGEM, PLNCODIGOEFET, '+
    '   FLGALTERADOR, PERIODO, EXERCICIO, CODALTERADOR, DATACOBRANCA, NODOCUMENTO, '+
    '   COMPLDOCUMENTO, TIPCODIGO, IDFAVORECIDO, SITENVIO) '+
    'VALUES '+
    '  (';

  if (pMesReferencia <> '') then
    sSQL := sSQL + '''' + pMesReferencia + ''', '
  else
    sSQL := sSQL + 'NULL, ';

  if (pMesCobranca <> '') then
    sSQL := sSQL + '''' + pMesCobranca + ''', '
  else
    sSQL := sSQL + 'NULL, ';

  if (pFlgTipoDesc <> '') then
    sSQL := sSQL + '''' + pFlgTipoDesc + ''', '
  else
    sSQL := sSQL + 'NULL, ';

  if (pValor <> '') then
    sSQL := sSQL + OraNumero(pValor) + ', '
  else
    sSQL := sSQL + 'NULL, ';

  if pValorRecebido <> ''
  then sSQL := sSQL + OraNumero(pValorRecebido) + ', '
  else sSQL := sSQL + 'NULL, ';

  if pMatricula <> ''
  then sSQL := sSQL + '''' + pMatricula + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pInscricaoNumero <> ''
  then sSQL := sSQL + pInscricaoNumero + ', '
  else sSQL := sSQL + 'NULL, ';

  if pIdTitular <> ''
  then sSQL := sSQL + pIdTitular + ', '
  else sSQL := sSQL + 'NULL, ';

  if pIdPessoa <> ''
  then sSQL := sSQL + pIdPessoa + ', '
  else sSQL := sSQL + 'NULL, ';

  if pIdPessJur <> ''
  then sSQL := sSQL + pIdPessJur + ', '
  else sSQL := sSQL + 'NULL, ';

  if pIdFundacao <> ''
  then sSQL := sSQL + pIdFundacao + ', '
  else sSQL := sSQL + 'NULL, ';

  if pIdPlanoPrev <> ''
  then sSQL := sSQL + pIdPlanoPrev + ', '
  else sSQL := sSQL + 'NULL, ';

  if pIdPlanAss <> ''
  then sSQL := sSQL + pIdPlanAss + ', '
  else sSQL := sSQL + 'NULL, ';

  if pIdProvento <> ''
  then sSQL := sSQL + pIdProvento + ', '
  else sSQL := sSQL + 'NULL, ';

  if pCodProvDesc <> ''
  then sSQL := sSQL + '''' + pCodProvDesc + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pFlgDesconto <> ''
  then sSQL := sSQL + pFlgDesconto + ', '
  else sSQL := sSQL + 'NULL, ';

  if pIdDesconto <> ''
  then sSQL := sSQL + pIdDesconto + ', '
  else sSQL := sSQL + 'NULL, ';

  if pNumPrioridade <> ''
  then sSQL := sSQL + pNumPrioridade + ', '
  else sSQL := sSQL + 'NULL, ';

  if pOrdem <> ''
  then sSQL := sSQL + pOrdem + ', '
  else sSQL := sSQL + 'NULL, ';

  if pIdMotivo <> ''
  then sSQL := sSQL + pIdMotivo + ', '
  else sSQL := sSQL + 'NULL, ';

  if pValorBase1 <> ''
  then sSQL := sSQL + OraNumero(pValorBase1) + ', '
  else sSQL := sSQL + 'NULL, ';

  if pValorBase2 <> ''
  then sSQL := sSQL + OraNumero(pValorBase2) + ', '
  else sSQL := sSQL + 'NULL, ';

  if pValorBase3 <> ''
  then sSQL := sSQL + OraNumero(pValorBase3) + ', '
  else sSQL := sSQL + 'NULL, ';

  if pNumDependSeguro <> ''
  then sSQL := sSQL + '''' + pNumDependSeguro + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pFlgDescFolha <> ''
  then sSQL := sSQL + '''' + pFlgDescFolha + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pDataReferencia <> ''
  then sSQL := sSQL + 'TO_DATE(''' + pDataReferencia + ''',''DD/MM/YYYY''), '
  else sSQL := sSQL + 'NULL, ';

  if pDataRecebimento <> ''
  then sSQL := sSQL + 'TO_DATE(''' + pDataRecebimento + ''',''DD/MM/YYYY''), '
  else sSQL := sSQL + 'NULL, ';

  if pDescricao <> ''
  then sSQL := sSQL + '''' + pDescricao + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pReferencia <> ''
  then sSQL := sSQL + '''' + pReferencia + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pFlgFornPag <> ''
  then sSQL := sSQL + pFlgFornPag + ', '
  else sSQL := sSQL + 'NULL, ';

  if pFlgFornComiss <> ''
  then sSQL := sSQL + pFlgFornComiss + ', '
  else sSQL := sSQL + 'NULL, ';

  if pPlnCodigoPrev <> ''
  then sSQL := sSQL + pPlnCodigoPrev + ', '
  else sSQL := sSQL + 'NULL, ';

  if pCodTipRecDes <> ''
  then sSQL := sSQL + '''' + pCodTipRecDes + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pRecPag <> ''
  then sSQL := sSQL + '''' + pRecPag + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pIdEmpresaProp <> ''
  then sSQL := sSQL + pIdEmpresaProp + ', '
  else sSQL := sSQL + 'NULL, ';

  if pCodTipDoc <> ''
  then sSQL := sSQL + pCodTipDoc + ', '
  else sSQL := sSQL + 'NULL, ';

  if pCodSubConta <> ''
  then sSQL := sSQL + pCodSubConta + ', '
  else sSQL := sSQL + 'NULL, ';

  if pPlaContaD <> ''
  then sSQL := sSQL + '''' + pPlaContaD + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pPlano <> ''
  then sSQL := sSQL + pPlano + ', '
  else sSQL := sSQL + 'NULL, ';

  if pPlaContaC <> ''
  then sSQL := sSQL + '''' + pPlaContaC + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pCodDocumentoPrev <> ''
  then sSQL := sSQL + pCodDocumentoPrev + ', '
  else sSQL := sSQL + 'NULL, ';

  if pCodPortForma <> ''
  then sSQL := sSQL + pCodPortForma + ', '
  else sSQL := sSQL + 'NULL, ';

  if pUnidNegoc <> ''
  then sSQL := sSQL + pUnidNegoc + ', '
  else sSQL := sSQL + 'NULL, ';

  if pCodCentroRespon <> ''
  then sSQL := sSQL + '''' + pCodCentroRespon + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pCodCentroCustoD <> ''
  then sSQL := sSQL + '''' + pCodCentroCustoD + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pCodCentroCustoC <> ''
  then sSQL := sSQL + '''' + pCodCentroCustoC + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pIdEmpresa <> ''
  then sSQL := sSQL + pIdEmpresa + ', '
  else sSQL := sSQL + 'NULL, ';

  if pCodDocumentoEfet <> ''
  then sSQL := sSQL + pCodDocumentoEfet + ', '
  else sSQL := sSQL + 'NULL, ';

  if pCodRetorno <> ''
  then sSQL := sSQL + '''' + pCodRetorno + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pSistOrigem <> ''
  then sSQL := sSQL + '''' + pSistOrigem + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pPlnCodigoEfet <> ''
  then sSQL := sSQL + pPlnCodigoEfet + ', '
  else sSQL := sSQL + 'NULL, ';

  if pFlgAlterador <> ''
  then sSQL := sSQL + '''' + pFlgAlterador + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pPeriodo <> ''
  then sSQL := sSQL + pPeriodo + ', '
  else sSQL := sSQL + 'NULL, ';

  if pExercicio <> ''
  then sSQL := sSQL + pExercicio + ', '
  else sSQL := sSQL + 'NULL, ';

  if pCodAlterador <> ''
  then sSQL := sSQL + pCodAlterador + ', '
  else sSQL := sSQL + 'NULL, ';

  if pDataCobranca <> ''
  then sSQL := sSQL + 'TO_DATE(''' + pDataCobranca + ''',''DD/MM/YYYY''), '
  else sSQL := sSQL + 'NULL, ';

  if pNoDocumento <> ''
  then sSQL := sSQL + pNoDocumento + ', '
  else sSQL := sSQL + 'NULL, ';

  if pComplDocumento <> ''
  then sSQL := sSQL + '''' + pComplDocumento + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pTipCodigo <> ''
  then sSQL := sSQL + '''' + pTipCodigo + ''', '
  else sSQL := sSQL + 'NULL, ';

  if pIdFavorecido <> ''
  then sSQL := sSQL + pIdFavorecido + ', '
  else sSQL := sSQL + 'NULL, ';

  if pSitEnvio <> ''
  then sSQL := sSQL + '''' + pSitEnvio + ''') '
  else sSQL := sSQL + 'NULL) ';

  with qry do
  begin
    Close;
    SQL.Clear;

    if (Trim(sSQL) <> '') then
      SQL.Add(sSQL);

    //Grava na TMPDESC
    try
      ExecSQL;
    except
      on E: EDBEngineError do
        Result := true;
    end;
    Close;
  end;
end;

// Busca Informações de Integração do IRRF na tabela FUNDACAO
// Provisoriamente não busca na tabela PLANO
procedure BuscaInfIRRF (
  pIdFundacao, pIdPlanoPrev: integer;
  var sTipCodigoIRRF,sCodTipRecDesIRRF, sRecPagIRRF, sCodTipDocIRRF, sCodPortFormaIRRF,
      sCodCentroResponIRRF, sCodSubContaIRRF, sCodCentroCustoDIRRF, sIdEmpresaIRRF,
      sCodCentroCustoCIRRF, sPlaContaDIRRF, sPlanoIRRF, sPlaContaCIRRF, sUnidNegocIRRF,
      sIdEmpresaPropIRRF, sIdFavorecidoIRRF: string
);
begin
  with (dtmFolha.qryIntegraIRRF) do
  begin
    Close;
    ParamByName('pIdFundacao').asInteger := pIdFundacao;
    Open;
    if (RecordCount <> 0) then
    begin
      if (FieldByName('TipCodigoIRRF').asString <> '') then
        sTipCodigoIRRF := FieldByName('TipCodigoIRRF').asString
      else
        sTipCodigoIRRF := '';

      if (FieldByName('CodTipRecDesIRRF').asString <> '') then
        sCodTipRecDesIRRF := FieldByName('CodTipRecDesIRRF').asString
      else
        sCodTipRecDesIRRF := '';

      if (FieldByName('RecPagIRRF').asString <> '') then
        sRecPagIRRF := FieldByName('RecPagIRRF').asString
      else
        sRecPagIRRF := '';

      if (FieldByName('CodTipDocIRRF').asString <> '') then
        sCodTipDocIRRF := FieldByName('CodTipDocIRRF').asString
      else
        sCodTipDocIRRF := '';

      if (FieldByName('CodPortadorFormaIRRF').asString <> '') then
        sCodPortFormaIRRF := FieldByName('CodPortadorFormaIRRF').asString
      else
        sCodPortFormaIRRF := '';

      if (FieldByName('CodCentroResponIRRF').asString <> '') then
        sCodCentroResponIRRF := FieldByName('CodCentroResponIRRF').asString
      else
        sCodCentroResponIRRF := '';

      if (FieldByName('CodSubContaIRRF').asString <> '') then
        sCodSubContaIRRF := FieldByName('CodSubContaIRRF').asString
      else
        sCodSubContaIRRF := '';

      if (FieldByName('CodCentroCustoDIRRF').asString <> '') then
        sCodCentroCustoDIRRF := FieldByName('CodCentroCustoDIRRF').asString
      else
        sCodCentroCustoDIRRF := '';

      if (FieldByName('IdEmpresaIRRF').asString <> '') then
        sIdEmpresaIRRF := FieldByName('IdEmpresaIRRF').asString
      else
        sIdEmpresaIRRF := '';

      if (FieldByName('CodCentroCustoCIRRF').asString <> '') then
        sCodCentroCustoCIRRF := FieldByName('CodCentroCustoCIRRF').asString
      else
        sCodCentroCustoCIRRF := '';

      if (FieldByName('PlaContaDIRRF').asString <> '') then
        sPlaContaDIRRF := FieldByName('PlaContaDIRRF').asString
      else
        sPlaContaDIRRF := '';

      if (FieldByName('PlanoIRRF').asString <> '') then
        sPlanoIRRF := FieldByName('PlanoIRRF').asString
      else
        sPlanoIRRF := '';

      if (FieldByName('PlaContaCIRRF').asString <> '') then
        sPlaContaCIRRF := FieldByName('PlaContaCIRRF').asString
      else
        sPlaContaCIRRF := '';

      if (FieldByName('UnidNegocIRRF').asString <> '') then
        sUnidNegocIRRF := FieldByName('UnidNegocIRRF').asString
      else
        sUnidNegocIRRF := '';

      if (FieldByName('IdEmpresaPropIRRF').asString <> '') then
        sIdEmpresaPropIRRF := FieldByName('IdEmpresaPropIRRF').asString
      else
        sIdEmpresaPropIRRF := '';

      if (FieldByName('IdFavorecidoIRRF').asString <> '') then
        sIdFavorecidoIRRF := FieldByName('IdFavorecidoIRRF').asString
      else
        sIdFavorecidoIRRF := '';
    end;
  end;
end;

function ProcDescFolha (
  TipoFolha, pIdProvento, pTipoProc, pIdPessJur, pIdPessoa: integer;
  pMesRef, pMesPagto, pFlgDescFolha, pValorTaxa, pMotNor, pMotPad, pMotFer, pMot13: string;
  var pTotDesc, dTotalBrutoGeral, dTotDescGeral: double;
  var pIdLotePrevia: integer;
  pIdTitular: integer
): boolean;
var
  sIdPessoa : String;
  {iUltProvento, iUltPessoa, }iUltFundacao, iUltLote, {iUltPessJur, TemLanc, }QtdParc,
  QtdOcor, TemLanc: integer;
  xDataRef, sUltMes, sUltReferencia, sUltCodProvDesc, sUltFlgTipoDesc, sMotivoTmp, sRegra: string;
  dValorDesc, dUltOrdem: double;
  bErro: boolean;

{->}procedure EfetivaDescontoFolha;
    begin
      // Escreve na tabela TMPDESC o valor do desconto
      with (dtmFolha.qryUpdDescFolha) do
      begin
        Close;
        ParamByName('pValor').Value        := dValorDesc;
        ParamByName('pIdLote').Value       := iUltLote;
        ParamByName('pOrdem').Value        := dUltOrdem;
        try
          ExecSQL;
          // TEM QUE CHAMAR Escreve Rubrica PARA GRAVAR NA HISTRUBSAL
          bErro := EscreveRubrica(IntToStr(pTipoProc), '1',
            dtmFolha.qryDescFolha.FieldByName('IdPessoa').asString,
            dtmFolha.qryDescFolha.FieldByName('IdPessJur').asString,
            dtmFolha.qryDescFolha.FieldByName('IdProvento').asString,
            dtmFolha.qryDescFolha.FieldByName('CodProvDesc').asString,
            sMotivoTmp, pMesRef, pMesPagto,
            iff(sUltReferencia='','***',sUltReferencia), // Referencia
            dtmFolha.qryDescFolha.FieldByName('IdRegra').asString,
            '0', '0', '0', '', '', dValorDesc);

        except
          on E: EDBEngineError do
            bErro := true;
        end;
      end;
{<-}end;
begin
  Result:=false; bErro:=false; dValorDesc:=0; QtdParc:=0; QtdOcor:=0;

  xDataRef := IncData('01'+copy(pMesRef,5,3)+'/'+copy(pMesRef,1,4),0,1,0);
  xDataRef := IncData(xDataRef,0,0,-1);

  with (dtmFolha.qryDescFolha) do
  begin
    Close;
    Filtered  := False;
    ParamByName('pIdPessoa').asInteger := pIdPessoa;
    //ParamByName('pIdPessJur').asInteger := pIdPessJur;   // Excluído em 03/02/03
    ParamByName('pMesRef').asString := pMesRef;
    ParamByName('pFlgDescFolha').asString := pFlgDescFolha;
    ParamByName('pValorTaxa').asString := pValorTaxa;
    Open;
    if (pIdProvento > 0) then
    begin
      Filter := 'IDPROVENTO = ' + IntToStr(pIdProvento);
      Filtered := True;
      First;
    end;

    if (IsEmpty) then
    begin
      Close;
      exit;
    end;

    while not(EOF) do
    begin
      sUltMes := FieldByName('MesCobranca').asString;

      iUltFundacao := FieldByName('IdFundacao').AsInteger;
      sUltFlgTipoDesc := FieldByName('FlgTipoDesc').asString;
      sUltReferencia := FieldByName('Referencia').asString;

      if FieldByName('Numparcelas').AsInteger > 1 then
        sUltReferencia := '  ' +FieldByName('Parcela').asString +'/'+
                                FieldByName('Numparcelas').asString;

      sUltCodProvDesc := FieldByName('CodProvDesc').asString;
      sRegra := FieldByName('IdRegra').asString;
      dValorDesc := 0;

      iUltLote  := FieldByName('IdLote').asInteger;
      dUltOrdem := FieldByName('Ordem').asFloat;
      pMesPagto := FieldByName('MesReferencia').asString;

      if (pValorTaxa = 'T') then
        dValorDesc := FieldByName('ValorBase1').asFloat
      else
        dValorDesc := FieldByName('Valor').asFloat;

      TemLanc := 1;
      sIdPessoa := IntToStr(pIdPessoa);

      if (sRegra <> '') then
      begin
        CalcBenef(TipoFolha, False, sRegra, sIdPessoa, dValorDesc, pTotDesc, TemLanc,
          QtdParc, QtdOcor, dTotalBrutoGeral, dTotDescGeral);
        pTotDesc := dValorDesc;
      end;

      // Prepara o Motivo
      sMotivoTmp := pMotNor;  // Para garantir algo

      if ((pMotNor  = pMotPad) and (FieldByName('FlgSalFamilia').AsInteger = 1)) or
         ((pMotNor <> pMotPad) and (pMotNor <> '') and
          (FieldByName('FlgSalFamilia').AsInteger = 0)) then
        sMotivoTmp := pMotNor
      else
      if (pMotFer <> '') and (FieldByName('FlgFerias').AsInteger = 1) then
        sMotivoTmp := pMotFer
      else
      if (pMot13 <> '') and (FieldByName('FlgDecimoTerceiro').AsInteger = 1) then
        sMotivoTmp := pMot13;

      if dValorDesc <> 0 then
      begin
        if (pTipoProc = 1) then
          EfetivaDescontoFolha  // Processo Final
        else
        begin  // Prévia
          bErro := EscreveRubrica(IntToStr(pTipoProc), '1',
            FieldByName('IdPessoa').asString,
            FieldByName('IdPessJur').asString,
            FieldByName('IdProvento').asString,
            FieldByName('CodProvDesc').asString,
            sMotivoTmp, pMesRef, pMesPagto,
            iff(sUltReferencia='','***',sUltReferencia), // Referencia
            FieldByName('IdRegra').asString,   // ????????
            '0', '0', '0', '', '', dValorDesc);
        end;
      end;
      Next;
    end;
    Close;
  end;
  Result := not(bErro);
end;

function AbreTempDocum(Table: TTable): boolean;
begin
  try
    Table.Close;
    if CriaTabelaTemp(ExtractFilePath(Application.ExeName), 'TempDoc.DBF', [
       NovoCampoTabela('PLACONTA', ftString, 18, false),
       NovoCampoTabela('UNIDNEGO', ftInteger, 0, false),
       NovoCampoTabela('CODRESPO', ftString, 10, false),
       NovoCampoTabela('CODTPREC', ftString, 15, false),
       NovoCampoTabela('IDFORCLI', ftInteger, 0, false),
       NovoCampoTabela('CODCUSTO', ftString, 10, false),

       NovoCampoTabela('CODDOCUM', ftInteger, 0, false),
       NovoCampoTabela('PLANO', ftInteger, 0, false),
       NovoCampoTabela('CODPORTF', ftInteger, 0, false),
       NovoCampoTabela('PLNCODIG', ftInteger, 0, false),
       NovoCampoTabela('NUMLANCT', ftInteger, 0, false),
       NovoCampoTabela('DEBCRE', ftString, 1, false),
       NovoCampoTabela('VALOR', ftFloat, 0, false),
       NovoCampoTabela('PORTFORM', ftInteger, 0, false)],[]) then
    begin
      Table.DatabaseName := ExtractFilePath(Application.ExeName);
      Table.TableName    := 'TempDoc.DBF';
      Table.Open;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := false;
    end;
  end;
end;

function AlimentaQryDocumentos (
  tblDocumentos: TTable;
  CodDocumento, NumLancto, Plano, UnidNegoc, iUltPortForma, iFavorecido: integer;
  PlaConta, CodCentroRespon, CodTipRecDes, sDebCre : string;
  Valor: real;
  var sMens: string;
  iPortFormaParticip: integer;
  sCodCentroCusto  : string): boolean;
begin
  Result := true;

  if not(ValidaDadosDoc(CodCentroRespon, sMens, CodTipRecDes, UnidNegoc)) then
  begin
    Result := false;
    exit;
  end;

  // Pego a Conta Contábil do Favorecido
  if (PlaConta = '') then
  begin
    dtmFolha.qryAux.Close;
    with (dtmFolha.qryAux.SQL) do
    begin
      Clear;
      Add('SELECT PLANO, PLACONTACREDITO ');
      Add('FROM TIPORECEBDESEMB ');
      Add('WHERE CODTIPRECDES = ' + QuotedStr(CodTipRecDes));
      Add('AND   IDPESSOA     = ' + IntToStr(Sistema.IdEmpresa));
    end;
    dtmFolha.qryAux.Open;
    if (Plano = 0) and (dtmFolha.qryAux.FieldByName('PLANO').asInteger <> 0) then
      Plano := dtmFolha.qryAux.FieldByName('PLANO').asInteger;
    PlaConta := dtmFolha.qryAux.FieldByName('PLACONTACREDITO').asString;
    if (PlaConta = '') then
    begin
      dtmFolha.qryAux.Close;
      with (dtmFolha.qryAux.SQL) do
      begin
        Clear;
        Add('SELECT CONTACFORN, PLANO FROM EMPRESAFORN WHERE');
        Add('  (IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+') AND');
        Add('  (IDFORCLI = ' +IntToStr(iFavorecido)+ ')');
      end;
      dtmFolha.qryAux.Open;
      PlaConta := dtmFolha.qryAux.FieldByName('CONTACFORN').asString;

      if (Plano = 0) and (dtmFolha.qryAux.FieldByName('PLANO').asInteger <> 0) then
        Plano := dtmFolha.qryAux.FieldByName('PLANO').asInteger;
    end;
    dtmFolha.qryAux.Close;
  end;

  tblDocumentos.First;
  while not(tblDocumentos.EOF) do
  begin
    if (tblDocumentos.FieldByName('CODDOCUM').asInteger = CodDocumento) and
       (tblDocumentos.FieldByName('NUMLANCT').asInteger = NumLancto) and
       (tblDocumentos.FieldByName('UNIDNEGO').asInteger = UnidNegoc) and
       (tblDocumentos.FieldByName('CODRESPO').asString  = CodCentroRespon) and
       (tblDocumentos.FieldByName('CODTPREC').asString  = CodTipRecDes) and
       (tblDocumentos.FieldByName('PLACONTA').asString  = PlaConta) and
       (tblDocumentos.FieldByName('CODPORTF').asInteger = iUltPortForma) and
       (tblDocumentos.FieldByName('IDFORCLI').asInteger = iFavorecido) and
       (tblDocumentos.FieldByName('PORTFORM').asInteger = iPortFormaParticip) and
       (tblDocumentos.FieldByName('CODCUSTO').asString  = sCodCentroCusto) then
    begin
      tblDocumentos.Edit;
      tblDocumentos.FieldByName('VALOR').asFloat :=
        tblDocumentos.FieldByName('VALOR').asFloat + Valor;
      tblDocumentos.Post;
      exit;
    end;
    tblDocumentos.Next;
  end;

  tblDocumentos.Insert;
  tblDocumentos.FieldByName('CODDOCUM').asInteger := CodDocumento;
  tblDocumentos.FieldByName('NUMLANCT').asInteger := NumLancto;
  tblDocumentos.FieldByName('PLANO').asInteger    := Plano;
  tblDocumentos.FieldByName('UNIDNEGO').asInteger := UnidNegoc;
  tblDocumentos.FieldByName('PLACONTA').asString  := PlaConta;
  tblDocumentos.FieldByName('CODRESPO').asString  := CodCentroRespon;
  tblDocumentos.FieldByName('CODTPREC').asString  := CodTipRecDes;
  tblDocumentos.FieldByName('VALOR').asFloat      := Valor;
  tblDocumentos.FieldByName('CODPORTF').asInteger := iUltPortForma;
  tblDocumentos.FieldByName('IDFORCLI').asInteger := iFavorecido;
  tblDocumentos.FieldByName('DEBCRE').asString    := sDebCre;
  tblDocumentos.FieldByName('PORTFORM').asInteger := iPortFormaParticip;
  tblDocumentos.FieldByName('CODCUSTO').asString  := sCodCentroCusto;
  tblDocumentos.Post;
end;

function DescarregaQryDocumentos (
  tblDocumentos: TTable;
  iIDPatroAtu, plnCodigo: integer;
  sCodPortForma, sMes, sAno: string;
  Valor: real;
  dtRecebimento: TDateTime;
  Documento: TDocumento;
  bRateio: Boolean): LongInt;
var
  sVarPlaconta, sVarCCusto, sCodCentroCusto, PlaContaAnt, sNoDocumento,
  sCentroRespon, sTiprecDes, sSql {, sDebCre}: string;
  iPrograma, iVarCodDoc, iVarSubConta, iVarPlano, iOrdem, iCodLancCAPCAR, iNumLancto,
  iUnidNegoc, iFavorecido: integer;
  rValor: double;
  SvNum : TBookMark;
begin
  iCodLancCAPCAR := -3; 
                                
  tblDocumentos.First;
  while not(tblDocumentos.EOF) do
  begin
    iCodLancCAPCAR := Documento.GetCodigo(dtmFolha.qryAux);
    Inc(iOrdem);
    if (tblDocumentos.FieldByName('IDFORCLI').asInteger > 0) then
      iIDPatroAtu := tblDocumentos.FieldByName('IDFORCLI').asInteger;

    sNoDocumento := IntToStr(iIdPatroAtu) + IntToStr(iOrdem);

    while (Documento.ValidaNumDoc(DtmFolha.qryAux, 'P', iIDPatroAtu, StrToFloat(sNoDocumento),
           '',iVarCodDoc,iVarSubConta,iVarPlano,sVarPlaconta,sVarCCusto)) do
    begin
      inc(iOrdem);
      sNoDocumento := IntToStr(iIdPatroAtu) + IntToStr(iOrdem);
    end;

    sSQL := 'SELECT IDPESSOA FROM FORNSERV WHERE IDPESSOA = '+ inttoStr(iIdPatroAtu);
    FazQuery(DtmFolha.qryAux,sSQL);
    if (DtmFolha.qryAux.Eof) then
      Documento.ForCli.Inserir(iIdPatroAtu,
        -1,
        -1,
        -1{iPlano},
        0{FrmPrincipal.prmIdRamoTipoForn????},
        Sistema.IdEmpresa,
        '',
        '',
        '',
        '',
        'F',
        true);

    dtmFolha.qryAux.Close;
    dtmFolha.qryAux.SQL.Clear;

    Documento.Inserir(
      dtmFolha.qryAux,
      iCodLancCAPCAR,
      IntToStr(Sistema.IdModulo),
      tblDocumentos.FieldByName('PLANO').asString,
      tblDocumentos.FieldByName('PLACONTA').asString,
      '', // sCCustoCliFor
      -1, // iMoeCodigo (nao é em outra moeda)
      -1,
      Sistema.IdEmpresa,
      iIDPatroAtu,
      StrToInt(frmPrincipal.prmCodTipDoc),
      StrToInt(sCodPortForma),
      'P', // Contas a Pagar
      StrToFloat(sNoDocumento),
      '',
      DateToStr(Date), // Data de Emissao
      DateToStr(dtRecebimento),
      DateToStr(dtRecebimento),
      '0', // sStatus
      -1,  // iNumFatura
      '2', // sOperacao
      Sistema.IdUsuario,
      -1,
      -1,
      '',
      '',
      false,
      0,
      0,
      0);

    //Result     := -2;
    iNumLancto := Documento.GerarNumLancto(DtmFolha.qryAux, iCodLancCAPCAR);
    //Result     := -1;

    if (iNumLancto > 0) then
    begin
      SvNum := tblDocumentos.GetBookmark;
      Valor := 0;
      PlaContaAnt     := tblDocumentos.FieldByName('PLACONTA').asString;
      iUnidNegoc      := tblDocumentos.FieldByName('UNIDNEGO').asInteger;
      sCentroRespon   := tblDocumentos.FieldByName('CODRESPO').asString;
      sTiprecDes      := tblDocumentos.FieldByName('CODTPREC').asString;
      iFavorecido     := tblDocumentos.FieldByName('IDFORCLI').asInteger;

      while (PlaContaAnt   = tblDocumentos.FieldByName('PLACONTA').asString)  and
            (iUnidNegoc    = tblDocumentos.FieldByName('UNIDNEGO').asInteger) and
            (sCentroRespon = tblDocumentos.FieldByName('CODRESPO').asString)  and
            (sTiprecDes    = tblDocumentos.FieldByName('CODTPREC').asString)  and
            (iFavorecido   = tblDocumentos.FieldByName('IDFORCLI').asInteger) and
            (not tblDocumentos.EOF) do
      begin
        if (tblDocumentos.FieldByName('DEBCRE').asString = 'D') then
          Valor := Valor + tblDocumentos.FieldByName('VALOR').asFloat
        else
          Valor := Valor - tblDocumentos.FieldByName('VALOR').asFloat;
        tblDocumentos.Next;
      end;

      tblDocumentos.GotoBookmark(SvNum);

      Documento.CriarLanctoDoc(
        dtmFolha.qryAux,
        iCodLancCAPCAR,
        iNumLancto,
        -1,
        PlnCodigo,
        DateToStr(Date),
        Abs(valor),
        0,
        -1,
        Documento.BuscaDebCre(StrToInt(FrmPrincipal.prmCodTipDoc)),
        '2', // sOperacao
        '',
        Sistema.IdUsuario,
        false,
        tblDocumentos.FieldByName('CODPORTF').asInteger,
        '');

      //Documento.Informa_Planilha(); Registrar a planilha contábil no CAP

      //Result := 0;
      while (PlaContaAnt   = tblDocumentos.FieldByName('PLACONTA').asString)  and
            (iUnidNegoc    = tblDocumentos.FieldByName('UNIDNEGO').asInteger) and
            (sCentroRespon = tblDocumentos.FieldByName('CODRESPO').asString)  and
            (sTiprecDes    = tblDocumentos.FieldByName('CODTPREC').asString)  and
            (iFavorecido   = tblDocumentos.FieldByName('IDFORCLI').asInteger) and
            (not tblDocumentos.EOF) do
      begin
        sCodCentroCusto := tblDocumentos.FieldByName('CODCUSTO').asString;
        rValor := 0;

        if (bRateio) and (Sistema.UsaPlanoPatro) then
        begin
          dtmFolha.qryAux.SQL.Clear;
          dtmFolha.qryAux.SQL.Add('SELECT '+
                                  'IDPROGRAMA '+
                                  'FROM '+
                                  'CENTCUST '+
                                  'WHERE '+
                                  '(CODCENTROCUSTO = ' +QuotedStr(sCodCentroCusto)+ ') AND '+
                                  '(IDEMPRESA = ' +IntToStr(Sistema.IdEmpresa)+ ') AND '+
                                  '(IDPROGRAMA IS NOT NULL AND IDPROGRAMA > 0)');
          dtmFolha.qryAux.Open;

          if (dtmFolha.qryAux.FieldByName('IDPROGRAMA').asInteger > 0) then
            iPrograma := dtmFolha.qryAux.FieldByName('IDPROGRAMA').asInteger
          else
            iPrograma := -1;
        end
        else
          iPrograma := -1;

        if (bRateio) then
        begin
          while (PlaContaAnt   = tblDocumentos.FieldByName('PLACONTA').asString)   and
                (iUnidNegoc    = tblDocumentos.FieldByName('UNIDNEGO').asInteger)  and
                (sCentroRespon = tblDocumentos.FieldByName('CODRESPO').asString)   and
                (sTiprecDes    = tblDocumentos.FieldByName('CODTPREC').asString)   and
                (iFavorecido   = tblDocumentos.FieldByName('IDFORCLI').asInteger)  and
                (sCodCentroCusto = tblDocumentos.FieldByName('CODCUSTO').asString) and
                (not tblDocumentos.EOF) do
          begin
            if (tblDocumentos.FieldByName('DEBCRE').asString = 'D') then
              rValor := rValor + tblDocumentos.FieldByName('VALOR').asFloat
            else
              rValor := rValor - tblDocumentos.FieldByName('VALOR').asFloat;
            tblDocumentos.Next;
          end;
        end
        else
        begin
          while (PlaContaAnt   = tblDocumentos.FieldByName('PLACONTA').asString) and
                (iUnidNegoc    = tblDocumentos.FieldByName('UNIDNEGO').asInteger) and
                (sCentroRespon = tblDocumentos.FieldByName('CODRESPO').asString) and
                (sTiprecDes    = tblDocumentos.FieldByName('CODTPREC').asString) and
                (iFavorecido   = tblDocumentos.FieldByName('IDFORCLI').asInteger) and
                (not tblDocumentos.EOF) do
          begin
            if (tblDocumentos.FieldByName('DEBCRE').asString = 'D') then
              rValor := rValor + tblDocumentos.FieldByName('VALOR').asFloat
            else
              rValor := rValor - tblDocumentos.FieldByName('VALOR').asFloat;
            tblDocumentos.Next;
          end;
        end;

        Documento.Rateio.Inserir(
          iCodLancCAPCAR,
          sTipRecDes,
          'P',
          IFF(sCentroRespon = '','0',sCentroRespon),
          Sistema.IdEmpresa,
          Abs(rValor),
          0,
          Sistema.IdUsuario,
          IFF(iUnidNegoc = 0,-1,iUnidNegoc),
          -1,
          IFF(bRateio,sCodCentroCusto,''),
          IFF(Sistema.UsaPlanoPatro,IntegraBack.PatroGlobal,-1),
          iPrograma,
          IFF(Sistema.UsaPlanoPatro,IntegraBack.PlanoPrevGlobal,-1));
      end;
    end;
  end;

  Result := iCodLancCAPCAR;
end;

function ValidaDadosDoc(var CodCentroRespon, sMens:string; sTipRecDes:string;
                        var UnidNegoc:integer): boolean;
begin
  sMens:=''; Result:=true;

  if (IntegraBack.ObrigaAbc = 'S') and (unidnegoc = 0) then
  begin
    sMens  := sMens + ' - Atividade / Projeto não cadastrada';
    Result := false;
  end;

  if (IntegraBack.ObrigaCRespon = 'S') and (codcentrorespon = '') then
  begin
    sMens  := sMens + ' - Centro de Responsabilidade não cadastrado';
    Result := false;
  end;

  if (sTipRecDes = '') then
  begin
    sMens := sMens + ' - Tipo de Recebimento/Desembolso não cadastrado';
    Result := false;
  end;
end;

end.
