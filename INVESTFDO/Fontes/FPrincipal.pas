//******************************************************************************
// Autor     : Monica
// Data      : 17/01/2007
// Codigo    : AL_7
// Pendência : 24235
// Sol       :
// Motivo    : Implementação da nova tela de tipo de investimento por Usuários
//             (3 camadas)
//******************************************************************************
// Autor     : Monica
// Data      : 19/01/2007
// Codigo    : AL_6
// Pendência : 24254
// Sol       :
// Motivo    : Implementação de Altera Plano Contabil e Patrocinadora
//             (3 camadas)
//******************************************************************************
// Autor     : Monica
// Data      : 15/01/2007
// Codigo    : AL_5
// Pendência : 24236
// Sol       :
// Motivo    : Implementação da nova tela de tipo de rubrica em 3 camadas
//             Nova CtrlPInv para conter os parâmetros do investimento
// Autor    : Fabio Fagundes
// Data     : 10/06/2005
// AL_4
// Motivo   : Inclusao da Consultas FParamMapaInvFdo e DmRelMapaInvFdo e CtrlInvContab
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 01/12/2004
// AL_3
// Motivo   : Inclusao do relatório DmRelConsAmortFdo;
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 25/10/2004
// AL_2
// Motivo   : Inclusao do relatório DmRelConsCotaIntegrFundo
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 13/08/2004
// AL_1
// Motivo   : Inclusao do Form DmRelParamContab
//******************************************************************************

unit Fprincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  StdCtrls, TB97, Db, DBTables, Wwquery, Wwdatsrc, wwdblook, Mask, wwdbedit,
  DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, Wwtable,
  Grids, DBGrids, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti,
  CMProcuraMask, CorreioCM, fcLabel, TREdit, OleCtrls, vcf1, fcOutlookList,
  fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar,
  ToolWin, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar, dReports,
  CMApplicationEvents, SConnect, MConnect, DBClient,
  uResource, uCtrlInvContab, uCtrlPadroes, CMNetUsers,
  //AL_5
  uCtrlParamInvest;

type

//******************************************************************************
  TDadosCotas = Record
                 DataCota:TDate;
                 VlrCota :Double
               End;
//******************************************************************************

  TFrmPrincipal = class(TfrmCMPrincipal)
    mnuGerais: TMenuItem;
    QryAuxiliar: TwwQuery;
    mnuTiposdeOperacao: TMenuItem;
    Qry: TwwQuery;
    DS: TwwDataSource;
    QryAux: TwwQuery;
    PopupMenu1: TPopupMenu;
    w1: TMenuItem;
    N26: TMenuItem;
    BtCalculadoraWindows: TToolbarButton97;
    QryParamImport: TwwQuery;
    Timer: TTimer;
    Parmentros1: TMenuItem;
    QryParamImportIDPARAMIMPEXCEL: TFloatField;
    QryParamImportIDBOLSAVALORES: TFloatField;
    QryParamImportNOMEPARAM: TStringField;
    QryParamImportATUALIZALINK: TStringField;
    QryParamImportHORA: TStringField;
    QryParamImportPERIODICIDADE: TStringField;
    QryParamImportDTCOTACAO: TDateTimeField;
    QryParamImportCAMINHO: TStringField;
    QryParamImportNOMEPLANILHA: TStringField;
    QryParamImportPRIMEIRALINHA: TFloatField;
    QryParamImportCODACAO: TStringField;
    QryParamImportABERTURA: TStringField;
    QryParamImportFECHAMENTO: TStringField;
    QryParamImportMAXIMA: TStringField;
    QryParamImportMINIMA: TStringField;
    QryParamImportMEDIO: TStringField;
    QryParamImportVOLUME: TStringField;
    QryParamImportFLGATIVO: TStringField;
    mnuCarteiradeInvestimento: TMenuItem;
    mnuOperacao: TMenuItem;
    mnuGestoresdeCarteiras: TMenuItem;
    mnuIntegracaoContabileFinanceira: TMenuItem;
    N4: TMenuItem;
    MnuFechamento: TMenuItem;
    mnuCadFundosInvest: TMenuItem;
    mnuCadTipoFundo: TMenuItem;
    MnuOperFundosInvest: TMenuItem;
    mnuFundos: TMenuItem;
    N22: TMenuItem;
    mnuCotas: TMenuItem;
    mnuPatrimonio: TMenuItem;
    tb97AtalhoFND: TToolbar97;
    sbtnLancamentosFND: TToolbarButton97;
    ToolbarSep979: TToolbarSep97;
    sbtnCotas: TToolbarButton97;
    sbtnFechamentoDiarioFND: TToolbarButton97;
    ToolbarSep9710: TToolbarSep97;
    mnuAlteraPlanoContabPatro: TMenuItem;
    Button1: TButton;
    mnuCategoriadosFundos: TMenuItem;
    mnuUsuarioXTipodeInvestimento: TMenuItem;
    N21: TMenuItem;
    mnuItmFundoImobiliario: TMenuItem;
    mnuFluxoCotasIntegralizar: TMenuItem;
    mnuFluxoIntegraCotas: TMenuItem;
    mnuRecebimentodeDividendos: TMenuItem;
    mnuSQL: TMenuItem;
    QryAuxiliar1: TwwQuery;
    QryAuxiliar2: TwwQuery;
    DataSource1: TDataSource;
    mnuCotasaIntegralizar: TMenuItem;
    N40: TMenuItem;
    dbtnUsuTipoInvest: TToolbarButton97;
    ToolbarSep9712: TToolbarSep97;
    sbtnPlanPrevCtbPatr: TToolbarButton97;
    sbtnParamSistema: TToolbarButton97;
    mnuVerificacaodeMenusSAD: TMenuItem;
    mnuFchFnd: TMenuItem;
    mnuTesteDatas: TMenuItem;
    MnuConsFinancContab: TMenuItem;
    QryAuxiliarAcerto: TwwQuery;
    QryUpdHistFundo: TwwQuery;
    QryFatorCota: TwwQuery;
    DsFatorCota: TwwDataSource;
    UpdFatorCota: TUpdateSQL;
    N46: TMenuItem;
    qryInsItemRenFix: TwwQuery;
    qryInsCMPBD: TwwQuery;
    qryInsCMPBDGRP: TwwQuery;
    qryInsTipoOperacao: TwwQuery;
    mnuImportacaodeCotasFnd: TMenuItem;
    PopMnuTipoFundo: TPopupMenu;
    MenuItemACOES: TMenuItem;
    MenuItemFAC: TMenuItem;
    MenuItemFIF: TMenuItem;
    MenuItemFDC: TMenuItem;
    MenuItemIMOB: TMenuItem;
    MnuDireitoCreditorio: TMenuItem;
    MnuCotasDirCred: TMenuItem;
    MnuFundoLancamentoDirCred: TMenuItem;
    N47: TMenuItem;
    MnuTipodeCota: TMenuItem;
    N54: TMenuItem;
    MnuQtdeCotasEmiDirCred: TMenuItem;
    MnuFluxoCotaIntegrDirCred: TMenuItem;
    N55: TMenuItem;
    MnuAmortizacaoDirCred: TMenuItem;
    MnuIntegrCotaDirCred: TMenuItem;
    mnuFundoLancamento: TMenuItem;
    mnuAmortizacaodeCotas: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    MnuTransfPlanoFundos: TMenuItem;
    MnuConsSaldoFundos: TMenuItem;
    mnuMapaInvestFdo: TMenuItem;
    N7: TMenuItem;
    mnuDespesas: TMenuItem;
    mnuTiposdeDespesa: TMenuItem;
    mnuDespesasporTipodeOperacao: TMenuItem;

    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuTiposdeOperacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtCalculadoraWindowsClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Parmentros1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuCarteiradeInvestimentoClick(Sender: TObject);
    procedure mnuGestoresdeCarteirasClick(Sender: TObject);
    procedure mnuCadTipoFundoClick(Sender: TObject);
    procedure mnuFundosClick(Sender: TObject);
    procedure mnuCotasClick(Sender: TObject);
    procedure mnuPatrimonioClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure HabilitaMenus;
    procedure mnuAlteraPlanoContabPatroClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure mnuRentabilidadeDosFundosClick(Sender: TObject);
    procedure mnuCategoriadosFundosClick(Sender: TObject);
    procedure ActLoginExecute(Sender: TObject);
    procedure mnuRentabilidadeFundosAcoesClick(Sender: TObject);
    procedure mnuUsuarioXTipodeInvestimentoClick(Sender: TObject);
    procedure mnuSQLClick(Sender: TObject);
    procedure mnuSldCompFundoClick(Sender: TObject);
    procedure MnuComposicaoCartFdoClick(Sender: TObject);
    procedure mnuVerificacaodeMenusSADClick(Sender: TObject);
    procedure mnuFchFndClick(Sender: TObject);
    procedure mnuTesteDatasClick(Sender: TObject);
    procedure mnuImportacaodeCotasFndClick(Sender: TObject);
    procedure MnuCotasDirCredClick(Sender: TObject);
    procedure MnuFundoLancamentoDirCredClick(Sender: TObject);
    procedure MnuTipodeCotaClick(Sender: TObject);
    procedure MnuFluxoCotaIntegrDirCredClick(Sender: TObject);
    procedure MnuIntegrCotaDirCredClick(Sender: TObject);
    procedure MnuAmortizacaoDirCredClick(Sender: TObject);
    procedure MnuQtdeCotasEmiDirCredClick(Sender: TObject);
    procedure w1Click(Sender: TObject);
    procedure mnuIntegracaoContabileFinanceiraClick(Sender: TObject);
    procedure mnuCotasaIntegralizarClick(Sender: TObject);
    procedure mnuFluxoCotasIntegralizarClick(Sender: TObject);
    procedure mnuFluxoIntegraCotasClick(Sender: TObject);
    procedure mnuRecebimentodeDividendosClick(Sender: TObject);
    procedure mnuFundoLancamentoClick(Sender: TObject);
    procedure mnuAmortizacaodeCotasClick(Sender: TObject);
    procedure MnuTransfPlanoFundosClick(Sender: TObject);
    procedure MnuConsSaldoFundosClick(Sender: TObject);
    procedure mnuMapaInvestFdoClick(Sender: TObject);
    procedure mnuTiposdeDespesaClick(Sender: TObject);
    procedure mnuDespesasporTipodeOperacaoClick(Sender: TObject);

  private
    { Private declarations }
    Function  ExisteFormulario : Boolean;
    function  LeValorArray(sValor: String; sValDefault: String = ''): String;
    Procedure AcertaClausulaSQL(dtmReport: TdtmReports);


  public
    { Public declarations }
    TipoInvest: Integer;
    Procedure MudaMenu(iTipoInvest : Integer; TipoMenu : Char);

  end;

