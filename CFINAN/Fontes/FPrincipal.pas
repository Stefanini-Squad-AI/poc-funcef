//------------------------------------------------------------------------------
//----------------------- HISTÓRICO DE ALTERAÇÕES ------------------------------
//------------------------------------------------------------------------------

//N. SIG........: 128734
//Dt Alteração..: 31/08/2022
//Responsável...: Everson
//Descrição.....: Criação do menu Exclusão Drive
//------------------------------------------------------------------------------
//Rotina.............: mnuConcTarifBancClick, mnuTarifaBancariaClick
//N. SIG.............: 81135
//Data da Alteração..: 22/01/2019
//Alteração Form.....: FPrincipal
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de itens de menu.
//------------------------------------------------------------------------------
//Rotina......: .dfm (Consulta -> Fluxos), desativar itens de menu
//Nº SOL......: 136203
//Nº KINTANA..: 813205
//Data........: 16/06/2014
//Responsável.: Edilaine Ferraresi
//Descrição...: Nova funcionalidade para Fluxo de Caixa
//              -> Consultas -> Fluxos
//              Remoção dos itens de menu:
//              -> Consultas -> Fluxo Previsto
//              -> Consultas -> Fluxo Realizado
//              -> Consultas -> Fluxo Orçado
//              -> Consultas -> Fluxo Orçado x Realizado
//------------------------------------------------------------------------------
//Rotina......: mnuConsBloqueiosDesbloqueiosJudiciaisClick
//Nº SOL......: 207968
//Nº KINTANA..: 2040576
//Data........: 16/08/2013
//Responsável.: Paulo Nobre
//Descrição...: Criação do item de menu
//              Consulta -> Consulta Bloqueios/Desbloqueios Judiciais
//------------------------------------------------------------------------------
//Rotina......: mnuConsultaContaCorrente
//Nº SOL......: 138463
//Nº KINTANA..: 843717
//Data........: 14/09/2010
//Responsável.: Fábio Henrique Beccaria Sampaio
//Descrição...: Criação do item de menu
//              Movimentação -> Disponibilidade Financeira -> Consulta - Conta
//              Corrente
//------------------------------------------------------------------------------
//Rotina......: -
//Nº SOL......: 124845/2622
//Nº KINTANA..: 963737
//Data........: 05/10/2010
//Responsável.: Fábio Henrique Beccaria Sampaio
//Descrição...: Exclusão dos itens de menu "mnuConsultaCGPC" e
//              "mnuConsultaOperacionalCGPC"
//              Movimentação -> Disponibilidade Financeira -> Consulta CGPC
//              Movimentação -> Disponibilidade Financeira -> Consulta
//              Operacional - CGPC
//------------------------------------------------------------------------------
//Rotina......: mnuCadGrupoRateioFluxo
//Nº SOL......: 128685
//Nº KINTANA..: 692049
//Data........: 06/05/2010
//Responsável.: Fábio Henrique Beccaria Sampaio
//Descrição...: Criação do item de menu
//              Cadastros -> Padrões Rateio Movimentações Fluxo Orçado
//------------------------------------------------------------------------------
//Data      : 10/09/2007
//Autor     : Marcus Oliveira
//Pendência : 25758
//Descrição : Retirada o menu "Consulta" da Disponibilidade Financeira.
//------------------------------------------------------------------------------
//Data      : 03/07/2007
//Autor     : Fabio Fagundes
//Código    : AL_4
//Pendência : 25758
//Descrição : Alterado os menus de Disponibilidade pois a Disponibilidade - Nova
//            foi descontinuada ficando somente a Consulta Antiga e a
//            Operacional
//------------------------------------------------------------------------------
//Data      : 13/11/2006
//Autor     : Fabio Fagundes
//Código    : AL_3
//Pendência : 21865, 21867
//Descrição : Implemetação de Grupamento por Plano e Patro e Tipo de Receb/
//            Desemb Operacional Pasagem para 3 camadas
//Descrição : Implemetação para trazer somente documentos baixados
//------------------------------------------------------------------------------
//Data      : 23/02/2006
//Autor     : Fabio Fagundes
//Código    : AL_2
//Descrição : Implementação do menu mnuConsDisponibilidadeMT1 para execução da
//            Disponibilidad buscando os registros baixados do CFinan
//------------------------------------------------------------------------------
//Data      : 18/08/2004
//Autor     : Fabio Fagundes
//Código    : AL_1
//Descrição : Implementação do menu mnuConsDisponibilidadeSpc para execução da
//            Disponibilidad via Stored Procedure (temporariamente habilitada
//            para a usuaria KARINAB e ROSELI (FUNCEF) e .CM
//------------------------------------------------------------------------------
//Data      : 05/08/2004
//Autor     : Fabio Fagundes
//Descrição : Retirada do mnuDispFinan (Disponibilidade Antiga)
//            Melhoria no FConsDisponibilidadeMT
//------------------------------------------------------------------------------
//Rotina    :
//Data      : 30/07/2004
//Autor     : Fabio Fagundes
//Descrição : Habilitação do menu mnuAnaliseDisponibilidade
//------------------------------------------------------------------------------

