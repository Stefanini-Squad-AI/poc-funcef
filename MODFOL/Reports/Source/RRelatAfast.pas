// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Autor(a)    : Flávio Souza
// Data        : 24/10/2010
// Pendência   : SOL 205113 / 15252 KINTANA 2048740
// Descricao   : Inclusão dos campos "Data de Admissão" e "Cargo / Função" no
//               Relatório.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Teodoro de Souza
// Data        : 19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   : Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RRelatAfast;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, TXRB, USistema, ppParameter, ppModule, raCodMod,
  DBTables, Wwquery, Wwdatsrc, daDataModule, ppStrtch, ppRichTx, Mask;

type
  TRptRelatAfast = class(TFrmCmReport)
    rpRelatAfast: TppReport;
    rpRelatAfastHdrBnd: TppHeaderBand;
    rpRelatAfastLbl1: TppLabel;
    rpRelatAfastLbl4: TppLabel;
    rpRelatAfastLbl5: TppLabel;
    rpRelatAfastDBTxt6: TppDBText;
    plnRelatAfastLine2: TppLine;
    rpRelatAfastLbl6: TppLabel;
    rpRelatAfastLbl8: TppLabel;
    rpRelatAfastSysVar2: TppSystemVariable;
    rpRelatAfastLbl7: TppLabel;
    rpRelatAfastDtlBand: TppDetailBand;
    rpRelatAfastDBTxt7: TppDBText;
    rpRelatAfastDBTxt8: TppDBText;
    rpRelatAfastDBTxt10: TppDBText;
    rpRelatAfastDBTxt12: TppDBText;
    rpRelatAfastDBTxt13: TppDBText;
    rpRelatAfastDBTxt11: TppDBText;
    rpRelatAfastSmryBnd: TppSummaryBand;
    ppRelatAfast: TppBDEPipeline;
    dsRelatAfast: TDataSource;
    sqlRelatAfast: TCMSqlParams;
    CdsRelatAfast: TCMClientDataSet;
    sqlAfast: TCMSqlParams;
    CdsAfast: TCMClientDataSet;
    sqlRetorno: TCMSqlParams;
    CdsRetorno: TCMClientDataSet;
    rpRelatAfastLbl11: TppLabel;
    rpRelatAfastLbl9: TppLabel;
    rpRelatAfastLbl12: TppLabel;
    rpRelatAfastLbl10: TppLabel;
    rpRelatAfastLbl15: TppLabel;
    rpRelatAfastLbl14: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rpRelatAfastGrupoEstab: TppGroupFooterBand;
    plnRelatAfastLine3: TppLine;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    rpRelatAfastDBTxt9: TppDBText;
    prmtrlst1: TppParameterList;

    // Inicio - Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.

    cdsCargoFuncao: TCMClientDataSet;
    sqlCargoFuncao: TCMSqlParams;
    pdbmgIMAGEM: TppDBImage;
    lblEmpresa: TppLabel;
    lblEnd1: TppLabel;
    lblEnd2: TppLabel;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField10: TppField;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    qryFundacaoBLOCO1: TStringField;
    qryFundacaoBLOCO2: TMemoField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    rpRelatAfastLbl13: TppLabel;
    rpRelatAfastDBCalc1: TppDBCalc;
    ppFooterBand1: TppFooterBand;
    ppLabel6: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    plnRelatAfastLine4: TppLine;
    daDataModule1: TdaDataModule;
    pdbmgIMAGEM1: TppDBImage;
    rcdmdl1: TraCodeModule;
    lblCNPJ: TppLabel;
    pfldRelatAfastppField1: TppField;
    pfldRelatAfastppField2: TppField;
    pfldRelatAfastppField3: TppField;
    pfldRelatAfastppField4: TppField;
    pfldRelatAfastppField5: TppField;
    pfldRelatAfastppField6: TppField;
    pfldRelatAfastppField7: TppField;
    pfldRelatAfastppField8: TppField;
    pfldRelatAfastppField9: TppField;
    pfldRelatAfastppField10: TppField;
    pfldRelatAfastppField11: TppField;
    pfldRelatAfastppField12: TppField;
    pfldRelatAfastppField13: TppField;
    pfldRelatAfastppField14: TppField;
    pfldRelatAfastppField15: TppField;
    pfldRelatAfastppField16: TppField;
    pln1: TppLine;

    procedure lblCNPJPrint(Sender: TObject);

    // Fim - Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.

    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsRelatAfastAfterScroll(DataSet: TDataSet);
    procedure rpRelatAfastSmryBndAfterPrint(Sender: TObject);

  private
    procedure GerarDadosRelat;
    procedure AbrirDadosAuxiliares;

    function VerificaCargoFuncao: String; // Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.
   
  end;

