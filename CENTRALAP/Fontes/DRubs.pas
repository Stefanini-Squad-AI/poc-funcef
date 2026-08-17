unit DRubs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, ppDB, ppDBPipe, ppDBBDE, ppCache, ppClass,
  ppBands, ppRelatv, ppProd, ppReport, Wwdatsrc, ppComm, ppEndUsr,
  pptypes, ppStrtch, ppSubRpt, ppPrnabl, ppCtrls, fPreview, uDataBase;

type
  TDtmRubs = class(TDataModule)
    QryInsRubs: TwwQuery;
    QryUpdRubs: TwwQuery;
    QryInsTipoDoc: TwwQuery;
    QryInsBeneficio: TwwQuery;
    QryUpdTipoDoc: TwwQuery;
    QryInsHist: TwwQuery;
    QryUpdHist: TwwQuery;
    QryUpdHistLancto: TwwQuery;
    QryUpdHistBaixa: TwwQuery;
    QryModelorub: TwwQuery;
    QryModelorubDESCRUB: TStringField;
    QryModelorubNOMETXTRUB: TStringField;
    QryModelorubSEPARADORCOLUNAS: TStringField;
    QryModelorubNUMDIASCARTAAVISO: TFloatField;
    QryModelorubIDCONFIGRUBS: TFloatField;
    QryModelorubNOMEDOCRUB: TStringField;
    QryCamposRub: TwwQuery;
    QryCamposRubCAMPODETALHE: TStringField;
    QryCamposRubLARGURACOLUNA: TFloatField;
    QryCamposRubDESCHEADERRUBS: TStringField;
    QryCamposRubIDCONFIGRUBS: TFloatField;
    QryGeraRubantes: TwwQuery;
    QryGeraRubxBenf: TwwQuery;
    QryGeraRubxBenfBF: TStringField;
    QryGeraRubTipoDoc: TwwQuery;
    QryGeraRubTipoDocNOMEDOCUMENTO: TStringField;
    QryGeraRubxBenfIDBENEFICIO: TFloatField;
    QryModelorubFLGDELIMITALINHA: TStringField;
    QryAnexosRubs: TwwQuery;
    QryGeraRubxBenfIDPESSOA: TFloatField;
    QryGeraRubxBenfIDPLANOPREV: TFloatField;
    QryGeraRubxBenfIDSITBENEF: TFloatField;
    QryTermosXBenef: TwwQuery;
    QryTermosXBenefIDCONFIGRUBS: TFloatField;
    QryAnexosRubsIDCONFIGRUBS: TFloatField;
    QryAnexosRubsDESCRUB: TStringField;
    QryAnexosRubsNOMETXTRUB: TStringField;
    QryAnexosRubsNOMEDOCRUB: TStringField;
    QryAnexosRubsSEPARADORCOLUNAS: TStringField;
    QryAnexosRubsNUMDIASCARTAAVISO: TFloatField;
    QryAnexosRubsFLGDELIMITALINHA: TStringField;
    QryAnexosRubsCAMPODETALHE: TStringField;
    QryAnexosRubsLARGURACOLUNA: TFloatField;
    QryAnexosRubsDESCHEADERRUBS: TStringField;
    QryAux: TwwQuery;
    QryBuscaNumDocTitular: TwwQuery;
    QryBuscaDocTitular: TwwQuery;
    QryBuscaDocTitularNOMEDOCUMENTO: TStringField;
    QryBuscaNumDocTitularNUMDOCUMENTO: TStringField;
    QryGeraTermoTipoDoc: TwwQuery;
    QryGeraTermoTipoDocNOMEDOCUMENTO: TStringField;
    QryCamposRubFLGTIPOARQUIVO: TStringField;
    QryTermosXBenefIDTERMOSXBENEF: TFloatField;
    QRYGERARUB: TwwQuery;
    QryGeraRubxBenfNOME_BEN_SERV: TStringField;
    QRYVERIFICATERMO: TwwQuery;
    QryCamposRubIDDETALHERUBS: TFloatField;
    QryInsereControleTermo: TwwQuery;
    qryGeraRubRecad: TwwQuery;
    QryDados: TwwQuery;
    qryBuscaRubs: TwwQuery;
    qryBuscaRubsIDRUBS: TFloatField;
    qryBuscaRubsFLGSTATUS: TStringField;
    qryBuscaRubsIDREPORTS: TFloatField;
    qryBuscaRubsIDCONFIGRUBS: TFloatField;
    qryBuscaRubsDESCRUB: TStringField;
    qryBuscaRubsNOMETXTRUB: TStringField;
    qryBuscaRubsNOMEDOCRUB: TStringField;
    qryBuscaRubsSEPARADORCOLUNAS: TStringField;
    qryBuscaRubsNUMDIASCARTAAVISO: TFloatField;
    qryBuscaRubsFLGDELIMITALINHA: TStringField;
    qryBuscaRubsIDCARTACOBRANCA: TFloatField;
    UpdBuscaRubs: TUpdateSQL;
    wwQuery1: TwwQuery;
    qryReports: TwwQuery;
    qryReportsNAME: TStringField;
    qryReportsIDREPORTS: TFloatField;
    qryReportsORIGEMCM: TFloatField;
    qryReportsTEMPLATE: TBlobField;
    DsDados: TwwDataSource;
    QryCadModelo: TwwQuery;
    QryCadModeloIDCARTACOBRANCA: TFloatField;
    QryCadModeloMODELOCARTA: TStringField;
    QryCadModeloIDREPORTS: TFloatField;
    QryCadModeloORIGEMCM: TFloatField;
    QryCadModeloFLGTIPOCARTA: TStringField;
    QryDetDocs: TwwQuery;
    DsGeraRUb: TwwDataSource;
    dsDetDocs: TwwDataSource;
    dsDetDependIRRF: TwwDataSource;
    qryDetDependIRRF: TwwQuery;
    qryDetTelefones: TwwQuery;
    dsDetTelefones: TwwDataSource;
    qryDetDependentes: TwwQuery;
    dtsDetDependentes: TwwDataSource;
    qryDetBeneficiarios: TwwQuery;
    dtsDetBeneficiarios: TwwDataSource;
    procedure GravaEmissaoCarta(Sender: TObject);
  private
    { Private declarations }
    idrubs :integer;
  public
    { Public declarations }
    procedure PrintRubs(iIdRubs: integer; var RptModelo: TppReport);
    function MontaQueryEmissao(numRubs : integer; var qry, qryDetDocs, qryDetDependIRRF, qryDetTelefones, qryDetDependentes, qryDetBeneficiarios : twwquery) : boolean;
  end;

var
  DtmRubs: TDtmRubs;


implementation

{$R *.DFM}


procedure TDtmRubs.PrintRubs(iIdRubs: integer; var RptModelo: TppReport);
var sNomeRelatorio, SsQL : string;
    aTemplate: TMemoryStream;
