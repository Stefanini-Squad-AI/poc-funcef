unit fCadTipoTrab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlTipoTrab;

type
  TfrmCadTipoTrab = class(TFrmCadastroMT)
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
    CtrlTipoTrab: TCtrlTipoTrab;
    
    procedure Sel(IdTipoTrab: integer);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTipoTrab: TfrmCadTipoTrab;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadTipoTrab.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoTrab := TCtrlTipoTrab.Create;
  CtrlTipoTrab.InitializeAs(Padroes);
  CtrlTipoTrab.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadTipoTrab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipoTrab);
  inherited;
end;

procedure TfrmCadTipoTrab.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipoTrab.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadTipoTrab.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTipoTrab.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTipoTrab.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTipoTrab.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTipoTrab.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadTipoTrab.bbtnConfirmarClick(Sender: TObject);
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

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadTipoTrab.Sel(IdTipoTrab: integer);
begin
  Cds.Data := CtrlTipoTrab.ListGeral(IdTipoTrab);
end;

function TfrmCadTipoTrab.GravarRegistro: boolean;
begin
  Result := CtrlTipoTrab.Gravar;
  if not(Result) then
    raise exception.Create(CtrlTipoTrab.MessageInfo);
end;

end.
