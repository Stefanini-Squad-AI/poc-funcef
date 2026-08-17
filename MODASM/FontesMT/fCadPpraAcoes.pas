unit fCadPpraAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList,
  DBClient, uCMClientDataSet, FCadastroMT, uCtrlPpraAcoes;

type
  TfrmCadPpraAcoes = class(TFrmCadastroMT)
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
    CtrlPpraAcoes: TCtrlPpraAcoes;

    procedure Sel(IdAcoes: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadPpraAcoes: TfrmCadPpraAcoes;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadPpraAcoes.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPpraAcoes := TCtrlPpraAcoes.Create;
  CtrlPpraAcoes.InitializeAs(Padroes);
  CtrlPpraAcoes.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadPpraAcoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPpraAcoes);
  inherited;
end;

procedure TfrmCadPpraAcoes.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPpraAcoes.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadPpraAcoes.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPpraAcoes.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraAcoes.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraAcoes.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraAcoes.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadPpraAcoes.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadPpraAcoes.Sel(IdAcoes: double);
begin
  Cds.Data := CtrlPpraAcoes.ListGeral(IdAcoes);
end;

function TfrmCadPpraAcoes.GravarRegistro: boolean;
begin
  Result := CtrlPpraAcoes.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlPpraAcoes.MessageInfo);
end;

end.
