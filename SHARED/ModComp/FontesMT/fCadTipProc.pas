unit fCadTipProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DBClient, fCadastroMT, uCMClientDataSet, uCtrlTipProc;

type
  TfrmCadTipProc = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    dbrgExigeCCusto: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlTipProc: TCtrlTipProc;

    procedure Sel(IdTipoProc: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTipProc: TfrmCadTipProc;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadTipProc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipProc := TCtrlTipProc.Create;
  CtrlTipProc.InitializeAs(Padroes);
  CtrlTipProc.CdsTipProc := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760009;
    PROCJUD, PROCPREV : HelpContext := 1100004;
    SISTJURCONS       : HelpContext := 7190009;
  end;
end;

procedure TfrmCadTipProc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipProc);
  inherited;
end;

procedure TfrmCadTipProc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipProc.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadTipProc.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTipProc.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipProc.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipProc.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipProc.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedDescr.SetFocus;
end;

procedure TfrmCadTipProc.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadTipProc.Sel(IdTipoProc: double);
begin
  Cds.Data := CtrlTipProc.ListTipProc(IdTipoProc);
end;

function TfrmCadTipProc.GravarRegistro: boolean;
begin
  Result := CtrlTipProc.GravarTipProc;
  if not(Result) then
    raise Exception.Create(CtrlTipProc.MessageInfo);
end;

end.
