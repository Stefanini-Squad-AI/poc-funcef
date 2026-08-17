unit RAlterFuncional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, FCmReport, DBClient, uCMClientDataSet, uCmSqlParams,
  uCmRptManager, TXComp, CmParamReport;

type
  TRptAlterFuncional = class(TFrmCmReport)
    rpAlterFuncional: TppReport;
    rpAlterFuncionalHdrBnd: TppHeaderBand;
    DestacamentoppLblTitulo: TppLabel;
    DestacamentoppDBTxtEmpresa: TppDBText;
    DestacamentoppDBTxtCPFCGC: TppDBText;
    DestacamentoppDBTxtTipo: TppDBText;
    DestacamentoppDBTxtEndereco: TppDBText;
    rpAlterFuncionalLabel1: TppLabel;
    rpAlterFuncionalLabel2: TppLabel;
    rpDestacamentoLabel1: TppLabel;
    rpDestacamentoDBText1: TppDBText;
    rpCadDependenteLabel5: TppLabel;
    rpCadDependenteDBText1: TppDBText;
    rpGerencialChildReport1Line1: TppLine;
    rpAlterFuncionalLblMatricula: TppLabel;
    rpAlterFuncionalLblNome: TppLabel;
    rpCadDependenteLabel2: TppLabel;
    rpCadDependenteLabel6: TppLabel;
    rpFeriasProgramLabel2: TppLabel;
    rpAlterFuncionalCalc1: TppSystemVariable;
    rpAlterFuncionalCalc2: TppSystemVariable;
    ppLabel23: TppLabel;
    rpAlterFuncinalDtlBand: TppDetailBand;
    rpAlterFuncinalDBMatric: TppDBText;
    rpAlterFuncinalDBNome: TppDBText;
    rpAlterFuncinalDBDataAlt: TppDBText;
    rpAlterFuncinalDBMotivo: TppDBText;
    rpAlterFuncinalDBCargo: TppDBText;
    ppLine6: TppLine;
    rpAlterFuncionalFootBnd: TppFooterBand;
    rpAlterFuncionalSmryBnd: TppSummaryBand;
    rpCadDependenteLabel3: TppLabel;
    rpCadDependenteDBCalc1: TppDBCalc;
    ppAlterFuncional: TppBDEPipeline;
    dsAlterFuncional: TDataSource;
    rpAlterFuncinalDBPerc: TppDBText;
    rpAlterFuncionalSalario: TppDBText;
    rpAlterFuncinalDBCCusto: TppDBText;
    ppLabel1: TppLabel;
    rpAlterFuncinalDBFuncao: TppDBText;
    ppLabel2: TppLabel;
    ppAlterFuncionalGroup: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rpAlterFuncionalGrpFootBnd: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBCalc1: TppDBCalc;
    rpAlterFuncionalLblAlteracao: TppLabel;
    sqlAlterFuncional: TCMSqlParams;
    CdsAlterFuncional: TCMClientDataSet;
    procedure rpAlterFuncionalSmryBndAfterPrint(Sender: TObject);
    procedure rpAlterFuncinalDtlBandBeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsAlterFuncionalAfterScroll(DataSet: TDataSet);
  end;

var
  RptAlterFuncional: TRptAlterFuncional;

implementation

