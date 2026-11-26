{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
WO          : 41032 (40760)
Responsável : Edilaine
Data        : 07/07/2026
Descrição   : Trocar componente para apresentação das fotos
--------------------------------------------------------------------------------
 N. Chamado....: WO33342
 Dt Alteração..: 25/02/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .Ajustando a mensagem de problemas com o numero do documento
                  para "Número do ???? inválido. Verifique !".
--------------------------------------------------------------------------------
Nº SIG......: 115265
Data........: 22/04/2021
Responsável.: Edilaine
Descrição...: Alteração nos dados de agencia não valida máscara
--------------------------------------------------------------------------------
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
Nº SIG......: 27550
Data........: 09/01/2017
Responsável.: Michelle Suellyn Mota
Descrição...: Retorna nome da agência ao pesquisar.
--------------------------------------------------------------------------------
Nº SIG......: 22093
Data........: 22/08/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Criar campo para NIF no Consulta geral de pessoas e na tela
              elegível participante
Alterações..: Alteração no modo de exibição e obrigatoriedade dos campos da aba
              Documentação.
--------------------------------------------------------------------------------
Nº SOL......: 261809
Nº PPM..: 1071821
Data........: 22/09/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Alteração de nome de LBL
Alterações DFM: Alteração no DFM
--------------------------------------------------------------------------------
Nº SOL......: 250389/17574
Nº PPM..: 992385
Data........: 05/08/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Criação de flg para primeira habilitação e categoria
Alterações DFM: Criação dos checkBoxs primeira habilitação e categoria
--------------------------------------------------------------------------------
Nº SOL......: 211502.16259
Nº PPM......: 442499
Data........: 15/10/2014
Responsável.: William Santana
Descrição...: Desenvolvimento do produto referente ao SOL 211502.
--------------------------------------------------------------------------------
Nº SOL: 229871/16137
Nº PPM: 407073
Data da Alteração: 02/10/2014
Alteração Form: alteração no endereço
Responsável: Felipe A. Santos
Descrição: foi incluído o campo CODMUNICIPIO em endereços. foi corrigido o
           título do cadastro de contatos e telefones.
--------------------------------------------------------------------------------
Nº SOL......: 215475
Nº KINTANA..: 2044512
Data........: 03/09/2013                                                                                                                                SS
Responsável.: Fernando Xavier
Descrição...: Erro no cadastro de favorecido Campo Cidade e Estado não inseridos
              na ENDPESS
--------------------------------------------------------------------------------
Nº SOL......: 179053
Nº KINTANA..: 1649127
Data........: 29/06/2012
Responsável.: José Roberto Marque
Descrição...: criação do campo FLGCONTAINATIVA, Char(1) na aba Contas Bancárias.
--------------------------------------------------------------------------------
Rotina......: AtuDocumentos
Nº SOL......: 166680
Nº KINTANA..: 1453334
Data........: 14/10/2011
Responsável.: Thaise Amaral Martins
Descrição...: Como a pesquisa estava adicionando a mascara num edit que não
              existe no cadastro de pessoa de forma geral, chamaremos ela apenas
              do módulo Folha de Pagamento.

--------------------------------------------------------------------------------
Rotina......: MudaDocumento
Nº SOL......: 138283
Nº KINTANA..: 840489
Data........: 30/06/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Incluindo comboBox para seleção de multiplas mascaras para um
              mesmo documento.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 24591
Nº KINTANA..: 524457
Data........: 28/10/2010
Responsável.: Thaise Amaral Martins
Descrição...: Desabilitando campos que só podem ser alterados no módulo Folha de
              Pagamento caso o funcionário possua vínculo empregatício com a
              Funcef.
              Além da uCtrlPessoa no fPessoaMT, esta alteração da mesma forma
              foi feita em:
              fPessoa
              fCadFunc <- Herda de fPessoaMT
              fCadForne <- Herda de fCadFunc
              fCadElegivel <- Herda de fPessoa
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 138267
Nº KINTANA..: 840320
Data........: 24/06/2010
Responsável.: Thaise amaral Martins
Descrição...: Na procedure MudaDocumento foi colocado um StringReplace para
              substiruir no retorno da function MaskField do caractere '#' para
              'a', pois quando for colocada a mascara no DataSet, ele permitirá
              que seja digitado caracteres
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 23/02/2002                             }
{                                                       }
{*******************************************************}

//Marcus Oliveria P. 25574 - 10/07/2007
//Marcus Oliveira P. 25348 - 03/07/2007
// - andre tavares - pendência 18016 - 15/02/2004
//MARCUS OLIVEIRA P. 24024 3/01/07

unit fpessoaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, StdCtrls, checklst, ComCtrls,
  wwdblook, DBCtrls, Mask, wwdbedit, MontaSelect, DBTables, wwQuery,
  Wwdatsrc, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  TabControlDetalhe, ExtCtrls, DBaseDados, UDataBase, UMensErro, ftelaaut,
  uAutorizacao, ExtDlgs, fCadastroCS, TB97Tlbr, TB97Ctls,
  IvDictio, IvMulti, IvEMulti, consts, CMDBLookupCombo, Wwdbspin, ImgList,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, TREdit,
  FCadastroMestreDetMT, DBClient, uCMClientDataSet, uCtrlPessoa, TB97Tlwn,
  CMProcura, uCMTypes, uCmSqlParams, Fpessoa, JPEG;

