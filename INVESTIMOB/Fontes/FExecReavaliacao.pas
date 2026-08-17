{-------------------------------------------------------------------------------

      Executa a Reavaliação de Imóveis

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  23/01/2002
	Data de Término   :  29/01/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº WO.......: 19821
Data........: 09/04/2025
Responsável.: Leandro Pocebon
Descrição...: Alteração da tribuição da taxa de depreciação, ajuste na formula.
--------------------------------------------------------------------------------
Nº SIG......: 131862
Data........: 16/01/2023
Responsável.: Cássio Florencio Rovaroto
Descrição...: Correção na contabilização provisão de custos de imóveis.
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina.............: FormCreate, FormDestroy, ExecutaReavaliacao
//N. SIG.............: 113136
//Data da Alteração..: 04/07/2022
//Alteração Form.....: FExecReavaliacao
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Implementação da provisão de custos de imóveis.
//***************************************************************************************
//Rotina.............: VerificaPreenchimentoSelecao
//N. SIG.............: 97004
//Data da Alteração..: 30/01/2020
//Alteração Form.....: FExecReavaliacao
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Conforme solicitado, retirada a obrigatoriedade da vida útil para
                       processos sem utilização de arquivo.
//***************************************************************************************
//Rotina.............: CarregaImportacaoNova
//N. SIG.............: 46687
//Data da Alteração..: 26/02/2019
//Alteração Form.....: FExecReavaliacao
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Aplicação de melhoria na leitura do arquivo de reavaliação.
//***************************************************************************************
Rotina......:
Nº SOL......: 240108
Nº KINTANA..: 619627
Data........: 26/12/2014
Responsável.: Fernando Xavier
Descrição...: O sistema apresenta um erro quando fazemos o processo de reavaliação utilizando um 
              arquivo de importação.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 212226
Nº KINTANA..: 2037651
Data........: 08/04/2014
Responsável.: Helio Lima Custódio
Descrição...: Salva dados de vida útil na tabela histórico de vida útil.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8222
Nº KINTANA..: 1577546
Data........: 02/04/2012
Responsável.: Wylliam Leite da Silva
Descrição...: Bloqueio para data bloqueada na contabilidade
--------------------------------------------------------------------------------
Pendência   : SOL 129329 Kintana 745159
Responsável : Felipe de Oliveira
Data        : 12/07/2010
Descrição   : Modificar o código para que o mesmo aceite fazer reavaliações quando
              o avaliador é pessoa física ou jurídica
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24933
Responsável : Daniel Simões
Data        : 27/09/2007
Descrição   : Limitação do tamanho do campo da observação do evento para até
              2000 caracteres e 60 quando passar para as funções do CAF...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}


unit FExecReavaliacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, fcLabel, TEdNum, ExtCtrls, StdCtrls, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TREdit, Mask, wwdbedit, Wwdbspin, wwdbdatetimepicker,
  CMDateTimePicker, fcButton, fcImgBtn, fcShapeBtn, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, mImovelouMestre,
  DBTables, Db, Wwdatsrc, Wwquery, mFornecedor, DBCtrls, DBClient, Provider,
  JCLStrings, uCMClientDataSet,
  uCtrlBem, uCtrlDomBem, uCtrlMovBaixa, {uCtrlCafObra} uCtrlImobObra, uCtrlMovReavaliacao,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab,

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  uCtrlHistoricoVidaUtil,
  //Cássio Rovaroto - SIG nº 113136
  uCtrlProvisaoImovel, uCtrlImobCAFxContab, uCtrlParamCAF;

const bAjustaTaxaDep: Boolean = True;

type TImporta = Record
     iIdImovel : Integer;
     iIdAvalia : Integer;
     iIdConj   : Integer;
     sImovel   : String;
     sTipoImo  : String;
     iIdBem    : Array [0..2] of Integer;
     sBem      : Array [0..2] of String;
     iVidaBem  : Array [0..2] of Integer;
     fVlrBem   : Array [0..2] of Extended;
     sTipoBem  : Array [0..2] of String;
     iIdGrupo  : Array [0..2] of Integer;
     sAcao     : Array [0..2] of String;
end;

type
  TfrmExecReavaliacao = class(TfrmSairAjudaImob)
    Panel2: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    ntbPrincipal: TNotebook;
    Label7: TLabel;
    Bevel2: TBevel;
    btnContinua1: TfcShapeBtn;
    btnAtualizar: TfcShapeBtn;
    Bevel3: TBevel;
    btnVoltar2: TfcShapeBtn;
    Panel3: TPanel;
    btnContinua3: TfcShapeBtn;
    lblTitulo: TfcLabel;
    Label15: TLabel;
    Label1: TLabel;
    DBcboGrupo: TwwDBLookupCombo;
    Bevel1: TBevel;
    qryBem: TwwQuery;
    dsBem: TwwDataSource;
    updBem: TUpdateSQL;
    dbgBens: TwwDBGrid;
    Bevel4: TBevel;
    meObsEvento: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtVlrReavalia: TRealEdit;
    DBspnVida: TwwDBSpinEdit;
    Panel1: TPanel;
    dbgImovel: TwwDBGrid;
    Bevel5: TBevel;
    btnVoltar: TfcShapeBtn;
    btnContinua2: TfcShapeBtn;
    qryImovel: TwwQuery;
    dsImovel: TwwDataSource;
    updImovel: TUpdateSQL;
    edtDataReavalia: TCMDateTimePicker;
    qryBemIDIMOVEL: TFloatField;
    qryBemIDBEM: TFloatField;
    qryBemDESBEM: TStringField;
    qryBemPERCENTUAL: TFloatField;
    qryBemVIDAUTIL: TFloatField;
    qryImovelIDIMOVEL: TFloatField;
    qryImovelIMOVEL_EXTENSO: TStringField;
    qryImovelPERCENTUAL: TFloatField;
    qryImovelVLR_REAVALIA: TFloatField;
    qryImovelVIDAUTIL: TFloatField;
    molFornecedor1: TmolFornecedor;
    Panel4: TPanel;
    dbgGrupos: TwwDBGrid;
    Bevel6: TBevel;
    btnVoltar3: TfcShapeBtn;
    btnConfirmar: TfcShapeBtn;
    qryBemIXBGRUPO: TStringField;
    qryGrupos: TwwQuery;
    dsGrupos: TwwDataSource;
    updGrupos: TUpdateSQL;
    qryGruposVLR_REAVALIA: TFloatField;
    qryGruposPERCENTUAL: TFloatField;
    qryGruposDESCGRUPO: TStringField;
    qryBemIDGRUPO: TFloatField;
    qryBemCODTIPIMOVEL: TStringField;
    Label5: TLabel;
    edtTotReavalia: TRealEdit;
    Label6: TLabel;
    edtTotImovel: TRealEdit;
    fcShapeBtn4: TfcShapeBtn;
    fcShapeBtn1: TfcShapeBtn;
    qryImovelALT: TFloatField;
    qryBemALT: TFloatField;
    qryImovelVLR_CONTABIL: TFloatField;
    qryBemVLR_CONTABIL: TFloatField;
    Label8: TLabel;
    edtArqImporta: TEdit;
    btnBuscaArq: TBitBtn;
    dlgImporta: TOpenDialog;
    btnLimpaArq: TBitBtn;
    qryUpdImovel: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    cbRegistraImovel: TCheckBox;
    Label9: TLabel;
    qryBemVLR_REAVALIA: TFloatField;
    dspBem: TDataSetProvider;
    cdsBem: TClientDataSet;
    btnVoltar4: TfcShapeBtn;
    btnContinuar4: TfcShapeBtn;
    Bevel7: TBevel;
    Panel5: TPanel;
    memLog: TMemo;
    btnSalvar: TfcShapeBtn;
    dlgLogErro: TSaveDialog;
    cdsBemDESBEM: TStringField;
    cdsBemPERCENTUAL: TFloatField;
    cdsBemVIDAUTIL: TFloatField;
    cdsBemIDIMOVEL: TFloatField;
    cdsBemIDBEM: TFloatField;
    cdsBemIXBGRUPO: TStringField;
    cdsBemIDGRUPO: TFloatField;
    cdsBemCODTIPIMOVEL: TStringField;
    cdsBemALT: TFloatField;
    cdsBemVLR_CONTABIL: TFloatField;
    cdsBemVLR_REAVALIA: TFloatField;
    qryBemIMOVEL_EXTENSO: TStringField;
    cdsBemIMOVEL_EXTENSO: TStringField;
    rgLayout: TRadioGroup;
    dspImovel: TDataSetProvider;
    cdsImovel: TClientDataSet;
    cdsImovelIMOVEL_EXTENSO: TStringField;
    cdsImovelPERCENTUAL: TFloatField;
    cdsImovelVLR_REAVALIA: TFloatField;
    cdsImovelVIDAUTIL: TFloatField;
    cdsImovelIDIMOVEL: TFloatField;
    cdsImovelALT: TFloatField;
    cdsImovelVLR_CONTABIL: TFloatField;
    qryBemIDAVALIADOR: TFloatField;
    cdsBemIDAVALIADOR: TFloatField;
    qryBemACAO: TStringField;
    cdsBemACAO: TStringField;
    qryBemIDCONJUNTO: TFloatField;
    cdsBemIDCONJUNTO: TFloatField;
    cbReavCommit: TCheckBox;
    molImovelouMestre1: TmolImovelouMestre;
    rgMetodoReav: TRadioGroup;
    dsHistoricoVidaUtil: TwwDataSource;
    cdsHistoricoVidaUtil: TCMClientDataSet;
    cdsHistoricoVidaUtilVIDAUTIL: TFloatField;
    cdsHistoricoVidaUtilTXDEP_ANO: TFloatField;
    cdsHistoricoVidaUtilTXDEP_MES: TFloatField;
    cdsHistoricoVidaUtilVIGENTE: TStringField;
    cdsHistoricoVidaUtilTRGDTINCLUSAO: TDateTimeField;
    cdsHistoricoVidaUtilTRGUSERINCLUSAO: TStringField;
    cdsHistoricoVidaUtilHistVidaUtilIDIMOVEL: TFloatField;
    cdsHistoricoVidaUtilHIST_EVENTO: TStringField;

    procedure DBcboGrupoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnContinua1Click(Sender: TObject);
    procedure btnContinua2Click(Sender: TObject);
    procedure btnContinua3Click(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure dbgImovelCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgImovelTopRowChanged(Sender: TObject);
    procedure fcShapeBtn4Click(Sender: TObject);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure dbgImovelFieldChanged(Sender: TObject; Field: TField);
    procedure qryImovelALTChange(Sender: TField);
    procedure dbgBensFieldChanged(Sender: TObject; Field: TField);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnBuscaArqClick(Sender: TObject);
    procedure btnLimpaArqClick(Sender: TObject);
    procedure btnContinuar4Click(Sender: TObject);
    procedure btnVoltar4Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
    procedure dbgBensCellChanged(Sender: TObject);
    procedure dbgBensColEnter(Sender: TObject);
    procedure dbgBensKeyPress(Sender: TObject; var Key: Char);
    procedure qryBemALTChange(Sender: TField);
    procedure molFornecedor1btnBuscaFornClick(Sender: TObject);

  private { Private declarations }

    ArqImport : tstringlist;
    bImporta  : Boolean;
    //Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - INÍCIO
    //COMENTÁRIO: Variavel Criada para controle das funções que zeram os campos
    //da qryBem,  VRL_REAVALIA e PERCENTUAL.
    bCtrl     : Boolean;
    //Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - FIM
    ArqLog    : TextFile;
    CtrlBem            : TCtrlBem;
    CtrlDomBem         : TCtrlDomBem;
    //CtrlCafObra        : TCtrlCafObra;
    CtrlCafObra        : TCtrlImobObra;
    CtrlMovBaixa       : TCtrlMovBaixa;
    CtrlMovReavaliacao : TCtrlMovReavaliacao;
    CtrlContab  : TCtrlContab;// Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
    CtrlHistoricoVidaUtil : TCtrlHistoricoVidaUtil; //Helio - SOL Nº 212226 KINTANA Nº 2037651
    CtrlProvisaoImovel : TCtrlProvisaoImovel; //Cássio Rovaroto - SIG nº 113136
    CtrlCafxContab     : TCtrlImobCAFxContab; //Cássio Rovaroto - SIG nº 113136
    ParamCAF           : TCtrlParamCAF;

    cdsImovelxBem: TCMClientDataSet;
    cdsTipoImovel: TCMClientDataSet;
    cdsObraReav: TCMClientDataSet;
    cdsFornecedor: TCMClientDataSet;
    cdsProvisaoImovel: TCMClientDataSet;

    procedure HabilitaBotoes;
    procedure DesabilitaBotoes;
    procedure AbreQueries;
    procedure AbreQueryBens;
    procedure BloqueiaGrid(const sTipo:String; const bReadOnly: Boolean);
    function  AbreQueryGrupos : Boolean;
    function  AbreQueryImoveis : Boolean;
    function  VerificaPreenchimentoSelecao(const bImporta:Boolean): Boolean;
    function  TotalizaImoveis: Boolean;
    function  TotalizaBens: Boolean;
    function  ExecutaReavaliacao: Boolean;
    function  ExecutaReavaliaObra(const iIdImovel, iIdGrupo:Integer; const fVlrReavalia:Extended; const dDataReavalia:TDateTime) : Boolean;
    function  RegistraEventoImovel: Boolean;
    function  RegistraEventoImovel2(const iIdImovel:Integer): Boolean;
    function  CarregaImportacao: Boolean;
    function  CarregaImportacaoNova: Boolean;
    function  LeValor(const iPos,iTam,iLin: Integer) : String;
    function  LeValorSepara(const iCampo,iLin: Integer) : String;
    function  ConverteValor(const sValor, sCaracDec: string; nDecimal: integer): Extended;
    function  VerificaDetalheImport(const iSeq,iIdBem : Integer) : Boolean;
    function  VerificaDetalheImportNova(var Importa : TImporta) : Boolean;
    function  CarregaDetalhe(const iIdBem,iVida:Integer; const fValor:Extended) : Boolean;
    function  CarregaDetalheNova(const Importa:TImporta) : Boolean;
    function  ValidaImoveisImportados : Boolean;
    function  GravaLogErro(const iSeq,iIdImovel,iIdBem,iErro : Integer; const sCodImovel:String = ''; const sNomeImovel:String = '') : Boolean;
    function  AjustaTaxaDep : Boolean;
    function  VerificaImoveisNaoReavaliados : Boolean;
    function  SaldoObra(const iIdImovel, iIdGrupo:Integer; const dData:TDateTime): Extended;

    function  VerificaDetalheImport2018(var Importa : TImporta) : Boolean;

  public { Public declarations }

  end;



var
  frmExecReavaliacao: TfrmExecReavaliacao;



implementation

uses dLookImobiliario, uSistema, UFuncoesImob, uCAF, uMensErro,
     uComunsImobiliario, DCAF, dBaseDados, uDataBase, UEventoImovel,
     UModuloInvestImob, dImobiliario, fProgresso, uModuloImobiliario, uVerificaPreenchimento;

{$R *.DFM}


procedure TfrmExecReavaliacao.FormCreate(Sender: TObject);
begin
  inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlBem            := TCtrlBem.Create;
   CtrlDomBem         := TCtrlDomBem.Create;
   //CtrlCafObra        := TCtrlCafObra.Create;
   CtrlCafObra        := TCtrlImobObra.Create;
   CtrlMovBaixa       := TCtrlMovBaixa.Create;
   CtrlMovReavaliacao := TCtrlMovReavaliacao.Create;
   CtrlBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

   CtrlDomBem.InitializeAs( CtrlBem );
   CtrlMovBaixa.InitializeAs( CtrlBem );
   CtrlCafObra.InitializeAs( CtrlBem );
   CtrlMovReavaliacao.InitializeAs( CtrlBem );
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlDomBem);
   
   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   CtrlHistoricoVidaUtil := TCtrlHistoricoVidaUtil.Create;
   CtrlHistoricoVidaUtil.InitializeAs(CtrlDomBem);
   CtrlHistoricoVidaUtil.CdsHistoricoVidaUtil := cdsHistoricoVidaUtil;
   CtrlMovReavaliacao.cdsHistoricoVidaUtil := cdsHistoricoVidaUtil;
   cdsHistoricoVidaUtil.CreateDataSet;
   //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

   cdsImovelxBem := TCMClientDataSet.Create(nil);
   cdsTipoImovel := TCMClientDataSet.Create(nil);
   cdsObraReav := TCMClientDataSet.Create(nil);
   cdsFornecedor := TCMClientDataSet.Create(nil);

   //Cássio Rovaroto - SIG nº 113136 - Início
   CtrlProvisaoImovel := TCtrlProvisaoImovel.Create;
   CtrlProvisaoImovel.InitializeAs(CtrlBem);
   CtrlCafxContab := TCtrlImobCAFxContab.Create;
   CtrlCafxContab.InitializeAs(CtrlBem);
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(CtrlBem);
   cdsProvisaoImovel := TCMClientDataSet.Create(nil);
   //Cássio Rovaroto - SIG nº 113136 - Fim

