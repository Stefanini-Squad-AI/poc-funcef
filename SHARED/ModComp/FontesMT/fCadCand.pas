// ATUALIZAÇÕES
//***************************************************************************************
//Nº SOL: 211661/15807
//Nº KINTANA 2060908
//Data da Alteração: 29/09/2014
//Alteração Form: Alteração de layout e no form
//Responsável: William Santana
//Descrição: Padronização da nomenclatura quanto as opções de classificação de estado civíl.
//**************************************************************************************

unit fCadCand;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fpessoaMT, Db,
  Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc, TB97, MAHlpBtn, StdCtrls, TREdit, Buttons,
  Wwdbigrd, Wwdbgrid, checklst, Grids, DBCtrls, TabControlDetalhe, wwdblook, Mask, wwdbedit,
  ExtCtrls, ExtDlgs, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, Wwdbspin, ImgList,
  ComCtrls, CMDBLookupCombo, CmEventosCadastro, wwdbdatetimepicker, CMDateTimePicker, Wwdotdot,
  Wwdbcomb, DBClient, uCMClientDataSet, CMProcura, TB97Tlwn, fcLabel, uCtrlMotivo, uCtrlCargo,
  uCtrlProcessoTrab, uCtrlGrInstr, uCtrlProfiss, uCtrlFonte, uCtrlCurso, uCtrlTipAval,
  uCtrlRegTrein, uCtrlRegAval, uCtrlListTerceirosRH, uCtrlGlobalRH, uCtrlPessoaSindicato,
  uCtrlPessoaFuncionario;

