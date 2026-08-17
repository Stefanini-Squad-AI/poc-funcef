{*******************************************************}
{ Analista Responsável: Helen V. Bianchi                }
{ Atualizado Em: 03/01/2011                             }
{ SOL : 127213 Kintana : 672023                         }
{*******************************************************
--------------------------------------------------------------------------------
-------------------------ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 212226
Nº KINTANA..: 2037651
Data........: 08/04/2014
Responsável.: Helio Lima Custódio
Descrição...: Incluir Campo de Vida Útil e salvar os dados em histórico
de vida útil e atualização da taxa de depreciacao.
--------------------------------------------------------------------------------
Rotina...........: CadastraCAF
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 04/12/2013
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8222
Nº KINTANA..: 1577546
Data........: 28/03/2012
Responsável.: Wylliam Leite da Silva
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
SOL..........: 164246
Kintana......: 1409423
Responsável..: Helen V. Bianchi
Data.........: 05/09/2011
Descrição....: Add para aparecer apenas os Grupos Contábeis Ativos
--------------------------------------------------------------------------------
}

unit FExecAquisicaoParc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin, mFornecedor, Grids,
  Wwdbigrd, Wwdbgrid, mClasseBem, mLocalizacao, TREdit, mImovelInativo,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, fcButton, fcImgBtn,
  fcShapeBtn, Db, Wwdatsrc, DBTables, Wwquery, fcLabel, TB97Ctls, DBCtrls,
  ComCtrls, TabControlDetalhe, Wwdotdot, Wwdbcomb, DBClient,uCtrlDomBem,
  uCMClientDataSet, CMDBLookupCombo, ImgList,uCtrlImobLancamento,uCtrlPadroes,
  uCtrlCafxContab,uCMMath,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab,

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  uCtrlHistoricoVidaUtil;

type
  TFrmExecAquisicaoParc = class(TfrmSairAjudaImob)
    updGruposContabeis: TUpdateSQL;
    qryGruposContabeis: TwwQuery;
    qryGruposContabeisIDGRUPO: TFloatField;
    qryGruposContabeisNOME: TStringField;
    qryGruposContabeisCLASSE: TStringField;
    qryGruposContabeisVALOR: TFloatField;
    qryGruposContabeisPERCENT: TFloatField;
    qryGruposContabeisPLACACAF: TFloatField;
    qryGruposContabeisFLGSEMPLACA: TFloatField;
    qryGruposContabeisDEPRECIACAO: TFloatField;
    qryGruposContabeisPERCENT_EFETIVO: TFloatField;
    qryGruposContabeisNOME_BEM: TStringField;
    qryGruposContabeisGRUPO_BEM: TStringField;
    dsGruposContabeis: TwwDataSource;
    qryUpdImovel: TwwQuery;
    ntbPrincipal: TNotebook;
    Bevel2: TBevel;
    Bevel1: TBevel;
    btnContinuaSelecao: TfcShapeBtn;
    btnAtualizar: TfcShapeBtn;
    edtDataAquisicao: TCMDateTimePicker;
    DBcboTipoImovel: TwwDBLookupCombo;
    molImovelInativo1: TmolImovelInativo;
    edtVlrOper: TRealEdit;
    GroupBox1: TGroupBox;
    Label52: TLabel;
    molLocalizacao1: TmolLocalizacao;
    molClasseBem1: TmolClasseBem;
    DBcboSituacao: TwwDBLookupCombo;
    meObsEvento: TMemo;
    cbDepAquisicao: TCheckBox;
    Label1: TLabel;
    Bevel4: TBevel;
    Label2: TLabel;
    Panel1: TPanel;
    fcShapeBtn4: TfcShapeBtn;
    wwDBGrid1: TwwDBGrid;
    edtTotalGrupo: TRealEdit;
    fcShapeBtn8: TfcShapeBtn;
    edtTotalCompra: TRealEdit;
    fcShapeBtn3: TfcShapeBtn;
    Label10: TLabel;
    Label13: TLabel;
    Label8: TLabel;
    lblContaBancaria: TLabel;
    Label22: TLabel;
    Label14: TLabel;
    DBcboFormaRecPag: TwwDBLookupCombo;
    DBcboCentroCusto: TwwDBLookupCombo;
    fcShapeBtn1: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
    molFornecedor1: TmolFornecedor;
    dbCboContaBancaria: TwwDBLookupCombo;
    DBcboTipoRecDes: TwwDBLookupCombo;
    memObs: TMemo;
    lblTitulo: TfcLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    edtDataLanc: TCMDateTimePicker;
    Label12: TLabel;
    edtVlrTotal: TRealEdit;
    tbcDetalhe: TTabControlDetalhe;
    pgctrlDetalhe: TPageControl;
    TabCond: TTabSheet;
    grdCondPag: TwwDBGrid;
    Panel2: TPanel;
    Label21: TLabel;
    lblNumParc: TLabel;
    Label49: TLabel;
    edValParc: TDBRealEdit;
    edtNumParc: TDBRealEdit;
    dbrgTipoCond: TDBRadioGroup;
    edDataIniParc: TCMDateTimePicker;
    grpPer: TGroupBox;
    spnDias: TwwDBSpinEdit;
    dbCboPeriodicidade: TwwDBComboBox;
    Panel4: TPanel;
    grdParc: TwwDBGrid;
    btnGeraParcelas: TfcShapeBtn;
    fcShapeBtn6: TfcShapeBtn;
    btnConfirma: TfcShapeBtn;
    Label6: TLabel;
    edTotalAquisicao: TRealEdit;
    Label46: TLabel;
    Label47: TLabel;
    dbedtMesRefReajuste: TwwDBSpinEdit;
    lblIndCorrec: TLabel;
    dblcIndCorrec: TCMDBLookupCombo;
    qryMoeda: TwwQuery;
    qryMoedaMOESIGLA: TStringField;
    qryMoedaFLGPERCVALOR: TStringField;
    qryMoedaMOEDESC: TStringField;
    qryMoedaMOECODIGO: TFloatField;
    dsCondPag: TwwDataSource;
    updCondPag: TUpdateSQL;
    qryCondPag: TwwQuery;
    qryCondPagVLRFINANC: TFloatField;
    qryCondPagDATAVENCIMENTO: TDateTimeField;
    qryCondPagPARCELAS: TFloatField;
    qryCondPagNUMPERIOD: TFloatField;
    qryCondPagMESREFREAJUSTE: TFloatField;
    qryCondPagcal_Tipo: TStringField;
    qryCondPagcal_PerParc: TStringField;
    edtReferenciaAP: TEdit;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    ImlPadrao: TImageList;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    qryCondPagIDCONDPAGAQUISPARC: TFloatField;
    qryCondPagIDIMOVEL: TFloatField;
    qryCondPagTIPOCONDPAG: TStringField;
    qryCondPagTIPOPERIOD: TFloatField;
    qryCondPagINDCORRECAO: TFloatField;
    CdsCondPagDoc: TCMClientDataSet;
    dsCondPagDoc: TwwDataSource;
    qryBens: TwwQuery;
    qryBensNUM_MOVIMENTACAO: TFloatField;
    qryBensIMOVEL_EXTENSO: TStringField;
    qryBensIXBGRUPO: TStringField;
    qryBensNOME_BEM: TStringField;
    qryBensPLACA: TFloatField;
    qryBensVALOR: TFloatField;
    qryBensIDIMOVEL: TFloatField;
    qryBensIDBEM: TFloatField;
    qryBensNOME_MESTRE: TStringField;
    qryBensSLD_BEM: TFloatField;
    qryBensDSC_MOVIMENTACAO: TStringField;
    dsBens: TwwDataSource;
    updBens: TUpdateSQL;
    qryCondPagMOEDESC: TStringField;
    qryCondPagDesc_Moeda: TStringField;
    qryVerificaCAF: TwwQuery;
    qryVerificaCAFDTAULTFECHAMENTO: TDateTimeField;
    StaticText1: TStaticText;
    wwDBspnVidaUtil: TwwDBSpinEdit;
    Meses: TStaticText;
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
    procedure FormShow(Sender: TObject);
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure fcShapeBtn4Click(Sender: TObject);
    procedure molImovelInativo1btnBuscaImovelClick(Sender: TObject);
    procedure fcShapeBtn3Click(Sender: TObject);
    procedure fcShapeBtn8Click(Sender: TObject);
    procedure fcShapeBtn6Click(Sender: TObject);
    procedure fcShapeBtn2Click(Sender: TObject);
    procedure dbrgTipoCondChange(Sender: TObject);
    procedure qryCondPagCalcFields(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure btnGeraParcelasClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure edtNumParcExit(Sender: TObject);
    procedure spnDiasExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsCondPagDocAfterOpen(DataSet: TDataSet);
    procedure edtDataAquisicaoExit(Sender: TObject);
  private

  iDocumento        : integer;
  Lanc              : integer;
  CtrlDomBem        : TCtrlDomBem;
  CtrlImobLancamento: TCtrlImobLancamento;
  CafxContab  : TCtrlCafxContab;
  CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  CtrlHistoricoVidaUtil : TCtrlHistoricoVidaUtil;

  procedure AbreQueries;
  procedure FechaQueries;
  procedure CalculaCamposVirtuais;
  procedure PreenchePlacaCAF;
  function VerificaPreenchimentoOper: boolean;
  function RateiaGrupos: Boolean;
  function TotalizaGrupo: Boolean;
  function VerificaPreenchimentoAP(dVenc: TDateTime; iDocumento:Integer) : boolean;
  function CadastraCAF(dVenc: TDateTime ; VlrOper : Extended ) : Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExecAquisicaoParc: TFrmExecAquisicaoParc;

implementation

uses dBaseDados, uDataBase, dMS, dLookImobiliario, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
   dImobiliario, dLancImovel, uFuncoesImob, uSistema, UDocumento, uMolduras, uModuloInvestImob,
   uDiasInUteis, dCAF, UEventoImovel, uCAF, uModuloImobiliario;

{$R *.DFM}

procedure TFrmExecAquisicaoParc.FormShow(Sender: TObject);
begin
  inherited;
   ntbPrincipal.PageIndex := 0;
   Repaint;
   Application.ProcessMessages;
   
   AbreQueries;

end;

procedure TFrmExecAquisicaoParc.AbreQueries;
var
   sFormaAnt      : string;
   sCCAnt         : string;
   sTipoOperAnt   : string;
   sCarteiraAnt   : string;
   sTipoImovelAnt : string;
   sRecDesAnt     : string;
begin
   // Tipo de Imóvel -------------------------------------------------------------------------------
   sTipoImovelAnt := '';
   if DBcboTipoImovel.LookupValue <> '' then sTipoImovelAnt := DBcboTipoImovel.LookupValue;
   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Close;
   dtmLookImobiliario.qryLookTipoImovel.Open;
   DBcboTipoImovel.LookupValue := sTipoImovelAnt;
   // ----------------------------------------------------------------------------------------------

   // Forma de Pagamento ---------------------------------------------------------------------------
   sFormaAnt := '';
   if DBcboFormaRecPag.LookupValue <> '' then sFormaAnt := DBcboFormaRecPag.LookupValue;

   with dtmLookImobiliario.qryLookFormaRecPag do begin
      LimpaParametros(dtmLookImobiliario.qryLookFormaRecPag);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString     := 'P';
      Open;
   end;
   if DBcboFormaRecPag.LookupValue = '' then DBcboFormaRecPag.LookupValue := sFormaAnt;
   // ----------------------------------------------------------------------------------------------

   // Centro de Custo ------------------------------------------------------------------------------
   sCCAnt := '';
   if DBcboCentroCusto.LookupValue <> '' then sCCAnt := DBcboCentroCusto.LookupValue;

   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
      Open;
   end;
   if DBcboCentroCusto.LookupValue = '' then DBcboCentroCusto.LookupValue := sCCAnt;
   if DBcboCentroCusto.LookupValue = '' then begin
      if ModuloImobiliario.InvestImob.sCodCentroCusto <> '' then begin
         DBcboCentroCusto.LookupValue := ModuloImobiliario.InvestImob.sCodCentroCusto;
      end;
   end;

   // Tipo de Despesa ------------------------------------------------------------------------------
   if DBcboTipoRecDes.LookupValue <> '' then
        sRecDesAnt := DBcboTipoRecDes.LookupValue
   else sRecDesAnt := '235'; // Código cadastrado

   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PRECCUSTO').AsString  := 'C';
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      ParamByName('NAO_ACRESCIMO_VALOR').AsString := 'SIM';
      Open;
   end;
   if length(trim(sRecDesAnt)) > 0 then DBcboTipoRecDes.LookupValue := sRecDesAnt;


   // SITUACAO
   dtmLookImobiliario.qryLookSituacao.Open;
   DBcboSituacao.LookupValue := inttostr(ModuloImobiliario.InvestImob.iIdSituacao);
   qryMoeda.Open;
end;


procedure TFrmExecAquisicaoParc.FechaQueries;
begin
   dtmLookImobiliario.qryLookTipoImovel.Close;
   dtmLookImobiliario.qryLookFormaRecPag.Close;
   dtmLookImobiliario.qryLookContaBancaria.Close;
   dtmLookImobiliario.qryLookCentroCusto.Close;
   dtmLookImobiliario.qryLookSituacao.Close;
end;

function TFrmExecAquisicaoParc.VerificaPreenchimentoOper: boolean;
begin
      Result := False;

   try

      if ( (molImovelInativo1.iImovel <= 0) or (molImovelInativo1.edtImovel.Text = '') ) then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel!', molImovelInativo1.btnBuscaImovel);

      if DBcboTipoImovel.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar Tipo do Imóvel!', DBcboTipoImovel);

      if edtDataAquisicao.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Operação!', edtDataAquisicao);

      if edtVlrOper.Value = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Valor Financiado!!', edtVlrOper);

      if molLocalizacao1.edtLocalizacao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Localização para o CAF!', molLocalizacao1.btnBuscaLocalizacao);

      if molClasseBem1.edtClasseBem.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Classe do Bem para o CAF!', molClasseBem1.btnBuscaClasseBem);

      if DBcboSituacao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Situação do Bem para o CAF!', DBcboSituacao);
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataAquisicao.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataAquisicao);

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


