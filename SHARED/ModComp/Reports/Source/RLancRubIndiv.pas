// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RLancRubIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, TXRB, usistema;

type
  TRptLancRubIndiv = class(TFrmCmReport)
    rpLancRubIndiv: TppReport;
    rpLancRubIndivHdrBnd: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText3: TppDBText;
    ppLancRubIndivDBTextCGC: TppDBText;
    ppDBText7: TppDBText;
    ppLancRubIndivDBTextEnder: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine2: TppLine;
    ppLabel21: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    rpLancRubIndivLabel1: TppLabel;
    rpLancRubIndivLabel2: TppLabel;
    rpLancRubIndivLabel3: TppLabel;
    rpLancRubIndivLabel4: TppLabel;
    rpLancRubIndivLabel5: TppLabel;
    rpLancRubIndivLabel6: TppLabel;
    rpLancRubIndivLine1: TppLine;
    ppCalc4: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    rpLancRubIndivDtlBnd: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    rpLancRubIndivDBText1: TppDBText;
    rpLancRubIndivDBText2: TppDBText;
    rpLancRubIndivDBText3: TppDBText;
    rpLancRubIndivDBText4: TppDBText;
    rpLancRubIndivDBText5: TppDBText;
    rpLancRubIndivFootBnd: TppFooterBand;
    rpLancRubIndivSmryBnd: TppSummaryBand;
    ppGroup1: TppGroup;
    rpLancRubIndivGrpHdrBnd0: TppGroupHeaderBand;
    rpLancRubIndivGrpFootBnd0: TppGroupFooterBand;
    ppLine4: TppLine;
    ppLabel22: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLancRubIndiv: TppBDEPipeline;
    dsLancRubIndiv: TDataSource;
    sqlLancRubIndiv: TCMSqlParams;
    CdsLancRubIndiv: TCMClientDataSet;
    ppLabel1: TppLabel;
    ppDBCalc2: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsLancRubIndivAfterScroll(DataSet: TDataSet);
    procedure rpLancRubIndivSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptLancRubIndiv: TRptLancRubIndiv;

implementation

uses dCds, uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptLancRubIndiv.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: integer;
begin
  inherited;
  // Documentos
  with (dmCds.sql) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;
  DocID := dmCds.Cds.FieldByName('IDDOCUMENTO').asInteger;

  inherited;
  ppLancRubIndivDBTextCGC.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  ppLancRubIndivDBTextEnder.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  
  with (sqlLancRubIndiv.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  CGC.NUM AS CGC,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,'' '','' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    // Dados da Rubrica
    Add('  SUBSTR(RI.ANOMESINICIO,6,2) ||''/''|| SUBSTR(RI.ANOMESINICIO,1,4) ANOMES,');
    Add('  RI.ANOMESINICIO,');
    Add('  RP.CODPROVDESC AS CODIGORUBRICA,');
    Add('  RP.DESCRPROVDESC AS NOMERUBRICA,');
    Add('  RI.VALORRUBRICA AS VALORLANCADO,');
    Add('  DECODE(RI.FLGPERMANENTE,1,''Sim'',''Não'') AS PERMANENTE,');
    Add('  DECODE(RI.FLGPERMANENTE,0,RI.NUMOCORRENCIAS,'''') AS OCORRENCIAS,');
    Add('  DECODE(RI.FLGPERMANENTE,0,RI.PARCELAS,'''')  AS PARCELAS,');
    Add('  RI.SEQRUBRICAINDIV AS SEQUENCIA,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS FUNCIONARIO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, RUBRICAXPESS RP, RUBRICAINDIV RI,');
    Add('  PROVDESC PD, FUNCIONARIO F, CIDADES, ESTADO ES, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA,');
    Add('          RTRIM(TDO.SIGLADOCUMENTO ||'' ''|| DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE (DO.IDDOCUMENTO = ' +IntToStr(DocID)+ ') AND');
    Add('         (DO.IDDOCUMENTO = TDO.IDDOCUMENTO) AND');
    Add('         (DO.IDPESSOA    = FP.IDFILIALPESSOA)) CGC');
    // ------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (RP.IDPESSOA  = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

    // Rubrica(s) selecionada(s)
    if (Trim(CmpRptCM.ParamByName('ListaIdRubrica').asString) <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
        Add('  (RP.CODPROVDESC IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
      else
        Add('  (RP.CODPROVDESC  = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
      else
        Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    // Estabelecimento(s) selecionado(s)
    if (Trim(CmpRptCM.ParamByName('ListaIdEstab').asString) <> '') then
      Add('  (PJ.IDPESSOA  IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND')
    else
    begin
      // Estabelecimento(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXFilial <> '') then
        if (Pos(',', CtrlUsoGeralRH.UsuXFilial) > 0) then
          Add('  (PJ.IDPESSOA  IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
        else
          Add('  (PJ.IDPESSOA   = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');
    end;

    // Se selecionou o Mês de Início
    if (CmpRptCM.ParamByName('SelecionaAnoMesRef').asBoolean) then
      Add('  (RI.ANOMESINICIO   = '+QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
        FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+') AND');

    // Inclui Rubricas Permanentes
    if (CmpRptCM.ParamByName('IncluirRubPermanentes').asInteger <> 2) then
      Add('  (RI.FLGPERMANENTE  = '+CmpRptCM.ParamByName('IncluirRubPermanentes').asString+') AND');

    Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA       = CGC.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = RI.IDPESSOA) AND');
    Add('  (RI.IDRUBRICA      = PD.IDPROVENTO) AND');
    Add('  (RI.IDRUBRICA      = RP.IDRUBRICA) AND');
    Add('  (RI.IDPESSOA       = PF.IDPESSOA) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (RI.FLGTPRUBMANUT  = ''2'') AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  RP.CODPROVDESC, F.MATRICULA, RI.ANOMESINICIO, RI.SEQRUBRICAINDIV');
      1 : Add('  RP.CODPROVDESC, FUNCIONARIO, RI.ANOMESINICIO, RI.SEQRUBRICAINDIV');
      2 : Add('  UPPER(NOMERUBRICA), F.MATRICULA, RI.ANOMESINICIO, RI.SEQRUBRICAINDIV');
      3 : Add('  UPPER(NOMERUBRICA), UPPER(FUNCIONARIO), RI.ANOMESINICIO, RI.SEQRUBRICAINDIV');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlLancRubIndiv.Open;

  frmAguarde.Max := CdsLancRubIndiv.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptLancRubIndiv.CdsLancRubIndivAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptLancRubIndiv.rpLancRubIndivSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
