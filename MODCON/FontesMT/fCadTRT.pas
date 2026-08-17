unit fCadTRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DBClient, fCadastroMT, uCMClientDataSet, uCtrlTRT;

type
  TfrmCadTRT = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label3: TLabel;
    dbedRegiao: TDBEdit;
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
    CtrlTRT: TCtrlTRT;
    procedure Sel(CodigoTRT: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTRT: TfrmCadTRT;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadTRT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTRT := TCtrlTRT.Create;
  CtrlTRT.InitializeAs(Padroes);
  CtrlTRT.CdsTRT := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760007;
//    PROCJUD, PROCPREV : HelpContext := 1100025;
  end;
end;

procedure TfrmCadTRT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTRT);
  inherited;
end;

procedure TfrmCadTRT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTRT.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadTRT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTRT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTRT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTRT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTRT.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadTRT.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadTRT.Sel(CodigoTRT: double);
begin
  Cds.Data := CtrlTRT.ListTRT(CodigoTRT);
end;

function TfrmCadTRT.GravarRegistro: boolean;
begin
  Result := CtrlTRT.GravarTRT;
  if not(Result) then
    raise Exception.Create(CtrlTRT.MessageInfo);
end;

end.
