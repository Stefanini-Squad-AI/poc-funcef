// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RFichaSalFam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo, DBClient, TXComp, FCmReport,
  uCMClientDataSet, uCmSqlParams, uCmRptManager, CmParamReport, TXRB;

type
  TRptFichaSalFam = class(TFrmCmReport)
    rpFichaSalFam: TppReport;
    rpFichaSalFamHdrBnd: TppHeaderBand;
    rpFichaSalFamLbl1: TppLabel;
    rpFichaSalFamDBTxt1: TppDBText;
    rpFichaSalFamDBTxt2: TppDBText;
    rpFichaSalFamDBTxt3: TppDBText;
    rpFichaSalFamDtlBnd: TppDetailBand;
    rpFichaSalFamFootBnd: TppFooterBand;
    rpFichaSalFamSmryBnd: TppSummaryBand;
    rpFichaSalFamGroupEMPREGADO: TppGroup;
    rpFichaSalFamGrpHdrBnd: TppGroupHeaderBand;
    rpFichaSalFamLabel4: TppLabel;
    rpFichaSalFamDBTxt4: TppDBText;
    rpFichaSalFamGrpFootBnd: TppGroupFooterBand;
    ppFichaSalFam: TppBDEPipeline;
    dsFichaSalFam: TwwDataSource;
    rpFichaSalFamLbl5: TppLabel;
    rpFichaSalFamDBTxtCTPS: TppDBText;
    rpFichaSalFamDBTxt5: TppDBText;
    rpFichaSalFamLbl6: TppLabel;
    rpFichaSalFamLbl7: TppLabel;
    rpFichaSalFamDBTxt6: TppDBText;
    rpFichaSalFamLbl9: TppLabel;
    rpFichaSalFamLine3: TppLine;
    rpFichaSalFamLbl10: TppLabel;
    rpFichaSalFamShape1: TppShape;
    rpFichaSalFamMemo1: TppMemo;
    rpFichaSalFamShape2: TppShape;
    rpFichaSalFamMemo2: TppMemo;
    rpFichaSalFamShape3: TppShape;
    rpFichaSalFamMemo3: TppMemo;
    rpFichaSalFamShape4: TppShape;
    rpFichaSalFamMemo4: TppMemo;
    rpFichaSalFamShape5: TppShape;
    rpFichaSalFamMemo5: TppMemo;
    rpFichaSalFamLbl8: TppLabel;
    rpFichaSalFamDBTxt7: TppDBText;
    rpFichaSalFamShape6: TppShape;
    rpFichaSalFamMemo6: TppMemo;
    rpFichaSalFamShape7: TppShape;
    rpFichaSalFamMemo7: TppMemo;
    rpFichaSalFamShape10: TppShape;
    rpFichaSalFamMemo10: TppMemo;
    rpFichaSalFamShape8: TppShape;
    rpFichaSalFamMemo8: TppMemo;
    rpFichaSalFamShape9: TppShape;
    rpFichaSalFamMemo9: TppMemo;
    rpFichaSalFamShape11: TppShape;
    rpFichaSalFamMemo11: TppMemo;
    rpFichaSalFamLine1: TppLine;
    rpFichaSalFamLine2: TppLine;
    rpFichaSalFamShape12: TppShape;
    rpFichaSalFamShape13: TppShape;
    rpFichaSalFamShape14: TppShape;
    rpFichaSalFamShape15: TppShape;
    rpFichaSalFamShape16: TppShape;
    rpFichaSalFamShape17: TppShape;
    rpFichaSalFamShape18: TppShape;
    rpFichaSalFamShape19: TppShape;
    rpFichaSalFamShape20: TppShape;
    rpFichaSalFamShape21: TppShape;
    rpFichaSalFamShape22: TppShape;
    rpFichaSalFamDBCalc1: TppDBCalc;
    rpFichaSalFamDBTxt8: TppDBText;
    rpFichaSalFamDBTxt9: TppDBText;
    rpFichaSalFamDBTxt10: TppDBText;
    rpFichaSalFamDBTxt11: TppDBText;
    rpFichaSalFamDBTxt12: TppDBText;
    rpFichaSalFamDBTxt13: TppDBText;
    rpFichaSalFamDBTxt14: TppDBText;
    rpFichaSalFamDBTxt15: TppDBText;
    sqlFichaSalFam: TCMSqlParams;
    CdsFichaSalFam: TCMClientDataSet;
    procedure qryFichaSalFamAfterScroll(DataSet: TDataSet);
    procedure rpFichaSalFamSmryBndAfterPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  end;

var
  RptFichaSalFam: TRptFichaSalFam;

implementation

uses fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptFichaSalFam.CrmRptCMBeforePrint(Sender: TObject);
var
  c: byte;
  DocID: array [1..5] of string;
  MascCTPS: string;