type
  TfrmCadCand = class(TfrmPessoaMT)
    tbsDadosPess: TTabSheet;
    tbsSitFunc: TTabSheet;
    tbsUltEmpr: TTabSheet;
    Label21: TLabel;
    dbedDatAdmis: TCMDateTimePicker;
    dbrgTipContrato: TDBRadioGroup;
    Label26: TLabel;
    dbedSalario: TDBRealEdit;
    dbrgTipoSalario: TDBRadioGroup;
    Label28: TLabel;
    dblckCargo: TwwDBLookupCombo;
    dbgrUltEmpr: TwwDBGrid;
    dsUltEmpr: TwwDataSource;
    Label13: TLabel;
    Label23: TLabel;
    dbedUltAlt: TCMDateTimePicker;
    Label24: TLabel;
    dbedNumIncsricao: TDBEdit;
    opndArqBmp: TOpenPictureDialog;
    Label25: TLabel;
    dblckFonte: TwwDBLookupCombo;
    dbedInclusao: TCMDateTimePicker;
    pnlUltEmpr: TPanel;
    Label12: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    dblckUltCargo: TwwDBLookupCombo;
    dbedUltAdm: TCMDateTimePicker;
    dbedUltDem: TCMDateTimePicker;
    dbedUltSal: TDBRealEdit;
    dblcUltMotivo: TwwDBLookupCombo;
    dbedUltCargo: TwwDBEdit;
    dbedUltEmpresa: TwwDBEdit;
    dbedNumSeq: TwwDBEdit;
    Label3: TLabel;
    dbmObser: TDBMemo;
    tbsRequis: TTabSheet;
    dbgrRequis: TwwDBGrid;
    dsRequis: TwwDataSource;
    pnlRequis: TPanel;
    Label4: TLabel;
    dbedRequis: TDBEdit;
    MontaSelectRequis: TMontaSelect;
    sbtnProcurarRequis: TToolbarButton97;
    gbxDepend: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    dbedQtdIR: TwwDBEdit;
    dbedQtdSF: TwwDBEdit;
    dbedQtdTot: TwwDBEdit;
    dbrgSexo: TDBRadioGroup;
    Label2: TLabel;
    dbedDatNasc: TCMDateTimePicker;
    Label15: TLabel;
    cmbRaca: TComboBox;
    dbrgDeficienteFis: TDBRadioGroup;
    Label18: TLabel;
    dblckGrauInstr: TwwDBLookupCombo;
    dblckNacionalidade: TwwDBLookupCombo;
    gbxNaturalidade: TGroupBox;
    Label17: TLabel;
    Label65: TLabel;
    Label20: TLabel;
    dblckProfissao: TwwDBLookupCombo;
    Label34: TLabel;
    dblckSindicato: TwwDBLookupCombo;
    gbxFiliacao: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    dblckCidadeNasc: TwwDBLookupCombo;
    dblckNaturalidade: TwwDBLookupCombo;
    Label66: TLabel;
    tbshTestes: TTabSheet;
    dbgrTestes: TwwDBGrid;
    dsHstAval: TwwDataSource;
    tbshCursos: TTabSheet;
    pnlCursos: TPanel;
    dbgrCursos: TwwDBGrid;
    dsHstTrn: TwwDataSource;
    Label37: TLabel;
    tbsProcessos: TTabSheet;
    dbgrProcessos: TwwDBGrid;
    dsProcessos: TDataSource;
    dbcmbTipoSang: TwwDBComboBox;
    Label43: TLabel;
    Bevel1: TBevel;
    fcLabel1: TfcLabel;
    CdsProcessos: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsEstadoNasc: TCMClientDataSet;
    CdsCidadeNasc: TCMClientDataSet;
    CdsPaises: TCMClientDataSet;
    CdsSindicato: TCMClientDataSet;
    CdsGrauInstr: TCMClientDataSet;
    CdsProfissao: TCMClientDataSet;
    CdsFonte: TCMClientDataSet;
    CdsTipAval: TCMClientDataSet;
    CdsCurso: TCMClientDataSet;
    MontaSelectCurso: TMontaSelect;
    CdsEntid: TCMClientDataSet;
    CdsInstrutor: TCMClientDataSet;
    CdsHstAval: TCMClientDataSet;
    CdsHstTrn: TCMClientDataSet;
    CdsRequis: TCMClientDataSet;
    CdsUltEmpr: TCMClientDataSet;
    Label30: TLabel;
    CMProcuraCurso: TCMProcura;
    Label27: TLabel;
    dblckEntid: TwwDBLookupCombo;
    Label29: TLabel;
    dblckInstrutor: TwwDBLookupCombo;
    gbxDatas: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    cmDatReIni: TCMDateTimePicker;
    cmDatReFim: TCMDateTimePicker;
    gbxCarga: TGroupBox;
    Label33: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    dbedDurTeor: TDBEdit;
    dbedDurPrat: TDBEdit;
    dbedDurTot: TDBEdit;
    gbxResult: TGroupBox;
    LblAprov: TLabel;
    imgAprov: TImage;
    imgReprov: TImage;
    dbrgAvalTeor: TDBRadioGroup;
    dbrgAvalPrat: TDBRadioGroup;
    dbedAvTeor: TDBRealEdit;
    dbedAvPrat: TDBRealEdit;
    pnlTestes: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dblckTipoEntr: TwwDBLookupCombo;
    dbedAvaliacao: TDBEdit;
    dbedDatPlan: TCMDateTimePicker;
    dbedDatReal: TCMDateTimePicker;
    dbedAvaliador: TDBEdit;
    dbedObserv: TDBMemo;
    Label5: TLabel;
    Label44: TLabel;
    lblEstCivil: TLabel;
    cmbEstCivil: TwwDBLookupCombo;
    CdsEstCivil: TCMClientDataSet;
    dsEstCivil: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarRequisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbrgAvalTeorChange(Sender: TObject);
    procedure dbrgAvalPratChange(Sender: TObject);
    procedure CdsSubTipoAfterInsert(DataSet: TDataSet);
    procedure CdsSubTipoAfterEdit(DataSet: TDataSet);
    procedure CMProcuraCursoValidaDados(Sender: TObject);
    procedure dsHstTrnStateChange(Sender: TObject);
    procedure dbedAvTeorChange(Sender: TObject);
    procedure dblckEntidChange(Sender: TObject);
    procedure dblckEntidEnter(Sender: TObject);
    procedure CdsHstTrnAfterInsert(DataSet: TDataSet);
    procedure dblckNacionalidadeChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    CtrlMotivo: TCtrlMotivo;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlGrInstr: TCtrlGrInstr;
    CtrlProfiss: TCtrlProfiss;
    CtrlFonte: TCtrlFonte;
    CtrlTipAval: TCtrlTipAval;
    CtrlCurso: TCtrlCurso;
    CtrlRegTrein: TCtrlRegTrein;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlRegAval: TCtrlRegAval;
    CtrlProcessoTrab: TCtrlProcessoTrab;
    CtrlGlobalRH: TCtrlGlobalRH;

    iPaisAntigo: integer;
    sUsuXCCustoLocal, sUsuXFilialLocal: string;

    procedure AtualizarAvaliacao;
  protected
    procedure SelSubTipo(IdPessoa: double); override;
  public
    procedure SelCandidato(IdPessoa: double);   
  end;

