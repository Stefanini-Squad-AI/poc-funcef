unit RCadDependenteAnal;

//***************************************************************************************
//Rotina:
//Nº SOL:            127621
//Nº KINTANA         678085
//Data da Alteração: 02/03/2010
//Responsável:       Ricardo A.
//Descrição:         Criação do Relatório "Relação de Dependentes Analítico"
//**************************************************************************************

interface

uses
  Classes, Controls, Forms, FCmReport, CmParamReport, ppParameter,
  ppCtrls, ppBands, ppClass, ppVar, ppReport, Db, uCMClientDataSet, uCmSqlParams,
  ppDBBDE, ppDB, DBClient, ppDBPipe, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, uCmRptManager, TXComp, TXRB, DBTables, Wwquery, Wwdatsrc;

type
  TRptCadDependenteAnal = class(TFrmCmReport)
    rpCadDependenteAnal: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppDBText17: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText18: TppDBText;
    ppLabel14: TppLabel;
    ppLabel10: TppLabel;
    ppLabel20: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine3: TppLine;
    ppLabel19: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppParameterList2: TppParameterList;
    ppCadDependente: TppBDEPipeline;
    sqlCadDependente: TCMSqlParams;
    CdsCadDependente: TCMClientDataSet;
    dsCadDependente: TDataSource;
    ppDBText19: TppDBText;
    ppLabel69: TppLabel;
    rpRelPensAlimDBText1: TppDBText;
    rpRelPensAlimDBImage1: TppDBImage;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField1: TppField;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField5: TppField;
    ppFundacaoppField6: TppField;
    ppFundacaoppField7: TppField;
    ppFundacaoppField8: TppField;
    ppFundacaoppField9: TppField;
    ppFundacaoppField10: TppField;
    ppFundacaoppField11: TppField;
    ppFundacaoppField12: TppField;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    rpBenConcedDBText3: TppDBText;
    rpBenConcedDBText4: TppDBText;
    ppDBText1: TppDBText;
    qryFundacaoBLOCO1: TStringField;
    qryFundacaoBLOCO2: TMemoField;
    qryFundacaoCNPJ: TStringField;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    ppLabel2: TppLabel;
    ppLine4: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsCadDependenteAfterOpen(DataSet: TDataSet);
    procedure CdsCadDependenteAfterScroll(DataSet: TDataSet);
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCadDependenteAnal: TRptCadDependenteAnal;

implementation

