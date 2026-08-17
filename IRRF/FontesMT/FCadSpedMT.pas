unit FCadSpedMT;

{
//******************************************************************************
//Rotina.............: FormCreate, sbtnGeraDemonstrativoClick
//N. SIG.............: 114455
//Data da Alteração..: 16/03/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de função para recuperação de máscara de contas
//                     contábeis.
//***************************************************************************************
//Rotina.............: sbtnGeraDemonstrativoClick, btnAtualizaDadosClick,
//                     sbtnGerarArquivosClick, LimpaPreviaDemons
//N. SIG.............: 72274
//Data da Alteração..: 21/01/2019
//Alteração Form.....: fCadSpedMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação da geração da EFD-Contribuição ante ao novo leiaute.
//***************************************************************************************
Analista.: Felipe A. Santos
Data.....: 21/05/2015
PPM......: 796205
Sol......: 244830/17209
Descrição: Previa do demonstrativo.
*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 242646 PPM 413667
Data.....: 10/06/2014
PPM......: 413667
Sol......: 242646
Descrição: Ajuste para permitir inserir contas Credito e Debito zeradas.
*******************************************************************************
Analista.: William Santana
Data.....: 10/06/2014
PPM......: 413667
Sol......: 233374
Descrição: Melhorias sobre os processos de geração do arquivo
*******************************************************************************
Analista.: William Santana
Data.....: 07/05/2014
PPM......: 372690
Sol......: 231426
Descrição: Correção dos valores dos campos Crédito e Débito, aba Analítico
           e alteração do ícone dos botões Gerar Arquivo e EFD 
*******************************************************************************
Analista.: William Santana
Data.....: 20/02/2014
Kintana..: 2051763
Sol......: 155850-15363
Descrição: Alteração da Funcionalidade SPED
*******************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 26/08/2013
Kintana..: 2051763
Sol......: 155850-15363
Descrição: Inclusão da Funcionalidade SPED
*******************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Mask, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  wwdblook, StdCtrls, Buttons, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97, Db, Wwdatsrc, DBClient, uCMClientDataSet, uSistema,
  uCtrlTipoRelatorio, uCtrlNormaVigente, uCtrlParametrosRelatorio, uMensErro,
  uCtrlLinhaRelatorio, wwriched, wwdbdatetimepicker, CMDateTimePicker,
  CMProcura, DBCtrls, wwdbedit, uCmSqlParams, uCtrlSPED, TREdit,
  CMProcuraSubTipo, QExport3Dialog, MontaSelect, Wwdotdot, Wwdbcomb,
  uCtrlFuncoesIRRF, ImgList;

const MSG001 = 'Deseja gerar arquivo EFD-Contribuições para %s ?';
const MSG002 = 'Deseja excluir arquivo EF-Contribuições de %s ?';
const MSG003 = 'Não é possível excluir arquivo EFD com número de recibo já informado.';
const MSG004 = 'O número do recibo não é compatível ao formato correto.';
const MSG005 = 'É preciso selecionar o Tipo de Relatório.';
const MSG006 = 'É preciso informar o exercício.';
const MSG007 = 'É preciso informar o período.';
const MSG008 = 'O arquivo ainda não foi gerado, deseja cancelar a geração?';
const MSG009 = 'Arquivo gerado com sucesso!';
const MSG010 = 'Já existe um arquivo normal emitido no período e exercício selecionados.';



type
  TfrmCadSpedMT = class(TfrmSairAjuda)
    Panel1: TPanel;
    sbtnExcluiEFD: TSpeedButton;
    gbFiltros: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    lblTipoRelatCad: TLabel;
    cbPeriodo: TComboBox;
    edExercicio: TEdit;
    dblcTipoRelatCad: TwwDBLookupCombo;
    rgTipo: TRadioGroup;
    sbtnGerarArquivos: TSpeedButton;
    sbtnGeraDemonstrativo: TSpeedButton;
    Panel2: TPanel;
    pnlDemonstrativo: TPanel;
    pnlRecibo: TPanel;
    btnGravar: TBitBtn;
    lblNumRecibo: TLabel;
    dbGridDemonstra: TwwDBGrid;
    pnlDetalhe: TPanel;
    pgDados: TPageControl;
    tbSintetico: TTabSheet;
    pnlExporta: TPanel;
    dbGridSintetico: TwwDBGrid;
    tbAnalitico: TTabSheet;
    Panel6: TPanel;
    lblLinhas: TLabel;
    lblContaContabil: TLabel;
    edContaContabil: TMaskEdit;
    cbxLinha: TComboBox;
    pnlAtuValor: TPanel;
    lblDebito: TLabel;
    lblCredito: TLabel;
    btnAtualizar: TBitBtn;
    dbGridAnalitico: TwwDBGrid;
    tbInfoAdic: TTabSheet;
    pgDetalhes: TPageControl;
    tsInstituicao: TTabSheet;
    gbPessoaJuridica: TGroupBox;
    Label12: TLabel;
    lblNomeEmpresa: TLabel;
    spbExportaDet: TSpeedButton;
    btnAtuDadosPJ: TSpeedButton;
    cdsFiltroTipo: TCMClientDataSet;
    cdsFiltroTipoDESCRICAO: TStringField;
    cdsFiltroTipoIDTIPO: TFloatField;
    dsFiltroTipo: TwwDataSource;
    tsInfoJud: TTabSheet;
    tsDadosIniciais: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbeProcesso: TwwDBEdit;
    ckbDadosPadrao: TCheckBox;
    pnlResponsavel: TPanel;
    Label25: TLabel;
    Label32: TLabel;
    Label1: TLabel;
    Label36: TLabel;
    Label3: TLabel;
    dbtCPF: TDBText;
    dbtEmail: TDBText;
    dbtFone: TDBText;
    PResponsavel: TCMProcura;
    dbeCRC: TwwDBEdit;
    Label15: TLabel;
    TEndereco: TCMProcura;
    Label16: TLabel;
    dbtNumero: TDBText;
    Label17: TLabel;
    Label18: TLabel;
    dbtBairro: TDBText;
    dbtCidade: TDBText;
    dbtCompl: TDBText;
    Label19: TLabel;
    Label20: TLabel;
    dbtCEP: TDBText;
    Label21: TLabel;
    dbtUF: TDBText;
    Label22: TLabel;
    dbeProcJud: TwwDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    dbeSecaoJud: TwwDBEdit;
    Label26: TLabel;
    dbeVara: TwwDBEdit;
    Label27: TLabel;
    dtDataSentenca: TCMDateTimePicker;
    Label28: TLabel;
    dsSintetico: TwwDataSource;
    CMSqlSintetico: TCMSqlParams;
    CMSqllAnalitico: TCMSqlParams;
    dsAnalitico: TwwDataSource;
    cdsDemonstra: TCMClientDataSet;
    dsDemonstra: TwwDataSource;
    CMSqlDemonstra: TCMSqlParams;
    cdsSitTributo: TCMClientDataSet;
    cdsIncidencia: TCMClientDataSet;
    cdsTipoContrib: TCMClientDataSet;
    cdsTipoAtividade: TCMClientDataSet;
    cdsOriProcesso: TCMClientDataSet;
    cdsApropriaCred: TCMClientDataSet;
    cdsEscrituraApura: TCMClientDataSet;
    cdsNaturezaAcao: TCMClientDataSet;
    cdsEfdDetalhe: TCMClientDataSet;
    dsEfdDetalhe: TwwDataSource;
    dbtRazao: TDBText;
    dbtCNPJ: TDBText;
    cdsResponsavel: TCMClientDataSet;
    cdsPesJur: TCMClientDataSet;
    rVlrDebito: TRealEdit;
    rVlrCredito: TRealEdit;
    cdsSintetico: TCMClientDataSet;
    cdsAnalitico: TCMClientDataSet;
    qeDadosSinteticos: TQExport3Dialog;
    MSPessJur: TMontaSelect;
    MSEnd: TMontaSelect;
    MSResp: TMontaSelect;
    edNumRecibo: TMaskEdit;
    cdsEndereco: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    dblcQualificaPJ: TComboBox;
    dblcSitTributaria: TComboBox;
    dblcIncidencia: TComboBox;
    dblcTipoContrib: TComboBox;
    dblcApuraCredito: TComboBox;
    dblcCritEscritura: TComboBox;
    dblcOriProcesso: TComboBox;
    dblcTipoAtiv: TComboBox;
    cdsQualificaPJ: TCMClientDataSet;
    dblcNatAcao: TComboBox;
    tsDadosContrib: TTabSheet;
    lbltpContrib: TLabel;
    lblcodRFbPis: TLabel;
    lblCodContAp: TLabel;
    lblCodRFbConfins: TLabel;
    cbbtpContrib: TComboBox;
    cbbcodRFbPis: TComboBox;
    cbbCodContAp: TComboBox;
    cbbCodRFbConfins: TComboBox;
    btnCancelar: TBitBtn;
    dbmDecisao: TwwDBRichEdit;

    // Felipe A. Santos SOL 244830/17209 PPM 796205 {fim qeDadosAnaliticos}
    btnAtualizaDados: TBitBtn;
    cdsRFbPis: TCMClientDataSet;
    cdsRFbConfins: TCMClientDataSet;
    grbPreviaDemons: TGroupBox;
    lblRef: TLabel;
    lblReceitas: TLabel;
    lblExclusoes: TLabel;
    lblBase: TLabel;
    lblPIS: TLabel;
    lblCOFINS: TLabel;
    lblValRef: TLabel;
    lblValReceita: TLabel;
    lblValExclusao: TLabel;
    lblValBase: TLabel;
    lblValPIS: TLabel;
    lblValCOFINS: TLabel;
    grbLinha: TGroupBox;
    cmprocLinha: TCMProcura;
    MSLinha: TMontaSelect;
    sbtnExportarAnalitico: TSpeedButton;
    qeDadosAnaliticos: TQExport3Dialog;
    Label29: TLabel;
    Label30: TLabel;
    lblBaseAjust: TLabel;
    lblVlrBaseAjust: TLabel;
    lblAcrescimos: TLabel;
    lblVlrAcrescimos: TLabel;
    lblReducoes: TLabel;
    lblVlrReducoes: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsDemonstraAfterScroll(DataSet: TDataSet);
    procedure sbtnGeraDemonstrativoClick(Sender: TObject);
    procedure sbtnExcluiEFDClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure ckbDadosPadraoClick(Sender: TObject);
    procedure sbtnGerarArquivosClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure spbExportaDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcQualificaPJ1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcTipoRelatCadChange(Sender: TObject);
    procedure btnAtuDadosPJClick(Sender: TObject);
    procedure edExercicioKeyPress(Sender: TObject; var Key: Char);
    procedure edContaContabilChange(Sender: TObject);
    procedure cdsSinteticoAfterOpen(DataSet: TDataSet);
    procedure cdsAnaliticoAfterOpen(DataSet: TDataSet);
    procedure cbxLinhaClick(Sender: TObject);
    procedure PResponsavelValidaDados(Sender: TObject);
    procedure TEnderecoValidaDados(Sender: TObject);
    procedure MSEndBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure cdsDemonstraAfterOpen(DataSet: TDataSet);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblcQualificaPJChange(Sender: TObject);
    procedure dblcQualificaPJKeyPress(Sender: TObject; var Key: Char);
    //Início - William Santana SOL 155850-15363 KIN 2051763
    procedure SetaCodRFBPisConfins(Sender: TObject);
    function  RetornaIndex (combo : TComboBox; cod : string) : integer;
    procedure CombosDropDown(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dblcCodRFBChange(Sender: TObject);
    //Término - William Santana SOL 155850-15363 KIN 2051763

    // Felipe A. Santos SOL 244830/17209 PPM 796205 {fim sbtnExportarAnaliticoClick}
    procedure btnAtualizaDadosClick(Sender: TObject);
    procedure cmprocLinhaValidaDados(Sender: TObject);
    procedure sbtnExportarAnaliticoClick(Sender: TObject);

  private
    { Private declarations }
    oNormaVigente                   : TCtrlNormaVigente;
    oParametrosRelatorio            : TCtrlParametrosRelatorio;
    oLinhaRelatorio                 : TCtrlLinhaRelatorio;
    oTipoRelatorio                  : TCtrlTipoRelatorio;
    oCtrlSPED                       : TCtrlSPED;

    sPeriodo, sExercicio            : string;
    iIdNormaAtual                   : integer;
    rAliquotaPis                    : double;
    rAliquotaCofins                 : double;
    sRetificadora                   : string;

    sTipoContrib , sCodigoApurado, sProcesso, sProcJud,
    sSecaoJud, sVara, sDataSentenca, sDecisao, sCrc : string; //William Santana - SOL 155850-15363 KIN 2051763 
    
    procedure CarregaDadosRelatorio( iIdRelatorio, iIdNorma : integer );
    //procedure CarregaLinhasAnaliticas( iIdNorma : integer); // Felipe A. Santos SOL 244830/17209 PPM 796205
    function  ValidaNumeroRecibo : boolean;
    procedure PreencheDadosInstituicao(iIdPessoa : integer);
    procedure PreencheDadosResponsavel(iIdPessoa : integer);
    procedure PreencheDadosInciais(const bLimpaDados : boolean = false);
    procedure HabilitaControles( bStatus  : boolean );
    function  ValidaDados : boolean;
    procedure CarregaOpcoesInfoAdicionais(const bLimpa : boolean = false);
    procedure CarregaDadosContribuicao(const bLimpa : boolean = false);
    procedure LimpaPreviaDemons; 
  public
    { Public declarations }
  end;

var
  frmCadSpedMT: TfrmCadSpedMT;

implementation

Uses UDatabase, DBaseDados;

{$R *.DFM}

procedure TfrmCadSpedMT.FormCreate(Sender: TObject);
begin
  inherited;

  // criando objetos
  oTipoRelatorio := TCtrlTipoRelatorio.Create;
  oTipoRelatorio.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   oNormaVigente := TCtrlNormaVigente.Create;
   oNormaVigente.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   oParametrosRelatorio := TCtrlParametrosRelatorio.Create;
   oParametrosRelatorio.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   oLinhaRelatorio := TCtrlLinhaRelatorio.Create;
   oLinhaRelatorio.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   oCtrlSPED := TCtrlSPED.create;
   oCtrlSPED.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   // setando cds
   oCtrlSPED.cdsDemonstrativo := cdsDemonstra;
   oCtrlSPED.cdsAnalitico     := cdsAnalitico;
   oCtrlSPED.cdsSintetico     := cdsSintetico;
   oCtrlSPED.cdsEfdDetalhe    := cdsEfdDetalhe;

   // abre parametros
   CarregaOpcoesInfoAdicionais();
   CarregaDadosContribuicao();

   // abre consultas
   cdsFiltroTipo.Data  := oTipoRelatorio.ListTipoRelatorio('SPED');
   cdsDemonstra.Data   := oCtrlSPED.ListaDemonstrativos();

   dblcApuraCredito.enabled  := false;
   dblcCritEscritura.enabled := false;

   pgDados.ActivePage    := tbSintetico;
   pgDetalhes.ActivePage := tsDadosIniciais;

   HabilitaControles(false);

   edContaContabil.EditMask := oParametrosRelatorio.getMascaraContaPlanoVigente;//Cássio Rovaroto - SIG nº 114455
end;

procedure TfrmCadSpedMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(oNormaVigente);
  FreeAndNil(oParametrosRelatorio);
  FreeAndNil(oLinhaRelatorio);
  FreeAndNil(oTipoRelatorio);
end;

procedure TfrmCadSpedMT.cdsDemonstraAfterScroll(DataSet: TDataSet);
begin
  if not cdsDemonstra.ControlsDisabled then
     CarregaDadosRelatorio( cdsDemonstra.FieldByName('IDRELATORIODADOS').AsInteger , cdsDemonstra.FieldByName('IDNORMA').AsInteger );
end;

procedure TfrmCadSpedMT.sbtnGeraDemonstrativoClick(Sender: TObject);
var
    sMascaraConta: string;
begin
  LimpaPreviaDemons();//Cássio Rovaroto - SIG nº 72274
  // valida dados
  if not ValidaDados() then
  begin
    //sbtnGeraArquivo.Down := false; // Felipe A. Santos SOL 244830/17209 PPM 796205
    sbtnGeraDemonstrativo.Down := false; // Felipe A. Santos SOL 244830/17209 PPM 796205
    edExercicio.Enabled := true; cbPeriodo.Enabled := true;  //William Santana  SOL 155850-15363 KIN 2051763
    abort;
  end;

  if sbtnGeraDemonstrativo.Down then // Felipe A. Santos SOL 244830/17209 PPM 796205
  begin
     edExercicio.Enabled := false;
     cbPeriodo.Enabled := false; //William Santana SOL 155850-15363 KIN 2051763
     pnlExporta.Enabled  := true;
     
    if not (cdsEfdDetalhe.State in [dsInsert]) then
    begin
      HabilitaControles(true);
      // CarregaLinhasAnaliticas( iIdNormaAtual ); Felipe A. Santos SOL 244830/17209 PPM 796205 - comentado
      PreencheDadosInciais(true);

      cdsEfdDetalhe.Data  := oCtrlSPED.ListaDadosDetalhe(-1);
      PreencheDadosInciais(); //William Santana - SOL 155850-15363 KIN 2051763

      cdsAnalitico.Data   := oCtrlSPED.PreencheDadosAnaliticos(StrToIntDef(edExercicio.text,-1), cbPeriodo.ItemIndex, iIdNormaAtual);
      cdsSintetico.data   := oCtrlSPED.PreencheDadosSinteticos(StrToIntDef(edExercicio.text,-1), cbPeriodo.ItemIndex, iIdNormaAtual);

      //Cássio Rovaroto -  SIG nº 114455 - Início
      sMascaraConta:= oParametrosRelatorio.getMascaraContaPlanoVigente(cbPeriodo.ItemIndex, StrToIntDef(edExercicio.text,-1));
      cdsAnalitico.FieldByName('PLACONTA').EditMask := sMascaraConta + ';0';
      edContaContabil.EditMask := sMascaraConta + ';0';
      //Cássio Rovaroto -  SIG nº 114455 - Fim
      oCtrlSPED.CalculaSaldoSintetico();
      cdsSintetico.First;

      cdsEfdDetalhe.insert;
      PreencheDadosInciais(); //William Santana - SOL 155850-15363 KIN 2051763

      ckbDadosPadrao.Checked   := true;
      ckbDadosPadraoClick(ckbDadosPadrao);

      pgDados.ActivePage    := tbInfoAdic;
      pgDetalhes.ActivePage := tsDadosIniciais;
    end;
  end
  else
  begin
    HabilitaControles(false);
    cdsSintetico.data  := oCtrlSPED.ListaDadosSinteticos( -1 );
    cdsAnalitico.data  := oCtrlSPED.ListaDadosAnaliticos( -1 );
    cdsEfdDetalhe.cancel;
    edExercicio.Enabled := true; cbPeriodo.Enabled := true;  //William Santana - SOL 155850-15363 KIN 2051763
    cdsDemonstraAfterScroll(cdsDemonstra);

  end;

  // Felipe A. Santos SOL 244830/17209 PPM 796205
  MSLinha.Filtro.Clear;
  MSLinha.Filtro.Add(' LR.IDLINHA = LXC.IDLINHA');
  MSLinha.Filtro.Add(' LXC.PLANO = PC.PLANO');
  MSLinha.Filtro.Add(' TRIM(LXC.PLACONTA) = TRIM(PC.PLACONTA)');
  MSLinha.Filtro.Add(' LR.IDNORMA = ' + IntToStr(iIdNormaAtual));
  // Felipe A. Santos SOL 244830/17209 PPM 796205 - fim
end;

procedure TfrmCadSpedMT.sbtnExcluiEFDClick(Sender: TObject);
begin
  // exclusão só permitida se não houver no. de recibo gerado
  if cdsDemonstra.FieldByName('NURECIBO').AsString = '' then
  begin
    if MsgDlg(Format(MSG002, [sPeriodo+'/'+sExercicio]), 'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then

      if oCtrlSPED.ExcluiDemonstrativo(cdsDemonstra.FieldByName('IDRELATORIODADOS').AsInteger) then
      begin
        cdsDemonstra.Data   := oCtrlSPED.ListaDemonstrativos();
        if cdsDemonstra.IsEmpty then
           CarregaDadosRelatorio(-1, iIdNormaAtual)
        else
           CarregaDadosRelatorio( cdsDemonstra.FieldByName('IDRELATORIODADOS').AsInteger , cdsDemonstra.FieldByName('IDNORMA').AsInteger );
      end;
    
  end
  else
    MsgDlg(MSG003, 'Informação', mtInformation, [mbOk], 0);   

end;

procedure TfrmCadSpedMT.btnGravarClick(Sender: TObject);
var
  iIdRelatorio : integer;
  sCampo : string;
begin
  inherited;
  if ValidaNumeroRecibo() then
  begin
    // preenche no. do recibo
    cdsDemonstra.Edit;
    if cdsDemonstra.FieldByName('NURECIBO').AsString = '' then
       cdsDemonstra.FieldByName('NURECIBO').AsString := edNumRecibo.text
    else if cdsDemonstra.FieldByName('NURECRETIFICADOR').AsString = '' then
       cdsDemonstra.FieldByName('NURECRETIFICADOR').AsString := edNumRecibo.text;
    cdsDemonstra.Post;

    iIdRelatorio := cdsDemonstra.FieldByName('IDRELATORIODADOS').AsInteger;

    oCtrlSPED.GravarRelatorio(false);

    cdsDemonstra.data := oCtrlSPED.ListaDemonstrativos();
    cdsDemonstra.Locate('IDRELATORIODADOS', iIdRelatorio, []);
    edNumRecibo.text := '';
  end
  else
     MsgDlg(MSG004, 'Informação', mtInformation, [mbOk], 0);     // qual formato é invalido? duvida

end;

procedure TfrmCadSpedMT.ckbDadosPadraoClick(Sender: TObject);
begin
  if ckbDadosPadrao.Checked then
  begin
    // BUSCA RESPONSÁVEL PELO PREENCHIMENTO PADRÃO (idpessoa = 1 -> fundacao)
    cdsResponsavel.Data := oCtrlSPED.ListaResponsavel(1);

    //BUSCA DADOS DA FUNDAÇÃO (idPessoa = 1 -> fundacao)
    cdsPesJur.data      := oCtrlSPED.ListaInstituicao(1);

    PreencheDadosInstituicao(1);
    PreencheDadosResponsavel(1);

  end
  else
  begin
    cdsResponsavel.Data := oCtrlSPED.ListaResponsavel(-1);
    cdsPesJur.data      := oCtrlSPED.ListaInstituicao(1);      //William Santana - SOL 155850-15363 KIN 2051763 *estava  -1*

    PreencheDadosInstituicao(-1);
    PreencheDadosResponsavel(-1);
  end;
end;

procedure TfrmCadSpedMT.sbtnGerarArquivosClick(Sender: TObject);
var
  iIdRelatorio : integer;
  rVlrBase     : currency;
  bOk          : boolean;
  sCaminho     : string;
  rVlrBaseAjustada: Currency;//Cássio Rovaroto - SIG nº 72274
  sIdNorma : string; //Cássio Rovaroto - SIG nº 72274
begin
  inherited;

  if cdsEfdDetalhe.State in [dsEdit, dsInsert] then
  begin
    sExercicio := edExercicio.text;
    sPeriodo   := Format('%.2d', [cbPeriodo.ItemIndex]);
  end
  else
  begin
    sExercicio := cdsDemonstra.FieldByName('EXERCICIO').AsString;
    sPeriodo   := cdsDemonstra.FieldByName('PERIODO').AsString;
  end;

  if MsgDlg(Format(MSG001, [sPeriodo+'/'+sExercicio]), 'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    sRetificadora := FU.IFF(rgTipo.ItemIndex = 0, 'N', 'S');

    try

      // pega aliquota dos impostos
      oCtrlSPED.GetAliquotaImpostos( rAliquotaPis, rAliquotaCofins );

      if sbtnGeraDemonstrativo.Down then  // Felipe A. Santos SOL 244830/17209 PPM 796205
      begin
        // inclui relatorio
        iIdRelatorio := oCtrlSPED.GetNumeroRelatorio();

        oCtrlSPED.CalculaValorBase(rVlrBase);
        rVlrBaseAjustada := oCtrlSPED.CalculaValorBaseAjustada;

        SetaCodRFBPisConfins(Sender);      //William Santana - Sol 233374 PPM 413667

        cdsDemonstra.DisableControls;
        cdsDemonstra.Insert;
        cdsDemonstra.FieldByName('IDRELATORIODADOS').AsInteger := iIdRelatorio;
        cdsDemonstra.FieldByName('IDTIPO').AsInteger           := cdsFiltroTipoIDTIPO.AsInteger;
        cdsDemonstra.FieldByName('IDNORMA').AsInteger          := iIdNormaAtual;
        cdsDemonstra.FieldByName('EXERCICIO').AsString         := sExercicio;
        cdsDemonstra.FieldByName('PERIODO').AsString           := sPeriodo;
        cdsDemonstra.FieldByName('DATAGERACAO').AsDateTime     := Date();
        cdsDemonstra.FieldByName('RETIFICADORA').AsString      := sRetificadora;
        cdsDemonstra.FieldByName('NURECIBO').AsString          := '';
        //Cássio Rovaroto - SIG nº 72274 - Início
        //cdsDemonstra.FieldByName('VLRPIS').AsCurrency          := rvlrBase * (rAliquotaPis/100);
        //cdsDemonstra.FieldByName('VLRCOFINS').AsCurrency       := rvlrBase * (rAliquotaCofins/100);
        cdsDemonstra.FieldByName('VLRPIS').AsCurrency          := rVlrBaseAjustada * (rAliquotaPis/100);
        cdsDemonstra.FieldByName('VLRCOFINS').AsCurrency       := rVlrBaseAjustada * (rAliquotaCofins/100);
        //cdsDemonstra.FieldByName('BASECALC').AsCurrency        :=  rvlrBase;
        cdsDemonstra.FieldByName('BASECALC').AsCurrency   := rVlrBaseAjustada;
        //Cássio Rovaroto - SIG nº 72274 - Fim
        cdsDemonstra.Post;

        // inserindo no. do relatorio no detalhe e codigos
        // FHBS / WGDS
        if dblcQualificaPJ.ItemIndex <> -1   then cdsQualificaPJ.Recno    := dblcQualificaPJ.ItemIndex + 1;
        if dblcTipoAtiv.ItemIndex <> -1      then cdsTipoAtividade.Recno  := dblcTipoAtiv.ItemIndex + 1;
        if dblcSitTributaria.ItemIndex <> -1 then cdsSitTributo.Recno     := dblcSitTributaria.ItemIndex + 1;
        if dblcOriProcesso.ItemIndex <> -1   then cdsOriProcesso.Recno    := dblcOriProcesso.ItemIndex + 1;
        if dblcIncidencia.ItemIndex <> -1    then cdsIncidencia.Recno     := dblcIncidencia.ItemIndex + 1;
        if dblcApuraCredito.ItemIndex <> -1  then cdsApropriaCred.Recno   := dblcApuraCredito.ItemIndex + 1;
        if dblcCritEscritura.ItemIndex <> -1 then cdsEscrituraApura.Recno := dblcCritEscritura.ItemIndex + 1;
        if dblcTipoContrib.ItemIndex <> -1   then cdsTipoContrib.Recno    := dblcTipoContrib.ItemIndex + 1;
        if dblcNatAcao.ItemIndex <> -1       then cdsNaturezaAcao.Recno   := dblcNatAcao.ItemIndex + 1;
        if cbbcodRFbPis.ItemIndex <> -1      then cdsRFbPis.Recno         := cbbcodRFbPis.ItemIndex + 1;
        if cbbCodRFbConfins.ItemIndex <> -1  then cdsRFbConfins.Recno     := cbbCodRFbConfins.ItemIndex + 1;

        cdsEfdDetalhe.FieldByName('IDRELATORIODADOS').AsInteger := iIdRelatorio;
        cdsEfdDetalhe.FieldByName('CODQUALIPESJUR').AsString    := FU.IFF(dblcQualificaPJ.text <> '', cdsQualificaPJ.fields[1].AsString, '');
        cdsEfdDetalhe.FieldByName('CODATIVIDADE').AsString      := FU.IFF(dblcTipoAtiv.text <> '', cdsTipoAtividade.fields[1].AsString, '');
        cdsEfdDetalhe.FieldByName('CODSITTRIB').AsString        := FU.IFF(dblcSitTributaria.text <> '', cdsSitTributo.fields[1].AsString, '');
        cdsEfdDetalhe.FieldByName('CODORIGEMPROCESSO').AsString := FU.IFF(dblcOriProcesso.text <> '', cdsOriProcesso.fields[1].AsString, '');
        cdsEfdDetalhe.FieldByName('CODINCIDTRIB').AsString      := FU.IFF(dblcIncidencia.text <> '', cdsIncidencia.fields[1].AsString, '');
        cdsEfdDetalhe.FieldByName('CODAPROPCRED').AsString      := FU.IFF(dblcApuraCredito.text <> '', cdsApropriaCred.fields[1].AsString, '');
        cdsEfdDetalhe.FieldByName('CODCRITESCRIT').AsString     := FU.IFF(dblcCritEscritura.text <> '', cdsEscrituraApura.fields[1].AsString, '');
        cdsEfdDetalhe.FieldByName('CODCONTRIBAPUR').AsString    := FU.IFF(dblcTipoContrib.text <> '', cdsTipoContrib.fields[1].AsString, '');
        cdsEfdDetalhe.FieldByName('NATUREZAACAO').AsString      := FU.IFF(dblcNatAcao.text <> '', cdsNaturezaAcao.fields[1].AsString, '');

        //Início - William Santana - SOL 155850-15363 KIN 2051763
        cdsEfdDetalhe.FieldByName('TIPOCONTRIBPISCONFINS').AsString := FU.IFF(cbbtpContrib.text <> '', sTipoContrib, '0');
        cdsEfdDetalhe.FieldByName('CODCONTRIBAPURADA').AsString     := FU.IFF(cbbCodContAp.text <> '', sCodigoApurado, '0');
        cdsEfdDetalhe.FieldByName('CODRFBPIS').AsString             := FU.IFF(cbbcodRFbPis.text <> '', cdsRFbPis.fields[1].AsString, '0');
        cdsEfdDetalhe.FieldByName('CODRFBCONFINS').AsString         := FU.IFF(cbbCodRFbConfins.text <> '', cdsRFbConfins.fields[1].AsString, '0');
        //Término - William Santana - SOL 155850-15363 KIN 2051763

        cdsEfdDetalhe.FieldByName('DESCRICAOJUD').AsString :=  Trim(StringReplace(StringReplace(dbmdecisao.text,#13#10#13#10,' ',[rfReplaceAll]),#13#10,'',[rfReplaceAll]));  //WIlliam Santana - SOL 233374 PPM 413667
        cdsEfdDetalhe.Post;

        // inserindo no. do relatorio nas linhas
        cdsAnalitico.DisableControls;
        oCtrlSPED.AplicaRemoveFiltro(cdsAnalitico, '');
        cdsAnalitico.First;

        while not cdsAnalitico.eof do
        begin
          cdsAnalitico.Edit;
          cdsAnalitico.FieldByName('IDRELATORIODADOS').AsInteger := iIdRelatorio;
          cdsAnalitico.Post;

          cdsAnalitico.Next;
        end;
        cdsAnalitico.First;
        cdsAnalitico.EnableControls;

        bOk := oCtrlSPED.GravarRelatorio(true);

        cdsDemonstra.EnableControls;
        cdsDemonstra.Data := oCtrlSPED.ListaDemonstrativos();
        cdsDemonstra.Locate('IDRELATORIODADOS', iIdRelatorio, []);

        sbtnGeraDemonstrativo.Down := false; // Felipe A. Santos SOL 244830/17209 PPM 796205
        HabilitaControles(false);
      end;

      sExercicio := cdsDemonstra.FieldByName('EXERCICIO').AsString;
      sPeriodo   := cdsDemonstra.FieldByName('PERIODO').AsString;
      sRetificadora := cdsDemonstra.FieldByName('RETIFICADORA').AsString;
      sIdNorma := cdsDemonstra.FieldByName('IDNORMA').asString; //Cássio Rovaroto - SIG nº 72274

      sCaminho := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\SPED';

      if (bOk) then
      begin
        bOk := oCtrlSPED.GerarArquivos(StrToInt(dblcTipoRelatCad.lookupValue), sRetificadora {rgTipo.itemindex}, sExercicio, sPeriodo, sCaminho, sIdNorma);

        if bOk then                  
           MsgDlg(MSG009, 'Informação', mtInformation, [mbOk], 0);
      end;
      
    except
      MsgDlg(oCtrlSPED.MessageInfo, 'Informação', mtInformation, [mbOk], 0);
    end;
     edExercicio.Enabled := true; cbPeriodo.Enabled := true; btnCancelar.Enabled := False; //William Santana - SOL 155850-15363 KIN 2051763
  end;
end;

procedure TfrmCadSpedMT.btnAtualizarClick(Sender: TObject);
var
   rVlrCred, rVlrDeb : Currency;
   rVlrCredAtu, rVlrDebAtu : Currency;
begin
  rVlrCred := cdsAnalitico.FieldByName('VLRCREDITO').AsCurrency;
  rVlrDeb  := cdsAnalitico.FieldByName('VLRDEBITO').AsCurrency;

//Marcio Sanches Spinosa SOL 242646 PPM 413667 - Inicio
//  if rVlrCredito.Value = 0 then
//     rVlrCredAtu := rVlrCred
//  else
     rVlrCredAtu := rVlrCredito.Value;

//  if rVlrDebito.Value = 0 then
//     rVlrDebAtu := rVlrDeb
//  else
     rVlrDebAtu := rVlrDebito.Value;
//Marcio Sanches Spinosa SOL 242646 PPM 413667 - Fim     

  cdsAnalitico.Edit;
  cdsAnalitico.FieldByName('VLRCREDITO').AsCurrency := rVlrCredAtu;
  cdsAnalitico.FieldByName('VLRDEBITO').AsCurrency  := rVlrDebAtu;
  cdsAnalitico.FieldByName('TOTAL').AsCurrency      := rVlrCredAtu - rVlrDebAtu;
  //Marcio Sanches Spinosa SOL 242646 PPM 413667 - Inicio
//  if cdsAnalitico.FieldByName('NATUREZA').AsString = 'POSITIVA' then
//     cdsAnalitico.FieldByName('TOTAL').AsCurrency := Abs(cdsAnalitico.FieldByName('TOTAL').AsCurrency)
//  else if (cdsAnalitico.FieldByName('TOTAL').AsCurrency > 0) then
//     cdsAnalitico.FieldByName('TOTAL').AsCurrency := (cdsAnalitico.FieldByName('TOTAL').AsCurrency * -1);
  //Marcio Sanches Spinosa SOL 242646 PPM 413667 - Inicio
  cdsAnalitico.Post;

  // recalcular o cdsSintetico
  oCtrlSPED.CalculaSaldoSintetico( cdsAnalitico.FieldByName('IDLINHA').AsString );

{
  cdsSintetico.DisableControls;
  cdsSintetico.Filtered := false;
  cdsSintetico.Filter   := 'IDLINHA = '+cdsAnalitico.FieldByName('IDLINHA').AsString;
  cdsSintetico.Filtered := true;

  cdsSintetico.Edit;
  cdsSintetico.FieldByName('VALOR').AsCurrency := (cdsSintetico.FieldByName('VALOR').AsCurrency - (rVlrCred - rVlrDeb)) + (rVlrCredAtu-rVlrDebAtu);
  cdsSintetico.Post;

  cdsSintetico.Filter   := '';
  cdsSintetico.Filtered := false;

  cdsSintetico.EnableControls;
}
end;

procedure TfrmCadSpedMT.spbExportaDetClick(Sender: TObject);
begin
  if not cdsSintetico.IsEmpty then
  begin
    cdsSintetico.DisableControls;
    qeDadosSinteticos.Execute;

    cdsSintetico.first;
    cdsSintetico.EnableControls;
  end;

end;

procedure TfrmCadSpedMT.FormShow(Sender: TObject);
begin
  // seta dados iniciais
  dblcTipoRelatCad.LookupValue :=  cdsFiltroTipo.FieldByName('IDTIPO').AsString;
  cbPeriodo.ItemIndex := 0;
  edExercicio.setfocus;
end;

{ // Felipe A. Santos SOL 244830/17209 PPM 796205 - início
procedure TfrmCadSpedMT.CarregaLinhasAnaliticas( iIdNorma : integer);
Var
  oCds: TClientDataSet;
Begin
  try
     oCds := TClientDataSet.Create(Nil);
     oCds.Data := oCtrlSPED.CarregaDadosLinhas( iIdNorma );
     cbxLinha.Items.Clear;
     cbxLinha.Items.AddObject('Todas as Linhas', TObject(0) );

     While Not oCds.Eof Do
     Begin
       cbxLinha.Items.AddObject(oCds.FieldbyName('Descricao').asString, TObject(oCds.FieldByName('IdLinha').asInteger));
       oCds.Next;
     End;
     oCds.Close;
  finally
    FreeAndNil(oCds);
  end;

  cbxLinha.ItemIndex := 0;

end;
// Felipe A. Santos SOL 244830/17209 PPM 796205 - fim }

procedure TfrmCadSpedMT.dblcQualificaPJ1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var
  sCampo : string;
begin
  TwwDBLookupCombo(sender).DisplayValue := LookupTable.FieldByName('DESCRICAO').AsString;
//  TwwDBLookupCombo(sender).Text :=

//  sCampo := TwwDBLookupCombo(sender).DataField;
//  TClientDataSet( TwwDBLookupCombo(sender).DataSource.DataSet ).FieldByName(sCampo).AsString := TwwDBLookupCombo(sender).LookupValue;
end;

procedure TfrmCadSpedMT.dblcTipoRelatCadChange(Sender: TObject);
begin
  iIdNormaAtual := oCtrlSPED.LocalizaNormaVigente( dblcTipoRelatCad.LookupValue );
end;

function TfrmCadSpedMT.ValidaNumeroRecibo: boolean;
begin
  if Trim(StringReplace( StringReplace(edNumRecibo.text, '.', '', []), '-', '', [])) = '' then
     Result := false
  else if Length( StringReplace( edNumRecibo.text, ' ', '', [])) < 61 then
     Result := false
  else
     Result := true;
end;

procedure TfrmCadSpedMT.btnAtuDadosPJClick(Sender: TObject);
begin
  inherited;
  MSPessJur.Executar;

  if MSPessJur.RetornouValor then
  begin
    ckbDadosPadrao.checked := false;
    
    cdsPesJur.data      := oCtrlSPED.ListaInstituicao( StrToInt(MSPessJur.ValoresChave[0]) );
    cdsResponsavel.Data := oCtrlSPED.ListaResponsavel(-1);

    PreencheDadosInstituicao( StrToInt(MSPessJur.ValoresChave[0]) );
    PreencheDadosResponsavel( -1 );

  end;
end;

procedure TfrmCadSpedMT.PreencheDadosInstituicao(iIdPessoa: integer);
begin
  if iIdPessoa > 0 then
  begin
    cdsEfdDetalhe.FieldByName('IDFUNDACAO').AsInteger := iIdPessoa;
    cdsEfdDetalhe.FieldByName('RAZAOSOCIAL').AsString := cdsPesJur.FieldByName('NOME').AsString;
    cdsEfdDetalhe.FieldByName('CNPJPESJUR').AsString  := Trim(cdsPesJur.FieldByName('CNPJ_MASCARA').AsString);
    cdsEfdDetalhe.FieldByName('IDENDPESS').AsInteger  := cdsPesJur.FieldByName('IDENDERECO').AsInteger;
    cdsEfdDetalhe.FieldByName('ENDERECO').AsString    := cdsPesJur.FieldByName('ENDERECO').AsString;
    cdsEfdDetalhe.FieldByName('NUMERO').AsString      := cdsPesJur.FieldByName('NUMERO').AsString;
    cdsEfdDetalhe.FieldByName('BAIRRO').AsString      := cdsPesJur.FieldByName('BAIRRO').AsString;
    cdsEfdDetalhe.FieldByName('CEP').AsString         := cdsPesJur.FieldByName('CEP').AsString;
    cdsEfdDetalhe.FieldByName('CIDADE').AsString      := cdsPesJur.FieldByName('CIDADE').AsString;
    cdsEfdDetalhe.FieldByName('UF').AsString          := cdsPesJur.FieldByName('UF').AsString;
    if iIdPessoa = 1 then
       cdsEfdDetalhe.FieldByName('TELEFONE').AsString := cdsPesJur.FieldByName('TELEFONE').AsString;
  end
  else
  begin
    cdsEfdDetalhe.FieldByName('IDFUNDACAO').AsInteger  := -1;
   //Início -  William Santana - SOL 155850-15363 KIN 2051763
   // cdsEfdDetalhe.FieldByName('RAZAOSOCIAL').AsString  := '';
   // cdsEfdDetalhe.FieldByName('CNPJPESJUR').AsString   := '';
    cdsEfdDetalhe.FieldByName('RAZAOSOCIAL').AsString := cdsPesJur.FieldByName('NOME').AsString;
    cdsEfdDetalhe.FieldByName('CNPJPESJUR').AsString  := Trim(cdsPesJur.FieldByName('CNPJ_MASCARA').AsString);
  // Término - William Santana - SOL 155850-15363 KIN 2051763
    cdsEfdDetalhe.FieldByName('TELEFONE').AsString     := '';
    cdsEfdDetalhe.FieldByName('IDENDPESS').AsInteger   := -1;
    cdsEfdDetalhe.FieldByName('ENDERECO').AsString     := '';
    cdsEfdDetalhe.FieldByName('NUMERO').AsString       := '';
    cdsEfdDetalhe.FieldByName('BAIRRO').AsString       := '';
    cdsEfdDetalhe.FieldByName('CEP').AsString          := '';
    cdsEfdDetalhe.FieldByName('CIDADE').AsString       := '';
    cdsEfdDetalhe.FieldByName('UF').AsString           := '';
  end;
end;

procedure TfrmCadSpedMT.PreencheDadosResponsavel(iIdPessoa : integer);
begin
  if iIdPessoa > 0 then
  begin
    cdsEfdDetalhe.FieldByName('IDCONTADOR').AsInteger  := cdsResponsavel.FieldByName('IDCONTADOR').AsInteger;
    cdsEfdDetalhe.FieldByName('CONTADOR').AsString     := cdsResponsavel.FieldByName('NOME').AsString;
    cdsEfdDetalhe.FieldByName('CPF_CONTADOR').AsString := Trim(cdsResponsavel.FieldByName('CPF_MASCARA').AsString);
    cdsEfdDetalhe.FieldByName('EMAIL').AsString        := cdsResponsavel.FieldByName('EMAIL').AsString;
    if iIdPessoa <> 1 then
       cdsEfdDetalhe.FieldByName('TELEFONE').AsString  := cdsResponsavel.FieldByName('DDD_TEL').AsString;
  end
  else
  begin
    cdsEfdDetalhe.FieldByName('IDCONTADOR').AsInteger  := -1;
    cdsEfdDetalhe.FieldByName('CONTADOR').AsString     := '';
    cdsEfdDetalhe.FieldByName('CPF_CONTADOR').AsString := '';
    cdsEfdDetalhe.FieldByName('TELEFONE').AsString     := '';
    cdsEfdDetalhe.FieldByName('EMAIL').AsString        := '';
  end;
end;

procedure TfrmCadSpedMT.edExercicioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    key := #0;
end;

function TfrmCadSpedMT.ValidaDados: boolean;
begin
  Result := true;

  // valida relatorio
  if Trim(dblcTipoRelatCad.text) = '' then
  begin
    MsgDlg(MSG005, 'Informação', mtInformation, [mbOk], 0);
    Result := false;
  end;

  // valida exercicio
  if (Result) and ((Trim(edExercicio.text) = '') or (edExercicio.text < '2013')) then
  begin
    MsgDlg(MSG006, 'Informação', mtInformation, [mbOk], 0);
    Result := false;
  end;

  // valida periodo
  if (result) and ((Trim(cbPeriodo.text) = '') or (cbPeriodo.itemindex = 0)) then
  begin
    MsgDlg(MSG007, 'Informação', mtInformation, [mbOk], 0);
    Result := false;
  end;
  // valida se ja existe arquivo gerado
  if (rgTipo.ItemIndex = 0) and (cdsDemonstra.Locate('IDTIPO;EXERCICIO;PERIODO', VarArrayOf([StrToInt(dblcTipoRelatCad.lookupValue), edExercicio.text, Format('%.2d', [cbPeriodo.ItemIndex])]), [])) then
  begin
    MsgDlg(MSG010, 'Informação', mtInformation, [mbOk], 0);
    Result := false;
  end;

end;

procedure TfrmCadSpedMT.edContaContabilChange(Sender: TObject);
begin
  inherited;
  if edContaContabil.Text <> '' Then
     cdsAnalitico.Locate('placonta', edContaContabil.text, [lopartialkey])
  else
     cdsAnalitico.first;
end;

procedure TfrmCadSpedMT.HabilitaControles(bStatus: boolean);
begin
  pnlDemonstrativo.enabled := not bStatus;

  pnlAtuValor.enabled      := bStatus;
  btnAtuDadosPJ.enabled    := bStatus;
  tsDadosIniciais.Enabled  := bStatus;
  tsInstituicao.Enabled    := bStatus;
  tsInfoJud.Enabled        := bStatus;
  tsDadosContrib.Enabled   := bStatus; //William Santana - SOL 155850-15363 KIN 2051763
  btnCancelar.Enabled      := bStatus; //William Santana - SOL 155850-15363 KIN 2051763
end;

procedure TfrmCadSpedMT.cdsSinteticoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(cdsSintetico.FieldByName('VALOR')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmCadSpedMT.cdsAnaliticoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(cdsAnalitico.FieldByName('VLRCREDITO')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(cdsAnalitico.FieldByName('VLRDEBITO')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(cdsAnalitico.FieldByName('TOTAL')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmCadSpedMT.cbxLinhaClick(Sender: TObject);
begin
  inherited;
  oCtrlSPED.AplicaRemoveFiltro(cdsAnalitico, '');
  if cbxLinha.itemIndex > 0 then
     oCtrlSPED.AplicaRemoveFiltro(cdsAnalitico, 'IDLINHA = '+IntToStr(LongInt(cbxLinha.Items.Objects[cbxLinha.ItemIndex])) );
end;


procedure TfrmCadSpedMT.PResponsavelValidaDados(Sender: TObject);
begin
  inherited;
  if MSResp.RetornouValor then
  begin
    cdsResponsavel.Data := oCtrlSPED.ListaResponsavel( StrtoInt(MSResp.ValoresChave[0]));
    PreencheDadosResponsavel( StrtoInt(MSResp.ValoresChave[0]) );
  end;
end;

procedure TfrmCadSpedMT.TEnderecoValidaDados(Sender: TObject);
begin
  inherited;
  if MSEnd.RetornouValor then
  begin
    cdsEndereco.Data := oCtrlSPED.BuscaEndereco( StrtoInt(MSEnd.ValoresChave[0]) );

    if not cdsEndereco.isEmpty then
    begin
      cdsEfdDetalhe.FieldByName('IDENDPESS').AsInteger  := cdsEndereco.FieldByName('IDENDERECO').AsInteger;
      cdsEfdDetalhe.FieldByName('ENDERECO').AsString    := cdsEndereco.FieldByName('ENDERECO').AsString;
      cdsEfdDetalhe.FieldByName('NUMERO').AsString      := cdsEndereco.FieldByName('NUMERO').AsString;
      cdsEfdDetalhe.FieldByName('BAIRRO').AsString      := cdsEndereco.FieldByName('BAIRRO').AsString;
      cdsEfdDetalhe.FieldByName('CEP').AsString         := cdsEndereco.FieldByName('CEP').AsString;
      cdsEfdDetalhe.FieldByName('CIDADE').AsString      := cdsEndereco.FieldByName('CIDADE').AsString;
      cdsEfdDetalhe.FieldByName('UF').AsString          := cdsEndereco.FieldByName('UF').AsString;
    end;
  end;
end;

procedure TfrmCadSpedMT.MSEndBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
begin
  inherited;
  sqlText := StringReplace(sqlText, ':IDPESSOA', cdsEfdDetalhe.FieldByName('IDFUNDACAO').AsString, []);
end;

procedure TfrmCadSpedMT.cdsDemonstraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pnlRecibo.Enabled   := not cdsDemonstra.IsEmpty;
  pnlExporta.Enabled  := not cdsDemonstra.IsEmpty;

  if cdsdemonstra.IsEmpty then
  begin
    cdsSintetico.data  := oCtrlSPED.ListaDadosSinteticos( -1 );
    cdsAnalitico.data  := oCtrlSPED.ListaDadosAnaliticos( -1 );
  end;

  TNumericField(cdsDemonstra.FieldByName('BASECALC')).DisplayFormat  := ',0.00;-,0.00';
  TNumericField(cdsDemonstra.FieldByName('VLRPIS')).DisplayFormat    := ',0.00;-,0.00';
  TNumericField(cdsDemonstra.FieldByName('VLRCOFINS')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmCadSpedMT.bbtnSairClick(Sender: TObject);
begin
  if cdsEfdDetalhe.State in [dsInsert, dsEdit] then
  begin
    if MsgDlg(Format(MSG008, [sPeriodo+'/'+sExercicio]), 'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      cdsEfdDetalhe.cancel;
    end
    else
       Abort;
  end;

  inherited;
end;

//Início - William Santana SOL - 155850-15363 KIN 2051763
procedure TfrmCadSpedMT.CarregaDadosContribuicao;
var
  i : byte;
  ComboAux : TComboBox;
  Dados    : OleVariant;

begin
  try
   ComboAux := TComboBox.create(self);

    for i := 1 to 2 do
    begin
      case i of
        1 : comboAux := cbbcodRFbPis;
        2 : comboAux := cbbCodRFbConfins;
      end;

      cdsAux.data := oCtrlSPED.ListaDadosContribuicao(i);

      while not cdsAux.Eof do
      begin
        ComboAux.Items.AddObject(cdsAux.Fields[1].AsString+'  '+cdsAux.Fields[0].AsString, TObject(cdsAux.Fields[1].AsInteger) );
        cdsAux.next;
      end;

      Dados := cdsAux.Data;
        case i of
          1 : cdsRFbPis.data    := Dados;
          2 : cdsRFbConfins.data  := Dados;
        end;
    end;

  finally
     ComboAux := nil;
     ComboAux.free;
  end;

end;
//Início - William Santana SOL - 233374 PPM 413667

procedure TfrmCadSpedMT.dblcCodRFBChange(Sender: TObject);
var
  iTag : byte;
  sValor : string;
begin
  // tag é usada para identificar o combo de opcoes
  if TComboBox(Sender).ItemIndex > -1 then
  begin
    iTag := TComboBox(Sender).Tag;

    sValor :=  Trim(Copy(TComboBox(Sender).text,0,6));

    case iTag of
      1 : cdsRFbPis.Locate('CODIDENTIFICADOR', sValor, []);
      2 : cdsRFbConfins.Locate('CODIDENTIFICADOR', sValor, []);  
    end;

  end;
end;



//Término - William Santana SOL - 233374 PPM 413667
//Término - William Santana SOL - 155850-15363 KIN 2051763

procedure TfrmCadSpedMT.CarregaOpcoesInfoAdicionais;
var
  i : byte;
  ComboAux : TComboBox;
  Dados    : OleVariant;
begin
  try
    ComboAux := TComboBox.create(self);
    for i := 1 to 9 do
    begin
      case i of
        1 : comboAux := dblcQualificaPJ;
        2 : comboAux := dblcTipoAtiv;
        3 : comboAux := dblcSitTributaria;
        4 : comboAux := dblcOriProcesso;
        5 : comboAux := dblcIncidencia;
        6 : comboAux := dblcApuraCredito;
        7 : comboAux := dblcTipoContrib;
        8 : comboAux := dblcCritEscritura;
        9 : comboAux := dblcNatAcao;
      end;

      cdsAux.data := oCtrlSPED.ListaOpcoes(i);

      while not cdsAux.Eof do
      begin
        ComboAux.Items.AddObject(cdsAux.Fields[1].AsString+'  '+cdsAux.Fields[0].AsString, TObject(cdsAux.Fields[1].AsInteger) );
        cdsAux.next;
      end;

      Dados := cdsAux.Data;
      case i of
        1 : cdsQualificaPJ.data    := Dados;
        2 : cdsTipoAtividade.data  := Dados;
        3 : cdsSitTributo.data     := Dados;
        4 : cdsOriProcesso.data    := Dados;
        5 : cdsIncidencia.data     := Dados;
        6 : cdsApropriaCred.data   := Dados;
        7 : cdsTipoContrib.data    := Dados;
        8 : cdsEscrituraApura.data := Dados;
        9 : cdsNaturezaAcao.data   := Dados;
      end;
    end;

   finally
     ComboAux := nil;
     ComboAux.free;
   end;
end;

procedure TfrmCadSpedMT.dblcQualificaPJChange(Sender: TObject);
var
  iTag : byte;
  iValor : integer;
  sValor : string;
begin
  // tag é usada para identificar o combo de opcoes
  if TComboBox(Sender).ItemIndex > -1 then
  begin
    iTag := TComboBox(Sender).Tag;
    iValor := Integer(TComboBox(Sender).Items.Objects[TComboBox(Sender).itemindex]);
    sValor :=  Trim(Copy(TComboBox(Sender).text,0,2));

    case iTag of
      1 : cdsQualificaPJ.Locate('CODIDENTIFICADOR', sValor, []);
      2 : cdsTipoAtividade.Locate('CODIDENTIFICADOR', iValor, []);
      3 : cdsSitTributo.Locate('CODIDENTIFICADOR', sValor, []);
      4 : cdsOriProcesso.Locate('CODIDENTIFICADOR', iValor, []);
      5 : cdsIncidencia.Locate('CODIDENTIFICADOR', iValor, []);
      6 : cdsApropriaCred.Locate('CODIDENTIFICADOR', iValor, []);
      7 : cdsTipoContrib.Locate('CODIDENTIFICADOR', iValor, []);
      8 : cdsEscrituraApura.Locate('CODIDENTIFICADOR', iValor, []);
      9 : cdsNaturezaAcao.Locate('CODIDENTIFICADOR', sValor, []);
    end;

    // incidencia tributaria
    if (iTag = 5) then
    begin
      dblcApuraCredito.enabled  := not (iValor = 2);
      dblcCritEscritura.enabled := (iValor = 2);

{      if iValor = 2 then
      begin
        dblcApuraCredito.enabled  := false;
        dblcCritEscritura.enabled := true;
      end
      else
      begin
        dblcApuraCredito.enabled  := true;
        dblcCritEscritura.enabled := false;
      end;}
    end;
  end;
end;

procedure TfrmCadSpedMT.dblcQualificaPJKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then  // apertou ESC
  begin
    TComboBox(Sender).ItemIndex := -1;
  end;
end;

procedure TfrmCadSpedMT.PreencheDadosInciais(const bLimpaDados : boolean);
begin
  if (not bLimpaDados) then
  begin
   if not(cdsEfdDetalhe.State in [dsInsert]) then    //William Santana - SOL 155850-15363 KIN 2051763
   begin
    if cdsEfdDetalhe.FieldByName('CODQUALIPESJUR').AsString <> '' then
       dblcQualificaPJ.ItemIndex := dblcQualificaPJ.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('CODQUALIPESJUR').AsInteger));
    if cdsEfdDetalhe.FieldByName('CODATIVIDADE').AsString <> '' then
       dblcTipoAtiv.itemIndex := dblcTipoAtiv.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('CODATIVIDADE').AsInteger));
    if cdsEfdDetalhe.FieldByName('CODSITTRIB').AsString <> '' then
       dblcSitTributaria.itemIndex := dblcSitTributaria.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('CODSITTRIB').AsInteger));
    if cdsEfdDetalhe.FieldByName('CODORIGEMPROCESSO').AsString <> '' then
       dblcOriProcesso.itemIndex := dblcOriProcesso.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('CODORIGEMPROCESSO').AsInteger));
    if cdsEfdDetalhe.FieldByName('CODINCIDTRIB').AsString <> '' then
       dblcIncidencia.itemIndex := dblcIncidencia.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('CODINCIDTRIB').AsInteger));
    if cdsEfdDetalhe.FieldByName('CODAPROPCRED').AsString <> '' then
       dblcApuraCredito.itemIndex := dblcApuraCredito.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('CODAPROPCRED').AsInteger));
    if cdsEfdDetalhe.FieldByName('CODCRITESCRIT').AsString <> '' then
       dblcCritEscritura.itemIndex := dblcCritEscritura.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('CODCRITESCRIT').AsInteger));
    if cdsEfdDetalhe.FieldByName('CODCONTRIBAPUR').AsString <> '' then
       dblcTipoContrib.itemIndex := dblcTipoContrib.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('CODCONTRIBAPUR').AsInteger));
    if cdsEfdDetalhe.FieldByName('NATUREZAACAO').AsString <> '' then
       dblcNatAcao.itemIndex := dblcNatAcao.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('NATUREZAACAO').AsInteger));

    //Início - William Santana - SOL 155850-15363 KIN 2051763
    if cdsEfdDetalhe.FieldByName('TIPOCONTRIBPISCONFINS').AsString <> '' then
       cbbtpContrib.itemIndex := RetornaIndex(cbbtpContrib,(cdsEfdDetalhe.FieldByName('TIPOCONTRIBPISCONFINS').AsString));
    if cdsEfdDetalhe.FieldByName('CODCONTRIBAPURADA').AsString <> '' then
       cbbCodContAp.itemIndex := RetornaIndex(cbbCodContAp,(cdsEfdDetalhe.FieldByName('CODCONTRIBAPURADA').AsString));
    if cdsEfdDetalhe.FieldByName('CODRFBPIS').AsString <> '' then
       cbbcodRFbPis.itemIndex := cbbcodRFbPis.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('CODRFBPIS').AsInteger));
    if cdsEfdDetalhe.FieldByName('CODRFBCONFINS').AsString <> '' then
       cbbCodRFbConfins.itemIndex := cbbCodRFbConfins.Items.IndexOfObject(TObject( cdsEfdDetalhe.FieldByName('CODRFBCONFINS').AsInteger));

    if cdsEfdDetalhe.FieldByName('NUMPROCESSO').AsString <> '' then
      sProcesso := cdsEfdDetalhe.FieldByName('NUMPROCESSO').AsString;
    if cdsEfdDetalhe.FieldByName('NUMPROCJUD').AsString <> '' then
      sProcJud  := cdsEfdDetalhe.FieldByName('NUMPROCJUD').AsString;
    if cdsEfdDetalhe.FieldByName('SECAOJUD').AsString <> '' then
      sSecaoJud := cdsEfdDetalhe.FieldByName('SECAOJUD').AsString;
    if cdsEfdDetalhe.FieldByName('VARA').AsString <> '' then
      sVara     := cdsEfdDetalhe.FieldByName('VARA').AsString;
    if cdsEfdDetalhe.FieldByName('DATASENTENCA').AsString <> '' then
      sDataSentenca := cdsEfdDetalhe.FieldByName('DATASENTENCA').AsString;
    if cdsEfdDetalhe.FieldByName('DESCRICAOJUD').AsString <> '' then
      sDecisao  := cdsEfdDetalhe.FieldByName('DESCRICAOJUD').AsString;
    if cdsEfdDetalhe.FieldByName('CRC').AsString <> '' then
      sCrc := cdsEfdDetalhe.FieldByName('CRC').AsString;

   end
    else
    begin // isso é para preencher os campo do tipo dbEdit quando o cdsEfdDetalhe estiver estiver em modo de inserção
     if sProcesso <> EmptyStr then
     cdsEfdDetalhe.FieldByName('NUMPROCESSO').AsString  := sProcesso;
     if sProcJud <> EmptyStr then
     cdsEfdDetalhe.FieldByName('NUMPROCJUD').AsString   := sProcJud;
     if sSecaoJud <> EmptyStr then
     cdsEfdDetalhe.FieldByName('SECAOJUD').AsString     := sSecaoJud;
     if sVara <> EmptyStr then
     cdsEfdDetalhe.FieldByName('VARA').AsString         := sVara;
     if sDataSentenca <> EmptyStr then
     cdsEfdDetalhe.FieldByName('DATASENTENCA').AsString := sDataSentenca;
     if sDecisao <> EmptyStr then
     cdsEfdDetalhe.FieldByName('DESCRICAOJUD').AsString := sDecisao;
     if sCrc <> EmptyStr then
     cdsEfdDetalhe.FieldByName('CRC').AsString          := sCrc;

    end;

    //Término - William Santana - SOL 155850-15363 KIN 2051763
  end
  else
  begin                         
    dblcQualificaPJ.itemIndex   := -1;
    dblcTipoAtiv.itemIndex      := -1;
    dblcSitTributaria.itemIndex := -1;
    dblcOriProcesso.itemIndex   := -1;
    dblcIncidencia.itemIndex    := -1;
    dblcApuraCredito.itemIndex  := -1;
    dblcTipoContrib.itemIndex   := -1;
    dblcCritEscritura.itemIndex := -1;
    dblcNatAcao.itemIndex       := -1;
    //Início - William Santana - SOL 155850-15363 KIN 2051763
    cbbtpContrib.itemIndex      := -1;
    cbbCodContAp.itemIndex      := -1;
    cbbcodRFbPis.itemIndex      := -1;
    cbbCodRFbConfins.itemIndex  := -1;
    sProcesso                   := '';
    sProcJud                    := '';
    sSecaoJud                   := '';
    sVara                       := '';
    sDataSentenca               := '';
    sDecisao                    := '';
    sCrc                        := '';

    //Término - William Santana - SOL 155850-15363 KIN 2051763
  end;