end;

procedure TfrmExecReavaliacao.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlBem );
  FreeAndNil( CtrlDomBem );
  FreeAndNil( CtrlMovBaixa );
  FreeAndNil( CtrlCafObra );
  FreeAndNil( CtrlMovReavaliacao );
  FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  FreeAndNil( CtrlHistoricoVidaUtil ); //Helio - SOL Nº 212226 KINTANA Nº 2037651
  FreeAndNil(CtrlProvisaoImovel);//Cássio Rovaroto - SIG nº 113136
  FreeAndNil(CtrlCafxContab); //Cássio Rovaroto - SIG nº 113136
  FreeAndNil(ParamCAF);//Cássio Rovaroto - SIG nº 113136

  FreeAndNil(cdsImovelxBem);
  FreeAndNil(cdsTipoImovel);
  FreeAndNil(cdsObraReav);
  FreeAndNil(cdsFornecedor);
  FreeAndNil(cdsProvisaoImovel);//Cássio Rovaroto - SIG nº 113136

  
  inherited;
end;


procedure TfrmExecReavaliacao.DBcboGrupoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   // se for preenchido um grupo, limpa a seleção de Imóvel e arquivo de importacao
   if DBcboGrupo.LookupValue <> '' then begin
      molImovelouMestre1.btnLimpaImovel.Click;
      edtArqImporta.Clear;
   end;
end;


procedure TfrmExecReavaliacao.btnBuscaArqClick(Sender: TObject);
begin
   inherited;
   // se for preenchido um arquivo, limpa a seleção de Imóvel e grupo
   dlgImporta.Execute;
   edtArqImporta.Text := dlgImporta.FileName;
   if edtArqImporta.Text <> '' then begin
      molImovelouMestre1.btnLimpaImovel.Click;
      dbcboGrupo.LookupValue := '';
   end;
end;


procedure TfrmExecReavaliacao.FormShow(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
   AbreQueries;
end;

procedure TfrmExecReavaliacao.AbreQueries;
begin
   // Abre Grupo Rateio
   LimpaParametros(dtmLookImobiliario.qryLookGrupoRateio);
   dtmLookImobiliario.qryLookGrupoRateio.ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
   dtmLookImobiliario.qryLookGrupoRateio.Open;

   // Define valores Defaults
   edtDataReavalia.Date := Date();
   molImovelouMestre1.edtImovel.Clear;
   molImovelouMestre1.lblImovelouMestre.Caption := '';
   edtArqImporta.Text := '';
end;

procedure TfrmExecReavaliacao.btnContinua1Click(Sender: TObject);
var bResult : Boolean;
begin
   inherited;
   bResult := True;

   if edtArqImporta.Text <> '' then
        bImporta := True
   else bImporta := False;

   // Valida o preenchimento da seleção e monta query com os imoveis
   if VerificaPreenchimentoSelecao(bImporta) then begin

      if bImporta then begin
         ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
         btnContinuar4.Enabled  := False;
         if rgLayout.ItemIndex = 0 then
              bResult := CarregaImportacaoNova
         else bResult := CarregaImportacao;

         if MsgDlg('Verifica imóveis ausentes no arquivo de importação?','Confirmação',mtconfirmation,[mbYes, mbNo],0) = mrYes then begin
            VerificaImoveisNaoReavaliados;
         end;

         if bResult then
              btnContinuar4.Enabled := True
         else MsgDlg('Ocorreram Erros na Importação do Arquivo. Verifique o Arquivo de Log.','Aviso',mtwarning,[mbok],0);
      end else begin
         if AbreQueryImoveis then begin
            edtTotReavalia.Value   := edtVlrReavalia.Value;
            ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 2;
            dbgImovel.SetFocus;
         end;
      end;

   end;


end;


function TfrmExecReavaliacao.VerificaPreenchimentoSelecao(const bImporta:Boolean): Boolean;
begin
   Result := False;
   try
      if (dbcboGrupo.LookupValue = '') and (molImovelouMestre1.edtImovel.Text = '') and (edtArqImporta.Text = '') then
         raise EValidacao.CreateVal('É necessário indicar um Grupo, ou Imóvel, ou Mestre, ou Arquivo para Importação!',molImovelouMestre1.btnBuscaImovel);

      if edtDataReavalia.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Reavaliação!', edtDataReavalia);

      if edtVlrReavalia.Value = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Valor da Reavaliação!', edtVlrReavalia);

      //if (not bImporta) and (DBspnVida.Value < 1) then //TAES - SIG97004
      //   raise EValidacao.CreateVal('É necessário indicar a Vida Útil da Reavaliação!', DBspnVida); //TAES - SIG97004

      if (not bImporta) and (molFornecedor1.iFornecedor = -1) then
         raise EValidacao.CreateVal('É necessário indicar a Avaliador!', molFornecedor1.btnBuscaForn);

      if meObsEvento.Text = '' then
         raise EValidacao.CreateVal('É necessário informar o Evento do Laudo de Reavaliação!', meObsEvento);

      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataReavalia.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataReavalia);
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;


function TfrmExecReavaliacao.AbreQueryImoveis : Boolean;
var iSaldoTot : Extended;
begin
   Result := True;
   // Abre Query de Imóveis conforme parametros selecionados
   cdsImovel.Close;
   LimpaParametros(qryImovel);
   qryImovel.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   if DBcboGrupo.LookupValue <> '' then begin
      qryImovel.ParamByName('PIDGRUPORATEIO').AsInteger := StrToInt(DBcboGrupo.LookupValue);
   end else begin
      if molImovelouMestre1.iMestre = -1 then
           qryImovel.ParamByName('PIDIMOVELMESTRE').AsInteger := molImovelouMestre1.iImovel
      else qryImovel.ParamByName('PIDIMOVEL').AsInteger := molImovelouMestre1.iImovel;
   end;
   qryImovel.Open;
   cdsImovel.Open;

   BloqueiaGrid('I',False);

   // Verifica o valor total de Saldo Contábil para calcular o Rateio
   iSaldoTot := 0;
   with cdsImovel do begin
      DisableControls;
      First;
      while not eof do begin
         Edit;
         cdsImovel.FieldByName('VLR_CONTABIL').AsFloat := CAF.SaldoContabilImovel(cdsImovel.FieldByName('IDIMOVEL').AsInteger, -1,
                                                                  edtDataReavalia.Date);
         Post;
         iSaldoTot := iSaldoTot + cdsImovel.FieldByName('VLR_CONTABIL').AsFloat;
         Next;
      end;

      if iSaldoTot = 0 then begin
         MsgDlg('Não existe saldo contábil dos imóveis selecionados na data informada','Aviso',mtwarning,[mbok],0);
         EnableControls;
         Result := False;
         Exit;
      end;

      // Calcula o percentual de Rateio default
      First;
      while not eof do begin
         Edit;
         cdsImovel.FieldByName('PERCENTUAL').AsFloat   := (cdsImovel.FieldByName('VLR_CONTABIL').AsFloat * 100) / iSaldoTot;
         cdsImovel.FieldByName('VLR_REAVALIA').AsFloat := (edtVlrReavalia.Value * cdsImovel.FieldByName('PERCENTUAL').AsFloat) / 100;
         cdsImovel.FieldByName('VIDAUTIL').AsFloat     := DBspnVida.Value;
         Post;
         Next;
      end;
      First;
      EnableControls;
   end;
end;

