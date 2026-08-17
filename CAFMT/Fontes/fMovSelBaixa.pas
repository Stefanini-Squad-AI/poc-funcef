unit fMovSelBaixa;

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
  TfrmMovSelBaixa = class(TfrmCadMestreDetalheCS)
    Label3: TLabel;
    qryDet: TwwQuery;
    dbeSbxTermo: TwwDBEdit;
    Label1: TLabel;
    qryIDSELBAIXA: TFloatField;
    qrySBXTERMO: TFloatField;
    qrySBXPROCESSO: TStringField;
    qrySBXDATA: TDateTimeField;
    qryIDRESPONSAVEL: TFloatField;
    qrySBXFLGEXECUTADO: TFloatField;
    qrySBXDTAEXECUTADO: TDateTimeField;
    dbeSbxProcesso: TwwDBEdit;
    Processo: TLabel;
    dbeSbxData: TCMDateTimePicker;
    Label2: TLabel;
    dbeResponsavel: TwwDBEdit;
    qryResp: TwwQuery;
    qryRespIDRESPONSAVEL: TFloatField;
    qryRespDESCRESPONSAVEL: TStringField;
    dsResp: TwwDataSource;
    MSResponsavel: TMontaSelect;
    bbtnSelResp: TBitBtn;
    Label4: TLabel;
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
    Label26: TLabel;
    edPlaca: TEdit;
    bbtnSelBem: TBitBtn;
    Label5: TLabel;
    Label7: TLabel;
    Label22: TLabel;
    Label17: TLabel;
    dsSelBem: TwwDataSource;
    dbmDesBem: TDBMemo;
    dbeConjunto: TwwDBEdit;
    dbeLocal: TwwDBEdit;
    dbeResp: TwwDBEdit;
    qryDetIDSELBAIXA: TFloatField;
    qryDetIDBEM: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetPLACA: TFloatField;
    qryDetDESBEM: TStringField;
    updDet: TUpdateSQL;
    qryDetSBBVALVENDA: TFloatField;
    Toolbar972: TToolbar97;
    bbtnGeraDet: TBitBtn;
    bbtnLimpar: TBitBtn;
    qryDetBAIXATOTAL: TStringField;
    qryDestBaixa: TwwQuery;
    dsDestBaixa: TwwDataSource;
    MSDestBaixa: TMontaSelect;
    qryIDDESTINOBAIXA: TFloatField;
    Label6: TLabel;
    dbeDestBaixa: TwwDBEdit;
    bbtnDestBaixa: TBitBtn;
    qryDestBaixaIDDESTINOBAIXA: TFloatField;
    qryDestBaixaDESCDESTINATARIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnGeraDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnLimparClick(Sender: TObject);
    procedure bbtnDestBaixaClick(Sender: TObject);
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
    procedure qryBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    bInsert,
    bTstConf : Boolean;
    aIdBem   : Array of Integer;
    iaIdBem  : Integer;
    function  InsertIdBem(iIdBem : Integer) : boolean;
    function  DeleteIdBem(iIdBem : Integer) : boolean;
    function  FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
    Procedure SelMestreDet(n : LongInt);
  public
    { Public declarations }
  end;

var
  frmMovSelBaixa : TfrmMovSelBaixa;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uDataBase, dBaseDados, fSelBem, dAtivoFixo;

//========================================================================================
procedure TfrmMovSelBaixa.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Prepare;
   qryDet.Prepare;
   qryResp.Prepare;
   qryPlaca.Prepare;
   qrySelBem.Prepare;
   bbtnGeraDet.Enabled := False;
   bbtnLimpar.Enabled := False;
   //-------------------------------------------------------------------------------------
   SelMestreDet(-1);
end;
//========================================================================================
procedure TfrmMovSelBaixa.SelMestreDet( n : LongInt );
begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;
   //-------------------------------------------------------------------------------------
   qryResp.Close;
   qryResp.ParamByName('PIDRESP').AsInteger := qryIDRESPONSAVEL.AsInteger;
   qryResp.Open;
   qryDestBaixa.Close;
   qryDestBaixa.ParamByName('PIDDESTINOBAIXA').AsInteger := qryIDDESTINOBAIXA.AsInteger;
   qryDestBaixa.Open;
   //-------------------------------------------------------------------------------------
   qryDet.Close;
   qryDet.ParamByName('PIDSELBAIXA').Value := n;
   qryDet.Open;
   if not qryDet.IsEmpty then
      qryDet.First;
   //-------------------------------------------------------------------------------------
   // Preenche a lista de bens
   //-------------------------------------------------------------------------------------
   iaIdBem := 0;
   SetLength(aIdBem, iaIdBem);
   if not qryDet.IsEmpty then
   begin
      while not qryDet.EOF do
      begin
         InsertIdBem(qryDet.FieldByName('IDBEM').AsInteger);
         qryDet.Next;
      end;
      qryDet.First
   end;
