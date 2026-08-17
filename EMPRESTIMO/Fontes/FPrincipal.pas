unit FPrincipal;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
Rotina      : (dfm)
Pendência   : WO15681
Responsável : Leandro Pocebon
Data        : 25/10/2024
Descrição   : Criação de form para cadastro mensagem para contrato.
//------------------------------------------------------------------------------
Pendência   : SIG113126
Responsável : Ewerton Beltramini
Data        : 05/11/2021
Descrição   : Criação de form para importação de dados dos informes IR.
//------------------------------------------------------------------------------
//***************************************************************************************
//Rotina             :
//N. SIG..........   : 64071
//Data da Alteração: : 16/4/2018
//Alteração Form:    : FPrincipal
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Inclusão do item de menu Remessa Eletrônica, e inibição do item
//                     "Geração de Arqiuvo para Banco".
//***************************************************************************************
Pendência   : SIG95372
Responsável : Ewerton Beltramini
Data        : 28/04/2020
Descrição   : Criação de form para importação de dados do SICOV. Criação de menu.
              (Emprestimo).
//------------------------------------------------------------------------------
Pendência   : SIG95096
Responsável : Ewerton Beltramini
Data        : 18/02/2020
Descrição   : Criação de form para atualização em lote das datas de vencimento
              (Emprestimo).
//------------------------------------------------------------------------------
Pendência   : SIG82692
Responsável : Ewerton Beltramini
Data        : 21/11/2019
Descrição   : Criação de form para importação de dados de IR de financiamento Habitacional.
//------------------------------------------------------------------------------
Alterações  : mnuTransferePerfil
Pendência   : SIG56660
Responsável : Edilaine
Data        : 22/11/2017
Descrição   : Transfere de Perfil de Investimentos na contabilização de contratos
--------------------------------------------------------------------------------
//Nº SOL.............: 258330/17859
//Nº PPM.............: 1132081
//Data da Alteração..: 10/11/2015
//Responsável........: Felipe A. Santos
//Descrição..........: Inclusão do menu Tratamentos -> Restrição de Cobranças
//------------------------------------------------------------------------------
//Nº SOL.............: 253185
//Nº PPM.............: 771995
//Data da Alteração..: 08/12/2014
//Responsável........: Wylliam Leite da Silva
//Descrição..........: Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
//------------------------------------------------------------------------------
//Nº SOL.............: 219116/16182
//Nº PPM.............: 422309
//Data da Alteração..: 08/12/2014
//Alteração Form.....: Criação do Formulário
//Responsável........: William Santana
//Descrição..........: Criação da Funcionalidade
//------------------------------------------------------------------------------
//Pendência   : SOL 210109/15462 Kintana 2053936
//Responsável : Higor Nayde Ferreira
//Data        : 03/10/2014
//Descrição   : Criar formulário para motivo de bloqueio e adequar cadastro de bloqueio
//------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------
Autor(a)    : TADEU PASSOS
Data        : 23/08/2013
Pendência   : SOL 178225 KINTANA 1638799
Descrição   : Criação da funcionalidade Consultas/Relatórios Especiais/
              Relatório de Inadimplência
------------------------------------------------------------------------------
------------------------------------------------------------------------------
Autor(a)    : FELIPE SANTOS
Data        : 21/02/2013
Pendência   : SOL 179255/11104 KINTANA 1772792
Descrição   : Criação da funcionalidade Tratamentos/Processar Eventos de
              Cobrança.
------------------------------------------------------------------------------
------------------------------------------------------------------------------
Autor(a)    : TADEU PASSOS
Data        : 12/11/2012
Pendência   : SOL 182258 KINTANA 1697187
Descrição   : Criação do menu para "Pagamento de Empréstimo com Resgate" e
              "Recebimento de Empréstimo com Resgate"
------------------------------------------------------------------------------
------------------------------------------------------------------------------
Autor(a)   : Marcio Sanches Spinosa
Data       : 16/05/2012
Pendência  : SOL 168737 Kintana 1491532
Descricao  : Criação do menu para chamada de tratamentos de excesso de débitos.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Autor(a)   : Eraldo Silva
Data       : 29/02/2012
Pendência  : SOL 175120 Kintana 15940219
Descricao  : CONSULTA GERAL PESSOA Ao consultar alguma matricula no Consulta Geral de
             Pessoa o sistema fecha a tela automaticamente.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 164198 KINTANA 1409417
Data        : 07/02/2012
Autor       : Vinicius Ferreira
Descrição   : Criação de Funcionalidade para bloqueio de concessões por plano previdenciário.
--------------------------------------------------------------------------------
Responsável : Leandro S. Costa
SOL         : 162548
Kintana     : 1381842
Data        : 08/08/2011
Descrição   : Alterado o Caption do Menu: Tratamentos --> "Tratamento Parcelas em Atraso"
              para "Tratamento de Parcelas em Atraso"
--------------------------------------------------------------------------------
Pendência   : SOL 161249 Kintana 1358314
Responsável : Fanuel Junior
Data        : 02/08/2010
Descrição   : Criação da tela Tratamento Parcelas em Atraso
--------------------------------------------------------------------------------
Pendência   : SOL 161785 KINTANA 1368593
Responsável : Fanuel Junior
Data        : 21/07/2011
Descrição   : Alteração do caption do menu "Financiamento Habitacional" para
              "Consulta Quitação Financiamento Habitacional"
--------------------------------------------------------------------------------
Pendência   : SOL 147326 KINTANA 1017034
Responsável : BRUNO AZEVEDO
Data        : 09/11/2010
Descrição   : Alteração do caption do menu "Bloqueio de Concessão".
--------------------------------------------------------------------------------
Pendência   : SOL 136411 - KINTANA - 815862
Responsável : MARCELO ALMEIDA
Data        : 14/09/2010
Descrição   : Desbloqueio de mutuarios - Inclusão do menu.
--------------------------------------------------------------------------------
Pendência   : SOL 92995 KINTANA 569455
Responsável : BRUNO AZEVEDO
Data        : 13/09/2010
Descrição   : Criação da funcionalidade "Ajuste na forma de envio".
--------------------------------------------------------------------------------
Pendência   : SOL 138233 Kintana 843723
Responsável : Ádler Souza / Bruno Azevedo
Data        : 30/09/2010
Descrição   : Criação do relatório "Saldo Residual"
--------------------------------------------------------------------------------
Pendência   : SOL 138239 KTN 843847
Responsável : Ádler Souza
Data        : 08/09/2010
Descrição   : Criação de funcionalidade para inserção de dados na tabela
              CARGA.CONTRATOAD
--------------------------------------------------------------------------------
Pendência   : SOL 138232 Kintana 843720
Responsável : BRUNO AZEVEDO
Data        : 08/09/2010
Descrição   : Criação do relatório "Empréstimos Quitados"
--------------------------------------------------------------------------------
Pendência   : SOL 138228 Kintana 843767
Responsável : BRUNO AZEVEDO
Data        : 08/09/2010
Descrição   : Criação do relatório "Evolução de contrato"
--------------------------------------------------------------------------------
Pendência   : SOL 132155 KINTANA 759634
Responsável : BRUNO AZEVEDO
Data        : 22/07/2010
Descrição   : Criação do Histórico de Alterações. Alteração no nome da Func.
--------------------------------------------------------------------------------
Pendência   : SOL1 43059 KINTANA 923051
Responsável : Fanuel Marinho
Data        : 01/09/2010
Descrição   : Alteração do caption do menu "Bloqueio de Concessão"
--------------------------------------------------------------------------------
Pendência   : SOL 134670 Kintana 796612
Responsável : Renato Visoni
Descrição   :Criação da tela 'Valor Maximo Prestação Participante'
--------------------------------------------------------------------------------
Pendência   : SOL 92697 KINTANA 409486
Responsável : Renato Visoni
Data        : 23/09/2009
Descrição   : Criação da funcionalidade Quitação em Lote
--------------------------------------------------------------------------------
Pendência   : SOL 103239 KINTANA 468105
Responsável : Renato Visoni
Data        : 16/03/2009
Descrição   : Criação do Relatorio "2ª via de contra-cheque"
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA

//	-------------------------------------------------------------------------------------------------
//
//	Principal (frmMDIMain)
//
//	Modificações   :  20/08/2001  1) Estrutura de procedimentos e funções totalmente refeita
//
// -------------------------------------------------------------------------------------------------

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons,  ComCtrls,
   FTelaAut, UAutorizacao, TB97, wwquery, Db,
   Wwdatsrc, DBTables, wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls,
   TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic, IvMulti,
   IvEMulti, CorreioCM, fcLabel, AppEvnts, CMApplicationEvents, StdActns,
   ActnList, ImgList, fcStatusBar, SConnect, MConnect, DBClient,
   Wwtable, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppComm, ppRelatv,
   ppProd, ppReport, UConsPart, uResource, Grids, Wwdbigrd, Wwdbgrid,
   DBGrids, CMNetUsers, wwstorep;