//******************************************************************************
// DECLARACAO DOS TIPOS
  TpRecord=Record
             Id :Integer;
             Str:String;
           End;
  TpPoint = ^TpRecord;

  TpArrayRec = Array[0..10] Of TpRecord;


var
  FrmPrincipal: TFrmPrincipal;
  wUltImport:TTime;
  TipoMenuInvest:Char;
  sNumVersao : String;
  wCaption: String;

implementation

uses

  FTelaAut, uBibliotecaInvest,UOperacaoInvest, USistema, dOperComum, UMensErro,
  UIntegraBack, UModulo, dBaseDados,
  FParamInvest, FParamImportExcel, FSQL, FVerificaMenuSAD, FTesteDatas,FCadGestor, FCadCarteira,
  //AL_6
  //FAlteraPatroPlanPrevContab,
  FAlteraPatroPlanPrevContabMT,
  //AL_7
  //FCadTipoInvUsu,
  fCadTipoInvUsuMT,
  //AL_5
  //FCadTipoDespInvest,
  FCadTipoDespInvestMT,

  FCadTipoFundoInvest, FCadFundo, FCadCategoriaFundo, FCadComposicaoFundo,
  FCadTipoCota, FimportaCotacoesFundos, FCadLancamentoFundo,
  FCadEspLancamento, FConsVerificaResgate,
  FCadAmortizacaoCotas, FCadLancFundosEmol, FCadLanctoFundoVdAcoes,
  FCadLanctoVdFundoCpAcoes, FCadOperFundosDirCred, FFechtoFundos,
  FConsRentFundos, FConsRentFundoAcoes, FCadCotaFundo, FCadPatrimonioFundo,
  FCadAjusteCertificado, FCadIncorporacaoFundo, FCadResgFdoAnuncioProv,
  FCadCotIntegrFundo, FCadCotasIntegralizar, FCadFluxoCotasIntegralizar,
  FCadOperDividendosFdo, FCadCotaFundoDirCred, FCadPatrimonioFDC,
  FCadFluxoCotaIntDirCred, FCadCotasIntegrDirCred, FCadAmortizCotaDirCred,
  FConsCarteiraFundos, FConsSldCompFundo, FConsRentabilidade,
  FConsRentabCartSPC, FImportaCotacoesExcel, FDmRelatoriosFundos,
  FDmRelRentabInvest, FDmRelFundosSaldo, FDmRelFundosEmol, FDmRelRentabSPC,
  FCadTipoOper, FCadContaContab, FDmRelCarteiraFundos,
  FCadAmortizacaoCotasAcoes, FDmRelParamContab, FDmRelFundosConsMov,
  FCadTransfPlanos, FDMRelOperRecebtoFdo, FParamOperRecebtoFdo,
  FDmRelConsCotaFundo, FDmRelConsCotaIntegrFundo,FDmRelConsAmortFdo,
  FConsSaldoFundos, FParamMapaInvFdo, FDmRelMapaInvFdo,FCadDespTipoOper;

{$R *.DFM}

procedure TFrmPrincipal.FormShow(Sender: TObject);
Var
  wTipoMenu:Char;
  I: Integer;
begin
  inherited;
   Try
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add('SELECT IDTIPOINVEST FROM TIPOINVEST ');
      QryAuxiliar.Open;
   Except
      MessageDlg('Erro ao Abrir o Aplicativo',mtError,[MbOk],0);
      Application.Terminate;
   End;
   If QryAuxiliar.IsEmpty Then
   Begin
      ExecutaQuery(QryAuxiliar,'INSERT INTO TIPOINVEST (IDTIPOINVEST,DESCTIPOINVEST) '+
                               'VALUES (1,''Renda Fixa'')');
      ExecutaQuery(QryAuxiliar,'INSERT INTO TIPOINVEST (IDTIPOINVEST,DESCTIPOINVEST) '+
                               'VALUES (2,''Renda Variavel'')');
      ExecutaQuery(QryAuxiliar,'INSERT INTO TIPOINVEST (IDTIPOINVEST,DESCTIPOINVEST) '+
                               'VALUES (3,''Investimentos Imobiliarios '')');
      ExecutaQuery(QryAuxiliar,'INSERT INTO TIPOINVEST (IDTIPOINVEST,DESCTIPOINVEST) '+
                               'VALUES (4,''Emprestimos'')');
   End;
   // Busca Inicio da Carteira
   FazQuery(QryAuxiliar,'SELECT * FROM PARAMINVEST');
   wValIniCotasGlobal := QryAuxiliar.FieldByName('VLRCOTAINICART').AsFloat;

   // Ambiente de Importacao das Cotacoes
   FazQuery(QryParamImport,'SELECT * FROM PARAMIMPORTEXCEL');
   if Pos('.CM',Sistema.NomeUsuario) < 0 then // Somente para usuário não CM
      Timer.Enabled:=True;

   wUltImport   :=Time;
   
   dtmOperComum.qryEmpresa.Open;
end;

procedure TFrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmParamInvest,TFrmParamInvest,False);
end;

procedure TFrmPrincipal.Parmentros1Click(Sender: TObject);
begin
  inherited;
  AbrirFormModal(FrmParamImportExcel,TFrmParamImportExcel);
  // Ambiente de Importacao das Cotacoes
  FazQuery(QryParamImport,'SELECT * FROM PARAMIMPORTEXCEL');
end;

procedure TFrmPrincipal.mnuSQLClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmSql,TfrmSql,False);
end;

procedure TFrmPrincipal.mnuVerificacaodeMenusSADClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmVerificaMenuSad,TfrmVerificaMenuSad,False);
end;

procedure TFrmPrincipal.mnuTesteDatasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmTesteDatas,TfrmTesteDatas,False);
end;

procedure TFrmPrincipal.mnuAlteraPlanoContabPatroClick(Sender: TObject);
begin
  If Not ExisteFormulario Then
  Begin
    inherited;
    //AL_6
    //frmAlteraPatroPlanPrevContab.ShowModal;
    AbrirFormModal(frmAlteraPatroPlanPrevContabMT, TfrmAlteraPatroPlanPrevContabMT);
  End;
end;

procedure TFrmPrincipal.mnuGestoresdeCarteirasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadGestor,TfrmCadGestor,False);
end;

procedure TFrmPrincipal.mnuCarteiradeInvestimentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCarteira,TfrmCadCarteira,False);
end;

procedure TFrmPrincipal.mnuUsuarioXTipodeInvestimentoClick(
  Sender: TObject);
begin
  inherited;
  //AL_7
  //AbrirForm(frmCadTipoInvUsu,TfrmCadTipoInvUsu,False);
  AbrirForm(frmCadTipoInvUsuMT,TfrmCadTipoInvUsuMT,False);
