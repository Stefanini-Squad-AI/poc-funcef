unit fCadRegIncentivo;

{ Alterações
{--------------------------------------------------------------------------------------------------
Nº SOL......: 245977
Nº KINTANA..: 635853
Data........: 29/04/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Ajuste na rotina de treinamento
--------------------------------------------------------------------------------------------------
{***************************************************************************************************
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
Rotinas.....: .dfm (exclusão abas avaliação, mudança na aba cursos)
****************************************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls,
  Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, CMProcura, wwdblook, ImgList, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, DBClient, uCMClientDataSet, FCadastroMestreDetMT, uCtrlRegTrein,
  uCtrlCurso, uCtrlPessoaFuncionario, uCtrlCargo,
  wwdbedit, uCmSqlParams, CMProcuraSubTipo, CMDBLookupCombo, Wwquery, uCtrlFuncoesRH,
  uCtrlEtapaProcesso, uCtrlPeriodo,uDiasUteis,
  DBGrids, Math, uCtrlTurma;

type
  TfrmCadRegIncentivo = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedMatricula: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    dbedSit: TDBEdit;
    dbedCargo: TDBEdit;
    CdsDet: TCMClientDataSet;
    CdsCurso: TCMClientDataSet;
    dsCargo: TwwDataSource;
    CdsCargo: TCMClientDataSet;
    MontaSelectFunc: TMontaSelect;
    MontaSelectCurso: TMontaSelect;
    CdsEscala: TCMClientDataSet;
    CdsGeraTermo: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    PageControlDet: TPageControl;
    tbshDadosBasicos: TTabSheet;
    Label4: TLabel;
    Label2: TLabel;
    Label34: TLabel;
    CMProcuraCurso: TCMProcura;
    tbshObservacaoCurso: TTabSheet;
    dsTurma: TwwDataSource;
    CdsEtapa: TCMClientDataSet;
    tbshMensalidade: TTabSheet;
    CdsMensalidades: TCMClientDataSet;
    DsMensalidades: TwwDataSource;
    CdsMensalidadesAux: TCMClientDataSet;
    DsMensalidadesAux: TwwDataSource;
    PgCtrlDespesas: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    grdDespesas: TwwDBGrid;
    GroupBox2: TGroupBox;
    lblVlrEmpresa: TLabel;
    lblVlrEmpregado: TLabel;
    EdtQtdParcela: TwwDBEdit;
    lblQtdParcReal: TLabel;
    EdtNParcela: TwwDBEdit;
    lblQtdParcPrevista: TLabel;
    EdtVlrCurso: TRealEdit;
    lblTotalCurso: TLabel;
    Label26: TLabel;
    dbedValor: TDBRealEdit;
    grbDiploma: TGroupBox;
    EdtDataEntrega: TCMDateTimePicker;
    lblDataEntrega: TLabel;
    grbDesliga: TGroupBox;
    grbData: TGroupBox;
    DtpFimdaFidelidade: TCMDateTimePicker;
    lblFimDaFidelidade: TLabel;
    mmObservacaoCurso: TDBMemo;
    Label21: TLabel;
    Label22: TLabel;
    EdtValorEmpresa: TRealEdit;
    EdtValorEmpregado: TRealEdit;
    CkbProjetoEntregue: TDBCheckBox;
    Label3: TLabel;
    Label5: TLabel;
    grbHora: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    lblEntidade: TDBText;
    lblCidade: TDBText;
    lblTurma: TDBText;
    lblUF: TDBText;
    lblCarga: TDBText;
    lblHoraIni: TDBText;
    lblHoraFim: TDBText;
    lblDtIni: TDBText;
    lblDtFim: TDBText;
    ckbDesliga: TDBCheckBox;
    lblDataDesliga: TLabel;
    EdtDataDeslig: TCMDateTimePicker;
    cdsTurma: TCMClientDataSet;
    cdsInscritos: TCMClientDataSet;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    lblValorDevolver: TLabel;
    LblVlrPrevistoCurso: TLabel;
    btnAtualizarMeta: TBitBtn;
    grpVlrDevolver: TGroupBox;
    EdtVlrDevolverDtAtual: TDBRealEdit;
    EdtVlrPrevistoCurso: TDBRealEdit;
    dbrgControle: TDBRadioGroup;
    lblPartEmpresa: TLabel;
    EdtvlrPartEmpresa: TwwDBEdit;
    lblPartEmpregado: TLabel;
    EdtVlrPartEmpregado: TwwDBEdit;
    Panel2: TPanel;
    lblVencimentoParcela: TLabel;
    EdtDtVencimento: TCMDateTimePicker;
    btnDespOk: TBitBtn;
    lblVlrMensalidade: TLabel;
    EdtVlrMensalidade: TDBRealEdit;
    btnDespCancel: TBitBtn;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CMProcuraCursoValidaDados(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure tbcDetalheChange(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CdsDetAfterScroll(DataSet: TDataSet);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CMProcuraCursoApertouBotao(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroOpenDataSet(Sender: TObject);
    procedure PageControlDetChange(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    Function RetornaValorTotalMensalidade (Cds : TCMClientDataSet) : Double;
    Function RetornaValorTotalEmpresa     (Cds : TCMClientDataSet) : Double;
    Function RetornaValorTotalEmpregado   (Cds : TCmClientDataSet) : Double;
    Procedure RetornaValorDevolverDtAtual;
    Procedure ProporcionalizacaoValores;
    procedure ProporcionalizacaoValores_Parcialmente(PartEmpresa, PartEmpregado : SmallInt; Cds : TCmClientDataSet);
    procedure DsMensalidadesAuxDataChange(Sender: TObject; Field: TField);
    procedure CdsMensalidadesAuxAfterOpen(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnDespOkClick(Sender: TObject);
    procedure btnDespCancelClick(Sender: TObject);
    procedure EdtvlrPartEmpresaExit(Sender: TObject);
    procedure EdtVlrPartEmpregadoExit(Sender: TObject);
    procedure EdtvlrPartEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVlrPartEmpregadoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarMetaClick(Sender: TObject);
    procedure dbrgControleClick(Sender: TObject);
    procedure CkbProjetoEntregueClick(Sender: TObject);
    procedure EdtDataEntregaExit(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure ckbDesligaClick(Sender: TObject);
    procedure EdtDataDesligExit(Sender: TObject);
    procedure EdtvlrPartEmpresaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtVlrPartEmpregadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure DtpFimdaFidelidadeExit(Sender: TObject);
    procedure EdtDataEntregaChange(Sender: TObject);
  private
    CtrlRegTrein: TCtrlRegTrein;
    CtrlTurma   : TCtrlTurma;
    CtrlCurso: TCtrlCurso;
    CtrlCargo: TCtrlCargo;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    ListaSiglaCadastrada: TStrings;
    ListaTurmaPessoa : TStringList;
    CtrlEtapaProcesso: TCtrlEtapaProcesso;
    CtrlPeriodo: TCtrlPeriodo;
    dOldIdCurso: double;
    iOldNumSeq, IdTipoProcesso, iTabIndex: integer;
    sDataIniAntes, sDataIniDepois: string;

    ModoEdicao : Boolean;
    UltVlrValidoEmpresa, UltVlrValidoEmpregado : Integer;

    function  VerificaSigla: Boolean;
    Function VerificaPreenchimentoObrigatorio_Despesas : Boolean;

    Procedure ReorganizaQtd;
    Procedure CalcFimDaFidelidade;
    Procedure HabilitarParcialmente;
    Function  StrZero(Numero : String; Casas : Integer) : String;
    Procedure InsereAux (DtVencimento : TDateTime; ValorMensalidade : Double);
    Procedure ReorganizaNParcela;
    procedure ReorganizaNumSeq;
    function CalcMetaAtuarial (FatorMetaAtuarial : Double) : Boolean;
    procedure CarregaProjFinal;

    procedure proporcionalizaEmp (PartEmpresa, PartEmpregado : SmallInt);

    procedure PreencheListaTurma;
    procedure AtualizaValorCurso;
    procedure CancelaEfetivaMensalidadeNovos(bCancela : boolean);
    procedure AjustaParcelas;

  public
    bEmpregado: boolean;
    IdPessoa: double;
    IdCurso: Integer;
    CodCentroRespon : Integer;
    CodTipRecDes :Integer;
    CodCentroCusto :Integer;
    Idprograma : Integer;
    CpIdpessoa:Integer;
    LacHist : String;
    DataVencto: TDateTime;
    DataEmissao : TDateTime;
    DataLancto : TDateTime;
    fplncodigo: Double;
    idPlano : Double;
    sFormaRecPagCODSUBCONTA      : String;
    sFormaRecPagPLACONTACONTABCHQ  : String;
    iNumLanc : Integer;
    bUsaPlanoPatro  :  boolean;
    bExcluiPlanilha : boolean;
    NoDocumento: Integer;
    pidPlanilha : Integer;
    pidLancto : Integer;
    iPlanilha :Integer;
    liPlncodigo : Double;
    sSql : String;

    procedure Sel(SelPrincipal: boolean);
  end;

var
  frmCadRegIncentivo: TfrmCadRegIncentivo;

implementation

uses uCMTypes, uSistema, uMensErro, uModulo,  fPreview, uCtrlPadroes,
     uCtrlUsoGeralRH, dCds,DBaseDados,uCtrlParamIntegra, fAguarde,
     fRegTreinMetaAtuarial;

{$R *.DFM}

procedure TfrmCadRegIncentivo.FormCreate(Sender: TObject);
begin
  PageControlDet.ActivePage := tbshDadosBasicos;
  inherited;

  ModoEdicao := False;

  if CdsMensalidades.IsEmpty then begin
    dbrgControle.ItemIndex := -1;
  end;

  CtrlRegTrein := TCtrlRegTrein.Create(true, Sistema.UsaRAD, false, false, Sistema.IdEmpresa,
  Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);
  CtrlRegTrein.CdsHistTrein := CdsDet;
  CtrlRegTrein.CdsMensal    := CdsMensalidades;

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlTurma := TCtrlTurma.Create;
  CtrlTurma.InitializeAs(Padroes);

  CtrlRegTrein.CdsInscritos := CdsInscritos;
  CtrlRegTrein.CdsTurma     := CdsTurma;
  ListaTurmaPessoa          := TStringList.Create;
  CmeDetalhe.RepetirInsert  := false;

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CdsCurso.Data := CtrlCurso.ListGeral(-1);

  cdsTurma.Data     := CtrlTurma.ListaDadosTurma('-1');
  cdsInscritos.Data := CtrlTurma.ListaTurmasInscritas(-1);

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

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  IdTipoProcesso := -1;

  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    bEmpregado := true;
    IdPessoa := StrToFloat(CtrlUsoGeralRH.IdUsuarioGeral);
    Sel(true);
  end
  else
  begin
    IdPessoa := -1;
    Sel(true);
  end;

  if (Sistema.IdModulo = 417) then
    HelpContext := 4170012;

  CMProcuraCurso.DataSource := nil;
  ListaSiglaCadastrada:= TStringList.Create;

end;

procedure TfrmCadRegIncentivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlCurso);
  FreeAndNil(CtrlTurma);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlPessoaFuncionario);
  ListaSiglaCadastrada.Free;
  ListaTurmaPessoa.Free;
  inherited;
end;

procedure TfrmCadRegIncentivo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    IdPessoa := StrToFloat(MontaSelect.ValoresChave[0]);
    Sel(true);
  end;
end;

procedure TfrmCadRegIncentivo.CmeDetalheInsert(Sender: TObject);
var
   Dados : OleVariant;
begin
  {copia dados para pesquisar se há duplicidade na turma}
  Dados := cdsDet.data;
  cdsAux.data := Dados;

  inherited;

  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('FLGAVALCURS').asInteger := 0;
  CdsDet.FieldByName('FLGAVALTEOR').asInteger := 0;
  CdsDet.FieldByName('FLGAVALPRAT').asInteger := 0;
  CdsDet.FieldByName('IDMODULO').AsInteger    := 72;
  CdsDet.FieldByName('ENTREGUE').asInteger    := 0;
  CdsDet.FieldByName('FLGSIM').asInteger      := 0;
  CdsDet.FieldByName('REGISTRO').asString     := 'I';

  {guarda a opercao que iniciou o processo para caso faça inclusão e aperte editar não busque dados errados}
  CdsDet.FieldByName('OP_INICIAL').asString := 'I';

  EdtDataDeslig.Visible   := False;
  lblDataDesliga.Visible  := False;

  if CdsDet.FieldByName('CODDOCUMENTO').AsInteger = 0 then begin
    if CdsMensalidades.IsEmpty then begin
      dbrgControle.ItemIndex := 0;
      EdtvlrPartEmpresa.Text := '100';
      CdsDet.FieldByName('PARTEMPRESA').AsInteger := 100;
    end;

     dbedValor.Enabled := true;
     CMProcuraCurso.Enabled := true;
  end
end;

procedure TfrmCadRegIncentivo.CmeDetalheDelete(Sender: TObject);
var
  c : integer;
begin
  if (CdsDet.State in [dsInsert,dsEdit,dsBrowse]) then
  begin
    if CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0 then  begin
       MsgDlg('Para este registro existem documentos financeiros Gerados.' +CR_LF+ 'Favor Verificar.',
                  'Informação', mtInformation, [mbOk,mbHelp], 0);
       exit;
    end;

    if not CdsMensalidades.IsEmpty then
    begin
      ModoEdicao := True;
      CdsMensalidades.First;
      CdsMensalidades.Filtered := False;
      CdsMensalidades.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
      CdsMensalidades.Filtered := True;

      while not (CdsMensalidades.Eof) do
        CdsMensalidades.Delete;

      CdsMensalidades.Filtered    := False;
      CdsMensalidadesAux.Filtered := False;
      CdsMensalidadesAux.Data := CdsMensalidades.Data;
    end;

    if cdsInscritos.Locate('IDTURMA', CdsDet.FieldByName('IDTURMA').asInteger, []) then
       cdsInscritos.Delete;

    c := ListaTurmaPessoa.IndexOf(cdsDet.FieldByName('IDTURMA').AsString);
    if c >= 0 then
       ListaTurmaPessoa.Strings[c] := IntToStr( CdsDet.FieldByName('IDTURMA').asInteger * -1 ); // valores negativos são turmas excluidas
    inherited;

   end;
end;

procedure TfrmCadRegIncentivo.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;

  // Atualiza valor da turma se for Incentivo
  AtualizaValorCurso;

  Accept := (CtrlRegTrein.GravarHistoricoTreinamento(bEmpregado, dbedNome.Text,
    Cds.FieldByName('CODCENTROCUSTO').asString, IdTipoProcesso));

  if not(Accept) and (pos('duplicidade', CtrlRegTrein.MessageInfo) = 0) then
    raise Exception.Create(CtrlRegTrein.MessageInfo)
  else
  if (CtrlRegTrein.MessageInfo <> '') then
    MsgDlg(CtrlRegTrein.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0);
end;


procedure TfrmCadRegIncentivo.AtualizaValorCurso;
var
   c : integer;
   sIdturma, sFiltro : string;
begin
  for c := 0 to ListaTurmaPessoa.Count-1 do
  begin
    if StrToInt(ListaTurmaPessoa.Strings[c]) > 0 then   // valores negativos são turmas excluidas
    begin
      sIdTurma := sIdTurma + ListaTurmaPessoa.Strings[c];
      if c < ListaTurmaPessoa.Count-1 then
         sIdTurma := sIdTurma + ', ';
    end;
  end;

  // filtra só lançamentos que foram incluidos/alterados
  cdsDet.DisableControls;
  sFiltro := cdsDet.Filter;
  cdsDet.first;
  cdsDet.Filtered := false;
  cdsDet.Filter   := 'OP_INICIAL <> '' '' AND REGISTRO = ''I'' ';
  cdsDet.Filtered := true;

  if not cdsDet.eof then
  begin
    // busca todas as turmas alteradas/incluidas
    cdsTurma.data := CtrlTurma.ListaDadosTurma( sIdTurma );

    while not cdsDet.eof do
    begin
      if cdsTurma.Locate('IDTURMA', cdsDet.FieldByName('IDTURMA').AsInteger, []) then
      begin
        if (cdsTurma.FieldByName('VALORCURSO').AsCurrency <> cdsDet.FieldByName('VALOR').AsCurrency) then
        begin
          cdsTurma.Edit;
          cdsTurma.FieldByName('VALORCURSO').AsCurrency  := cdsDet.FieldByName('VALOR').AsCurrency;
          cdsTurma.Post;
        end;
      end;
      cdsDet.next;
    end;
  end;
  cdsDet.Filtered := false;
  cdsDet.Filter   := sFiltro;
  cdsDet.Filtered := true;

  cdsDet.first;
  cdsDet.EnableControls;
end;

procedure TfrmCadRegIncentivo.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin

    PageControlDet.ActivePageIndex := 0;
    //CdsCurso.Data := CtrlCurso.ListGeral(CdsDet.FieldByName('IDCURSO').asFloat);

    ModoEdicao := True;
    CdsMensalidades.First;
    CdsMensalidades.Filtered := False;
    CdsMensalidades.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
    CdsMensalidades.Filtered := True;

    CdsMensalidadesAux.First;
    CdsMensalidadesAux.Filtered := False;
    CdsMensalidadesAux.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
    CdsMensalidadesAux.Filtered := True;

    EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
    EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
    EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);

    CarregaProjFinal;
    EdtDataEntregaExit(Sender);
    RetornaValorDevolverDtAtual;

    if CdsDet.FieldByName('IDCURSO').asFloat > 0 then begin
      if sbtnAltDet.Down then begin
        if not VerificaSigla then
        begin
          MsgDlg('Sigla não vinculada ao curso', 'Aviso', mtWarning, [mbOk], 0);
          tbcDetalhe.SetFocus;
        end;
      end;
    end;
    HabilitarParcialmente;
    ProporcionalizacaoValores;

    CMProcuraCurso.DataSource := dsDet;

    if not CMProcuraCurso.Enabled = false then begin
      CMProcuraCurso.SetFocus;
    end;
  end
  else
    if (CdsDet.State = dsBrowse) then
      CMProcuraCurso.DataSource := nil;
end;

procedure TfrmCadRegIncentivo.CdsDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  iOldNumSeq := -1;
  dOldIdCurso := -1;
  PageControlDetChange(PageControlDet);
end;


procedure TfrmCadRegIncentivo.tbcDetalheChange(Sender: TObject);
begin
  if (iOldNumSeq <> CdsDet.FieldByName('NUMSEQ').asInteger) or
     (dOldIdCurso <> CdsDet.FieldByName('IDCURSO').asFloat) then
  begin
    if (tbcDetalhe.TabIndex = 1) then
    begin
      CtrlRegTrein.CdsMensal := CdsMensalidades;
      if not CdsMensalidades.IsEmpty then begin
        if (not CtrlRegTrein.GravarMensalidades(idPessoa, CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').asFloat)) then begin
          MsgDlg(CtrlRegTrein.MessageInfo, 'Informação', mtInformation, [mbOk], 0); //Higor Nayde Ferreira SOL 245977 PPM 635853
          tbcDetalhe.TabIndex := iTabIndex;
          pgctrlDetalhe.ActivePageIndex := iTabIndex;
          exit;
        end;
      end;
    end;
  end;

  if (tbcDetalhe.TabIndex > 0) then
  begin
    iOldNumSeq := CdsDet.FieldByName('NUMSEQ').asInteger;
    dOldIdCurso := CdsDet.FieldByName('IDCURSO').asFloat;
  end;

  inherited;
  sbtnInsDet.Visible := (tbcDetalhe.TabIndex = 0);
  sbtnExcluiDet.Visible := (tbcDetalhe.TabIndex = 0);
end;

procedure TfrmCadRegIncentivo.tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
  inherited;
  iTabIndex := tbcDetalhe.TabIndex;
end;

procedure TfrmCadRegIncentivo.sbtnProcurarClick(Sender: TObject);
begin
  bEmpregado := (Sender = sbtnProcurar);
  if (bEmpregado) then
    MontaSelect := MontaSelectFunc;

  inherited;
end;

procedure TfrmCadRegIncentivo.bbtnOkDetClick(Sender: TObject);
var
  sFlgOk: string;
  QtdAva, TotAva : integer;
  iPosTurma  : integer;
  bDuplicado : boolean;
  sMesAno : string;
begin

  if (CMProcuraCurso.Text = '') then begin
    MsgDlg('Informe o Curso.',
           'Informação', mtInformation, [mbOk], 0); //Higor Nayde Ferreira SOL 245977 PPM 635853
    exit;
  end;

  if (EdtVlrPrevistoCurso.value = 0) then begin
    MsgDlg('Informe o Valor Previsto do Curso.',
           'Informação', mtInformation, [mbOk], 0);  //Higor Nayde Ferreira SOL 245977 PPM 635853
    exit;
  end;

  // valida duplicidade da turma
  bDuplicado := false;
  cdsAux.Filtered := false;
  cdsAux.Filter   := 'IDTURMA = '+cdsTurma.FieldByName('IDTURMA').AsString;
  cdsAux.Filtered := true;
  while (not cdsAux.eof) and (not bDuplicado) do
  begin
    if cdsDet.FieldByName('NUMSEQ').AsString <> cdsAux.FieldByName('NUMSEQ').AsString then
       bDuplicado := true;

    cdsAux.next;
  end;

  if bDuplicado then
    if MsgDlg('Já consta essa turma para essa pessoa.',
              'Informação', mtInformation, [mbOk,mbHelp], 0) = mrNo then
       abort;

  if ListaTurmaPessoa.IndexOf( cdsTurma.FieldByName('IDTURMA').AsString ) = -1 then
     ListaTurmaPessoa.Add( cdsTurma.FieldByName('IDTURMA').AsString );


  if (pgctrlDetalhe.ActivePageIndex = 0) then
  begin
    // Cálculo do Número de Sequência
    if (CdsDet.State = dsInsert) then
    begin
      CdsDet.FieldByName('NUMSEQ').asInteger := CtrlRegTrein.GetProxNumSeq;
      ReorganizaNumSeq;

      {if (CdsDet.FieldByName('NUMSEQ').asInteger > 1) and
         (MsgDlg('Já consta esse curso para essa pessoa.' +CR_LF+
                 'Deseja registrar nova ocorrência?', 'Confirmação', mtConfirmation,
                 mbYesNoCancel, 0) <> mrYes) then
        exit; }
    end;

    if CdsMensalidades.State in [dsEdit, dsInsert] then begin
      CdsMensalidades.Post;
    end;
    ModoEdicao := True;
    CtrlRegTrein.GravarMensalidades(idPessoa, CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').asFloat);

    CancelaEfetivaMensalidadeNovos(false);

    CdsDet.FieldByName('DESCRICAO').asString  := CMProcuraCurso.Text;
    CdsDet.FieldByName('CONCLUIDO').asInteger := 0;
    // Não enviar mensagens a partir do registro individual de treinamento.

    CdsDet.FieldByName('PARTEMPRESA').asInteger   := StrToIntDef(EdtvlrPartEmpresa.text,0);
    CdsDet.FieldByName('PARTEMPREGADO').asInteger := StrToIntDef(EdtVlrPartEmpregado.text,0);

    if (CdsDet.FieldByName('DUR_TEOR').IsNull) then
       CdsDet.FieldByName('DUR_TEOR').asInteger := 0;

    if (CdsDet.FieldByName('DUR_PRAT').IsNull) then
       CdsDet.FieldByName('DUR_PRAT').asInteger := 0;

    if CkbProjetoEntregue.Visible = False then begin
       CdsDet.FieldByName('ENTREGUE').AsInteger := 0;
    end;

    if (not CkbProjetoEntregue.Checked) or (CkbProjetoEntregue.Visible = False) then begin
      if not (CdsDet.FieldByName('DTENTREGA').IsNull) then begin
         CdsDet.FieldByName('DTENTREGA').Clear;
      end;
    end;

  end;

  inherited;

  EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
  EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
  EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);
  PageControlDet.ActivePage := tbshDadosBasicos;
end;

procedure TfrmCadRegIncentivo.bbtnConfirmarClick(Sender: TObject);
begin
  if (CdsDet.State <> dsBrowse) then
    exit;
  inherited;
  Sel(false);
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------


procedure TfrmCadRegIncentivo.Sel(SelPrincipal: boolean);
begin
  if (SelPrincipal) then
  begin
    Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
        '  F.IDPESSOA, F.MATRICULA, F.IDCARGO, (''  '' || P.NOME) AS NOME,'+CR_LF+
        '  ST.DESCRICAO AS SITUACAO, F.CODCENTROCUSTO, F.IDEMPRESA');

    CdsCargo.Data := CtrlCargo.ListCargo(FU.IFF(Cds.FieldByName('IDCARGO').asFloat > 0,
      Cds.FieldByName('IDCARGO').asFloat, -1));
  end;

  iOldNumSeq    := -1;
  dOldIdCurso   := -1;

  CdsDet.Data       := CtrlRegTrein.ListHistoricoTreinamentoPorPessoa(IdPessoa);
  cdsInscritos.Data := CtrlTurma.ListaTurmasInscritas(IdPessoa);

  PreencheListaTurma();

  ModoEdicao := True;
  CdsMensalidades.Data    := CtrlRegTrein.ListaMensalidades(IdPessoa, CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').AsFloat, 0);
  CdsMensalidadesAux.Data := CdsMensalidades.Data;

  EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
  EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
  EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);
end;

function TfrmCadRegIncentivo.VerificaSigla: boolean;
begin
   CdsGeraTermo.Data:= CtrlRegTrein.ObterSigla(CdsDet.FieldByName('IDCURSO').AsFloat);

   Result:= not CdsGeraTermo.IsEmpty;
end;


procedure TfrmCadRegIncentivo.CmeDetalheEdit(Sender: TObject);
var
  Dados : OleVariant;
begin
  if (CdsDet.State in [dsInsert,dsEdit,dsBrowse]) then
  begin
    if CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0 then begin
       MsgDlg('Para este registro existem documentos financeiros Gerados.' +CR_LF+ 'Favor Verificar.',
              'Informação', mtInformation, [mbOk,mbHelp], 0);
    end;
  end;

  if CdsDet.FieldByName('CODDOCUMENTO').AsInteger = 0 then begin
     dbedValor.Enabled := true;
     CMProcuraCurso.Enabled := true;
  end;

  Dados := cdsDet.data;
  cdsAux.data := Dados;

  inherited;

  {guarda a opercao que iniciou o processo para caso faça inclusão e aperte editar não busque dados errados}
  if CdsDet.FieldByName('OP_INICIAL').asString = '' then
     CdsDet.FieldByName('OP_INICIAL').asString := 'E';

  EdtDataDeslig.Visible   := (CdsDet.FieldByName('FLGSIM').asString = '1');
  lblDataDesliga.Visible  := (CdsDet.FieldByName('FLGSIM').asString = '1');

  CdsCurso.Data := CtrlCurso.ListGeral(CdsDet.FieldByName('IDCURSO').asFloat);

  if CdsDet.FieldByName('OP_INICIAL').asString = 'E' then
     cdsTurma.Data := CtrlTurma.ListaDadosTurma( cdsDet.FieldByName('IDTURMA').AsString, cdsDet.FieldByName('IDPESSOA').AsInteger, true )
  else
     cdsTurma.Data := CtrlTurma.ListaDadosTurma( cdsDet.FieldByName('IDTURMA').AsString );

  CdsDet.FieldByName('IDTURMA').asInteger    := cdsTurma.FieldByName('IDTURMA').AsInteger;
  CdsDet.FieldByName('DESCR_TURMA').asString := cdsTurma.FieldByName('DESCRICAO').AsString;
  CdsDet.FieldByName('DATREINI').asDateTime  := cdsTurma.FieldByName('DTINI').AsDateTime;
  CdsDet.FieldByName('DATREFIM').asDateTime  := cdsTurma.FieldByName('DTFIM').AsDateTime;
  CdsDet.FieldByName('DATPLINI').asDateTime  := cdsTurma.FieldByName('DTINI').AsDateTime;
  CdsDet.FieldByName('DATPLFIM').asDateTime  := cdsTurma.FieldByName('DTFIM').AsDateTime;
  CdsDet.FieldByName('DUR_TOT').AsInteger    := cdsTurma.FieldByName('CARGAHORA').AsInteger;
  CdsDet.FieldByName('VALOR').asCurrency     := cdsTurma.FieldByName('VALORCURSO').asCurrency;
  cdsDet.FieldByName('SIGLA').AsString       := cdsTurma.FieldByName('SIGLA').AsString;
end;

procedure TfrmCadRegIncentivo.CMProcuraCursoApertouBotao(Sender: TObject);
begin
  IdCurso:= CdsDet.FieldByName('IDCURSO').AsInteger;
  inherited;
end;

procedure TfrmCadRegIncentivo.CmeDetalheConfirma(Sender: TObject);
begin
  if CdsDet.State = dsInsert then
  begin
    // insere na turma
    cdsInscritos.Insert;
    cdsInscritos.FieldByName('IDTURMA').AsInteger := cdsTurma.FieldByName('IDTURMA').AsInteger;
    cdsInscritos.FieldByName('IDPESSOA').AsFloat  := IdPessoa;
    cdsInscritos.Post;
  end;

  inherited;
  if Trim(CdsDet.FieldByName('TERMOCURSO').AsString) <> '' then
    ListaSiglaCadastrada.Add(CdsDet.FieldByName('TERMOCURSO').AsString);
end;

procedure TfrmCadRegIncentivo.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  ListaSiglaCadastrada.Clear;
end;

procedure TfrmCadRegIncentivo.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  ListaSiglaCadastrada.Clear;
end;

procedure TfrmCadRegIncentivo.CmeCadastroOpenDataSet(Sender: TObject);
begin
  inherited;
  ListaSiglaCadastrada.Clear;
end;


procedure TfrmCadRegIncentivo.PageControlDetChange(Sender: TObject);
var  Hoje : TDateTime;
begin
  if cds.State = dsEdit then
     btnAtualizarMeta.enabled := (EdtDataDeslig.visible) and (EdtDataDeslig.date > 0);

  inherited;
end;

procedure TfrmCadRegIncentivo.CMProcuraCursoValidaDados(Sender: TObject);
var
   iQtdInscritos, idTurmaOld : integer;
begin
  // guarda ultima turma
  if CdsDet.State = dsEdit then
     idTurmaOld := cdsTurma.FieldByName('IDTURMA').AsInteger
  else
     idTurmaOld := -1;

  if CdsDet.FieldByName('REGISTRO').AsString = 'T' then
     MsgDlg('Essa turma pertence ao Registro de Treinamento.','Informação', mtInformation, [mbOk], 0);

  if MontaSelectCurso.RetornouValor then
  begin
    iQtdInscritos := CtrlTurma.GetQtdInscritos( StrToInt(MontaSelectCurso.ValoresChave[1]) );
    if iQtdInscritos > 0 then
    begin
      MsgDlg('Essa turma já possui um empregado inscrito.',
             'Informação', mtInformation, [mbOk], 0);//Higor Nayde Ferreira SOL 245977 PPM 635853
      CdsDet.FieldByName('IDCURSO').asFloat := idTurmaOld;
      Abort;
    end;
  end;


  if (CdsDet.State in [dsEdit,dsInsert]) then
  begin
    CdsCurso.Data := CtrlCurso.ListGeral(CdsDet.FieldByName('IDCURSO').asFloat);
    CdsDet.FieldByName('IDENTIDINSTR').asFloat := CdsCurso.FieldByName('IDENTIDINSTR').asFloat;
    CdsDet.FieldByName('FLGAVALTEOR').asInteger := CdsCurso.FieldByName('TEMAVAL').asInteger;
    CdsDet.FieldByName('FLGAVALPRAT').asInteger := CdsCurso.FieldByName('TEMAVPR').asInteger;
    CdsDet.FieldByName('DUR_PRAT').asFloat := CdsCurso.FieldByName('DUR_PRAT').asFloat;
    CdsDet.FieldByName('DUR_TEOR').asFloat := CdsCurso.FieldByName('DUR_TEOR').asFloat;

    if MontaSelectCurso.RetornouValor then
    begin
      if (CdsDet.State in [dsInsert]) or ((CdsDet.State in [dsEdit]) and (CdsDet.FieldByName('OP_INICIAL').asString = 'I')) then
         cdsTurma.Data := CtrlTurma.ListaDadosTurma( MontaSelectCurso.ValoresChave[1] )
      else if (CdsDet.State in [dsEdit]) then
      begin
        cdsTurma.Data := CtrlTurma.ListaDadosTurma( MontaSelectCurso.ValoresChave[1], IdPessoa, true );
        CdsDet.FieldByName('IDENTIDINSTR').asFloat := CdsTurma.FieldByName('IDENTIDINSTR').asFloat;
      end;

      CdsDet.FieldByName('IDTURMA').asInteger    := cdsTurma.FieldByName('IDTURMA').AsInteger;
      CdsDet.FieldByName('DESCR_TURMA').asString := cdsTurma.FieldByName('DESCRICAO').AsString;
      CdsDet.FieldByName('DATREINI').asDateTime  := cdsTurma.FieldByName('DTINI').AsDateTime;
      CdsDet.FieldByName('DATREFIM').asDateTime  := cdsTurma.FieldByName('DTFIM').AsDateTime;
      CdsDet.FieldByName('DATPLINI').asDateTime  := cdsTurma.FieldByName('DTINI').AsDateTime;
      CdsDet.FieldByName('DATPLFIM').asDateTime  := cdsTurma.FieldByName('DTFIM').AsDateTime;
      CdsDet.FieldByName('DUR_TOT').AsInteger    := cdsTurma.FieldByName('CARGAHORA').AsInteger;
      CdsDet.FieldByName('VALOR').asCurrency     := cdsTurma.FieldByName('VALORCURSO').asCurrency;
      cdsDet.FieldByName('SIGLA').AsString       := cdsTurma.FieldByName('SIGLA').AsString;
      // verifica se mudou turma e remove dos inscritos
      if cdsTurma.FieldByName('IDTURMA').AsInteger <> idTurmaOld then
         if cdsInscritos.Locate('IDTURMA', idTurmaOld, []) then
            cdsInscritos.delete;
    end;

    ModoEdicao := True;
    CdsMensalidades.Filtered := False;
    CdsMensalidades.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
    CdsMensalidades.Filtered := True;

    CdsMensalidadesAux.First;
    CdsMensalidadesAux.Filtered := False;
    CdsMensalidadesAux.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
    CdsMensalidadesAux.Filtered := True;

    CarregaProjFinal;
    CalcFimDaFidelidade;
    HabilitarParcialmente;
  end;
end;

procedure TfrmCadRegIncentivo.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  PageControlDet.ActivePage := tbshDadosBasicos;
  PageControlDetChange(PageControlDet);
  CancelaEfetivaMensalidadeNovos(true);   
end;

procedure TfrmCadRegIncentivo.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  PageControlDetChange(PageControlDet);
end;

procedure TfrmCadRegIncentivo.bbtnVoltarDetClick(Sender: TObject);
begin
  PageControlDet.ActivePage := tbshDadosBasicos;
  CancelaEfetivaMensalidadeNovos(true);
  inherited;
end;

function TfrmCadRegIncentivo.RetornaValorTotalMensalidade(
  Cds: TCMClientDataSet): Double;
var
  TotalValorMensalidade : Double;
begin
  TotalValorMensalidade := 0;
  if (not Cds.IsEmpty) then begin
    Cds.First;

    while not Cds.Eof do begin
      TotalValorMensalidade := TotalValorMensalidade + Cds.FieldByName('VALORMENSALIDADE').AsFloat;
      Cds.Next;
    end;
  end
  else begin
    TotalValorMensalidade := 0;
  end;
  Result := TotalValorMensalidade;
end;

procedure TfrmCadRegIncentivo.DsMensalidadesAuxDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if CdsMensalidadesAux.FieldByName('IDMENSALIDADES').AsFloat > 0 then begin
    CdsMensalidades.Locate('IDMENSALIDADES', CdsMensalidadesAux.FieldByName('IDMENSALIDADES').AsFloat, [] );
  end
  else begin
    CdsMensalidades.Locate('NPARCELA', CdsMensalidadesAux.FieldByName('NPARCELA').AsInteger, [] );
  end;
end;

procedure TfrmCadRegIncentivo.CdsMensalidadesAuxAfterOpen(DataSet: TDataSet);
var
   c : byte;
begin
  inherited;

  TNumericField(CdsMensalidadesAux.FieldByName('VALORMENSALIDADE')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('VALOREMPRESA')).DisplayFormat     := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('VALOREMPREGADO')).DisplayFormat   := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('VALOREMPRESA_AT')).DisplayFormat  := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('METAATUARIAL')).DisplayFormat     := ',0.00;-,0.00';
  
{
  CdsMensalidadesAux.Fields[0].DisplayLabel := 'No. Parcela';
  CdsMensalidadesAux.Fields[1].DisplayLabel := 'Data Vencimento';
  CdsMensalidadesAux.Fields[2].DisplayLabel := 'Valor Mensalidade';
  CdsMensalidadesAux.Fields[3].DisplayLabel := 'Valor Empregado';
  CdsMensalidadesAux.Fields[4].DisplayLabel := 'Valor Empresa';
  CdsMensalidadesAux.Fields[5].DisplayLabel := 'Vlr. Empresa Atual';
  CdsMensalidadesAux.Fields[6].DisplayLabel := 'Atingiu Teto';

  TNumericField(CdsMensalidadesAux.FieldByName('VALORMENSALIDADE')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('VALOREMPRESA')).DisplayFormat     := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('VALOREMPREGADO')).DisplayFormat   := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('VALOREMPRESA_AT')).DisplayFormat  := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('METAATUARIAL')).DisplayFormat     := ',0.00;-,0.00';

  for c := CdsMensalidadesAux.fields.Count-1 downto 7 do
     grdDespesas.Fields[c].Visible := False;
}     
end;

Function TfrmCadRegIncentivo.VerificaPreenchimentoObrigatorio_Despesas : Boolean;
var
   sMesAno : string;
begin
  Result := True;

  if (CdsMensalidades.FieldByName('DTVENCIMENTOPARC').IsNull) or (CdsMensalidades.FieldByName('VALORMENSALIDADE').AsFloat < 1) then begin
    MsgDlg('Favor preencher Data Vencimento e Valor Mensalidade para inclusão do registro', 'Informação', mtInformation, [mbOk], 0);
    Result := False;
  end;

  sMesAno := FormatDateTime('YYYYMM', EdtDtVencimento.date);
  if (Result) and (CdsMensalidadesAux.Locate('MESANO', sMesAno, [])) then
  begin
    MsgDlg('Não é permitida a inclusão de uma mensalidade com o mesmo mês e ano já registrado.', 'Informação', mtInformation, [mbOk], 0);
    Result := False;
  end;

end;

procedure TfrmCadRegIncentivo.bbtnCancelarClick(Sender: TObject);
begin
  ModoEdicao := True;
  inherited;
end;

procedure TfrmCadRegIncentivo.ReorganizaQtd;
var
  qtd : Integer;
begin
  if not CdsMensalidades.IsEmpty then begin
    Qtd := CdsMensalidades.RecordCount;

    if CdsDet.State in [DsInsert, DsEdit] then begin
      CdsDet.FieldByName('QTDPARCELA').AsInteger := Qtd;
    end
    else begin
      CdsDet.Edit;
      CdsDet.FieldByName('QTDPARCELA').AsInteger := Qtd;
      CdsDet.Post;
    end;
  end;
end;

Function TfrmCadRegIncentivo.StrZero(Numero : String; Casas : Integer) : String;
var
  zeros : String;
Begin
  zeros := '00000000000000000000000000000000000000000';
  result := copy(zeros,1,casas) + numero;
  result := copy(result, length(result) - (casas - 1), casas);
end;

procedure TfrmCadRegIncentivo.CalcFimDaFidelidade;
var
  qry : TwwQuery;
  Dt  : TDate;

  Function AddMeses (Dia, AnoMes : String; QtdeMes : Integer) : TDate;
  var
    Mes, Ano, x : Integer;
    DtResult : String;
    DtTratada : TDate;
  begin
    AnoMes := FormatDateTime('yyyy/mm',StrToDate(AnoMes));

    Ano := StrToInt(Copy(AnoMes,1,4));
    Mes := StrToInt(Copy(AnoMes,6,2));

    for x := 1 to QtdeMes do begin
      if Mes = 12 then begin
        Mes := 1;
        Inc(Ano);
      end
      else begin
        Inc(Mes);
      end;  
    end;
    if (Mes = 2) or (StrToInt(Dia) > 30) then begin
      DtTratada := DiasUteis.UltDiaMes(Ano, Mes);
      Result := DtTratada;
      Exit;
{      LastDayOfMonth := EndOfTheMonth(StrToDate(DtResult));
      Result := LastDayOfMonth;}
    end;
    DtResult := Dia + '/' + StrZero(IntToStr(Mes), 2) + '/' + IntToStr(Ano);
    Result := StrToDate(DtResult);
  end;

begin
  qry := TwwQuery.Create(Self);
  qry.DataBaseName := 'BaseDados';

  try
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add('SELECT S.TEMPO, S.FLGFIDELIZA, S.SIGLA, S.IDSIGLACURSO ');
    qry.Sql.Add('  FROM CURSO C, SIGLACURSO S ');
    qry.Sql.Add(' WHERE C.IDSIGLACURSO = S.IDSIGLACURSO ');
    qry.Sql.Add('   AND C.IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').AsFloat));
    qry.Open;

    if not qry.IsEmpty then begin
      if (qry.FieldByName('FLGFIDELIZA').AsInteger = 1) then
      begin
        if (EdtDataEntrega.text <> '') and (qry.FieldByName('TEMPO').AsInteger > 0) and (CkbProjetoEntregue.Checked) then begin
          Dt := AddMeses(Copy(EdtDataEntrega.text,1,2), EdtDataEntrega.text, qry.FieldByName('TEMPO').AsInteger);//Higor Nayde Ferreira SOL 245977 PPM 635853
          DtpFimdaFidelidade.Date := Dt;
          if cdsDet.State in [dsEdit, dsInsert] then
             cdsDet.FieldByName('DATFID').AsDateTime := Dt;
        end;
        lblFimDaFidelidade.Visible := True;
        DtpFimdaFidelidade.Visible := True;
      end
      else begin
        DtpFimdaFidelidade.Clear;
        lblFimDaFidelidade.Visible := False;
        DtpFimdaFidelidade.Visible := False;
      end;
    end
    else begin
      DtpFimdaFidelidade.Clear;
      lblFimDaFidelidade.Visible := False;
      DtpFimdaFidelidade.Visible := False;       
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

