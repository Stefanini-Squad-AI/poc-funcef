unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, TB97,
  Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, Mask, wwdbedit,
  DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, uSistema,  IvDictio, uAtivoFixo,
  IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, TreeWzd,
  AppEvnts, StdActns, ActnList, ImgList, fcStatusBar, CMApplicationEvents,
  CMSQLScript, SConnect, MConnect, DBClient,
  uCtrlParamCAF, uCtrlIniciaMultiTaxa;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    Situacoes11: TMenuItem;
    Tiposdeareas1: TMenuItem;
    N3: TMenuItem;
    Bens1: TMenuItem;
    GruposdeBens1: TMenuItem;
    MotivosdeBaixadeBens1: TMenuItem;
    Responsaveis1: TMenuItem;
    TipodeDespesaparaAcrescimodeValor1: TMenuItem;
    Importar1: TMenuItem;
    Terceiros1: TMenuItem;
    N4: TMenuItem;
    qryTipoMov: TwwQuery;
    updTipoMov: TUpdateSQL;
    qryTipoMovIDTIPOMOVIMENTACAO: TFloatField;
    qryTipoMovDESCTIPOMOVIMENTACAO: TStringField;
    qryTipoMovLANCAMENTO: TStringField;
    qryTipoMovIDCONTAB: TFloatField;
    mnuConsSldCtb: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    Movimentacoes1: TMenuItem;
    ClassesdeBens1: TMenuItem;
    mnuMovControleTotal: TMenuItem;
    mnuMovAcrescimo: TMenuItem;
    mnuMovReavaliacao: TMenuItem;
    mnuMovBaixa: TMenuItem;
    mnuMovDesmembramento: TMenuItem;
    mnuMovRemembramento: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    LocalizaesdosBens1: TMenuItem;
    mnuCadBens: TMenuItem;
    ContasMovimentoporGrupos1: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    ConjuntosdeBens1: TMenuItem;
    mnuBensPendentesAlmox: TMenuItem;
    mnuConsultBens1: TMenuItem;
    N17: TMenuItem;
    mnuSaldoContabilporGrupo1: TMenuItem;
    mnuInventario: TMenuItem;
    mnuInvGeracao: TMenuItem;
    mnuInvCadastramento: TMenuItem;
    mnuInvProcessamento: TMenuItem;
    timBensPendentes: TTimer;
    qryVerBensPend: TwwQuery;
    qryVerBensPendQTDBENSPEND: TFloatField;
    mnuSelBaixa1: TMenuItem;
    N18: TMenuItem;
    mnuTrocadePlaca1: TMenuItem;
    mnuSaidaTemporaria: TMenuItem;
    mnuCadTipoSaidaTemp: TMenuItem;
    mnuMovSaidaTemp: TMenuItem;
    mnuMovRetSaidaTemp: TMenuItem;
    mnuMovExecSaidaTemp: TMenuItem;
    N20: TMenuItem;
    mnuConsLevInvent: TMenuItem;
    mnuSelTransf: TMenuItem;
    mnuFechamento1: TMenuItem;
    Depreciao1: TMenuItem;
    N8: TMenuItem;
    Depreciao2: TMenuItem;
    OutrasMovimentaes1: TMenuItem;
    mnuTransfBens: TMenuItem;
    DestinatriosdeBensAlienados1: TMenuItem;
    lblAutorizaTemp: TLabel;
    mnuConsParamContab: TMenuItem;
    mnuReconstruirSaldo: TMenuItem;
    mnuExportacao: TMenuItem;
    mnuUtilExpPlacas: TMenuItem;
    sprSaldoContabBem: TCMSQLScript;
    scrTriggerCAFMT: TCMSQLScript;
    mnuObras: TMenuItem;
    mnuCadObra: TMenuItem;
    mnuLancamentosObra: TMenuItem;
    mnuEncerramentoObra: TMenuItem;
    mnuEtapasdeObras: TMenuItem;
    N2: TMenuItem;
    N11: TMenuItem;
    mnuEstornaLancamentos: TMenuItem;
    N19: TMenuItem;
    mnuConsultCafObras: TMenuItem;
    mnuExpContab: TMenuItem;
    N1: TMenuItem;
    procedure Situacoes11Click(Sender: TObject);
    procedure Tiposdeareas1Click(Sender: TObject);
    procedure Localizacoes1Click(Sender: TObject);
    procedure GruposdeBens1Click(Sender: TObject);
    procedure ContasMovimentoporGrupos1Click(Sender: TObject);
    procedure MotivosdeBaixadeBens1Click(Sender: TObject);
    procedure Terceiros1Click(Sender: TObject);
    procedure Integracao1Click(Sender: TObject);
    procedure sbtnHelpClick(Sender: TObject);
    procedure mnuAjudaIndiceClick(Sender: TObject);
    procedure Responsaveis1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure TipodeDespesaparaAcrescimodeValor1Click(Sender: TObject);
    procedure Terceiro1Click(Sender: TObject);
    procedure ClassesdeBens1Click(Sender: TObject);
    procedure mnuConsSldCtbClick(Sender: TObject);
    procedure Depreciacao1Click(Sender: TObject);
    procedure Estornar1Click(Sender: TObject);
    procedure Depreciacao2Click(Sender: TObject);
    procedure Movimentacoes1Click(Sender: TObject);
    procedure mnuMovControleTotalClick(Sender: TObject);
    procedure mnuMovAcrescimoClick(Sender: TObject);
    procedure mnuMovReavaliacaoClick(Sender: TObject);
    procedure mnuMovDesmembramentoClick(Sender: TObject);
    procedure mnuMovRemembramentoClick(Sender: TObject);
    procedure mnuMovBaixaClick(Sender: TObject);
    procedure mnuCadBensClick(Sender: TObject);
    procedure ConjuntosdeBens1Click(Sender: TObject);
    procedure mnuBensPendentesAlmoxClick(Sender: TObject);
    procedure mnuConsultBens1Click(Sender: TObject);
    procedure mnuSaldoContabilporGrupo1Click(Sender: TObject);
    procedure mnuInvGeracaoClick(Sender: TObject);
    procedure mnuInvCadastramentoClick(Sender: TObject);
    procedure mnuInvProcessamentoClick(Sender: TObject);
    procedure timBensPendentesTimer(Sender: TObject);
    procedure VerificaBensPendentes;
    procedure mnuSelBaixa1Click(Sender: TObject);
    procedure mnuTrocadePlaca1Click(Sender: TObject);
    procedure mnuCadTipoSaidaTempClick(Sender: TObject);
    procedure mnuMovSaidaTempClick(Sender: TObject);
    procedure mnuMovRetSaidaTempClick(Sender: TObject);
    procedure mnuMovExecSaidaTempClick(Sender: TObject);
    procedure mnuConsLevInventClick(Sender: TObject);
    procedure mnuSelTransfClick(Sender: TObject);
    procedure mnuTransfBensClick(Sender: TObject);
    procedure mnuImpFunCEFImoveisClick(Sender: TObject);
    procedure DestinatriosdeBensAlienados1Click(Sender: TObject);
    procedure lblAutorizaTempClick(Sender: TObject);
    procedure mnuConsParamContabClick(Sender: TObject);
    procedure mnuReconstruirSaldoClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure mnuUtilExpPlacasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnRptWEBBalPatGrpClick(Sender: TObject);
    procedure bbtnRptWEBBalPatBemClick(Sender: TObject);
    procedure bbtnRptWEBMovPatGrpClick(Sender: TObject);
    procedure bbtnRptWEBMovPatBemClick(Sender: TObject);
    procedure bbtnRptWEBCadBensClick(Sender: TObject);
    procedure bbtnRptWEBCadClassesClick(Sender: TObject);
    procedure bbtnRptWEBCadConjuntosClick(Sender: TObject);
    procedure bbtnRptWEBCadGruposClick(Sender: TObject);
    procedure bbtnRptWEBCadLocalClick(Sender: TObject);
    procedure bbtnRptWEBSelBxBensClick(Sender: TObject);
    procedure mnuEtapasdeObrasClick(Sender: TObject);
    procedure mnuCadObraClick(Sender: TObject);
    procedure mnuLancamentosObraClick(Sender: TObject);
    procedure mnuEstornaLancamentosClick(Sender: TObject);
    procedure mnuConsultCafObrasClick(Sender: TObject);
    procedure mnuEncerramentoObraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
  private
    { Private declarations }
    ParamCAF        : TCtrlParamCAF;
    IniciaMultiTaxa : TCtrlIniciaMultiTaxa;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

