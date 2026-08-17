// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{------------------------------------------------------------------------------
Rotina...........: CalculaNovaTaxa
Nº SOL...........: 163527
Nº KINTANA.......: 1397051
Data da Alteração: 19/08/2011
Responsável......: Vinicius Eduardo Nascimento Maciel
Descrição........: Foi criada a Rotina CalculaNovaTaxa para o cálculo da Nova Taxa
                   em substituição da utilizada anteriormente e foi retirado a
                   propriedade Picture Mask do componente dbeVidaUtil 
--------------------------------------------------------------------------------
Rotina...........: ApplyInsert, ApplyEdit, ApplyDelete, ValidaDataPosterior
Nº SOL...........: 154197
Nº KINTANA.......: 1170381
Data da Alteração: 16/03/2011
Responsável......: Thaise Amaral Martins
Descrição........: Criar uma validação para não permitir que o bem tenha Alteração, Edição e Exclusão
                   pro caso de ter movimentações posteriores ao período informado
------------------------------------------------------------------------------}

// *****************************************************************************
//Rotina...........:  -
//Nº SOL...........: 142551
//Nº KINTANA.......: 911676
//Data da Alteração: 06/12/2010
//Responsável......: Helen V. Bianchi
//Descrição........: Criação da Tela
//------------------------------------------------------------------------------

unit fMTCadDepreVida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCadastroMestreDetMT, MontaSelect, DB, DBClient, DBCtrls,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, TEdNum, TREdit,
  IvMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, uCmSqlParams,
  wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit,uCMTypes, uCtrlPadroes,
  uCtrlHistBemxDep,  uCtrlTerceiro, uCtrlDomBem,
  SdfData, BfDialogs, BrowseFolder, uProcuraDir, IvEMulti, DBTables, uCtrlParamCAF;

type
  TfrmMTCadDepreVida = class(TFrmCadastroMestreDetMT)
    cdsDet: TCMClientDataSet;
    Label1: TLabel;
    dbeData: TCMDateTimePicker;
    dsSelBem: TwwDataSource;
    Label26: TLabel;
    edPlaca: TEdit;
    bbtnSelBem: TBitBtn;
    Label22: TLabel;
    dbmDesBem: TDBMemo;
    cdsSelBem: TCMClientDataSet;
    bbtnGeraDet: TBitBtn;
    bbtnLimpar: TBitBtn;
    Label7: TLabel;
    dbeLocal: TwwDBEdit;
    dbeResp: TwwDBEdit;
    Label17: TLabel;
    MSBem: TMontaSelect;
    cdsBem: TCMClientDataSet;
    cdsUltReav: TCMClientDataSet;
    sqlUltReav: TCMSqlParams;
    cdsBemxDep: TCMClientDataSet;
    sqlBemxDep: TCMSqlParams;
    qryDet: TQuery;
    Label5: TLabel;
    dbeDataRetr: TCMDateTimePicker;
    dbeDescConjunto: TDBMemo;
    Label4: TLabel;
    Panel1: TPanel;
    rdgCalculo: TRadioGroup;
    dbeTaxa: TwwDBEdit;
    dbeVidaUtil: TwwDBEdit;
    qrySelDepBens: TQuery;
    cdsSelDepBens: TCMClientDataSet;
    dsSelDepBens: TwwDataSource;
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
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dbeTaxaExit(Sender: TObject);
    procedure dbeVidaUtilExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure rdgCalculoClick(Sender: TObject);
    procedure CdsAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
    MovDepreciacao : TCtrlHistBemxDep;
    Bem            : TCtrlDomBem;
    ParamCAF       : TCtrlParamCAF;
    //------------------------------------------------------------------------------------
    aIdBem     : Array of Integer;
    iaIdBem    : Integer;
    //------------------------------------------------------------------------------------
    procedure SelTermoDepre(fIdPessoa, fIdSelDepreciacao : Extended);
    function  CalculaRestante(): boolean;
    function  InsertIdBem(iIdBem : Integer) : boolean;
    function  DeleteIdBem(iIdBem : Integer) : boolean;
    function  FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
    Function  ValidaDataPosterior: Boolean;
    function CalculaNovaTaxa: Boolean;
  public
    { Public declarations }
  end;

var
  frmMTCadDepreVida: TfrmMTCadDepreVida;