type
   TfrmPrincipal = class(TfrmCMPrincipal)
      mnuCadTipoEmptmo: TMenuItem;
      mnuCadTipoContrato: TMenuItem;
      mnuCadItemEmptmo: TMenuItem;
      mnuCicloNormal: TMenuItem;
      mnuExecInscricao: TMenuItem;
      mnuCadItemXTipoContrato: TMenuItem;
      mnuExecQuita: TMenuItem;
      mnuTransacao: TMenuItem;
      mnuExecEnvio: TMenuItem;
      mnuExecTrataDivergencia: TMenuItem;
      mnuCadMotivo: TMenuItem;
      N8: TMenuItem;
      mnuCadDataPatro: TMenuItem;
      mnuCadVerba: TMenuItem;
      mnuCadParam: TMenuItem;
      mnuExecConcessaoAuto: TMenuItem;
      mnuExecTrataParcela: TMenuItem;
      mnuCancQuita: TMenuItem;
      mnuExecGeraParcela: TMenuItem;
      N1: TMenuItem;
      N2: TMenuItem;
      mnuCadSeguradora: TMenuItem;
      mnuCadBenefSeguro: TMenuItem;
      mnuCadAvalista: TMenuItem;
      mnuCadPlanPrevXContabil: TMenuItem;
      N13: TMenuItem;
      mnuConsPlanoConta: TMenuItem;
      Image1: TImage;
      mnuExecAmortiza: TMenuItem;
      mnuCancAmortiza: TMenuItem;
      mnuExecRecebimento: TMenuItem;
      mnuUtilVerificaMenu: TMenuItem;
      N16: TMenuItem;
      mnuConsContratoParcela: TMenuItem;
      mnuCancGeraParcela: TMenuItem;
      mnuCancEnvio: TMenuItem;
      mnuTratamento: TMenuItem;
      N7: TMenuItem;
      N4: TMenuItem;
      N5: TMenuItem;
      N6: TMenuItem;
      N9: TMenuItem;
      mnuCancConcessao: TMenuItem;
      N3: TMenuItem;
      N11: TMenuItem;
      mnuExecAlteraContrato: TMenuItem;
      mnuConsRecebePatro: TMenuItem;
      mnuCadParamIntegra: TMenuItem;
      mnuCadRecebPatro: TMenuItem;
      N14: TMenuItem;
      mnuCancInscricao: TMenuItem;
      mnuExecFechaPatro: TMenuItem;
      N15: TMenuItem;
      mnuExecCalcDia: TMenuItem;
      mnuConfCarteiraSaldo: TMenuItem;
      mnuConferencia: TMenuItem;
      mnuConfCarteiraCaixa: TMenuItem;
      N19: TMenuItem;
      mnuConfEnvio: TMenuItem;
      N20: TMenuItem;
      mnuCancRecebimento: TMenuItem;
      mnuUtilAcertaSequence: TMenuItem;
      N17: TMenuItem;
      mnuCadTipoSuspensao: TMenuItem;
      mnuTipoSuspXTipoContr: TMenuItem;
      mnuLiberaSuspensao: TMenuItem;
      N18: TMenuItem;
      mnuExecAlteraConcessao: TMenuItem;
      N21: TMenuItem;
      mnuSuspensaoConcessao: TMenuItem;
      mnuContratoPadrao: TMenuItem;
      mnuAssinaturaContrato: TMenuItem;
      btnCancelaResgate: TToolbarButton97;
      btnResgate: TToolbarButton97;
      ToolbarSep971: TToolbarSep97;
      mnuHistoricoSuspensao: TMenuItem;
      mnuExecEntradaManual: TMenuItem;
      N23: TMenuItem;
      mnuExecLancaAlteradorEP: TMenuItem;
      mnuExecTrataItemNaoRecebido: TMenuItem;
      mnuExecContabilizaLoteConcessao: TMenuItem;
      mnuExecDevolucaoLote: TMenuItem;
      EMPConcedidos: TppReport;
      EMPRenovados: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLine1: TppLine;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppFooterBand2: TppFooterBand;
      ppLabel3: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      N24: TMenuItem;
      mnuConsLogTotalPrev: TMenuItem;
      N25: TMenuItem;
      mnuConsTMPDESC: TMenuItem;
      mnuExecContabilizaLoteQuitacao: TMenuItem;
      mnuCalculoRepasseSeguro: TMenuItem;
      mnuLancaDepositoSeguro: TMenuItem;
      mnuContabilizacao: TMenuItem;
      mnuExecContabilizaLoteAmortizacao: TMenuItem;
      N28: TMenuItem;
      N29: TMenuItem;
      N30: TMenuItem;
      N31: TMenuItem;
      qryContratos: TwwQuery;
      qryUpdateSituacao: TwwQuery;
      qryContratosIDCONTRATOEMPTMO: TFloatField;
      qryContratosFLGSITUACAO: TStringField;
      N32: TMenuItem;
      mnuExecContabilizaLotePrestacao: TMenuItem;
      N33: TMenuItem;
      mnuExecContabilizaLoteEncargos: TMenuItem;
      N34: TMenuItem;
      mnuVerbasPlano: TMenuItem;
      mnuExecCadVerbaPlano: TMenuItem;
      mnuExecTipoContrXPlano: TMenuItem;
      mnuExecCadUnidCentr: TMenuItem;
      mnuExecCadUnidPlano: TMenuItem;
      mnuCartaCobranca: TMenuItem;
      mnuCadCartaCobranca: TMenuItem;
      mnuRelCartaCobranca: TMenuItem;
      N36: TMenuItem;
      mnuCadBancoXPortadorForma: TMenuItem;
      N37: TMenuItem;
      mnuExecEnvioLoteConcessao: TMenuItem;
      mnuExecGeraArquivoBanco: TMenuItem;
      ToolbarSep972: TToolbarSep97;
      btnREFER: TToolbarButton97;
      mnuCancEnvioLoteConcessao: TMenuItem;
      mnuCancContabilizaLoteConcessao: TMenuItem;
      mnuCancContabilizaLotePrestacao: TMenuItem;
      mnuCancContabilizaLoteAmortizacao: TMenuItem;
      mnuCancContabilizaLoteQuitacao: TMenuItem;
      mnuCancContabilizaLoteEncargos: TMenuItem;
      mnuExecLiberaConcessao: TMenuItem;
      mnuExecCalculaSeg: TMenuItem;
      mnuExecEnvioSeguro: TMenuItem;
      mnuCadTipoContrXQuit: TMenuItem;
      N39: TMenuItem;
      mnuExecContabilizaLoteAtuDia: TMenuItem;
      mnuCancContabilizaLoteAtuDia: TMenuItem;
      mnuExecEstornoIndividual: TMenuItem;
      mnuExecTrataInesperado: TMenuItem;
      N40: TMenuItem;
      mnuExecAcertaSituacao: TMenuItem;
      N41: TMenuItem;
      mnuExecContabilizaAjusteDia: TMenuItem;
      mnuCancContabilizaAjusteDia: TMenuItem;
      N42: TMenuItem;
      mnuExecArqSuspensao: TMenuItem;
      N44: TMenuItem;
      N45: TMenuItem;
      mnuExecArquivoCritica: TMenuItem;
      mnuArquivoTexto: TMenuItem;
      N10: TMenuItem;
      Seguro1: TMenuItem;
      N26: TMenuItem;
      N12: TMenuItem;
      N22: TMenuItem;
      mnuExecLerSIAFI: TMenuItem;
      mnuExecGravarSIAFI: TMenuItem;
      btnQuitaMorte: TToolbarButton97;
      mnuExecArquivoInadimplente: TMenuItem;
      mnuExecArquivoSeguradora: TMenuItem;
      N27: TMenuItem;
      mnuExecGeraArquivoMargem13: TMenuItem;
      N46: TMenuItem;
      N47: TMenuItem;
      N43: TMenuItem;
      mnuExecLancParcAtu: TMenuItem;
      N48: TMenuItem;
      mnuRelEspeciais: TMenuItem;
      N49: TMenuItem;
      sepRelEspFUNCEF: TMenuItem;
      mnuRelProvPerdaFUNCEFSint: TMenuItem;
      mnuRelProvPerdaFUNCEFAnal: TMenuItem;
      sepRelEspOutros: TMenuItem;
      mnuRelProvPerdaOutrosAnal: TMenuItem;
      mnuRelProvPerdaOutrosSint: TMenuItem;
      N35: TMenuItem;
      mnuExecCalculaValorMaximo: TMenuItem;
      mnuExecCalculaValorDevido: TMenuItem;
      mnuCancAlteraConcessao: TMenuItem;
      mnuItemXProcesso: TMenuItem;
      N38: TMenuItem;
      N50: TMenuItem;
      ValorAtualizadoporContrato1: TMenuItem;
      mnuCancEnvioSeguro: TMenuItem;
      N51: TMenuItem;
      N52: TMenuItem;
      mnuPortFormaxEmptmo: TMenuItem;
    mnuQuitaoemLote: TMenuItem;
    mnuValorMaximodePrestaoporParticipante: TMenuItem;
    mnuEventosCobrancas: TMenuItem;
    mnuHistoricoEventoCobranca: TMenuItem;
    N53: TMenuItem;
    mnuProvisoparaPerdas: TMenuItem;
    mnuRelEvolucaoContrato: TMenuItem;
    mnuRelEmprestimosQuitados: TMenuItem;
    mnuSaldoResidual: TMenuItem;
    mnuManutenodoArquivoContratoad: TMenuItem;
    mnuAjusteFormaEnvio: TMenuItem;
    mnuFinanciamentoHabitacional: TMenuItem;
    mnuMapaMovimentao: TMenuItem;
    N54: TMenuItem;
    mnuExecTrataParcAtraso: TMenuItem;
    mnuBloqConcPlanPrev: TMenuItem;
    mnuTratamentodeExcessodeDbito: TMenuItem;
    N55: TMenuItem;
    // TADEU SOL 182258 KINTANA 1697187
	N56: TMenuItem;
    mnuPagamentoEmprestimoResgate: TMenuItem;
    mnuRecebimentoEmprestimoResgate: TMenuItem;
    N57: TMenuItem;
    mnuProcessaEventosCobranca: TMenuItem;
    mnuRelatrioInadimplencia: TMenuItem;
    mnuMotivodeBloqueiodeConcesso: TMenuItem;
    mnuAdicionarInforEventosCobranca: TMenuItem;

    // TADEU SOL 182258 KINTANA 1697187
    // Felipe A. Santos SOL 258330/17859 PPM 1132081 {fim mnuRestrCob}
    mnuRestrCob: TMenuItem;
    mnuTransferePerfil: TMenuItem;
    mnuRemessaEletronica: TMenuItem;
    mnuImportacaoIrFinancHabitacional: TMenuItem;
    mnuAlteraoEmLotedaDatadeVencimento: TMenuItem;
    mnuImportaodoArquivoeGeraodoRelatrioSICOV: TMenuItem;
    N58: TMenuItem;
    mmuImportaodoInformedeIR1: TMenuItem;
    mnuCadMensagemContrato: TMenuItem;
      // procedimentos e funcoes especiais
      procedure AppPadraoAfterLogin(Sender: TObject);
      procedure AppPadraoCreateFormReports(Sender: TObject);

      // outros procedimentos e funcoes
      procedure mnuCadTipoEmptmoClick(Sender: TObject);
      procedure mnuCadTipoContratoClick(Sender: TObject);
      procedure mnuCadItemEmptmoClick(Sender: TObject);
      procedure mnuExecInscricaoClick(Sender: TObject);
      procedure mnuCadItemXTipoContratoClick(Sender: TObject);
      procedure nmuConfigParametrosClick(Sender: TObject);
      procedure mnuCadDataPatroClick(Sender: TObject);
      procedure mnuCadVerbaClick(Sender: TObject);
      procedure mnuExecGeraParcelaClick(Sender: TObject);
      procedure mnuCadPlanPrevXContabilClick(Sender: TObject);
      procedure mnuConsPlanoContaClick(Sender: TObject);
      procedure mnuUtilVerificaMenuClick(Sender: TObject);
      procedure mnuExecQuitaClick(Sender: TObject);
      procedure mnuConsContratoParcelaClick(Sender: TObject);
      procedure mnuExecEnvioClick(Sender: TObject);
      procedure mnuCancQuitaClick(Sender: TObject);
      procedure mnuCancGeraParcelaClick(Sender: TObject);
      procedure Mnu_UsoPessoal_PadraoClick(Sender: TObject);
      procedure MnuConsPart_PadraoClick(Sender: TObject);
      procedure mnuCancConcessaoClick(Sender: TObject);
      procedure mnuCancEnvioClick(Sender: TObject);
      procedure mnuExecRecebimentoClick(Sender: TObject);
      procedure mnuExecAmortizaClick(Sender: TObject);
      procedure mnuCancAmortizaClick(Sender: TObject);
      procedure mnuExecTrataDivergenciaClick(Sender: TObject);
      procedure mnuExecTrataParcelaClick(Sender: TObject);
      procedure mnuExecAlteraContratoClick(Sender: TObject);
      procedure mnuCadAvalistaClick(Sender: TObject);
      procedure mnuCadSeguradoraClick(Sender: TObject);
  		procedure mnuCadParamIntegraClick(Sender: TObject);
      procedure mnuCadRecebPatroClick(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure mnuCancInscricaoClick(Sender: TObject);
      procedure mnuConsRecebePatroClick(Sender: TObject);
      procedure mnuExecCalcDiaClick(Sender: TObject);
      procedure mnuCancRecebimentoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure mnuUtilAcertaSequenceClick(Sender: TObject);
      procedure mnuCadTipoSuspensaoClick(Sender: TObject);
      procedure mnuTipoSuspXTipoContrClick(Sender: TObject);
      procedure mnuLiberaSuspensaoClick(Sender: TObject);
      procedure mnuExecAlteraConcessaoClick(Sender: TObject);
      procedure mnuSuspensaoConcessaoClick(Sender: TObject);
      procedure mnuContratoPadraoClick(Sender: TObject);
      procedure mnuAssinaturaContratoClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnResgateClick(Sender: TObject);
      procedure btnCancelaResgateClick(Sender: TObject);
      procedure mnuHistoricoSuspensaoClick(Sender: TObject);
      procedure mnuExecEntradaManualClick(Sender: TObject);
      procedure mnuExecLancaAlteradorEPClick(Sender: TObject);
      procedure mnuExecTrataItemNaoRecebidoClick(Sender: TObject);
      procedure mnuExecContabilizaLoteConcessaoClick(Sender: TObject);
      procedure mnuExecDevolucaoLoteClick(Sender: TObject);
      procedure mnuConsLogTotalPrevClick(Sender: TObject);
      procedure mnuConsTMPDESCClick(Sender: TObject);
      procedure mnuExecContabilizaLoteQuitacaoClick(Sender: TObject);
      procedure mnuCalculoRepasseSeguroClick(Sender: TObject);
      procedure mnuLancaDepositoSeguroClick(Sender: TObject);
      procedure mnuExecContabilizaLoteAmortizacaoClick(Sender: TObject);
      procedure mnuExecContabilizaLotePrestacaoClick(Sender: TObject);
      procedure mnuExecContabilizaLoteEncargosClick(Sender: TObject);
      procedure mnuExecCadVerbaPlanoClick(Sender: TObject);
      procedure mnuExecCadUnidCentrClick(Sender: TObject);
      procedure mnuExecTipoContrXPlanoClick(Sender: TObject);
      procedure mnuExecCadUnidPlanoClick(Sender: TObject);
      procedure mnuCadCartaCobrancaClick(Sender: TObject);
      procedure mnuRelCartaCobrancaClick(Sender: TObject);
      procedure mnuCadBancoXPortadorFormaClick(Sender: TObject);
      procedure mnuExecGeraArquivoBancoClick(Sender: TObject);
      procedure mnuExecEnvioLoteConcessaoClick(Sender: TObject);
      procedure btnREFERClick(Sender: TObject);
      procedure mnuCancEnvioLoteConcessaoClick(Sender: TObject);
      procedure mnuCancContabilizaLoteConcessaoClick(Sender: TObject);
      procedure mnuCancContabilizaLotePrestacaoClick(Sender: TObject);
      procedure mnuCancContabilizaLoteAmortizacaoClick(Sender: TObject);
      procedure mnuCancContabilizaLoteQuitacaoClick(Sender: TObject);
      procedure mnuCancContabilizaLoteEncargosClick(Sender: TObject);
      procedure mnuExecLiberaConcessaoClick(Sender: TObject);
      procedure mnuExecCalculaSegClick(Sender: TObject);
      procedure mnuExecEnvioSeguroClick(Sender: TObject);
      procedure mnuCadTipoContrXQuitClick(Sender: TObject);
      procedure mnuExecContabilizaLoteAtuDiaClick(Sender: TObject);
      procedure mnuCancContabilizaLoteAtuDiaClick(Sender: TObject);
      procedure mnuExecEstornoIndividualClick(Sender: TObject);
      procedure mnuExecTrataInesperadoClick(Sender: TObject);
      procedure mnuExecAcertaSituacaoClick(Sender: TObject);
      procedure mnuExecContabilizaAjusteDiaClick(Sender: TObject);
      procedure mnuCancContabilizaAjusteDiaClick(Sender: TObject);
      procedure mnuExecArqSuspensaoClick(Sender: TObject);
      procedure mnuExecArquivoCriticaClick(Sender: TObject);
      procedure mnuExecLerSIAFIClick(Sender: TObject);
      procedure mnuExecGravarSIAFIClick(Sender: TObject);
      procedure btnQuitaMorteClick(Sender: TObject);
      procedure mnuExecArquivoInadimplenteClick(Sender: TObject);
      procedure mnuExecGeraArquivoMargem13Click(Sender: TObject);
      procedure mnuExecLancParcAtuClick(Sender: TObject);
      procedure mnuRelProvPerdaFUNCEFSintClick(Sender: TObject);
      procedure mnuRelProvPerdaFUNCEFAnalClick(Sender: TObject);
      procedure mnuRelProvPerdaOutrosAnalClick(Sender: TObject);
      procedure mnuRelProvPerdaOutrosSintClick(Sender: TObject);
      procedure mnuExecCalculaValorMaximoClick(Sender: TObject);
      procedure mnuExecCalculaValorDevidoClick(Sender: TObject);
      procedure mnuCancAlteraConcessaoClick(Sender: TObject);
      procedure mnuItemXProcessoClick(Sender: TObject);
      procedure mnuCancEnvioSeguroClick(Sender: TObject);
      procedure mnuPortFormaxEmptmoClick(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure mnuQuitaoemLoteClick(Sender: TObject);
    procedure mnuValorMaximodePrestaoporParticipanteClick(Sender: TObject);
    procedure mnuProvisoparaPerdasClick(Sender: TObject);
    procedure mnuEventosCobrancasClick(Sender: TObject);
    procedure mnuHistoricoEventoCobrancaClick(Sender: TObject);
    procedure mnuRelEvolucaoContratoClick(Sender: TObject);
    procedure mnuRelEmprestimosQuitadosClick(Sender: TObject);
    procedure mnuManutenodoArquivoContratoadClick(Sender: TObject);
    procedure mnuSaldoResidualClick(Sender: TObject);
    procedure mnuAjusteFormaEnvioClick(Sender: TObject);
    procedure mnuFinanciamentoHabitacionalClick(Sender: TObject);
    procedure mnuMapaMovimentaoClick(Sender: TObject);
    procedure mnuExecTrataParcAtrasoClick(Sender: TObject);
    procedure mnuBloqConcPlanPrevClick(Sender: TObject);
    procedure mnuTratamentodeExcessodeDbitoClick(Sender: TObject);
	// TADEU SOL 182258 KINTANA 1697187
    procedure mnuPagamentoEmprestimoResgateClick(Sender: TObject);
    procedure mnuRecebimentoEmprestimoResgateClick(Sender: TObject);
    procedure mnuProcessaEventosCobrancaClick(Sender: TObject);
    procedure mnuRelatrioInadimplenciaClick(Sender: TObject);
    procedure mnuMotivodeBloqueiodeConcessoClick(Sender: TObject);
    procedure mnuAdicionarInforEventosCobrancaClick(Sender: TObject);
	// TADEU SOL 182258 KINTANA 1697187	

    // Felipe A. Santos SOL 258330/17859 PPM 1132081 {fim mnuRestrCobClick}
    procedure mnuRestrCobClick(Sender: TObject);
    procedure mnuTransferePerfilClick(Sender: TObject);
    procedure mnuRemessaEletronicaClick(Sender: TObject);
    procedure mnuImportacaoIrFinancHabitacionalClick(Sender: TObject); //SIG82692
    procedure mnuAlteraoEmLotedaDatadeVencimentoClick(Sender: TObject); //SIG95096    
    procedure mnuImportaodoArquivoeGeraodoRelatrioSICOVClick(Sender: TObject);
    procedure mmuImportaodoInformedeIR1Click(Sender: TObject);  //SIG95372
    procedure mnuCadMensagemContratoClick(Sender: TObject);
   private  // Private declarations

      function  VerificaTransacao: Boolean;
      function  ExisteForm(frm : TForm) : Boolean;

      
   public   // Public declarations

      // Carrega os Parametros de Integracao e Parametros Globais
      procedure CarregaParametros;

   end;



var
  frmPrincipal: TfrmPrincipal;


implementation
{$R *.DFM}
uses
   uSistema, uModulo, uFuncoesEmptmo, uMensErro, UDataBase, DBaseDados, uIntegraBack,
   uIntegraEmptmo, uIntegraEP, uCalcEmptmo, fCadMotivoConcessao,

   DRelatoriosUsu,
   FCadInscricao,
   FCadDatasPatro,
   FParamEmptmo, FCadParamIntegraRec,
   FExecGeraParcela, FCadItemEmptmo, dEmptmo, dMS, FCadTipoEmptmo, FCadTipoContratoEmptmo,
   FCadPlanPrevXContabil, BPlanoConta, 
   FCadItemxTipoContrato, FVerificaMenuSAD, FExecQuitacao, {RContrato,}
   FExecEnvio, fCancQuitacao, FCancGeraParcela, FCancConcessao,
   fCancAmortizacao, FExecTrataParcela, FPessoaFiador,
   FPessoaSeguradora, dRelContrConc,
   FExecAlteraContrato, FCadCCBaixaXPatro, dRelMovContr, FCancEnvio,
   FExecAmortizacao,
   FCancInscricao, RRecebPatro,
   FExecAtualizaDiaria, FCadVerbas,
   dRelInscPend, dRelValCred, dRelParcGer,
   dRelFechamentoCarteira, dRelFechamentoCarteiraPP, dRelConfereEnvioFolha,
   dRelDividas, dRelParamFin, dRelParcGerSint,
   dRelFechamentoCarteiraCaixa,
   fCancRecebimento,
   dRelContaCorrente, dRelItensEnvioSint, DDividaEP,
   dRelQuitacaoNaoEfetivada, fAguarde, dRelContratoSemParcela,
   dRelItensEnvioAnal, dRelRetencaoIOF,
   dRelDividasMutuario,
   dRelDividasTipoContrato, dRelAnaliseContabil, dRelInscricao,
   dRelHistXTmpDesc, FCadTipoSuspensao, FCadtipocontrXSusp,
   FExecLiberaSuspensao, FExecAlteraConcessao,
   FExecRecebimento, FExecTrataDivergNovo,
   FSuspensaoConcessao, fCadContratoPadrao,
   FCadAssinaturaContrato, dRelValRecTMPDESC, dRelItensGeradosAnal,
   dRelItensGeradosDia, dRelItensGeradosSint,
   dRelItensGeradosDiaPP, dRelItensGeradosSintPP,
   dRelDividasIndexador,
   dRelConfereEnvioContrato, dRelItensNaoEnviados, dRelItensGeradosTipoContr,
   dRelDividaDuvidoso, dRelItensDiverg, fHistoricoSuspensaoCob,
   FExecLancaAlteradorEP, FExecEntradaManual, FExecTrataItemNaoRecebido,
   FExecContabilizaLoteConcessao, FExecDevolucaoLote, RLogTotalPrev,
   RTMPDESC, FExecContabilizaLoteQuitacao, FExecCalculoRepasse,
   fCadLancaSeguro, dRelResumoContratoCaixa, dRelResumoContratoSaldo,
   FExecContabilizaLoteAmortizacao, DRelRepasseSeguro, FProgresso,
   dRelItensEnvioContrato, FExecContabilizaLotePrestacao,
   FExecContabilizaLoteEncargo, dRelItensEnvioSintCAPCAR,
   dRelItensEnvioAnalCAPCAR, FCadVerbaPlano,
   FCadUnidCentr, FCadPlanTipCont, FCadVerbasNovo, dRelItensAberto,
   FDRelCartaCobrEP, CRelCartaCobrEP, fCadBancoPortador,
   FExecEnvioLoteConcessao, FExecConcessaoREFER, FCancEnvioLoteConcessao,
   FExecGeraArquivoRemessa, dRelParcGerPatro, FCancContabLoteConcessao,
   FCancContabLotePrestacao, FCancContabLoteAmortizacao,
   FCancContabLoteQuitacao, FCancContabLoteEncargo, FExecLiberaConcessao,
   fExecCalculaSegCompl, FExecEnvioSeguro, FCadTipoContrXTipoContr,
   dRelContrConcSint, FExecContabilizaLoteAtuDia, FCancContabLoteAtuDia,
   FExecAtualizaDiariaNova, dRelFechamentoCarteiraLinear, 
   FExecTrataInesperado, FExecEstornoIndividual, dRelRetencaoIOFPP,
   dRelValCredPlanoPatro, dRelDividasPP, dRelConciliaContabPP,
   dRelConciliaContab, dRelConciliaContabCC, FCancContabLoteAjuste,
   FExecContabilizaLoteAjuste, FExecArqSupensaoCobranca, dRelConfereParcela,
   FExecCriticaCaixa, dRelValorAtualizado, FExecValorAtualizadoArquivo,
   fLerArquivoSIAFI, fGerarArquivoSIAFI, dRelFalecimento,
   dRelFalecimentoSemQuitacao, FExecGeraArquivoMargem13, dRelConferePlanilha,
   FExecLancParcAtu, dRelConciliaCaPCar, dRelConciliaFolhaPP,
   dRelItensEnvioCapCarPP, dRelConciliaContabPeriodo, dRelConciliaContabCCPeriodo,
   dRelConciliaContabPPPeriodo, CRelProvPerdaFUNCEF, CRelProvPerdaOutros,
   FCadItemXProcesso, FExecEnvioLoteSeguro, FCancEnvioLoteSeguro,
   FExecCalculaValorMaximo, FExecCalculaValorDevido, dRelContratoDuplicidade,
   cRelQuitacaoComSaldoDevedor, dRelQuitacaoComSaldoDevedor, FCancAlteracaoConcessao,
   UIntegraModulo, FCadPortFormaxEmptmo,dRel2ViaCChequeMT,FPRel2ViaCChequeMT,uCmCtrlRptCentralAP,
   fQuitacaoLote //Renato Visoni SOL 92697
   ,FValorMaximoPrestacao, FProvPerdas, FEvolucaoContrato, FEmprestimosQuitados, FAjusteFormaEnvio,
   FSaldoResidual, FManutContratoAd,fCadastroEventoCobrancaEP,FEventoCobrancaContrato
   ,FDesbloquearMutuario, FMapaMovimentacao //MARCELO ALMEIDA - SOL 136411 - KINTANA - 815862
   ,FExecTrataParcAtraso, FCadSuspConcPlaPrev, FExecEnvioExcessoCobranca,
  FPagtoEmprestimoResgate, FRecebtoEmprestimoResgate,
  fInfoEventoConbranca, //William Santana - SOL 219116/16182 PPM 422309
  FProcessaEventoCobranca, CRelInadimplencia, RContrato // TADEU SOL 182258 KINTANA 1697187
  , FRestrCobranca  // Felipe A. Santos SOL 258330/17859 PPM 1132081
  , FTransferePerfilInves, 
  FImportacaoIRHabitacional, //SIG82692 
  FAlteracaoLoteDataVencimento, //SIG95096
  FEmpSicov, FRemessaEletronica, //SIG95372
  FCadMensagemContrato,  // Leandro WO15681
  FImportacaoInformeIR;
  //edilaine - SIG56660

//==================================================================================================
//==================================================================================================
//==================================================================================================



procedure TfrmPrincipal.CarregaParametros;
begin
   // Carrega os Parametros de Integracao e Parametros Globais

   //-----------------------------------------------------------------------------------------
   //    Parâmetros Globais
   //-----------------------------------------------------------------------------------------

   with dtmEmptmo.qryParamGlobal do
   begin
      LimpaParametros(dtmEmptmo.qryParamGlobal);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

      if not(dtmEmptmo.qryParamGlobal.isEmpty) then
      begin
         Modulo.bUsaCentRespon   := dtmEmptmo.qryParamGlobalUSACRESPON.asString = 'S';
         Modulo.bUsaUnidNegoc    := dtmEmptmo.qryParamGlobalUSAABC.asString = 'S';
         Modulo.iMoedaCorrente   := dtmEmptmo.qryParamGlobalMOEDACORRENTE.asInteger;
         Modulo.sMoedaCorrente   := dtmEmptmo.qryParamGlobalMOESIGLA.AsString;
      end;

      if not(Modulo.bUsaCentRespon) then Modulo.sCentroRespon  := dtmEmptmo.qryParamGlobalCODCENTRORESPON.asString;
      if not(Modulo.bUsaUnidNegoc) then Modulo.iUnidNegoc      := dtmEmptmo.qryParamGlobalUNIDNEGOC.asInteger;
   end;



   //-----------------------------------------------------------------------------------------
   //    CaP / CaR
   //-----------------------------------------------------------------------------------------

   // máscara do Tipo de Recebimento
   with dtmEmptmo.qryParamCAP do
   begin
      LimpaParametros(dtmEmptmo.qryParamCAP);
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('RECPAG').asString         := 'R';
      Open;

      Modulo.sMascaraReceb := trim(dtmEmptmo.qryParamCAPMASCARADESEMB.asString);
   end;

   // máscara do Tipo de Desembolso
   with dtmEmptmo.qryParamCAP do
   begin
      LimpaParametros(dtmEmptmo.qryParamCAP);
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('RECPAG').asString         := 'P';
      Open;

      Modulo.sMascaraDesemb := trim(dtmEmptmo.qryParamCAPMASCARADESEMB.asString);
   end;




   //-----------------------------------------------------------------------------------------
   //    Contabilidade
   //-----------------------------------------------------------------------------------------

   // verifica o plano de contas vigente hoje
   with dtmEmptmo.qryPlanoData do
   begin
      LimpaParametros(dtmEmptmo.qryPlanoData);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      ParamByName('PDATAHOJE').AsDateTime := SysDate;
      Open;
   end;

   if not(dtmEmptmo.qryPlanoData.isEmpty) then
   begin
      Modulo.iPlano := dtmEmptmo.qryPlanoDataPLANO.AsInteger;
   end
   else
   begin
      with dtmEmptmo.qryParamContab do
      begin
         LimpaParametros(dtmEmptmo.qryParamContab);
         ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
         Open;
      end;

      if not(dtmEmptmo.qryParamContab.isEmpty) then
      begin
         Modulo.iPlano := dtmEmptmo.qryParamContabPLANO.AsInteger;
      end
      else
      begin
         Modulo.iPlano := 2; (* grande bacalhau !!! *)
      end;
   end;

   // abre a query que traz os dados de integração
   with dtmEmptmo.qryIntegraContab do
   begin
      LimpaParametros(dtmEmptmo.qryIntegraContab);
      ParamByName('PPLANO').asInteger := Modulo.iPlano;
      Open;
   end;

   // se não existirem os dados necessários para a integração...
   if not(dtmEmptmo.qryIntegraContab.isEmpty) then
   begin
      IntegraBack.Plano          := Modulo.iPlano;
      IntegraBack.MascaraPlano   := trim(dtmEmptmo.qryIntegraContabMASCARA.asString);

      // seta a variável sIntegraContab, necessária p/ UFuncaoGeral
      IntegraBack.Contabilidade  := 'S';
   end
   else
   begin
      IntegraBack.Contabilidade  := 'N';
   end;



   //-----------------------------------------------------------------------------------------
   //    Parâmetros do Sistema
   //-----------------------------------------------------------------------------------------

   Modulo.iPrograma           := -1;
   Modulo.iGrupoRegra         := -1;
   Modulo.iTipoDocPag         := -1;
   Modulo.iTipoDocRec         := -1;
   Modulo.iTipoDocRecDevol    := -1;
   Modulo.iPais               := -1;
   Modulo.sEstado             := '';
   Modulo.iCidade             := -1;
   Modulo.iPermiteRenovacao   := -1;
   Modulo.iPermiteAmortizacao := -1;


   // caso os parâmetros não estejam definidos ainda...
   if ParametrosSistema then
   begin
      if not(dtmEmptmo.qryParamEmptmoIDPROGRAMA.isNULL)     then Modulo.iPrograma      := dtmEmptmo.qryParamEmptmoIDPROGRAMA.asInteger;
      if not(dtmEmptmo.qryParamEmptmoCODCENTROCUSTO.isNULL) then Modulo.sCentroCusto   := dtmEmptmo.qryParamEmptmoCODCENTROCUSTO.AsString;
      if not(dtmEmptmo.qryParamEmptmoIDGRUPOREGRA.isNULL)	then Modulo.iGrupoRegra    := dtmEmptmo.qryParamEmptmoIDGRUPOREGRA.asInteger;

      if not(dtmEmptmo.qryParamEmptmoTIPODOCPAG.isNULL)     then Modulo.iTipoDocPag := dtmEmptmo.qryParamEmptmoTIPODOCPAG.asInteger;
      if not(dtmEmptmo.qryParamEmptmoTIPODOCREC.isNULL)     then Modulo.iTipoDocRec	:= dtmEmptmo.qryParamEmptmoTIPODOCREC.asInteger;

      if not(dtmEmptmo.qryParamEmptmoIDPAIS.isNULL)         then Modulo.iPais		:= dtmEmptmo.qryParamEmptmoIDPAIS.asInteger;
      if not(dtmEmptmo.qryParamEmptmoCODESTADO.isNULL)      then Modulo.sEstado	:= dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
      if not(dtmEmptmo.qryParamEmptmoIDCIDADES.isNULL)      then Modulo.iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.asInteger;

      if not(dtmEmptmo.qryParamEmptmoFLGAMTPRESTAB.isNULL)  then Modulo.iPermiteAmortizacao  := dtmEmptmo.qryParamEmptmoFLGAMTPRESTAB.asInteger;
      if not(dtmEmptmo.qryParamEmptmoFLGRENPRESTAB.isNULL)  then Modulo.iPermiteRenovacao    := dtmEmptmo.qryParamEmptmoFLGRENPRESTAB.asInteger;
      if not(dtmEmptmo.qryParamEmptmoFLGAGRUPAPARC.isNULL)  then Modulo.iFlgAgrupaParc       := dtmEmptmo.qryParamEmptmoFLGAGRUPAPARC.asInteger;
   end;
end;



function TfrmPrincipal.VerificaTransacao: Boolean;
begin
   Result := True;

   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      Result := False;
      MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;
end;



procedure TfrmPrincipal.mnuUtilAcertaSequenceClick(Sender: TObject);
var
   iQuantSeq      : Integer;
   iAtual         : Int64;
   iMaximo        : Int64;

   qryAuxTabelas  : TwwQuery;
   qryAuxUltimoID : TwwQuery;
   qryAuxCriaSEQ  : TwwQuery;
begin
   inherited;

   // cria as queries necessárias
   qryAuxTabelas  := TwwQuery.Create(Application);
   qryAuxUltimoID := TwwQuery.Create(Application);
   qryAuxCriaSEQ  := TwwQuery.Create(Application);

   qryAuxTabelas.DatabaseName    := 'BaseDados';
   qryAuxUltimoID.DatabaseName   := 'BaseDados';
   qryAuxCriaSEQ.DatabaseName    := 'BaseDados';

   try
      with qryAuxTabelas do
      begin
         Close;
         SQL.Clear;
         SQL.Text :=
         'SELECT '                                                      + #13 +
         '   C.TABLE_NAME, '                                            + #13 +
         '   SUBSTR(CC.COLUMN_NAME, 1, 30) CHAVE, '                     + #13 +
         '   CC.POSITION '                                              + #13 +
         'FROM '                                                        + #13 +
         '   USER_CONSTRAINTS C, USER_CONS_COLUMNS CC, '                + #13 +
         '   ALL_TAB_COLUMNS ATB '                                      + #13 +
         'WHERE '                                                       + #13 +
         '       ( C.OWNER            = ''CM'') '                       + #13 +
         '   AND ( CC.OWNER           = ''CM'') '                       + #13 +
         '   AND ( C.CONSTRAINT_TYPE  = ''P'') '                        + #13 +
         '   AND ( ATB.DATA_TYPE      = ''NUMBER'' ) '                  + #13 +
         '   AND ( C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME ) '           + #13 +
         '   AND ( C.TABLE_NAME      = ATB.TABLE_NAME ) '               + #13 +
         '   AND ( C.TABLE_NAME      = CC.TABLE_NAME ) '                + #13 +
         '   AND ( CC.TABLE_NAME     = ATB.TABLE_NAME ) '               + #13 +
         '   AND ( CC.COLUMN_NAME    = ATB.COLUMN_NAME ) '              + #13 +
         '   AND NOT EXISTS '                                           + #13 +
         '       ( '                                                    + #13 +
         '       SELECT '                                               + #13 +
         '          C2.POSITION '                                       + #13 +
         '       FROM '                                                 + #13 +
         '          USER_CONSTRAINTS C1, USER_CONS_COLUMNS C2 '         + #13 +
         '       WHERE '                                                + #13 +
         '              ( C1.OWNER           = ''CM'') '                + #13 +
         '          AND ( C2.OWNER           = ''CM'') '                + #13 +
         '          AND ( C1.CONSTRAINT_TYPE = ''P'') '                 + #13 +
         '          AND ( C2.POSITION        > 1 ) '                    + #13 +
         '          AND ( C1.TABLE_NAME      = C.TABLE_NAME ) '         + #13 +
         '          AND ( C1.CONSTRAINT_NAME = C2.CONSTRAINT_NAME ) '   + #13 +
         '       ) ';

         Open;
         First;

         iAtual    := 0;
         iQuantSeq := qryAuxTabelas.RecordCount;

         frmProgresso.MostraFormProgresso('Ajustando Sequences...',
                                          True,
                                          False,
                                          True,
                                          0,
                                          iQuantSeq
                                         );

         while not(EOF) do
         begin
            Inc(iAtual);
            frmProgresso.AndaFormProgresso(iAtual);

            (* busca o maior "ID" *)
            with qryAuxUltimoID do
            begin
               Close;
               SQL.Clear;
               SQL.Text := 'SELECT MAX(' + trim(qryAuxTabelas.FieldByName('CHAVE').AsString) + ') FROM ' + trim(qryAuxTabelas.FieldByName('TABLE_NAME').AsString);
               Open;

               iMaximo := qryAuxUltimoID.Fields[0].AsInteger;
               Close;
            end;

            (* acerta o sequence *)
            with qryAuxUltimoID do
            begin
               SQL.Clear;
               SQL.Text := 'DROP SEQUENCE ' + 'SEQ' + trim(qryAuxTabelas.FieldByName('TABLE_NAME').AsString);
               ExecSQL;

               SQL.Clear;
               SQL.Text := 'CREATE SEQUENCE ' + 'SEQ' + trim(qryAuxTabelas.FieldByName('TABLE_NAME').AsString) + 'NOCACHE NOMAXVALUE NOCYCLE MINVALUE 1 INCREMENT BY 1 START WITH ' + IntToStr(iMaximo);
               ExecSQL;
            end;

            Next;
         end;
      end;

   finally
      frmProgresso.EscondeFormProgresso;

      qryAuxTabelas.Free;
      qryAuxUltimoID.Free;
      qryAuxCriaSEQ.Free;
   end;
end;



//==================================================================================================
//==================================================================================================
//==================================================================================================




procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;

   try
      if Sistema.FezLogin then
      begin
         stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

         Screen.Cursor := crHourGlass;
         CarregaParametros;

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.ASInteger = 1 then
         begin
         end;
      end;

   finally

      dtmMS.MS_Forn.Filtro.Add('E.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
      dtmMS.MS_Cliente.Filtro.Add('E.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
      dtmMS.MS_CContabil.Filtro.Add('CC.PLANO = ' + IntToStr(Modulo.iPlano));

      dtmMS.MS_Regra.Filtro.Clear;
      dtmMS.MS_Regra.Filtro.Add('TR.IDGRUPOREGRA = ' + IntToStr(Modulo.iGrupoRegra));
      dtmMS.MS_Regra.Filtro.Add('( R.IDTIPOREGRA = TR.IDTIPOREGRA )');

      dtmEmptmo.qryParamGlobal.Close;
      dtmEmptmo.qryParamCAP.Close;
      dtmEmptmo.qryIntegraContab.Close;
      dtmEmptmo.qryPlanoData.Close;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      if Sistema.TipoCliente = 20011 then
      begin
         ToolbarSep971.Visible      := True;
         btnResgate.Visible         := True;
         btnResgate.Enabled         := True;
         btnCancelaResgate.Visible  := True;
         btnCancelaResgate.Enabled  := True;
      end;

      mnuExecArqSuspensao.Visible         := False;
      mnuExecArquivoCritica.Visible       := False;
      mnuExecArquivoInadimplente.Visible  := False;
      N22.Visible                         := False;
      mnuExecLerSIAFI.Visible             := False;
      mnuExecGravarSIAFI.Visible          := False;
      N27.Visible                         := False;
      mnuExecGeraArquivoMargem13.Visible  := False;


      if Sistema.TipoCliente = 19991 then // FUNCEF
      begin
         N42.Visible                         := True;
         mnuExecArqSuspensao.Visible         := True;

         N45.Visible                         := True;
         mnuExecArquivoCritica.Visible       := True;

         mnuArquivoTexto.Visible             := True;
         mnuArquivoTexto.Enabled             := True;
         mnuExecArquivoInadimplente.Visible  := True;

         mnuExecArquivoSeguradora.Visible    := True;

         N22.Visible                         := True;

         mnuExecLerSIAFI.Visible             := True;

         mnuExecGravarSIAFI.Visible          := True;

         N27.Visible                         := True;
         mnuExecGeraArquivoMargem13.Visible  := True;
         mnuExecGeraArquivoMargem13.Enabled  := True;

         mnuExecLancParcAtu.Visible          := True;
         mnuExecLancParcAtu.Enabled          := True;
      end;

      // -------------------------------------------------------------------------------------------
      // Relatórios especiais
      // -------------------------------------------------------------------------------------------

      sepRelEspFUNCEF.Visible                := (Sistema.TipoCliente = 19991);
      mnuRelProvPerdaFUNCEFAnal.Visible      := (Sistema.TipoCliente = 19991);
      mnuRelProvPerdaFUNCEFSint.Visible      := (Sistema.TipoCliente = 19991);

      mnuRelProvPerdaFUNCEFAnal.Enabled      := (Sistema.TipoCliente = 19991);
      mnuRelProvPerdaFUNCEFSint.Enabled      := (Sistema.TipoCliente = 19991);

      // -------------------------------------------------------------------------------------------

      sepRelEspOutros.Visible                := (Sistema.TipoCliente <> 19991);
      mnuRelProvPerdaOutrosAnal.Visible      := (Sistema.TipoCliente <> 19991);
      mnuRelProvPerdaOutrosSint.Visible      := (Sistema.TipoCliente <> 19991);

      mnuRelProvPerdaOutrosAnal.Enabled      := (Sistema.TipoCliente <> 19991);
      mnuRelProvPerdaOutrosSint.Enabled      := (Sistema.TipoCliente <> 19991);

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      MnuLogdeOperaes_Padrao.Visible := True;

      Screen.Cursor := crDefault;
   end;
end;



//==================================================================================================



procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
   inherited;

   // Analíticos -----------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelItensAberto, dtmRelItensAberto);             // Itens em Aberto - Analítico
   Application.CreateForm(TdtmRelItensGeradosAnal, dtmRelItensGeradosAnal);   // Itens Gerados (Analítico)
   Application.CreateForm(TdtmRelParcGer, dtmRelParcGer);                     // Parcelas Geradas por Mês
   Application.CreateForm(TdtmRelParcGerPatro, dtmRelParcGerPatro);           // Parcelas Geradas por Patrocinadora

   // Cadastrais -----------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelParamFin, dtmRelParamFin);                   // Parametrização Financeira

   // Conferência ----------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelConfereEnvioContrato, dtmRelConfereEnvioContrato);       // Conferência de Valores Enviados / Recebidos (por contrato)
   Application.CreateForm(TdtmRelItensNaoEnviados, dtmRelItensNaoEnviados);               // Contratos com Itens Não Enviados
   Application.CreateForm(TdtmRelContratoSemParcela, dtmRelContratoSemParcela);           // Contratos com Parcelas Não Geradas
   Application.CreateForm(TdtmRelConfereParcela, dtmRelConfereParcela);                   // Conferência do valor de parcelas geradas
   Application.CreateForm(TdtmRelInscPend, dtmRelInscPend);                               // Inscrições não Efetivadas
   Application.CreateForm(TdtmRelQuitacaoNaoEfetivada, dtmRelQuitacaoNaoEfetivada);       // Quitações não Efetivadas

   // Contábeis ------------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelAnaliseContabil, dtmRelAnaliseContabil);                 // Relatório de Análise Contábil
   Application.CreateForm(TdtmRelConciliaContab, dtmRelConciliaContab);                   // Relatório de Conciliação Contábil - sintético por Conta Contábil
   Application.CreateForm(TdtmRelConciliaContabPeriodo, dtmRelConciliaContabPeriodo);     // Relatório de Conciliação Contábil - sintético por Conta Contábil
   Application.CreateForm(TdtmRelConciliaContabCC, dtmRelConciliaContabCC);               // Relatório de Conciliação Contábil - analítico por Conta Contábil
   Application.CreateForm(TdtmRelConciliaContabCCPeriodo, dtmRelConciliaContabCCPeriodo); // Relatório de Conciliação Contábil - analítico por Conta Contábil
   Application.CreateForm(TdtmRelConciliaContabPP, dtmRelConciliaContabPP);               // Relatório de Conciliação Contábil - por Plano e Patrocinadora
   Application.CreateForm(TdtmRelConciliaContabPPPeriodo, dtmRelConciliaContabPPPeriodo); // Relatório de Conciliação Contábil - por Plano e Patrocinadora
   Application.CreateForm(TdtmRelConferePlanilha, dtmRelConferePlanilha);                 // Relatório de Conferência de Planilhas

   // Conta-Corrente -------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelContaCorrente, dtmRelContaCorrente);         // Conta Corrente

   // Demonstrativos -------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelMovContr, dtmRelMovContr);                   // Extrato de Movimentações por Contrato

   // Divergências ---------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelItensDiverg, dtmRelItensDiverg);             // Itens com divergência
                                                                              // Itens com divergência tratada

   // Envio / Recebimento --------------------------------------------------------------------------
   Application.CreateForm(TdtmRelHistXTmpDesc, dtmRelHistXTmpDesc);                          // Divergências entre Histórico e TMPDESC
   Application.CreateForm(TdtmRelConfereEnvioFolha, dtmRelConfereEnvioFolha);                // Rubricas Enviadas/Recebidas (por Patrocinadora)
   Application.CreateForm(TdtmRelValRecTMPDESC, dtmRelValRecTMPDESC);                        // Valores a Receber - Folha(s)
   Application.CreateForm(TdtmRelItensEnvioAnal, dtmRelItensEnvioAnal);                      // Valores Enviados/Recebidos (Folha) - analítico
   Application.CreateForm(TdtmRelItensEnvioContrato, dtmRelItensEnvioContrato);              // Valores Enviados/Recebidos (Folha) - sintético por Contrato
   Application.CreateForm(TdtmRelItensEnvioSint, dtmRelItensEnvioSint);                      // Valores Enviados/Recebidos (Folha) - sintético por Item de Empréstimo
   Application.CreateForm(TdtmRelItensEnvioAnalCAPCAR, dtmRelItensEnvioAnalCAPCAR);          // Valores Enviados/Recebidos (Financeiro) - analítico
   Application.CreateForm(TdtmRelItensEnvioSintCAPCAR, dtmRelItensEnvioSintCAPCAR);          // Valores Enviados/Recebidos (Financeiro) - sintético por Item de Empréstimo

   Application.CreateForm(TdtmRelConciliaCapCar, dtmRelConciliaCapCar);                      //
   Application.CreateForm(TdtmRelConciliaFolhaPP, dtmRelConciliaFolhaPP);                    //
   Application.CreateForm(TdtmRelItensEnvioCapCarPP, dtmRelItensEnvioCapCarPP);              //

   // Gerenciais -----------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelContrConc, dtmRelContrConc);                                   // Empréstimos Concedidos por Plano/Patrocinadora
   Application.CreateForm(TdtmRelContrConcSint, dtmRelContrConcSint);                           // Empréstimos Concedidos por Plano/Patrocinadora
                                                                                                // Empréstimos Concedidos (por Tipo de Contrato)
   Application.CreateForm(TdtmRelFechamentoCarteiraCaixa, dtmRelFechamentoCarteiraCaixa);       // Resumo da Carteira (visão Caixa)
   Application.CreateForm(TdtmRelFechamentoCarteiraLinear, dtmRelFechamentoCarteiraLinear);     // Resumo da Carteira (visão Caixa Linear)

   Application.CreateForm(TdtmRelFechamentoCarteira, dtmRelFechamentoCarteira);                 // Resumo da Carteira (visão Saldo)
   Application.CreateForm(TdtmRelFechamentoCarteiraPP, dtmRelFechamentoCarteiraPP);             // Resumo da Carteira (visão Saldo) - por Plano e Patro
   Application.CreateForm(TdtmRelDividasTipoContrato, dtmRelDividasTipoContrato);               // Valores Devidos por Tipo de Contrato

   Application.CreateForm(TdtmRelResumoContratoCaixa, dtmRelResumoContratoCaixa);               // Resumo de Contratos (visão Caixa)
   Application.CreateForm(TdtmRelResumoContratoSaldo, dtmRelResumoContratoSaldo);               // Resumo de Contratos (visão Saldo)

   // Falecimento / Seguros ------------------------------------------------------------------------
   Application.CreateForm(TdtmRelFalecimento, dtmRelFalecimento);                               // Contratos quitados por Falecimento
   Application.CreateForm(TdtmRelRepasseSeguro, dtmRelRepasseSeguro);                           // Repasse de Seguro
   Application.CreateForm(TdtmRelFalecimentoSemQuitacao, dtmRelFalecimentoSemQuitacao);         // Mutuários falecidos com contratos não quitados

   // Inadimplência --------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelValorAtualizado, dtmRelValorAtualizado);                 // Valor Atualizado por Contrato
   Application.CreateForm(TdtmRelDividaDuvidoso, dtmRelDividaDuvidoso);                   // Provisões para Créditos de Recebimento Duvidoso
   Application.CreateForm(TdtmRelDividas, dtmRelDividas);                                 // Valores Devidos
   Application.CreateForm(TdtmRelDividasPP, dtmRelDividasPP);                             // Valores Devidos
   Application.CreateForm(TdtmRelDividasIndexador, dtmRelDividasIndexador);               // Valores Devidos por Indexador
   Application.CreateForm(TdtmRelDividasMutuario, dtmRelDividasMutuario);                 // Valores Devidos por Mutuário (Analítico)

   // Operacionais ---------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelItensGeradosDia, dtmRelItensGeradosDia);                 // Itens Gerados por Dia (Sintético)
   Application.CreateForm(TdtmRelItensGeradosDiaPP, dtmRelItensGeradosDiaPP);             // Itens Gerados por Dia - por Plano e Patrocinadora

   Application.CreateForm(TdtmRelItensGeradosSint, dtmRelItensGeradosSint);               // Itens Gerados por Evento (Sintético)
   Application.CreateForm(TdtmRelItensGeradosSintPP, dtmRelItensGeradosSintPP);           // Itens Gerados por Evento - por Plano e Patrocinadora

   Application.CreateForm(TdtmRelItensGeradosTipoContr, dtmRelItensGeradosTipoContr);     // Itens Gerados por Tipo de Contrato (Sintético)
   Application.CreateForm(TdtmRelParcGerSint, dtmRelParcGerSint);                         // Parcelas Geradas no Mês (Sintético)

   Application.CreateForm(TdtmRelRetencaoIOF, dtmRelRetencaoIOF);                         // Retenção de IOF
   Application.CreateForm(TdtmRelRetencaoIOFPP, dtmRelRetencaoIOFPP);                     // Retenção de IOF - por Plano / Patro

   Application.CreateForm(TdtmRelValCred, dtmRelValCred);                                 // Valores a Creditar
   Application.CreateForm(TdtmRelValCredPlanoPatro, dtmRelValCredPlanoPatro);             // Valores a Creditar - por Plano e Patro

   // Especiais ------------------------------------------------------------------------------------
   Application.CreateForm(TdtmRelInscricao, dtmRelInscricao);  // Impressão da Inscricao
   // ----------------------------------------------------------------------------------------------

   Application.CreateForm(TdtmRelContratoDuplicidade, dtmRelContratoDuplicidade);  // Impressão da Inscricao

   Application.CreateForm(TdtmRelQuitacaoComSaldoDevedor, dtmRelQuitacaoComSaldoDevedor);

   Application.CreateForm(TDtmRel2ViaCChequeMT, DtmRel2ViaCChequeMT); //Renato Visoni SOL 103239 KINTANA 468105
end;



//==================================================================================================



procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   inherited;
end;



//==================================================================================================



// backdoor de habilitação de todos os menus
procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
var
  ConsPart1: TConsPart;
begin
   inherited;

   try
      Application.CreateForm(TconsPart, Conspart1);
      ConsPart1.sIdPessoa    := '0';
      ConsPart1.sIdPessjur   := '0';
      ConsPart1.sIdPlanoprev := '0';
      ConsPart1.sSeqProposta := '0';
      ConsPart1.DataBaseName := 'BaseDados';
      ConsPart1.MostraConsulta;
   finally
      // ELS SOL 175120 Kintana 1594021
      //FreeAndNil(Conspart1);
   end;
end;



//==================================================================================================
//==================================================================================================
//==================================================================================================



//==================================================================================================
//==================================================================================================
//==================================================================================================




procedure TfrmPrincipal.mnuCadTipoEmptmoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmCadTipoEmptmo, TfrmCadTipoEmptmo, False);
end;

procedure TfrmPrincipal.mnuCadTipoContratoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmCadTipoContratoEmptmo, TfrmCadTipoContratoEmptmo, False);
end;



procedure TfrmPrincipal.mnuCadItemEmptmoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then
      AbrirForm(frmCadItemEmptmo, TfrmCadItemEmptmo, False);
end;

procedure TfrmPrincipal.mnuExecInscricaoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then
      AbrirForm(frmCadInscricao, TfrmCadInscricao, False);
end;            
                                         
procedure TfrmPrincipal.mnuCadItemXTipoContratoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then
      AbrirForm(frmCadItemXTipoContrato, TfrmCadItemXTipoContrato, False);
end;                     

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then
      AbrirForm(frmParamEmptmo, TfrmParamEmptmo, False);
end;

procedure TfrmPrincipal.mnuCadDataPatroClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then
      AbrirForm(frmCadDatasPatro, TfrmCadDatasPatro, False);
end;

procedure TfrmPrincipal.mnuCadVerbaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadVerbas, TfrmCadVerbas, False);
end;

procedure TfrmPrincipal.mnuExecGeraParcelaClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then
      AbrirForm(frmExecGeraParcela, TfrmExecGeraParcela, False);
end;

procedure TfrmPrincipal.mnuCadPlanPrevXContabilClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPlanPrevXContabil, TfrmCadPlanPrevXContabil, False);
end;

