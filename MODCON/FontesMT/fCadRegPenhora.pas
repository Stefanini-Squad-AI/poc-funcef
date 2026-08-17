unit fCadRegPenhora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar, Db,
  DBClient, uCMClientDataSet, StdCtrls, CheckLst, wwdblook, wwdbdatetimepicker, IvMulti,
  CMDateTimePicker, IvDictio, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  BfDialogs, BrowseFolder, uProcuraDir, uCtrlListTerceirosRH, uCtrlPpraBem,
  ColorCheckListBox, Wwdatsrc, DBCtrls, TREdit, Mask, wwdbedit, math,
  mImovelDB, MontaSelect;

type
  TfrmCadRegPenhora = class(TfrmOkCancelar)
    CdsEtapa: TCMClientDataSet;
    dsEtapa: TwwDataSource;
    dbrgTipo: TDBRadioGroup;
    gbxImovel: TGroupBox;
    dblbImovel: TwwDBLookupCombo;
    gbxBem: TGroupBox;
    dblcConjunto: TwwDBLookupCombo;
    Label2: TLabel;
    gbxInvestimento: TGroupBox;
    dblcInvestimento: TwwDBLookupCombo;
    CdsImovel: TCMClientDataSet;
    CdsConjunto: TCMClientDataSet;
    CdsInvestimento: TCMClientDataSet;
    dbedValor: TDBRealEdit;
    dbrgIndValor: TDBRadioGroup;
    CdsValorImovel: TCMClientDataSet;
    dbredValorMercado: TDBRealEdit;
    dsValorImovel: TwwDataSource;
    Label5: TLabel;
    Label6: TLabel;
    dbedDataMercado: TCMDateTimePicker;
    Label7: TLabel;
    redValorPenhorado: TDBRealEdit;
    Label9: TLabel;
    redValorPenhorado2: TDBRealEdit;
    Label10: TLabel;
    redValorPenhorado3: TDBRealEdit;
    Label3: TLabel;
    dbredValorContabil: TDBRealEdit;
    Label11: TLabel;
    dbedDataContabil: TCMDateTimePicker;
    dbedPlaca: TwwDBEdit;
    Label12: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    dbedCodImo: TwwDBEdit;
    Label4: TLabel;
    Label14: TLabel;
    dbedImoMestre: TwwDBEdit;
    Label15: TLabel;
    dbedImoCidade: TwwDBEdit;
    Label16: TLabel;
    dbedImoUF: TwwDBEdit;
    dsImovel: TwwDataSource;
    dbredValorJuiz: TDBRealEdit;
    Label17: TLabel;
    Label18: TLabel;
    redValorLivre: TDBRealEdit;
    Label19: TLabel;
    redPercLivre: TDBRealEdit;
    Label20: TLabel;
    redValorLivre2: TDBRealEdit;
    Label21: TLabel;
    redPercLivre2: TDBRealEdit;
    dblcPlanoPatro: TwwDBLookupCombo;
    Label22: TLabel;
    lblInvestimento: TLabel;
    Label24: TLabel;
    dblcTipoInvestimento: TwwDBLookupCombo;
    lblClasse: TLabel;
    dblcClasseRenda: TwwDBLookupCombo;
    lblAplicacao: TLabel;
    dblcAplicacao: TwwDBLookupCombo;
    CdsPlanoPatro: TCMClientDataSet;
    CdsTipoInvestimento: TCMClientDataSet;
    CdsClasseRenda: TCMClientDataSet;
    CdsAplicacao: TCMClientDataSet;
    lblCustodianteTipocota: TLabel;
    dblcCustodiante: TwwDBLookupCombo;
    CdsCustodiante: TCMClientDataSet;
    Label23: TLabel;
    dbredValorTitulo: TDBRealEdit;
    Label25: TLabel;
    redValorLivre3: TDBRealEdit;
    Label26: TLabel;
    redPercLivre3: TDBRealEdit;
    dblcFundoInvestimento: TwwDBLookupCombo;
    dblcTipocota: TwwDBLookupCombo;
    CdsTipocota: TCMClientDataSet;
    CdsFundoInvestimento: TCMClientDataSet;
    molImovelDBJur: TmolImovelDB;
    MS_Bem: TMontaSelect;
    gbxNomeBem: TGroupBox;
    DBedBem: TDBEdit;
    btnBuscaBem: TBitBtn;
    btnLimpaBem: TBitBtn;
    CdsBem: TCMClientDataSet;
    dsBem: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbrgTipoChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblbImovelChange(Sender: TObject);
    procedure dblcInvestimentoChange(Sender: TObject);
    procedure dblcConjuntoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dblcTipoInvestimentoChange(Sender: TObject);
    procedure dblcClasseRendaChange(Sender: TObject);
    procedure dblcCustodianteChange(Sender: TObject);
    procedure dblcAplicacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcAplicacaoChange(Sender: TObject);
    procedure dblcFundoInvestimentoChange(Sender: TObject);
    procedure dbrgIndValorChange(Sender: TObject);
    procedure btnBuscaBemClick(Sender: TObject);
    procedure DBedBemChange(Sender: TObject);
    procedure btnLimpaBemClick(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPpraBem: TCtrlPpraBem;

    IndPenhoraAntes, IdBemAntes, IdConjuntoAntes, IdImovelAntes,
    IdInvestimentoAntes, ValorAntes, IndValorAntes, BemPenhoradoAntes,
    IdPlanoPatroAntes, IdTipoInvestAntes, IdFundoInvestAntes,
    IdCustodianteAntes, IdOperRendaAntes, IdTipoCotaAntes: variant;
    dValor, dSalva: double;
    sData: string;
  public
    class function ExibirTelaPenhora(CdsEtapaOrigem: TCMClientDataSet): boolean;
  end;

var
  frmCadRegPenhora: TfrmCadRegPenhora;

implementation

uses dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, uSistema, uMensErro;

{$R *.DFM}

procedure TfrmCadRegPenhora.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPpraBem := TCtrlPpraBem.Create;
  CtrlPpraBem.InitializeAs(Padroes);

  CdsConjunto.Data := CtrlPpraBem.ListConjunto(0);

  CdsPlanoPatro.Data := CtrlListTerceirosRH.ListPlanoPatro;
  CdsTipoInvestimento.Data := CtrlListTerceirosRH.ListTipoInvestimento;
  CdsClasseRenda.Data := CtrlListTerceirosRH.ListClasseRendaFixa;
  CdsCustodiante.Data := CtrlListTerceirosRH.ListCustodiante;
  CdsInvestimento.Data := CtrlListTerceirosRH.ListInvestimento(-1,-1);
  CdsFundoInvestimento.Data := CtrlListTerceirosRH.ListFundoInvestimento('-1');

  //CdsValorImovel.Data := CtrlListTerceirosRH.ValorImovel(-1);
  dbedCodImo.DataSource := Nil;
  dbedImoMestre.DataSource := Nil;
  dbedImoCidade.DataSource := Nil;
  dbedImoUF.DataSource := Nil;
  CdsImovel.Data := CtrlListTerceirosRH.ListImovel;
end;

procedure TfrmCadRegPenhora.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPpraBem);
  inherited;