end;

procedure TFrmPrincipal.mnuCadTipoFundoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoFundoInvest,TfrmCadTipoFundoInvest,False);
end;

procedure TFrmPrincipal.mnuFundosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadFundo, TfrmCadFundo,False);
end;

procedure TFrmPrincipal.mnuCategoriadosFundosClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadCatogoriaFundo,TfrmCadCatogoriaFundo,False);
end;

procedure TFrmPrincipal.MnuTipodeCotaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadTipoCota,TfrmCadTipoCota,False);
end;

procedure TFrmPrincipal.mnuImportacaodeCotasFndClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmImportaCotacoesFundos,TFrmImportaCotacoesFundos,False);
end;

procedure TFrmPrincipal.mnuCotasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCotaFundo,TfrmCadCotaFundo,False);
end;

procedure TFrmPrincipal.mnuPatrimonioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadPatrimonioFundo,TfrmCadPatrimonioFundo,False);
end;

procedure TFrmPrincipal.MnuCotasDirCredClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCotaFundoDirCred,TfrmCadCotaFundoDirCred,False);
end;

procedure TFrmPrincipal.MnuFundoLancamentoDirCredClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadOperFundosDirCred,TFrmCadOperFundosDirCred,False);
end;

procedure TFrmPrincipal.MnuQtdeCotasEmiDirCredClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPatrimonioFDC,TfrmCadPatrimonioFDC,False);
end;

procedure TFrmPrincipal.MnuFluxoCotaIntegrDirCredClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadFluxoCotaIntDirCred,TfrmCadFluxoCotaIntDirCred,False);
end;

procedure TFrmPrincipal.MnuAmortizacaoDirCredClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadAmortizCotaDirCred,TFrmCadAmortizCotaDirCred,False);
end;

procedure TFrmPrincipal.MnuIntegrCotaDirCredClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadCotasIntegrDirCred,TfrmCadCotasIntegrDirCred,False);
end;

procedure TFrmPrincipal.MnuComposicaoCartFdoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConsCarteiraFundos,TFrmConsCarteiraFundos,False);
end;

procedure TFrmPrincipal.mnuFchFndClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmFechtoFundos,TFrmFechtoFundos,False)
end;

procedure TFrmPrincipal.mnuSldCompFundoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConsSldCompFundo,TFrmConsSldCompFundo,False);
end;

procedure TFrmPrincipal.mnuRentabilidadeDosFundosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsRentFundos,TfrmConsRentFundos,False);
end;

procedure TFrmPrincipal.mnuRentabilidadeFundosAcoesClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsRentFundoAcoes,TfrmConsRentFundoAcoes,False);
end;

procedure TFrmPrincipal.mnuTiposdeOperacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoOper,TfrmCadTipoOper,False);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
   // AL_4
   CtrlInvContab          := TCtrlInvContab.Create;
   //AL_5
   CtrlPInv := TCtrlParamInvest.Create;

   fDbiSetDateFormat;
   TipoMenuInvest:='I';
end;

procedure TFrmPrincipal.BtCalculadoraWindowsClick(Sender: TObject);
begin
  inherited;
  WinExec('Calc.Exe',SW_SHOWNORMAL);
end;

procedure TFrmPrincipal.TimerTimer(Sender: TObject);
begin
   inherited;
   if Pos('.CM',Sistema.NomeUsuario) < 0 then // Somente para usuário não CM
   begin
      FazQuery(QryParamImport,'SELECT * FROM PARAMIMPORTEXCEL');
      if (QryParamImport.FieldByName('FLGATIVO').AsString = 'S') then
      begin
         // Caso importacao em hora especifica
         if (QryParamImport.FieldByName('HORA').AsString <> '') then
         begin
            if QryParamImport.FieldByName('HORA').AsString = FormatDateTime('HH:NN',NOW) then
            begin
               frmImportaCotacoesExcel := TFrmImportaCotacoesExcel.Create(Application);
               FrmImportaCotacoesExcel.wImportaAutomatico := True;
               FrmImportaCotacoesExcel.bbtnConfirmarClick(Sender);
            end;
         end
         // Caso por Periodicidade
         else if (QryParamImport.FieldByName('PERIODICIDADE').AsString <> '') then
         begin
            if ( FormatDateTime('HH:NN', Time - wUltImport ) >= QryParamImport.FieldByName('PERIODICIDADE').AsString )  then
            begin
               FrmImportaCotacoesExcel := TFrmImportaCotacoesExcel.Create(Application);
               FrmImportaCotacoesExcel.wImportaAutomatico := True;
               FrmImportaCotacoesExcel.bbtnConfirmarClick(Sender);
               wUltImport := Time;
            end;
         end;
      end;
   end;
end;

Procedure TFrmPrincipal.MudaMenu(iTipoInvest : Integer; TipoMenu:Char);
Begin
  wCaption := ' - Módulo : Fundos de Investimento';
