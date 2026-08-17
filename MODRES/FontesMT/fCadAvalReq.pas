unit fCadAvalReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, TB97,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList, fCadastroMestreDetMT,
  DBClient, uCMClientDataSet, uCtrlAvalReq;

type
  TfrmCadAvalReq = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    dblcTipoAval: TwwDBLookupCombo;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    CdsTipoAval: TCMClientDataSet;
    Label2: TLabel;
    dbedNotaMin: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dblcTipoAvalChange(Sender: TObject);
  private
    CtrlAvalReq: TCtrlAvalReq;

    procedure Sel(IdCargo: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadAvalReq: TfrmCadAvalReq;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadAvalReq.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAvalReq := TCtrlAvalReq.Create;
  CtrlAvalReq.InitializeAs(Padroes);
  CtrlAvalReq.CdsDet := CdsDet;
  Sel(-1);

  sbtnProcurarClick(Sender);

  CdsTipoAval.Data := CtrlAvalReq.ListTipoAval;
end;

procedure TfrmCadAvalReq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlAvalReq);
  inherited;
end;

procedure TfrmCadAvalReq.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDCARGO').asFloat := Cds.FieldByName('IDCARGO').asFloat;
end;

procedure TfrmCadAvalReq.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadAvalReq.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadAvalReq.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadAvalReq.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dblcTipoAval.CanFocus) then
    dblcTipoAval.SetFocus;
end;

procedure TfrmCadAvalReq.dblcTipoAvalChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('DESCRTIPOAVAL').asString := Trim(dblcTipoAval.Text);
end;

procedure TfrmCadAvalReq.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcTipoAval.Text) = '') then
  begin
    MsgDlg('Selecione um Tipo de Avaliação.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcTipoAval.SetFocus;
  end
  else
  if (Trim(dbedNotaMin.Text) = '') then
  begin
    MsgDlg('Preencha a Nota Mínima.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedNotaMin.SetFocus;
  end
  else
    inherited;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadAvalReq.Sel(IdCargo: double);
begin
  Cds.Data := CtrlAvalReq.ListMestre(IdCargo);
  CdsDet.Data := CtrlAvalReq.ListDetalhe(IdCargo);
end;

function TfrmCadAvalReq.GravarRegistro: boolean;
begin
  Result := CtrlAvalReq.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlAvalReq.MessageInfo);
end;

end.
