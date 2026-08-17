unit fCadRubCLT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlRubCLT;

type
  TfrmCadRubCLT = class(TFrmCadastroMT)
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
    CtrlRubCLT: TCtrlRubCLT;
    
    procedure Sel(CodRubCLT: string);
    function  GravarRegistro: boolean;
  end;

var
  frmCadRubCLT: TfrmCadRubCLT;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadRubCLT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRubCLT := TCtrlRubCLT.Create;
  CtrlRubCLT.InitializeAs(Padroes);
  CtrlRubCLT.Cds := Cds;
  Sel('-1');
end;

procedure TfrmCadRubCLT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRubCLT);
  inherited;
end;

procedure TfrmCadRubCLT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadRubCLT.CmeCadastroInsert(Sender: TObject);
begin
  Sel('-1');
  inherited;
end;

procedure TfrmCadRubCLT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRubCLT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRubCLT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRubCLT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRubCLT.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadRubCLT.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadRubCLT.Sel(CodRubCLT: string);
begin
  Cds.Data := CtrlRubCLT.ListGeral(CodRubCLT);
end;

function TfrmCadRubCLT.GravarRegistro: boolean;
begin
  Result := CtrlRubCLT.Gravar;
  if not(Result) then
    raise exception.Create(CtrlRubCLT.MessageInfo);
end;

end.
