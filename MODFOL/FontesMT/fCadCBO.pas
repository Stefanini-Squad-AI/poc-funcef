unit fCadCBO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlCBO;

type
  TfrmCadCBO = class(TFrmCadastroMT)
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
    CtrlCBO: TCtrlCBO;

    procedure Sel(IdCBO: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadCBO: TfrmCadCBO;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadCBO.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCBO := TCtrlCBO.Create;
  CtrlCBO.InitializeAs(Padroes);
  CtrlCBO.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadCBO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCBO);
  inherited;
end;

procedure TfrmCadCBO.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCBO.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadCBO.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadCBO.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCBO.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCBO.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCBO.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadCBO.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadCBO.Sel(IdCBO: double);
begin
  Cds.Data := CtrlCBO.ListGeral(IdCBO);
end;

function TfrmCadCBO.GravarRegistro: boolean;
begin
  Result := CtrlCBO.Gravar;
  if not(Result) then
    raise exception.Create(CtrlCBO.MessageInfo);
end;

end.
