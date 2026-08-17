unit fMovSaidaTemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdblook, CMDBLookupCombo, Spin, TREdit, CMTree, wwdbedit,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList
  {$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmMovSaidaTemp = class(TfrmCadMestreDetalheCS)
    qryLocal: TwwQuery;
    Label34: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dbeLocalizacao: TwwDBEdit;
    bbtnSelLocal: TBitBtn;
    MSLocal: TMontaSelect;
    qryLocalIDLOCALIZACAO: TFloatField;
    qryLocalDESCLOCALIZACAO: TStringField;
    qryLocalIDRESPONSAVEL: TFloatField;
    qryLocalNOMERESPONSAVEL: TStringField;
    dsLocal: TwwDataSource;
    qryLocalIDEMPRESA: TFloatField;
    qryLocalCODCENTROCUSTO: TStringField;
    bbtnSelResp: TBitBtn;
    qryResp: TwwQuery;
    qryRespIDRESPONSAVEL: TFloatField;
    qryRespDESCRESPONSAVEL: TStringField;
    dsResp: TwwDataSource;
    dbeResponsavel: TwwDBEdit;
    Termo: TLabel;
    dbeTermo: TwwDBEdit;
    dbeData: TCMDateTimePicker;
    Label1: TLabel;
    Label5: TLabel;
    dbeObs: TDBMemo;
    MSResponsavel: TMontaSelect;
    Label6: TLabel;
    qrySelMotivo: TwwQuery;
    dsSelMotivo: TwwDataSource;
    dbcmbSelMotivo: TwwDBLookupCombo;
    qryIDSAIDATEMPORARIA: TFloatField;
    qrySTPTERMO: TFloatField;
    qrySTPDATA: TDateTimeField;
    qryIDTIPOSAIDATEMP: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDLOCALIZACAO: TFloatField;
    qryIDRESPONSAVEL: TFloatField;
    qrySTPOBSERVACOES: TStringField;
    qrySTPDATARETORNO: TDateTimeField;
    qrySelMotivoIDTIPOSAIDATEMP: TFloatField;
    qrySelMotivoDESCTIPSAITEMP: TStringField;
    qryDetIDSAIDATEMPORARIA: TFloatField;
    qryDetIDBEM: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetSTBCUSTO: TFloatField;
    qryDetSTBDATARETORNO: TDateTimeField;
    qryDetDESBEM: TStringField;
    qryDetPLACA: TFloatField;
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    qrySelBem: TwwQuery;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemPLACA: TFloatField;
    qrySelBemDESCCONJUNTO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDESCLOCALIZACAO: TStringField;
    qrySelBemNOMERESPONSAVEL: TStringField;
    dsSelBem: TwwDataSource;
    Label26: TLabel;
    edPlaca: TEdit;
    bbtnSelBem: TBitBtn;
    Label22: TLabel;
    dbmDesBem: TDBMemo;
    Label7: TLabel;
    dbeConjunto: TwwDBEdit;
    Label8: TLabel;
    dbeLocal: TwwDBEdit;
    Label17: TLabel;
    dbeResp: TwwDBEdit;
    qryBensFora: TwwQuery;
    qryBensForaBENSNAORETORNADOS: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
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
  private
    { Private declarations }
    Procedure SelMestreDet( n : LongInt );
  public
    { Public declarations }
  end;

var
  frmMovSaidaTemp : TfrmMovSaidaTemp;
  bInsert   : Boolean;
  bTstConf  : Boolean;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uDataBase, dBaseDados, dAtivoFixo;

//========================================================================================
procedure TfrmMovSaidaTemp.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Prepare;
   qryDet.Prepare;
   qryLocal.Prepare;
   qrySelBem.Prepare;
   qryPlaca.Prepare;
   qrySelMotivo.Prepare;
   qryBensFora.Prepare;
   //-------------------------------------------------------------------------------------
   qrySelMotivo.Open;
   SelMestreDet(-1);
end;
//========================================================================================
procedure TfrmMovSaidaTemp.SelMestreDet( n : LongInt );
begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;
   //-------------------------------------------------------------------------------------
   qryLocal.Close;
   qryLocal.ParamByName('PIDLOCAL').AsInteger   := qryIDLOCALIZACAO.AsInteger;
   qryLocal.ParamByName('PIDEMPRESA').AsInteger := qryIDPESSOA.AsInteger;
   qryLocal.Open;
   //-------------------------------------------------------------------------------------
   qryResp.Close;
   qryResp.ParamByName('PIDRESP').AsInteger     := qryIDRESPONSAVEL.AsInteger;
   qryResp.Open;
   //-------------------------------------------------------------------------------------
   qryDet.Close;
   qryDet.Params[0].Value := n;
   qryDet.Open;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.CmeCadastroInsert(Sender: TObject);
begin
   bInsert := True;
   SelMestreDet(-1);
   inherited;
   dbeTermo.SetFocus;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.CmeCadastroEdit(Sender: TObject);
begin
   bInsert := False;
   inherited;
   dbeTermo.Enabled := False;
   dbeData.SetFocus;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.CmeCadastroDelete(Sender: TObject);
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
procedure TfrmMovSaidaTemp.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSLocal.Executar;
   //-------------------------------------------------------------------------------------
   frmMovSaidaTemp.Invalidate;
   frmMovSaidaTemp.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSLocal.ValoresChave.Count > 0) and (MSLocal.ValoresChave[0] <> '') then
   begin
      qryLocal.Close;
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := StrToInt(MSLocal.ValoresChave[0]);
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qryLocal.Open;
      if (not qryLocalIDRESPONSAVEL.IsNull) then
      begin
         qryResp.Close;
         qryResp.ParamByName('PIDRESP').AsInteger := qryLocalIDRESPONSAVEL.AsInteger;
         qryResp.Open;
      end else
      begin
         qryResp.Close;
         qryResp.ParamByName('PIDRESP').AsInteger := -1;
         qryResp.Open;
      end;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResponsavel.Executar;
   //-------------------------------------------------------------------------------------
   frmMovSaidaTemp.Invalidate;
   frmMovSaidaTemp.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryResp.Close;
   if (MSResponsavel.ValoresChave.Count > 0) and (MSResponsavel.ValoresChave[0] <> '') then
   begin
      qryResp.ParamByName('PIDRESP').AsInteger := StrToInt(MSResponsavel.ValoresChave[0]);
      qryResp.Open;
   end;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
   end;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').Clear;
   qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelBem.Open;
   edPlaca.Text := '';
   //-------------------------------------------------------------------------------------
   edPlaca.SetFocus;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.CmeDetalheEdit(Sender: TObject);