begin
  inherited;
  for c:=1 to 5 do
    DocID[c] := '0';
  MascCTPS := '';

  // Documentos
  CdsFichaSalFam.Close;
  with (sqlFichaSalFam) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO, TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CTPS:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''NOM_CART:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''NUM_REGISTRO:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''NUM_LIVRO:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''NUM_FOLHA:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  with (CdsFichaSalFam) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
      begin
        DocID[1] := FieldByName('IDDOCUMENTO').asString;
        MascCTPS := FieldByName('MASCARA').asString + ';0;_';
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'NOM_CART:') then
        DocID[2] := FieldByName('IDDOCUMENTO').asString
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'NUM_REGISTRO:') then
        DocID[3] := FieldByName('IDDOCUMENTO').asString
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'NUM_LIVRO:') then
        DocID[4] := FieldByName('IDDOCUMENTO').asString
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'NUM_FOLHA:') then
        DocID[5] := FieldByName('IDDOCUMENTO').asString;
      Next;
    end;
  end;

  with (sqlFichaSalFam.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,'''',''CNPJ: '' || PJ.NUMDOCUMENTO) AS CNPJ,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CI.NOME), NULL,'''','' - '' || RTRIM(CI.NOME)) ||');
    Add('    '' - CEP: '' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  F.DATAADMISSAO,');
    Add('  F.DATADESLIGAMENTO,');
    Add('  RTRIM(CTPS.NUM) AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,NULL,NULL,CTPS.UF) AS CTPS_UF,');
    Add('  CTPS.MASCARA AS MASCARA_CTPS,');
    Add('  PFD.NOME AS DEPENDENTE,');
    Add('  PEFISD.DATANASC,');
    Add('  CID.NOME AS LOCAL_NASC,');
    Add('  NOM_CART.NUM AS CARTORIO,');
    Add('  NUM_REGISTRO.NUM AS NUM_REGISTRO,');
    Add('  NUM_LIVRO.NUM AS NUM_LIVRO,');
    Add('  NUM_FOLHA.NUM AS NUM_FOLHA,');
    Add('  NUM_REGISTRO.DATAEMISSAO AS DATAENTREGA');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PFD, PESSOAFISICA PEFISD, FUNCIONARIO F, DEPENTIT D,');
    Add('  ENDPESS E, SITFUNC ST, ESTADO ES, CIDADES CI, CIDADES CID,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT DP.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCPESSOA TDP, PAIS PA');
    Add('   WHERE (TDP.IDDOCUMENTO    = '+DocID[1]+') AND');
    Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPAIS          = PA.IDPAIS) AND');
    Add('         (PA.IDPAIS          = ES.IDPAIS) AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = '+DocID[2]+')) NOM_CART,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM, DATAEMISSAO');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = '+DocID[3]+')) NUM_REGISTRO,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = '+DocID[4]+')) NUM_LIVRO,');
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = '+DocID[5]+')) NUM_FOLHA');
    // -------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // Funcionário selecionado
    if (CmpRptCM.ParamByName('CodFuncSel').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('CodFuncSel').asString) > 0) then
        Add('  (F.IDPESSOA       IN (' +CmpRptCM.ParamByName('CodFuncSel').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA        = ' +CmpRptCM.ParamByName('CodFuncSel').asString+ ') AND');

      Add('  (F.IDSITFUNC       = ST.IDSITFUNC) AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',',CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('  (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (Pos(',',CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

      Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (D.IDDEPENDENCIA   = ''FIL'') AND');
    Add('  (TRUNC((SYSDATE - 1 - PEFISD.DATANASC)/365.25) < 14) AND');
    Add('  (F.IDPESSOA        = D.IDTITULAR) AND');
    Add('  (D.IDPESSOA        = PFD.IDPESSOA) AND');
    Add('  (D.IDPESSOA        = PEFISD.IDPESSOA) AND');
    Add('  (PEFISD.IDCIDADES  = CID.IDCIDADES(+)) AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA(+)) AND');
    Add('  (D.IDPESSOA        = NOM_CART.IDPESSOA(+)) AND');
    Add('  (D.IDPESSOA        = NUM_REGISTRO.IDPESSOA(+)) AND');
    Add('  (D.IDPESSOA        = NUM_LIVRO.IDPESSOA(+)) AND');
    Add('  (D.IDPESSOA        = NUM_FOLHA.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO(+)) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA(+)) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES(+)) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO(+))');
    Add('ORDER BY');
    Add('  UPPER(EMPREGADO)');
    //SaveToFile('c:\qry.txt');
    //SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  rpFichaSalFamDBTxtCTPS.DisplayFormat := MascCTPS;

  sqlFichaSalFam.Open;
  frmAguarde.Max := CdsFichaSalFam.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptFichaSalFam.qryFichaSalFamAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFichaSalFam.rpFichaSalFamSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