var
  frmCadCand: TfrmCadCand;

implementation

uses uMensErro, uCMTypes, uSistema, uCtrlPessoa, uCtrlPadroes, uCtrlFuncoesRH,
  uCtrlPessoaCandidato, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TfrmCadCand.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaCandidato.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stCandidato;
  Pessoa.TipoPessoa := tpFisica;
  Pessoa.MostraFoto := true;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := true;
  Pessoa.ObrigaDocumento := false;

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlGrInstr := TCtrlGrInstr.Create;
  CtrlGrInstr.InitializeAs(Padroes);

  CtrlProfiss := TCtrlProfiss.Create;
  CtrlProfiss.InitializeAs(Padroes);

  CtrlFonte := TCtrlFonte.Create;
  CtrlFonte.InitializeAs(Padroes);

  CtrlTipAval := TCtrlTipAval.Create;
  CtrlTipAval.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlRegTrein := TCtrlRegTrein.Create(false, Sistema.UsaRAD, false, false, Sistema.IdEmpresa,
    Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlRegAval := TCtrlRegAval.Create;
  CtrlRegAval.InitializeAs(Padroes);

  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  TCtrlPessoaCandidato(Pessoa).CdsUltimosEmpregos := CdsUltEmpr;
  TCtrlPessoaCandidato(Pessoa).CdsRequiCand := CdsRequis;
  TCtrlPessoaCandidato(Pessoa).CdsTestes := CdsHstAval;
  TCtrlPessoaCandidato(Pessoa).CdsTreinamentos := CdsHstTrn;
  CtrlRegAval.CdsHstAval := CdsHstAval;
  CtrlRegTrein.CdsHistTrein := CdsHstTrn;

  inherited;

  if (Sistema.IdModulo = MODAUTO) then
  begin
    HelpContext := 4170003;
    bbtnAjuda.HelpContext := 4170003;
  end;

  sUsuXCCustoLocal := CtrlUsoGeralRH.UsuXCCusto;
  sUsuXFilialLocal := CtrlUsoGeralRH.UsuXFilial;
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    dmCds.Cds.Data :=
      CtrlPessoaFuncionario.ListFuncionario(CtrlUsoGeralRH.IdUsuarioGeral);

    if not(dmCds.Cds.IsEmpty) then
    begin
      sUsuXCCustoLocal := '(' +
        QuotedStr(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString) +')';
      sUsuXFilialLocal := '(' +dmCds.Cds.FieldByName('IDESTAB').asString +')';
    end;
  end;

  if (sUsuXCCustoLocal <> '') or (sUsuXFilialLocal <> '') then
  begin
    MontaSelect.Tabelas.Add('REQUIPES');
    MontaSelect.Tabelas.Add('REQUICAND');
    MontaSelect.Filtro.Add('REQUICAND.NUMREQ   = REQUIPES.NUMREQ');
    MontaSelect.Filtro.Add('REQUICAND.IDPESSOA = CANDIDAT.IDPESSOA');

    if (sUsuXCCustoLocal <> '') then
      MontaSelect.Filtro.Add('REQUIPES.CODCENTROCUSTO IN ' +sUsuXCCustoLocal);

    if (sUsuXFilialLocal <> '') then
      MontaSelect.Filtro.Add('REQUIPES.IDESTAB IN ' +sUsuXFilialLocal);
  end;

  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao;
  CdsCargo.Data := CtrlCargo.ListCargo;
  CdsPaises.Data := CtrlListTerceirosRH.ListPaises;
  CdsSindicato.Data := CtrlPessoaSindicato.ListPessoaSindicato;
  CdsGrauInstr.Data := CtrlGrInstr.ListGrauInstrucao;
  CdsProfissao.Data := CtrlProfiss.ListProfissao;
  CdsFonte.Data := CtrlFonte.ListGeral(0);
  CdsTipAval.Data := CtrlTipAval.ListTipoAval(0, '2');
  CdsCurso.Data := CtrlCurso.ListGeral;
  CdsEntid.Data := CtrlRegTrein.ListEntid;
  CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F');
  CdsEstCivil.Data := TCtrlPessoaFuncionario(Pessoa).ListEstCivil; //William Santana - SOL 211661/15807 - KIN 2060908
end;

procedure TfrmCadCand.FormShow(Sender: TObject);
begin
  inherited;
  cmbRaca.Enabled := false;
end;

procedure TfrmCadCand.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlGrInstr);
  FreeAndNil(CtrlProfiss);
  FreeAndNil(CtrlFonte);
  FreeAndNil(CtrlTipAval);
  FreeAndNil(CtrlCurso);
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlRegAval);
  FreeAndNil(CtrlProcessoTrab);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmCadCand.dsStateChange(Sender: TObject);
