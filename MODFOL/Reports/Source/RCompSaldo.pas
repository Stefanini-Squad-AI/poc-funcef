// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RCompSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  DBClient, uCMClientDataSet, uCmSqlParams, Db, DBTables, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE,
  ppCtrls, ppBands, ppVar, ppReport, ppStrtch, ppSubRpt, ppClass, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, uCmRptManager, TXComp, CmParamReport, TXRB, USistema;

type
  TRptCompSaldo = class(TFrmCmReport)
    rpCompSaldo: TppReport;
    rpCompSaldoHdrBnd: TppHeaderBand;
    rpCompSaldoLabel1: TppLabel;
    rpCompSaldoDBText1: TppDBText;
    rpCompSaldoDBText2: TppDBText;
    rpCompSaldoDBText3: TppDBText;
    rpCompSaldoDBText4: TppDBText;
    rpCompSaldoLine1: TppLine;
    rpCompSaldoLabel2: TppLabel;
    rpCompSaldoCalc1: TppCalc;
    rpCompSaldoLabel3: TppLabel;
    rpCompSaldoCalc2: TppCalc;
    rpCompSaldoLabel4: TppLabel;
    rpCompSaldoLabel5: TppLabel;
    rpCompSaldoDBTextRUBBASE: TppDBText;
    rpCompSaldoDBTextRUBREPORTADA: TppDBText;
    rpCompSaldoLblPeriodo: TppLabel;
    rpCompSaldoLabel9: TppLabel;
    rpCompSaldoDBText10: TppDBText;
    rpCompSaldoDBText11: TppDBText;
    rpCompSaldoDBText12: TppDBText;
    rpCompSaldoDtlBnd: TppDetailBand;
    rpCompSaldoDBText8: TppDBText;
    rpCompSaldoDBText9: TppDBText;
    rpCompSaldoFootBnd: TppFooterBand;
    ppGroup6: TppGroup;
    rpCompSaldoGrpHdrBnd1: TppGroupHeaderBand;
    rpCompSaldoGrpFootBnd3: TppGroupFooterBand;
    rpCompSaldoSubReport1: TppSubReport;
    rpCompSaldoChildReport1: TppChildReport;
    rpCompSaldoSubReport1HdrBnd: TppHeaderBand;
    rpCompSaldoSubReport1Label1: TppLabel;
    rpCompSaldoSubReport1DBText1: TppDBText;
    rpCompSaldoSubReport1DBText2: TppDBText;
    rpCompSaldoSubReport1DBText3: TppDBText;
    rpCompSaldoSubReport1DBText4: TppDBText;
    rpCompSaldoSubReport1Label2: TppLabel;
    rpCompSaldoSubReport1Label3: TppLabel;
    rpCompSaldoSubReport1Label5: TppLabel;
    rpCompSaldoSubReport1Line1: TppLine;
    rpCompSaldoSubReport1Label4: TppLabel;
    rpCompSaldoSubReport1DBText6: TppDBText;
    rpCompSaldoSubReport1Label6: TppLabel;
    rpCompSaldoSubReport1DBText7: TppDBText;
    rpCompSaldoSubReport1DBText8: TppDBText;
    rpCompSaldoSubReport1Calc2: TppSystemVariable;
    rpCompSaldoSubReport1Calc1: TppSystemVariable;
    rpCompSaldoSubReport1DtlBnd: TppDetailBand;
    rpCompSaldoSubReport1SmryBnd: TppSummaryBand;
    rpCompSaldoSubReport1Label7: TppLabel;
    rpCompSaldoSubReport1DBCalc3: TppDBCalc;
    rpCompSaldoSubReport1Line2: TppLine;
    rpCompSaldoSubReport1Line3: TppLine;
    rpCompSaldoChildReport1Group1: TppGroup;
    rpCompSaldoSubReport1GrpHdrBnd: TppGroupHeaderBand;
    rpCompSaldoSubReport1GrpFootBnd: TppGroupFooterBand;
    rpCompSaldoSubReport1DBText5: TppDBText;
    rpCompSaldoSubReport1DBCalc1: TppDBCalc;
    ppGroup7: TppGroup;
    rpCompSaldoGrpHdrBnd2: TppGroupHeaderBand;
    rpCompSaldoGrpFootBnd2: TppGroupFooterBand;
    rpCompSaldoLabel7: TppLabel;
    rpCompSaldoDBCalcVALOR_RUB_REPORTADA2: TppDBCalc;
    ppGroup8: TppGroup;
    rpCompSaldoGrpHdrBnd3: TppGroupHeaderBand;
    rpCompSaldoDBText5: TppDBText;
    rpCompSaldoDBText6: TppDBText;
    rpCompSaldoDBText7: TppDBText;
    rpCompSaldoGrpFootBnd1: TppGroupFooterBand;
    rpCompSaldoLine3: TppLine;
    rpCompSaldoLine2: TppLine;
    rpCompSaldoLabel6: TppLabel;
    rpCompSaldoDBCalcVALOR_RUB_REPORTADA1: TppDBCalc;
    ppCompSaldo: TppBDEPipeline;
    ppCompSaldoppField1: TppField;
    ppCompSaldoppField2: TppField;
    ppCompSaldoppField3: TppField;
    ppCompSaldoppField4: TppField;
    ppCompSaldoppField5: TppField;
    ppCompSaldoppField6: TppField;
    ppCompSaldoppField7: TppField;
    ppCompSaldoppField8: TppField;
    ppCompSaldoppField9: TppField;
    ppCompSaldoppField10: TppField;
    ppCompSaldoppField11: TppField;
    ppCompSaldoppField12: TppField;
    ppCompSaldoppField13: TppField;
    dsCompSaldo: TwwDataSource;
    ppCompSaldoSub: TppBDEPipeline;
    ppCompSaldoSubppField1: TppField;
    ppCompSaldoSubppField2: TppField;
    ppCompSaldoSubppField3: TppField;
    ppCompSaldoSubppField4: TppField;
    ppCompSaldoSubppField5: TppField;
    dsCompSaldoSub: TwwDataSource;
    sqlCompSaldo: TCMSqlParams;
    CdsCompSaldo: TCMClientDataSet;
    CdsCompSaldoSub: TCMClientDataSet;
    sqlCompSaldoSub: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsCompSaldoAfterScroll(DataSet: TDataSet);
    procedure rpCompSaldoFootBndAfterPrint(Sender: TObject);
    procedure rpCompSaldoSubReport1Print(Sender: TObject);
  private
    sAnoMesIni, sAnoMesFin: string;
    
    procedure SelDetalhes;
  end;