procedure TfrmPrincipal.mnuConsPlanoContaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(busPlanoconta, TbusPlanoconta, False);
end;

procedure TfrmPrincipal.mnuUtilVerificaMenuClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmVerificaMenuSAD, TfrmVerificaMenuSAD, False);
end;

procedure TfrmPrincipal.mnuExecQuitaClick(Sender: TObject);
begin
   inherited;
   if ExisteForm(frmExecQuitacao) then
      Exit;

   if VerificaTransacao then
   begin
      Application.CreateForm(TfrmExecQuitacao, frmExecQuitacao);
      frmExecQuitacao.FormStyle := fsMDIChild;
      frmExecQuitacao.Show;
   end;
end;

procedure TfrmPrincipal.mnuConsContratoParcelaClick(Sender: TObject);
begin
   inherited;

   if ExisteForm(frmRelContrato) then
      Exit;
   Application.CreateForm(TfrmRelContrato, frmRelContrato);
    frmRelContrato.FormStyle := fsMDIChild;
    frmRelContrato.Show;

end;

procedure TfrmPrincipal.mnuExecEnvioClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then
      AbrirForm(frmExecEnvio, TfrmExecEnvio, False);
end;

procedure TfrmPrincipal.mnuCancQuitaClick(Sender: TObject);
begin
   inherited;
   if ExisteForm(frmCancQuitacao) then Exit;

   if VerificaTransacao then
   begin
      Application.CreateForm(TfrmCancQuitacao, frmCancQuitacao);
      frmCancQuitacao.FormStyle := fsMDIChild;
      frmCancQuitacao.Show;
   end;