function TFrmExecAquisicaoParc.RateiaGrupos: boolean;
var
   sParametro, sSql: String;
begin
   sParametro := '';
   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.IsNull then begin
      sParametro := dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOAR.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOAR.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOUTILITARIO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOUTILITARIO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOMAQUINA.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOMAQUINA.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOMOVEL.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOMOVEL.AsString + ',';
   end;

   if sParametro = '' then begin
      MsgDlg('O tipo de imóvel não possui nenhum grupo contábil associado.','Aviso',mtwarning,[mbok],0);
      Result := false;
      exit;
   end else begin
      sParametro := copy(sParametro,1,Length(sParametro)-1);
   end;

   sSql := 'SELECT '+ #13+
           '   G.IDGRUPO, G.NOME, G.CLASSE, G.FLGSEMPLACA, G.DEPRECIACAO, 0 AS PERCENT, 0 AS VALOR, '+#13+
           '   0 AS PERCENT_EFETIVO, -1 AS PLACACAF, ''                         '' AS NOME_BEM, '' '' AS GRUPO_BEM ' + #13 +
           'FROM ' + #13 +
           '   GRUPO G ' + #13 +
           'WHERE ' + #13 +
           '   ( G.FLGIMOVEL = 1 ) ' + #13 +
           '   AND ( TIPO = ''A'' ) ' + #13 +
           '   AND ( G.STATUS = ''A'')' + #13 +  //Helen SOL Nº 164246 KINTANA Nº 1409423
           '   AND ( G.IDGRUPO IN (' + sParametro + ') ) ' + #13 +
           'ORDER BY ' + #13 +
           '   G.NOME, G.CLASSE';


   qryGruposContabeis.SQL.Clear;
   qryGruposContabeis.SQL.Add(sSql);

   qryGruposContabeis.Open;
   CalculaCamposVirtuais;

   if qryGruposContabeis.RecordCount = 1 then
   begin
      qryGruposContabeis.Edit;
      qryGruposContabeisVALOR.AsFloat := edtVlrOper.Value;
      qryGruposContabeis.Post;
   end;

   edtTotalCompra.Value := edtVlrOper.Value;
   edtTotalGrupo.Value  := 0;
   Result := true;
end;

procedure TFrmExecAquisicaoParc.CalculaCamposVirtuais;
var GrupoImobiliario: rGrupoBem;
begin
   qryGruposContabeis.First;
   while not qryGruposContabeis.Eof do begin
      qryGruposContabeis.Edit;
      GrupoImobiliario := CAF.GrupoImobiliario(qryGruposContabeisIDGRUPO.AsInteger,'');
      qryGruposContabeisNOME_BEM.AsString  := GrupoImobiliario.sDescricao;
      qryGruposContabeisGRUPO_BEM.AsString := GrupoImobiliario.sTipoGrupo;
      qryGruposContabeis.Post;
      qryGruposContabeis.Next;
   end;
