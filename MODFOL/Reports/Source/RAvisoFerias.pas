// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RAvisoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, TXComp,
  uCmRptManager, CmParamReport, Db, ppDB, ppDBPipe, ppDBBDE, ppBands, ppVar, ppStrtch, ppMemo,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, TXRB;

type
  TRptAvisoFerias = class(TFrmCmReport)
    rpAvisoFerias: TppReport;
    ppDetailBand24: TppDetailBand;
    AvisoFeriasLbl9: TppLabel;
    AvisoFeriasShp3: TppShape;
    AvisoFeriasShp1: TppShape;
    AvisoFeriasDbTxt2: TppDBText;
    AvisoFeriasDbTxt1: TppDBText;
    AvisoFeriasDbTxt3: TppDBText;
    AvisoFeriasDbTxt4: TppDBText;
    AvisoFeriasLbl1: TppLabel;
    AvisoFeriasLbl2: TppLabel;
    AvisoFeriasShp2: TppShape;
    AvisoFeriasMem1: TppMemo;
    AvisoFeriasMem2: TppMemo;
    AvisoFeriasMem5: TppMemo;
    AvisoFeriasLbl3: TppLabel;
    AvisoFeriasDbTxt5: TppDBText;
    AvisoFeriasLbl6: TppLabel;
    AvisoFeriasDbTxt9: TppDBText;
    AvisoFeriasLbl4: TppLabel;
    AvisoFeriasDbTxt6: TppDBText;
    AvisoFeriasLbl7: TppLabel;
    AvisoFeriasDbTxt10: TppDBText;
    AvisoFeriasLbl5: TppLabel;
    AvisoFeriasDbTxt7: TppDBText;
    AvisoFeriasDbTxt8: TppDBText;
    AvisoFeriasMem3: TppMemo;
    AvisoFeriasMem4: TppMemo;
    AvisoFeriasMem7: TppMemo;
    AvisoFeriasMem9: TppMemo;
    AvisoFeriasLbl10: TppLabel;
    rpAvisoFeriasShape2: TppShape;
    rpAvisoFeriasShape3: TppShape;
    rpAvisoFeriasShape4: TppShape;
    rpAvisoFeriasShape5: TppShape;
    AvisoFeriasLbl8: TppLabel;
    AvisoFeriasLbl11: TppLabel;
    AvisoFeriasLbl12: TppLabel;
    AvisoFeriasLbl13: TppLabel;
    AvisoFeriasLbl14: TppLabel;
    AvisoFeriasLbl15: TppLabel;
    AvisoFeriasLbl16: TppLabel;
    AvisoFeriasLbl17: TppLabel;
    rpAvisoFeriasSysVar1: TppSystemVariable;
    rpAvisoFeriasFooterBand1: TppFooterBand;
    ppAvisoFerias: TppBDEPipeline;
    dsAvisoFerias: TDataSource;
    sqlAvisoFerias: TCMSqlParams;
    CdsAvisoFerias: TCMClientDataSet;
    rpAvisoFeriasSmryBnd: TppSummaryBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsAvisoFeriasAfterOpen(DataSet: TDataSet);
    procedure CdsAvisoFeriasAfterScroll(DataSet: TDataSet);
    procedure rpAvisoFeriasSmryBndAfterPrint(Sender: TObject);
    procedure AvisoFeriasDbTxt9Print(Sender: TObject);
  private
    procedure GravaDadosQuery;
  end;

var
  RptAvisoFerias: TRptAvisoFerias;

implementation