procedure TfrmExecReavaliacao.btnContinuar4Click(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
   edtTotReavalia.Value   := edtVlrReavalia.Value;
   TotalizaImoveis;
end;

procedure TfrmExecReavaliacao.btnVoltar4Click(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TfrmExecReavaliacao.btnVoltarClick(Sender: TObject);
begin
   inherited;
   if bImporta then
        ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1
   else ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 2;
end;

procedure TfrmExecReavaliacao.btnSalvarClick(Sender: TObject);
begin
   inherited;
   // se for preenchido um arquivo, limpa a seleção de Imóvel e grupo
   dlgLogErro.Execute;
   if dlgLogErro.FileName <> '' then begin
      memLog.Lines.SaveToFile(dlgLogErro.FileName);
   end;
end;

procedure TfrmExecReavaliacao.btnContinua2Click(Sender: TObject);
begin
   inherited;
   // Valida o total dos imoveis com o valor de reavaliação e abre a query com os bens
   if bImporta then begin
      ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
      TotalizaBens;
   end else begin
      if TotalizaImoveis then begin
         AbreQueryBens;
         ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
         dbgBens.SetFocus;
      end;
   end;
end;


function TfrmExecReavaliacao.TotalizaImoveis: Boolean;
var fTotImovel, fMaior, fDif, fTotPercent: Extended;
begin
   cdsImovel.DisableControls;
   fTotImovel  := 0;
   fTotPercent := 0;
   fMaior      := 0;

   BloqueiaGrid('I',False);

   cdsImovel.First;
   while not cdsImovel.Eof do begin
      // Calcula o valor de reavaliação pelo percentual informado
      if cdsImovel.FieldByName('PERCENTUAL').AsFloat <> 0 then begin
         cdsImovel.Edit;
         cdsImovel.FieldByName('VLR_REAVALIA').AsFloat := Arredonda(edtTotReavalia.Value * (cdsImovel.FieldByName('PERCENTUAL').AsFloat / 100),2);
         cdsImovel.Post;
      end;

      // Calcula o percentual pelo valor de reavaliação informado
      if cdsImovel.FieldByName('VLR_REAVALIA').AsFloat > 0 then begin
         if fMaior < cdsImovel.FieldByName('VLR_REAVALIA').AsFloat then fMaior := cdsImovel.FieldByName('VLR_REAVALIA').AsFloat;

         cdsImovel.Edit;
         cdsImovel.FieldByName('PERCENTUAL').AsFloat := cdsImovel.FieldByName('VLR_REAVALIA').AsFloat / edtTotReavalia.Value * 100;
         cdsImovel.Post;

         fTotImovel  := fTotImovel  + cdsImovel.FieldByName('VLR_REAVALIA').AsFloat;
         fTotPercent := fTotPercent + cdsImovel.FieldByName('PERCENTUAL').AsFloat;
      end;
      cdsImovel.Next;
   end;

   // apurar o valor da diferença do rateio
   edtTotImovel.Value := fTotImovel;
   fDif := edtTotReavalia.Value - edtTotImovel.Value;

   // acertar a diferença no maior grupo, tolerando uma dif. de no max R$ 2,00
   cdsImovel.First;
   if (fDif >= -2) and (fDif <= 2) then begin
      while (fDif <> 0) do begin
         if cdsImovel.FieldByName('VLR_REAVALIA').AsFloat = fMaior then begin
            cdsImovel.Edit;
            cdsImovel.FieldByName('VLR_REAVALIA').AsFloat := cdsImovel.FieldByName('VLR_REAVALIA').AsFloat + fDif;

            // Ajusta o Percentual
            if fTotPercent <> 100 then
               cdsImovel.FieldByName('PERCENTUAL').AsFloat := cdsImovel.FieldByName('PERCENTUAL').AsFloat + (100 - fTotPercent);

            cdsImovel.Post;
            fDif := 0;
            fTotPercent := 100;
         end;
         cdsImovel.Next
      end;
   end else begin
      MsgDlg(FormatFloat ('Verificar valores lançados, apurada diferença de: #,##0.00', fDif),'Aviso',mtwarning,[mbok],0);
   end;

   // calcular o total novamente para ver se esta certo - BACA
   fTotImovel := 0;
   cdsImovel.First;
   while not cdsImovel.Eof do begin
      fTotImovel := fTotImovel + cdsImovel.FieldByName('VLR_REAVALIA').AsFloat;
      cdsImovel.Next;
   end;

   edtTotImovel.Value := fTotImovel;
   if edtTotReavalia.Value <> edtTotImovel.Value then
        result := False
   else result := True;

   BloqueiaGrid('I',True);

   dbgImovel.SetFocus;
   cdsImovel.EnableControls;
end;


procedure TfrmExecReavaliacao.AbreQueryBens;
var fSldCtbImob: Extended;
begin
   // Abre Query de Bens conforme parametros selecionados
   cdsBem.Close;
   LimpaParametros(qryBem);
   qryBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   if DBcboGrupo.LookupValue <> '' then begin
      qryBem.ParamByName('PIDGRUPORATEIO').AsInteger := StrToInt(DBcboGrupo.LookupValue);
   end else begin
      if molImovelouMestre1.iMestre = -1 then
           qryBem.ParamByName('PIDIMOVELMESTRE').AsInteger := molImovelouMestre1.iImovel
      else qryBem.ParamByName('PIDIMOVEL').AsInteger := molImovelouMestre1.iImovel;
   end;
   qryBem.Open;
   cdsBem.Open;

   BloqueiaGrid('B',False);

   // Busca o Saldo Contabil de Cada bem, e
   // Calcula o Percentual em relação ao valor de reavaliação do imovel
   qryImovel.DisableControls;
   cdsBem.DisableControls;
   cdsBem.First;
   cdsImovel.First;
   while not cdsImovel.Eof do begin
      while (cdsImovel.FieldByName('IDIMOVEL').AsInteger = cdsBem.FieldByName('IDIMOVEL').AsInteger) and (not cdsBem.Eof) do begin
         cdsBem.Edit;
         cdsBem.FieldByName('VLR_CONTABIL').AsFloat := CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                                             cdsBem.FieldByName('IDBEM').AsInteger,
                                                             edtDataReavalia.Date,
                                                             ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                             ModuloImobiliario.InvestImob.iIdPaisCAF);

         if cdsImovel.FieldByName('VLR_CONTABIL').AsFloat > 0 then begin
            cdsBem.FieldByName('PERCENTUAL').AsFloat := (cdsBem.FieldByName('VLR_CONTABIL').AsFloat * 100) /
                                        (cdsImovel.FieldByName('VLR_CONTABIL').AsFloat);
         end else begin
            cdsBem.FieldByName('PERCENTUAL').AsFloat := 0;
         end;
         cdsBem.FieldByName('VLR_REAVALIA').AsFloat := (cdsImovel.FieldByName('VLR_REAVALIA').AsFloat * cdsBem.FieldByName('PERCENTUAL').AsFloat) / 100;
         if cdsBem.FieldByName('IXBGRUPO').AsString = 'T' then
              cdsBem.FieldByName('VIDAUTIL').AsFloat := 0
         else cdsBem.FieldByName('VIDAUTIL').AsFloat := cdsImovel.FieldByName('VIDAUTIL').AsInteger;
         cdsBem.Post;
         cdsBem.Next;
      end;
      cdsImovel.Next;
   end;
   cdsBem.First;
   cdsImovel.First;
   cdsImovel.EnableControls;
   cdsBem.EnableControls;
end;


procedure TfrmExecReavaliacao.btnContinua3Click(Sender: TObject);
begin
   inherited;
   // Valida o total de reavaliação dos bens e abre a query de grupos
   if TotalizaBens then begin
      if AbreQueryGrupos then begin
         ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
         dbgGrupos.SetFocus;
      end;   
   end;
end;


function TfrmExecReavaliacao.AbreQueryGrupos: Boolean;
var GrupoBem : rGrupoBem;
begin
   Result := True;
   qryGrupos.Close;
   qryGrupos.Open;

   // Totaliza os Grupos contábeis a partir da reavaliação em cdsBem
   try
      try
         cdsBem.DisableControls;
         cdsBem.First;
         while not cdsBem.Eof do begin
            GrupoBem := CAF.GrupoImobiliario(cdsBem.FieldByName('IDGRUPO').AsInteger, cdsBem.FieldByName('CODTIPIMOVEL').AsString);
            if not GrupoBem.bResult then
               raise Exception.create(GrupoBem.sErro + #13+ 'Bem - ' + cdsBem.FieldByName('DESBEM').AsString);

            if not qryGrupos.Locate('DESCGRUPO',GrupoBem.sDescricao,[]) then begin
               qryGrupos.Insert;
               qryGrupos.FieldByName('DESCGRUPO').AsString   := GrupoBem.sDescricao;
               qryGrupos.FieldByName('VLR_REAVALIA').AsFloat := cdsBem.FieldByName('VLR_REAVALIA').AsFloat;
            end else begin
               qryGrupos.Edit;
               qryGrupos.FieldByName('VLR_REAVALIA').AsFloat := qryGrupos.FieldByName('VLR_REAVALIA').AsFloat + cdsBem.FieldByName('VLR_REAVALIA').AsFloat;
            end;
            qryGrupos.Post;
            cdsBem.Next;
         end;
         cdsBem.First;
         qryGrupos.First;

         // Calcula Percentual dos Grupos
         while not qryGrupos.Eof do begin
            qryGrupos.Edit;
            qryGrupos.FieldByName('PERCENTUAL').AsFloat := (qryGrupos.FieldByName('VLR_REAVALIA').AsFloat * 100) / edtVlrReavalia.Value;
            qryGrupos.Post;
            qryGrupos.Next;
         end;
         qryGrupos.First;
      except
         on E: Exception do begin
            MsgDlg(E.Message, 'Erro', mtError, [mbOk], 0);
            Result := False;
         end;
      end;
   finally
      cdsBem.EnableControls;
   end;
end;


procedure TfrmExecReavaliacao.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;
   case ntbPrincipal.PageIndex of
      0 : lblTitulo.Caption := 'Reavaliação de Imóveis [ Seleção ]';
      1 : lblTitulo.Caption := 'Reavaliação de Imóveis [ Importação ]';
      2 : lblTitulo.Caption := 'Reavaliação de Imóveis [ Imóveis ]';
      3 : lblTitulo.Caption := 'Reavaliação de Imóveis [ Bens ]';
      4 : lblTitulo.Caption := 'Reavaliação de Imóveis [ Confirmação ]';
   end;
end;

procedure TfrmExecReavaliacao.dbgImovelCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmExecReavaliacao.dbgImovelTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecReavaliacao.fcShapeBtn4Click(Sender: TObject);
begin
   inherited;
   TotalizaImoveis;
end;

function TfrmExecReavaliacao.TotalizaBens: Boolean;
var fTotBem, fMaior, fDif, fTotPercent: Extended;
    bmRegIni, bmRegFim : TBookMark;
begin
   cdsBem.DisableControls;

   BloqueiaGrid('B',False);

   cdsImovel.First;
   cdsBem.First;
   while not cdsImovel.Eof do begin
      fTotBem     := 0;
      fTotPercent := 0;
      fMaior      := 0;
      fDif        := 0;

      // Marca o registro inicial do bem relativo ao imóvel a ser checado
      // será utilizado para posicionar a qry nas verificações seguintes
      bmRegIni    := cdsBem.GetBookmark;

      // Valida o total dos bens pelo valor de reavaliação do Imóvel
      while (cdsImovel.FieldByName('IDIMOVEL').AsInteger = cdsBem.FieldByName('IDIMOVEL').AsInteger) and (not cdsBem.Eof) do begin
         // Calcula o valor de reavaliação pelo percentual informado
         if cdsBem.FieldByName('PERCENTUAL').AsFloat <> 0 then begin
            cdsBem.Edit;
            cdsBem.FieldByName('VLR_REAVALIA').AsFloat := Arredonda(cdsImovel.FieldByName('VLR_REAVALIA').AsFloat * (cdsBem.FieldByName('PERCENTUAL').AsFloat / 100),2);
            cdsBem.Post;
         end;

         // Calcula o percentual pelo valor de reavaliação informado
         if cdsBem.FieldByName('VLR_REAVALIA').AsFloat > 0 then begin
            if fMaior < cdsBem.FieldByName('VLR_REAVALIA').AsFloat then fMaior := cdsBem.FieldByName('VLR_REAVALIA').AsFloat;
            cdsBem.Edit;
            cdsBem.FieldByName('PERCENTUAL').AsFloat := cdsBem.FieldByName('VLR_REAVALIA').AsFloat / cdsImovel.FieldByName('VLR_REAVALIA').AsFloat * 100;
            cdsBem.Post;
            fTotBem     := fTotBem     + cdsBem.FieldByName('VLR_REAVALIA').AsFloat;
            fTotPercent := fTotPercent + cdsBem.FieldByName('PERCENTUAL').AsFloat;
         end;
         cdsBem.Next;
      end;
      bmRegFim := cdsBem.GetBookmark;

      // apurar o valor da diferença do rateio
      fDif := Arredonda((cdsImovel.FieldByName('VLR_REAVALIA').AsFloat - fTotBem),4);

      // acertar a diferença no maior grupo, tolerando uma dif. de no max R$ 2,00
      cdsBem.GotoBookmark(bmRegIni);
      if (fDif >= -2) and (fDif <= 2) then begin
         while (fDif <> 0) do begin
            if cdsBem.FieldByName('VLR_REAVALIA').AsFloat = fMaior then begin
               cdsBem.Edit;
               cdsBem.FieldByName('VLR_REAVALIA').AsFloat := cdsBem.FieldByName('VLR_REAVALIA').AsFloat + fDif;

               // Ajusta o Percentual
               if fTotPercent <> 100 then
                  cdsBem.FieldByName('PERCENTUAL').AsFloat := cdsBem.FieldByName('PERCENTUAL').AsFloat + (100 - fTotPercent);

               cdsBem.Post;
               fDif := 0;
               fTotPercent := 100;
            end;
            cdsBem.Next
         end;
      end else begin
         MsgDlg('Verificar valores lançados, apurada diferença de: ' + FormatFloat('#,###.00', fDif) +
                ' entre os bens do Imóvel ' + cdsImovel.FieldByName('IMOVEL_EXTENSO').AsString, 'Erro', mterror,[mbok],0);

        //Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - INÍCIO

        //OBS: Caso seja apurada uma diferença entre os valores lançados, zera o campo
        //PERCENTUAL e o campo VLR_REAVALTA.
        cdsBem.First;
        while not cdsbem.eof do
         begin
           cdsBem.Edit;
           cdsBemVLR_REAVALIA.AsFloat := 0;
           cdsBemPERCENTUAL.AsFloat := 0;
           cdsBem.Post;

           cdsbem.Next;
         end;
        //Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - FIM

         Result := False;
         dbgBens.SetFocus;
         cdsBem.EnableControls;
         Abort;
      end;

      // calcular o total novamente
      fTotBem := 0;
      cdsBem.GotoBookmark(bmRegIni);
      while (cdsImovel.FieldByName('IDIMOVEL').AsInteger = cdsBem.FieldByName('IDIMOVEL').AsInteger) and (not cdsBem.Eof) do begin
         fTotBem := fTotBem + cdsBem.FieldByName('VLR_REAVALIA').AsFloat;

         // Verifica Vida Util de Terrenos
         if (cdsBem.FieldByName('IXBGRUPO').AsSTring = 'T') and (cdsBem.FieldByName('VIDAUTIL').AsInteger <> 0) then begin
            MsgDlg('A Vida Útil de Terreno deve ser de 0 meses. Imóvel: ' + cdsImovel.FieldByName('IMOVEL_EXTENSO').AsString, 'Aviso', mtwarning,[mbok],0);
            Result := False;
            dbgBens.SetFocus;
            cdsBem.EnableControls;
            Abort;
         end;
         cdsBem.Next;
      end;

      // Confere o total Lançado com o valor total do imóvel
      if Arredonda(cdsImovel.FieldByName('VLR_REAVALIA').AsFloat,2) <> Arredonda(fTotBem,2) then begin
         Result := False;
         cdsBem.EnableControls;
         Exit;
      end else begin
         Result := True;
      end;

      cdsImovel.Next;
      cdsBem.GotoBookmark(bmRegFim);
      cdsBem.FreeBookmark(bmRegIni);
      cdsBem.FreeBookmark(bmRegFim);
   end;
   cdsImovel.First;
   cdsBem.First;

   BloqueiaGrid('B',True);

   cdsBem.EnableControls;
   dbgBens.SetFocus;
end;

procedure TfrmExecReavaliacao.fcShapeBtn1Click(Sender: TObject);
begin
   inherited;
   TotalizaBens;
end;

procedure TfrmExecReavaliacao.dbgImovelFieldChanged(Sender: TObject;
  Field: TField);
begin
   inherited;
   // marca em ALT o que foi alterado para zerar o valor ou percentual correspondente
   try
      if not bImporta then begin
         if Field = cdsImovelPERCENTUAL   then cdsImovelALT.AsInteger := 1;
         if Field = cdsImovelVLR_REAVALIA then cdsImovelALT.AsInteger := 2;
      end;
   except

   end;
end;

procedure TfrmExecReavaliacao.qryImovelALTChange(Sender: TField);
begin
   inherited;
   // Zera o percentual ou valor correspondente ao que foi alterado
   if not bImporta then begin
      case cdsImovelALT.AsInteger of
         1 : cdsImovelVLR_REAVALIA.AsFloat := 0;
         2 : cdsImovelPERCENTUAL.AsFloat   := 0;
      end;
   end;
end;

procedure TfrmExecReavaliacao.dbgBensFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
//Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - INÍCIO
  if not bImporta and not bCtrl then
    begin
      if Field = cdsBemPERCENTUAL then
        begin
          bCtrl := true;
          cdsBemVLR_REAVALIA.AsFloat := 0;
        end;
    end;

  if not bImporta and not bCtrl then
    begin
      if Field = cdsBemVLR_REAVALIA then
        begin
          bCtrl := true;
          cdsBemPERCENTUAL.AsFloat   := 0;
        end;
    end;

//marca em ALT o que foi alterado para zerar o valor ou percentual correspondente
//   try
//      if not bImporta then begin
//         if Field = cdsBemPERCENTUAL   then cdsBemALT.AsInteger := 1;
//         if Field = cdsBemVLR_REAVALIA then cdsBemALT.AsInteger := 2;
//      end;
//   except
//   end;

//Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - FIM

end;

procedure TfrmExecReavaliacao.btnConfirmarClick(Sender: TObject);
var bResult : Boolean;
begin
   inherited;
   bResult := True;
   cdsImovel.DisableControls;
   cdsBem.DisableControls;
   DesabilitaBotoes;

   // Executa a reavaliação a partir da tabela de Bens
   try
      if MsgDlg('Confirma a Reavaliação dos Bens Relacionados ?', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then begin
         try
            StartTransacao;
            bResult := ExecutaReavaliacao;
            if not cbReavCommit.Checked then begin
               if bResult then bResult := RegistraEventoImovel;
            end;
            if bResult then begin
               CommitTransacao;
               MsgDlg('Reavaliação Realizada com Sucesso !', 'Aviso', mtWarning, [mbOk], 0);
               ntbPrincipal.PageIndex := 0;
            end else begin
               RollBackTransacao;
               MsgDlg('Ocorreram ERROS durante a Reavaliação', 'Erro', mtError, [mbOk], 0);
            end;
         except
            RollBackTransacao;
            MsgDlg('Ocorreram ERROS durante a Reavaliação', 'Erro', mtError, [mbOk], 0);
         end;
      end;
   finally
      HabilitaBotoes;
      EscondeProgresso(ProgressBar, lblProgress, lblContador);
      cdsBem.EnableControls;
      cdsImovel.EnableControls;
   end;
end;


function TfrmExecReavaliacao.ExecutaReavaliacao: Boolean;
var fDifReaval, fDifReavalImob : Double;
    iIdReavalia, iIdImovel, iQuant, iAtual, iIdBem, iPlanilha: Integer;
    fTaxaDep : Extended;
    cdsBemReav, cdsTaxasDep, cdsPlanoPatroxBem, cdsImagem : TCMClientDataSet;
    fValResult, fValResultImob : Currency;
    sSql : String;
    bReavalia : Boolean;
begin
   Result := True;
   iAtual := 1;
   iQuant := cdsBem.RecordCount;
   MostraProgresso(ProgressBar, lblProgress, lblContador, iQuant, 'Processando as Reavaliações...');

   AssignFile(ArqLog, Sistema.TempDir + 'Reavaliacao.Log');
   Rewrite(ArqLog);
   writeLn(ArqLog, 'AJUSTES DE TAXA DE DEPRECIAÇÃO ');
   writeLn(ArqLog, ' ');

   try
      try
         // Instancia os cds necessários para a inclusão do bem
         cdsBemReav        := TCMClientDataSet.Create( nil );
         cdsTaxasDep       := TCMClientDataSet.Create( nil );
         cdsPlanoPatroxBem := TCMClientDataSet.Create( nil );
         cdsImagem         := TCMClientDataSet.Create( nil );

         // Associa os cds locais aos cds do Ctrl
         CtrlDomBem.cds               := cdsBemReav;
         CtrlDomBem.cdsTaxasDep       := cdsTaxasDep;
         CtrlDomBem.cdsPlanoPatroxBem := cdsPlanoPatroxBem;
         CtrlDomBem.cdsImagem         := cdsImagem;

         CtrlDomBem.OpenTransaction         := False;
         CtrlBem.OpenTransaction            := False;
         CtrlCafObra.OpenTransaction        := False;
         CtrlMovBaixa.OpenTransaction       := False;
         CtrlMovReavaliacao.OpenTransaction := False;

         cdsImovel.First;
         cdsBem.First;

         while not cdsImovel.Eof do begin
           CtrlProvisaoImovel.InicializaContabProvisao; //Cássio Rovaroto -  SIG nº 131862

            // Verifica se o bem já foi reavaliado nesta data
            sSql := 'SELECT IDIMOVEL FROM IMOVEL ' +
                    ' WHERE IMODATAREAVAL = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',edtDataReavalia.Date)) + ',''DD/MM/YYYY'') ' +
                    '   AND IDIMOVEL = ' + cdsImovelIDIMOVEL.AsString;
            FazQuery( dtmImobiliario.qryAux, sSql );
            bReavalia := dtmImobiliario.qryAux.IsEmpty;

            while (cdsImovelIDIMOVEL.AsInteger = cdsBemIDIMOVEL.AsInteger) and (not cdsBem.Eof) do begin

               if bReavalia then begin
                  // Executa a Reavaliação do AtivoFixo para cada bem
                  if cdsBemACAO.AsString = 'R' then begin

                     CtrlMovReavaliacao.OpenTransaction := False;
                     if rgMetodoReav.ItemIndex = 1 then begin // VALIA usa o método II - novo
                        if CtrlMovReavaliacao.ExecutaReavaliacaoII( Sistema.IdModulo,
                                                                    Sistema.IdEmpresa,
                                                                    Sistema.IdUsuario,
                                                                    cdsBemIDBEM.AsInteger,
                                                                    edtDataReavalia.Date,
                                                                    cdsBemVLR_REAVALIA.AsFloat,
                                                                    cdsBemVIDAUTIL.AsInteger,
                                                                    Copy(meObsEvento.Text,1,60), // Daniel - 24933
                                                                    1 ) then begin
                           iIdReavalia := CtrlMovReavaliacao.IdReavaliacao;
                        end else begin
                           iIdReavalia := -1;
                           raise Exception.create( CtrlMovReavaliacao.MessageInfo );
                        end;
                     end else begin
                        if CtrlMovReavaliacao.ExecutaReavaliacao( Sistema.IdModulo,
                                                                  Sistema.IdEmpresa,
                                                                  Sistema.IdUsuario,
                                                                  cdsBemIDBEM.AsInteger,
                                                                  edtDataReavalia.Date,
                                                                  cdsBemVLR_REAVALIA.AsFloat,
                                                                  cdsBemVIDAUTIL.AsInteger,
                                                                  Copy(meObsEvento.Text,1,60), // Daniel - 24933
                                                                  1 ) then begin
                           iIdReavalia := CtrlMovReavaliacao.IdReavaliacao;
                        end else begin
                           iIdReavalia := -1;
                           raise Exception.create( CtrlMovReavaliacao.MessageInfo );
                        end;

                        // Ajusta a taxa de depreciação do custo conforme planilha informada
                        if bAjustaTaxaDep then begin
                          if not AjustaTaxaDep then raise Exception.create('Erro ao atualizar a TAXADEP');
                        end;
                     end;
                  end;

                  // Executa a inclusão do bem para os que não existiam anteriormente
                  if cdsBemACAO.AsString = 'I' then begin
                     // Verifica se o imóveis não está em construção (obra)
                     if cdsBemCODTIPIMOVEL.AsString <> ModuloImobiliario.InvestImob.sCodTipImovelObra then begin

                        // Calcula a Taxa de Depreciação
                        fTaxaDep := 0;
                        if cdsBemVIDAUTIL.AsInteger > 0 then begin
                           //fTaxaDep := 100 / (cdsBemVIDAUTIL.AsInteger / 12); //WO19821 Leandro Pocebon
                           fTaxaDep := 100 / cdsBemVIDAUTIL.AsInteger;   //WO19821 Leandro Pocebon
                           fTaxaDep := ComunsImobiliario.Arredonda(fTaxaDep, 6);
                        end;

                        // Abre a estrutura do cds vazia para insclusão do novo bem
                        cdsBemReav.Data        := CtrlDomBem.ListaBem(Sistema.IdEmpresa, -99);
                        cdsTaxasDep.Data       := CtrlDomBem.ListaBemxDep(Sistema.IdEmpresa, -99);
                        cdsPlanoPatroxBem.Data := CtrlDomBem.ListaPlanoPatroxBem(Sistema.IdEmpresa, -99);
                        cdsImagem.Data         := CtrlDomBem.CarregaImagem(-99);

                        // Preenche o Cds com os dados do bem a ser incluído
                        cdsBemReav.EmptyDataSet;
                        cdsBemReav.Insert;
                        cdsBemReav.FieldByName('IDPESSOA').AsInteger       := Sistema.IdEmpresa;
                        cdsBemReav.FieldByName('IDMODULO').AsInteger       := Sistema.IdModulo;
                        cdsBemReav.FieldByName('IDCONJUNTO').AsInteger     := cdsBemIDCONJUNTO.AsInteger;
                        cdsBemReav.FieldByName('IDGRUPO').AsInteger        := cdsBemIDGRUPO.AsInteger;
                        cdsBemReav.FieldByName('IDCLASSEBEM').AsInteger    := ModuloImobiliario.InvestImob.iIdClasseBem;
                        cdsBemReav.FieldByName('UNIDNEGOC').AsInteger      := ModuloImobiliario.InvestImob.iUnidNegoc;
                        cdsBemReav.FieldByName('DESBEM').AsString          := cdsBemDESBEM.AsString;
                        cdsBemReav.FieldByName('IDFORNSERV').AsInteger     := cdsBemIDAVALIADOR.AsInteger;
                        cdsBemReav.FieldByName('IDSITUACAO').AsInteger     := ModuloImobiliario.InvestImob.iidSituacao;

                        // Marchetti - Pendencia 20311 - 14/11/2005
                        cdsBemReav.FieldByName('VALHISTORICO').AsFloat     := 0;

                        cdsBemReav.FieldByName('REGISTRO').AsString        := 'I';
                        cdsBemReav.FieldByName('CONTROLE').AsString        := 'T';
                        cdsBemReav.FieldByName('BAIXATOTAL').AsString      := 'N';
                        // SOL 148729/3221  KTN 1055095  Felipe de Oliveira Silva
                        // deve se atulizar o campo propbaixa tbm, pois ele participa da geração de contrato
                        cdsBemReav.FieldByName('PROPBAIXA').AsString       := '0';                        
                        cdsBemReav.FieldByName('DTAINCLUSAO').AsDateTime   := edtDataReavalia.DateTime;
                        cdsBemReav.FieldByName('DTANOTA').AsDateTime       := edtDataReavalia.DateTime;
                        cdsBemReav.FieldByName('DATAINICIODEP').AsDateTime := edtDataReavalia.DateTime;
                        cdsBemReav.FieldByName('DTACONTAB').AsDateTime     := edtDataReavalia.DateTime;
                        cdsBemReav.Post;

                        // Preenche o Cds da TaxaDep
                        cdsTaxasDep.EmptyDataSet;
                        cdsTaxasDep.Insert;
                        cdsTaxasDep.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
                        cdsTaxasDep.FieldByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
                        cdsTaxasDep.FieldByName('IDBEMXDEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
                        cdsTaxasDep.FieldByName('TAXADEP').AsFloat     := fTaxaDep ;
                        cdsTaxasDep.Post;

                        CtrlDomBem.OpenTransaction := False;

                        if CtrlDomBem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa,
                                                         Sistema.IdUsuario, 'I',
                                                         0, 1 ) then begin
                           iIdBem := CtrlDomBem.IdBem;
                        end else begin
                           iIdBem := -1;
                           raise Exception.create(CtrlDomBem.MessageInfo);
                        end;

                        cdsBem.Edit;
                        cdsBemIDBEM.AsInteger := iIdBem;
                        cdsBem.Post;

                        if CtrlMovReavaliacao.ExecutaReavaliacaoII( Sistema.IdModulo,
                                                                    Sistema.IdEmpresa,
                                                                    Sistema.IdUsuario,
                                                                    cdsBemIDBEM.AsInteger,
                                                                    edtDataReavalia.Date,
                                                                    cdsBemVLR_REAVALIA.AsFloat,
                                                                    cdsBemVIDAUTIL.AsInteger,
                                                                    Copy(meObsEvento.Text,1,60), // Daniel - 24933
                                                                    1 ) then begin
                           iIdReavalia := CtrlMovReavaliacao.IdReavaliacao;
                        end else begin
                           iIdReavalia := -1;
                           raise Exception.create( CtrlMovReavaliacao.MessageInfo );
                        end;

                        // Fim Marchetti - Pendencia 20311 - 14/11/2005

                        // Inclui em ImovelxBem
                        LimpaParametros (dtmCAF.qryInsImovelxbem);
                        dtmCAF.qryInsImovelxbem.ParamByName('PIDIMOVEL').AsInteger := cdsBemIDIMOVEL.AsInteger;
                        dtmCAF.qryInsImovelxbem.ParamByName('PIDBEM').AsInteger    := iIdBem;
                        dtmCAF.qryInsImovelxbem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
                        dtmCAF.qryInsImovelxbem.ParamByName('PIXBGRUPO').AsString  := cdsBemIXBGRUPO.AsString;
                        dtmCAF.qryInsImovelxbem.ExecSQL;
                     end else begin
                        // Efetua o lançamento de reavaliação para a obra
                        if not ExecutaReavaliaObra( cdsBemIDIMOVEL.AsInteger,
                                                    cdsBemIDGRUPO.AsInteger,
                                                    cdsBemVLR_REAVALIA.AsFloat,
                                                    edtDataReavalia.Date ) then
                          raise Exception.create('Não foi possível reavaliar obra');
                     end;
                  end;

                  // Executa a baixa dos bens que não estão sendo reavaliados
                  if cdsBemACAO.AsString = 'E' then begin

                     // Verifica se o imóveis não está em construção (obra)
                     if cdsBemCODTIPIMOVEL.AsString <> ModuloImobiliario.InvestImob.sCodTipImovelObra then begin
                        // Desabilita a transação do CtrlObject
                        CtrlMovBaixa.OpenTransaction := False;


                        if CtrlMovReavaliacao.ExecutaReavaliacaoII( Sistema.IdModulo,
                                                                    Sistema.IdEmpresa,
                                                                    Sistema.IdUsuario,
                                                                    cdsBemIDBEM.AsInteger,
                                                                    edtDataReavalia.Date,
                                                                    0,
                                                                    cdsBemVIDAUTIL.AsInteger,
                                                                    Copy(meObsEvento.Text,1,60), // Daniel - 24933
                                                                    1 ) then begin
                           iIdReavalia := CtrlMovReavaliacao.IdReavaliacao;
                        end else begin
                           iIdReavalia := -1;
                           raise Exception.create( CtrlMovReavaliacao.MessageInfo );
                        end;
                        // Fim Marchetti - Pendencia 20311 - 14/11/2005

                     end else begin
                        // Efetua o lançamento de reavaliação para a obra
                        if not ExecutaReavaliaObra( cdsBemIDIMOVEL.AsInteger,
                                                    cdsBemIDGRUPO.AsInteger, 0,
                                                    edtDataReavalia.Date ) then
                          raise Exception.create('Não foi possível reavaliar obra');
                     end;
                  end;

                  // Marca o imóvel para registro do evento
                  iIdImovel := cdsBemIDIMOVEL.AsInteger;

                  // Marchetti - Pendencia 20311 - 14/11/2005
                  // Grava ReavaliaxReavalia
                  if not cdsBemIDBEM.IsNull then begin
                     try
                        LimpaParametros(dtmCAF.qryInsReavalia);
                        dtmCAF.qryInsReavalia.ParamByName('PIDPESSOA').AsInteger         := Sistema.idEmpresa;
                        dtmCAF.qryInsReavalia.ParamByName('PIDIMOVEL').AsInteger         := cdsBemIDIMOVEL.AsInteger;
                        dtmCAF.qryInsReavalia.ParamByName('PIDBEM').AsInteger            := cdsBemIDBEM.AsInteger;
                        dtmCAF.qryInsReavalia.ParamByName('PIDREAVALIACAO').AsInteger    := iIdReavalia;
                        dtmCAF.qryInsReavalia.ParamByName('PDATAREAVALIACAO').AsDateTime := edtDataReavalia.Date;
                        dtmCAF.qryInsReavalia.ParamByName('PVLRREAVALIA').AsFloat        := cdsBemVLR_REAVALIA.AsFloat;
                        dtmCAF.qryInsReavalia.ParamByName('PVIDAUTIL').AsInteger         := cdsBemVIDAUTIL.AsInteger;
                        if cdsBemIDAVALIADOR.AsInteger > 0 then
                           dtmCAF.qryInsReavalia.ParamByName('PIDAVALIADOR').AsInteger   := cdsBemIDAVALIADOR.AsInteger
                        else if molFornecedor1.iFornecedor > 0 then
                           dtmCAF.qryInsReavalia.ParamByName('PIDAVALIADOR').AsInteger   := molFornecedor1.iFornecedor;

                        dtmCAF.qryInsReavalia.ExecSQL;
                     except
                        raise Exception.create('Erro ao atualizar a tabela REAVALIAXREAVALIA');
                     end;
                  end;
                  // Fim Marchetti - Pendencia 20311 - 14/11/2005
                  //Cássio Rovaroto -  SIG  nº 113136 - Início
                  //-------------------------------------------------------------------------------
                  // Define o novo valor de provisão do custo de bem por imóvel
                  //-------------------------------------------------------------------------------
                  //Buscar se imóvel do bem possui provisão;
                  cdsProvisaoImovel.Data := CtrlProvisaoImovel.GetProvisaoBemImovel(cdsBem.FieldByName('IDBEM').AsInteger, edtDataReavalia.Date);

                  if not cdsProvisaoImovel.IsEmpty then
                  begin
                    if not CtrlProvisaoImovel.ExecutaProvisaoCusto(cdsBem.FieldByName('IDBEM').AsInteger,
                                                            Sistema.IdEmpresa,
                                                            Sistema.IdModulo,
                                                            ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                            cdsProvisaoImovel.FieldByName('IDPROVISAOIMOVEL').asInteger,
                                                            cdsProvisaoImovel.FieldByName('IDIMOVEL').asInteger,
                                                            cdsBem.FieldByName('IDGRUPO').asInteger,
                                                            cdsBem.FieldByName('IDCONJUNTO').asInteger,
                                                            ModuloImobiliario.InvestImob.iUnidNegoc,
                                                            0,
                                                            cdsProvisaoImovel.FieldByName('CODTIPIMOVEL').AsString,
                                                            '',
                                                            cdsBem.FieldByName('DESBEM').AsString,
                                                            '',
                                                            edtDataReavalia.Date,
                                                            cdsBemVLR_REAVALIA.AsFloat,
                                                            cdsProvisaoImovel.FieldByName('PERCENTUAL').AsFloat,
                                                            CtrlCafxContab.IntegraContab(Sistema.IdEmpresa, Sistema.IdModulo),
                                                            (ParamCAF.FLGCTADEPREC = 1)) then
                      raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
                  end;
                  //Cássio Rovaroto -  SIG  nº 113136 - Fim
               end;

               cdsBem.Next;

               iAtual := iAtual + 1;
               AndaProgresso(ProgressBar, lblProgress, lblContador, iAtual, iQuant);
            end;

            // Registra o evento no imóvel
            if (cbReavCommit.Checked) and (bReavalia) then begin
               if not RegistraEventoImovel2( cdsImovelIDIMOVEL.AsInteger ) then
                  raise Exception.create('Erro ao registrar o evento da Reavaliação do imovel ID: ' +
                                         QuotedStr(cdsImovelIDIMOVEL.AsString) );

               if CtrlProvisaoImovel.bContabProvisao then
               begin
                if not CtrlProvisaoImovel.ContabilizaProvisao(Sistema.IdModulo,
                                                              Sistema.IdEmpresa,
                                                              Sistema.IdUsuario,
                                                              edtDataReavalia.Date) then
                  raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
                end;

               // Comita uma transação a cada imóvel reavaliado
               CommitTransacao;

               // Inicia uma nova Transação
               StartTransacao;
            end;

            cdsImovel.Next;
         end;


      except
         on E : Exception do begin
            Result := False;
            RollBackTransacao;
            MsgDlg(E.message, 'Erro', mtError, [mbOk], 0);
         end;
      end;
   finally
      FreeAndNil( cdsBemReav );
      FreeAndNil( cdsTaxasDep );
      FreeAndNil( cdsPlanoPatroxBem );
      CloseFile( ArqLog );
   end;
end;


function TfrmExecReavaliacao.RegistraEventoImovel: Boolean;
var iQuant, iAtual : Integer;
    fPercent : Extended;
begin
   Result := True;
   iAtual := 1;
   iQuant := cdsImovel.RecordCount;
   MostraProgresso(ProgressBar, lblProgress, lblContador, iQuant, 'Registrando Eventos...');
   try
      cdsImovel.First;
      while not cdsImovel.Eof do begin
         // Calcula o Percentual de Variação
         fPercent := ComunsImobiliario.Arredonda( ((cdsImovelVLR_REAVALIA.AsFloat / cdsImovelVLR_CONTABIL.AsFloat) -1) * 100, 2);

         // Grava o evento de Reavaliação do Imovel
         if EventoImovel.RegistraEvento(cdsImovelIDIMOVEL.AsInteger, -1,
                                        Sistema.idUsuario, -1, -1,
                                        edtDataReavalia.Date, -1,
                                        'RV', 'Reavaliação do Imóvel',
                                        meObsEvento.Lines.Text, fPercent,
                                        cdsImovelVLR_CONTABIL.AsFloat,
                                        cdsImovelVLR_REAVALIA.AsFloat, False) = -1 then begin
            Result := False;
            Abort;
         end;

         // Atualiza ultima Reavaliação no Cadastro de Imóveis
         if cbRegistraImovel.Checked then begin
            LimpaParametros(qryUpdImovel);
            qryUpdImovel.ParamByName('pIDIMOVEL').AsInteger := cdsImovelIDIMOVEL.AsInteger;
            qryUpdImovel.ParamByName('pDATAREAVAL').AsDate  := edtDataReavalia.Date;
            qryUpdImovel.ParamByName('pVLRREAVAL').AsFloat  := cdsImovelVLR_REAVALIA.AsFloat;
            qryUpdImovel.ParamByName('pIDMOEDA').AsInteger  := ModuloImobiliario.Global.iMoedaCorrente;
            qryUpdImovel.ExecSQL;
         end;

         cdsImovel.Next;
         iAtual := iAtual + 1;
         AndaProgresso(ProgressBar, lblProgress, lblContador, iAtual, iQuant);
      end;
   except
      MsgDlg('Erro ao registrar o evento da Reavaliação do imovel ID: ' +
             QuotedStr(cdsImovelIDIMOVEL.AsString), 'Erro', mtError, [mbOk],0);
      Result := False;
   end;
end;


function TfrmExecReavaliacao.RegistraEventoImovel2(const iIdImovel: Integer): Boolean;
var fPercent : Extended;
begin
   Result := True;
   try
      // Calcula o Percentual de Variação
      if cdsImovelVLR_CONTABIL.AsFloat > 0 then
           fPercent := ComunsImobiliario.Arredonda( ((cdsImovelVLR_REAVALIA.AsFloat / cdsImovelVLR_CONTABIL.AsFloat) -1) * 100, 2)
      else fPercent := 0;

      // Restringe tamanho do campo
      if fPercent > 999 then fPercent := 999;

      // Grava o evento de Reavaliação do Imovel
      if EventoImovel.RegistraEvento(cdsImovelIDIMOVEL.AsInteger, -1,
                                     Sistema.idUsuario, -1, -1,
                                     edtDataReavalia.Date, -1,
                                     'RV', 'Reavaliação do Imóvel',
                                     meObsEvento.Lines.Text, fPercent,
                                     cdsImovelVLR_CONTABIL.AsFloat,
                                     cdsImovelVLR_REAVALIA.AsFloat, False) = -1 then begin
         Result := False;
         Abort;
      end;

      // Atualiza ultima Reavaliação no Cadastro de Imóveis
      if cbRegistraImovel.Checked then begin
         LimpaParametros(qryUpdImovel);
         qryUpdImovel.ParamByName('pIDIMOVEL').AsInteger := cdsImovelIDIMOVEL.AsInteger;
         qryUpdImovel.ParamByName('pDATAREAVAL').AsDate  := edtDataReavalia.Date;
         qryUpdImovel.ParamByName('pVLRREAVAL').AsFloat  := cdsImovelVLR_REAVALIA.AsFloat;
         qryUpdImovel.ParamByName('pIDMOEDA').AsInteger  := ModuloImobiliario.Global.iMoedaCorrente;
         qryUpdImovel.ExecSQL;
      end;
   except
      Result := False;
   end;
end;


procedure TfrmExecReavaliacao.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   btnVoltar3.Enabled   := False;
   btnConfirmar.Enabled := False;
end;

procedure TfrmExecReavaliacao.HabilitaBotoes;
begin
   btnVoltar3.Enabled   := True;
   btnConfirmar.Enabled := True;
   Screen.Cursor        := crDefault;
end;

procedure TfrmExecReavaliacao.btnAtualizarClick(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;


procedure TfrmExecReavaliacao.btnLimpaArqClick(Sender: TObject);
begin
   inherited;
   edtArqImporta.Clear;
end;

function TfrmExecReavaliacao.CarregaImportacao: Boolean;
var sReg : String;
    iLin, fCount : Integer;
    iSeq,iIdBem,iVida,iTotBens,iQtdBens : Integer;
    fValor,fVlrTotal,fTotDet : Extended;
begin

//----------------------------------------------------------------------------
//   LAYOUT DO ARQUIVO DE IMPORTAÇÃO:
//
//      Onde:  A - Registro de Início de Arquivo                   (1)
//             B - Registro de Detalhe do Arquivo                  (1)
//                 D - Nr. Sequencial                              (8)
//                 E - Id do Bem                                   (8)
//                 F - Vida útil do Bem                            (4)
//                 G - Valor de Reavaliação com 2 casas decimais   (12)
//             C - Registro de Término do Arquivo                  (1)
//                 H - Total de Bens                               (8)
//                 I - Valor total de Reavaliação com 2 casas      (12)
//
//   ---------------------------------------------------------------------------


   Result := True;
   if not FileExists(edtArqImporta.Text) then begin
      MsgDlg('Arquivo para Importação Não Encontrado','Aviso',mtwarning,[mbok],0);
      Result := False;
      Exit;
   end;


   // Abre a query de imoveis e bens vazia para adicionar os registros importados
   cdsImovel.Close;
   LimpaParametros(qryImovel);
   qryImovel.ParamByName('PVAZIA').AsString := 'S';
   qryImovel.Open;
   cdsImovel.Open;

   cdsBem.Close;
   LimpaParametros(qryBem);
   qryBem.ParamByName('PVAZIA').AsString := 'S';
   qryBem.Open;
   cdsBem.Open;

   BloqueiaGrid('I',False);
   BloqueiaGrid('B',False);

   // Abre o arquivo Texto para importação e um Arquivo texto para gravar os Erros
   ArqImport := nil;
   ArqImport := tStringList.Create;
   ArqImport.LoadFromFile(edtArqImporta.Text);
   memLog.Lines.Clear;

   // ProgressBar
   fCount := ArqImport.Count;
   MostraProgresso(ProgressBar, lblProgress, lblContador, fCount, 'Lendo arquivo de importação...');

   memLog.Lines.Add('Início da Importação');
   memLog.Lines.Add(' ');

   for iLin := 1 to ArqImport.Count do begin

      AndaProgresso(ProgressBar, lblProgress, lblContador, iLin, fCount);

      // O primeiro registro do arquivo deve ser do tipo A
      sReg := LeValor(1,1,iLin);
      if (iLin = 1) and (sReg <> 'A') then Result := GravaLogErro(-1,-1,-1,6);

      case sReg[1] of
         'A' : // Inicio de Arquivo
               begin
                  iQtdBens := 0;
                  fTotDet  := 0;
               end;

         'B' : // Detalhe de Arquivo
               begin
                  iSeq      := StrToInt(LeValor(02,06,iLin));
                  iIdBem    := StrToInt(LeValor(08,06,iLin));
                  iVida     := StrToInt(LeValor(14,04,iLin));
                  fValor    := ConverteValor(LeValor(18,12,iLin),'',2);

                  Inc(iQtdBens);
                  fTotDet := fTotDet + fValor;

                  // Checa os valores importados e efetua a Carga na tabela virtual
                  if VerificaDetalheImport(iSeq,iIdBem) then
                       Result := CarregaDetalhe(iIdBem,iVida,fValor)
                  else Result := False;
               end;

         'C' : // Fim de Arquivo
               begin
                  iTotBens  := StrToInt(LeValor(02,06,iLin));
                  fVlrTotal := ConverteValor(LeValor(08,12,iLin),'',2);

                  edtVlrReavalia.Value := fVlrTotal;

                  // Valida total de registros
                  if iTotBens <> iQtdBens then Result := GravaLogErro(iSeq,-1,-1,4);

                  // valida total de valores
                  if fVlrTotal <> fTotDet then Result := GravaLogErro(iSeq,-1,-1,5);
               end;
      end;
   end;

   // O Ultimo Registro deve ser do tipo C
   if sReg <> 'C' then Result := GravaLogErro(-1,-1,-1,7);

   EscondeProgresso(ProgressBar, lblProgress, lblContador);

   if not ValidaImoveisImportados then Result := False;

   memLog.Lines.Add(' ');
   memLog.Lines.Add('Término da Importação');

end;


function TfrmExecReavaliacao.CarregaImportacaoNova: Boolean;
var sReg : String;
    bResult : Boolean;
    iLin, fCount,i : Integer;
    Importa : TImporta;
    iTotImoveis,iQtdImoveis : Integer;
    fVlrTotal,fTotDet : Extended;
    iVlrTotal,iTotDet : Integer;
begin

//----------------------------------------------------------------------------
//   LAYOUT DO ARQUIVO DE IMPORTAÇÃO:
//
//      TIPO DE REGISTRO A, B, C
//      IDIMOVEL;
//      VALOR DO TERRENO;
//      VALOR DA EDIFICAÇÃO;
//      VALOR DA INSTALAÇÃO;
//      VIDA UTIL DA EDIFICAÇÃO;
//      VIDA UTIL DA INSTALAÇÃO;
//      ID DO FORNECEDOR ( AVALIADOR );
//
//   Obs.: Separados por ponto-virgula, valores sem separador de milhar
//   ---------------------------------------------------------------------------

   Result  := True;
   bResult := True;
   if not FileExists(edtArqImporta.Text) then begin
      MsgDlg('Arquivo para Importação Não Encontrado','Aviso',mtwarning,[mbok],0);
      Result := False;
      Exit;
   end;

   // Abre a query de imoveis e bens vazia para adicionar os registros importados
   cdsImovel.Close;
   LimpaParametros(qryImovel);
   qryImovel.ParamByName('PVAZIA').AsString := 'S';
   qryImovel.Open;

   cdsBem.Close;
   LimpaParametros(qryBem);
   qryBem.ParamByName('PVAZIA').AsString := 'S';
   qryBem.Open;

   BloqueiaGrid('I',False);
   BloqueiaGrid('B',False);


   MostraProgresso(ProgressBar, lblProgress, lblContador, fCount, 'Recuperando informações necessárias para o processamento...'); // Cássio Rovaroto - SIG nº 46687
   cdsImovelxBem.Data := CtrlMovReavaliacao.ListDadosImovelxBemReav;
   cdsTipoImovel.Data := CtrlMovReavaliacao.ListDadosTipoImovelReav;
   cdsObraReav.Data := CtrlMovReavaliacao.ListDadosObraReav(edtDataReavalia.Date);
   cdsFornecedor.Data := CtrlMovReavaliacao.ListFornecedorReav;
   EscondeProgresso(ProgressBar, lblProgress, lblContador); // Cássio Rovaroto - SIG nº 46687

   // Abre o arquivo Texto para importação e um Arquivo texto para gravar os Erros
   ArqImport := nil;
   ArqImport := tStringList.Create;
   ArqImport.LoadFromFile(edtArqImporta.Text);
   memLog.Lines.Clear;

   // ProgressBar
   fCount := ArqImport.Count;
   MostraProgresso(ProgressBar, lblProgress, lblContador, fCount, 'Lendo Arquivo de Importação...');

   memLog.Lines.Add('Início da Importação');
   memLog.Lines.Add(' ');

   for iLin := 1 to ArqImport.Count do begin

      AndaProgresso(ProgressBar, lblProgress, lblContador, iLin, fCount);

      // O primeiro registro do arquivo deve ser do tipo A
      sReg := LeValorSepara(1,iLin);
      if (iLin = 1) and (sReg <> 'A') then bResult := GravaLogErro(-1,-1,-1,6);

      case sReg[1] of
         'A' : // Inicio de Arquivo
               begin
                  iQtdImoveis := 0;
                  fTotDet     := 0;
               end;

         'B' : // Detalhe de Arquivo
               begin
                  // Limpa variaveis
                  Importa.iIdImovel   := -1;
                  Importa.iIdAvalia   := -1;
                  Importa.sImovel     := '';
                  Importa.sTipoImo    := '';
                  for i := 0 to 2 do begin
                     Importa.sTipoBem[i] := '';
                     Importa.fVlrBem[i]  := 0;
                     Importa.iVidaBem[i] := 0;
                     Importa.iIdBem[i]   := -1;
                     Importa.sBem[i]     := '';
                     Importa.iIdGrupo[i] := -1;
                     Importa.sAcao[i]    := '';
                  end;

                  // Carrega variáveis com os valores do arquivo texto
                  Importa.iIdImovel   := StrToInt(LeValorSepara(2,iLin));
// Felipe de Oliveira Sol 129329 Kintana 745159 - Inicio
                  if molFornecedor1.iFornecedor > 0 then
                    Importa.iIdAvalia   := molFornecedor1.iFornecedor
                  else
                    Importa.iIdAvalia   := StrToInt(LeValorSepara(8,iLin));
// Felipe de Oliveira Sol 129329 Kintana 745159 - Fim                    

//                  Importa.iIdAvalia   := StrToInt(LeValorSepara(8,iLin));

                  Importa.sTipoBem[0] := 'T';
                  Importa.fVlrBem[0]  := ConverteValor(LeValorSepara(3,iLin),',',2);
                  Importa.sTipoBem[1] := 'E';
                  Importa.fVlrBem[1]  := ConverteValor(LeValorSepara(4,iLin),',',2);
                  Importa.iVidaBem[1] := StrToInt(LeValorSepara(6,iLin));
                  Importa.sTipoBem[2] := 'I';
                  Importa.fVlrBem[2]  := ConverteValor(LeValorSepara(5,iLin),',',2);
                  Importa.iVidaBem[2] := StrToInt(LeValorSepara(7,iLin));

                  Inc(iQtdImoveis);
                  fTotDet := fTotDet + (Importa.fVlrBem[0] + Importa.fVlrBem[1] + Importa.fVlrBem[2]);

                  // Checa os valores importados e efetua a Carga na tabela virtual
                  if StrToInt(Copy(DateToStr((edtDataReavalia.Date)), 7, 4)) >= 2018 then
                  begin
                    if VerificaDetalheImport2018(Importa) then
                         bResult := CarregaDetalheNova(Importa)
                    else bResult := False;
                  end
                  else
                  begin
                    if VerificaDetalheImportNova(Importa) then
                         bResult := CarregaDetalheNova(Importa)
                    else bResult := False;
                  end;
               end;

         'C' : // Fim de Arquivo
               begin
                  iTotImoveis := StrToInt(LeValorSepara(2,iLin));
                  fVlrTotal   := ConverteValor(LeValorSepara(3,iLin),',',2);

                  edtVlrReavalia.Value := fVlrTotal;

                  // Valida total de registros
                  if iTotImoveis <> iQtdImoveis then bResult := GravaLogErro(-1,-1,-1,4);

                  // valida total de valores
                  fVlrTotal := Int(fVlrTotal * 100);
                  fTotDet   := Int(fTotDet * 100);

                  if fVlrTotal <> fTotDet then
                     bResult := GravaLogErro(-1,-1,-1,5, 'Valor Informado: ' + FloatToStr(fVlrtotal) + '  Valor Arquivo: ' + FloatToStr(fTotDet) );
               end;
      end;
      if bResult = False then Result := False;
   end;

   // O Ultimo Registro deve ser do tipo C
   if sReg <> 'C' then Result := GravaLogErro(-1,-1,-1,7);


   EscondeProgresso(ProgressBar, lblProgress, lblContador);
   memLog.Lines.Add(' ');
   memLog.Lines.Add('Término da Importação');
end;


function TfrmExecReavaliacao.LeValor(const iPos, iTam, iLin: Integer): String;
var i    : Integer;
    temp : string;
begin
   temp := '';
   if ArqImport <> nil then begin
     for i := 0 to (iTam - 1) do
       temp := temp + ArqImport[iLin-1][i+iPos];
   end;
   Result := temp;
end;

function TfrmExecReavaliacao.LeValorSepara(const iCampo, iLin: Integer): String;
var iIni,iFim : Integer;
    temp : string;
    bUltimoCampo : Boolean;
begin
   temp := '';
   if ArqImport <> nil then begin
     temp := ArqImport[iLin-1];
     if iCampo = 1 then begin                     // primeiro campo
       iIni := 0;
       iFim := StrNPos(temp,';',1) - 1;
       if iFim < 0 then iFim := Length(temp);
     end else begin
       iIni := StrNPos(temp,';',iCampo -1) + 1;
       if StrNPos(temp,';',iCampo) = 0 then       // ultimo Campo
            iFim := (Length(temp)+1) - iIni
       else iFim := StrNPos(temp,';',iCampo) - iIni;
     end;
     temp := copy(temp,iIni,iFim);
   end;
   temp   := Trim(temp);
   Result := temp;
end;


function TFrmExecReavaliacao.ConverteValor(const sValor,sCaracDec:string; nDecimal: integer): Extended;
var sDecAnt  : char;
    fVlrConv : Extended;
    i        : Integer;
begin
  if sValor = '' then begin
     fVlrConv := 0;
  end else begin
     if sCaracDec = '' then begin
        try
           fVlrConv := StrToFloat(sValor);
           if nDecimal <= 0 then nDecimal := 2;
           for i := 1 to nDecimal do fVlrConv := fVlrConv / 10;
        except
           fVlrConv := 0;
        end;
     end else begin
       sDecAnt := decimalseparator;
       fVlrConv := 0;
       try
          decimalseparator := sCaracDec[1];
          fVlrConv := StrToFloat(sValor);
       finally
         decimalseparator := sDecAnt;
       end;
     end;
  end;
  Result := fVlrConv;
end;



function TfrmExecReavaliacao.VerificaDetalheImport(const iSeq,iIdBem: Integer): Boolean;
begin
   Result := True;

   // Verifica se o Bem existe em IMOVELXBEM
   LimpaParametros(dtmCAF.qryImovelxBem);
   dtmCAF.qryImovelxBem.ParamByName('PIDBEM').AsInteger := iIdBem;
   dtmCAF.qryImovelxBem.Open;

   if dtmCAF.qryImovelxBem.RecordCount > 1 then
      Result := GravaLogErro(iSeq,dtmCAF.qryImovelxBemIDIMOVEL.AsInteger,iIdBem,3);
end;


function TfrmExecReavaliacao.VerificaDetalheImportNova(var Importa: TImporta): Boolean;
var i, iTotImp : Integer;
begin
   Result  := True;
   iTotImp := 0;
   // Verifica se os Bens existem em IMOVELXBEM
   i := 0;
   for i := 0 to Length(Importa.sTipoBem)-1 do begin
      if Importa.fVlrBem[i] <> 0 then begin
         Inc(iTotImp);

         // erro 15 : Imóvel sem bens ativos relacionados
         LimpaParametros(dtmCAF.qryImovelxBem);
         dtmCAF.qryImovelxBem.ParamByName('PIDIMOVEL').AsInteger  := Importa.iIdImovel;
         dtmCAF.qryImovelxBem.ParamByName('PBAIXATOTAL').AsString := 'N';
         dtmCAF.qryImovelxBem.Open;
         if dtmCAF.qryImovelxBem.IsEmpty then begin
            Result := GravaLogErro(-1,Importa.iIdImovel,-1,15);
            Exit;
         end;
         Importa.sImovel     := dtmCAF.qryImovelXBemIMOVEL_EXTENSO.AsString;
         Importa.sTipoImo    := dtmCAF.qryImovelxBemCODTIPIMOVEL.AsString;
         Importa.iIdConj     := dtmCAF.qryImovelXBemIDCONJUNTO.AsInteger;

         // erro 11 : Existe mais de um bem do mesmo tipo para o imóvel ( IMOVELXBEM )
         LimpaParametros(dtmCAF.qryImovelxBem);
         dtmCAF.qryImovelxBem.ParamByName('PIDIMOVEL').AsInteger  := Importa.iIdImovel;
         dtmCAF.qryImovelxBem.ParamByName('PBAIXATOTAL').AsString := 'N';
         dtmCAF.qryImovelxBem.ParamByName('PGRUPO').AsString      := Importa.sTipoBem[i];
         dtmCAF.qryImovelxBem.Open;
         if dtmCAF.qryImovelxBem.RecordCount > 1 then begin
            Result := GravaLogErro(-1,Importa.iIdImovel,-1,11,dtmCAF.qryImovelXBemIMOCODIGO.AsString );
            Continue;
         end;

         // Erro 10: Tipo de bem não existe para o imóvel ( IMOVELXBEM )
         if (not ModuloImobiliario.InvestImob.bFlgReavCriaBem) and (dtmCAF.qryImovelXBem.IsEmpty) then begin
            Result := GravaLogErro(-1,Importa.iIdImovel,-1,10,dtmCAF.qryImovelXBemIMOCODIGO.AsString );
            Continue;
         end;

         // Se existir um registro, reavalia, senão, inclui o bem
         if not dtmCAF.qryImovelxBem.IsEmpty then begin
            Importa.iIdBem[i]   := dtmCAF.qryImovelXBemIDBEM.AsInteger;
            Importa.iIdGrupo[i] := dtmCAF.qryImovelxBemIDGRUPO.AsInteger;
            Importa.sBem[i]     := dtmCAF.qryImovelxBemDESBEM.AsString;
            Importa.sAcao[i]    := 'R';
         end else begin
            // Busca o tipo de bem a ser incluído
            LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
            dtmLookImobiliario.qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := Importa.sTipoImo;
            dtmLookImobiliario.qryLookTipoImovel.Open;

            if Importa.sTipoBem[i] = 'I' then begin
               Importa.iIdGrupo[i] := dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsInteger;
               Importa.sBem[i]     := Importa.sImovel + ' - ' + 'Instalações';
            end else if Importa.sTipoBem[i] = 'E' then begin
               Importa.iIdGrupo[i] := dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsInteger;
               Importa.sBem[i]     := Importa.sImovel + ' - ' + 'Edificação';
            end else if Importa.sTipoBem[i] = 'T' then begin
               Importa.iIdGrupo[i] := dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsInteger;
               Importa.sBem[i]     := Importa.sImovel + ' - ' + 'Terreno';
            end;
            Importa.sAcao[i] := 'I';
            GravaLogErro(-1,Importa.iIdImovel,-1,16,dtmCAF.qryImovelXBemIMOCODIGO.AsString, Importa.sBem[i] );
         end;
      end;
   end;

   // Erro 9: Qtde de Bens reavaliados inferior ao total de bens atuais do imóvel
   LimpaParametros(dtmCAF.qryImovelxBem);
   dtmCAF.qryImovelxBem.ParamByName('PIDIMOVEL').AsInteger  := Importa.iIdImovel;
   dtmCAF.qryImovelxBem.ParamByName('PBAIXATOTAL').AsString := 'N';
   dtmCAF.qryImovelxBem.Open;
   if (dtmCAF.qryImovelxBem.RecordCount > iTotImp) and (not ModuloImobiliario.InvestImob.bFlgReavBaixaBem) then begin
      Result := GravaLogErro(-1,Importa.iIdImovel,-1,9, dtmCAF.qryImovelxBemIMOCODIGO.AsString);
   end;

   // Exclui os bens não reavaliados ( não bloqueia o processo )
   if (dtmCAF.qryImovelxBem.RecordCount > iTotImp) and (ModuloImobiliario.InvestImob.bFlgReavBaixaBem) then begin
      // Verifica quais bens que não foram reavaliados e serão baixados
      while not dtmCAF.qryImovelxBem.Eof do begin
         for i := 0 to Length(Importa.sTipoBem)-1 do begin
            if (dtmCAF.qryImovelXBemIXBGRUPO.AsString = Importa.sTipoBem[i]) and
               (Importa.fVlrBem[i] = 0) and (Importa.iIdBem[i] = -1) then begin
               Importa.iIdBem[i]   := dtmCAF.qryImovelXBemIDBEM.AsInteger;
               Importa.sBem[i]     := dtmCAF.qryImovelXBemDESBEM.AsString;
               Importa.iIdGrupo[i] := dtmCAF.qryImovelXBemIDGRUPO.AsInteger;
               Importa.sImovel     := dtmCAF.qryImovelXBemIMOVEL_EXTENSO.AsString;
               Importa.sTipoImo    := dtmCAF.qryImovelxBemCODTIPIMOVEL.AsString;
               Importa.iIdConj     := dtmCAF.qryImovelXBemIDCONJUNTO.AsInteger;
               Importa.sAcao[i]    := 'E';
               GravaLogErro(-1,Importa.iIdImovel,-1,17, dtmCAF.qryImovelxBemIMOCODIGO.AsString, dtmCAF.qryImovelXBemDESBEM.AsString);
               Break;
            end;
         end;
         dtmCAF.qryImovelXBem.Next;
      end;
   end;

   // Erro 9: OBRAS - Qtde de grupos reavaliados inferior ao total de grupos atuais da obra
   if (dtmCAF.qryImovelXBem.isEmpty) or
      (dtmCAF.qryImovelXBemCODTIPIMOVEL.AsString = ModuloImobiliario.InvestImob.sCodTipImovelObra) then begin

      LimpaParametros(dtmCAF.qryLookObraReav);
      dtmCAF.qryLookObraReav.ParamByName('PIDIMOVEL').AsInteger  := Importa.iIdImovel;
      dtmCAF.qryLookObraReav.ParamByName('PDTLIMITE').AsDateTime := edtDataReavalia.Date;
      dtmCAF.qryLookObraReav.Open;
      if (dtmCAF.qryLookObraReav.RecordCount > iTotImp) and (not ModuloImobiliario.InvestImob.bFlgReavBaixaBem) then begin
         Result := GravaLogErro(-1,Importa.iIdImovel,-1,9, dtmCAF.qryLookObraReavIMOCODIGO.AsString);
      end;

      // Subtrai os bens reavaliados ( terreno )
      iTotImp := iTotImp - dtmCAF.qryImovelXBem.RecordCount;

      // Exclui os grupos de OBRAS não reavaliados ( não bloqueia o processo )
      if (dtmCAF.qryLookObraReav.RecordCount > iTotImp) and (ModuloImobiliario.InvestImob.bFlgReavBaixaBem) then begin
         // Verifica quais grupos que não foram reavaliados e serão baixados
         while not dtmCAF.qryLookObraReav.Eof do begin
            for i := 0 to Length(Importa.sTipoBem)-1 do begin
               if (dtmCAF.qryLookObraReavTIPO.AsString = Importa.sTipoBem[i]) and
                  (Importa.fVlrBem[i] = 0) and (Importa.iIdBem[i] = -1) then begin
                  case Importa.sTipoBem[i][1] of
                     'T' : Importa.sBem[i] := 'Lançamentos de Terreno em Obras';
                     'E' : Importa.sBem[i] := 'Lançamentos de Edificação em Obras';
                     'I' : Importa.sBem[i] := 'Lançamentos de Instalações em Obras';
                  end;
                  Importa.iIdGrupo[i] := dtmCAF.qryLookObraReavIDGRUPO.AsInteger;
                  Importa.sAcao[i]    := 'E';
                  GravaLogErro(-1,Importa.iIdImovel,-1,17, dtmCAF.qryLookObraReavIMOCODIGO.AsString, Importa.sBem[i]);
                  Break;
               end;
            end;
            dtmCAF.qryLookObraReav.Next;
         end;
      end;
   end;

   // Erro 12 : Avaliador não cadastrado ( FORNECEDOR )
   LimpaParametros(dtmLookImobiliario.qryLookFornecedor);
   dtmLookImobiliario.qryLookFornecedor.ParamByName('PIDFORCLI').AsInteger := Importa.iIdAvalia;
   dtmLookImobiliario.qryLookFornecedor.Open;
   if dtmLookImobiliario.qryLookFornecedor.IsEmpty then begin
      Result := GravaLogErro(-1,Importa.iIdImovel,-1,12,dtmCAF.qryImovelxBemIMOCODIGO.AsString);
   end;
end;


function TfrmExecReavaliacao.GravaLogErro(const iSeq,iIdImovel,iIdBem,iErro: Integer; const sCodImovel, sNomeImovel:String) : Boolean;
var sMensErro,sIniErro : String;
begin
   if iErro > 0 then
        Result := False
   else Result := True;

   // Define Mensagens de Erro
   case iErro of
      1 : sMensErro := 'Bem não existe ( BEM ) ';
      2 : sMensErro := 'Bem não relacionado a Imóvel ( IMOVELXBEM )  ';
      3 : sMensErro := 'Bem relacionado a mais de um Imóvel ( IMOVELXBEM )  ';
      4 : sMensErro := 'Total de Lançamentos Inválido ';
      5 : sMensErro := 'Valor total da Reavaliação Inválido ';
      6 : sMensErro := 'Não existe registro de Inicialização - Tipo A ';
      7 : sMensErro := 'Não existe registro de Finalização - Tipo C ';
      8 : sMensErro := 'Imóvel náo possui saldo contabil na data da Reavaliação ';
      9 : sMensErro := 'Qtde de Bens reavaliados inferior ao total de bens do imóvel ';
     10 : sMensErro := 'Tipo de bem não existe para o imóvel ( IMOVELXBEM ) ';
     11 : sMensErro := 'Existe mais de um bem do mesmo tipo para o imóvel ( IMOVELXBEM ) ';
     12 : sMensErro := 'Avaliador não cadastrado ( FORNECEDOR ) ';
     13 : sMensErro := 'Reavaliação do imóvel Duplicada';
     14 : sMensErro := 'Imóvel não reavaliado';
     15 : sMensErro := 'Imóvel sem bens ativos relacionados';
     16 : sMensErro := 'Criação do Bem';
     17 : sMensErro := 'Baixa do Bem';
   end;

   sIniErro := '';
   if iSeq   > 0        then sIniErro := 'Seq. ' + IntToStr(iSeq) + ' - ';
   if iIdImovel > 0     then sIniErro := sIniErro + 'Imóvel ' + IntToStr(iIdImovel) + ' - ';
   if sCodImovel <> ''  then sIniErro := sIniErro + 'Cod ' + sCodImovel + ' - ';
   if iIdBem > 0        then sIniErro := sIniErro + 'Bem ' + IntToStr(iIdBem) + ' - ';
   if sNomeImovel <> '' then sIniErro := sIniErro + ' ' + sNomeImovel + ' - ';

   sMensErro := sIniErro + sMensErro;
   memLog.Lines.Add(sMensErro);
end;

function TfrmExecReavaliacao.CarregaDetalhe(const iIdBem,iVida:Integer; const fValor:Extended): Boolean;
var fSldCtbImob : Extended;
begin
   Result := True;
   try
      cdsBem.Insert;
      cdsBemIDBEM.AsInteger         := iIdBem;
      cdsBemIDIMOVEL.AsInteger      := dtmCAF.qryImovelxBemIDIMOVEL.AsInteger;
      cdsBemIMOVEL_EXTENSO.AsString := dtmCAF.qryImovelXBemIMOVEL_EXTENSO.AsString;
      cdsBemIDGRUPO.AsInteger       := dtmCAF.qryImovelxBemIDGRUPO.AsInteger;
      cdsBemIXBGRUPO.AsString       := dtmCAF.qryImovelxBemIXBGRUPO.AsString;
      cdsBemCODTIPIMOVEL.AsString   := dtmCAF.qryImovelxBemCODTIPIMOVEL.AsString;
      cdsBemDESBEM.AsString         := dtmCAF.qryImovelxBemDESBEM.AsString;
      cdsBemVLR_REAVALIA.AsFloat    := fValor;
      cdsBemALT.AsInteger           := 2;
      if dtmCAF.qryImovelxBemIXBGRUPO.AsString = 'T' then
           cdsBemVIDAUTIL.AsInteger := 0
      else cdsBemVIDAUTIL.AsInteger := iVida;

      cdsBemVLR_CONTABIL.AsFloat := CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                                          iIdBem,
                                                          edtDataReavalia.Date,
                                                          ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                          ModuloImobiliario.InvestImob.iIdPaisCAF);
      cdsBem.Post;
   except
      Result := False;
   end;

   // Carrega o valor acumulado dos bens na query virtual de Imoveis
   if Result then begin
      try
         if not cdsImovel.FindKey([dtmCAF.qryImovelxBemIMOVEL_EXTENSO.AsString,dtmCAF.qryImovelxBemIDIMOVEL.AsInteger]) then begin
            cdsImovel.Insert;
            cdsImovelIDIMOVEL.AsInteger      := dtmCAF.qryImovelxBemIDIMOVEL.AsInteger;
            cdsImovelIMOVEL_EXTENSO.AsString := dtmCAF.qryImovelxBemIMOVEL_EXTENSO.AsString;
            cdsImovelVLR_CONTABIL.AsFloat    := cdsBemVLR_CONTABIL.AsFloat;
            cdsImovelVLR_REAVALIA.AsFloat    := cdsBemVLR_REAVALIA.AsFloat;
            cdsImovelALT.AsInteger           := 2;
         end else begin
            cdsImovel.Edit;
            cdsImovelVLR_CONTABIL.AsFloat := cdsImovelVLR_CONTABIL.AsFloat + cdsBemVLR_CONTABIL.AsFloat;
            cdsImovelVLR_REAVALIA.AsFloat := cdsImovelVLR_REAVALIA.AsFloat + cdsBemVLR_REAVALIA.AsFloat;
         end;
         cdsImovel.Post;
      except
         Result := False;
      end;
   end;
end;

function TfrmExecReavaliacao.CarregaDetalheNova(const Importa: TImporta): Boolean;
var fSldCtbImob : Extended;
    iReg  : Integer;
begin
   Result := True;
   try
      // Inclui a tabela de imoveis
      // Erro 13: Reavaliação do imóvel Duplicada
      if not cdsImovel.FindKey([Importa.sImovel, Importa.iIdImovel]) then begin
         cdsImovel.Insert;
         cdsImovelIDIMOVEL.AsInteger      := Importa.iIdImovel;
         cdsImovelIMOVEL_EXTENSO.AsString := Importa.sImovel;
         cdsImovelALT.AsInteger           := 2;
      end else begin
         Result := GravaLogErro(-1,Importa.iIdImovel,-1,13);
         Exit;
      end;

      // Carrega a tabela de Bens
      iReg := 0;
      for iReg := 0 to Length(Importa.sTipoBem)-1 do begin
         if Importa.sAcao[iReg] <> '' then begin
            cdsBem.Insert;
            cdsBemIDBEM.AsInteger         := Importa.iIdBem[iReg];
            cdsBemIDIMOVEL.AsInteger      := Importa.iIdImovel;
            cdsBemIMOVEL_EXTENSO.AsString := Importa.sImovel;
            cdsBemIDCONJUNTO.AsInteger    := Importa.iIdConj;
            cdsBemIDGRUPO.AsInteger       := Importa.iIdGrupo[iReg];
            cdsBemIXBGRUPO.AsString       := Importa.sTipoBem[iReg];
            cdsBemCODTIPIMOVEL.AsString   := Importa.sTipoImo;
            cdsBemDESBEM.AsString         := Importa.sBem[iReg];
            cdsBemIDAVALIADOR.AsInteger   := Importa.iIdAvalia;
            cdsBemVLR_REAVALIA.AsFloat    := Importa.fVlrBem[iReg];
            cdsBemVIDAUTIL.AsInteger      := Importa.iVidaBem[iReg];
            cdsBemACAO.AsString           := Importa.sAcao[iReg];
            cdsBemALT.AsInteger           := 2;

            if (Importa.sAcao[iReg] = 'R') or (Importa.sAcao[iReg] = 'E') then begin
               if Importa.iIdBem[iReg] > 0 then begin

                  cdsBemVLR_CONTABIL.AsFloat := CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                                                      Importa.iIdBem[iReg],
                                                                      edtDataReavalia.Date,
                                                                      ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                                      ModuloImobiliario.InvestImob.iIdPaisCAF);
               end else begin
                  LimpaParametros(dtmCAF.qryLookObraReav);
                  dtmCAF.qryLookObraReav.ParamByName('PIDIMOVEL').AsInteger  := Importa.iIdImovel;
                  dtmCAF.qryLookObraReav.ParamByName('PIDGRUPO').AsInteger   := Importa.iIdGrupo[iReg];
                  dtmCAF.qryLookObraReav.ParamByName('PDTLIMITE').AsDateTime := edtDataReavalia.Date;
                  dtmCAF.qryLookObraReav.Open;
                  cdsBemVLR_CONTABIL.AsFloat := dtmCAF.qryLookObraReavSALDO.AsFloat;
               end;
            end;
            cdsBem.Post;

            // Acumula o total do imóvel
            cdsImovelVLR_CONTABIL.AsFloat := cdsImovelVLR_CONTABIL.AsFloat + cdsBemVLR_CONTABIL.AsFloat;
            cdsImovelVLR_REAVALIA.AsFloat := cdsImovelVLR_REAVALIA.AsFloat + cdsBemVLR_REAVALIA.AsFloat;
         end;
      end;

      cdsImovel.Post;

      // Erro 8: Imóvel náo possui saldo contabil na data da Reavaliação
      if cdsImovelVLR_CONTABIL.AsFloat <= 0 then
         Result := GravaLogErro(-1,cdsImovelIDIMOVEL.AsInteger,-1,8);
   except
      Result := False;
   end;
