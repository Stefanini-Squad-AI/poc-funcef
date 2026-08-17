unit fMTMovRemembramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Grids, Wwdbigrd, Wwdbgrid, fcLabel, wwdblook,
  Mask, wwdbedit, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, DB, TB97Tlwn,
  TB97Ctls,  Wwdatsrc, uCmSqlParams, uCMClientDataSet, MontaSelect, DBClient,
  uCMTypes, uCtrlPadroes, uCtrlDomBem, uCtrlMovRemembramento, uCtrlParamCAF,
  uCtrlConjunto, uCtrlGrupoContab, uCtrlClassedeBem, uCtrlSituacao,
  IvEMulti;

type
  TfrmMTMovRemembramento = class(TfrmOkCancelar)
    dsSelBens: TwwDataSource;
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    dsConjunto: TwwDataSource;
    cdsConjunto: TCMClientDataSet;
    MSConjunto: TMontaSelect;
    dsGrupo: TwwDataSource;
    cdsGrupo: TCMClientDataSet;
    MSGrupo: TMontaSelect;
    cdsSelBens: TCMClientDataSet;
    sqlSelBens: TCMSqlParams;
    Label2: TLabel;
    edPlacaNova: TEdit;
    Label3: TLabel;
    edDescricaoNova: TMemo;
    Label6: TLabel;
    dbeGrupo: TwwDBEdit;
    bbtnSelGrupo: TBitBtn;
    Label5: TLabel;
    dbeConjunto: TwwDBEdit;
    bbtnGeraConjunto: TBitBtn;
    Label1: TLabel;
    dbeLocalizacao: TwwDBEdit;
    Dock972: TDock97;
    ToolWindow971: TToolWindow97;
    dbgGerBens: TwwDBGrid;
    bbtnSelBens: TToolbarButton97;
    Dock973: TDock97;
    ToolWindow972: TToolWindow97;
    fcLabel2: TfcLabel;
    Data: TLabel;
    edData: TCMDateTimePicker;
    cdsClasse: TCMClientDataSet;
    dsClasse: TwwDataSource;
    MSClasse: TMontaSelect;
    Label4: TLabel;
    dbeClasse: TwwDBEdit;
    bbtnSelClasse: TBitBtn;
    cdsBuscaGrupo: TCMClientDataSet;
    cdsSituacao: TCMClientDataSet;
    cmbSituacao: TwwDBLookupCombo;
    Label29: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelBensClick(Sender: TObject);
    procedure bbtnSelClasseClick(Sender: TObject);
  private
    { Private declarations }
    aIdBem     : Array of Integer;
    iaIdBem    : Integer;
    //------------------------------------------------------------------------------------
    Remembramento : TCtrlMovRemembramento;
    ParamCAF      : TCtrlParamCAF;
    ClassedeBem   : TCtrlClassedeBem;
    Bem           : TCtrlDomBem;
    GrupoContab   : TCtrlGrupoContab;
    Conjunto      : TCtrlConjunto;
    Situacao      : TCtrlSituacao;
    //------------------------------------------------------------------------------------
    procedure LimpaCampos;
    function InsertIdBem(iIdBem : Integer) : boolean;
    function FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
  public
    { Public declarations }
  end;

var
  frmMTMovRemembramento: TfrmMTMovRemembramento;

implementation

{$R *.dfm}

uses uSistema, uMensErro, fMTSelMultiBem, fMTCadConjunto;

procedure TfrmMTMovRemembramento.FormCreate(Sender: TObject);
begin
   inherited;
   Remembramento := TCtrlMovRemembramento.Create;
   Remembramento.InitializeAs(Padroes);
   Remembramento.cdsSelBens := cdsSelBens;
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ClassedeBem := TCtrlClassedeBem.Create;
   ClassedeBem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Situacao := TCtrlSituacao.Create;
   Situacao.InitializeAs(Padroes);
   cdsSituacao.Data := Situacao.ListaSituacao;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MSGrupo.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupo.Filtro.Add('GRUPO.INATIVO = 0');
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.INATIVO = 0');
   //-------------------------------------------------------------------------------------
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMTMovRemembramento.LimpaCampos;
begin
   cdsSelBens.Close;
   sqlSelBens.Prepare;
   sqlSelBens.ParamByName('IDPESSOA').AsInteger := -1;
   sqlSelBens.Open;
   iaIdBem := 0;
   SetLength(aIdBem, iaIdBem);
   //-------------------------------------------------------------------------------------
   edData.Text := '';
   edPlacaNova.Text := '';
   edDescricaoNova.Text := '';
   cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa, 0);
   cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, 0);
   cdsClasse.Data := ClassedeBem.ListaClassedeBem(0);
   cdsSituacao.Locate('IDSITUACAO',0,[]);
   cmbSituacao.Text := '';
