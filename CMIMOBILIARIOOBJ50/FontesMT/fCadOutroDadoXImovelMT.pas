unit fCadOutroDadoXImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBCtrls, wwdblook, mImovelAtivo, uCtrlOutroDado,
  uMensErro, dBaseDados, uSistema, uCMTypes, uComunsImobiliario, uVerificaPreenchimento, mImovel ;


type
  TfrmCadOutroDadoXImovelMT = class(TfrmCadastroGridMTImob)
    Panel1: TPanel;
    Label2: TLabel;
    dbCboOutroDado: TwwDBLookupCombo;
    Label4: TLabel;
    DBedtValor: TDBEdit;
    CdsOutroDado: TCMClientDataSet;
    CdsOutroDadoODODESCRICAO: TStringField;
    CdsOutroDadoIDOUTRODADO: TFloatField;
    CdsIDOUTRODADO: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsODIVALOR: TStringField;
    CdsODODESCRICAO: TStringField;
    molImovel1: TmolImovel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure molImovel1btnBuscaImovelClick(Sender: TObject);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlOutroDado : TCtrlOutroDado;

  public
    { Public declarations }
  end;

var
  frmCadOutroDadoXImovelMT: TfrmCadOutroDadoXImovelMT;

implementation

{$R *.DFM}

procedure TfrmCadOutroDadoXImovelMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlOutroDado := TCtrlOutroDado.Create;
  CtrlOutroDado.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
  CtrlOutroDado.CdsOutroDadoXImovel := Cds;
  molImovel1.iImovel := -2;  // para abrir a grid vazia
  FazerRefresh;
end;

procedure TfrmCadOutroDadoXImovelMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlOutroDado );
end;

procedure TfrmCadOutroDadoXImovelMT.FazerRefresh;
begin
  Cds.Data := CtrlOutroDado.LookupOutroDadoXImovel(molImovel1.iImovel);

  // quando é alteração estes botões estão desabilidados
  molImovel1.btnBuscaImovel.Enabled := true;
  dbCboOutroDado.Enabled := true;
  inherited;
end;

procedure TfrmCadOutroDadoXImovelMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsIDIMOVEL.AsInteger := molImovel1.iImovel;
  Accept := CtrlOutroDado.GravaOutroDadoXImovel;
end;

procedure TfrmCadOutroDadoXImovelMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  Accept := CtrlOutroDado.GravaOutroDadoXImovel;
  inherited;
end;

procedure TfrmCadOutroDadoXImovelMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlOutroDado.LookupOutroDadoXImovel (CdsIDIMOVEL.AsInteger, CdsIDOUTRODADO.AsInteger);
  inherited;
  molImovel1.btnBuscaImovel.Enabled := false;
  dbCboOutroDado.Enabled := false;
end;

procedure TfrmCadOutroDadoXImovelMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    molImovel1.iImovel        := StrToInt(MontaSelect.ValoresChave[0]);
    molImovel1.edtImovel.Text := MontaSelect.ValoresChave[2] + ' - ' + MontaSelect.ValoresChave[3];
    molImovel1.sCodTipoImo    := MontaSelect.ValoresChave[4];

    FazerRefresh;
    // O LOOKUP DEPENDE DO TIPO DO IMÓVEL
    CdsOutroDado.Data  := CtrlOutroDado.LookupOutroDado(molImovel1.sCodTipoImo);
  end;
end;

procedure TfrmCadOutroDadoXImovelMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // quando é alteração estes botões estão desabilidados
  molImovel1.btnBuscaImovel.Enabled := true;
  dbCboOutroDado.Enabled := true;
end;

procedure TfrmCadOutroDadoXImovelMT.sbtnInserirClick(Sender: TObject);
begin
  if molImovel1.edtImovel.Text = '' then begin
    MsgDlg('É necessário selecionar o imóvel primeiro.','Aviso',mtWarning,[mbok],0);
    sbtnInserir.Down := false;
  end else inherited;
end;

procedure TfrmCadOutroDadoXImovelMT.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

procedure TfrmCadOutroDadoXImovelMT.molImovel1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovel1.btnBuscaImovelClick(Sender);
  if (CmeCadastro.Operacao = opIdle) or (CmeCadastro.Operacao = opVazio) then begin
    FazerRefresh;
    // O LOOKUP DEPENDE DO TIPO DO IMÓVEL
    CdsOutroDado.Data  := CtrlOutroDado.LookupOutroDado(molImovel1.sCodTipoImo);
  end;
end;

end.
