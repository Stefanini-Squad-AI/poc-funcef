// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ -------------------------------------------------------------------------------
Rotina......: MSCentroCusto -
Nº SOL......: 159473
Nº KINTANA..: 1313637
Data........: 10/06/2011
Responsável.: Vinicius Eduardo N. Maciel
Descrição...: Correção da descrição dos parâmetros de pesquisa
//--------------------------------------------------------------------------------
Rotina......: SelParamCAFxContab, -
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 29/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Incluído campo abaixo do campo "Movimentação". Tipo Esp. de
              Despesa . Adicionar na busca o "Tipo Específico de Movimentação".
//--------------------------------------------------------------------------------
{Rotina......: -
Nº SOL......: 138123
Nº KINTANA..: 838503
Data........: 12/07/2010
Responsável.: Thaise Amaral Martins
Descrição...: Adicionado o checkbox 'cbUsaDepreciacao', pois era obrigatório
              inserir ele na tabela TIPOSMOVIMENTOGRUPOS o campo
              'FLGUSADEPRECIACAO' e na tela não existia essa opção.
              Criação da procedure Habi_Desab, para desabilitar os componentes
              dblcGrupo e dblcTipoMovimento somente na hora da edição do
              registro, já que não é possível alterar.
-------------------------------------------------------------------------------------------------- }

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
  uCtrlParamCAF, uCtrlPadroes, uCmSqlParams, IvEMulti,uCtrlTipoDespesaAV,uCmMath;

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
    GroupBox4: TGroupBox;
    cbUsaDepreciacao: TDBCheckBox;
    Label5: TLabel;
    dblcTipoDespesa: TwwDBLookupCombo;
    cdsTipoDespesaAV: TCMClientDataSet;
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
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dblcTipoMovimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    {
    procedure bbtnConfirmarClick(Sender: TObject); Private declarations }
    GrupoContab      : TCtrlGrupoContab;
    CentroCusto      : TCtrlCentroCusto;
    TipoMovimentacao : TCtrlTipoMovimentacao;
    ParamCAFxContab  : TCtrlParamCafxContab;
    ParamCAF         : TCtrlParamCAF;
    //Helen - SOL Nº142550 KINTANA Nº 911790 Add fIdTipoDespesa
    TipoDespesaAV      : TCtrlTipoDespesaAV;
    procedure SelParamCAFxContab(fIdPessoa, fIdGrupo, fIdTipoMov  : Extended ; fIdTipoDespesa : Extended = -1);
    function  TestaContaContabil(fPlanoC : Extended; sConta : String) : String;
    procedure Habi_Desab(Comp: Array of TwwDBLookupCombo; H_D: Boolean);
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
   //Helen - SOL Nº142550 KINTANA Nº 911790-----------------------------------------------
   TipoDespesaAV    := TCtrlTipoDespesaAV.Create;
   TipoDespesaAV.InitializeAs(Padroes);
   cdsTipoDespesaAV.Data := TipoDespesaAV.ListaTipoDespesaAV(' IDTIPODESPESA > 0');
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
   //Helen - SOL Nº142550 KINTANA Nº 911790 Add fIdTipoDespesa
   SelParamCAFxContab(Sistema.IdEmpresa,0,0,0);
end;
//========================================================================================
procedure TFrmMTCadParamCAFxContab.SelParamCAFxContab(fIdPessoa, fIdGrupo, fIdTipoMov,fIdTipoDespesa : Extended);
begin
   //Helen - SOL Nº142550 KINTANA Nº 911790 Add fIdTipoDespesa
   cds.Data := ParamCafxContab.ListaTiposMovimentoGrupos(fIdPessoa,fIdGrupo,fIdTipoMov,fIdTipoDespesa);
   cdsDet.Data := ParamCafxContab.ListaParamCAFxContab(fIdPessoa,fIdGrupo,fIdTipoMov,fIdTipoDespesa);
   TStringField(cdsDet.FieldByName('PLACONTA')).EditMask := cdsPlano.FieldByName('MASCARA').AsString + ';0;_';
   TStringField(cdsDet.FieldByName('CODCENTROCUSTO')).EditMask := cdsParamGlobal.FieldByName('MASCARACC').AsString + ';0;_';
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelParamCAFxContab(strtofloat(MontaSelect.ValoresChave[0]),
                         strtofloat(MontaSelect.ValoresChave[1]),
                         strtofloat(MontaSelect.ValoresChave[2]),
      //Helen - SOL Nº142550 KINTANA Nº 911790 Add IdTipoDespesa
                         StrToFloatDef(MontaSelect.ValoresChave[3],-1));