begin
  inherited;
  cmbRaca.Enabled := (Cds.State in [dsInsert,dsEdit]);
end;

procedure TfrmCadCand.dsHstTrnStateChange(Sender: TObject);
begin
  if (CdsHstTrn.State in [dsInsert,dsEdit]) then
  begin
    CdsCurso.Data := CtrlCurso.ListGeral(CdsHstTrn.FieldByName('IDCURSO').asFloat);
    AtualizarAvaliacao;
    CMProcuraCurso.DataSource := dsHstTrn;
    CMProcuraCurso.SetFocus;
  end
  else
  if (CdsHstTrn.State = dsBrowse) then
    CMProcuraCurso.DataSource := nil;
end;

procedure TfrmCadCand.CdsSubTipoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsSubTipo.FieldByName('DATINCLU').asDateTime := Date;
  CdsSubTipo.FieldByName('TIPOCONTRATO').asString := 'E';
end;

procedure TfrmCadCand.CdsHstTrnAfterInsert(DataSet: TDataSet);
begin
  CdsHstTrn.FieldByName('FLGCONTROLE').asInteger := 0;
  CdsHstTrn.FieldByName('FLGAVALCURS').asInteger := 0;
  CdsHstTrn.FieldByName('FLGAVALTEOR').asInteger := 0;
  CdsHstTrn.FieldByName('FLGAVALPRAT').asInteger := 0;
end;

procedure TfrmCadCand.CdsSubTipoAfterEdit(DataSet: TDataSet);
begin
  inherited;
  CdsSubTipo.FieldByName('DATULTATU').asDateTime := Date;
  if (CdsSubTipo.FieldByName('TIPOCONTRATO').IsNull) then
    CdsSubTipo.FieldByName('TIPOCONTRATO').asString := 'E';
end;

