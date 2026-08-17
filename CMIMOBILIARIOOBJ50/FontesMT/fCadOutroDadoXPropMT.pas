unit fCadOutroDadoXPropMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBCtrls, wwdblook, uCtrlOutroDado, uMensErro,
  dBaseDados, uSistema, uCMTypes, mPropostaNegocio, uComunsImobiliario, uVerificaPreenchimento;


type
  TfrmCadOutroDadoXPropMT = class(TfrmCadastroGridMTImob)
    Panel1: TPanel;
    Label2: TLabel;
    dbCboOutroDado: TwwDBLookupCombo;
    Label4: TLabel;
    DBedtValor: TDBEdit;
    CdsOutroDado: TCMClientDataSet;
    CdsOutroDadoODODESCRICAO: TStringField;
    CdsOutroDadoIDOUTRODADO: TFloatField;
    CdsIDPROPOSTA: TFloatField;
    CdsIDOUTRODADO: TFloatField;
    CdsODPVALOR: TStringField;
    CdsODODESCRICAO: TStringField;
    molPropostaNegocio1: TmolPropostaNegocio;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure molPropostaNegocio1btnBuscaPropostaClick(Sender: TObject);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlOutroDado : TCtrlOutroDado;

  public
    { Public declarations }
  end;

var
  frmCadOutroDadoXPropMT: TfrmCadOutroDadoXPropMT;

implementation

{$R *.DFM}

procedure TfrmCadOutroDadoXPropMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlOutroDado := TCtrlOutroDado.Create;
  CtrlOutroDado.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlOutroDado.CdsOutroDadoXProp := Cds;

  CdsOutroDado.Data  := CtrlOutroDado.LookupOutroDado;

  molPropostaNegocio1.btnLimpaPropostaClick (self);
  molPropostaNegocio1.iProposta := -2;  // para abrir a grid vazia
  FazerRefresh;

end;

procedure TfrmCadOutroDadoXPropMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlOutroDado );
end;

procedure TfrmCadOutroDadoXPropMT.FazerRefresh;
begin
  Cds.Data := CtrlOutroDado.LookupOutroDadoXProp(molPropostaNegocio1.iProposta);

  // quando é alteração estes botões estão desabilidados
  molPropostaNegocio1.btnBuscaProposta.Enabled := true;
  dbCboOutroDado.Enabled := true;
  inherited;  
end;

procedure TfrmCadOutroDadoXPropMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsIDPROPOSTA.AsInteger := molPropostaNegocio1.iProposta;
  Accept := CtrlOutroDado.GravaOutroDadoXProp;
end;

procedure TfrmCadOutroDadoXPropMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlOutroDado.GravaOutroDadoXProp;
end;

procedure TfrmCadOutroDadoXPropMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlOutroDado.LookupOutroDadoXProp(CdsIDPROPOSTA.AsInteger, CdsIDOUTRODADO.AsInteger);
  inherited;
  molPropostaNegocio1.btnBuscaProposta.Enabled := false;
  dbCboOutroDado.Enabled := false;
end;

procedure TfrmCadOutroDadoXPropMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    molPropostaNegocio1.iProposta := StrToInt(MontaSelect.ValoresChave[0]);
    molPropostaNegocio1.edtProposta.Text := MontaSelect.ValoresChave[1] + ' - ' + MontaSelect.ValoresChave[2];

    FazerRefresh;
  end;
end;

procedure TfrmCadOutroDadoXPropMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // quando é alteração estes botões estão desabilidados
  molPropostaNegocio1.btnBuscaProposta.Enabled := true;
  dbCboOutroDado.Enabled := true;
end;


procedure TfrmCadOutroDadoXPropMT.molPropostaNegocio1btnBuscaPropostaClick(
  Sender: TObject);
begin
  inherited;
  molPropostaNegocio1.btnBuscaPropostaClick(Sender);
  if (CmeCadastro.Operacao = opIdle) or (CmeCadastro.Operacao = opVazio) then
   FazerRefresh;
end;

end.