end;

procedure TfrmPrincipal.mnuCancGeraParcelaClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmCancGeraParcela, TfrmCancGeraParcela, False);
end;

procedure TfrmPrincipal.Mnu_UsoPessoal_PadraoClick(Sender: TObject);
begin
	inherited;
	//
end;

procedure TfrmPrincipal.mnuCancConcessaoClick(Sender: TObject);
begin
	inherited;
   if VerificaTransacao then AbrirForm(frmCancConcessao, TfrmCancConcessao, False);
end;

procedure TfrmPrincipal.mnuCancEnvioClick(Sender: TObject);
begin
	inherited;
   if VerificaTransacao then AbrirForm(frmCancEnvio, TfrmCancEnvio, False);
end;

procedure TfrmPrincipal.mnuExecRecebimentoClick(Sender: TObject);
begin
	inherited;
   if VerificaTransacao then AbrirForm(frmExecRecebimento, TfrmExecRecebimento, False);
end;

procedure TfrmPrincipal.mnuExecAmortizaClick(Sender: TObject);
begin
   inherited;
   if ExisteForm(frmExecAmortizacao) then Exit;

   if VerificaTransacao then
   begin
      Application.CreateForm(TfrmExecAmortizacao, frmExecAmortizacao);
      frmExecAmortizacao.FormStyle := fsMDIChild;
      frmExecAmortizacao.Show;
   end;
