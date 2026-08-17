{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......... :
N. Sol..........: 134548
Data............: 03/05/2023
Responsável.....: Leandro Pocebon
Descrição.......: Tratar caraceres especiais na descrição do bem
--------------------------------------------------------------------------------
Rotina...........: (dfm)
Nº SIG...........: 125120     
Data da Alteração: 09/11/2022
Responsável......: Leandro Pocebon
Descrição........: Inclusão da aba anexos.
--------------------------------------------------------------------------------
Rotina...........:
Nº SIG...........: 97586
Data da Alteração: 13/02/2020
Responsável......: Ewerton Beltramini
Descrição........: Correção no filtro de pesquisas do cadastro de Bens.
--------------------------------------------------------------------------------
Rotina...........: _
Nº SIG...........: 87657/91294
Data da Alteração: 18/12/2019
Responsável......: Ewerton Beltramini
Descrição........: Alterações evolutivas para suportar novo padrão de
                   etiquetas (RFID);
--------------------------------------------------------------------------------
Rotina...........: _
Nº SOL...........: 198886.18334
Data da Alteração: 10/01/2017
Responsável......: Darivaldo Alencar
Descrição........: Inclusão na tela Cadastro de Classe de Bens a opção para
                   inclusão da taxa de depreciação.
--------------------------------------------------------------------------------
Rotina...........: _
Nº SOL...........: 204458
Nº KINTANA.......: 1981316
Data da Alteração: 19/04/2013
Responsável......: Thiago Melo
Descrição........: Ajustar as funcionalidades de alterar e excluir qualquer bem
                   na tela de cadastro de bens no ativo fixo - CAF.
--------------------------------------------------------------------------------
Rotina ......: MsAtivProj
SOL..........: 163982
Kintana......: 1404974
Data.........: 26/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi adicionado um filtro para que seja retornardo apenas
               as atividades ativas.
               O filtro "UNIDNEGOCIO.UNIDNEGOC > 0" foi retirado para retornar
               também a atividade Padrão.
--------------------------------------------------------------------------------
Rotina...........: tbcDetalheChange
Nº SOL...........: 157853
Nº KINTANA.......: 1274052
Data da Alteração: 20/05/2011
Responsável......: Brunno Mattos
Descrição........: Permitir que usuário altere a taxa de depreciação na aba "Depreciação".
--------------------------------------------------------------------------------
Rotina...........:  PreencheTaxaDep  ,tbcDetalheChange
Nº SOL...........: 142551
Nº KINTANA.......: 911676
Data da Alteração: 06/12/2010
Responsável......: Helen V. Bianchi
Descrição........: Adicionado Aba Hist. Depreciação e Alterado o Grid DbgrdDet
--------------------------------------------------------------------------------
Rotina......: SelBem, CmeCadastroEdit, CmeCadastroApplyInsert,
              CmeCadastroApplyEdit, CmeCadastroApplyDelete, CmeCadastroCancel
Nº SOL......: 136972
Nº KINTANA..: 823252
Data........: 21/07/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do campo "Valor Residual"
--------------------------------------------------------------------------------
Rotina......: TfrmMTCadBem.CmeCadastroFind
Nº SOL......: 132640
Nº KINTANA..: 766369
Data........: 28/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do campo "Nº de Tombamento Anterior" para consulta
              e visualização.
--------------------------------------------------------------------------------
Pendência   : 24911
Responsável : Daniel Simões
Data        : 27/03/2007
Descrição   : Implementação de exibição da informação de Status do Bem...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fMTCadBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc,IvDictio, IvMulti, DBTables,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdblook, wwdbedit,
  TREdit, wwdbdatetimepicker, CMDateTimePicker, fcLabel, DBCtrls, uCmSqlParams,
  uCMTypes, uCtrlPadroes, uCtrlAlmoxCAF, uCtrlImagemBem, 
  uCtrlDomBem, uCtrlClassedeBem, uCtrlConjunto, uCtrlSituacao, uCtrlTerceiro,
  uCtrlGrupoContab, uCtrlParamCAF, uCtrlSubConta, uCtrlUnidNegocio,
  CMProcuraSubTipo, IvEMulti,uCtrlClasseTaxaDEp, uCmFileUtils, shellApi;

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
    Label19: TLabel;
    edValHistorico: TRealEdit;
    Label44: TLabel;
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
    dsPlanoPrev: TwwDataSource;
    dsPatro: TwwDataSource;
    dbePubAno: TDBRealEdit;
    cdsBemxMoeda: TCMClientDataSet;
    ckbFlgBemIntContab: TDBCheckBox;
    CMProcuraForCli: TCMProcuraForCli;
    CMProcuraTerceiro: TCMProcuraSubTipo;
    dsImagem: TwwDataSource;
    cdsImagem: TCMClientDataSet;
    tbsImagem: TTabSheet;
    dbiImagemBem: TDBImage;
    cdsCAFPaises: TCMClientDataSet;
    sqlCAFPaises: TCMSqlParams;
    lblStatus: TfcLabel;
    cdsHstPercSegregaBem: TCMClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlDetPlanoPatro: TPanel;
    Label2: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label20: TLabel;
    dbcmbPlanoPrev: TwwDBLookupCombo;
    dbcmbPatro: TwwDBLookupCombo;
    dbePercRateio: TDBRealEdit;
    dbgRateio: TwwDBGrid;
    TabSheet2: TTabSheet;
    ncia: TwwDBGrid;
    dsPlanoPatroxVigenciaBem: TwwDataSource;
    cdsPlanoPatroxVigenciaBem: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    Label21: TLabel;
    edPlacaAnt: TMaskEdit;
    Label22: TLabel;
    edValResidual: TRealEdit;
    cdsHistDep: TCMClientDataSet;
    dsHistDep: TwwDataSource;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    dbgrdDetNew: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    tbsDepreciacao: TTabSheet;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Panel1: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    DBRealEdit1: TDBRealEdit;
    dbgDepreciacao: TwwDBGrid;
    wwDBGrid5: TwwDBGrid;
    rgDepre: TRadioGroup;
    edVidaUtil: TDBRealEdit;
    CdsClasseTaxaDep: TCMClientDataSet;
    qryConsultaHistorico: TQuery;
    Label25: TLabel;
    edPlacaAntigo: TMaskEdit;
    tbsAnexos: TTabSheet;
    dsAnexos: TwwDataSource;
    cdsAnexos: TCMClientDataSet;
    Panel2: TPanel;
    Label26: TLabel;
    bbtnAnexar: TBitBtn;
    dbedNomeArquivo: TwwDBEdit;
    SaveDlg: TSaveDialog;
    OpenDlg: TOpenDialog;
    tbAnexo: TToolbar97;
    btnVisual: TToolbarButton97;
    btnSalva: TToolbarButton97;
    dbgAnexos: TwwDBGrid;
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
    procedure CMProcuraForCliExit(Sender: TObject);
    procedure CMProcuraTerceiroExit(Sender: TObject);
    procedure bbtnGeraPlacaClick(Sender: TObject);
    procedure dbiImagemBemClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure rgDepreClick(Sender: TObject);
    procedure edVidaUtilExit(Sender: TObject);
    procedure DBRealEdit1Exit(Sender: TObject);
    procedure bbtnAnexarClick(Sender: TObject);
    procedure btnVisualClick(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure dbgAnexosDblClick(Sender: TObject);
    procedure cdsAnexosBeforeDelete(DataSet: TDataSet);
    procedure CdsBeforePost(DataSet: TDataSet);

  protected
    Bem : TCtrlDomBem;  // Classe de Dominio

  private
    { Private declarations }
    ClasseTaxaDep: TCtrlClasseTaxaDep;//Darivaldo Alencar SOL 198886.18334
    ParamCAF    : TCtrlParamCAF;
    ClassedeBem : TCtrlClassedeBem;
    Conjunto    : TCtrlConjunto;
    Situacao    : TCtrlSituacao;
    Terceiro    : TCtrlTerceiro;
    GrupoContab : TCtrlGrupoContab;
    AtivProjeto : TCtrlUnidNegocio;
    SubConta    : TCtrlSubConta;
    AlmoxCAF    : TCtrlAlmoxCAF;
    //------------------------------------------------------------------------------------
    bOperando : Boolean;
    fIdBemSel : Extended;
    bFlgAltRestrita,
    bFlgAltCtrlFisico : Boolean;
    bBemxImovel: Boolean;
    //------------------------------------------------------------------------------------
    sPlacaAntSel: String; // Alterado por FHBS - SOL: 132640 KTN: 766369
    CtrlImagemBem : TCtrlImagemBem;
    bdeletou : Boolean;
    procedure SelBem(fIdPessoa, fIdBem : Extended);
    procedure PreencheTaxaDep;
    function CMTranslate(sIgor : String) : String;
    procedure TataGrids; //Darivaldo Alencar SOL 198886.18334
  public
    { Public declarations }
  end;

var
  frmMTCadBem: TfrmMTCadBem;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, fMTCadConjunto, fImagemDoc;

procedure TfrmMTCadBem.FormCreate(Sender: TObject);
begin
   inherited;
   bdeletou := false;    //Leandro Pocebon - SIG 125120 - Cadastro anexos

   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   Bem.cds := cds;
   Bem.cdsTaxasDep := cdsDet;
   Bem.cdsPlanoPatroxBem := cdsRateio;
   Bem.cdsImagem := cdsImagem;
   //Cássio - SOL Nº107352 KINTANA Nº 482395
   Bem.cdsPlanoPatroxVigenciaBem := cdsPlanoPatroxVigenciaBem;
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
   cdsParamCAF.Data := ParamCAF.ListaParamCAF(Sistema.IdEmpresa);
   cdsPatro.Data := ParamCAF.ListaPatro;
   cdsPlanoPrev.Data := ParamCAF.ListaPlanoPrev;
   bbtnGeraPlaca.Enabled := ParamCAF.EDITACODBEM = 1;
   edPlaca.Enabled := ParamCAF.EDITACODBEM = 0;
   //-------------------------------------------------------------------------------------
   AtivProjeto := TCtrlUnidNegocio.Create;
   AtivProjeto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   //Darivaldo Alencar SOL 198886.18334 -inicio
   ClasseTaxaDep:=  TCtrlClasseTaxaDep.create;
   ClasseTaxaDep.initializeAs(padroes);
  //Darivaldo Alencar SOL 198886.18334 -fim
   //-------------------------------------------------------------------------------------
   SubConta := TCtrlSubConta.Create;
   SubConta.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   sqlCAFPaises.Prepare;
   sqlCAFPaises.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   sqlCAFPaises.Open;
   if cdsCAFPaises.IsEmpty then
   begin
      MsgDlg('Os Países com os quais o CAF irá processar as taxas de depreciação ' + #13 +
             'dos Grupos Contábeis dos bens não foram cadastrados!', 'Erro', mtError, [mbOK], 0);
      cdsCAFPaises.Close;
      bbtnSair.Click;
   end;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('BEM.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   MontaSelect.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MontaSelect.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.INATIVO = 0');
   MSGrupos.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupos.Filtro.Add('GRUPO.INATIVO = 0');
   MSSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   cmbControle.Items.Strings[0] := CMTranslate('Total');
   cmbControle.Items.Strings[1] := CMTranslate('Físico');
   //-------------------------------------------------------------------------------------
   dbiImagemBem.Hint := CMTranslate('Clique para Associar Foto');

   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Inicio
   CtrlImagemBem:=TCtrlImagemBem.Create;
   CtrlImagemBem.InitializeAs(Padroes);;
   CtrlImagemBem.CdsAnexos := cdsAnexos;

   CdsAnexos.Data := CtrlImagemBem.ListaAnexos(-1);
   tbAnexo.enabled := not cdsAnexos.IsEmpty;
   btnVisual.enabled := tbAnexo.enabled;
   btnsalva.enabled := tbAnexo.enabled;
   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Fim

   pgctrlDetalhe.ActivePage := tbsDocumento;
//Ricardo Cristiano - SOL : 1465767 Kintana : 672023 - Alteração para melhorar performance na entrada da tela
//   SelBem(Sistema.IdEmpresa,0);
   bOperando := False;
end;
//========================================================================================
procedure TfrmMTCadBem.FormActivate(Sender: TObject);
begin
   inherited;
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   if not Conjunto.ValidarCentroCusto(Sistema.IdEmpresa) then
      MsgDlg(Conjunto.MessageInfo, 'Atenção', mtInformation, [mbOK], 0);
end;
//========================================================================================
procedure TfrmMTCadBem.SelBem(fIdPessoa, fIdBem : Extended);
begin
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   bdeletou := false;
   cds.Data := Bem.ListaBem(fIdPessoa,fIdBem);

   // Alterado por FHBS - SOL: 132640 KTN: 766369
   if fIdBem <= 0 then
     sPlacaAntSel := '';
   edPlacaAnt.Text := sPlacaAntSel;
   // Fim - Alterado por FHBS

   edPlacaAntigo.Text :=  cds.FieldByName('PATRIMONIO').AsString;

   //Verificando as movimentações de troca de placas...
   qryConsultaHistorico.Close;                                                               //Ewerton Beltramini SIG 87657
   qryConsultaHistorico.SQL.Clear;                                                           //Ewerton Beltramini SIG 87657
   qryConsultaHistorico.SQL.Add(' SELECT COUNT(*) AS QTDTROCAPLACAHISTORICO   ');            //Ewerton Beltramini SIG 87657
   qryConsultaHistorico.SQL.Add('    FROM HISTORICOMOVIMENTACAO               ');            //Ewerton Beltramini SIG 87657
   qryConsultaHistorico.SQL.Add('   WHERE IDTIPOMOVIMENTACAO = 4              ');            //Ewerton Beltramini SIG 87657
   qryConsultaHistorico.SQL.Add('     AND IDBEM = ' + FormatFloat('0', fIdBem) );             //Ewerton Beltramini SIG 87657
   qryConsultaHistorico.SQL.Add('     AND IDPESSOA = ' + FormatFloat('0', fIdPessoa));       //Ewerton Beltramini SIG 87657
   qryConsultaHistorico.SQL.Add('     AND DATAMOVIMENTACAO >= TO_DATE(' + QuotedStr('25/10/2019') + ',' + QuotedStr('DD/MM/YYYY') + ')');  //Ewerton Beltramini SIG 87657
   qryConsultaHistorico.Open;                                                                //Ewerton Beltramini SIG 87657

   Label21.Caption := 'Nº Patrimônio Anterior';                                              //Ewerton Beltramini SIG 87657
   Application.ProcessMessages;                                                              //Ewerton Beltramini SIG 87657

   if (fIdBem > 0) and (sPlacaAntSel <> '') then                                             //Ewerton Beltramini SIG 87657
   begin                                                                                     //Ewerton Beltramini SIG 87657                                                                                            //Ewerton Beltramini SIG 87657
     if (cds.FieldByName('DTAINCLUSAO').AsDateTime >= StrToDate('25/10/2019')) or            //Ewerton Beltramini SIG 87657
//     ((StrToDate(MontaSelect.ValoresChave[7]) >= StrToDate('25/10/2019')) and (StrToInt(MontaSelect.ValoresChave[8]) = 4)    //Ewerton Beltramini SIG 87657
        (qryConsultaHistorico.FieldByName('QTDTROCAPLACAHISTORICO').AsInteger >= 2) then     //Ewerton Beltramini SIG 87657
     begin                                                                                   //Ewerton Beltramini SIG 87657
       if sPlacaAntSel <> '' then                                                            //Ewerton Beltramini SIG 87657
         Label21.Caption := 'Nº RFID Anterior'                                               //Ewerton Beltramini SIG 87657
     end                                                                                     //Ewerton Beltramini SIG 87657
     else                                                                                    //Ewerton Beltramini SIG 87657
         Label21.Caption := 'Nº Patrimônio Anterior';                                        //Ewerton Beltramini SIG 87657
     Application.ProcessMessages;                                                            //Ewerton Beltramini SIG 87657
   end;                                                                                   //Ewerton Beltramini SIG 87657

   if not cds.IsEmpty then
   begin
      fIdBemSel := cds.FieldByName('IDBEM').AsFloat;
      //----------------------------------------------------------------------------------
      if cds.FieldByName('CONTROLE').AsString = 'T' then
         cmbControle.Text := CMTranslate('Total')
      else
         cmbControle.Text := CMTranslate('Físico');
      //----------------------------------------------------------------------------------
      cdsSituacao.Locate('IDSITUACAO',cds.FieldByName('IDSITUACAO').AsFloat,[]);
      cmbSituacao.Text := cdsSituacao.FieldByName('DESCSITUACAO').AsString;
      //----------------------------------------------------------------------------------

(*
    if fIdBem > 0 then                                          //Ewerton Beltramini SIG 87657
    begin                                                       //Ewerton Beltramini SIG 87657
      if (cds.FieldByName('DTAINCLUSAO').AsDateTime >= StrToDate('25/10/2019')) or     //Ewerton Beltramini SIG 87657
//       ((StrToDate(MontaSelect.ValoresChave[7]) >= StrToDate('25/10/2019')) and (StrToInt(MontaSelect.ValoresChave[8]) = 4)) then   //Ewerton Beltramini SIG 87657
         (qryConsultaHistorico.FieldByName('QTDTROCAPLACAHISTORICO').AsInteger >= 1) then //Ewerton Beltramini SIG 87657

        LblPatRfid.Visible := True                              //Ewerton Beltramini SIG 87657
      else                                                      //Ewerton Beltramini SIG 87657
        LblPatRfid.Visible := False;                            //Ewerton Beltramini SIG 87657
      Application.ProcessMessages;                              //Ewerton Beltramini SIG 87657
    end;                                                        //Ewerton Beltramini SIG 87657
*)

      edPlaca.Text := cds.FieldByName('PLACA').AsString;
      edQtde.Value := 1;
      //----------------------------------------------------------------------------------
      cdsClasse.Data := ClassedeBem.ListaClassedeBem(cds.FieldByName('IDCLASSEBEM').AsFloat);
      if not cdsClasse.FieldByName('MASCARAIDOPCIONAL').IsNull then
      begin
         TStringField(cds.FieldByName('IDOPCIONAL')).EditMask := cdsClasse.FieldByName('MASCARAIDOPCIONAL').AsString + ';0; ';
      end else
      begin
         TStringField(cds.FieldByName('IDOPCIONAL')).EditMask := '';
      end;
      //----------------------------------------------------------------------------------
      cdsConjunto.Data     := Conjunto.ListaConjunto(cds.FieldByName('IDPESSOA').AsFloat, cds.FieldByName('IDCONJUNTO').AsFloat);
      cdsRateioCCusto.Data := Conjunto.ListaRateioCustos(cds.FieldByName('IDPESSOA').AsFloat, cds.FieldByName('IDCONJUNTO').AsFloat);
      cdsFornec.Data       := Bem.ListaFornecedor(cds.FieldByName('IDFORNSERV').AsFloat);
      cdsGrupo.Data        := GrupoContab.ListaGrupoContab(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDGRUPO').AsFloat);
      //----------------------------------------------------------------------------------
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
      //----------------------------------------------------------------------------------
      cdsBemxMoeda.Data := Bem.ListaBemxMoeda(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat,
                                              ParamCAF.MOEDAOFICIAL);
      edValHistorico.Value := cdsBemxMoeda.FieldByName('VALORG').AsFloat;
      if edValHistorico.Value = 0 then
         edValHistorico.Value := cds.FieldByName('VALHISTORICO').AsFloat;

      edValResidual.Value := cds.FieldByName('VALRESIDUAL').AsFloat; // Alterado por FHBS - SOL: 136972 KTN: 823252

      cdsDet.Data     := Bem.ListaBemxDep(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat,
                                      ParamCAF.MOEDAOFICIAL);

      cdsHistDep.Data := Bem.ListaHistBemxDep(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat,
                                      ParamCAF.MOEDAOFICIAL); // Helen - SOL: 142551 KTN: 911676

      cdsRateio.Data  := Bem.ListaPlanoPatroxBem(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat);
      //----------------------------------------------------------------------------------
      cdsImagem.Data := Bem.CarregaImagem(cds.FieldByName('IDIMAGEM').AsFloat);
      if cdsImagem.IsEmpty then
      begin
         cdsImagem.Edit;
         cdsImagem.FieldByName('IDIMAGEM').AsFloat := 999999999999;
         cdsImagem.Post;
      end;
      //----------------------------------------------------------------------------------

      //Leandro Pocebon SIG 125120 - Inicio
      CdsAnexos.Data := CtrlImagemBem.ListaAnexos(fIdBem);
      tbAnexo.visible := tbcDetalhe.tabindex = 6;
      tbAnexo.enabled := not cdsAnexos.IsEmpty;
      btnVisual.enabled := tbAnexo.enabled;
      btnsalva.enabled := tbAnexo.enabled;
      //Leandro Pocebon SIG 125120 - Inicio

      if cdsConjunto.FieldByName('ALUGADO').AsInteger = 1 then
      begin
         CMProcuraTerceiro.Enabled := True;
         cdsTerceiro.Data := Terceiro.ListaTerceiro(cds.FieldByName('IDTERCEIRO').AsFloat);
      end else
      begin
         CMProcuraTerceiro.Enabled := False;
         cdsTerceiro.Data := Terceiro.ListaTerceiro(0);
      end;
      //Cássio - SOL Nº132461 KINTANA Nº 763386  - Início
      //Carrega Dataset com informações da tabela PLANOPATROXVIGENCIABEM
      cdsPlanoPatroxVigenciaBem.Data := Bem.ListaPlanoPatroxVigenciaBem(cds.FieldByName('IDBEM').AsInteger);
      //Verifica se o Bem compõe um imóvel
      bBemxImovel := Bem.VerificaBensImoveis(fIdBemSel);
      //Cássio - SOL Nº132461 KINTANA Nº 763386 - Fim
   end else
   begin
      cdsSituacao.Locate('IDSITUACAO', -1,[]);
      cmbSituacao.Text     := '';
      cmbControle.Text     := '';
      edPlaca.Text         := '';
      edQtde.Value         := 1;
      edValHistorico.Value := 0;
      edValResidual.Value  := 0; // Alterado por FHBS - SOL: 136972 KTN: 823252

      ckbFlgBemIntContab.Checked := (ParamCAF.INTEGRACONTAB = 'S');
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
      cdsHistDep.Data      := Bem.ListaHistBemxDep(Sistema.IdEmpresa,0);// Helen - SOL: 142551 KTN: 911676
      TataGrids;//Darivaldo Alencar SOL 198886.18334
      //----------------------------------------------------------------------------------
      cdsImagem.Data := Bem.CarregaImagem(-2);
      cdsImagem.Edit;
      cdsImagem.FieldByName('IDIMAGEM').AsFloat := 999999999999;
      cdsImagem.Post;
      //----------------------------------------------------------------------------------
      CMProcuraTerceiro.Enabled := False;
      cdsTerceiro.Data := Terceiro.ListaTerceiro(0);
      //Cássio - SOL Nº107352 KINTANA Nº 482395 -  Início
      //Carrega Dataset com informações da tabela HSTPERCSEGREGABEM
      cdsPlanoPatroxVigenciaBem.Data := Bem.ListaPlanoPatroxVigenciaBem(0);
      //Verifica se o Bem compõe um imóvel
      bBemxImovel := Bem.VerificaBensImoveis(0);
   end;
end;
//========================================================================================
procedure TfrmMTCadBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsCAFPaises.Close;
   ParamCAF.Free;
   ClassedeBem.Free;
   Situacao.Free;
   Terceiro.Free;
   GrupoContab.Free;
   AtivProjeto.Free;
   SubConta.Free;
   Bem.Free;
   AlmoxCAF.Free;
   if Sistema.IdModulo = 54 then
    TabSheet2.Visible := False;
end;
//========================================================================================
procedure TfrmMTCadBem.bbtnGeraPlacaClick(Sender: TObject);
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
   MsgDlg('Erro no Cadastramento.'+#13+#13+
          'Causa : '+Bem.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
     sPlacaAntSel := MontaSelect.ValoresChave[6]; // Alterado por FHBS - SOL: 132640 KTN: 766369
     SelBem(strtofloat(MontaSelect.ValoresChave[0]),strtofloat(MontaSelect.ValoresChave[1]));
   end;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroInsert(Sender: TObject);
begin
   SelBem(Sistema.IdEmpresa,0);
   inherited;
   cds.FieldByName('FLGBEMINTCONTAB').AsInteger := 1;
   bOperando := True;
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
   bFlgAltRestrita := False;
   bFlgAltCtrlFisico := (cds.FieldByName('CONTROLE').AsString = 'F') or (cds.FieldByName('CONTROLE').IsNull);
   //-------------------------------------------------------------------------------------
   if not bFlgAltCtrlFisico then
   begin
      if Bem.BemcomMovimento(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat) then
      begin
         MsgDlg('Bem já movimentado. Alteração Restrita.',
                'Atenção',mtWarning,[mbOk],0);
         bFlgAltRestrita := True;
      end else
      begin
         if Bem.BemSelecionado(cds.FieldByName('IDPESSOA').AsFloat,cds.FieldByName('IDBEM').AsFloat) then
         begin
            MsgDlg(Bem.MessageInfo + ' Alteração Restrita.',
                   'Atenção', mtWarning,[mbOk],0);
            bFlgAltRestrita := True;
         end;
      end;
   end;
   if not bFlgAltRestrita then
   begin
      bFlgAltRestrita := (cds.FieldByName('CONTROLE').AsString = 'F') and (cds.FieldByName('IDMODULO').AsInteger <> Sistema.IdModulo);
      if bFlgAltRestrita then
      begin
         bFlgAltCtrlFisico := False;
         MsgDlg('Bem cadastrado no módulo de Manutenção ou Investimento Imobiliário!' + #13 + #13 + ' Alteração Restrita.',
                'Atenção',mtWarning,[mbOk],0);
      end;
   end;
   //-------------------------------------------------------------------------------------
   cmbControle.Enabled := False;
   if bFlgAltRestrita then
   begin
      edPlaca.Enabled := False;
      bbtnGeraPlaca.Enabled := False;
      //----------------------------------------------------------------------------------
      dbeDataInclusao.Enabled := False;
      edQtde.Enabled := False;
      edValHistorico.Enabled := False;
      edValResidual.Enabled := False; // Alterado por FHBS - SOL: 136972 KTN: 823252
      //----------------------------------------------------------------------------------
      tbsConjunto.Enabled := False;
      tbsContabil.Enabled := False;
      tbsDet.Enabled := False;
      tbsPlanoPatro.Enabled := False;
      //----------------------------------------------------------------------------------
      sBtnInsDet.Enabled := False;
      sBtnAltDet.Enabled := False;
      sBtnExcluiDet.Enabled := False;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
   bOperando := True;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroDelete(Sender: TObject);
begin
   bOperando := True;
   if not Bem.BemcomMovimento(cds.FieldByName('IDPESSOA').AsFloat,
                              cds.FieldByName('IDBEM').AsFloat) then
   begin
      inherited;
   end else
      MsgDlg(Bem.MessageInfo,'Erro',mtError,[mbOk],0);
end;
//========================================================================================
procedure TfrmMTCadBem.dbiImagemBemClick(Sender: TObject);
begin
   inherited;
   if cds.State in [dsInsert,dsEdit] then
   begin
      try
         Application.CreateForm(TfrmImagemDoc, frmImagemDoc);
         frmImagemDoc.FormStyle := FsNormal;
         frmImagemDoc.dsImagem := dsImagem;
         frmImagemDoc.Imagem := TBlobField(cdsImagem.FieldByName('IMAGEM'));
         frmImagemDoc.CampoPai := TFloatField(cdsImagem.FieldByName('IDIMAGEM'));
         frmImagemDoc.Caption := CMTranslate('Imagem do Bem');
         if frmImagemDoc.ShowModal <> mrNone then
         begin
            if cdsImagem.IsEmpty then
               cdsImagem.Append
            else
               cdsImagem.Edit;
            //----------------------------------------------------------------------------
            cdsImagem.FieldByName('DESCRIMAGEM').AsString := 'Imagem do Bem';
            dbiImagemBem.Picture.Assign(frmImagemDoc.imgDoc.Picture);
            //----------------------------------------------------------------------------
            cdsImagem.Post;
         end;
      finally
         frmImagemDoc.Release;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTCadBem.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   if pgCtrlDetalhe.ActivePage = tbsDet then  // Taxa de Depreciação
   begin
      sBtnInsDet.Visible := False;
      sBtnAltDet.Caption := CMTranslate('Alterar Taxa');
      sBtnAltDet.Width   := 104;
      sBtnExcluiDet.Visible := False;
      // Helen - SOL: 142551 KTN: 911676
      sBtnAltDet.Visible := False;
   end else
   //Brunno Mattos - SOL 157853 - KTN 1274052 Inicio
   if pgCtrlDetalhe.ActivePage = tbsDepreciacao then  // Taxa de Depreciação
   begin
      sBtnInsDet.Visible := False;
      sBtnExcluiDet.Visible := False;
      sBtnAltDet.Caption := CMTranslate('Alterar Taxa');
      sBtnAltDet.Width   := 104;
      sBtnAltDet.Enabled := True;
      if (CmeCadastro.Operacao <> opInserir)
        OR (cdsDet.FieldByName('IDBEMXDEP').AsString = '')
        then
        sBtnAltDet.Enabled := False;

     if (Sistema.IdModulo = 7) then rgDepreClick(self);//Darivaldo Alencar SOL 198886.18334
   end else
   //Brunno Mattos - SOL 157853 - KTN 1274052 Fim
   if pgCtrlDetalhe.ActivePage = tbsPlanoPatro then  // Rateio Plano Previdenciario / Patrocinadora
   begin
    sBtnInsDet.Visible := True;
    sBtnAltDet.Caption := '';
    sBtnAltDet.Width   := 25;
    sBtnExcluiDet.Visible := True;
    
    //Cássio - SOL Nº107352 KINTANA Nº482365 - Início
    //Impedir que o possam ser alterarados os Planos/Patrocinadoras de Rateio de um Bem, caso
    //Bem esteja sendo alterado e se o módulo de acesso é o sistema de Investimentos Imobiliário
    if (CmeCadastro.Operacao = opAlterar) and (bBemxImovel and ((cdsRateio.IsEmpty) or (Sistema.IdModulo = 54))) then
    begin
      sbtnInsDet.Enabled := False;
      sbtnAltDet.Enabled:= False;
      sbtnExcluiDet.Enabled := False;
      TabSheet2.Visible := True;
    end;
   end;

   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Inicio
   if pgCtrlDetalhe.ActivePage = tbsAnexos then  // Anexos
   begin
      tbAnexo.visible := True;
      tbAnexo.enabled := not cdsAnexos.IsEmpty;
      btnVisual.enabled := tbAnexo.enabled;
      btnsalva.enabled := tbAnexo.enabled;
   end
   else
   begin
      tbAnexo.visible := False;
      tbAnexo.enabled := not cdsAnexos.IsEmpty;
      btnVisual.enabled := tbAnexo.enabled;
      btnsalva.enabled := tbAnexo.enabled;
   end;
   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Fim

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
            cds.FieldByName('DESBEM').AsString := cdsClasse.FieldByName('DESCRICAO').AsString;
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
                                                          cdsBuscaGrupo.FieldByName('IDGRUPO').AsFloat,'A',0);
            PreencheTaxaDep;
         end else
         begin
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, 0);
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTCadBem.CMProcuraForCliExit(Sender: TObject);
begin
   inherited;
   if CMProcuraForCli.Valida = vcOk then
      cdsFornec.Data := Bem.ListaFornecedor(CMProcuraForCli.ForCliReg.Id);
end;
//========================================================================================
procedure TfrmMTCadBem.CMProcuraTerceiroExit(Sender: TObject);
begin
   inherited;
   if CMProcuraTerceiro.Valida = vcOk then
      cdsTerceiro.Data := Terceiro.ListaTerceiro(CMProcuraTerceiro.SubTipoReg.Id);
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
      CMProcuraTerceiro.Enabled := True;
      cdsTerceiro.Data := Terceiro.ListaTerceiro(cds.FieldByName('IDTERCEIRO').AsFloat);
   end else
   begin
      CMProcuraTerceiro.Enabled := False;
      cdsTerceiro.Data := Terceiro.ListaTerceiro(0);
   end;
   //-------------------------------------------------------------------------------------
   // Se for Inclusão, seleciona o Grupo Contábil
   //-------------------------------------------------------------------------------------
   if (CmeCadastro.Operacao = opInserir) or (cdsGrupo.FieldByName('IDGRUPO').IsNull) then
   begin
      cdsBuscaGrupo.Data := Bem.BuscaGrupoContab(Sistema.IdEmpresa,
                                                 cdsClasse.FieldByName('IDCLASSEBEM').AsFloat,
                                                 cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
      if not cdsBuscaGrupo.IsEmpty then
      begin
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                       cdsBuscaGrupo.FieldByName('IDGRUPO').AsFloat,'A',0);
         PreencheTaxaDep;
      end else
      begin
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, 0);
      end;
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
         CMProcuraTerceiro.Enabled := True;
         cdsTerceiro.Data := Terceiro.ListaTerceiro(cds.FieldByName('IDTERCEIRO').AsFloat);
      end else
      begin
         CMProcuraTerceiro.Enabled := False;
         cdsTerceiro.Data := Terceiro.ListaTerceiro(0);
      end;
      //----------------------------------------------------------------------------------
      // Se for Inclusão, seleciona o Grupo Contábil
      //----------------------------------------------------------------------------------
      if (CmeCadastro.Operacao = opInserir) or (cdsGrupo.FieldByName('IDGRUPO').IsNull) then
      begin
         cdsBuscaGrupo.Data := Bem.BuscaGrupoContab(Sistema.IdEmpresa,
                                                    cdsClasse.FieldByName('IDCLASSEBEM').AsFloat,
                                                    cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
         if not cdsBuscaGrupo.IsEmpty then
         begin
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                          cdsBuscaGrupo.FieldByName('IDGRUPO').AsFloat,'A',0);
            PreencheTaxaDep;
         end else
         begin
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, 0);
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTCadBem.PreencheTaxaDep;
begin
   if (CmeCadastro.Operacao = opInserir) and (not cdsDet.IsEmpty) then
   begin
      cdsDet.First;
      while not cdsDet.EOF do
         cdsDet.Delete;
   end;
   //-------------------------------------------------------------------------------------
   if cdsDet.IsEmpty then
   begin
      cdsGrupoTaxaDep.Data := GrupoContab.ListaGrupoTaxaDep(cdsGrupo.FieldByName('IDGRUPO').AsFloat, Sistema.IdEmpresa);
      //Darivaldo Alencar SOL 198886.18334 -inicio
      if (Sistema.IdModulo = 7) then
        begin
          CdsClasseTaxaDep.Data:= ClasseTaxaDep.TxDepreciacaoClasseHerdada(cdsClasse.fieldbyname('IDCLASSEBEM').AsFloat);
          if (cdsGrupoTaxaDep.IsEmpty) then
            begin
             cdsGrupoTaxaDep.Append;
             cdsGrupoTaxaDep.FieldByName('IDPESSOA').AsFloat     := Sistema.IdEmpresa;
             cdsGrupoTaxaDep.FieldByName('IDTAXADEP').AsInteger  := 1;
             cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat      := CdsClasseTaxaDep.FieldByName('TAXADEP').AsFloat;
             cdsGrupoTaxaDep.FieldByName('DESCTAXADEP').AsString := 'Brasil';
             cdsGrupoTaxaDep.Post;
            end;
         end;
      //Darivaldo Alencar SOL 198886.18334 -fim

      while not cdsGrupoTaxaDep.EOF do
      begin
         cdsDet.Append;
         cdsDet.FieldByName('IDPESSOA').AsFloat     := Sistema.IdEmpresa;
         cdsDet.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAOFICIAL;
         cdsDet.FieldByName('IDBEMXDEP').AsInteger  := cdsGrupoTaxaDep.FieldByName('IDTAXADEP').AsInteger;
         //Darivaldo Alencar SOL 198886.18334 -inicio
         if not(Sistema.IdModulo = 7) then
           cdsDet.FieldByName('TAXADEP').AsFloat      := cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat
         else begin
           cdsDet.FieldByName('TAXADEP').AsFloat      := CdsClasseTaxaDep.FieldByName('TAXADEP').AsFloat;
           cdsDet.FieldByName('VIDAUTIL').AsFloat     := CdsClasseTaxaDep.FieldByName('VIDAUTIL').AsFloat;
         end;
         //Darivaldo Alencar SOL 198886.18334 -fim
         cdsDet.FieldByName('DESCTAXADEP').AsString := cdsGrupoTaxaDep.FieldByName('DESCTAXADEP').AsString;
         // Helen - SOL: 142551 KTN: 911676
         cdsDet.FieldByName('DATAINICIODEP').AsString := cds.FieldByName('DATAINICIODEP').AsString;
         cdsDet.Post;
         //-------------------------------------------------------------------------------
         cdsGrupoTaxaDep.Next;
      end;
      //----------------------------------------------------------------------------------
      // Se o grupo não possuir as taxas de depreciação
      //----------------------------------------------------------------------------------
      if cdsDet.RecordCount <> ParamCAF.NUMTAXADEP then
      begin
         MsgDlg('Grupo Contábil selecionado não possui taxa(s) de depreciação definida(s)!'+#13+
                'Consulte o Cadastro de Grupos Contábeis.','Erro',mtError,[mbOk],0);
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,0);
         exit;
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
                                                    StrToFloat(MSGrupos.ValoresChave[0]),'A',0);
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
      // Verificar se a mudança de grupo irá acarretar uma mudança de conjunto
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
      PreencheTaxaDep;
   end;
