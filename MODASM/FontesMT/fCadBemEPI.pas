unit fCadBemEPI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MontaSelect, Db,
  DBClient, uCMClientDataSet, FCadastroMestreDetMT, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, Mask, wwdbedit,
  uCtrlPpraBem, uCtrlPessoaFuncionario, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadBemEPI = class(TFrmCadastroMestreDetMT)
    CdsDet: TCMClientDataSet;
    dbedDescricao: TwwDBEdit;
    dbedPlaca: TwwDBEdit;
    dblcConjunto: TwwDBLookupCombo;
    dblcGrupo: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dblcClasseBem: TwwDBLookupCombo;
    Label5: TLabel;
    CdsFunc: TCMClientDataSet;
    Label6: TLabel;
    dblkpcmbEmpregado: TwwDBLookupCombo;
    Label10: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    Label7: TLabel;
    CMDateTimePicker2: TCMDateTimePicker;
    CdsConjunto: TCMClientDataSet;
    CdsClasse: TCMClientDataSet;
    CdsGrupo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkpcmbEmpregadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    CtrlPpraBem: TCtrlPpraBem;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    procedure Sel(SelPrincipal: boolean; IdBem: double);
    function  GravarRegistro(Exclusao: boolean): boolean;
  end;

var
  frmCadBemEPI: TfrmCadBemEPI;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadBemEPI.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPpraBem := TCtrlPpraBem.Create;
  CtrlPpraBem.InitializeAs(Padroes);
  CtrlPpraBem.Cds := Cds;
  CtrlPpraBem.Cds1 := CdsDet;
                                                          
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  Sel(true, -1);
  
  CdsConjunto.Data := CtrlPpraBem.ListConjunto(0);
  CdsClasse.Data := CtrlPpraBem.ListClasseBem(0);
  CdsGrupo.Data := CtrlPpraBem.ListGrupo(0);
  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
    '  F.MATRICULA, F.IDPESSOA, P.NOME');
end;

procedure TfrmCadBemEPI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPpraBem);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmCadBemEPI.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(true, StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadBemEPI.CmeCadastroInsert(Sender: TObject);
begin
  Sel(false, -1);
  inherited;
  Cds.FieldByName('REGISTRO').asString := 'I';
  Cds.FieldByName('IDPESSOA').asFloat := Sistema.IdEmpresa;
end;

procedure TfrmCadBemEPI.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
end;

procedure TfrmCadBemEPI.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
end;

procedure TfrmCadBemEPI.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadBemEPI.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadBemEPI.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadBemEPI.dblkpcmbEmpregadoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  CdsDet.FieldByName('NOME').asString := Trim(dblkpcmbEmpregado.Text);
end;

procedure TfrmCadBemEPI.bbtnConfirmarClick(Sender: TObject);
var
  bInserir: boolean;
begin
  if (Trim(dbedDescricao.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescricao.SetFocus;
  end
  else
  begin
    bInserir := (Cds.State = dsInsert);
    inherited;
    if not(bInserir) then
      Sel(true, Cds.FieldByName('IDBEM').asInteger);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadBemEPI.Sel(SelPrincipal: boolean; IdBem: double);
begin
  if (SelPrincipal) then
    Cds.Data := CtrlPpraBem.ListBem(Sistema.IdEmpresa,IdBem, 0);
    
  CdsDet.Data := CtrlPpraBem.ListEpi(IdBem);
end;

function TfrmCadBemEPI.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlPpraBem.ExcluirBem
  else
    Result := CtrlPpraBem.GravarBem;

  if not(Result) then
    raise Exception.Create(CtrlPpraBem.MessageInfo);
end;

end.
