unit RReciboTerceiros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  DBClient, uCMClientDataSet, uCmSqlParams, Db, DBTables, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE,
  ppCtrls, ppBands, ppClass, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, uExtensoCM;

type
  TRptReciboTerceiros = class(TFrmCmReport)
    rpReciboTerceiros: TppReport;
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
    ppReciboTerceiros: TppBDEPipeline;
    dsReciboTerceiros: TwwDataSource;
    sqlReciboTerceiros: TCMSqlParams;
    CdsReciboTerceiros: TCMClientDataSet;
    ExtensoCM: TExtensoCM;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsReciboTerceirosAfterScroll(DataSet: TDataSet);
    procedure ReciboTerceirosrpVlrAdiantamentoPrint(Sender: TObject);
    procedure ReciboTerceirosrpLabel1Print(Sender: TObject);
    procedure rpReciboTerceirosNOME_BANCOPrint(Sender: TObject);
    procedure rpReciboTerceirosAGENCIAPrint(Sender: TObject);
    procedure ppSummaryBand3AfterPrint(Sender: TObject);
  end;

var
  RptReciboTerceiros: TRptReciboTerceiros;

implementation

uses uSistema, fAguarde, uCtrlFuncoesRH;

{$R *.DFM}

procedure TRptReciboTerceiros.CrmRptCMBeforePrint(Sender: TObject);
var
  sNomeTabela, sAnoMes: string;
begin
  inherited;
  if (CmpRptCM.ParamByName('Previa').asBoolean) then
    sNomeTabela := 'PREVIAFOLPAG'
  else
    sNomeTabela := 'HISTRUBSAL';

  sAnoMes := QuotedStr(IntToStr(FU.ExtraiAno(CmpRptCM.ParamByName('DataRef').asDateTime)) +'/'+
    FU.PoeZero(FU.ExtraiMes(CmpRptCM.ParamByName('DataRef').asDateTime)));

  with (sqlReciboTerceiros.SQL) do
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
    Add('  RTRIM(RP.DESCRPROVDESC) || DECODE(PD.CODRUBCLT,''50018'','' ('' ||');
    Add('    DECODE(PFAV.NOME,'''','''',RTRIM(PFAV.NOME)) || '')'') AS DESCRICAO,');
    Add('  HIST.VALOR,');
    Add('  CONTA_BANCARIA.NOME_BANCO,');
    Add('  CONTA_BANCARIA.AGENCIA,');
    Add('  CONTA_BANCARIA.CONTACORRENTE');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA P, PESSOA PFAV, ENDPESS E, RUBRICAXPESS RP,');
    Add('  RUBRICAINDIV RI, PROVDESC PD, FUNCIONARIO F, ESTADO ES, CIDADES,');
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
    // Histórico de Rubricas
    Add('  (SELECT');
    Add('     RI.IDEMPRESA, RI.IDFAVORECIDO, H.IDRUBRICA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     '+sNomeTabela+' H, RUBRICAINDIV RI');
    Add('   WHERE');

    if (Pos(',', CmpRptCM.ParamByName('ListaIdFavorecido').asString) > 0) then
      Add('     (RI.IDFAVORECIDO   IN (' +CmpRptCM.ParamByName('ListaIdFavorecido').asString+ ')) AND')
    else
      Add('     (RI.IDFAVORECIDO    = ' +CmpRptCM.ParamByName('ListaIdFavorecido').asString+ ') AND');

    Add('     (RI.FLGTPRUBMANUT   = ''2'') AND');
    Add('     (((RI.FLGPERMANENTE = 0) AND');
    Add('       (RI.ANOMESINICIO  = ' +sAnoMes+ ')) OR');
    Add('      (RI.FLGPERMANENTE  = 1)) AND');
    Add('     (H.MES              = ' +sAnoMes+ ') AND');

    if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdTipoFolha').asString) > 0) then
        Add('     (H.IDMOTIVO        IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND')
      else
        Add('     (H.IDMOTIVO         = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND');
    end;

    Add('     (RI.IDEMPRESA       = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (RI.IDRUBRICA       = H.IDRUBRICA) AND');
    Add('     (RI.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY H.IDRUBRICA, RI.IDFAVORECIDO, RI.IDEMPRESA) HIST,');
    // ------------------------------------------------------------------ //
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
    Add('  (HIST.IDEMPRESA    = RI.IDEMPRESA) AND');
    Add('  (HIST.IDRUBRICA    = RI.IDRUBRICA) AND');
    Add('  (HIST.IDEMPRESA    = RP.IDPESSOA) AND');
    Add('  (HIST.IDRUBRICA    = RP.IDRUBRICA) AND');
    Add('  (HIST.IDFAVORECIDO = P.IDPESSOA) AND');
    Add('  (HIST.IDFAVORECIDO = RI.IDFAVORECIDO) AND');
    Add('  (HIST.IDRUBRICA    = PD.IDPROVENTO) AND');
    Add('  (RI.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (RI.IDPESSOA       = PFAV.IDPESSOA(+)) AND');
    Add('  (P.IDPESSOA        = CPF_CGC.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO(+)) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES(+)) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (P.IDPESSOA        = CONTA_BANCARIA.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  UPPER(NOME)');
  end;
  frmAguarde.Mostra('Recibo de Pagamento a Terceiros');
  frmAguarde.Pos := 0;

  sqlReciboTerceiros.Open;
  frmAguarde.Max := CdsReciboTerceiros.RecordCount;
  frmAguarde.Min := 0;

  // Impressão do Rodapé de Autorizações
  rpFolhaPontoShape3.Visible := CmpRptCM.ParamByName('ImprimirAutorizacoes').asBoolean;
  rpReciboTerceirosLine2.Visible := CmpRptCM.ParamByName('ImprimirAutorizacoes').asBoolean;
  rpReciboTerceirosLabel2.Visible := CmpRptCM.ParamByName('ImprimirAutorizacoes').asBoolean;
  rpReciboTerceirosLabel3.Visible := CmpRptCM.ParamByName('ImprimirAutorizacoes').asBoolean;