procedure TfrmCadRegIncentivo.HabilitarParcialmente;
begin
  dbrgControle.Controls[2].Enabled := CtrlRegTrein.GetHabilitarParcialmente();
end;


function TfrmCadRegIncentivo.RetornaValorTotalEmpregado(
  Cds: TCmClientDataSet): Double;
var
  TotalValorEmpregado : Double;
begin
  TotalValorEmpregado := 0;

  if (not Cds.IsEmpty) then begin
    Cds.First;

    while not Cds.Eof do begin
      TotalValorEmpregado := TotalValorEmpregado + Cds.FieldByName('valorempregado').AsFloat;
      Cds.Next;
    end;
  end
  else begin
    TotalValorEmpregado := 0;
  end;

  Result := TotalValorEmpregado;
end;

function TfrmCadRegIncentivo.RetornaValorTotalEmpresa(
  Cds: TCMClientDataSet): Double;
var
  TotalValorEmpresa : Double;
begin
  TotalValorEmpresa := 0;
  if (not Cds.IsEmpty) then begin
    Cds.First;

    while not Cds.Eof do begin
      if (not Cds.FieldByName('valorempresa_at').IsNull) and (Cds.FieldByName('valorempresa_at').AsFloat > 0) then begin
        TotalValorEmpresa := TotalValorEmpresa + Cds.FieldByName('valorempresa_at').AsFloat;
      end
      else begin
        TotalValorEmpresa := TotalValorEmpresa + Cds.FieldByName('valorempresa').AsFloat;
      end;
      Cds.Next;
    end;
  end
  else begin
    TotalValorEmpresa := 0;
  end;

  Result := TotalValorEmpresa;