begin
  idRubs := iIdRubs;
  with DtmRubs do
  begin
    qryDados.Close;
    qryDados.sql.text := '';
   // *********************  a query de dados  *************************************************

    qryBuscaRubs.Close;
    qryBuscaRubs.SQL.text :=  ' SELECT DISTINCT '                                 +#13#10+
                              '   R.IDRUBS, '                                     +#13#10+
                              '   HL.FLGSTATUS, '                                 +#13#10+
                              '   CC.IDREPORTS, '                                 +#13#10+
                              '   C.IDCONFIGRUBS, '                               +#13#10+
                              '   C.DESCRUB, '                                    +#13#10+
                              '   C.NOMETXTRUB, '                                 +#13#10+
                              '   C.NOMEDOCRUB, '                                 +#13#10+
                              '   C.SEPARADORCOLUNAS, '                           +#13#10+
                              '   C.NUMDIASCARTAAVISO, '                          +#13#10+
                              '   C.FLGDELIMITALINHA, '                           +#13#10+
                              '   C.IDCARTACOBRANCA '                             +#13#10+
                              ' FROM '                                            +#13#10+
                              '   CONFIGRUBS C, '                                 +#13#10+
                              '   RUBS R, '                                       +#13#10+
                              '   ASSUNTO A, '                                    +#13#10+
                              '   ASSUNTOXATEND AXA, '                            +#13#10+
                              '   CARTACOBRANCA CC, '                             +#13#10+
                              '   HISTMOVRUBS HL '                                +#13#10+
                              '  WHERE '                                          +#13#10+
                              '   HL.FLGSTATUS IN (1, 3) AND  '                   +#13#10+//com status gerado ou regerado
                              '   R.IDRUBS = HL.IDRUBS AND '                      +#13#10+
                              '   R.IDASSUNTOXATEND = AXA.IDASSUNTOXATEND(+) AND '+#13#10+
                              '   A.IDASSUNTO = AXA.IDASSUNTO  AND '              +#13#10+
                              '   A.IDCONFIGRUBS =  C.IDCONFIGRUBS AND '          +#13#10+
                              '   C.IDCONFIGRUBS = A.IDCONFIGRUBS AND '           +#13#10+
                              '   CC.IDCARTACOBRANCA = C.IDCARTACOBRANCA AND '    +#13#10+
                              '   R.IDRUBS = :IDRUBS '                            +#13#10;

   // busca o modelo de report
    qryBuscaRubs.ParamByName('IDRUBS').asInteger := iIdRubs;
    qryBuscaRubs.Open;
    if qryBuscaRubs.Eof then exit;
  //***********************************************

  //  Monta a query do relatório

    qryCamposRUB.Close;
    qryCamposRUB.paramByName('IDCONFIGRUBS').asFloat := qryBuscaRubs.fieldByName('IDCONFIGRUBS').asInteger;
    qryCamposRUB.Open;

    sSql := '';
    qryCamposRUB.First;
    while not qryCamposRUB.Eof do
    begin
      sSql := Ssql + qryCamposRUB.FieldByName('CAMPODETALHE').asString + ',';
      qryCamposRUB.Next;
    end;
    if length(sSql) > 0 then
      sSql[length(sSql)] := ' ';

  // Tavares - 21/02/2002

    qryCamposRUB.First;
    if qryCamposRUB.Eof then
      MontaQueryEmissao(strToIntDef(qryBuscaRubs.FieldByName('IDRUBS').asString, -1), qryDados, qryDetDocs, qryDetDependIRRF, qryDetTelefones, qryDetDependentes, qryDetBeneficiarios )
    else
      MontaQueryEmissao(strToIntDef(qryBuscaRubs.FieldByName('IDRUBS').asString, -1), qryDados, qryDetDocs, qryDetDependIRRF, qryDetTelefones, qryDetDependentes, qryDetBeneficiarios );


    qryCadModelo.Close;
    qryCadModelo.ParamByName('IDCARTACOBRANCA').asInteger := qryBuscaRubs.fieldByName('IDCARTACOBRANCA').asInteger;
    qryCadModelo.Open;


  ///********  Manda a RUBS para impressora  ******************///

    QryReports.Close;
    qryReports.ParamByName('PIDREPORTS').asInteger := QryCadModeloIDREPORTS.asInteger;
    qryReports.ParamByName('PORIGEMCM').asInteger  := 0;
    qryReports.Open;

    aTemplate := TMemoryStream.Create;

    aTemplate.Clear;
    qryReportsTEMPLATE.SaveToStream(aTemplate);
    aTemplate.Position := 0;
    RptModelo.Template.Format := ftASCII;
    RptModelo.Template.LoadFromStream(aTemplate);

    TFrmPreview.CreateModalPreview(Application, RptModelo, 'RUBS');
    aTemplate.Free;
  end;
end;

procedure TDtmRubs.GravaEmissaoCarta(Sender: TObject);
begin
   try
   If (Application.MessageBox('As RUBS foram impressas corretamente?','Central de Atendimento ao Público',Mb_YesNo + Mb_IConQuestion) = Id_Yes) Then
   begin

     qryAux.Close;
     qryAux.SQL.Text := ' update RUBS       '+
                        ' set FLGSTATUS = 2 '+
                        ' where IDRUBS =    '+ formatFloat('#0', idrubs);
     qryAux.ExecSQL;

     qryAux.Close;
     qryAux.SQL.Text := ' INSERT INTO HISTMOVRUBS '+
                        ' (IDHISTMOVRUBS, IDRUBS, FLGSTATUS, DATAMOV, HISTORICO) '+
                        ' VALUES ( '+ intToStr(LeultRegistro(nil,'HISTMOVRUBS')) + ', '+ formatFloat('#0', idrubs) + ' , 2, '
                        + 'to_date(' + quotedStr(DateTimeToStr(now)) + ',''dd/mm/yyyy hh24:mi:ss'')' +', ' + quotedStr('RUBS Emitida (impressa)') + ') ';
     qryAux.ExecSQL;
   end
  except
    Raise;
  end;
end;



function TDtmRubs.MontaQueryEmissao(numRubs : integer; var qry, qryDetDocs, qryDetDependIRRF, qryDetTelefones, qryDetDependentes, qryDetBeneficiarios : twwquery) : boolean;
  var sCampoDepenLegal, sCampoDepenIRRF, sCampoBeneficiarios  : string;
      iIdpessoaLocal, i : integer;
      qryAux : twwquery;
