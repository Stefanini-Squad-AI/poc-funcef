// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Henrique Massão
// Data        : 18/09/2009
// Pendência   : SOL 74193 KINTANA 524413
// Descricao   : Foi incluído a data de inclusão de dependetes no relatório
//               Consultas/Relatórios/Folha de Pagamento/Cadastrais/
//               Relação de Dependentes.
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RCadDependente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport,
  DBClient, uCMClientDataSet, uCmSqlParams, ppStrtch, ppMemo, TXRB, USistema,
  ppParameter;

type
  TRptCadDependente = class(TFrmCmReport)
    rpCadDependente: TppReport;
    rpCadDependenteHdrBnd1: TppHeaderBand;
    rpCadDependenteLbl1: TppLabel;
    rpCadDependenteDBTxt1: TppDBText;
    rpCadDependenteDBTxt2: TppDBText;
    rpCadDependenteDBTxt3: TppDBText;
    rpCadDependenteDBTxt4: TppDBText;
    rpCadDependenteLbl3: TppLabel;
    rpCadDependenteLbl4: TppLabel;
    rpCadDependenteLbl2: TppLabel;
    rpCadDependenteDBTxt5: TppDBText;
    rpCadDependenteSysVar1: TppSystemVariable;
    rpCadDependenteSysVar2: TppSystemVariable;
    rpCadDependenteDtlBnd1: TppDetailBand;
    rpCadDependenteDBTxt10: TppDBText;
    rpCadDependenteDBTxt11: TppDBText;
    rpCadDependenteDBTxt12: TppDBText;
    rpCadDependenteFootBnd1: TppFooterBand;
    rpCadDependenteSmryBnd1: TppSummaryBand;
    rpCadDependenteGrp1: TppGroup;
    rpCadDependenteGrpHdrBnd1: TppGroupHeaderBand;
    rpCadDependenteGrpFootBnd1: TppGroupFooterBand;
    ppLine10: TppLine;
    rpCadDependenteLbl12: TppLabel;
    rpCadDependenteDBCalc2: TppDBCalc;
    rpCadDependenteGrp2: TppGroup;
    rpCadDependenteGrpHdrBnd2: TppGroupHeaderBand;
    ppShape2: TppShape;
    rpCadDependenteLbl6: TppLabel;
    rpCadDependenteLine1: TppLine;
    rpCadDependenteLbl8: TppLabel;
    rpCadDependenteLbl10: TppLabel;
    rpCadDependenteDBTxt7: TppDBText;
    rpCadDependenteLbl9: TppLabel;
    ppLabel16: TppLabel;
    ppDBText2: TppDBText;
    ppLabel33: TppLabel;
    ppDBText5: TppDBText;
    rpCadDependenteGrpFootBnd2: TppGroupFooterBand;
    rpCadDependenteLine2: TppLine;
    rpCadDependenteLbl11: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppCadDependente: TppBDEPipeline;
    sqlCadDependente: TCMSqlParams;
    CdsCadDependente: TCMClientDataSet;
    dsCadDependente: TDataSource;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppParameterList1: TppParameterList;
    ppLabel3: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsCadDependenteAfterOpen(DataSet: TDataSet);
    procedure CdsCadDependenteAfterScroll(DataSet: TDataSet);
    procedure rpCadDependenteSmryBnd1AfterPrint(Sender: TObject);
  end;

var
  RptCadDependente: TRptCadDependente;

implementation

uses fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptCadDependente.CrmRptCMBeforePrint(Sender: TObject);
var
  c: byte;
  DocID: array [1..3] of string;
  DocMasc: array [1..3] of string;