end;
//========================================================================================
procedure TfrmMTMovRemembramento.bbtnSelBensClick(Sender: TObject);
var
   iPos                : Integer;
   fClasse, fSituacao,
   fConjunto, fGrupo   : Extended;

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
      cdsSelBens.DisableControls;
      frmMTSelMultiBem.cds.First;
      while not frmMTSelMultiBem.cds.EOF do
      begin
         if frmMTSelMultiBem.cds.FieldByName('PROCESSAR').AsInteger = 1 then
         begin
            //----------------------------------------------------------------------------
            // Processa somente os bens não baixados e na empresa
            //----------------------------------------------------------------------------
            if (frmMTSelMultiBem.cds.FieldByName('BAIXATOTAL').AsString <> 'S') and
               (frmMTSelMultiBem.cds.FieldByName('FLGSAIDATEMP').AsInteger <> 1) and
               (frmMTSelMultiBem.cds.FieldByName('CONTROLE').AsString = 'T') then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa se o bem já foi cadastrado, tentando incluir na lista de idbem
               //-------------------------------------------------------------------------
               if not FindIdBem(frmMTSelMultiBem.cds.FieldByName('IDBEM').AsInteger,iPos) then
               begin
                  cdsSelBens.Append;
                  cdsSelBens.FieldByName('IDBEM').AsInteger         := frmMTSelMultiBem.cds.FieldByName('IDBEM').AsInteger;
                  cdsSelBens.FieldByName('PLACA').AsFloat           := frmMTSelMultiBem.cds.FieldByName('PLACA').AsFloat;
                  cdsSelBens.FieldByName('DESBEM').AsString         := frmMTSelMultiBem.cds.FieldByName('DESBEM').AsString;
                  cdsSelBens.FieldByName('IDCLASSEBEM').AsInteger   := frmMTSelMultiBem.cds.FieldByName('IDCLASSEBEM').AsInteger;
                  cdsSelBens.FieldByName('IDSITUACAO').AsInteger    := frmMTSelMultiBem.cds.FieldByName('IDSITUACAO').AsInteger;
                  cdsSelBens.FieldByName('IDCONJUNTO').AsInteger    := frmMTSelMultiBem.cds.FieldByName('IDCONJUNTO').AsInteger;
                  cdsSelBens.FieldByName('DESCCONJUNTO').AsString   := frmMTSelMultiBem.cds.FieldByName('DESCCONJUNTO').AsString;
                  cdsSelBens.FieldByName('IDLOCALIZACAO').AsInteger := frmMTSelMultiBem.cds.FieldByName('IDLOCALIZACAO').AsInteger;
                  cdsSelBens.FieldByName('DESCLOCAL').AsString      := frmMTSelMultiBem.cds.FieldByName('DESCLOCAL').AsString;
                  cdsSelBens.FieldByName('IDGRUPO').AsInteger       := frmMTSelMultiBem.cds.FieldByName('IDGRUPO').AsInteger;
                  cdsSelBens.FieldByName('DESCGRUPO').AsString      := frmMTSelMultiBem.cds.FieldByName('DESCGRUPO').AsString;
                  cdsSelBens.Post;
                  //----------------------------------------------------------------------
                  InsertIdBem(frmMTSelMultiBem.cds.FieldByName('IDBEM').AsInteger);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         frmMTSelMultiBem.cds.Next;
      end;
   end;
   //-------------------------------------------------------------------------------------
   frmMTSelMultiBem.cds.Close;
   frmMTSelMultiBem.Release;
   //-------------------------------------------------------------------------------------
   cdsSelBens.First;
   fClasse   := cdsSelBens.FieldByName('IDCLASSEBEM').AsFloat;
   fSituacao := cdsSelBens.FieldByName('IDSITUACAO').AsFloat;
   fConjunto := cdsSelBens.FieldByName('IDCONJUNTO').AsFloat;
   fGrupo    := cdsSelBens.FieldByName('IDGRUPO').AsFloat;
   cdsSelBens.Next;
   while not cdsSelBens.EOF do
   begin
      if cdsSelBens.FieldByName('IDCLASSEBEM').AsFloat <> fClasse then
         fClasse := 0;
      if cdsSelBens.FieldByName('IDSITUACAO').AsFloat <> fSituacao then
         fSituacao := 0;
      if cdsSelBens.FieldByName('IDCONJUNTO').AsFloat <> fConjunto then
         fConjunto := 0;
      if cdsSelBens.FieldByName('IDGRUPO').AsFloat <> fGrupo then
         fGrupo := 0;
      //----------------------------------------------------------------------------------
      cdsSelBens.Next;
   end;
   //-------------------------------------------------------------------------------------
   cdsClasse.Data := ClassedeBem.ListaClassedeBem(fClasse);
   cdsSituacao.Locate('IDSITUACAO',fSituacao,[]);
   cmbSituacao.Text := cdsSituacao.FieldByName('DESCSITUACAO').AsString;
   cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa, fConjunto);
   cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, fGrupo);
   //-------------------------------------------------------------------------------------
   cdsSelBens.First;
   cdsSelBens.EnableControls;
   //-------------------------------------------------------------------------------------
   bbtnSelBens.Down := False;