end;

procedure TfrmPrincipal.mnuCancAmortizaClick(Sender: TObject);
begin
   inherited;
   if ExisteForm(frmCancAmortizacao) then Exit;

   if VerificaTransacao then
   begin
      Application.CreateForm(TfrmCancAmortizacao, frmCancAmortizacao);
      frmCancAmortizacao.FormStyle := fsMDIChild;
      frmCancAmortizacao.Show;
   end;
end;

procedure TfrmPrincipal.mnuExecTrataDivergenciaClick(Sender: TObject);
begin
	inherited;
   if VerificaTransacao then AbrirForm(frmExecTrataDivergNovo, TfrmExecTrataDivergNovo, False);
end;

procedure TfrmPrincipal.mnuExecTrataParcelaClick(Sender: TObject);
begin
   inherited;
   if ExisteForm(frmExecTrataParcela) then Exit;

   if VerificaTransacao then
   begin
      Application.CreateForm(TfrmExecTrataParcela, frmExecTrataParcela);
      frmExecTrataParcela.FormStyle := fsMDIChild;
      frmExecTrataParcela.Show;
   end;
end;

procedure TfrmPrincipal.mnuExecAlteraContratoClick(Sender: TObject);
begin
	inherited;
   AbrirForm(frmExecAlteraContrato, TfrmExecAlteraContrato, False);
