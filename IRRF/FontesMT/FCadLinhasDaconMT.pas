//******************************************************************************
//Rotina.............: FormCreate, btnGravarAlteracoesLinhaxCtaContabClick,
//                     MostraListaLinhasContabeis,   
//N. SIG.............: 114455
//Data da Alteração..: 16/03/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de função para recuperação de máscara de contas
//                     contábeis.
//******************************************************************************
//*******************************************************************************************************
//Rotina.............: ConfiguraContaContabBaseCalc, MarcarLinha  
//N. SIG.............: 72274
//Data da Alteração..: 21/01/2019
//Alteração Form.....: fCadLinhasDACONMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na parametrização de contas contábeis para as linhas da EFD-Contribuições.
//*******************************************************************************************************
//N. Sol..........: SOL 209775 e SOL 233732
//N. Kintana......: Kintana 2024254 e 233732
//Data............: 17/06/2014
//Responsável.....: Fernando Xavier
//Descrição.......: Na geração do arquivo da DIPJ está com erro ao gerar os campos.
//*******************************************************************************************************
//Responsável.....: Edilaine Ferraresi
//Data............: 26/08/2013
//N. Kintana......: 2051763
//N. Sol..........: 155850-15363
//Descrição.......: Inclusão da Funcionalidade SPED
//Rotina..........: .dfm (aumentar campo descricao_linha do cdsLinhasRelatxTipoDesemb)
//**********************************************************************************************************}
//N. Sol..........: SOL 206751
//N. Kintana......: ktn 1999210
//Data............: 13/05/2013
//Responsável.....: Thiago Melo
//Revisão.........:
//Descrição.......: Não grava alterações inclusoes de linhas de relatorio
//*******************************************************************************************************
//N. Sol..........: SOL 126124 / SOL 126125
//N. Kintana......: KTN 656907 / KTN 656908
//Data............: 20/04/2012
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre
//Descrição.......: Cadastro de Linhas para Relatório
//*******************************************************************************************************
Unit fCadLinhasDACONMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCDS, ComCtrls, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask, MskEdDlg, FtelaAut,
  uCtrlNormaVigente, uCtrlParametrosRelatorio, CMProcuraMask, DBClient,
  uCtrlLinhaRelatorio, uCtrlNaturezaLinha, uCMClientDataSet, uCmSqlParams,
  uCtrlTipoRelatorio, uCtrlLinhaxContaContabil, uCtrlCargoxRubrica,
  uCtrlLinhaxRubrica, uCmTypes, uMensErro, uModulo, wwdbedit, Wwdotdot,
  Wwdbcomb, uCmControlObject;

// ok
Const MSG003 = 'Não é possível promover modificações no padrão selecionado.' + #13 + 'Existe(m) relatório(s) associado(s)!';

Const MSG004 = 'Não existe relatório cadastrado para os critérios selecionados!';

Const MSG005 = 'Não é possível modificar a associação das linhas com as contas contábeis para o padrão selecionado.' + #13 +
  'Existe relatório gerado para esse padrão. Caso deseje modificar o padrão, o relatório deve ser excluído' + #13 +
    'ou um novo padrão deve ser cadastrado.';
  // ok
Const MSG007 = 'É obrigatório, pelo menos, a seleção de uma conta contábil para a associação !';
  // ok;
Const MSG008 = 'É obrigatória a seleção de uma linha de associação para a exclusão !';

Const MSG009 = 'Existem linhas associadas à contas contábeis para esse Relatório.';

Const MSG010 = 'Existem Relatórios gerados. A Exclusão não será possível !';

Const MSG011 = 'A linha selecionada está associada a contas contábeis e não poderá ser excluída !';

Const MSG012 = 'Existem relatórios gerados para a linha selecionada. A exclusão não será possível !';
  // ok
Const MSG013 = 'É obrigatório, pelo menos, a seleção de uma Rubrica para a associação !';
  // ok
Const MSG014 = 'É obrigatório, pelo menos, a seleção de uma Rubrica e um Desembolso para a associação !';
  // ok
Const MSG999 = 'Já existe uma linha com o código informado. Não é possível incluir a linha novamente !';

Const MSG015 = 'Já existe esta linha cadastrada no relacionamento LINHA X CONTA CONTÁBIL. Favor excluir antes este relacionamento !';
Const MSG016 = 'Já existe esta linha cadastrada no relacionamento LINHA X TIPO DE DESEMBOLSO. Favor excluir antes este relacionamento !';

