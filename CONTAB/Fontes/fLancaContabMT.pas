unit fLancaContabMT;
(*==============================================================================
Analista : Rodolpho da Silva
Rotina   : CmeDetalheEdit
Data     : 16/11/2005
Pendência: 20695
Descrição: Corrigido o erro em que o sistema estava misturando o histórico da
           planilha que foi digitada anteriormente, com o histórico da próxima
           planilha que selecionada para fazer qualquer alteração de lançamento.
(*==============================================================================
Analista : Alex Pereira
Rotina   : Divs
Data     : 20-29/09/2004
Pendência: 17193
Solução  : Ajustando formulário para se adequar ao novo processo para segregação
           de recursos na origem.

Data     : 18/10/2004
Solução  : Ajustando form para se adequar ao plano de operações administrativas
==============================================================================*)
(*==============================================================================
Analista : André Tavares
Rotina   : CmeCadastroEdit, CmeCadastroFind, sbtnApagarClick
Data     : 18/05/2004
Pendência: 16733
Solução  : Exibir mensagem de alerta e perguntar se deseja realmente alterar ou
excluir o lançamento quando é de origem de outro módulo.
==============================================================================*)
(*==============================================================================
Analista : Marchetti
Rotina   : VerificaPreenchimentoDet
Data     : 02/04/2004
Pendência: 16345
Solução  : Verificar a existencia do relacionamento entre patro e plano no global
==============================================================================*)
(*==============================================================================
Analista : Alex Pereira
Data     : 07/01/04
Pendência: 14451 Nova estrutura para segregação
Solução  : Preparando tela para aceitar o novo processo de segregação.

Novos Metodos: ProcuraSegregaCriter
               VerificaPreenchimentoDet

Data     : 08/01/04
           RegraProvaZero
           Termino formulário com nova segreação

  Data         : 20/01/04
  Solução      : modificada a criação do uCtrlSegregacao
  
==============================================================================*)
(*==============================================================================
Analista : Alex Pereira
Data     : 06/01/04
Pendência: 14451 Nova estrutura para segregação

Métodos atualizados:

Pendentes: TFrmLancaContabMT.CmeDetalheConfirma ==> ProcessaContab.ProcessaLancamento

Solução  : Criar a estrutura IDSEGREGACRITER e DATASEGREGACRITER
           no lançamento contábil.

Métodos Removidos:

==============================================================================*)
//Atualizado em: 30/10/2003 - André Tavares - pendência 14915 :
//                            Inclusão dos filtros Plano previdenciário e Patrocinadora no Monta select

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,uCMSqlParams,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, TREdit, wwdblook, Mask, wwdbedit, fcLabel, MConnect,
  CMProcuraMask, CMProcura, uCtrlPeriodo, uCtrlProcessaContab,wwclient,
  DBCtrls, Wwdotdot, Wwdbcomb, uCtrlContaContabil,
  uCtrlLancamento, uCtrlContab, uCtrlHistoContab, uCtrlDemonstrativo, DBTables, Wwquery,
  Provider, CMDBLookupCombo, uCmControlObject,
  uCtrlListTerceiros, uCMTypes, uCtrlSegregacao, uVerificaPreenchimento, uCtrlPlanPrevContabPatro;


type
  TOperLanc = (olAguardando, olInsPlanilha, olAltPlanilha, olProPlanilha, olEstPlanilha,
               olExcPlanilha, olInsLancamento, olAltLancamento, olExcLancamento);

  TFrmLancaContabMT = class(TFrmCadastroMestreDetMT)
    sbtnEstorno: TToolbarButton97;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Label11: TLabel;
    Label28: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    dbeDocumento: TwwDBEdit;
    dblkHistorico: TwwDBLookupCombo;
    dblkTipoOper: TwwDBLookupCombo;
    dblkMutacoesPL: TwwDBLookupCombo;
    Panel6: TPanel;
    lbConvOfDeb: TLabel;
    lbConvG1Deb: TLabel;
    lbConvG2Deb: TLabel;
    lbConvG3Deb: TLabel;
    lblHistDeb: TLabel;
    SpeedButton1: TSpeedButton;
    Panel9: TPanel;
    fcLabel1: TfcLabel;
    Panel7: TPanel;
    lbConvOfCre: TLabel;
    lbConvG1Cre: TLabel;
    lbConvG2Cre: TLabel;
    lbConvG3Cre: TLabel;
    Label24: TLabel;
    SpeedButton2: TSpeedButton;
    Panel8: TPanel;
    fcLabel2: TfcLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label25: TLabel;
    dbedData: TCMDateTimePicker;
    dbedUsuario: TwwDBEdit;
    dbedSistema: TwwDBEdit;
    imgCredito: TImage;
    imgDebito: TImage;
    imgIgual: TImage;
    imgPlanilNaoEfet: TImage;
    imgPlanilEfetiva: TImage;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image1: TImage;
    Bevel2: TBevel;
    dbrDebito: TDBRealEdit;
    dbrCredito: TDBRealEdit;
    Label6: TLabel;
    Panel2: TPanel;
    lblCCustoDeb: TLabel;
    lblSubContaDeb: TLabel;
    dblkCCustoDeb: TwwDBLookupCombo;
    btnSubContaDeb: TBitBtn;
    Panel10: TPanel;
    Panel11: TPanel;
    fcLabel3: TfcLabel;
    Panel3: TPanel;
    lblCCustoCred: TLabel;
    lblSubContaCred: TLabel;
    dblkCCustoCred: TwwDBLookupCombo;
    btnSubContaCred: TBitBtn;
    Panel12: TPanel;
    fcLabel4: TfcLabel;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    MontaSelectSubConta: TMontaSelect;
    Label10: TLabel;
    btnAtivProj: TBitBtn;
    CdsTipoOper: TClientDataSet;
    CdsHistorico: TClientDataSet;
    CdsElemen: TClientDataSet;
    CdsPlano: TClientDataSet;
    CdsPatro: TClientDataSet;
    dbedPeriodo: TwwDBEdit;
    dbedDif: TDBRealEdit;
    dbedNumLan: TwwDBEdit;
    dbedExercicio: TwwDBEdit;
    dbedPlanilha: TwwDBEdit;
    dbedSubContaDeb: TwwDBEdit;
    dbedSubContaCre: TwwDBEdit;
    dbedAtivProj: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    dbreValor: TDBRealEdit;
    mskHist1: TMaskEdit;
    mskHist2: TMaskEdit;
    mskHist3: TMaskEdit;
    mskHist4: TMaskEdit;
    mskHist5: TMaskEdit;
    Memo1: TMemo;
    cmbConvOfDeb: TwwDBComboBox;
    cmbConvGerDeb: TwwDBComboBox;
    cmbConvGe1Deb: TwwDBComboBox;
    cmbConvGe2Deb: TwwDBComboBox;
    cmbConvOfCre: TwwDBComboBox;
    cmbConvGerCre: TwwDBComboBox;
    cmbConvGe1Cre: TwwDBComboBox;
    cmbConvGe2Cre: TwwDBComboBox;
    dbrgOriApl: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    dbedHistDeb: TDBRealEdit;
    dbedHistCre: TDBRealEdit;
    dbreValOfiDeb: TDBRealEdit;
    dbreValGerDeb: TDBRealEdit;
    dbreValGe1Deb: TDBRealEdit;
    dbreValGe2Deb: TDBRealEdit;
    dbreValOfiCre: TDBRealEdit;
    dbreValGerCre: TDBRealEdit;
    dbreValGe1Cre: TDBRealEdit;
    dbreValGe2Cre: TDBRealEdit;
    MontaSelectAtivProj: TMontaSelect;
    cdsCCustDeb: TClientDataSet;
    cdsCCustCre: TClientDataSet;
    cdsSubContaDeb: TClientDataSet;
    cdsSubContaCre: TClientDataSet;
    cdsAtivProj: TClientDataSet;
    Panel4: TPanel;
    lblPlanilha: TLabel;
    CdsDetAux: TClientDataSet;
    cdsDetMantem: TClientDataSet;
    cdsDet: TwwClientDataSet;
    cmpContaDeb: TCMProcuraMaskContabil;
    cmpContaCre: TCMProcuraMaskContabil;
    cdsEstornada: TCMClientDataSet;
    sqlEstornada: TCMSqlParams;
    LBLESTORNADA: TLabel;
    cdsAux: TClientDataSet;
    CMSqlParams1: TCMSqlParams;
    cdsparmacontab: TClientDataSet;
    cdsSegrega: TCMClientDataSet;
    panSegregacao: TPanel;
    Label12: TLabel;
    dbCboSegregaCriter: TwwDBLookupCombo;
    dbEdSegregaData: TCMDateTimePicker;
    Label13: TLabel;
    TabSheet3: TTabSheet;
    grdProvaZero: TwwDBGrid;
    cdsProvaZero: TCMClientDataSet;
    dsProvaZero: TwwDataSource;
    lbProvaZero: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedDataExit(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dblkHistoricoExit(Sender: TObject);
    procedure mskHist1Enter(Sender: TObject);
    procedure mskHist1Change(Sender: TObject);
    procedure mskHist2Change(Sender: TObject);
    procedure mskHist2Exit(Sender: TObject);
    procedure mskHist3Change(Sender: TObject);
    procedure mskHist4Change(Sender: TObject);
    procedure mskHist5Change(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSubContaDebClick(Sender: TObject);
    procedure dbedSubContaDebExit(Sender: TObject);
    procedure btnSubContaCredClick(Sender: TObject);
    procedure dbedSubContaCreExit(Sender: TObject);
    procedure dbedAtivProjExit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure btnAtivProjExit(Sender: TObject);
    procedure pnlPlanoPatroCExit(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure sbtnEstornoClick(Sender: TObject);
    procedure cmpContaDebExit(Sender: TObject);
    procedure cmpContaCreExit(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblcPlanoPrevCExit(Sender: TObject);
    procedure CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
    procedure grdProvaZeroTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure grdProvaZeroCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure cdsDetAfterCancel(DataSet: TDataSet);
    procedure cdsDetAfterDelete(DataSet: TDataSet);
    procedure cdsDetAfterPost(DataSet: TDataSet);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure cdsProvaZeroAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    iIdModulo      : integer; // andre tavares - pendência 16733 - 18/05/2004
    Periodo        :TCtrlPeriodo;
    ProcessaContab :TCtrlProcessaContab;
    Lancamento     :TCtrlLancamento;
    ContaContabil  :TCtrlContaContabil;
    HistoContab    :TCtrlHistoContab;
    Demonstrativo  :TCtrlDemonstrativo;
    Contab         :TCtrlContab;
    ListTerceiros  :TCtrlListTerceiros;
    // Alex 07/01/04 14451
    CtrlSegregacao  :TCtrlSegregacao;

    // Pendencia 16345
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;

    procedure AbreQry(PlnCodigo: Double;bPrincipal: Boolean);
    procedure SetaPlano(sData : String);
    procedure MontaConta(sTipo,sConta : String);
    procedure VerificaEstornada;
    procedure CalculaDebCre;
    procedure AtuParamContab;
    // Alex 07/01/04 14451
    procedure ProcuraSegregaCriter;
    // Alex 07/01/04 14451
    function VerificaPreenchimentoDet: boolean;
    // Alex 08/01/04 14451
    procedure RegraProvaZero;
  public
    { Public declarations }
    bVeioDaConsultaSaldo :Boolean;
    dPlnDaConsultaSaldo,dPlnCodContab     :Double;
    procedure ConfigMontaSelect;
  end;

var
  FrmLancaContabMT: TFrmLancaContabMT;
  bGravouDet  :Boolean;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uString, dBaseDados,fDataMT;

procedure TFrmLancaContabMT.FormCreate(Sender: TObject);
begin
  inherited;
  //
  iIdModulo := -1; // andre tavares - pendência 16733 - 18/05/2004
  Periodo := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  ProcessaContab := TCtrlProcessaContab.Create;
  ProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  Lancamento := TCtrlLancamento.Create;
  Lancamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                        Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  HistoContab := TCtrlHistoContab.Create;
  HistoContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  Demonstrativo := TCtrlDemonstrativo.Create;
  Demonstrativo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,False);


  ContaContabil := TCtrlContaContabil.Create;
  ContaContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  // Alex 07/01/04 14451
  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  cdsSegrega.Data := CtrlSegregacao.ListaSegregaCriter;
  CtrlSegregacao.GetParams (Sistema.IdEmpresa);

  // Pendencia 16345
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(CtrlSegregacao);

  panSegregacao.Visible := CtrlSegregacao.SegregaVirtual;
  // fim Alex 07/01/04 14451

  dPlnCodContab  := 0;
  Contab := TCtrlContab.Create;
  Contab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not Contab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(Contab.MessageInfo,'Erro',MtError,[mbOk],0);

  dPlnCodContab := Contab.PlnCodigo;

  //Configura o montaselect
  if Contab.PacPesqPlaResumida = 'S' then
     ConfigMontaSelect;

  // *** verifica se vai lançar pelo codigo normal ou reduzido ***
  if Contab.PlaReduz = 'R' then
  begin
    cmpContaDeb.CampoPesquisa := cpPlaReduz;
    cmpContaCre.CampoPesquisa := cpPlaReduz;
    cmpContaDeb.DataField := 'PLAREDUZD';
    cmpContaCre.DataField := 'PLAREDUZC';
    cmpContaDeb.Caption   := 'Conta Contábil (Cod.Red)';
    cmpContaCre.Caption   := 'Conta Contábil (Cod.Red)';
  end else
  if Contab.PlaReduz = 'C' then
  begin
    cmpContaDeb.CampoPesquisa := cpPlaConta;
    cmpContaCre.CampoPesquisa := cpPlaConta;
    cmpContaDeb.DataField := 'PLACONTAD';
    cmpContaCre.DataField := 'PLACONTAC';
  end else
  if Contab.PlaReduz = 'P' then
  begin
    cmpContaDeb.CampoPesquisa := cpPlaCorresp;
    cmpContaCre.CampoPesquisa := cpPlaCorresp;
    cmpContaDeb.DataField := 'PLACONCORRESPD';
    cmpContaCre.DataField := 'PLACONCORRESPC';
    cmpContaDeb.Caption   := 'Conta Contábil (Cod.Corresp)';
    cmpContaCre.Caption   := 'Conta Contábil (Cod.Corresp)';
  end;

  cmpContaDeb.Plano    := Contab.PlanoParam;
  cmpContaDeb.Mascara  := Contab.MascaraContaParam;
  cmpContaCre.Plano    := Contab.PlanoParam;
  cmpContaCre.Mascara  := Contab.MascaraContaParam;

  //
  ProcessaContab.cdsPlanilha   := cds;
  ProcessaContab.cdsLancamento := CdsDetAux;
  //
  AbreQry(-1,True);
  //
  MontaSelect.Filtro.Add('PLANILHA.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  //
  MontaSelectSubConta.Filtro.Delete(4);
  MontaSelectSubConta.Filtro.Delete(3);
  MontaSelectSubConta.Filtro.Delete(2);
  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLACONTA = '''+Espaco('1',18)+'''');
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLANO = '+IntToStr(Contab.PlanoParam));
  //
  cdsDetMantem.Data := Lancamento.SelecionaLancamentosEsp(-1);
  //

end;

procedure TFrmLancaContabMT.AbreQry(PlnCodigo: Double;bPrincipal: Boolean);
begin
  if bPrincipal then begin
     cds.Data := Lancamento.SelecionaPlanilhas(PlnCodigo,0,0,Sistema.idEmpresa,0,0,tpSoPeriodo,
                                               '','','','',teAmbos,tolPlnCodigo);
  end;

  // 08/01/04 Alex 14451
  RegraProvaZero;

  cdsDet.Data :=  Lancamento.SelecionaLancamentosEsp(PlnCodigo);

  TFloatField(cdsDet.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';
  cdsDet.ControlType.Add('MARCA;CheckBox;S;N');

  If PlnCodigo = -1 Then
  Begin
     If cdsDetAux.Active Then cdsDetAux.Close;
     cdsDetAux.Data := CdsDet.Data;
  End;

  //==============
  //
  if not cds.IsEmpty then
     SetaPlano(cds.FieldByName('PLNDATDIA').AsString);
  //
  if cds.FieldByName('PLNEFETIVADO').AsString = 'S' then begin
     imgPlanilEfetiva.Visible := True;
     imgPlanilNaoEfet.Visible := False;
  end else begin
     imgPlanilEfetiva.Visible := False;
     imgPlanilNaoEfet.Visible := True;
  end;
  //
  if cds.FieldByName('DIFERENCA').AsFloat = 0 then begin
     imgIgual.Visible   := True;
     imgDebito.Visible  := False;
     imgCredito.Visible := False;
  end else begin
     if cds.FieldByName('DIFERENCA').AsFloat > 0 then begin
        imgIgual.Visible   := False;
        imgDebito.Visible  := True;
        imgCredito.Visible := False;
     end else begin
        imgIgual.Visible   := False;
        imgDebito.Visible  := False;
        imgCredito.Visible := True;
     end;
  end;
end;

procedure TFrmLancaContabMT.CmeDetalheInsert(Sender: TObject);
var x : Integer;
begin
  inherited;
  bGravouDet := False;
  if (not cdsDetMantem.IsEmpty) and (Contab.MantemLancTela = 'S') then begin
     For X:=0 To cdsDetMantem.FieldCount - 1 Do
        cdsDet.FieldByName(cdsDetMantem.Fields[x].FieldName).Value := cdsDetMantem.Fields[x].Value;

     cdsDet.FieldByName('LACNUMLAN').Clear;
     cdsdet.FieldByName('PLNCODIGO').Clear;
     cdsDet.FieldByName('LACVALOR').AsFloat  := 0;
     cdsDet.FieldByName('VALOFIDEB').AsFloat := 0;
     cdsDet.FieldByName('VALGERDEB').AsFloat := 0;
     cdsDet.FieldByName('VALGE1DEB').AsFloat := 0;
     cdsDet.FieldByName('VALGE2DEB').AsFloat := 0;
     cdsDet.FieldByName('VALHISDEB').AsFloat := 0;
     cdsDet.FieldByName('VALOFICRE').AsFloat := 0;
     cdsDet.FieldByName('VALGERCRE').AsFloat := 0;
     cdsDet.FieldByName('VALGE1CRE').AsFloat := 0;
     cdsDet.FieldByName('VALGE2CRE').AsFloat := 0;
     cdsDet.FieldByName('VALHISCRE').AsFloat := 0;
  end else begin
     mskHist1.text     := '';
     mskHist2.text     := '';
     mskHist3.text     := '';
     mskHist4.text     := '';
     mskHist5.text     := '';
     mskHist1.EditMask := '';
     mskHist2.EditMask := '';
     mskHist3.EditMask := '';
     mskHist4.EditMask := '';
     mskHist5.EditMask := '';
  end;
  pnlMestre.Align   := AlNone;

  MontaConta('D', CdsDet.FieldByName('PLACONTAD').asString);
  MontaConta('C', CdsDet.FieldByName('PLACONTAC').asString);
  cmpContaDeb.SetFocus;
end;

procedure TFrmLancaContabMT.CmeDetalheConfirma(Sender: TObject);
Var
  X: Integer;
begin
  bGravouDet := True;
  if CdsDet.State in dsEditModes then begin
     CdsDet.FieldByName('LACHIST1').asString := mskHist1.text;
     CdsDet.FieldByName('LACHIST2').asString := mskHist2.text;
     CdsDet.FieldByName('LACHIST3').asString := mskHist3.text;
     CdsDet.FieldByName('LACHIST4').asString := mskHist4.text;
     CdsDet.FieldByName('LACHIST5').asString := mskHist5.text;
     CdsDet.FieldByName('NOMECCUSTOD').AsString := dblkCCustoDeb.Text;
     CdsDet.FieldByName('NOMECCUSTOC').AsString := dblkCCustoCred.Text;

     If Not cdsDetAux.IsEmpty Then cdsDetAux.Delete;

     cdsDetAux.Append;
     For X:=0 To CdsDet.FieldCount - 1 Do
         cdsDetAux.FieldByName(cdsDet.Fields[x].FieldName).Value := cdsDet.Fields[x].Value;
     cdsDetAux.Post;

     If Not cdsDetMantem.IsEmpty Then cdsDetMantem.Delete;
        cdsDetMantem.Append;
     For X:=0 To CdsDet.FieldCount - 1 Do
         cdsDetMantem.FieldByName(cdsDet.Fields[x].FieldName).Value := cdsDet.Fields[x].Value;
     cdsDetMantem.Post;

     if not ProcessaContab.ProcessaLancamento(Sistema.idEmpresa, Sistema.idModulo,
                                          Sistema.idUsuario, Sistema.UsaPlanoPatro,
                                          cds.FieldByName('PLNCODIGO').AsFloat,
                                          cds.FieldByName('PLNDATDIA').AsString) then begin
        MsgDlg(ProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk],0);
     end else begin
        if cds.FieldByName('PLNPLANIL').isNull then begin
           lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(ProcessaContab.RetornaPlnPlanil) + ' - Lanc. Nº ' +
                                     IntToStr(ProcessaContab.RetornaPlnNumLan)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;
           cds.FieldByName('PLNPLANIL').AsFloat   :=ProcessaContab.RetornaPlnPlanil;
        end else begin
           lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(cds.FieldByName('PLNPLANIL').AsFloat) + ' - Lanc. Nº ' +
                                  IntToStr(ProcessaContab.RetornaPlnNumLan)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;
        end;
        cdsDet.FieldByName('LACNUMLAN').AsInteger :=ProcessaContab.RetornaPlnNumLan;
        cds.FieldByName('PLNNUMLAN').AsInteger    :=ProcessaContab.RetornaPlnNumLan;
        cds.FieldByName('PLNCODIGO').AsFloat      :=ProcessaContab.RetornaPlnCodigo;

        inherited;
        If not sbtnInsDet.Down Then pnlMestre.Align := AlTop;
     end;
  end;

  // Alex 08/01/04 14451
  RegraProvaZero;
end;

procedure TFrmLancaContabMT.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  pnlMestre.Align := AlTop;
  // alex 15/09/04 17193 CalculaDebCre;
  AtuParamContab;
end;

procedure TFrmLancaContabMT.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;

  // alex 15/09/04 17193 CalculaDebCre;
  bGravouDet := True;

  AtuParamContab;

  pnlMestre.Align := AlTop;

end;

procedure TFrmLancaContabMT.btnAtivProjClick(Sender: TObject);
begin
   inherited;
   MontaSelectAtivProj.Executar;
   if MontaSelectAtivProj.RetornouValor then begin
      cdsDet.FieldByName('UNIDNEGOC').AsFloat     := StrToFloat(MontaSelectAtivProj.ValoresChave[1]);
      cdsDet.FieldByName('NOMEATIVPROJ').AsString := MontaSelectAtivProj.ValoresChave[2];
      cdsDet.FieldByName('UNECODIGO').AsString    := MontaSelectAtivProj.ValoresChave[0];
   end;
end;

procedure TFrmLancaContabMT.CmeCadastroConfirma(Sender: TObject);
var iPlnPlanil : Double;
begin
  if not bGravouDet then
  begin
    MsgDlg('Antes do OK final, Tecle <OK> para Confirmar ou <Cancelar>/<Voltar> para Cancelar o Lançamento.','Aviso',mtWarning,[mbOk],0);
    if bbtnOkDet.CanFocus then bbtnOkDet.SetFocus;
    Abort;
  end;
  if cds.FieldByName('PLNCODIGO').AsFloat = 0 then
     iPlnPlanil := -1
  else
     iPlnPlanil := cds.FieldByName('PLNCODIGO').AsFloat;

  if (Contab.PacDebCre = 'B') or (Contab.PacDebCre = 'S') then
  begin
    if cds.FieldByName('DIFERENCA').asFloat <> 0 then
      MsgDlg('O Débito não está batendo com o Crédito.','Erro',MtError,[mbOk],0);
  end;
  AbreQry(iPlnPlanil,true);



end;

procedure TFrmLancaContabMT.CmeDetalheDelete(Sender: TObject);
var bOk : Boolean;
begin
   if MsgDlg('Confirma a Exclusão do(s) Lançamento(s) Marcado(s)?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
      bOk := True;
      cdsDet.DisableControls;
      cdsDet.First;
      while not cdsDet.Eof do begin
         if cdsDet.FieldByName('MARCA').AsString = 'S' then begin
            if not ProcessaContab.ProcessaExcluiLanc(Sistema.idEmpresa,cds.FieldByName('PLNCODIGO').AsFloat,
                   Sistema.idModulo, Sistema.idUsuario,cdsDet.FieldByName('LACNUMLAN').AsInteger,
                   Sistema.UsaPlanoPatro, False) then begin
               bOk := False;
               Break;
            end;
         end;
         CdsDet.Next;
      end;
      cdsDet.First;
      cdsDet.EnableControls;
      if not bOK then begin
         MsgDlg(ProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk],0);
      end else begin
         inherited;
         AbreQry(cds.FieldByName('PLNCODIGO').AsFloat,False);
      end;
      // alex 15/09/04 17193 CalculaDebCre;

      // Alex 08/01/04 14451
      RegraProvaZero;
   end;
end;

procedure TFrmLancaContabMT.CmeCadastroDelete(Sender: TObject);
begin
   LBLESTORNADA.Visible := false;
   if not ProcessaContab.ProcessaExcluiLanc(Sistema.idEmpresa,cds.FieldByName('PLNCODIGO').AsFloat,
          Sistema.idModulo,Sistema.idUsuario,0, Sistema.UsaPlanoPatro, True) then begin
      MsgDlg(ProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk],0);
   end else begin
      dPlnCodContab := 0;
   end;
   AbreQry(cds.FieldByName('PLNCODIGO').AsFloat,true);

end;

procedure TFrmLancaContabMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  // Pendencia 16345
  CtrlPlanPrevContabPatro.Free;
  
  Periodo.Free;
  ProcessaContab.Free;
  Lancamento.Free;
  HistoContab.Free;
  Demonstrativo.Free;
  ContaContabil.Free;
  Contab.Free;
  ListTerceiros.Free;
  // 07/01/04 Alex 14451
  CtrlSegregacao.Free;
  // 07/01/04 Alex 14451

  if bVeioDaConsultaSaldo then
  begin
     bVeioDaConsultaSaldo := false;
     Close;
  end;
end;


procedure TFrmLancaContabMT.dbedDataExit(Sender: TObject);
begin
  inherited;
  if dbedData.Text <> '' then begin
     SetaPlano(dbedData.Text);
     if not Periodo.RetornaPeriodoExercicioData(Sistema.idEmpresa,dbedData.Text) then begin
        MsgDlg(Periodo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
        dbedData.Text;
     end;
     if Periodo.TestaPeriodoBloqueado(Sistema.idEmpresa,tbBloqueado,Periodo.Periodo,Periodo.Exercicio,False) then begin
        MsgDlg(Periodo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
        dbedData.Text;
     end;
     if cds.FieldByName('PLNPLANIL').isNull then
        lblPlanilha.Caption := 'Planilha Nº --- Lanc. Nº --- Data: '+dbedData.Text
     else
        lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(cds.FieldByName('PLNPLANIL').AsFloat) + ' - Lanc. Nº ' +
                               IntToStr(cds.FieldByName('PLNNUMLAN').AsInteger)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;
     cds.FieldByName('PERNOME').AsString := Periodo.NomePeriodo;
     cds.FieldByName('PEREXERCICIO').AsInteger := Periodo.Exercicio;
     if (cds.State = dsInsert) and (ActiveControl.Tag <> 99) then
        sbtnInsDet.Click;
  end else begin
     if (cds.State = dsInsert) and (ActiveControl.Tag <> 99) then begin
        MsgDlg('Obrigatório indicar a data do Lançamento','Erro',MtError,[mbOk],0);
        dbedData.SetFocus;
     end;
  end;
end;

procedure TFrmLancaContabMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(cds.FieldByName('PLNPLANIL').AsFloat) + ' - Lanc. Nº ' +
                           IntToStr(cdsdet.FieldByName('LACNUMLAN').AsInteger)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;

  bGravouDet := False;
  pnlMestre.Align := AlNone;



  // Início - Rodolpho da Silva - P: 20695 - 16/11/2005
  //  Retira-se a máscara
  mskHist1.EditMask := '';
  mskHist2.EditMask := '';
  mskHist3.EditMask := '';
  mskHist4.EditMask := '';
  mskHist5.EditMask := '';
  // Insere o hirtórico nos MaskEdits
  mskHist1.text     := CdsDet.FieldByName('LACHIST1').asString;
  mskHist2.text     := CdsDet.FieldByName('LACHIST2').asString;
  mskHist3.text     := CdsDet.FieldByName('LACHIST3').asString;
  mskHist4.text     := CdsDet.FieldByName('LACHIST4').asString;
  mskHist5.text     := CdsDet.FieldByName('LACHIST5').asString;
  // Insere-se a máscara novamente
  mskHist1.EditMask := 'cccccccccccccccccccccccccccccccccccccccc;1;_';
  mskHist2.EditMask := 'cccccccccccccccccccccccccccccccccccccccc;1;_';
  mskHist3.EditMask := 'cccccccccccccccccccccccccccccccccccccccc;1;_';
  mskHist4.EditMask := 'cccccccccccccccccccccccccccccccccccccccc;1;_';
  mskHist5.EditMask := 'cccccccccccccccccccccccccccccccccccccccc;1;_';
 // Fim - Rodolpho da Silva - P: 20695 - 16/11/2005



  //
  MontaConta('D', CdsDet.FieldByName('PLACONTAD').asString);
  MontaConta('C', CdsDet.FieldByName('PLACONTAC').asString);
  //
  cmpContaDeb.SetFocus;
end;

procedure TFrmLancaContabMT.dblkHistoricoExit(Sender: TObject);
var
   Hist : Array[1..5] of String;
   i, iMax, iLoop : Integer;
   sComp : String;
begin
   inherited;
   if dblkHistorico.Focused then exit;

   mskHist1.text := '';
   mskHist2.text := '';
   mskHist3.text := '';
   mskHist4.text := '';
   mskHist5.text := '';

   if dblkHistorico.text = '' then begin
      Hist[1] := '';
      Hist[2] := '';
      Hist[3] := '';
      Hist[4] := '';
      Hist[5] := '';
      exit;
   end;

   if CdsHistorico.FieldByName('HITCODHIST').AsString <> dblkHistorico.text then exit;

   Hist[1] := copy(CdsHistorico.FieldByName('HITDESCR1').AsString,1  ,40);
   Hist[2] := copy(CdsHistorico.FieldByName('HITDESCR1').AsString,41 ,40);
   Hist[3] := copy(CdsHistorico.FieldByName('HITDESCR1').AsString,81 ,40);
   Hist[4] := copy(CdsHistorico.FieldByName('HITDESCR1').AsString,121,40);
   Hist[5] := copy(CdsHistorico.FieldByName('HITDESCR1').AsString,161,40);

   for iLoop := 1 to 5 do begin
      i := 1;
      iMax := length(trim(Hist[iLoop])) + 1;
      sComp := StringOfChar ('c',40 - Length(Trim(Hist[iLoop])));

      while  i < iMax do begin
         if copy(Hist[iLoop],i,1) = '#' then begin
            Hist[iLoop] := copy(Hist[iLoop], 1, i-1) + 'c' + copy(Hist[iLoop], i+1, iMax-i);
         end else begin
            Hist[iLoop] := copy(Hist[iLoop], 1, i-1) + '\' + copy(Hist[iLoop], i, iMax-i);
            inc(i);
            inc(iMax);
         end;
         inc(i);
      end;
      case iLoop of
         1 : mskHist1.EditMask := Trim(Hist[iLoop]) + sComp + ';1;_';
         2 : mskHist2.EditMask := Trim(Hist[iLoop]) + sComp + ';1;_';
         3 : mskHist3.EditMask := Trim(Hist[iLoop]) + sComp + ';1;_';
         4 : mskHist4.EditMask := Trim(Hist[iLoop]) + sComp + ';1;_';
         5 : mskHist5.EditMask := Trim(Hist[iLoop]) + sComp + ';1;_';
      end;
   end;


end;

procedure TFrmLancaContabMT.mskHist1Enter(Sender: TObject);
begin
  inherited;
  mskHist1.SelLength := 0;
end;

procedure TFrmLancaContabMT.mskHist1Change(Sender: TObject);
begin
  inherited;
  If ( mskHist1.SelStart = 40 ) and ( mskHist1.SelLength = 0 ) then begin
     mskHist2.SetFocus;
     mskHist2.SelLength := 0;
  End;

end;

procedure TFrmLancaContabMT.mskHist2Change(Sender: TObject);
begin
  inherited;
  If ( mskHist2.SelStart = 40 ) and ( mskHist2.SelLength = 0 ) Then begin
     mskHist3.SetFocus;
     mskHist3.SelLength := 0;
  End;

end;

procedure TFrmLancaContabMT.mskHist2Exit(Sender: TObject);
begin
  inherited;
  if trim((sender as tmaskedit).text) = '' then dblkMutacoesPL.SetFocus;
end;

procedure TFrmLancaContabMT.mskHist3Change(Sender: TObject);
begin
  inherited;
  If ( mskHist3.SelStart = 40 ) and ( mskHist3.SelLength = 0 ) Then begin
     mskHist4.SetFocus;
     mskHist4.SelLength := 0;
  End;

end;

procedure TFrmLancaContabMT.mskHist4Change(Sender: TObject);
begin
  inherited;
  If ( mskHist4.SelStart = 40 ) and ( mskHist4.SelLength = 0 ) Then begin
     mskHist5.SetFocus;
     mskHist5.SelLength := 0;
  End;
end;

procedure TFrmLancaContabMT.mskHist5Change(Sender: TObject);
begin
  inherited;
  If ( mskHist5.SelStart = 40 ) and ( mskHist5.SelLength = 0 ) Then
     dblkMutacoesPL.SetFocus;
end;

procedure TFrmLancaContabMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     AbreQry(StrToFloat(MontaSelect.ValoresChave[0]),True);
     lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(cds.FieldByName('PLNPLANIL').AsFloat) + ' - Lanc. Nº ' +
                               IntToStr(cds.FieldByName('PLNNUMLAN').AsInteger)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;
     VerificaEstornada;
     CmeCadastroAtualizaBotoes(self);
     iIdModulo := strToIntDef(MontaSelect.ValoresChave[1], -1); // andre tavares - pendência 16733 - 18/05/2004
  end;
end;
procedure TFrmLancaContabMT.FormActivate(Sender: TObject);
begin
  inherited;
  if Self.WindowState <> wsMaximized then Self.WindowState := wsMaximized;
  
  pnlPlanoPatroC.Enabled := Sistema.UsaPlanoPatro;
  CdsHistorico.Data :=  HistoContab.ListHistoContab(Sistema.idempresa,tohCodigo,'');
  //
  CdsTipoOper.Data := ListTerceiros.ListTipoOper(False);
  //
  CdsElemen.Data := Demonstrativo.SelecionaElemDemonst(Sistema.IdEmpresa, 0, 0,'L',toeElem);

  if Sistema.UsaPlanoPatro then begin
     CdsPlano.Data := ListTerceiros.ListPlanoPrev;
     CdsPatro.Data := ListTerceiros.ListPlanoPatro;
  end;
end;


procedure TFrmLancaContabMT.SetaPlano(sData:String);
begin
   if not Contab.SelecionaPlanoData(Sistema.idEmpresa,sData) then begin
      MsgDlg(Contab.MessageInfo,'Aviso',mtWarning,[mbOk],0);
      dbedData.SetFocus;
      Exit;
   end;
   TStringField(cdsDet.FieldByName('PLACONTAD')).EditMask := Contab.MascaraContaData+ ';0; ';
   TStringField(cdsDet.FieldByName('PLACONTAC')).EditMask := Contab.MascaraContaData+ ';0; ';
   TFloatField(cdsDet.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';
end;

procedure TFrmLancaContabMT.MontaConta(sTipo,sConta : String);
begin
   if sConta <> '' then begin
      if not Periodo.RetornaPeriodoExercicioData(Sistema.idEmpresa,dbedData.Text) then begin
         MsgDlg(Periodo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
         exit;
      end;
      if not ContaContabil.TestaContaContabil(Contab.PlanoData,Sistema.idEmpresa,Periodo.Periodo,Periodo.Exercicio,sConta,False,False) then begin
         MsgDlg('Conta Contábil '+sConta+' '+ContaContabil.MessageInfo,'Aviso',mtWarning,[mbOk],0);
         if sTipo = 'D' then cmpContaDeb.SetFocus else cmpContaCre.SetFocus;
         exit;
      end;
      if sTipo = 'D' then begin
         cdsDet.FieldByName('NOMECONTAD').AsString := ContaContabil.NomeConta;

         cdsCCustDeb.Data := ContaContabil.ListContasxCC(Contab.PlanoData,Sistema.idEmpresa,sConta,'',
                                                        tccSoAnaliticaCC,toNome);
         if ContaContabil.ObrigaCentroCusto = 'S' then begin
            dblkCCustoDeb.Enabled := true;
            dblkCCustoDeb.LookupValue := trim(cdsDet.FieldByName('CCUSTDEB').AsString);
            dblkCCustoDeb.Text        := cdsDet.FieldByName('NOMECCUSTOD').AsString;
            dblkCCustoDeb.SetFocus;
         end else begin
            dblkCCustoDeb.Enabled := false;
            cdsDet.FieldByName('CCUSTDEB').Clear;
         end;
         if ContaContabil.ObrigaSubConta = 'S' then begin
            dbedSubContaDeb.Enabled := true;
            btnSubContaDeb.Enabled := true;
            dbedSubContaDeb.Setfocus;
         end else begin
            dbedSubContaDeb.Enabled := false;
            btnSubContaDeb.Enabled := false;
            cdsDet.FieldByName('SUBCONTADEB').Clear;
         end;
         if cdsDet.FieldByName('ORIAPLDEB').isNull then
            cdsDet.FieldByName('ORIAPLDEB').AsString := 'A';
      end else begin
         cdsDet.FieldByName('NOMECONTAC').AsString := ContaContabil.NomeConta;
         cdsCCustCre.Data := ContaContabil.ListContasxCC(Contab.PlanoData,Sistema.idEmpresa,sConta,'',
                                                              tccSoAnaliticaCC,toNome);
         if ContaContabil.ObrigaCentroCusto = 'S' then begin
            dblkCCustoCred.Enabled := true;
            dblkCCustoCred.LookupValue := trim(cdsDet.FieldByName('CCUSTCRE').AsString);
            dblkCCustoCred.Text        := cdsDet.FieldByName('NOMECCUSTOC').AsString;
            dblkCCustoCred.Setfocus;
         end else begin
            dblkCCustoCred.Enabled := false;
            cdsDet.FieldByName('CCUSTCRE').Clear;
         end;
         if ContaContabil.ObrigaSubConta = 'S' then begin
            dbedSubContaCre.Enabled := true;
            btnSubContaCred.Enabled := true;
            dbedSubContaCre.Setfocus;
         end else begin
            dbedSubContaCre.Enabled := false;
            btnSubContaCred.Enabled := false;
            cdsDet.FieldByName('SUBCONTACRE').Clear;
         end;
         if cdsDet.FieldByName('ORIAPLCRE').isNull then
            cdsDet.FieldByName('ORIAPLCRE').AsString := 'O';
      end;
   end else begin
      //
      if sTipo = 'D' then begin
         dblkCCustoDeb.Enabled   := false;
         dbedSubContaDeb.Enabled := false;
         btnSubContaDeb.Enabled  := false;
         cdsDet.FieldByName('CCUSTDEB').Clear;
         cdsDet.FieldByName('SUBCONTADEB').Clear;
      end else begin
         //
         dblkCCustoCred.Enabled  := false;
         dbedSubContaCre.Enabled := false;
         btnSubContaCred.Enabled := false;
         cdsDet.FieldByName('CCUSTCRE').Clear;
         cdsDet.FieldByName('SUBCONTACRE').Clear;
      end;
   end;
end;

procedure TFrmLancaContabMT.btnSubContaDebClick(Sender: TObject);
begin
  inherited;
  MontaSelectSubConta.Filtro.Delete(4);
  MontaSelectSubConta.Filtro.Delete(3);
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLACONTA = '''+Espaco(cdsDet.FieldByName('PLACONTAD').AsString,18)+'''');
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLANO = '+IntToStr(Contab.PlanoData));
  MontaSelectSubConta.Executar;
  if MontaSelectSubConta.RetornouValor then begin
     cdsDet.FieldByName('SUBCONTADEB').AsFloat   := StrToFloat(MontaSelectSubConta.ValoresChave[0]);
     cdsDet.FieldByName('NOMESUBCONTAD').AsString := MontaSelectSubConta.ValoresChave[1];
  end;
end;

procedure TFrmLancaContabMT.dbedSubContaDebExit(Sender: TObject);
begin
  inherited;
  if (trim(dbedSubContaDeb.Text) <> '')  and (trim(dbedSubContaDeb.Text) <> '0') then begin
     cdsSubContaDeb.Data := ContaContabil.ListContasxSC(Contab.PlanoData,Sistema.idEmpresa,
                            cdsDet.FieldByName('SUBCONTADEB').AsFloat, cdsDet.FieldByName('PLACONTAD').AsString,
                            toCodigo);
     if cdsSubContaDeb.IsEmpty then begin
        MsgDlg('Subconta não existe ou não é permitida para esta conta contábil','Aviso',mtWarning,[mbOk],0);
        dbedSubContaDeb.SetFocus;
        exit;
     end else begin
        cdsDet.FieldByName('NOMESUBCONTAD').AsString := cdsSubContaDeb.FieldByName('NOMESUBCONTA').AsString;
     end;
  end;
end;


procedure TFrmLancaContabMT.btnSubContaCredClick(Sender: TObject);
begin
  inherited;
  MontaSelectSubConta.Filtro.Delete(4);
  MontaSelectSubConta.Filtro.Delete(3);
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLACONTA = '''+Espaco(cdsDet.FieldByName('PLACONTAC').AsString,18)+'''');
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLANO = '+IntToStr(Contab.PlanoData));
  MontaSelectSubConta.Executar;
  if MontaSelectSubConta.RetornouValor then begin
     cdsDet.FieldByName('SUBCONTACRE').AsFloat   := StrToFloat(MontaSelectSubConta.ValoresChave[0]);
     cdsDet.FieldByName('NOMESUBCONTAC').AsString := MontaSelectSubConta.ValoresChave[1];
  end;
end;

procedure TFrmLancaContabMT.dbedSubContaCreExit(Sender: TObject);
begin
  inherited;
  if (trim(dbedSubContaCre.Text) <> '')  and (trim(dbedSubContaCre.Text) <> '0') then begin
     cdsSubContaCre.Data := ContaContabil.ListContasxSC(Contab.PlanoData,Sistema.idEmpresa,
                           cdsDet.FieldByName('SUBCONTACRE').AsFloat, cdsDet.FieldByName('PLACONTAC').AsString,
                           toCodigo);

     if cdsSubContaCre.IsEmpty then begin
        MsgDlg('Subconta não existe ou não é permitida para esta conta contábil','Aviso',mtWarning,[mbOk],0);
        dbedSubContaCre.SetFocus;
        exit;
     end else begin
        cdsDet.FieldByName('NOMESUBCONTAC').AsString := cdsSubContaCre.FieldByName('NOMESUBCONTA').AsString;
     end;
  end;

end;

procedure TFrmLancaContabMT.dbedAtivProjExit(Sender: TObject);
begin
  inherited;
  if (dbedAtivProj.Text <> '') then begin
     cdsAtivProj.Data := ListTerceiros.ListAtivProj(Sistema.idEmpresa,0,cdsDet.FieldByName('UNECODIGO').AsString,
                                     tapSoAnaliticaAP,toapCodigo);
     if cdsAtivProj.IsEmpty then begin
        MsgDlg('Atividade/Projeto não existe','Aviso',mtWarning,[mbOk],0);
        dbedAtivProj.SetFocus;
        exit;
     end else begin
        cdsDet.FieldByName('UNIDNEGOC').AsFloat     := cdsAtivProj.FieldByName('UNIDNEGOC').AsFloat;
        cdsDet.FieldByName('NOMEATIVPROJ').AsString := cdsAtivProj.FieldByName('NOME').AsString;
     end;
  end;
end;


procedure TFrmLancaContabMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  LBLESTORNADA.Visible := false;
  while not cdsDetMantem.Eof do cdsDetMantem.Delete;
  bGravouDet := False;
  AbreQry(-1,False);
  dbedData.Enabled := True;
  dbedData.SetFocus;
  lblPlanilha.Caption := 'Planilha Nº --- Lanc. Nº --- Data:';


end;

procedure TFrmLancaContabMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
// início - André Tavares - pendência 16733 - 18/05/2004
  if (iIdModulo <> sistema.idmodulo) then
    if (MsgDlg('O Lançamento é de Origem de Outro Módulo. Deseja Realmente Alterar?',
       'Alteração de Lançamentos', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
    begin
      bbtnCancelarClick(sender);
      Abort;
    end;
// fim - André Tavares - pendência 16733 - 18/05/2004
  while not cdsDetMantem.Eof do cdsDetMantem.Delete;
  dbedData.Enabled := False;
  bGravouDet := True;
  if tbcDetalhe.CanFocus then tbcDetalhe.SetFocus
end;

procedure TFrmLancaContabMT.FormShow(Sender: TObject);
begin
  inherited;
  bGravouDet := False;

  if  bVeioDaConsultaSaldo then
  begin
     AbreQry(dPlnDaConsultaSaldo,true);
     lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(cds.FieldByName('PLNPLANIL').AsFloat) + ' - Lanc. Nº ' +
                               IntToStr(cds.FieldByName('PLNNUMLAN').AsInteger)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;
     VerificaEstornada;
  end;
end;

procedure TFrmLancaContabMT.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  bGravouDet := True;
end;

procedure TFrmLancaContabMT.bbtnOkDetClick(Sender: TObject);
var
  bAlterou :boolean;
begin
  bAlterou := cdsDet.State = dsEdit;
  if (Contab.PermiteZero = 'N') AND (dbreValor.Value = 0) then
    begin
    MsgDlg('Valor não Pode ser Zero','Erro',MtError,[mbOk],0);
    dbreValor.SetFocus;
    Exit;
    end;
  inherited;

  if bAlterou then
  begin
     // alex 15/09/04 17193 CalculaDebCre;
     AtuParamContab;
  end;


end;

procedure TFrmLancaContabMT.btnAtivProjExit(Sender: TObject);
begin
  inherited;
  if not Sistema.UsaPlanoPatro then
     if (bbtnOkDet.CanFocus) and (ActiveControl.Tag <> 99) then bbtnOkDet.SetFocus;
end;

procedure TFrmLancaContabMT.pnlPlanoPatroCExit(Sender: TObject);
begin
  inherited;
  if (bbtnOkDet.CanFocus) and (ActiveControl.Tag <> 99) then bbtnOkDet.SetFocus;

  if dblcPlanoPrevC.Text <> '' then
     cdsDet.FieldByName('NOMEPLANOPREV').AsString := CdsPlano.FieldByName('NOME').AsString;

  if dblcPatroC.Text <> '' then
     cdsDet.FieldByName('NOMEPATRO').AsString := CdsPatro.FieldByName('NOME').AsString;
     
end;

procedure TFrmLancaContabMT.dbgrdDetDblClick(Sender: TObject);
begin
  //inherited;
  cdsDet.Edit;
  if cdsDet.FieldByName('MARCA').AsString = 'S' then
     cdsDet.FieldByName('MARCA').AsString := 'N'
  else
     cdsDet.FieldByName('MARCA').AsString := 'S';
  cdsDet.Post;
  //Para não editar ao se dar duplo click
end;

procedure TFrmLancaContabMT.sbtnEstornoClick(Sender: TObject);
begin
  inherited;
  if (cds.State = dsInsert) or (cds.IsEmpty)  then Exit;

  Application.CreateForm(TfrmDataMT, frmDataMT);
  frmDataMT.dCodPlanilha :=  cds.FieldByName('PLNCODIGO').AsFloat;
  frmDataMT.dUsuario     :=  Sistema.idUsuario;
  frmDataMT.dModulo      :=  cds.FieldByName('IDMODULO').asFloat;
  frmDataMT.ShowModal;
  sbtnEstorno.Down := false;

end;

procedure TFrmLancaContabMT.cmpContaDebExit(Sender: TObject);
begin
  inherited;
  If (cmpContaDeb.Valida = VcOK) Then
  Begin
     cdsDet.FieldByName('PLACONTAD').AsString := cmpContaDeb.Conta.Numero;
     if cmpContaDeb.Conta.Numero <> '' then
        MontaConta('D',cmpContaDeb.Conta.Numero)
     else
        cdsDet.FieldByName('PLACONTAD').Clear;
  End;

  // Alex 07/01/04
  // 14/09/04 Alex - retirado estava confundindo com o novo método para segregação na origem,
  // onde temos lançamentos no plano O.C. sem critério para segregação, pois a mesma já foi feita
  // ProcuraSegregaCriter
end;

procedure TFrmLancaContabMT.cmpContaCreExit(Sender: TObject);
begin
  inherited;
  If (cmpContaCre.Valida = VcOK) Then
  Begin
    cdsDet.FieldByName('PLACONTAC').AsString := cmpContaCre.Conta.Numero;
    if cmpContaCre.Conta.Numero <> '' then
       MontaConta('C',cmpContaCre.Conta.Numero)
    else
       cdsDet.FieldByName('PLACONTAC').Clear;
  End;

  // Alex 07/01/04
  // 14/09/04 Alex - retirado estava confundindo com o novo método para segregação na origem,
  // onde temos lançamentos no plano O.C. sem critério para segregação, pois a mesma já foi feita
  // ProcuraSegregaCriter
end;

procedure TFrmLancaContabMT.VerificaEstornada;
var
  numpla  :string;
  datapla :string;
  i :Integer;
begin
   if cds.FieldByname('PLNPLANESTORNO').isNull then
   begin
      LBLESTORNADA.Visible := false;
      Exit;
   end else
   begin
      LBLESTORNADA.Caption := '';
      LBLESTORNADA.Visible := true;
      sqlEstornada.Prepare;
      sqlEstornada.ParamByName('PLNCODIGO').asFloat := cds.FieldByname('PLNPLANESTORNO').asFloat;
      sqlEstornada.Open;

      numpla  := FloatToStr(cdsEstornada.FieldByName('PLNPLANIL').asFloat);
      datapla := DateToStr(cdsEstornada.FieldByName('PLNDATDIA').asDateTime);

      LBLESTORNADA.Caption := 'Planilha Resultante do Estorno da Planilha:' + numpla +' e Data:'+datapla;

      for i := 1 to 6 do
      begin
        LBLESTORNADA.Refresh;
        tbcDetalhe.Refresh;
        Application.ProcessMessages;

        LBLESTORNADA.Visible := false;
        Sleep(100);

        LBLESTORNADA.Refresh;
        tbcDetalhe.Refresh;
        Application.ProcessMessages;

        LBLESTORNADA.Visible := True;
        Sleep(100);

        LBLESTORNADA.Refresh;
        tbcDetalhe.Refresh;
        Application.ProcessMessages;
      end;

   end;
end;

procedure TFrmLancaContabMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  //=========================================
  // Isto só é feito se a tela de lancamento
  // vier da consulta de saldo
  //==========================================
  if  bVeioDaConsultaSaldo then
  begin
     sbtnAlterar.Enabled := True;
     sbtnApagar.Enabled  := True;
  end;


   if (Contab.PacDebCre = 'B')  then
   begin
      if dPlnCodContab <> 0 then
      begin
        if dPlnCodContab <> cds.FieldByName('PLNCODIGO').asFloat then
        begin
          cdsAux.Data := Lancamento.SelecionaPlanilhas(dPlnCodContab,0,0,Sistema.idEmpresa,0,0,tpSoPeriodo,
                                             '','','','',teAmbos,tolPlnCodigo);
          MsgDlg('Proibido Efetuar Operações com a Planilha Selecionada.'+CHR(13)+'Débito não bate com o Crédito na Planilha '+cdsAux.FieldByName('PLNPLANIL').AsString+' do dia '+cdsAux.FieldByName('PLNDATDIA').AsString+'.'+CHR(13)+'Acerte a planilha indicada para ter acesso as demais.','Aviso',MtWarning,[mbOk],0);
          sbtnAlterar.Enabled := False;
          sbtnApagar.Enabled  := False;
          sbtnEstorno.Enabled := False;
        end else
        begin
          sbtnAlterar.Enabled := True;
          sbtnApagar.Enabled  := True;
          sbtnEstorno.Enabled := True;
        end;
        sbtnInserir.Enabled  := False;
        sbtnProcurar.Enabled := True;
      end;
   end;
end;

procedure TFrmLancaContabMT.CalculaDebCre;
var
  // 15/09/04 Alex 17193 marcar a posição da query para retornar na mesma após o processo
  bPosicao: TBookmark;
begin
  If cds.State In DsEditModes then
  Begin
     If not cds.FieldByName('PLNCODIGO').IsNull then
     Begin
        bPosicao := Cds.GetBookmark;
        cdsDet.DisableControls;
        // 15/09/04 Alex marcar a posição da query para retornar na mesma após o processo
        Try
          cdsDet.First;
          Cds.FieldByName('PLNTOTDEB').AsFloat := 0;
          Cds.FieldByName('PLNTOTCRE').AsFloat := 0;
          WHile Not CdsDet.Eof Do
          Begin
             If (Trim(CdsDet.FieldByName('PLACONTAC').AsString) <>  '') And (Trim(CdsDet.FieldByName('PLACONTAD').AsString) <>  '') Then
             Begin
                  Cds.FieldByName('PLNTOTDEB').AsFloat := Cds.FieldByName('PLNTOTDEB').AsFloat + CdsDet.FieldByName('LACVALOR').AsFloat;
                  Cds.FieldByName('PLNTOTCRE').AsFloat := Cds.FieldByName('PLNTOTCRE').AsFloat + CdsDet.FieldByName('LACVALOR').AsFloat;
             End
             Else
             If (Trim(CdsDet.FieldByName('PLACONTAC').AsString) <>  '') Then
             Begin
                 Cds.FieldByName('PLNTOTCRE').AsFloat := Cds.FieldByName('PLNTOTCRE').AsFloat + CdsDet.FieldByName('LACVALOR').AsFloat;
             End
             Else
             If (Trim(CdsDet.FieldByName('PLACONTAD').AsString) <>  '') Then
             Begin
                 Cds.FieldByName('PLNTOTDEB').AsFloat := Cds.FieldByName('PLNTOTDEB').AsFloat + CdsDet.FieldByName('LACVALOR').AsFloat;
             End;

             CdsDet.Next;
          End;
          Cds.FieldByName('DIFERENCA').AsFloat := Cds.FieldByName('PLNTOTDEB').AsFloat - Cds.FieldByName('PLNTOTCRE').AsFloat;
        Finally
           // 15/09/04 Alex marcar a posição da query para retornar na mesma após o processo
           //try // em alguns casos estava dando erro que não achava a posição
             cdsDet.GotoBookmark (bPosicao);
             cdsDet.FreeBookmark (bPosicao);
           //except
           //end;
           cdsDet.EnableControls;
        End;
     End;
  End;

end;

procedure TFrmLancaContabMT.AtuParamContab;
begin

  //-----------------------------------------------------------------
  // grava o codigo da planilha no paramcontab
  //-----------------------------------------------------------------
  if Contab.PacDebCre = 'B' then
  begin
     if cds.FieldByName('DIFERENCA').asFloat <> 0 then
     begin
       ProcessaContab.AtualizaParamContab(Sistema.idEmpresa,cds.FieldByName('PLNCODIGO').asFloat);
       dPlnCodContab  := cds.FieldByName('PLNCODIGO').asFloat;
     end else
     begin
       if dPlnCodContab =  cds.FieldByName('PLNCODIGO').AsFloat then
       begin
         ProcessaContab.AtualizaParamContab(Sistema.idEmpresa,0);
         dPlnCodContab := 0;
       end;
     end;
  end;


end;

procedure TFrmLancaContabMT.bbtnConfirmarClick(Sender: TObject);
begin
  // alex 15/09/04 17193 CalculaDebCre;
  AtuParamContab;
  inherited;
end;

procedure TFrmLancaContabMT.bbtnCancelarClick(Sender: TObject);
begin
  // alex 15/09/04 17193 CalculaDebCre;
  AtuParamContab;
  inherited;
end;

procedure TFrmLancaContabMT.bbtnSairClick(Sender: TObject);
begin
  // alex 15/09/04 17193 CalculaDebCre;
  AtuParamContab;
  inherited;
end;


procedure TFrmLancaContabMT.ConfigMontaSelect;
var
  sql :string;
begin
  //-------------------------------------------------------
  // Configura o Monta select
  //-------------------------------------------------------
  // 1 - Define as tabelas
  MontaSelect.Tabelas.Clear;
  MontaSelect.Tabelas.Add('PLANILHA');
  MontaSelect.Tabelas.Add('MODULO');
  MontaSelect.Tabelas.Add('PERIODO');

  // 2 - Define  o campo a ser retornado
  MontaSelect.CamposChave.Clear;
  MontaSelect.CamposChave.Add('PLANILHA.PLNCODIGO');

  // 3 - Define  o campo a ser retornado
  MontaSelect.Colunas.Clear;
  MontaSelect.Colunas.Add('PLANILHA.PEREXERCICIO');
  MontaSelect.Colunas.Add('PERIODO.PERNOME');
  MontaSelect.Colunas.Add('PLANILHA.PLNDATDIA');
  MontaSelect.Colunas.Add('PLANILHA.PLNDATDIA');
  MontaSelect.Colunas.Add('PLANILHA.PLNPLANIL');
  MontaSelect.Colunas.Add('PLANILHA.PLNNUMLAN');
  MontaSelect.Colunas.Add('PLANILHA.PLNTOTDEB');
  MontaSelect.Colunas.Add('PLANILHA.PLNTOTCRE');
  MontaSelect.Colunas.Add('MODULO.NOMEMODULO');

  MontaSelect.TipodeDado.Clear;
  MontaSelect.TipodeDado.Add('N');
  MontaSelect.TipodeDado.Add('C');
  MontaSelect.TipodeDado.Add('D');
  MontaSelect.TipodeDado.Add('D');
  MontaSelect.TipodeDado.Add('N');
  MontaSelect.TipodeDado.Add('N');
  MontaSelect.TipodeDado.Add('N');
  MontaSelect.TipodeDado.Add('N');
  MontaSelect.TipodeDado.Add('C');


  // 4 - Descrição, largura, mascara...
  MontaSelect.Descricao.Clear;
  MontaSelect.Larguras.Clear;
  MontaSelect.Descricao.Add('Exercício');
  MontaSelect.Descricao.Add('Período');
  MontaSelect.Descricao.Add('Data Inicial');
  MontaSelect.Descricao.Add('Data Final');
  MontaSelect.Descricao.Add('Nº Planilha');
  MontaSelect.Descricao.Add('Nº do Lanc');
  MontaSelect.Descricao.Add('Total Débito');
  MontaSelect.Descricao.Add('Total Crédito');
  MontaSelect.Descricao.Add('Módulo Origem');

  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('25');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('50');

  MontaSelect.Mascaras.Clear;
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('#,##0.00');
  MontaSelect.Mascaras.Add('#,##0.00');
  MontaSelect.Mascaras.Add('');


  // 5 - Define filtros...
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('PLANILHA.IDMODULO     = MODULO.IDMODULO');
  MontaSelect.Filtro.Add('PLANILHA.PEREXERCICIO = PERIODO.PEREXERCICIO');
  MontaSelect.Filtro.Add('PLANILHA.PERNUMERO    = PERIODO.PERNUMERO');
  MontaSelect.Filtro.Add('PLANILHA.IDPESSOA     = PERIODO.IDPESSOA');

  sql :=   MontaSelect.MontaSQL;

end;

// 07/01/04 Alex 14451 - Monta o default da segregação
procedure TFrmLancaContabMT.ProcuraSegregaCriter;
var
  iIdPlanoPrev, iIdPatro, iIdSegregaCriter: integer;
  sPlaConta: string;
begin
  sPlaConta := trim(cmpContaDeb.Conta.Numero);
  if sPlaConta = '' then sPlaConta := trim(cmpContaCre.Conta.Numero);
  iIdPlanoPrev := StrToIntDef(dblcPlanoPrevC.LookupValue, -1);
  iIdPatro     := StrToIntDef(dblcPatroC.LookupValue, -1);
  if (sPlaConta <> '') and (iIdPlanoPrev <> -1) and (iIdPatro <> -1) then begin
    // nehuma segregação foi informada pelo usuário
    if dbCboSegregaCriter.Text = '' then begin
      iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(Contab.PlanoParam, iIdPlanoPrev, iIdPatro, trim(cmpContaDeb.Conta.Numero), sPlaConta);
      // achada critério para segregação com parâmetros informados, colocar como default
      if iIdSegregaCriter <> -1 then begin
        cdsDet.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
        // verificar se a data está preenchida
        if dbEdSegregaData.Text = '' then begin
          cdsDet.FieldByName('DATASEGREGACRITER').AsDateTime := dbedData.DateTime;;
        end;
      end;
    end;
  end;
end;
// fim 07/01/04 Alex 14451

procedure TFrmLancaContabMT.dblcPlanoPrevCExit(Sender: TObject);
begin
  inherited;
  // Alex 07/01/04
  // 14/09/04 Alex - retirado estava confundindo com o novo método para segregação na origem,
  // onde temos lançamentos no plano O.C. sem critério para segregação, pois a mesma já foi feita
  // ProcuraSegregaCriter

end;

// 04/01/04 alex 14451
function TFrmLancaContabMT.VerificaPreenchimentoDet: boolean;
begin
  Result := False;
  try

    // se for um lançamento de segregação na origem cair fora
    // o sistema estava passando por este método pelo ok geral do form
    // com o if abaixo se passar não dará erro
    if not cdsDet.FieldByName('IDSEGREGACONTR').IsNull then begin
      Result := true;
      exit;
    end;

    // verificações para segregação virtual
    if (CtrlSegregacao.SegregaVirtual) then begin
      // plano = comum ou plano = adm ou patro = comum
      if (CtrlSegregacao.PlanoPrevComum = cdsDet.FieldByName('IDPLANOPREV').AsInteger) or
         (CtrlSegregacao.PlanoPrevAdm   = cdsDet.FieldByName('IDPLANOPREV').AsInteger) or
         (CtrlSegregacao.PatroComum     = cdsDet.FieldByName('IDPATRO').AsInteger) then begin

        // se plano = comum ou plano = adm => patro também deve ser = comum
        if not ((CtrlSegregacao.PlanoPrevComum = cdsDet.FieldByName('IDPLANOPREV').AsInteger) or
                (CtrlSegregacao.PlanoPrevAdm   = cdsDet.FieldByName('IDPLANOPREV').AsInteger)) then
          raise EValidacao.CreateVal('Para escolher a Patrocinadora "Comum" o Plano também deve ser "Comum" ou "Administrativo"!', dblcPlanoPrevC);
        if (CtrlSegregacao.PatroComum     <> cdsDet.FieldByName('IDPATRO').AsInteger) then
          raise EValidacao.CreateVal('Para escolher o Plano "Comum" ou "Administrativo" a Patronidora também deve ser "Comum"!', dblcPatroC);

        // aqui o critério de segregação é obrigatório
        // Alex 09/09/04 se a conta não for a de segregação
        if ( not CtrlSegregacao.ContaContabilDeSegregacao( cmpContaDeb.Conta.Numero )) and
           ( not CtrlSegregacao.ContaContabilDeSegregacao( cmpContaCre.Conta.Numero )) then begin
          if ( dbCboSegregaCriter.Text = '') then 
            raise EValidacao.CreateVal('O critério para segregação é obrigatório!', dbCboSegregaCriter);
          if dbEdSegregaData.Text = '' then
            raise EValidacao.CreateVal('A data do critério para segregação é obrigatória!', dbEdSegregaData);
        end;
      end else begin
        // aqui é plano comum e patro comum
        // aqui o critério de segregação é obrigatório
        if dbCboSegregaCriter.Text <> '' then
          raise EValidacao.CreateVal('O critério para segregação só deve ser preenchido para lançamentos com Plano "Comum"/"Administrativo" e Patro "Comum"!', dbCboSegregaCriter);
        if dbEdSegregaData.Text <> '' then
          raise EValidacao.CreateVal('O data critério para segregação só deve ser preenchido para lançamentos com Plano "Comum"/"Administrativo" e Patro "Comum"!', dbEdSegregaData);
      end;
    end;

    // Pendencia 16345
    if not( CtrlPlanPrevContabPatro.ValidaPlanoPatro(cdsDet.FieldByName('IDPATRO').AsInteger,
                                                     cdsDet.FieldByName('IDPLANOPREV').AsInteger
                                                     ) ) then
    begin
       raise EValidacao.CreateVal('Não existe relacionamento entre Patrocinadora e Plano escolhidos!', dblcPatroC);
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

procedure TFrmLancaContabMT.CmeDetalheApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  // Alex 07/01/04 14451
  Accept := VerificaPreenchimentoDet;
  inherited;
end;

procedure TFrmLancaContabMT.grdProvaZeroTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsProvaZero.IndexFieldNames := AFieldName;
end;

// Alex 08/01/04 14451
procedure TFrmLancaContabMT.grdProvaZeroCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if cdsProvaZero.FieldByName('TOT_SALDO').AsFloat <> 0 then begin
        //((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00A0A0FC; // vermelho claro
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;
// fim Alex 08/01/04 14451

// 08/01/04 Alex 14451
procedure TFrmLancaContabMT.RegraProvaZero;
begin
  cdsProvaZero.Data := Lancamento.SelecionaProvaZero( Cds.FieldByName('PLNCODIGO').AsFloat );
  cdsProvaZero.DisableControls;
  cdsProvaZero.First;
  lbProvaZero.Visible := false;
  while (not cdsProvaZero.Eof) and (not lbProvaZero.Visible) do begin
    if cdsProvaZero.FieldByName('TOT_SALDO').AsFloat <> 0 then
      lbProvaZero.Visible := true;
    cdsProvaZero.Next;
  end;
  cdsProvaZero.EnableControls;
end;
// fim 08/01/04 Alex 14451

// 08/01/04 Alex 14451
procedure TFrmLancaContabMT.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if CdsDet.State in dsEditModes then AllowChange := false
  else inherited;
end;
// fim 08/01/04 Alex 14451


procedure TFrmLancaContabMT.sbtnApagarClick(Sender: TObject);
begin
// início - André Tavares - pendência 16733 - 18/05/2004
  if (iIdModulo <> sistema.idmodulo) then
    if (MsgDlg('O Lançamento é de Origem de Outro Módulo. Deseja Realmente Excluir?',
       'Exclusão de Lançamentos', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
    begin
      bbtnCancelarClick(sender);
      Abort;
    end;
// fim - André Tavares - pendência 16733 - 18/05/2004

  inherited;
end;

procedure TFrmLancaContabMT.cdsDetAfterCancel(DataSet: TDataSet);
begin
  inherited;
  // Alex 14/09/2004 - 17193
  // FAZER UM REFRESH PARA PEGAR OS LANÇAMENTOS CRIADOS PELA SEGREGAÇÃO VIRTUAL
  If (not cds.FieldByName('PLNCODIGO').IsNull) and
     (cdsDet.FieldByName('MARCA').AsString <> 'S') then begin // não pode abrir a query quando a marca para exclusão estiver setada
    AbreQry(cds.FieldByName('PLNCODIGO').AsInteger, false);

    CalculaDebCre;
  end;
end;

procedure TFrmLancaContabMT.cdsDetAfterDelete(DataSet: TDataSet);
begin
  inherited;
  // Alex 14/09/2004 - 17193
  // FAZER UM REFRESH PARA PEGAR OS LANÇAMENTOS CRIADOS PELA SEGREGAÇÃO VIRTUAL
  If (not cds.FieldByName('PLNCODIGO').IsNull) and
     (cdsDet.FieldByName('MARCA').AsString <> 'S') then begin // não pode abrir a query quando a marca para exclusão estiver setada
    AbreQry(cds.FieldByName('PLNCODIGO').AsInteger, false);

    CalculaDebCre;
  end;
end;

procedure TFrmLancaContabMT.cdsDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  // Alex 14/09/2004 - 17193
  // FAZER UM REFRESH PARA PEGAR OS LANÇAMENTOS CRIADOS PELA SEGREGAÇÃO VIRTUAL
  If (not cds.FieldByName('PLNCODIGO').IsNull) and
     (cdsDet.FieldByName('MARCA').AsString <> 'S') then begin // não pode abrir a query quando a marca para exclusão estiver setada
    AbreQry(cds.FieldByName('PLNCODIGO').AsInteger, false);

    CalculaDebCre;
  end;
end;



procedure TFrmLancaContabMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  //  Rodolpho da Silva - P: 18434 - 14/04/2005
  TFloatField(DataSet.FieldByName('PLNTOTDEB')).DisplayFormat := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('PLNTOTCRE')).DisplayFormat := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('DIFERENCA')).DisplayFormat := '#,##0.00;(#,##0.00)';
end;




procedure TFrmLancaContabMT.cdsProvaZeroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  //  Rodolpho da Silva - P: 18434 - 14/04/2005
  TFloatField(DataSet.FieldByName('TOT_DEBITO')).DisplayFormat  := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('TOT_CREDITO')).DisplayFormat := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('TOT_SALDO')).DisplayFormat   := '#,##0.00;(#,##0.00)';
end;

end.



