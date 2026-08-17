{*******************************************************************************
 ****************************** REGISTRO DE ALTERAÇÕES *************************
 *******************************************************************************

Rotina......: Add no Menu
Nº SOL......: 142552
Nº KINTANA..: 911795
Data........: 14/09/2011
Responsável.: Helen V. Bianchi/Leandro
Descrição...: Menu -> Carga Acréscimo/Decréscimo de Valor
--------------------------------------------------------------------------------
Rotina......: Add no Menu
Nº SOL......: 142551
Nº KINTANA..: 911676
Data........: 06/12/2010
Responsável.: Helen V. Bianchi
Descrição...: Menu -> Taxa de Depreciação / Vida Útil
--------------------------------------------------------------------------------
Rotina......: Caption do Menu
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 24/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Menu -> Movimentação -> "Acréscimo de Valor" alterado para :
              "Acréscimo/Decréscimo de valor".
              Menu->Cadastro->Tipos de Despesas para Acréscimo de Valor para:
              Tipos Específicos de Movimentação para Acréscimos/Decréscimos
              de Valor.
--------------------------------------------------------------------------------
Autor(a)....: Ádler Teodoro de Souza
Rotina......: ShowParamReportPadrao
Data........: 30/06/2009
SOL.........: 58194
KTN.........: 537571
Alteração...: Implementação da chamado de parâmetros de Relatório.
--------------------------------------------------------------------------------}


unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvEMulti,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, TB97, Db, Wwdatsrc, DBTables,
  Wwquery, wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls,
  uSistema,  IvDictio, IvAMulti, IvBinDic, IvMulti, CorreioCM, fcLabel, TreeWzd,
  Provider, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar,
  CMApplicationEvents, CMSQLScript, SConnect, MConnect, DBClient, uCMClientDataSet,
  uCtrlParamCAF, uCtrlIniciaMultiTaxa, uCtrlParamIntegra, uCtrlParamCAFxContab,
  uCmSqlParams, uResource, CMNetUsers, wwstorep;

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
    mnuImplantacao: TMenuItem;
    Terceiros1: TMenuItem;
    N4: TMenuItem;
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
    N14: TMenuItem;
    mnuDesmembramentoObra: TMenuItem;
    EstornarDesmembramento1: TMenuItem;
    mnuExpCadBensSRF: TMenuItem;
    sqlVerBensPend: TCMSqlParams;
    cdsVerBensPend: TCMClientDataSet;
    mnuExpDadosparaReavaliacao: TMenuItem;
    sqlVerificaBEM: TCMSqlParams;
    cdsVerificaBEM: TCMClientDataSet;
    sqlMoedaOficial: TCMSqlParams;
    cdsMoedaOficial: TCMClientDataSet;
    mnuObraLancAltera: TMenuItem;
    mnuUtilAjustaLancImplantacao: TMenuItem;
    mnuUtilReconDeprecBem: TMenuItem;
    mnuBemCotacao: TMenuItem;
    mnuUtilExpSISPROxOFA: TMenuItem;
    mnuCadCafMoedas: TMenuItem;
    mnuCadCAFPaises: TMenuItem;
    sqlCAFMoedas: TCMSqlParams;
    cdsCAFMoedas: TCMClientDataSet;
    mnuCorrecaoGrupoBem: TMenuItem;
    N21: TMenuItem;
    SeleoparaReavaliao1: TMenuItem;
    mnuListaTransfIlegal: TMenuItem;
    cdsPlanPrevContab: TCMClientDataSet;
    N22: TMenuItem;
    TaxadeDeprecicao: TMenuItem;
    mnuCargaAcreDecre: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Situacoes11Click(Sender: TObject);
    procedure Tiposdeareas1Click(Sender: TObject);
    procedure Localizacoes1Click(Sender: TObject);
    procedure GruposdeBens1Click(Sender: TObject);
    procedure ContasMovimentoporGrupos1Click(Sender: TObject);
    procedure MotivosdeBaixadeBens1Click(Sender: TObject);
    procedure Terceiros1Click(Sender: TObject);
    procedure sbtnHelpClick(Sender: TObject);
    procedure mnuAjudaIndiceClick(Sender: TObject);
    procedure Responsaveis1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure TipodeDespesaparaAcrescimodeValor1Click(Sender: TObject);
    procedure Terceiro1Click(Sender: TObject);
    procedure ClassesdeBens1Click(Sender: TObject);
    procedure Depreciacao1Click(Sender: TObject);
    procedure Depreciacao2Click(Sender: TObject);
    procedure mnuCadBensClick(Sender: TObject);
    procedure ConjuntosdeBens1Click(Sender: TObject);
    procedure timBensPendentesTimer(Sender: TObject);
    procedure VerificaBensPendentes;
    procedure mnuCadTipoSaidaTempClick(Sender: TObject);
    procedure DestinatriosdeBensAlienados1Click(Sender: TObject);
    procedure lblAutorizaTempClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuEtapasdeObrasClick(Sender: TObject);
    procedure mnuReconstruirSaldoClick(Sender: TObject);
    procedure mnuConsSldCtbClick(Sender: TObject);
    procedure Movimentacoes1Click(Sender: TObject);
    procedure mnuBensPendentesAlmoxClick(Sender: TObject);
    procedure mnuSelTransfClick(Sender: TObject);
    procedure mnuTransfBensClick(Sender: TObject);
    procedure mnuMovSaidaTempClick(Sender: TObject);
    procedure mnuMovExecSaidaTempClick(Sender: TObject);
    procedure mnuMovRetSaidaTempClick(Sender: TObject);
    procedure mnuTrocadePlaca1Click(Sender: TObject);
    procedure mnuInvGeracaoClick(Sender: TObject);
    procedure mnuInvCadastramentoClick(Sender: TObject);
    procedure mnuInvProcessamentoClick(Sender: TObject);
    procedure mnuConsultBens1Click(Sender: TObject);
    procedure mnuConsLevInventClick(Sender: TObject);
    procedure mnuConsultCafObrasClick(Sender: TObject);
    procedure mnuConsParamContabClick(Sender: TObject);
    procedure mnuSaldoContabilporGrupo1Click(Sender: TObject);
    procedure mnuCadObraClick(Sender: TObject);
    procedure mnuLancamentosObraClick(Sender: TObject);
    procedure mnuEstornaLancamentosClick(Sender: TObject);
    procedure mnuEncerramentoObraClick(Sender: TObject);
    procedure mnuDesmembramentoObraClick(Sender: TObject);
    procedure EstornarDesmembramento1Click(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject; IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure mnuSelBaixa1Click(Sender: TObject);
    procedure mnuMovBaixaClick(Sender: TObject);
    procedure OutrasMovimentaes1Click(Sender: TObject);
    procedure mnuMovControleTotalClick(Sender: TObject);
    procedure mnuMovDesmembramentoClick(Sender: TObject);
    procedure mnuMovReavaliacaoClick(Sender: TObject);
    procedure mnuMovAcrescimoClick(Sender: TObject);
    procedure mnuUtilExpPlacasClick(Sender: TObject);
    procedure mnuExpContabClick(Sender: TObject);
    procedure mnuExpCadBensSRFClick(Sender: TObject);
    procedure mnuExpDadosparaReavaliacaoClick(Sender: TObject);
    procedure mnuMovRemembramentoClick(Sender: TObject);
    procedure mnuObraLancAlteraClick(Sender: TObject);
    procedure mnuUtilAjustaLancImplantacaoClick(Sender: TObject);
    procedure mnuUtilReconDeprecBemClick(Sender: TObject);
    procedure mnuBemCotacaoClick(Sender: TObject);
    procedure mnuUtilExpSISPROxOFAClick(Sender: TObject);
    procedure mnuCadCafMoedasClick(Sender: TObject);
    procedure mnuCadCAFPaisesClick(Sender: TObject);
    procedure mnuCorrecaoGrupoBemClick(Sender: TObject);
    procedure SeleoparaReavaliao1Click(Sender: TObject);
    procedure mnuListaTransfIlegalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TaxadeDeprecicaoClick(Sender: TObject);
    procedure mnuCargaAcreDecreClick(Sender: TObject);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    IniciaMultiTaxa : TCtrlIniciaMultiTaxa;
    ParamCAFxContab : TCtrlParamCAFxContab;
    Procedure Progresso(vParam : Array of Variant);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

uses fTelaAut, uAutorizacao, uMensErro, fAguarde, uCtrlPadroes, uCtrlRptCAF,
     fMTCadSituacoes, fMTCadTipoArea, fMTCadTipoDespAV, fMTCadMotivoBaixa,
     rCAFCadBemCustomFrm, fMTCadTipoSaidaTemp, fMTCadObraTipoEtapa, fMTCadLocalizacao,
     fMTCadGrupoContab, fMTCadResponsavel, fMTCadTerceiro, fMTCadDestinatBaixa,
     fMTCadClassedeBem, fMTCadParamCAFxContab, fMTCadConjunto, fMTCadParamCAF,
     fMTCadBem, fMTFechamento, fMTEstornaFechamento, fMTReconstroiSaldo,
     fMTConsSaldoContabBem, fMTConsHistMovBem, fMTMovBensPendentes,
     fMTMovSelTransf, fMTMovTransfBem, fMTMovSaidaTempCad, fMTMovSaidaTempExe,
     fMTMovSaidaTempRet, fMTMovTransfPlaca, fMTInvGeracao, fMTInvRegResultado,
     fMTInvProcessar, fMTConsCadBens, fMTConsInventBens, fMTConsCafObra,
     fMTConsParamContab, fMTConsSaldoContabGrupo, fMTObraCad, fMTObraLanc,
     fMTObraLancEstorna, fMTObraEncerrar, fMTObraDesmemb, fMTObraDesmembEstorna,
     fMTMovSelBaixa, fMTMovBaixa, fMTEstornaMovimentacoes, fMTMovControleTotal,
     fMTMovDesmembramento, fMTMovReavaliacao, fMTMovAcrescimoValor,
     fMTUtilExpPlacas, fMTUtilExpContab, fMTUtilExpCadBensSRF,
     fMTUtilExpDadosparaReaval, fMTMovRemembramento, fMTObraLancAltera,
     fMTUtilAjustaLancImplantacao, fMTUtilReconDeprecBem, fMTCadBemCotacao,
     fMTUtilExpSISPROxOFA, fMTCadMoedas, fMTCadPaises, rCAFProjSldCtbBemFrm,
     fMTUtilCorrGrupoBem,fMTMovSelReaval,fMTUtilTransfIlegal, fCAFTermoResp,//Ádler Souza - SOL N° 58194 KINTANA N° 537571
     fMTCadDepreVida{Helen - SOL Nº142551 KINTANA Nº 911676},uFrmImportAcreDecreValor;

procedure TfrmPrincipal.Progresso(vParam : Array of Variant);
begin
   inherited;
   frmAguarde.Max     := vParam[1];
   frmAguarde.Pos     := vParam[2];
   frmAguarde.Caption := vParam[3];
   Application.ProcessMessages;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   inherited;
   if MHeight <= 0 then
   begin
      MHeight := Self.ClientHeight + 112;
      MWidth  := Self.ClientWidth - 32;
   end;
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var
   iAnoIni,iMesIni,iDiaIni,
   iAnoFim,iMesFim,iDiaFim  : Word;
   dDataIni, dDataFim : TDateTime;

begin
   inherited;
   if Sistema.FezLogin then
   begin
      try
         ParamCAFxContab := TCtrlParamCAFxContab.Create;
         ParamCAFxContab.InitializeAs(Padroes);
         //-------------------------------------------------------------------------------
         IniciaMultiTaxa := TCtrlIniciaMultiTaxa.Create;
         IniciaMultiTaxa.InitializeAs(Padroes);
         IniciaMultiTaxa.Progresso := Progresso;
         //-------------------------------------------------------------------------------
         try
            ParamIntegra.GetParams(Sistema.IdEmpresa,0,'INTEGRACONTAB','PARAMETROSCAFMANUT',tiSistema) ;
            //----------------------------------------------------------------------------
            ParamCAF := TCtrlParamCAF.Create;
            ParamCAF.InitializeAs(Padroes);
            //----------------------------------------------------------------------------
            // Carga dos parâmetros do sistema
            //----------------------------------------------------------------------------
            if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
            begin
               AbrirForm(FrmMTCadParamCaf,TFrmMTCadParamCaf,False);
               ParamCAF.CarregaProp(Sistema.IdEmpresa);
            end;
            //----------------------------------------------------------------------------
            // Verifica se o Plano Previdenciário Padrão é válido
            //----------------------------------------------------------------------------
            cdsPlanPrevContab.Data := ParamCAF.ListaPlanoPrev;
            if not cdsPlanPrevContab.Locate('IDPLANOPREV',ParamCAF.PLANPREVPADRAO,[]) then
            begin
               if MsgDlg('O Plano Previdenciário Padrão cadastrado no CAF está incompatível' + #13 +
                         'com a lista atual de Planos Previdenciários Contábeis.' + #13 + #13 +
                         'Deseja realizar a atualização agora ?',
                         'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
               begin
                  AbrirForm(FrmMTCadParamCaf,TFrmMTCadParamCaf,False);
                  ParamCAF.CarregaProp(Sistema.IdEmpresa);
               end;
            end;
            cdsPlanPrevContab.Close;
            //----------------------------------------------------------------------------
            // Atualiza a tabela de Tipos de Movimentação (Interna)
            //----------------------------------------------------------------------------
            ParamCAFxContab.ReconstroiTipoMovimentacao;
            //----------------------------------------------------------------------------
            // Processa a mudança para a nova modelagem (MultiTaxa)
            //----------------------------------------------------------------------------
           {if ParamCAF.DTAINICAFMT = '' then
            begin
               sqlVerificaBEM.Prepare;
               sqlVerificaBEM.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
               sqlVerificaBEM.Open;
               if cdsVerificaBEM.FieldByName('QTDBEM').AsInteger > 0 then
               begin
                  if MsgDlg('Essa é a primeira vez que a versão MT do CAF será executada ' + #13 +
                            'nesta empresa. Será necessário migrar os dados para a nova ' + #13 +
                            'modelagem e essa migração é definitiva.' + #13 + #13 +
                            'Deseja prosseguir ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                  begin
                     frmAguarde.Min := 0;
                     frmAguarde.Max := 1;
                     frmAguarde.Pos := 0;
                     frmAguarde.Mostra('Migrando para Modelo Multi-Taxa ...');
                     Application.ProcessMessages;
                     //-------------------------------------------------------------------
                     IniciaMultiTaxa.CreateThreadProgresso;
                     if not IniciaMultiTaxa.Executar(Sistema.IdEmpresa,
                                                     ParamCAF.MOEDAOFICIAL,
                                                     ParamCAF.MOEDAFISCAL,
                                                     ParamCAF.MOEDAGERENCIAL,
                                                     IniciaMultiTaxa.ProgressFileName) then
                     begin
                        IniciaMultiTaxa.FreeThreadProgresso;
                        Raise Exception.Create(IniciaMultiTaxa.MessageInfo)
                     end else
                     begin
                        IniciaMultiTaxa.FreeThreadProgresso;
                        frmAguarde.Apaga;
                        //----------------------------------------------------------------
                        MsgDlg('Migração Realizada! ' + #13 + #13 +
                               'O sistema agora irá entrar na rotina RECONSTRUIR SALDO CONTÁBIL. Ela' + #13 +
                               'deverá ser executada totalmente, com a finalidade de compatibilizar os' + #13 +
                               'saldos contábeis com o registro de movimentação na nova modelagem.',
                               'Informação',mtInformation,[mbOk],0);
                        AbrirForm(FrmMTReconstroiSaldo,TFrmMTReconstroiSaldo,False);
                     end;
                  end else
                  begin
                     Raise Exception.Create('Migração Abortada pelo Usuário!');
                  end;
               end else
               begin
                  //----------------------------------------------------------------------
                  // Entra na função somente para atualizar ParamCAF.DTAINICAFMT
                  //----------------------------------------------------------------------
                  if not IniciaMultiTaxa.Executar(Sistema.IdEmpresa,
                                                  ParamCAF.MOEDAOFICIAL,
                                                  ParamCAF.MOEDAFISCAL,
                                                  ParamCAF.MOEDAGERENCIAL,
                                                  IniciaMultiTaxa.ProgressFileName) then
                     Raise Exception.Create(IniciaMultiTaxa.MessageInfo);
               end;
               cdsVerificaBEM.Close;
            end;}
            //----------------------------------------------------------------------------
            // Transferir os dados da versão MultiTaxa Beta para a versão Plena
            // Função contida na classe IniciaMultiTaxa
            //----------------------------------------------------------------------------
            {sqlVerificaBEM.Prepare;
            sqlVerificaBEM.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
            sqlVerificaBEM.Open;
            if cdsVerificaBEM.FieldByName('QTDBEM').AsInteger > 0 then
            begin
               sqlCAFMoedas.Prepare;
               sqlCAFMoedas.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
               sqlCAFMoedas.Open;
               if cdsCAFMoedas.IsEmpty or (cdsCAFMoedas.FieldByName('QTD').AsInteger <= 0) then
               begin
                  if not IniciaMultiTaxa.MultiTaxaBeta2Plena(Sistema.IdEmpresa) then
                     Raise Exception.Create(IniciaMultiTaxa.MessageInfo);
               end;
               cdsCAFMoedas.Close;
            end;
            cdsVerificaBEM.Close;}
            //----------------------------------------------------------------------------
            // Ativa o Timer de Bens Pendentes
            //----------------------------------------------------------------------------
            Screen.Cursor := crSQLWait;
            VerificaBensPendentes;
            Screen.Cursor := crDefault;
         except
            On E : Exception Do
            begin
               MsgDlg(E.Message + #13 + #13 + 'Processamento Encerrado!','Erro',mtError,[mbOk],0);
               sbtnSair.Click;
            end;
         end;
      finally
         frmAguarde.Apaga;
         ParamCAFxContab.Free;
         IniciaMultiTaxa.Free;
      end;
      //----------------------------------------------------------------------------------
      // Ativa o menu com utilitários de Implantação
      //----------------------------------------------------------------------------------
      DecodeDate(strtodate('01/01/2000'),iAnoIni,iMesIni,iDiaIni);
      DecodeDate(strtodate('01/01/2000'),iAnoFim,iMesFim,iDiaFim);
      dDataIni := EncodeDate(iAnoIni,iMesIni,iDiaIni);
      dDataFim := EncodeDate(iAnoFim,iMesFim,iDiaFim);
      if (date >= dDataIni) and (date <= dDataFim) then
      begin
         mnuImplantacao.Visible := True;
         mnuUtilAjustaLancImplantacao.Visible := True;
         mnuUtilReconDeprecBem.Visible := True;
         mnuUtilAjustaLancImplantacao.Enabled := True;
         mnuUtilReconDeprecBem.Enabled := True;
      end else
      begin
         mnuImplantacao.Visible := False;
      end;
      //**********************************************************************************
      // Ativa o utilitário para consulta as transferencias manuais de grupo
      //**********************************************************************************
      DecodeDate(strtodate('20/03/2006'),iAnoIni,iMesIni,iDiaIni);
      DecodeDate(strtodate('31/03/2006'),iAnoFim,iMesFim,iDiaFim);
      dDataIni := EncodeDate(iAnoIni,iMesIni,iDiaIni);
      dDataFim := EncodeDate(iAnoFim,iMesFim,iDiaFim);
      if (date >= dDataIni) and (date <= dDataFim) then
      begin
         mnuListaTransfIlegal.Visible := True;
         mnuListaTransfIlegal.Enabled := True;
      end else
      begin
         mnuListaTransfIlegal.Visible := False;
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
   sqlVerBensPend.Prepare;
   sqlVerBensPend.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   sqlVerBensPend.Open;
   frmAguarde.Pos := 1;
   frmAguarde.Apaga;
   if not cdsVerBensPend.IsEmpty then
      if cdsVerBensPend.FieldbyName('QTDBENSPEND').AsInteger > 0 then
         if msgdlg('Existem bens cadastrados pelo ALMOXARIFADO que estão com a Entrada '+
                   'Pendente no Ativo Fixo. Deseja processá-los agora ?','Atenção',
                   mtConfirmation,[mbYes,mbNo],0) = mrYes then
            AbrirForm(FrmMTMovBensPendentes,TFrmMTMovBensPendentes,False);
   cdsVerBensPend.Close;
end;
//========================================================================================
procedure TfrmPrincipal.lblAutorizaTempClick(Sender: TObject);
var
   x : Integer;
begin
   inherited;
   for x := 0 To ComponentCount -1 Do
   begin
      if Components[x] is TMenuItem then
         (Components[x] as TMenuItem).Visible := True;
      if Components[x] is TMenuItem then
         (Components[x] as TMenuItem).Enabled := True;
   end;
end;
//========================================================================================
procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; var Printed: Boolean);
var
   RptCAF : TCtrlRptCAF;
begin
   inherited;
   RptCAF := TCtrlRptCAF.Create;
   try
      Printed := ShowReport(IdReports, RptCAF);
      RptCAF.Free;
   except
      RptCAF.Free;
      raise;
   end;
end;
//========================================================================================
procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
   RptCAF : TCtrlRptCAF;
begin
   inherited;
   RptCAF := TCtrlRptCAF.Create;
   try
      Config := ConfigReport(liIdReports,liOrigemCm,RptCAF,DesReport);
      RptCAF.Free;
   except
      RptCAF.Free;
      Raise;
   end;
end;
//========================================================================================
procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(Sender: TObject; IdReports: Integer;
                                                       var sParams: String; var PrintReport: Boolean);
begin
   case IdReports of
// Ádler Teodoro de Souza - SOL  N° 58194 KINTANA Nº 537571 - Início
     2270 : FrmPreviewReports := TFrmCAFTermoResp.Create(Self);
// Ádler Teodoro de Souza - SOL  N° 58194 KINTANA Nº 537571 - Fim
     3034 : FrmPreviewReports := TRptCAFCadBemCustomFrm.Create(Self);
     4209 : FrmPreviewReports := TRptCAFProjSldCtbBemFrm.Create(Self);
   else
     FrmPreviewReports := Nil;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ParamCAF.Free;
  inherited;
end;
//========================================================================================
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
//========================================================================================
procedure TfrmPrincipal.Localizacoes1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadLocalizacao,TFrmMTCadLocalizacao,False);
end;

procedure TfrmPrincipal.Tiposdeareas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadTipoArea,TFrmMTCadTipoArea,False);
end;

procedure TfrmPrincipal.Situacoes11Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadSituacoes,TFrmMTCadSituacoes,False);
end;