uses
  fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptCadDependenteAnal.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

  qryFundacao.Open;

  sqlCadDependente.SQL.Clear;
  sqlCadDependente.SQL.Add('SELECT');
  sqlCadDependente.SQL.Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB, F.IDESTAB,');
  sqlCadDependente.SQL.Add('  F.MATRICULA,');
  sqlCadDependente.SQL.Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
  sqlCadDependente.SQL.Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
  sqlCadDependente.SQL.Add('    DECODE(RTRIM(E.BAIRRO),NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
  sqlCadDependente.SQL.Add('    DECODE(RTRIM(CIDADES.NOME),NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
  sqlCadDependente.SQL.Add('    '' - CEP: '' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
  sqlCadDependente.SQL.Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
  sqlCadDependente.SQL.Add('  ES.CODESTADO AS UF,');
  sqlCadDependente.SQL.Add('  UPPER(PF.NOME) AS EMPREGADO,');
  sqlCadDependente.SQL.Add('  PFD.NOME AS DEPENDENTE, PEFISD.DATANASC,');
  sqlCadDependente.SQL.Add('  DP.DESCRICAO AS DEPENDENCIA,');
  sqlCadDependente.SQL.Add('  PEFIS.DATANASC AS DATANASC_TITTULAR,');
  sqlCadDependente.SQL.Add('  CC.NOME AS NOMECTCUSTO ');
  sqlCadDependente.SQL.Add('FROM');
  sqlCadDependente.SQL.Add('  PESSOA PJ, PESSOA PF, PESSOA PFD, PESSOAFISICA PEFIS, PESSOAFISICA PEFISD,');
  sqlCadDependente.SQL.Add('  ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, DEPENTIT DT, DEPEN DP, SITFUNC ST,');
  sqlCadDependente.SQL.Add('  CENTCUST CC ');
  sqlCadDependente.SQL.Add('WHERE');
  sqlCadDependente.SQL.Add('  (PJ.IDPESSOA        IN ('+CmpRptCM.ParamByName('ListaIdEstab').asString+')) AND');
  sqlCadDependente.SQL.Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');

  // Funcionário(s) selecionado(s)
  if ( CmpRptCM.ParamByName('CodFuncSel').asString <> '' ) then
  begin
    if ( Pos( ',', CmpRptCM.ParamByName('CodFuncSel').asString ) > 0 ) then
      sqlCadDependente.SQL.Add('  (F.IDPESSOA         IN (' + CmpRptCM.ParamByName('CodFuncSel').asString+ ')) AND')
    else
      sqlCadDependente.SQL.Add('  (F.IDPESSOA          = ' + CmpRptCM.ParamByName('CodFuncSel').asString+ ') AND');
  end
  else
  begin
    // C. de Custo(s) habilitados para o usuário
    if ( CtrlUsoGeralRH.UsuXCCusto <> '' ) then
    begin
      if ( Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0 ) then
        sqlCadDependente.SQL.Add('  (F.CODCENTROCUSTO   IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
      else
        sqlCadDependente.SQL.Add('  (F.CODCENTROCUSTO    = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
    end;

    if ( CmpRptCM.ParamByName('SitFunc').asString <> '' ) then
      if ( Pos( ',',CmpRptCM.ParamByName('SitFunc').asString ) > 0 ) then
        sqlCadDependente.SQL.Add('  (ST.TIPOSIT         IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
      else
        sqlCadDependente.SQL.Add('  (ST.TIPOSIT          = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

    if ( Pos( ',',CmpRptCM.ParamByName('TipoContrato').asString ) > 0 ) then
      sqlCadDependente.SQL.Add('  (F.TIPOCONTRATO     IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
    else
      sqlCadDependente.SQL.Add('  (F.TIPOCONTRATO      = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
  end;

  if ( CmpRptCM.ParamByName('CodTipoDependSel').asString = '' ) then
  begin
    sqlCadDependente.SQL.Add('  (DT.IDDEPENDENCIA   <> ''PRP'') AND');
    sqlCadDependente.SQL.Add('  (DT.FLGCONTAIMPOSTOR = 1) AND');
  end
  else
  if (Pos(',',CmpRptCM.ParamByName('CodTipoDependSel').asString) > 0) then
    sqlCadDependente.SQL.Add('  (DT.IDDEPENDENCIA   IN (' +CmpRptCM.ParamByName('CodTipoDependSel').asString+ ')) AND')
  else
    sqlCadDependente.SQL.Add('  (DT.IDDEPENDENCIA    = ' +CmpRptCM.ParamByName('CodTipoDependSel').asString+ ') AND');

  sqlCadDependente.SQL.Add('  (F.IDSITFUNC         = ST.IDSITFUNC) AND');
  sqlCadDependente.SQL.Add('  (F.IDPESSOA          = PF.IDPESSOA) AND');
  sqlCadDependente.SQL.Add('  (F.IDPESSOA          = PEFIS.IDPESSOA) AND');
  sqlCadDependente.SQL.Add('  (F.IDPESSOA          = DT.IDTITULAR) AND');
  sqlCadDependente.SQL.Add('  (DT.IDPESSOA         = PFD.IDPESSOA) AND');
  sqlCadDependente.SQL.Add('  (PFD.IDPESSOA        = PEFISD.IDPESSOA) AND');

  if ( Pos( ',', CmpRptCM.ParamByName( 'SexoTitular' ).asString ) > 0 ) then
    sqlCadDependente.SQL.Add('  (PEFIS.SEXO         IN ('+CmpRptCM.ParamByName('SexoTitular').asString+')) AND')
  else
    sqlCadDependente.SQL.Add('  (PEFIS.SEXO          = '+CmpRptCM.ParamByName('SexoTitular').asString+') AND');

  if ( Pos( ',', CmpRptCM.ParamByName( 'SexoDependente' ).asString ) > 0 ) then
    sqlCadDependente.SQL.Add('  (PEFISD.SEXO        IN ('+CmpRptCM.ParamByName('SexoDependente').asString+')) AND')
  else
    sqlCadDependente.SQL.Add('  (PEFISD.SEXO         = '+CmpRptCM.ParamByName('SexoDependente').asString+') AND');

  if ( CmpRptCM.ParamByName( 'FaixaEtariaIni' ).asInteger > 0 ) then  //Faixa Etária Inicial
    sqlCadDependente.SQL.Add('  (TRUNC((SYSDATE - 1 - PEFISD.DATANASC)/365.25) >= ' +
      CmpRptCM.ParamByName('FaixaEtariaIni').asString+ ') AND');

  if ( CmpRptCM.ParamByName( 'FaixaEtariaFin' ).asInteger < 99 ) then  //Faixa Etária Final
    sqlCadDependente.SQL.Add('  (TRUNC((SYSDATE - 1 - PEFISD.DATANASC)/365.25) <= ' +
      CmpRptCM.ParamByName('FaixaEtariaFin').asString+ ') AND');

  sqlCadDependente.SQL.Add('  (DT.IDDEPENDENCIA    = DP.IDDEPENDENCIA) AND');
  sqlCadDependente.SQL.Add('  (PJ.IDPESSOA         = F.IDESTAB) AND');
  sqlCadDependente.SQL.Add('  (PJ.IDPESSOA         = E.IDPESSOA) AND');
  sqlCadDependente.SQL.Add('  (PJ.IDENDCOMERCIAL   = E.IDENDERECO) AND');
  sqlCadDependente.SQL.Add('  (E.IDCIDADES         = CIDADES.IDCIDADES) AND');
  sqlCadDependente.SQL.Add('  (CIDADES.IDESTADO    = ES.IDESTADO)');
  sqlCadDependente.SQL.Add('ORDER BY');
  case ( CmpRptCM.ParamByName( 'Ordenacao' ).asInteger ) of
    0 : sqlCadDependente.SQL.Add('  F.IDESTAB, EMPREGADO');
    1 : sqlCadDependente.SQL.Add('  F.IDESTAB, MATRICULA');
  end;
//  sqlCadDependente.SQL.SaveToFile('c:\qry.sql');

  sqlCadDependente.Open;
end;

procedure TRptCadDependenteAnal.CdsCadDependenteAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptCadDependenteAnal.CdsCadDependenteAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCadDependenteAnal.ppSummaryBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