end;
//========================================================================================
procedure TfrmMTCadBem.cdsGrupoAfterOpen(DataSet: TDataSet);
var
   bAlteraTaxas,bValida : Boolean;

begin
   inherited;
   if bOperando then
   begin
      bAlteraTaxas := (CmeCadastro.Operacao = opInserir);
      if not cdsGrupo.IsEmpty then
      begin
         cdsGrupoTaxaDep.Data := GrupoContab.ListaGrupoTaxaDep(cdsGrupo.FieldByName('IDGRUPO').AsFloat, Sistema.IdEmpresa);
         if (Sistema.IdModulo = 7) then CdsClasseTaxaDep.Data:= ClasseTaxaDep.TxDepreciacaoClasseHerdada(cdsClasse.fieldbyname('IDCLASSEBEM').AsFloat);//Darivaldo Alencar SOL 198886.18334

         while not cdsDet.EOF do
         begin
            if CmeCadastro.Operacao = opAlterar then
            begin
               //Darivaldo Alencar SOL 198886.18334 -inicio
               //if cdsDet.FieldByName('TAXADEP').AsFloat <> cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat then
               if not(Sistema.IdModulo = 7) then
                    bValida:= cdsDet.FieldByName('TAXADEP').AsFloat <> cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat
               else bValida:= cdsDet.FieldByName('TAXADEP').AsFloat <> CdsClasseTaxaDep.FieldByName('TAXADEP').AsFloat;

               if (bValida) then
               //Darivaldo Alencar SOL 198886.18334 -fim
                  if Sistema.IdModulo <> 8 then
                  begin
                     bAlteraTaxas := MsgDlg('Uma ou mais taxas de depreciação cadastradas são diferentes das '+ #13 +
                                            'taxas cadastradas no Cadastro de Grupos Contábeis.'+ #13 + #13 +
                                            'Deseja substituir pelas taxas padronizadas para o grupo ?',
                                            'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes;
                  end else
                  begin
                     bAlteraTaxas := False;
                  end;
            end else
            begin
               bAlteraTaxas := True;
            end;
            cdsDet.Next;
            //Darivaldo Alencar SOL 198886.18334 -inico
            if not(Sistema.IdModulo = 7) then
               cdsGrupoTaxaDep.Next
            else CdsClasseTaxaDep.Next;
            //Darivaldo Alencar SOL 198886.18334 -fim
         end;
         if bAlteraTaxas then
         begin
            cdsDet.First;
            while not cdsDet.EOF do
            begin
               cdsGrupoTaxaDep.First;
               while (not cdsGrupoTaxaDep.EOF) and(cdsGrupoTaxaDep.FieldByName('IDTAXADEP').AsInteger <> cdsDet.FieldByName('IDBEMXDEP').AsInteger)
                  do
                  cdsGrupoTaxaDep.Next;
               //-------------------------------------------------------------------------
               if not cdsGrupoTaxaDep.EOF then
               begin
                  cdsDet.Edit;
                  //Darivaldo Alencar SOL 198886.18334 -inicio
                  if not(Sistema.IdModulo = 7) then
                     cdsDet.FieldByName('TAXADEP').AsFloat      := cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat
                  else begin
                    cdsDet.FieldByName('TAXADEP').AsFloat      := CdsClasseTaxaDep.FieldByName('TAXADEP').AsFloat;
                    cdsDet.FieldByName('VIDAUTIL').AsFloat     := CdsClasseTaxaDep.FieldByName('VIDAUTIL').AsFloat;
                  end;
                  //Darivaldo Alencar SOL 198886.18334 -fim
                  cdsDet.FieldByName('DESCTAXADEP').AsString := cdsGrupoTaxaDep.FieldByName('DESCTAXADEP').AsString;
                  cdsDet.Post;
               end;
               //-------------------------------------------------------------------------
               cdsDet.Next;
            end;
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
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa, -2);
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
      Bem.MessageInfo := CMTranslate('Classe não selecionada!');
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if cmbControle.Text = '' then
   begin
      Bem.MessageInfo := CMTranslate('Forma de Controle não selecionada!');
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if cmbSituacao.Text = '' then
   begin
      Bem.MessageInfo := CMTranslate('Situação Física não selecionada!');
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if dbeDesBem.Text = '' then
   begin
      Bem.MessageInfo := CMTranslate('Descrição do bem não informada!');
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if cdsConjunto.FieldByName('IDCONJUNTO').IsNull then
   begin
      Bem.MessageInfo := CMTranslate('Conjunto não selecionado!');
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if cdsGrupo.FieldByName('IDGRUPO').IsNull then
   begin
      Bem.MessageInfo := CMTranslate('Grupo Contábil não selecionado!');
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edValHistorico.Value <= 0 then
   begin
      if cmbControle.ItemIndex = 0 then
      begin
         Bem.MessageInfo := CMTranslate('O valor total do custo de aquisição dos bens deve ser ')+#13+
                            CMTranslate('informado quando Controle Total for selecionado!');
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if cdsGrupo.FieldByName('FLGSEMPLACA').AsInteger = 0 then
   begin
      if edPlaca.Text = '' then
      begin
         Bem.MessageInfo := CMTranslate('Número do Tombamento Patrimonial do Bem não informado!');
         Exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if (edPlaca.Text <> '') and (CmeCadastro.Operacao = opInserir) then
   begin
      if not Bem.PlacaUnica(Sistema.IdEmpresa,edPlaca.Text) then
      begin
         Bem.MessageInfo := CMTranslate('Número do Tombamento Patrimonial do Bem deve ser exclusivo!');
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if dbeDataInclusao.Text = '' then
   begin
      Bem.MessageInfo := CMTranslate('Data de Entrada do Bem no patrimonio não informada!');
      exit;
   end;
   if (not ckbFlgBemIntContab.Checked) and ((dbeDataInclusao.Date - date) > 28) then
   begin
      Bem.MessageInfo := CMTranslate('A Data de Entrada do Bem no patrimonio está no futuro!');
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edQtde.Value <= 0 then
   begin
      Bem.MessageInfo := CMTranslate('A quantidade de bens que será gerada não foi informada!');
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (dbeDtaContab.Text = '') and (ckbFlgBemIntContab.Checked) then
   begin
      Bem.MessageInfo := CMTranslate('A data do registro da entrada do bem na contabilidade não foi informada!');
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if dbeDataInicioDep.Text = '' then
   begin
      Bem.MessageInfo := CMTranslate('A data de inicio da depreciação do bem não foi informada!');
      Exit;
   end;
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
         Bem.MessageInfo := CMTranslate('Soma dos Rateios de Custo por Plano/Patrocinadora está em ') +
                            FloatToStr(fTotPerc) + CMTranslate('% e deve ser 100% ');
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
   if not(cds.State in [dsInsert,dsEdit]) then cds.Edit; // Alterado por FHBS - SOL: 136972 KTN: 823252
   //-------------------------------------------------------------------------------------
   cds.FieldByName('IDCLASSEBEM').AsInteger := cdsClasse.FieldByName('IDCLASSEBEM').AsInteger;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('REGISTRO').AsString := 'I';
   if cmbControle.Text = CMTranslate('Físico') then
   begin
      cds.FieldByName('CONTROLE').AsString := 'F'
   end else
   if cmbControle.Text = CMTranslate('Total') then
   begin
      cds.FieldByName('CONTROLE').AsString := 'T'
   end;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text <> '' then
      cds.FieldByName('PLACA').AsFloat := strtofloat(edPlaca.Text)
   else
      cds.FieldByName('PLACA').Clear;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('IDFORNSERV').AsFloat := cdsFornec.FieldByName('IDPESSOA').AsFloat;
   cds.FieldByName('IDCONJUNTO').AsFloat := cdsConjunto.FieldByName('IDCONJUNTO').AsFloat;
   cds.FieldByName('IDGRUPO').AsFloat := cdsGrupo.FieldByName('IDGRUPO').AsFloat;
   if not cdsAtivProj.FieldByName('UNIDNEGOC').IsNull then
      cds.FieldByName('UNIDNEGOC').AsFloat := cdsAtivProj.FieldByName('UNIDNEGOC').AsFloat;
   if not cdsSubConta.FieldByName('CODSUBCONTA').IsNull then
      cds.FieldByName('CODSUBCONTA').AsFloat := cdsSubConta.FieldByName('CODSUBCONTA').AsFloat;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('BAIXATOTAL').AsString := 'N';
   //-------------------------------------------------------------------------------------
   if cdsImagem.FieldByName('IMAGEM').IsNull or (cdsImagem.FieldByName('IDIMAGEM').AsFloat = 999999999999) then
   begin
      cds.FieldbyName('IDIMAGEM').Clear;
      cdsImagem.Edit;
      cdsImagem.FieldbyName('IDIMAGEM').Clear;
      cdsImagem.Post;
   end else
   begin
      cds.FieldbyName('IDIMAGEM').AsFloat := cdsImagem.FieldbyName('IDIMAGEM').AsFloat;
   end;

  //Leandro Pocebon - SIG 125120 - Cadastro anexos - Inicio
  if bdeletou then
  begin
    if not(CtrlImagemBem.ExcluiImagemBem) then
    begin
       Bem.MessageInfo := CMTranslate(CtrlImagemBem.MessageInfo);
       Exit;
    end
  end
  else
  begin
    if not(CtrlImagemBem.AplicaAtualImagemBem) then
    begin
      Bem.MessageInfo := CMTranslate(CtrlImagemBem.MessageInfo);
      Exit;
    end;
  end;
   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Fim

   //-------------------------------------------------------------------------------------
   Accept := True;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;
begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   bOperando := False;
   if OldOperacao = opAlterar then
      SelBem(Sistema.IdEmpresa, fIdBemSel)
   else
   if OldOperacao = opApagar then
      SelBem(Sistema.IdEmpresa, 0);
   //-------------------------------------------------------------------------------------
   bFlgAltRestrita := False;
   bFlgAltCtrlFisico := False;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Bem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                    'I', edValHistorico.Value, strtoint(edQtde.Text),
                                    edValResidual.Value); // Alterado por FHBS - SOL: 136972 KTN: 823252
   if Accept then
      MsgDlg('Bem Cadastrado','Informação',mtInformation,[mbOK],0);
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
      Accept := Bem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                       'AC', edValHistorico.Value, strtoint(edQtde.Text),
                                       edValResidual.Value); // Alterado por FHBS - SOL: 136972 KTN: 823252
   end else
   //-------------------------------------------------------------------------------------
   // Alteracao completa em bem com controle total
   //-------------------------------------------------------------------------------------
   if not bFlgAltRestrita then
   begin
      Accept := Bem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                       'AC', edValHistorico.Value, strtoint(edQtde.Text),
                                       edValResidual.Value); // Alterado por FHBS - SOL: 136972 KTN: 823252
   end else
   //-------------------------------------------------------------------------------------
   // Alteracao restrita em bem com controle total
   //-------------------------------------------------------------------------------------
   begin
      Accept := Bem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                       'AR', edValHistorico.Value, strtoint(edQtde.Text),
                                       edValResidual.Value); // Alterado por FHBS - SOL: 136972 KTN: 823252
      //----------------------------------------------------------------------------------
      bbtnGeraPlaca.Enabled := ParamCAF.EDITACODBEM = 1;
      edPlaca.Enabled := ParamCAF.EDITACODBEM = 0;
      dbeDataInclusao.Enabled := True;
      //----------------------------------------------------------------------------------
      edQtde.Enabled := True;
      edValHistorico.Enabled := True;
      edValResidual.Enabled  := True; // Alterado por FHBS - SOL: 136972 KTN: 823252
      //----------------------------------------------------------------------------------
      tbsConjunto.Enabled := True;
      tbsContabil.Enabled := True;
      tbsDet.Enabled := True;
      tbsPlanoPatro.Enabled := True;
   end;
   //-------------------------------------------------------------------------------------
   if Accept then
      MsgDlg('Bem Alterado','Informação',mtInformation,[mbOK],0);
