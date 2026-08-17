unit RReciboAdvogados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  DBClient, uCMClientDataSet, uCmSqlParams, Db, DBTables, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE,
  ppCtrls, ppBands, ppClass, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, uExtensoCM, uCtrlHonorAdvog, TXRB;

type
  TRptReciboAdvogados = class(TFrmCmReport)
    rpReciboAdvogados: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ReciboTerceirosrpShape3: TppShape;
    ReciboTerceirosrpLabel1: TppLabel;
    ReciboTerceirosrpLabel2: TppLabel;
    ReciboTerceirosrpShape8: TppShape;
    ReciboTerceirosrpLabel11: TppLabel;
    ReciboTerceirosrpLabel16: TppLabel;
    ReciboTerceirosrpDBText6: TppDBText;
    ReciboTerceirosrpDBText2: TppDBText;
    ReciboTerceirosrpDBText11: TppDBText;
    ReciboTerceirosrpDBText12: TppDBText;
    ReciboTerceirosrpDBText13: TppDBText;
    ReciboTerceirosrpDBText14: TppDBText;
    ReciboTerceirosrpDBText1: TppDBText;
    rpReciboTerceirosLine1: TppLine;
    ReciboTerceirosrpLabel3: TppLabel;
    rpReciboTerceirosLabel4: TppLabel;
    rpReciboTerceirosDBText1: TppDBText;
    ppDetailBand3: TppDetailBand;
    ReciboTerceirosrpDESCRICAO: TppDBText;
    ReciboTerceirosrpDBText8: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    ReciboTerceirosrpShape13: TppShape;
    ReciboTerceirosrpLabel5: TppLabel;
    ReciboTerceirosrpVlrAdiantamento: TppLabel;
    ReciboTerceirosrpLabel14: TppLabel;
    ReciboTerceirosrpLabel13: TppLabel;
    ReciboTerceirosrpLine2: TppLine;
    rpReciboTerceirosDBCalc1: TppDBCalc;
    rpReciboTerceirosLabel1: TppLabel;
    rpReciboTerceirosNOME_BANCO: TppDBText;
    rpReciboTerceirosAGENCIA: TppDBText;
    rpReciboTerceirosDBText3: TppDBText;
    rpFolhaPontoShape3: TppShape;
    rpReciboTerceirosLabel2: TppLabel;
    rpReciboTerceirosLine2: TppLine;
    rpReciboTerceirosLabel3: TppLabel;
    ppReciboAdvogados: TppBDEPipeline;
    dsReciboAdvogados: TwwDataSource;
    sqlReciboAdvogados: TCMSqlParams;
    CdsReciboAdvogados: TCMClientDataSet;
    ExtensoCM: TExtensoCM;
    CdsHonorAdvog: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsReciboAdvogadosAfterScroll(DataSet: TDataSet);
    procedure ReciboTerceirosrpVlrAdiantamentoPrint(Sender: TObject);
    procedure ReciboTerceirosrpLabel1Print(Sender: TObject);
    procedure rpReciboTerceirosNOME_BANCOPrint(Sender: TObject);
    procedure rpReciboTerceirosAGENCIAPrint(Sender: TObject);
    procedure ppSummaryBand3AfterPrint(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    CtrlHonorAdvog: TCtrlHonorAdvog;
  end;

var
  RptReciboAdvogados: TRptReciboAdvogados;

implementation

uses uSistema, fAguarde, uCtrlFuncoesRH, uCtrlPadroes;

{$R *.DFM}

procedure TRptReciboAdvogados.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHonorAdvog := TCtrlHonorAdvog.Create;
  CtrlHonorAdvog.InitializeAs(Padroes);
end;

procedure TRptReciboAdvogados.CrmRptCMBeforePrint(Sender: TObject);
var
  sNomeTabela, sAnoMes: string;
begin
  inherited;
  sAnoMes := QuotedStr(IntToStr(FU.ExtraiAno(CmpRptCM.ParamByName('DataRef').asDateTime)) +'/'+
    FU.PoeZero(FU.ExtraiMes(CmpRptCM.ParamByName('DataRef').asDateTime)));

  with (sqlReciboAdvogados.SQL) do
  begin
    Add('SELECT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  DECODE(P.TIPO,''F'',P.NOME,P.RAZAOSOCIAL) AS NOME,');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+ ') AS DATA_REF,');
    Add('  (DECODE(PJ.NUMDOCUMENTO,NULL,'''', ''CNPJ: '' || PJ.NUMDOCUMENTO)) AS CGC,');
    Add('  CPF_CGC.NUM AS CPFCGC,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||''''|| DECODE(E.COMPLEMENTO,'' '','' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ''Honorário Fixo Mensal  ('' || TO_CHAR(PR.CONTA) || '' Processos Ativos)'' AS DESCRICAO,');
    Add('  PR.CONTA, 0 AS VALOR, A.FATORHONORADVOG,');
    Add('  CONTA_BANCARIA.NOME_BANCO,');
    Add('  CONTA_BANCARIA.AGENCIA,');
    Add('  CONTA_BANCARIA.CONTACORRENTE');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA P, PESSOA PFAV, ENDPESS E, ADVOGADO A,');
    Add('  ESTADO ES, CIDADES,');
    // ------------------------------------------------------------------ //
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
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL,');
    // ------------------------------------------------------------------ //
    // CNPJ
    Add('  (SELECT DP.IDPESSOA, RTRIM(DP.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CPF:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO)) CPF_CGC,');
    // ------------------------------------------------------------------ //
    // Quantidade de Processos
    Add('  (SELECT IDADVOGRECDA, COUNT(*) AS CONTA');
    Add('   FROM PROCESSOTRAB');
    Add('   WHERE ((FLGSITPROC = 0) OR');
    Add('          (FLGSITPROC = 1 AND DATAEFETENC > TO_DATE('''+CmpRptCM.ParamByName('DataRef').asString+''',''DD/MM/YYYY'')))');
    Add('   AND   (TRGDTINCLUSAO <= TO_DATE('''+CmpRptCM.ParamByName('DataRef').asString+''',''DD/MM/YYYY''))');
    if (Pos(',', CmpRptCM.ParamByName('ListaIdFavorecido').asString) > 0) then
      Add('   AND (IDADVOGRECDA   IN (' +CmpRptCM.ParamByName('ListaIdFavorecido').asString+ '))')
    else
      Add('   AND (IDADVOGRECDA    = ' +CmpRptCM.ParamByName('ListaIdFavorecido').asString+ ')');
    Add('   GROUP BY IDADVOGRECDA) PR,');
    // ------------------------------------------------------------------ //
    // Conta Bancária Favorecido
    Add('  (SELECT DISTINCT');
    Add('     FAV.IDPESSOA, (''Banco: ''||RTRIM(PB.NOME)) AS NOME_BANCO,');
    Add('     (''Agência: ''||RTRIM(A.NUMAGENCIA)||'' - ''||RTRIM(PA.NOME)) AS AGENCIA,');
    Add('     (''Conta: ''||C.CONTACORRENTE) AS CONTACORRENTE');
    Add('   FROM');
    Add('     PESSOA PA, PESSOA PB, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B, FORNSERV FAV');
    Add('   WHERE');

    if (Pos(',', CmpRptCM.ParamByName('ListaIdFavorecido').asString) > 0) then
      Add('     (FAV.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFavorecido').asString+ ')) AND')
    else
      Add('     (FAV.IDPESSOA = ' +CmpRptCM.ParamByName('ListaIdFavorecido').asString+ ') AND');

    Add('     (FAV.IDPESSOA = C.IDPESSOA) AND');
    Add('     (C.IDAGENCIA  = A.IDPESSOA) AND');
    Add('     (A.IDBANCO    = B.IDPESSOA) AND');
    Add('     (A.IDPESSOA   = PA.IDPESSOA) AND');
    Add('     (B.IDPESSOA   = PB.IDPESSOA)) CONTA_BANCARIA');
    // ------------------------------------------------------------------ //
    Add('WHERE');
    Add('  (PR.IDADVOGRECDA   = P.IDPESSOA) AND');
    Add('  (PR.IDADVOGRECDA   = A.IDPESSOA) AND');
    if (Pos(',', CmpRptCM.ParamByName('ListaIdFavorecido').asString) > 0) then
      Add('     (P.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFavorecido').asString+ ')) AND')
    else
      Add('     (P.IDPESSOA = ' +CmpRptCM.ParamByName('ListaIdFavorecido').asString+ ') AND');
    Add('  (PJ.IDPESSOA       = '+IntToStr(Sistema.IdEmpresa)+') AND');
    Add('  (P.IDPESSOA        = PFAV.IDPESSOA(+)) AND');
    Add('  (P.IDPESSOA        = CPF_CGC.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO(+)) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES(+)) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (P.IDPESSOA        = CONTA_BANCARIA.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  NOME');
  end;
  frmAguarde.Mostra('Recibo de Pagamento de Honorários Fixos');
  frmAguarde.Pos := 0;

  CdsHonorAdvog.Data := CtrlHonorAdvog.ListHonorAdvog(0);

  sqlReciboAdvogados.Open;
  frmAguarde.Max := CdsReciboAdvogados.RecordCount;
  frmAguarde.Min := 0;

  // Impressão do Rodapé de Autorizações
  rpFolhaPontoShape3.Visible := CmpRptCM.ParamByName('ImprimirAutorizacoes').asBoolean;
  rpReciboTerceirosLine2.Visible := CmpRptCM.ParamByName('ImprimirAutorizacoes').asBoolean;
  rpReciboTerceirosLabel2.Visible := CmpRptCM.ParamByName('ImprimirAutorizacoes').asBoolean;
  rpReciboTerceirosLabel3.Visible := CmpRptCM.ParamByName('ImprimirAutorizacoes').asBoolean;
end;

procedure TRptReciboAdvogados.CdsReciboAdvogadosAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptReciboAdvogados.ppDetailBand3BeforePrint(Sender: TObject);
var
  dValor: double;
  iMinMaior: integer;
begin
  // Calcular o Valor
  dValor := 0;
  iMinMaior := 0;
  CdsHonorAdvog.First;
  while not CdsHonorAdvog.Eof do
  begin
    if (CdsHonorAdvog.FieldByName('DATAVIGENCIA').AsDatetime > CmpRptCM.ParamByName('DataRef').asDateTime) then
      break;
    if (CdsHonorAdvog.FieldByName('LIMITEQTDE').AsInteger >=
        CdsReciboAdvogados.FieldByName('CONTA').AsInteger) then
    begin
        iMinMaior := CdsHonorAdvog.FieldByName('LIMITEQTDE').AsInteger;
        break;
    end;
    CdsHonorAdvog.Next;
  end;

  CdsHonorAdvog.First;
  while not CdsHonorAdvog.Eof do
  begin
    if (CdsHonorAdvog.FieldByName('DATAVIGENCIA').AsDatetime > CmpRptCM.ParamByName('DataRef').asDateTime) then
      break;
    if (CdsHonorAdvog.FieldByName('LIMITEQTDE').AsInteger = iMinMaior) then
       dValor := CdsHonorAdvog.FieldByName('VALOR').AsFloat;
    CdsHonorAdvog.Next;
  end;
  CdsReciboAdvogados.Edit;
  CdsReciboAdvogados.FieldByName('VALOR').AsFloat :=
    dValor * CdsReciboAdvogados.FieldByName('FATORHONORADVOG').AsFloat;
  CdsReciboAdvogados.Post;
end;

procedure TRptReciboAdvogados.ReciboTerceirosrpVlrAdiantamentoPrint(Sender: TObject);
begin
  ExtensoCM.Valor := rpReciboTerceirosDBCalc1.Value;
  ExtensoCM.Escreve;
  ReciboTerceirosrpVlrAdiantamento.Caption := '(' +ExtensoCM.Extenso+ ')';
end;

procedure TRptReciboAdvogados.ReciboTerceirosrpLabel1Print(Sender: TObject);
begin
  rpReciboTerceirosLabel1.Visible := not(CdsReciboAdvogados.FieldByName('CONTACORRENTE').IsNull) and
    (Trim(CdsReciboAdvogados.FieldByName('CONTACORRENTE').asString) <> 'Conta:');
end;

procedure TRptReciboAdvogados.rpReciboTerceirosNOME_BANCOPrint(Sender: TObject);
begin
  rpReciboTerceirosNOME_BANCO.Visible := not(CdsReciboAdvogados.FieldByName('CONTACORRENTE').IsNull) and
    (Trim(CdsReciboAdvogados.FieldByName('CONTACORRENTE').asString) <> 'Conta:');
end;

procedure TRptReciboAdvogados.rpReciboTerceirosAGENCIAPrint(Sender: TObject);
begin
  rpReciboTerceirosAGENCIA.Visible := not(CdsReciboAdvogados.FieldByName('CONTACORRENTE').IsNull) and
    (Trim(CdsReciboAdvogados.FieldByName('CONTACORRENTE').asString) <> 'Conta:');
end;

procedure TRptReciboAdvogados.ppSummaryBand3AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptReciboAdvogados.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlHonorAdvog.Free;
end;

end.
