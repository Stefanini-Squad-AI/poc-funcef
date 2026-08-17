unit fMTObraEncerrar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCadastroMestreDetMT, MontaSelect, DB, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, fcLabel,
  wwdbdatetimepicker, CMDateTimePicker, DBCtrls, uCmSqlParams, TREdit,
  wwdblook, Mask, wwdbedit, IvEMulti,
  uCMTypes, uCtrlPadroes,
  uCtrlCafObra, uCtrlClassedeBem, uCtrlConjunto, uCtrlSituacao, uCtrlTerceiro,
  uCtrlGrupoContab, uCtrlParamCAF, uCtrlSubConta, uCtrlUnidNegocio, uCtrlAlmoxCaf;

type
  TfrmMTObraEncerrar = class(TFrmCadastroMestreDetMT)
    cdsDet: TCMClientDataSet;
    sqlDet: TCMSqlParams;
    cdsConjunto: TCMClientDataSet;
    dsConjunto: TwwDataSource;
    MSConjunto: TMontaSelect;
    cdsClasse: TCMClientDataSet;
    dsClasse: TwwDataSource;
    MSClasse: TMontaSelect;
    cdsGrupo: TCMClientDataSet;
    dsGrupo: TwwDataSource;
    MSGrupo: TMontaSelect;
    cdsSubConta: TCMClientDataSet;
    dsSubConta: TwwDataSource;
    MSSubConta: TMontaSelect;
    cdsAtivProj: TCMClientDataSet;
    dsAtivProj: TwwDataSource;
    MSAtivProj: TMontaSelect;
    cdsRateioCCusto: TCMClientDataSet;
    dsRateioCCusto: TwwDataSource;
    cdsSituacao: TCMClientDataSet;
    pgctlBem: TPageControl;
    TabConjunto: TTabSheet;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    dbeDescConjunto: TDBMemo;
    dbgRateio: TwwDBGrid;
    dbeNomeResponsavel: TwwDBEdit;
    dbeDescLocalizacao: TwwDBEdit;
    bbtnGeraConjunto: TBitBtn;
    TabIdent: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label29: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    bbtnSelClasse: TBitBtn;
    edDescClasse: TwwDBEdit;
    edPlaca: TMaskEdit;
    bbtnGeraPlaca: TBitBtn;
    cmbSituacao: TwwDBLookupCombo;
    dbeDtaInclusao: TCMDateTimePicker;
    dbeDesBem: TDBMemo;
    TabContab: TTabSheet;
    Label11: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label44: TLabel;
    bbtnSelGrupo: TBitBtn;
    edDataInicioDep: TCMDateTimePicker;
    bbtnSelAtivProjeto: TBitBtn;
    bbtnSelSubConta: TBitBtn;
    edDescGrupo: TwwDBEdit;
    edDescSubConta: TwwDBEdit;
    edAtivProjeto: TwwDBEdit;
    dbeValOfi: TDBRealEdit;
    cdsLancObra: TCMClientDataSet;
    sqlLancObra: TCMSqlParams;
    pnlObra: TPanel;
    Label1: TLabel;
    dbeDescObra: TDBMemo;
    Label2: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    ToolbarSep972: TToolbarSep97;
    Label10: TLabel;
    bbtnEstornar: TToolbarButton97;
    dbeDtaEncerraObra: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
    procedure bbtnSelClasseClick(Sender: TObject);
    procedure bbtnGeraPlacaClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnSelSubContaClick(Sender: TObject);
    procedure bbtnSelAtivProjetoClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnEstornarClick(Sender: TObject);
  private
    { Private declarations }
    AlmoxCaf    : TCtrlAlmoxCaf;
    Obra        : TCtrlCafObra;
    ParamCAF    : TCtrlParamCAF;
    ClassedeBem : TCtrlClassedeBem;
    Conjunto    : TCtrlConjunto;
    Situacao    : TCtrlSituacao;
    Terceiro    : TCtrlTerceiro;
    GrupoContab : TCtrlGrupoContab;
    AtivProjeto : TCtrlUnidNegocio;
    SubConta    : TCtrlSubConta;
    //------------------------------------------------------------------------------------
    Procedure SelObra(fIdPessoa, fIdCafObra : Extended);
  public
    { Public declarations }
  end;

