unit fCadPpraMeio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList,
  DBClient, uCMClientDataSet, FCadastroMT, uCtrlPpraMeio;

type
  TfrmCadPpraMeio = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlPpraMeio: TCtrlPpraMeio;
    
    procedure Sel(IdPpraMeio: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadPpraMeio: TfrmCadPpraMeio;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadPpraMeio.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPpraMeio := TCtrlPpraMeio.Create;
  CtrlPpraMeio.InitializeAs(Padroes);
  CtrlPpraMeio.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadPpraMeio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPpraMeio);
  inherited;
end;

procedure TfrmCadPpraMeio.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPpraMeio.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadPpraMeio.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPpraMeio.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraMeio.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraMeio.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraMeio.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadPpraMeio.bbtnConfirmarClick(Sender: TObject);
var
  bInsert: boolean;
begin
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  begin
    bInsert := (Cds.State = dsInsert);
    inherited;
    if not(bInsert) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadPpraMeio.Sel(IdPpraMeio: double);
begin
  Cds.Data := CtrlPpraMeio.ListGeral(IdPpraMeio);
end;

function TfrmCadPpraMeio.GravarRegistro: boolean;
begin
  Result := CtrlPpraMeio.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlPpraMeio.MessageInfo);
end;

end.