end;


function TfrmExecReavaliacao.ValidaImoveisImportados: Boolean;
var iQtdeImp, iQtdeBco : Integer;
begin
   Result := True;
   cdsImovel.DisableControls;
   cdsBem.DisableControls;

   cdsImovel.First;
   while not cdsImovel.Eof do begin

      // Valida o Valor Contábil
      if cdsImovelVLR_CONTABIL.AsFloat = 0 then Result := GravaLogErro(-1,cdsImovelIDIMOVEL.AsInteger,-1,8);

      // Valida a Quantidade de Bens por Imóvel
      LimpaParametros(dtmCAF.qryImovelxBem);
      dtmCAF.qryImovelxBem.ParamByName('PIDIMOVEL').AsInteger := cdsImovelIDIMOVEL.AsInteger;
      dtmCAF.qryImovelxBem.Open;
      iQtdeBco := dtmCAF.qryImovelxBem.RecordCount;
      iQtdeImp := 0;
      cdsBem.First;
      while not cdsBem.eof do begin
         if cdsBemIDIMOVEL.AsInteger = cdsImovelIDIMOVEL.AsInteger then
            Inc(iQtdeImp);
         cdsBem.Next;
      end;
      if iQtdeImp <> iQtdeBco then Result := GravaLogErro(-1,cdsImovelIDIMOVEL.AsInteger,-1,9);

      cdsImovel.Next;
   end;

   cdsImovel.First;
   cdsBem.First;
   cdsImovel.EnableControls;
   cdsBem.EnableControls;