uses
    //========================================================================
    // Area reservada para declação dos relatórios
    //========================================================================
    // FParamCafBalPatBem, FParamBalPatGrp, FParamBalPatGrpBx,FParamBalPatClas,
    // FParamBalPatCC, FParamCadBem,FParamCadConjxBens,FParamCAFCadConjxRatCC,
    // FParamCAFInvPat,uCtrlRptCaf,
    //========================================================================
     fTelaAut, uAutorizacao, dBaseDados, uDatabase, dRelOperCaf, dRelBalCaf, dRelCadCaf,
     uIntegraBack, fConsultSldContab, fMovAcrescimo, fMovControleTotal, fMovReavaliacao,
     fMovBaixa, fMovDesmembramento, fMovRemembramento, fMovBensPendentes,
     fConsultBens, fConsultSldGrp, uMensErro, fInvCadResultado, fMovSelBaixa, fAguarde,
     fMovTransfPlaca, fMovSaidaTemp, fMovExeSaidaTemp, fMovRetSaidaTemp,
     fConsultInvLevant, fMovSelTransf, fMovTransfBem, fInvProcessar, fInvGeracao,
     fConsParamContab, dAtivoFixo, fAcertaSaldo,
     fUtilExpPlacas, fEstornaMovimentacao, fGeraTxtContab,
     fCadObra, fMovObraLanc, fEstornaObraLanc, fConsultCafObra,
     fMovEncerrarObra, fEstornaDepreciacao, fConsultMovim,
     fMTCadSituacoes, fMTCadTipoArea, fMTCadTipoDespAV, fMTCadMotivoBaixa,
     fMTCadTipoSaidaTemp, fMTCadObraTipoEtapa, fMTCadLocalizacao, fMTCadGrupoContab,
     fMTCadResponsavel, fMTCadTerceiro, fMTCadDestinatBaixa, fMTCadClassedeBem,
     fMTCadParamCAFxContab, fMTCadConjunto, fMTCadParamCAF, fMTCadBem,
     fMTMovFechamento, fMTEstornaFechamento, FParamBalPatClas;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   inherited;
   if MHeight <= 0 then
   begin
      MHeight := Self.ClientHeight + 112;
      MWidth  := Self.ClientWidth - 32;
   end;
   //-------------------------------------------------------------------------------------
   IniciaMultiTaxa := TCtrlIniciaMultiTaxa.Create;
   IniciaMultiTaxa.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                              Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
   inherited;
   frmAguarde.Min := 0;
   frmAguarde.Max := 6;
   frmAguarde.Pos := 0;
   frmAguarde.Mostra('Inicializando Relatórios...');
   //-------------------------------------------------------------------------------------
   Application.CreateForm(TdtmAtivoFixo,dtmAtivoFixo);
   frmAguarde.Pos := 1;
   Application.CreateForm(TdtmRelBalCaf,dtmRelBalCaf);
   frmAguarde.Pos := 3;
   Application.CreateForm(TdtmRelCadCaf,dtmRelCadCaf);
   frmAguarde.Pos := 4;
   Application.CreateForm(TdtmRelOperCaf,dtmRelOperCaf);
   frmAguarde.Pos := 6;
   //-------------------------------------------------------------------------------------
   frmAguarde.Apaga;
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;
   if Sistema.FezLogin then
   begin
      try
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
            Raise Exception.Create('Parâmetros do sistema inválidos!');
         //-------------------------------------------------------------------------------
         // Processa a mudança para a nova modelagem (MultiTaxa)
         //-------------------------------------------------------------------------------
         if ParamCAF.DTAINICAFMT = '' then
         begin
            //----------------------------------------------------------------------------
            // Executa as modificações
            //----------------------------------------------------------------------------
            if not IniciaMultiTaxa.Executar(ParamCAF.MOEDAOFICIAL, ParamCAF.MOEDAFISCAL,
                                            ParamCAF.MOEDAGERENCIAL) then
               Raise Exception.Create(IniciaMultiTaxa.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela TIPOMOVIMENTACAO
         //-------------------------------------------------------------------------------
         AtivoFixo.GeraTipoMovimentacao;
         //-------------------------------------------------------------------------------
         // Ativa o Timer de Bens Pendentes
         //-------------------------------------------------------------------------------
         Screen.Cursor := crSQLWait;
         VerificaBensPendentes;
         Screen.Cursor := crDefault;
      except
         On E : Exception Do
         begin
            MsgDlg(E.Message + #13 + #13 + 'Processamento Abortado!','Erro',mtError,[mbOk],0);
            sbtnSair.Click;
         end;
      end;
   end;
end;
//========================================================================================
// Timer de Verificação de Bens Pendentes do Almoxarifado
//========================================================================================
procedure TfrmPrincipal.timBensPendentesTimer(Sender: TObject);
begin
   inherited;
   timBensPendentes.Enabled := False;
   VerificaBensPendentes;
   timBensPendentes.Enabled := True;
end;
//========================================================================================
procedure TfrmPrincipal.VerificaBensPendentes;
begin
   frmAguarde.Min := 0;
   frmAguarde.Max := 1;
   frmAguarde.Pos := 0;
   frmAguarde.Mostra('Verificando Bens Pendentes');
   //-------------------------------------------------------------------------------------
   qryVerBensPend.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryVerBensPend.Open;
   frmAguarde.Pos := 1;
   frmAguarde.Apaga;
   if (not qryVerBensPend.IsEmpty) then
      if (qryVerBensPendQTDBENSPEND.AsInteger > 0) then
         if (msgdlg('Existem bens cadastrados pelo ALMOXARIFADO que estão com a Entrada '+
                    'Pendente no Ativo Fixo. Deseja processá-los agora ?','Atenção',
                    mtConfirmation,[mbYes,mbNo],0) = mrYes) then
         begin
            AbrirForm(FrmMovBensPendentes,TFrmMovBensPendentes,False);
         end;
   qryVerBensPend.Close;
end;
//========================================================================================
procedure TfrmPrincipal.lblAutorizaTempClick(Sender: TObject);
var
   x : Integer;
begin
   inherited;
   if not Importar1.Visible then
   begin
      for x := 0 To ComponentCount -1 Do
      begin
         if Components[x] is TMenuItem then
            (Components[x] as TMenuItem).Visible := True;
         if Components[x] is TMenuItem then
            (Components[x] as TMenuItem).Enabled := True;
      end;
   end else
   begin
      Importar1.Visible := False;
      mnuReconstruirSaldo.Visible := False;
      N15.Visible := False;
   end;
end;
//========================================================================================
procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ParamCAF.Free;
  inherited;
end;
//========================================================================================
procedure TfrmPrincipal.Localizacoes1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadLocalizacao,TFrmMTCadLocalizacao,False);
  //AbrirForm(FrmCadLocali,TFrmCadLocali,False);
end;

procedure TfrmPrincipal.Tiposdeareas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadTipoArea,TFrmMTCadTipoArea,False);
  //AbrirForm(FrmCadTipoArea,TFrmCadTipoArea,False);
