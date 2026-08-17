// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//RESPONSÁVEL.: Everson Luiz Pereira Cunha
//Nº SOL......: SIG TIBERO
//Data........: 05/06/2018
//Descrição...: Retirada do 'NLS_DATE_LANGUAGE = portuguese'
//------------------------------------------------------------------------------
//RESPONSÁVEL.: Marcio Sanches Spinosa
//Nº SOL......: 149111
//Nº KINTANA..: 1066131
//Data........: 09/01/2013
//Descrição...: Alteração no escopo do relatório, tratamento para substituição
// em tempo de execução das testemunhas e representante entre outros.
//------------------------------------------------------------------------------
//RESPONSÁVEL.: Douglas Siqueira
//Nº SOL......: 171426
//Nº KINTANA..: 1537613
//Data........: 06/04/2012
//Descrição...: Alteração do limite de faixas de 9 para 20.
//------------------------------------------------------------------------------

// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RCartaComunicado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCtrls, ppClass, ppStrtch, ppRichTx,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, uExtensoCM, TXRB,
  ppModule, raCodMod, uCtrlCartaComunicado, uCtrlPadroes;

type
  TRptCartaComunicado = class(TFrmCmReport)
    rpCartaComun: TppReport;
    rpCartaComunHdrBnd6: TppHeaderBand;
    rpCartaComunDbTxtEMPRESA: TppDBText;
    rpCartaComunDtlBnd: TppDetailBand;
    rpCartaComunMemTEXTO: TppRichText;
    rpCartaComunFootBnd: TppFooterBand;
    rpCartaComunDbTxtEMPRESA2: TppDBText;
    rpCartaComunGroup1: TppGroup;
    rpCartaComunGrpHdrNOME: TppGroupHeaderBand;
    rpCartaComunLabel1: TppLabel;
    rpCartaComunDbTxtNOME: TppDBText;
    rpCartaComunDbTxtENDERECO: TppDBText;
    rpCartaComunDbTxtBAIRRO: TppDBText;
    rpCartaComunDbTxtCEPCID: TppDBText;
    rpCartaComunLabel2: TppLabel;
    rpCartaComunDbTxtASSUNTO: TppDBText;
    rpCartaComunLblDATA: TppLabel;
    rpCartaComunGroupFooterBand1: TppGroupFooterBand;
    ppCartaComun: TppBDEPipeline;
    dsCartaComun: TwwDataSource;
    sqlCartaComun: TCMSqlParams;
    CdsCartaComun: TCMClientDataSet;
    ExtensoCM: TExtensoCM;
    ppImageLogo: TppImage;
    rpCartaComunDbTxtEMPRESA3: TppDBText;
    ppImageTira: TppImage;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpCartaComunBeforePrint(Sender: TObject);
    procedure rpCartaComunLblDATAPrint(Sender: TObject);
    procedure rpCartaComunGrpHdrNOMEAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    NumCarta, ListaIdPessoaSel, ListaIdSolicitacao: string;
    LocalNossoNome, ImprimeNomeEnd: integer;
    pIntIDRepresentante, pIntIDTestemunha1, pIntIDTestemunha2 : Integer;
    CtrlCartaComunicado : TCtrlCartaComunicado;
    pCds : TCMClientDataSet;
    function CarregaDadosFuncionario(pIdFunc : Integer) : OleVariant;

  end;

var
  RptCartaComunicado: TRptCartaComunicado;

implementation

uses uSistema, fAguarde, uCtrlFuncoesRH;

{$R *.DFM}

