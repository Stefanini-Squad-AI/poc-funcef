unit fCadTipAcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DBClient, fCadastroMT, uCMClientDataSet, uCtrlTipAcao;

type
  TfrmCadTipAcao = class(TFrmCadastroMT)
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
    CtrlTipAcao: TCtrlTipAcao;

    procedure Sel(IdTipoAcao: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTipAcao: TfrmCadTipAcao;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadTipAcao.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipAcao := TCtrlTipAcao.Create;
  CtrlTipAcao.InitializeAs(Padroes);
  CtrlTipAcao.CdsTipAcao := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760010;
    PROCJUD, PROCPREV : HelpContext := 1100005;
    SISTJURCONS       : HelpContext := 7190010;
  end;
end;

procedure TfrmCadTipAcao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipAcao);
  inherited;
end;

procedure TfrmCadTipAcao.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipAcao.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadTipAcao.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTipAcao.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipAcao.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipAcao.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipAcao.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedDescr.SetFocus;
end;

procedure TfrmCadTipAcao.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
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

procedure TfrmCadTipAcao.Sel(IdTipoAcao: double);
begin
  Cds.Data := CtrlTipAcao.ListTipAcao(IdTipoAcao);
end;

function TfrmCadTipAcao.GravarRegistro: boolean;
begin
  Result := CtrlTipAcao.GravarTipAcao;
  if not(Result) then
    raise Exception.Create(CtrlTipAcao.MessageInfo);
end;

end.