end;

procedure TfrmPrincipal.Situacoes11Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadSituacoes,TFrmMTCadSituacoes,False);
  //AbrirForm(FrmCadSituacoes,TFrmCadSituacoes,False);
end;

procedure TfrmPrincipal.GruposdeBens1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadGrupoContab,TFrmMTCadGrupoContab,False);
  //AbrirForm(FrmCadGrupoContab,TFrmCadGrupoContab,False);
end;

procedure TfrmPrincipal.MotivosdeBaixadeBens1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadMotivoBaixa,TFrmMTCadMotivoBaixa,False);
   //AbrirForm(FrmCadMotivosBaixa,TFrmCadMotivosBaixa,False);
end;

procedure TfrmPrincipal.Terceiros1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTCadTerceiro,TfrmMTCadTerceiro,False);
   //AbrirForm(frmCadTerceiros,TfrmCadTerceiros,False);
end;

procedure TfrmPrincipal.Integracao1Click(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TfrmGeraTxtContab,frmGeraTxtContab);
   frmGeraTxtContab.ShowModal;
   frmGeraTxtContab.Release;
end;

procedure TfrmPrincipal.sbtnHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpCommand(help_contents, 0);
end;

procedure TfrmPrincipal.mnuAjudaIndiceClick(Sender: TObject);
begin
  inherited;
  Application.HelpCommand(help_contents, 0);