end;

procedure TfrmCadRegPenhora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmCadRegPenhora.dbrgTipoChange(Sender: TObject);
begin
  inherited;
  if ((not CdsEtapa.FieldByName('IDBEM').IsNull) and
      (dbrgTipo.ItemIndex <> 1)) or
     ((not CdsEtapa.FieldByName('IDIMOVEL').IsNull) and
      (dbrgTipo.ItemIndex <> 0)) then
    CdsEtapa.FieldByName('BEMPENHORADO').Clear;
  
  if (CdsEtapa.FieldByName('IDBEM').IsNull) then
  begin
    dbedPlaca.DataSource := nil;
    if (dblcConjunto.Text = '') then
    begin
      dbedDataContabil.Text := '';
      dbredValorContabil.Value := 0;
      redValorPenhorado2.Value := 0;
      redValorLivre2.Value := 0;
      redPercLivre2.Value := 0;
    end;
  end
  else
  begin
    dbedPlaca.DataSource := dsBem;
    dbedDataContabil.Text := sData;
    dbredValorContabil.Value := dValor;
    redValorPenhorado2.Value := dSalva;
    redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
    if dbredValorContabil.Value = 0 then
      redPercLivre2.Value := 0
    else
      redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;
  end;

  gbxImovel.Visible := dbrgTipo.ItemIndex = 0;
  gbxBem.Visible := dbrgTipo.ItemIndex = 1;
  gbxInvestimento.Visible := dbrgTipo.ItemIndex = 2;
  case (dbrgTipo.ItemIndex) of
    0: begin
         CdsEtapa.FieldByName('IDBEM').Clear;
         CdsEtapa.FieldByName('IDPESSOA').Clear;
         CdsEtapa.FieldByName('IDCONJUNTO').Clear;
         CdsEtapa.FieldByName('IDINVESTIMENTO').Clear;
         CdsEtapa.FieldByName('IDPLANPREVCTBPATR').Clear;
         CdsEtapa.FieldByName('IDTIPOINVEST').Clear;
         CdsEtapa.FieldByName('IDFUNDOINVEST').Clear;
         CdsEtapa.FieldByName('IDCUSTODIANTE').Clear;
         CdsEtapa.FieldByName('IDOPERRENFIXAPLIC').Clear;
         CdsEtapa.FieldByName('IDTIPOCOTA').Clear;
       end;
    1: begin
         CdsBem.Data := CtrlPpraBem.ListBem(Sistema.IdEmpresa,
           CdsEtapa.FieldByName('IDBEM').AsFloat,0);
         CdsEtapa.FieldByName('IDIMOVEL').Clear;
         CdsEtapa.FieldByName('IDINVESTIMENTO').Clear;
         CdsEtapa.FieldByName('IDPLANPREVCTBPATR').Clear;
         CdsEtapa.FieldByName('IDTIPOINVEST').Clear;
         CdsEtapa.FieldByName('IDFUNDOINVEST').Clear;
         CdsEtapa.FieldByName('IDCUSTODIANTE').Clear;
         CdsEtapa.FieldByName('IDOPERRENFIXAPLIC').Clear;
         CdsEtapa.FieldByName('IDTIPOCOTA').Clear;
       end;
    2: begin
         CdsEtapa.FieldByName('IDBEM').Clear;
         CdsEtapa.FieldByName('IDPESSOA').Clear;
         CdsEtapa.FieldByName('IDCONJUNTO').Clear;
         CdsEtapa.FieldByName('IDIMOVEL').Clear;
       end;
    3: begin
         CdsEtapa.FieldByName('IDBEM').Clear;
         CdsEtapa.FieldByName('IDPESSOA').Clear;
         CdsEtapa.FieldByName('IDCONJUNTO').Clear;
         CdsEtapa.FieldByName('IDIMOVEL').Clear;
         CdsEtapa.FieldByName('IDINVESTIMENTO').Clear;
         CdsEtapa.FieldByName('IDPLANPREVCTBPATR').Clear;
         CdsEtapa.FieldByName('IDTIPOINVEST').Clear;
         CdsEtapa.FieldByName('IDFUNDOINVEST').Clear;
         CdsEtapa.FieldByName('IDCUSTODIANTE').Clear;
         CdsEtapa.FieldByName('IDOPERRENFIXAPLIC').Clear;
         CdsEtapa.FieldByName('IDTIPOCOTA').Clear;
         dbrgIndValor.ItemIndex := 0;
       end;
  end;
