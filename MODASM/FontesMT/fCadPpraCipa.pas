unit fCadPpraCipa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, TB97, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro, ImgList,
  fCadastroMT, DBClient, uCMClientDataSet, wwdblook, uCtrlPpraCipa, uCtrlPpraCipaFuncao,
  uCtrlPessoaFilialPessoa, TREdit, uCmSqlParams, FCadastroMestreDetMT, ComCtrls,
  TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker, wwdbedit;

type
  TfrmCadPpraCipa = class(TFrmCadastroMestreDetMT)
    CdsPessoaFilialPessoa: TCMClientDataSet;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    dbedCodigo: TDBEdit;
    dbmemOBS: TDBMemo;
    dblcEmpresa: TwwDBLookupCombo;
    dbrgTipo: TDBRadioGroup;
    dbedNumPess: TDBRealEdit;
    CdsDet: TCMClientDataSet;
    MontaSelectFunc: TMontaSelect;
    dbedNomeCand: TwwDBEdit;
    sbtnProcFunc: TToolbarButton97;
    dbDataIni: TCMDateTimePicker;
    dbDataFim: TCMDateTimePicker;
    dblcFuncaoCIPA: TwwDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    CdsClpaFuncao: TCMClientDataSet;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dblcEstab: TwwDBLookupCombo;
    CdsEmpresa: TCMClientDataSet;
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
    procedure CmeDetalheInsert(Sender: TObject);
    procedure sbtnProcFuncClick(Sender: TObject);
    procedure dblcFuncaoCIPACloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    CtrlPpraCipa: TCtrlPpraCipa;
    CtrlPpraCipaFuncao: TCtrlPpraCipaFuncao;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;

    procedure Sel(IdPpraCipa: integer);
    function GravarRegistro(Exclusao: boolean): boolean;
  end;

var
  frmCadPpraCipa: TfrmCadPpraCipa;

implementation

uses uMensErro, uSistema, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadPpraCipa.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPpraCipa := TCtrlPpraCipa.Create;
  CtrlPpraCipa.InitializeAs(Padroes);
  CtrlPpraCipa.Cds := Cds;
  CtrlPpraCipa.CdsDet := CdsDet;

  CtrlPpraCipaFuncao := TCtrlPpraCipaFuncao.Create;
  CtrlPpraCipaFuncao.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);
    
  with (MontaSelectFunc.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
      
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  Sel(-1);
  CdsPessoaFilialPessoa.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsClpaFuncao.Data := CtrlPpraCipaFuncao.ListGeral;
  CdsEmpresa.Data := CtrlPpraCipa.ListEmpresaProp;
end;

procedure TfrmCadPpraCipa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPpraCipa);
  FreeAndNil(CtrlPessoaFilialPessoa);
  inherited;
end;

procedure TfrmCadPpraCipa.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPpraCipa.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadPpraCipa.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPPRACIPA').asInteger := Cds.FieldByName('IDPPRACIPA').asInteger;
end;

procedure TfrmCadPpraCipa.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPpraCipa.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadPpraCipa.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadPpraCipa.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadPpraCipa.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadPpraCipa.dblcFuncaoCIPACloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  CdsDet.FieldByName('DESCRICAO').asString := dblcFuncaoCIPA.Text; 
end;

procedure TfrmCadPpraCipa.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dbmemOBS.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbmemOBS.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadPpraCipa.sbtnProcFuncClick(Sender: TObject);
begin
  inherited;
  MontaSelectFunc.Executar;
  if (MontaSelectFunc.RetornouValor) then
  begin
    CdsDet.FieldByName('IDPESSOA').asString := MontaSelectFunc.ValoresChave[0];
    CdsDet.FieldByName('NOME').asString := MontaSelectFunc.ValoresChave[1];
  end;
  sbtnProcFunc.Down := false;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadPpraCipa.Sel(IdPpraCipa: integer);
begin
  Cds.Data := CtrlPpraCipa.ListGeral(IdPpraCipa, 0, 0);
  CdsDet.Data := CtrlPpraCipa.ListDetalhe(IdPpraCipa);
end;

function TfrmCadPpraCipa.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := (CtrlPpraCipa.Excluir)
  else
    Result := (CtrlPpraCipa.Gravar);

  if not(Result) then
    raise Exception.Create(CtrlPpraCipa.MessageInfo);
end;

end.