end;
 //=======================================================================================
procedure TfrmMTCadBem.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   cds.CancelUpdates;
   Accept := Bem.ExecutaCadastroBem(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                    'R', edValHistorico.Value, strtoint(edQtde.Text),
                                    edValResidual.Value); // Alterado por FHBS - SOL: 136972 KTN: 823252
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   if cds.State <> dsEdit then
   begin
   tbsDocumento.Enabled := bbtnConfirmar.Enabled;
   tbsConjunto.Enabled  := bbtnConfirmar.Enabled;
   tbsContabil.Enabled  := bbtnConfirmar.Enabled;
   if not bbtnConfirmar.Enabled then
      cmbControle.Enabled := True;
   end;

   if (pgctrlDetalhe.ActivePage = tbsPlanoPatro) and (bBemxImovel and ((cdsRateio.IsEmpty) or (Sistema.IdModulo = 54))) then
   begin
    sbtnInsDet.Enabled := False;
    sbtnAltDet.Enabled:= False;
    sbtnExcluiDet.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
   inherited;
   if bFlgAltRestrita then
   begin
      //Leandro Pocebon - SIG 125120 - Cadastro anexos - Inicio
      if pgCtrlDetalhe.ActivePage <> tbsAnexos then  // Anexos
      begin
        sBtnInsDet.Enabled := False;
        sBtnAltDet.Enabled := False;
        sBtnExcluiDet.Enabled := False;
      end;
      //Leandro Pocebon - SIG 125120 - Cadastro anexos - Fim
   end;
