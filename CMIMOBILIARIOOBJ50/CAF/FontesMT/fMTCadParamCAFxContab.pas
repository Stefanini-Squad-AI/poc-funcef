unit fMTCadParamCAFxContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, 
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBTables, Wwquery,
  CMTree, Mask, wwdbedit, DBCtrls, wwdblook, uCMTreeViewMT,
  uCtrlGrupoContab, uCtrlCentroCusto, uCtrlTipoMovimentacao, uCtrlParamCAFxContab,
  uCtrlParamCAF, uCtrlPadroes, uCmSqlParams, IvEMulti;

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
    lblTitCentroCusto: TLabel;
    dbeCentroCusto: TwwDBEdit;
    bbtnSelCentroCusto: TSpeedButton;
    MSCentroCusto: TMontaSelect;
    Label4: TLabel;
    edCentroCusto: TEdit;
    cdsCentroCusto: TCMClientDataSet;
    dsCentroCusto: TwwDataSource;
    cdsParamGlobal: TCMClientDataSet;
    cdsVerExistParam: TCMClientDataSet;
    sqlVerExistParam: TCMSqlParams;
    dbCkbSegrega: TDBCheckBox;
    dbckUsoDepreciacao: TDBCheckBox;
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
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure bbtnSelCentroCustoClick(Sender: TObject);
    procedure dbeCentroCustoExit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    GrupoContab      : TCtrlGrupoContab;
    CentroCusto      : TCtrlCentroCusto;
    TipoMovimentacao : TCtrlTipoMovimentacao;
    ParamCAFxContab  : TCtrlParamCafxContab;
    ParamCAF         : TCtrlParamCAF;
    procedure SelParamCAFxContab(fIdPessoa, fIdGrupo, fIdTipoMov : Extended);
    function  TestaContaContabil(fPlanoC : Extended; sConta : String) : String;
  public
    { Public declarations }
  end;

var
  frmMTCadParamCAFxContab: TfrmMTCadParamCAFxContab;

implementation

{$R *.DFM}

Uses uMensErro, uSistema ;