end;

procedure TfrmCadSpedMT.CarregaDadosRelatorio( iIdRelatorio, iIdNorma : integer);
var sMascaraConta: string;
begin
  sPeriodo   := cdsDemonstra.FieldByName('PERIODO').AsString;
  sExercicio := cdsDemonstra.FieldByName('EXERCICIO').AsString;

  cdsEfdDetalhe.Data := oCtrlSPED.ListaDadosDetalhe( iIdRelatorio );
  cdsSintetico.data  := oCtrlSPED.ListaDadosSinteticos( iIdRelatorio );
  cdsAnalitico.data  := oCtrlSPED.ListaDadosAnaliticos( iIdRelatorio );

  //Cássio Rovaroto - SIG nº 114455 - Início
  sMascaraConta:= oParametrosRelatorio.getMascaraContaPlanoVigente(StrToIntDef(sPeriodo,-1), StrToIntDef(sExercicio,-1));
  cdsAnalitico.FieldByName('PLACONTA').EditMask := sMascaraConta + ';0';
  edContaContabil.EditMask := sMascaraConta + ';0';
  //Cássio Rovaroto - SIG nº 114455 - Fim

  // CarregaLinhasAnaliticas( iIdNorma ); Felipe A. Santos SOL 244830/17209 PPM 796205 - comentado

  // Felipe A. Santos SOL 244830/17209 PPM 796205
  MSLinha.Filtro.Clear;
  MSLinha.Filtro.Add(' LR.IDLINHA = LXC.IDLINHA');
  MSLinha.Filtro.Add(' LXC.PLANO = PC.PLANO');
  MSLinha.Filtro.Add(' TRIM(LXC.PLACONTA) = TRIM(PC.PLACONTA)');
  MSLinha.Filtro.Add(' LR.IDNORMA = ' + IntToStr(iIdNorma));
  // Felipe A. Santos SOL 244830/17209 PPM 796205 - fim

  PreencheDadosInciais(true);
  PreencheDadosInciais();