end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroInsert(Sender: TObject);
begin
   //Helen - SOL Nº142550 KINTANA Nº 911790 Add IdTipoDespesa
   Habi_Desab([dblcGrupo, dblcTipoMovimento,dblcTipoDespesa], True);
   SelParamCAFxContab(Sistema.IdEmpresa,0,0,0);
   inherited;
   Cds.FieldByName('FLGUSADEPRECIACAO').AsString:= 'S';
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
         edCentroCusto.Text := cdsDet.FieldByName('DESCCCUSTO').AsString;
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
         //Helen - SOL Nº142550 KINTANA Nº 911790
         if dblcTipoDespesa.Text = '' then
            cdsDet.FieldByName('IDTIPODESPESA').AsInteger   := 0
         else
            cdsDet.FieldByName('IDTIPODESPESA').AsInteger   := cdsTipoDespesaAV.FieldByName('IDTIPODESPESA').asInteger;

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
   iDeb, iCre,
   inFlgSegrega,
   inFlgSegDeb,
   inFlgSegCre : Integer;
begin
   Accept := True;
   if cds.State = dsInsert then
   begin
      sqlVerExistParam.Prepare;
      sqlVerExistParam.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      sqlVerExistParam.ParamByName('IDGRUPO').AsInteger  := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
      sqlVerExistParam.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
      //Helen - SOL Nº142550 KINTANA Nº 911790
      if dblcTipoDespesa.Text = '' then
         sqlVerExistParam.ParamByName('IDTIPODESPESA').AsInteger := 0
      else
         sqlVerExistParam.ParamByName('IDTIPODESPESA').AsInteger := cdsTipoDespesaAV.FieldByName('IDTIPODESPESA').AsInteger; cdsTipoDespesaAV.FieldByName('IDTIPODESPESA').AsInteger;

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
      iDeb := 0;
      iCre := 0;
      inFlgSegrega := 0;
      //----------------------------------------------------------------------------------
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         if cdsDet.FieldByName('TIPOLANCAMENTO').AsString = 'D' then
            iDeb := iDeb + 1
         else
            iCre := iCre + 1;
         //-------------------------------------------------------------------------------
         // Verifica se mais de uma conta foi marcada como Critério para Segregação
         //-------------------------------------------------------------------------------
         if cdsDet.FieldByName('FLGSEGREGA').AsInteger = 1 then
            inFlgSegrega := inFlgSegrega + 1;
         //-------------------------------------------------------------------------------
         cdsDet.Next;
      end;
      //----------------------------------------------------------------------------------
      if (iDeb <> 1) or (iCre <> 1) then
      begin
         MsgDlg('Obrigatório preencher a partida dobrada!','Erro',mtError,[mbOk],0);
         Accept := False;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if inFlgSegrega > 1 then
      begin
         MsgDlg('Somente uma Conta pode ser usada como Critério de Segregação!',
                'Erro',mtError,[mbOk],0);
         Accept := False;
         exit;
      end;
   end else
   //-------------------------------------------------------------------------------------
   if cdsDet.RecordCount > 2 then
   begin
      cdsDet.First;
      inFlgSegDeb := 0;
      inFlgSegCre := 0;
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
                         'qdo houver mais que uma conta a débito!',
                         'Erro', mtError, [mbOk], 0);
                  Accept := False;
                  exit;
               end;
            end else
            begin
               iDeb := iDeb + 1;
            end;
            //----------------------------------------------------------------------------
            // Verifica se mais de uma conta foi marcada como Critério para Segregação
            //----------------------------------------------------------------------------
            if cdsDet.FieldByName('FLGSEGREGA').AsInteger = 1 then
               inFlgSegDeb := inFlgSegDeb + 1;
         end else
         if cdsDet.FieldByName('TIPOLANCAMENTO').AsString = 'C' then
         begin
            if iCre >= 1 then
            begin
               if cdsDet.FieldByName('CODCENTROCUSTO').AsString = '' then
               begin
                  MsgDlg('É obrigatório informar o centro de custo para todas as contas contábeis ' +#13+
                         'qdo houver mais que uma conta a crédito!',
                         'Erro', mtError, [mbOk], 0);
                  Accept := False;
                  exit;
               end;
            end else
            begin
               iCre := iCre + 1;
            end;
            //----------------------------------------------------------------------------
            // Verifica se mais de uma conta foi marcada como Critério para Segregação
            //----------------------------------------------------------------------------
            if cdsDet.FieldByName('FLGSEGREGA').AsInteger = 1 then
               inFlgSegCre := inFlgSegCre + 1;
         end;
         cdsDet.Next;
      end;
      //----------------------------------------------------------------------------------
      if (inFlgSegDeb > 0) and (inFlgSegCre > 0) then
      begin
         MsgDlg('Somente um tipo de Conta Contábil pode ser usada como Critério de Segregação!',
                'Erro',mtError,[mbOk],0);
         Accept := False;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if cds.State = dsInsert then
   begin
      cds.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
      cds.FieldByName('IDGRUPO').AsInteger            := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
      cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
      //Helen - SOL Nº142550 KINTANA Nº 911790
      if dblcTipoDespesa.Text = '' then
         cds.FieldByName('IDTIPODESPESA').AsInteger   := 0
      else
         cds.FieldByName('IDTIPODESPESA').AsInteger   := cdsTipoDespesaAV.FieldByName('IDTIPODESPESA').AsInteger;
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
      SelParamCAFxContab(Sistema.IdEmpresa,0,0,0); //Helen - SOL Nº142550 KINTANA Nº 911790 Add IdTipoDespesa
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelParamCAFxContab(Sistema.IdEmpresa,0,0,0); //Helen - SOL Nº142550 KINTANA Nº 911790 Add IdTipoDespesa
   //Helen - SOL Nº142550 KINTANA Nº 911790
   Habi_Desab([dblcGrupo, dblcTipoMovimento,dblcTipoDespesa], True);
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
   //Helen - SOL Nº142550 KINTANA Nº 911790
   TipoDespesaAV.Free;
   ParamCAF.Free;
