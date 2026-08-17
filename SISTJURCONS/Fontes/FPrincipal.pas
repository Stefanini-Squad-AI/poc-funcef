//Marcus Oliveira P. 24749 - 26/06/2007 - Chamar o Pesquisa Pessoa Geral
//*************************************************************************************************
// Autor(a)   : BRUNO AZEVEDO
// Data       : 13/12/2012
// Pendência  : SOL 196976 Kintana 1885516
// Descricao  : Ajustes ao abrir o consulta geral de pessoas.
//******************************************************************************************
// Autor(a)   : Eraldo Silva
// Data       : 29/02/2012
// Pendência  : SOL 175120 Kintana 15940219
// Descricao  : CONSULTA GERAL PESSOA Ao consultar alguma matricula no Consulta Geral de
//              Pessoa o sistema fecha a tela automaticamente.
//******************************************************************************************
//Rotina..........: FPrincipal
//N. Sol..........: 156018
//N. Kintana......: 1225602
//Data............: 04/07/2011
//Responsável.....: Paulo Nobre / Otacilio
//Descrição.......: Implementação de SP para Honorários Periciais.
//******************************************************************************************
//Rotina..........: fImportaDespesasAdministrativas
//N. Sol..........: 127754
//N. Kintana......: 682842
//Data............: 11/05/2010
//Responsável.....: Adilson Filho
//Descrição.......: Função de Chamamento de Formulário
//******************************************************************************************
//Rotina..........: fCadDespesasAdministrativas
//N. Sol..........: 127754
//N. Kintana......: 682842
//Data............: 11/05/2010
//Responsável.....: Adilson Filho
//Descrição.......: Função de Chamamento de Formulário
//******************************************************************************************

Unit FPrincipal;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
   uAutorizacao, TB97, Db, Wwdatsrc, DBTables, Wwquery,
   wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr,
   TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti,
   IvEMulti, fcLabel, SConnect, MConnect, DBClient, AppEvnts,
   CMApplicationEvents, StdActns, ActnList, fcStatusBar, uCtrlListTerceirosRH,
   CMNetUsers, uResource, DCapCarMT,
   //Marcus Oliveira P. 24749 - 26/06/2007
   UConsPart;