//  tb97AtalhoModulos.Visible   := True;
//  tb97AtalhoModulos.DockPos   := 231;
  TipoMenu := 'I';
  {
  Case TipoMenu of
     // Caso Ambos (A)
     'A':
     begin
        // Aparece com RV, RF, BM&F, Fundos
        FrmPrincipal.Caption        := wCaption + ' - Todos os Modulos';
        mnuTodos.Checked            := True;
        sbtnTodos.Enabled           := False;
        stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := '';
        // Aparece com o Fechamento
        MnuFechamento.Visible       := True;
        // RV
        MnuCadRendaVariavel.Visible := True;   // Cadastros / Renda Variavel
        MnuOperRendVariavel.Visible := True;   // Operacoes / Renda Variavel
        MnuBolsa.Visible            := True;   // Cadastros / Gerais / Bolsa de Valores
        MnuLancAcoes.Visible        := True;   // Operacoes / Isoladas / Acoes
        mnuFchRV.Visible            := True;   // Fechamento RV
        MnuConsRenVariavel.Visible  := True;   // Consultas / Renda Variavel
        sbtnRV.Enabled              := True;
        tb97AtalhoRV.Visible        := False;
        MnuItmRendaVar.Checked      := False;
        mnuFechtoEmpAcoes.Visible   := True;
        // RF
        mnuFchRF.Visible            := True;   // Fechamento RF
        MnuCadRendaFixa.Visible     := True;   // Cadastros / Renda Fixa
        MnuOperRendaFixa.Visible    := True;   // Operacoes / Renda Fixa
        MnuLancRFixa.Visible        := True;   // Operacoes / Isoladas / Renda Fixa
        mnuConsRenFixa.Visible      := True;   // Consultas / Renda Fixa
        sbtnRF.Enabled              := True;
        tb97AtalhoRF.Visible        := False;
        MnuItmRendaFixa.Checked     := False;
        // BM&F
        mnuCadBMF.Visible           := True;   // Cadastros / BM&F
        mnuOperBMF.Visible          := True;   // Operacoes / BM&F
        mnuConsBMF.Visible          := True;   // Consultas / BM&F
        sbtnBMF.Enabled             := True;
        tb97AtalhoBMF.Visible       := False;
        mnuItmBMF.Checked           := False;
        // Fundos de Investimento
        mnuFchFnd.Visible           := True;   // Fechamento Fundos
        mnuCadFundosInvest.Visible  := True;   // Cadastros
        MnuOperFundosInvest.Visible := True;   // Operacoes
        MnuLancFundoInvest.Visible  := True;   // Operacoes / Isoladas / Fundos de Investimento
        mnuConsFundoInvest.Visible  := True;   // Consultas / Fundos de Investimento
        sbtnFundos.Enabled          := True;
        tb97AtalhoFND.Visible       := False;
        mnuItmFundos.Checked        := False;

        mnuCadOpcInd.Visible         := True;
        mnuOperOpcoesIndices.Visible := True;
     end;
     // Caso Renda Fixa (F)
     'F':
     begin
        stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRPI.DATAULTFECHRF);
        // Aparece com o Fechamento
        MnuFechamento.Visible       := True;
        // Aparece com RF
        FrmPrincipal.Caption        := wCaption + ' - Modulo Renda Fixa';
        MnuLancRFixa.Visible        := True;   // Operacoes / Isoladas / Renda Fixa
        MnuCadRendaFixa.Visible     := True;   // Cadastros / Renda Fixa
        MnuOperRendaFixa.Visible    := True;   // Operacoes / Renda Fixa
        mnuConsRenFixa.Visible      := True;   // Consultas / Renda Fixa
        mnuFchRF.Visible            := True;   // Fechamento RF
        tb97AtalhoRF.Visible        := True;
        tb97AtalhoRF.DockPos        := 367;
        MnuItmRendaFixa.Checked     := True;
        mnuTodos.Checked            := False;
        sbtnRF.Enabled              := False;
        sbtnTodos.Enabled           := True;
        // Some com RV
        mnuFchRV.Visible            := False;  // Fechamento RV
        MnuCadRendaVariavel.Visible := False;  // Cadastros / Renda Variavel
        MnuOperRendVariavel.Visible := False;  // Operacoes / Renda Variavel
        MnuBolsa.Visible            := False;  // Cadastros / Gerais / Bolsa de Valores
        MnuLancAcoes.Visible        := False;  // Operacoes / Isoladas / Acoes
        MnuConsRenVariavel.Visible  := False;  // Consultas / Renda Variavel
        tb97AtalhoRV.Visible        := False;
        sbtnRV.Enabled              := True;
        MnuItmRendaVar.Checked      := False;
        mnuFechtoEmpAcoes.Visible   := False;
        //Some com BM&F
        mnuCadBMF.Visible           := False;  // Cadastros / BM&F
        mnuOperBMF.Visible          := False;  // Operacoes / BM&F
        mnuConsBMF.Visible          := False;  // Consultas / BM&F
        tb97AtalhoBMF.Visible       := False;
        sbtnBMF.Enabled             := True;
        mnuItmBMF.Checked           := False;
        //Some com Fundos Invest.
        mnuFchFnd.Visible           := False;  // Fechamento Fundos
        mnuCadFundosInvest.Visible  := False;  // Cadastros / Fundos de Investimento
        MnuOperFundosInvest.Visible := False;  // Operacoes / Fundos de Investimento
        MnuLancFundoInvest.Visible  := False;  // Operacoes / Isoladas / Fundos de Investimento
        mnuConsFundoInvest.Visible  := False;  // Consultas / Fundos de Investimento
        tb97AtalhoFND.Visible       := False;
        sbtnFundos.Enabled          := True;
        mnuItmFundos.Checked        := False;

        mnuCadOpcInd.Visible         := False;
        mnuOperOpcoesIndices.Visible := False;
     end;
     // Caso Renda Variavel (V)
     'V':
     begin
        stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRPI.DATAULTFECH);
        // Aparece com o Fechamento
        MnuFechamento.Visible       := True;
        // Aparece com RV
        FrmPrincipal.Caption        := wCaption + ' - Modulo Renda Variável';
        MnuCadRendaVariavel.Visible := True;   // Cadastros / Renda Variavel
        MnuOperRendVariavel.Visible := True;   // Operacoes / Renda Variavel
        MnuBolsa.Visible            := True;   // Cadastros / Gerais / Bolsa de Valores
        MnuLancAcoes.Visible        := True;   // Operacoes / Isoladas / Acoes
        mnuFchRV.Visible            := True;   // Fechamento RV
        MnuConsRenVariavel.Visible  := True;   // Consultas / Renda Variavel
        tb97AtalhoRV.Visible        := True;
        tb97AtalhoRV.DockPos        := 367;
        MnuItmRendaVar.Checked      := True;
        mnuTodos.Checked            := False;
        sbtnRV.Enabled              := False;
        sbtnTodos.Enabled           := True;
        mnuFechtoEmpAcoes.Visible   := True;
        // Some com RF
        mnuFchRF.Visible            := False;  // Fechamento RF
        MnuLancRFixa.Visible        := False; // Operacoes / Isoladas / Renda Fixa
        MnuCadRendaFixa.Visible     := False; // Cadastros / Renda Fixa
        MnuOperRendaFixa.Visible    := False; // Operacoes / Renda Fixa
        mnuConsRenFixa.Visible      := False; // Consultas / Renda Fixa
        tb97AtalhoRF.Visible        := False;
        MnuItmRendaFixa.Checked     := False;
        mnuTodos.Checked            := False;
        sbtnRF.Enabled              := True;
        // Some com BM&F
        mnuCadBMF.Visible           := False;  // Cadastros / BM&F
        mnuOperBMF.Visible          := False;  // Operacoes / BM&F
        mnuConsBMF.Visible          := False;  // Consultas / BM&F
        tb97AtalhoBMF.Visible       := False;
        sbtnBMF.Enabled             := True;
        mnuItmBMF.Checked           := False;
        // Some com Fundos Invest.
        mnuFchFnd.Visible           := False;  // Fechamento Fundos
        mnuCadFundosInvest.Visible  := False;  // Cadastros / Fundos de Investimento
        MnuOperFundosInvest.Visible := False;  // Operacoes / Fundos de Investimento
        MnuLancFundoInvest.Visible  := False;  // Operacoes / Isoladas / Fundos de Investimento
        mnuConsFundoInvest.Visible  := False;  // Consultas / Fundos de Investimento
        tb97AtalhoFND.Visible       := False;
        sbtnFundos.Enabled          := True;
        mnuItmFundos.Checked        := False;

        mnuCadOpcInd.Visible         := True;
        mnuOperOpcoesIndices.Visible := True;
     end;
     // Caso BM&F (B)
     'B':
     begin
        stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRPI.DATAULTFECHBMF);
        // Some com o Fechamento
        MnuFechamento.Visible       := False;
        // Aparece com BM&F
        FrmPrincipal.Caption        := wCaption + ' - Modulo BM&F';
        mnuCadBMF.Visible           := True;   // Cadastros / BM&F
        mnuOperBMF.Visible          := True;   // Operacoes / BM&F
        mnuConsBMF.Visible          := True;   // Consultas / BM&F
        tb97AtalhoBMF.Visible       := True;
        tb97AtalhoBMF.DockPos       := 367;
        sbtnBMF.Enabled             := False;
        mnuItmBMF.Checked           := True;
        mnuTodos.Checked            := False;
        sbtnTodos.Enabled           := True;
        // Some com RV
        MnuCadRendaVariavel.Visible := False;  // Cadastros / Renda Variavel
        MnuOperRendVariavel.Visible := False;  // Operacoes / Renda Variavel
        MnuBolsa.Visible            := False;  // Cadastros / Gerais / Bolsa de Valores
        MnuLancAcoes.Visible        := False;  // Operacoes / Isoladas / Acoes
        MnuConsRenVariavel.Visible  := False;  // Consultas / Renda Variavel
        tb97AtalhoRV.Visible        := False;
        sbtnRV.Enabled              := True;
        MnuItmRendaVar.Checked      := False;
        mnuFechtoEmpAcoes.Visible   := False;        
        // Some com RF
        MnuLancRFixa.Visible        := False; // Operacoes / Isoladas / Renda Fixa
        MnuCadRendaFixa.Visible     := False; // Cadastros / Renda Fixa
        MnuOperRendaFixa.Visible    := False; // Operacoes / Renda Fixa
        mnuConsRenFixa.Visible      := False; // Consultas / Renda Fixa
        tb97AtalhoRF.Visible        := False;
        MnuItmRendaFixa.Checked     := False;
        sbtnRF.Enabled              := True;
        // Some com Fundos Invest.
        mnuCadFundosInvest.Visible  := False;  // Cadastros / Fundos de Investimento
        MnuOperFundosInvest.Visible := False;  // Operacoes / Fundos de Investimento
        MnuLancFundoInvest.Visible  := False;  // Operacoes / Isoladas / Fundos de Investimento
        mnuConsFundoInvest.Visible  := False;  // Consultas / Fundos de Investimento
        tb97AtalhoFND.Visible       := False;
        sbtnFundos.Enabled          := True;
        mnuItmFundos.Checked        := False;

        mnuCadOpcInd.Visible         := False;
        mnuOperOpcoesIndices.Visible := False;
     end;
     // Caso Fundos de Invest. (I)
     'I':
     begin
        stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRPI.DATAULTFECHFDO);
        // Aparece com o Fechamento
        MnuFechamento.Visible       := True;
        // Aparece com Fundos Invest.
        FrmPrincipal.Caption        := wCaption + ' - Modulo Fundos de Investimento';
        mnuFchFnd.Visible           := True;  // Fechamento Fundos
        mnuCadFundosInvest.Visible  := True;   // Cadastros
        MnuOperFundosInvest.Visible := True;   // Operacoes
        MnuLancFundoInvest.Visible  := True;   // Operacoes / Isoladas / Fundos de Investimento
        mnuConsFundoInvest.Visible  := True;   // Consultas / Fundos de Investimento
        tb97AtalhoFND.Visible       := True;
        tb97AtalhoFND.DockPos       := 367;
        sbtnFundos.Enabled          := False;
        mnuItmFundos.Checked        := True;
        mnuTodos.Checked            := False;
        sbtnTodos.Enabled           := True;

        mnuImportacaodeCotasFnd.Enabled     := True;
        mnuCotas.Enabled                    := True;
        mnuFundoLancamento.Enabled          := True;
        MnuCadEspLancamento.Enabled         := True;
        mnuVerificaResgate.Enabled          := True;
        mnuAcoesFundos.Enabled              := True;
        mnuItmFundoImobiliario.Enabled      := True;

        //Telas especificas de Fundos RF / Fundos de Ações / Fundos Imobiliarios / Fundos FDC
        if iTipoInvest = 5 then
        begin
           MnuComposicaoCartFdo.Enabled        := True;
           mnuPosicaoFundo.Enabled             := False;
           mnuAcoesFundos.Enabled              := False;
           mnuRentabilidadeDosFundos.Enabled   := True;
           mnuRentabilidadeFundosAcoes.Enabled := False;
           mnuItmFundoImobiliario.Enabled      := False;
           mnuSldCompFundo.Enabled             := True;
           MnuDireitoCreditorio.Enabled        := False;
        end
        else if iTipoInvest = 6 then
        begin
           MnuComposicaoCartFdo.Enabled        := True;
           mnuPosicaoFundo.Enabled             := True;
           mnuAcoesFundos.Enabled              := True;
           mnuRentabilidadeDosFundos.Enabled   := False;
           mnuRentabilidadeFundosAcoes.Enabled := True;
           mnuItmFundoImobiliario.Enabled      := False;
           mnuSldCompFundo.Enabled             := False;
           MnuDireitoCreditorio.Enabled        := False;
        end
        else if iTipoInvest = 7 then
        begin
           mnuPosicaoFundo.Enabled             := False;
           mnuAcoesFundos.Enabled              := False;
           mnuRentabilidadeDosFundos.Enabled   := False;
           mnuRentabilidadeFundosAcoes.Enabled := False;
           mnuItmFundoImobiliario.Enabled      := True;
           MnuComposicaoCartFdo.Enabled        := False;
           mnuSldCompFundo.Enabled             := False;
           MnuCadEspLancamento.Enabled         := False;
           mnuVerificaResgate.Enabled          := False;
           mnuTransferenciaFundos.Enabled      := False;
           mnuAjustedeCertificado.Enabled      := False;
           mnuPatrimonio.Enabled               := False;
           MnuDireitoCreditorio.Enabled        := False;
        end
        else if iTipoInvest = 9 then
        begin
           mnuImportacaodeCotasFnd.Enabled     := False;
           mnuCotas.Enabled                    := False;
           mnuFundoLancamento.Enabled          := False;
           MnuCadEspLancamento.Enabled         := False;
           mnuVerificaResgate.Enabled          := False;
           mnuAcoesFundos.Enabled              := False;
           mnuItmFundoImobiliario.Enabled      := False;
           MnuDireitoCreditorio.Enabled        := True;
           MnuCotasDirCred.Enabled             := True;
           MnuFundoLancamentoDirCred.Enabled   := True;
        end;
        // Some com RV
        mnuFchRV.Visible            := False;   // Fechamento RV
        MnuCadRendaVariavel.Visible := False;  // Cadastros / Renda Variavel
        MnuOperRendVariavel.Visible := False;  // Operacoes / Renda Variavel
        MnuBolsa.Visible            := False;  // Cadastros / Gerais / Bolsa de Valores
        MnuLancAcoes.Visible        := False;  // Operacoes / Isoladas / Acoes
        MnuConsRenVariavel.Visible  := False;  // Consultas / Renda Variavel
        tb97AtalhoRV.Visible        := False;
        sbtnRV.Enabled              := True;
        MnuItmRendaVar.Checked      := False;
        mnuFechtoEmpAcoes.Visible   := False;        
        // Some com RF
        mnuFchRF.Visible            := False;  // Fechamento RF
        MnuLancRFixa.Visible        := False; // Operacoes / Isoladas / Renda Fixa
        MnuCadRendaFixa.Visible     := False; // Cadastros / Renda Fixa
        MnuOperRendaFixa.Visible    := False; // Operacoes / Renda Fixa
        mnuConsRenFixa.Visible      := False; // Consultas / Renda Fixa
        tb97AtalhoRF.Visible        := False;
        MnuItmRendaFixa.Checked     := False;
        sbtnRF.Enabled              := True;
        //Some com BM&F
        mnuCadBMF.Visible           := False;  // Cadastros / BM&F
        mnuOperBMF.Visible          := False;  // Operacoes / BM&F
        mnuConsBMF.Visible          := False;  // Consultas / BM&F
        tb97AtalhoBMF.Visible       := False;
        sbtnBMF.Enabled             := True;
        mnuItmBMF.Checked           := False;

        mnuCadOpcInd.Visible         := False;
        mnuOperOpcoesIndices.Visible := False;
     end;
     else
     begin
        stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := '';
        // Aparece com o Fechamento
        MnuFechamento.Visible       := True;
        // Some com os Submenus de Fechamento
        mnuFchRF.Visible            := False;  // Fechamento RF
        mnuFchRV.Visible            := False;  // Fechamento RV
        mnuFchFnd.Visible           := False;  // Fechamento Fundos
        FrmPrincipal.Caption        := wCaption;
        // Some com as Barras de Atalho
        tb97AtalhoRV.Visible        := False;
        tb97AtalhoRF.Visible        := False;
        tb97AtalhoBMF.Visible       := False;
        tb97AtalhoFND.Visible       := False;
        // Habilita desabilita os botões de atalho
        sbtnTodos.Enabled           := True;
        sbtnRF.Enabled              := True;
        sbtnRV.Enabled              := True;
        sbtnBMF.Enabled             := True;
        sbtnFundos.Enabled          := True;
        // Muda os "Checks" do Menu
        MnuItmRendaFixa.Checked     := False;
        mnuTodos.Checked            := False;
        MnuItmRendaVar.Checked      := False;
        mnuItmBMF.Checked           := False;
        mnuItmFundos.Checked        := False;
        mnuCadOpcInd.Visible         := False;
        mnuOperOpcoesIndices.Visible := False;
     end;
  end;
  }
  // Guarda a Opção escolhida
  QryAux:=TwwQuery.Create(Self);
  QryAux.DataBaseName:='BASEDADOS';
  if not(dtmBaseDados.dbBaseDados.InTransaction) then
     DtmBaseDados.dbBaseDados.StartTransaction;
  Try
  iTipoInvest := 7;
  If iTipoInvest <> 0 Then
     ExecutaQuery(QryAux,
       'UPDATE USUARIOTIPOMENU SET TIPOMENU = '+QuotedStr(TipoMenu)+', '+
       '       IDTIPOINVEST = '+QuotedStr(IntToStr(iTipoInvest))+
       'WHERE  IDUSUARIO    = '+QuotedStr(IntToStr(Sistema.idusuario)))
  Else
     ExecutaQuery(QryAux,
       'UPDATE USUARIOTIPOMENU SET TIPOMENU = '+QuotedStr(TipoMenu)+', '+
       '       IDTIPOINVEST = NULL '+
       'WHERE  IDUSUARIO    = '+QuotedStr(IntToStr(Sistema.idusuario)));
  DtmBaseDados.dbBaseDados.Commit;

  iTipoInvestUsu := iTipoInvest;

  Except
     DtmBaseDados.dbBaseDados.RollBack;
  End;
  QryAux.Free;
  // Alimenta o Parametro Publico
  TipoMenuInvest := TipoMenu;
  HabilitaMenus;