end;

procedure TfrmPrincipal.Responsaveis1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTCadResponsavel,TfrmMTCadResponsavel,False);
   //AbrirForm(frmCadResponsa,TfrmCadResponsa,False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadParamCaf,TFrmMTCadParamCaf,False);
   //AbrirForm(FrmCadParamCaf,TFrmCadParamCaf,False);
end;

procedure TfrmPrincipal.TipodeDespesaparaAcrescimodeValor1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTCadTipoDespAV,TfrmMTCadTipoDespAV,False);
   //AbrirForm(frmCadTipoDespAV,TfrmCadTipoDespAV,False);
end;

procedure TfrmPrincipal.Terceiro1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTCadTerceiro, TfrmMTCadTerceiro, false);
   //AbrirForm(frmCadTerceiros, TfrmCadTerceiros, false);
end;

procedure TfrmPrincipal.ClassesdeBens1Click(Sender: TObject);
begin
   inherited;
   //AbrirForm(FrmCadClasse, TFrmCadClasse, False);
   AbrirForm(FrmMTCadClassedeBem, TFrmMTCadClassedeBem, False);
end;

procedure TfrmPrincipal.mnuConsSldCtbClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmConsultSldContab, TfrmConsultSldContab, False);
end;

procedure TfrmPrincipal.Depreciacao1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTMovFechamento, TfrmMTMovFechamento, False);
end;

