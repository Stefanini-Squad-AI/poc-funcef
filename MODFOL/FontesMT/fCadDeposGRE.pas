unit fCadDeposGRE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  DBCtrls, Mask, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro,
  ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlDeposGRE;

type
  TfrmCadDeposGRE = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    dbrgTipContra: TDBRadioGroup;
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
    CtrlDeposGRE: TCtrlDeposGRE;

    procedure Sel(IdDeposGRE: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadDeposGRE: TfrmCadDeposGRE;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadDeposGRE.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDeposGRE := TCtrlDeposGRE.Create;
  CtrlDeposGRE.InitializeAs(Padroes);
  CtrlDeposGRE.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadDeposGRE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlDeposGRE);
  inherited;
end;

procedure TfrmCadDeposGRE.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadDeposGRE.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('TIPOCONTRATO').asString := 'E';
end;

procedure TfrmCadDeposGRE.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadDeposGRE.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadDeposGRE.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadDeposGRE.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadDeposGRE.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadDeposGRE.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadDeposGRE.Sel(IdDeposGRE: double);
begin
  Cds.Data := CtrlDeposGRE.ListGeral(IdDeposGRE);
end;

function TfrmCadDeposGRE.GravarRegistro: boolean;
begin
  Result := CtrlDeposGRE.Gravar;
  if not(Result) then
    raise exception.Create(CtrlDeposGRE.MessageInfo);
end;

end.
