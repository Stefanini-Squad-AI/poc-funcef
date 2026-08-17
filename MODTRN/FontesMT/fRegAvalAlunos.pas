unit fRegAvalAlunos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, contnrs, fSairAjuda,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit,
  wwdblook, Db, DBTables, checklst, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBGrids, DBClient,
  wwdbdatetimepicker, CMDateTimePicker, uCMClientDataSet, ComCtrls, uCtrlRegTrein, uCtrlCurso,
  uCtrlListTerceirosRH, uCtrlGlobalRH, uCtrlCursoxFatorAval, Mask, wwdbedit;

type
  TfrmRegAvalAlunos = class(TfrmSairAjuda)
    dsHstTrn: TwwDataSource;
    CdsCurso: TCMClientDataSet;
    tbntbDados: TNotebook;
    dbgdHistoricoTreinamento: TwwDBGrid;
    bbtnApanha: TBitBtn;
    CdsInstrutor: TCMClientDataSet;
    CdsEntid: TCMClientDataSet;
    CdsHstTrn: TCMClientDataSet;
    CdsPrincipal: TCMClientDataSet;
    pnlPessoasInscritas: TPanel;
    dsPrincipal: TwwDataSource;
    sbtnImprimirPlanilha: TSpeedButton;
    dbgdAvaliacoes: TwwDBGrid;
    PageControl1: TPageControl;
    tbshDadosBasicos: TTabSheet;
    gbxCurso: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    dblckCurso: TwwDBLookupCombo;
    dblckEntid: TwwDBLookupCombo;
    dblckInstrutor: TwwDBLookupCombo;
    rgControle: TRadioGroup;
    rgAvalCurs: TRadioGroup;
    gbxDatas: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dtedIniPlan: TCMDateTimePicker;
    dtedFimPlan: TCMDateTimePicker;
    dtedIniReal: TCMDateTimePicker;
    dtedFimReal: TCMDateTimePicker;
    gbxCarga: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    redTeoria: TRealEdit;
    redPratica: TRealEdit;
    redTotal: TRealEdit;
    gbxDespesas: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    redValCurso: TRealEdit;
    redValViagem: TRealEdit;
    redValHosp: TRealEdit;
    redValOutras: TRealEdit;
    tbshDadosComplementares: TTabSheet;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    edLocalCurso: TEdit;
    edDataHora: TwwDBEdit;
    edInstrutores: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure dblckCursoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure bbtnApanhaClick(Sender: TObject);
    procedure dblckEntidChange(Sender: TObject);
    procedure dblckEntidEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsPrincipalBeforePost(DataSet: TDataSet);
    procedure CdsPrincipalAfterPost(DataSet: TDataSet);
    procedure sbtnImprimirPlanilhaClick(Sender: TObject);
    procedure dbgdAvaliacoesFieldChanged(Sender: TObject; Field: TField);
    procedure dbgdAvaliacoesCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgdAvaliacoesExit(Sender: TObject);
  private
    CtrlRegTrein: TCtrlRegTrein;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlCurso: TCtrlCurso;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlCursoxFatorAval: TCtrlCursoxFatorAval;

    ListaCdsEscalaConceitos: TObjectList;
    ListaComboConceitos: TObjectList;

    iValMaxAvalTrn: integer;
    bFatorVariavelPorCurso: boolean;
    bAvalAluno: boolean;

    procedure SelPessoas(IdCurso: integer);
    procedure LimparDadosTela;
    procedure PreencherDadosTela;
    // Criação da lista dos ClientDataSet associados às Avaliações Conceituais
    procedure CriarListaCdsConceitos;
    procedure OnChangeComboAvalAluno(Sender: TObject);
    procedure OnKeyDownComboAvalAluno(Sender: TObject; var Key: Word; Shift: TShiftState);
    // Criação da lista dos Combos associados às Avaliações Conceituais
    procedure CriarListaComboConceitos;

    procedure MontarGridAvaliacoes;
  end;

