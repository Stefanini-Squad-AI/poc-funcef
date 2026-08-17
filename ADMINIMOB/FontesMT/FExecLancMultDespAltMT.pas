{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina.............: bbtnInsereAlteradorClick, ContinuaPagNfs
//N. SIG.............: 117685
//Data da Alteração..: 29/07/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na forma de lançamento de alteradores de tributo.
//***************************************************************************************
//Rotina.............: DBcboTipoRecDesCloseUp
//N. SIG.............: 103856
//Data da Alteração..: 30/06/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de bloqueio no lançamento de tipos de despesa/receita.
//***************************************************************************************
//Rotina.............: VerificaPreenchimentoAlterador, btnContinuarClick,
//                     bbtnInsereAlteradorClick, btnExcluiAlteradorClick, btnVoltarClick,
//                     FormCreate
//N. SIG.............: 115585
//Data da Alteração..: 18/05/2021 
//Alteração Form.....: FExecLancMultDespAltMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Readequação das atribuições de tipo de serviço e valor base de NFS.
//***************************************************************************************
//Rotina.............: btnConfirmarClick, Inserir
//N. SIG.............: 93289
//Data da Alteração..: 08/11/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na alteração do lançamente, reenviando os dados das notas
//                     fiscais de serviço.
//***************************************************************************************
//N. SIG.............: 90052
//Data da Alteração..: 12/08/2019
//Alteração Form.....: FExecLancMultDespAltMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na consulta por tipos de serviço.
//***************************************************************************************
//Rotina.............: FormCreate, bbtnInsereAlteradorClick, btnExcluiAlteradorClick,
//                     btnContinuarClick, btnVoltarClick, ContinuaPagNfs
//N. SIG.............: 89101
//Data da Alteração..: 05/08/2019
//Alteração Form.....: FExecLancMultDespAltMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação da funcionalidade para a inclusão de Nota Fiscal de Serviço.
//***************************************************************************************
Rotina......: btnProcurarClick
N. SIG......: 83943
Data........: 04/04/2019
Responsável.: Fábio Sampaio
Descrição...: Correção na busca dos alteradores para retornar as informações da
              tabela LANCTODOCUM.
--------------------------------------------------------------------------------
Rotina......: inserir, integrar
N. Sol......: 222510
N. Kintana..: 2055739
Data........: 16/12/2013
Responsável.: Marcio Sanches Spinosa SOL 222510 KINTANA 2055739
Descrição...: Ajuste para lançamentos dos alteradores na tabela lanctodocum
--------------------------------------------------------------------------------
Rotina.............: btnExcluiImovel, btnInsereImovel
N. Sol.............: 107772/5681
N. Kintana.........: 1358973
Data...............: 07/05/2012
Responsável........: Edilaine Ferraresi
Descrição..........: busca de contrato devolvendo código errado, habilita inclusão
                     e exclusão de imóvel apenas se não houver imóveis no documento
--------------------------------------------------------------------------------
Pendência   : 24085
Responsável : Daniel Simões
Data        : 30/04/2007
Descrição   : Mudança na query do MontaSelect MS_Lancamento. Ela foi adaptada
              para carregar Imóveis ou Unidades pertencentes ao contrato.
--------------------------------------------------------------------------------
Pendência   : 22688
Responsável : Daniel Simões
Data        : 23/02/2007
Descrição   : 1. Verifica se usuário está bloqueado no CFINAN para realizar
                 qualquer tipo de lançamento até a data disponível definida no
                 CFINAN...

              2. Criada parametrização ( fParamAdminImob ) para permitir ou não
                 lançamentos gerados com Data de Vencimento anterior a Data de
                 Lançamento...
--------------------------------------------------------------------------------
Pendência   : 22993
Responsável : Daniel Simões
Data        : 16/01/2007
Descrição   : Implementação do campo Histórico Complementar para integração com
              o Contas a Pagar conforme já implementado no lançamento de
              receitas...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecLancMultDespAltMT;
{
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------}

//	------------------------------------------------------------------------
//	Alteração de Lançamento Múltiplo de Despesas
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  28/05/2003
//	Data de Término   :  30/05/2003
//
//	------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdblook, TREdit, Mask, wwdbedit, Wwdbspin, wwdbdatetimepicker,
  CMDateTimePicker, mFornecedor, TEdNum, Grids, Wwdbigrd, Wwdbgrid,
  DBTables, Db, Wwquery, Wwdatsrc, MontaSelect, uCMTypes, mOrcamento,
  uCtrlLancamentosImovel, uCMClientDataSet, uCtrlTipoCustoRecImov, DBClient, uCtrlFormaRecPag,
  uCtrlTipoImovel, uCmSqlParams, uCalcDocumento, uCtrlOrcamento, uCtrlContratoImovel,
  uCtrlCentroCusto, uCtrlBanco,
  // Helen - SOL: 172902 KTN: 1577381
   uCtrlContab;

type
  TfrmExecLancMultDespAltMT = class(TfrmWizardMT)
    panLancamentos: TPanel;
    Label22: TLabel;
    Label10: TLabel;
    lblContaBancaria: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lblReferenciaAP: TLabel;
    lblCentroCusto: TLabel;
    lblIntegrado: TLabel;
    molFornecedor1: TmolFornecedor;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    lblDataVencimento: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    edtDataLanc: TCMDateTimePicker;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    dbCboContaBancaria: TwwDBLookupCombo;
    edtNumDocumento: TEdit;
    DBcboTipoRecDes: TwwDBLookupCombo;
    edtReferenciaAP: TEdit;
    DBcboCentroCusto: TwwDBLookupCombo;
    memObs: TMemo;
    chkContrato: TCheckBox;
    btnProcurar: TfcShapeBtn;
    MS_Lancamento: TMontaSelect;
    dsAlterador: TwwDataSource;
    pgcLancamentos: TPageControl;
    tbsLancamentos: TTabSheet;
    DBgrdLancamentos: TwwDBGrid;
    tbsErro: TTabSheet;
    memErro: TMemo;
    Panel3: TPanel;
    btnExcluiImovel: TfcShapeBtn;
    btnInsereImovel: TfcShapeBtn;
    btnTotaliza: TfcShapeBtn;
    Label4: TLabel;
    edtTotalLanc: TRealEdit;
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    Label9: TLabel;
    Label14: TLabel;
    rdgAcreDesc: TRadioGroup;
    DBcboAlterador: TwwDBLookupCombo;
    edtValor: TEditNum;
    edtNumAP: TEdit;
    Label1: TLabel;
    gbPeriodoCtbDiaria: TGroupBox;
    Label11: TLabel;
    Label28: TLabel;
    edtDtinictbdiaria: TCMDateTimePicker;
    edtDtfimctbdiaria: TCMDateTimePicker;
    molOrcamento1: TmolOrcamento;
    cdsDespesa: TCMClientDataSet;
    cdsAlteradorXTipoImovel: TCMClientDataSet;
    dsImoveis: TwwDataSource;
    CMSqlParams1: TCMSqlParams;
    cdsAlterador: TCMClientDataSet;
    chkIntegra: TCheckBox;
    cdsImoveis: TCMClientDataSet;
    cdsImoveisCODTIPIMOVEL: TStringField;
    cdsImoveisIMOCODIGO: TStringField;
    cdsImoveisDSC_IMOVEL: TStringField;
    cdsImoveisCONTRATO_EXTENSO: TStringField;
    cdsImoveisVLRLANCPAGAR: TFloatField;
    cdsImoveisIDCONTRATOIMOVEL: TFloatField;
    cdsImoveisVLRIMOVEL: TFloatField;
    DBgrdLancamentosIButton: TwwIButton;
    cdsAlteradorIDDOCUMENTO: TFloatField;
    cdsAlteradorCODALTERADOR: TFloatField;
    cdsAlteradorVLRALTERADOR: TFloatField;
    cdsAlteradorCODTIPIMOVEL: TStringField;
    cdsAlteradorDESCRICAO: TStringField;
    cdsImoveisIDIMOVEL: TFloatField;
    cdsImoveisCONNOME: TStringField;
    cdsImoveisCONNUMERO: TStringField;
    cdsCCusto: TCMClientDataSet;
    cdsCCustoCODCENTROCUSTO: TStringField;
    cdsCCustoIDEMPRESA: TFloatField;
    cdsCCustoNOME: TStringField;
    cdsContaBancaria: TCMClientDataSet;
    cdsFormaRecPag: TCMClientDataSet;
    DBcboFormaRecPag: TwwDBLookupCombo;
    Label6: TLabel;
    edtObsAlt: TEdit;
    cdsAlteradorOBSERVACAO: TStringField;
    edtHistLanc: TEdit;
    Label30: TLabel;
    cdsAlteradorACRESDECRES: TStringField;
    tsNFS: TTabSheet;
    lblNFSNumero: TLabel;
    edtNFSNumero: TEdit;
    fcLabel4: TfcLabel;
    lblNFSSerie: TLabel;
    edtNFSSerie: TEdit;
    lblNFSDataEmissao: TLabel;
    dtpNFSDataEmissao: TCMDateTimePicker;
    lblNFSValor: TLabel;
    edtValorBrutoNFS: TRealEdit;
    lblNFSObs: TLabel;
    mmNFSObs: TMemo;
    cdsAlteradorFLGLANCANFS: TStringField;
    cdsProcessos: TCMClientDataSet;
    cdsTipoServico: TCMClientDataSet;
    lblTipoServico: TLabel;
    dbLkpTipoServico: TwwDBLookupCombo;
    lblProcesso: TLabel;
    dbLkpProcessos: TwwDBLookupCombo;
    lblValorBase: TLabel;
    edtValorBase: TRealEdit;
    pnlAlteradoresGerados: TPanel;
    Panel4: TPanel;
    bbtnInsereAlterador: TBitBtn;
    btnExcluiAlterador: TBitBtn;
    DBgrdAlteradoresLanc: TwwDBGrid;
    cdsAlteradorIDTIPOSERVICO: TFloatField;
    cdsAlteradorIDPROCESSO: TFloatField;
    cdsAlteradorVALORBASERETENCAO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBgrdLancamentosCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdLancamentosTopRowChanged(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure btnInsereImovelClick(Sender: TObject);
    procedure btnExcluiImovelClick(Sender: TObject);
    procedure btnTotalizaClick(Sender: TObject);
    procedure rdgAcreDescClick(Sender: TObject);
    procedure molFornecedor1btnBuscaFornClick(Sender: TObject);
    procedure bbtnInsereAlteradorClick(Sender: TObject);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure DBcboFormaRecPagCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure DBcboTipoRecDesCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure edtDataLancChange(Sender: TObject);
    procedure DBcboAlteradorChange(Sender: TObject);
  private
    { Private declarations }

    CtrlLancImovel     : TCtrlLancamentosImovel;
    CtrlTipoDespesa    : TCtrlTipoCustoRecImov;
    CtrlFormaRecPag    : TCtrlFormaRecPag;
    CtrlTipoImovel     : TCtrlTipoImovel;
    CtrlOrcamento      : TOrcamentoBackMT;
    CtrlContratoImovel : TCtrlContratoImovel;
    CtrlCentroCusto    : TCtrlCentroCusto;
    CtrlBanco          : TCtrlBanco;
    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381

    iResult       : smallint;
    sTipoImovel   : string;
    iDocumento    : integer;
    iPlanilha     : integer;
    iCodDocumento : integer;
    iNumAp        : integer;
    dDataLancto   : TDateTime;
    iTiposImoveis : integer;
    sMotivoRespon : string;
    LancamentoOK  : boolean;

    bIndicaNFS: boolean; //Cássio Rovaroto - SIG nº 89101
    bMsgAlteradorRetencao : boolean; //Cássio Rovaroto - SIG nº 115585

    procedure AbreTipoAlterador;
    procedure VerificaContaBancaria;
    procedure CalculaDataCtbDiaria;

    function  Inserir: Boolean;
    function  VerificaPreenchimento: Boolean;
    function  VerificaPreenchimentoAlterador: Boolean;
    function  VerificaTipoImoveisLanc : Boolean;
    function  VerificaFechamentoDiario(const dDataFim: TDateTime): Boolean;
    function  BuscaContratoImovel(const iIdImovel: Integer): Boolean;
    function  TotalizaRateio(var fTotalRateio: Extended): Boolean;
    function  TotalDocumento: Extended;
    function  ContinuaPagSelecao : Boolean;
    function  ContinuaPagImovel  : Boolean;
    function  VoltaPagImovel     : Boolean;
    function  ContinuaPagNfs: boolean; //Cássio Rovaroto - SIG nº 89101
  public
    { Public declarations }
  end;

var
  frmExecLancMultDespAltMT: TfrmExecLancMultDespAltMT;

implementation

{$R *.DFM}

uses
   USistema, UMensErro, UDatabase, UComunsImobiliario, uVerificaPreenchimento, UModuloAdminImob, UDiasInUteis,
   dImobiliario, dLookImobiliario, uFuncoesImob, uMolduras,
   DMS, dLancImovel, dRelLancamento, uCMRptManager, uImpostoRetido, uModuloImobiliario,
   FProgresso, fAguarde, dBaseDados;

procedure TfrmExecLancMultDespAltMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Marcio Motta - 27/02/2004 - Pendência: 16112
  CtrlLancImovel  := TCtrlLancamentosImovel.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   Sistema.UsaPlanoPatro);
  CtrlContratoImovel := TCtrlContratoImovel.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   Sistema.UsaPlanoPatro);
  CtrlTipoDespesa    := TCtrlTipoCustoRecImov.Create;
  CtrlFormaRecPag    := TCtrlFormaRecPag.Create;
  CtrlTipoImovel     := TCtrlTipoImovel.Create;
  CtrlCentroCusto    := TCtrlCentroCusto.Create;
  CtrlBanco          := TCtrlBanco.Create;

  CtrlLancImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                            ComunsImobiliario.MensErroMT);
  CtrlTipoDespesa.InitializeAs(CtrlLancImovel);
  CtrlFormaRecPag.InitializeAs(CtrlLancImovel);
  CtrlTipoImovel.InitializeAs(CtrlLancImovel);
  CtrlContratoImovel.InitializeAs(CtrlLancImovel);
  CtrlCentroCusto.InitializeAs(CtrlLancImovel);
  CtrlBanco.InitializeAs(CtrlLancImovel);

  // Habilita o Nr. do Orçamento apenas quando a integração estiver ligada
  molOrcamento1.Clear;
  if ModuloImobiliario.AdminImob.bFlgIntegraOrcamen then begin
     CtrlOrcamento := TOrcamentoBackMT.Create;
     CtrlOrcamento.InitializeAs( CtrlLancImovel );
     CtrlOrcamento.IdEmpresa := Sistema.IdEmpresa;
     CtrlOrcamento.IdUsuario := Sistema.IdUsuario;
     molOrcamento1.Visible := True;
     lblIntegrado.Left := 511;
  end else begin
     molOrcamento1.Visible := False;
     lblIntegrado.Left := 623;
  end;

  cdsDespesa.Data     := CtrlTipoDespesa.LookupTipoCustoRecImov(Sistema.IdModulo,'C');
  cdsFormaRecPag.Data := CtrlFormaRecPag.ListFormaRecPag(Sistema.IdEmpresa,0,'P');
  cdsCCusto.Data      := CtrlCentroCusto.ListaCCustoUsrAtivos(Sistema.IdEmpresa, Sistema.IdUsuario,0);

  // Fim - Marcio Motta ----------------------------

  molFornecedor1.iFornecedor := -1;
  lblIntegrado.Visible       := False;

  if ModuloImobiliario.AdminImob.bFlgHistContDifAP then
       memObs.MaxLength := 1000    // histórico contábil (concatenado) <> obs ap
  else memObs.MaxLength := 200;    // histórico contábil = obs ap

  // Apenas exibe o período da Ctb diária, se o mesmo estiver ativado no parâmetro
  if ModuloImobiliario.AdminImob.bFlgDiario then begin
     gbPeriodoCtbDiaria.Visible := True;