var
  RptCompSaldo: TRptCompSaldo;

implementation

uses fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptCompSaldo.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpCompSaldoDBText2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpCompSaldoDBText3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpCompSaldoDBText4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;

  sAnoMesIni := FU.RetornaAnoMes(CmpRptCM.ParamByName('DataIni').asDateTime);
  sAnoMesFin := FU.RetornaAnoMes(CmpRptCM.ParamByName('DataFim').asDateTime);

  with (sqlCompSaldo.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ') AS PERIODO_INI,');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ') AS PERIODO_FIN,');
    Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGCCPF,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  F.MATRICULA,');
    Add('  RTRIM(PF.NOME) AS FUNCIONARIO,');
    Add('  (SUBSTR(RUBREPORTADA.MES,6,2)||''/''||SUBSTR(RUBREPORTADA.MES,1,4)) AS MES_RUBRICA,');
    Add('  RUBREPORTADA.MES,');
    Add('  (RUBREPORTADA.DESCRICAO) AS NOME_RUB_REPORTADA,');
    Add('  (RUBREPORTADA.VALOR)     AS VALOR_RUB_REPORTADA,');
    Add('  (RUBBASE.DESCRICAO)      AS NOME_RUB_BASE,');
    Add('  NVL(RUBBASE.VALOR,0)     AS VALOR_RUB_BASE');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, SITFUNC ST,');
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual do(s) Estabelecimento(s)
    Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal do(s) Estabelecimento(s)
    Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) MUNICIPAL,');
    // -------------------------------------------------------------------------------*/
    // Rubrica base
    Add('  (SELECT H.IDPESSOA, RP.DESCRPROVDESC AS DESCRICAO, H.MES, (H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, RUBRICAXPESS RP');
    Add('   WHERE (H.CODPROVDESC  = '+QuotedStr(CmpRptCM.ParamByName('CodRubBase').asString)+') AND');
    Add('         (RP.CODPROVDESC = '+QuotedStr(CmpRptCM.ParamByName('CodRubBase').asString)+') AND');

    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('         (H.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('         (H.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    Add('         (H.MES       >= ' +QuotedStr(sAnoMesIni)+ ') AND');
    Add('         (H.MES       <= ' +QuotedStr(sAnoMesFin)+ ') AND');
    Add('         (RP.IDRUBRICA = H.IDRUBRICA)) RUBBASE,');
    // ------------------------------------------------------------------------------- //
    // Rubrica reportada
    Add('  (SELECT H.IDPESSOA, RP.DESCRPROVDESC AS DESCRICAO, H.MES, (H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, RUBRICAXPESS RP');
    Add('   WHERE (H.CODPROVDESC  = '+QuotedStr(CmpRptCM.ParamByName('CodRubReportada').asString)+') AND');
    Add('         (RP.CODPROVDESC = '+QuotedStr(CmpRptCM.ParamByName('CodRubReportada').asString)+') AND');

    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('         (H.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('         (H.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    Add('         (H.MES       >= ' +QuotedStr(sAnoMesIni)+ ') AND');
    Add('         (H.MES       <= ' +QuotedStr(sAnoMesFin)+ ') AND');
    Add('         (RP.IDRUBRICA = H.IDRUBRICA)) RUBREPORTADA');
    // ------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
      begin
        Add('  (PF.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
        Add('  (F.IDPESSOA  IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
      end
      else
      begin
        Add('  (PF.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
        Add('  (F.IDPESSOA   = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
      end;
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (CmpRptCM.ParamByName('ListaSitFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaSitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT       IN (' +FU.QuotedListaString(CmpRptCM.ParamByName('ListaSitFunc').asString,',')+ ')) AND')
        else
          Add('  (ST.TIPOSIT        = ' +FU.QuotedListaString(CmpRptCM.ParamByName('ListaSitFunc').asString,',')+ ') AND');

      if (CmpRptCM.ParamByName('ListaTipoContrato').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaTipoContrato').asString) > 0) then
          Add('  (F.TIPOCONTRATO   IN (' +FU.QuotedListaString(CmpRptCM.ParamByName('ListaTipoContrato').asString,',')+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO    = ' +FU.QuotedListaString(CmpRptCM.ParamByName('ListaTipoContrato').asString,',')+ ') AND');
    end;

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = RUBREPORTADA.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = RUBBASE.IDPESSOA) AND');
    Add('  (RUBREPORTADA.MES  = RUBBASE.MES) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)  AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  EMPRESA, FUNCIONARIO, MES');
      1 : Add('  EMPRESA, MATRICULA, MES');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  frmAguarde.Mostra('Composição de Saldo');
  frmAguarde.Pos := 0;

  sqlCompSaldo.Open;
  SelDetalhes;
  frmAguarde.Max := CdsCompSaldo.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptCompSaldo.CdsCompSaldoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCompSaldo.rpCompSaldoSubReport1Print(Sender: TObject);
begin
  CdsCompSaldoSub.Filter := 'EMPRESA = ' +QuotedStr(CdsCompSaldo.FieldByName('EMPRESA').asString);
end;

procedure TRptCompSaldo.rpCompSaldoFootBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptCompSaldo.SelDetalhes;
begin
  with (sqlCompSaldoSub.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RUBREPORTADA.MES,');
    Add('  (DECODE(TO_NUMBER(SUBSTR(RUBREPORTADA.MES,6,2)),1,''Janeiro'',2,''Fevereiro'',3,''Março'',4,''Abril'',');
    Add('     5,''Maio'',6,''Junho'',7,''Julho'',8,''Agosto'',9,''Setembro'',10,''Outubro'',');
    Add('     11,''Novembro'',12,''Dezembro'')||''/''||SUBSTR(RUBREPORTADA.MES,1,4)) AS MES_RUBRICA,');
    Add('  (RUBREPORTADA.DESCRICAO) AS NOME_RUB_REPORTADA,');
    Add('  (RUBREPORTADA.VALOR) AS VALOR_RUB_REPORTADA');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, SITFUNC ST,');
    // ------------------------------------------------------------------------------- //
    // Rubricas reportadas
    Add('  (SELECT H.IDPESSOA, RP.DESCRPROVDESC AS DESCRICAO, H.MES, (H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, RUBRICAXPESS RP');
    Add('   WHERE (H.CODPROVDESC  = '+QuotedStr(CmpRptCM.ParamByName('CodRubReportada').asString)+') AND');
    Add('         (RP.CODPROVDESC = '+QuotedStr(CmpRptCM.ParamByName('CodRubReportada').asString)+') AND');

    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('         (H.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('         (H.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    Add('         (H.MES       >= ' +QuotedStr(sAnoMesIni)+ ') AND');
    Add('         (H.MES       <= ' +QuotedStr(sAnoMesFin)+ ') AND');
    Add('         (RP.IDRUBRICA = H.IDRUBRICA)) RUBREPORTADA');
    // ------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
      begin
        Add('  (PF.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
        Add('  (F.IDPESSOA  IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
      end
      else
      begin
        Add('  (PF.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
        Add('  (F.IDPESSOA   = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
      end;
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (CmpRptCM.ParamByName('ListaSitFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaSitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT  IN (' +FU.QuotedListaString(CmpRptCM.ParamByName('ListaSitFunc').asString,',')+ ')) AND')
        else
          Add('  (ST.TIPOSIT   = ' +FU.QuotedListaString(CmpRptCM.ParamByName('ListaSitFunc').asString,',')+ ') AND');

      if (CmpRptCM.ParamByName('ListaTipoContrato').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('ListaTipoContrato').asString) > 0) then
          Add('  (F.TIPOCONTRATO IN (' +FU.QuotedListaString(CmpRptCM.ParamByName('ListaTipoContrato').asString,',')+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO = ' +FU.QuotedListaString(CmpRptCM.ParamByName('ListaTipoContrato').asString,',')+ ') AND');
    end;

    Add('  (ST.IDSITFUNC = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA  = F.IDESTAB) AND');
    Add('  (F.IDPESSOA   = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA   = RUBREPORTADA.IDPESSOA)');
    Add('ORDER BY');
    Add('  EMPRESA, MES');
    //SaveToFile('c:\qry1.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry1.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlCompSaldoSub.Open;
  CdsCompSaldoSub.Filtered := true;
end;

end.
