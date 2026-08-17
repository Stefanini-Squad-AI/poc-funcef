// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  13/05/2009
// Pendência   : SOL 116806 KINTANA 549481
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RCartaConvoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppCtrls,
  ppPrnabl, ppBands, ppCache, ppVar, ppStrtch, ppMemo, ppSubRpt, TXRB;

type
  TRptCartaConvoc = class(TFrmCmReport)
    rpCartaConvoc: TppReport;
    ppCartaConvoc: TppBDEPipeline;
    dsCartaConvoc: TwwDataSource;
    CdsCartaConvoc: TCMClientDataSet;
    sqlCartaConvoc: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
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
    rpCartaConvocLblEmpresa: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc2: TppSystemVariable;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppObserv: TppBDEPipeline;
    dsObserv: TwwDataSource;
    CdsObserv: TCMClientDataSet;
    sqlObserv: TCMSqlParams;
    ppLabel2: TppLabel;
    ppDBText10: TppDBText;
    ppLabel8: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    rpCartaConvocSmryBnd: TppSummaryBand;
    SubInstrutor: TppSubReport;
    ppChildReport3: TppChildReport;
    ppDetailBand4: TppDetailBand;
    ppLabel14: TppLabel;
    ppDBText13: TppDBText;
    ppDBMemo1: TppDBMemo;
    SubHorario: TppSubReport;
    ppChildReport4: TppChildReport;
    ppDetailBand5: TppDetailBand;
    ppLabel11: TppLabel;
    ppDBMemo4: TppDBMemo;
    SubConteudo: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel13: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBMemo3: TppDBMemo;
    SubObserv: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel12: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBMemo2: TppDBMemo;
    ppTitleBand4: TppTitleBand;
    ppTitleBand3: TppTitleBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpCartaConvocSmryBndAfterPrint(Sender: TObject);
    procedure CdsCartaConvocAfterScroll(DataSet: TDataSet);
  public
    sPessoasInscritas, sCurso, sEntid, sInstrutor, sIdCurso, sIdEntid,
    sIdInstrutor, sIniPlan, sFimPlan, sIniReal, sFimReal, sDataIni, sDataFim: string;
  end;

var
  RptCartaConvoc: TRptCartaConvoc;

implementation