uses fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TRptAlterFuncional.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  DestacamentoppDBTxtCPFCGC.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  DestacamentoppDBTxtTipo.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  DestacamentoppDBTxtEndereco.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;

  with (sqlAlterFuncional.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,'''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME), NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  EF.DATAALTERFUNC, EF.SALARIO, EF.PERC_REAJ, EF.TIPOPAGAMENTO, ');
    Add('  M.DESCRICAO AS MOTIVO, C1.TITULO AS CARGO, ');
    Add('  DECODE(EF.IDFUNCAO,NULL,'''',C2.TITULO) AS FUNCAO, ');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('DataInicial').asString +' / '+
      CmpRptCM.ParamByName('DataFinal').asString)+ ') AS REFERENCIA,');
    Add('  F.MATRICULA,EF.CODCENTROCUSTO,F.IDPESSOA,EF.IDCARGO, EF.IDFUNCAO ');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, CIDADES, ESTADO ES,');
    Add('  SITFUNC ST, EVOLFUNC EF, MOTIVO M, CARGO C1, CARGO C2,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL ');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA          IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (EF.DATAALTERFUNC BETWEEN TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'') AND '+
      'TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+
      ',''DD/MM/YYYY'')) AND');

    if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdTipoFolha').asString) = 0) then
        Add('  (EF.IDMOTIVO  = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND')
      else
        Add('  (EF.IDMOTIVO IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND');
    end;

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) = 0) then
        Add('  (EF.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND')
      else
        Add('  (EF.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
    end
    else
    begin
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
      begin
        if (Pos(',',CmpRptCM.ParamByName('ListaCodCCusto').asString) = 0) then
          Add('  (EF.CODCENTROCUSTO  = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND')
        else
          Add('  (EF.CODCENTROCUSTO IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        begin
          if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) = 0) then
            Add('  (EF.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
          else
            Add('  (EF.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;
      end;

      if (Pos(',',CmpRptCM.ParamByName('SitFunc').asString) = 0) then
        Add('  (ST.TIPOSIT        = ' +FU.QuotedListaString(CmpRptCM.ParamByName('SitFunc').asString, ',')+ ') AND')
      else
        Add('  (ST.TIPOSIT       IN (' +FU.QuotedListaString(CmpRptCM.ParamByName('SitFunc').asString, ',')+ ')) AND');

      if (Pos(',',CmpRptCM.ParamByName('TipoContrato').asString) = 0) then
        Add('  (F.TIPOCONTRATO    = ' +FU.QuotedListaString(CmpRptCM.ParamByName('TipoContrato').asString, ',')+ ') AND')
      else
        Add('  (F.TIPOCONTRATO   IN (' +FU.QuotedListaString(CmpRptCM.ParamByName('TipoContrato').asString, ',')+ ')) AND');
    end;

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (EF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (EF.IDMOTIVO       = M.IDMOTIVO) AND');
    Add('  (EF.IDCARGO        = C1.IDCARGO) AND');
    Add('  (EF.IDFUNCAO       = C2.IDCARGO(+)) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordem').asInteger) of
      0 : Add('  EMPREGADO, DATAALTERFUNC, MOTIVO');
      1 : Add('  EMPREGADO, MOTIVO, DATAALTERFUNC');
      2 : Add('  CODCENTROCUSTO, EMPREGADO, DATAALTERFUNC');
      3 : Add('  CODCENTROCUSTO, MOTIVO, DATAALTERFUNC');
      4 : Add('  CODCENTROCUSTO, DATAALTERFUNC, EMPREGADO');
      5 : Add('  CODCENTROCUSTO, DATAALTERFUNC, MOTIVO');
      6 : Add('  DATAALTERFUNC, EMPREGADO, MOTIVO');
      7 : Add('  DATAALTERFUNC, MOTIVO, EMPREGADO');
      8 : Add('  DATAALTERFUNC, CODCENTROCUSTO, EMPREGADO, MOTIVO');
      9 : Add('  DATAALTERFUNC, CODCENTROCUSTO, MOTIVO, EMPREGADO');
     10 : Add('  MOTIVO, DATAALTERFUNC, EMPREGADO');
     11 : Add('  MOTIVO, EMPREGADO, DATAALTERFUNC');
     12 : Add('  MOTIVO, DATAALTERFUNC, CODCENTROCUSTO, EMPREGADO');
     13 : Add('  MOTIVO, CODCENTROCUSTO, DATAALTERFUNC, EMPREGADO');
    end;
    SaveToFile('c:\qry.txt');
  end;
  sqlAlterFuncional.Open;
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsAlterFuncional.RecordCount;

  rpAlterFuncionalGrpFootBnd.Visible := true;
  if (CmpRptCM.ParamByName('Ordem').asInteger in [2..5]) then
    ppAlterFuncionalGroup.BreakName := 'CODCENTROCUSTO'
  else
  if (CmpRptCM.ParamByName('Ordem').asInteger >= 10) then
    ppAlterFuncionalGroup.BreakName := 'MOTIVO'
  else
  begin
    ppAlterFuncionalGroup.BreakName := '';
    rpAlterFuncionalGrpFootBnd.Visible := false;
  end;
end;

procedure TRptAlterFuncional.rpAlterFuncinalDtlBandBeforePrint(Sender: TObject);
begin
  inherited;
  if CdsAlterFuncional.FieldByName('IDPESSOA').asString = '' then
    exit;
    
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  E.IDCARGO, E.IDFUNCAO, E.SALARIO, C1.TITULO AS CARGOANT, C2.TITULO AS FUNCAOANT');
    Add('FROM');
    Add('  EVOLFUNC E, CARGO C1, CARGO C2');
    Add('WHERE');
    Add('  (E.IDPESSOA      = ' +CdsAlterFuncional.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (E.IDCARGO       = C1.IDCARGO) AND');
    Add('  (E.IDFUNCAO      = C2.IDCARGO(+)) AND');
    Add('  (E.DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
    Add('                      FROM   EVOLFUNC');
    Add('                      WHERE  (IDPESSOA = ' +
      CdsAlterFuncional.FieldByName('IDPESSOA').asString + ') AND');
    Add('                             (DATAALTERFUNC < TO_DATE('+
      QuotedStr(CdsAlterFuncional.FieldByName('DATAALTERFUNC').asString)+ ',''DD/MM/YYYY''))))');
  end;
  dmCds.sql.Open;

  if (dmCds.Cds.FieldByName('IDCARGO').asString =
      CdsAlterFuncional.FieldByName('IDCARGO').asString) then
    rpAlterFuncionalLblAlteracao.Caption := 'Mesmo Cargo (' +
      Trim(CdsAlterFuncional.FieldByName('CARGO').asString) + ')'
  else
    rpAlterFuncionalLblAlteracao.Caption := 'Cargo ' +
      FU.IFF(Trim(dmCds.Cds.FieldByName('CARGOANT').asString) = '', '',
        'de ' + Trim(dmCds.Cds.FieldByName('CARGOANT').asString) + ' para ') +
        Trim(CdsAlterFuncional.FieldByName('CARGO').asString);

  if (dmCds.Cds.FieldByName('IDFUNCAO').asString <> '') or
     (CdsAlterFuncional.FieldByName('IDFUNCAO').asString <> '') then
    if (dmCds.Cds.FieldByName('IDFUNCAO').asString =
        CdsAlterFuncional.FieldByName('IDFUNCAO').asString) then
      rpAlterFuncionalLblAlteracao.Caption := rpAlterFuncionalLblAlteracao.Caption +' / '+
        'Mesma Função (' + trim(CdsAlterFuncional.FieldByName('FUNCAO').asString) + ')'
    else
      rpAlterFuncionalLblAlteracao.Caption := rpAlterFuncionalLblAlteracao.Caption +' / '+
        'Função ' + FU.IFF(trim(dmCds.Cds.FieldByName('FUNCAOANT').asString) = '', '',
        'de ' +Trim(dmCds.Cds.FieldByName('FUNCAOANT').asString) + ' para ') +
        Trim(CdsAlterFuncional.FieldByName('FUNCAO').asString);

  if (dmCds.Cds.FieldByName('SALARIO').asFloat <> 0) then
    rpAlterFuncionalLblAlteracao.Caption := rpAlterFuncionalLblAlteracao.Caption + ' / ' +
      'Salário Anterior = ' + FormatFloat('###,###,##0.00',
      dmCds.Cds.FieldByName('SALARIO').asFloat);
end;

procedure TRptAlterFuncional.CdsAlterFuncionalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptAlterFuncional.rpAlterFuncionalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