procedure TfrmMTCadParamCAFxContab.FormCreate(Sender: TObject);
begin
   inherited;
   ParamCAFxContab := TCtrlParamCAFxContab.Create;
   ParamCAFxContab.InitializeAs(Padroes);
   ParamCAFxContab.cds := cds;
   ParamCAFxContab.cdsContasTiposMovimentoGrupos := cdsDet;
   //-------------------------------------------------------------------------------------
   GrupoContab := tCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,-1,'A');
   //-------------------------------------------------------------------------------------
   TipoMovimentacao := tCtrlTipoMovimentacao.Create;
   TipoMovimentacao.InitializeAs(Padroes);
   cdsMovimento.Data := TipoMovimentacao.ListaTipoMovimentacao('S');
   //-------------------------------------------------------------------------------------
   CentroCusto := TCtrlCentroCusto.Create;
   CentroCusto.InitializeAs(Padroes);
   cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(0,'',True,1);
   edCentroCusto.Text := '';
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   cdsParamCAF.Data := ParamCAF.ListaParamCAF(Sistema.IdEmpresa);
   cdsParamGlobal.Data := ParamCAF.ListaParamGlobal(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   cdsPlano.Data := ParamCAFxContab.ListaContabPlano(cdsParamCAF.FieldByName('PLANOVIGENTE').AsFloat);
   edPlanoConta.Text := cdsPlano.FieldByName('PLANO').AsString + ' - ' + cdsPlano.FieldByName('DESCPLANO').AsString;
   treeContaContabil.Mascara := cdsPlano.FieldByName('MASCARA').AsString;
   cdsContaContabil.Data := ParamCAFxContab.ListaContabPlanoConta(cdsParamCAF.FieldByName('PLANOVIGENTE').AsFloat);
   treeContaContabil.MontaArvore;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('TIPOSMOVIMENTOGRUPOS.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   MSCentroCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
   SelParamCAFxContab(Sistema.IdEmpresa,0,0);
end;
//========================================================================================
procedure TFrmMTCadParamCAFxContab.SelParamCAFxContab(fIdPessoa, fIdGrupo, fIdTipoMov : Extended);
begin
   cds.Data := ParamCafxContab.ListaTiposMovimentoGrupos(fIdPessoa,fIdGrupo,fIdTipoMov);
   cdsDet.Data := ParamCafxContab.ListaParamCAFxContab(fIdPessoa,fIdGrupo,fIdTipoMov);
   TStringField(cdsDet.FieldByName('PLACONTA')).EditMask := cdsPlano.FieldByName('MASCARA').AsString + ';0;_';
   TStringField(cdsDet.FieldByName('CODCENTROCUSTO')).EditMask := cdsParamGlobal.FieldByName('MASCARACC').AsString + ';0;_';
   dbckUsoDepreciacao.Checked := (cds.FieldByName('FLGUSADEPRECIACAO').AsString = 'S')
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
procedure TfrmMTCadParamCAFxContab.CmeCadastroInsert(Sender: TObject);
begin
   SelParamCAFxContab(Sistema.IdEmpresa,0,0);
   inherited;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   edPlaNome.Text     := cdsDet.FieldByName('PLANOME').AsString;
   edCentroCusto.Text := cdsDet.FieldByName('DESCCCUSTO').AsString;
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
procedure TfrmMTCadParamCAFxContab.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   cdsDet.FieldByName('TIPOLANCAMENTO').AsString := 'D';
   edPlaNome.Text := '';
   edCentroCusto.Text := '';
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
   if cdsContaContabil.FieldByName('PLATIPO').AsString = 'A' then
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
//========================================================================================
procedure TfrmMTCadParamCAFxContab.bbtnSelCentroCustoClick(Sender: TObject);
begin
   inherited;
   MSCentroCusto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSCentroCusto.RetornouValor then
   begin
      cdsDet.FieldByName('CODCENTROCUSTO').AsString := trim(MSCentroCusto.ValoresChave[0]);
      cdsDet.FieldByName('IDEMPRESA').AsInteger     := strtoint(MSCentroCusto.ValoresChave[1]);
      cdsDet.FieldByName('DESCCCUSTO').AsString     := trim(MSCentroCusto.ValoresChave[2]);
      edCentroCusto.Text                            := MSCentroCusto.ValoresChave[2];
   end;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.dbeCentroCustoExit(Sender: TObject);
begin
  inherited;
   if trim(dbeCentroCusto.Text) <> '' then
   begin
      cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,dbeCentroCusto.Text,True,1);
      if (not cdsCentroCusto.IsEmpty) and (cdsCentroCusto.FieldByName('STATUSGRUPOCDC').AsString = 'A') then
      begin
         cdsDet.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
         cdsDet.FieldByName('DESCCCUSTO').AsString := cdsCentroCusto.FieldByName('NOME').AsString;
         edCentroCusto.Text                        := cdsDet.FieldByName('DESCCCUSTO').AsString;
      end else
      begin
         cdsDet.FieldByName('CODCENTROCUSTO').Clear;
         cdsDet.FieldByName('IDEMPRESA').Clear;
         cdsDet.FieldByName('DESCCCUSTO').Clear;
         edCentroCusto.Text := ''
      end;
   end else
   begin
      cdsDet.FieldByName('CODCENTROCUSTO').Clear;
      cdsDet.FieldByName('IDEMPRESA').Clear;
      cdsDet.FieldByName('DESCCCUSTO').Clear;
      edCentroCusto.Text := ''
   end;
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
      end else
      begin;
         cdsDet.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
         cdsDet.FieldByName('IDGRUPO').AsInteger            := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
         cdsDet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
         cdsDet.FieldByName('PLANO').AsInteger              := cdsParamCAF.FieldByName('PLANOVIGENTE').AsInteger;
         cdsDet.FieldByName('PLANOME').Text                 := edPlaNome.Text;
      end;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ParamCAFxContab.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ParamCAFxContab.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ParamCAFxContab.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroBeforeConfirma(Sender: TObject; var Accept: Boolean);
var
   iDeb, iCre : Integer;
begin
   Accept := True;
   if cds.State = dsInsert then
   begin
      sqlVerExistParam.Prepare;
      sqlVerExistParam.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      sqlVerExistParam.ParamByName('IDGRUPO').AsInteger  := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
      sqlVerExistParam.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
      sqlVerExistParam.Open;
      if not cdsVerExistParam.IsEmpty then
      begin
         MsgDlg('Parametrização Já Cadastrada!','Erro',mtError,[mbOk],0);
         Accept := False;
         Exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dblcGrupo.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher o Grupo','Erro',mtError,[mbOk],0);
      dblcGrupo.SetFocus;
      Accept := False;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dblcTipoMovimento.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher o Tipo de Movimento','Erro',mtError,[mbOk],0);
      dblcTipoMovimento.SetFocus;
      Accept := False;
   end;
   //-------------------------------------------------------------------------------------
   if cdsDet.RecordCount <= 1 then
   begin
      MsgDlg('Obrigatório preencher a partida dobrada!','Erro',mtError,[mbOk],0);
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if cdsDet.RecordCount = 2 then
   begin
      cdsDet.First;
      iDeb := 0;
      iCre := 0;
      while not cdsDet.EOF do
      begin
         if cdsDet.FieldByName('TIPOLANCAMENTO').AsString = 'D' then
            iDeb := iDeb + 1
         else
            iCre := iCre + 1;
         cdsDet.Next;
      end;
      if (iDeb <> 1) or (iCre <> 1) then
      begin
         MsgDlg('Obrigatório preencher a partida dobrada!','Erro',mtError,[mbOk],0);
         Accept := False;
         exit;
      end;
   end else
   //-------------------------------------------------------------------------------------
   if cdsDet.RecordCount > 2 then
   begin
      cdsDet.First;
      iDeb := 0;
      iCre := 0;
      while not cdsDet.EOF do
      begin
         if cdsDet.FieldByName('TIPOLANCAMENTO').AsString = 'D' then
         begin
            if iDeb >= 1 then
            begin
               if cdsDet.FieldByName('CODCENTROCUSTO').AsString = '' then
               begin
                  MsgDlg('É obrigatório informar o centro de custo para todas as contas contábeis ' +#13+
                         'qdo houver mais que uma conta a débito!', 'Erro', mtError, [mbOk], 0);
                  Accept := False;
                  exit;
               end;
            end else
            begin
               iDeb := iDeb + 1;
            end;
         end else
         if cdsDet.FieldByName('TIPOLANCAMENTO').AsString = 'C' then
         begin
            if iCre >= 1 then
            begin
               if cdsDet.FieldByName('CODCENTROCUSTO').AsString = '' then
               begin
                  MsgDlg('É obrigatório informar o centro de custo para todas as contas contábeis ' +#13+
                         'qdo houver mais que uma conta a crédito!', 'Erro', mtError, [mbOk], 0);
                  Accept := False;
                  exit;
               end;
            end else
            begin
               iCre := iCre + 1;
            end;
         end;
         cdsDet.Next;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if cds.State = dsInsert then
   begin
      cds.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
      cds.FieldByName('IDGRUPO').AsInteger            := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
      cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
   end;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroConfirma(Sender: TObject);
Var
   OldOperacao : TOperacao;
begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   case CmeCadastro.Operacao of
      opInserir :
         if not Sistema.GravaLogOperacoes('Inclusao de Parametrização Contábil') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opAlterar :
         if not Sistema.GravaLogOperacoes('Alteracao de Parametrização Contábil') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opApagar :
         if not Sistema.GravaLogOperacoes('Remocao de Parametrização Contábil') then
            raise Exception.Create('Erro ao gravar Log de Operação');
   end;
   //-------------------------------------------------------------------------------------
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
procedure TfrmMTCadParamCAFxContab.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if ParamCAFxContab.MessageInfo <> '' then
      MsgDlg(ParamCAFxContab.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.cdsDetAfterScroll(DataSet: TDataSet);
begin
   inherited;
   edPlaNome.Text     := cdsDet.FieldByName('PLANOME').AsString;
   edCentroCusto.Text := cdsDet.FieldByName('DESCCCUSTO').AsString;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsVerExistParam.Close;
   ParamCAFxContab.Free;
   GrupoContab.Free;
   TipoMovimentacao.Free;
   ParamCAF.Free;
end;

procedure TfrmMTCadParamCAFxContab.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbckUsoDepreciacao.Checked := (cds.FieldByName('FLGUSADEPRECIACAO').AsString = 'S')
end;

end.