end;
procedure TFrmExecAquisicaoParc.btnContinuaSelecaoClick(
  Sender: TObject);
begin
  inherited;
   if VerificaPreenchimentoOper then
   begin
      // OBRIGA a conversão
      if RateiaGrupos then
         ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
      qryCondPag.Close;
      qryCondPag.ParamByName('IDIMOVEL').AsFloat := molImovelInativo1.iImovel ;
      qryCondPag.Open;
   end;
end;

procedure TFrmExecAquisicaoParc.fcShapeBtn4Click(Sender: TObject);
begin
  inherited;
   TotalizaGrupo;
end;
function TFrmExecAquisicaoParc.TotalizaGrupo: Boolean;
var
   fTotGrupo, fMaior, fDiferenca, fTotalPercent: Extended;
begin
   qryGruposContabeis.DisableControls;

   fTotGrupo     := 0;
   fTotalPercent := 0;
   fMaior        := 0;
   qryGruposContabeis.First;
   while not qryGruposContabeis.Eof do
   begin
      if qryGruposContabeisPERCENT.AsFloat <> 0 then
      begin
         qryGruposContabeis.Edit;
         qryGruposContabeisVALOR.AsFloat := Arredonda(edtTotalCompra.Value * (qryGruposContabeisPERCENT.AsFloat / 100),2);
         qryGruposContabeis.Post;
      end;

      if qryGruposContabeisVALOR.AsFloat > 0 then
      begin
         if fMaior < qryGruposContabeisVALOR.AsFloat then fMaior := qryGruposContabeisVALOR.AsFloat;

         fTotGrupo   := fTotGrupo + qryGruposContabeisVALOR.AsFloat;
         qryGruposContabeis.Edit;
         qryGruposContabeisPERCENT_EFETIVO.AsFloat := qryGruposContabeisVALOR.AsFloat / edtTotalCompra.Value;
         qryGruposContabeis.Post;
         fTotalPercent := fTotalPercent + qryGruposContabeisPERCENT_EFETIVO.AsFloat;
      end;
      qryGruposContabeis.Next;
   end;

   // apurar o valor da diferença do rateio
   fTotGrupo := ComunsImobiliario.Arredonda(fTotGrupo,2);
   edtTotalGrupo.Value := fTotGrupo;
   fDiferenca := edtTotalCompra.Value - edtTotalGrupo.Value;

   // acertar a diferença no maior grupo
   qryGruposContabeis.First;
   // tolerar uma diferença de no máximo R$ 2,00
   if (fDiferenca >= -2) and (fDiferenca <= 2) then begin
      while (fDiferenca <> 0) do begin
         if qryGruposContabeisVALOR.AsFloat = fMaior then begin
            qryGruposContabeis.Edit;
            qryGruposContabeisVALOR.AsFloat := qryGruposContabeisVALOR.AsFloat + fDiferenca;
            qryGruposContabeis.Post;
            fDiferenca := 0;
         end;
         qryGruposContabeis.Next
      end;
   end else begin
      MsgDlg(FormatFloat ('Verificar valores lançados, apurada diferença de: #,##0.00', fDiferenca),'Aviso',mtwarning,[mbok],0);
   end;

   // acertar diferença percentual, se necessário
   qryGruposContabeis.First;
   while (fTotalPercent <> 1) and (fDiferenca = 0) do begin
      if qryGruposContabeisVALOR.AsFloat = fMaior then begin
         qryGruposContabeis.Edit;
         qryGruposContabeisPERCENT_EFETIVO.AsFloat := qryGruposContabeisPERCENT_EFETIVO.AsFloat + (1 - fTotalPercent);
         qryGruposContabeis.Post;
         fTotalPercent := 1;
      end;   
   end;
   // calcula o total novamente
   fTotGrupo := 0;
   qryGruposContabeis.First;
   while not qryGruposContabeis.Eof do begin
      fTotGrupo := fTotGrupo + qryGruposContabeisVALOR.AsFloat;
      qryGruposContabeis.Next;
   end;

   fTotGrupo := ComunsImobiliario.Arredonda(fTotGrupo,2);
   edtTotalGrupo.Value := fTotGrupo;
   if edtTotalCompra.Value <> edtTotalGrupo.Value then result := false
   else result := true;

   qryGruposContabeis.EnableControls;

end;
procedure TFrmExecAquisicaoParc.molImovelInativo1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelInativo1.btnBuscaImovelClick(Sender);

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  cdsHistoricoVidaUtil.Data       := CtrlHistoricoVidaUtil.LookupHistoricoVidaUtilVigente( molImovelInativo1.iImovel );
end;

procedure TFrmExecAquisicaoParc.fcShapeBtn3Click(Sender: TObject);
begin
  inherited;
  edtDataLanc.Date  := edtDataAquisicao.Date;
  edtVlrTotal.Value := edtVlrOper.Value;
  
  if TotalizaGrupo then
     ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
end;

procedure TFrmExecAquisicaoParc.fcShapeBtn8Click(Sender: TObject);
begin
  inherited;
  qryGruposContabeis.CancelUpdates;
  ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TFrmExecAquisicaoParc.fcShapeBtn6Click(Sender: TObject);
begin
  inherited;
   Try
     RollBackTransacao;
   except
     //
   end;
   CdsCondPagDoc.Data     := CtrlImobLancamento.ListaCondPagParc;
   CdsCondPagDoc.Close;
   CdsCondPagDoc.Data     := CtrlImobLancamento.ListaCondPagParc;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TFrmExecAquisicaoParc.fcShapeBtn2Click(Sender: TObject);
begin
  inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TFrmExecAquisicaoParc.dbrgTipoCondChange(Sender: TObject);
begin
  inherited;
  // Desabilita a entrada de juros e correção para Sinal e Caução
  if (qryCondPag.State in [dsEdit,dsInsert]) then
  begin
      if dbrgTipoCond.ItemIndex in [0] then
      begin
          lblIndCorrec.Enabled               := False;
          dblcIndCorrec.Enabled              := False;
          dbedtMesRefReajuste.Enabled        := False;
          grpPer.Enabled                     := False;
          edtNumParc.Enabled                 := False;
          lblNumParc.Enabled                 := False;
          spnDias.Value                      := 1;
          dbCboPeriodicidade.ItemIndex       := 0;
          qryCondPagPARCELAS.AsInteger       := 1;
          qryCondPagNUMPERIOD.AsInteger      := 1;
          qryCondPagMESREFREAJUSTE.AsInteger := 0;
          qryCondPagINDCORRECAO.Clear;
      end
      else
      begin
          lblIndCorrec.Enabled               := True;
          dblcIndCorrec.Enabled              := True;
          dbedtMesRefReajuste.Enabled        := True;
          grpPer.Enabled                     := True;
          edtNumParc.Enabled                 := True;
          lblNumParc.Enabled                 := True;
          spnDias.Value                      := 1;
          dbCboPeriodicidade.ItemIndex       := 0;
          qryCondPagPARCELAS.AsInteger       := 1;
          qryCondPagMESREFREAJUSTE.AsInteger := 0;
          qryCondPagNUMPERIOD.AsInteger      := 1;
          qryCondPagTIPOPERIOD.asInteger     := 1;
      end;
  end;
end;

procedure TFrmExecAquisicaoParc.qryCondPagCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryCondPagTIPOCONDPAG.AsString = 'S' then qryCondPagcal_Tipo.AsString := 'Sinal';
  if qryCondPagTIPOCONDPAG.AsString = 'P' then qryCondPagcal_Tipo.AsString := 'Parcelamento';

  if qryCondPagTIPOPERIOD.AsString = '1' then qryCondPagcal_PerParc.AsString := 'Mensal';
  if qryCondPagTIPOPERIOD.AsString = '2' then qryCondPagcal_PerParc.AsString := 'Anual';
  if qryCondPagINDCORRECAO.value > 0 then
     qryCondPagDesc_Moeda.asString  := qryMoedaMOEDESC.Value;
end;

