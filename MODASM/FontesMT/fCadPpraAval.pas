unit fCadPpraAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, TB97, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro, ImgList,
  fCadastroMT, DBClient, uCMClientDataSet, wwdblook, TREdit, uCmSqlParams, wwdbedit,
  FCadastroMestreDetMT, ComCtrls, TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker,
  Wwdbspin, uCtrlPpraCipa, uCtrlListTerceirosRH, uCtrlPpraAval, uCtrlPessoaFilialPessoa,
  uCtrlLocalizacoes, uCtrlCargo, uCtrlHoraTrab, uCtrlPpraMeio, uCtrlPpraAgenteRisco,
  uCtrlPpraAcoes, uCtrlPpraBem;

type
  TfrmCadPpraAval = class(TFrmCadastroMestreDetMT)
    CdsPessoaFilialPessoa: TCMClientDataSet;
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    CdsDet: TCMClientDataSet;
    dblcAgente: TwwDBLookupCombo;
    CdsCipa: TCMClientDataSet;
    Label8: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    tbsDadosBasicos: TTabSheet;
    dbrgTipo: TDBRadioGroup;
    tbsDescricao: TTabSheet;
    Label3: TLabel;
    dbmemOBS: TDBMemo;
    tbsTextos: TTabSheet;
    dbmemTextos: TDBMemo;
    Label10: TLabel;
    Label4: TLabel;
    dblcMeioProp: TwwDBLookupCombo;
    Label5: TLabel;
    dblcMeioCont: TwwDBLookupCombo;
    dbrgPeriodo: TDBRadioGroup;
    Label7: TLabel;
    dbmemObserv: TDBMemo;
    gbxEstab: TGroupBox;
    dblcEstab: TwwDBLookupCombo;
    gbxLocal: TGroupBox;
    dblcLocal: TwwDBLookupCombo;
    gbxFuncao: TGroupBox;
    dblcCargo: TwwDBLookupCombo;
    gbxHorario: TGroupBox;
    dblcHorario: TwwDBLookupCombo;
    Label9: TLabel;
    gbxConta: TGroupBox;
    gbxCIPA: TGroupBox;
    Label2: TLabel;
    dbedNumPess: TDBRealEdit;
    DBRadioGroup1: TDBRadioGroup;
    wwDBLookupCombo5: TwwDBLookupCombo;
    Label11: TLabel;
    red5: TRealEdit;
    red1: TRealEdit;
    red2: TRealEdit;
    red6: TRealEdit;
    red3: TRealEdit;
    red7: TRealEdit;
    red4: TRealEdit;
    red8: TRealEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    gbxResponsavel: TGroupBox;
    edNomeResponsavel: TEdit;
    bbtnProcResponsavel: TBitBtn;
    CdsCipaMembro: TCMClientDataSet;
    dsCipa: TwwDataSource;
    dsCipaMembro: TwwDataSource;
    CdsAgenteRisco: TCMClientDataSet;
    dsAgenteRisco: TwwDataSource;
    CdsMeio: TCMClientDataSet;
    dsMeio: TwwDataSource;
    CdsCargo: TCMClientDataSet;
    CdsHorario: TCMClientDataSet;
    CdsLocal: TCMClientDataSet;
    tbsDet2: TTabSheet;
    pnlControlesDet2: TPanel;
    dbgrdDet2: TwwDBGrid;
    dsDet2: TwwDataSource;
    CdsDet2: TCMClientDataSet;
    Label6: TLabel;
    dblcAcoes: TwwDBLookupCombo;
    Label20: TLabel;
    CMDateTimePicker2: TCMDateTimePicker;
    Label21: TLabel;
    CMDateTimePicker3: TCMDateTimePicker;
    CdsAcoes: TCMClientDataSet;
    dsAcoes: TwwDataSource;
    CdsContagem: TCMClientDataSet;
    bbtnConta: TBitBtn;
    gbxEmpresa: TGroupBox;
    dblcEmpresa: TwwDBLookupCombo;
    CdsEmpresa: TCMClientDataSet;
    sbtnFicha: TToolbarButton97;
    Label22: TLabel;
    dblcEP: TwwDBLookupCombo;
    CdsClasseBem: TCMClientDataSet;
    gbxGraduacao: TGroupBox;
    wwDBSpinEdit1: TwwDBSpinEdit;
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
    procedure dblcAgenteCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnProcResponsavelClick(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure dblcAcoesCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnContaClick(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure sbtnFichaClick(Sender: TObject);
    procedure dblcEPCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
  private
    CtrlPpraAval: TCtrlPpraAval;
    CtrlPpraMeio: TCtrlPpraMeio;
    CtrlPpraCipa: TCtrlPpraCipa;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlCargo: TCtrlCargo;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlLocalizacoes: TCtrlLocalizacoes;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPpraAgenteRisco: TCtrlPpraAgenteRisco;
    CtrlPpraAcoes: TCtrlPpraAcoes;
    CtrlPpraBem: TCtrlPpraBem;

    procedure Sel(IdAval: double);
    function GravarRegistro(Exclusao: boolean): boolean;
  end;

var
  frmCadPpraAval: TfrmCadPpraAval;

implementation

uses uMensErro, uSistema, uCtrlPadroes, uCtrlUsoGeralRH, fProcuraPessoaDoc, fAguarde,
  RFichaAvalPPRA;

{$R *.DFM}

procedure TfrmCadPpraAval.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPpraAval := TCtrlPpraAval.Create;
  CtrlPpraAval.InitializeAs(Padroes);
  CtrlPpraAval.Cds := Cds;
  CtrlPpraAval.CdsDet := CdsDet;
  CtrlPpraAval.CdsDet2 := CdsDet2;

  CtrlPpraCipa := TCtrlPpraCipa.Create;
  CtrlPpraCipa.InitializeAs(Padroes);

  CtrlPpraMeio := TCtrlPpraMeio.Create;
  CtrlPpraMeio.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CtrlLocalizacoes := TCtrlLocalizacoes.Create;
  CtrlLocalizacoes.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPpraAgenteRisco := TCtrlPpraAgenteRisco.Create;
  CtrlPpraAgenteRisco.InitializeAs(Padroes);

  CtrlPpraAcoes := TCtrlPpraAcoes.Create;
  CtrlPpraAcoes.InitializeAs(Padroes);

  CtrlPpraBem := TCtrlPpraBem.Create;
  CtrlPpraBem.InitializeAs(Padroes);

  Sel(-1);

  CdsCipaMembro.Data := CtrlPpraCipa.ListDetalhe(0);
  CdsMeio.Data := CtrlPpraMeio.ListGeral;
  CdsAgenteRisco.Data := CtrlPpraAgenteRisco.ListGeral;
  CdsCargo.Data := CtrlCargo.ListCargo(0);
  CdsHorario.Data := CtrlHoraTrab.ListHoraTrab(0);
  CdsLocal.Data := CtrlLocalizacoes.ListaNomeLocalizacao(Sistema.IdEmpresa);
  CdsPessoaFilialPessoa.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsAcoes.Data := CtrlPpraAcoes.ListGeral;
  CdsEmpresa.Data := CtrlPpraCipa.ListEmpresaProp;
  CdsClasseBem.Data := CtrlPpraBem.ListPpraClasseBem(0);

  frmProcuraPessoaDoc := TfrmProcuraPessoaDoc.Create(Application);
end;

procedure TfrmCadPpraAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPpraCipa);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPpraAval);
  FreeAndNil(CtrlPpraMeio);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlLocalizacoes);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPpraAgenteRisco);

  if Assigned(frmProcuraPessoaDoc) then
    FreeAndNil(frmProcuraPessoaDoc);
  inherited;