procedure TfrmPrincipal.Estornar1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmEstornaMovimentacao,TFrmEstornaMovimentacao,False);
end;

procedure TfrmPrincipal.Depreciacao2Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTEstornaFechamento,TFrmMTEstornaFechamento,False);
end;

procedure TfrmPrincipal.Movimentacoes1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmConsultMovim,TFrmConsultMovim,False);
end;

procedure TfrmPrincipal.mnuMovControleTotalClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovControleTotal,TFrmMovControleTotal,False);
end;

procedure TfrmPrincipal.mnuMovAcrescimoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovAcrescimo,TFrmMovAcrescimo,False);
end;

procedure TfrmPrincipal.mnuMovReavaliacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovReavaliacao,TFrmMovReavaliacao,False);
end;

procedure TfrmPrincipal.mnuMovDesmembramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovDesmembramento,TFrmMovDesmembramento,False);
end;

procedure TfrmPrincipal.mnuMovRemembramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovRemembramento,TFrmMovRemembramento,False);
end;

procedure TfrmPrincipal.mnuMovBaixaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovBaixa,TFrmMovBaixa,False);
end;

procedure TfrmPrincipal.mnuCadBensClick(Sender: TObject);
begin
   inherited;
   //AbrirForm(FrmCadBens,TFrmCadBens,False);
   AbrirForm(FrmMTCadBem,TFrmMTCadBem,False);
   frmMTCadBem.Top := frmMTCadBem.Top - 3;
end;

procedure TfrmPrincipal.ContasMovimentoporGrupos1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmCadContasMovGrupo,TFrmCadContasMovGrupo,False);
  AbrirForm(FrmMTCadParamCAFxContab,TFrmMTCadParamCAFxContab,False);
end;

procedure TfrmPrincipal.ConjuntosdeBens1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmCadConjunto,TFrmCadConjunto,False);
  AbrirForm(FrmMTCadConjunto,TFrmMTCadConjunto,False);
end;

