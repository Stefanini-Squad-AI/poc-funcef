// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina...........: frmMTMovSelReaval (Monta Select MSBem)
//Nº SOL...........: 138268
//Nº KINTANA.......: 840481
//Data da Alteração: 23/06/2010
//Responsável......: Marilza Colpani
//Descrição........: Ajuste na busca de Placa de Tombamento.
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fMTMovSelReaval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCadastroMestreDetMT, MontaSelect, DB, DBClient, DBCtrls,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, TEdNum, TREdit,
  IvMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, uCmSqlParams,
  wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit,
  uCMTypes, uCtrlPadroes, uCtrlParamCAF,
  uCtrlMovReavaliacao, uCtrlResponsavel, uCtrlTerceiro, uCtrlDomBem,
  SdfData, BfDialogs, BrowseFolder, uProcuraDir, IvEMulti, DBTables;

type
  TfrmMTMovSelReaval = class(TFrmCadastroMestreDetMT)
    cdsDet: TCMClientDataSet;
    dsResp: TwwDataSource;
    Label1: TLabel;
    dbeSbxTermo: TwwDBEdit;
    Label4: TLabel;
    dbeResponsavel: TwwDBEdit;
    bbtnSelResp: TBitBtn;
    Processo: TLabel;
    dbeSbxProcesso: TwwDBEdit;
    Label2: TLabel;
    dbeSbxData: TCMDateTimePicker;
    cdsResp: TCMClientDataSet;
    MSResp: TMontaSelect;
    dsSelBem: TwwDataSource;
    Label26: TLabel;
    edPlaca: TEdit;
    bbtnSelBem: TBitBtn;
    Label22: TLabel;
    dbmDesBem: TDBMemo;
    cdsSelBem: TCMClientDataSet;
    bbtnGeraDet: TBitBtn;
    bbtnLimpar: TBitBtn;
    Label30: TLabel;
    Label9: TLabel;
    Label28: TLabel;
    Label48: TLabel;
    Label7: TLabel;
    dbeLocal: TwwDBEdit;
    dbeResp: TwwDBEdit;
    Label17: TLabel;
    edVidaUtil: TDBRealEdit;
    edValLaudo: TDBRealEdit;
    edObsReav: TDBRichEdit;
    MSBem: TMontaSelect;
    tblLaudoReaval: TSdfDataSet;
    cdsBem: TCMClientDataSet;
    bbtnImportar: TBitBtn;
    OpenDialog: TOpenDialog;
    cdsUltReav: TCMClientDataSet;
    sqlUltReav: TCMSqlParams;
    cdsBemxDep: TCMClientDataSet;
    sqlBemxDep: TCMSqlParams;
    qryDet: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure bbtnGeraDetClick(Sender: TObject);
    procedure bbtnLimparClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnImportarClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
  private
    { Private declarations }
    MovReavaliacao : TCtrlMovReavaliacao;
    Responsavel    : TCtrlResponsavel;
    ParamCAF       : TCtrlParamCAF;
    Bem            : TCtrlDomBem;
    //------------------------------------------------------------------------------------
    aIdBem     : Array of Integer;
    iaIdBem    : Integer;
    //------------------------------------------------------------------------------------
    procedure SelTermoReaval(fIdPessoa, fIdSelBaixa : Extended);
    function  InsertIdBem(iIdBem : Integer) : boolean;
    function  DeleteIdBem(iIdBem : Integer) : boolean;
    function  FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
    function  VidaUtilRestante(iEmpresaProp, iIdBem : Integer) : String;
  public
    { Public declarations }
  end;

var
  frmMTMovSelReaval: TfrmMTMovSelReaval;

implementation

{$R *.dfm}

uses fMTSelMultiBem, uSistema, uMensErro, FAguarde;