var
  frmRegAvalAlunos: TfrmRegAvalAlunos;

implementation

uses uCMTypes, uSistema, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH,
  FCmReport, RListaAval, RListaAval2;

{$R *.DFM}

procedure TfrmRegAvalAlunos.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH(
    'FLGAVALALUNO, FLGCURSOXAVAL, VALMAXAVALTRN');

  iValMaxAvalTrn := dmCds.Cds.FieldByName('VALMAXAVALTRN').asInteger;
  bFatorVariavelPorCurso := (dmCds.Cds.FieldByName('FLGCURSOXAVAL').asInteger = 1);
  bAvalAluno := (dmCds.Cds.FieldByName('FLGAVALALUNO').asInteger = 1);

  CtrlRegTrein := TCtrlRegTrein.Create(false, false, false, false, 0, 0, '',
    CtrlUsoGeralRH.UsuXFilial, CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);
  
  if (bAvalAluno) then
    CtrlRegTrein.CdsAvalAluno := CdsPrincipal
  else
    CtrlRegTrein.CdsHistTrein := CdsPrincipal;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlCursoxFatorAval := TCtrlCursoxFatorAval.Create;
  CtrlCursoxFatorAval.InitializeAs(Padroes);

  ListaCdsEscalaConceitos := TObjectList.Create(true);
  ListaComboConceitos := TObjectList.Create(true);

  CriarListaCdsConceitos;

  CdsCurso.Data := CtrlCurso.ListGeral;
  CdsEntid.Data := CtrlRegTrein.ListEntid;
  CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F');
  CdsHstTrn.Data := CtrlRegTrein.ListHistoricoTreinamentoPorCurso(-1);

  tbntbDados.PageIndex := 0;
end;

procedure TfrmRegAvalAlunos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaCdsEscalaConceitos);
  FreeAndNil(ListaComboConceitos);

  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCurso);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlCursoxFatorAval);
  inherited;
end;

procedure TfrmRegAvalAlunos.CdsPrincipalBeforePost(DataSet: TDataSet);
begin
  if not(bAvalAluno) then
  begin
    if (CdsPrincipal.FieldByName('AVALTEOR').IsNull) then
      CdsPrincipal.FieldByName('FLGAVALTEOR').asInteger := 0
    else
      CdsPrincipal.FieldByName('FLGAVALTEOR').asInteger := 1;

    if (CdsPrincipal.FieldByName('AVALPRAT').IsNull) then
      CdsPrincipal.FieldByName('FLGAVALPRAT').asInteger := 0
    else
      CdsPrincipal.FieldByName('FLGAVALPRAT').asInteger := 1;
  end;
end;

procedure TfrmRegAvalAlunos.CdsPrincipalAfterPost(DataSet: TDataSet);
var
  Marca: TBookmark;
begin
  Marca := CdsPrincipal.GetBookmark;

  if (bAvalAluno) then
    CtrlRegTrein.GravarAvalAluno
  else
    CtrlRegTrein.GravarHistoricoTreinamento(false, '', '', 0);

  CdsPrincipal.GoToBookmark(Marca);
  CdsPrincipal.FreeBookmark(Marca);
end;

procedure TfrmRegAvalAlunos.dbgdAvaliacoesCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if (Field.FieldName = 'NOME') then
    ABrush.Color := clBtnFace;

  if (gdSelected in State) then
    AFont.Color := clWhite
  else  
    AFont.Color := clBlack;
end;

procedure TfrmRegAvalAlunos.dblckCursoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (modified) then
  begin
    tbntbDados.PageIndex := 0;
    LimparDadosTela;

    if not(CdsCurso.FieldByName('IDENTIDINSTR').IsNull) then
    begin
      CdsEntid.Locate('IDPESSOA', CdsCurso.FieldByName('IDENTIDINSTR').asFloat,[]);
      dblckEntid.LookupValue := CdsEntid.FieldByName('IDPESSOA').asString;
      dblckEntid.Update;
    end;

    CdsHstTrn.Data := CtrlRegTrein.ListHistoricoTreinamentoPorCurso(
      CdsCurso.FieldByName('IDCURSO').asFloat);
    bbtnApanha.Enabled := not(CdsHstTrn.IsEmpty);
  end;