Type
   TfrmPrincipal = Class(TfrmCMPrincipal)
      N1: TMenuItem;
      mnuVerificaCusto: TMenuItem;
      mnuAlteracaodeResponsavel: TMenuItem;
      mnuAlteracaodeEscritorio: TMenuItem;
      mnuAdvogados: TMenuItem;
      mnuEmpresasAdqContraPartes: TMenuItem;
      mnuVaras: TMenuItem;
      N2: TMenuItem;
      mnuTiposdeProcesso: TMenuItem;
      mnuTiposdeAcao: TMenuItem;
      mnuMotivosdeExclusaodePessoas: TMenuItem;
      N3: TMenuItem;
      mnuGruposdeObjeto: TMenuItem;
      mnuTiposdeObjeto: TMenuItem;
      mnuTiposdeSentenca: TMenuItem;
      mnuTiposdeEtapa: TMenuItem;
      N4: TMenuItem;
      mnuRateiodeCustos: TMenuItem;
      mnuParametrizaoContabil: TMenuItem;
      mnuTransacoes: TMenuItem;
      mnuEtapasdoProcesso: TMenuItem;
      mnuHonorarios: TMenuItem;
      N5: TMenuItem;
      mnuManutDoc: TMenuItem;
      mnuProcesso: TMenuItem;
      N6: TMenuItem;
      mnuConsultaGeraldeProcessos: TMenuItem;
      mnuFolUpEtapas: TMenuItem;
      mnuGraficosFixos: TMenuItem;
      mnuEstatReclamacoes: TMenuItem;
      mnuEstatisticadeProcessos: TMenuItem;
      mnuDistribuicaodeProcessos: TMenuItem;
      mnuHonorariosAdvocaticios: TMenuItem;
      mnuRateioDespesasJudiciais: TMenuItem;
      mnuCorrecaoMonetria: TMenuItem;
      mnuAlteracoesExclusoesProcessos: TMenuItem;
      mnuAjusteEstimativaOriginal: TMenuItem;
      DespesasAdministrativas1: TMenuItem;
      ImportaodoMovimentodasDespesasAdministrativas1: TMenuItem;
      ManutenodasDespesasAdministrativas2: TMenuItem;
      N7: TMenuItem;
      OrdemJudicialFuncefNoParte1: TMenuItem;
      ReembolsodeHonorriosAdvocatciosaExFuncionrios1: TMenuItem;
      N8: TMenuItem;
      HonorriosContratuais1: TMenuItem;
      N9: TMenuItem;
      MnuMovimContrato: TMenuItem;
      Procedure nmuConfigParametrosClick(Sender: TObject);
      Procedure mnuVerificaCustoClick(Sender: TObject);
      Procedure mnuAlteracaodeResponsavelClick(Sender: TObject);
      Procedure mnuAlteracaodeEscritorioClick(Sender: TObject);
      Procedure mnuAdvogadosClick(Sender: TObject);
      Procedure mnuEmpresasAdqContraPartesClick(Sender: TObject);
      Procedure mnuVarasClick(Sender: TObject);
      Procedure mnuTiposdeProcessoClick(Sender: TObject);
      Procedure mnuTiposdeAcaoClick(Sender: TObject);
      Procedure mnuMotivosdeExclusaodePessoasClick(Sender: TObject);
      Procedure mnuGruposdeObjetoClick(Sender: TObject);
      Procedure mnuTiposdeObjetoClick(Sender: TObject);
      Procedure mnuTiposdeSentencaClick(Sender: TObject);
      Procedure mnuTiposdeEtapaClick(Sender: TObject);
      Procedure mnuRateiodeCustosClick(Sender: TObject);
      Procedure mnuParametrizaoContabilClick(Sender: TObject);
      Procedure mnuEtapasdoProcessoClick(Sender: TObject);
      Procedure mnuHonorariosClick(Sender: TObject);
      Procedure mnuManutDocClick(Sender: TObject);
      Procedure mnuConsultaGeraldeProcessosClick(Sender: TObject);
      Procedure mnuFolUpEtapasClick(Sender: TObject);
      Procedure mnuEstatReclamacoesClick(Sender: TObject);
      Procedure mnuEstatisticadeProcessosClick(Sender: TObject);
      Procedure AppPadraoAfterLogin(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
         DesReport: TObject; Var Config: Boolean);
      Procedure AppPadraoShowParamReportPadrao(sender: TObject;
         IdReports: Integer; Var sParams: String; Var PrintReport: Boolean);
      Procedure AppPadraoPrintReportPadrao(sender: TObject;
         IdReports: Integer; sFileName: String; Var Printed: Boolean);
      Procedure mnuDistribuicaodeProcessosClick(Sender: TObject);
      Procedure mnuProcessoClick(Sender: TObject);
      Procedure mnuHonorariosAdvocaticiosClick(Sender: TObject);
      Procedure mnuRateioDespesasJudiciaisClick(Sender: TObject);
      Procedure mnuCorrecaoMonetriaClick(Sender: TObject);
      Procedure mnuAlteracoesExclusoesProcessosClick(Sender: TObject);
      Procedure mnuAjusteEstimativaOriginalClick(
         Sender: TObject);
      Procedure MnuConsPart_PadraoClick(Sender: TObject);
      Procedure ImportaodoMovimentodasDespesasAdministrativas1Click(
         Sender: TObject);
      Procedure ManutenodasDespesasAdministrativas2Click(Sender: TObject);
      Procedure OrdemJudicialFuncefNoParte1Click(Sender: TObject);
      Procedure ReembolsodeHonorriosAdvocatciosaExFuncionrios1Click(
         Sender: TObject);
      Procedure HonorriosContratuais1Click(Sender: TObject);
      Procedure MnuMovimContratoClick(Sender: TObject);

   Private
      { Private declarations }
   Public
      { Public declarations }
   End;

Var
   frmPrincipal: TfrmPrincipal;
   //Marcus Oliveira P. 24749 - 26/06/2007
   ConsPart1: TConsPart;

Implementation

