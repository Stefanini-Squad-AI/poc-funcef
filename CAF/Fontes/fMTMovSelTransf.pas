// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//******************************************************************************
{-------------------------------------------------------------------------------
Rotina...........: ListaSelBaixaBens
Nº SIG...........: 130571
Data da Alteração: 28/12/2022
Responsável......: Andre Imakawa
Descrição........: Criação do campo de seleção
-------------------------------------------------------------------------------}

unit fMTMovSelTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCadastroMestreDetMT, MontaSelect, DB, DBClient, IvEMulti,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, DBTables, Wwquery,
  uCMTypes, uCtrlPadroes, uCtrlMovTransfBem, uCtrlResponsavel, uCtrlParamCAF, uCtrlDomBem,
  uCtrlConjunto, uCtrlLocalizacoes, uCtrlGrupoContab, uCmSqlParams;

type
  TfrmMTMovSelTransf = class(TFrmCadastroMestreDetMT)
    dsResp: TwwDataSource;
    dsSelBem: TwwDataSource;
    dsLocal: TwwDataSource;
    dsRespConj: TwwDataSource;
    pnlRegNovos: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbeConjunto: TwwDBEdit;
    bbtnSelConjunto: TBitBtn;
    dbeGrupo: TwwDBEdit;
    dbeConjNovo: TwwDBEdit;
    dbeGrupoNovo: TwwDBEdit;
    bbtnSelGrupo: TBitBtn;
    Dock975: TDock97;
    Toolbar973: TToolbar97;
    bbtnOkConjGrup: TBitBtn;
    bbtnCancConjGrup: TBitBtn;
    dbeLocal: TwwDBEdit;
    dbeLocalNovo: TwwDBEdit;
    bbtnSelLocal: TBitBtn;
    dbeResp: TwwDBEdit;
    dbeRespNovo: TwwDBEdit;
    bbtnSelRespConj: TBitBtn;
    Label1: TLabel;
    dbeSbxTermo: TwwDBEdit;
    Processo: TLabel;
    dbeSbxProcesso: TwwDBEdit;
    Label2: TLabel;
    dbeSbxData: TCMDateTimePicker;
    Label4: TLabel;
    dbeResponsavel: TwwDBEdit;
    bbtnSelResp: TBitBtn;
    cdsDet: TCMClientDataSet;
    dsConjunto: TwwDataSource;
    dsGrupo: TwwDataSource;
    cdsResp: TCMClientDataSet;
    Label26: TLabel;
    edPlaca: TEdit;
    bbtnSelBem: TBitBtn;
    dbmDesBem: TDBMemo;
    Label22: TLabel;
    cdsSelBem: TCMClientDataSet;
    Toolbar972: TToolbar97;
    bbtnGeraDet: TBitBtn;
    bbtnLimpar: TBitBtn;
    cdsGrupo: TCMClientDataSet;
    cdsLocal: TCMClientDataSet;
    cdsConjunto: TCMClientDataSet;
    cdsRespConj: TCMClientDataSet;
    MSBem: TMontaSelect;
    MSResp: TMontaSelect;
    MSConjunto: TMontaSelect;
    MSLocal: TMontaSelect;
    MSRespConj: TMontaSelect;
    MSGrupo: TMontaSelect;
    sqlDet: TCMSqlParams;
    sqlSelBem: TCMSqlParams;
    cdsGrupoTaxaDep2: TCMClientDataSet;
    cdsGrupoTaxaDep1: TCMClientDataSet;
    pnlSelecao: TPanel;
    btnInverte: TBitBtn;
    chkAplicaTodos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure edPlacaExit(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure bbtnGeraDetClick(Sender: TObject);
    procedure bbtnLimparClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure bbtnSelRespConjClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnOkConjGrupClick(Sender: TObject);
    procedure bbtnCancConjGrupClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure btnInverteClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    MovTransfBem : TCtrlMovTransfBem;
    Conjunto     : TCtrlConjunto;
    Localizacao  : TCtrlLocalizacoes;
    Responsavel  : TCtrlResponsavel;
    GrupoContab  : TCtrlGrupoContab;
    ParamCAF     : TCtrlParamCAF;
    Bem          : TCtrlDomBem;
    //------------------------------------------------------------------------------------
    aIdBem     : Array of Integer;
    iaIdBem    : Integer;
    fGrupoNovo : Extended;
    //------------------------------------------------------------------------------------
    procedure SelTermoTransf(fIdPessoa, fIdSelBaixa : Extended);
    function  InsertIdBem(iIdBem : Integer) : boolean;
    function  DeleteIdBem(iIdBem : Integer) : boolean;
    function  FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
    Procedure RetornaDetalhe;
    function  AplicarTodos(aIdConjunto, aIdlocalizacao, aIdResponsavel, aIdGrupo: Double): boolean;
  public
    { Public declarations }

  end;

var
  frmMTMovSelTransf: TfrmMTMovSelTransf;

implementation

{$R *.dfm}

uses fMTSelMultiBem, uSistema, uMensErro;

procedure TfrmMTMovSelTransf.FormCreate(Sender: TObject);
begin
   inherited;
   MovTransfBem := TCtrlMovTransfBem.Create;
   MovTransfBem.InitializeAs(Padroes);
   MovTransfBem.cds := cds;
   MovTransfBem.cdsSelBaixaBens := cdsDet;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Localizacao := TCtrlLocalizacoes.Create;
   Localizacao.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   // Bloqueia transferência de local/responsável qdo PARAMCAF.TIPOCONJUNTO = 1
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   if ParamCAF.TIPOCONJUNTO = 1 then
   begin
      bbtnSelLocal.Enabled    := False;
      bbtnSelRespConj.Enabled := False;
   end else
   begin
      bbtnSelLocal.Enabled    := True;
      bbtnSelRespConj.Enabled := True;
   end;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('SELBAIXA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.INATIVO = 0');
   MSGrupo.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupo.Filtro.Add('PLANOGRUPO.INATIVO = 0');
   MSLocal.Filtro.Add('LOCALIZACAO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSLocal.Filtro.Add('LOCALIZACAO.INATIVO = 0');
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   //-------------------------------------------------------------------------------------
   bbtnGeraDet.Enabled := False;
   bbtnLimpar.Enabled  := False;
   pnlRegNovos.Height  := 0;
   dbgrdDet.Enabled    := True;
   //-------------------------------------------------------------------------------------
   SelTermoTransf(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTMovSelTransf.SelTermoTransf(fIdPessoa, fIdSelBaixa : Extended);
begin
   cds.Data := MovTransfBem.ListaSelBaixa(fIdPessoa,fIdSelBaixa);
   if not cds.IsEmpty then
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
      cdsDet.Data  := MovTransfBem.ListaSelBaixaBens(cds.FieldByName('IDPESSOA').AsFloat,
                                                     cds.FieldByName('IDSELBAIXA').AsFloat);
   end else
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(0);
      cdsDet.Data  := MovTransfBem.ListaSelBaixaBens(Sistema.IdEmpresa,0);
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
procedure TfrmMTMovSelTransf.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MovTransfBem.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MovTransfBem.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MovTransfBem.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if trim(MovTransfBem.MessageInfo) <> '' then
      MsgDlg(MovTransfBem.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelTermoTransf(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      cdsDet.First;
      dbgrdDet.SelectRecord;
      dbgrdDet.UnSelectAll;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroInsert(Sender: TObject);
begin
   SelTermoTransf(Sistema.IdEmpresa,0);
   inherited;
   bbtnGeraDet.Enabled := True;
   bbtnLimpar.Enabled  := True;
   dbeSbxTermo.Enabled := True;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroDelete(Sender: TObject);
begin
   cdsDet.First;
   while not cdsDet.EOF do
      cdsDet.Delete;
   inherited;
   bbtnGeraDet.Enabled := False;
   bbtnLimpar.Enabled := False;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled := True;
   bbtnLimpar.Enabled  := True;
   dbeSbxTermo.Enabled := False;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnSelRespClick(Sender: TObject);
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
procedure TfrmMTMovSelTransf.bbtnGeraDetClick(Sender: TObject);
var
   iPos : Integer;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   Application.CreateForm(TfrmMTSelMultiBem,frmMTSelMultiBem);
   Screen.Cursor := crDefault;
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
               if not FindIdBem(frmMTSelMultiBem.cds.FieldByName('IDBEM').AsInteger,iPos) then
               begin
                  cdsDet.Append;
                  cdsDet.FieldByName('IDPESSOA').AsInteger           := frmMTSelMultiBem.cds.FieldByName('IDPESSOA').AsInteger;
                  cdsDet.FieldByName('IDBEM').AsInteger              := frmMTSelMultiBem.cds.FieldByName('IDBEM').AsInteger;
                  cdsDet.FieldByName('PLACA').AsFloat                := frmMTSelMultiBem.cds.FieldByName('PLACA').AsFloat;
                  cdsDet.FieldByName('DESBEM').AsString              := frmMTSelMultiBem.cds.FieldByName('DESBEM').AsString;
                  cdsDet.FieldByName('DESCCONJUNTO').AsString        := frmMTSelMultiBem.cds.FieldByName('DESCCONJUNTO').AsString;
                  cdsDet.FieldByName('DESCGRUPO').AsString           := frmMTSelMultiBem.cds.FieldByName('DESCGRUPO').AsString;
                  cdsDet.FieldByName('DESCLOCAL').AsString           := frmMTSelMultiBem.cds.FieldByName('DESCLOCAL').AsString;
                  cdsDet.FieldByName('NOMERESP').AsString            := frmMTSelMultiBem.cds.FieldByName('NOMERESP').AsString;
                  cdsDet.FieldByName('IDCONJUNTOATUAL').AsInteger    := frmMTSelMultiBem.cds.FieldByName('IDCONJUNTO').AsInteger;
                  cdsDet.FieldByName('IDGRUPOCONTABATUAL').AsInteger := frmMTSelMultiBem.cds.FieldByName('IDGRUPO').AsInteger;
                  cdsDet.FieldByName('IDLOCALIZACAOATUAL').AsInteger := frmMTSelMultiBem.cds.FieldByName('IDLOCALIZACAO').AsInteger;
                  cdsDet.FieldByName('IDRESPONSAVELATUAL').AsInteger := frmMTSelMultiBem.cds.FieldByName('IDRESPONSAVEL').AsInteger;
                  cdsDet.FieldByName('IDCLASSEBEM').AsInteger        := frmMTSelMultiBem.cds.FieldByName('IDCLASSEBEM').AsInteger;
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
procedure TfrmMTMovSelTransf.bbtnLimparClick(Sender: TObject);
begin
   inherited;
   cdsDet.DisableControls;
   cdsDet.First;
   while not cdsDet.EOF do
   begin
      DeleteIdBem(cdsDet.FieldByName('IDBEM').AsInteger);
      cdsDet.Delete;
   end;
   cdsDet.EnableControls;
   //-------------------------------------------------------------------------------------
   Application.ProcessMessages
end;
//========================================================================================
procedure TfrmMTMovSelTransf.sbtnAlterarClick(Sender: TObject);
begin
   if cds.FieldByName('SBXFLGEXECUTADO').AsInteger = 0 then
   begin
      inherited;
   end else
   begin
      MsgDlg('Termo de Seleção de Bens executado em ' + cds.FieldByname('SBXDTAEXECUTADO').AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelTermoTransf(Sistema.IdEmpresa, -1);
      bbtnCancelar.Click;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.sbtnApagarClick(Sender: TObject);
begin
   if cds.FieldByName('SBXFLGEXECUTADO').AsInteger = 0 then
   begin
      //----------------------------------------------------------------------------------
      // Remove o link com inventário (Se Houver)
      //----------------------------------------------------------------------------------
      if not MovTransfBem.RemoveLinkInventario(cds.FieldByName('IDPESSOA').AsFloat,
                                               cds.FieldByName('IDSELBAIXA').AsFloat) then
      begin
         MsgDlg(MovTransfBem.MessageInfo,'Erro',mtError,[mbOK],0);
      end else
      begin
         inherited;
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         SelTermoTransf(Sistema.IdEmpresa, -1);
      end;
   end else
   begin
      MsgDlg('Termo de Seleção de Bens executado em ' + cds.FieldByName('SBXDTAEXECUTADO').AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelTermoTransf(Sistema.IdEmpresa, -1);
      bbtnCancelar.Click;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa, 0);
   edPlaca.Text := '';
   //-------------------------------------------------------------------------------------
   edPlaca.SetFocus;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeDetalheDelete(Sender: TObject);
begin
   cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa, cdsDet.FieldByName('IDBEM').AsInteger);
   edPlaca.Text := floattostr(cdsSelBem.FieldByName('PLACA').AsFloat);
   //-------------------------------------------------------------------------------------
   if MsgDlg('Confirma a remoção do Bem da Seleção para Transferência','Remoção',
             mtConfirmation,[mbOk,mbCancel],0) = mrOk then
   begin
      inherited;
      DeleteIdBem(cdsSelBem.FieldByName('IDBEM').AsInteger);
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.edPlacaExit(Sender: TObject);
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
         sqlSelBem.Prepare;
         sqlSelBem.ParamByName('IDBEM').AsInteger := iIdBem;
         sqlSelBem.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
         sqlSelBem.Open;
         if cdsSelBem.IsEmpty then
         begin
            MsgDlg('Bem em Saída Temporária ou Baixado!','Erro', mtError, [mbOk], 0);
            cdsSelBem.Data  := Bem.ListaBem(0, 0);
            edPlaca.Text := '';
            exit;
         end;
         edPlaca.Text := cdsSelBem.FieldByName('PLACA').AsString;
         //-------------------------------------------------------------------------------
         if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MsgDlg('Bem em Saída Temporária!','Erro', mtError, [mbOk], 0);
            cdsSelBem.Data  := Bem.ListaBem(0, 0);
            edPlaca.Text := '';
            exit;
         end else
         if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MsgDlg('Bem Baixado!','Erro', mtError, [mbOk], 0);
            cdsSelBem.Data  := Bem.ListaBem(0, 0);
            edPlaca.Text := '';
            exit;
         end;
      end
   end else
   begin
      cdsSelBem.Data := Bem.ListaBem(0,0);
      edPlaca.Text := '';
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      sqlSelBem.Prepare;
      sqlSelBem.ParamByName('IDBEM').AsFloat := strtofloat(MSBem.ValoresChave[1]);
      sqlSelBem.ParamByName('IDPESSOA').AsFloat := strtofloat(MSBem.ValoresChave[0]);
      sqlSelBem.Open;
      if cdsSelBem.IsEmpty then
      begin
         MsgDlg('Bem em Saída Temporária ou Baixado!','Erro', mtError, [mbOk], 0);
         cdsSelBem.Data  := Bem.ListaBem(0, 0);
         edPlaca.Text := '';
         exit;
      end;
      edPlaca.Text := MSBem.ValoresChave[2];
      //----------------------------------------------------------------------------------
      if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
      begin
         MsgDlg('Bem em Saída Temporária!','Erro', mtError, [mbOk], 0);
         cdsSelBem.Data  := Bem.ListaBem(0, 0);
         edPlaca.Text := '';
         exit;
      end else
      if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
      begin
         MsgDlg('Bem Baixado!','Erro', mtError, [mbOk], 0);
         cdsSelBem.Data  := Bem.ListaBem(0, 0);
         edPlaca.Text := '';
         exit;
      end;
   end else
   begin
      cdsSelBem.Data := Bem.ListaBem(0, 0);
      edPlaca.Text := '';
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.sbtnInsDetClick(Sender: TObject);
begin
   bbtnGeraDet.Enabled    := False;
   bbtnLimpar.Enabled     := False;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.sbtnAltDetClick(Sender: TObject);
var
   iSel,
   iIdGrup1, iIdGrup2        : Integer;
   bOk                       : Boolean;

begin
   bOk := True;
   cdsDet.DisableControls;
   with dbgrdDet,dbgrdDet.DataSource.DataSet do
   begin
      if SelectedList.Count > 0 then
      begin
         if SelectedList.Count > 1 then
         begin
            GotoBookmark(SelectedList.Items[0]);
            iIdGrup1 := cdsDet.FieldByName('IDGRUPOCONTABATUAL').AsInteger;
            for iSel := 1 to (SelectedList.Count - 1) do
            begin
               GotoBookmark(SelectedList.Items[iSel]);
               iIdGrup2 := cdsDet.FieldByName('IDGRUPOCONTABATUAL').AsInteger;
               if iIdGrup2 <> iIdGrup1 then
               begin
                  if MsgDlg('Os bens selecionados pertencem a Grupos Contábeis diferentes.' + #13 +
                            'Deseja que a transferência de Grupo Contábil ocorra automaticamente' + #13 +
                            'de acordo com o cruzamento entre a Classe e o Grupo Contábil dos' + #13 +
                            'bens com o Centro de Custo selecionado ?',
                            'Atenção', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
                  begin
                     bOk := False;
                     UnSelectAll;
                     bbtnCancConjGrup.Click;
                  end else
                  begin
                     bbtnSelGrupo.Enabled    := False;
                     dbeConjunto.Font.Color  := clWhite;
                     dbeLocal.Font.Color     := clWhite;
                     dbeResp.Font.Color      := clWhite;
                     dbeGrupo.Font.Color     := clWhite;
                     dbeGrupoNovo.Font.Color := clWhite;
                  end;
                  Break;
               end;
            end;
         end;
      end else
      begin
         bOk := False;
         sbtnAltDet.Down := False;
      end;
   end;
   cdsDet.EnableControls;
   //-------------------------------------------------------------------------------------
   if bOk then
   begin
      with dbgrdDet,dbgrdDet.DataSource.DataSet do
      begin
         if SelectedList.Count = 1 then
         begin
            dbeConjunto.Font.Color := clWindowText;
            dbeLocal.Font.Color    := clWindowText;
            dbeResp.Font.Color     := clWindowText;
            dbeGrupo.Font.Color    := clWindowText;
            //----------------------------------------------------------------------------
            if not cdsDet.FieldByName('IDCONJUNTO').IsNull then
               cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa, cdsDet.FieldByName('IDCONJUNTO').AsInteger)
            else
               cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa, 0);
            //----------------------------------------------------------------------------
            if not cdsDet.FieldByName('IDLOCALIZACAO').IsNull then
               cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa, cdsDet.FieldByName('IDLOCALIZACAO').AsFloat)
            else
               cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa, 0);
            //----------------------------------------------------------------------------
            if not cdsDet.FieldByName('IDRESPONSAVEL').IsNull then
               cdsRespConj.Data := Responsavel.ListaResponsavel(cdsDet.FieldByName('IDRESPONSAVEL').AsFloat)
            else
               cdsRespConj.Data := Responsavel.ListaResponsavel(0);
            //----------------------------------------------------------------------------
            if not cdsDet.FieldByName('IDGRUPO').IsNull then
               cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, cdsDet.FieldByName('IDGRUPO').AsFloat)
            else
               cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, 0);
         end else
         begin
            dbeConjunto.Font.Color := clWhite;
            dbeLocal.Font.Color    := clWhite;
            dbeResp.Font.Color     := clWhite;
            dbeGrupo.Font.Color    := clWhite;
            //----------------------------------------------------------------------------
            cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa, 0);
            cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa, 0);
            cdsRespConj.Data := Responsavel.ListaResponsavel(0);
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, 0);
         end;
      end;
      //----------------------------------------------------------------------------------
      sbtnInsDet.Enabled     := False;
      sbtnExcluiDet.Enabled  := False;
      bbtnGeraDet.Enabled    := False;
      bbtnLimpar.Enabled     := False;
      bbtnConfirmar.Enabled  := False;
      bbtnCancelar.Enabled   := False;
      //----------------------------------------------------------------------------------
      if sbtnAltDet.Down then
      begin
         CmeDetalhe.Edit(Self);
         CmeDetalhe.AtualizaBotoes(Self);
      end else
      begin
         sbtnAltDet.Down := True;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeDetalheEdit(Sender: TObject);