end;

class function TfrmCadRegPenhora.ExibirTelaPenhora(CdsEtapaOrigem: TCMClientDataSet): boolean;
var
  frm: TfrmCadRegPenhora;
begin
  frm := TfrmCadRegPenhora.Create(Application);
  frm.CdsEtapa := CdsEtapaOrigem;
  frm.dsEtapa.DataSet := CdsEtapaOrigem;
  frm.IndPenhoraAntes := frm.CdsEtapa.FieldByName('INDPENHORA').Value;
  frm.BemPenhoradoAntes := frm.CdsEtapa.FieldByName('BEMPENHORADO').Value;
  frm.IdBemAntes := frm.CdsEtapa.FieldByName('IDBEM').Value;
  frm.IdConjuntoAntes := frm.CdsEtapa.FieldByName('IDCONJUNTO').Value;
  frm.IdImovelAntes := frm.CdsEtapa.FieldByName('IDIMOVEL').Value;
  frm.ValorAntes := frm.CdsEtapa.FieldByName('VALOR').Value;
  frm.IndValorAntes := frm.CdsEtapa.FieldByName('INDVALOR').Value;
  frm.IdPlanoPatroAntes := frm.CdsEtapa.FieldByName('IDPLANPREVCTBPATR').Value;
  frm.IdTipoInvestAntes := frm.CdsEtapa.FieldByName('IDTIPOINVEST').Value;
  frm.IdInvestimentoAntes := frm.CdsEtapa.FieldByName('IDINVESTIMENTO').Value;
  frm.IdFundoInvestAntes := frm.CdsEtapa.FieldByName('IDFUNDOINVEST').Value;
  frm.IdCustodianteAntes := frm.CdsEtapa.FieldByName('IDCUSTODIANTE').Value;
  frm.IdOperRendaAntes := frm.CdsEtapa.FieldByName('IDOPERRENFIXAPLIC').Value;
  frm.IdTipoCotaAntes := frm.CdsEtapa.FieldByName('IDTIPOCOTA').Value;
  Result := (frm.ShowModal = mrOk);
  frm.CdsEtapa := Nil;
  frm.Free;
