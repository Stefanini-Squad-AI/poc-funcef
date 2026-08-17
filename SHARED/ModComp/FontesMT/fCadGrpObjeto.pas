unit fCadGrpObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  fCadastroMT, DBClient, uCMClientDataSet, uCtrlGrpObjeto;

type
  TfrmCadGrpObjeto = class(TFrmCadastroMT)
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
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlGrpObjeto: TCtrlGrpObjeto;

    procedure Sel(IdGrupoObjeto: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadGrpObjeto: TfrmCadGrpObjeto;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadGrpObjeto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrpObjeto := TCtrlGrpObjeto.Create;
  CtrlGrpObjeto.InitializeAs(Padroes);
  CtrlGrpObjeto.CdsGrpObjeto := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760012;
    PROCJUD, PROCPREV : HelpContext := 1100007;
    SISTJURCONS       : HelpContext := 7190012;
  end;
end;

procedure TfrmCadGrpObjeto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrpObjeto);
  inherited;
end;

procedure TfrmCadGrpObjeto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadGrpObjeto.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('CLASSEOBJ').asInteger := 1;
end;

procedure TfrmCadGrpObjeto.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadGrpObjeto.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrpObjeto.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrpObjeto.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrpObjeto.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadGrpObjeto.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadGrpObjeto.Sel(IdGrupoObjeto: double);
begin
  Cds.Data := CtrlGrpObjeto.ListGrpObjeto(IdGrupoObjeto);
end;

function TfrmCadGrpObjeto.GravarRegistro: boolean;
begin
  Result := CtrlGrpObjeto.GravarGrpObjeto;
  if not(Result) then
    raise Exception.Create(CtrlGrpObjeto.MessageInfo);
end;

end.