procedure TRptCartaComunicado.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Cartas ou Comunicados');
  frmAguarde.pbAguarde.Visible := false;

  with (sqlCartaComun.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Campos SOMENTE usados no Relatório
    Add('  RTRIM(CARTA.ASSUNTO) AS ASSUNTO,');
    Add('  CARTA.TEXTO AS TEXTO,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(RTRIM(E.COMPLEMENTO),');
    Add('    NULL,NULL, '' - '' || RTRIM(E.COMPLEMENTO)) AS ENDERECO,');
    Add('  DECODE(RTRIM(CI.NOME),NULL,NULL,''Cidade: '' || RTRIM(CI.NOME)) ||');
    Add('  DECODE(RTRIM(E.CEP),NULL,NULL,'' CEP: '' || RTRIM(SUBSTR(E.CEP,1,5)) ||');
    Add('    ''-''|| RTRIM(SUBSTR(E.CEP,6,3))) AS CEPCID,');
    // Campos usados nas substituições de texto
    Add('  ('+QuotedStr(FormatDateTime('dd "de" mmmm "de" yyyy',Date))+') AS DTH,');
    Add('  CARTA.DATACARTA AS DTT,');
    Add('  (' +QuotedStr(Sistema.RazaoSocial)+ ') AS RZSE,');
   //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Inicio
    Add('  SUBSTR(' +QuotedStr(Sistema.NomeEmpresa)+ ', 9) AS NMFE,');
//    Add('  RTRIM(E2.LOGRADOURO) || DECODE(E2.NUMERO,NULL,NULL,'' Nº''|| E2.NUMERO) ||');
//    Add('    DECODE(RTRIM(E2.COMPLEMENTO),NULL,NULL,'' - ''|| RTRIM(E2.COMPLEMENTO)) ||');
//    Add('    DECODE(RTRIM(E2.BAIRRO),NULL,NULL,'', ''|| RTRIM(E2.BAIRRO)) ||');
//    Add('    DECODE(RTRIM(E2.CEP),NULL,NULL,'' - CEP: '' || RTRIM(SUBSTR(E2.CEP,1,5)) ||');
//    Add('    ''-''|| RTRIM(SUBSTR(E2.CEP,6,3))) || DECODE(RTRIM(CI2.NOME),NULL,NULL,');
//    Add('    '' - '' || RTRIM(CI2.NOME)) || DECODE(RTRIM(ES2.CODESTADO),NULL,NULL,');
//    Add('    '' - '' || RTRIM(ES2.CODESTADO)) AS ENDE,');
   //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Fim
    Add(''' SCN, Quadra 02, Bloco A, Ed. Corporate Financial Center, 12º e 13º andares - CEP 70712-900 - Brasília/DF '' as ENDE , ');
    Add(''' Telefone Geral: (61) 3329 1700   Central de Atendimento: 0800 706 9000 '' as ENDE2, ');
    Add('  RTRIM(E2.LOGRADOURO) AS LOGE,');
    Add('  E2.NUMERO AS NUME,');
    Add('  RTRIM(E2.COMPLEMENTO) AS CMPE,');
    Add('  RTRIM(E2.BAIRRO) AS BAIE,');
    Add('  RTRIM(SUBSTR(E2.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E2.CEP,6,3)) AS CEPE,');
    Add('  RTRIM(CI2.NOME) AS CIDE,');
    Add('  RTRIM(ES2.CODESTADO) AS ESTE,');
    Add('  RTRIM(PE.NUMDOCUMENTO) AS CNPJ,');
    Add('  RTRIM(ISCE.NUMDOCUMENTO) AS ISCE,');
    Add('  RTRIM(ISCM.NUMDOCUMENTO) AS ISCM,');
    Add('  RTRIM(DECODE(P.TIPO, ''F'', P.NOME, P.RAZAOSOCIAL)) AS NOM,');
    Add('  RTRIM(CPF.NUMDOCUMENTO) AS CPF,');
    Add('  CPF.DATAEMISSAO AS CPFD,');
    Add('  RTRIM(CPF.ORGAO) AS CPFO,');
    Add('  RTRIM(CTPS.NUMDOCUMENTO) AS CTPS,');
    Add('  CTPS.DATAEMISSAO AS CTPSD,');
    Add('  RTRIM(CTPS.UF) AS CTPSU,');
    Add('  RTRIM(RG.NUMDOCUMENTO) AS RG,');
    Add('  RG.DATAEMISSAO AS RGD,');
    Add('  RTRIM(RG.ORGAO) AS RGO,');
    Add('  RTRIM(RG.UF) AS RGU,');
    Add('  RTRIM(PIS.NUMDOCUMENTO) AS PIS,');
    Add('  PIS.DATAEMISSAO AS PISD,');
    Add('  RTRIM(TIT.NUMDOCUMENTO) AS TITE,');
    Add('  TIT.DATAEMISSAO AS TITED,');
    Add('  RTRIM(E.LOGRADOURO) || DECODE(E.NUMERO,NULL,NULL,'' Nº''|| E.NUMERO) ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL,'' - ''|| RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),NULL,NULL,'', ''|| RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(E.CEP),NULL,NULL,'' - CEP: '' || RTRIM(SUBSTR(E.CEP,1,5)) ||');
    Add('    ''-''|| RTRIM(SUBSTR(E.CEP,6,3))) || DECODE(RTRIM(CI.NOME),NULL,NULL,');
    Add('    '' - '' || RTRIM(CI.NOME)) || DECODE(RTRIM(ES.CODESTADO),NULL,NULL,');
    Add('    '' - '' || RTRIM(ES.CODESTADO)) AS END,');
    Add('  RTRIM(E.LOGRADOURO) AS LOG,');
    Add('  E.NUMERO AS NUM,');
    Add('  RTRIM(E.COMPLEMENTO) AS CMP,');
    Add('  RTRIM(E.BAIRRO) AS BAI,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
    Add('  RTRIM(CI.NOME) AS CID,');
    Add('  RTRIM(ES.CODESTADO) AS EST,');
    Add('  PEFIS.DATANASC AS DTN,');
    Add('  DECODE(PEFIS.SEXO,''M'',''Masculino'',''F'',''Feminino'') AS SEX,');
    Add('  DECODE(PEFIS.CORPESSOA,2,''Branca'',4,''Negra'',6,''Amarela'',8,''Parda'',0,'+
        '''Indígena'') AS COR,');
    Add('  RTRIM(PEFIS.TIPOSANG) AS TPS,');
    Add('  DECODE(PEFIS.FLGDEFICIENTE,2,''Não'',''Sim'') AS DEF,');
    Add('  DECODE(PEFIS.ESTCIVIL,');
    Add('    ''S'',''Solteir'' || DECODE(PEFIS.SEXO,''M'',''o'',''a''),');
    Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''M'',''o'',''a''),');
    Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''M'',''o'',''a''),');
    Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''M'',''o'',''a'') || ''Judicialmente'',');
    Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''M'',''o'',''a''),');
    Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''M'',''o'',''a''),');
    Add('    ''O'',''Outro'','''') AS ESC,');
    Add('  RTRIM(PEFIS.NOMEMAE) AS NMM,');
    Add('  RTRIM(PEFIS.NOMEPAI) AS NMP,');
    Add('  DECODE(PEFIS.FLGISENTOIRRF,0,''Não'',''Sim'') AS IIR,');
    Add('  NVL(PEFIS.NUMDEPTOT,0) AS QTD,');
    Add('  NVL(PEFIS.NUMDEPIRRF,0) AS QIR,');
    Add('  NVL(PEFIS.NUMDEPSALF,0) AS QSF,');
    Add('  RTRIM(PAIS.NOMENACIONALIDADE) AS NAC,');
    Add('  RTRIM(CIN.NOME) AS NCI,');
    Add('  RTRIM(ESN.NOMEESTADO) AS NES,');
    Add('  RTRIM(PS.RAZAOSOCIAL) AS SIN,');
    Add('  RTRIM(GR.DESCRICAO) AS GRI,');
    Add('  RTRIM(PR.DESCRICAO) AS PRO,');
    Add('  RTRIM(F.MATRICULA) AS MAT,');
    Add('  F.DATAADMISSAO AS DTA,');
//    Add('  TO_CHAR(F.DATAADMISSAO, ''DD "de" fmMonth "de" YYYY'',''NLS_DATE_LANGUAGE=PORTUGUESE'') AS DTAE, ');  //higor    // Everson TIBERO
    Add('  TO_CHAR(F.DATAADMISSAO, ''DD "de" fmMonth "de" YYYY'') AS DTAE, ');  //higor                                       // Everson TIBERO
    Add('  RTRIM(ST.DESCRICAO) AS SIT,');
    Add('  DECODE(ST.TIPOSIT,''A'',''Ativo(a)'',''F'',''Afastado(a)'',''D'','+
        '''Demitido(a)'','''') AS TSF,');
    Add('  RTRIM(HT.NOMEHORARIO) AS HOR,');
    //Edilaine - SOL 149111 / KTN 1066131
    Add('  (HT.JORNADAMENSAL / 25) AS HORD,');
    Add('  (HT.JORNADAMENSAL / 5) AS HORS,');
    //Edilaine - SOL 149111 / KTN 1066131 - fim
    Add('  F.DATAREFHORARIO AS DTH,');
    Add('  RTRIM(MO.DESCRICAO) AS MOD,');
    Add('  F.DATADESLIGAMENTO AS DTD,');
    Add('  F.DATARETORNO AS DTR,');
    Add('  F.DATAAVISO AS DAV,');
    Add('  RTRIM(F.HOMOLOGACAONUMERO) AS DHM,');
    Add('  RTRIM(C1.TITULO) AS CAR,');
    Add('  F.DATACARGO AS DTC,');
    Add('  DECODE(PH.FLGNIVELINDIV,0,FS1.IDFAIXASALARIAL,F.IDFAIXACARGO) AS FXC,');
    Add('  PH.FLGNIVELINDIV, F.NIVELINDIV1, F.NIVELINDIV2,');
    Add('  F.SALARIOATUAL,');
    Add('  FS1.STEP1 AS FS1_STEP1,');
    Add('  FS1.STEP2 AS FS1_STEP2,');
    Add('  FS1.STEP3 AS FS1_STEP3,');
    Add('  FS1.STEP4 AS FS1_STEP4,');
    Add('  FS1.STEP5 AS FS1_STEP5,');
    Add('  FS1.STEP6 AS FS1_STEP6,');
    Add('  FS1.STEP7 AS FS1_STEP7,');
    Add('  FS1.STEP8 AS FS1_STEP8,');
    Add('  FS1.STEP9 AS FS1_STEP9,');
    //Douglas.Siqueira SOL 171426 Kintana 1537613
    Add('  FS1.STEP10 AS FS1_STEP10,');
    Add('  FS1.STEP11 AS FS1_STEP11,');
    Add('  FS1.STEP12 AS FS1_STEP12,');
    Add('  FS1.STEP13 AS FS1_STEP13,');
    Add('  FS1.STEP14 AS FS1_STEP14,');
    Add('  FS1.STEP15 AS FS1_STEP15,');
    Add('  FS1.STEP16 AS FS1_STEP16,');
    Add('  FS1.STEP17 AS FS1_STEP17,');
    Add('  FS1.STEP18 AS FS1_STEP18,');
    Add('  FS1.STEP19 AS FS1_STEP19,');
    Add('  FS1.STEP20 AS FS1_STEP20,');
    Add('  FS1.CODFAIXAPCS AS FPCS, ');//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131

    //Douglas.Siqueira SOL 171426 Kintana 1537613 - fim

    Add('  RTRIM(C2.TITULO) AS FUN,');
    Add('  F.DATACARGO2 AS DTF,');
    Add('  DECODE(PH.FLGNIVELINDIV,0,FS2.IDFAIXASALARIAL,F.IDFAIXAFUNCAO) AS FXF,');
    Add('  FS2.STEP1 AS FS2_STEP1,');
    Add('  FS2.STEP2 AS FS2_STEP2,');
    Add('  FS2.STEP3 AS FS2_STEP3,');
    Add('  FS2.STEP4 AS FS2_STEP4,');
    Add('  FS2.STEP5 AS FS2_STEP5,');
    Add('  FS2.STEP6 AS FS2_STEP6,');
    Add('  FS2.STEP7 AS FS2_STEP7,');
    Add('  FS2.STEP8 AS FS2_STEP8,');
    Add('  FS2.STEP9 AS FS2_STEP9,');
    //Douglas.Siqueira SOL 171426 Kintana 1537613
    Add('  FS2.STEP10 AS FS2_STEP10,');
    Add('  FS2.STEP11 AS FS2_STEP11,');
    Add('  FS2.STEP12 AS FS2_STEP12,');
    Add('  FS2.STEP13 AS FS2_STEP13,');
    Add('  FS2.STEP14 AS FS2_STEP14,');
    Add('  FS2.STEP15 AS FS2_STEP15,');
    Add('  FS2.STEP16 AS FS2_STEP16,');
    Add('  FS2.STEP17 AS FS2_STEP17,');
    Add('  FS2.STEP18 AS FS2_STEP18,');
    Add('  FS2.STEP19 AS FS2_STEP19,');
    Add('  FS2.STEP20 AS FS2_STEP20,');
    //Douglas.Siqueira SOL 171426 Kintana 1537613 - fim
    Add('  FS2.CODFAIXAPCS AS FPCS, '); //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131

    Add('  DECODE(F.TIPOCONTRATO,''E'',''Efetivo'',''S'',''Efetivo Especial'',''T'',');
    Add('    ''Temporário'',''G'',''Estagiário'',''3'',''Terceiro'',''P'','+
        '''Prop/Dir s/ Vinc'',''A'',''Autônomo'') TPC,');
    Add('  F.DATAFIMCONTRATO AS DTP,');
    Add('  F.DURACAOCONTRATO AS DUP,');
    Add('  F.PRORROGCONTRATO AS PRP,');
    Add('  DECODE(F.TIPOPAGAMENTO,''H'',''Hora'',''D'',''Dia'',''M'',''Mês'','+
        '''T'',''Tarefa'') AS TPA,');
    Add('  F.SALARIOATUAL AS SAL,');
    Add('  F.DATASALARIO AS DTE,');
    Add('  RTRIM(PC.NOME) AS CHE,');
    Add('  RTRIM(CC.NOME) AS CCU,');
    Add('  F.DATALOTACAO AS DTU,');
    Add('  RTRIM(PB.RAZAOSOCIAL) AS BCS,');
    Add('  RTRIM(PA.RAZAOSOCIAL) AS AGS,');
    Add('  F.NUMCONTASALARIO AS NCS,');
    Add('  MATF.NUMDOCUMENTO AS MATF,'); //Edilaine - SOL 149111 / KTN 1066131
    //Higor SOL 149111 KTN 1066131
    Add('DECODE(PH.FLGNIVELINDIV,                         ');
    Add('                  0,                             ');
    Add('                  VLINICIO.IDFAIXASALARIAL,      ');
    Add('                  VLINICIO.IDFAIXAFUNCAO)AS FXCI,');

    Add('VLINICIO.TITULO                        AS CARI,');
    Add('VLINICIO.DATACARGO                    AS DTCI,');
    Add('VLINICIO.CODFAIXAPCS                   AS FPCSI,');
    Add(' TRIM(to_char(VLINICIO.NIVELINDIV1, ''RN'')) AS STCI,'); //romano
    Add('VLINICIO.TIPOPAGAMENTO          AS TPAI,');
    Add('VLINICIO.SALARIO AS SALI,');
    Add('VLINICIO.DATAALTERFUNC          AS DTEI');
    //Higor SOL 149111 KTN 1066131
    Add('FROM');
    Add('  PESSOA PE, PESSOA P, PESSOA PS, PESSOA PC, PESSOA PB, PESSOA PA,');
    Add('  PESSOAFISICA PEFIS, ENDPESS E, ENDPESS E2, FUNCIONARIO F, CIDADES CI,');
    Add('  CIDADES CI2, CIDADES CIN, ESTADO ES, ESTADO ES2, ESTADO ESN, PROFISS PR,');
    Add('  AGENCIABANCARIA AG, MOTIVO MO, CARGO C1, CARGO C2, CENTCUST CC, FAIXASAL FS1,');
    Add('  FAIXASAL FS2, CARTA, SITFUNC ST, GRINSTR GR, PAIS, HORATRAB HT, PARAMRH PH,');
    if (ListaIdSolicitacao <> '') and (Pos(',',ListaIdSolicitacao) > 0) then
      Add('  SOLALTFUNC SAF,');
    // ------------------------------------------------------------------------------------
    // Inscrição Estadual
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) ISCE,');
    // ------------------------------------------------------------------------------------
    // Inscrição Municipal
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) ISCM,');
    // ------------------------------------------------------------------------------------
    // CPF
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO, DP.DATAEMISSAO, DP.ORGAO');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CPF:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) CPF,');
    // ------------------------------------------------------------------------------------
    // CTPS
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO, DP.DATAEMISSAO, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, ESTADO ES');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO(+))) CTPS,');
    // ------------------------------------------------------------------------------------
    // Carteira de Identidade
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO, DP.DATAEMISSAO, DP.ORGAO, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, ESTADO ES');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''RG:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO(+))) RG,');
    // ------------------------------------------------------------------------------------
    // PIS
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO, DP.DATAEMISSAO');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) PIS,');
    // ------------------------------------------------------------------------------------
    // Título de eleitor
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO, DP.DATAEMISSAO');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''TITULO:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) TIT,');

    //Higor SOL 149111 KTN 1066131
    Add('    (SELECT *                                                 ');
    Add('  FROM (SELECT EVO.IDCARGO,                                   ');
    Add('               EVO.IDPESSOA,                                  ');
    Add('               EVO.SALARIO,                                   ');
    Add('               EVO.TIPOPAGAMENTO,                             ');
    Add('               EVO.DATAALTERFUNC,                             ');
    Add('               PESS.NOME,                                     ');
    Add('               CAR.TITULO,                                    ');
    Add('               FAI.IDFAIXASALARIAL,                           ');
    Add('               FAI.CODFAIXAPCS,                               ');
    Add('               FUN.DATAADMISSAO,                              ');
    Add('               FUN.DATACARGO,                                 ');
    Add('               FUN.IDFAIXAFUNCAO,                             ');
