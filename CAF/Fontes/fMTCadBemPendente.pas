unit fMTCadBemPendente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc,IvDictio, IvMulti, uDatabase,
  StdCtrls, DBCtrls, fcLabel, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, Mask, TREdit, wwdbedit, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  uCMTypes, DBTables, Wwquery, uCmSqlParams,uCtrlAlmoxCAF, IvEMulti,
  uCtrlMovBensPendentes, uCtrlDomBem, uCtrlClassedeBem, uCtrlConjunto, uCtrlSituacao,
  uCtrlTerceiro, uCtrlGrupoContab, uCtrlParamCAF, uCtrlSubConta, uCtrlUnidNegocio,
  uCtrlPadroes;

type
  TfrmMTCadBemPendente = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    edDescClasse: TwwDBEdit;
    bbtnSelClasse: TBitBtn;
    Label27: TLabel;
    cmbControle: TComboBox;
    Label29: TLabel;
    cmbSituacao: TwwDBLookupCombo;
    Label7: TLabel;
    pnlLivros: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Ano: TLabel;
    bbtnRetornaPlaca: TBitBtn;
    pnlPlaca: TPanel;
    Label43: TLabel;
    Label13: TLabel;
    Label28: TLabel;
    edPlaca: TMaskEdit;
    bbtnGeraPlaca: TBitBtn;
    bbtnLivros: TBitBtn;
    tbsContabil: TTabSheet;
    tbsPlanoPatro: TTabSheet;
    tbsConjunto: TTabSheet;
    tbsDocumento: TTabSheet;
    Label9: TLabel;
    dbeDataInclusao: TCMDateTimePicker;
    Label14: TLabel;
    edDataNota: TCMDateTimePicker;
    Label16: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    bbtnSelFornec: TBitBtn;
    edFornec: TwwDBEdit;
    Label19: TLabel;
    edValHistorico: TRealEdit;
    Label44: TLabel;
    Label49: TLabel;
    Label3: TLabel;
    dbeDescConjunto: TDBMemo;
    Label4: TLabel;
    dbeDescLocalizacao: TwwDBEdit;
    dbeNomeResponsavel: TwwDBEdit;
    Label5: TLabel;
    dbgRateioCustos: TwwDBGrid;
    Label6: TLabel;
    pnlIntegraContab: TPanel;
    Label54: TLabel;
    dbeDtaContab: TCMDateTimePicker;
    Label8: TLabel;
    edDescGrupo: TwwDBEdit;
    bbtnSelGrupo: TBitBtn;
    bbtnSelSubConta: TBitBtn;
    edDescSubConta: TwwDBEdit;
    Label17: TLabel;
    edAtivProjeto: TwwDBEdit;
    bbtnSelAtivProjeto: TBitBtn;
    Label18: TLabel;
    dbeDataInicioDep: TCMDateTimePicker;
    fcLabel2: TfcLabel;
    bbtnSelConjunto: TBitBtn;
    bbtnGeraConjunto: TBitBtn;
    Label10: TLabel;
    dbeTaxaDep: TDBRealEdit;
    Label11: TLabel;
    pnlDetPlanoPatro: TPanel;
    dbgRateio: TwwDBGrid;
    Label2: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label20: TLabel;
    cdsDet: TCMClientDataSet;
    dsRateio: TwwDataSource;
    cdsRateio: TCMClientDataSet;
    MSClasse: TMontaSelect;
    dsClasse: TwwDataSource;
    cdsClasse: TCMClientDataSet;
    cdsSituacao: TCMClientDataSet;
    dbeNumSerie: TwwDBEdit;
    dbeIdOpcional: TwwDBEdit;
    dbeDesBem: TDBMemo;
    dbePubAutor: TwwDBEdit;
    dbePubEditora: TwwDBEdit;
    cdsConjunto: TCMClientDataSet;
    cdsRateioCCusto: TCMClientDataSet;
    dsConjunto: TwwDataSource;
    dsRateioCCusto: TwwDataSource;
    dbeNota: TwwDBEdit;
    dbeComplNota: TwwDBEdit;
    dbeProcesso: TwwDBEdit;
    dbeEmpenho: TwwDBEdit;
    edQtde: TRealEdit;
    MSFornec: TMontaSelect;
    MSTerceiro: TMontaSelect;
    MSAtivProj: TMontaSelect;
    MSSubConta: TMontaSelect;
    MSGrupos: TMontaSelect;
    MSConjunto: TMontaSelect;
    cdsFornec: TCMClientDataSet;
    cdsTerceiro: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsSubConta: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    dsFornec: TwwDataSource;
    dsTerceiro: TwwDataSource;
    dsGrupo: TwwDataSource;
    dsSubConta: TwwDataSource;
    dsAtivProj: TwwDataSource;
    cdsParamCAF: TCMClientDataSet;
    cdsBuscaGrupo: TCMClientDataSet;
    cdsGrupoTaxaDep: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    dbcmbPlanoPrev: TwwDBLookupCombo;
    dsPlanoPrev: TwwDataSource;
    dsPatro: TwwDataSource;
    dbcmbPatro: TwwDBLookupCombo;
    dbePercRateio: TDBRealEdit;
    Label48: TLabel;
    edTerceiro: TwwDBEdit;
    bbtnSelTerceiro: TBitBtn;
    dbePubAno: TDBRealEdit;
    cdsBemxMoeda: TCMClientDataSet;
    ckbFlgBemIntContab: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnSelClasseClick(Sender: TObject);
    procedure bbtnSelFornecClick(Sender: TObject);
    procedure bbtnSelTerceiroClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure cdsGrupoAfterOpen(DataSet: TDataSet);
    procedure bbtnSelSubContaClick(Sender: TObject);
    procedure bbtnSelAtivProjetoClick(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure bbtnLivrosClick(Sender: TObject);
    procedure bbtnRetornaPlacaClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbeDataInclusaoExit(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure ckbFlgBemIntContabClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnGeraPlacaClick(Sender: TObject);
  private
    { Private declarations }
    Bem           : TCtrlDomBem;
    ParamCAF      : TCtrlParamCAF;
    ClassedeBem   : TCtrlClassedeBem;
    Conjunto      : TCtrlConjunto;
    Situacao      : TCtrlSituacao;
    Terceiro      : TCtrlTerceiro;
    GrupoContab   : TCtrlGrupoContab;
    AtivProjeto   : TCtrlUnidNegocio;
    SubConta      : TCtrlSubConta;
    BensPendentes : TCtrlMovBensPendentes;
    AlmoxCAF      : TCtrlAlmoxCAF;
    //------------------------------------------------------------------------------------
    procedure CarregaBemPendente;

  public
    { Public declarations }
  end;

var
  frmMTCadBemPendente: TfrmMTCadBemPendente;

implementation

{$R *.DFM}

Uses uMensErro, uSistema , fMTMovBensPendentes, fMTCadConjunto;

procedure TfrmMTCadBemPendente.FormCreate(Sender: TObject);
begin
   inherited;
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   BensPendentes := TCtrlMovBensPendentes.Create;
   BensPendentes.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ClassedeBem := TCtrlClassedeBem.Create;
   ClassedeBem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Situacao := TCtrlSituacao.Create;
   Situacao.InitializeAs(Padroes);
   cdsSituacao.Data := Situacao.ListaSituacao;
   //-------------------------------------------------------------------------------------
   Terceiro := TCtrlTerceiro.Create;
   Terceiro.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   AlmoxCAF := TCtrlAlmoxCAF.Create;
   AlmoxCAF.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   cdsParamCAF.Data  := ParamCAF.ListaParamCAF(Sistema.IdEmpresa);
   cdsPatro.Data     := ParamCAF.ListaPatro;
   cdsPlanoPrev.Data := ParamCAF.ListaPlanoPrev;
   bbtnGeraPlaca.Enabled := ParamCAF.EDITACODBEM = 1;
   edPlaca.Enabled := ParamCAF.EDITACODBEM = 0;
   //-------------------------------------------------------------------------------------
   AtivProjeto := TCtrlUnidNegocio.Create;
   AtivProjeto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   SubConta := TCtrlSubConta.Create;
   SubConta.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('BEM.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupos.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   pgctrlDetalhe.ActivePage := tbsDocumento;
   CarregaBemPendente;
   Application.ProcessMessages;                    // Aguarda todas as tarefas terminarem
   //-------------------------------------------------------------------------------------
   sbtnAlterar.Click;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.CarregaBemPendente;
begin
   //-------------------------------------------------------------------------------------
   // Transfere os dados do registro corrente do form mestre para o detalhe
   //-------------------------------------------------------------------------------------
   cds.Data := BensPendentes.ListarBensNota(0,0,'');
   cds.Append;
   cds.FieldByName('IDPESSOA').AsFloat         := frmMTMovBensPendentes.cds.FieldByName('IDPESSOA').AsFloat         ;
   cds.FieldByName('IDBENSPENDENTES').AsFloat  := frmMTMovBensPendentes.cds.FieldByName('IDBENSPENDENTES').AsFloat  ;
   cds.FieldByName('IDFORNSERV').AsFloat       := frmMTMovBensPendentes.cds.FieldByName('IDFORNSERV').AsFloat       ;
   cds.FieldByName('IDNOTA').AsString          := frmMTMovBensPendentes.cds.FieldByName('IDNOTA').AsString          ;
   cds.FieldByName('IDITENSRECDEV').AsFloat    := frmMTMovBensPendentes.cds.FieldByName('IDITENSRECDEV').AsFloat    ;
   cds.FieldByName('IDSITUACAO').AsFloat       := frmMTMovBensPendentes.cds.FieldByName('IDSITUACAO').AsFloat    ;
   cds.FieldByName('PLACA').AsFloat            := frmMTMovBensPendentes.cds.FieldByName('PLACA').AsFloat            ;
   cds.FieldByName('DESBEM').AsString          := frmMTMovBensPendentes.cds.FieldByName('DESBEM').AsString          ;
   cds.FieldByName('VALORG').AsFloat           := frmMTMovBensPendentes.cds.FieldByName('VALORG').AsFloat           ;
   cds.FieldByName('IDMODULO').AsFloat         := frmMTMovBensPendentes.cds.FieldByName('IDMODULO').AsFloat         ;
   cds.FieldByName('IDGRUPO').AsFloat          := frmMTMovBensPendentes.cds.FieldByName('IDGRUPO').AsFloat          ;
   cds.FieldByName('IDCLASSEBEM').AsFloat      := frmMTMovBensPendentes.cds.FieldByName('IDCLASSEBEM').AsFloat      ;
   cds.FieldByName('IDCONJUNTO').AsFloat       := frmMTMovBensPendentes.cds.FieldByName('IDCONJUNTO').AsFloat       ;
   cds.FieldByName('CONTROLE').AsString        := frmMTMovBensPendentes.cds.FieldByName('CONTROLE').AsString        ;
   cds.FieldByName('COMPLNOTA').AsString       := frmMTMovBensPendentes.cds.FieldByName('COMPLNOTA').AsString       ;
   cds.FieldByName('DTANOTA').AsDateTime       := frmMTMovBensPendentes.cds.FieldByName('DTANOTA').AsDateTime       ;
   cds.FieldByName('DTAINCLUSAO').AsDateTime   := frmMTMovBensPendentes.cds.FieldByName('DTAINCLUSAO').AsDateTime   ;
   cds.FieldByName('NUMSERIE').AsString        := frmMTMovBensPendentes.cds.FieldByName('NUMSERIE').AsString        ;
   cds.FieldByName('IDTERCEIRO').AsFloat       := frmMTMovBensPendentes.cds.FieldByName('IDTERCEIRO').AsFloat       ;
   cds.FieldByName('REGISTRO').AsString        := frmMTMovBensPendentes.cds.FieldByName('REGISTRO').AsString        ;
   cds.FieldByName('VALHISTORICO').AsFloat     := frmMTMovBensPendentes.cds.FieldByName('VALHISTORICO').AsFloat     ;
   cds.FieldByName('DATAINICIODEP').AsDateTime := frmMTMovBensPendentes.cds.FieldByName('DATAINICIODEP').AsDateTime ;
   cds.FieldByName('DATAULTDEP').AsDateTime    := frmMTMovBensPendentes.cds.FieldByName('DATAULTDEP').AsDateTime    ;
   cds.FieldByName('IDOPCIONAL').AsString      := frmMTMovBensPendentes.cds.FieldByName('IDOPCIONAL').AsString      ;
   cds.FieldByName('PROCESSOAQUIS').AsString   := frmMTMovBensPendentes.cds.FieldByName('PROCESSOAQUIS').AsString   ;
   cds.FieldByName('EMPENHOAQUIS').AsString    := frmMTMovBensPendentes.cds.FieldByName('EMPENHOAQUIS').AsString    ;
   cds.FieldByName('PUBAUTOR').AsString        := frmMTMovBensPendentes.cds.FieldByName('PUBAUTOR').AsString        ;
   cds.FieldByName('PUBEDITORA').AsString      := frmMTMovBensPendentes.cds.FieldByName('PUBEDITORA').AsString      ;
   cds.FieldByName('PUBANO').AsFloat           := frmMTMovBensPendentes.cds.FieldByName('PUBANO').AsFloat           ;
   //-------------------------------------------------------------------------------------
   if frmMTMovBensPendentes.cds.FieldByName('CODSUBCONTA').IsNull then
      cds.FieldByName('CODSUBCONTA').Clear
   else
      cds.FieldByName('CODSUBCONTA').AsFloat := frmMTMovBensPendentes.cds.FieldByName('CODSUBCONTA').AsFloat;
   if frmMTMovBensPendentes.cds.FieldByName('UNIDNEGOC').IsNull then
      cds.FieldByName('UNIDNEGOC').Clear
   else
      cds.FieldByName('UNIDNEGOC').AsFloat := frmMTMovBensPendentes.cds.FieldByName('UNIDNEGOC').AsFloat;
   //-------------------------------------------------------------------------------------
   cdsDet.Data := BensPendentes.ListarBensNotaxDep(0,0,'');
   frmMTMovBensPendentes.cdsDet.Locate('IDBENSPENDENTES;IDPESSOA',
                                       VarArrayOf([cds.FieldByName('IDBENSPENDENTES').AsFloat,
                                                   cds.FieldByName('IDPESSOA').AsFloat]),[]);
   while (not frmMTMovBensPendentes.cdsDet.EOF) and
         (frmMTMovBensPendentes.cdsDet.FieldByName('IDBENSPENDENTES').AsFloat = cds.FieldByName('IDBENSPENDENTES').AsFloat) and
         (frmMTMovBensPendentes.cdsDet.FieldByName('IDPESSOA').AsFloat = cds.FieldByName('IDPESSOA').AsFloat) DO
   begin
      cdsDet.Append;
      cdsDet.FieldByName('IDPESSOA').AsFloat        := frmMTMovBensPendentes.cdsDet.FieldByName('IDPESSOA').AsFloat ;
      cdsDet.FieldByName('IDBENSPENDENTES').AsFloat := frmMTMovBensPendentes.cdsDet.FieldByName('IDBENSPENDENTES').AsFloat;
      cdsDet.FieldByName('MOECODIGO').AsInteger     := frmMTMovBensPendentes.cdsDet.FieldByName('MOECODIGO').AsInteger;
      cdsDet.FieldByName('IDBEMXDEP').AsInteger     := frmMTMovBensPendentes.cdsDet.FieldByName('IDBEMXDEP').AsInteger;
      cdsDet.FieldByName('TAXADEP').AsFloat         := frmMTMovBensPendentes.cdsDet.FieldByName('TAXADEP').AsFloat;
      cdsDet.FieldByName('DESCTAXADEP').AsString    := frmMTMovBensPendentes.cdsDet.FieldByName('DESCTAXADEP').AsString;
      cdsDet.Post;
      //----------------------------------------------------------------------------------
      frmMTMovBensPendentes.cdsDet.Next;
   end;
   //-------------------------------------------------------------------------------------
   cdsRateio.Data := BensPendentes.ListarBensNotaxRateio(0,0,'');
   frmMTMovBensPendentes.cdsRateio.Locate('IDBENSPENDENTES;IDPESSOA',
                                          VarArrayOf([cds.FieldByName('IDBENSPENDENTES').AsFloat,
                                                      cds.FieldByName('IDPESSOA').AsFloat]),[]);
   while (not frmMTMovBensPendentes.cdsRateio.EOF) and
         (frmMTMovBensPendentes.cdsRateio.FieldByName('IDBENSPENDENTES').AsFloat = cds.FieldByName('IDBENSPENDENTES').AsFloat) and
         (frmMTMovBensPendentes.cdsRateio.FieldByName('IDPESSOA').AsFloat = cds.FieldByName('IDPESSOA').AsFloat) DO
   begin
      MoveFields(frmMTMovBensPendentes.cdsRateio,cdsRateio,opInserir,True);
      frmMTMovBensPendentes.cdsRateio.Next;
   end;
   //-------------------------------------------------------------------------------------
   ParamCAF.CarregaProp(cds.FieldByName('IDPESSOA').AsFloat);
   //-------------------------------------------------------------------------------------
   if cds.FieldByName('CONTROLE').AsString = 'T' then
      cmbControle.Text := 'Total'
   else
      cmbControle.Text := 'Físico';
   //-------------------------------------------------------------------------------------
   edValHistorico.Value := cds.FieldByName('VALORG').AsFloat;
   edPlaca.Text := cds.FieldByName('PLACA').AsString;
   edQtde.Value := 1;
   //-------------------------------------------------------------------------------------
   cdsClasse.Data       := ClassedeBem.ListaClassedeBem(cds.FieldByName('IDCLASSEBEM').AsFloat);
   cdsConjunto.Data     := Conjunto.ListaConjunto(cds.FieldByName('IDPESSOA').AsFloat, cds.FieldByName('IDCONJUNTO').AsFloat);
   cdsRateioCCusto.Data := Conjunto.ListaRateioCustos(cds.FieldByName('IDPESSOA').AsFloat, cds.FieldByName('IDCONJUNTO').AsFloat);
   cdsFornec.Data       := Bem.ListaFornecedor(cds.FieldByName('IDFORNSERV').AsFloat);
   cdsGrupo.Data        := GrupoContab.ListaGrupoContab(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDGRUPO').AsFloat);
   if not cdsClasse.FieldByName('MASCARAIDOPCIONAL').IsNull then
   begin
      TStringField(cds.FieldByName('IDOPCIONAL')).EditMask := cdsClasse.FieldByName('MASCARAIDOPCIONAL').AsString + ';0; ';
   end else
   begin
      TStringField(cds.FieldByName('IDOPCIONAL')).EditMask := '';
   end;
   //-------------------------------------------------------------------------------------
   if (not cds.FieldByName('UNIDNEGOC').IsNull) and (cds.FieldByName('UNIDNEGOC').AsFloat <> 0) then
   begin
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('UNIDNEGOC').AsFloat);
   end else
   begin
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(cds.FieldByName('IDPESSOA').AsFloat,-2);
   end;
   if (not cds.FieldByName('CODSUBCONTA').IsNull) and (cds.FieldByName('CODSUBCONTA').AsFloat <> 0) then
   begin
      cdsSubConta.Data := SubConta.ListSubConta(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('CODSUBCONTA').AsFloat);
   end else
   begin
      cdsSubConta.Data := SubConta.ListSubConta(cds.FieldByName('IDPESSOA').AsFloat,-2);
   end;
   //-------------------------------------------------------------------------------------
   if cdsConjunto.FieldByName('ALUGADO').AsInteger = 1 then
   begin
      bbtnSelTerceiro.Enabled := True;
      cdsTerceiro.Data := Terceiro.ListaTerceiro(cds.FieldByName('IDTERCEIRO').AsFloat);
   end else
   begin
      bbtnSelTerceiro.Enabled := False;
      cdsTerceiro.Data := Terceiro.ListaTerceiro(0);
   end;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Bem.Free;
   ParamCAF.Free;
   ClassedeBem.Free;
   Conjunto.Free;
   Situacao.Free;
   Terceiro.Free;
   GrupoContab.Free;
   AtivProjeto.Free;
   SubConta.Free;
   BensPendentes.Free;
   AlmoxCAF.Free;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.bbtnLivrosClick(Sender: TObject);
begin
   inherited;
   pnlPlaca.SendToBack;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.bbtnRetornaPlacaClick(Sender: TObject);
begin
   inherited;
   pnlLivros.SendToBack;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.dbeDataInclusaoExit(Sender: TObject);
begin
   inherited;
   if CmeCadastro.Operacao = opInserir then
   begin
      if dbeDataInicioDep.Text = '' then
         cds.FieldByName('DATAINICIODEP').AsDateTime := dbeDataInclusao.Date;
      if dbeDtaContab.Text = '' then
         cds.FieldByName('DTACONTAB').AsDateTime := dbeDataInclusao.Date;
   end else
   if (CmeCadastro.Operacao = opAlterar) and (dbeDataInclusao.Date <> dbeDataInicioDep.Date) then
      if MsgDlg('As datas de entrada e inicio da depreciação estão diferentes.' + #13 +
                'Deseja que a data de inicio da depreciação seja igual a data de entrada ' +
                'do bem na empresa ?','Confirmação',
                mtConfirmation,[mbYes, mbNo],0)= mrYes then
         if dbeDataInicioDep.Text = '' then
            cds.FieldByName('DATAINICIODEP').AsDateTime := dbeDataInclusao.Date;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.ckbFlgBemIntContabClick(Sender: TObject);
begin
   inherited;
   if ckbFlgBemIntContab.Checked and (dbeDtaContab.Text = '') and (dbeDataInclusao.Text <> '') then
      cds.FieldByName('DTACONTAB').AsDateTime := cds.FieldByName('DTAINCLUSAO').AsDateTime;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(Bem.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadBemPendente.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   if pgCtrlDetalhe.ActivePage = tbsDet then  // Taxa de Depreciação
   begin
      sBtnInsDet.Visible := False;
      sBtnAltDet.Caption := 'Alterar Taxa';
      sBtnAltDet.Width   := 104;
      sBtnExcluiDet.Visible := False;
   end else
   if pgCtrlDetalhe.ActivePage = tbsPlanoPatro then  // Rateio Plano Previdenciario / Patrocinadora
   begin
      sBtnInsDet.Visible := True;
      sBtnAltDet.Caption := '';
      sBtnAltDet.Width   := 25;
      sBtnExcluiDet.Visible := True;
   end;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.bbtnSelClasseClick(Sender: TObject);
begin
   inherited;
   MSClasse.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSClasse.RetornouValor then
   begin
      cdsClasse.Data := ClassedeBem.ListaClassedeBem(strtofloat(MSClasse.ValoresChave[0]));
      if not cdsClasse.FieldByName('MASCARAIDOPCIONAL').IsNull then
         TStringField(cds.FieldByName('IDOPCIONAL')).EditMask := cdsClasse.FieldByName('MASCARAIDOPCIONAL').AsString + ';0; '
      else
         TStringField(cds.FieldByName('IDOPCIONAL')).EditMask := '';
      //----------------------------------------------------------------------------------
      // Seleciona o Grupo Contábil
      //----------------------------------------------------------------------------------
      if (CmeCadastro.Operacao = opInserir) or (cdsGrupo.FieldByName('IDGRUPO').IsNull) then
      begin
         //-------------------------------------------------------------------------------
         // Se for inclusão e o parâmetro estiver setado, incluir na descricao
         //-------------------------------------------------------------------------------
         if (cdsParamCaf.FieldByName('FLGCLSDESBEM').AsInteger = 1) and (dbeDesBem.Text = '') then
         begin
            dbeDesBem.Text := cdsClasse.FieldByName('DESCRICAO').AsString;
         end;
         //-------------------------------------------------------------------------------
         // Se for inclusão e o parâmetro estiver setado, incluir na descricao
         //-------------------------------------------------------------------------------
         cdsBuscaGrupo.Data := Bem.BuscaGrupoContab(Sistema.IdEmpresa,
                                                    cdsClasse.FieldByName('IDCLASSEBEM').AsFloat,
                                                    cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
         if not cdsBuscaGrupo.IsEmpty then
         begin
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                          cdsBuscaGrupo.FieldByName('IDGRUPO').AsFloat);
         end else
         begin
            cdsGrupo.Close;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.bbtnSelFornecClick(Sender: TObject);
begin
   inherited;
   MSFornec.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   cdsFornec.Close;
   if MSFornec.RetornouValor then
      cdsFornec.Data := Bem.ListaFornecedor(strtofloat(MSFornec.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTCadBemPendente.bbtnSelTerceiroClick(Sender: TObject);
begin
   inherited;
   MSTerceiro.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   cdsTerceiro.Close;
   if MSTerceiro.RetornouValor then
      cdsTerceiro.Data := Terceiro.ListaTerceiro(strtofloat(MSTerceiro.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTCadBemPendente.bbtnGeraConjuntoClick(Sender: TObject);
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
   cdsConjunto.Data     := Conjunto.ListaConjunto(fIdPessoa, fIdConjunto);
   cdsRateioCCusto.Data := Conjunto.ListaRateioCustos(fIdPessoa, fIdConjunto);
   //-------------------------------------------------------------------------------------
   if cdsConjunto.FieldByName('ALUGADO').AsInteger = 1 then
   begin
      bbtnSelTerceiro.Enabled := True;
      cdsTerceiro.Data := Terceiro.ListaTerceiro(cds.FieldByName('IDTERCEIRO').AsFloat);
   end else
   begin
      bbtnSelTerceiro.Enabled := False;
      cdsTerceiro.Data := Terceiro.ListaTerceiro(0);
   end;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
   begin
      cdsConjunto.Data     := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                     StrToFloat(MSConjunto.ValoresChave[0]));
      cdsRateioCCusto.Data := Conjunto.ListaRateioCustos(cdsConjunto.FieldByName('IDPESSOA').AsFloat,
                                                         cdsConjunto.FieldByName('IDCONJUNTO').AsFloat);
      //----------------------------------------------------------------------------------
      if cdsConjunto.FieldByName('ALUGADO').AsInteger = 1 then
      begin
         bbtnSelTerceiro.Enabled := True;
         cdsTerceiro.Data := Terceiro.ListaTerceiro(cds.FieldByName('IDTERCEIRO').AsFloat);
      end else
      begin
         bbtnSelTerceiro.Enabled := False;
         cdsTerceiro.Data := Terceiro.ListaTerceiro(0);
      end;
   end;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupos.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupos.RetornouValor then
   begin
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                    StrToFloat(MSGrupos.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      // Verificar se o Grupo está relacionado com a Classe do Bem
      //----------------------------------------------------------------------------------
      if not Bem.GrupoxClasseOk(Sistema.IdEmpresa,
                                cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                cdsClasse.FieldByName('IDCLASSEBEM').AsFloat) then
      begin
         MsgDlg(Bem.MessageInfo, 'Erro', mtError, [mbOk], 0);
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,0);
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Verificar se a mudança de conjunto irá acarretar uma mudança de grupo
      //----------------------------------------------------------------------------------
      if not Bem.GrupoxConjuntoOk(Sistema.IdEmpresa,
                                  cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                  cdsConjunto.FieldByName('IDCONJUNTO').AsFloat) then
      begin
         MsgDlg(Bem.MessageInfo, 'Erro', mtError, [mbOk], 0);
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,0);
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Carga do Grid de Multiplas Taxas com Grupo Selecionado, caso esteja vazio
      //----------------------------------------------------------------------------------
      if cdsDet.IsEmpty then
      begin
         cdsGrupoTaxaDep.Data := GrupoContab.ListaGrupoTaxaDep(cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                                               Sistema.IdEmpresa);
         while not cdsGrupoTaxaDep.EOF do
         begin
            cdsDet.Append;
            cdsDet.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
            cdsDet.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
            cdsDet.FieldByName('IDBEMXDEP').AsInteger := cdsGrupoTaxaDep.FieldByName('IDTAXADEP').AsInteger;
            cdsDet.FieldByName('TAXADEP').AsFloat := cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat;
            cdsDet.FieldByName('DESCTAXADEP').AsString := cdsGrupoTaxaDep.FieldByName('DESCTAXADEP').AsString;
            cdsDet.Post;
            //----------------------------------------------------------------------------
            cdsGrupoTaxaDep.Next;
         end;
         //-------------------------------------------------------------------------------
         // Se o grupo não possuir as taxas de depreciação
         //-------------------------------------------------------------------------------
         if cdsDet.RecordCount <> ParamCAF.NUMTAXADEP then
         begin
            MsgDlg('Grupo Contábil selecionado não possui taxa(s) de depreciação definida(s)!'+#13+
                   'Consulte o Cadastro de Grupos Contábeis.','Erro',mtError,[mbOk],0);
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,0);
            Exit;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.cdsGrupoAfterOpen(DataSet: TDataSet);
var
   bAlteraTaxas : Boolean;

begin
   inherited;
   bAlteraTaxas := (CmeCadastro.Operacao = opInserir);
   if not cdsGrupo.IsEmpty then
   begin
      cdsGrupoTaxaDep.Data := GrupoContab.ListaGrupoTaxaDep(cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                                            Sistema.IdEmpresa);
      while not cdsDet.EOF do
      begin
         if CmeCadastro.Operacao = opAlterar then
         begin
            if cdsDet.FieldByName('TAXADEP').AsFloat <> cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat then
               bAlteraTaxas := MsgDlg('Uma ou mais taxas de depreciação cadastradas são diferentes das '+ #13 +
                                      'taxas cadastradas no Cadastro de Grupos Contábeis.'+ #13 + #13 +
                                      'Deseja substituir pelas taxas padronizadas para o grupo ?',
                                      'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes;
         end else
         begin
            bAlteraTaxas := True;
         end;
         cdsDet.Next;
         cdsGrupoTaxaDep.Next;
      end;
      if bAlteraTaxas then
      begin
         cdsDet.First;
         while not cdsDet.EOF do
         begin
            cdsGrupoTaxaDep.First;
            while (not cdsGrupoTaxaDep.EOF) and
                  (cdsGrupoTaxaDep.FieldByName('IDTAXADEP').AsInteger <> cdsDet.FieldByName('IDBEMXDEP').AsInteger) do
               cdsGrupoTaxaDep.Next;
            //----------------------------------------------------------------------------
            if not cdsGrupoTaxaDep.EOF then
            begin
               cdsDet.Edit;
               cdsDet.FieldByName('TAXADEP').AsFloat := cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat;
               cdsDet.FieldByName('DESCTAXADEP').AsString := cdsGrupoTaxaDep.FieldByName('DESCTAXADEP').AsString;
               cdsDet.Post;
            end;
            //----------------------------------------------------------------------------
            cdsDet.Next;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.bbtnSelSubContaClick(Sender: TObject);
begin
   inherited;
   MSSubConta.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSSubConta.RetornouValor then
      cdsSubConta.Data := SubConta.ListSubConta(strtofloat(MSSubConta.ValoresChave[1]),
                                                strtofloat(MSSubConta.ValoresChave[0]))
   else
      cdsSubConta.Data := SubConta.ListSubConta(Sistema.IdEmpresa,-2);
end;
//========================================================================================
procedure TfrmMTCadBemPendente.bbtnSelAtivProjetoClick(Sender: TObject);
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
procedure TfrmMTCadBemPendente.CmeDetalheConfirma(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsPlanoPatro then
   begin
      if cdsRateio.State in [dsInsert,dsEdit] then
      begin
         if dbcmbPatro.Text = '' Then
         begin
            MsgDlg('Patrocinadora não foi selecionada!','Erro',mtError,[mbOK],0);
            dbcmbPatro.SetFocus;
            exit;
         end else
         if dbcmbPlanoPrev.Text = '' then
         begin
            MsgDlg('Plano Previdenciario não foi selecionado!','Erro',mtError,[mbOK],0);
            dbcmbPlanoPrev.SetFocus;
            exit;
         end else
         if dbePercRateio.Value = 0 then
         begin
            MsgDlg('Informe o percentual de rateio (0..100)!','Erro',mtError,[mbOK],0);
            dbePercRateio.SetFocus;
            exit;
         end;
         //-------------------------------------------------------------------------------
         // Alimenta os campos descrição
         //-------------------------------------------------------------------------------
         cdsRateio.FieldByName('IDPESSOA').AsFloat       := Sistema.IdEmpresa;
         cdsRateio.FieldByName('NOMEPATRO').AsString     := dbcmbPatro.Text;
         cdsRateio.FieldByName('NOMEPLANOPREV').AsString := dbcmbPlanoPrev.Text;
      end;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
Var
   fTotPerc : Extended;

begin
   Accept := False;
   //-------------------------------------------------------------------------------------
   // Verificação dos dados fornecidos
   //-------------------------------------------------------------------------------------
   if cds.FieldByName('DESBEM').AsString = '' then
   begin
      Bem.MessageInfo := 'Descrição do bem não informada!';
      dbeDesBem.SetFocus;
      exit;
   end else
   //-------------------------------------------------------------------------------------
   if cdsClasse.FieldByName('IDCLASSEBEM').IsNull then
   begin
      Bem.MessageInfo := 'Classe não selecionada!';
      bbtnSelClasse.SetFocus;
      exit;
   end else
   //-------------------------------------------------------------------------------------
   if cmbControle.Text = '' then
   begin
      Bem.MessageInfo := 'Forma de Controle não selecionada!';
      cmbControle.SetFocus;
      exit;
   end else
   //-------------------------------------------------------------------------------------
   if cmbSituacao.Text = '' then
   begin
      Bem.MessageInfo := 'Situação Física não selecionada!';
      cmbSituacao.SetFocus;
      exit;
   end else
   //-------------------------------------------------------------------------------------
   if cdsConjunto.FieldByName('IDCONJUNTO').IsNull then
   begin
      Bem.MessageInfo := 'Conjunto não selecionado!';
      bbtnSelConjunto.SetFocus;
      exit;
   end else
   //-------------------------------------------------------------------------------------
   if cdsGrupo.FieldByName('IDGRUPO').IsNull then
   begin
      Bem.MessageInfo := 'Grupo Contábil não selecionado!';
      bbtnSelGrupo.SetFocus;
      Exit;
   end else
   //-------------------------------------------------------------------------------------
   if cdsGrupo.FieldByName('FLGSEMPLACA').AsInteger = 0 then
   begin
      if edPlaca.Text = '' then
      begin
         Bem.MessageInfo := 'Número do Tombamento Patrimonial do Bem não informado!';
         dbeDesBem.SetFocus;
         Exit;
      end;
   end else
   //-------------------------------------------------------------------------------------
   if (edPlaca.Text <> '') and (CmeCadastro.Operacao = opInserir) then
   begin
      if not Bem.PlacaUnica(Sistema.IdEmpresa,edPlaca.Text) then
      begin
         Bem.MessageInfo := 'Número do Tombamento Patrimonial do Bem deve ser exclusivo!';
         dbeDesBem.SetFocus;
         Exit;
      end;
   end else
   //-------------------------------------------------------------------------------------
   if dbeDataInclusao.Text = '' then
   begin
      Bem.MessageInfo := 'Data de Entrada do Bem no patrimonio não informada!';
      dbeDataInclusao.SetFocus;
      Exit;
   end else
   if (not ckbFlgBemIntContab.Checked) and ((dbeDataInclusao.Date - date) > 28) then
   begin
      Bem.MessageInfo := 'A Data de Entrada do Bem no patrimonio está no futuro!';
      dbeDataInclusao.SetFocus;
      Exit;
   end else
   //-------------------------------------------------------------------------------------
   if edQtde.Value <= 0 then
   begin
      Bem.MessageInfo := 'A quantidade de bens que será gerada não foi informada!';
      edQtde.SetFocus;
      Exit;
   end else
   //-------------------------------------------------------------------------------------
   if edValHistorico.Value = 0 then
   begin
      Bem.MessageInfo := 'O valor total do custo de aquisição dos bens não foi informado!';
      edValHistorico.SetFocus;
      Exit;
   end else
   //-------------------------------------------------------------------------------------
   if (dbeDtaContab.Text = '') and (ckbFlgBemIntContab.Checked) then
   begin
      Bem.MessageInfo := 'A data do registro da entrada do bem na contabilidade não foi informada!';
      dbeDtaContab.SetFocus;
      Exit;
   end else
   //-------------------------------------------------------------------------------------
   if dbeDataInicioDep.Text = '' then
   begin
      Bem.MessageInfo := 'A data de inicio da depreciação do bem não foi informada!';
      dbeDtaContab.SetFocus;
      Exit;
   end else
   //-------------------------------------------------------------------------------------
   if not cdsRateio.IsEmpty then
   begin
      fTotPerc := 0;
      cdsRateio.First;
      while not cdsRateio.EOF do
      begin
         fTotPerc := fTotPerc + cdsRateio.FieldByName('PPBPERCRATEIO').AsFloat;
         cdsRateio.Next;
      end;
      if fTotPerc <> 100 then
      begin
         Bem.MessageInfo := 'Soma dos Rateios de Custo por Plano/Patrocinadora está em ' +
                            FloatToStr(fTotPerc) + '% e deve ser 100% ';
         Exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Preenchimento dos campos processados
   //-------------------------------------------------------------------------------------
   if cds.State = dsInsert then
   begin
      cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      cds.FieldByName('IDMODULO').AsFloat := Sistema.IdModulo;
   end;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('IDCLASSEBEM').AsInteger := cdsClasse.FieldByName('IDCLASSEBEM').AsInteger;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('REGISTRO').AsString := 'I';
   if cmbControle.Text = 'Físico' then
   begin
      cds.FieldByName('CONTROLE').AsString := 'F'
   end else
   if cmbControle.Text = 'Total' then
   begin
      cds.FieldByName('CONTROLE').AsString := 'T'
   end;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('PLACA').AsFloat := strtofloat(edPlaca.Text);
   cds.FieldByName('IDFORNSERV').AsFloat := cdsFornec.FieldByName('IDPESSOA').AsFloat;
   cds.FieldByName('IDCONJUNTO').AsFloat := cdsConjunto.FieldByName('IDCONJUNTO').AsFloat;
   cds.FieldByName('IDGRUPO').AsFloat := cdsGrupo.FieldByName('IDGRUPO').AsFloat;
   cds.FieldByName('BAIXATOTAL').AsString  := 'N';
   //-------------------------------------------------------------------------------------
   if (cdsAtivProj.FieldByName('UNIDNEGOC').IsNull) or (cdsAtivProj.FieldByName('UNIDNEGOC').AsFloat = 0) then
      cds.FieldByName('UNIDNEGOC').Clear
   else
      cds.FieldByName('UNIDNEGOC').AsFloat := cdsAtivProj.FieldByName('UNIDNEGOC').AsFloat;
   //-------------------------------------------------------------------------------------
   if (cdsSubConta.FieldByName('CODSUBCONTA').IsNull) or (cdsSubConta.FieldByName('CODSUBCONTA').AsFloat = 0) then
      cds.FieldByName('CODSUBCONTA').Clear
   else
      cds.FieldByName('CODSUBCONTA').AsFloat := cdsSubConta.FieldByName('CODSUBCONTA').AsFloat;
   //-------------------------------------------------------------------------------------
   if cds.FieldbyName('DATAULTDEP').IsNull then
      cds.FieldbyName('DATAULTDEP').AsDateTime := cds.FieldByName('DATAINICIODEP').AsDateTime;
   //-------------------------------------------------------------------------------------
   cds.FieldbyName('ALTERADO').AsInteger := 1;
   Accept := True;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   bbtnSair.Click;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Transfere os dados alterados para o form mestre
   //-------------------------------------------------------------------------------------
   frmMTMovBensPendentes.cds.Edit;
   frmMTMovBensPendentes.cds.FieldByName('IDPESSOA').AsFloat         := cds.FieldByName('IDPESSOA').AsFloat         ;
   frmMTMovBensPendentes.cds.FieldByName('IDBENSPENDENTES').AsFloat  := cds.FieldByName('IDBENSPENDENTES').AsFloat  ;
   frmMTMovBensPendentes.cds.FieldByName('IDFORNSERV').AsFloat       := cds.FieldByName('IDFORNSERV').AsFloat       ;
   frmMTMovBensPendentes.cds.FieldByName('IDNOTA').AsString          := cds.FieldByName('IDNOTA').AsString          ;
   frmMTMovBensPendentes.cds.FieldByName('IDITENSRECDEV').AsFloat    := cds.FieldByName('IDITENSRECDEV').AsFloat    ;
   frmMTMovBensPendentes.cds.FieldByName('IDSITUACAO').AsFloat       := cds.FieldByName('IDSITUACAO').AsFloat    ;
   frmMTMovBensPendentes.cds.FieldByName('PLACA').AsFloat            := cds.FieldByName('PLACA').AsFloat            ;
   frmMTMovBensPendentes.cds.FieldByName('DESBEM').AsString          := cds.FieldByName('DESBEM').AsString          ;
   frmMTMovBensPendentes.cds.FieldByName('VALORG').AsFloat           := cds.FieldByName('VALORG').AsFloat           ;
   frmMTMovBensPendentes.cds.FieldByName('IDMODULO').AsFloat         := cds.FieldByName('IDMODULO').AsFloat         ;
   frmMTMovBensPendentes.cds.FieldByName('IDGRUPO').AsFloat          := cds.FieldByName('IDGRUPO').AsFloat          ;
   frmMTMovBensPendentes.cds.FieldByName('IDCLASSEBEM').AsFloat      := cds.FieldByName('IDCLASSEBEM').AsFloat      ;
   frmMTMovBensPendentes.cds.FieldByName('IDCONJUNTO').AsFloat       := cds.FieldByName('IDCONJUNTO').AsFloat       ;
   frmMTMovBensPendentes.cds.FieldByName('CONTROLE').AsString        := cds.FieldByName('CONTROLE').AsString        ;
   frmMTMovBensPendentes.cds.FieldByName('COMPLNOTA').AsString       := cds.FieldByName('COMPLNOTA').AsString       ;
   frmMTMovBensPendentes.cds.FieldByName('DTANOTA').AsDateTime       := cds.FieldByName('DTANOTA').AsDateTime       ;
   frmMTMovBensPendentes.cds.FieldByName('DTAINCLUSAO').AsDateTime   := cds.FieldByName('DTAINCLUSAO').AsDateTime   ;
   frmMTMovBensPendentes.cds.FieldByName('NUMSERIE').AsString        := cds.FieldByName('NUMSERIE').AsString        ;
   frmMTMovBensPendentes.cds.FieldByName('IDTERCEIRO').AsFloat       := cds.FieldByName('IDTERCEIRO').AsFloat       ;
   frmMTMovBensPendentes.cds.FieldByName('REGISTRO').AsString        := cds.FieldByName('REGISTRO').AsString        ;
   frmMTMovBensPendentes.cds.FieldByName('VALHISTORICO').AsFloat     := cds.FieldByName('VALHISTORICO').AsFloat     ;
   frmMTMovBensPendentes.cds.FieldByName('DATAINICIODEP').AsDateTime := cds.FieldByName('DATAINICIODEP').AsDateTime ;
   frmMTMovBensPendentes.cds.FieldByName('DATAULTDEP').AsDateTime    := cds.FieldByName('DATAULTDEP').AsDateTime    ;
   frmMTMovBensPendentes.cds.FieldByName('IDOPCIONAL').AsString      := cds.FieldByName('IDOPCIONAL').AsString      ;
   frmMTMovBensPendentes.cds.FieldByName('PROCESSOAQUIS').AsString   := cds.FieldByName('PROCESSOAQUIS').AsString   ;
   frmMTMovBensPendentes.cds.FieldByName('EMPENHOAQUIS').AsString    := cds.FieldByName('EMPENHOAQUIS').AsString    ;
   frmMTMovBensPendentes.cds.FieldByName('PUBAUTOR').AsString        := cds.FieldByName('PUBAUTOR').AsString        ;
   frmMTMovBensPendentes.cds.FieldByName('PUBEDITORA').AsString      := cds.FieldByName('PUBEDITORA').AsString      ;
   frmMTMovBensPendentes.cds.FieldByName('PUBANO').AsFloat           := cds.FieldByName('PUBANO').AsFloat           ;
   //-------------------------------------------------------------------------------------
   if cds.FieldByName('CODSUBCONTA').IsNull then
      frmMTMovBensPendentes.cds.FieldByName('CODSUBCONTA').Clear
   else
      frmMTMovBensPendentes.cds.FieldByName('CODSUBCONTA').AsFloat := cds.FieldByName('CODSUBCONTA').AsFloat;
   if cds.FieldByName('UNIDNEGOC').IsNull then
      frmMTMovBensPendentes.cds.FieldByName('UNIDNEGOC').Clear
   else
      frmMTMovBensPendentes.cds.FieldByName('UNIDNEGOC').AsFloat := cds.FieldByName('UNIDNEGOC').AsFloat;
   //-------------------------------------------------------------------------------------
   frmMTMovBensPendentes.cds.FieldbyName('ALTERADO').AsInteger := 1;
   frmMTMovBensPendentes.cds.Post;
   //-------------------------------------------------------------------------------------
   cdsDet.First;
   while not cdsDet.EOF do
   begin
      if not frmMTMovBensPendentes.cdsDet.Locate('IDBENSPENDENTES;IDPESSOA;MOECODIGO;IDBEMXDEP',
                                                 VarArrayOf([cdsDet.FieldByName('IDBENSPENDENTES').AsFloat,
                                                             cdsDet.FieldByName('IDPESSOA').AsFloat,
                                                             cdsDet.FieldByName('MOECODIGO').AsFloat,
                                                             cdsDet.FieldByName('IDBEMXDEP').AsFloat]),[]) then
         MoveFields(cdsDet,frmMTMovBensPendentes.cdsDet,opInserir,False)
      else
         MoveFields(cdsDet,frmMTMovBensPendentes.cdsDet,opAlterar,False);
      //----------------------------------------------------------------------------------
      cdsDet.Next;
   end;
   //-------------------------------------------------------------------------------------
   cdsRateio.First;
   while not cdsRateio.EOF do
   begin
      if not frmMTMovBensPendentes.cdsRateio.Locate('IDBENSPENDENTES;IDPESSOA;IDPATRO;IDPLANOPREV',
                                                     VarArrayOf([cdsRateio.FieldByName('IDBENSPENDENTES').AsFloat,
                                                                 cdsRateio.FieldByName('IDPESSOA').AsFloat,
                                                                 cdsRateio.FieldByName('IDPATRO').AsFloat,
                                                                 cdsRateio.FieldByName('IDPLANOPREV').AsFloat]),[]) then
         MoveFields(cdsRateio,frmMTMovBensPendentes.cdsRateio,opInserir,False)
      else
         MoveFields(cdsRateio,frmMTMovBensPendentes.cdsRateio,opAlterar,False);
      //----------------------------------------------------------------------------------
      cdsRateio.Next;
   end;
   //-------------------------------------------------------------------------------------
   Accept := True;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   tbsDocumento.Enabled := bbtnConfirmar.Enabled;
   tbsConjunto.Enabled  := bbtnConfirmar.Enabled;
   tbsContabil.Enabled  := bbtnConfirmar.Enabled;
   if not bbtnConfirmar.Enabled then
      cmbControle.Enabled := True;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   bbtnSair.Click;
end;
//========================================================================================
procedure TfrmMTCadBemPendente.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   cmbControle.Enabled        := False;
   dbeDataInclusao.Enabled    := False;
   dbeNota.Enabled            := False;
   dbeComplNota.Enabled       := False;
   edDataNota.Enabled         := False;
   bbtnSelFornec.Enabled      := False;
   edQtde.Enabled             := False;
   edValHistorico.Enabled     := False;
   bbtnSelGrupo.Enabled       := False;
   bbtnSelAtivProjeto.Enabled := True;
   bbtnSelSubConta.Enabled    := True;
   pnlIntegraContab.Enabled   := False;
   dbeDtaContab.Enabled       := False;
   //-------------------------------------------------------------------------------------
   Application.ProcessMessages;
end;

procedure TfrmMTCadBemPendente.bbtnGeraPlacaClick(Sender: TObject);
var
  nPlaca : Extended;

begin
   inherited;
   nPlaca := AlmoxCAF.GeraPlacaTomb(Sistema.IdEmpresa,
                                    cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                    cdsClasse.FieldByName('IDCLASSEBEM').AsFloat);
   if nPlaca <= 0 then
      MsgDlg('Erro na Geração do Número da Placa!' + #13 +
             'Causa : ' + AlmoxCAF.MessageInfo,'Erro',mtError,[mbOk],0)
   else
      edPlaca.Text := floattostr(nPlaca);
end;

end.