begin
  result := false;
  sCampoDepenLegal := '     ';
  sCampoDepenIRRF  := '     ';
  sCampoBeneficiarios := '     ';
  qryAux := twwquery.Create(nil);
  qryAux.DataBaseName := qry.DataBaseName;
  qryAux.Close;
  qryAux.sql.Clear;

  try
    qryAux.close;
    { pega o idpessoa }
    qryAux.sql.text := ' SELECT A.IDTITULAR                                     '+
                    ' FROM RUBS, ASSUNTOXATEND AXA, ATEND A                  '+
                    ' WHERE (AXA.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND) AND '+
                    ' (A.IDATEND = AXA.IDATEND) AND RUBS.IDRUBS =            '+ intToStr(numRubs);
    qryAux.open;
    iIdpessoaLocal := qryAux.fieldByName('IDTITULAR').asInteger;

    { pega os dependentes do IRRF }
    qryAux.Close;
    qryAux.sql.Text := ' SELECT P1.NOME, PF1.DATANASC '+
                    ' FROM DEPENTIT D1, PESSOA P1, PESSOAFISICA PF1 '+
                    ' WHERE D1.FLGCONTAIMPOSTOR = 1   AND           '+
                    ' D1.IDPESSOA = PF1.IDPESSOA AND                '+
                    ' D1.IDPESSOA = P1.IDPESSOA AND D1.IDTITULAR =  '+IntToStr(iIdpessoaLocal)+
                    ' ORDER BY D1.NUMSEQUENCIA                      ';
    qryAux.open;

    if not qryAux.IsEmpty then
      sCampoDepenIRRF := '';

    qryAux.First;
    while not qryAux.eof do
    begin
      sCampoDepenIRRF := sCampoDepenIRRF + qryAux.fieldByName('NOME').asString +
                         StringOfChar(' ', 61 - length(qryAux.fieldByName('NOME').asString))+
                         qryAux.fieldByName('DATANASC').asString + #13#10;
      qryAux.Next;
    end;

    { pega os dependentes do Legais }
    qryAux.Close;
    qryAux.sql.Text := ' SELECT P1.NOME, PF1.DATANASC                  '+
                    ' FROM DEPENTIT D1, PESSOA P1, PESSOAFISICA PF1 '+
                    ' WHERE D1.FLGDEPLEGAL = 1   AND                '+
                    ' D1.IDPESSOA = PF1.IDPESSOA AND                '+
                    ' D1.IDPESSOA = P1.IDPESSOA  AND D1.IDTITULAR = '+IntToStr(iIdpessoaLocal)+
                    ' ORDER BY D1.NUMSEQUENCIA                      ';
    qryAux.open;

    if not qryAux.IsEmpty then
      sCampoDepenLegal := '';

    qryAux.First;
    while not qryAux.eof do
    begin
      sCampoDepenLegal := sCampoDepenLegal + qryAux.fieldByName('NOME').asString +
                          StringOfChar(' ', 61 - length(qryAux.fieldByName('NOME').asString))+
                          qryAux.fieldByName('DATANASC').asString + #13#10;
      qryAux.Next;
    end;
    qryAux.close;
    qryAux.sql.clear;


// Andre Tavares - 17433 - 01/10/2004 - Início ---------------------------------
    qryAux.Close;
    qryAux.sql.Text := ' SELECT DISTINCT P.NOME FROM BFCIARIOTITPLAN BF, PESSOA P '+
                    ' WHERE BF.IDPESSOA = P.IDPESSOA AND BF.IDTITULAR = '+IntToStr(iIdpessoaLocal);
    qryAux.open;

    if not qryAux.IsEmpty then
      sCampoBeneficiarios := '';

    qryAux.First;
    while not qryAux.eof do
    begin
      sCampoBeneficiarios := sCampoBeneficiarios + qryAux.fieldByName('NOME').asString +
                             StringOfChar(' ', 61 - length(qryAux.fieldByName('NOME').asString))+ #13#10;
      qryAux.Next;
    end;


    qry.close;
    qry.sql.clear;