procedure TfrmCadCand.CMProcuraCursoValidaDados(Sender: TObject);
begin
  if (CdsHstTrn.State in [dsEdit,dsInsert]) then
  begin
    dbrgAvalTeor.OnChange := nil;
    dbrgAvalPrat.OnChange := nil;

    CdsCurso.Data := CtrlCurso.ListGeral(CdsHstTrn.FieldByName('IDCURSO').asFloat);
    CdsHstTrn.FieldByName('IDENTIDINSTR').asFloat := CdsCurso.FieldByName('IDENTIDINSTR').asFloat;
    CdsHstTrn.FieldByName('FLGAVALTEOR').asInteger := CdsCurso.FieldByName('TEMAVAL').asInteger;
    CdsHstTrn.FieldByName('FLGAVALPRAT').asInteger := CdsCurso.FieldByName('TEMAVPR').asInteger;
    CdsHstTrn.FieldByName('DUR_PRAT').asFloat := CdsCurso.FieldByName('DUR_PRAT').asFloat;
    CdsHstTrn.FieldByName('DUR_TEOR').asFloat := CdsCurso.FieldByName('DUR_TEOR').asFloat;
    CdsHstTrn.FieldByName('VALOR').asFloat := CdsCurso.FieldByName('VALOR').asFloat;

    dbrgAvalTeor.OnChange := dbrgAvalTeorChange;
    dbrgAvalPrat.OnChange := dbrgAvalPratChange;
    AtualizarAvaliacao;
  end;
end;

procedure TfrmCadCand.dblckEntidEnter(Sender: TObject);
begin
  if (CMProcuraCurso.Text <> '') and (CdsHstTrn.State in [dsEdit,dsInsert]) then
    CdsEntid.Data := CtrlRegTrein.ListEntid(CdsHstTrn.FieldByName('IDCURSO').asFloat);
end;

procedure TfrmCadCand.dblckEntidChange(Sender: TObject);
begin
  if (dblckEntid.Text <> '') and (CdsHstTrn.State in [dsEdit,dsInsert]) then
    CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F',
      CdsEntid.FieldByName('IDPESSOA').asFloat);
end;

procedure TfrmCadCand.dbedAvTeorChange(Sender: TObject);
begin
  if (CdsHstTrn.State in [dsEdit,dsInsert]) then
    AtualizarAvaliacao;
end;

procedure TfrmCadCand.dbrgAvalTeorChange(Sender: TObject);
begin
  if (CdsHstTrn.State in [dsEdit,dsInsert]) then
  begin
    dbedAvTeor.Visible := (dbrgAvalTeor.ItemIndex = 0);
    AtualizarAvaliacao;
  end;
end;

procedure TfrmCadCand.dbrgAvalPratChange(Sender: TObject);
begin
  if (CdsHstTrn.State in [dsEdit,dsInsert]) then
  begin
    dbedAvPrat.Visible := (dbrgAvalPrat.ItemIndex = 0);
    AtualizarAvaliacao;
  end;                                                 
end;

procedure TfrmCadCand.dblckNacionalidadeChange(Sender: TObject);
begin
  if (CdsPaises.Active) then
  begin
    gbxNaturalidade.Enabled := (Trim(dblckNacionalidade.Text) <> '') or
      (CdsPessoaFisica.FieldByName('IDPESSOA').IsNull);

    if (iPaisAntigo <> CdsPaises.FieldByName('IDPAIS').asInteger) or
       (gbxNaturalidade.Enabled) then
    begin
      iPaisAntigo := CdsPaises.FieldByName('IDPAIS').asInteger;
      CdsEstadoNasc.Data := CtrlListTerceirosRH.ListEstado(
        CdsPaises.FieldByName('IDPAIS').asInteger);

      CdsCidadeNasc.Data := CtrlListTerceirosRH.ListCidadeNasc(
        CdsPaises.FieldByName('IDPAIS').asInteger);

      if (CdsPessoaFisica.State in [dsInsert,dsEdit]) then
      begin
        CdsPessoaFisica.FieldByName('CODESTADO').Clear;
        CdsPessoaFisica.FieldByName('IDCIDADES').Clear;
      end;
    end;
  end;
end;

procedure TfrmCadCand.sbtnProcurarRequisClick(Sender: TObject);
begin
  MontaSelectRequis.Executar;
  if (MontaSelectRequis.RetornouValor) then
    CdsRequis.FieldByName('NUMREQ').asString := MontaSelectRequis.ValoresChave[0];
  sbtnProcurarRequis.Down := false;
end;