procedure TfrmMTMovSelReaval.FormCreate(Sender: TObject);
begin
   inherited;
   MovReavaliacao := TCtrlMovReavaliacao.Create;
   MovReavaliacao.InitializeAs(Padroes);
   MovReavaliacao.cds := cds;
   MovReavaliacao.cdsSelBaixaBens := cdsDet;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('SELBAIXA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   //-------------------------------------------------------------------------------------
   bbtnGeraDet.Enabled  := False;
   bbtnLimpar.Enabled   := False;
   bbtnImportar.Enabled := False;
   //-------------------------------------------------------------------------------------
   SelTermoReaval(Sistema.IdEmpresa, -9);

   OpenDialog.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;
//========================================================================================
procedure TfrmMTMovSelReaval.SelTermoReaval(fIdPessoa, fIdSelBaixa : Extended);
begin
   cds.Data := MovReavaliacao.ListaSelReaval(fIdPessoa,fIdSelBaixa);
   if not cds.IsEmpty then
   begin
      cdsDet.Data  := MovReavaliacao.ListaSelReavalBens(cds.FieldByName('IDPESSOA').AsFloat,
                                                        cds.FieldByName('IDSELBAIXA').AsFloat);
      cdsResp.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
   end else
   begin
      cdsDet.Data  := MovReavaliacao.ListaSelReavalBens(Sistema.IdEmpresa,0);
      cdsResp.Data := Responsavel.ListaResponsavel(0);
   end;
   TFloatField(cdsDet.FieldByName('VALORLAUDO')).DisplayFormat := '#,##0.00;(#,##0.00); ';
   //-------------------------------------------------------------------------------------
   // Preenche a lista de bens
   //-------------------------------------------------------------------------------------
   iaIdBem := 0;
   SetLength(aIdBem, iaIdBem);
   if not cdsDet.IsEmpty then
   begin
      while not cdsDet.EOF do
      begin
         InsertIdBem(cdsDet.FieldByName('IDBEM').AsInteger);
         cdsDet.Next;
      end;
      cdsDet.First
   end;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MovReavaliacao.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MovReavaliacao.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MovReavaliacao.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if trim(MovReavaliacao.MessageInfo) <> '' then
      MsgDlg(MovReavaliacao.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelTermoReaval(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      cdsDet.First;
      dbgrdDet.SelectRecord;
      dbgrdDet.UnSelectAll;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroInsert(Sender: TObject);
begin
   SelTermoReaval(Sistema.IdEmpresa,-9);
   inherited;
   bbtnGeraDet.Enabled  := True;
   bbtnLimpar.Enabled   := True;
   bbtnImportar.Enabled := True;
   dbeSbxTermo.ReadOnly := False;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   cds.FieldByName('SBTIPOMOV').AsInteger := 2;  // 0 - Baixa, 1 - Transferência, 2 - Reavaliação
   //-------------------------------------------------------------------------------------
   dbeSbxTermo.SetFocus;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroDelete(Sender: TObject);
begin
   cdsDet.First;
   while not cdsDet.EOF do
      cdsDet.Delete;
   inherited;
   bbtnGeraDet.Enabled  := False;
   bbtnImportar.Enabled := False;
   bbtnLimpar.Enabled   := False;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled  := True;
   bbtnImportar.Enabled := False;
   bbtnLimpar.Enabled   := True;
   dbeSbxTermo.ReadOnly := True;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResp.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSResp.RetornouValor then
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(StrToFloat(MSResp.ValoresChave[0]));
      cds.FieldbyName('IDRESPONSAVEL').AsFloat := cdsResp.FieldbyName('IDRESPONSAVEL').AsFloat;
   end else
   if not cds.FieldByName('IDRESPONSAVEL').IsNull then
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
      cds.FieldbyName('IDRESPONSAVEL').AsFloat := cdsResp.FieldbyName('IDRESPONSAVEL').AsFloat;
   end else
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(0);
      cds.FieldbyName('IDRESPONSAVEL').Clear;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.bbtnGeraDetClick(Sender: TObject);
var
   iPos : Integer;

begin
   inherited;
   Application.CreateForm(TfrmMTSelMultiBem,frmMTSelMultiBem);
   frmMTSelMultiBem.FormStyle := FsNormal;
   frmMTSelMultiBem.Visible   := False;
   frmMTSelMultiBem.Top       := 84;
   frmMTSelMultiBem.ShowModal;
   //-------------------------------------------------------------------------------------
   if frmMTSelMultiBem.bResult then
   begin
      cdsDet.DisableControls;
      frmMTSelMultiBem.cds.First;
      while not frmMTSelMultiBem.cds.EOF do
      begin
         if frmMTSelMultiBem.cds.FieldByName('PROCESSAR').AsInteger = 1 then
         begin
            //----------------------------------------------------------------------------
            // Processa somente os bens não baixados
            //----------------------------------------------------------------------------
            if frmMTSelMultiBem.cds.FieldByName('BAIXATOTAL').AsString <> 'S' then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa se o bem já foi cadastrado, tentando incluir na lista de idbem
               //-------------------------------------------------------------------------
               if not FindIdBem(frmMTSelMultiBem.cds.FieldByName('IDBEM').AsInteger, iPos) then
               begin
                  cdsDet.Append;
                  cdsDet.FieldByName('IDPESSOA').AsInteger      := frmMTSelMultiBem.cds.FieldByName('IDPESSOA').AsInteger;
                  cdsDet.FieldByName('IDBEM').AsInteger         := frmMTSelMultiBem.cds.FieldByName('IDBEM').AsInteger;
                  cdsDet.FieldByName('PLACA').AsFloat           := frmMTSelMultiBem.cds.FieldByName('PLACA').AsFloat;
                  cdsDet.FieldByName('DESBEM').AsString         := frmMTSelMultiBem.cds.FieldByName('DESBEM').AsString;
                  cdsDet.FieldByName('BAIXATOTAL').AsString     := frmMTSelMultiBem.cds.FieldByName('BAIXATOTAL').AsString;
                  cdsDet.FieldByName('VIDAUTIL').AsString       := VidaUtilRestante(cdsDet.FieldByName('IDPESSOA').AsInteger,cdsDet.FieldByName('IDBEM').AsInteger);
                  cdsDet.FieldByName('VALORLAUDO').AsFloat      := 0;
                  cdsDet.FieldByName('TIPDEPPRORATA').AsInteger := 0;
                  cdsDet.FieldByName('OBSREAVAL').AsString      := '';
                  cdsDet.Post;
                  //----------------------------------------------------------------------
                  InsertIdBem(frmMTSelMultiBem.cds.FieldByName('IDBEM').AsInteger);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         frmMTSelMultiBem.cds.Next;
      end;
      cdsDet.First;
      cdsDet.EnableControls;
      sbtnAltDet.Enabled := not (frmMTSelMultiBem.cds.IsEmpty);
      sbtnExcluiDet.Enabled := not (frmMTSelMultiBem.cds.IsEmpty);
   end;
   //-------------------------------------------------------------------------------------
   frmMTSelMultiBem.cds.Close;
   frmMTSelMultiBem.Release;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.bbtnLimparClick(Sender: TObject);
begin
   inherited;
   cdsDet.DisableControls;
   cdsDet.First;
   while not cdsDet.EOF do
   begin
      DeleteIdBem(cdsDet.FieldByName('IDBEM').AsInteger);
      cdsDet.Delete;
   end;
   //-------------------------------------------------------------------------------------
   cdsDet.EnableControls;
   Application.ProcessMessages
end;
//========================================================================================
procedure TfrmMTMovSelReaval.sbtnAlterarClick(Sender: TObject);
begin
   if cds.FieldByName('SBXFLGEXECUTADO').AsInteger = 0 then
   begin
      inherited;
   end else
   begin
      MsgDlg('Termo de Reavaliação executado em ' + cds.FieldByname('SBXDTAEXECUTADO').AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelTermoReaval(Sistema.IdEmpresa, -9);
      bbtnCancelar.Click;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.sbtnApagarClick(Sender: TObject);
begin
   if cds.FieldByName('SBXFLGEXECUTADO').AsInteger = 0 then
   begin
      inherited;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      SelTermoReaval(Sistema.IdEmpresa, -9);
   end else
   begin
      MsgDlg('Termo de Reavaliação executado em ' + cds.FieldByName('SBXDTAEXECUTADO').AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelTermoReaval(Sistema.IdEmpresa, -9);
      bbtnCancelar.Click;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   edPlaca.Text := '';
   cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa, 0);
   //-------------------------------------------------------------------------------------
   bbtnSelBem.Enabled := True;
   edPlaca.ReadOnly := False;
   edPlaca.SetFocus;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   edPlaca.Text := cdsDet.FieldByName('PLACA').AsString;
   cdsSelBem.Data := Bem.ListaBem(cdsDet.FieldByName('IDPESSOA').AsFloat,
                                  cdsDet.FieldByName('IDBEM').AsFloat);
   //-------------------------------------------------------------------------------------
   bbtnSelBem.Enabled := False;
   edPlaca.ReadOnly := True;
   edVidaUtil.SetFocus;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeDetalheDelete(Sender: TObject);
begin
   cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa, cdsDet.FieldByName('IDBEM').AsInteger);
   edPlaca.Text := floattostr(cdsSelBem.FieldByName('PLACA').AsFloat);
   //-------------------------------------------------------------------------------------
   if MsgDlg('Confirma a remoção do Bem da Seleção para Reavaliação','Remoção',
             mtConfirmation,[mbOk,mbCancel],0) = mrOk then
   begin
      inherited;
      DeleteIdBem(cdsSelBem.FieldByName('IDBEM').AsInteger);
   end;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.edPlacaExit(Sender: TObject);
var
   iIdBem : Integer;
begin
   inherited;
   if edPlaca.Text <> '' then
   begin
      iIdBem := Bem.PlacaIdBem(Sistema.IdEmpresa, edPlaca.Text);
      if iIdBem <= 0 then
      begin
         MsgDlg('Placa não Localizada','Erro', mtError, [mbOk], 0)
      end else
      begin
         cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa, iIdBem);
         edPlaca.Text := cdsSelBem.FieldByName('PLACA').AsString;
      end
   end else
   begin
      cdsSelBem.Data := Bem.ListaBem(0,0);
      edPlaca.Text := '';
   end;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.bbtnSelBemClick(Sender: TObject);
begin
  inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      edPlaca.Text := MSBem.ValoresChave[2];
   end else
   begin
      cdsSelBem.Data  := Bem.ListaBem(0,0);
      edPlaca.Text    := '';
   end;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.sbtnInsDetClick(Sender: TObject);
begin
   bbtnImportar.Enabled   := False;
   bbtnGeraDet.Enabled    := False;
   bbtnLimpar.Enabled     := False;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnImportar.Enabled  := True;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnImportar.Enabled  := True;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeDetalheConfirma(Sender: TObject);
var
   iPos : Integer;
begin
   if cdsDet.State in [dsInsert,dsEdit] then
   begin
      if (trim(edPlaca.Text) = '') or (cdsSelBem.IsEmpty) Then
      begin
         MsgDlg('Nenhum Bem foi Selecionado','Erro',mtError,[mbOK],0);
         bbtnSelBem.SetFocus;
      end else
      begin
         //-------------------------------------------------------------------------------
         // Pesquisa se o bem já foi cadastrado
         //-------------------------------------------------------------------------------
         if not FindIdBem(cdsSelBem.FieldByName('IDBEM').AsInteger, iPos) then
         begin
            cdsDet.FieldByName('IDPESSOA').AsInteger  := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
            cdsDet.FieldByName('IDBEM').AsInteger     := cdsSelBem.FieldByName('IDBEM').AsInteger;
            cdsDet.FieldByName('PLACA').AsFloat       := cdsSelBem.FieldByName('PLACA').AsFloat;
            cdsDet.FieldByName('DESBEM').AsString     := cdsSelBem.FieldByName('DESBEM').AsString;
            cdsDet.FieldByName('BAIXATOTAL').AsString := cdsSelBem.FieldByName('BAIXATOTAL').AsString;
            //----------------------------------------------------------------------------
            InsertIdBem(cdsSelBem.FieldByName('IDBEM').AsInteger);
         end;
      end;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   iTotErros : Integer;
begin
   Accept := True;
   //-------------------------------------------------------------------------------------
   if trim(dbeSbxTermo.Text) = '' then
   begin
      MsgDlg('O número do Termo de Reavaliação não foi preenchido', 'Erro', mtError, [mbOK], 0);
      dbeSbxTermo.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if trim(dbeSbxProcesso.Text) = '' then
   begin
       MsgDlg('Processo não foi preenchido', 'Erro', mtError, [mbOK], 0);
       dbeSbxProcesso.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if trim(dbeSbxData.Text) = '' then
   begin
       MsgDlg('Data do cadastramento do termo não foi preenchida','Erro',mtError,[mbOK],0);
       dbeSbxData.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if trim(dbeResponsavel.Text) = '' then
   begin
       MsgDlg('Responsável pelo termo não foi selecionado','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   begin
      iTotErros := 0;
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         if cdsDet.FieldByName('VIDAUTIL').AsInteger < 0 then
         begin
            MsgDlg('A Vida Útil em Meses do bem ' + cdsDet.FieldByName('PLACA').AsString +
                   ' não foi definida!', 'Erro', mtError, [mbOK], 0);
            iTotErros := iTotErros + 1;
         end else
         if cdsDet.FieldByName('VALORLAUDO').AsFloat <= 0 then
         begin
            MsgDlg('A Valor do bem ' + cdsDet.FieldByName('PLACA').AsString +
                   ' no Laudo de Reavaliação não foi informado!', 'Erro', mtError, [mbOK], 0);
            iTotErros := iTotErros + 1;
         end else
         if cdsDet.FieldByName('OBSREAVAL').AsString = '' then
         begin
            MsgDlg('A Observação do bem ' + cdsDet.FieldByName('PLACA').AsString +

                   ' não foi informado!', 'Erro', mtError, [mbOK], 0);
            iTotErros := iTotErros + 1;
         end;
         //-------------------------------------------------------------------------------
         cdsDet.Next;
      end;
      //----------------------------------------------------------------------------------
      if iTotErros > 0 then
      begin
         MsgDlg('Acerte os bens com dados incorretos/incompletos!',
                'Erro', mtError, [mbOK], 0);
         Accept := False;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if not Accept then Exit;
   inherited;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;
begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelTermoReaval(Sistema.IdEmpresa,-9);
   //-------------------------------------------------------------------------------------
   bbtnImportar.Enabled  := False;
   bbtnGeraDet.Enabled   := False;
   bbtnLimpar.Enabled    := False;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelTermoReaval(Sistema.IdEmpresa, -9);
   //-------------------------------------------------------------------------------------
   bbtnImportar.Enabled  := False;
   bbtnGeraDet.Enabled   := False;
   bbtnLimpar.Enabled    := False;
end;
//========================================================================================
function TfrmMTMovSelReaval.InsertIdBem(iIdBem : Integer) : boolean;
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
function TfrmMTMovSelReaval.DeleteIdBem(iIdBem : Integer) : boolean;
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
function TfrmMTMovSelReaval.FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
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
//========================================================================================
procedure TfrmMTMovSelReaval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   MovReavaliacao.Free;
   Responsavel.Free;
   Bem.Free;
   ParamCAF.Free;
end;
//========================================================================================
procedure TfrmMTMovSelReaval.bbtnImportarClick(Sender: TObject);
Var
   fIdPessoa, fIdBem,
   fValorLaudo : Extended;
   iVidaUtil, iPos : Integer;
   sObsReaval : String;

begin
   inherited;
   if not OpenDialog.Execute then Exit;
   //-------------------------------------------------------------------------------------
   tblLaudoReaval.Close;
   tblLaudoReaval.FileName := OpenDialog.FileName;
   tblLaudoReaval.Open;
   //-------------------------------------------------------------------------------------
   frmAguarde.Min := 0;
   frmAguarde.Pos := 0; 
   frmAguarde.Max := tblLaudoReaval.RecordCount;
   frmAguarde.Mostra('Importando Laudo de Reavaliação');
   //-------------------------------------------------------------------------------------
   cdsDet.DisableControls;
   while not tblLaudoReaval.EOF do
   begin
      fIdPessoa   := strtofloat(trim(tblLaudoReaval.Fields[0].AsString));
      fIdBem      := strtofloat(trim(tblLaudoReaval.Fields[1].AsString));
      iVidaUtil   := strtoint(trim(tblLaudoReaval.Fields[3].AsString));
      fValorLaudo := strtofloat(trim(tblLaudoReaval.Fields[4].AsString));
      sObsReaval  := trim(tblLaudoReaval.Fields[5].AsString);
      //----------------------------------------------------------------------------------
      frmAguarde.Pos := frmAguarde.Pos + 1;
      frmAguarde.Caption := 'Processando Placa ' + trim(tblLaudoReaval.Fields[2].AsString);
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Processar somente os bens da empresa selecionada no Login
      //----------------------------------------------------------------------------------
      if fIdPessoa = Sistema.IdEmpresa then
      begin
         cdsBem.Data := Bem.ListaBem(Trunc(fIdPessoa), Trunc(fIdBem));
         //-------------------------------------------------------------------------------
         // Pesquisa se o bem já foi cadastrado, tentando incluir na lista de idbem
         //-------------------------------------------------------------------------------
         if not FindIdBem(cdsBem.FieldByName('IDBEM').AsInteger, iPos) then
         begin
            cdsDet.Append;
            cdsDet.FieldByName('IDPESSOA').AsInteger      := cdsBem.FieldByName('IDPESSOA').AsInteger;
            cdsDet.FieldByName('IDBEM').AsInteger         := cdsBem.FieldByName('IDBEM').AsInteger;
            cdsDet.FieldByName('PLACA').AsFloat           := cdsBem.FieldByName('PLACA').AsFloat;
            cdsDet.FieldByName('DESBEM').AsString         := cdsBem.FieldByName('DESBEM').AsString;
            cdsDet.FieldByName('BAIXATOTAL').AsString     := cdsBem.FieldByName('BAIXATOTAL').AsString;
            cdsDet.FieldByName('VIDAUTIL').AsInteger      := iVidaUtil;
            cdsDet.FieldByName('VALORLAUDO').AsFloat      := fValorLaudo;
            cdsDet.FieldByName('TIPDEPPRORATA').AsInteger := 0;
            cdsDet.FieldByName('OBSREAVAL').AsString      := sObsReaval;
            cdsDet.Post;
            //----------------------------------------------------------------------------
            InsertIdBem(cdsBem.FieldByName('IDBEM').AsInteger);
         end;
      end;
      tblLaudoReaval.Next;
   end;
   cdsDet.First;
   cdsDet.EnableControls;
   tblLaudoReaval.Close;
   frmAguarde.Apaga;
   Application.ProcessMessages;
   dbgrdDet.SetFocus;
end;
//========================================================================================
function TfrmMTMovSelReaval.VidaUtilRestante(iEmpresaProp, iIdBem : Integer) : String;
Var
   fVidaUtil, fDiasJaDeprec : Extended;

begin
   try
      if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
         Raise Exception.Create('Parâmetros do sistema inválidos!');
      //----------------------------------------------------------------------------------
      sqlUltReav.Prepare;
      sqlUltReav.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
      sqlUltReav.ParamByName('IDBEM').AsInteger     := iIdBem;
      sqlUltReav.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
      sqlUltReav.ParamByName('IDTAXADEP').AsInteger := 1;                        // Brasil
      sqlUltReav.Open;
      if not cdsUltReav.IsEmpty then
      begin
         if cdsUltReav.FieldByName('TAXADEP').AsFloat <> 0 then
         begin
            fVidaUtil := (100 / cdsUltReav.FieldByName('TAXADEP').asFloat) * 365.25;
            fVidaUtil := fVidaUtil + (fVidaUtil / 365.25);
            fDiasJaDeprec := (cdsUltReav.FieldByName('DATAULTDEP').asDateTime - cdsUltReav.FieldByName('DATAREAVALIACAO').AsDateTime);
            //----------------------------------------------------------------------------
            fVidaUtil := int((fVidaUtil - fDiasJaDeprec) / 30.4375) - 1;
            if fVidaUtil <= 0 then
               fVidaUtil := 0;
         end else
         begin
            fVidaUtil := 0;
         end;
      end else
      begin
         sqlBemxDep.Prepare;
         sqlBemxDep.ParamByName('IDBEM').AsInteger     := iEmpresaProp;
         sqlBemxDep.ParamByName('IDPESSOA').AsInteger  := iIdBem;
         sqlBemxDep.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
         sqlBemxDep.ParamByName('IDTAXADEP').AsInteger := 1;                     // Brasil
         sqlBemxDep.Open;
         if cdsBemxDep.FieldByName('TAXADEP').AsFloat <> 0 then
         begin
            fVidaUtil := (100 / cdsBemxDep.FieldByName('TAXADEP').asFloat) * 365.25; // TaxaAnual -> TaxaDiaria
            fVidaUtil := fVidaUtil + (fVidaUtil / 365.25); // Dias a Depreciar
            fDiasJaDeprec := (cdsBemxDep.FieldByName('DATAULTDEP').asDateTime - cdsBemxDep.FieldByName('DATAINICIODEP').AsDateTime);
            //----------------------------------------------------------------------------
            fVidaUtil := ((fVidaUtil - fDiasJaDeprec) / 30.4375) - 1;
            if fVidaUtil <= 0 then
               fVidaUtil := 0;
         end else
         begin
            fVidaUtil := 0;
         end;
      end;
   except
      fVidaUtil := 0;
   end;
   //-------------------------------------------------------------------------------------
   if fVidaUtil <> 0 then
      Result := FormatFloat('###0',fVidaUtil)
   else
      Result := '';
end;

end.
