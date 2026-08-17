unit fCadLinha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, TREdit, DBCtrls, wwdblook, Mask,
  CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlLinha,
  uCtrlListTerceirosRH;

type
  TfrmCadLinha = class(TFrmCadastroMT)
    Label7: TLabel;
    dbedCodigo: TDBEdit;
    Label11: TLabel;
    dbedDescr: TDBEdit;
    Label9: TLabel;
    dbcmbTipoTransp: TDBComboBox;
    Label12: TLabel;
    dbredValorUnit: TDBRealEdit;
    Label10: TLabel;
    dbedNumRef: TDBEdit;
    Label8: TLabel;
    dblcEmpre: TwwDBLookupCombo;
    CdsEmprTransp: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlLinha: TCtrlLinha;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    procedure Sel(IdLinhaTransp: integer);
    function  GravarRegistro: boolean;
  end;

var
  frmCadLinha: TfrmCadLinha;

implementation

uses uMensErro, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadLinha.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlLinha := TCtrlLinha.Create;
  CtrlLinha.InitializeAs(Padroes);
  CtrlLinha.Cds := Cds;
  Sel(-1);

  CdsEmprTransp.Data := CtrlListTerceirosRH.ListPessoaTerceiro;
end;

procedure TfrmCadLinha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlLinha);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadLinha.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadLinha.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadLinha.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadLinha.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadLinha.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadLinha.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadLinha.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadLinha.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código Oficial.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  if (Trim(dbcmbTipoTransp.Text) = '') then
  begin
    MsgDlg('Indique o Tipo de Transporte.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbcmbTipoTransp.SetFocus;
  end
  else
  if (dbredValorUnit.Value = 0) then
  begin
    MsgDlg('Preencha o Valor Unitário.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbredValorUnit.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadLinha.Sel(IdLinhaTransp: integer);
begin
  Cds.Data := CtrlLinha.ListLinhaTransporte(IdLinhaTransp);
end;

function TfrmCadLinha.GravarRegistro: boolean;
begin
  Result := CtrlLinha.Gravar;
  if not(Result) then
    raise exception.Create(CtrlLinha.MessageInfo);
end;

end.
