unit fCadConjunto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdblook, CMDBLookupCombo, Spin, TREdit, CMTree, wwdbedit,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList,
  uCMTreeViewMT, Provider, DBClient{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadConjunto = class(TfrmCadMestreDetalheCS)
    qryIDCONJUNTO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDRESPONSAVEL: TFloatField;
    qryIDLOCALIZACAO: TFloatField;
    qryDISPONIVEL: TFloatField;
    qryDESCCONJUNTO: TStringField;
    qryALUGADO: TFloatField;
    dbeDescConjunto: TDBMemo;
    Label1: TLabel;
    RgDispon: TDBRadioGroup;
    RgAlugado: TDBRadioGroup;
    qryLocal: TwwQuery;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label13: TLabel;
    qryDetIDCONJUNTO: TFloatField;
    qryDetDTAINICIO: TDateTimeField;
    qryDetIDEMPRESA: TFloatField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetPARTICIPACAO: TFloatField;
    qryDetDESCCCUSTO: TStringField;
    dbeLocalizacao: TwwDBEdit;
    bbtnSelLocal: TBitBtn;
    dbeCentroCusto: TwwDBEdit;
    bbtnTreeCcusto: TBitBtn;
    MSLocal: TMontaSelect;
    qryLocalIDLOCALIZACAO: TFloatField;
    qryLocalDESCLOCALIZACAO: TStringField;
    qryLocalIDRESPONSAVEL: TFloatField;
    qryLocalNOMERESPONSAVEL: TStringField;
    dsLocal: TwwDataSource;
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
    Label5: TLabel;
    dbeDataInicio: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    lblCentroCusto: TLabel;
    Label7: TLabel;
    qryLocalIDEMPRESA: TFloatField;
    qryLocalCODCENTROCUSTO: TStringField;
    qryBemConjunto: TwwQuery;
    qryBemConjuntoIDCONJUNTO: TFloatField;
    qryBemConjuntoIDBEM: TFloatField;
    qryUltConj: TwwQuery;
    bbtnSelResp: TBitBtn;
    qryResp: TwwQuery;
    qryRespIDRESPONSAVEL: TFloatField;
    qryRespDESCRESPONSAVEL: TStringField;
    dsResp: TwwDataSource;
    dbeResponsavel: TwwDBEdit;
    MSResponsavel: TMontaSelect;
    treeCentroCusto: TCMTreeViewMT;
    cdsTreeCCusto: TClientDataSet;
    dspTreeCCusto: TDataSetProvider;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnTreeCcustoClick(Sender: TObject);
    procedure treeCentroCustoDblClick(Sender: TObject);
    procedure treeCentroCustoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    bInsert   : Boolean;
    bTstConf  : Boolean;
    Procedure SelMestreDet( n : LongInt );
    Procedure SelUltConj( n : LongInt );
  public
    { Public declarations }
  end;

var
  frmCadConjunto : TfrmCadConjunto;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uDataBase, dBaseDados;

//========================================================================================
procedure TfrmCadConjunto.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Prepare;
   qryDet.Prepare;
   qryLocal.Prepare;
   qrySelCCusto.Prepare;
   qryBemConjunto.Prepare;
   qryUltConj.Prepare;
   //-------------------------------------------------------------------------------------
   SelMestreDet(-1);
   SelUltConj(-1);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('CONJUNTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
end;
//========================================================================================
procedure TfrmCadConjunto.FormShow(Sender: TObject);
begin
   inherited;
   qryParamGlobal.Close;
   qryParamGlobal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryParamGlobal.Open;
   //-------------------------------------------------------------------------------------
   qryTreeCCusto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   cdsTreeCCusto.Open;
   treeCentroCusto.Mascara := qryParamGlobalMASCARACC.AsString;
   qrySelCCustoCODCENTROCUSTO.EditMask := trim(qryParamGlobalMASCARACC.AsString)+ ';0;_';
   qryDetCODCENTROCUSTO.EditMask := trim(qryParamGlobalMASCARACC.AsString)+ ';0;_';
   treeCentroCusto.MontaArvore;
end;
//========================================================================================
procedure TfrmCadConjunto.SelUltConj( n : LongInt );
begin
   qryUltConj.Close;
   qryUltConj.Params[0].Value := n;
   qryUltConj.Open;
end;
//========================================================================================
procedure TfrmCadConjunto.SelMestreDet( n : LongInt );
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
   qryDet.ParamByName('PIDCONJUNTO').Value := n;
   qryDet.Open;
end;
//========================================================================================
procedure TfrmCadConjunto.CmeCadastroInsert(Sender: TObject);
begin
   bInsert := True;
   SelMestreDet(-1);
   inherited;
   qryDISPONIVEL.asInteger := 1;
   qryALUGADO.asInteger    := 0;
   dbeDescConjunto.SetFocus;
end;
//========================================================================================
procedure TfrmCadConjunto.sbtnAlterarClick(Sender: TObject);
begin
   qryBemConjunto.Close;
   qryBemConjunto.ParamByName('PIDEMPRESA').AsInteger  := Sistema.IdEmpresa;
   qryBemConjunto.ParamByName('PIDCONJUNTO').AsInteger := qry.FieldByName('IDCONJUNTO').AsInteger;
   qryBemConjunto.Open;
   //-------------------------------------------------------------------------------------
   if not qryBemConjunto.IsEmpty then
   begin
      bbtnSelLocal.Enabled := False;
      bbtnSelResp.Enabled  := False;
      MsgDlg('Existem Bens associados ao Conjunto. Alteração Restrita',
             'Informação',mtInformation,[mbOK],0);
   end;
   inherited;
end;
//========================================================================================
procedure TfrmCadConjunto.CmeCadastroEdit(Sender: TObject);
begin
   bInsert := False;
   inherited;
   dbeDescConjunto.SetFocus;
end;
//========================================================================================
procedure TfrmCadConjunto.CmeCadastroDelete(Sender: TObject);
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
procedure TfrmCadConjunto.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSLocal.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSLocal.RetornouValor then
   begin
      qryLocal.Close;
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := StrToInt(MSLocal.ValoresChave[0]);
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := StrToInt(MSLocal.ValoresChave[1]);
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
procedure TfrmCadConjunto.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResponsavel.Executar;
   //-------------------------------------------------------------------------------------
   frmCadConjunto.Invalidate;
   frmCadConjunto.Repaint;
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
procedure TfrmCadConjunto.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
      SelUltConj(StrToInt(MontaSelect.ValoresChave[0]));
   end;
end;
//========================================================================================
Procedure TfrmCadConjunto.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var
   fTotPerc : Double;

begin
   Accept := True;
   if (trim(dbeDescConjunto.Text) = '') then
   begin
      MsgDlg('Descrição do conjunto não foi preenchida','Erro',mtError,[mbOK],0);
      dbeDescConjunto.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeLocalizacao.Text) = '') then
   begin
       MsgDlg('Localização não foi preenchida','Erro',mtError,[mbOK],0);
       dbeLocalizacao.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeResponsavel.Text) = '') then
   begin
       MsgDlg('Responsável não foi preenchido','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
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
procedure TfrmCadConjunto.CmeDetalheInsert(Sender: TObject);
var bVazio : boolean;
begin
   bVazio := qryDet.IsEmpty;
   inherited;
   //-------------------------------------------------------------------------------------
   if bVazio then
   begin
      qrySelCCusto.Close;
      qrySelCCusto.ParamByName('PIDEMPRESA').AsInteger     := qryLocalIDEMPRESA.AsInteger;
      qrySelCCusto.ParamByName('PCODCENTROCUSTO').AsString := qryLocalCODCENTROCUSTO.AsString;
      qrySelCCusto.Open;
      qryDetDTAINICIO.AsDateTime := Date;
      qryDetPARTICIPACAO.AsFloat := 100;
   end else
   begin
      qrySelCCusto.Close;
      qrySelCCusto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qrySelCCusto.ParamByName('PCODCENTROCUSTO').Clear;
      qrySelCCusto.Open;
      qryDetDTAINICIO.AsDateTime := Date;
   end;
   lblCentroCusto.Caption := qrySelCCustoNOME.AsString;
   //-------------------------------------------------------------------------------------
   bbtnTreeCCusto.SetFocus;
end;
//========================================================================================
procedure TfrmCadConjunto.CmeDetalheEdit(Sender: TObject);
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
procedure TfrmCadConjunto.CmeDetalheDelete(Sender: TObject);
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
Procedure TfrmCadConjunto.CmeDetalheConfirma(Sender: TObject);
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
      if (dbeDataInicio.Text = '') then
      begin
          MsgDlg('Data de Inclusao não foi preenchida','Erro',mtError,[mbOK],0);
          dbeDataInicio.SetFocus;
      end else
      begin
         qryDetIDEMPRESA.AsInteger     := Sistema.IdEmpresa;
         qryDetCODCENTROCUSTO.AsString := qrySelCCustoCODCENTROCUSTO.AsString;
         qryDetDESCCCUSTO.AsString     := qrySelCCustoNOME.AsString;
         inherited;
      end;
   end else
   begin
      inherited;
   end;
end;
//========================================================================================
procedure TfrmCadConjunto.bbtnConfirmarClick(Sender: TObject);
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
   bbtnSelLocal.Enabled := True;
   bbtnSelResp.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadConjunto.CmeCadastroConfirma(Sender: TObject);
var
   iIdConjProc : Integer;

begin
   if qry.State in [dsInsert,dsEdit] then
   begin
      try
         StartTransacao;
         //-------------------------------------------------------------------------------
         if (qry.State = dsInsert) then
            qry.FieldByName('IDCONJUNTO').AsInteger := LeUltRegistro(nil,'CONJUNTO');
         qry.FieldByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
         qry.FieldByName('IDLOCALIZACAO').AsInteger := qryLocalIDLOCALIZACAO.AsInteger;
         qry.FieldByName('IDRESPONSAVEL').AsInteger := qryRespIDRESPONSAVEL.AsInteger;
         iIdConjProc := qry.FieldByName('IDCONJUNTO').AsInteger;
         //-------------------------------------------------------------------------------
         qryDet.First;
         while not qryDet.EOF do
         begin
            qryDet.Edit;
            qryDetIDCONJUNTO.AsInteger := qry.FieldByName('IDCONJUNTO').asInteger;
            qryDet.Next;
         end;
         //-------------------------------------------------------------------------------
         qry.ApplyUpdates;
         qryDet.ApplyUpdates;
         //-------------------------------------------------------------------------------
         case CmeCadastro.Operacao of
            opInserir :
               if not Sistema.GravaLogOperacoes('Inclusao de Conjunto de Bens') then
                  raise Exception.Create('Erro ao gravar Log de Operação');
            opAlterar :
               if not Sistema.GravaLogOperacoes('Alteracao de Conjunto de Bens') then
                  raise Exception.Create('Erro ao gravar Log de Operação');
         end;
         //-------------------------------------------------------------------------------
         CommitTransacao;
      except
         iIdConjProc := -1;
         RollBackTransacao;
         Abort;
      end;
      SelUltConj(iIdConjProc);
   end else
   begin
      qryDet.ApplyUpdates;
      qry.ApplyUpdates;
      //----------------------------------------------------------------------------------
      case CmeCadastro.Operacao of
         opApagar :
            if not Sistema.GravaLogOperacoes('Remocao de Conjunto de Bens') then
               raise Exception.Create('Erro ao gravar Log de Operação');
      end;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmCadConjunto.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   bbtnSelLocal.Enabled := True;
   bbtnSelResp.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadConjunto.bbtnTreeCcustoClick(Sender: TObject);
begin
   inherited;
   treeCentroCusto.FullExpand;
   treeCentroCusto.Visible := True;
   if treeCentroCusto.Visible and treeCentroCusto.CanFocus then
      treeCentroCusto.SetFocus;
end;
//========================================================================================
procedure TfrmCadConjunto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   if (FormStyle <> FsNormal) then
   begin
      qryUltConj.Close;
      qryUltConj.UnPrepare;
   end;
   qry.Close;
   qryDet.Close;
   qryLocal.Close;
   qrySelCCusto.Close;
   cdsTreeCCusto.Close;
   qryBemConjunto.Close;
   qryParamGlobal.Close;
   qry.UnPrepare;
   qryDet.UnPrepare;
   qryLocal.UnPrepare;
   qrySelCCusto.UnPrepare;
   qryBemConjunto.UnPrepare;
   qryParamGlobal.UnPrepare;
end;
//========================================================================================
procedure TfrmCadConjunto.sbtnInsDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   dbeCentroCusto.Enabled := True;
   bbtnTreeCCusto.Enabled := True;
   dbeDataInicio.Enabled  := True;
   inherited;
end;
//========================================================================================
procedure TfrmCadConjunto.sbtnAltDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   dbeCentroCusto.Enabled := False;
   bbtnTreeCCusto.Enabled := False;
   dbeDataInicio.Enabled  := False;
   inherited;
end;
//========================================================================================
procedure TfrmCadConjunto.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadConjunto.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadConjunto.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadConjunto.sbtnApagarClick(Sender: TObject);
begin
   qryBemConjunto.Close;
   qryBemConjunto.ParamByName('PIDEMPRESA').AsInteger  := Sistema.IdEmpresa;
   qryBemConjunto.ParamByName('PIDCONJUNTO').AsInteger := qry.FieldByName('IDCONJUNTO').AsInteger;
   qryBemConjunto.Open;
   //-------------------------------------------------------------------------------------
   if not qryBemConjunto.IsEmpty then
   begin
      MsgDlg('Exclusão não será permitida. Existem Bens associados ao Conjunto',
             'Erro',mtError,[mbOK],0);
      sbtnApagar.Down := False;
      exit;
   end else
   begin
      SelUltConj(-1);
      qryLocal.Close;
      qryResp.Close;
      inherited;
   end;
end;
//========================================================================================
procedure TfrmCadConjunto.treeCentroCustoDblClick(Sender: TObject);
begin
   if cdsTreeCCusto.FieldByName('TIPO').AsString = 'A' then
   begin
      dbeCentroCusto.SetFocus;
   end else
      inherited;
end;
//========================================================================================
procedure TfrmCadConjunto.treeCentroCustoExit(Sender: TObject);
begin
   inherited;
   treeCentroCusto.Visible := False;
   qrySelCCusto.Close;
   qrySelCCusto.ParamByName('PCODCENTROCUSTO').AsString := cdsTreeCCusto.FieldByName('CODCENTROCUSTO').AsString;
   qrySelCCusto.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
   qrySelCCusto.Open;
   lblCentroCusto.Caption := qrySelCCustoNOME.AsString;
   dbeCentroCusto.SetFocus;
end;

end.