Uses uModulo2, uModulo, uSistema, fTelaAut, uIntegraBack, uCtrlParamIntegra, uCMTypes, uCtrlPadroes,
   UsoGeralRH, uCtrlUsoGeralRH, uCtrlFuncoesRH, {uCmCtrlRptModCon,} dCds, uCmCtrlRptSistJurCons,
   fCadParam, fAcertaCusto, fUsuXProcJur, fAdvogXProcJur,
   fCadAdvog, fCadEmprAdq, fCadVara, fCadTipProc, fCadTipAcao, fCadMotivoJur,
   fCadGrpObjeto, fCadTipObjeto, fCadTipSent, fCadTipRec, fCadRateio,
   fCadContJurid, fCadRegEtp, fCadRegHon, fSelConProc,
   fSelFolUp, fSelEstObj, fSelEstProc, fParamFichaProc, fParamAnalSintProc, fParamProcJud,
   fSelEstDistr, fCadProcesso, fAgenda, fCadHonorAdvog, fParamPenhora,
   fParamReciboAdvogados, fRateioDespesas, fCorrecaoMonet, fAjusteOriginal,
   FConsultaLogAltExcMT, fImportaDespesasAdministrativas,
   fCadDespesasAdministrativas, fCadOrdemJudicial, fCadReembolsoHonorariosAdvocaExDirigentes,
   fCadHonorariosContratuais, FCadMovimentoHonorariosContratuais,
   //Renan
   uCtrlLancDocCapCar, uCtrlPlacontasCapCar, FLancDocCapCarMT;

{$R *.DFM}

Procedure TfrmPrincipal.FormCreate(Sender: TObject);
Begin
   Inherited;
   //Renan - SistJurCons
   Modulo2 := TModulo2.Create;
   Modulo2.InitializeAs(Padroes);

   //Renan - CmCapCarObj50
   Application.CreateForm(TDtmCapCarMT, DtmCapCarMT);
   Modulo := TModulo.Create;
   Modulo.IndiceTipoBordero := 0;

   CtrlUsoGeralRH := TCtrlUsoGeralRH.Create;
   CtrlUsoGeralRH.InitializeAs(Padroes);

   FU := TCtrlFuncoesRH.Create;
   FU.InitializeAs(Padroes);

   IntegraBack := TIntegraBack.Create(true, true, true);
   IntegraBack.RecPag := 'P';

   dmCds := TdmCds.Create(Application);
End;

Procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
   c: integer;
   CtrlListTerceirosRH: TCtrlListTerceirosRH;
   lblBase: TLabel;
Begin
   Inherited;
   If (Sistema.FezLogin) Then
      Begin
         If (Sistema.MudouUsuario) Then
            ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCap);

         CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
            CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
         CtrlListTerceirosRH.InitializeAs(Padroes);

         Modulo2.IdContraCheque := CtrlListTerceirosRH.GetIdContraCheque;
         CtrlListTerceirosRH.Free;

         //Renan - CmCapCarUtilObj50
         If (Sistema.MudouUsuario) Or (Sistema.MudouEmpresa) Then
            Begin
               Modulo.InitializeAs(ParamIntegra);
               ParamIntegra.GetParams(Sistema.IdEmpresa, 0, '', '', tiCAP);
            End;

         IntegraBack.BuscaParamIntegra('PARAMCAP', 'INTEGRACONTAB', IntegraBack.RecPag);
         Modulo.BuscaParamCap(Sistema.IdEmpresa);

         frmAgenda := TfrmAgenda.Create(Self);
         FreeAndNil(frmAgenda);
      End;

   //--Renan Crsitiano SOL 131588 Kintana 754968 Inicio.
   lblBase := TLabel.Create(Self);

   stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;
   lblBase.Caption := stbarStatusBar.Panels[2].Text;
   stbarStatusBar.Panels[2].Width := intToStr(lblBase.Width + 18);

   FreeAndNil(lblBase);
   //--Renan Crsitiano SOL 131588 Kintana 754968 Fim.

   //Só para burlar as autorizações (no caso de estarem com problemas decorrentes do banco
//   For c := 0 To Self.ComponentCount - 1 Do
//      If (Self.Components[c] Is TMenuItem) Then
//         (Self.Components[c] As TMenuItem).Enabled := true;
End;

Procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadParam, TfrmCadParam, false);
End;

Procedure TfrmPrincipal.mnuVerificaCustoClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmAcertaCusto, TfrmAcertaCusto, false);
End;

Procedure TfrmPrincipal.mnuAlteracaodeResponsavelClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmUsuxProcJur, TfrmUsuxProcJur, false);
End;

Procedure TfrmPrincipal.mnuAlteracaodeEscritorioClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmAdvogxProcJur, TfrmAdvogxProcJur, false);
End;

Procedure TfrmPrincipal.mnuAdvogadosClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadAdvog, TfrmCadAdvog, false);
End;

Procedure TfrmPrincipal.mnuEmpresasAdqContraPartesClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadEmprAdq, TfrmCadEmprAdq, false);
End;