Unit FPrincipal;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCMPrincipal, Menus, ExtCtrls, Buttons, ComCtrls,
   TB97, dbTables, Db, Wwquery, Wwdatsrc, wwdblook, StdCtrls, Mask, wwdbedit,
   DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
   IvMulti, IvEMulti, ppCtrls, CorreioCM, fcLabel, AppEvnts,
   CMApplicationEvents, StdActns, ActnList, ImgList, fcStatusBar, SConnect,
   MConnect, DBClient, uCMClientDataSet, uCmSqlParams, uResource, CMNetUsers,
  wwstorep;

Type
   TfrmPrincipal = Class(TfrmCMPrincipal)
      HistricoPadro1: TMenuItem;
      N3: TMenuItem;
      Banco1: TMenuItem;
      Agncia1: TMenuItem;
      ContasBancriasCaixas1: TMenuItem;
      N4: TMenuItem;
      MontagemdoFluxo1: TMenuItem;
      TipodeAplicao1: TMenuItem;
      Movimentao1: TMenuItem;
      ContaCorrente1: TMenuItem;
      TransfernciaBancria1: TMenuItem;
      EmprstimoBancrio1: TMenuItem;
      ConciliaoBancria1: TMenuItem;
      N5: TMenuItem;
      Fluxo2: TMenuItem;
      Real1: TMenuItem;
      Gerao1: TMenuItem;
      Orado1: TMenuItem;
      N01FluxoPrevisto1: TMenuItem;
      FluxoRealizado1: TMenuItem;
      FluxoOrado2: TMenuItem;
      RegularizaodeLanamentosNoIdentificados1: TMenuItem;
      NoLanados1: TMenuItem;
      JLanados1: TMenuItem;
      N6: TMenuItem;
      N7: TMenuItem;
      TipodeRecebimento1: TMenuItem;
      TipodeDesembolso1: TMenuItem;
      GeraoaPartirdoOramento1: TMenuItem;
      AcertaImposto1: TMenuItem;
      N9: TMenuItem;
      mnuMovFluxoMedioPrazo: TMenuItem;
      N11: TMenuItem;
      SaldoFinanceiro: TMenuItem;
      N12: TMenuItem;
      CadCRxTRecDesemb: TMenuItem;
      N2: TMenuItem;
      N13: TMenuItem;
      mnuConferDocRegular: TMenuItem;
      spAux: TCMSqlParams;
      cdsAux: TCMClientDataSet;
      mnuFluxoOrcadoXRealizado: TMenuItem;
      N1: TMenuItem;
      mnuDisponibilidade: TMenuItem;
      mnuConsDisponibilidade: TMenuItem;
      mnuBloqDisponibilidade: TMenuItem;
      mnuDesfazRegularizacao: TMenuItem;
      mnuConsDisponibilidadeSpc: TMenuItem;
      N8: TMenuItem;
      mnuConsDisponibilidade1: TMenuItem;
      mnuConsDisponibilidade2: TMenuItem;
      Transferencias: TMenuItem;
      MnuExcluirTransf: TMenuItem;
      mnuAcertaMovimentacoes: TMenuItem;
      N14: TMenuItem;
      mnuConsultaContingencia: TMenuItem;
      mnuConsultaOperacionalContingencia: TMenuItem;
      mnuCadGrupoRateioFluxo: TMenuItem;
      N15: TMenuItem;
      mnuConsDisponibilidadeCC: TMenuItem;
      mnuBloqueiosJudiciais: TMenuItem;
      mnuConsBloqueiosDesbloqueiosJudiciais: TMenuItem;
      mnuFluxos: TMenuItem;
      mnuConcTarifBanc: TMenuItem;
      mnuTarifaBancaria: TMenuItem;
    mnuExclusaoDrive: TMenuItem;

      Procedure nmuConfigParametrosClick(Sender: TObject);
      Procedure HistricoPadro1Click(Sender: TObject);
      Procedure AtualizaFluxo1Click(Sender: TObject);
      Procedure Banco1Click(Sender: TObject);
      Procedure Agncia1Click(Sender: TObject);
      Procedure ContasBancriasCaixas1Click(Sender: TObject);
      Procedure ContaCorrente1Click(Sender: TObject);
      Procedure TransfernciaBancria1Click(Sender: TObject);
      Procedure ConciliaoBancria1Click(Sender: TObject);
      Procedure Gerao1Click(Sender: TObject);
      Procedure GeraoapartirdoPrevisto1Click(Sender: TObject);
      Procedure Movimentao4Click(Sender: TObject);
      Procedure MontagemdoFluxo1Click(Sender: TObject);
      Procedure N01FluxoPrevisto1Click(Sender: TObject);
      Procedure FluxoRealizado1Click(Sender: TObject);
      Procedure FluxoOrado2Click(Sender: TObject);
      Procedure NoLanados1Click(Sender: TObject);
      Procedure JLanados1Click(Sender: TObject);
      Procedure mnuUtilitarioClick(Sender: TObject);
      Procedure TipodeRecebimento1Click(Sender: TObject);
      Procedure TipodeDesembolso1Click(Sender: TObject);
      Procedure Movimentao2Click(Sender: TObject);
      Procedure GeraoaPartirdoOramento1Click(Sender: TObject);
      Procedure AcertaImposto1Click(Sender: TObject);
      Procedure GeracaoPartirMedioPrazoClick(Sender: TObject);
      Procedure GeracaoPartirLongoPrazoClick(Sender: TObject);
      Procedure mnuMovFluxoMedioPrazoClick(Sender: TObject);
      Procedure SaldoFinanceiroClick(Sender: TObject);
      Procedure CadCRxTRecDesembClick(Sender: TObject);
      Procedure AppPadraoAfterLogin(Sender: TObject);
      Procedure mnuMontagemClick(Sender: TObject);
      Procedure mnuConsultaDispClick(Sender: TObject);
      Procedure mnuConferDocRegularClick(Sender: TObject);
      Procedure AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; Var Printed: Boolean);
      Procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer; DesReport: TObject; Var Config: Boolean);
      Procedure mnuFluxoOrcadoXRealizadoClick(Sender: TObject);
      Procedure mnuConsDisponibilidadeClick(Sender: TObject);
      Procedure mnuBloqDisponibilidadeClick(Sender: TObject);
      Procedure mnuDesfazRegularizacaoClick(Sender: TObject);
      Procedure AppPadraoCreateFormReports(Sender: TObject);
      Procedure mnuConsDisponibilidadeSpcClick(Sender: TObject);
      Procedure mnuConsDisponibilidade1Click(Sender: TObject);
      Procedure mnuConsDisponibilidade2Click(Sender: TObject);
      Procedure MnuExcluirTransfClick(Sender: TObject);
      Procedure AppPadraoShowParamReportPadrao(sender: TObject;
         IdReports: Integer; Var sParams: String; Var PrintReport: Boolean);
      Procedure mnuAcertaMovimentacoesClick(Sender: TObject);
      Procedure mnuConsultaContingenciaClick(Sender: TObject);
      Procedure mnuConsultaOperacionalContingenciaClick(Sender: TObject);
      Procedure mnuCadGrupoRateioFluxoClick(Sender: TObject);
      Procedure mnuConsDisponibilidadeCCClick(Sender: TObject);
      Procedure mnuBloqueiosJudiciaisClick(Sender: TObject);
      Procedure mnuConsBloqueiosDesbloqueiosJudiciaisClick(Sender: TObject);
      procedure mnuFluxosClick(Sender: TObject);
      procedure mnuConcTarifBancClick(Sender: TObject);
      procedure mnuTarifaBancariaClick(Sender: TObject);
    procedure mnuExclusaoDriveClick(Sender: TObject);

   Private { Private declarations }

   Public { Public declarations }

   End;

