// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit REscalaFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, TXRB;

type
  TRptEscalaFerias = class(TFrmCmReport)
    rpEscalaFerias: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel34: TppLabel;
    ppDBText4: TppDBText;
    rpEscalaFeriasDBText31: TppDBText;
    rpEscalaFeriasDBText32: TppDBText;
    rpEscalaFeriasDBText33: TppDBText;
    ppLine1: TppLine;
    ppLabel35: TppLabel;
    ppCalc1: TppCalc;
    ppLabel36: TppLabel;
    ppCalc2: TppCalc;
    ppLabel37: TppLabel;
    ppDBText34: TppDBText;
    ppLabel39: TppLabel;
    ppDBText35: TppDBText;
    ppDetailBand4: TppDetailBand;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    rpEscalaFeriasLabel2: TppLabel;
    rpEscalaFeriasLabel3: TppLabel;
    rpEscalaFeriasDBText1: TppDBText;
    ppFooterBand4: TppFooterBand;
    rpEscalaFeriasSmryBnd: TppSummaryBand;
    rpEscalaFeriasGrp0: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLabel40: TppLabel;
    ppDBText44: TppDBText;
    ppLine5: TppLine;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel45: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppDBText45: TppDBText;
    ppLabel52: TppLabel;
    rpEscalaFeriasLabel1: TppLabel;
    rpEscalaFeriasLabel4: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLine6: TppLine;
    ppLabel53: TppLabel;
    rpEscalaFeriasDBCalc1: TppDBCalc;
    ppEscalaFerias: TppBDEPipeline;
    dsEscalaFerias: TwwDataSource;
    sqlEscalaFerias: TCMSqlParams;
    CdsEscalaFerias: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsEscalaFeriasAfterScroll(DataSet: TDataSet);
    procedure rpEscalaFeriasSmryBndAfterPrint(Sender: TObject);
  private
    procedure GerarDadosRelat;
  end;

var
  RptEscalaFerias: TRptEscalaFerias;

implementation

uses uSistema, uCtrlUsoGeralRH, uCtrlFuncoesRH, fAguarde, dCds, uDiasUteis;

{$R *.DFM}

