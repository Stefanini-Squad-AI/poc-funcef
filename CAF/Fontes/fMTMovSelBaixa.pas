unit fMTMovSelBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCadastroMestreDetMT, MontaSelect, DB, DBClient, DBCtrls,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, uCmSqlParams,
  wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit,
  uCMTypes, uCtrlPadroes,
  uCtrlMovBaixa, uCtrlResponsavel, uCtrlTerceiro, uCtrlDomBem, IvEMulti;

type
  TfrmMTMovSelBaixa = class(TFrmCadastroMestreDetMT)
    cdsDet: TCMClientDataSet;
    sqlDet: TCMSqlParams;
    dsResp: TwwDataSource;
    dsDestBaixa: TwwDataSource;
    Label1: TLabel;
    dbeSbxTermo: TwwDBEdit;
    Label4: TLabel;
    dbeResponsavel: TwwDBEdit;
    bbtnSelResp: TBitBtn;
    Processo: TLabel;
    dbeSbxProcesso: TwwDBEdit;
    Label2: TLabel;
    dbeSbxData: TCMDateTimePicker;
    dbeDestBaixa: TwwDBEdit;
    bbtnDestBaixa: TBitBtn;
    Label6: TLabel;
    cdsResp: TCMClientDataSet;
    MSResp: TMontaSelect;
    cdsDestBaixa: TCMClientDataSet;
    dsSelBem: TwwDataSource;
    Label26: TLabel;
    edPlaca: TEdit;
    bbtnSelBem: TBitBtn;
    Label22: TLabel;
    dbmDesBem: TDBMemo;
    Label5: TLabel;
    dbeConjunto: TwwDBEdit;
    Label7: TLabel;
    dbeLocal: TwwDBEdit;
    dbeResp: TwwDBEdit;
    Label17: TLabel;
    cdsSelBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    MSDestBaixa: TMontaSelect;
    bbtnGeraDet: TBitBtn;
    bbtnLimpar: TBitBtn;
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
    procedure bbtnDestBaixaClick(Sender: TObject);
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
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    MovBaixa     : TCtrlMovBaixa;
    Responsavel  : TCtrlResponsavel;
    Terceiro     : TCtrlTerceiro;
    Bem          : TCtrlDomBem;
    //------------------------------------------------------------------------------------
    aIdBem     : Array of Integer;
    iaIdBem    : Integer;
    //------------------------------------------------------------------------------------
    procedure SelTermoBaixa(fIdPessoa, fIdSelBaixa : Extended);
    function  InsertIdBem(iIdBem : Integer) : boolean;
    function  DeleteIdBem(iIdBem : Integer) : boolean;
    function  FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
  public
    { Public declarations }
  end;

var
  frmMTMovSelBaixa: TfrmMTMovSelBaixa;

implementation

{$R *.dfm}

uses fMTSelMultiBem, uSistema, uMensErro;

