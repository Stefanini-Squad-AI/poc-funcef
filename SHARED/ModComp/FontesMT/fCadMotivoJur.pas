unit fCadMotivoJur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, TB97, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdbedit, DBCtrls, Mask, ImgList,
  DBClient, CmEventosCadastro, FCadastroMT, uCMClientDataSet, uCtrlMotivo;

type
  TfrmCadMotivoJur = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label5: TLabel;
    dbedObs: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlMotivo: TCtrlMotivo;

    procedure Sel(IdMotivo: integer);
    function  GravarRegistro: boolean;
  end;

var
  frmCadMotivoJur: TfrmCadMotivoJur;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadMotivoJur.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);
  CtrlMotivo.Cds := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760011;
    PROCJUD, PROCPREV : HelpContext := 1100006;
    SISTJURCONS       : HelpContext := 7190011;
  end;
end;

procedure TfrmCadMotivoJur.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlMotivo);
  inherited;
end;

procedure TfrmCadMotivoJur.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadMotivoJur.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('GRUPOMOTIVO').asString := 'O';
end;

procedure TfrmCadMotivoJur.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadMotivoJur.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadMotivoJur.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadMotivoJur.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadMotivoJur.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadMotivoJur.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadMotivoJur.Sel(IdMotivo: integer);
begin
  Cds.Data := CtrlMotivo.ListGeral(IdMotivo, 0, '', '');
end;

function TfrmCadMotivoJur.GravarRegistro: boolean;
begin
  Result := CtrlMotivo.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlMotivo.MessageInfo);
end;

end.