var
  frmMTObraEncerrar: TfrmMTObraEncerrar;

implementation

{$R *.dfm}

Uses uMensErro, uSistema , fMTCadConjunto;

procedure TfrmMTObraEncerrar.FormCreate(Sender: TObject);
begin
   inherited;
   Obra := TCtrlCafObra.Create;
   Obra.InitializeAs(Padroes);
   Obra.cds := cds;
   Obra.cdsCafObraEncerrar := cdsDet;
   //-------------------------------------------------------------------------------------
   AlmoxCaf := TCtrlAlmoxCaf.Create;
   AlmoxCaf.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ClassedeBem := TCtrlClassedeBem.Create;
   ClassedeBem.InitializeAs(Padroes);
   cdsClasse.Data := ClassedeBem.ListaClassedeBem(0);
   //-------------------------------------------------------------------------------------
   Situacao := TCtrlSituacao.Create;
   Situacao.InitializeAs(Padroes);
   cdsSituacao.Data := Situacao.ListaSituacao;
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, 0);
   //-------------------------------------------------------------------------------------
   AtivProjeto := TCtrlUnidNegocio.Create;
   AtivProjeto.InitializeAs(Padroes);
   cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa,-2);
   //-------------------------------------------------------------------------------------
   SubConta := TCtrlSubConta.Create;
   SubConta.InitializeAs(Padroes);
   cdsSubConta.Data := SubConta.ListSubConta(Sistema.IdEmpresa,-2);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   if ParamCAF.EDITACODBEM = 1 then
   begin
      bbtnGeraPlaca.Enabled := True;
      edPlaca.ReadOnly      := True;
   end else
   begin
      bbtnGeraPlaca.Enabled := False;
      edPlaca.ReadOnly      := False;
   end;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('CAFOBRA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupo.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   SelObra(Sistema.IdEmpresa,0);
end;
//========================================================================================
Procedure TfrmMTObraEncerrar.SelObra(fIdPessoa, fIdCafObra : Extended);
begin
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   // Seleciona a Obra
   //-------------------------------------------------------------------------------------
   cds.Data := Obra.ListaCafObra(fIdPessoa, fIdCafObra);
   //-------------------------------------------------------------------------------------
   // Gera os dados para o lançamento dos bens ou Relaciona os bens já lançados
   //-------------------------------------------------------------------------------------
   cdsDet.Close;
   if (cds.FieldByName('FLGOBRA').AsInteger = 0) and (not cds.IsEmpty) then
   begin
      bbtnEstornar.Enabled  := False;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      bbtnEstornar.Enabled  := False;
      TabConjunto.Enabled   := True;
      TabIdent.Enabled      := True;
      TabContab.Enabled     := True;
      sBtnInsDet.Enabled    := True;
      sBtnAltDet.Enabled    := True;
      sBtnExcluiDet.Enabled := True;
      //----------------------------------------------------------------------------------
      sqlDet.Prepare;
      sqlDet.ParamByName('IDCAFOBRA').AsInteger := -1;
      sqlDet.ParamByName('IDPESSOA').AsInteger := -1;
      sqlDet.Open;
      TStringField(cdsDet.FieldByName('CLASSE')).EditMask := ParamCaf.MASCCODGRUPO + ';0; ';
      TFloatField(cdsDet.FieldByName('VALORG')).DisplayFormat := '#,##0.00;(#,##0.00); ';
      //----------------------------------------------------------------------------------
      // Geração dos Dados para lançamento dos bens por grupo contábil
      //----------------------------------------------------------------------------------
      sqlLancObra.Prepare;
      sqlLancObra.ParamByName('IDCAFOBRA').AsFloat := cds.FieldByName('IDCAFOBRA').AsFloat;
      sqlLancObra.ParamByName('IDPESSOA').AsFloat  := cds.FieldByName('IDPESSOA').AsFloat;
      sqlLancObra.Open;
      //----------------------------------------------------------------------------------
      while not cdsLancObra.EOF do
      begin
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(fIdPessoa, cdsLancObra.FieldByName('IDGRUPO').AsFloat);
         //-------------------------------------------------------------------------------
         cdsDet.Append;
         cdsDet.FieldByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
         cdsDet.FieldByName('IDMODULO').AsInteger    := Sistema.IdModulo;
         cdsDet.FieldByName('REGISTRO').AsString     := 'O';
         cdsDet.FieldByName('CONTROLE').AsString     := 'T';
         cdsDet.FieldByName('DESBEM').AsString       := cds.FieldByName('DESCCAFOBRA').AsString;
         cdsDet.FieldByName('VALHISTORICO').AsFloat  := cdsLancObra.FieldByName('SOMAVALOFI').AsFloat;
         cdsDet.FieldByName('VALORG').AsFloat        := cdsLancObra.FieldByName('SOMAVALOFI').AsFloat;
         cdsDet.FieldByName('IDGRUPOOBRA').AsInteger := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
         cdsDet.FieldByName('CLASSE').AsString       := cdsGrupo.FieldByName('CLASSE').AsString;
         cdsDet.FieldByName('NOMEGRUPO').AsString    := cdsGrupo.FieldByName('NOME').AsString;
         cdsDet.Post;
         //-------------------------------------------------------------------------------
         cdsLancObra.Next;
      end;
      cdsDet.First;
   end else
   //-------------------------------------------------------------------------------------
   // Relaciona os bens já lançados
   //-------------------------------------------------------------------------------------
   if cds.FieldByName('FLGOBRA').AsInteger = 1 then
   begin
      bbtnEstornar.Enabled  := True;
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := True;
      bbtnEstornar.Enabled  := True;
      TabConjunto.Enabled   := False;
      TabIdent.Enabled      := False;
      TabContab.Enabled     := False;
      sBtnInsDet.Enabled    := False;
      sBtnAltDet.Enabled    := False;
      sBtnExcluiDet.Enabled := False;
      //----------------------------------------------------------------------------------
      sqlDet.Prepare;
      sqlDet.ParamByName('IDCAFOBRA').AsInteger := cds.FieldByName('IDCAFOBRA').AsInteger;
      sqlDet.ParamByName('IDPESSOA').AsInteger  := cds.FieldByName('IDPESSOA').AsInteger;
      sqlDet.Open;
      TStringField(cdsDet.FieldByName('CLASSE')).EditMask := ParamCaf.MASCCODGRUPO + ';0; ';
      TFloatField(cdsDet.FieldByName('VALORG')).DisplayFormat := '#,##0.00;(#,##0.00); ';
   end else
   //-------------------------------------------------------------------------------------
   begin
      sqlDet.Prepare;
      sqlDet.ParamByName('IDCAFOBRA').AsInteger := -1;
      sqlDet.ParamByName('IDPESSOA').AsInteger  := -1;
      sqlDet.Open;
      TStringField(cdsDet.FieldByName('CLASSE')).EditMask := ParamCaf.MASCCODGRUPO + ';0; ';
      TFloatField(cdsDet.FieldByName('VALORG')).DisplayFormat := '#,##0.00;(#,##0.00); ';
      //----------------------------------------------------------------------------------
      bbtnEstornar.Enabled  := False;
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
      bbtnEstornar.Enabled  := False;
      TabConjunto.Enabled   := False;
      TabIdent.Enabled      := False;
      TabContab.Enabled     := False;
      sBtnInsDet.Enabled    := False;
      sBtnAltDet.Enabled    := False;
      sBtnExcluiDet.Enabled := False;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
   inherited;
   cdsClasse.Close;
   cdsGrupo.Close;
   cdsAtivProj.Close;
   cdsConjunto.Close;
   cdsSubConta.Close;
   cdsSituacao.Close;
   cdsLancObra.Close;
   ParamCAF.Free;
   ClassedeBem.Free;
   Situacao.Free;
   Terceiro.Free;
   GrupoContab.Free;
   AtivProjeto.Free;
   SubConta.Free;
   AlmoxCaf.Free;
   Obra.Free;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.FormActivate(Sender: TObject);
begin
   inherited;
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
end;
//========================================================================================
procedure TfrmMTObraEncerrar.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   if not cds.IsEmpty then
      if cds.FieldByName('FLGOBRA').AsInteger = 0 then
         sbtnAlterar.Click;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   Application.ProcessMessages;
   if MontaSelect.RetornouValor then
      SelObra(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTObraEncerrar.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   edPlaca.Text := cdsDet.FieldByName('PLACA').AsString;
   //-------------------------------------------------------------------------------------
   if not cdsDet.FieldByName('IDCONJUNTO').IsNull then
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                 cdsDet.FieldByName('IDCONJUNTO').AsFloat);
      cdsRateioCCusto.Data := Conjunto.ListaRateioCustos(cdsConjunto.FieldByName('IDPESSOA').AsFloat,
                                                         cdsConjunto.FieldByName('IDCONJUNTO').AsFloat);
   end else
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa, 0);
      cdsRateioCCusto.Data := Conjunto.ListaRateioCustos(cdsConjunto.FieldByName('IDPESSOA').AsFloat, 0);
   end;
   //-------------------------------------------------------------------------------------
   if not cdsDet.FieldByName('IDCLASSEBEM').IsNull then
      cdsClasse.Data := ClassedeBem.ListaClassedeBem(cdsDet.FieldByName('IDCLASSEBEM').AsFloat)
   else
      cdsClasse.Data := ClassedeBem.ListaClassedeBem(0);
   //-------------------------------------------------------------------------------------
   if not cdsDet.FieldByName('IDGRUPO').IsNull then
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,cdsDet.FieldByName('IDGRUPO').AsFloat)
   else
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   if not cdsDet.FieldByName('UNIDNEGOC').IsNull then
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa,cdsDet.FieldByName('UNIDNEGOC').AsFloat)
   else
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa,-2);
   //-------------------------------------------------------------------------------------
   if not cdsDet.FieldByName('CODSUBCONTA').IsNull then
      cdsSubConta.Data := SubConta.ListSubConta(Sistema.IdEmpresa,cdsDet.FieldByName('CODSUBCONTA').AsFloat)
   else
      cdsSubConta.Data := SubConta.ListSubConta(Sistema.IdEmpresa,-2);
   //-------------------------------------------------------------------------------------
   pgCtlBem.ActivePage := TabIdent;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.bbtnGeraConjuntoClick(Sender: TObject);