procedure TFrmExecAquisicaoParc.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
   if (qryCondPagVLRFINANC.Value = 0 ) then
  begin
     MsgDlg ('É necessário indicar o Valor Financiado.','Aviso',mtWarning,[mbok],0);
     exit;
  end;
  if (edDataIniParc.Text = '') then
  begin
     MsgDlg ('É necessário indicar a Data do 1º Vencimento.','Aviso',mtWarning,[mbok],0);
     exit;
  end;   
  if (spnDias.Text = '') or (spnDias.Text = '0') then
  begin
     MsgDlg ('A quantidade da Periodicidade não pode ser menor que 1.','Aviso',mtWarning,[mbok],0);
     exit;
  end;
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDataIniParc.Text) then
  begin
       MsgDlg ('Período bloqueado pela Contabilidade - 1º Vencimento!','Aviso',mtWarning,[mbok],0);
       exit;

 end;
 // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
  qryCondPag.post;
  qryCondPag.Insert;
  qryCondPagIDCONDPAGAQUISPARC.AsFloat :=  LeUltRegistro(nil,'CONDPAGAQUISPARC');
  qryCondPagIDIMOVEL.AsFloat           :=  molImovelInativo1.iImovel ;
  qryCondPagTIPOCONDPAG.AsString       :=  'P';
end;

procedure TFrmExecAquisicaoParc.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  if (qryCondPag.State in [dsEdit,dsInsert]) then
      qryCondPag.Cancel;
  Panel2.SendToBack;
  Dock973.Visible := True;
end;

procedure TFrmExecAquisicaoParc.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  qryCondPag.Delete;
end;

procedure TFrmExecAquisicaoParc.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  grdCondPag.SendToBack;
  Dock973.Visible := False;
 if not (dtmBaseDados.dbBaseDados.InTransaction) then
     StartTransacao;
  qryCondPag.Insert;
  qryCondPagIDCONDPAGAQUISPARC.AsFloat :=  LeUltRegistro(nil,'CONDPAGAQUISPARC');
  qryCondPagIDIMOVEL.AsFloat           :=  molImovelInativo1.iImovel ;
  qryCondPagTIPOCONDPAG.AsString       :=  'P';
end;

procedure TFrmExecAquisicaoParc.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  grdCondPag.SendToBack;
  Dock973.Visible := False;
  qryCondPag.Edit;
end;

procedure TFrmExecAquisicaoParc.btnGeraParcelasClick(Sender: TObject);
var parcDocumento, cont , iPer ,iExercicio, iPeriodo :Integer;
    dVencto , dDtMov , dDtCaf : TDateTime;  nTotalAqui, nVlParcela, nVlDif, nTotalParc,nSumParc : Extended;
    auxVidaUtil : Integer; auxTadepAno, auxTaxaDepMes : Extended;//Helio - SOL Nº 212226 KINTANA Nº 2037651
