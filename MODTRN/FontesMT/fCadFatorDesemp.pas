unit fCadFatorDesemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, TB97, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro, ImgList,
  fCadastroMT, DBClient, uCMClientDataSet, wwdblook, uCtrlFatorAval, uCtrlGrupoFatorAval,
  uCtrlCursoxAvalDes, uCmSqlParams;

type
  TfrmCadFatorDesemp = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label3: TLabel;
    dbmemOBS: TDBMemo;
    Label6: TLabel;
    dblcGrupo: TwwDBLookupCombo;
    CdsGrupoFatorAval: TCMClientDataSet;
    dbrgAplicabilidade: TDBRadioGroup;
    bbtnCursos: TToolbarButton97;
    dsCurso: TwwDataSource;
    CdsCurso: TCMClientDataSet;
    pnlCursos: TPanel;
    Label4: TLabel;
    dbGridCursos: TwwDBGrid;
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
    procedure bbtnCursosClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    CtrlFatorAval: TCtrlFatorAval;
    CtrlGrupoFatorAval: TCtrlGrupoFatorAval;
    CtrlCursoxAvalDes: TCtrlCursoxAvalDes;

    procedure Sel(IdFatorAval: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadFatorDesemp: TfrmCadFatorDesemp;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadFatorDesemp.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlFatorAval := TCtrlFatorAval.Create;
  CtrlFatorAval.InitializeAs(Padroes);
  CtrlFatorAval.Cds := Cds;

  CtrlGrupoFatorAval := TCtrlGrupoFatorAval.Create;
  CtrlGrupoFatorAval.InitializeAs(Padroes);

  CtrlCursoxAvalDes := TCtrlCursoxAvalDes.Create;
  CtrlCursoxAvalDes.InitializeAs(Padroes);

  Sel(-1);
  CdsGrupoFatorAval.Data := CtrlGrupoFatorAval.ListGrupoFatorAval;

  case (Sistema.IdModulo) of
    MODAVA : HelpContext := 700005;
    MODCES : HelpContext := 740004;
    MODTRN : HelpContext := 720008;
  end;
end;

procedure TfrmCadFatorDesemp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlFatorAval);
  FreeAndNil(CtrlGrupoFatorAval);
  FreeAndNil(CtrlCursoxAvalDes);
  inherited;
end;

procedure TfrmCadFatorDesemp.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadFatorDesemp.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadFatorDesemp.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadFatorDesemp.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFatorDesemp.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFatorDesemp.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFatorDesemp.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := True;
end;

procedure TfrmCadFatorDesemp.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadFatorDesemp.bbtnCursosClick(Sender: TObject);
begin
  pnlCursos.Visible := not(pnlCursos.Visible);
  if (pnlCursos.Visible) then
    pnlCursos.Top := 46
  else
    pnlCursos.Top := 355;
end;

procedure TfrmCadFatorDesemp.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadFatorDesemp.Sel(IdFatorAval: double);
begin
  Cds.Data := CtrlFatorAval.ListFatorAval(IdFatorAval);
  if (Cds.FieldByName('IdFatorAval').asInteger <> 0) then
    CdsCurso.Data := CtrlCursoxAvalDes.ListAvalDesXCurso(Cds.FieldByName('IdFatorAval').asFloat)
  else
    CdsCurso.Data := CtrlCursoxAvalDes.ListAvalDesXCurso(-1);

end;

function TfrmCadFatorDesemp.GravarRegistro: boolean;
begin
  Result := CtrlFatorAval.GravarFatorAval;
  if not(Result) then
    raise Exception.Create(CtrlFatorAval.MessageInfo);
end;

end.
