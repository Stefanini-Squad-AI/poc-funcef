unit fCadGrupoArquivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroMT,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, TB97,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls,
  CmEventosCadastro, ImgList, DBClient, uCMClientDataSet, wwdbedit, uCtrlGrupoArquivo;

type
  TfrmCadGrupoArquivo = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedCodigo: TwwDBEdit;
    dbedDescr: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlGrupoArquivo: TCtrlGrupoArquivo;

    procedure Sel(CodGrupoArquivo: string);
    function  GravarRegistro: boolean;
  end;

var
  frmCadGrupoArquivo: TfrmCadGrupoArquivo;

implementation

uses uSistema, uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadGrupoArquivo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrupoArquivo := TCtrlGrupoArquivo.Create;
  CtrlGrupoArquivo.InitializeAs(Padroes);
  CtrlGrupoArquivo.Cds := Cds;
  Sel('-1');
end;

procedure TfrmCadGrupoArquivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrupoArquivo);
  inherited;
end;

procedure TfrmCadGrupoArquivo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadGrupoArquivo.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //nherited;
end;

procedure TfrmCadGrupoArquivo.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrupoArquivo.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrupoArquivo.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrupoArquivo.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadGrupoArquivo.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadGrupoArquivo.Sel(CodGrupoArquivo: string);
begin
  Cds.Data := CtrlGrupoArquivo.ListGeral(CodGrupoArquivo);
end;

function TfrmCadGrupoArquivo.GravarRegistro: boolean;
begin
  Result := CtrlGrupoArquivo.Gravar;
  if not(Result) then
    raise exception.Create(CtrlGrupoArquivo.MessageInfo);
end;

end.