End;


procedure TFrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   // AL_4
   CtrlInvContab.Free;
   QryParamImport.Close;
   dtmOperComum.qryEmpresa.Close;
    //AL_5
   FreeAndNil(CtrlPInv);
end;

procedure TFrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
  QryUsistema:TQuery;
  I, J, iTam: Integer;
  sTexto: String;
  pPainel: TfcStatusPanel;
begin
  iTam        := 0;
  inherited;
   // AL_4
   CtrlInvContab.InitializeAs(Padroes);
   CtrlInvContab.Modulo := Sistema.IdModulo;
   CtrlInvContab.Empresa := Sistema.IdEmpresa;
   CtrlInvContab.Usuario := Sistema.IdUsuario;
   //AL_5
   CtrlPInv.InitializeAs(Padroes);
   CtrlPInv.GetParamsInvest(Sistema.IdEmpresa); // Aqui ele já faz a operação RetParamInvest1
   CtrlPInv.IDEmpresa   := Sistema.IDEmpresa;
   CtrlPInv.IDUsuario   := Sistema.IDUsuario;
   CtrlPInv.IDEspAcesso := Sistema.IDEspAcesso;
   CtrlPInv.IDModulo    := Sistema.IDModulo;
   CtrlPInv.NomeEmpresa := Sistema.NomeEmpresa;
   //AL_83
   CtrlPInv.NomeModulo  := Sistema.NomeModulo;
   CtrlPInv.NomeUsuario := Sistema.NomeUsuario;

   AcertaClausulaSQL(DmRelatoriosFundo);


   // Acerta o Menu
   if Sistema.idusuario = -1 Then
      Exit;
   // Pesquisa se o Usuario já esta com Menu definido
   If Not FazQuery(QryAuxiliar,'SELECT * FROM USUARIOTIPOMENU ' +
                               'WHERE IDUSUARIO = '+ QuotedStr(IntToStr(Sistema.idusuario))) And
                               (Sistema.idusuario > 0) Then
   Begin
      // Caso não exista Insere com default para Ambos
      ExecutaQuery(QryAuxiliar,'INSERT INTO USUARIOTIPOMENU (IDUSUARIO, TIPOMENU) '+
                               'VALUES ('+QuotedStr(IntToStr(Sistema.idusuario))+',''A'')');
   End;
   // Busca o Menu definido
   FazQuery(QryAuxiliar,'SELECT * FROM USUARIOTIPOMENU ' +
                        'WHERE IDUSUARIO = '+
                         QuotedStr(IntToStr(Sistema.idusuario)));

   // Monta Registro do Parâmetro
   //Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');
   // Esta operação já foi chamada em CtrlPinv.GetParamInvest no início da proc

   if QryAuxiliar.FieldByName('IDTIPOINVEST').IsNull then
      iTipoInvestUsu := 0
   else
      iTipoInvestUsu := QryAuxiliar.FieldByName('IDTIPOINVEST').AsInteger;

   //AL_6
   //** Este tipo de investimento é do parametros do usuario e nao do sistema
   CtrlPInv.IdTipoInvest:= iTipoInvestUsu;
   // Apos login sempre pegará o cadastrado na tbl usuariotipomenu
   CtrlPInv.IdPlanPrevCtbPatr := QryAuxiliar.Fieldbyname('IdPlanPrevCtbPatr').asinteger;
   // Abrir Form para Seleção de PlanoContábil e Patro
   AbrirFormModal(frmAlteraPatroPlanPrevContabMT, TfrmAlteraPatroPlanPrevContabMT);

   // Agora acerta o Menu e a data de fechamento do modulo na barra de tarefas
   If Trim(QryAuxiliar.FieldByName('TIPOMENU').AsString) <> '' Then //Evita erro de acesso
   Begin
      MudaMenu(iTipoInvestUsu,QryAuxiliar.FieldByName('TIPOMENU').AsString[1]);
      if QryAuxiliar.FieldByName('TIPOMENU').AsString[1] = 'I' then
      begin