end;

procedure TfrmRegAvalAlunos.dbgdAvaliacoesFieldChanged(Sender: TObject; Field: TField);
begin
  if (Trim(Field.EditMask) <> '') and
     (StrToIntDef(Field.asString,0) > iValMaxAvalTrn) then
    Field.asInteger := iValMaxAvalTrn;
end;

procedure TfrmRegAvalAlunos.dblckEntidChange(Sender: TObject);
begin
  if (dblckEntid.Text <> '') then
    CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F',
      CdsEntid.FieldByName('IDPESSOA').asFloat);
end;

procedure TfrmRegAvalAlunos.dblckEntidEnter(Sender: TObject);
begin
  if (dblckCurso.Text <> '') then
    CdsEntid.Data := CtrlRegTrein.ListEntid(CdsCurso.FieldByName('IDCURSO').asFloat);
end;

procedure TfrmRegAvalAlunos.dbgdAvaliacoesExit(Sender: TObject);
begin
  if (CdsPrincipal.State in [dsInsert,dsEdit]) then
    CdsPrincipal.Post;
end;

procedure TfrmRegAvalAlunos.bbtnApanhaClick(Sender: TObject);
begin
  PreencherDadosTela;

  if (bAvalAluno) then
    ListaComboConceitos.Clear;

  SelPessoas(CdsCurso.FieldByName('IDCURSO').asInteger);

  MontarGridAvaliacoes;
  tbntbDados.PageIndex := 1;
end;

procedure TfrmRegAvalAlunos.sbtnImprimirPlanilhaClick(Sender: TObject);
var
  Rpt: TFrmCmReport;
begin
  if (bAvalAluno) then
  begin
    Rpt := TRptListaAval2.Create(Application);
    with TRptListaAval2(Rpt) do
    begin
      bFatorPorCurso := bFatorVariavelPorCurso;
      sCurso := dblckCurso.Text;
      sEntid := dblckEntid.Text;
      sInstrutor := dblckInstrutor.Text;
      sLocal := edLocalCurso.Text;
      sIdCurso := CdsCurso.FieldByName('IDCURSO').asString;
      sIdEntid := CdsEntid.FieldByName('IDPESSOA').asString;
      sIdInstrutor := CdsInstrutor.FieldByName('IDPESSOA').asString;
      sIniPlan := dtedIniPlan.Text;
      sFimPlan := dtedFimPlan.Text;
      sIniReal := dtedIniReal.Text;
      sFimReal := dtedFimReal.Text;
      sDataIni := FU.IFF(dtedIniPlan.Text='', dtedIniReal.Text, dtedIniPlan.Text);
      sDataFim := FU.IFF(dtedFimPlan.Text='', dtedFimReal.Text, dtedFimPlan.Text);
      sInstrutores := edInstrutores.Text;
      sDataHora := edDataHora.Text;
    end;
  end
  else
  begin
    Rpt := TRptListaAval.Create(Application);
    with TRptListaAval(Rpt) do
    begin
      sCurso := dblckCurso.Text;
      sEntid := dblckEntid.Text;
      sInstrutor := dblckInstrutor.Text;
      sLocal := edLocalCurso.Text;
      sIdCurso := CdsCurso.FieldByName('IDCURSO').asString;
      sIdEntid := CdsEntid.FieldByName('IDPESSOA').asString;
      sIdInstrutor := CdsInstrutor.FieldByName('IDPESSOA').asString;
      sIniPlan := dtedIniPlan.Text;
      sFimPlan := dtedFimPlan.Text;
      sIniReal := dtedIniReal.Text;
      sFimReal := dtedFimReal.Text;
      sDataIni := FU.IFF(dtedIniPlan.Text='', dtedIniReal.Text, dtedIniPlan.Text);
      sDataFim := FU.IFF(dtedFimPlan.Text='', dtedFimReal.Text, dtedFimPlan.Text);
      sInstrutores := edInstrutores.Text;
      sDataHora := edDataHora.Text;
    end;
  end;

  Rpt.CrmRptCM.IdReports := 4006;
  Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  Rpt.CrmRptCM.OrigemCM := 1;
  Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
  Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  Rpt.CrmRptCM.Print;
  FreeAndNil(Rpt);
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmRegAvalAlunos.SelPessoas(IdCurso: integer);
begin
  CdsPrincipal.Data := CtrlRegTrein.ListPessoasInscritasNoCurso(true, IdCurso,
    FU.IFF(Trim(dblckInstrutor.Text)<>'', CdsInstrutor.FieldByName('IDPESSOA').asFloat, 0),
    FU.IFF(Trim(dblckEntid.Text)<>'', CdsEntid.FieldByName('IDPESSOA').asFloat, 0),
    dtedIniPlan.Date, dtedFimPlan.Date, dtedIniReal.Date, dtedFimReal.Date,
    edLocalCurso.Text, CdsHstTrn.FieldByName('DATAHORA').asString);