procedure TfrmPrincipal.mnuBensPendentesAlmoxClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovBensPendentes,TFrmMovBensPendentes,False);
end;

procedure TfrmPrincipal.mnuConsultBens1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmConsultBens,TFrmConsultBens,False);
end;

procedure TfrmPrincipal.mnuSaldoContabilporGrupo1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmConsultSldGrp,TFrmConsultSldGrp,False);
end;

procedure TfrmPrincipal.mnuInvGeracaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmInvGeracao,TFrmInvGeracao,False);
end;

procedure TfrmPrincipal.mnuInvCadastramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmInvCadResultado,TFrmInvCadResultado,False);
end;

procedure TfrmPrincipal.mnuInvProcessamentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmInvProcessar,TFrmInvProcessar,False);
end;

procedure TfrmPrincipal.mnuSelBaixa1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovSelBaixa,TFrmMovSelBaixa,False);
end;

procedure TfrmPrincipal.mnuTrocadePlaca1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovTransfPlaca,TFrmMovTransfPlaca,False);
end;

procedure TfrmPrincipal.mnuCadTipoSaidaTempClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadTipoSaidaTemp,TFrmMTCadTipoSaidaTemp,False);
   //AbrirForm(FrmCadTipoSaidaTemp,TFrmCadTipoSaidaTemp,False);
end;

procedure TfrmPrincipal.mnuMovSaidaTempClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovSaidaTemp,TFrmMovSaidaTemp,False);
end;

procedure TfrmPrincipal.mnuMovExecSaidaTempClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovExeSaidaTemp,TFrmMovExeSaidaTemp,False);
end;

procedure TfrmPrincipal.mnuMovRetSaidaTempClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovRetSaidaTemp,TFrmMovRetSaidaTemp,False);
end;

procedure TfrmPrincipal.mnuConsLevInventClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmConsultInvLevant,TFrmConsultInvLevant,False);
end;

procedure TfrmPrincipal.mnuSelTransfClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovSelTransf,TFrmMovSelTransf,False);
end;

procedure TfrmPrincipal.mnuTransfBensClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovTransfBem,TFrmMovTransfBem,False);
end;

procedure TfrmPrincipal.mnuImpFunCEFImoveisClick(Sender: TObject);
begin
   inherited;
{  AbrirForm(FrmImpFunCEFImoveis3,TFrmImpFunCEFImoveis3,False);}
end;

procedure TfrmPrincipal.DestinatriosdeBensAlienados1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadDestinatBaixa,TFrmMTCadDestinatBaixa,False);
   //AbrirForm(FrmCadDestinoBaixa,TFrmCadDestinoBaixa,False);
end;

procedure TfrmPrincipal.mnuConsParamContabClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmConsParamContab,TFrmConsParamContab,False);
end;

procedure TfrmPrincipal.mnuReconstruirSaldoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmAcertaSaldo,TFrmAcertaSaldo,False);
end;

procedure TfrmPrincipal.mnuUtilExpPlacasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmUtilExpPlacas,TFrmUtilExpPlacas,False);
end;

procedure TfrmPrincipal.bbtnRptWEBBalPatGrpClick(Sender: TObject);
{var
   sMensagem : String;}
begin
   inherited;
{  TRptCAFBalPatGrp.PrintReport(-1,-1,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                                '','','BaseDados',Sistema.NomeEmpresa,Sistema.NomeModulo,sMensagem);}
end;

procedure TfrmPrincipal.bbtnRptWEBBalPatBemClick(Sender: TObject);
begin
   inherited;
{  TRptCAFBalPatBem.PrintReport(-1,-1,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                                '','','BaseDados');}
end;

procedure TfrmPrincipal.bbtnRptWEBMovPatGrpClick(Sender: TObject);
begin
  inherited;
{  TRptCAFMovPatGrp.PrintReport(-1,-1,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                                '','','BaseDados');}
end;

procedure TfrmPrincipal.bbtnRptWEBMovPatBemClick(Sender: TObject);
begin
   inherited;
{  TRptCAFMovPatBem.PrintReport(-1,-1,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                                '','','BaseDados');}
end;