//  Add('               FUN.NIVELINDIV1                                ');
    Add('               EVO.NIVELINDIV1                                ');
    Add('          FROM EVOLFUNC    EVO,                               ');
    Add('               PESSOA      PESS,                              ');
    Add('               CARGO       CAR,                               ');
    Add('               FAIXASAL    FAI,                               ');
    Add('               FUNCIONARIO FUN                                ');


    if (Pos(',',ListaIdPessoaSel) > 0) then
      Add(' WHERE (PESS.IDPESSOA          IN (' +ListaIdPessoaSel+ ')) ')
    else
      Add(' WHERE (PESS.IDPESSOA           = ' +ListaIdPessoaSel+ ') ');

    Add('           AND PESS.IDPESSOA = EVO.IDPESSOA');
    Add('           AND (EVO.IDPESSOA = FUN.IDPESSOA)                  ');
    Add('           AND (EVO.IDCARGO = CAR.IDCARGO)                    ');


    Add(' AND ((EVO.DATAALTERFUNC = (SELECT MIN(EV.DATAALTERFUNC) FROM EVOLFUNC EV WHERE EV.IDPESSOA = PESS.IDPESSOA))');
    Add(' AND (EVO.TRGDTINCLUSAO  = (SELECT MIN(TRGDTINCLUSAO) FROM EVOLFUNC WHERE IDPESSOA = PESS.IDPESSOA AND EVO.DATAALTERFUNC = DATAALTERFUNC )))');

    Add('           AND (EVO.DATAALTERFUNC = (SELECT MIN(DATAALTERFUNC) FROM EVOLFUNC WHERE IDPESSOA = PESS.IDPESSOA))');

    Add('           AND (FAI.IDFAIXASALARIAL = CAR.IDFAIXASALARIAL)    ');
    Add('         ORDER BY EVO.IDPESSOA, EVO.SALARIO,EVO.DATAALTERFUNC)');
    Add(' ) VLINICIO,');
    //Higor SOL 149111 KTN 1066131

    // ------------------------------------------------------------------------------------
    // Matricula FUNCEF     //Edilaine - SOL 149111 / KTN 1066131
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO');
    Add('     FROM DOCPESSOA DP ');
    Add('    WHERE DP.IDDOCUMENTO = 4) MATF');
    // ------------------------------------------------------------------------------------
    Add('WHERE');
    if (Pos(',',NumCarta) > 0) then
      Add('  (CARTA.NUMCARTA      IN (' +NumCarta+ ')) AND')
    else
      Add('  (CARTA.NUMCARTA       = ' +NumCarta+ ') AND');

    if (Pos(',',ListaIdPessoaSel) > 0) then
      Add('  (P.IDPESSOA          IN (' +ListaIdPessoaSel+ ')) AND')
    else
      Add('  (P.IDPESSOA           = ' +ListaIdPessoaSel+ ') AND');

    Add('  (PE.IDPESSOA          = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

    if (ListaIdSolicitacao <> '') and (Pos(',',ListaIdSolicitacao) > 0) then
    begin
      Add('  (SAF.ID_SOLIC_ALTER_FUNC IN (' +ListaIdSolicitacao+ ')) AND');
      Add('  (SAF.IDMOTIVO         = CARTA.IDMOTIVO) AND');
      Add('  (SAF.IDINDICADO       = P.IDPESSOA) AND');
    end;
    Add('  (P.IDPESSOA           = VLINICIO.IDPESSOA) AND'); //Higor SOL 149111 KTN 1066131
    Add('  (PE.IDPESSOA          = ISCE.IDPESSOA(+)) AND');
    Add('  (PE.IDPESSOA          = ISCM.IDPESSOA(+)) AND');
    Add('  (PE.IDENDCOMERCIAL    = E2.IDENDERECO(+)) AND');
    Add('  (E2.IDCIDADES         = CI2.IDCIDADES(+)) AND');
    Add('  (CI2.IDESTADO         = ES2.IDESTADO(+)) AND');
    Add('  (P.IDPESSOA           = PEFIS.IDPESSOA(+)) AND');
    Add('  (P.IDPESSOA           = F.IDPESSOA(+)) AND');
    Add('  (P.IDPESSOA           = CPF.IDPESSOA(+)) AND');
    Add('  (P.IDPESSOA           = CTPS.IDPESSOA(+)) AND');
    Add('  (P.IDPESSOA           = RG.IDPESSOA(+)) AND');
    Add('  (P.IDPESSOA           = PIS.IDPESSOA(+)) AND');
    Add('  (P.IDPESSOA           = TIT.IDPESSOA(+)) AND');
    Add('  (PEFIS.IDPAIS         = PAIS.IDPAIS(+)) AND');
    Add('  (PEFIS.IDCIDADES      = CIN.IDCIDADES(+)) AND');
    Add('  (PEFIS.CODESTADO      = ESN.CODESTADO(+)) AND');
    Add('  (PEFIS.IDSINDICATO    = PS.IDPESSOA(+)) AND');
    Add('  (PEFIS.IDGRINSTR      = GR.IDGRINSTR(+)) AND');
    Add('  (PEFIS.IDPROFISS      = PR.IDPROFISS(+)) AND');
    Add('  (F.IDSITFUNC          = ST.IDSITFUNC(+)) AND');
    Add('  (F.IDHORARIO          = HT.IDHORARIO(+)) AND');
    Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO(+)) AND');
    Add('  (F.IDEMPRESA          = CC.IDEMPRESA(+)) AND');
    Add('  (F.CODCENTROCUSTO     = CC.CODCENTROCUSTO(+)) AND');
    Add('  (F.IDCARGO            = C1.IDCARGO(+)) AND');
    Add('  (F.IDFUNCAO           = C2.IDCARGO(+)) AND');
    Add('  (F.IDPESSOA           = MATF.IDPESSOA(+)) AND');  //Edilaine - SOL 149111 / KTN 1066131
    Add('  (C1.IDFAIXASALARIAL   = FS1.IDFAIXASALARIAL(+)) AND');
    Add('  (C2.IDFAIXASALARIAL   = FS2.IDFAIXASALARIAL(+)) AND');
    Add('  (F.IDCHEFE            = PC.IDPESSOA(+)) AND');
    Add('  (F.IDAGENCIASALARIO   = AG.IDPESSOA(+)) AND');
    Add('  (F.IDAGENCIASALARIO   = PA.IDPESSOA(+)) AND');
    Add('  (AG.IDBANCO           = PB.IDPESSOA(+)) AND');
    Add('  (DECODE(P.TIPO,''F'',P.IDENDRESIDENCIAL,P.IDENDCOMERCIAL) = E.IDENDERECO(+)) AND');
    Add('  (E.IDCIDADES          = CI.IDCIDADES(+)) AND');
    Add('  (CI.IDESTADO          = ES.IDESTADO(+))');
    Add('ORDER BY');
    Add('  NOM');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlCartaComun.Open;
