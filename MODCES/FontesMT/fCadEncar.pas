unit fCadEncar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  StdCtrls, TREdit, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlEncar;

type
  TfrmCadEncar = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label3: TLabel;
    dbredPercent: TDBRealEdit;
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
    CtrlEncar: TCtrlEncar;

    procedure Sel(IdEncargo: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadEncar: TfrmCadEncar;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadEncar.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEncar := TCtrlEncar.Create;
  CtrlEncar.InitializeAs(Padroes);
  CtrlEncar.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadEncar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlEncar);
  inherited;
end;

procedure TfrmCadEncar.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadEncar.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadEncar.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadEncar.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadEncar.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadEncar.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadEncar.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadEncar.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadEncar.Sel(IdEncargo: double);
begin
  Cds.Data := CtrlEncar.ListGeral(IdEncargo);
end;

function TfrmCadEncar.GravarRegistro: boolean;
begin
  Result := CtrlEncar.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlEncar.MessageInfo);
end;

end.