implementation

{$R *.dfm}

uses fMTSelMultiBem, uSistema, uMensErro, FAguarde;

procedure TfrmMTCadDepreVida.FormCreate(Sender: TObject);
begin
   inherited;
   MovDepreciacao := TCtrlHistBemxDep.Create;
   MovDepreciacao.InitializeAs(Padroes);
   MovDepreciacao.cds := cds;
   MovDepreciacao.cdsSelDepreciacaoBens := cdsDet;
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('SELDEPRECIACAO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   //-------------------------------------------------------------------------------------
   bbtnGeraDet.Enabled  := False;
   bbtnLimpar.Enabled   := False;
   //-------------------------------------------------------------------------------------
   SelTermoDepre(Sistema.IdEmpresa, -9);
   cdsSelDepBens.Data := MovDepreciacao.ListaSelDepreBens(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TfrmMTCadDepreVida.SelTermoDepre(fIdPessoa, fIdSelDepreciacao : Extended);
begin
   cds.Data := MovDepreciacao.ListaSelDepre(fIdPessoa,fIdSelDepreciacao);
   if not cds.IsEmpty then
   begin
      cdsDet.Data  := MovDepreciacao.ListaSelDepreBens(cds.FieldByName('IDPESSOA').AsFloat,
                                                       cds.FieldByName('IDSELDEPRECIACAO').AsFloat);

   end else
   begin
      cdsDet.Data  := MovDepreciacao.ListaSelDepreBens(Sistema.IdEmpresa,0);
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
      cdsDet.First  ;
   end;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
    //Thaise SOL 154197 - Retirar a mensagem de erro, pois a cancelar, a mensagem é dada
    //e isso estava fazendo com que gerasse a mensagem duas vezes
    if not Accept then
    begin
      //MsgDlg(MovDepreciacao.MessageInfo,'Erro',mtError,[mbOK],0);
      bbtnCancelar.OnClick(Sender);
    end;

    SelTermoDepre(Sistema.IdEmpresa, -9);
    cdsSelDepBens.Data := MovDepreciacao.ListaSelDepreBens(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   //Thaise SOL 154197 - Antes de comitar a operação, verificar se o bem pode ser alterado, ou seja,
   //se existe movimentação posterior.
   Accept:= ValidaDataPosterior;

   if Accept then
   begin
     MovDepreciacao.cdsSelDepreciacaoBens_Alter := cdsSelDepBens;
     Accept := MovDepreciacao.AplicaOperacao('E') ;
   end;
   
   if not Accept then
   begin
      //MsgDlg(MovDepreciacao.MessageInfo,'Erro',mtError,[mbOK],0);
      bbtnCancelar.OnClick(Sender);
   end;

end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   //Thaise SOL 154197 - Antes de comitar a operação, verificar se o bem pode ser inserido, ou seja,
   //se existe movimentação posterior.
   Accept:= ValidaDataPosterior;
   if not Accept then
      bbtnCancelar.OnClick(Sender);

   if not cdsDet.Eof then
   begin
       cds.FieldByName('SDFLGEXECUTADO').AsInteger := 0;
       Accept := MovDepreciacao.AplicaOperacao('I');
       if not Accept then
       begin
          //MsgDlg(MovDepreciacao.MessageInfo,'Erro',mtError,[mbOK],0);
          bbtnCancelar.OnClick(Sender);
       end;
   end;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if trim(MovDepreciacao.MessageInfo) <> '' then
      MsgDlg(MovDepreciacao.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelTermoDepre(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      cdsDet.First;
      dbgrdDet.SelectRecord;
      dbgrdDet.UnSelectAll;
      rdgCalculo.ItemIndex := 0;
   end;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroAfterConfirma(Sender: TObject);
begin
   MovDepreciacao.FListaSelDepreciacao := '';
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroInsert(Sender: TObject);
begin
   SelTermoDepre(Sistema.IdEmpresa,-9);
   cdsSelDepBens.Data := MovDepreciacao.ListaSelDepreBens(Sistema.IdEmpresa,0);
   inherited;
   bbtnGeraDet.Enabled  := True;
   bbtnLimpar.Enabled   := True;
   dbeData.ReadOnly     := False;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   cds.FieldByName('sdFLGEXECUTADO').AsInteger := 0;
   cdsDet.Data  := MovDepreciacao.ListaSelDepreBens(Sistema.IdEmpresa,0);
   cdsSelDepBens.Data := MovDepreciacao.ListaSelDepreBens(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   rdgCalculo.ItemIndex := 0;
   dbeData.SetFocus;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroDelete(Sender: TObject);
begin

   //Passar os registros para o DataSet, para a função ser chamada corretamente.
   cdsSelBem.Data := Bem.ListaBem(cdsDet.FieldByName('IDPESSOA').AsFloat,
                                  cdsDet.FieldByName('IDBEM').AsFloat);

   //Thaise SOL 154197 - Antes de comitar a operação, verificar se o bem pode ser deletado, ou seja,
   //se existe movimentação posterior.
   if ValidaDataPosterior then
   begin
     MovDepreciacao.AplicaOperacao('S');
     inherited;
     bbtnGeraDet.Enabled  := False;
     bbtnLimpar.Enabled   := False;
   end
   else
      MsgDlg(MovDepreciacao.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled := True;
   bbtnLimpar.Enabled  := True;
   dbeData.ReadOnly    := True;
   cdsDet.First;
   while not cdsDet.eof do
   begin
       cdsSelDepBens.Append;
       cdsSelDepBens.FieldByName('IDBEM').AsInteger := cdsDet.FieldByName('IDBEM').AsInteger;
       cdsSelDepBens.Post;
       cdsDet.next ;
   end;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.bbtnSelRespClick(Sender: TObject);
begin
   inherited;

end;
//========================================================================================
procedure TfrmMTCadDepreVida.bbtnGeraDetClick(Sender: TObject);
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
                  //cdsDet.FieldByName('VIDAUTIL').AsString       := VidaUtilRestante(cdsDet.FieldByName('IDPESSOA').AsInteger,cdsDet.FieldByName('IDBEM').AsInteger);
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
procedure TfrmMTCadDepreVida.bbtnLimparClick(Sender: TObject);
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

procedure TfrmMTCadDepreVida.CmeDetalheInsert(Sender: TObject);
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
procedure TfrmMTCadDepreVida.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   edPlaca.Text := cdsDet.FieldByName('PLACA').AsString;
   cdsSelBem.Data := Bem.ListaBem(cdsDet.FieldByName('IDPESSOA').AsFloat,
                                  cdsDet.FieldByName('IDBEM').AsFloat);
   //-------------------------------------------------------------------------------------
   bbtnSelBem.Enabled := False;
   edPlaca.ReadOnly := True;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeDetalheDelete(Sender: TObject);
begin
   cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa, cdsDet.FieldByName('IDBEM').AsInteger);
   edPlaca.Text := floattostr(cdsSelBem.FieldByName('PLACA').AsFloat);
   //-------------------------------------------------------------------------------------
   if MsgDlg('Confirma a remoção do Bem da Seleção para Depreciação','Remoção',
             mtConfirmation,[mbOk,mbCancel],0) = mrOk then
   begin
      inherited;
      DeleteIdBem(cdsSelBem.FieldByName('IDBEM').AsInteger);
   end;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.edPlacaExit(Sender: TObject);
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
procedure TfrmMTCadDepreVida.bbtnSelBemClick(Sender: TObject);
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
procedure TfrmMTCadDepreVida.sbtnInsDetClick(Sender: TObject);
begin
   bbtnGeraDet.Enabled    := False;
   bbtnLimpar.Enabled     := False;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeDetalheConfirma(Sender: TObject);
var
   iPos : Integer;
begin
   if cdsDet.State in [dsInsert,dsEdit] then
   begin
      if cdsSelBem.FieldByName('CONTROLE').AsString = 'F' then
      begin
          MsgDlg('Bem em Controle Físico!','Erro',mtError,[mbOK],0);
          bbtnSelBem.SetFocus;
          exit;
      end else
      if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
      begin
          MsgDlg('Bem em Saída Temporária!','Erro',mtError,[mbOK],0);
           bbtnSelBem.SetFocus;
           exit;
      end else
      if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
      begin
          MsgDlg('Bem Baixado!','Erro',mtError,[mbOK],0);
          bbtnSelBem.SetFocus;
          exit;
      end else
      if (trim(edPlaca.Text) = '') or (cdsSelBem.IsEmpty) Then
      begin
         MsgDlg('Nenhum Bem foi Selecionado','Erro',mtError,[mbOK],0);
         bbtnSelBem.SetFocus;
         exit;
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
procedure TfrmMTCadDepreVida.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   iTotErros : Integer;
begin
   Accept := True;
   //-------------------------------------------------------------------------------------
   if trim(dbeData.Text) = '' then
   begin
      MsgDlg('A Nova Data não foi preenchido', 'Erro', mtError, [mbOK], 0);
      dbeData.SetFocus;
      Accept := False;
      exit;
   end ;
   if (trim(dbeTaxa.Text) = '') OR (trim(dbeVidaUtil.Text) = '')  then
   begin
      rdgCalculo.SetFocus;
      Accept := False;
      exit;
   end ;
   if (trim(dbeTaxa.Text) = '0') OR (trim(dbeVidaUtil.Text) = '0')  then
   begin
      rdgCalculo.SetFocus;
      Accept := False;
      exit;
   end ;
   if CalculaRestante = false then
   begin
      MsgDlg('Nova Taxa inválida ! ', 'Erro', mtError, [mbOK], 0);
      rdgCalculo.SetFocus;
      Accept := False;
      exit;
   end;
   if dbeDataRetr.text <> '' then
   begin
       if (StrToDate(dbeDataRetr.text) > StrToDate(dbeData.text)) then
       begin
          MsgDlg('Data Retroativa inválida ! ', 'Erro', mtError, [mbOK], 0);
          dbeDataRetr.SetFocus;
          Accept := False;
          exit;
       end;
   end;
   if cdsDet.State in ([dsInsert]) then
   begin
       if not cdsDet.eof then
         cdsDet.First;
       if cdsDet.eof then
       begin
          MsgDlg('É necessário selecionar os Bens.', 'Erro', mtError, [mbOK], 0);
          pgctrlDetalhe.SetFocus;
          Accept := False;
       end;
   end;
   if not Accept then Exit;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;
begin
   OldOperacao := CMECadastro.Operacao;
   inherited;

   if OldOperacao = opApagar then
      SelTermoDepre(Sistema.IdEmpresa,-9);
   //-------------------------------------------------------------------------------------
   bbtnGeraDet.Enabled   := False;
   bbtnLimpar.Enabled    := False;
   rdgCalculo.ItemIndex  := 0;
end;
//========================================================================================
procedure TfrmMTCadDepreVida.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelTermoDepre(Sistema.IdEmpresa, -9);
   cdsSelDepBens.Data := MovDepreciacao.ListaSelDepreBens(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   bbtnGeraDet.Enabled   := False;
   bbtnLimpar.Enabled    := False;
end;
//========================================================================================
function TfrmMTCadDepreVida.InsertIdBem(iIdBem : Integer) : boolean;
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
function TfrmMTCadDepreVida.DeleteIdBem(iIdBem : Integer) : boolean;
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
function TfrmMTCadDepreVida.FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
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
procedure TfrmMTCadDepreVida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   MovDepreciacao.Free;
   Bem.Free;
   ParamCAF.Free;
end;

procedure TfrmMTCadDepreVida.dbeTaxaExit(Sender: TObject);
begin
   if cds.State in [dsInsert,dsEdit] then
   begin
      if (dbeTaxa.text <> '')  then
      begin
           if (dbeTaxa.text <> '0') then
           begin
                 if CalculaRestante = false then
                 begin
                    MsgDlg('Nova Taxa inválida ! ', 'Erro', mtError, [mbOK], 0);
                    cds.FieldByName('SDVIDA').AsString := '';
                    dbeVidaUtil.Text    := '';
                    dbeTaxa.SetFocus;
                 end;
           end
           else
           begin
               cds.FieldByName('SDTAXA').AsString := '';
               cds.FieldByName('SDVIDA').AsString := '';
               dbeVidaUtil.Text    := '';
               dbetaxa.Text        := '';
           end;
       end
       else
       begin
           cds.FieldByName('SDTAXA').AsString := '';
           cds.FieldByName('SDVIDA').AsString := '';
           dbeVidaUtil.Text    := '';
           dbetaxa.Text        := '';
       end;
   end;
   inherited;
end;

procedure TfrmMTCadDepreVida.dbeVidaUtilExit(Sender: TObject);
begin
  if cds.State in [dsInsert,dsEdit] then
  begin
      if (dbeVidaUtil.text <> '')  then
      begin
          if  (dbeVidaUtil.text <> '0') then
          begin
              //if CalculaRestante = false then //Vinicius Maciel SOL 163527 KTN 1397051
              if CalculaNovaTaxa = false then
               begin
                  MsgDlg('Nova Taxa inválida ! ', 'Erro', mtError, [mbOK], 0);
                  cds.FieldByName('SDTAXA').AsString := '';
                  dbetaxa.Text        := '';
                  dbeVidaUtil.SetFocus;
               end;
          end
          else
          begin
               cds.FieldByName('SDTAXA').AsString := '';
               cds.FieldByName('SDVIDA').AsString := '';
               dbeVidaUtil.Text    := '';
               dbetaxa.Text        := '';
          end;
      end
      else
      begin
          cds.FieldByName('SDTAXA').AsString := '';
          cds.FieldByName('SDVIDA').AsString := '';
          dbeVidaUtil.Text    := '';
          dbetaxa.Text        := '';
      end;
  end;
  inherited;
end;

procedure TfrmMTCadDepreVida.sbtnApagarClick(Sender: TObject);
begin
   if cds.FieldByName('SDFLGEXECUTADO').AsInteger = 0 then
   begin
      inherited;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      SelTermoDepre(Sistema.IdEmpresa, -9);
      cdsSelDepBens.Data := MovDepreciacao.ListaSelDepreBens(Sistema.IdEmpresa,0);

   end else
   begin
      MsgDlg('Termo de Depreciação executado em ' + cds.FieldByName('SDDTAEXECUTADO').AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelTermoDepre(Sistema.IdEmpresa, -9);
      cdsSelDepBens.Data := MovDepreciacao.ListaSelDepreBens(Sistema.IdEmpresa,0);
      bbtnCancelar.Click;
   end;
end;

procedure TfrmMTCadDepreVida.sbtnAlterarClick(Sender: TObject);
begin
   if cds.FieldByName('SDFLGEXECUTADO').AsInteger = 0 then
   begin
      inherited;
   end else
   begin
      MsgDlg('Termo de Depreciação executado em ' + cds.FieldByname('SDDTAEXECUTADO').AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelTermoDepre(Sistema.IdEmpresa, -9);
      cdsSelDepBens.Data := MovDepreciacao.ListaSelDepreBens(Sistema.IdEmpresa,0);
      bbtnCancelar.Click;
   end;

end;

procedure TfrmMTCadDepreVida.rdgCalculoClick(Sender: TObject);
begin
  if cds.State in [dsedit, dsinsert] then
  begin
      cds.FieldByName('SDTAXA').AsString := '';
      cds.FieldByName('SDVIDA').AsString := '';
      dbeVidaUtil.Text    := '';
      dbetaxa.Text        := '';
      if rdgCalculo.ItemIndex = 0 then
      begin
         dbeVidaUtil.Enabled := False;
         dbetaxa.Enabled     := True;
         dbetaxa.SetFocus;
      end
      else
      begin
         dbetaxa.Enabled     := False;
         dbeVidaUtil.Enabled := True;
         dbeVidaUtil.SetFocus;
      end;
  end
  else
  begin
     if rdgCalculo.ItemIndex = 0 then
     begin
         dbeVidaUtil.Enabled := False;
         dbetaxa.Enabled     := True;
      end
  end;
  inherited;
end;

function TfrmMTCadDepreVida.CalculaRestante() : Boolean;
var cVidaUtil,cTaxa, Fdbetaxa,Fdbevidautil :Extended;
begin
   cVidaUtil := 0;
   if rdgCalculo.ItemIndex = 0 then
      dbeVidaUtil.text := '0'
   else
      dbeTaxa.text := '0';
   if dbeTaxa.text <> '' then
      Fdbetaxa := StrToFloat(dbeTaxa.text)
   else
      Fdbetaxa := 0  ;
    if dbeVidaUtil.text <> '' then
      FdbeVidaUtil := StrToFloat(dbeVidaUtil.text)
   else
      FdbeVidaUtil := 0  ;

   if ( Fdbetaxa > 0 ) and (FdbeVidaUtil <= 0) then
   begin
      cVidaUtil := (100 / Fdbetaxa) * 12;
      if (cVidaUtil-Trunc(cVidaUtil)) > 0 then
      begin
         //result := false;
         dbeVidaUtil.text        := FloatToStr(cVidaUtil);
         dbeVidaUtil.Field.Value := FloatToStr(cVidaUtil);
         result := true;
      end
      else begin
         dbeVidaUtil.text        := FloatToStr(cVidaUtil);
         dbeVidaUtil.Field.Value := FloatToStr(cVidaUtil);
         result := true;
      end;
   end
   else begin
      if (FdbeVidaUtil > 0 ) and (Fdbetaxa <= 0) then
      begin
          cTaxa := (100 / FdbeVidaUtil) * 12;
          if (cTaxa-Trunc(cTaxa)) > 0 then
          begin
             //result := false; result := false;
             dbeTaxa.text        := FloatToStr(cTaxa);
             dbeTaxa.Field.Value := FloatToStr(cTaxa);
             result := true;
          end
          else begin
             dbeTaxa.text        := FloatToStr(cTaxa);
             dbeTaxa.Field.Value := FloatToStr(cTaxa);
             result := true;
          end; 
      end ;
   end;
   if (cVidaUtil = 0) and (cTaxa = 0) then
      result := false;
end;

//Vinicius Maciel - SOL 163527 Kintana 1397051
function TfrmMTCadDepreVida.CalculaNovaTaxa() : Boolean;
var Fdbevidautil, Fdbetaxa, cTaxa, cVidaUtil : Extended;
begin
    if rdgCalculo.ItemIndex = 1 then
    dbeTaxa.text := '0'
    else
    dbeVidaUtil.text := '0';

    if dbeVidaUtil.text <> '' then
    Fdbevidautil := StrToFloat(dbeVidaUtil.text)
    else
    Fdbevidautil := 0;

    if dbeTaxa.text <> '' then
    Fdbetaxa := StrToFloat(dbeTaxa.text)
    else
    Fdbetaxa := 0  ;

    if (FdbeVidaUtil > 0) and (Fdbetaxa <=0) then
    begin
      cTaxa := (1200/Fdbevidautil);
      dbeTaxa.text := FloatToStr(cTaxa);
      dbeTaxa.Field.Value := FloatToStr(cTaxa);
      result := true;
    end
    else
    begin
      if (Fdbetaxa > 0) and (FdbeVidaUtil <=0) then
      begin
          cVidaUtil := (1200/Fdbetaxa);
          dbeVidaUtil.text        := FloatToStr(cVidaUtil);
          dbeVidaUtil.Field.Value := FloatToStr(cVidaUtil);
          result := true;
      end;
    end;
    if (cVidaUtil = 0) and (cTaxa = 0) then
    result := false;

end;
//Vinicius Maciel - SOL 163527 Kintana 1397051 - Fim

procedure TfrmMTCadDepreVida.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  // Formatando campos
  TNumericField(DataSet.FieldByName('SDVIDA')).DisplayFormat := ',0.0000';
  TNumericField(DataSet.FieldByName('SDTAXA')).DisplayFormat := ',0.0000';//Vinicius Maciel SOL 163527 SOL 1397051
end;


//Thaise SOL 154197 - Função para chamar o método VerificaAltPosterior, já que esta função será chamada
//onde precisamos deletar, inserir e editar
function TfrmMTCadDepreVida.ValidaDataPosterior: Boolean;
var DataAlt_1: String;
begin
   Result := True;
   if not cdsDet.IsEmpty then
   begin
     DataAlt_1:= FormatDateTime('01/MM/YYYY', Cds.FieldByName('SDDATA').AsDateTime);
     cdsDet.First;
     while not cdsDet.Eof do
     begin
       Result := MovDepreciacao.VerificaAltPosterior(Sistema.IdEmpresa,
                                                     cdsDet.FieldByName('IDBEM').AsInteger,
                                                     StrToDate(DataAlt_1),
                                                     cdsDet.FieldByName('DESBEM').AsString,
                                                     cdsDet.FieldByName('Placa').AsString);
       if not Result then
         Break;

       cdsDet.Next;
     end;
     cdsDet.First;
   end;
end;

end.