end;

//Início - William Santana - SOL 155850-15363 KIN 2051763
procedure TfrmCadSpedMT.SetaCodRFBPisConfins(Sender: TObject);

begin
  inherited;

// 0  08 - Valor da contribuição não-cumulativa a recolher
// 1  12 - Valor da contribuição cumulativa a recolher
   if cbbtpContrib.Text <> ''  then
    sTipoContrib := copy(cbbtpContrib.Items.Strings[cbbtpContrib.ItemIndex], 1,2);

// 0   01 - Contribuição não-cumulativa apurada a alíquota básica
// 1   02 - Contribuição não-cumulativa apurada a alíquotas diferenciadas
// 2   03 - Contribuição não-cumulativa apurada a alíquota por unidade de medida de produto
// 3   04 - Contribuição não-cumulativa apurada a alíquota básica - Atividade Imobiliária
// 4   31 - Contribuição apurada por substituição tributária
// 5   32 - Contribuição apurada por substituição tributária - Vendas à Zona Franca de Manaus
// 6   51 - Contribuição cumulativa apurada a alíquota básica
// 7   52 - Contribuição cumulativa apurada a alíquotas diferenciadas
// 8   53 - Contribuição cumulativa apurada a alíquota por unidade de medida de produto
// 9   54 - Contribuição cumulativa apurada a alíquota básica - Atividade Imobiliária
// 10  71 - Contribuição apurada de SCP - Incidência Não Cumulativa
// 11  72 - Contribuição apurada de SCP - Incidência Cumulativa
// 12  99 - Contribuição para o PIS/Pasep - Folha de Salários

   if cbbCodContAp.Text <> '' then
     sCodigoApurado := copy(cbbCodContAp.Items.Strings[cbbCodContAp.ItemIndex], 1,2);