procedure TRptEscalaFerias.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: array [1..2] of integer;
begin
  inherited;
  rpEscalaFeriasDBText31.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpEscalaFeriasDBText32.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpEscalaFeriasDBText33.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;

  DocID[1] := 0;
  DocID[2] := 0;

  // Documentos
  with (dmCds.sql) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO, TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = :ESTADUAL) OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = :MUNICIPAL)) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Prepare;
    ParamByName('ESTADUAL').asString := 'ESTADUAL:';
    ParamByName('MUNICIPAL').asString := 'MUNICIPAL:';
    Open;
  end;

  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'ESTADUAL:') then
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'MUNICIPAL:') then
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger;
      Next;
    end;
  end;

  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  (:CNPJ || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    :MUNICIPAL || MUNICIPAL.NUMDOCUMENTO),');
    Add('    :ESTADUAL || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||');
    Add('    :CEP || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS EMPREGADO,');
    Add('  CC.CODCENTROCUSTO,');
    Add('  RTRIM(CC.NOME) AS NOMECENTROCUSTO,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
    Add('  TO_CHAR(FERIAS_EM_ABERTO.DATA,''DD/MM/YYYY'') AS DT_FERIAS_EM_ABERTO,');
    Add('  TO_CHAR(FERIAS.DATA,''DD/MM/YYYY'') AS DT_FERIAS,');
    Add('  TO_CHAR(FERIAS.ULT_FERIAS,''DD/MM/YYYY'') AS ULT_FERIAS');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, CENTCUST CC, ESTADO ES, CIDADES,');
    Add('  SITFUNC ST,');
    // -------------------------------------------------------------------------- //
    // Última Férias gozada pelo Funcionário
    Add('  (SELECT IDPESSOA, MAX(INIGOZOFERIAS) AS ULT_FERIAS, MAX(INIPERIODOFERIAS) AS DATA');
    Add('   FROM   FERIAS');
    Add('   WHERE  (FLGOCORRIDA       = 1) AND');
    Add('          (INIPERIODOFERIAS <= TO_DATE('+
      QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FERIAS,');
    // -------------------------------------------------------------------------- //
    // Última Férias em Aberto do Funcionário
    Add('  (SELECT IDPESSOA, MAX(INIPERIODOFERIAS) AS DATA');
    Add('   FROM FERIAS');
    Add('   WHERE (FLGOCORRIDA       = 0) AND');
    Add('         (INIPERIODOFERIAS <= TO_DATE('+
      QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FERIAS_EM_ABERTO,');
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual do(s) Estabelecimento(s)
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[1])+ ')) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal do(s) Estabelecimento(s)
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[2])+ ')) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // C. Custo(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
        Add('  (CC.CODCENTROCUSTO  IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
      else
        Add('  (CC.CODCENTROCUSTO   = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitado(s) para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;
    end;

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
      begin
        Add('  (F.IDPESSOA         IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
        Add('  (PF.IDPESSOA        IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
      end
      else
      begin
        Add('  (F.IDPESSOA          = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
        Add('  (PF.IDPESSOA         = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
      end;
    end
    else
    begin
      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',',CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('  (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (Pos(',',CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
    end;

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = FERIAS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = FERIAS_EM_ABERTO.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  UPPER(NOMECENTROCUSTO), UPPER(EMPREGADO)');
      1 : Add('  UPPER(NOMECENTROCUSTO), MATRICULA');
      2 : Add('  CODCENTROCUSTO, UPPER(EMPREGADO)');
      3 : Add('  CODCENTROCUSTO, MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.sql.Prepare;
  dmCds.sql.ParamByName('CNPJ').asString := 'CNPJ: ';
  dmCds.sql.ParamByName('MUNICIPAL').asString := 'Inscrição Municipal: ';
  dmCds.sql.ParamByName('ESTADUAL').asString := 'Inscrição Estadual: ';
  dmCds.sql.ParamByName('CEP').asString := ' - CEP:';
  dmCds.sql.Open;

  // Monta Query Principal
  GerarDadosRelat;

  frmAguarde.Max := CdsEscalaFerias.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptEscalaFerias.CdsEscalaFeriasAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptEscalaFerias.rpEscalaFeriasSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptEscalaFerias.GerarDadosRelat;
var
  c, iNumPerAquis, iNumRegistro: integer;
  sDataLimite, sDataPerAquis: string;
begin
  iNumRegistro := 0;
  sqlEscalaFerias.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    while not(dmCds.Cds.EOF) do
    begin
      // Seleciono qual data usar como Início do Período Aquisitivo
      if (Trim(dmCds.Cds.FieldByName('DT_FERIAS_EM_ABERTO').asString) <> '') then
        sDataPerAquis := dmCds.Cds.FieldByName('DT_FERIAS_EM_ABERTO').asString
      else
      if (Trim(dmCds.Cds.FieldByName('DT_FERIAS').asString) <> '') then
        sDataPerAquis := FU.IncData(dmCds.Cds.FieldByName('DT_FERIAS').asString,0,0,1)
      else
        sDataPerAquis := dmCds.Cds.FieldByName('DATAADMISSAO').asString;

      // Calculo as férias vencidas
      iNumPerAquis := (DiasUteis.IntervaloMeses(StrToDate(sDataPerAquis),
        StrToDate(CmpRptCM.ParamByName('DataRef').asString)) div 12);

      // Calculo TODOS OS PERÍODOS AQUISITIVOS ENTRE O ÚLTIMO E A DATA DE REFERÊNCIA
      for c:=1 to iNumPerAquis do
      begin
        // Calculo a Data Limite
        sDataLimite := FU.IncData(sDataPerAquis,0,23,0);

        Inc(iNumRegistro);
        // ----------------------------------------------------------------------------------
        // Gravo os dados
        // ----------------------------------------------------------------------------------
        CdsEscalaFerias.Insert;
        // Dados do Estabelecimento
        CdsEscalaFerias.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
        CdsEscalaFerias.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;
        CdsEscalaFerias.FieldByName('ESTADUALMUNICIPAL').asString := dmCds.Cds.FieldByName('ESTADUALMUNICIPAL').asString;
        CdsEscalaFerias.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
        CdsEscalaFerias.FieldByName('UF').asString := dmCds.Cds.FieldByName('UF').asString;
        // Dados do Funcionário
        if (c = 1) then
        begin
          CdsEscalaFerias.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
          CdsEscalaFerias.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
          CdsEscalaFerias.FieldByName('ULT_FERIAS').asString := dmCds.Cds.FieldByName('ULT_FERIAS').asString;
        end;
        CdsEscalaFerias.FieldByName('CODCENTROCUSTO').asString := dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;
        CdsEscalaFerias.FieldByName('NOMECENTROCUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
        CdsEscalaFerias.FieldByName('DATAADMISSAO').asString := dmCds.Cds.FieldByName('DATAADMISSAO').asString;
        CdsEscalaFerias.FieldByName('DT_FERIAS_EM_ABERTO').asString := dmCds.Cds.FieldByName('DT_FERIAS_EM_ABERTO').asString;
        CdsEscalaFerias.FieldByName('DATA_REF').asString := CmpRptCM.ParamByName('DataRef').asString;
        CdsEscalaFerias.FieldByName('PER_AQUIS_INI').asString := sDataPerAquis;
        CdsEscalaFerias.FieldByName('PER_AQUIS_FIN').asString :=
          DateToStr(StrToDate(FU.IncData(sDataPerAquis,0,0,1))-1);
        CdsEscalaFerias.FieldByName('DATA_LIMITE').asString := sDataLimite;
        CdsEscalaFerias.FieldByName('DATA_APOS').asString := FU.IncData(sDataPerAquis,0,0,1);
        CdsEscalaFerias.FieldByName('NUM_REGISTRO').asInteger := iNumRegistro;

        if (c = iNumPerAquis) then
          CdsEscalaFerias.FieldByName('NUM_FUNC').asInteger := 1
        else
          CdsEscalaFerias.FieldByName('NUM_FUNC').asInteger := 0;

        CdsEscalaFerias.Post;

        sDataPerAquis := FU.IncData(sDataPerAquis,0,0,1);
      end;

      dmCds.Cds.Next;
    end;
  end
  else
  begin
    CdsEscalaFerias.Insert;
    CdsEscalaFerias.Post;
  end;
  CdsEscalaFerias.First;
end;

end.