end;
//========================================================================================
procedure TfrmMTCadBem.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   bOperando := False;
//Ricardo Cristiano - SOL : 1465767 Kintana : 672023 - Alteração para melhorar performance na entrada da tela   
//   SelBem(Sistema.IdEmpresa, 0);   
   //-------------------------------------------------------------------------------------
   bbtnGeraPlaca.Enabled := ParamCAF.EDITACODBEM = 1;
   edPlaca.Enabled := ParamCAF.EDITACODBEM = 0;
   dbeDataInclusao.Enabled := True;
   //-------------------------------------------------------------------------------------
   edQtde.Enabled := True;
   edValHistorico.Enabled := True;
   edValResidual.Enabled := True; // Alterado por FHBS - SOL: 136972 KTN: 823252
   //-------------------------------------------------------------------------------------
   tbsConjunto.Enabled := True;
   tbsContabil.Enabled := True;
   tbsDet.Enabled := True;
   tbsPlanoPatro.Enabled := True;
   //-------------------------------------------------------------------------------------
   bFlgAltRestrita := False;
   bFlgAltCtrlFisico := False;
end;

function TfrmMTCadBem.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

procedure TfrmMTCadBem.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;

// Daniel - 24911 - Início -----------------------------------------------------
  if (Cds.FieldByname('BAIXATOTAL').AsString='S') then begin
    lblStatus.Caption    := 'Baixado';
    lblStatus.Font.Color := clRed;
  end else begin
    if (Cds.FieldByname('FLGSAIDATEMP').AsInteger=1) then begin
      lblStatus.Caption    := 'Em Saída Temporária';
      lblStatus.Font.Color := clRed;
    end else begin
      if (Cds.FieldByname('FLGPENHORA').AsInteger=1) then begin
        lblStatus.Caption    := 'Penhorado';
        lblStatus.Font.Color := clRed;
      end else begin
        lblStatus.Caption    := 'Ativo';
        lblStatus.Font.Color := clBlue;
      end;
    end;
  end;