procedure TfrmCadCand.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
  begin
    if (CdsUltEmpr.FieldByName('NUMSEQ').IsNull) then
    begin
      MsgDlg('Número de Sequência deve ser preenchido.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
      dbedNumSeq.SetFocus;
      exit;
    end;
  end
  else
  if (pgctrlDetalhe.ActivePage = tbsRequis) then
  begin
    CdsRequis.FieldByName('DATAREQ').asDateTime := StrToDate(MontaSelectRequis.ValoresChave[1]);
    CdsRequis.FieldByName('TITULO').asString := MontaSelectRequis.ValoresChave[2];
    CdsRequis.FieldByName('ESTAB').asString := MontaSelectRequis.ValoresChave[3];
    CdsRequis.FieldByName('CCUSTO').asString := MontaSelectRequis.ValoresChave[4];

    if (MontaSelectRequis.ValoresChave[5] = 'M') then
      CdsRequis.FieldByName('SEXO').asString := 'Masculino'
    else
    if (MontaSelectRequis.ValoresChave[5] = 'F') then
      CdsRequis.FieldByName('SEXO').asString := 'Feminiino'
    else
      CdsRequis.FieldByName('SEXO').asString := 'Indiferente';

    if (MontaSelectRequis.ValoresChave[6] = 'A') then
      CdsRequis.FieldByName('SITUACAO').asString := 'Aberta'
    else
    if (MontaSelectRequis.ValoresChave[6] = 'E') then
      CdsRequis.FieldByName('SITUACAO').asString := 'Encerrada'
    else
      CdsRequis.FieldByName('SITUACAO').asString := 'Cancelada';
  end
  else
  if (pgctrlDetalhe.ActivePage = tbshTestes) then
  begin
    CdsHstAval.FieldByName('DESCRTIPOAVAL').asString :=
      CdsTipAval.FieldByName('DESCRTIPOAVAL').asString;
    CdsHstAval.FieldByName('DATAREF').asString :=
      FU.IFF(dbedDatReal.Text='', dbedDatPlan.Text, dbedDatReal.Text);

    if (CdsHstAval.State = dsInsert) then
      CdsHstAval.FieldByName('NUMSEQ').asInteger := CtrlRegAval.GetProxNumSeq(
        CdsTipAval.FieldByName('CODTIPOAVAL').asInteger);
  end
  else
  if (pgctrlDetalhe.ActivePage = tbshCursos) then
  begin
    // Cálculo do Número de Sequência
    if (CdsHstTrn.State = dsInsert) then
    begin
      CdsHstTrn.FieldByName('NUMSEQ').asInteger := CtrlRegTrein.GetProxNumSeq;
      if (CdsHstTrn.FieldByName('NUMSEQ').asInteger > 1) and
         (MsgDlg('Já consta esse curso para essa pessoa.' +CR_LF+
                 'Deseja registrar nova ocorrência?', 'Confirmação', mtConfirmation,
                 [mbYes, mbNo, mbHelp], 0) <> mrYes) then
        exit;
    end;

    CdsHstTrn.FieldByName('DESCRICAO').asString := CMProcuraCurso.Text;

    if (CdsHstTrn.FieldByName('DUR_TEOR').IsNull) then
      CdsHstTrn.FieldByName('DUR_TEOR').asInteger := 0;

    if (CdsHstTrn.FieldByName('DUR_PRAT').IsNull) then
      CdsHstTrn.FieldByName('DUR_PRAT').asInteger := 0;

    CdsHstTrn.FieldByName('DUR_TOT').asInteger := CdsHstTrn.FieldByName('DUR_TEOR').asInteger +
      CdsHstTrn.FieldByName('DUR_PRAT').asInteger;
  end;
  inherited;
end;

procedure TfrmCadCand.bbtnConfirmarClick(Sender: TObject);
begin
  //(2->Branca; 4->Preta; 6->Amarela; 8->Parda; 0->Indígena)
  case (cmbRaca.ItemIndex) of
    0 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 2;
    1 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 4;
    2 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 6;
    4 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 0;
    else CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 8;
  end;

  //Início - William Santana - SOL 211661/15807 - KIN 2060908
  if (cdsPessoaFisica.FieldByName('ESTCIVIL').AsString = EmptyStr) then
  begin
   MsgDlg('O estado civil deve ser selecionado.', 'Erro', mtError, [mbOk], 0);
   tbcDetalhe.TabIndex := 5;
   pgctrlDetalhe.ActivePageIndex := 5;
   cmbEstCivil.SetFocus;
   exit;
  end;
  //Término -  William Santana - SOL 211661/15807 - KIN 2060908

  inherited;
end;

procedure TfrmCadCand.bbtnCancelarClick(Sender: TObject);
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

procedure TfrmCadCand.SelCandidato(IdPessoa: double);
begin
  SelPessoa(IdPessoa);
end;

procedure TfrmCadCand.SelSubTipo(IdPessoa: double);
begin
  CdsSubTipo.Data := TCtrlPessoaCandidato(Pessoa).ListCandidato(IdPessoa);
  CdsProcessos.Data := CtrlProcessoTrab.ListProcessosEnvolvidos(IdPessoa);
  CdsUltEmpr.Data := CtrlGlobalRH.ListUltimosEmpregosPessoa(IdPessoa);
  CdsRequis.Data := TCtrlPessoaCandidato(Pessoa).ListRequisicoes(IdPessoa);
  CdsHstAval.Data := CtrlRegAval.ListDetalhe(IdPessoa);
  CdsHstTrn.Data := CtrlRegTrein.ListHistoricoTreinamentoPorPessoa(IdPessoa);

  TFloatField(CdsUltEmpr.FieldByName('ULTSALARIO')).DisplayFormat := '###,###,##0.00';

  if not(CdsProcessos.IsEmpty) then
    MsgDlg('Pessoa Envolvida em Processos.'+CR_LF+'Verifique a Pasta Envolvimento em Processos.',
      'Aviso', mtWarning, [mbOk,mbHelp], 0);

  //(2->Branca; 4->Preta; 6->Amarela; 8->Parda; 0->Indígena)
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '2') then
    cmbRaca.ItemIndex := 0
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '4') then
    cmbRaca.ItemIndex := 1
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '6') then
    cmbRaca.ItemIndex := 2
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '0') then
    cmbRaca.ItemIndex := 4
  else
    cmbRaca.ItemIndex := 3;

  //Início - William Santana - SOL 211661/15807 - KIN 2060908
  cmbEstCivil.text := TCtrlPessoaFuncionario(Pessoa).MostraEstCivil(CdsPessoaFisica.FieldByName('ESTCIVIL').AsString);
  //Término - William Santana - SOL 211661/15807 - KIN 2060908