end;

function TfrmCadSpedMT.RetornaIndex (combo : TComboBox ; cod : string) : integer;
 var
   ComboAux : TComboBox;
   i: integer;
begin
    ComboAux := TComboBox.create(self);

    ComboAux := combo;
    result := -1;
    for i := 0 to ComboAux.items.Count do
      if cod = copy(ComboAux.Items.Strings[i], 1,2) then
      begin
        result := ComboAux.Items.indexoF(ComboAux.Items.Strings[i]);
        break;
      end;
end;

procedure TfrmCadSpedMT.CombosDropDown(Sender: TObject);
 var
   iWIDTH, i : integer ;
begin
  inherited;

  iWIDTH := 100;

  for i := 0 to Tcombobox(Sender).items.Count do
  begin
    if iWIDTH < Canvas.TextWidth(Tcombobox(Sender).Items.Strings[i]) then
    iWIDTH := Canvas.TextWidth(Tcombobox(Sender).Items.Strings[i]);
  end;

  Tcombobox(Sender).Perform(CB_SETDROPPEDWIDTH, iWIDTH + 10, 0);

end;

procedure TfrmCadSpedMT.btnCancelarClick(Sender: TObject);
begin

  inherited;
    HabilitaControles(false);
   // cdsSintetico.data  := oCtrlSPED.ListaDadosSinteticos( -1 );
   // cdsAnalitico.data  := oCtrlSPED.ListaDadosAnaliticos( -1 );
    rVlrDebito.Text := '0,00'; rVlrCredito.Text := '0,00';
    edContaContabil.Clear;
    cdsEfdDetalhe.cancel;
    edExercicio.Enabled  := true; cbPeriodo.Enabled := true;
    pgDados.ActivePage   := tbSintetico;
    cdsDemonstraAfterScroll(cdsDemonstra);
    sbtnGeraDemonstrativo.Down := False; // Felipe A. Santos SOL 244830/17209 PPM 796205
    LimpaPreviaDemons; // Felipe A. Santos SOL 244830/17209 PPM 796205