begin
  inherited;
  for c:=1 to 3 do
    DocID[c] := '0';
  for c:=1 to 3 do
    DocMasc[c] := '';

  // Documentos
  with (dmCds.sql) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO,');
    SQL.Add('       DECODE(RTRIM(TDP.MASCARA),'''','''',RTRIM(TDP.MASCARA)) AS MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CGC:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'CNPJ:') or
         (FieldByName('SIGLADOCUMENTO').asString = 'CGC:') then
      begin
        DocID[1] := FieldByName('IDDOCUMENTO').asString;
        DocMasc[1] := FieldByName('MASCARA').asString + ';0';
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'ESTADUAL:') then
      begin
        DocID[2] := FieldByName('IDDOCUMENTO').asString;
        DocMasc[2] := FieldByName('MASCARA').asString + ';0';
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'MUNICIPAL:') then
      begin
        DocID[3] := FieldByName('IDDOCUMENTO').asString;
        DocMasc[3] := FieldByName('MASCARA').asString + ';0';
      end;
      Next;
    end;
  end;

  with (sqlCadDependente.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB, F.IDESTAB,');
    Add('  F.MATRICULA,');
    Add('  DOC_CNPJ.NUM AS CGC,');
    Add('  RTRIM(DECODE(RTRIM(DOC_ESTADUAL.NUM),'''',');
    Add('    DECODE(RTRIM(DOC_MUNICIPAL.NUM),'''','''',');
    Add('    ''Inscrição Municipal: '' || DOC_MUNICIPAL.NUM),');
    Add('    ''Inscrição Estadual: '' || DOC_ESTADUAL.NUM)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME),NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP: '' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  UPPER(PF.NOME) AS EMPREGADO,');
    Add('  PFD.NOME AS DEPENDENTE, PEFISD.DATANASC,');
    Add('  DP.DESCRICAO AS DEPENDENCIA,');
    Add('  DECODE(DT.FLGCONTAIMPOSTOR,1,''S'',''N'') AS CONTAIRRF, DT.FIMIMPOSTOR,');
    Add('  PEFIS.DATANASC AS DATANASC_TITTULAR,');
    Add('  DT.DATACADASTRO AS DATA_INCLUSAO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PFD, PESSOAFISICA PEFIS, PESSOAFISICA PEFISD,');
    Add('  ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, DEPENTIT DT, DEPEN DP, SITFUNC ST,');
    // -------------------------------------------------------------------------- //
    // CGC/CNPJ do Estabelecimento
    Add('  (SELECT DO.IDPESSOA, RTRIM(TDO.SIGLADOCUMENTO ||'' ''|| DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (DO.IDPESSOA  IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('         (DO.IDDOCUMENTO = ' +DocID[1]+ ') AND');
    Add('         (DO.IDDOCUMENTO = TDO.IDDOCUMENTO)) DOC_CNPJ,');
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual dO Estabelecimento
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +DocID[2]+ ')) DOC_ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal do Estabelecimento
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +DocID[3]+ ')) DOC_MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA        IN ('+CmpRptCM.ParamByName('ListaIdEstab').asString+')) AND');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('CodFuncSel').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('CodFuncSel').asString) > 0) then
        Add('  (F.IDPESSOA         IN (' +CmpRptCM.ParamByName('CodFuncSel').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA          = ' +CmpRptCM.ParamByName('CodFuncSel').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO   IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO    = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',',CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT         IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('  (ST.TIPOSIT          = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (Pos(',',CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO     IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO      = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
    end;

    if (CmpRptCM.ParamByName('CodTipoDependSel').asString = '') then
    begin
      Add('  (DT.IDDEPENDENCIA   <> ''PRP'') AND');
      Add('  (DT.FLGCONTAIMPOSTOR = 1) AND');
    end
    else
    if (Pos(',',CmpRptCM.ParamByName('CodTipoDependSel').asString) > 0) then
      Add('  (DT.IDDEPENDENCIA   IN (' +CmpRptCM.ParamByName('CodTipoDependSel').asString+ ')) AND')
    else
      Add('  (DT.IDDEPENDENCIA    = ' +CmpRptCM.ParamByName('CodTipoDependSel').asString+ ') AND');

    Add('  (F.IDSITFUNC         = ST.IDSITFUNC) AND');
    Add('  (F.IDPESSOA          = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = PEFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = DT.IDTITULAR) AND');
    Add('  (DT.IDPESSOA         = PFD.IDPESSOA) AND');
    Add('  (PFD.IDPESSOA        = PEFISD.IDPESSOA) AND');

    if (Pos(',',CmpRptCM.ParamByName('SexoTitular').asString) > 0) then
      Add('  (PEFIS.SEXO         IN ('+CmpRptCM.ParamByName('SexoTitular').asString+')) AND')
    else
      Add('  (PEFIS.SEXO          = '+CmpRptCM.ParamByName('SexoTitular').asString+') AND');

    if (Pos(',',CmpRptCM.ParamByName('SexoDependente').asString) > 0) then
      Add('  (PEFISD.SEXO        IN ('+CmpRptCM.ParamByName('SexoDependente').asString+')) AND')
    else
      Add('  (PEFISD.SEXO         = '+CmpRptCM.ParamByName('SexoDependente').asString+') AND');

    if (CmpRptCM.ParamByName('FaixaEtariaIni').asInteger > 0) then  //Faixa Etária Inicial
      Add('  (TRUNC((SYSDATE - 1 - PEFISD.DATANASC)/365.25) >= ' +
        CmpRptCM.ParamByName('FaixaEtariaIni').asString+ ') AND');

    if (CmpRptCM.ParamByName('FaixaEtariaFin').asInteger < 99) then  //Faixa Etária Final
      Add('  (TRUNC((SYSDATE - 1 - PEFISD.DATANASC)/365.25) <= ' +
        CmpRptCM.ParamByName('FaixaEtariaFin').asString+ ') AND');

    Add('  (DT.IDDEPENDENCIA    = DP.IDDEPENDENCIA) AND');
    Add('  (PJ.IDPESSOA         = F.IDESTAB) AND');
    Add('  (PJ.IDPESSOA         = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL   = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES         = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO    = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA         = DOC_CNPJ.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA         = DOC_ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA         = DOC_MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');       
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  F.IDESTAB, EMPREGADO');
      1 : Add('  F.IDESTAB, MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  rpCadDependenteDBTxt2.DisplayFormat := DocMasc[1]; // CNPJ
  if (DocMasc[2] <> '') then
    rpCadDependenteDBTxt3.DisplayFormat := DocMasc[2] // Inscrição Estadual
  else
    rpCadDependenteDBTxt3.DisplayFormat := DocMasc[3]; // Inscrição Municipal

  sqlCadDependente.Open;
end;

procedure TRptCadDependente.CdsCadDependenteAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptCadDependente.CdsCadDependenteAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCadDependente.rpCadDependenteSmryBnd1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
