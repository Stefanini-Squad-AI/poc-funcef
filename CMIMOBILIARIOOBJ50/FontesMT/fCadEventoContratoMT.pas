{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     CADASTRO DE EVENTOS POR CONTRATO  ( MT )

     Módulo          :  ComunsImobiliario
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  14/08/2002
     Data de Término :  14/08/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Pendência   : 24083
Responsável : Daniel Simões
Data        : 22/05/2007
Descrição   : Inclusão do Número do Processo.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadEventoContratoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCMTypes, DBCtrls, Mask, wwdbdatetimepicker, CMDateTimePicker,
  mContrato, uCtrlEventoImovel, uCmSqlParams;

type
  TfrmCadEventoContratoMT = class(TfrmCadastroGridMTImob)
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
    molContrato1: TmolContrato;
    Label2: TLabel;
    Label5: TLabel;
    DBedtNumProcesso: TDBEdit;
    CMSqlParams1: TCMSqlParams;
    CdsNUMPROCESSO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure sbtnApagarClick(Sender: TObject);
    procedure molContrato1btnBuscaContratoClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlEventoImovel : TCtrlEventoImovel;
  protected
    procedure FazerRefresh; override;
  public
    { Public declarations }
    bCadastroContrato : Boolean;  // indica se o form foi chamado pelo cadastro de Contratos
    sFlgTipoEvento    : String;   // Carrega o tipo de flag do evento ( pelo cadastro é SC )
  end;

var
  frmCadEventoContratoMT: TfrmCadEventoContratoMT;

implementation

uses dBaseDados, uMensErro, uComunsImobiliario, uVerificaPreenchimento,
     uSistema,   uModuloImobiliario;

{$R *.DFM}

procedure TfrmCadEventoContratoMT.FormCreate(Sender: TObject);
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

  // Carrega default da origem de abertura da tela
  bCadastroContrato := False;
  sFlgTipoEvento    := 'US';

  // para abrir a grid vazia
  molContrato1.iContrato := -2;
  FazerRefresh;
end;

procedure TfrmCadEventoContratoMT.FazerRefresh;
begin
  Cds.Data := CtrlEventoImovel.LookupEventoImovel(-1,-1,molContrato1.iContrato,-1,-1);
  // quando é alteração este botão está desabilidado
  molContrato1.btnBuscaContrato.Enabled := true;
  pnlControles.Enabled := True;
  inherited;
end;

procedure TfrmCadEventoContratoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlEventoImovel );
end;

procedure TfrmCadEventoContratoMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  CdsIDCONTRATOIMOVEL.AsInteger := molContrato1.iContrato;
  CdsIDUSUARIO.AsInteger        := Sistema.IdUsuario;
  CdsFLGTIPOEVENTO.AsString     := 'US';
  Accept := CtrlEventoImovel.GravaEventoImovel;
end;

procedure TfrmCadEventoContratoMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoImovel.GravaEventoImovel;
end;

procedure TfrmCadEventoContratoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // Na alteração este botão foi desabilitado
  molContrato1.btnBuscaContrato.Enabled := true;
  pnlControles.Enabled := True;
end;

procedure TfrmCadEventoContratoMT.sbtnInserirClick(Sender: TObject);
begin
  if molContrato1.edtContrato.Text = '' then begin
    MsgDlg('É necessário selecionar primeiro o Contrato.','Aviso',mtWarning,[mbok],0);
    sbtnInserir.Down := false;
  end else inherited;
end;

procedure TfrmCadEventoContratoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    molContrato1.iContrato := StrToInt(MontaSelect.ValoresChave[1]);
    molContrato1.edtContrato.Text := MontaSelect.ValoresChave[2] + ' - ' + MontaSelect.ValoresChave[3];
    FazerRefresh;
  end;
end;

procedure TfrmCadEventoContratoMT.dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  // Ordena a coluna do Grid
  cds.IndexFieldNames := AFieldName;
end;


procedure TfrmCadEventoContratoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  // Na edição não permite alterar o contrato do evento
  molContrato1.btnBuscaContrato.Enabled := false;
  if (not CdsFLGTIPOEVENTO.IsNull) and (CdsFLGTIPOEVENTO.AsString <> 'US') then begin
    msgdlg('Evento do sistema não poderá ser editado','Aviso',mtWarning,[mbOK],0);
    pnlControles.Enabled := False;
  end else begin

// Daniel - 21967 - ------------------------------------------------------------
    if ( ModuloImobiliario.AdminImob.bFlgAlteraEvento=True ) then begin
      if ( Sistema.IdUsuario<>CdsIDUSUARIO.AsInteger ) then begin
        MsgDlg('Eventos de sistema só podem ser editados pelo usuário de lançamento', 'Aviso', mtWarning, [mbOk], 0);
        sbtnAlterar.Down := False;
        pnlControles.Enabled := False;
      end else inherited;
    end else inherited;
// Daniel - 21967 - ------------------------------------------------------------

  end;

end;

procedure TfrmCadEventoContratoMT.sbtnApagarClick(Sender: TObject);
begin
  // Não permite excluir eventos do sistema
  if (not CdsFLGTIPOEVENTO.IsNull) and (CdsFLGTIPOEVENTO.AsString <> 'US') then begin
    msgdlg('Evento do sistema não pode ser excluído','Aviso',mtWarning,[mbOK],0);
    sbtnApagar.Down := False;
  end else begin

// Daniel - 21967 - ------------------------------------------------------------
    if ( ModuloImobiliario.AdminImob.bFlgAlteraEvento=True ) then begin
      if Sistema.IdUsuario<>cdsIDUSUARIO.AsInteger then begin
        MsgDlg('Eventos de sistema só podem ser excluídos pelo usuário de lançamento', 'Aviso', mtWarning, [mbOk], 0);
        sbtnAlterar.Down := False;
      end else inherited;
    end else inherited;
// Daniel - 21967 - ------------------------------------------------------------

  end;

end;

procedure TfrmCadEventoContratoMT.molContrato1btnBuscaContratoClick(Sender: TObject);
begin
  inherited;
  molContrato1.btnBuscaContratoClick(Sender);
  if (CmeCadastro.Operacao = opIdle) or (CmeCadastro.Operacao = opVazio) then begin
    FazerRefresh;
  end;
end;

procedure TfrmCadEventoContratoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Se o form foi chamado do cadastro de contratos, fecha o mesmo após a inclusão
  if bCadastroContrato then bbtnSair.Click;
end;

end.