procedure TfrmPrincipal.GruposdeBens1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadGrupoContab,TFrmMTCadGrupoContab,False);
end;

procedure TfrmPrincipal.MotivosdeBaixadeBens1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadMotivoBaixa,TFrmMTCadMotivoBaixa,False);
end;

procedure TfrmPrincipal.Terceiros1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTCadTerceiro,TfrmMTCadTerceiro,False);
end;

procedure TfrmPrincipal.Responsaveis1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTCadResponsavel,TfrmMTCadResponsavel,False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadParamCaf,TFrmMTCadParamCaf,False);
end;

procedure TfrmPrincipal.TipodeDespesaparaAcrescimodeValor1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTCadTipoDespAV,TfrmMTCadTipoDespAV,False);
end;

procedure TfrmPrincipal.Terceiro1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTCadTerceiro, TfrmMTCadTerceiro, false);
end;

procedure TfrmPrincipal.ClassesdeBens1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadClassedeBem, TFrmMTCadClassedeBem, False);
end;

procedure TfrmPrincipal.Depreciacao1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTFechamento, TfrmMTFechamento, False);
end;

procedure TfrmPrincipal.Depreciacao2Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTEstornaFechamento,TFrmMTEstornaFechamento,False);
end;

procedure TfrmPrincipal.mnuCadBensClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadBem,TFrmMTCadBem,False);
   frmMTCadBem.Top := frmMTCadBem.Top - 3;