Procedure TfrmPrincipal.mnuVarasClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadVara, TfrmCadVara, false);
End;

Procedure TfrmPrincipal.mnuTiposdeProcessoClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadTipProc, TfrmCadTipProc, false);
End;

Procedure TfrmPrincipal.mnuTiposdeAcaoClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadTipAcao, TfrmCadTipAcao, false);
End;

Procedure TfrmPrincipal.mnuMotivosdeExclusaodePessoasClick(
   Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadMotivoJur, TfrmCadMotivoJur, false);
End;

Procedure TfrmPrincipal.mnuGruposdeObjetoClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadGrpObjeto, TfrmCadGrpObjeto, false);
End;

Procedure TfrmPrincipal.mnuTiposdeObjetoClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadTipObjeto, TfrmCadTipObjeto, false);
End;

Procedure TfrmPrincipal.mnuTiposdeSentencaClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadTipSent, TfrmCadTipSent, false);
End;

Procedure TfrmPrincipal.mnuTiposdeEtapaClick(Sender: TObject);
Begin
   Inherited;
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
  // AbrirForm(frmCadTipRec, TfrmCadTipRec, false);
   frmCadTipRec := TfrmCadTipRec.create(self);
   frmCadTipRec.ShowModal;
End;

Procedure TfrmPrincipal.mnuRateiodeCustosClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadRateio, TfrmCadRateio, false);
End;

Procedure TfrmPrincipal.mnuParametrizaoContabilClick(Sender: TObject);
Begin
   Inherited;
   frmCadContJurid := TfrmCadContJurid.create(self);
   frmCadContJurid.showmodal;
End;

Procedure TfrmPrincipal.mnuProcessoClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadProcesso, TfrmCadProcesso, false);
End;

Procedure TfrmPrincipal.mnuEtapasdoProcessoClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadRegEtp, TfrmCadRegEtp, false);
End;

Procedure TfrmPrincipal.mnuHonorariosClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadRegHon, TfrmCadRegHon, false);
End;

Procedure TfrmPrincipal.mnuManutDocClick(Sender: TObject);
Begin
   Inherited;
   //Renan
   TfrmLancDocCAPCAR.AbrirForm(opldEfetivo);
End;

Procedure TfrmPrincipal.mnuConsultaGeraldeProcessosClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmSelConProc, TfrmSelConProc, false);
End;

Procedure TfrmPrincipal.mnuFolUpEtapasClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmSelFolUp, TfrmSelFolUp, false);
End;

Procedure TfrmPrincipal.mnuEstatReclamacoesClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmSelEstObj, TfrmSelEstObj, false);
End;

Procedure TfrmPrincipal.mnuEstatisticadeProcessosClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmSelEstProc, TfrmSelEstProc, false);
End;

Procedure TfrmPrincipal.mnuDistribuicaodeProcessosClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmSelEstDistr, TfrmSelEstDistr, false);
End;

Procedure TfrmPrincipal.mnuHonorariosAdvocaticiosClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCadHonorAdvog, TfrmCadHonorAdvog, false);
End;

Procedure TfrmPrincipal.mnuRateioDespesasJudiciaisClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmRateioDespesas, TfrmRateioDespesas, false);
End;

Procedure TfrmPrincipal.mnuCorrecaoMonetriaClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmCorrecaoMonet, TfrmCorrecaoMonet, false);
End;

Procedure TfrmPrincipal.mnuAlteracoesExclusoesProcessosClick(
   Sender: TObject);
Begin
   Inherited;
   AbrirForm(FrmConsultaLogAltExc, TFrmConsultaLogAltExc, false);
End;

Procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
   liOrigemCm: Integer; DesReport: TObject; Var Config: Boolean);
Var
   CmCtrlRptSistJurCons: TCmCtrlRptSistJurCons;
Begin
   Inherited;
   CmCtrlRptSistJurCons := TCmCtrlRptSistJurCons.Create;
   Try
      Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptSistJurCons, DesReport);
      CmCtrlRptSistJurCons.Free;
   Except
      CmCtrlRptSistJurCons.Free;
      Raise;
   End;
End;

Procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
   IdReports: Integer; Var sParams: String; Var PrintReport: Boolean);