begin
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').AsInteger    := qryDetIDBEM.AsInteger;
   qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelBem.Open;
   edPlaca.Text := inttostr(qrySelBemPLACA.AsInteger);
   inherited;
   edPlaca.SetFocus;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.CmeDetalheDelete(Sender: TObject);
begin
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').AsInteger    := qryDetIDBEM.AsInteger;
   qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelBem.Open;
   edPlaca.Text := inttostr(qrySelBemPLACA.AsInteger);
   //-------------------------------------------------------------------------------------
   if (MsgDlg('Confirma a remoção do Bem da Seleção para Baixa','Remoção',
             mtConfirmation,[mbOk,mbCancel],0) = mrOk) then
      inherited;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelBem.Close;
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBem.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.ParamByName('PIDBEM').AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
   end else
   begin
      qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelBem.ParamByName('PIDBEM').Clear;
   end;
   qrySelBem.Open;
   //-------------------------------------------------------------------------------------
   if (qrySelBem.IsEmpty) then
   begin
      edPlaca.Text := '';
   end else
   begin
      edPlaca.Text := qrySelBemPLACA.AsString;
   end;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.edPlacaExit(Sender: TObject);
begin
   inherited;
   if (edPlaca.Text <> '') then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsInteger := StrToInt(edPlaca.Text);
      qryPlaca.Open;
      if not qryPlaca.isEmpty then
      begin
         qrySelBem.Close;
         qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelBem.ParamByName('PIDBEM').AsInteger    := qryPlacaIDBEM.AsInteger;
         qrySelBem.Open;
         //-------------------------------------------------------------------------------
         if not qrySelBem.IsEmpty then
         begin
            edPlaca.Text := qrySelBemPLACA.AsString;
         end else
         begin
            MsgDlg('Bem já totalmente Baixado ou com Controle Físico','Erro',mtError,[mbOk],0);
            edPlaca.SetFocus;
         end;
      end else
      begin
         qrySelBem.Close;
         qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelBem.ParamByName('PIDBEM').Clear;
         qrySelBem.Open;
         //-------------------------------------------------------------------------------
         edPlaca.Text := '';
         edPlaca.SetFocus;
      end;
   end;
end;
//========================================================================================
Procedure TfrmMovSaidaTemp.CmeDetalheConfirma(Sender: TObject);
Begin
   if (qryDet.State in [dsInsert,dsEdit]) then
   begin
      if (trim(edPlaca.Text) = '') or (qrySelBem.IsEmpty) Then
      begin
         MsgDlg('Nenhum Bem foi Selecionado','Erro',mtError,[mbOK],0);
         bbtnSelBem.SetFocus;
      end else
      begin
         qryDetIDPESSOA.AsInteger := qrySelBemIDPESSOA.AsInteger;
         qryDetIDBEM.AsInteger    := qrySelBemIDBEM.AsInteger;
         qryDetPLACA.AsInteger    := qrySelBemPLACA.AsInteger;
         qryDetDESBEM.AsString    := qrySelBemDESBEM.AsString;
         inherited;
      end;
   end else
   begin
      inherited;
   end;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.bbtnConfirmarClick(Sender: TObject);
