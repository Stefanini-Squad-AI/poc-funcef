unit fCadObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdblook, CMDBLookupCombo, Spin, TREdit, CMTree, wwdbedit,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList,
  wwriched;

type
  TfrmCadObra = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label3: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label13: TLabel;
    treeCentroCusto: TCMTreeView;
    dbeCentroCusto: TwwDBEdit;
    bbtnTreeCcusto: TBitBtn;
    qrySelCCusto: TwwQuery;
    dsSelCCusto: TwwDataSource;
    qrySelCCustoCODCENTROCUSTO: TStringField;
    qrySelCCustoNOME: TStringField;
    qryParamGlobal: TwwQuery;
    qryParamGlobalMASCARACC: TStringField;
    qryTreeCCusto: TwwQuery;
    dsTreeCCusto: TwwDataSource;
    qryTreeCCustoIDEMPRESA: TFloatField;
    qryTreeCCustoCODCENTROCUSTO: TStringField;
    qryTreeCCustoNOME: TStringField;
    qryTreeCCustoTIPO: TStringField;
    Label14: TLabel;
    dbeParticipacao: TDBRealEdit;
    GroupBox1: TGroupBox;
    lblCentroCusto: TLabel;
    Label7: TLabel;
    MSSubConta: TMontaSelect;
    MSAtivProjeto: TMontaSelect;
    dsAtivProj: TwwDataSource;
    dsSubConta: TwwDataSource;
    dsGrupo: TwwDataSource;
    qrySelGrupo: TwwQuery;
    qrySelGrupoNOME: TStringField;
    qrySelGrupoIDGRUPO: TFloatField;
    qrySelGrupoDEPRECIACAO: TFloatField;
    qrySelGrupoULTIDBEM: TFloatField;
    qrySelGrupoCLASSE: TStringField;
    qrySelGrupoFLGSEMPLACA: TFloatField;
    qrySelSubConta: TwwQuery;
    qrySelSubContaNOMESUBCONTA: TStringField;
    qrySelSubContaIDPESSOA: TFloatField;
    qrySelSubContaCODSUBCONTA: TFloatField;
    qrySelAtivProj: TwwQuery;
    qrySelAtivProjNOME: TStringField;
    qrySelAtivProjUNECODIGO: TStringField;
    qrySelAtivProjUNIDNEGOC: TFloatField;
    qrySelAtivProjIDPESSOA: TFloatField;
    MSGrupos: TMontaSelect;
    Label8: TLabel;
    edDescGrupo: TwwDBEdit;
    bbtnSelGrupo: TBitBtn;
    Label18: TLabel;
    edDescSubConta: TwwDBEdit;
    bbtnSelSubConta: TBitBtn;
    Label17: TLabel;
    edAtivProjeto: TwwDBEdit;
    bbtnSelAtivProjeto: TBitBtn;
    Label2: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    qryObraLanc: TwwQuery;
    qryObraLancIDOBRALANC: TFloatField;
    qryDetIDCAFOBRA: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetIDEMPRESA: TFloatField;
    qryDetPARTICIPACAO: TFloatField;
    qryDetDESCCCUSTO: TStringField;
    qryIDCAFOBRA: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDGRUPO: TFloatField;
    qryCODSUBCONTA: TFloatField;
    qryUNIDNEGOC: TFloatField;
    qryDESCCAFOBRA: TStringField;
    qryDTAINICIOOBRA: TDateTimeField;
    qryDTAENCERRAOBRA: TDateTimeField;
    qryFLGOBRA: TFloatField;
    qryIDMODULO: TFloatField;
    qryIDTIPOCUSTORECIMO: TFloatField;
    qryIDIMOVEL: TFloatField;
    dbeDescObra: TwwDBRichEdit;
    qryTreeCCustoCODEXTERNO: TStringField;
    qrySelCCustoCODEXTERNO: TStringField;
    qryDetCODEXTERNO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnTreeCcustoClick(Sender: TObject);
    procedure treeCentroCustoDblClick(Sender: TObject);
    procedure treeCentroCustoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnSelAtivProjetoClick(Sender: TObject);
    procedure bbtnSelSubContaClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    bInsert   : Boolean;
    bTstConf  : Boolean;
    //------------------------------------------------------------------------------------
    Procedure SelMestreDet( n : LongInt );
  public
    { Public declarations }
  end;

var
  frmCadObra : TfrmCadObra;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uDataBase, dBaseDados;

