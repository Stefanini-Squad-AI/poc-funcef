unit fCadTipRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  fCadastroMT, DBClient, TREdit, uCMClientDataSet, uCtrlTipRec, wwdblook, uCtrlParamRH;

type
  TfrmCadTipRec = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label3: TLabel;
    dbredHorarioPad: TDBRealEdit;
    rgPenhora: TDBRadioGroup;
    rgEncerramento: TDBRadioGroup;
    gbxRecursos: TGroupBox;
    dblckIndRecursos: TwwDBLookupCombo;
    dbredJurosRecursos1: TDBRealEdit;
    dbrgIndJuros: TDBRadioGroup;
    Label4: TLabel;
    CdsMoeda: TCMClientDataSet;
    dbrgFlgExec: TDBRadioGroup;
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
    CtrlTipRec: TCtrlTipRec;
    CtrlParamRH: TCtrlParamRH;

    procedure Sel(CodTipoRecurso: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTipRec: TfrmCadTipRec;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadTipRec.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamRH := TCtrlParamRH.Create;
  CtrlParamRH.InitializeAs(Padroes);
  CdsMoeda.Data := CtrlParamRH.ListMoeda;

  CtrlTipRec := TCtrlTipRec.Create;
  CtrlTipRec.InitializeAs(Padroes);
  CtrlTipRec.CdsTipRec := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760015;
    PROCJUD, PROCPREV : HelpContext := 1100010;
    SISTJURCONS       : HelpContext := 7190015;
  end;

  gbxRecursos.Visible := (Sistema.IdModulo = SISTJURCONS);
  if (Sistema.IdModulo <> SISTJURCONS) then
    Height := 329;
end;

procedure TfrmCadTipRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipRec);
  FreeAndNil(CtrlParamRH);
  inherited;
end;

procedure TfrmCadTipRec.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipRec.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('FLGPENHORA').asInteger := 0;
  Cds.FieldByName('FLGENCERRAMENTO').asInteger := 0;
end;

procedure TfrmCadTipRec.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTipRec.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipRec.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipRec.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipRec.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadTipRec.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadTipRec.Sel(CodTipoRecurso: double);
begin
  Cds.Data := CtrlTipRec.ListTipRec(CodTipoRecurso);
end;

function TfrmCadTipRec.GravarRegistro: boolean;
begin
  Result := CtrlTipRec.GravarTipRec;
  if not(Result) then
    raise Exception.Create(CtrlTipRec.MessageInfo);
end;

end.
