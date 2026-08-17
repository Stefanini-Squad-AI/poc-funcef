unit fCadVincEmpr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdbedit, Mask, DBCtrls, ImgList,
  CmEventosCadastro, FCadastroMT, DBClient, uCMClientDataSet, uCtrlVincEmpr;

type
  TfrmCadVincEmpr = class(TFrmCadastroMT)
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
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlVincEmpr: TCtrlVincEmpr;

    procedure Sel(IdVincEmpreg: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadVincEmpr: TfrmCadVincEmpr;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadVincEmpr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlVincEmpr := TCtrlVincEmpr.Create;
  CtrlVincEmpr.InitializeAs(Padroes);
  CtrlVincEmpr.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadVincEmpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlVincEmpr);
  inherited;
end;

procedure TfrmCadVincEmpr.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadVincEmpr.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadVincEmpr.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadVincEmpr.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadVincEmpr.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadVincEmpr.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadVincEmpr.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadVincEmpr.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadVincEmpr.Sel(IdVincEmpreg: double);
begin
  Cds.Data := CtrlVincEmpr.ListGeral(IdVincEmpreg);
end;

function TfrmCadVincEmpr.GravarRegistro: boolean;
begin
  Result := CtrlVincEmpr.Gravar;
  if not(Result) then
    raise exception.Create(CtrlVincEmpr.MessageInfo);
end;

end.