// Daniel - 24911 - Fim --------------------------------------------------------

end;
procedure TfrmMTCadBem.dbgrdDetDblClick(Sender: TObject);
begin
  if not (CmeCadastro.Operacao = opAlterar) and not (bBemxImovel) then
    inherited;
end;

//Darivaldo Alencar SOL 198886.18334 -inicio
procedure TfrmMTCadBem.FormPaint(Sender: TObject);
begin
   inherited;
   if (Sistema.IdModulo = 7) then
     begin
       Label24.Visible        := false;
       Label23.Visible        := false;
       dbgRateioCustos.Height := tbsConjunto.Height - 160;
     end
   else begin
      rgDepre.Visible:= false;
      edVidaUtil.Visible:= false;
   end;
end;

procedure TfrmMTCadBem.rgDepreClick(Sender: TObject);
begin
  inherited;
  if (Sistema.IdModulo = 7) then
     begin
        DBRealEdit1.Enabled:= (rgDepre.ItemIndex = 0);
        edVidaUtil.Enabled := (rgDepre.ItemIndex = 1);
        edVidaUtilExit(self);
        DBRealEdit1Exit(self);
     end
end;

procedure TfrmMTCadBem.edVidaUtilExit(Sender: TObject);
begin
  inherited;
  if (Sistema.IdModulo = 7) then
    begin
      if (cdsDet.state in [dsEdit,dsInsert]) and (edVidaUtil.value <> 0) then
            cdsDet.FieldByName('TAXADEP').asCurrency  := (100 /(edVidaUtil.value / 12));
    end;