end;

procedure TfrmPrincipal.ContasMovimentoporGrupos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadParamCAFxContab,TFrmMTCadParamCAFxContab,False);
end;

procedure TfrmPrincipal.ConjuntosdeBens1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadConjunto,TFrmMTCadConjunto,False);
end;

procedure TfrmPrincipal.mnuCadTipoSaidaTempClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadTipoSaidaTemp,TFrmMTCadTipoSaidaTemp,False);
end;

procedure TfrmPrincipal.DestinatriosdeBensAlienados1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadDestinatBaixa,TFrmMTCadDestinatBaixa,False);
end;

procedure TfrmPrincipal.mnuEtapasdeObrasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadObraTipoEtapa,TFrmMTCadObraTipoEtapa,False);
end;

procedure TfrmPrincipal.mnuReconstruirSaldoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTReconstroiSaldo,TFrmMTReconstroiSaldo,False);
end;

procedure TfrmPrincipal.mnuConsSldCtbClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTConsSaldoContabBem,TFrmMTConsSaldoContabBem,False);
end;

procedure TfrmPrincipal.Movimentacoes1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTConsHistMovBem,TFrmMTConsHistMovBem,False);
end;

procedure TfrmPrincipal.mnuBensPendentesAlmoxClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovBensPendentes,TFrmMTMovBensPendentes,False);
end;