end;

procedure TRptReciboTerceiros.CdsReciboTerceirosAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptReciboTerceiros.ReciboTerceirosrpVlrAdiantamentoPrint(Sender: TObject);
begin
  ExtensoCM.Valor := rpReciboTerceirosDBCalc1.Value;
  ExtensoCM.Escreve;
  ReciboTerceirosrpVlrAdiantamento.Caption := '(' +ExtensoCM.Extenso+ ')';
end;

procedure TRptReciboTerceiros.ReciboTerceirosrpLabel1Print(Sender: TObject);
begin
  rpReciboTerceirosLabel1.Visible := not(CdsReciboTerceiros.FieldByName('CONTACORRENTE').IsNull) and
    (Trim(CdsReciboTerceiros.FieldByName('CONTACORRENTE').asString) <> 'Conta:');
end;

procedure TRptReciboTerceiros.rpReciboTerceirosNOME_BANCOPrint(Sender: TObject);
begin
  rpReciboTerceirosNOME_BANCO.Visible := not(CdsReciboTerceiros.FieldByName('CONTACORRENTE').IsNull) and
    (Trim(CdsReciboTerceiros.FieldByName('CONTACORRENTE').asString) <> 'Conta:');
end;

procedure TRptReciboTerceiros.rpReciboTerceirosAGENCIAPrint(Sender: TObject);
begin
  rpReciboTerceirosAGENCIA.Visible := not(CdsReciboTerceiros.FieldByName('CONTACORRENTE').IsNull) and
    (Trim(CdsReciboTerceiros.FieldByName('CONTACORRENTE').asString) <> 'Conta:');
end;

procedure TRptReciboTerceiros.ppSummaryBand3AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