// Daniel - 22993 [ Ajustei o posicionamento dos componentes e comentei os anteriores ]
     lblReferenciaAP.Top        := 269; //246;
     edtReferenciaAP.Top        := 283; //260;
     lblCentroCusto.Top         := 310; //286;
     dbcboCentroCusto.Top       := 324; //300;
     chkContrato.Top            := 312; //288;
     chkContrato.Left           := 360;
     chkIntegra.Top             := 334; //310;
     chkIntegra.Left            := 360;
// Daniel - 22993 [ Ajustei o posicionamento dos componentes e comentei os anteriores ]

  end else begin
     gbPeriodoCtbDiaria.Visible := False;
     lblReferenciaAP.Top        := 206;
     edtReferenciaAP.Top        := 220;
     lblCentroCusto.Top         := 246;
     dbcboCentroCusto.Top       := 260;
     chkContrato.Top            := 288;
     chkContrato.Left           := 16;
     chkIntegra.Top             := 310;
     chkIntegra.Left            := 16;
  end;
  // Helen - SOL: 172902 KTN: 1577381
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlLancImovel);

  bIndicaNFS := False; //Cássio Rovaroto - SIG nº 89101

  //Cássio Rovaroto - SIG nº 115585 - Início
  dbLkpTipoServico.Visible := False;
  dbLkpProcessos.Visible := False;
  edtValorBase.Visible := False;
  bMsgAlteradorRetencao := True;
  //Cássio Rovaroto - SIG nº 115585 - Fim  
end;

procedure TfrmExecLancMultDespAltMT.FormShow(Sender: TObject);
begin
  inherited;
  LancamentoOK := False;
  IrParaPagina(0);
  btnProcurar.Enabled  := True;
  btnContinuar.Enabled := False;
end;

function TfrmExecLancMultDespAltMT.VerificaPreenchimento: Boolean;
var
  iDia, iMes, iAno, iDifMeses, iAnoComp, iMesComp: word;

  // Marcio Motta - 18/02/2004 - Pendência: 16112
  iAnoLancContab, iMesLancContab, iDiaLancContab: word;
  //------- Fim Implementação/Alteração - Marcio Motta -------------------------------

  dDia1, dDia2: TDateTime;
  iAnoMesContab, iAnoMesIniCtb, iAnoMesFimCtb : Integer;