procedure TfrmPrincipal.bbtnRptWEBCadBensClick(Sender: TObject);
begin
  inherited;
{   TRptCAFCadBem.PrintReport(-1,-1,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                              '','','BaseDados');}
end;

procedure TfrmPrincipal.bbtnRptWEBCadClassesClick(Sender: TObject);
begin
   inherited;
{  TRptCAFCadClasse.PrintReport(-1,-1,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                                '','','BaseDados');}
end;

procedure TfrmPrincipal.bbtnRptWEBCadConjuntosClick(Sender: TObject);
begin
  inherited;
{  TRptCAFCadConjunto.PrintReport(-1,-1,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                                  '','','BaseDados');}
end;

procedure TfrmPrincipal.bbtnRptWEBCadGruposClick(Sender: TObject);
begin
  inherited;
{  TRptCAFCadGrupo.PrintReport(-1,-1,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                               '','','BaseDados');}
end;

procedure TfrmPrincipal.bbtnRptWEBCadLocalClick(Sender: TObject);
begin
  inherited;
{  TRptCAFCadLocal.PrintReport(-1,-1,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                               '','','BaseDados');}
end;

procedure TfrmPrincipal.bbtnRptWEBSelBxBensClick(Sender: TObject);
begin
  inherited;
{  TRptCAFSelBxBens.PrintReport(-1,-1,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                                '','','BaseDados');}
end;

procedure TfrmPrincipal.mnuEtapasdeObrasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadObraTipoEtapa,TFrmMTCadObraTipoEtapa,False);
   //AbrirForm(FrmCadObraTipoEtapa,TFrmCadObraTipoEtapa,False);
end;

procedure TfrmPrincipal.mnuCadObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadObra,TFrmCadObra,False);
end;

procedure TfrmPrincipal.mnuLancamentosObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovObraLanc,TFrmMovObraLanc,False);
end;

procedure TfrmPrincipal.mnuEstornaLancamentosClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmEstornaObraLanc,TFrmEstornaObraLanc,False);
end;

procedure TfrmPrincipal.mnuConsultCafObrasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmConsultCafObra,TFrmConsultCafObra,False);
end;

procedure TfrmPrincipal.mnuEncerramentoObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMovEncerrarObra,TFrmMovEncerrarObra,False);
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var
  RptCaf :TCtrlRptCaf ;
begin
  inherited;
    RptCaf:= TCtrlRptCaf.Create;
    Try
       Printed := ShowReport(IdReports, RptCaf);
       RptCaf.Free;
    Except
         RptCaf.Free;
         Raise;
    End;

end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
   Case IdReports of
     3     :FrmParamBalPatClas := TfrmParamBalPatClas.Create(Self);
     4     :FrmPreviewReports  := TfrmParamBalPatGrp.Create(Self);
     6     :FrmPreviewReports  := TfrmParamCafBalPatBem.Create(Self);
     7     :FrmPreviewReports  := TfrmParamBalPatCC.Create(Self);
     33234 :FrmPreviewReports  := TfrmParamBalPatGrpBx.Create(Self);
     1476  :FrmPreviewReports  := TfrmParamCadBem.Create(Self);
     2590  :FrmPreviewReports  := TfrmParamCadConjxBens.Create(Self);
     2303  :FrmPreviewReports  := TfrmParamCAFCadConjxRatCC.Create(Self);
     104   :FrmPreviewReports  := TfrmParamCAFInvPat.Create(Self);
   Else
    FrmPreviewReports := nil;
  End;
  inherited;

end;

initialization
   Sistema.NomeModulo := 'Controle do Ativo Fixo';  // Nome do Módulo
   Sistema.IdModulo := 7 ;                          // IdModulo cadastrado no SAD
   Sistema.Versao := '4.00.00' + #223;
   Sistema.NomeAplicativo := 'Controle do Ativo Fixo';

   IntegraBack := TIntegraBack.Create(True,True,True);
   AtivoFixo   := tAtivoFixo.Create;

finalization
   AtivoFixo.Free;
   IntegraBack.Free;

end.