end;

procedure TfrmRegAvalAlunos.LimparDadosTela;
begin
  dblckEntid.Text := '';
  edLocalCurso.Text := '';
  rgControle.ItemIndex := 0;
  dtedIniPlan.Text := '';
  dtedFimPlan.Text := '';
  dtedIniReal.Text := '';
  dtedFimReal.Text := '';
  redTeoria.Value := 0;
  redPratica.Value := 0;
  redTotal.Value := 0;
  redValCurso.Value := 0;
  redValViagem.Value := 0;
  redValHosp.Value := 0;
  redValOutras.Value := 0;
end;

procedure TfrmRegAvalAlunos.PreencherDadosTela;
begin
  LimparDadosTela;
  dblckEntid.Text := CdsHstTrn.FieldByName('NOME').asString;
  CdsEntid.Locate('IDPESSOA', CdsHstTrn.FieldByName('IDENTIDINSTR').asInteger,[]);
  dblckInstrutor.Text := CdsHstTrn.FieldByName('INSTRUTOR').asString;
  CdsInstrutor.Locate('IDPESSOA',CdsHstTrn.FieldByName('IDINSTRUTOR').asInteger,[]);

  edLocalCurso.Text := CdsHstTrn.FieldByName('LOCALCURSO').asString;
  rgAvalCurs.ItemIndex := 1 - CdsHstTrn.FieldByName('FLGAVALCURS').asInteger;
  rgControle.ItemIndex := 1 - CdsHstTrn.FieldByName('FLGCONTROLE').asInteger;

  if not(CdsHstTrn.FieldByName('DATPLINI').IsNull) then
    dtedIniPlan.Date := CdsHstTrn.FieldByName('DATPLINI').asDateTime;

  if not(CdsHstTrn.FieldByName('DATPLFIM').IsNull) then
    dtedFimPlan.Date := CdsHstTrn.FieldByName('DATPLFIM').asDateTime;

  if not(CdsHstTrn.FieldByName('DATREINI').IsNull) then
    dtedIniReal.Date := CdsHstTrn.FieldByName('DATREINI').asDateTime;

  if not(CdsHstTrn.FieldByName('DATREFIM').IsNull) then
    dtedFimReal.Date := CdsHstTrn.FieldByName('DATREFIM').asDateTime;

  redTeoria.Value := CdsCurso.FieldByName('DUR_TEOR').asFloat;
  redPratica.Value := CdsCurso.FieldByName('DUR_PRAT').asFloat;
  redTotal.Value := redTeoria.Value + redPratica.Value;
  redValCurso.Value := CdsCurso.FieldByName('VALOR').asFloat;
end;