procedure TfrmMTMovSelBaixa.FormCreate(Sender: TObject);
begin
   inherited;
   MovBaixa := TCtrlMovBaixa.Create;
   MovBaixa.InitializeAs(Padroes);
   MovBaixa.cds := cds;
   MovBaixa.cdsSelBaixaBens := cdsDet;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Terceiro := TCtrlTerceiro.Create;
   Terceiro.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('SELBAIXA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   //-------------------------------------------------------------------------------------
   bbtnGeraDet.Enabled := False;
   bbtnLimpar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   SelTermoBaixa(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.SelTermoBaixa(fIdPessoa, fIdSelBaixa : Extended);
begin
   cds.Data := MovBaixa.ListaSelBaixa(fIdPessoa,fIdSelBaixa);
   if not cds.IsEmpty then
   begin
      cdsDet.Data  := MovBaixa.ListaSelBaixaBens(cds.FieldByName('IDPESSOA').AsFloat,
                                                 cds.FieldByName('IDSELBAIXA').AsFloat,
                                                 cds.FieldByName('SBXDATA').AsDateTime);
      cdsResp.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
      cdsDestBaixa.Data := Terceiro.ListaTerceiro(cds.FieldByName('IDDESTINOBAIXA').AsFloat, 1)
   end else
   begin
      cdsDet.Data  := MovBaixa.ListaSelBaixaBens(Sistema.IdEmpresa,0,0);
      cdsResp.Data := Responsavel.ListaResponsavel(0);
      cdsDestBaixa.Data := Terceiro.ListaTerceiro(0, 1)
   end;
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
procedure TfrmMTMovSelBaixa.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MovBaixa.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MovBaixa.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MovBaixa.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if trim(MovBaixa.MessageInfo) <> '' then
      MsgDlg(MovBaixa.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelTermoBaixa(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      cdsDet.First;
      dbgrdDet.SelectRecord;
      dbgrdDet.UnSelectAll;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroInsert(Sender: TObject);
begin
   SelTermoBaixa(Sistema.IdEmpresa,0);
   inherited;
   bbtnGeraDet.Enabled := True;
   bbtnLimpar.Enabled  := True;
   dbeSbxTermo.Enabled := True;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   cds.FieldByName('SBTIPOMOV').AsInteger := 0;  // 0 - Baixa, 1 - Transferência
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroDelete(Sender: TObject);
begin
   cdsDet.First;
   while not cdsDet.EOF do
      cdsDet.Delete;
   inherited;
   bbtnGeraDet.Enabled := False;
   bbtnLimpar.Enabled := False;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled := True;
   bbtnLimpar.Enabled  := True;
   dbeSbxTermo.Enabled := False;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.bbtnSelRespClick(Sender: TObject);
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
procedure TfrmMTMovSelBaixa.bbtnDestBaixaClick(Sender: TObject);
begin
   inherited;
   MSDestBaixa.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSDestBaixa.RetornouValor then
   begin
      cdsDestBaixa.Data := Terceiro.ListaTerceiro(StrToFloat(MSDestBaixa.ValoresChave[0]), 1);
      cds.FieldByName('IDDESTINOBAIXA').AsFloat := cdsDestBaixa.FieldByName('IDPESSOA').AsFloat;
   end else
   if not cds.FieldByName('IDDESTINOBAIXA').IsNull then
   begin
      cdsDestBaixa.Data := Terceiro.ListaTerceiro(cds.FieldByName('IDDESTINOBAIXA').AsFloat, 1);
      cds.FieldByName('IDDESTINOBAIXA').AsFloat := cdsDestBaixa.FieldByName('IDPESSOA').AsFloat;
   end else
   begin
      cdsDestBaixa.Data := Terceiro.ListaTerceiro(0);
      cds.FieldByName('IDDESTINOBAIXA').Clear;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.bbtnGeraDetClick(Sender: TObject);
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
            // Processa somente os bens não baixados e não penhorados
            //----------------------------------------------------------------------------
            if (frmMTSelMultiBem.cds.FieldByName('BAIXATOTAL').AsString <> 'S') and
               (frmMTSelMultiBem.cds.FieldByName('FLGPENHORA').AsInteger <> 1) then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa se o bem já foi cadastrado, tentando incluir na lista de idbem
               //-------------------------------------------------------------------------
               if not FindIdBem(frmMTSelMultiBem.cds.FieldByName('IDBEM').AsInteger, iPos) then
               begin
                  cdsDet.Append;
                  cdsDet.FieldByName('IDPESSOA').AsInteger  := frmMTSelMultiBem.cds.FieldByName('IDPESSOA').AsInteger;
                  cdsDet.FieldByName('IDBEM').AsInteger     := frmMTSelMultiBem.cds.FieldByName('IDBEM').AsInteger;
                  cdsDet.FieldByName('PLACA').AsFloat       := frmMTSelMultiBem.cds.FieldByName('PLACA').AsFloat;
                  cdsDet.FieldByName('DESBEM').AsString     := frmMTSelMultiBem.cds.FieldByName('DESBEM').AsString;
                  cdsDet.FieldByName('BAIXATOTAL').AsString := frmMTSelMultiBem.cds.FieldByName('BAIXATOTAL').AsString;
                  cdsDet.FieldByName('FLGPENHORA').AsInteger := frmMTSelMultiBem.cds.FieldByName('FLGPENHORA').AsInteger;
                  cdsDet.FieldByName('SBBVALVENDA').AsFloat := 0;
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
procedure TfrmMTMovSelBaixa.bbtnLimparClick(Sender: TObject);
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
procedure TfrmMTMovSelBaixa.sbtnAlterarClick(Sender: TObject);
begin
   if cds.FieldByName('SBXFLGEXECUTADO').AsInteger = 0 then
   begin
      inherited;
   end else
   begin
      MsgDlg('Termo de Baixa executado em ' + cds.FieldByname('SBXDTAEXECUTADO').AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelTermoBaixa(Sistema.IdEmpresa, -1);
      bbtnCancelar.Click;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.sbtnApagarClick(Sender: TObject);
begin
   if cds.FieldByName('SBXFLGEXECUTADO').AsInteger = 0 then
   begin
      inherited;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      SelTermoBaixa(Sistema.IdEmpresa, -1);
   end else
   begin
      MsgDlg('Termo de Baixa executado em ' + cds.FieldByName('SBXDTAEXECUTADO').AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelTermoBaixa(Sistema.IdEmpresa, -1);
      bbtnCancelar.Click;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa, 0);
   edPlaca.Text := '';
   //-------------------------------------------------------------------------------------
   edPlaca.SetFocus;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeDetalheDelete(Sender: TObject);
begin
   cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa, cdsDet.FieldByName('IDBEM').AsInteger);
   edPlaca.Text := floattostr(cdsSelBem.FieldByName('PLACA').AsFloat);
   //-------------------------------------------------------------------------------------
   if MsgDlg('Confirma a remoção do Bem da Seleção para Baixa','Remoção',
             mtConfirmation,[mbOk,mbCancel],0) = mrOk then
   begin
      inherited;
      DeleteIdBem(cdsSelBem.FieldByName('IDBEM').AsInteger);
   end;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.edPlacaExit(Sender: TObject);
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
         //-------------------------------------------------------------------------------
         if cdsSelBem.FieldByName('FLGPENHORA').AsInteger = 1 then
         begin
            MsgDlg('Bem penhorado!','Erro',mtError,[mbOk],0);
            cdsSelBem.Data  := Bem.ListaBem(0,0);
            edPlaca.Text    := '';
         end else
         if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MsgDlg('Bem já baixado!','Erro',mtError,[mbOk],0);
            cdsSelBem.Data  := Bem.ListaBem(0,0);
            edPlaca.Text    := '';
         end;
      end
   end else
   begin
      cdsSelBem.Data := Bem.ListaBem(0,0);
      edPlaca.Text := '';
   end;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.bbtnSelBemClick(Sender: TObject);
begin
  inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      edPlaca.Text := MSBem.ValoresChave[2];
      //----------------------------------------------------------------------------------
      if cdsSelBem.FieldByName('FLGPENHORA').AsInteger = 1 then
      begin
         MsgDlg('Bem penhorado!','Erro',mtError,[mbOk],0);
         cdsSelBem.Data  := Bem.ListaBem(0,0);
         edPlaca.Text    := '';
      end else
      if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
      begin
         MsgDlg('Bem já baixado!','Erro',mtError,[mbOk],0);
         cdsSelBem.Data  := Bem.ListaBem(0,0);
         edPlaca.Text    := '';
      end;
   end else
   begin
      cdsSelBem.Data  := Bem.ListaBem(0,0);
      edPlaca.Text    := '';
   end;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.sbtnInsDetClick(Sender: TObject);
begin
   bbtnGeraDet.Enabled    := False;
   bbtnLimpar.Enabled     := False;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeDetalheConfirma(Sender: TObject);
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
            cdsDet.FieldByName('FLGPENHORA').AsInteger := cdsSelBem.FieldByName('FLGPENHORA').AsInteger;
            //----------------------------------------------------------------------------
            InsertIdBem(cdsSelBem.FieldByName('IDBEM').AsInteger);
         end;
      end;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   fTotPerc : Extended;
begin
   Accept := True;
   //-------------------------------------------------------------------------------------
   if trim(dbeSbxTermo.Text) = '' then
   begin
      MsgDlg('O número do termo de baixa não foi preenchido', 'Erro', mtError, [mbOK], 0);
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
      fTotPerc := 0;
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         if cdsDet.FieldByName('BAIXATOTAL').AsString = 'S' then
            MsgDlg('O bem ' + cdsDet.FieldByName('PLACA').AsString + ' está baixado.',
                   'Erro', mtError, [mbOK], 0);
         if cdsDet.FieldByName('FLGPENHORA').AsInteger = 1 then
            MsgDlg('O bem ' + cdsDet.FieldByName('PLACA').AsString + ' está penhorado.',
                   'Erro', mtError, [mbOK], 0);
         fTotPerc := fTotPerc + 1;
         cdsDet.Next;
      end;
      //----------------------------------------------------------------------------------
      if fTotperc <= 0 then
      begin
         MsgDlg('Selecione os bens que serão baixados!', 'Erro', mtError, [mbOK], 0);
         Accept := False;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if not Accept then Exit;
   inherited;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;
begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelTermoBaixa(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   bbtnGeraDet.Enabled   := False;
   bbtnLimpar.Enabled    := False;
end;
//========================================================================================
procedure TfrmMTMovSelBaixa.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelTermoBaixa(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   bbtnGeraDet.Enabled   := False;
   bbtnLimpar.Enabled    := False;
end;
//========================================================================================
function TfrmMTMovSelBaixa.InsertIdBem(iIdBem : Integer) : boolean;
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
function TfrmMTMovSelBaixa.DeleteIdBem(iIdBem : Integer) : boolean;
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
function TfrmMTMovSelBaixa.FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
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
procedure TfrmMTMovSelBaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   MovBaixa.Free;
   Responsavel.Free;
   Terceiro.Free;
   Bem.Free;
end;

procedure TfrmMTMovSelBaixa.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  CmeCadastroFind(self);
end;

end.