Var
   frmPrincipal: TfrmPrincipal;

Implementation
{$R *.DFM}
Uses
   fTelaAut, FCadBanco, fCadAgencia, USistema, UMensErro, DBaseDados,
   FCadContasMT, FCadTipoDesembMT, uDataBase,
   uOrcamento, FCadHistPadraoMT, FCadMontaFluxoMT,
   FCadTiposAplicMT, FCadTRDxCResponMT, FParamFinancMT,
   FMovimFinancMT, FTransfFundosMT, FConcBancariaMT,
   FConfDocRegMT, FRegNIDuplicadosMT, FGeraLgoPrzOrcamMT,
   FConsSaldoFinancMT, FGeraFluxoPrevMT, FGeraFluxoRealMT,
   FMovimFluxoOrcMT, FMultiGerFluxoOrcMT, FGerCurtoPzoPrevMT,
   FMontaDispFinancMT, FDispDivergentesMT, FConsDispFinancMT,
   FConsultaFluxoMT, uCtrlRptCFinan, uCtrlParamIntegra,
   FAcertoImpostoMT, FConsDisponibilidadeMT, FCadDiponibXUsuMT,
   FDesfazRegularizacao, dDemPosFinanc, cDemPosFinanc, FConsDisponibilidadeMTSpc,
   FConsDisponibilidadeMT1, FConsDisponibilidadeMT2, FRelEnvDocContab,
   FExcluiTransf,
   fAcertaLancto,
   FConsDisponibilidadeMT_Novo,
   FConsDisponibilidadeMT2_Novo,
   FCadGrupoRateioFluxo, FConsDisponibilidadeMT_CC,
   FConciliacaoBancariaAtual, fCadBloqueiosJudiciaisFinanc,
   fConsBloqDesbloqJudiciais, FConsultaFluxosNovoMT, uCtrlMontaFluxo,
   fConcTarifaBancaria,//Cássio Rovaroto - SIG nº 81135
   fCadTarifasBancarias,//Cássio Rovaroto - SIG nº 81135
   fExcluiDocumentosDrive; //Everson Cunha

Procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
   FrmMutiltGeracao: TfrmMultiGerFluxoOrcMT;

Begin
   Inherited;
   If Sistema.FezLogin Then
      Begin
         stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

         If Sistema.MudouEmpresa Then
            ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);

         // Verifica se a Atualização Automática de Fluxo está ativada
         cdsAux.Close;
         spAux.SQL.Text := 'SELECT * FROM PARAMFINANC WHERE (IDPESSOA=' + IntToStr(Sistema.idEmpresa) + ' )';
         spAux.Open;
         If Trim(cdsAux.FieldByName('FLGATUALFLX').AsString) = 'S' Then
            Begin
               If MsgDlg('Deseja atualizar o Fluxo de Curto Prazo com o de Médio Prazo ?',
                  'Atenção', mtWarning, [mbYes, mbNo], 0) = mrYES Then
                  Try
                     FrmMutiltGeracao := TfrmMultiGerFluxoOrcMT.Create(Self, 'MCTOT');
                     FrmMutiltGeracao.FormStyle := fsNormal;
                     FrmMutiltGeracao.Visible := false;
                     FrmMutiltGeracao.ShowModal;
                  Finally
                     FreeAndNil(FrmMutiltGeracao);
                  End;
            End;
         cdsAux.Close;
      End;
   MnuConsPart_Padrao.Visible := False;
   Mnu_UsoPessoal_Padrao.Visible := False;