//         mnuItmFundos.Checked     := True;
         stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRPI.DATAULTFECHFDO);
      end;
{      else if QryAuxiliar.FieldByName('TIPOMENU').AsString[1] = 'A' then
      begin
         mnuTodos.Checked := True;
         stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := '';
      end
      else if QryAuxiliar.FieldByName('TIPOMENU').AsString[1] = 'F' then
      begin
         MnuItmRendaFixa.Checked  := True;
         stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRPI.DATAULTFECHRF);
      end
      Else if QryAuxiliar.FieldByName('TIPOMENU').AsString[1] = 'V' Then
      begin
         MnuItmRendaVar.Checked   := True;
         stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRPI.DATAULTFECH);
      end
      else if QryAuxiliar.FieldByName('TIPOMENU').AsString[1] = 'B' then
      begin
         mnuItmBMF.Checked   := True;
         stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRPI.DATAULTFECHBMF);
      end}
   End;

//   stbarStatusBar.Panels.PanelByName('pnlBaseDados').Text := Sistema.AliasServidor;

   // Varre os Paineis da barra de tarefas
   for I := 0 to stbarStatusBar.Panels.Count-1 do
   begin
      // Painel de Alias do Servidor
      if stbarStatusBar.Panels[I].Tag = 3 then
         stbarStatusBar.Panels[I].Text := Sistema.AliasServidor;

      if stbarStatusBar.Panels[I].Tag > 0 then
      begin
         pPainel := stbarStatusBar.Panels[I];
         sTexto  := stbarStatusBar.Panels[I].Text;
         case Length(sTexto) of
           0..4   : iTam := Round((Length(sTexto) * 9.5));
           5..9   : iTam := Round((Length(sTexto) * 9.5));
           10..14 : iTam := Round((Length(sTexto) * 9.5));
           15..19 : iTam := Round((Length(sTexto) * 8));
           20..29 : iTam := Round((Length(sTexto) * 7));
           30..39 : iTam := Round((Length(sTexto) * 6));
           40..49 : iTam := Round((Length(sTexto) * 6));
           50..59 : iTam := Round((Length(sTexto) * 5));
           60..200: iTam := Round((Length(sTexto) * 4.5));
         end;
      end;

      // Tamaho mínimo para os paineis
      case pPainel.Tag of
       -4: iTam := 115;                     // Data e Hora
       -3: iTam := 35;                      // Num Lock
       -2: iTam := 37;                      // Caps Lock
       -1: iTam := 26;                      // Ins Lock
        1: if iTam < 280 then iTam := 280;  // Nome da Empresa
        2: if iTam < 120 then iTam := 120;  // Nome do Usuário
        3: if iTam < 35  then iTam := 35;   // Base de Dados
        4: iTam := 79;                      // Data do Último Fechamento do Módulo Atual
      end;

      pPainel.Width := IntToStr(iTam);

   end;

   // O tamanho mínimo para o painel Nome da Empresa é de 280
   if StrToInt(stbarStatusBar.Panels.PanelByName('pnlEmpresa').Width) < 280 then
      stbarStatusBar.Panels.PanelByName('pnlEmpresa').Width := '280';
   // O tamanho mínimo para o painel Nome da Base é de 26
   if StrToInt(stbarStatusBar.Panels.PanelByName('pnlBaseDados').Width) < 26 then
     stbarStatusBar.Panels.PanelByName('pnlEmpresa').Width := '26';
   FrmPrincipal.Caption := FrmPrincipal.Caption + wCaption ;
end;

procedure TFrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TDmRelatoriosFundo, DmRelatoriosFundo);
   Application.CreateForm(TDmRelRentabInvest, DmRelRentabInvest);
   Application.CreateForm(TDmRelCarteiraFundos, DmRelCarteiraFundos);
   Application.CreateForm(TDmRelFundosSaldo, DmRelFundosSaldo);
   Application.CreateForm(TDMRelFundosEmol, DMRelFundosEmol);
   Application.CreateForm(TDmRelRentabSPC, DmRelRentabSPC);
   Application.CreateForm(TDmRelParamContab, DmRelParamContab);
   Application.CreateForm(TDmRelFundosConsMov, DmRelFundosConsMov);
   Application.CreateForm(TDMRelOperRecebtoFdo, DMRelOperRecebtoFdo);
   Application.CreateForm(TDmRelConsCotaFundo, DmRelConsCotaFundo);
   // Alt_2
   Application.CreateForm(TDmRelConsCotaIntegrFundo, DmRelConsCotaIntegrFundo);
   //Al_3
   Application.CreateForm(TDmRelConsAmortFdo, DmRelConsAmortFdo);
   //AL_4
   Application.CreateForm(TDmRelMapaInvFdo, DmRelMapaInvFdo);
end;


procedure TFrmPrincipal.HabilitaMenus;
var
  i, j, k, l, m: integer;
  SubMenu1, SubMenu2, SubMenu3, SubMenu4: TMenuItem;
