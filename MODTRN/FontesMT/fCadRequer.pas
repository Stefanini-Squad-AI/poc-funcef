unit fCadRequer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, TB97,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList, fCadastroMestreDetMT,
  DBClient, uCMClientDataSet, uCtrlCursoReq;

type
  TfrmCadRequer = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    dblcCurso: TwwDBLookupCombo;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    CdsCurso: TCMClientDataSet;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dblcCursoChange(Sender: TObject);
  private
    CtrlCursoReq: TCtrlCursoReq;
    
    procedure Sel(IdCargo: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadRequer: TfrmCadRequer;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadRequer.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCursoReq := TCtrlCursoReq.Create;
  CtrlCursoReq.InitializeAs(Padroes);
  CtrlCursoReq.CdsCursoReq := CdsDet;
  Sel(-1);

  sbtnProcurarClick(Sender);

  CdsCurso.Data := CtrlCursoReq.ListCurso;
end;

procedure TfrmCadRequer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCursoReq);
  inherited;
end;

procedure TfrmCadRequer.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadRequer.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDCARGO').asFloat := Cds.FieldByName('IDCARGO').asFloat;
  CdsDet.FieldByName('FLGIMPRESCIND').asInteger := 1;
end;

procedure TfrmCadRequer.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRequer.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRequer.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRequer.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRequer.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dblcCurso.CanFocus) then
    dblcCurso.SetFocus;
end;

procedure TfrmCadRequer.dblcCursoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('DESCRICAO').asString := Trim(dblcCurso.Text);
end;

procedure TfrmCadRequer.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcCurso.Text) = '') then
  begin
    MsgDlg('Selecione o Curso.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcCurso.SetFocus;
  end
  else
    inherited;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadRequer.Sel(IdCargo: double);
begin
  Cds.Data := CtrlCursoReq.ListMestre(IdCargo);
  CdsDet.Data := CtrlCursoReq.ListDetalhe(IdCargo);
end;

function TfrmCadRequer.GravarRegistro: boolean;
begin
  Result := CtrlCursoReq.GravarCursoReq;
  if not(Result) then
    raise exception.Create(CtrlCursoReq.MessageInfo);
end;

end.