procedure TfrmCadObra.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Prepare;
   qryDet.Prepare;
   qrySelGrupo.Prepare;
   qrySelSubConta.Prepare;
   qrySelAtivProj.Prepare;
   qrySelCCusto.Prepare;
   qryTreeCCusto.Prepare;
   qryObraLanc.Prepare;
   //-------------------------------------------------------------------------------------
   SelMestreDet(-1);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('CAFOBRA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   qryParamGlobal.Close;
   qryParamGlobal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryParamGlobal.Open;
   //-------------------------------------------------------------------------------------
   qryTreeCCusto.Close;
   qryTreeCCusto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryTreeCCusto.Open;
   treeCentroCusto.Mascara := qryParamGlobalMASCARACC.AsString;
   qrySelCCustoCODCENTROCUSTO.EditMask := trim(qryParamGlobalMASCARACC.AsString)+ ';0;_';
   qryDetCODCENTROCUSTO.EditMask := trim(qryParamGlobalMASCARACC.AsString)+ ';0;_';
   treeCentroCusto.MontaArvore;
   qryParamGlobal.Close;
end;
//========================================================================================
procedure TfrmCadObra.SelMestreDet( n : LongInt );
begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;
   //-------------------------------------------------------------------------------------
   qrySelGrupo.Close;
   qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := qryIDGRUPO.AsInteger;
   qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelGrupo.Open;
   //-------------------------------------------------------------------------------------
   qrySelAtivProj.Close;
   qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := qryUNIDNEGOC.AsInteger;
   qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
   qrySelAtivProj.Open;
   //-------------------------------------------------------------------------------------
   qrySelSubConta.Close;
   qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := qryCODSUBCONTA.AsInteger;
   qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelSubConta.Open;
   //-------------------------------------------------------------------------------------
   qryDet.Close;
   qryDet.ParamByName('PIDCAFOBRA').Value := n;
   qryDet.Open;
end;
//========================================================================================
procedure TfrmCadObra.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSGrupos.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelGrupo.Close;
   if MSGrupos.RetornouValor then
   begin
      qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := StrToInt(MSGrupos.ValoresChave[0]);
      qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelGrupo.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadObra.bbtnSelAtivProjetoClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSAtivProjeto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSAtivProjeto.RetornouValor then
   begin
      qrySelAtivProj.Close;
      qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := StrToInt(MSAtivProjeto.ValoresChave[0]);
      qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
      qrySelAtivProj.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadObra.bbtnSelSubContaClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSSubConta.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSSubConta.RetornouValor then
   begin
      qrySelSubConta.Close;
      qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := StrToInt(MSSubConta.ValoresChave[0]);
      qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelSubConta.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadObra.CmeCadastroInsert(Sender: TObject);
begin
   bInsert := True;
   SelMestreDet(-1);
   inherited;
   qryDTAINICIOOBRA.asDateTime := Date;
   dbeDescObra.SetFocus;
end;
//========================================================================================
procedure TfrmCadObra.CmeCadastroEdit(Sender: TObject);
begin
   bInsert := False;
   inherited;
   //-------------------------------------------------------------------------------------
   // Solução de contorno do erro de conceito do padrão
   //-------------------------------------------------------------------------------------
   qrySelGrupo.Close;
   qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := qryIDGRUPO.AsInteger;
   qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelGrupo.Open;
   //-------------------------------------------------------------------------------------
   qrySelAtivProj.Close;
   qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := qryUNIDNEGOC.AsInteger;
   qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
   qrySelAtivProj.Open;
   //-------------------------------------------------------------------------------------
   qrySelSubConta.Close;
   qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := qryCODSUBCONTA.AsInteger;
   qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelSubConta.Open;
   //-------------------------------------------------------------------------------------
   dbeDescObra.SetFocus;
end;
//========================================================================================
procedure TfrmCadObra.CmeCadastroDelete(Sender: TObject);
begin
   qryDet.First;
   while Not qryDet.EOF Do
   begin
      qryDet.Delete;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
end;
//========================================================================================
procedure TfrmCadObra.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
end;
//========================================================================================
Procedure TfrmCadObra.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var
   fTotPerc : Double;

begin
   Accept := True;
   if (trim(dbeDescObra.Text) = '') then
   begin
      MsgDlg('Descrição da obra não foi preenchida','Erro',mtError,[mbOK],0);
      dbeDescObra.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(edDescGrupo.Text) = '') then
   begin
       MsgDlg('Grupo Contábil não foi preenchido','Erro',mtError,[mbOK],0);
       edDescGrupo.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   begin
      fTotPerc := 0;
      qryDet.First;
      while not qryDet.EOF do
      begin
         fTotPerc := fTotPerc + qryDetPARTICIPACAO.asFloat;
         qryDet.Next;
      end;
      if (fTotperc <> 100) then
      begin
         MsgDlg('Soma dos Rateios de Custo está em ' + FloatToStr(fTotPerc) +
                '% e deveria ser 100% ','Erro',mtError,[mbOK],0);
         Accept := False;
      end;
   end;
   //-------------------------------------------------------------------------------------
   bTstConf := Accept;
