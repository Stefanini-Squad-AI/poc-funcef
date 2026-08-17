unit fMTCadBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdblook, wwdbedit,
  TREdit, wwdbdatetimepicker, CMDateTimePicker, fcLabel, DBCtrls, uCMTypes,
  uCtrlDomBem, uCtrlClassedeBem, uCtrlConjunto, uCtrlSituacao, uCtrlTerceiro,
  uCtrlGrupoContab, uCtrlParamCAF, uCtrlSubConta, uCtrlUnidNegocio,
  DBTables, Wwquery, uCmSqlParams;

type
  TfrmMTCadBem = class(TFrmCadastroMestreDetMT)
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
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure bbtnSelClasseClick(Sender: TObject);
    procedure bbtnSelFornecClick(Sender: TObject);
    procedure bbtnSelTerceiroClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure cdsGrupoAfterOpen(DataSet: TDataSet);
    procedure bbtnSelSubContaClick(Sender: TObject);
    procedure bbtnSelAtivProjetoClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
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
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure ckbFlgBemIntContabClick(Sender: TObject);
  private
    { Private declarations }
    Bem         : TCtrlDomBem;  // Classe de Dominio
    //------------------------------------------------------------------------------------
    ParamCAF    : TCtrlParamCAF;
    ClassedeBem : TCtrlClassedeBem;
    Conjunto    : TCtrlConjunto;
    Situacao    : TCtrlSituacao;
    Terceiro    : TCtrlTerceiro;
    GrupoContab : TCtrlGrupoContab;
    AtivProjeto : TCtrlUnidNegocio;
    SubConta    : TCtrlSubConta;
    //------------------------------------------------------------------------------------
    bFlgAltRestrita,
    bFlgAltCtrlFisico : Boolean;
    //------------------------------------------------------------------------------------
    procedure SelBem(fIdPessoa, fIdBem : Extended);

  public
    { Public declarations }
  end;

var
  frmMTCadBem: TfrmMTCadBem;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uIntegraBack, fMTCadConjunto;

