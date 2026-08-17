// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RBBancario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppSubRpt, ppBarCod, ppRichTx, FCmReport,
  uCmRptManager, TXComp, CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, uExtensoCM,
  uCtrlBancoPortFolha, TXRB;

type
  TRptBBancario = class(TFrmCmReport)
    ppRBBancarioSub: TppBDEPipeline;
    dsRBBancarioSub: TwwDataSource;
    rpRBBancario: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand10: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppRBBancario: TppBDEPipeline;
    dsRBBancario: TwwDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    rpRBBancarioLabel5: TppLabel;
    rpRBBancarioLabel6: TppLabel;
    rpTPagamento: TppLabel;
    rpRBBancarioDBText5: TppDBText;
    rpRBBancarioDBText6: TppDBText;
    rpRBBancarioDBText7: TppDBText;
    rpRBBancarioDBText8: TppDBText;
    rpRBBancariolbMes: TppLabel;
    rpRBBancarioLabel13: TppLabel;
    rpRBBancarioChildReport1Label1: TppLabel;
    rpRBBancarioChildReport1Calc1: TppCalc;
    rpRBBancarioChildReport1Label4: TppLabel;
    rpRBBancarioChildReport1Label5: TppLabel;
    rpRBBancarioChildReport1DBText6: TppDBText;
    rpRBBancarioChildReport1Calc2: TppCalc;
    rpRBBancarioDBText3: TppDBText;
    rpRBBancarioDBText4: TppDBText;
    rpRBBancarioDBText17: TppDBText;
    rpRBBancarioLabel11: TppLabel;
    rpRBBancarioDBText9: TppDBText;
    rpRBBancarioLabel10: TppLabel;
    rpRBBancarioDBText10: TppDBText;
    rpRBBancarioLabel7: TppLabel;
    rpRBBancarioLabel8: TppLabel;
    rpRBBancarioLabel9: TppLabel;
    rpRBBancarioLabel12: TppLabel;
    rpRBBancarioLabel2: TppLabel;
    rpRBBancarioLabel3: TppLabel;
    rpRBBancarioLabel17: TppLabel;
    rpRBBancarioDBText13: TppDBText;
    rpRBBancarioDBText12: TppDBText;
    rpRBBancarioLabel1: TppLabel;
    rpRBBancarioDBText16: TppDBText;
    rpRBBancarioLine1: TppLine;
    rpRBBancarioDBText1: TppDBText;
    rpRBBancarioDBText2: TppDBText;
    rpRBBancarioDBText11: TppDBText;
    rpRBBancarioDBText14: TppDBText;
    rpRBBancarioDBText15: TppDBText;
    rpRBBancarioMemo1: TppMemo;
    rpRBBancarioDBCalc2: TppDBCalc;
    rpRBBancarioExtenso: TppLabel;
    rpRBBancarioSubReport1: TppSubReport;
    rpRBBancarioChildReport1: TppChildReport;
    rpRBBancarioChildReport1HeaderBand1: TppHeaderBand;
    rpRBBancarioChildReport1LabelCODIGO: TppLabel;
    rpRBBancarioChildReport1LabelVALOR: TppLabel;
    rpRBBancarioChildReport1LabelNUMFUNC: TppLabel;
    rpRBBancarioChildReport1LabelAGENCIA: TppLabel;
    rpRBBancarioChildReport1DBText3: TppDBText;
    rpRBBancarioChildReport1Label6: TppLabel;
    rpRBBancarioChildReport1DBText4: TppDBText;
    rpRBBancarioChildReport1Label7: TppLabel;
    rpRBBancarioChildReport1DBText5: TppDBText;
    rpRBBancarioChildReport1LabelMESDE: TppLabel;
    rpRBBancarioChildReport1Memo1: TppMemo;
    rpRBBancarioChildReport1Line1: TppLine;
    rpRBBancarioChildReport1Label8: TppLabel;
    rpRBBancarioChildReport1Label9: TppLabel;
    rpRBBancarioChildReport1Label10: TppLabel;
    rpRBBancarioChildReport1DBText7: TppDBText;
    rpRBBancarioChildReport1Label11: TppLabel;
    rpRBBancarioChildReport1DBText8: TppDBText;
    rpRBBancarioChildReport1DetailBand1: TppDetailBand;
    rpRBBancarioChildReport1FooterBand1: TppFooterBand;
    rpRBBancarioChildReport1SummaryBand1: TppSummaryBand;
    rpRBBancarioChildReport1LabelVALTOT: TppLabel;
    rpRBBancarioChildReport1DBCalc3: TppDBCalc;
    rpRBBancarioChildReport1Line2: TppLine;
    rpRBBancarioChildReport1Line3: TppLine;
    rpRBBancarioChildReport1Line4: TppLine;
    rpRBBancarioChildReport1Label2: TppLabel;
    rpRBBancarioChildReport1Label3: TppLabel;
    rpRBBancarioChildReport1Line5: TppLine;
    rpRBBancarioChildReport1Extenso: TppLabel;
    rpRBBancarioChildReport1DBCalc5: TppDBCalc;
    rpRBBancarioChildReport1Group1: TppGroup;
    rpRBBancarioChildReport1GroupHeaderBand1: TppGroupHeaderBand;
    rpRBBancarioChildReport1GroupFooterBand1: TppGroupFooterBand;
    rpRBBancarioChildReport1DBText1: TppDBText;
    rpRBBancarioChildReport1DBText2: TppDBText;
    rpRBBancarioChildReport1DBCalc1: TppDBCalc;
    rpRBBancarioChildReport1DBText9: TppDBText;
    rpRBBancarioChildReport1Calc3: TppSystemVariable;
    rpRBBancarioChildReport1Calc6: TppSystemVariable;
    rpRBBancarioChildReport1Calc4: TppSystemVariable;
    sqlRBBancario: TCMSqlParams;
    CdsRBBancario: TCMClientDataSet;
    sqlRBBancarioSub: TCMSqlParams;
    CdsRBBancarioSub: TCMClientDataSet;
    ExtensoCM: TExtensoCM;
    sqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    procedure rpRBBancarioDBCalc2GetText(Sender: TObject; var Text: String);
    procedure rpRBBancarioExtensoPrint(Sender: TObject);
    procedure rpRBBancarioChildReport1DBCalc3GetText(Sender: TObject; var Text: String);
    procedure rpRBBancarioChildReport1ExtensoPrint(Sender: TObject);
    procedure ppHeaderBand5BeforePrint(Sender: TObject);
    procedure rpRBBancarioSubReport1Print(Sender: TObject);
    procedure rpRBBancarioChildReport1HeaderBand1BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsRBBancarioAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlBancoPortFolha: TCtrlBancoPortFolha;

    sNomeTabela, sTotLiquidoText, sMesRef: string;
    DataCredito: TDate;

    procedure GerarRelatorio;
    procedure GerarDadosRelatorio;
    procedure GerarDadosSubRelatorio;
    function SelAgenciaEmpresaAtual(NumBanco: string): boolean;
  end;