begin
   // A partir de 07/10/2002, só habilita para usuários que tenham '.CM' no nome.
   if Pos('.CM',Sistema.NomeUsuario) > 0 then
   begin
      // Loop nos items de menu da Barra - Nivel 0
      for i := 0 to mnu.Items.Count -1 do
      begin
         // Habilita os menus da Barra
         mnu.Items.Items[i].Enabled := True;
         SubMenu1 := mnu.Items[i];
         // Loop nos items de menu do SubNivel 1
         for j := 0 to SubMenu1.Count - 1 do
         begin
            // Se for um dos menus do padrão, não considera
            if Pos('_Padrao',SubMenu1.Items[j].Name) > 0 then
               Continue;
            // Habilita item de menu do SubNivel 1
            SubMenu1.Items[j].Enabled := True;
            SubMenu2 := SubMenu1.Items[j];
            // Verificar se o SubNivel 1 possui "filho" - SubNivel 2
            if SubMenu2.Count > 0 then
            begin
               // Loop nos items de menu do SubNivel 2
               for k := 0 to SubMenu2.Count - 1 do
               begin
                  // Se for um dos menus do padrão, não considera
                  if Pos('_Padrao',SubMenu2.Items[k].Name) > 0 then
                     Continue;
                  // Habilita SubNivel 2
                  SubMenu2.Items[k].Enabled := True;
                  SubMenu3 := SubMenu2.Items[k];
                  // Verificar se o SubNivel 2 possui "filho" - SubNivel 3
                  if SubMenu3.Count > 0 then
                  begin
                     for l := 0 to SubMenu3.Count - 1 do
                     begin
                        // Se for um dos menus do padrão, não considera
                        if Pos('_Padrao',SubMenu3 .Items[l].Name) > 0 then
                           Continue;
                        // Habilita SubNivel 3
                        SubMenu3.Items[l].Enabled := True;
                        SubMenu4 := SubMenu3.Items[l];
                        // Verificar se o SubNivel 3 possui "filho" - SubNivel 4
                        if SubMenu4.Count > 0 then
                        begin
                           for m := 0 to SubMenu4.Count - 1 do
                           begin
                              // Se for um dos menus do padrão, não considera
                              if Pos('_Padrao',SubMenu2.Items[m].Name) > 0 then
                                 Continue;
                              // Habilita SubNivel 4
                              SubMenu4.Items[m].Enabled := True;
                           end; // For m
                        end; // if SubMenu 4
                     end; // For l
                  end; // if SubMenu 3
               end; // for K
            end; // if SubNivel 2
         end; // For j
      end; // For i

      // Menus exclusivos dos Analistas CM - Liberação
      mnuSQL.Visible                   := True;
      mnuVerificacaodeMenusSAD.Visible := True;
      mnuTesteDatas.Visible            := True;
      MnuConsFinancContab.Visible      := True;
   end
   else
   begin
      // Menus exclusivos dos Analistas CM - Liberação
      mnuSQL.Visible                   := False;
      mnuVerificacaodeMenusSAD.Visible := False;
      mnuTesteDatas.Visible            := False;
      MnuConsFinancContab.Visible      := False;
   end;

   // Provisoriamente habilita/desabilita itens do menu
   // Fim da habilitação/desabilitação temporária de itens do menu


   If pRPI.FLGCARTGERENC = 'S' then
//      mnuFchCartGer.Visible  := True
   Else
//      mnuFchCartGer.Visible  := False;

   // Menus de Fundos
   mnuItmFundoImobiliario.Enabled := False;
   MnuDireitoCreditorio.Enabled   := False;
   if iTipoInvestUsu = 7 then // Fundo Imobiliario
      mnuItmFundoImobiliario.Enabled := True
   else if iTipoInvestUsu = 9 then // Fundo Direito Creditório
      MnuDireitoCreditorio.Enabled   := True;
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
Var
  iPlano, iPlanilha, iDocumento : Integer;
  fValorVariacao, fValorLancto : Double;
  CodDocumento, PlnCodigo, OperRenFix, HistRenFix : String;
  dDtaAntVar : TDateTime;
  wCotaAplicada, wFator : Double;
  QryAux1: TwwQuery;
  QryAux : TwwQuery;
begin
  inherited;

//  Button utilizado para executar coisas no Banco
{
  QryAux1:=TwwQuery.Create(Self);
  QryAux1.DataBaseName:='BASEDADOS';

  QryAux :=TwwQuery.Create(Self);
  QryAux.DataBaseName:='BASEDADOS';


  Try
    QryFatorCota.Close;
    QryFatorCota.Open;
    QryFatorCota.First;

     FrmAguarde.Pos:=0;
     FrmAguarde.Max:=QryFatorCota.RecordCount;
     FrmAguarde.Mostra(' Aguarde, processando') ;

    While Not QryFatorCota.EOF Do
    Begin
       wFator   := 1;
       if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 24 Then
         wFator :=10.484954190
       else if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 26 Then
         wFator := 1.150368093
       else if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 27 Then
         wFator := 0.068560216
       else if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 28 Then
         wFator := 0.105170679
       else if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 29 Then
         wFator := 0.933653192
       else if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 30 Then
         wFator := 0.908554152
       else if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 31 Then
         wFator := 102.675529208
       else if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 32 Then
         wFator := 104.790310920
       else if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 33 Then
         wFator := 9.522652748
       else if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 34 Then
         wFator := 111.850542621
       else if QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger = 23 Then
         wFator := 11.627445665;

// Busca dados da Cota
       DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                QryFatorCota.FieldByName('IDFUNDOINVEST').AsInteger,
                                QryFatorCota.FieldByName('DATAAPLICACAO').AsDateTime);

       DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
       DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

       wCotaAplicada      := OperComum.Round(DadosCota.VlrCota*wFator,
                                       QryFatorCota.FieldByName('QTDDECVALOR').AsInteger);

       if not(dtmBaseDados.dbBaseDados.InTransaction) then
          DtmBaseDados.dbBaseDados.StartTransaction;

       QryFatorCota.Edit;
       QryFatorCota.FieldByName('COTAAPLICACAO').AsFloat := wCotaAplicada;
       QryFatorCota.Post;
       QryFatorCota.CommitUpdates;
       DtmBaseDados.dbBaseDados.Commit;
       QryFatorCota.Next;
       FrmAguarde.Pos:=FrmAguarde.Pos+1;
    end;
    QryFatorCota.Close;


