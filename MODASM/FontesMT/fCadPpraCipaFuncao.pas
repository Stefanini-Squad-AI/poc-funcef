unit fCadPpraCipaFuncao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList,
  DBClient, uCMClientDataSet, FCadastroMT, uCtrlPpraCipaFuncao;

type
  TfrmCadPpraCipaFuncao = class(TFrmCadastroMT)
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
    CtrlPpraCipaFuncao: TCtrlPpraCipaFuncao;
    procedure Sel(IdCipaFuncao: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadPpraCipaFuncao: TfrmCadPpraCipaFuncao;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadPpraCipaFuncao.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPpraCipaFuncao := TCtrlPpraCipaFuncao.Create;
  CtrlPpraCipaFuncao.InitializeAs(Padroes);
  CtrlPpraCipaFuncao.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadPpraCipaFuncao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPpraCipaFuncao);
  inherited;
end;

procedure TfrmCadPpraCipaFuncao.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPpraCipaFuncao.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadPpraCipaFuncao.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPpraCipaFuncao.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraCipaFuncao.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraCipaFuncao.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPpraCipaFuncao.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadPpraCipaFuncao.bbtnConfirmarClick(Sender: TObject);
var
  bInsert: boolean;
begin
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

procedure TfrmCadPpraCipaFuncao.Sel(IdCipaFuncao: double);
begin
  Cds.Data := CtrlPpraCipaFuncao.ListGeral(IdCipaFuncao);
end;

function TfrmCadPpraCipaFuncao.GravarRegistro: boolean;
begin
  Result := CtrlPpraCipaFuncao.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlPpraCipaFuncao.MessageInfo);
end;

end.