// Andre Tavares - 17433 - 01/10/2004 - Fim ------------------------------------


    qry.sql.add (' SELECT EL.VALORBASE1 AS  OPCAO_DE_MIGRACAO, ');
    qry.sql.add ('        DECODE (TO_CHAR(SYSDATE, ''MM''),    ');
    qry.sql.add ('          ''01'', ''JANEIRO  '',          ');
    qry.sql.add ('          ''02'', ''FEVEREIRO'',          ');
    qry.sql.add ('          ''03'', ''MARÇO    '',          ');
    qry.sql.add ('          ''04'', ''ABRIL    '',          ');
    qry.sql.add ('          ''05'', ''MAIO     '',          ');
    qry.sql.add ('          ''06'', ''JUNHO    '',          ');
    qry.sql.add ('          ''07'', ''JULHO    '',          ');
    qry.sql.add ('          ''08'', ''AGOSTO   '',          ');
    qry.sql.add ('          ''09'', ''SETEMBRO '',          ');
    qry.sql.add ('          ''10'', ''OUTUBRO  '',          ');
    qry.sql.add ('          ''11'', ''NOVEMBRO '',          ');
    qry.sql.add ('          ''12'', ''DEZEMBRO '') AS MESNOMINAL,          ');
    qry.sql.add (quotedStr( sCampoDepenIRRF )  +' AS DEPENDENTES_DO_IRRF,  ');
    qry.sql.add (quotedStr( sCampoDepenLegal ) +' AS DEPENDENTES_LEGAIS,   ');
    qry.sql.add ('       SITPLANOPREV.DESCRICAO AS SITUACAO_NO_PLANO,  ');
    qry.sql.add ('       SITPART.DESCRICAO AS SITUACAO_NA_FUNDACAO,    ');
    qry.sql.add ('       USU.NOMEUSUARIO AS ATENDENTE,                 ');
    qry.sql.add ('       RUBS.IDRUBS AS IDRUB,                         ');
    qry.sql.add ('       A.IDATEND,                                    ');
    qry.sql.add ('       TO_CHAR(SYSDATE,''DD'') AS DATA_DIA,          ');
    qry.sql.add ('       TO_CHAR(SYSDATE,''MM'') AS DATA_MES,          ');
    qry.sql.add ('       TO_CHAR(SYSDATE,''YYYY'') AS DATA_ANO,        ');
    qry.sql.add ('       P.IDPESSOA AS IDPARTICIPANTE,                 ');
    qry.sql.add ('       P.NOME AS PARTICIPANTE,                       ');
    qry.sql.add ('       P.NUMDOCUMENTO AS DOCUMENTO_PARTICIP,         ');
    qry.sql.add ('       X.LOGRADOURO AS ENDERECO,                     ');
    qry.sql.add ('       X.NUMERO AS NUMERO,                           ');
    qry.sql.add ('       X.COMPLEMENTO AS COMPLEMENTO,                 ');
    qry.sql.add ('       EST.CODESTADO AS ESTADO,                      ');
    qry.sql.add ('       X.BAIRRO,                                     ');
    qry.sql.add ('       CID.NOME AS CIDADE,                           ');
    qry.sql.add ('       X.CEP,                                        ');
    qry.sql.add ('       TE.NUMERO AS TELEFONE_PARTICIP,               ');
    qry.sql.add ('       A.IDTITULAR,                                  ');
    qry.sql.add ('       A.IDBENEFICIARIO,                             ');
    qry.sql.add ('       A.NOMESOLICITANTE,                            ');
    qry.sql.add ('       A.LOGRADOURO AS ENDERECO_SOLICIT,             ');
    qry.sql.add ('       A.NUMEROSOLIC AS NUMERO_SOLICITANTE,          ');
    qry.sql.add ('       A.COMPLEMSOLIC AS COMPLEMENTO_SOLIC,          ');
    qry.sql.add ('       A.BAIRROSOLIC AS BAIRRO_SOLICITANTE,          ');
    qry.sql.add ('       A.CEPSOLIC AS CEP_SOLICITANTE,                ');
    qry.sql.add ('       A.CIDADESOLIC AS CIDADE_SOLICITANTE,          ');
    qry.sql.add ('       A.TELSOLICITANTE AS TEL_SOLICITANTE,          ');
    qry.sql.add ('       A.CODESTADOSOLIC  AS ESTADO_SOLICITANTE,      ');
    qry.sql.add ('       A.NUMDOCUMENTOCPF AS CPF_SOLICITANTE,         ');
    qry.sql.add ('       A.NUMDOCUMENTORG AS RG_SOLICITANTE,           ');
    qry.sql.add ('       A.EMAIL AS EMAIL_SOLICITANTE,                 ');
    qry.sql.add ('       A.PERGUNTA AS PERGUNTA_SOLICITANTE,           ');
    qry.sql.add ('       A.RESPOSTA AS RESPOSTA_SOLICITANTE,           ');
    qry.sql.add ('       A.OBSERVACAO AS OBSERVACAO_SOLICITANTE,       ');
    qry.sql.add ('       EL.MATRICULA ,                                ');
    qry.sql.add ('       PP.INSCRICAONUMERO AS INSCRICAO,              ');
    qry.sql.add ('       PP.INSCRICAODATA AS DATAINSCRICAO,            ');
    qry.sql.add ('       EL.DATAADMISSAO AS ADMISSAO,                  ');
    qry.sql.add ('       EL.IDPESSJUR AS IDPATROCINADORA,              ');
    qry.sql.add ('       PJ.NOME AS PATROCINADORA,                     ');
    qry.sql.add ('       PL.IDPLANOPREV AS IDPLANO,                    ');
    qry.sql.add ('       PL.NOME AS PLANO,                             ');
    qry.sql.add ('       PF.NOMEPAI AS NOME_DO_PAI,                    ');
    qry.sql.add ('       PF.NOMEMAE AS NOME_DA_MAE,                    ');
    qry.sql.add ('       PF.DATAMORTE AS DATA_MORTE,                   ');
    qry.sql.add ('       PF.DATANASC AS DATA_NASCIMENTO,               ');
    qry.sql.add ('       PF.SEXO,                                      ');
    qry.sql.add ('       PF.TIPOSANG AS TIPO_SANGUINIO,                ');
    qry.sql.add ('       PF.ESTCIVIL AS ESTADO_CIVIL,                  ');
    qry.sql.add ('       PF.NUMDEPIRRF AS NUMERO_DEP_IRRF,             ');
    qry.sql.add ('       PF.NUMDEPSALF AS NUMERO_DEP_SALFAM,           ');
    qry.sql.add ('       PF.NUMDEPTOT AS NUMERO_DEPENDENTES,           ');
    qry.sql.add ('       PF.FLGISENTOIRRF AS ISENTO_IRRF ,             ');
    qry.sql.add ('       BAN.NUMBANCO  AS NUMERO_BANCO,                ');
    qry.sql.add ('       PB.NOME  AS NOME_BANCO,                       ');
    qry.sql.add ('       AG.NUMAGENCIA  AS NUMERO_AGENCIA,             ');
    qry.sql.add ('       PA.NOME  AS NOME_AGENCIA,                     ');
    qry.sql.add ('       CONT.CONTACORRENTE ,                          ');
    qry.sql.add ('       PI.NOMENACIONALIDADE  AS NACIONALIDADE ,      ');
    qry.sql.add ('       PP.SALPARTICIPACAO  AS SAL_PARTICIPACAO,      ');
    qry.sql.add ('       CID.NOME AS  NOME_CIDADE,                     ');
    qry.sql.add ('       DEPEN.DESCRICAO AS TIPO_DEPENDENTE,           ');
    qry.sql.add ('       BEN_SERV.NOME_BEN_SERV,                       ');
    qry.sql.add ('       BEN_SERV.IDBENEFICIO,                         ');
    qry.sql.add ('       BEN_SERV.IDSITBENEF,                          ');


// Andre Tavares - 17433 - 01/10/2004 - Início ---------------------------------
    qry.sql.add (quotedStr( sCampoBeneficiarios )  +' AS BENEFICIARIOS,  ');
    qry.sql.add ('       TO_CHAR(EL.DATAADMISSAO, ''DD/MM/YYYY'') AS DATA_ADMISSAO, ');
    qry.sql.add ('       TO_CHAR(EL.DATADEMISSAO, ''DD/MM/YYYY'') AS DATA_DEMISSAO, ');
    qry.sql.add ('       ENDERECOAG.CIDADE_AG_BANCARIA AS CIDADE_AG_BANCARIA,       ');
    qry.sql.add ('       ENDERECOAG.UF_AG_BANCARIA AS UF_AG_BANCARIA,               ');
    qry.sql.add ('       DEPEN.DESCRICAO AS PARENTESCO,                             ');
    qry.sql.add ('       INICBENEF.DATA_INIC_BENEFICIO AS DATA_INIC_BENEFICIO,      ');
    qry.sql.add ('       TO_CHAR(EL.DATAINICIOAFAST, ''DD/MM/YYYY'') AS DATA_INIC_AFASTAMENTO, ');
    qry.sql.add ('       TO_CHAR(EL.DATAFIMAFAST, ''DD/MM/YYYY'') AS DATA_FIM_AFASTAMENTO,     ');
