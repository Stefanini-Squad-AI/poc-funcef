unit fCadCID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroMT,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  wwdbedit, uCtrlCID;

type
  TfrmCadCID = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TwwDBEdit;
    Label2: TLabel;
    dbedDescr: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlCID: TCtrlCID;
    
    procedure Sel(CodCID: string);
    function  GravarRegistro: boolean;
  end;

var
  frmCadCID: TfrmCadCID;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadCID.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCID := TCtrlCID.Create;
  CtrlCID.InitializeAs(Padroes);

  CtrlCID.CdsCID := Cds;
  Sel('-1');
end;

procedure TfrmCadCID.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCID);
  inherited;
end;

procedure TfrmCadCID.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadCID.CmeCadastroInsert(Sender: TObject);
begin
  Sel('-1');
  inherited;
end;

procedure TfrmCadCID.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadCID.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCID.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCID.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCID.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadCID.bbtnConfirmarClick(Sender: TObject);
var
  bInsert: boolean;
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
    bInsert := (Cds.State = dsInsert);
    inherited;
    if not(bInsert) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadCID.Sel(CodCID: string);
begin
  Cds.Data := CtrlCID.ListCID(CodCID);
end;

function TfrmCadCID.GravarRegistro: boolean;
begin
  Result := CtrlCID.GravarCID;
  if not(Result) then
    raise Exception.Create(CtrlCID.MessageInfo);
end;

end.