begin
   cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa, cdsDet.FieldByName('IDBEM').AsInteger);
   pnlRegNovos.Height := 200; // Andre Imakawa - SIG 130571
   dbgrdDet.Enabled   := False;
   cdsDet.Edit;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,StrToFloat(MSConjunto.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      // Seleciona a localização atual do conjunto
      //----------------------------------------------------------------------------------
      cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa, cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
      //----------------------------------------------------------------------------------
      // Seleciona o responsável atual do conjunto
      //----------------------------------------------------------------------------------
      cdsRespConj.Data := Responsavel.ListaResponsavel(cdsConjunto.FieldByName('IDRESPONSAVEL').AsFloat);
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   MSLocal.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSLocal.RetornouValor then
   begin
      cdsLocal.Data := Localizacao.ListaLocalizacao(StrToFloat(MSLocal.ValoresChave[1]), StrToFloat(MSLocal.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      cdsRespConj.Data := Responsavel.ListaResponsavel(cdsLocal.FieldByName('IDRESPONSAVEL').AsFloat);
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnSelRespConjClick(Sender: TObject);
begin
   inherited;
   MSRespConj.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSRespConj.RetornouValor then
      cdsRespConj.Data := Responsavel.ListaResponsavel(StrToFloat(MSRespConj.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupo.RetornouValor then
   begin
      fGrupoNovo := MovTransfBem.RetornaGrupoContabil(Sistema.IdEmpresa,
                                                      cdsDet.FieldByName('IDCLASSEBEM').AsFloat,
                                                      cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat);
      if fGrupoNovo <> StrToFloat(MSGrupo.ValoresChave[0]) then
      begin
         MsgDlg('Grupo Contábil selecionado não relacionado a Classe do Bem!',
                'Erro',mtError,[mbOk],0);
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,fGrupoNovo);
      end else
      begin
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,StrToFloat(MSGrupo.ValoresChave[0]));
      end;
   end;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnOkConjGrupClick(Sender: TObject);
var
   bResult : boolean;

begin
  CmeDetalhe.BeforeConfirma(Self, bResult);
  if bResult then
  begin
    // Andre Imakawa - SIG 130571 - Inicio
    if chkAplicaTodos.Checked then
      AplicarTodos(cdsDet.FieldByName('IDCONJUNTO').AsFloat,
                   cdsDet.FieldByName('IDLOCALIZACAO').AsFloat,
                   cdsDet.FieldByName('IDRESPONSAVEL').AsFloat,
                   cdsDet.FieldByName('IDGRUPO').AsFloat
                    );
    // Andre Imakawa - SIG 130571 - Fim
    pnlRegNovos.Height := 0;
    dbgrdDet.Enabled := True;
    cdsDet.Edit;
    CmeDetalhe.Confirma(Self);
    RetornaDetalhe;
  end;


end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   iSel         : Integer;
   bSelConj,
   bSelLocal,
   bSelResp,
   bSelGrupo    : Boolean;

begin
   Accept := True;
   cdsDet.DisableControls;
   try
      if cdsDet.State = dsEdit then
      begin
         bSelConj  := dbeConjNovo.Text <> '';
         bSelLocal := dbeLocalNovo.Text <> '';
         bSelResp  := dbeRespNovo.Text <> '';
         bSelGrupo := dbeGrupoNovo.Text <> '';
         //-------------------------------------------------------------------------------
         with dbgrdDet,dbgrdDet.DataSource.DataSet do
         begin
            for iSel := 0 to (SelectedList.Count - 1) do
            begin
               GotoBookmark(SelectedList.Items[iSel]);
               //-------------------------------------------------------------------------
               // Verifica consistencia do novo conjunto
               //-------------------------------------------------------------------------
               if not cdsConjunto.FieldByName('IDCONJUNTO').IsNull then
               begin
                  fGrupoNovo := MovTransfBem.RetornaGrupoContabil(Sistema.IdEmpresa,
                                                                  cdsDet.FieldByName('IDCLASSEBEM').AsFloat,
                                                                  cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat);
                  if fGrupoNovo < 0 then
                  begin
                     MsgDlg('O Centro de Custo da Localização do Conjunto selecionado não está relacionado com o grupo contábil da placa '+
                            cdsDet.FieldByName('PLACA').AsString +' ou está relacionado a mais que um grupo contábil.' + #13 +
                            'Verifique o relacionamento da CLASSE do Bem com os possíveis Grupos Contábeis no Cadastro de Classes e '+
                            'o relacionamento dos Centros de Custo com o Grupo Contábil do Bem no Cadastro de Grupo Contábil.',
                            'Erro',mtError,[mbOk],0);
                     raise Exception.Create('O Centro de Custo da Localização do Conjunto selecionado não está relacionado com o grupo contábil da placa '+
                                            cdsDet.FieldByName('PLACA').AsString +' ou está relacionado a mais que um grupo contábil.' + #13 +
                                            'Verifique o relacionamento da CLASSE do Bem com os possíveis Grupos Contábeis no Cadastro de Classes e '+
                                            'o relacionamento dos Centros de Custo com o Grupo Contábil do Bem no Cadastro de Grupo Contábil.');
                  end else
                  begin
                     cdsGrupo.Data := GrupoContab.ListaGrupoContab(cdsDet.FieldByName('IDPESSOA').AsFloat,fGrupoNovo);
                  end;
               end else
               begin
                  cdsConjunto.Data := Conjunto.ListaConjunto(cdsDet.FieldByName('IDPESSOA').AsFloat,
                                                             cdsDet.FieldByName('IDCONJUNTOATUAL').AsFloat);
               end;
               //-------------------------------------------------------------------------
               // Verifica consistencia da nova localizacao
               //-------------------------------------------------------------------------
               if not cdsLocal.FieldByName('IDLOCALIZACAO').IsNull then
               begin
                  if cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat <> cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat then
                  begin
                     if ParamCAF.TIPOCONJUNTO = 1 then
                        if MsgDlg('Foi selecionada uma localização diferente da atualmente cadastrada para o '+
                                  'Conjunto '+ cdsConjunto.FieldByName('DESCCONJUNTO').AsString +'.'+#13+#13+
                                  'Se for realizar uma Transferência de Localização de todos os bens deste conjunto '+
                                  'selecione SIM.',
                                  'Atenção', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
                           raise Exception.Create('Foi selecionada uma localização diferente da atualmente cadastrada para o '+
                                                  'Conjunto '+ cdsConjunto.FieldByName('DESCCONJUNTO').AsString);
                  end;
                  //----------------------------------------------------------------------
                  fGrupoNovo := MovTransfBem.RetornaGrupoContabil(Sistema.IdEmpresa,
                                                                  cdsDet.FieldByName('IDCLASSEBEM').AsFloat,
                                                                  cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat);
                  if fGrupoNovo < 0 then
                  begin
                     MsgDlg('O Centro de Custo da Localização selecionada não está relacionado com o grupo contábil da placa '+
                            cdsDet.FieldByName('PLACA').AsString +' ou está relacionado a mais que um grupo contábil.' + #13 +
                            'Verifique o relacionamento da CLASSE do Bem com os possíveis Grupos Contábeis no Cadastro de Classes e '+
                            'o relacionamento dos Centros de Custo com o Grupo Contábil do Bem no Cadastro de Grupo Contábil.',
                            'Erro',mtError,[mbOk],0);
                     raise Exception.Create('O Centro de Custo da Localização selecionada não está relacionado com o grupo contábil da placa '+
                                            cdsDet.FieldByName('PLACA').AsString +' ou está relacionado a mais que um grupo contábil.' + #13 +
                                            'Verifique o relacionamento da CLASSE do Bem com os possíveis Grupos Contábeis no Cadastro de Classes e '+
                                            'o relacionamento dos Centros de Custo com o Grupo Contábil do Bem no Cadastro de Grupo Contábil.');
                  end else
                  begin
                     cdsGrupo.Data := GrupoContab.ListaGrupoContab(cdsDet.FieldByName('IDPESSOA').AsFloat,fGrupoNovo);
                  end;
               end else
               begin
                  cdsLocal.Data := Localizacao.ListaLocalizacao(cdsConjunto.FieldByName('IDPESSOA').AsFloat, cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
                  cdsRespConj.Data := Responsavel.ListaResponsavel(cdsConjunto.FieldByName('IDRESPONSAVEL').AsFloat);
               end;
               //-------------------------------------------------------------------------
               // Verifica consistencia do novo Grupo Contabil
               //-------------------------------------------------------------------------
               if cdsGrupo.FieldByName('IDGRUPO').IsNull then
                  cdsGrupo.Data := GrupoContab.ListaGrupoContab(cdsDet.FieldByName('IDPESSOA').AsFloat,
                                                                cdsDet.FieldByName('IDGRUPOCONTABATUAL').AsFloat);
               //-------------------------------------------------------------------------
               if not MovTransfBem.VerificaClasse(cdsDet.FieldByName('IDPESSOA').AsFloat,
                                                  cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                                  cdsDet.FieldByname('IDCLASSEBEM').AsFloat) then
               begin
                  MsgDlg('O Grupo Contábil escolhido é inválido para a Classe do Bem '+
                         cdsDet.FieldByName('PLACA').AsString + '.' + #13 +
                         'Verifique os Grupos relacionados a Classe do Bem no Cadastro de Classes!',
                         'Erro',mtError,[mbOk],0);
                  raise Exception.Create('O Grupo Contábil escolhido é inválido para a Classe do Bem '+
                                         cdsDet.FieldByName('PLACA').AsString);
               end;
               //-------------------------------------------------------------------------
               if not MovTransfBem.VerificaGrupo(cdsDet.FieldByName('IDPESSOA').AsFloat,
                                                 cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                                 cdsConjunto.FieldByName('IDCONJUNTO').AsFloat) then
               begin
                  MsgDlg('O Centro de Custo da localização do conjunto selecionado não está relacionado com o grupo contábil '+
                         'do bem '+cdsDet.FieldByName('PLACA').AsString +' ou está relacionado a mais que um grupo contábil.' + #13 +
                         'Verifique o relacionamento da classe com o grupo contábil do bem no Cadastro de Classes e '+ #13 +
                         'o relacionamento do centro de custo com o grupo contábil do bem no Cadastro de Grupo Contábil.',
                         'Erro',mtError,[mbOk],0);
                  raise Exception.Create('O Centro de Custo da localização do conjunto selecionado não está relacionado com o grupo contábil '+
                                         'do bem '+cdsDet.FieldByName('PLACA').AsString +' ou está relacionado a mais que um grupo contábil.' + #13 +
                                         'Verifique o relacionamento da classe com o grupo contábil do bem no Cadastro de Classes e '+ #13 +
                                         'o relacionamento do centro de custo com o grupo contábil do bem no Cadastro de Grupo Contábil.');
               end;
               //-------------------------------------------------------------------------
               // Verifica se o grupo novo possui as mesmas taxas de depreciacao
               // do grupo atual
               //-------------------------------------------------------------------------
               cdsGrupoTaxaDep1.Data := GrupoContab.ListaGrupoTaxaDep(cdsSelBem.FieldbyName('IDGRUPO').AsFloat,
                                                                      Sistema.IdEmpresa);
               cdsGrupoTaxaDep2.Data := GrupoContab.ListaGrupoTaxaDep(cdsGrupo.FieldbyName('IDGRUPO').AsFloat,
                                                                      Sistema.IdEmpresa);
               while not cdsGrupoTaxaDep1.EOF do
               begin
                  if cdsGrupoTaxaDep1.FieldByName('TAXADEP').AsFloat <>
                     cdsGrupoTaxaDep2.FieldByName('TAXADEP').AsFloat then
                  begin
                     if MsgDlg('As taxas de depreciação do Grupo Novo são diferentes das '+ #13 +
                               'taxas do Grupo Atual.' + #13 + #13 + 'Deseja Prosseguir ?',
                               'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
                        raise Exception.Create('As taxas de depreciação do Grupo Novo são diferentes das taxas do Grupo Atual.');
                  end;
                  cdsGrupoTaxaDep1.Next;
                  cdsGrupoTaxaDep2.Next;
               end;
               //-------------------------------------------------------------------------
               // Registra os dados no termo
               //-------------------------------------------------------------------------
               cdsDet.Edit;
               cdsDet.FieldByName('IDCONJUNTO').AsFloat    := cdsConjunto.FieldByName('IDCONJUNTO').AsFloat;
               cdsDet.FieldByName('IDLOCALIZACAO').AsFloat := cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat;
               cdsDet.FieldByName('IDRESPONSAVEL').AsFloat := cdsRespConj.FieldByName('IDRESPONSAVEL').AsFloat;
               cdsDet.FieldByName('IDGRUPO').AsFloat       := cdsGrupo.FieldByName('IDGRUPO').AsFloat;
               cdsDet.Post;
               cdsDet.Edit;
               //-------------------------------------------------------------------------
               // Retorna os cds ao status anterior
               //-------------------------------------------------------------------------
               if not bSelConj then
                  cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa, 0);
               if not bSelLocal then
                  cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa, 0);
               if not bSelResp then
                  cdsRespConj.Data := Responsavel.ListaResponsavel(0);
               if not bSelGrupo then
                  cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, 0);
            end;
         end;
      end;
      cdsDet.EnableControls;
      inherited;
   except
      cdsDet.EnableControls;
      Accept := False;
      Exit;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeDetalheConfirma(Sender: TObject);
var
   iPos : Integer;
begin
   try
      if cdsDet.State in [dsInsert,dsEdit] then
      begin
         if cdsDet.State = dsInsert then
         begin
            if (trim(edPlaca.Text) = '') or (cdsSelBem.IsEmpty) Then
            begin
               MsgDlg('Nenhum Bem foi Selecionado','Erro',mtError,[mbOK],0);
               bbtnSelBem.SetFocus;
            end else
            begin
               //-------------------------------------------------------------------------
               // Pesquisa se o bem já foi cadastrado, tentando incluir na lista de idbem
               //-------------------------------------------------------------------------
               if not FindIdBem(cdsSelBem.FieldByName('IDBEM').AsInteger, iPos) then
               begin
                  cdsDet.FieldByName('IDPESSOA').AsInteger           := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
                  cdsDet.FieldByName('IDBEM').AsInteger              := cdsSelBem.FieldByName('IDBEM').AsInteger;
                  cdsDet.FieldByName('PLACA').AsFloat                := cdsSelBem.FieldByName('PLACA').AsFloat;
                  cdsDet.FieldByName('DESBEM').AsString              := cdsSelBem.FieldByName('DESBEM').AsString;
                  cdsDet.FieldByName('DESCCONJUNTO').AsString        := cdsSelBem.FieldByName('DESCCONJUNTO').AsString;
                  cdsDet.FieldByName('DESCGRUPO').AsString           := cdsSelBem.FieldByName('DESCGRUPO').AsString;
                  cdsDet.FieldByName('DESCLOCAL').AsString           := cdsSelBem.FieldByName('DESCLOCALIZACAO').AsString;
                  cdsDet.FieldByName('NOMERESP').AsString            := cdsSelBem.FieldByName('NOMERESP').AsString;
                  cdsDet.FieldByName('IDCONJUNTOATUAL').AsInteger    := cdsSelBem.FieldByName('IDCONJUNTO').AsInteger;
                  cdsDet.FieldByName('IDLOCALIZACAOATUAL').AsInteger := cdsSelBem.FieldByName('IDLOCALIZACAO').AsInteger;
                  cdsDet.FieldByName('IDRESPONSAVELATUAL').AsInteger := cdsSelBem.FieldByName('IDRESPONSAVEL').AsInteger;
                  cdsDet.FieldByName('IDGRUPOCONTABATUAL').AsInteger := cdsSelBem.FieldByName('IDGRUPO').AsInteger;
                  cdsDet.FieldByName('IDCLASSEBEM').AsInteger        := cdsSelBem.FieldByName('IDCLASSEBEM').AsInteger;
                  //----------------------------------------------------------------------
                  InsertIdBem(cdsSelBem.FieldByName('IDBEM').AsInteger);
               end;
            end;
         end;
      end;
      inherited;
      with dbgrdDet,dbgrdDet.DataSource.DataSet do
         SelectedList.Clear;
   except
      On E : Exception do
      begin
         bbtnCancConjGrup.Click;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.bbtnCancConjGrupClick(Sender: TObject);
begin
   chkAplicaTodos.Checked := False; // Andre Imakawa - SIG 130571
   pnlRegNovos.Height := 0;
   dbgrdDet.Enabled   := True;
   CmeDetalhe.Cancel(Self);
   RetornaDetalhe;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   fTotPerc : Extended;

begin
   Accept := True;
   //-------------------------------------------------------------------------------------
   if trim(dbeSbxTermo.Text) = '' then
   begin
      MsgDlg('O número do termo de transferência não foi preenchido', 'Erro', mtError, [mbOK], 0);
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
      cdsDet.DisableControls;
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         fTotPerc := fTotPerc + 1;
         cdsDet.Next;
      end;
      cdsDet.EnableControls;
      //----------------------------------------------------------------------------------
      if fTotperc <= 0 then
      begin
         MsgDlg('Selecione os bens que serão transferidos!', 'Erro', mtError, [mbOK], 0);
         Accept := False;
      end else
      //----------------------------------------------------------------------------------
      if cds.State in [dsInsert,dsEdit] then
      begin
         cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
         cds.FieldByName('SBTIPOMOV').AsInteger := 1;  // 0 - Baixa, 1 - Transferência
         cds.FieldByName('IDRESPONSAVEL').AsInteger := cdsResp.FieldByName('IDRESPONSAVEL').AsInteger;
         //-------------------------------------------------------------------------------
         cdsDet.First;
         while not cdsDet.EOF do
         begin
            cdsDet.Edit;
            cdsDet.FieldByName('IDCONJATUAL').AsInteger  := cdsDet.FieldByName('IDCONJUNTOATUAL').AsInteger;
            cdsDet.FieldByName('IDGRUPATUAL').AsInteger  := cdsDet.FieldByName('IDGRUPOCONTABATUAL').AsInteger;
            cdsDet.FieldByName('IDLOCALATUAL').AsInteger := cdsDet.FieldByName('IDLOCALIZACAOATUAL').AsInteger;
            cdsDet.FieldByName('IDRESPATUAL').AsFloat    := cdsDet.FieldByName('IDRESPONSAVELATUAL').AsFloat;
            cdsDet.Next;
         end;
      end;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;
begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelTermoTransf(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   bbtnGeraDet.Enabled   := False;
   bbtnLimpar.Enabled    := False;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelTermoTransf(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   bbtnGeraDet.Enabled   := False;
   bbtnLimpar.Enabled    := False;
end;
//========================================================================================
function TfrmMTMovSelTransf.InsertIdBem(iIdBem : Integer) : boolean;
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
function TfrmMTMovSelTransf.DeleteIdBem(iIdBem : Integer) : boolean;
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
function TfrmMTMovSelTransf.FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
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
procedure TfrmMTMovSelTransf.RetornaDetalhe;
begin
   bbtnSelGrupo.Enabled    := True;
   dbeConjunto.Font.Color  := clWindowText;
   dbeLocal.Font.Color     := clWindowText;
   dbeResp.Font.Color      := clWindowText;
   dbeGrupo.Font.Color     := clWindowText;
   dbeGrupoNovo.Font.Color := clWindowText;
   bbtnConfirmar.Enabled   := True;
   bbtnCancelar.Enabled    := True;
   //-------------------------------------------------------------------------------------
   sbtnInsDet.Enabled    := True;
   sbtnExcluiDet.Enabled := True;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
end;
//========================================================================================
procedure TfrmMTMovSelTransf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   MovTransfBem.Free;
   ParamCAF.Free;
   Bem.Free;
   Conjunto.Free;
   Localizacao.Free;
   Responsavel.Free;
   GrupoContab.Free;
end;

// Andre Imakawa - SIG 130571 - Inicio
procedure TfrmMTMovSelTransf.btnInverteClick(Sender: TObject);
begin
  if cdsDet.RecordCount > 0 then
    if bbtnGeraDet.Enabled then
    begin              
      Inherited;
      cdsDet.DisableControls;
      cdsDet.First;
      While Not cdsDet.Eof Do
      Begin
        cdsDet.Edit;
        cdsDet.FieldByName('flgEnviar').AsInteger :=
        abs(cdsDet.FieldByName('flgEnviar').AsInteger - 1);
        cdsDet.Next;
      End; //while
      cdsDet.EnableControls;
    end;

end;

procedure TfrmMTMovSelTransf.dbgrdDetDblClick(Sender: TObject);
begin
  //inherited;
  if cdsDet.RecordCount > 0 then
    if bbtnGeraDet.Enabled then
    begin
      cdsDet.Edit;
      cdsDet.FieldByName('flgEnviar').AsInteger := abs(cdsDet.FieldByName('flgEnviar').AsInteger - 1);
      cdsDet.Post;
    end;

end;

procedure TfrmMTMovSelTransf.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  chkAplicaTodos.Checked := False; // Andre Imakawa - SIG 130571
end;

procedure TfrmMTMovSelTransf.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  chkAplicaTodos.Checked := False; // Andre Imakawa - SIG 130571
end;

function TfrmMTMovSelTransf.AplicarTodos(aIdConjunto, aIdlocalizacao, aIdResponsavel, aIdGrupo: Double): boolean;
begin
  try
    cdsDet.DisableControls;
    cdsDet.first;
    While Not cdsDet.Eof Do
    Begin
      if cdsDet.FieldByName('flgEnviar').AsInteger = 1 then
      begin
        cdsDet.Edit;
        cdsDet.FieldByName('IDCONJUNTO').AsFloat    := aIdConjunto;
        cdsDet.FieldByName('IDLOCALIZACAO').AsFloat := aIdlocalizacao;
        cdsDet.FieldByName('IDRESPONSAVEL').AsFloat := aIdResponsavel;
        cdsDet.FieldByName('IDGRUPO').AsFloat       := aIdGrupo;
        cdsDet.Post;
      end;          
      cdsDet.Next;
    End;
    cdsDet.EnableControls;
    Result := True;
  except
    Result := False;
    cdsDet.EnableControls;
  end;
end;
// Andre Imakawa - SIG 130571 - Fim
end.
