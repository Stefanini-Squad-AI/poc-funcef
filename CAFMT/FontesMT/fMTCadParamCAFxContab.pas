unit fMTCadParamCAFxContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBTables, Wwquery,
  CMTree, Mask, wwdbedit, DBCtrls, wwdblook, uCMTreeViewMT,
  uCtrlGrupoContab, uCtrlTipoMovimentacao, uCtrlParamCAFxContab,
  uCtrlParamCAF;

type
  TfrmMTCadParamCAFxContab = class(TFrmCadastroMestreDetMT)
    dsContaContabil: TwwDataSource;
    lblGrupo: TLabel;
    dblcGrupo: TwwDBLookupCombo;
    lblTipoMov: TLabel;
    dblcTipoMovimento: TwwDBLookupCombo;
    dbTipoLanc: TDBRadioGroup;
    Label2: TLabel;
    edPlanoConta: TEdit;
    Label1: TLabel;
    dbeContaContabil: TwwDBEdit;
    spdContaContabil: TSpeedButton;
    cdsDet: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsMovimento: TCMClientDataSet;
    treeContaContabil: TCMTreeViewMT;
    cdsContaContabil: TCMClientDataSet;
    cdsPlano: TCMClientDataSet;
    cdsParamCAF: TCMClientDataSet;
    cdsTestaC: TCMClientDataSet;
    Label3: TLabel;
    edPlaNome: TEdit;
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
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure spdContaContabilClick(Sender: TObject);
    procedure treeContaContabilDblClick(Sender: TObject);
    procedure treeContaContabilExit(Sender: TObject);
    procedure dbeContaContabilExit(Sender: TObject);
    procedure cdsDetAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    GrupoContab      : TCtrlGrupoContab;
    TipoMovimentacao : TCtrlTipoMovimentacao;
    ParamCAFxContab  : TCtrlParamCafxContab;
    ParamCAF         : TCtrlParamCAF;
    procedure SelParamCAFxContab(fIdPessoa, fIdGrupo, fIdTipoMov : Extended);
    function TestaContaContabil(fPlanoC : Extended; sConta : String) : String;
  public
    { Public declarations }
  end;

var
  frmMTCadParamCAFxContab: TfrmMTCadParamCAFxContab;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uIntegraBack;

