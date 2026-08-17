{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina             : bbtnConfirmarClick
//N. Atender......   : WO24274
//Data da Alteração: : 13/08/2025
//Responsável:       : Paulo Nobre
//Descrição.......   : Só validar o email em módulos <> do "MODFOL".
//***************************************************************************************
//Rotina             : dbedDocumentoExit
//N. Atender......   : WO9227
//Data da Alteração: : 19/03/2024
//Responsável:       : Helen V Bianchi
//Descrição.......   : Funcao para Verificar se o CNPJ ja existe
//***************************************************************************************       
//Rotina             : bbtnConfirmarClick
//N. Atender......   : WO8148
//Data da Alteração: : 23/02/2024
//Responsável:       : Helen V Bianchi
//Descrição.......   : Adicionar a Funcao para Obrigatoriedade para o campo Email
//***************************************************************************************
//Rotina             : FormCreate
//N. SIG..........   : 121028
//Data da Alteração: : 01/12/2021
//Responsável:       : Andre Imakawa
//Descrição.......   : Exibir nome Pai e Mãe. Ajuste tbm efetuado no DFM.
//***************************************************************************************
//Rotina             : VerificaContaDuplicada
//N. SIG..........   : 115280
//Data da Alteração: : 21/04/2021
//Responsável:       : edilaine
//Descrição.......   : criticar a duplicação no cadastro de conta bancaria mas permitir
//***************************************************************************************
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
//Rotina             : VerificaContaDuplicada
//N. SIG..........   : 102199
//Data da Alteração: : 28/09/2020
//Responsável:       : André Imakawa
//Descrição.......   : Ao validar a conta no cds clone, se for uma alteração verificar se o
//                     IDcontabancaria é diferente.
//***************************************************************************************
//Rotina             : (dfm cdsclone, dsclone) VerificaContaDuplicada, tbcDetalheChange
//N. SIG..........   : 100444
//Data da Alteração: : 26/06/2020
//Responsável:       : edilaine
//Descrição.......   : validação de duplicação no cadastro de conta bancaria
//***************************************************************************************
//Rotina             :
//N. SIG..........   : 38475/84797
//Data da Alteração: : 12/04/2018
//Alteração Form:    : frmCadForne
//Responsável:       : Everson Cunha
//Descrição.......   : Melhorias no cadastro de Favorecidos, para adequação
//                     ao leiaute s-2300 do eSocial. (versão hoje: 2.5.01)
//***************************************************************************************
//Rotina             : FormCreate, CmeCadastroEdit, SelSubTipo, CdsEmpresaForneBeforePost,
//										           CmeCadastroConfirma, CmeCadastroFind, bbtnOkDetClick, bbtnCancelarDetClick,
//										           toolbtnInserirIndSuspClick,toolbtnAlterarIndSuspClick,
//										           toolbtnExcluirIndSuspClick, btnDockIndSuspOKClick,
//										           btnDockIndSuspVoltarClick, pgcProcessosChange, btnDockIndSuspCancClick,
//										           dbLkpCbxIndSuspChange, CmeDetalheInsert, LimpaCamposProcesso, AtualizaProcessos,
//                     dblkpcbbIDCIDADESExit     
//N. SIG..........   : 23656.57136
//Data da Alteração: : 27/10/2017
//Alteração Form:    : frmCadForne
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão do campo "Contribuinte da Contribuição Previdenciário sobre
//										           a Renda Bruta (CPRB)" e da aba "Processos" para o cumprimento da
//										           Instrução Normativa IN 1701.
//***************************************************************************************
//Nº SIG............: 21988
//Data da Alteração.: 02/06/2015
//Alteração Form....: Validações dos campos de conta bancaria
//Responsável.......: André Imakawa
//Descrição.........: Favor verificar a tela de cadastro de favorecidos, pois quando do
//                    cadastramento de uma conta bancaria, mais precisamente no momento de
//                    clicar ok na tela, a conta bancaria está sendo duplicada,
//                    ficando assim lixo na base e impactando na geração da previa da folha.
//***************************************************************************************
//Nº SOL............: 260446
//Nº PPM............: 1035009
//Data da Alteração.: 21/08/2015
//Alteração Form....: adicionei um 'panel' na frente dos campos para ocultá-los,
//                    pois não teve como colocar os campos dentro do panel
//Responsável.......: William Santana
//Descrição.........: correção RN03 da 229878.16779
//***************************************************************************************
//Nº SOL............: 229878.16779
//Nº PPM............: 610132
//Data da Alteração.: 10/07/2015
//Alteração Form....: inclusão de campos
//Responsável.......: William Santana
//Descrição.........: Desenvolvimento do produto referente ao SOL 229878.
//**************************************************************************************
{--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 188854
Nº KINTANA..: 1784331
Data........: -
Responsável.: Higor Nayde
Descrição...: -
 --------------------------------------------------------------------------------------------------
Rotina......: btnTrazFornecClick, FormPaint
Nº SOL......: 188851
Nº KINTANA..: 1784371
Data........: 17/01/2013
Responsável.: Marcio Sanches Spinosa
Descrição...: Criação da constante da folha
{ --------------------------------------------------------------------------------------------------
//Rotina......: -
//SOL..........: 188848
//Kintana......: 1784328
//Data.........: 09/01/2013
//Responsável..: Rodrigo de Brito Figueredo
//Descrição....: Criado filtro no qual somente o usuário que executou a inclusão da avaliação do fornecedor pode modifica-la.
                 *.dfm
//--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 176923
Nº KINTANA..: 1617670
Data........: 18/01/2013
Responsável.: Vander Campos 
Descrição...: Avaliação de fornecedores
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136120
Nº KINTANA..: 812527
Data........: 28/11/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação da nova aba: Avaliação do Fornecedor
--------------------------------------------------------------------------------------------------
Rotina ......: MsAtividadeProjeto
SOL..........: 163982
Kintana......: 1404974
Data.........: 23/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi adicionado um filtro para o componente MsAtividadeProjeto
               retornar apenas as atividades ativas
Alteração DFM: Foi alterado o componente MsAtividadeProjeto.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 24591
Nº KINTANA..: 524457
Data........: 28/10/2010
Responsável.: Thaise Amaral Martins
Descrição...: Desabilitando campos que só podem ser alterados no módulo Folha de Pagamento caso
              o funcionário possua vínculo empregatício com a Funcef.
-----------------------------------------------------------------------------------------------------}


//--------------------------------------------------------------------------------
//Pendência   : SOL 139413 KINTANA 856985
//Responsável : BRUNO AZEVEDO
//Data        : 12/07/2010
//Descrição   : Permitir alterar o FLGCONTAPREF mesmo que a conta tenha documentos.
//--------------------------------------------------------------------------------
// andre tavares - pendência 15383 - 17/09/2004
//Marcus Oliveira P. 24573 26/03/2007 -
//Não permitir vincular impostos do tipo CPMF neste relacionamento. Cadastros \Fornecedores \Dados do Fornecedor
//------------------------------------------------------------------//
// Pendência 17470 - retirada de campo Classificação Fiscal         //
//------------------------------------------------------------------//

unit fCadForne;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, MontaSelect, Db, DBClient, uCMClientDataSet, Provider,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, CMProcura, StdCtrls,
  CheckLst, ComCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  Wwdbspin, ExtCtrls, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, Mask,
  wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn, CMProcuraMask,
  CMProcuraSubTipo, uCmSqlParams, uDatabase, uCtrlAvaliacaoFornec, uCtrlPadroes,
  DBTables, DBCGrids, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCache, ppDB, ppDBPipe, ppStrtch, ppMemo, ppPrnabl, ppCtrls, ppVar, jpeg,
  ToolWin, ppModule, daDataModule, Wwdotdot, Wwdbcomb, // Vander Campos SOL: 176923 KINTANA: 1617670
  uDbProcessosForn, uDbProcessosXIndicativoSuspForn, Wwquery; //Cássio - SIG nº 57136

//Thaise - SOL136120 - Criando constantes para identificar o módulo
const
  Almoxarifado = 1;
  AdminImob    = 2;
  Contratos    = 3;
  CPagar       = 4;
  Folha        = 5; //Marcio Sanches Spinosa SOL 188851 Kintana 1784371
type
  TfrmCadForne = class(TFrmPessoaMT)
    TbsDadosCliente: TTabSheet;
    TbsTipoDesemb: TTabSheet;
    TbsImpAgreg: TTabSheet;
    TbsRamodeFornecedor: TTabSheet;
    TbsGeral: TPageControl;
    TbsDados: TTabSheet;
    TbsContabil: TTabSheet;
    CContabil: TCMProcuraMaskContabil;
    CContabilCredito: TCMProcuraMaskContabil;
    CContabilAdiantamento: TCMProcuraMaskContabil;
    Panel5: TPanel;
    Label23: TLabel;
    Label4: TLabel;
    CmpSubConta: TCMProcura;
    CmpAtivProj: TCMProcura;
    MsClasFisCliFor: TMontaSelect;
    MsSubConta: TMontaSelect;
    MsCentroCusto: TMontaSelect;
    MsAtividadeProjeto: TMontaSelect;
    BtnDelTipoDesemb: TSpeedButton;
    BtnAddTipoDesemb: TSpeedButton;
    PnlTipoDesembCli: TPanel;
    GrdTipoDesembForn: TwwDBGrid;
    PnlTipoDesemb: TPanel;
    GrdTipoDesemb: TwwDBGrid;
    BtnAddImpAgreg: TSpeedButton;
    BtnDelImpAgreg: TSpeedButton;
    PnlImpAgregFor: TPanel;
    PnlImpAgreg: TPanel;
    GrdImpAgregForn: TwwDBGrid;
    CdsTipoDesemb: TCMClientDataSet;
    CdsTipoDesembForn: TCMClientDataSet;
    CdsImAgreg: TCMClientDataSet;
    CdsImAgregForn: TCMClientDataSet;
    DsTipoDesemb: TwwDataSource;
    DsImAgreg: TwwDataSource;
    DsTipoDesembForn: TwwDataSource;
    DsImAgregForn: TwwDataSource;
    CdsRamoForne: TCMClientDataSet;
    DsRamoForne: TwwDataSource;
    CdsRamoXForne: TCMClientDataSet;
    DsRamoXForne: TwwDataSource;
    CdsEmpresaForne: TClientDataSet;
    DsEmpresaForne: TwwDataSource;
    LblNatuRend_Padrao: TLabel;
    Label2: TLabel;
    LblCodCorresp_Padrao: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    wwDBEdit2: TwwDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    CmpNaturezaRendimento: TCMProcura;
    MsNatuRendimento: TMontaSelect;
    spdFornxRamo: TSpeedButton;
    spdRamosForn: TSpeedButton;
    dbRamos: TwwDBGrid;
    dbFornxRamo: TwwDBGrid;
    PnlTitDesembAssoc: TPanel;
    Panel6: TPanel;
    CdsCentCusto: TCMClientDataSet;
    CdsCentCustoCODCENTROCUSTO: TStringField;
    CdsCentCustoNOME: TStringField;
    CdsCentCustoSTATUSGRUPOCDC: TStringField;
    CdsCentCustoCODEXTERNO: TStringField;
    SqlCentCusto: TCMSqlParams;
    CmpCentCusto: TCMProcuraMask;
    TbsAvaliacaoFornec: TTabSheet;
    GrdImpAgreg2: TwwDBGrid;
    cdsAvaliacaoFornec: TCMClientDataSet;
    dsAvaliacaoFornec: TwwDataSource;
    Panel4: TPanel;
    dsNatureza: TDataSource;
    qryNatureaContr: TQuery;
    qryNatureaContrIDNATUREZA: TFloatField;
    qryNatureaContrDESCRICAO: TStringField;
    Panel7: TPanel;
    btnTrazFornec: TButton;
    cdsJustificativas: TCMClientDataSet;
    dsJustificativas: TwwDataSource;
    rptAvaliacao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppAvaliacao: TppDBPipeline;
    QryIprFornec: TQuery;
    QryIprFornecDTAVALIACAO: TDateTimeField;
    QryIprFornecDTEXECUCAO: TDateTimeField;
    QryIprFornecQUALIDADETECNICA: TStringField;
    QryIprFornecDESCRICAOSERVICO: TMemoField;
    QryIprFornecMOTIVOQUALIFICACAO: TMemoField;
    QryIprFornecNATUREZA: TStringField;
    QryIprFornecDESCRJUSTIFICATIVA: TMemoField;
    qryiprfo: TDataSource;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel8: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSystemVariable1: TppSystemVariable;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    QryIprFornecNOME: TStringField;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppImage1: TppImage;
    ppDBMemo3: TppDBMemo;
    ppLine2: TppLine;
    cbkAvaliaFornecSN: TDBCheckBox;
    Toolbar972: TToolbar97;
    btnImprimir: TBitBtn;
    MSAval: TMontaSelect;
    grdAvaliacaoFornec: TwwDBGrid;
    pnDescr: TPanel;
    dbrExec: TGroupBox;
    Label5: TLabel;
    dmMemExecServico: TDBMemo;
    gbrQua: TGroupBox;
    dbMemQualificacao: TDBMemo;
    Splitter2: TSplitter;
    pnDados: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    lblNat: TLabel;
    edDtAval: TCMDateTimePicker;
    edDtExec: TCMDateTimePicker;
    rdQualidTecnica: TDBRadioGroup;
    lcbNaturezaContr: TwwDBLookupCombo;
    btnPesq: TBitBtn;
    QryIprFornecNOMEUSUARIO: TStringField;
    QryIprFornecTRGDTINCLUSAO: TDateTimeField;
    daDataModule1: TdaDataModule;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBMemo4: TppDBMemo;
    ppDBMemo5: TppDBMemo;
    lblTipoFornecedor: TLabel;
    dbcTipoFornecedor: TDBComboBox;
    lblRaca: TLabel;
    lblCodCBO: TLabel;
    dbmCodCBO: TwwDBEdit;
    lblGrauInstr: TLabel;
    dblckGrauInstr: TwwDBLookupCombo;
    grbCatTrab: TGroupBox;
    grbExpAgNocivo: TGroupBox;
    dblckExpAgNocivo: TwwDBLookupCombo;
    lblgrupCat: TLabel;
    dblckgrupoCat: TwwDBLookupCombo;
    lblDescCat: TLabel;
    CdsGrauInstrucao: TCMClientDataSet;
    CdsGrupoCat: TCMClientDataSet;
    CdsDescCat: TCMClientDataSet;
    CdsExpAgNocivo: TCMClientDataSet;
    lblTpLograd: TLabel;
    lblUF: TLabel;
    dbmUF: TwwDBEdit;
    lblCodMun: TLabel;
    dbmCodMun: TwwDBEdit;
    CdsTpLogradouro: TCMClientDataSet;
    dblkpTpLogradouro: TwwDBLookupCombo;
    cbbRaca: TwwDBComboBox;
    CdsDescGrupoCat: TCMClientDataSet;
    dblckDescCat: TwwDBLookupCombo;
    chkCPRB: TCheckBox;
    cdsCidadeMunicipio: TCMClientDataSet;
    grpVinculo: TGroupBox;
    EdtDtFimVinculo: TCMDateTimePicker;
    lblIniVinculo: TLabel;
    lblFimVinculo: TLabel;
    EdtDtIniVinculo: TCMDateTimePicker;
    dsClone: TDataSetProvider;
    cdsClone: TCMClientDataSet;
    dbedtCargoFuncao: TwwDBEdit;
    lblCargo_padrao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure BtnDelTipoDesembClick(Sender: TObject);
    procedure BtnAddTipoDesembClick(Sender: TObject);
    procedure BtnAddImpAgregClick(Sender: TObject);
    procedure BtnDelImpAgregClick(Sender: TObject);
    procedure GrdTipoDesembCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GrdTipoDesembFornCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure spdRamosFornClick(Sender: TObject);
    procedure spdFornxRamoClick(Sender: TObject);
    procedure CdsEmpresaForneBeforePost(DataSet: TDataSet);
    procedure CmpCentCustoApertouBotao(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure HabilitarCampos;
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
    procedure btnTrazFornecClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure MSAvalBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure btnOKClick(Sender: TObject);
    procedure cdsAvaliacaoFornecAfterOpen(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rdQualidTecnicaClick(Sender: TObject);
    procedure cdsAvaliacaoFornecAfterScroll(DataSet: TDataSet);
    procedure tbcDetalheChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction); //Higor Nayde SOL 188854 Kintana 1784331
    //Início - William Santana - SOL 229878.16779 PPM 610132
    procedure sbtnFisJurClick(Sender: TObject);
    procedure dblckgrupoCatChange(Sender: TObject);
    procedure CamposSomenteLeitura( b: boolean );
    //Témino - William Santana - SOL 229878.16779 PPM 610132
    procedure dbcTipoFornecedorChange(Sender: TObject);//William Santana - SOL 260446 PPM 1035009
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dbedDocumentoExit(Sender: TObject);
    procedure CdsBeforeEdit(DataSet: TDataSet);

  private
    FDataHoraPesquisa: TDateTime;

    procedure PintarCampos(lEdit: Array of TComponent; Color: TColor);

    function VerificaContaDuplicada : boolean;         //edilaine SIG100444  
    function ValidarEMail(aStr: string): Boolean; //Helen - WO8148

    { Private declarations }
  protected

    CtrlAvaliacaoFornec: TCtrlAvaliacaoFornec; //Thaise - SOL136120
    procedure SelSubTipo(rIdPessoa: Double); Override;


  public
     nConsModulo: Integer;
     bTtravarCadastro: boolean;
     nIdPessoa: Integer;
     lIdsExistentes: Array of Integer;
     DtEmissao: TDateTime;
     ntotalbanco: Integer; // André Imakawa - SIG 21988
     sTipoOperacao: String;  //Cássio - SIG nº 57136
     sCnpj, sFlgStatus : String; //Helen - WO9227


     procedure TratarAvaliacao; //Thaise - SOL136120
     procedure AtualizaAvaliacao; //Thaise - SOL136120
     function VerificaNovoRegistro: Boolean;
     procedure VerificaUsuarioInclusaoAvaliacaofornecedor;//Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328
     procedure CargaTempTable;
     procedure BloquearControles(BloqDesbloq: Boolean);
     function VerificarEmissao(DataEmissao: TDateTime): Boolean;

    { Public declarations }
  end;

var
  frmCadForne: TfrmCadForne;

implementation

Uses uCtrlParamIntegra, uSistema, uString, uCtrlPessoaForne, dBaseDados,
     uCMTypes, uMensErro, uCtrlPessoa;

{$R *.DFM}

procedure TfrmCadForne.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaForne.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer,True);
  Pessoa.SubTipo := stFornecedor;
  Pessoa.TipoPessoa := tpOpcional;
  Pessoa.UsaPessoaFisica := True;

  TCtrlPessoaForne(Pessoa).CdsEmpresaForn := CdsEmpresaForne;
  TCtrlPessoaForne(Pessoa).CdsImAgregForn := CdsImAgregForn;
  TCtrlPessoaForne(Pessoa).CdsFornXDesemb := CdsTipoDesembForn;
  TCtrlPessoaForne(Pessoa).CdsFornXRamo := CdsRamoXForne;

  inherited;

  CmpCentCusto.Mascara := ParamIntegra.MascaraCC;
  SqlCentCusto.Prepare;
  SqlCentCusto.ParamByName('IDEMPRESA').asinteger := sistema.IdEmpresa;
  SqlCentCusto.ParamByName('IDPLANCENTCUST').asinteger := ParamIntegra.PlanoCentroCusto;
  CmpCentCusto.LookupSql.Text :=  ' SELECT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, CODEXTERNO FROM CENTCUST WHERE IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) +
  ' AND IDPLANCENTCUST = '+ intToStr(ParamIntegra.PlanoCentroCusto);

  MontaSelect.Filtro.Append('EMPRESAFORN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  MsNatuRendimento.Filtro.Append('NATURENDIMENTO.RECPAG = ''P''');

  MsSubConta.Filtro.Append('SUBCONTA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  MsAtividadeProjeto.Filtro.Append('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  
  MsCentroCusto.Filtro.Clear;
  MsCentroCusto.Filtro.Append('CONTASXCC.IDEMPRESA = CENTCUST.IDEMPRESA');

  MsCentroCusto.Filtro.Append('CENTCUST.IDPLANCENTCUST = '+ intToStr(ParamIntegra.PlanoCentroCusto));

  MsCentroCusto.Filtro.Append('CONTASXCC.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO');
  MsCentroCusto.Filtro.Append('CONTASXCC.PLANO = ' + InttoStr(ParamIntegra.Plano));
  MsCentroCusto.Filtro.Append('CONTASXCC.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa));
  MsCentroCusto.Filtro.Append('CONTASXCC.PLACONTA = ' + quotedStr(Espaco('',18)));

  CmpSubConta.FiltroProcura := 'IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);

  CmpAtivProj.FiltroProcura := 'IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);

  TbsContabil.TabVisible := (ParamIntegra.IntegraContabPag);
  If TbsContabil.TabVisible Then
  Begin
    CContabil.Plano := ParamIntegra.Plano;
    CContabil.Mascara := ParamIntegra.MascaraPlano;

    CContabilAdiantamento.Plano := ParamIntegra.Plano;
    CContabilAdiantamento.Mascara := ParamIntegra.MascaraPlano;

    CContabilCredito.Plano := ParamIntegra.Plano;
    CContabilCredito.Mascara := ParamIntegra.MascaraPlano;
  End;

  CmpNaturezaRendimento.FiltroProcura := 'RECPAG = ''P''';


  CtrlAvaliacaoFornec := TCtrlAvaliacaoFornec.Create;
  CtrlAvaliacaoFornec.InitializeAs(Padroes);
  CtrlAvaliacaoFornec.cds:= cdsAvaliacaoFornec;
  cdsAvaliacaoFornec.Data:=  CtrlAvaliacaoFornec.AvaliacaoFornec(-1);
  cdsJustificativas.Data:= CtrlAvaliacaoFornec.AbreJustificativas(-1);


  cdsAvaliacaoFornec.IndexFieldNames := 'IDAVALIACAO'; //Vander Campos SOL: 176923 KINTANA: 1617670

  //Início - William Santana - SOL 229878.16779 PPM 610132
  lblTipoFornecedor.Visible := not(Pessoa.Ejuridica);
  dbcTipoFornecedor.Visible := not(Pessoa.Ejuridica);

  CdsGrauInstrucao.Data := TCtrlPessoaForne(Pessoa).SelGrauInstrucao();
  CdsExpAgNocivo.Data := TCtrlPessoaForne(Pessoa).SelGrauExpAgNocivo();
  CdsGrupoCat.Data := TCtrlPessoaForne(Pessoa).SelGrupoCategoria();
  dblckDescCat.enabled := false;
  CdsTpLogradouro.Data := Pessoa.ListTipoLogradouro;

  CamposSomenteLeitura(true);
  //Término - William Santana - SOL 229878.16779 PPM 610132

  //SIG38475-84797 - Everson Cunha - Início
  //Início - William Santana - SOL 260446 PPM 1035009
//   if (CdsEmpresaForne.FieldByName('TPFORNECEDOR').AsString = 'Autônomo') or (dbcTipoFornecedor.ItemIndex = 3) then
//     pnlAutonomo.Visible := false;
  //Término - William Santana - SOL 260446 PPM 1035009
  //SIG38475-84797 - Everson Cunha - Fim

  //Andre Imakawa - SIG 121028 - Inicio
  LblNomePai_Padrao.Visible := (Sistema.IdModulo = 18);
  LblNomeMae_Padrao.Visible := (Sistema.IdModulo = 18);
  EdtNomePai_Padrao.Visible := (Sistema.IdModulo = 18);
  EdtNomeMae_Padrao.Visible := (Sistema.IdModulo = 18);
  //Andre Imakawa - SIG 121028 - Fim
end;

procedure TfrmCadForne.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  If Not TCtrlPessoaForne(Pessoa).SelDadosForne(Sistema.IdEmpresa, rIdPessoa, CdsSubTipo,
         CdsEmpresaForne, CdsTipoDesemb, CdsImAgreg, CdsRamoForne, CdsTipoDesembForn,
         CdsImAgregForn, CdsRamoXForne) Then Raise Exception.Create(Pessoa.MessageInfo);
end;

procedure TfrmCadForne.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CdsEmpresaForne.Insert;
  CdsEmpresaForne.FieldByName('FLGSTATUS').AsString := 'A';
  CdsEmpresaForne.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;

  dblckgrupoCat.Text := EmptyStr; //William Santana - SOL 229878.16779 PPM 610132
  CamposSomenteLeitura(false);    //William Santana - SOL 229878.16779 PPM 610132
  HabilitarCampos;
end;

procedure TfrmCadForne.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  CdsEmpresaForne.Edit;

  If CdsEmpresaForne.FieldByName('FLGSTATUS').IsNull Then
     CdsEmpresaForne.FieldByName('FLGSTATUS').AsString := 'A';

  CdsEmpresaForne.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;

  CamposSomenteLeitura(false);    //William Santana - SOL 229878.16779 PPM 610132

  //Cássio - SIG nº 57136 - Início
  chkCPRB.Checked := CdsEmpresaForne.FieldByName('FLGCPRB').AsInteger = 1;
  //Cássio - SIG nº 57136 - Fim

  bTtravarCadastro:= False;
  if Pessoa.TravaAlteracao(Cds.FieldByName('IDPESSOA').AsInteger) then
  begin
    bTtravarCadastro:= True;
    EdtNomePai_Padrao.Enabled:= False;
    EdtNomeMae_Padrao.Enabled:= False;
    dbrgrpEstCivil_Padrao.Enabled:= False;
    CmbNaturalidade_Padrao.Enabled:= False;
    DbedNacionalidade_Padrao.Enabled:= False;
    EdtDataNasc_Padrao.Enabled:= False;
    dbrgrpSexo_Padrao.Enabled:= False;
    CkbIsentoIrrf_Padrao.Enabled:= False;
    EdtTipoSang_Padrao.Enabled:= False;
    GpNumDepend_Padrao.Enabled:= False;

    PintarCampos([EdtNomePai_Padrao, EdtNomeMae_Padrao, dbrgrpEstCivil_Padrao,
                  CmbNaturalidade_Padrao, DbedNacionalidade_Padrao, EdtDataNasc_Padrao,
                  dbrgrpSexo_Padrao, CkbIsentoIrrf_Padrao, EdtTipoSang_Padrao, GpNumDepend_Padrao, dbcTipoFornecedor], clGray);

  end;

end;

procedure TfrmCadForne.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin

  if (nConsModulo = Almoxarifado) or
     (nConsModulo = Cpagar) or
     (nConsModulo = AdminImob) or
     (nConsModulo = Contratos) or
     (nConsModulo = Folha) then        //Edilaine - SOL 188851 / KTN 1784371
  begin
    if dsAvaliacaoFornec.State in [DsInsert, DsEdit] then
      bbtnCancelarDet.Click;

    if not VerificaNovoRegistro then
    begin
      Application.MessageBox('Avalie o fornecedor!', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      Abort;
    end;
  end;

  inherited;
  If (CmeCadastro.Operacao In [OpInserir, Opalterar]) And Accept Then
  Begin
    if (trim(EdtDtIniVinculo.text) <> '') and (trim(EdtDtFimVinculo.text) <> '') then
    if StrToDate(EdtDtIniVinculo.text) > StrToDate(EdtDtFimVinculo.text) then
    begin
       MsgDlg('Data de Início do Vínculo não pode ser maior que a Data de Fim do Vínculo', 'Atenção', mtError, [mbOk],0);
       PgCtrlPesFisica_Padrao.ActivePage := TbsDadosPessoais_Padrao;
       EdtDtIniVinculo.SetFocus;
       abort;
    end;

    if (trim(EdtDataNasc_Padrao.text) <> '') and (trim(EdtDtIniVinculo.text) <> '') then
    if StrToDate(EdtDataNasc_Padrao.text) > StrToDate(EdtDtIniVinculo.text) then
    begin
       MsgDlg('Data de Nascimento não pode ser maior que a Data de Início do Vínculo', 'Atenção', mtError, [mbOk],0);
       PgCtrlPesFisica_Padrao.ActivePage := TbsDadosPessoais_Padrao;
       EdtDataNasc_Padrao.SetFocus;
       abort;
    end;

    if (trim(EdtDtFimVinculo.text) <> '') and (trim(EdtDtIniVinculo.text) = '') then
    begin
       MsgDlg('Com a Data de Fim do Vínculo preenchida, a Data de Início do Vínculo também deverá ser preenchida', 'Atenção', mtError, [mbOk],0);
       PgCtrlPesFisica_Padrao.ActivePage := TbsDadosPessoais_Padrao;
       EdtDtIniVinculo.SetFocus;
       abort;
    end;

    //SIG38475-84797 - Everson Cunha - Início
    {//Início - William Santana - SOL 229878.16779 PPM 610132
    if not(Pessoa.Ejuridica) then
    begin
     if not(pnlAutonomo.visible) then // William Santana - SOL 260446 PPM 1035009
     begin
      if (dbrgrpSexo_Padrao.ItemIndex = -1) then
      begin
       MsgDlg('Preencha o Sexo', 'Atenção', mtInformation, [mbOk],0);
       pgctrlDetalhe.ActivePage := tbsDocumento;
       PgCtrlPesFisica_Padrao.ActivePage := TbsDadosPessoais_Padrao;
       dbrgrpSexo_Padrao.SetFocus;
       abort;
      end;

      if (cbbRaca.ItemIndex = -1) then
      begin
       MsgDlg('Preencha a Raça/Cor', 'Atenção', mtInformation, [mbOk],0);
       pgctrlDetalhe.ActivePage := tbsDocumento;
       PgCtrlPesFisica_Padrao.ActivePage := TbsDadosPessoais_Padrao;
       cbbRaca.SetFocus;
       abort;
      end;

      if (dblckGrauInstr.Value = EmptyStr) then
      begin
       MsgDlg('Preencha o Grau de Instrução', 'Atenção', mtInformation, [mbOk],0);
       pgctrlDetalhe.ActivePage := tbsDocumento;
       PgCtrlPesFisica_Padrao.ActivePage := TbsDadosPessoais_Padrao;
       dblckGrauInstr.SetFocus;
       abort;
      end;

      if (trim(dbmCodCBO.Text) = EmptyStr) then
      begin
       MsgDlg('Preencha o Código CBO', 'Atenção', mtInformation, [mbOk],0);
       pgctrlDetalhe.ActivePage := tbsDocumento;
       PgCtrlPesFisica_Padrao.ActivePage := TbsDadosPessoais_Padrao;
       dbmCodCBO.SetFocus;
       abort;
      end;
     end;
    end;
    //Término - William Santana - SOL 229878.16779 PPM 610132         }
    //SIG38475-84797 - Everson Cunha - Fim

	 Accept := (Not CdsRamoXForne.IsEmpty);

     If Accept Then
     Begin
        If ParamIntegra.IntegraContabPag Then
        Begin
           Accept := ((CContabil.Valida = VcOk) And
                      (CContabilAdiantamento.Valida = VcOk) And
                      (CContabilCredito.Valida = VcOk));

           If Accept Then
           Begin
             if Not ParamIntegra.CriaSubContaForn then
                CmpSubConta.PermiteChaveEmBranco := (Not CContabil.Conta.ObrigaSubConta);

             Accept := (CmpSubConta.Valida = VcOk);

             if Accept then
             begin

               TCtrlPessoaForne(Pessoa).CriaSubConta := ParamIntegra.CriaSubContaForn And
                                                        CContabil.Conta.ObrigaSubConta;

               CmpCentCusto.PermiteChaveEmBranco := (Not CContabil.Conta.ObrigaCentrodeCusto);
               Accept := (CmpCentCusto.Valida = VcOk);

               if Accept then
                  Accept := (CmpAtivProj.Valida = VcOk);


             End;
           End;
        End;

        CdsImAgregForn.Filtered := False;
        CdsImAgregForn.Filter := 'CODIMPOSTO = 20';
        CdsImAgregForn.Filtered := True;

        if CdsImAgregForn.FieldByName('CODIMPOSTO').AsFloat = 20 then
        begin
           CdsImAgregForn.Filtered := False;
           MsgDlg ('Não é permitido relacionar impostos do tipo CPMF.', 'Erro', mtError, [mbok], 0 );
           Accept := false;
        end
        else
           CdsImAgregForn.Filtered := False;

       End
       Else
         MsgDlg('Ramo de Fornecedor não informado', 'Atenção', mtInformation, [mbOk],0);
  end;                                                                                   
end;

procedure TfrmCadForne.BtnDelTipoDesembClick(Sender: TObject);
Var
  sCodDesemb: String;
begin
  inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsTipoDesembForn.IsEmpty) Then
  Begin
    sCodDesemb := Trim(CdsTipoDesembForn.FieldByName('CODTIPRECDES').AsString);
    Repeat
      CdsTipoDesemb.Append;
      CdsTipoDesemb.FieldByName('CODTIPRECDES').AsString := CdsTipoDesembForn.FieldByName('CODTIPRECDES').AsString;
      CdsTipoDesemb.FieldByName('DESCRICAO').AsString    := CdsTipoDesembForn.FieldByName('DESCRICAO').AsString;
      CdsTipoDesemb.FieldByName('ANASINT').AsString      := CdsTipoDesembForn.FieldByName('ANASINT').AsString;
      CdsTipoDesemb.FieldByName('RECPAG').AsString       := 'P';
      CdsTipoDesemb.FieldByName('IDPESSOA').AsFloat    := Sistema.IdEmpresa;
      CdsTipoDesemb.Post;
      CdsTipoDesembForn.Delete;
    Until Pos(sCodDesemb,Trim(CdsTipoDesembForn.FieldByName('CODTIPRECDES').AsString)) <> 1;
  End;
end;

procedure TfrmCadForne.BtnAddTipoDesembClick(Sender: TObject);
Var
  sCodDesemb: String;
begin                                       
  inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsTipoDesemb.IsEmpty) Then
  Begin
    sCodDesemb := Trim(CdsTipoDesemb.FieldByName('CODTIPRECDES').AsString);
    Repeat
      CdsTipoDesembForn.Append;

      CdsTipoDesembForn.FieldByName('IDPESSOA').AsFloat := Cds.FieldByName('IDPESSOA').AsFloat;
      CdsTipoDesembForn.FieldByName('ANASINT').AsString := CdsTipoDesemb.FieldByName('ANASINT').AsString;
      CdsTipoDesembForn.FieldByName('IDFORNXDESEMB').AsFloat := Pessoa.GetNextID;
      CdsTipoDesembForn.FieldByName('CODTIPRECDES').AsString := CdsTipoDesemb.FieldByName('CODTIPRECDES').AsString;
      CdsTipoDesembForn.FieldByName('RECPAG').asString := 'P';
      CdsTipoDesembForn.FieldByName('IDEMPRESAPROP').AsFloat := Sistema.IdEmpresa;
      CdsTipoDesembForn.FieldByName('DESCRICAO').AsString := CdsTipoDesemb.FieldByName('DESCRICAO').AsString;
      CdsTipoDesembForn.Post;
      CdsTipoDesemb.Delete;
    Until Pos(sCodDesemb,Trim(CdsTipoDesemb.FieldByName('CODTIPRECDES').AsString)) <> 1;
  End;
end;

procedure TfrmCadForne.BtnAddImpAgregClick(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsImAgreg.IsEmpty) Then
  Begin                                           
    CdsImAgregForn.Append;

    CdsImAgregForn.FieldByName('DESCCUSTAGREG').AsString := CdsImAgreg.FieldByName('DESCCUSTAGREG').AsString;
    CdsImAgregForn.FieldByName('CODTIPOCUSTAGREG').AsFloat := CdsImAgreg.FieldByName('CODTIPOCUSTAGREG').AsFloat;
    CdsImAgregForn.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
    CdsImAgregForn.FieldByName('RECPAG').AsString := 'P';
    CdsImAgregForn.FieldByName('IDFORCLI').AsFloat := Cds.FieldByName('IDPESSOA').AsFloat;

    CdsImAgregForn.FieldByName('CODIMPOSTO').AsFloat := CdsImAgreg.FieldByName('CODIMPOSTO').AsFloat;
    CdsImAgregForn.Post;

    CdsImAgreg.Delete;
  End;
end;

procedure TfrmCadForne.BtnDelImpAgregClick(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsImAgregForn.IsEmpty) Then
  Begin
    CdsImAgreg.Append;
    CdsImAgreg.FieldByName('DESCCUSTAGREG').AsString     := CdsImAgregForn.FieldByName('DESCCUSTAGREG').AsString;
    CdsImAgreg.FieldByName('CODTIPOCUSTAGREG').AsFloat := CdsImAgregForn.FieldByName('CODTIPOCUSTAGREG').AsFloat;
    CdsImAgreg.Post;
    
    CdsImAgregForn.Delete;
  End;
end;

procedure TfrmCadForne.GrdTipoDesembCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If (Not (Sender as TwwDbGrid).Datasource.DataSet.IsEmpty) And
     ((Sender as TwwDbGrid).Datasource.DataSet.FieldByName('ANASINT').AsString = 'S') Then
     Begin
        ABrush.Color := $0080FFFF;
        AFont.Color  := ClNavy;
     End
     Else
     Begin
        ABrush.Color := ClWhite;
        AFont.Color  := ClBlack;
     End;
end;

procedure TfrmCadForne.GrdTipoDesembFornCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  If (Not (Sender as TwwDbGrid).Datasource.DataSet.IsEmpty) And
     ((Sender as TwwDbGrid).Datasource.DataSet.FieldByName('ANASINT').AsString = 'S') Then
     Begin
        ABrush.Color := $0080FFFF;
        AFont.Color  := ClNavy;
     End
     Else
     Begin
        ABrush.Color := ClWhite;
        AFont.Color  := ClBlack;
     End;
end;

procedure TfrmCadForne.spdRamosFornClick(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsRamoForne.IsEmpty) Then
  Begin
     CdsRamoXForne.Append;
     CdsRamoXForne.FieldByName('IDRAMOFORNECEDOR').AsInteger  := CdsRamoForne.FieldByName('IDRAMOFORNECEDOR').AsInteger;
     CdsRamoXForne.FieldByName('IDPESSOA').AsInteger          := Cds.FieldByName('IDPESSOA').AsInteger;
     CdsRamoXForne.FieldByName('DESCRAMOFORNECEDOR').AsString := CdsRamoForne.FieldByName('DESCRAMOFORNECEDOR').AsString;
     CdsRamoXForne.Post;

     CdsRamoForne.Delete;
  End;
end;

procedure TfrmCadForne.spdFornxRamoClick(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsRamoXForne.IsEmpty) Then
  Begin
    CdsRamoForne.Append;
    CdsRamoForne.FieldByName('IDRAMOFORNECEDOR').AsInteger  := CdsRamoXForne.FieldByName('IDRAMOFORNECEDOR').AsInteger;
    CdsRamoForne.FieldByName('DESCRAMOFORNECEDOR').AsString := CdsRamoXForne.FieldByName('DESCRAMOFORNECEDOR').AsString;
    CdsRamoForne.Post;

    CdsRamoXForne.Delete;
  End;
end;

procedure TfrmCadForne.CdsEmpresaForneBeforePost(DataSet: TDataSet);
begin
  inherited;
  If (Not CdsEmpresaForne.FieldByName('CONTACFORN').IsNull) Or
     (Not CdsEmpresaForne.FieldByName('CONTACADIANTAMENTO').IsNull) Or
     (Not CdsEmpresaForne.FieldByName('CONTACDESPESA').IsNull) Then
     CdsEmpresaForne.FieldByName('PLANO').AsInteger := ParamIntegra.Plano;

  //Cássio - SIG nº 57136 - Início
  if chkCPRB.Checked then
  begin
    CdsEmpresaForne.FieldByName('FLGCPRB').AsInteger := 1;
    CdsEmpresaForne.FieldByName('ALIQCPRB').AsFloat := 3.5;
  end
  else
  begin
  	CdsEmpresaForne.FieldByName('FLGCPRB').AsInteger := 0;
    CdsEmpresaForne.FieldByName('ALIQCPRB').AsFloat := 11;
  end;
  //Cássio - SIG nº 57136 - Fim
end;


procedure TfrmCadForne.CmpCentCustoApertouBotao(Sender: TObject);
begin
  inherited;

  CContabil.Valida;
  MsCentroCusto.Filtro.Clear;
  MsCentroCusto.Filtro.Append('CONTASXCC.IDEMPRESA = CENTCUST.IDEMPRESA');
  MsCentroCusto.Filtro.Append('CONTASXCC.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO');
  MsCentroCusto.Filtro.Append('CONTASXCC.PLANO = ' + InttoStr(ParamIntegra.Plano));
  MsCentroCusto.Filtro.Append('CONTASXCC.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa));
  MsCentroCusto.Filtro.Append('CONTASXCC.PLACONTA = ' + QuotedStr(Espaco(CContabil.Conta.Numero,18)));
  MsCentroCusto.Filtro.Append('CENTCUST.IDPLANCENTCUST = '+ intToStr(ParamIntegra.PlanoCentroCusto));

end;

procedure TfrmCadForne.CmeDetalheConfirma(Sender: TObject);
var
  cdsAux : TCMClientDataSet;
  sSQL: string;
begin
  if (nConsModulo = Almoxarifado) or
     (nConsModulo = AdminImob) or
     (nConsModulo = Contratos) or
     (nConsModulo = CPagar) or
     (nConsModulo = Folha) then        //Edilaine - SOL 188851 / KTN 1784371
  begin
    if not cdsAvaliacaoFornec.IsEmpty then
    begin
      AtualizaAvaliacao;
      TratarAvaliacao;
    end;

  end else
  begin
    cdsAux := TCMClientDataSet.Create(nil);
    try
      if pgctrlDetalhe.ActivePageIndex = 4 then
      begin
        if cmeDetalhe.Operacao in [opAlterar] then
        begin
          sSQL := 'SELECT PESSOA.NOME AS C0, ' + #13+
                  '       PESSOA.RAZAOSOCIAL AS C1, ' + #13+
                  '        PESSOA.NUMDOCUMENTO AS C2, ' + #13+
                  '        FORNSERV.CODCORRESP AS C3, ' + #13+
                  '        PESSOA.IDPESSOA AS C4, ' + #13+
                  '        PESSOA.IDPESSOA AS C5 ' + #13+
                  '   FROM PESSOA, ' + #13+
                  '        FORNSERV, ' + #13+
                  '        EMPRESAFORN ' + #13+
                  '  WHERE ( PESSOA.IDPESSOA=FORNSERV.IDPESSOA ) AND ' + #13+
                  '        ( PESSOA.IDPESSOA=EMPRESAFORN.IDFORCLI ) AND ' + #13+
                  '        ( FORNSERV.IDPESSOA = ' + Cds.FieldByName('IDPESSOA').AsString +') AND ' + #13+
                  '        ( EMPRESAFORN.IDPESSOA = 1 ) ' + #13+
                  '  ORDER BY C0 ASC';
          if FazQuery(cdsAux, sSQL) then
          begin
            sSQL := 'SELECT 1 FROM DOCUMENTO ' + #13 +
                    ' WHERE IDFORCLI = ' + Cds.FieldByName('IDPESSOA').asString + #13+
                    '   AND idcbancaria = ' + CdsContaBancaria.FieldByName('IDCBANCARIA').asString;
            if FazQuery(cdsAux, sSQL) then
            begin
              //BRUNO AZEVEDO SOL 139413 KINTANA 856985
              sSQL := 'SELECT CC.TIPOCONTA, CC.CONTACORRENTE, AB.NUMAGENCIA, PE.RAZAOSOCIAL ' + #13+
                      '  FROM CONTABANCARIA CC ' + #13 +
                      ' INNER JOIN AGENCIABANCARIA AB ON AB.IDPESSOA = CC.IDAGENCIA ' + #13 +
                      ' INNER JOIN PESSOA PE ON PE.IDPESSOA = AB.IDBANCO ' + #13 +
                      ' WHERE IDCBANCARIA = ' + CdsContaBancaria.FieldByName('IDCBANCARIA').asString;
              if FazQuery(cdsAux, sSQL) then
              begin
                if (cdsAux.FieldByName('RAZAOSOCIAL').AsString <> CdsBanco.FieldByName('RAZAOSOCIAL').asString) or
                   (cdsAux.FieldByName('TIPOCONTA').AsString <> CdsContaBancaria.FieldByName('TIPOCONTA').asString) or
                   (cdsAux.FieldByName('NUMAGENCIA').AsString <> CdsContaBancaria.FieldByName('NUMAGENCIA').asString) or
                   (cdsAux.FieldByName('CONTACORRENTE').AsString <> CdsContaBancaria.FieldByName('CONTACORRENTE').asString) then begin
                  MsgDlg('Não é possível alterar conta bancária que possua AP gerada e baixada.' + #13 +
                         'Caso seja necessário alterar a conta, cadastre uma nova e defina-a como Preferencial.',
                         'Erro', mtError, [mbOk], 0);
                  CmeDetalheCancel(Self);
                end
                else
                  inherited;
              end
              else
                inherited;
              //BRUNO AZEVEDO SOL 139413 KINTANA 856985
            end
            else
              inherited;
          end
          else
            inherited;
        end
        else
          inherited;
      end
      else
        inherited;
    finally
      FreeAndNil(cdsAux);
    end;
  end;



end;

procedure TfrmCadForne.HabilitarCampos;
begin
    EdtNomePai_Padrao.Enabled:= True;
    EdtNomeMae_Padrao.Enabled:= True;
    dbrgrpEstCivil_Padrao.Enabled:= True;
    EdtDataNasc_Padrao.Enabled:= True;
    dbrgrpSexo_Padrao.Enabled:= True;
    CkbIsentoIrrf_Padrao.Enabled:= True;
    EdtTipoSang_Padrao.Enabled:= True;
    GpNumDepend_Padrao.Enabled:= True;
    CmbNaturalidade_Padrao.Enabled:= True;
    DbedNacionalidade_Padrao.Enabled:= True;
    if bTtravarCadastro then
      PintarCampos([EdtNomePai_Padrao, EdtNomeMae_Padrao, dbrgrpEstCivil_Padrao,
                    CmbNaturalidade_Padrao, DbedNacionalidade_Padrao, EdtDataNasc_Padrao,
                    dbrgrpSexo_Padrao, CkbIsentoIrrf_Padrao, EdtTipoSang_Padrao, GpNumDepend_Padrao], clWindow);

   bTtravarCadastro:= False;
end;

procedure TfrmCadForne.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  HabilitarCampos;
end;

procedure TfrmCadForne.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  HabilitarCampos;
end;

procedure TfrmCadForne.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  HabilitarCampos;
  if not cdsAvaliacaoFornec.IsEmpty then
  begin
    AtualizaAvaliacao;
    TratarAvaliacao;
  end;
end;

procedure TfrmCadForne.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  HabilitarCampos;
  //Início - William Santana - SOL 229878.16779 PPM 610132
  SelSubTipo(CdsEmpresaForne.FieldByName('IDFORCLI').AsFloat);
  CdsDescGrupoCat.Data := TCtrlPessoaForne(Pessoa).GetGrupoCategoria(CdsEmpresaForne.FieldByName('IDCATEGTRABAESOCIAL').AsInteger);
  dblckgrupoCat.Value := CdsDescGrupoCat.FieldByName('GRUPO').AsString;
  CamposSomenteLeitura(true);
  //Término - William Santana - SOL 229878.16779 PPM 610132
  //pnlAutonomo.Visible := true; //William Santana - SOL 260446 PPM 1035009 //SIG38475-84797 - Everson Cunha
end;

procedure TfrmCadForne.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  HabilitarCampos;

  //Cássio - SIG nº 57136 - Início
  //chkCPRB.Checked := False;
  //Cássio - SIG nº 57136 - Fim
    
  CamposSomenteLeitura(true);    //William Santana - SOL 229878.16779 PPM 610132
end;

procedure TfrmCadForne.PintarCampos(lEdit: array of TComponent;
  Color: TColor);
var x: integer;
begin
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

procedure TfrmCadForne.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (nConsModulo = Almoxarifado) or
     (nConsModulo = Cpagar) or
     (nConsModulo = AdminImob) or
     (nConsModulo = Contratos) or
     (nConsModulo = Folha) then        //Edilaine - SOL 188851 / KTN 1784371
  begin
    if dsAvaliacaoFornec.State in [DsInsert, DsEdit] then
      bbtnCancelarDet.Click;

    if not VerificaNovoRegistro then
    begin
      Application.MessageBox('Avalie o fornecedor!', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      Abort;
    end;
  end;

  if not cdsAvaliacaoFornec.IsEmpty then
  begin
    AtualizaAvaliacao;
    TratarAvaliacao;
  end;

  if (nConsModulo = Almoxarifado) or
     (nConsModulo = Cpagar) or
     (nConsModulo = AdminImob) or
     (nConsModulo = Contratos) or
     (nConsModulo = Folha) then        //Edilaine - SOL 188851 / KTN 1784371
  begin
    Accept:= True;
    Self.Close;
  end;
end;

procedure TfrmCadForne.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec then
  begin
    qryNatureaContr.Close;
    qryNatureaContr.Open;
    BloquearControles(cdsAvaliacaoFornec.State in [DsInsert, DsEdit]);
  end;
end;

procedure TfrmCadForne.TratarAvaliacao;
begin

  cdsAvaliacaoFornec.DisableControls;
  cdsAvaliacaoFornec.First;
  while not cdsAvaliacaoFornec.Eof do
  begin
    CtrlAvaliacaoFornec.GravarAlaviacao(
    cdsAvaliacaoFornec.FieldByName('IDAVALIACAO').AsInteger,
    cdsAvaliacaoFornec.FieldByName('IDNATUREZA').AsInteger,
    cdsAvaliacaoFornec.FieldByName('IDPESSOA').AsInteger,
    cdsAvaliacaoFornec.FieldByName('DTAVALIACAO').AsDateTime,
    cdsAvaliacaoFornec.FieldByName('DTEXECUCAO').AsDateTime,
    cdsAvaliacaoFornec.FieldByName('QUALIDADETECNICA').AsString, //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328
    cdsAvaliacaoFornec.FieldByName('DESCRICAOSERVICO').AsString,
    cdsAvaliacaoFornec.FieldByName('MOTIVOQUALIFICACAO').AsString);
    cdsAvaliacaoFornec.Next;
  end;
  cdsAvaliacaoFornec.EnableControls;
  cdsAvaliacaoFornec.First;

end;

procedure TfrmCadForne.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  cdsAvaliacaoFornec.Data:=  CtrlAvaliacaoFornec.AvaliacaoFornec(Cds.FieldByName('IDPESSOA').AsInteger);
  cdsJustificativas.Data := CtrlAvaliacaoFornec.AbreJustificativas(Cds.FieldByName('IDPESSOA').AsInteger);
  cbkAvaliaFornecSN.Refresh;

  //Início - William Santana - SOL 229878.16779 PPM 610132
  lblTipoFornecedor.Visible := not(Pessoa.Ejuridica);
  dbcTipoFornecedor.Visible := not(Pessoa.Ejuridica);

  CdsDescGrupoCat.Data := TCtrlPessoaForne(Pessoa).GetGrupoCategoria(CdsEmpresaForne.FieldByName('IDCATEGTRABAESOCIAL').AsInteger);
  dblckgrupoCat.Value := CdsDescGrupoCat.FieldByName('GRUPO').AsString;
  //Término - William Santana - SOL 229878.16779 PPM 610132

  //Cássio - SIG nº 57136 - Início
  chkCPRB.Checked := CdsEmpresaForne.FieldByName('FLGCPRB').AsInteger = 1;
  //Cássio - SIG nº 57136 - Fim
end;

procedure TfrmCadForne.AtualizaAvaliacao;
var sListaIds: String;
begin

  cdsAvaliacaoFornec.DisableControls;
  cdsAvaliacaoFornec.First;
  while not cdsAvaliacaoFornec.Eof do
  begin
    sListaIds:= sListaIds + ', ' + cdsAvaliacaoFornec.FieldByName('IDAVALIACAO').AsString;
    cdsAvaliacaoFornec.Next;
  end;
  cdsAvaliacaoFornec.EnableControls;

  cdsAvaliacaoFornec.First;
  
  Delete(sListaIds, 1, 1);
  CtrlAvaliacaoFornec.DeletarAvaliacao(Cds.FieldByName('IDPESSOA').AsInteger, sListaIds);

end;

procedure TfrmCadForne.CmeDetalheApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec then
  begin
    if cdsAvaliacaoFornec.State in [dsEdit] then
      cdsAvaliacaoFornec.FieldByName('DESCRICAO').AsString:= CtrlAvaliacaoFornec.BuscarNomeContrato(cdsAvaliacaoFornec.FieldByName('IDNATUREZA').AsInteger);
  end;

  if (nConsModulo = Almoxarifado) or
     (nConsModulo = Cpagar) or
     (nConsModulo = AdminImob) or
     (nConsModulo = Contratos) or
     (nConsModulo = Folha) then        //Edilaine - SOL 188851 / KTN 1784371
    Accept:= True;
end;

procedure TfrmCadForne.CmeDetalheApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec then
  begin
    if cdsAvaliacaoFornec.State in [dsInsert] then
    begin
      cdsAvaliacaoFornec.FieldByName('DESCRICAO').AsString:= CtrlAvaliacaoFornec.BuscarNomeContrato(cdsAvaliacaoFornec.FieldByName('IDNATUREZA').AsInteger);
      cdsAvaliacaoFornec.FieldByName('TRGUSERINCLUSAO').AsString := 'CM'+intToStr(Sistema.IdUsuario);//Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328

    end;
  end;

 
  if (nConsModulo = Almoxarifado) or
     (nConsModulo = Cpagar) or
     (nConsModulo = AdminImob) or
     (nConsModulo = Contratos) or
     (nConsModulo = Folha) then        //Edilaine - SOL 188851 / KTN 1784371
    Accept:= True;
end;

procedure TfrmCadForne.btnTrazFornecClick(Sender: TObject);

begin
  inherited;
  //Thaise - SOL136120 - Não foi possível criar essa alteração no FormShow ou no FormCreate,
  //então foi adicionado um botão para ser chamado no on Paint.
  SelPessoa(nIdPessoa);
  sbtnAlterar.Enabled:= True;

 // if (nConsModulo <> Folha) then     //Marcio Sanches Spinosa SOL 188851 Kintana 1784371 - Inicio
     sbtnAlterar.OnClick(Self);

  tbcDetalhe.TabIndex := TbcDetalhe.Tabs.Indexof('Avaliação do Fornecedor');
  tbcDetalheChange(tbcDetalhe);
  btnImprimir.Enabled:= False;

  //pgctrlDetalhe.ActivePage := TbsAvaliacaoFornec;
end;

procedure TfrmCadForne.FormPaint(Sender: TObject);
begin
  inherited;
  if (nConsModulo = Almoxarifado) or
     (nConsModulo = Cpagar) or
     (nConsModulo = AdminImob) or
     (nConsModulo = Contratos)  or
     (nConsModulo = Folha)  then   //Edilaine - SOL 188851 / KTN 1784371
  begin
    btnTrazFornec.OnClick(Self);
    bbtnSair.Enabled:= False;
    bbtnCancelar.Enabled:= False;
    cdsAvaliacaoFornec.Data:=  CtrlAvaliacaoFornec.AvaliacaoFornec(Cds.FieldByName('IDPESSOA').AsInteger);
    cdsJustificativas.Data:= CtrlAvaliacaoFornec.AbreJustificativas(Cds.FieldByName('IDPESSOA').AsInteger);
  end;
end;

function TfrmCadForne.VerificaNovoRegistro: Boolean;
var x, Cont: Integer;
    Existe: Boolean;
begin
  Result:= False;
  if cdsAvaliacaoFornec.IsEmpty then
    Result:= False
  else
  begin
    cdsAvaliacaoFornec.DisableControls;
    cdsAvaliacaoFornec.First;

    Cont:= 0;
    while not cdsAvaliacaoFornec.EOF do
    begin
      Existe:= False;
      for x:= 0 to High(lIdsExistentes) do
        if cdsAvaliacaoFornec.FieldByName('IDAVALIACAO').AsInteger = lIdsExistentes[x] then
          Existe:= True;

      if not Existe then
        Inc(Cont);

      cdsAvaliacaoFornec.Next;
    end;
    cdsAvaliacaoFornec.EnableControls;
    cdsAvaliacaoFornec.First;

    Result:= Cont > 0;
  end;
end;

procedure TfrmCadForne.bbtnCancelarClick(Sender: TObject);
begin
  if (nConsModulo = Almoxarifado) or
     (nConsModulo = Cpagar) or
     (nConsModulo = AdminImob) or
     (nConsModulo = Contratos) or
     (nConsModulo = Folha) then        //Edilaine - SOL 188851 / KTN 1784371
  begin
    if dsAvaliacaoFornec.State in [DsInsert, DsEdit] then
      bbtnCancelarDet.Click;

    if not VerificaNovoRegistro then
    begin
      Application.MessageBox('Avalie o fornecedor!', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      Abort;
    end;
  end;

  inherited;
  btnImprimir.Enabled:= True;
end;

procedure TfrmCadForne.btnImprimirClick(Sender: TObject);
begin
  //inherited;
  if Cds.State in [dsEdit, dsInsert] then
    abort;


  QryIprFornec.Close;
  QryIprFornec.ParamByName('IDPESSOA').AsInteger:= Cds.FieldByName('IDPESSOA').AsInteger;
  QryIprFornec.Open;
  if not QryIprFornec.IsEmpty then
    rptAvaliacao.Print;




end;

procedure TfrmCadForne.btnPesqClick(Sender: TObject);
begin
  inherited;
  if cdsAvaliacaoFornec.State in [dsEdit, dsInsert] then
    Abort;

  if not cdsAvaliacaoFornec.IsEmpty then
  begin
    CargaTempTable;
    MSAval.Executar;

    if MSAval.RetornouValor then
      cdsAvaliacaoFornec.Locate('IDAVALIACAO', MSAval.ValoresChave[0], [loPartialKey]);

  end;
end;
procedure TfrmCadForne.sbtnAltDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec then
  begin
    if cdsAvaliacaoFornec.FieldByName('DESCRJUSTIFICATIVA').AsString <> '' then
    begin
       Application.MessageBox('Não é possível alterar nem excluir a justificativa', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
       bbtnCancelarDet.OnClick(Sender);
       Abort;
    end;
  end;

  inherited;

end;

procedure TfrmCadForne.sbtnExcluiDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec then
  begin
    if cdsAvaliacaoFornec.FieldByName('DESCRJUSTIFICATIVA').AsString <> '' then
    begin
       Application.MessageBox('Não é possível alterar nem excluir a justificativa', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
       bbtnCancelarDet.OnClick(Sender);
       Abort;
    end;
  end;

  inherited;
  //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Inicio
  if pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec then
  VerificaUsuarioInclusaoAvaliacaofornecedor;
  //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Fim
end;

procedure TfrmCadForne.CargaTempTable();
begin
  try
    FDataHoraPesquisa := Now;

    cdsAvaliacaoFornec.DisableControls;
    cdsAvaliacaoFornec.First;

    Padroes.ExecSqlAndCommit(CtrlAvaliacaoFornec.DeletaValoresTemp(Sistema.IdUsuario));

    while not cdsAvaliacaoFornec.Eof do
    begin
      Padroes.ExecSqlAndCommit(
          CtrlAvaliacaoFornec.InsereValoresTemp(cdsAvaliacaoFornec.FieldByName('IDAVALIACAO').AsInteger,
                                                Sistema.IdUsuario,
                                                cdsAvaliacaoFornec.FieldByName('DTAVALIACAO').AsDateTime,
                                                cdsAvaliacaoFornec.FieldByName('DTEXECUCAO').AsDateTime,
                                                FDataHoraPesquisa,
                                                cdsAvaliacaoFornec.FieldByName('QUALIDADETECNICA').AsString,
                                                cdsAvaliacaoFornec.FieldByName('DESCRICAOSERVICO').AsString,
                                                cdsAvaliacaoFornec.FieldByName('MOTIVOQUALIFICACAO').AsString,
                                                cdsAvaliacaoFornec.FieldByName('DESCRJUSTIFICATIVA').AsString,
                                                cdsAvaliacaoFornec.FieldByName('DESCRICAO').AsString)
      );

      cdsAvaliacaoFornec.Next;
    end;
  finally
    cdsAvaliacaoFornec.First;
    cdsAvaliacaoFornec.EnableControls;
  end;
end;

procedure TfrmCadForne.MSAvalBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
var
  vSQL: String;
begin
  inherited;
  vSQL := sqlText;

  vSQL := StringReplace(UpperCase(vSQL), 'DATAHORAPESQUISA IS NULL', 'DATAHORAPESQUISA = ' + QuotedStr(DateTimeToStr(FDataHoraPesquisa)), []);
  vSQL := StringReplace(UpperCase(vSQL), 'IDUSUARIO IS NULL', 'IDUSUARIO = ' + IntToStr(Sistema.IdUsuario), []);

  //sqlText := vSQL;
end;

procedure TfrmCadForne.btnOKClick(Sender: TObject);
begin
  //inherited;
  CdsAvaliacaoFornec.Post;
  if not cdsAvaliacaoFornec.IsEmpty then
  begin
    AtualizaAvaliacao;
    TratarAvaliacao;
  end;

end;

procedure TfrmCadForne.cdsAvaliacaoFornecAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if (nConsModulo = Almoxarifado) or
     (nConsModulo = Cpagar) or
     (nConsModulo = AdminImob) or
     (nConsModulo = Contratos) or
     (nConsModulo = Folha) then        //Edilaine - SOL 188851 / KTN 1784371
  begin

    if Length(lIdsExistentes) <= 0 then
    begin
      if cdsAvaliacaoFornec.RecordCount > 0 then
      begin
        cdsAvaliacaoFornec.DisableControls;
        cdsAvaliacaoFornec.First;
        while not cdsAvaliacaoFornec.EOF do
        begin
          SetLength(lIdsExistentes, Length(lIdsExistentes) + 1);
          lIdsExistentes[Length(lIdsExistentes) - 1]:= cdsAvaliacaoFornec.FieldByName('IDAVALIACAO').AsInteger;
          cdsAvaliacaoFornec.Next;
        end;
        cdsAvaliacaoFornec.EnableControls;
        cdsAvaliacaoFornec.First;
      end;
    end;

  end;

end;

procedure TfrmCadForne.bbtnOkDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec then
  begin
    if (Trim(cdsAvaliacaoFornec.FieldByName('IDNATUREZA').AsString) = '') then
    begin
      Application.MessageBox('Informe a natureza do contrato', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      lcbNaturezaContr.SetFocus;
      Abort;
    end;

    if cdsAvaliacaoFornec.FieldByName('DTEXECUCAO').AsDateTime = 0 then
    begin
      Application.MessageBox('Informe a Data da Execução!', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      edDtExec.SetFocus;
      Abort;
    end;

    if (Trim(cdsAvaliacaoFornec.FieldByName('QUALIDADETECNICA').AsString) = '') then
    begin
      Application.MessageBox('Indique a Qualidade Tecnica!', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      rdQualidTecnica.SetFocus;
      Abort;
    end;

    if (Trim(cdsAvaliacaoFornec.FieldByName('DESCRICAOSERVICO').AsString) = '') then
    begin
      Application.MessageBox('Indique a Descrição da execução do serviço!', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      dmMemExecServico.SetFocus;
      Abort;
    end;

    if (Trim(cdsAvaliacaoFornec.FieldByName('MOTIVOQUALIFICACAO').AsString) = '') then
    begin
      Application.MessageBox('Informe o Motivo da Qualificação!', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      dbMemQualificacao.SetFocus;
      Abort;
    end;

    if edDtExec.Date > edDtAval.Date then
    begin
      Application.MessageBox('A data de execução do serviço deve ser menor ou igual a data da avaliação!', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      edDtExec.SetFocus;
      Abort;
    end;

    if (nConsModulo = Almoxarifado) or
       (nConsModulo = Cpagar) or
       (nConsModulo = AdminImob) or
       (nConsModulo = Contratos) or
       (nConsModulo = Folha) then        //Edilaine - SOL 188851 / KTN 1784371
    begin
      if not VerificarEmissao(DtEmissao) then
      begin
        Application.MessageBox('Avaliação não válida para este documento', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
        edDtAval.SetFocus;
        Abort;
      end;
    end;

  end;

  //Início - William Santana - SOL 229878.16779 PPM 610132
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    //Início - William Santana - SOL 260446 PPM 1035009
   if (not(Pessoa.Ejuridica) and (CdsEmpresaForne.FieldByName('TPFORNECEDOR').AsString = 'Autônomo')) then
   begin
    //Término - William Santana - SOL 260446 PPM 1035009
    if (Trim(dbedNomeEndereco.text) = EmptyStr) then
    begin
      Application.MessageBox('Preencha o Local', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      dbedNomeEndereco.SetFocus;
      Abort;
    end;

    if (dblkpTpLogradouro.Value = EmptyStr) then
    begin
      Application.MessageBox('Preencha o Tipo de Logradouro', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      dblkpTpLogradouro.SetFocus;
      Abort;
    end;

    if (Trim(dbedLogradouro.text) = EmptyStr) then
    begin
      Application.MessageBox('Preencha o Logradouro', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      dbedLogradouro.SetFocus;
      Abort;
    end;

    if (Trim(DBNUMERO.text) = EmptyStr) then
    begin
      Application.MessageBox('Preencha o Número', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      DBNUMERO.SetFocus;
      Abort;
    end;

    if (Trim(dbedCEP.text) = EmptyStr) then
    begin
      Application.MessageBox('Preencha o CEP', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      dbedCEP.SetFocus;
      Abort;
    end;

    if (Trim(CmpCidades.Text) = EmptyStr) then
    begin
      Application.MessageBox('Preencha Cidade', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      CmpCidades.SetFocus;
      Abort;
    end;
   end;
  end;
  //Término - William Santana - SOL 229878.16779 PPM 610132

  // André Imakawa - SIG 21988 - Inicio
  if pgctrlDetalhe.ActivePage = tbsDadosBancarios then
  begin
    //if (Trim(CdsContaBancaria.FieldByName('IDBANCO').AsString) = '') then
    if dblkBanco.Text = '' then
    begin
      Application.MessageBox('Banco não informado', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      dblkBanco.SetFocus;
      Abort;
    end;

    //if (Trim(CdsContaBancaria.FieldByName('NUMAGENCIA').AsString) = '') then
    if DbeAgencia.Text = '' then
    begin
      Application.MessageBox('Agência não informada', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      Abort;
    end;

    //if (Trim(CdsContaBancaria.FieldByName('CONTACORRENTE').AsString) = '') then
    if dbedConta.Text = '' then
    begin
      Application.MessageBox('Conta não informada', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      dbedConta.SetFocus;
      Abort;
    end;

    //edilaine - SIG100444 : inicio
    if VerificaContaDuplicada() then
    begin
      dbedConta.SetFocus;
      Abort;
    end;
    //edilaine - SIG100444 : fim

    ntotalbanco:= CdsContaBancaria.recordcount;

  end;
  // André Imakawa - SIG 21988 - Fim

  inherited;

  if pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec then
    bbtnCancelarDet.OnClick(Sender);

  // André Imakawa - SIG 21988 - Inicio
  //if (pgctrlDetalhe.ActivePage = tbsDadosBancarios) and (ntotalbanco <> CdsContaBancaria.recordcount) then
  //  CdsContaBancaria.last;
  // André Imakawa - SIG 21988 - Fim
end;

procedure TfrmCadForne.BloquearControles(BloqDesbloq: Boolean);
begin
  edDtAval.Enabled           := BloqDesbloq;
  edDtExec.Enabled           := BloqDesbloq;
  rdQualidTecnica.Enabled    := BloqDesbloq;
  lcbNaturezaContr.Enabled   := BloqDesbloq;
  dmMemExecServico.Enabled   := BloqDesbloq;
  dbMemQualificacao.Enabled  := BloqDesbloq;
end;

procedure TfrmCadForne.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec then
    BloquearControles(False);

  // André Imakawa - SIG 21988 - Inicio
  if (pgctrlDetalhe.ActivePage = tbsDadosBancarios) Then
    CdsContaBancaria.Cancel;
  // André Imakawa - SIG 21988 - Fim
end;

function TfrmCadForne.VerificarEmissao(DataEmissao: TDateTime): Boolean;
begin
  Result := (FormatDateTime('MM/YYYY', CdsAvaliacaoFornec.FieldByName('DTAVALIACAO').AsDateTime)) = (FormatDateTime('MM/YYYY', DtEmissao));
end;

procedure TfrmCadForne.sbtnInsDetClick(Sender: TObject);
begin
  cdsAvaliacaoFornec.Last;//Vander Campos SOL: 176923 KINTANA: 1617670
  inherited;
  if pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec then
  begin
    cdsAvaliacaoFornec.FieldByName('IDAVALIACAO').AsInteger:= CtrlAvaliacaoFornec.LerSequencia;
    cdsAvaliacaoFornec.FieldByName('IDPESSOA').AsInteger:= Cds.FieldByName('IDPESSOA').AsInteger;
    //cdsAvaliacaoFornec.FieldByName('DTAVALIACAO').AsDateTime:= CtrlAvaliacaoFornec.SelecionaDataAtual;
    qryNatureaContr.Close;
    qryNatureaContr.Open;
    BloquearControles(cdsAvaliacaoFornec.State in [DsInsert, DsEdit]);
  end;
end;

procedure TfrmCadForne.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  btnImprimir.Enabled:= False;
  //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Inicio
  if(pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec)then
      VerificaUsuarioInclusaoAvaliacaofornecedor;
  //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Fim
end;

procedure TfrmCadForne.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  btnImprimir.Enabled:= False;
end;

procedure TfrmCadForne.bbtnConfirmarClick(Sender: TObject);
begin
  // Paulo Nobre - WO24274 - Inicio
  //WO8148 - Helen V Bianchi - Inicio
  if (Sistema.IdModulo <> 21) then    // Só validar o email em módulos <> do "MODFOL".
  begin
     if dbedemail.Text = '' then
     begin
         Application.MessageBox('Informe o endereço de e-mail.', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
         dbedemail.SetFocus;
         Abort;
     end;
     if not ValidarEMail(dbedemail.Text) then
     begin
         Application.MessageBox('O endereço de e-mail fornecido não é válido. Por favor, verifique se o formato do e-mail está correto e tente novamente.', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
         dbedemail.SetFocus;
         Abort;
     end;
  //WO8148 - Helen V Bianchi - Fim
  end;
  // Paulo Nobre - WO24274 - Fim

  //WO9227 - Helen V Bianchi - Inicio
  if cds.state in [dsedit]then
  begin
     if DBRadioGroup2.Value = 'A' then
        dbedDocumentoExit(Sender);
  end;
  //WO9227 - Helen V Bianchi - Fim

  CdsContaBancaria.Cancel; // André Imakawa - SIG 21988
  inherited;
  btnImprimir.Enabled:= True;
  //Vander Campos SOL: 176923 KINTANA: 1617670
  cdsAvaliacaoFornec.Data:=  CtrlAvaliacaoFornec.AvaliacaoFornec(Cds.FieldByName('IDPESSOA').AsInteger);
end;

procedure TfrmCadForne.rdQualidTecnicaClick(Sender: TObject);
begin
  inherited;
  //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Inicio
  if (rdQualidTecnica.ItemIndex = 0 ) then
  begin
      cdsAvaliacaoFornec.FieldByName('MOTIVOQUALIFICACAO').AsString :='Serviço/Produto avaliado como satisfatório pela área demandante.';
  end;
  cdsAvaliacaoFornec.FieldByName('QUALIDADETECNICAEXT').AsString := rdQualidTecnica.Items.Strings[rdQualidTecnica.ItemIndex];
  //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Fim
end;

procedure TfrmCadForne.cdsAvaliacaoFornecAfterScroll(DataSet: TDataSet);
begin
  //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Inicio
  VerificaUsuarioInclusaoAvaliacaofornecedor;
  //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Fim
end;

 //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Inicio
procedure TfrmCadForne.VerificaUsuarioInclusaoAvaliacaofornecedor;
begin
    if (cds.State in [dsInsert,dsedit]) and (NOT(cdsAvaliacaoFornec.State in [dsInsert]))then
  begin
     sbtnAltDet.Enabled    := (cdsAvaliacaoFornec.FieldByName('TRGUSERINCLUSAO').AsString = 'CM'+intToStr(Sistema.IdUsuario));
     sbtnExcluiDet.Enabled := (cdsAvaliacaoFornec.FieldByName('TRGUSERINCLUSAO').AsString = 'CM'+intToStr(Sistema.IdUsuario));
  end;
end;
 //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Fim


procedure TfrmCadForne.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Inicio
  if(pgctrlDetalhe.ActivePage = TbsAvaliacaoFornec)then
      VerificaUsuarioInclusaoAvaliacaofornecedor;
  //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328 - Fim

  //edilaine SIG100444 : inicio
  if (pgctrlDetalhe.ActivePage = tbsDadosBancarios)then
  begin
     dsClone.Dataset := CdsContaBancaria;
     cdsClone.SetProvider(dsClone);
     cdsClone.Open;
  end;
  //edilaine SIG100444 : fim

end;

//Higor Nayde SOL 188854 Kintana 1784331 - Início
procedure TfrmCadForne.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
Action := caFree;
end;

//Higor Nayde SOL 188854 Kintana 1784331 - Fim

//Início - William Santana - SOL 229878.16779 PPM 610132
procedure TfrmCadForne.sbtnFisJurClick(Sender: TObject);
begin
  lblTipoFornecedor.Visible := (Pessoa.Ejuridica);
  dbcTipoFornecedor.Visible := (Pessoa.Ejuridica);
  inherited;
end;

procedure TfrmCadForne.dblckgrupoCatChange(Sender: TObject);
begin
  inherited;
  dblckDescCat.enabled := true;
  CdsDescCat.Data := TCtrlPessoaForne(Pessoa).SelDescCategoria(dblckgrupoCat.LookupValue);
end;

procedure TfrmCadForne.CamposSomenteLeitura( b: boolean );
begin
  dbcTipoFornecedor.ReadOnly := b;
  cbbRaca.ReadOnly := b;
  dbmCodCBO.ReadOnly := b;
  dblckExpAgNocivo.ReadOnly := b;
  dblckgrupoCat.ReadOnly := b;
  dblckDescCat.ReadOnly := b;
end;
//Término - William Santana - SOL 229878.16779 PPM 610132

//Início - William Santana - SOL 260446 PPM 1035009
procedure TfrmCadForne.dbcTipoFornecedorChange(Sender: TObject);
begin
  inherited;
  //pnlAutonomo.Visible := (dbcTipoFornecedor.ItemIndex <> 3); //SIG38475-84797 - Everson Cunha
  dbrgrpSexo_Padrao.ItemIndex := -1;
  cbbRaca.ItemIndex := -1;
  dbmCodCBO.Clear;
  dblckGrauInstr.Clear;
  dblckgrupoCat.Clear;
  dblckDescCat.Clear;
  dblckExpAgNocivo.Clear;

end;
//Término - William Santana - SOL 260446 PPM 1035009

procedure TfrmCadForne.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
end;

//edilaine SIG100444 : inicio
function TfrmCadForne.VerificaContaDuplicada: boolean;
var
  sSQL : string;
  _QRY : TwwQuery;
  sMsg, sConta, sAgencia : string;
begin
  sConta   := StringReplace(CdsContaBancaria.FieldByName('CONTACORRENTE').AsString, '-', '', []);
  sAgencia := StringReplace(CdsContaBancaria.FieldByName('NUMAGENCIA').AsString, '-', '', []);

  _QRY := TwwQuery.create(nil);
  _QRY.DataBaseName := 'BaseDados';

  sSQL := 'SELECT DISTINCT P.NOME, P.IDPESSOA, P.NUMDOCUMENTO ' +
          '  FROM CONTABANCARIA B '+
          '  JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = B.IDAGENCIA '+
          '  JOIN PESSOA P ON P.IDPESSOA = B.IDPESSOA '+
          ' WHERE TRIM(B.CONTACORRENTE) = '+QuotedStr(sConta) +
          '   AND AG.IDBANCO = ' + CdsContaBancaria.FieldByName('IDBANCO').AsString +
          '   AND TRIM(AG.NUMAGENCIA) = ' +QuotedStr(sAgencia) +
          '   AND P.NUMDOCUMENTO <> '+QuotedStr(cds.FieldByName('NUMDOCUMENTO').AsString);

  if CmeDetalhe.Operacao = opAlterar then
     sSQL := sSQL + '   AND B.IDCBANCARIA <> '+CdsContaBancaria.FieldByName('IDCBANCARIA').AsString;

  try
    _Qry.SQL.text := sSQL;
    _Qry.Open;

    if not _QRY.eof then
    begin
       if _qry.recordcount = 1 then
          sMSG := 'Conta já cadastrada para outro fornecedor: '
       else
          sMSG := 'Conta já cadastrada para outros fornecedores: ';
       sMSG := sMSG + #13+#10;
       while not _Qry.eof do
       begin
         sMSG := sMSG + #13+#10+ _QRY.fieldByName('NOME').AsString;
         _qry.next;
       end;

       //edilaine SIG115280 : inicio
       //MsgDlg(sMSG, 'Atenção', mtWarning, [mbOk],0);
       //result := true;
       sMSG := sMSG + #13+#10+'Deseja manter o cadastro?';
       if MsgDlg(sMSG, 'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
          result := false
       else
          result := true;
       //edilaine SIG115280 : fim
    end
    else
    begin
      // Andre Imakawa - SIG 102199 - Inicio
      if CmeDetalhe.Operacao = opAlterar then
      begin
        cdsClone.Filter := 'IDBANCO = '+CdsContaBancaria.FieldByName('IDBANCO').AsString + ' AND '+
                          'CONTACORRENTE = '+QuotedStr(sConta) + ' AND ' +
                          'NUMAGENCIA = ' +QuotedStr(sAgencia);

        //edilaine SIG115280 : inicio
        if CdsContaBancaria.FieldByName('IDCBANCARIA').AsString <> '' then
           cdsClone.Filter := cdsClone.Filter + 'AND IDCBANCARIA <> '+CdsContaBancaria.FieldByName('IDCBANCARIA').AsString ;
        //edilaine SIG115280 : fim
      end
      else
      begin
        {clone preenchido antes da edição dos dados}
        cdsClone.Filter := 'IDBANCO = '+CdsContaBancaria.FieldByName('IDBANCO').AsString + ' AND '+
                          'CONTACORRENTE = '+QuotedStr(sConta) + ' AND ' +
                          'NUMAGENCIA = ' +QuotedStr(sAgencia);
      end;
      // Andre Imakawa - SIG 102199 - Fim

      cdsClone.Filtered := true;
      if not cdsClone.Eof then
      begin
        MsgDlg('Conta já cadastrada para este fornecedor', 'Atenção', mtWarning, [mbOk],0);
        result := true;
      end
      else
        result := false;
    end;

  finally
    FreeandNil(_QRY);
  end;
end;
//edilaine SIG100444 : fim

function TfrmCadForne.ValidarEMail(aStr: string): Boolean; //Helen - WO8148
begin
 aStr := Trim(UpperCase(aStr));
 if Pos('@', aStr) > 1 then
 begin
   Delete(aStr, 1, pos('@', aStr));
   Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
 end
 else
   Result := False;
end;

procedure TfrmCadForne.dbedDocumentoExit(Sender: TObject);
var qryAux, qryAlt: TwwQuery;  //WO9227 - Helen V Bianchi
begin
  inherited;
  //WO9227 - Helen V Bianchi - Inicio
   qryAux := TwwQuery.Create(Nil);
   qryAux.DatabaseName:= 'BaseDados';

   qryAlt := TwwQuery.Create(Nil);
   qryAlt.DatabaseName:= 'BaseDados';

   if cds.state in [dsedit]then
   begin
      if dbedDocumento.text = sCnpj then
      begin
          if (DBRadioGroup2.Value <> 'A')  and (DBRadioGroup2.Value = sFlgStatus) then
             exit;
      end;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.Sql.Add('SELECT PESSOA.NOME ,PESSOA.RAZAOSOCIAL, PESSOA.NUMDOCUMENTO , PESSOA.IDPESSOA ,EMPRESAFORN.FLGSTATUS ');
   qryAux.Sql.Add('FROM    PESSOA,   FORNSERV,   EMPRESAFORN');
   qryAux.Sql.Add('WHERE                                    ');
   qryAux.Sql.Add('  ( PESSOA.IDPESSOA=FORNSERV.IDPESSOA ) AND ' );
   qryAux.Sql.Add('  ( PESSOA.IDPESSOA=EMPRESAFORN.IDFORCLI ) AND ' );
   qryAux.Sql.Add('  ( EMPRESAFORN.IDPESSOA = 1 ) AND ');
   qryAux.Sql.Add('  ( EMPRESAFORN.FLGSTATUS = ''A'') AND ');
   qryAux.Sql.Add('  ( PESSOA.NUMDOCUMENTO = ''' + dbedDocumento.text +''')');
   if cds.State in [dsedit] then
      qryAux.Sql.Add(' AND ( PESSOA.IDPESSOA <> ' + Cds.FieldByName('IDPESSOA').AsString +')');

   qryAux.Open;
   if not qryAux.IsEmpty then
   begin
      if MsgDlg ('CNPJ já cadastrado. Para continuar será necessário INATIVAR o(s) cadastro(s) existente(s), deseja continuar assim mesmo?',
                 'Fornecedor', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
         bbtnCancelarClick(Self)
      else
      begin
         qryAux.First;
         while not qryAux.eof do
         begin
            try
               qryAlt.Close;
               qryAlt.SQL.Clear;
               qryAlt.Sql.Add('UPDATE EMPRESAFORN ');
               qryAlt.Sql.Add('SET FLGSTATUS = ''I'' ');
               qryAlt.Sql.Add('WHERE IDFORCLI =  ' + qryAux.FieldByName('IDPESSOA').AsString );

               qryAlt.ExecSQL;
            except
            end;
            qryAux.next ;
         end;
       end;
   end;
   FreeAndNil(qryAux);
   FreeAndNil(qryAlt);
  //WO9227 - Helen V Bianchi - Fim
end;

procedure TfrmCadForne.CdsBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  sCnpj      := cds.FieldByName('NUMDOCUMENTO').asString;//WO9227 - Helen V Bianchi
  sFlgStatus := cdsEmpresaForne.FieldByName('FLGSTATUS').asString;//WO9227 - Helen V Bianchi
end;

end.


