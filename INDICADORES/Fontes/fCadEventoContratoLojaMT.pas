unit fCadEventoContratoLojaMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE EVENTOS POR CONTRATO DE LOJAS  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  13/08/2002
//      Data de Término :  13/08/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCMTypes, uCtrlEventoImovel,
  mContratoLoja, DBCtrls, Mask, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadEventoContratoLojaMT = class(TfrmCadastroGridMTImob)
    Panel1: TPanel;
    CdsIDEVENTOIMOVEL: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsEVIDATA: TDateTimeField;
    CdsEVICABECALHO: TStringField;
    CdsEVIDESCRICAO: TMemoField;
    CdsIDUSUARIO: TFloatField;
    CdsIDCONTRATOIMOVEL: TFloatField;
    CdsFLGTIPOEVENTO: TStringField;
    CdsEVIVLRANTERIOR: TFloatField;
    CdsEVIVLRAJUSTADO: TFloatField;
    CdsEVIDATAPROX: TDateTimeField;
    CdsEVIPERCENT: TFloatField;
    CdsEVIINDICEREAJUSTE: TFloatField;
    CdsIDCONTRATOLOJA: TFloatField;
    molContratoLoja1: TmolContratoLoja;
    Label3: TLabel;
    DBedtDataHistorico: TCMDateTimePicker;
    Label4: TLabel;
    DBedtHistorico: TDBEdit;
    Label6: TLabel;
    DBedtVlrAnterior: TDBEdit;
    Label7: TLabel;
    DBedtVlrAjustado: TDBEdit;
    Label8: TLabel;
    DBedtPercent: TDBEdit;
    DBmemDescricao: TDBMemo;
    Bevel2: TBevel;
    Label1: TLabel;
    DBedtUsuario: TDBEdit;
    CdsUSUARIO_EXTENSO: TStringField;
    dbGrdIButton: TwwIButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure molContratoLoja1btnBuscaContratoClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlEventoImovel : TCtrlEventoImovel;
  protected
    procedure FazerRefresh; override;
  public
    { Public declarations }
  end;

var
  frmCadEventoContratoLojaMT: TfrmCadEventoContratoLojaMT;

implementation

uses dBaseDados, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uSistema;

{$R *.DFM}

procedure TfrmCadEventoContratoLojaMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlEventoImovel := TCtrlEventoImovel.Create;
  CtrlEventoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlEventoImovel.CdsEventoImovel := Cds;
  molContratoLoja1.iContrato := -2;  // para abrir a grid vazia
  FazerRefresh;
end;

procedure TfrmCadEventoContratoLojaMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlEventoImovel.LookupEventoImovel(-1,-1,-1,molContratoLoja1.iContrato,-1);

  // quando é alteração este botão está desabilidado
  molContratoLoja1.btnBuscaContrato.Enabled := true;
  pnlControles.Enabled := True;
end;

procedure TfrmCadEventoContratoLojaMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlEventoImovel );
end;

procedure TfrmCadEventoContratoLojaMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  CdsIDCONTRATOLOJA.AsInteger := molContratoLoja1.iContrato;
  CdsIDUSUARIO.AsInteger      := Sistema.IdUsuario;
  Accept := CtrlEventoImovel.GravaEventoImovel;
end;

procedure TfrmCadEventoContratoLojaMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoImovel.GravaEventoImovel;
end;

procedure TfrmCadEventoContratoLojaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  // Na edição não permite alterar o contrato do evento
  molContratoLoja1.btnBuscaContrato.Enabled := false;
  if not CdsFLGTIPOEVENTO.IsNull then begin
    msgdlg('Evento do sistema não poderá ser editado','Aviso',mtWarning,[mbOK],0);
    pnlControles.Enabled := False;
  end;
end;

procedure TfrmCadEventoContratoLojaMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // Na alteração este botão foi desabilitado
  molContratoLoja1.btnBuscaContrato.Enabled := true;
  pnlControles.Enabled := True;
end;

procedure TfrmCadEventoContratoLojaMT.sbtnInserirClick(Sender: TObject);
begin
  if molContratoLoja1.edtContrato.Text = '' then begin
    MsgDlg('É necessário selecionar primeiro o Contrato.','Aviso',mtWarning,[mbok],0);
    sbtnInserir.Down := False;
  end else inherited;
end;

procedure TfrmCadEventoContratoLojaMT.molContratoLoja1btnBuscaContratoClick(Sender: TObject);
begin
  inherited;
  molContratoLoja1.iImovelFiltro := -1;
  molContratoLoja1.btnBuscaContratoClick(Sender);
  if (CmeCadastro.Operacao = opIdle) or (CmeCadastro.Operacao = opVazio) then begin
    FazerRefresh;
  end;
end;

procedure TfrmCadEventoContratoLojaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    molContratoLoja1.iContrato := StrToInt(MontaSelect.ValoresChave[1]);
    molContratoLoja1.edtContrato.Text := MontaSelect.ValoresChave[2] + ' - ' + MontaSelect.ValoresChave[3];
    FazerRefresh;
  end;
end;

procedure TfrmCadEventoContratoLojaMT.dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  // Ordena a Coluna do Grid
  cds.IndexFieldNames := AFieldName;
end;

procedure TfrmCadEventoContratoLojaMT.sbtnApagarClick(Sender: TObject);
begin
  // Não permite excluir eventos do sistema
  if not CdsFLGTIPOEVENTO.IsNull then begin
    msgdlg('Evento do sistema não pode ser excluído','Aviso',mtWarning,[mbOK],0);
    sbtnApagar.Down := False;
  end else begin
    inherited;
  end;
end;

end.