end;

procedure TfrmCadPpraAval.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPpraAval.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadPpraAval.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePageIndex = 3) then
    CdsDet.FieldByName('GRADUACAO').asInteger := 1;
end;

procedure TfrmCadPpraAval.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPpraAval.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadPpraAval.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadPpraAval.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadPpraAval.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadPpraAval.bbtnConfirmarClick(Sender: TObject);
var
  bInsert: boolean;
begin
  if (Trim(dbmemOBS.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbmemOBS.SetFocus;
  end
  else
  begin
    bInsert := (Cds.State = dsInsert);
    inherited;
    if not(bInsert) then
      Sel(Cds.FieldByName('IDAVAL').AsInteger);
  end;
end;

procedure TfrmCadPpraAval.dblcAgenteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  CdsDet.FieldByName('DESCRICAO').asString := dblcAgente.Text;
end;

procedure TfrmCadPpraAval.dblcAcoesCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  CdsDet2.FieldByName('DESCRICAO').asString := dblcAcoes.Text;
end;

procedure TfrmCadPpraAval.dblcEPCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  CdsDet2.FieldByName('CLASSEBEM').asString := dblcEP.Text;
end;

procedure TfrmCadPpraAval.bbtnProcResponsavelClick(Sender: TObject);
begin
  if (Cds.State in [dsInsert,dsEdit]) and (frmProcuraPessoaDoc.ShowModal = mrOk) then
  begin
    Cds.FieldByName('IDRESPONSAVEL').asString := frmProcuraPessoaDoc.sIDPessoa;
    edNomeResponsavel.Text := frmProcuraPessoaDoc.sNomePessoa;
  end;
end;

procedure TfrmCadPpraAval.CdsAfterScroll(DataSet: TDataSet);
var
  iConta: integer;
begin
  inherited;
  CdsCipa.Data := CtrlPpraCipa.ListGeral(0, Cds.FieldByName('IDEMPRESA').AsInteger,
                                         Cds.FieldByName('IDESTAB').AsInteger);
  for iConta := 1 to 8 do
    TRealEdit(Self.FindComponent('red'+ IntToStr(iConta))).Value := 0;

  bbtnConta.Enabled := (ds.State = dsBrowse) and (not Cds.Eof);
  edNomeResponsavel.Text := CtrlListTerceirosRH.GetNomePessoa(
      Cds.FieldByName('IDRESPONSAVEL').asFloat);
end;

procedure TfrmCadPpraAval.bbtnContaClick(Sender: TObject);
var
  iConta: integer;
begin
  CdsContagem.Data := CtrlPpraAval.ContaEmpregados(
                       Cds.FieldByName('IDEMPRESA').AsInteger,
                       Cds.FieldByName('IDESTAB').AsInteger,
                       Cds.FieldByName('IDLOCALIZACAO').AsInteger,
                       Cds.FieldByName('IDCARGO').AsInteger,
                       Cds.FieldByName('IDHORARIO').AsInteger);

  iConta := 0;
  while not CdsContagem.Eof do
  begin
     inc(iConta);
     TRealEdit(Self.FindComponent('red'+ IntToStr(iConta))).Value := CdsContagem.FieldByName('CONTA').AsInteger;
     CdsContagem.Next;
  end;
end;

procedure TfrmCadPpraAval.tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
  inherited;
  bbtnConta.Enabled := (ds.State = dsBrowse) and (not Cds.Eof);
end;

procedure TfrmCadPpraAval.sbtnFichaClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Ficha da Avaliação PPRA');

  RptFichaAvalPPRA := TRptFichaAvalPPRA.Create(Application);
  RptFichaAvalPPRA.sAval := dbedCodigo.Text;

  RptFichaAvalPPRA.CrmRptCMBeforePrint(Sender);
  RptFichaAvalPPRA.CrmRptCM.IdReports := 3955;
  RptFichaAvalPPRA.CrmRptCM.IdEmpresa := Cds.FieldByName('IDEMPRESA').AsInteger;
  RptFichaAvalPPRA.CrmRptCM.OrigemCM := 1;
  RptFichaAvalPPRA.CrmRptCM.IdModulo := Sistema.IdModulo;
  RptFichaAvalPPRA.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  RptFichaAvalPPRA.CrmRptCM.Print;
  RptFichaAvalPPRA.Free;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadPpraAval.Sel(IdAval: double);
begin
  Cds.Data := CtrlPpraAval.ListGeral(IdAval);
  CdsDet.Data := CtrlPpraAval.ListDetalhe(IdAval);
  CdsDet2.Data := CtrlPpraAval.ListDetalhe2(IdAval);
  sbtnFicha.Enabled := not(Cds.IsEmpty);
end;

function TfrmCadPpraAval.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlPpraAval.Excluir
  else
    Result := CtrlPpraAval.Gravar;

  if not(Result) then
    raise Exception.Create(CtrlPpraAval.MessageInfo);
end;

end.
