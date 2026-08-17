unit FConsultaParcela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, TREdit, DBCtrls,
  Mask, ComCtrls, MontaSelect, Db, Wwdatsrc, uCmSqlParams, DBClient,
  uCMClientDataSet, uSistema, uCtrlParcFinancImov, uCtrlContratoImovel;

type
  TfrmConsultaParcela = class(TfrmSairAjuda)
    bbtnImprimir: TBitBtn;
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
    tbsBaixas: TTabSheet;
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
    Panel4: TPanel;
    DBgrdAlteradores: TwwDBGrid;
    Panel5: TPanel;
    DBgrdBaixas: TwwDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    DBgrdEventos: TwwDBGrid;
    DBgrdCorr: TwwDBGrid;
    MS_ConsParcela: TMontaSelect;
    Cds: TCMClientDataSet;
    CMSqlParams: TCMSqlParams;
    ds: TwwDataSource;
    Panel8: TPanel;
    Label5: TLabel;
    DBedtNumContrato: TDBEdit;
    DBedtDescricao: TDBEdit;
    Label6: TLabel;
    DBedtComprador: TDBEdit;
    Label23: TLabel;
    DBedtDtLimite: TDBEdit;
    DBRedtVlrParcela: TDBRealEdit;
    DBRedtAlteradores: TDBRealEdit;
    DBRedtCPMF: TDBRealEdit;
    DBRedtPagamentos: TDBRealEdit;
    lblEncerrado: TLabel;
    lblVigente: TLabel;
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
    DBgrdCorrecoes: TwwDBGrid;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChkBoxExibeParcelasClick(Sender: TObject);
    procedure pgcPrincipalChange(Sender: TObject);
  private
    { Private declarations }
    CtrlParcFinancImov : TCtrlParcFinancImov;
    CtrlContratoImovel : TCtrlContratoImovel;

    function RetornaSaldo(fVlrParcela, fVlrAlteradores, fVlrCPMF, fVlrPagamentos : double): double;

  public
    { Public declarations }
  end;

var
  frmConsultaParcela: TfrmConsultaParcela;

implementation
uses dBaseDados, uComunsImobiliario;

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

    If sFlgStatus = 'E' then begin
      lblEncerrado.Visible := true;
      lblVigente.Visible   := false;
     end
    else
     If sFlgStatus = 'V' then begin
      lblEncerrado.Visible := false;
      lblVigente.Visible   := true;
     end;

    Cds.Data        := CtrlParcFinancImov.LookupConsultaParcelas(Sistema.IdEmpresa,iIdContratoImovel);
    CdsCondPag.Data := CtrlParcFinancImov.LookupCondicoesPagamento(iIdContratoImovel);
    CdsImoveis.Data := CtrlContratoImovel.LookupContratoXImovel(iIdContratoImovel,false);


    TFloatField(Cds.FieldByName('VLRPAGO')).DisplayFormat      := ',0.00';
    TFloatField(Cds.FieldByName('VLRPAGO')).EditFormat         := ',0.00';
    TFloatField(Cds.FieldByName('VLRPRESTACAO')).DisplayFormat := ',0.00';
    TFloatField(Cds.FieldByName('VLRPRESTACAO')).EditFormat    := ',0.00';

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
  CtrlContratoImovel := TCtrlContratoImovel.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   Sistema.UsaPlanoPatro);

  CtrlParcFinancImov.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                ComunsImobiliario.MensErroMT);
  CtrlContratoImovel.InitializeAs(CtrlParcFinancImov);

end;

procedure TfrmConsultaParcela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlParcFinancImov);
  inherited;

end;

procedure TfrmConsultaParcela.ChkBoxExibeParcelasClick(Sender: TObject);
var
  sIdContratoImovel : String;
begin
  inherited;
  cds.Filtered      := false;
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
  if pgcPrincipal.ActivePage = tbsDetalhamento then
    // Calcula Saldo
    DBREdt_SaldoDoc.Value := RetornaSaldo(Cds.FieldByName('VLRPRESTACAO').AsFloat,
                                          Cds.FieldByName('TOT_ALTERADOR').AsFloat,
                                          Cds.FieldByName('TOT_CPMF').AsFloat,
                                          Cds.FieldByName('VLRPAGO').AsFloat);
end;

end.