end;

procedure TfrmCadRegIncentivo.RetornaValorDevolverDtAtual;
var
  qry : TwwQuery;
  ValorEmpresa : Double;
  Tempo, MesesFaltantes : Integer;

  Procedure habilitarGrupoValor (Habilitar : Boolean);
  begin
    if Habilitar then begin
      lblValorDevolver.Visible      := True;
      EdtVlrDevolverDtAtual.Visible := True;
      btnAtualizarMeta.Visible      := True;
      grpVlrDevolver.Visible        := True;
    end else begin
      btnAtualizarMeta.Enabled      := False;
    end;
  end;

begin
  if (CdsDet.FieldByName('DATREFIM').IsNull) then
  begin
    if CkbProjetoEntregue.Visible then begin
      EdtVlrDevolverDtAtual.Value   := EdtValorEmpresa.Value;
      habilitarGrupoValor(True);
    end
    else begin
      EdtVlrDevolverDtAtual.Value   := 0;
      habilitarGrupoValor(False);
    end;
  end
  else
  begin
    //if (CkbProjetoEntregue.Visible) then begin
      if (not CdsDet.FieldByName('DATREFIM').IsNull) then begin
        qry := TwwQuery.Create(Self);
        qry.DataBaseName := 'BaseDados';

        try
          qry.Close;
          qry.Sql.Clear;
          qry.Sql.Add('SELECT S.FLGFIDELIZA, S.TEMPO');
          qry.Sql.Add( 'FROM CURSO C, SIGLACURSO S ');
          qry.Sql.Add('WHERE C.IDSIGLACURSO = S.IDSIGLACURSO ');
          qry.Sql.Add('  AND C.IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').AsFloat));
          qry.Open;

          if not qry.IsEmpty then begin
            if (DtpFimdaFidelidade.Date > Date) and (qry.FieldByName('flgfideliza').AsInteger = 1)  then begin
              if (EdtValorEmpresa.Value > 0) then begin
                ValorEmpresa   := EdtValorEmpresa.Value;
                Tempo          := qry.FieldByName('TEMPO').AsInteger;
                MesesFaltantes := DiasUteis.IntervaloMeses(Date, DtpFimdaFidelidade.Date);
                if Tempo > 0 then begin
                  try
                    EdtVlrDevolverDtAtual.Value := (ValorEmpresa / Tempo) * MesesFaltantes;
                  except
                    MsgDlg('Não foi possível realizar cálculo do campo valor a devolver na data atual', 'Informação', mtError, [mbok], 0);
                    EdtVlrDevolverDtAtual.Value := 0;
                    Exit;
                  end;
                  habilitarGrupoValor(True);
                end
                else begin
                  EdtVlrDevolverDtAtual.Value := 0;
                  //habilitarGrupoValor(False);
                end;
              end
              else begin
                EdtVlrDevolverDtAtual.Value   := 0;
                //habilitarGrupoValor(True);
              end;
            end
            else begin
              EdtVlrDevolverDtAtual.Value := 0;
              //habilitarGrupoValor(False);
            end;
          end
          else begin
            EdtVlrDevolverDtAtual.Value := 0;
            //habilitarGrupoValor(False);
          end;
        finally
          qry.Close;
          FreeAndNil(qry);
        end;
      end
    //end
    else begin
      EdtVlrDevolverDtAtual.Value := 0;
      habilitarGrupoValor(False);
    end;
  end;