end;
//========================================================================================
procedure TfrmMTMovRemembramento.bbtnSelClasseClick(Sender: TObject);
begin
   inherited;
   MSClasse.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSClasse.RetornouValor then
   begin
      cdsClasse.Data := ClassedeBem.ListaClassedeBem(strtofloat(MSClasse.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      if (ParamCAF.FLGCLSDESBEM = 1) and (edDescricaoNova.Text = '') then
         edDescricaoNova.Text := cdsClasse.FieldByName('DESCRICAO').AsString;
      //----------------------------------------------------------------------------------
      // Seleciona o Grupo Contábil
      //----------------------------------------------------------------------------------
      if cdsGrupo.FieldByName('IDGRUPO').IsNull then
      begin
         cdsBuscaGrupo.Data := Bem.BuscaGrupoContab(Sistema.IdEmpresa,
                                                    cdsClasse.FieldByName('IDCLASSEBEM').AsFloat,
                                                    cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
         if not cdsBuscaGrupo.IsEmpty then
         begin
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                          cdsBuscaGrupo.FieldByName('IDGRUPO').AsFloat);
         end else
         begin
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, 0);
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovRemembramento.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupo.RetornouValor then
   begin
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                    StrToFloat(MSGrupo.ValoresChave[0]));
   end;
end;
//========================================================================================
procedure TfrmMTMovRemembramento.bbtnGeraConjuntoClick(Sender: TObject);
var
   fIdConjunto, fIdPessoa : Extended;

begin
   Application.CreateForm(TfrmMTCadConjunto,frmMTCadConjunto);
   frmMTCadConjunto.FormStyle := FsNormal;
   frmMTCadConjunto.Visible   := False;
   frmMTCadConjunto.Top       := 76;
   frmMTCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   fIdConjunto := frmMTCadConjunto.fUltIdConjunto;
   fIdPessoa   := frmMTCadConjunto.fUltIdPessoa;
   frmMTCadConjunto.Release;
   //-------------------------------------------------------------------------------------
   cdsConjunto.Data := Conjunto.ListaConjunto(fIdPessoa, fIdConjunto);
end;
//========================================================================================
procedure TfrmMTMovRemembramento.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                 StrToFloat(MSConjunto.ValoresChave[0]));
   end;
end;
//========================================================================================
procedure TfrmMTMovRemembramento.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Verificações
   //-------------------------------------------------------------------------------------
   if cdsSelBens.RecordCount < 2 then
   begin
      MsgDlg('Selecione os bens que serão baixados para a composição do novo Bem! ','Erro',mtError,[mbOk],0);
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Preencha o campo Data da Movimentação','Erro',mtError,[mbOk],0);
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edPlacaNova.Text = '' then
   begin
      MsgDlg('Informe o Número do Tombamento Patrimonial do Novo Bem!','Erro',mtError,[mbOk],0);
      edPlacaNova.SetFocus;
      exit;
   end else
   begin
      if not Bem.PlacaUnica(Sistema.IdEmpresa,edPlacaNova.Text) then
      begin
         MsgDlg('Número do Tombamento Patrimonial do Novo Bem deve ser exclusivo!','Erro',mtError,[mbOk],0);
         edPlacaNova.SetFocus;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if edDescricaoNova.Text = '' then
   begin
      MsgDlg('Informe a Descrição do Novo Bem!','Erro',mtError,[mbOk],0);
      edDescricaoNova.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if dbeConjunto.Text = '' then
   begin
      MsgDlg('Informe o Conjunto do Novo Bem!','Erro',mtError,[mbOk],0);
      bbtnGeraConjunto.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if cmbSituacao.Text = '' then
   begin
      MsgDlg('Informe a Situação Física do Novo Bem!','Erro',mtError,[mbOk],0);
      cmbSituacao.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if dbeClasse.Text = '' then
   begin
      MsgDlg('Informe o Classe do Novo Bem!','Erro',mtError,[mbOk],0);
      bbtnSelClasse.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if dbeGrupo.Text = '' then
   begin
      MsgDlg('Informe o Grupo Contábil do Novo Bem!','Erro',mtError,[mbOk],0);
      bbtnSelGrupo.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   cdsSelBens.DisableControls;
   Screen.Cursor := crSQLWait;
   if Remembramento.ExecutaRemembramento(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                         strtofloat(edPlacaNova.Text),
                                         cdsConjunto.FieldByName('IDCONJUNTO').AsFloat,
                                         cdsSituacao.FieldByName('IDSITUACAO').AsFloat,
                                         cdsClasse.FieldByName('IDCLASSEBEM').AsFloat,
                                         cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                         edDescricaoNova.Text,
                                         edData.Date) then
   begin
      Screen.Cursor := crDefault;
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
      LimpaCampos;
   end else
   begin
      Screen.Cursor := crDefault;
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + Remembramento.MessageInfo,
             'Erro', mtError, [mbOk], 0);
   end;
   cdsSelBens.EnableControls;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovRemembramento.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   edData.SetFocus;
end;
//========================================================================================
function TfrmMTMovRemembramento.InsertIdBem(iIdBem : Integer) : boolean;
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
function TfrmMTMovRemembramento.FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
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
procedure TfrmMTMovRemembramento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Bem.Free;
   Remembramento.Free;
   GrupoContab.Free;
   Conjunto.Free;
end;

end.