begin
  inherited;

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  auxVidaUtil := cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger;
  auxTadepAno := CtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorAno(auxVidaUtil);
  auxTaxaDepMes := CtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorMes(auxVidaUtil);

  if  wwDBspnVidaUtil.Enabled and
      CtrlHistoricoVidaUtil.VerificaSeModificaExistente(molImovelInativo1.iImovel,
            cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger, auxTadepAno, auxTaxaDepMes) then
  begin
          if MsgDlg('Isso irá alterar a taxa de depreciação do imóvel. Tem certeza que deseja alterar a vida útil?', 'Aviso',
             mtWarning, [mbYes, mbNo], 0) = idNo then
                Exit;
  end;
  //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

  if ( molFornecedor1.edtNomeFantasia.Text = '' ) then
  begin
     MsgDlg ('É necessário indicar o Fornecedor / Favorecido.','Aviso',mtWarning,[mbok],0);
     exit;
  end;
  // verifica o preenchimento dos campos abrigatórios p/ APs
  if ModuloImobiliario.Adminimob.bFlgUsaAP then
  begin
     if (DBcboFormaRecPag.LookupValue = '') then
     begin
        MsgDlg ('É necessário indicar a Forma de Pagamento.','Aviso',mtWarning,[mbok],0);
        exit;
     end;
     if (length(trim(edtReferenciaAP.Text)) = 0) then
     begin
        MsgDlg ('É necessário indicar a Referência / Processo.','Aviso',mtWarning,[mbok],0);
        exit;
     end;
     if (DBcboCentroCusto.LookupValue = '') then
     begin
        MsgDlg ('É necessário indicar o Centro de Custo.','Aviso',mtWarning,[mbok],0);
        exit;
     end;
  end;
  if (qryCondPag.State in [dsEdit,dsInsert]) then
  begin
      if ((qryCondPagPARCELAS.Value > 0) and (qryCondPagVLRFINANC.Value > 0)and(qryCondPagDATAVENCIMENTO.AsString <> '')) then
      begin
           qryCondPag.post;
      end
      else
      begin
          qryCondPag.Cancel;
      end;
      Panel2.SendToBack;
      Dock973.Visible := True;
  end;
  qryCondPag.First;
  dDtMov :=  edtDataLanc.Date;
  if (not CafxContab.VerificaPeriodoContabil(Sistema.IdEmpresa,
                              dDtMov,
                              iExercicio,
                              iPeriodo)) then
  begin
      Raise Exception.Create(CafxContab.MessageInfo);
      exit;
  end;

  qryVerificaCAF.close;
  qryVerificaCAF.open;
  if qryVerificaCAFDTAULTFECHAMENTO.asString <> '' then
     dDtCaf := qryVerificaCAFDTAULTFECHAMENTO.AsDateTime;

  if dDtMov <= dDtCaf then
  begin
     MsgDlg ('Período já encerrado pelo Controle do Ativo Fixo! ' + #13 +
             'Impossível gerar lançamento de movimentação.'  + #13 +
             'Altere a data de movimentação. Verifique a Aquisição e as Parcelas' ,'Aviso',mtWarning,[mbok],0);
     exit;
  end;


  nSumParc     := 0;
  Lanc         := 0;
  while not qryCondPag.eof do
  begin
      nSumParc := nSumParc + qryCondPagVLRFINANC.Value;
      qryCondPag.next;
  end;

  //if nSumParc <> edtVlrTotal.value then
  if (RoundCM(nSumParc,2) <> (RoundCm(edtVlrTotal.value,2))) then
  begin
     MsgDlg ('A soma dos Valores de Financiamento não corresponde ao Valor Total.','Aviso',mtWarning,[mbok],0);
     exit;
  end;
  qryCondPag.First;
  nTotalAqui   := 0;
  nVlParcela   := 0;
  nVlDif       := 0;
  ParcDocumento:= 0;
  nTotalParc   := 0;
  cont         := 0;
  if not qryCondPag.eof then
  begin
      if not (dtmBaseDados.dbBaseDados.InTransaction) then
         StartTransacao;
      try

          //Helio - SOL Nº 212226 KINTANA Nº 2037651
          //somente quando nao for em Construcao ou Terreno
          if (DBcboTipoImovel.LookupValue <> 'CONST') and
             (DBcboTipoImovel.LookupValue <> 'TERR')
          then
          begin
              CtrlHistoricoVidaUtil.GravaHistoricoVidaUtil(
                     molImovelInativo1.iImovel,
                     auxVidaUtil,
                     auxTadepAno,
                     auxTaxaDepMes,
                     'Aquisição Parcelada de Imóveis', False);
          end;
          //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

          iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);
          while not qryCondPag.eof do
          begin
             if (not CafxContab.VerificaPeriodoContabil(Sistema.IdEmpresa,
                              qryCondPagDATAVENCIMENTO.AsDateTime,
                              iExercicio,
                              iPeriodo)) then
             begin
                Raise Exception.Create(CafxContab.MessageInfo);
                exit;
             end;
             if qryCondPagDATAVENCIMENTO.AsDateTime < dDtCaf then
             begin
                 MsgDlg ('Período já encerrado pelo Controle do Ativo Fixo! ' + #13 +
                         'Impossível gerar lançamento de movimentação.'  + #13 +
                         'Altere a data de movimentação.' ,'Aviso',mtWarning,[mbok],0);
                 exit;
             end;

             if (qryCondPagTIPOCONDPAG.asString = 'S') then
             begin
                 if ParcDocumento > 0 then
                    iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux) ;
                 if VerificaPreenchimentoAP(qryCondPagDATAVENCIMENTO.Value,iDocumento) then
                 begin
                     if CadastraCAF(qryCondPagDATAVENCIMENTO.Value,qryCondPagVLRFINANC.Value) then
                     begin
                        Lanc := 1;
                        parcDocumento := 1;
                        CdsCondPagDoc.Append;
                        CdsCondPagDoc.FieldByName('DOCUMENTO').AsString   := IntToStr(iDocumento);
                        CdsCondPagDoc.FieldByName('VENCIMENTO').AsString  := qryCondPagDATAVENCIMENTO.asString;
                        CdsCondPagDoc.FieldByName('PARCELA').AsString     := '1'+ '/0' + qryCondPagPARCELAS.AsString;
                        CdsCondPagDoc.FieldByName('COMPETENCIA').AsString := copy(qryCondPagDATAVENCIMENTO.asString,4,7);
                        if qryCondPagTIPOCONDPAG.asString = 'S' then
                           CdsCondPagDoc.FieldByName('TIPOPAGAMENTO').AsString := 'Sinal';
                        CdsCondPagDoc.FieldByName('VALOR').AsString := qryCondPagVLRFINANC.asString;
                        CdsCondPagDoc.Post;
                        nTotalAqui := nTotalAqui + CdsCondPagDoc.FieldByName('VALOR').asFloat;
                     end
                     else
                        raise Exception.Create('');
                 end
                 else
                    exit;
             end
             else
             begin
                  cont       := 0 ;
                  nTotalParc := 0;
                  if qryCondPagPARCELAS.Value > 1 then
                  begin
                       nVlParcela := ComunsImobiliario.Arredonda(qryCondPagVLRFINANC.Value / qryCondPagPARCELAS.Value, 2);
                       while cont <> qryCondPagPARCELAS.Value  do
                       begin
                          dVencto       := qryCondPagDATAVENCIMENTO.Value;
                          if cont <> 0 then
                          begin
                              iPer :=  (cont) * (qryCondPagNUMPERIOD.asInteger) ;
                              if qryCondPagTIPOPERIOD.Value = 1 then
                                 dVencto := DiasUteis.SomaMeses( dVencto, iPer )
                              else
                                 dVencto := DiasUteis.SomaMeses( dVencto,(iPer * 12) );
                          end;
                          if parcDocumento > 0 then
                             iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux) ;
                          if VerificaPreenchimentoAP(dVencto,iDocumento) then
                          begin
                              if ((cont + 1) = (qryCondPagPARCELAS.Value)) then
                              begin

                                  //if (nTotalAqui + nVlParcela) > (qryCondPagVLRFINANC.Value) then
                                  if (nTotalParc + nVlParcela) <> (qryCondPagVLRFINANC.Value) then
                                  begin
                                      if (nTotalParc + nVlParcela) > (qryCondPagVLRFINANC.Value) then
                                      begin

                                         //nVlDif     := (nTotalAqui + nVlParcela) - qryCondPagVLRFINANC.Value;
                                         nVlDif     := (nTotalParc + nVlParcela) - qryCondPagVLRFINANC.Value;
                                         nVlParcela := nVlParcela - nVlDif;
                                      end
                                      else
                                      begin
                                         nVlDif     := qryCondPagVLRFINANC.Value - (nTotalParc + nVlParcela);
                                         nVlParcela := nVlParcela + nVlDif;
                                      end;
                                  end;
                              end;
                              if CadastraCAF(dVencto, nVlParcela) then
                              begin
                                 Lanc := 1;
                                 parcDocumento := 1;
                                 CdsCondPagDoc.Append;
                                 CdsCondPagDoc.FieldByName('DOCUMENTO').AsString   := IntToStr(iDocumento);
                                 CdsCondPagDoc.FieldByName('VENCIMENTO').AsString  := DateToStr(dVencto);
                                 if qryCondPagPARCELAS.asInteger >= 10 then
                                    CdsCondPagDoc.FieldByName('PARCELA').AsString  := IntToStr(cont + 1) + '/' + qryCondPagPARCELAS.AsString
                                 else
                                    CdsCondPagDoc.FieldByName('PARCELA').AsString  := IntToStr(cont + 1) + '/0' + qryCondPagPARCELAS.AsString  ;
                                 CdsCondPagDoc.FieldByName('COMPETENCIA').AsString := copy(DateToStr(dVencto),4,7);
                                 if qryCondPagTIPOCONDPAG.asString = 'P' then
                                    CdsCondPagDoc.FieldByName('TIPOPAGAMENTO').AsString := 'Parcelamento';
                                 CdsCondPagDoc.FieldByName('VALOR').asFloat             := nVlParcela;
                                 CdsCondPagDoc.Post;
                                 nTotalParc := nTotalParc + nVlParcela;
                                 nTotalAqui := nTotalAqui + nVlParcela;
                                 cont := cont + 1;
                              end
                              else
                                 raise Exception.Create('');
                          end
                          else
                             exit;
                       end;
                  end
                  else
                  begin
                     if ParcDocumento > 0 then
                           iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux) ;
                     if VerificaPreenchimentoAP(dVencto,iDocumento) then
                     begin
                         if CadastraCAF(qryCondPagDATAVENCIMENTO.Value,qryCondPagVLRFINANC.Value) then
                         begin
                             Lanc := 1;
                             parcDocumento := 1;
                             CdsCondPagDoc.Append;
                             CdsCondPagDoc.FieldByName('DOCUMENTO').AsString   := IntToStr(iDocumento);
                             CdsCondPagDoc.FieldByName('VENCIMENTO').AsString  := qryCondPagDATAVENCIMENTO.asString;
                             if qryCondPagPARCELAS.AsInteger >= 10 then
                                CdsCondPagDoc.FieldByName('PARCELA').AsString  := IntToStr(cont + 1) + '/' + qryCondPagPARCELAS.AsString
                             else
                                CdsCondPagDoc.FieldByName('PARCELA').AsString  := IntToStr(cont + 1) + '/0' + qryCondPagPARCELAS.AsString;
                             CdsCondPagDoc.FieldByName('COMPETENCIA').AsString := copy(qryCondPagDATAVENCIMENTO.asString,4,7);
                             CdsCondPagDoc.FieldByName('VALOR').AsString       := FloatToStr(qryCondPagVLRFINANC.Value);
                             if qryCondPagTIPOCONDPAG.asString = 'P' then
                                CdsCondPagDoc.FieldByName('TIPOPAGAMENTO').AsString := 'Parcelamento';
                             CdsCondPagDoc.Post;
                             nTotalAqui := (nTotalAqui + CdsCondPagDoc.FieldByName('VALOR').asFloat);
                         end
                         else
                            raise Exception.Create('');
                     end
                     else
                        exit;
                  end;
             end;
             qryCondPag.Next;
          end;

          //if nTotalAqui <> edtVlrTotal.Value then
          if (RoundCM(nTotalAqui,2) <> (RoundCm(edtVlrTotal.value,2))) then
          begin
             MsgDlg ('A soma dos Valores de Financiamento não corresponde ao Valor Total.','Aviso',mtWarning,[mbok],0);
             exit;
          end;
          edTotalAquisicao.Value :=  nTotalAqui;
          ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
      except
          RollBackTransacao;
          MsgDlg ('Erro ao se tentar registrar a aquisição.','Aviso',mtWarning,[mbok],0);
      end;
  end;
end;

procedure TFrmExecAquisicaoParc.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  qryCondPag.Cancel;
  bbtnVoltarDetClick(Sender);
end;

function TFrmExecAquisicaoParc.VerificaPreenchimentoAP(dVenc: TDateTime; iDocumento:integer): boolean;
begin
   Result := False;
   try
      if (DBcboTipoRecDes.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Despesa!', DBcboTipoRecDes);

      if ( molFornecedor1.edtNomeFantasia.Text = '' ) then
         raise EValidacao.CreateVal('É necessário indicar o Fornecedor / Favorecido!', molFornecedor1.btnBuscaForn);

      // verifica se o vencimento escolhido é um dia inútil
      if ModuloImobiliario.AdminImob.bFlgDiaUtilAP then begin
         if DayOfWeek(dVenc) in [1, 7] then
            raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edDataIniParc);
      end;

      // verifica o preenchimento dos campos abrigatórios p/ APs
      if ModuloImobiliario.Adminimob.bFlgUsaAP then begin

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
function TfrmExecAquisicaoParc.CadastraCAF(dVenc: TDateTime ; VlrOper : extended ) : Boolean;
var iIdConjunto, iIdBem, iPlanilha, iIdLancImovel : integer;
    cdsBem, cdsTaxasDep, cdsPlanoPatroxBem, cdsImagem, cdsPlanoPatroxVigenciaBem : TCMClientDataSet;
    sSQL : String; iAnoAqui, iMesAqui, iDiaAqui, iAnoVenc, iMesVenc, iDiaVenc: word;
    cdsAux: TClientDataSet;
    auxTaxaDep, auxVidaUtil : Extended; //Helio - SOL Nº 212226 KINTANA Nº 2037651