end;
//========================================================================================
procedure TfrmMTCadParamCAFxContab.FormShow(Sender: TObject);
begin
   inherited;
   ParamCAFxContab.ReconstroiTipoMovimentacao;
end;

procedure TfrmMTCadParamCAFxContab.Habi_Desab(
  Comp: array of TwwDBLookupCombo; H_D: Boolean);
var x: integer;
begin
  for x:= 0 to High(comp) do
    comp[x].Enabled:= H_D;
end;

procedure TfrmMTCadParamCAFxContab.CmeCadastroEdit(Sender: TObject);
begin
  //Helen - SOL Nº142550 KINTANA Nº 911790
  Habi_Desab([dblcGrupo, dblcTipoMovimento,dblcTipoDespesa], False);
  inherited;
end;

procedure TfrmMTCadParamCAFxContab.dblcTipoMovimentoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //Helen - SOL Nº142550 KINTANA Nº 911790
   dblcTipoDespesa.Enabled := false;
   if (cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsString <> '') then
   begin
     cdsTipoDespesaAV.close;
     cdsTipoDespesaAV.Data := TipoDespesaAV.ListaTipoDespesaAV(' IDTIPOMOVIMENTACAO = ' + cdsMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsString) ;
     if not cdsTipoDespesaAV.Eof then
     begin
         dblcTipoDespesa.Enabled := True;
     end;
   end
   else
     cds.FieldByName('IDTIPODESPESA').AsString := '0' ;
end;

end.