{    FazQuery(QryAux1,' SELECT DISTINCT PLNCODIGO, PLANO '+
                     ' FROM HISTFUNDO WHERE DATAMOVFUNDO >= TO_DATE(''24/03/2003'',''DD/MM/YYYY'') '+
                     ' AND DATAMOVFUNDO <= TO_DATE(''28/03/2003'',''DD/MM/YYYY'') '+
                     ' AND TIPMOVFUNDO = ''ATU'' AND VLRVARIACAO = SALDOVLRFUNDO');

    QryAux1.First;
    While Not QryAux1.EOF Do
    Begin
        If Not QryAux1.FieldByName('PLNCODIGO').IsNull Then
        begin
           ExecutaQuery(QryAux,'UPDATE HISTFUNDO SET PLNCODIGO = NULL WHERE PLNCODIGO = '+
                               QryAux1.FieldByName('PLNCODIGO').AsString);
           If Not ProcExcluiContabil(QryAux1.FieldByName('PLNCODIGO').AsInteger) Then
             Abort;
        end;
        QryAux1.Next;
    End;
    QryAux1.Close;

    DtmBaseDados.dbBaseDados.Commit;

    FazQuery(QryAux1,' SELECT DISTINCT HF.IDFUNDOINVEST, HF.DATAAPLICACAO, HF.DATAMOVFUNDO, HF.VLRVARIACAO, HF.SALDOVLRFUNDO, HF.SALDOQTDCOTAS, HF.IDTIPOINVEST, FI.IDTIPOFUNDOINVEST '+
                     ' FROM HISTFUNDO HF, FUNDOINVEST FI WHERE HF.DATAMOVFUNDO >= TO_DATE(''24/03/2003'',''DD/MM/YYYY'') '+
                     ' AND HF.DATAMOVFUNDO <= TO_DATE(''28/03/2003'',''DD/MM/YYYY'') '+
                     ' AND HF.TIPMOVFUNDO = ''ATU'' AND HF.VLRVARIACAO = SALDOVLRFUNDO AND FI.IDFUNDOINVEST = HF.IDFUNDOINVEST'+
                     ' ORDER BY DATAMOVFUNDO');

    QryAux1.First;
    While Not QryAux1.EOF Do
    Begin
       if not(dtmBaseDados.dbBaseDados.InTransaction) then
          DtmBaseDados.dbBaseDados.StartTransaction;

       dDtaAntVar := QryAux1.FieldByName('DATAMOVFUNDO').AsDateTime - 1;
       While not DiasUteisInv.DiaUtil(dDtaAntVar,-1,1,'',True,False,False) Do
         dDtaAntVar := dDtaAntVar  - 1;
       QryAux.Close;
       QryAux.SQL.Clear;
       QryAux.SQL.Add(' SELECT VLRCOTA   ');
       QryAux.SQL.Add(' FROM   COTAFUNDO ');
       QryAux.SQL.Add(' WHERE            ');
       QryAux.SQL.Add('        IDFUNDOINVEST = '+QryAux1.FieldByName('IDFUNDOINVEST').AsString+' AND ');
       QryAux.SQL.Add('        DATACOTA      =                   ');
       QryAux.SQL.Add('           (SELECT MAX(DATACOTA)          ');
       QryAux.SQL.Add('            FROM   COTAFUNDO              ');
       QryAux.SQL.Add('            WHERE                         ');
       QryAux.SQL.Add('                   IDFUNDOINVEST  = '+QryAux1.FieldByName('IDFUNDOINVEST').AsString+' AND ');
       If QryAux1.FieldByName('IDTIPOFUNDOINVEST').AsInteger <> 1 Then //Se não for fundo Imobiliario busca a cota do dia
          QryAux.SQL.Add('   DATACOTA        = TO_DATE('+QuotedStr(DateToStr(dDtaAntVar))+',''DD/MM/YYYY''))')
       Else
          QryAux.SQL.Add('   DATACOTA       <= TO_DATE('+QuotedStr(DateToStr(dDtaAntVar))+',''DD/MM/YYYY''))');
       QryAux.Open;

       fValorVariacao    := QryAux1.FieldByName('SALDOVLRFUNDO').AsFloat -
             OperComum.Round(QryAux1.FieldByName('SALDOQTDCOTAS').AsFloat*QryAux.FieldByName('VLRCOTA').AsFloat,2);
       QryAux.Close;

       QryAuxiliarAcerto.Close;
       OperComum.LimpaParametros(QryAuxiliar);
       QryAuxiliarAcerto.ParamByNAme('DATAMOVFUNDO').AsDateTime  := QryAux1.FieldByName('DATAMOVFUNDO').AsDateTime;
       QryAuxiliarAcerto.ParamByNAme('DATAAPLICACAO').AsDateTime := QryAux1.FieldByName('DATAAPLICACAO').AsDateTime;
       QryAuxiliarAcerto.ParamByNAme('IDFUNDOINVEST').AsInteger  := QryAux1.FieldByName('IDFUNDOINVEST').AsInteger;
       QryAuxiliarAcerto.ParamByNAme('IDTIPOINVEST').AsInteger   := QryAux1.FieldByName('IDTIPOINVEST').AsInteger;
       QryAuxiliarAcerto.ParamByNAme('VLRVARIACAO').AsFloat      := fValorVariacao;
       QryAuxiliarAcerto.ExecSql;

       DtmBaseDados.dbBaseDados.Commit;

       QryAux1.Next;
    End;

    QryAux1.Close;

    if not(dtmBaseDados.dbBaseDados.InTransaction) then
       DtmBaseDados.dbBaseDados.StartTransaction;

    FazQuery(QryAux1,' SELECT DISTINCT FI.IDTIPOFUNDOINVEST, HF.DATAMOVFUNDO '+
                     ' FROM HISTFUNDO HF, FUNDOINVEST FI WHERE HF.DATAMOVFUNDO >= TO_DATE(''24/03/2003'',''DD/MM/YYYY'') '+
                     ' AND HF.DATAMOVFUNDO <= TO_DATE(''28/03/2003'',''DD/MM/YYYY'') '+
                     ' AND HF.TIPMOVFUNDO = ''ATU'' AND FI.IDFUNDOINVEST = HF.IDFUNDOINVEST');

    QryAux1.First;
    While Not QryAux1.EOF Do
    Begin
       iPlano    := 0;
       iPlanilha := 0;
       If Not ContabilizaVariacao(QryAux1.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                           Sistema.IdEmpresa, Sistema.IdModulo, -1,
                           QryAux1.FieldByName('DATAMOVFUNDO').AsDateTime,
                           True, False,
                           iPlano, iPlanilha, iDocumento, fValorLancto) Then
          Abort;
       OperComum.LimpaParametros(QryUpdHistFundo);
       QryUpdHistFundo.Close;
       QryUpdHistFundo.ParamByName('PLANO').AsInteger             := iPlano;
       QryUpdHistFundo.ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
       QryUpdHistFundo.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryAux1.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
       QryUpdHistFundo.ParamByName('DATAMOVFUNDO').AsString       := QryAux1.FieldByName('DATAMOVFUNDO').AsString;
       QryUpdHistFundo.ExecSql;
       QryAux1.Next;
    End;}
{  Except

     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

  End;
  QryAux.Free;
  QryAux1.Free;
//}
//  InsereTipoOperacao;
//  IncluiItemRenFixNovo;
end;

Function TFrmPrincipal.ExisteFormulario : Boolean;
Var
  I:Integer;
Begin
  { Seta Resultado }
  Result := False;

  { Testa se existe algum Formulario }
  For I := 0 to Screen.FormCount-1 Do Begin
   { Verifica se Formulario herda do TForm }
   If ((Copy(Screen.Forms[I].Name,1,1) = 'F')  Or
       (Copy(Screen.Forms[I].Name,1,1) = 'f')) And
       //AL_x
      //(Screen.Forms[I].Name <> 'frmAlteraPatroPlanPrevContab') And
      (Screen.Forms[I].Name <> 'frmAlteraPatroPlanPrevContabMT') And
      (Screen.Forms[I].Name <> 'FrmPrincipal') Then Begin { Ignora o
Principal }

      { Caso Formulario Exista (esteja criado) e esteja Visivel, seta Flg }
      If Screen.Forms[I].Visible = True Then Begin
//Fomrulario - Retirar }
        MsgDlg('Feche todas as Janelas do Menu, para mudar de Plano e Patrocinadora!  ',
               'Mensagem do Sistema', mtWarning, [MbOk], 0);
        Result := True;
      End;
   End;
  End;
End;

procedure TFrmPrincipal.ActLoginExecute(Sender: TObject);
begin
  If Not ExisteFormulario Then
   inherited;

end;

procedure TfrmPrincipal.AcertaClausulaSQL(dtmReport: TdtmReports);
var
   iFor, iPos : integer;
   sSql: string;
begin
   If dtmReport <> Nil Then
   Begin
     iFor := 0;
     while iFor <= dtmReport.ComponentCount - 1 do begin  // dúvida para a galera
         if TObject(dtmReport.Components[iFor]).ClassType = TwwQuery then begin
            sSql := TwwQuery(dtmReport.FindComponent(dtmReport.Components[iFor].Name)).SQL.Text;
            iPos := pos('1=2 AND', sSql);
         // achada a expressão "1=2 AND" = EXCLUI-LA
            if iPos > 1 then begin
               Delete(sSql, iPos, 7);
               TwwQuery(dtmReport.FindComponent(dtmReport.Components[iFor].Name)).SQL.Text := sSql;
            end;
         end;
         inc(iFor);
     end;
  end;
end;

function TFrmPrincipal.LeValorArray(sValor: String; sValDefault: String = ''): String;
begin
   if (Trim(sValor) = '') and (Trim(sValDefault) <> '') then
      Result := sValDefault
   else if Trim(sValor) = '' then
      Result := ''
   else Result := sValor;
end;


procedure TFrmPrincipal.w1Click(Sender: TObject);
begin
  inherited;
  FrmPrincipal.Show;
end;

procedure TFrmPrincipal.mnuIntegracaoContabileFinanceiraClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadContaContab,TFrmCadContaContab,False);
end;

procedure TFrmPrincipal.mnuCotasaIntegralizarClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadCotIntegrFundo,TfrmCadCotIntegrFundo,False);
end;

procedure TFrmPrincipal.mnuFluxoCotasIntegralizarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCotasIntegralizar,TfrmCadCotasIntegralizar,False);
end;

procedure TFrmPrincipal.mnuFluxoIntegraCotasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadFluxoCotasIntegralizar,TfrmCadFluxoCotasIntegralizar,False);
end;

procedure TFrmPrincipal.mnuRecebimentodeDividendosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadOperDividendosFdo,TfrmCadOperDividendosFdo,False);
end;

procedure TFrmPrincipal.mnuFundoLancamentoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadLancamentoFundo, TfrmCadLancamentoFundo, False);
end;

procedure TFrmPrincipal.mnuAmortizacaodeCotasClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadAmortizacaoCotasAcoes,TFrmCadAmortizacaoCotasAcoes,False);
end;

procedure TFrmPrincipal.MnuTransfPlanoFundosClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadTransfPlanos,TfrmCadTransfPlanos,False);
end;

procedure TFrmPrincipal.MnuConsSaldoFundosClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmConsSaldoFundos,TfrmConsSaldoFundos,False);
end;

procedure TFrmPrincipal.mnuMapaInvestFdoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmParamMapaInvFdo, TfrmParamMapaInvFdo,False);
end;

procedure TFrmPrincipal.mnuTiposdeDespesaClick(Sender: TObject);
begin
  inherited;
  //AL_5
  //AbrirForm(frmCadTipoDespInvest,TfrmCadTipoDespInvest,False);
  AbrirForm(frmCadTipoDespInvestMT,TfrmCadTipoDespInvestMT,False);
end;

procedure TFrmPrincipal.mnuDespesasporTipodeOperacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadDespTipoOper,TfrmCadDespTipoOper,False);
end;

Initialization
   // Instancia a Classes do Sistema
   Sistema.Versao := '3.16.00';
   Sistema.IdModulo	     := 722 ;                        // IdModulo cadastrado no SAD
   Sistema.NomeModulo	  := 'InvestFDO';	          // Nome do Módulo
   Sistema.NomeAplicativo := 'Sistema de Fundos de Investimentos';  // Nome do Sistema
   IntegraBack            := TIntegraBack.Create(True,True,True);
   Modulo                 := TModulo.Create;

Finalization
   // Libera a Classes do Sistema
   Modulo.Free;
   IntegraBack.Free;

end.