end;


procedure TfrmExecReavaliacao.BloqueiaGrid(const sTipo: String;  const bReadOnly: Boolean);
begin
   // Abre as queries dos grids caso estejam fechadas
   if sTipo = 'I' then begin
      if cdsImovel.Active = False then begin
         cdsImovel.Close;
         LimpaParametros(qryImovel);
         qryImovel.ParamByName('PVAZIA').AsString := 'S';
         qryImovel.Open;
         cdsImovel.Open;
      end;
   end else begin
      if cdsBem.Active = False then begin
         cdsBem.Close;
         LimpaParametros(qryBem);
         qryBem.ParamByName('PVAZIA').AsString := 'S';
         qryBem.Open;
         cdsBem.Open;
      end;
   end;

   // Marca os campos na Query como READONLY
   if bReadOnly then begin
      if bImporta then begin
         if sTipo = 'I' then begin
            dbgImovel.Fields[0].ReadOnly := True;
            dbgImovel.Fields[1].ReadOnly := True;
            dbgImovel.Fields[2].ReadOnly := True;
            dbgImovel.Fields[3].ReadOnly := True;
            dbgImovel.Fields[4].ReadOnly := True;
         end else begin
            dbgBens.Fields[0].ReadOnly   := True;
            dbgBens.Fields[1].ReadOnly   := True;
            dbgBens.Fields[2].ReadOnly   := True;
            dbgBens.Fields[3].ReadOnly   := True;
            dbgBens.Fields[4].ReadOnly   := True;
         end;
      end else begin
         if sTipo = 'I' then begin
            dbgImovel.Fields[0].ReadOnly := True;
            dbgImovel.Fields[1].ReadOnly := True;
            dbgImovel.Fields[2].ReadOnly := False;
            dbgImovel.Fields[3].ReadOnly := False;
            dbgImovel.Fields[4].ReadOnly := False;
         end else begin
            dbgBens.Fields[0].ReadOnly := True;
            dbgBens.Fields[1].ReadOnly := True;
            dbgBens.Fields[2].ReadOnly := False;
            dbgBens.Fields[3].ReadOnly := False;
            dbgBens.Fields[4].ReadOnly := False;
         end;
      end;
   end else begin
      if sTipo = 'I' then begin
         dbgImovel.Fields[0].ReadOnly := False;
         dbgImovel.Fields[1].ReadOnly := False;
         dbgImovel.Fields[2].ReadOnly := False;
         dbgImovel.Fields[3].ReadOnly := False;
         dbgImovel.Fields[4].ReadOnly := False;
      end else begin
         dbgBens.Fields[0].ReadOnly := False;
         dbgBens.Fields[1].ReadOnly := False;
         dbgBens.Fields[2].ReadOnly := False;
         dbgBens.Fields[3].ReadOnly := False;
         dbgBens.Fields[4].ReadOnly := False;
      end;
   end;
