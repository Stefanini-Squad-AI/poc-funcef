unit fCadCatEmprGRE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlCatEmprGRE;

type
  TfrmCadCatEmprGRE = class(TFrmCadastroMT)
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
    CtrlCatEmprGRE: TCtrlCatEmprGRE;

    procedure Sel(IdCatEmprGRE: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadCatEmprGRE: TfrmCadCatEmprGRE;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadCatEmprGRE.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCatEmprGRE := TCtrlCatEmprGRE.Create;
  CtrlCatEmprGRE.InitializeAs(Padroes);
  CtrlCatEmprGRE.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadCatEmprGRE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCatEmprGRE);
  inherited;
end;

procedure TfrmCadCatEmprGRE.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCatEmprGRE.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadCatEmprGRE.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadCatEmprGRE.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCatEmprGRE.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCatEmprGRE.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCatEmprGRE.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadCatEmprGRE.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadCatEmprGRE.Sel(IdCatEmprGRE: double);
begin
  Cds.Data := CtrlCatEmprGRE.ListGeral(IdCatEmprGRE);
end;

function TfrmCadCatEmprGRE.GravarRegistro: boolean;
begin
  Result := CtrlCatEmprGRE.Gravar;
  if not(Result) then
    raise exception.Create(CtrlCatEmprGRE.MessageInfo);
end;

end.
