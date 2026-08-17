// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  13/05/2009
// Pendência   : SOL 116806 KINTANA 549481
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RCertificado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppCtrls,
  ppPrnabl, ppBands, ppCache, ppVar, ppStrtch, ppMemo, ppSubRpt, IvDictio, IvMulti,
  TXRB;

type
  TRptCertificado = class(TFrmCmReport)
    rpCertificado: TppReport;
    ppCertificado: TppBDEPipeline;
    dsCertificado: TwwDataSource;
    CdsCertificado: TCMClientDataSet;
    sqlCertificado: TCMSqlParams;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    rpCertificadoLblEmpresa: TppLabel;
    rpTabCursosCalc2: TppSystemVariable;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel3: TppLabel;
    ppLabel15: TppLabel;
    ppImage1: TppImage;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel12: TppLabel;
    ppShape1: TppShape;
    rpCertificadoSmryBnd: TppSummaryBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpCertificadoSmryBndAfterPrint(Sender: TObject);
    procedure CdsCertificadoAfterScroll(DataSet: TDataSet);
  public
    sPessoasInscritas, sCurso, sEntid, sInstrutor, sIdCurso, sIdEntid,
    sIdInstrutor, sIniPlan, sFimPlan, sIniReal, sFimReal, sDataIni, sDataFim: string;
  end;

var
  RptCertificado: TRptCertificado;

implementation