end;

procedure TfrmPrincipal.mnuCadAvalistaClick(Sender: TObject);
begin
	inherited;
   AbrirForm(frmPessoaFiador, TfrmPessoaFiador, False);
end;

procedure TfrmPrincipal.mnuCadSeguradoraClick(Sender: TObject);
begin
	inherited;
   AbrirForm(frmPessoaSeguradora, TfrmPessoaSeguradora, False);
end;

procedure TfrmPrincipal.mnuCadParamIntegraClick(Sender: TObject);
begin
	inherited;
   if VerificaTransacao then
      AbrirForm(frmCadParamIntegraRec, TfrmCadParamIntegraRec, False);
end;
                                         
procedure TfrmPrincipal.mnuCadRecebPatroClick(Sender: TObject);
begin
   inherited;
	AbrirForm(frmCadCCBaixaXPatro, TfrmCadCCBaixaXPatro, False);
end;

procedure TfrmPrincipal.mnuCancInscricaoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmCancInscricao, TfrmCancInscricao, False);
end;

procedure TfrmPrincipal.mnuConsRecebePatroClick(Sender: TObject);
begin
   inherited;
	AbrirForm(frmRelRecebPatro, TfrmRelRecebPatro, False);
end;

procedure TfrmPrincipal.mnuExecCalcDiaClick(Sender: TObject);
begin
   inherited;
   if Sistema.TipoCliente = 19991 then
      AbrirForm(frmExecAtualizaDiariaNova, TfrmExecAtualizaDiariaNova, False)
   else
      AbrirForm(frmExecAtualizaDiaria, TfrmExecAtualizaDiaria, False);
end;

procedure TfrmPrincipal.mnuCancRecebimentoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmCancRecebimento, TfrmCancRecebimento, False);
end;

procedure TfrmPrincipal.mnuCadTipoSuspensaoClick(Sender: TObject);
begin
   inherited;
	AbrirForm(frmCadTipoSuspensao, TfrmCadTipoSuspensao, False);
end;

procedure TfrmPrincipal.mnuTipoSuspXTipoContrClick(Sender: TObject);
begin
   inherited;
	AbrirForm(frmCadTipoContrXSusp, TfrmCadTipoContrXSusp, False);
end;

procedure TfrmPrincipal.mnuLiberaSuspensaoClick(Sender: TObject);
begin
   inherited;
	AbrirForm(frmExecLiberaSuspensao, TfrmExecLiberaSuspensao, False);
end;

procedure TfrmPrincipal.mnuExecAlteraConcessaoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmExecAlteraConcessao, TfrmExecAlteraConcessao, False);
end;

procedure TfrmPrincipal.mnuSuspensaoConcessaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmSuspensaoConcessao, TfrmSuspensaoConcessao, False);
end;

procedure TfrmPrincipal.mnuContratoPadraoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadastroContratoPadrao, TfrmCadastroContratoPadrao, False);
end;

procedure TfrmPrincipal.mnuAssinaturaContratoClick(Sender: TObject);
begin
   inherited;
   if ExisteForm(frmAssinaturaContrato) then Exit;

   Application.CreateForm(TfrmAssinaturaContrato, frmAssinaturaContrato);
   frmAssinaturaContrato.FormStyle := fsMDIChild;
   frmAssinaturaContrato.Show;
end;

procedure TfrmPrincipal.mnuHistoricoSuspensaoClick(Sender: TObject);
begin
   inherited;
   if ExisteForm(frmHistoricoSuspensaoCob) then Exit;

   Application.CreateForm(TfrmHistoricoSuspensaoCob, frmHistoricoSuspensaoCob);
   frmHistoricoSuspensaoCob.FormStyle := fsMDIChild;
   frmHistoricoSuspensaoCob.Show;
end;

procedure TfrmPrincipal.mnuExecEntradaManualClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecEntradaManual, TfrmExecEntradaManual, False);
end;

procedure TfrmPrincipal.mnuExecLancaAlteradorEPClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecLancaAlteradorEP, TfrmExecLancaAlteradorEP, False);
end;

procedure TfrmPrincipal.mnuExecTrataItemNaoRecebidoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmExecTrataItemNaoRecebido, TfrmExecTrataItemNaoRecebido, False);
end;

procedure TfrmPrincipal.mnuExecDevolucaoLoteClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecDevolucaoLote, TfrmExecDevolucaoLote, False);
end;

procedure TfrmPrincipal.mnuConsLogTotalPrevClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmRelLogTotalPrev, TfrmRelLogTotalPrev, False);
end;

procedure TfrmPrincipal.mnuConsTMPDESCClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmRelTMPDESC, TfrmRelTMPDESC, False);
end;

procedure TfrmPrincipal.mnuExecContabilizaLoteConcessaoClick(Sender: TObject);
begin
   inherited;

   // Verificação da integração contábil
   // Caso contrário, não faz sentido chamar a tela
   ParametrosSistema;
   if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 0 then
   begin
      MsgDlg('O Sistema não está parametrizado para gerar integração contábil.', 'Empréstimo',
             mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   end;

   AbrirForm(frmExecContabilizaLoteConcessao, TfrmExecContabilizaLoteConcessao, False);
end;

procedure TfrmPrincipal.mnuExecContabilizaLotePrestacaoClick(Sender: TObject);
begin
   inherited;
   // Verificação da integração contábil
   // Caso contrário, não faz sentido chamar a tela
   ParametrosSistema;
   if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 0 then
   begin
      MsgDlg('O Sistema não está parametrizado para gerar integração contábil.', 'Empréstimo',
             mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   end;

   AbrirForm(frmExecContabilizaLotePrestacao, TfrmExecContabilizaLotePrestacao, False);
end;

procedure TfrmPrincipal.mnuExecContabilizaLoteQuitacaoClick(Sender: TObject);
begin
   inherited;

   // Verificação da integração contábil
   // Caso contrário, não faz sentido chamar a tela
   ParametrosSistema;
   if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 0 then
   begin
      MsgDlg('O Sistema não está parametrizado para gerar integração contábil.', 'Empréstimo',
             mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   end;
   //C:\ProjetosCM5\EMPRESTIMO\Fontes\FExecContabilizaLoteQuitacao
   AbrirForm(frmExecContabilizaLoteQuitacao, TfrmExecContabilizaLoteQuitacao, False);
end;

procedure TfrmPrincipal.mnuExecContabilizaLoteEncargosClick(Sender: TObject);
begin
   inherited;

   // Verificação da integração contábil
   // Caso contrário, não faz sentido chamar a tela
   ParametrosSistema;
   if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 0 then
   begin
      MsgDlg('O Sistema não está parametrizado para gerar integração contábil.', 'Empréstimo',
             mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   end;

   AbrirForm(frmExecContabilizaLoteEncargo, TfrmExecContabilizaLoteEncargo, False);
end;

procedure TfrmPrincipal.mnuExecContabilizaLoteAmortizacaoClick(Sender: TObject);
begin
   inherited;

   // Verificação da integração contábil
   // Caso contrário, não faz sentido chamar a tela
   ParametrosSistema;
   if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 0 then
   begin
      MsgDlg('O Sistema não está parametrizado para gerar integração contábil.', 'Empréstimo',
             mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   end;

   AbrirForm(frmExecContabilizaLoteAmortizacao, TfrmExecContabilizaLoteAmortizacao, False);
end;

procedure TfrmPrincipal.mnuCalculoRepasseSeguroClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCalculoRepasse, TfrmCalculoRepasse, False);
end;

procedure TfrmPrincipal.mnuLancaDepositoSeguroClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmLancaDeposito, TfrmLancaDeposito, False);
end;

procedure TfrmPrincipal.mnuExecCadVerbaPlanoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadVerbaPlano, TfrmCadVerbaPlano, False);
end;

procedure TfrmPrincipal.mnuExecCadUnidCentrClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadUnidCentr, TfrmCadUnidCentr, False);
end;

procedure TfrmPrincipal.mnuExecTipoContrXPlanoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPlanTipCont, TfrmCadPlanTipCont, False);
end;

procedure TfrmPrincipal.mnuExecCadUnidPlanoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadVerbasNovo, TfrmCadVerbasNovo, False);
end;

procedure TfrmPrincipal.mnuCadCartaCobrancaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmDesenhoRelCartaCobrEP, TfrmDesenhoRelCartaCobrEP, False);
   frmDesenhoRelCartaCobrEP.HabilitaImpressao(False);
end;

procedure TfrmPrincipal.mnuRelCartaCobrancaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(cfgRelCartaCobrEP, TcfgRelCartaCobrEP, False);
end;

procedure TfrmPrincipal.mnuCadBancoXPortadorFormaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadBancoPortador, TfrmCadBancoPortador, False);
end;

procedure TfrmPrincipal.mnuExecGeraArquivoBancoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecGeraArquivoRemessa, TfrmExecGeraArquivoRemessa, False);
end;

procedure TfrmPrincipal.mnuExecEnvioLoteConcessaoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmExecEnvioLoteConcessao, TfrmExecEnvioLoteConcessao, False);
end;

procedure TfrmPrincipal.btnREFERClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecConcessaoREFER, TfrmExecConcessaoREFER, False);
end;

procedure TfrmPrincipal.mnuCancEnvioLoteConcessaoClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmCancEnvioLoteConcessao, TfrmCancEnvioLoteConcessao, False);
end;

procedure TfrmPrincipal.mnuCancContabilizaLoteConcessaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCancContabLoteConcessao, TfrmCancContabLoteConcessao, False);
end;

procedure TfrmPrincipal.mnuCancContabilizaLotePrestacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCancContabLotePrestacao, TfrmCancContabLotePrestacao, False);
end;

procedure TfrmPrincipal.mnuCancContabilizaLoteAmortizacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCancContabLoteAmortizacao, TfrmCancContabLoteAmortizacao, False);
end;

procedure TfrmPrincipal.mnuCancContabilizaLoteQuitacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCancContabLoteQuitacao, TfrmCancContabLoteQuitacao, False);
end;

procedure TfrmPrincipal.mnuCancContabilizaLoteEncargosClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCancContabLoteEncargo, TfrmCancContabLoteEncargo, False);
end;

procedure TfrmPrincipal.mnuExecLiberaConcessaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecLiberaConcessao, TfrmExecLiberaConcessao, False);
end;

procedure TfrmPrincipal.mnuExecCalculaSegClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecCalculaSegCompl, TfrmExecCalculaSegCompl, False);
end;

procedure TfrmPrincipal.mnuExecEnvioSeguroClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmExecEnvioLoteSeguro, TfrmExecEnvioLoteSeguro, False);
end;

procedure TfrmPrincipal.mnuCadTipoContrXQuitClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmCadTipoContrXTipoContr, TfrmCadTipoContrXTipoContr, False);
end;