procedure TfrmRegAvalAlunos.CriarListaCdsConceitos;
var
  c, iNum: integer;
  _DadosCdsConceitos: OleVariant;
  _Cds, _CdsConceitos: TCMClientDataSet;
begin
  try
    _CdsConceitos := TCMClientDataSet.Create(nil);

    _CdsConceitos.Data := CtrlRegTrein.ListConceitosEmBranco;
    _DadosCdsConceitos := _CdsConceitos.Data;

    iNum := 1;
    ListaCdsEscalaConceitos.Clear;
    CtrlRegTrein.SelConceitos;
    CtrlRegTrein.CdsEscalaConceitos.First;
    while not(CtrlRegTrein.CdsEscalaConceitos.EOF) do
    begin
      _Cds := TCMClientDataSet.Create(nil);
      _Cds.Data := _DadosCdsConceitos;
      for c:=1 to CtrlRegTrein.CdsEscalaConceitos.FieldByName('QTDECONCEITOS').asInteger do
      begin
        _Cds.Insert;
        _Cds.FieldByName('COD_ESCALA').asInteger := c;
        _Cds.FieldByName('IDESCALACONCEITOS').asInteger :=
          CtrlRegTrein.CdsEscalaConceitos.FieldByName('IDESCALACONCEITOS').asInteger;
        _Cds.FieldByName('NOME').asString :=
          CtrlRegTrein.CdsEscalaConceitos.FieldByName('CONCEITO' + IntToStr(c)).asString;
        _Cds.Post;
      end;
      _Cds.AddIndex('Index', 'COD_ESCALA', []);
      _Cds.IndexName := 'Index';
      _Cds.Name := 'CdsConceitos' + IntToStr(iNum);
      ListaCdsEscalaConceitos.Add(_Cds);
      Inc(iNum);

      CtrlRegTrein.CdsEscalaConceitos.Next;
    end;
  finally
    _CdsConceitos.Free;
  end;
end;

procedure TfrmRegAvalAlunos.CriarListaComboConceitos;
var
  c: integer;
  _CmbBx: TwwDbLookupCombo;
begin
  ListaComboConceitos.Clear;
  for c:=0 to ListaCdsEscalaConceitos.Count-1 do
  begin
    _CmbBx := TwwDbLookupCombo.Create(Self);
    _CmbBx.Parent := dbgdAvaliacoes;
    _CmbBx.Visible := false;
    _CmbBx.Style := csDropDownList;
    _CmbBx.DataSource := dsPrincipal;
    _CmbBx.LookupTable := TCMClientDataSet(ListaCdsEscalaConceitos[c]);
    _CmbBx.LookupField := 'NOME';
    _CmbBx.Selected.Text := 'NOME' +#9+ '20' +#9+ 'NOME' +#9+ 'F';
    _CmbBx.Name := 'CmbBxConceitos' +IntToStr(c);
    _CmbBx.AllowClearKey := true;
    _CmbBx.OrderByDisplay := false;
    _CmbBx.Tag := c;
    _CmbBx.OnChange := OnChangeComboAvalAluno;
    _CmbBx.OnKeyDown := OnKeyDownComboAvalAluno;
    ListaComboConceitos.Add(_CmbBx);
  end;
end;

procedure TfrmRegAvalAlunos.OnChangeComboAvalAluno(Sender: TObject);
var
  iPos: integer;
  Cds: TCMClientDataSet;
begin
  iPos := dbgdAvaliacoes.SelectedIndex;
  if (CdsPrincipal.FieldByName('FLGAVALCURSO' + IntToStr(iPos)).asInteger = 1) and
     (TwwDBLookupCombo(Sender).Text <> '') then
  begin
    Cds := TCMClientDataSet(ListaCdsEscalaConceitos[TwwDBLookupCombo(Sender).Tag]);
    if not(CdsPrincipal.State in [dsInsert,dsEdit]) then
      CdsPrincipal.Edit;
    CdsPrincipal.FieldByName('COD_AVAL' + IntToStr(iPos)).asString :=
      Trim(Cds.FieldByName('COD_ESCALA').asString);
  end;