end;

//Término - William Santana - SOL 155850-15363 KIN 2051763


procedure TfrmCadSpedMT.btnAtualizaDadosClick(Sender: TObject);
var
  rVlrBase, rVlrReceita, rVlrExclusao, rVlrGeral, rVlrAcrescimo, rVlrReducao, rVlrBaseAjust: currency;
  sRef : string;
begin
  inherited;
  // Felipe A. Santos SOL 244830/17209 PPM 796205 - início

  if sbtnGeraDemonstrativo.Down then
  begin
    if cbPeriodo.ItemIndex < 10 then
       sRef := '0' + IntToStr(cbPeriodo.ItemIndex) + '/' + edExercicio.Text
    else
       sRef := IntToStr(cbPeriodo.ItemIndex) + '/' + edExercicio.Text;
  end
  else
      sRef := cdsDemonstra.FieldByName('PERIODO').AsString + '/' + cdsDemonstra.FieldByName('EXERCICIO').AsString;  
  // pega aliquota dos impostos
  oCtrlSPED.GetAliquotaImpostos( rAliquotaPis, rAliquotaCofins );

  // cálcula o valore base
  oCtrlSPED.CalculaValorBase(rVlrBase);

  //Cássio Rovaroto - SIG nº 72274 - Início
  oCtrlSPED.CalculaAcrescimo(rVlrAcrescimo);
  oCtrlSPED.CalculaReducao(rVlrReducao);

  //rVlrBase := rVlrBase - (rVlrAcrescimo + rVlrReducao);//Cássio Rovaroto - SIG nº 72274

  //Calcula a base ajustada
  rVlrBaseAjust := rVlrBase - (rVlrAcrescimo + rVlrReducao);
  //Cássio Rovaroto - SIG nº 72274 - Fim

  // Calcula os totais de receitas e exclusões
  oCtrlSPED.CalculaTotais(rVlrReceita, rVlrGeral, rVlrExclusao, False); 


  lblValRef.Caption := sRef;
  lblValReceita.Caption := FormatCurr('###,###,##0.00', rVlrReceita);
  lblValExclusao.Caption := FormatCurr('###,###,##0.00', rVlrExclusao);
  lblValBase.Caption := FormatCurr('###,###,##0.00', rVlrBaseAjust);
  //Cássio Rovaroto - SIG nº 72274 - Início
  lblVlrAcrescimos.Caption := FormatCurr('###,###,##0.00', Abs(rVlrAcrescimo));
  lblVlrReducoes.Caption := FormatCurr('###,###,##0.00', Abs(rVlrReducao));
  lblVlrBaseAjust.Caption := FormatCurr('###,###,##0.00', rVlrBase);
  //lblValPIS.Caption := FormatCurr('###,###,##0.00', rvlrBase * (rAliquotaPis/100));
  lblValPIS.Caption := FormatCurr('###,###,##0.00', rVlrBase * (rAliquotaPis/100));
  //lblValCOFINS.Caption := FormatCurr('###,###,##0.00', rvlrBase * (rAliquotaCofins/100));
  lblValCOFINS.Caption := FormatCurr('###,###,##0.00', rVlrBase * (rAliquotaCofins/100));
  //Cássio Rovaroto - SIG nº 72274 - Fim
  // Felipe A. Santos SOL 244830/17209 PPM 796205 - fim