end;
//========================================================================================
procedure TfrmCadObra.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   qrySelCCusto.Close;
   qrySelCCusto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qrySelCCusto.ParamByName('PCODCENTROCUSTO').Clear;
   qrySelCCusto.Open;
   lblCentroCusto.Caption := qrySelCCustoNOME.AsString;
   //-------------------------------------------------------------------------------------
   bbtnTreeCCusto.SetFocus;
end;
//========================================================================================
procedure TfrmCadObra.CmeDetalheEdit(Sender: TObject);
begin
   qrySelCCusto.Close;
   qrySelCCusto.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
   qrySelCCusto.ParamByName('PCODCENTROCUSTO').AsString := qryDetCODCENTROCUSTO.AsString;
   qrySelCCusto.Open;
   lblCentroCusto.Caption := qrySelCCustoNOME.AsString;
   inherited;
   dbeParticipacao.SetFocus;
end;
//========================================================================================
procedure TfrmCadObra.CmeDetalheDelete(Sender: TObject);
begin
   qrySelCCusto.Close;
   qrySelCCusto.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
   qrySelCCusto.ParamByName('PCODCENTROCUSTO').AsString := qryDetCODCENTROCUSTO.AsString;
   qrySelCCusto.Open;
   lblCentroCusto.Caption := qrySelCCustoNOME.AsString;
   //-------------------------------------------------------------------------------------
   if (MsgDlg('Confirma a Remoção do Centro de Custo do Rateio','Remoção',
             mtConfirmation,[mbOk,mbCancel],0) = mrOk) then
      inherited;
end;
//========================================================================================
Procedure TfrmCadObra.CmeDetalheConfirma(Sender: TObject);
Begin
   if (qryDet.State in [dsInsert,dsEdit]) then
   begin
      if (trim(dbeCentroCusto.Text) = '') Then
      begin
         MsgDlg('Centro de Custo não foi Selecionado','Erro',mtError,[mbOK],0);
         bbtnTreeCCusto.SetFocus;
      end else
      if (dbeParticipacao.Value = 0) then
      begin
          MsgDlg('Percentual não foi preenchido','Erro',mtError,[mbOK],0);
          dbeParticipacao.SetFocus;
      end else
      begin
         qryDetIDPESSOA.AsInteger      := Sistema.IdEmpresa;
         qryDetIDEMPRESA.AsInteger     := Sistema.IdEmpresa;
         qryDetCODCENTROCUSTO.AsString := qrySelCCustoCODCENTROCUSTO.AsString;
         qryDetDESCCCUSTO.AsString     := qrySelCCustoNOME.AsString;
         qryDetCODEXTERNO.AsString     := qrySelCCustoCODEXTERNO.AsString;
         inherited;
      end;
   end else
   begin
      inherited;
   end;
end;
//========================================================================================
procedure TfrmCadObra.bbtnConfirmarClick(Sender: TObject);
Var
   bResult : Boolean;
begin
   CmeCadastro.BeforeConfirma(Self,bResult);
   if bResult then
   begin
      inherited;
      if ( bInsert ) And ( bTstConf ) Then
         SelMestreDet(-1);
   end;
end;
//========================================================================================
procedure TfrmCadObra.CmeCadastroConfirma(Sender: TObject);
begin
   if (qry.State in [dsInsert,dsEdit]) then
   begin
      try
         StartTransacao;
         //-------------------------------------------------------------------------------
         if qry.State = dsInsert then
         begin
            qry.FieldByName('IDCAFOBRA').AsInteger := LeUltRegistro(nil,'CAFOBRA');
            qry.FieldByName('FLGOBRA').AsInteger   := 0;
         end;   
         //-------------------------------------------------------------------------------
         qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
         qry.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
         qry.FieldByName('IDGRUPO').AsInteger  := qrySelGrupo.FieldByName('IDGRUPO').AsInteger;
         //-------------------------------------------------------------------------------
         if edAtivProjeto.Text = '' then
            qry.FieldByName('UNIDNEGOC').Clear
         else
            qry.FieldByName('UNIDNEGOC').AsInteger := qrySelAtivProj.FieldByName('UNIDNEGOC').AsInteger;
         //-------------------------------------------------------------------------------
         if edDescSubConta.Text = '' then
            qry.FieldByName('CODSUBCONTA').Clear
         else
            qry.FieldByName('CODSUBCONTA').AsInteger := qrySelSubConta.FieldByName('CODSUBCONTA').AsInteger;
         //-------------------------------------------------------------------------------
         qryDet.First;
         while not qryDet.EOF do
         begin
            qryDet.Edit;
            qryDetIDCAFOBRA.AsInteger := qry.FieldByName('IDCAFOBRA').asInteger;
            qryDet.Next;
         end;
         //-------------------------------------------------------------------------------
         qry.ApplyUpdates;
         qryDet.ApplyUpdates;
         CommitTransacao;
      except
         RollbackTransacao;
         Abort;
      end;
   end else
   begin
      qryDet.ApplyUpdates;
      qry.ApplyUpdates;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmCadObra.bbtnTreeCcustoClick(Sender: TObject);
