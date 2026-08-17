Unit fCadRegPenhora;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar, Db,
   DBClient, uCMClientDataSet, StdCtrls, CheckLst, wwdblook, wwdbdatetimepicker, IvMulti,
   CMDateTimePicker, IvDictio, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
   BfDialogs, BrowseFolder, uProcuraDir, uCtrlListTerceirosRH, uCtrlPpraBem,
   ColorCheckListBox, Wwdatsrc, DBCtrls, TREdit, Mask, wwdbedit, math,
   mImovelDB, MontaSelect;

Type
   TfrmCadRegPenhora = Class(TfrmOkCancelar)
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
      dbrgSituacao: TDBRadioGroup;
      Procedure FormCreate(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbrgTipoChange(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure dblbImovelChange(Sender: TObject);
      Procedure dblcInvestimentoChange(Sender: TObject);
      Procedure dblcConjuntoCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure FormShow(Sender: TObject);
      Procedure dblcTipoInvestimentoChange(Sender: TObject);
      Procedure dblcClasseRendaChange(Sender: TObject);
      Procedure dblcCustodianteChange(Sender: TObject);
      Procedure dblcAplicacaoCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure dblcAplicacaoChange(Sender: TObject);
      Procedure dblcFundoInvestimentoChange(Sender: TObject);
      Procedure dbrgIndValorChange(Sender: TObject);
      Procedure btnBuscaBemClick(Sender: TObject);
      Procedure DBedBemChange(Sender: TObject);
      Procedure btnLimpaBemClick(Sender: TObject);
   Private
      CtrlListTerceirosRH: TCtrlListTerceirosRH;
      CtrlPpraBem: TCtrlPpraBem;

      IndPenhoraAntes, IdSitPenhora, IdBemAntes, IdConjuntoAntes, IdImovelAntes,
         IdInvestimentoAntes, ValorAntes, IndValorAntes, BemPenhoradoAntes,
         IdPlanoPatroAntes, IdTipoInvestAntes, IdFundoInvestAntes,
         IdCustodianteAntes, IdOperRendaAntes, IdTipoCotaAntes: variant;
      dValor, dSalva: double;
      sData: String;
   Public
      Class Function ExibirTelaPenhora(CdsEtapaOrigem: TCMClientDataSet): boolean;
   End;

Var
   frmCadRegPenhora: TfrmCadRegPenhora;

Implementation

Uses dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, uSistema, uMensErro;

{$R *.DFM}

Procedure TfrmCadRegPenhora.FormCreate(Sender: TObject);
Begin
   Inherited;
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
   CdsInvestimento.Data := CtrlListTerceirosRH.ListInvestimento(-1, -1);
   CdsFundoInvestimento.Data := CtrlListTerceirosRH.ListFundoInvestimento('-1');

   dbedCodImo.DataSource := Nil;
   dbedImoMestre.DataSource := Nil;
   dbedImoCidade.DataSource := Nil;
   dbedImoUF.DataSource := Nil;
   CdsImovel.Data := CtrlListTerceirosRH.ListImovel;
   dbrgSituacao.ItemIndex := 0;
End;

Procedure TfrmCadRegPenhora.FormDestroy(Sender: TObject);
Begin
   FreeAndNil(CtrlListTerceirosRH);
   FreeAndNil(CtrlPpraBem);
   Inherited;
End;

Procedure TfrmCadRegPenhora.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Inherited;
   Action := caHide;
End;

Procedure TfrmCadRegPenhora.dbrgTipoChange(Sender: TObject);
Begin
   Inherited;
   If ((Not CdsEtapa.FieldByName('IDBEM').IsNull) And
      (dbrgTipo.ItemIndex <> 1)) Or
      ((Not CdsEtapa.FieldByName('IDIMOVEL').IsNull) And
      (dbrgTipo.ItemIndex <> 0)) Then
      CdsEtapa.FieldByName('BEMPENHORADO').Clear;

   If (CdsEtapa.FieldByName('IDBEM').IsNull) Then
      Begin
         dbedPlaca.DataSource := Nil;
         If (dblcConjunto.Text = '') Then
            Begin
               dbedDataContabil.Text := '';
               dbredValorContabil.Value := 0;
               redValorPenhorado2.Value := 0;
               redValorLivre2.Value := 0;
               redPercLivre2.Value := 0;
            End;
      End
   Else
      Begin
         dbedPlaca.DataSource := dsBem;
         dbedDataContabil.Text := sData;
         dbredValorContabil.Value := dValor;
         redValorPenhorado2.Value := dSalva;
         redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
         If dbredValorContabil.Value = 0 Then
            redPercLivre2.Value := 0
         Else
            redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;
      End;

   gbxImovel.Visible := dbrgTipo.ItemIndex = 0;
   gbxBem.Visible := dbrgTipo.ItemIndex = 1;
   gbxInvestimento.Visible := dbrgTipo.ItemIndex = 2;
   Case (dbrgTipo.ItemIndex) Of
      0: Begin
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
         End;
      1: Begin
            CdsBem.Data := CtrlPpraBem.ListBem(Sistema.IdEmpresa,
               CdsEtapa.FieldByName('IDBEM').AsFloat, 0);
            CdsEtapa.FieldByName('IDIMOVEL').Clear;
            CdsEtapa.FieldByName('IDINVESTIMENTO').Clear;
            CdsEtapa.FieldByName('IDPLANPREVCTBPATR').Clear;
            CdsEtapa.FieldByName('IDTIPOINVEST').Clear;
            CdsEtapa.FieldByName('IDFUNDOINVEST').Clear;
            CdsEtapa.FieldByName('IDCUSTODIANTE').Clear;
            CdsEtapa.FieldByName('IDOPERRENFIXAPLIC').Clear;
            CdsEtapa.FieldByName('IDTIPOCOTA').Clear;
         End;
      2: Begin
            CdsEtapa.FieldByName('IDBEM').Clear;
            CdsEtapa.FieldByName('IDPESSOA').Clear;
            CdsEtapa.FieldByName('IDCONJUNTO').Clear;
            CdsEtapa.FieldByName('IDIMOVEL').Clear;
         End;
      3: Begin
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
         End;
   End;
End;

Class Function TfrmCadRegPenhora.ExibirTelaPenhora(CdsEtapaOrigem: TCMClientDataSet): boolean;
Var
   frm: TfrmCadRegPenhora;
Begin
   frm := TfrmCadRegPenhora.Create(Application);
   frm.CdsEtapa := CdsEtapaOrigem;
   frm.dsEtapa.DataSet := CdsEtapaOrigem;
   frm.IndPenhoraAntes := frm.CdsEtapa.FieldByName('INDPENHORA').Value;
   frm.IdSitPenhora := frm.CdsEtapa.FieldByName('IDSITPENHORA').Value; //---Renan Cristiano KT 653226 SOL 125702 início.
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
End;

Procedure TfrmCadRegPenhora.bbtnConfirmarClick(Sender: TObject);
Begin
   //---Renan Cristiano KT 679502 SOL 127684 início.
   //William M. Santos / Paulo Nobre Sol nº 132649 Kintana nº 766533 - ini
   If (dbrgSituacao.ItemIndex < 0) And (CdsEtapa.FieldByName('CODTIPORECURSO').AsInteger = 1030) Then Begin // Penhora
         //William M. Santos / Paulo Nobre Sol nº 132649 Kintana nº 766533 - fim
         MsgDlg('Situação da penhora não informado', 'Aviso', mtInformation, [mbOk], 0);
         ModalResult := mrNone;
         exit;
      End;
   //---Renan Cristiano KT 679502 SOL 127684 Fim.

   If (dbrgIndValor.ItemIndex = 2) And (dbedValor.Value > 100) Then
      Begin
         MsgDlg('Percentual Não Deve Exceder a 100%', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         ModalResult := mrNone;
         exit;
      End;

   If ((dbrgIndValor.ItemIndex = 2) And (dbrgTipo.ItemIndex = 0) And
      (dbredValorMercado.Value - redValorPenhorado.Value <
      round(dbredValorMercado.Value * dbedValor.Value) / 100)) Or
      ((dbrgIndValor.ItemIndex = 0) And (dbrgTipo.ItemIndex = 0) And
      (dbredValorMercado.Value - redValorPenhorado.Value < dbedValor.Value)) Then
      Begin
         MsgDlg('Valor a Penhorar Não Deve Exceder o Disponível (Mercado - Já Penhorado)',
            'Aviso', mtInformation, [mbOk, mbHelp], 0);
         ModalResult := mrNone;
         exit;
      End;

   If ((dbrgIndValor.ItemIndex = 2) And (dbrgTipo.ItemIndex = 1) And
      (dbredValorContabil.Value - redValorPenhorado2.Value <
      round(dbredValorContabil.Value * dbedValor.Value) / 100)) Or
      ((dbrgIndValor.ItemIndex = 0) And (dbrgTipo.ItemIndex = 1) And
      (dbredValorContabil.Value - redValorPenhorado2.Value < dbedValor.Value)) Then
      Begin
         MsgDlg('Valor a Penhorar Não Deve Exceder o Disponível (Contábil - Já Penhorado)',
            'Aviso', mtInformation, [mbOk, mbHelp], 0);
         ModalResult := mrNone;
         exit;
      End;

   If ((dbrgTipo.ItemIndex = 0) And
      (((dbrgIndValor.ItemIndex = 2) And
      (redValorPenhorado.Value +
      dbredValorContabil.Value * dbedValor.Value / 100 < 0)) Or
      ((dbrgIndValor.ItemIndex = 0) And
      (redValorPenhorado.Value + dbedValor.Value < 0))))
      Or
      ((dbrgTipo.ItemIndex = 1) And
      (((dbrgIndValor.ItemIndex = 2) And
      (redValorPenhorado2.Value +
      dbredValorContabil.Value * dbedValor.Value / 100 < 0)) Or
      ((dbrgIndValor.ItemIndex = 0) And
      (redValorPenhorado2.Value + dbedValor.Value < 0)))) Then
      Begin
         MsgDlg('Valor a Desconstituir Não Deve Exceder o Já Penhorado',
            'Aviso', mtInformation, [mbOk, mbHelp], 0);
         ModalResult := mrNone;
         exit;
      End;

   ModalResult := mrOK;

   Inherited;

   If (dbrgIndValor.ItemIndex = 0) Then
      CdsEtapa.FieldByName('VALORREC').AsFloat := CdsEtapa.FieldByName('VALOR').AsFloat;

   If (dbrgIndValor.ItemIndex = 2) And (dbrgTipo.ItemIndex = 0) Then
      CdsEtapa.FieldByName('VALORREC').AsFloat := CdsEtapa.FieldByName('VALOR').AsFloat *
         dbredValorMercado.Value / 100;

   If (dbrgIndValor.ItemIndex = 2) And (dbrgTipo.ItemIndex = 1) Then
      CdsEtapa.FieldByName('VALORREC').asFloat := CdsEtapa.FieldByName('VALOR').asFloat *
         dbredValorContabil.Value / 100;

   If Not (CdsEtapa.FieldByName('IDBEM').IsNull) Then
      CdsEtapa.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;

End;

Procedure TfrmCadRegPenhora.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   dblcTipoInvestimento.OnChange := Nil;
   CdsEtapa.FieldByName('INDPENHORA').Value := IndPenhoraAntes;
   CdsEtapa.FieldByName('IDSITPENHORA').Value := IdSitPenhora; //---Renan Cristiano KT 653226 SOL 125702 início.
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
End;

Procedure TfrmCadRegPenhora.dblbImovelChange(Sender: TObject);
Begin
   If dblbImovel.Text <> '' Then
      Begin
         CdsValorImovel.Data :=
            CtrlListTerceirosRH.ValorImovel(CdsImovel.FieldByName('IDIMOVEL').AsFloat);
         redValorPenhorado.Value :=
            CtrlListTerceirosRH.ValorPenhorado(CdsImovel.FieldByName('IDIMOVEL').AsFloat, 1);
         redValorLivre.Value := max(0, dbredValorMercado.Value - redValorPenhorado.Value);
         If dbredValorMercado.Value = 0 Then
            redPercLivre.Value := 0
         Else
            redPercLivre.Value := redValorLivre.Value / dbredValorMercado.Value * 100;
         dbedCodImo.DataSource := dsImovel;
         dbedImoMestre.DataSource := dsImovel;
         dbedImoCidade.DataSource := dsImovel;
         dbedImoUF.DataSource := dsImovel;
      End
   Else
      Begin
         CdsValorImovel.Data := CtrlListTerceirosRH.ValorImovel(-1);
         redValorPenhorado.Value := 0;
         redValorLivre.Value := 0;
         redPercLivre.Value := 0;
         dbedCodImo.DataSource := Nil;
         dbedImoMestre.DataSource := Nil;
         dbedImoCidade.DataSource := Nil;
         dbedImoUF.DataSource := Nil;
      End;
End;

Procedure TfrmCadRegPenhora.dblcInvestimentoChange(Sender: TObject);
Begin
   Inherited;
   If CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1 Then
      Begin
         If CdsInvestimento.FieldByName('IDINVESTIMENTO').asString = '' Then
            Begin
               CdsInvestimento.Data := CtrlListTerceirosRH.ListInvestimento(1, 0);
               CdsInvestimento.Locate('IDINVESTIMENTO',
                  CdsEtapa.FieldByName('IDINVESTIMENTO').asInteger, []);
            End;

         If Not CdsEtapa.FieldByName('IDINVESTIMENTO').isNull Then
            Begin
               dblcClasseRenda.LookupValue := CdsInvestimento.FieldByName('IDCLASSETIT').asString;
               dblcClasseRenda.Update;
            End;

         CdsAplicacao.Data := CtrlListTerceirosRH.ListAplicacao(
            CdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').asString,
            CdsInvestimento.FieldByName('IDINVESTIMENTO').asString,
            '', // sem custodiante
            CdsEtapa.FieldByName('DATAREALOCOR').asString);

         dbredValorTitulo.Value := CdsAplicacao.FieldByName('SALDOVALOR').asFloat;
      End;

   If dblcInvestimento.Text <> '' Then
      redValorPenhorado3.Value :=
         CtrlListTerceirosRH.ValorPenhorado(CdsEtapa.FieldByName('IDINVESTIMENTO').AsFloat, 4)
   Else
      redValorPenhorado3.Value := 0;
   dblcAplicacaoChange(Self);
End;

Procedure TfrmCadRegPenhora.dblcConjuntoCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   If (modified) And (dblcConjunto.Text <> '') Then
      Begin
         CtrlListTerceirosRH.ValorContabil(CdsConjunto.FieldByName('IDCONJUNTO').AsFloat,
            Sistema.IdEmpresa, 2, dValor, sData);

         dbredValorContabil.Value := dValor;
         dbedDataContabil.Text := sData;

         dbedPlaca.DataSource := Nil;
         CdsEtapa.FieldByName('IDBEM').Value := Null;
         CdsEtapa.FieldByName('IDPESSOA').Value := Null;
         CdsEtapa.FieldByName('BEMPENHORADO').Clear;
         redValorPenhorado2.Value :=
            CtrlListTerceirosRH.ValorPenhorado(CdsConjunto.FieldByName('IDCONJUNTO').AsFloat, 3);
         redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
         If dbredValorContabil.Value = 0 Then
            redPercLivre2.Value := 0
         Else
            redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;

         MS_Bem.ItemsBusca.Clear;
         MS_Bem.ItemsBusca.Add('');
         MS_Bem.ItemsBusca.Add('');
         MS_Bem.ItemsBusca.Add('');
         MS_Bem.ItemsBusca.Add(dblcConjunto.Text);
      End;
End;

Procedure TfrmCadRegPenhora.FormShow(Sender: TObject);
Begin
   Inherited;
   If Not CdsEtapa.FieldByName('IDBEM').isNull Then
      Begin
         CtrlListTerceirosRH.ValorContabil(CdsEtapa.FieldByName('IDBEM').AsFloat,
            Sistema.IdEmpresa, 1, dValor, sData);

         dbredValorContabil.Value := dValor;
         dbedDataContabil.Text := sData;

         redValorPenhorado2.Value :=
            CtrlListTerceirosRH.ValorPenhorado(CdsEtapa.FieldByName('IDBEM').AsFloat, 2);
         redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
         If dbredValorContabil.Value = 0 Then
            redPercLivre2.Value := 0
         Else
            redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;
      End;

   If Not CdsEtapa.FieldByName('IDCONJUNTO').isNull Then
      Begin
         CtrlListTerceirosRH.ValorContabil(CdsEtapa.FieldByName('IDCONJUNTO').AsFloat,
            Sistema.IdEmpresa, 2, dValor, sData);

         dbredValorContabil.Value := dValor;
         dbedDataContabil.Text := sData;

         CdsEtapa.FieldByName('IDBEM').Value := Null;
         CdsEtapa.FieldByName('IDPESSOA').Value := Null;
         redValorPenhorado2.Value :=
            CtrlListTerceirosRH.ValorPenhorado(CdsConjunto.FieldByName('IDCONJUNTO').AsFloat, 3);
         redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
         If dbredValorContabil.Value = 0 Then
            redPercLivre2.Value := 0
         Else
            redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;
      End;
End;

Procedure TfrmCadRegPenhora.dblcTipoInvestimentoChange(Sender: TObject);
Begin
   Inherited;
   dblcClasseRenda.Visible :=
      CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1;
   dblcAplicacao.Visible :=
      CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1;
   dblcCustodiante.Visible :=
      CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1;
   dblcTipoCota.Visible :=
      CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 9;
   lblClasse.Visible :=
      CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1;
   lblAplicacao.Visible :=
      CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1;
   lblCustodianteTipocota.Visible :=
      CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger In [1, 9];

   lblInvestimento.Caption := 'Fundo Investimento';
   dblcFundoInvestimento.BringToFront;

   If CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1 Then
      Begin
         lblInvestimento.Caption := 'Investimento';
         dblcInvestimento.BringToFront;
         lblCustodianteTipocota.Caption := 'Custodiante (opcion.)';
         CdsCustodiante.Data := CtrlListTerceirosRH.ListCustodiante;
         dblcCustodiante.BringToFront;
         If Not CdsEtapa.FieldByName('IDINVESTIMENTO').isNull Then
            Begin
               dblcClasseRenda.LookupValue := CdsInvestimento.FieldByName('IDCLASSETIT').asString;
               dblcClasseRenda.Update;
            End;
      End;

   //-- Renan Cristiano SOL 130680 Kintana 737344 Inicio.
   CdsFundoInvestimento.Data := CtrlListTerceirosRH.ListFundoInvestimento(CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asString);
   //-- Renan Cristiano SOL 130680 Kintana 737344 Fim.
End;

Procedure TfrmCadRegPenhora.dblcClasseRendaChange(Sender: TObject);
Begin
   Inherited;
   If CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1 Then
      CdsInvestimento.Data := CtrlListTerceirosRH.ListInvestimento(1,
         CdsClasseRenda.FieldByName('IDCLASSETIT').asFloat);
End;

Procedure TfrmCadRegPenhora.dblcCustodianteChange(Sender: TObject);
Begin
   Inherited;
   If CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asInteger = 1 Then
      Begin
         CdsAplicacao.Data := CtrlListTerceirosRH.ListAplicacao(
            CdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').asString,
            CdsInvestimento.FieldByName('IDINVESTIMENTO').asString,
            FU.IFF(dblcCustodiante.Text = '', '', CdsCustodiante.FieldByName('IDCUSTODIANTE').asString),
            CdsEtapa.FieldByName('DATAREALOCOR').asString);

         dbredValorTitulo.Value := CdsAplicacao.FieldByName('SALDOVALOR').asFloat;
         dblcAplicacaoChange(Self);
      End;
End;

Procedure TfrmCadRegPenhora.dblcAplicacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   If modified Then
      Begin
         CdsEtapa.FieldByName('IDOPERRENFIXAPLIC').asString :=
            CdsAplicacao.FieldByName('IDOPERRENFIXAPLIC').asString;

         CdsAplicacao.Data := CtrlListTerceirosRH.ListAplicacao(
            CdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').asString,
            CdsInvestimento.FieldByName('IDINVESTIMENTO').asString,
            FU.IFF(dblcCustodiante.Text = '', '', CdsCustodiante.FieldByName('IDCUSTODIANTE').asString),
            CdsEtapa.FieldByName('DATAREALOCOR').asString);

         dbredValorTitulo.Value := CdsAplicacao.FieldByName('SALDOVALOR').asFloat;
         dblcAplicacaoChange(Self);
      End;
End;

Procedure TfrmCadRegPenhora.dblcAplicacaoChange(Sender: TObject);
Begin
   Inherited;
   redValorLivre3.Value := max(0, dbredValorTitulo.Value - redValorPenhorado3.Value);
   If dbredValorTitulo.Value = 0 Then
      redPercLivre3.Value := 0
   Else
      redPercLivre3.Value := redValorLivre3.Value / dbredValorTitulo.Value * 100;
End;

Procedure TfrmCadRegPenhora.dblcFundoInvestimentoChange(Sender: TObject);
Begin
   Inherited;
   If dblcFundoInvestimento.Text <> '' Then
      redValorPenhorado3.Value :=
         CtrlListTerceirosRH.ValorPenhorado(CdsEtapa.FieldByName('IDFUNDOINVEST').AsFloat, 5)
   Else
      redValorPenhorado3.Value := 0;

   dmCds.Cds.Data := CtrlListTerceirosRH.ListFundoSaldo(
      CdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').asString,
      CdsTipoInvestimento.FieldByName('IDTIPOINVEST').asString,
      CdsFundoInvestimento.FieldByName('IDTIPOFUNDOINVEST').asString,
      CdsFundoInvestimento.FieldByName('IDFUNDOINVEST').asString,
      CdsEtapa.FieldByName('DATAREALOCOR').asString);
   dbredValorTitulo.Value := dmCds.Cds.FieldByName('SALDOLIQUIDO').asFloat;
   dblcAplicacaoChange(Self);
End;

Procedure TfrmCadRegPenhora.dbrgIndValorChange(Sender: TObject);
Begin
   Inherited;
   If dbrgIndValor.ItemIndex = 0 Then
      dbedValor.DecDigits := 2
   Else
      dbedValor.DecDigits := 12;

   SendMessage(dbedValor.Handle, CM_CHANGED, 0, 0);
End;

Procedure TfrmCadRegPenhora.btnBuscaBemClick(Sender: TObject);
Begin
   Inherited;
   MS_Bem.Executar;

   Repaint;

   If MS_Bem.RetornouValor Then Begin
         CdsEtapa.FieldByName('IDBEM').AsFloat := StrToInt(MS_Bem.ValoresChave[0]);
         CdsEtapa.FieldByName('IDPESSOA').AsFloat := StrToInt(MS_Bem.ValoresChave[1]);
         CdsEtapa.FieldByName('BEMPENHORADO').AsString := MS_Bem.ValoresChave[2];

         CdsBem.Data := CtrlPpraBem.ListBem(Sistema.IdEmpresa,
            CdsEtapa.FieldByName('IDBEM').AsFloat, 0);

         dbedPlaca.DataSource := dsBem;
         CtrlListTerceirosRH.ValorContabil(CdsEtapa.FieldByName('IDBEM').AsFloat,
            Sistema.IdEmpresa, 1, dValor, sData);

         dbredValorContabil.Value := dValor;
         dbedDataContabil.Text := sData;

         CdsEtapa.FieldByName('IDCONJUNTO').Value := Null;
         redValorPenhorado2.Value :=
            CtrlListTerceirosRH.ValorPenhorado(CdsEtapa.FieldByName('IDBEM').AsFloat, 2);
         redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
         If dbredValorContabil.Value = 0 Then
            redPercLivre2.Value := 0
         Else
            redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;
      End;

   btnBuscaBem.SetFocus;
End;

Procedure TfrmCadRegPenhora.DBedBemChange(Sender: TObject);
Begin
   Inherited;
   If (dbedBem.Text = '') Then
      Begin
         dbedPlaca.DataSource := Nil;
         If (dblcConjunto.Text = '') Then
            Begin
               dbedDataContabil.Text := '';
               dbredValorContabil.Value := 0;
               redValorPenhorado2.Value := 0;
               redValorLivre2.Value := 0;
               redPercLivre2.Value := 0;
            End;
      End
   Else
      Begin
         dbedPlaca.DataSource := dsBem;
         dbedDataContabil.Text := sData;
         dbredValorContabil.Value := dValor;
         redValorPenhorado2.Value := dSalva;
         redValorLivre2.Value := max(0, dbredValorContabil.Value - redValorPenhorado2.Value);
         If dbredValorContabil.Value = 0 Then
            redPercLivre2.Value := 0
         Else
            redPercLivre2.Value := redValorLivre2.Value / dbredValorContabil.Value * 100;
      End;
End;

Procedure TfrmCadRegPenhora.btnLimpaBemClick(Sender: TObject);
Begin
   Inherited;
   CdsEtapa.FieldByName('IDBEM').Clear;
   CdsEtapa.FieldByName('IDPESSOA').Clear;
   DBedBem.Text := '';
End;

End.