// Andre Tavares - 17433 - 01/10/2004 - Fim ------------------------------------

    // Marchetti - 21370
    qry.sql.add ('       AXA.IDCONTRATOEMPTMO AS CONTRATO_EMPRESTIMO,  ');
    qry.sql.add ('       AXA.VLRSOLICITADO AS VLRSOLIC_EMPRESTIMO,     ');
    qry.sql.add ('       AXA.NUMPARCELAS AS NUM_PARC_EMPRESTIMO        ');
    // Fim.

    qry.sql.add (' FROM  PESSOA P, ');
    qry.sql.add ('       PESSOA PJ, ');
    qry.sql.add ('       ELEGPATRO EL, ');
    qry.sql.add ('       PLANPREV PL, ');
    qry.sql.add ('       PATRO PT, ');
    qry.sql.add ('       PARTPREVPLAN PP, ');
    qry.sql.add ('       PESSOAFISICA PF, ');
    qry.sql.add ('       ENDPESS X, ');
    qry.sql.add ('       CIDADES CID, ');
    qry.sql.add ('       ESTADO EST, ');
    qry.sql.add ('       ATEND A, ');
    qry.sql.add ('       ASSUNTOXATEND AXA, ');
    qry.sql.add ('       RUBS, ');
    qry.sql.add (' (SELECT TEP.IDENDERECO, TEP.DDD, TEP.NUMERO FROM TELENDPESS TEP ');
    qry.sql.add (' WHERE TEP.IDTELEFONE IN (SELECT MAX(T.IDTELEFONE) AS IDTELEFONE FROM PESSOA P, TELENDPESS T ');
    qry.sql.add ('              WHERE P.IDENDRESIDENCIAL = T.IDENDERECO GROUP BY T.IDENDERECO)) TE, ');
    qry.sql.add ('       BANCO BAN, ');
    qry.sql.add ('       AGENCIABANCARIA AG, ');
    qry.sql.add ('       CONTABANCARIA  CONT, ');
    qry.sql.add ('       PESSOA  PB, ');
    qry.sql.add ('       PESSOA  PA, ');
    qry.sql.add ('       PAIS PI , ');
    qry.sql.add ('       DEPEN DEPEN, ');
    qry.sql.add ('       DEPENTIT, ');
    qry.sql.add ('       USUARIOSISTEMA USU, ');
    qry.sql.add ('       SITPART, ');
    qry.sql.add ('       SITPLANOPREV, ');
    qry.sql.add ('       (                                             ');
    qry.sql.add ('          SELECT RB.IDRUBS, RB.IDBENEFICIO, RB.IDSITBENEF,               ');
    qry.sql.add ('             DECODE(BE.DESCRUB,NULL,BE.NOME,BE.DESCRUB) AS NOME_BEN_SERV ');
    qry.sql.add ('          FROM                                                           ');
    qry.sql.add ('             RUBXBENEFICIO RB, BENEFICIO BE ');
    qry.sql.add ('          WHERE ');
    qry.sql.add ('             (RB.IDBENEFICIO = BE.IDBENEFICIO) ');
    qry.sql.add ('          UNION ');
    qry.sql.add ('          SELECT RB.IDRUBS, RB.IDBENEFICIO, RB.IDSITBENEF, ');
    qry.sql.add ('             SERV.NOME AS NOME_BEN_SERV ');
    qry.sql.add ('          FROM ');
    qry.sql.add ('             RUBXBENEFICIO RB, SERVICO SERV ');
    qry.sql.add ('          WHERE ');
    qry.sql.add ('             (RB.IDBENEFICIO = SERV.IDSERVICOS) ');
    qry.sql.add ('       ) BEN_SERV, ');

// Andre Tavares - 17433 - 01/10/2004 - Início ---------------------------------
    qry.sql.add ('       ( SELECT BE.IDPESSOA, RB.IDRUBS, RB.IDBENEFICIO, DATAINICIOFUND AS DATA_INIC_BENEFICIO ');
    qry.sql.add ('       FROM RUBXBENEFICIO RB, BENEFBFCIARIO BE                                   ');
    qry.sql.add ('       WHERE (RB.IDBENEFICIO = BE.IDBENEFICIO) AND (RB.IDPESSOA = BE.IDPESSOA))INICBENEF,              ');

    qry.sql.add ('       ( SELECT ENDAG.IDPESSOA, CIDAG.NOME AS CIDADE_AG_BANCARIA, ESTADOAG.CODESTADO AS UF_AG_BANCARIA ');
    qry.sql.add ('       FROM  ENDPESS ENDAG, CIDADES CIDAG, ESTADO ESTADOAG, PESSOA PESSAG                              ');
    qry.sql.add ('       WHERE      (ENDAG.IDCIDADES = CIDAG.IDCIDADES(+))                                               ');
    qry.sql.add ('       AND (CIDAG.IDESTADO = ESTADOAG.IDESTADO(+))                                                     ');
    qry.sql.add ('       AND (ENDAG.IDPESSOA = PESSAG.IDPESSOA)                                                          ');
    qry.sql.add ('       AND (PESSAG.IDENDCOMERCIAL = ENDAG.IDENDERECO)) ENDERECOAG                                      ');
