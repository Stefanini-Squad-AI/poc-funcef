unit fCadTipoRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBCtrls, Mask,
  wwdbedit, StdCtrls, Db, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Wwdatsrc,
  Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, ImgList,
  CmEventosCadastro, fCadastroMT, DBClient, uCMClientDataSet, uCtrlTipoRegra;

type
  TfrmCadTipoRegra = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbmemSQLRegra: TDBMemo;
    dbedDescr: TwwDBEdit;
    dbedCodigo: TDBEdit;
    dedGrupo: TwwDBLookupCombo;
    Label4: TLabel;
    CdsGrupoRegra: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure dedGrupoChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlTipoRegra: TCtrlTipoRegra;
    
    procedure Sel(IdTipoRegra: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTipoRegra: TfrmCadTipoRegra;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadTipoRegra.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoRegra := TCtrlTipoRegra.Create;
  CtrlTipoRegra.InitializeAs(Padroes);
  CtrlTipoRegra.Cds := Cds;
  Sel(-1);

  CdsGrupoRegra.Data := CtrlTipoRegra.ListGrupoRegra;
end;

procedure TfrmCadTipoRegra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipoRegra);
  inherited;
end;

procedure TfrmCadTipoRegra.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipoRegra.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadTipoRegra.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTipoRegra.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTipoRegra.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTipoRegra.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTipoRegra.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedDescr.CanFocus) then
    dbedDescr.SetFocus;
end;

procedure TfrmCadTipoRegra.dedGrupoChange(Sender: TObject);
begin
  if (Cds.State in [dsInsert, dsEdit]) and (Trim(dedGrupo.Text) = '') then
    Cds.FieldbyName('IDGRUPOREGRA').Clear;
end;

procedure TfrmCadTipoRegra.bbtnConfirmarClick(Sender: TObject);
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

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadTipoRegra.Sel(IdTipoRegra: double);
begin
  Cds.Data := CtrlTipoRegra.ListGeral(IdTipoRegra);
end;

function TfrmCadTipoRegra.GravarRegistro: boolean;
begin
  Result := CtrlTipoRegra.Gravar;
  if not(Result) then
    raise exception.Create(CtrlTipoRegra.MessageInfo);
end;

end.