procedure TfrmPrincipal.mnuSelTransfClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovSelTransf,TFrmMTMovSelTransf,False);
end;

procedure TfrmPrincipal.mnuTransfBensClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovTransfBem,TFrmMTMovTransfBem,False);
end;

procedure TfrmPrincipal.mnuMovSaidaTempClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovSaidaTempCad,TFrmMTMovSaidaTempCad,False);
end;

procedure TfrmPrincipal.mnuMovExecSaidaTempClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovSaidaTempExe,TFrmMTMovSaidaTempExe,False);
end;

procedure TfrmPrincipal.mnuMovRetSaidaTempClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovSaidaTempRet,TFrmMTMovSaidaTempRet,False);
end;

procedure TfrmPrincipal.mnuTrocadePlaca1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovTransfPlaca,TFrmMTMovTransfPlaca,False);
end;

procedure TfrmPrincipal.mnuInvGeracaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTInvGeracao,TFrmMTInvGeracao,False);
end;

procedure TfrmPrincipal.mnuInvCadastramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTInvRegResultado,TFrmMTInvRegResultado,False);
end;

procedure TfrmPrincipal.mnuInvProcessamentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTInvProcessar,TFrmMTInvProcessar,False);
end;

procedure TfrmPrincipal.mnuConsultBens1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTConsCadBens,TFrmMTConsCadBens,False);
end;