begin
   inherited;
   treeCentroCusto.Visible := not treeCentroCusto.Visible;
   if treeCentroCusto.Visible then
      treeCentroCusto.SetFocus;
end;
//========================================================================================
procedure TfrmCadObra.treeCentroCustoDblClick(Sender: TObject);
begin
   inherited;
   if qryTreeCCustoTIPO.AsString = 'A' then
   begin
      treeCentroCusto.Visible := False;
      dbeCentroCusto.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmCadObra.treeCentroCustoExit(Sender: TObject);
begin
   inherited;
   treeCentroCusto.Visible := False;
   qrySelCCusto.Close;
   qrySelCCusto.ParamByName('PCODCENTROCUSTO').AsString := qryTreeCCustoCODCENTROCUSTO.AsString;
   qrySelCCusto.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
   qrySelCCusto.Open;
   lblCentroCusto.Caption := qrySelCCustoNOME.AsString;
   dbeCentroCusto.SetFocus;
end;
//========================================================================================
procedure TfrmCadObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryDet.Close;
   qrySelGrupo.Close;
   qrySelAtivProj.Close;
   qrySelSubConta.Close;
   qrySelCCusto.Close;
   qryTreeCCusto.Close;
   qryObraLanc.CLose;
   qry.UnPrepare;
   qryDet.UnPrepare;
   qrySelGrupo.UnPrepare;
   qrySelAtivProj.UnPrepare;
   qrySelSubConta.UnPrepare;
   qrySelCCusto.UnPrepare;
   qryTreeCCusto.UnPrepare;
   qryObraLanc.UnPrepare;
end;
//========================================================================================
procedure TfrmCadObra.sbtnInsDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   dbeCentroCusto.Enabled := True;
   bbtnTreeCCusto.Enabled := True;
   inherited;
end;
//========================================================================================
procedure TfrmCadObra.sbtnAltDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   dbeCentroCusto.Enabled := False;
   bbtnTreeCCusto.Enabled := False;
   inherited;
end;
//========================================================================================
procedure TfrmCadObra.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadObra.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadObra.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadObra.sbtnAlterarClick(Sender: TObject);
begin
   qryObraLanc.Close;
   qryObraLanc.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qryObraLanc.ParamByName('PIDCAFOBRA').AsInteger := qry.FieldByName('IDCAFOBRA').AsInteger;
   qryObraLanc.Open;
   //-------------------------------------------------------------------------------------
//   if not qryObraLanc.IsEmpty then
//   begin
//      MsgDlg('Alteração não será permitida. Existem Lançamentos associados a esta Obra',
//             'Erro',mtError,[mbOK],0);
//      sbtnAlterar.Down := False;
//      bbtnCancelar.Click;
//      exit;
//   end else
//   begin
      qrySelGrupo.Close;
      qrySelAtivProj.Close;
      qrySelSubConta.Close;
      inherited;
//   end;
end;
//========================================================================================
procedure TfrmCadObra.sbtnApagarClick(Sender: TObject);
begin
   qryObraLanc.Close;
   qryObraLanc.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qryObraLanc.ParamByName('PIDCAFOBRA').AsInteger := qry.FieldByName('IDCAFOBRA').AsInteger;
   qryObraLanc.Open;
   //-------------------------------------------------------------------------------------
   if not qryObraLanc.IsEmpty then
   begin
      MsgDlg('Exclusão não será permitida. Existem Lançamentos associados a esta Obra',
             'Erro',mtError,[mbOK],0);
      sbtnApagar.Down := False;
      bbtnCancelar.Click;
      exit;
   end else
   begin
      qrySelGrupo.Close;
      qrySelAtivProj.Close;
      qrySelSubConta.Close;
      inherited;
   end;
end;

end.
