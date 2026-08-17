unit fCadFormFGTS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro,
  ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlFormFGTS;

type
  TfrmCadFormFGTS = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit1: TDBEdit;
    Label3: TLabel;
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
    CtrlFormFGTS: TCtrlFormFGTS;
    
    procedure Sel(IdFormaResc: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadFormFGTS: TfrmCadFormFGTS;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadFormFGTS.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlFormFGTS := TCtrlFormFGTS.Create;
  CtrlFormFGTS.InitializeAs(Padroes);
  CtrlFormFGTS.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadFormFGTS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlFormFGTS);
  inherited;
end;

procedure TfrmCadFormFGTS.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadFormFGTS.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('FLGOPTANTE').asInteger := 1;
end;

procedure TfrmCadFormFGTS.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadFormFGTS.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFormFGTS.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFormFGTS.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFormFGTS.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadFormFGTS.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadFormFGTS.Sel(IdFormaResc: double);
begin
  Cds.Data := CtrlFormFGTS.ListGeral(IdFormaResc);
end;

function TfrmCadFormFGTS.GravarRegistro: boolean;
begin
  Result := CtrlFormFGTS.Gravar;
  if not(Result) then
    raise exception.Create(CtrlFormFGTS.MessageInfo);
end;

end.