Type
  TFrmCadLinhasDaconmt = Class(TfrmCadastroCDS)
    cmSqlCds: TCMSqlParams;
    cdsNatureza: TCMClientDataSet;
    cdsFiltroTipo: TCMClientDataSet;
    cdsVigencia: TCMClientDataSet;
    cdsContabil: TCMClientDataSet;
    dsContabil: TwwDataSource;
    cdsLinhaxConta: TCMClientDataSet;
    dsLinhaxConta: TwwDataSource;
    cdsContabilSELECAO: TFloatField;
    cdsContabilPLACONTA: TStringField;
    cdsContabilPLANOME: TStringField;
    cdsLinhaxContaIDASSOCIACAO: TFloatField;
    cdsLinhaxContaIDLINHA: TFloatField;
    cdsLinhaxContaPLANO: TFloatField;
    cdsLinhaxContaPLACONTA: TStringField;
    cdsLinhaxContaPLANOME: TStringField;
    cdsContabilPLANO: TFloatField;
    cmSqlLinhaxConta: TCMSqlParams;
    cdsFiltroNorma: TCMClientDataSet;
    cdsContabilBackup: TCMClientDataSet;
    gbFiltroCad: TGroupBox;
    lblTipoRelatCad: TLabel;
    lblNormaCad: TLabel;
    lblVigenciaCad: TLabel;
    sbtnLimparFiltros: TSpeedButton;
    dblcTipoRelatCad: TwwDBLookupCombo;
    dblcNormaCad: TwwDBLookupCombo;
    dblcDataInicio: TwwDBLookupCombo;
    cdsFiltroData: TCMClientDataSet;
    cdsCargo: TCMClientDataSet;
    dsCargo: TwwDataSource;
    cdsRubricas: TCMClientDataSet;
    dsRubricas: TwwDataSource;
    cdsCargoxRubrica: TCMClientDataSet;
    dsCargoxRubrica: TwwDataSource;
    cdsLinhasRelat: TCMClientDataSet;
    dsLinhasRelat: TwwDataSource;
    cdsTipoDesemb: TCMClientDataSet;
    dsTipoDesem: TwwDataSource;
    cdsLinhasRelatxTipoDesemb: TCMClientDataSet;
    dsLInhasRelatxTipoDesemb: TwwDataSource;
    cmSqlCargoxRubrica: TCMSqlParams;
    cdsRubricasBackup: TCMClientDataSet;
    cdsTipoDesembBackup: TCMClientDataSet;
    sqlLinhasRelatxTipoDesemb: TCMSqlParams;
    cdsLinRubricas: TCMClientDataSet;
    dsLinRubricas: TwwDataSource;
    pgLinhasDacom: TPageControl;
    tbLinha: TTabSheet;
    pnlDados: TPanel;
    pnlheader: TPanel;
    lblCodLinha: TLabel;
    lblDescricaoLinha: TLabel;
    lblNaturezaLinha: TLabel;
    edDescricaoLinha: TEdit;
    edCodLinha: TEdit;
    dblcNaturezaLinha: TwwDBLookupCombo;
    gbNorma: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sbInserir: TSpeedButton;
    sbAlterar: TSpeedButton;
    lblNorma: TLabel;
    lblTipoRelatorio: TLabel;
    lblInicioVigencia: TLabel;
    lblFimVigencia: TLabel;
    dbgrCds: TwwDBGrid;
    tbLinhaxCtaContab: TTabSheet;
    pnltop: TPanel;
    gbLinhasRelat: TGroupBox;
    dbgdLinhas: TwwDBGrid;
    gbContasContabeis: TGroupBox;
    pnlConta: TPanel;
    edContaContabil: TMaskEdit;
    dbgdContabil: TwwDBGrid;
    pnlbutton1: TPanel;
    pnlCtaContabxLinha: TPanel;
    pnlbtnCtaContabxLinha: TPanel;
    btnExcluirAssociacaoLinhaxContaContab: TBitBtn;
    gbCtaContabxLinha: TGroupBox;
    dbgLinhasContabeis: TwwDBGrid;
    tbCargoxRubr: TTabSheet;
    pnlTopCargoxRubricas: TPanel;
    gbCargo: TGroupBox;
    dbgdCargo: TwwDBGrid;
    gbRubricas: TGroupBox;
    dbgdRubricaCargo: TwwDBGrid;
    pnlTopbtnCargoxRubricas: TPanel;
    Label5: TLabel;
    pnlBottomCargoxRubricas: TPanel;
    pnlBottombtnCargoxRubricas: TPanel;
    btnExcluirAlteracoesCargoXRubrica: TBitBtn;
    gbCargoxRubricas: TGroupBox;
    dbgCargoxRubrica: TwwDBGrid;
    tbLinhasRelatXRubrXDesemb: TTabSheet;
    pnlTopLinhaxRubrxDesemb: TPanel;
    pnlTopLeftLinhaxRubrxDesemb: TPanel;
    gbLinhasRelatorio: TGroupBox;
    dbgLinhasRelatorio: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    gbDesembolso: TGroupBox;
    dbgdDesembolso: TwwDBGrid;
    pnlBottomLinhaRelatxRubrxDesemb: TPanel;
    pnlBottomBtnLinhaRelatxRubrxDesemb: TPanel;
    BtnExcluirAssociacaoLinhaRelatxRubrxDesemb: TBitBtn;
    gbLinhasxRubricasxDesemb: TGroupBox;
    edLocCargo: TEdit;
    Label6: TLabel;
    edLocLinha: TEdit;
    sbExcluir: TSpeedButton;
    Label7: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    CMSqlParams1: TCMSqlParams;
    cdsCargoxRubricaIDASSOCIACAO: TFloatField;
    cdsCargoxRubricaIDNORMA: TFloatField;
    cdsCargoxRubricaIDCARGO: TFloatField;
    cdsCargoxRubricaTITULO: TStringField;
    cdsCargoxRubricaIDPROVENTO: TFloatField;
    cdsCargoxRubricaDESCRICAO: TStringField;
    btnGravarAlteracoesCargoxRubrica: TBitBtn;
    Image4: TImage;
    Label8: TLabel;
    Image5: TImage;
    Label9: TLabel;
    edRubrica: TEdit;
    CMSqlCargo: TCMSqlParams;
    lblCategoria: TLabel;
    dblcTipoCategoria: TwwDBLookupCombo;
    cdsTipoCategoria: TCMClientDataSet;
    cmSqlLinhasRelat: TCMSqlParams;
    btnGravarAlteracoesLinhaxCtaContab: TBitBtn;
    BtnGravarAssociacaoLinhaRelatxRubrxDesemb: TBitBtn;
    Label10: TLabel;
    edPesqDesemb: TEdit;
    Image6: TImage;
    Image7: TImage;
    dbgLinhaxDesembolso: TwwDBGrid;
    cdsLinhasRelatxTipoDesembLINHA: TStringField;
    cdsLinhasRelatxTipoDesembDESCRICAO_LINHA: TStringField;
    cdsLinhasRelatxTipoDesembDESCRICAO_CATEGORIA: TStringField;
    cdsLinhasRelatxTipoDesembCDES: TStringField;
    cdsLinhasRelatxTipoDesembDESCRICAO_DESEMBOLSO: TStringField;
    cdsLinhasRelatxTipoDesembIDASSOCIACAO: TFloatField;
    cdsLinhasRelatxTipoDesembNORMA: TFloatField;
    cdsLinhasRelatxTipoDesembIDLINHA: TFloatField;
    sqlContabil: TCMSqlParams;
    cdsContabilPLANATUREZA: TStringField;
    cdsContabilNATUREZA: TStringField;
    Label11: TLabel;
    dblcTipoPlano: TwwDBLookupCombo;
    cdsTipoPlano: TCMClientDataSet;
    cdsTipoPlanoIDTIPOPLANO: TFloatField;
    cdsTipoPlanoDESCRICAO: TStringField;
    cdsLinhaxContaNATUREZA: TStringField;
    cdsContabilBackupPLANATUREZA: TStringField;
    cdsContabilBackupNATUREZA: TStringField;
    cdsLinhaxContaTIPOBASECALC: TFloatField;
    cdsLinhaxContaCODAJUSTE: TStringField;
    cdsLinhaxContaNUMPROCESSO: TStringField;
    cdsLinhaxContaDESCRAJUSTE: TStringField;
    cdsLinhaxContaINFOAJUSTE: TStringField;
    Procedure FormResize(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure cdsAfterScroll(DataSet: TDataSet);
    Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure pgLinhasDacomChanging(Sender: TObject; Var AllowChange: Boolean);
    Procedure btnExcluirAssociacaoLinhaxContaContabClick(Sender: TObject);
    Procedure btnGravarAlteracoesLinhaxCtaContabClick(Sender: TObject);
    Procedure sbInserirClick(Sender: TObject);
    Procedure edContaContabilChange(Sender: TObject);
    Procedure dbgdKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure dbgdDblClick(Sender: TObject);
    Procedure dbgdEnter(Sender: TObject);
    Procedure dbgdRowChanged(Sender: TObject);
    Procedure pgLinhasDacomChange(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure sbAlterarClick(Sender: TObject);
    Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
    Procedure edDescricaoLinhaKeyPress(Sender: TObject; Var Key: Char);
    Procedure dblcNormaCadChange(Sender: TObject);
    Procedure dblcNormaCadCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure dblcTipoRelatCadCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure dblcTipoRelatCadChange(Sender: TObject);
    Procedure sbtnLimparFiltrosClick(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure btnGravarAlteracoesCargoxRubricaClick(Sender: TObject);
    Procedure btnExcluirAlteracoesCargoXRubricaClick(Sender: TObject);
    Procedure edLocCargoChange(Sender: TObject);
    Procedure edLocLinhaChange(Sender: TObject);
    Procedure BtnGravarAssociacaoLinhaRelatxRubrxDesembClick(
      Sender: TObject);
    Procedure BtnExcluirAssociacaoLinhaRelatxRubrxDesembClick(
      Sender: TObject);
    Procedure sbExcluirClick(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure sbtnApagarClick(Sender: TObject);
    Procedure edRubricaChange(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure dblcTipoCategoriaChange(Sender: TObject);
    procedure edPesqDesembChange(Sender: TObject);
  Private
    Function CadastroNormaVigencia: Boolean;
    Function AbrirFormModal: integer;
    Procedure CarregaDadosNormaVigente;
    Procedure CriarCadastroVigencia;
    procedure CriarCadastroNatureza;                // Edilaine - SOL 155850-15363 / KTN 2051763
    function  ConfiguraNaturezaConta : boolean;     // Edilaine - SOL 155850-15363 / KTN 2051763
    Procedure AjustaValores;
    Procedure HabilitaCampos(bBloqueia: Boolean);
    Function ValidaNormaVigencia: Boolean;
    Function isExisteRelatorioImpresso: Boolean;
    Procedure MarcarLinha(Sender: TObject);
    Procedure MostraListaLinhasContabeis;
    Procedure MostraVigencia(Const bAtualizaFiltro: Boolean = False);
    Procedure AjustaDadosNorma;
    Procedure UpdateFields;
    Procedure RefreshDados(Sender: TObject);
    Procedure CarregarDadosGerais(Const pNorma: Integer = 0; pTipo: Integer = 0);
    Procedure ExcluirContasExistentes;
    Function ValidaCadastroLinha: Boolean;
    Procedure RefreshFiltros;
    Procedure AjustaTabSheets(Const bMostrar: Boolean);
    Procedure AjustaLInhas(Sender: TObject);
    Procedure MostraListaLinhasRubricas;
    Procedure MostraListaLinhasRubricasTipoDesemb;
    Procedure MostraListaLinhasTipoDesemb;
    Procedure ExcluirRubricasExistentes;
    Procedure ExcluirRubricasTipoDesembolsoExistentes;
    Procedure Limpalinha;
    procedure CriarCadastroContaContabBaseCalc;
    function  ConfiguraContaContabBaseCalc : Boolean;     // Cássio Rovaroto - SIG nº 72274
    { Private declarations }
  Protected
    { Public declarations }
    bIncluir: Boolean;
    lstSelect: tStringList;
    lstSelectDesemb: tStringList;
    lstFlagDesc : tStringList;
    oNormaVigente: TCtrlNormaVigente;
    oParametrosRelatorio: TCtrlParametrosRelatorio;
    oLinhaRelatorio: TCtrlLinhaRelatorio;
    oNatureza: TCtrlNaturezaLinha;
    oTipoRelatorio: TCtrlTipoRelatorio;
    oLinhaContabil: TCtrlLinhaxContaContabil;
    oCargoRubrica: TCtrlCargoxRubrica;
    oLinhaRubrica: TCtrlLinhaxRubrica;

  Public
    { Public declarations }
    pTpRel, pIdCategoriaOld, pIdCategoriaNew, IdLinhaDesemb, IdNormaDesemb: Integer;
    strCodTipRecDesDesemb : String;
    Function ExcluirLinhasDesemb(pIdLinha,  pIdNorma: Integer; pCodTipRecDes: String) : Boolean;


  End;

Var FrmCadLinhasDaconmt: TFrmCadLinhasDaconmt;

Implementation

Uses USistema, UDatabase, DBaseDados, fCadVigenciaMT, FCadNatContaContabil, FCadContaContabilBaseCalc;

{$R *.DFM}

Procedure TFrmCadLinhasDaconmt.FormResize(Sender: TObject);
Var pos: integer;
Begin
  Inherited;
  pos := (Self.ClientWidth Div 2);
  gbLinhasRelat.width := pos;
  PnlTop.Height := pos;
End;

Procedure TFrmCadLinhasDaconmt.FormCreate(Sender: TObject);
Begin
  Inherited;
  lstSelect := tStringList.Create;
  lstSelectDesemb := TStringList.Create;
  lstFlagDesc := tStringList.Create;
  lstSelect.Clear;
  lstFlagDesc.Clear;
  lstSelectDesemb.Clear;
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
  oNatureza := TCtrlNaturezaLinha.Create;
  oNatureza.Initialize(DtmBaseDados.dbBaseDados,
    True,
    Sistema.ConnectionType,
    Sistema.ConnectionSide,
    Sistema.AppRemoteServer,
    True,
    Nil,
    Nil,
    False);

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

  oLinhaContabil := TCtrlLinhaxContaContabil.Create;
  oLinhaContabil.Initialize(DtmBaseDados.dbBaseDados,
    True,
    Sistema.ConnectionType,
    Sistema.ConnectionSide,
    Sistema.AppRemoteServer,
    True,
    Nil,
    Nil,
    False);
  oCargoRubrica := TCtrlCargoxRubrica.Create;
  oCargoRubrica.Initialize(DtmBaseDados.dbBaseDados,
    True,
    Sistema.ConnectionType,
    Sistema.ConnectionSide,
    Sistema.AppRemoteServer,
    True,
    Nil,
    Nil,
    False);

  oLinhaRubrica := TCtrlLinhaxRubrica.Create;
  oLinhaRubrica.Initialize(DtmBaseDados.dbBaseDados,
    True,
    Sistema.ConnectionType,
    Sistema.ConnectionSide,
    Sistema.AppRemoteServer,
    True,
    Nil,
    Nil,
    False);

  pgLinhasDacom.ActivePageIndex := 0;
  oLinhaRelatorio.CdsLinhaRelatorio := CDS;
  oLinhaRelatorio.CdsContabil := cdsContabil;
  oLinhaRelatorio.CdsContabilBackup := cdsContabilBackup;
  oLinhaRelatorio.cdsLinhaxConta := cdsLinhaxConta;
  oLinhaRelatorio.NormaVigente := oNormaVigente;
  oLinhaRelatorio.TipoRelatorio := oTipoRelatorio;

  oLinhaContabil.CdsLinhaXContaContabil := cdsLinhaxConta;
  oLinhaContabil.CdsContabil := cdsContabil;

  oCargoRubrica.CdsCargoxRubrica := cdsCargoxRubrica;
  oCargoRubrica.CdsRubrica := cdsRubricas;
  oCargoRubrica.CdsRubricaBackup := cdsRubricasBackup;

  oLinhaRubrica.CdsLinhaxRubrica := cdsLinhasRelatxTipoDesemb;
  oLinhaRubrica.CdsRubrica := cdsLinRubricas;
  oLinhaRubrica.CdsRubricaBackup := cdsRubricasBackup;
  oLinhaRubrica.CdsTipoDesemb := CdsTipoDesemb;
  oLinhaRubrica.CdsTipoDesembBackup := CdsTipoDesembBackup;

  RefreshFiltros();
  cdsNatureza.Data := oNatureza.ListNaturezaLinha();
  cdsTipoCategoria.Data := oNatureza.ListTipoCategoria();

  cdsTipoPlano.Data :=  oLinhaRelatorio.ListaTipoPlano();  // Edilaine - SOL 155850-15363 / KTN 2051763

  //CarregarDadosGerais(0, 0);          // Edilaine - SOL 155850-15363 / KTN 2051763
  //MostraListaLinhasContabeis();
  dblcTipoRelatCad.text := 'DACON';

  edContaContabil.EditMask := oParametrosRelatorio.getMascaraContaPlanoVigente + ';0'; //Cássio Rovaroto - SIG nº 114455
End;

Procedure TFrmCadLinhasDaconmt.CmeCadastroInsert(Sender: TObject);
Begin
  // Thiago Melo SOL 206751 ktn 1999210
  HabilitaCampos(True);
  Inherited;
  AjustaValores();
  LimpaLinha();
  edCodLinha.SetFocus;

{  If ValidaNormaVigencia Then
  Begin
    Inherited;
    AjustaValores();
    LimpaLinha();
    edCodLinha.SetFocus;
  End;}
  // Thiago Melo SOL 206751 ktn 1999210
End;

Procedure TFrmCadLinhasDaconmt.Limpalinha();
Begin
  edCodLinha.Text := '';
  edDescricaoLinha.Text := '';
  dblcNaturezaLinha.Text := '';
  dblcTipoCategoria.Text := '';
  dblcTipoPlano.Text := '';    // Edilaine - SOL 155850-15363 / KTN 2051763
End;

Procedure TFrmCadLinhasDaconmt.MostraVigencia(Const bAtualizaFiltro: Boolean = False);
Begin
  lblNorma.Caption := oNormaVigente.Descricao;
  lblTipoRelatorio.Caption := oNormaVigente.DescricaoTipo;
  If oNormaVigente.DataInicio = 0 Then
    lblInicioVigencia.Caption := ''
  Else
    lblInicioVigencia.Caption := DateToStr(oNormaVigente.DataInicio);
  If oNormaVigente.DataFim = 0 Then
    lblFimVigencia.Caption := ''
  Else
    lblFimVigencia.Caption := DateToStr(oNormaVigente.DataFim);
  If bAtualizaFiltro Then
    Begin
      cdsFiltroNorma.Data := oNormaVigente.SelecionaNormaVigenteFiltro(oNormaVigente.IdTipo);
      cdsFiltroData.Data := oNormaVigente.selecionaNormaVigenteData(oNormaVigente.IdTipo);
      CarregarDadosGerais(oNormaVigente.IdNorma, oNormaVigente.IdTipo);
      dblcTipoRelatCad.Text := oNormaVigente.DescricaoTipo;
      RefreshDados(dblcNormaCad);
    End;
End;

Procedure TFrmCadLinhasDaconmt.AjustaValores();
Begin
  cds.FieldByName('Norma').asString := oNormaVigente.Descricao;
  cds.FieldByName('IdNorma').asInteger := oNormaVigente.IdNorma;
  cds.FieldByName('IdTipo').asInteger := oNormaVigente.IdTipo;
  cds.FieldByName('TipoRelatorio').asString := oNormaVigente.DescricaoTipo;
  cds.FieldByName('DataInicio').asDatetime := oNormaVigente.DataInicio;
End;

Function TFrmCadLinhasDaconmt.ValidaNormaVigencia: Boolean;
Begin
  Result := Not IsExisteRelatorioImpresso();
  If Not Result Then
    MsgDlg(MSG003, 'Erro', mtError, [mbOk], 0);
End;

Function TFrmCadLinhasDaconmt.CadastroNormaVigencia: Boolean;
Begin
  Result := (AbrirFormModal = mrOk);
End;

Function TFrmCadLinhasDaconmt.AbrirFormModal: integer;
Begin
  CriarCadastroVigencia();
  If frmCadNormaVigencia.FormStyle <> fsNormal Then
    Begin
      frmCadNormaVigencia.FormStyle := fsNormal;
      frmCadNormaVigencia.Visible := false;
    End;
  CarregaDadosNormaVigente();

  FrmCadNormaVigencia.bIncluir := bIncluir;

  Result := frmCadNormaVigencia.ShowModal;
  frmCadNormaVigencia.Release;
End;

Procedure TFrmCadLinhasDaconmt.CarregaDadosNormaVigente();
Begin
  If Not bIncluir Then
    Begin
      frmCadNormaVigencia.edNome.Text := oNormaVigente.Descricao;
      frmCadNormaVigencia.dedVigencia.Date := oNormaVigente.DataInicio;
      frmCadNormaVigencia.dbclTipoRelat.Text := oNormaVigente.DescricaoTipo;
    End;
End;

Procedure TFrmCadLinhasDaconmt.RefreshFiltros();
Begin
  cdsFiltroTipo.Data := oTipoRelatorio.ListTipoRelatorio;
  cdsFiltroNorma.Data := oNormaVigente.SelecionaNormaVigenteFiltro(-1);
  cdsFiltroData.Data := oNormaVigente.SelecionaNormaVigenteData(-1);
End;

Procedure TFrmCadLinhasDaconmt.CarregarDadosGerais(Const pNorma: Integer = 0; pTipo: Integer = 0);
Begin
  // RN001
//  cds.data := oLinhaRelatorio.ListLinhaRelatorioVigente(pNorma, pTipo, pTpRel);  //Baruc
  cds.data := oLinhaRelatorio.ListLinhaRelatorioVigente(pNorma, pTipo, pTpRel);
  //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
  cdsVigencia.Data := oNormaVigente.SelecionaNormaVigenteAtual(pNorma, pTipo);
  //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908

  cdsContabil.Data := oLinhaContabil.CarregarListaPlanoContas;
  cdsContabilBackup.CloneCursor(cdsContabil, false, true);              // Edilaine - SOL 155850-15363 / KTN 2051763
  //cdsContabilBackup.Data := oLinhaContabil.CarregarListaPlanoContas;  // Edilaine - SOL 155850-15363 / KTN 2051763

  // Edilaine - SOL 155850-15363 / KTN 2051763 - inicio
  //If dblcTipoRelatCad.Text = 'DIPJ' Then   // SOL 209775 e SOL 233732
  begin
    cdsCargo.Data := oCargoRubrica.CarregarListaCargos;
    cdsRubricas.Data := oCargoRubrica.CarregarListaRubricas;
    cdsLinRubricas.CloneCursor(cdsRubricas, false, true);
    cdsRubricasBackup.CloneCursor(cdsRubricas, false, true);
    cdsTipoDesemb.Data := oLinhaRubrica.CarregarListaTipDes;
    cdsTipoDesembBackup.CloneCursor(cdsTipoDesemb, false, true);
    //cdsTipoDesembBackup.Data := oLinhaRubrica.CarregarListaTipDes;
    //cdsLinRubricas.Data := oCargoRubrica.CarregarListaRubricas;
    //cdsRubricasBackup.Data := oCargoRubrica.CarregarListaRubricas;
  end;
  // Edilaine - SOL 155850-15363 / KTN 2051763 - fim

   cdsLinhasRelat.CloneCursor(cds, false, true);                                        // Edilaine - SOL 155850-15363 / KTN 2051763
  //cdsLinhasRelat.data := oLinhaRelatorio.ListLinhaRelatorioVigente(pNorma, pTipo);   // Edilaine - SOL 155850-15363 / KTN 2051763

  AjustaDadosNorma();

  cmeCadastro.Operacao := opIdle;
  HabilitaCampos(False);

  If pNorma <> 0 Then
    Begin
      lblNorma.Caption := CdsVigencia.FieldByName('Descricao').asString;
      lblTipoRelatorio.Caption := CdsVigencia.FieldByName('DescricaoTipo').asString;
      If CdsVigencia.FieldbyName('DataInicio').asDateTime = 0 Then
        lblInicioVigencia.Caption := ''
      Else
        Begin
          lblInicioVigencia.Caption := CdsVigencia.FieldbyName('DataInicio').AsString;
          dblcDataInicio.text := CdsVigencia.FieldByName('datainicio').asString;
        End;
      If CdsVigencia.FieldbyName('DataFim').asDateTime = 0 Then
        lblFimVigencia.Caption := ''
      Else
        lblFimVigencia.Caption := CdsVigencia.FieldbyName('DataFIM').AsString;
    End
  Else
    Begin
      lblNorma.Caption := CdsVigencia.FieldByName('Descricao').asString;
      lblTipoRelatorio.Caption := CdsVigencia.FieldByName('DescricaoTipo').asString;

      If (CdsVigencia.FieldbyName('DataInicio').asstring = '31/12/1899') Then
        lblInicioVigencia.Caption := EmptyStr
      Else
        lblInicioVigencia.Caption := CdsVigencia.FieldbyName('DataInicio').asstring;

      If (CdsVigencia.FieldbyName('DataFIM').AsString = '31/12/1899') Then
        lblFimVigencia.Caption := EmptyStr
      Else
        lblFimVigencia.Caption := CdsVigencia.FieldbyName('DataFIM').AsString;
    End;
  sbExcluir.Enabled := (pNorma <> 0) Or oNormaVigente.IsExcluirNormaVigente(pNorma);
  CmeCadastroAtualizaBotoes(Nil);


  If dblcTipoRelatCad.Text = 'DIPJ' Then  // Edilaine - SOL 155850-15363 / KTN 2051763
     cdsLinhasRelatxTipoDesemb.Data := oLinhaRubrica.ProcurarLinhaxDesemb(cdsLinhasRelat.FieldByName('IdLinha').asInteger, cdsLinhasRelat.FieldByName('IdNorma').asInteger);
End;

Procedure TFrmCadLinhasDaconmt.AjustaDadosNorma;
Begin
  oNormaVigente.Descricao := cdsVigencia.FieldByName('Descricao').asString;
  oNormaVigente.IdNorma := cdsVigencia.FieldByName('IdNorma').asInteger;
  oNormaVigente.IdTipo := cdsVigencia.FieldByName('IdTipo').asInteger;
  oNormaVigente.DescricaoTipo := cdsVigencia.FieldByName('DescricaoTipo').asString;
  oNormaVigente.DataInicio := cdsVigencia.FieldByName('DataInicio').asDateTime;
  oNormaVigente.DataFim := cdsVigencia.FieldByName('DataFim').asDateTime;
End;

Procedure TFrmCadLinhasDaconmt.CriarCadastroVigencia();
Begin
  //   Application.CreateForm(TfrmCadNormaVigencia, frmCadNormaVigencia);
  AbrirForm(frmCadNormaVigencia, TfrmCadNormaVigencia, False); //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
  frmCadNormaVigencia.oNormaVigente := oNormaVigente;
  frmCadNormaVigencia.oTipoRelatorio := oTipoRelatorio;
  frmCadNormaVigencia.oParametrosRelatorio := oParametrosRelatorio;
  frmCadNormaVigencia.cdsVigencia.Data := oParametrosRelatorio.ListParametrosRelatorio;
  frmCadNormaVigencia.cdsTipoRelatorio.Data := oTipoRelatorio.ListTipoRelatorio;
End;

Procedure TFrmCadLinhasDaconmt.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  FreeAndNil(lstSelect);
  FreeAndNil(lstFlagDesc);
  FreeAndNil(lstSelectDesemb);
  FreeAndNil(oNormaVigente);
  FreeAndNil(oParametrosRelatorio);
  FreeAndNil(oLinhaRelatorio);
  FreeAndNil(oNatureza);
  FreeAndNil(oTipoRelatorio);
  FreeAndNil(oLinhaContabil);
  FreeAndNil(oCargoRubrica);
  FreeAndNil(oLinhaRubrica);
  Inherited;
End;

Procedure TFrmCadLinhasDaconmt.CmeCadastroConfirma(Sender: TObject);
Begin
  cds.data := oLinhaRelatorio.ListLinhaRelatorioVigente;
  CmeCadastro.Cancel(Self);
End;

Procedure TFrmCadLinhasDaconmt.CmeCadastroCancel(Sender: TObject);
Begin
  HabilitaCampos(False);
  CMeCadastro.operacao := opIdle;
  Inherited;
End;

Procedure TFrmCadLinhasDaconmt.cdsAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  edCodLinha.Text := cds.FieldByName('COD_LINHA').asString;
  edDescricaoLinha.Text := cds.FieldByName('DescricaoLinha').asString;
  dblcNaturezaLinha.Text := cds.FieldByName('NaturezaLinha').asString;
  dblcTipoCategoria.Text := cds.FieldByName('CATEGORIA').asString;
  dblcTipoPlano.Text     := cds.FieldByName('TipoPlano').AsString;  // Edilaine - SOL 155850-15363 / KTN 2051763
  
  // Thiago Melo SOL 206751 ktn 1999210
//  pIdCategoriaOld := cds.FieldByName('idcategoria').asInteger;
  pIdCategoriaOld := cds.FieldByName('idtipodecategoria').asInteger;
  // Thiago Melo SOL 206751 ktn 1999210

End;

Procedure TFrmCadLinhasDaconmt.CmeCadastroApplyEdit(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  if ValidaCadastroLinha then   // Edilaine - SOL 155850-15363 / KTN 2051763
  begin
    UpdateFields();
    oLinhaRelatorio.AlterarDados(cds.FieldByName('IdLinha').asInteger, pIdCategoriaOld);
  end;
  CmeCadastro.Cancel(Self);
End;

Function TFrmCadLinhasDaconmt.isExisteRelatorioImpresso: Boolean;
Begin
  //  Result := False;
  Result := oLinhaRelatorio.ExisteRelatorioImpresso(oNormaVigente.IdNorma);
End;

Procedure TFrmCadLinhasDaconmt.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;
  // Thiago Melo SOL 206751 ktn 1999210
{  If IsExisteRelatorioImpresso() Then
    MsgDlg(MSG003, 'Erro', mtError, [mbOk], 0)
  Else
    Begin
      HabilitaCampos(True);
      edCodLinha.SetFocus;
    End;   }
  HabilitaCampos(True);
  edCodLinha.SetFocus;
  // Thiago Melo SOL 206751 ktn 1999210
End;

Procedure TFrmCadLinhasDaconmt.HabilitaCampos(bBloqueia: Boolean);
Begin
  edCodLinha.enabled := bBloqueia;
  edDescricaoLinha.enabled := bBloqueia;
  dblcNaturezaLinha.enabled := bBloqueia;
  dblcTipoCategoria.enabled := bBloqueia;
  dblcTipoPlano.enabled     := bBloqueia;  // Edilaine - SOL 155850-15363 / KTN 2051763
  gbFiltroCad.Enabled := Not bBloqueia;
  pgLinhasDacom.ActivePage := tbLinha;
End;

Procedure TFrmCadLinhasDaconmt.pgLinhasDacomChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
  Inherited;
  If pgLinhasDacom.ActivePageIndex = 0 Then // Linhas do Relatorio
    Begin
      If (CmeCadastro.operacao In [opInserir, opAlterar]) Then
        Begin
          allowChange := MsgDlg('Existem dados não gravados no Cadastro!' + #13#10 +
            'Deseja perder as alterações?', 'Erro', mtError, [mbYes, mbNo], 0) = idYes;
        End;
    End;
End;

Procedure TFrmCadLinhasDaconmt.btnExcluirAssociacaoLinhaxContaContabClick(Sender: TObject);
Begin
  Inherited;
  If isExisteRelatorioImpresso Then
    MsgDlg(MSG003, 'Erro', mtError, [mbOk], 0)
  Else
    Begin
      If dbgLinhasContabeis.Selected.Count = 0 Then
        MsgDlg(MSG008, 'Erro', mtError, [mbOk], 0)
      Else
        oLinhaRelatorio.ExcluirLinhasAssociadas(cds.FieldByName('COD_LINHA').asString,
          oNormaVigente.IdNorma,
          cdsLinhaxConta.fieldByName('IdAssociacao').asInteger);
      cdsLinhaxConta.Delete;
      btnExcluirAssociacaoLinhaxContaContab.Enabled := Not cdsLinhaxConta.IsEmpty;
    End;
End;

Procedure TFrmCadLinhasDaconmt.btnGravarAlteracoesLinhaxCtaContabClick(Sender: TObject);
Var idLinha: Integer;
Begin
  Inherited;
  If isExisteRelatorioImpresso Then
    MsgDlg(MSG003, 'Erro', mtError, [mbOk], 0)
  Else
    Begin
      If lstSelect.Count = 0 Then
        MsgDlg(MSG007, 'Erro', mtError, [mbOk], 0)
      Else
        Begin
          edContaContabil.Text := '';
          idLinha := cds.FieldByName('IdLinha').asInteger;
          if oLinhaContabil.ExisteLinhaDesembolso(idLinha) then
            begin
              MsgDlg(MSG016, 'Erro', mtError, [mbOk], 0)
            end
          else
            begin
              If oLinhaContabil.GravarLinhasAssociadas(idLinha, lstSelect) Then
                Begin
                  lstSelect.Clear;
                  lstFlagDesc.Clear;
                  cdsLinhaxConta.data := oLinhaContabil.ProcurarLinhaxContaContabil(idLinha);
                  cdsContabilPLACONTA.EditMask := oParametrosRelatorio.getMascaraContaPlanoVigente + ';0'; //Cássio Rovaroto - SIG nº 114455
                  btnExcluirAssociacaoLinhaxContaContab.Enabled := Not cdsLinhaxConta.IsEmpty;
                End;
            end;
        End;
    End;
End;

Procedure TFrmCadLinhasDaconmt.sbInserirClick(Sender: TObject);
Var cdsLinhaContabil: TCMClientDataSet;
  cdsNovoLinhaCont: TCMClientDataSet;
Begin
  bIncluir := True;

  If CadastroNormaVigencia Then
    Begin
      If oLinhaRelatorio.InserirNormaVigente Then
        Begin

          cdsVigencia.Data := oNormaVigente.SelecionaNormaVigenteAtual;
          //MARCIO SANCHES SPINOSA
          oLinhaRelatorio.pintIDNormaNova := cdsVigencia.FieldByName('IDNORMA').AsInteger;
          oLinhaRelatorio.InserirLinhasNovaNorma;
          //MARCIO SANCHES SPINOSA
          MostraVigencia;

          // RefreshFiltros();
          dblcTipoRelatCad.Text := 'DACON';
          RefreshDados(dblcTipoRelatCad);

        End;
    End;

End;

Procedure TFrmCadLinhasDaconmt.edContaContabilChange(Sender: TObject);
Begin
  Inherited;
  If edContaContabil.Text <> '' Then
    cdsContabil.Locate('placonta', edContaContabil.text, [lopartialkey])
  Else
    cdsContabil.first;
End;

Procedure TFrmCadLinhasDaconmt.dbgdKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  Inherited;
  If Key = 32 Then
    MarcarLinha(Sender)
End;

Procedure TFrmCadLinhasDaconmt.dbgdDblClick(Sender: TObject);
Begin
  Inherited;
  MarcarLinha(Sender);
End;

Procedure TFrmCadLinhasDaconmt.MarcarLinha(Sender: TObject);
Var sChave: String;
  //--------------------------------------------------------------
  Procedure EditaRegistro(Const oCds: TCmClientDataSet;
    Const pChave: String;
    Const pLista: TStringList);
  Var iPos: Integer;
  Begin
    oCds.Edit;
    If oCds.FieldByName('Selecao').AsInteger = 1 Then
      Begin
        iPos := pLista.IndexOf(pChave);
        If iPos > 0 Then
          pLista.Delete(iPos);
        oCds.FieldByName('Selecao').AsInteger := 0
      End
    Else
      Begin
        pLista.Add(pChave);
        oCds.FieldByName('Selecao').AsInteger := 1;
      End;
    oCds.Post;
  End;
  //--------------------------------------------------------------
Begin
  If Sender = dbgdContabil Then
    Begin
      // Edilaine - SOL 155850-15363 / KTN 2051763 - inicio
      if (cdsContabil.FieldByName('Selecao').AsInteger = 0) and (cdsContabil.FieldByName('PLANATUREZA').AsString = 'N') then
        if not ConfiguraNaturezaConta() then
           exit;
      // Edilaine - SOL 155850-15363 / KTN 2051763 - fim

      //Cássio Rovaroto - SIG nº 72274 - Início
      if (cdsContabil.FieldByName('Selecao').AsInteger = 0) then
      begin
        if not ConfiguraContaContabBaseCalc() then
          Exit;
      end;
      //Cássio Rovaroto - SIG nº 72274 - Fim

      sChave := Format('%.3d-%s-%s', [cdsContabil.FieldByName('Plano').asInteger, cdsContabil.FieldByName('PLANATUREZA').AsString, // Edilaine - SOL 155850-15363 / KTN 2051763
        cdsContabil.FieldByName('PlaConta').asString]);
      EditaRegistro(cdsContabil, sChave, lstSelect);

    End
  Else If (Sender = dbgdRubricaCargo) Then
    Begin
      sChave := Format('%.10d-%s', [cdsRubricas.FieldByName('IdProvento').asInteger,
        cdsRubricas.FieldByName('Descricao').asString]);
      EditaRegistro(cdsRubricas, sChave, lstSelect);

      {
      sChave :=  Format('%.10d-%s', [cdsRubricas.FieldByName('IdProvento').asInteger,
        IntToStr(cdsRubricas.FieldByName('flgdesconto').asInteger)]);
      EditaRegistro(cdsRubricas, sChave, lstFlagDesc);
      }

    End
  {
  Else If (Sender = dbgdRubricaLinhaRelatorio) Then
    Begin
      sChave := Format('%.10d-%s', [cdsLinRubricas.FieldByName('IdProvento').asInteger,
        cdsLinRubricas.FieldByName('Descricao').asString]);
      EditaRegistro(CdsLinRubricas, sChave, lstSelect);
    End
  }
  Else If Sender = dbgdDesembolso Then
    Begin
      sChave := Format('%s - %s', [cdsTipoDesemb.FieldByName('CodTipRecDes').asString,
        cdsTipoDesemb.FieldByName('Descricao').asString]);
      EditaRegistro(CdsTipoDesemb, sChave, lstSelectDesemb);
    End;
End;

Procedure TFrmCadLinhasDaconmt.dbgdEnter(Sender: TObject);
Begin
  Inherited;
  AJustaLinhas(Sender);
End;

Procedure TFrmCadLinhasDaconmt.dbgdRowChanged(Sender: TObject);
Begin
  Inherited;
  AjustaLinhas(Sender);
End;

Procedure TFrmCadLinhasDaconmt.AjustaLinhas(Sender: TObject);
Begin
  If Sender = dbgdLinhas Then
    MostraListaLinhasContabeis()
  Else If Sender = dbgdCargo Then
    MostraListaLinhasRubricas()
  Else If Sender = dbgLinhasRelatorio Then
    //MostraListaLinhasRubricasTipoDesemb()
    MostraListaLinhasTipoDesemb();
End;

Procedure TFrmCadLinhasDaconmt.MostraListaLinhasContabeis();
var sMascaraConta: string;
Begin
  cdsLinhaxConta.Data := oLinhaContabil.ProcurarLinhaxContaContabil(cds.FieldByName('IdLinha').asInteger);
  //Cássio Rovaroto - SIG nº 114455 - Início
  sMascaraConta := oParametrosRelatorio.getMascaraContaPlanoVigente() + ';0';
  cdsContabilPLACONTA.EditMask := sMascaraConta;
  cdsLinhaxContaPLACONTA.EditMask := sMascaraConta;
  //Cássio Rovaroto - SIG nº 114455 - Fim
  lstSelect.Clear;
  lstFlagDesc.Clear;
  cdsContabil.Close;
  //cdsContabilBackup.data := oLinhaContabil.CarregarListaPlanoContas;   // Edilaine - SOL 155850-15363 / KTN 2051763
  cdsContabil.Data := cdsContabilBackup.Data;                            // Edilaine - SOL 155850-15363 / KTN 2051763
  ExcluirContasExistentes;
  btnExcluirAssociacaoLinhaxContaContab.Enabled := Not cdsLinhaxConta.IsEmpty;
End;

Procedure TFrmCadLinhasDaconmt.MostraListaLinhasRubricas();
Begin
  cdsCargoxRubrica.Data := oCargoRubrica.ProcurarCargoxRubrica(oNormaVigente.IdNorma,
    cdsCargo.FieldByName('idCargo').asInteger);
  lstSelect.Clear;
  lstFlagDesc.Clear;
  cdsRubricas.Close;
  cdsRubricas.Data := cdsRubricasBackup.Data;
  ExcluirRubricasExistentes;
  btnExcluirAlteracoesCargoXRubrica.Enabled := Not cdsCargoxRubrica.IsEmpty;
End;

Procedure TFrmCadLinhasDaconmt.MostraListaLinhasRubricasTipoDesemb();
Begin
//  cdsLinhasRelatxTipoDesemb.Data := oLinhaRubrica.ProcurarLinhaxRubrica(cds.FieldByName('IdLinha').asInteger);
  cdsLinhasRelatxTipoDesemb.Data := oLinhaRubrica.ProcurarLinhaxDesemb(cds.FieldByName('IdLinha').asInteger, cds.FieldByName('IdNorma').asInteger);
  lstSelect.Clear;
  lstSelectDesemb.Clear;
  lstFlagDesc.Clear;

  // ExcluirContasExistentes;
//   BtnExcluirAssociacaoLinhaRelatxRubrxDesemb.Enabled := Not cdsLinhaxConta.IsEmpty; //baruc 05/09/2012
End;


Procedure TFrmCadLinhasDaconmt.MostraListaLinhasTipoDesemb();
Begin
//  cdsLinhasRelatxTipoDesemb.Data := oLinhaRubrica.ProcurarLinhaxRubrica(cds.FieldByName('IdLinha').asInteger);
  cdsLinhasRelatxTipoDesemb.Data := oLinhaRubrica.ProcurarLinhaxDesemb(cdsLinhasRelat.FieldByName('IdLinha').asInteger, cdsLinhasRelat.FieldByName('IdNorma').asInteger);
  lstSelect.Clear;
  lstSelectDesemb.Clear;
  lstFlagDesc.Clear;
  // ExcluirContasExistentes;
//   BtnExcluirAssociacaoLinhaRelatxRubrxDesemb.Enabled := Not cdsLinhaxConta.IsEmpty; //baruc 05/09/2012
End;


Procedure TFrmCadLinhasDaconmt.ExcluirContasExistentes();
Begin
  With cdsLinhaxConta Do
    Begin
      DisableControls;
      While Not Eof Do
        Begin
          If cdsContabil.Locate('Plano;PlaConta',
            VarArrayOf([FieldByName('Plano').asString,
            FieldByName('PlaConta').asString]), []) Then
            cdsContabil.Delete;
          Next;
        End;
      EnableControls;
      First;
      cdsContabil.First;
    End;
End;

Procedure TFrmCadLinhasDaconmt.ExcluirRubricasExistentes();
Begin
  With cdsCargoxRubrica Do
    Begin
      DisableControls;
      While Not Eof Do
        Begin
          If cdsRubricas.Locate('IdProvento', FieldByName('IdProvento').asString, []) Then
            cdsRubricas.Delete;
          Next;
        End;
      EnableControls;
      First;
      cdsRubricas.First;
    End;
End;

Procedure TFrmCadLinhasDaconmt.ExcluirRubricasTipoDesembolsoExistentes();
Begin
  With cdsLinhasRelatxTipoDesemb Do
    Begin
      DisableControls;
      While Not Eof Do
        Begin
          If cdsLinRubricas.Locate('IdProvento', FieldByName('IdProvento').asString, []) Then
            cdsLinRubricas.Delete;
          If cdsTipoDesemb.Locate('CodTipRecDes', FieldbyName('CodTipRecDes').asString, []) Then
            cdsTipoDesemb.Delete;
          Next;
        End;
      First;
      cdsLinRubricas.First;
      cdsTipoDesemb.First;
      EnableControls;
    End;
End;

Procedure TFrmCadLinhasDaconmt.pgLinhasDACOMChange(Sender: TObject);
Begin
  //   Inherited;
  sbtnInserir.Enabled := (pgLinhasDacom.ActivePageIndex = 0);
  sbtnAlterar.Enabled := (pgLinhasDacom.ActivePageIndex = 0);
  sbtnApagar.Enabled := (pgLinhasDacom.ActivePageIndex = 0);

  If pgLinhasDacom.ActivePageIndex = 1 Then
    MostraListaLinhasContabeis()
  Else If pgLinhasDacom.ActivePageIndex = 2 Then
    MostraListaLinhasRubricas()
  Else If pgLinhasDacom.ActivePageIndex = 3 Then
    //MostraListaLinhasRubricasTipoDesemb()
    MostraListaLinhasTipoDesemb()

End;

Procedure TFrmCadLinhasDaconmt.CmeCadastroDelete(Sender: TObject);
Var sCodigo: String;
Begin
  sCodigo := edCodLinha.Text;
  If IsExisteRelatorioImpresso() Then
    Begin
      MsgDlg(MSG003, 'Erro', mtError, [mbOk], 0);
      abort;
    End
  Else
    Begin
      oLinhaRelatorio.ExcluirDados(sCodigo, oNormaVigente.IdNorma, pIdCategoriaOld);
      cds.Data := oLinhaRelatorio.ListLinhaRelatorioVigente;
      If cds.IsEmpty Then
        LimpaLinha();
    End;
End;

Procedure TFrmCadLinhasDaconmt.sbAlterarClick(Sender: TObject);
Begin
  Inherited;
  bIncluir := False;
  If IsExisteRelatorioImpresso() Then
    MsgDlg(MSG003, 'Erro', mtError, [mbOk], 0)
  Else
    Begin
      If CadastroNormaVigencia Then
        Begin
          If oLinhaRelatorio.AlterarNormaVigente Then
            Begin
              cdsVigencia.Data := oNormaVigente.SelecionaNormaVigenteFiltro(oNormaVigente.IdTipo,
                oNormaVigente.IdNorma);
              MostraVigencia(True);
            End;
        End;
    End;
End;

Procedure TFrmCadLinhasDaconmt.UpdateFields();
Begin
  cds.FieldByName('COD_LINHA').asString := edCodLinha.Text;
  cds.FieldByName('DescricaoLinha').asString := edDescricaoLinha.Text;
  cds.FieldByName('NaturezaLinha').asString := dblcNaturezaLinha.Text;
  cds.FieldByName('Categoria').asString := dblcTipoCategoria.Text;
  cds.FieldByName('TipoContabilizacao').AsString := cdsTipoPlano.FieldByName('IDTIPOPLANO').AsString; // Edilaine - SOL 155850-15363 / KTN 2051763
  cds.FieldByName('TipoPlano').AsString := cdsTipoPlano.FieldByName('DESCRICAO').AsString; // Edilaine - SOL 155850-15363 / KTN 2051763

  cds.FieldByName('IdNatureza').asInteger := oNatureza.ProcurarNaturezaLinhaByDescricao(dblcNaturezaLinha.Text);
  // Thiago Melo SOL 206751 ktn 1999210
  //cds.FieldByName('idcategoria').asInteger := oNatureza.ProcurarCatedoriaByDescricao(dblcTipoCategoria.Text);
  cds.FieldByName('idtipodecategoria').asInteger := oNatureza.ProcurarCatedoriaByDescricao(dblcTipoCategoria.Text);
  // Thiago Melo SOL 206751 ktn 1999210
  //  pIdCategoria := oNatureza.ProcurarCatedoriaByDescricao(dblcTipoCategoria.Text);
End;

Procedure TFrmCadLinhasDaconmt.CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
Begin
  Inherited;
  Accept := ValidaCadastroLinha();
  If Accept Then
    Begin
      If oLinhaRelatorio.ExisteLinhaRelatorioByCodigo(edCodLinha.Text, oNormaVigente.IdNorma, pTpRel, pIdCategoriaNew) Then
        MsgDlg(MSG999, 'Erro', mtError, [mbok], 0)
      Else
        Begin
          UpdateFields();
          oLinhaRelatorio.InserirDados;
        End;
    End
  Else
    Begin
      CmeCadastro.Cancel(Self);
      bbtnCancelar.Click;
    End;
End;

Function TFrmCadLinhasDaconmt.ValidaCadastroLinha(): Boolean;
Var
  sErro: String;
Begin
  Result := True;
  sErro := '';
  If (edCodLinha.Text = EmptyStr) Then
    Begin
      Result := False;
      sErro := 'Código da Linha, ';
    End;
  If (edDescricaoLinha.Text = EmptyStr) Then
    Begin
      Result := False;
      sErro := sErro + 'Descrição da Linha, ';
    End;

  If (dblcNaturezaLinha.Text = EmptyStr) Then
    Begin
      Result := False;
      sErro := sErro + 'Natureza da Linha';
    End;

  If (dblcTipoCategoria.Text = EmptyStr) Then
    Begin
      Result := False;
      sErro := sErro + 'Tipo de Categoria, ';
    End;

  If Not Result Then
    Begin
      sErro := Trim(sErro);
      If sErro[length(sErro)] = ',' Then
        sErro := Copy(sErro, 1, Length(sErro) - 1);
      MsgDlg(Format(MSG001, [sErro]), 'Erro', mtError, [mbOK], 0);
    End;
End;

Procedure TFrmCadLinhasDaconmt.edDescricaoLinhaKeyPress(Sender: TObject; Var Key: Char);
Begin
  Inherited;
  If (Key In ['A'..'Z', 'a'..'z', '0'..'9', '.', ',', '-', '_', #32, 'ç', 'Ç',
    '"', #39, '!', '@', '#', '$', '%', '¨', '&', '*', '(', ')', '=', '|',
      '\', ',', ';', '<', '>', ':', '?', '/', '{', '}', '[', ']', '´', '`',
      '~', '^', '°', 'ª']) Then
    If length(edDescricaoLinha.Text) >= 80 Then
      key := #0;
End;

Procedure TFrmCadLinhasDaconmt.dblcNormaCadChange(Sender: TObject);
Begin
  Inherited;
  RefreshDados(Sender);
End;

Procedure TFrmCadLinhasDaconmt.dblcNormaCadCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet;
  modified: Boolean);
Begin
  Inherited;
  //RefreshDados(Sender);  // Edilaine - SOL 155850 / KTN 1235889
End;

Procedure TFrmCadLinhasDaconmt.dblcTipoRelatCadCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet;
  modified: Boolean);
Begin
  Inherited;
  //RefreshDados(Sender);     // Edilaine - SOL 155850 / KTN 1235889  
End;

Procedure TFrmCadLinhasDaconmt.dblcTipoRelatCadChange(Sender: TObject);
Begin
  Inherited;
  If dblcTipoRelatCad.Text = 'DIPJ' Then
    Begin
      dblcTipoCategoria.Text := 'RECEITA';
      pTpRel := 1;
      dblcTipoCategoria.Enabled := False;
    End;

  RefreshDados(Sender);
End;

Procedure TFrmCadLinhasDaconmt.AjustaTabSheets(Const bMostrar: Boolean);
Begin
  tbCargoxRubr.TabVisible := bMostrar;
  tbLinhasRelatXRubrXDesemb.TabVisible := bMostrar;
  //   If bMostrar Then
  //      Begin
  If bMostrar Then
     MostraListaLinhasRubricas();
  //      End;
  application.processmessages;
End;

Procedure TFrmCadLinhasDaconmt.RefreshDados(Sender: Tobject);
Var nTipo, nNorma: Integer;
Begin
  nTipo := 0;
  nNorma := 0;
  AjustaTabSheets(dblcTipoRelatCad.Text = 'DIPJ');

  If Sender = dblcTipoRelatCad Then
    Begin
      If dblcTipoRelatCad.text <> '' Then
        Begin
          nTipo := dblcTipoRelatCad.LookupTable.FieldByName('IdTipo').asInteger;
          nNorma := 0;
        End;
    End;

  If Sender = dblcNormaCad Then
    Begin
      If dblcNormaCad.text <> '' Then
        Begin
          nTipo := dblcTipoRelatCad.LookupTable.FieldByName('IdTipo').asInteger;
          nNorma := dblcNormaCad.LookupTable.FieldByName('IdNorma').asInteger;
        End;
    End;

  If Sender = dblcDataInicio Then
    Begin
      If dblcDataInicio.Text <> '' Then
        Begin
          nTipo := dblcTipoRelatCad.LookupTable.FieldByName('IdTipo').asInteger;
          nNorma := dblcDataInicio.LookupTable.FieldByName('IdNorma').asInteger;
        End;
    End;

  If nTipo <> 0 Then
    Begin
      If nNorma <> 0 Then
        Begin
          LimpaLinha();
          CarregarDadosGerais(nNorma, nTipo);
        End
      Else
        Begin
          cdsFiltroNorma.Data := oNormaVigente.SelecionaNormaVigenteFiltro(nTipo);
          cdsFiltroData.Data := oNormaVigente.selecionaNormaVigenteData(nTipo);
          nNorma := cdsFiltroNorma.FieldByName('IdNorma').asInteger;
          dblcNormaCad.text := cdsFiltroNorma.FieldByName('Descricao').asString;
          dblcDataInicio.text := cdsFiltroNorma.FieldByName('datainicio').asString;

          //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908   ]
          If (cdsFiltroNorma.FieldByName('DescricaoTipo').asString <> EmptyStr) Then
            dblcTipoRelatCad.Text := cdsFiltroNorma.FieldByName('DescricaoTipo').asString;
          lblNorma.Caption := cdsFiltroNorma.FieldByName('Descricao').asString;
          lblTipoRelatorio.Caption := cdsFiltroNorma.FieldByName('DescricaoTipo').asString;
          lblInicioVigencia.Caption := cdsFiltroNorma.FieldByName('datainicio').asString;
          lblFimVigencia.Caption := cdsFiltroNorma.FieldByName('datafim').asString;
          //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908

          LimpaLinha();
          CarregarDadosGerais(nNorma, nTipo);
        End;
    End
  Else
    CarregarDadosGerais(nNorma, nTipo);
End;

Procedure TFrmCadLinhasDaconmt.sbtnLimparFiltrosClick(Sender: TObject);
Begin
  Inherited;
  dblcTipoRelatCad.Text := 'DACON';
  dblcNormaCad.Text := '';
  dblcDataInicio.Text := '';
  RefreshDados(dblcTipoRelatCad);
End;

Procedure TFrmCadLinhasDaconmt.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  sbtnInserir.Enabled := sbtnInserir.Enabled And Not cdsVigencia.IsEmpty;
  sbtnAlterar.Enabled := Not cds.IsEmpty;
  sbtnApagar.Enabled := Not cds.IsEmpty;
End;

Procedure TFrmCadLinhasDaconmt.btnGravarAlteracoesCargoxRubricaClick(Sender: TObject);
Var idNorma: Integer;
  idCargo: Integer;
Begin
  Inherited;
  If isExisteRelatorioImpresso Then
    MsgDlg(MSG003, 'Erro', mtError, [mbOk], 0)
  Else
    Begin
      If lstSelect.Count = 0 Then
        MsgDlg(MSG013, 'Erro', mtError, [mbOk], 0)
      Else
        Begin
          idNorma := oNormaVigente.IdNorma;
          idCargo := cdsCargo.FieldByName('IdCargo').asInteger;
          If oCargoRubrica.GravarLinhasAssociadas(idNorma, idCargo, lstSelect, lstFlagDesc) Then
            Begin
              lstSelect.Clear;
              lstFlagDesc.Clear;
              cdsCargoxRubrica.data := oCargoRubrica.ProcurarCargoxRubrica(idNorma, idCargo);
              btnExcluirAlteracoesCargoXRubrica.Enabled := Not cdsCargoxRubrica.IsEmpty;
            End;
        End;
    End;
End;

Procedure TFrmCadLinhasDaconmt.btnExcluirAlteracoesCargoXRubricaClick(Sender: TObject);
Begin
  Inherited;
  // colocar mensagem de confirmação de exclusão
  If isExisteRelatorioImpresso Then
    MsgDlg(MSG003, 'Erro', mtError, [mbOk], 0)
  Else
    Begin
      If dbgCargoxRubrica.Selected.Count = 0 Then
        MsgDlg(MSG008, 'Erro', mtError, [mbOk], 0)
      Else
        oCargoRubrica.ExcluirLinhasAssociadas(oNormaVigente.IdNorma,
          cdsCargoxRubrica.FieldByName('IdCargo').asInteger,
          cdsCargoxRubrica.FieldByName('IdProvento').asInteger,
          cdsCargoxRubrica.fieldByName('IdAssociacao').asInteger);
      cdsCargoxRubrica.Delete;
      btnExcluirAlteracoesCargoXRubrica.Enabled := Not cdsCargoxRubrica.IsEmpty;
    End;
End;

Procedure TFrmCadLinhasDaconmt.edLocCargoChange(Sender: TObject);
Begin
  Inherited;
  If edLocCargo.Text <> '' Then
    cdsCargo.Locate('Titulo', edLocCargo.text, [lopartialkey])
  Else
    cdsCargo.first;
End;

Procedure TFrmCadLinhasDaconmt.edLocLinhaChange(Sender: TObject);
Begin
  Inherited;
  If edLocLinha.Text <> '' Then
    cdsLinhasRelat.Locate('DESCRICAOLINHA', edLocLinha.text, [lopartialkey])
  Else
    cdsLinhasRelat.first;
End;

Procedure TFrmCadLinhasDaconmt.BtnGravarAssociacaoLinhaRelatxRubrxDesembClick(Sender: TObject);
Var
  idLInha, idNorma: Integer;
Begin
  Inherited;
  If isExisteRelatorioImpresso Then
    MsgDlg(MSG003, 'Erro', mtError, [mbOk], 0)
  Else
    Begin
      If (lstSelect.Count = 0) And (lstSelectDesemb.Count = 0) Then
        MsgDlg(MSG014, 'Erro', mtError, [mbOk], 0)
      Else
        Begin
          edLocLinha.Text := '';
          idLinha := cdsLinhasRelat.FieldByName('IdLinha').asInteger;
          idNorma := cdsLinhasRelat.FieldByName('IdNorma').asInteger;
          if oLinhaRubrica.ExisteLinhaContaContabil(idLinha) then
            begin
              MsgDlg(MSG015, 'Erro', mtError, [mbOk], 0)
            end
          else
            begin
              If oLinhaRubrica.GravarLinhasAssociadas(idLinha, idNorma, lstSelect, lstSelectDesemb) Then
                Begin
                  lstSelect.Clear;
                  lstSelectDesemb.Clear;
                  lstFlagDesc.Clear;
                  cdsLinhasRelatxTipoDesemb.Data := oLinhaRubrica.ProcurarLinhaxDesemb(idLinha, idNorma);
                  //BtnExcluirAssociacaoLinhaRelatxRubrxDesemb.Enabled := Not cdsLinhaxConta.IsEmpty;
                End;
            end;
        End;
    End;
End;

Procedure TFrmCadLinhasDaconmt.BtnExcluirAssociacaoLinhaRelatxRubrxDesembClick(Sender: TObject);
Begin
  Inherited;
  If isExisteRelatorioImpresso Then
    MsgDlg(MSG003, 'Erro', mtError, [mbOk], 0)
  Else
    Begin
//      If dbgCargoxRubrica.Selected.Count = 0 Then
      If (IdLinhaDesemb < 0) and (IdNormaDesemb < 0) and (strCodTipRecDesDesemb = '') Then
        MsgDlg(MSG008, 'Erro', mtError, [mbOk], 0)
      Else
        Begin
          ExcluirLinhasDesemb(
          cdsLinhasRelatxTipoDesemb.FieldByName('IDLINHA').asInteger,
          cdsLinhasRelatxTipoDesemb.FieldByName('NORMA').asInteger,
          cdsLinhasRelatxTipoDesemb.FieldByName('CDES').asString);
//          ExcluirLinhasDesemb(IdLinhaDesemb, IdNormaDesemb, strCodTipRecDesDesemb);
          //MostraListaLinhasRubricasTipoDesemb();
          MostraListaLinhasTipoDesemb();
          BtnExcluirAssociacaoLinhaRelatxRubrxDesemb.Enabled := Not cdsLinhasRelatxTipoDesemb.IsEmpty;
        End;
    End;
End;

Procedure TFrmCadLinhasDaconmt.sbExcluirClick(Sender: TObject);
Var sMensagem: String;
Begin
  Inherited;
  If Not oNormaVigente.ExcluirNormaVigente(oNormaVigente.IdNorma, sMensagem) Then
    MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0)
  Else
    Begin
      dblcTipoRelatCad.Text := 'DACON';
      RefreshDados(dblcTipoRelatCad);
    End;
End;

Procedure TFrmCadLinhasDaconmt.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  RefreshDados(dblcTipoRelatCad);
End;

Procedure TFrmCadLinhasDaconmt.sbtnApagarClick(Sender: TObject);
Begin
  Inherited;
  RefreshDados(dblcTipoRelatCad);
End;

Procedure TFrmCadLinhasDaconmt.edRubricaChange(Sender: TObject);
Begin
  Inherited;

  If edRubrica.Text <> '' Then
    cdsRubricas.Locate('Descricao', edRubrica.text, [lopartialkey])
  Else
    cdsRubricas.first;

End;

Procedure TFrmCadLinhasDaconmt.FormShow(Sender: TObject);
Begin
  Inherited;
  If dblcTipoRelatCad.Text = 'DIPJ' Then
    Begin
      pTpRel := 1;
    End
  Else If dblcTipoRelatCad.Text = 'DACON' Then     // Edilaine - SOL 155850 / KTN 1235889
    Begin
      dblcTipoCategoria.Text := 'RECEITA';
      dblcTipoCategoria.Enabled := false;
    End;

End;

Procedure TFrmCadLinhasDaconmt.dblcTipoCategoriaChange(Sender: TObject);
Begin
  Inherited;
  pIdCategoriaNew := oNatureza.ProcurarCatedoriaByDescricao(dblcTipoCategoria.Text);
End;

procedure TFrmCadLinhasDaconmt.edPesqDesembChange(Sender: TObject);
begin
  Inherited;
  If edPesqDesemb.Text <> '' Then
    cdsTipoDesemb.Locate('Descricao', edPesqDesemb.text, [lopartialkey])
  Else
    cdsTipoDesemb.first;
// UPPER(Descricao) LIKE UPPER('pre%')
end;


Function TFrmCadLinhasDaconmt.ExcluirLinhasDesemb(pIdLinha, pIdNorma: Integer; pCodTipRecDes: String) : Boolean;
Var
  sSql: String;
  qryAux: TwwQuery;
Begin
  sSql := 'Delete from linhaxtipodesembolso where ';
  sSql := sSql + ' idLinha = ' + IntToStr(pIdLinha) + ' and ' ;
  sSql := sSql + ' idNorma = ' + IntToStr(pIdNorma) + ' and ' ;
  sSql := sSql + ' CodTipRecDes = ' + pCodTipRecDes;

  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.ExecSQL;
  qryAux.Close;
  FreeAndNil(qryAux);
  Result := true;
End;


procedure TFrmCadLinhasDaconmt.CriarCadastroNatureza;
begin
  AbrirForm(frmCadNatContaContabil, TfrmCadNatContaContabil, False);
end;

function TFrmCadLinhasDaconmt.ConfiguraNaturezaConta: boolean;
var
  iModal : integer;
begin
  try
     Result := false;

     // carrega o form
     CriarCadastroNatureza();
     If frmCadNatContaContabil.FormStyle <> fsNormal Then
     Begin
       frmCadNatContaContabil.FormStyle := fsNormal;
       frmCadNatContaContabil.Visible := false;
     End;

     iModal := frmCadNatContaContabil.ShowModal;
     if iModal = mrOk then
     begin
      cdsContabil.Edit;
      cdsContabil.FieldByName('PLANATUREZA').AsString := frmCadNatContaContabil.sTipo;
      cdsContabil.FieldByName('NATUREZA').AsString    := frmCadNatContaContabil.sNatureza;
      cdsContabil.Post;

      Result := true;
     end;
  finally
     frmCadNatContaContabil.Release;
  end;
end;

function TFrmCadLinhasDaconmt.ConfiguraContaContabBaseCalc: Boolean;
var
    iModal : Integer;
begin
  Result := False;
  try

    CriarCadastroContaContabBaseCalc();
    if frmCadContaContabilBaseCalc.FormStyle <> fsNormal then
    begin
      frmCadContaContabilBaseCalc.FormStyle := fsNormal;
      frmCadContaContabilBaseCalc.Visible := false;
    end;

    iModal := frmCadContaContabilBaseCalc.ShowModal;
    if iModal = mrOk then
    begin
      cdsLinhaxConta.Edit;
      cdsLinhaxConta.FieldByName('TIPOBASECALC').AsInteger := frmCadContaContabilBaseCalc.iBaseCalc;
      cdsLinhaxConta.FieldByName('CODAJUSTE').AsString := frmCadContaContabilBaseCalc.sCodAjuste;
      cdsLinhaxConta.FieldByName('NUMPROCESSO').AsString := frmCadContaContabilBaseCalc.sNumProcesso;
      cdsLinhaxConta.FieldByName('DESCRAJUSTE').AsString := frmCadContaContabilBaseCalc.sIdentAjuste;
      cdsLinhaxConta.FieldByName('INFOAJUSTE').AsString := frmCadContaContabilBaseCalc.sInfoAjuste;
      cdsLinhaxConta.Post;

      Result := True;
    end;

  finally
    frmCadContaContabilBaseCalc.Release;
  end;       
end;

procedure TFrmCadLinhasDaconmt.CriarCadastroContaContabBaseCalc;
begin
  AbrirForm(frmCadContaContabilBaseCalc, TfrmCadContaContabilBaseCalc, False);
end;

End.

