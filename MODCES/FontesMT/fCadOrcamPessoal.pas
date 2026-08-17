unit fCadOrcamPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, ExtCtrls, DBCtrls, wwdblook, Mask, CmEventosCadastro, ImgList, DBClient,
  fCadastroMT, TREdit, uCMClientDataSet, uCtrlCargo, uCtrlOrcamTrein, uCtrlOrcamPessoal,
  uCtrlPessoaFilialPessoa, wwdbedit, Wwdbspin;

type
  TfrmCadOrcamPessoal = class(TFrmCadastroMT)
    CdsEstab: TCMClientDataSet;
    Label1: TLabel;
    lblPontosHay: TLabel;
    dbrePontosHay: TDBRealEdit;
    lblGrupo: TLabel;
    dblcEstab: TwwDBLookupCombo;
    dbedCodigo: TDBEdit;
    CdsCCusto: TCMClientDataSet;
    Label2: TLabel;
    cmbCCusto: TwwDBLookupCombo;
    CdsCargo: TCMClientDataSet;
    Label5: TLabel;
    dblckCargo: TwwDBLookupCombo;
    Label15: TLabel;
    Label3: TLabel;
    speAno: TwwDBSpinEdit;
    speMes: TwwDBSpinEdit;
    edNomeMes: TEdit;
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
    procedure CmeCadastroCancel(Sender: TObject);
    procedure speMesChange(Sender: TObject);
  private
    CtrlCargo: TCtrlCargo;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlOrcamTrein: TCtrlOrcamTrein;
    CtrlOrcamPessoal: TCtrlOrcamPessoal;

    procedure Sel(IdOrcamPessoal: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadOrcamPessoal: TfrmCadOrcamPessoal;

implementation

uses uSistema, uMensErro, uCtrlPadroes, dCds, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadOrcamPessoal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlOrcamPessoal := TCtrlOrcamPessoal.Create;
  CtrlOrcamPessoal.InitializeAs(Padroes);
  CtrlOrcamPessoal.CdsDet := Cds;

//  sbtnProcurarClick(Sender);

  CtrlOrcamTrein := TCtrlOrcamTrein.Create;
  CtrlOrcamTrein.InitializeAs(Padroes);
  CdsCCusto.Data := CtrlOrcamTrein.ListCentroCusto(Sistema.IdEmpresa,
    CtrlUsoGeralRH.UsuXCCusto);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);
  CdsCargo.Data := CtrlCargo.ListCargo;

  Sel(-1);

end;

procedure TfrmCadOrcamPessoal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlOrcamPessoal);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlOrcamTrein);
  FreeAndNil(CtrlPessoaFilialPessoa);
  inherited;
end;

procedure TfrmCadOrcamPessoal.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadOrcamPessoal.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  CmeCadastroFind(Sender);
end;

procedure TfrmCadOrcamPessoal.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
end;

procedure TfrmCadOrcamPessoal.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadOrcamPessoal.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadOrcamPessoal.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadOrcamPessoal.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadOrcamPessoal.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (speMes.CanFocus) then
    speMes.SetFocus;
end;

procedure TfrmCadOrcamPessoal.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  bInserindo := (Cds.State = dsInsert);
  inherited;
  if not(bInserindo) then
    CmeCadastroFind(Sender);
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadOrcamPessoal.Sel(IdOrcamPessoal: double);
begin
  Cds.Data := CtrlOrcamPessoal.ListOrcamPessoal(IdOrcamPessoal,0,0);
end;

function TfrmCadOrcamPessoal.GravarRegistro: boolean;
begin
  Result := CtrlOrcamPessoal.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlOrcamPessoal.MessageInfo);
end;

procedure TfrmCadOrcamPessoal.speMesChange(Sender: TObject);
begin
  inherited;
  if (Trim(speMes.Text) = '') then
    edNomeMes.Text := ''
  else
    edNomeMes.Text := LongMonthNames[Round(speMes.Value)];
end;

end.