end;

procedure TfrmCadRegIncentivo.ProporcionalizacaoValores;
var
  PartEmpregado, PartEmpresa : SmallInt;
begin
  if dbrgControle.ItemIndex = 0 then begin
    // Sim
    lblPartEmpresa.Visible      := True;
    EdtvlrPartEmpresa.Visible   := True;

    EdtVlrPartEmpregado.Visible := False;
    lblPartEmpregado.Visible    := False;

    EdtvlrPartEmpresa.Enabled   := False;
    EdtVlrPartEmpregado.Enabled := False;

    PartEmpresa   := 100;
    PartEmpregado := 0;


    if ((CdsDet.State = dsInsert) and (CdsMensalidades.IsEmpty)) then begin
      // No caso de inclusões, o "por conta da empresa" deve vir preenchido como 100% - (parte empresa)
      cdsDet.FieldByName('FLGCONTROLE').AsInteger := 0;

      ModoEdicao := True;
      EdtvlrPartEmpresa.Text   := IntToStr(PartEmpresa);
      EdtvlrPartEmpregado.Text := IntToStr(PartEmpregado);
    end
    else begin
      EdtvlrPartEmpresa.Text   := IntToStr(PartEmpresa);
      EdtvlrPartEmpregado.Text := IntToStr(PartEmpregado);

    end;

    if CdsMensalidades.IsEmpty then begin
      Exit;
    end;
  end
  else begin
    // Não
    if dbrgControle.ItemIndex = 1 then begin
      lblPartEmpresa.Visible      := False;
      EdtvlrPartEmpresa.Visible   := False;

      EdtVlrPartEmpregado.Visible := True;
      lblPartEmpregado.Visible    := True;

      EdtvlrPartEmpresa.Enabled   := False;
      EdtVlrPartEmpregado.Enabled := False;

      PartEmpresa   := 0;
      PartEmpregado := 100;

      EdtvlrPartEmpregado.Text := IntToStr(PartEmpregado);
      EdtvlrPartEmpresa.Text   := IntToStr(PartEmpresa);

      if CdsMensalidades.IsEmpty then begin
        Exit;
      end;
    end
    else begin
      // Parcialmente
      lblPartEmpresa.Visible      := True;
      EdtvlrPartEmpresa.Visible   := True;

      EdtVlrPartEmpregado.Visible := True;
      lblPartEmpregado.Visible    := True;

      EdtvlrPartEmpresa.Enabled   := True;
      EdtVlrPartEmpregado.Enabled := True;

      Exit;

      if CdsMensalidades.IsEmpty then begin
        Exit;
      end;
    end;
  end;