Begin
   Case (IdReports) Of
      4077: frmPreviewReports := TfrmParamFichaProc.Create(Self);
      4076: frmPreviewReports := TfrmParamAnalSintProc.Create(Self);
      4081: frmPreviewReports := TfrmParamProcJud.Create(Self);
      4097: frmPreviewReports := TfrmParamReciboAdvogados.Create(Self);
      4519: frmPreviewReports := TfrmParamPenhora.Create(Self);
   Else frmPreviewReports := Nil;
   End;
   Inherited;
End;

Procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
   IdReports: Integer; sFileName: String; Var Printed: Boolean);
Var
   RptSistJurCons: TCmCtrlRptSistJurCons;
Begin
   Inherited;
   RptSistJurCons := TCmCtrlRptSistJurCons.Create;
   Try
      Printed := ShowReport(IdReports, RptSistJurCons);
      RptSistJurCons.Free;
   Except
      RptSistJurCons.Free;
      Raise;
   End;
End;

Procedure TfrmPrincipal.mnuAjusteEstimativaOriginalClick(
   Sender: TObject);
Begin
   Inherited;
   AbrirForm(FrmAjusteOriginal, TFrmAjusteOriginal, false);
End;

Procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
Begin
   Inherited;
   //Marcus Oliveira P. 24749 - 26/06/2007 Inicio
   ConsPart1 := TConsPart.Create(frmPrincipal);

   If Not Sistema.GravaLogOperacoes('Operação Consulta Elegível/Participante') Then
      Begin
         Raise Exception.Create('Não foi possível Gravar o Log');
         exit;
      End;

   Try
      ConsPart1.sIdPessoa := '0';
      ConsPart1.sIdPessjur := '0';
      ConsPart1.sIdPlanoprev := '0';
      ConsPart1.sSeqProposta := '0';
      ConsPart1.fDataBaseName := 'BaseDados';
      ConsPart1.MostraConsulta;
   Finally
      // ELS SOL 175120 Kintana 1594021
      //FreeAndNil(ConsPart1);
   End;
   //Marcus Oliveira P. 24749 - 26/06/2007 Fim

End;

Procedure TfrmPrincipal.ImportaodoMovimentodasDespesasAdministrativas1Click(Sender: TObject);
Begin
   Inherited;
   frmImportaDespesasAdministrativas := TfrmImportaDespesasAdministrativas.create(self);
   frmImportaDespesasAdministrativas.ShowModal;
End;

Procedure TfrmPrincipal.ManutenodasDespesasAdministrativas2Click(
   Sender: TObject);
Begin
   Inherited;
   frmCadDespesasAdministrativas := TfrmCadDespesasAdministrativas.create(self);
   frmCadDespesasAdministrativas.ShowModal;
End;

Procedure TfrmPrincipal.OrdemJudicialFuncefNoParte1Click(Sender: TObject);
Begin
   Inherited;
   frmCadOrdemJudicial := TfrmCadOrdemJudicial.create(self);
   frmCadOrdemJudicial.showmodal;
End;

Procedure TfrmPrincipal.ReembolsodeHonorriosAdvocatciosaExFuncionrios1Click(Sender: TObject);
Begin
   frmReembolsoHonorariosAdvocaExDirigentes := TfrmReembolsoHonorariosAdvocaExDirigentes.create(self);
   frmReembolsoHonorariosAdvocaExDirigentes.ShowModal;
End;

Procedure TfrmPrincipal.HonorriosContratuais1Click(Sender: TObject);
Begin
   frmCadHonorariosContratuais := TfrmCadHonorariosContratuais.create(self);
   frmCadHonorariosContratuais.ShowModal;
End;

Procedure TfrmPrincipal.MnuMovimContratoClick(Sender: TObject);
Begin
   FrmMovimentoHonorariosContratuais := TFrmMovimentoHonorariosContratuais.Create(self);
   FrmMovimentoHonorariosContratuais.ShowModal;
End;

Initialization
   Sistema.NomeModulo := 'Sistema Jurídico Consolidado'; // Nome do Módulo
   Sistema.IdModulo := 719; // IdModulo cadastrado no SAD
   Sistema.Versao := '3.21.07';
   Sistema.NomeAplicativo := 'Sistema Jurídico Consolidado';
   //Renan - SistJurCons
   Modulo2 := TModulo2.Create;
   //Renan - CmCapCarUtilObj50
   Modulo := TModulo.Create;
Finalization
   //Renan - SistJurCons
   Modulo2.free;
   //Renan - CmCapCarUtilObj50
   Modulo.Free;
End.