procedure TfrmMTCadParamCAFxContab.FormCreate(Sender: TObject);
begin
   inherited;
   ParamCAFxContab := TCtrlParamCAFxContab.Create;
   ParamCAFxContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                              Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   ParamCAFxContab.cds := cds;
   ParamCAFxContab.cdsContasTiposMovimentoGrupos := cdsDet;
   //-------------------------------------------------------------------------------------
   GrupoContab := tCtrlGrupoContab.Create;
   GrupoContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,-1,'A');
   //-------------------------------------------------------------------------------------
   TipoMovimentacao := tCtrlTipoMovimentacao.Create;
   TipoMovimentacao.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                               Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsMovimento.Data := TipoMovimentacao.ListaTipoMovimentacao('S');
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsParamCAF.Data := ParamCAF.ListaParamCAF(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   cdsPlano.Data := ParamCAFxContab.ListaContabPlano(cdsParamCAF.FieldByName('PLANOVIGENTE').AsFloat);
   edPlanoConta.Text := cdsPlano.FieldByName('PLANO').AsString + ' - ' + cdsPlano.FieldByName('DESCPLANO').AsString;
   treeContaContabil.Mascara := cdsPlano.FieldByName('MASCARA').AsString;
   cdsContaContabil.Data := ParamCAFxContab.ListaContabPlanoConta(cdsParamCAF.FieldByName('PLANOVIGENTE').AsFloat);
   treeContaContabil.MontaArvore;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('TIPOSMOVIMENTOGRUPOS.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   SelParamCAFxContab(Sistema.IdEmpresa,0,0);
end;
//========================================================================================
procedure TFrmMTCadParamCAFxContab.SelParamCAFxContab(fIdPessoa, fIdGrupo, fIdTipoMov : Extended);
begin
   cds.Data := ParamCafxContab.ListaTiposMovimentoGrupos(fIdPessoa,fIdGrupo,fIdTipoMov);
   cdsDet.Data := ParamCafxContab.ListaParamCAFxContab(fIdPessoa,fIdGrupo,fIdTipoMov);
   TStringField(cdsDet.FieldByName('PLACONTA')).EditMask := cdsPlano.FieldByName('MASCARA').AsString + ';0;_';
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ParamCAFxContab.Free;
   GrupoContab.Free;
   TipoMovimentacao.Free;
   ParamCAF.Free;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ParamCAFxContab.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ParamCAFxContab.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ParamCAFxContab.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(GrupoContab.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelParamCAFxContab(strtofloat(MontaSelect.ValoresChave[0]),
                         strtofloat(MontaSelect.ValoresChave[1]),
                         strtofloat(MontaSelect.ValoresChave[2]));
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroInsert(Sender: TObject);
begin
   SelParamCAFxContab(Sistema.IdEmpresa,0,0);
   inherited;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroDelete(Sender: TObject);
begin
   cdsDet.First;
   while not cdsDet.EOF do
      cdsDet.Delete;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeDetalheConfirma(Sender: TObject);
begin
   if (cds.State in ([dsInsert,dsEdit])) and (cdsDet.State in ([dsInsert,dsEdit])) then
   begin
      if trim(dbeContaContabil.Text) = '' then
      begin
         MsgDlg('Obrigatório Preencher a Conta Contábil','Erro',mtError,[mbOk],0);
         dbeContaContabil.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      cdsDet.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
      cdsDet.FieldByName('PLANO').AsInteger              := cdsParamCAF.FieldByName('PLANOVIGENTE').AsInteger;
      cdsDet.FieldByName('IDGRUPO').AsInteger            := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
      cdsDet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
      cdsDet.FieldByName('PLANOME').Text                 := edPlaNome.Text;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroBeforeConfirma(Sender: TObject; var Accept: Boolean);
var
   iDeb, iCre : Integer;

begin
   Accept := False;
   if trim(dblcGrupo.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher o Grupo','Erro',mtError,[mbOk],0);
      dblcGrupo.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dblcTipoMovimento.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher o Tipo de Movimento','Erro',mtError,[mbOk],0);
      dblcTipoMovimento.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if cdsDet.RecordCount < 1 then
   begin
      MsgDlg('Obrigatório Preencher pelo menos uma Conta Contábil','Erro',mtError,[mbOk],0);
      tbcDetalhe.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if cdsDet.RecordCount > 2 then
   begin
      MsgDlg('Somente é possível ter uma Conta Contábil a Débito e uma a Crédito','Erro',mtError,[mbOk],0);
      tbcDetalhe.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   iDeb := 0;
   iCre := 0;
   cdsDet.First;
   while not cdsDet.EOF do
   begin
      if cdsDet.FieldByName('TIPOLANCAMENTO').AsString = 'D' then
         iDeb := iDeb + 1
      else
         iCre := iCre + 1;
      cdsDet.Next;   
   end;
   //-------------------------------------------------------------------------------------
   if iDeb <> 1 then
   begin
      MsgDlg('Somente é possível ter uma Conta Contábil a Débito','Erro',mtError,[mbOk],0);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if iCre <> 1 then
   begin
      MsgDlg('Somente é possível ter uma Conta Contábil a Crédito','Erro',mtError,[mbOk],0);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Alimenta o Pai
   //-------------------------------------------------------------------------------------
   if cds.State = dsInsert then
   begin
      cds.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
      cds.FieldByName('IDGRUPO').AsInteger            := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
      cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   Accept := True;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;

begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelParamCAFxContab(Sistema.IdEmpresa,0,0);
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelParamCAFxContab(Sistema.IdEmpresa,0,0);
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.spdContaContabilClick(Sender: TObject);
begin
   inherited;
   treeContaContabil.Visible := not treeContaContabil.Visible;
   if treeContaContabil.Visible then
      treeContaContabil.SetFocus;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.treeContaContabilDblClick(Sender: TObject);
begin
   inherited;
   if cdsContaContabil.FieldByName('PLATIPO').asString = 'A' then
      TreeContaContabil.Visible := False;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.treeContaContabilExit(Sender: TObject);
begin
   inherited;
   treeContaContabil.Visible := False;
   if (cdsContaContabil.FieldByName('PLATIPO').AsString = 'A') then
   begin
      cdsDet.FieldByName('PLANO').AsString    := cdsContaContabil.FieldByName('PLANO').AsString;
      cdsDet.FieldByName('PLACONTA').AsString := cdsContaContabil.FieldByName('PLACONTA').AsString;
      edPlaNome.Text := TestaContaContabil(cdsContaContabil.FieldByName('PLANO').asInteger,
                                           cdsContaContabil.FieldByName('PLACONTA').asString);
   end else
   begin
      cdsDet.FieldByName('PLACONTA').AsString := '';
      edPlaNome.Text := '';
   end;
   //-------------------------------------------------------------------------------------
   dbeContaContabil.SetFocus;
end;
//========================================================================================
function TfrmMTCadParamCAFxContab.TestaContaContabil(fPlanoC : Extended; sConta : String) : String;
begin
   Result := '';
   cdsTestaC.Data := ParamCAFxContab.ListaContabPlanoConta(fPlanoC,sConta);
   if cdsTestaC.IsEmpty then
      MsgDlg('Conta Contábil ' + sConta + ' Não Cadastrada. Verifique.','Erro',mtError,[mbOk],0)
   else
      Result := cdsTestaC.FieldByName('PLANOME').AsString;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.dbeContaContabilExit(Sender: TObject);
var
   sDescConta : String;
begin
   inherited;
   sDescConta := '';
   if trim(dbeContaContabil.Text) <> '' then
   begin
      sDescConta := TestaContaContabil(cdsParamCAF.FieldByName('PLANOVIGENTE').AsFloat,
                                       dbeContaContabil.Text);
      if sDescConta = '' then
      begin
         cdsDet.FieldByName('PLACONTA').AsString := '';
         dbeContaContabil.SetFocus;
         exit;
      end else
         edPlaNome.Text := sDescConta;
   end;
end;

procedure TfrmMTCadParamCAFxContab.cdsDetAfterScroll(DataSet: TDataSet);
begin
   inherited;
   edPlaNome.Text := cdsDet.FieldByName('PLANOME').AsString;
end;

end.