end;


function TfrmExecReavaliacao.AjustaTaxaDep: Boolean;
var fTaxaDep, fTaxaNova, fTaxaAnt, fDepNova, fDepCaf, fCusto, fReavAnt, fAcresAnt, fReavNova : Extended;
    sSql : String;
begin
   Result := True;
   if cdsBemVIDAUTIL.AsInteger > 0 then begin
     try
        //fTaxaDep := ComunsImobiliario.Arredonda(100 / (cdsBemVIDAUTIL.AsInteger / 12), 6); //WO19821 - Leandro Pocebon
        fTaxaDep := ComunsImobiliario.Arredonda(100 / cdsBemVIDAUTIL.AsInteger , 6);  //WO19821 - Leandro Pocebon
        fDepNova := ComunsImobiliario.Arredonda(cdsBemVLR_REAVALIA.AsFloat * ((fTaxaDep/12) / 100), 2);

        sSql := 'SELECT BD.TAXADEP, (BM.VALORG + BM.CMBEM) AS VLRCUSTO '+#13+
                '  FROM BEMXMOEDA BM, BEMXDEP BD    '+#13+
                ' WHERE BM.IDBEM = BD.IDBEM         '+#13+
                '   AND BM.MOECODIGO = BD.MOECODIGO '+#13+
                '   AND BM.IDBEM = ' + cdsBemIDBEM.AsString +#13+
                '   AND BM.MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF) +#13+
                '   AND BD.IDBEMXDEP = ' + IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF);
        FazQuery( dtmBaseDados.qry, sSql );
        fCusto   := dtmBaseDados.qry.FieldByName('VLRCUSTO').AsFloat;
        fTaxaAnt := dtmBaseDados.qry.FieldByName('TAXADEP').AsFloat;

        //Helio - SOL Nº 212226 KINTANA Nº 2037651
        //grava no historico de vida util
        CtrlHistoricoVidaUtil.GravaHistoricoVidaUtil(
                                cdsBemIDBEM.AsInteger, //SOL 240108 PPM 619627
                                cdsBemVIDAUTIL.AsInteger,
                                fTaxaDep * 12, //taxa ao ano
                                fTaxaDep, //taxa ao mes
                                'Reavaliação do Imóvel', False);
        //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651


        sSql := 'SELECT SUM(RM.VALORG + NVL(RM.CMBEM,0)) AS VLRREAV '+#13+
                '  FROM REAVALIACAO R, REAVALXMOEDA RM              '+#13+
                ' WHERE R.DATAREAVALIACAO <> TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataReavalia.Date)) + ',''DD/MM/YYYY'') '+#13+
                '   AND R.IDREAVALIACAO  = RM.IDREAVALIACAO         '+#13+
                '   AND R.IDBEM      = ' + cdsBemIDBEM.AsString      +#13+
                '   AND RM.MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF);
        FazQuery( dtmBaseDados.qry, sSql );
        if not dtmBaseDados.qry.IsEmpty then
             fReavAnt := dtmBaseDados.qry.FieldByName('VLRREAV').AsFloat
        else fReavAnt := 0;

        sSql := 'SELECT SUM(RM.VALORG + NVL(RM.CMBEM,0)) AS VLRREAV '+#13+
                '  FROM REAVALIACAO R, REAVALXMOEDA RM              '+#13+
                ' WHERE R.DATAREAVALIACAO = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataReavalia.Date)) + ',''DD/MM/YYYY'') '+#13+
                '   AND R.IDREAVALIACAO  = RM.IDREAVALIACAO         '+#13+
                '   AND R.IDBEM      = ' + cdsBemIDBEM.AsString      +#13+
                '   AND RM.MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF);
        FazQuery( dtmBaseDados.qry, sSql );
        if not dtmBaseDados.qry.IsEmpty then
             fReavNova := dtmBaseDados.qry.FieldByName('VLRREAV').AsFloat
        else fReavNova := 0;

        sSql := 'SELECT SUM(AM.VALORG + NVL(AM.CMBEM,0)) AS VLRACRES '+#13+
                '  FROM ACRESCIMOVALOR A, ACRESCVALORXMOEDA AM       '+#13+
                ' WHERE A.DATAACRESCIMO < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataReavalia.Date)) + ',''DD/MM/YYYY'') '+#13+
                '   AND A.IDACRESCIMO  = AM.IDACRESCIMO             '+#13+
                '   AND A.IDBEM      = ' + cdsBemIDBEM.AsString      +#13+
                '   AND AM.MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF);
        FazQuery( dtmBaseDados.qry, sSql );
        if not dtmBaseDados.qry.IsEmpty then
             fAcresAnt := dtmBaseDados.qry.FieldByName('VLRACRES').AsFloat
        else fAcresAnt := 0;

        fTaxaNova := (1200 * fDepNova - fReavNova * fTaxaDep) / (fCusto + fReavAnt + fAcresAnt);
        fTaxaNova := ComunsImobiliario.Arredonda( fTaxaNova, 6 );

        fDepCaf := (fCusto*(fTaxaNova/12/100)) + (fReavAnt*(fTaxaNova/12/100))  + (fAcresAnt*(fTaxaNova/12/100)) + (fReavNova*(fTaxaDep/12/100));
        fDepCaf := ComunsImobiliario.Arredonda( fDepCaf, 2 );

        if ((fDepCaf      = fDepNova) and (fTaxaAnt <> fTaxaNova)) or
           ((fDepCaf+0.01 = fDepNova) and (fTaxaAnt <> fTaxaNova)) or
           ((fDepCaf-0.01 = fDepNova) and (fTaxaAnt <> fTaxaNova)) then begin
           sSql := 'UPDATE BEMXDEP SET TAXADEP = ' + ComunsImobiliario.StrTran(FloatToStr(fTaxaNova),',','.') +#13+
                   ' WHERE IDBEM     = ' + cdsBemIDBEM.AsString +#13+
                   '   AND MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF) +#13+
                   '   AND IDBEMXDEP = ' + IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF);
           ExecutaQuery( dtmBaseDados.qry, sSql );

           sSql := 'UPDATE REAVALXDEP SET TAXADEP = ' + ComunsImobiliario.StrTran(FloatToStr(fTaxaNova),',','.') +#13+
                   ' WHERE MOECODIGO    = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF) +#13+
                   '   AND IDREAVALXDEP = ' + IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF)  +#13+
                   '   AND IDREAVALIACAO IN( SELECT IDREAVALIACAO '+#13+
                   '                           FROM REAVALIACAO   '+#13+
                   '                          WHERE IDBEM = ' + cdsBemIDBEM.AsString +#13+
                   '                            AND DATAREAVALIACAO <> TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataReavalia.Date)) + ',''DD/MM/YYYY'') ) ';
           ExecutaQuery( dtmBaseDados.qry, sSql );

           sSql := 'UPDATE ACRESCVALORXDEP SET TAXADEP = ' + ComunsImobiliario.StrTran(FloatToStr(fTaxaNova),',','.') +#13+
                   ' WHERE MOECODIGO       = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF) +#13+
                   '   AND IDACRESCIMOXDEP = ' + IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF)  +#13+
                   '   AND IDACRESCIMO IN( SELECT IDACRESCIMO    '+#13+
                   '                         FROM ACRESCIMOVALOR '+#13+
                   '                        WHERE IDBEM = ' + cdsBemIDBEM.AsString +#13+
                   '                          AND DATAACRESCIMO < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataReavalia.Date)) + ',''DD/MM/YYYY'') ) ';
           ExecutaQuery( dtmBaseDados.qry, sSql );

           writeLn(ArqLog, 'OK   IMOVEL ' + cdsBemIDIMOVEL.AsString + ' BEM ' + cdsBEMIDBEM.AsString + ' Taxa Anterior ' + FloatToStr(fTaxaAnt) + ' Taxa Nova ' + FloatToStr(fTaxaNova) );
        end else if (fDepCaf <> fDepNova) then begin
           writeLn(ArqLog, 'ERRO IMOVEL ' + cdsBemIDIMOVEL.AsString + ' BEM ' + cdsBEMIDBEM.AsString + ' Dep. CAF ' + FloatToStr(fDepCaf) + ' Dep. Calc ' + FloatToStr(fDepNova) );
        end;
     except
        Result := False;
     end;
   end;
