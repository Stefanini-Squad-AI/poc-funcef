{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     CADASTRO DE EVENTOS POR IMÓVEL  ( MT )

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

unit fCadEventoImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCMTypes, DBCtrls, Mask, wwdbdatetimepicker, CMDateTimePicker,
  mImovel, uCtrlEventoImovel, uCtrlTipoEventoImovel, uCmSqlParams, wwdbedit, Wwdotdot, Wwdbcomb,
  wwdblook;

type
  TfrmCadEventoImovelMT = class(TfrmCadastroGridMTImob)
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
    lblValAnterior: TLabel;
    DBedtVlrAnterior: TDBEdit;
    lblValAtual: TLabel;
    DBedtVlrAjustado: TDBEdit;
    lblPercent: TLabel;
    DBedtPercent: TDBEdit;
    Label1: TLabel;
    DBedtUsuario: TDBEdit;
    CdsUSUARIO_EXTENSO: TStringField;
    dbGrdIButton: TwwIButton;
    molImovel1: TmolImovel;
    DBedtNumProcesso: TDBEdit;
    Label5: TLabel;

    CMSqlParams1: TCMSqlParams;
    CdsNUMPROCESSO: TStringField;
    Panel2: TPanel;
    lblDescricao: TLabel;
    DBmemDescricao: TDBMemo;
    Label2: TLabel;
    dsTipoEventoUsuario: TwwDataSource;
    CdsDESCTIPOIMOVEL: TStringField;
    CMSqlParams2: TCMSqlParams;
    cdsTipoEventoUsuario: TCMClientDataSet;
    cdsTipoEventoUsuarioIDTIPOEVENTOIMOB: TFloatField;
    cdsTipoEventoUsuarioDESCRICAO: TStringField;
    wwDBcmbTipoEvento: TwwDBLookupCombo;
    CdsIDTIPOEVENTOIMOB: TFloatField; procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure sbtnApagarClick(Sender: TObject);
    procedure molImovel1btnBuscaImovelClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlEventoImovel : TCtrlEventoImovel;
    CtrlTipoEventoImovel: TCtrlTipoEventoImovel;
  protected
    procedure FazerRefresh; override;
  public
    { Public declarations }
    bCadastroImovel : Boolean;  // indica se o form foi chamado pelo cadastro de imóvel
    sFlgTipoEvento  : String;   // Carrega o tipo de flag do evento ( pelo cadastro é VM )
  end;

var
  frmCadEventoImovelMT: TfrmCadEventoImovelMT;

implementation

uses dBaseDados, uMensErro, uComunsImobiliario, uVerificaPreenchimento,
     uSistema,   uModuloImobiliario;

{$R *.DFM}

procedure TfrmCadEventoImovelMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlEventoImovel := TCtrlEventoImovel.Create;
  CtrlEventoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlTipoEventoImovel := TCtrlTipoEventoImovel.Create;
  CtrlTipoEventoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlEventoImovel.CdsEventoImovel := Cds;

  CtrlTipoEventoImovel.CdsTipoEventoImovel := cdsTipoEventoUsuario;

  // Carrega default da origem de abertura da tela
  bCadastroImovel := False;
  sFlgTipoEvento  := 'US';

  cdsTipoEventoUsuario.Data := CtrlTipoEventoImovel.LookupTipoEventoImovel(-1, sFlgTipoEvento);

  // Abre a grid vazia
  molImovel1.iImovel := -2;
  FazerRefresh;
end;

procedure TfrmCadEventoImovelMT.FazerRefresh;
begin
  Cds.Data := CtrlEventoImovel.LookupEventoImovel(-1,molImovel1.iImovel,-1,-1,-1);
  // quando é alteração este botão está desabilidado
  molImovel1.btnBuscaImovel.Enabled := true;
  pnlControles.Enabled := True;

  inherited;
end;

procedure TfrmCadEventoImovelMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlEventoImovel );
end;

procedure TfrmCadEventoImovelMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  CdsIDIMOVEL.AsInteger     := molImovel1.iImovel;
  CdsIDUSUARIO.AsInteger    := Sistema.IdUsuario;
  CdsFLGTIPOEVENTO.AsString := sFlgTipoEvento;
  Accept := CtrlEventoImovel.GravaEventoImovel;
end;

procedure TfrmCadEventoImovelMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoImovel.GravaEventoImovel;
end;

procedure TfrmCadEventoImovelMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // Na alteração este botão foi desabilitado
  molImovel1.btnBuscaImovel.Enabled := true;
  pnlControles.Enabled := True;
end;

procedure TfrmCadEventoImovelMT.sbtnInserirClick(Sender: TObject);
begin
  if molImovel1.edtImovel.Text = '' then begin
    MsgDlg('É necessário selecionar primeiro o Imóvel.','Aviso',mtWarning,[mbok],0);
    sbtnInserir.Down := false;
  end else inherited;
end;

procedure TfrmCadEventoImovelMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    molImovel1.iImovel := StrToInt(MontaSelect.ValoresChave[1]);
    molImovel1.edtImovel.Text := MontaSelect.ValoresChave[2] + ' - ' + MontaSelect.ValoresChave[3];
    FazerRefresh;
  end;
end;

procedure TfrmCadEventoImovelMT.dbGrdTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  cds.IndexFieldNames := AFieldName;
end;

procedure TfrmCadEventoImovelMT.CmeCadastroEdit(Sender: TObject);
begin
  // Na edição não permite alterar o contrato do evento
  molImovel1.btnBuscaImovel.Enabled := false;
  if (not CdsFLGTIPOEVENTO.IsNull) and (CdsFLGTIPOEVENTO.AsString <> 'US') then begin
    msgdlg('Evento do sistema não poderá ser editado','Aviso',mtWarning,[mbOK],0);
    pnlControles.Enabled := False;
  end else begin

// Daniel - 21967 - ------------------------------------------------------------
    if ( ModuloImobiliario.AdminImob.bFlgAlteraEvento=True ) then begin
      if Sistema.IdUsuario<>cdsIDUSUARIO.AsInteger then begin
        MsgDlg('Eventos de sistema só podem ser editados pelo usuário de lançamento', 'Aviso', mtWarning, [mbOk], 0);
        sbtnAlterar.Down := False;
        pnlControles.Enabled := False;
      end else inherited;
    end else inherited;
// Daniel - 21967 - ------------------------------------------------------------

  end;
end;

procedure TfrmCadEventoImovelMT.sbtnApagarClick(Sender: TObject);
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

procedure TfrmCadEventoImovelMT.molImovel1btnBuscaImovelClick(Sender: TObject);
begin
  inherited;
  molImovel1.btnBuscaImovelClick(Sender);
  if (CmeCadastro.Operacao = opIdle) or (CmeCadastro.Operacao = opVazio) then begin
    FazerRefresh;
  end;
end;

procedure TfrmCadEventoImovelMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Se o form foi chamado do cadastro de imóveis, fecha o mesmo após a inclusão
  if bCadastroImovel then bbtnSair.Click;
end;

end.