end;

procedure TfrmCadRegIncentivo.ProporcionalizacaoValores_Parcialmente(PartEmpresa, PartEmpregado : SmallInt; Cds : TCmClientDataSet);
var
  ValorEmpresa, ValorEmpregado : Double;

  vlrMensalidade : Double;
  DtVencimento   : TDateTime;
begin
  ModoEdicao := True;
  vlrMensalidade := 0;

  if Cds.RecordCount = 0 then begin
    if (not Cds.FieldByName('VALORMENSALIDADE').IsNull) then begin
      vlrMensalidade := Cds.FieldByName('VALORMENSALIDADE').AsFloat;
    end;

    if (not Cds.FieldByName('DTVENCIMENTOPARC').IsNull) then begin
      DtVencimento   := Cds.FieldByName('DTVENCIMENTOPARC').AsDateTime;
    end;

    Cds.Insert;
    ValorEmpresa   := (vlrMensalidade * PartEmpresa / 100);
    ValorEmpregado := (vlrMensalidade * PartEmpregado / 100);

    Cds.FieldByName('IDPESSOA').AsFloat        := idPessoa;
    Cds.FieldByName('IDCURSO').AsFloat         := CdsDet.FieldByName('idcurso').asFloat;
    Cds.FieldByName('NUMSEQ').AsFloat          := CdsDet.FieldByName('numseq').asFloat;

    Cds.FieldByName('VALOREMPRESA').AsFloat    := ValorEmpresa;
    Cds.FieldByName('VALOREMPREGADO').AsFloat  := ValorEmpregado;

    if vlrMensalidade > 0 then begin
      Cds.FieldByName('VALORMENSALIDADE').AsFloat := vlrMensalidade;
    end;

    if DtVencimento > 0 then begin
      Cds.FieldByName('DTVENCIMENTOPARC').AsDateTime := DtVencimento;
    end;

    Cds.Post;
  end
  else begin
    Cds.First;

    while not Cds.Eof do begin
      try
        vlrMensalidade := Cds.FieldByName('VALORMENSALIDADE').AsFloat;   
        Cds.Edit;
        ValorEmpresa   := (Cds.FieldByName('VALORMENSALIDADE').AsFloat * PartEmpresa / 100);
        ValorEmpregado := (Cds.FieldByName('VALORMENSALIDADE').AsFloat * PartEmpregado / 100);

        Cds.FieldByName('IDPESSOA').AsFloat        := idPessoa;
        Cds.FieldByName('IDCURSO').AsFloat         := CdsDet.FieldByName('idcurso').asFloat;
        Cds.FieldByName('NUMSEQ').AsFloat          := CdsDet.FieldByName('numseq').asFloat;

        Cds.FieldByName('VALOREMPRESA').AsFloat   := ValorEmpresa;
        Cds.FieldByName('VALOREMPREGADO').AsFloat := ValorEmpregado;

        Cds.Post;
      except
        MsgDlg('Ocorreram erros no processo de proporcionalização de valores', 'Informação', mtError, [mbOk], 0);
      end;
      Cds.Next;
    end;
  end;

  if CdsDet.State in [dsInsert, dsEdit] then begin
    CdsDet.FieldByName('PARTEMPRESA').AsInteger   := PartEmpresa;
    CdsDet.FieldByName('PARTEMPREGADO').AsInteger := PartEmpregado;
  end
  else begin
    CdsDet.Edit;
    CdsDet.FieldByName('PARTEMPRESA').AsInteger   := PartEmpresa;
    CdsDet.FieldByName('PARTEMPREGADO').AsInteger := PartEmpregado;
    CdsDet.Post;
  end;

  CdsMensalidades.Data    := Cds.Data;
  if not CdsMensalidadesAux.IsEmpty then begin
    CdsMensalidadesAux.Data := CdsMensalidades.Data;
  end;
  CdsMensalidades.Edit;
end;

procedure TfrmCadRegIncentivo.btnDespOkClick(Sender: TObject);
begin
  inherited;
  if dbrgControle.ItemIndex = -1 then begin
    Exit;
  end;
  
  if not VerificaPreenchimentoObrigatorio_Despesas then begin
    Exit;
  end
  else begin
    InsereAux (EdtDtVencimento.DateTime, EdtVlrMensalidade.Value);
    EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidades);
    EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
    EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
    RetornaValorDevolverDtAtual;
  end;

  EdtVlrMensalidade.SetFocus;
end;


procedure TfrmCadRegIncentivo.AjustaParcelas;
var
  x : Integer;
begin
  x := 0;

  while not CdsMensalidades.Eof do begin
    Inc(x);

    CdsMensalidades.Edit;
    CdsMensalidades.FieldByName('NPARCELA').AsInteger := x;
    CdsMensalidades.Post;

    CdsMensalidades.Next;
  end;

  CdsMensalidadesAux.Data := CdsMensalidades.Data;
  ReorganizaQtd;
  EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
  EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
  EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);
  RetornaValorDevolverDtAtual;
