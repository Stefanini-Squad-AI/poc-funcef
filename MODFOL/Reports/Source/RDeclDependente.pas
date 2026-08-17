// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

unit RDeclDependente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, DBClient, uCMClientDataSet, Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppDBPipe,
  ppDBBDE, ppVar, ppBands, ppCtrls, ppClass, ppStrtch, ppMemo, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport, TXRB, USistema;

type
  TRptDeclDependente = class(TFrmCmReport)
    rpDeclDependente: TppReport;
    rpDeclDependenteHdrBnd: TppHeaderBand;
    rpDeclDependenteShape1: TppShape;
    rpDeclDependenteMemo1: TppMemo;
    rpDeclDependenteDBTxt1: TppDBText;
    rpDeclDependenteMemo2: TppMemo;
    rpDeclDependenteDtlBnd: TppDetailBand;
    rpDeclDependenteShape3: TppShape;
    rpDeclDependenteDBTxt2: TppDBText;
    rpDeclDependenteDBTxt3: TppDBText;
    rpDeclDependenteDBTxt4: TppDBText;
    rpDeclDependenteLine3: TppLine;
    rpDeclDependenteLine4: TppLine;
    rpDeclDependenteFootBnd: TppFooterBand;
    rpDeclDependenteSmryBnd: TppSummaryBand;
    rpDeclDependenteGroupEMPREGADO: TppGroup;
    rpDeclDependenteGrpHdrBnd0: TppGroupHeaderBand;
    rpDeclDependenteShape2: TppShape;
    rpDeclDependenteLbl1: TppLabel;
    rpDeclDependenteLbl3: TppLabel;
    rpDeclDependenteLbl2: TppLabel;
    rpDeclDependenteLine1: TppLine;
    rpDeclDependenteLine2: TppLine;
    rpDeclDependenteGrpFootBnd0: TppGroupFooterBand;
    rpDeclDependenteShape5: TppShape;
    rpDeclDependenteLbl4: TppLabel;
    rpDeclDependenteDBTxt15: TppDBText;
    rpDeclDependenteSysVar1: TppSystemVariable;
    rpDeclDependenteDBTxt8: TppDBText;
    rpDeclDependenteDBTxt9: TppDBText;
    rpDeclDependenteDBTxt6: TppDBText;
    rpDeclDependenteDBTxt5: TppDBText;
    rpDeclDependenteDBTxt7: TppDBText;
    rpDeclDependenteDBTxt14: TppDBText;
    rpDeclDependenteMemo3: TppMemo;
    rpDeclDependenteShape4: TppShape;
    rpDeclDependenteMemo4: TppMemo;
    rpDeclDependenteLbl5: TppLabel;
    rpDeclDependenteLbl6: TppLabel;
    rpDeclDependenteLbl7: TppLabel;
    rpDeclDependenteLbl8: TppLabel;
    rpDeclDependenteLbl9: TppLabel;
    rpDeclDependenteLbl10: TppLabel;
    rpDeclDependenteDBTxt10: TppDBText;
    rpDeclDependenteDBTxt11: TppDBText;
    rpDeclDependenteLbl11: TppLabel;
    rpDeclDependenteLbl12: TppLabel;
    rpDeclDependenteLbl13: TppLabel;
    rpDeclDependenteLbl14: TppLabel;
    rpDeclDependenteLbl15: TppLabel;
    rpDeclDependenteDBTxt12: TppDBText;
    rpDeclDependenteDBTxt13: TppDBText;
    ppDeclDependente: TppBDEPipeline;
    dsDeclDependente: TwwDataSource;
    CdsDeclDependente: TCMClientDataSet;
    sqlDeclDependente: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsDeclDependenteAfterScroll(DataSet: TDataSet);
    procedure rpDeclDependenteSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptDeclDependente: TRptDeclDependente;

implementation

uses fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptDeclDependente.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: array [1..2] of string;
  DocMasc: array [1..2] of string;
begin
  inherited;
  DocID[1] := '0';
  DocID[2] := '0';
  DocMasc[1] := '';
  DocMasc[2] := '';

  // Documentos
  with (dmCds.sql) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO,');
    SQL.Add('       DECODE(RTRIM(TDP.MASCARA),'''','''',RTRIM(TDP.MASCARA)) AS MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CTPS:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CPF:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
      begin
        DocID[1] := FieldByName('IDDOCUMENTO').asString;
        DocMasc[1] := FieldByName('MASCARA').asString + ';0';
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CPF:') then
      begin
        DocID[2] := FieldByName('IDDOCUMENTO').asString;
        DocMasc[2] := FieldByName('MASCARA').asString + ';0';
      end;
      Next;
    end;
  end;

  with (sqlDeclDependente.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  F.MATRICULA,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(RTRIM(E.COMPLEMENTO),');
    Add('    NULL,'''','' - ''||RTRIM(E.COMPLEMENTO)) AS LOGRADOURO,');
    Add('  CIDADES.NOME AS CIDADE,');
    Add('  E.BAIRRO,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
    Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
    Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''O'',''Outro'') AS ESTCIVIL,');
    Add('  DOC_CTPS.NUM AS CTPS,');
    Add('  DOC_CTPS.UF AS CTPS_UF,');
    Add('  DOC_CPF.NUM AS CPF,');
    Add('  DECODE(RTRIM(TEL.DDD),'''','''',''(''|| RTRIM(TEL.DDD) || '') '') ||');
    Add('    DECODE(RTRIM(TEL.NUMERO),'''','''',RTRIM(TEL.NUMERO)) AS TELEFONE,');
    Add('  ES.CODESTADO AS UF,');
    Add('  UPPER(PF.NOME) AS EMPREGADO,');
    Add('  PFD.NOME AS DEPENDENTE, PEFISD.DATANASC, DP.DESCRICAO AS DEPENDENCIA');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PFD, PESSOAFISICA PEFIS, PESSOAFISICA PEFISD,');
    Add('  ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, DEPENTIT DT, DEPEN DP, SITFUNC ST,');
    // ------------------------------------------------------------------------------- //
    // CTPS do(s) Empregado(s)
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, PAIS PA');
    Add('   WHERE (DP.IDDOCUMENTO = ' +DocID[1]+ ') AND');
    Add('         (DP.IDPAIS      = PA.IDPAIS) AND');
    Add('         (PA.IDPAIS      = ES.IDPAIS) AND');
    Add('         (DP.IDESTADO    = ES.IDESTADO)) DOC_CTPS,');
    // -------------------------------------------------------------------------- //
    // CPF do(s) Empregado(s)
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +DocID[2]+ ')) DOC_CPF,');
    // -------------------------------------------------------------------------- //
    // Telefone do(s) Empregado(s)
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TEL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA         IN ('+CmpRptCM.ParamByName('ListaIdEstab').asString+')) AND');

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
    Add('  (PF.IDPESSOA         = E.IDPESSOA) AND');
    Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES         = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO    = ES.IDESTADO) AND');
    Add('  (PF.IDENDRESIDENCIAL = TEL.IDENDERECO(+)) AND');
    Add('  (PF.IDPESSOA         = DOC_CTPS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA         = DOC_CPF.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  EMPREGADO');
      1 : Add('  MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  rpDeclDependenteDBTxt10.DisplayFormat := DocMasc[1]; // CPTS
  rpDeclDependenteDBTxt11.DisplayFormat := DocMasc[2]; // CPF

  sqlDeclDependente.Open;
  frmAguarde.Max := CdsDeclDependente.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptDeclDependente.CdsDeclDependenteAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptDeclDependente.rpDeclDependenteSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