var
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
Procedure TfrmMovSaidaTemp.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
   Accept := True;
   if (trim(dbeTermo.Text) = '') then
   begin
      MsgDlg('Número do Termo não foi preenchido','Erro',mtError,[mbOK],0);
      dbeTermo.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeData.Text) = '') then
   begin
      MsgDlg('Data de Saída dos Bens do Termo não foi preenchida','Erro',mtError,[mbOK],0);
      dbeData.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeLocalizacao.Text) = '') then
   begin
       MsgDlg('Local de Destino dos Bens não foi selecionado','Erro',mtError,[mbOK],0);
       dbeLocalizacao.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeResponsavel.Text) = '') then
   begin
       MsgDlg('Responsável pela Saída dos Bens não foi selecionado','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbcmbSelMotivo.Text) = '') then
   begin
       MsgDlg('Motivo da Saída não foi selecionado','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
       Accept := False;
   end;
   //-------------------------------------------------------------------------------------
   bTstConf := Accept;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.CmeCadastroConfirma(Sender: TObject);
var
   iIdSaidaTemp : Integer;

begin
   if qry.State in [dsInsert,dsEdit] then
   begin
      try
         StartTransacao;
         //-------------------------------------------------------------------------------
         if (qry.State = dsInsert) then
         begin
            qry.FieldByName('IDSAIDATEMPORARIA').AsInteger := LeUltRegistro(nil,'SAIDATEMPORARIA');
         end;
         iIdSaidaTemp := qry.FieldByName('IDSAIDATEMPORARIA').AsInteger;
         qry.FieldByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
         qry.FieldByName('IDLOCALIZACAO').AsInteger := qryLocalIDLOCALIZACAO.AsInteger;
         qry.FieldByName('IDRESPONSAVEL').AsInteger := qryRespIDRESPONSAVEL.AsInteger;
         //-------------------------------------------------------------------------------
         qryDet.First;
         while not qryDet.EOF do
         begin
            qryDet.Edit;
            qryDet.FieldByName('IDSAIDATEMPORARIA').AsInteger := iIdSaidaTemp;
            qryDet.Next;
         end;
         //-------------------------------------------------------------------------------
         qry.ApplyUpdates;
         qryDet.ApplyUpdates;
         //-------------------------------------------------------------------------------
         case CmeCadastro.Operacao of
            opInserir :
               if not Sistema.GravaLogOperacoes('Inclusao de Termo de Saida Temporaria') then
                  raise Exception.Create('Erro ao gravar Log de Operação');
            opAlterar :
               if not Sistema.GravaLogOperacoes('Alteracao de Termo de Saida Temporaria') then
                  raise Exception.Create('Erro ao gravar Log de Operação');
         end;
         //-------------------------------------------------------------------------------
         CommitTransacao;
      except
         RollbackTransacao;
         Abort;
      end;
   end else
   begin
      qryDet.ApplyUpdates;
      qry.ApplyUpdates;
      //----------------------------------------------------------------------------------
      case CmeCadastro.Operacao of
         opApagar :
            if not Sistema.GravaLogOperacoes('Remocao de Termo de Saida Temporaria') then
               raise Exception.Create('Erro ao gravar Log de Operação');
      end;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryDet.Close;
   qryLocal.Close;
   qryResp.Close;
   qryPlaca.Close;
   qrySelBem.Close;
   qrySelMotivo.Close;
   qryBensFora.Close;
   //-------------------------------------------------------------------------------------
   qry.UnPrepare;
   qryDet.UnPrepare;
   qryLocal.UnPrepare;
   qryResp.UnPrepare;
   qryPlaca.UnPrepare;
   qrySelBem.UnPrepare;
   qrySelMotivo.UnPrepare;
   qryBensFora.UnPrepare;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   bbtnSelLocal.Enabled := True;
   bbtnSelResp.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.sbtnInsDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.sbtnAltDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovSaidaTemp.sbtnApagarClick(Sender: TObject);
begin
   qryBensFora.Close;
   qryBensFora.ParamByName('PIDSAIDATEMP').AsInteger := qryIDSAIDATEMPORARIA.AsInteger;
   qryBensFora.Open;
   //-------------------------------------------------------------------------------------
   if (qryBensForaBENSNAORETORNADOS.AsInteger > 0) then
   begin
      MsgDlg('Exclusão não será permitida. Existem Bens não retornados',
             'Erro',mtError,[mbOK],0);
      sbtnApagar.Down := False;
      exit;
   end else
   begin
      qryLocal.Close;
      qryResp.Close;
      inherited;
   end;
end;

end.

