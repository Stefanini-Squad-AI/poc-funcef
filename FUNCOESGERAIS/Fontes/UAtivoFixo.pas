unit uAtivoFixo;

//----------------------------------------------------------------------------------------
//  ATENÇÃO: uAtivoFixo NECESSITA do DataModule dAtivoFixo/dtmAtivoFixo
//----------------------------------------------------------------------------------------
//
//	  uAtivoFixo
//
//   Autor :  Sergio Fernandes
//
//   PROCEDIMENTOS PRINCIPAIS
//
//   ExecutaEntrada
//   ExecutaEntradaBem
//   ExecutaEntradaTotal
//   EstornaEntrada
//   ExecutaBaixa
//   EstornaBaixa
//   ExecutaReavaliacao
//   EstornaReavaliacao
//   EstornaDepreciacao
//   ExecutaAcrescimo
//   EstornaAcrescimo
//   ExecutaTransfLocal
//   ExecutaTransfConjunto
//   ExecutaTransfGrupo
//   EstornaTransfGrupo
//   ExecutaTransfPlaca
//   CalculaSaldoContabil
//
//   PROCEDIMENTOS AUXILIARES
//
//   RegistraEntrada
//   RegistraEntradaTotal
//   GeraProxPlacaTomb
//   ContabilizaEntrada
//   ContabilizaEntradaReav
//   RegistraBaixaBem
//   ContabilizaBaixa
//   ContabilizaResultadoBaixa
//   RegistraReavaliacao
//   RegistraReaval
//   RegistraReavalReaval
//   RegistraReavalAcresc
//   ContabilizaReavaliacao
//   RegistraAcrescimo
//   RegistraAcresc
//   ContabilizaAcrescimo
//   RegistraMovimentacao
//   RegistraValorMovimentacao
//   ExecutaDepreciacao
//   RegistraDeprec
//   ContabilizaDepreciacao
//   ParamFatorPeriodo
//   RegistraTransfLocal
//   RegistraTransfConj
//   RegistraTransfGrupo
//   RegistraTransfPlaca
//   ComplZeros
//   TiraCaracter
//   CompletaZeros
//   Cotacao_Moeda
//   CalculaTaxaDep
//   IntegraContab
//   RemovePlanContab
//   Localiza_ContaeCentroCusto
//   Busca_Grupo
//   ContaPossuiCCust
//   VerificaPeriodoContabil
//   MontaLancamento
//   RegistraPlanilhaContabil
//   GeraTipoMovimentacao
//   ContabilizaTransferencia
//   ContabilizaTransf
//
//----------------------------------------------------------------------------------------

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, wwQuery, uMensErro, dbTables, uCmConectaBanco, CMDataBase;

type

   TAtivoFixo = Class(TObject)

   private

   //=====================================================================================
   // Entrada
   //-------------------------------------------------------------------------------------
   function RegistraEntrada(iIdBemAlt, iModulo, iEmpresaProp, iConjunto, iTerceiro, iGrupo,
            iSubConta, iAtivProjeto, iClasseBem, iItensRecDev, iFornec, iImagem : integer;
            fPlaca : double; iSituacao : integer; sRegistro, sControle, sDescBem, sIdNota,
            sComplNota, sNumSerie : string; dDataNota, dDataInclusao : tDateTime; fValHist,
            fValOrg, fCmBem : double;dDataIniDep : tDateTime; fValIniDep,fTaxaDep,fDepLanc,
            fCmDep,fPropBaixa, fPrioridade : double; dDataInstalacao, dDataFimGar : tDateTime;
            fValFis, fValGer, fDepFis, fDepGer : double; sBaixaTotal, sIdOpcional,
            sProcessoAquis,sEmpenhoAquis,sPubAutor,sPubEditora,sPubAno : String;
            bMostraMsg : boolean) : Integer;

   function ContabilizaDepreciacao(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                   dDataLanc : TDate;
                                   fDeprec : Double;
                                   sDesBem,sAtivProjeto,sTipoTab : String;
                                   iSubConta : Integer; sPlaca : String;
                                   bMostraMsg : Boolean) : Boolean;

   function RegistraEntradaTotal(iEmpresaProp,iBem : Integer; dDataIniDep : tDateTime;
                                 fValOrg,fValFis,fValGer : double;
                                 iSubConta, iAtivProjeto : Integer;
                                 bMostraMsg : boolean) : boolean;
   //=====================================================================================
   // Baixa
   //-------------------------------------------------------------------------------------

   // Função que Contabiliza a Baixa do Bem / Reavaliacao do Bem
   function ContabilizaBaixa(iModulo,iPessoa,iGrupo,iConjunto,iBem:Integer;
                             dDataLanc : TDate; fBaixaB,fBaixaCMB,fBaixaD,fBaixaCMD:Double;
                             sDesBem,sAtivProjeto,sTipoTab,sTipoMov : String;
                             iSubConta : Integer; sPlaca : String;
                             bMostraMsg : Boolean) : Boolean;

   // Função que Contabiliza a Baixa do Bem / Reavaliacao do Bem
   function ContabilizaResultadoBaixa(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                      dDataLanc : TDate; fValLanc : Double;
                                      sDesBem,sAtivProjeto : String;
                                      iSubConta : Integer; sPlaca : String;
                                      bMostraMsg : Boolean) : Boolean;

   //=====================================================================================
   // Reavaliação
   //-------------------------------------------------------------------------------------
   {
   // Função que registra a reavaliação das reavaliações do bem no Historico
   Function RegistraReavalReaval(iSeqHist : integer; fTaxaDep : Double; iIdReaval : Integer;
                                 bMostraMsg : Boolean) : Boolean;

   // Função que registra a reavaliação dos Acréscimos do bem no Historico
   Function RegistraReavalAcresc(iSeqHist : integer; fTaxaDep : Double; iIdAcresc : Integer;
                                 bMostraMsg : Boolean) : Boolean;
   }
   // Função que contabiliza a reavaliação
   function ContabilizaReavaliacao(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                   dDataLanc : TDate; fValLanc : Double;
                                   sDesBem, sAtivProjeto : String;
                                   iSubConta : Integer; sPlaca : String;
                                   bMostraMsg : Boolean) : Integer;

   //=====================================================================================
   // Acrescimo de Valor
   //-------------------------------------------------------------------------------------

   // Função que registra o Acréscimo de Valor na tabela ACRESCIMOVALOR
   function RegistraAcrescimo(iBem,iEmpresaProp,iSeqHist:Integer;fTaxaDep:double;
                              dDataAcres : tDateTime; fValAcres, fValFis, fValGer : double;
                              fCmBem, fCmDep, fDepLanc, fDepFis, fDepGer : Extended;
                              iflgDeprec : Integer; dDataUltDep : tDateTime;
                              bMostraMsg : boolean) : Integer;

   // Função que registra o acréscimo de valor no Historico
   function RegistraAcresc(iSeqHist, iTipoDespesa : integer; sObs : string;
                           bMostraMsg : Boolean) : Boolean;

   // Função que registra os bens gerados por desmembramento
   function RegistraDesmembramento(iSeqHist,
                                   iBemResultante : Integer;
                                   fProporcao : Extended;
                                   bMostraMsg : Boolean) : Boolean;

   // Função que contabiliza o acréscimo de valor
   function ContabilizaAcrescimo(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                 dDataLanc : TDate;
                                 fValLanc : Double;
                                 sDesBem, sAtivProjeto : String;
                                 iSubConta : Integer; sPlaca : String;
                                 bMostraMsg : Boolean) : Integer;

   //=====================================================================================
   //
   function ExecutaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                               dDataMov : tDateTime; bMostraMsg : boolean;
                               Var fDepCmBem, fDepDepLanc, fDepCmDep : Extended) : Boolean;
  { //
   Function RegistraTransfLocal(iSeqHist, iIdLocalAnt, iIdRespAnt : integer;
                                bMostraMsg : Boolean) : Boolean;

   //
   Function RegistraTransfConj(iSeqHist, iIdConjuntoAnt : integer;
                               bMostraMsg : Boolean) : Boolean;

   //
   Function RegistraTransfGrupo(iSeqHist, iIdGrupoAnt : integer;
                                bMostraMsg : Boolean) : Boolean;

  } //
   Function ContabilizaTransferencia(iModulo, iEmpresaProp, iBem : Integer;
                                     dDataMov : tDateTime;
                                     iGrupoAtual, iGrupoNovo,
                                     iConjuntoAtual, iConjuntoNovo : Integer;
                                     sCCustoAtual, sCCustoNovo : String;
                                     iSubContaAtual, iSubContaNovo,
                                     iAtivProjetoAtual, iAtivProjetoNovo : Integer;
                                     bMostraMsg : Boolean) : Integer;

   Function ContabilizaTransf(iModulo,iPessoa,iBem,
                              iGrupoAtual, iGrupoNovo,
                              iConjuntoAtual, iConjuntoNovo : Integer;
                              sCCustoAtual, sCCustoNovo : String;
                              dDataLanc : TDate;
                              fBaixaB,fBaixaCMB,fBaixaD,fBaixaCMD : Double;
                              sDesBem,sAtivProjeto,sTipoTab : String;
                              iSubConta : Integer; sPlaca : String;
                              bMostraMsg : Boolean) : Integer;
  {
   Function RegistraTransfPlaca(iSeqHist : Integer; fPlacaAnt : Double;
                                bMostraMsg : Boolean) : Boolean; }
   //=====================================================================================

   public

   //=====================================================================================
   // Atualiza Saldo Contabil dos Bens
   //-------------------------------------------------------------------------------------
   function AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem : Integer;
                                   dDataSld : tDateTime;
                                   fValOrg, fCmBem, fDepLanc, fCmDep,
                                   fReavValOrg, fReavCmBem, fReavDepLanc,
                                   fReavCmDep, fUltReavValOrg, fUltReavCmBem,
                                   fUltReavDepLanc, fUltReavCmDep : Extended;
                                   iCodMov : Integer) : Boolean;
   //=====================================================================================
   // Função que executa a Entrada de um Bem no Ativo Fixo
   //-------------------------------------------------------------------------------------
   function ExecutaEntrada(iIdBemAlt : Integer; iModulo,iEmpresaProp,iConjunto,iTerceiro,iGrupo,
            iSubConta,iAtivProjeto,iClasseBem,iItensRecDev,iFornec,iImagem : integer; fPlaca : double;
            iSituacao : integer; sRegistro,sControle,sDescBem,sIdNota,sComplNota,
            sNumSerie : string; dDataNota,dDataInclusao : tDateTime; fValHist,fValOrg,
            fCmBem : double; dDataIniDep : tDateTime; fValIniDep,fTaxaDep,fDepLanc,fCmDep,
            fPropBaixa,fPrioridade : double;dDataInstalacao,dDataFimGar : tDateTime;
            fReavValOrg,fReavCmBem,fReavDepLanc,fReavCmDep : double; sReavTaxaDep : String;
            dReavData : tDateTime; sReavObs : String; fUltReavValOrg,fUltReavCmBem,
            fUltReavDepLanc, fUltReavCmDep : double; sUltReavTaxaDep : String;
            dUltReavData : tDateTime; sUltReavObs, sIdOpcional,
            sProcessoAquis, sEmpenhoAquis, sPubAutor, sPubEditora, sPubAno : String;
            Var iPlanilha : Integer; bMostraMsg : boolean) : Integer;

   function ExecutaEntradaBem(iIdBemAlt : Integer; iModulo,iEmpresaProp,iConjunto,iTerceiro,iGrupo,
            iSubConta,iAtivProjeto,iClasseBem,iItensRecDev,iFornec,iImagem : integer; sPlaca : string;
            iSituacao : integer; sRegistro,sControle,sDescBem,sIdNota,sComplNota,
            sNumSerie : string; dDataNota,dDataInclusao : tDateTime; fValHist,fValOrg,
            fCmBem : double; dDataIniDep : tDateTime; fValIniDep,fTaxaDep,fDepLanc,fCmDep,
            fPropBaixa,fPrioridade : double;dDataInstalacao,dDataFimGar : tDateTime;
            fReavValOrg,fReavCmBem,fReavDepLanc,fReavCmDep : double; sReavTaxaDep : String;
            dReavData : tDateTime; sReavObs : String; fUltReavValOrg,fUltReavCmBem,
            fUltReavDepLanc, fUltReavCmDep : double; sUltReavTaxaDep : String;
            dUltReavData : tDateTime; sUltReavObs, sIdOpcional,
            sProcessoAquis, sEmpenhoAquis, sPubAutor, sPubEditora, sPubAno : String;
            bMostraMsg : boolean; iQuantidade : Integer) : Boolean;

   function GeraProxPlacaTomb(iIdPessoa, iIdGrupo, iIdClasse : Integer;
                              fPlacaAtual : double) : double;

   function EstornaEntrada(iModulo, iEmpresaProp, iBem : Integer;
                           dDataMov, dDataEst : tDate;
                           bFlgContab, bMostraMsg : boolean) : Integer;

   function ContabilizaEntrada(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                               dDataLanc : TDate; fValOrg,fValIniDep,fCmBem,
                               fCmDep : Double; sDesBem,sAtivProjeto,sRegistro,
                               sTipoMov : String; iSubConta : Integer;
                               sPlaca : String; bMostraMsg : Boolean) : Integer;

   function ContabilizaEntradaReav(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                   dDataLanc : TDate; fReavValOrg,fReavDepLanc,fReavCmBem,
                                   fReavCmDep : Double; sDesBem,sAtivProjeto,sRegistro,
                                   sTipoMov, sTipoTab : String; iSubConta : Integer;
                                   sPlaca : String; bMostraMsg : Boolean) : Integer;

   //=====================================================================================
   // Função que executa a Entrada de um Bem no Ativo Fixo
   //-------------------------------------------------------------------------------------
   function ExecutaEntradaTotal(iModulo,iEmpresaProp,iBem : integer;
                                dDataIniDep : tDateTime; fValor : double;
                                iCodSubConta, iAtivProjeto : Integer;
                                bMostraMsg : boolean) : Integer;
   //=====================================================================================
   // Função que executa a baixa de um Bem
   //-------------------------------------------------------------------------------------
   function ExecutaBaixa(iModulo, iEmpresaProp, iBem, iMotivoBaixa : Integer;
                         dDataBaixa : tDate; fPropBaixa, fValVenda : Extended;
                         sObsBaixa : String; bMostraMsg : boolean;
                         Var fValResult, fValResultImob : Currency;
                         Var iPlanilha : Integer) : Boolean;

   function EstornaBaixa(iModulo, iEmpresaProp, iBem : Integer;
                         dDataMov,dDataEst : tDate;
                         bMostraMsg : boolean) : Integer;

   function RegistraBaixaBem(iSeqHist, iMotivoBaixa : Integer; fPropBaixar : Double;
                             sObsBaixa : string; iIdReaval : Integer;
                             bMostraMsg : Boolean) : Boolean;

   //=====================================================================================
   // Função que executa a reavaliação de um Bem
   //-------------------------------------------------------------------------------------
   function ExecutaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                               dDataLaudo : tDate; fValLaudo : Double;
                               iVidaUtil : Integer;
                               sObs : String; Var fDifReaval, fDifReavalImob : Double;
                               bMostraMsg : boolean) : Integer;

   // Função que registra a reavaliação na tabela REAVALIACAO
   function RegistraReavaliacao(iBem,iPessoa,iMov : Integer;
                                fValOrg,fValFis,fValGer,fCmBem,
                                fDepLanc,fDepFis,fDepGer,fCmDep,fTaxaDep : Double;
                                dData : tDateTime; iflgUltReaval : Integer;
                                dDataUltDep : tDateTime; iflgDeprec : Integer;
                                bMostraMsg : Boolean) : Integer;

   // Função que registra a reavaliacao do bem no Historico
   Function RegistraReaval(iSeqHist : integer; fTaxaDep, fValLaudo, fValOrgAnt : Double;
                           sObs : string; bMostraMsg : Boolean) : Boolean;

   //=====================================================================================
   // Função que estorna a reavaliação de um Bem
   //-------------------------------------------------------------------------------------
   function EstornaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                               dDataMov,dDataEst : tDate;
                               bMostraMsg : boolean) : Integer;

   function EstornaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                               dDataMov,dDataEst : tDate;
                               bMostraMsg : boolean) : Integer;
   //
   function RegistraDeprec(iTipoMov, iSeqHist, iIdMov : Integer;
                           dDataUltDep : tDateTime) : Boolean;

   //
   //=====================================================================================
   // Função que executa o acréscimo de valor de um Bem
   //-------------------------------------------------------------------------------------
   function ExecutaAcrescimo(iModulo, iEmpresaProp, iBem : Integer;
                             dDataAcres : tDateTime; fValAcres : Double;
                             sObs : String; iTipoDespesa : Integer;
                             Var fTaxaDep : double; bMostraMsg : boolean) : Integer;

   function EstornaAcrescimo(iModulo, iEmpresaProp, iBem : Integer;
                             dDataMov, dDataEst : tDate;
                             iAcrescimo : Integer;
                             bMostraMsg : boolean) : Integer;

   //=====================================================================================
   // Função que executa a Transferencia de Local de um Conjunto
   //-------------------------------------------------------------------------------------
   //function ExecutaTransfLocal(iModulo, iEmpresaProp, iConjunto : Integer;
   //                            iIdLocalNovo, iIdRespNovo : Integer;
   //                            dDataMov : tDateTime; bMostraMsg : boolean) : Boolean;
   //=====================================================================================
   // Função que executa a Troca do Número da Placa de Tombamento Patrimonial
   //-------------------------------------------------------------------------------------
   function ExecutaTransfPlaca(iModulo, iEmpresaProp, iBem : Integer;
                               fPlacaNova : double; dDataMov : tDateTime;
                               bMostraMsg : boolean) : boolean;
   //=====================================================================================
   // Função que executa a Transferencia de Conjunto de um Bem
   //-------------------------------------------------------------------------------------
   {function ExecutaTransfConjunto(iModulo, iEmpresaProp, iBem : Integer;
                                  iConjuntoNovo : Integer; dDataMov : tDateTime;
                                  Var iIdHistMovim : Integer;
                                  bMostraMsg : boolean) : Boolean;}
   //=====================================================================================
   // Função que executa a Transferencia de Grupo de um Bem
   //-------------------------------------------------------------------------------------
   function ExecutaTransfGrupo(iModulo, iEmpresaProp, iBem : Integer;
                               iGrupoNovo : Integer; Var iConjuntoNovo, iLocalNovo,
                               iRespNovo : Integer; dDataMov : tDateTime;
                               bMostraMsg : boolean) : Integer;

   function EstornaTransfGrupo(iModulo, iEmpresaProp, iBem : Integer;
                               dDataMov, dDataEst : tDate;
                               iIdHistMovim : Integer;
                               bMostraMsg : boolean) : Integer;
   //=====================================================================================
   // Função que executa o desmembramento de bens
   //-------------------------------------------------------------------------------------
   function ExecutaDesmembramento(iModulo, iEmpresaProp, iBem : Integer;
                                  dDataMov : tDate; iQtdBens : Integer;
                                  aPlaca      : Array of Double;
                                  aDesBem     : Array of String;
                                  aProporcoes : Array of Currency;
                                  bMostraMsg  : boolean;
                                  Var aIdBemResult : Array of Integer) : Integer;
   function EstornaDesmembramento(iModulo, iEmpresaProp, iBem : Integer;
                                  dDataMov, dDataEst : tDate;
                                  bMostraMsg : boolean) : Integer;
   //=====================================================================================
   // Função que executa o desmembramento de bens
   //-------------------------------------------------------------------------------------
  {function ExecutaRemembramento(iModulo, iEmpresaProp : Integer;
                                 aIdBem : Array of Integer;
                                 dDataMov : tDate; iQtdBens : Integer;
                                 fPlaca : Double;
                                 sDesBem : String;
                                 bMostraMsg  : boolean;
                                 Var iBemResult : Integer) : Integer;
   function EstornaRemembramento(iModulo, iEmpresaProp, iBem : Integer;
                                 dDataMov, dDataEst : tDate;
                                 bMostraMsg : boolean) : Integer;}
   //=====================================================================================
   function Cotacao_Moeda(sMoeda : String; dData : tDateTime; bMostraMsg : boolean) : double;
   function CalculaSaldoContabil(iIdPessoa, iIdBem : Integer;dData : tDatetime;
                                 Var fSldCtbImob : Extended) : Extended;
   function TiraCaracter(sStr : string; sCh : Char) : string;
   function CompletaZeros(sCodigo : String; iTam : Integer) : string;
   function ComplZeros(sCodigo : String; iTam : Integer) : string;
   function CalculaTaxaDep(fDepLanc,fValOrg,fTaxaDepOrg : double; dDataMov : tDateTime) : double;
   Procedure ParamFatorPeriodo(var rFator : Real; dDataUltDep,dDataMov : tDateTime);
   //=====================================================================================
   // Registra Movimentacao Básica
   //-------------------------------------------------------------------------------------

   // Função que registra uma movimentação
   function RegistraMovimentacao(iBem, iEmpresaProp, iModulo,
                                 iTipoMovimentacao : Integer;
                                 dDataMovimentacao : TDate;
                                 iReavalAcresc : LongInt;
                                 fValOfi, fValFis, fValGer : Extended;
                                 dDataUltDep : TDate;
                                 iGrupAnt, iConjAnt, iLocalAnt, iRespAnt : LongInt;
                                 fPlacaAnt : Extended;
                                 iPlanilha, iEstorno : LongInt;
                                 fTaxaDepAnt, fValorgLaudo : Extended;
                                 sObsReaval : String;
                                 bMostraMsg: boolean) : Integer;

   // Função que registra os valores de uma movimentação
   function RegistraValorMovimentacao(iSeqHist : Integer; fValOfi,fValFis,fValGer : Extended;
                                      bMostraMsg : Boolean) : Boolean;
   //=====================================================================================
   // Contabilização do ATIVO FIXO
   //-------------------------------------------------------------------------------------

   // Função que registra os Lancamentos da Movimentacao em um planilha na Contabilidade
   function RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo : Integer;
                                     dData : TDateTime; Var sMensagem : String;
                                     bMostraMsg : Boolean) : Integer;

   // Função que verifica se o Ativo Fixo está integrado a Contabilidade
   function IntegraContab(iEmpresaProp : Integer) : boolean;

   // Função que verifica o modo de estorno de planilhas contábeis
   function RemovePlanContab(iEmpresaProp : Integer) : boolean;

   // Função que localiza a conta contábil e o centro de custo de um tipo de
   // movimentação em um grupo
   procedure Localiza_ContaeCentroCusto(iGrupo, iTipoMovimentacao: Integer;
                                        sDebCred : string; iPlano : Integer;
                                        var sPlaConta, sCCusto : string);

   // Função que localiza a descrição de um grupo
   function Busca_Grupo(iPessoa,iGrupo : Integer) : String;

   // Função que verifica se uma conta contabil deve ter centro de custo
   function ContaPossuiCCust(iPlano : Integer; sConta : String) : Boolean;

   // Função que verifica se a data da movimentacao pode ser contabilizada
   function VerificaPeriodoContabil(iEmpresa : Integer; dData: TDate;
                                    Var iExercicio, iPeriodo : Integer;
                                    Var sMensagem : String;
                                    bMostraMsg : Boolean) : Boolean;

   // Função que recebe os lancamentos e os acumula para posterior registro
   function MontaLancamento(sDebCred,sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                            sCc,sAtivProjeto,sContaDeb,sContaCred,sNumDoc : string;
                            fValLanc : Double; iPessoa,iBem,iGrupo,iPlano,
                            iSubConta : integer; bMostraMsg : boolean) : boolean;

   // Procedimento que atualiza a tabela TIPOMOVIMENTACAO
   Procedure GeraTipoMovimentacao;

   //
   Procedure CriaQry( Var q : TwwQuery );

   //
   Procedure FreeQry( Var q : TwwQuery );

   end;

   eExcessaoCAF = Class(Exception);

var
   AtivoFixo : TAtivoFixo;

implementation

uses
   uSistema, uAutorizacao, dBaseDados, uDatabase, dAtivoFixo, uLancContab,
   uIntegraBack, uDiasUteis, uFuncaoGeral, fAguarde;

//========================================================================================
// Função que registra movimentação
//----------------------------------------------------------------------------------------
//
// Parâmetros :
//----------------------------------------------------------------------------------------
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
// iBem              : id do Bem movimentado                             (IDBEM)
// iEmpresaProp      : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iModulo           : id do Módulo que incluiu o bem                    (IDMODULO)
// iTipoMovimentacao : id do Tipo de Movimentacao                        (IDTIPOMOVIMENTACAO)
// dDataMovimentacao : data de registro da Movimentação                  (DATAMOVIMENTACAO)
// iReavalAcresc     : id da Reavaliacao/Acrescimo movimentado           (IDREAVALACRESC)
// fValOfi           : Valor movimentado em Moeda Corrente               (VALOFI)
// fValFis           : Valor movimentado na Moeda Fiscal                 (VALFIS)
// fValGer           : Valor movimentado na Moeda Gerencial              (VALGER)
// dDataUltDep       : Data da depreciacao anterior a atual              (DATAULTDEP)
// iGrupAnt          : id do grupo anterior do bem                       (IDGRUPANT)
// iConjAnt          : id do conjunto anterior do bem                    (IDCONJANT)
// iLocalAnt         : id do local anterior do bem                       (IDLOCALANT)
// iRespAnt          : id do responsavel anterior do bem                 (IDRESPANT)
// fPlacaAnt         : número da placa de patrimônio                     (PLACAANT)
// iPlanilha         : id da Planilha de Lancamento na Contabilidade     (PLNCODIGO)
// iEstorno          : id da Planilha de Estorno na Contabilidade        (IDESTORNO)
// fTaxaDepAnt       : Taxa de depreciação anterior                      (TAXADEPANT)
// fValorgLaudo      : Valor dado ao bem no laudo de reavaliação         (VALORGLAUDO)
// sObsReaval        : Observações relativas a reavaliação               (OBSREAVAL)  
// bMostraMsg        : True  - mostra mensagens
//                     False - não mostra mensagens
//----------------------------------------------------------------------------------------
function TAtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo,
                                         iTipoMovimentacao : Integer;
                                         dDataMovimentacao : TDate;
                                         iReavalAcresc : LongInt;
                                         fValOfi, fValFis, fValGer : Extended;
                                         dDataUltDep : TDate;
                                         iGrupAnt, iConjAnt, iLocalAnt, iRespAnt : LongInt;
                                         fPlacaAnt : Extended;
                                         iPlanilha, iEstorno : LongInt;
                                         fTaxaDepAnt, fValorgLaudo : Extended;
                                         sObsReaval : String;
                                         bMostraMsg: boolean) : Integer;
var
   iMovimentacao           : LongInt;
   qryRegistraMovimentacao : TwwQuery;

begin
   try
      if not dtmAtivoFixo.qryRegistraMovimentacao.Prepared then
         dtmAtivoFixo.qryRegistraMovimentacao.Prepare;
      //----------------------------------------------------------------------------------
      iMovimentacao           := LeUltRegistro(nil, 'HISTORICOMOVIMENTACAO');
      qryRegistraMovimentacao := TwwQuery(dtmAtivoFixo.qryRegistraMovimentacao);
      //----------------------------------------------------------------------------------
      with qryRegistraMovimentacao do
      begin
         Close;
         ParamByName('MOVIMENTACAO').asInteger      := iMovimentacao;
         ParamByName('BEM').asInteger               := iBem;
         ParamByName('EMPRESAPROP').asInteger       := iEmpresaProp;
         ParamByName('MODULO').asInteger            := iModulo;
         ParamByName('TIPOMOVIMENTACAO').asInteger  := iTipoMovimentacao;
         ParamByName('DATAMOVIMENTACAO').asDateTime := dDataMovimentacao;
         //-------------------------------------------------------------------------------
         if iReavalAcresc = -1 then
            ParamByName('IDREAVALACRESC').Clear
         else
            ParamByName('IDREAVALACRESC').AsInteger := iReavalAcresc;
         //-------------------------------------------------------------------------------
         if abs(fValOfi) >= 0.01 then
         begin
            ParamByName('VALOFI').AsCurrency := strtofloat(FormatFloat('###########0.00',((fValOfi * 100) / 100)));
            ParamByName('VALGER').AsCurrency := strtofloat(FormatFloat('###########0.00',((fValGer * 100) / 100)));
            ParamByName('VALFIS').AsCurrency := strtofloat(FormatFloat('###########0.00',((fValFis * 100) / 100)));
         end else
         begin
            ParamByName('VALOFI').AsFloat := fValOfi;
            ParamByName('VALGER').AsFloat := fValGer;
            ParamByName('VALFIS').AsFloat := fValFis;
         end;
         //-------------------------------------------------------------------------------
         if dDataUltDep = -1 then
            ParamByName('DATAULTDEP').Clear
         else
            ParamByName('DATAULTDEP').AsDateTime := dDataUltDep;
         //-------------------------------------------------------------------------------
         if iGrupAnt = -1 then
            ParamByName('IDGRUPANT').Clear
         else
            ParamByName('IDGRUPANT').AsInteger := iGrupAnt;
         //-------------------------------------------------------------------------------
         if iConjAnt = -1 then
            ParamByName('IDCONJANT').Clear
         else
            ParamByName('IDCONJANT').AsInteger := iConjAnt;
         //-------------------------------------------------------------------------------
         if iLocalAnt = -1 then
            ParamByName('IDLOCALANT').Clear
         else
            ParamByName('IDLOCALANT').AsInteger := iLocalAnt;
         //-------------------------------------------------------------------------------
         if iRespAnt = -1 then
            ParamByName('IDRESPANT').Clear
         else
            ParamByName('IDRESPANT').AsInteger := iRespAnt;
         //-------------------------------------------------------------------------------
         if fPlacaAnt = -1 then
            ParamByName('PLACAANT').Clear
         else
            ParamByName('PLACAANT').AsFloat := fPlacaAnt;
         //-------------------------------------------------------------------------------
         if fTaxaDepAnt = -1 then
            ParamByName('TAXADEPANT').Clear
         else
            ParamByName('TAXADEPANT').AsFloat := fTaxaDepAnt;
         //-------------------------------------------------------------------------------
         if fValorgLaudo = -1 then
            ParamByName('VALORGLAUDO').Clear
         else
            ParamByName('VALORGLAUDO').AsFloat := fValorgLaudo;
         //-------------------------------------------------------------------------------
         ParamByName('OBSREAVAL').AsString := sObsReaval;
         //-------------------------------------------------------------------------------
         if iPlanilha = -1 then
            ParamByName('PLANILHA').Clear
         else
            ParamByName('PLANILHA').asInteger       := iPlanilha;
         //-------------------------------------------------------------------------------
         if iEstorno = -1 then
            ParamByName('ESTORNO').Clear
         else
            ParamByName('ESTORNO').asInteger        := iEstorno;
         //-------------------------------------------------------------------------------
         ExecSQL;
         if RowsAffected = 0 then
            Raise eExcessaoCAF.Create('RegistraMovimentacao : Erro na gravação');
      end;
      result := iMovimentacao;
   except
      result := -1;
   end;
end;
//========================================================================================
// Funcao que registra os Valores referentes a uma movimentacao
//----------------------------------------------------------------------------------------
//
// Parâmetros :
//
//    iSeqHist   : id da Movimentacao            (IDMOVIMENTACAO)
//    fValOfi    : Valor na Moeda Corrente       (VALOFI)
//    fValFis    : Valor na Moeda Fiscal         (VALFIS)
//    fValGer    : Valor na Moeda Gerencial      (VALGER)
//    bMostraMsg : True  - mostra mensagens
//                 False - não mostra mensagens
//
//========================================================================================
Function TAtivoFixo.RegistraValorMovimentacao(iSeqHist : Integer;
                                              fValOfi,fValFis,fValGer : Extended;
                                              bMostraMsg : Boolean) : Boolean;
var
   qryValorMovimentacao : TwwQuery;
   bTransacao           : Boolean;

begin
   if fValOfi <> 0 then
   begin
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end else
         bTransacao := False;
      //----------------------------------------------------------------------------------
      qryValorMovimentacao := TwwQuery(dtmAtivoFixo.qryRegistraValorMovimentacao);
      //----------------------------------------------------------------------------------
      try
         with qryValorMovimentacao do
         begin
            ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
            if abs(fValOfi) >= 0.01 then
            begin
               ParamByName('PVALOFI').AsCurrency := strtofloat(FormatFloat('###########0.00',((fValOfi * 100) / 100)));
               ParamByName('PVALGER').AsCurrency := strtofloat(FormatFloat('###########0.00',((fValGer * 100) / 100)));
               ParamByName('PVALFIS').AsCurrency := strtofloat(FormatFloat('###########0.00',((fValFis * 100) / 100)));
            end else
            begin
               ParamByName('PVALOFI').AsFloat := fValOfi;
               ParamByName('PVALGER').AsFloat := fValGer;
               ParamByName('PVALFIS').AsFloat := fValFis;
            end;
            ExecSQL;
            //----------------------------------------------------------------------------
            if bTransacao then
               CommitTransacao;
            Result := True;
         end;
      //----------------------------------------------------------------------------------
      except
         Result := False;
         if bTransacao then
            RollBackTransacao;
         if bMostraMsg then
            Raise;
      end;
   end else
   begin
      result := True;
   end;
end;
//========================================================================================
// Função que executa a atualização da tabela de Saldo Contábil de Bens
//----------------------------------------------------------------------------------------
function TAtivoFixo.AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem : Integer;
                                           dDataSld : tDateTime;
                                           fValOrg, fCmBem, fDepLanc, fCmDep,
                                           fReavValOrg, fReavCmBem, fReavDepLanc,
                                           fReavCmDep, fUltReavValOrg, fUltReavCmBem,
                                           fUltReavDepLanc, fUltReavCmDep : Extended;
                                           iCodMov : Integer) : Boolean;
begin
   try
      with dtmAtivoFixo do
      begin
         if not sprSaldoContabBem.Prepared then
            sprSaldoContabBem.Prepare;
         //-------------------------------------------------------------------------------
         sprSaldoContabBem.ParamByName('PIDBEM').AsInteger        := iBem;
         sprSaldoContabBem.ParamByName('PIDPESSOA').AsInteger     := iEmpresaProp;
         sprSaldoContabBem.ParamByName('PDATASLDBEM').AsDateTime  := dDataSld;
         sprSaldoContabBem.ParamByName('PVALORG').AsFloat         := fValOrg;
         sprSaldoContabBem.ParamByName('PCMBEM').AsFloat          := fCmBem;
         sprSaldoContabBem.ParamByName('PDEPLANC').AsFloat        := fDepLanc;
         sprSaldoContabBem.ParamByName('PCMDEP').AsFloat          := fCmDep;
         sprSaldoContabBem.ParamByName('PREAVVALORG').AsFloat     := fReavValOrg;
         sprSaldoContabBem.ParamByName('PREAVCMBEM').AsFloat      := fReavCmBem;
         sprSaldoContabBem.ParamByName('PREAVDEPLANC').AsFloat    := fReavDepLanc;
         sprSaldoContabBem.ParamByName('PREAVCMDEP').AsFloat      := fReavCmDep;
         sprSaldoContabBem.ParamByName('PULTREAVVALORG').AsFloat  := fUltReavValOrg;
         sprSaldoContabBem.ParamByName('PULTREAVCMBEM').AsFloat   := fUltReavCmBem;
         sprSaldoContabBem.ParamByName('PULTREAVDEPLANC').AsFloat := fUltReavDepLanc;
         sprSaldoContabBem.ParamByName('PULTREAVCMDEP').AsFloat   := fUltReavCmDep;
         sprSaldoContabBem.ParamByName('PCODMOV').AsInteger       := iCodMov;
         sprSaldoContabBem.ExecProc;
      end;
      Result := True;
   except
      Result := False;
   end;
   {
   with dtmAtivoFixo do
   begin
      if not qrySaldoContabBem.Prepared then
         qrySaldoContabBem.Prepare;
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end else
         bTransacao := False;
      //----------------------------------------------------------------------------------
      try
         //-------------------------------------------------------------------------------
         // Posiciona a tabela de Saldos na Data
         //-------------------------------------------------------------------------------
         qrySaldoContabBem.Close;
         qrySaldoContabBem.ParamByName('PIDBEM').AsInteger    := iBem;
         qrySaldoContabBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qrySaldoContabBem.ParamByName('PDATASLD').AsDateTime := dDataSld;
         qrySaldoContabBem.Open;
         //-------------------------------------------------------------------------------
         // Inicializa as variáveis de trabalho
         //-------------------------------------------------------------------------------
         if not qrySaldoContabBem.IsEmpty then
         begin
            fSValOrg         := qrySaldoContabBemVALORG.AsFloat;
            fSCmBem          := qrySaldoContabBemCMBEM.AsFloat;
            fSDepLanc        := qrySaldoContabBemDEPLANC.AsFloat;
            fSCmDep          := qrySaldoContabBemCMDEP.AsFloat;
            fSReavValOrg     := qrySaldoContabBemREAVVALORG.AsFloat;
            fSReavCmBem      := qrySaldoContabBemREAVCMBEM.AsFloat;
            fSReavDepLanc    := qrySaldoContabBemREAVDEPLANC.AsFloat;
            fSReavCmDep      := qrySaldoContabBemREAVCMDEP.AsFloat;
            fSUltReavValOrg  := qrySaldoContabBemULTREAVVALORG.AsFloat;
            fSUltReavCmBem   := qrySaldoContabBemULTREAVCMBEM.AsFloat;
            fSUltReavDepLanc := qrySaldoContabBemULTREAVDEPLANC.AsFloat;
            fSUltReavCmDep   := qrySaldoContabBemULTREAVCMDEP.AsFloat;
         end else
         begin
            fSValOrg         := 0;
            fSCmBem          := 0;
            fSDepLanc        := 0;
            fSCmDep          := 0;
            fSReavValOrg     := 0;
            fSReavCmBem      := 0;
            fSReavDepLanc    := 0;
            fSReavCmDep      := 0;
            fSUltReavValOrg  := 0;
            fSUltReavCmBem   := 0;
            fSUltReavDepLanc := 0;
            fSUltReavCmDep   := 0;
         end;
         //-------------------------------------------------------------------------------
         // Caso a data de Atualização já exista no cadastro, atualizar dados
         //-------------------------------------------------------------------------------
         if qrySaldoContabBemDATASLDBEM.AsDateTime = dDataSld then
         begin
            qrySaldoContabBem.Edit;
            qrySaldoContabBemVALORG.AsFloat         := fSValOrg         + fValOrg;
            qrySaldoContabBemCMBEM.AsFloat          := fSCmBem          + fCmBem;
            qrySaldoContabBemDEPLANC.AsFloat        := fSDepLanc        + fDepLanc;
            qrySaldoContabBemCMDEP.AsFloat          := fSCmDep          + fCmDep;
            qrySaldoContabBemREAVVALORG.AsFloat     := fSReavValOrg     + fReavValOrg;
            qrySaldoContabBemREAVCMBEM.AsFloat      := fSReavCmBem      + fReavCmBem;
            qrySaldoContabBemREAVDEPLANC.AsFloat    := fSReavDepLanc    + fReavDepLanc;
            qrySaldoContabBemREAVCMDEP.AsFloat      := fSReavCmDep      + fReavCmDep;
            qrySaldoContabBemULTREAVVALORG.AsFloat  := fSUltReavValOrg  + fUltReavValOrg;
            qrySaldoContabBemULTREAVCMBEM.AsFloat   := fSUltReavCmBem   + fUltReavCmBem;
            qrySaldoContabBemULTREAVDEPLANC.AsFloat := fSUltReavDepLanc + fUltReavDepLanc;
            qrySaldoContabBemULTREAVCMDEP.AsFloat   := fSUltReavCmDep   + fUltReavCmDep;
            qrySaldoContabBem.Post;
            qrySaldoContabBem.ApplyUpdates;
         end else
         //-------------------------------------------------------------------------------
         // Caso a data de Atualização não exista no cadastro, inserir saldo
         //-------------------------------------------------------------------------------
         begin
            qrySaldoContabBem.Append;
            qrySaldoContabBemIDBEM.AsInteger        := iBem;
            qrySaldoContabBemIDPESSOA.AsInteger     := iEmpresaProp;
            qrySaldoContabBemDATASLDBEM.AsDateTime  := dDataSld;
            qrySaldoContabBemVALORG.AsFloat         := fSValOrg         + fValOrg;
            qrySaldoContabBemCMBEM.AsFloat          := fSCmBem          + fCmBem;
            qrySaldoContabBemDEPLANC.AsFloat        := fSDepLanc        + fDepLanc;
            qrySaldoContabBemCMDEP.AsFloat          := fSCmDep          + fCmDep;
            qrySaldoContabBemREAVVALORG.AsFloat     := fSReavValOrg     + fReavValOrg;
            qrySaldoContabBemREAVCMBEM.AsFloat      := fSReavCmBem      + fReavCmBem;
            qrySaldoContabBemREAVDEPLANC.AsFloat    := fSReavDepLanc    + fReavDepLanc;
            qrySaldoContabBemREAVCMDEP.AsFloat      := fSReavCmDep      + fReavCmDep;
            qrySaldoContabBemULTREAVVALORG.AsFloat  := fSUltReavValOrg  + fUltReavValOrg;
            qrySaldoContabBemULTREAVCMBEM.AsFloat   := fSUltReavCmBem   + fUltReavCmBem;
            qrySaldoContabBemULTREAVDEPLANC.AsFloat := fSUltReavDepLanc + fUltReavDepLanc;
            qrySaldoContabBemULTREAVCMDEP.AsFloat   := fSUltReavCmDep   + fUltReavCmDep;
            qrySaldoContabBem.Post;
            qrySaldoContabBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if bTransacao then
            CommitTransacao;
         Result := True;
      except
         Result := False;
         if bTransacao then
            RollBackTransacao;
      end;
      qrySaldoContabBem.Close;
   end;
   }
end;
//========================================================================================
// Função que executa a depreciacao de um bem
//----------------------------------------------------------------------------------------
// ATENÇÃO : Resta desenvolver o módulo de Correção Monetária
//----------------------------------------------------------------------------------------
function TAtivoFixo.ExecutaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                                       dDataMov : tDateTime; bMostraMsg : boolean;
                                       Var fDepCmBem, fDepDepLanc, fDepCmDep : Extended) : Boolean;
Var
   idMoeda, iPosition, iSeqHist, iTipoMovimentacao,
   iaIdHistMov, iPlanilha, iExercicio, iPeriodo,
   iAux                                            : Integer;
   fValAnt,fValAtual, fCorrecao,
   rTaxa,rFator,
   DepTotalO,DepTotalF,DepTotalG,CorrDep,ValOfi    : Real;
   sMesRef, sMesRefA,
   Debito,DebitoCm,Credito,CreditoCm,
   sCCDebito,sCCDebitoCm,sCCCredito,sCCCreditoCm,
   Tipo,sAtivProjeto,sMensagem                     : String;
   dDataInicioDep,dDataUltDep                      : tDateTime;
   qryBem,qryReavaliacao,qryAcrescimo,qryUltDep    : TwwQuery;
   bTransacao, bPlanilha, bHouveDepreciacao        : Boolean;
   dDataUltDepAnt                                  : tDateTime;
   aIdHistMov                                      : array [1..244] of Integer;


begin
   with dtmAtivoFixo do
   begin
      if not qryUltDep.Prepared then
         qryUltDep.Prepare;
      if not qryMontaCtb.Prepared then
         qryMontaCtb.Prepare;
      if not qryGrupoCtb.Prepared then
         qryGrupoCtb.Prepare;
      if not qryConta.Prepared then
         qryConta.Prepare;
      if not qryCCrd.Prepared then
         qryCCrd.Prepare;
      if not qryPlanoConta.Prepared then
         qryPlanoConta.Prepare;
      if not qryMontaCtb.Active then
         qryMontaCtb.Open;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryUltDep      := TwwQuery(dtmAtivoFixo.qryUltDep);
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após a Depreciacao
   //-------------------------------------------------------------------------------------
   qryUltDep.Close;
   qryUltDep.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltDep.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltDep.Open;
   if (qryUltDep.IsEmpty) or (qryUltDep.FieldByName('DATAULTDEP').AsDateTime > dDataMov) then
   begin
      if bMostraMsg then
         MsgDlg('Existe Depreciação com data posterior a esta movimentação. '+
                'Consulte Histórico de Movimentações!', 'Erro', mtError, [mbOk], 0);
      result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se a data da movimentacao esta muito alem do periodo
   //-------------------------------------------------------------------------------------
   if qryUltDep.FieldByName('DATAULTDEP').AsDateTime <> 0 then
      if (dDataMov - qryUltDep.FieldByName('DATAULTDEP').AsDateTime) > 40 then
      begin
         if bMostraMsg then
            MsgDlg('A data da movimentação está muito adiante do último fechamento ('+
                   qryUltDep.FieldByName('DATAULTDEP').AsString +')! '+
                   'Consulte Histórico de Movimentações!', 'Erro', mtError, [mbOk], 0);
         result := False;
         exit;
      end;
   qryUltDep.Close;
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   qryReavaliacao.Close;
   qryReavaliacao.ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
   qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
   qryReavaliacao.Open;
   qryAcrescimo.Close;
   qryAcrescimo.ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
   qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
   qryAcrescimo.Open;
   //-------------------------------------------------------------------------------------
   // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
   //-------------------------------------------------------------------------------------
   if qryBem.FieldByName('UNIDNEGOC').IsNull then
   begin
      with dtmAtivoFixo.qryParamCaf do
      begin
         if not Active then
         begin
            ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
            Open;
         end;
         if not IsEmpty then
            sAtivProjeto := FieldByName('ATIVPROJETO').AsString
         else
            sAtivProjeto := '';
      end;
   end else
   begin
      sAtivProjeto := qryBem.FieldByName('UNIDNEGOC').AsString;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      qryBem.Edit;
      fDepDepLanc := 0;
      //----------------------------------------------------------------------------------
      // Atualiza Parametros
      //----------------------------------------------------------------------------------
      if qryBem.FieldByName('DATAINICIODEP').IsNull then
      begin
         qryBem.FieldByName('DATAINICIODEP').AsDateTime := qryBem.FieldByName('DTAINCLUSAO').AsDateTime;
         dDataInicioDep := qryBem.FieldByName('DTAINCLUSAO').AsDateTime;
      end else
      begin
         dDataInicioDep := qryBem.FieldByName('DATAINICIODEP').AsDateTime;
      end;
      //----------------------------------------------------------------------------------
      if qryBem.FieldByName('DATAULTDEP').IsNull then
      begin
         qryBem.FieldByName('DATAULTDEP').AsDateTime := dDataInicioDep - 1;
         dDataUltDep := dDataInicioDep - 1;
      end else
      begin
         if qryBem.FieldByName('DATAULTDEP').AsDateTime > qryBem.FieldByName('DATAINICIODEP').AsDateTime then
         begin
            dDataUltDep := qryBem.FieldByName('DATAULTDEP').AsDateTime;
         end else
         begin
            dDataUltDep := qryBem.FieldByName('DATAULTDEP').AsDateTime - 1;
            qryBem.FieldByName('DATAULTDEP').AsDateTime := qryBem.FieldByName('DATAULTDEP').AsDateTime - 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Armazena o Último Lancamento de Depreciacao para armazenamento futuro
      //----------------------------------------------------------------------------------
      dDataUltDepAnt := qryBem.FieldByName('DATAULTDEP').asDateTime;
      //----------------------------------------------------------------------------------
      ParamFatorPeriodo(rFator,dDataUltDep,dDataMov);
      iaIdHistMov := 0;
      //----------------------------------------------------------------------------------
      // Se Calcula a Correção -> Calcular a Correção do Mês
      //----------------------------------------------------------------------------------
      // Executa_Correção
      //----------------------------------------------------------------------------------
      // Se calcula a depreciação -> Calcular a Depreciação do Mes
      //----------------------------------------------------------------------------------
      if ((qryBem.FieldByName('FLGDEPREC').AsInteger = 0) or
          (qryBem.FieldByName('FLGDEPREC').IsNull)) and
          (rFator > 0) and (qryBem.FieldByName('TAXADEP').AsFloat > 0) then
      begin
         //-------------------------------------------------------------------------------
         rTaxa     := ((qryBem.FieldByName('TAXADEP').AsFloat / 100) * rFator);
         DepTotalO := (rTaxa * (qryBem.FieldByName('VALORG').AsFloat +
                                qryBem.FieldByName('CMBEM').AsFloat));
         if abs(DepTotalO) >= 0.01 then
            DepTotalO := strtofloat(FormatFloat('###########0.00',((DepTotalO * 100) / 100)));
         //-------------------------------------------------------------------------------
         if (qryBem.FieldByName('DEPLANC').AsFloat + DepTotalO +
            (qryBem.FieldByName('CMDEP').AsFloat)) >=
            (qryBem.FieldByName('VALORG').AsFloat +
            (qryBem.FieldByName('CMBEM').AsFloat)) then
         begin
            DepTotalO := (qryBem.FieldByName('VALORG').AsFloat +
                          qryBem.FieldByName('CMBEM').AsFloat) -
                         (qryBem.FieldByName('DEPLANC').AsFloat +
                          qryBem.FieldByName('CMDEP').AsFloat);
            qryBem.FieldByName('FLGDEPREC').AsInteger := 1;
         end;
         qryBem.FieldByName('DEPLANC').AsCurrency := qryBem.FieldByName('DEPLANC').AsFloat +
                                                     DepTotalO;
         //-------------------------------------------------------------------------------
         fDepDepLanc := DepTotalO;
         //-------------------------------------------------------------------------------
         if (DepTotalO <> 0) then
         begin
            //----------------------------------------------------------------------------
            // Registra o Historico de Movimentacao
            //----------------------------------------------------------------------------
            iTipoMovimentacao := 14;
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                             dDataMov,-1,DepTotalO,0,0,dDataUltDepAnt,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,'',True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
            //----------------------------------------------------------------------------
            qryBem.FieldByName('DATARECALCDEP').AsDateTime := dDataUltDep;
            qryBem.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
            qryBem.Post;
            //----------------------------------------------------------------------------
            // Atualiza a tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            if not AtualizaSaldoContabBem(Sistema.IdModulo,
                                          qryBem.FieldByName('IDPESSOA').AsInteger,
                                          qryBem.FieldByName('IDBEM').AsInteger,
                                          dDataMov,
                                          0,0,DepTotalO,0,
                                          0,0,0,0,
                                          0,0,0,0,
                                          0) then
               Raise eExcessaoCAF.Create('Depreciação : AtualizaSaldoContabBem');
            //----------------------------------------------------------------------------
            // Lançamentos Contábeis
            //----------------------------------------------------------------------------
            if IntegraContab(iEmpresaProp) then
            begin
               bPlanilha := ContabilizaDepreciacao(iModulo,
                                                   qryBem.FieldByName('IDPESSOA').AsInteger,
                                                   qryBem.FieldByName('IDGRUPO').AsInteger,
                                                   qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                                   qryBem.FieldByName('IDBEM').AsInteger,
                                                   dDataMov,
                                                   DepTotalO,
                                                   qryBem.FieldByName('DESBEM').AsString,
                                                   sAtivProjeto,'B',
                                                   qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                                   qryBem.FieldByName('PLACA').AsString,
                                                   bMostraMsg);
               if not bPlanilha then
                  Raise eExcessaoCAF.Create('Depreciacao : ContabilizaDepreciacao - Bem');
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Depreciacao das Reavaliações
      //----------------------------------------------------------------------------------
      qryReavaliacao.First;
      while not qryReavaliacao.EOF do
      begin
         qryReavaliacao.Edit;
         //-------------------------------------------------------------------------------
         // Atualiza Parametros
         //-------------------------------------------------------------------------------
         if qryReavaliacao.FieldByName('DATAULTDEP').IsNull then
            dDataUltDep := qryReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime - 1
         else
            if (qryReavaliacao.FieldByName('DATAULTDEP').AsDateTime) >
               (qryReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime) then
            begin
               dDataUltDep := qryReavaliacao.FieldByName('DATAULTDEP').AsDateTime;
            end else
            begin
               dDataUltDep := qryReavaliacao.FieldByName('DATAULTDEP').AsDateTime - 1;
               qryReavaliacao.FieldByName('DATAULTDEP').AsDateTime := qryReavaliacao.FieldByName('DATAULTDEP').AsDateTime - 1;
            end;
         //-------------------------------------------------------------------------------
         // Armazena o ultimo Lancamento de Depreciacao para armazenamento futuro
         //-------------------------------------------------------------------------------
         dDataUltDepAnt := qryReavaliacao.FieldByName('DATAULTDEP').asDateTime;
         //-------------------------------------------------------------------------------
         ParamFatorPeriodo(rFator,dDataUltDep,dDataMov);
         //-------------------------------------------------------------------------------
         // Se calcula a depreciação -> Calcular a Depreciação do Mes
         //-------------------------------------------------------------------------------
         if ((qryReavaliacao.FieldByName('FLGDEPREC').AsInteger = 0) or
             (qryReavaliacao.FieldByName('FLGDEPREC').IsNull)) and
             (rFator > 0) and (qryReavaliacao.FieldByName('TAXADEP').AsFloat > 0) then
         begin
            //----------------------------------------------------------------------------
            rTaxa     := ((qryReavaliacao.FieldByName('TAXADEP').AsFloat / 100) * rFator);
            DepTotalO := (rTaxa * (qryReavaliacao.FieldByName('VALORG').AsFloat +
                                   qryReavaliacao.FieldByName('CMBEM').AsFloat));
            if abs(DepTotalO) >= 0.01 then
               DepTotalO := strtofloat(FormatFloat('###########0.00',((DepTotalO * 100) / 100)));
            //----------------------------------------------------------------------------
            if abs(qryReavaliacao.FieldByName('DEPLANC').AsFloat + DepTotalO + qryReavaliacao.FieldByName('CMDEP').AsFloat) >=
               abs(qryReavaliacao.FieldByName('VALORG').AsFloat + qryReavaliacao.FieldByName('CMBEM').AsFloat) then
            begin
               DepTotalO := ( qryReavaliacao.FieldByName('VALORG').AsFloat    +
                              qryReavaliacao.FieldByName('CMBEM').AsFloat   ) -
                            ( qryReavaliacao.FieldByName('DEPLANC').AsFloat   +
                              qryReavaliacao.FieldByName('CMDEP').AsFloat   );
               qryReavaliacao.FieldByName('FLGDEPREC').AsInteger := 1;
            end;
            qryReavaliacao.FieldByName('DEPLANC').AsCurrency :=
                                qryReavaliacao.FieldByName('DEPLANC').AsFloat + DepTotalO;
            //----------------------------------------------------------------------------
            fDepDepLanc := fDepDepLanc + DepTotalO;
            //----------------------------------------------------------------------------
            if DepTotalO <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Registra o Historico de Movimentacao
               //-------------------------------------------------------------------------
               iTipoMovimentacao := 18;
               iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                                dDataMov,
                                                qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                                DepTotalO,0,0,dDataUltDepAnt,
                                                -1,-1,-1,-1,-1,-1,-1,-1,-1,'',True);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
               inc(iaIdHistMov);
               aIdHistMov[iaIdHistMov] := iSeqHist;
               //-------------------------------------------------------------------------
               qryReavaliacao.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
               qryReavaliacao.Post;
               //-------------------------------------------------------------------------
               // Atualiza a tabela SALDOCONTABBEM
               //-------------------------------------------------------------------------
               if qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0 then
               begin
                  if not AtualizaSaldoContabBem(Sistema.IdModulo,
                                                qryReavaliacao.FieldByName('IDPESSOA').AsInteger,
                                                qryReavaliacao.FieldByName('IDBEM').AsInteger,
                                                dDataMov,
                                                0,0,0,0,
                                                0,0,DepTotalO,0,
                                                0,0,0,0,
                                                0) then
                     Raise eExcessaoCAF.Create('DepreciaçãoReavaliacao : AtualizaSaldoContabBem');
               end else
               begin
                  if not AtualizaSaldoContabBem(Sistema.IdModulo,
                                                qryReavaliacao.FieldByName('IDPESSOA').AsInteger,
                                                qryReavaliacao.FieldByName('IDBEM').AsInteger,
                                                dDataMov,
                                                0,0,0,0,
                                                0,0,0,0,
                                                0,0,DepTotalO,0,
                                                0) then
                     Raise eExcessaoCAF.Create('DepreciaçãoReavaliacao : AtualizaSaldoContabBem');
               end;
               //-------------------------------------------------------------------------
               // Lançamentos Contábeis
               //-------------------------------------------------------------------------
               if IntegraContab(iEmpresaProp) then
               begin
                  bPlanilha := ContabilizaDepreciacao(iModulo,
                                                      qryBem.FieldByName('IDPESSOA').AsInteger,
                                                      qryBem.FieldByName('IDGRUPO').AsInteger,
                                                      qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                                      qryBem.FieldByName('IDBEM').AsInteger,
                                                      dDataMov,
                                                      DepTotalO,
                                                      qryBem.FieldByName('DESBEM').AsString,
                                                      sAtivProjeto,'R',
                                                      qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                                      qryBem.FieldByName('PLACA').AsString,
                                                      bMostraMsg);
                  if not bPlanilha then
                     Raise eExcessaoCAF.Create('Depreciacao : ContabilizaDepreciacao - Bem');
               end;
            end;
            //----------------------------------------------------------------------------
         end;
         qryReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Depreciacao dos Acréscimos
      //----------------------------------------------------------------------------------
      qryAcrescimo.First;
      while not qryAcrescimo.EOF do
      begin
         qryAcrescimo.Edit;
         //-------------------------------------------------------------------------------
         // Atualiza Parametros
         //-------------------------------------------------------------------------------
         if qryAcrescimo.FieldByName('DATAULTDEP').IsNull then
            dDataUltDep := qryAcrescimo.FieldByName('DATAACRESCIMO').AsDateTime - 1
         else
            if (qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime) >
               (qryAcrescimo.FieldByName('DATAACRESCIMO').AsDateTime) then
            begin
               dDataUltDep := qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime;
            end else
            begin
               dDataUltDep := qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime - 1;
               qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime := qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime - 1;
            end;
         //-------------------------------------------------------------------------------
         // Armazena o ultimo Lancamento de Depreciacao para armazenamento futuro
         //-------------------------------------------------------------------------------
         dDataUltDepAnt := qryAcrescimo.FieldByName('DATAULTDEP').asDateTime;
         //-------------------------------------------------------------------------------
         ParamFatorPeriodo(rFator,dDataUltDep,dDataMov);
         {ValOfi  := 0;}
         {CorrDep := 0;}
         //-------------------------------------------------------------------------------
         // Se calcula a depreciação -> Calcular a Depreciação do Mes
         //-------------------------------------------------------------------------------
         if ((qryAcrescimo.FieldByName('FLGDEPREC').AsInteger = 0) or
             (qryAcrescimo.FieldByName('FLGDEPREC').IsNull)) and
             (rFator > 0) and (qryAcrescimo.FieldByName('TAXADEP').AsFloat > 0) then
         begin
            //----------------------------------------------------------------------------
            rTaxa     := ((qryAcrescimo.FieldByName('TAXADEP').AsFloat / 100) * rFator);
            DepTotalO := (rTaxa * (qryAcrescimo.FieldByName('VALORG').AsFloat +
                                   qryAcrescimo.FieldByName('CMBEM').AsFloat));
            if abs(DepTotalO) >= 0.01 then
               DepTotalO := strtofloat(FormatFloat('###########0.00',((DepTotalO * 100) / 100)));
            //----------------------------------------------------------------------------
            if (qryAcrescimo.FieldByName('DEPLANC').AsFloat + DepTotalO +
               (qryAcrescimo.FieldByName('CMDEP').AsFloat)) >=
               (qryAcrescimo.FieldByName('VALORG').AsFloat +
               (qryAcrescimo.FieldByName('CMBEM').AsFloat)) then
            begin
               DepTotalO := ( qryAcrescimo.FieldByName('VALORG').AsFloat    +
                              qryAcrescimo.FieldByName('CMBEM').AsFloat   ) -
                            ( qryAcrescimo.FieldByName('DEPLANC').AsFloat   +
                              qryAcrescimo.FieldByName('CMDEP').AsFloat   );
               qryAcrescimo.FieldByName('FLGDEPREC').AsInteger := 1;
            end;
            qryAcrescimo.FieldByName('DEPLANC').AsCurrency :=
                                qryAcrescimo.FieldByName('DEPLANC').AsFloat + DepTotalO;
            //----------------------------------------------------------------------------
            fDepDepLanc := fDepDepLanc + DepTotalO;
            //----------------------------------------------------------------------------
            if DepTotalO <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Registra o Historico de Movimentacao
               //-------------------------------------------------------------------------
               iTipoMovimentacao := 35;
               iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                                dDataMov,
                                                qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                                DepTotalO,0,0,dDataUltDepAnt,
                                                -1,-1,-1,-1,-1,-1,-1,-1,-1,'',True);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
               inc(iaIdHistMov);
               aIdHistMov[iaIdHistMov] := iSeqHist;
               //----------------------------------------------------------------------------
               qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
               qryAcrescimo.Post;
               //----------------------------------------------------------------------------
               // Atualiza a Tabela SALDOCONTABBEM
               //----------------------------------------------------------------------------
               if not AtualizaSaldoContabBem(Sistema.IdModulo,
                                             qryAcrescimo.FieldByName('IDPESSOA').AsInteger,
                                             qryAcrescimo.FieldByName('IDBEM').AsInteger,
                                             dDataMov,
                                             0,0,DepTotalO,0,
                                             0,0,0,0,
                                             0,0,0,0,
                                             0) then
                  Raise eExcessaoCAF.Create('DepreciaçãoAcrescimo : AtualizaSaldoContabBem');
               //----------------------------------------------------------------------------
               // Lançamentos Contábeis
               //----------------------------------------------------------------------------
               if IntegraContab(iEmpresaProp) then
               begin
                  bPlanilha := ContabilizaDepreciacao(iModulo,
                                                      qryBem.FieldByName('IDPESSOA').AsInteger,
                                                      qryBem.FieldByName('IDGRUPO').AsInteger,
                                                      qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                                      qryBem.FieldByName('IDBEM').AsInteger,
                                                      dDataMov,
                                                      DepTotalO,
                                                      qryBem.FieldByName('DESBEM').AsString,
                                                      sAtivProjeto,'A',
                                                      qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                                      qryBem.FieldByName('PLACA').AsString,
                                                      bMostraMsg);
                  if not bPlanilha then
                     Raise eExcessaoCAF.Create('Depreciacao : ContabilizaDepreciacao - Bem');
               end;
            end;
            //----------------------------------------------------------------------------
         end;
         qryAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      qryBem.ApplyUpdates;
      if not qryReavaliacao.IsEmpty then
         qryReavaliacao.ApplyUpdates;
      if not qryAcrescimo.IsEmpty then
         qryAcrescimo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      bHouveDepreciacao := not dtmAtivoFixo.qryMontaCtb.IsEmpty;
      if IntegraContab(iEmpresaProp) and bHouveDepreciacao then
      begin
         if not VerificaPeriodoContabil(iEmpresaProp, dDataMov, iExercicio, iPeriodo,
                                        sMensagem, bMostraMsg) then
            Raise eExcessaoCAF.Create('Depreciação : RegistraPlanilhaContabil');
         //-------------------------------------------------------------------------------
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo, dDataMov,
                                               sMensagem, bMostraMsg);
         dtmAtivoFixo.qryMontaCtb.Close;
         if iPlanilha <= 0 then
            Raise eExcessaoCAF.Create('Depreciação : RegistraPlanilhaContabil');
         //-------------------------------------------------------------------------------
         // Registra no Historico a Planilha Gerada
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo.qryHistCtb do
         begin
            iAux := 1;
            while iAux <= iaIdHistMov do
            begin
               ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[iAux];
               ParamByName('PPLNCODIGO').AsInteger := iPlanilha;
               ExecSQL;
               inc(iAux);
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
      if bTransacao then
         CommitTransacao;
   except
      Result := False;
      if bTransacao then
         RollBackTransacao;
   end;
end;
//========================================================================================
function TAtivoFixo.RegistraDeprec(iTipoMov, iSeqHist, iIdMov : Integer; dDataUltDep : tDateTime) : Boolean;
begin
   try
      if (iTipoMov = 14) or (iTipoMov = 17) then // Depreciacao do Bem
      begin
         dtmAtivoFixo.qryDeprecBem.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         dtmAtivoFixo.qryDeprecBem.ParamByName('PDATAULTDEP').AsDateTime    := dDataUltDep;
         dtmAtivoFixo.qryDeprecBem.ExecSQL;
      end else
         //-------------------------------------------------------------------------------
         if (iTipoMov = 18) or (iTipoMov = 33) then // Depreciacao da Reavaliacao
         begin
            dtmAtivoFixo.qryDeprecReav.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
            dtmAtivoFixo.qryDeprecReav.ParamByName('PIDREAVALIACAO').AsInteger  := iIdMov;
            dtmAtivoFixo.qryDeprecReav.ParamByName('PDATAULTDEP').AsDateTime    := dDataUltDep;
            dtmAtivoFixo.qryDeprecReav.ExecSQL
         end else
            //----------------------------------------------------------------------------
            if (iTipoMov = 35) then // Depreciacao do Acrescimo
            begin
               dtmAtivoFixo.qryDeprecAcresc.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
               dtmAtivoFixo.qryDeprecAcresc.ParamByName('PIDACRESCIMO').AsInteger    := iIdMov;
               dtmAtivoFixo.qryDeprecAcresc.ParamByName('PDATAULTDEP').AsDateTime    := dDataUltDep;
               dtmAtivoFixo.qryDeprecAcresc.ExecSQL;
            end;
      result := True;
   except
      result := False;
   end;
end;
//========================================================================================
// Função que Contabiliza a Depreciacao do Bem / Reavaliacao / Acrescimo
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)
//    iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Bem movimentado
//    iConjunto    : id do Conjunto do Bem movimentado
//    iBem         : id do Bem movimentado
//    dDataLanc    : Data da Baixa
//    fDeprec      : Valor a ser Lancado
//    sDesBem      : Descrição do Bem
//    sAtivProjeto : Atividade de Projeto
//    sTipoTab     : Define qual tabela está sendo processada (B - BEM, R - REAVALIACAO,
//                                                             A - ACRÉSCIMO)
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaDepreciacao(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                           dDataLanc : TDate;
                                           fDeprec : Double;
                                           sDesBem,sAtivProjeto,sTipoTab : String;
                                           iSubConta : Integer; sPlaca : String;
                                           bMostraMsg : Boolean) : Boolean;

var
   sGrupo    ,                             // Descricao de Grupo do Bem
   sDebito   ,sCredito,                    // Contas Contábeis
   sCCDebito ,sCCCredito      : String;    // Centros de Custos

   iPlanoConta                : Integer;   // Plano de Contas

   sHistor  ,sHistor1,                     // Historico
   sHistor2 ,sHistor3,
   sHistor4 ,

   sCc      , {sPlaCCust,}                 // Conta e Plano do Centro de Custo
   {sMensagem,} sMensErro     : String;    // Mensagem da Contabilidade
   {iExercicio,iPeriodo, }                 // Periodo Contábil
   iTipoMov1                  : Integer;   // Tipos de Movimentações

   fParticip1,fParticip2,                  // Rateio de Custos
   fValLanc                   : Double;

   qryCcRD                    : TwwQuery;

begin
   qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
   //-------------------------------------------------------------------------------------
   if sTipoTab = 'B' then
   begin
      iTipoMov1 := 14;
      sMensErro := '';
   end else
   if sTipoTab = 'R' then
   begin
      iTipoMov1 := 18;
      sMensErro := ' (Reavaliação) ';
   end else
   begin
      iTipoMov1 := 35;
      sMensErro := ' (Acréscimo) ';
   end;
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := iPessoa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Depreciação
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov1,'D',iPlanoConta,sDebito,sCCDebito);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para Depreciação
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov1,'C',iPlanoConta,sCredito,sCCCredito);
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Débito para o Movimento de Baixa no Grupo ' + sGrupo +
                ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCredito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a crédito para o Movimento de Baixa no Grupo ' + sGrupo +
                ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Processamento do Rateio dos Custos
   //-------------------------------------------------------------------------------------
   sHistor    := 'Depreciacao';
   sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
   sHistor2   := '';
   sHistor3   := '';
   sHistor4   := '';
   fParticip1 := 0;
   fParticip2 := 0;
   //-------------------------------------------------------------------------------------
   // Busca Rateio da Depreciação do Bem
   //-------------------------------------------------------------------------------------
   qryCcRD.Close;
   qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
   qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
   qryCcRD.Open;
   //-------------------------------------------------------------------------------------
   qryCcRD.First;
   while not qryCcRD.EOF do
   begin
      sHistor := 'Depreciacao ProRata';
      if (fParticip1 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sDebito) then
         begin
            fParticip1 := 100;
            sCc        := '';
         end else
         begin
            fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fDeprec * fParticip1) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,sDebito,'',inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := False;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fParticip2 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sCredito) then
         begin
            fParticip2 := 100;
            sCc        := '';
         end else
         begin
            fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fDeprec * fParticip2) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,'',sCredito,inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := False;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      qryCcRD.Next;
   end;
   qryCcRD.Close;
   //-------------------------------------------------------------------------------------
   Result := True;
end;
//========================================================================================
Procedure TAtivoFixo.ParamFatorPeriodo(var rFator : Real; dDataUltDep,dDataMov : tDateTime);
var
   iMesFim,iAnoFim,iDiaFim,
   iDia,iMes,iAno           : Word;
   iNdias                   : LongInt;

begin
   iNDias := round(dDataMov - (dDataUltDep + 1)) + 1;
   DecodeDate(dDataMov, iAnoFim, iMesFim, iDiaFim);
   DecodeDate(DiasUteis.UltDiaMes(iAnoFim, iMesFim), iAno, iMes, iDia);
   rFator := (1 / 12 / iDia) * iNDias;
end;
//========================================================================================
// Função que Estorna a Depreciacao ProRata de um Bem
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function TAtivoFixo.EstornaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                                       dDataMov,dDataEst : tDate;
                                       bMostraMsg : boolean) : Integer;

var
   iPlnCodigo, iResult,
   iExercicio, iPeriodo           : Integer;
   sMascara, sMensagem            : String;
   fDepLancAnt                    : Double;
   qryAux,qryBem, qryReavaliacao,
   qryAcrescimo, qryUltMov        : TwwQuery;
   bTransacao                     : Boolean;
   dDataUltDep                    : tDateTime;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;
      if not qryReavaliacao.Prepared then
         qryReavaliacao.Prepare;
      if not qryAcrescimo.Prepared then
         qryAcrescimo.Prepare;
      if not qryUltMov.Prepared then
         qryUltMov.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após a Depreciacao
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) or
      (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > (dDataMov + 1)) then
   begin
      if bMostraMsg then
         MsgDlg('Existem movimentações com data posterior. Consulte Histórico de Movimentações!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   qryUltMov.Close;
   //-------------------------------------------------------------------------------------
   // Posiciona a Tabela BEM
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   if qryBem.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Text := ' SELECT DATAULTDEP '+
                      ' FROM GRUPO'+
                      ' WHERE (IDGRUPO = '+inttostr(qryBem.FieldByName('IDGRUPO').AsInteger)+')';
   qryAux.Open;
   if (not qryAux.FieldByName('DATAULTDEP').IsNull) and
      (dDataMov = qryAux.FieldByName('DATAULTDEP').AsDateTime) then
   begin
      result := 0;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   iResult := 0;
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // Retorna o Valor da Depreciacao do Bem e o ID da Movimentacao
      //----------------------------------------------------------------------------------
      iPlnCodigo := 0;
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO, PLNCODIGO, VALOFI, DATAULTDEP '+
                         ' FROM HISTORICOMOVIMENTACAO '+
                         ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (IDTIPOMOVIMENTACAO = 14) ';
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
         fDepLancAnt := qryAux.FieldByName('VALOFI').AsFloat;
         dDataUltDep := qryAux.FieldByName('DATAULTDEP').AsDateTime;
         if not (qryAux.FieldByName('PLNCODIGO').IsNull) then
            iPlnCodigo := qryAux.FieldByName('PLNCODIGO').AsInteger;
         //-------------------------------------------------------------------------------
         qryBem.Edit;
         qryBem.FieldByName('DEPLANC').AsCurrency    := qryBem.FieldByName('DEPLANC').asFloat - fDepLancAnt;
         qryBem.FieldByname('DATAULTDEP').AsDateTime := dDataUltDep;
         qryBem.FieldByname('FLGDEPREC').AsInteger   := 0;
         qryBem.Post;
         qryBem.ApplyUpdates;
      end;
      //----------------------------------------------------------------------------------
      // Retorna o valor depreciado dos Saldos de Reavaliação
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,PLNCODIGO,VALOFI,DATAULTDEP '+
                            ' FROM HISTORICOMOVIMENTACAO ' +
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ') ' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '   AND (IDTIPOMOVIMENTACAO = 18) ' +
                            '   AND (IDREAVALACRESC = ' + inttostr(qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) + ') ';
         qryAux.Open;
         if not qryAux.IsEmpty then
         begin
            fDepLancAnt := qryAux.FieldByName('VALOFI').AsFloat;
            dDataUltDep := qryAux.FieldByName('DATAULTDEP').AsDateTime;
            //----------------------------------------------------------------------------
            qryReavaliacao.Edit;
            qryReavaliacao.FieldByName('DEPLANC').AsCurrency    := qryReavaliacao.FieldByName('DEPLANC').asFloat - fDepLancAnt;
            qryReavaliacao.FieldByname('DATAULTDEP').AsDateTime := dDataUltDep;
            qryReavaliacao.FieldByname('FLGDEPREC').AsInteger   := 0;
            qryReavaliacao.Post;
         end;
         qryReavaliacao.Next;
      end;
      qryReavaliacao.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Retorna o Valor Depreciado nos Lançamentos da Tabela ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO, PLNCODIGO, VALOFI, DATAULTDEP '+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ') ' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '   AND (IDTIPOMOVIMENTACAO = 35) ' +
                            '   AND (IDREAVALACRESC = ' + inttostr(qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger) + ') ';
         qryAux.Open;
         if not qryAux.IsEmpty then
         begin
            fDepLancAnt := qryAux.FieldByName('VALOFI').AsFloat;
            dDataUltDep := qryAux.FieldByName('DATAULTDEP').AsDateTime;
            //----------------------------------------------------------------------------
            qryAcrescimo.Edit;
            qryAcrescimo.FieldByName('DEPLANC').AsCurrency    := qryAcrescimo.FieldByName('DEPLANC').asFloat - fDepLancAnt;
            qryAcrescimo.FieldByname('DATAULTDEP').AsDateTime := dDataUltDep;
            qryAcrescimo.FieldByname('FLGDEPREC').AsInteger   := 0;
            qryAcrescimo.Post;
         end;
         qryAcrescimo.Next;
      end;
      qryAcrescimo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // RETIRA O LINK DA PLANILHA CONTÁBIL
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                         ' SET PLNCODIGO = NULL '+
                         ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                         '                          FROM HISTORICOMOVIMENTACAO'+
                         '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                         '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '                            AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '                            AND (IDTIPOMOVIMENTACAO IN (14,18,35)) )';
      qryAux.ExecSQL;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            if not RemovePlanContab(iEmpresaProp) then
            begin
               iResult := EstornaLanc(True, iPlnCodigo, 'BASEDADOS', datetostr(dDataEst),
                                      iExercicio, iPeriodo, iEmpresaProp, sMascara);
               if (iResult = -1) then
               begin
                  MsgDlg('Estorno Depreciação : Estorno da Contabilidade não Executado !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end else
            begin
               //-------------------------------------------------------------------------
               with dtmAtivoFixo.qryParamCaf do
               begin
                  if not Active then
                  begin
                     Close;
                     ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                     Open;
                  end;
                  //----------------------------------------------------------------------
                  iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                        FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                        Sistema.IdUsuario, True, 0, sMascara);
               end;
               if iResult = -1 then
               begin
                  MsgDlg('Estorno Depreciação : Remoção da Planilha da Contabilidade não Executada !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end;
         end else
         begin
            iResult := -1;
            MsgDlg('Estorno Depreciação : Estorno da Planilha Contábil ' + inttostr(iPlnCodigo) +
                   ' não Executado !', 'Erro', mtError, [mbOk], 0);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Remove o Historico
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryEstornaMov.Prepared then qryEstornaMov.Prepare;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO'+
                            ' FROM HISTORICOMOVIMENTACAO'+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (14,18,35))';
         qryAux.Open;
         while not qryAux.Eof do
         begin
            qryEstornaMov.ParamByName('PIDBEM').AsInteger    := iBem;
            qryEstornaMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryEstornaMov.ParamByName('PIDMOVIM').AsInteger  := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaMov.ExecSQL;
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryAux.Close;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iResult;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
// Função que executa a Troca do Número da Placa de Tombamento Patrimonial
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)  (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)     (IDPESSOA)
// iBem         : id do Bem movimentado                              (IDBEM)
// fPlacaNova   : Número da Placa Nova                               (PLACA)
// dDataMov     : Data da Troca                                      (DATAMOVIMENTACAO)
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function tAtivoFixo.ExecutaTransfPlaca(iModulo, iEmpresaProp, iBem : Integer;
                                       fPlacaNova : double; dDataMov : tDateTime;
                                       bMostraMsg : boolean) : boolean;
const
   iTipoMovimentacao = 04;                                     // Código da Troca de Placa

var
   qryBem         : TwwQuery;
   bTransacao     : Boolean;
   iSeqHist       : Integer;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;

      if not qryRegistraTransfPlaca.Prepared then
         qryRegistraTransfPlaca.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem := TwwQuery(dtmAtivoFixo.qryBem);
   //-------------------------------------------------------------------------------------
   // Posiciona a Tabela BEM no Bem que terá a Placa Substituída
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   if qryBem.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if iModulo <= 0 then
   begin
      if bMostraMsg then
      begin
         MsgDlg('É obrigatório fornecer o código do MODULO!',
                'Erro',mtError,[mbOk],0);
      end;
      result := False;
      exit;
   end else
   begin
      if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
      begin
         if bMostraMsg then
         begin
            MsgDlg('Somente o módulo que cadastrou o bem pode manipula-lo',
                   'Erro',mtError,[mbOk],0);
         end;
         result := False;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      //-------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
      //-------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                       dDataMov,-1,0,0,0,-1,-1,-1,-1,-1,
                                       qryBem.FieldByName('PLACA').AsFloat,-1,-1,
                                       -1,-1,'',bMostraMsg);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Troca da Placa de Tombamento : RegistraMovimentacao');
      //----------------------------------------------------------------------------------
      // Altera a Tabela BEM
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('PLACA').AsFloat := fPlacaNova;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := True;
   except
      if bTransacao then
         RollBackTransacao;
      Result := False;
   end;
end;
{/========================================================================================
// Função que Registra a Troca de Placa
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraTransfPlaca(iSeqHist : Integer; fPlacaAnt : Double;
                                        bMostraMsg : Boolean) : Boolean;
var
   qryTransfPlaca : TwwQuery;

begin
   qryTransfPlaca := TwwQuery(dtmAtivoFixo.qryRegistraTransfPlaca);
   //-------------------------------------------------------------------------------------
   try
      qryTransfPlaca.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
      qryTransfPlaca.ParamByName('PPLACAANT').AsFloat         := fPlacaAnt;
      qryTransfPlaca.ExecSQL;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
      if bMostraMsg then
         Raise;
   end;
end;}
//========================================================================================
// Função que executa a Transferencia de Local de um Conjunto
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)  (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)     (IDPESSOA)
// iConjunto    : id do Conjunto movimentado                         (IDCONJUNTO)
// iIdLocalNovo : id da Nova Localização do bem                      (IDLOCALIZAÇÃO)
// iIdRespNovo  : id da Novo Responsável do bem                      (IDRESPONSAVEL)
// dDataMov     : Data da Transferência                              (DATAMOVIMENTACAO)
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
{/----------------------------------------------------------------------------------------
function tAtivoFixo.ExecutaTransfLocal(iModulo, iEmpresaProp, iConjunto : Integer;
                                       iIdLocalNovo, iIdRespNovo : Integer;
                                       dDataMov : tDateTime; bMostraMsg : boolean) : Boolean;

const
   iTipoMovimentacao = 11;                             // Código da Transferencia de Local

var
   qryConjunto, qryAux : TwwQuery;
   bTransacao          : Boolean;
   iSeqHist            : Integer;

begin
   with dtmAtivoFixo do
   begin
      if not qryConjunto.Prepared then
         qryConjunto.Prepare;

      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;

      if not qryRegistraTransfLocal.Prepared then
         qryRegistraTransfLocal.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryConjunto := TwwQuery(dtmAtivoFixo.qryConjunto);
   qryAux      := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // Posiciona as Tabela CONJUNTO no Conjunto que será transferido
   //-------------------------------------------------------------------------------------
   qryConjunto.Close;
   qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
   qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
   qryConjunto.Open;
   if qryConjunto.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao conjunto estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se nao está tranferindo para o mesmo local / responsável
   //-------------------------------------------------------------------------------------
   if ((qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger = iIdLocalNovo) and
       (qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger = iIdRespNovo)) then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos a localização/responsável estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Monta a query que irá processar os bens do conjunto
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Text := ' SELECT B.IDPESSOA, B.IDBEM' +
                      ' FROM BEM B, CONJUNTO C' +
                      ' WHERE (B.IDCONJUNTO = ' + inttostr(iConjunto) + ')' +
                      '   AND (B.BAIXATOTAL <> ' + #39 + 'S' + #39 + ')' +
                      '   AND (B.IDCONJUNTO = C.IDCONJUNTO)';
   qryAux.Open;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      while not qryAux.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(qryAux.FieldByName('IDBEM').AsInteger,
                                          iEmpresaProp,iTipoMovimentacao,-1,-1,
                                          iModulo,dDataMov,True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Transferência de Local : RegistraMovimentacao');
         //-------------------------------------------------------------------------------
         if not RegistraTransfLocal(iSeqHist, qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger,
                                    bMostraMsg) then
            Raise eExcessaoCAF.Create('Transferência de Local : RegistraTransfLocal');
         //-------------------------------------------------------------------------------
         qryAux.Next;
      end;
      //----------------------------------------------------------------------------------
      // Altera a Tabela Conjunto
      //----------------------------------------------------------------------------------
      qryConjunto.Edit;
      qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger := iIdLocalNovo;
      qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger := iIdRespNovo;
      qryConjunto.Post;
      qryConjunto.ApplyUpdates;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := True;
   except
      if bTransacao then
         RollBackTransacao;
      Result := False;
   end;
end;}
{/========================================================================================
// Função que Registra a Transferencia de Local no Historico
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraTransfLocal(iSeqHist, iIdLocalAnt, iIdRespAnt : integer;
                                        bMostraMsg : Boolean) : Boolean;
var
   qryTransfLocal  : TwwQuery;

begin
   qryTransfLocal := TwwQuery(dtmAtivoFixo.qryRegistraTransfLocal);
   //-------------------------------------------------------------------------------------
   try
      qryTransfLocal.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
      qryTransfLocal.ParamByName('PIDLOCALANT').AsInteger     := iIdLocalAnt;
      qryTransfLocal.ParamByName('PIDRESPANT').AsInteger      := iIdRespAnt;
      qryTransfLocal.ExecSQL;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
      if bMostraMsg then
         Raise;
   end;
end;}
//========================================================================================
// Função que executa a Transferencia de um Bem entre Conjuntos
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
// iModulo       : id do Módulo que incluiu o bem (Sistema.idModulo)  (IDMODULO)
// iEmpresaProp  : id da Empresa Proprietária (Sistema.idEmpresa)     (IDPESSOA)
// iBem          : id do Bem movimentado                              (IDBEM)
// iConjuntoNovo : id da Novo Conjunto do bem                         (IDCONJUNTO)
// dDataMov      : Data da Transferência                              (DATAMOVIMENTACAO)
//
// bMostraMsg    : True  - mostra mensagens da Função
//                 False - não mostra mensagens da Função
{/----------------------------------------------------------------------------------------
function tAtivoFixo.ExecutaTransfConjunto(iModulo, iEmpresaProp, iBem : Integer;
                                          iConjuntoNovo : Integer;
                                          dDataMov : tDateTime;
                                          Var iIdHistMovim : Integer;
                                          bMostraMsg : boolean) : Boolean;

const
   iTipoMovimentacao = 12;               // Código da Transferencia de Conjunto

var
   qryConjunto, qryBem         : TwwQuery;
   bTransacao                  : Boolean;
   iSeqHistTransfConj,
   iConjuntoAtual, iPlanilha   : Integer;
   sAtivProjeto                : String;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryConjunto.Prepared then
         qryConjunto.Prepare;

      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;

      if not qryRegistraTransfConj.Prepared then
         qryRegistraTransfConj.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryConjunto := TwwQuery(dtmAtivoFixo.qryConjunto);
   qryBem      := TwwQuery(dtmAtivoFixo.qryBem);
   //-------------------------------------------------------------------------------------
   // Posiciona as Tabelas CONJUNTO e BEM no Bem que será transferido
   //-------------------------------------------------------------------------------------
   qryConjunto.Close;
   qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
   qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoNovo;
   qryConjunto.Open;
   if qryConjunto.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao conjunto novo estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   if qryBem.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := False;
      exit;
   end;
   iConjuntoAtual := qryBem.FieldByName('IDCONJUNTO').AsInteger;
   //-------------------------------------------------------------------------------------
   // Verifica se nao está tranferindo para o mesmo conjunto
   //-------------------------------------------------------------------------------------
   if (iConjuntoAtual = iConjuntoNovo) then
   begin
      if (iIdHistMovim = 0) then
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao Conjunto Novo estão incorretos!',
                   'Erro',mtError,[mbOk],0);
      Result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
      //----------------------------------------------------------------------------------
      iSeqHistTransfConj := RegistraMovimentacao(iBem,iEmpresaProp,iTipoMovimentacao,-1,-1,
                                                 iModulo,dDataMov,True);
      if iSeqHistTransfConj = -1 then
         Raise eExcessaoCAF.Create('Transferência de Conjunto : RegistraMovimentacao');
      //----------------------------------------------------------------------------------
      if not RegistraTransfConj(iSeqHistTransfConj, iConjuntoAtual, bMostraMsg) then
         Raise eExcessaoCAF.Create('Transferência de Conjunto : RegistraTransfConj');
      //----------------------------------------------------------------------------------
      iIdHistMovim := iSeqHistTransfConj;
      //----------------------------------------------------------------------------------
      // Processa a transferencia dos saldos contábeis
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('UNIDNEGOC').IsNull then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               if not Active then
               begin
                  ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
                  Open;
               end;
               if not IsEmpty then
                  sAtivProjeto := FieldByName('ATIVPROJETO').AsString
               else
                  sAtivProjeto := '';
            end;
         end else
         begin
            sAtivProjeto := qryBem.FieldByName('UNIDNEGOC').AsString;
         end;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaTransferencia(iModulo, iEmpresaProp, iBem, dDataMov,
                                               qryBem.FieldByName('IDGRUPO').AsInteger,
                                               qryBem.FieldByName('IDGRUPO').AsInteger,
                                               iConjuntoAtual, iConjuntoNovo,
                                               '','',
                                               qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                               qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                               strtoint(sAtivProjeto),
                                               strtoint(sAtivProjeto),
                                               bMostraMsg);
         if (iPlanilha = -1) then
            Raise eExcessaoCAF.Create('Transferência de Conjunto : ContabilizaTransferencia');
         //-------------------------------------------------------------------------------
         // Registra no Historico a Planilha Gerada
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo.qryHistCtb do
         begin
            ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHistTransfConj;
            ParamByName('PPLNCODIGO').AsInteger      := iPlanilha;
            ExecSQL;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Altera a Tabela Bem
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      qryBem.Edit;
      qryBem.FieldByName('IDCONJUNTO').AsInteger := iConjuntoNovo;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := True;
   except
      if bTransacao then
         RollBackTransacao;
      Result := False;
   end;
end;}
{/========================================================================================
// Função que Registra a Transferencia de Conjunto no Historico
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraTransfConj(iSeqHist, iIdConjuntoAnt : integer;
                                       bMostraMsg : Boolean) : Boolean;
var
   qryTransfConj : TwwQuery;

begin
   qryTransfConj := TwwQuery(dtmAtivoFixo.qryRegistraTransfConj);
   //-------------------------------------------------------------------------------------
   try
      qryTransfConj.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
      qryTransfConj.ParamByName('PIDCONJANT').AsInteger      := iIdConjuntoAnt;
      qryTransfConj.ExecSQL;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
      if bMostraMsg then
         Raise;
   end;
end;}
//========================================================================================
// Função que executa a Transferencia de Grupo de um Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
// iModulo       : id do Módulo que incluiu o bem (Sistema.idModulo)  (IDMODULO)
// iEmpresaProp  : id da Empresa Proprietária (Sistema.idEmpresa)     (IDPESSOA)
// iBem          : id do Bem movimentado                              (IDBEM)
// iGrupoNovo    : id da Novo Grupo do bem                            (IDGRUPO)
// iConjuntoNovo : id do Novo Conjunto do Bem                         (IDCONJUNTO)
// iLocalNovo    : id da Nova Localização do Conjunto                 (IDLOCALIZACAO)
// iRespNovo     : id da Nova Localização do Conjunto                 (IDRESPONSAVEL)
// dDataMov      : Data da Transferência                              (DATAMOVIMENTACAO)
//
// bMostraMsg    : True  - mostra mensagens da Função
//                 False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function tAtivoFixo.ExecutaTransfGrupo(iModulo,
                                       iEmpresaProp,
                                       iBem : Integer;
                                       iGrupoNovo : Integer;
                                   Var iConjuntoNovo,
                                       iLocalNovo,
                                       iRespNovo : Integer;
                                       dDataMov : tDateTime;
                                       bMostraMsg : boolean) : Integer;

const
   iTipoMovimentacao = 05;          // Código da Transferencia de Grupo

var
   qryBem, qryGrupos, qryConjunto,
   qryLocalizacao,qryAux           : TwwQuery;
   iSeqHistTransfGrupo,
   iSeqHistTransfConj,
   iSeqHistTransfLocal,
   iPlanilha,
   iGrupoAtual,
   iConjuntoAtual,
   iLocalAtual, iRespAtual         : Integer;
   bTransacao                      : Boolean;
   sAtivProjeto,
   sCCustoAtual,sCCustoNovo,
   sSqlScript                      : String;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryGrupos.Prepared then
         qryGrupos.Prepare;

      if not qryConjunto.Prepared then
         qryConjunto.Prepare;

      if not qryLocalizacao.Prepared then
         qryLocalizacao.Prepare;

      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;

      if not qryRegistraTransfGrupo.Prepared then
         qryRegistraTransfGrupo.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryGrupos      := TwwQuery(dtmAtivoFixo.qryGrupos);
   qryConjunto    := TwwQuery(dtmAtivoFixo.qryConjunto);
   qryLocalizacao := TwwQuery(dtmAtivoFixo.qryLocalizacao);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // Posiciona as Tabelas GRUPO, CONJUNTO, LOCALIZACAO e BEM no Bem que será transferido
   //-------------------------------------------------------------------------------------
   qryGrupos.Close;
   qryGrupos.ParamByName('PIDGRUPO').AsInteger := iGrupoNovo;
   qryGrupos.Open;
   if qryGrupos.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao grupo novo estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (iConjuntoNovo <> -1) then
   begin
      qryConjunto.Close;
      qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
      qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoNovo;
      qryConjunto.Open;
      if qryConjunto.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao conjunto novo estão incorretos!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if (iLocalNovo <> -1) then
   begin
      qryLocalizacao.Close;
      qryLocalizacao.ParamByName('PIDPESSOA').AsInteger      := iEmpresaProp;
      qryLocalizacao.ParamByName('PIDLOCALIZACAO').AsInteger := iLocalNovo;
      qryLocalizacao.Open;
      if qryLocalizacao.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos a nova localização estão incorretos!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
      sCCustoNovo := qryLocalizacao.FieldByName('CODCENTROCUSTO').AsString;
   end;
   //-------------------------------------------------------------------------------------
   if (iRespNovo <> -1) then
   begin
      with dtmAtivoFixo do
      begin
         qryResponsavel.Close;
         qryResponsavel.ParamByName('PIDRESP').AsInteger := iRespNovo;
         qryResponsavel.Open;
         if qryResponsavel.IsEmpty then
         begin
            if bMostraMsg then
               MsgDlg('Os parâmetros relativos ao novo responsável estão incorretos!',
                      'Erro',mtError,[mbOk],0);
            result := -1;
            exit;
         end;
      end;
   end;
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   if qryBem.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if iModulo <= 0 then
   begin
      if bMostraMsg then
      begin
         MsgDlg('É obrigatório fornecer o código do MODULO!',
                'Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end else
   begin
      if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
      begin
         if bMostraMsg then
         begin
            MsgDlg('Somente o módulo que cadastrou o bem pode manipula-lo',
                   'Erro',mtError,[mbOk],0);
         end;
         result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   iGrupoAtual    := qryBem.FieldByName('IDGRUPO').AsInteger;
   iConjuntoAtual := qryBem.FieldByName('IDCONJUNTO').AsInteger;
   //-------------------------------------------------------------------------------------
   // Registra a localização/centro de custo atual do conjunto do bem
   //-------------------------------------------------------------------------------------
   qryConjunto.Close;
   qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
   qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoAtual;
   qryConjunto.Open;
   iLocalAtual  := qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger;
   iRespAtual   := qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger;
   qryLocalizacao.Close;
   qryLocalizacao.ParamByName('PIDPESSOA').AsInteger      := iEmpresaProp;
   qryLocalizacao.ParamByName('PIDLOCALIZACAO').AsInteger := iLocalAtual;
   qryLocalizacao.Open;
   sCCustoAtual := qryLocalizacao.FieldByName('CODCENTROCUSTO').AsString;
   //-------------------------------------------------------------------------------------
   if (iConjuntoNovo = -1) then
      iConjuntoNovo := iConjuntoAtual;
   if (iLocalNovo = -1) then
      iLocalNovo := iLocalAtual;
   if (iRespNovo = -1) then
      iRespNovo := iRespAtual;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   iPlanilha := 1;
   try
      //----------------------------------------------------------------------------------
      // SE O GRUPO INFORMADO FOR DIFERENTE DO ATUAL, EXECUTA TRANSFERÊNCIA DE GRUPO
      //----------------------------------------------------------------------------------
      iSeqHistTransfGrupo := -1;
      if (iGrupoAtual <> iGrupoNovo) then
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
         //-------------------------------------------------------------------------------
         iSeqHistTransfGrupo := RegistraMovimentacao(iBem, iEmpresaProp, iModulo,
                                                     iTipoMovimentacao,dDataMov,-1,0,0,0,
                                                     -1,iGrupoAtual,-1,-1,-1,-1,-1,
                                                     -1,-1,-1,'',True);
         if iSeqHistTransfGrupo = -1 then
            Raise eExcessaoCAF.Create('Transferência de Grupo : RegistraMovimentacao');
      end;
      //----------------------------------------------------------------------------------
      // SE O CONJUNTO INFORMADO FOR DIFERENTE DO ATUAL, EXECUTA TRANSFERÊNCIA DE CONJUNTO
      //----------------------------------------------------------------------------------
      iSeqHistTransfConj := -1;
      if (iConjuntoAtual <> iConjuntoNovo) then
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
         //-------------------------------------------------------------------------------
         iSeqHistTransfConj := RegistraMovimentacao(iBem, iEmpresaProp, iModulo,12,
                                                    dDataMov,-1,0,0,0,
                                                    -1,-1,iConjuntoAtual,-1,-1,-1,-1,
                                                    -1,-1,-1,'',True);
         if iSeqHistTransfConj = -1 then
            Raise eExcessaoCAF.Create('Transferência de Conjunto : RegistraMovimentacao');
      end;
      //----------------------------------------------------------------------------------
      // SE A LOCALIZAÇÃO INFORMADA FOR DIFERENTE DA ATUAL, EXECUTA TRANSFERÊNCIA DE LOCAL
      //----------------------------------------------------------------------------------
      iSeqHistTransfLocal := -1;
      if (iLocalAtual <> iLocalNovo) or (iRespAtual <> iRespNovo) then
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
         //-------------------------------------------------------------------------------
         iSeqHistTransfLocal := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 11,
                                                     dDataMov,-1,0,0,0,
                                                     -1,-1,-1,iLocalAtual,iRespAtual,-1,-1,
                                                     -1,-1,-1,'',True);
         if iSeqHistTransfLocal = -1 then
            Raise eExcessaoCAF.Create('Transferência de Local : RegistraMovimentacao');
      end;
      //----------------------------------------------------------------------------------
      // Processa a transferencia dos saldos contábeis
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('UNIDNEGOC').IsNull then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               if not Active then
               begin
                  ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
                  Open;
               end;
               if not IsEmpty then
                  sAtivProjeto := FieldByName('ATIVPROJETO').AsString
               else
                  sAtivProjeto := '';
            end;
         end else
         begin
            sAtivProjeto := qryBem.FieldByName('UNIDNEGOC').AsString;
         end;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaTransferencia(iModulo, iEmpresaProp, iBem, dDataMov,
                                               iGrupoAtual   , iGrupoNovo,
                                               iConjuntoAtual, iConjuntoNovo,
                                               sCCustoAtual  , sCCustoNovo,
                                               qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                               qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                               strtoint(sAtivProjeto), strtoint(sAtivProjeto),
                                               bMostraMsg);
         if (iPlanilha = -1) then
            Raise eExcessaoCAF.Create('Transferência : ContabilizaTransferencia');
         //-------------------------------------------------------------------------------
         // Registra no Historico a Planilha Gerada
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo.qryHistCtb do
         begin
            if (iPlanilha > 0) then
            begin
               if (iSeqHistTransfGrupo > 0) then
               begin
                  ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHistTransfGrupo;
                  ParamByName('PPLNCODIGO').AsInteger      := iPlanilha;
                  ExecSQL;
               end;
               if (iSeqHistTransfConj > 0) then
               begin
                  ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHistTransfConj;
                  ParamByName('PPLNCODIGO').AsInteger      := iPlanilha;
                  ExecSQL;
               end;
               if (iSeqHistTransfLocal > 0) then
               begin
                  ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHistTransfLocal;
                  ParamByName('PPLNCODIGO').AsInteger      := iPlanilha;
                  ExecSQL;
               end;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Altera a Tabela Bem
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      qryBem.Edit;
      qryBem.FieldByName('IDGRUPO').AsInteger    := iGrupoNovo;
      qryBem.FieldByName('IDCONJUNTO').AsInteger := iConjuntoNovo;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      if (iLocalAtual <> iLocalNovo) or (iRespAtual <> iRespNovo) then
      begin
         //-------------------------------------------------------------------------------
         // Altera a Localizacao do Conjunto
         //-------------------------------------------------------------------------------
         qryConjunto.Close;
         qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
         qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoNovo;
         qryConjunto.Open;
         qryConjunto.Edit;
         qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger := iLocalNovo;
         qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger := iRespNovo;
         qryConjunto.Post;
         qryConjunto.ApplyUpdates;
         //-------------------------------------------------------------------------------
         // Altera o Centro de Custo da Localizacao do Conjunto
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            qryAux.SQL.Text := ' UPDATE CONJUNTO ' +
                               ' SET IDLOCALIZACAO = ' + inttostr(iLocalNovo) + #13 +
                               ' WHERE (IDCONJUNTO = ' + inttostr(iConjuntoNovo) + ')';
            qryAux.ExecSQL;
            qryAux.SQL.Text := ' UPDATE RATEIODEPRECIACAO ' + #13 +
                               ' SET CODCENTROCUSTO = ' + #39 + sCCustoNovo + #39 + #13 +
                               ' WHERE (IDCONJUNTO = ' + inttostr(iConjuntoNovo) + ') '+ #13 +
                               '   AND (LTRIM(RTRIM(CODCENTROCUSTO)) = ' + #39 + sCCustoAtual + #39 + ')';
            qryAux.ExecSQL;
            if qryAux.RowsAffected = 0 then
            begin
               qryAux.SQL.Text := ' UPDATE RATEIODEPRECIACAO ' + #13 +
                                  ' SET CODCENTROCUSTO = ' + #39 + sCCustoNovo + #39 + #13 +
                                  ' WHERE (IDCONJUNTO = ' + inttostr(iConjuntoNovo) + ') '+ #13 +
                                  '   AND (PARTICIPACAO = 100)';
               qryAux.ExecSQL;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iPlanilha;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
{/========================================================================================
// Função que registra a Transferencia de Grupo no Historico
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraTransfGrupo(iSeqHist, iIdGrupoAnt : integer;
                                        bMostraMsg : Boolean) : Boolean;
var
   qryTransfGrupo : TwwQuery;

begin
   qryTransfGrupo := TwwQuery(dtmAtivoFixo.qryRegistraTransfGrupo);
   //-------------------------------------------------------------------------------------
   try
      qryTransfGrupo.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
      qryTransfGrupo.ParamByName('PIDGRUPANT').AsInteger      := iIdGrupoAnt;
      qryTransfGrupo.ExecSQL;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
      if bMostraMsg then
         Raise;
   end;
end;}
//========================================================================================
// Função que executa a Contabilizacao das Transferências de Grupo e Conjunto.
// Transferencia de Atividade/Projeto e SubConta preparada porem não terminada
//----------------------------------------------------------------------------------------
function TAtivoFixo.ContabilizaTransferencia(iModulo, iEmpresaProp, iBem : Integer;
                                             dDataMov : tDateTime;
                                             iGrupoAtual, iGrupoNovo,
                                             iConjuntoAtual, iConjuntoNovo : Integer;
                                             sCCustoAtual, sCCustoNovo : String;
                                             iSubContaAtual, iSubContaNovo,
                                             iAtivProjetoAtual, iAtivProjetoNovo : Integer;
                                             bMostraMsg : Boolean) : Integer;

var
   iExercicio, iPeriodo, iPlanilha                      : Integer;
   sMensagem                                            : String;
   qryBem, qryReavaliacao, qryAcrescimo                 : TwwQuery;
   bTransacao                                           : Boolean;
   fBaixaB, fBaixaD, fBaixaCM, fBaixaCMD,
   fDepCmBem, fDepDepLanc, fDepCmDep                    : Extended;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryReavaliacao.Prepared then
         qryReavaliacao.Prepare;

      if not qryAcrescimo.Prepared then
         qryAcrescimo.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // Calcula a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      fDepCmBem   := 0;
      fDepDepLanc := 0;
      fDepCmDep   := 0;
      if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),bMostraMsg,
                                fDepCmBem, fDepDepLanc, fDepCmDep) then
         Raise eExcessaoCAF.Create('Transferência : ExecutaDepreciacao');
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryMontaCtb.Prepared then
            qryMontaCtb.Prepare;

         if not qryGrupoCtb.Prepared then
            qryGrupoCtb.Prepare;

         if not qryConta.Prepared then
            qryConta.Prepare;

         if not qryCCrd.Prepared then
            qryCCrd.Prepare;

         if not qryPlanoConta.Prepared then
            qryPlanoConta.Prepare;

         if not qryMontaCtb.Active then
            qryMontaCtb.Open ;
      end;
      //----------------------------------------------------------------------------------
      // Baixa o bem transferido
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      //----------------------------------------------------------------------------------
      fBaixaB   := qryBem.FieldByName('VALORG').asFloat;
      fBaixaCM  := qryBem.FieldByName('CMBEM').asFloat;
      fBaixaD   := qryBem.FieldByName('DEPLANC').asFloat;
      fBaixaCMD := qryBem.FieldByName('CMDEP').asFloat;
      //----------------------------------------------------------------------------------
      iPlanilha := ContabilizaTransf(iModulo, iEmpresaProp, iBem,
                                     iGrupoAtual,iGrupoNovo,
                                     iConjuntoAtual,iConjuntoNovo,
                                     sCCustoAtual, sCCustoNovo,
                                     dDataMov,
                                     fBaixaB,fBaixaCM,fBaixaD,fBaixaCMD,
                                     qryBem.FieldByName('DESBEM').AsString,
                                     inttostr(iAtivProjetoAtual),
                                     'B',
                                     iSubContaAtual,
                                     qryBem.FieldByName('PLACA').AsString,
                                     bMostraMsg);
      if iPlanilha < 0 then
         Raise eExcessaoCAF.Create('Transferência : ContabilizaTransf (Bem)');
      //----------------------------------------------------------------------------------
      // Baixa as reavaliações do bem transferido
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         fBaixaB   := qryReavaliacao.FieldByName('VALORG').asFloat;
         fBaixaCM  := qryReavaliacao.FieldByName('CMBEM').asFloat;
         fBaixaD   := qryReavaliacao.FieldByName('DEPLANC').asFloat;
         fBaixaCMD := qryReavaliacao.FieldByName('CMDEP').asFloat;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaTransf(iModulo, iEmpresaProp, iBem,
                                        iGrupoAtual,iGrupoNovo,
                                        iConjuntoAtual,iConjuntoNovo,
                                        sCCustoAtual, sCCustoNovo,
                                        dDataMov,
                                        fBaixaB,fBaixaCM,fBaixaD,fBaixaCMD,
                                        qryBem.FieldByName('DESBEM').AsString,
                                        inttostr(iAtivProjetoAtual),'R',
                                        iSubContaAtual,
                                        qryBem.FieldByName('PLACA').AsString,
                                        bMostraMsg);
         if iPlanilha < 0 then
            Raise eExcessaoCAF.Create('Transferências : ContabilizaTransf (Reavaliacao)');
         //-------------------------------------------------------------------------------
         qryReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Baixa os acréscimos de valor do bem transferido
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         fBaixaB   := qryAcrescimo.FieldByName('VALORG').asFloat;
         fBaixaCM  := qryAcrescimo.FieldByName('CMBEM').asFloat;
         fBaixaD   := qryAcrescimo.FieldByName('DEPLANC').asFloat;
         fBaixaCMD := qryAcrescimo.FieldByName('CMDEP').asFloat;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaTransf(iModulo, iEmpresaProp, iBem,
                                        iGrupoAtual,iGrupoNovo,
                                        iConjuntoAtual,iConjuntoNovo,
                                        sCCustoAtual, sCCustoNovo,
                                        dDataMov,
                                        fBaixaB,fBaixaCM,fBaixaD,fBaixaCMD,
                                        qryBem.FieldByName('DESBEM').AsString,
                                        inttostr(iAtivProjetoAtual),'A',
                                        iSubContaAtual,
                                        qryBem.FieldByName('PLACA').AsString,
                                        bMostraMsg);
         if iPlanilha < 0 then
            Raise eExcessaoCAF.Create('Transferências : ContabilizaTransf (Acréscimos)');
         //-------------------------------------------------------------------------------
         qryAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) and (iPlanilha >= 0) then
      begin
         if not VerificaPeriodoContabil(iEmpresaProp, dDataMov, iExercicio, iPeriodo,
                                        sMensagem, bMostraMsg) then
            Raise eExcessaoCAF.Create('Transferências : VerificaPeriodoContabil');
         //-------------------------------------------------------------------------------
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo, dDataMov,
                                               sMensagem, bMostraMsg);
         dtmAtivoFixo.qryMontaCtb.Close;
         if (iPlanilha < 0) then
            Raise eExcessaoCAF.Create('Transferências : RegistraPlanilhaContabil');
      end;
      dtmAtivoFixo.qryMontaCtb.Close;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iPlanilha;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
// Função que Contabiliza a Transferencia
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iModulo        : id do Módulo que incluiu o bem (Sistema.IdModulo)
//    iPessoa        : id da Empresa Proprietária (Sistema.IdEmpresa)
//    iBem           : id do Bem movimentado
//    iGrupoAtual    : id do Grupo Atual do Bem movimentado
//    iGrupoNovo     : id do Grupo Novo do Bem movimentado
//    iConjuntoAtual : id do Conjunto Atual do Bem movimentado
//    iConjuntoNovo  : id do Conjunto Novo do Bem movimentado
//    dDataLanc      : Data da Baixa
//    fBaixaB        : Valores a serem Lancados
//    fBaixaCMB      :           ''
//    fBaixaD        :           ''
//    fBaixaCMD      :           ''
//    sDesBem        : Descrição do Bem
//    sAtivProjeto   : Unidade de Negócio
//    sTipoTab       : Define qual tabela está sendo processada (B - BEM, R - REAVALIACAO)
//    iSubConta      : id de SubConta
//    sPlaca         : Placa do Bem Movimentado
//
//    bMostraMsg     : True  - mostra mensagens
//                     False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaTransf(iModulo,iPessoa,iBem,
                                      iGrupoAtual, iGrupoNovo,
                                      iConjuntoAtual, iConjuntoNovo : Integer;
                                      sCCustoAtual, sCCustoNovo : String;
                                      dDataLanc : TDate;
                                      fBaixaB,fBaixaCMB,fBaixaD,fBaixaCMD : Double;
                                      sDesBem,sAtivProjeto,sTipoTab : String;
                                      iSubConta : Integer; sPlaca : String;
                                      bMostraMsg : Boolean) : Integer;

type
   tRateio = Record
      CODCENTROCUSTO : String;
      TIPO           : String;
      PARTICIPACAO   : Extended;
   end;

var
   aCcRDAtual, aCcRDNovo       : array [1..25] of tRateio;
   iMaxCcRDAtual, iMaxCcRDNovo,
   iCcRDAtual, iCcRDNovo       : Integer;

   sGrupo    ,                             // Descricao de Grupo do Bem

   sDebito   ,sCredito,                    // Contas Contábeis
   sDebitoCM ,sCreditoCM,
   sDebitoD  ,sCreditoD,
   sDebitoCMD,sCreditoCMD,

   sCCDebito   ,sCCCredito,                // Centros de Custos
   sCCDebitoCM ,sCCCreditoCM,
   sCCDebitoD  ,sCCCreditoD,
   sCCDebitoCMD,sCCCreditoCMD  : String;

   iPlanoConta                 : Integer;   // Plano de Contas

   sHistor  ,sHistor1,                     // Historico
   sHistor2 ,sHistor3,
   sHistor4 ,

   sCc      , sPlaCCust,                   // Conta e Plano do Centro de Custo
   sMensagem, sMensErro        : String;   // Mensagem da Contabilidade
   iExercicio,iPeriodo,                    // Periodo Contábil
   iTipoMov1,iTipoMov2,                    // Tipos de Movimentações
   iTipoMov3,iTipoMov4         : Integer;
   fParticip1,fParticip2,                  // Rateio de Custos
   fParticip3,fParticip4,
   fParticip5,fParticip6,
   fParticip7,fParticip8,
   fValLanc                    : Double;
   qryCcRD                     : TwwQuery;
   sNomeConta,sObrigaSubConta,
   sObrigaCC                   : String;
   bProcessar                  : Boolean;

begin
   qryCcRD := TwwQuery(dtmAtivoFixo.qryCcRD);
   //-------------------------------------------------------------------------------------
   if (sTipoTab = 'B') then
   begin
      iTipoMov1 := 01;
      iTipoMov2 := 15;
      iTipoMov3 := 14;
      iTipoMov4 := 21;
      sMensErro := '';
   end else
   if (sTipoTab = 'R') then
   begin
      if (fBaixaB > 0) then
      begin
         iTipoMov1 := 08;
      end else
      begin
         iTipoMov1 := 23;
      end;
      iTipoMov2 := 22;
      iTipoMov3 := 18;
      iTipoMov4 := 19;
      sMensErro := ' (Reavaliação) ';
   end else
   begin
      iTipoMov1 := 09;
      iTipoMov2 := 34;
      iTipoMov3 := 35;
      iTipoMov4 := 36;
      sMensErro := ' (Acréscimo) ';
   end;
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := iPessoa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Transferência
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupoNovo,iTipoMov1,'D',iPlanoConta,sDebito,sCCDebito);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para Transferência
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupoAtual,iTipoMov1,'D',iPlanoConta,sCredito,sCCCredito);
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Transferencia da Correção Monetária
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupoNovo,iTipoMov2,'D',iPlanoConta,sDebitoCM,sCCDebitoCM);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para Transferencia da Correção Monetária
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupoAtual,iTipoMov2,'D',iPlanoConta,sCreditoCM,sCCCreditoCM);
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Transferencia da Depreciacao
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupoAtual,iTipoMov3,'C',iPlanoConta,sDebitoD,sCCDebitoD);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para Transferencia da Depreciacao
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupoNovo,iTipoMov3,'C',iPlanoConta,sCreditoD,sCCCreditoD);
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Transferencia da Correção Monetária da Depreciacao
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupoNovo,iTipoMov4,'C',iPlanoConta,sDebitoCMD,sCCDebitoCMD);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para Transferencia da Correção Monetária da Depreciacao
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupoAtual,iTipoMov4,'C',iPlanoConta,sCreditoCMD,sCCCreditoCMD);
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupoNovo);
         MsgDlg('Conta a Débito para o Movimento de Transferência no Grupo ' + sGrupo +
                ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCredito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupoAtual);
         MsgDlg('Conta a crédito para o Movimento de Transferência no Grupo ' + sGrupo +
                ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebitoCM = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupoNovo);
         MsgDlg('Conta a Débito para o Movimento de Transferência de Correção Monetária no Grupo '
                + sGrupo + ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCreditoCM = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupoAtual);
         MsgDlg('Conta a crédito para o Movimento de Transferência de Correção Monetária no Grupo '
                + sGrupo + ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebitoD = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupoAtual);
         MsgDlg('Conta a Débito para o Movimento de Transferência de Depreciação no Grupo ' +
                sGrupo + ' não cadastrada !' + sMensErro, 'Erro', mtError, [mbOk], 0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCreditoD = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupoNovo);
         MsgDlg('Conta a crédito para o Movimento de Transferência de Depreciação no Grupo ' +
                sGrupo + ' não cadastrada !' + sMensErro, 'Erro', mtError, [mbOk], 0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebitoCMD = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupoNovo);
         MsgDlg('Conta a Débito para o Movimento de Transferência da Correção Monetária da ' +
                'Depreciação no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro,
                'Erro', mtError, [mbOk], 0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCreditoCMD = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupoAtual);
         MsgDlg('Conta a Crédito para o Movimento de Transferência da Correção Monetária da ' +
                'Depreciação no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro,
                'Erro', mtError, [mbOk], 0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Transfere para arrays os rateios de custo, para permitir que as transferências
   // de local sejam possíveis sem afetar a transação
   //-------------------------------------------------------------------------------------
   qryCcRD.Close;
   qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
   qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoAtual;
   qryCcRD.Open;
   iMaxCcRDAtual := 1;
   while not qryCcRD.EOF do
   begin
      aCcRDAtual[iMaxCcRDAtual].CODCENTROCUSTO := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
      aCcRDAtual[iMaxCcRDAtual].TIPO           := qryCcRD.FieldByName('TIPO').AsString;
      aCcRDAtual[iMaxCcRDAtual].PARTICIPACAO   := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
      iMaxCcRDAtual := iMaxCcRDAtual + 1;
      qryCcRD.Next;
   end;
   //-------------------------------------------------------------------------------------
   qryCcRD.Close;
   qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
   qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoNovo;
   qryCcRD.Open;
   iMaxCcRDNovo := 1;
   while not qryCcRD.EOF do
   begin
      aCcRDNovo[iMaxCcRDNovo].CODCENTROCUSTO := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
      aCcRDNovo[iMaxCcRDNovo].TIPO           := qryCcRD.FieldByName('TIPO').AsString;
      aCcRDNovo[iMaxCcRDNovo].PARTICIPACAO   := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
      iMaxCcRDNovo := iMaxCcRDNovo + 1;
      qryCcRD.Next;
   end;
   qryCcRD.Close;
   //-------------------------------------------------------------------------------------
   // Atualiza o Centro de Custo do Conjunto Novo, caso haja tranferência de local
   //-------------------------------------------------------------------------------------
   if (sCCustoNovo <> sCCustoAtual) then
   begin
      iCcRDNovo := 1;
      while (iCcRDNovo < iMaxCcRDNovo) do
      begin
         if (aCcRDNovo[iCcRDNovo].CODCENTROCUSTO = sCCustoAtual) then
            aCcRDNovo[iCcRDNovo].CODCENTROCUSTO := sCCustoNovo;
         iCcRDNovo := iCcRDNovo + 1;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se existe mudanca de Conta Contabil e/ou Centro de Custo. Caso não haja
   // mudanca, não gera planilha contabil.
   //-------------------------------------------------------------------------------------
   bProcessar := True;
   if ((sDebito  = sCredito)  and (sDebitoCM  = sCreditoCM) and
       (sDebitoD = sCreditoD) and (sDebitoCMD = sCreditoCMD)) then
   begin
      bProcessar := False;
      //----------------------------------------------------------------------------------
      // Verifica se existem centros de custos para as contas acima
      //----------------------------------------------------------------------------------
      sObrigaCC := 'N';
      FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito, sObrigaCC, sNomeConta, sObrigaSubConta);
      if sObrigaCC = 'N' then
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCM, sObrigaCC, sNomeConta, sObrigaSubConta);
      if sObrigaCC = 'N' then
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoD, sObrigaCC, sNomeConta, sObrigaSubConta);
      if sObrigaCC = 'N' then
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCMD, sObrigaCC, sNomeConta, sObrigaSubConta);
      //----------------------------------------------------------------------------------
      if (sObrigaCC = 'S') then
      begin
         iCcRDAtual := 1;
         iCcRDNovo  := 1;
         while (iCcRDAtual < iMaxCcRDAtual) do
         begin
            if (aCcRDAtual[iCcRDAtual].CODCENTROCUSTO <>
                aCcRDNovo[iCcRDNovo].CODCENTROCUSTO) then
               bProcessar := True;
            iCcRDAtual := iCcRDAtual + 1;
            iCcRDNovo  := iCcRDNovo  + 1;
         end;
      end;
   end;
   if not bProcessar then
   begin
      Result := 0;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   // Processamento do Rateio dos Custos
   //-------------------------------------------------------------------------------------
   if (sTipoTab = 'B') then
   begin
      sHistor := 'Transferência Grupo/Centro de Custo';
   end else
   if (sTipoTab = 'R') then
   begin
      sHistor := 'Transferência Grupo/Centro de Custo (Reavaliação)';
   end else
   if (sTipoTab = 'A') then
   begin
      sHistor := 'Transferência Grupo/Centro de Custo (Acréscimo)';
   end;
   sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
   sHistor2   := '';
   sHistor3   := '';
   sHistor4   := '';
   fParticip1 := 0;
   fParticip2 := 0;
   fParticip3 := 0;
   fParticip4 := 0;
   fParticip5 := 0;
   fParticip6 := 0;
   fParticip7 := 0;
   fParticip8 := 0;
   //-------------------------------------------------------------------------------------
   // Busca Rateio da Depreciação do Bem do Grupo/Conjunto Atual
   //-------------------------------------------------------------------------------------
   iCcRDAtual := 1;
   while (iCcRDAtual < iMaxCcRDAtual) do
   begin
      if (fParticip2 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //-------------------------------------------------------------------------------
         if (sObrigaCC = 'S') then
         begin
            if aCcRDAtual[iCcRDAtual].TIPO = 'A' then
            begin
               fParticip2 := aCcRDAtual[iCcRDAtual].PARTICIPACAO;
               sCc        := aCcRDAtual[iCcRDAtual].CODCENTROCUSTO;
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjuntoNovo) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := -1;
               exit;
            end;
         end else
         begin
            fParticip2 := 100;
            sCc        := '';
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fBaixaB * fParticip2) / 100;
         //-------------------------------------------------------------------------------
         if (iGrupoAtual <> iGrupoNovo) or (sCC <> '') then     // Não altera centro de custo de depreciação
         begin                                                  // caso não haja transferencia de grupo
            if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,'',sCredito,inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupoAtual,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      sHistor := 'Transf. Correção Monetária de Bem ';
      if (fParticip4 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCM,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //-------------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if aCcRDAtual[iCcRDAtual].TIPO = 'A' then
            begin
               fParticip4 := aCcRDAtual[iCcRDAtual].PARTICIPACAO;
               sCc        := aCcRDAtual[iCcRDAtual].CODCENTROCUSTO;
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjuntoNovo) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := -1;
               exit;
            end;
         end else
         begin
            fParticip4 := 100;
            sCc        := '';
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fBaixaCMB * fParticip4) / 100;
         //-------------------------------------------------------------------------------
         if (iGrupoAtual <> iGrupoNovo) or (sCC <> '') then
         begin
            if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,'',sCreditoCM,inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupoAtual,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      sHistor := 'Transf. Depreciacao do Bem ';
      if (fParticip5 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoD,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //-------------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if aCcRDAtual[iCcRDAtual].TIPO = 'A' then
            begin
               fParticip5 := aCcRDAtual[iCcRDAtual].PARTICIPACAO;
               sCc        := aCcRDAtual[iCcRDAtual].CODCENTROCUSTO;
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjuntoNovo) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := -1;
               exit;
            end;
         end else
         begin
            fParticip5 := 100;
            sCc        := '';
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fBaixaD * fParticip5) / 100;
         //-------------------------------------------------------------------------------
         if (iGrupoAtual <> iGrupoNovo) or (sCC <> '') then
         begin
            if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,sDebitoD,'',inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupoAtual,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      sHistor := 'Transf. Correção Monetária da Depreciação do Bem ';
      if (fParticip8 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCMD,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //----------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if aCcRDAtual[iCcRDAtual].TIPO = 'A' then
            begin
               fParticip8 := aCcRDAtual[iCcRDAtual].PARTICIPACAO;
               sCc        := aCcRDAtual[iCcRDAtual].CODCENTROCUSTO;
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjuntoNovo) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := -1;
               exit;
            end;
         end else
         begin
            fParticip8 := 100;
            sCc        := '';
         end;
         //----------------------------------------------------------------------------
         fValLanc := (fBaixaCMD * fParticip8) / 100;
         //----------------------------------------------------------------------------
         if (iGrupoAtual <> iGrupoNovo) or (sCC <> '') then
         begin
            if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,'',sDebitoCMD,inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupoAtual,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      iCcRDAtual := iCcRDAtual + 1;
   end;
   //-------------------------------------------------------------------------------------
   // Busca Rateio da Depreciação do Bem do Grupo/Conjunto Novo
   //-------------------------------------------------------------------------------------
   iCcRDNovo := 1;
   while iCcRDNovo < iMaxCcRDNovo do
   begin
      if (fParticip1 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //-------------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if aCcRDNovo[iCcRDNovo].TIPO = 'A' then
            begin
               fParticip1 := aCcRDNovo[iCcRDNovo].PARTICIPACAO;
               sCc        := aCcRDNovo[iCcRDNovo].CODCENTROCUSTO;
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjuntoNovo) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := -1;
               exit;
            end;
         end else
         begin
            fParticip1 := 100;
            sCc        := '';
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fBaixaB * fParticip1) / 100;
         //-------------------------------------------------------------------------------
         if (iGrupoAtual <> iGrupoNovo) or (sCC <> '') then
         begin
            if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,sDebito,'',inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupoNovo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      sHistor := 'Baixa da Correção Monetária de Bem ';
      if (fParticip3 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCM,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //-------------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if aCcRDNovo[iCcRDNovo].TIPO = 'A' then
            begin
               fParticip3 := aCcRDNovo[iCcRDNovo].PARTICIPACAO;
               sCc        := aCcRDNovo[iCcRDNovo].CODCENTROCUSTO;
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjuntoNovo) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := -1;
               exit;
            end;
         end else
         begin
            fParticip3 := 100;
            sCc        := '';
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fBaixaCMB * fParticip3) / 100;
         //-------------------------------------------------------------------------------
         if (iGrupoAtual <> iGrupoNovo) or (sCC <> '') then
         begin
            if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,sDebitoCM,'',inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupoNovo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      sHistor := 'Baixa da Depreciacao do Bem ';
      if (fParticip6 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoD,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //----------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if aCcRDNovo[iCcRDNovo].TIPO = 'A' then
            begin
               fParticip6 := aCcRDNovo[iCcRDNovo].PARTICIPACAO;
               sCc        := aCcRDNovo[iCcRDNovo].CODCENTROCUSTO;
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjuntoNovo) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := -1;
               exit;
            end;
         end else
         begin
            fParticip6 := 100;
            sCc        := '';
         end;
         //----------------------------------------------------------------------------
         fValLanc := (fBaixaD * fParticip6) / 100;
         //----------------------------------------------------------------------------
         if (iGrupoAtual <> iGrupoNovo) or (sCC <> '') then
         begin                                               
            if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,'',sCreditoD,inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupoNovo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
      end;
      //-------------------------------------------------------------------------------
      sHistor := 'Baixa da Correção Monetária da Depreciação do Bem ';
      if (fParticip7 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCMD,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //----------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if aCcRDNovo[iCcRDNovo].TIPO = 'A' then
            begin
               fParticip7 := aCcRDNovo[iCcRDNovo].PARTICIPACAO;
               sCc        := aCcRDNovo[iCcRDNovo].CODCENTROCUSTO;
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjuntoNovo) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := -1;
               exit;
            end;
         end else
         begin
            fParticip7 := 100;
            sCc        := '';
         end;
         //----------------------------------------------------------------------------
         fValLanc := (fBaixaCMD * fParticip7) / 100;
         //----------------------------------------------------------------------------
         if (iGrupoAtual <> iGrupoNovo) or (sCC <> '') then
         begin                                               
            if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,sCreditoCMD,'',inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupoNovo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;  
      end;
      //----------------------------------------------------------------------------------
      iCcRDNovo := iCcRDNovo + 1;
   end;
   Result := 0;
end;
//========================================================================================
// Função que executa o estorno de uma transferencia de grupo / conjunto
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function tAtivoFixo.EstornaTransfGrupo(iModulo, iEmpresaProp, iBem : Integer;
                                       dDataMov, dDataEst : tDate;
                                       iIdHistMovim : Integer;
                                       bMostraMsg : boolean) : Integer;
var
   iPlnCodigo, iResult,
   iExercicio,iPeriodo                    : Integer;
   sMascara,sMensagem,sCCustoAtual        : String;
   qryAux,qryBem,qryUltMov                : TwwQuery;
   bTransacao                             : Boolean;

begin
   with dtmAtivoFixo do
   begin
      if not qryUltMov.Prepared then
         qryUltMov.Prepare;

      if not qryBem.Prepared then
         qryBem.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após a Transferência
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
   begin
      if bMostraMsg then
         MsgDlg('Existe movimentação após a transferência. Consulte Histórico de Movimentação!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Posiciona a Tabela BEM
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   if qryBem.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Lê o Centro de Custo Atual
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo do
   begin
      qryConjunto.Close;
      qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
      qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := qryBem.FieldByName('IDCONJUNTO').AsInteger;
      qryConjunto.Open;
      qryLocalizacao.Close;
      qryLocalizacao.ParamByName('PIDPESSOA').AsInteger      := iEmpresaProp;
      qryLocalizacao.ParamByName('PIDLOCALIZACAO').AsInteger := qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger;
      qryLocalizacao.Open;
      sCCustoAtual := qryLocalizacaoCODCENTROCUSTO.AsString;
   end;
   //-------------------------------------------------------------------------------------
   if (iIdHistMovim > 0) then
   begin
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT PLNCODIGO' +
                         ' FROM HISTORICOMOVIMENTACAO ' +
                         ' WHERE (IDMOVIMENTACAO = ' + inttostr(iIdHistMovim) + ')' +
                         '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (IDTIPOMOVIMENTACAO IN (05,11,12))';
      qryAux.Open;
      //----------------------------------------------------------------------------------
      if (qryAux.IsEmpty) then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao bem estão incorretos (HistMovBem)!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if (iIdHistMovim > 0) then
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT PLNCODIGO'+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDMOVIMENTACAO = ' + inttostr(iIdHistMovim) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (05,11,12))';
      end else
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT PLNCODIGO'+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (05,11,12))';
      end;
      qryAux.Open;
      if not qryAux.FieldByName('PLNCODIGO').IsNull then
      begin
         qryAux.First;
         iPlnCodigo := qryAux.FieldByName('PLNCODIGO').AsInteger;
         if (qryAux.RecordCount > 1) then
         begin
            qryAux.Next;
            if (qryAux.FieldByName('PLNCODIGO').AsInteger <> iPlnCodigo) then
            begin
             //iPlnCodigo2 := qryAux.FieldByName('PLNCODIGO').AsInteger;
            end else
            begin
             //iPlnCodigo2 := 0;
            end;
         end;
      end else
      begin
         iPlnCodigo  := 0;
       //iPlnCodigo2 := 0;
      end;
      //----------------------------------------------------------------------------------
      // RETIRA O LINK DA PLANILHA CONTÁBIL
      //----------------------------------------------------------------------------------
      if (iIdHistMovim > 0) then
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                            ' SET PLNCODIGO = NULL '+
                            ' WHERE (IDMOVIMENTACAO = ' + inttostr(iIdHistMovim) + ')';
      end else
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                            ' SET PLNCODIGO = NULL '+
                            ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                            '                          FROM HISTORICOMOVIMENTACAO'+
                            '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '                            AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '                            AND (IDTIPOMOVIMENTACAO IN (05,11,12)) )';
      end;
      qryAux.ExecSQL;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            if not RemovePlanContab(iEmpresaProp) then
            begin
               iResult := EstornaLanc(True, iPlnCodigo, 'BASEDADOS', datetostr(dDataEst),
                                      iExercicio, iPeriodo, iEmpresaProp, sMascara);
               if iResult = -1 then
               begin
                  MsgDlg('Estorno Transferência : Estorno da Contabilidade não Executado !',
                         'Erro', mtError, [mbOk], 0);
                  Raise eExcessaoCAF.Create('Estorno Transferência : EstornaLancContab');
               end;
            end else
            begin
               //-------------------------------------------------------------------------
               with dtmAtivoFixo.qryParamCaf do
               begin
                  if not Active then
                  begin
                     Close;
                     ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                     Open;
                  end;
                  //----------------------------------------------------------------------
                  iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                        FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                        Sistema.IdUsuario, True, 0, sMascara);
               end;
               if iResult = -1 then
               begin
                  MsgDlg('Estorno Transferência : Remoção da Planilha da Contabilidade não Executada !',
                         'Erro', mtError, [mbOk], 0);
                  Raise eExcessaoCAF.Create('Estorno Transferência : ExcluiLancContab');
               end;
            end;
         end else
         begin
            MsgDlg('Estorno Transferência : Estorno da Planilha Contábil ' + inttostr(iPlnCodigo) +
                   ' não Executado !', 'Erro', mtError, [mbOk], 0);
            Raise eExcessaoCAF.Create('Estorno Transferência : EstornaPlanilhaContabil');
         end;
      end;
      //----------------------------------------------------------------------------------
      if (iIdHistMovim > 0) then
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO, '+
                            '        IDGRUPANT, IDCONJANT, IDLOCALANT, IDRESPANT ' +
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDMOVIMENTACAO = ' + inttostr(iIdHistMovim) + ')' +
                            ' ORDER BY HM.IDMOVIMENTACAO DESC' ;
      end else
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, ' +
                            '        IDGRUPANT, IDCONJANT, IDLOCALANT, IDRESPANT ' +
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ') ' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '   AND (IDTIPOMOVIMENTACAO IN (05,11,12)) ' +
                            ' ORDER BY HM.IDMOVIMENTACAO DESC' ;
      end;
      qryAux.Open;
      //----------------------------------------------------------------------------------
      while not qryAux.EOF do
      begin
         qryBem.Edit;
         if (qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 05) then
         begin
            qryBem.FieldByName('IDGRUPO').AsInteger := qryAux.FieldByName('IDGRUPANT').AsInteger;
         end else
         if (qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 12) then
         begin
            qryBem.FieldByName('IDCONJUNTO').AsInteger := qryAux.FieldByName('IDCONJANT').AsInteger;
         end;
         qryBem.Post;
         //-------------------------------------------------------------------------------
         if (qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 11) then
         begin
            //----------------------------------------------------------------------------
            // Retorna os dados do Conjunto
            //----------------------------------------------------------------------------
            with dtmAtivoFixo do
            begin
               qryLocalizacao.Close;
               qryLocalizacao.ParamByName('PIDPESSOA').AsInteger      := iEmpresaProp;
               qryLocalizacao.ParamByName('PIDLOCALIZACAO').AsInteger := qryAux.FieldByName('IDLOCALANT').AsInteger;
               qryLocalizacao.Open;
               //-------------------------------------------------------------------------
               sqlScript.Script.Text := ' UPDATE CONJUNTO ' +
                                        ' SET IDLOCALIZACAO = ' + qryAux.FieldByName('IDLOCALANT').AsString + ', ' + #13 +
                                        '     IDRESPONSAVEL = ' + qryAux.FieldByName('IDRESPANT').AsString + #13 +
                                        ' WHERE (IDCONJUNTO = ' + qryBem.FieldByName('IDCONJUNTO').AsString + ');' + #13 +

                                        ' UPDATE RATEIODEPRECIACAO ' + #13 +
                                        ' SET CODCENTROCUSTO = ' + #39 + qryLocalizacaoCODCENTROCUSTO.AsString + #39 + #13 +
                                        ' WHERE (IDCONJUNTO = ' + qryBem.FieldByName('IDCONJUNTO').AsString + ') '+ #13 +
                                        '   AND (LTRIM(RTRIM(CODCENTROCUSTO)) = ' + #39 + sCCustoAtual + #39 + ');';
               sqlScript.Execute;
            end;
         end;
         qryAux.Next;
      end;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      qryAux.First;
      while not qryAux.EOF do
      begin
         dtmAtivoFixo.qryEstornaMov.ParamByName('PIDBEM').AsInteger    := iBem;
         dtmAtivoFixo.qryEstornaMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         dtmAtivoFixo.qryEstornaMov.ParamByName('PIDMOVIM').AsInteger  := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
         dtmAtivoFixo.qryEstornaMov.ExecSQL;
         //-------------------------------------------------------------------------------
         qryAux.Next;
      end;
      qryAux.Close;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := 1;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
// Função que executa o Acréscimo de Valor
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)  (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)     (IDPESSOA)
// iBem         : id do Bem movimentado                              (IDBEM)
// dDataAcres   : Data do fato que gerou o acréscimo de valor        (DATAACRESCIMO)
// fValAcres    : Valor do Acréscimo de Valor em Moeda Corrente      (VALORG/VALOFI)
// sObs         : Informações relativas ao fato gerador do acréscimo
// iTipoDespesa : Tipo de Despesa que gerou o acréscimo
// fTaxaDep     : Taxa de Depreciacao calculada
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function tAtivoFixo.ExecutaAcrescimo(iModulo, iEmpresaProp, iBem : Integer;
                                     dDataAcres : tDateTime; fValAcres : Double;
                                     sObs : String; iTipoDespesa : Integer;
                                     Var fTaxaDep : double; bMostraMsg : boolean):Integer;

const
   iTipoMovimentacao = 9;                                  // Codigo de Reavaliacao de Bem

var
   iPlanoConta,
   iSeqHist, iPlanilha, iIdAcrescimo                 : Integer;
   sDebito  , sDebitoCM  , sCredito  , sCreditoCM,
   sCCDebito, sCCDebitoCM, sCCCredito, sCCCreditoCM,
   sAtivProjeto,sMensagem                            : String;
   fSldCtbImob, fValFis, fValGer                     : Double;
   qryBem                                            : TwwQuery;
   bTransacao                                        : Boolean;
   aIdHistMov                                        : array [1..1] of Integer;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;

      if not qryRegistraAcrescimo.Prepared then
         qryRegistraAcrescimo.Prepare;

      if not qryRegistraAcresc.Prepared then
         qryRegistraAcresc.Prepare;

      if not qryTipoDespAV.Prepared then
         qryTipoDespAV.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem := TwwQuery(dtmAtivoFixo.qryBem);
   //-------------------------------------------------------------------------------------
   // Valida os parâmetros obrigatórios para acréscimo de valor
   //-------------------------------------------------------------------------------------
   if (dDataAcres <= 0) then
   begin
      if bMostraMsg then
         MsgDlg('Informe o Data do Acréscimo de Valor!','Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (fValAcres <= 0) then
   begin
      if bMostraMsg then
         MsgDlg('Informe o Valor do Acréscimo de Valor!','Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sObs = '') then
   begin
      if bMostraMsg then
         MsgDlg('Declare as informações relativas ao Fato Gerador do Acréscimo de Valor',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Posiciona a Tabela BEM no bem que terá Acréscimo
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   if qryBem.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if iModulo <= 0 then
   begin
      if bMostraMsg then
      begin
         MsgDlg('É obrigatório fornecer o código do MODULO!',
                'Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end else
   begin
      if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
      begin
         if bMostraMsg then
         begin
            MsgDlg('Somente o módulo que cadastrou o bem pode manipula-lo',
                   'Erro',mtError,[mbOk],0);
         end;
         result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Calcula a taxa de depreciação, baseado na vida util restante do bem
   //-------------------------------------------------------------------------------------
   dtmAtivoFixo.qryReavaliacao.Close;
   dtmAtivoFixo.qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   dtmAtivoFixo.qryReavaliacao.ParamByName('PIDBEM').AsInteger := iBem;
   dtmAtivoFixo.qryReavaliacao.Open;
   if (dtmAtivoFixo.qryReavaliacao.IsEmpty) then
   begin
      fTaxaDep := CalculaTaxaDep((qryBem.FieldByName('DEPLANC').asFloat +
                                  qryBem.FieldByName('CMDEP').asFloat),
                                 (qryBem.FieldByName('VALORG').asFloat +
                                  qryBem.FieldByName('CMBEM').asFloat),
                                  qryBem.FieldByName('TAXADEP').asFloat,
                                  dDataAcres);
   end else
   begin
      if (dtmAtivoFixo.qryReavaliacao.Locate('FLGULTREAVAL',1,[])) then
      begin
         fTaxaDep := CalculaTaxaDep((dtmAtivoFixo.qryReavaliacao.FieldByName('DEPLANC').asFloat +
                                     dtmAtivoFixo.qryReavaliacao.FieldByName('CMDEP').asFloat),
                                    (dtmAtivoFixo.qryReavaliacao.FieldByName('VALORG').asFloat +
                                     dtmAtivoFixo.qryReavaliacao.FieldByName('CMBEM').asFloat),
                                     dtmAtivoFixo.qryReavaliacao.FieldByName('TAXADEP').asFloat,
                                     dDataAcres);
      end else
      begin
         fTaxaDep := CalculaTaxaDep((qryBem.FieldByName('DEPLANC').asFloat +
                                     qryBem.FieldByName('CMDEP').asFloat),
                                    (qryBem.FieldByName('VALORG').asFloat +
                                     qryBem.FieldByName('CMBEM').asFloat),
                                     qryBem.FieldByName('TAXADEP').asFloat,
                                     dDataAcres);
      end;
   end;
   dtmAtivoFixo.qryReavaliacao.Close;
   //-------------------------------------------------------------------------------------
   // Le os Parametros do CAF
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCAF do
   begin
      Close;
      ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      // Calcula os valores fornecidos em moeda fiscal e gerencial
      //----------------------------------------------------------------------------------
      fValFis := fValAcres / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                           dDataAcres, bMostraMsg);
      fValGer := fValAcres / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                           dDataAcres, bMostraMsg);
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
      //----------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                       dDataAcres, -1, fValAcres, fValFis, fValGer,
                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',True);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Acréscimo : RegistraMovimentacao');
      //----------------------------------------------------------------------------------
      // Registra o Acréscimo de Valor
      //----------------------------------------------------------------------------------
      iIdAcrescimo := RegistraAcrescimo(iBem,iEmpresaProp,iSeqHist,fTaxaDep,dDataAcres,
                      fValAcres, fValFis, fValGer, 0, 0, 0, 0, 0, -1, -1,bMostraMsg);
      if (iIdAcrescimo <= 0) then
         Raise eExcessaoCAF.Create('Acréscimo : RegistraAcrescimo');
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(Sistema.IdModulo, iEmpresaProp, iBem,
                                    dDataAcres,
                                    fValAcres,0,0,0,
                                    0,0,0,0,
                                    0,0,0,0,
                                    0) then
         Raise eExcessaoCAF.Create('Acréscimo : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      if (IntegraContab(iEmpresaProp)) and
         (qryBem.FieldByName('CONTROLE').asString = 'T') then
      begin
         with dtmAtivoFixo do
         begin
            if not qryMontaCtb.Prepared then
               qryMontaCtb.Prepare;

            if not qryGrupoCtb.Prepared then
               qryGrupoCtb.Prepare;

            if not qryConta.Prepared then
               qryConta.Prepare;

            if not qryCCrd.Prepared then
               qryCCrd.Prepare;

            if not qryPlanoConta.Prepared then
               qryPlanoConta.Prepare;

            if not qryHistCtb.Prepared then
               qryHistCtb.Prepare;

            qryMontaCtb.Open;
         end;
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('UNIDNEGOC').IsNull then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               if not Active then
               begin
                  ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
                  Open;
               end;
               if not IsEmpty then
                  sAtivProjeto := FieldByName('ATIVPROJETO').AsString
               else
                  sAtivProjeto := '';
            end;
         end else
         begin
            sAtivProjeto := qryBem.FieldByName('UNIDNEGOC').AsString;
         end;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaAcrescimo(iModulo,
                                           qryBem.FieldByName('IDPESSOA').AsInteger,
                                           qryBem.FieldByName('IDGRUPO').AsInteger,
                                           qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                           qryBem.FieldByName('IDBEM').AsInteger,
                                           dDataAcres,fValAcres,
                                           qryBem.FieldByName('DESBEM').AsString,
                                           sAtivProjeto,
                                           qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                           qryBem.FieldByName('PLACA').AsString,
                                           bMostraMsg);
         dtmAtivoFixo.qryMontaCtb.Close;
         if (iPlanilha <= 0) then
            Raise eExcessaoCAF.Create('Acréscimo : ContabilizaAcrescimo');
         //-------------------------------------------------------------------------------
         // Registra no Historico a Planilha Gerada
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo.qryHistCtb do
         begin
            ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[1];
            ParamByName('PPLNCODIGO').AsInteger := iPlanilha;
            ExecSQL;
         end;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iIdAcrescimo;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
// Função que calcula a TaxaDep baseado no Saldo Contábil
//----------------------------------------------------------------------------------------
// Parâmetros :
//
// fDepLanc     : Depreciacao Acumulada                             (DEPLANC + CMDEP)
// fValOrg      : Valor do Bem em Moeda Oficial                     (VALORG + CMBEM)
// fTaxaDep     : Taxa de Depreciação do Acrescimo de Valor         (TAXADEP)
//----------------------------------------------------------------------------------------
Function TAtivoFixo.CalculaTaxaDep(fDepLanc,fValOrg,fTaxaDepOrg : double; dDataMov : tDateTime) : double;
var
   iNdias, iTotaldeMeses,
   iTotaldeMesesDeprec                 : LongInt;
   fTaxaDiaria, fTaxaMensal            : Double;
   iDia,iMes,iAno                      : Word ;
begin
   if fTaxaDepOrg > 0 then
   begin
      try
         DecodeDate(dDataMov, iAno, iMes, iDia);
         iTotaldeMeses       := trunc((100 / fTaxaDepOrg) * 12);
         iTotaldeMesesDeprec := trunc((fDepLanc / fValOrg) * iTotaldeMeses);
         //-------------------------------------------------------------------------------
         iNDias := ((iTotaldeMeses * 30) - (iTotaldeMesesDeprec * 30)) - (iDia - 1);
         fTaxaDiaria := (100 / iNdias) + 0.000001;
         fTaxaDiaria := strtofloat(FormatFloat('###########0.000000',((fTaxaDiaria * 1000000) / 1000000)));
         fTaxaMensal := (fTaxaDiaria * 30) + 0.000001;
         result      := (fTaxaMensal * 12);
      except
         MsgDlg('Não foi possível calcular a Taxa de Depreciação do Acréscimo de Valor! '+
                'Valor BEM '+floattostr(fValOrg)+' Deprec BEM '+floattostr(fDepLanc),
                'Erro', mtError, [mbOk], 0);
         result := fTaxaDepOrg;
      end;
   end else
   begin
      Result := 0;
   end;
end;
//========================================================================================
// Função que registra o Acréscimo de Valor
//----------------------------------------------------------------------------------------
// Parâmetros :
//
// iBem         : id do Bem movimentado                             (IDBEM)
// iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iMov         : id da Movimentacao que gerou o Acrescimo          (IDMOVIMENTACAO)
// fTaxaDep     : Taxa de Depreciação do Acrescimo de Valor         (TAXADEP)
// dData        : Data do Fato que gerou o acréscimo de valor       (DATAACRESCIMO)
// fValOrg      : Valor do Acréscimo em Moeda Corrente              (VALORG/VALOFI)
// fValFis      : Valor do Acréscimo em Reavaliacao em Moeda Fiscal (VALFIS)
// fValGer      : Valor do Acréscimo em Moeda Gerencial             (VALGER)
//
// bMostraMsg   : True  - mostra mensagens
//                False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraAcrescimo(iBem, iEmpresaProp, iSeqHist : Integer;
                                      fTaxaDep : double; dDataAcres : tDateTime;
                                      fValAcres, fValFis, fValGer : Double;
                                      fCmBem, fCmDep, fDepLanc, fDepFis, fDepGer : Extended;
                                      iflgDeprec : Integer; dDataUltDep : tDateTime;
                                      bMostraMsg : boolean) : Integer;
var
   iSeq         : Integer;
   qryAcrescimo : TwwQuery;

begin
   qryAcrescimo := TwwQuery(dtmAtivoFixo.qryRegistraAcrescimo);
   //-------------------------------------------------------------------------------------
   try
      with qryAcrescimo do
      begin
         iSeq := LeUltRegistro(nil,'ACRESCIMOVALOR');
         ParamByName('PIDACRESCIMO').AsInteger      := iSeq;
         ParamByName('PIDMOVIMENTACAO').AsFloat     := iSeqHist;
         ParamByName('PIDBEM').AsInteger            := iBem;
         ParamByName('PIDPESSOA').AsInteger         := iEmpresaProp;
         ParamByName('PDATAACRESCIMO').AsDateTime   := dDataAcres;
         ParamByName('PTAXADEP').AsFloat            := fTaxaDep;
         ParamByName('PVALORG').AsCurrency          := fValAcres;
         ParamByName('PVALFIS').AsCurrency          := fValFis;
         ParamByName('PVALGER').AsCurrency          := fValGer;
         ParamByName('PCMBEM').AsCurrency           := fCmBem;
         ParamByName('PCMDEP').AsCurrency           := fCmDep;
         ParamByName('PDEPLANC').AsCurrency         := fDepLanc;
         ParamByName('PDEPFIS').AsCurrency          := fDepFis;
         ParamByName('PDEPGER').AsCurrency          := fDepGer;
         //-------------------------------------------------------------------------------
         if iflgDeprec <> -1 then
            ParamByName('PFLGDEPREC').AsInteger     := iFlgDeprec
         else
            ParamByName('PFLGDEPREC').AsInteger     := 0;
         //-------------------------------------------------------------------------------
         if dDataUltDep <> -1 then
            ParamByName('PDATAULTDEP').AsDateTime := dDataUltDep
         else
            ParamByName('PDATAULTDEP').AsDateTime := dDataAcres;
         //-------------------------------------------------------------------------------
         ExecSQL;
      end;
      Result := iSeq;
   //-------------------------------------------------------------------------------------
   except
      Result := -1;
      if bMostraMsg then
         Raise;
   end;
end;
//========================================================================================
// Função que registra o Historico do Acréscimo de Valor
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iSeqHist     : ID da Movimentacao                  (IDMOVIMENTACAO)
//    iTipoDespesa : ID do Tipo de Despesa               (IDTIPODESPESA)
//    sObs         : Observação relativa ao acréscimo    (OBS)
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraAcresc(iSeqHist, iTipoDespesa : integer;
                                   sObs : string; bMostraMsg : Boolean) : Boolean;
var
   qryAcresc  : TwwQuery;

begin
   qryAcresc := TwwQuery(dtmAtivoFixo.qryRegistraAcresc);
   //-------------------------------------------------------------------------------------
   try
      with qryAcresc do
      begin
         ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         ParamByName('PIDTIPODESPESA').AsInteger  := iTipoDespesa;
         if iTipoDespesa <= 0 then ParamByName('PIDTIPODESPESA').Clear;
         ParamByName('POBS').AsString             := sObs;
         ExecSQL;
      end;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
      if bMostraMsg then
         Raise;
   end;
end;
//========================================================================================
// Função que Contabiliza o Acréscimo
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)
//    iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Bem movimentado
//    iConjunto    : id do Conjunto do Bem movimentado
//    iBem         : id do Bem movimentado
//    dDataLanc    : Data do laudo de Reavaliacao
//    fValLanc     : Valor a ser Contabilizado
//    sDesBem      : Descrição do Bem
//    sAtivProjeto : Atividade de Projeto
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaAcrescimo(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                         dDataLanc : TDate;
                                         fValLanc : Double;
                                         sDesBem,sAtivProjeto : String;
                                         iSubConta : Integer; sPlaca : String;
                                         bMostraMsg : Boolean) : Integer;
const
   iTipoMovimentacao = 9;           // Codigo de Reavaliacao de Bem

var
   sGrupo   ,                       // Descricao de Grupo do Bem
   sDebito  ,sCredito,              // Contas Contábeis
   sCCDebito,sCCCredito : String;   // Centros de Custos
   iExercicio,iPeriodo  : Integer;  // Periodo Contábil
   sHistor  ,sHistor1,              // Historico
   sHistor2 ,sHistor3,              //     ''
   sHistor4 ,                       //     ''
   sCc, sMensagem       : String;   // Conta e Plano do Centro de Custo
   iPlanoConta          : Integer;  // Plano de Contas
   fParticip1,                      // Rateio
   fParticip2           : Double;   //   ''
   qryCcRD              : TwwQuery ;

begin
   qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
   //-------------------------------------------------------------------------------------
   // Busca o Periodo Contábil
   //-------------------------------------------------------------------------------------
   if not VerificaPeriodoContabil(iPessoa,dDataLanc,iExercicio,iPeriodo,
                                  sMensagem,bMostraMsg) then
   begin
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := iPessoa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Acréscimo
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMovimentacao,'D',iPlanoConta,sDebito,sCCDebito);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para Acréscimo
   //------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMovimentacao,'C',iPlanoConta,sCredito,sCCCredito);
   //-------------------------------------------------------------------------------------
   if (sDebito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Débito para o Movimento de Acréscimo de Valor no Grupo ' + sGrupo +
                ' não cadastrada !','Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCredito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a crédito para o Movimento de Acréscimo de Valor no Grupo ' + sGrupo +
                ' não cadastrada !','Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Processamento do Rateio dos Custos
   //-------------------------------------------------------------------------------------
   sHistor := 'Acréscimo de Valor ';
   sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
   sHistor2   := '';
   sHistor3   := '';
   sHistor4   := '';
   fParticip1 := 0;
   fParticip2 := 0;
   //-------------------------------------------------------------------------------------
   // Busca Rateio da Depreciação do Bem
   //-------------------------------------------------------------------------------------
   qryCcRD.Close;
   qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
   qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
   qryCcRD.Open;
   //-------------------------------------------------------------------------------------
   qryCcRD.First;
   while not qryCcRD.EOF do
   begin
      if (fParticip1 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sDebito) then
         begin
            fParticip1 := 100;
            sCc        := '';
         end else
         begin
            fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fValLanc * fParticip1) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,sDebito,'',inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
         //-------------------------------------------------------------------------------
      end;
      //----------------------------------------------------------------------------------
      if (fParticip2 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sCredito) then
         begin
            fParticip2 := 100;
            sCc        := '';
         end else
         begin
            fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fValLanc * fParticip2) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,'',sCredito,inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
         //-------------------------------------------------------------------------------
      end;
      qryCcRD.Next;
   end;
   qryCcRD.Close;
   //-------------------------------------------------------------------------------------
   Result := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                      dDataLanc, sMensagem, bMostraMsg);
end;
//========================================================================================
// Função que Executa a Reavaliação de um Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iBem         : id do Bem movimentado                             (IDBEM)
// dDataLaudo   : Data do laudo de reavaliacao                      (DATAMOVIMENTACAO)
// fValLaudo    : Valor do laudo de reavaliacao em Moeda Corrente   (VALORG/VALOFI)
// iVidautil    : Novo tempo de vida útil em Meses
// sObs         : Informações relativas ao laudo
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function TAtivoFixo.ExecutaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                                       dDataLaudo : tDate;
                                       fValLaudo : Double; iVidaUtil : Integer;
                                       sObs : String;
                                       Var fDifReaval,fDifReavalImob : Double;
                                       bMostraMsg : boolean) : Integer;

const
   iTipoMovimentacao = 8;           // Codigo de Reavaliacao de Bem

var
   iPlanoConta,
   iSeqHist, iIdReavaliacao, iPlanilha                       : Integer;
   sDebito  , sDebitoCM  , sCredito  , sCreditoCM,
   sCCDebito, sCCDebitoCM, sCCCredito, sCCCreditoCM,
   sAtivProjeto                                              : String;
   fDepCmBem, fDepDepLanc, fDepCmDep,
   fSldCtbImob, fValFis, fValGer                             : Extended;
   fNovaTaxaDep, fTaxaDepCalc                                : Double;
   qryBem,qryReavaliacao,qryAcrescimo,qryUltMov,qryUltReav   : TwwQuery;
   bTransacao                                                : Boolean;
   aIdHistMov                                                : array [1..1] of Integer;

begin
   //-------------------------------------------------------------------------------------
   // Valida os Parâmetros obrigatórios para reavaliação de bens
   //-------------------------------------------------------------------------------------
   if (iVidaUtil < 0) then
   begin
      if bMostraMsg then
         MsgDlg('Tempo de Vida Útil Zerado igual a Taxa de Depreciação Zerada!','Informação',mtInformation,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   if (fValLaudo <= 0) then
   begin
      if bMostraMsg then
         MsgDlg('Informe o novo valor do bem!','Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sObs = '') then
   begin
      if bMostraMsg then
         MsgDlg('Declare as informações relativas ao laudo de reavaliação!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared                  then qryBem.Prepare;
      if not qryReavaliacao.Prepared          then qryReavaliacao.Prepare;
      if not qryAcrescimo.Prepared            then qryAcrescimo.Prepare;
      if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
      if not qryRegistraReavaliacao.Prepared  then qryRegistraReavaliacao.Prepare;
      if not qryUltMov.Prepared               then qryUltMov.Prepare;
      if not qryUltReav.Prepared              then qryUltReav.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
   qryUltReav     := TwwQuery(dtmAtivoFixo.qryUltReav);
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após a Reavaliação
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataLaudo) then
   begin
      if bMostraMsg then
         MsgDlg('Existe movimentação após a Reavaliação. Consulte Movimentação!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Posiciona a Tabela BEM no bem que será reavaliado
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   if qryBem.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if iModulo <= 0 then
   begin
      if bMostraMsg then
      begin
         MsgDlg('É obrigatório fornecer o código do MODULO!',
                'Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end else
   begin
      if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
      begin
         if bMostraMsg then
         begin
            MsgDlg('Somente o módulo que cadastrou o bem pode manipula-lo',
                   'Erro',mtError,[mbOk],0);
         end;
         result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se ja houve reavaliacao na data
   //-------------------------------------------------------------------------------------
   qryUltReav.Close;
   qryUltReav.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltReav.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltReav.ParamByName('PDATAMOV').AsDateTime := dDataLaudo;
   qryUltReav.Open;
   if not qryUltReav.IsEmpty then
   begin
      MsgDlg('O bem ' + qryBem.FieldByName('PLACA').AsString + ' já foi reavaliado na data. Consulte!',
             'Erro',mtError,[mbOk],0);
      Raise eExcessaoCAF.Create('Bem já Reavaliado');
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // Calcula a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      fDepCmBem   := 0;
      fDepDepLanc := 0;
      fDepCmDep   := 0;
      if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataLaudo - 1),bMostraMsg,
                                fDepCmBem, fDepDepLanc, fDepCmDep) then
         Raise eExcessaoCAF.Create('Reavaliação : ExecutaDepreciacao');
      //----------------------------------------------------------------------------------
      // Reposiciona a Tabela BEM após a depreciação prorata
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
      //----------------------------------------------------------------------------------
      if qryBem.FieldByName('UNIDNEGOC').IsNull then
      begin
         with dtmAtivoFixo.qryParamCaf do
         begin
            if not Active then
            begin
               ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
               Open;
            end;
            if not IsEmpty then
               sAtivProjeto := FieldByName('ATIVPROJETO').AsString
            else
               sAtivProjeto := '';
         end;
      end else
      begin
         sAtivProjeto := qryBem.FieldByName('UNIDNEGOC').AsString;
      end;
      //----------------------------------------------------------------------------------
      // Calcula a Nova Taxa de Depreciacao
      //----------------------------------------------------------------------------------
      fNovaTaxaDep := 0;
      if (iVidaUtil > 0) then
      begin
         fNovaTaxaDep := (100 / (iVidaUtil / 12));    // iVidaUtil está em número de meses
      end;
      //----------------------------------------------------------------------------------
      // Calcula o Saldo para Reavaliacao
      //----------------------------------------------------------------------------------
      fDifReaval := fValLaudo - CalculaSaldoContabil(iEmpresaProp, iBem, dDataLaudo,fSldCtbImob);
      //----------------------------------------------------------------------------------
      // Calcula o Saldo para Reavaliacao do Sistema de Adm Imobiliaria
      //----------------------------------------------------------------------------------
      fDifReavalImob := fValLaudo - fSldCtbImob;
      //----------------------------------------------------------------------------------
      // Le os Parametros do CAF
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo.qryParamCAF do
      begin
         Close;
         ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         // Calcula os valores fornecidos em moeda fiscal e gerencial
         //-------------------------------------------------------------------------------
         fValFis := fDifReaval / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                               dDataLaudo, bMostraMsg);
         fValGer := fDifReaval / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                               dDataLaudo, bMostraMsg);
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
      //----------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                       dDataLaudo,-1,fDifReaval,fValFis,fValGer,
                                       -1,-1,-1,-1,-1,-1,-1,-1,
                                       qryBem.FieldByName('TAXADEP').AsFloat,fValLaudo,
                                       sObs,bMostraMsg);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Reavaliação : RegistraMovimentacao');
      aIdHistMov[1] := iSeqHist;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(Sistema.IdModulo, iEmpresaProp, iBem,
                                    dDataLaudo,
                                    0,0,0,0,
                                    0,0,0,0,
                                    fDifReaval,0,0,0,
                                    1) then
         Raise eExcessaoCAF.Create('Reavaliação : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      if (fNovaTaxaDep <> 0) then
      begin
         fTaxaDepCalc := (((qryBem.FieldByName('VALORG').asFloat  +
                            qryBem.FieldByName('CMBEM').asFloat)  -
                           (qryBem.FieldByName('DEPLANC').asFloat +
                            qryBem.FieldByName('CMDEP').asFloat)) /
                           (iVidaUtil / 12) /
                           (qryBem.FieldByName('VALORG').asFloat +
                            qryBem.FieldByName('CMBEM').asFloat)) * 100;
      end else
      begin
         fTaxaDepCalc := 0;
      end;
      qryBem.Edit;
      qryBem.FieldByName('TAXADEP').AsFloat := fTaxaDepCalc;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Recalcula a Taxa de Depreciacao nos Lançamentos da Tabela REAVALIACAO
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 53,
                                          dDataLaudo,
                                          qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                          0, 0, 0,
                                          -1, -1, -1, -1, -1, -1, -1, -1,
                                          qryReavaliacao.FieldByName('TAXADEP').AsFloat,
                                          -1, '', bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Reavaliação : RegistraMovimentacao');
         //-------------------------------------------------------------------------------
         // Calcula a Nova Taxa de Depreciacao
         //-------------------------------------------------------------------------------
         if (fNovaTaxaDep <> 0) then
         begin
            fTaxaDepCalc := (((qryReavaliacao.FieldByName('VALORG').asFloat +
                               qryReavaliacao.FieldByName('CMBEM').asFloat) -
                              (qryReavaliacao.FieldByName('DEPLANC').asFloat +
                               qryReavaliacao.FieldByName('CMDEP').asFloat)) /
                             (iVidaUtil / 12) /
                             (qryReavaliacao.FieldByName('VALORG').asFloat +
                              qryReavaliacao.FieldByName('CMBEM').asFloat)) * 100;
         end else
         begin
            fTaxaDepCalc := 0;
         end;
         //-------------------------------------------------------------------------------
         qryReavaliacao.Edit;
         qryReavaliacao.FieldByName('TAXADEP').AsFloat        := fTaxaDepCalc;
         qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger := 0;
         qryReavaliacao.Post;
         qryReavaliacao.Next;
      end;
      qryReavaliacao.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Registra a Nova Taxa de Depreciacao nos Lançamentos da Tabela ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 54,
                                          dDataLaudo,
                                          qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                          0, 0, 0,
                                          -1, -1, -1, -1, -1, -1, -1, -1,
                                          qryAcrescimo.FieldByName('TAXADEP').AsFloat,
                                          -1, '', bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Reavaliação : RegistraMovimentacao');
         //-------------------------------------------------------------------------------
         // Calcula a Nova Taxa de Depreciacao
         //-------------------------------------------------------------------------------
         if (fNovaTaxaDep <> 0) then
         begin
            fTaxaDepCalc := (((qryAcrescimo.FieldByName('VALORG').asFloat +
                               qryAcrescimo.FieldByName('CMBEM').asFloat) -
                              (qryAcrescimo.FieldByName('DEPLANC').asFloat +
                               qryAcrescimo.FieldByName('CMDEP').asFloat)) /
                             (iVidaUtil / 12) /
                              (qryAcrescimo.FieldByName('VALORG').asFloat +
                               qryAcrescimo.FieldByName('CMBEM').asFloat)) * 100;
         end else
         begin
            fTaxaDepCalc := 0;
         end;
         //-------------------------------------------------------------------------------
         qryAcrescimo.Edit;
         qryAcrescimo.FieldByName('TAXADEP').AsFloat := fTaxaDepCalc;
         qryAcrescimo.Post;
         qryAcrescimo.Next;
      end;
      qryAcrescimo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Registra a Reavaliacao
      //----------------------------------------------------------------------------------
      iIdReavaliacao := RegistraReavaliacao(iBem,iEmpresaProp,aIdHistMov[1],
                        fDifReaval,fValFis,fValGer,0,0,0,0,0,fNovaTaxaDep,
                        dDataLaudo,1,-1,-1,bMostraMsg);
      if iIdReavaliacao <= 0 then
         Raise eExcessaoCAF.Create('Reavaliação : RegistraReavaliacao');
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         with dtmAtivoFixo do
         begin
            if not qryMontaCtb.Prepared then
               qryMontaCtb.Prepare;

            if not qryGrupoCtb.Prepared then
               qryGrupoCtb.Prepare;

            if not qryConta.Prepared then
               qryConta.Prepare;

            if not qryCCrd.Prepared then
               qryCCrd.Prepare;

            if not qryPlanoConta.Prepared then
               qryPlanoConta.Prepare;

            if not qryHistCtb.Prepared then
               qryHistCtb.Prepare;

            if not qryHistCtb.Active then
               qryMontaCtb.Open;
         end;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaReavaliacao(iModulo,
                                            qryBem.FieldByName('IDPESSOA').AsInteger,
                                            qryBem.FieldByName('IDGRUPO').AsInteger,
                                            qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                            qryBem.FieldByName('IDBEM').AsInteger,
                                            dDataLaudo,fDifReaval,
                                            qryBem.FieldByName('DESBEM').AsString,
                                            sAtivProjeto,
                                            qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                            qryBem.FieldByName('PLACA').AsString,
                                            bMostraMsg);
         dtmAtivoFixo.qryMontaCtb.Close;
         if iPlanilha <= 0 then
            Raise eExcessaoCAF.Create('Reavaliacao : ContabilizaReavaliacao');
         //-------------------------------------------------------------------------------
         // Registra no Historico a Planilha Gerada
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo.qryHistCtb do
         begin
            ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[1];
            ParamByName('PPLNCODIGO').AsInteger := iPlanilha;
            ExecSQL;
         end;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iIdReavaliacao;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
// Função que registra a Reavaliação
//----------------------------------------------------------------------------------------
// Parâmetros :
//
// iBem         : id do Bem movimentado                             (IDBEM)
// iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iMov         : id da Movimentacao que gerou a Reavaliacao        (IDMOVIMENTACAO)
// fValOrg      : Valor do Saldo de Reavaliacao em Moeda Corrente   (VALORG/VALOFI)
// fValFis      : Valor do Saldo de Reavaliacao em Moeda Fiscal     (VALFIS)
// fValGer      : Valor do Saldo de Reavaliacao em Moeda Gerencial  (VALGER)
// fTaxaDep     : Taxa de Depreciação da Reavaliacao                (TAXADEP)
// dData        : Data do Laudo de Reavaliacao                      (DATAMOVIMENTACAO)
//
// bMostraMsg   : True  - mostra mensagens
//                False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraReavaliacao(iBem,iPessoa,iMov : Integer;
                                        fValOrg,fValFis,fValGer,fCmBem,
                                        fDepLanc,fDepFis,fDepGer,fCmDep,fTaxaDep : Double;
                                        dData : tDateTime; iFlgUltReaval : Integer;
                                        dDataUltDep : tDateTime; iFlgDeprec : Integer;
                                        bMostraMsg : Boolean) : Integer;
var
   iSeq           : Integer;
   qryReavaliacao : TwwQuery;

begin
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryRegistraReavaliacao);
   //-------------------------------------------------------------------------------------
   try
      with qryReavaliacao do
      begin
         iSeq := LeUltRegistro(nil,'REAVALIACAO');
         ParamByName('PIDREAVALIACAO').AsInteger    := iSeq;
         ParamByName('PIDMOVIMENTACAO').AsFloat     := iMov;
         ParamByName('PIDBEM').AsInteger            := iBem;
         ParamByName('PIDPESSOA').AsInteger         := iPessoa;
         ParamByName('PDATAREAVALIACAO').AsDateTime := dData;
         ParamByName('PVALORG').AsCurrency          := fValOrg;
         ParamByName('PVALFIS').AsCurrency          := fValFis;
         ParamByName('PVALGER').AsCurrency          := fValGer;
         ParamByName('PCMBEM').AsCurrency           := fCmBem;
         ParamByName('PCMDEP').AsCurrency           := fCmDep;
         ParamByName('PTAXADEP').AsFloat            := fTaxaDep;
         ParamByName('PDEPLANC').AsCurrency         := fDepLanc;
         ParamByName('PDEPFIS').AsCurrency          := fDepFis;
         ParamByName('PDEPGER').AsCurrency          := fDepGer;
         ParamByName('PFLGULTREAVAL').AsInteger     := iflgUltReaval;
         //-------------------------------------------------------------------------------
         if dDataUltDep <> -1 then
            ParamByName('PDATAULTDEP').AsDateTime := dDataUltDep
         else
            ParamByName('PDATAULTDEP').AsDateTime := dData;
         //-------------------------------------------------------------------------------
         if iFlgDeprec <> -1 then
            ParamByName('PFLGDEPREC').AsInteger := iFlgDeprec
         else
            ParamByName('PFLGDEPREC').AsInteger := 0;
         //-------------------------------------------------------------------------------
         ExecSQL;
      end;
      Result := iSeq;
   //-------------------------------------------------------------------------------------
   except
      Result := -1;
      if bMostraMsg then
         Raise;
   end;
end;
//========================================================================================
// Função que registra o Historico da Reavaliação do Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iSeqHist   : id da Movimentacao                 (IDMOVIMENTACAO)
//    fTaxaDep   : Taxa de Depreciacao Anterior       (TAXADEPORG)
//    fValLaudo  : Valor do Laudo de Avaliação
//    fValOrgAnt : Valor Original do Bem
//    sObs       : Observacao relativa a Reavaliacao  (OBS)
//    bMostraMsg : True  - mostra mensagens
//                 False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraReaval(iSeqHist:integer; fTaxaDep,fValLaudo,fValOrgAnt:Double;
                                   sObs : string; bMostraMsg : Boolean) : Boolean;
var
   qryReaval  : TwwQuery;

begin
   qryReaval := TwwQuery(dtmAtivoFixo.qryRegistraReaval);
   //-------------------------------------------------------------------------------------
   try
      with qryReaval do
      begin
         ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         ParamByName('PTAXADEPORG').AsFloat       := fTaxaDep;
         ParamByName('PVALORGLAUDO').AsFloat      := fValLaudo;
         ParamByName('PVALORGANT').AsFloat        := fValOrgAnt;
         ParamByName('POBS').AsString             := sObs;
         ExecSQL;
      end;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
      if bMostraMsg then
         Raise;
   end;
end;
{/========================================================================================
// Função que registra o Historico da Reavaliação da Reavaliação
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iSeqHist   : id da Movimentacao                 (IDMOVIMENTACAO)
//    fTaxaDep   : Taxa de Depreciacao Anterior       (TAXADEPORG)
//    bMostraMsg : True  - mostra mensagens
//                 False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraReavalReaval(iSeqHist : integer; fTaxaDep : Double;
                                         iIdReaval : integer; bMostraMsg : Boolean) : Boolean;
var
   qryReavalReaval : TwwQuery;

begin
   qryReavalReaval := TwwQuery(dtmAtivoFixo.qryRegistraReavalReaval);
   //-------------------------------------------------------------------------------------
   try
      with qryReavalReaval do
      begin
         ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         ParamByName('PIDREAVALIACAO').AsInteger  := iIdReaval;
         ParamByName('PTAXADEPORG').AsFloat       := fTaxaDep;
         ExecSQL;
      end;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
      if bMostraMsg then
         Raise;
   end;
end;}
{/========================================================================================
// Função que registra o Historico da Reavaliação da Acréscimo
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iSeqHist   : id da Movimentacao                 (IDMOVIMENTACAO)
//    fTaxaDep   : Taxa de Depreciacao Anterior       (TAXADEPORG)
//    bMostraMsg : True  - mostra mensagens
//                 False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraReavalAcresc(iSeqHist:integer; fTaxaDep : Double;
                                         iIdAcresc : Integer; bMostraMsg : Boolean) : Boolean;
var
   qryReavalAcresc : TwwQuery;

begin
   qryReavalAcresc := TwwQuery(dtmAtivoFixo.qryRegistraReavalAcresc);
   //-------------------------------------------------------------------------------------
   try
      with qryReavalAcresc do
      begin
         ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         ParamByName('PIDACRESCIMO').AsInteger    := iIdAcresc;
         ParamByName('PTAXADEPORG').AsFloat       := fTaxaDep;
         ExecSQL;
      end;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
      if bMostraMsg then
         Raise;
   end;
end;}
//========================================================================================
// Função que Contabiliza a Reavaliação
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)
//    iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Bem movimentado
//    iConjunto    : id do Conjunto do Bem movimentado
//    iBem         : id do Bem movimentado
//    dDataLanc    : Data do laudo de Reavaliacao
//    fValLanc     : Valor a ser Contabilizado
//    sDesBem      : Descrição do Bem
//    sAtivProjeto : Unidade de Negócio
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaReavaliacao(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                           dDataLanc : TDate; fValLanc : Double;
                                           sDesBem,sAtivProjeto : String;
                                           iSubConta : Integer; sPlaca : String;
                                           bMostraMsg : Boolean) : Integer;

var
   sGrupo   ,                       // Descricao de Grupo do Bem
   sDebito  ,sCredito,              // Contas Contábeis a Débito e a Crédito
   sCCDebito,sCCCredito,            // Centro de Custo a Débito e a Crédito
   sHistor  ,sHistor1,              // Historico
   sHistor2 ,sHistor3,              //     ''
   sHistor4 ,                       //     ''
   sCc      ,                       // Conta e Plano do Centro de Custo
   sMensagem            : String;   // Mensagem da Contabilidade
   iPlanoConta,                     // Plano de Contas
   iExercicio,iPeriodo  : Integer;  // Periodo Contábil
   fParticip1,                      // Rateio
   fParticip2           : Double;   //   ''
   qryCcRD              : TwwQuery;
   iTipoMovimentacao    : Integer;  // Codigo de Reavaliacao de Bem

begin
   if (fValLanc > 0) then
   begin
      iTipoMovimentacao := 8;
   end else
   begin
      iTipoMovimentacao := 23;
   end;
   //-------------------------------------------------------------------------------------
   qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
   //-------------------------------------------------------------------------------------
   // Busca o Periodo Contábil
   //-------------------------------------------------------------------------------------
   if not VerificaPeriodoContabil(iPessoa,dDataLanc,iExercicio,iPeriodo,
                                  sMensagem,bMostraMsg) then
   begin
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := iPessoa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Reavaliação
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMovimentacao,'D',iPlanoConta,sDebito,sCCDebito);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para a Reavaliação
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMovimentacao,'C',iPlanoConta,sCredito,sCCCredito);
   //-------------------------------------------------------------------------------------
   if (sDebito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Débito para o Movimento de Reavaliação no Grupo ' + sGrupo +
                ' não cadastrada !','Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCredito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a crédito para o Movimento de Reavaliação no Grupo ' + sGrupo +
                ' não cadastrada !','Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Processamento do Rateio dos Custos
   //-------------------------------------------------------------------------------------
   sHistor    := 'Reavaliação de Bem ';
   sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
   sHistor2   := '';
   sHistor3   := '';
   sHistor4   := '';
   fParticip1 := 0;
   fParticip2 := 0;
   //-------------------------------------------------------------------------------------
   // Busca Rateio da Depreciação do Bem
   //-------------------------------------------------------------------------------------
   qryCcRD.Close;
   qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
   qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
   qryCcRD.Open;
   //-------------------------------------------------------------------------------------
   qryCcRD.First;
   while not qryCcRD.EOF do
   begin
      if (fParticip1 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sDebito) then
         begin
            fParticip1 := 100;
            sCc        := '';
         end else
         begin
            fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fValLanc * fParticip1) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,sDebito,'',inttostr(iBem),abs(fValLanc),
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
         //-------------------------------------------------------------------------------
      end;
      //----------------------------------------------------------------------------------
      if (fParticip2 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sCredito) then
         begin
            fParticip2 := 100;
            sCc        := '';
         end else
         begin
            fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fValLanc * fParticip2) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,'',sCredito,inttostr(iBem),abs(fValLanc),
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
         //-------------------------------------------------------------------------------
      end;
      qryCcRD.Next;
   end;
   qryCcRD.Close;
   //-------------------------------------------------------------------------------------
   Result := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                      dDataLanc, sMensagem,bMostraMsg);
end;
//========================================================================================
// Função que Estorna a Reavaliação de um Bem
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function TAtivoFixo.EstornaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                                       dDataMov,dDataEst : tDate;
                                       bMostraMsg : boolean) : Integer;

const
   iTipoMovimentacao = 8;           // Codigo de Reavaliacao de Bem

var
   iIdMovimentacao, iPlnCodigo, iResult,
   iExercicio,iPeriodo,iMaxIdReaval           : Integer;
   sMascara,sMensagem                         : String;
   fTaxaDepAnt                                : Double;
   qryAux,qryBem,qryReavaliacao,qryAcrescimo,
   qryUltMov                                  : TwwQuery;
   bTransacao                                 : Boolean;

begin
   with dtmAtivoFixo do
   begin
      if not qryUltMov.Prepared then
         qryUltMov.Prepare;

      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryReavaliacao.Prepared then
         qryReavaliacao.Prepare;

      if not qryAcrescimo.Prepared then
         qryAcrescimo.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após a reavaliação
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
   begin
      if bMostraMsg then
         MsgDlg('Existe movimentação após a reavaliação. Consulte!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   iResult := 0;
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // Estorna a Depreciacao no Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      if EstornaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),dDataEst,bMostraMsg) < 0 then
         Raise eExcessaoCAF.Create('Reavaliação : EstornaDepreciacao');
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Retorna a Taxa de Depreciacao Anterior do Bem e o ID da Movimentacao
      //----------------------------------------------------------------------------------
      iPlnCodigo := 0;
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,PLNCODIGO,TAXADEPANT '+
                         ' FROM HISTORICOMOVIMENTACAO '+
                         ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (IDTIPOMOVIMENTACAO = 08) ';
      qryAux.Open;
      if qryAux.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                   'Erro',mtError,[mbOk],0);
         Raise eExcessaoCAF.Create('Reavaliação : EstornaReavaliacaoBem');
      end;
      fTaxaDepAnt     := qryAux.FieldByName('TAXADEPANT').AsFloat;
      iIdMovimentacao := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
      if not (qryAux.FieldByName('PLNCODIGO').IsNull) then
         iPlnCodigo := qryAux.FieldByName('PLNCODIGO').AsInteger;
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('TAXADEP').AsFloat := fTaxaDepAnt;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Retorna a taxa de depreciação anterior dos Saldos de Reavaliação
      //----------------------------------------------------------------------------------
      iMaxIdReaval := 0;
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         if (qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0) then
         begin
            if (qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger > iMaxIdReaval) then
            begin
               iMaxIdReaval := qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger;
            end;
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT TAXADEPANT '+
                               ' FROM HISTORICOMOVIMENTACAO '+
                               ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                               '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                               '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                               '   AND (IDTIPOMOVIMENTACAO = 53)' +
                               '   AND (IDREAVALACRESC = ' + inttostr(qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) + ')';
            qryAux.Open;
            if qryAux.IsEmpty then
            begin
               if bMostraMsg then
                  MsgDlg('Os parâmetros relativos a reavaliacao estão incorretos!',
                         'Erro',mtError,[mbOk],0);
               Raise eExcessaoCAF.Create('Reavaliação : EstornaReavalReaval');
            end;
            fTaxaDepAnt := qryAux.FieldByName('TAXADEPANT').AsFloat;
            //----------------------------------------------------------------------------
            qryReavaliacao.Edit;
            qryReavaliacao.FieldByName('TAXADEP').AsFloat := fTaxaDepAnt;
            qryReavaliacao.Post;
         end;
         qryReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Atualiza o Flag de Ultima Reavaliacao
      //----------------------------------------------------------------------------------
      qryReavaliacao.First;
      while not qryReavaliacao.EOF do
      begin
         if (qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger = iMaxIdReaval) then
         begin
            qryReavaliacao.Edit;
            qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger := 1;
            qryReavaliacao.Post;
         end;
         qryReavaliacao.Next;
      end;
      qryReavaliacao.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Retorna a Taxa de Depreciacao nos Lançamentos da Tabela ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT TAXADEPANT ' +
                            ' FROM HISTORICOMOVIMENTACAO ' +
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ') ' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '   AND (IDTIPOMOVIMENTACAO = 54) ' +
                            '   AND (IDREAVALACRESC = ' + inttostr(qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger) + ') ';
         qryAux.Open;
         if qryAux.IsEmpty then
         begin
            if bMostraMsg then
               MsgDlg('Os parâmetros relativos a reavaliacao estão incorretos!',
                      'Erro',mtError,[mbOk],0);
            Raise eExcessaoCAF.Create('Reavaliação : EstornaReavalAcresc');
         end;
         fTaxaDepAnt := qryAux.FieldByName('TAXADEPANT').AsFloat;
         //-------------------------------------------------------------------------------
         qryAcrescimo.Edit;
         qryAcrescimo.FieldByName('TAXADEP').AsFloat := fTaxaDepAnt;
         qryAcrescimo.Post;
         qryAcrescimo.Next;
      end;
      qryAcrescimo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // RETIRA O LINK DA PLANILHA CONTÁBIL
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                         ' SET PLNCODIGO = NULL '+
                         ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                         '                          FROM HISTORICOMOVIMENTACAO'+
                         '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                         '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '                            AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '                            AND (IDTIPOMOVIMENTACAO IN (08,53,54)) )';
      qryAux.ExecSQL;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            if not RemovePlanContab(iEmpresaProp) then
            begin
               iResult := EstornaLanc(True, iPlnCodigo, 'BASEDADOS', datetostr(dDataEst),
                                      iExercicio, iPeriodo, iEmpresaProp, sMascara);
               if iResult = -1 then
               begin
                  MsgDlg('Estorno Reavaliação : Estorno da Contabilidade não Executado !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end else
            begin
               //-------------------------------------------------------------------------
               with dtmAtivoFixo.qryParamCaf do
               begin
                  if not Active then
                  begin
                     Close;
                     ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                     Open;
                  end;
                  //----------------------------------------------------------------------
                  iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                        FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                        Sistema.IdUsuario, True, 0, sMascara);
               end;
               if iResult = -1 then
               begin
                  MsgDlg('Estorno Reavaliação : Remoção da Planilha da Contabilidade não Executada !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end;
         end else
         begin
            iResult := -1;
            MsgDlg('Estorno Reavaliação : Estorno da Planilha Contábil ' + inttostr(iPlnCodigo) +
                   ' não Executado !', 'Erro', mtError, [mbOk], 0);
         end;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryEstornaReavaliacao.Prepared  then qryEstornaReavaliacao.Prepare;
         if not qryEstornaMov.Prepared          then qryEstornaMov.Prepare;
         //-------------------------------------------------------------------------------
         // Remove a Reavaliacao
         //-------------------------------------------------------------------------------
         qryEstornaReavaliacao.ParamByName('PIDPESSOA').AsInteger       := iEmpresaProp;
         qryEstornaReavaliacao.ParamByName('PIDBEM').AsInteger          := iBem;
         qryEstornaReavaliacao.ParamByName('PIDMOVIMENTACAO').AsInteger := iIdMovimentacao;
         qryEstornaReavaliacao.ExecSQL;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO'+
                            ' FROM HISTORICOMOVIMENTACAO'+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (08,53,54))';
         qryAux.Open;
         while not qryAux.Eof do
         begin
            //----------------------------------------------------------------------------
            // Remove o Registro da Movimentacao
            //----------------------------------------------------------------------------
            qryEstornaMov.ParamByName('PIDBEM').AsInteger    := iBem;
            qryEstornaMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryEstornaMov.ParamByName('PIDMOVIM').AsInteger  := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaMov.ExecSQL;
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryAux.Close;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,
                                    dDataMov,0,0,0,0,0,0,0,0,0,0,0,0,2) then
         Raise eExcessaoCAF.Create('EstornaReavaliação : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      Result := iResult;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
// Função que executa a Baixa de um Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
//    iModulo        : id do módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
//    iEmpresaProp   : id da empresa proprietária (Sistema.idEmpresa)    (IDPESSOA)
//    iBem           : id do bem movimentado                             (IDBEM)
//    iTipoBaixa     : id do tipo de baixa                               (MOTIVOBAIXA.IDMOTIVOBAIXA)
//    dDataBaixa     : Data da baixa                                     (DATAMOVIMENTACAO)
//    fPropBaixa     : Proporção da baixa                                (0-100)
//    fValVenda      : Valor da Alienação (se Zero, não é Alienação)
//    sObsBaixa      : Informações relativas a baixa
//    fValResult     : Retorna o Resultado da Venda baseado no valor contábil
//    fValResultImob : Retorna o Resultado da Venda baseado no valor do bem
//
//    bMostraMsg     : True  - mostra mensagens da Função
//                     False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function TAtivoFixo.ExecutaBaixa(iModulo, iEmpresaProp, iBem,
                                 iMotivoBaixa : Integer;
                                 dDataBaixa   : tDate;
                                 fPropBaixa, fValVenda : Extended;
                                 sObsBaixa    : String;
                                 bMostraMsg   : boolean;
                                 Var fValResult,fValResultImob : Currency;
                                 Var iPlanilha : Integer) : Boolean;

var
   iPlanoConta,
   iSeqHist, iaIdHistMov , iAux,
   iExercicio, iPeriodo                                 : Integer;
   sDebito  , sDebitoCM  , sCredito  , sCreditoCM,
   sCCDebito, sCCDebitoCM, sCCCredito, sCCCreditoCM,
   sAtivProjeto, sMensagem                              : String;
   qryBem, qrySldContabil, qryReavaliacao, qryAcrescimo,
   qryUltMov                                            : TwwQuery;
   bTransacao, bPlanilha                                : Boolean;
   fPropBaixar, fPropResult, fSldContabil,
   fBaixaB , fBaixaBF, fBaixaBG, fSldCtbImob,
   fBaixaD , fBaixaDF, fBaixaDG,
   fBaixaCM, fBaixaCMD,
   fDepCmBem, fDepDepLanc, fDepCmDep                    : Extended;
   aIdHistMov                                           : array [1..244] of Integer;

begin
   with dtmAtivoFixo do
   begin
      if not qryUltMov.Prepared then
         qryUltMov.Prepare;
      if not qryBem.Prepared then
         qryBem.Prepare;
      if not qryReavaliacao.Prepared then
         qryReavaliacao.Prepare;
      if not qryAcrescimo.Prepared then
         qryAcrescimo.Prepare;
      if not qrySldContabil.Prepared then
         qrySldContabil.Prepare;
      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;
      if not qryRegistraBaixaBem.Prepared then
         qryRegistraBaixaBem.Prepare;
      if not qryMontaCtb.Prepared then
         qryMontaCtb.Prepare;
      if not qryGrupoCtb.Prepared then
         qryGrupoCtb.Prepare;
      if not qryConta.Prepared then
         qryConta.Prepare;
      if not qryCCrd.Prepared then
         qryCCrd.Prepare;
      if not qryPlanoConta.Prepared then
         qryPlanoConta.Prepare;
      if not qryMontaCtb.Active then
         qryMontaCtb.Open ;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qrySldContabil := TwwQuery(dtmAtivoFixo.qrySldContabil);
   qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
   //-------------------------------------------------------------------------------------
   // Valida os Parâmetros obrigatórios para baixa de bens
   //-------------------------------------------------------------------------------------
   if (iMotivoBaixa <= 0) then
   begin
      dtmAtivoFixo.qryMotivoBaixa.Open;
      dtmAtivoFixo.qryMotivoBaixa.First;
      iMotivoBaixa := dtmAtivoFixo.qryMotivoBaixaIDMOTIVOBAIXA.AsInteger;
      dtmAtivoFixo.qryMotivoBaixa.Close;
   end;
   //-------------------------------------------------------------------------------------
   if (fPropBaixa <= 0) or (fPropBaixa > 100) then
   begin
      if bMostraMsg then
         MsgDlg('Forneça a Proporção da Baixa !','Erro',mtError,[mbOk],0);
      Result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após a Baixa
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataBaixa) then
   begin
      if bMostraMsg then
         MsgDlg('Existe movimentação após a data da baixa. Consulte Historico de Movimentações!',
                'Erro', mtError, [mbOk], 0);
      result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela de Bens no Bem a ser baixado
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      //----------------------------------------------------------------------------------
      // Calcula a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      fDepCmBem   := 0;
      fDepDepLanc := 0;
      fDepCmDep   := 0;
      if (qryBem.FieldByName('CONTROLE').AsString = 'T') then
         if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataBaixa - 1),bMostraMsg,
                                   fDepCmBem, fDepDepLanc, fDepCmDep) then
            Raise eExcessaoCAF.Create('Baixa : ExecutaDepreciacao');
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
         if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
         if not qryConta.Prepared      then qryConta.Prepare;
         if not qryCCrd.Prepared       then qryCCrd.Prepare;
         if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
         if not qryMontaCtb.Active     then qryMontaCtb.Open ;
      end;
      //----------------------------------------------------------------------------------
      if ((qryBem.FieldByName('BAIXATOTAL').AsString = 'S') or
          (qryBem.FieldByName('PROPBAIXA').AsFloat = 100)) then
      begin
         if bMostraMsg then
         begin
            MsgDlg('Bem '+trim(qryBem.FieldByName('DESBEM').AsString)+' - '
                     +inttostr(qryBem.FieldByName('PLACA').AsInteger)+' já Baixado !',
                   'Atenção',mtError,[mbOk],0);
         end;
         Raise eExcessaoCAF.Create('Baixa : Bem Ja Baixado');
      end;
      //----------------------------------------------------------------------------------
      if ((qryBem.FieldByName('PROPBAIXA').AsFloat + fPropBaixa) > 100) then
      begin
         fPropBaixar := (100 - qryBem.FieldByName('PROPBAIXA').AsFloat);
      end else
      begin
         fPropBaixar := fPropBaixa;
      end;
      //----------------------------------------------------------------------------------
      // Levanta o Saldo Contábil Atual para Realizar o Lancamento
      //----------------------------------------------------------------------------------
      if (fValVenda <> 0) then
      begin
         fSldContabil   := CalculaSaldoContabil(iEmpresaProp, iBem, dDataBaixa,fSldCtbImob);
         fValResult     := fValVenda - fSldContabil;
         fValResultImob := fValVenda - fSldCtbImob;
      end else
      begin
         fSldContabil   := 0;
         fValResult     := 0;
         fValResultImob := 0;
      end;
      //----------------------------------------------------------------------------------
      iaIdHistMov := 0;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 06
      //----------------------------------------------------------------------------------
      fBaixaB  := qryBem.FieldByName('VALORG').asFloat * (fPropBaixar / 100);
      fBaixaBF := qryBem.FieldByName('VALFIS').asFloat * (fPropBaixar / 100);
      fBaixaBG := qryBem.FieldByName('VALGER').asFloat * (fPropBaixar / 100);
      //----------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 06, dDataBaixa,
                                       -1,
                                       fBaixaB, fBaixaBF, fBaixaBG,
                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 06');
      //----------------------------------------------------------------------------------
      if not RegistraBaixaBem(iSeqHist,iMotivoBaixa,fPropBaixar,sObsBaixa,0,
                              bMostraMsg) then
         Raise eExcessaoCAF.Create('Baixa : RegistraBaixaBem - 06');
      //----------------------------------------------------------------------------------
      inc(iaIdHistMov);
      aIdHistMov[iaIdHistMov] := iSeqHist;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 25
      //----------------------------------------------------------------------------------
      fBaixaCM := qryBem.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
      if (fBaixaCM <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 25, dDataBaixa,
                                          -1,
                                          fBaixaCM, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 25');
         //-------------------------------------------------------------------------------
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 24
      //----------------------------------------------------------------------------------
      fBaixaD  := qryBem.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100);
      fBaixaDF := qryBem.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100);
      fBaixaDG := qryBem.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100);
      if (fBaixaD <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 24, dDataBaixa,
                                          -1,
                                          fBaixaD, fBaixaDF, fBaixaDG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 24');
         //-------------------------------------------------------------------------------
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 26
      //----------------------------------------------------------------------------------
      fBaixaCMD := qryBem.FieldByName('CMDEP').asFloat * (fPropBaixar / 100);
      if (fBaixaCMD <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 26, dDataBaixa,
                                          -1,
                                          fBaixaCMD, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 26');
         //-------------------------------------------------------------------------------
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(Sistema.IdModulo,
                                    qryBem.FieldByName('IDPESSOA').AsInteger,
                                    qryBem.FieldByName('IDBEM').AsInteger,
                                    dDataBaixa,
                                    (fBaixaB * -1), (fBaixaCM  * -1),
                                    (fBaixaD * -1), (fBaixaCMD * -1),
                                    0,0,0,0,0,0,0,0,
                                    0) then
         Raise eExcessaoCAF.Create('Baixa : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      if (qryBem.FieldByName('CONTROLE').AsString = 'T') and (IntegraContab(iEmpresaProp)) then
      begin
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('UNIDNEGOC').IsNull then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               if not Active then
               begin
                  ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
                  Open;
               end;
               if not IsEmpty then
                  sAtivProjeto := FieldByName('ATIVPROJETO').AsString
               else
                  sAtivProjeto := '';
            end;
         end else
         begin
            sAtivProjeto := qryBem.FieldByName('UNIDNEGOC').AsString;
         end;
         //-------------------------------------------------------------------------------
         bPlanilha := ContabilizaBaixa(iModulo,
                                       qryBem.FieldByName('IDPESSOA').AsInteger,
                                       qryBem.FieldByName('IDGRUPO').AsInteger,
                                       qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                       qryBem.FieldByName('IDBEM').AsInteger,
                                       dDataBaixa,
                                       fBaixaB,fBaixaCM,fBaixaD,fBaixaCMD,
                                       qryBem.FieldByName('DESBEM').AsString,
                                       sAtivProjeto,'B','B',
                                       qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                       qryBem.FieldByName('PLACA').AsString,
                                       bMostraMsg);
         if not bPlanilha then
            Raise eExcessaoCAF.Create('Baixa : ContabilizaBaixa');
         //-------------------------------------------------------------------------------
         if (fValVenda <> 0) then
         begin
            if (fSldContabil <> 0) then
            begin
               fPropResult := ((qryBem.FieldByName('VALORG').AsCurrency +
                                qryBem.FieldByName('CMBEM').AsCurrency) -
                               (qryBem.FieldByName('DEPLANC').AsCurrency +
                                qryBem.FieldByName('CMDEP').AsCurrency)) / fSldContabil;
            end else
            begin
               fPropResult := 1;
            end;
            //----------------------------------------------------------------------------
            fPropResult := strtofloat(FormatFloat('###########0.000000',((fPropResult * 1000000) / 1000000)));
            bPlanilha := ContabilizaResultadoBaixa(iModulo,
                                             qryBem.FieldByName('IDPESSOA').AsInteger,
                                             qryBem.FieldByName('IDGRUPO').AsInteger,
                                             qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                             qryBem.FieldByName('IDBEM').AsInteger,
                                             dDataBaixa,
                                             (fValResult * fPropResult),
                                             qryBem.FieldByName('DESBEM').AsString,
                                             sAtivProjeto,
                                             qryBem.FieldByName('CODSUBCONTA').asInteger,
                                             qryBem.FieldByName('PLACA').AsString,
                                             bMostraMsg);
            if not bPlanilha then
               Raise eExcessaoCAF.Create('Baixa : ContabilizaResultadoBaixa');
         end;
      end;
      //----------------------------------------------------------------------------------
      // Registra as alteracoes na Tabela de Bens
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('VALORG').asFloat  := qryBem.FieldByName('VALORG').asFloat  - fBaixaB;
      qryBem.FieldByName('VALFIS').asFloat  := qryBem.FieldByName('VALFIS').asFloat  - fBaixaBF;
      qryBem.FieldByName('VALGER').asFloat  := qryBem.FieldByName('VALGER').asFloat  - fBaixaBG;
      qryBem.FieldByName('DEPLANC').asFloat := qryBem.FieldByName('DEPLANC').asFloat - fBaixaD;
      qryBem.FieldByName('DEPFIS').asFloat  := qryBem.FieldByName('DEPFIS').asFloat  - fBaixaDF;
      qryBem.FieldByName('DEPGER').asFloat  := qryBem.FieldByName('DEPGER').asFloat  - fBaixaDG;
      qryBem.FieldByName('CMBEM').asFloat   := qryBem.FieldByName('CMBEM').asFloat   - fBaixaCM;
      qryBem.FieldByName('CMDEP').asFloat   := qryBem.FieldByName('CMDEP').asFloat   - fBaixaCMD;
      //----------------------------------------------------------------------------------
      if (qryBem.FieldByName('PROPBAIXA').AsFloat + fPropBaixar >= 100) then
         qryBem.FieldByName('BAIXATOTAL').AsString := 'S'
      else
         qryBem.FieldByName('BAIXATOTAL').AsString := 'N';
      qryBem.FieldByName('PROPBAIXA').AsFloat := qryBem.FieldByName('PROPBAIXA').AsFloat + fPropBaixar;
      //----------------------------------------------------------------------------------
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // BAIXA AS REAVALIACOES
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 20
         //-------------------------------------------------------------------------------
         fBaixaB  := qryReavaliacao.FieldByName('VALORG').asFloat * (fPropBaixar / 100);
         fBaixaBF := qryReavaliacao.FieldByName('VALFIS').asFloat * (fPropBaixar / 100);
         fBaixaBG := qryReavaliacao.FieldByName('VALGER').asFloat * (fPropBaixar / 100);
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 20, dDataBaixa,
                                          qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                          fBaixaB, fBaixaBF, fBaixaBG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 20');
         //-------------------------------------------------------------------------------
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 28
         //-------------------------------------------------------------------------------
         fBaixaCM := qryReavaliacao.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 28, dDataBaixa,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 28');
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 27
         //-------------------------------------------------------------------------------
         fBaixaD  := qryReavaliacao.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100);
         fBaixaDF := qryReavaliacao.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100);
         fBaixaDG := qryReavaliacao.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100);
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 27, dDataBaixa,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaD, fBaixaDF, fBaixaDG,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 27');
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 29
         //-------------------------------------------------------------------------------
         fBaixaCMD := qryReavaliacao.FieldByName('CMDEP').asFloat * (fPropBaixar / 100);
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 29, dDataBaixa,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCMD, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 29');
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0 then
            if not AtualizaSaldoContabBem(iModulo,iEmpresaProp,iBem,
                                          dDataBaixa,
                                          0,0,0,0,
                                          (fBaixaB * -1), (fBaixaCM  * -1),
                                          (fBaixaD * -1), (fBaixaCMD * -1),
                                          0,0,0,0,
                                          0) then
               Raise eExcessaoCAF.Create('Baixa : AtualizaSaldoContabBem')
         else
            if not AtualizaSaldoContabBem(iModulo,iEmpresaProp,iBem,
                                          dDataBaixa,
                                          0,0,0,0,
                                          0,0,0,0,
                                          (fBaixaB * -1), (fBaixaCM  * -1),
                                          (fBaixaD * -1), (fBaixaCMD * -1),
                                          0) then
               Raise eExcessaoCAF.Create('Baixa : AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         // Lançamentos Contábeis
         //-------------------------------------------------------------------------------
         if (qryBem.FieldByName('CONTROLE').AsString = 'T') and (IntegraContab(iEmpresaProp)) then
         begin
            bPlanilha := ContabilizaBaixa(iModulo,
                                          qryBem.FieldByName('IDPESSOA').AsInteger,
                                          qryBem.FieldByName('IDGRUPO').AsInteger,
                                          qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                          qryBem.FieldByName('IDBEM').AsInteger,
                                          dDataBaixa,
                                          fBaixaB,fBaixaCM,fBaixaD,fBaixaCMD,
                                          qryBem.FieldByName('DESBEM').AsString,
                                          sAtivProjeto,'R','B',
                                          qryBem.FieldByName('CODSUBCONTA').asInteger,
                                          qryBem.FieldByName('PLACA').AsString,
                                          bMostraMsg);
            if not bPlanilha then
               Raise eExcessaoCAF.Create('Baixa : ContabilizaBaixa (Reavaliação)');
            //----------------------------------------------------------------------------
            if (fValVenda <> 0) then
            begin
               if (fSldContabil <> 0) then
               begin
                  fPropResult := ((qryReavaliacao.FieldByName('VALORG').AsCurrency +
                                   qryReavaliacao.FieldByName('CMBEM').AsCurrency) -
                                  (qryReavaliacao.FieldByName('DEPLANC').AsCurrency +
                                   qryReavaliacao.FieldByName('CMDEP').AsCurrency)) / fSldContabil;
               end else
               begin
                  fPropResult := 1;
               end;
               //-------------------------------------------------------------------------
               fPropResult := strtofloat(FormatFloat('###########0.000000',((fPropResult * 1000000) / 1000000)));
               bPlanilha := ContabilizaResultadoBaixa(iModulo,
                                                qryBem.FieldByName('IDPESSOA').AsInteger,
                                                qryBem.FieldByName('IDGRUPO').AsInteger,
                                                qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                                qryBem.FieldByName('IDBEM').AsInteger,
                                                dDataBaixa,
                                                (fValResult * fPropResult),
                                                qryBem.FieldByName('DESBEM').AsString,
                                                sAtivProjeto,
                                                qryBem.FieldByName('CODSUBCONTA').asInteger,
                                                qryBem.FieldByName('PLACA').AsString,
                                                bMostraMsg);
               if not bPlanilha then
                  Raise eExcessaoCAF.Create('Baixa : ContabilizaResultadoBaixa (Reavaliação)');
            end;
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Bens
         //-------------------------------------------------------------------------------
         qryReavaliacao.Edit;
         qryReavaliacao.FieldByName('VALORG').asFloat  := qryReavaliacao.FieldByName('VALORG').asFloat  - fBaixaB;
         qryReavaliacao.FieldByName('VALFIS').asFloat  := qryReavaliacao.FieldByName('VALFIS').asFloat  - fBaixaBF;
         qryReavaliacao.FieldByName('VALGER').asFloat  := qryReavaliacao.FieldByName('VALGER').asFloat  - fBaixaBG;
         qryReavaliacao.FieldByName('DEPLANC').asFloat := qryReavaliacao.FieldByName('DEPLANC').asFloat - fBaixaD;
         qryReavaliacao.FieldByName('DEPFIS').asFloat  := qryReavaliacao.FieldByName('DEPFIS').asFloat  - fBaixaDF;
         qryReavaliacao.FieldByName('DEPGER').asFloat  := qryReavaliacao.FieldByName('DEPGER').asFloat  - fBaixaDG;
         qryReavaliacao.FieldByName('CMBEM').asFloat   := qryReavaliacao.FieldByName('CMBEM').asFloat   - fBaixaCM;
         qryReavaliacao.FieldByName('CMDEP').asFloat   := qryReavaliacao.FieldByName('CMDEP').asFloat   - fBaixaCMD;
         qryReavaliacao.Post;
         qryReavaliacao.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // BAIXA OS ACRÉSCIMOS DE VALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 37
         //-------------------------------------------------------------------------------
         fBaixaB  := qryAcrescimo.FieldByName('VALORG').asFloat * (fPropBaixar / 100);
         fBaixaBF := qryAcrescimo.FieldByName('VALFIS').asFloat * (fPropBaixar / 100);
         fBaixaBG := qryAcrescimo.FieldByName('VALGER').asFloat * (fPropBaixar / 100);
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 37, dDataBaixa,
                                          qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                          fBaixaB, fBaixaBF, fBaixaBG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 37');
         //-------------------------------------------------------------------------------
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 38
         //-------------------------------------------------------------------------------
         fBaixaCM := qryAcrescimo.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 38, dDataBaixa,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 38');
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 39
         //-------------------------------------------------------------------------------
         fBaixaD  := qryAcrescimo.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100);
         fBaixaDF := qryAcrescimo.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100);
         fBaixaDG := qryAcrescimo.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100);
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 39, dDataBaixa,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaD, fBaixaDF, fBaixaDG,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 39');
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 40
         //-------------------------------------------------------------------------------
         fBaixaCMD := qryAcrescimo.FieldByName('CMDEP').asFloat * (fPropBaixar / 100);
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 40, dDataBaixa,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaCMD, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 40');
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if not AtualizaSaldoContabBem(iModulo,iEmpresaProp,iBem,
                                       dDataBaixa,
                                       (fBaixaB * -1), (fBaixaCM  * -1),
                                       (fBaixaD * -1), (fBaixaCMD * -1),
                                       0,0,0,0,
                                       0,0,0,0,
                                       0) then
            Raise eExcessaoCAF.Create('Baixa : AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         // Lançamentos Contábeis
         //-------------------------------------------------------------------------------
         if (qryBem.FieldByName('CONTROLE').AsString = 'T') and (IntegraContab(iEmpresaProp)) then
         begin
            bPlanilha := ContabilizaBaixa(iModulo,
                                          qryBem.FieldByName('IDPESSOA').AsInteger,
                                          qryBem.FieldByName('IDGRUPO').AsInteger,
                                          qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                          qryBem.FieldByName('IDBEM').AsInteger,
                                          dDataBaixa,
                                          fBaixaB,fBaixaCM,fBaixaD,fBaixaCMD,
                                          qryBem.FieldByName('DESBEM').AsString,
                                          sAtivProjeto,'A','B',
                                          qryBem.FieldByName('CODSUBCONTA').asInteger,
                                          qryBem.FieldByName('PLACA').AsString,
                                          bMostraMsg);
            if not bPlanilha then
               Raise eExcessaoCAF.Create('Baixa : ContabilizaBaixa (Acréscimos)');
            //----------------------------------------------------------------------------
            if (fValVenda <> 0) then
            begin
               if fSldContabil <> 0 then
               begin
                  fPropResult := ((qryAcrescimo.FieldByName('VALORG').AsCurrency +
                                   qryAcrescimo.FieldByName('CMBEM').AsCurrency) -
                                  (qryAcrescimo.FieldByName('DEPLANC').AsCurrency +
                                   qryAcrescimo.FieldByName('CMDEP').AsCurrency)) / fSldContabil;
               end else
               begin
                  fPropResult := 1;
               end;
               //-------------------------------------------------------------------------
               fPropResult := strtofloat(FormatFloat('###########0.000000',((fPropResult * 1000000) / 1000000)));
               bPlanilha := ContabilizaResultadoBaixa(iModulo,
                                                qryBem.FieldByName('IDPESSOA').AsInteger,
                                                qryBem.FieldByName('IDGRUPO').AsInteger,
                                                qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                                qryBem.FieldByName('IDBEM').AsInteger,
                                                dDataBaixa,
                                                (fValResult * fPropResult),
                                                qryBem.FieldByName('DESBEM').AsString,
                                                sAtivProjeto,
                                                qryBem.FieldByName('CODSUBCONTA').asInteger,
                                                qryBem.FieldByName('PLACA').AsString,
                                                bMostraMsg);
               if not bPlanilha then
                  Raise eExcessaoCAF.Create('Baixa : ContabilizaResultadoBaixa (Reavaliação)');
            end;
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Acrescimos de Valor
         //-------------------------------------------------------------------------------
         qryAcrescimo.Edit;
         qryAcrescimo.FieldByName('VALORG').asFloat  := qryAcrescimo.FieldByName('VALORG').asFloat  - fBaixaB;
         qryAcrescimo.FieldByName('VALFIS').asFloat  := qryAcrescimo.FieldByName('VALFIS').asFloat  - fBaixaBF;
         qryAcrescimo.FieldByName('VALGER').asFloat  := qryAcrescimo.FieldByName('VALGER').asFloat  - fBaixaBG;
         qryAcrescimo.FieldByName('DEPLANC').asFloat := qryAcrescimo.FieldByName('DEPLANC').asFloat - fBaixaD;
         qryAcrescimo.FieldByName('DEPFIS').asFloat  := qryAcrescimo.FieldByName('DEPFIS').asFloat  - fBaixaDF;
         qryAcrescimo.FieldByName('DEPGER').asFloat  := qryAcrescimo.FieldByName('DEPGER').asFloat  - fBaixaDG;
         qryAcrescimo.FieldByName('CMBEM').asFloat   := qryAcrescimo.FieldByName('CMBEM').asFloat   - fBaixaCM;
         qryAcrescimo.FieldByName('CMDEP').asFloat   := qryAcrescimo.FieldByName('CMDEP').asFloat   - fBaixaCMD;
         qryAcrescimo.Post;
         qryAcrescimo.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         if not VerificaPeriodoContabil(iEmpresaProp, dDataBaixa, iExercicio, iPeriodo,
                                        sMensagem, bMostraMsg) then
            Raise eExcessaoCAF.Create('Baixa : RegistraPlanilhaContabil');
         //-------------------------------------------------------------------------------
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo, dDataBaixa,
                                               sMensagem, bMostraMsg);
         dtmAtivoFixo.qryMontaCtb.Close;
         if iPlanilha <= 0 then
            Raise eExcessaoCAF.Create('Baixa : RegistraPlanilhaContabil');
         //-------------------------------------------------------------------------------
         // Registra no Historico a Planilha Gerada
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo.qryHistCtb do
         begin
            iAux := 1;
            while iAux <= iaIdHistMov do
            begin
               ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[iAux];
               ParamByName('PPLNCODIGO').AsInteger := iPlanilha;
               ExecSQL;
               inc(iAux);
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := True;
   except
      if bTransacao then
         RollBackTransacao;
      Result := False;
   end;
end;
//========================================================================================
// Função que registra o Historico da Baixa do Bem / Reavaliação do Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iSeqHist     : id da Movimentacao                            (IDMOVIMENTACAO)
//    iMotivoBaixa : id do Motivo da Baixa                         (IDMOTIVOBAIXA)
//    fPropBaixar  : Proporção da Baixa                            (PROPBAIXAR)
//    sObsBaixa    : Observações da Baixa                          (OBS)
//    iIdReaval    : Id da Reavaliacao Baixada (0 se for Baixa do Bem)
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraBaixaBem(iSeqHist, iMotivoBaixa : Integer;
                                     fPropBaixar : Double; sObsBaixa : string;
                                     iIdReaval : Integer;
                                     bMostraMsg : Boolean) : Boolean;

var
   qryBaixaBem : TwwQuery;

begin
   qryBaixaBem := TwwQuery(dtmAtivoFixo.qryRegistraBaixaBem);
   //-------------------------------------------------------------------------------------
   try
      with qryBaixaBem do
      begin
         ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         ParamByName('PIDMOTIVOBAIXA').AsInteger  := iMotivoBaixa;
         ParamByName('PPROPBAIXAR').AsFloat       := fPropBaixar;
         ParamByName('POBS').AsString             := sObsBaixa;
         if iIdReaval > 0 then
            ParamByName('PIDREAVAL').AsInteger := iIdReaval
         else
            ParamByName('PIDREAVAL').Clear;
         ExecSQL;
      end;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
      if bMostraMsg then
         Raise;
   end;
end;
//========================================================================================
// Função que Contabiliza a Baixa do Bem / Reavaliacao do Bem / Acréscimo de Valor do Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)
//    iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Bem movimentado
//    iConjunto    : id do Conjunto do Bem movimentado
//    iBem         : id do Bem movimentado
//    dDataLanc    : Data da Baixa
//    fBaixaB      : Valores a serem Lancados
//    fBaixaCMB    :           ''
//    fBaixaD      :           ''
//    fBaixaCMD    :           ''
//    sDesBem      : Descrição do Bem
//    sAtivProjeto : Unidade de Negócio
//    sTipoTab     : Define qual tabela está sendo processada (B - BEM, R - REAVALIACAO)
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaBaixa(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                     dDataLanc : TDate;
                                     fBaixaB,fBaixaCMB,fBaixaD,fBaixaCMD : Double;
                                     sDesBem,sAtivProjeto,sTipoTab,sTipoMov : String;
                                     iSubConta : Integer; sPlaca : String;
                                     bMostraMsg : Boolean) : Boolean;

var
   sGrupo    ,                             // Descricao de Grupo do Bem

   sDebito   ,sCredito,                    // Contas Contábeis
   sDebitoCM ,sCreditoCM,
   sDebitoD  ,sCreditoD,
   sDebitoCMD,sCreditoCMD,

   sCCDebito   ,sCCCredito,                // Centros de Custos
   sCCDebitoCM ,sCCCreditoCM,
   sCCDebitoD  ,sCCCreditoD,
   sCCDebitoCMD,sCCCreditoCMD : String;

   iPlanoConta                : Integer;   // Plano de Contas

   sHistor  ,sHistor1,                     // Historico
   sHistor2 ,sHistor3,
   sHistor4 ,

   sCc      , sPlaCCust,                   // Conta e Plano do Centro de Custo
   sMensagem, sMensErro        : String;   // Mensagem da Contabilidade
   iExercicio,iPeriodo,                    // Periodo Contábil
   iTipoMov1,iTipoMov2,                    // Tipos de Movimentações
   iTipoMov3,iTipoMov4         : Integer;
   fParticip1,fParticip2,                  // Rateio de Custos
   fParticip3,fParticip4,
   fParticip5,fParticip6,
   fParticip7,fParticip8,
   fValLanc                    : Double;
   qryCcRD                     : TwwQuery;
   sNomeConta,sObrigaSubConta,
   sObrigaCC                   : String;

begin
   qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
   //-------------------------------------------------------------------------------------
   if sTipoTab = 'B' then
   begin
      iTipoMov1 := 06;
      iTipoMov2 := 25;
      iTipoMov3 := 24;
      iTipoMov4 := 26;
      sMensErro := '';
   end else
   if sTipoTab = 'R' then
   begin
      iTipoMov1 := 20;
      iTipoMov2 := 28;
      iTipoMov3 := 27;
      iTipoMov4 := 29;
      sMensErro := ' (Reavaliação) ';
   end else
   begin
      iTipoMov1 := 37;
      iTipoMov2 := 38;
      iTipoMov3 := 39;
      iTipoMov4 := 40;
      sMensErro := ' (Acréscimo) ';
   end;
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := iPessoa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Baixa
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov1,'D',iPlanoConta,sDebito,sCCDebito);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para a Baixa
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov1,'C',iPlanoConta,sCredito,sCCCredito);
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Baixa da Correção Monetária
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov2,'D',iPlanoConta,sDebitoCM,sCCDebitoCM);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para a Baixa da Correção Monetária
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov2,'C',iPlanoConta,sCreditoCM,sCCCreditoCM);
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Baixa da Depreciacao
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov3,'D',iPlanoConta,sDebitoD,sCCDebitoD);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para a Baixa da Depreciacao
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov3,'C',iPlanoConta,sCreditoD,sCCCreditoD);
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Baixa da Correção Monetária da Depreciacao
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov4,'D',iPlanoConta,sDebitoCMD,sCCDebitoCMD);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para a Baixa da Correção Monetária da Depreciacao
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov4,'C',iPlanoConta,sCreditoCMD,sCCCreditoCMD);
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Débito para o Movimento de Baixa no Grupo ' + sGrupo +
                ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCredito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a crédito para o Movimento de Baixa no Grupo ' + sGrupo +
                ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (fBaixaCMB <> 0) then
   begin
      if (sDebitoCM = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a Débito para o Movimento de Baixa de Correção Monetária no Grupo '
                   + sGrupo + ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
         end;
         Result := False;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (sCreditoCM = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a crédito para o Movimento de Baixa de Correção Monetária no Grupo '
                   + sGrupo + ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
         end;
         Result := False;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (fBaixaD <> 0) then
   begin
      if (sDebitoD = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a Débito para o Movimento de Baixa de Depreciação no Grupo ' +
                   sGrupo + ' não cadastrada !' + sMensErro, 'Erro', mtError, [mbOk], 0);
         end;
         Result := False;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (sCreditoD = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a crédito para o Movimento de Baixa de Depreciação no Grupo ' +
                   sGrupo + ' não cadastrada !' + sMensErro, 'Erro', mtError, [mbOk], 0);
         end;
         Result := False;
         exit;
      end;
   end;
   //----------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //----------------------------------------------------------------------------------
   if (fBaixaCMD <> 0) then
   begin
      if (sDebitoCMD = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a Débito para o Movimento de Baixa da Correção Monetária da ' +
                   'Depreciação no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro,
                   'Erro', mtError, [mbOk], 0);
         end;
         Result := False;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (sCreditoCMD = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a Crédito para o Movimento de Baixa da Correção Monetária da ' +
                   'Depreciação no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro,
                   'Erro', mtError, [mbOk], 0);
         end;
         Result := False;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Processamento do Rateio dos Custos
   //-------------------------------------------------------------------------------------
   if (sTipoMov <> 'T') then
   begin
      sHistor := 'Baixa de Bem ';
   end else
   begin
      if sTipoTab = 'B' then
      begin
         sHistor := 'Transferência (Baixa de Bem)';
      end else
      if sTipoTab = 'R' then
      begin
         sHistor := 'Transferência (Baixa das Reavaliações)';
      end else
      if sTipoTab = 'A' then
      begin
         sHistor := 'Transferência (Baixa dos Acréscimos de Valor)';
      end;
   end;
   sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
   sHistor2   := '';
   sHistor3   := '';
   sHistor4   := '';
   fParticip1 := 0;
   fParticip2 := 0;
   fParticip3 := 0;
   fParticip4 := 0;
   fParticip5 := 0;
   fParticip6 := 0;
   fParticip7 := 0;
   fParticip8 := 0;
   //-------------------------------------------------------------------------------------
   // Busca Rateio da Depreciação do Bem
   //-------------------------------------------------------------------------------------
   qryCcRD.Close;
   qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
   qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
   qryCcRD.Open;
   //-------------------------------------------------------------------------------------
   qryCcRD.First;
   while not qryCcRD.EOF do
   begin
      sHistor := 'Baixa de Bem ';
      if (fParticip1 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //-------------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if qryCcRD.FieldByName('TIPO').AsString = 'A' then
            begin
               fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjunto) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := False;
               exit;
            end;
         end else
         begin
            fParticip1 := 100;
            sCc        := '';
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fBaixaB * fParticip1) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,sDebito,'',inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := False;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fParticip2 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //-------------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if qryCcRD.FieldByName('TIPO').AsString = 'A' then
            begin
               fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjunto) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := False;
               exit;
            end;
         end else
         begin
            fParticip2 := 100;
            sCc        := '';
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fBaixaB * fParticip2) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,'',sCredito,inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := False;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fBaixaCMB <> 0) then
      begin
         sHistor := 'Baixa da Correção Monetária de Bem ';
         if (fParticip3 < 100) then
         begin
            sObrigaCC := '';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCM,
                                     sObrigaCC, sNomeConta, sObrigaSubConta);
            //-------------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  fParticip3 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
               end else
               begin
                  MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjunto) +
                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                         'de Conjuntos!','Erro',mtError,[mbOk],0);
                  Result := False;
                  exit;
               end;
            end else
            begin
               fParticip3 := 100;
               sCc        := '';
            end;
            //-------------------------------------------------------------------------------
            fValLanc := (fBaixaCMB * fParticip3) / 100;
            //-------------------------------------------------------------------------------
            if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,sDebitoCM,'',inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := False;
               exit;
            end;
         end;
         //----------------------------------------------------------------------------------
         if (fParticip4 < 100) then
         begin
            sObrigaCC := '';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCM,
                                     sObrigaCC, sNomeConta, sObrigaSubConta);
            //-------------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  fParticip4 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
               end else
               begin
                  MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjunto) +
                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                         'de Conjuntos!','Erro',mtError,[mbOk],0);
                  Result := False;
                  exit;
               end;
            end else
            begin
               fParticip4 := 100;
               sCc        := '';
            end;
            //-------------------------------------------------------------------------------
            fValLanc := (fBaixaCMB * fParticip4) / 100;
            //-------------------------------------------------------------------------------
            if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,'',sCreditoCM,inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := False;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fBaixaD <> 0) then
      begin
         sHistor := 'Baixa da Depreciacao do Bem ';
         if (fParticip5 < 100) then
         begin
            sObrigaCC := '';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoD,
                                     sObrigaCC, sNomeConta, sObrigaSubConta);
            //-------------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  fParticip5 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
               end else
               begin
                  MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjunto) +
                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                         'de Conjuntos!','Erro',mtError,[mbOk],0);
                  Result := False;
                  exit;
               end;
            end else
            begin
               fParticip5 := 100;
               sCc        := '';
            end;
            //-------------------------------------------------------------------------------
            fValLanc := (fBaixaD * fParticip5) / 100;
            //-------------------------------------------------------------------------------
            if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,sDebitoD,'',inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := False;
               exit;
            end;
         end;
         //----------------------------------------------------------------------------------
         if (fParticip6 < 100) then
         begin
            sObrigaCC := '';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoD,
                                     sObrigaCC, sNomeConta, sObrigaSubConta);
            //-------------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  fParticip6 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
               end else
               begin
                  MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjunto) +
                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                         'de Conjuntos!','Erro',mtError,[mbOk],0);
                  Result := False;
                  exit;
               end;
            end else
            begin
               fParticip6 := 100;
               sCc        := '';
            end;
            //-------------------------------------------------------------------------------
            fValLanc := (fBaixaD * fParticip6) / 100;
            //-------------------------------------------------------------------------------
            if (fValLanc <> 0) then
            begin
               if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                      sCc,sAtivProjeto,'',sCreditoD,inttostr(iBem),fValLanc,
                                      iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
               begin
                  Result := False;
                  exit;
               end;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fBaixaCMD <> 0) then
      begin
         sHistor := 'Baixa da Correção Monetária da Depreciação do Bem ';
         if (fParticip7 < 100) then
         begin
            sObrigaCC := '';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCMD,
                                     sObrigaCC, sNomeConta, sObrigaSubConta);
            //-------------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  fParticip7 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
               end else
               begin
                  MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjunto) +
                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                         'de Conjuntos!','Erro',mtError,[mbOk],0);
                  Result := False;
                  exit;
               end;
            end else
            begin
               fParticip7 := 100;
               sCc        := '';
            end;
            //-------------------------------------------------------------------------------
            fValLanc := (fBaixaCMD * fParticip7) / 100;
            //-------------------------------------------------------------------------------
            if (fValLanc <> 0) then
            begin
               if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                      sCc,sAtivProjeto,sDebitoCMD,'',inttostr(iBem),fValLanc,
                                      iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
               begin
                  Result := False;
                  exit;
               end;
            end;
         end;
         //----------------------------------------------------------------------------------
         if (fParticip8 < 100) then
         begin
            sObrigaCC := '';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCMD,
                                     sObrigaCC, sNomeConta, sObrigaSubConta);
            //-------------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  fParticip8 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
               end else
               begin
                  MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjunto) +
                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                         'de Conjuntos!','Erro',mtError,[mbOk],0);
                  Result := False;
                  exit;
               end;
            end else
            begin
               fParticip8 := 100;
               sCc        := '';
            end;
            //-------------------------------------------------------------------------------
            fValLanc := (fBaixaCMD * fParticip8) / 100;
            //-------------------------------------------------------------------------------
            if (fValLanc <> 0) then
            begin
               if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                      sCc,sAtivProjeto,'',sCreditoCMD,inttostr(iBem),fValLanc,
                                      iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
               begin
                  Result := False;
                  exit;
               end;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      qryCcRD.Next;
   end;
   qryCcRD.Close;
   //-------------------------------------------------------------------------------------
   Result := True;
end;
//========================================================================================
// Função que Contabiliza o resultado da alienação do bem
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)
//    iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Bem movimentado
//    iConjunto    : id do Conjunto do Bem movimentado
//    iBem         : id do Bem movimentado
//    dDataLanc    : Data da Baixa
//    fValLanc     : Valor a ser Lancado
//    sDesBem      : Descrição do Bem
//    sAtivProjeto : Unidade de Negócio
//    iTipoMov     : Define qual tabela está sendo processada (B - BEM, R - REAVALIACAO)
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaResultadoBaixa(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                              dDataLanc : TDate; fValLanc : Double;
                                              sDesBem,sAtivProjeto : String;
                                              iSubConta : Integer; sPlaca : String;
                                              bMostraMsg : Boolean) : Boolean;

var
   sGrupo   ,                                // Descricao de Grupo do Bem
   sDebito  ,sCredito,                       // Contas Contábeis
   sCCDebito,sCCCredito         : String;    // Centros de Custos
   iPlanoConta                  : Integer;   // Plano de Contas
   sHistor  ,sHistor1,                       // Historico
   sHistor2 ,sHistor3,
   sHistor4 ,
   sCc      , {sPlaCCust,}                   // Conta e Plano do Centro de Custo
   {sMensagem,} sMensErro         : String;    // Mensagem da Contabilidade
   {iExercicio,iPeriodo,}iTipoMov : Integer;   // Periodo Contábil

   fParticip1,fParticip2        : Double;    // Rateio de Custos
   qryCcRD                      : TwwQuery;
   sNomeConta,sObrigaSubConta,
   sObrigaCC                   : String;

begin
   if fValLanc > 0 then
   begin
      iTipoMov := 30;
   end else
   begin
      iTipoMov := 31;
   end;
   //-------------------------------------------------------------------------------------
   qryCcRD := TwwQuery(dtmAtivoFixo.qryCcRD);
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := iPessoa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para Resultado da Alienação
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov,'D',iPlanoConta,sDebito,sCCDebito);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para Resultado da Alienação
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov,'C',iPlanoConta,sCredito,sCCCredito);
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Débito para o Movimento de Baixa no Grupo ' + sGrupo +
                ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCredito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a crédito para o Movimento de Baixa no Grupo ' + sGrupo +
                ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Processamento do Rateio dos Custos
   //-------------------------------------------------------------------------------------
   sHistor    := 'Resultado de Alienacao de Bem';
   sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
   sHistor2   := '';
   sHistor3   := '';
   sHistor4   := '';
   fParticip1 := 0;
   fParticip2 := 0;
   //-------------------------------------------------------------------------------------
   // Busca Rateio da Depreciação do Bem
   //-------------------------------------------------------------------------------------
   qryCcRD.Close;
   qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
   qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
   qryCcRD.Open;
   //-------------------------------------------------------------------------------------
   qryCcRD.First;
   while not qryCcRD.EOF do
   begin
      if (fParticip1 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //-------------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if qryCcRD.FieldByName('TIPO').AsString = 'A' then
            begin
               fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjunto) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := False;
               exit;
            end;
         end else
         begin
            fParticip1 := 100;
            sCc        := '';
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fValLanc * fParticip1) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,sDebito,'',inttostr(iBem),abs(fValLanc),
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := False;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fParticip2 < 100) then
      begin
         sObrigaCC := '';
         FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                  sObrigaCC, sNomeConta, sObrigaSubConta);
         //----------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            if qryCcRD.FieldByName('TIPO').AsString = 'A' then
            begin
               fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
            end else
            begin
               MsgDlg('O Rateio de Custo do Conjunto ' + inttostr(iConjunto) +
                      ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                      'de Conjuntos!','Erro',mtError,[mbOk],0);
               Result := False;
               exit;
            end;
         end else
         begin
            fParticip2 := 100;
            sCc        := '';
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fValLanc * fParticip2) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,'',sCredito,inttostr(iBem),abs(fValLanc),
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := False;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      qryCcRD.Next;
   end;
   qryCcRD.Close;
   //-------------------------------------------------------------------------------------
   Result := True;
end;
//========================================================================================
// Função que Estorna a Baixa de um Bem
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function TAtivoFixo.EstornaBaixa(iModulo, iEmpresaProp, iBem : Integer;
                                 dDataMov,dDataEst : tDate;
                                 bMostraMsg : boolean) : Integer;
var
   iPlnCodigo, iResult,
   iExercicio,iPeriodo                                 : Integer;
   sMascara,sMensagem                                  : String;
   qryAux,qryBem,qryReavaliacao,qryAcrescimo,qryUltMov : TwwQuery;
   bTransacao                                          : Boolean;

begin
   with dtmAtivoFixo do
   begin
      if not qryUltMov.Prepared then
         qryUltMov.Prepare;

      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryReavaliacao.Prepared then
         qryReavaliacao.Prepare;

      if not qryAcrescimo.Prepared then
         qryAcrescimo.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após a Baixa
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
   begin
      if bMostraMsg then
         MsgDlg('Existe movimentação após a Baixa. Consulte Movimentação!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   iResult := 0;
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Estorna a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      if EstornaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),dDataEst,bMostraMsg) < 0 then
         Raise eExcessaoCAF.Create('Baixa : EstornaDepreciacaoProRata');
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na Tabela BEM
      //----------------------------------------------------------------------------------
      iPlnCodigo := 0;
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT HM.IDMOVIMENTACAO,HM.PLNCODIGO,HM.IDTIPOMOVIMENTACAO,'+
                         '        HM.VALOFI,HM.VALFIS,HM.VALGER,BB.PROPBAIXAR '+
                         ' FROM HISTORICOMOVIMENTACAO HM, '+
                         '      BAIXABEM BB '+
                         ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (HM.IDTIPOMOVIMENTACAO IN (06,25,24,26)) ' +
                         '   AND (HM.IDMOVIMENTACAO = BB.IDMOVIMENTACAO(+))' ;
      qryAux.Open;
      while not qryAux.EOF do
      begin
         qryBem.Edit;
         case qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
            06 : begin
                    if not (qryAux.FieldByName('PLNCODIGO').IsNull) then
                       iPlnCodigo := qryAux.FieldByName('PLNCODIGO').AsInteger;
                    qryBem.FieldByName('VALORG').AsCurrency := qryBem.FieldByName('VALORG').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    qryBem.FieldByName('VALFIS').AsCurrency := qryBem.FieldByName('VALFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                    qryBem.FieldByName('VALGER').AsCurrency := qryBem.FieldByName('VALGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    qryBem.FieldByName('PROPBAIXA').AsFloat := qryBem.FieldByName('PROPBAIXA').AsFloat - qryAux.FieldByName('PROPBAIXAR').AsFloat;
                    qryBem.FieldByName('BAIXATOTAL').AsString := 'N';
                 end;
            25 : begin
                    qryBem.FieldByName('CMBEM').AsCurrency := qryBem.FieldByName('CMBEM').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                 end;
            24 : begin
                    qryBem.FieldByName('DEPLANC').AsCurrency := qryBem.FieldByName('DEPLANC').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    qryBem.FieldByName('DEPFIS').AsCurrency  := qryBem.FieldByName('DEPFIS').AsFloat  + qryAux.FieldByName('VALFIS').AsFloat;
                    qryBem.FieldByName('DEPGER').AsCurrency  := qryBem.FieldByName('DEPGER').AsFloat  + qryAux.FieldByName('VALGER').AsFloat;
                 end;
            26 : begin
                    qryBem.FieldByName('CMDEP').AsCurrency := qryBem.FieldByName('CMDEP').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                 end;
         end;
         //-------------------------------------------------------------------------------
         qryAux.Next;
      end;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na tabela REAVALIACAO
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         qryReavaliacao.Edit;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,PLNCODIGO,IDTIPOMOVIMENTACAO, '+
                            '        VALOFI, VALFIS, VALGER '+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDREAVALACRESC = ' + qryReavaliacao.FieldByName('IDREAVALIACAO').AsString + ')' +
                            '   AND (IDTIPOMOVIMENTACAO IN (20,28,27,29)) ';
         qryAux.Open;
         while not qryAux.EOF do
         begin
            case qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               20 : begin
                       qryReavaliacao.FieldByName('VALORG').AsCurrency := qryReavaliacao.FieldByName('VALORG').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryReavaliacao.FieldByName('VALFIS').AsCurrency := qryReavaliacao.FieldByName('VALFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryReavaliacao.FieldByName('VALGER').AsCurrency := qryReavaliacao.FieldByName('VALGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               28 : begin
                       qryReavaliacao.FieldByName('CMBEM').AsCurrency  := qryReavaliacao.FieldByName('CMBEM').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
               27 : begin
                       qryReavaliacao.FieldByName('DEPLANC').AsCurrency := qryReavaliacao.FieldByName('DEPLANC').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryReavaliacao.FieldByName('DEPFIS').AsCurrency  := qryReavaliacao.FieldByName('DEPFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryReavaliacao.FieldByName('DEPGER').AsCurrency  := qryReavaliacao.FieldByName('DEPGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               29 : begin
                       qryReavaliacao.FieldByName('CMDEP').AsCurrency := qryReavaliacao.FieldByName('CMDEP').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
            end;
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryReavaliacao.Post;
         qryReavaliacao.Next
      end;
      qryReavaliacao.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na tabela ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         qryAcrescimo.Edit;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO, PLNCODIGO, IDTIPOMOVIMENTACAO, '+
                            '        VALOFI, VALFIS, VALGER '+
                            ' FROM HISTORICOMOVIMENTACAO HM '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ') ' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '   AND (IDREAVALACRESC = ' + qryAcrescimo.FieldByName('IDACRESCIMO').AsString + ') ' +
                            '   AND (IDTIPOMOVIMENTACAO IN (37,38,39,40)) ';
         qryAux.Open;
         while not qryAux.EOF do
         begin
            case qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               37 : begin
                       qryAcrescimo.FieldByName('VALORG').AsCurrency := qryAcrescimo.FieldByName('VALORG').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryAcrescimo.FieldByName('VALFIS').AsCurrency := qryAcrescimo.FieldByName('VALFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryAcrescimo.FieldByName('VALGER').AsCurrency := qryAcrescimo.FieldByName('VALGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               38 : begin
                       qryAcrescimo.FieldByName('CMBEM').AsCurrency := qryAcrescimo.FieldByName('CMBEM').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
               39 : begin
                       qryAcrescimo.FieldByName('DEPLANC').AsCurrency := qryAcrescimo.FieldByName('DEPLANC').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryAcrescimo.FieldByName('DEPFIS').AsCurrency := qryAcrescimo.FieldByName('DEPFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryAcrescimo.FieldByName('DEPGER').AsCurrency := qryAcrescimo.FieldByName('DEPGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               40 : begin
                       qryAcrescimo.FieldByName('CMDEP').AsCurrency := qryAcrescimo.FieldByName('CMDEP').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
            end;
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryAcrescimo.Post;
         qryAcrescimo.Next
      end;
      qryAcrescimo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // RETIRA O LINK DA PLANILHA CONTÁBIL
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                         ' SET PLNCODIGO = NULL '+
                         ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                         '                          FROM HISTORICOMOVIMENTACAO'+
                         '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                         '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '                            AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '                            AND (IDTIPOMOVIMENTACAO IN (06,25,24,26,20,28,27,29,37,38,39,40)))';
      qryAux.ExecSQL;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            if not RemovePlanContab(iEmpresaProp) then
            begin
               iResult := EstornaLanc(True, iPlnCodigo, 'BASEDADOS', datetostr(dDataEst),
                                      iExercicio, iPeriodo, iEmpresaProp, sMascara);
               if iResult = -1 then
               begin
                  MsgDlg('Estorno Baixa : Estorno da Contabilidade não Executado !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end else
            begin
               //-------------------------------------------------------------------------
               with dtmAtivoFixo.qryParamCaf do
               begin
                  if not Active then
                  begin
                     Close;
                     ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                     Open;
                  end;
                  //----------------------------------------------------------------------
                  iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                        FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                        Sistema.IdUsuario, True, 0, sMascara);
               end;
               if iResult = -1 then
               begin
                  MsgDlg('Estorno Baixa : Remoção da Planilha da Contabilidade não Executada !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end;
         end else
         begin
            iResult := -1;
            MsgDlg('Estorno Baixa : Estorno da Planilha Contábil ' + inttostr(iPlnCodigo) +
                   ' não Executado !', 'Erro', mtError, [mbOk], 0);
         end;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         //-------------------------------------------------------------------------------
         // Remove o Registro da Movimentacao
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO'+
                            ' FROM HISTORICOMOVIMENTACAO'+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (06,25,24,26,20,28,27,29,37,38,39,40))';
         qryAux.Open;
         while not qryAux.Eof do
         begin
            qryEstornaBaixaBem.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaBaixaBem.ExecSQL;
            qryAux.Next;
         end;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE '+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (06,25,24,26,20,28,27,29,37,38,39,40))';
         qryAux.ExecSQL;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,
                                    dDataMov,0,0,0,0,0,0,0,0,0,0,0,0,2) then
         Raise eExcessaoCAF.Create('EstornaBaixa : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      Result := iResult;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
// Função que executa a Passagem de um bem de Controle Físico para Controle Total
//----------------------------------------------------------------------------------------
//
// Parâmetros :
// Obs.: passar (-1) para os parâmetros numéricos não preenchidos (incluindo datas)
//
//    iModulo         - id do módulo responsável pela inclusão            (IDMODULO)
//    iEmpresaProp    - id da empresa proprietária                        (IDPESSOA)
//    iBem            - id do bem                                         (IDBEM)
//    fPlaca          - número de tombamento do bem                       (PLACA)
//    fValor          - valor de compra do bem                            (VALORG)
//    dDataIniDep     - data de compra do bem                             (DATAINICIODEP)
//    iSubConta       - Código de SubConta                                (CODSUBCONTA)
//
//    bMostraMsg : True  - mostra mensagens
//                 False - não mostra mensagens
//
//========================================================================================
function tAtivoFixo.ExecutaEntradaTotal(iModulo,iEmpresaProp,iBem : integer;
                                        dDataIniDep : tDateTime; fValor : double;
                                        iCodSubConta, iAtivProjeto : Integer;
                                        bMostraMsg : boolean) : Integer;

var
   iPlanoConta,iExercicio,iPeriodo,
   iSeqHist, iPlanilha,
   iaIdHistMov, iAux, iSubConta                      : Integer;
   sDebito, sDebitoCM, sCredito, sCreditoCM,
   sCCDebito, sCCDebitoCM, sCCCredito, sCCCreditoCM,
   sAtivProjeto, sMoeda, sDescBem, sRegistro,
   sMensagem                                         : String;
   fValFis, fValGer,fValOrg                          : Double;
   bTransacao                                        : Boolean;
   aIdHistMov                                        : array [1..4] of Integer;
   qryBem, qryAux                                    : TwwQuery;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;
   end;
   qryBem := TwwQuery(dtmAtivoFixo.qryBem);
   qryAux := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // Valida os parâmetros obrigatórios
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   if qryBem.isEmpty then
   begin
      if bMostraMsg then
      begin
         MsgDlg('Códigos da EMPRESA PROPRIETÁRIA e/ou do BEM inválidos ou não cadastrados!',
                'Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if iModulo <= 0 then
   begin
      if bMostraMsg then
      begin
         MsgDlg('É obrigatório fornecer o código do MODULO!',
                'Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end else
   begin
      if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
      begin
         if bMostraMsg then
         begin
            MsgDlg('Somente o módulo que cadastrou o bem pode movimenta-lo',
                   'Erro',mtError,[mbOk],0);
         end;
         result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if qryBem.FieldByName('CONTROLE').asString = 'T' then
   begin
      if bMostraMsg then
      begin
         MsgDlg('O bem já está com CONTROLE TOTAL pelo Ativo Fixo!',
                'Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end;
   sDescBem  := qryBem.FieldByName('DESBEM').asString;
   sRegistro := qryBem.FieldByName('REGISTRO').asString;
   //-------------------------------------------------------------------------------------
   if sRegistro = 'O' then
   begin
      if bMostraMsg then
      begin
         MsgDlg('O bem está registrado como IMOBILIZADO POR OBRA!',
                'Erro',mtError,[mbOk],0);
      end;
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if fValor <= 0 then
   begin
      if qryBem.FieldByName('VALORG').asFloat > 0 then
      begin
         fValOrg := qryBem.FieldByName('VALORG').asFloat;
      end else
      begin
         if bMostraMsg then
            MsgDlg('É obrigatório fornecer o VALOR DE AQUISIÇÃO do bem!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
   end else
   begin
      fValOrg := fValor;
   end;
   //-------------------------------------------------------------------------------------
   if dDataIniDep <= 0 then
   begin
      if bMostraMsg then
         MsgDlg('É obrigatório fornecer a DATA de INICIO da DEPRECIAÇÃO!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if iCodSubConta <= 0 then
   begin
      if not (qryBem.FieldByName('CODSUBCONTA').IsNull) then
      begin
         iSubConta := qryBem.FieldByName('CODSUBCONTA').AsInteger;
      end else
      begin
         iSubConta := 0;
      end;
   end else
   begin
      iSubConta := iCodSubConta;
   end;
   //-------------------------------------------------------------------------------------
   // Le os Parametros do CAF
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCAF do
   begin
      Close;
      ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      // Calcula os valores fornecidos em moeda fiscal e gerencial
      //----------------------------------------------------------------------------------
      fValFis := fValOrg / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                         dDataIniDep,
                                         bMostraMsg);
      fValGer := fValOrg / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                         dDataIniDep,
                                         bMostraMsg);
   end;
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
   begin
      bTransacao := False;
   end;
   //-------------------------------------------------------------------------------------
   iPlanilha := 0;
   try
      //----------------------------------------------------------------------------------
      // Registra a Entrada do Bem
      //----------------------------------------------------------------------------------
      if not RegistraEntradaTotal(iEmpresaProp,iBem,dDataIniDep,fValOrg,fValFis,fValGer,
                                  iSubConta,iAtivProjeto,bMostraMsg) then
         Raise eExcessaoCAF.Create('EntradaTotal : RegistraEntradaTotal');
      //----------------------------------------------------------------------------------
      // Remove o lançamento físico anterior
      //----------------------------------------------------------------------------------
      qryAux.SQL.Text := ' DELETE FROM HISTORICOMOVIMENTACAO '+
                         ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      qryAux.ExecSQL;
      qryAux.SQL.Text := ' DELETE FROM SALDOCONTABBEM '+
                         ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      qryAux.ExecSQL;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Entrada Total do Bem
      //----------------------------------------------------------------------------------
      iaIdHistMov := 0;
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 01, dDataIniDep, -1,
                                       fValOrg, fValFis, fValGer,
                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('EntradaTotal : RegistraMovimentacao (ValOrg)');
      inc(iaIdHistMov);
      aIdHistMov[iaIdHistMov] := iSeqHist;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo,iEmpresaProp,iBem,
                                    dDataIniDep,
                                    fValOrg,0,0,0,
                                    0,0,0,0,
                                    0,0,0,0,
                                    0) then
         Raise eExcessaoCAF.Create('ControleTotal : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if iAtivProjeto <= 0 then
         begin
            if qryBem.FieldByName('UNIDNEGOC').IsNull then
            begin
               with dtmAtivoFixo.qryParamCaf do
               begin
                  if not Active then
                  begin
                     ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
                     Open;
                  end;
                  if not IsEmpty then
                     sAtivProjeto := FieldByName('ATIVPROJETO').AsString
                  else
                     sAtivProjeto := '';
               end;
            end else
            begin
               sAtivProjeto := qryBem.FieldByName('UNIDNEGOC').AsString;
            end;
         end else
         begin
            sAtivProjeto := inttostr(iAtivProjeto);
         end;
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            if not qryMontaCtb.Prepared then
               qryMontaCtb.Prepare;

            if not qryGrupoCtb.Prepared then
               qryGrupoCtb.Prepare;

            if not qryConta.Prepared then
               qryConta.Prepare;

            if not qryCCrd.Prepared then
               qryCCrd.Prepare;

            if not qryPlanoConta.Prepared then
               qryPlanoConta.Prepare;

            if not qryHistCtb.Prepared then
               qryHistCtb.Prepare;

            qryMontaCtb.Open;
         end;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaEntrada(iModulo,iEmpresaProp,
                                         qryBem.FieldByName('IDGRUPO').AsInteger,
                                         qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                         iBem,dDataIniDep,fValOrg,0,0,0,sDescBem,
                                         sAtivProjeto,sRegistro,'E',iSubConta,
                                         qryBem.FieldByName('PLACA').AsString,
                                         bMostraMsg);
         if iPlanilha < 0 then
            Raise eExcessaoCAF.Create('EntradaTotal : ContabilizaEntrada');
         //-------------------------------------------------------------------------------
         if not VerificaPeriodoContabil(iEmpresaProp,dDataIniDep,iExercicio,iPeriodo,
                                        sMensagem,bMostraMsg) then
            Raise eExcessaoCAF.Create('EntradaTotal : VerificaPeriodoContabil');
         //-------------------------------------------------------------------------------
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                               dDataIniDep, sMensagem, bMostraMsg);
         if iPlanilha < 0 then
            Raise eExcessaoCAF.Create('EntradaTotal : RegistraPlanilhaContabil');
         dtmAtivoFixo.qryMontaCtb.Close;
         //-------------------------------------------------------------------------------
         // Registra no Historico a Planilha Gerada
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo.qryHistCtb do
         begin
            iAux := 1;
            while iAux <= iaIdHistMov do
            begin
               ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[iAux];
               ParamByName('PPLNCODIGO').AsInteger := iPlanilha;
               ExecSQL;
               inc(iAux);
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iPlanilha;
   except
      Result := -1;
      if bTransacao then
         RollBackTransacao;
      if bMostraMsg then
         Raise;
   end;
end;
//========================================================================================
function tAtivoFixo.RegistraEntradaTotal(iEmpresaProp,iBem : Integer;
                                         dDataIniDep : tDateTime;
                                         fValOrg,fValFis,fValGer : double;
                                         iSubConta, iAtivProjeto : Integer;
                                         bMostraMsg : boolean) : boolean;

begin
   try
      with dtmAtivoFixo.qryRegistraBemTotal do
      begin
         ParamByName('PIDBEM').asInteger          := iBem;                // IDBEM
         ParamByName('PIDPESSOA').asInteger       := iEmpresaProp;        // IDPESSOA
         ParamByName('PDATAINICIODEP').asDateTime := dDataIniDep;         // DATAINICIODEP
         ParamByName('PDATAULTDEP').asDateTime    := dDataIniDep;         // DATAFIMDEP
         ParamByName('PDATARECALCDEP').asDateTime := dDataIniDep;         // DATARECALCDEP
         ParamByName('PVALORG').asCurrency        := fValOrg;             // VALORG
         ParamByName('PVALHISTORICO').asCurrency  := fValOrg;             // VALHISTORICO
         ParamByName('PVALFIS').asCurrency        := fValFis;             // VALFIS
         ParamByName('PVALGER').asCurrency        := fValGer;             // VALGER
         ParamByName('PSUBCONTA').asInteger       := iSubConta;           // CODSUBCONTA
         ParamByName('PUNIDNEGOC').asInteger      := iAtivProjeto;        // UNIDNEGOC
         if iSubConta <= 0 then
            ParamByName('PSUBCONTA').Clear;
         if iAtivProjeto <= 0 then
            ParamByName('PUNIDNEGOC').Clear;
         //-------------------------------------------------------------------------------
         ExecSQL;
      end;
      Result := True;
   except
      Result := False;
   end;
end;
//========================================================================================
// Função que executa a Entrada de Bens no Ativo Fixo
//----------------------------------------------------------------------------------------
//
// Parâmetros :
// Obs.: passar (-1) para os parâmetros numéricos não preenchidos (incluindo datas)
//
//    iModulo         - id do módulo responsável pela inclusão            (IDMODULO)
//    iEmpresaProp    - id da empresa proprietária                        (IDPESSOA)
//    iConjunto       - id do conjunto ao qual o bem pertence             (IDCONJUNTO)
//    iTerceiro       - id da pessoa/empresa responsável pelo bem         (IDTERCEIRO)
//    iGrupo          - id do grupo                                       (IDGRUPO)
//    iSubConta       - id da subconta                                    (CODSUBCONTA)
//    iClasseBem      - id da classificacao do bem                        (IDCLASSEBEM)
//    iItensRecDev    - id do item da nota fiscal                         (IDITENSRECDEV)
//    iFornec         - id do fornecedor do bem                           (IDFORNSERV)
//    iImagem         - id da imagem do bem                               (IDIMAGEM)
//    fPlaca          - número de tombamento do bem                       (PLACA)
//    iSituacao       - id da situação patrimonial do bem                 (IDSITUACAO)
//    sRegistro       - código de registro do bem                         (REGISTRO)
//                      I - Entrada Normal
//                      O - Entrada de bem em/para Obra
//    sControle       - código de controle do bem pelo ativo fixo         (CONTROLE)
//                      T - Controle Total
//                      F - Controle Físico
//    sDescBem        - Descrição do Bem                                  (DESBEM)
//    sIdNota         - número da nota fiscal/documento de entrada        (IDNOTA)
//    sComplNota      - Complemento de nota fiscal                        (COMPLNOTA)
//    sNumSerie       - número de série do bem (fornecedor)               (NUMSERIE)
//    dDataNota       - Data da nota fiscal                               (DTANOTA)
//    dDataInclusao   - Data de inclusão do bem                           (DTAINCLUSAO)
//    fValHist        - valor do bem em moeda oficial na data da inclusao (VALHISTORICO)
//    fValOrg         - valor do bem na moeda oficial atual               (VALORG)
//    fCmBem          - valor da correção monetária do valor do bem       (CMBEM)
//    dDataIniDep     - data de inicio da depreciacao                     (DATAINICIODEP)
//    fValIniDep      - valor inicial da depreciacao acumulada            (VALDEPINI/DEPLANC)
//    fTaxaDep        - taxa de depreciacao anual                         (TAXADEP)
//    fCmDep          - correção monetária da depreciação                 (CMDEP)
//    fPropBaixa      - proporção do valor do bem já baixado              (PROPBAIXA)
//    fPrioridade     - Prioridade na execução de manutenção              (PRIORIDADE)
//    dDataInstalacao - Data da instalação do bem                         (DATAINSTALACAO)
//    dDataFimGar     - Data do fim da garantia do fabricante do bem      (DATAFIMGAR)
//    sIdOpcional     - Identificação Opcional do Bem                     (IDOPCIONAL)
//    fReavValOrg     - SALDO DAS REAVALIAÇÕES                            (VALORG)
//    fReavCmBem      - Correção monetária das reavaliações               (CMBEM)
//    fReavDepLanc    - Depreciacao acumulada das reavaliações            (DEPLANC)
//    fReavCmDep      - Corr. monet.da deprec. acumulada da reavaliação   (CMDEP)
//    sReavTaxaDep    - Taxa de Depreciação da Reavaliação                (TAXADEP)
//    dReavData       - Data da ultima reavaliação                        (DATAREAVALIACAO)
//    sReavObs        - Observação da ultima reavaliacao                  (OBS)
//    fUltReavValOrg  - ULTIMA REAVALIAÇÃO REALIZADA                      (VALORG)
//    fUltReavCmBem   - Correção monetária das reavaliações               (CMBEM)
//    fUltReavDepLanc - Depreciacao acumulada das reavaliações            (DEPLANC)
//    fUltReavCmDep   - Corr. monet.da deprec. acumulada da reavaliação   (CMDEP)
//    sUltReavTaxaDep - Taxa de Depreciação da Reavaliação                (TAXADEP)
//    dUltReavData    - Data da ultima reavaliação                        (DATAREAVALIACAO)
//    sUltReavObs     - Observação da ultima reavaliacao                  (OBS)
//
//    bMostraMsg : True  - mostra mensagens
//                 False - não mostra mensagens
//
//========================================================================================
function tAtivoFixo.ExecutaEntradaBem(iIdBemAlt : Integer;iModulo,iEmpresaProp,iConjunto,iTerceiro,iGrupo,
         iSubConta,iAtivProjeto,iClasseBem,iItensRecDev,iFornec,iImagem : integer; sPlaca : String;
         iSituacao : integer; sRegistro,sControle,sDescBem,sIdNota,sComplNota,
         sNumSerie : string; dDataNota,dDataInclusao : tDateTime; fValHist,fValOrg,
         fCmBem : double; dDataIniDep : tDateTime; fValIniDep,fTaxaDep,fDepLanc,fCmDep,
         fPropBaixa,fPrioridade : double;dDataInstalacao,dDataFimGar : tDateTime;
         fReavValOrg,fReavCmBem,fReavDepLanc,fReavCmDep : double; sReavTaxaDep : String;
         dReavData : tDateTime; sReavObs : String; fUltReavValOrg,fUltReavCmBem,
         fUltReavDepLanc, fUltReavCmDep : double; sUltReavTaxaDep : String;
         dUltReavData : tDateTime; sUltReavObs, sIdOpcional,
         sProcessoAquis, sEmpenhoAquis, sPubAutor, sPubEditora, sPubAno : String;
         bMostraMsg : boolean; iQuantidade : Integer) : Boolean;
var
   fPlacaAtual, fpValHist, fpValIniDep,
   fpValOrg, fpCmBem, fpDepLanc, fpCmDep,
   fpReavValOrg, fpReavCmBem,
   fpReavDepLanc, fpReavCmDep,
   fpUltReavValOrg, fpUltReavCmBem,
   fpUltReavDepLanc, fpUltReavCmDep : Extended;
   iIdBem, iPlanilha, iQtd          : Integer;
   bTransacao                       : boolean;
   ipValHist                        : Integer;
   qryAux                           : TwwQuery;
   sDigMascPlaca                    : String;

begin
   qryAux := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   if (iQuantidade <= 0) then
   begin
      if bMostraMsg then
         MsgDlg('É obrigatório fornecer a quantidade de bens!',
                'Erro',mtError,[mbOk],0);
      result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Executa a proporção
   //-------------------------------------------------------------------------------------
   fpValHist        := (fValHist        / iQuantidade);
   fpValIniDep      := (fValIniDep      / iQuantidade);
   fpValOrg         := (fValOrg         / iQuantidade);
   fpCmBem          := (fCmBem          / iQuantidade);
   fpDepLanc        := (fDepLanc        / iQuantidade);
   fpCmDep          := (fCmDep          / iQuantidade);
   fpReavValOrg     := (fReavValOrg     / iQuantidade);
   fpReavCmBem      := (fReavCmBem      / iQuantidade);
   fpReavDepLanc    := (fReavDepLanc    / iQuantidade);
   fpReavCmDep      := (fReavCmDep      / iQuantidade);
   fpUltReavValOrg  := (fUltReavValOrg  / iQuantidade);
   fpUltReavCmBem   := (fUltReavCmBem   / iQuantidade);
   fpUltReavDepLanc := (fUltReavDepLanc / iQuantidade);
   fpUltReavCmDep   := (fUltReavCmDep   / iQuantidade);
   if (sPlaca <> '') then
   begin
      fPlacaAtual := strtofloat(sPlaca);
      if (iQuantidade > 1) then
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT DIGMASCPLACA '+
                        ' FROM PARAMETROSCAFMANUT '+
                        ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         qryAux.Open;
         sDigMascPlaca := StringOfChar('0',qryAux.FieldByName('DIGMASCPLACA').AsInteger);
         //-------------------------------------------------------------------------------
         fPlacaAtual := strtofloat(floattostr(fPlacaAtual) + sDigMascPlaca);
      end;
   end else
      fPlacaAtual := 0;
   //-------------------------------------------------------------------------------------
   // Arredonda os valores
   //-------------------------------------------------------------------------------------
   fpValHist        := strtofloat(FormatFloat('###########0.00',((fpValHist        * 100) / 100)));
   fpValIniDep      := strtofloat(FormatFloat('###########0.00',((fpValIniDep      * 100) / 100)));
   fpValOrg         := strtofloat(FormatFloat('###########0.00',((fpValOrg         * 100) / 100)));
   fpCmBem          := strtofloat(FormatFloat('###########0.00',((fpCmBem          * 100) / 100)));
   fpDepLanc        := strtofloat(FormatFloat('###########0.00',((fpDepLanc        * 100) / 100)));
   fpCmDep          := strtofloat(FormatFloat('###########0.00',((fpCmDep          * 100) / 100)));
   fpReavValOrg     := strtofloat(FormatFloat('###########0.00',((fpReavValOrg     * 100) / 100)));
   fpReavCmBem      := strtofloat(FormatFloat('###########0.00',((fpReavCmBem      * 100) / 100)));
   fpReavDepLanc    := strtofloat(FormatFloat('###########0.00',((fpReavDepLanc    * 100) / 100)));
   fpReavCmDep      := strtofloat(FormatFloat('###########0.00',((fpReavCmDep      * 100) / 100)));
   fpUltReavValOrg  := strtofloat(FormatFloat('###########0.00',((fpUltReavValOrg  * 100) / 100)));
   fpUltReavCmBem   := strtofloat(FormatFloat('###########0.00',((fpUltReavCmBem   * 100) / 100)));
   fpUltReavDepLanc := strtofloat(FormatFloat('###########0.00',((fpUltReavDepLanc * 100) / 100)));
   fpUltReavCmDep   := strtofloat(FormatFloat('###########0.00',((fpUltReavCmDep   * 100) / 100)));
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
   begin
      bTransacao := False;
   end;
   //-------------------------------------------------------------------------------------
   try
      iPlanilha := 0;
      iQtd := 1;
      while (iQtd <= iQuantidade) do
      begin
         iIdBem := ExecutaEntrada(iIdBemAlt, iModulo, iEmpresaProp, iConjunto, iTerceiro,
                   iGrupo, iSubConta, iAtivProjeto, iClasseBem, iItensRecDev, iFornec,
                   iImagem, fPlacaAtual, iSituacao, sRegistro, sControle, sDescBem,
                   sIdNota, sComplNota, sNumSerie, dDataNota, dDataInclusao, fpValHist,
                   fpValOrg, fpCmBem, dDataIniDep, fpValIniDep, fTaxaDep, fpDepLanc,
                   fpCmDep, fPropBaixa, fPrioridade, dDataInstalacao, dDataFimGar,
                   fpReavValOrg, fpReavCmBem, fpReavDepLanc, fpReavCmDep, sReavTaxaDep,
                   dReavData, sReavObs, fpUltReavValOrg, fpUltReavCmBem, fpUltReavDepLanc,
                   fpUltReavCmDep, sUltReavTaxaDep, dUltReavData, sUltReavObs, sIdOpcional,
                   sProcessoAquis, sEmpenhoAquis, sPubAutor, sPubEditora, sPubAno,
                   iPlanilha, bMostraMsg);
         //-------------------------------------------------------------------------------
         if (iIdBem <= 0) or (iPlanilha < 0) then
            Raise eExcessaoCAF.Create('ExecutaEntradaBem : ExecutaEntrada');
         //-------------------------------------------------------------------------------
         iQtd := iQtd + 1;
         //-------------------------------------------------------------------------------
         if (iQtd <= iQuantidade) then
         begin
            if (sPlaca <> '') then
               fPlacaAtual := GeraProxPlacaTomb(iEmpresaProp, iGrupo, iClasseBem, fPlacaAtual);
         end;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := True;
   except
      Result := False;
      if bTransacao then
         RollBackTransacao;
      if bMostraMsg then
         Raise;
   end;
end;
//========================================================================================
// Função que executa o estorno da Entrada de um Bem no Ativo Fixo
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function tAtivoFixo.EstornaEntrada(iModulo, iEmpresaProp, iBem : Integer;
                                   dDataMov, dDataEst : tDate;
                                   bFlgContab, bMostraMsg : boolean) : Integer;
var
   iResult,
   iExercicio,iPeriodo           : Integer;
   sMascara,sMensagem            : String;
   qryAux                        : TwwQuery;
   bTransacao, bRemovePlanContab : Boolean;
   aPlanilha                     : array [1..12] of Integer;
   aDataMov                      : array [1..12] of tDateTime;
   iTotPlan, iPlan               : Integer;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryReavaliacao.Prepared then
         qryReavaliacao.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryAux := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após sua entrada
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                      ' FROM   HISTORICOMOVIMENTACAO ' +
                      ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                      '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                      '   AND (IDTIPOMOVIMENTACAO <> 1)   /* ENTRADA TOTAL                                      */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 3)   /* ENTRADA FISICA                                     */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 17)  /* INCLUSAO DE DEPRECIACAO                            */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 15)  /* CORRECAO MONETARIA                                 */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 21)  /* CORRECAO MONETARIA DA DEPRECIACAO                  */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 32)  /* INCLUSAO DO SALDO DE REAVALIACAO                   */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 33)  /* INCLUSAO DA DEPRECIACAO DO SALDO DE REAVALIACAO    */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 22)  /* CORRECAO MONETARIA DA REAVALIACAO                  */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 19)  /* CORRECAO MONETARIA DA DEPRECIACAO DA REAVALIACAO   */';
   qryAux.Open;
   if not qryAux.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Existe movimentação após a Entrada. Consulte Movimentação!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) and (bFlgContab) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,DATAMOVIMENTACAO,PLNCODIGO '+
                               ' FROM   HISTORICOMOVIMENTACAO '+
                               ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ') '+
                               '   AND (IDBEM    = ' + inttostr(iBem) + ') ';
            qryAux.Open;
            iTotPlan := 0;
            while not qryAux.EOF do
            begin
               iTotPlan := iTotPlan + 1;
               if not ((qryAux.FieldByName('PLNCODIGO').AsInteger <= 0) or
                       (qryAux.FieldByName('PLNCODIGO').IsNull)) then
               begin
                  aPlanilha[iTotPlan] := qryAux.FieldByName('PLNCODIGO').AsInteger;
                  aDataMov[iTotPlan]  := qryAux.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               end;
               qryAux.Next;
            end;
            //----------------------------------------------------------------------------
            // RETIRA O LINK DA PLANILHA CONTÁBIL
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET PLNCODIGO = NULL '+
                               ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                               '                          FROM HISTORICOMOVIMENTACAO'+
                               '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                               '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + '))';
            qryAux.ExecSQL;
            //----------------------------------------------------------------------------
            bRemovePlanContab := RemovePlanContab(iEmpresaProp);
            //----------------------------------------------------------------------------
            iPlan := 1;
            while (iPlan <= iTotPlan) do
            begin
               if not bRemovePlanContab then
               begin
                  iResult := EstornaLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                             datetostr(aDataMov[iPlan]), iExercicio, iPeriodo,
                             iEmpresaProp, sMascara);
                  if (iResult = -1) then
                  begin
                     MsgDlg('Estorno Entrada : Estorno da Contabilidade não Executado !',
                            'Erro', mtError, [mbOk], 0);
                  end;
               end else
               begin
                  with dtmAtivoFixo.qryParamCaf do
                  begin
                     if not Active then
                     begin
                        Close;
                        ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                        Open;
                     end;
                     //-------------------------------------------------------------------
                     iResult := ExcluiLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                                           inttostr(Sistema.IdModulo),
                                           FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                           Sistema.IdUsuario, True, 0, sMascara);
                  end;
                  //----------------------------------------------------------------------
                  if (iResult = -1) then
                  begin
                     MsgDlg('Estorno Entrada : Remoção da Planilha da Contabilidade não Executada !',
                            'Erro', mtError, [mbOk], 0);
                  end;
               end;
               iPlan := iPlan + 1;
            end;
         end else
         begin
            MsgDlg('Estorno das Planilhas Contábeis não Executado !',
                   'Erro', mtError, [mbOk], 0);
         end;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         //-------------------------------------------------------------------------------
         // Remove as Reavaliacoes Iniciais, se houverem
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                            ' FROM   HISTORICOMOVIMENTACAO ' +
                            ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDTIPOMOVIMENTACAO = 32)  /* INCLUSAO DO SALDO DE REAVALIACAO */';
         qryAux.Open;
         while not qryAux.Eof do
         begin
            qryEstornaReavaliacao.ParamByName('PIDPESSOA').AsInteger       := iEmpresaProp;
            qryEstornaReavaliacao.ParamByName('PIDBEM').AsInteger          := iBem;
            qryEstornaReavaliacao.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaReavaliacao.ExecSQL;
            qryAux.Next;
         end;
         //-------------------------------------------------------------------------------
         // Remove os Registros de Movimentacao Inicial do Bem
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                            ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         // Remove o Bem
         //-------------------------------------------------------------------------------
         qryEstornaBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qryEstornaBem.ParamByName('PIDBEM').AsInteger    := iBem;
         qryEstornaBem.ExecSQL;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,
                                    dDataMov,0,0,0,0,0,0,0,0,0,0,0,0,2) then
         Raise eExcessaoCAF.Create('EstornaEntrada : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      Result := 1;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
// Função que executa o estorno do Acréscimo de Valor em um Bem
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
// iAcrescimo   : id do Acréscimo a ser removido                    (IDACRESCIMO)
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function tAtivoFixo.EstornaAcrescimo(iModulo, iEmpresaProp, iBem : Integer;
                                     dDataMov, dDataEst : tDate;
                                     iAcrescimo : Integer;
                                     bMostraMsg : boolean) : Integer;
const
   iTipoMovimentacao = 9;           // Codigo de Reavaliacao de Bem

var
   iIdMovimentacao, iPlnCodigo, iResult,
   iExercicio,iPeriodo                                 : Integer;
   sMascara,sMensagem                                  : String;
   qryAux,qryBem,qryAcrescimo,qryUltMov                : TwwQuery;
   bTransacao                                          : Boolean;

begin
   with dtmAtivoFixo do
   begin
      if not qryUltMov.Prepared then
         qryUltMov.Prepare;

      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryAcrescimo.Prepared then
         qryAcrescimo.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após o Acréscimo
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
   begin
      if bMostraMsg then
         MsgDlg('Existe movimentação após o acréscimo. Consulte Movimentação!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //----------------------------------------------------------------------------------
   // Posiciona a Tabela BEM
   //----------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   if qryBem.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Posiciona a Tabela ACRESCIMOVALOR
   //-------------------------------------------------------------------------------------
   qryAcrescimo.Close;
   qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
   qryAcrescimo.Open;
   if qryAcrescimo.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('Não existe acréscimo de valor registrado para esse Bem!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   if not (qryAcrescimo.Locate('IDMOVIMENTACAO',iAcrescimo,[])) then
   begin
      if bMostraMsg then
         MsgDlg('Código de movimentação de acréscimo de valor inválido para esse Bem!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   iIdMovimentacao := iAcrescimo;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT PLNCODIGO'+
                         ' FROM HISTORICOMOVIMENTACAO '+
                         ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (IDTIPOMOVIMENTACAO = 09)';
      qryAux.Open;
      if not qryAux.FieldByName('PLNCODIGO').IsNull then
      begin
         iPlnCodigo := qryAux.FieldByName('PLNCODIGO').AsInteger;
      end else
      begin
         iPlnCodigo := 0;
      end;
      //----------------------------------------------------------------------------------
      // RETIRA O LINK DA PLANILHA CONTÁBIL
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                         ' SET PLNCODIGO = NULL '+
                         ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                         '                          FROM HISTORICOMOVIMENTACAO'+
                         '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                         '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '                            AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '                            AND (IDTIPOMOVIMENTACAO = 09))';
      qryAux.ExecSQL;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            if not RemovePlanContab(iEmpresaProp) then
            begin
               iResult := EstornaLanc(True, iPlnCodigo, 'BASEDADOS', datetostr(dDataEst),
                                      iExercicio, iPeriodo, iEmpresaProp, sMascara);
               if iResult = -1 then
               begin
                  MsgDlg('Estorno Acréscimo : Estorno da Contabilidade não Executado !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end else
            begin
               //-------------------------------------------------------------------------
               with dtmAtivoFixo.qryParamCaf do
               begin
                  if not Active then
                  begin
                     Close;
                     ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                     Open;
                  end;
                  //----------------------------------------------------------------------
                  iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                        FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                        Sistema.IdUsuario, True, 0, sMascara);
               end;
               if iResult = -1 then
               begin
                  MsgDlg('Estorno Acréscimo : Remoção da Planilha da Contabilidade não Executada !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end;
         end else
         begin
            MsgDlg('Estorno Acréscimo : Estorno da Planilha Contábil ' + inttostr(iPlnCodigo) +
                   ' não Executado !', 'Erro', mtError, [mbOk], 0);
         end;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         //-------------------------------------------------------------------------------
         // Remove o Acrescimo
         //-------------------------------------------------------------------------------
         qryEstornaAcrescimo.ParamByName('PIDPESSOA').AsInteger       := iEmpresaProp;
         qryEstornaAcrescimo.ParamByName('PIDBEM').AsInteger          := iBem;
         qryEstornaAcrescimo.ParamByName('PIDMOVIMENTACAO').AsInteger := iIdMovimentacao;
         qryEstornaAcrescimo.ExecSQL;
         //-------------------------------------------------------------------------------
         // Remove o Registro da Movimentacao
         //-------------------------------------------------------------------------------
         qryEstornaAcrescValor.ParamByName('PIDMOVIMENTACAO').AsInteger := iIdMovimentacao;
         qryEstornaAcrescValor.ExecSQL;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDMOVIMENTACAO = ' + inttostr(iIdMovimentacao) + ')';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,
                                    dDataMov,0,0,0,0,0,0,0,0,0,0,0,0,2) then
         Raise eExcessaoCAF.Create('EstornaReavaliação : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      Result := 1;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
// Função que executa a Entrada de um Bem no Ativo Fixo
//----------------------------------------------------------------------------------------
//
// Parâmetros :
// Obs.: passar (-1) para os parâmetros numéricos não preenchidos (incluindo datas)
//
//    iModulo         - id do módulo responsável pela inclusão            (IDMODULO)
//    iEmpresaProp    - id da empresa proprietária                        (IDPESSOA)
//    iConjunto       - id do conjunto ao qual o bem pertence             (IDCONJUNTO)
//    iTerceiro       - id da pessoa/empresa responsável pelo bem         (IDTERCEIRO)
//    iGrupo          - id do grupo                                       (IDGRUPO)
//    iSubConta       - id da subconta                                    (CODSUBCONTA)
//    iAtivProjeto    - id da Atividade/Projeto associada ao bem          (UNIDNEGOC)     
//    iClasseBem      - id da classificacao do bem                        (IDCLASSEBEM)
//    iItensRecDev    - id do item da nota fiscal                         (IDITENSRECDEV)
//    iFornec         - id do fornecedor do bem                           (IDFORNSERV)
//    iImagem         - id da imagem do bem                               (IDIMAGEM)
//    fPlaca          - número de tombamento do bem                       (PLACA)
//    iSituacao       - id da situação patrimonial do bem                 (IDSITUACAO)
//    sRegistro       - código de registro do bem                         (REGISTRO)
//                      I - Entrada Normal
//                      O - Entrada de bem em/para Obra
//    sControle       - código de controle do bem pelo ativo fixo         (CONTROLE)
//                      T - Controle Total
//                      F - Controle Físico
//    sDescBem        - Descrição do Bem                                  (DESBEM)
//    sIdNota         - número da nota fiscal/documento de entrada        (IDNOTA)
//    sComplNota      - Complemento de nota fiscal                        (COMPLNOTA)
//    sNumSerie       - número de série do bem (fornecedor)               (NUMSERIE)
//    dDataNota       - Data da nota fiscal                               (DTANOTA)
//    dDataInclusao   - Data de inclusão do bem                           (DTAINCLUSAO)
//    fValHist        - valor do bem em moeda oficial na data da inclusao (VALHISTORICO)
//    fValOrg         - valor do bem na moeda oficial atual               (VALORG)
//    fCmBem          - valor da correção monetária do valor do bem       (CMBEM)
//    dDataIniDep     - data de inicio da depreciacao                     (DATAINICIODEP)
//    fValIniDep      - valor inicial da depreciacao acumulada            (VALDEPINI/DEPLANC)
//    fTaxaDep        - taxa de depreciacao anual                         (TAXADEP)
//    fCmDep          - correção monetária da depreciação                 (CMDEP)
//    fPropBaixa      - proporção do valor do bem já baixado              (PROPBAIXA)
//    fPrioridade     - Prioridade na execução de manutenção              (PRIORIDADE)
//    dDataInstalacao - Data da instalação do bem                         (DATAINSTALACAO)
//    dDataFimGar     - Data do fim da garantia do fabricante do bem      (DATAFIMGAR)
//    sIdOpcional     - Identificação Opcional do Bem                     (IDOPCIONAL)
//    fReavValOrg     - SALDO DAS REAVALIAÇÕES                            (VALORG)
//    fReavCmBem      - Correção monetária das reavaliações               (CMBEM)
//    fReavDepLanc    - Depreciacao acumulada das reavaliações            (DEPLANC)
//    fReavCmDep      - Corr. monet.da deprec. acumulada da reavaliação   (CMDEP)
//    sReavTaxaDep    - Taxa de Depreciação da Reavaliação                (TAXADEP)
//    dReavData       - Data da ultima reavaliação                        (DATAREAVALIACAO)
//    sReavObs        - Observação da ultima reavaliacao                  (OBS)
//    fUltReavValOrg  - ULTIMA REAVALIAÇÃO REALIZADA                      (VALORG)
//    fUltReavCmBem   - Correção monetária das reavaliações               (CMBEM)
//    fUltReavDepLanc - Depreciacao acumulada das reavaliações            (DEPLANC)
//    fUltReavCmDep   - Corr. monet.da deprec. acumulada da reavaliação   (CMDEP)
//    sUltReavTaxaDep - Taxa de Depreciação da Reavaliação                (TAXADEP)
//    dUltReavData    - Data da ultima reavaliação                        (DATAREAVALIACAO)
//    sUltReavObs     - Observação da ultima reavaliacao                  (OBS)
//
//    bMostraMsg : True  - mostra mensagens
//                 False - não mostra mensagens
//
//========================================================================================
function tAtivoFixo.ExecutaEntrada(iIdBemAlt : Integer;iModulo,iEmpresaProp,iConjunto,iTerceiro,iGrupo,
         iSubConta,iAtivProjeto,iClasseBem,iItensRecDev,iFornec,iImagem : integer; fPlaca : double;
         iSituacao : integer; sRegistro,sControle,sDescBem,sIdNota,sComplNota,
         sNumSerie : string; dDataNota,dDataInclusao : tDateTime; fValHist,fValOrg,
         fCmBem : double; dDataIniDep : tDateTime; fValIniDep,fTaxaDep,fDepLanc,fCmDep,
         fPropBaixa,fPrioridade : double;dDataInstalacao,dDataFimGar : tDateTime;
         fReavValOrg,fReavCmBem,fReavDepLanc,fReavCmDep : double; sReavTaxaDep : String;
         dReavData : tDateTime; sReavObs : String; fUltReavValOrg,fUltReavCmBem,
         fUltReavDepLanc, fUltReavCmDep : double; sUltReavTaxaDep : String;
         dUltReavData : tDateTime; sUltReavObs, sIdOpcional,
         sProcessoAquis, sEmpenhoAquis, sPubAutor, sPubEditora, sPubAno : String;
         Var iPlanilha : Integer; bMostraMsg : boolean) : Integer;

var
   iPlanoConta,iExercicio,iPeriodo,
   iSeqHist, iIdReavaliacao, iIdUltReavaliacao,
   iPlanResult, iIdBem, iTipoMovimentacao,
   iaIdHistMov, iAux                                 : Integer;
   sDebito, sDebitoCM, sCredito, sCreditoCM,
   sCCDebito, sCCDebitoCM, sCCCredito, sCCCreditoCM,
   sAtivProjeto, sMoeda, sBaixaTotal, sMensagem      : String;
   fValFis, fValGer, fDepFis, fDepGer,
   fReavValFis, fReavValGer,
   fReavDepFis, fReavDepGer,
   fUltReavValFis, fUltReavValGer,
   fUltReavDepFis, fUltReavDepGer                    : Double;
   bTransacao                                        : Boolean;
   aIdHistMov                                        : array [1..4] of Integer;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;

      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;

      if not qryGrupos.Prepared then
         qryGrupos.Prepare;

      if not qryConjunto.Prepared then
         qryConjunto.Prepare;

      if not qryPessoa.Prepared then
         qryPessoa.Prepare;

      if not qryClasseBem.Prepared then
         qryClasseBem.Prepare;

      if not qrySubConta.Prepared then
         qrySubConta.Prepare;

      if not qryPlaca.Prepared then
         qryPlaca.Prepare;

      if not qrySituacao.Prepared then
         qrySituacao.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   // Valida os parâmetros obrigatórios para entrada de bens
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo do
   begin
      if (sRegistro = '') then
      begin
         if bMostraMsg then
            MsgDlg('É obrigatório fornecer o Código de Registro do bem!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end else
      begin
         if not ((sRegistro = 'I') or (sRegistro = 'O')) then
         begin
            if bMostraMsg then
               MsgDlg('Código de Registro do Bem inválido!',
                      'Erro',mtError,[mbOk],0);
            result := -1;
            exit;
         end;
      end;
      if (sRegistro = 'O') then
      begin
         sControle := 'F';
      end;
      //----------------------------------------------------------------------------------
      if (sControle = '') then
      begin
         if bMostraMsg then
            MsgDlg('É obrigatório fornecer o Código de Controle do bem!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end else
      begin
         if not ((sControle = 'T') or (sControle = 'F')) then
         begin
            if bMostraMsg then
               MsgDlg('Código de Controle do Bem inválido!',
                      'Erro',mtError,[mbOk],0);
            result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (iModulo <= 0) then
      begin
         if bMostraMsg then
         begin
            MsgDlg('É obrigatório fornecer o código do MODULO!',
                   'Erro',mtError,[mbOk],0);
         end;
         result := -1;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (iEmpresaProp <= 0) then
      begin
         if bMostraMsg then
         begin
            MsgDlg('É obrigatório fornecer o código da EMPRESA PROPRIETÁRIA!',
                   'Erro',mtError,[mbOk],0);
         end;
         result := -1;
         exit;
      end else
      begin
         qryPessoa.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qryPessoa.Open;
         if qryPessoa.isEmpty then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Código da EMPRESA PROPRIETÁRIA inválido ou não cadastrado!',
                      'Erro',mtError,[mbOk],0);
            end;
            result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (iConjunto <= 0) then
      begin
         if bMostraMsg then
         begin
            MsgDlg('É obrigatório fornecer o código do CONJUNTO do bem!',
                   'Erro',mtError,[mbOk],0);
         end;
         result := -1;
         exit;
      end else
      begin
         qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
         qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
         qryConjunto.Open;
         if qryConjunto.isEmpty then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Código do CONJUNTO do bem inexistente ou inválido!',
                      'Erro',mtError,[mbOk],0);
            end;
            result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (iGrupo <= 0) then
      begin
         if bMostraMsg then
         begin
            MsgDlg('É obrigatório fornecer o código do GRUPO do bem!',
                   'Erro',mtError,[mbOk],0);
         end;
         result := -1;
         exit;
      end else
      begin
         qryGrupos.ParamByName('PIDGRUPO').AsInteger := iGrupo;
         qryGrupos.Open;
         if qryGrupos.isEmpty then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Código do GRUPO do bem inexistente ou inválido!',
                      'Erro',mtError,[mbOk],0);
            end;
            result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (iClasseBem <= 0) then
      begin
         if bMostraMsg then
         begin
            MsgDlg('É obrigatório fornecer o código da CLASSE do bem!',
                   'Erro',mtError,[mbOk],0);
         end;
         result := -1;
         exit;
      end else
      begin
         qryClasseBem.ParamByName('PIDCLASSEBEM').AsInteger := iClasseBem;
         qryClasseBem.Open;
         if qryClasseBem.isEmpty then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Código de CLASSE de bem inexistente ou inválido!',
                      'Erro',mtError,[mbOk],0);
            end;
            result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (iSubConta > 0) then
      begin
         qrySubConta.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
         qrySubConta.ParamByName('PIDSUBCONTA').AsInteger := iSubConta;
         qrySubConta.Open;
         if qrySubConta.isEmpty then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Código de SubConta inexistente ou inválido!',
                      'Erro',mtError,[mbOk],0);
            end;
            result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (iFornec > 0) then
      begin
         qryPessoa.ParamByName('PIDPESSOA').AsInteger := iFornec;
         qryPessoa.Open;
         if qryPessoa.isEmpty then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Código do FORNECEDOR inválido ou não cadastrado!',
                      'Erro',mtError,[mbOk],0);
            end;
            result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fPlaca <= 0) then
      begin
         if (qryGrupos.FieldByName('FLGSEMPLACA').AsInteger = 0) then
         begin
            if bMostraMsg then
               MsgDlg('É obrigatório fornecer o Número de TOMBAMENTO do bem!',
                      'Erro',mtError,[mbOk],0);
            result := -1;
            exit;
         end;
      end else
      begin
         qryPlaca.ParamByName('PIDPLACA').AsFloat := fPlaca;
         qryPlaca.Open;
         if not qryPlaca.isEmpty then
         begin
            if bMostraMsg then
               MsgDlg('Número de TOMBAMENTO já alocado a outro Bem ('+qryPlaca.FieldByName('IDBEM').AsString + ' '
                       + ' - ' + qryPlaca.FieldByName('DESBEM').AsString + ')!',
                      'Erro',mtError,[mbOk],0);
            result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (iSituacao <= 0) then
      begin
         if bMostraMsg then
            MsgDlg('É obrigatório fornecer a ID da SITUAÇÃO do bem!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end else
      begin
         qrySituacao.ParamByName('PIDSITUACAO').AsInteger := iSituacao;
         qrySituacao.Open;
         if qrySituacao.isEmpty then
         begin
            if bMostraMsg then
               MsgDlg('ID da SITUAÇÃO do bem inválido ou inexistente!',
                      'Erro',mtError,[mbOk],0);
            result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (sDescBem = '') then
      begin
         if bMostraMsg then
            MsgDlg('É obrigatório fornecer a DESCRIÇÃO do bem!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (fValOrg = 0) then
      begin
         if bMostraMsg then
            MsgDlg('O VALOR DE AQUISIÇÃO do bem está Zerado!',
                   'Atenção',mtInformation,[mbOk],0);
      end;
      //----------------------------------------------------------------------------------
      sBaixaTotal := 'N';
      if (fPropBaixa <> -1) then
      begin
         if not ((fPropBaixa >= 0) and (fPropBaixa <= 100)) then
         begin
            if bMostraMsg then
               MsgDlg('Proporção da Baixa Inválida!','Erro',mtError,[mbOk],0);
            result := -1;
            exit;
         end else
         begin
            if fPropBaixa = 100 then
            begin
               sBaixaTotal := 'S';
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ((fValIniDep + fCmDep) > (fValOrg + fCmBem)) then
      begin
         if bMostraMsg then
            MsgDlg('Valor da depreciação inicial não pode ser maior que valor de aquisição !',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Verificações relativas a reavaliação (se houver)
      //----------------------------------------------------------------------------------
      if ((fReavValOrg <> 0) or (fReavDepLanc <> 0)) and (dReavData <= 0) then
      begin
         if bMostraMsg then
            msgdlg('A data da última reavaliação do bem deve ser fornecida!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Le a Unidade de Negocio da Tabela de Parametros Globais
   //-------------------------------------------------------------------------------------
   if (iAtivProjeto <= 0) then
   begin
      with dtmAtivoFixo.qryParamCAF do
      begin
         ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
         Open;
         if not IsEmpty then
            sAtivProjeto := FieldByName('ATIVPROJETO').AsString
         else
            sAtivProjeto := '';
         Close;
      end;
   end else
   begin
      sAtivProjeto := inttostr(iAtivProjeto);
   end;
   //-------------------------------------------------------------------------------------
   // Le os Parametros do CAF
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCAF do
   begin
      Close;
      ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      // Calcula os valores fornecidos em moeda fiscal e gerencial
      //----------------------------------------------------------------------------------
      fValFis := fValOrg / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                         dDataInclusao,
                                         bMostraMsg);
      fValGer := fValOrg / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                         dDataInclusao,
                                         bMostraMsg);
      fDepFis := fValIniDep / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                            dDataInclusao,
                                            bMostraMsg);
      fDepGer := fValIniDep / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                            dDataInclusao,
                                            bMostraMsg);
   end;
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
   begin
      bTransacao := False;
   end;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Registra a Entrada do Bem
      //----------------------------------------------------------------------------------
      iIdBem := RegistraEntrada(iIdBemAlt,iModulo,iEmpresaProp,iConjunto,iTerceiro,iGrupo,iSubConta,
                iAtivProjeto,iClasseBem,iItensRecDev,iFornec,iImagem,fPlaca,iSituacao,
                sRegistro,sControle,sDescBem,sIdNota,sComplNota,sNumSerie,dDataNota,
                dDataInclusao,fValHist,fValOrg,fCmBem,dDataIniDep,fValIniDep,fTaxaDep,
                fDepLanc,fCmDep,fPropBaixa,fPrioridade,dDataInstalacao,dDataFimGar,fValFis,
                fValGer,fDepFis,fDepGer,sBaixaTotal,sIdOpcional,sProcessoAquis,
                sEmpenhoAquis,sPubAutor,sPubEditora,sPubAno, bMostraMsg);
      if iIdBem = -1 then
         Raise eExcessaoCAF.Create('Entrada : RegistraBem');
      //----------------------------------------------------------------------------------
      // Registra o Historico da Entrada do Bem
      //----------------------------------------------------------------------------------
      iaIdHistMov := 0;
      if (sControle = 'T') then
      begin
         iTipoMovimentacao := 01;
      end else
      begin
         iTipoMovimentacao := 03;
      end;
      iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                       dDataInclusao, -1,
                                       fValOrg, fValFis, fValGer,
                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
      if (iSeqHist = -1) then
         Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ValOrg)');
      inc(iaIdHistMov);
      aIdHistMov[iaIdHistMov] := iSeqHist;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Correção Monetaria Inicial do Bem
      //----------------------------------------------------------------------------------
      if (fCmBem > 0) then
      begin
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 15,
                                          dDataInclusao, -1,
                                          fCmBem, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (CmBem)');
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Depreciação Inicial do Bem
      //----------------------------------------------------------------------------------
      if (fValIniDep > 0) then
      begin
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 17,
                                          dDataInclusao, -1,
                                          fValIniDep, fDepFis, fDepGer,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ValDepIni)');
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
      //----------------------------------------------------------------------------------
      if (fCmDep > 0) then
      begin
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 21,
                                          dDataInclusao, -1,
                                          fCmDep, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao');
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(Sistema.IdModulo,iEmpresaProp,iIdBem,
                                    dDataInclusao,
                                    fValOrg,fCmBem,fValIniDep,fCmDep,
                                    0,0,0,0,
                                    0,0,0,0,
                                    0) then
         Raise eExcessaoCAF.Create('Entrada : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      if (IntegraContab(iEmpresaProp)) and (sControle = 'T') and
         (iPlanilha >= 0) and ((iModulo = 7) or (iModulo = 64)) then
      begin
         if not VerificaPeriodoContabil(iEmpresaProp,dDataInclusao,iExercicio,iPeriodo,
                                        sMensagem,bMostraMsg) then
            Raise eExcessaoCAF.Create('Entrada : VerificaPeriodoContabil');
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
            if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
            if not qryConta.Prepared      then qryConta.Prepare;
            if not qryCCrd.Prepared       then qryCCrd.Prepare;
            if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
            if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
            qryMontaCtb.Open;
         end;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaEntrada(iModulo,iEmpresaProp,iGrupo,iConjunto,iIdBem,
                                         dDataInclusao,fValOrg,fValIniDep,fCmBem,fCmDep,
                                         sDescBem,sAtivProjeto,sRegistro,'E',iSubConta,
                                         floattostr(fPlaca),bMostraMsg);
         if iPlanilha <= 0 then
            Raise eExcessaoCAF.Create('Entrada : ContabilizaEntrada');
         //-------------------------------------------------------------------------------
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                               dDataInclusao, sMensagem, bMostraMsg);
         if iPlanilha < 0 then
            Raise eExcessaoCAF.Create('Entrada : RegistraPlanilhaContabil');
         //-------------------------------------------------------------------------------
         // Registra no Historico a Planilha Gerada
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo.qryHistCtb do
         begin
            iAux := 1;
            while iAux <= iaIdHistMov do
            begin
               ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[iAux];
               ParamByName('PPLNCODIGO').AsInteger := iPlanilha;
               ExecSQL;
               inc(iAux);
            end;
         end;
      end else
      begin
         iPlanilha := 0;
      end;
      dtmAtivoFixo.qryMontaCtb.Close;
      //----------------------------------------------------------------------------------
      // Registra o Saldo das Reavaliações
      //----------------------------------------------------------------------------------
      if (dReavData > 0) then
      begin
         iaIdHistMov := 0;
         with dtmAtivoFixo.qryParamCAF do
         begin
            //----------------------------------------------------------------------------
            // Calcula os valores fornecidos em moeda fiscal e gerencial
            //----------------------------------------------------------------------------
            fReavValFis := fReavValOrg / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                       dReavData,
                                                       bMostraMsg);
            fReavValGer := fReavValOrg / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                       dReavData,
                                                       bMostraMsg);
            fReavDepFis := fReavDepLanc / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                        dReavData,
                                                        bMostraMsg);
            fReavDepGer := fReavDepLanc / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                        dReavData,
                                                        bMostraMsg);
         end;
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 32,
                                          dReavData, -1,
                                          fReavValOrg, fReavValFis, fReavValGer,
                                          -1,-1,-1,-1,-1,-1,-1,-1,
                                          fTaxaDep,fReavValOrg,sReavObs,bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavValOrg)');
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra a Reavaliacao
         //-------------------------------------------------------------------------------
         iIdReavaliacao := RegistraReavaliacao(iIdBem,iEmpresaProp,iSeqHist,
                           fReavValOrg,fReavValFis,fReavValGer,fReavCmBem,
                           fReavDepLanc,fReavDepFis,fReavDepGer,fReavCmDep,
                           strtofloat(sReavTaxaDep),dReavData,0,-1,-1,bMostraMsg);
         if iIdReavaliacao <= 0 then
            Raise eExcessaoCAF.Create('Reavaliacao : RegistraReavaliacao');
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria Inicial da Reavaliação do Bem
         //-------------------------------------------------------------------------------
         if (fReavCmBem <> 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 22,
                                             dReavData, -1,
                                             fReavCmBem, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,
                                             -1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavCmBem)');
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação Inicial da Reavaliacao do Bem
         //-------------------------------------------------------------------------------
         if (fReavDepLanc <> 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 33,
                                             dReavData, iIdReavaliacao,
                                             fReavDepLanc, fReavDepFis, fReavDepGer,
                                             dReavData,-1,-1,-1,-1,-1,-1,-1,
                                             -1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavValDepIni)');
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if (fReavCmDep <> 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 19,
                                             dReavData, -1,
                                             fReavCmDep, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,
                                             -1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavCmDep)');
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if not AtualizaSaldoContabBem(Sistema.IdModulo,iEmpresaProp,iIdBem,
                                       dDataInclusao,
                                       0,0,0,0,
                                       fReavValOrg,fReavCmBem,fReavDepLanc,fReavCmDep,
                                       0,0,0,0,
                                       0) then
            Raise eExcessaoCAF.Create('Entrada-Reavaliação : AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         // Lançamentos Contábeis
         //-------------------------------------------------------------------------------
         if (IntegraContab(iEmpresaProp)) and (sControle = 'T') and
            (iPlanilha >= 0) and ((iModulo = 7) or (iModulo = 64)) then
         begin
            with dtmAtivoFixo do
            begin
               if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
               if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
               if not qryConta.Prepared      then qryConta.Prepare;
               if not qryCCrd.Prepared       then qryCCrd.Prepare;
               if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
               if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
               qryMontaCtb.Open;
            end;
            //----------------------------------------------------------------------------
            iPlanResult := ContabilizaEntradaReav(iModulo,iEmpresaProp,iGrupo,iConjunto,
                                                  iIdBem,dReavData,fReavValOrg,fReavDepLanc,
                                                  fReavCmBem,fReavCmDep,sDescBem,sAtivProjeto,
                                                  sRegistro,'E','R',iSubConta,
                                                  floattostr(fPlaca), bMostraMsg);
            dtmAtivoFixo.qryMontaCtb.Close;
            if iPlanResult <= 0 then
               Raise eExcessaoCAF.Create('Entrada : ContabilizaEntradaReav');
            //----------------------------------------------------------------------------
            if not VerificaPeriodoContabil(iEmpresaProp, dReavData, iExercicio, iPeriodo,
                                           sMensagem,bMostraMsg) then
               Raise eExcessaoCAF.Create('Entrada : VerificaPeriodoContabil (Reavaliacao)');
            //----------------------------------------------------------------------------
            iPlanResult := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                                    dReavData, sMensagem, bMostraMsg);
            if iPlanResult <= 0 then
               Raise eExcessaoCAF.Create('Entrada : RegistraPlanilhaContabil (Reavaliacao)');
            //----------------------------------------------------------------------------
            // Registra no Historico a Planilha Gerada
            //----------------------------------------------------------------------------
            with dtmAtivoFixo.qryHistCtb do
            begin
               iAux := 1;
               while iAux <= iaIdHistMov do
               begin
                  ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[iAux];
                  ParamByName('PPLNCODIGO').AsInteger := iPlanResult;
                  ExecSQL;
                  inc(iAux);
               end;
            end;
         end;
      end;
      dtmAtivoFixo.qryMontaCtb.Close;
      //----------------------------------------------------------------------------------
      // Registra a Ultima Reavaliação
      //----------------------------------------------------------------------------------
      if (dUltReavData > 0) then
      begin
         iaIdHistMov := 0;
         with dtmAtivoFixo.qryParamCAF do
         begin
            //----------------------------------------------------------------------------
            // Calcula os valores fornecidos em moeda fiscal e gerencial
            //----------------------------------------------------------------------------
            fUltReavValFis := fUltReavValOrg / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                       dUltReavData,
                                                       bMostraMsg);
            fUltReavValGer := fUltReavValOrg / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                       dUltReavData,
                                                       bMostraMsg);
            fUltReavDepFis := fUltReavDepLanc / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                        dUltReavData,
                                                        bMostraMsg);
            fUltReavDepGer := fUltReavDepLanc / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                        dUltReavData,
                                                        bMostraMsg);
         end;
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 32,
                                          dUltReavData, -1,
                                          fUltReavValOrg, fUltReavValFis,fUltReavValGer,
                                          -1,-1,-1,-1,-1,-1,-1,-1,
                                          fTaxaDep,fUltReavValOrg,sUltReavObs,bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavValOrg)');
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra a Reavaliacao
         //-------------------------------------------------------------------------------
         iIdUltReavaliacao := RegistraReavaliacao(iIdBem,iEmpresaProp,iSeqHist,
                           fUltReavValOrg,fUltReavValFis,fUltReavValGer,fUltReavCmBem,
                           fUltReavDepLanc,fUltReavDepFis,fUltReavDepGer,fUltReavCmDep,
                           strtofloat(sUltReavTaxaDep),dUltReavData,1,-1,-1,bMostraMsg);
         if iIdUltReavaliacao <= 0 then
            Raise eExcessaoCAF.Create('Reavaliacao : RegistraReavaliacao');
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria Inicial da Reavaliação do Bem
         //-------------------------------------------------------------------------------
         if fUltReavCmBem <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 22,
                                             dUltReavData, -1,
                                             fUltReavCmBem, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,
                                             -1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavCmBem)');
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação Inicial da Reavaliacao do Bem
         //-------------------------------------------------------------------------------
         if fUltReavDepLanc <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 33,
                                             dUltReavData, iIdUltReavaliacao,
                                              fUltReavDepLanc, fUltReavDepFis, fUltReavDepGer,
                                             dUltReavData,-1,-1,-1,-1,-1,-1,-1,
                                             -1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavValDepIni)');
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if fUltReavCmDep <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 19,
                                             dUltReavData, -1,
                                             fUltReavCmDep, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,
                                             -1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavCmDep)');
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if not AtualizaSaldoContabBem(Sistema.IdModulo,iEmpresaProp,iIdBem,
                                       dDataInclusao,
                                       0,0,0,0,
                                       0,0,0,0,
                                       fUltReavValOrg,fUltReavCmBem,fUltReavDepLanc,fUltReavCmDep,
                                       0) then
            Raise eExcessaoCAF.Create('Entrada-Reavaliação : AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         // Lançamentos Contábeis
         //-------------------------------------------------------------------------------
         if (IntegraContab(iEmpresaProp)) and (sControle = 'T') and
            (iPlanilha >= 0) and ((iModulo = 7) or (iModulo = 64)) then
         begin
            with dtmAtivoFixo do
            begin
               if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
               if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
               if not qryConta.Prepared      then qryConta.Prepare;
               if not qryCCrd.Prepared       then qryCCrd.Prepare;
               if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
               if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
               qryMontaCtb.Open;
            end;
            //----------------------------------------------------------------------------
            iPlanResult := ContabilizaEntradaReav(iModulo,iEmpresaProp,iGrupo,iConjunto,
                                                  iIdBem,dUltReavData,fUltReavValOrg,fUltReavDepLanc,
                                                  fUltReavCmBem,fUltReavCmDep,sDescBem,sAtivProjeto,
                                                  sRegistro,'E','R',iSubConta,floattostr(fPlaca),
                                                  bMostraMsg);
            dtmAtivoFixo.qryMontaCtb.Close;
            if iPlanResult <= 0 then
               Raise eExcessaoCAF.Create('Entrada : ContabilizaEntradaReav');
            //----------------------------------------------------------------------------
            if not VerificaPeriodoContabil(iEmpresaProp, dReavData, iExercicio, iPeriodo,
                                           sMensagem,bMostraMsg) then
               Raise eExcessaoCAF.Create('Entrada : VerificaPeriodoContabil (Reavaliacao)');
            //----------------------------------------------------------------------------
            iPlanResult := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                                    dReavData, sMensagem, bMostraMsg);
            if iPlanResult <= 0 then
               Raise eExcessaoCAF.Create('Entrada : RegistraPlanilhaContabil (Reavaliacao)');
            //----------------------------------------------------------------------------
            // Registra no Historico a Planilha Gerada
            //----------------------------------------------------------------------------
            with dtmAtivoFixo.qryHistCtb do
            begin
               iAux := 1;
               while iAux <= iaIdHistMov do
               begin
                  ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[iAux];
                  ParamByName('PPLNCODIGO').AsInteger := iPlanResult;
                  ExecSQL;
                  inc(iAux);
               end;
            end;
            dtmAtivoFixo.qryMontaCtb.Close;
            //----------------------------------------------------------------------------
         end;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iIdBem;
   except
      Result := -1;
      if bTransacao then
         RollBackTransacao;
      if bMostraMsg then
         Raise;
   end;
end;
//========================================================================================
function tAtivoFixo.RegistraEntrada(iIdBemAlt : Integer;iModulo, iEmpresaProp, iConjunto,
         iTerceiro, iGrupo, iSubConta, iAtivProjeto, iClasseBem, iItensRecDev, iFornec,
         iImagem : integer; fPlaca : double; iSituacao : integer; sRegistro, sControle,
         sDescBem, sIdNota, sComplNota, sNumSerie : string; dDataNota, dDataInclusao : tDateTime;
         fValHist, fValOrg, fCmBem : double;dDataIniDep : tDateTime; fValIniDep, fTaxaDep,
         fDepLanc, fCmDep, fPropBaixa, fPrioridade : double; dDataInstalacao,
         dDataFimGar : tDateTime; fValFis, fValGer, fDepFis, fDepGer : double;
         sBaixaTotal, sIdOpcional, sProcessoAquis, sEmpenhoAquis, sPubAutor, sPubEditora,
         sPubAno : String; bMostraMsg : boolean) : Integer;

var
   iIdBem : Integer;

begin
   if (iIdBemAlt <= 0) then
   begin
      iIdBem := LeUltRegistro(nil,'BEM');
   end else
   begin
      iIdBem := iIdBemAlt;
   end;
   //-------------------------------------------------------------------------------------
   try
      with dtmAtivoFixo.qryRegistraBem do
      begin
         ParamByName('PIDBEM').asInteger          := iIdBem;              // IDBEM
         ParamByName('PIDPESSOA').asInteger       := iEmpresaProp;        // IDPESSOA
         ParamByName('PIDCONJUNTO').asInteger     := iConjunto;           // IDCONJUNTO
         ParamByName('PIDGRUPO').asInteger        := iGrupo;              // IDGRUPO
         ParamByName('PIDMODULO').asInteger       := iModulo;             // IDMODULO
         ParamByName('PIDSITUACAO').asInteger     := iSituacao;           // IDSITUACAO
         ParamByName('PREGISTRO').asString        := sRegistro;           // REGISTRO
         ParamByName('PCONTROLE').asString        := sControle;           // CONTROLE
         ParamByName('PPLACA').asFloat            := fPlaca;              // PLACA
         ParamByName('PDESBEM').asString          := sDescBem;            // DESBEM
         ParamByName('PDTAINCLUSAO').asDateTime   := dDataInclusao;       // DTAINCLUSAO
         ParamByName('PVALHISTORICO').asCurrency  := fValHist;            // VALHISTORICO
         ParamByName('PVALORG').asCurrency        := fValOrg;             // VALORG
         ParamByName('PDATAINICIODEP').asDateTime := dDataIniDep;         // DATAINICIODEP
         ParamByName('PTAXADEP').asFloat          := fTaxaDep;            // TAXADEP
         ParamByName('PDATAULTDEP').asDateTime    := dDataIniDep;         // DATAULTDEP
         ParamByName('PIDOPCIONAL').asString      := sIdOpcional;         // IDOPCIONAL
         //-------------------------------------------------------------------------------
         if sBaixaTotal = 'S' then
            ParamByName('PFLGDEPREC').asInteger    := 1                   // FLGDEPREC
         else
            ParamByName('PFLGDEPREC').asInteger    := 0;
         //-------------------------------------------------------------------------------
         ParamByName('PIDCLASSEBEM').asFloat         := iClasseBem;       // IDCLASSEBEM
         if iClasseBem <= 0 then ParamByName('PIDCLASSEBEM').Clear;

         ParamByName('PIDITENSRECDEV').asInteger     := iItensRecDev;     // IDITENSRECDEV
         if iItensRecDev <= 0 then ParamByName('PIDITENSRECDEV').Clear;

         ParamByName('PIDIMAGEM').asInteger          := iImagem;          // IDIMAGEM
         if iImagem <= 0 then ParamByName('PIDIMAGEM').Clear;

         ParamByName('PIDFORNSERV').asInteger        := iFornec;          // IDFORNSERV
         if iFornec <= 0 then ParamByName('PIDFORNSERV').Clear;

         ParamByName('PIDTERCEIRO').asInteger        := iTerceiro;        // IDTERCEIRO
         if iTerceiro <= 0 then ParamByName('PIDTERCEIRO').Clear;

         ParamByName('PIDNOTA').asString             := sIdNota;          // IDNOTA
         if sIdNota = '' then ParamByName('PIDNOTA').Clear;
         //-------------------------------------------------------------------------------
         ParamByName('PDTANOTA').asDateTime          := dDataNota;        // DTANOTA
         if dDataNota <= 0 then ParamByName('PDTANOTA').Clear;

         ParamByName('PDATAULTDEP').asDateTime       := dDataIniDep;      // DATAULTDEP
         if dDataIniDep <= 0 then ParamByName('PDATAULTDEP').Clear;

         ParamByName('PDATARECALCDEP').Clear;                             // DATARECALCDEP
         //-------------------------------------------------------------------------------
         ParamByName('PPROPBAIXA').asFloat            := fPropBaixa;      // PROPBAIXA
         if fPropBaixa < 0 then ParamByName('PPROPBAIXA').asFloat := 0;

         ParamByName('PVALFIS').asCurrency            := fValFis;         // VALFIS
         if fValFis < 0 then ParamByName('PVALFIS').asFloat := 0;

         ParamByName('PDEPFIS').asCurrency            := fDepFis;         // DEPFIS
         if fDepFis < 0 then ParamByName('PDEPFIS').asFloat := 0;

         ParamByName('PVALGER').asCurrency            := fValGer;         // VALGER
         if fValGer < 0 then ParamByName('PVALGER').asFloat := 0;

         ParamByName('PDEPGER').asCurrency            := fDepGer;         // DEPGER
         if fDepGer < 0 then ParamByName('PDEPGER').asFloat := 0;

         ParamByName('PVALDEPINI').asCurrency         := fValIniDep;      // VALDEPINI
         if fValIniDep < 0 then ParamByName('PVALDEPINI').asFloat := 0;

         ParamByName('PDEPLANC').asCurrency           := fDepLanc;        // DEPLANC
         if fDepLanc < 0 then ParamByName('PDEPLANC').asFloat := 0;

         ParamByName('PCMBEM').asCurrency             := fCmBem;          // CMBEM
         if fCmBem < 0 then ParamByName('PCMBEM').asFloat := 0;

         ParamByName('PCMDEP').asCurrency             := fCmDep;          // CMDEP
         if fCmDep < 0 then ParamByName('PCMDEP').asFloat := 0;
         //-------------------------------------------------------------------------------
         ParamByName('PSUBCONTA').asInteger           := iSubConta;       // CODSUBCONTA
         if iSubConta <= 0 then ParamByName('PSUBCONTA').Clear;

         ParamByName('PUNIDNEGOC').asInteger          := iAtivProjeto;    // UNIDNEGOC
         if iAtivProjeto <= 0 then ParamByName('PUNIDNEGOC').Clear;

         ParamByName('PNUMSERIE').asString            := sNumSerie;       // NUMSERIE
         if sNumSerie = '' then ParamByName('PNUMSERIE').Clear;

         ParamByName('PBAIXATOTAL').asString          := sBaixaTotal;     // BAIXATOTAL
         if sBaixaTotal = '' then ParamByName('PBAIXATOTAL').asString := 'N';

         ParamByName('PCOMPLNOTA').asString           := sComplNota;      // COMPLNOTA
         if sComplNota = '' then ParamByName('PCOMPLNOTA').Clear;
         //-------------------------------------------------------------------------------
         ParamByName('PPRIORIDADE').asFloat           := fPrioridade;     // PRIORIDADE
         if fPrioridade < 0 then ParamByName('PPRIORIDADE').Clear;

         ParamByName('PDATAINSTALACAO').asDateTime    := dDataInstalacao; // DATAINSTALACAO
         if dDataInstalacao < 0 then ParamByName('PDATAINSTALACAO').Clear;

         ParamByName('PDATATERMINOGAR').asDateTime    := dDataFimGar;     // DATATERMINOGAR
         if dDataFimGar < 0 then ParamByName('PDATATERMINOGAR').Clear;
         //-------------------------------------------------------------------------------
         ParamByName('PPROCESSOAQUIS').asString       := sProcessoAquis;
         if sProcessoAquis = '' then ParamByName('PPROCESSOAQUIS').Clear;

         ParamByName('PEMPENHOAQUIS').asString        := sEmpenhoAquis;
         if sEmpenhoAquis = '' then ParamByName('PEMPENHOAQUIS').Clear;

         ParamByName('PPUBAUTOR').asString            := sPubAutor;
         if sPubAutor = '' then ParamByName('PPUBAUTOR').Clear;

         ParamByName('PPUBEDITORA').asString          := sPubEditora;
         if sPubEditora = '' then ParamByName('PPUBEDITORA').Clear;

         ParamByName('PPUBANO').asString              := sPubAno;
         if sPubAno = '' then ParamByName('PPUBANO').Clear;
         //-------------------------------------------------------------------------------
         ExecSQL;
      end;
      Result := iIdBem;
   //-------------------------------------------------------------------------------------
   except
      Result := -1;
      if bMostraMsg then
         Raise;
   end;
end;
//========================================================================================
// Função que Contabiliza a Entrada do Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)
//    iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Bem movimentado
//    iConjunto    : id do Conjunto do Bem movimentado
//    iBem         : id do Bem movimentado
//    dDataLanc    : Data da Baixa
//    fValOrg      : Valores a serem Lancados
//    fValIniDep   :           ''
//    fCmBem       :           ''
//    fCmDep       :           ''
//    sDesBem      : Descrição do Bem
//    sAtivProjeto : Unidade de Negócio
//    sRegistro    : Informa o Tipo de Registro que está sendo feito
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaEntrada(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                       dDataLanc : TDate;
                                       fValOrg,fValIniDep,fCmBem,fCmDep : Double;
                                       sDesBem,sAtivProjeto,sRegistro,sTipoMov : String;
                                       iSubConta : Integer; sPlaca : String;
                                       bMostraMsg : Boolean) : Integer;

var
   sGrupo    ,                             // Descricao de Grupo do Bem

   sDebito   ,sCredito,                    // Contas Contábeis
   sDebitoCM ,sCreditoCM,
   sDebitoD  ,sCreditoD,
   sDebitoCMD,sCreditoCMD,

   sCCDebito   ,sCCCredito,                // Centros de Custos
   sCCDebitoCM ,sCCCreditoCM,
   sCCDebitoD  ,sCCCreditoD,
   sCCDebitoCMD,sCCCreditoCMD : String;

   iPlanoConta                : Integer;    // Plano de Contas

   sHistor  ,sHistor1,                     // Historico
   sHistor2 ,sHistor3,
   sHistor4 ,

   sCc      , sPlaCCust,                   // Conta e Plano do Centro de Custo
   sMensagem, sMensErro       : String;    // Mensagem da Contabilidade
   iExercicio,iPeriodo,                    // Periodo Contábil
   iTipoMov1,iTipoMov2,                    // Tipos de Movimentações
   iTipoMov3,iTipoMov4        : Integer;
   fParticip1,fParticip2,                  // Rateio de Custos
   fParticip3,fParticip4,
   fParticip5,fParticip6,
   fParticip7,fParticip8,
   fValLanc                   : Double;

   qryCcRD                    : TwwQuery;

begin
   qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
   //-------------------------------------------------------------------------------------
   if sRegistro = 'I' then
   begin
      iTipoMov1 := 01;
      sMensErro := '(Normal)';
   end else
   begin
      iTipoMov1 := 03;
      sMensErro := '(Imobilizado por Obra)';
   end;
   iTipoMov2 := 15;
   iTipoMov3 := 14;
   iTipoMov4 := 21;
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := iPessoa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para a Entrada do Bem
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov1,'D',iPlanoConta,sDebito,sCCDebito);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para a Entrada do Bem
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov1,'C',iPlanoConta,sCredito,sCCCredito);
   //-------------------------------------------------------------------------------------
   if fCmBem <> 0 then
   begin
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Correção Monetária Inicial do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,iTipoMov2,'D',iPlanoConta,sDebitoCM,sCCDebitoCM);
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Correção Monetária Inicial do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,iTipoMov2,'C',iPlanoConta,sCreditoCM,sCCCreditoCM);
   end;
   //-------------------------------------------------------------------------------------
   if fValIniDep <> 0 then
   begin
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Entrada da Depreciação Inicial
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,iTipoMov3,'D',iPlanoConta,sDebitoD,sCCDebitoD);
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Entrada da Depreciação Inicial
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,iTipoMov3,'C',iPlanoConta,sCreditoD,sCCCreditoD);
   end;
   //-------------------------------------------------------------------------------------
   if fCmDep <> 0 then
   begin
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Correção Monetária da Depreciacao Inicial
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,iTipoMov4,'D',iPlanoConta,sDebitoCMD,sCCDebitoCMD);
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Correção Monetária da Depreciacao Inicial
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,iTipoMov4,'C',iPlanoConta,sCreditoCMD,sCCCreditoCMD);
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Débito para o Movimento de Entrada no Grupo ' + sGrupo +
                ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCredito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a crédito para o Movimento de Entrada no Grupo ' + sGrupo +
                ' não cadastrada !'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if fCmBem <> 0 then
   begin
      if (sDebitoCM = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a Débito para o Movimento de Correção Monetária no Grupo '
                   + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         end;
         Result := -1;
         exit;
      end;
      //-------------------------------------------------------------------------------------
      if (sCreditoCM = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a crédito para o Movimento de Correção Monetária no Grupo '
                   + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         end;
         Result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if fValIniDep <> 0 then
   begin
      if (sDebitoD = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a Débito para o Movimento de Depreciação Inicial no Grupo ' +
                   sGrupo + ' não cadastrada !' + sMensErro, 'Erro', mtError, [mbOk], 0);
         end;
         Result := -1;
         exit;
      end;
      //-------------------------------------------------------------------------------------
      if (sCreditoD = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a crédito para o Movimento de Depreciação Inicial no Grupo ' +
                   sGrupo + ' não cadastrada !' + sMensErro, 'Erro', mtError, [mbOk], 0);
         end;
         Result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if fCmDep <> 0 then
   begin
      if (sDebitoCMD = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a Débito para o Movimento de Correção Monetária da ' +
                   'Depreciação no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro,
                   'Erro', mtError, [mbOk], 0);
         end;
         Result := -1;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (sCreditoCMD = '') then
      begin
         if bMostraMsg then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            MsgDlg('Conta a Crédito para o Movimento de Correção Monetária da ' +
                   'Depreciação no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro,
                   'Erro', mtError, [mbOk], 0);
         end;
         Result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Processamento do Rateio dos Custos
   //-------------------------------------------------------------------------------------
   if sTipoMov <> 'T' then
   begin
      sHistor := 'Entrada de Bem ';
   end else
   begin
      sHistor := 'Transferência (Entrada de Bem)';
   end;
   sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
   sHistor2   := '';
   sHistor3   := '';
   sHistor4   := '';
   fParticip1 := 0;
   fParticip2 := 0;
   fParticip3 := 0;
   fParticip4 := 0;
   fParticip5 := 0;
   fParticip6 := 0;
   fParticip7 := 0;
   fParticip8 := 0;
   //-------------------------------------------------------------------------------------
   // Busca Rateio da Depreciação do Bem
   //-------------------------------------------------------------------------------------
   qryCcRD.Close;
   qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
   qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
   qryCcRD.Open;
   //-------------------------------------------------------------------------------------
   qryCcRD.First;
   while not qryCcRD.EOF do
   begin
      if (fParticip1 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sDebito) then
         begin
            fParticip1 := 100;
            sCc        := '';
         end else
         begin
            fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fValOrg * fParticip1) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,sDebito,'',inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fParticip2 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sCredito) then
         begin
            fParticip2 := 100;
            sCc        := '';
         end else
         begin
            fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fValOrg * fParticip2) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,'',sCredito,inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fCmBem <> 0) then
      begin
         if sTipoMov <> 'T' then
         begin
            sHistor := 'Correção Monetária Inicial do Bem ';
         end else
         begin
            sHistor := 'Transferência (Entrada de Bem)';
         end;
         if (fParticip3 < 100) then
         begin
            if not ContaPossuiCCust(iPlanoConta,sDebitoCM) then
            begin
               fParticip3 := 100;
               sCc        := '';
            end else
            begin
               fParticip3 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
            end;
            //----------------------------------------------------------------------------
            fValLanc := (fCmBem * fParticip3) / 100;
            //----------------------------------------------------------------------------
            if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,sDebitoCM,'',inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
         //-------------------------------------------------------------------------------
         if (fParticip4 < 100) then
         begin
            if not ContaPossuiCCust(iPlanoConta,sCreditoCM) then
            begin
               fParticip4 := 100;
               sCc        := '';
            end else
            begin
               fParticip4 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
            end;
            //----------------------------------------------------------------------------
            fValLanc := (fCmBem * fParticip4) / 100;
            //----------------------------------------------------------------------------
            if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,'',sCreditoCM,inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fValIniDep <> 0) then
      begin
         if sTipoMov <> 'T' then
         begin
            sHistor := 'Depreciacao Inicial do Bem ';
         end else
         begin
            sHistor := 'Transferência (Entrada de Bem)';
         end;
         if (fParticip5 < 100) then
         begin
            if not ContaPossuiCCust(iPlanoConta,sDebitoD) then
            begin
               fParticip5 := 100;
               sCc        := '';
            end else
            begin
               fParticip5 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
            end;
            //----------------------------------------------------------------------------
            fValLanc := (fValIniDep * fParticip5) / 100;
            //----------------------------------------------------------------------------
            if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,sDebitoD,'',inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
         //-------------------------------------------------------------------------------
         if (fParticip6 < 100) then
         begin
            if not ContaPossuiCCust(iPlanoConta,sCreditoD) then
            begin
               fParticip6 := 100;
               sCc        := '';
            end else
            begin
               fParticip6 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
            end;
            //----------------------------------------------------------------------------
            fValLanc := (fValIniDep * fParticip4) / 100;
            //----------------------------------------------------------------------------
            if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,'',sCreditoD,inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fCmDep <> 0) then
      begin
         if sTipoMov <> 'T' then
         begin
            sHistor := 'Correção Monetária Inicial da Depreciação do Bem ';
         end else
         begin
            sHistor := 'Transferência (Entrada de Bem)';
         end;
         if (fParticip7 < 100) then
         begin
            if not ContaPossuiCCust(iPlanoConta,sDebitoCMD) then
            begin
               fParticip7 := 100;
               sCc        := '';
            end else
            begin
               fParticip7 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
            end;
            //----------------------------------------------------------------------------
            fValLanc := (fCmDep * fParticip7) / 100;
            //----------------------------------------------------------------------------
            if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,sDebitoCMD,'',inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
         //----------------------------------------------------------------------------------
         if (fParticip8 < 100) then
         begin
            if not ContaPossuiCCust(iPlanoConta,sCreditoD) then
            begin
               fParticip8 := 100;
               sCc        := '';
            end else
            begin
               fParticip8 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
            end;
            //----------------------------------------------------------------------------
            fValLanc := (fCmDep * fParticip8) / 100;
            //----------------------------------------------------------------------------
            if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                   sCc,sAtivProjeto,'',sCreditoCMD,inttostr(iBem),fValLanc,
                                   iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
            begin
               Result := -1;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      qryCcRD.Next;
   end;
   qryCcRD.Close;
   //-------------------------------------------------------------------------------------
   result := 1;
end;
//========================================================================================
// Função que Contabiliza o Saldo de Reavaliacao na Entrada de um Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo)
//    iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Bem movimentado
//    iConjunto    : id do Conjunto do Bem movimentado
//    iBem         : id do Bem movimentado
//    dDataLanc    : Data da Baixa
//    fValOrg      : Valores a serem Lancados
//    fValIniDep   :           ''
//    fCmBem       :           ''
//    fCmDep       :           ''
//    sDesBem      : Descrição do Bem
//    sAtivProjeto : Unidade de Negócio
//    sRegistro    : Informa o Tipo de Registro que está sendo feito
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaEntradaReav(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                           dDataLanc : TDate;
                                           fReavValOrg,fReavDepLanc,fReavCmBem,fReavCmDep : Double;
                                           sDesBem,sAtivProjeto,sRegistro,
                                           sTipoMov, sTipoTab : String;
                                           iSubConta : Integer; sPlaca : String;
                                           bMostraMsg : Boolean) : Integer;

var
   sGrupo    ,                             // Descricao de Grupo do Bem

   sDebito   ,sCredito,                    // Contas Contábeis
   sDebitoCM ,sCreditoCM,
   sDebitoD  ,sCreditoD,
   sDebitoCMD,sCreditoCMD,

   sCCDebito   ,sCCCredito,                // Centros de Custos
   sCCDebitoCM ,sCCCreditoCM,
   sCCDebitoD  ,sCCCreditoD,
   sCCDebitoCMD,sCCCreditoCMD : String;

   iPlanoConta                : Integer;   // Plano de Contas

   sHistor  ,sHistor1,                     // Historico
   sHistor2 ,sHistor3,
   sHistor4 ,

   sCc      , sPlaCCust,                   // Conta e Plano do Centro de Custo
   sMensagem, sMensErro       : String;    // Mensagem da Contabilidade
   iExercicio,iPeriodo,                    // Periodo Contábil
   iTipoMov1,iTipoMov2,                    // Tipos de Movimentações
   iTipoMov3,iTipoMov4        : Integer;
   fParticip1,fParticip2,                  // Rateio de Custos
   fParticip3,fParticip4,
   fParticip5,fParticip6,
   fParticip7,fParticip8,
   fValLanc                   : Double;

   qryCcRD                    : TwwQuery;

begin
   qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
   //-------------------------------------------------------------------------------------
   if sTipoTab = 'R' then
   begin
      iTipoMov1 := 32;
      iTipoMov2 := 22;
      iTipoMov3 := 33;
      iTipoMov4 := 19;
   end else
   begin
      iTipoMov1 := 09;
      iTipoMov2 := 34;
      iTipoMov3 := 35;
      iTipoMov4 := 36;
   end;
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := iPessoa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para a Entrada do Bem
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov1,'D',iPlanoConta,sDebito,sCCDebito);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para a Entrada do Bem
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov1,'C',iPlanoConta,sCredito,sCCCredito);
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para a Correcao Monetária Inicial do Bem
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov2,'D',iPlanoConta,sDebitoCM,sCCDebitoCM);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para a Correcao Monetária Inicial do Bem
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov2,'C',iPlanoConta,sCreditoCM,sCCCreditoCM);
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para a Entrada da Depreciação Inicial
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov3,'D',iPlanoConta,sDebitoD,sCCDebitoD);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para a Entrada da Depreciação Inicial
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov3,'C',iPlanoConta,sCreditoD,sCCCreditoD);
   //-------------------------------------------------------------------------------------
   // Busca conta a débito para a Correção Monetária da Depreciacao Inicial
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov4,'D',iPlanoConta,sDebitoCMD,sCCDebitoCMD);
   //-------------------------------------------------------------------------------------
   // Busca conta a crédito para a Correção Monetária da Depreciacao Inicial
   //-------------------------------------------------------------------------------------
   Localiza_ContaeCentroCusto(iGrupo,iTipoMov4,'C',iPlanoConta,sCreditoCMD,sCCCreditoCMD);
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Débito para o Movimento de Entrada no Grupo ' + sGrupo +
                ' não cadastrada ! (Reavaliação/Acréscimo)'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCredito = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a crédito para o Movimento de Entrada no Grupo ' + sGrupo +
                ' não cadastrada ! (Reavaliação/Acréscimo)'+sMensErro,'Erro',mtError,[mbOk],0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebitoCM = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Débito para o Movimento de Correção Monetária no Grupo '
                + sGrupo + ' não cadastrada ! (Reavaliação/Acréscimo)','Erro',mtError,[mbOk],0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCreditoCM = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a crédito para o Movimento de Correção Monetária no Grupo '
                + sGrupo + ' não cadastrada ! (Reavaliação/Acréscimo)','Erro',mtError,[mbOk],0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebitoD = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Débito para o Movimento de Depreciação Inicial no Grupo ' +
                sGrupo + ' não cadastrada ! (Reavaliação/Acréscimo)' + sMensErro, 'Erro', mtError, [mbOk], 0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCreditoD = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a crédito para o Movimento de Depreciação Inicial no Grupo ' +
                sGrupo + ' não cadastrada ! (Reavaliação/Acréscimo)' + sMensErro, 'Erro', mtError, [mbOk], 0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se as contas foram cadastradas para as movimentações nos grupos
   //-------------------------------------------------------------------------------------
   if (sDebitoCMD = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Débito para o Movimento de Correção Monetária da ' +
                'Depreciação no Grupo ' + sGrupo + ' não cadastrada ! (Reavaliação/Acréscimo)' +
                sMensErro, 'Erro', mtError, [mbOk], 0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sCreditoCMD = '') then
   begin
      if bMostraMsg then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         MsgDlg('Conta a Crédito para o Movimento de Correção Monetária da ' +
                'Depreciação no Grupo ' + sGrupo + ' não cadastrada ! (Reavaliação/Acréscimo)' +
                sMensErro, 'Erro', mtError, [mbOk], 0);
      end;
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Processamento do Rateio dos Custos
   //-------------------------------------------------------------------------------------
   if sTipoMov <> 'T' then
   begin
      sHistor := 'Entrada de Saldo de Reavaliação ';
   end else
   begin
      if sTipoTab = 'R' then
      begin
         sHistor := 'Transferência (Entrada de Reavaliação)';
      end else
      begin
         sHistor := 'Transferência (Entrada de Acréscimo)';
      end;
   end;
   sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
   sHistor2   := '';
   sHistor3   := '';
   sHistor4   := '';
   fParticip1 := 0;
   fParticip2 := 0;
   fParticip3 := 0;
   fParticip4 := 0;
   fParticip5 := 0;
   fParticip6 := 0;
   fParticip7 := 0;
   fParticip8 := 0;
   //-------------------------------------------------------------------------------------
   // Busca Rateio da Depreciação do Bem
   //-------------------------------------------------------------------------------------
   qryCcRD.Close;
   qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
   qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
   qryCcRD.Open;
   //-------------------------------------------------------------------------------------
   qryCcRD.First;
   while not qryCcRD.EOF do
   begin
      if (fParticip1 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sDebito) then
         begin
            fParticip1 := 100;
            sCc        := '';
         end else
         begin
            fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fReavValOrg * fParticip1) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,sDebito,'',inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fParticip2 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sCredito) then
         begin
            fParticip2 := 100;
            sCc        := '';
         end else
         begin
            fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fReavValOrg * fParticip2) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,'',sCredito,inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if sTipoMov <> 'T' then
      begin
         sHistor := 'C.M. do Saldo da Reavaliação';
      end else
      begin
         if sTipoTab = 'R' then
         begin
            sHistor := 'Transferência (Entrada de Reavaliação)';
         end else
         begin
            sHistor := 'Transferência (Entrada de Acréscimo)';
         end;
      end;
      if (fParticip3 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sDebitoCM) then
         begin
            fParticip3 := 100;
            sCc        := '';
         end else
         begin
            fParticip3 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fReavCmBem * fParticip3) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,sDebitoCM,'',inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fParticip4 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sCreditoCM) then
         begin
            fParticip4 := 100;
            sCc        := '';
         end else
         begin
            fParticip4 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fReavCmBem * fParticip4) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,'',sCreditoCM,inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if sTipoMov <> 'T' then
      begin
         sHistor := 'Depreciacao do Saldo da Reavaliacao';
      end else
      begin
         if sTipoTab = 'R' then
         begin
            sHistor := 'Transferência (Entrada de Reavaliação)';
         end else
         begin
            sHistor := 'Transferência (Entrada de Acréscimo)';
         end;
      end;
      if (fParticip5 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sDebitoD) then
         begin
            fParticip5 := 100;
            sCc        := '';
         end else
         begin
            fParticip5 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fReavDepLanc * fParticip5) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,sDebitoD,'',inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fParticip6 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sCreditoD) then
         begin
            fParticip6 := 100;
            sCc        := '';
         end else
         begin
            fParticip6 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fReavDepLanc * fParticip4) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,'',sCreditoD,inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if sTipoMov <> 'T' then
      begin
         sHistor := 'C.M. da Deprec. do Saldo da Reaval.';
      end else
      begin
         if sTipoTab = 'R' then
         begin
            sHistor := 'Transferência (Entrada de Reavaliação)';
         end else
         begin
            sHistor := 'Transferência (Entrada de Acréscimo)';
         end;
      end;
      if (fParticip7 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sDebitoCMD) then
         begin
            fParticip7 := 100;
            sCc        := '';
         end else
         begin
            fParticip7 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fReavCmDep * fParticip7) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('D',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,sDebitoCMD,'',inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if (fParticip8 < 100) then
      begin
         if not ContaPossuiCCust(iPlanoConta,sCreditoD) then
         begin
            fParticip8 := 100;
            sCc        := '';
         end else
         begin
            fParticip8 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
            sCc        := qryCcRD.FieldByName('CODCENTROCUSTO').AsString
         end;
         //-------------------------------------------------------------------------------
         fValLanc := (fReavCmDep * fParticip8) / 100;
         //-------------------------------------------------------------------------------
         if not MontaLancamento('C',sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                sCc,sAtivProjeto,'',sCreditoCMD,inttostr(iBem),fValLanc,
                                iPessoa,iBem,iGrupo,iPlanoConta,iSubConta,bMostraMsg) then
         begin
            Result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      qryCcRD.Next;
   end;
   qryCcRD.Close;
   //-------------------------------------------------------------------------------------
   Result := 1;
end;
//========================================================================================
// Função que executa o Desmembramento de um Bem
// Data : 25/04/2001
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//       A Função retorna o id da movimentação que gerou a baixa do bem original
//----------------------------------------------------------------------------------------
//
//    iModulo        : id do módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
//    iEmpresaProp   : id da empresa proprietária (Sistema.idEmpresa)    (IDPESSOA)
//    iBem           : id do bem a ser desmembrado                       (IDBEM)
//    dDataMov       : Data do desmembramento                            (DATAMOVIMENTACAO)
//    iQtdBens       : Quantidade de bens que devem ser gerados
//    aPlaca         : ARRAY DINÂMICO contendo os números das placas patrimoniais dos
//                     bens a serem gerados
//    aDesBem        : ARRAY DINÂMICO contendo as descrições dos bens a serem gerados
//    aProporcoes    : ARRAY DINÂMICO contendo as proporções percentuais que serão
//                     aplicadas aos componentes contábeis do bem original
//    aIdBemResult   : ARRAY DINÂMICO contendo os id's dos bens gerados
//
//    bMostraMsg     : True  - mostra mensagens da Função
//                     False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function TAtivoFixo.ExecutaDesmembramento(iModulo, iEmpresaProp, iBem : Integer;
                                          dDataMov         : tDate;
                                          iQtdBens         : Integer;
                                          aPlaca           : Array of Double;
                                          aDesBem          : Array of String;
                                          aProporcoes      : Array of Currency;
                                          bMostraMsg       : boolean;
                                          Var aIdBemResult : Array of Integer) : Integer;

var
   iIdBem, iSeqHist, iAux, iProcBem,
   iTipoMovimentacao, iAux2,
   iIdReavaliacao, iIdAcrescimo          : Integer;
   qryBem, qryReavaliacao, qryAcrescimo,
   qryUltMov, qryAux                     : TwwQuery;
   bTransacao                            : Boolean;
   fValOrg, fCmBem, fDepLanc, fCmDep,
   fValFis, fValGer, fDepFis, fDepGer,
   fBaixaB, fBaixaBF, fBaixaBG,
   fBaixaCM, fBaixaD, fBaixaDF,
   fBaixaDG, fBaixaCMD,
   fDepCmBem, fDepDepLanc, fDepCmDep,
   fSomaProp, fPropBaixar                : Extended;

begin
   with dtmAtivoFixo do
   begin
      if not qryUltMov.Prepared then
         qryUltMov.Prepare;
      if not qryBem.Prepared then
         qryBem.Prepare;
      if not qryReavaliacao.Prepared then
         qryReavaliacao.Prepare;
      if not qryAcrescimo.Prepared then
         qryAcrescimo.Prepare;
      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;
      if not qryRegistraBaixaBem.Prepared then
         qryRegistraBaixaBem.Prepare;
      if not qryRegistraAcresc.Prepared then
         qryRegistraAcresc.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // Valida os Parâmetros obrigatórios para o Desmembramento
   //-------------------------------------------------------------------------------------
   if ((High(aPlaca)) + 1 <> iQtdBens) or ((High(aDesBem)) + 1 <> iQtdBens) or
      ((High(aProporcoes) + 1) <> iQtdBens) then
   begin
      if bMostraMsg then
         MsgDlg('Não existem Placas e/ou Descrições e/ou Proporções suficientes para a quantidade de'+
                'bens a ser gerada!', 'Erro', mtError, [mbOk], 0);
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se a soma das proporções é igual a 100%
   //-------------------------------------------------------------------------------------
   fSomaProp := 0;
   for iAux := 0 to High(aProporcoes) do
       fSomaProp := fSomaProp + aProporcoes[iAux];
   if fSomaProp <> 100 then
   begin
      if bMostraMsg then
         MsgDlg('A soma das proporções está diferente de 100% !',
                'Erro', mtError, [mbOk], 0);
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se existe Placa duplicada no array enviado
   //-------------------------------------------------------------------------------------
   for iAux := 0 to (High(aPlaca) - 1) do
      for iAux2 := (iAux + 1) to High(aPlaca) do
          if aPlaca[iAux] = aPlaca[iAux2] then
          begin
             if bMostraMsg then
                MsgDlg('Uma das placas (' + floattostr(aPlaca[iAux]) + ') está duplicada para a '+
                       'geração dos novos bens!', 'Erro', mtError, [mbOk], 0);
             Result := -1;
             exit;
          end;
   //-------------------------------------------------------------------------------------
   // Verifica se existe Placa já cadastrada no banco
   //-------------------------------------------------------------------------------------
   for iAux := 0 to High(aPlaca) do
   begin
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT IDBEM ' +
                         ' FROM BEM ' +
                         ' WHERE PLACA = ' + floattostr(aPlaca[iAux]);
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Uma das placas (' + floattostr(aPlaca[iAux]) + ') fornecidas para a '+
                   'geração dos novos bens já existe!', 'Erro', mtError, [mbOk], 0);
         Result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
   begin
      if bMostraMsg then
         MsgDlg('Existe movimentação após a data do desmembramento. '+
                'Consulte Historico de Movimentações do Bem!',
                'Erro', mtError, [mbOk], 0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //==================================================================================
      // EXECUTA A GERACAO DOS NOVOS BENS
      //==================================================================================
      // Posiciona a Tabela de Bens no Bem a ser DESMEMBRADO
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      //----------------------------------------------------------------------------------
      if iModulo <= 0 then
      begin
         if bMostraMsg then
         begin
            MsgDlg('É obrigatório fornecer o código do MODULO!',
                   'Erro',mtError,[mbOk],0);
         end;
         result := -1;
         exit;
      end else
      begin
         if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Somente o módulo que cadastrou o bem pode movimenta-lo',
                      'Erro',mtError,[mbOk],0);
            end;
            result := -1;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Calcula a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      fDepCmBem   := 0;
      fDepDepLanc := 0;
      fDepCmDep   := 0;
      if (qryBem.FieldByName('CONTROLE').AsString = 'T') then
         if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),bMostraMsg,
                                   fDepCmBem, fDepDepLanc, fDepCmDep) then
            Raise eExcessaoCAF.Create('Baixa : ExecutaDepreciacao');
      //----------------------------------------------------------------------------------
      for iProcBem := 0 to (iQtdBens - 1) do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Entrada do Bem por Desmembramento
         //-------------------------------------------------------------------------------
         fValOrg  := qryBem.FieldByName('VALORG').AsCurrency  * (aProporcoes[iProcBem] / 100);
         fCmBem   := qryBem.FieldByName('CMBEM').AsCurrency   * (aProporcoes[iProcBem] / 100);
         fDepLanc := qryBem.FieldByName('DEPLANC').AsCurrency * (aProporcoes[iProcBem] / 100);
         fCmDep   := qryBem.FieldByName('CMDEP').AsCurrency   * (aProporcoes[iProcBem] / 100);
         fValFis  := qryBem.FieldByName('VALFIS').AsCurrency  * (aProporcoes[iProcBem] / 100);
         fValGer  := qryBem.FieldByName('VALGER').AsCurrency  * (aProporcoes[iProcBem] / 100);
         fDepFis  := qryBem.FieldByName('DEPFIS').AsCurrency  * (aProporcoes[iProcBem] / 100);
         fDepGer  := qryBem.FieldByName('DEPGER').AsCurrency  * (aProporcoes[iProcBem] / 100);
         iIdBem := RegistraEntrada(-1,
                                   Sistema.IdModulo,
                                   Sistema.IdEmpresa,
                                   qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                   qryBem.FieldByName('IDTERCEIRO').AsInteger,
                                   qryBem.FieldByName('IDGRUPO').AsInteger,
                                   qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                   qryBem.FieldByName('UNIDNEGOC').AsInteger,
                                   qryBem.FieldByName('IDCLASSEBEM').AsInteger,
                                   qryBem.FieldByName('IDITENSRECDEV').AsInteger,
                                   qryBem.FieldByName('IDFORNSERV').AsInteger,
                                   qryBem.FieldByName('IDIMAGEM').AsInteger,
                                   aPlaca[iProcBem],
                                   qryBem.FieldByName('IDSITUACAO').AsInteger,
                                   qryBem.FieldByName('REGISTRO').AsString,
                                   qryBem.FieldByName('CONTROLE').AsString,
                                   aDesBem[iProcBem],
                                   qryBem.FieldByName('IDNOTA').AsString,
                                   qryBem.FieldByName('COMPLNOTA').AsString,
                                   qryBem.FieldByName('NUMSERIE').AsString,
                                   qryBem.FieldByName('DTANOTA').AsDateTime,
                                   dDataMov, // dDataInclusao
                                   qryBem.FieldByName('VALHISTORICO').AsCurrency * (aProporcoes[iProcBem] / 100),
                                   fValOrg,
                                   fCmBem,
                                   qryBem.FieldByName('DATAULTDEP').AsDateTime,
                                   fDepLanc,
                                   qryBem.FieldByName('TAXADEP').AsFloat,
                                   fDepLanc,
                                   fCmDep,
                                   qryBem.FieldByName('PROPBAIXA').AsFloat,
                                   qryBem.FieldByName('PRIORIDADE').AsInteger,
                                   qryBem.FieldByName('DATAINSTALACAO').AsDateTime,
                                   qryBem.FieldByName('DATATERMINOGAR').AsDateTime,
                                   fValFis,
                                   fValGer,
                                   fDepFis,
                                   fDepGer,
                                   qryBem.FieldByName('BAIXATOTAL').AsString,
                                   qryBem.FieldByName('IDOPCIONAL').AsString,
                                   qryBem.FieldByName('PROCESSOAQUIS').AsString,
                                   qryBem.FieldByName('EMPENHOAQUIS').AsString,
                                   qryBem.FieldByName('PUBAUTOR').AsString,
                                   qryBem.FieldByName('PUBEDITORA').AsString,
                                   qryBem.FieldByName('PUBANO').AsString,
                                   bMostraMsg);
         if iIdBem = -1 then
            Raise eExcessaoCAF.Create('Entrada : RegistraBem');
         //-------------------------------------------------------------------------------
         // Registra no Array de Saída o Id do Bem Gerado
         //-------------------------------------------------------------------------------
         aIdBemResult[iProcBem] := iIdBem;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Entrada do Bem por Desmembramento
         //-------------------------------------------------------------------------------
         iTipoMovimentacao := 07;
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                          iTipoMovimentacao, dDataMov, -1,
                                          fValOrg, fValFis, fValGer,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if (iSeqHist = -1) then
            Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ValOrg)');
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria Inicial do Bem
         //-------------------------------------------------------------------------------
         if (fCmBem > 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             15, dDataMov, -1,
                                             fCmBem, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (CmBem)');
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if (fDepLanc > 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             17, dDataMov, -1,
                                             fDepLanc, fDepFis, fDepGer,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ValDepIni)');
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if (fCmDep > 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             21, dDataMov, -1,
                                             fCmDep, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao');
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if not AtualizaSaldoContabBem(Sistema.IdModulo,iEmpresaProp,iIdBem,
                                       dDataMov,
                                       fValOrg,fCmBem,fDepLanc,fCmDep,
                                       0,0,0,0,
                                       0,0,0,0,
                                       0) then
            Raise eExcessaoCAF.Create('Entrada : AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         // Processa as Reavaliações do Bem Desmembrado
         //-------------------------------------------------------------------------------
         qryReavaliacao.First;
         while not qryReavaliacao.EOF do
         begin
            fValOrg  := qryReavaliacao.FieldByName('VALORG').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fCmBem   := qryReavaliacao.FieldByName('CMBEM').AsCurrency   * (aProporcoes[iProcBem] / 100);
            fDepLanc := qryReavaliacao.FieldByName('DEPLANC').AsCurrency * (aProporcoes[iProcBem] / 100);
            fCmDep   := qryReavaliacao.FieldByName('CMDEP').AsCurrency   * (aProporcoes[iProcBem] / 100);
            fValFis  := qryReavaliacao.FieldByName('VALFIS').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fValGer  := qryReavaliacao.FieldByName('VALGER').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fDepFis  := qryReavaliacao.FieldByName('DEPFIS').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fDepGer  := qryReavaliacao.FieldByName('DEPGER').AsCurrency  * (aProporcoes[iProcBem] / 100);
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT TAXADEPANT,VALORGLAUDO,OBSREAVAL ' +
                               ' FROM HISTORICOMOVIMENTACAO ' +
                               ' WHERE IDMOVIMENTACAO = ' + qryReavaliacao.FieldByName('IDMOVIMENTACAO').AsString;
            qryAux.Open;
            //----------------------------------------------------------------------------
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             32, qryReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime, -1,
                                             fValOrg, fValFis, fValGer,
                                             -1,-1,-1,-1,-1,-1,-1,-1,
                                             qryAux.FieldByName('TAXADEPANT').AsFloat,
                                             qryAux.FieldByName('VALORGLAUDO').AsFloat,
                                             qryAux.FieldByName('OBSREAVAL').AsString,
                                             bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavValOrg)');
            qryAux.Close;
            //----------------------------------------------------------------------------
            iIdReavaliacao := RegistraReavaliacao(iIdBem,iEmpresaProp,iSeqHist,
                              fValOrg,fValFis,fValGer,fCmBem,
                              fDepLanc,fDepFis,fDepGer,fCmDep,
                              qryReavaliacao.FieldByName('TAXADEP').AsFloat,
                              qryReavaliacao.FieldByName('DATAREAVALIACAO').AsFloat,
                              qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger,
                              dDataMov - 1, // DATAULTDEP
                              qryReavaliacao.FieldByName('FLGDEPREC').AsInteger,
                              bMostraMsg);
            if iIdReavaliacao <= 0 then
               Raise eExcessaoCAF.Create('Reavaliacao : RegistraReavaliacao');
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetaria da Reavaliação do Bem
            //----------------------------------------------------------------------------
            if (fCmBem <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                22, dDataMov, iIdReavaliacao,
                                                fCmBem, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavCmBem)');
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Depreciação da Reavaliacao do Bem
            //----------------------------------------------------------------------------
            if (fDepLanc <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                33, dDataMov, iIdReavaliacao,
                                                fDepLanc, fDepFis, fDepGer,
                                                dDataMov,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavValDepIni)');
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetária da Depreciação do Bem
            //----------------------------------------------------------------------------
            if (fCmDep <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                19, dDataMov, iIdReavaliacao,
                                                fCmDep, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavCmDep)');
            end;
            //----------------------------------------------------------------------------
            // Atualiza a tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            if qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0 then
               if not AtualizaSaldoContabBem(Sistema.IdModulo,iEmpresaProp,iIdBem,
                                             dDataMov,
                                             0,0,0,0,
                                             fValOrg,fCmBem,fDepLanc,fCmDep,
                                             0,0,0,0,
                                             0) then
                  Raise eExcessaoCAF.Create('Desmembramento-Reavaliação : AtualizaSaldoContabBem')
            else
               if not AtualizaSaldoContabBem(Sistema.IdModulo,iEmpresaProp,iIdBem,
                                             dDataMov,
                                             0,0,0,0,
                                             0,0,0,0,
                                             fValOrg,fCmBem,fDepLanc,fCmDep,
                                             0) then
                  Raise eExcessaoCAF.Create('Desmembramento-Reavaliação : AtualizaSaldoContabBem');
            //----------------------------------------------------------------------------
            qryReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // Processa os Acréscimos de Valor do Bem Desmembrado
         //-------------------------------------------------------------------------------
         qryAcrescimo.First;
         while not qryAcrescimo.EOF do
         begin
            fValOrg  := qryAcrescimo.FieldByName('VALORG').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fCmBem   := qryAcrescimo.FieldByName('CMBEM').AsCurrency   * (aProporcoes[iProcBem] / 100);
            fDepLanc := qryAcrescimo.FieldByName('DEPLANC').AsCurrency * (aProporcoes[iProcBem] / 100);
            fCmDep   := qryAcrescimo.FieldByName('CMDEP').AsCurrency   * (aProporcoes[iProcBem] / 100);
            fValFis  := qryAcrescimo.FieldByName('VALFIS').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fValGer  := qryAcrescimo.FieldByName('VALGER').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fDepFis  := qryAcrescimo.FieldByName('DEPFIS').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fDepGer  := qryAcrescimo.FieldByName('DEPGER').AsCurrency  * (aProporcoes[iProcBem] / 100);
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT IDTIPODESPESA, OBS ' +
                               ' FROM ACRESCVALOR ' +
                               ' WHERE IDMOVIMENTACAO = ' + qryAcrescimo.FieldByName('IDMOVIMENTACAO').AsString;
            qryAux.Open;
            //----------------------------------------------------------------------------
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             09, qryAcrescimo.FieldByName('DATAACRESCIMO').AsDateTime, - 1,
                                             fValOrg, fValFis, fValGer,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',
                                             bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Acréscimo : RegistraMovimentacao');
            qryAux.Close;
            //----------------------------------------------------------------------------
            iIdAcrescimo := RegistraAcrescimo(iIdBem, iEmpresaProp, iSeqHist,
                            qryAcrescimo.FieldByName('TAXADEP').AsFloat,
                            qryAcrescimo.FieldByName('DATAACRESCIMO').AsFloat,
                            fValOrg,fValFis,fValGer,fCmBem,
                            fCmDep,fDepLanc,fDepFis,fDepGer,
                            qryAcrescimo.FieldByName('FLGDEPREC').AsInteger,
                            qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime,
                            bMostraMsg);
            if iIdAcrescimo <= 0 then
               Raise eExcessaoCAF.Create('Acréscimo : RegistraReavaliacao');
            //----------------------------------------------------------------------------
            if not RegistraAcresc(iSeqHist,
                                  qryAux.FieldByName('IDTIPODESPESA').AsInteger,
                                  qryAux.FieldByName('OBS').AsString,
                                  bMostraMsg) then
               Raise eExcessaoCAF.Create('Acréscimo : RegistraAcresc');
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetaria da Reavaliação do Bem
            //----------------------------------------------------------------------------
            if (fCmBem <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                34, dDataMov, iIdAcrescimo,
                                                fCmBem, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao');
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Depreciação da Reavaliacao do Bem
            //----------------------------------------------------------------------------
            if (fDepLanc <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                35, dDataMov, iIdAcrescimo,
                                                fDepLanc, fDepFis, fDepGer,
                                                dDataMov,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao');
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetária da Depreciação do Bem
            //----------------------------------------------------------------------------
            if (fCmDep <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                36, dDataMov, iIdAcrescimo,
                                                fCmDep, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao');
            end;
            //----------------------------------------------------------------------------
            // Atualiza a tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            if not AtualizaSaldoContabBem(iModulo,iEmpresaProp,iIdBem,
                                          dDataMov,
                                          fValOrg,fCmBem,fDepLanc,fCmDep,
                                          0,0,0,0,
                                          0,0,0,0,
                                          0) then
               Raise eExcessaoCAF.Create('Desmembramento-Acrescimo : AtualizaSaldoContabBem');
            //----------------------------------------------------------------------------
            qryAcrescimo.Next;
         end;
      end;
      //==================================================================================
      // Executa a Baixa do Bem desmembrado
      //==================================================================================
      if qryBem.FieldByName('PROPBAIXA').IsNull then
         fPropBaixar := 100
      else
         fPropBaixar := 100 - qryBem.FieldByName('PROPBAIXA').AsFloat;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao de Baixa por Desmembramento - 13
      //----------------------------------------------------------------------------------
      fBaixaB  := qryBem.FieldByName('VALORG').asFloat * (fPropBaixar / 100);
      fBaixaBF := qryBem.FieldByName('VALFIS').asFloat * (fPropBaixar / 100);
      fBaixaBG := qryBem.FieldByName('VALGER').asFloat * (fPropBaixar / 100);
      //----------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 13, dDataMov,
                                       -1,
                                       fBaixaB, fBaixaBF, fBaixaBG,
                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 13');
      //----------------------------------------------------------------------------------
      // Registra o IdMovimentacao para retorno da função
      //----------------------------------------------------------------------------------
      Result := iSeqHist;
      //----------------------------------------------------------------------------------
      // Registra os bens gerados na Tabela DESMEMBRAMENTO
      //----------------------------------------------------------------------------------
      for iAux := 0 to High(aIdBemResult) do
         if not RegistraDesmembramento(iSeqHist,aIdBemResult[iAux],aProporcoes[iAux],
                                       bMostraMsg) then
            Raise eExcessaoCAF.Create('Desmembramento : RegistraDesmembramento - 13');
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 25
      //----------------------------------------------------------------------------------
      fBaixaCM := qryBem.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
      if (fBaixaCM <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 25, dDataMov,
                                          -1,
                                          fBaixaCM, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 25');
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 24
      //----------------------------------------------------------------------------------
      fBaixaD  := qryBem.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100);
      fBaixaDF := qryBem.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100);
      fBaixaDG := qryBem.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100);
      if (fBaixaD <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 24, dDataMov,
                                          -1,
                                          fBaixaD, fBaixaDF, fBaixaDG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 24');
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 26
      //----------------------------------------------------------------------------------
      fBaixaCMD := qryBem.FieldByName('CMDEP').asFloat * (fPropBaixar / 100);
      if (fBaixaCMD <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 26, dDataMov,
                                          -1,
                                          fBaixaCMD, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 26');
      end;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,
                                    dDataMov,
                                    (fBaixaB * -1),(fBaixaCM  * -1),
                                    (fBaixaD * -1),(fBaixaCMD * -1),
                                    0,0,0,0,
                                    0,0,0,0,
                                    0) then
         Raise eExcessaoCAF.Create('Desmembramento-Baixa : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      // Registra as alteracoes na Tabela de Bens
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('VALORG').asFloat  := qryBem.FieldByName('VALORG').asFloat  - fBaixaB;
      qryBem.FieldByName('VALFIS').asFloat  := qryBem.FieldByName('VALFIS').asFloat  - fBaixaBF;
      qryBem.FieldByName('VALGER').asFloat  := qryBem.FieldByName('VALGER').asFloat  - fBaixaBG;
      qryBem.FieldByName('DEPLANC').asFloat := qryBem.FieldByName('DEPLANC').asFloat - fBaixaD;
      qryBem.FieldByName('DEPFIS').asFloat  := qryBem.FieldByName('DEPFIS').asFloat  - fBaixaDF;
      qryBem.FieldByName('DEPGER').asFloat  := qryBem.FieldByName('DEPGER').asFloat  - fBaixaDG;
      qryBem.FieldByName('CMBEM').asFloat   := qryBem.FieldByName('CMBEM').asFloat   - fBaixaCM;
      qryBem.FieldByName('CMDEP').asFloat   := qryBem.FieldByName('CMDEP').asFloat   - fBaixaCMD;
      qryBem.FieldByName('BAIXATOTAL').AsString := 'S';
      qryBem.FieldByName('PROPBAIXA').AsFloat := 100;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // BAIXA AS REAVALIACOES
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 20
         //-------------------------------------------------------------------------------
         fBaixaB  := qryReavaliacao.FieldByName('VALORG').asFloat * (fPropBaixar / 100);
         fBaixaBF := qryReavaliacao.FieldByName('VALFIS').asFloat * (fPropBaixar / 100);
         fBaixaBG := qryReavaliacao.FieldByName('VALGER').asFloat * (fPropBaixar / 100);
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 20, dDataMov,
                                          qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                          fBaixaB, fBaixaBF, fBaixaBG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 20');
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 28
         //-------------------------------------------------------------------------------
         fBaixaCM := qryReavaliacao.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 28, dDataMov,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 28');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 27
         //-------------------------------------------------------------------------------
         fBaixaD  := qryReavaliacao.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100);
         fBaixaDF := qryReavaliacao.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100);
         fBaixaDG := qryReavaliacao.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100);
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 27, dDataMov,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaD, fBaixaDF, fBaixaDG,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 27');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 29
         //-------------------------------------------------------------------------------
         fBaixaCMD := qryReavaliacao.FieldByName('CMDEP').asFloat * (fPropBaixar / 100);
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 29, dDataMov,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCMD, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 29');
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if (qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0) then
            if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem, dDataMov,
                                          0,0,0,0,
                                          (fBaixaB * -1),(fBaixaCM  * -1),
                                          (fBaixaD * -1),(fBaixaCMD * -1),
                                          0,0,0,0,
                                          0) then
               Raise eExcessaoCAF.Create('Desmembramento-Baixa : AtualizaSaldoContabBem')
         else
            if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem, dDataMov,
                                          0,0,0,0,
                                          0,0,0,0,
                                          (fBaixaB * -1),(fBaixaCM  * -1),
                                          (fBaixaD * -1),(fBaixaCMD * -1),
                                          0) then
               Raise eExcessaoCAF.Create('Desmembramento-Baixa : AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Reavaliações
         //-------------------------------------------------------------------------------
         qryReavaliacao.Edit;
         qryReavaliacao.FieldByName('VALORG').asFloat  := qryReavaliacao.FieldByName('VALORG').asFloat  - fBaixaB;
         qryReavaliacao.FieldByName('VALFIS').asFloat  := qryReavaliacao.FieldByName('VALFIS').asFloat  - fBaixaBF;
         qryReavaliacao.FieldByName('VALGER').asFloat  := qryReavaliacao.FieldByName('VALGER').asFloat  - fBaixaBG;
         qryReavaliacao.FieldByName('DEPLANC').asFloat := qryReavaliacao.FieldByName('DEPLANC').asFloat - fBaixaD;
         qryReavaliacao.FieldByName('DEPFIS').asFloat  := qryReavaliacao.FieldByName('DEPFIS').asFloat  - fBaixaDF;
         qryReavaliacao.FieldByName('DEPGER').asFloat  := qryReavaliacao.FieldByName('DEPGER').asFloat  - fBaixaDG;
         qryReavaliacao.FieldByName('CMBEM').asFloat   := qryReavaliacao.FieldByName('CMBEM').asFloat   - fBaixaCM;
         qryReavaliacao.FieldByName('CMDEP').asFloat   := qryReavaliacao.FieldByName('CMDEP').asFloat   - fBaixaCMD;
         qryReavaliacao.Post;
         qryReavaliacao.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // BAIXA OS ACRÉSCIMOS DE VALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 37
         //-------------------------------------------------------------------------------
         fBaixaB  := qryAcrescimo.FieldByName('VALORG').asFloat * (fPropBaixar / 100);
         fBaixaBF := qryAcrescimo.FieldByName('VALFIS').asFloat * (fPropBaixar / 100);
         fBaixaBG := qryAcrescimo.FieldByName('VALGER').asFloat * (fPropBaixar / 100);
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 37, dDataMov,
                                          qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                          fBaixaB, fBaixaBF, fBaixaBG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 37');
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 38
         //-------------------------------------------------------------------------------
         fBaixaCM := qryAcrescimo.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 38, dDataMov,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 38');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 39
         //-------------------------------------------------------------------------------
         fBaixaD  := qryAcrescimo.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100);
         fBaixaDF := qryAcrescimo.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100);
         fBaixaDG := qryAcrescimo.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100);
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 39, dDataMov,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaD, fBaixaDF, fBaixaDG,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 39');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 40
         //-------------------------------------------------------------------------------
         fBaixaCMD := qryAcrescimo.FieldByName('CMDEP').asFloat * (fPropBaixar / 100);
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 40, dDataMov,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaCMD, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 40');
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem, dDataMov,
                                       (fBaixaB * -1),(fBaixaCM  * -1),
                                       (fBaixaD * -1),(fBaixaCMD * -1),
                                       0,0,0,0,
                                       0,0,0,0,
                                       0) then
            Raise eExcessaoCAF.Create('Desmembramento-Baixa : AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Acrescimos de Valor
         //-------------------------------------------------------------------------------
         qryAcrescimo.Edit;
         qryAcrescimo.FieldByName('VALORG').asFloat  := qryAcrescimo.FieldByName('VALORG').asFloat  - fBaixaB;
         qryAcrescimo.FieldByName('VALFIS').asFloat  := qryAcrescimo.FieldByName('VALFIS').asFloat  - fBaixaBF;
         qryAcrescimo.FieldByName('VALGER').asFloat  := qryAcrescimo.FieldByName('VALGER').asFloat  - fBaixaBG;
         qryAcrescimo.FieldByName('DEPLANC').asFloat := qryAcrescimo.FieldByName('DEPLANC').asFloat - fBaixaD;
         qryAcrescimo.FieldByName('DEPFIS').asFloat  := qryAcrescimo.FieldByName('DEPFIS').asFloat  - fBaixaDF;
         qryAcrescimo.FieldByName('DEPGER').asFloat  := qryAcrescimo.FieldByName('DEPGER').asFloat  - fBaixaDG;
         qryAcrescimo.FieldByName('CMBEM').asFloat   := qryAcrescimo.FieldByName('CMBEM').asFloat   - fBaixaCM;
         qryAcrescimo.FieldByName('CMDEP').asFloat   := qryAcrescimo.FieldByName('CMDEP').asFloat   - fBaixaCMD;
         qryAcrescimo.Post;
         qryAcrescimo.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
// Função que registra os bens gerados pelo desmembramento
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iSeqHist       : id da Movimentacao                            (IDMOVIMENTACAO)
//    iBemResultante : id do bem gerado                              (IDBEMRESULTANTE)
//    fProporcao     : Percentual do bem original                    (PROPORCAO)
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraDesmembramento(iSeqHist,
                                           iBemResultante : Integer;
                                           fProporcao : Extended;
                                           bMostraMsg : Boolean) : Boolean;

var
   qryDesmembramento : TwwQuery;

begin
   qryDesmembramento := TwwQuery(dtmAtivoFixo.qryRegistraDesmembramento);
   //-------------------------------------------------------------------------------------
   try
      with qryDesmembramento do
      begin
         ParamByName('IDMOVIMENTACAO').AsInteger  := iSeqHist;
         ParamByName('IDBEMRESULTANTE').AsInteger := iBemResultante;
         ParamByName('PROPORCAO').AsFloat         := fProporcao;
         ExecSQL;
      end;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
   end;
end;
//========================================================================================
// Função que Estorna o desmembramento de um Bem
// Data : 26/04/2001
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo                   (Sistema.idModulo)  (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária     (Sistema.idEmpresa) (IDPESSOA)
// iBem         : id do Bem DESMEMBRADO                              (IDBEM)
// dDataMov     : Data do Desmembramento                             (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function TAtivoFixo.EstornaDesmembramento(iModulo, iEmpresaProp, iBem : Integer;
                                          dDataMov,dDataEst : tDate;
                                          bMostraMsg : boolean) : Integer;
var
   qryAux,qryBem,qryReavaliacao,
   qryAcrescimo                  : TwwQuery;
   bTransacao                    : Boolean;

begin
   with dtmAtivoFixo do
   begin
      if not qryUltMov.Prepared then
         qryUltMov.Prepare;
      if not qryBem.Prepared then
         qryBem.Prepare;
      if not qryReavaliacao.Prepared then
         qryReavaliacao.Prepare;
      if not qryAcrescimo.Prepared then
         qryAcrescimo.Prepare;
      if not qryBensResultantes.Prepared then
         qryBensResultantes.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // verifica se houve movimentação nos bens gerados pelo desmembramento
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo do
   begin
      qryBensResultantes.Close;
      qryBensResultantes.ParamByName('PIDBEMORIG').AsInteger := iBem;
      qryBensResultantes.ParamByName('PIDTIPOMOV').AsInteger := 13; // BAIXA PARA DESMEMBRAMENTO
      qryBensResultantes.Open;
      //----------------------------------------------------------------------------------
      // verifica se houve movimentação nos bens gerados pelo desmembramento
      //----------------------------------------------------------------------------------
      while not qryBensResultantes.EOF do
      begin
         qryUltMov.Close;
         qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qryUltMov.ParamByName('PIDBEM').AsInteger    := qryBensResultantes.FieldByName('IDBEM').AsInteger;
         qryUltMov.Open;
         if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
         begin
            if bMostraMsg then
               MsgDlg('Existe movimentação após o Desmembramento. ' + #13 +
                      'Consulte Histórico de Movimentações!',
                      'Erro',mtError,[mbOk],0);
            qryUltMov.Close;
            result := -1;
            exit;
         end;
         qryBensResultantes.Next;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // Remove a entrada dos bens resultantes
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryBensResultantes.Close;
         qryBensResultantes.ParamByName('PIDBEMORIG').AsInteger := iBem;
         qryBensResultantes.ParamByName('PIDTIPOMOV').AsInteger := 13; // BAIXA PARA DESMEMBRAMENTO
         qryBensResultantes.Open;
         //-------------------------------------------------------------------------------
         while not qryBensResultantes.EOF do
         begin
            //----------------------------------------------------------------------------
            // Remove os Acréscimos de Valor, se houverem
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                               ' FROM   HISTORICOMOVIMENTACAO ' +
                               ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                               '   AND (IDBEM    = ' + qryBensResultantes.FieldByName('IDBEM').AsString + ') ' +
                               '   AND (IDTIPOMOVIMENTACAO = 09)  /* ACRESCIMO DE VALOR */';
            qryAux.Open;
            while not qryAux.Eof do
            begin
               qryEstornaAcrescValor.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryEstornaAcrescValor.ExecSQL;
               qryEstornaAcrescimo.ParamByName('PIDPESSOA').AsInteger       := iEmpresaProp;
               qryEstornaAcrescimo.ParamByName('PIDBEM').AsInteger          := qryBensResultantes.FieldByName('IDBEM').AsInteger;
               qryEstornaAcrescimo.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryEstornaAcrescimo.ExecSQL;
               qryAux.Next;
            end;
            //----------------------------------------------------------------------------
            // Remove as Reavaliacoes, se houverem
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                               ' FROM   HISTORICOMOVIMENTACAO ' +
                               ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                               '   AND (IDBEM    = ' + qryBensResultantes.FieldByName('IDBEM').AsString + ')' +
                               '   AND (IDTIPOMOVIMENTACAO = 32) /* REAVALIACAO */';
            qryAux.Open;
            while not qryAux.Eof do
            begin
               qryEstornaReavaliacao.ParamByName('PIDPESSOA').AsInteger       := iEmpresaProp;
               qryEstornaReavaliacao.ParamByName('PIDBEM').AsInteger          := qryBensResultantes.FieldByName('IDBEM').AsInteger;
               qryEstornaReavaliacao.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryEstornaReavaliacao.ExecSQL;
               qryAux.Next;
            end;
            //----------------------------------------------------------------------------
            // Remove os Registros de Movimentacao Inicial do Bem
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                               ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                               '   AND (IDBEM    = ' + qryBensResultantes.FieldByName('IDBEM').AsString + ')';
            qryAux.ExecSQL;
            //----------------------------------------------------------------------------
            // Remove o Bem
            //----------------------------------------------------------------------------
            qryEstornaBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryEstornaBem.ParamByName('PIDBEM').AsInteger    := qryBensResultantes.FieldByName('IDBEM').AsInteger;
            qryEstornaBem.ExecSQL;
            //----------------------------------------------------------------------------
            // Atualiza a tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            if not AtualizaSaldoContabBem(iModulo, iEmpresaProp,
                                          qryBensResultantes.FieldByName('IDBEM').AsInteger,
                                          dDataMov,0,0,0,0,0,0,0,0,0,0,0,0,2) then
               Raise eExcessaoCAF.Create('EstornaDesmembramento : AtualizaSaldoContabBem');
            //----------------------------------------------------------------------------
            qryBensResultantes.Next;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Estorna a Baixa do Bem Original
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Estorna a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      if EstornaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),dDataEst,bMostraMsg) < 0 then
         Raise eExcessaoCAF.Create('Desmembramento : EstornaDepreciacaoProRata');
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na Tabela BEM
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO, '+
                         '        VALOFI,VALFIS,VALGER '+
                         ' FROM HISTORICOMOVIMENTACAO '+
                         ' WHERE (IDBEM    = ' + inttostr(iBem) + ') ' +
                         '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                         '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                         '   AND (IDTIPOMOVIMENTACAO IN (13,25,24,26)) ';
      qryAux.Open;
      while not qryAux.EOF do
      begin
         qryBem.Edit;
         case qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
            13 : begin
                    qryBem.FieldByName('VALORG').AsCurrency   := qryBem.FieldByName('VALORG').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    qryBem.FieldByName('VALFIS').AsCurrency   := qryBem.FieldByName('VALFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                    qryBem.FieldByName('VALGER').AsCurrency   := qryBem.FieldByName('VALGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    qryBem.FieldByName('PROPBAIXA').AsFloat   := 0;
                    qryBem.FieldByName('BAIXATOTAL').AsString := 'N';
                 end;
            25 : begin
                    qryBem.FieldByName('CMBEM').AsCurrency := qryBem.FieldByName('CMBEM').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                 end;
            24 : begin
                    qryBem.FieldByName('DEPLANC').AsCurrency := qryBem.FieldByName('DEPLANC').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    qryBem.FieldByName('DEPFIS').AsCurrency  := qryBem.FieldByName('DEPFIS').AsFloat  + qryAux.FieldByName('VALFIS').AsFloat;
                    qryBem.FieldByName('DEPGER').AsCurrency  := qryBem.FieldByName('DEPGER').AsFloat  + qryAux.FieldByName('VALGER').AsFloat;
                 end;
            26 : begin
                    qryBem.FieldByName('CMDEP').AsCurrency := qryBem.FieldByName('CMDEP').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                 end;
         end;
         //-------------------------------------------------------------------------------
         qryAux.Next;
      end;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na tabela REAVALIACAO
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         qryReavaliacao.Edit;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,PLNCODIGO,IDTIPOMOVIMENTACAO, '+
                            '        VALOFI, VALFIS, VALGER '+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDREAVALACRESC = ' + qryReavaliacao.FieldByName('IDREAVALIACAO').AsString + ')' +
                            '   AND (IDTIPOMOVIMENTACAO IN (20,28,27,29)) ';
         qryAux.Open;
         while not qryAux.EOF do
         begin
            case qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               20 : begin
                       qryReavaliacao.FieldByName('VALORG').AsCurrency := qryReavaliacao.FieldByName('VALORG').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryReavaliacao.FieldByName('VALFIS').AsCurrency := qryReavaliacao.FieldByName('VALFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryReavaliacao.FieldByName('VALGER').AsCurrency := qryReavaliacao.FieldByName('VALGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               28 : begin
                       qryReavaliacao.FieldByName('CMBEM').AsCurrency  := qryReavaliacao.FieldByName('CMBEM').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
               27 : begin
                       qryReavaliacao.FieldByName('DEPLANC').AsCurrency := qryReavaliacao.FieldByName('DEPLANC').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryReavaliacao.FieldByName('DEPFIS').AsCurrency  := qryReavaliacao.FieldByName('DEPFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryReavaliacao.FieldByName('DEPGER').AsCurrency  := qryReavaliacao.FieldByName('DEPGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               29 : begin
                       qryReavaliacao.FieldByName('CMDEP').AsCurrency := qryReavaliacao.FieldByName('CMDEP').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
            end;
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryReavaliacao.Post;
         qryReavaliacao.Next
      end;
      qryReavaliacao.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na tabela ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         qryAcrescimo.Edit;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO, PLNCODIGO, IDTIPOMOVIMENTACAO, '+
                            '        VALOFI, VALFIS, VALGER '+
                            ' FROM HISTORICOMOVIMENTACAO HM '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ') ' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '   AND (IDREAVALACRESC = ' + qryAcrescimo.FieldByName('IDACRESCIMO').AsString + ') ' +
                            '   AND (IDTIPOMOVIMENTACAO IN (37,38,39,40)) ';
         qryAux.Open;
         while not qryAux.EOF do
         begin
            case qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               37 : begin
                       qryAcrescimo.FieldByName('VALORG').AsCurrency := qryAcrescimo.FieldByName('VALORG').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryAcrescimo.FieldByName('VALFIS').AsCurrency := qryAcrescimo.FieldByName('VALFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryAcrescimo.FieldByName('VALGER').AsCurrency := qryAcrescimo.FieldByName('VALGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               38 : begin
                       qryAcrescimo.FieldByName('CMBEM').AsCurrency := qryAcrescimo.FieldByName('CMBEM').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
               39 : begin
                       qryAcrescimo.FieldByName('DEPLANC').AsCurrency := qryAcrescimo.FieldByName('DEPLANC').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryAcrescimo.FieldByName('DEPFIS').AsCurrency := qryAcrescimo.FieldByName('DEPFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryAcrescimo.FieldByName('DEPGER').AsCurrency := qryAcrescimo.FieldByName('DEPGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               40 : begin
                       qryAcrescimo.FieldByName('CMDEP').AsCurrency := qryAcrescimo.FieldByName('CMDEP').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
            end;
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryAcrescimo.Post;
         qryAcrescimo.Next
      end;
      qryAcrescimo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE '+
                            ' FROM BAIXABEM '+
                            ' WHERE (IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                            '                           FROM HISTORICOMOVIMENTACAO '+
                            '                           WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '                             AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '                             AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '                             AND (IDTIPOMOVIMENTACAO = 13)))';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE '+
                            ' FROM DESMEMBRAMENTO '+
                            ' WHERE (IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                            '                           FROM HISTORICOMOVIMENTACAO '+
                            '                           WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '                             AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '                             AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '                             AND (IDTIPOMOVIMENTACAO = 13)))';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE '+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (13,25,24,26,20,28,27,29,37,38,39,40))';
         qryAux.ExecSQL;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,
                                    dDataMov,0,0,0,0,0,0,0,0,0,0,0,0,2) then
         Raise eExcessaoCAF.Create('EstornaDesmembramento : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      Result := 1
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
{/========================================================================================
// Função que executa o Remembramento de varios bens em um bem
// Data : 26/04/2001
//----------------------------------------------------------------------------------------
// Obs.: A Função retorna o id da movimentação que gerou a entrada do novo bem
//----------------------------------------------------------------------------------------
//
//    iModulo        : id do módulo que incluiu o bem (Sistema.idModulo)(IDMODULO)
//    iEmpresaProp   : id da empresa proprietária (Sistema.idEmpresa)   (IDPESSOA)
//    aIdBem         : ARRAY DINÂMICO contendo os id's dos bens selecionados
//    dDataMov       : Data do remembramento                            (DATAMOVIMENTACAO)
//    iQtdBens       : Quantidade de bens que devem ser gerados
//    fPlaca         : Número da placa patrimonial do bens a ser gerado (PLACA)
//    sDesBem        : Descrição do bem a ser gerado                    (DESBEM)
//    iBemResult     : id do bem a ser desmembrado                      (IDBEM)
//
//    bMostraMsg     : True  - mostra mensagens da Função
//                     False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function TAtivoFixo.ExecutaRemembramento(iModulo, iEmpresaProp : Integer;
                                         aIdBem : Array of Integer;
                                         dDataMov : tDate; iQtdBens : Integer;
                                         fPlaca : Double; sDesBem : String;
                                         bMostraMsg  : boolean;
                                         Var iBemResult : Integer) : Integer;

var
   iIdBem, iSeqHist, iAux, iProcBem,
   iTipoMovimentacao, iAux2,
   iIdReavaliacao, iIdAcrescimo          : Integer;
   qryBem, qryReavaliacao, qryAcrescimo,
   qryUltMov, qryAux                     : TwwQuery;
   bTransacao                            : Boolean;
   fValOrg, fCmBem, fDepLanc, fCmDep,
   fValFis, fValGer, fDepFis, fDepGer,
   fBaixaB, fBaixaBF, fBaixaBG,
   fBaixaCM, fBaixaD, fBaixaDF,
   fBaixaDG, fBaixaCMD,
   fDepCmBem, fDepDepLanc, fDepCmDep     : Extended;

begin
   with dtmAtivoFixo do
   begin
      if not qryUltMov.Prepared then
         qryUltMov.Prepare;
      if not qryBem.Prepared then
         qryBem.Prepare;
      if not qryReavaliacao.Prepared then
         qryReavaliacao.Prepare;
      if not qryAcrescimo.Prepared then
         qryAcrescimo.Prepare;
      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;
      if not qryRegistraBaixaBem.Prepared then
         qryRegistraBaixaBem.Prepare;
      if not qryRegistraAcresc.Prepared then
         qryRegistraAcresc.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // Valida os Parâmetros obrigatórios para o Remembramento
   //-------------------------------------------------------------------------------------
   if ((High(aIdBens)) + 1 <> iQtdBens) then
   begin
      if bMostraMsg then
         MsgDlg('Não existem bens suficientes para a quantidade de'+
                'bens a ser fornecida!', 'Erro', mtError, [mbOk], 0);
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se existe Bem duplicado no array enviado
   //-------------------------------------------------------------------------------------
   for iAux := 0 to (High(aIdBem) - 1) do
      for iAux2 := (iAux + 1) to High(aIdBem) do
          if aIdBem[iAux] = aIdBem[iAux2] then
          begin
             if bMostraMsg then
                MsgDlg('Um dos bens selecionados está duplicado!', 'Erro', mtError, [mbOk], 0);
             Result := -1;
             exit;
          end;
   //-------------------------------------------------------------------------------------
   // Verifica se a placa do bem novo já existe no banco
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Text := ' SELECT IDBEM ' +
                      ' FROM BEM ' +
                      ' WHERE PLACA = ' + floattostr(fPlaca);
   qryAux.Open;
   if not qryAux.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('A placa (' + floattostr(fPlaca) + ') fornecida para a '+
                'geração do novo bem já existe!', 'Erro', mtError, [mbOk], 0);
      Result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   for iAux := 0 to High(aIdBem) do
   begin
      qryUltMov.Close;
      qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryUltMov.ParamByName('PIDBEM').AsInteger    := aIdBem[iAux];
      qryUltMov.Open;
      if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
      begin
         if bMostraMsg then
            MsgDlg('Um dos bens selecionados possui movimentação após a data do remembramento. '+
                   'Consulte Historico de Movimentações!',
                   'Erro', mtError, [mbOk], 0);
         result := -1;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //==================================================================================
      // EXECUTA A GERACAO DO NOVO BEM
      //==================================================================================
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fCmDep   := 0;
      fValFis  := 0;
      fValGer  := 0;
      fDepFis  := 0;
      fDepGer  := 0;
      for iProcBem := 0 to (iQtdBens - 1) do
      begin
         qryBem.Close;
         qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qryBem.ParamByName('PIDBEM').AsInteger    := aIdBem[iProcBem];
         qryBem.Open;
         qryReavaliacao.Close;
         qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qryReavaliacao.ParamByName('PIDBEM').AsInteger    := aIdBem[iProcBem];
         qryReavaliacao.Open;
         qryAcrescimo.Close;
         qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qryAcrescimo.ParamByName('PIDBEM').AsInteger    := aIdBem[iProcBem];
         qryAcrescimo.Open;
         //-------------------------------------------------------------------------------
         // Calcula a Depreciacao até o Dia da Movimentacao - 1
         //-------------------------------------------------------------------------------
         fDepCmBem   := 0;
         fDepDepLanc := 0;
         fDepCmDep   := 0;
         if (qryBem.FieldByName('CONTROLE').AsString = 'T') then
            if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),bMostraMsg,
                                      fDepCmBem, fDepDepLanc, fDepCmDep) then
               Raise eExcessaoCAF.Create('Baixa : ExecutaDepreciacao');
         //-------------------------------------------------------------------------------
         // Acumula os valores para a geração do Novo Bem
         //-------------------------------------------------------------------------------
         fValHist := fValHist + qryBem.FieldByName('VALHISTORICO').AsCurrency;
         fValOrg  := fValOrg  + qryBem.FieldByName('VALORG').AsCurrency;
         fCmBem   := fCmBem   + qryBem.FieldByName('CMBEM').AsCurrency;
         fDepLanc := fDepLanc + qryBem.FieldByName('DEPLANC').AsCurrency;
         fCmDep   := fCmDep   + qryBem.FieldByName('CMDEP').AsCurrency;
         fValFis  := fValFis  + qryBem.FieldByName('VALFIS').AsCurrency;
         fValGer  := fValGer  + qryBem.FieldByName('VALGER').AsCurrency;
         fDepFis  := fDepFis  + qryBem.FieldByName('DEPFIS').AsCurrency;
         fDepGer  := fDepGer  + qryBem.FieldByName('DEPGER').AsCurrency;
      end;
      //----------------------------------------------------------------------------------
      iBemResult := RegistraEntrada(-1,
                                    Sistema.IdModulo,
                                    Sistema.IdEmpresa,
                                    qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                    qryBem.FieldByName('IDTERCEIRO').AsInteger,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                    qryBem.FieldByName('UNIDNEGOC').AsInteger,
                                    qryBem.FieldByName('IDCLASSEBEM').AsInteger,
                                    qryBem.FieldByName('IDITENSRECDEV').AsInteger,
                                    qryBem.FieldByName('IDFORNSERV').AsInteger,
                                    qryBem.FieldByName('IDIMAGEM').AsInteger,
                                    fPlaca,
                                    qryBem.FieldByName('IDSITUACAO').AsInteger,
                                    qryBem.FieldByName('REGISTRO').AsString,
                                    qryBem.FieldByName('CONTROLE').AsString,
                                    aDesBem[iProcBem],
                                    qryBem.FieldByName('IDNOTA').AsString,
                                    qryBem.FieldByName('COMPLNOTA').AsString,
                                    qryBem.FieldByName('NUMSERIE').AsString,
                                    qryBem.FieldByName('DTANOTA').AsDateTime,
                                    dDataMov, // dDataInclusao
                                    fValHist,
                                    fValOrg,
                                    fCmBem,
                                    qryBem.FieldByName('DATAULTDEP').AsDateTime,
                                    fDepLanc,
                                    qryBem.FieldByName('TAXADEP').AsFloat,
                                    fDepLanc,
                                    fCmDep,
                                    qryBem.FieldByName('PROPBAIXA').AsFloat,
                                    qryBem.FieldByName('PRIORIDADE').AsInteger,
                                    qryBem.FieldByName('DATAINSTALACAO').AsDateTime,
                                    qryBem.FieldByName('DATATERMINOGAR').AsDateTime,
                                    fValFis,
                                    fValGer,
                                    fDepFis,
                                    fDepGer,
                                    qryBem.FieldByName('BAIXATOTAL').AsString,
                                    qryBem.FieldByName('IDOPCIONAL').AsString,
                                    qryBem.FieldByName('PROCESSOAQUIS').AsString,
                                    qryBem.FieldByName('EMPENHOAQUIS').AsString,
                                    qryBem.FieldByName('PUBAUTOR').AsString,
                                    qryBem.FieldByName('PUBEDITORA').AsString,
                                    qryBem.FieldByName('PUBANO').AsString,
                                    bMostraMsg);
      if iIdBem = -1 then
         Raise eExcessaoCAF.Create('Entrada : RegistraBem');
         //-------------------------------------------------------------------------------
         // Registra no Array de Saída o Id do Bem Gerado
         //-------------------------------------------------------------------------------
         aIdBemResult[iProcBem] := iIdBem;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Entrada do Bem por Desmembramento
         //-------------------------------------------------------------------------------
         iTipoMovimentacao := 07;
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                          iTipoMovimentacao, dDataMov, -1,
                                          fValOrg, fValFis, fValGer,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if (iSeqHist = -1) then
            Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ValOrg)');
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria Inicial do Bem
         //-------------------------------------------------------------------------------
         if (fCmBem > 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             15, dDataMov, -1,
                                             fCmBem, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (CmBem)');
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if (fDepLanc > 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             17, dDataMov, -1,
                                             fDepLanc, fDepFis, fDepGer,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ValDepIni)');
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if (fCmDep > 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             21, dDataMov, -1,
                                             fCmDep, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao');
         end;
         //-------------------------------------------------------------------------------
         // Processa as Reavaliações do Bem Desmembrado
         //-------------------------------------------------------------------------------
         qryReavaliacao.First;
         while not qryReavaliacao.EOF do
         begin
            fValOrg  := qryReavaliacao.FieldByName('VALORG').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fCmBem   := qryReavaliacao.FieldByName('CMBEM').AsCurrency   * (aProporcoes[iProcBem] / 100);
            fDepLanc := qryReavaliacao.FieldByName('DEPLANC').AsCurrency * (aProporcoes[iProcBem] / 100);
            fCmDep   := qryReavaliacao.FieldByName('CMDEP').AsCurrency   * (aProporcoes[iProcBem] / 100);
            fValFis  := qryReavaliacao.FieldByName('VALFIS').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fValGer  := qryReavaliacao.FieldByName('VALGER').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fDepFis  := qryReavaliacao.FieldByName('DEPFIS').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fDepGer  := qryReavaliacao.FieldByName('DEPGER').AsCurrency  * (aProporcoes[iProcBem] / 100);
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT TAXADEPANT,VALORGLAUDO,OBSREAVAL ' +
                               ' FROM HISTORICOMOVIMENTACAO ' +
                               ' WHERE IDMOVIMENTACAO = ' + qryReavaliacao.FieldByName('IDMOVIMENTACAO').AsString;
            qryAux.Open;
            //----------------------------------------------------------------------------
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             32, qryReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime, -1,
                                             fValOrg, fValFis, fValGer,
                                             -1,-1,-1,-1,-1,-1,-1,-1,
                                             qryAux.FieldByName('TAXADEPANT').AsFloat,
                                             qryAux.FieldByName('VALORGLAUDO').AsFloat,
                                             qryAux.FieldByName('OBSREAVAL').AsString,
                                             bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavValOrg)');
            qryAux.Close;
            //----------------------------------------------------------------------------
            iIdReavaliacao := RegistraReavaliacao(iIdBem,iEmpresaProp,iSeqHist,
                              fValOrg,fValFis,fValGer,fCmBem,
                              fDepLanc,fDepFis,fDepGer,fCmDep,
                              qryReavaliacao.FieldByName('TAXADEP').AsFloat,
                              qryReavaliacao.FieldByName('DATAREAVALIACAO').AsFloat,
                              qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger,
                              dDataMov - 1, // DATAULTDEP
                              qryReavaliacao.FieldByName('FLGDEPREC').AsInteger,
                              bMostraMsg);
            if iIdReavaliacao <= 0 then
               Raise eExcessaoCAF.Create('Reavaliacao : RegistraReavaliacao');
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetaria da Reavaliação do Bem
            //----------------------------------------------------------------------------
            if (fCmBem <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                22, dDataMov, iIdReavaliacao,
                                                fCmBem, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavCmBem)');
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Depreciação da Reavaliacao do Bem
            //----------------------------------------------------------------------------
            if (fDepLanc <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                33, dDataMov, iIdReavaliacao,
                                                fDepLanc, fDepFis, fDepGer,
                                                dDataMov,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavValDepIni)');
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetária da Depreciação do Bem
            //----------------------------------------------------------------------------
            if (fCmDep <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                19, dDataMov, iIdReavaliacao,
                                                fCmDep, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao (ReavCmDep)');
            end;
            //----------------------------------------------------------------------------
            qryReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // Processa os Acréscimos de Valor do Bem Desmembrado
         //-------------------------------------------------------------------------------
         qryAcrescimo.First;
         while not qryAcrescimo.EOF do
         begin
            fValOrg  := qryAcrescimo.FieldByName('VALORG').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fCmBem   := qryAcrescimo.FieldByName('CMBEM').AsCurrency   * (aProporcoes[iProcBem] / 100);
            fDepLanc := qryAcrescimo.FieldByName('DEPLANC').AsCurrency * (aProporcoes[iProcBem] / 100);
            fCmDep   := qryAcrescimo.FieldByName('CMDEP').AsCurrency   * (aProporcoes[iProcBem] / 100);
            fValFis  := qryAcrescimo.FieldByName('VALFIS').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fValGer  := qryAcrescimo.FieldByName('VALGER').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fDepFis  := qryAcrescimo.FieldByName('DEPFIS').AsCurrency  * (aProporcoes[iProcBem] / 100);
            fDepGer  := qryAcrescimo.FieldByName('DEPGER').AsCurrency  * (aProporcoes[iProcBem] / 100);
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT IDTIPODESPESA, OBS ' +
                               ' FROM ACRESCVALOR ' +
                               ' WHERE IDMOVIMENTACAO = ' + qryAcrescimo.FieldByName('IDMOVIMENTACAO').AsString;
            qryAux.Open;
            //----------------------------------------------------------------------------
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             09, qryAcrescimo.FieldByName('DATAACRESCIMO').AsDateTime, - 1,
                                             fValOrg, fValFis, fValGer,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',
                                             bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Acréscimo : RegistraMovimentacao');
            qryAux.Close;
            //----------------------------------------------------------------------------
            iIdAcrescimo := RegistraAcrescimo(iIdBem, iEmpresaProp, iSeqHist,
                            qryAcrescimo.FieldByName('TAXADEP').AsFloat,
                            qryAcrescimo.FieldByName('DATAACRESCIMO').AsFloat,
                            fValOrg,fValFis,fValGer,fCmBem,
                            fCmDep,fDepLanc,fDepFis,fDepGer,
                            qryAcrescimo.FieldByName('FLGDEPREC').AsInteger,
                            qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime,
                            bMostraMsg);
            if iIdAcrescimo <= 0 then
               Raise eExcessaoCAF.Create('Acréscimo : RegistraReavaliacao');
            //----------------------------------------------------------------------------
            if not RegistraAcresc(iSeqHist,
                                  qryAux.FieldByName('IDTIPODESPESA').AsInteger,
                                  qryAux.FieldByName('OBS').AsString,
                                  bMostraMsg) then
               Raise eExcessaoCAF.Create('Acréscimo : RegistraAcresc');
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetaria da Reavaliação do Bem
            //----------------------------------------------------------------------------
            if (fCmBem <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                34, dDataMov, iIdAcrescimo,
                                                fCmBem, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao');
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Depreciação da Reavaliacao do Bem
            //----------------------------------------------------------------------------
            if (fDepLanc <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                35, dDataMov, iIdAcrescimo,
                                                fDepLanc, fDepFis, fDepGer,
                                                dDataMov,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao');
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetária da Depreciação do Bem
            //----------------------------------------------------------------------------
            if (fCmDep <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                36, dDataMov, iIdAcrescimo,
                                                fCmDep, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',bMostraMsg);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Entrada : RegistraMovimentacao');
            end;
            //----------------------------------------------------------------------------
            qryAcrescimo.Next;
         end;
      end;
      //==================================================================================
      // Executa a Baixa do Bem desmembrado
      //==================================================================================
      if qryBem.FieldByName('PROPBAIXA').IsNull then
         fPropBaixar := 100
      else
         fPropBaixar := 100 - qryBem.FieldByName('PROPBAIXA').AsFloat;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao de Baixa por Desmembramento - 13
      //----------------------------------------------------------------------------------
      fBaixaB  := qryBem.FieldByName('VALORG').asFloat * (fPropBaixar / 100);
      fBaixaBF := qryBem.FieldByName('VALFIS').asFloat * (fPropBaixar / 100);
      fBaixaBG := qryBem.FieldByName('VALGER').asFloat * (fPropBaixar / 100);
      //----------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 13, dDataMov,
                                       -1,
                                       fBaixaB, fBaixaBF, fBaixaBG,
                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 13');
      //----------------------------------------------------------------------------------
      // Registra o IdMovimentacao para retorno da função
      //----------------------------------------------------------------------------------
      Result := iSeqHist;
      //----------------------------------------------------------------------------------
      // Registra os bens gerados na Tabela DESMEMBRAMENTO
      //----------------------------------------------------------------------------------
      for iAux := 0 to High(aIdBemResult) do
         if not RegistraDesmembramento(iSeqHist,aIdBemResult[iAux],aProporcoes[iAux],
                                       bMostraMsg) then
            Raise eExcessaoCAF.Create('Desmembramento : RegistraDesmembramento - 13');
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 25
      //----------------------------------------------------------------------------------
      fBaixaCM := qryBem.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
      if (fBaixaCM <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 25, dDataMov,
                                          -1,
                                          fBaixaCM, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 25');
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 24
      //----------------------------------------------------------------------------------
      fBaixaD  := qryBem.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100);
      fBaixaDF := qryBem.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100);
      fBaixaDG := qryBem.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100);
      if (fBaixaD <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 24, dDataMov,
                                          -1,
                                          fBaixaD, fBaixaDF, fBaixaDG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 24');
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 26
      //----------------------------------------------------------------------------------
      fBaixaCMD := qryBem.FieldByName('CMDEP').asFloat * (fPropBaixar / 100);
      if (fBaixaCMD <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 26, dDataMov,
                                          -1,
                                          fBaixaCMD, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 26');
      end;
      //----------------------------------------------------------------------------------
      // Registra as alteracoes na Tabela de Bens
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('VALORG').asFloat  := qryBem.FieldByName('VALORG').asFloat  - fBaixaB;
      qryBem.FieldByName('VALFIS').asFloat  := qryBem.FieldByName('VALFIS').asFloat  - fBaixaBF;
      qryBem.FieldByName('VALGER').asFloat  := qryBem.FieldByName('VALGER').asFloat  - fBaixaBG;
      qryBem.FieldByName('DEPLANC').asFloat := qryBem.FieldByName('DEPLANC').asFloat - fBaixaD;
      qryBem.FieldByName('DEPFIS').asFloat  := qryBem.FieldByName('DEPFIS').asFloat  - fBaixaDF;
      qryBem.FieldByName('DEPGER').asFloat  := qryBem.FieldByName('DEPGER').asFloat  - fBaixaDG;
      qryBem.FieldByName('CMBEM').asFloat   := qryBem.FieldByName('CMBEM').asFloat   - fBaixaCM;
      qryBem.FieldByName('CMDEP').asFloat   := qryBem.FieldByName('CMDEP').asFloat   - fBaixaCMD;
      qryBem.FieldByName('BAIXATOTAL').AsString := 'S';
      qryBem.FieldByName('PROPBAIXA').AsFloat := 100;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // BAIXA AS REAVALIACOES
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 20
         //-------------------------------------------------------------------------------
         fBaixaB  := qryReavaliacao.FieldByName('VALORG').asFloat * (fPropBaixar / 100);
         fBaixaBF := qryReavaliacao.FieldByName('VALFIS').asFloat * (fPropBaixar / 100);
         fBaixaBG := qryReavaliacao.FieldByName('VALGER').asFloat * (fPropBaixar / 100);
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 20, dDataMov,
                                          qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                          fBaixaB, fBaixaBF, fBaixaBG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 20');
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 28
         //-------------------------------------------------------------------------------
         fBaixaCM := qryReavaliacao.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 28, dDataMov,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 28');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 27
         //-------------------------------------------------------------------------------
         fBaixaD  := qryReavaliacao.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100);
         fBaixaDF := qryReavaliacao.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100);
         fBaixaDG := qryReavaliacao.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100);
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 27, dDataMov,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaD, fBaixaDF, fBaixaDG,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 27');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 29
         //-------------------------------------------------------------------------------
         fBaixaCMD := qryReavaliacao.FieldByName('CMDEP').asFloat * (fPropBaixar / 100);
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 29, dDataMov,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCMD, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 29');
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Reavaliações
         //-------------------------------------------------------------------------------
         qryReavaliacao.Edit;
         qryReavaliacao.FieldByName('VALORG').asFloat  := qryReavaliacao.FieldByName('VALORG').asFloat  - fBaixaB;
         qryReavaliacao.FieldByName('VALFIS').asFloat  := qryReavaliacao.FieldByName('VALFIS').asFloat  - fBaixaBF;
         qryReavaliacao.FieldByName('VALGER').asFloat  := qryReavaliacao.FieldByName('VALGER').asFloat  - fBaixaBG;
         qryReavaliacao.FieldByName('DEPLANC').asFloat := qryReavaliacao.FieldByName('DEPLANC').asFloat - fBaixaD;
         qryReavaliacao.FieldByName('DEPFIS').asFloat  := qryReavaliacao.FieldByName('DEPFIS').asFloat  - fBaixaDF;
         qryReavaliacao.FieldByName('DEPGER').asFloat  := qryReavaliacao.FieldByName('DEPGER').asFloat  - fBaixaDG;
         qryReavaliacao.FieldByName('CMBEM').asFloat   := qryReavaliacao.FieldByName('CMBEM').asFloat   - fBaixaCM;
         qryReavaliacao.FieldByName('CMDEP').asFloat   := qryReavaliacao.FieldByName('CMDEP').asFloat   - fBaixaCMD;
         qryReavaliacao.Post;
         qryReavaliacao.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // BAIXA OS ACRÉSCIMOS DE VALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 37
         //-------------------------------------------------------------------------------
         fBaixaB  := qryAcrescimo.FieldByName('VALORG').asFloat * (fPropBaixar / 100);
         fBaixaBF := qryAcrescimo.FieldByName('VALFIS').asFloat * (fPropBaixar / 100);
         fBaixaBG := qryAcrescimo.FieldByName('VALGER').asFloat * (fPropBaixar / 100);
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 37, dDataMov,
                                          qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                          fBaixaB, fBaixaBF, fBaixaBG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 37');
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 38
         //-------------------------------------------------------------------------------
         fBaixaCM := qryAcrescimo.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 38, dDataMov,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 38');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 39
         //-------------------------------------------------------------------------------
         fBaixaD  := qryAcrescimo.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100);
         fBaixaDF := qryAcrescimo.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100);
         fBaixaDG := qryAcrescimo.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100);
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 39, dDataMov,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaD, fBaixaDF, fBaixaDG,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 39');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 40
         //-------------------------------------------------------------------------------
         fBaixaCMD := qryAcrescimo.FieldByName('CMDEP').asFloat * (fPropBaixar / 100);
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 40, dDataMov,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaCMD, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',bMostraMsg);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 40');
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Acrescimos de Valor
         //-------------------------------------------------------------------------------
         qryAcrescimo.Edit;
         qryAcrescimo.FieldByName('VALORG').asFloat  := qryAcrescimo.FieldByName('VALORG').asFloat  - fBaixaB;
         qryAcrescimo.FieldByName('VALFIS').asFloat  := qryAcrescimo.FieldByName('VALFIS').asFloat  - fBaixaBF;
         qryAcrescimo.FieldByName('VALGER').asFloat  := qryAcrescimo.FieldByName('VALGER').asFloat  - fBaixaBG;
         qryAcrescimo.FieldByName('DEPLANC').asFloat := qryAcrescimo.FieldByName('DEPLANC').asFloat - fBaixaD;
         qryAcrescimo.FieldByName('DEPFIS').asFloat  := qryAcrescimo.FieldByName('DEPFIS').asFloat  - fBaixaDF;
         qryAcrescimo.FieldByName('DEPGER').asFloat  := qryAcrescimo.FieldByName('DEPGER').asFloat  - fBaixaDG;
         qryAcrescimo.FieldByName('CMBEM').asFloat   := qryAcrescimo.FieldByName('CMBEM').asFloat   - fBaixaCM;
         qryAcrescimo.FieldByName('CMDEP').asFloat   := qryAcrescimo.FieldByName('CMDEP').asFloat   - fBaixaCMD;
         qryAcrescimo.Post;
         qryAcrescimo.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;}
//========================================================================================
// Funcao que verifica se o Ativo Fixo está integrado a Contabilidade
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iEmpresaProp   :   id da Empresa Proprietária (Sistema.idEmpresa)        (IDPESSOA)
//========================================================================================
function TAtivoFixo.IntegraContab(iEmpresaProp : Integer) : boolean;
begin
   with dtmAtivoFixo.qryParamCaf do
   begin
      if not Prepared then
         Prepare;
      //----------------------------------------------------------------------------------
      Close;
      ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      Open;
      if (not IsEmpty) and
         (FieldByName('INTEGRACONTAB').AsString = 'S') and
         (IntegraBack.Contabilidade = 'S') then
         //-------------------------------------------------------------------------------
         Result := True
      else
         Result := False;
   end;
end;
//========================================================================================
// Funcao que verifica se nos estornos de movimentação, as planilhas contábeis geradas
// serão removidas ou estornadas (gerando uma planilha invertendo os lançamentos)
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iEmpresaProp   :   id da Empresa Proprietária (Sistema.idEmpresa)        (IDPESSOA)
//========================================================================================
function TAtivoFixo.RemovePlanContab(iEmpresaProp : Integer) : boolean;
begin
   with dtmAtivoFixo.qryParamCaf do
   begin
      if not Prepared then
         Prepare;
      //----------------------------------------------------------------------------------
      if not Active then
      begin
         Close;
         ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         Open;
      end;
      //----------------------------------------------------------------------------------
      if (not IsEmpty) then
      begin
         dtmAtivoFixo.qryAux.Close;
         dtmAtivoFixo.qryAux.SQL.Text := ' SELECT PACESTORNA FROM PARAMCONTAB ' +
                                         ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')';
         dtmAtivoFixo.qryAux.Open;
         Result := (dtmAtivoFixo.qryAux.FieldByName('PACESTORNA').AsString = 'N') AND
                   (FieldByName('FLGREMOVEPLANCTB').AsString = 'S');
      end else
         Result := False;
   end;
end;
//========================================================================================
// Procedimento que localiza a conta contabil e o centro de custo para uma movimentacao
// em um determinado grupo
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iGrupo            : id do Grupo do Bem movimentado
//    iTipoMovimentacao : id do Tipo de Movimentacao
//    sDebCred          : codigo do lancamento contabil (D - Débito / C - Crédito)
//    iPlano            : id do Plano de Contas
//    sPlaConta         : Conta Contábil
//    sCCusto           : Centro de Custo
//----------------------------------------------------------------------------------------
Procedure TAtivoFixo.Localiza_ContaeCentroCusto(iGrupo,
                                                iTipoMovimentacao: integer;
                                                sDebCred : string;
                                                iPlano : integer;
                                                var sPlaConta : string;
                                                var sCCusto : string);

begin
   with dtmAtivoFixo.qryConta do
   begin
      ParamByName('PIDGRUPO').AsInteger            := iGrupo;
      ParamByName('PIDTIPOMOVIMENTACAO').AsInteger := iTipoMovimentacao;
      ParamByName('PTIPOLANCAMENTO').AsString      := sDebCred;
      ParamByName('PPLANO').AsInteger              := iPlano;
      Open;
      //----------------------------------------------------------------------------------
      sPlaConta := FieldByName('PLACONTA').AsString;
      //----------------------------------------------------------------------------------
      Close;
   end;
   sCCusto := '';

end;
//========================================================================================
// Função que retorna a descrição de um grupo
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Bem movimentado
//----------------------------------------------------------------------------------------
Function TAtivoFixo.Busca_Grupo(iPessoa,iGrupo : Integer) : String;
begin
   with dtmAtivoFixo.qryGrupoCtb do
   begin
      ParamByName('PIDPESSOA').AsInteger := iPessoa;
      ParamByName('PIDGRUPO').AsInteger  := iGrupo;
      Open;
      if not IsEmpty then
         Result := FieldByName('NOME').AsString
      else
         Result := '';
      Close;
   end;
end;
//========================================================================================
// Função que retorna a se uma conta contabil possui centro de custo
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iPlano            : id do Plano de Contas
//    sConta            : Conta Contábil
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContaPossuiCCust(iPlano : Integer; sConta : String) : Boolean;
begin
   with dtmAtivoFixo.qryPlanoConta do
   begin
      Close;
      ParamByName('PPLANO').AsInteger   := iPlano;
      ParamByName('PPLACONTA').AsString := sConta;
      Open;
      //----------------------------------------------------------------------------------
      if not IsEmpty then
         Result := (FieldbyName('PLACCUST').AsString = 'S')
      else
         Result := False;
   end;
end;
//========================================================================================
// Verifica o periodo contábil
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iEmpresa     : id da Empresa Proprietária
//    dData        : Data do Lancamento
//    iExercicio   : Ano Contábil
//    iPeriodo     : Mes Contábil
//    sMensagem    : Mensagem de retorno da função LANCACONTABIL
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAtivoFixo.VerificaPeriodoContabil(iEmpresa : Integer; dData: TDate;
                                            Var iExercicio, iPeriodo : Integer;
                                            Var sMensagem : String;
                                            bMostraMsg : Boolean) : Boolean;
var
   ResultPeriodo : Byte;

begin
   ResultPeriodo := TestaPeriodo(True, 'BaseDados', datetostr(dData), '2', iExercicio,
                                 iPeriodo, iEmpresa, sMensagem);
   //-------------------------------------------------------------------------------------
   case ResultPeriodo of
      1 : begin
             if bMostraMsg then
             begin
                MsgDlg('Período Contábil inexistente ! Impossível gerar lançamento ' +
                       'contábil da movimentação do Bem. Altere a data da movimentação.',
                       'Erro', mtError, [mbOk], 0);
             end;
             Result := False;
          end;
      2 : begin
             if bMostraMsg then
             begin
                MsgDlg('Período encontrado, mas não é único ! Impossível gerar ' +
                       'lançamento contábil da movimentação do Bem. Altere a data de ' +
                       'movimentação.', 'Erro', mtError, [mbOk], 0);
             end;
             Result := False;
          end;
      3 : begin
             if bMostraMsg then
             begin
                MsgDlg('Período já bloqueado pela Contabilidade ! Impossível gerar ' +
                       'lançamento contábil da movimentação do Bem. Altere a data de ' +
                       'movimentação.', 'Erro', mtError, [mbOk], 0);
             end;
             Result := False;
          end;
      4 : begin
             MsgDlg('Período já bloqueado pela Integração ! Impossível gerar lançamento '+
                    'contábil da movimentação do Bem. Altere a data de movimentação.',
                    'Erro', mtError, [mbOk], 0);
             Result   := False;
          end;
      else
          Result := True
   end;
end;
//========================================================================================
// Função que recebe os lancamentos e os acumula para posterior registro
//
// em Janeiro/2001 : Inclusão do Rateio por Plano / Patrocinadora
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    sDebCred     : codigo do lancamento contabil (D - Débito / C - Crédito)
//    sHistor      : histórico da movimentacao
//    sHistor1     :     ''
//    sHistor2     :     ''
//    sHistor3     :     ''
//    sHistor4     :     ''
//    sCc          : Centro de Custo
//    sAtivProjeto : Unidade de Negócio
//    sContaDeb    : Conta Contábil do Lancamento a Débito
//    sContaCred   : Conta Contábil do Lancamento a Crédito
//    sNumDoc      : Identificação do documento que originou o lancamento
//    fValLanc     : Valor do Lancamento
//    iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Bem movimentado
//    iPlano       : id do Plano de Contas
//
//----------------------------------------------------------------------------------------
function TAtivoFixo.MontaLancamento(sDebCred,sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                    sCc,sAtivProjeto,sContaDeb,sContaCred,sNumDoc : string;
                                    fValLanc : Double; iPessoa, iBem, iGrupo, iPlano,
                                    iSubConta : integer; bMostraMsg : boolean) : boolean;

var
   sConta,
   sObrigaCC,
   sNomeConta,
   sObrigaSubConta : String;
   iPatro,
   iPlanoPrev      : Integer;
   fPercRateio     : Double;

begin
   if (sContaDeb <> '') then
   begin
      sConta := sContaDeb;
   end else
   begin
      sConta := sContaCred;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se a Conta obriga Centro de Custo e/ou SubConta
   //-------------------------------------------------------------------------------------
   sObrigaCC       := '';
   sNomeConta      := '';
   sObrigaSubConta := '';
   FuncaoGeral.TestaContaCC(True, iPlano, sConta,
                            sObrigaCC, sNomeConta, sObrigaSubConta);
   //-------------------------------------------------------------------------------------
   // Verifica se a conta contábil possui Centro de Custo
   //-------------------------------------------------------------------------------------
   if (sObrigaCC = 'S') then
   begin
      with dtmAtivoFixo.qryContasxCc do
      begin
         Close;
         ParamByName('PIDEMPRESA').asInteger      := iPessoa;
         ParamByName('PPLANO').asInteger          := iPlano;
         ParamByName('PPLACONTA').asString        := trim(sConta);
         ParamByName('PCODCENTROCUSTO').asString  := trim(sCc);
         Open;
         if isEmpty then
         begin
            if sCC = '' then
            begin
               MsgDlg('O Centro de Custo é obrigatório na Conta Contábil ' + sConta +
                      ' no Plano ' + inttostr(iPlano) + '. Cadastre-o.',
                      'Erro', mtError,[mbOk],0);
            end else
            begin
               MsgDlg('Associe o Centro de Custo ' + sCC + ' à Conta Contábil ' + sConta +
                      ' no Plano ' + inttostr(iPlano) + ' usando o Cadastro de Plano ' +
                      'de Contas no Sistema da Contabilidade', 'Erro', mtError,[mbOk],0);
            end;
            result := False;
            exit;
         end;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se a conta contábil possui SubConta
   //-------------------------------------------------------------------------------------
   if sObrigaSubConta = 'S' then
   begin
      with dtmAtivoFixo.qryContasxSubC do
      begin
         Close;
         ParamByName('PIDEMPRESA').asInteger   := iPessoa;
         ParamByName('PPLANO').asInteger       := iPlano;
         ParamByName('PPLACONTA').asString     := sConta;
         ParamByName('PCODSUBCONTA').asInteger := iSubConta;
         Open;
         if isEmpty then
         begin
            if iSubConta <= 0 then
            begin
               MsgDlg('A SubConta é obrigatória na Conta Contábil ' + sConta +
                      ' no Plano ' + inttostr(iPlano) + '. Informe-a.',
                      'Erro', mtError,[mbOk],0);
            end else
            begin
               MsgDlg('Associe a SubConta ' + inttostr(iSubConta) +
                      ' à Conta Contábil ' + sConta + ' no Plano ' + inttostr(iPlano) +
                      ' usando o Cadastro de Plano de Contas no Sistema da Contabilidade',
                      'Erro', mtError,[mbOk],0);
            end;
            result := False;
            exit;
         end;
      end;
   end;
   try
      //----------------------------------------------------------------------------------
      // Pesquisa o Rateio de PlanoPatrocinadora do Bem para o calculo do rateio.
      // Caso não haja rateio definido, usa o padrão setado nos Parâmetros do Sistema.
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryRatPP.Close;
         qryRatPP.ParamByName('PIDBEM').AsInteger     := iBem;
         qryRatPP.ParamByName('PIDEMPRESA').AsInteger := iPessoa;
         qryRatPP.Open;
         //-------------------------------------------------------------------------------
         repeat
            if qryRatPP.IsEmpty then
            begin
               with dtmAtivoFixo.qryParamCaf do
               begin
                  if not Active then
                  begin
                     ParamByName('PIDPESSOA').asInteger := iPessoa;
                     Open;
                  end;
                  if not IsEmpty then
                  begin
                     iPatro     := FieldByName('PATROPADRAO').AsInteger;
                     iPlanoPrev := FieldByName('PLANPREVPADRAO').AsInteger;
                  end else
                  begin
                     iPatro     := IntegraBack.PatroGlobal;
                     iPlanoPrev := IntegraBack.PlanoPrevGlobal;
                  end;
               end;
               fPercRateio := 1;
            end else
            begin
               iPatro      := qryRatPP.FieldByName('IDPLANOPREV').AsInteger;
               iPlanoPrev  := qryRatPP.FieldByName('IDPATRO').AsInteger;
               fPercRateio := qryRatPP.FieldByName('PPBPERCRATEIO').AsFloat / 100;
            end;
            //----------------------------------------------------------------------------
            if not (qryMontaCtb.Locate('PLANO;PLACONTA;CODCENTROCUSTO;LACDEBCRE;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                    VarArrayOf([iPlano,sConta,sCc,sDebCred,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[])) then
            begin
               qryMontaCtb.Insert;
               qryMontaCtb.FieldByName('PLANO').AsInteger         := iPlano;
               qryMontaCtb.FieldByName('PLACONTA').AsString       := sConta;
               qryMontaCtb.FieldByName('CODCENTROCUSTO').AsString := sCc;
               qryMontaCtb.FieldByName('LACDEBCRE').AsString      := sDebCred;
               qryMontaCtb.FieldByName('LACNUMDOC').AsString      := sNumDoc;
               qryMontaCtb.FieldByName('LACHIST1').AsString       := 'Grupo '+Busca_Grupo(iPessoa,iGrupo);
               qryMontaCtb.FieldByName('LACHIST2').AsString       := sHistor;
               qryMontaCtb.FieldByName('LACHIST3').AsString       := sHistor1;
               qryMontaCtb.FieldByName('LACHIST4').AsString       := sHistor2;
               qryMontaCtb.FieldByName('LACHIST5').AsString       := sHistor3;
               qryMontaCtb.FieldByName('UNIDNEGOC').AsString      := sAtivProjeto;
               qryMontaCtb.FieldByName('CODSUBCONTA').AsInteger   := iSubConta;
               qryMontaCtb.FieldByName('IDPATRO').AsInteger       := iPatro;
               qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger   := iPlanoPrev;
               qryMontaCtb.FieldByName('LACVALOR').AsCurrency     := fValLanc * fPercRateio;
            end else
            begin
               qryMontaCtb.Edit;
               qryMontaCtb.FieldByName('LACVALOR').AsCurrency := qryMontaCtb.FieldByName('LACVALOR').AsFloat +
                                                                 (fValLanc * fPercRateio);
            end;
            //----------------------------------------------------------------------------
            if not qryRatPP.IsEmpty then
               qryRatPP.Next;
            //----------------------------------------------------------------------------
         until qryRatPP.EOF;
         //-------------------------------------------------------------------------------
      end;
      Result := True;
   except
      Result := False;
      if bMostraMsg then
         raise;
   end;
end;
//========================================================================================
// Função que registra os Lancamentos da Movimentacao em um planilha na Contabilidade
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    sDebCred     : codigo do lancamento contabil (D - Débito / C - Crédito)
//    sHistor      : histórico da movimentacao
//    sHistor1     :     ''
//    sHistor2     :     ''
//    sHistor3     :     ''
//    sHistor4     :     ''
//    sCc          : Centro de Custo
//    sAtivProjeto : Atividade de Projeto
//    sContaDeb    : Conta Contábil do Lancamento a Débito
//    sContaCred   : Conta Contábil do Lancamento a Crédito
//    sNumDoc      : Identificação do documento que originou o lancamento
//    fValLanc     : Valor do Lancamento
//    iPessoa      : id da Empresa Proprietária (Sistema.idEmpresa)
//    iGrupo       : id do Grupo do Bem movimentado
//    iPlano       : id do Plano de Contas
//
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo : Integer;
                                             dData : tDateTime;
                                             var sMensagem : String;
                                             bMostraMsg : Boolean) : Integer;
var
   sContaDeb, sContaCred,
   sCCDebito, sCCCredito,
   sSubContaD, sSubContaC,
   sSistOri, sCodDebCred,
   sNomeConta, sObrigaCC, sObrigaSubConta, sTipOper : String;
   iPln, iPlanilha                                  : Integer;

begin
   iPln := 0;
   //iPlanilha := 0;
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      if not Active then
      begin
         ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         Open;
      end;
      sTipOper := FieldByName('TIPOPERCTB').AsString;
   end;
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryMontaCtb do
   begin
      First;
      while not EOF do
      begin
         sContaDeb  := '';
         sContaCred := '';
         sCCDebito  := '';
         sCCCredito := '';
         sSubContaD := '';
         sSubContaC := '';
         //-------------------------------------------------------------------------------
         // Verifica se a Conta obriga Centro de Custo e/ou SubConta
         //-------------------------------------------------------------------------------
         sObrigaCC       := '';
         sNomeConta      := '';
         sObrigaSubConta := '';
         FuncaoGeral.TestaContaCC(True,FieldByName('PLANO').AsInteger,
                                  FieldByName('PLACONTA').AsString,
                                  sObrigaCC,sNomeConta,sObrigaSubConta);
         //-------------------------------------------------------------------------------
         if FieldByName('LACDEBCRE').AsString = 'D' then
         begin
            sContaDeb  := FieldByName('PLACONTA').AsString;
            //----------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               if FieldByName('CODCENTROCUSTO').AsInteger > 0 then
               begin
                  sCCDebito := FieldByName('CODCENTROCUSTO').AsString;
               end;
            end;
            //----------------------------------------------------------------------------
            if sObrigaSubConta = 'S' then
            begin
               if FieldByName('CODSUBCONTA').AsInteger > 0 then
               begin
                  sSubContaD := FieldByName('CODSUBCONTA').AsString;
               end;
            end;
         end else
         begin
            sContaCred := FieldByName('PLACONTA').AsString;
            //----------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               if FieldByName('CODCENTROCUSTO').AsInteger > 0 then
               begin
                  sCCCredito := FieldByName('CODCENTROCUSTO').AsString;
               end;
            end;
            //----------------------------------------------------------------------------
            if sObrigaSubConta = 'S' then
            begin
               if FieldByName('CODSUBCONTA').AsInteger > 0 then
               begin
                  sSubContaC := FieldByName('CODSUBCONTA').AsString;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         ContaPossuiCCust(FieldByName('PLANO').AsInteger,
                          FieldByName('PLACONTA').AsString);
         //-------------------------------------------------------------------------------
         sSistOri := inttostr(iModulo);
         if FieldByName('LACDEBCRE').AsString = 'D' then
         begin
            sCodDebCred  := '0'
         end else
         begin
            sCodDebCred  := '1';
         end;
         //-------------------------------------------------------------------------------
         if ((FieldByName('LACVALOR').AsFloat) <> 0) then
         begin
            try
              iPlanilha := LancaContab(True,
                                       'BaseDados',                                             // Base de Dados
                                       datetostr(dData),                                        // Data de Lançamento
                                       sSistOri,                                                // Sistema de origem
                                       sCodDebCred,                                             // 0=> Débito e 1=> Crédito
                                       FieldByName('LACDEBCRE').AsString,                       // D=> Débito e C=> Crédito
                          dtmAtivoFixo.qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString, // Conversão à débito
                          dtmAtivoFixo.qryPlanoConta.FieldByName('PLATIPCONVGER').AsString,     // Conversão à débito
                          dtmAtivoFixo.qryPlanoConta.FieldByName('PLATIPCONVGER').AsString,     // Conversão à débito
                          dtmAtivoFixo.qryPlanoConta.FieldByName('PLATIPCONVGER').AsString,     // Conversão à débito
                                       'O',                                                     // Origem da aplicação a débito
                          dtmAtivoFixo.qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString, // Conversão à Crédito
                          dtmAtivoFixo.qryPlanoConta.FieldByName('PLATIPCONVGER').AsString,     // Conversão à Crédito
                          dtmAtivoFixo.qryPlanoConta.FieldByName('PLATIPCONVGER').AsString,     // Conversão à Crédito
                          dtmAtivoFixo.qryPlanoConta.FieldByName('PLATIPCONVGER').AsString,     // Conversão à Crédito
                                       'O',                                                     // Origem da aplicação a crédito
                                       FieldByName('LACNUMDOC').AsString,                       // Número do Documento
                                       FieldByName('LACHIST1').AsString,                        // Histórico 1
                                       FieldByName('LACHIST2').AsString,                        // Histórico 2
                                       FieldByName('LACHIST3').AsString,                        // Histórico 3
                                       FieldByName('LACHIST4').AsString,                        // Histórico 4
                                       FieldByName('LACHIST5').AsString,                        // Histórico 5
                                       sTipOper,                                                // Grupo (tipo de operação)
                                       sCCDebito,                                               // ccusto a débito
                                       sContaDeb,                                               // Conta Contábil a débito
                                       sCCCredito,                                              // ccusto a crédito
                                       sContaCred,                                              // conta contábil a crédito
                                       iExercicio,                                              // exercício (porexercício)
                                       iPeriodo,                                                // pernumero (tabperiodo)
                                       Sistema.IdEmpresa,                                       // pessoa
                                       Sistema.IdUsuario,                                       // usuário
                                       FieldByName('PLANO').AsInteger,                          // plano
                                       FieldByName('LACVALOR').AsFloat,                         // valor do lançamento
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       FieldByName('UNIDNEGOC').AsString,                       // unidade de negócio
                                       False,                                                   // bjunta = false
                                       0 ,                                                      //
                                       0 ,                                                      //
                                       sSubContaD,                                              // subconta
                                       sSubContaC,                                              // subconta a Credito
                                       '',                                                      //
                                       '',                                                      //
                                       iPln,                                                    // Se 0, Cria Nova Pln, Senão Grava na pln
                                       sMensagem,
                                       IntegraBack.MascaraPlano,
                                       True,
                                       0,
                                       FieldByName('IDPLANOPREV').AsInteger, // IntegraBack.PlanoPrevGlobal, // Plano Previdenciário
                                       FieldByName('IDPATRO').AsInteger,     // IntegraBack.PatroGlobal,     // Patrocinadora
                                       Sistema.UsaPlanoPatro                                                 // Empresa usa Plano/Patrocinadora
                                       );
               iPln := iPlanilha;
            except
               iPln := -1;
            end;
            //----------------------------------------------------------------------------
            if iPln = -1 then
            begin
               if bMostraMsg then
               begin
                  MsgDlg('Atenção! Erro na geração da Planilha.','Erro',mtError,[mbOk],0);
                  Result := iPln;
                  exit;
               end;
            end;
            //----------------------------------------------------------------------------
         end;
         next;
      end;
      //----------------------------------------------------------------------------------
      Close;
   end;
   Result := iPln;
end;
//========================================================================================
function TAtivoFixo.TiraCaracter(sStr : string; sCh : Char) : string;
var
   iConta : Byte;

begin
   Result := '';
   for iConta := 1 to length(sStr) do
   begin
      if sStr[iConta] <> sCh then
         Result := Result + sStr[iConta];
   end;
end;
//========================================================================================
function TAtivoFixo.CompletaZeros(sCodigo : String; iTam : Integer) : string;
var
   iCont,iLen             : integer;
   sFull, sZeros, sResult : string;

begin
   sZeros := '';
   for iCont := 1 to iTam do
   begin
       sZeros := sZeros + '0';
   end;
   sFull := sZeros + trim(sCodigo);
   //-------------------------------------------------------------------------------------
   sResult := '';
   iLen := length(sFull);
   iCont := 1;
   while iCont <= iTam do
   begin
      sResult := sFull[iLen] + sResult;
      iLen := iLen - 1;
      iCont := iCont + 1;
   end;
   //-------------------------------------------------------------------------------------
   Result := sResult;
end;
//========================================================================================
function tAtivoFixo.CalculaSaldoContabil(iIdPessoa, iIdBem : Integer;
                                         dData : tDatetime;
                                         Var fSldCtbImob : Extended) : Extended;
begin
   dtmAtivoFixo.qrySldContabil.Close;
   dtmAtivoFixo.qrySldContabil.ParamByName('PIDPESSOA').AsInteger := iIdPessoa;
   dtmAtivoFixo.qrySldContabil.ParamByName('PIDBEM').AsInteger    := iIdBem;
   dtmAtivoFixo.qrySldContabil.ParamByName('PDATAMOV').AsDateTime := dData;
   dtmAtivoFixo.qrySldContabil.Open;
   if (dtmAtivoFixo.qrySldContabil.IsEmpty) then
   begin
      Result      := 0;
      fSldCtbImob := 0;
   end else
   begin
      Result      := dtmAtivoFixo.qrySldContabil.FieldByName('SUMVALCTB').asCurrency;
      fSldCtbImob := dtmAtivoFixo.qrySldContabil.FieldByName('SUMVALCTBIMOB').asCurrency;
   end;
end;
//========================================================================================
function tAtivoFixo.Cotacao_Moeda(sMoeda : String; dData : tDateTime;
                                  bMostraMsg : boolean) : double;
var
   sData                        : string;
   qryMoeda,qryMoedaM,qryMoedaD : TwwQuery;

begin
   result := 1;
   //-------------------------------------------------------------------------------------
   qryMoeda  := TwwQuery(dtmAtivoFixo.qryMoeda );
   qryMoedaM := TwwQuery(dtmAtivoFixo.qryMoedaM);
   qryMoedaD := TwwQuery(dtmAtivoFixo.qryMoedaD);
   if not qryMoeda.Prepared then
      qryMoeda.Prepare;
   if not qryMoedaM.Prepared then
      qryMoedaM.Prepare;
   if not qryMoedaD.Prepared then
      qryMoedaD.Prepare;
   //-------------------------------------------------------------------------------------
   qryMoeda.ParamByName('PMOEDA').asString := sMoeda;
   qryMoeda.Open;
   //-------------------------------------------------------------------------------------
   if qryMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'M' then
   begin
      sData := copy(datetostr(dData),4,2) + copy(datetostr(dData),7,4);
      qryMoedaM.ParamByName('PMOEDA').asString  := sMoeda;
      qryMoedaM.ParamByName('PCOTMES').asString := sData;
      qryMoedaM.Open;
      //----------------------------------------------------------------------------------
      if qryMoedaM.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Cotação da Moeda ' + qryMoeda.FieldByName('MOEDESC').AsString
                   + ' do Mês ' + sData + ' não Cadastrada!','Erro',
                   mtError, [mbOk], 0);
         result := 1;
      end else
      //----------------------------------------------------------------------------------
      begin
         result := qryMoedaM.FieldByName('COTVALOR').AsCurrency;
      end;
      //----------------------------------------------------------------------------------
      qryMoedaM.Close;
   end else
      if qryMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'D' then
      begin
         qryMoedaD.ParamByName('PMOEDA').asString     := sMoeda;
         qryMoedaD.ParamByName('PCOTDATA').asDateTime := dData;
         qryMoedaD.Open;
         //-------------------------------------------------------------------------------
         if qryMoedaD.isEmpty then
         begin
            if bMostraMsg then
               MsgDlg('Cotação da Moeda ' + qryMoeda.FieldByName('MOEDESC').AsString
                      + ' do Dia ' + datetostr(dData) + ' não Cadastrada!','Erro',
                      mtError, [mbOk], 0);
            result := 1;
         end else
         //-------------------------------------------------------------------------------
         begin
            result := qryMoedaD.FieldByName('COTVALOR').AsCurrency;
         end;
         //-------------------------------------------------------------------------------
         qryMoedaD.Close;
      end;
   //-------------------------------------------------------------------------------------
   qryMoeda.Close;
end;
//========================================================================================
function tAtivoFixo.GeraProxPlacaTomb(iIdPessoa, iIdGrupo, iIdClasse : Integer;
                                      fPlacaAtual : double) : double;
var
   sMascaraEmpresa,
   sCodPlaca, sClasse, sGrupo,
   sProximoCodigo, sProxPlaca,
   sDigMascPlaca                 : String;
   iAux                          : Integer;
   qryAux                        : TwwQuery;
   bEdPlaca, bOk                 : boolean;

begin
   qryAux := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCAF do
   begin
      Close;
      ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
      Open;
   end;
   //-------------------------------------------------------------------------------------
   bEdPlaca := (dtmAtivoFixo.qryParamCAF.FieldByName('EDITACODBEM').AsFloat = 1);
   case dtmAtivoFixo.qryParamCAF.FieldByName('SEQBEMEMP').AsInteger of
      0 : sCodPlaca := 'E'; {sequencial por Empresa}
      1 : sCodPlaca := 'G'; {sequencial por Grupo}
      2 : sCodPlaca := 'C'; {sequencial por Classe}
      3 : sCodPlaca := 'S'; {sequencial Puro}
   end;
   //-------------------------------------------------------------------------------------
   sProxPlaca := '';
   bOk := False;
   while not bOk do
   begin
      if bEdPlaca then
      begin
         //-------------------------------------------------------------------------------
         // Calcula o Numero da Próxima Placa de Patrimônio
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT PROXIMAPLACA,DIGMASCPLACA '+
                        ' FROM PARAMETROSCAFMANUT '+
                        ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         qryAux.Open;
         if (qryAux.FieldByName('PROXIMAPLACA').AsFloat <= 0) then
         begin
            sProximoCodigo := '1';
         end else
         begin
            sProximoCodigo := FloatToStr(qryAux.FieldByName('PROXIMAPLACA').AsFloat);
         end;
         sDigMascPlaca := StringOfChar('0',qryAux.FieldByName('DIGMASCPLACA').AsInteger);
         //-------------------------------------------------------------------------------
         dtmAtivoFixo.qryParamCAF.Close;
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' +
                        floattostr(strtofloat(sProximoCodigo) + 1) +
                        ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         qryAux.ExecSQL;
         dtmAtivoFixo.qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
         dtmAtivoFixo.qryParamCaf.Open;
         //-------------------------------------------------------------------------------
         // Calculo por GRUPO
         //-------------------------------------------------------------------------------
         if (sCodPlaca = 'G') then
         begin
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT CLASSE FROM GRUPO '+
                               ' WHERE (IDGRUPO  = ' + inttostr(iIdGrupo) + ') ';
            qryAux.Open;
            sGrupo := trim(qryAux.FieldByName('CLASSE').AsString);
            //----------------------------------------------------------------------------
            sProxPlaca := sGrupo + ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
         end;
         //-------------------------------------------------------------------------------
         // Calculo por CLASSE
         //-------------------------------------------------------------------------------
         if (sCodPlaca = 'C') then
         begin
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT CODHIERARQ FROM CLASSEDEBEM '+
                               ' WHERE (IDCLASSEBEM  = ' + inttostr(iIdClasse) + ') ';
            qryAux.Open;
            sClasse := trim(qryAux.FieldByName('CODHIERARQ').AsString);
            //----------------------------------------------------------------------------
            sProxPlaca := sClasse + ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
         end;
         //-------------------------------------------------------------------------------
         // Calculo por EMPRESA
         //-------------------------------------------------------------------------------
         if (sCodPlaca = 'E') then
         begin
            sMascaraEmpresa := '';
            for iAux := 1 to length(trim(inttostr(iIdPessoa))) do
            begin
               sMascaraEmpresa := sMascaraEmpresa + '9';
            end;
            //----------------------------------------------------------------------------
            sProxPlaca := ComplZeros(copy(floattostr(fPlacaAtual),1,length(sMascaraEmpresa))+
                                     sProximoCodigo,(Length(sMascaraEmpresa) + 9)) + sDigMascPlaca;
         end;
         //-------------------------------------------------------------------------------
         // Calculo SEQUENCIAL
         //-------------------------------------------------------------------------------
         if (sCodPlaca = 'S') then
         begin
            sProxPlaca := sProximoCodigo + sDigMascPlaca;
         end;
      end else
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT DIGMASCPLACA '+
                        ' FROM PARAMETROSCAFMANUT '+
                        ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         qryAux.Open;
         sDigMascPlaca := StringOfChar('0',qryAux.FieldByName('DIGMASCPLACA').AsInteger);
         //-------------------------------------------------------------------------------
         if (length(sDigMascPlaca) > 0) then
         begin
            sProxPlaca := copy(FloatToStr(fPlacaAtual),1,
                               length(FloatToStr(fPlacaAtual))-length(sDigMascPlaca));
            sProxPlaca := FloatToStr(StrToFloat(sProxPlaca) + 1) + sDigMascPlaca;
         end else
         begin
            sProxPlaca := FloatToStr(fPlacaAtual + 1);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Confere se a placa calculada já existe
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT PLACA,DESBEM FROM BEM ' +
                         ' WHERE (PLACA = ' + sProxPlaca + ')' +
                         '   AND (IDPESSOA = ' + inttostr(iIdPessoa) + ')';
      qryAux.Open;
      bOk := qryAux.IsEmpty;
   end;
   result := StrToFloat(sProxPlaca);
end;
//========================================================================================
function tAtivoFixo.ComplZeros(sCodigo : String; iTam : Integer) : string;
var
   iCont, iLen            : integer;
   sFull, sZeros, sResult : string;

begin
   sZeros := '';
   for iCont := 1 to iTam do
   begin
      sZeros := sZeros + '0';
   end;
   sFull := sZeros + trim(sCodigo);
   //-------------------------------------------------------------------------------------
   iLen := length(sFull);
   sResult := '';
   iCont := iTam;
   while iCont >= 1 do
   begin
      sResult := sFull[iLen] + sResult;
      iCont := iCont - 1;
      iLen  := iLen - 1;
   end;
   //-------------------------------------------------------------------------------------
   Result := sResult;
end;
//========================================================================================
Procedure tAtivoFixo.GeraTipoMovimentacao;
Const
   cMaxTipoMov = 66;

Type
   TrecTipoMov = record
     DESCTIPOMOVIMENTACAO : String;
     LANCAMENTO           : String;
     IDCONTAB             : Integer;
   end;

Var
   aTipoMov   : array [1..cMaxTipoMov] of TrecTipoMov;
   iAux       : Integer;
   bTransacao : Boolean;

Begin
   frmAguarde.Min := 0;
   frmAguarde.Max := 52;
   //-------------------------------------------------------------------------------------
   // Alimenta o Vetor dos Tipos de Movimentação
   //-------------------------------------------------------------------------------------
   aTipoMov[01].DESCTIPOMOVIMENTACAO := 'ENTRADA COM CONTROLE TOTAL';
   aTipoMov[02].DESCTIPOMOVIMENTACAO := 'RECEBIMENTO';
   aTipoMov[03].DESCTIPOMOVIMENTACAO := 'ENTRADA COM CONTROLE FISICO';
   aTipoMov[04].DESCTIPOMOVIMENTACAO := 'TROCA DO NÚMERO DA PLACA DE TOMBAMENTO';
   aTipoMov[05].DESCTIPOMOVIMENTACAO := 'TRANSFERENCIA DE GRUPO';
   aTipoMov[06].DESCTIPOMOVIMENTACAO := 'BAIXA';
   aTipoMov[07].DESCTIPOMOVIMENTACAO := 'ENTRADA POR DESMEMBRAMENTO';
   aTipoMov[10].DESCTIPOMOVIMENTACAO := 'ENTRADA POR REMEMBRAMENTO';
   aTipoMov[13].DESCTIPOMOVIMENTACAO := 'BAIXA PARA DESMEMBRAMENTO';
   aTipoMov[16].DESCTIPOMOVIMENTACAO := 'BAIXA PARA REMEMBRAMENTO';
   aTipoMov[08].DESCTIPOMOVIMENTACAO := 'REAVALIACAO PATRIMONIAL';
   aTipoMov[09].DESCTIPOMOVIMENTACAO := 'ACRESCIMO DE VALOR';
   aTipoMov[11].DESCTIPOMOVIMENTACAO := 'TRANSFERENCIA DE LOCAL';
   aTipoMov[12].DESCTIPOMOVIMENTACAO := 'TRANSFERENCIA DE CONJUNTO';
   aTipoMov[14].DESCTIPOMOVIMENTACAO := 'DEPRECIACAO';
   aTipoMov[15].DESCTIPOMOVIMENTACAO := 'CORRECAO MONETARIA';
   aTipoMov[17].DESCTIPOMOVIMENTACAO := 'INCLUSAO DE DEPRECIACAO INICIAL';
   aTipoMov[18].DESCTIPOMOVIMENTACAO := 'DEPRECIACAO DA REAVALIACAO';
   aTipoMov[19].DESCTIPOMOVIMENTACAO := 'CORR. MONET. DA DEPR. DA REAVALIACAO';
   aTipoMov[20].DESCTIPOMOVIMENTACAO := 'BAIXA DA REAVALIACAO';
   aTipoMov[21].DESCTIPOMOVIMENTACAO := 'CORR. MONET. DA DEPRECIACAO';
   aTipoMov[22].DESCTIPOMOVIMENTACAO := 'CORR. MONET. DA REAVALIACAO';
   aTipoMov[23].DESCTIPOMOVIMENTACAO := 'REAVALIACAO PATRIMONIAL NEGATIVA';
   aTipoMov[24].DESCTIPOMOVIMENTACAO := 'BAIXA DA DEPRECIACAO';
   aTipoMov[25].DESCTIPOMOVIMENTACAO := 'BAIXA DA CORR. MONET. DO BEM';
   aTipoMov[26].DESCTIPOMOVIMENTACAO := 'BAIXA DA CORR. MONET. DA DEPRECIACAO';
   aTipoMov[27].DESCTIPOMOVIMENTACAO := 'BAIXA DA DEPRECIACAO DA REAVALIACAO';
   aTipoMov[28].DESCTIPOMOVIMENTACAO := 'BAIXA DA CORR. MONET. DA REAVALIACAO';
   aTipoMov[29].DESCTIPOMOVIMENTACAO := 'BAIXA DA CORR MONET DA DEPR. DA REAVAL.';
   aTipoMov[30].DESCTIPOMOVIMENTACAO := 'LUCRO NA ALIENACAO DE BEM';
   aTipoMov[31].DESCTIPOMOVIMENTACAO := 'PREJUIZO NA ALIENACAO DE BEM';
   aTipoMov[32].DESCTIPOMOVIMENTACAO := 'INCLUSAO DE SALDO DE REAVALIACAO';
   aTipoMov[33].DESCTIPOMOVIMENTACAO := 'DEPRECIACAO DE SALDO DE REAVALIACAO';
   aTipoMov[34].DESCTIPOMOVIMENTACAO := 'CORR. MONET. DO ACRESCIMO DE VALOR';
   aTipoMov[35].DESCTIPOMOVIMENTACAO := 'DEPRECIACAO DO ACRESCIMO DE VALOR';
   aTipoMov[36].DESCTIPOMOVIMENTACAO := 'CORR. MONET. DA DEPR. DO ACRESC. VALOR';
   aTipoMov[37].DESCTIPOMOVIMENTACAO := 'BAIXA DO ACRESCIMO DE VALOR';
   aTipoMov[38].DESCTIPOMOVIMENTACAO := 'BAIXA DA CORR. MONET. DO ACRESC. VALOR';
   aTipoMov[39].DESCTIPOMOVIMENTACAO := 'BAIXA DA DEPRECIACAO DO ACRESC. VALOR';
   aTipoMov[40].DESCTIPOMOVIMENTACAO := 'BAIXA DA CORR. MONET DA DEPR. DO ACRESC.';
   aTipoMov[41].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - AQUISICAO';
   aTipoMov[42].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - C.M. AQUISICAO';
   aTipoMov[43].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - DEPRECIACAO';
   aTipoMov[44].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - C.M. DEPRECIACAO';
   aTipoMov[45].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - REAVALIACAO';
   aTipoMov[46].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - C.M. REAVALIACAO';
   aTipoMov[47].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - DEPREC.REAVAL.';
   aTipoMov[48].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - C.M.DEPREC.REAVAL.';
   aTipoMov[49].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - ACRESCIMO VALOR';
   aTipoMov[50].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - C.M. ACRESCIMO';
   aTipoMov[51].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - DEPREC. ACRESCIMO';
   aTipoMov[52].DESCTIPOMOVIMENTACAO := 'AJUSTE IMPLANTACAO - C.M.DEPREC ACRESC.';
   aTipoMov[53].DESCTIPOMOVIMENTACAO := 'REAVALIACAO DE SALDO DE REAVALIACAO';
   aTipoMov[54].DESCTIPOMOVIMENTACAO := 'REAVALIACAO DE ACRESCIMO DE VALOR';
   aTipoMov[55].DESCTIPOMOVIMENTACAO := 'ATUALIZACAO MONETARIA';
   aTipoMov[56].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA CORRECAO MONETARIA';
   aTipoMov[57].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA DEPRECIACAO';
   aTipoMov[58].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA C.M. DA DEPRECIACAO';
   aTipoMov[59].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA REAVALIACAO';
   aTipoMov[60].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA CORR.MONET. DA REAVAL.';
   aTipoMov[61].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA DEPREC. DA REAVAL.';
   aTipoMov[62].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA C.M. DA DEPREC DA REAVAL';
   aTipoMov[63].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DO ACRESC.VALOR';
   aTipoMov[64].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA CORR.MONET. DO ACRESC.';
   aTipoMov[65].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA DEPREC. DO ACRESC.';
   aTipoMov[66].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA C.M. DA DEPREC DO ACRESC';
   //-------------------------------------------------------------------------------------
   aTipoMov[01].LANCAMENTO := 'S';
   aTipoMov[02].LANCAMENTO := 'N';
   aTipoMov[03].LANCAMENTO := 'N';
   aTipoMov[04].LANCAMENTO := 'N';
   aTipoMov[05].LANCAMENTO := 'N';
   aTipoMov[06].LANCAMENTO := 'S';
   aTipoMov[07].LANCAMENTO := 'N';
   aTipoMov[08].LANCAMENTO := 'S';
   aTipoMov[09].LANCAMENTO := 'S';
   aTipoMov[10].LANCAMENTO := 'N';
   aTipoMov[11].LANCAMENTO := 'N';
   aTipoMov[12].LANCAMENTO := 'N';
   aTipoMov[13].LANCAMENTO := 'N';
   aTipoMov[14].LANCAMENTO := 'S';
   aTipoMov[15].LANCAMENTO := 'S';
   aTipoMov[16].LANCAMENTO := 'N';
   aTipoMov[17].LANCAMENTO := 'S';
   aTipoMov[18].LANCAMENTO := 'S';
   aTipoMov[19].LANCAMENTO := 'S';
   aTipoMov[20].LANCAMENTO := 'S';
   aTipoMov[21].LANCAMENTO := 'S';
   aTipoMov[22].LANCAMENTO := 'S';
   aTipoMov[23].LANCAMENTO := 'S';
   aTipoMov[24].LANCAMENTO := 'S';
   aTipoMov[25].LANCAMENTO := 'S';
   aTipoMov[26].LANCAMENTO := 'S';
   aTipoMov[27].LANCAMENTO := 'S';
   aTipoMov[28].LANCAMENTO := 'S';
   aTipoMov[29].LANCAMENTO := 'S';
   aTipoMov[30].LANCAMENTO := 'S';
   aTipoMov[31].LANCAMENTO := 'S';
   aTipoMov[32].LANCAMENTO := 'S';
   aTipoMov[33].LANCAMENTO := 'S';
   aTipoMov[34].LANCAMENTO := 'S';
   aTipoMov[35].LANCAMENTO := 'S';
   aTipoMov[36].LANCAMENTO := 'S';
   aTipoMov[37].LANCAMENTO := 'S';
   aTipoMov[38].LANCAMENTO := 'S';
   aTipoMov[39].LANCAMENTO := 'S';
   aTipoMov[40].LANCAMENTO := 'S';
   aTipoMov[41].LANCAMENTO := 'N';
   aTipoMov[42].LANCAMENTO := 'N';
   aTipoMov[43].LANCAMENTO := 'N';
   aTipoMov[44].LANCAMENTO := 'N';
   aTipoMov[45].LANCAMENTO := 'N';
   aTipoMov[46].LANCAMENTO := 'N';
   aTipoMov[47].LANCAMENTO := 'N';
   aTipoMov[48].LANCAMENTO := 'N';
   aTipoMov[49].LANCAMENTO := 'N';
   aTipoMov[50].LANCAMENTO := 'N';
   aTipoMov[51].LANCAMENTO := 'N';
   aTipoMov[52].LANCAMENTO := 'N';
   aTipoMov[53].LANCAMENTO := 'N';
   aTipoMov[54].LANCAMENTO := 'N';
   aTipoMov[55].LANCAMENTO := 'N';
   aTipoMov[56].LANCAMENTO := 'N';
   aTipoMov[57].LANCAMENTO := 'N';
   aTipoMov[58].LANCAMENTO := 'N';
   aTipoMov[59].LANCAMENTO := 'N';
   aTipoMov[60].LANCAMENTO := 'N';
   aTipoMov[61].LANCAMENTO := 'N';
   aTipoMov[62].LANCAMENTO := 'N';
   aTipoMov[63].LANCAMENTO := 'N';
   aTipoMov[64].LANCAMENTO := 'N';
   aTipoMov[65].LANCAMENTO := 'N';
   aTipoMov[66].LANCAMENTO := 'N';
   //-------------------------------------------------------------------------------------
   aTipoMov[01].IDCONTAB := 03;
   aTipoMov[02].IDCONTAB := 03;
   aTipoMov[03].IDCONTAB := 03;
   aTipoMov[04].IDCONTAB := 03;
   aTipoMov[05].IDCONTAB := 03;
   aTipoMov[06].IDCONTAB := 03;
   aTipoMov[07].IDCONTAB := 03;
   aTipoMov[08].IDCONTAB := 03;
   aTipoMov[09].IDCONTAB := 03;
   aTipoMov[10].IDCONTAB := 03;
   aTipoMov[11].IDCONTAB := 03;
   aTipoMov[12].IDCONTAB := 03;
   aTipoMov[13].IDCONTAB := 03;
   aTipoMov[14].IDCONTAB := 03;
   aTipoMov[15].IDCONTAB := 03;
   aTipoMov[16].IDCONTAB := 03;
   aTipoMov[17].IDCONTAB := 03;
   aTipoMov[18].IDCONTAB := 03;
   aTipoMov[19].IDCONTAB := 03;
   aTipoMov[20].IDCONTAB := 03;
   aTipoMov[21].IDCONTAB := 03;
   aTipoMov[22].IDCONTAB := 03;
   aTipoMov[23].IDCONTAB := 03;
   aTipoMov[24].IDCONTAB := 03;
   aTipoMov[25].IDCONTAB := 03;
   aTipoMov[26].IDCONTAB := 03;
   aTipoMov[27].IDCONTAB := 03;
   aTipoMov[28].IDCONTAB := 03;
   aTipoMov[29].IDCONTAB := 03;
   aTipoMov[30].IDCONTAB := 03;
   aTipoMov[31].IDCONTAB := 03;
   aTipoMov[32].IDCONTAB := 03;
   aTipoMov[33].IDCONTAB := 03;
   aTipoMov[34].IDCONTAB := 03;
   aTipoMov[35].IDCONTAB := 03;
   aTipoMov[36].IDCONTAB := 03;
   aTipoMov[37].IDCONTAB := 03;
   aTipoMov[38].IDCONTAB := 03;
   aTipoMov[39].IDCONTAB := 03;
   aTipoMov[40].IDCONTAB := 03;
   aTipoMov[41].IDCONTAB := 03;
   aTipoMov[42].IDCONTAB := 03;
   aTipoMov[43].IDCONTAB := 03;
   aTipoMov[44].IDCONTAB := 03;
   aTipoMov[45].IDCONTAB := 03;
   aTipoMov[46].IDCONTAB := 03;
   aTipoMov[47].IDCONTAB := 03;
   aTipoMov[48].IDCONTAB := 03;
   aTipoMov[49].IDCONTAB := 03;
   aTipoMov[50].IDCONTAB := 03;
   aTipoMov[51].IDCONTAB := 03;
   aTipoMov[52].IDCONTAB := 03;
   aTipoMov[53].IDCONTAB := 03;
   aTipoMov[54].IDCONTAB := 03;
   aTipoMov[55].IDCONTAB := 03;
   aTipoMov[56].IDCONTAB := 03;
   aTipoMov[57].IDCONTAB := 03;
   aTipoMov[58].IDCONTAB := 03;
   aTipoMov[59].IDCONTAB := 03;
   aTipoMov[60].IDCONTAB := 03;
   aTipoMov[61].IDCONTAB := 03;
   aTipoMov[62].IDCONTAB := 03;
   aTipoMov[63].IDCONTAB := 03;
   aTipoMov[64].IDCONTAB := 03;
   aTipoMov[65].IDCONTAB := 03;
   aTipoMov[66].IDCONTAB := 03;
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
   begin
      bTransacao := False;
   end;
   //-------------------------------------------------------------------------------------
   try
      if not dtmAtivoFixo.qryTipoMov.Prepared then
         dtmAtivoFixo.qryTipoMov.Prepare;
      //----------------------------------------------------------------------------------
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Tipos de Movimentação (I)');
      dtmAtivoFixo.qryTipoMov.Open;
      iAux := 1;
      while iAux <= cMaxTipoMov do
      begin
         frmAguarde.Pos := iAux;
         if aTipoMov[iAux].DESCTIPOMOVIMENTACAO <> '' then
         begin
            if not (dtmAtivoFixo.qryTipoMov.Locate('IDTIPOMOVIMENTACAO',iAux,[])) then
            begin
               dtmAtivoFixo.qryTipoMov.Insert;
               dtmAtivoFixo.qryTipoMovIDTIPOMOVIMENTACAO.AsInteger  := iAux;
               dtmAtivoFixo.qryTipoMovDESCTIPOMOVIMENTACAO.AsString := aTipoMov[iAux].DESCTIPOMOVIMENTACAO;
               dtmAtivoFixo.qryTipoMovLANCAMENTO.AsString           := aTipoMov[iAux].LANCAMENTO;
               dtmAtivoFixo.qryTipoMovIDCONTAB.AsInteger            := aTipoMov[iAux].IDCONTAB;
               dtmAtivoFixo.qryTipoMov.Post;
            end else
            //----------------------------------------------------------------------------
            begin
               dtmAtivoFixo.qryTipoMov.Edit;
               dtmAtivoFixo.qryTipoMovDESCTIPOMOVIMENTACAO.AsString := aTipoMov[iAux].DESCTIPOMOVIMENTACAO;
               dtmAtivoFixo.qryTipoMovLANCAMENTO.AsString           := aTipoMov[iAux].LANCAMENTO;
               dtmAtivoFixo.qryTipoMovIDCONTAB.AsInteger            := aTipoMov[iAux].IDCONTAB;
               dtmAtivoFixo.qryTipoMov.Post;
            end;
            //----------------------------------------------------------------------------
         end;
         iAux := iAux + 1;
      end;
      dtmAtivoFixo.qryTipoMov.ApplyUpdates;
      if bTransacao then
         CommitTransacao;
      dtmAtivoFixo.qryTipoMov.Close;
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end else
      begin
         bTransacao := False;
      end;
      //----------------------------------------------------------------------------------
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Tipos de Movimentação (II)');
      iAux := 1;
      while iAux <= cMaxTipoMov do
      begin
         frmAguarde.Pos := iAux;
         if (aTipoMov[iAux].DESCTIPOMOVIMENTACAO = '') then
         begin
            dtmAtivoFixo.qryAux.Close;
            dtmAtivoFixo.qryAux.SQL.Text := ' DELETE FROM CONTASTIPOSMOVIMENTOGRUPOS ' +
                                            ' WHERE IDTIPOMOVIMENTACAO = ' + inttostr(iAux);
            dtmAtivoFixo.qryAux.ExecSQL;
            //----------------------------------------------------------------------------
            dtmAtivoFixo.qryAux.Close;
            dtmAtivoFixo.qryAux.SQL.Text := ' DELETE FROM TIPOSMOVIMENTOGRUPOS ' +
                                            ' WHERE IDTIPOMOVIMENTACAO = ' + inttostr(iAux);
            dtmAtivoFixo.qryAux.ExecSQL;
            //----------------------------------------------------------------------------
            dtmAtivoFixo.qryAux.Close;
            dtmAtivoFixo.qryAux.SQL.Text := ' DELETE FROM TIPOMOVIMENTACAO ' +
                                            ' WHERE IDTIPOMOVIMENTACAO = ' + inttostr(iAux);
            dtmAtivoFixo.qryAux.ExecSQL;
         end;
         iAux := iAux + 1;
      end;
      //----------------------------------------------------------------------------------
      frmAguarde.Apaga;
      if bTransacao then
         CommitTransacao;
   except
      frmAguarde.Apaga;
      if bTransacao then
         RollBackTransacao;
      raise;
   end;
end;
//========================================================================================
Procedure TAtivoFixo.CriaQry( Var q : TwwQuery );
Begin
    q := TwwQuery.Create(Application);
    q.DatabaseName  := 'BASEDADOS';
End;
//========================================================================================
Procedure TAtivoFixo.FreeQry( Var q : TwwQuery );
Begin
    q.Free;
End;

end.