uses uSistema, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptCartaConvoc.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Carta de Convocação');

  rpCartaConvocLblEmpresa.Caption := Sistema.NomeEmpresa;

  with (sqlCartaConvoc.SQL) do
  begin
    Clear;
    // Selecionar Empregados
    Add('SELECT DISTINCT');
    Add('  P.NOME AS EMPREGADO, ''0'' || RTRIM(UPPER(P.NOME)) AS IDENT,');
    Add('  PS.NOME AS SUPERVISOR, F.MATRICULA, FS.MATRICULA AS MATRSUP,');
    Add('  ' +QuotedStr(sCurso)+ ' AS DESCRICAO,');
    Add('  ' +QuotedStr(sEntid)+ ' AS ENTIDADE,');
    Add('  ' +QuotedStr(sInstrutor)+ ' AS INSTRUTOR,');
    Add('  ' +QuotedStr(sDataIni)+ ' AS DATAINI,');
    Add('  ' +QuotedStr(sDataFim)+ ' AS DATAFIM,');
    Add('  RTRIM(PJ.NOME) || '' - '' || RTRIM(CC.NOME) AS ENDSETOR,');
    Add('  C.TITULO AS CARGO, H.LOCALCURSO AS LOCAL,');
    Add('  H.DATAHORA, H.INSTRUTORES');
    Add('FROM');
    Add('  PESSOA P, PESSOA PS, PESSOA PJ, HSTTRN H,');
    Add('  FUNCIONARIO F, CENTCUST CC, CARGO C,');

  //sSQL := sSQL + '(SELECT DISTINCT F.MATRICULA, F.IDPESSOA ';
  //sSQL := sSQL + ' FROM FUNCIONARIO F, FUNCIONARIO F2 ';
  //sSQL := sSQL + ' WHERE F.IDPESSOA = F2.IDCHEFE) FS ';
  // Obs.: Na query acima vamos inserir o campo FLGSUPERVISOR e vai ficar assim:
  //       Tem que acrescentar lá embaixo os WHERE que foram inibidos
  
    Add('  (SELECT DISTINCT');
    Add('     F.MATRICULA, F.IDPESSOA, F2.IDEMPRESA, F2.CODCENTROCUSTO');
    Add('   FROM');
    Add('     FUNCIONARIO F, FUNCIONARIO F2');
    Add('   WHERE');

    if (CmpRptCM.ParamByName('Todos').asInteger = 1) and (sPessoasInscritas = '') then
      Add('     (F2.IDPESSOA  = -1) AND')
    else
      Add('     (F2.IDPESSOA IN (' +sPessoasInscritas+ ')) AND');

    Add('     (F2.IDCHEFE   = F.IDPESSOA)');
    Add('   UNION');
    Add('   SELECT');
    Add('     F.MATRICULA, F.IDPESSOA, U.IDEMPRESA, U.CODCENTROCUSTO');
    Add('   FROM');
    Add('     FUNCIONARIO F, USCCUSTORH U');
    Add('   WHERE');
    Add('     (U.FLGSUPERVISOR = 1) AND');
    Add('     (U.IDUSUARIO     = F.IDPESSOA)) FS');
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

    if (CmpRptCM.ParamByName('Todos').asInteger = 1) and (sPessoasInscritas = '') then
      Add('  (H.IDPESSOA        = -1) AND')
    else
      Add('  (H.IDPESSOA       IN (' +sPessoasInscritas+ ')) AND');

    Add('  (H.IDPESSOA        = P.IDPESSOA) AND');
    Add('  (H.IDPESSOA        = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND');
    Add('  (F.IDEMPRESA       = FS.IDEMPRESA(+)) AND');
    Add('  (F.CODCENTROCUSTO  = FS.CODCENTROCUSTO(+)) AND');
    //sSQL := sSQL + ' AND    F.IDCHEFE = FS.IDPESSOA(+) '  ; // ESTE TEM QUE SAIR
    Add('  (FS.IDPESSOA       = PS.IDPESSOA(+))');
    // Selecionar Candidatos
    Add('UNION');
    Add('SELECT');
    Add('  P.NOME AS EMPREGADO, ''1'' || RTRIM(UPPER(P.NOME)) AS IDENT,');
    Add('  '' '' AS SUPERVISOR, TO_CHAR(F.IDPESSOA) AS MATRICULA, '' '' AS MATRSUP,');
    Add('  ' +QuotedStr(sCurso)+ ' AS DESCRICAO,');
    Add('  ' +QuotedStr(sEntid)+ ' AS ENTIDADE,');
    Add('  ' +QuotedStr(sInstrutor)+ ' AS INSTRUTOR,');
    Add('  ' +QuotedStr(sDataIni)+ ' AS DATAINI,');
    Add('  ' +QuotedStr(sDataFim)+ ' AS DATAFIM,');
    Add('  RTRIM(EP.LOGRADOURO) || '' '' || RTRIM(EP.NUMERO) || '' '' ||');
    Add('  RTRIM(EP.COMPLEMENTO) || '' '' || RTRIM(EP.BAIRRO) || '' '' || RTRIM(EP.CEP) ||');
    Add('  '' '' || RTRIM(CI.NOME) || '' '' || RTRIM(EP.CODESTADO) || '' - Tel: '' ||');
    Add('  RTRIM(TELEFONE.DDI) || TELEFONE.DDD || '' '' || TELEFONE.NUMERO AS ENDSETOR,');
    Add('  C.TITULO AS CARGO, H.LOCALCURSO AS LOCAL,');
    Add('  H.DATAHORA, H.INSTRUTORES');
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
    Add('        IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
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

    if (CmpRptCM.ParamByName('Todos').AsInteger = 1) then
      if (sPessoasInscritas <> '') then
        Add('  (H.IDPESSOA        IN (' + sPessoasInscritas + ')) AND')
      else
        Add('  (H.IDPESSOA         = -1) AND');

    Add('  (H.IDPESSOA         = P.IDPESSOA) AND');
    Add('  (H.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (F.IDCARGO          = C.IDCARGO) AND');
    Add('  (P.IDPESSOA         = EP.IDPESSOA(+)) AND');
    Add('  (P.IDENDRESIDENCIAL = EP.IDENDERECO(+)) AND');
    Add('  (EP.IDCIDADES       = CI.IDCIDADES(+)) AND');
    Add('  (P.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+))');
    Add('ORDER BY 2');
//    SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlCartaConvoc.Open;
  frmAguarde.Max := CdsCartaConvoc.RecordCount;

  // Conteúdo e Observação do Curso
  with (sqlObserv.SQL) do
  begin
    Clear;
    Add('SELECT OBSERVACAO, OBSERVACAO2');
    Add('FROM   CURSO');
    Add('WHERE  (IDCURSO = ' +sIdCurso+ ')');
  end;
  sqlObserv.Open;
end;

procedure TRptCartaConvoc.CdsCartaConvocAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCartaConvoc.rpCartaConvocSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
