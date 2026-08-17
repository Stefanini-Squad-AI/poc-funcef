// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ ------------------------------------------------------------------------------
Nº SIG......: 115547
Data........: 26/04/2021
Responsável.: Everson Cunha
Descrição...: Retirar campos que não são mais utilizados no eSocial
--------------------------------------------------------------------------------
Nº SIG......: 71744
Data........: 20/09/2019
Responsável.: Everson Cunha
Descrição...: Inclusão do campo REFERENCIA para rubricas específicas
--------------------------------------------------------------------------------
Nº SOL......: 219119
Data........: 26/11/2017
Responsável.: Darivaldo Alencar
Descrição...: Mudança no layout do relatorio
--------------------------------------------------------------------------------
Rotina......: CrmRptCMBeforePrint, rpTRCTGrpFootBnd0BeforePrint,
              rpTRCTGrpHdrBnd0BeforePrint
Nº SOL......: 214976
Nº KINTANA..: 2043622
Data........: 27/08/2013
Responsável.: Marcio Sanches Spinosa SOL 214976 Kintana 2043622
Descrição...: Ajuste no relatório para carregar as informações do sindicato
              diretamente da pessoa.
--------------------------------------------------------------------------------
Rotina......: CrmRptCMBeforePrint, rpTRCTGrpFootBnd0BeforePrint,
              rpTRCTGrpHdrBnd0BeforePrint
Nº SOL......: 186698
Nº KINTANA..: 1764805
Data........: 09/10/2012
Responsável.: Thiago Melo
Descrição...: Adicionado dois termos de rescisão de contrato
              (Homologação e Quitação) e alteração no layout do termo vigente.
--------------------------------------------------------------------------------
Rotina......: GerarDadosRelat
Nº SOL......: 153959
Nº KINTANA..: 1166740
Data........: 02/03/2011
Responsável.: Thaise Amaral Martins
Descrição...: Trocado Insert por Append, pois em algumas máquinas a ordenação
              não ocorria usando o comando Insert.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 144594       
Nº KINTANA..: 954455
Data........: 08/02/2011
Responsável.: Thaise Amaral Martins
Descrição...: Alterar o lay-out do relatorio para um novo padrão de ordem
              de registros
--------------------------------------------------------------------------------
Autor(a)    :  Ádler Teodoro de Souza
Data        :  19/02/2009
Pendência   : SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
--------------------------------------------------------------------------------}

unit RTRCT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppCtrls, ppBands, ppClass, ppPrnabl,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, TXRB, USistema, 
  DBTables, ppVar, ppParameter, ppModule, raCodMod, StdCtrls;

type
  TRptTRCT = class(TFrmCmReport)
    ppTRCT: TppBDEPipeline;
    dsTRCT: TwwDataSource;
    sqlTRCT: TCMSqlParams;
    CdsTRCT: TCMClientDataSet;
    qryRubAnt: TQuery;
    ppParameterList1: TppParameterList;
    rpTRCTDtlBnd: TppDetailBand;
    rpTRCTDBTxt28: TppDBText;
    rpTRCTDBTxt29: TppDBText;
    rpTRCTDBTxt32: TppDBText;
    rpTRCTDBTxt31: TppDBText;
    rpTRCTDBTxt30: TppDBText;
    rpTRCTLine1: TppLine;
    rpTRCTLine2: TppLine;
    rpTRCTLine3: TppLine;
    rpTRCTLine4: TppLine;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    rpTRCTSmryBnd: TppSummaryBand;
    rpTRCTGroup1: TppGroup;
    rpTRCTGrpHdrBnd0: TppGroupHeaderBand;
    ppShape7: TppShape;
    ppShape52: TppShape;
    rpTRCTShape1: TppShape;
    rpTRCTLbl1: TppLabel;
    ppShape2: TppShape;
    rpTRCTDBTxtCentroCusto: TppDBText;
    ppShape3: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    rpTRCTDBTxtCTPS: TppDBText;
    ppDBText17: TppDBText;
    ppLabel18: TppLabel;
    rpTRCTDBTxtPIS: TppDBText;
    ppDBText19: TppDBText;
    ppLabel19: TppLabel;
    ppDBText21: TppDBText;
    ppShape21: TppShape;
    ppLabel20: TppLabel;
    ppDBText22: TppDBText;
    ppLabel21: TppLabel;
    ppDBText23: TppDBText;
    ppShape23: TppShape;
    ppLabel22: TppLabel;
    ppDBText24: TppDBText;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppShape27: TppShape;
    ppLabel26: TppLabel;
    ppDBText28: TppDBText;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    rpTRCTDBTxtCPF: TppDBText;
    ppDBText30: TppDBText;
    ppShape30: TppShape;
    ppLabel29: TppLabel;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel58: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel59: TppLabel;
    ppLabel61: TppLabel;
    ppLine13: TppLine;
    ppLabel63: TppLabel;
    ppLabel14: TppLabel;
    ppLabel54: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppDBText1: TppDBText;
    lblSomaRub: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel47: TppLabel;
    ppLine4: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine5: TppLine;
    rpTRCTGrpFootBnd0: TppGroupFooterBand;
    ppLine6: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    rpTRCTLbl36: TppLabel;
    rpTRCTLbl38: TppLabel;
    rpTRCTLbl37: TppLabel;
    rpTRCTLblTOT_PROV: TppLabel;
    rpTRCTLblTOT_DESC: TppLabel;
    rpTRCTLblTOT_LIQUIDO: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine30: TppLine;
    ppLine14: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    lblTipoVerba: TppLabel;
    lblValorBloco: TppLabel;
    lblValorGrupo: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsTRCTAfterScroll(DataSet: TDataSet);
    procedure rpTRCTSmryBndAfterPrint(Sender: TObject);
    procedure rpTRCTGrpFootBnd0BeforePrint(Sender: TObject);
    procedure rpTRCTGrpHdrBnd0BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand2BeforeGenerate(Sender: TObject);
    procedure ppGroupFooterBand1BeforeGenerate(Sender: TObject);
    procedure rpTRCTDtlBndBeforeGenerate(Sender: TObject);
    procedure ppGroupFooterBand2BeforeGenerate(Sender: TObject);
  private
    Seq: Integer;
    dValorRubrica: array[1..2] of double;//Darivaldo Alencar SOL219119
    procedure GerarDadosRelat;
    function SomaHistRub(CodProvDesc: string; DataRef: TDate; QtdeMeses, TipoFolha, idPessoa: integer): double;

  end;