end;

procedure TfrmMTCadBem.DBRealEdit1Exit(Sender: TObject);
begin

  inherited;
  if (Sistema.IdModulo = 7)then
     begin
       if (cdsDet.state in [dsEdit,dsInsert]) and (DBRealEdit1.value <> 0) then
          cdsDet.FieldByName('VIDAUTIL').asCurrency := ((100 /DBRealEdit1.value) * 12);
     end;
end;

procedure TfrmMTCadBem.TataGrids;
begin
  if not(cdsDet.state in[dsInactive]) then
    begin
       dbgrdDet.Fields[3].Visible   := Sistema.IdModulo = 7;
       dbgrdDet.Fields[2].Visible   := Sistema.IdModulo <> 7;
    end;

  if not(cdsHistDep.state in[dsInactive]) then
    begin
       wwDBGrid2.Fields[3].Visible  := Sistema.IdModulo = 7;
       wwDBGrid2.Fields[2].Visible  := Sistema.IdModulo <> 7;
    end;
    Application.ProcessMessages;
end;
//Darivaldo Alencar SOL 198886.18334 -fim

procedure TfrmMTCadBem.bbtnAnexarClick(Sender: TObject);
begin
  inherited;
   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Inicio
  OpenDlg.Execute;
  CtrlImagemBem.Caminho := OpenDlg.FileName;
  if cds.state in [dsEdit, dsInsert] then
  begin
    if trim(OpenDlg.filename) <> '' then
    begin

      cdsAnexos.FieldByName('IDBEM').asFloat := strToFloat(MontaSelect.ValoresChave[1]);
      cdsAnexos.FieldByName('NOMEARQUIVO').asString := extractFileName(OpenDlg.filename);
      (cdsAnexos.FieldByName('IMAGEM')as TBlobField).LoadFromFile(OpenDlg.filename);

      OpenDlg.filename := '';
    end;
  end;
   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Fim