procedure TfrmPrincipal.mnuConsLevInventClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTConsInventBens,TFrmMTConsInventBens,False);
end;

procedure TfrmPrincipal.mnuConsultCafObrasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTConsCafObra,TFrmMTConsCafObra,False);
end;

procedure TfrmPrincipal.mnuConsParamContabClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTConsParamContab,TFrmMTConsParamContab,False);
end;

procedure TfrmPrincipal.mnuSaldoContabilporGrupo1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTConsSaldoContabGrupo,TFrmMTConsSaldoContabGrupo,False);
end;

procedure TfrmPrincipal.mnuCadObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTObraCad,TFrmMTObraCad,False);
end;

procedure TfrmPrincipal.mnuLancamentosObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTObraLanc,TFrmMTObraLanc,False);
end;

procedure TfrmPrincipal.mnuEstornaLancamentosClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTObraLancEstorna,TFrmMTObraLancEstorna,False);
end;

procedure TfrmPrincipal.mnuEncerramentoObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTObraEncerrar,TFrmMTObraEncerrar,False);
end;

procedure TfrmPrincipal.mnuDesmembramentoObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTObraDesmemb,TFrmMTObraDesmemb,False);
end;

procedure TfrmPrincipal.EstornarDesmembramento1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTObraDesmembEstorna,TFrmMTObraDesmembEstorna,False);
end;

