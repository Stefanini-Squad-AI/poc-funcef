unit fCadSindi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtDlgs, Db,
  CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwdatsrc,
  Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, DBCtrls, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, CheckLst, ComCtrls, CMDBLookupCombo, TREdit, wwdbdatetimepicker, Mask, Wwdbspin,
  CMDateTimePicker, wwdblook, ExtCtrls, TabControlDetalhe, wwdbedit, Menus, DBClient,
  TB97Tlwn, uCMClientDataSet, CMProcura, fpessoaMT, uCtrlListTerceirosRH;

type
  TfrmCadSindi = class(TFrmPessoaMT)
    tbsSindi: TTabSheet;
    tbshAliquotas: TTabSheet;
    dbgAliquotas: TwwDBGrid;
    dsAliquota: TwwDataSource;
    Label2: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    speMes: TwwDBSpinEdit;
    dbedMT: TwwDBEdit;
    edNomeMes: TEdit;
    speMesContr: TwwDBSpinEdit;
    edNomeMes2: TEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    CdsAliquota: TCMClientDataSet;
    Label3: TLabel;
    CdsMoeda: TCMClientDataSet;
    DBRealEdit1: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CdsSubTipoAfterScroll(DataSet: TDataSet);
    procedure CdsAliquotaAfterInsert(DataSet: TDataSet);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure speMesChange(Sender: TObject);
    procedure speMesContrChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  protected
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    procedure SelSubtipo(IdPessoa: double); override;
  end;

var
  frmCadSindi: TfrmCadSindi;

implementation

uses uCMTypes, uSistema, uCtrlPessoa, uCtrlPadroes, uCtrlFuncoesRH, uCtrlPessoaSindicato,
  uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadSindi.FormCreate(Sender: TObject);
begin
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  Pessoa := TCtrlPessoaSindicato.Create;
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stSindicato;
  Pessoa.TipoPessoa := tpJuridica;
  Pessoa.MostraFoto := false;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;
  Pessoa.FormCaption := Self.Caption;

  TCtrlPessoaSindicato(Pessoa).CdsAliquota := CdsAliquota;
  inherited;
  CdsMoeda.Data := CtrlListTerceirosRH.ListMoeda;

  speMes.Enabled := false;
  speMesContr.Enabled := false;
  dbgAliquotas.Enabled := false;

  case (Sistema.IdModulo) of
    MODBAS :
    begin
      HelpContext := 690013;
      bbtnAjuda.HelpContext := 690013;
    end;
    MODCES :
    begin
      HelpContext := 740012;
      bbtnAjuda.HelpContext := 740012;
    end;
    MODFOL :
    begin
      HelpContext := 210020;
      bbtnAjuda.HelpContext := 210020;
    end;
  end;
end;

procedure TfrmCadSindi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadSindi.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex > 4) then
    dbgAliquotas.Enabled := true;
end;

procedure TfrmCadSindi.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex > 4) then
    dbgAliquotas.Enabled := true;
end;

procedure TfrmCadSindi.CmeDetalheConfirma(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex > 4) then
    dbgAliquotas.Enabled := false;
end;

procedure TfrmCadSindi.CdsSubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  speMesChange(nil);
  speMesContrChange(nil);
  speMes.Enabled := not(Cds.IsEmpty);
  speMesContr.Enabled := not(Cds.IsEmpty);
end;

procedure TfrmCadSindi.CdsAliquotaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsAliquota.FieldByName('IDSINDICATO').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
end;

procedure TfrmCadSindi.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex > 4) then
    dbgAliquotas.Enabled := false;
end;

procedure TfrmCadSindi.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex > 4) then
    dbgAliquotas.Enabled := false;
end;

procedure TfrmCadSindi.speMesChange(Sender: TObject);
begin
  if (Trim(speMes.Text) = '') then
    edNomeMes.Text := ''
  else
    edNomeMes.Text := LongMonthNames[Round(speMes.Value)];
end;

procedure TfrmCadSindi.speMesContrChange(Sender: TObject);
begin
  if (Trim(speMesContr.Text) = '') then
    edNomeMes2.Text := ''
  else
    edNomeMes2.Text := LongMonthNames[Round(speMesContr.Value)];
end;

procedure TfrmCadSindi.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     (Cds.FieldByName('IDPESSOA').asFloat > 0) then
    CmeCadastroFind(Sender);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadSindi.SelSubtipo(IdPessoa: double);
begin
  CdsSubTipo.Data := TCtrlPessoaSindicato(Pessoa).ListSubTipo(IdPessoa);
  CdsAliquota.Data := TCtrlPessoaSindicato(Pessoa).ListAliquota(
    CdsSubTipo.FieldByName('IDPESSOA').asFloat);
end;

end.