uses fAguarde, dCds, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptAvisoFerias.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Monta Query Auxiliar
  with (dmCds.SQL.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
    Add('    :MUNICIPAL1 || MUNICIPAL.NUMDOCUMENTO),');
    Add('    :ESTADUAL1 || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME), NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    :CEP || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  F.MATRICULA,');
    Add('  DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) AS CODCENTROCUSTO,');
    Add('  RTRIM(CC.NOME) AS C_CUSTO,');
    Add('  C.TITULO AS CARGO,');
    Add('  :CNPJ || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(CTPS.NUM) AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,'''','''',''/''||CTPS.UF) AS CTPS_UF,');
    Add('  CTPS.MASCARA AS MASCARA_CTPS,');
    Add('  ANT13.MES, ANT13.ANO, ANT13.FLGOCORRIDA,');
    Add('  FERIAS.FLGABONO,');
    Add('  FERIAS.QTDPARCDEVOL,');
    Add('  FERIAS.INIPERIODOFERIAS,');
    Add('  FERIAS.INIGOZOFERIAS,');
    Add('  FERIAS.FIMGOZOFERIAS');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, CENTCUST CC, CARGO C,');
    Add('  CIDADES, ESTADO ES, FERIAS,');
    // Última evolução Funcional do Funcionário
    // --------------------------------------------------------------------------------------
    Add('  (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE');
    Add('            (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(CmpRptCM.ParamByName('InicioFerias').asString)+
          ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST2,');
    Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE');
    Add('            (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(CmpRptCM.ParamByName('InicioFerias').asString)+
          ',''DD/MM/YYYY''))');
    Add('             GROUP BY IDPESSOA) HST3');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
    Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
    Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT DP.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = :CTPS) AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPAIS          = ES.IDPAIS) AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // Antecipação 13
    Add('  (SELECT IDPESSOA, MES, ANO, FLGOCORRIDA');
    Add('   FROM   ANTECIP13 ');
    Add('   WHERE (ANO = SUBSTR('+QuotedStr(
      CmpRptCM.ParamByName('InicioFerias').asString)+',7,4))) ANT13,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = :ESTADUAL2) AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = :MUNICIPAL2) AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA          IN ('+CmpRptCM.ParamByName('ListaIdEstab').asString+')) AND');
    Add('  (FERIAS.FLGOCORRIDA    = 0) AND');
    Add('  (FERIAS.INIGOZOFERIAS BETWEEN TO_DATE('+QuotedStr(
      CmpRptCM.ParamByName('InicioFerias').asString)+',''DD/MM/YYYY'') AND '+
      'TO_DATE('+QuotedStr(CmpRptCM.ParamByName('FinalFerias').asString)+
      ',''DD/MM/YYYY'')) AND');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO))  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
    end;

    Add('  (FERIAS.IDPESSOA   = F.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA) AND');
    Add('  (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = C.IDCARGO) AND');
    Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDEMPRESA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = ANT13.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = HST.IDPESSOA(+)) AND');
    Add('  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)  = CC.CODCENTROCUSTO)');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  EMPRESA, EMPREGADO, MATRICULA');
      1 : Add('  EMPRESA, MATRICULA, EMPREGADO');
      2 : Add('  EMPRESA, CODCENTROCUSTO, EMPREGADO');
      3 : Add('  EMPRESA, CODCENTROCUSTO, MATRICULA');
      4 : Add('  EMPRESA, CODCENTROCUSTO, INIGOZOFERIAS, EMPREGADO');
      5 : Add('  EMPRESA, CODCENTROCUSTO, INIGOZOFERIAS, MATRICULA');
      6 : Add('  INIGOZOFERIAS, EMPRESA, EMPREGADO');
      7 : Add('  INIGOZOFERIAS, EMPRESA, MATRICULA');
      8 : Add('  INIGOZOFERIAS, EMPRESA, CODCENTROCUSTO, EMPREGADO');
      9 : Add('  INIGOZOFERIAS, EMPRESA, CODCENTROCUSTO, MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    //SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.SQL.Prepare;
  dmCds.SQL.ParamByName('MUNICIPAL1').asString := 'Inscrição Municipal: ';
  dmCds.SQL.ParamByName('ESTADUAL1').asString := 'Inscrição Estadual: ';
  dmCds.SQL.ParamByName('CEP').asString := ' - CEP: ';
  dmCds.SQL.ParamByName('CNPJ').asString := 'CNPJ: ';
  dmCds.SQL.ParamByName('CTPS').asString := 'CTPS:';
  dmCds.SQL.ParamByName('MUNICIPAL2').asString := 'ESTADUAL:';
  dmCds.SQL.ParamByName('ESTADUAL2').asString := 'MUNICIPAL:';
  dmCds.SQL.Open;

  // Monta Query Principal
  GravaDadosQuery;
  CdsAvisoFerias.First;
end;

procedure TRptAvisoFerias.GravaDadosQuery;
var
  dtPerAquiFinal: TDate;
begin
  sqlAvisoFerias.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    repeat
      CdsAvisoFerias.Insert;
      CdsAvisoFerias.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsAvisoFerias.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsAvisoFerias.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('C_CUSTO').asString;
      CdsAvisoFerias.FieldByName('CARGO').asString := dmCds.Cds.FieldByName('CARGO').asString;
      CdsAvisoFerias.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
      CdsAvisoFerias.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;
      CdsAvisoFerias.FieldByName('INSCRICAO').asString := dmCds.Cds.FieldByName('ESTADUALMUNICIPAL').asString;
      CdsAvisoFerias.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
      CdsAvisoFerias.FieldByName('UF').asString := dmCds.Cds.FieldByName('UF').asString;
      CdsAvisoFerias.FieldByName('INIPERIODOFERIAS').asString := dmCds.Cds.FieldByName('INIPERIODOFERIAS').asString;
      CdsAvisoFerias.FieldByName('QTDPARCDEVOL').asInteger := dmCds.Cds.FieldByName('QTDPARCDEVOL').asInteger;
      CdsAvisoFerias.FieldByName('INIGOZOFERIAS').asString := dmCds.Cds.FieldByName('INIGOZOFERIAS').asString;
      CdsAvisoFerias.FieldByName('FIMGOZOFERIAS').asString := dmCds.Cds.FieldByName('FIMGOZOFERIAS').asString;
      CdsAvisoFerias.FieldByName('FLGABONO').asInteger := dmCds.Cds.FieldByName('FLGABONO').asInteger;
      CdsAvisoFerias.FieldByName('CTPS_NUM').asString := dmCds.Cds.FieldByName('CTPS_NUM').asString;
      CdsAvisoFerias.FieldByName('CTPS_UF').asString := dmCds.Cds.FieldByName('CTPS_UF').asString;

      CdsAvisoFerias.FieldByName('DIASDEFERIAS').asInteger :=
        (dmCds.Cds.FieldByName('FIMGOZOFERIAS').Value -
         dmCds.Cds.FieldByName('INIGOZOFERIAS').Value + 1);
      dtPerAquiFinal := StrToDate(FU.IncData(
        dmCds.Cds.FieldByName('INIPERIODOFERIAS').asString,0,0,1))-1;

      if (dmCds.Cds.FieldByName('ANO').asInteger > 0) then
        CdsAvisoFerias.FieldByName('ANTECIPACAO13').asString :=
          LongMonthNames[dmCds.Cds.FieldByName('MES').asInteger] + ' de ' +
          dmCds.Cds.FieldByName('ANO').asString +
          FU.IFF(dmCds.Cds.FieldByName('FLGOCORRIDA').asInteger=1,' (Já Concedida)',' ')
      else
        CdsAvisoFerias.FieldByName('ANTECIPACAO13').asString := 'Não Programada';

      if (dtPerAquiFinal >= dmCds.Cds.FieldByName('INIGOZOFERIAS').asDateTime) then
        CdsAvisoFerias.FieldByName('FIMPERIODOFERIAS').asString :=
          DateToStr(dmCds.Cds.FieldByName('INIGOZOFERIAS').asDateTime-1)
      else
        CdsAvisoFerias.FieldByName('FIMPERIODOFERIAS').asString := DateToStr(dtPerAquiFinal);

      CdsAvisoFerias.Post;

      dmCds.Cds.Next;
    until (dmCds.Cds.EOF);

    if (Trim(dmCds.Cds.FieldByName('MASCARA_CTPS').asString) <> '') then
      AvisoFeriasDbTxt7.DisplayFormat :=
        dmCds.Cds.FieldByName('MASCARA_CTPS').asString+';0;_';
  end
  else
  begin
    CdsAvisoFerias.Insert;
    CdsAvisoFerias.Post;
  end;
end;

procedure TRptAvisoFerias.CdsAvisoFeriasAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptAvisoFerias.CdsAvisoFeriasAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptAvisoFerias.AvisoFeriasDbTxt9Print(Sender: TObject);
begin
  AvisoFeriasLbl8.Visible := (CdsAvisoFerias.FieldByName('FLGABONO').asInteger = 1);
  AvisoFeriasMem7.Visible := AvisoFeriasLbl8.Visible;

  AvisoFeriasLbl9.Caption := 'Parcelamento da devolução do adiantamento de férias em '+
    CdsAvisoFerias.FieldByName('QTDPARCDEVOL').asString +' vez(es)';

  AvisoFeriasLbl11.Caption := 'Período aquisitivo de '+
    CdsAvisoFerias.FieldByName('INIPERIODOFERIAS').asString +
    ' a '+ CdsAvisoFerias.FieldByName('FIMPERIODOFERIAS').asString;

  AvisoFeriasLbl12.Caption := 'Dias de duração: '+
    CdsAvisoFerias.FieldByName('DIASDEFERIAS').asString;

  AvisoFeriasLbl13.Caption := 'Período de gozo de '+
    CdsAvisoFerias.FieldByName('INIGOZOFERIAS').asString +
    ' a '+ CdsAvisoFerias.FieldByName('FIMGOZOFERIAS').asString;
end;

procedure TRptAvisoFerias.rpAvisoFeriasSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