end;

procedure TRptCartaComunicado.rpCartaComunBeforePrint(Sender: TObject);
begin
  rpCartaComunDbTxtEMPRESA.Visible := (LocalNossoNome in [0,2]);
  if (LocalNossoNome in [0,2]) then
  begin
    rpCartaComunDbTxtEMPRESA.Font.Color := clNavy;
    rpCartaComunDbTxtEMPRESA.Font.Style := [fsbold];
    rpCartaComunDbTxtEMPRESA.Font.size := 12;
  end;

  ppImageLogo.Visible              := (LocalNossoNome in [0,2]);
  ppImageTira.Visible              := (LocalNossoNome in [0,2]);
  rpCartaComunDbTxtEMPRESA2.Visible := (LocalNossoNome in [1,2]);
  rpCartaComunDbTxtEMPRESA3.Visible := (LocalNossoNome in [1,2]); //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
  rpCartaComunGrpHdrNOME.Visible := (ImprimeNomeEnd = 0);
end;

procedure TRptCartaComunicado.rpCartaComunLblDATAPrint(Sender: TObject);
begin
  rpCartaComunLblDATA.Caption := FormatDateTime('dd "de" mmmm "de" yyyy',
    CdsCartaComun.FieldByName('DTT').asDateTime);
end;

procedure TRptCartaComunicado.rpCartaComunGrpHdrNOMEAfterPrint(Sender: TObject);
var
  c, I: byte;
  iPos: integer;
  dSalario: double;
  dSalarioinicial : double;
  sTexto, sAux: string;