// Andre Tavares - 17433 - 01/10/2004 - Fim ------------------------------------

    qry.sql.add (' WHERE ');

    if numRubs = -1 then
      qry.sql.add ('(RUBS.IDRUBS = (SELECT MAX(IDRUBS) FROM RUBS) )')
    else
      qry.sql.add ('      (RUBS.IDRUBS = ' + inttoStr(numRubs) +' ) ');

    qry.sql.add (' AND   (TE.IDENDERECO(+) = X.IDENDERECO) ');
    qry.sql.add (' AND   ( P.IDENDCORRESP = X.IDENDERECO(+)) ');
    qry.sql.add (' AND   (  X.IDCIDADES = CID.IDCIDADES(+)  ) ');
    qry.sql.add (' AND   (  EST.IDESTADO (+) = CID.IDESTADO) ');
    qry.sql.add (' AND   (AXA.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND) ');
    qry.sql.add (' AND   (PJ.IDPESSOA    = PT.IDPESSOA) ');
    qry.sql.add (' AND   (PT.IDPESSOA    = EL.IDPESSJUR) ');
    qry.sql.add (' AND   (P.IDPESSOA     = EL.IDPESSOA) ');
    qry.sql.add (' AND   (A.IDBENEFICIARIO     = PF.IDPESSOA) '); // Alberto - 20464 - 17/07/2006
    qry.sql.add (' AND   (PP.IDPESSJUR   = PT.IDPESSOA) ');
    qry.sql.add (' AND   (PP.IDPESSOA    = P.IDPESSOA) ');
    qry.sql.add (' AND   (PP.IDPLANOPREV = PL.IDPLANOPREV) ');
    qry.sql.add (' AND   ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND PPP1.FLGDESATIVADO IN (0, NULL))) OR PP.FLGDESATIVADO IN (0, NULL) ) ');
    qry.sql.add (' AND   (PP.INSCRICAODATA = (SELECT MAX(PP2.INSCRICAODATA) FROM PARTPREVPLAN PP2 WHERE PP2.IDPESSOA = PP.IDPESSOA)) ');
    qry.sql.add (' AND   (A.IDTITULAR = P.IDPESSOA) ');
    qry.sql.add (' AND   (A.IDPESSJUR = PP.IDPESSJUR) ');
    qry.sql.add (' AND   (A.IDATEND = AXA.IDATEND) ');
    qry.sql.add (' AND   (EST.IDESTADO (+) = CID.IDESTADO) ');
    qry.sql.add (' AND   (CONT.IDPESSOA (+) = A.IDBENEFICIARIO) '); // Andre Tavares - 18147 - 29/11/2004
    qry.sql.add (' AND   (CONT.FLGCONTAPREF(+)  = 1) '); // André Tavares - 16/01/2004 - 15946
    qry.sql.add (' AND   (CONT.IDAGENCIA = AG.IDPESSOA(+)) ');
    qry.sql.add (' AND   (BAN.IDPESSOA(+) = AG.IDBANCO) ');
    qry.sql.add (' AND   (PB.IDPESSOA(+) = AG.IDBANCO) ');
    qry.sql.add (' AND   (PA.IDPESSOA(+) = AG.IDPESSOA) ');
    qry.sql.add (' AND   (PI.IDPAIS(+) = PF.IDPAIS) ');
    qry.sql.add (' AND   (DEPENTIT.IDPESSOA(+) = A.IDBENEFICIARIO) ');
    qry.sql.add (' AND   (DEPEN.IDDEPENDENCIA(+) = DEPENTIT.IDDEPENDENCIA) ');
    qry.sql.add (' AND   (A.CODATENDENTE = USU.IDUSUARIO(+)) ');
    qry.sql.add (' AND   (PP.IDSITPART = SITPART.IDSITPART(+)) ');
    qry.sql.add (' AND   (PP.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV(+)) ');
    qry.sql.add (' AND   (RUBS.IDRUBS = BEN_SERV.IDRUBS) ');

    // Andre Tavares - 17433 - 01/10/2004
    qry.sql.add (' AND   (AG.IDPESSOA = ENDERECOAG.IDPESSOA(+)) ');
    qry.sql.add (' AND   (RUBS.IDRUBS = INICBENEF.IDRUBS(+)) ');
    // Fim.

    // LISTA DOCUMENTOS RELACIONADOS AO BENEFICIO OU SERVIÇO DA RUBS
    qryDetDocs.Close;
    qryDetDocs.SQL.Clear;
    qryDetDocs.SQL.ADD(' SELECT ');
    qryDetDocs.SQL.ADD(' TP.NOMEDOCUMENTO,');
    qryDetDocs.SQL.ADD(' TB.IDPESSOA,');
    qryDetDocs.SQL.ADD(' TB.IDPLANOPREV,');
    qryDetDocs.SQL.ADD(' TB.IDBENEFICIO,');
    qryDetDocs.SQL.ADD(' TB.IDSITBENEF,');
    qryDetDocs.SQL.ADD(' TB.IDDOCUMENTO,');
    qryDetDocs.SQL.ADD(' TB.IDTIPODOCXBENEF');
    qryDetDocs.SQL.ADD(' FROM DOCUMENTOS TP, TIPODOCXBENEF TB');
    qryDetDocs.SQL.ADD(' WHERE (TB.IDPESSOA    = :IDPATROCINADORA)  AND');
    qryDetDocs.SQL.ADD('       (TB.IDPLANOPREV = :IDPLANO) AND');
    qryDetDocs.SQL.ADD('       (TB.IDBENEFICIO = :IDBENEFICIO)AND');
    qryDetDocs.SQL.ADD('       (TB.IDSITBENEF  = :IDSITBENEF) AND');
    qryDetDocs.SQL.ADD('       (TB.IDDOCUMENTO = TP.IDDOCUMENTO)');
    qryDetDocs.SQL.ADD(' ORDER BY TP.NOMEDOCUMENTO');

    // LISTA DADOS DOS DEPENDENTES DO IRRF
    qryDetDependIRRF.Close;
    qryDetDependIRRF.SQL.Clear;
    qryDetDependIRRF.SQL.ADD(' SELECT D.NUMSEQUENCIA, P.NOME,');
    qryDetDependIRRF.SQL.ADD('        P.NUMDOCUMENTO AS CPF,');
    qryDetDependIRRF.SQL.ADD('        DP.DESCRICAO AS DEPENDENCIA,');
    qryDetDependIRRF.SQL.ADD('        DECODE(D.FLGCONTAIMPOSTOR, 1, ''SIM'', ''NÃO'') AS DEPENDIRRF,');
    qryDetDependIRRF.SQL.ADD('        DECODE(D.FLGCONTASALARIOF, 1, ''SIM'', ''NÃO'') AS DEPENDSALARIOFAMILIA,');
    qryDetDependIRRF.SQL.ADD('        DECODE (DECODE(BF.IDPESSOA, NULL, 0, 1 ), 1, ''SIM'', ''NÃO'') AS BENEFICIARIO,');
    qryDetDependIRRF.SQL.ADD('        DECODE(PF.ESTCIVIL, ''S'', ''Solteiro'',');
    qryDetDependIRRF.SQL.ADD('        ''C'', ''Casado(a) ou Equiparado(a)'',');
    qryDetDependIRRF.SQL.ADD('        ''D'', ''Divorciado(a)'',');
    qryDetDependIRRF.SQL.ADD('        ''E'', ''Desquitado(a)'',');
    qryDetDependIRRF.SQL.ADD('        ''J'', ''Separado(a) Judicial'',');
    qryDetDependIRRF.SQL.ADD('        ''V'', ''Viúvo(a)'',');
    qryDetDependIRRF.SQL.ADD('        ''M'', ''Marital'',');
    qryDetDependIRRF.SQL.ADD('        ''P'', ''Separado(a)'',');
    qryDetDependIRRF.SQL.ADD('        ''O'', ''Outros'')  AS DESCESTCIVIL,');
    qryDetDependIRRF.SQL.ADD('        DECODE(D.FLGDESIGNADO, 1, ''SIM'', ''NÃO'') AS DESIGNADO,');
    qryDetDependIRRF.SQL.ADD('        DECODE(D.FLGDEPLEGAL, 1, ''SIM'', ''NÃO'') AS DEPENDENTE_LEGAL,');
    qryDetDependIRRF.SQL.ADD('        D.MATRICULA, D.IDTITULAR,');
    qryDetDependIRRF.SQL.ADD('        D.INICIOIMPOSTOR AS DATA_INICIO_IRRF,');
    qryDetDependIRRF.SQL.ADD('        D.FIMIMPOSTOR AS DATA_FIM_IRRF,');
    qryDetDependIRRF.SQL.ADD('        D.INICIOSALARIOF AS DT_INI_SAL_FAMILIA,');
    qryDetDependIRRF.SQL.ADD('        D.FIMSALARIOF AS DT_FIM_SAL_FAMILIA,');
    qryDetDependIRRF.SQL.ADD('        PF.DATANASC AS DATA_NASCIMENTO,');
    qryDetDependIRRF.SQL.ADD('        PF.DATAMORTE AS DATA_MORTE,');
    qryDetDependIRRF.SQL.ADD('        PF.NOMEPAI AS NOME_PAI,');
    qryDetDependIRRF.SQL.ADD('        PF.NOMEMAE AS NOME_MAE,');
    qryDetDependIRRF.SQL.ADD('        DECODE(PF.SEXO, ''M'', ''MASCULINO'', ''FEMININO'') AS SEXO,');
    qryDetDependIRRF.SQL.ADD('        DECODE(PF.FLGMOLESTIAGRAVE, 1, ''SIM'', ''NÃO'') AS POSSUI_MOLESTIA_GRAVE,');
    qryDetDependIRRF.SQL.ADD('        PF.DATAMOLESTIAGRAVE AS DATA_MOLESTIA_GRAVE,');
    qryDetDependIRRF.SQL.ADD('        DECODE(PF.FLGISENTOIRRF, 1, ''SIM'', ''NÃO'') AS ISENOT_IRRF,');
    qryDetDependIRRF.SQL.ADD('        SIT.DESCRICAO AS SITUACAO_DEPENDENTE');
    qryDetDependIRRF.SQL.ADD('        FROM   PESSOA P, PESSOAFISICA PF, SITDEPENDENTE SIT, DEPEN DP, DEPENDENTE DEP, DEPENTIT D, (SELECT DISTINCT IDTITULAR,IDPESSOA FROM BENEFBFCIARIO');
    qryDetDependIRRF.SQL.ADD('        WHERE IDTITULAR     = :IDTITULAR AND IDSITBENEFICIO IN (1,2,4)) BF');
    qryDetDependIRRF.SQL.ADD(' WHERE  D.IDTITULAR         = :IDTITULAR');
    qryDetDependIRRF.SQL.ADD('        AND    D.IDDEPENDENCIA <> ''PRP''');
    qryDetDependIRRF.SQL.ADD('        AND    D.IDPESSOA      = P.IDPESSOA');
    qryDetDependIRRF.SQL.ADD('        AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA');
    qryDetDependIRRF.SQL.ADD('        AND    BF.IDTITULAR(+) = D.IDTITULAR');
    qryDetDependIRRF.SQL.ADD('        AND    BF.IDPESSOA(+)  = D.IDPESSOA');
    qryDetDependIRRF.SQL.ADD('        AND    PF.IDPESSOA     = D.IDPESSOA');
    qryDetDependIRRF.SQL.ADD('        AND    DEP.IDPESSOA    = D.IDPESSOA');
    qryDetDependIRRF.SQL.ADD('        AND    DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)');
    qryDetDependIRRF.SQL.ADD('        AND    D.FLGCONTAIMPOSTOR = 1');
    qryDetDependIRRF.SQL.ADD('        ORDER BY D.NUMSEQUENCIA');