procedure TfrmPrincipal.mnuExecContabilizaLoteAtuDiaClick(Sender: TObject);
begin
   inherited;
   // Verificação da integração contábil
   // Caso contrário, não faz sentido chamar a tela
   ParametrosSistema;
   if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 0 then
   begin
      MsgDlg('O Sistema não está parametrizado para gerar integração contábil.', 'Empréstimo',
             mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   end;

   AbrirForm(frmExecContabilizaLoteAtuDia, TfrmExecContabilizaLoteAtuDia, False);
end;

procedure TfrmPrincipal.mnuCancContabilizaLoteAtuDiaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCancContabLoteAtuDia, TfrmCancContabLoteAtuDia, False);
end;

procedure TfrmPrincipal.mnuExecEstornoIndividualClick(Sender: TObject);
begin
   inherited;
   if VerificaTransacao then AbrirForm(frmExecEstornoIndividual, TfrmExecEstornoIndividual, False);
end;

procedure TfrmPrincipal.mnuExecTrataInesperadoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecTrataInesperado, TfrmExecTrataInesperado, False);
end;

procedure TfrmPrincipal.mnuExecContabilizaAjusteDiaClick(Sender: TObject);
begin
   inherited;
   // Verificação da integração contábil
   // Caso contrário, não faz sentido chamar a tela
   ParametrosSistema;
   if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 0 then
   begin
      MsgDlg('O Sistema não está parametrizado para gerar integração contábil.', 'Empréstimo',
             mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   end;

   AbrirForm(frmExecContabilizaLoteAjuste, TfrmExecContabilizaLoteAjuste, False);
end;

procedure TfrmPrincipal.mnuCancContabilizaAjusteDiaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCancContabLoteAjuste, TfrmCancContabLoteAjuste, False);
end;

procedure TfrmPrincipal.mnuExecArqSuspensaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecArqSupensaoCobranca, TfrmExecArqSupensaoCobranca, False);
end;

procedure TfrmPrincipal.mnuExecArquivoCriticaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCriticaCaixa, TfrmCriticaCaixa, False);
end;

procedure TfrmPrincipal.mnuExecLerSIAFIClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmLerArquivoSIAFI, TfrmLerArquivoSIAFI, False);
end;

procedure TfrmPrincipal.mnuExecGravarSIAFIClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmGerarArquivoSIAFI, TfrmGerarArquivoSIAFI, False);
end;

procedure TfrmPrincipal.mnuExecArquivoInadimplenteClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecValorAtualizadoArquivo, TfrmExecValorAtualizadoArquivo, False);
end;

procedure TfrmPrincipal.mnuExecGeraArquivoMargem13Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecGeraArquivoMargem13, TfrmExecGeraArquivoMargem13, False);
end;

procedure TfrmPrincipal.mnuExecLancParcAtuClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecLancaParcAtu, TfrmExecLancaParcAtu, False);
end;

procedure TfrmPrincipal.mnuItemXProcessoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadItemXProcesso, TfrmCadItemXProcesso, False);
end;

procedure TfrmPrincipal.mnuCancEnvioSeguroClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCancEnvioLoteSeguro, TfrmCancEnvioLoteSeguro, False);
end;

procedure TfrmPrincipal.mnuExecCalculaValorMaximoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCalculaValorMaximo, TfrmCalculaValorMaximo, False);
end;

procedure TfrmPrincipal.mnuExecCalculaValorDevidoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCalculaValorDevido, TfrmCalculaValorDevido, False);

end;

procedure TfrmPrincipal.mnuCancAlteraConcessaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCancAlteracaoConcessao, TfrmCancAlteracaoConcessao, False);
end;

//==================================================================================================
//==================================================================================================
//==================================================================================================

procedure TfrmPrincipal.mnuRelProvPerdaFUNCEFSintClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TcfgRelProvPerdaFUNCEF, cfgRelProvPerdaFUNCEF);

   with cfgRelProvPerdaFUNCEF do
   begin
      sAnalSint := 'S';
      ShowModal;
   end;
end;


procedure TfrmPrincipal.mnuRelProvPerdaFUNCEFAnalClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TcfgRelProvPerdaFUNCEF, cfgRelProvPerdaFUNCEF);

   with cfgRelProvPerdaFUNCEF do
   begin
      sAnalSint := 'A';
      ShowModal;
   end;
end;



procedure TfrmPrincipal.mnuRelProvPerdaOutrosAnalClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TcfgRelProvPerdaOutros, cfgRelProvPerdaOutros);

   with cfgRelProvPerdaOutros do
   begin
      sAnalSint := 'A';
      ShowModal;
   end;
end;



procedure TfrmPrincipal.mnuRelProvPerdaOutrosSintClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TcfgRelProvPerdaOutros, cfgRelProvPerdaOutros);

   with cfgRelProvPerdaOutros do
   begin
      sAnalSint := 'S';
      ShowModal;
   end;
end;

//==================================================================================================
//==================================================================================================
//==================================================================================================



//==================================================================================================
//==================================================================================================
//==================================================================================================



procedure TfrmPrincipal.btnResgateClick(Sender: TObject);
var
   fSaldoAtualizado : Currency;
   fSaldoDevedor    : Currency;
   fParcelasAberto  : Currency;

   sData    : String;
   sDataHoje: String;
   dData    : TDateTime;

   iLote    : Integer;
   iPessoa  : Int64;

   // Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
   sErro    : String;
