{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência    : 27508
Responsável  : Daniel Simões
Data         : 03/03/2008
Descrição    : Ajustes no Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FConsultaParcela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, TREdit, DBCtrls,
  Mask, ComCtrls, MontaSelect, Db, Wwdatsrc, uCmSqlParams, DBClient,
  uCMClientDataSet, uSistema, uCtrlParcFinancImov, uCtrlEventoImovel,
  uCtrlContratoImovel, wwriched;

type
  TfrmConsultaParcela = class(TfrmSairAjuda)
    bbtnProcurar: TBitBtn;
    pgcPrincipal: TPageControl;
    tbsParcelas: TTabSheet;
    tbsDetalhamento: TTabSheet;
    tbsContrato: TTabSheet;
    PanelTop: TPanel;
    Panel3: TPanel;
    DBgrdParcelas: TwwDBGrid;
    pgcDetalhamento: TPageControl;
    tbsLancamento: TTabSheet;
    tbsAlteradores: TTabSheet;
    tbsCorrecoes: TTabSheet;
    tbsEventos: TTabSheet;
    Label22: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    DBedtTipoOuParc: TDBEdit;
    DBedtNumParcela: TDBEdit;
    DBedtMesComp: TDBEdit;
    DBedtAnoComp: TDBEdit;
    DBedtNomeUsuario: TDBEdit;
    DBedtNomeExtenso: TDBEdit;
    DBedtNumDocumento: TDBEdit;
    Label9: TLabel;
    DBedtFormaCobranca: TDBEdit;
    GroupBox1: TGroupBox;
    lblDataVencimento: TLabel;
    DBedtDtLancamento: TDBEdit;
    Label2: TLabel;
    DBedtDtVenc: TDBEdit;
    DBedtDtEmissao: TDBEdit;
    Label11: TLabel;
    Label3: TLabel;
    DBedtBaixa: TDBEdit;
    DBedtDtInclusao: TDBEdit;
    Label10: TLabel;
    Label14: TLabel;
    DBedtNumBoleto: TDBEdit;
    Label12: TLabel;
    DBedtPlanilhaContabil: TDBEdit;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label28: TLabel;
    Label31: TLabel;
    DBREdt_SaldoDoc: TDBRealEdit;
    Bevel1: TBevel;
    Label20: TLabel;
    Panel2: TPanel;
    ChkBoxExibeParcelas: TCheckBox;
    Panel6: TPanel;
    Panel7: TPanel;
    MS_ConsParcela: TMontaSelect;
    Cds: TCMClientDataSet;
    CMSqlParams: TCMSqlParams;
    ds: TwwDataSource;
    Panel8: TPanel;
    DBedtDescricao: TDBEdit;
    Label23: TLabel;
    DBedtDtLimite: TDBEdit;
    DBRedtVlrParcela: TDBRealEdit;
    DBRedtAlteradores: TDBRealEdit;
    DBRedtCPMF: TDBRealEdit;
    DBRedtPagamentos: TDBRealEdit;
    DsImoveis: TwwDataSource;
    CdsImoveis: TCMClientDataSet;
    SqlPImoveis: TCMSqlParams;
    SqlCondPag: TCMSqlParams;
    DsCondPag: TwwDataSource;
    CdsCondPag: TCMClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    grdCondPag: TwwDBGrid;
    TabSheet3: TTabSheet;
    Label13: TLabel;
    Label17: TLabel;
    DBedtAdministradora: TDBEdit;
    DBedtAssinatura: TDBEdit;
    DBgrdImoveis: TwwDBGrid;
    DsCorrContrato: TwwDataSource;
    CdsCorrContrato: TCMClientDataSet;
    SqlPCorrContrato: TCMSqlParams;
    Label5: TLabel;
    Label6: TLabel;
    DBedtComprador: TDBEdit;
    DBedtNumContrato: TDBEdit;
    grdMultaJuros: TwwDBGrid;
    CdsCorrecao: TCMClientDataSet;
    SqlPCorrecao: TCMSqlParams;
    DsCorrecao: TwwDataSource;
    Panel1: TPanel;
    DBgrdAlteradoresLanc: TwwDBGrid;
    dbgCorrecaoDoc: TwwDBGrid;
    CdsAlteradoresBaixas: TCMClientDataSet;
    dsAlteradoresBaixas: TwwDataSource;
    SqlPAlteradoresBaixas: TCMSqlParams;
    CdsEventos: TCMClientDataSet;
    dsEvento: TwwDataSource;
    SqlPEventos: TCMSqlParams;
    wwDBGrid2: TwwDBGrid;
    wwDBRichEdit2: TwwDBRichEdit;
    lblStatus: TLabel;
    GroupBox3: TGroupBox;
    ChkBoxMulta: TCheckBox;
    ChkBoxJuros: TCheckBox;
    ChkBoxCorrecao: TCheckBox;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChkBoxExibeParcelasClick(Sender: TObject);
    procedure pgcPrincipalChange(Sender: TObject);
    procedure ChkBoxMultaClick(Sender: TObject);
  private
    { Private declarations }
    CtrlParcFinancImov : TCtrlParcFinancImov;
    CtrlEventoImovel   : TCtrlEventoImovel;
    CtrlContratoImovel : TCtrlContratoImovel;

    function RetornaSaldo(fVlrParcela, fVlrAlteradores, fVlrCPMF, fVlrPagamentos : double): double;

  public
    { Public declarations }
  end;

var
  frmConsultaParcela: TfrmConsultaParcela;

implementation
uses dBaseDados, uComunsImobiliario, uModuloImobiliario;

{$R *.DFM}

procedure TfrmConsultaParcela.bbtnProcurarClick(Sender: TObject);
var
  iIdContratoImovel : Integer;
  sFlgStatus        : String;
begin
  inherited;
  MS_ConsParcela.Executar;
  if MS_ConsParcela.RetornouValor then begin

    PanelTop.Enabled := true;

    DBedtNumContrato.Text := MS_ConsParcela.ValoresChave[1];
    DBedtDescricao.Text   := MS_ConsParcela.ValoresChave[2];
    DBedtComprador.Text   := MS_ConsParcela.ValoresChave[3];

    iIdContratoImovel := StrToInt(MS_ConsParcela.ValoresChave[0]);
    sFlgStatus        := MS_ConsParcela.ValoresChave[4];

    If sFlgStatus = 'E' then
      lblStatus.Caption := 'Encerrado'
    else
     If sFlgStatus = 'V' then
      lblStatus.Caption := 'Vigente';

    lblStatus.Visible := true;

    if Sistema.TipoCliente = 19991 then    // funcef
      Cds.Data := CtrlParcFinancImov.LookupConsultaParcelas(Sistema.IdEmpresa,iIdContratoImovel,-1,215,216,
                                                            Sistema.TipoCliente,Sistema.IdModulo)
    else
      Cds.Data := CtrlParcFinancImov.LookupConsultaParcelas(Sistema.IdEmpresa,iIdContratoImovel);


    CdsCondPag.Data      := CtrlParcFinancImov.LookupCondicoesPagamento(iIdContratoImovel);
    CdsCorrContrato.Data := CtrlParcFinancImov.LookupMultaJuros(iIdContratoImovel);
    CdsImoveis.Data      := CtrlContratoImovel.LookupContratoXImovel(iIdContratoImovel,false);

    TFloatField(Cds.FieldByName('VLRPAGO')).DisplayFormat      := ',0.00';
    TFloatField(Cds.FieldByName('VLRPAGO')).EditFormat         := ',0.00';
    TFloatField(Cds.FieldByName('VLRPRESTACAO')).DisplayFormat := ',0.00';
    TFloatField(Cds.FieldByName('VLRPRESTACAO')).EditFormat    := ',0.00';

    TFloatField(CdsCondPag.FieldByName('VLRFINANC')).DisplayFormat := ',0.00';
    TFloatField(CdsCondPag.FieldByName('VLRFINANC')).EditFormat    := ',0.00';

    // Calcula Saldo
    DBREdt_SaldoDoc.Value := RetornaSaldo(Cds.FieldByName('VLRPRESTACAO').AsFloat,
                                          Cds.FieldByName('TOT_ALTERADOR').AsFloat,
                                          Cds.FieldByName('TOT_CPMF').AsFloat,
                                          Cds.FieldByName('VLRPAGO').AsFloat);
  end;
end;


procedure TfrmConsultaParcela.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParcFinancImov := TCtrlParcFinancImov.Create;
  CtrlEventoImovel   := TCtrlEventoImovel.Create;
  CtrlContratoImovel := TCtrlContratoImovel.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   Sistema.UsaPlanoPatro);
  CtrlParcFinancImov.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                ComunsImobiliario.MensErroMT);
  CtrlContratoImovel.InitializeAs(CtrlParcFinancImov);
  CtrlEventoImovel.InitializeAs(CtrlParcFinancImov);