procedure TfrmPrincipal.mnuSelBaixa1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovSelBaixa,TFrmMTMovSelBaixa,False);
end;

procedure TfrmPrincipal.mnuMovBaixaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovBaixa,TFrmMTMovBaixa,False);
end;

procedure TfrmPrincipal.OutrasMovimentaes1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTEstornaMovimentacoes,TFrmMTEstornaMovimentacoes,False);
end;

procedure TfrmPrincipal.mnuMovControleTotalClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovControleTotal,TFrmMTMovControleTotal,False);
end;

procedure TfrmPrincipal.mnuMovDesmembramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovDesmembramento,TFrmMTMovDesmembramento,False);
end;

procedure TfrmPrincipal.mnuMovReavaliacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovReavaliacao,TFrmMTMovReavaliacao,False);
end;

procedure TfrmPrincipal.mnuMovAcrescimoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovAcrescimoValor,TFrmMTMovAcrescimoValor,False);
end;

procedure TfrmPrincipal.mnuUtilExpPlacasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTUtilExpPlacas,TfrmMTUtilExpPlacas,False);
end;

procedure TfrmPrincipal.mnuExpContabClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTUtilExpContab,TfrmMTUtilExpContab,False);
end;

procedure TfrmPrincipal.mnuExpCadBensSRFClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTUtilExpCadBensSRF,TfrmMTUtilExpCadBensSRF,False);
end;