var
  RptBBancario: TRptBBancario;

implementation

uses uSistema, fAguarde, uCtrlFuncoesRH, uCtrlPadroes, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TRptBBancario.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  CtrlBancoPortFolha.InitializeAs(Padroes);
end;

procedure TRptBBancario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlBancoPortFolha);
  inherited;
end;

procedure TRptBBancario.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpRBBancarioDBText6.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpRBBancarioDBText7.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpRBBancarioDBText8.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  
  DataCredito := CmpRptCM.ParamByName('DataCredito').asDateTime;

  if (CmpRptCM.ParamByName('Previa').asBoolean) then
    sNomeTabela := 'PREVIAFOLPAG'
  else
    sNomeTabela := 'HISTRUBSAL';

  sMesRef := CmpRptCM.ParamByName('Ano').asString + '/'+
    FU.PoeZero(CmpRptCM.ParamByName('Mes').asInteger);

  with (sqlAux.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,NULL,');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  DECODE(PJ.NUMDOCUMENTO,'''','''',''CNPJ:'' || PJ.NUMDOCUMENTO) AS CGCCPF,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(EP.LOGRADOURO) ||'', ''|| EP.NUMERO || DECODE(EP.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(EP.COMPLEMENTO)) ||'' - ''|| RTRIM(EP.BAIRRO) ||'' - ''|| RTRIM(CI.NOME) ||');
    Add('    '' - CEP:''|| RTRIM(SUBSTR(EP.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(EP.CEP,6,3)) AS ENDERECO,');
    Add('  F.MATRICULA,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  PF.NUMDOCUMENTO AS CPF,');
    Add('  B.NUMBANCO,');
    Add('  AG.NUMAGENCIA,');
    Add('  PA.NOME AS NOMEAGENCIA,');
    Add('  DECODE(EPA.LOGRADOURO,NULL,NULL,RTRIM(EPA.LOGRADOURO) ||'', ''|| EPA.NUMERO ||');
    Add('    DECODE(RTRIM(EPA.COMPLEMENTO),NULL,NULL,'' - '' || RTRIM(EPA.COMPLEMENTO)) ||'' - ''||');
    Add('    RTRIM(EPA.BAIRRO) ||'' - ''|| RTRIM(CIA.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(EPA.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(EPA.CEP,6,3))) AS ENDERECOAGENCIA,');
    Add('  F.NUMCONTASALARIO AS CONTA,');
    // Se a Rubrica 40999 não existir, calcula
    Add('  DECODE(RUBRICA.VALOR,NULL,(NVL(PROVENTOS.VALOR,0)-NVL(DESCONTOS.VALOR,0)),RUBRICA.VALOR) AS LIQUIDO');
    // ------------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PA, ENDPESS EP, ENDPESS EPA, FUNCIONARIO F,');
    Add('  CIDADES CI, CIDADES CIA, ESTADO ES, AGENCIABANCARIA AG, BANCO B, SITFUNC ST,');
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual do(s) Estabelecimento(s)
    Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal do(s) Estabelecimento(s)
    Add('  (SELECT DO.IDPESSOA, TDO.CODDOCUMENTO, DO.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) MUNICIPAL,');
    // -------------------------------------------------------------------------- //
    // Proventos do Funcionário
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +sNomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE (P.FLGDESCONTO = 0) AND');
    Add('         (F.IDESTAB    IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('         (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(DataCredito)) +',''DD/MM/YYYY'')) AND');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('         (F.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString, 4))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        Add(FU.MontaLinhaSelSQL('         (F.CODCENTROCUSTO',CtrlUsoGeralRH.UsuXCCusto, 1));

      Add(FU.MontaLinhaSelSQL('         (ST.TIPOSIT', CmpRptCM.ParamByName('SitFunc').asString, 4));
      Add(FU.MontaLinhaSelSQL('         (F.TIPOCONTRATO', CmpRptCM.ParamByName('TipoContrato').asString, 1));
    end;

    Add('         (H.IDPESSJUR    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('         (H.MES          = ' +QuotedStr(sMesRef)+ ') AND');
    Add('         (H.IDMOTIVO     = ' +CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
    Add('         (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('         (P.IDPROVENTO   = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA     = H.IDPESSOA)');
    Add('   GROUP BY H.IDPESSOA) PROVENTOS,');
    // -------------------------------------------------------------------------- //
    // Descontos do Funcionário
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +sNomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE (P.FLGDESCONTO = 1) AND');
    Add('         (F.IDESTAB    IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('         (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(DataCredito)) +',''DD/MM/YYYY'')) AND');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('         (F.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString, 4))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        Add(FU.MontaLinhaSelSQL('         (F.CODCENTROCUSTO', CtrlUsoGeralRH.UsuXCCusto, 1));

      Add(FU.MontaLinhaSelSQL('         (ST.TIPOSIT', CmpRptCM.ParamByName('SitFunc').asString, 4));
      Add(FU.MontaLinhaSelSQL('         (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString, 1));
    end;

    Add('         (H.IDPESSJUR    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('         (H.MES          = ' +QuotedStr(sMesRef)+ ') AND');
    Add('         (H.IDMOTIVO     = ' +CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
    Add('         (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('         (P.IDPROVENTO   = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA     = H.IDPESSOA)');
    Add('   GROUP BY H.IDPESSOA) DESCONTOS,');
    // -------------------------------------------------------------------------- //
    // Rubrica de Salário
    Add('  (SELECT H.IDPESSOA,H.VALORPROVENTO AS VALOR');
    Add('   FROM   ' +sNomeTabela+ ' H, PROVDESC P, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE (P.CODRUBCLT  = ''40999'') AND');
    Add('         (F.IDESTAB   IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('         (H.DATAPAGAMENTO IS NULL OR H.DATAPAGAMENTO = TO_DATE(' +QuotedStr(DateToStr(DataCredito)) +',''DD/MM/YYYY'')) AND');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('         (F.IDPESSOA', CmpRptCM.ParamByName('ListaIdFunc').asString, 4))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        Add(FU.MontaLinhaSelSQL('         (F.CODCENTROCUSTO',CtrlUsoGeralRH.UsuXCCusto, 1));

      Add(FU.MontaLinhaSelSQL('         (ST.TIPOSIT', CmpRptCM.ParamByName('SitFunc').asString, 4));
      Add(FU.MontaLinhaSelSQL('         (F.TIPOCONTRATO', CmpRptCM.ParamByName('TipoContrato').asString, 4));
    end;

    Add('         (H.IDPESSJUR    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('         (H.MES          = ' +QuotedStr(sMesRef)+ ') AND');
    Add('         (H.IDMOTIVO     = ' +CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
    Add('         (ST.IDSITFUNC   = F.IDSITFUNC) AND');
    Add('         (P.IDPROVENTO   = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA     = H.IDPESSOA)) RUBRICA');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (F.IDPESSOA', CmpRptCM.ParamByName('ListaIdFunc').asString, 8))
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        Add(FU.MontaLinhaSelSQL('  (F.CODCENTROCUSTO', CtrlUsoGeralRH.UsuXCCusto, 2));

      Add(FU.MontaLinhaSelSQL('  (ST.TIPOSIT', CmpRptCM.ParamByName('SitFunc').asString, 8));
      Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO', CmpRptCM.ParamByName('TipoContrato').asString, 4));
    end;

    Add('  (ST.IDSITFUNC       = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA        = F.IDESTAB) AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (F.IDAGENCIASALARIO = AG.IDPESSOA) AND');
    Add('  (AG.IDBANCO         = B.IDPESSOA) AND');
    Add('  (AG.IDPESSOA        = PA.IDPESSOA) AND');
    Add('  ((NVL(RUBRICA.VALOR,0)   > 0) OR');
    Add('   (NVL(PROVENTOS.VALOR,0) -');
    Add('    NVL(DESCONTOS.VALOR,0) > 0)) AND');
{    Add('  ((PROVENTOS.VALOR  IS NOT NULL) OR');
    Add('   (DESCONTOS.VALOR  IS NOT NULL) OR');
    Add('   (RUBRICA.VALOR    IS NOT NULL)) AND');}
    Add('  (PJ.IDPESSOA        = EP.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL  = EP.IDENDERECO) AND');
    Add('  (EP.IDCIDADES       = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO        = ES.IDESTADO) AND');
    Add('  (PA.IDPESSOA        = EPA.IDPESSOA(+)) AND');
    Add('  (PA.IDENDCOMERCIAL  = EPA.IDENDERECO(+)) AND');
    Add('  (EPA.IDCIDADES      = CIA.IDCIDADES(+)) AND');
    Add('  (PJ.IDPESSOA        = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA        = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = RUBRICA.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = DESCONTOS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA        = PROVENTOS.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  NUMBANCO, NUMAGENCIA, EMPREGADO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  rpRBBancario.DataPipeline := nil;
  GerarRelatorio;
  rpRBBancario.DataPipeline := ppRBBancario;
end;

procedure TRptBBancario.CdsRBBancarioAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Refresh;
end;

procedure TRptBBancario.ppHeaderBand5BeforePrint(Sender: TObject);
begin
  rptPagamento.Caption := CmpRptCM.ParamByName('NomeTipoFolha').asString;
  rpRBBancariolbMes.Caption := FU.MesExtensoAno(sMesRef);
end;

procedure TRptBBancario.rpRBBancarioDBCalc2GetText(Sender: TObject; var Text: String);
begin
  sTotLiquidoText := Text;
end;

procedure TRptBBancario.rpRBBancarioExtensoPrint(Sender: TObject);
begin
  sTotLiquidoText := FU.TiraCaracter(sTotLiquidoText, '.');
  ExtensoCM.Valor := StrToFloat(sTotLiquidoText);
  ExtensoCM.Escreve;
  rpRBBancarioExtenso.Caption := '('+ ExtensoCM.Extenso +')';
end;

procedure TRptBBancario.rpRBBancarioChildReport1DBCalc3GetText(Sender: TObject; var Text: String);
begin
  sTotLiquidoText := Text;
end;

procedure TRptBBancario.rpRBBancarioChildReport1ExtensoPrint(Sender: TObject);
begin
  sTotLiquidoText := FU.TiraCaracter(sTotLiquidoText, '.');
  ExtensoCM.Valor := StrToFloat(sTotLiquidoText);
  ExtensoCM.Escreve;
  rpRBBancarioChildReport1Extenso.Caption := '('+ ExtensoCM.Extenso +')';

  frmAguarde.Apaga;
end;

procedure TRptBBancario.rpRBBancarioSubReport1Print(Sender: TObject);
begin
  if not(CdsRBBancario.IsEmpty) then
    CdsRBBancarioSub.Filter := 'NUMBANCO = ' +CdsRBBancario.FieldByName('NUMBANCO').asString;
end;

procedure TRptBBancario.rpRBBancarioChildReport1HeaderBand1BeforePrint(Sender: TObject);
begin
  rpRBBancarioChildReport1LabelMESDE.Caption :=
    'Relação de Créditos por Agência do mês de ' + FU.MesExtensoAno(sMesRef);
end;

procedure TRptBBancario.GerarRelatorio;
begin
  sqlRBBancario.Open;
  sqlRBBancarioSub.Open;

  sqlAux.Open;
  if not(CdsAux.IsEmpty) then
  begin
    frmAguarde.Min := 0;
    frmAguarde.Max := CdsAux.RecordCount * 2;

    dmCds.Cds.Data := CtrlBancoPortFolha.ListContasEmpresa(Sistema.IdEmpresa);
    GerarDadosRelatorio;
    GerarDadosSubRelatorio;

    CdsRBBancario.First;
    CdsRBBancarioSub.First;
  end;
end;

procedure TRptBBancario.GerarDadosRelatorio;
var
  DiaCredito, MesCredito, AnoCredito: word;
begin
  // Data de Crédito selecionada
  if (DataCredito > 0) then
  begin
    DiaCredito := FU.ExtraiDia(DataCredito);
    MesCredito := FU.ExtraiMes(DataCredito);
    AnoCredito := FU.ExtraiAno(DataCredito);
  end
  else
  begin
    DiaCredito := 0;
    MesCredito := 0;
    AnoCredito := 0;
  end;

  CdsAux.First;
  repeat
    // Selecionar Agência cadastrada no Portador Forma por Banco
    if not(SelAgenciaEmpresaAtual(CdsAux.FieldByName('NUMBANCO').asString)) then
    begin
      CdsAux.Next;
      continue;
    end;

    CdsRBBancario.Insert;
    CdsRBBancario.FieldByName('EMPRESA').asString := CdsAux.FieldByName('EMPRESA').asString;
    CdsRBBancario.FieldByName('ESTADUALMUNICIPAL').asString := CdsAux.FieldByName('ESTADUALMUNICIPAL').asString;
    CdsRBBancario.FieldByName('CGCCPF').asString := CdsAux.FieldByName('CGCCPF').asString;
    CdsRBBancario.FieldByName('UF').asString := CdsAux.FieldByName('UF').asString;
    CdsRBBancario.FieldByName('ENDERECO').asString := CdsAux.FieldByName('ENDERECO').asString;
    CdsRBBancario.FieldByName('CODAGENCIA').asString := CdsAux.FieldByName('NUMAGENCIA').asString;

    if (CdsAux.FieldByName('NUMBANCO').asString <> dmCds.Cds.FieldByName('NUMBANCO').asString) then
      CdsRBBancario.FieldByName('NOMEAGENCIA').asString :=
        ' Banco: ' + CdsAux.FieldByName('NUMBANCO').asString +' / '+
        CdsAux.FieldByName('NOMEAGENCIA').asString
    else
      CdsRBBancario.FieldByName('NOMEAGENCIA').asString := Trim(CdsAux.FieldByName('NOMEAGENCIA').asString);

    CdsRBBancario.FieldByName('ENDERECOAGENCIA').asString := CdsAux.FieldByName('ENDERECOAGENCIA').asString;
    CdsRBBancario.FieldByName('CONTA').asString := CdsAux.FieldByName('CONTA').asString;
    CdsRBBancario.FieldByName('NUMBANCO').asString := dmCds.Cds.FieldByName('NUMBANCO').asString;
    CdsRBBancario.FieldByName('BANCO').asString := dmCds.Cds.FieldByName('NOMEBANCO').asString;
    CdsRBBancario.FieldByName('DIA_CREDITO').asInteger := DiaCredito;
    CdsRBBancario.FieldByName('MES_CREDITO').asInteger := MesCredito;
    CdsRBBancario.FieldByName('ANO_CREDITO').asInteger := AnoCredito;
    CdsRBBancario.FieldByName('MATRICULA').asString := CdsAux.FieldByName('MATRICULA').asString;
    CdsRBBancario.FieldByName('EMPREGADO').asString := CdsAux.FieldByName('EMPREGADO').asString;
    CdsRBBancario.FieldByName('CPF').asString := CdsAux.FieldByName('CPF').asString;
    CdsRBBancario.FieldByName('LIQUIDO').asFloat := CdsAux.FieldByName('LIQUIDO').asFloat;
    CdsRBBancario.Post;

    CdsAux.Next;
  until (CdsAux.EOF);
end;

procedure TRptBBancario.GerarDadosSubRelatorio;
var
  sNumBanco, sCodAgencia: string;
begin
  CdsRBBancario.First;
  repeat
    // Selecionar Agência cadastrada no Portador Forma por Banco
    if not(SelAgenciaEmpresaAtual(CdsRBBancario.FieldByName('NUMBANCO').asString)) then
    begin
      CdsRBBancario.Next;
      continue;
    end;

    sNumBanco := CdsRBBancario.FieldByName('NUMBANCO').asString;
    sCodAgencia := CdsRBBancario.FieldByName('CODAGENCIA').asString;
    repeat
      if (CdsRBBancarioSub.Locate('NUMBANCO;CODAGENCIA',
          VarArrayOf([sNumBanco, sCodAgencia]), [])) then
      begin
        CdsRBBancarioSub.Edit;
      end
      else
      begin
        CdsRBBancarioSub.Insert;
        CdsRBBancarioSub.FieldByName('CODAGENCIA_BANCO').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        CdsRBBancarioSub.FieldByName('NOMEAGENCIA_BANCO').asString := dmCds.Cds.FieldByName('NOMEAGENCIA').asString;
        CdsRBBancarioSub.FieldByName('CODAGENCIA').asString := CdsRBBancario.FieldByName('CODAGENCIA').asString;
        CdsRBBancarioSub.FieldByName('NOMEAGENCIA').asString := CdsRBBancario.FieldByName('NOMEAGENCIA').asString;
        CdsRBBancarioSub.FieldByName('NUMBANCO').asString := CdsRBBancario.FieldByName('NUMBANCO').asString;
        CdsRBBancarioSub.FieldByName('NUMCONTABANCO').asString := Trim(dmCds.Cds.FieldByName('NOCONTACORR').asString);
      end;
      CdsRBBancarioSub.FieldByName('NUM_FUNC').asInteger :=
        CdsRBBancarioSub.FieldByName('NUM_FUNC').asInteger + 1;
      CdsRBBancarioSub.FieldByName('LIQUIDO').asFloat :=
        CdsRBBancarioSub.FieldByName('LIQUIDO').asFloat +
        CdsRBBancario.FieldByName('LIQUIDO').asFloat;

      CdsRBBancarioSub.Post;
      CdsRBBancario.Next;
    until (sNumBanco <> CdsRBBancario.FieldByName('NUMBANCO').asString) or
          (sCodAgencia <> CdsRBBancario.FieldByName('CODAGENCIA').asString) or
          (CdsRBBancario.EOF);
  until (CdsRBBancario.EOF);
  CdsRBBancarioSub.Filter := '';
  CdsRBBancarioSub.Filtered := true;
  CdsRBBancario.First;
  CdsRBBancarioSub.First;
end;

function TRptBBancario.SelAgenciaEmpresaAtual(NumBanco: string): boolean;
begin
  Result := dmCds.Cds.Locate('NUMBANCO', NumBanco, []);
  if not(Result) then
    Result := dmCds.Cds.Locate('PADRAO', 1, []);
end;

end.