end;

procedure TfrmCadSpedMT.cmprocLinhaValidaDados(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 244830/17209 PPM 796205 - início
  if MSLinha.RetornouValor then
  begin
     cmprocLinha.Text := MSLinha.ValoresChave[0];

     cdsAnalitico.Locate('COD_LINHA;PLACONTA', VarArrayOf([MSLinha.ValoresChave[0], MSLinha.ValoresChave[1]]), []);
  end;
  // Felipe A. Santos SOL 244830/17209 PPM 796205 - fim
end;

procedure TfrmCadSpedMT.sbtnExportarAnaliticoClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 244830/17209 PPM 796205 - início
  if not cdsAnalitico.IsEmpty then
  begin
    cdsAnalitico.DisableControls;
    qeDadosAnaliticos.Execute;

    cdsAnalitico.first;
    cdsAnalitico.EnableControls;
  end;
  // Felipe A. Santos SOL 244830/17209 PPM 796205 - fim
end;

procedure TfrmCadSpedMT.LimpaPreviaDemons;
begin
   // Felipe A. Santos SOL 244830/17209 PPM 796205 - início
   lblValRef.Caption := '00/0000';
   lblValReceita.Caption := '000.000.000,00';
   lblValExclusao.Caption := '000.000.000,00';
   lblValBase.Caption := '000.000.000,00';
   lblValPIS.Caption := '000.000.000,00';
   lblValCOFINS.Caption := '000.000.000,00';
   // Felipe A. Santos SOL 244830/17209 PPM 796205 - fim
   //Cássio Rovaroto -  SIG nº 72274 - Início
   lblVlrBaseAjust.Caption := '000.000.000,00';
   lblVlrAcrescimos.Caption := '000.000.000,00';
   lblVlrReducoes.Caption := '000.000.000,00';
   //Cássio Rovaroto -  SIG nº 72274 - Fim
end;

end.