procedure TfrmPrincipal.mnuExpDadosparaReavaliacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTUtilExpDadosparaReaval,TFrmMTUtilExpDadosparaReaval,False);
end;

procedure TfrmPrincipal.mnuMovRemembramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovRemembramento,TFrmMTMovRemembramento,False);
end;

procedure TfrmPrincipal.mnuObraLancAlteraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTObraLancAltera,TFrmMTObraLancAltera,False);
end;

procedure TfrmPrincipal.mnuUtilAjustaLancImplantacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTUtilAjustaLancImplantacao,TFrmMTUtilAjustaLancImplantacao,False);
end;

procedure TfrmPrincipal.mnuUtilReconDeprecBemClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTUtilReconDeprecBem,TFrmMTUtilReconDeprecBem,False);
end;

procedure TfrmPrincipal.mnuBemCotacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadBemCotacao,TFrmMTCadBemCotacao,False);
end;

procedure TfrmPrincipal.mnuUtilExpSISPROxOFAClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTUtilExpSISPROxOFA,TFrmMTUtilExpSISPROxOFA,False);
end;

procedure TfrmPrincipal.mnuCadCafMoedasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadMoedas,TFrmMTCadMoedas,False);
end;

procedure TfrmPrincipal.mnuCadCAFPaisesClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadPaises,TFrmMTCadPaises,False);
end;

procedure TfrmPrincipal.mnuCorrecaoGrupoBemClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTUtilCorrGrupoBem,TFrmMTUtilCorrGrupoBem,False);
end;

procedure TfrmPrincipal.SeleoparaReavaliao1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTMovSelReaval,TFrmMTMovSelReaval,False);
end;

procedure TfrmPrincipal.mnuListaTransfIlegalClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTUtilTransfIlegal,TFrmMTUtilTransfIlegal,False);
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCAFTermoResp,frmCAFTermoResp);
  AbrirForm(frmCAFTermoResp,TfrmCAFTermoResp,False);
end;

procedure TfrmPrincipal.TaxadeDeprecicaoClick(Sender: TObject);
begin
  inherited;
    AbrirForm(FrmMTCadDepreVida,TFrmMTCadDepreVida,False);
end;

procedure TfrmPrincipal.mnuCargaAcreDecreClick(Sender: TObject);
begin
  inherited;
  //Helen - SOL:142552 Kintana : 911795
  Application.CreateForm(TFrmImportAcreDecreValor,FrmImportAcreDecreValor);
  FrmImportAcreDecreValor.ShowModal;
end;

initialization
   Sistema.IdModulo := 7;
   Sistema.NomeModulo := 'Controle do Ativo Fixo';
   Sistema.Versao := '3.09.18c';
   Sistema.NomeAplicativo := 'Controle do Ativo Fixo';
end.

