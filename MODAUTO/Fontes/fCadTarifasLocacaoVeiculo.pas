//******************************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 13/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Cadastro de Locação de veículos
//******************************************************************************************
Unit fCadTarifasLocacaoVeiculo;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
   Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, wwdblook,
   Wwdotdot, Wwdbcomb, Mask, wwdbedit, uCmSqlParams,
   uCtrlDstTarifa, TREdit, wwdbdatetimepicker, CMDateTimePicker, uCtrlMoeda,
   CMProcura, Wwkeycb;

Type
   TfrmCadTarifasLocacaoVeiculos = Class(TFrmCadastroMestreDetMT)
      dbedDescricao: TwwDBEdit;
      lblDescricao: TLabel;
      qryValores: TCMSqlParams;
      tsCargo: TTabSheet;
      cdsMoeda: TCMClientDataSet;
      cdsValores: TCMClientDataSet;
      cdsValoresIDDSTTARIFA: TFloatField;
      cdsValoresDATADSTVALORES: TDateTimeField;
      cdsValoresVLRDST: TFloatField;
      qryTarifas: TCMSqlParams;
      cdsTarifaXCargo_NS: TCMClientDataSet;
      dsTarifaXCargo_NS: TwwDataSource;
      cdsTarifaXCargo_S: TCMClientDataSet;
      dsTarifaXCargo_S: TwwDataSource;
      pnlAssociacao: TPanel;
      pnlNaoAssociados: TPanel;
      pnlAssociados: TPanel;
      pnlBotoesAssociacao: TPanel;
      sbtnAdicionarTudo: TSpeedButton;
      sbtnAdicionar: TSpeedButton;
      sbtnRemover: TSpeedButton;
      sbtnRemoverTudo: TSpeedButton;
      gridCNA: TwwDBGrid;
      gridCA: TwwDBGrid;
      Splitter1: TSplitter;
      Panel2: TPanel;
      Panel3: TPanel;
      qryCargosNS: TCMSqlParams;
      qryCargoS: TCMSqlParams;
      CMSqlParams1: TCMSqlParams;
      cdsMoedaMOECODIGO: TFloatField;
      cdsMoedaMOEDESC: TStringField;
      cdsMoedaMOESIGLA: TStringField;
      cdsTarifaXCargo_SIDCARGO: TFloatField;
      cdsTarifaXCargo_STITULO: TStringField;
      cdsTarifaXCargo_SIDDSTTARIFA: TFloatField;
      CmeDetalheCargoSelecionado: TCmEventosCadastro;
      cdsValoresTIPOLOCAL: TStringField;
      cdsValoresMOECODIGO: TFloatField;
      Label4: TLabel;
      Label5: TLabel;
      Label2: TLabel;
      dbDtVigencia: TCMDateTimePicker;
      dbValor1: TDBRealEdit;
      DBlkpMoeda: TwwDBLookupCombo;
      CdsIDDSTTARIFA: TFloatField;
      CdsMOECODIGO: TFloatField;
      CdsDESCRICAO: TStringField;
      CdsINDTIPO: TFloatField;
      cdsValoresDSC_LOCAL: TStringField;
      cdsValoresMOESIGLA: TStringField;
      cdsValoresMOEDESC: TStringField;
      SqlMoeda: TCMSqlParams;
      dbrgLocal: TDBRadioGroup;
      cdsValoresIDDSTAEROPORTO: TFloatField;
      DBRadioGroup2: TDBRadioGroup;
      Label1: TLabel;
      dbValor2: TDBRealEdit;
      Label6: TLabel;
      dbValor5: TDBRealEdit;
      Label7: TLabel;
      dbValor4: TDBRealEdit;
      Label8: TLabel;
      dbValor3: TDBRealEdit;
      Shape1: TShape;
      Label3: TLabel;
      Shape2: TShape;
      Label9: TLabel;
      CdsTIPOGRUPOVEICULO: TStringField;
      cdsValoresVLCONTROLADODIARIA: TFloatField;
      cdsValoresVLCONTROLADOKMRODADO: TFloatField;
      cdsValoresVLKMLIVREDIARIA: TFloatField;
      cdsValoresVLKMLIVRESEMANA: TFloatField;
      cdsValoresVLKMLIVREDIAEXTRA: TFloatField;
      Panel1: TPanel;
      isPesquisaCargo: TwwIncrementalSearch;
      Procedure FormCreate(Sender: TObject);
      Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroFind(Sender: TObject);
      Procedure sbtnAdicionarClick(Sender: TObject);
      Procedure sbtnRemoverClick(Sender: TObject);
      Procedure sbtnAdicionarTudoClick(Sender: TObject);
      Procedure sbtnRemoverTudoClick(Sender: TObject);
      Procedure CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
      Procedure CmeDetalheAtualizaBotoes(Sender: TObject);
      Procedure cdsTarifaXCargo_NSAfterScroll(DataSet: TDataSet);
      Procedure cdsTarifaXCargo_SAfterScroll(DataSet: TDataSet);
      Procedure CmeCadastroAfterConfirma(Sender: TObject);
      Procedure CmeCadastroBeforeConfirma(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroInsert(Sender: TObject);
      Procedure CmeDetalheCargoSelecionadoAtualizaBotoes(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnInsDetClick(Sender: TObject);
      Procedure sbtnAltDetClick(Sender: TObject);
      Procedure bbtnOkDetClick(Sender: TObject);
      Procedure bbtnCancelarDetClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure pgctrlDetalheChange(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroCancel(Sender: TObject);
   Private
      idDstTarifa: Integer;
      iIndTipo: Integer;
      ctrlDstTarifa: TCtrlDSTTarifa;
      ctrlMoeda: TCtrlMoeda;
      Procedure CarregaConsulta(Const idTarifa, idIndTipo: Integer);
      Procedure adicionarCargo(Const Todos: Boolean = False);
      Procedure removerCargo(Const Todos: Boolean = False);
      Procedure atualizarBotaoCargo;
   Public
      { Public declarations }
   End;

Var
   frmCadTarifasLocacaoVeiculos: TfrmCadTarifasLocacaoVeiculos;

Implementation

{$R *.DFM}

Uses uCtrlPadroes, DBaseDados, uSistema, uMensErro, uCMTypes;

Procedure TfrmCadTarifasLocacaoVeiculos.FormCreate(Sender: TObject);
Begin
   Inherited;
   // Inicializa o Controlador Principal
   ctrlDstTarifa := TCtrlDstTarifa.Create;
   ctrlDstTarifa.Initialize
      (
      DtmBaseDados.DbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True);
   cds.Data := ctrlDstTarifa.ListTarifa(-2);
   cdsValores.Data := ctrlDstTarifa.ListValores(-1);

   // Inicializa o Controlador de MOEDA e carrega o CDS
   ctrlMoeda := TCtrlMoeda.Create;
   ctrlMoeda.InitializeAs(Padroes);
   cdsMoeda.Data := ctrlMoeda.ListaMoeda;

   // Completa a referência do controlador, vinculando os CDS's da TELA
   // aos CDS's do Controlador
   ctrlDstTarifa.CdsDstTarifa := cds;
   ctrlDstTarifa.CdsDstValores := cdsValores;
   ctrlDstTarifa.cdsDstTarifaXCargo := cdsTarifaXCargo_S;

   pnlControlesDet.Enabled := False;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   Accept := ctrlDstTarifa.GravarDstTarifa;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   // se houve busca, abre a query principal com apenas o registro selecionado
   With MontaSelect Do
      Begin
         If retornouValor Then
            Begin
               // Recolhe os valores de retorno
               If (ValoresChave[0] <> '') Then
                  idDstTarifa := StrToInt(ValoresChave[0]);

               If (ValoresChave[1] <> '') Then
                  iIndTipo := StrToInt(ValoresChave[1]);

               // Carrega CDS's com base nos valores de retorno
               CarregaConsulta(idDstTarifa, iIndTipo);
               //
               pgctrlDetalhe.ActivePage := tbsDet;
               tbcDetalhe.TabIndex := 0;
            End;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnAdicionarClick(Sender: TObject);
Begin
   adicionarCargo;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnRemoverClick(Sender: TObject);
Begin
   removerCargo;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnAdicionarTudoClick(Sender: TObject);
Begin
   adicionarCargo(True);
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnRemoverTudoClick(Sender: TObject);
Begin
   removerCargo(True);
End;

Procedure TfrmCadTarifasLocacaoVeiculos.CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   If ctrlDstTarifa.existeFilho(idDstTarifa) Then
      Begin
         MsgDlg('Não é possível excluir esta tarifa.' + #13 +
            'Exitem valores/cargos dependentes. ', 'Aviso', mtWarning, [mbOk], 0);
         Accept := False;
      End
   Else
      CmeCadastroApplyInsert(sender, accept);
End;

Procedure TfrmCadTarifasLocacaoVeiculos.CmeDetalheAtualizaBotoes(Sender: TObject);
Begin
   Inherited;
   atualizarBotaoCargo;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.cdsTarifaXCargo_NSAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   CmeDetalheAtualizaBotoes(Self);
End;

Procedure TfrmCadTarifasLocacaoVeiculos.cdsTarifaXCargo_SAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   CmeDetalheAtualizaBotoes(Self);
End;

Procedure TfrmCadTarifasLocacaoVeiculos.CmeCadastroAfterConfirma(Sender: TObject);
Begin
   Inherited;
   // Recarrega o cds com o registro após a edição ( bug do padrão )
   If cmeCadastro.Operacao = opAlterar Then
      CarregaConsulta(idDstTarifa, iIndTipo)
   Else
      If cmeCadastro.Operacao = opInserir Then
         Begin
            CarregaConsulta(ctrlDstTarifa.IdTarifa, 4);
            idDstTarifa := ctrlDstTarifa.IdTarifa;
         End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.CarregaConsulta(Const idTarifa, idIndTipo: Integer);
Begin
   Cds.Data := ctrlDstTarifa.ListTarifa(idTarifa);
   cdsValores.Data := ctrlDstTarifa.ListValores(idTarifa);
End;

Procedure TfrmCadTarifasLocacaoVeiculos.CmeCadastroBeforeConfirma(sender: TObject;
   Var Accept: Boolean);
Begin
   If (trim(dbedDescricao.Text) = '') Then
      Begin
         MsgDlg('Descrição é obrigatória !', 'Informação', mtInformation, [mbOk], 0);
         dbedDescricao.setfocus;
         exit;
      End;

   Inherited;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   CarregaConsulta(-2, -1);
End;

Procedure TfrmCadTarifasLocacaoVeiculos.AdicionarCargo(Const Todos: Boolean = False);

   Procedure Adicionar;
   Begin
      // inclui o registro no grid de Associados e exclui de Não-Associado
      gridCA.DataSource.DataSet.Append;
      gridCA.DataSource.DataSet.FieldByName('IDDSTTARIFA').AsInteger := idDstTarifa;
      gridCA.DataSource.DataSet.FieldByName('IDCARGO').AsInteger :=
         gridCNA.DataSource.DataSet.FieldByName('IDCARGO').AsInteger;
      gridCA.DataSource.DataSet.FieldByName('TITULO').AsString :=
         gridCNA.DataSource.DataSet.FieldByName('TITULO').AsString;
      gridCA.DataSource.DataSet.Post;
      If Not Todos Then
         gridCNA.DataSource.DataSet.Delete;
   End;

Begin
   If Not (cds.State In [dsInsert, dsEdit]) Then
      exit;

   If todos Then
      Begin
         gridCNA.DataSource.DataSet.DisableControls;
         gridCA.DataSource.DataSet.DisableControls;
      End;

   gridCNA.DataSource.DataSet.First;
   While Not gridCNA.DataSource.DataSet.Eof Do
      Begin
         If todos Then
            Adicionar
         Else
            If gridCNA.IsSelectedRecord Then
               Adicionar;

         gridCNA.DataSource.DataSet.Next;
      End;

   If todos Then
      TCMClientDataSet(gridCNA.DataSource.DataSet).EmptyDataSet;

   gridCA.DataSource.DataSet.First;
   gridCNA.DataSource.DataSet.First;

   If todos Then
      Begin
         gridCNA.DataSource.DataSet.EnableControls;
         gridCA.DataSource.DataSet.EnableControls;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.RemoverCargo(Const Todos: Boolean = False);

   Procedure Remover;
   Begin
      // inclui o registro no grid de Não-Associado e exclui de Associado
      gridCNA.DataSource.DataSet.Append;
      gridCNA.DataSource.DataSet.FieldByName('IDCARGO').AsInteger :=
         gridCA.DataSource.DataSet.FieldByName('IDCARGO').AsInteger;
      gridCNA.DataSource.DataSet.FieldByName('TITULO').AsString :=
         gridCA.DataSource.DataSet.FieldByName('TITULO').AsString;
      gridCNA.DataSource.DataSet.Post;
      If Not todos Then
         gridCA.DataSource.DataSet.Delete;
   End;

Begin
   If Not (cds.State In [dsInsert, dsEdit]) Then
      exit;

   If todos Then
      Begin
         gridCNA.DataSource.DataSet.DisableControls;
         gridCA.DataSource.DataSet.DisableControls;
      End;

   gridCA.DataSource.DataSet.First;
   While Not gridCA.DataSource.DataSet.Eof Do
      Begin
         If todos Then
            Remover
         Else
            If gridCA.IsSelectedRecord Then
               Remover;
         gridCA.DataSource.DataSet.Next;
      End;

   If todos Then
      TCMClientDataSet(gridCA.DataSource.DataSet).EmptyDataSet;

   gridCA.DataSource.DataSet.First;
   gridCNA.DataSource.DataSet.First;

   If todos Then
      Begin
         gridCNA.DataSource.DataSet.EnableControls;
         gridCA.DataSource.DataSet.EnableControls;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.atualizarBotaoCargo;
Begin
   If cds.State In [dsInsert, dsEdit] Then
      Begin
         If (cdsTarifaXCargo_NS.IsEmpty) And
            ((cds.State In [dsInsert, dsEdit])) Then
            Begin
               sbtnAdicionar.Enabled := False;
               sbtnAdicionarTudo.Enabled := False;
            End
         Else
            Begin
               sbtnAdicionar.Enabled := True;
               sbtnAdicionarTudo.Enabled := True;
            End;

         If (cdsTarifaXCargo_S.IsEmpty) And
            ((cds.State In [dsInsert, dsEdit])) Then
            Begin
               sbtnRemover.Enabled := False;
               sbtnRemoverTudo.Enabled := False;
            End
         Else
            Begin
               sbtnRemover.Enabled := True;
               sbtnRemoverTudo.Enabled := True;
            End;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.CmeDetalheCargoSelecionadoAtualizaBotoes(Sender: TObject);
Begin
   Inherited;
   atualizarBotaoCargo;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.bbtnConfirmarClick(Sender: TObject);
Begin
   If dbedDescricao.Text = '' Then
      Begin
         MsgDlg('Descrição do Perfil deve ser preenchida !', 'Atenção !', mtInformation, [mbOk], 0);
         dbedDescricao.setfocus;
         exit;
      End;

   If cds.State = dsInsert Then
      cds.FieldByName('INDTIPO').AsInteger := 4; // Locação de Veículos

   Inherited;      
   tbcDetalhe.Enabled := True;
   dbgrdDet.Enabled := True;
   pnlControlesDet.Enabled := False;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnInserirClick(Sender: TObject);
Begin
   Inherited;
   CmeCadastro.RepetirInsert := False;
   tbcDetalhe.Enabled := False;
   dbedDescricao.setfocus;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnAlterarClick(Sender: TObject);
Begin
   If Not cds.isempty Then
      Begin
         If cds.fieldbyname('IDDSTTARIFA').asInteger <> 0 Then
            CarregaConsulta(cds.fieldbyname('IDDSTTARIFA').asInteger, 4);

         Inherited;
         tbcDetalhe.Enabled := True;         
         dbedDescricao.setfocus;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnInsDetClick(Sender: TObject);
Begin
   Inherited;
   CmeDetalhe.RepetirInsert := False;
   pnlMestre.Enabled := False;   
   pnlControlesDet.Enabled := True;
   dbgrdDet.Enabled := False;
   dbrgLocal.Itemindex := 0; // Pais
   cdsValoresMOECODIGO.asInteger := 1; // R$
   dbDtVigencia.setfocus;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnAltDetClick(Sender: TObject);
Begin
   Inherited;
   pnlControlesDet.Enabled := True;
   pnlMestre.Enabled := False;   
   dbgrdDet.Enabled := False;
   dbDtVigencia.setfocus;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.bbtnOkDetClick(Sender: TObject);
Var sDataAval: String;
   DataAval: TDateTime;
Begin
   If dbDtVigencia.Text <> '' Then
      Begin
         DataAval := ctrlDstTarifa.LocalizaMaiorVigencia(idDstTarifa, iIndTipo, cdsValores.fieldbyname('TIPOLOCAL').asString);
         If DataAval > 0 Then
            Begin  
               If (dbDtVigencia.Text <= sDataAval) And (CdsValores.state = dsinsert) Or
                  (dbDtVigencia.Text < sDataAval) And (CdsValores.state = dsedit) Then
                  Begin
                     MsgDlg('Data tem que ser maior que a última Data de Vigência !', 'Atenção !', mtInformation, [mbOk], 0);
                     dbDtVigencia.setfocus;
                     exit;
                  End;
            End;
      End
   Else
      Begin
         MsgDlg('Data de Vigência não informada !', 'Atenção !', mtInformation, [mbOk], 0);
         dbDtVigencia.setfocus;
         exit;
      End;

   If DBlkpMoeda.Text = '' Then
      Begin
         MsgDlg('Moeda deve ser preenchida !', 'Atenção !', mtInformation, [mbOk], 0);
         DBlkpMoeda.setfocus;
         exit;
      End;

   If dbValor1.Value = 0 Then
      Begin
         MsgDlg('Km Controlado - Diária deve ser preenchido !', 'Atenção !', mtInformation, [mbOk], 0);
         dbValor1.setfocus;
         exit;
      End;

   If dbValor2.Value = 0 Then
      Begin
         MsgDlg('Km Controlado - Km Rodado deve ser preenchido !', 'Atenção !', mtInformation, [mbOk], 0);
         dbValor2.setfocus;
         exit;
      End;

   If dbValor3.Value = 0 Then
      Begin
         MsgDlg('Km Livre - Diária deve ser preenchido !', 'Atenção !', mtInformation, [mbOk], 0);
         dbValor3.setfocus;
         exit;
      End;

   If dbValor4.Value = 0 Then
      Begin
         MsgDlg('Km Livre - Semana deve ser preenchido !', 'Atenção !', mtInformation, [mbOk], 0);
         dbValor4.setfocus;
         exit;
      End;

   If dbValor5.Value = 0 Then
      Begin
         MsgDlg('Km Livre - Dia Extra deve ser preenchido !', 'Atenção !', mtInformation, [mbOk], 0);
         dbValor5.setfocus;
         exit;
      End;

   Inherited;
   pnlMestre.Enabled := True;   
   dbgrdDet.Enabled := True;
   pnlControlesDet.Enabled := False;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.bbtnCancelarDetClick(Sender: TObject);
Begin
   Inherited;
   pnlMestre.Enabled := True;   
   dbgrdDet.Enabled := True;
   pnlControlesDet.Enabled := False;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   dbgrdDet.Enabled := True;
   pnlControlesDet.Enabled := False;
   CarregaConsulta(idDstTarifa, iIndTipo);
End;

Procedure TfrmCadTarifasLocacaoVeiculos.pgctrlDetalheChange(Sender: TObject);
Begin
   Inherited;
   If pgctrlDetalhe.ActivePageIndex = 1 Then
      isPesquisaCargo.setfocus;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnApagarClick(Sender: TObject);
Begin
   If Not cds.isEmpty Then
      Begin
         Inherited;
         CarregaConsulta(-2, -1);
      End;    
End;

procedure TfrmCadTarifasLocacaoVeiculos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   If Assigned(ctrlDstTarifa) Then
      FreeAndNil(ctrlDstTarifa);
   If Assigned(ctrlMoeda) Then
      FreeAndNil(ctrlMoeda);
  inherited;
   Action := caFree;  
end;

procedure TfrmCadTarifasLocacaoVeiculos.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   // Recarrega o cds com o registro após a edição ( bug do padrão )
   If cmeCadastro.Operacao = opAlterar Then
      CarregaConsulta(idDstTarifa, iIndTipo)
   Else
      If cmeCadastro.Operacao = opInserir Then
         Begin
            CarregaConsulta(ctrlDstTarifa.IdTarifa, 4);
            idDstTarifa := ctrlDstTarifa.IdTarifa;
         End;
end;

End.

