unit fCadFator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, TB97, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro,
  ImgList, FCadastroMT, DBClient, uCMClientDataSet, wwdblook, uCtrlFatorAvalCurso,
  uCtrlGlobalRH, uCtrlEscalaConceitos;

type
  TfrmCadFator = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label3: TLabel;
    dbmemOBS: TDBMemo;
    dbrgFormaAval: TDBRadioGroup;
    dbrgAplicacao: TDBRadioGroup;
    gbxEscala: TGroupBox;
    dblcEscala: TwwDBLookupCombo;
    CdsEscala: TCMClientDataSet;
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
    procedure dbrgFormaAvalChange(Sender: TObject);
  private
    CtrlFatorAvalCurso: TCtrlFatorAvalCurso;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlEscalaConceitos: TCtrlEscalaConceitos;

    procedure Sel(IdFatorAval: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadFator: TfrmCadFator;

implementation

uses uMensErro, uCtrlPadroes, dCds;

{$R *.DFM}

procedure TfrmCadFator.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlFatorAvalCurso := TCtrlFatorAvalCurso.Create;
  CtrlFatorAvalCurso.InitializeAs(Padroes);
  CtrlFatorAvalCurso.CdsFatorAvalCurso := Cds;

  CtrlEscalaConceitos := TCtrlEscalaConceitos.Create;
  CtrlEscalaConceitos.InitializeAs(Padroes);
  CdsEscala.Data := CtrlEscalaConceitos.ListGeral(0);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGAVALALUNO');
  dbrgAplicacao.Visible := (dmCds.Cds.FieldByName('FLGAVALALUNO').asInteger = 1);

  Sel(-1);
end;

procedure TfrmCadFator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlFatorAvalCurso);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmCadFator.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadFator.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadFator.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadFator.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFator.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFator.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFator.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedDescr.CanFocus) then
    dbedDescr.SetFocus;
end;

procedure TfrmCadFator.dbrgFormaAvalChange(Sender: TObject);
begin
  gbxEscala.Visible := (dbrgFormaAval.ItemIndex = 1);
end;

procedure TfrmCadFator.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadFator.Sel(IdFatorAval: double);
begin
  Cds.Data := CtrlFatorAvalCurso.ListFatorAvalCurso(IdFatorAval);
end;

function TfrmCadFator.GravarRegistro: boolean;
begin
  Result := CtrlFatorAvalCurso.GravarFatorAvalCurso;
  if not(Result) then
    raise Exception.Create(CtrlFatorAvalCurso.MessageInfo);
end;

end.
