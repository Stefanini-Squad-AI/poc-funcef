// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ ------------------------------------------------------------------------------
Nº SIG......: 115547
Data........: 26/04/2021
Responsável.: Everson Cunha
Descrição...: Retirar campos que não são mais utilizados no eSocial
--------------------------------------------------------------------------------
Rotina......: CrmRptCMBeforePrint, rpTRCTGrpFootBnd0BeforePrint, rpTRCTGrpHdrBnd0BeforePrint
Nº SOL......: 214976
Nº KINTANA..: 2043622
Data........: 27/08/2013
Responsável.: Marcio Sanches Spinosa SOL 214976 Kintana 2043622
Descrição...: Ajuste no relatório para carregar as informações do sindicato diretamente da pessoa.
{ --------------------------------------------------------------------------------------------------
Rotina......: CrmRptCMBeforePrint, rpTRCTGrpFootBnd0BeforePrint, rpTRCTGrpHdrBnd0BeforePrint
Nº SOL......: 186698
Nº KINTANA..: 1764805
Data........: 09/10/2012
Responsável.: Thiago Melo
Descrição...: Adicionado dois termos de rescisão de contrato (Homologação e Quitação) e alteração
              no layout do termo vigente.
{ --------------------------------------------------------------------------------------------------
Rotina......: GerarDadosRelat
Nº SOL......: 153959
Nº KINTANA..: 1166740
Data........: 02/03/2011
Responsável.: Thaise Amaral Martins
Descrição...: Trocado Insert por Append, pois em algumas máquinas a ordenação não ocorria
              usando o comando Insert.
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 144594       renata
Nº KINTANA..: 954455
Data........: 08/02/2011
Responsável.: Thaise Amaral Martins
Descrição...: Alterar o lay-out do relatorio para um novo padrão de ordem de registros
-------------------------------------------------------------------------------------------------- }

// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RTRCT_Homologacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppCtrls, ppBands, ppClass, ppPrnabl,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, TXRB, USistema, 
  DBTables, ppVar, ppParameter, ppModule, raCodMod;

type
  TRptTRCT_Homologacao = class(TFrmCmReport)
    rpTRCT: TppReport;
    ppTRCT: TppBDEPipeline;
    dsTRCT: TwwDataSource;
    sqlTRCT: TCMSqlParams;
    CdsTRCT: TCMClientDataSet;
    qryRubAnt: TQuery;
    ppParameterList1: TppParameterList;
    rpTRCTDtlBnd: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    rpTRCTSmryBnd: TppSummaryBand;
    rpTRCTGroup1: TppGroup;
    rpTRCTGrpHdrBnd0: TppGroupHeaderBand;
    ppShape2: TppShape;
    rpTRCTDBTxtCentroCusto: TppDBText;
    ppShape16: TppShape;
    ppLabel2: TppLabel;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppDBText13: TppDBText;
    rpTRCTDBTxtPIS: TppDBText;
    ppShape21: TppShape;
    ppLabel20: TppLabel;
    ppDBText22: TppDBText;
    ppLine8: TppLine;
    ppShape1: TppShape;
    ppLabel16: TppLabel;
    ppDBText33: TppDBText;
    ppShape3: TppShape;
    ppLabel12: TppLabel;
    ppDBText14: TppDBText;
    ppShape4: TppShape;
    ppLine2: TppLine;
    ppLabel15: TppLabel;
    ppDBText17: TppDBText;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppDBText15: TppDBText;
    ppLine12: TppLine;
    ppLabel17: TppLabel;
    ppDBText34: TppDBText;
    ppLine17: TppLine;
    ppLabel59: TppLabel;
    ppDBText1: TppDBText;
    ppLabel13: TppLabel;
    ppDBText32: TppDBText;
    ppMemo1: TppMemo;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine4: TppLine;
    ppLabel5: TppLabel;
    ppLine5: TppLine;
    ppLabel6: TppLabel;
    ppLabel19: TppLabel;
    rpTRCTDBTxtCTPS: TppDBText;
    ppDBText19: TppDBText;
    rpTRCTDBTxtCPF: TppDBText;
    ppLabel27: TppLabel;
    ppLine1: TppLine;
    ppLabel28: TppLabel;
    ppDBText30: TppDBText;
    ppLine6: TppLine;
    ppLabel26: TppLabel;
    ppDBText28: TppDBText;
    ppShape9: TppShape;
    ppLine7: TppLine;
    ppLabel61: TppLabel;
    ppLabel63: TppLabel;
    ppLabel10: TppLabel;
    ppLine9: TppLine;
    ppLabel18: TppLabel;
    ppLine10: TppLine;
    ppShape11: TppShape;
    ppLabel21: TppLabel;
    ppShape12: TppShape;
    ppLabel1: TppLabel;
    ppLabel54: TppLabel;
    ppLabel14: TppLabel;
    ppLabel55: TppLabel;
    rpTRCTGrpFootBnd0: TppGroupFooterBand;
    ppMemo2: TppMemo;
    ppShape6: TppShape;
    ppLabel7: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine11: TppLine;
    ppLine13: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsTRCTAfterScroll(DataSet: TDataSet);
    procedure rpTRCTSmryBndAfterPrint(Sender: TObject);
    procedure rpTRCTGrpFootBnd0BeforePrint(Sender: TObject);
    procedure rpTRCTGrpHdrBnd0BeforePrint(Sender: TObject);

  private
    Seq: Integer;
    
    procedure GerarDadosRelat;
    function SomaHistRub(CodProvDesc: string; DataRef: TDate; QtdeMeses, TipoFolha, idPessoa: integer): double;

  end;

var
  RptTRCT_Homologacao: TRptTRCT_Homologacao;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TRptTRCT_Homologacao.CrmRptCMBeforePrint(Sender: TObject);
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
    Add('SELECT A.*, lead(A.SEQU) over (order by UPPER(A.NOME_EMPREGADO), A.SEQU ASC NULLS LAST, A.TIPORUBRICA, A.CODRUBRICA) as NextSEQU');
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
    Add('  to_number(SEQRUB.VALOR) AS SEQU');   //Everson Cunha - SIG115547
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
    Add(' UPPER(A.NOME_EMPREGADO), A.SEQU ASC NULLS LAST, A.TIPORUBRICA, A.CODRUBRICA');

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

{  lblSomaRub.Caption:= FormatFloat('###,###,##0.00',  SomaHistRub('00010', DataRubAnt, 1, 1, dmCds.Cds.FieldByName('IDPESSOA').AsInteger) +
                                                      SomaHistRub('23990', DataRubAnt, 1, 1, dmCds.Cds.FieldByName('IDPESSOA').AsInteger));}



end;

procedure TRptTRCT_Homologacao.CdsTRCTAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTRCT_Homologacao.rpTRCTGrpFootBnd0BeforePrint(Sender: TObject);
begin
{  rpTRCTLblTOT_PROV.Caption := CdsTRCT.FieldByName('TOT_PROV').asString;
  rpTRCTLblTOT_DESC.Caption := CdsTRCT.FieldByName('TOT_DESC').asString;
  rpTRCTLblTOT_LIQUIDO.Caption := CdsTRCT.FieldByName('TOT_LIQUIDO').asString;}
end;

procedure TRptTRCT_Homologacao.rpTRCTSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptTRCT_Homologacao.GerarDadosRelat;
var
  sCPF: string;
  rTotProv, rTotDesc: real;
  Col, Lin, iNumPagina: integer;
  SeqAnt: String;

begin
  sqlTRCT.Open;
  dmCds.sql.Open;
  Seq:= 0;
  if not(dmCds.Cds.IsEmpty) then
  begin
    // Atribui Dados da Query Auxiliar à Principal
    dmCds.Cds.First;
    iNumPagina := 1;
    repeat
      Lin := 1;
      sCPF := dmCds.Cds.FieldByName('CPF').asString;
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
        CdsTRCT.Append;
        for Col:=0 to dmCds.Cds.FieldCount-1 do
          //CdsTRCT.Fields[Col].asString := dmCds.Cds.Fields[Col].asString;
          CdsTRCT.FieldByName(dmCds.Cds.Fields[Col].FieldName).asString := dmCds.Cds.Fields[Col].asString;
        //Showmessage(CdsTRCT.FieldbyName('SEQU').Asstring);
        CdsTRCT.FieldByName('NUMPAGINA').asInteger  := iNumPagina;
        CdsTRCT.FieldByName('TOT_PROV').asString    := 'CONTINUA';
        CdsTRCT.FieldByName('TOT_DESC').asString    := 'CONTINUA';
        CdsTRCT.FieldByName('TOT_LIQUIDO').asString := 'CONTINUA';
        CdsTRCT.Post;

        Inc(Lin);
        //Thaise SOL144594 - Antes estava imprimindo até 24 rubricas por página.
        //Agora, para aproveitar mais o espaço do relatório, será impresso até 33 rubricas
        if (Lin = 33) then
        begin
          Lin := 1;
          Inc(iNumPagina);
        end;
        dmCds.Cds.Next;
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
          rTotDesc := rTotDesc + CdsTRCT.FieldByName('DESCONTOS').asFloat
        else
          rTotProv := rTotProv + CdsTRCT.FieldByName('PROVENTOS').asFloat;



      //-------------------------------------------------------------------------------------------------
      //Thaise SOL144594 - As rubricas serão ordenadas pela sequencia cadastrada na tabela
      //genérica. Se a rubrica repetir, precisa colocar uma outra sequencia na frente dela.
      {Exemplo: 59.1
                59.2
                59.3
                59.4
                56.1
                56.2
                52
                51}
      //No setect, existe um campo chamado NEXTSEQU que verifica qual a proxima sequencia.
      {Exemplo:

      Seq      NextSequ
      59          59   <-- A sequencia atual é 59, a proxima será 59.
      59          59
      59          59
      59          56
      56          52
      52          51
      51               }
      //1. Se não houver nenhuma sequencia, não faço a rotina
      if TRIM(CdsTRCT.FieldByName('SEQU').AsString) <> '' then
      begin
        //2. Se a proxima sequencia for igual a sequencia atual, coloco uma outra sequencia na frente
        if (CdsTRCT.FieldByName('SEQU').AsString = CdsTRCT.FieldByName('NextSEQU').AsString) then
        begin
          //3. Guardo a ultima sequencia
          SeqAnt:= CdsTRCT.FieldByName('SEQU').AsString;
          CdsTRCT.Edit;
          CdsTRCT.FieldByName('SEQU').AsString:= CdsTRCT.FieldByName('SEQU').AsString + '.' +  InttoStr(Seq + 1);
          //4. Depois incremento
          Inc(Seq);
          CdsTRCT.Post;
        end else
        begin
          //5. Se a sequencia seguinte for igual a ultima sequencia guardada, atualizo a sequencia
          if CdsTRCT.FieldByName('SEQU').AsString = SeqAnt then
          begin
             CdsTRCT.Edit;
             CdsTRCT.FieldByName('SEQU').AsString:= CdsTRCT.FieldByName('SEQU').AsString + '.' +  InttoStr(Seq + 1);
             CdsTRCT.Post;
          end;
          SeqAnt:= '';
          Seq:= 0;
        end;
      end;
      //-------------------------------------------------------------------------------------------------


      CdsTRCT.Next;
      until (CdsTRCT.EOF) or (sCPF <> CdsTRCT.FieldByName('CPF').asString);


//      if (CmpRptCM.ParamByName('TotaisTodasFolhas').asBoolean) then
//      begin
        CdsTRCT.Locate('CPF', sCPF, []);
        repeat
          CdsTRCT.Edit;

          CdsTRCT.FieldByName('TOT_PROV').asString := FormatFloat('###,###,##0.00', rTotProv);
          CdsTRCT.FieldByName('TOT_DESC').asString := FormatFloat('###,###,##0.00', rTotDesc);
          CdsTRCT.FieldByName('TOT_LIQUIDO').asString := FormatFloat('###,###,##0.00', rTotProv - rTotDesc);
          CdsTRCT.Post;
          CdsTRCT.Next;
        until (CdsTRCT.EOF) or (sCPF <> CdsTRCT.FieldByName('CPF').asString);
      {end
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
      -  CdsTRCT.Next;
      end;            }
      //CdsTRCT.Next;
    until (CdsTRCT.EOF);
  end
  else
  begin
    CdsTRCT.Insert;
    CdsTRCT.Post;
  end;
  CdsTRCT.First;
end;


//Thaise SOL144594 - Função SomaHistRub para carregar o valor da rubrica do mês anterior.
function TRptTRCT_Homologacao.SomaHistRub(CodProvDesc: string; DataRef: TDate;
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

procedure TRptTRCT_Homologacao.rpTRCTGrpHdrBnd0BeforePrint(Sender: TObject);
var DataRubAnt: TDate;
begin
  inherited;


  //Thaise SOL144594 - Somar as duas rubricas do mês anterior.

{  DataRubAnt:= StrToDate('1' + '/' + CmpRptCM.ParamByName('MesRef').AsString + '/' + CmpRptCM.ParamByName('AnoRef').asString);


  lblSomaRub.Caption:= FormatFloat('###,###,##0.00',  SomaHistRub('00010', DataRubAnt, 1, 1, CdsTRCT.FieldByName('IDPESSOA').AsInteger) +
                                                      SomaHistRub('23990', DataRubAnt, 1, 1, CdsTRCT.FieldByName('IDPESSOA').AsInteger));}

  ppMemo1.Lines.Clear;

  ppMemo1.Lines.Add(
  'Foi prestada, gratuitamente, assistência na rescisão do contrato de trabalho, nos termos do artigo n.º 477. § 1º da Consolidação das Leis do ' +#13 +
  'Trabalho  (CLT), sendo comprovado neste ato o efetivo  pagamento das verbas rescisórias especificadas no corpo do TRCT, no valor líquido ' +#13 +
  'de  R$ ' + CdsTRCT.FieldByName('TOT_LIQUIDO').asString + ' ,  o  qual, devidamente  rubricado  pelas  partes, é  parte  integrante  do  presente  Termo  de  Homologação. ' +#13 +
  'As   partes   assistidas   no  presente  ato  de  rescisão  contratual  foram  identificadas   como   legítimas   conforme   previsto  na  Instrução ' +#13 +
  'Normativa/STR n.º 15/2010. ' +#13 +
  'Fica ressalvado o direito de o trabalhador pleitear judicialmente os direitos informados no campo 155, abaixo.'
  );


//  lblSomaRub.Craption := CdsTRCT.FieldByName('TOT_LIQUIDO').asString + '  ,  o  qual, devidamente  rubricado  pelas  partes, é  parte  integrante  do  presente  Termo  de  Homologação.';

end;

end.