type
  TFrmPessoaMT = class(TFrmCadastroMestreDetMT)
    sbtnFisJur: TToolbarButton97;
    dbedDocumento: TwwDBEdit;
    dbedNomeFantasia: TDBEdit;
    dbedRazaoSocial: TDBEdit;
    lblDocumento: TLabel;
    lblNome: TLabel;
    LabelRAZAOSOCIAL: TLabel;
    dbedemail: TwwDBEdit;
    lblEMail: TLabel;
    lblPdGrupo: TLabel;
    lblPdLocal: TLabel;
    dbedNomeEndereco: TDBEdit;
    lblPdLogradouro: TLabel;
    dbedLogradouro: TDBEdit;
    lblPdComplemento: TLabel;
    DBEDCOMPLEMENTO: TwwDBEdit;
    lblPdCidade: TLabel;
    lblPdEstado: TLabel;
    dbedEstado: TwwDBEdit;
    dbedBairro: TwwDBEdit;
    DBNUMERO: TDBEdit;
    lblPdNumero: TLabel;
    lblPdCEP: TLabel;
    dbedCEP: TwwDBEdit;
    dbedPais: TwwDBEdit;
    tbsDocumento: TTabSheet;
    tbsTelefone: TTabSheet;
    tbsContato: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    lblDDI: TLabel;
    lblDDD: TLabel;
    lblNumTelefone: TLabel;
    DBEDDDI: TDBEdit;
    DBEDDDD: TDBEdit;
    DBEDNUMERO: TwwDBEdit;
    GroupBox4: TGroupBox;
    chkTipoTelefone: TCheckListBox;
    mnbm: TLabel;
    lblPdeMail: TLabel;
    lblPdNome: TLabel;
    lblPdSetor: TLabel;
    dbedcontatonome: TDBEdit;
    dbedcontatoemail: TDBEdit;
    EdtCargo_Padrao: TDBEdit;
    EdtSetor_Padrao: TDBEdit;
    lblBairro: TLabel;
    tb97TituloDetalhe: TToolbar97;
    dbedPaiDetalhe: TwwDBEdit;
    dbgTelefone: TwwDBGrid;
    dbgContato: TwwDBGrid;
    dsSubTipo: TwwDataSource;
    dsPessoaFisica: TwwDataSource;
    ImlDocumentos: TImageList;
    dsTelefone: TwwDataSource;
    dsEndereco: TwwDataSource;
    dsContato: TwwDataSource;
    dsTelContato: TwwDataSource;
    dsDocumento: TwwDataSource;
    dsEscolhePessoa: TwwDataSource;
    dsImagem: TwwDataSource;
    dsImagensDoc: TwwDataSource;
    lblNasc: TLabel;
    lblObs: TLabel;
    DbmObs_Padrao: TDBMemo;
    MSGrupo: TMontaSelect;
    lblPdPais: TLabel;
    grpTipoEnd: TGroupBox;
    chkTipoEndereco: TCheckListBox;
    DbeHomePage_Padrao: TwwDBEdit;
    LblHomePage_Padrao: TLabel;
    DsNaturalidade: TwwDataSource;
    PgCtrlPesFisica_Padrao: TPageControl;
    TbsDocumentos_Padrao: TTabSheet;
    TbsDadosPessoais_Padrao: TTabSheet;
    PnlDocumentos_Padrao: TPanel;
    pnlItemsDoc: TPanel;
    pnlNomeDoc: TPanel;
    pnlOrgao: TPanel;
    lblPdOrgao: TLabel;
    EdtOrgaoEmissor: TwwDBEdit;
    pnlEmissao: TPanel;
    lblPdEmiss: TLabel;
    pnlUF: TPanel;
    lblPdUF: TLabel;
    dbcmbEstadoDoc: TCMDBLookupCombo;
    pnlNumDoc: TPanel;
    edDocNumDocumento: TwwDBEdit;
    pnlFoto: TPanel;
    lstDocumentos: TListView;
    BvlDadosNasc_Padrao: TBevel;
    BvlNatur_Padrao: TBevel;
    LblNomePai_Padrao: TLabel;
    LblNomeMae_Padrao: TLabel;
    LblNaturalidade_Padrao: TLabel;
    LblNacionalidade_Padrao: TLabel;
    LblDataNasc_Padrao: TLabel;
    LblTipoSang_Padrao: TLabel;
    CkbIsentoIrrf_Padrao: TDBCheckBox;
    dbrgrpSexo_Padrao: TDBRadioGroup;
    dbrgrpEstCivil_Padrao: TDBRadioGroup;
    EdtNomePai_Padrao: TwwDBEdit;
    EdtNomeMae_Padrao: TwwDBEdit;
    CmbNaturalidade_Padrao: TwwDBLookupCombo;
    DbedNacionalidade_Padrao: TwwDBEdit;
    EdtTipoSang_Padrao: TwwDBEdit;
    GpNumDepend_Padrao: TGroupBox;
    LblDepenIr_Padrao: TLabel;
    LblDepenSal_Padrao: TLabel;
    LblTotalDepende_Padrao: TLabel;
    SpinDepenIr_Padrao: TwwDBSpinEdit;
    SpinDepenSal_Padrao: TwwDBSpinEdit;
    SpinTotalDepente_Padrao: TwwDBSpinEdit;
    BvlImagem: TBevel;
    PnlAssociaFoto_Padrao: TPanel;
    btnAssociarimgPessoa: TButton;
    SbImagePessoa_Padrao: TScrollBox;
    imgPessoa: TDBImage;
    EdtDataNasc_Padrao: TCMDateTimePicker;
    EdtDataEmissao_Padao: TCMDateTimePicker;
    EdtDataNascimento_Padrao: TCMDateTimePicker;
    PnlValidade: TPanel;
    LblDtValidade: TLabel;
    EdtDataValidade_Padrao: TCMDateTimePicker;
    EdtvlrPensao_Padrao: TDBRealEdit;
    EdtlrlINSS_Padrao: TDBRealEdit;
    LbVlrlINSS_Padrao: TLabel;
    LblvlrPensao_Padrao: TLabel;
    CdsDocumento: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    CdsTelefone: TCMClientDataSet;
    CdsContato: TCMClientDataSet;
    CdsTelContato: TCMClientDataSet;
    CdsImagem: TCMClientDataSet;
    CdsEscolhePessoa: TCMClientDataSet;
    CdsImagensDoc: TCMClientDataSet;
    CdsSubTipo: TCMClientDataSet;
    CdsPessoaFisica: TCMClientDataSet;
    CdsCidade: TCMClientDataSet;
    CdsNaturalidade: TCMClientDataSet;
    CdsEstado: TCMClientDataSet;
    ToolTelContato: TToolWindow97;
    PnlToolTelContato: TPanel;
    TbtnExcluiTC: TToolbarButton97;
    TbtnAlteraTC: TToolbarButton97;
    TbtnInsereTC: TToolbarButton97;
    GrdContatoTel: TwwDBGrid;
    BtnTelefones: TBitBtn;
    GrdTelContato: TwwDBGrid;
    BtnContatoTel: TBitBtn;
    CmpCidades: TCMProcura;
    MsCidades: TMontaSelect;
    CmpGrupo: TCMProcura;
    Panel3: TPanel;
    TbtnSairTC: TToolbarButton97;
    TbtnCancelaTC: TToolbarButton97;
    TbtnConfirmaTC: TToolbarButton97;
    dblcContato: TCMDBLookupCombo;
    dblcTelefone: TCMDBLookupCombo;
    LblTelContato: TLabel;
    LblRamal: TLabel;
    EdtRamal_Padrao: TwwDBEdit;
    tbsDadosBancarios: TTabSheet;
    DsContaBancaria: TwwDataSource;
    CdsContaBancaria: TCMClientDataSet;
    MsBanco: TMontaSelect;
    CdsBanco: TCMClientDataSet;
    ppmCaixa: TPopupMenu;
    N001ContaCorrente1: TMenuItem;
    N002ContaCadernete1: TMenuItem;
    N003ContadePessoaJurdica1: TMenuItem;
    N004DepsitoJudicial1: TMenuItem;
    N635DepsitoJudicialIR1: TMenuItem;
    N013ContadePoupana1: TMenuItem;
    N022ContaCadernetedePoupanaPessoaJurdica1: TMenuItem;
    GrdContaBancaria_Padrao: TwwDBGrid;
    PnlDadosBancarios_Padrao: TPanel;
    Label14: TLabel;
    Label8: TLabel;
    BtnBuscaAgencia: TSpeedButton;
    Label9: TLabel;
    dblkBanco: TwwDBLookupCombo;
    DbeAgencia: TwwDBEdit;
    dbedConta: TwwDBEdit;
    RgTipoConta: TDBRadioGroup;
    ChbContaPref_Padrao: TDBCheckBox;
    ToolbarSep972: TToolbarSep97;
    PnlContatol_Padrao: TPanel;
    GrdExibeContatos_Padrao: TwwDBGrid;
    LblContatos_Padrao: TLabel;
    PnlTelefones_Padrao: TPanel;
    GrdTelefones_Padrao: TwwDBGrid;
    LblTelefones_Padrao: TLabel;
    SplTelefones_Padrao: TSplitter;
    SplContatos_Padrao: TSplitter;
    CdsTelefoneIDTELEFONE_Padrao: TFloatField;
    CdsTelefoneIDPESSOA_Padrao: TFloatField;
    CdsTelefoneIDENDERECO_Padrao: TFloatField;
    CdsTelefoneDDI_Padrao: TStringField;
    CdsTelefoneDDD_Padrao: TStringField;
    CdsTelefoneNUMERO_Padrao: TStringField;
    CdsTelefoneTIPO_Padrao: TStringField;
    CdsTelefoneTIPOTEL_Padrao: TStringField;
    lblMsg: TLabel;
    chb_ContaInativa: TDBCheckBox;
    pnlCaptionTelContato: TPanel;
    CdsEndereco: TCMClientDataSet;
    CdsEnderecoNOME: TStringField;
    CdsEnderecoTIPOLOGRADOURO: TStringField;
    CdsEnderecoLOGRADOURO: TStringField;
    CdsEnderecoTIPOEND_PADRAO: TStringField;
    CdsEnderecoNUMERO: TStringField;
    CdsEnderecoCOMPLEMENTO: TStringField;
    CdsEnderecoBAIRRO: TStringField;
    CdsEnderecoCEP: TStringField;
    CdsEnderecoCODMUNICIPIO: TStringField;
    CdsEnderecoNOMECIDADE: TStringField;
    CdsEnderecoNOMEESTADO: TStringField;
    CdsEnderecoCODESTADO: TStringField;
    CdsEnderecoNOMEPAIS: TStringField;
    CdsEnderecoIDPESSOA: TFloatField;
    CdsEnderecoIDENDERECO: TFloatField;
    CdsEnderecoIDCIDADES: TFloatField;
    CdsEnderecoCIDADE: TStringField;
    CdsEnderecoIDTIPO_LOGRADOURO: TFloatField;
    CdsImagemOutro: TCMClientDataSet;
    dsImagemOutro: TwwDataSource;
    pnlDataHabilitacao: TPanel;
    lblDtHabilitacao: TLabel;   //SOL 261809 PPM..: 1071821 Higor Nayde
    cbxDataHabilitacao: TCMDateTimePicker;
    pnlCategoria: TPanel;
    lblCategoria: TLabel;    //SOL 261809 PPM..: 1071821 Higor Nayde
    edtCategoria: TwwDBEdit;
    pnlPais: TPanel;
    Label91: TLabel;
    dbcmdPais: TCMDBLookupCombo;
    CdsPais: TCMClientDataSet;
    DBText1: TDBText;
    imgPessoa1: TImage;
    //lblMsg: TLabel;
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dbedDocumentoExit(Sender: TObject);
    procedure sbtnFisJurClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure chkTipoTelefoneClick(Sender: TObject);
    procedure dbedNomeFantasiaExit(Sender: TObject);
    procedure pnlItemsDocResize(Sender: TObject);
    procedure lstDocumentosChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure dbcmbEstadoDocChange(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure edDocNumDocumentoExit(Sender: TObject);
    procedure btnAssociarimgPessoaClick(Sender: TObject);
    procedure lstDocumentosDblClick(Sender: TObject);
    procedure btnLimpaImgPessoaClick(Sender: TObject);
    procedure dsDocumentoStateChange(Sender: TObject);
    procedure dsImagemDataChange(Sender: TObject; Field: TField);
    procedure dsTelefoneDataChange(Sender: TObject; Field: TField);
    procedure dsEnderecoDataChange(Sender: TObject; Field: TField);
    procedure chkTipoEnderecoClickCheck(Sender: TObject);
    procedure PnlAssociaFoto_PadraoResize(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure BtnContatoTelClick(Sender: TObject);
    procedure BtnTelefonesClick(Sender: TObject);
    procedure ToolTelContatoVisibleChanged(Sender: TObject);
    procedure TbtnExcluiTCClick(Sender: TObject);
    procedure TbtnSairTCClick(Sender: TObject);
    procedure CmpCidadesValidaDados(Sender: TObject);
    procedure TbtnConfirmaTCClick(Sender: TObject);
    procedure TbtnCancelaTCClick(Sender: TObject);
    procedure CdsTelContatoAfterInsert(DataSet: TDataSet);
    procedure TbtnInsereTCClick(Sender: TObject);
    procedure TbtnAlteraTCClick(Sender: TObject);
    procedure CdsEnderecoBeforeDelete(DataSet: TDataSet);
    procedure dblcTelefoneCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcContatoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure RgTipoContaClick(Sender: TObject);
    procedure BtnBuscaAgenciaClick(Sender: TObject);
    procedure dbedContaEnter(Sender: TObject);
    procedure N001ContaCorrente1Click(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsEnderecoCalcFields(DataSet: TDataSet);
    procedure CdsContatoAfterScroll(DataSet: TDataSet);
    procedure CdsTelefoneAfterScroll(DataSet: TDataSet);
    procedure CdsContaBancariaAfterInsert(DataSet: TDataSet);
    procedure CdsTelefoneCalcFields(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    bJaExiste : Boolean;
    bExibeContato: Boolean;
    FPessoa: TfrmPessoa;
    lTelefone, lEndereco, lContato, lBanco : String;
    bTtravarCadastro: Boolean;
    procedure AtuDocumentos;
    procedure AtuTipo;
    procedure MudaTipo;
    procedure MostraDocumento;
    procedure InsereDocumento;
    procedure AssociaImagem(dsImg: TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
    procedure MudaDocumento;
    procedure HabilitaBtnRamal(bHabilita: Boolean);
    procedure EnableControls(bEnable: Boolean);
    procedure HabilitarCampos;
    procedure PintarCampos(lEdit: Array of TComponent; Color: TColor);

  protected
    Pessoa: TCtrlPessoa;

//Início - William Santana - SOL 211502.16259 PPM - 442499
// para poder acessar o método em outros forms com outro cds
  public
    procedure AssociaOutraImagem(dsImg: TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
//Termino - William Santana - SOL 211502.16259 PPM - 442499

    procedure SelPessoa(rIdPessoa: Double); Virtual;
    procedure SelSubTipo(rIdPessoa: Double); Virtual;

    procedure MessagePessoa(sMensagem: String);
    function ValidaEntrada: boolean;//Darivaldo Alencar SIG 22093
  end;

implementation

uses fEscolhePessoa, fImagemDoc, uSistema, uCalcDV, uCtrlParamIntegra;

{$R *.DFM}

procedure TFrmPessoaMT.bbtnCancelarDetClick(Sender: TObject);
begin
  CmeDetalhe.Cancel(Self);
end;



procedure TFrmPessoaMT.sbtnFisJurClick(Sender: TObject);
begin
  inherited;
  Pessoa.Ejuridica := not(Pessoa.Ejuridica);
  MudaTipo;
  //Cátia Azevedo - Pendência - 17258
  InsereDocumento;
  AtuDocumentos;
end;



procedure TFrmPessoaMT.MudaTipo;
begin
  {** Verificado! **}

  {**
    Altera o painel principal de acordo com o tipo da pessoa ( Esconde os controles
    de pessoa juridica como razão social e grupo.
  **}


  If Pessoa.EJuridica Then
  begin
     lblNome.Caption       := 'Nome Fantasia';
     pnlMestre.Height      := 105;
     sbtnFisJur.Caption    := 'Pessoa Jurídica';
     sbtnFisJur.ImageIndex := 11;
     sbtnFisJur.Tag        := 0;
    // FPessoa.qryTipoDoc.ParamByName('IDFISICAJURIDICA').AsString := 'J';
   //  qryDocumento.ParamByName('IDFISICAJURIDICA').AsString := 'J';

  end
  Else
  Begin
     lblNome.Caption       := 'Nome';
     pnlMestre.Height      := 53;
     sbtnFisJur.Caption    := 'Pessoa Física';
     sbtnFisJur.ImageIndex := 10;
     sbtnFisJur.Tag        := 1;
    // FPessoa.qryTipoDoc.ParamByName('IDFISICAJURIDICA').AsString := 'F';
    // qryDocumento.ParamByName('IDFISICAJURIDICA').AsString := 'F';
  end;
 //  FPessoa.qryTipoDoc.Close;
 // FPessoa.qryTipoDoc.Open;
  {**
    Incicializa a referencia da empresa logada e busca parâmetros de documento
    padrão de acordo com o tipo da pessoa, nome do documento, regra de validação e
    mascara do mesmo.
  **}
  Pessoa.HabilitaPessoa;
  lblDocumento.Caption := Pessoa.NomeDocumento;
  Cds.FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MascaraDocum;

  {**
    Busca dados referentes aos documento cadastrados de acordo com o tipo de pessoa.
    Busca os documentos associados a pessoa e monta a lista de documentos associados.
  **}
  If Pessoa.EJuridica Then
  Begin
     Pessoa.GetDadosPessoa(Cds.FieldByName('IDPESSOA').AsFloat, gpDocumentos, tpJuridica);
     //MARCUS OLIVEIRA P. 24024 3/01/07
     CdsTipoDoc.Data := Pessoa.SelTipoDocPessoa(tpJuridica);
     //CdsDocumento.Data := Pessoa.SelDocPessoa(Cds.FieldByName('IDPESSOA').AsFloat, tpJuridica);
  End
  Else
  Begin
     Pessoa.GetDadosPessoa(Cds.FieldByName('IDPESSOA').AsFloat, gpDocumentos, tpFisica);
     CdsTipoDoc.Data := Pessoa.SelTipoDocPessoa(tpFisica);
     //CdsDocumento.Data := Pessoa.SelDocPessoa(Cds.FieldByName('IDPESSOA').AsFloat, tpFisica);
  End;

  AtuDocumentos;

  {**
    Atualiza o painel de exibição para os dados referentes a pessoa física caso
    o cadastro utilize tal informação.
  **}
  If (Pessoa.EJuridica) or (Not Pessoa.UsaPessoaFisica) Then
  Begin
     PgCtrlPesFisica_Padrao.Visible := False;
     PnlDocumentos_Padrao.parent := tbsDocumento
  End
  Else
  Begin
     PnlDocumentos_Padrao.parent := TbsDocumentos_Padrao;
     PgCtrlPesFisica_Padrao.Visible := True;
     PgCtrlPesFisica_Padrao.ActivePage := TbsDocumentos_Padrao;
  End;
end;

procedure TFrmPessoaMT.FormCreate(Sender: TObject);
begin
  inherited;

  If Pessoa.MudaCaption Then
     Caption := Pessoa.Caption
  Else
     Caption := Pessoa.FormCaption;

  Pessoa.EJuridica := (Pessoa.TipoPessoa <> tpfisica);

  sbtnFisJur.Visible := (Pessoa.TipoPessoa = tpOpcional);
  ToolbarSep972.Visible := sbtnFisJur.Visible;

  If (Pessoa.TipoPessoa = tpFisica) Then
     sbtnFisJur.Tag := 1
  Else
     sbtnFisJur.Tag := 0;

  {** Verificado! **}

  {**
    Cria instância da classe de integração para acessar as máscaras de conta,
    parâmetros globais e de integração com comtabilidade e outros módulos

    ParamIntegra := TCtrlParamIntegra.Create;;
    ParamIntegra.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                          Sistema.RemoteServer,True);
    ParamIntegra.IdEmpresa := Sistema.IdEmpresa;
  **}

  DbeAgencia.Enabled := ParamIntegra.IncluiAgencia;
  {**
    "Traz para frente" o ToolWindows de associação de contratos e telefones
  **}
  ToolTelContato.BringToFront;

  {**
    Atribui ao montaselect os filtros do subtipo instanciado pelo pessoa

  for i := 0 to Pessoa.SQLFiltro.Count-1 do
      MontaSelect.Filtro.Add(Pessoa.SQLFiltro[i]);
  **}

  {**
    Atribui os Cds da classe de controle aos da tela
    Inicializa os ClientDataSets que trabalham sem filtro de pessoa.
  **}
  pessoa.CdsContatopess := CdsContato;
  pessoa.CdsDocpessoa := CdsDocumento;
  pessoa.CdsEndpess := CdsEndereco;
  pessoa.CdsImagensPessoa := CdsImagem;
  pessoa.CdsImagensDOC := CdsImagensDoc;
  pessoa.CdsPessoa := Cds;
  pessoa.CdsPessoafisica := CdsPessoaFisica;
  pessoa.CdsTelcontato := CdsTelContato;
  pessoa.CdsTelendpess := CdsTelefone;
  pessoa.CdsContaBancaria := CdsContaBancaria;
  pessoa.CdsSubTipo := CdsSubTipo;
  pessoa.CdsEstado := CdsEstado ;
  pessoa.CdsNaturalidade := CdsNaturalidade ;
  pessoa.CdsBanco := CdsBanco;
  pessoa.CdsDocumento := CdsDocumento ;
  pessoa.CdsTipoDoc := CdsTipoDoc ;
  pessoa.CdsImagemOutro := CdsImagemOutro; //William Santana - SOL 211502.16259 PPM - 442499
  pessoa.CdsPais := CdsPais ; // Michelle Mota - SIG 22093

  {**
    CdsNaturalidade.Data := Pessoa.SelNaturalidade;
    CdsEstado.Data := Pessoa.SelEstado;
    CdsBanco.Data := Pessoa.SelBanco;

    CdsTipoDoc.Data := Pessoa.SelTipoDocPessoa(tpJuridica);
    CdsDocumento.Data := Pessoa.SelDocPessoa(-1, tpJuridica);
  **}

  {**
    Inicializa os atributos referente a empresa e evento de mensagens;
    "Abre" os Cds da tela e "formata" a tela de acordo com o tipo de pessoa

  **}
  Pessoa.IdEmpresa := Sistema.IdEmpresa;
  Pessoa.OnMessageInfo := MessagePessoa;

  SelPessoa(-271504);

//  MudaTipo;
  {**
    Atributos de incialização dos controle da tela;
  **}
  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(tbcDetalhe);

  If MontaSelect.SensivelACaixa.Count < 2 Then
  Begin
     MontaSelect.SensivelACaixa.Append('');
     MontaSelect.SensivelACaixa.Append('');
  End;

  If Sistema.SoUpperPessoa Then
  Begin
     dbedNomeFantasia.CharCase := ecUpperCase;
     dbedRazaoSocial.CharCase := ecUpperCase;

     MontaSelect.SensivelACaixa[0] := 'S';
     MontaSelect.SensivelACaixa[1] := 'S';
  End
  Else
  Begin
     dbedNomeFantasia.CharCase := ecNormal;
     dbedRazaoSocial.CharCase := ecNormal;

     MontaSelect.SensivelACaixa[0] := 'N';
     MontaSelect.SensivelACaixa[1] := 'N';
  End;

end;

procedure TFrmPessoaMT.tbcDetalheChange(Sender: TObject);
begin
   {** Verificado! **}
   inherited;
   if CdsEndereco.IsEmpty And
      (Cds.State In [DsEdit, DsInsert]) And
      ((pgctrlDetalhe.ActivePage = tbsTelefone) or
       (pgctrlDetalhe.ActivePage = tbsContato)) then
   begin
      MsgDlg('Cadastre pelo menos um endereço', 'Atenção', mtInformation, [mbOk],0);
      tbcDetalhe.TabIndex := tbcDetalhe.TabIndex-1;
      if (pgctrlDetalhe.ActivePage = tbsContato) then
         tbcDetalhe.TabIndex := tbcDetalhe.TabIndex-1;
      pgctrlDetalhe.ActivePage := tbsDet;
      tbcDetalheChange(tbcDetalhe);
      exit;
   end;

   if (pgctrlDetalhe.ActivePage = tbsDet) then
   begin
      dbedPaiDetalhe.Visible := true;
      dbedPaiDetalhe.DataSource := dsEndereco;
      dbedPaiDetalhe.DataField := 'NOME';
      tb97TituloDetalhe.Visible := true;
   end
   else
      if (pgctrlDetalhe.ActivePage = tbsTelefone) then
      begin
         dbedPaiDetalhe.Visible := true;
         dbedPaiDetalhe.DataSource := dsEndereco;
         dbedPaiDetalhe.DataField := 'NOME';
         CdsTelefone.Filter := 'IDENDERECO = ' + QuotedStr(FloatToStr(CdsEndereco.FieldByName('IDENDERECO').AsFloat));
         CdsTelContato.Filter := 'IDTELEFONE = ' + QuotedStr(FloatToStr(CdsTelefone.FieldByName('IDTELEFONE').AsFloat));
         tb97TituloDetalhe.Visible := true;
      end
      else
         if (pgctrlDetalhe.ActivePage = tbsContato) then
         begin
            dbedPaiDetalhe.Visible := true;
            dbedPaiDetalhe.DataSource := dsEndereco;
            dbedPaiDetalhe.DataField := 'NOME';
            CdsContato.Filter := 'IDENDERECO = ' + QuotedStr(FloatToStr(CdsEndereco.FieldByName('IDENDERECO').AsFloat));
            CdsTelContato.Filter := 'IDCONTATO = ' + QuotedStr(FloatToStr(CdsContato.FieldByName('IDCONTATO').AsFloat));
            tb97TituloDetalhe.Visible := true;
         end
         else
         begin
            dbedPaiDetalhe.Visible := false;
            dbedPaiDetalhe.DataSource := nil;
            dbedPaiDetalhe.DataField := '';
            tb97TituloDetalhe.Visible := false;
         end;
end;

procedure TFrmPessoaMT.chkTipoTelefoneClick(Sender: TObject);
var
  sTipo:  string;
begin
   {** Verificado! **}
   inherited;
   if (CdsTelefone.State in [dsInsert,dsEdit]) then
   begin
      sTipo := '';
      if chkTipoTelefone.Checked[0] then
         sTipo := sTipo + 'C';

      if chkTipoTelefone.Checked[1] then
          sTipo := sTipo + 'P';

      if chkTipoTelefone.Checked[2] then
         sTipo := sTipo + 'F';

      if chkTipoTelefone.Checked[3] then
         sTipo := sTipo + 'L';

      if chkTipoTelefone.Checked[4] then
         sTipo := sTipo + 'R';

      if sTipo = '' then
      begin
         chkTipoTelefone.State[0] := cbChecked;
         sTipo := 'C';
      end;

      CdsTelefone.FieldByName('TIPO').AsString := sTipo;
   end;
end;

procedure TFrmPessoaMT.dbedNomeFantasiaExit(Sender: TObject);
begin
   {** Verificado! **}
   inherited;

   If (Cds.State In [DsEdit, DsInsert]) And
      (Cds.FieldByName('RAZAOSOCIAL').AsString = '') Then
      Cds.FieldByName('RAZAOSOCIAL').AsString := Cds.FieldByName('NOME').AsString;

   if (dbedNomeFantasia.Modified) and (dbedDocumento.Text = '') and (dbedNomeFantasia.text <> '') then
   begin
      with CdsEscolhePessoa do
      begin
         Data := Pessoa.SelPessoaByName(Cds.FieldByName('IDPESSOA').AsFloat, dbedNomeFantasia.text);

         if Not IsEmpty Then
         begin
            Application.CreateForm(TfrmEscolhePessoa, frmEscolhePessoa);

            bJaExiste := true;

            If Pessoa.EJuridica Then
            begin
               MsgDlg('Já existe cadastro com este Nome Fantasia', Caption, mtWarning , [mbOk], 0);
               frmEscolhePessoa.sNomeCodigo := 'Nome fantasia';
            end
            Else
            begin
                 MsgDlg('Já existe cadastro com este Nome', Caption, mtWarning , [mbOk], 0);
                 frmEscolhePessoa.sNomeCodigo := 'Nome';
            end;

            frmEscolhePessoa.dbgEscolhe.DataSource := dsEscolhePessoa;
            if frmEscolhePessoa.ShowModal = mrOK then
            begin
                 bbtnCancelarClick(Self);
                 SelPessoa( FieldByName('IDPESSOA').AsInteger );
                 sbtnAlterarClick(Self);
            end;
         end;

         Close;
      end;
   end;
end;

procedure TFrmPessoaMT.dbedDocumentoExit(Sender: TObject);
var
   tempItem : TListItem;
begin
   {** Verificado! **}
   inherited;
   if (dbedDocumento.modified) and (dbedDocumento.text <> '') then
   begin
      if Pessoa.DocumentoValido(dbedDocumento.text) then       
      begin
         With CdsEscolhePessoa Do
         Begin
            Data := Pessoa.SelPessoaByDocument(Cds.FieldByName('IDPESSOA').AsFloat, dbedDocumento.text);

            if Not IsEmpty Then
            begin
               Application.CreateForm(TfrmEscolhePessoa, frmEscolhePessoa);

               bJaExiste := true;
               MsgDlg('Este '+lblDocumento.Caption+' já existe no cadastro', Caption, mtWarning , [mbOk], 0);
               frmEscolhePessoa.sNomeCodigo := lblDocumento.Caption;
               frmEscolhePessoa.dbgEscolhe.DataSource := dsEscolhePessoa;

               if frmEscolhePessoa.ShowModal = mrOK then
               begin
                  bbtnCancelarClick(Self);
                  SelPessoa(FieldByName('IDPESSOA').AsFloat);
                  sbtnAlterarClick(Self);
               end
               Else
               Begin
                  If Not Sistema.DuplicaDocPessoa Then
                  Begin
                    MsgDlg('Não é permitido a duplicidade de número de documento no cadastro de Pessoa.', Caption, mtWarning , [mbOk], 0);
                    bbtnCancelarClick(Self);
                  End;
               End;
            end;
         end;

         if CmeCadastro.Operacao in [opInserir,opAlterar] then

         with CdsDocumento do
         begin
            tempItem := lstDocumentos.Selected;
            lstDocumentos.Selected := lstDocumentos.FindData(0, TObject(Pessoa.IdDocChave), true,false);
            //Marcus Oliveira - 03/07/2007 P. 25348
            Locate('IDDOCUMENTO', Pessoa.IdDocChave,[]);
            
            Edit;
            FieldByname('NUMDOCUMENTO').AsString := dbedDocumento.text;
            edDocNumDocumentoExit(Self);
            lstDocumentos.Selected := tempItem;
         end;
      end
      else
      begin
         if CmeCadastro.Operacao in [opInserir,opAlterar] then
         begin
              MsgDlg('Número do ' + lblDocumento.Caption + ' inválido. Verifique !', Caption, mtError , [mbOk,mbHelp], 0);   // Paulo Nobre - WO33342
              Cds.FieldByName('NUMDOCUMENTO').clear ;
              if dbedDocumento.CanFocus then dbedDocumento.setfocus;
         end;
      end;
   end;
end;

procedure TFrmPessoaMT.AtuDocumentos;
var
  li : TListItem;
begin
   {** Verificado! **}
   with CdsDocumento do
   begin
      lstDocumentos.Onchange := nil;
      lstDocumentos.Items.clear;
      First;
      while not eof do
      begin
           li := lstDocumentos.Items.Add;
           li.Caption := FieldByName('NOMEDOCUMENTO').AsString;
           li.Data := TObject(FieldByName('IDDOCUMENTO').AsInteger);
           if FieldByName('IDIMAGEM').IsNull then
           begin
                li.ImageIndex := 0;
           end
           else
           begin
                li.ImageIndex := 1;
           end;
           //Thaise Amaral SOL 166680 Ktn 1453334
           //Essa rotina deverá ser executada apenas estando no Folha de Pagameto.
           if Sistema.IdModulo = 21 then
           begin
             //Vinicius Maciel SOL138283 Kintana 840489
             if (FieldByName('FLGMULTIPLAMASCARA'). AsString = 'S') then
                 begin
                 Pessoa.MaskField(Pessoa.SelMascara(FieldByName('IDDOCUMENTO').AsString,''));
                 if (FieldByName('IDtipodocpessoaxmasc').asString) <> '' then
                 FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(Pessoa.SelMascara(FieldByName('IDDOCUMENTO').AsString,''));
                 end
             else
             //Vinicius Maciel SOL138283 Kintana 840489
             FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(FieldByName('MASCARA').AsString);
           end;
           edDocNumDocumento.SelectAll;
           li.SubItems.Add(edDocNumDocumento.SelText);
           edDocNumDocumento.ClearSelection;
           next;
      end;
      if recordcount > 1 then
      begin
           lstDocumentos.OnChange := lstDocumentosChange;
           lstDocumentos.Items[0].Selected := true;
           lstDocumentos.Items[0].Focused := true;
      end;
   end;
end;


procedure TFrmPessoaMT.pnlItemsDocResize(Sender: TObject);
begin
   {** Verificado! **}
   inherited;
   with pnlItemsDoc do
   begin
        Height := tbsDocumento.Height;
        left := lstDocumentos.Width+1;
        Top := 0;
   end;
end;

procedure TFrmPessoaMT.lstDocumentosChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
   inherited;
   lstDocumentos.OnChange := nil; //Vinicius Maciel SOL138283 Kintana 840489
   {** Verificado! **}
   if Item.Selected then MudaDocumento;
   lstDocumentos.OnChange := lstDocumentosChange; //Vinicius Maciel SOL138283 Kintana 840489
end;

procedure TFrmPessoaMT.dbcmbEstadoDocChange(Sender: TObject);
begin
   inherited;
   {** Verificado! **}
   // Início - Michelle Mota - SIG 22093
   {with CdsDocumento do
        if not (State in [dsInactive,dsBrowse]) then
           FieldByname('IDPAIS').AsFloat := CdsEstado.FieldByName('IDPAIS').AsFloat;}
   // Término - Michelle Mota - SIG 22093        
end;



procedure TFrmPessoaMT.dsStateChange(Sender: TObject);
begin
   {** Verificado! **}
   inherited;

   if Cds.State in [dsInsert, dsEdit] then
   begin
      dsDocumento.AutoEdit := True;
      sbtnFisJur.Enabled   := False;
   end
   else
   begin
      dsDocumento.AutoEdit := False;
      sbtnFisJur.Enabled   := True;
   end;

   AutorizarForm(afSoDesabilitar);
end;



procedure TFrmPessoaMT.edDocNumDocumentoExit(Sender: TObject);
begin
   {** Verificado! **}
   inherited;

   if lstDocumentos.Selected <> nil then
   begin
      edDocNumDocumento.SelectAll;
      lstDocumentos.Selected.SubItems[0] := edDocNumDocumento.SelText;
      edDocNumDocumento.ClearSelection;
   end;
end;



procedure TFrmPessoaMT.AtuTipo;
begin
   inherited;
   {** Verificado! **}
   if CmeCadastro.Operacao <> opInserir then
   begin
        if not Cds.IsEmpty then
           Pessoa.Ejuridica := (Cds.FieldByName('TIPO').AsString <> 'F');

        MudaTipo;

        InsereDocumento;
        AtuDocumentos;
   end
   Else
   Begin   
      If Pessoa.Ejuridica Then
      Begin
         Pessoa.GetDadosPessoa(Cds.FieldByName('IDPESSOA').AsFloat, gpDocumentos, tpJuridica);
         //CdsTipoDoc.Data := Pessoa.SelTipoDocPessoa(tpJuridica);
         //CdsDocumento.Data := Pessoa.SelDocPessoa(Cds.FieldByName('IDPESSOA').AsFloat,tpJuridica);
      End
      Else
      Begin
         Pessoa.GetDadosPessoa(Cds.FieldByName('IDPESSOA').AsFloat, gpDocumentos, tpFisica);
         //CdsTipoDoc.Data := Pessoa.SelTipoDocPessoa(tpFisica);
         //CdsDocumento.Data := Pessoa.SelDocPessoa(Cds.FieldByName('IDPESSOA').AsFloat,tpFisica);
      End;
   End;
end;


procedure TFrmPessoaMT.btnAssociarimgPessoaClick(Sender: TObject);
begin
  {** Verificado! **}
  inherited;
  AssociaImagem(dsImagem, TBlobField(CdsImagem.FieldByName('IMAGEM')), TFloatField(Cds.FieldByName('IDIMAGEM')), 'Foto');
  Autorizacao.CarregarImagem(TBlobField(CdsImagem.FieldByName('IMAGEM')), imgPessoa1);   //edilaine WO41032
end;

procedure TFrmPessoaMT.lstDocumentosDblClick(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  MostraDocumento;
end;

procedure TFrmPessoaMT.MostraDocumento;
begin
   {** Verificado! **}
   lstDocumentosChange(self, lstDocumentos.Selected, ctState);

   if CmeCadastro.Operacao in [opInserir,opAlterar] then CdsDocumento.Edit;

   AssociaImagem(dsImagensDoc, TBlobField(CdsImagensDoc.FieldByName('IMAGEM')), TFloatField(CdsDocumento.FieldByName('IDIMAGEM')), lstDocumentos.Selected.Caption );

   if CmeCadastro.Operacao in [opInserir,opAlterar] then CdsDocumento.Post;

   if CdsDocumento.FieldByName('IDIMAGEM').IsNull then
   begin
      lstDocumentos.Selected.ImageIndex := 0;
      if (CdsDocumento.FieldByName('NUMDOCUMENTO').AsString = 'Não informado') and
         (CmeCadastro.Operacao in [opInserir,opAlterar]) then
      begin
         CdsDocumento.Edit;
         CdsDocumento.FieldByName('NUMDOCUMENTO').Clear;
         CdsDocumento.Post;
      end;
   end
   else
   begin
      lstDocumentos.Selected.ImageIndex := 1;
      if (TRIM(CdsDocumento.FieldByName('NUMDOCUMENTO').AsString) = '') and
         (CmeCadastro.Operacao in [opInserir,opAlterar]) then
      begin
         CdsDocumento.Edit;
         if TRIM(CdsDocumento.FieldByName('MASCARA').AsString) = '' then
            CdsDocumento.FieldByName('NUMDOCUMENTO').AsString := 'Não informado'
         else
            CdsDocumento.FieldByName('NUMDOCUMENTO').Clear;
         CdsDocumento.Post;
      end;
    end;
    lstDocumentos.Selected.SubItems[0] := CdsDocumento.FieldByName('NUMDOCUMENTO').AsString;
end;

procedure TFrmPessoaMT.btnLimpaImgPessoaClick(Sender: TObject);
begin
  {** Verificado! **}
  inherited;
  if (not CdsImagem.eof) and
     (MsgDlg('Deseja desassociar a imagem?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
     begin
        CdsImagem.Delete;
        Cds.FieldByName('IDIMAGEM').Clear;
     end;
end;

procedure TFrmPessoaMT.InsereDocumento;
begin
   {** Verificado! **}
   if (Cds.State <> dsInactive) then
   begin
      CdsTipoDoc.First;                                        
      while not CdsTipoDoc.eof do     
         with CdsDocumento do
         begin
            if not CdsDocumento.Locate('IDDOCUMENTO', CdsTipoDoc.FieldByName('IDDOCUMENTO').AsFloat,[]) then
            begin
               Insert;
               CdsDocumento.FieldByName('IDDOCUMENTO').AsFloat    := CdsTipoDoc.FieldByName('IDDOCUMENTO').AsFloat;
               CdsDocumento.FieldByName('NOMEDOCUMENTO').AsString := CdsTipoDoc.FieldByName('NOMEDOCUMENTO').AsString;
               CdsDocumento.FieldByName('MASCARA').AsString       := CdsTipoDoc.FieldByName('MASCARA').AsString;
               CdsDocumento.FieldByName('OBRIGAUF').AsString      := CdsTipoDoc.FieldByName('OBRIGAUF').AsString;
               CdsDocumento.FieldByName('OBRIGAORGAO').AsString   := CdsTipoDoc.FieldByName('OBRIGAORGAO').AsString;
               CdsDocumento.FieldByName('OBRIGAEMISSAO').AsString := CdsTipoDoc.FieldByName('OBRIGAEMISSAO').AsString;
               CdsDocumento.FieldByName('IDPESSOA').AsFloat       := Cds.FieldByName('IDPESSOA').AsFloat;
               CdsDocumento.FieldByName('FLGOBRIGAVALIDADE').AsString := CdsTipoDoc.FieldByName('FLGOBRIGAVALIDADE').AsString;
               //Vinicius Maciel SOL138283 Kintana 840489
               CdsDocumento.FieldByName('FLGMULTIPLAMASCARA').AsString := CdsTipoDoc.FieldByName('FLGMULTIPLAMASCARA').AsString;
               //Vinicius Maciel SOL138283 Kintana 840489 - Fim

               //Higor Nayde Nº SOL250389/17574 NºPPM992385
               CdsDocumento.FieldByName('OBRIGACATG').AsString := CdsTipoDoc.FieldByName('OBRIGACATG').AsString;
               CdsDocumento.FieldByName('OBRIGAPRMHAB').AsString := CdsTipoDoc.FieldByName('OBRIGAPRMHAB').AsString;
               //Higor Nayde Nº SOL250389/17574 NºPPM992385
               // Início - Michelle Mota - SIG 22093
               CdsDocumento.FieldByName('EXIBEUF').AsString       := CdsTipoDoc.FieldByName('EXIBEUF').AsString;
               CdsDocumento.FieldByName('EXIBEORGAO').AsString    := CdsTipoDoc.FieldByName('EXIBEORGAO').AsString;
               CdsDocumento.FieldByName('EXIBEEMISSAO').AsString  := CdsTipoDoc.FieldByName('EXIBEEMISSAO').AsString;
               CdsDocumento.FieldByName('EXIBEVALIDADE').AsString := CdsTipoDoc.FieldByName('EXIBEVALIDADE').AsString;
               CdsDocumento.FieldByName('EXIBEPRMHAB').AsString   := CdsTipoDoc.FieldByName('EXIBEPRMHAB').AsString;
               CdsDocumento.FieldByName('EXIBECATG').AsString     := CdsTipoDoc.FieldByName('EXIBECATG').AsString;
               CdsDocumento.FieldByName('EXIBEPAIS').AsString     := CdsTipoDoc.FieldByName('EXIBEPAIS').AsString;
               CdsDocumento.FieldByName('OBRIGAPAIS').AsString    := CdsTipoDoc.FieldByName('OBRIGAPAIS').AsString;
               // Término - Michelle Mota - SIG 22093
               Post;
            end;

            CdsTipoDoc.next;

         end;
   end;
end;

procedure TFrmPessoaMT.dsDocumentoStateChange(Sender: TObject);
begin
  {** Verificado! **}
  inherited;
  if (dsDocumento.State = dsEdit) and (not(CmeCadastro.Operacao in [opInserir,opAlterar])) then
  begin
     CdsDocumento.Cancel;
     if lstDocumentos.CanFocus then lstDocumentos.SetFocus;
  end;
end;

procedure TFrmPessoaMT.AssociaImagem(dsImg: TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
var
   frmImgDoc : TfrmImagemDoc;
begin
   {** Verificado! **}
   try
      Application.CreateForm(tfrmImagemDoc, frmImgDoc);
      with frmImgDoc do
      begin
         dsImagem := dsImg;
         Imagem   := pImagem;
         CampoPai := Campo;

         bbtnAssociar.Enabled := (CmeCadastro.Operacao in [opInserir,opAlterar]);
         bbtnLimpar.Enabled := (CmeCadastro.Operacao in [opInserir,opAlterar]);
         Caption := Descricao;
         ShowModal;
      end;
   finally
        frmImgDoc.free;
   end;
end;

procedure TFrmPessoaMT.MudaDocumento;
//Vinicius Maciel SOL138283 Kintana 840489
var
sMask : String;
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
begin
   {** Verificado! **}
   with CdsDocumento do
   begin
      if Active then
      begin
         Locate('IDDOCUMENTO', Integer(lstDocumentos.Selected.Data),[]);
         CdsImagensDoc.Locate('IDIMAGEM', FieldByName('IDIMAGEM').AsFloat,[]);
         FieldByName('NUMDOCUMENTO').EditMask := StringReplace(Pessoa.MaskField(FieldByName('MASCARA').AsString), '#', 'a', [rfReplaceAll]);
         // Início - Michelle Mota - SIG 22093
          //         pnlEmissao.Visible := (FieldByName('OBRIGAEMISSAO').AsString = 'S') ;
          //         pnlUF.Visible := (FieldByName('OBRIGAUF').AsString = 'S');
          //         pnlOrgao.Visible := (FieldByName('OBRIGAORGAO').AsString = 'S');
          //         PnlValidade.Visible := (FieldByName('FLGOBRIGAVALIDADE').AsString = 'S');
         //Higor Nayde Nº SOL250389/17574 NºPPM992385
          //         pnlCategoria.VIsible := (FieldByName('OBRIGACATG').AsString = 'S');
          //         pnlDataHabilitacao.VIsible := (FieldByName('OBRIGAPRMHAB').AsString = 'S');
         //Higor Nayde Nº SOL250389/17574 NºPPM992385
         //Vinicius Maciel SOL138283 Kintana 840489

         pnlEmissao.Visible         := (FieldByName('EXIBEEMISSAO').AsString = 'S') ;
         pnlUF.Visible              := (FieldByName('EXIBEUF').AsString = 'S');
         pnlOrgao.Visible           := (FieldByName('EXIBEORGAO').AsString = 'S');
         PnlValidade.Visible        := (FieldByName('EXIBEVALIDADE').AsString = 'S');
         pnlCategoria.VIsible       := (FieldByName('EXIBECATG').AsString = 'S');
         pnlDataHabilitacao.VIsible := (FieldByName('EXIBEPRMHAB').AsString = 'S');
         pnlPais.VIsible            := (FieldByName('EXIBEPAIS').AsString = 'S');
         // Término - Michelle Mota - SIG 22093
           if (Self.FindComponent('pnlTipoDocumento') <> nil) then
           begin
               TPanel(Self.FindComponent('pnlTipoDocumento')).Visible := (FieldByName('FLGMULTIPLAMASCARA').AsString = 'S');
               if (FieldByName('FLGMULTIPLAMASCARA'). AsString = 'S') then
               begin
                   if (FieldByName('IDTIPODOCPESSOAXMASC').asString <> '') then
                   begin
                   TCMCLientDataSet(Self.FindComponent ('CdsTipoDocumento')).Locate('IDTIPODOCPESSOAXMASC',FieldByName('IDTIPODOCPESSOAXMASC').asString,[]);
                   TCMDBLookupCombo(Self.FindComponent('dbcmbTipoDocumento')).text := TCMCLientDataSet(Self.FindComponent ('CdsTipoDocumento')).FieldByName('Nome').asString;
                   if (FieldByName('IDTIPODOCPESSOAXMASC').asString) <>'' then
                   sMask :=Pessoa.SelMascara(FieldByName('IDDOCUMENTO').asString,FieldByName('IDTIPODOCPESSOAXMASC').asString);
                   Pessoa.SelMascara(FieldByName('IDDOCUMENTO').AsString,'');
                   end
                   else
                   begin
                     TCMDBLookupCombo(Self.FindComponent('dbcmbTipoDocumento')).LookupValue := ' ';
                     TCMDBLookupCombo(Self.FindComponent('dbcmbTipoDocumento')).text := ' ';
                   end;
               end;
           end;
         //Vinicius Maciel SOL138283 Kintana 840489 - Fim
         //Thaise - Os campos só podem ser travados e pintados se a flag mostrar que o cadastro
         //tem que ser travado, e somente campos especificados na RM
         if bTtravarCadastro then
         begin
           if  (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Identidade') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cart. Indentidade Profissional') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Trabalho') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cert Milit -Serie/CSM/RMDN/Cat') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cert Militar - Tipo/Numero') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'CPF') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'CRC') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Dt. Instr. Part. Contratual') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Matricula Caixa') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Matricula Funcef') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'MIBA') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'NUMERO DO AVISO DE RECEBIMENTO') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'PIS/PASEP') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Registro de Aposentadoria') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Titulo de Eleitor - Numero') or
               (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Titulo de Eleitor - Zona/Secao') then
           begin
             edDocNumDocumento.Enabled:= False;
             PintarCampos([edDocNumDocumento], clGray);
             if  CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Identidade' then
             begin
               EdtOrgaoEmissor.Enabled:= False;
               dbcmbEstadoDoc.Enabled:= False;
               EdtDataEmissao_Padao.Enabled:= False;
               PintarCampos([EdtOrgaoEmissor, dbcmbEstadoDoc, EdtDataEmissao_Padao], clGray);
             end;

             if  CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cart. Indentidade Profissional' then
             begin
               EdtOrgaoEmissor.Enabled:= False;
               dbcmbEstadoDoc.Enabled:= False;
               EdtDataEmissao_Padao.Enabled:= False;
               PintarCampos([EdtOrgaoEmissor, dbcmbEstadoDoc, EdtDataEmissao_Padao], clGray);
             end;

             if CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Trabalho' then
             begin
               dbcmbEstadoDoc.Enabled:= False;
               EdtDataEmissao_Padao.Enabled:= False;
               PintarCampos([dbcmbEstadoDoc, EdtDataEmissao_Padao], clGray);
             end;

             if (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'NUMERO DO AVISO DE RECEBIMENTO') or
                (CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'PIS/PASEP') then
             begin
               EdtDataEmissao_Padao.Enabled:= False;
               PintarCampos([EdtDataEmissao_Padao], clGray);
             end;
           end
           else
           begin
             edDocNumDocumento.Enabled:= True;
             EdtOrgaoEmissor.Enabled:= True;
             dbcmbEstadoDoc.Enabled:= True;
             EdtDataEmissao_Padao.Enabled:= True;

             PintarCampos([edDocNumDocumento, EdtOrgaoEmissor, dbcmbEstadoDoc, EdtDataEmissao_Padao], clWindow);
           end;
         end;

      end;
   end;
   //Vinicius Maciel SOL138283 Kintana 840489
   if sMask <> '' then
   CdsDocumento.FieldByName('NUMDOCUMENTO').Editmask := StringReplace(Pessoa.MaskField(sMask), '#', 'a', [rfReplaceAll]);
   //Vinicius Maciel SOL138283 Kintana 840489 - Fim
end;

procedure TFrmPessoaMT.dsImagemDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {** Verificado! **}
  if Pessoa.MostraFoto then
  Begin
     imgPessoa.Left := 0;
     imgPessoa.Top := 0;

     if (Field = nil) then
       if CdsImagem.FieldByName('IMAGEM').IsNull then
       Begin
          imgPessoa.Visible := false;
          imgPessoa.Width := 0;
          imgPessoa.Height := 0;
       End
       else
       Begin
          imgPessoa.Width := imgPessoa.Picture.Width + 2;
          imgPessoa.Height := imgPessoa.Picture.Height + 2;
          imgPessoa.Visible := true;
       End;
  End;
end;

procedure TFrmPessoaMT.dsTelefoneDataChange(Sender: TObject; Field: TField);
var
   i : integer;
   sTipo : string;
begin
   {** Verificado! **}
   inherited;
   if (Field = nil) or (Field = CdsTelefone.FieldByName('TIPO')) then
   begin
      for i := 0 to chkTipoTelefone.Items.Count-1 do
          chkTipoTelefone.State[i] := cbUnChecked;

      sTipo := TRIM(CdsTelefone.FieldByName('TIPO').AsString);
      for i := 1 to LENGTH(sTipo) do begin
          if 'C' = Copy(sTipo,i,1) then
             chkTipoTelefone.State[0] := cbChecked;
          if 'P' = Copy(sTipo,i,1) then
             chkTipoTelefone.State[1] := cbChecked;
          if 'F' = Copy(sTipo,i,1) then
             chkTipoTelefone.State[2] := cbChecked;
          if 'L' = Copy(sTipo,i,1) then
             chkTipoTelefone.State[3] := cbChecked;
          if 'R' = Copy(sTipo,i,1) then
             chkTipoTelefone.State[4] := cbChecked;
      end;
   end;
end;

procedure TFrmPessoaMT.dsEnderecoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {** Verificado! **}
  if Field = nil then
  begin
       if (CdsEndereco.FieldByName('IdEndereco').IsNull) then
       begin
            chkTipoEndereco.Checked[0] := false;
            chkTipoEndereco.Checked[1] := false;
            chkTipoEndereco.Checked[2] := false;
            chkTipoEndereco.Checked[3] := false;
            chkTipoEndereco.Checked[4] := false;
       end
       else
       begin
            chkTipoEndereco.Checked[0] := (Cds.FieldByName('IdEndComercial').AsFloat = CdsEndereco.FieldByName('IdEndereco').AsFloat);
            chkTipoEndereco.Checked[1] := (Cds.FieldByName('IdEndResidencial').AsFloat = CdsEndereco.FieldByName('IdEndereco').AsFloat);
            chkTipoEndereco.Checked[2] := (Cds.FieldByName('IdEndEntrega').AsFloat = CdsEndereco.FieldByName('IdEndereco').AsFloat) ;
            chkTipoEndereco.Checked[3] := (Cds.FieldByName('IdEndCobranca').AsFloat = CdsEndereco.FieldByName('IdEndereco').AsFloat);
            chkTipoEndereco.Checked[4] := (Cds.FieldByName('IdEndCorresp').AsFloat = CdsEndereco.FieldByName('IdEndereco').AsFloat);
       end;
  end;
end;

procedure TFrmPessoaMT.chkTipoEnderecoClickCheck(Sender: TObject);
var
  Campo : TField;
begin
  inherited;
  {** Verificado! **}
  Campo := nil;
  case chkTipoEndereco.ItemIndex of
       0 : Campo := Cds.FieldByName('IdEndComercial');
       1 : Campo := Cds.FieldByName('IdEndResidencial');
       2 : Campo := Cds.FieldByName('IdEndEntrega');
       3 : Campo := Cds.FieldByName('IdEndCobranca');
       4 : Campo := Cds.FieldByName('IdEndCorresp');
  end;

  if chkTipoEndereco.Checked[chkTipoEndereco.ItemIndex] then
     Campo.AsFloat := CdsEndereco.FieldByName('IdEndereco').AsFloat
  else
     Campo.Clear;
end;

procedure TFrmPessoaMT.PnlAssociaFoto_PadraoResize(Sender: TObject);
begin
  {** Verificado! **}
  inherited;
  btnAssociarimgPessoa.Left := Round(((PnlAssociaFoto_Padrao.Width - btnAssociarimgPessoa.Width)/2) + 4);
end;



procedure TFrmPessoaMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      SelPessoa((StrToIntDef(MontaSelect.ValoresChave[0],0)));
      Autorizacao.CarregarImagem(TBlobField(CdsImagem.FieldByName('IMAGEM')), imgPessoa1);   //edilaine WO41032
   end;
end;



procedure TFrmPessoaMT.CmeCadastroInsert(Sender: TObject);
begin
   {** Verificado! **}
   EnableControls(True);
   SelPessoa(-99);
   Cds.FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MascaraDocum;

   inherited;

   bJaExiste := false;

   Cds.FieldByName('IDPESSOA').AsFloat := Pessoa.GetNextID;

   if (sbtnFisJur.Tag = 1) then
   begin
      Pessoa.EJuridica                  := False;
      Cds.FieldByName('TIPO').AsString  := 'F'
   end
   else
   begin
      Pessoa.EJuridica                  := True;
      Cds.FieldByName('TIPO').AsString  := 'J';
   end;

   if (Pessoa.SaveModuloRespon) and (Sistema.ViculaModuloxPessoa) then
      Cds.FieldByName('IDMODULORESPON').AsFloat := Sistema.IdModulo;

   if dbedDocumento.CanFocus then dbedDocumento.SetFocus;

   CdsSubTipo.Insert;
   CdsSubTipo.FieldByName(Pessoa.NomeCampoId).AsFloat := Cds.FieldByName('IDPESSOA').AsFloat;

   if not(Pessoa.EJuridica) then
   begin
      CdsPessoaFisica.Insert;
      CdsPessoaFisica.FieldByName('IDPESSOA').AsFloat := Cds.FieldByName('IDPESSOA').AsFloat;
   end;

  InsereDocumento;
  HabilitarCampos;
  // AtuDocumentos;
  MudaDocumento;  // William Santana - SOL 229871.16137 PPM 407073
end;

procedure TFrmPessoaMT.CmeCadastroEdit(Sender: TObject);
begin
  {** Verificado! **}
  EnableControls(True);
  
  bJaExiste := true;

  inherited;

  MudaDocumento;  // William Santana - SOL 229871.16137 PPM 407073

  if dbedDocumento.CanFocus then dbedDocumento.setfocus;

  if CdsSubTipo.IsEmpty then
  begin
    CdsSubTipo.Insert;
    CdsSubTipo.FieldByName(Pessoa.NomeCampoId).AsFloat := Cds.FieldByname('IDPESSOA').AsFloat;
  end
  Else
    CdsSubTipo.Edit;

  If (sbtnFisJur.Tag = 1) Then
  Begin
     Pessoa.EJuridica := False;
     Cds.FieldByName('TIPO').AsString := 'F'
  End
  Else
  Begin
     Pessoa.EJuridica := True;
     Cds.FieldByName('TIPO').AsString := 'J';
  End;


  If Pessoa.SaveModuloRespon And
     Sistema.ViculaModuloxPessoa Then
     Cds.FieldByname('IDMODULORESPON').AsFloat := Sistema.IdModulo;

  if Not Pessoa.EJuridica then
  begin
     if CdsPessoaFisica.IsEmpty Then
     begin
        CdsPessoaFisica.Insert;
        CdsPessoaFisica.FieldByName('IDPESSOA').AsFloat := Cds.FieldByname('IDPESSOA').AsFloat;
     end
     Else
        CdsPessoaFisica.Edit
  end;

  //Thaise - bTtravaCadastro para indicar se terá que travar ou não os campos.
  bTtravarCadastro:= False;

  //Thaise
  //Verificando se a alteração tem que ser travada atendendo 2 premissas:
  //se o módulo <> Folha de Pagamento
  //Se a pessoa possui vinculo empregatício com a Funcef
  if Pessoa.TravaAlteracao(Cds.FieldByName('IDPESSOA').AsInteger) then
  begin
    bTtravarCadastro:= True;
    dbedDocumento.Enabled:= False;
    dbedNomeFantasia.Enabled:= False;
    dbedemail.Enabled:= False;
    DbeHomePage_Padrao.Enabled:= False;

    lTelefone:= '';
    CdsTelefone.First;
    while not CdsTelefone.Eof do
    begin
      lTelefone:= lTelefone + ' ' + CdsTelefone.FieldByName('IDTELEFONE').AsString;
      CdsTelefone.Next;
    end;

    //Obtendo o ID do telefone, Endereço, Contato  e Banco que já está salvo no cadastro;
    //Ficará salvo na lista para fixar os registros filhos que já existem na tabela e já estão comitados;
    lEndereco:= '';
    CdsEndereco.First;
    while not CdsEndereco.Eof do
    begin
      lEndereco:= lEndereco + ' ' + CdsEndereco.FieldByName('IDENDERECO').AsString;
      CdsEndereco.Next;
    end;

    lContato:= '';
    CdsContato.First;
    while not CdsContato.Eof do
    begin
      lContato:= lContato + ' ' + CdsContato.FieldByName('IDCONTATO').AsString;
      CdsContato.Next;
    end;

    lBanco:= '';
    CdsContaBancaria.First;
    while not CdsContaBancaria.Eof do
    begin
      lBanco:= lBanco + ' ' + CdsContaBancaria.FieldByName('IDCBANCARIA').AsString;
      CdsContaBancaria.Next;
    end;

    lblMsg.Visible:= True;
    lblMsg.Caption:= '* Os Campos bloqueados só podem ser'#13#10 +
                     'alterados no módulo Folha de Pagamento';

    EdtOrgaoEmissor.Enabled:= False;
    dbcmbEstadoDoc.Enabled:= False;
    EdtDataEmissao_Padao.Enabled:= False;
    edDocNumDocumento.Enabled:= False;

    //Thaise - Pintar os campos em seguida, para indicar
    //que os campos bloqueados e pintados não podem ser alterados
    PintarCampos([EdtOrgaoEmissor, dbcmbEstadoDoc, EdtDataEmissao_Padao, edDocNumDocumento], clGray);

    PintarCampos([DBEDDDI, DBEDDDD, DBEDNUMERO, GroupBox4, GrdExibeContatos_Padrao,
                  BtnContatoTel, dbedNomeEndereco, dbedLogradouro, DBNUMERO, DBEDCOMPLEMENTO,
                  dbedBairro, dbedCEP, CmpCidades, dbedEstado, dbedPais, grpTipoEnd,
                  dblkBanco, BtnTelefones, dbedcontatoemail, EdtDataNascimento_Padrao,
                  EdtCargo_Padrao, EdtSetor_Padrao, DbmObs_Padrao, GrdTelefones_Padrao,
                  BtnBuscaAgencia, dbedDocumento, dbedNomeFantasia, dbedemail,
                  DbeHomePage_Padrao, chkTipoEndereco, DbeAgencia, dbedConta,
                  ChbContaPref_Padrao], clGray);

  end;

end;

procedure TFrmPessoaMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  {** Verificado! **}
  inherited;

  btnAssociarimgPessoa.Enabled := (CmeCadastro.Operacao in [opInserir,opAlterar]);

  if Pessoa.TipoPessoa = tpOpcional then
     sbtnFisJur.Enabled := not (CmeCadastro.Operacao in [opInserir, opAlterar]);
end;

procedure TFrmPessoaMT.CmeCadastroCancel(Sender: TObject);
begin
  {** Verificado! **}
  inherited;
  edDocNumDocumentoExit(Self);
  HabilitarCampos;
  Autorizacao.CarregarImagem(TBlobField(CdsImagem.FieldByName('IMAGEM')), imgPessoa1);   //edilaine WO41032
end;

procedure TFrmPessoaMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
Var
  iNumContaPref: Integer;
begin
  {** Verificado! **}
  inherited;
  // início - andre tavares - pendência 18016 - 15/02/2004
  cdsDocumento.DisableControls;
  cdsDocumento.first;
  while not cdsDocumento.eof do
  begin
     //catia - 03/11/06 -
     if trim(cdsDocumento.fieldByName('NUMDOCUMENTO').asString) = '' then
       pessoa.SetaNumCGCCPF(cdsDocumento.fieldByName('iddocumento').asInteger,
                            cdsDocumento.fieldByName('NUMDOCUMENTO').asString);
                            
     cdsDocumento.next;
  end;
  cdsDocumento.EnableControls;
  // fim - andre tavares - pendência 18016 - 15/02/2004


  iNumContaPref := 0;
  With CdsContaBancaria Do
  Begin
    First;
    While Not Eof Do
    Begin
       If (CdsContaBancaria.FieldByName('FLGCONTAPREF').AsInteger = 1) Then
           Inc(iNumContaPref);
       Next;
    End; {While Not Eof Do}

    Accept := (IsEmpty Or (iNumContaPref = 1));
  End;

  If Not Accept Then
  Begin
     If iNumContaPref = 0 Then
        MsgDlg('Não foi indicada a Conta Bancária preferencial do Favorecido','Atenção',mtError,[mbOk],0)
     Else
        MsgDlg('Foi indicada mais de uma Conta Bancária preferencial do Favorecido. Favor corrigir o cadastro.','Atenção',mtError,[mbOk],0);
  End
  Else
   //andré tavares - pendência 22551 - 26/08/2006
   //If (Sistema.ObrigaDocPessoa) And Pessoa.ObrigaDocumento And (Cds.FieldByName('NUMDOCUMENTO').IsNull) Then
   If (Sistema.ObrigaDocPessoa) And Pessoa.ObrigaDocumento And ((Cds.FieldByName('NUMDOCUMENTO').IsNull ) OR (Cds.FieldByName('NUMDOCUMENTO').AsString = '')) Then
    Begin
       MsgDlg('É Obrigatória a indicação do ' + lblDocumento.Caption, Caption, mtError , [mbOk], 0);
       Accept := false;
    End;

  If Accept Then
     Accept  := (CmpGrupo.Valida = vcOk);
end;

procedure TFrmPessoaMT.CmeDetalheInsert(Sender: TObject);
begin
  {** Verificado! **}
  Inherited;
  If pgCtrlDetalhe.ActivePage = tbsDet Then
  begin
     CdsEndereco.FieldByName('IDPESSOA').AsFloat := Cds.FieldByName('IDPESSOA').AsFloat;

     CdsEndereco.FieldByName('IDENDERECO').AsFloat  := Pessoa.GetNextID;
     CdsEndereco.FieldByName('NOMEESTADO').AsString := '';
     CdsEndereco.FieldByName('NOMEPAIS').AsString   := '';

     if dbedNomeEndereco.CanFocus then dbedNomeEndereco.SetFocus ;
  end
  else
    if pgCtrlDetalhe.ActivePage = tbsTelefone then
    begin
       CdsTelefone.FieldByName('IDENDERECO').AsFloat := CdsEndereco.FieldByName('IDENDERECO').AsFloat;
       CdsTelefone.FieldByName('IDTELEFONE').AsFloat := Pessoa.GetNextID;

       CdsTelContato.Filter := 'IDTELEFONE = ' + QuotedStr(FloatToStr(CdsTelefone.FieldByName('IDTELEFONE').AsFloat));

       chkTipoTelefone.State[0] := cbChecked;
       CdsTelefone.FieldByName('TIPO').AsString := 'C';

       if DBEDDDI.CanFocus then DBEDDDI.SetFocus ;
    end
    else
      if pgCtrlDetalhe.ActivePage = tbsContato then
      begin
         CdsContato.FieldByname('IDENDERECO').AsFloat := CdsEndereco.FieldByName('IDENDERECO').AsFloat;
         CdsContato.FieldByname('IDCONTATO').AsFloat := Pessoa.GetNextID;

         CdsTelContato.Filter := 'IDCONTATO = ' + QuotedStr(FloatToStr(CdsContato.FieldByname('IDCONTATO').AsFloat));

         if dbedContatoNome.CanFocus then dbedContatoNome.SetFocus ;
      end;
end;

procedure TFrmPessoaMT.CmeDetalheEdit(Sender: TObject);
begin
  {** Verificado! **}
  inherited;
  If pgCtrlDetalhe.ActivePage = tbsDet Then
     if dbedNomeEndereco.CanFocus then dbedNomeEndereco.SetFocus
  Else
    If pgCtrlDetalhe.ActivePage = tbsTelefone Then
    begin
       CdsTelContato.Filter := 'IDTELEFONE = ' +  QuotedStr(FloatToStr(CdsTelefone.FieldByName('IDTELEFONE').AsFloat));
       if DBEDDDI.CanFocus then DBEDDDI.SetFocus;
    end
    Else
      If pgCtrlDetalhe.ActivePage = tbsContato Then
      Begin
         CdsTelContato.Filter := 'IDCONTATO = ' + QuotedStr(FloatToStr(CdsContato.FieldByName('IDCONTATO').AsFloat));
         if dbedContatoNome.CanFocus then dbedContatoNome.SetFocus ;
      end;
end;

procedure TFrmPessoaMT.CmeDetalheConfirma(Sender: TObject);
begin
  {** Verificado! **}
  If pgCtrlDetalhe.ActivePage = tbsDet Then
  Begin
    if (CdsEndereco.FieldByName('NOME').IsNull) then
    begin
       MsgDlg('Digite um nome que identifique o endereço', Caption, mtWarning , [mbOk], 0);
       if dbedNomeEndereco.CanFocus then dbedNomeEndereco.SetFocus;
       Exit;
    end;

    if (CdsEndereco.FieldByName('IDCIDADES').IsNull) then        
    begin
       MsgDlg('Escolha a cidade onde está localizado este endereço', Caption, mtWarning , [mbOk], 0);
       If CmpCidades.CanFocus then CmpCidades.SetFocus;
       Exit;
    end;
  end
  Else
    If pgctrlDetalhe.ActivePage = tbsDadosBancarios Then
    Begin
       If (Not CdsContaBancaria.IsEmpty) Then
       Begin
         If Not (((dblkBanco.Text  <> '') And (DbeAgencia.Text <> '')) Or
                 ((dblkBanco.Text  =  '') And (DbeAgencia.Text =  ''))) Then
         Begin
           MsgDlg('Faltam dados para a informação da conta bancária','Atenção',mtError,[mbOk],0);
           Exit;
         End;

         If (CdsBanco.FieldByName('FLGVALIDACC').AsString <> 'N') Then
         Begin
           With TCalcDv.Create Do
             Try
               TipoConta := CdsContaBancaria.FieldByName('TIPOCONTA').AsInteger;
               If (Trim(dbedConta.Text) <> '')  And
                  (Trim(dblkBanco.Text)  <> '') And
                  (Trim(DbeAgencia.Text) <> '') And
                  (Not ValidaConta(CdsContaBancaria.FieldByName('NUMBANCO').AsString,
                                         CdsContaBancaria.FieldByName('NUMAGENCIA').AsString,
                                         CdsContaBancaria.FieldByName('CONTACORRENTE').AsString,True)) Then Exit;
             Finally
               Free;
             End;
         End;

         If Not (CdsContaBancaria.State In [DsEdit, DsInsert]) Then CdsContaBancaria.Edit;
         CdsContaBancaria.FieldByName('IDAGENCIA').AsFloat := Pessoa.GetIdAgencia(CdsContaBancaria.FieldByName('IDBANCO').AsFloat, CdsContaBancaria.FieldByName('NUMAGENCIA').AsString);
       End;
    End;

  inherited;
end;

procedure TFrmPessoaMT.sbtnAlterarClick(Sender: TObject);
begin
  {** Verificado! **}
  If (Not Cds.FieldByName('IDMODULORESPON').IsNull) And
     (Sistema.ViculaModuloxPessoa) And
     (Cds.FieldByName('IDMODULORESPON').AsFloat <> Sistema.IdModulo) Then
     MsgDlg('Este registro só pode ser alterado no Sistema de origem do mesmo. ( IdModulo = ' + Cds.FieldByName('IDMODULORESPON').AsString + ')', 'Atenção', mtInformation, [mbOk],0)
  Else
    inherited;
   //Marcus Oliveria P.25574 10/07/2007
   if (CDS.FieldByName('NUMDOCUMENTO').AsString <> '') and     //edilaine SIG115265
      ( ( Pessoa.Ejuridica and (Length( CDS.FieldByName('NUMDOCUMENTO').AsString ) <> 14 ) OR
        ( not Pessoa.EJuridica) and (Length( CDS.FieldByName('NUMDOCUMENTO').AsString ) <> 11 ) ) ) then
   begin
     cds.fieldbyname('NUMDOCUMENTO').AsString := '';
     showMessage(Pessoa.NomeDocumento + ' ' + 'Inválido.');
   end;

end;

procedure TFrmPessoaMT.sbtnApagarClick(Sender: TObject);
begin
  {** Verificado! **}
  If (Not Cds.FieldByName('IDMODULORESPON').IsNull) And
     (Sistema.ViculaModuloxPessoa) And
     (Cds.FieldByName('IDMODULORESPON').AsFloat <> Sistema.IdModulo) Then
     MsgDlg('Este registro só pode ser alterado no Sistema de origem do mesmo. ( IdModulo = ' + Cds.FieldByName('IDMODULORESPON').AsString + ')', 'Atenção', mtInformation, [mbOk],0)
  Else
    inherited;
end;

procedure TFrmPessoaMT.SelPessoa(rIdPessoa: Double);
begin
  {** Verificado! **}

  {
  Cds.Data := Pessoa.SelPessoa(rIdPessoa);
  CdsEndereco.Data := Pessoa.SelEndPess(rIdPessoa);
  CdsTelefone.Data := Pessoa.SelTelEndPess(rIdPessoa);
  CdsContato.Data := Pessoa.SelContatoPess(rIdPessoa);
  CdsPessoaFisica.Data := Pessoa.SelPessoaFisica(rIdPessoa);
  CdsTelContato.Data := Pessoa.SelTelContato(rIdPessoa);
  CdsImagem.Data := Pessoa.SelImagemPessoa(rIdPessoa);
  CdsImagensDoc.Data := Pessoa.SelImagensDocPessoa(rIdPessoa);

  CdsContaBancaria.Data := Pessoa.SelContaBancaria(rIdPessoa);
  }

  If rIdPessoa = -271504 Then
     Pessoa.GetDadosPessoa(rIdPessoa, gpFull, Pessoa.TipoPessoa)
  Else
     Pessoa.GetDadosPessoa(rIdPessoa, gpDados, Pessoa.TipoPessoa);

  AtuTipo;

  SelSubTipo(rIdPessoa);

  tbcDetalheChange(tbcDetalhe);
end;

procedure TFrmPessoaMT.BtnContatoTelClick(Sender: TObject);
begin
  inherited;
  bExibeContato := True;
  HabilitaBtnRamal(True);
  LblTelContato.Caption := 'Contato';

  dblcContato.Visible := True;
  ToolTelContato.Caption := 'Contatos associados ao Telefone';
  pnlCaptionTelContato.Caption := 'Contatos associados ao Telefone'; // Felipe A. Santos SOL 229871.16137 PPM 407073
  ToolTelContato.Left := 297;
  ToolTelContato.Top := 195;
  ToolTelContato.Show;
  GrdContatoTel.BringToFront;  // Felipe A. Santos SOL 229871.16137 PPM 407073
end;

procedure TFrmPessoaMT.BtnTelefonesClick(Sender: TObject);
begin
  inherited;
  bExibeContato := False;
  HabilitaBtnRamal(True);
  LblTelContato.Caption := 'Telefone';

  dblcTelefone.Visible := True;
  ToolTelContato.Caption := 'Telefones associados ao Contato';
  pnlCaptionTelContato.Caption := 'Telefones associados ao Contato'; // Felipe A. Santos SOL 229871.16137 PPM 407073
  ToolTelContato.Left := 348;
  ToolTelContato.Top := 195;

  ToolTelContato.Show;
  GrdTelContato.BringToFront;  // Felipe A. Santos SOL 229871.16137 PPM 407073
end;

procedure TFrmPessoaMT.ToolTelContatoVisibleChanged(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := Not ToolTelContato.Visible;
  Dock971.Enabled := Not ToolTelContato.Visible;
  Dock972.Enabled := Not ToolTelContato.Visible;

  If Not ToolTelContato.Visible Then
  Begin
     GrdTelContato.Visible := False;
     GrdContatoTel.Visible := False;

     dblcContato.Visible := False;
     dblcTelefone.Visible := False;
  End;
end;

procedure TFrmPessoaMT.TbtnExcluiTCClick(Sender: TObject);
begin
  inherited;
  If Not CdsTelContato.IsEmpty Then CdsTelContato.Delete;
end;

procedure TFrmPessoaMT.TbtnSairTCClick(Sender: TObject);
begin
  inherited;
  ToolTelContato.Hide;
end;

procedure TFrmPessoaMT.SelSubTipo(rIdPessoa: Double);
begin

end;

procedure TFrmPessoaMT.MessagePessoa(sMensagem: String);
begin
   MsgDlg(sMensagem,'Atenção',MtInformation,[mbOk],0);
end;

procedure TFrmPessoaMT.CmpCidadesValidaDados(Sender: TObject);
begin
  inherited;
  CdsCidade.Data := Pessoa.SelCidade(CdsEndereco.FieldByName('IDCIDADES').AsFloat);

  If CdsCidade.IsEmpty Then
  Begin
    CdsEndereco.FieldByName('NOMECIDADE').Clear;
    CdsEndereco.FieldByName('NOMEESTADO').Clear;
    CdsEndereco.FieldByName('NOMEPAIS').Clear;
    CdsEndereco.FieldByName('CEP').EditMask := '';
  End
  Else
  Begin
    CdsEndereco.FieldByName('NOMECIDADE').AsString := CdsCidade.FieldByName('NOME').AsString;
    CdsEndereco.FieldByName('NOMEESTADO').AsString := CdsCidade.FieldByName('NOMEESTADO').AsString;
    CdsEndereco.FieldByName('CODESTADO').AsString := CdsCidade.FieldByName('CODESTADO').AsString; // SOL 215475 KTN 2044512
    CdsEndereco.FieldByName('CIDADE').AsString := CdsCidade.FieldByName('NOME').AsString;  // SOL 215475 KTN 2044512
    CdsEndereco.FieldByName('IDCIDADES').AsFloat   := CdsEndereco.FieldByName('IDCIDADES').AsFloat;
    CdsEndereco.FieldByName('NOMEPAIS').AsString   := CdsCidade.FieldByName('NOMEPAIS').AsString;
    CdsEndereco.FieldByName('CODMUNICIPIO').AsString := CdsCidade.FieldByName('CODMUNICIPIO').AsString; // Felipe A. Santos SOL 229871.16137 PPM 407073

    if CdsCidade.FieldByName('MASCARACPOSTAL').AsString = '' then
       CdsEndereco.FieldByName('CEP').EditMask := ''
    else
       CdsEndereco.FieldByName('CEP').EditMask := CdsCidade.FieldByName('MASCARACPOSTAL').AsString+';0; ';

  End;

  CdsCidade.Close;
end;

procedure TFrmPessoaMT.HabilitaBtnRamal(bHabilita: Boolean);
begin
   If bExibeContato Then
      GrdTelContato.Visible := bHabilita
   Else
      GrdContatoTel.Visible := bHabilita;

   TbtnInsereTC.Enabled := bHabilita;
   TbtnAlteraTC.Enabled := bHabilita;
   TbtnExcluiTC.Enabled := bHabilita;
   TbtnSairTC.Enabled := bHabilita;
   TbtnConfirmaTC.Enabled := Not bHabilita;
   TbtnCancelaTC.Enabled := Not bHabilita;

   If bHabilita Then
   Begin
     TbtnInsereTC.Down := False;
     TbtnAlteraTC.Down := False;
     TbtnExcluiTC.Down := False;
   End;
end;

procedure TFrmPessoaMT.TbtnConfirmaTCClick(Sender: TObject);
begin
  inherited;
  CdsTelContato.Post;
  HabilitaBtnRamal(True);
end;

procedure TFrmPessoaMT.TbtnCancelaTCClick(Sender: TObject);
begin
  inherited;
  CdsTelContato.Cancel;
  HabilitaBtnRamal(True);
end;

procedure TFrmPessoaMT.CdsTelContatoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if pgCtrlDetalhe.ActivePage=tbsContato then
     CdsTelContato.FieldByName('IDCONTATO').AsFloat := CdsContato.FieldByName('IDCONTATO').AsFloat
  else
     CdsTelContato.FieldByName('IDTELEFONE').AsFloat := CdsTelefone.FieldByName('IDTELEFONE').AsFloat;

  CdsTelContato.FieldByName('IDTELCONTATO').AsFloat := Pessoa.GetNextID;
end;

procedure TFrmPessoaMT.TbtnInsereTCClick(Sender: TObject);
begin
  inherited;
  CdsTelContato.Append;
  HabilitaBtnRamal(False);

   If bExibeContato Then
   Begin
      CdsTelContato.FieldByName('IDTELEFONE').AsFloat := CdsTelefone.FieldByName('IDTELEFONE').AsFloat;
      CdsTelContato.FieldByName('NUMERO').AsString := CdsTelefone.FieldByName('NUMERO').AsString;
   End
   Else
   Begin
      CdsTelContato.FieldByName('IDCONTATO').AsFloat := CdsContato.FieldByName('IDCONTATO').AsFloat;
      CdsTelContato.FieldByName('NOME').AsString := CdsContato.FieldByName('NOME').AsString;
   End;
end;

procedure TFrmPessoaMT.TbtnAlteraTCClick(Sender: TObject);
begin
  inherited;
  If Not CdsTelContato.IsEmpty Then                                  
  Begin
     CdsTelContato.Edit;
     HabilitaBtnRamal(False);
  End;
end;

procedure TFrmPessoaMT.CdsEnderecoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  If (Cds.State In [DsEdit, DsInsert]) then
  Begin
     if (Cds.FieldByName('IdEndComercial').AsFloat = CdsEndereco.FieldByName('IdEndereco').AsFloat) then
         Cds.FieldByName('IdEndComercial').clear;

     if (Cds.FieldByName('IdEndResidencial').AsFloat = CdsEndereco.FieldByName('IdEndereco').AsFloat) then
         Cds.FieldByName('IdEndResidencial').clear;

     if (Cds.FieldByName('IdEndEntrega').AsFloat = CdsEndereco.FieldByName('IdEndereco').AsFloat) then
         Cds.FieldByName('IdEndEntrega').clear;

     if (Cds.FieldByName('IdEndCobranca').AsFloat = CdsEndereco.FieldByName('IdEndereco').AsFloat) then
         Cds.FieldByName('IdEndCobranca').clear;

     if (Cds.FieldByName('IdEndCorresp').AsFloat = CdsEndereco.FieldByName('IdEndereco').AsFloat) then
         Cds.FieldByName('IdEndCorresp').clear;
  End;
end;

procedure TFrmPessoaMT.dblcTelefoneCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     with FillTable do
     begin
        FieldByName('IDTELEFONE').AsFloat := LookUpTable.FieldByName('IDTELEFONE').AsFloat;
        FieldByName('NUMERO').AsString := LookUpTable.FieldByName('NUMERO').AsString;
     end;
end;

procedure TFrmPessoaMT.dblcContatoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     with FillTable do
     begin
       FillTable.FieldByName('IDCONTATO').AsFloat := LookUpTable.FieldByName('IDCONTATO').AsFloat;
       FillTable.FieldByName('NOME').AsString := LookUpTable.FieldByName('NOME').AsString;
     end;
end;

procedure TFrmPessoaMT.dblkBancoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  If (ParamIntegra.MascaraAgencia = '') Then
  Begin
     If (Not CdsBanco.FieldByName('MASCARAAGENCIA').IsNull) Then
        CdsContaBancaria.FieldByName('NUMAGENCIA').EditMask := CdsBanco.FieldByName('MASCARAAGENCIA').AsString + ';' + MaskNoSave + '; '
     Else
        CdsContaBancaria.FieldByName('NUMAGENCIA').EditMask := '';
  End
  Else
     CdsContaBancaria.FieldByName('NUMAGENCIA').EditMask := ParamIntegra.MascaraAgencia;

  If (Not CdsBanco.FieldByName('MASCARACC').IsNull) Then
     CdsContaBancaria.FieldByName('CONTACORRENTE').EditMask := CdsBanco.FieldByName('MASCARACC').AsString + ';' + MaskNoSave + '; '
  Else
     CdsContaBancaria.FieldByName('CONTACORRENTE').EditMask := '';

  CdsContaBancaria.FieldByName('NOMEBANCO').AsString := CdsBanco.FieldByName('RAZAOSOCIAL').AsString;
  CdsContaBancaria.FieldByName('NUMBANCO').AsString := CdsBanco.FieldByName('NUMBANCO').AsString;
end;

procedure TFrmPessoaMT.RgTipoContaClick(Sender: TObject);
begin
  inherited;
  If (CdsBanco.FieldByName('NUMBANCO').AsString = '104') And
     (CdsContaBancaria.State In [DsEdit, DsInsert]) Then
  Begin
     CdsContaBancaria.FieldByName('CONTACORRENTE').Clear;
     dbedContaEnter(Self);
  End;
end;

procedure TFrmPessoaMT.BtnBuscaAgenciaClick(Sender: TObject);
begin
  inherited;
  If (Trim(dblkBanco.Text) <> '') Then
  Begin
    MsBanco.Filtro.Clear;
    MsBanco.Filtro.Add('AGENCIABANCARIA.IDPESSOA = PESSOA.IDPESSOA');
    MsBanco.Filtro.Add('AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA');
    MsBanco.Filtro.Add('BANCO.IDPESSOA = ' + dblkBanco.LookupValue);

    MsBanco.Executar;
    If MsBanco.RetornouValor Then
    {Início - Michelle Mota - SIG27550}
      begin
        CdsContaBancaria.FieldByName('NUMAGENCIA').AsString := MsBanco.ValoresChave[0];
        CdsContaBancaria.FieldByName('NOMEAGENCIA').AsString := MsBanco.ValoresChave[1];
      end;
    {Término - Michelle Mota - SIG27550}
  End;
end;

procedure TFrmPessoaMT.dbedContaEnter(Sender: TObject);
begin
  inherited;
  If (CdsBanco.FieldByName('NUMBANCO').AsString = '104') Then
     dbedConta.PopupMenu :=  ppmCaixa
  Else
     dbedConta.PopupMenu :=  nil;
end;

procedure TFrmPessoaMT.N001ContaCorrente1Click(Sender: TObject);
Var
  sTipoConta: String;
begin
  inherited;
  sTipoConta := Copy(IntToStr(TMenuItem(Sender).Tag),2,3);

  CdsContaBancaria.FieldByName('CONTACORRENTE').AsString := sTipoConta;
  dbedConta.SelStart := 3;
  dbedConta.SelLength := 1;

  Case StrToIntDef(sTipoConta,0) of
    1, 3, 4, 635: CdsContaBancaria.FieldByName('TIPOCONTA').AsInteger := 1;
    2, 13, 22: CdsContaBancaria.FieldByName('TIPOCONTA').AsInteger := 3;
  End;
end;

procedure TFrmPessoaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  EnableControls(False);
  Accept := Pessoa.ProcessaPessoa(OpInserir);
  EnableControls(True);
end;

procedure TFrmPessoaMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  EnableControls(False);
  Accept := Pessoa.ProcessaPessoa(OpAlterar);
  EnableControls(True);  
end;

procedure TFrmPessoaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Pessoa.ProcessaPessoa(OpApagar);
  HabilitarCampos;
end;

procedure TFrmPessoaMT.EnableControls(bEnable: Boolean);
begin
  CdsTelefone.Filtered := bEnable;
  CdsTelContato.Filtered := bEnable;
  CdsContato.Filtered := bEnable;

  If bEnable Then
  Begin
    CdsContato.EnableControls;
    CdsDocumento.EnableControls;
    CdsEndereco.EnableControls;
    CdsImagem.EnableControls;
    CdsImagensDoc.EnableControls;
    Cds.EnableControls;
    CdsPessoaFisica.EnableControls;
    CdsTelContato.EnableControls;
    CdsTelefone.EnableControls;
    CdsContaBancaria.EnableControls;
  End
  Else
  Begin
    CdsContato.DisableControls;
    CdsDocumento.DisableControls;
    CdsEndereco.DisableControls;
    CdsImagem.DisableControls;
    CdsImagensDoc.DisableControls;
    Cds.DisableControls;
    CdsPessoaFisica.DisableControls;
    CdsTelContato.DisableControls;
    CdsTelefone.DisableControls;
    CdsContaBancaria.DisableControls;
  End;
end;

procedure TFrmPessoaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao = OpAlterar Then
     SelPessoa(Cds.FieldByName('IDPESSOA').AsFloat);

  HabilitarCampos;   
end;

procedure TFrmPessoaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  inherited;
  Pessoa.Free;
end;

procedure TFrmPessoaMT.CdsEnderecoCalcFields(DataSet: TDataSet);
Var
  sTipoEndereco: String;
begin
  inherited;
  sTipoEndereco := '';

  CdsEndereco.FieldByName('TIPOEND_PADRAO').Clear;

  If (Cds.FieldByName('IDENDCOMERCIAL').AsFloat = CdsEndereco.FieldByName('IDENDERECO').AsFloat) Then
      sTipoEndereco := sTipoEndereco + ', Comercial';

  If (Cds.FieldByName('IDENDRESIDENCIAL').AsFloat = CdsEndereco.FieldByName('IDENDERECO').AsFloat) Then
      sTipoEndereco := sTipoEndereco + ', Residencial';

  If (Cds.FieldByName('IDENDENTREGA').AsFloat = CdsEndereco.FieldByName('IDENDERECO').AsFloat) Then
      sTipoEndereco := sTipoEndereco + ', Entrega';

  If (Cds.FieldByName('IDENDCOBRANCA').AsFloat = CdsEndereco.FieldByName('IDENDERECO').AsFloat) Then
      sTipoEndereco := sTipoEndereco + ', Cobrança';

  If (Cds.FieldByName('IDENDCORRESP').AsFloat = CdsEndereco.FieldByName('IDENDERECO').AsFloat) Then
      sTipoEndereco := sTipoEndereco + ', Correspondência';

  If sTipoEndereco <> '' Then
  Begin
    Delete(sTipoEndereco,1,1);
    CdsEndereco.FieldByName('TIPOEND_PADRAO').AsString := sTipoEndereco
  End;
end;

procedure TFrmPessoaMT.CdsContatoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If (CdsContato.State = dsBrowse) And
     (CdsTelefone.State = dsBrowse) Then
     CdsTelContato.Filter := 'IDCONTATO = ' + QuotedStr(FloatToStr(CdsContato.FieldByName('IDCONTATO').AsFloat));
end;

procedure TFrmPessoaMT.CdsTelefoneAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If (CdsContato.State = dsBrowse) And
     (CdsTelefone.State = dsBrowse) Then
     CdsTelContato.Filter := 'IDTELEFONE = ' + QuotedStr(FloatToStr(CdsTelefone.FieldByName('IDTELEFONE').AsFloat));
end;

procedure TFrmPessoaMT.CdsContaBancariaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsContaBancaria.FieldByName('TIPOCONTA').AsInteger := 1;
end;

procedure TFrmPessoaMT.CdsTelefoneCalcFields(DataSet: TDataSet);
Var
  sTipoTel: String;
begin
  inherited;
  sTipoTel := '';

  if pos('C',CdsTelefoneTIPO_Padrao.AsString) > 0 then
     sTipoTel := sTipoTel + 'Comercial, ';

  if pos('P',CdsTelefoneTIPO_Padrao.AsString) > 0 then
     sTipoTel := sTipoTel + 'Particular, ';

  if pos('F',CdsTelefoneTIPO_Padrao.AsString) > 0 then
     sTipoTel := sTipoTel + 'Fax, ';

  if pos('L',CdsTelefoneTIPO_Padrao.AsString) > 0 then
     sTipoTel := sTipoTel + 'Celular, ';

  if pos('R',CdsTelefoneTIPO_Padrao.AsString) > 0 then
     sTipoTel := sTipoTel + 'Recado, ';

  CdsTelefoneTIPOTEL_Padrao.AsString := Copy(Trim(sTipoTel),1,Length(Trim(sTipoTel)) - 1);
end;

procedure TFrmPessoaMT.sbtnProcurarClick(Sender: TObject);
begin
   inherited;

   // André Pontes - pendência 15647 - 12/05/2004
   if not(cds.IsEmpty) then sbtnFisJur.Enabled := False;
   // NOT André Pontes - pendência 15647 - 12/05/2004
end;



procedure TFrmPessoaMT.sbtnAltDetClick(Sender: TObject);
begin
  //Thaise - Caso não possa fazer alterações nos campos, verifico na lista de Telefone, Endereço, Contato e Banco
  //se o ID referente na query existe na lista salva. Se existir, não permito alterações.
  if bTtravarCadastro then
  begin
    if pos(CdsTelefone.FieldByName('IDTELEFONE').Asstring, lTelefone) > 0 then
    begin
      DBEDDDI.Enabled:= False;
      DBEDDDD.Enabled:= False;
      DBEDNUMERO.Enabled:= False;
      GroupBox4.Enabled:= False;
      GrdExibeContatos_Padrao.Enabled:= False;
      BtnContatoTel.Enabled:= False;
      PintarCampos([DBEDDDI, DBEDDDD, DBEDNUMERO, GroupBox4,
                    GrdExibeContatos_Padrao, BtnContatoTel, GrdExibeContatos_Padrao,
                    chkTipoTelefone, GrdTelefones_Padrao], clGray);
    end
    else
    begin
      DBEDDDI.Enabled:= True;
      DBEDDDD.Enabled:= True;
      DBEDNUMERO.Enabled:= True;
      GroupBox4.Enabled:= True;
      GrdExibeContatos_Padrao.Enabled:= True;
      BtnContatoTel.Enabled:= True;
      PintarCampos([DBEDDDI, DBEDDDD, DBEDNUMERO, GroupBox4,
                    GrdExibeContatos_Padrao, BtnContatoTel, GrdExibeContatos_Padrao,
                    chkTipoTelefone, GrdTelefones_Padrao], clWindow);

    end;

    if pos(CdsEndereco.FieldByName('IDENDERECO').AsString, lEndereco) > 0 then
    begin
      dbedNomeEndereco.Enabled:= False;
      dbedLogradouro.Enabled:= False;
      DBNUMERO.Enabled:= False;
      DBEDCOMPLEMENTO.Enabled:= False;
      dbedBairro.Enabled:= False;
      dbedCEP.Enabled:= False;
      CmpCidades.Enabled:= False;
      dbedEstado.Enabled:= False;
      dbedPais.Enabled:= False;
      grpTipoEnd.Enabled:= False;
      PintarCampos([dbedNomeEndereco, dbedLogradouro, DBNUMERO,
                    DBEDCOMPLEMENTO,dbedBairro,dbedCEP, CmpCidades,
                    dbedEstado, dbedPais, grpTipoEnd, chkTipoEndereco], clGray);
    end
    else
    begin
      dbedNomeEndereco.Enabled:= True;
      dbedLogradouro.Enabled:= True;
      DBNUMERO.Enabled:= True;
      DBEDCOMPLEMENTO.Enabled:= True;
      dbedBairro.Enabled:= True;
      dbedCEP.Enabled:= True;
      CmpCidades.Enabled:= True;
      dbedEstado.Enabled:= True;
      dbedPais.Enabled:= True;
      grpTipoEnd.Enabled:= True;
      PintarCampos([dbedNomeEndereco, dbedLogradouro, DBNUMERO,
                    DBEDCOMPLEMENTO,dbedBairro,dbedCEP,
                    dbedEstado, dbedPais, grpTipoEnd, chkTipoEndereco], clWindow);
      PintarCampos([CmpCidades], clBlack);              

    end;


    if pos(CdsContato.FieldByName('IDCONTATO').AsString, lContato) > 0 then
    begin
      dbedContatoNome.Enabled:= False;
      BtnTelefones.Enabled:= False;
      dbedcontatoemail.Enabled:= False;
      EdtDataNascimento_Padrao.Enabled:= False;
      EdtCargo_Padrao.Enabled:= False;
      EdtSetor_Padrao.Enabled:= False;
      DbmObs_Padrao.Enabled:= False;
      GrdTelefones_Padrao.Enabled:= False;
      PintarCampos([dbedContatoNome, BtnTelefones, dbedcontatoemail,
                    EdtDataNascimento_Padrao, EdtCargo_Padrao, EdtSetor_Padrao,
                    DbmObs_Padrao, GrdTelefones_Padrao], clGray);
    end
    else
    begin
      dbedContatoNome.Enabled:= True;
      BtnTelefones.Enabled:= True;
      dbedcontatoemail.Enabled:= True;
      EdtDataNascimento_Padrao.Enabled:= True;
      EdtCargo_Padrao.Enabled:= True;
      EdtSetor_Padrao.Enabled:= True;
      DbmObs_Padrao.Enabled:= True;
      GrdTelefones_Padrao.Enabled:= True;
      PintarCampos([dbedContatoNome, BtnTelefones, dbedcontatoemail,
                    EdtDataNascimento_Padrao, EdtCargo_Padrao, EdtSetor_Padrao,
                    DbmObs_Padrao, GrdTelefones_Padrao], clWindow);

    end;
  end;

  if pos(CdsContaBancaria.FieldByName('IDCBANCARIA').AsString, lBanco) > 0 then
  begin
    dblkBanco.Enabled:= False;
    RgTipoConta.Enabled:= False;
    DbeAgencia.Enabled:= False;
    dbedConta.Enabled:= False;
    ChbContaPref_Padrao.Enabled:= False;
    BtnBuscaAgencia.Enabled:= False;
    PintarCampos([dblkBanco, RgTipoConta, DbeAgencia, dbedConta, ChbContaPref_Padrao], clGray);
  end
  else
  begin
    dblkBanco.Enabled:= True;
    RgTipoConta.Enabled:= True;
    DbeAgencia.Enabled:= True;
    dbedConta.Enabled:= True;
    ChbContaPref_Padrao.Enabled:= True;
    BtnBuscaAgencia.Enabled:= True;
    PintarCampos([dblkBanco, RgTipoConta, DbeAgencia, dbedConta, ChbContaPref_Padrao], clWindow);
  end;

  inherited;

end;

procedure TFrmPessoaMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  //Thaise - Ao adicionar um registro novo, não devemos bloquear nenhum campo.
  //Ele poderá ser inserido, excluido e alterado antes da operação ser comitada DEFINITIVAMENTE.
  //Por isso, se o cadastro for inserido, os campos serão destravados e pindados na cor original.
  if bTtravarCadastro then
  begin
    DBEDDDI.Enabled:= True;
    DBEDDDD.Enabled:= True;
    DBEDNUMERO.Enabled:= True;
    GroupBox4.Enabled:= True;
    GrdExibeContatos_Padrao.Enabled:= True;
    BtnContatoTel.Enabled:= True;
    dbedNomeEndereco.Enabled:= True;
    dbedLogradouro.Enabled:= True;
    DBNUMERO.Enabled:= True;
    DBEDCOMPLEMENTO.Enabled:= True;
    dbedBairro.Enabled:= True;
    dbedCEP.Enabled:= True;
    CmpCidades.Enabled:= True;
    dbedEstado.Enabled:= True;
    dbedPais.Enabled:= True;
    grpTipoEnd.Enabled:= True;
    dblkBanco.Enabled:= True;
    RgTipoConta.Enabled:= True;
    DbeAgencia.Enabled:= True;
    dbedConta.Enabled:= True;
    ChbContaPref_Padrao.Enabled:= True;
    dbedContatoNome.Enabled:= True;
    BtnTelefones.Enabled:= True;
    dbedcontatoemail.Enabled:= True;
    EdtDataNascimento_Padrao.Enabled:= True;
    EdtCargo_Padrao.Enabled:= True;
    EdtSetor_Padrao.Enabled:= True;
    DbmObs_Padrao.Enabled:= True;
    GrdTelefones_Padrao.Enabled:= True;
    BtnBuscaAgencia.Enabled:= True;
    dblkBanco.Enabled:= True;
    RgTipoConta.Enabled:= True;
    DbeAgencia.Enabled:= True;
    dbedConta.Enabled:= True;
    ChbContaPref_Padrao.Enabled:= True;
    BtnBuscaAgencia.Enabled:= True;
    PintarCampos([DBEDDDI, DBEDDDD, DBEDNUMERO, GroupBox4,
                  GrdExibeContatos_Padrao, BtnContatoTel, dbedNomeEndereco,
                  dbedLogradouro, DBNUMERO, DBEDCOMPLEMENTO, dbedBairro,
                  dbedCEP, dbedEstado, dbedPais, grpTipoEnd,
                  dblkBanco, RgTipoConta, DbeAgencia, dbedConta,
                  ChbContaPref_Padrao, dbedContatoNome, BtnTelefones,
                  dbedcontatoemail, EdtDataNascimento_Padrao, EdtCargo_Padrao,
                  EdtSetor_Padrao, DbmObs_Padrao, GrdTelefones_Padrao, BtnBuscaAgencia,
                  dblkBanco, RgTipoConta, DbeAgencia, dbedConta, ChbContaPref_Padrao,
                  chkTipoEndereco, DbeAgencia, chkTipoTelefone], clWindow);
    PintarCampos([CmpCidades], clBlack);
  end;

end;

procedure TFrmPessoaMT.sbtnExcluiDetClick(Sender: TObject);
begin
  //Thaise - Ao adicionar um registro novo, não devemos bloquear nenhum campo.
  //Ele poderá ser inserido, excluido e alterado antes da operação ser comitada DEFINITIVAMENTE.
  //Por isso, se o cadastro for inserido, os campos serão destravados e pinTados na cor original.
  if pgctrlDetalhe.ActivePage = tbsTelefone then
  begin
    if pos(CdsTelefone.FieldByName('IDTELEFONE').Asstring, lTelefone) > 0 then
    begin
      MessageDlg('A operação só pode ser feita no módulo Folha de Pagamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    if pos(CdsEndereco.FieldByName('IDENDERECO').AsString, lEndereco) > 0  then
    begin
      MessageDlg('A operação só pode ser feita no módulo Folha de Pagamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;

  if pgctrlDetalhe.ActivePage = tbsContato then
  begin
    if pos(CdsContato.FieldByName('IDCONTATO').AsString, lContato) > 0 then
    begin
      MessageDlg('A operação só pode ser feita no módulo Folha de Pagamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;

  if pgctrlDetalhe.ActivePage = tbsDadosBancarios then
  begin
    if pos(CdsContaBancaria.FieldByName('IDCBANCARIA').AsString, lBanco) > 0 then
    begin
      MessageDlg('A operação só pode ser feita no módulo Folha de Pagamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;

  inherited;

end;

procedure TFrmPessoaMT.HabilitarCampos;
begin
    BtnBuscaAgencia.Enabled:= True;
    DBEDDDI.Enabled:= True;
    DBEDDDD.Enabled:= True;
    DBEDNUMERO.Enabled:= True;
    GroupBox4.Enabled:= True;
    GrdExibeContatos_Padrao.Enabled:= True;
    BtnContatoTel.Enabled:= True;
    dbedNomeEndereco.Enabled:= True;
    dbedLogradouro.Enabled:= True;
    DBNUMERO.Enabled:= True;
    DBEDCOMPLEMENTO.Enabled:= True;
    dbedBairro.Enabled:= True;
    dbedCEP.Enabled:= True;
    CmpCidades.Enabled:= True;
    dbedEstado.Enabled:= True;
    dbedPais.Enabled:= True;
    grpTipoEnd.Enabled:= True;
    dblkBanco.Enabled:= True;
    BtnTelefones.Enabled:= True;
    dbedcontatoemail.Enabled:= True;
    EdtDataNascimento_Padrao.Enabled:= True;
    EdtCargo_Padrao.Enabled:= True;
    EdtSetor_Padrao.Enabled:= True;
    DbmObs_Padrao.Enabled:= True;
    GrdTelefones_Padrao.Enabled:= True;
    BtnBuscaAgencia.Enabled:= True;
    dbedDocumento.Enabled:= True;
    dbedNomeFantasia.Enabled:= True;
    dbedemail.Enabled:= True;
    DbeHomePage_Padrao.Enabled:= True;
    edDocNumDocumento.Enabled:= True;
    EdtOrgaoEmissor.Enabled:= True;
    dbcmbEstadoDoc.Enabled:= True;
    EdtDataEmissao_Padao.Enabled:= True;

    if bTtravarCadastro then
    begin
       PintarCampos([DBEDDDI, DBEDDDD, DBEDNUMERO, GroupBox4, GrdExibeContatos_Padrao,
                     BtnContatoTel, dbedNomeEndereco, dbedLogradouro, DBNUMERO, DBEDCOMPLEMENTO,
                     dbedBairro, dbedCEP, dbedEstado, dbedPais, grpTipoEnd,
                     dblkBanco, BtnTelefones, dbedcontatoemail, EdtDataNascimento_Padrao,
                     EdtCargo_Padrao, EdtSetor_Padrao, DbmObs_Padrao, GrdTelefones_Padrao,
                     BtnBuscaAgencia, dbedDocumento, dbedNomeFantasia, dbedemail,
                     DbeHomePage_Padrao, edDocNumDocumento, chkTipoEndereco, DbeAgencia, dbedConta,
                     ChbContaPref_Padrao, EdtOrgaoEmissor, dbcmbEstadoDoc, EdtDataEmissao_Padao], clWindow);
       PintarCampos([CmpCidades], clBlack);
    end;
   lblMsg.Visible:= False;
   bTtravarCadastro:= False;
end;

procedure TFrmPessoaMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  HabilitarCampos;
end;

procedure TFrmPessoaMT.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  HabilitarCampos;
end;


procedure TFrmPessoaMT.PintarCampos(lEdit: array of TComponent; Color: TColor);
var x: integer;
begin
  //Thaise - Função criada para pintar os campos de maneira dinâmica.

  //1) Declaro lEdit como uma lista de Componentes - pode ser qualquer componente de TObject;
  //2) Coloco a cor desejada para a variável Color, do tipo TColor;
  //3) Faço um laço 'For' para a minha lista inteira de componentes e verifico o tipo de classe que ele pertence, para então pintar.
  for x:= 0 to High(lEdit) do
  begin
    if TObject(lEdit[x]).ClassType = TwwDBEdit then
      TwwDBEdit(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBEdit then
      TDBEdit(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TGroupBox then
      TGroupBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TCheckListBox then
      TCheckListBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TCMProcura then
      TCMProcura(lEdit[x]).Font.Color:= Color;

    if TObject(lEdit[x]).ClassType = TwwDBGrid then
      TwwDBGrid(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBMemo then
      TDBMemo(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TwwDBLookupCombo then
      TwwDBLookupCombo(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TRadioGroup then
      TRadioGroup(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBCheckBox then
      TDBCheckBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TCMDateTimePicker then
      TCMDateTimePicker(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBRealEdit then
      TDBRealEdit(lEdit[x]).Color:= Color;
  end;
end;





procedure TFrmPessoaMT.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  PintarCampos([GrdExibeContatos_Padrao, GrdTelefones_Padrao], clWindow);
end;

procedure TFrmPessoaMT.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  PintarCampos([GrdExibeContatos_Padrao, GrdTelefones_Padrao], clWindow);
end;     

//Início - William Santana - SOL 211502.16259 PPM - 442499
procedure TFrmPessoaMT.AssociaOutraImagem(dsImg: TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
begin
  AssociaImagem(dsImg, pImagem, Campo , Descricao );
end;
//Término - William Santana - SOL 211502.16259 PPM - 442499

procedure TFrmPessoaMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
end;

//Darivaldo Alencar SIG 22093 -inicio
function TFrmPessoaMT.ValidaEntrada: boolean;
var
  iIdDocumento: Integer;
begin
   result:= true;
   pnlItemsDoc.visible:= false;
   iIdDocumento:= CdsDocumento.fieldbyname('IDDOCUMENTO').asInteger;
   CdsDocumento.first;

   while not(CdsDocumento.eof) do
   begin
    if (CdsDocumento.fieldByname('NUMDOCUMENTO').asString = EmptyStr) then
     begin
        CdsDocumento.next;
        continue;
     end;

   if (CdsDocumento.FieldByName('OBRIGAEMISSAO').AsString = 'S') and (EdtDataEmissao_Padao.Text = EmptyStr) and (EdtDataEmissao_Padao.visible) then
     begin
       MsgDlg('Obrigatório preencher a Data da Emissão do documento: ' + CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
       result:= false;
       break;
     end;
  if (CdsDocumento.FieldByName('OBRIGAUF').AsString = 'S') and (dbcmbEstadoDoc.Text = EmptyStr) and (dbcmbEstadoDoc.visible )then
    begin
      MsgDlg('Obrigatório preencher a Unidade de Federação do documento: ' + CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (CdsDocumento.FieldByName('OBRIGAORGAO').AsString = 'S') and (EdtOrgaoEmissor.Text = EmptyStr)and (EdtOrgaoEmissor.visible) then
    begin
      MsgDlg('Obrigatório preencher o Órgão Emissor do documento: ' + CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (CdsDocumento.FieldByName('FLGOBRIGAVALIDADE').AsString = 'S') and (EdtDataValidade_Padrao.Text = EmptyStr) and (EdtDataValidade_Padrao.visible)then
    begin
      MsgDlg('Obrigatório preencher a Data de Validade do documento ' + CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (CdsDocumento.FieldByName('OBRIGACATG').AsString = 'S') and (edtCategoria.Text = EmptyStr) and (edtCategoria.visible)then
    begin
      MsgDlg('Obrigatório preencher a Categoria do documento: ' + CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (CdsDocumento.FieldByName('OBRIGAPRMHAB').AsString = 'S') and (cbxDataHabilitacao.Text = EmptyStr) and (cbxDataHabilitacao.visible)then
    begin
      MsgDlg('Obrigatório preencher a Data da primeira habilitação do documento: ' + CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (CdsDocumento.FieldByName('OBRIGAPAIS').AsString = 'S') and (dbcmdPais.Text = EmptyStr) and (dbcmdPais.visible) then
    begin
      MsgDlg('Obrigatório preencher o País do documento: ' + CdsDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
    CdsDocumento.Next;
  end;
  CdsDocumento.locate('IDDOCUMENTO',iIdDocumento,[]);
  pnlItemsDoc.visible:= true;
end;
//Darivaldo Alencar SIG 22093 -fim



end.
