unit fCadExpReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, TB97,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList, fCadastroMestreDetMT,
  DBClient, uCMClientDataSet, uCtrlExpReq;

type
  TfrmCadExpReq = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    dblcTipoExper: TwwDBLookupCombo;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    CdsTipoExper: TCMClientDataSet;
    Label2: TLabel;
    dbedTempo: TwwDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dblcTipoExperChange(Sender: TObject);
  private
    CtrlExpReq: TCtrlExpReq;
    
    procedure Sel(IdCargo: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadExpReq: TfrmCadExpReq;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadExpReq.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlExpReq := TCtrlExpReq.Create;
  CtrlExpReq.InitializeAs(Padroes);
  CtrlExpReq.CdsDet := CdsDet;
  Sel(-1);

  sbtnProcurarClick(Sender);

  CdsTipoExper.Data := CtrlExpReq.ListTipoExper;
end;

procedure TfrmCadExpReq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlExpReq);
  inherited;
end;

procedure TfrmCadExpReq.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadExpReq.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDCARGO').asFloat := Cds.FieldByName('IDCARGO').asFloat;
  CdsDet.FieldByName('FLGIMPRESCIND').asInteger := 1;
end;

procedure TfrmCadExpReq.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadExpReq.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadExpReq.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dblcTipoExper.CanFocus) then
    dblcTipoExper.SetFocus;
end;

procedure TfrmCadExpReq.dblcTipoExperChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('DESCRICAO').asString := Trim(dblcTipoExper.Text);
end;

procedure TfrmCadExpReq.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcTipoExper.Text) = '') then
  begin
    MsgDlg('Selecione um Tipo de Experiência.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcTipoExper.SetFocus;
  end
  else
  if (Trim(dbedTempo.Text) = '') then
  begin
    MsgDlg('Preencha o Tempo.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedTempo.SetFocus;
  end
  else
    inherited;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadExpReq.Sel(IdCargo: double);
begin
  Cds.Data := CtrlExpReq.ListMestre(IdCargo);
  CdsDet.Data := CtrlExpReq.ListDetalhe(IdCargo);
end;

function TfrmCadExpReq.GravarRegistro: boolean;
begin
  Result := CtrlExpReq.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlExpReq.MessageInfo);
end;

end.
