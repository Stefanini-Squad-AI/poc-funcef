{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O-,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit FCadContasContabMT;

{=========================================================================================
 Autor.....: Cássio Rovaroto
 SIG.......: 115126
 Data      : 25/02/2022
 Descrição : Inclusão do atributo Conta Extracontábil
 =========================================================================================
 Autor.....: André Imakawa
 SIG.......: 114544
 Data      : 19/03/2021
 Descrição : Habilitar o campo grpTipo
 =========================================================================================
 Autor.....: Marcelo Cardoso Santos Filho
 SIG.......: 26555
 Data      : 16/02/2017
 Descrição : Inclusão do grupo Patrimônio Social e inclusão do campo Conta para
             Aglutinação.
 =========================================================================================
{=========================================================================================
 Autor.....: Arnaldo Vicente Scarin
 SOL.......: 122624
 Kintana...: 603582
 Data      : 24/08/2009
 Descrição : Criação dos campos solicitados de acordo com o SOL, para implementacao
             CGPC 28.
=========================================================================================}
{******************************************************************************}
{Rotina.........: CtrlPlanoConta.ContaTemSaldo,
                  CtrlPlanoConta.ContaTemOutrosFilhos
N. Sol..........: 112861
N. Kintana......: 523260
Data............: 06/04/2009
Responsável.....: Marilza Colpani
Descrição.......: Retirada a crítica que verificava se a conta possuía saldo
                 (ContaTemSaldo).
                  Implementação de uma funcionalidade de exclusão de saldo,
                  desvinculação da conta segregada (ContaTemOutrosFilhos).
*******************************************************************************}

interface
{------------------------------------------------------------------------------
  Desenvolvedor: andré tavares
  Data         : 24/05/2005
  Pendência    : 15342 - acertado a chamada do método ListContasxCC passando o idempresa.
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 02/03/04
  Pendência    : 15094 - Incluir as contas pai na consulta do montaselect
  Solução      : Metodos MontaSelect.AfterOpen e MontaSelectBeforeOpen
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 07/12/03
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : Criado método no CtrlSegregacao para verificar flag ativo

  Data         : 20/01/04
  Solução      : modificada a criação do uCtrlSegregacao
------------------------------------------------------------------------------}

{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 05/12/03
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : Não permitir múltiplos critérios de segregação para uma mesma
                 árvore contábil
                 ex: 5      não deve possuir
                     511    possui critério
                     51101  não deve possuir

                 Verificar Parâmetro global para habilitar o Critério para
                 segregação de recursos
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 05/12/03
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : Limpar todas as referências ao campo Atividade/Projeteo, com
                 a criação de novos  métodos para segregação.
                 A segreação por atividade projeto era utilizada apenas pela CBS.
------------------------------------------------------------------------------}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, CMTree, DBCtrls, wwdblook,
  Wwdotdot, Wwdbcomb, ExtCtrls, Mask, wwdbedit, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
  CMDBLookupCombo, CMProcuraMask, TREdit, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, FCadastroMT, DBClient,
  uCMClientDataSet, uCtrlContaContabil,uCtrlPlanoConta, uCtrlContab,
  uCtrlListTerceiros, uCtrlSubGrupo, uCMTreeViewMT,
  uCtrlProcessaTotalPrev,uCMTypes, uCtrlSegregacao,
  CMDatabase, uVerificaPreenchimento, uCmSqlParams, uCtrlParamIntegra;

type
  TConsultaConta = record
    PlaConta: string;
    Plano   : integer;
  end;
  TfrmCadContasContabMT = class(TFrmCadastroMT)
    MontaSelectConta: TMontaSelect;
    pgCtrl: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    lblDigito: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label18: TLabel;
    dbeCodigo: TwwDBEdit;
    dbeGrau: TwwDBEdit;
    grpTipo: TDBRadioGroup;
    cmbGrp: TwwDBComboBox;
    dbeCodReduz: TwwDBEdit;
    grpNatureza: TDBRadioGroup;
    dbeDescPort: TwwDBEdit;
    dbeDescOIdi: TwwDBEdit;
    dbeCorresp: TwwDBEdit;
    GroupBox4: TGroupBox;
    chkOrdAlf: TDBCheckBox;
    chkCentCust: TDBCheckBox;
    chkAltera: TDBCheckBox;
    chkInativa: TDBCheckBox;
    chkSumariza: TDBCheckBox;
    chkContaPadrao: TDBCheckBox;
    chkSubconta: TDBCheckBox;
    chkPL: TDBCheckBox;
    chkConcilia: TDBCheckBox;
    chkBloqueia: TDBCheckBox;
    dteBloqueada: TCMDateTimePicker;
    dbImprimeRelatEvolu: TDBCheckBox;
    dblcComLancamento: TDBCheckBox;
    rdgRateio: TDBRadioGroup;
    dblkPlanoContabil: TCMDBLookupCombo;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    lblsub1: TLabel;
    lblsub2: TLabel;
    lblsub3: TLabel;
    lblsub4: TLabel;
    dblkSubGrupo1: TwwDBLookupCombo;
    dblkSubGrupo2: TwwDBLookupCombo;
    dblkSubGrupo3: TwwDBLookupCombo;
    dblkSubGrupo4: TwwDBLookupCombo;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    dbcmbTipGer: TwwDBComboBox;
    dbcmbTipOfi: TwwDBComboBox;
    dbcmbTipGer2: TwwDBComboBox;
    dbcmbTipGer3: TwwDBComboBox;
    gbMoedaHist: TGroupBox;
    cmContraPartida: TCMProcuraMaskContabil;
    dblkMoeda: TwwDBLookupCombo;
    gbTxJuros: TGroupBox;
    lblPercJuros: TLabel;
    Label19: TLabel;
    cmContraPartidaJuros: TCMProcuraMaskContabil;
    dbrePercTxJuros: TDBRealEdit;
    TabSheet4: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    grdCCusto: TwwDBGrid;
    grdContasxCC: TwwDBGrid;
    btnVaiTodos: TBitBtn;
    btnVaiUm: TBitBtn;
    btnVoltaTodos: TBitBtn;
    btnVoltaUm: TBitBtn;
    TabSheet5: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    grdSubConta: TwwDBGrid;
    grdContasxSC: TwwDBGrid;
    btnVaiTodos2: TBitBtn;
    btnVaiUm2: TBitBtn;
    btnVoltaUm2: TBitBtn;
    btnVoltaTodos2: TBitBtn;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    btnExpande: TSpeedButton;
    btnSistetiza: TSpeedButton;
    CdsPlanoContabil: TCMClientDataSet;
    Label7: TLabel;
    CdsMoeda: TCMClientDataSet;
    CdsSubGrupo: TCMClientDataSet;
    CdsCCusto: TCMClientDataSet;
    dsCCusto: TwwDataSource;
    dsContasxCC: TwwDataSource;
    CdsContasxCC: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    dsSubConta: TwwDataSource;
    CdsContasxSC: TCMClientDataSet;
    dsContasxSC: TwwDataSource;
    CdsTreeContas: TCMClientDataSet;
    dsTreeContas: TwwDataSource;
    treeplano: TCMTreeViewMT;
    cmContaSegreg: TCMProcuraMaskContabil;
    cdsRateioPlanoPatro: TCMClientDataSet;
    Label20: TLabel;
    dblkRateioPlanoPatro: TwwDBLookupCombo;
    TabSheet6: TTabSheet;
    DBMemoObs: TDBMemo;
    Label21: TLabel;
    cdsSegregaCriter: TCMClientDataSet;
    qryMontaSelect: TCMSqlParams;
    cdsMontaSelect: TCMClientDataSet;
    cdsPrograma: TCMClientDataSet;
    SqlPrograma: TCMSqlParams;
    Bevel1: TBevel;
    Label17: TLabel;
    dblkSegregacao: TwwDBLookupCombo;
    cboPrograma: TCMDBLookupCombo;
    Label22: TLabel;
    gbSegregaFDOADM: TGroupBox;
    CMContaSegregFDOAdmCred: TCMProcuraMaskContabil;
    CMContaSegregFDOADMDeb: TCMProcuraMaskContabil;
    chkUsoExcPga: TDBCheckBox;
    CMContaAglutinacao: TCMProcuraMaskContabil;
    Label23: TLabel;
    edtContaExtracontab: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure pgCtrlChange(Sender: TObject);
    procedure grdCCustoTopRowChanged(Sender: TObject);
    procedure dbeCodigoExit(Sender: TObject);
    procedure cmbGrpExit(Sender: TObject);
    procedure chkBloqueiaClick(Sender: TObject);
    procedure btnSistetizaClick(Sender: TObject);
    procedure btnExpandeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dblkPlanoContabilCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure grpTipoClick(Sender: TObject);
    procedure chkCentCustClick(Sender: TObject);
    procedure chkSubcontaClick(Sender: TObject);
    procedure btnVaiTodosClick(Sender: TObject);
    procedure btnVaiUmClick(Sender: TObject);
    procedure btnVoltaUmClick(Sender: TObject);
    procedure btnVoltaTodosClick(Sender: TObject);
    procedure btnVaiTodos2Click(Sender: TObject);
    procedure btnVaiUm2Click(Sender: TObject);
    procedure btnVoltaUm2Click(Sender: TObject);
    procedure btnVoltaTodos2Click(Sender: TObject);
    procedure grdSubContaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdSubContaTopRowChanged(Sender: TObject);
    procedure grdContasxSCCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdContasxSCTopRowChanged(Sender: TObject);
    procedure grdCCustoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdContasxCCCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdContasxCCTopRowChanged(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure MontaSelectAfterOpenCds(oCds: TClientDataSet);
    procedure sbtnProcurarClick(Sender: TObject);

  private
    rConsultaConta        :TConsultaConta;
    bArvoreMontada        : Boolean;
    CtrlContaContabil     : TCtrlContaContabil;
    CtrlPlanoConta        : TCtrlPlanoConta;
    CtrlContab            : TCtrlContab;
    CtrlProcessaTotalPrev : TCtrlProcessaTotalPrev;
    ListTerceiros         : TCtrlListTerceiros;
    CtrlSubGrupo          : TCtrlSubGrupo;
    CtrlSegregacao        : TCtrlSegregacao;
    procedure BuscaMascaraConta(sMascara:String);
    procedure VerificaContaxCC(sConta: string;iPlano: Integer);
    procedure VerificaContaxSC(sConta: string;iPlano: Integer);

    function VerificaPreenchimento: boolean;

  public
  end;

var
  frmCadContasContabMT: TfrmCadContasContabMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uString,
     uAutorizacao, uSistema, uModulo, uFuncaoGeral;

var
  iPlanoInicial, iGrau, iGrauPai, iNumEleC : Integer;
  bSair, bEnabled   : Boolean;
  sPai, sMascPict   : string;

{$R *.DFM}


procedure TfrmCadContasContabMT.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;

  //*** Instancia a classe de contas ***
  CtrlPlanoConta  := TCtrlPlanoConta.Create;
  CtrlPlanoConta.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlPlanoConta.cdsPlanoConta := Cds;
  CtrlPlanoConta.cdsContasxSC  := CdsContasxSC;
  CtrlPlanoConta.cdsContasxCC  := CdsContasxCC;

  Cds.Data  := CtrlPlanoConta.ListCdsPlanoContas(-1,'');


  // *** Instancia a classe geral Ctrlcontab ****
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  // *** Instancia a classe rateio extra ***
  CtrlProcessaTotalPrev := TCtrlProcessaTotalPrev.Create;
  CtrlProcessaTotalPrev.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  // *** Instancia a classe Contacontabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsContasxSC.Data := CtrlContaContabil.ListContasxSC(-1,Sistema.IdEmpresa,0,'',toNome);

  CdsContasxCC.Data := CtrlContaContabil.ListContasxCC(-1,Sistema.IdEmpresa,'','',tccAmbasCC,toNome);
  //fim - andré tavares - pendência 15342

  // *** Instancia a classe de terceiros ***
  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  // *** Instancia a classe subgrupo ***
  CtrlSubGrupo := TCtrlSubGrupo.Create;
  CtrlSubGrupo.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.InitializeAs(CtrlPlanoConta);
  CtrlSegregacao.GetParams (Sistema.IdEmpresa);
  cdsSegregaCriter.Data := CtrlSegregacao.ListaSegregaCriter;
  rdgRateio.Enabled            := not CtrlSegregacao.SegregaVirtual;
  dblkRateioPlanoPatro.Enabled := not CtrlSegregacao.SegregaVirtual;
  dblkSegregacao.Enabled       := CtrlSegregacao.SegregaVirtual;
  cboPrograma.Enabled := CtrlSegregacao.SegregaVirtual;

  // *** preenche combo plano de contabil ***
  CdsPlanoContabil.Data := CtrlContaContabil.ListPlanosContas(Sistema.IdEmpresa);

  // *** preeenche combo rateio por Plano/Patro ***
  cdsRateioPlanoPatro.Data := CtrlProcessaTotalPrev.ListaRatAdm;

  // *** preenche combo de moeda ***
  CdsMoeda.Data := ListTerceiros.ListMoeda;

  // *** preenche a combo de subgrupos ***
  CdsSubGrupo.Data := CtrlSubGrupo.ListSubGrupos(-1);

  // *** preenche grid centro de custo vazio ***
  CdsCCusto.Data := CtrlPlanoConta.ListCCustoCadContas(Sistema.IdEmpresa,-1,'');

  // *** preeenche grid de subcontas ***
  CdsSubConta.Data := CtrlPlanoConta.ListSubContaCadContas(Sistema.IdEmpresa,-1,'');

  //--------------------------------------------------
  iPlanoInicial                := CtrlContab.PlanoParam;
  cmContraPartida.Plano        := iPlanoInicial;
  cmContraPartida.Mascara      := Modulo.sMascaraContas;
  cmContraPartidaJuros.Plano   := iPlanoInicial;
  cmContraPartidaJuros.Mascara := Modulo.sMascaraContas;
  cmContaSegreg.Plano          := iPlanoInicial;
  cmContaSegreg.Mascara        := Modulo.sMascaraContas;

  // Alterado por Arnaldo V. Scarin em 24/08/2009
  // SOL: 122624 Kintana: 603582
  CMContaSegregFDOAdmCred.Plano   := iPlanoInicial;
  cmContaSegregFDOAdmCred.Mascara := Modulo.sMascaraContas;

  cmContaSegregFDOAdmDeb.Plano    := iPlanoInicial;
  cmContaSegregFDOAdmDeb.Mascara  := Modulo.sMascaraContas;


  //INICIO - MARCELO CARDOSO - SIG26555
  CMContaAglutinacao.Plano     := iPlanoInicial;
  CMContaAglutinacao.Mascara   := Modulo.sMascaraContas;
  //FIM - MARCELO CARDOSO - SIG26555


  //---------------------------------------------------

  // *** Atribui a máscara da conta contábil e o filtro de plano ao MontaSelect ***
  MontaSelect.Filtro.Add(CtrlPlanoConta.RetornaFiltroPlanoContas(CdsPlanoContabil.data));

  MontaSelectConta.Mascaras[0] := modulo.sMascaraContas + ';0; ';
  MontaSelectConta.Filtro.Add('PLANOCONTA.PLANO = ' + IntToStr(CtrlContab.PlanoParam));

  BuscaMascaraConta(modulo.sMascaraContas);

  TFloatField(CdsContasxCC.FieldByName('CODEXTERNO')).EditMask  := ParamIntegra.MascaraCC + ';0;';
  TFloatField(CdsCCusto.FieldByName('CODEXTERNO')).editMask     := ParamIntegra.MascaraCC + ';0;';


  // colocar o plano de contas atual como default
  MontaSelect.ItemsBusca.Clear;
  for i:=0 to (MontaSelect.Colunas.Count)-1  do begin
    if MontaSelect.Colunas[i] = 'PLANOCONTA.PLANO' then
      MontaSelect.ItemsBusca.Add(inttostr(ParamIntegra.Plano))
    else
      MontaSelect.ItemsBusca.add('');
  end;

  //edtContaExtracontab.EditMask :=  '!' + modulo.sMascaraContas + ';1; ';//Cássio Rovaroto - SIG nº 115126

  SqlPrograma.Prepare;
  SqlPrograma.Open;

end;


procedure TfrmCadContasContabMT.pgCtrlChange(Sender: TObject);
begin
  inherited;

  If pgCtrl.ActivePage = TabSheet2 Then
  Begin
     If not bArvoreMontada Then
     Begin
         // *** Monta a árvore do plano de contas ***
         screen.cursor := crHourglass;
         treePlano.mascara := modulo.sMascaraContas;

         CdsTreeContas.Data := CtrlContaContabil.ListContas(CtrlContab.PlanoParam,tcambasC,True,'');

         treePlano.MontaArvore;
         screen.cursor := crDefault;
         bArvoreMontada := True;
     End;
   End;

end;

procedure TfrmCadContasContabMT.grdCCustoTopRowChanged(Sender: TObject);
begin
  inherited;
   //Acerta as cores quando muda a linha da grid
   grdCCusto.invalidate;

end;

procedure TfrmCadContasContabMT.dbeCodigoExit(Sender: TObject);
begin
   inherited;
   If Cds.State in [DsInsert] Then
   Begin
      sPai                 := '';
      bSair                := false;
      iGrau                := 0;

      If Trim(dbeCodigo.text) <> '' Then
      Begin
         iGrau := FuncaoGeral.CalcGrau(CdsPlanoContabil.FieldByName('MASCARA').AsString, Trim(dbeCodigo.text));
         If iGrau = 0 Then
         Begin
            MsgDlg('Código da Conta incompatível com a máscara.','Aviso',mtWarning,[mbOk],0);
            dbeCodigo.text := '';
            bSair := true;
         End;
         sPai     := Trim(trim(dbeCodigo.text));
         iGrauPai := iGrau -1;
         iNumEleC := FuncaoGeral.CalcNumEleGrau(Trim(CdsPlanoContabil.FieldByName('MASCARA').AsString),iGrauPai);
         sPai     := Copy(Trim(dbeCodigo.text),1,iNumEleC);
      End;

      If Not bSair Then
      Begin
         // Verifica se conta já está cadastrada
         If dblkPlanoContabil.LookupValue <> '' Then
         Begin
            If CtrlPlanoConta.ContaExiste(StrToInt(dblkPlanoContabil.LookupValue),Espaco(trim(dbeCodigo.text),18)) Then
            Begin
               MsgDlg('Conta já cadastrada.','Aviso',mtWarning,[mbOk],0);
               dbeCodigo.text := '';
               bSair := true;
            End;
         End Else
         Begin
            If dblkPlanoContabil.CanFocus then
               dblkPlanoContabil.SetFocus;
         End;
      End;

      grpTipo.ItemIndex  := 0;
      grpTipo.Value      := 'S';
      chkOrdAlf.Enabled  := true;
      bEnabled           := true;
      Cds.FieldByName('PLATIPO').asString  := 'S';

      If (Not bSair) And (iGrau > 1) Then
      Begin
         // Verifica se conta pai é sintética
         If dblkPlanoContabil.LookupValue <> '' Then
         Begin
            If Not CtrlPlanoConta.ContaExiste(StrToInt(dblkPlanoContabil.LookupValue),Trim(sPai)) Then
            Begin
               //Não tem pai
               MsgDlg('A conta digitada não tem pai.','Aviso',mtWarning,[mbOk],0);
               dbeCodigo.text := '';
               bSair := true;
            End Else
            Begin
               // pai é analítico
               If CtrlPlanoConta.TipoConta = 'A' Then
               Begin
                  MsgDlg('A Conta Pai da conta digitada é Analítica.','Aviso',mtWarning,[mbOk],0);
                  dbeCodigo.text := '';
                  bSair := true;
               End;
            End;
         End Else
         Begin
            If dblkPlanoContabil.CanFocus Then
               dblkPlanoContabil.SetFocus;
         End;
      End;

      If bSair Then
      Begin
        dbeCodigo.Text := '';
        dbeCodigo.SetFocus;
        exit;
      End;

      dbeGrau.text := IntToStr(iGrau);
      Cds.FieldByName('PLAGRAU').asInteger := iGrau;

      If iGrau = FuncaoGeral.CalcGrauMax(CdsPlanoContabil.FieldByName('MASCARA').AsString) Then
      Begin
         grpTipo.ItemIndex  := 1;
         grpTipo.Value      := 'A';
         chkOrdAlf.Enabled  := false;
         bEnabled           := false;
         Cds.FieldByName('PLATIPO').asString  := 'A';
      End Else
      Begin
         If iGrau = 1 Then
         Begin
            grpTipo.ItemIndex  := 0;
            grpTipo.Value      := 'S';
            chkOrdAlf.Enabled  := true;
            bEnabled           := false;
            Cds.FieldByName('PLATIPO').asString  := 'S';
         End;
      End;

      chkCentCust.Enabled := not chkOrdAlf.Enabled;
      //grpTipo.Enabled     := bEnabled;  // Andre Imakawa - SIG 114544

      If sPai <> '' Then
      Begin
         CtrlPlanoConta.ContaExiste(StrToInt(dblkPlanoContabil.LookupValue),sPai);

         If CtrlPlanoConta.Grupo =  'E' Then
         Begin
            //cmbGrp.ItemIndex := 6;  //MARCELO CARDOSO - SIG26555
            cmbGrp.ItemIndex := 7;    //MARCELO CARDOSO - SIG26555
            cmbGrp.Enabled   := false;
            Cds.FieldByName('PLAGRUPO').AsString := 'E';
            cmbGrpExit(Self);
         End;
      End;
   End;

end;

procedure TfrmCadContasContabMT.cmbGrpExit(Sender: TObject);
begin
  inherited;
   If cmbGrp.Text <> '' Then
   Begin
      If Cds.State in [dsEdit, DsInsert] Then
      Begin
         case cmbGrp.itemindex of
            0: begin
                  dbeCodReduz.text := IntToStr(CtrlPlanoConta.CriaCodReduz(Sistema.IdEmpresa,'A'));
                  grpNatureza.itemIndex := 0;
                  Cds.FieldByName('PLANATUREZA').asString := 'D';
               end;
            1: begin
                  dbeCodReduz.text := IntToStr(CtrlPlanoConta.CriaCodReduz(Sistema.IdEmpresa,'P'));
                  grpNatureza.itemIndex := 1;
                  Cds.FieldByName('PLANATUREZA').asString := 'C';
               end;
            2: begin
                  dbeCodReduz.text := IntToStr(CtrlPlanoConta.CriaCodReduz(Sistema.IdEmpresa,'R'));
                  grpNatureza.itemIndex := 1;
                  Cds.FieldByName('PLANATUREZA').asString := 'C';
               end;
            3: begin
                  dbeCodReduz.text := IntToStr(CtrlPlanoConta.CriaCodReduz(Sistema.IdEmpresa,'D'));
                  grpNatureza.itemIndex := 0;
                  Cds.FieldByName('PLANATUREZA').asString := 'D';
               end;
            4: begin
                  dbeCodReduz.text := IntToStr(CtrlPlanoConta.CriaCodReduz(Sistema.IdEmpresa,'C'));
                  grpNatureza.itemIndex := 0;
                  Cds.FieldByName('PLANATUREZA').asString := 'D';
                 end;
            5: begin
                  dbeCodReduz.text := IntToStr(CtrlPlanoConta.CriaCodReduz(Sistema.IdEmpresa,'O'));
                  grpNatureza.itemIndex := 2;
                  Cds.FieldByName('PLANATUREZA').asString := 'N';
             end;
            6: begin
                  dbeCodReduz.text := IntToStr(CtrlPlanoConta.CriaCodReduz(Sistema.IdEmpresa,'E'));
                  grpNatureza.itemIndex := 2;
                  Cds.FieldByName('PLANATUREZA').asString := 'N';
               end;
            //INICIO - MARCELO CARDOSO - SIG26555
            7: begin
                  dbeCodReduz.text := IntToStr(CtrlPlanoConta.CriaCodReduz(Sistema.IdEmpresa,'S'));
                  grpNatureza.itemIndex := 1;
                  Cds.FieldByName('PLANATUREZA').asString := 'C';
               end;
            //FIM - MARCELO CARDOSO - SIG26555
         end;

         lblDigito.Caption := '- ' + copy(dbeCodReduz.Text, Length(dbeCodReduz.Text),1);
         Cds.FieldByName('PLAREDUZ').asInteger := StrToInt(dbeCodReduz.text);
      End;
   End;

end;

procedure TfrmCadContasContabMT.chkBloqueiaClick(Sender: TObject);
begin
  inherited;
   if chkBloqueia.checked = true then begin
      dteBloqueada.enabled := true;
      dteBloqueada.color   := clWindow;
   end else begin
      dteBloqueada.enabled := false;
      dteBloqueada.color   := clBtnFace;
   end;

end;

procedure TfrmCadContasContabMT.btnSistetizaClick(Sender: TObject);
begin
  inherited;
  treePlano.FullCollapse;

end;

procedure TfrmCadContasContabMT.btnExpandeClick(Sender: TObject);
begin
  inherited;
   treePlano.FullExpand;

end;

procedure TfrmCadContasContabMT.FormShow(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled := true;

   if dbeCodigo.CanFocus then
      dbeCodigo.SetFocus;

   pgCtrl.ActivePage := TabSheet1;

   //Verifica o Tipo da Empresa Proprietária
   If CtrlPlanoConta.VerificaTipoEmpresa(Sistema.IdEmpresa) Then
      If CtrlPlanoConta.TipoEmpresa = 'P' Then
      Begin
        chkContaPadrao.visible := true;
        chkContaPadrao.enabled := true;
      End;


   If CtrlContab.Correspond = 'S' Then Begin
      dbeCorresp.Enabled := true;
      dbeCorresp.Color   := clWindow;
   End Else Begin
      dbeCorresp.Enabled := false;
      dbeCorresp.Color   := clBtnFace;
   End;


   If CtrlContab.SubGrp1 <> '' Then
      lblsub1.Caption := CtrlContab.SubGrp1;

   If CtrlContab.SubGrp2 <> '' Then
      lblsub2.Caption := CtrlContab.SubGrp2;

   If CtrlContab.SubGrp3 <> '' Then
      lblsub3.Caption := CtrlContab.SubGrp3;

   If CtrlContab.SubGrp4 <> '' Then
      lblsub4.Caption := CtrlContab.SubGrp4;

   //------------------------------------------------------
   If CtrlContab.MoedaOficial = 0 Then
      dbcmbTipOfi.enabled := false
   Else
      If CtrlContab.RetornaSiglaMoeda(CtrlContab.MoedaOficial) Then
         label10.caption := 'Moeda Oficial (' + CtrlContab.SiglaMoeda  + ')';
   //------------------------------------------------------
   If CtrlContab.MoedaGerencial = 0 Then
      dbcmbTipGer.enabled := false
   Else
      If CtrlContab.RetornaSiglaMoeda(CtrlContab.MoedaGerencial) Then
         label11.caption := 'Moeda Gerencial 1 (' + CtrlContab.SiglaMoeda + ')';
   //------------------------------------------------------
   If CtrlContab.MoedaGeren1 = 0 Then
      dbcmbTipGer2.enabled := false
   Else
      If CtrlContab.RetornaSiglaMoeda(CtrlContab.MoedaGeren1) Then
         label9.caption := 'Moeda Gerencial 2 (' + CtrlContab.SiglaMoeda + ')';
   //------------------------------------------------------
   If CtrlContab.MoedaGeren2 = 0 Then
      dbcmbTipGer3.enabled := false
   Else
      If CtrlContab.RetornaSiglaMoeda(CtrlContab.MoedaGeren2) Then
         label12.caption := 'Moeda Gerencial 3 (' + CtrlContab.SiglaMoeda + ')';

  // Alterado por Arnaldo V. Scarin em 24/08/2009
  // SOL: 122624 Kintana: 603582
  chkUsoExcPga.Checked := False;

end;

procedure TfrmCadContasContabMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContaContabil.free;
  CtrlPlanoConta.free;
  CtrlContab.free;
  CtrlProcessaTotalPrev.Free;
  ListTerceiros.free;
  CtrlSubGrupo.free;
end;

procedure TfrmCadContasContabMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbeCodigo.enabled         := true;
   dblkPlanoContabil.Enabled := true;

   cmContraPartida.Plano        := iPlanoInicial;
   cmContraPartida.Mascara      := Modulo.sMascaraContas;
   cmContraPartidaJuros.Plano   := iPlanoInicial;
   cmContraPartidaJuros.Mascara := Modulo.sMascaraContas;

   cmContaSegreg.Plano          := iPlanoInicial;
   cmContaSegreg.Mascara        := Modulo.sMascaraContas;

   // Alterado por Arnaldo V. Scarin em 24/08/2009
   // SOL: 122624 Kintana: 603582
   CMContaSegregFDOAdmCred.Plano   := iPlanoInicial;
   cmContaSegregFDOAdmCred.Mascara := Modulo.sMascaraContas;
   cmContaSegregFDOAdmDeb.Plano    := iPlanoInicial;
   cmContaSegregFDOAdmDeb.Mascara  := Modulo.sMascaraContas;

   //INICIO - MARCELO CARDOSO - SIG26555
   CMContaAglutinacao.Plano     := iPlanoInicial;
   CMContaAglutinacao.Mascara   := Modulo.sMascaraContas;
   //FIM - MARCELO CARDOSO - SIG26555


   Cds.FieldByName('PLANO').asInteger             := iPlanoInicial;
   Cds.FieldByName('IDUSUARIOINCLUSAO').asInteger := sistema.idUsuario;
   Cds.FieldByName('PLATIPO').asString            := 'S';
   Cds.FieldByName('PLANATUREZA').asString        := 'D';
   Cds.FieldByName('PLAORDALF').asString          := 'N';
   Cds.FieldByName('PLACCUST').asString           := 'N';
   Cds.FieldByName('PLAALTERA').asString          := 'S';
   Cds.FieldByName('PLAINATIVA').asString         := 'A';
   Cds.FieldByName('PLACONCILIA').asString        := 'N';
   Cds.FieldByName('PLAIMPRELATEVOL').asString    := 'S';
   Cds.FieldByName('PLASUBCONTA').asString        := 'N';
   Cds.FieldByName('PLASUMARIZA').asString        := 'N';
   Cds.FieldByName('PLAMUTACOES').asString        := 'N';
   Cds.FieldByName('PLABLOQUE').asString          := 'N';
   Cds.FieldByName('PLASECRETARIA').asString      := 'N';
   Cds.FieldByName('PLARATEIOAP').asString        := 'S';
   Cds.FieldByName('PLATIPCONVOFICIAL').asString  := 'N';
   Cds.FieldByName('PLATIPCONVGER').asString      := 'N';
   Cds.FieldByName('PLATIPCONVGEREN1').asString   := 'N';
   Cds.FieldByName('PLATIPCONVGEREN2').asString   := 'N';
   Cds.FieldByName('FLGUSOEXCPGA').AsString       := 'N';

   BuscaMascaraConta(modulo.sMascaraContas);

   // Alterado por Arnaldo V. Scarin em 24/08/2009
   // SOL: 122624 Kintana: 603582
   chkUsoExcPga.Checked := False;


   dbeCodigo.SetFocus;
   //Cássio Rovaroto - SIG nº 115126 - Início
   //edtContaExtracontab.EditMask := '!' + modulo.sMascaraContas + ';1; ';
   edtContaExtracontab.Enabled := True;
   //Cássio Rovaroto - SIG nº 115126 - Fim

end;

procedure TfrmCadContasContabMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  If MontaSelect.RetornouValor Then
  Begin
    //Se houve busca, abre a query principal apenas com o registro buscado
    Cds.Data := CtrlPlanoConta.ListCdsPlanoContas(StrToInt(MontaSelect.ValoresChave[0]),Espaco(MontaSelect.ValoresChave[1],18));
    // Alterado por Arnaldo V. Scarin em 24/08/2009
    // SOL: 122624 Kintana: 603582
    chkUsoExcPga.Checked := Cds.FieldByName('FLGUSOEXCPGA').AsString = 'S';    

    edtContaExtracontab.Text := Cds.FieldByName('PLAEXTRACONTABIL').AsString;//Cássio Rovaroto - SIG nº 115126
  End;

  lblDigito.Caption := '- ' + Copy(Cds.FieldByName('PLAREDUZ').asString,
                               length(Cds.FieldByName('PLAREDUZ').asString),1);

  BuscaMascaraConta(Cds.FieldByName('MASCARA').asString);
  VerificaContaxCC(Cds.FieldByName('PLACONTA').asString,Cds.FieldByName('PLANO').asInteger);

end;

procedure TfrmCadContasContabMT.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   If dblkPlanoContabil.LookupValue <> '' Then
      iPlanoInicial := StrToInt(dblkPlanoContabil.LookupValue);
   pgCtrl.ActivePage := TabSheet1;
   lblDigito.caption := '';

end;

procedure TfrmCadContasContabMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dblkPlanoContabil.Enabled := false;
   dbeCodigo.enabled := false;
   if dbeDescPort.CanFocus then dbeDescPort.SetFocus;
   edtContaExtracontab.Enabled := True; //Cássio Rovaroto - SIG nº 115126
end;


procedure TfrmCadContasContabMT.VerificaContaxCC(sConta: string;iPlano: Integer);
begin

   If chkCentCust.checked Then
   Begin
      grdContasxCC.DataSource := dsContasxCC;
      btnVaiTodos.enabled   := true;
      btnVaiUm.enabled      := true;
      btnVoltaTodos.enabled := true;
      btnVoltaUm.enabled    := true;
      grdContasxCC.enabled  := true;
      grdContasxCC.color    := clWindow;

      //---recarrega cdsContasxCC---
      CdsContasxCC.Data := CtrlContaContabil.ListContasxCC(iPlano,Sistema.IdEmpresa,sConta,'',tccAmbasCC,toNome);

      //---recarrega cdsCCusto----
      CdsCCusto.Data := CtrlPlanoConta.ListCCustoCadContas(Sistema.IdEmpresa,iPlano,sConta);

   End Else
   Begin
      btnVaiTodos.enabled   := false;
      btnVaiUm.enabled      := false;
      btnVoltaTodos.enabled := false;
      btnVoltaUm.enabled    := false;
      grdContasxCC.enabled  := false;
      grdContasxCC.color    := clBtnFace;

   End;



end;

procedure TfrmCadContasContabMT.VerificaContaxSC(sConta: string;iPlano: Integer);
begin
   If chkSubconta.checked Then
   Begin
      grdContasxSC.DataSource := dsContasxSC;
      btnVaiTodos2.enabled    := true;
      btnVaiUm2.enabled       := true;
      btnVoltaTodos2.enabled  := true;
      btnVoltaUm2.enabled     := true;
      grdContasxSC.enabled    := true;
      grdContasxSC.color      := clWindow;

      //--- recarrega CdsContasxSC ----
      CdsContasxSC.Data := CtrlContaContabil.ListContasxSC(iPlano,Sistema.IdEmpresa,0,sConta,toNome);

      //--- recarrega CdsSubConta ----
      CdsSubConta.Data := CtrlPlanoConta.ListSubContaCadContas(Sistema.IdEmpresa,iPlano,sConta);

   End Else
   Begin
      btnVaiTodos2.enabled   := false;
      btnVaiUm2.enabled      := false;
      btnVoltaTodos2.enabled := false;
      btnVoltaUm2.enabled    := false;
      grdContasxSC.enabled  := false;
      grdContasxSC.color    := clBtnFace;
   end;

end;


procedure TfrmCadContasContabMT.dblkPlanoContabilCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  BuscaMascaraConta(CdsPlanoContabil.FieldByName('MASCARA').AsString);
end;

procedure TfrmCadContasContabMT.BuscaMascaraConta(sMascara:String);
begin
   sMascPict := sMascara + ';0; ';
   TFloatField(Cds.FieldByName('PLACONTA')).editMask  := sMascPict;
   edtContaExtracontab.EditMask := sMascPict;
   cmContraPartida.Plano        := Cds.FieldByName('PLANO').AsInteger;
   cmContraPartida.Mascara      := sMascara;
   cmContraPartidaJuros.Plano   := Cds.FieldByName('PLANO').AsInteger;
   cmContraPartidaJuros.Mascara := sMascara;
   cmContaSegreg.Plano          := Cds.FieldByName('PLANO').AsInteger;
   cmContaSegreg.Mascara        := sMascara;

   // Alterado por Arnaldo V. Scarin em 24/08/2009
   // SOL: 122624 Kintana: 603582
   cmContaSegregFDOAdmCred.Plano   := Cds.FieldByName('PLANO').AsInteger;
   cmContaSegregFDOAdmCred.Mascara := sMascara;
   cmContaSegregFDOAdmDeb.Plano    := Cds.FieldByName('PLANO').AsInteger;
   cmContaSegregFDOAdmDeb.Mascara  := sMascara;

   //INICIO - MARCELO CARDOSO - SIG26555
   CMContaAglutinacao.Plano        := Cds.FieldByName('PLANO').AsInteger;
   CMContaAglutinacao.Mascara      := sMascara;
   //FIM - MARCELO CARDOSO - SIG26555
end;

procedure TfrmCadContasContabMT.grpTipoClick(Sender: TObject);
begin
  inherited;
  If grpTipo.ItemIndex = 0 Then
  Begin
      chkOrdAlf.Enabled   := true;
      chkCentCust.Enabled := false;
  End Else
  Begin
      chkOrdAlf.Enabled   := false;
      chkCentCust.Enabled := true;
  End;

end;


procedure TfrmCadContasContabMT.chkCentCustClick(Sender: TObject);
begin
  inherited;
   VerificaContaxCC(Cds.FieldByName('PLACONTA').asString,Cds.FieldByName('PLANO').asInteger);
end;

procedure TfrmCadContasContabMT.chkSubcontaClick(Sender: TObject);
begin
  inherited;
  VerificaContaxSC(Cds.FieldByName('PLACONTA').asString,Cds.FieldByName('PLANO').asInteger);

end;

procedure TfrmCadContasContabMT.btnVaiTodosClick(Sender: TObject);
var varCampos: variant;
begin
  inherited;
   CdsCCusto.DisableControls;
   screen.cursor := crSQLwait;
   CdsCCusto.First;
   while not CdsCCusto.eof do begin
      if CdsCCusto.FieldByName('STATUSGRUPOCDC').asString = 'A' then begin
         varCampos    := VarArrayCreate([0,3],varVariant);
         varCampos[0] := sistema.idEmpresa;
         varCampos[1] := Cds.FieldByName('PLANO').asInteger;
         varCampos[2] := trim(Cds.FieldByName('PLACONTA').asString);
         varCampos[3] := trim(CdsCCusto.FieldByName('CODCENTROCUSTO').asString);

         with CdsContasxCC do begin
            if not Locate('IDEMPRESA;PLANO;PLACONTA;CODCENTROCUSTO',varCampos,[]) then begin
               Insert;
               FieldByName('IDEMPRESA').asInteger         := sistema.idEmpresa;
               FieldByName('IDUSUARIOINCLUSAO').asInteger := sistema.idUsuario;
               FieldByName('PLANO').asInteger             := Cds.FieldByName('PLANO').asInteger;
               FieldByName('PLACONTA').asString           := trim(Cds.FieldByName('PLACONTA').asString);
               FieldByName('CODCENTROCUSTO').asString     := Espaco(trim(CdsCCusto.FieldByName('CODCENTROCUSTO').asString),10);

               FieldByName('CODEXTERNO').AsString         := Espaco(trim(CdsCCusto.FieldByName('CODEXTERNO').asString),10);

               FieldByName('NOME').asString               := CdsCCusto.FieldByName('NOME').asString;
               Post;
            end;
         end;
         CdsCCusto.Delete;
      end else begin
         CdsCCusto.Next;
      end;
   end;

   CdsCCusto.EnableControls;

   screen.cursor := crDefault;

end;

procedure TfrmCadContasContabMT.btnVaiUmClick(Sender: TObject);
var varCampos: variant;
begin
  inherited;
   if CdsCCusto.FieldByName('STATUSGRUPOCDC').asString = 'S' then begin
      MsgDlg('Centros de Custo Sintéticos não podem ser relacionados a Contas Contábeis.','Aviso',mtWarning,[mbOK],0);
   end else begin
      screen.cursor := crSQLWait;

      varCampos    := VarArrayCreate([0,3],varVariant);
      varCampos[0] := sistema.idEmpresa;
      varCampos[1] := Cds.FieldByName('PLANO').asInteger;
      varCampos[2] := trim(Cds.FieldByName('PLACONTA').asString);
      varCampos[3] := trim(CdsCCusto.FieldByName('CODCENTROCUSTO').asString);

      with CdsContasxCC do begin
         if not Locate('IDEMPRESA;PLANO;PLACONTA;CODCENTROCUSTO',varCampos,[]) then begin
            Insert;
            FieldByName('IDEMPRESA').asInteger         := sistema.idEmpresa;
            FieldByName('IDUSUARIOINCLUSAO').asInteger := sistema.idUsuario;
            FieldByName('PLANO').asInteger             := Cds.FieldByName('PLANO').asInteger;
            FieldByName('PLACONTA').asString           := trim(Cds.FieldByName('PLACONTA').asString);
            FieldByName('CODCENTROCUSTO').asString     := Espaco(trim(CdsCCusto.FieldByName('CODCENTROCUSTO').asString),10);

            FieldByName('CODEXTERNO').AsString         := Espaco(trim(CdsCCusto.FieldByName('CODEXTERNO').asString),10);

            FieldByName('NOME').asString               := CdsCCusto.FieldByName('NOME').asString;
            Post;
         end;
      end;
      with CdsCCusto do begin
         if Locate('CODCENTROCUSTO',varCampos[3],[]) then begin
            Delete;
         end;
      end;
      screen.cursor := crDefault;
   end;

end;

procedure TfrmCadContasContabMT.btnVoltaUmClick(Sender: TObject);
var varCampos: variant;
begin
  inherited;
   screen.cursor := crSQLWait;

   varCampos    := VarArrayCreate([0,3],varVariant);
   varCampos[0] := sistema.idEmpresa;
   varCampos[1] := Cds.FieldByName('PLANO').asInteger;
   varCampos[2] := trim(Cds.FieldByName('PLACONTA').asString);
   varCampos[3] := trim(CdsContasxCC.FieldByName('CODCENTROCUSTO').asString);

   with CdsCCusto do begin
      if CdsContasxCC.Locate('IDEMPRESA;PLANO;PLACONTA;CODCENTROCUSTO',varCampos,[]) then begin
         if not Locate('CODCENTROCUSTO',varCampos[3],[]) then begin
            Insert;
            FieldByName('CODCENTROCUSTO').asString     := trim(CdsContasxCC.FieldByName('CODCENTROCUSTO').asString);
            FieldByName('NOME').asString               := CdsContasxCC.FieldByName('NOME').asString;
            FieldByName('STATUSGRUPOCDC').asString     := 'A';
            Post;
         end;
         CdsContasxCC.Delete;
      end;
   end;

   screen.cursor := crDefault;

end;

procedure TfrmCadContasContabMT.btnVoltaTodosClick(Sender: TObject);
begin
  inherited;
   if MsgDlg('Deseja REALMENTE excluir todos os Centros de Custo relacionados a Conta Contábil?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
      screen.cursor := crSQLwait;

      with CdsContasxCC do begin
         First;
         while not eof do begin
            CdsCCusto.Insert;
            CdsCCusto.FieldByName('CODCENTROCUSTO').asString     := Trim(CdsContasxCC.FieldByName('CODCENTROCUSTO').asString);
            CdsCCusto.FieldByName('NOME').asString               := CdsContasxCC.FieldByName('NOME').asString;
            CdsCCusto.FieldByName('STATUSGRUPOCDC').asString     := 'A';
            CdsCCusto.Post;
            //
            Delete;
         end;
      end;

      screen.cursor := crDefault;
   end;

end;

procedure TfrmCadContasContabMT.btnVaiTodos2Click(Sender: TObject);
begin
   inherited;


   //========================================================================
   // Rotina nova refeita para agilizar a gravação das subcontas de uma conta
   //========================================================================

   CdsSubConta.DisableControls;
   CdsContasxSC.DisableControls;
   screen.cursor := crSQLwait;

   CdsSubConta.First;
   while Not CdsSubConta.Eof do
   Begin
      With CdsContasxSC do
      Begin
         Append;
         FieldByName('IDPESSOA').asInteger    := sistema.idEmpresa;
         FieldByName('IDUSUARIO').asInteger   := sistema.idUsuario;
         FieldByName('PLANO').asInteger       := Cds.FieldByName('PLANO').asInteger;
         FieldByName('PLACONTA').asString     := trim(Cds.FieldByName('PLACONTA').asString);
         FieldByName('CODSUBCONTA').asInteger := CdsSubConta.FieldByName('CODSUBCONTA').asInteger;
         FieldByName('NOMESUBCONTA').asString := CdsSubConta.FieldByName('NOMESUBCONTA').asString;
         Post;
      End;
      CdsSubConta.Delete;
   End;
   CdsContasxSC.First;
   CdsSubConta.EnableControls;
   CdsContasxSC.EnableControls;
   screen.cursor := crDefault;


end;

procedure TfrmCadContasContabMT.btnVaiUm2Click(Sender: TObject);
var varCampos: variant;
begin
   inherited;

   screen.cursor := crSQLWait;

   varCampos    := VarArrayCreate([0,3],varVariant);
   varCampos[0] := sistema.idEmpresa;
   varCampos[1] := Cds.FieldByName('PLANO').asInteger;
   varCampos[2] := trim(Cds.FieldByName('PLACONTA').asString);
   varCampos[3] := CdsSubConta.FieldByName('CODSUBCONTA').asInteger;

   with CdsContasxSC do begin
      if not Locate('IDPESSOA;PLANO;PLACONTA;CODSUBCONTA',varCampos,[]) then begin
         Append;
         FieldByName('IDPESSOA').asInteger    := sistema.idEmpresa;
         FieldByName('IDUSUARIO').asInteger   := sistema.idUsuario;
         FieldByName('PLANO').asInteger       := Cds.FieldByName('PLANO').asInteger;
         FieldByName('PLACONTA').asString     := trim(Cds.FieldByName('PLACONTA').asString);
         FieldByName('CODSUBCONTA').asInteger := CdsSubConta.FieldByName('CODSUBCONTA').asInteger;
         FieldByName('NOMESUBCONTA').asString := CdsSubConta.FieldByName('NOMESUBCONTA').asString;
         Post;
      end;
   end;
   with CdsSubConta do begin
      if Locate('CODSUBCONTA',varCampos[3],[]) then begin
         Delete;
      end;
   end;
   screen.cursor := crDefault;

end;

procedure TfrmCadContasContabMT.btnVoltaUm2Click(Sender: TObject);
var varCampos: variant;
begin
   inherited;

   screen.cursor := crSQLWait;

   varCampos    := VarArrayCreate([0,3],varVariant);
   varCampos[0] := sistema.idEmpresa;
   varCampos[1] := Cds.FieldByName('PLANO').asInteger;
   varCampos[2] := trim(Cds.FieldByName('PLACONTA').asString);
   varCampos[3] := CdsContasxSC.FieldByName('CODSUBCONTA').asInteger;

   with CdsSubConta do begin
      if CdsContasxSC.Locate('IDPESSOA;PLANO;PLACONTA;CODSUBCONTA',varCampos,[]) then begin
         if not Locate('CODSUBCONTA',varCampos[3],[]) then begin
            Append;
            FieldByName('CODSUBCONTA').asInteger := CdsContasxSC.FieldByName('CODSUBCONTA').asInteger;
            FieldByName('NOMESUBCONTA').asString := CdsContasxSC.FieldByName('NOMESUBCONTA').asString;
            Post;
         end;
         CdsContasxSC.Delete;
      end;
   end;

   screen.cursor := crDefault;

end;

procedure TfrmCadContasContabMT.btnVoltaTodos2Click(Sender: TObject);
begin
   inherited;
   if MsgDlg('Deseja REALMENTE excluir todas as Sub-Contas relacionadas a Conta Contábil?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then
   begin

      CdsSubConta.DisableControls;
      CdsContasxSC.DisableControls;

      screen.cursor := crSQLwait;

      with CdsContasxSC do begin
         First;
         while not eof do begin
            CdsSubConta.Append;
            CdsSubConta.FieldByName('CODSUBCONTA').asInteger := CdsContasxSC.FieldByName('CODSUBCONTA').asInteger;
            CdsSubConta.FieldByName('NOMESUBCONTA').asString := CdsContasxSC.FieldByName('NOMESUBCONTA').asString;
            CdsSubConta.Post;

            Delete;
         end;
      end;
      CdsSubConta.First;
      CdsSubConta.EnableControls;
      CdsContasxSC.EnableControls;
      screen.cursor := crDefault;
   end;

end;

procedure TfrmCadContasContabMT.grdSubContaCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   //Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.color := clwhite
         end else begin
            ABrush.Color := $00C0FFFF; //Amarelo Bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;

end;

procedure TfrmCadContasContabMT.grdSubContaTopRowChanged(Sender: TObject);
begin
  inherited;
   grdSubConta.invalidate;

end;

procedure TfrmCadContasContabMT.grdContasxSCCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   //Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.color := clwhite
         end else begin
            ABrush.Color := $00C0FFFF; //Amarelo Bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;

end;

procedure TfrmCadContasContabMT.grdContasxSCTopRowChanged(Sender: TObject);
begin
  inherited;
  grdContasxSC.invalidate;

end;

procedure TfrmCadContasContabMT.grdCCustoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   //Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.color := clwhite
         end else begin
            ABrush.Color := $00C0FFFF; //Amarelo Bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;

end;

procedure TfrmCadContasContabMT.grdContasxCCCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   //Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.color := clwhite
         end else begin
            ABrush.Color := $00C0FFFF; //Amarelo Bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;

end;

procedure TfrmCadContasContabMT.grdContasxCCTopRowChanged(Sender: TObject);
begin
  inherited;
   //Acerta as cores quando muda a linha da grid
   grdContasxCC.invalidate;

end;

procedure TfrmCadContasContabMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlPlanoConta.Gravar;
  Cds.EnableControls;

end;

procedure TfrmCadContasContabMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var  sTipo : string;
begin
  inherited;
  //Faz a verificação do preenchimento dos campos
  If Cds.State in [dsEdit, DsInsert] Then
  Begin

    if (dbeCodigo.Text = '') then begin
       pgCtrl.ActivePage := TabSheet1;
       MsgDlg('Código da Conta Contábil não informado.','Erro',mtError,[mbOk],0);
       dbeCodigo.SetFocus;
       Accept := False;
       Exit;
    end;
    if (dblkPlanoContabil.Text = '') then begin
       pgCtrl.ActivePage := TabSheet1;
       MsgDlg('Plano Contábil ao qual a Conta pertence não informado.','Erro',mtError,[mbOk],0);
       dblkPlanoContabil.SetFocus;
       Accept := False;
       Exit;
    end;
    if (cmbGrp.text = '') then begin
       pgCtrl.ActivePage := TabSheet1;
       MsgDlg('Grupo da Conta não selecionado.','Erro',mtError,[mbOk],0);
       cmbGrp.SetFocus;
       Accept := False;
       Exit;
    end;
    if (dbeDescPort.Text = '') then begin
       pgCtrl.ActivePage := TabSheet1;
       MsgDlg('Nome da Conta não informado.','Erro',mtError,[mbOk],0);
       dbeDescPort.SetFocus;
       Accept := False;
       Exit;
    end;

    if (Cds.FieldByName('PLACCUST').AsString = 'S') and (CdsContasxCC.isEmpty) then begin
       pgCtrl.ActivePage := TabSheet4;
       MsgDlg('Conta obriga Centro de Custo. Obrigatório indicar os centros de custo vinculados a esta conta.','Erro',mtError,[mbOk],0);
       if grdCCusto.CanFocus then grdCCusto.SetFocus;
       Accept := False;
       Exit;
    end;
    if (Cds.FieldByName('PLASUBCONTA').AsString = 'S') and (CdsContasxSC.isEmpty) then begin
       pgCtrl.ActivePage := TabSheet5;
       MsgDlg('Conta obriga Subconta. Obrigatório indicar as subcontas vinculadas a esta conta.','Erro',mtError,[mbOk],0);
       if grdSubConta.CanFocus then grdSubConta.SetFocus;
       Accept := False;
    end;

     if Cds.FieldByName('PLATIPCONVGER').AsString = '' then
        Cds.FieldByName('PLATIPCONVGER').AsString := 'N';

     if Cds.FieldByName('PLATIPCONVGEREN1').AsString = '' then
        Cds.FieldByName('PLATIPCONVGEREN1').AsString := 'N';

     if Cds.FieldByName('PLATIPCONVGEREN2').AsString = '' then
        Cds.FieldByName('PLATIPCONVGEREN2').AsString := 'N';

     if Cds.FieldByName('PLATIPCONVOFICIAL').AsString = '' then
        Cds.FieldByName('PLATIPCONVOFICIAL').AsString := 'N';

     sTipo := Cds.FieldByName('PLAGRUPO').asString;
     Cds.FieldByName('PLAEXTRACONTABIL').asString := Trim(RemoveChar('.', edtContaExtracontab.Text)); //Cássio Rovaroto - SIG nº 115126
   End;

   Accept := VerificaPreenchimento;


   //atualiza paramcontab
   If Cds.State in [dsInsert] Then
   Begin
      if not CtrlPlanoConta.GravaCodReduz(Sistema.IdEmpresa,sTipo) then
      begin
        MsgDlg(CtrlPlanoConta.MessageInfo,'Erro',mtError,[mbOK],0);
        Accept := False;
        Abort;
      end;
   End;
end;

procedure TfrmCadContasContabMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept :=  CtrlPlanoConta.Gravar;
  Cds.EnableControls;
end;

procedure TfrmCadContasContabMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  Cds.Data := CtrlPlanoConta.ListCdsPlanoContas(Cds.FieldByName('PLANO').asInteger,Cds.FieldByName('PLACONTA').asString);
  edtContaExtracontab.Text := Cds.FieldByName('PLAEXTRACONTABIL').AsString;//Cássio Rovaroto - SIG nº 115126
end;

procedure TfrmCadContasContabMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPlanoConta.MessageInfo <> '' Then
     MsgDlg(CtrlPlanoConta.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadContasContabMT.CmeCadastroDelete(Sender: TObject);
begin
   // Marilza Colpani 06/04/2009 N.Sol 112861/N.Kintana 523260
   //verifica se existe saldo implantado para a Conta
   //verificação retirada.
   {If CtrlPlanoConta.ContaTemSaldo(Sistema.IdEmpresa,Cds.FieldByName('PLANO').asInteger,Cds.FieldByName('PLACONTA').asString) Then
   Begin
      MsgDlg('Esta Conta contém Saldos. Exclusão cancelada.','Aviso',mtWarning,[mbOk],0);
      Abort;
   End;  }

   //verifica se existe lancamento para a Conta
   If CtrlPlanoConta.ContaTemLancamento(Sistema.IdEmpresa,Cds.FieldByName('PLANO').asInteger,Cds.FieldByName('PLACONTA').asString) Then
   Begin
      MsgDlg('Esta Conta contém Lançamentos. Exclusão cancelada.','Aviso',mtWarning,[mbOk],0);
      Abort;
   End;   

   //verifica se a conta possui filhos
   //Marilza
   If CtrlPlanoConta.ContaTemOutrosFilhos(Cds.FieldByName('PLANO').asInteger,Trim(Cds.FieldByName('PLACONTA').asString)) Then
   Begin
     // Marilza Colpani 06/04/2009 N.Sol 112861/N.Kintana 523260
     // Se a conta  possuir registro "filho" apagar o saldo da tabela PLANOSALDO
     // e a conta posteriormente.
      If CtrlPlanoConta.NumRegistro > 0 Then
      Begin
        If MessageDlg(' Existem contas vinculadas a essa conta, sendo elas: ' + CtrlPlanoConta.ContasFilho + chr(13) + '. Deseja excluir a conta ' + CtrlPlanoConta.cdsPlanoConta.fieldvalues ['PLACONTA'] + ' ? ',MtInformation,[mbyes,mbno],0) = MrYes then
        begin
         CtrlPlanoConta.ApagarSaldo(Cds.FieldByName('PLANO').asInteger,Trim(Cds.FieldByName('PLACONTA').asString));
         CtrlPlanoConta.Apagar;
        end;
      End;

   End;
   // Marilza Colpani 06/04/2009 N.Sol 112861/N.Kintana 523260
   // Se a conta não possuir registro "filho" apagar o saldo da tabela PLANOSALDO
   // e a conta posteriormente.

    If CtrlPlanoConta.NumRegistro = 0 Then
       begin
         CtrlPlanoConta.ApagarSaldo(Cds.FieldByName('PLANO').asInteger,Trim(Cds.FieldByName('PLACONTA').asString));
         CtrlPlanoConta.Apagar;
       end;

  //apaga os filhos
  CdsContasxSC.First;
  While Not CdsContasxSC.Eof Do
  Begin
      CdsContasxSC.Delete;
  End;

  CdsContasxCC.First;
  While Not CdsContasxCC.Eof Do
  Begin
      CdsContasxCC.Delete;
  End;


 //--- Efetiva a remocao dos Registros ----
 inherited;

end;

procedure TfrmCadContasContabMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept :=  CtrlPlanoConta.Apagar;
  edtContaExtracontab.Text := EmptyStr; //Cássio Rovaroto - SIG nº 115126
  Cds.EnableControls;
end;

procedure TfrmCadContasContabMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data  := CtrlPlanoConta.ListCdsPlanoContas(-1,'');
  BuscaMascaraConta(modulo.sMascaraContas);

  // Alterado por Arnaldo V. Scarin em 24/08/2009
  // SOL: 122624 Kintana: 603582
  chkUsoExcPga.Checked := False;

  CdsContasxSC.Data := CtrlContaContabil.ListContasxSC(-1,Sistema.IdEmpresa,0,'',toNome);

  CdsContasxCC.Data := CtrlContaContabil.ListContasxCC(-1,Sistema.IdEmpresa,'','',tccAmbasCC,toNome);

  pgCtrl.ActivePage := TabSheet1;

end;

// Checar critério para segregação
function TfrmCadContasContabMT.VerificaPreenchimento: boolean;
var
  sPlanoconta: string;
  iIdSegregaCriter, iIdPrograma: integer;
begin
  Result := False;
  try

    if CtrlSegregacao.SegregaVirtual then begin
      // verificar critérios cadastrados para os pais e filhas da conta
      if not Cds.FieldByName('IDSEGREGACRITER').IsNull then begin

        sPlanoconta := Cds.FieldByName('PLACONTA').AsString;
        iIdSegregaCriter := CtrlSegregacao.ConflitoSegregaCriter(Cds.FieldByName('PLANO').AsInteger, Cds.FieldByName('PLACONTA').AsString, sPlanoconta);

        if iIdSegregaCriter > 0 then
          raise EValidacao.CreateVal('Encontrado conflito no Critério para Segregação!'+#13+'Conta: '+ sPlanoconta, dblkSegregacao);

      end;

      // testar se o programa foi cadastrado em uma outra árvore da conta
      if not Cds.FieldByName('IDPROGRAMA').IsNull then begin
        iIdPrograma := CtrlSegregacao.ConflitoPrograma (Cds.FieldByName('PLANO').AsInteger, Cds.FieldByName('PLACONTA').AsString, sPlanoconta);
        if iIdPrograma > 0 then
           raise EValidacao.CreateVal('Encontrado conflito no Programa!'+#13+'Conta: '+ sPlanoconta, cboPrograma);
      end;
    end;


  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

// Incluir as contas pai na consulta do montaselect
procedure TfrmCadContasContabMT.MontaSelectBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
begin
  inherited;
  rConsultaConta.PlaConta := strListParams.Values['PLANOCONTA.PLACONTA'];
  rConsultaConta.Plano    := StrToIntDef(strListParams.Values['PLANOCONTA.PLANO'], 0);
end;

procedure TfrmCadContasContabMT.MontaSelectAfterOpenCds(
  oCds: TClientDataSet);
var
  sContaAux, sMascara : string;
  i: integer;
begin
  inherited;
  // incluir as contas pai
  if (rConsultaConta.PlaConta <> '') and (rConsultaConta.Plano <> 0) and (not oCds.IsEmpty)  then begin
    sMascara := CtrlSegregacao.MascaraPlano (rConsultaConta.Plano);
    sContaAux := CtrlSegregacao.ContaPai (rConsultaConta.Plano, sMascara, rConsultaConta.PlaConta);
    while sContaAux <> '' do begin
      qryMontaSelect.Prepare;
      qryMontaSelect.ParamByName('PLACONTA').AsString := sContaAux;
      qryMontaSelect.ParamByName('PLANO').AsInteger := rConsultaConta.Plano;
      qryMontaSelect.Open;

      if not cdsMontaSelect.IsEmpty then begin
        oCds.Insert;
        for i:= 0 to cdsMontaSelect.FieldCount-1 do begin
          oCds.Fields[i]:= cdsMontaSelect.Fields[i];
        end;
        oCds.Post;
      end;

      sContaAux := CtrlSegregacao.ContaPai (rConsultaConta.Plano, sMascara, sContaAux);
    end;

    // PONTEIRAR A CONTA PARA A CONSULTADA
    oCds.Locate ('C0', rConsultaConta.PlaConta, [loCaseInsensitive]);
  end;
end;

procedure TfrmCadContasContabMT.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := true;
end;



end.