end;

procedure TfrmRegAvalAlunos.OnKeyDownComboAvalAluno(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iPos: integer;
begin
  if (Key = VK_DELETE) then
  begin
    iPos := dbgdAvaliacoes.SelectedIndex;
    if not(CdsPrincipal.State in [dsInsert,dsEdit]) then
      CdsPrincipal.Edit;
    CdsPrincipal.FieldByName('COD_AVAL' + IntToStr(iPos)).Clear;
    CdsPrincipal.FieldByName('DESCR_AVAL' + IntToStr(iPos)).Clear;
  end;
end;

procedure TfrmRegAvalAlunos.MontarGridAvaliacoes;
var
  c, c2, iNum: integer;
begin
  dbgdAvaliacoes.ControlType.Clear;
  dbgdAvaliacoes.Selected.Clear;
  dbgdAvaliacoes.Selected.Add('NOME' +#9+ '50' +#9+ 'Nome do Participante');

  if (bAvalAluno) then
  begin
    CdsPrincipal.Data := CtrlRegTrein.GerarDadosAvalAlunos(bFatorVariavelPorCurso,
      CdsPrincipal.Data);
    CriarListaComboConceitos;

    // Calcular o número de Avaliações
    iNum := 0;
    for c:=0 to CdsPrincipal.FieldCount-1 do
      if (Copy(CdsPrincipal.Fields[c].FieldName,1,8) = 'COD_AVAL') then
        Inc(iNum);

    // Associar os Combos dos conceitos ao ClientDataSet Principal se o Curso tiver
    // algum Conceito Associado
    if (iNum > 0) then
    begin
      for c:=1 to iNum do
      begin
        dbgdAvaliacoes.Selected.Add(
          'DESCR_AVAL' + IntToStr(c) +#9+
          IntToStr(length(Trim(CdsPrincipal.FieldByName('NOME_AVAL' + IntToStr(c)).asString))+4) +#9+
          CdsPrincipal.FieldByName('NOME_AVAL' + IntToStr(c)).asString);

        if (CdsPrincipal.FieldByName('FLGAVALCURSO' + IntToStr(c)).asInteger = 1) then
        begin
          for c2:=0 to ListaComboConceitos.Count-1 do
          begin
            if (TCMClientDataSet(ListaCdsEscalaConceitos[c2]).FieldByName('IDESCALACONCEITOS').asInteger =
                CdsPrincipal.FieldByName('IDESCALACONCEITOS' + IntToStr(c)).asInteger) then
            begin
              TwwDBLookupCombo(ListaComboConceitos[c2]).DataField := 'DESCR_AVAL' + IntToStr(c);
              dbgdAvaliacoes.SetControlType(
                'DESCR_AVAL' + IntToStr(c), fctCustom,
                TComponent(ListaComboConceitos[c2]).Name);
              break;
            end;
          end;
        end
        else
        begin
          dbgdAvaliacoes.SetControlType('DESCR_AVAL' + IntToStr(c), fctField, '');
          CdsPrincipal.FieldByName('DESCR_AVAL' + IntToStr(c)).EditMask :=
            FU.Replicate('#', length(IntToStr(iValMaxAvalTrn)));
        end;
        CdsPrincipal.FieldByName('DESCR_AVAL' + IntToStr(c)).Alignment := taCenter;
      end;
    end;

    // Torna o GRID somente para leitura caso não haja Conceito Associado ao Curso
    dbgdAvaliacoes.ReadOnly := (iNum = 0);

    dbgdAvaliacoes.ApplySelected;
    dbgdAvaliacoes.Invalidate;
  end
  else
  begin
    dbgdAvaliacoes.Selected.Add('AVALTEOR'+#9+'14'+#9+'Avaliação Teórica');
    dbgdAvaliacoes.Selected.Add('AVALPRAT'+#9+'14'+#9+'Avaliação Prática');
  end;
end;

end.
