unit fCadTipSent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, FCadastroMT, DBClient, uCMClientDataSet, uCtrlTipSent;

type
  TfrmCadTipSent = class(TFrmCadastroMT)
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
    CtrlTipSent: TCtrlTipSent;

    procedure Sel(CodTipoSent: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTipSent: TfrmCadTipSent;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadTipSent.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipSent := TCtrlTipSent.Create;
  CtrlTipSent.InitializeAs(Padroes);
  CtrlTipSent.CdsTipSent := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760014;
    PROCJUD, PROCPREV : HelpContext := 1100009;
    SISTJURCONS       : HelpContext := 7190014;
  end;
end;

procedure TfrmCadTipSent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipSent);
  inherited;
end;

procedure TfrmCadTipSent.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipSent.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadTipSent.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTipSent.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipSent.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipSent.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipSent.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadTipSent.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadTipSent.Sel(CodTipoSent: double);
begin
  Cds.Data := CtrlTipSent.ListTipSent(CodTipoSent);
end;

function TfrmCadTipSent.GravarRegistro: boolean;
begin
  Result := CtrlTipSent.GravarTipSent;
  if not(Result) then
    raise Exception.Create(CtrlTipSent.MessageInfo);
end;

end.
