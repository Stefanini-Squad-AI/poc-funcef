unit fCadAfastRAIS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdbedit, Mask, DBCtrls, ImgList,
  CmEventosCadastro, FCadastroMT, DBClient, uCMClientDataSet, uCtrlAfastRAIS;

type
  TfrmCadAfastRAIS = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlAfastRAIS: TCtrlAfastRAIS;

    procedure Sel(IdAfastRAIS: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadAfastRAIS: TfrmCadAfastRAIS;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadAfastRAIS.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAfastRAIS := TCtrlAfastRAIS.Create;
  CtrlAfastRAIS.InitializeAs(Padroes);
  CtrlAfastRAIS.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadAfastRAIS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlAfastRAIS);
  inherited;
end;

procedure TfrmCadAfastRAIS.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadAfastRAIS.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadAfastRAIS.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadAfastRAIS.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadAfastRAIS.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadAfastRAIS.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadAfastRAIS.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadAfastRAIS.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadAfastRAIS.Sel(IdAfastRAIS: double);
begin
  Cds.Data := CtrlAfastRAIS.ListGeral(IdAfastRAIS);
end;

function TfrmCadAfastRAIS.GravarRegistro: boolean;
begin
  Result := CtrlAfastRAIS.Gravar;
  if not(Result) then
    raise exception.Create(CtrlAfastRAIS.MessageInfo);
end;

end.