end;

procedure TfrmConsultaParcela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlParcFinancImov);
  FreeAndNil(CtrlEventoImovel);
  lblStatus.Visible := false;
  inherited;

end;

procedure TfrmConsultaParcela.ChkBoxExibeParcelasClick(Sender: TObject);
var
  sIdContratoImovel : String;
begin
  inherited;
  cds.Filtered       := false;
  if ChkBoxExibeParcelas.Checked then
   cds.Filter := ''
  else begin
   sIdContratoImovel := MS_ConsParcela.ValoresChave[6];
   cds.Filter        := 'IDPARCFINANCIMOV = ' + sIdContratoImovel;
  end;
  cds.Filtered := true

end;


function TfrmConsultaParcela.RetornaSaldo(fVlrParcela,
                                          fVlrAlteradores,
                                          fVlrCPMF,
                                          fVlrPagamentos : double): double;
begin
    Result :=  (fVlrParcela + fVlrAlteradores + fVlrCPMF) - fVlrPagamentos;
end;

procedure TfrmConsultaParcela.pgcPrincipalChange(Sender: TObject);
begin
  inherited;

  If Cds.Active = false then exit;

  if pgcPrincipal.ActivePage = tbsDetalhamento then begin
    // Calcula Saldo
    DBREdt_SaldoDoc.Value := RetornaSaldo(Cds.FieldByName('VLRPRESTACAO').AsFloat,
                                          Cds.FieldByName('TOT_ALTERADOR').AsFloat,
                                          Cds.FieldByName('TOT_CPMF').AsFloat,
                                          Cds.FieldByName('VLRPAGO').AsFloat);

    If ( (CdsAlteradoresBaixas.Active = false) or
         (Cds.FieldByName('CODDOCUMENTO').AsInteger <>
          CdsAlteradoresBaixas.FieldByName('CODDOCUMENTO').AsInteger) ) then begin

      CdsAlteradoresBaixas.Data := CtrlParcFinancImov.LookupAltradoresBaixas(Cds.FieldByName('CODDOCUMENTO').AsInteger, -1);
      CdsEventos.Data           := CtrlEventoImovel.LookupEventoImovel(-1,-1,-1,-1,Cds.FieldByName('CODDOCUMENTO').AsInteger);

      TFloatField(CdsAlteradoresBaixas.FieldByName('VALOR')).DisplayFormat := ',0.00';

      If MS_ConsParcela.ValoresChave[7] = 'C' then begin
        CdsCorrecao.Data     := CtrlParcFinancImov.LookupCorrecao(Cds.FieldByName('CODDOCUMENTO').AsInteger);
      end
      else begin
        CdsCorrecao.Data     := CtrlParcFinancImov.LookupCorrecao(Cds.FieldByName('CODDOCUMENTO').AsInteger);
      end;
    end;
  end;

end;


procedure TfrmConsultaParcela.ChkBoxMultaClick(Sender: TObject);
var sFiltro : String;
begin
  inherited;

  sFiltro := '';

  If ChkBoxMulta.Checked    then sFiltro := sFiltro + ' IDOPERACAO = 150 OR';
  If ChkBoxJuros.Checked    then sFiltro := sFiltro + ' IDOPERACAO = 149 OR';
  If ChkBoxCorrecao.Checked then sFiltro := sFiltro + ' IDOPERACAO = 148 OR';

  sFiltro := Copy(sFiltro,1,length(sFiltro)-2);

  CdsCorrecao.Filtered := false;
  if (ChkBoxMulta.Checked) or (ChkBoxJuros.Checked) or (ChkBoxCorrecao.Checked) then
    CdsCorrecao.Filter := sFiltro
  else
    CdsCorrecao.Filter := 'IDOPERACAO = -999';

  CdsCorrecao.Filtered := true

end;

end.