End;

Procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmParamFinancMT, TfrmParamFinancMT, False);
End;

Procedure TfrmPrincipal.HistricoPadro1Click(Sender: TObject);
Begin
   Inherited;
   //Cadastro de Históricos-padrão
   AbrirForm(FrmCadHistPadraoMT, TFrmCadHistPadraoMT, False);
End;

Procedure TfrmPrincipal.AtualizaFluxo1Click(Sender: TObject);
Begin
   Inherited;
   //Geração de Fluxo Previsto
   AbrirForm(frmGeraFluxoPrevMT, TfrmGeraFluxoPrevMT, False);
End;

Procedure TfrmPrincipal.Banco1Click(Sender: TObject);
Begin
   Inherited;
   //Cadstro de bancos
   AbrirForm(frmCadBanco, TfrmCadBanco, False);
End;

Procedure TfrmPrincipal.Agncia1Click(Sender: TObject);
Begin
   Inherited;
   //Cadastro de Agências
   AbrirForm(frmCadAgencia, TfrmCadAgencia, False);
End;

Procedure TfrmPrincipal.ContasBancriasCaixas1Click(Sender: TObject);
Begin
   Inherited;
   //Cadastro de Contas
   AbrirForm(frmCadContasMT, TfrmCadContasMT, False);
End;

Procedure TfrmPrincipal.ContaCorrente1Click(Sender: TObject);
Begin
   Inherited;
   With TfrmMovimFinancMT.Create(Self, False) Do Show;
End;

Procedure TfrmPrincipal.TransfernciaBancria1Click(Sender: TObject);
Begin
   Inherited;
   //Transferência Bancária
   AbrirForm(frmTransfFundosMT, TfrmTransfFundosMT, False);
End;

Procedure TfrmPrincipal.ConciliaoBancria1Click(Sender: TObject);
Begin
   Inherited;
   // Sol  31714_38358  Kintana 523349_523362 - Paulo Nobre
   // Nova Conciliação Bancária
   AbrirForm(frmConciliacaoBancariaAtual, TfrmConciliacaoBancariaAtual, False);
   //  AbrirForm(frmConcBancariaMT,TfrmConcBancariaMT,False);
End;

Procedure TfrmPrincipal.Gerao1Click(Sender: TObject);
Begin
   Inherited;
   //Geração de Fluxo Real
   AbrirForm(frmGeraFluxoRealMT, TfrmGeraFluxoRealMT, False);
End;

Procedure TfrmPrincipal.GeraoapartirdoPrevisto1Click(Sender: TObject);
Begin
   Inherited;
   //Geração de Fluxo Orçado de Curto Prazo a partir do Previsto
   AbrirForm(frmGerCurtoPzoPrevMT, TfrmGerCurtoPzoPrevMT, False);
End;

Procedure TfrmPrincipal.Movimentao4Click(Sender: TObject);
Begin
   Inherited;
   //Movimentação de Fluxo Orçado de Curto Prazo
   With TfrmMovimFluxoOrcMT.Create(Self, 'C') Do Show;
End;

Procedure TfrmPrincipal.mnuMovFluxoMedioPrazoClick(Sender: TObject);
Begin
   Inherited;
   //Movimentação de Fluxo Orçado de Médio Prazo
   With TfrmMovimFluxoOrcMT.Create(Self, 'M') Do Show;
End;