begin
   Result := True;
   cdsPlanoPatroxVigenciaBem := TCMClientDataSet.Create(nil);
   try
      try
          cdsPlanoPatroxVigenciaBem.Data :=  CtrlDomBem.ListaPlanoPatroxVigenciaImob(molImovelInativo1.iImovel);

         // preenche placaCAF
         PreenchePlacaCAF;
         if Lanc = 0 then
         begin
             // ATUALIZAR O IMÓVEL
             sSQL :=
             'UPDATE ' + #13 +
             '   IMOVEL ' + #13 +
             'SET ' + #13 +
             '   CODTIPIMOVEL   = :PCODTIPIMOVEL, ' + #13 +
             '   IMODATACOMPRA  = :PIMODATACOMPRA, ' + #13 +
             '   IMOVLRCOMPRA   = :PIMOVLRCOMPRA, ' + #13 +
             '   IMOMOEDACOMPRA = :PIMOMOEDACOMPRA, ' + #13 +
             '   FLGSTATUS      = ''N'', ' + #13 +
             '   FLGATIVO       = 1 ' + #13;

             if ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1 then
             begin
                qryGruposContabeis.First;
                sSQL := sSQL +
                '   ,IMOCODIGO = ' + QuotedStr(Copy(qryGruposContabeisPLACACAF.AsString,2,6)) + #13;
             end;

             sSQL := sSQL +
             'WHERE  ' + #13 +
             '   IDIMOVEL = :PIDIMOVEL ' + #13;

             qryUpdImovel.SQL.Text := sSQL;

             LimpaParametros (qryUpdImovel);
             qryUpdImovel.ParamByName ('PCODTIPIMOVEL').AsString    := DBcboTipoImovel.LookupValue;
             qryUpdImovel.ParamByName ('PIMODATACOMPRA').AsDateTime := edtDataAquisicao.DateTime;
             qryUpdImovel.ParamByName ('PIMOVLRCOMPRA').AsFloat     := edtVlrOper.Value;
             qryUpdImovel.ParamByName ('PIMOMOEDACOMPRA').AsInteger := Modulo.iMoedaCorrente;
             qryUpdImovel.ParamByName ('PIDIMOVEL').AsInteger       := molImovelInativo1.iImovel;
             qryUpdImovel.ExecSQL;

             // Daniel Simões - 22290
             if ( cbDepAquisicao.Checked=True ) then begin
               // registra evento no imóvel
               UEventoImovel.EventoImovel.RegistraEvento(molImovelInativo1.iImovel, 0,
                                                         Sistema.IdUsuario, 0, 0,
                                                         edtDataAquisicao.Date,
                                                         edtDataAquisicao.Date,
                                                         'AQ', 'Aquisição Parcelada do Imóvel',
                                                         meObsEvento.Text, 0, 0, 0, True)
             end else begin
               UEventoImovel.EventoImovel.RegistraEvento(molImovelInativo1.iImovel, 0,
                                                         Sistema.IdUsuario, 0, 0,
                                                         edtDataAquisicao.Date,
                                                         edtDataAquisicao.Date,
                                                         'AQ', 'Aquisição Parcelada do Imóvel ( SEM DEPRECIAÇÃO )',
                                                         meObsEvento.Text, 0, 0, 0, True)
             end;
         end;
         // gravar lancamentosimovel
         iIdLancImovel := LeUltRegistro(nil,'LANCAMENTOSIMOVEL');
         LimpaParametros (dtmLancImovel.qryLancImovel);
         DecodeDate(dVenc, iAnoVenc, iMesVenc, iDiaVenc);
         DecodeDate(edtDataAquisicao.Date, iAnoAqui, iMesAqui, iDiaAqui);

         with dtmLancImovel.qryInsertLancImovelParc do begin
            ParamByName('PIDLANCIMOVEL').AsInteger := iIdLancImovel;
            ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
            ParamByName('PIDIMOVEL').AsInteger := molImovelInativo1.iImovel;
            ParamByName('PCODTIPIMOVEL').AsString     := DBcboTipoImovel.LookupValue;
            ParamByName('PDATALANCAMENTO').AsDateTime := StrToDate(IntToStr(iDiaAqui) + '/' + IntToStr(iMesVenc) + '/' + IntToStr(iAnoVenc) );
            ParamByName('PDATAVENCIMENTO').AsDateTime := dVenc;
            ParamByName('PMESCOMPETENCIA').AsInteger  := iMesVenc;
            ParamByName('PANOCOMPETENCIA').AsInteger  := iAnoVenc;
            ParamByName('PMESREFERENCIA').AsInteger   := DiasInUteis.ExtraiMes(dVenc);
            ParamByName('PANOREFERENCIA').AsInteger   := DiasInUteis.ExtraiAno(dVenc);

            ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);
            ParamByName('PRECPAG').AsString := 'P';
            ParamByName('PMOEDAPAGAR').AsInteger := Modulo.iMoedaCorrente;
            ParamByName('PIDFORCLI').AsInteger := molFornecedor1.iFornecedor;
            ParamByName('PFLGINTEGRADO').AsInteger := 0;
            // C - > Aquisicao A Vista ; B - > Aquisicao Parcelada
            ParamByName('PFLGORIGEMLANC').AsString := 'B';
            ParamByName('PIDUSUARIOSISTEMA').AsInteger := Sistema.IdUsuario;
            ParamByName('PIDDOCUMENTO').AsInteger := iDocumento;
            ParamByName('PNODOCUMENTO').AsInteger := iDocumento;
            ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;

            ParamByName('PVLRLANCPAGAR').AsFloat := VlrOper ;
            ParamByName('PVLRLANCOMPAGAR').AsFloat := VlrOper ;

            ParamByName('PCODFORMA').AsInteger := StrToInt(DBcboFormaRecPag.LookupValue);
            ParamByName('PCODCENTROCUSTO').AsString := DBcboCentroCusto.LookupValue;
            ParamByName('PREFERENCIAAP').AsString := edtReferenciaAP.Text;
            if dbCboContaBancaria.Value <> '' then
               ParamByName('PIDCBANCARIA').AsInteger    := StrToInt(dbCboContaBancaria.LookupValue);

            ParamByName('PIDCONDPAGAQUISPARC').AsInteger := qryCondPagIDCONDPAGAQUISPARC.asInteger;
            ExecSQL;
         end;

         // insere a Observação na tabela ObsLancImovel
         if length(trim(memObs.Text)) > 0 then FuncoesImob.InsertObsLanc(iDocumento, memObs.Text);

         // cadastro de conjunto
         if Lanc = 0 then
         begin
               LimpaParametros(dtmCAF.qryInsConjunto);
               iIdConjunto := LeUltRegistro(nil,'CONJUNTO');
               dtmCAF.qryInsConjunto.ParamByName('PIDCONJUNTO').AsInteger    := iIdConjunto;
               dtmCAF.qryInsConjunto.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
               dtmCAF.qryInsConjunto.ParamByName('PIDLOCALIZACAO').AsInteger := molLocalizacao1.iLocalizacao;
               dtmCAF.qryInsConjunto.ParamByName('PIDRESPONSAVEL').AsInteger := molLocalizacao1.iResponsavel;
               dtmCAF.qryInsConjunto.ParamByName('PDESCCONJUNTO').AsString   := molImovelInativo1.edtImovel.Text;
               dtmCAF.qryInsConjunto.ExecSQL;


               // table rateiodepreciacao
               LimpaParametros(dtmCAF.qryInsRateioDepreciacao);
               dtmCAF.qryInsRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger    := iIdConjunto;
               dtmCAF.qryInsRateioDepreciacao.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
               dtmCAF.qryInsRateioDepreciacao.ParamByName('PCODCENTROCUSTO').AsString := molLocalizacao1.sCodCentroCusto;
               dtmCAF.qryInsRateioDepreciacao.ParamByName('PPARTICIPACAO').AsInteger  := 100;
               dtmCAF.qryInsRateioDepreciacao.ParamByName('PDTAINICIO').AsDateTime    := edtDataAquisicao.DateTime;
               dtmCAF.qryInsRateioDepreciacao.ExecSQL;

               // Instancia os cds necessários para a inclusão do bem
               cdsBem            := TCMClientDataSet.Create( nil );
               cdsTaxasDep       := TCMClientDataSet.Create( nil );
               cdsPlanoPatroxBem := TCMClientDataSet.Create( nil );
               cdsImagem         := TCMClientDataSet.Create( nil );

               // Abre a estrutura do cds vazia
               cdsBem.Data            := CtrlDomBem.ListaBem(Sistema.IdEmpresa, -99);
               cdsTaxasDep.Data       := CtrlDomBem.ListaBemxDep(Sistema.IdEmpresa, -99);
               cdsPlanoPatroxBem.Data := CtrlDomBem.ListaPlanoPatroxBem(Sistema.IdEmpresa, -99);
               cdsImagem.Data         := CtrlDomBem.CarregaImagem(-99);

               // Associa os cds locais aos cds do Ctrl
               CtrlDomBem.cds               := cdsBem;
               CtrlDomBem.cdsTaxasDep       := cdsTaxasDep;

                //Se caso existir Planos Previdenciários definidos no Cadastro do Imóvel,
               //utilizar estes planos na Contabilização dos Bens gerados na Aquisição.
               cdsAux := TCMClientDataSet.Create(nil);
               if CtrlImobLancamento.VerificaSegregacaoOrigemImovelxBem(molImovelInativo1.iImovel, cdsAux) then
                while not cdsAux.Eof do
                begin
                  cdsPlanoPatroxBem.Insert;
                  cdsPlanoPatroxBem.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
                  cdsPlanoPatroxBem.FieldByName('NOMEPATRO').AsString := cdsAux.FieldByName('NOMEPATRO').AsString;
                  cdsPlanoPatroxBem.FieldByName('IDPATRO').AsFloat := cdsAux.FieldByName('IDPATRO').AsFloat;
                  cdsPlanoPatroxBem.FieldByName('NOMEPLANOPREV').AsString := cdsAux.FieldByName('NOMEPLANO').AsString;
                  cdsPlanoPatroxBem.FieldByName('IDPLANOPREV').AsString := cdsAux.FieldByName('IDPLANOPREV').AsString;
                  cdsPlanoPatroxBem.FieldByName('PPBPERCRATEIO').AsFloat := cdsAux.FieldByName('PPIPERCENTRATEIO').AsFloat;

                  cdsPlanoPatroxBem.Post;
                  cdsAux.Next;
               end;

               CtrlDomBem.cdsPlanoPatroxBem := cdsPlanoPatroxBem;
               CtrlDomBem.cdsImagem         := cdsImagem;

               iPlanilha := 0;
               // executa as entradas dos bens
               qryGruposContabeis.First;
               while not qryGruposContabeis.Eof do begin
                  // somente registra no Ativo Fixo bens escolhidos para o imóvel
                  if qryGruposContabeisVALOR.AsFloat <> 0 then begin

                     // Preenche o Cds de Bem
                     cdsBem.EmptyDataSet;
                     cdsBem.Insert;
                     cdsBem.FieldByName('IDPESSOA').AsInteger       := Sistema.IdEmpresa;
                     cdsBem.FieldByName('IDMODULO').AsInteger       := Sistema.IdModulo;
                     cdsBem.FieldByName('IDCONJUNTO').AsInteger     := iIdConjunto;
                     cdsBem.FieldByName('IDGRUPO').AsInteger        := qryGruposContabeisIDGRUPO.AsInteger;
                     cdsBem.FieldByName('IDCLASSEBEM').AsInteger    := molClasseBem1.iClasseBem;
                     cdsBem.FieldByName('UNIDNEGOC').AsInteger      := ModuloImobiliario.InvestImob.iUnidNegoc;
                     cdsBem.FieldByName('DESBEM').AsString          := molImovelInativo1.edtImovel.Text + ' - ' + qryGruposContabeisNOME_BEM.AsString;
                     cdsBem.FieldByName('IDFORNSERV').AsInteger     := molFornecedor1.iFornecedor;
                     cdsBem.FieldByName('IDSITUACAO').AsInteger     := StrToInt(DBcboSituacao.LookupValue);
                     cdsBem.FieldByName('VALHISTORICO').AsFloat     := qryGruposContabeisVALOR.AsFloat;
                     cdsBem.FieldByName('IDOPCIONAL').AsString      := molImovelInativo1.sMestre;
                     cdsBem.FieldByName('REGISTRO').AsString        := 'I';
                     cdsBem.FieldByName('CONTROLE').AsString        := 'T';
                     cdsBem.FieldByName('BAIXATOTAL').AsString      := 'N';
                     cdsBem.FieldByName('DTAINCLUSAO').AsDateTime   := edtDataAquisicao.DateTime;
                     cdsBem.FieldByName('DTANOTA').AsDateTime       := edtDataAquisicao.DateTime;

                     if ( cbDepAquisicao.Checked=True ) then // Daniel Simões - 22290
                       cdsBem.FieldByName('DATAINICIODEP').AsDateTime := edtDataAquisicao.DateTime;

                     cdsBem.FieldByName('FLGBEMINTCONTAB').AsInteger:= 1;
                     cdsBem.FieldByName('DTACONTAB').AsDateTime     := edtDataAquisicao.DateTime;

                     if ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1 then
                        cdsBem.FieldByName('PLACA').AsInteger          := qryGruposContabeisPLACACAF.AsInteger;

                     cdsBem.Post;

                     // Preenche o Cds da TaxaDep
                     cdsTaxasDep.EmptyDataSet;
                     cdsTaxasDep.Insert;
                     cdsTaxasDep.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
                     cdsTaxasDep.FieldByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
                     cdsTaxasDep.FieldByName('IDBEMXDEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;

                     //Helio - SOL Nº 212226 KINTANA Nº 2037651
                     if wwDBspnVidaUtil.Enabled and
                        (cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger > 0) and
                        (qryGruposContabeisGRUPO_BEM.AsString <> 'T') then
                     begin
                        auxVidaUtil := cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger*1.0;

                        auxTaxaDep := CtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorMes(auxVidaUtil);

                        cdsTaxasDep.FieldByName('TAXADEP').AsFloat := auxTaxaDep;
                     end else
                     begin
                        cdsTaxasDep.FieldByName('TAXADEP').AsFloat     := qryGruposContabeisDEPRECIACAO.AsFloat;
                     end;
                     //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

                     if ( cbDepAquisicao.Checked=False ) then // Daniel Simões - 22290
                       cdsTaxasDep.FieldByName('FLGDEPREC').AsInteger := 1;

                     cdsTaxasDep.Post;

                     CtrlDomBem.OpenTransaction := False;
                     CtrlDomBem.qGruposContabeis := qryGruposContabeis; // Vando - SOL 154328-5901 / KTN 1373449
                     CtrlDomBem.qGruposContabeis.tag := qryGruposContabeisIDGRUPO.AsInteger; // Vando - SOL 154328-5901 / KTN 1373449
                     CtrlDomBem.idImovelHistorico := molImovelInativo1.iImovel; // Vando - SOL 154328-5901 / KTN 1373449
                     if CtrlDomBem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa,
                                                      Sistema.IdUsuario, 'I',
                                                      qryGruposContabeisVALOR.AsFloat, 1 ) then begin
                        iIdBem := CtrlDomBem.IdBem;
                     end else begin
                        iIdBem := -1;
                        raise Exception.create(CtrlDomBem.MessageInfo);
                     end;

                     if not cdsAux.IsEmpty then
                     begin
                        cdsPlanoPatroxVigenciaBem.First;
                        while not cdsPlanoPatroxVigenciaBem.Eof do
                        begin
                          CtrlDomBem.GravaPlanoPatroxVigenciaBem(LeUltRegistro(nil, 'PLANOPATROXVIGENCIABEM'),
                                                            cdsPlanoPatroxVigenciaBem.FieldByName('IDPLANOPREV').AsInteger,
                                                            cdsPlanoPatroxVigenciaBem.FieldByName('IDPATRO').AsInteger,
                                                            iIdBem,
                                                            Sistema.idEmpresa,
                                                            cdsPlanoPatroxVigenciaBem.FieldByName('DATAVIGENCIA').AsString,
                                                            cdsPlanoPatroxVigenciaBem.FieldByName('PERCENTRATEIO').AsFloat);
                          cdsPlanoPatroxVigenciaBem.Next;
                        end;
                     end;
                     
                     // Vando - SOL 154328-5901 / KTN 1373449
                     try
                       LimpaParametros (dtmCAF.qryInsImovelxbem);
                       dtmCAF.qryInsImovelxbemParc.ParamByName('PIDIMOVEL').AsInteger := molImovelInativo1.iImovel;
                       dtmCAF.qryInsImovelxbemParc.ParamByName('PIDBEM').AsInteger    := iIdBem;
                       dtmCAF.qryInsImovelxbemParc.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
                       dtmCAF.qryInsImovelxbemParc.ParamByName('PIXBGRUPO').AsString  := qryGruposContabeisGRUPO_BEM.AsString;
                       //Apenas foi implementado na Aquis.Parcelada
                       dtmCAF.qryInsImovelxbemParc.ParamByName('PIXBRATEIO').AsString  := qryGruposContabeisPERCENT.AsString;
                       dtmCAF.qryInsImovelxbemParc.ExecSQL;
                     except
                       LimpaParametros (dtmCAF.qryInsImovelxbem);
                     end;
                     // Vando - SOL 154328-5901 / KTN 1373449 - fim

                     // gravar LANCIMOVELXBEM
                     LimpaParametros (dtmCAF.qryInsertLancImovelxbem);
                     dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDLANCIMOVEL').AsInteger := iIdLancImovel;
                     dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDBEM').AsInteger := iIdBem;
                     dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
                     dtmCAF.qryInsertLancImovelxbem.ParamByName('PVLRMOV').AsFloat := qryGruposContabeisVALOR.AsFloat;
                     dtmCAF.qryInsertLancImovelxbem.ParamByName('PFLGNUMMOV').AsInteger := 1;   // entrada com controle total
                     dtmCAF.qryInsertLancImovelxbem.ExecSQL;
                  end;
                  qryGruposContabeis.Next;
               end;
         end;
      except
         on E : Exception do begin
            Result := False;
            MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
   finally
      FreeAndNil( cdsBem );
      FreeAndNil( cdsTaxasDep );
      FreeAndNil( cdsPlanoPatroxBem );
      FreeAndNil( cdsImagem );
      FreeAndNil( cdsAux );
      FreeAndNil( cdsPlanoPatroxVigenciaBem );
   end;   