// Lista dos telefones do Solicitante
    qryDetTelefones.Close;
    qryDetTelefones.SQL.Clear;
    qryDetTelefones.SQL.ADD(' SELECT TEL.DDI, TEL.DDD, TEL.NUMERO, TEL.TIPO,');
    qryDetTelefones.SQL.ADD(' DECODE(SUBSTR(TEL.TIPO,  1, 1),');
    qryDetTelefones.SQL.ADD('         ''P'', ''PREFERENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''R'', ''RESIDENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''C'', ''COMERCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''L'', ''CELULAR\'',');
    qryDetTelefones.SQL.ADD('         ''F'', ''FAX\'',');
    qryDetTelefones.SQL.ADD('         ''M'', ''MODEM\'',');
    qryDetTelefones.SQL.ADD('         ''D'', ''RECADOS\'' , '''') ||');
    qryDetTelefones.SQL.ADD(' DECODE(SUBSTR(TEL.TIPO,  2, 1),');
    qryDetTelefones.SQL.ADD('         ''P'', ''PREFERENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''R'', ''RESIDENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''C'', ''COMERCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''L'', ''CELULAR\'',');
    qryDetTelefones.SQL.ADD('         ''F'', ''FAX\'',');
    qryDetTelefones.SQL.ADD('         ''M'', ''MODEM\'',');
    qryDetTelefones.SQL.ADD('         ''D'', ''RECADOS\'' , '''') ||');
    qryDetTelefones.SQL.ADD(' DECODE(SUBSTR(TEL.TIPO,  3, 1),');
    qryDetTelefones.SQL.ADD('         ''P'', ''PREFERENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''R'', ''RESIDENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''C'', ''COMERCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''L'', ''CELULAR\'',');
    qryDetTelefones.SQL.ADD('         ''F'', ''FAX\'',');
    qryDetTelefones.SQL.ADD('         ''M'', ''MODEM\'',');
    qryDetTelefones.SQL.ADD('         ''D'', ''RECADOS\'' , '''') ||');
    qryDetTelefones.SQL.ADD(' DECODE(SUBSTR(TEL.TIPO,  4, 1),');
    qryDetTelefones.SQL.ADD('         ''P'', ''PREFERENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''R'', ''RESIDENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''C'', ''COMERCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''L'', ''CELULAR\'',');
    qryDetTelefones.SQL.ADD('         ''F'', ''FAX\'',');
    qryDetTelefones.SQL.ADD('         ''M'', ''MODEM\'',');
    qryDetTelefones.SQL.ADD('         ''D'', ''RECADOS\'' , '''') ||');
    qryDetTelefones.SQL.ADD(' DECODE(SUBSTR(TEL.TIPO,  5, 1),');
    qryDetTelefones.SQL.ADD('         ''P'', ''PREFERENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''R'', ''RESIDENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''C'', ''COMERCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''L'', ''CELULAR\'',');
    qryDetTelefones.SQL.ADD('         ''F'', ''FAX\'',');
    qryDetTelefones.SQL.ADD('         ''M'', ''MODEM\'',');
    qryDetTelefones.SQL.ADD('         ''D'', ''RECADOS\'' , '''') ||');
    qryDetTelefones.SQL.ADD(' DECODE(SUBSTR(TEL.TIPO,  6, 1),');
    qryDetTelefones.SQL.ADD('         ''P'', ''PREFERENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''R'', ''RESIDENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''C'', ''COMERCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''L'', ''CELULAR\'',');
    qryDetTelefones.SQL.ADD('         ''F'', ''FAX\'',');
    qryDetTelefones.SQL.ADD('         ''M'', ''MODEM\'',');
    qryDetTelefones.SQL.ADD('         ''D'', ''RECADOS\'' , '''') || ');
    qryDetTelefones.SQL.ADD(' DECODE(SUBSTR(TEL.TIPO,  7, 1),');
    qryDetTelefones.SQL.ADD('         ''P'', ''PREFERENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''R'', ''RESIDENCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''C'', ''COMERCIAL\'',');
    qryDetTelefones.SQL.ADD('         ''L'', ''CELULAR\'',');
    qryDetTelefones.SQL.ADD('         ''F'', ''FAX\'',');
    qryDetTelefones.SQL.ADD('         ''M'', ''MODEM\'',');
    qryDetTelefones.SQL.ADD('         ''D'', ''RECADOS\'' , '''') AS DESCTIPO');
    qryDetTelefones.SQL.ADD(' FROM ENDPESS EP, TELENDPESS TEL');
    qryDetTelefones.SQL.ADD(' WHERE EP.IDPESSOA = :IDBENEFICIARIO AND');
    qryDetTelefones.SQL.ADD(' TEL.IDENDERECO = EP.IDENDERECO');

    // David - 20464
    qryDetDependentes.Close;
    qryDetDependentes.SQL.Clear;
    qryDetDependentes.SQL.ADD(' SELECT D.NUMSEQUENCIA, P.NOME, ');
    qryDetDependentes.SQL.ADD('        P.NUMDOCUMENTO AS CPF, ');
    qryDetDependentes.SQL.ADD('        DP.DESCRICAO AS DEPENDENCIA, ');
    qryDetDependentes.SQL.ADD('        DECODE(PF.ESTCIVIL, ''S'', ''Solteiro'', ');
    qryDetDependentes.SQL.ADD('                            ''C'', ''Casado(a) ou Equiparado(a)'', ');
    qryDetDependentes.SQL.ADD('                            ''D'', ''Divorciado(a)'', ');
    qryDetDependentes.SQL.ADD('                            ''E'', ''Desquitado(a)'', ');
    qryDetDependentes.SQL.ADD('                            ''J'', ''Separado(a) Judicial'', ');
    qryDetDependentes.SQL.ADD('                            ''V'', ''Viúvo(a)'', ');
    qryDetDependentes.SQL.ADD('                            ''M'', ''Marital'', ');
    qryDetDependentes.SQL.ADD('                            ''P'', ''Separado(a)'', ');
    qryDetDependentes.SQL.ADD('                            ''O'', ''Outros'')  AS DESCESTCIVIL, ');
    qryDetDependentes.SQL.ADD('        DECODE(D.FLGDESIGNADO, 1, ''SIM'', ''NÃO'') AS DESIGNADO, ');
    qryDetDependentes.SQL.ADD('        DECODE(D.FLGDEPLEGAL, 1, ''SIM'', ''NÃO'') AS DEPENDENTE_LEGAL, ');
    qryDetDependentes.SQL.ADD('        D.MATRICULA, ');
    qryDetDependentes.SQL.ADD('        PF.DATANASC AS DATA_NASCIMENTO, ');
    qryDetDependentes.SQL.ADD('        PF.DATAMORTE AS DATA_MORTE, ');
    qryDetDependentes.SQL.ADD('        PF.NOMEPAI AS NOME_PAI, ');
    qryDetDependentes.SQL.ADD('        PF.NOMEMAE AS NOME_MAE, ');
    qryDetDependentes.SQL.ADD('        DECODE(PF.SEXO, ''M'', ''MASCULINO'', ''FEMININO'') AS SEXO, ');
    qryDetDependentes.SQL.ADD('        DECODE(PF.FLGMOLESTIAGRAVE, 1, ''SIM'', ''NÃO'') AS POSSUI_MOLESTIA_GRAVE, ');
    qryDetDependentes.SQL.ADD('        PF.DATAMOLESTIAGRAVE AS DATA_MOLESTIA_GRAVE, ');
    qryDetDependentes.SQL.ADD('        SIT.DESCRICAO AS SITUACAO_DEPENDENTE ');
    qryDetDependentes.SQL.ADD(' FROM   PESSOA P, ');
    qryDetDependentes.SQL.ADD('        PESSOAFISICA PF, ');
    qryDetDependentes.SQL.ADD('        SITDEPENDENTE SIT, ');
    qryDetDependentes.SQL.ADD('        DEPEN DP, ');
    qryDetDependentes.SQL.ADD('        DEPENDENTE DEP, ');
    qryDetDependentes.SQL.ADD('        DEPENTIT D ');
    qryDetDependentes.SQL.ADD(' WHERE  D.IDTITULAR     = :IDTITULAR ');
    qryDetDependentes.SQL.ADD(' AND    D.IDDEPENDENCIA <> ''PRP'' ');
    qryDetDependentes.SQL.ADD(' AND    D.IDPESSOA      = P.IDPESSOA ');
    qryDetDependentes.SQL.ADD(' AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA ');
    qryDetDependentes.SQL.ADD(' AND    PF.IDPESSOA     = D.IDPESSOA ');
    qryDetDependentes.SQL.ADD(' AND    DEP.IDPESSOA    = D.IDPESSOA ');
    qryDetDependentes.SQL.ADD(' AND    DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+) ');
    qryDetDependentes.SQL.ADD(' ORDER BY D.NUMSEQUENCIA ');


    // David - 20464
    qryDetBeneficiarios.Close;
    qryDetBeneficiarios.SQL.Clear;
    qryDetBeneficiarios.SQL.ADD(' SELECT P.IDPESSOA, ');
    qryDetBeneficiarios.SQL.ADD('        P.NOME, ');
    qryDetBeneficiarios.SQL.ADD('        DP.DESCRICAO AS DEPENDENCIA, ');
    qryDetBeneficiarios.SQL.ADD('        DECODE( F.ESTCIVIL, ''S'', ''Solteiro'', ');
    qryDetBeneficiarios.SQL.ADD('                            ''C'', ''Casado(a) ou Equiparado(a)'', ');
    qryDetBeneficiarios.SQL.ADD('                            ''D'', ''Divorciado(a)'', ');
    qryDetBeneficiarios.SQL.ADD('                            ''E'', ''Desquitado(a)'', ');
    qryDetBeneficiarios.SQL.ADD('                            ''J'', ''Separado(a) Judicial'', ');
    qryDetBeneficiarios.SQL.ADD('                            ''V'', ''Viúvo(a)'', ');
    qryDetBeneficiarios.SQL.ADD('                            ''M'', ''Marital'', ');
    qryDetBeneficiarios.SQL.ADD('                            ''P'', ''Separado(a)'', ');
    qryDetBeneficiarios.SQL.ADD('                            ''O'', ''Outros'')  AS DESCESTCIVIL, ');
    qryDetBeneficiarios.SQL.ADD('        F.DATANASC, ');
    qryDetBeneficiarios.SQL.ADD('        DECODE( F.SEXO, ''M'', ''MASCULINO'', ''FEMININO'' ) AS SEXO ');
    qryDetBeneficiarios.SQL.ADD(' FROM   PESSOA        P, ');
    qryDetBeneficiarios.SQL.ADD('        BENEFBFCIARIO B, ');
    qryDetBeneficiarios.SQL.ADD('        PESSOAFISICA  F, ');
    qryDetBeneficiarios.SQL.ADD('        DEPENTIT      D, ');
    qryDetBeneficiarios.SQL.ADD('        DEPEN         DP ');
    qryDetBeneficiarios.SQL.ADD(' WHERE  P.IDPESSOA      = B.IDPESSOA ');
    qryDetBeneficiarios.SQL.ADD('   AND  P.IDPESSOA      = F.IDPESSOA ');
    qryDetBeneficiarios.SQL.ADD('   AND  D.IDTITULAR     = B.IDTITULAR (+) ');
    qryDetBeneficiarios.SQL.ADD('   AND  D.IDPESSOA      = B.IDPESSOA ');
    qryDetBeneficiarios.SQL.ADD('   AND  D.IDDEPENDENCIA <> ''PRP'' ');
    qryDetBeneficiarios.SQL.ADD('   AND  D.IDDEPENDENCIA = DP.IDDEPENDENCIA ');
    qryDetBeneficiarios.SQL.ADD('   AND  B.IDTITULAR     = :IDTITULAR ');
    qryDetBeneficiarios.SQL.ADD('   AND  B.IDBENEFICIO   = :IDBENEFICIO ');
    qryDetBeneficiarios.SQL.ADD('   AND  B.IDPLANOPREV   = :IDPLANO ');
    qryDetBeneficiarios.SQL.ADD('   AND  B.IDPESSJUR     = :IDPATROCINADORA ');



    qry.Open;
    qryDetDocs.Open;
    qryDetDependIRRF.Open;
    qryDetTelefones.Open;
    qryDetDependentes.Open;
    qryDetBeneficiarios.Open;

    qryAux.free;
    result := true;
  except
    On E : Exception do
    begin
      ShowMessage( 'Não foi possível montar a query.' + #13#10 + E.Message );
      qryAux.free;
      qry.close;
      result := false;
    end;
  end;
end;

end.