end;

procedure TfrmMTCadBem.btnVisualClick(Sender: TObject);
var sNomeArquivo : string;
begin
  inherited;
   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Inicio
  btnVisual.Down := false;
  sNomeArquivo := cmGetTempPath() + CdsAnexos.FieldByName( 'NOMEARQUIVO' ).AsString;
  If FileExists( sNomeArquivo ) Then
    DeleteFile( sNomeArquivo );
  TBlobField( CdsAnexos.FieldByName( 'IMAGEM' ) ).SaveToFile( sNomeArquivo );

  ShellExecute( Handle,
                'Open',
                pchar(sNomeArquivo),
                Nil,
                Nil,
                sw_shownormal );
   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Fim

end;

procedure TfrmMTCadBem.btnSalvaClick(Sender: TObject);
begin
  inherited;
   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Inicio
  btnSalva.Down := false;
  SaveDlg.filename := cdsAnexos.FieldByName('NOMEARQUIVO').asString;
  SaveDlg.Execute;
  If FileExists( SaveDlg.filename ) Then
    DeleteFile( SaveDlg.filename );
  TBlobField( CdsAnexos.FieldByName( 'IMAGEM' ) ).SaveToFile( SaveDlg.filename );
   //Leandro Pocebon - SIG 125120 - Cadastro anexos - Fim
end;

procedure TfrmMTCadBem.dbgAnexosDblClick(Sender: TObject);
begin
  inherited;
  btnVisualClick(Sender);
end;

procedure TfrmMTCadBem.cdsAnexosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  bdeletou := true;    //Leandro Pocebon - SIG 125120 - Cadastro anexos
end;

procedure TfrmMTCadBem.CdsBeforePost(DataSet: TDataSet);
begin
  inherited;
  cds.FieldByName('DESBEM').AsString := StringReplace(cds.FieldByName('DESBEM').AsString, #$A#$A, '', [rfReplaceAll]);   //leandro sig134548
end;

end.