end;

function TfrmExecReavaliacao.VerificaImoveisNaoReavaliados: Boolean;
var sSql : String;
    iLin, fCount: Extended;
begin
   Result := True;
   try
      sSql := 'SELECT I.IDIMOVEL, I.IMOCODIGO, ' +#13+
              '       IM.IMONOME || '' - '' || I.IMONOME AS IMOVEL_EXTENSO ' +#13+
              '  FROM IMOVEL I, IMOVEL IM ' +#13+
              ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL ' +#13+
              '   AND I.FLGATIVO = 1 ' +#13+
              '   AND I.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);

      if not FazQuery(dtmImobiliario.qryAux, sSql) then raise exception.Create('');
      fCount := dtmImobiliario.qryAux.RecordCount;
      iLin   := 0;
      MostraProgresso(ProgressBar, lblProgress, lblContador, fCount, 'Verificando imóveis não reavaliados...');

      cdsImovel.First;      
      while not dtmImobiliario.qryAux.Eof do begin
         iLin := iLin + 1;
         AndaProgresso(ProgressBar, lblProgress, lblContador, iLin, fCount);
         if not cdsImovel.FindKey([dtmImobiliario.qryAux.FieldByName('IMOVEL_EXTENSO').AsString, dtmImobiliario.qryAux.FieldByName('IDIMOVEL').AsInteger]) then begin
            GravaLogErro(-1, dtmImobiliario.qryAux.FieldByName('IDIMOVEL').AsInteger, -1, 14, dtmImobiliario.qryAux.FieldByName('IMOCODIGO').AsString, dtmImobiliario.qryAux.FieldByName('IMOVEL_EXTENSO').AsString);
         end;
         dtmImobiliario.qryAux.Next;
      end;
      cdsImovel.First;
   except
      Result := False;
      MsgDlg('Não foi possível fazer a verificação','Erro',mtWarning, [mbOk], 0);
   end;