end;

procedure TFrmExecAquisicaoParc.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlDomBem  := TCtrlDomBem.Create;
   CafxContab  := TCtrlCafxContab.Create;
   CafxContab  := TCtrlCafxContab.Create;

   CtrlDomBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
   CtrlImobLancamento:= TCtrlImobLancamento.Create;

   CtrlImobLancamento.InitializeAs(Padroes);
   CafxContab.InitializeAs(Padroes);

   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   CtrlHistoricoVidaUtil := TCtrlHistoricoVidaUtil.Create;
   
   // Define Defaults
   if ModuloImobiliario.InvestImob.iIdLocalizacao > 0 then begin
      molLocalizacao1.iPessoaLoc   := ModuloImobiliario.InvestImob.iIdPessoaLocalizacao;
      molLocalizacao1.iLocalizacao := ModuloImobiliario.InvestImob.iIdLocalizacao;
      AtribuiMolLocalizacao(molLocalizacao1.iLocalizacao, molLocalizacao1.iPessoaLoc, molLocalizacao1.edtLocalizacao, molLocalizacao1.iResponsavel, molLocalizacao1.sCodCentroCusto);
   end;    
   if ModuloImobiliario.InvestImob.iIdClasseBem > 0 then begin
      molClasseBem1.iClasseBem := ModuloImobiliario.InvestImob.iIdClasseBem;
      AtribuiMolClasseBem (molClasseBem1.iClasseBem, molClasseBem1.edtClasseBem);
   end;
   CdsCondPagDoc.Data := CtrlImobLancamento.ListaCondPagParc;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);

   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   CtrlHistoricoVidaUtil.InitializeAs(Padroes);
   CtrlHistoricoVidaUtil.CdsHistoricoVidaUtil := cdsHistoricoVidaUtil;
   //Helio - SOL Nº 212226 KINTANA Nº 2037651