end;


procedure TfrmCadRegIncentivo.btnDespCancelClick(Sender: TObject);
var
  x : Integer;
begin
  inherited;
  if not CdsMensalidadesAux.IsEmpty then begin
    if (MsgDlg('Deseja excluir mensalidade (Parcela Nº ' + CdsMensalidadesAux.FieldByName('nparcela').AsString + ') ?' ,
        'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin

      CdsMensalidades.Delete;
      CdsMensalidades.First;

      AjustaParcelas();
    end;
  end;
end;

procedure TfrmCadRegIncentivo.InsereAux (DtVencimento : TDateTime; ValorMensalidade : Double);
begin
  try
    // Inserindo no arquivo auxiliar (Grid)
    CdsMensalidadesAux.Insert;
    CdsMensalidadesAux.FieldByName('IDPESSOA').AsFloat              := idPessoa;
    CdsMensalidadesAux.FieldByName('IDCURSO').AsFloat               := CdsDet.FieldByName('idcurso').asFloat;
    CdsMensalidadesAux.FieldByName('QTDPARCPREV').AsInteger         := CdsMensalidades.FieldByName('QTDPARCPREV').AsInteger;
    if (CdsMensalidades.IsEmpty) and (CdsDet.FieldByName('NUMSEQ').AsInteger > 0) then begin

      CdsMensalidadesAux.FieldByName('NUMSEQ').AsInteger            := CdsDet.FieldByName('NUMSEQ').AsInteger;
      CdsMensalidadesAux.FieldByName('DTVENCIMENTOPARC').AsDateTime := DtVencimento;
      CdsMensalidadesAux.FieldByName('VALORMENSALIDADE').AsFloat    := ValorMensalidade;

      CdsMensalidadesAux.FieldByName('VALOREMPRESA').AsFloat        := (ValorMensalidade * StrToIntDef(EdtvlrPartEmpresa.Text,0) / 100);
      CdsMensalidadesAux.FieldByName('VALOREMPREGADO').AsFloat      := (ValorMensalidade * StrToIntDef(EdtVlrPartEmpregado.Text,0) / 100);
    end
    else begin
      CdsMensalidadesAux.FieldByName('NUMSEQ').AsInteger            := CdsMensalidades.FieldByName('NUMSEQ').AsInteger;
      CdsMensalidadesAux.FieldByName('DTVENCIMENTOPARC').AsDateTime := DtVencimento;
      CdsMensalidadesAux.FieldByName('VALORMENSALIDADE').AsFloat    := ValorMensalidade;

      CdsMensalidadesAux.FieldByName('VALOREMPRESA').AsFloat        := (ValorMensalidade * StrToIntDef(EdtvlrPartEmpresa.Text,0) / 100);
      CdsMensalidadesAux.FieldByName('VALOREMPREGADO').AsFloat      := (ValorMensalidade * StrToIntDef(EdtVlrPartEmpregado.Text,0) / 100);

    end;
    CdsMensalidadesAux.FieldByName('NPARCELA').AsInteger       := CdsMensalidades.FieldByName('NPARCELA').AsInteger;

    CdsMensalidadesAux.FieldByName('IDTURMA').AsInteger       := cdsTurma.FieldByName('IDTURMA').AsInteger;
    CdsMensalidadesAux.FieldByName('MESANO').AsString         := FormatDateTime('YYYYMM', DtVencimento);
    CdsMensalidadesAux.FieldByName('PERCEMPRESA').AsInteger   := StrToIntDef(EdtvlrPartEmpresa.Text,0);
    CdsMensalidadesAux.FieldByName('PERCEMPREGADO').AsInteger := StrToIntDef(EdtVlrPartEmpregado.Text,0);

    if (dbrgControle.ItemIndex = 2) and (cdsTurma.FieldByName('VALORTETO').AsCurrency > 0) and (CdsMensalidadesAux.FieldByName('VALOREMPRESA').AsCurrency > cdsTurma.FieldByName('VALORTETO').AsCurrency) then
    begin
      CdsMensalidadesAux.FieldByName('FLGATINGIUMETA').AsString   := 'Sim';
      CdsMensalidadesAux.FieldByName('FLGTETO').AsString          := 'S';
      CdsMensalidadesAux.FieldByName('VALOREMPRESA').AsCurrency   := cdsTurma.FieldByName('VALORTETO').AsCurrency;
      CdsMensalidadesAux.FieldByName('VALOREMPREGADO').AsCurrency := ValorMensalidade - cdsTurma.FieldByName('VALORTETO').AsCurrency;
    end
    else
    begin
      CdsMensalidadesAux.FieldByName('FLGATINGIUMETA').AsString   := '';
      CdsMensalidadesAux.FieldByName('FLGTETO').AsString          := 'N';
    end;
    CdsMensalidadesAux.FieldByName('FLGNOVO').AsString := 'S';  // marca registro para apagar, se clicar no cancelar

    CdsMensalidadesAux.Post;
    CdsMensalidades.Data := CdsMensalidadesAux.Data;
  except
    MsgDlg('Não foi possível realizar inclusão', 'Inclusão', mtError, [mbok], 0);
    Exit;
  end;

  try
    ReorganizaNParcela;
  except
    MsgDlg('Não foi possível organizar número de parcelas', 'Inclusão', mtError, [mbok], 0);
    Exit;
  end;
end;

procedure TfrmCadRegIncentivo.ReorganizaNParcela;
var
  Incrementa : Integer;
begin
  if not CdsMensalidades.IsEmpty then begin
    if CdsMensalidades.State in [dsInsert, dsEdit] then begin
      CdsMensalidades.Post;
    end;

    ModoEdicao := True;
    CdsMensalidades.Filtered := False;
    CdsMensalidades.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
    CdsMensalidades.IndexFieldNames := 'DTVENCIMENTOPARC';
    CdsMensalidades.Filtered := True;
    ModoEdicao := False;

    CdsMensalidades.First;
    Incrementa := 0;

    while not CdsMensalidades.Eof do begin
      Inc(Incrementa);

      CdsMensalidades.Edit;
      CdsMensalidades.FieldByName('NPARCELA').AsInteger   := Incrementa;
      CdsMensalidades.Post;

      CdsMensalidades.Next;
    end;

    if CdsDet.State in [DsInsert, dsEdit] then begin
      CdsDet.FieldByName('QTDPARCELA').AsInteger := CdsMensalidades.RecordCount;
    end
    else begin
      CdsDet.Edit;
      CdsDet.FieldByName('QTDPARCELA').AsInteger := CdsMensalidades.RecordCount;
      CdsDet.Post;
    end;

    CdsMensalidadesAux.Data := CdsMensalidades.Data;
  end;
end;

procedure TfrmCadRegIncentivo.EdtvlrPartEmpresaExit(Sender: TObject);
var
  iEmpresa, iEmpreg : integer;
begin
  inherited;
  iEmpresa := StrToIntDef(EdtvlrPartEmpresa.Text, 0);
  iEmpreg  := StrToIntDef(EdtVlrPartEmpregado.Text, 0);

  if (not CdsDet.FieldByName('partempresa').IsNull) then
  begin
    if (iEmpresa < 0) or (iEmpresa > 100) or (iEmpresa + iEmpreg > 100) then
    begin
      MsgDlg('Favor preencher um valor entre 0 e 100', 'Informação', mtError, [mbok], 0);
      EdtvlrPartEmpresa.Text := IntToStr(UltVlrValidoEmpresa);
      EdtvlrPartEmpresa.setFocus;
      ModoEdicao := False;
    end;
  end;
end;

procedure TfrmCadRegIncentivo.EdtVlrPartEmpregadoExit(Sender: TObject);
var
  iEmpresa, iEmpreg : integer;
begin
  inherited;
  iEmpresa := StrToIntDef(EdtvlrPartEmpresa.Text, 0);
  iEmpreg  := StrToIntDef(EdtVlrPartEmpregado.Text, 0);

  if (not CdsDet.FieldByName('partempregado').IsNull) then
  begin
    if (iEmpreg < 0) or (iEmpreg > 100) or (iEmpresa + iEmpreg > 100) then
    begin
      MsgDlg('Favor preencher um valor entre 0 e 100', 'Informação', mtError, [mbok], 0);

      EdtvlrPartEmpregado.Text := IntToStr(UltVlrValidoEmpregado);
      EdtVlrPartEmpregado.setfocus;

//      EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
//      EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);

      ModoEdicao := False;
    end;
  end;
end;

procedure TfrmCadRegIncentivo.EdtvlrPartEmpresaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if {(not ModoEdicao ) and} (Key in ['0'..'9', #8]) then
  begin
    if key <> #8 then
    begin
      if (StrToIntDef(EdtVlrPartEmpresa.Text,0) > -1) and (StrToIntDef(EdtVlrPartEmpresa.Text,0) < 101) then
         UltVlrValidoEmpresa := StrToIntDef(EdtVlrPartEmpresa.Text,0);
    end;
  end
  else
    Key := #0;
end;

procedure TfrmCadRegIncentivo.EdtVlrPartEmpregadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if {(not ModoEdicao ) and }(Key in ['0'..'9', #8]) then
  begin
    if key <> #8 then
    begin
      if (StrToIntDef(EdtVlrPartEmpregado.Text,0) > -1) and (StrToIntDef(EdtVlrPartEmpregado.Text,0) < 101) then   
         UltVlrValidoEmpregado := StrToIntDef(EdtVlrPartEmpregado.Text,0);
    end;
  end
  else
    Key := #0;


  {
  if not ModoEdicao then begin
    try
      StrToInt(EdtVlrPartEmpregado.Text);
    except
      Exit;
    end;

    if (StrToInt(EdtVlrPartEmpregado.Text) > -1) and (StrToInt(EdtVlrPartEmpregado.Text) < 101) then begin
      UltVlrValidoEmpregado := StrToInt(EdtVlrPartEmpregado.Text);
    end;
  end;
  }
end;

procedure TfrmCadRegIncentivo.btnAtualizarMetaClick(Sender: TObject);
var
  tela : TfrmRegTreinMetaAtuarial;
begin
  if (not CdsMensalidades.FieldByName('VALOREMPRESA_AT').IsNull) then begin
    if (MsgDlg('Já existe existe atualização do Valor a Devolver na Data Atual.' + CR_LF +
               'Deseja recalcular ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then //Higor Nayde Ferreira SOL 245977 PPM 635853
    begin
      Exit;
    end;
  end;

  tela := TfrmRegTreinMetaAtuarial.Create(Self);

  try
    tela.ShowModal;
    if tela.Result = MB_OK then begin
      CalcMetaAtuarial(tela.MAtuarial);
    end;
  finally
    tela.Release;
  end;
end;

function TfrmCadRegIncentivo.CalcMetaAtuarial (FatorMetaAtuarial : Double) : Boolean;
var
  ValorEmpresaAT,
  CalcINPC, INPC, FatorINPC,
  Juros, JurosComposto, DiasDoAnoCorrente,
  DiasAnoAnteriores, resultCalcAnos : Double;

  CotacaoINPC : array of Double;

  DiasAnoCorrente, QtdTotalDiasAnoCorrente,
  QtdeTotalDeDiasDosAnosAnteriores, DiasDoAnoAnterior,
  Periodo, x, i, y, t: Integer;

  dtEncerra   : TDateTime;   
  dtFinalINPC : TDateTime;

  wAnoF, wMesF, wDiaF,
  AnoVcto, MesVcto, DiaVcto :Word;

  qryCotacao : TwwQuery;
  BookMark : TBookmark;

  Function DecMeses (Dia, AnoMes : String; QtdeMes : Integer) : TDateTime;
  var
    Mes, Ano, x : Integer;
    DtResult : String;
    DtTratada : TDate;
  begin
    AnoMes := FormatDateTime('yyyy/mm',StrToDate(AnoMes));

    Ano := StrToInt(Copy(AnoMes,1,4));
    Mes := StrToInt(Copy(AnoMes,6,2));

    for x := 1 to QtdeMes do begin
      if Mes = 1 then begin
        Mes := 12;
        Dec(Ano);
      end
      else begin
        Dec(Mes);
      end;  
    end;
    if (Mes = 2) or (StrToInt(Dia) > 30) then begin
      DtTratada := DiasUteis.UltDiaMes(Ano, Mes);
      Result := DtTratada;
      Exit;
    end;
    DtResult := Dia + '/' + StrZero(IntToStr(Mes), 2) + '/' + IntToStr(Ano);
    Result := StrToDate(DtResult);
  end;

begin
  dtEncerra := EdtDataDeslig.date;

  DecodeDate(dtEncerra ,wAnoF,wMesF,wDiaF);
  BookMark := CdsMensalidadesAux.GetBookMark;
  CdsMensalidades.First;

  while not CdsMensalidades.Eof do begin
    ValorEmpresaAT := 0;
    CalcINPC := 0;
    INPC := 0;
    FatorINPC := 0;
    Juros := 0;
    JurosComposto := 0;
    DiasDoAnoCorrente := 0;
    DiasAnoAnteriores := 0;
    resultCalcAnos := 0;

    CotacaoINPC := nil;

    DiasAnoCorrente := 0;
    QtdTotalDiasAnoCorrente := 0;
    QtdeTotalDeDiasDosAnosAnteriores := 0;
    DiasDoAnoAnterior := 0;
    Periodo := 0;
    x := 0;
    i := 0;
    y := 0;
    t := 0;

    CotacaoINPC := Nil;
    DecodeDate(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime ,AnoVcto, MesVcto, DiaVcto);

    if CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime > dtEncerra then begin
      Periodo := DiasUteis.IntervaloMeses( dtEncerra, CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime);

      if Periodo > 0 then begin

        dtFinalINPC := DecMeses(Copy(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsString,1,2), CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsString, 1);
        if dtFinalINPC > CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime then begin
          Periodo := DiasUteis.IntervaloMeses(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime, dtFinalINPC);
        end
        else begin
          Periodo := DiasUteis.IntervaloMeses(dtFinalINPC, CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime);
        end;

        if Periodo > 0 then begin
          qryCotacao := TwwQuery.Create(Self);
          qryCotacao.DataBaseName := 'BaseDados';

          try
            with qryCotacao do begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT cotvalor ');
              Sql.Add('  FROM cotacaomoeda');
              Sql.Add(' WHERE moecodigo = 7');
              Sql.Add('   AND cotdata >= TO_DATE(' + Chr(39) + '01/' + FormatDateTime('mm/yyyy', dtEncerra) + Chr(39) + ', ' + Chr(39) + 'dd/mm/yyyy' + Chr(39) + ')');  // Edilaine - SOL 137268-7062 / KTN 1497173
              Sql.Add('   AND cotdata <= TO_DATE(' + Chr(39) + '01/' + FormatDateTime('mm/yyyy',CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime) + Chr(39) + ', ' + Chr(39) + 'dd/mm/yyyy' + Chr(39) + ')');
              Open;
            end;

            if not qryCotacao.IsEmpty then begin
              x := 0;

              y := qryCotacao.RecordCount;
              SetLength(CotacaoINPC, y);

              while not qryCotacao.Eof do begin
                CotacaoINPC[x] := qryCotacao.FieldByName('cotvalor').AsFloat;

                Inc(x);
                qryCotacao.Next;
              end;

              {se faltou cotação, repete a última}
              if  Periodo > x then
              begin
                for y := x to Periodo do
                begin
                  SetLength(CotacaoINPC, high(CotacaoINPC)+2);
                  CotacaoINPC[high(CotacaoINPC)] :=  CotacaoINPC[x-1];
                end;
              end;

            end;
          finally
            qryCotacao.Close;
            FreeAndNil(qryCotacao);
          end;
        end;
      end;
    end
    else begin
      // Data do Dia maior que a data do vencimento da parcela ?
      Periodo := DiasUteis.IntervaloMeses(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime, dtEncerra);

      if Periodo > 0 then begin

        // Retirando um mes da data atual (é necessário desconsiderar o mês atual)
        dtFinalINPC := DecMeses(StrZero(IntToStr(wDiaF), 2), DateToStr(dtEncerra), 1);

        // Verificando se a nova data (depois de retirado um mês) é maior que a data do vencimento da parcela
        if dtFinalINPC > CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime then begin
          Periodo := DiasUteis.IntervaloMeses(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime, dtFinalINPC);
        end
        else begin
          Periodo := DiasUteis.IntervaloMeses(dtFinalINPC, CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime);
        end;

        if Periodo > 0 then begin

          qryCotacao := TwwQuery.Create(Self);
          qryCotacao.DataBaseName := 'BaseDados';

          try
            with qryCotacao do begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT cotvalor ');
              Sql.Add('  FROM cotacaomoeda');
              Sql.Add(' WHERE moecodigo = 7');
              Sql.Add('   AND cotdata >= TO_DATE(' + Chr(39) + '01/' + FormatDateTime('mm/yyyy',CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime) + Chr(39) + ', ' + Chr(39) + 'dd/mm/yyyy' + Chr(39) + ')');
              Sql.Add('   AND cotdata <= TO_DATE(' + Chr(39) + '01/' + FormatDateTime('mm/yyyy',dtFinalINPC) + Chr(39) + ', ' + Chr(39) + 'dd/mm/yyyy' + Chr(39) + ')');
              Open;
            end;

            if not qryCotacao.IsEmpty then begin
              x := 0;

              y := qryCotacao.RecordCount;
              SetLength(CotacaoINPC, y);

              while not qryCotacao.Eof do begin
                CotacaoINPC[x] := qryCotacao.FieldByName('cotvalor').AsFloat;

                Inc(x);
                qryCotacao.Next;
              end;

              {se faltou cotação, repete a última}
              if  Periodo > x then
              begin
                for y := x to (Periodo-x) do
                begin
                  SetLength(CotacaoINPC, high(CotacaoINPC)+2);
                  CotacaoINPC[high(CotacaoINPC)] :=  CotacaoINPC[x-1];
                end;
              end;

            end;
          finally
            qryCotacao.Close;
            FreeAndNil(qryCotacao);
          end;
        end;
      end;
    end;

    try
      // INPC (Calc)
      for i := Low(CotacaoINPC) to High(CotacaoINPC) do begin
        CalcINPC := StrToFloat(FormatFloat('#,##0.0000', CotacaoINPC[i]));
        INPC := INPC + (CalcINPC / 100);
      end;
      INPC := (1 + (INPC));
      FatorINPC := CdsMensalidades.FieldByName('valorempresa').AsFloat * INPC;

      //Juros (Calc)
      DiasAnoCorrente := DiasUteis.IntervaloDias(StrToDate('01/01/' + IntToStr(wAnoF)), dtEncerra);
      if DiasUteis.AnoBissexto(wAnoF) then begin
        QtdTotalDiasAnoCorrente := 366;
      end
      else begin
        QtdTotalDiasAnoCorrente := 365;
      end;

      DiasDoAnoCorrente := DiasAnoCorrente / QtdTotalDiasAnoCorrente;
      DiasDoAnoCorrente := FU.Arredondar(DiasDoAnoCorrente, 4);    // Truncar(DiasDoAnoCorrente, 4);

      if CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime > StrToDate('01/01/' + IntToStr(wAnoF)) then begin
        DiasDoAnoAnterior := DiasUteis.IntervaloDias(StrToDate('01/01/' + IntToStr(wAnoF)), CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime);
      end
      else begin
        DiasDoAnoAnterior := DiasUteis.IntervaloDias(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime, StrToDate('01/01/' + IntToStr(wAnoF)));
      end;

      if DiasUteis.AnoBissexto(AnoVcto) then begin
        QtdeTotalDeDiasDosAnosAnteriores := 366;
      end
      else begin
        QtdeTotalDeDiasDosAnosAnteriores := 365;
      end;
      DiasAnoAnteriores := DiasAnoAnteriores + (DiasDoAnoAnterior / QtdeTotalDeDiasDosAnosAnteriores);
      DiasAnoAnteriores := FU.Arredondar(DiasAnoAnteriores, 4);     //  Truncar(DiasAnoAnteriores, 4);

      resultCalcAnos := DiasDoAnoCorrente + DiasAnoAnteriores;

      JurosComposto := (1+ FatorMetaAtuarial/100);
      JurosComposto := Power(JurosComposto, resultCalcAnos) - 1;
      JurosComposto := FU.Arredondar(JurosComposto, 4);                  // Truncar(JurosComposto, 4);

      Juros := FatorINPC * JurosComposto;
      Juros := FU.Arredondar(Juros, 4);             // Truncar(Juros, 4);

      // Valor Empresa Atualizado
      ValorEmpresaAT := FU.Arredondar((FatorINPC + Juros),2);
    except
      Result := False;
      Exit;
    end;

    try
      if not (CdsMensalidades.State in [DsEdit, DsInsert]) then begin
        CdsMensalidades.Edit;
      end;
      CdsMensalidades.FieldByName('VALOREMPRESA_AT').AsFloat := StrToFloat(FormatFloat('#########0.00', ValorEmpresaAT));
      CdsMensalidades.FieldByName('DTATUALIZACAO').AsString  := DateToStr( dtEncerra);
      CdsMensalidades.FieldByName('METAATUARIAL').AsFloat    := FatorMetaAtuarial;

      CdsMensalidades.Post;
    except
      Result := False;
      Exit;
    end;
    if CdsDet.FieldByName('OP_INICIAL').asString = 'E' then
       cdsTurma.Data := CtrlTurma.ListaDadosTurma( cdsDet.FieldByName('IDTURMA').AsString, cdsDet.FieldByName('IDPESSOA').AsInteger, true )
    else
       cdsTurma.Data := CtrlTurma.ListaDadosTurma( cdsDet.FieldByName('IDTURMA').AsString );

    try
      CdsMensalidades.Edit;
      if (cdsTurma.FieldByName('VALORTETO').AsCurrency > 0) and
       (CdsMensalidades.FieldByName('VALOREMPRESA_AT').AsCurrency > cdsTurma.FieldByName('VALORTETO').AsCurrency) then
      begin
        CdsMensalidades.FieldByName('FLGATINGIUMETA').AsString   := 'Sim';
        CdsMensalidades.FieldByName('FLGTETO').AsString          := 'S'
      end else  begin
        CdsMensalidades.FieldByName('FLGATINGIUMETA').AsString   := 'Não';
        CdsMensalidades.FieldByName('FLGTETO').AsString          := 'N';
      end;
      CdsMensalidades.Post;
    except
      Result := False;
      Exit;
    end;
    {try
      CdsMensalidadesAux.Edit;
      if (cdsTurma.FieldByName('VALORTETO').AsCurrency > 0) and
       (CdsMensalidadesAux.FieldByName('VALOREMPRESA_AT').AsCurrency > cdsTurma.FieldByName('VALORTETO').AsCurrency) then
      begin
        CdsMensalidadesAux.FieldByName('FLGATINGIUMETA').AsString   := 'Sim';
        CdsMensalidadesAux.FieldByName('FLGTETO').AsString          := 'S'
      end else  begin
        CdsMensalidadesAux.FieldByName('FLGATINGIUMETA').AsString   := 'Não';
        CdsMensalidadesAux.FieldByName('FLGTETO').AsString          := 'N';
      end;
      CdsMensalidadesAux.Post;
    except
      Result := False;
      Exit;
    end;
    }
    CdsMensalidades.Next;                                                              
  end;
  CdsMensalidadesAux.Data := CdsMensalidades.Data;

  CdsMensalidadesAux.GotoBookMark(BookMark);
  CdsMensalidadesAux.FreeBookMark(BookMark);

  EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidades);
  RetornaValorDevolverDtAtual;
  Result := True;
end;

procedure TfrmCadRegIncentivo.CarregaProjFinal;
var
  qry : TwwQuery;
begin
  qry := TwwQuery.Create(Self);
  qry.DataBaseName := 'BaseDados';

  try
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add('SELECT S.flgprojfinal');
    qry.Sql.Add( 'FROM CURSO C, SIGLACURSO S ');
    qry.Sql.Add('WHERE C.IDSIGLACURSO = S.IDSIGLACURSO ');
    qry.Sql.Add('  AND C.IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').AsFloat));
    qry.Open;

    if not qry.IsEmpty then begin
      if qry.FieldByName('flgprojfinal').AsInteger = 1 then begin
        CkbProjetoEntregue.Visible := True;
        CkbProjetoEntregue.Checked := True;
      end
      else begin
        CkbProjetoEntregue.Visible := False;
        CkbProjetoEntregue.Checked := False;
      end;
    end
    else begin
      CkbProjetoEntregue.Visible := False;
      CkbProjetoEntregue.Checked := False;
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

procedure TfrmCadRegIncentivo.dbrgControleClick(Sender: TObject);
begin
  inherited;
  ModoEdicao := False;

  ProporcionalizacaoValores;
  if not CdsMensalidadesAux.IsEmpty then begin
    EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
    EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);
  end;
end;

procedure TfrmCadRegIncentivo.ReorganizaNumSeq;
begin
  if not CdsMensalidades.IsEmpty then begin
    if CdsMensalidades.State in [dsInsert, dsEdit] then begin
      CdsMensalidades.Post;
    end;

    ModoEdicao := True;
    CdsMensalidades.First;
    ModoEdicao := False;

    while not CdsMensalidades.Eof do begin
      CdsMensalidades.Edit;
      CdsMensalidades.FieldByName('NUMSEQ').AsFloat := CdsDet.FieldByName('NUMSEQ').AsFloat;
      CdsMensalidades.Post;
    end;

    ModoEdicao := True;
    CdsMensalidades.Filtered := False;
    ModoEdicao := False;
  end;

  CdsMensalidadesAux.Data := CdsMensalidades.Data;

end;

procedure TfrmCadRegIncentivo.CkbProjetoEntregueClick(Sender: TObject);
begin
  inherited;
  if CkbProjetoEntregue.Checked then begin
    EdtDataEntrega.Visible     := True;
    lblDataEntrega.Visible     := True;
    RetornaValorDevolverDtAtual;
    CalcFimDaFidelidade;
  end
  else begin
    EdtDataEntrega.Clear;   

    EdtDataEntrega.Visible     := False;
    lblDataEntrega.Visible     := False;   
    RetornaValorDevolverDtAtual;
    CalcFimDaFidelidade;
  end;
end;

procedure TfrmCadRegIncentivo.EdtDataEntregaExit(Sender: TObject);
begin
  inherited;
  CalcFimDaFidelidade;
  RetornaValorDevolverDtAtual;
  if CdsDet.State in [DsInsert, DsEdit] then begin
    if CdsMensalidades.FieldByName('METAATUARIAL').AsFloat > 0 then begin
      CalcMetaAtuarial (CdsMensalidades.FieldByName('METAATUARIAL').AsFloat);
    end;
  end;
end;

procedure TfrmCadRegIncentivo.proporcionalizaEmp(PartEmpresa,
  PartEmpregado: SmallInt);
begin
  if CdsDet.State in [dsInsert, dsEdit] then begin
    CdsDet.FieldByName('PARTEMPRESA').AsInteger   := PartEmpresa;
    CdsDet.FieldByName('PARTEMPREGADO').AsInteger := PartEmpregado;
  end
  else begin
    CdsDet.Edit;
    CdsDet.FieldByName('PARTEMPRESA').AsInteger   := PartEmpresa;
    CdsDet.FieldByName('PARTEMPREGADO').AsInteger := PartEmpregado;
    CdsDet.Post;
  end;
end;

procedure TfrmCadRegIncentivo.CmeDetalheCancel(Sender: TObject);
begin
  CdsTurma.Close;   
  inherited;
end;

procedure TfrmCadRegIncentivo.ckbDesligaClick(Sender: TObject);
begin
  inherited;
  if ckbDesliga.Checked then begin
    EdtDataDeslig.Visible   := True;
    lblDataDesliga.Visible  := True;
    RetornaValorDevolverDtAtual;
    CalcFimDaFidelidade;
  end
  else begin
    EdtDataDeslig.Clear;   

    EdtDataDeslig.Visible   := False;
    lblDataDesliga.Visible  := False;
    RetornaValorDevolverDtAtual;
    CalcFimDaFidelidade;
  end;

end;

procedure TfrmCadRegIncentivo.EdtDataDesligExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State in [DsInsert, DsEdit] then
    if not CdsDet.FieldByName('DTDESLPROG').isNull then
       btnAtualizarMeta.enabled := true
    else
       btnAtualizarMeta.enabled := false;

end;

procedure TfrmCadRegIncentivo.PreencheListaTurma;
begin
  {preenche lista de turmas da pessoa}
  ListaTurmaPessoa.clear;

  CdsDet.DisableControls;
  while not cdsdet.eof do
  begin
    ListaTurmaPessoa.Add( CdsDet.FieldByName('IDTURMA').asString );
    cdsDet.next;
  end;
  cdsDet.First;
  CdsDet.EnableControls;
end;

procedure TfrmCadRegIncentivo.EdtvlrPartEmpresaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (not ModoEdicao) and (EdtVlrMensalidade.Value > 0) then
  begin
    EdtvlrPartEmpregado.text := IntToStr(100 - StrToIntDef(EdtVlrPartEmpresa.Text,0));
    EdtvlrPartEmpresa.SelStart := Length(EdtvlrPartEmpresa.Text);
  end
  else
  begin
    proporcionalizaEmp(StrToIntDef(EdtVlrPartEmpresa.Text,0), (100 - StrToIntDef(EdtVlrPartEmpresa.Text,0)));
  end;
end;

procedure TfrmCadRegIncentivo.EdtVlrPartEmpregadoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not ModoEdicao) and (EdtVlrMensalidade.Value > 0) then
  begin
    EdtvlrPartEmpresa.text := IntToStr(100 - StrToIntDef(EdtVlrPartEmpregado.Text,0));
    EdtVlrPartEmpregado.SelStart := Length(EdtVlrPartEmpregado.Text);
  end
  else
  begin
    proporcionalizaEmp((100 - StrToIntDef(EdtVlrPartEmpregado.Text,0)),  StrToIntDef(EdtVlrPartEmpregado.Text,0));
  end;

end;

procedure TfrmCadRegIncentivo.sbtnAltDetClick(Sender: TObject);
begin
  if CdsDet.FieldByName('REGISTRO').AsString = 'T' then
  begin
    {MsgDlg('Essa turma pertence ao Registro de Treinamento.',
           'Informação', mtInformation, [mbOk,mbHelp], 0);    } //Higor Nayde Ferreira SOL 245977 PPM 635853
    CmeDetalhe.Operacao := opIdle;
    CmeDetalhe.Atualizabotoes(Self);
    exit;
  end;

  EdtvlrPartEmpresa.text   := CdsDet.FieldByName('PARTEMPRESA').asString;
  EdtVlrPartEmpregado.text := CdsDet.FieldByName('PARTEMPREGADO').asString;

  inherited;
end;

procedure TfrmCadRegIncentivo.DtpFimdaFidelidadeExit(Sender: TObject);
begin
  CalcFimDaFidelidade;
  RetornaValorDevolverDtAtual;
  if CdsDet.State in [DsInsert, DsEdit] then begin
    if CdsMensalidades.FieldByName('METAATUARIAL').AsFloat > 0 then begin
      CalcMetaAtuarial (CdsMensalidades.FieldByName('METAATUARIAL').AsFloat);
    end;
  end;

end;

procedure TfrmCadRegIncentivo.CancelaEfetivaMensalidadeNovos(bCancela: boolean);
var
  sFiltro : string;
begin
  // limpando os que acabaram de ser inseridos
  CdsMensalidades.DisableControls;
  CdsMensalidades.First;
  sFiltro := CdsMensalidades.Filter;

  CdsMensalidades.Filtered := false;
  CdsMensalidades.Filter   := 'FLGNOVO = ''S'' ';
  CdsMensalidades.Filtered := true;

  while not CdsMensalidades.eof do
  begin
    if bCancela then
      CdsMensalidades.delete
    else
    begin
      CdsMensalidades.Edit;
      CdsMensalidades.FieldByName('FLGNOVO').AsString := 'N';
      CdsMensalidades.Post;

      CdsMensalidades.next;
    end;
  end;

  CdsMensalidades.Filtered := false;
  CdsMensalidades.Filter   := sFiltro;
  CdsMensalidades.Filtered := true;

  if bCancela then
     AjustaParcelas();

  CdsMensalidades.First;
  CdsMensalidades.EnableControls;
end;

procedure TfrmCadRegIncentivo.EdtDataEntregaChange(Sender: TObject);
begin
  inherited;//Higor Nayde Ferreira SOl 245977 PPM 635853
  CalcFimDaFidelidade;
  RetornaValorDevolverDtAtual;
  if CdsDet.State in [DsInsert, DsEdit] then begin
    if CdsMensalidades.FieldByName('METAATUARIAL').AsFloat > 0 then begin
      CalcMetaAtuarial (CdsMensalidades.FieldByName('METAATUARIAL').AsFloat);
    end;
  end;
//Higor Nayde Ferreira SOl 245977 PPM 635853
end;

end.
