unit fCadFonte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, fCadastroMT, DBClient, uCMClientDataSet, uCtrlFonte;

type
  TfrmCadFonte = class(TfrmCadastroMT)
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
    CtrlFonte: TCtrlFonte;

    procedure Sel(IdFontRecr: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadFonte: TfrmCadFonte;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadFonte.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlFonte := TCtrlFonte.Create;
  CtrlFonte.InitializeAs(Padroes);
  CtrlFonte.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadFonte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlFonte);
  inherited;
end;

procedure TfrmCadFonte.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadFonte.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadFonte.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadFonte.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadFonte.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadFonte.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadFonte.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadFonte.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadFonte.Sel(IdFontRecr: double);
begin
  Cds.Data := CtrlFonte.ListGeral(IdFontRecr);
end;

function TfrmCadFonte.GravarRegistro: boolean;
begin
  Result := CtrlFonte.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlFonte.MessageInfo);
end;

end.