end;

procedure TFrmExecAquisicaoParc.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( CtrlDomBem );
  FreeAndNil( CtrlImobLancamento );
  FreeAndNil(CafxContab);
  FreeAndNil(CtrlContab);// Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  FreeAndNil( CtrlHistoricoVidaUtil );
end;

procedure TFrmExecAquisicaoParc.PreenchePlacaCAF;
var sPlaca: string;
    iSeqPlaca : Integer;
    iPlaca    : Integer;
    iPrefixo  : Integer;
begin
   iSeqPlaca := 0;
   // procedimento que preenche o número das placas dos bens, se precisar
   iPrefixo  := 0;
   qryGruposContabeis.First;

   if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) then Inc(iSeqPlaca);

   while not qryGruposContabeis.Eof do begin

          iPlaca := CAF.PlacaCaf(qryGruposContabeisIDGRUPO.AsInteger, molImovelInativo1.iImovel, Sistema.IdEmpresa, qryGruposContabeisFLGSEMPLACA.AsInteger, iSeqPlaca);

      if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) and (iPlaca <> -1) then
      begin
         if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.IsNull) and
            (dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsInteger = qryGruposContabeisIDGRUPO.AsInteger) then begin
            iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumTer);
         end;

         if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.IsNull) and
            (dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsInteger = qryGruposContabeisIDGRUPO.AsInteger) then begin
            iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumEdi);
         end;

         if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.IsNull) and
            (dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsInteger = qryGruposContabeisIDGRUPO.AsInteger) then begin
            iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumIns);
         end;

         iPlaca := StrToInt(IntToStr(iPrefixo) + CompletaInicio(IntToStr(iPlaca), '0',6));
      end;
      qryGruposContabeis.Edit;
      qryGruposContabeisPLACACAF.AsInteger := iPlaca;
      qryGruposContabeis.Post;
      qryGruposContabeis.Next;

      if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao <> 1) then Inc(iSeqPlaca);
   end;
end;

procedure TFrmExecAquisicaoParc.btnConfirmaClick(Sender: TObject);
begin
  inherited;
  Try
     qryCondPag.ApplyUpdates;
     CommitTransacao;
     MsgDlg ('Aquisição registrada com sucesso.','Informação',mtInformation,[mbok],0);
     ntbPrincipal.PageIndex := 0;
     molImovelInativo1.edtImovel.Clear;
     edtDataAquisicao.Clear;
     edtVlrOper.Clear;
     meObsEvento.Clear;
     edtReferenciaAP.Clear;
     memObs.Clear;
     CdsCondPagDoc.Data     := CtrlImobLancamento.ListaCondPagParc;
     CdsCondPagDoc.Close;
     CdsCondPagDoc.Data     := CtrlImobLancamento.ListaCondPagParc;

  except
     RollBackTransacao;
     MsgDlg ('Erro ao se tentar registrar a aquisição.','Aviso',mtWarning,[mbok],0);
  end;
end;


procedure TFrmExecAquisicaoParc.edtNumParcExit(Sender: TObject);
begin
  inherited;
  if edtNumParc.Value = 0 then
     raise EValidacao.CreateVal('A quantidade de Parcelas não pode ser menor que 1.', edtNumParc);
end;

procedure TFrmExecAquisicaoParc.spnDiasExit(Sender: TObject);
begin
  inherited;
   if spnDias.Value = 0 then
     raise EValidacao.CreateVal('A quantidade de Periodicidade não pode ser menor que 1.', spnDias);
end;

procedure TFrmExecAquisicaoParc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with dtmBaseDados.dbBaseDados do
  begin
        if InTransaction then
          RollBackTransacao;
  end;
end;

procedure TFrmExecAquisicaoParc.CdsCondPagDocAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(DataSet.FieldByName('VALOR')).DisplayFormat := ',0.00';
end;

procedure TFrmExecAquisicaoParc.edtDataAquisicaoExit(Sender: TObject);
var dDtMov , dDtCaf : TDateTime;
begin
  inherited;
  if edtDataAquisicao.date > 0 then
  begin
      qryVerificaCAF.close;
      qryVerificaCAF.open;
      if qryVerificaCAFDTAULTFECHAMENTO.asString <> '' then
         dDtCaf := qryVerificaCAFDTAULTFECHAMENTO.AsDateTime;
      dDtMov :=  edtDataAquisicao.Date;
      if dDtMov <= dDtCaf then
      begin
         MsgDlg ('Período já encerrado pelo Controle do Ativo Fixo! ' + #13 +
                 'Impossível gerar lançamento de movimentação.'  + #13 +
                 'Altere a data de movimentação. ' ,'Aviso',mtWarning,[mbok],0);
         edtDataAquisicao.SetFocus;
      end;
  end;
end;

end.
