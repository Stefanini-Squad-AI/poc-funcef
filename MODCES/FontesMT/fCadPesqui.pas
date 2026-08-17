unit fCadPesqui;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, Grids, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, wwdbdatetimepicker, ImgList,
  CMDateTimePicker, CmEventosCadastro, DBClient, fCadastroMT, uCMClientDataSet,
  uCtrlPesquisaSal;

type
  TfrmCadPesqui = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    DBDateEdit1: TCMDateTimePicker;
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
    CtrlPesquisaSal: TCtrlPesquisaSal;
    
    procedure Sel(IdPesqSalar: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadPesqui: TfrmCadPesqui;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadPesqui.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPesquisaSal := TCtrlPesquisaSal.Create;
  CtrlPesquisaSal.InitializeAs(Padroes);
  CtrlPesquisaSal.CdsPesquisaSal := Cds;
  Sel(-1);
end;

procedure TfrmCadPesqui.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPesquisaSal);
  inherited;
end;

procedure TfrmCadPesqui.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPesqui.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadPesqui.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPesqui.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPesqui.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPesqui.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPesqui.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadPesqui.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadPesqui.Sel(IdPesqSalar: double);
begin
  Cds.Data := CtrlPesquisaSal.ListPesquisaSal(IdPesqSalar);
end;

function TfrmCadPesqui.GravarRegistro: boolean;
begin
  Result := CtrlPesquisaSal.GravarPesquisaSal;
  if not(Result) then
    raise Exception.Create(CtrlPesquisaSal.MessageInfo);
end;

end.