begin
  frmAguarde.Apaga;
  frmAguarde.pbAguarde.Visible := true;
  sTexto := CdsCartaComun.FieldByName('TEXTO').asString;
  dSalario := CdsCartaComun.FieldByName('SAL').asFloat;
  dSalarioinicial := CdsCartaComun.FieldByName('SALI').asFloat;

  // Substituir o valor do salário
  repeat
    iPos := Pos('<SAL>', sTexto);
    if (iPos > 0) then
    begin
      Delete(sTexto, iPos, 5);
      Insert(FU.ValStr(dSalario, 9, 2, true, ','), sTexto, iPos);
    end;
  until (iPos = 0);

  // Substituir o valor do salário por extenso
  repeat
    iPos := Pos('<SAE>', sTexto);
    if (iPos > 0) then
    begin
      Delete(sTexto, iPos, 5);
      ExtensoCM.Valor := dSalario;
      ExtensoCM.Escreve;
      Insert(ExtensoCM.Extenso, sTexto, iPos);
    end;
  until (iPos = 0);

  // Substituir o valor do salário por extenso

  repeat
    iPos := Pos('<SALI>', sTexto);
    if (iPos > 0) then
    begin
      Delete(sTexto, iPos, 6);
      Insert(FU.ValStr(dSalarioinicial, 9, 2, true, ','), sTexto, iPos);
    end;
  until (iPos = 0);


  repeat
    iPos := Pos('<SAEI>', sTexto);
    if (iPos > 0) then
    begin
      Delete(sTexto, iPos, 6);
      ExtensoCM.Valor := dSalarioinicial;
      ExtensoCM.Escreve;
      Insert(ExtensoCM.Extenso, sTexto, iPos);
    end;
  until (iPos = 0);

  // Substituir o Número da Faixa para o Cargo Oficial e Eventual
  for c:=1 to 2 do
  begin
    repeat
      if (c = 1) then
        iPos := Pos('<STC>', sTexto)
      else
        iPos := Pos('<STF>', sTexto);

      if (iPos > 0) then
      begin
        Delete(sTexto, iPos, 5);

        if (CdsCartaComun.FieldByName('FLGNIVELINDIV').asInteger = 0) then
        begin
          for I:=1 to 20 do //Douglas.Siqueira SOL 171426 Kintana 1537613
            if (dSalario <=
                CdsCartaComun.FieldByName('FS'+IntToStr(c)+'_STEP'+IntToStr(I)).asFloat) or
               (I = 20) then //Douglas.Siqueira SOL 171426 Kintana 1537613
            begin
              sAux := IntToStr(I);
              break;
            end;
        end
        else
          sAux := CdsCartaComun.FieldByName('NIVELINDIV'+IntToStr(c)).asString;

        Insert(sAux, sTexto, iPos);
      end;
    until (iPos = 0);
  end;

  //Edilaine - SOL 149111 / KTN 1066131 - Inicio
  // Substitui o valor da hora diária por extenso
  repeat
      iPos := Pos('<HORDE>', sTexto);
      if (iPos > 0) then
      begin
        Delete(sTexto, iPos, 7);
        if CdsCartaComun.FieldByName('HORD').Value = 1 then
           ExtensoCM.Extenso := 'uma'
        else
        begin
          ExtensoCM.Valor := CdsCartaComun.FieldByName('HORD').Value;
          ExtensoCM.Escreve;
          ExtensoCM.Extenso := LowerCase(Trim(StringReplace( StringReplace( ExtensoCM.Extenso, ' Reais', '', [rfIgnoreCase]), ' Real', '', [rfIgnoreCase])));
        end;
        Insert(ExtensoCM.Extenso, sTexto, iPos);
      end;
  until (iPos = 0);

  // Substitui o valor da hora semanal por extenso
  repeat
      iPos := Pos('<HORSE>', sTexto);
      if (iPos > 0) then
      begin
        Delete(sTexto, iPos, 7);
        if CdsCartaComun.FieldByName('HORS').Value = 1 then
           ExtensoCM.Extenso := 'uma'
        else
        begin
          ExtensoCM.Valor := CdsCartaComun.FieldByName('HORS').Value;
          ExtensoCM.Escreve;
          ExtensoCM.Extenso := LowerCase(Trim(StringReplace( StringReplace( ExtensoCM.Extenso, ' Reais', '', [rfIgnoreCase]), ' Real', '', [rfIgnoreCase])));
        end;
        Insert(ExtensoCM.Extenso, sTexto, iPos);
      end;
  until (iPos = 0);
  //Edilaine - SOL 149111 / KTN 1066131 - fim

  //Dados do Representante
  if (pIntIDRepresentante > 0) then
  begin
    pCds.Data := CarregaDadosFuncionario(pIntIDRepresentante);
    if not (pCds.IsEmpty) then
    begin
      repeat
        iPos := Pos('<REPR>', sTexto);
        if (iPos > 0) then
        begin
          Delete(sTexto, iPos, 6);
          Insert( pCds.FieldByName('NOME').AsString ,sTexto, iPos);
        end;
      until (iPos = 0);
    end;
  end;

  //Dados do Testemunha 1
  if (pIntIDTestemunha1 > 0) then
  begin
    pCds.Data := CarregaDadosFuncionario(pIntIDTestemunha1);
    if not (pCds.IsEmpty) then
    begin
      repeat
        iPos := Pos('<TESTA>', sTexto);
        if (iPos > 0) then
        begin
          Delete(sTexto, iPos, 7);
          Insert( pCds.FieldByName('NOME').AsString ,sTexto, iPos);
        end;
      until (iPos = 0);

      pCds.Filtered := False;
      pCds.Filter   := 'TIPODOCUMENTO = ''RG''';
      pCds.Filtered := True;

      if (pCds.RecordCount > 0) then
      begin
        repeat
          iPos := Pos('<RGTA>', sTexto);
          if (iPos > 0) then
          begin
            Delete(sTexto, iPos, 6);
            Insert(pCds.FieldByName('NUMDOCUMENTO').AsString, sTexto, iPos);
          end;
        until (iPos = 0);

        repeat
          iPos := Pos('<RGOTA>', sTexto);
          if (iPos > 0) then
          begin
            Delete(sTexto, iPos, 7);
            Insert(pCds.FieldByName('ORGAO').AsString, sTexto, iPos);
          end;
        until (iPos = 0);

        repeat
          iPos := Pos('<RGUTA>', sTexto);
          if (iPos > 0) then
          begin
            Delete(sTexto, iPos, 7);
            Insert(pCds.FieldByName('CODESTADO').AsString, sTexto, iPos);
          end;
        until (iPos = 0);
      end;
        pCds.Filtered := False;
        pCds.Filter   := 'TIPODOCUMENTO = ''CPF''';
        pCds.Filtered := True;

      if (pCds.RecordCount > 0) then
      begin
        repeat
          iPos := Pos('<CPFTA>', sTexto);
          if (iPos > 0) then
          begin
            Delete(sTexto, iPos, 7);
            Insert(pCds.FieldByName('NUMDOCUMENTO').AsString, sTexto, iPos);
          end;
        until (iPos = 0);
      end;
    end;
  end;

  //Dados do Testemunha 2
  if (pIntIDTestemunha2 > 0) then
  begin
    pCds.Data := CarregaDadosFuncionario(pIntIDTestemunha2);
    if not (pCds.IsEmpty) then
    begin
      repeat
        iPos := Pos('<TESTB>', sTexto);
        if (iPos > 0) then
        begin
          Delete(sTexto, iPos, 7);
          Insert( pCds.FieldByName('NOME').AsString ,sTexto, iPos);
        end;
      until (iPos = 0);

      pCds.Filtered := False;
      pCds.Filter   := 'TIPODOCUMENTO = ''RG''';
      pCds.Filtered := True;

      if (pCds.RecordCount > 0) then
      begin
        repeat
          iPos := Pos('<RGTB>', sTexto);
          if (iPos > 0) then
          begin
            Delete(sTexto, iPos, 6);
            Insert(pCds.FieldByName('NUMDOCUMENTO').AsString, sTexto, iPos);
          end;
        until (iPos = 0);

        repeat
          iPos := Pos('<RGOTB>', sTexto);
          if (iPos > 0) then
          begin
            Delete(sTexto, iPos, 7);
            Insert(pCds.FieldByName('ORGAO').AsString, sTexto, iPos);
          end;
        until (iPos = 0);

        repeat
          iPos := Pos('<RGUTB>', sTexto);
          if (iPos > 0) then
          begin
            Delete(sTexto, iPos, 7);
            Insert(pCds.FieldByName('CODESTADO').AsString, sTexto, iPos);
          end;
        until (iPos = 0);
      end;
        pCds.Filtered := False;
        pCds.Filter   := 'TIPODOCUMENTO = ''CPF''';
        pCds.Filtered := True;

      if (pCds.RecordCount > 0) then
      begin
        repeat
          iPos := Pos('<CPFTB>', sTexto);
          if (iPos > 0) then
          begin
            Delete(sTexto, iPos, 7);
            Insert(pCds.FieldByName('NUMDOCUMENTO').AsString, sTexto, iPos);
          end;
        until (iPos = 0);
      end;
    end;
    //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Fim
  end;

  rpCartaComunMemTEXTO.RichText := sTexto;
  //ppImageTira.Height             :=  rpCartaComun.PrinterSetup.PaperHeight;

end;

//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Inicio
procedure TRptCartaComunicado.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCartaComunicado := TCtrlCartaComunicado.Create ;
  CtrlCartaComunicado.InitializeAs(Padroes);

  pCds := TCMClientDataSet.Create(nil);
  pCds.Data := CtrlCartaComunicado.getDadosFuncionario(-1);

end;

function TRptCartaComunicado.CarregaDadosFuncionario(
  pIdFunc: Integer): OleVariant;
begin
  Result := CtrlCartaComunicado.getDadosFuncionario(pIdFunc);
end;
//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Fim




end.