var
   fIdConjunto, fIdPessoa : Extended;

begin
   inherited;
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
   cdsConjunto.Data     := Conjunto.ListaConjunto(fIdPessoa, fIdConjunto);
   cdsRateioCCusto.Data := Conjunto.ListaRateioCustos(fIdPessoa, fIdConjunto);
end;
//========================================================================================
procedure TfrmMTObraEncerrar.bbtnSelClasseClick(Sender: TObject);
begin
   inherited;
   MSClasse.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSClasse.RetornouValor then
      cdsClasse.Data := ClassedeBem.ListaClassedeBem(strtofloat(MSClasse.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTObraEncerrar.bbtnGeraPlacaClick(Sender: TObject);
var
  nPlaca : Extended;

begin
   inherited;
   nPlaca := AlmoxCAF.GeraPlacaTomb(Sistema.IdEmpresa,
                                    cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                    cdsClasse.FieldByName('IDCLASSEBEM').AsFloat);
   if nPlaca <= 0 then
      MsgDlg('Erro na Geração da Placa!' + #13 +
             'Causa : ' + AlmoxCAF.MessageInfo,'Erro',mtError,[mbOk],0)
   else
      edPlaca.Text := floattostr(nPlaca);
end;
//========================================================================================
procedure TfrmMTObraEncerrar.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupo.RetornouValor then
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                    StrToFloat(MSGrupo.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTObraEncerrar.bbtnSelSubContaClick(Sender: TObject);
begin
   inherited;
   MSSubConta.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSSubConta.RetornouValor then
      cdsSubConta.Data := SubConta.ListSubConta(strtofloat(MSSubConta.ValoresChave[1]),
                                                strtofloat(MSSubConta.ValoresChave[0]))
   else
      cdsSubConta.Data := SubConta.ListSubConta(Sistema.IdEmpresa,-1);
end;
//========================================================================================
procedure TfrmMTObraEncerrar.bbtnSelAtivProjetoClick(Sender: TObject);
begin
   inherited;
   MSAtivProj.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSAtivProj.RetornouValor then
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(strtofloat(MSAtivProj.ValoresChave[1]),
                                                       strtofloat(MSAtivProj.ValoresChave[0]))
   else
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa,-2);
end;
//========================================================================================
procedure TfrmMTObraEncerrar.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   try
      // Grupo
      if cdsGrupo.FieldbyName('IDGRUPO').IsNull then
         Raise Exception.Create('É necessário selecionar a Grupo do Bem!');
      // Conjunto
      if cdsConjunto.FieldbyName('IDCONJUNTO').IsNull then
         Raise Exception.Create('É necessário selecionar o Conjunto do Bem!');
      // Classe
      if cdsClasse.FieldbyName('IDCLASSEBEM').IsNull then
         Raise Exception.Create('É necessário selecionar a Classe do Bem!');
      // Situacao
      if cdsSituacao.FieldbyName('IDSITUACAO').IsNull then
         Raise Exception.Create('É necessário selecionar a Situação do Bem!');
      // Descrição do Bem
      if dbeDesBem.Text = '' then
         Raise Exception.Create('É necessário informar a Descrição do Bem!');
      // Numero de Tombamento Patrimonial
      if edPlaca.Text = '' then
         Raise Exception.Create('É necessário informar o Número de Tombamento Patrimonial do Bem!');
      if not Obra.Bem.PlacaUnica(Sistema.IdEmpresa,edPlaca.Text) then
         Raise Exception.Create('O Número de Tombamento Patrimonial do Bem deve ser exclusivo!');
      // Data de Inclusao
      if dbeDtaInclusao.Text = '' then
         Raise Exception.Create('É necessário informar a Data de Entrada do Bem no patrimonio!');
      // Valor Historico de Aquisição
      if dbeValOfi.Value = 0 then
         Raise Exception.Create('É necessário informar o custo inicial do bem!');
      // Data de Inicio da Depreciação
      if edDataInicioDep.Text = '' then
         Raise Exception.Create('É necessário informar a data de inicio da depreciação do bem!');
      //----------------------------------------------------------------------------------
      Accept := True;
   except
      On E : Exception do
      begin
         Accept := False;
         MsgDlg(E.Message,'Erro', mtError, [mbOk], 0);
      end;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.CmeDetalheConfirma(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if cdsDet.State in [dsInsert,dsEdit] then
      begin
         cdsDet.FieldByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
         cdsDet.FieldByName('IDMODULO').AsInteger    := Sistema.IdModulo;
         cdsDet.FieldByName('IDCLASSEBEM').AsInteger := cdsClasse.FieldByName('IDCLASSEBEM').AsInteger;
         cdsDet.FieldByName('IDCONJUNTO').AsInteger  := cdsConjunto.FieldByName('IDCONJUNTO').AsInteger;
         cdsDet.FieldByName('PLACA').AsFloat         := StrToFloat(edPlaca.Text);
         cdsDet.FieldByName('IDGRUPO').AsInteger     := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
         cdsDet.FieldByName('REGISTRO').AsString     := 'O';
         cdsDet.FieldByName('CONTROLE').AsString     := 'T';
         cdsDet.FieldByName('VALHISTORICO').AsFloat  := dbeValOfi.Value;
         //-------------------------------------------------------------------------------
         if cdsSubConta.FieldByName('CODSUBCONTA').IsNull then
            cdsDet.FieldByName('CODSUBCONTA').Clear
         else
            cdsDet.FieldByName('CODSUBCONTA').AsInteger := cdsSubConta.FieldByName('CODSUBCONTA').AsInteger;
         //-------------------------------------------------------------------------------
         if cdsAtivProj.FieldByName('UNIDNEGOC').IsNull then
            cdsDet.FieldByName('UNIDNEGOC').Clear
         else
            cdsDet.FieldByName('UNIDNEGOC').AsInteger := cdsAtivProj.FieldByName('UNIDNEGOC').AsInteger;
      end;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   sbtnAltDet.Enabled := True;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   sbtnAltDet.Enabled := True;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
Var
   fSomaBens, fSomaObra : Currency;

begin
   try
      if dbeDtaEncerraObra.Text = '' then
         Raise Exception.Create('É necessário informar a Data de Encerramento da Obra!');
      //----------------------------------------------------------------------------------
      // Verifica se a soma dos valores iniciais dos bens estão iguais ao custo
      // total da Obra
      //----------------------------------------------------------------------------------
      fSomaBens := 0;
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         fSomaBens := Obra.ConvNum(fSomaBens + cdsDet.FieldByName('VALORG').AsCurrency);
         cdsDet.Next;
      end;
      //----------------------------------------------------------------------------------
      fSomaObra := 0;
      cdsLancObra.First;
      while not cdsLancObra.EOF do
      begin
         fSomaObra := Obra.ConvNum(fSomaObra + cdsLancObra.FieldByName('SOMAVALOFI').AsCurrency);
         cdsLancObra.Next;
      end;
      //----------------------------------------------------------------------------------
      if fSomaBens <> fSomaObra then
         Raise Exception.Create('É necessário que a soma dos valores iniciais dos bens ('+formatfloat('#,##9.99',fSomaBens)+') ' +
                                'seja igual a soma de todos os custos lançados na Obra ('+formatfloat('#,##9.99',fSomaObra)+')!');
      //----------------------------------------------------------------------------------
      Accept := True;
   except
      on E : Exception do
      begin
         Accept := False;
         MsgDlg(E.Message,'Erro', mtError, [mbOk], 0);
      end;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   if Obra.ExecutaEncerramentoObra(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                   cds.FieldByName('IDCAFOBRA').AsFloat,
                                   cds.FieldByName('DTAENCERRAOBRA').AsDateTime) then
   begin
      Screen.Cursor := crDefault;
      MsgDlg('Encerramento Realizado!','Informação',mtInformation,[mbOk],0);
      SelObra(Sistema.IdEmpresa, 0);
      Accept := True;
   end else
   begin
      Screen.Cursor := crDefault;
      MsgDlg('Encerramento não Realizado!' + #13 + #13 +
             'Causa : ' + Obra.MessageInfo, 'Erro', mtError, [mbOk], 0);
      Accept := False;
   end;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelObra(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TfrmMTObraEncerrar.dbgrdDetDblClick(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTObraEncerrar.bbtnEstornarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   if not Obra.EstornaEncerramentoObra(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                       cds.FieldByName('IDCAFOBRA').AsFloat,
                                       cds.FieldByName('DTAENCERRAOBRA').AsDateTime) then
      Raise Exception.Create('Encerramento não Estornado!' + #13 + #13 +
                             'Descrição : ' + Obra.MessageInfo);
   //-------------------------------------------------------------------------------------
   bbtnEstornar.Down := False;
   Screen.Cursor := crDefault;
   //-------------------------------------------------------------------------------------
   SelObra(Sistema.IdEmpresa, 0);
end;

end.