begin
   inherited;

   try
      // Busca o Mutuário para o resgate -----------------------------------------------------------
      dtmMS.MS_Mutuario.Executar;
      Repaint;

      if not(dtmMS.MS_Mutuario.RetornouValor) then Exit;

      iPessoa  := StrToInt(dtmMS.MS_Mutuario.ValoresChave[0]);
      Application.ProcessMessages;
      // -------------------------------------------------------------------------------------------


      // Pergunta a Data para o resgate ------------------------------------------------------------
      try
         sDataHoje:= FormatDateTime('dd/mm/yyyy', Sysdate);
         sData    := InputBox('Data do Resgate', 'Informar a Data do Resgate (dd/mm/aaaa):', sDataHoje);
         Repaint;
         dData    := StrToDate(sData);
      except
         MsgDlg('A Data do Resgate foi informada incorretamente!' + #13 +
               'O processo será interrompido.', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;
      // -------------------------------------------------------------------------------------------


      // Verifica o valor de quitação na data escolhida --------------------------------------------
      if dtmDividaEP.ValorDevidoMutuario(iPessoa,
                                         dData,
                                         -1, //
                                         10,
                                         fSaldoAtualizado,
                                         fSaldoDevedor,
                                         fParcelasAberto,
                                         False,
                                         True) then
      begin
         Application.ProcessMessages;

         ShowMessage('Saldo:               '    + FormatFloat('#,0.00', fSaldoDevedor) + #13 +
                     'Itens em Aberto: '        + FormatFloat('#,0.00', fParcelasAberto) + #13 +
                     'Atualizado:        '      + FormatFloat('#,0.00', fSaldoAtualizado) + #13 + #13 +
                     '                                        em ' + sData);
         Repaint;
      end
      else
      begin
         Exit;
      end;
      // -------------------------------------------------------------------------------------------


      // Se houver valor a quitar, pergunta se se deseja continuar e dispara o processo ------------
      if fSaldoAtualizado > 0 then
      begin
         if MsgDlg('Deseja prosseguir?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mryes then
         begin
            Repaint;

            // Pergunta o lote (da Folha - necessário) onde vai o valor de quitação ----------------
            try
               iLote := StrToInt(InputBox('Lote de Pagamento', 'Informar o Lote para pagamento:', ' '));
            except
               MsgDlg('O Lote de Pagamento foi informado incorretamente!' + #13 +
                     'O processo será interrompido.', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;
            // -------------------------------------------------------------------------------------

            StartTransacao;

            // Dispara a quitação e envio ----------------------------------------------------------
            // Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
            if not(dtmDividaEP.QuitaContratosMutuario(iPessoa, dData, -1, 10, 'B', iLote, sErro)) then
            begin
               RollbackTransacao;

               MsgDlg(sErro  + #13 +
                      'Houve ERRO na Quitação ou Envio para a Folha!' + #13 +
                      'O processo será interrompido.', 'Empréstimo', mtError, [mbOk], 0);
               // Fim Pendência 19997
               Repaint;
               Exit;
            end
            else
            begin
               CommitTransacao;

               MsgDlg('Quitação e Envio para a Folha concluídos.', 'Empréstimo', mtInformation, [mbOk], 0);
               Repaint;
            end;
            // -------------------------------------------------------------------------------------


         end; // if MsgDlg

      end; // if fSaldoAtualizado > 0
      // -------------------------------------------------------------------------------------------

   finally
      Repaint;
      Application.ProcessMessages;
   end;
end;



procedure TfrmPrincipal.btnCancelaResgateClick(Sender: TObject);
var
   sData    : String;
   sDataHoje: String;
   dData    : TDateTime;

   iResult  : Integer;

   iPessoa  : Int64;
begin
   inherited;

   try

      // Busca o Mutuário para o resgate -----------------------------------------------------------
      dtmMS.MS_Mutuario.Executar;
      Repaint;

      if not(dtmMS.MS_Mutuario.RetornouValor) then Exit;

      iPessoa  := StrToInt(dtmMS.MS_Mutuario.ValoresChave[0]);
      Application.ProcessMessages;
      // -------------------------------------------------------------------------------------------


      // Pergunta a Data para o resgate ------------------------------------------------------------
      try
         sDataHoje:= FormatDateTime('dd/mm/yyyy', Sysdate);
         sData    := InputBox('Data do Resgate', 'Informar a Data do Resgate (dd/mm/aaaa):', sDataHoje);
         Repaint;
         dData    := StrToDate(sData);
      except
         MsgDlg('A Data do Resgate foi informada incorretamente!' + #13 +
               'O processo será interrompido.', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;
      // -------------------------------------------------------------------------------------------


      if MsgDlg('Deseja prosseguir?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         Repaint;

         iResult := dtmDividaEP.DesfazQuitacaoMutuario(iPessoa, dData, 10);

         Case iResult of

            -5:
            begin
               MsgDlg('Não foi possível cancelar a Quitação.', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;

            -4:
            begin
               MsgDlg('Ocorreu um ERRO ao atualizar a situação contratual.' + #13 +
                      'Processo interrompido.', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;

            -2:
            begin
               MsgDlg('Não é possível cancelar a Quitação: o montante da Quitação já foi recebido.', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;
               Exit;
            end;

            -1:
            begin
               MsgDlg('Não foi encontrado registro de Quitação.', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;
               Exit;
            end;

            0:
            begin
               MsgDlg('Quitação e Envio para a Folha desfeitos.', 'Empréstimo', mtInformation, [mbOk], 0);
               Repaint;
            end;

         end; // Case iResult
         // -------------------------------------------------------------------------------------

      end; // if MsgDlg

   finally
      Repaint;
      Application.ProcessMessages;
   end;
end;



procedure TfrmPrincipal.btnQuitaMorteClick(Sender: TObject);
var
   fSaldoAtualizado : Currency;
   fSaldoDevedor    : Currency;
   fParcelasAberto  : Currency;

   sData       : String;
   sDataHoje   : String;
   dDataQuita  : TDateTime;
   dDataMorte  : TDateTime;

   iLote       : Integer;
   iPessoa     : Int64;

   //Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
   sErro    : String;
begin
   inherited;

   try
      // Busca o Mutuário para o resgate -----------------------------------------------------------
      dtmMS.MS_Mutuario.Executar;
      Repaint;

      if not(dtmMS.MS_Mutuario.RetornouValor) then Exit;

      iPessoa  := StrToInt(dtmMS.MS_Mutuario.ValoresChave[0]);
      Application.ProcessMessages;
      // -------------------------------------------------------------------------------------------


      // Pergunta a Data para o resgate ------------------------------------------------------------
      try
         sDataHoje   := FormatDateTime('dd/mm/yyyy', Sysdate);
         sData       := InputBox('Data do Resgate', 'Informar a Data de Quitação (dd/mm/aaaa):', sDataHoje);
         Repaint;
         dDataQuita  := StrToDate(sData);
      except
         MsgDlg('A Data do Resgate foi informada incorretamente!' + #13 +
               'O processo será interrompido.', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;
      // -------------------------------------------------------------------------------------------

      // Pergunta a Data da morte ------------------------------------------------------------------
      try
         sDataHoje   := FormatDateTime('dd/mm/yyyy', Sysdate);
         sData       := InputBox('Data do Resgate', 'Informar a Data do Óbito (dd/mm/aaaa):', sDataHoje);
         Repaint;
         dDataMorte  := StrToDate(sData);
      except
         MsgDlg('A Data do Resgate foi informada incorretamente!' + #13 +
               'O processo será interrompido.', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;
      // -------------------------------------------------------------------------------------------

      // Verifica o valor de quitação na data escolhida --------------------------------------------
      if dtmDividaEP.ValorDevidoMutuario(iPessoa,
                                         dDataQuita,
                                         dDataMorte, //
                                         8,
                                         fSaldoAtualizado,
                                         fSaldoDevedor,
                                         fParcelasAberto,
                                         False,
                                         True
                                        ) then
      begin
         Application.ProcessMessages;

         ShowMessage('Saldo:               '    + FormatFloat('#,0.00', fSaldoDevedor) + #13 +
                     'Itens em Aberto: '        + FormatFloat('#,0.00', fParcelasAberto) + #13 +
                     'Atualizado:        '      + FormatFloat('#,0.00', fSaldoAtualizado) + #13 + #13 +
                     '                                        em ' + sData);
         Repaint;
      end
      else
      begin
         Exit;
      end;
      // -------------------------------------------------------------------------------------------


      // Se houver valor a quitar, pergunta se se deseja continuar e dispara o processo ------------
      if fSaldoAtualizado > 0 then
      begin
         if MsgDlg('Deseja prosseguir?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mryes then
         begin
            Repaint;

            // Pergunta o lote (da Folha - necessário) onde vai o valor de quitação ----------------
            try
               iLote := StrToInt(InputBox('Lote de Pagamento', 'Informar o Lote para pagamento:', ' '));
            except
               MsgDlg('O Lote de Pagamento foi informado incorretamente!' + #13 +
                     'O processo será interrompido.', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;
            // -------------------------------------------------------------------------------------

            StartTransacao;

            // Dispara a quitação e envio ----------------------------------------------------------
            if not(dtmDividaEP.QuitaContratosMutuario(iPessoa,
                                                      dDataQuita,
                                                      dDataMorte,
                                                      8,
                                                      'B',
            //Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
                                                      iLote,
                                                      sErro
                                                     )) then
            begin
               RollbackTransacao;

               //MsgDlg('Houve ERRO na Quitação ou Envio para a Folha!' + #13 +
               //       'O processo será interrompido.', 'Empréstimo', mtError, [mbOk], 0);
               MsgDlg(sErro  + #13 +
                      'Houve ERRO na Quitação ou Envio para a Folha!' + #13 +
                      'O processo será interrompido.', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end
            else
            begin
               CommitTransacao;

               MsgDlg('Quitação e Envio para a Folha concluídos.', 'Empréstimo', mtInformation, [mbOk], 0);
               Repaint;
            end;
            // -------------------------------------------------------------------------------------


         end; // if MsgDlg

      end; // if fSaldoAtualizado > 0
      // -------------------------------------------------------------------------------------------

   finally
      Repaint;
      Application.ProcessMessages;
   end;
end;



procedure TfrmPrincipal.mnuExecAcertaSituacaoClick(Sender: TObject);
var
   sData          : String;
   sSQL           : String;
   i              : Integer;
   qryContratos   : TwwQuery;
begin
   inherited;

   // Pergunta a Data ---------------------------------------------------------------------------
   try
      sData    := InputBox('Data de Movimentação', 'Informar a Data de Movimentação (dd/mm/aaaa):', sData);
      Repaint;
   except
      MsgDlg('A Data foi informada incorretamente!' + #13 +
            'O processo será interrompido.', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;
   // -------------------------------------------------------------------------------------------


   try
      qryContratos               := TwwQuery.Create(Application);
      qryContratos.DatabaseName  := 'BaseDados';

      sSQL :=
      //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
      'SELECT '                                                                                    + #13 +
      //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
      '   IDCONTRATOEMPTMO '                                                                       + #13 +
      'FROM '                                                                                      + #13 +
      '   CONTRATOEMPTMO CON '                                                                     + #13 +
      'WHERE '                                                                                     + #13 +
      '   EXISTS '                                                                                 + #13 +
      '   ( '                                                                                      + #13 +
      '   SELECT '                                                                                 + #13 +
      '      HME.IDCONTRATOEMPTMO '                                                                + #13 +
      '   FROM '                                                                                   + #13 +
      '      HISTMOVEMPTMO HME '                                                                   + #13 +
      '   WHERE '                                                                                  + #13 +
      '          HME.HMEDATAPREVISTA     >= TO_DATE( ' + QuotedStr(sData) + ', ''DD/MM/YYYY'') '   + #13 +
      '      AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                    + #13 +
      '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                    + #13 +
      '   ) ';

      with qryContratos do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
         Open;
      end;

      if MsgDlg('Serão atualizados ' + FormatFloat('#,0', qryContratos.RecordCount) + 'Contratos.' +
                #13 + #13 + 'Deseja realmente prosseguir?',
                'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;

      Repaint;


      if not(qryContratos.IsEmpty) then
      begin
         qryContratos.First;

         i := 0;

         frmProgresso.MostraFormProgresso('Atualizando Situação Contratual...',
                                          True,
                                          True,
                                          True,
                                          0,
                                          qryContratos.RecordCount
                                         );

         while not(qryContratos.EOF) do
         begin
            if frmProgresso.Cancelou then Exit;

            CalcEmptmo.AcertaSituacaoContratual(qryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat);

            inc(i);
            frmProgresso.AndaFormProgresso(i);

            qryContratos.Next;
         end;

         MsgDlg('Situação atualizada.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;

      end;

   finally
      frmProgresso.EscondeFormProgresso;

      qryContratos.Close;
      qryContratos.Free;
   end;
end;



procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   inherited;

   InicializaEP;

   CarregaParametros;
end;



procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FinalizaEP;
   inherited;
end;

//==================================================================================================






procedure TfrmPrincipal.mnuPortFormaxEmptmoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPortFormaxEmptmo, TfrmCadPortFormaxEmptmo, False);
end;



function TfrmPrincipal.ExisteForm(frm: TForm): Boolean;
var
   i: Integer;
begin
   Result := False;
   for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i] = frm then
      begin
         Result := True;
         Break;
      end;
end;



procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);

 var CmCtrlRptCentralAP :TCmCtrlRptCentralAP;
begin
  inherited;
  //Renato Visoni SOL 103239 KINTANA 468105
  CmCtrlRptCentralAP := TCmCtrlRptCentralAP.Create;
  try
    Printed := ShowReport(IdReports, CmCtrlRptCentralAP);
  finally
    CmCtrlRptCentralAP.Free;
  end;
  ////Renato Visoni SOL 103239 KINTANA 468105


end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin

  //Renato Visoni SOL 103239 KINTANA 468105
  case IdReports of
    3348: FrmPreviewReports := TfrmPRel2ViaCChequeMT.Create(Self);
  else
    FrmPreviewReports := nil;
  end;
  //Renato Visoni SOL 103239 KINTANA 468105
  
  inherited;

end;

procedure TfrmPrincipal.mnuQuitaoemLoteClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmQuitacaoLote, TfrmQuitacaoLote, False);
end;

procedure TfrmPrincipal.mnuValorMaximodePrestaoporParticipanteClick(
  Sender: TObject);
begin
  inherited;

  AbrirForm(FrmValorMaximoPrestacao, TFrmValorMaximoPrestacao, False);

end;

procedure TfrmPrincipal.mnuProvisoparaPerdasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmProvPerdas, TFrmProvPerdas, False);
end;

//BRUNO AZEVEDO SOL 138228 Kintana 843767
procedure TfrmPrincipal.mnuRelEvolucaoContratoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmEvolucaoContrato, frmEvolucaoContrato);
  with frmEvolucaoContrato do begin
    ShowModal;
  end;
end;
//BRUNO AZEVEDO SOL 138228 Kintana 843767

//BRUNO AZEVEDO SOL 138232 Kintana 843720
procedure TfrmPrincipal.mnuRelEmprestimosQuitadosClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmEmprestimosQuitados, frmEmprestimosQuitados);
  with frmEmprestimosQuitados do begin
    ShowModal;
  end;
end;
//BRUNO AZEVEDO SOL 138232 Kintana 843720

procedure TfrmPrincipal.mnuManutenodoArquivoContratoadClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmManutContratoAd, TFrmManutContratoAd, False);
end;

procedure TfrmPrincipal.mnuMapaMovimentaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMapaMovimentacao, TFrmMapaMovimentacao, False);
end;

//Ádler Souza - SOL 138233 Kintana 843723
procedure TfrmPrincipal.mnuSaldoResidualClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmSaldoResidual, FrmSaldoResidual);
  with FrmSaldoResidual do begin
    ShowModal;
  end;
end;
//Ádler Souza - SOL 138233 Kintana 843723

procedure TfrmPrincipal.mnuEventosCobrancasClick(Sender: TObject);
begin
  inherited;
  if VerificaTransacao then AbrirForm(frmCadastroEventoCobrancaEP, TfrmCadastroEventoCobrancaEP, False);
end;

procedure TfrmPrincipal.mnuHistoricoEventoCobrancaClick(Sender: TObject);
begin
  inherited;
  if VerificaTransacao then AbrirForm(FrmEventoCobrancaContrato, TFrmEventoCobrancaContrato, False);
end;

//BRUNO AZEVEDO SOL 92995 KINTANA 569455
procedure TfrmPrincipal.mnuAjusteFormaEnvioClick(Sender: TObject);
begin
  inherited;
  if VerificaTransacao then AbrirForm(frmAjusteFormaEnvio, TfrmAjusteFormaEnvio, False);
end;
//BRUNO AZEVEDO SOL 92995 KINTANA 569455

//MARCELO ALMEIDA - SOL 136411 - KINTANA - 815862
procedure TfrmPrincipal.mnuFinanciamentoHabitacionalClick(Sender: TObject);
begin
  inherited;
  if VerificaTransacao then AbrirForm(frmDesbloquearMutuario, TfrmDesbloquearMutuario, False);
end;
//MARCELO ALMEIDA - SOL 136411 - KINTANA - 815862

procedure TfrmPrincipal.mnuExecTrataParcAtrasoClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecTrataParcAtraso, TfrmExecTrataParcAtraso, False);
end;

procedure TfrmPrincipal.mnuBloqConcPlanPrevClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadSuspConcPlaPrev, TfrmCadSuspConcPlaPrev, False);
end;

//MARCIO SANCHES SPINOSA - SOL 168737 - KINTANA - 1491532 - INICIO
procedure TfrmPrincipal.mnuTratamentodeExcessodeDbitoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecEnvioExcessoCobranca, TfrmExecEnvioExcessoCobranca, False);
end;
//MARCIO SANCHES SPINOSA - SOL 168737 - KINTANA - 1491532 - FIM

// TADEU SOL 182258 KINTANA 1697187
procedure TfrmPrincipal.mnuPagamentoEmprestimoResgateClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPagtoEmprestimoResgate, TfrmPagtoEmprestimoResgate, False);
end;

procedure TfrmPrincipal.mnuRecebimentoEmprestimoResgateClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmRecebtoEmprestimoResgate, TfrmRecebtoEmprestimoResgate, False);
end;
// TADEU SOL 182258 KINTANA 1697187

procedure TfrmPrincipal.mnuProcessaEventosCobrancaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmProcessaEventoCobranca, TfrmProcessaEventoCobranca, False)
end;

// TADEU PASSOS SOL 178225 KINTANA 1638799
procedure TfrmPrincipal.mnuRelatrioInadimplenciaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCRelInadimplencia, TfrmCRelInadimplencia, False);
end;
// TADEU PASSOS SOL 178225 KINTANA 1638799

procedure TfrmPrincipal.mnuMotivodeBloqueiodeConcessoClick(Sender: TObject);
begin
  inherited;
 AbrirForm(frmCadMotivoConcessao, TfrmCadMotivoConcessao, False);
end;

//Início - William Santana - SOL 219116/16182 PPM 422309
procedure TfrmPrincipal.mnuAdicionarInforEventosCobrancaClick(
  Sender: TObject);
begin
  inherited;
   AbrirForm(FrmInfoEventoCobranca, TFrmInfoEventoCobranca, False);
end;
//Término - William Santana - SOL 219116/16182 PPM 422309

// Felipe A. Santos SOL 258330/17859 PPM 1132081 - início
procedure TfrmPrincipal.mnuRestrCobClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRestrCobranca, TfrmRestrCobranca, False);
end;
// Felipe A. Santos SOL 258330/17859 PPM 1132081 - fim

//edilaine - SIG56660 - inicio
procedure TfrmPrincipal.mnuTransferePerfilClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmTransferePerfilInvest, TfrmTransferePerfilInvest, False);
end;
//edilaine - SIG56660 - fim
procedure TfrmPrincipal.mnuRemessaEletronicaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRemessaEletronica, TfrmRemessaEletronica, False);
end;

procedure TfrmPrincipal.mnuImportacaoIrFinancHabitacionalClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmImportacaoIRHabitacional, TFrmImportacaoIRHabitacional, False);
end;

procedure TfrmPrincipal.mnuAlteraoEmLotedaDatadeVencimentoClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAlteracaoLoteDataVencimento, TFrmAlteracaoLoteDataVencimento, False);
end;

procedure TfrmPrincipal.mnuImportaodoArquivoeGeraodoRelatrioSICOVClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmEmpSicov, TFrmEmpSicov, False);
end;

procedure TfrmPrincipal.mmuImportaodoInformedeIR1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmImportacaoInformeIR, TFrmImportacaoInformeIR, False);
end;

procedure TfrmPrincipal.mnuCadMensagemContratoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadMensagemContrato, TfrmCadMensagemContrato, False); // Leandro WO15681
end;

initialization

   Sistema.NomeModulo      := 'Empréstimo'; // Nome do módulo
   Sistema.IdModulo        := 15;           // IdModulo cadastrado no SAD
   Sistema.Versao          := '3.01.18p';
   Sistema.NomeAplicativo  := 'Emprestimo';

   IntegraBack             := TIntegraBack.Create(True, True, True) ;
   Modulo                  := TModulo.Create;
   IntegraModulo           := TIntegraModulo.Create;


finalization

   Modulo.free;
   IntegraModulo.Free;

end.