uses uSistema, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptCertificado.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Certificado de Conclusão');

  rpCertificadoLblEmpresa.Caption := Sistema.NomeEmpresa;

  with (sqlCertificado.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Selecionar Empregados
    Add('  P.NOME AS EMPREGADO,');
    Add('  ''0'' || RTRIM(UPPER(P.NOME)) AS IDENT,');
    Add('  F.MATRICULA,');
    Add('  ' +QuotedStr(sCurso)+ ' AS DESCRICAO,');
    Add('  ' +QuotedStr(sEntid)+ ' AS ENTIDADE,');
    Add('  ' +QuotedStr(sInstrutor)+ ' AS INSTRUTOR,');
    Add('  ' +QuotedStr(sDataIni)+ ' AS DATAINI,');
    Add('  ' +QuotedStr(sDataFim)+ ' AS DATAFIM,');
    Add('  RTRIM(PJ.NOME) || '' - '' || RTRIM(CC.NOME) AS ENDSETOR,');
    Add('  C.TITULO AS CARGO,');
    Add('  H.LOCALCURSO AS LOCAL,');
    Add('  H.DATAHORA,');
    Add('  H.INSTRUTORES');
    Add('FROM');
    Add('  PESSOA P, PESSOA PJ, HSTTRN H,');
    Add('  FUNCIONARIO F, CENTCUST CC, CARGO C');
    Add('WHERE');
    Add('  (H.IDCURSO         = ' +sIdCurso+ ') AND');

    if (sEntid <> '') then
      Add('  (H.IDENTIDINSTR    = ' +sIdEntid+ ') AND');

    if (sInstrutor <> '') then
      Add('  (H.IDINSTRUTOR     = ' +sIdInstrutor+ ') AND');

    if (sIniPlan <> '') then
      Add('  (H.DATPLINI        = TO_DATE(' +QuotedStr(sIniPlan)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATPLINI       IS NULL) AND');

    if (sFimPlan <> '') then
      Add('  (H.DATPLFIM        = TO_DATE(' +QuotedStr(sFimPlan)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATPLFIM       IS NULL) AND');

    if (sIniReal <> '') then
      Add('  (H.DATREINI        = TO_DATE(' +QuotedStr(sIniReal)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATREINI       IS NULL) AND');

    if (sFimReal <> '') then
      Add('  (H.DATREFIM        = TO_DATE(' +QuotedStr(sFimReal)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATREFIM       IS NULL) AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('  (F.IDESTAB        IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if (CmpRptCM.ParamByName('Todos').asInteger = 1) then
      if (sPessoasInscritas <> '') then
        Add('  (H.IDPESSOA       IN (' +sPessoasInscritas+ ')) AND')
      else
        Add('  (H.IDPESSOA        = -1) AND');

    Add('  (H.IDPESSOA        = P.IDPESSOA) AND');
    Add('  (H.IDPESSOA        = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDCARGO         = C.IDCARGO)');
    // Selecionar Candidatos
    Add('UNION');
    Add('(');
    Add('SELECT');
    Add('  P.NOME AS EMPREGADO,');
    Add('  ''1'' || RTRIM(UPPER(P.NOME)) AS IDENT,');
    Add('  TO_CHAR(F.IDPESSOA) AS MATRICULA,');
    Add('  ' +QuotedStr(sCurso)+ ' AS DESCRICAO,');
    Add('  ' +QuotedStr(sEntid)+ ' AS ENTIDADE,');
    Add('  ' +QuotedStr(sInstrutor)+ ' AS INSTRUTOR,');
    Add('  ' +QuotedStr(sDataIni)+ ' AS DATAINI,');
    Add('  ' +QuotedStr(sDataFim)+ ' AS DATAFIM,');
    Add('  RTRIM(EP.LOGRADOURO) || '' '' || TO_CHAR(EP.NUMERO) || '' '' ||');
    Add('  RTRIM(EP.COMPLEMENTO) || '' '' || RTRIM(EP.BAIRRO) || '' '' || RTRIM(EP.CEP) ||');
    Add('  '' '' || RTRIM(CI.NOME) || '' '' || RTRIM(EP.CODESTADO) || ' +
      QuotedStr(Translate(' - Tel: '))+ ' ||');
    Add('  RTRIM(TELEFONE.DDI) || TELEFONE.DDD || '' '' || TELEFONE.NUMERO AS ENDSETOR,');
    Add('  C.TITULO AS CARGO,');
    Add('  H.LOCALCURSO AS LOCAL,');
    Add('  H.DATAHORA,');
    Add('  H.INSTRUTORES');
    Add('FROM');
    Add('  PESSOA P, HSTTRN H, CANDIDAT F, ENDPESS EP, CIDADES CI, CARGO C,');
    Add('  (SELECT');
    Add('     TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT');
    Add('        MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM');
    Add('        TELENDPESS');
    Add('      GROUP BY');
    Add('        IDENDERECO) ENDER');
    Add('   WHERE');
    Add('     (ENDER.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
    Add('WHERE');
    Add('  (H.IDCURSO          = ' +sIdCurso+ ') AND');

    if (sEntid <> '') then
      Add('  (H.IDENTIDINSTR     = ' +sIdEntid+ ') AND');

    if (sInstrutor <> '') then
      Add('  (H.IDINSTRUTOR      = ' +sIdInstrutor+ ') AND');

    if (sIniPlan <> '') then
      Add('  (H.DATPLINI         = TO_DATE(' +QuotedStr(sIniPlan)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATPLINI        IS NULL) AND');

    if (sFimPlan <> '') then
      Add('  (H.DATPLFIM         = TO_DATE(' +QuotedStr(sFimPlan)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATPLFIM        IS NULL) AND');

    if (sIniReal <> '') then
      Add('  (H.DATREINI         = TO_DATE(' +QuotedStr(sIniReal)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATREINI        IS NULL) AND');

    if (sFimReal <> '') then
      Add('  (H.DATREFIM         = TO_DATE(' +QuotedStr(sFimReal)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATREFIM        IS NULL) AND');

    if (CmpRptCM.ParamByName('Todos').asInteger = 1) then
      if (sPessoasInscritas <> '') then
        Add('  (H.IDPESSOA        IN (' +sPessoasInscritas+ ')) AND')
      else
        Add('  (H.IDPESSOA         = -1) AND');

    Add('  (H.IDPESSOA         = P.IDPESSOA) AND');
    Add('  (H.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (P.IDPESSOA         = EP.IDPESSOA(+)) AND');
    Add('  (P.IDENDRESIDENCIAL = EP.IDENDERECO(+)) AND');
    Add('  (EP.IDCIDADES       = CI.IDCIDADES(+)) AND');
    Add('  (P.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+)) AND');
    Add('  (F.IDCARGO          = C.IDCARGO)');
    Add(')');
    Add('ORDER BY 2');
//    SaveToFile(ExtractFilePath(Application.ExeName) + 'qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'/qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlCertificado.Open;
  frmAguarde.Max := CdsCertificado.RecordCount;

end;

procedure TRptCertificado.CdsCertificadoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCertificado.rpCertificadoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