procedure TfrmMTCadBem.FormCreate(Sender: TObject);
begin
   inherited;
   Bem := TCtrlDomBem.Create;
   Bem.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                  Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   Bem.cds := cds;
   Bem.cdsTaxasDep := cdsDet;
   Bem.cdsPlanoPatroxBem := cdsRateio;
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   ClassedeBem := TCtrlClassedeBem.Create;
   ClassedeBem.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   Situacao := TCtrlSituacao.Create;
   Situacao.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsSituacao.Data := Situacao.ListaSituacao;
   //-------------------------------------------------------------------------------------
   Terceiro := TCtrlTerceiro.Create;
   Terceiro.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsParamCAF.Data  := ParamCAF.ListaParamCAF(Sistema.IdEmpresa);
   cdsPatro.Data     := ParamCAF.ListaPatro;
   cdsPlanoPrev.Data := ParamCAF.ListaPlanoPrev;
   //-------------------------------------------------------------------------------------
   AtivProjeto := TCtrlUnidNegocio.Create;
   AtivProjeto.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   SubConta := TCtrlSubConta.Create;
   SubConta.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('BEM.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupos.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   pgctrlDetalhe.ActivePage := tbsDocumento;
   SelBem(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TfrmMTCadBem.FormActivate(Sender: TObject);
begin
   inherited;
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
end;
//========================================================================================
procedure TfrmMTCadBem.SelBem(fIdPessoa, fIdBem : Extended);
begin
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   cds.Data := Bem.ListaBem(fIdPessoa,fIdBem);
   if not cds.IsEmpty then
   begin
      if cds.FieldByName('CONTROLE').AsString = 'T' then
         cmbControle.Text := 'Total'
      else
         cmbControle.Text := 'Físico';
      //----------------------------------------------------------------------------------
      edPlaca.Text     := cds.FieldByName('PLACA').AsString;
      edQtde.Value     := 1;
      //----------------------------------------------------------------------------------
      cdsClasse.Data       := ClassedeBem.ListaClassedeBem(cds.FieldByName('IDCLASSEBEM').AsFloat);
      cdsConjunto.Data     := Conjunto.ListaConjunto(cds.FieldByName('IDPESSOA').AsFloat, cds.FieldByName('IDCONJUNTO').AsFloat);
      cdsRateioCCusto.Data := Conjunto.ListaRateioCustos(cds.FieldByName('IDPESSOA').AsFloat, cds.FieldByName('IDCONJUNTO').AsFloat);
      cdsFornec.Data       := Bem.ListaFornecedor(cds.FieldByName('IDFORNSERV').AsFloat);
      cdsGrupo.Data        := GrupoContab.ListaGrupoContab(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDGRUPO').AsFloat);
      cdsAtivProj.Data     := AtivProjeto.ListaUnidNegocio(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('UNIDNEGOC').AsFloat);
      cdsSubConta.Data     := SubConta.ListSubConta(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('CODSUBCONTA').AsFloat);
      TStringField(cds.FieldByName('IDOPCIONAL')).EditMask := cdsClasse.FieldByName('MASCARAIDOPCIONAL').AsString + ';0; ';
      //----------------------------------------------------------------------------------
      cdsBemxMoeda.Data    := Bem.ListaBemxMoeda(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat,
                                                 cdsParamCAF.FieldByName('MOEDAOFICIAL').AsFloat);
      cdsDet.Data          := Bem.ListaBemxDep(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat,
                                               cdsParamCAF.FieldByName('MOEDAOFICIAL').AsFloat);
      cdsRateio.Data       := Bem.ListaPlanoPatroxBem(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat);
      //----------------------------------------------------------------------------------
      edValHistorico.Value := cdsBemxMoeda.FieldByName('VALORG').AsFloat;
      if cdsConjunto.FieldByName('ALUGADO').AsInteger = 1 then
      begin
         bbtnSelTerceiro.Enabled := True;
         cdsTerceiro.Data := Terceiro.ListaTerceiro(cds.FieldByName('IDTERCEIRO').AsFloat);
      end else
      begin
         bbtnSelTerceiro.Enabled := False;
         cdsTerceiro.Data := Terceiro.ListaTerceiro(0);
      end;
   end else
   begin
      cmbControle.Text     := '';
      edPlaca.Text         := '';
      edQtde.Value         := 1;
      edValHistorico.Value := 0;
      ckbFlgBemIntContab.Checked := (ParamCAF.INTEGRACONTAB = 'S') ;
      //----------------------------------------------------------------------------------
      cdsClasse.Data       := ClassedeBem.ListaClassedeBem(0);
      cdsConjunto.Data     := Conjunto.ListaConjunto(Sistema.IdEmpresa, 0);
      cdsRateioCCusto.Data := Conjunto.ListaRateioCustos(Sistema.IdEmpresa, 0);
      cdsFornec.Data       := Bem.ListaFornecedor(0);
      cdsGrupo.Data        := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,0);
      cdsAtivProj.Data     := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa,-2);
      cdsSubConta.Data     := SubConta.ListSubConta(Sistema.IdEmpresa,-1);
      TStringField(cds.FieldByName('IDOPCIONAL')).EditMask := '';
      //----------------------------------------------------------------------------------
      cdsBemxMoeda.Data    := Bem.ListaBemxMoeda(Sistema.IdEmpresa,0);
      cdsDet.Data          := Bem.ListaBemxDep(Sistema.IdEmpresa,0);
      cdsRateio.Data       := Bem.ListaPlanoPatroxBem(Sistema.IdEmpresa,0);
      //----------------------------------------------------------------------------------
      bbtnSelTerceiro.Enabled := False;
      cdsTerceiro.Data := Terceiro.ListaTerceiro(0);
   end;
end;
//========================================================================================
procedure TfrmMTCadBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ParamCAF.Free;
   ClassedeBem.Free;
   Situacao.Free;
   Terceiro.Free;
   GrupoContab.Free;
   AtivProjeto.Free;
   SubConta.Free;
   Bem.Free;
end;
//========================================================================================
procedure TfrmMTCadBem.bbtnLivrosClick(Sender: TObject);
begin
   inherited;
   pnlPlaca.SendToBack;
end;
//========================================================================================
procedure TfrmMTCadBem.bbtnRetornaPlacaClick(Sender: TObject);
begin
   inherited;
   pnlLivros.SendToBack;
end;
//========================================================================================
procedure TfrmMTCadBem.dbeDataInclusaoExit(Sender: TObject);
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
procedure TfrmMTCadBem.ckbFlgBemIntContabClick(Sender: TObject);
begin
   inherited;
   if ckbFlgBemIntContab.Checked and (dbeDtaContab.Text = '') and (dbeDataInclusao.Text <> '') then
      cds.FieldByName('DTACONTAB').AsDateTime := cds.FieldByName('DTAINCLUSAO').AsDateTime;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(Bem.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelBem(strtofloat(MontaSelect.ValoresChave[0]),strtofloat(MontaSelect.ValoresChave[1]));
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroInsert(Sender: TObject);
begin
   SelBem(Sistema.IdEmpresa,0);
   inherited;
   cds.FieldByName('FLGBEMINTCONTAB').AsInteger := 1;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroEdit(Sender: TObject);
begin
   if cds.FieldByName('BAIXATOTAL').AsString = 'S' then
   begin
      MsgDlg('Bem totalmente baixado não pode ser alterado!','Erro',mtError,[mbOk],0);
      bbtnCancelar.Click;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   bFlgAltRestrita   := False;
   bFlgAltCtrlFisico := (cds.FieldByName('CONTROLE').AsString <> 'T') or
                        (cds.FieldByName('CONTROLE').IsNull);
   //-------------------------------------------------------------------------------------
   if (Bem.BemcomMovimento(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat) or
      (cds.FieldByName('FLGDEPREC').AsInteger = 1) or
      ((cds.FieldByName('TAXADEP').AsFloat = 0) and ((date - cds.FieldByName('DATAINICIODEP').AsDateTime) > 60))) then
   begin
      MsgDlg('Bem já movimentado ou totalmente depreciado. Alteração Restrita.',
             'Atenção',mtInformation,[mbOk],0);
      bFlgAltRestrita := True;
   end else
   begin
      if Bem.BemSelecionado(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat) then
      begin
         MsgDlg(Bem.MessageInfo + ' Alteração Restrita.', 'Erro',mtError,[mbOk],0);
         bFlgAltRestrita := True;
      end;
   end;
   //-------------------------------------------------------------------------------------
   cmbControle.Enabled := False;
   if bFlgAltRestrita then
   begin
      edPlaca.Enabled         := False;
      bbtnGeraPlaca.Enabled   := False;
      //----------------------------------------------------------------------------------
      dbeDataInclusao.Enabled := False;
      edQtde.Enabled          := False;
      edValHistorico.Enabled  := False;
      //----------------------------------------------------------------------------------
      tbsConjunto.Enabled     := False;
      tbsContabil.Enabled     := False;
      tbsDet.Enabled          := False;
      tbsPlanoPatro.Enabled   := False;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroDelete(Sender: TObject);
begin
   if not Bem.BemcomMovimento(cds.FieldByName('IDPESSOA').AsFloat,
                              cds.FieldByName('IDCONJUNTO').AsFloat) then
   begin
      inherited;
   end else
      MsgDlg(Bem.MessageInfo,'Erro',mtError,[mbOk],0);
end;
//========================================================================================
procedure TfrmMTCadBem.tbcDetalheChange(Sender: TObject);
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
procedure TfrmMTCadBem.bbtnSelClasseClick(Sender: TObject);
begin
   inherited;
   MSClasse.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSClasse.RetornouValor then
   begin
      cdsClasse.Data := ClassedeBem.ListaClassedeBem(strtofloat(MSClasse.ValoresChave[0]));
      if not cdsClasse.FieldByName('MASCARAIDOPCIONAL').IsNull then
         TStringField(cds.FieldByName('IDOPCIONAL')).EditMask := cdsClasse.FieldByName('MASCARAOPCIONAL').AsString + ';0; '
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
procedure TfrmMTCadBem.bbtnSelFornecClick(Sender: TObject);
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
procedure TfrmMTCadBem.bbtnSelTerceiroClick(Sender: TObject);
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
procedure TfrmMTCadBem.bbtnGeraConjuntoClick(Sender: TObject);
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
procedure TfrmMTCadBem.bbtnSelConjuntoClick(Sender: TObject);
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
procedure TfrmMTCadBem.bbtnSelGrupoClick(Sender: TObject);
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
      if not Bem.GrupoxClasseOk(cdsGrupo.FieldByName('IDGRUPO').AsFloat,
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
            cdsDet.FieldByName('IDPESSOA').AsFloat     := Sistema.IdEmpresa;
            cdsDet.FieldByName('MOECODIGO').AsInteger  := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
            cdsDet.FieldByName('IDBEMXDEP').AsInteger  := cdsGrupoTaxaDep.FieldByName('IDTAXADEP').AsInteger;
            cdsDet.FieldByName('TAXADEP').AsFloat      := cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat;
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
            exit;
         end;
         //-------------------------------------------------------------------------------
      end;
   end;
end;
//========================================================================================
procedure TfrmMTCadBem.cdsGrupoAfterOpen(DataSet: TDataSet);
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
               cdsDet.FieldByName('TAXADEP').AsFloat      := cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat;
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
procedure TfrmMTCadBem.bbtnSelSubContaClick(Sender: TObject);
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
procedure TfrmMTCadBem.bbtnSelAtivProjetoClick(Sender: TObject);
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
procedure TfrmMTCadBem.CmeDetalheConfirma(Sender: TObject);
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
procedure TfrmMTCadBem.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
Var
   fTotPerc : Extended;

begin
   Accept := False;
   //-------------------------------------------------------------------------------------
   // Verificação dos dados fornecidos
   //-------------------------------------------------------------------------------------
   if cdsClasse.FieldByName('IDCLASSEBEM').IsNull then
   begin
      Bem.MessageInfo := 'Classe não selecionada!';
      bbtnSelClasse.SetFocus;
      Exit;
   end else
   //-------------------------------------------------------------------------------------
   if cmbControle.Text = '' then
   begin
      Bem.MessageInfo := 'Forma de Controle não selecionada!';
      cmbControle.SetFocus;
      Exit;
   end else
   //-------------------------------------------------------------------------------------
   if cmbSituacao.Text = '' then
   begin
      Bem.MessageInfo := 'Situação Física não selecionada!';
      cmbSituacao.SetFocus;
      Exit;
   end else
   //-------------------------------------------------------------------------------------
   if dbeDesBem.Text = '' then
   begin
      Bem.MessageInfo := 'Descrição do bem não informada!';
      dbeDesBem.SetFocus;
      Exit;
   end else
   //-------------------------------------------------------------------------------------
   if cdsConjunto.FieldByName('IDCONJUNTO').IsNull then
   begin
      Bem.MessageInfo := 'Conjunto não selecionado!';
      bbtnSelConjunto.SetFocus;
      Exit;
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
   cds.FieldByName('PLACA').AsFloat        := strtofloat(edPlaca.Text);
   cds.FieldByName('IDFORNSERV').AsFloat   := cdsFornec.FieldByName('IDPESSOA').AsFloat;
   cds.FieldByName('IDCONJUNTO').AsFloat   := cdsConjunto.FieldByName('IDCONJUNTO').AsFloat;
   cds.FieldByName('IDGRUPO').AsFloat      := cdsGrupo.FieldByName('IDGRUPO').AsFloat;
   if not cdsAtivProj.FieldByName('UNIDNEGOC').IsNull then
      cds.FieldByName('UNIDNEGOC').AsFloat := cdsAtivProj.FieldByName('UNIDNEGOC').AsFloat;
   if not cdsSubConta.FieldByName('CODSUBCONTA').IsNull then
      cds.FieldByName('CODSUBCONTA').AsFloat := cdsSubConta.FieldByName('CODSUBCONTA').AsFloat;
   if cds.FieldbyName('DATAULTDEP').IsNull then
      cds.FieldbyName('DATAULTDEP').AsDateTime := cds.FieldByName('DATAINICIODEP').AsDateTime;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('BAIXATOTAL').AsString  := 'N';
   //-------------------------------------------------------------------------------------
   Accept := True;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;

begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelBem(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Bem.ExecutaCadastroBem('I', edValHistorico.Value, strtoint(edQtde.Text));
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Alteração completa em bem com controle Físico
   //-------------------------------------------------------------------------------------
   if bFlgAltCtrlFisico then
   begin
      Accept := Bem.ExecutaCadastroBem('AC', edValHistorico.Value, strtoint(edQtde.Text));
   end else
   //-------------------------------------------------------------------------------------
   // Alteracao completa em bem com controle total
   //-------------------------------------------------------------------------------------
   if not bFlgAltRestrita then
   begin
      Accept := Bem.ExecutaCadastroBem('AC', edValHistorico.Value, strtoint(edQtde.Text));
   end else
   //-------------------------------------------------------------------------------------
   // Alteracao restrita em bem com controle total
   //-------------------------------------------------------------------------------------
   begin
      Accept := Bem.ExecutaCadastroBem('AR', edValHistorico.Value, strtoint(edQtde.Text));
   end;
end;
 //=======================================================================================
procedure TfrmMTCadBem.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   cds.CancelUpdates;
   Accept := Bem.ExecutaCadastroBem('R', edValHistorico.Value, strtoint(edQtde.Text));
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   tbsDocumento.Enabled := bbtnConfirmar.Enabled;
   tbsConjunto.Enabled  := bbtnConfirmar.Enabled;
   tbsContabil.Enabled  := bbtnConfirmar.Enabled;
   if not bbtnConfirmar.Enabled then
      cmbControle.Enabled := True;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   //SelBem(Sistema.IdEmpresa,0);
end;

end.

