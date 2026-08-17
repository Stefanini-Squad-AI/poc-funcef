unit fCadGrupoFator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fcLabel, wwdblook,
  StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc,
  Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  CmEventosCadastro, ImgList, fCadastroMT, DBClient, uCMClientDataSet, uCtrlGrupoFatorAval,
  uCtrlFatorAval;

type
  TfrmCadGrupoFator = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    bbtnCargos: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    pnlFatores: TPanel;
    Label5: TLabel;
    dbGridFatores: TwwDBGrid;
    dsFator: TwwDataSource;
    CdsFator: TCMClientDataSet;
    Label3: TLabel;
    dbmemOBS: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCargosClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlGrupoFatorAval: TCtrlGrupoFatorAval;
    CtrlFatorAval: TCtrlFatorAval;

    procedure Sel(IdGrupoFatorAval: double);
    function GravarRegistro: boolean;
  end;

var
  frmCadGrupoFator: TfrmCadGrupoFator;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadGrupoFator.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrupoFatorAval := TCtrlGrupoFatorAval.Create;
  CtrlGrupoFatorAval.InitializeAs(Padroes);
  CtrlGrupoFatorAval.Cds := Cds;

  CtrlFatorAval := TCtrlFatorAval.Create;
  CtrlFatorAval.InitializeAs(Padroes);

  Sel(-1);
end;

procedure TfrmCadGrupoFator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrupoFatorAval);
  FreeAndNil(CtrlFatorAval);
  inherited;
end;

procedure TfrmCadGrupoFator.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadGrupoFator.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadGrupoFator.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadGrupoFator.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrupoFator.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrupoFator.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrupoFator.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadGrupoFator.bbtnCargosClick(Sender: TObject);
begin
  pnlFatores.Visible := not(pnlFatores.Visible);
  if (pnlFatores.Visible) then
    pnlFatores.Top := 46
  else
    pnlFatores.Top := 222;
end;

procedure TfrmCadGrupoFator.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadGrupoFator.Sel(IdGrupoFatorAval: double);
begin
  Cds.Data := CtrlGrupoFatorAval.ListGrupoFatorAval(IdGrupoFatorAval);
  if (Trim(Cds.FieldByName('IDGRUPOFATORAVAL').asString) <> '') then
    CdsFator.Data := CtrlFatorAval.ListFatorAval(0, '', Cds.FieldByName('IDGRUPOFATORAVAL').asFloat)
  else
    CdsFator.Data := CtrlFatorAval.ListFatorAval(-1);
end;

function TfrmCadGrupoFator.GravarRegistro: boolean;
begin
  Result := CtrlGrupoFatorAval.GravarGrupoFatorAval;
  if not(Result) then
    raise Exception.Create(CtrlGrupoFatorAval.MessageInfo);
end;

end.