end;
//========================================================================================
procedure TfrmMovSelBaixa.CmeCadastroInsert(Sender: TObject);
begin
   bInsert := True;
   SelMestreDet(-1);
   inherited;
   bbtnGeraDet.Enabled := True;
   bbtnLimpar.Enabled := True;
   dbeSbxTermo.Enabled := True;
   dbeSbxTermo.SetFocus;
end;
//========================================================================================
procedure TfrmMovSelBaixa.CmeCadastroEdit(Sender: TObject);
begin
   bInsert := False;
   inherited;
   bbtnGeraDet.Enabled := True;
   bbtnLimpar.Enabled := True;
   dbeSbxTermo.Enabled := False;
   dbeSbxProcesso.SetFocus;
end;
//========================================================================================
procedure TfrmMovSelBaixa.CmeCadastroDelete(Sender: TObject);
begin
   qryDet.First;
   while Not qryDet.EOF Do
   begin
      qryDet.Delete;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
   bbtnGeraDet.Enabled := False;
   bbtnLimpar.Enabled := False;
end;
//========================================================================================
procedure TfrmMovSelBaixa.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResponsavel.Executar;
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
procedure TfrmMovSelBaixa.bbtnDestBaixaClick(Sender: TObject);
begin
   inherited;
   MSDestBaixa.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryDestBaixa.Close;
   if MSDestBaixa.RetornouValor then
   begin
      qryDestBaixa.ParamByName('PIDDESTINOBAIXA').AsInteger := StrToInt(MSDestBaixa.ValoresChave[0]);
      qryDestBaixa.Open;
   end;
end;
//========================================================================================
procedure TfrmMovSelBaixa.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
   end;
end;
//========================================================================================
Procedure TfrmMovSelBaixa.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var
   fTotPerc : Double;