Procedure TfrmPrincipal.Movimentao2Click(Sender: TObject);
Begin
   Inherited;
   //Movimentação de Fluxo Orçado de Longo Prazo
   With TfrmMovimFluxoOrcMT.Create(Self, 'L') Do Show;
End;

Procedure TfrmPrincipal.MontagemdoFluxo1Click(Sender: TObject);
Begin
   Inherited;
   //Cadastro de Montagem de Fluxo de Caixa
   AbrirForm(FrmCadMontaFluxoMT, TFrmCadMontaFluxoMT, False);
End;

Procedure TfrmPrincipal.N01FluxoPrevisto1Click(Sender: TObject);
Begin
   Inherited;
   //Consulta Fluxo Previsto
   {With TfrmConsultaFluxoMT.Create(Self, 'P') Do Show;}            // edilaine - SOL 136203 / KTN 813205 - comentado
End;

Procedure TfrmPrincipal.FluxoRealizado1Click(Sender: TObject);
Begin
   Inherited;
   //Consulta Fluxo Realizado
   {With TfrmConsultaFluxoMT.Create(Self, 'R') Do Show;}            // edilaine - SOL 136203 / KTN 813205 - comentado
End;

Procedure TfrmPrincipal.FluxoOrado2Click(Sender: TObject);
Begin
   Inherited;
   //Consulta Fluxo Orçado
   {With TfrmConsultaFluxoMT.Create(Self, 'O') Do Show;}            // edilaine - SOL 136203 / KTN 813205 - comentado
End;

Procedure TfrmPrincipal.mnuFluxoOrcadoXRealizadoClick(Sender: TObject);
Begin
   Inherited;
   //Consulta Fluxo Comparativo - Orçado x Realizado
   {With TfrmConsultaFluxoMT.Create(Self, 'OXR') Do Show;}          // edilaine - SOL 136203 / KTN 813205 - comentado
End;

Procedure TfrmPrincipal.NoLanados1Click(Sender: TObject);
Begin
   Inherited;
   //Regularização de Documentos Exclusiva do Financeiro
   With TfrmMovimFinancMT.Create(Self, True) Do Show;
End;

Procedure TfrmPrincipal.JLanados1Click(Sender: TObject);
Begin
   Inherited;
   //Regularização de Lançamentos não Identificados do CAP/CAR
   AbrirForm(frmRegNIDuplicadosMT, TfrmRegNIDuplicadosMT, False);
End;

Procedure TfrmPrincipal.mnuUtilitarioClick(Sender: TObject);
Begin
   Inherited;
   //AbrirForm(frmExcluiPgto,TfrmExcluiPgto,False);
End;

Procedure TfrmPrincipal.TipodeRecebimento1Click(Sender: TObject);
Begin
   Inherited;
   //Cadastro de Recebimentos
   With TfrmCadTipoDesembMT.Create(Self, 'R') Do Show;
End;

Procedure TfrmPrincipal.TipodeDesembolso1Click(Sender: TObject);
Begin
   Inherited;
   //Cadastro de Pagamentos
   With TfrmCadTipoDesembMT.Create(Self, 'P') Do Show;
End;

Procedure TfrmPrincipal.GeraoaPartirdoOramento1Click(Sender: TObject);
Begin
   Inherited;
   //Geração do Fluco Orçado de Longo Prazo a partir do Orçamento
   AbrirForm(frmGeraLgoPrzOrcamMT, TfrmGeraLgoPrzOrcamMT, False);
End;

Procedure TfrmPrincipal.AcertaImposto1Click(Sender: TObject);
Begin
   Inherited;
   //Acerto de Imposto
   AbrirForm(frmAcertoImpostoMT, TfrmAcertoImpostoMT, False);
End;

Procedure TfrmPrincipal.GeracaoPartirMedioPrazoClick(Sender: TObject);
Begin
   Inherited;
   //Geração de Fluxo Orçado de Curto Prazo a Partir do Orçado de Médio Prazo
   With TfrmMultiGerFluxoOrcMT.Create(Self, 'MC') Do Show;
