unit fCadMovCAGED;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList,
  fCadastroMT, DBClient, uCMClientDataSet, uCtrlMovContrCAGED;

type
  TfrmCadMovCAGED = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
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
    CtrlMovContrCAGED: TCtrlMovContrCAGED;

    procedure Sel(IdMovContrCAGED: integer);
    function  GravarRegistro: boolean;
  end;

var
  frmCadMovCAGED: TfrmCadMovCAGED;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadMovCAGED.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlMovContrCAGED := TCtrlMovContrCAGED.Create;
  CtrlMovContrCAGED.InitializeAs(Padroes);
  CtrlMovContrCAGED.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadMovCAGED.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlMovContrCAGED);
  inherited;
end;

procedure TfrmCadMovCAGED.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadMovCAGED.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadMovCAGED.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadMovCAGED.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadMovCAGED.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadMovCAGED.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadMovCAGED.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadMovCAGED.bbtnConfirmarClick(Sender: TObject);
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

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadMovCAGED.Sel(IdMovContrCAGED: integer);
begin
  Cds.Data := CtrlMovContrCAGED.ListGeral(IdMovContrCAGED);
end;

function TfrmCadMovCAGED.GravarRegistro: boolean;
begin
  Result := CtrlMovContrCAGED.Gravar;
  if not(Result) then
    raise exception.Create(CtrlMovContrCAGED.MessageInfo);
end;

end.