end;

procedure TfrmCadCand.AtualizarAvaliacao;
begin
  lblAprov.Visible := false;
  imgReprov.Visible := false;
  imgAprov.Visible := false;

  if (CdsCurso.Active) and
     (((CdsCurso.FieldByName('TEMAVAL').asInteger = 1) and (dbrgAvalTeor.ItemIndex = 0)) or
      ((CdsCurso.FieldByName('TEMAVPR').asInteger = 1) and (dbrgAvalPrat.ItemIndex = 0))) then
  begin
    if ((CdsCurso.FieldByName('TEMAVAL').asInteger = 1) and (dbrgAvalTeor.ItemIndex = 0) and
        (CdsCurso.FieldByName('AVALIACAO').asInteger > dbedAvTeor.Value)) or
       ((CdsCurso.FieldByName('TEMAVPR').asInteger = 1) and (dbrgAvalPrat.ItemIndex = 0) and
        (CdsCurso.FieldByName('AVALPRAT').asInteger > dbedAvPrat.Value))  then
    begin
      lblAprov.Caption := 'REPROVADO';
      lblAprov.Font.Color := clRed;
      imgReprov.Visible := true;
    end
    else
    begin
      lblAprov.Caption := 'APROVADO';
      lblAprov.Font.Color := clBlue;
      imgAprov.Visible := true;
    end;
    lblAprov.Visible := true;
  end;

  dbedAvTeor.Visible := (dbrgAvalTeor.ItemIndex = 0);
  dbedAvPrat.Visible := (dbrgAvalPrat.ItemIndex = 0);
end;

end.
