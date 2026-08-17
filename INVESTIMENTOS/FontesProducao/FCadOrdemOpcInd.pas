//******************************************************************************
// Data      : 12/05/2008
// Código    : AL_5
// Pendencia : 25129
// SOL       : 58645
// Desc      : Retirada a critica devido a implementação do tipo de mercado
//******************************************************************************
// Data      : 25/09/2006
// Código    : AL_4
// Pendencia : 20453
// SOL       : 33866
// Desc      : Acerto na Trava Contábil para testar o TipoInvest=2 após o Mercado
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_3
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_2
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
// Data     : 10/06/2005
// Código   : AL_1
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 14/06/2004
// Motivo   : Implementação da Reversão de Operações
//******************************************************************************
// Data     : 07/06/2004
// Motivo   : Alterações na QryCarteiraOrder e qryTipoOperacao
//******************************************************************************

unit FCadOrdemOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, TB97Ctls, DBCtrls, TREdit, DBTables,
  Db, Wwdatsrc, Wwquery, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Mask,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, MontaSelect, ImgList,
  FPreview, faMensagem, wwdbedit, uCtrlInvContab;

type
  TfrmCadOrdemOpcInd = class(TfrmOkCancelarInv)
    ImlPadrao: TImageList;
    MontaSelect: TMontaSelect;
    pnlMestre: TPanel;
    lblCorretora: TLabel;
    lblDtOperacao: TLabel;
    Label1: TLabel;
    dbdDataOperacao: TCMDateTimePicker;
    dblkCorretora: TwwDBLookupCombo;
    pnlDetalhe: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    sbtnBuscaSaldos: TToolbarButton97;
    sbtnMontaCesta: TToolbarButton97;
    pgctrlDetalhe: TPageControl;
    tbsOrdem: TTabSheet;
    pnlControlesDet: TPanel;
    tbsCesta: TTabSheet;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsOrdem: TToolbarButton97;
    sbtnAltOrdem: TToolbarButton97;
    sbtnExcluiOrdem: TToolbarButton97;
    Dock974: TDock97;
    Toolbar972: TToolbar97;
    sbtnInsCesta: TToolbarButton97;
    sbtnAltCesta: TToolbarButton97;
    sbtnExcluiCesta: TToolbarButton97;
    pnlControlesCesta: TPanel;
    dbgOrdem: TwwDBGrid;
    Dock975: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkOrdem: TBitBtn;
    bbtnCancelarOrdem: TBitBtn;
    bbtnVoltarOrdem: TBitBtn;
    pnlDadosDet: TPanel;
    Dock976: TDock97;
    Toolbar973: TToolbar97;
    bbtnOkCesta: TBitBtn;
    bbtnCancelarCesta: TBitBtn;
    bbtnVoltarCesta: TBitBtn;
    pnlDadosCesta: TPanel;
    dbgCesta: TwwDBGrid;
    qryOrdem: TwwQuery;
    qryOrdemCARTEIRA: TStringField;
    qryOrdemDESCINVESTIMENTO: TStringField;
    qryOrdemDESCTIPOOPERACAO: TStringField;
    qryOrdemQUANTIDADE: TFloatField;
    qryOrdemPREMIO: TFloatField;
    qryOrdemVALOR: TFloatField;
    qryOrdemDATAORDEM: TDateTimeField;
    qryOrdemIDBOLETA: TStringField;
    qryOrdemIDINVESTIMENTO: TFloatField;
    qryOrdemIDORDEMOPCIND: TFloatField;
    qryOrdemIDCORRETVALORES: TFloatField;
    qryOrdemIDTIPOOPERACAO: TFloatField;
    qryOrdemIDTIPOINVEST: TFloatField;
    qryOrdemOBSERVACAO: TMemoField;
    qryOrdemSTATUS: TStringField;
    qryOrdemIDUSUARIO: TFloatField;
    qryOrdemIDPLANPREVCTBPATR: TFloatField;
    qryOrdemSTACONFIRMA: TStringField;
    qryOrdemSTAAUTORIZA: TStringField;
    qryOrdemIDCESTAOPCIND: TFloatField;
    qryOrdemIDCARTEIRAGERENC: TFloatField;
    qryOrdemSGLCORRETVALORES: TStringField;
    qryOrdemDESCCARTINVEST: TStringField;
    qryOrdemIDCARTEIRAINVEST: TFloatField;
    dsOrdem: TwwDataSource;
    updOrdem: TUpdateSQL;
    qryCesta: TwwQuery;
    qryCestaDATAVIGENCIA: TDateTimeField;
    qryCestaDESCINVESTIMENTO: TStringField;
    qryCestaQUANTIDADE: TFloatField;
    qryCestaCOTACAO: TFloatField;
    qryCestaVALOR: TFloatField;
    qryCestaSGLCUSTODIANTE: TStringField;
    qryCestaCARTEIRA: TStringField;
    qryCestaIDCESTAOPCIND: TFloatField;
    qryCestaIDINVESTIMENTO: TFloatField;
    qryCestaIDCUSTODIANTE: TFloatField;
    qryCestaIDCARTEIRAINVEST: TFloatField;
    qryCestaIDCARTEIRAGERENC: TFloatField;
    updCesta: TUpdateSQL;
    dsCesta: TwwDataSource;
    qryCarteiraOrdem: TwwQuery;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoIDTIPOINVEST: TFloatField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoIDMERCADO: TFloatField;
    qryTipoOperacaoCODTIPDOC: TFloatField;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryTipoOperacaoTIPOCUSTODIA: TStringField;
    qryTipoOperacaoVENCIMENTO: TFloatField;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryTipoOperacaoRECPAG: TStringField;
    qryTipoOperacaoTIPCREDOR: TStringField;
    qryTipoOperacaoFLGGERACAF: TFloatField;
    qryTipoOperacaoFLGTRANSF: TStringField;
    qryTipoOperacaoFLGCORRET: TStringField;
    qryTipoOperacaoTRGDTINCLUSAO: TDateTimeField;
    qryTipoOperacaoTRGUSERINCLUSAO: TStringField;
    qryTipoOperacaoFLGORDMOVINV: TStringField;
    qryTipoOperacaoIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperacaoFLGOPDIREITO: TStringField;
    qryTipoOperacaoFLGAGE: TStringField;
    qryTipoOperacaoFLGDATAEX: TStringField;
    qryTipoOperacaoFLGDATACOM: TStringField;
    qryTipoOperacaoFLGINVORIGEM: TStringField;
    qryTipoOperacaoFLGPERC: TStringField;
    qryTipoOperacaoFLGPARIDADE: TStringField;
    qryTipoOperacaoFLGPRZBOLSA: TStringField;
    qryTipoOperacaoFLGPRZEMP: TStringField;
    qryTipoOperacaoFLGATADEC: TStringField;
    qryTipoOperacaoFLGFORMAPAGREC: TStringField;
    qryTipoOperacaoFLGDIVACAO: TStringField;
    qryTipoOperacaoFLGINIPAG: TStringField;
    qryTipoOperacaoFLGJUROS: TStringField;
    qryTipoOperacaoMOTBLOQCARTORIG: TFloatField;
    qryTipoOperacaoMOTBLOQCARTDEST: TFloatField;
    qryTipoOperacaoTIPSALDOCARTORIG: TStringField;
    qryTipoOperacaoTIPSALDOCARTDEST: TStringField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    qryTipoOperacaoSIGLATIPOOPER: TStringField;
    qryTipoOperacaoFLGISENTOIR: TStringField;
    qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperacaoFLGOPGERENC: TStringField;
    qryTipoOperacaoTIPOMOVTO: TStringField;
    qryTipoOperacaoSTAATIVO: TStringField;
    qryOpcao: TwwQuery;
    qryOpcaoDESCINVESTIMENTO: TStringField;
    qryOpcaoIDINVESTIMENTO: TFloatField;
    qryOpcaoVLRPRECOEX: TFloatField;
    qryOpcaoVLRSTRIKEPUT: TFloatField;
    qryOpcaoVLRPONTO: TFloatField;
    qryOpcaoSTATPAMERICANA: TStringField;
    qryOpcaoSTAOPCCOMPRA: TStringField;
    qryOpcaoTIPCOTVENC: TStringField;
    pgcOrdemDet: TPageControl;
    tbsOrdemDados: TTabSheet;
    Label4: TLabel;
    lblOpcao: TLabel;
    lblQtdOper: TLabel;
    lblPremio: TLabel;
    lblVlrOper: TLabel;
    Label3: TLabel;
    dblkOpcao: TwwDBLookupCombo;
    dbreQtdOper: TDBRealEdit;
    dbrePremio: TDBRealEdit;
    dbreVlrOper: TDBRealEdit;
    dblkTipoOperacao: TwwDBLookupCombo;
    dblkCarteiraOrdem: TwwDBLookupCombo;
    tbsOrdemObs: TTabSheet;
    dbmObs: TDBMemo;
    qryCarteiraCesta: TwwQuery;
    qryCarteiraCestaCARTEIRA: TStringField;
    qryCarteiraCestaIDCARTEIRA: TStringField;
    qryCarteiraCestaIDCARTEIRAINVEST: TFloatField;
    qryCarteiraCestaIDCARTEIRAGERENC: TFloatField;
    qryCustodianteCesta: TwwQuery;
    qryCustodianteCestaSGLCUSTODIANTE: TStringField;
    qryCustodianteCestaIDCUSTODIANTE: TFloatField;
    qryAcaoCesta: TwwQuery;
    qryAcaoCestaDESCINVESTIMENTO: TStringField;
    qryAcaoCestaSGLCUSTODIANTE: TStringField;
    qryAcaoCestaSALDOLIBERADO: TFloatField;
    qryAcaoCestaSALDOBLOQUEADO: TFloatField;
    qryAcaoCestaIDCARTEIRAINVEST: TFloatField;
    qryAcaoCestaIDCUSTODIANTE: TFloatField;
    qryAcaoCestaIDINVESTIMENTO: TFloatField;
    qryAcaoCestaIDLOTE: TStringField;
    lblCarteira: TLabel;
    dblkCarteiraCesta: TwwDBLookupCombo;
    lblCustodiante: TLabel;
    dblkCustodianteCesta: TwwDBLookupCombo;
    Label2: TLabel;
    dblkAcao: TwwDBLookupCombo;
    Label6: TLabel;
    dbreQtdCesta: TDBRealEdit;
    lblCotacao: TLabel;
    Label8: TLabel;
    dbreVlrCesta: TDBRealEdit;
    Toolbar974: TToolbar97;
    Panel1: TPanel;
    lblValTotCesta: TfcLabel;
    QryCorretValores: TwwQuery;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    dbDocumento: TEdit;
    fraMensOpcInd: TfraMensagem;
    pnlEspacador: TPanel;
    dbreCotacao: TDBRealEdit;
    qryOrdemIDLOTE: TStringField;
    sbtnMovimento: TToolbarButton97;
    dbeLote: TwwDBEdit;
    Label5: TLabel;
    fcLabel1: TfcLabel;
    lblValMinCesta: TfcLabel;
    fcLabel3: TfcLabel;
    lblValMaxCesta: TfcLabel;
    fcLabel2: TfcLabel;
    qryOpcaoDTAVENCTO: TDateTimeField;
    sbtnConsOrdem: TToolbarButton97;
    sbtnConsCesta: TToolbarButton97;
    qryVerificaVigencias: TwwQuery;
    qryVerificaVigenciasDATAVIGENCIA: TDateTimeField;
    qryCarteiraOrdemCARTEIRA: TStringField;
    qryCarteiraOrdemIDCARTEIRA: TFloatField;
    qryCarteiraOrdemIDCARTEIRAINVEST: TFloatField;
    MSBuscaSaldos: TMontaSelect;
    qryAux: TwwQuery;
    procedure qryOrdemAfterOpen(DataSet: TDataSet);
    procedure qryOrdemAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnInsOrdemClick(Sender: TObject);
    procedure sbtnAltOrdemClick(Sender: TObject);
    procedure bbtnOkOrdemClick(Sender: TObject);
    procedure bbtnCancelarOrdemClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryCestaAfterOpen(DataSet: TDataSet);
    procedure dblkCarteiraCestaEnter(Sender: TObject);
    procedure dblkCarteiraCestaExit(Sender: TObject);
    procedure dblkCustodianteCestaEnter(Sender: TObject);
    procedure dblkCustodianteCestaExit(Sender: TObject);
    procedure dbreQtdOperExit(Sender: TObject);
    procedure dbrePremioExit(Sender: TObject);
    procedure dbdDataOperacaoExit(Sender: TObject);
    procedure dblkCorretoraExit(Sender: TObject);
    procedure bbtnCancelarCestaClick(Sender: TObject);
    procedure bbtnOkCestaClick(Sender: TObject);
    procedure sbtnExcluiOrdemClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure ControlaBotoes(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInsCestaClick(Sender: TObject);
    procedure sbtnAltCestaClick(Sender: TObject);
    procedure sbtnExcluiCestaClick(Sender: TObject);
    procedure dbgOrdemDblClick(Sender: TObject);
    procedure dbgCestaDblClick(Sender: TObject);
    procedure pgctrlDetalheChange(Sender: TObject);
    procedure dblkAcaoExit(Sender: TObject);
    procedure dbreQtdCestaExit(Sender: TObject);
    procedure dbreCotacaoExit(Sender: TObject);
    procedure dblkAcaoEnter(Sender: TObject);
    procedure dblkTipoOperacaoExit(Sender: TObject);
    procedure dblkTipoOperacaoEnter(Sender: TObject);
    procedure sbtnMovimentoClick(Sender: TObject);
    procedure sbtnConsOrdemClick(Sender: TObject);
    procedure sbtnConsCestaClick(Sender: TObject);
    procedure qryOrdemAfterPost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnBuscaSaldosClick(Sender: TObject);
  private
    { Private declarations }
    sLkCartCesta, sLkCustCesta, sLKAcao, sLKTipoOperacao: String;
    fLote, fDif, fValAnt, fMinCesta, fMaxCesta: Double;
    iOrdem: Integer;
    bVerificandoCesta,bReversao: Boolean;
    procedure Sel(dDataOper: TDateTime = 0; iCorretora: Integer = 0);
    procedure SelCesta;
    procedure Seleciona;
    procedure ControlaBtOrdem;
    procedure ControlaBtCesta;
    procedure StatusConsultar;
    procedure AbreTransacao;
    procedure StatusInserir;
    procedure StatusAlterar;
    procedure AbreQryAcoes;
    procedure AbreQryCustodiante;
    procedure CalculaValor;
    procedure CalculaValorInvCesta;
    procedure MostraVlrCesta;
    procedure HabilitaMestre(bHab : Boolean);
    function  VerificaValoresOrdem: Boolean;
    function  VerificaValoresCesta: Boolean;
    function  VerificaCestaOrdem: Boolean;
    function  VerDifCesta(bValidaCesta: Boolean; sIdLote: String; sModo: String = 'T'): boolean;
    function  MontaTipoOperacao(sIdOperOpcInd : String):String;
  public
    { Public declarations }
  end;

var
  frmCadOrdemOpcInd: TfrmCadOrdemOpcInd;

implementation

uses UOpcaoIndice, UOperComum, UDatabase, DBaseDados, UMensErro, USistema,
     UBibliotecaInvest, FDmRelConsMovOpcInd, dOpcoesIndice, URendaVariavel;

{$R *.DFM}

{ TfrmCadOrdemOpcInd }

procedure TfrmCadOrdemOpcInd.SelCesta;
begin
   // Não Seleciona se a cesta estiver em edição
   if not (qryCesta.State in [dsInsert, dsEdit]) then
   begin
      OperComum.LimpaParametros(qryCesta);
      if dbdDataOperacao.Date <> 0 then
         qryCesta.ParamByName('DATAVIGENCIA').AsString := dbdDataOperacao.Text;
      if not qryOrdemIDCESTAOPCIND.IsNull then
         qryCesta.ParamByName('IDCESTAOPCIND').AsInteger := qryOrdemIDCESTAOPCIND.AsInteger;
      qryCesta.Open;
      ControlaBtCesta;
   end;
end;

procedure TfrmCadOrdemOpcInd.Sel(dDataOper: TDateTime = 0; iCorretora: Integer = 0);
begin
   OperComum.LimpaParametros(qryOrdem);
   if dDataOper <> 0 then
      qryOrdem.ParamByName('DATAORDEM').AsString := DateToStr(dDataoper);
   if iCorretora <> 0 then
      qryOrdem.ParamByName('IDCORRETVALORES').AsInteger := iCorretora;
   qryOrdem.Open;
   ControlaBtOrdem;
end;

procedure TfrmCadOrdemOpcInd.Seleciona;
begin
   dbDocumento.Text := '';
   if Trim(dbdDataOperacao.Text) <> '' then
   begin
      if Trim(dblkCorretora.Text) = '' then
         Sel(dbdDataOperacao.DateTime)
      else
      begin
         Sel(dbdDataOperacao.DateTime, QryCorretValoresIDCORRETVALORES.AsInteger);
         if not qryOrdemIDBOLETA.IsNull then
            dbDocumento.Text := qryOrdemIDBOLETA.AsString;
      end;
   end else
      Sel;
end;

procedure TfrmCadOrdemOpcInd.AbreQryAcoes;
begin
   OperComum.LimpaParametros(qryAcaoCesta);
   if Trim(dbdDataOperacao.Text) <> '' then
   begin
      qryAcaoCesta.ParamByName('DATAMOV').AsString := dbdDataOperacao.Text;
      if Trim(dblkCarteiraCesta.Text) <> '' then
         qryAcaoCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCarteiraCestaIDCARTEIRAINVEST.AsInteger;
      if Trim(qryCustodianteCesta.Text) <> '' then
         qryAcaoCesta.ParamByName('IDCUSTODIANTE').AsInteger := qryCustodianteCestaIDCUSTODIANTE.AsInteger;
   end else begin
      qryAcaoCesta.ParamByName('DATAMOV').AsString := '';
      qryAcaoCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := 0;
      qryAcaoCesta.ParamByName('IDCUSTODIANTE').AsInteger := 0;
   end;
   qryAcaoCesta.Open;   
end;

procedure TfrmCadOrdemOpcInd.AbreQryCustodiante;
begin
   OperComum.LimpaParametros(qryCustodianteCesta);
   if Trim(dbdDataOperacao.Text) <> '' then
   begin
      qryCustodianteCesta.ParamByName('DATAMOV').AsString := dbdDataOperacao.Text;
      if Trim(dblkCarteiraCesta.Text) <> '' then
         qryCustodianteCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCarteiraCestaIDCARTEIRAINVEST.AsInteger;
      qryCustodianteCesta.Open;
   end else begin
      qryCustodianteCesta.ParamByName('DATAMOV').AsString := '';
      qryCustodianteCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := 0;
      qryCustodianteCesta.Open;
   end;
end;

procedure TfrmCadOrdemOpcInd.ControlaBotoes(Sender: TObject);
begin
   sbtnInserir.Enabled     := qryOrdem.State = dsBrowse;
   sbtnAlterar.Enabled     := ((qryOrdem.State = dsBrowse) and (not qryOrdem.IsEmpty));
   sbtnApagar.Enabled      := ((qryOrdem.State = dsBrowse) and (not qryOrdem.IsEmpty));
   sbtnProcurar.Enabled    := qryOrdem.State = dsBrowse;
   sbtnBuscaSaldos.Enabled := qryOrdem.State = dsBrowse;
   sbtnMontaCesta.Enabled  := qryOrdem.State = dsBrowse;
   bbtnConfirmar.Enabled   := qryOrdem.State in [dsInsert, dsEdit];
   bbtnCancelar.Enabled    := qryOrdem.State in [dsInsert, dsEdit];
end;

procedure TfrmCadOrdemOpcInd.ControlaBtCesta;
begin
   if (qryOrdemIDTIPOOPERACAO.AsInteger = -86) and
      (qryOrdemSTATUS.AsString <> 'F') then
   begin

      sbtnInsCesta.Enabled    :=  qryCesta.State = dsBrowse;
      sbtnAltCesta.Enabled    := (qryCesta.State = dsBrowse) and (not qryCesta.IsEmpty);
      sbtnExcluiCesta.Enabled := (qryCesta.State = dsBrowse) and (not qryCesta.IsEmpty);
      sbtnConsCesta.Enabled   := (qryCesta.State = dsBrowse) and (not qryCesta.IsEmpty);

      Case qryCesta.State of
      dsInsert:
        begin
           sbtnInsCesta.Down := True;
           sbtnAltCesta.Down := False;
           sbtnConsCesta.Down := False;
        end;
      dsEdit:
        begin
           sbtnInsCesta.Down := False;
           sbtnAltCesta.Down := True;
           sbtnConsCesta.Down := False;
        end;
      else
        begin
           sbtnInsCesta.Down := False;
           sbtnAltCesta.Down := False;
           sbtnConsCesta.Down := False;
        end;
      end;
   end
   else
   begin
      sbtnInsCesta.Enabled := False;
      sbtnAltCesta.Enabled := False;
      sbtnExcluiCesta.Enabled := False;
      sbtnConsCesta.Enabled := (not qryCesta.IsEmpty);
      sbtnInsCesta.Down := False;
      sbtnAltCesta.Down := False;
      sbtnConsCesta.Down := False;
   end;
end;

procedure TfrmCadOrdemOpcInd.ControlaBtOrdem;
begin
   if (Trim(dbdDataOperacao.Text) <> '') and
      (Trim(dblkCorretora.Text) <> '') and
      (qryOrdemSTATUS.AsString <> 'F') then
   begin

      sbtnInsOrdem.Enabled    := (qryOrdem.State = dsBrowse);
      sbtnAltOrdem.Enabled    := (qryOrdem.State = dsBrowse) and (not qryOrdem.IsEmpty);
      sbtnExcluiOrdem.Enabled := (qryOrdem.State = dsBrowse) and (not qryOrdem.IsEmpty);
      sbtnConsOrdem.Enabled   := (qryOrdem.State = dsBrowse) and (not qryOrdem.IsEmpty);

      Case qryOrdem.State of
      dsInsert:
        begin
           sbtnInsOrdem.Down := True;
           sbtnAltOrdem.Down := False;
           sbtnConsOrdem.Down := False;
        end;
      dsEdit:
        begin
           sbtnInsOrdem.Down := False;
           sbtnAltOrdem.Down := True;
           sbtnConsOrdem.Down := False;
        end;
      else
        begin
           sbtnInsOrdem.Down := False;
           sbtnAltOrdem.Down := False;
           sbtnConsOrdem.Down := False;
        end;
      end;
   end
   else
   begin
      sbtnInsOrdem.Enabled := False;
      sbtnAltOrdem.Enabled := False;
      sbtnExcluiOrdem.Enabled := False;
      sbtnConsOrdem.Enabled := (qryOrdem.State = dsBrowse) and (not qryOrdem.IsEmpty);
      sbtnInsOrdem.Down := False;
      sbtnAltOrdem.Down := False;
      sbtnConsOrdem.Down := False;
   end;
end;

procedure TfrmCadOrdemOpcInd.StatusConsultar;
begin
   pnlFundo.Enabled := True;
   pgctrlDetalhe.ActivePage := tbsOrdem;
   dbgOrdem.BringToFront;
   dbgCesta.BringToFront;

   Seleciona;

   sbtnProcurar.Down       := False;
   sbtnMontaCesta.Down     := False;
   bbtnConfirmar.Enabled   := False;
   bbtnCancelar.Enabled    := False;
end;

procedure TfrmCadOrdemOpcInd.StatusInserir;
begin
   pnlFundo.Enabled := True;
   pgctrlDetalhe.ActivePage := tbsOrdem;
   dbgOrdem.BringToFront;
   dbgCesta.BringToFront;
   dbdDataOperacao.Clear;
   dblkCorretora.Clear;
   dbDocumento.Clear;
   Sel;
   sbtnInserir.Enabled := True;
   sbtnInserir.Down := True;
   sbtnAlterar.Enabled := False;
   sbtnApagar.Enabled := False;
   sbtnProcurar.Enabled := False;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   if dbdDataOperacao.CanFocus then
      dbdDataOperacao.SetFocus;
end;

procedure TfrmCadOrdemOpcInd.StatusAlterar;
begin
   pnlFundo.Enabled := True;
   pgctrlDetalhe.ActivePage := tbsOrdem;
   dbgOrdem.BringToFront;
   dbgCesta.BringToFront;
   sbtnInserir.Enabled := False;
   sbtnInserir.Down := False;
   sbtnAlterar.Enabled := False;
   sbtnApagar.Enabled := True;
   sbtnProcurar.Enabled := False;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   if dbdDataOperacao.CanFocus then
      dbdDataOperacao.SetFocus;
end;

procedure TfrmCadOrdemOpcInd.qryOrdemAfterOpen(DataSet: TDataSet);
begin
   inherited;
   if not bVerificandoCesta then
   begin
      // A Orelha de Cesta só fica visivel na operação de Venda de Opção de Compra
      if qryOrdemIDTIPOOPERACAO.AsInteger = -86 then
         tbsCesta.TabVisible := True
      else
         tbsCesta.TabVisible := False;
   end;

   SelCesta;
end;

procedure TfrmCadOrdemOpcInd.qryOrdemAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if not bVerificandoCesta then
   begin
      // A Orelha de Cesta só fica visivel na operação de Venda de Opção de Compra
      if qryOrdemIDTIPOOPERACAO.AsInteger = -86 then
         tbsCesta.TabVisible := True
      else
         tbsCesta.TabVisible := False;
   end;

   SelCesta;
end;


function TfrmCadOrdemOpcInd.VerificaValoresOrdem: Boolean;
begin
   Result := True;

   if Trim(dbdDataOperacao.Text) = '' then
   begin
      Result := False;
      MsgDlg('Informe a Data da Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbdDataOperacao.CanFocus then
         dbdDataOperacao.SetFocus;
      Exit;
   end;

   if Trim(dblkCorretora.Text) = '' then
   begin
      Result := False;
      MsgDlg('Informe a Corretora da Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkCorretora.CanFocus then
         dblkCorretora.SetFocus;
      Exit;
   end;

   if Trim(dbDocumento.Text) = '' then
   begin
      Result := False;
      MsgDlg('Informe o Número de Documento da Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbDocumento.CanFocus then
         dbDocumento.SetFocus;
      Exit;
   end;

   if Trim(dblkCarteiraOrdem.Text) = '' then
   begin
      Result := False;
      MsgDlg('Informe a Carteira da Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkCarteiraOrdem.CanFocus then
         dblkCarteiraOrdem.SetFocus;
      Exit;
   end;

   if Trim(dblkTipoOperacao.Text) = '' then
   begin
      Result := False;
      MsgDlg('Informe o Tipo da Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkTipoOperacao.CanFocus then
         dblkTipoOperacao.SetFocus;
      Exit;
   end;

   if Trim(dblkOpcao.Text) = '' then
   begin
      Result := False;
      MsgDlg('Informe a Opção da Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkOpcao.CanFocus then
         dblkOpcao.SetFocus;
      Exit;
   end;

   if Trim(dbeLote.Text) = '' then
   begin
      if MsgDlg('Confirma a Inclusão de Ordem sem Lote?', 'Mensagem do Sistema', mtConfirmation,[MbYes, MbNo],0) = mrNo then
      begin
         Result := False;
         if dbeLote.CanFocus then
            dbeLote.SetFocus;
         Exit;
      end;
   end
   else
   if not bReversao then
   begin
      // Verificar os valores no mesmo lote
      with DMOpcoesIndice, DMOpcoesIndice.qryBuscaOrdemLote do
      begin
         OperComum.LimpaParametros(qryBuscaOrdemLote);
         ParamByName('IDLOTE').AsString := dbeLote.Text;
         ParamByName('DATAORDEM').AsString := dbdDataOperacao.Text;
         ParamByName('IDCORRETVALORES').AsInteger := QryCorretValoresIDCORRETVALORES.AsInteger;
         Open;
         case qryBuscaOrdemLote.RecordCount of
         0: ;// Ok
         1: begin
            end;
         2: begin
               if qryOrdem.State = dsEdit then
               begin
                  // Posiciona na outra ponta da ordem
                  if qryBuscaOrdemLoteIDORDEMOPCIND.AsInteger = qryOrdemIDORDEMOPCIND.AsInteger then
                     qryBuscaOrdemLote.Next;

                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('SELECT DTAVENCTO FROM OPCOES WHERE IDINVESTIMENTO = ' + FieldByName('IDINVESTIMENTO').AsString);
                  qryAux.Open;
                  if qryOpcaoDTAVENCTO.AsDateTime <> qryAux.FieldByName('DTAVENCTO').AsDateTime then
                  begin
                     Result := False;
                     MsgDlg('Os Investimentos Operados em um Mesmo Lote devem ter o mesmo Vencimento.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
                     if dblkOpcao.CanFocus then
                        dblkOpcao.SetFocus;
                     Exit;
                  end;
                  if qryBuscaOrdemLotePREMIO.AsFloat <> dbrePremio.Value then
                  begin
                     Result := False;
                     MsgDlg('As Ordens de um Mesmo Lote devem ter o mesmo Valor de Prêmio.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
                     if dbrePremio.CanFocus then
                        dbrePremio.SetFocus;
                     Exit;
                  end;
                  if qryBuscaOrdemLoteQUANTIDADE.AsFloat <> dbreQtdOper.Value then
                  begin
                     Result := False;
                     MsgDlg('As Ordens de um Mesmo Lote devem ter a mesma Quantidade.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
                     if dbreQtdOper.CanFocus then
                        dbreQtdOper.SetFocus;
                     Exit;
                  end;
               end
               else if qryOrdem.State = dsInsert then
               begin
                  Result := False;
                  MsgDlg('Este Lote Já tem Duas Ordens.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
                  if dbeLote.CanFocus then
                     dbeLote.SetFocus;
                  Exit;
               end;
            end;
         else
            begin
               Result := False;
               MsgDlg('Este Lote tem Mais de Duas Ordens.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
               if dbeLote.CanFocus then
                  dbeLote.SetFocus;
               Exit;
            end;
         end;
         Close;
      end;
   end;

   if dbreQtdOper.Value = 0 then
   begin
      Result := False;
      MsgDlg('Informe a Quantidade da Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkOpcao.CanFocus then
         dblkOpcao.SetFocus;
      Exit;
   end;

   if dbrePremio.Value = 0 then
   begin
      Result := False;
      MsgDlg('Informe o Prêmio da Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbrePremio.CanFocus then
         dbrePremio.SetFocus;
      Exit;
   end;

   if dbreVlrOper.Value = 0 then
   begin
      Result := False;
      MsgDlg('Informe o Valor da Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbreVlrOper.CanFocus then
         dbreVlrOper.SetFocus;
      Exit;
   end;

end;

function TfrmCadOrdemOpcInd.VerificaValoresCesta: Boolean;
begin
   Result := False;

   if Trim(dblkCarteiraCesta.Text) = '' then
   begin
      MsgDlg('Informe a carteira do Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkCarteiraCesta.CanFocus then
         dblkCarteiraCesta.SetFocus;
      Exit;
   end;

   if Trim(dblkCustodianteCesta.Text) = '' then
   begin
      MsgDlg('Informe a Custodiante do Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkCustodianteCesta.CanFocus then
         dblkCustodianteCesta.SetFocus;
      Exit;
   end;

   if Trim(dblkAcao.Text) = '' then
   begin
      MsgDlg('Informe o Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkAcao.CanFocus then
         dblkAcao.SetFocus;
      Exit;
   end
   else
   begin
      if qryCesta.State = dsInsert then
      begin
         // Verifica se este Investimento já foi cadastrado na cesta
         if OpcaoIndice.VerificaCestaInv(qryCestaIDCESTAOPCIND.AsInteger,
                                         qryCestaIDCARTEIRAINVEST.AsInteger,
                                         qryCestaIDCUSTODIANTE.AsInteger,
                                         qryCestaIDINVESTIMENTO.AsInteger,
                                         dbdDataOperacao.DateTime,
                                         qryCestaIDCARTEIRAGERENC.AsInteger) then
         begin
            MsgDlg('Esta Cesta já Contém este Investimento.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
            if dblkAcao.CanFocus then
               dblkAcao.SetFocus;
            Exit;
         end;
      end;
   end;

   if dbreQtdCesta.Value = 0 then
   begin
      MsgDlg('Informe a Quantidade do Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbreQtdCesta.CanFocus then
         dbreQtdCesta.SetFocus;
      Exit;
   end;

   if dbreCotacao.Value = 0 then
   begin
      MsgDlg('Informe a Cotação do Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbreCotacao.CanFocus then
         dbreCotacao.SetFocus;
      Exit;
   end;

   if dbreVlrCesta.Value = 0 then
   begin
      MsgDlg('Informe o Valor do Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbreVlrCesta.CanFocus then
         dbreVlrCesta.SetFocus;
      Exit;
   end;

   // Verifica Diferença entre a Cesta e as Operações
   if not bReversao then
   begin
      if not VerDifCesta(True,IntToStr(iOrdem),'P') then
      begin
         if dbreQtdCesta.CanFocus then
            dbreQtdCesta.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;

procedure TfrmCadOrdemOpcInd.CalculaValor;
var fValor: Double;
begin
   if not ((ActiveControl = bbtnCancelarOrdem) or
           (ActiveControl = bbtnVoltarOrdem)   or
           (ActiveControl = bbtnCancelar)      or
           (ActiveControl = bbtnSair)) then
   begin
      if (dbreQtdOper.Value <> 0) and
         (dbrePremio.Value <> 0) and
         (Trim(dblkOpcao.Text) <> '') then
      begin
         if dbreVlrOper.Value = 0 then
            fValor := dbreQtdOper.Value * dbrePremio.Value * qryOpcaoVLRPONTO.AsFloat
         else begin
            fValor := dbreVlrOper.Value;
            if fValor <> (dbreQtdOper.Value * dbrePremio.Value * qryOpcaoVLRPONTO.AsFloat) then
            begin
               if (MsgDlg('O Valor da Operação Difere do Calculo Normal, Deseja Alterar', 'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
                  fValor := dbreQtdOper.Value * dbrePremio.Value * qryOpcaoVLRPONTO.AsFloat
            end;
         end;
         dbreVlrOper.Value := fValor;
      end;
   end;
end;

procedure TfrmCadOrdemOpcInd.CalculaValorInvCesta;
var fValor: Double;
begin
   if not ((ActiveControl = bbtnCancelarCesta) or
           (ActiveControl = bbtnVoltarCesta)   or
           (ActiveControl = bbtnCancelar)      or
           (ActiveControl = bbtnSair)) then
   begin
      if (dbreQtdCesta.Value <> 0) and
         (dbreCotacao.Value <> 0) and
         (Trim(dblkAcao.Text) <> '') then
      begin
         if dbreVlrCesta.Value = 0 then
            fValor := OperComum.Trunca(dbreQtdCesta.Value * (dbreCotacao.Value / fLote),2)
         else begin
            fValor := dbreVlrCesta.Value;
            if OperComum.ComparaValores(fValor, OperComum.Trunca((dbreQtdCesta.Value * (dbreCotacao.Value / fLote)),2), '<>') then
               fValor := OperComum.Trunca(dbreQtdCesta.Value * (dbreCotacao.Value / fLote),2);
         end;
         dbreVlrCesta.Value := fValor;
      end;
   end;
end;

procedure TfrmCadOrdemOpcInd.FormShow(Sender: TObject);
var i: Integer;
begin
   inherited;
   QryCorretValores.Open;
   qryCarteiraOrdem.Open;
   qryTipoOperacao.Open;
   qryOpcao.Open;
   qryCarteiraCesta.Open;
   qryCustodianteCesta.Open;
   qryAcaoCesta.Open;
   fraMensOpcInd.Apaga;

   dbdDataOperacao.Clear;
   dblkCorretora.Clear;
   dbDocumento.Clear;

   StatusConsultar;
   msBuscaSaldos.Filtro.Add('HISTOPCIND.IDINVESTIMENTO NOT IN (SELECT IDINVESTIMENTO FROM ORDEMOPCIND, PARAMINVEST P WHERE DATAORDEM >= (P.DATAULTFECH-30) GROUP BY IDINVESTIMENTO, DATAORDEM)');

end;

procedure TfrmCadOrdemOpcInd.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   StatusInserir;
   bReversao := False;
end;

procedure TfrmCadOrdemOpcInd.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   StatusAlterar;
end;

procedure TfrmCadOrdemOpcInd.sbtnInsOrdemClick(Sender: TObject);
begin
   inherited;
   // AL_2
   if RendaVariavel.VerEmAbertura then
      Exit;

   if dbDocumento.CanFocus then
      dbDocumento.SetFocus;

   OperComum.LimpaParametros(qryOpcao);
   if Trim(dblkTipoOperacao.Text) <> '' then
      qryOpcao.ParamByName('IDTIPOOPERACAO').AsInteger := qryTipoOperacaoIDTIPOOPERACAO.AsInteger;
   qryOpcao.Open;

   AbreTransacao;

   qryOrdem.Insert;
   dbgOrdem.SendToBack;
   pgcOrdemDet.ActivePage := tbsOrdemDados;

   ControlaBtOrdem;
   SelCesta;

   pnlMestre.Enabled := False;
   tbsCesta.Enabled := False;

   bbtnConfirmar.Default := False;
   bbtnOkOrdem.Default := True;

   bbtnOkOrdem.Enabled := True;
   bbtnCancelarOrdem.Enabled := True;
   tbsOrdemDados.Enabled := True;
   tbsOrdemObs.Enabled := True;

   qryOrdemIDCARTEIRAINVEST.AsInteger := qryCarteiraOrdemIDCARTEIRAINVEST.AsInteger;
   dblkCarteiraOrdem.Text := qryCarteiraOrdemCARTEIRA.AsString;
   dblkCarteiraOrdem.PerformSearch;

   if dblkTipoOperacao.CanFocus then
      dblkTipoOperacao.SetFocus;
end;

procedure TfrmCadOrdemOpcInd.sbtnAltOrdemClick(Sender: TObject);
begin
   inherited;

   // AL_2
   if RendaVariavel.VerEmAbertura then
      Exit;

   qryOpcao.Locate('IDINVESTIMENTO',qryOrdemIDINVESTIMENTO.AsInteger,[]);
   dblkOpcao.Text        := qryOrdem.FieldByName('DESCINVESTIMENTO').AsString;


   if dbDocumento.CanFocus then
      dbDocumento.SetFocus;

   AbreTransacao;

   qryOrdem.Edit;
   dbgOrdem.SendToBack;
   pgcOrdemDet.ActivePage := tbsOrdemDados;

   ControlaBtOrdem;

   pnlMestre.Enabled := False;
   tbsCesta.Enabled := False;
   bbtnConfirmar.Default := False;
   bbtnOkOrdem.Default := True;

   bbtnOkOrdem.Enabled := True;
   bbtnCancelarOrdem.Enabled := True;
   tbsOrdemDados.Enabled := True;
   tbsOrdemObs.Enabled := True;

   if dblkCarteiraOrdem.CanFocus then
      dblkCarteiraOrdem.SetFocus;
end;

procedure TfrmCadOrdemOpcInd.bbtnOkOrdemClick(Sender: TObject);
begin

   // AL_1
   //AL_3
   if not CtrlInvContab.TestaPeriodo(dbdDataOperacao.Text, 2, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbdDataOperacao.CanFocus then
         dbdDataOperacao.SetFocus;
      Exit;
   end;
   //AL_5
   //Retirado devido a implementação da crítica de mercado
   {
   //AL_4
   else
   if not CtrlInvContab.TestaPeriodo(dbdDataOperacao.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbdDataOperacao.CanFocus then
         dbdDataOperacao.SetFocus;
      Exit;
   end;}

   // Gera Numero de Documento, se nenhum foi digitado ou gerado
   if (Trim(dbDocumento.Text) = '') then
   begin
      dbDocumento.Text := OpcaoIndice.GeraNumDoc(dbdDataOperacao.DateTime,
                                                 QryCorretValoresIDCORRETVALORES.AsInteger);
   end;
   qryOrdemIDBOLETA.AsString := dbDocumento.Text;

   // Faz a Verificação dos Campos Digitados
   if not VerificaValoresOrdem then
      Exit;

   inherited;

   try
      try
         // Se houver uma cesta cadastrada
         if not qryCesta.IsEmpty then
            qryOrdemIDCESTAOPCIND.AsInteger := qryCestaIDCESTAOPCIND.AsInteger;

         if qryOrdem.State = dsInsert then
            qryOrdemIDORDEMOPCIND.AsInteger := LeUltRegistro(nil,'ORDEMOPCIND');

         qryOrdemDATAORDEM.AsDateTime := dbdDataOperacao.DateTime;
         qryOrdemIDCORRETVALORES.AsInteger := QryCorretValoresIDCORRETVALORES.AsInteger;
         qryOrdemIDTIPOINVEST.AsInteger := qryTipoOperacaoIDTIPOINVEST.AsInteger;
         qryOrdemSTATUS.AsString := 'A';
         qryOrdemIDUSUARIO.AsInteger := Sistema.IdUsuario;
         qryOrdemIDPLANPREVCTBPATR.AsInteger := iPlanPrevCtbPatro;
         qryOrdemSTACONFIRMA.AsString := 'S';
         qryOrdemSTAAUTORIZA.AsString := 'S';
         qryOrdemIDCARTEIRAGERENC.Clear;
         // Força a gravação do ID da Carteira
         qryOrdemIDCARTEIRAINVEST.AsInteger := qryCarteiraOrdemIDCARTEIRAINVEST.AsInteger;

         // Grava as descrições para visualização antes reabrir a query
         qryOrdemCARTEIRA.AsString := qryCarteiraOrdemCARTEIRA.AsString;
         qryOrdemDESCINVESTIMENTO.AsString := qryOpcaoDESCINVESTIMENTO.AsString;
         qryOrdemDESCTIPOOPERACAO.AsString := qryTipoOperacaoDESCTIPOOPERACAO.AsString;

         // Grava as edições
         qryOrdem.Post;
         qryOrdem.ApplyUpdates;

      except on E: Exception do
         begin
            bbtnCancelarOrdem.Click;
            bbtnCancelar.Click;
            MsgDlg('Ocorreu um problema na Inclusão desta Ordem.' + #13 +
                   'Mensagem: ' + E.Message, 'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      end;
   finally
      dbgOrdem.BringToFront;
      HabilitaMestre(True);
      pnlMestre.Enabled := True;
      tbsCesta.Enabled := True;
      bbtnOkOrdem.Default := False;
      bbtnConfirmar.Default := True;
      ControlaBtOrdem;
      sbtnBuscaSaldos.Down := False;
   end;
end;

procedure TfrmCadOrdemOpcInd.bbtnCancelarOrdemClick(Sender: TObject);
begin
   inherited;
   qryOrdem.Cancel;
   dbgOrdem.BringToFront;
   HabilitaMestre(True);   
   pnlMestre.Enabled := True;
   tbsCesta.Enabled := True;
   bbtnOkOrdem.Default := False;
   bbtnConfirmar.Default := True;
   Seleciona;
end;

procedure TfrmCadOrdemOpcInd.bbtnConfirmarClick(Sender: TObject);
begin
   if (qryOrdem.State in [dsInsert, dsEdit]) or
      (qryCesta.State in [dsInsert, dsEdit])  then
   begin
      MsgDlg('Existe uma Ordem ou Cesta não Confirmada. Termine a Operação Pendente.',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);

      if qryOrdem.State in [dsInsert, dsEdit] then
      begin
         if dblkCarteiraOrdem.CanFocus then
            dblkCarteiraOrdem.SetFocus;
      end else if qryCesta.State in [dsInsert, dsEdit] then
      begin
         if dblkCarteiraCesta.CanFocus then
            dblkCarteiraCesta.SetFocus;
      end;

      Exit;
   end;

   // AL_1
   //AL_3
   if not CtrlInvContab.TestaPeriodo(dbdDataOperacao.Text, 2, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbdDataOperacao.CanFocus then
         dbdDataOperacao.SetFocus;
      Exit;
   end;
   //AL_5
   //Retirado devido a implementação da crítica de mercado
   {
   //AL_4
   else
   if not CtrlInvContab.TestaPeriodo(dbdDataOperacao.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbdDataOperacao.CanFocus then
         dbdDataOperacao.SetFocus;
      Exit;
   end;}

   // Verifica se todas as operações que exigem Cesta têm uma cadastrada
   if not VerificaCestaOrdem then
      Exit;

   // Verifica Diferença entre a Cesta e as Operações
   if not bReversao then
   begin
      if not VerDifCesta(True,'-1','T') then
         Exit;
   end;
   
   if qryOrdem.UpdatesPending then
      qryOrdem.ApplyUpdates;
   if qryCesta.UpdatesPending then
      qryCesta.ApplyUpdates;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
   qryOrdem.CommitUpdates;
   qryCesta.CommitUpdates;
   StatusConsultar;
   inherited;
end;

procedure TfrmCadOrdemOpcInd.bbtnCancelarClick(Sender: TObject);
begin
   qryOrdem.Cancel;
   qryOrdem.CancelUpdates;
   qryCesta.Cancel;
   qryCesta.CancelUpdates;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   StatusConsultar;
   inherited;
end;

procedure TfrmCadOrdemOpcInd.bbtnSairClick(Sender: TObject);
begin
   if (qryOrdem.State in [dsInsert, dsEdit]) or
      (qryCesta.State in [dsInsert, dsEdit]) or
      (dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      if MsgDlg('Existem Ordens não Confirmadas. Deseja Cancelar as Alterações Pendentes?',
                'Mensagem do Sistema ', mtConfirmation, [mbYes, mbNo],0) = mrNo then
      begin
         if qryOrdem.State in [dsInsert, dsEdit] then
         begin
            if dblkCarteiraOrdem.CanFocus then
               dblkCarteiraOrdem.SetFocus;
         end else if qryCesta.State in [dsInsert, dsEdit] then
         begin
            if dblkCarteiraCesta.CanFocus then
               dblkCarteiraCesta.SetFocus;
         end else
            if dbdDataOperacao.CanFocus then
               dbdDataOperacao.SetFocus;
         Exit;
      end;
   end;

   if qryOrdem.State in [dsInsert, dsEdit] then
      qryOrdem.CancelUpdates;
   if qryCesta.State in [dsInsert, dsEdit] then
      qryCesta.CancelUpdates;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   inherited;
end;

procedure TfrmCadOrdemOpcInd.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
   if (qryOrdem.State in [dsInsert, dsEdit]) or
      (qryCesta.State in [dsInsert, dsEdit]) or
      (dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      if MsgDlg('Existem Ordens não Confirmadas. Deseja Cancelar as Alterações Pendentes?',
                'Mensagem do Sistema ', mtConfirmation, [mbYes, mbNo],0) = mrNo then
      begin
         if qryOrdem.State in [dsInsert, dsEdit] then
         begin
            if dblkCarteiraOrdem.CanFocus then
               dblkCarteiraOrdem.SetFocus;
         end else if qryCesta.State in [dsInsert, dsEdit] then
         begin
            if dblkCarteiraCesta.CanFocus then
               dblkCarteiraCesta.SetFocus;
         end else
            if dbdDataOperacao.CanFocus then
               dbdDataOperacao.SetFocus;
         Exit;
      end;
   end;

   if qryOrdem.State in [dsInsert, dsEdit] then
      qryOrdem.CancelUpdates;
   if qryCesta.State in [dsInsert, dsEdit] then
      qryCesta.CancelUpdates;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   QryCorretValores.Close;
   qryCarteiraOrdem.Close;
   qryTipoOperacao.Close;
   qryOpcao.Close;
   qryCarteiraCesta.Close;
   qryCustodianteCesta.Close;
   qryAcaoCesta.Close;
   Action := caFree;
   inherited;
end;

procedure TfrmCadOrdemOpcInd.qryCestaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  MostraVlrCesta;
end;

procedure TfrmCadOrdemOpcInd.dblkCarteiraCestaEnter(Sender: TObject);
begin
   inherited;
   if Trim(dblkCarteiraCesta.Text) = '' then
      sLkCartCesta := '0'
   else sLkCartCesta := dblkCarteiraCesta.LookupValue;
end;

procedure TfrmCadOrdemOpcInd.dblkCarteiraCestaExit(Sender: TObject);
begin
   inherited;
   if dblkCarteiraCesta.LookupValue <> sLkCartCesta then
   begin
      AbreQryCustodiante;
      AbreQryAcoes;
   end;
end;

procedure TfrmCadOrdemOpcInd.dblkCustodianteCestaEnter(Sender: TObject);
begin
   inherited;
   if Trim(qryCustodianteCesta.Text) = '' then
      sLkCustCesta := '0'
   else sLkCustCesta := dblkCustodianteCesta.LookupValue;
end;

procedure TfrmCadOrdemOpcInd.dblkCustodianteCestaExit(Sender: TObject);
begin
   inherited;
   if dblkCustodianteCesta.LookupValue <> sLkCustCesta then
      AbreQryAcoes;
end;


procedure TfrmCadOrdemOpcInd.dbreQtdOperExit(Sender: TObject);
begin
   inherited;
   CalculaValor;
end;

procedure TfrmCadOrdemOpcInd.dbrePremioExit(Sender: TObject);
begin
   inherited;
   CalculaValor;
end;

procedure TfrmCadOrdemOpcInd.dbdDataOperacaoExit(Sender: TObject);
begin
   inherited;
   if DsOrdem.State <> DsInsert then
   begin
      Seleciona;
      OperComum.LimpaParametros(qryOpcao);
      if Trim(dblkTipoOperacao.Text) <> '' then
         qryOpcao.ParamByName('IDTIPOOPERACAO').AsInteger := qryTipoOperacaoIDTIPOOPERACAO.AsInteger;
      qryOpcao.Open;
   end
   else
   begin
      if dbreQtdOper.CanFocus then
         dbreQtdOper.SetFocus;
   end;
end;

procedure TfrmCadOrdemOpcInd.dblkCorretoraExit(Sender: TObject);
begin
   inherited;
   Seleciona;
   if Trim(dbDocumento.Text) <> '' then
      dbDocumento.Text := OpcaoIndice.GeraNumDoc(dbdDataOperacao.DateTime,
                                                 QryCorretValoresIDCORRETVALORES.AsInteger);
end;

procedure TfrmCadOrdemOpcInd.bbtnCancelarCestaClick(Sender: TObject);
begin
   inherited;
   qryCesta.Cancel;
   dbgCesta.BringToFront;
   HabilitaMestre(True);
   pnlMestre.Enabled := True;
   tbsOrdem.Enabled := True;
   bbtnOkCesta.Default := False;
   bbtnConfirmar.Default := True;
   SelCesta;
   pgctrlDetalhe.ActivePage := tbsCesta;
end;

procedure TfrmCadOrdemOpcInd.bbtnOkCestaClick(Sender: TObject);
var bIns: Boolean;
begin
   // AL_1
   //AL_3
   if not CtrlInvContab.TestaPeriodo(dbdDataOperacao.Text, 2, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      Exit;
   end;
   //AL_5
   //Retirado devido a implementação da crítica de mercado
   {
   //AL_4
   else
   if not CtrlInvContab.TestaPeriodo(dbdDataOperacao.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbdDataOperacao.CanFocus then
         dbdDataOperacao.SetFocus;
      Exit;
   end;}

   fDif := qryCestaVALOR.AsFloat - fValAnt;
   iOrdem := qryOrdemIDORDEMOPCIND.AsInteger;

   // Faz a Verificação dos Campos Digitados
   if not VerificaValoresCesta then
      Exit;

   fDif := 0;
   fValAnt := 0;
   iOrdem := 0;

   inherited;

   try
      try
         if qryCesta.State = dsInsert then
            bIns := True
         else
            bIns := False;

         // Grava Carteira Gerencial, se for o caso
         qryCestaIDCARTEIRAGERENC.Clear;
         if not qryCarteiraCestaIDCARTEIRAGERENC.IsNull then
            qryCestaIDCARTEIRAGERENC.AsInteger := qryCarteiraCestaIDCARTEIRAGERENC.AsInteger;

         // Neste for só é permitido manipular a Cesta na sua Primeira Vigência
         qryCestaDATAVIGENCIA.AsDateTime := dbdDataOperacao.DateTime;

         // Grava as descrições para visualização antes reabrir a query
         qryCestaDESCINVESTIMENTO.AsString := qryAcaoCestaDESCINVESTIMENTO.AsString;
         qryCestaCARTEIRA.AsString := qryCarteiraCestaCARTEIRA.AsString;
         qryCestaSGLCUSTODIANTE.AsString := qryCustodianteCestaSGLCUSTODIANTE.AsString;

         // Grava as edições
         qryCesta.Post;
         qryCesta.ApplyUpdates;

         // Insere o ID da Cesta na Ordem
         qryOrdem.Edit;
         qryOrdemIDCESTAOPCIND.AsInteger := qryCestaIDCESTAOPCIND.AsInteger;
         qryOrdem.Post;
         qryOrdem.ApplyUpdates;

      except on E: Exception do
         begin
            bbtnCancelarCesta.Click;
            MsgDlg('Ocorreu um problema na Inclusão deste Investimento na Cesta.' + #13 +
                   'Mensagem: ' + E.Message, 'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      end;
   finally
      bbtnOkCesta.Default := False;
      bbtnConfirmar.Default := True;
      dbgCesta.BringToFront;
      tbsOrdem.Enabled := True;
      HabilitaMestre(True);      
      pnlMestre.Enabled := True;
      ControlaBtCesta;
      MostraVlrCesta;
      bReversao := False;
   end;
end;

procedure TfrmCadOrdemOpcInd.sbtnExcluiOrdemClick(Sender: TObject);
begin
   inherited;
   // AL_2
   if RendaVariavel.VerEmAbertura then
      Exit;

   // AL_1
   //AL_3
   if not CtrlInvContab.TestaPeriodo(qryOrdemDATAORDEM.AsString, 2, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      Exit;
   end;
   //AL_5
   //Retirado devido a implementação da crítica de mercado
   {
   //AL_4
   else
   if not CtrlInvContab.TestaPeriodo(dbdDataOperacao.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbdDataOperacao.CanFocus then
         dbdDataOperacao.SetFocus;
      Exit;
   end;}

   if (MsgDlg('Deseja realmente excluir esta Ordem?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
   begin
      AbreTransacao;
      try
         try
            fraMensOpcInd.Mostra;
            fraMensOpcInd.Max := qryCesta.RecordCount + 1;
            if not qryOrdemIDCESTAOPCIND.IsNull then
            begin
               OperComum.LimpaParametros(qryVerificaVigencias);
               qryVerificaVigencias.ParamByName('IDCESTAOPCIND').AsInteger := qryOrdemIDCESTAOPCIND.AsInteger;
               qryVerificaVigencias.ParamByName('DATAVIGENCIA').AsString := dbdDataOperacao.Text;
               qryVerificaVigencias.Open;
               if not qryVerificaVigencias.IsEmpty then
                  Raise Exception.Create('Esta Ordem Possui uma Cesta com Mais de Uma Vigência.');

               fraMensOpcInd.Max := qryCesta.RecordCount;
               qryCesta.First;
               while not qryCesta.Eof do
               begin
                  fraMensOpcInd.Mes := 'Excluindo Cesta - Investimento: ' + qryCestaDESCINVESTIMENTO.AsString;
                  qryCesta.Delete;
                  qryCesta.Next;
                  fraMensOpcInd.Incrementa;
               end;
            end;

            fraMensOpcInd.Mes := 'Excluindo a Ordem: ' + qryOrdemDESCINVESTIMENTO.AsString;
            qryOrdem.Delete;
            fraMensOpcInd.Incrementa;

            qryCesta.ApplyUpdates;
            qryOrdem.ApplyUpdates;
            qryCesta.CommitUpdates;
            qryOrdem.CommitUpdates;
         except on E: Exception do
            begin
               fraMensOpcInd.Mes := 'Erro na exclusão';
               fraMensOpcInd.Pos := 0;
               fraMensOpcInd.Max := 0;
               if qryCesta.UpdatesPending then
                  qryCesta.CancelUpdates;
               if qryOrdem.UpdatesPending then
                  qryOrdem.CancelUpdates;
               MsgDlg('Ocorreu um Problema na Exclusão desta Ordem: ' + #13 +
                      E.Message,'Mensagem do Sistema ', mtError,[mbOK],0);
            end;
         end;
      finally
         fraMensOpcInd.Apaga;
      end;
   end;
end;

procedure TfrmCadOrdemOpcInd.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then
  begin
     dbdDataOperacao.Text := MontaSelect.ValoresChave[0];
     dbdDataOperacao.DateTime := StrToDateTime(MontaSelect.ValoresChave[0]);
     dblkCorretora.Text := MontaSelect.ValoresChave[1];
     dblkCorretora.PerformSearch;
     dbDocumento.Text := MontaSelect.ValoresChave[2];
     StatusConsultar;
  end;
  sbtnProcurar.Down := False;
end;

procedure TfrmCadOrdemOpcInd.sbtnInsCestaClick(Sender: TObject);
var iCesta: Integer;
begin
   inherited;
   // AL_2
   if RendaVariavel.VerEmAbertura then
      Exit;

   if dbDocumento.CanFocus then
      dbDocumento.SetFocus;

   if qryCesta.IsEmpty then
      iCesta := LeUltRegistro(nil,'CESTAOPCIND')
   else
      iCesta := qryCestaIDCESTAOPCIND.AsInteger;

   AbreTransacao;

   qryCesta.Insert;
   qryCestaIDCESTAOPCIND.AsInteger := iCesta;
   dbgCesta.SendToBack;

   ControlaBtCesta;

   bbtnOkCesta.Enabled := True;
   bbtnCancelarCesta.Enabled := True;
   pnlDadosCesta.Enabled := True;
   bbtnConfirmar.Default := False;
   bbtnOkCesta.Default := True;

   pnlMestre.Enabled := False;
   tbsOrdem.Enabled := False;

   // Libera chave primária para inclusão
   dblkCarteiraCesta.Enabled := True;
   dblkCustodianteCesta.Enabled := True;
   dblkAcao.Enabled := True;

   // Limpa Valores de uma inserção anterior
   dbreQtdCesta.Value := 0;
   dbreCotacao.Value := 0;
   dbreVlrCesta.Value := 0;
   fValAnt := 0;

   if dblkCarteiraCesta.CanFocus then
      dblkCarteiraCesta.SetFocus;
end;

procedure TfrmCadOrdemOpcInd.sbtnAltCestaClick(Sender: TObject);
begin
   inherited;
   // AL_2
   if RendaVariavel.VerEmAbertura then
      Exit;

   if dbDocumento.CanFocus then
      dbDocumento.SetFocus;

   OperComum.LimpaParametros(qryCustodianteCesta);
   qryCustodianteCesta.ParamByName('DATAMOV').AsString := dbdDataOperacao.Text;
   qryCustodianteCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCestaIDCARTEIRAINVEST.AsInteger;
   qryCustodianteCesta.Open;

   OperComum.LimpaParametros(qryAcaoCesta);
   qryAcaoCesta.ParamByName('DATAMOV').AsString := dbdDataOperacao.Text;
   qryAcaoCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCestaIDCARTEIRAINVEST.AsInteger;
   qryAcaoCesta.ParamByName('IDCUSTODIANTE').AsInteger := qryCestaIDCUSTODIANTE.AsInteger;
   qryAcaoCesta.Open;

   dblkAcaoExit(Self);

   AbreTransacao;

   qryCesta.Edit;
   dbgCesta.SendToBack;

   ControlaBtCesta;

   pnlMestre.Enabled := False;
   tbsOrdem.Enabled := False;

   bbtnOkCesta.Enabled := True;
   bbtnCancelarCesta.Enabled := True;
   pnlDadosCesta.Enabled := True;
   bbtnConfirmar.Default := False;
   bbtnOkCesta.Default := True;

   // Proíbe edição da chave primária
   dblkCarteiraCesta.Enabled := False;
   dblkCustodianteCesta.Enabled := False;
   dblkAcao.Enabled := False;

   fValAnt := qryCestaVALOR.AsFloat;

   if dbreQtdCesta.CanFocus then
      dbreQtdCesta.SetFocus;
end;

procedure TfrmCadOrdemOpcInd.MostraVlrCesta;
begin
  lblValTotCesta.Caption := FormatFloat('###,###,###,###,##0.00',
                                        OpcaoIndice.BuscaValorCesta(qryCestaIDCESTAOPCIND.AsInteger,
                                        qryCestaDATAVIGENCIA.AsDateTime));
  lblValMinCesta.Caption := FormatFloat('###,###,###,###,##0.00', fMinCesta);
  lblValMaxCesta.Caption := FormatFloat('###,###,###,###,##0.00', fMaxCesta);
end;

procedure TfrmCadOrdemOpcInd.sbtnExcluiCestaClick(Sender: TObject);
begin
   inherited;
   // AL_2
   if RendaVariavel.VerEmAbertura then
      Exit;

   // AL_1
   //AL_3
   if not CtrlInvContab.TestaPeriodo(qryCestaDATAVIGENCIA.AsString, 2, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      Exit;
   end;
   //AL_5
   //Retirado devido a implementação da crítica de mercado
   {
   //AL_4
   else
   if not CtrlInvContab.TestaPeriodo(dbdDataOperacao.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbdDataOperacao.CanFocus then
         dbdDataOperacao.SetFocus;
      Exit;
   end;}

   if (MsgDlg('Deseja realmente excluir este Investimento?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
   begin
      AbreTransacao;
      try
         try
            fraMensOpcInd.Mostra;
            fraMensOpcInd.Max := 1;
            fraMensOpcInd.Mes := 'Excluindo Cesta - Investimento: ' + qryCestaDESCINVESTIMENTO.AsString;
            qryCesta.Delete;
            fraMensOpcInd.Incrementa;
            if qryCesta.RecordCount = 0 then
            begin
               qryOrdem.Edit;
               qryOrdemIDCESTAOPCIND.Clear;
               qryOrdem.Post;
               qryOrdem.ApplyUpdates;
               // Verifica se todas as operações que exigem Cesta têm uma cadastrada
               if not VerificaCestaOrdem then
               begin
                  Exit;
               end;
            end
            else
            begin
               qryCesta.ApplyUpdates;
               qryCesta.CommitUpdates;
            end;
         except
            fraMensOpcInd.Mes := 'Erro na exclusão';
            fraMensOpcInd.Pos := 0;
            fraMensOpcInd.Max := 0;
            if qryCesta.UpdatesPending then
               qryCesta.CancelUpdates;
            MsgDlg('Não foi possível excluir o Investimento desta Cesta.',
                   'Mensagem do Sistema', mtError,[mbOK],0);
         end;
      finally
         fraMensOpcInd.Apaga;
         MostraVlrCesta;
      end;
   end;
end;

procedure TfrmCadOrdemOpcInd.dbgOrdemDblClick(Sender: TObject);
begin
   inherited;

   if sbtnAltOrdem.Enabled then
      sbtnAltOrdem.Click
   else
      sbtnConsOrdem.Click;
end;

procedure TfrmCadOrdemOpcInd.dbgCestaDblClick(Sender: TObject);
begin
   inherited;
   if (qryOrdemIDTIPOOPERACAO.AsInteger = -86) and
      (sbtnAltCesta.Enabled) then
      sbtnAltCesta.Click
   else
      sbtnConsCesta.Click;
end;

procedure TfrmCadOrdemOpcInd.pgctrlDetalheChange(Sender: TObject);
begin
   inherited;
   if qryOrdemIDTIPOOPERACAO.AsInteger = -86 then // Venda de Opção de Compra
   begin
      if pgctrlDetalhe.ActivePage = tbsCesta then
      begin
         ControlaBtCesta;
         if not bReversao then
            VerDifCesta(False,qryOrdemIDLOTE.AsString,'T');
      end;
   end;
end;

procedure TfrmCadOrdemOpcInd.dblkAcaoExit(Sender: TObject);
var fCotacao: Double;
begin
   inherited;
   fCotacao := OpcaoIndice.BuscaCotacaoLoteAcao(qryAcaoCestaIDINVESTIMENTO.AsInteger,
                                                (dbdDataOperacao.DateTime),
                                                False, fLote);
               
   if (dbreCotacao.Value = 0) or
      (dblkAcao.LookupValue <> sLKAcao)then
      dbreCotacao.Value := fCotacao;

   if (dbreQtdCesta.Value = 0) or
      (dblkAcao.LookupValue <> sLKAcao)then
      dbreQtdCesta.Value := qryAcaoCestaSALDOLIBERADO.AsFloat;

   CalculaValorInvCesta;
end;

procedure TfrmCadOrdemOpcInd.dbreQtdCestaExit(Sender: TObject);
begin
   inherited;
   CalculaValorInvCesta;
end;

procedure TfrmCadOrdemOpcInd.dbreCotacaoExit(Sender: TObject);
begin
   inherited;
   CalculaValorInvCesta;
end;

function TfrmCadOrdemOpcInd.VerificaCestaOrdem: Boolean;
begin
   Result := True;
   qryOrdem.First;
   while not qryOrdem.Eof do
   begin
      if (qryOrdemIDTIPOOPERACAO.AsInteger = -86) then
      begin
         if (qryOrdemIDCESTAOPCIND.IsNull) then
         begin
            MsgDlg('Existe uma Ordem de Venda de Opção de Compra sem Cesta Cadastrada.' + #13 +
                   'É Necessário Efetuar o Cadastro.',
                   'Mensagem do Sistema', mtWarning,[mbOK],0);

            Result := False;
            Exit;
         end;
      end;
      qryOrdem.Next;
   end;
end;

procedure TfrmCadOrdemOpcInd.AbreTransacao;
begin
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
end;

procedure TfrmCadOrdemOpcInd.sbtnConsCestaClick(Sender: TObject);
begin
   inherited;
   if dbDocumento.CanFocus then
      dbDocumento.SetFocus;

   OperComum.LimpaParametros(qryCustodianteCesta);
   qryCustodianteCesta.ParamByName('DATAMOV').AsString := dbdDataOperacao.Text;
   qryCustodianteCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCestaIDCARTEIRAINVEST.AsInteger;
   qryCustodianteCesta.Open;

   OperComum.LimpaParametros(qryAcaoCesta);
   qryAcaoCesta.ParamByName('DATAMOV').AsString := dbdDataOperacao.Text;
   qryAcaoCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCestaIDCARTEIRAINVEST.AsInteger;
   qryAcaoCesta.ParamByName('IDCUSTODIANTE').AsInteger := qryCestaIDCUSTODIANTE.AsInteger;
   qryAcaoCesta.Open;

   dblkAcaoExit(Self);

   dbgCesta.SendToBack;
   sbtnInsCesta.Enabled := False;
   sbtnAltCesta.Enabled := False;
   sbtnExcluiCesta.Enabled := False;
   sbtnConsCesta.Down := True;
   sbtnConsCesta.Enabled := False;

   pnlMestre.Enabled := False;
   tbsOrdem.Enabled := False;
   bbtnConfirmar.Default := False;

   bbtnOkCesta.Enabled := False;
   bbtnCancelarCesta.Enabled := False;
   pnlDadosCesta.Enabled := False;

   // Proíbe edição da chave primária
   dblkCarteiraCesta.Enabled := False;
   dblkCustodianteCesta.Enabled := False;
   dblkAcao.Enabled := False;
   if dbreQtdCesta.CanFocus then
      dbreQtdCesta.SetFocus;
end;

procedure TfrmCadOrdemOpcInd.sbtnConsOrdemClick(Sender: TObject);
begin
   inherited;
   qryOpcao.Locate('IDINVESTIMENTO',qryOrdemIDINVESTIMENTO.AsInteger,[]);
   dblkOpcao.Text        := qryOrdem.FieldByName('DESCINVESTIMENTO').AsString;



   if dbDocumento.CanFocus then
      dbDocumento.SetFocus;

   dbgOrdem.SendToBack;
   pgcOrdemDet.ActivePage := tbsOrdemDados;
   sbtnInsOrdem.Enabled := False;
   sbtnAltOrdem.Enabled := False;
   sbtnExcluiOrdem.Enabled := False;
   sbtnConsOrdem.Down := True;
   sbtnConsOrdem.Enabled := False;

   pnlMestre.Enabled := False;
   tbsCesta.Enabled := False;
   bbtnConfirmar.Default := False;
   bbtnOkOrdem.Default := True;

   bbtnOkOrdem.Enabled := False;
   bbtnCancelarOrdem.Enabled := False;
   tbsOrdemDados.Enabled := False;
   tbsOrdemObs.Enabled := False;

   if dblkCarteiraOrdem.CanFocus then
      dblkCarteiraOrdem.SetFocus;

end;

procedure TfrmCadOrdemOpcInd.dblkAcaoEnter(Sender: TObject);
begin
   inherited;
   if Trim(dblkAcao.Text) = '' then
      sLKAcao := '0'
   else sLKAcao := dblkAcao.LookupValue;
end;

procedure TfrmCadOrdemOpcInd.dblkTipoOperacaoEnter(Sender: TObject);
begin
  inherited;
   if (Trim(dblkTipoOperacao.Text) = '') or (sLKTipoOperacao <> '0') then
      sLKTipoOperacao := '0'
   else sLKTipoOperacao := dblkTipoOperacao.LookupValue;
end;

procedure TfrmCadOrdemOpcInd.dblkTipoOperacaoExit(Sender: TObject);
begin
  inherited;
  if dblkTipoOperacao.LookupValue <> sLKTipoOperacao then
  begin
     // Filtrar as opções pelo tipo de Operaçao
     OperComum.LimpaParametros(qryOpcao);
     if Trim(dblkTipoOperacao.Text) <> '' then
        qryOpcao.ParamByName('IDTIPOOPERACAO').AsInteger := qryTipoOperacaoIDTIPOOPERACAO.AsInteger;
     qryOpcao.Open;
  end;
end;

// Verifica o valor da cesta se está de acordo com o total possível
//  sModo: T - Total, verifica todos os limites, mínimo e máximo
//         P - Parcial, verifica somente o valor máximo
function TfrmCadOrdemOpcInd.VerDifCesta(bValidaCesta: Boolean; sIdLote: String;
                                        sModo: String = 'T'): boolean;
var
   fVlrMaior, fVlrMenor, fVlrCesta, fValor : Double;
   bFirst : boolean;
   sLote: String;
   bmReg: TBookmark;
   sVlrCesta,sVlrMaior,sVlrMenor : String;

begin
   Result    := True;
   fVlrMaior := 0;
   fVlrMenor := 0;
   fVlrCesta := 0;
   bFirst    := True;

   bmReg := qryOrdem.GetBookmark;
   qryOrdem.DisableControls;
   qryCesta.DisableControls;
   bVerificandoCesta := True;
   qryOrdem.First;
   while not qryOrdem.Eof do
   begin
      sLote := qryOrdemIDLOTE.AsString;
      if (sLote <> sIdLote) and (sIdLote <> '-1') then
      begin
         qryOrdem.Next;
         Continue;
      end;
      while ((not qryOrdem.Eof) and
             (sLote = qryOrdemIDLOTE.AsString)) do
      begin
         if not qryOrdemIDCESTAOPCIND.IsNull then
         begin
            fVlrCesta := OpcaoIndice.BuscaValorCesta(qryOrdemIDCESTAOPCIND.AsInteger, qryOrdemDATAORDEM.AsDateTime);
            if iOrdem = qryOrdemIDORDEMOPCIND.AsInteger then
            begin
               fVlrCesta := fVlrCesta + fDif;
            end;
         end;

         fValor := OpcaoIndice.BuscaValorMaxCesta(qryOrdemIDORDEMOPCIND.AsInteger);

         if bFirst then
         begin
             fVlrMaior := fValor;
             fVlrMenor := fValor;
             bFirst    := False;
         end
         else
         begin
            if fValor > fVlrMaior then
               fVlrMaior := fValor;
            if fValor < fVlrMenor then
               fVlrMenor := fValor;
         end;
         qryOrdem.Next;
      end;

      fMinCesta := fVlrMenor;
      fMaxCesta := fVlrMaior;

      if (fVlrCesta <> 0) and (bValidaCesta = True) and (fMinCesta <> fMaxCesta)then
      begin
         sVlrCesta := FormatFloat('###,###,###,###,##0.00',fVlrCesta);
         sVlrMaior := FormatFloat('###,###,###,###,##0.00',fVlrMaior + pRPI.DIFMAXOPCIND);
         sVlrMenor := FormatFloat('###,###,###,###,##0.00',fVlrMenor - pRPI.DIFMAXOPCIND);

         if fVlrCesta > (fVlrMaior + pRPI.DIFMAXOPCIND) then
         begin
            MsgDlg('O Valor da Cesta: ' + sVlrCesta + ' é Superior ao ' + #13 +
                   'Valor da Maior Operação mais o Limite Permitido: ' + sVlrMaior,
                   'Mensagem do Sistema', MtWarning,[MbOk],0);
            bValidaCesta := False;
            Result := False;
         end;

         if (fVlrCesta < (fVlrMenor - pRPI.DIFMAXOPCIND)) and
            (sModo = 'T') then
         begin
            MsgDlg('O Valor da Cesta: ' + sVlrCesta + ' é Inferior ao ' + #13 +
                   'Valor da Menor Operação menos o Limite Permitido: ' + sVlrMenor,
                   'Mensagem do Sistema', MtWarning,[MbOk],0);
            bValidaCesta := False;
            Result := False;
         end;
      end;
   end;
   qryOrdem.GotoBookmark(bmReg);
   qryOrdem.EnableControls;
   qryCesta.EnableControls;
   bVerificandoCesta := False;
end;

procedure TfrmCadOrdemOpcInd.sbtnMovimentoClick(Sender: TObject);
begin
   inherited;
   
      OperComum.LimpaParametros(DmRelConsMovOpcInd.qryOrdem);
      if dbdDataOperacao.Date <> 0 then
         DmRelConsMovOpcInd.qryOrdem.ParamByName('DATAORDEM').AsString        := dbdDataOperacao.Text;
      if Trim(dblkCorretora.Text) <> '' then
         DmRelConsMovOpcInd.qryOrdem.ParamByName('IDCORRETVALORES').AsInteger := QryCorretValoresIDCORRETVALORES.AsInteger;
      DmRelConsMovOpcInd.qryOrdem.Open;

      OperComum.LimpaParametros(DmRelConsMovOpcInd.qryCesta);
      if dbdDataOperacao.Date <> 0 then
         DmRelConsMovOpcInd.qryCesta.ParamByName('DATAVIGENCIA').AsString     := dbdDataOperacao.Text;
      DmRelConsMovOpcInd.qryCesta.Open;

      TfrmPreview.CreateModalPreview(Application,
                                     DmRelConsMovOpcInd.rpConsMovOpcInd,
                                     DmRelConsMovOpcInd.rpConsMovOpcInd.PrinterSetup.DocumentName);
      sbtnMovimento.Down := False;

end;

procedure TfrmCadOrdemOpcInd.qryOrdemAfterPost(DataSet: TDataSet);
begin
   inherited;
   if not bVerificandoCesta then
   begin
      // A Orelha de Cesta só fica visivel na operação de Venda de Opção de Compra
      if qryOrdemIDTIPOOPERACAO.AsInteger = -86 then
         tbsCesta.TabVisible := True
      else
         tbsCesta.TabVisible := False;
   end;

   SelCesta;
end;

procedure TfrmCadOrdemOpcInd.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Teclando INS, se a orelha ativa for a de Cesta, se o botão de Inserir Cesta estiver
  //    habilitado executa o Click de insersão de cesta
  if (pgctrlDetalhe.ActivePage = tbsCesta) and (sbtnInsCesta.Enabled) and (key = 45) then
     sbtnInsCesta.Click;
  inherited;

end;

procedure TfrmCadOrdemOpcInd.sbtnBuscaSaldosClick(Sender: TObject);
var
   sTipoOperacao : String;
begin
   try
      bReversao := True;
      MSBuscaSaldos.Executar;
      if MSBuscaSaldos.RetornouValor then
      begin

         sbtnInsOrdemClick(Sender);

         pnlMestre.Enabled := True;
         dbdDataOperacao.Text      := msBuscaSaldos.ValoresChave[2];

         dblkCorretora.LookupValue := msBuscaSaldos.ValoresChave[9];
         dblkCorretora.Text        := msBuscaSaldos.ValoresChave[10];
         OperComum.PosicionaWWLookUpQry(dblkCorretora, QryCorretValores);

         dbDocumento.Clear;

         HabilitaMestre(False);

         qryOrdemIDBOLETA.AsString := dbDocumento.Text;

         // Monta Tipo de Operação de Reversão da Operação do Salso
         sTipoOperacao := MontaTipoOperacao(msBuscaSaldos.ValoresChave[13]);
         sLKTipoOperacao := sTipoOperacao;
         dblkTipoOperacao.LookupValue := sTipoOperacao;
         qryTipoOperacao.Locate('IDTIPOOPERACAO',dblkTipoOperacao.LookupValue,[]);
         dblkTipoOperacao.Text     := qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
         OperComum.PosicionaWWLookUpQry(dblkTipoOperacao, qryTipoOperacao);

         // Monta Opção
         dblkOpcao.LookupValue := msBuscaSaldos.ValoresChave[7];
         qryOpcao.Locate('IDINVESTIMENTO',dblkOpcao.LookupValue,[]);
         dblkOpcao.Text        := qryOpcao.FieldByName('DESCINVESTIMENTO').AsString;
         OperComum.PosicionaWWLookUpQry(dblkOpcao, qryOpcao);

         qryOrdemIDTIPOINVEST.AsInteger   := 2;
         qryOrdemIDCARTEIRAGERENC.Clear;
         qryOrdemIDINVESTIMENTO.AsInteger := StrToInt(msBuscaSaldos.ValoresChave[7]);
         qryOrdemIDLOTE.AsString          := msBuscaSaldos.ValoresChave[4];
         if msBuscaSaldos.ValoresChave[14] <> '' then
            qryOrdemIDCESTAOPCIND.AsInteger  := StrToInt(msBuscaSaldos.ValoresChave[14]);

         qryOrdemQUANTIDADE.AsFloat := StrToFloat(msBuscaSaldos.ValoresChave[3]);

         // Desabilita Campos
         dblkCarteiraOrdem.Enabled := False;
         dblkTipoOperacao.Enabled  := False;
         dblkOpcao.Enabled         := False;
         dbeLote.Enabled           := False;

         if dbdDataOperacao.CanFocus then
            dbdDataOperacao.SetFocus;

      end;
   finally
      sbtnBuscaSaldos.Down := False;
   end;
end;

function TfrmCadOrdemOpcInd.MontaTipoOperacao(sIdOperOpcInd : String):String;
var
   sTipoOper : String;
begin
   Result := '';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT IDTIPOOPERACAO FROM OPERACAOOPCIND WHERE IDOPEROPCIND = ' + sIdOperOpcInd);
   qryAux.Open;
   sTipoOper := qryAux.FieldByName('IDTIPOOPERACAO').AsString;
   if sTipoOper = '-84' then      // COMPRA DE OPÇÕES DE COMPRA (INDICE)
      Result := '-86'
   else if sTipoOper = '-86' then // VENDA DE OPÇÕES DE COMPRA (INDICE)
      Result := '-84'
   else if sTipoOper = '-88' then // COMPRA DE OPÇÕES DE VENDA (INDICE)
      Result := '-90'
   else if sTipoOper = '-90' then // VENDA DE OPÇÕES DE VENDA (INDICE)
      Result := '-88'
end;

procedure TfrmCadOrdemOpcInd.HabilitaMestre(bHab : Boolean);
begin
   dblkCorretora.Enabled := bHab;
   dbDocumento.Enabled := bHab;
end;

end.
