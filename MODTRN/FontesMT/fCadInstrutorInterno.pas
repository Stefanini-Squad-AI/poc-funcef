unit fCadInstrutorInterno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, TB97,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList, fCadastroMestreDetMT,
  DBClient, uCMClientDataSet, uCtrlInstrutorInterno, uCtrlPessoaFuncionario, uCtrlCurso;

type
  TfrmCadInstrutorInterno = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    dblcInstrutor: TwwDBLookupCombo;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    CdsInstrutor: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dblcInstrutorChange(Sender: TObject);
  private
    CtrlInstrutorInterno: TCtrlInstrutorInterno;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCurso: TCtrlCurso;

    procedure Sel(SelPrincipal: boolean; IdCurso: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadInstrutorInterno: TfrmCadInstrutorInterno;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadInstrutorInterno.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlInstrutorInterno := TCtrlInstrutorInterno.Create;
  CtrlInstrutorInterno.InitializeAs(Padroes);
  CtrlInstrutorInterno.CdsInstrutorInterno := CdsDet;

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  sbtnProcurarClick(Sender);
  if not(MontaSelect.RetornouValor) then
    Sel(true, -1);

  CdsInstrutor.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa);
end;

procedure TfrmCadInstrutorInterno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlInstrutorInterno);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlCurso);
  inherited;
end;

procedure TfrmCadInstrutorInterno.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadInstrutorInterno.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDCURSO').asFloat := Cds.FieldByName('IDCURSO').asFloat;
end;

procedure TfrmCadInstrutorInterno.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));  
end;

procedure TfrmCadInstrutorInterno.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadInstrutorInterno.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dblcInstrutor.CanFocus) then
    dblcInstrutor.SetFocus;
end;

procedure TfrmCadInstrutorInterno.dblcInstrutorChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('NOME').asString := Trim(dblcInstrutor.Text);
end;

procedure TfrmCadInstrutorInterno.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcInstrutor.Text) = '') then
  begin
    MsgDlg('Selecione o Instrutor.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcInstrutor.SetFocus;
  end
  else
    inherited;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadInstrutorInterno.Sel(SelPrincipal: boolean; IdCurso: double);
begin
  Cds.Data := CtrlCurso.ListGeral(IdCurso);
  CdsDet.Data := CtrlInstrutorInterno.ListInstrutorInterno(IdCurso);
end;

function TfrmCadInstrutorInterno.GravarRegistro: boolean;
begin
  Result := CtrlInstrutorInterno.GravarInstrutorInterno;
  if not(Result) then
    raise exception.Create(CtrlInstrutorInterno.MessageInfo);
end;

end.