var
  RptRelatAfast: TRptRelatAfast;

implementation

uses fAguarde, uCtrlUsoGeralRH, uCtrlFuncoesRH, dCds;

{$R *.DFM}

procedure TRptRelatAfast.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

  qryFundacao.Open; // Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.

  rpRelatAfastGrupoEstab.Visible := Pos(',',CmpRptCM.ParamByName('ListaIdEstab').asString) > 0;
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB, F.IDESTAB,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,'''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS INSCRICAO,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME), NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CNPJ,');
    Add('  F.IDPESSOA, F.MATRICULA, RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  CC.NOME AS NOME_CCUSTO,');
    Add('  F.IDCARGO, F.IDFUNCAO, F.DATAADMISSAO AS DATA_ADMISSAO'); // Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, CIDADES, ESTADO ES,');
    Add('  CENTCUST CC, SITFUNC SF,');
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
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaCodCCusto').asString) = 0) then
        Add('  (CC.CODCENTROCUSTO  = ' +
          FU.QuotedListaString(CmpRptCM.ParamByName('ListaCodCCusto').asString,',')+ ') AND')
      else
        Add('  (CC.CODCENTROCUSTO IN (' +
          FU.QuotedListaString(CmpRptCM.ParamByName('ListaCodCCusto').asString,',')+ ')) AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) = 0) then
          Add('  (CC.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (CC.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;
    end;

    if (Pos(',',CmpRptCM.ParamByName('SitFunc').asString) = 0) then
      Add('  (SF.TIPOSIT        = ' +FU.QuotedListaString(CmpRptCM.ParamByName('SitFunc').asString, ',')+ ') AND')
    else
      Add('  (SF.TIPOSIT       IN (' +FU.QuotedListaString(CmpRptCM.ParamByName('SitFunc').asString, ',')+ ')) AND');

    if (Pos(',',CmpRptCM.ParamByName('TipoContrato').asString) = 0) then
      Add('  (F.TIPOCONTRATO    = ' +FU.QuotedListaString(CmpRptCM.ParamByName('TipoContrato').asString, ',')+ ') AND')
    else
      Add('  (F.TIPOCONTRATO   IN (' +FU.QuotedListaString(CmpRptCM.ParamByName('TipoContrato').asString, ',')+ ')) AND');

    Add('  (SF.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.sql.Open;

  // Monta Query Principal
  GerarDadosRelat;

  frmAguarde.Min := 0;
  frmAguarde.Max := CdsRelatAfast.RecordCount;
end;

procedure TRptRelatAfast.CdsRelatAfastAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptRelatAfast.rpRelatAfastSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptRelatAfast.GerarDadosRelat;
var
  bSemAfast, bSemRetorno: boolean;
  c, iNumRegAfast, iNumRegRetorno, iNumRegMaior: integer;
begin
  sqlRelatAfast.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    AbrirDadosAuxiliares;
    // LOOP para cada Pessoa
    repeat
      CdsAfast.Filter := 'IDPESSOA = ' + dmCds.Cds.FieldByName('IDPESSOA').asString;
      CdsRetorno.Filter := 'IDPESSOA = ' + dmCds.Cds.FieldByName('IDPESSOA').asString;
      bSemRetorno := false;
      bSemAfast := false;

      if (CdsAfast.IsEmpty) and (CdsRetorno.IsEmpty) then
      begin
        dmCds.Cds.Next;
        continue;
      end;

      iNumRegAfast := CdsAfast.RecordCount;
      iNumRegRetorno := CdsRetorno.RecordCount;
      if (iNumRegAfast > iNumRegRetorno) then
        iNumRegMaior := iNumRegAfast
      else
        iNumRegMaior := iNumRegRetorno;

      // LOOP para cada período
      for c:=1 to iNumRegMaior do
      begin
        CdsRelatAfast.Insert;
        CdsRelatAfast.FieldByName('ESTAB').asString         := dmCds.Cds.FieldByName('ESTAB').asString;
        CdsRelatAfast.FieldByName('IDESTAB').asString       := dmCds.Cds.FieldByName('IDESTAB').asString;
        CdsRelatAfast.FieldByName('INSCRICAO').asString     := dmCds.Cds.FieldByName('INSCRICAO').asString;
        CdsRelatAfast.FieldByName('ENDERECO').asString      := dmCds.Cds.FieldByName('ENDERECO').asString;
        CdsRelatAfast.FieldByName('UF').asString            := dmCds.Cds.FieldByName('UF').asString;
        CdsRelatAfast.FieldByName('CNPJ').asString          := dmCds.Cds.FieldByName('CNPJ').asString;
          
        // Inicio - Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.
        
        lblCNPJ.Caption                                     := dmCds.Cds.FieldByName('CNPJ').DisplayText;

        // FIM - Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.

        CdsRelatAfast.FieldByName('MATRICULA').asString     := dmCds.Cds.FieldByName('MATRICULA').asString;
        CdsRelatAfast.FieldByName('EMPREGADO').asString     := dmCds.Cds.FieldByName('EMPREGADO').asString;

        // Inicio - Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.

        CdsRelatAfast.FieldByName('DATA_ADMISSAO').asString := dmCds.Cds.FieldByName('DATA_ADMISSAO').asString;
        CdsRelatAfast.FieldByName('CARGO_FUNCAO').asString  := VerificaCargoFuncao;

        // FIM - Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.

        CdsRelatAfast.FieldByName('NOME_CCUSTO').asString := dmCds.Cds.FieldByName('NOME_CCUSTO').asString;
        CdsRelatAfast.FieldByName('REFERENCIA').asString :=
        CmpRptCM.ParamByName('DataInicial').asString +' a '+
        CmpRptCM.ParamByName('DataFinal').asString;

        if not(CdsAfast.IsEmpty) and not(bSemAfast) then
        begin
          CdsRelatAfast.FieldByName('DESC_AFASTAMENTO').asString := CdsAfast.FieldByName('NOME').asString;
          CdsRelatAfast.FieldByName('DATA_AFASTAMENTO').asString := CdsAfast.FieldByName('DATA').asString;
        end;

        if not(CdsRetorno.IsEmpty) and not(bSemRetorno) then
        begin
          CdsRelatAfast.FieldByName('DESC_RETORNO').asString := CdsRetorno.FieldByName('NOME').asString;
          CdsRelatAfast.FieldByName('DATA_RETORNO').asString := CdsRetorno.FieldByName('DATA').asString;
        end;
        CdsRelatAfast.Post;
        
        CdsAfast.Next;
        CdsRetorno.Next;
        
        bSemRetorno := CdsRetorno.EOF;
        bSemAfast := CdsAfast.EOF;
      end;
      dmCds.Cds.Next;
    until (dmCds.Cds.EOF);
  end
  else
  begin
    CdsRelatAfast.Insert;
    CdsRelatAfast.Post;
  end;
  
  case (CmpRptCM.ParamByName('Ordem').asInteger) of
    0 : CdsRelatAfast.IndexDefs[0].Fields := 'IDESTAB;EMPREGADO;NOME_CCUSTO';
    1 : CdsRelatAfast.IndexDefs[0].Fields := 'IDESTAB;NOME_CCUSTO;EMPREGADO';
    2 : CdsRelatAfast.IndexDefs[0].Fields := 'IDESTAB;MATRICULA;NOME_CCUSTO';
    3 : CdsRelatAfast.IndexDefs[0].Fields := 'IDESTAB;NOME_CCUSTO;MATRICULA';
  end;
  CdsRelatAfast.IndexName := 'CdsRelatAfastIndex1';

  CdsRelatAfast.First;
end;

// Inicio - Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.

function TRptRelatAfast.VerificaCargoFuncao : String;
begin
   sqlCargoFuncao.Prepare;
   if not(dmCds.Cds.FieldByName('IDFUNCAO').IsNull) then
      sqlCargoFuncao.ParamByName('IDCARGO').AsString := dmCds.Cds.FieldByName('IDFUNCAO').AsString
   else
      sqlCargoFuncao.ParamByName('IDCARGO').AsString := dmCds.Cds.FieldByName('IDCARGO').AsString;

  sqlCargoFuncao.Open;
  result := cdsCargoFuncao.FieldByName('TITULO').AsString;
end;

// FIM - Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.

procedure TRptRelatAfast.AbrirDadosAuxiliares;
var
  sListaIdPessoa: string;
begin
  sListaIdPessoa := '';
  dmCds.Cds.First;
  repeat
    if (sListaIdPessoa = '') then
      sListaIdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asString
    else
      sListaIdPessoa := sListaIdPessoa +','+ dmCds.Cds.FieldByName('IDPESSOA').asString;
    dmCds.Cds.Next;
  until (dmCds.Cds.EOF);
  dmCds.Cds.First;

  with (sqlAfast.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  H.IDPESSOA, H.DATASITFUNC AS DATA, MO.DESCRICAO AS NOME');
    Add('FROM');
    Add('  HSTSITFUNC H, MOTIVO MO');
    Add('WHERE');

    if (Pos(',',sListaIdPessoa) = 0) then
      Add('  (H.IDPESSOA      = ' +sListaIdPessoa+ ') AND')
    else
      Add(FU.QuebrarListaFiltro(2, '(H.IDPESSOA     ', sListaIdPessoa, 500)+ ' AND');

    if (Pos(',',CmpRptCM.ParamByName('ListaIdAfast').asString) = 0) then
      Add('  (H.IDMOTIVOOFIC  = ' +CmpRptCM.ParamByName('ListaIdAfast').asString+ ') AND')
    else
      Add('  (H.IDMOTIVOOFIC IN (' +CmpRptCM.ParamByName('ListaIdAfast').asString+ ')) AND');

    Add('  (H.DATASITFUNC  >= TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  (H.DATASITFUNC  <= TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  (H.IDMOTIVOOFIC  = MO.IDMOTIVO)');
    Add('ORDER BY');
    Add('  H.IDPESSOA, DATA');
    //SaveToFile('c:\qryAfast.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryAfast.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;
  sqlAfast.Open;
  CdsAfast.Filtered := true;

  with (sqlRetorno.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  H.IDPESSOA, H.DATASITFUNC AS DATA, MO.DESCRICAO AS NOME');
    Add('FROM');
    Add('  HSTSITFUNC H, MOTIVO MO');
    Add('WHERE');

    if (Pos(',',sListaIdPessoa) = 0) then
      Add('  (H.IDPESSOA      = ' +sListaIdPessoa+ ') AND')
    else
      Add(FU.QuebrarListaFiltro(2, '(H.IDPESSOA     ', sListaIdPessoa, 500)+ ' AND');

    if (Pos(',',CmpRptCM.ParamByName('ListaIdRetorno').asString) = 0) then
      Add('  (H.IDMOTIVOOFIC  = ' +CmpRptCM.ParamByName('ListaIdRetorno').asString+ ') AND')
    else
      Add('  (H.IDMOTIVOOFIC IN (' +CmpRptCM.ParamByName('ListaIdRetorno').asString+ ')) AND');

    Add('  (H.DATASITFUNC  >= TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  (H.DATASITFUNC  <= TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  (H.IDMOTIVOOFIC  = MO.IDMOTIVO)');
    Add('ORDER BY');
    Add('  H.IDPESSOA, DATA');
    //SaveToFile('c:\qryRetorno.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryRetorno.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlRetorno.Open;
  CdsRetorno.Filtered := true;
end;

// Inicio - Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.

// Formatação da Máscara do CNPJ.
procedure TRptRelatAfast.lblCNPJPrint(Sender: TObject);
var
  valor : string;
begin   
  lblCNPJ.Caption := dmCds.Cds.FieldByName('CNPJ').DisplayText;

  valor := lblCNPJ.Caption;

  if Length(valor) = 20 then
  begin
     valor := FormatMaskText('########.###.###/####-##;0',valor);
     lblCNPJ.Caption  := valor;
  end else if Length(valor) = 11 then
  begin 
     valor := FormatMaskText('###.###.###-##;0',valor);
     lblCNPJ.Caption  := valor;
  end;
 end;

// Fim - Flávio Souza SOL: 205113 / 15252 KINTANA 2048740.

end.