end;


function TfrmExecReavaliacao.SaldoObra(const iIdImovel, iIdGrupo: Integer; const dData: TDateTime): Extended;
var sSql : String;
begin
   // Busca o saldo da obra
   sSql := 'SELECT SUM(OL.VALOFI) AS SOMAVALOFI '+#13+
           '  FROM CAFOBRALANC OL, CAFOBRA O    '+#13+
           ' WHERE O.IDCAFOBRA = OL.IDCAFOBRA   '+#13+
           '   AND O.IDPESSOA  = OL.IDPESSOA    '+#13+
           '   AND O.IDIMOVEL  = ' + IntToStr(iIdImovel) +#13+
           '   AND OL.IDGRUPO  = ' + IntToStr(iIdGrupo)  +#13+
           '   AND OL.DTALANCAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dData)) + ',''DD/MM/YYYY'') ';
   FazQuery(dtmImobiliario.qryAux, sSql);

   Result := dtmImobiliario.qryAux.FieldByName('SOMAVALOFI').AsFloat;
end;

function TfrmExecReavaliacao.ExecutaReavaliaObra(const iIdImovel,iIdGrupo: Integer;
                                                 const fVlrReavalia: Extended; const dDataReavalia: TDateTime): Boolean;
var fSldObra, fVlrObra : Extended;
    iIdLancImovel : Integer;
    iIdObraLanc   : Extended;
    sSql : String;
begin
   Result := True;
   try
      // Verifica se existe lançamento posterior a data da reavaliação
      sSql := 'SELECT L.DTALANCAMENTO FROM CAFOBRALANC L, CAFOBRA O '+#13+
              ' WHERE O.IDCAFOBRA = L.IDCAFOBRA '+#13+
              '   AND O.IDIMOVEL = ' + IntToStr(iIdImovel) +
              '   AND L.IDGRUPO  = ' + IntToStr(iIdGrupo) +
              '   AND L.DTALANCAMENTO > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataReavalia)) + ',''DD/MM/YYYY'') ';
      FazQuery(dtmImobiliario.qryAux, sSql);
      if not dtmImobiliario.qryAux.IsEmpty then
         raise Exception.Create('Existe Lançamento Posterior a data da reavaliação da obra');

      // Busca o Saldo da obra na data da reavaliação
      fSldObra := SaldoObra(cdsBemIDIMOVEL.AsInteger, cdsBemIDGRUPO.AsInteger, edtDataReavalia.Date);
      fVlrObra := fVlrReavalia - fSldObra;

      // Executa a reavaliação da obra
      if fVlrObra <> 0 then begin
         // Busca dados da obra
         LimpaParametros(dtmCAF.qryLookObra);
         dtmCAF.qryLookObra.ParamByName('PIDIMOVEL').AsInteger := iIdImovel;
         dtmCAF.qryLookObra.Open;
         if dtmCAF.qryLookObra.RecordCount > 1 then
            raise Exception.Create('Existe mais de uma obra relacionada ao imóvel');

         // Grava Lançamento no CAF
         CtrlCafObra.OpenTransaction := False;
         iIdObraLanc := CtrlCafObra.ExecutaLancObra(Sistema.IdModulo,
                                     Sistema.IdEmpresa,
                                     Sistema.IdUsuario,
                                     dtmCAF.qryLookObraIDCAFOBRA.AsInteger,
                                     1, // criar parâmetro para a etapa
                                     iIdGrupo,
                                     dtmCAF.qryLookObraCODSUBCONTA.AsInteger,
                                     dtmCAF.qryLookObraUNIDNEGOC.AsInteger,
                                     dDataReavalia, fVlrObra,
                                     '', '', '', -1,
                                     cdsBemIDAVALIADOR.AsInteger,
                                     'Lançamento por Reavaliação' );
         if iIDObraLanc <= 0 then raise Exception.Create(CtrlCafObra.MessageInfo);

      end;
   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;



procedure TfrmExecReavaliacao.molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
begin
   inherited;
   molImovelouMestre1.btnBuscaImovelClick(Sender);
   // se for escolhido um Imóvel (ou Mestre), limpa a seleção de grupo e arq. de importacao
   if molImovelouMestre1.edtImovel.Text <> '' then begin
      DBcboGrupo.LookupValue := '';
      edtArqImporta.Clear;

      //Helio - SOL Nº 212226 KINTANA Nº 2037651
      cdsHistoricoVidaUtil.Data       := CtrlHistoricoVidaUtil.LookupHistoricoVidaUtilVigente( molImovelouMestre1.iImovel );

      cdsHistoricoVidaUtil.Edit;
      cdsHistoricoVidaUtil.FieldByName('IDIMOVEL').AsInteger := molImovelouMestre1.iImovel;
      cdsHistoricoVidaUtil.FieldByName('HIST_EVENTO').AsString := 'Reavaliação do Imóvel';
      cdsHistoricoVidaUtil.Post;
      //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651
   end;
end;

procedure TfrmExecReavaliacao.dbgBensCellChanged(Sender: TObject);
begin
  inherited;
//Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - INÍCIO
  bCtrl := false;
//Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - FIM
end;


procedure TfrmExecReavaliacao.dbgBensColEnter(Sender: TObject);
begin
  inherited;
//Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - INÍCIO
  dbgBens.Refresh;
//Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - FIM
end;

procedure TfrmExecReavaliacao.dbgBensKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - INÍCIO
  if Key = #13 then
    dbgBens.Refresh;
//Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - FIM
end;

procedure TfrmExecReavaliacao.qryBemALTChange(Sender: TField);
begin
  inherited;
//Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - INÍCIO

//Zera o percentual ou valor correspondente ao que foi alterado
//   if not bImporta then begin
//      case cdsBemALT.AsInteger of
//         1 : cdsBemVLR_REAVALIA.AsFloat := 0;
//         2 : cdsBemPERCENTUAL.AsFloat   := 0;
//      end;
//   end;

//Ádler T. Souza SOL Nº114792 KINTANA N° 538130 - FIM
end;

function TfrmExecReavaliacao.VerificaDetalheImport2018(
  var Importa: TImporta): Boolean;
  var i, iTotImp : Integer;
begin
   Result  := True;
   iTotImp := 0;
   // Verifica se os Bens existem em IMOVELXBEM
   i := 0;
   for i := 0 to Length(Importa.sTipoBem)-1 do
   begin
      if Importa.fVlrBem[i] <> 0 then
      begin
         Inc(iTotImp);

         // erro 15 : Imóvel sem bens ativos relacionados
         cdsImovelxBem.Filtered := False;
         cdsImovelxBem.Filter := 'IDIMOVEL = ' + IntToStr(Importa.iIdImovel) + ' AND BAIXATOTAL = ' + QuotedStr('N');
         cdsImovelxBem.Filtered := True;

         if cdsImovelxBem.IsEmpty then
         begin
            Result := GravaLogErro(-1,Importa.iIdImovel,-1,15);
            Exit;
         end;

         Importa.sImovel     := cdsImovelxBem.FieldByName('IMOVEL_EXTENSO').AsString;
         Importa.sTipoImo    := cdsImovelxBem.FieldByName('CODTIPIMOVEL').AsString;
         Importa.iIdConj     := cdsImovelxBem.FieldByName('IDCONJUNTO').AsInteger;

         // erro 11 : Existe mais de um bem do mesmo tipo para o imóvel ( IMOVELXBEM )
         cdsImovelxBem.Filtered := False;
         cdsImovelxBem.Filter := 'IDIMOVEL = ' + IntToStr(Importa.iIdImovel) + ' AND BAIXATOTAL = ' + QuotedStr('N') +
         ' AND IXBGRUPO = ' + QuotedStr(Importa.sTipoBem[i]);
         cdsImovelxBem.Filtered := True;

         if cdsImovelxBem.RecordCount > 1 then
         begin
            Result := GravaLogErro(-1,Importa.iIdImovel,-1,11,cdsImovelxBem.FieldByName('IMOCODIGO').AsString );
            Continue;
         end;

         // Erro 10: Tipo de bem não existe para o imóvel ( IMOVELXBEM )
         if (not ModuloImobiliario.InvestImob.bFlgReavCriaBem) and (cdsImovelxBem.IsEmpty) then
         begin
            Result := GravaLogErro(-1,Importa.iIdImovel,-1,10,cdsImovelxBem.FieldByName('IMOCODIGO').AsString );
            Continue;
         end;

         // Se existir um registro, reavalia, senão, inclui o bem
         if not cdsImovelxBem.IsEmpty then
         begin
            Importa.iIdBem[i]   := cdsImovelxBem.FieldByName('IDBEM').AsInteger;
            Importa.iIdGrupo[i] := cdsImovelxBem.FieldByName('IDGRUPO').AsInteger;
            Importa.sBem[i]     := cdsImovelxBem.FieldByName('DESBEM').AsString;
            Importa.sAcao[i]    := 'R';
         end
         else
         begin
            // Busca o tipo de bem a ser incluído
            cdsTipoImovel.Filtered := False;
            cdsTipoImovel.Filter := 'CODTIPIMOVEL = ' + QuotedStr(Importa.sTipoImo);
            cdsTipoImovel.Filtered := True;

            if Importa.sTipoBem[i] = 'I' then
            begin
              Importa.iIdGrupo[i] := cdsTipoImovel.FieldByName('IDGRUPOINST').AsInteger;
              Importa.sBem[i]     := Importa.sImovel + ' - ' + 'Instalações';
            end
            else
            if Importa.sTipoBem[i] = 'E' then
            begin
              Importa.iIdGrupo[i] := cdsTipoImovel.FieldByName('IDGRUPOEDIFICACAO').AsInteger;
              Importa.sBem[i]     := Importa.sImovel + ' - ' + 'Edificação';
            end
            else
            if Importa.sTipoBem[i] = 'T' then
            begin
              Importa.iIdGrupo[i] := cdsTipoImovel.FieldByName('IDGRUPOTERRENO').AsInteger;
              Importa.sBem[i]     := Importa.sImovel + ' - ' + 'Terreno';
            end;

            Importa.sAcao[i] := 'I';
            GravaLogErro(-1,Importa.iIdImovel,-1,16,cdsImovelxBem.FieldByName('IMOCODIGO').AsString, Importa.sBem[i] );
         end;
      end;
   end;

   // Erro 9: Qtde de Bens reavaliados inferior ao total de bens atuais do imóvel
   cdsImovelxBem.Filtered := False;
   cdsImovelxBem.Filter := 'IDIMOVEL = ' + IntToStr(Importa.iIdImovel) + ' AND BAIXATOTAL = ' + QuotedStr('N');
   cdsImovelxBem.Filtered := True;

   if (cdsImovelxBem.RecordCount > iTotImp) and (not ModuloImobiliario.InvestImob.bFlgReavBaixaBem) then
   begin
      Result := GravaLogErro(-1,Importa.iIdImovel,-1,9, cdsImovelxBem.FieldByName('MOCODIGO').AsString);
   end;

   // Exclui os bens não reavaliados ( não bloqueia o processo )
   if (cdsImovelxBem.RecordCount > iTotImp) and (ModuloImobiliario.InvestImob.bFlgReavBaixaBem) then
   begin
      // Verifica quais bens que não foram reavaliados e serão baixados
      while not cdsImovelxBem.Eof do
      begin
         for i := 0 to Length(Importa.sTipoBem)-1 do
         begin
            if (cdsImovelXBem.FieldByName('IXBGRUPO').AsString = Importa.sTipoBem[i]) and
               (Importa.fVlrBem[i] = 0) and (Importa.iIdBem[i] = -1) then
            begin
               Importa.iIdBem[i]   := cdsImovelXBem.FieldByName('IDBEM').AsInteger;
               Importa.sBem[i]     := cdsImovelXBem.FieldByName('DESBEM').AsString;
               Importa.iIdGrupo[i] := cdsImovelXBem.FieldByName('IDGRUPO').AsInteger;
               Importa.sImovel     := cdsImovelXBem.FieldByName('IMOVEL_EXTENSO').AsString;
               Importa.sTipoImo    := cdsImovelXBem.FieldByName('CODTIPIMOVEL').AsString;
               Importa.iIdConj     := cdsImovelXBem.FieldByName('IDCONJUNTO').AsInteger;
               Importa.sAcao[i]    := 'E';
               GravaLogErro(-1,Importa.iIdImovel,-1,17, cdsImovelxBem.FieldByName('IMOCODIGO').AsString, cdsImovelXBem.FieldByName('DESBEM').AsString);
               Break;
            end;
         end;
         cdsImovelXBem.Next;
      end;
   end;

   // Erro 9: OBRAS - Qtde de grupos reavaliados inferior ao total de grupos atuais da obra
   if (cdsImovelXBem.isEmpty) or
      (cdsImovelXBem.FieldByName('CODTIPIMOVEL').AsString = ModuloImobiliario.InvestImob.sCodTipImovelObra) then
   begin

      cdsObraReav.Filtered := False;
      cdsObraReav.Filter := 'IDIMOVEL = ' + IntToStr(Importa.iIdImovel) + ' AND DTLANCAMENTO = ' + QuotedStr(DateToStr(edtDataReavalia.Date));

      if (cdsObraReav.RecordCount > iTotImp) and (not ModuloImobiliario.InvestImob.bFlgReavBaixaBem) then
        Result := GravaLogErro(-1,Importa.iIdImovel,-1,9, cdsObraReav.FieldByName('IMOCODIGO').AsString);

      // Subtrai os bens reavaliados ( terreno )
      iTotImp := iTotImp - cdsImovelXBem.RecordCount;

      // Exclui os grupos de OBRAS não reavaliados ( não bloqueia o processo )
      if (cdsObraReav.RecordCount > iTotImp) and (ModuloImobiliario.InvestImob.bFlgReavBaixaBem) then
      begin
         // Verifica quais grupos que não foram reavaliados e serão baixados
         while not cdsObraReav.Eof do
         begin
            for i := 0 to Length(Importa.sTipoBem)-1 do
            begin
               if (cdsObraReav.FieldByName('TIPO').AsString = Importa.sTipoBem[i]) and
                  (Importa.fVlrBem[i] = 0) and (Importa.iIdBem[i] = -1) then
               begin
                  case Importa.sTipoBem[i][1] of
                     'T' : Importa.sBem[i] := 'Lançamentos de Terreno em Obras';
                     'E' : Importa.sBem[i] := 'Lançamentos de Edificação em Obras';
                     'I' : Importa.sBem[i] := 'Lançamentos de Instalações em Obras';
                  end;
                  Importa.iIdGrupo[i] := cdsObraReav.FieldByName('IDGRUPO').AsInteger;
                  Importa.sAcao[i]    := 'E';
                  GravaLogErro(-1,Importa.iIdImovel,-1,17, cdsObraReav.FieldByName('IMOCODIGO').AsString, Importa.sBem[i]);
                  Break;
               end;
            end;
            cdsObraReav.Next;
         end;
      end;
   end;

   // Erro 12 : Avaliador não cadastrado ( FORNECEDOR )
   cdsFornecedor.Filtered := False;
   cdsFornecedor.Filter := 'IDFORCLI = ' + IntToStr(Importa.iIdAvalia);
   cdsFornecedor.Filtered := True;

   if cdsFornecedor.IsEmpty then begin
      Result := GravaLogErro(-1,Importa.iIdImovel,-1,12,cdsImovelxBem.FieldByName('IMOCODIGO').AsString);
   end;
end;

procedure TfrmExecReavaliacao.molFornecedor1btnBuscaFornClick(
  Sender: TObject);
begin
  inherited;
  molFornecedor1.btnBuscaFornClick(Sender);

end;

end.