End;

Procedure TfrmPrincipal.GeracaoPartirLongoPrazoClick(Sender: TObject);
Begin
   Inherited;
   //Geração de Fluxo Orçado de Médio Prazo a Partir do Orçado de Longo Prazo
   With TfrmMultiGerFluxoOrcMT.Create(Self, 'LM') Do Show;
End;

Procedure TfrmPrincipal.SaldoFinanceiroClick(Sender: TObject);
Begin
   Inherited;
   //Consulta Saldo Financeiro
   AbrirForm(frmConsSaldoFinancMT, TfrmConsSaldoFinancMT, False);
End;

Procedure TfrmPrincipal.CadCRxTRecDesembClick(Sender: TObject);
Begin
   Inherited;
   //Cadastro de Tipos de REC/DES x Centro de Responsabilidade
   AbrirForm(FrmCadTRDxCResponMT, TFrmCadTRDxCResponMT, False)
End;

Procedure TfrmPrincipal.mnuMontagemClick(Sender: TObject);
Begin
   Inherited;
   //Montagem da Disponibilidade Financeira
   AbrirForm(frmMontaDispFinancMT, TfrmMontaDispFinancMT, False);
End;

Procedure TfrmPrincipal.mnuConsultaDispClick(Sender: TObject);
Begin
   Inherited;
   //Consulta da Disponibilidade Financeira
   AbrirForm(frmConsDispFinancMT, TfrmConsDispFinancMT, False);
End;

Procedure TfrmPrincipal.mnuConferDocRegularClick(Sender: TObject);
Begin
   //Conferência de Documentos Regularizados
   AbrirForm(frmConfDocRegMT, TfrmConfDocRegMT, False);
End;

Procedure TfrmPrincipal.mnuConsDisponibilidadeClick(Sender: TObject);
Begin
   AbrirForm(frmConsDisponibilidadeMT, TfrmConsDisponibilidadeMT, False);
End;

Procedure TfrmPrincipal.mnuConsDisponibilidade2Click(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmConsDisponibilidadeMT2, TfrmConsDisponibilidadeMT2, False);
End;

Procedure TfrmPrincipal.mnuBloqDisponibilidadeClick(Sender: TObject);
Begin
   //Bloqueia Disponibilidade FUNCEF
   AbrirForm(frmCadDisponibXUsuMT, TfrmCadDisponibXUsuMT, False);
End;

Procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; Var Printed: Boolean);
Var
   CtrlRptCFinan: TCtrlRptCFinan;
Begin
   Inherited;
   CtrlRptCFinan := TCtrlRptCFinan.Create;
   Try
      Printed := Self.ShowReport(IDReports, CtrlRptCFinan);
      CtrlRptCFinan.Free;
   Except
      CtrlRptCFinan.Free;
      Raise;
   End;
End;

Procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer; DesReport: TObject; Var Config: Boolean);
Var
   CtrlRptCFinan: TCtrlRptCFinan;
Begin
   Inherited;
   CtrlRptCFinan := TCtrlRptCFinan.Create;
   Try
      Config := ConfigReport(liIdReports, liOrigemCm, CtrlRptCFinan, DesReport);
      CtrlRptCFinan.Free;
   Except
      CtrlRptCFinan.Free;
      Raise;
   End;
End;

Procedure TfrmPrincipal.mnuDesfazRegularizacaoClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmDesfazRegularizacao, TfrmDesfazRegularizacao, False);
End;

Procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
Begin
   Inherited;
   Application.CreateForm(TdtmDemPosFinanc, dtmDemPosFinanc);
End;

Procedure TfrmPrincipal.mnuConsDisponibilidadeSpcClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmConsDisponibilidadeMTSpc, TfrmConsDisponibilidadeMTSpc, False);
End;

Procedure TfrmPrincipal.mnuConsDisponibilidade1Click(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmConsDisponibilidadeMT1, TfrmConsDisponibilidadeMT1, False);
End;