var
  RptTRCT: TRptTRCT;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TRptTRCT.CrmRptCMBeforePrint(Sender: TObject);
var
  MascaraDoc: array [1..3] of string;
  DocID: array [1..3] of integer;
  DataRubAnt: TDate;
begin
  inherited;
  DocID[1] := 0;
  DocID[2] := 0;
  DocID[3] := 0;
  MascaraDoc[1] := '';
  MascaraDoc[2] := '';
  MascaraDoc[3] := '';

  // Documentos
  with (dmCds.sql) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO, TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''PIS:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CPF:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CTPS:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Prepare;
    Open;
  end;

  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'PIS:') or
         (FieldByName('SIGLADOCUMENTO').asString = 'PIS/PASEP:') then
      begin
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger;
        MascaraDoc[1] := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
      begin
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger;
        MascaraDoc[2] := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CPF:') then
      begin
        DocID[3] := FieldByName('IDDOCUMENTO').asInteger;
        MascaraDoc[3] := FieldByName('MASCARA').asString;
      end;
      Next;
    end;
  end;

  with (dmCds.sql.SQL) do
  begin
    Clear;
    //Thaise SOL144594 - Antes do select, coloco um lead/over
    //para ordenar conseguir trazer a proxima sequencia da rubrica
    //SOL219119 - Darivaldo Alencar - inicio
    //Add('SELECT A.*, lead(A.SEQU) over (order by UPPER(A.NOME_EMPREGADO), A.SEQU ASC NULLS LAST, A.TIPORUBRICA, A.CODRUBRICA) as NextSEQU');
    Add('SELECT A.*, lead(A.SEQU) over (order by UPPER(A.NOME_EMPREGADO), A.TIPORUBRICA, A.SEQU ASC NULLS LAST, A.CODRUBRICA) as NextSEQU');
    //SOL219119 - Darivaldo Alencar - fim
    Add('FROM (');
    Add('SELECT DISTINCT');
    // Dados da Empresa
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS NOME_EMPRESA, F.IDPESSOA, ');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL,PJ.NUMDOCUMENTO) AS INSCRICAO_EMPRESA,');
    Add('  RTRIM(E1.LOGRADOURO) ||'', ''|| E1.NUMERO || DECODE(E1.COMPLEMENTO,NULL,NULL,'' - ''||');
    Add('    RTRIM(E1.COMPLEMENTO)) AS ENDERECO_EMPRESA,');
    Add('  E1.BAIRRO AS BAIRRO_EMPRESA,');
    Add('  CI1.NOME AS CIDADE_EMPRESA,');
    Add('  ES1.CODESTADO AS UF_EMPRESA,');
    Add('  RTRIM(SUBSTR(E1.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E1.CEP,6,3)) AS CEP_EMPRESA,');
    Add('  FP.IDITEMCNAE,');                   
    Add('  '' '' AS INSCRICAO_TOMADOR,');
    // Dados do Empregado
    Add('  RTRIM(PF.NOME) AS NOME_EMPREGADO,');

    if (CmpRptCM.ParamByName('ExibeCCusto').asBoolean) then
      Add('  RTRIM(CC.NOME) AS C_CUSTO,')
    else
      Add('  '' '' AS C_CUSTO,');

    Add('  PIS.NUM AS PIS,');

    Add('  CPF.NUM AS CPF,');

    Add('  RTRIM(CTPS.NUM) AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,'''','''',''/''||CTPS.UF) AS CTPS_UF,');
    Add('  RTRIM(E2.LOGRADOURO) ||'', ''|| E2.NUMERO || DECODE(E2.COMPLEMENTO,NULL,NULL,'' - ''||');
    Add('    RTRIM(E2.COMPLEMENTO)) AS ENDERECO_EMPREGADO,');
    Add('  E2.BAIRRO AS BAIRRO_EMPREGADO,');
    Add('  CI2.NOME AS CIDADE_EMPREGADO,');
    Add('  ES2.CODESTADO AS UF_EMPREGADO,');
    Add('  RTRIM(SUBSTR(E2.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E2.CEP,6,3)) AS CEP_EMPREGADO,');
    Add('  PFIS.DATANASC,');
    Add('  PFIS.NOMEMAE AS NOME_MAE,');
    Add('  F.DATAADMISSAO,');
    Add('  F.DATAAVISO,');
    Add('  F.DATADESLIGAMENTO,');
    Add('  FR.DESCRICAO AS MOTIVOSAIDA,');
    Add('  RTRIM(FR.CODOFICIAL) AS MOTIVOFGTS,');
    Add('  (TO_CHAR(NVL(PENSAOALIM.VALOR,0.00)) || '' %'') AS PENSAOALIM,');
    Add('  LPAD(F.IDCATEMPRGRE, 2, ''0'') AS IDCATEMPRGRE,');
    Add('  NVL(REM_FINS_RESC.VALOR,0.00) AS REM_FINS_RESCISORIOS,');
    Add('  F.CODCENTROCUSTO AS DIVISAO,');
    // Dados das Rubricas
    Add('  RP.CODPROVDESC AS CODRUBRICA,');
    Add('  P.IDPROVENTO,'); //Everson Cunha - SIG71744
    Add('  RP.DESCRPROVDESC AS RUBRICA,');
    Add('  P.FLGDESCONTO AS TIPORUBRICA,');
    Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
    Add('    ''13.o Salar'','''',''Rescisao'','''',''Rescisão'','''',H.REFERENCIA)) AS REFERENCIA,');
    Add('  DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO,0) AS PROVENTOS,');
    Add('  DECODE(P.FLGDESCONTO,1,H.VALORPROVENTO,0) AS DESCONTOS,');
    Add('  (CI1.NOME || DECODE(ES1.CODESTADO,NULL,NULL, '' - '' || ES1.CODESTADO) ||');
    Add('    DECODE(F.HOMOLOGACAONUMERO,NULL,NULL,'', '' || F.HOMOLOGACAONUMERO)) AS HOMOLOGACAO,');
    // Dados do Responsável
    Add('  RTRIM(RESPONSAVEL.NOME) || DECODE(RTRIM(RESPONSAVEL.CARGO),NULL,NULL,'' - '' ||'+
      'RTRIM(RESPONSAVEL.CARGO)) AS RESPONSAVEL,' );
    //Marcio Sanches Spinosa SOL 214976 Kintana 2043622 - Inicio
    Add('  SINDI.REGISTROMT AS CODIGO_SINDICAL, ');
//    Add(' RTRIM(LTRIM(PESSOASINDICATO.NUMDOCUMENTO)) || '' - '' || PESSOASINDICATO.NOME AS SINDICATO, ');
    Add(' LTRIM(RTRIM(SUBSTR(PESSOASINDICATO.NUMDOCUMENTO, 0, 2) || ''.'' || ' +
        '           SUBSTR(PESSOASINDICATO.NUMDOCUMENTO, 3, 3) || ''.'' || ' +
        '           SUBSTR(PESSOASINDICATO.NUMDOCUMENTO, 6, 3) || ''/'' || ' +
        '           SUBSTR(PESSOASINDICATO.NUMDOCUMENTO, 9, 4) || ''-'' || ' +
        '           SUBSTR(PESSOASINDICATO.NUMDOCUMENTO, 13, 2))) || '' - '' || PESSOASINDICATO.NOME AS SINDICATO, ');
    //Marcio Sanches Spinosa SOL 214976 Kintana 2043622 - Fim
    //Add('  F.PERCENTUAL, F.FLGPENSAO, to_number(SEQRUB.VALOR) AS SEQU'); //Everson Cunha - SIG115547
    Add('  to_number(SEQRUB.VALOR) AS SEQU');                              //Everson Cunha - SIG115547
    Add('FROM');
    Add('  ' +CmpRptCM.ParamByName('NomeTabela').asString+
      ' H, PESSOA PJ, PESSOA PF, RUBRICAXPESS RP, PROVDESC P,');
    Add('  PESSOAFISICA PFIS, FUNCIONARIO F, CARGO C, ENDPESS E1, ENDPESS E2,');
    Add('  CIDADES CI1, CIDADES CI2, ESTADO ES1, ESTADO ES2, MOTIVO MO, FORMARESCFGTS FR,');
    //Marcio Sanches Spinosa SOL 214976 Kintana 2043622 - Inicio
    Add(' PESSOA PESSOASINDICATO, SINDICATO SINDI,  ');
    //Marcio Sanches Spinosa SOL 214976 Kintana 2043622 - Fim
    Add('  SITFUNC S, FILIALPESSOA FP, VALTABGENER VT, '+
      FU.IFF(CmpRptCM.ParamByName('ExibeCCusto').asBoolean, ' CENTCUST CC,', ''));
    // -------------------------------------------------------------------- //
    // Percentual de Pensão Alimentícia do Funcionário
    Add('  (SELECT RI.IDPESSOA, SUM(RI.VALORRUBRICA) AS VALOR');
    Add('   FROM   RUBRICAINDIV RI, PROVDESC PD');
    Add('   WHERE (PD.CODRUBCLT    = ''50018'') AND');

    // Funcionários escolhidos
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('         (RI.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString,4));
    
    Add('         (PD.IDPROVENTO   = RI.IDRUBRICA)');
    Add('   GROUP BY RI.IDPESSOA) PENSAOALIM,');
    // ------------------------------------------------------------------- //
    // Responsável
    Add('  (SELECT IDENDERECO, NOME, CARGO');
    Add('   FROM   CONTATOPESS');
    Add('   WHERE (IDCONTATO = ' +CmpRptCM.ParamByName('IdResponsavel').asString+ ')) RESPONSAVEL,');
    // -------------------------------------------------------------------- //
    // Saldo para fins rescisórios do Empregado
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P, FUNCIONARIO F');
    Add('   WHERE (P.CODRUBCLT  IN (''90007'',''63012'')) AND'); // Maior Remuneração

    // Funcionários escolhidos
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('         (H.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString,4));

    Add('         (H.IDPESSOA   = F.IDPESSOA) AND');

    case (CmpRptCM.ParamByName('TipoRescisao').asInteger) of
      0 : Add('         (H.IDMOTIVO   = F.IDMOTIVODESLIGRAIS) AND');
      1 : Add('         (H.IDMOTIVO   = F.IDMOTIVODESLIGGERENCIAL) AND');
      2 :  Add('         (H.IDMOTIVO   = ' + CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
    end;

    Add('         (H.MES        = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    Add('         (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA, P.IDPROVENTO) REM_FINS_RESC,');
    // -------------------------------------------------------------------- //
    // PIS do Empregado
    Add('  (SELECT IDPESSOA, RTRIM(NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[1])+ ')) PIS,');
    // -------------------------------------------------------------------- //
    // CTPS do Empregado
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES');
    Add('   WHERE (DP.IDDOCUMENTO = ' +IntToStr(DocID[2])+ ') AND');
    Add('         (DP.IDESTADO    = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------- //
    // CPF do Empregado
    Add('  (SELECT IDPESSOA, RTRIM(NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[3])+ ')) CPF,');

    Add('  (SELECT NUMLINHA, VALOR FROM VALTABGENER');
    Add('       WHERE CODTABELA = ''TERMORES'' ');
    Add('       AND CODCAMPO = ''SEQ'') SEQRUB');

    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA          = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');

    // Funcionários escolhidos
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (F.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString,10));

    Add('  (S.TIPOSIT            = ''D'') AND');
    Add('  ((P.CODRUBCLT        <> ''63012'') OR');
    Add('   (P.CODRUBCLT        IS NULL)) AND');
    Add('  (P.FLGDESCONTO        < 2) AND');
    Add('  (H.IDPESSJUR          = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
    Add('  (H.MES                = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    Add('  (PJ.IDPESSOA          = FP.IDFILIALPESSOA) AND');
    Add('  (S.IDSITFUNC          = F.IDSITFUNC) AND');
    Add('  (F.IDFORMARESC        = FR.IDFORMARESC) AND');

    case (CmpRptCM.ParamByName('TipoRescisao').asInteger) of
      0 :
      begin
        Add('  (F.IDMOTIVODESLIGRAIS = 14) AND');
        Add('  (F.IDMOTIVODESLIGRAIS = 14) AND');
      end;
      1 :
      begin
        Add('  (F.IDMOTIVODESLIGGERENCIAL = 14) AND');
        Add('  (F.IDMOTIVODESLIGGERENCIAL = 14) AND');
      end;
      2 :
      begin
        Add('  (H.IDMOTIVO   = ' + CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
        Add('  (MO.IDMOTIVO  = ' + CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
      end;
    end;

    Add('  (P.IDPROVENTO         = H.IDRUBRICA) AND');
    Add('  (H.IDRUBRICA          = RP.IDRUBRICA) AND');
    Add('  (RP.IDPESSOA          = F.IDEMPRESA) AND');
    Add('  (PF.IDPESSOA          = CTPS.IDPESSOA) AND');
    Add('  (PF.IDPESSOA          = CPF.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA          = F.IDESTAB) AND');
    Add('  (PF.IDPESSOA          = F.IDPESSOA) AND');
    Add('  (F.IDPESSOA           = PFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA           = H.IDPESSOA) AND');
    Add('  (F.IDCARGO            = C.IDCARGO) AND');

    if (CmpRptCM.ParamByName('ExibeCCusto').asBoolean) then
    begin
      Add('  (F.CODCENTROCUSTO     = CC.CODCENTROCUSTO) AND');
      Add('  (F.IDEMPRESA          = CC.IDEMPRESA) AND');
    end;

    Add('  (PJ.IDPESSOA          = E1.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL    = E1.IDENDERECO) AND');
    Add('  (PF.IDPESSOA          = E2.IDPESSOA) AND');
    Add('  (PF.IDENDRESIDENCIAL  = E2.IDENDERECO) AND');
    Add('  (E1.IDCIDADES         = CI1.IDCIDADES) AND');
    Add('  (E2.IDCIDADES         = CI2.IDCIDADES) AND');
    Add('  (CI1.IDESTADO         = ES1.IDESTADO) AND');
    Add('  (CI2.IDESTADO         = ES2.IDESTADO) AND');
    Add('  (E1.IDENDERECO        = RESPONSAVEL.IDENDERECO) AND');
    Add('  (F.IDPESSOA           = PENSAOALIM.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA           = REM_FINS_RESC.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA       = PIS.IDPESSOA(+)) AND ');
    Add('  (RP.CODPROVDESC = VT.VALOR(+)) AND ');
    Add('  (SEQRUB.NUMLINHA(+) = VT.NUMLINHA)');
    //Marcio Sanches Spinosa SOL 214976 Kintana 2043622 - Inicio
    Add('   AND PFIS.IDSINDICATO = PESSOASINDICATO.IDPESSOA ');
    Add('   AND PFIS.IDSINDICATO = SINDI.IDPESSOA ');
    //Marcio Sanches Spinosa SOL 214976 Kintana 2043622 - Fim
    Add(') A');
    Add('ORDER BY');
    //SOL219119 - Darivaldo Alencar - inicio
    //Add(' UPPER(A.NOME_EMPREGADO), A.SEQU ASC NULLS LAST,A.TIPORUBRICA, A.CODRUBRICA');
    Add(' UPPER(A.NOME_EMPREGADO), A.TIPORUBRICA, A.SEQU ASC NULLS LAST, A.CODRUBRICA');
    //SOL219119 - Darivaldo Alencar - fim
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  GerarDadosRelat;

  frmAguarde.Max := CdsTRCT.RecordCount;
  frmAguarde.Min := 0;

  if (MascaraDoc[1] <> '') then
    rpTRCTDBTxtPIS.DisplayFormat := MascaraDoc[1] + ';0;_';
  if (MascaraDoc[2] <> '') then
    rpTRCTDBTxtCTPS.DisplayFormat := MascaraDoc[2] + ';0;_';
  if (MascaraDoc[3] <> '') then
    rpTRCTDBTxtCPF.DisplayFormat := MascaraDoc[3] + ';0;_';


  DataRubAnt:= StrToDate('1' + '/' + CmpRptCM.ParamByName('MesRef').AsString + '/' + CmpRptCM.ParamByName('AnoRef').asString);

   //Darivaldo Alencar SOL219119 -inicio
  //lblSomaRub.Caption:= FormatFloat('###,###,##0.00',  SomaHistRub('00010', DataRubAnt, 1, 1, dmCds.Cds.FieldByName('IDPESSOA').AsInteger) +
  //                                                    SomaHistRub('23990', DataRubAnt, 1, 1, dmCds.Cds.FieldByName('IDPESSOA').AsInteger));

  lblSomaRub.Caption:= FormatFloat('###,###,##0.00',  SomaHistRub('08200', DataRubAnt, 1, 1, CdsTRCT.FieldByName('IDPESSOA').AsInteger));
  //Darivaldo Alencar SOL219119 -fim
end;

procedure TRptTRCT.CdsTRCTAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTRCT.rpTRCTGrpFootBnd0BeforePrint(Sender: TObject);
begin
  //Darivaldo Alencar SOL219119 -inicio
  //rpTRCTLblTOT_PROV.Caption := CdsTRCT.FieldByName('TOT_PROV').asString;
  //rpTRCTLblTOT_DESC.Caption := CdsTRCT.FieldByName('TOT_DESC').asString;
  //rpTRCTLblTOT_LIQUIDO.Caption := CdsTRCT.FieldByName('TOT_LIQUIDO').asString;
  //Darivaldo Alencar SOL219119 -fim
end;

procedure TRptTRCT.rpTRCTSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptTRCT.GerarDadosRelat;
var
  sCPF: string;
  rTotProv, rTotDesc: real;
  Col, Lin, iNumPagina: integer;
  SeqAnt: String;
  
  //Darivaldo Alencar SOL219119 -incio
  iColuna, iTpRubrica:Integer;
  sSeqAtual: string;
  bPendente: boolean;
  //Darivaldo Alencar SOL219119 -fim
begin
  sqlTRCT.Open;
  dmCds.sql.Open;
  Seq:= 0;
  bPendente:= False; //Darivaldo Alencar SOL219119
  if not(dmCds.Cds.IsEmpty) then
  begin
    // Atribui Dados da Query Auxiliar à Principal
    dmCds.Cds.First;
    iNumPagina := 1;
    repeat
      Lin := 1;
      sCPF := dmCds.Cds.FieldByName('CPF').asString;

      iColuna:= 1; //Darivaldo Alencar SOL219119
      repeat
        //----------------------------------------------------------------------------------------------------------------------------------------
        //Thaise SOL144594 - Somar a rubrica do mês anterior com o mês atual
//        DataRubAnt:= StrToDate('1' + '/' + CmpRptCM.ParamByName('MesRef').AsString + '/' + CmpRptCM.ParamByName('AnoRef').asString);


//        lblSomaRub.Caption:= FormatFloat('###,###,##0.00',  SomaHistRub('00010', DataRubAnt, 1, 1, dmCds.Cds.FieldByName('IDPESSOA').AsInteger) +
//                                                            SomaHistRub('23990', DataRubAnt, 1, 1, dmCds.Cds.FieldByName('IDPESSOA').AsInteger));
       //Thaise SOL144594
       //-----------------------------------------------------------------------------------------------------------------------------------------

        //Thaise SOL153959 - Trocado Insert por Append, já que o insert estava funcionando aqui e em
        //outras maquinas não.

        if (iColuna = 1) then //Darivaldo Alencar SOL218119
          begin
              CdsTRCT.Append;
              for Col:=0 to dmCds.Cds.FieldCount-1 do
             //CdsTRCT.Fields[Col].asString := dmCds.Cds.Fields[Col].asString;
              CdsTRCT.FieldByName(dmCds.Cds.Fields[Col].FieldName).asString := dmCds.Cds.Fields[Col].asString;
        //Darivaldo Alencar SOL218119 -inicio
          end
        else
         CdsTRCT.edit;

         if (dmCds.Cds.fieldbyname('SEQU').asInteger =  dmCds.Cds.fieldbyname('NextSEQU').asInteger) or (bPendente) then
           begin
              inc(seq);
              sSeqAtual:= dmCds.Cds.fieldbyname('SEQU').asstring  + '.' + IntToStr(seq);
              if (dmCds.Cds.fieldbyname('SEQU').asInteger =  dmCds.Cds.fieldbyname('NextSEQU').asInteger) then
                  bPendente:= True
              else begin
                  seq:= 0;
                  bPendente:= False;
              end;
           end
         else begin
            seq:= 0;
            sSeqAtual:= dmCds.Cds.fieldbyname('SEQU').asstring;
         end;

         Case iColuna of
           1: begin
                //Everson Cunha - SIG71744 - Início

                if (dmCds.Cds.fieldbyname('REFERENCIA').AsString <> '***') and (dmCds.Cds.fieldbyname('REFERENCIA').AsString <> 'Rescisão')
                                                                           and (dmCds.Cds.fieldbyname('REFERENCIA').AsString <> '') then
                begin
                  //Saldo de Salário        - 3300
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3300 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Aviso Prévio Indenizado - 3310
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3310 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Férias Vencidas         - 3320
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3320 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Férias Proporcionais                  - 3330
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3330 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //Férias Proporcionais Indenizadas      - 3340
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3340 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //13 Salário Proporcional               - 3360
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3360 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //13 Salario Indenizado S/ Aviso Prévio - 3370
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3370 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //Horas Extras 100%               - 32068
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 32068 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras 75%                - 40912
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 40912 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras 50%                - 40
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 40 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras 50% Banco de Horas - 39714
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39714 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras Noturnas 100%      - 32092
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 32092 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras Noturnas 75%       - 40918
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 40918 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras Noturnas 50%       - 32090
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 32090 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Sobreaviso                - 39557
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39557 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Intervalo Interjornada          - 39517
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39517 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Débito Banco de Horas           - 39530
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39530 then
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //as demais não mapeadas neste atendimento
                    CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString;
                end
                else
                //Everson Cunha - SIG71744 - Fim
                  CdsTRCT.FieldByName('descricao_01').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString;

                CdsTRCT.FieldByName('valor_01').AsCurrency  := dmCds.Cds.fieldbyname('proventos').AsCurrency + dmCds.Cds.fieldbyname('descontos').AsCurrency;
              end;
           2: begin
                //Everson Cunha - SIG71744 - Início
                if (dmCds.Cds.fieldbyname('REFERENCIA').AsString <> '***') and (dmCds.Cds.fieldbyname('REFERENCIA').AsString <> 'Rescisão')
                                                                           and (dmCds.Cds.fieldbyname('REFERENCIA').AsString <> '') then
                begin
                  //Saldo de Salário
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3300 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Aviso Prévio Indenizado
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3310 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Férias Vencidas
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3320 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Férias Proporcionais
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3330 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //Férias Proporcionais Indenizadas
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3340 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //13 Salário Proporcional
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3360 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //13 Salario Indenizado S/ Aviso Prévio
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3370 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //Horas Extras 100%               - 32068
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 32068 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras 75%                - 40912
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 40912 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras 50%                - 40
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 40 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras 50% Banco de Horas - 39714
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39714 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras Noturnas 100%      - 32092
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 32092 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras Noturnas 75%       - 40918
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 40918 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras Noturnas 50%       - 32090
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 32090 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Sobreaviso                - 39557
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39557 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Intervalo Interjornada          - 39517
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39517 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Débito Banco de Horas           - 39530
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39530 then
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //as demais não mapeadas neste atendimento
                    CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString;
                end
                else
                //Everson Cunha - SIG71744 - Fim
                  CdsTRCT.FieldByName('descricao_02').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString;

                CdsTRCT.FieldByName('valor_02').AsCurrency  := dmCds.Cds.fieldbyname('proventos').AsCurrency + dmCds.Cds.fieldbyname('descontos').AsCurrency;
              end;
           3: begin
                //Everson Cunha - SIG71744 - Início
                if (dmCds.Cds.fieldbyname('REFERENCIA').AsString <> '***') and (dmCds.Cds.fieldbyname('REFERENCIA').AsString <> 'Rescisão')
                                                                           and (dmCds.Cds.fieldbyname('REFERENCIA').AsString <> '') then
                begin
                  //Saldo de Salário
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3300 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Aviso Prévio Indenizado
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3310 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Férias Vencidas
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3320 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Férias Proporcionais
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3330 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //Férias Proporcionais Indenizadas
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3340 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //13 Salário Proporcional
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3360 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' +  dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //13 Salario Indenizado S/ Aviso Prévio
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 3370 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString + ' avos'
                  else
                  //Horas Extras 100%               - 32068
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 32068 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras 75%                - 40912
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 40912 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras 50%                - 40
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 40 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras 50% Banco de Horas - 39714
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39714 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras Noturnas 100%      - 32092
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 32092 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras Noturnas 75%       - 40918
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 40918 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Extras Noturnas 50%       - 32090
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 32090 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Horas Sobreaviso                - 39557
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39557 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Intervalo Interjornada          - 39517
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39517 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //Débito Banco de Horas           - 39530
                  if dmCds.Cds.fieldbyname('IDPROVENTO').AsInteger = 39530 then
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString + ' - ' + dmCds.Cds.fieldbyname('REFERENCIA').AsString
                  else
                  //as demais não mapeadas neste atendimento
                    CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString;
                end
                else
                //Everson Cunha - SIG71744 - Fim
                  CdsTRCT.FieldByName('descricao_03').AsString:= sSeqAtual + ' - ' + dmCds.Cds.fieldbyname('RUBRICA').AsString;

                CdsTRCT.FieldByName('valor_03').AsCurrency  := dmCds.Cds.fieldbyname('proventos').AsCurrency + dmCds.Cds.fieldbyname('descontos').AsCurrency;
              end;
         end;

         CdsTRCT.FieldByName('somagrupo').AsCurrency   := CdsTRCT.FieldByName('valor_01').AsCurrency +
                                                          CdsTRCT.FieldByName('valor_02').AsCurrency +
                                                          CdsTRCT.FieldByName('valor_03').AsCurrency;

         //Darivaldo Alencar SOL219119 -fim

        //Showmessage(CdsTRCT.FieldbyName('SEQU').Asstring);
        CdsTRCT.FieldByName('NUMPAGINA').asInteger  := iNumPagina;
        CdsTRCT.FieldByName('TOT_PROV').asString    := 'CONTINUA';
        CdsTRCT.FieldByName('TOT_DESC').asString    := 'CONTINUA';
        CdsTRCT.FieldByName('TOT_LIQUIDO').asString := 'CONTINUA';
        CdsTRCT.Post;

        Inc(Lin);
        //Thaise SOL144594 - Antes estava imprimindo até 24 rubricas por página.
        //Agora, para aproveitar mais o espaço do relatório, será impresso até 33 rubricas
        //if (Lin = 33) then //Darivaldo Alencar SOL219119
        if (Lin = 39) then   //Darivaldo Alencar SOL219119
        begin
          Lin := 1;
          Inc(iNumPagina);
        end;

        iTpRubrica := dmCds.Cds.fieldbyname('TIPORUBRICA').AsInteger;//Darivaldo Alencar SOL219119
        
        dmCds.Cds.Next;

        //Darivaldo Alencar SOL219119 -inicio
        inc(iColuna);
        if ((iColuna > 3) or (iTpRubrica <> dmCds.Cds.fieldbyname('TIPORUBRICA').AsInteger) or (sCPF <> dmCds.Cds.FieldByName('CPF').asString) or (dmCds.Cds.EOF)) then
            iColuna:= 1;
        //Darivaldo Alencar SOL219119 -fim

      until (dmCds.Cds.EOF) or (sCPF <> dmCds.Cds.FieldByName('CPF').asString);
      Inc(iNumPagina);

    until (dmCds.Cds.EOF);

    // Somatório de Totais por Pessoa
    CdsTRCT.First;
    repeat
      rTotDesc := 0;
      rTotProv := 0;
      sCPF := CdsTRCT.FieldByName('CPF').asString;

      repeat
        if (CdsTRCT.FieldByName('TIPORUBRICA').asInteger = 1) then
          //Darivaldo Alencar SOL219119 -inicio
          //rTotDesc := rTotDesc + CdsTRCT.FieldByName('DESCONTOS').asFloat
          rTotDesc := rTotDesc + CdsTRCT.FieldByName('somagrupo').asFloat
        else
          //rTotProv := rTotProv + CdsTRCT.FieldByName('PROVENTOS').asFloat;
          rTotProv := rTotProv + CdsTRCT.FieldByName('somagrupo').asFloat;
//
//      //-------------------------------------------------------------------------------------------------
//      //Thaise SOL144594 - As rubricas serão ordenadas pela sequencia cadastrada na tabela
//      //genérica. Se a rubrica repetir, precisa colocar uma outra sequencia na frente dela.
//      {Exemplo: 59.1
//                59.2
//                59.3
//                59.4
//                56.1
//                56.2
//                52
//                51}
//      //No setect, existe um campo chamado NEXTSEQU que verifica qual a proxima sequencia.
//      {Exemplo:
//
//      Seq      NextSequ
//      59          59   <-- A sequencia atual é 59, a proxima será 59.
//      59          59
//      59          59
//      59          56
//      56          52
//      52          51
//      51               }
//      //1. Se não houver nenhuma sequencia, não faço a rotina
//
////      if TRIM(CdsTRCT.FieldByName('SEQU').AsString) <> '' then
//      begin
//        //2. Se a proxima sequencia for igual a sequencia atual, coloco uma outra sequencia na frente
//        if (CdsTRCT.FieldByName('SEQU').AsString = CdsTRCT.FieldByName('NextSEQU').AsString) then
//        begin
//          //3. Guardo a ultima sequencia
//          SeqAnt:= CdsTRCT.FieldByName('SEQU').AsString;
//          CdsTRCT.Edit;
//          CdsTRCT.FieldByName('SEQU').AsString:= CdsTRCT.FieldByName('SEQU').AsString + '.' +  InttoStr(Seq + 1);
//          //4. Depois incremento
//          Inc(Seq);
//          CdsTRCT.Post;
//        end else
//        begin
//          //5. Se a sequencia seguinte for igual a ultima sequencia guardada, atualizo a sequencia
//          if CdsTRCT.FieldByName('SEQU').AsString = SeqAnt then
//          begin
//             CdsTRCT.Edit;
//             CdsTRCT.FieldByName('SEQU').AsString:= CdsTRCT.FieldByName('SEQU').AsString + '.' +  InttoStr(Seq + 1);
//             CdsTRCT.Post;
//          end;
//          SeqAnt:= '';
//          Seq:= 0;
//        end;
//      end;
//      //-------------------------------------------------------------------------------------------------
        //Darivaldo Alencar SOL219119 -fim

      CdsTRCT.Next;
      until (CdsTRCT.EOF) or (sCPF <> CdsTRCT.FieldByName('CPF').asString);

     if (CmpRptCM.ParamByName('TotaisTodasFolhas').asBoolean) then
      begin
        CdsTRCT.Locate('CPF', sCPF, []);
        repeat
          CdsTRCT.Edit;

          CdsTRCT.FieldByName('TOT_PROV').asString := FormatFloat('###,###,##0.00', rTotProv);
          CdsTRCT.FieldByName('TOT_DESC').asString := FormatFloat('###,###,##0.00', rTotDesc);
          CdsTRCT.FieldByName('TOT_LIQUIDO').asString := FormatFloat('###,###,##0.00', rTotProv - rTotDesc);
          CdsTRCT.Post;
          CdsTRCT.Next;
        until (CdsTRCT.EOF) or (sCPF <> CdsTRCT.FieldByName('CPF').asString);
      end
      else
      begin
        // Atribuo os Totais na última linha de Rubricas
        if not(CdsTRCT.EOF) then
          CdsTRCT.Prior;
        CdsTRCT.Edit;
        CdsTRCT.FieldByName('TOT_PROV').asString := FormatFloat('###,###,##0.00', rTotProv);
        CdsTRCT.FieldByName('TOT_DESC').asString := FormatFloat('###,###,##0.00', rTotDesc);
        CdsTRCT.FieldByName('TOT_LIQUIDO').asString := FormatFloat('###,###,##0.00', rTotProv - rTotDesc);
        CdsTRCT.Post;
        CdsTRCT.Next;
      end;
      //CdsTRCT.Next;
    until(CdsTRCT.EOF);
  end
  else
  begin
    CdsTRCT.Insert;
    CdsTRCT.Post;
  end;
  CdsTRCT.First;

end;


//Thaise SOL144594 - Função SomaHistRub para carregar o valor da rubrica do mês anterior.
function TRptTRCT.SomaHistRub(CodProvDesc: string; DataRef: TDate;
  QtdeMeses, TipoFolha, idPessoa: integer): double;
var  sSql: String;
begin
    sSql:= 'SELECT SUM(VALORPROVENTO) AS VALORPROVENTO'+CR_LF+
           'FROM   HISTRUBSAL'+CR_LF+
           'WHERE (IDPESSOA    = ' + InttoStr(idPessoa) + ') AND'+CR_LF+
           '      (CODPROVDESC = ' +QuotedStr(CodProvDesc)+ ') AND'+CR_LF+
           '      (MES   BETWEEN ' +QuotedStr(FU.IncDataAM(FU.RetornaAnoMes(DataRef),-QtdeMeses))+' AND '+
                                    QuotedStr(FU.IncDataAM(FU.RetornaAnoMes(DataRef),-1))+') AND'+CR_LF+
           '      (IDMODULO    = 21) AND'+CR_LF+
           '      (IDPESSJUR   = ' +IntToStr(Sistema.IdEmpresa)+ ') AND'+CR_LF+
           '      (MES  NOT LIKE ''%13'')'+CR_LF+
           FU.IFF(TipoFolha<>-1, ' AND  (IDMOTIVO = ' +IntToStr(TipoFolha)+ ')', '');

  qryRubAnt.Close;
  qryRubAnt.Sql.Clear;
  qryRubAnt.Sql.Add(sSql);
  qryRubAnt.Open;

  Result := qryRubAnt.FieldByName('VALORPROVENTO').asFloat;

end;

procedure TRptTRCT.rpTRCTGrpHdrBnd0BeforePrint(Sender: TObject);
var DataRubAnt: TDate;
begin
  inherited;
  //Thaise SOL144594 - Somar as duas rubricas do mês anterior.

  DataRubAnt:= StrToDate('1' + '/' + CmpRptCM.ParamByName('MesRef').AsString + '/' + CmpRptCM.ParamByName('AnoRef').asString);

  //Darivaldo Alencar SOL219119 -inicio
  //lblSomaRub.Caption:= FormatFloat('###,###,##0.00',  SomaHistRub('00010', DataRubAnt, 1, 1, CdsTRCT.FieldByName('IDPESSOA').AsInteger) +
  //                                                    SomaHistRub('23990', DataRubAnt, 1, 1, CdsTRCT.FieldByName('IDPESSOA').AsInteger));
  lblSomaRub.Caption:= FormatFloat('###,###,##0.00',  SomaHistRub('08200', DataRubAnt, 1, 1, CdsTRCT.FieldByName('IDPESSOA').AsInteger));
  //Darivaldo Alencar SOL219119 -fim
end;


//Darivaldo ALencar SOL219119 -inicio
procedure TRptTRCT.ppGroupHeaderBand2BeforeGenerate(Sender: TObject);
begin
  inherited;
  if (CdsTRCT.fieldbyname('tiporubrica').AsInteger = 0) then
     begin
      lblTipoVerba.Caption:= 'VERBAS RESCISÓRIAS';
      ppLabel31.Caption   := 'Rubrica';
      lblValorBloco.caption:='TOTAL BRUTO';
      dValorRubrica[1]:= 0;
     end
  else begin
    lblTipoVerba.Caption := 'DEDUÇÕES';
    ppLabel31.Caption   := 'Desconto';
    lblValorBloco.caption:='TOTAL DEDUÇÕES';
    dValorRubrica[2]:= 0;
  end;
  ppLabel32.caption := ppLabel31.Caption;
  ppLabel34.caption := ppLabel31.Caption;
  Application.ProcessMessages;
end;

procedure TRptTRCT.ppGroupFooterBand1BeforeGenerate(Sender: TObject);
begin
  inherited;
  rpTRCTLblTOT_LIQUIDO.Caption := CdsTRCT.fieldbyname('TOT_LIQUIDO').AsString;
  rpTRCTLblTOT_PROV.Caption := CdsTRCT.FieldByName('TOT_PROV').asString;
  rpTRCTLblTOT_DESC.Caption := CdsTRCT.FieldByName('TOT_DESC').asString;
end;

procedure TRptTRCT.rpTRCTDtlBndBeforeGenerate(Sender: TObject);
begin
  inherited;
   if (CdsTRCT.fieldbyname('tiporubrica').AsInteger = 0) then
       //Proventos
       dValorRubrica[1]:= dValorRubrica[1] + CdsTRCT.fieldbyname('somagrupo').AsFloat
   else
       //Descontos
       dValorRubrica[2]:= dValorRubrica[2] + CdsTRCT.fieldbyname('somagrupo').AsFloat;
end;

procedure TRptTRCT.ppGroupFooterBand2BeforeGenerate(Sender: TObject);
begin
  inherited;
  if (CdsTRCT.fieldbyname('tiporubrica').AsInteger = 0) then
    lblValorGrupo.Caption := FormatFloat('###,###,##0.00',dValorRubrica[1])
  else
    lblValorGrupo.Caption := CdsTRCT.FieldByName('TOT_DESC').asString;
end;
//Darivaldo ALencar SOL219119 -fim

end.