begin
// Marcio Motta - 18/02/2004 - Pendência: 16112
// Alterado para pegar a data de Lançamento contábil ao invés da data de Competência

   Result := False;
   try
      iAnoComp := Word(trunc(DBspnAno.Value));
      iMesComp := cboMes.ItemIndex + 1;

      if (DBcboTipoRecDes.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Despesa a ser rateada!', DBcboTipoRecDes);

      if ( molFornecedor1.iFornecedor = -1 ) then
         raise EValidacao.CreateVal('É necessário indicar o Fornecedor/Favorecido!', molFornecedor1.btnBuscaForn);

      if ( dbCboContaBancaria.Enabled ) and ( dbCboContaBancaria.LookupValue = '' ) then
         raise EValidacao.CreateVal('É necessário a conta bancária!', dbCboContaBancaria);

      if (edtVlrTotal.Value <= 0) then
         raise EValidacao.CreateVal('É necessário indicar o Valor Total a ser rateado!', edtVlrTotal);

      if (cboMes.ItemIndex = -1) then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if (length(trim(edtDataVenc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if (length(trim(edtDataLanc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLanc);

      // Decodifica a data de Lançamento Contábil
      DecodeDate(edtDataLanc.Date, iAnoLancContab, iMesLancContab, iDiaLancContab);

      // Se não for permitido efetuar lançamento contábil fora do período gerencial
      if not ModuloImobiliario.AdminImob.bFlgLancForaComp then begin
         dDia1 := DiasInUteis.UltDiaMes (iAnoComp, iMesComp);
         if edtDataLanc.Date > dDia1 then
            raise EValidacao.CreateVal('A data de lançamento não pode ser após a sua competência!', edtDataLanc);
      end;

// Daniel - 22688 - Início -----------------------------------------------------
      {Não permitir efetuar o lançamento caso a Data de Vencimento seja anterior
       a Data de Lançamento}
      if (ModuloImobiliario.AdminImob.bFlgBloqDtLanc) then begin
        if (edtDataVenc.Date<edtDataLanc.Date) then
          raise EValidacao.CreateVal('Não é permitido realizar lançamentos após a data de vencimento!',edtDataVenc);
      end;
// Daniel - 22688 - Fim --------------------------------------------------------

      // Se a data de Lançamento contábil for menor que a data de competência
      if (iAnoLancContab < DBspnAno.Value) or (iMesLancContab < cboMes.ItemIndex + 1) then
         if MsgDlg ('A data de lançamento digitada é inferior a data de competência. Continua?', 'AdminImob', mtConfirmation, [mbyes,mbno], 0) = MrNo then
           raise EValidacao.CreateVal('Altere data de Lançamento.', edtDataLanc);

      { 20/06
        se possui contabilização diária
           se despesas/receitas com periodicidade mensal
              a competencia contabil do lançamento somente pode ser igual a competencia
              atual ou no máximo o nr. de meses definido no parametro
      }

      if ModuloImobiliario.AdminImob.bFlgDiario then begin

         if (cdsDespesa.FieldByName('FLGDIARIO').AsString = 'M') or
            (cdsDespesa.FieldByName('FLGDIARIO').AsString = 'A') then begin

            if (length(trim(edtDtinictbdiaria.Text)) = 0) then
               raise EValidacao.CreateVal('É necessário indicar a Data de início da Contabilização!', edtDtinictbdiaria);

            if (length(trim(edtDtfimctbdiaria.Text)) = 0) then
               raise EValidacao.CreateVal('É necessário indicar a Data de término da Contabilização!', edtDtfimctbdiaria);

            if (edtDtinictbdiaria.Date > edtDtfimctbdiaria.Date) then
               raise EValidacao.CreateVal('Data de início da Contabilização diária não deve ser superior a data de término!', edtDtfimctbdiaria);
         end;

         if cdsDespesa.FieldByName('FLGDIARIO').AsString = 'M' then begin
            // Pega a data definida na tela de parêmentros
            // Primeiro dia permitido para o Lançamento
            dDia1 := EncodeDate(ModuloImobiliario.AdminImob.iAnoCompetencia,
                                ModuloImobiliario.AdminImob.iMesCompetencia, 1);

            // Pega a data de Lançamento Contábil
            dDia2 := EncodeDate(iAnoLancContab, iMesLancContab, 1);

            // Se data de Lançamento Contábil for menor que a data informada na tela de Parâmetros
            if dDia2 < dDia1 then begin  // tentativa de lançar em um mes anterior
               raise EValidacao.CreateVal('A data de lançamento informada pertence a um período já encerrado!', edtDataLanc);
            end else begin

               // Pega a diferença de meses entre o período definido na tela de parâmetros
               // e a data de lançamento contábil
               iDifMeses := DiasInUteis.IntervaloMeses(dDia1, dDia2);

               // Verifica a diferença de meses existente.
               // Se estiver dentro do permitido, apenas avise ao usuário
               // Senão informa que não será permitido efetuar o lançamento no período
               if iDifMeses < ModuloImobiliario.AdminImob.iMesBloqLancto then
                  MsgDlg('O período para a data de lançamento informada ainda não foi inicializado.', 'Informação', mtInformation, [mbok], 0)
               else if iDifMeses > ModuloImobiliario.AdminImob.iMesBloqLancto then
                  raise EValidacao.CreateVal('O período para a data de lançamento informada é superior ao permitido, execute o encerramento mensal!', edtDataLanc);
            end;

            // Decodifica a data inicial da contab. diária
            DecodeDate(edtDtinictbdiaria.Date, iAno, iMes, iDia);

            // O período INICIAL da contabilização diária deve estar dentro do
            // período de lançamento contábil
            if (iAno <> iAnoLancContab) or (iMes <> iMesLancContab) then
               raise EValidacao.CreateVal('Data de início da Contabilização diária deve estar dentro da Competência Contábil!', edtDtinictbdiaria);

            // Decodifica a data final da contab. diária
            DecodeDate(edtDtfimctbdiaria.Date, iAno, iMes, iDia);

            // O período FINAL da contabilização diária deve estar dentro do
            // período de lançamento contábil
            if (iAno <> iAnoLancContab) or (iMes <> iMesLancContab) then
               raise EValidacao.CreateVal('Data de término da Contabilização diária deve estar dentro da Competência Contábil!', edtDtfimctbdiaria);

         end else if cdsDespesa.FieldByName('FLGDIARIO').AsString = 'A' then begin
            // Monta Mês e Ano da data de lançamento contábil
            iAnoMesContab := StrToInt(FormatFloat('0999',iAnoLancContab) + FormatFloat('09',iMesLancContab));

            // Decodifica a data INICIAL da contabilização DIÁRIA
            DecodeDate(edtDtinictbdiaria.Date, iAno, iMes, iDia);

            // Monta Mês e Ano da data INICIAL d contabilização DIÁRIA
            iAnoMesIniCtb := StrToInt(FormatFloat('0999',iAno) + FormatFloat('09',iMes));

            // Decodifica a data FINAL da contabilização DIÁRIA
            DecodeDate(edtDtfimctbdiaria.Date, iAno, iMes, iDia);

            // Monta Mês e Ano FINAL da contabilização DIÁRIA
            iAnoMesFimCtb := StrToInt(FormatFloat('0999',iAno) + FormatFloat('09',iMes));

            // A competência contábil do Lançamento deve estar compreendida entre o período da
            // contabilização diária informado
            if (iAnoMesContab < iAnoMesIniCtb) or (iAnoMesContab > iAnoMesFimCtb) then
               raise EValidacao.CreateVal('A Competência deve estar compreendida entre o período da Contabilização Diária!', edtDtInictbdiaria);
         end;
      end;
      // Helen - SOL: 172902 KTN: 1577381 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataVenc.Text) then
      begin
         edtDataVenc.setfocus;
         exit;
      end;
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLanc.Text) then
      begin
         edtDataLanc.SetFocus;
         exit;
      end;
      // Helen - SOL: 172902 KTN: 1577381 - Fim

      // verifica se o vencimento escolhido é um dia inútil
      if ModuloImobiliario.AdminImob.bFlgDiaUtilAP then begin
         if DayOfWeek(edtDataVenc.Date) in [1, 7] then
            raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edtDataVenc);
      end;

      // verifica o preenchimento dos campos abrigatórios p/ APs
      if ModuloImobiliario.AdminImob.bFlgUsaAP then begin
         if (DBcboFormaRecPag.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar a Forma de Pagamento!', DBcboFormaRecPag);

         if (length(trim(edtReferenciaAP.Text)) = 0) then
            raise EValidacao.CreateVal('É necessário indicar a Referência / Processo!', edtReferenciaAP);

         if (DBcboCentroCusto.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCusto);
      end;
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



function TfrmExecLancMultDespAltMT.VerificaPreenchimentoAlterador: Boolean;
var fValor: Extended;
begin
   Result := False;
   try
      if (DBcboAlterador.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o alterador!', DBcboAlterador);

      try
         fValor := StrToFloat(edtValor.Text);
      except
         fValor := 0;
      end;

      if fValor = 0 then
         raise EValidacao.CreateVal('É necessário indicar um valor válido!', edtValor);

      //Cássio Rovaroto - SIG nº 115585 - Início
      if (dbLkpTipoServico.Visible) and (dbLkpTipoServico.Text =  '') then
        raise EValidacao.createVal('Para este lançamento, informe o tipo de serviço.', dbLkpTipoServico);
      if edtValorBase.Visible then
      begin
        if (edtValorBase.Value = 0) or (edtValorBase.Text = '') then
          raise EValidacao.createVal('Para esta lançamento, informe o valor base de retenção.', edtValorBase)
        else
          if (bMsgAlteradorRetencao) then
            if MessageDlg('O valor base de retenção deste tributo é realmente de R$' + FloatToStrF(edtValorBase.Value, ffNumber, 15, 2) + '?', mtInformation, [mbYes, mbNo], 0) = mrNo then
            begin
              edtValorBase.SetFocus;
              Result := False;
              bMsgAlteradorRetencao := False;
              Exit;
            end;
      end;
      //Cássio Rovaroto - SIG nº 115585 - Fim
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

function TfrmExecLancMultDespAltMT.VerificaTipoImoveisLanc: Boolean;
var sTipoImovelAnt, sTipoImovelAtual : string;
begin
   Result := False;

   if not ModuloImobiliario.AdminImob.bFlgMultiTipo then begin
      try
         with cdsImoveis do begin
            First;
            sTipoImovelAnt := cdsImoveis.FieldByName('CODTIPIMOVEL').AsString;
            while not EOF do begin
               sTipoImovelAtual := cdsImoveis.FieldByName('CODTIPIMOVEL').AsString;

               if (sTipoImovelAtual <> sTipoImovelAnt) then
                  raise Exception.Create('Para efetuar o lançamento é necessário que TODOS os Imóveis sejam do mesmo Tipo!');
               Next;
            end;
         end;
      except
         on e: Exception do begin
            MsgDlg(e.message, 'Aviso', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;
      end;
      sTipoImovel := sTipoImovelAnt;
   end else sTipoImovel := cdsImoveis.FieldByName('CODTIPIMOVEL').AsString;
   Result := True;
end;

function TfrmExecLancMultDespAltMT.TotalizaRateio(var fTotalRateio: Extended): Boolean;
begin
   Result        := True;
   fTotalRateio  := 0;
   Screen.Cursor := crHourGlass;

   cdsImoveis.DisableControls;
   cdsImoveis.First;

   while not cdsImoveis.EOF do begin
      fTotalRateio := fTotalRateio + Arredonda(cdsImoveis.FieldByName('VLRIMOVEL').AsFloat, 2);
      if (cdsImoveis.FieldByName('IDCONTRATOIMOVEL').IsNull) and (chkContrato.Checked) then Result := False;
      cdsImoveis.Next;
   end;

   cdsImoveis.First;
   cdsImoveis.EnableControls;

   fTotalRateio         := Arredonda(fTotalRateio, 2);
   edtTotalLanc.Value   := fTotalRateio;

   Screen.Cursor := crDefault;
end;

procedure TfrmExecLancMultDespAltMT.AbreTipoAlterador;
var
  sAcreDecres : string;

begin
//---------- 27/02/2004 - Marcio Motta ---- Pendência : 16082 -----------------------

   // Monta a string com os tipos diferentes de imóveis para passar para a função do ctrlObject
   // Conta a quantidade diferente de tipos de imóveis existentes
   iTiposImoveis := 0;
   sTipoImovel := '';
   cdsImoveis.First;

   while not cdsImoveis.Eof do begin
      if pos(cdsImoveis.FieldByName('CODTIPIMOVEL').AsString, sTipoImovel) = 0 then begin
         inc(iTiposImoveis);
         if sTipoImovel = '' then
            sTipoImovel := cdsImoveis.FieldByName('CODTIPIMOVEL').AsString
         else if (iTiposImoveis = 2) then
            sTipoImovel := QuotedStr(sTipoImovel) + ',' + QuotedStr(cdsImoveis.FieldByName('CODTIPIMOVEL').AsString)
         else
            sTipoImovel := sTipoImovel + ',' + QuotedStr(cdsImoveis.FieldByName('CODTIPIMOVEL').AsString)
      end;
      cdsImoveis.Next;
   end;

   // Define se é de acréscimo ou decréscimo para passar para a função do ctrlObject
   case rdgAcreDesc.ItemIndex of
      0: sAcreDecres := 'C'; // Acréscimo
      1: sAcreDecres := 'D'; // Desconto
   end;

   // Carrega o CDS chamando uma função do ctrlObject
   cdsAlteradorXTipoImovel.Data := CtrlTipoImovel.LookupAlteradoXTipoImo(
                                   Sistema.idEmpresa, -1, sTipoImovel, 'P', sAcreDecres);

//------- Fim Implementação/Alteração - Marcio Motta -------------------------------

end;


function TfrmExecLancMultDespAltMT.TotalDocumento: Extended;
var fTotLanc : Extended;
begin

   fTotLanc := 0;
   chkContrato.Checked := True;

   cdsImoveis.First;
   while not(cdsImoveis.EOF) do begin
      fTotLanc := fTotLanc + cdsImoveis.FieldByName('VLRIMOVEL').AsFloat;
      if cdsImoveis.FieldByName('IDCONTRATOIMOVEL').IsNull then chkContrato.Checked := False;
      cdsImoveis.Next;
   end;

   Result := fTotLanc;
end;


procedure TfrmExecLancMultDespAltMT.DBgrdLancamentosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmExecLancMultDespAltMT.DBgrdLancamentosTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecLancMultDespAltMT.cboMesChange(Sender: TObject);
begin
  inherited;
  edtDataLanc.Date := FuncoesImob.DataLancamento((cboMes.ItemIndex + 1), word(trunc(DBspnAno.Value)), edtDataVenc.Date);
  CalculaDataCtbDiaria;
end;

procedure TfrmExecLancMultDespAltMT.btnInsereImovelClick(Sender: TObject);
var iImovel  : integer;
    MS_      : TMontaSelect;
    iIndiceCodTipImovel: integer;  
    bGravaContrato : Boolean;
    iIndCodImovel  : integer;  // Edilaine - SOL 1077772-5681 / KTN 1358973
begin
  inherited;

// Daniel - 24085 - Início -----------------------------------------------------
  if (ModuloImobiliario.AdminImob.bFlgUsaUnidade) then begin
    // Verifica se é necessário indicar o contrato nos Lançamentos a pagar
    if chkContrato.Checked then begin
      {Verifica se é possível indicar um contrato já encerrado nos Lançamentos a
       pagar}
      if (ModuloImobiliario.AdminImob.bFlgLancPagEncerra) then
        MS_ := dtmMS.MS_UnidadeContrato
      else
        MS_ := dtmMS.MS_UnidadeContratoV;

      iIndiceCodTipImovel := 8;
      iIndCodImovel       := 9;  // Edilaine - SOL 1077772-5681 / KTN 1358973
    end else begin
      if (ModuloImobiliario.AdminImob.bFlgLancPagInativo) then
        MS_ := dtmMS.MS_Unidade
      else
        MS_ := dtmMS.MS_UnidadeAtiva;

      iIndiceCodTipImovel := 4;
      iIndCodImovel       := 10; // Edilaine - SOL 1077772-5681 / KTN 1358973
    end;
  end else begin
// Daniel - 24085 - Início -----------------------------------------------------

    // Verifica se é necessário indicar o contrato nos Lançamentos a pagar
    if chkContrato.Checked then begin
      {Verifica se é possível indicar um contrato já encerrado nos Lançamentos a
       pagar}
      if (ModuloImobiliario.AdminImob.bFlgLancPagEncerra) then
        MS_ := dtmMS.MS_ImovelContrato
      else
        MS_ := dtmMS.MS_ImovelContratoV;

      iIndiceCodTipImovel := 8;
      iIndCodImovel       := 9;  // Edilaine - SOL 1077772-5681 / KTN 1358973
    end else begin
      if (ModuloImobiliario.AdminImob.bFlgLancPagInativo) then
        MS_ := dtmMS.MS_Imovel
      else
        MS_ := dtmMS.MS_ImovelAtivo;

      iIndiceCodTipImovel := 4;
      iIndCodImovel       := 7;  // Edilaine - SOL 1077772-5681 / KTN 1358973
    end;
  end; // Fim 24085

  MS_.MultiSelect := True;
  MS_.Executar;
  Repaint;

  // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
  if MS_.RetornouValor then begin
    Screen.Cursor := crHourGlass;

    // VALIA - Por motivo de lançamento de Histórico retroativo durante a implantação,
    // pergunta se inclui contratos.
    bGravaContrato := True;
    if ( (Sistema.TipoCliente = 20041) and (dbSpnAno.Value <= 2004) ) then begin
       if MsgDlg('Grava os contratos relacionados aos imóveis?','Confirma',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
          bGravaContrato := False;
       end;
    end;

    while MS_.GetNextSelected do begin

       // Imóvel
       cdsImoveis.Insert;
       cdsImoveis.FieldByName('IDIMOVEL').AsInteger      := StrToInt(MS_.ValoresChave[1]);
       cdsImoveis.FieldByName('DSC_IMOVEL').AsString := MS_.ValoresChave[2] + ' - ' + MS_.ValoresChave[3];

       // Contrato
       if bGravaContrato then begin
          if chkContrato.Checked then begin
             if StrToInt(MS_.ValoresChave[0]) > 0 then begin
                cdsImoveis.FieldByName('IDCONTRATOIMOVEL').asInteger := StrToInt(MS_.ValoresChave[iIndCodImovel]);   // Edilaine - SOL 1077772-5681 / KTN 1358973
                cdsImoveis.FieldByName('CONNUMERO').AsString         := MS_.ValoresChave[4];
                cdsImoveis.FieldByName('CONNOME').AsString           := MS_.ValoresChave[5];
                cdsImoveis.FieldByName('CONTRATO_EXTENSO').AsString  := MS_.ValoresChave[4] + ' - ' + MS_.ValoresChave[5];
             end;
          end else begin
             BuscaContratoImovel( cdsImoveis.FieldByName('IDIMOVEL').AsInteger );
          end;
       end;

       cdsImoveis.FieldByName('CODTIPIMOVEL').AsString := MS_.ValoresChave[iIndiceCodTipImovel];

// Daniel - 24085 - Início -----------------------------------------------------
       if (ModuloImobiliario.AdminImob.bFlgUsaUnidade) then begin
         // Verifica se o Imóvel está ativo...
         if (MS_<>dtmMS.MS_UnidadeAtiva) then begin
           if ((MS_<>dtmMS.MS_Unidade) and (MS_.ValoresChave[6]<>'1')) or (MS_=dtmMS.MS_Unidade) then begin
             if not (ModuloImobiliario.AdminImob.bFlgLancPagInativo) then begin
               Screen.Cursor := crDefault;
               MsgDlg('O Imóvel escolhido não está ativo! Não é possível atribuir-lhe uma despesa.',
                      'Aviso',mtWarning,[mbOk],0);
               Repaint;
               cdsImoveis.Cancel;
               Exit;
             end;
           end;
         end;
       end else begin
// Daniel - 24085 - Fim --------------------------------------------------------

         // Verifica se o Imóvel está ativo
         if MS_ <> dtmMS.MS_ImovelAtivo then begin
            if ( (MS_ <> dtmMS.MS_Imovel) and (MS_.ValoresChave[6] <> '1') ) or
                 (MS_ =  dtmMS.MS_Imovel) then begin
               if not ModuloImobiliario.AdminImob.bFlgLancPagInativo then begin
                  Screen.Cursor := crDefault;
                  MsgDlg('O Imóvel escolhido não está ativo! Não é possível atribuir-lhe uma despesa.', 'Aviso', mtWarning, [mbOk], 0);
                  Repaint;
                  cdsImoveis.Cancel;
                  Exit;
               end else begin
                 // Marca o documento para liberação
               end;
            end;
         end;
       end; // Fim 24085

       cdsImoveis.Post;
    end;
    Screen.Cursor := crDefault;
  end else begin
    // cancela a inserção na query
    cdsImoveis.Cancel;
  end;
end;

procedure TfrmExecLancMultDespAltMT.btnExcluiImovelClick(Sender: TObject);
var fTotalRateio : Extended;
begin
   inherited;              //Eraldo Silva SOL 107772/5681 KINTANA 1358973 INICIO
   if not cdsImoveis.isEmpty then begin
      Screen.Cursor := crHourGlass;
      cdsImoveis.Delete;
      if not cdsImoveis.isEmpty then begin
         TotalizaRateio( fTotalRateio );
      end else begin
         edtTotalLanc.Value := 0;
      end;
      Screen.Cursor := crDefault;
   end;
end;

procedure TfrmExecLancMultDespAltMT.btnTotalizaClick(Sender: TObject);
var fTotalRateio : Extended;
begin
   inherited;
   TotalizaRateio( fTotalRateio );
end;

procedure TfrmExecLancMultDespAltMT.rdgAcreDescClick(Sender: TObject);
begin
  inherited;
  AbreTipoAlterador;
end;

procedure TfrmExecLancMultDespAltMT.VerificaContaBancaria;
begin
   if (molFornecedor1.iFornecedor <> -1) and (DBcboFormaRecPag.LookupValue <> '') and (cdsFormaRecPag.FieldByName('FLGDADOSBANCARIOS').AsString = 'S') then begin
      lblContaBancaria.Enabled   := True;
      dbCboContaBancaria.Enabled := True;

      cdsContaBancaria.Data := CtrlBanco.LookupContabancaria(molFornecedor1.iFornecedor);

      if cdsContaBancaria.RecordCount > 1 then begin
         cdsContaBancaria.First;
         while not cdsContaBancaria.Eof do begin
            if cdsContaBancaria.FieldByName('FLGCONTAPREF').AsInteger = 1 then begin
               dbCboContaBancaria.LookupValue := IntToStr(cdsContaBancaria.FieldByName('IDCBANCARIA').AsInteger);
               Exit;
            end;
            cdsContaBancaria.Next;
         end;
      end else if cdsContaBancaria.RecordCount = 1 then begin
         dbCboContaBancaria.LookupValue := IntToStr(cdsContaBancaria.FieldByName('IDCBANCARIA').AsInteger);
      end;

   end else begin
      lblContaBancaria.Enabled       := False;
      dbCboContaBancaria.Enabled     := False;
      dbCboContaBancaria.LookupValue := '';
   end;

end;

procedure TfrmExecLancMultDespAltMT.molFornecedor1btnBuscaFornClick(Sender: TObject);
begin
  inherited;
  molFornecedor1.btnBuscaFornClick(Sender);
  VerificaContaBancaria;
end;

procedure TfrmExecLancMultDespAltMT.bbtnInsereAlteradorClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimentoAlterador then
   begin
    cdsAlterador.Insert;
    cdsAlterador.FieldByName('CODALTERADOR').AsInteger := cdsAlteradorXTipoImovel.FieldByName('CODALTERADOR').AsInteger;
    cdsAlterador.FieldByName('IDDOCUMENTO').AsInteger  := iDocumento;
    cdsAlterador.FieldByName('VLRALTERADOR').AsFloat   := StrToFloat(edtValor.Text);
    cdsAlterador.FieldByName('DESCRICAO').AsString     := DBcboAlterador.Text;
    cdsAlteradorOBSERVACAO.AsString                    := edtObsAlt.Text;   // Vinícius - 01/10/2004 - Pendência 17787
    cdsAlterador.FieldByName('CODTIPIMOVEL').AsString  := cdsAlteradorXTipoImovel.FieldByName('CODTIPIMOVEL').AsString;
    //Marcio Sanches Spinosa SOL 222510 KINTANA 2055739 - Inicio
    if (rdgAcreDesc.itemIndex = 0) then
      cdsAlterador.FieldByName('ACRESDECRES').AsString := 'C'
    else
      cdsAlterador.FieldByName('ACRESDECRES').AsString := 'D';
    //Marcio Sanches Spinosa SOL 222510 KINTANA 2055739 - Fim
    cdsAlteradorFLGLANCANFS.AsString := cdsAlteradorXTipoImovel.FieldByName('FLGLANCANFS').AsString; //Cássio Rovaroto - SIG nº 89101

    //Cássio Rovaroto - SIG nº 115585 - Início
    if (dbLkpTipoServico.LookupValue = '') then
      cdsAlterador.FieldByName('IDTIPOSERVICO').AsInteger := -1
    else
      cdsAlterador.FieldByName('IDTIPOSERVICO').AsInteger := cdsTipoServico.FieldByName('IDTIPOSERVICO').AsInteger;

    if (dbLkpProcessos.LookupValue = '') then
      cdsAlterador.FieldByName('IDPROCESSO').asInteger := -1
    else
      cdsAlterador.FieldByName('IDPROCESSO').asInteger := cdsProcessos.FieldByName('IDPROCESSO').asInteger;

    cdsAlterador.FieldByName('VALORBASERETENCAO').AsFloat := edtValorBase.Value; //Cássio Rovaroto - SIG nº 117685
    //Cássio Rovaroto - SIG nº 115585 - Fim
    cdsAlterador.Post;

    //Cássio Rovaroto - SIG nº 89101 - Início
    if not (bIndicaNFS) and (cdsAlteradorFLGLANCANFS.AsString = 'S') then
    begin
      bIndicaNFS := True;
      btnConfirmar.Enabled := False;
      btnContinuar.Enabled := True;
      MsgDlg('A inclusão desse alterador obriga a inserção de informações ' + #13#10 + ' da Nota Fiscal, a partir da próxima etapa.', 'Aviso', mtInformation, [mbOK], 0);
    end;
    //Cássio Rovaroto - SIG nº 89101 - Fim

    //Cássio Rovaroto - SIG nº 115585 - Início
    DBcboAlterador.LookupValue := '';
    edtValor.Text := EmptyStr;
    edtObsAlt.Text := EmptyStr;
    rdgAcreDesc.ItemIndex := 0;
    lblTipoServico.Visible := False;
    dbLkpTipoServico.Visible:= False;
    dbLkpTipoServico.LookupValue := '';
    lblProcesso.Visible := False;
    dbLkpProcessos.Visible := False;
    dbLkpProcessos.LookupValue := '';
    lblValorBase.Visible := False;
    edtValorBase.Visible := False;
    edtValorBase.Text := EmptyStr;
    pnlAlteradoresGerados.Top := 136;
    rdgAcreDescClick(Self);
    //Cássio Rovaroto - SIG nº 115585 - Fim
   end;
end;

procedure TfrmExecLancMultDespAltMT.btnExcluiAlteradorClick(Sender: TObject);
var
  bComNFS: boolean;
begin
  inherited;
  //Cássio Rovaroto - SIG nº 89101 - Início
  bComNFS := False;

  //if not cdsAlterador.IsEmpty then cdsAlterador.Delete;
  if not cdsAlterador.IsEmpty then
  begin
    cdsAlterador.Delete;

    cdsAlterador.First;

    while not cdsAlterador.Eof do
    begin
      if cdsAlteradorFLGLANCANFS.AsString = 'S' then
      begin
        bComNFS := True;
        bIndicaNFS := False;
        btnConfirmar.Enabled := False;
        btnContinuar.Enabled := True;
        Break;
      end;
      cdsAlterador.Next;
    end;

    if not bComNFS then
    begin
      bIndicaNFS := False;
      btnConfirmar.Enabled := True;
      btnContinuar.Enabled := False;
    end;
    cdsAlterador.First;
  end;
  //Cássio Rovaroto - SIG nº 89101 - Fim

  //Cássio Rovaroto - SIG nº 115585 - Início
  DBcboAlterador.LookupValue := '';
  edtValor.Text := EmptyStr;
  edtObsAlt.Text := EmptyStr;
  rdgAcreDesc.ItemIndex := 0;
  lblTipoServico.Visible := False;
  dbLkpTipoServico.Visible:= False;
  lblProcesso.Visible := False;
  dbLkpProcessos.Visible := False;
  lblValorBase.Visible := False;
  edtValorBase.Visible := False;
  pnlAlteradoresGerados.Top := 136;
  //Cássio Rovaroto - SIG nº 115585 - Fim
end;

procedure TfrmExecLancMultDespAltMT.DBcboFormaRecPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  VerificaContaBancaria;
end;

procedure TfrmExecLancMultDespAltMT.btnProcurarClick(Sender: TObject);
var
  dDataFim : TDateTime;
  cdsTemp : TCMClientDataSet;
begin
   inherited;
   MS_Lancamento.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   if MS_Lancamento.RetornouValor then begin
      // Marcio Motta - 27/02/2004 - Pendência: 16112
      try
         LancamentoOk := False;
         cdsTemp      := TCMClientDataSet.Create(self);
         cdsTemp.Data := CtrlLancImovel.LookupLancImob( StrToInt(MS_Lancamento.ValoresChave[6]) );

         // Verifica se a contabilização diária já está fechada
         if cdsTemp.FieldByName('DTFIMCTBDIARIA').IsNull then
            dDataFim := -1
         else
            dDataFim := cdsTemp.FieldByName('DTFIMCTBDIARIA').AsDateTime;
         if not VerificaFechamentoDiario(dDataFim) then Exit;

         // Verifica se o lançamento já foi integrado e guarda o nr. da AP
         if cdsTemp.FieldByName('FLGINTEGRADO').IsNull then begin
            // Guarda o Nr. da AP já impressa

            if cdsTemp.FieldByName('NUMAPGR').IsNull then
               iNumAp := -1
            else
               iNumAp := cdsTemp.FieldByName('NUMAPGR').AsInteger;

            lblIntegrado.Caption := 'Integrado';
         end else begin
            if cdsTemp.FieldByName('NUMAPALT').IsNull then
               iNumAp := -1
            else
               iNumAp := cdsTemp.FieldByName('NUMAPALT').AsInteger;
            lblIntegrado.Caption := 'Não Integrado';
         end;

         if iNumAp > 0 then
              edtNumAP.Text := IntToStr(iNumAp)
         else edtNumAp.Clear;
         lblIntegrado.Visible := True;

         // atribuir valores antigos
         DBcboTipoRecDes.LookupValue := cdsTemp.FieldByName('IDTIPOCUSTORECIMO').AsString;
         molFornecedor1.iFornecedor  := cdsTemp.FieldByName('IDFORCLI').AsInteger;
         AtribuiMolFornecedor(molFornecedor1.iFornecedor, molFornecedor1.edtNomeFantasia, molFornecedor1.edtRazaoSocial);

         iDocumento                     := cdsTemp.FieldByName('IDDOCUMENTO').AsInteger;
         iCodDocumento                  := cdsTemp.FieldByName('CODDOCUMENTO').AsInteger;
         dDataLancto                    := cdsTemp.FieldByName('DATALANCAMENTO').AsDateTime;
         edtNumDocumento.Text           := cdsTemp.FieldByName('NODOCUMENTO').AsString;
         DBcboFormaRecPag.LookupValue   := cdsTemp.FieldByName('CODFORMA').AsString;

         if not cdsTemp.FieldByName('PLNCODIGO').IsNull then
              iPlanilha := cdsTemp.FieldByName('PLNCODIGO').AsInteger
         else iPlanilha := -1;

         if not cdsTemp.FieldByName('CODDOCUMENTO').IsNull then
              iCodDocumento := cdsTemp.FieldByName('CODDOCUMENTO').AsInteger
         else iCodDocumento := -1;

         molOrcamento1.Clear;
         if not cdsTemp.FieldByName('IDRESERVAORCAMEN').IsNull then begin
            molOrcamento1.iIdCompromisso   := cdsTemp.FieldByName('IDRESERVAORCAMEN').AsInteger;
            molOrcamento1.iNumCompromisso  := CtrlOrcamento.BuscaIdNumReserva(StrToInt(FloatToStr(molOrcamento1.iIdCompromisso)),0,True);
            molOrcamento1.edtCompOrc.Value := molOrcamento1.iNumCompromisso;
         end;

         // conta bancaria = o componente pode estar not enabled
         VerificaContaBancaria;  // ativa o combo conta bancária
         dbCboContaBancaria.LookupValue := cdsTemp.FieldByName('IDCBANCARIA').AsString;

         cboMes.ItemIndex               := cdsTemp.FieldByName('MESCOMPETENCIA').AsInteger - 1;
         DBspnAno.Value                 := cdsTemp.FieldByName('ANOCOMPETENCIA').AsInteger;
         edtDataVenc.Date               := cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime;
         edtDataLanc.Date               := cdsTemp.FieldByName('DATALANCAMENTO').AsDateTime;
         edtReferenciaAP.Text           := cdsTemp.FieldByName('REFERENCIAAP').AsString;
         DBcboCentroCusto.LookupValue   := cdsTemp.FieldByName('CODCENTROCUSTO').AsString;
         edtDtinictbdiaria.Date         := cdsTemp.FieldByName('DTINICTBDIARIA').AsDateTime;
         edtDtfimctbdiaria.Date         := cdsTemp.FieldByName('DTFIMCTBDIARIA').AsDateTime;
         memObs.Text                    := FuncoesImob.SelectObsLanc(iDocumento);

         // Daniel - 22993
         edtHistLanc.Text               := cdsTemp.FieldByName('OBS').AsString;

         if edtDtinictbdiaria.Text = '' then begin
            edtDtinictbdiaria.Enabled := False;
            edtDtfimctbdiaria.Enabled := False;
         end;

         // Marcio Motta - 27/02/2004 - Pendência: 16112
         cdsImoveis.Data   := CtrlLancImovel.LookupImoveisDocum(iDocumento);
         // Alterado por FHBS - 04/04/2019 - SIG83943
         // Adicionado o parametro True para que a busca seja feita na LANCTODOCUM ao invés da ALTERALANCIMOVEL
         cdsAlterador.Data := CtrlLancImovel.LookupAlteradoresDocum(iDocumento, True);
         // Fim - Alterado por FHBS - 04/04/2019 - SIG83943

         // Edilaine - SOL 1077772-5681 / KTN 1358973
         { não pode permitir que seja incluído/excluído imóvel(is) em um documento
           que foi gerado com rateio de valores entre grupo de imóveis/contratos }
         btnInsereImovel.Visible := cdsImoveis.IsEmpty;
         btnExcluiImovel.Visible := cdsImoveis.IsEmpty;
         // Edilaine - SOL 1077772-5681 / KTN 1358973 - fim

         edtVlrTotal.Value := TotalDocumento;

         panLancamentos.Enabled := True;
         btnContinuar.Enabled   := True;
      finally
         FreeAndNil(cdsTemp);
      end;
   end;

end;

function TfrmExecLancMultDespAltMT.VerificaFechamentoDiario(const dDataFim: TDateTime): Boolean;
var iDia, iMes, iAno: word;
    dDia1, dDia2: TDateTime;
begin
   Result := True;
   if ModuloImobiliario.AdminImob.bFlgDiario then begin
      if dDataFim > 0 then begin
         DecodeDate(dDataFim, iAno, iMes, iDia);
         dDia1 := EncodeDate(iAno, iMes, 1);
         dDia2 := EncodeDate(ModuloImobiliario.AdminImob.iAnoCompetencia,
                             ModuloImobiliario.AdminImob.iMesCompetencia, 1);

         if dDia1 < dDia2 then begin
            MsgDlg('A Competência já foi encerrada, o lançamento não poderá ser alterado','Aviso',mtWarning,[mbok],0);
            Result := False;
         end;
      end;
   end;
end;

procedure TfrmExecLancMultDespAltMT.btnContinuarClick(Sender: TObject);
begin
  case PagControle.ActivePageIndex of
     0 : if ContinuaPagSelecao then inherited;
     1 : if ContinuaPagImovel  then
     //Cássio Rovaroto - SIG nº 89101 - Início
     begin
      inherited;
      AbreTipoAlterador;
      cdsAlterador.Data := CtrlLancImovel.LookupAlteradoresDocum(-2);
      PagControle.ActivePageIndex := 2;
      btnContinuar.Enabled := False;
      btnConfirmar.Enabled := True;

      //Cássio Rovaroto - SIG nº 115585 - Início
      cdsTipoServico.Data := CtrlLancImovel.ListTipoServico;
      cdsProcessos.Data := CtrlLancImovel.ListProcessos(molFornecedor1.iFornecedor, edtDataLanc.DateTime);
      pnlAlteradoresGerados.Top := 136;
      lblTipoServico.Visible := False;
      dbLkpTipoServico.Visible := False;
      lblProcesso.Visible := False;
      dbLkpProcessos.Visible := False;
      lblValorBase.Visible := False;
      edtValorBase.Visible := False;
      //Cássio Rovaroto - SIG nº 115585 - Fim
     end;
     2:
      if btnContinuar.Enabled then
      begin
        inherited;
        dtpNFSDataEmissao.Date := edtDataLanc.Date;
        edtValorBrutoNFS.Value := edtVlrTotal.Value;
        PagControle.ActivePageIndex := 3;
        btnContinuar.Enabled := False;
        btnConfirmar.Enabled := True;
        edtNFSNumero.SetFocus;
      end;
     //Cássio Rovaroto - SIG nº 89101 - Fim
  end;
end;

procedure TfrmExecLancMultDespAltMT.btnVoltarClick(Sender: TObject);
begin
  case PagControle.ActivePageIndex of
     1 : if VoltaPagImovel then inherited;
     2 : if VoltaPagImovel then inherited;
     //Cássio Rovaroto - SIG nº 89101 - Início
     3 : if VoltaPagImovel then
     		 begin
          PagControle.ActivePageIndex := 2;
          btnContinuar.Enabled := True;
          btnConfirmar.Enabled := False;
          //Cássio Rovaroto - SIG nº 115585- Início
          lblTipoServico.Visible := False;
          dbLkpTipoServico.Visible := False;
          lblValorBase.Visible := False;
          edtValorBase.Visible := False;
          lblProcesso.Visible := False;
          dbLkpProcessos.Visible := False;
          pnlAlteradoresGerados.Top := 136;
          //Cássio Rovaroto - SIG nº 115585 - Fim
         end;
     //Cássio Rovaroto - SIG nº 89101 - Fim
  end;
end;

function TfrmExecLancMultDespAltMT.ContinuaPagImovel: Boolean;
var fTotalRateio : Extended;
begin
   Result := False;
   if not VerificaTipoImoveisLanc then exit;

   if not TotalizaRateio( fTotalRateio ) then begin
     MsgDlg('Existem imóveis no grupo que não estão locados, ' +#13+
            'sendo que este lançamento obriga a informação do contrato', 'Aviso', mtWarning, [mbok], 0);
     exit;
   end;

   // o total lançado tem que bater com o total do lançamento
   if Arredonda(fTotalRateio,2) <> Arredonda(edtVlrTotal.Value,2) then begin
      MsgDlg('Total do lançamento não confere com o valor lançado.','Aviso',mtwarning,[mbok],0);
      exit;
   end;

   AbreTipoAlterador;
   Result := True;
end;

function TfrmExecLancMultDespAltMT.ContinuaPagSelecao: Boolean;
begin
   Result := False;
   // Confirma a alteração de um documento já integrado
   if lblIntegrado.Caption = 'Integrado' then begin
      if MsgDlg('A alteração de um documento já integrado implicará na EXCLUSÃO ' + #13#10 +
                'das integrações já realizadas, sendo necessário que o documento' + #13#10 +
                'seja integrado novamente. Confirma ? ', 'Atenção', mtWarning, [mbYes, mbNo],0) = mrNo then begin
         Exit;
      end;
   end;
   // Abre a query de rateio imovel
   if VerificaPreenchimento then begin
      Result := True;
      btnProcurar.Enabled := False; 
   end;
end;

function TfrmExecLancMultDespAltMT.VoltaPagImovel: Boolean;
begin
  if PagControle.ActivePageIndex = 1 then btnProcurar.Enabled := True;  ;
  Result := True;
end;

procedure TfrmExecLancMultDespAltMT.btnConfirmarClick(Sender: TObject);
var sMsg: string;
    fTotalRateio : Extended;
begin
   if not VerificaTipoImoveisLanc then exit;

   TotalizaRateio( fTotalRateio );

   // o total lançado tem que bater com o total do lançamento
   if Arredonda(fTotalRateio,2) <> Arredonda(edtVlrTotal.Value,2) then begin
      MsgDlg('Total do lançamento não confere com o valor lançado.','Aviso',mtwarning,[mbok],0);
      exit;
   end;

   // Busca ID da reserva de orçamento caso tenha sido digitado, ao invés de buscar no MontaSelect
   if molOrcamento1.edtCompOrc.Value > 0 then
        molOrcamento1.iIdCompromisso := CtrlOrcamento.BuscaIdNumReserva(0, StrToInt(FloatToStr(molOrcamento1.edtCompOrc.Value)), True)
   else molOrcamento1.Clear;

   //Cássio Rovaroto - SIG nº 89101 - Início
   if bIndicaNFS then
   begin
     if not ContinuaPagNfs  then
      Exit;
   end;
   //Cássio Rovaroto - SIG nº 89101 - Fim

   StartTransacao;

   try
      frmAguarde.Mostra('Excluindo o documento anterior... ');
      if not CtrlLancImovel.Excluir(iDocumento, False) then
         raise Exception.Create(CtrlLancImovel.MessageInfo);

      frmAguarde.Apaga;

      if not Inserir then
         raise Exception.Create('Erro ao Inserir o Lançamento');

      if not LancamentoOK then begin
         CommitTransacao;
         if (length(trim(memErro.Text)) = 0) then begin
            Screen.Cursor := crDefault;
            if MsgDlg('Lançamento concluído. Deseja imprimir para conferência?', 'Pergunta', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                TdtmRelLancamento.PrintRelLancamento(iDocumento, -1, 1, Sistema.IdEmpresa, Sistema.IdUsuario,
                                                     Sistema.IdModulo, '', '', 'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo,
                                                     sMsg, nil, cntBDE, rdtScreen, true, true, true, false, nil, false);
            Repaint;
            // Limpa o frame de Orçamento
            molOrcamento1.Clear;
            // Retorna a pagina inicial
            IrParaPagina(0);
            btnProcurar.Enabled := True;

            //Cássio Rovaroto - SIG nº 93289 - Início
            bIndicaNFS := False;
            btnConfirmar.Enabled := False;
            btnContinuar.Enabled := True;
            //Cássio Rovaroto - SIG nº 93289 - Fim
         end;
         LancamentoOK := True;
      end;
   except
      frmAguarde.Apaga;

      RollBackTransacao;
      MsgDlg('Ocorreu um ERRO na tentativa de Alteração! O Lançamento não foi gerado.' +#13#10 +
             'Verifique as ocorrências geradas.', 'Erro', mtError, [mbOk], 0);
      IrParaPagina(1);
      //Cássio Rovaroto - SIG nº 93289 - Início
      bIndicaNFS := False;
      btnConfirmar.Enabled := False;
      btnContinuar.Enabled := True;
      //Cássio Rovaroto - SIG nº 93289 - Fim
      pgcLancamentos.ActivePageIndex := 1;
      Repaint;
   end;
end;

function TfrmExecLancMultDespAltMT.BuscaContratoImovel(const iIdImovel: Integer): Boolean;
var
  sSql : String;
  cdsTemp : TCMClientDataSet;
begin
   Result := False;
   try
      cdsTemp := TCMClientDataSet.Create(Self);
      cdsTemp.Data := CtrlContratoImovel.LookupContratosDoImovel(iIdImovel);
      if not cdsTemp.IsEmpty then begin
         with cdsTemp do begin
            cdsImoveis.FieldByName('IDCONTRATOIMOVEL').AsInteger := FieldByName('IDCONTRATOIMOVEL').AsInteger;
            cdsImoveis.FieldByName('CONNUMERO').AsString         := FieldByName('CONNUMERO').AsString;
            cdsImoveis.FieldByName('CONNOME').AsString           := FieldByName('CONNOME').AsString;
            cdsImoveis.FieldByName('CONTRATO_EXTENSO').AsString  := FieldByName('CONTRATO_EXTENSO').AsString;
            Result := True;
         end;
      end;
   finally
      FreeAndNil(cdsTemp);
   end;
end;

procedure TfrmExecLancMultDespAltMT.CalculaDataCtbDiaria;
var iAnoLancContab, iMesLancContab, iDiaLancContab : word;
begin
// Marcio Motta - 18/02/2004 - Pendência: 16112
// Alterado para pegar a data de Lançamento contábil ao invés da data de Competência

  // para a data de lancamento contabil
  if ModuloImobiliario.AdminImob.bFlgDiario then
    begin
      // Se Tipo de Despesa e Período de Competência estiverem preenchidos
      if (DBcboTipoRecDes.Text <> '') and (cboMes.Text <> '') and (DbspnAno.Value > 0) then
        begin
          // Decodifica a data de Lançamento contábil
          DecodeDate(edtDataLanc.DateTime,iAnoLancContab,iMesLancContab,iDiaLancContab);

          // Se período de contabilização diária for MENSAL
          if cdsDespesa.FieldByName('FLGDIARIO').AsString = 'M' then
            begin
              // Habilita os Edits das Datas
              edtDtinictbdiaria.Enabled := True;
              edtDtfimctbdiaria.Enabled := True;
              // Atribui a Data Inicial o primeiro dia do Mês ref. Lançamento contábil
              edtDtinictbdiaria.Date    := EncodeDate(iAnoLancContab,iMesLancContab,1);
              // Atribui a Data Final o último dia do Mês ref. Lançamento contábil
              edtDtfimctbdiaria.Date    := DiasUteis.UltDiaMes(iAnoLancContab,iMesLancContab);
            end
          else
            // Se período de contabilização diária for NÃO MENSAL
            if cdsDespesa.FieldByName('FLGDIARIO').AsString = 'A' then
              begin
                // Habilita os Edits das Datas
                edtDtinictbdiaria.Enabled := True;
                edtDtfimctbdiaria.Enabled := True;
                // Atribui a Data Inicial o primeiro dia do Ano ref. Lançamento contábil
                edtDtinictbdiaria.Date    := EncodeDate(iAnoLancContab,1,1);
                // Atribui a Data Final o último dia do Ano ref. Lançamento contábil
                edtDtfimctbdiaria.Date    := EncodeDate(iAnoLancContab,12,31);
              end
            else
              begin
                // Se período de Contabilização diária não estiver definido
                // Desabilita os Edits das datas
                edtDtinictbdiaria.Enabled := False;
                edtDtfimctbdiaria.Enabled := False;
                // Limpa o Conteúdo dos Edits das Datas
                edtDtinictbdiaria.Clear;
                edtDtfimctbdiaria.Clear;
              end;
        end
     else
        begin
           // Apaga as datas INICIAL e FINAL de Contabilização DIÁRIA
           edtDtinictbdiaria.Clear;
           edtDtfimctbdiaria.Clear;
        end;
    end;
end;

procedure TfrmExecLancMultDespAltMT.DBcboTipoRecDesCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  CalculaDataCtbDiaria;
  //Cássio Rovaroto - SIG nº 103856 - Início
  if cdsDespesa.FieldByName('FLGRECCUSTCONTRATO').AsInteger = 1 then
  begin
    chkContrato.Checked := True;
    chkContrato.Enabled := False;

    MsgDlg('Este tipo despesa é restrito a contratos registrados.', 'Aviso', mtWarning, [mbOK], 0);
  end
  else
  begin
    chkContrato.Checked := False;
    chkContrato.Enabled := True;
  end;
  //Cássio Rovaroto - SIG nº 103856 - Fim

end;

procedure TfrmExecLancMultDespAltMT.FormDestroy(Sender: TObject);
begin
  // Marcio Motta - 27/02/2004 - Pendência: 16112
  FreeAndNil (CtrlLancImovel);
  FreeAndNil (CtrlTipoDespesa);
  FreeAndNil (CtrlFormaRecPag);
  FreeAndNil (CtrlTipoImovel);
  FreeAndNil (CtrlContratoImovel);
  FreeAndNil (CtrlCentroCusto);
  FreeAndNil (CtrlBanco);
  if Assigned(CtrlOrcamento) then FreeAndNil(CtrlOrcamento);
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
  inherited;
end;

procedure TfrmExecLancMultDespAltMT.edtDataLancChange(Sender: TObject);
begin
  inherited;
  CalculaDataCtbDiaria;
end;


function TfrmExecLancMultDespAltMT.Inserir: Boolean;
var sMsg: string;
    iIdFormaRecPag, iIdCtaBanco : Integer;
    dIniCtbDiaria, dFimCtbDiaria : TDateTime;
    iCodErroLiberacao : Integer;
begin
   Result := True;

   // Limpa o mol de orçamento caso o valor seja excluído manualmente do campo
   if (molOrcamento1.edtCompOrc.Value <= 0) then molOrcamento1.Clear;

   // Busca ID da reserva de orçamento caso tenha sido digitado, ao invés de buscar no MontaSelect
   if (molOrcamento1.edtCompOrc.Value > 0) and (molOrcamento1.iIdCompromisso < 0) then begin
      molOrcamento1.iIdCompromisso := CtrlOrcamento.BuscaIdNumReserva(0, StrToInt(FloatToStr(molOrcamento1.edtCompOrc.Value)), True);
   end;

   // Guarda o codigo de erro de liberação de responsabilidade para gravar o motivo da conciliação
   iCodErroLiberacao := CtrlLancImovel.CodigoErroLiberacao;

   btnConfirmar.Enabled := False;
   memErro.Text := '';

   try
      // Inicializa campos opcionais
      iIdFormaRecPag := -1;
      iIdCtaBanco    := -1;
      dIniCtbDiaria  := -1;
      dFimCtbDiaria  := -1;

      if DBcboFormaRecPag.LookupValue <> '' then
        iIdFormaRecPag := StrToInt(DBcboFormaRecPag.LookupValue);

      if dbCboContaBancaria.Value <> '' then
        iIdCtaBanco := StrToInt(dbCboContaBancaria.LookupValue);

      if (length(trim(edtDtinictbdiaria.Text)) > 0) then
        dIniCtbDiaria := edtDtinictbdiaria.Date;

      if (length(trim(edtDtfimctbdiaria.Text)) > 0) then
        dFimCtbDiaria := edtDtfimctbdiaria.Date;

      CtrlLancImovel.pisMultiplaDespesa := True;//Marcio Sanches Spinosa SOL 222510 KINTANA 2055739
      // Grava o registro na LancamentosImovel
      if not CtrlLancImovel.Inserir(cboMes.ItemIndex + 1,
                                    word(trunc(DBspnAno.Value)),
                                    molFornecedor1.iFornecedor,
                                    StrToInt(DBcboTipoRecDes.LookupValue),
                                    iIdFormaRecPag,
                                    -1, // Daniel - 24872
                                    molOrcamento1.iIdCompromisso,
                                    iIdCtaBanco,
                                    Modulo.iMoedaCorrente,
                                    iDocumento,
                                    iNumAP,
                                    StrToFloat(edtNumDocumento.Text),
                                    edtVlrTotal.Value,
                                    edtVlrTotal.Value,
                                    'M',     // M = Lançamentos Múltiplos
                                    'P',     // p = Contas a Pagar
                                    edtReferenciaAP.Text,
                                    memObs.Text,
                                    DBcboCentroCusto.LookupValue,
                                    edtHistLanc.Text, // Daniel - 22993
                                    edtDataVenc.Date,
                                    edtDataLanc.Date,
                                    dIniCtbDiaria,
                                    dFimCtbDiaria,
                                    cdsImoveis.Data,
                                    cdsAlterador.Data,
                                    chkIntegra.Checked, FALSE,
                                    //Cássio Rovaroto - SIG nº 93289 - Início
                                    0, false, 0, '',
                                    edtNFSNumero.Text,
                                    edtNFSSerie.Text,
                                    dtpNFSDataEmissao.Date,
                                    mmNFSObs.Text
                                    //Cássio Rovaroto - SIG nº 93289 - Fim
                                     ) then
        raise exception.Create( '' );

      CtrlLancImovel.pisMultiplaDespesa := False;//Marcio Sanches Spinosa SOL 222510 KINTANA 2055739        
      // Grava o Motivo de Conciliação para a liberação de responsabilidade
      if iCodErroLiberacao > 0 then begin
         // Excluir o motivo que possa ter sido incluido anteriormente
         CalcDocumento.ApagarMotivoConciliacao(iDocumento, -1, 'L');
         // Inserir o motivo da liberação
         CalcDocumento.GravarMotivoConciliacao(iDocumento, -1, Sistema.IdUsuario, -1, -1,
                                               Null, Null, sMotivoRespon, 'L');
      end;
   except
      on e : Exception do begin
        Result := False;

        if Length(e.message) > 0 then
           MsgDlg(e.message, 'Erro', mtError, [mbOk], 0);

        // Busca a liberação da responsabilidade pelo lançamento
        if (CtrlLancImovel.CodigoErroLiberacao <> 0) then begin
           if MsgDlg('Libera a responsabilidade pela Despesa ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
              sMotivoRespon := '';
              if InputQuery('Justificativa para Liberação', 'Motivo', sMotivoRespon) then begin
                 CtrlLancImovel.CodigoErroLiberacao := Abs(CtrlLancImovel.CodigoErroLiberacao);
                 RollBackTransacao;
                 Result := True;
                 btnConfirmarClick( Self );
              end else begin
                 IrParaPagina(1);
                 pgcLancamentos.ActivePage := tbsLancamentos;
                 Repaint;
              end;
           end else begin
              IrParaPagina(1);
              pgcLancamentos.ActivePage := tbsLancamentos;
              Repaint;
           end;
        end else begin
           IrParaPagina(1);
           pgcLancamentos.ActivePage := tbsLancamentos;
           Repaint;
        end;
      end;
   end;
end;

function TfrmExecLancMultDespAltMT.ContinuaPagNfs: boolean;
begin
  Result := false;

  if edtNFSNumero.Text <> EmptyStr then
    Result := True
  else
  begin
    MsgDlg('É obrigatória a inclusão do número da nota fiscal de serviço.', 'Aviso', mtWarning, [mbOk], 0);
    Result := False;
    edtNFSNumero.SetFocus;
    Exit;
  end;

  if dtpNFSDataEmissao.Date <> 0 then
    Result := True
  else
  begin
    MsgDlg('É obrigatória a inclusão da data de emissão da nota fiscal de serviço.', 'Aviso', mtWarning, [mbOk], 0);
    Result := False;
    dtpNFSDataEmissao.SetFocus;
    Exit;
  end;

  if (dtpNFSDataEmissao.Date <> edtDataLanc.Date) and (dtpNFSDataEmissao.Date > Date) then
  begin
    MsgDlg('A data de emissão da nota fiscal não pode ser definida para um período futuro.', 'Aviso', mtWarning, [mbOk], 0);
    Result := False;
    dtpNFSDataEmissao.SetFocus;
    Exit;
  end
  else
    Result := True;

  //Cássio Rovaroto - SIG nº 117685 - Início
  (*if dbLkpTipoServico.LookupValue <> '' then
      Result := True
  else
  begin
    MsgDlg('É obrigatória a definição de um tipo de serviço.', 'Aviso', mtWarning, [mbOk], 0);
    Result := False;
    dbLkpTipoServico.SetFocus;
    Exit;
  end;*)
  //Cássio Rovaroto - SIG nº 117685 - Início

end;

procedure TfrmExecLancMultDespAltMT.DBcboAlteradorChange(Sender: TObject);
begin
  inherited;
  if cdsAlteradorXTipoImovel.FieldByName('FLGLANCANFS').AsString = 'S' then
  begin
    lblTipoServico.Visible := True;
    dbLkpTipoServico.Visible := True;
    dbLkpTipoServico.LookupValue := '';

    if not cdsProcessos.IsEmpty then
    begin
      pnlAlteradoresGerados.Top := 215;
      lblProcesso.Visible := True;
      dbLkpProcessos.LookupValue := '';
      dbLkpProcessos.Visible := True;
    end
    else
    begin
      pnlAlteradoresGerados.Top := 175;
      lblProcesso.Visible := False;
      dbLkpProcessos.Visible := False;
    end;

    if cdsAlteradorxTipoImovel.FieldByName('FLGVALORBASE').asString = 'S' then
    begin
      edtValorBase.Value := edtVlrTotal.Value;
      lblValorBase.Visible := True;
      edtValorBase.Visible := True;
    end;               
  end
  else
  begin
    lblTipoServico.Visible := False;
    dbLkpTipoServico.Visible := False;
    lblValorBase.Visible := False;
    edtValorBase.Visible := False;
    dbLkpProcessos.Visible := False;
    dbLkpProcessos.Visible := False;
    pnlAlteradoresGerados.Top := 136;
  end;
end;

end.