Procedure TfrmPrincipal.MnuExcluirTransfClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmExcluiTransf, TfrmExcluiTransf, False);
End;

Procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
   IdReports: Integer; Var sParams: String; Var PrintReport: Boolean);
Begin
   Case IdReports Of
      20357: FrmPreviewReports := TfrmParamRelatEnvDocContab.create(self);
   Else
      FrmPreviewReports := Nil;
   End;
   Inherited;
End;

Procedure TfrmPrincipal.mnuAcertaMovimentacoesClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmAcertaLancto, TFrmAcertaLancto, False);
End;

Procedure TfrmPrincipal.mnuConsultaContingenciaClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmConsDisponibilidadeMT_Novo, TfrmConsDisponibilidadeMT_Novo, False);
End;

Procedure TfrmPrincipal.mnuConsultaOperacionalContingenciaClick(Sender: TObject);
Begin
   Inherited;
   AbrirForm(frmConsDisponibilidadeMT2_Novo, TfrmConsDisponibilidadeMT2_Novo, False);
End;

Procedure TfrmPrincipal.mnuCadGrupoRateioFluxoClick(Sender: TObject);
Begin
   Inherited;
   // Alterado por FHBS - SOL: 128685 KTN: 692049
   AbrirForm(FrmCadGrupoRateioFluxo, TFrmCadGrupoRateioFluxo, False);
End;

Procedure TfrmPrincipal.mnuConsDisponibilidadeCCClick(Sender: TObject);
Begin
   Inherited;
   // Alterado por FHBS - SOL: 138463 KTN: 843717
   AbrirForm(frmConsDisponibilidadeMT_CC, TfrmConsDisponibilidadeMT_CC, False);
End;

Procedure TfrmPrincipal.mnuBloqueiosJudiciaisClick(Sender: TObject);
Begin
   Inherited;
   // Sol  31714_38358  Kintana 523349_523362 - Paulo Nobre
   // Bloqueios Judiciais
   frmCadBloqueiosJudiciaisFinanc := TfrmCadBloqueiosJudiciaisFinanc.create(self);
   frmCadBloqueiosJudiciaisFinanc.iCodPortador := -1;
   frmCadBloqueiosJudiciaisFinanc.ShowModal;
End;

Procedure TfrmPrincipal.mnuConsBloqueiosDesbloqueiosJudiciaisClick(Sender: TObject);
Begin
   Inherited;
   // Sol  207968  Kintana 2040576 - Paulo Nobre
   // Bloqueios Judiciais
   frmConsBloqDesbloqJudiciais := TfrmConsBloqDesbloqJudiciais.create(self);
   frmConsBloqDesbloqJudiciais.ShowModal;
End;

procedure TfrmPrincipal.mnuFluxosClick(Sender: TObject);
begin
  // edilaine - SOL 136203 / KTN 813205
  inherited;
  AbrirForm(frmConsultaFluxosNovoMT, TfrmConsultaFluxosNovoMT, False);
end;

procedure TfrmPrincipal.mnuConcTarifBancClick(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 81135
  AbrirForm(frmConcTarifaBancaria, TfrmConcTarifaBancaria, False);
end;

procedure TfrmPrincipal.mnuTarifaBancariaClick(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 81135
  AbrirForm(frmCadTarifaBancaria, TfrmCadTarifaBancaria, False);
end;

procedure TfrmPrincipal.mnuExclusaoDriveClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExcluiDocumentosDrive, TfrmExcluiDocumentosDrive, False); //Everson Cunha - SIG128734
end;

Initialization

   Sistema.NomeModulo := 'Controle Financeiro'; // Nome do Módulo
   Sistema.IdModulo := 9; // IdModulo cadastrado no SAD
   Sistema.Versao := '3.10.19i';
   Sistema.NomeAplicativo := 'Controle Financeiro';
   OrcamentoBack := TOrcamentoBack.Create;

Finalization

End.