begin
   Accept := True;
   if (trim(dbeSbxTermo.Text) = '') then
   begin
      MsgDlg('O número do termo de baixa não foi preenchido', 'Erro', mtError, [mbOK], 0);
      dbeSbxTermo.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeSbxProcesso.Text) = '') then
   begin
       MsgDlg('Descrição do Processo não foi preenchido', 'Erro', mtError, [mbOK], 0);
       dbeSbxProcesso.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeSbxData.Text) = '') then
   begin
       MsgDlg('Data do cadastramento da seleção não foi preenchida','Erro',mtError,[mbOK],0);
       dbeSbxData.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeResponsavel.Text) = '') then
   begin
       MsgDlg('Responsável pela seleção não foi preenchido','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   begin
      fTotPerc := 0;
      qryDet.DisableControls;
      qryDet.First;
      while not qryDet.EOF do
      begin
         if (qryDetBAIXATOTAL.AsString = 'S') then
            MsgDlg('O bem ' + qryDetPLACA.AsString + ' já está baixado.',
                   'Erro', mtError, [mbOK], 0);
         fTotPerc := fTotPerc + 1;
         qryDet.Next;
      end;
      qryDet.EnableControls;
      if (fTotperc <= 0) then
      begin
         MsgDlg('Selecione os bens ...!', 'Erro', mtError, [mbOK], 0);
         Accept := False;
      end;
   end;
   //-------------------------------------------------------------------------------------
   bTstConf := Accept;
end;
//========================================================================================
procedure TfrmMovSelBaixa.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').Clear;
   qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelBem.Open;
   edPlaca.Text     := '';
   //-------------------------------------------------------------------------------------
   edPlaca.SetFocus;
end;
//========================================================================================
procedure TfrmMovSelBaixa.CmeDetalheEdit(Sender: TObject);
begin
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').AsInteger    := qryDetIDBEM.AsInteger;
   qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelBem.Open;
   edPlaca.Text     := inttostr(qrySelBemPLACA.AsInteger);
   inherited;
   edPlaca.SetFocus;
end;
//========================================================================================
procedure TfrmMovSelBaixa.CmeDetalheDelete(Sender: TObject);
begin
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').AsInteger    := qryDet.FieldByName('IDBEM').AsInteger;
   qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelBem.Open;
   edPlaca.Text     := inttostr(qrySelBemPLACA.AsInteger);
   //-------------------------------------------------------------------------------------
   if (MsgDlg('Confirma a remoção do Bem da Seleção para Baixa','Remoção',
             mtConfirmation,[mbOk,mbCancel],0) = mrOk) then
   begin
      inherited;
      DeleteIdBem(qrySelBem.FieldByName('IDBEM').AsInteger);
   end;       
end;
//========================================================================================
procedure TfrmMovSelBaixa.bbtnSelBemClick(Sender: TObject);
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
procedure TfrmMovSelBaixa.edPlacaExit(Sender: TObject);
begin
   inherited;
   if (edPlaca.Text <> '') then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := StrToFloat(edPlaca.Text);
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
Procedure TfrmMovSelBaixa.CmeDetalheConfirma(Sender: TObject);
var
   iPos : Integer;
   
Begin
   if (qryDet.State in [dsInsert,dsEdit]) then
   begin
      if (trim(edPlaca.Text) = '') or (qrySelBem.IsEmpty) Then
      begin
         MsgDlg('Nenhum Bem foi Selecionado','Erro',mtError,[mbOK],0);
         bbtnSelBem.SetFocus;
      end else
      begin
         //-------------------------------------------------------------------------------
         // Pesquisa se o bem já foi cadastrado, tentando incluir na lista de idbem
         //-------------------------------------------------------------------------------
         if not FindIdBem(qrySelBem.FieldByName('IDBEM').AsInteger,iPos) then
         begin
            qryDetIDPESSOA.AsInteger     := qrySelBemIDPESSOA.AsInteger;
            qryDetIDBEM.AsInteger        := qrySelBemIDBEM.AsInteger;
            qryDetPLACA.AsInteger        := qrySelBemPLACA.AsInteger;
            qryDetDESBEM.AsString        := qrySelBemDESBEM.AsString;
            inherited;
            //----------------------------------------------------------------------------
            InsertIdBem(qrySelBem.FieldByName('IDBEM').AsInteger);
         end;
      end;
   end else
   begin
      inherited;
   end;
end;
//========================================================================================
procedure TfrmMovSelBaixa.bbtnConfirmarClick(Sender: TObject);
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
procedure TfrmMovSelBaixa.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State in [dsInsert,dsEdit] then
   begin
      try
         StartTransacao;
         //-------------------------------------------------------------------------------
         if (qry.State = dsInsert) then
         begin
            qryIDSELBAIXA.AsInteger := LeUltRegistro(nil,'SELBAIXA');
         end;
         qryIDRESPONSAVEL.AsInteger := qryRespIDRESPONSAVEL.AsInteger;
         //-------------------------------------------------------------------------------
         if (not qryDestBaixaIDDESTINOBAIXA.IsNull) then
         begin
            qryIDDESTINOBAIXA.AsInteger := qryDestBaixaIDDESTINOBAIXA.AsInteger;
         end else
         begin
            qryIDDESTINOBAIXA.Clear;
         end;
         //-------------------------------------------------------------------------------
         qryDet.First;
         while not qryDet.EOF do
         begin
            qryDet.Edit;
            qryDetIDSELBAIXA.AsInteger := qryIDSELBAIXA.asInteger;
            qryDet.Next;
         end;
         //-------------------------------------------------------------------------------
         qry.ApplyUpdates;
         qryDet.ApplyUpdates;
         //-------------------------------------------------------------------------------
         case CmeCadastro.Operacao of
            opInserir :
               if not Sistema.GravaLogOperacoes('Inclusao de Seleção de Bens para Baixa') then
                  raise Exception.Create('Erro ao gravar Log de Operação');
            opAlterar :
               if not Sistema.GravaLogOperacoes('Alteracao de Seleção de Bens para Baixa') then
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
            if not Sistema.GravaLogOperacoes('Remocao de Seleção de Bens para Baixa') then
               raise Exception.Create('Erro ao gravar Log de Operação');
      end;
   end;
   inherited;
   qryResp.Close;
   qryDestBaixa.Close;
   bbtnLimpar.Enabled  := False;
   bbtnGeraDet.Enabled := False;
end;
//========================================================================================
procedure TfrmMovSelBaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryDet.Close;
   qryResp.Close;
   qryPlaca.Close;
   qrySelBem.Close;
   //
   qry.UnPrepare;
   qryDet.UnPrepare;
   qryResp.UnPrepare;
   qryPlaca.UnPrepare;
   qrySelBem.UnPrepare;
end;
//========================================================================================
procedure TfrmMovSelBaixa.sbtnInsDetClick(Sender: TObject);
begin
   bbtnGeraDet.Enabled    := False;
   bbtnLimpar.Enabled := False;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmMovSelBaixa.sbtnAltDetClick(Sender: TObject);
begin
   bbtnGeraDet.Enabled    := False;
   bbtnLimpar.Enabled := False;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmMovSelBaixa.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovSelBaixa.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovSelBaixa.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovSelBaixa.sbtnApagarClick(Sender: TObject);
begin
   if (qrySBXFLGEXECUTADO.AsInteger = 0) then
   begin
      inherited;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      SelMestreDet(-1);
   end else
   begin
      MsgDlg('Termo de Baixa executado em ' + qrySBXDTAEXECUTADO.AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelMestreDet(-1);
      bbtnCancelar.Click;
   end;
end;
//========================================================================================
procedure TfrmMovSelBaixa.sbtnAlterarClick(Sender: TObject);
begin
   if (qrySBXFLGEXECUTADO.AsInteger = 0) then
   begin
      inherited;
   end else
   begin
      MsgDlg('Termo de Baixa executado em ' + qrySBXDTAEXECUTADO.AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelMestreDet(-1);
      bbtnCancelar.Click;
   end;
end;
//========================================================================================
procedure TfrmMovSelBaixa.bbtnGeraDetClick(Sender: TObject);
var
   iPos : Integer;
   
begin
   inherited;
   Application.CreateForm(TfrmSelBem,frmSelBem);
   frmSelBem.FormStyle := FsNormal;
   frmSelBem.Visible   := False;
   frmSelBem.Top       := 84;
   frmSelBem.ShowModal;
   //-------------------------------------------------------------------------------------
   if (frmSelBem.bResult) then
   begin
      qryDet.DisableControls;
      frmSelBem.qry.First;
      while not frmSelBem.qry.EOF do
      begin
         if frmSelBem.qry.FieldByName('PROCESSAR').AsInteger = 1 then
         begin
            //----------------------------------------------------------------------------
            // Processa somente os bens não baixados
            //----------------------------------------------------------------------------
            if frmSelBem.qry.FieldByName('BAIXATOTAL').AsString <> 'S' then
            begin
               //----------------------------------------------------------------------------
               // Pesquisa se o bem já foi cadastrado, tentando incluir na lista de idbem
               //----------------------------------------------------------------------------
               if not FindIdBem(frmSelBem.qry.FieldByName('IDBEM').AsInteger,iPos) then
               begin
                  qryDet.Append;
                  qryDetIDPESSOA.AsInteger     := frmSelBem.qry.FieldByName('IDPESSOA').AsInteger;
                  qryDetIDBEM.AsInteger        := frmSelBem.qry.FieldByName('IDBEM').AsInteger;
                  qryDetSBBVALVENDA.AsCurrency := 0;
                  qryDetPLACA.AsInteger        := frmSelBem.qry.FieldByName('PLACA').AsInteger;
                  qryDetDESBEM.AsString        := frmSelBem.qry.FieldByName('DESBEM').AsString;
                  qryDet.Post;
                  //-------------------------------------------------------------------------
                  InsertIdBem(frmSelBem.qry.FieldByName('IDBEM').AsInteger);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         frmSelBem.qry.Next;
      end;
      qryDet.First;
      qryDet.EnableControls;
      sbtnAltDet.Enabled := not (frmSelBem.qry.IsEmpty);
      sbtnExcluiDet.Enabled := not (frmSelBem.qry.IsEmpty);
   end;
   //-------------------------------------------------------------------------------------
   frmSelBem.qry.Close;
   frmSelBem.qry.UnPrepare;
   frmSelBem.Release;
end;
//========================================================================================
procedure TfrmMovSelBaixa.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled := False;
   bbtnLimpar.Enabled := False;
   qryResp.Close;
end;
//========================================================================================
procedure TfrmMovSelBaixa.bbtnLimparClick(Sender: TObject);
begin
   inherited;
   qryDet.DisableControls;
   qryDet.First;
   while not qryDet.EOF do
   begin
      qryDet.Delete;
   end;
   qryDet.EnableControls;
end;
//========================================================================================
procedure TfrmMovSelBaixa.qryBeforePost(DataSet: TDataSet);
begin
   if (ds.State = dsInsert) or (ds.State = dsEdit) then
      qrySBXFLGEXECUTADO.AsInteger := 0;
   inherited;
end;
//========================================================================================
function TfrmMovSelBaixa.InsertIdBem(iIdBem : Integer) : boolean;
begin
   try
      SetLength(aIdBem,iaIdBem + 1);
      aIdBem[iaIdBem] := iIdBem;
      iaIdBem := iaIdBem + 1;
      Result := True;
   except
      Result := False;
   end;
end;
//========================================================================================
function TfrmMovSelBaixa.DeleteIdBem(iIdBem : Integer) : boolean;
var
   iPos : Integer;
begin
   if FindIdBem(iIdBem,iPos) then
   begin
      aIdBem[iPos] := -1;
      Result := True;
   end else
   begin
      Result := False;
   end;
end;
//========================================================================================
function TfrmMovSelBaixa.FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
begin
   try
      iPos := 0;
      while iPos <= (iaIdBem - 1) do
      begin
         if aIdBem[iPos] = iIdBem then
         begin
            Result := True;
            exit;
         end;
         iPos := iPos + 1;
      end;
      Result := False;
   except
      Result := False;
   end;
end;

end.