end;

procedure TfrmCadRegPenhora.bbtnConfirmarClick(Sender: TObject);
begin
  if (dbrgIndValor.ItemIndex = 2) and (dbedValor.Value > 100) then
  begin
    MsgDlg('Percentual Não Deve Exceder a 100%', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  if ((dbrgIndValor.ItemIndex = 2) and (dbrgTipo.ItemIndex = 0) and
      (dbredValorMercado.Value - redValorPenhorado.Value <
       round(dbredValorMercado.Value * dbedValor.Value) / 100)) or
     ((dbrgIndValor.ItemIndex = 0) and (dbrgTipo.ItemIndex = 0) and
      (dbredValorMercado.Value - redValorPenhorado.Value < dbedValor.Value)) then
  begin
    MsgDlg('Valor a Penhorar Não Deve Exceder o Disponível (Mercado - Já Penhorado)',
      'Aviso', mtInformation, [mbOk, mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  if ((dbrgIndValor.ItemIndex = 2) and (dbrgTipo.ItemIndex = 1) and
      (dbredValorContabil.Value - redValorPenhorado2.Value <
       round(dbredValorContabil.Value * dbedValor.Value) / 100)) or
     ((dbrgIndValor.ItemIndex = 0) and (dbrgTipo.ItemIndex = 1) and
      (dbredValorContabil.Value - redValorPenhorado2.Value < dbedValor.Value)) then
  begin
    MsgDlg('Valor a Penhorar Não Deve Exceder o Disponível (Contábil - Já Penhorado)',
      'Aviso', mtInformation, [mbOk, mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  if ((dbrgTipo.ItemIndex = 0) and
      (((dbrgIndValor.ItemIndex = 2) and
       (redValorPenhorado.Value +
        dbredValorContabil.Value * dbedValor.Value / 100 < 0)) or
       ((dbrgIndValor.ItemIndex = 0) and
       (redValorPenhorado.Value + dbedValor.Value < 0))))
     or
     ((dbrgTipo.ItemIndex = 1) and
      (((dbrgIndValor.ItemIndex = 2) and
       (redValorPenhorado2.Value +
        dbredValorContabil.Value * dbedValor.Value / 100 < 0)) or
       ((dbrgIndValor.ItemIndex = 0) and
       (redValorPenhorado2.Value + dbedValor.Value < 0)))) then
  begin
    MsgDlg('Valor a Desconstituir Não Deve Exceder o Já Penhorado',
      'Aviso', mtInformation, [mbOk, mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  ModalResult := mrOK;

  inherited;

  if (dbrgIndValor.ItemIndex = 0) then //and (dbrgTipo.ItemIndex = 3) then
    CdsEtapa.FieldByName('VALORREC').AsFloat := CdsEtapa.FieldByName('VALOR').AsFloat;

  if (dbrgIndValor.ItemIndex = 2) and (dbrgTipo.ItemIndex = 0) then
    CdsEtapa.FieldByName('VALORREC').AsFloat := CdsEtapa.FieldByName('VALOR').AsFloat *
        dbredValorMercado.Value / 100;

  if (dbrgIndValor.ItemIndex = 2) and (dbrgTipo.ItemIndex = 1) then
    CdsEtapa.FieldByName('VALORREC').asFloat := CdsEtapa.FieldByName('VALOR').asFloat *
        dbredValorContabil.Value / 100;

  if not(CdsEtapa.FieldByName('IDBEM').IsNull) then
    CdsEtapa.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
end;

procedure TfrmCadRegPenhora.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dblcTipoInvestimento.OnChange := Nil;
  CdsEtapa.FieldByName('INDPENHORA').Value := IndPenhoraAntes;
  CdsEtapa.FieldByName('BEMPENHORADO').Value := BemPenhoradoAntes;
  CdsEtapa.FieldByName('IDBEM').Value := IdBemAntes;
  CdsEtapa.FieldByName('IDCONJUNTO').Value := IdConjuntoAntes;
  CdsEtapa.FieldByName('IDIMOVEL').Value := IdImovelAntes;
  CdsEtapa.FieldByName('IDINVESTIMENTO').Value := IdInvestimentoAntes;
  CdsEtapa.FieldByName('VALOR').Value := ValorAntes;
  CdsEtapa.FieldByName('INDVALOR').Value := IndValorAntes;
  CdsEtapa.FieldByName('IDPLANPREVCTBPATR').Value := IdPlanoPatroAntes;
  CdsEtapa.FieldByName('IDTIPOINVEST').Value := IdTipoInvestAntes;
  CdsEtapa.FieldByName('IDINVESTIMENTO').Value := IdInvestimentoAntes;
  CdsEtapa.FieldByName('IDFUNDOINVEST').Value := IdFundoInvestAntes;
  CdsEtapa.FieldByName('IDCUSTODIANTE').Value := IdCustodianteAntes;
  CdsEtapa.FieldByName('IDOPERRENFIXAPLIC').Value := IdOperRendaAntes;
  CdsEtapa.FieldByName('IDTIPOCOTA').Value := IdTipoCotaAntes;
end;

procedure TfrmCadRegPenhora.dblbImovelChange(Sender: TObject);
begin
  if dblbImovel.Text <> '' then
  begin
    CdsValorImovel.Data :=
      CtrlListTerceirosRH.ValorImovel(CdsImovel.FieldByName('IDIMOVEL').AsFloat);
    redValorPenhorado.Value :=
      CtrlListTerceirosRH.ValorPenhorado(CdsImovel.FieldByName('IDIMOVEL').AsFloat,1);
    redValorLivre.Value := max(0, dbredValorMercado.Value - redValorPenhorado.Value);
    if dbredValorMercado.Value = 0 then
      redPercLivre.Value := 0
    else
      redPercLivre.Value := redValorLivre.Value / dbredValorMercado.Value * 100;
    dbedCodImo.DataSource := dsImovel;
    dbedImoMestre.DataSource := dsImovel;
    dbedImoCidade.DataSource := dsImovel;
    dbedImoUF.DataSource := dsImovel;
  end
  else
  begin
    CdsValorImovel.Data := CtrlListTerceirosRH.ValorImovel(-1);
    redValorPenhorado.Value := 0;
    redValorLivre.Value := 0;
    redPercLivre.Value := 0;
    dbedCodImo.DataSource := Nil;
    dbedImoMestre.DataSource := Nil;
    dbedImoCidade.DataSource := Nil;
    dbedImoUF.DataSource := Nil;
  end;
end;

procedure TfrmCadRegPenhora.dblcInvestimentoChange(Sender: TObject);
begin
  inherited;
  if CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1 then
  begin
    if CdsInvestimento.FieldByName('IDINVESTIMENTO').asString = '' then
    begin
      CdsInvestimento.Data := CtrlListTerceirosRH.ListInvestimento(1,0);
      CdsInvestimento.Locate('IDINVESTIMENTO',
        CdsEtapa.FieldByName('IDINVESTIMENTO').asInteger, []);
    end;

    if not CdsEtapa.FieldByName('IDINVESTIMENTO').isNull then
    begin
      dblcClasseRenda.LookupValue := CdsInvestimento.FieldByName('IDCLASSETIT').asString;
      dblcClasseRenda.Update;
    end;

    CdsAplicacao.Data := CtrlListTerceirosRH.ListAplicacao(
     CdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').asString,
     CdsInvestimento.FieldByName('IDINVESTIMENTO').asString,
     '', // sem custodiante
     CdsEtapa.FieldByName('DATAREALOCOR').asString);

    dbredValorTitulo.Value := CdsAplicacao.FieldByName('SALDOVALOR').asFloat;
  end;

  if dblcInvestimento.Text <> '' then
    redValorPenhorado3.Value :=
      CtrlListTerceirosRH.ValorPenhorado(CdsEtapa.FieldByName('IDINVESTIMENTO').AsFloat,4)
  else
    redValorPenhorado3.Value := 0;
  dblcAplicacaoChange(Self);
end;

procedure TfrmCadRegPenhora.dblcConjuntoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) and (dblcConjunto.Text <> '') then
  begin
    CtrlListTerceirosRH.ValorContabil(CdsConjunto.FieldByName('IDCONJUNTO').AsFloat,
      Sistema.IdEmpresa, 2, dValor, sData);

    dbredValorContabil.Value := dValor;
    dbedDataContabil.Text := sData;

    dbedPlaca.DataSource := nil;
    CdsEtapa.FieldByName('IDBEM').Value := Null;
    CdsEtapa.FieldByName('IDPESSOA').Value := Null;
    CdsEtapa.FieldByName('BEMPENHORADO').Clear;
    redValorPenhorado2.Value :=
      CtrlListTerceirosRH.ValorPenhorado(CdsConjunto.FieldByName('IDCONJUNTO').AsFloat,3);
    redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
    if dbredValorContabil.Value = 0 then
      redPercLivre2.Value := 0
    else
      redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;

    MS_Bem.ItemsBusca.Clear;
    MS_Bem.ItemsBusca.Add('');
    MS_Bem.ItemsBusca.Add('');
    MS_Bem.ItemsBusca.Add('');
    MS_Bem.ItemsBusca.Add(dblcConjunto.Text);
  end;
end;

procedure TfrmCadRegPenhora.FormShow(Sender: TObject);
begin
  inherited;
  if not CdsEtapa.FieldByName('IDBEM').isNull then
  begin
    CtrlListTerceirosRH.ValorContabil(CdsEtapa.FieldByName('IDBEM').AsFloat,
      Sistema.IdEmpresa, 1, dValor, sData);

    dbredValorContabil.Value := dValor;
    dbedDataContabil.Text := sData;

    redValorPenhorado2.Value :=
      CtrlListTerceirosRH.ValorPenhorado(CdsEtapa.FieldByName('IDBEM').AsFloat,2);
    redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
    if dbredValorContabil.Value = 0 then
      redPercLivre2.Value := 0
    else
      redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;
  end;

  if not CdsEtapa.FieldByName('IDCONJUNTO').isNull then
  begin
    CtrlListTerceirosRH.ValorContabil(CdsEtapa.FieldByName('IDCONJUNTO').AsFloat,
      Sistema.IdEmpresa, 2, dValor, sData);

    dbredValorContabil.Value := dValor;
    dbedDataContabil.Text := sData;

    CdsEtapa.FieldByName('IDBEM').Value := Null;
    CdsEtapa.FieldByName('IDPESSOA').Value := Null;
    redValorPenhorado2.Value :=
      CtrlListTerceirosRH.ValorPenhorado(CdsConjunto.FieldByName('IDCONJUNTO').AsFloat,3);
    redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
    if dbredValorContabil.Value = 0 then
      redPercLivre2.Value := 0
    else
      redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;
  end;
end;

procedure TfrmCadRegPenhora.dblcTipoInvestimentoChange(Sender: TObject);
begin
  inherited;
  dblcClasseRenda.Visible :=
    CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1;
  dblcAplicacao.Visible :=
    CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1;
  dblcCustodiante.Visible :=
    CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger  = 1;
  dblcTipoCota.Visible :=
    CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger  = 9;
  lblClasse.Visible :=
    CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1;
  lblAplicacao.Visible :=
    CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1;
  lblCustodianteTipocota.Visible :=
    CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger in [1,9];

  lblInvestimento.Caption := 'Fundo Investimento';
  dblcFundoInvestimento.BringToFront;

  if CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1 then
  begin
    lblInvestimento.Caption := 'Investimento';
    dblcInvestimento.BringToFront;
    lblCustodianteTipocota.Caption := 'Custodiante (opcion.)';
    CdsCustodiante.Data := CtrlListTerceirosRH.ListCustodiante;
    dblcCustodiante.BringToFront;
    if not CdsEtapa.FieldByName('IDINVESTIMENTO').isNull then
    begin
      dblcClasseRenda.LookupValue := CdsInvestimento.FieldByName('IDCLASSETIT').asString;
      dblcClasseRenda.Update;
    end;
  end
  else if CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 5 then
    // Fundo de Renda Fixa
    CdsFundoInvestimento.Data := CtrlListTerceirosRH.ListFundoInvestimento('2,3')
  else if CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 6 then
    // Fundo de Renda Variável
    CdsFundoInvestimento.Data := CtrlListTerceirosRH.ListFundoInvestimento('4')
  else if CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 7 then
    // Fundo Imobiliário
    CdsFundoInvestimento.Data := CtrlListTerceirosRH.ListFundoInvestimento('1')
  else if CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 9 then
  begin
    // Fundo de Direito Creditório
    CdsFundoInvestimento.Data := CtrlListTerceirosRH.ListFundoInvestimento('5,15');
    CdsTipoCota.Data := CtrlListTerceirosRH.ListTipoCota;
    lblCustodianteTipocota.Caption := 'Tipo de Cota';
  end
  else if CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 10 then
    // Fundo de Participações
    CdsFundoInvestimento.Data := CtrlListTerceirosRH.ListFundoInvestimento('16');


end;

procedure TfrmCadRegPenhora.dblcClasseRendaChange(Sender: TObject);
begin
  inherited;
  if CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1 then
    CdsInvestimento.Data := CtrlListTerceirosRH.ListInvestimento(1,
      CdsClasseRenda.FieldByName('IDCLASSETIT').asFloat);
end;

procedure TfrmCadRegPenhora.dblcCustodianteChange(Sender: TObject);
begin
  inherited;
  if CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1 then
  begin
    CdsAplicacao.Data := CtrlListTerceirosRH.ListAplicacao(
     CdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').asString,
     CdsInvestimento.FieldByName('IDINVESTIMENTO').asString,
     FU.IFF(dblcCustodiante.Text='','', CdsCustodiante.FieldByName('IDCUSTODIANTE').asString),
     CdsEtapa.FieldByName('DATAREALOCOR').asString);

    dbredValorTitulo.Value := CdsAplicacao.FieldByName('SALDOVALOR').asFloat;
    dblcAplicacaoChange(Self);
  end;
end;

procedure TfrmCadRegPenhora.dblcAplicacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
    CdsEtapa.FieldByName('IDOPERRENFIXAPLIC').asString :=
      CdsAplicacao.FieldByName('IDOPERRENFIXAPLIC').asString;

    CdsAplicacao.Data := CtrlListTerceirosRH.ListAplicacao(
     CdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').asString,
     CdsInvestimento.FieldByName('IDINVESTIMENTO').asString,
     FU.IFF(dblcCustodiante.Text='','', CdsCustodiante.FieldByName('IDCUSTODIANTE').asString),
     CdsEtapa.FieldByName('DATAREALOCOR').asString);

    dbredValorTitulo.Value := CdsAplicacao.FieldByName('SALDOVALOR').asFloat;
    dblcAplicacaoChange(Self);
  end;
end;

procedure TfrmCadRegPenhora.dblcAplicacaoChange(Sender: TObject);
begin
  inherited;
  redValorLivre3.Value := max(0, dbredValorTitulo.Value - redValorPenhorado3.Value);
  if dbredValorTitulo.Value = 0 then
    redPercLivre3.Value := 0
  else
    redPercLivre3.Value := redValorLivre3.Value / dbredValorTitulo.Value * 100;
end;

procedure TfrmCadRegPenhora.dblcFundoInvestimentoChange(Sender: TObject);
begin
  inherited;
  if dblcFundoInvestimento.Text <> '' then
    redValorPenhorado3.Value :=
      CtrlListTerceirosRH.ValorPenhorado(CdsEtapa.FieldByName('IDFUNDOINVEST').AsFloat,5)
  else
    redValorPenhorado3.Value := 0;

  dmCds.Cds.Data := CtrlListTerceirosRH.ListFundoSaldo(
    CdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').asString,
    CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asString,
    CdsFundoInvestimento.FieldByName('IDTIPOFUNDOINVEST').asString,
    CdsFundoInvestimento.FieldByName('IDFUNDOINVEST').asString,
    CdsEtapa.FieldByName('DATAREALOCOR').asString);
  dbredValorTitulo.Value := dmCds.Cds.FieldByName('SALDOLIQUIDO').asFloat;
  dblcAplicacaoChange(Self);
end;

procedure TfrmCadRegPenhora.dbrgIndValorChange(Sender: TObject);
begin
  inherited;
  if dbrgIndValor.ItemIndex = 0 then
    dbedValor.DecDigits := 2
  else
    dbedValor.DecDigits := 12;

  SendMessage(dbedValor.Handle, CM_CHANGED, 0, 0);
end;

procedure TfrmCadRegPenhora.btnBuscaBemClick(Sender: TObject);
begin
  inherited;
   MS_Bem.Executar;

   Repaint;

   if MS_Bem.RetornouValor then begin
      CdsEtapa.FieldByName('IDBEM').AsFloat := StrToInt(MS_Bem.ValoresChave[0]);
      CdsEtapa.FieldByName('IDPESSOA').AsFloat := StrToInt(MS_Bem.ValoresChave[1]);
      CdsEtapa.FieldByName('BEMPENHORADO').AsString := MS_Bem.ValoresChave[2];

      CdsBem.Data := CtrlPpraBem.ListBem(Sistema.IdEmpresa,
        CdsEtapa.FieldByName('IDBEM').AsFloat,0);

      dbedPlaca.DataSource := dsBem;
      CtrlListTerceirosRH.ValorContabil(CdsEtapa.FieldByName('IDBEM').AsFloat,
        Sistema.IdEmpresa, 1, dValor, sData);

      dbredValorContabil.Value := dValor;
      dbedDataContabil.Text := sData;

      CdsEtapa.FieldByName('IDCONJUNTO').Value := Null;
      redValorPenhorado2.Value :=
        CtrlListTerceirosRH.ValorPenhorado(CdsEtapa.FieldByName('IDBEM').AsFloat,2);
      redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
      if dbredValorContabil.Value = 0 then
        redPercLivre2.Value := 0
      else
        redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;
   end;

   btnBuscaBem.SetFocus;
end;

procedure TfrmCadRegPenhora.DBedBemChange(Sender: TObject);
begin
  inherited;
  if (dbedBem.Text = '') then
  begin
    dbedPlaca.DataSource := nil;
    if (dblcConjunto.Text = '') then
    begin
      dbedDataContabil.Text := '';
      dbredValorContabil.Value := 0;
      redValorPenhorado2.Value := 0;
      redValorLivre2.Value := 0;
      redPercLivre2.Value := 0;
    end;
  end
  else
  begin
    dbedPlaca.DataSource := dsBem;
    dbedDataContabil.Text := sData;
    dbredValorContabil.Value := dValor;
    redValorPenhorado2.Value := dSalva;
    redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
    if dbredValorContabil.Value = 0 then
      redPercLivre2.Value := 0
    else
      redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;
  end;
end;

procedure TfrmCadRegPenhora.btnLimpaBemClick(Sender: TObject);
begin
  inherited;
      CdsEtapa.FieldByName('IDBEM').Clear;
      CdsEtapa.FieldByName('IDPESSOA').Clear;
      DBedBem.Text := '';
end;

end.

