unit uAtivoFixo;

//----------------------------------------------------------------------------------------
//  ATENÇÃO: uAtivoFixo NECESSITA do DataModule dAtivoFixo/dtmAtivoFixo
//----------------------------------------------------------------------------------------
//
//  uAtivoFixo
//
//  Autor :  Sergio Fernandes de Almeida
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
            bFlgBemIntContab : Boolean; dDtaContab : tDateTime;
            bMostraMsg : boolean) : Integer;


   function RegistraEntradaTotal(iEmpresaProp,iBem : Integer; dDataIniDep : tDateTime;
                                 fValOrg,fValFis,fValGer : double;
                                 iSubConta, iAtivProjeto : Integer;
                                 bMostraMsg : boolean) : boolean;
   //=====================================================================================
   // Depreciação Pró-Rata
   //-------------------------------------------------------------------------------------
   function ContabilizaDepreciacao(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                   dDataLanc : TDate;
                                   fDeprec : Double;
                                   sDesBem,sAtivProjeto,sTipoTab : String;
                                   iSubConta : Integer; sPlaca : String;
                                   bMostraMsg : Boolean) : Boolean;
   //=====================================================================================
   // Baixa
   //-------------------------------------------------------------------------------------
   // Função que Contabiliza a Baixa do Bem / Reavaliacao do Bem
   function ContabilizaBaixa(iModulo, iPessoa, iGrupo, iConjunto, iBem:Integer;
                             dDataLanc : TDate; fBaixaB, fBaixaCMB, fBaixaD, fBaixaCMD : Extended;
                             sDesBem, sAtivProjeto, sTipoTab : String;
                             iSubConta : Integer; sPlaca, sPlaContaDestino : String;
                             bMostraMsg : Boolean) : Boolean;

   // Função que Contabiliza a Baixa do Bem / Reavaliacao do Bem
   function ContabilizaResultadoBaixa(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                      dDataLanc : TDate; fValResult : Extended;
                                      sDesBem,sAtivProjeto : String;
                                      iSubConta : Integer; sPlaca : String;
                                      bMostraMsg : Boolean) : Boolean;
   //=====================================================================================
   // Reavaliação
   //-------------------------------------------------------------------------------------
   function ContabilizaReavaliacao(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                   dDataLanc : TDate; fValReaval : Extended;
                                   sDesBem, sAtivProjeto : String;
                                   iSubConta : Integer; sPlaca : String;
                                   iExercicio, iPeriodo : Integer;
                                   bMostraMsg : Boolean) : Integer;

   //=====================================================================================
   // Acrescimo de Valor
   //-------------------------------------------------------------------------------------
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
                                 fValAcresc : Extended;
                                 sDesBem, sAtivProjeto : String;
                                 iSubConta : Integer; sPlaca : String;
                                 iExercicio, iPeriodo : Integer;
                                 bMostraMsg : Boolean) : Integer;

   //=====================================================================================
   //
   function ExecutaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                               dDataMov : tDateTime; bMostraMsg : boolean;
                               iTipDepProRata : Integer;
                               Var fDepCmBem, fDepDepLanc, fDepCmDep : Extended) : Boolean;

   //=====================================================================================
   // Função de Contabilização da Transferência
   Function ContabilizaTransferencia(iModulo, iEmpresaProp, iBem : Integer;
                                     dDataMov : tDateTime;
                                     iGrupoAtual, iGrupoNovo,
                                     iConjuntoAtual, iConjuntoNovo : Integer;
                                     sCCustoAtual, sCCustoNovo : String;
                                     iSubContaAtual, iSubContaNovo,
                                     iAtivProjetoAtual, iAtivProjetoNovo : Integer;
                                     Var fTrfValOrg, fTrfCmBem, fTrfDepLanc, fTrfCmDep,
                                     fTrfReavValOrg, fTrfReavCmBem, fTrfReavDepLanc, fTrfReavCmDep,
                                     fTrfAvValOrg, fTrfAvCmBem, fTrfAvDepLanc, fTrfAvCmDep : Extended;
                                     bMostraMsg : Boolean) : Integer;

   Function ContabilizaTransf(iModulo, iPessoa, iBem,
                              iGrupoAtual, iGrupoNovo,
                              iConjuntoAtual, iConjuntoNovo : Integer;
                              sCCustoAtual, sCCustoNovo : String;
                              dDataLanc : TDate;
                              fBaixaB, fBaixaCMB, fBaixaD, fBaixaCMD : Extended;
                              sDesBem,sAtivProjeto,sTipoTab : String;
                              iSubConta : Integer; sPlaca : String;
                              bMostraMsg : Boolean) : Integer;
   //
   //=====================================================================================
   // Função de Contabilização do Desmembramento
   function ContabilizaDesmembramento(iModulo,iPessoa,iBem,
                                      iGrupoFilho,iGrupoPai,
                                      iConjuntoFilho,iConjuntoPai : Integer;
                                      sCCustoFilho, sCCustoPai : String;
                                      dDataLanc : TDate;
                                      fBaixaB,fBaixaCMB,fBaixaD,fBaixaCMD : Extended;
                                      sDesBemFilho, sDesBemPai,
                                      sAtivProjeto, sTipoTab : String;
                                      iSubConta : Integer;
                                      sPlacaFilho, sPlacaPai : String;
                                      bMostraMsg : Boolean) : Boolean;
   //
   //=====================================================================================
   // Função que verifica se a movimentação está sendo feita em uma data permitida
   function VerificaPeriodoCaf(iEmpresaProp, iBem, iFlgImovel : Integer;
                               sTipoMov : String;
                               dDataMov : tDate;
                               var dDataUltMov, dDataUltDep : tDate) : Boolean;

   // Função de registro de lançamento em obras
   function RegistraLancObra(iCafObra, iEmpresaProp, iModulo : Integer;
                             dDtaLanc : tDate; iObraEtapa : Integer;
                             fValOfi, fValFis, fValGer, fValGerb : Currency;
                             sNumNota, sComplNota : String;
                             dDtaNota : tDate; iPlanilha, iGrupo,
                             iSubConta, iAtivProjeto : Integer;
                             bMostraMsg : Boolean) : Integer;

   // Função de contabilização de registro de lançamento em obras
   function ContabilizaLancObra(iModulo,iPessoa,iGrupo,
                                iExercicio, iPeriodo, iCafObra : Integer;
                                dDataLanc : TDate;
                                fValor : Extended;
                                sDescCafObra,sAtivProjeto : String;
                                iSubConta : Integer;
                                bMostraMsg : Boolean) : Integer;

   // Função que registra o Encerramento de Obra
   function RegistraEncerraObra(iSeqHist, iEmpresaProp, iCafObra : Integer;
                                dDtaEncerraObra : tDate;
                                bMostraMsg : Boolean) : Boolean;

   // Função de Contabilização do Encerramento de Obra
   function ContabilizaEncerraObra(iModulo,iPessoa,iBem,iConjunto,
                                   iGrupoObra, iGrupoBem,
                                   iExercicio, iPeriodo : Integer;
                                   dDataLanc : tDate; fValor : Extended;
                                   sDesBem,sAtivProjeto : String;
                                   iSubConta : Integer; sPlaca : String;
                                   bMostraMsg : Boolean) : Integer;
   public

   // Variavel que retorna a mensagem de excessão
   MensagemErro : String;

   // Função que corrige o bug da variável Double e Extended qdo em loop de SOMATÓRIO
   function ConvNum(fNum : Extended) : Extended;

   //=====================================================================================
   // Atualiza Saldo Contabil dos Bens
   //-------------------------------------------------------------------------------------
   function AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem : Integer;
                                   dDataSld : tDateTime;
                                   fValOrg, fCmBem, fDepLanc, fCmDep,
                                   fReavValOrg, fReavCmBem, fReavDepLanc,
                                   fReavCmDep, fUltReavValOrg, fUltReavCmBem,
                                   fUltReavDepLanc, fUltReavCmDep : Extended;
                                   iGrupo, iLocalizacao, iResponsavel,
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
            bFlgBemIntContab : Boolean; dDtaContab : tDateTime;
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
            bFlgBemIntContab : Boolean; dDtaContab : tDateTime;
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
                                   dDataLanc : TDate; fValOrg,fDepLanc,fCmBem,
                                   fCmDep : Extended; sDesBem,sAtivProjeto,sRegistro,
                                   sTipoMov, sTipoTab : String; iSubConta : Integer;
                                   sPlaca : String; bMostraMsg : Boolean) : Integer;

   //=====================================================================================
   // Função que executa a Entrada de um Bem no Ativo Fixo
   //-------------------------------------------------------------------------------------
   function ExecutaEntradaTotal(iModulo,iEmpresaProp,iBem : integer;
                                dDataIniDep : tDateTime; fValor : Extended;
                                iCodSubConta, iAtivProjeto : Integer;
                                bMostraMsg : boolean) : Integer;
   //=====================================================================================
   // Função que executa a baixa de um Bem
   //-------------------------------------------------------------------------------------
   function ExecutaBaixa(iModulo, iEmpresaProp, iBem, iMotivoBaixa : Integer;
                         dDataBaixa : tDate; iTipoPropBaixa : Integer;
                         Var fPropBaixa, fValVenda : Extended;
                         sObsBaixa, sPlaContaDestino : String;
                         iTipDepProRata : Integer; bMostraMsg : boolean;
                         Var fValResult, fValResultImob : Currency;
                         Var iPlanilha : Integer) : Boolean;

   function EstornaBaixa(iModulo, iEmpresaProp, iBem : Integer;
                         dDataMov,dDataEst : tDate;
                         bMostraMsg : boolean) : Integer;

   function RegistraBaixaBem(iSeqHist, iMotivoBaixa : Integer; fPropBaixar : Extended;
                             sObsBaixa : string; iIdReaval : Integer;
                             bMostraMsg : Boolean) : Boolean;

   //=====================================================================================
   // Função que executa a reavaliação de um Bem
   //-------------------------------------------------------------------------------------
   function ExecutaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                               dDataLaudo : tDate; fValLaudo : Double;
                               iVidaUtil : Integer;
                               sObs : String; Var fDifReaval, fDifReavalImob : Double;
                               iTipDepProRata : Integer; bMostraMsg : boolean) : Integer;

   // Função que registra a reavaliação na tabela REAVALIACAO
   function RegistraReavaliacao(iBem,iPessoa,iMov : Integer;
                                fValOrg,fValFis,fValGer,fCmBem,
                                fDepLanc,fDepFis,fDepGer,fCmDep,fTaxaDep : Double;
                                dData : tDateTime; iflgUltReaval : Integer;
                                dDataUltDep : tDateTime; iflgDeprec : Integer;
                                bMostraMsg : Boolean) : Integer;

   //=====================================================================================
   // Função que estorna a reavaliação de um Bem
   //-------------------------------------------------------------------------------------
   function EstornaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                               dDataMov,dDataEst : tDate;
                               bMostraMsg : boolean) : Integer;
   //
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
   // Função que executa a Troca do Número da Placa de Tombamento Patrimonial
   //-------------------------------------------------------------------------------------
   function ExecutaTransfPlaca(iModulo, iEmpresaProp, iBem : Integer;
                               fPlacaNova : double; dDataMov : tDateTime;
                               bMostraMsg : boolean) : boolean;

   //=====================================================================================
   // Função que executa a Transferencia de Grupo de um Bem
   //-------------------------------------------------------------------------------------
   function ExecutaTransferencia(iModulo, iEmpresaProp, iBem : Integer;
                                 iGrupoNovo : Integer; Var iConjuntoNovo, iLocalNovo,
                                 iRespNovo : Integer; dDataMov : tDateTime;
                                 Var fMovimentacao : Extended;
                                 bMostraMsg : boolean) : Integer;

   function EstornaTransferencia(iModulo, iEmpresaProp, iBem : Integer;
                                 dDataMov, dDataEst : tDate;
                                 iIdHistMovim : Integer;
                                 bMostraMsg : boolean) : Integer;
   //=====================================================================================
   // Função que executa o desmembramento de bens
   //-------------------------------------------------------------------------------------
   function ExecutaDesmembramento(iModulo, iEmpresaProp, iBem : Integer;
                                  dDataMov : tDate; iQtdBens : Integer;
                                  aGrupo           : Array of Integer;
                                  aConjunto        : Array of Integer;
                                  aPlaca           : Array of Extended;
                                  aDesBem          : Array of String;
                                  aProporcoes      : Array of Currency;
                                  Var aIdBemResult : Array of Integer;
                                  Var aSaldoContab : Array of Currency;
                                  bMostraMsg       : boolean) : Integer;

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
   // Funções de controle de obras
   //-------------------------------------------------------------------------------------
   function ExecutaLancObra(iModulo, iEmpresaProp, iCafObra, iObraEtapa,
                            iGrupo, iSubConta, iAtivProjeto : Integer;
                            dDtaLanc : tDate; fValOfi : Extended;
                            sNumNota, sComplNota : String;
                            dDtaNota : tDate; bMostraMsg : Boolean) : LongInt;
   function EstornaLancObra(iModulo, iEmpresaProp, iCafObra : Integer;
                            dDataMov, dDataEst : tDate;
                            iObraLanc : Integer;
                            bMostraMsg : boolean) : Integer;
   function ExecutaEncerraObra(iModulo,iEmpresaProp,iCafObra,iConjunto,iGrupo,iGrupoObra,
                               iSubConta,iAtivProjeto,iClasseBem : integer; fPlaca : double;
                               iSituacao : integer; sDescBem : string;
                               dDataInclusao : tDateTime; fValOrg : double;
                               dDataIniDep : tDateTime; fTaxaDep : double;
                               Var iPlanilha : Integer; bMostraMsg : boolean) : Integer;
   function EstornaEncerraObra(iModulo, iEmpresaProp, iCafObra, iBem : Integer;
                               dDataMov, dDataEst : tDate; bMostraMsg : boolean) : Integer;
   //=====================================================================================
   function Cotacao_Moeda(sMoeda : String; dData : tDateTime; bMostraMsg : boolean) : double;
   function CalculaSaldoContabil(iIdPessoa, iIdBem : Integer;dData : tDatetime;
                                 Var fSldCtbImob : Extended) : Extended;
   function TiraCaracter(sStr : string; sCh : Char) : string;
   function CompletaZeros(sCodigo : String; iTam : Integer) : string;
   function ComplZeros(sCodigo : String; iTam : Integer) : string;
   function CalculaTaxaDep(fDepLanc,fValOrg,fTaxaDepOrg : double; dDataMov : tDateTime) : double;
   Procedure ParamFatorPeriodo(var rFator : Extended; dDataUltDep,dDataMov : tDateTime);
   function VerificaPlaca(fPlaca : Extended; bMostraMsg : boolean) : Integer;
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
                                 sObsReaval : String; iTipDepProRata : Integer;
                                 bMostraMsg: boolean) : Integer;

   //=====================================================================================
   // Contabilização do ATIVO FIXO
   //-------------------------------------------------------------------------------------

   // Função que recebe os lancamentos e os acumula para posterior registro
   // Versão 2
   function MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                  sCcDeb, sCCCre, sAtivProjeto,
                                  sContaDeb, sContaCre, sNumDoc : string;
                                  fValLanc : Extended;
                                  iGrupo, iPlano, iSubConta : Integer;
                                  sNomeContaDeb, sObrigaSubContaDeb,
                                  sNomeContaCre, sObrigaSubContaCre : String;
                                  iBem, iPessoa, iTipoContab : Integer;
                                  bMostraMsg : Boolean) : Boolean;

   // Função que registra os Lancamentos da Movimentacao em um planilha na Contabilidade
   // Versão 2
   function RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo : Integer;
                                     dData : TDateTime; Var sMensagem : String;
                                     bMostraMsg : Boolean) : Integer;

   // Função que verifica se o Ativo Fixo está integrado a Contabilidade
   function IntegraContab(iEmpresaProp : Integer) : boolean;

   // Função que verifica o modo de estorno de planilhas contábeis
   function RemovePlanContab(iEmpresaProp : Integer) : boolean;

   // Função que localiza a conta contábil e o centro de custo de um tipo de
   // movimentação em um grupo
   procedure Localiza_ContaContabil(iGrupo, iTipoMovimentacao: Integer;
                                    sDebCred : string; iPlano : Integer;
                                    var sPlaConta : string);

   // Função que localiza a descrição de um grupo
   function Busca_Grupo(iPessoa,iGrupo : Integer) : String;

   // Função que verifica se a data da movimentacao pode ser contabilizada
   function VerificaPeriodoContabil(iEmpresa : Integer; dData: TDate;
                                    Var iExercicio, iPeriodo : Integer;
                                    Var sMensagem : String;
                                    bMostraMsg : Boolean) : Boolean;

   // Procedimento que atualiza a tabela TIPOMOVIMENTACAO
   Procedure GeraTipoMovimentacao;
   //
   Procedure CriaQry( Var q : TwwQuery );
   //
   Procedure FreeQry( Var q : TwwQuery );

   end;

var
   AtivoFixo : TAtivoFixo;

implementation

uses
   uSistema, uAutorizacao, dBaseDados, uDatabase, dAtivoFixo, uLancContab,
   uIntegraBack, uDiasUteis, uFuncaoGeral, fAguarde;

//========================================================================================
// Função que corrige o bug da variável Double e Extended qdo em loop de acumulação
//----------------------------------------------------------------------------------------
function TAtivoFixo.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;
//========================================================================================
// Função que verifica se a movimentação está sendo feita em uma data permitida
//----------------------------------------------------------------------------------------
function TAtivoFixo.VerificaPlaca(fPlaca : Extended; bMostraMsg : Boolean) : Integer;
begin
   with dtmAtivoFixo do
   begin
      if not qryPlaca.Prepared then qryPlaca.Prepare;
      //----------------------------------------------------------------------------------
      qryPlaca.Close;
      qryPlaca.ParamByName('PIDPLACA').AsFloat := fPlaca;
      qryPlaca.Open;
      if not qryPlaca.isEmpty then
      begin
         MensagemErro := 'Número de TOMBAMENTO já alocado a outro Bem!' + #13 + '( Sequence No. ' +
                         qryPlaca.FieldByName('IDBEM').AsString + ' - ' +
                         trim(qryPlaca.FieldByName('DESBEM').AsString) + ' )';
         Result := qryPlaca.FieldByName('IDBEM').AsInteger;
      end else
      begin
         MensagemErro := '';
         Result := 0;
      end;
   end;
end;
//========================================================================================
// Função que verifica se a movimentação está sendo feita em uma data permitida
//----------------------------------------------------------------------------------------
function TAtivoFixo.VerificaPeriodoCaf(iEmpresaProp, iBem, iFlgImovel : Integer;
                                       sTipoMov : String;
                                       dDataMov : tDate;
                                       var dDataUltMov, dDataUltDep : tDate) : Boolean;
var
   qryUltMov, qryAux : TwwQuery;
   iAno, iMes, iDia : Word;
   dDataIni, dDataFim : tDate;

begin
   qryUltMov := TwwQuery(dtmAtivoFixo.qryUltMov);
   qryAux    := TwwQuery(dtmAtivoFixo.qryAux);
   dDataUltMov := 0;
   dDataUltDep := 0;
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) then
   begin
      Result := True;
      qryUltMov.Close;
      exit;
   end;
   dDataUltMov := qryUltMov.FieldByName('DATAULTMOV').AsDateTime;
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Text := ' SELECT MAX(DATAULTDEP) AS DTAULTFECHAMENTO ' +
                      ' FROM GRUPO ' +
                      ' WHERE (FLGIMOVEL = ' + inttostr(iFlgImovel) + ')';
   qryAux.Open;
   if (qryAux.IsEmpty) or (qryAux.FieldByName('DTAULTFECHAMENTO').IsNull) then
   begin
      Result := True;
      qryUltMov.Close;
      qryAux.Close;
      exit;
   end;
   dDataUltDep := qryAux.FieldByName('DTAULTFECHAMENTO').AsDateTime;
   //-------------------------------------------------------------------------------------
   // Verifica se a movimentação já ocorreu na data
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Text := ' SELECT DATAMOVIMENTACAO ' +
                      ' FROM HISTORICOMOVIMENTACAO ' +
                      ' WHERE (IDBEM = ' + inttostr(iBem) + ')' +
                      '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                      '   AND (IDTIPOMOVIMENTACAO IN ( ' + sTipoMov + ' ))' +
                      '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))';
   qryAux.Open;
   if not qryAux.IsEmpty then
   begin
      MensagemErro := 'Já existe esta movimentação na data. Consulte Histórico de Movimentações!';
      qryUltMov.Close;
      qryAux.Close;
      Result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > (dDataMov + 1)) then
   begin
      MensagemErro := 'Existem movimentações com data posterior. Consulte Histórico de Movimentações!';
      qryUltMov.Close;
      qryAux.Close;
      Result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   dDataIni := dDataUltDep + 1;
   DecodeDate(dDataIni,iAno,iMes,iDia);
   dDataFim := DiasUteis.UltDiaMes(iAno,iMes);
   if (dDataMov > dDataFim) then
   begin
      MensagemErro := 'Período ainda não iniciado pelo Controle do Ativo Fixo!' + #13 +
                      'Impossível gerar lançamento de movimentação.' + #13 +
                      'Altere a data de movimentação.';
      Result := False;
   end else
   if (dDataMov < dDataIni) then
   begin
      MensagemErro := 'Período já encerrado pelo Controle do Ativo Fixo!' + #13 +
                      'Impossível gerar lançamento de movimentação.' + #13 +
                      'Altere a data de movimentação.';
      Result := False;
   end else
      Result := True;
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryAux.Close;
end;
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
                                         sObsReaval : String; iTipDepProRata : Integer;
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
         // Códigos :
         // 0 - [DataMovimentacao - 1] , 1 - [DataMovimentacao] , 2 - [Fechamento]
         //-------------------------------------------------------------------------------
         ParamByName('TIPDEPPRORATA').asInteger     := iTipDepProRata;
         //-------------------------------------------------------------------------------
         if iReavalAcresc <= 0 then
            ParamByName('IDREAVALACRESC').Clear
         else
            ParamByName('IDREAVALACRESC').AsInteger := iReavalAcresc;
         //-------------------------------------------------------------------------------
         if abs(fValOfi) >= 0.01 then
         begin
            ParamByName('VALOFI').AsCurrency := strtofloat(FormatFloat('#0.00',((fValOfi * 100) / 100)));
            ParamByName('VALGER').AsCurrency := strtofloat(FormatFloat('#0.00',((fValGer * 100) / 100)));
            ParamByName('VALFIS').AsCurrency := strtofloat(FormatFloat('#0.00',((fValFis * 100) / 100)));
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
         if iGrupAnt <= 0 then
            ParamByName('IDGRUPANT').Clear
         else
            ParamByName('IDGRUPANT').AsInteger := iGrupAnt;
         //-------------------------------------------------------------------------------
         if iConjAnt <= 0 then
            ParamByName('IDCONJANT').Clear
         else
            ParamByName('IDCONJANT').AsInteger := iConjAnt;
         //-------------------------------------------------------------------------------
         if iLocalAnt <= 0 then
            ParamByName('IDLOCALANT').Clear
         else
            ParamByName('IDLOCALANT').AsInteger := iLocalAnt;
         //-------------------------------------------------------------------------------
         if iRespAnt <= 0 then
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
         if iPlanilha <= 0 then
            ParamByName('PLANILHA').Clear
         else
            ParamByName('PLANILHA').asInteger := iPlanilha;
         //-------------------------------------------------------------------------------
         // Registra para o trigger da tabela que é o NOVO CAF que está sendo executado
         //-------------------------------------------------------------------------------
         ParamByName('FLGNCAF').asInteger := 1;
         //-------------------------------------------------------------------------------
         ExecSQL;
         if RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível registrar em HISTORICOMOVIMENTACAO!');
      end;
      Result := iMovimentacao;
   except
      On E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
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
                                           iGrupo, iLocalizacao, iResponsavel,
                                           iCodMov : Integer) : Boolean;
var
   fSValOrg,fSCmBem,fSDepLanc,fSCmDep,
   fSReavValOrg,fSReavCmBem,fSReavDepLanc,fSReavCmDep,
   fSUltReavValOrg,fSUltReavCmBem,fSUltReavDepLanc,fSUltReavCmDep : Extended;
   isGrupo, isLocalizacao, isResponsavel : Integer;
   dDataMov : tDateTime;

begin
   try
      with dtmAtivoFixo do
      begin
         qryParamCAF.Close;
         qryParamCAF.ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
         qryParamCAF.Open;
         //-------------------------------------------------------------------------------
         if qryParamCAF.FieldByName('TIPATUSALDOCONTAB').AsInteger = 0 then
         begin
            if sprSaldoContabBem.Prepared then sprSaldoContabBem.UnPrepare;
            sprSaldoContabBem.Prepare;
            //----------------------------------------------------------------------------
            sprSaldoContabBem.ParamByName('PIDBEM').AsInteger         := iBem;
            sprSaldoContabBem.ParamByName('PIDPESSOA').AsInteger      := iEmpresaProp;
            sprSaldoContabBem.ParamByName('PDATASLDBEM').AsDateTime   := dDataSld;
            sprSaldoContabBem.ParamByName('PVALORG').AsFloat          := fValOrg;
            sprSaldoContabBem.ParamByName('PCMBEM').AsFloat           := fCmBem;
            sprSaldoContabBem.ParamByName('PDEPLANC').AsFloat         := fDepLanc;
            sprSaldoContabBem.ParamByName('PCMDEP').AsFloat           := fCmDep;
            sprSaldoContabBem.ParamByName('PREAVVALORG').AsFloat      := fReavValOrg;
            sprSaldoContabBem.ParamByName('PREAVCMBEM').AsFloat       := fReavCmBem;
            sprSaldoContabBem.ParamByName('PREAVDEPLANC').AsFloat     := fReavDepLanc;
            sprSaldoContabBem.ParamByName('PREAVCMDEP').AsFloat       := fReavCmDep;
            sprSaldoContabBem.ParamByName('PULTREAVVALORG').AsFloat   := fUltReavValOrg;
            sprSaldoContabBem.ParamByName('PULTREAVCMBEM').AsFloat    := fUltReavCmBem;
            sprSaldoContabBem.ParamByName('PULTREAVDEPLANC').AsFloat  := fUltReavDepLanc;
            sprSaldoContabBem.ParamByName('PULTREAVCMDEP').AsFloat    := fUltReavCmDep;
            sprSaldoContabBem.ParamByName('PIDGRUPO').AsInteger       := iGrupo;
            sprSaldoContabBem.ParamByName('PIDLOCALIZACAO').AsInteger := iLocalizacao;
            sprSaldoContabBem.ParamByName('PIDRESPONSAVEL').AsInteger := iResponsavel;
            sprSaldoContabBem.ParamByName('PCODMOV').AsInteger        := iCodMov;
            sprSaldoContabBem.ExecProc;
         end else
         begin
            if not qrySaldoContabBem.Prepared then qrySaldoContabBem.Prepare;
            //----------------------------------------------------------------------------
            if iCodMov = 2 then
            begin
               qryAux.Close;
               qryAux.SQL.Text := ' DELETE FROM SALDOCONTABBEM ' +
                                  ' WHERE (IDBEM = ' + inttostr(iBem) + ')' +
                                  '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                                  '   AND (DATASLDBEM >= TO_DATE('+ #39 + datetostr(dDataSld) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))';
               qryAux.ExecSQL;
            end;
            //----------------------------------------------------------------------------
            // Posiciona a tabela de Saldos na Data
            //----------------------------------------------------------------------------
            qrySaldoContabBem.Close;
            qrySaldoContabBem.ParamByName('PIDBEM').AsInteger    := iBem;
            qrySaldoContabBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qrySaldoContabBem.ParamByName('PDATASLD').AsDateTime := dDataSld;
            qrySaldoContabBem.Open;
            //----------------------------------------------------------------------------
            // Inicializa as variáveis de trabalho
            //----------------------------------------------------------------------------
            if not qrySaldoContabBem.IsEmpty then
            begin
               fSValOrg         := qrySaldoContabBem.FieldByName('VALORG').AsFloat;
               fSCmBem          := qrySaldoContabBem.FieldByName('CMBEM').AsFloat;
               fSDepLanc        := qrySaldoContabBem.FieldByName('DEPLANC').AsFloat;
               fSCmDep          := qrySaldoContabBem.FieldByName('CMDEP').AsFloat;
               fSReavValOrg     := qrySaldoContabBem.FieldByName('REAVVALORG').AsFloat;
               fSReavCmBem      := qrySaldoContabBem.FieldByName('REAVCMBEM').AsFloat;
               fSReavDepLanc    := qrySaldoContabBem.FieldByName('REAVDEPLANC').AsFloat;
               fSReavCmDep      := qrySaldoContabBem.FieldByName('REAVCMDEP').AsFloat;
               fSUltReavValOrg  := qrySaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat;
               fSUltReavCmBem   := qrySaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
               fSUltReavDepLanc := qrySaldoContabBem.FieldByName('ULTREAVDEPLANC').AsFloat;
               fSUltReavCmDep   := qrySaldoContabBem.FieldByName('ULTREAVCMDEP').AsFloat;
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
            //----------------------------------------------------------------------------
            isGrupo       := iGrupo;
            isLocalizacao := iLocalizacao;
            isResponsavel := iResponsavel;
            if (isGrupo = 0) or (isLocalizacao = 0) or (isResponsavel = 0) then
               Raise Exception.Create('Dados necessários ao Saldo Contábil do Bem estão inválidos!' + #13 +
                                      'IDGRUPO = ' + inttostr(isGrupo) + ' IDLOCALIZACAO = ' + inttostr(isLocalizacao) + ' IDRESPONSAVEL = ' + inttostr(isResponsavel));
            //----------------------------------------------------------------------------
            // Caso a data de Atualização já exista no cadastro, atualizar dados
            //----------------------------------------------------------------------------
            if iCodMov = 0 then // MOVIMENTAÇÕES, EXCETO REAVALIAÇÃO //
            begin
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
                  //----------------------------------------------------------------------
                  qrySaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
                  qrySaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
                  qrySaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
                  //----------------------------------------------------------------------
                  qrySaldoContabBem.Post;
                  qrySaldoContabBem.ApplyUpdates;
               end else
               //-------------------------------------------------------------------------
               // Caso a data de Atualização não exista no cadastro, inserir saldo
               //-------------------------------------------------------------------------
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
                  //----------------------------------------------------------------------
                  qrySaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
                  qrySaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
                  qrySaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
                  //----------------------------------------------------------------------
                  qrySaldoContabBem.Post;
                  qrySaldoContabBem.ApplyUpdates;
               end;
            end else
            if iCodMov = 1 then // REAVALIAÇÕES //
            begin
               if qrySaldoContabBemDATASLDBEM.AsDateTime = dDataSld then
               begin
                  qrySaldoContabBem.Edit;
                  qrySaldoContabBemVALORG.AsFloat         := fSValOrg         + fValOrg;
                  qrySaldoContabBemCMBEM.AsFloat          := fSCmBem          + fCmBem;
                  qrySaldoContabBemDEPLANC.AsFloat        := fSDepLanc        + fDepLanc;
                  qrySaldoContabBemCMDEP.AsFloat          := fSCmDep          + fCmDep;
                  qrySaldoContabBemREAVVALORG.AsFloat     := fSReavValOrg     + fSUltReavValOrg;
                  qrySaldoContabBemREAVCMBEM.AsFloat      := fSReavCmBem      + fSUltReavCmBem;
                  qrySaldoContabBemREAVDEPLANC.AsFloat    := fSReavDepLanc    + fSUltReavDepLanc;
                  qrySaldoContabBemREAVCMDEP.AsFloat      := fSReavCmDep      + fSUltReavCmDep;
                  qrySaldoContabBemULTREAVVALORG.AsFloat  := fUltReavValOrg;
                  qrySaldoContabBemULTREAVCMBEM.AsFloat   := fUltReavCmBem;
                  qrySaldoContabBemULTREAVDEPLANC.AsFloat := fUltReavDepLanc;
                  qrySaldoContabBemULTREAVCMDEP.AsFloat   := fUltReavCmDep;
                  //----------------------------------------------------------------------
                  qrySaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
                  qrySaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
                  qrySaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
                  //----------------------------------------------------------------------
                  qrySaldoContabBem.Post;
                  qrySaldoContabBem.ApplyUpdates;
               end else
               //-------------------------------------------------------------------------
               // Caso a data de Atualização não exista no cadastro, inserir saldo
               //-------------------------------------------------------------------------
               begin
                  qrySaldoContabBem.Append;
                  qrySaldoContabBemIDBEM.AsInteger        := iBem;
                  qrySaldoContabBemIDPESSOA.AsInteger     := iEmpresaProp;
                  qrySaldoContabBemDATASLDBEM.AsDateTime  := dDataSld;
                  qrySaldoContabBemVALORG.AsFloat         := fSValOrg      + fValOrg;
                  qrySaldoContabBemCMBEM.AsFloat          := fSCmBem       + fCmBem;
                  qrySaldoContabBemDEPLANC.AsFloat        := fSDepLanc     + fDepLanc;
                  qrySaldoContabBemCMDEP.AsFloat          := fSCmDep       + fCmDep;
                  qrySaldoContabBemREAVVALORG.AsFloat     := fSReavValOrg  + fSUltReavValOrg;
                  qrySaldoContabBemREAVCMBEM.AsFloat      := fSReavCmBem   + fSUltReavCmBem;
                  qrySaldoContabBemREAVDEPLANC.AsFloat    := fSReavDepLanc + fSUltReavDepLanc;
                  qrySaldoContabBemREAVCMDEP.AsFloat      := fSReavCmDep   + fSUltReavCmDep;
                  qrySaldoContabBemULTREAVVALORG.AsFloat  := fUltReavValOrg;
                  qrySaldoContabBemULTREAVCMBEM.AsFloat   := fUltReavCmBem;
                  qrySaldoContabBemULTREAVDEPLANC.AsFloat := fUltReavDepLanc;
                  qrySaldoContabBemULTREAVCMDEP.AsFloat   := fUltReavCmDep;
                  //----------------------------------------------------------------------
                  qrySaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
                  qrySaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
                  qrySaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
                  //----------------------------------------------------------------------
                  qrySaldoContabBem.Post;
                  qrySaldoContabBem.ApplyUpdates;
               end;
            end else
            if iCodMov = 2 then // ESTORNOS //
            begin
               //-------------------------------------------------------------------------
               // Reconstroi o Saldo a partir da data da movimentação estornada
               //-------------------------------------------------------------------------
               if not qryMovContabBem.Prepared then
                  qryMovContabBem.Prepare;
               //-------------------------------------------------------------------------
               qryMovContabBem.Close;
               qryMovContabBem.ParamByName('PIDBEM').AsInteger    := iBem;
               qryMovContabBem.ParamByName('PDATASLD').AsDateTime := dDataSld;
               qryMovContabBem.Open;
               while not qryMovContabBem.EOF do
               begin
                  fSValOrg         := fSValOrg         + qryMovContabBem.FieldByName('VALORG').AsFloat;
                  fSCmBem          := fSCmBem          + qryMovContabBem.FieldByName('CMBEM').AsFloat;
                  fSDepLanc        := fSDepLanc        + qryMovContabBem.FieldByName('DEPLANC').AsFloat;
                  fSCmDep          := fSCmDep          + qryMovContabBem.FieldByName('CMDEP').AsFloat;
                  fSReavValOrg     := fSReavValOrg     + qryMovContabBem.FieldByName('REAVVALORG').AsFloat;
                  fSReavCmBem      := fSReavCmBem      + qryMovContabBem.FieldByName('REAVCMBEM').AsFloat;
                  fSReavDepLanc    := fSReavDepLanc    + qryMovContabBem.FieldByName('REAVDEPLANC').AsFloat;
                  fSReavCmDep      := fSReavCmDep      + qryMovContabBem.FieldByName('REAVCMDEP').AsFloat;
                  fSUltReavValOrg  := fSUltReavValOrg  + qryMovContabBem.FieldByName('ULTREAVVALORG').AsFloat;
                  fSUltReavCmBem   := fSUltReavCmBem   + qryMovContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
                  fSUltReavDepLanc := fSUltReavDepLanc + qryMovContabBem.FieldByName('ULTREAVDEPLANC').AsFloat;
                  fSUltReavCmDep   := fSUltReavCmDep   + qryMovContabBem.FieldByName('ULTREAVCMDEP').AsFloat;
                  //----------------------------------------------------------------------
                  qrySaldoContabBem.Append;
                  qrySaldoContabBem.FieldByName('IDBEM').AsInteger        := qryMovContabBem.FieldByName('IDBEM').AsInteger;
                  qrySaldoContabBem.FieldByName('IDPESSOA').AsInteger     := qryMovContabBem.FieldByName('IDPESSOA').AsInteger;
                  qrySaldoContabBem.FieldByName('DATASLDBEM').AsDateTime  := qryMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  qrySaldoContabBem.FieldByName('VALORG').AsFloat         := fSValOrg;
                  qrySaldoContabBem.FieldByName('CMBEM').AsFloat          := fSCmBem;
                  qrySaldoContabBem.FieldByName('DEPLANC').AsFloat        := fSDepLanc;
                  qrySaldoContabBem.FieldByName('CMDEP').AsFloat          := fSCmDep;
                  qrySaldoContabBem.FieldByName('REAVVALORG').AsFloat     := fSReavValOrg;
                  qrySaldoContabBem.FieldByName('REAVCMBEM').AsFloat      := fSReavCmBem;
                  qrySaldoContabBem.FieldByName('REAVDEPLANC').AsFloat    := fSReavDepLanc;
                  qrySaldoContabBem.FieldByName('REAVCMDEP').AsFloat      := fSReavCmDep;
                  qrySaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat  := fSUltReavValOrg;
                  qrySaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat   := fSUltReavCmBem;
                  qrySaldoContabBem.FieldByName('ULTREAVDEPLANC').AsFloat := fSUltReavDepLanc;
                  qrySaldoContabBem.FieldByName('ULTREAVCMDEP').AsFloat   := fSUltReavCmDep;
                  qrySaldoContabBem.Post;
                  qrySaldoContabBem.ApplyUpdates;
                  //----------------------------------------------------------------------
                  qryMovContabBem.Next;
               end;
               qryMovContabBem.Close;
               //-------------------------------------------------------------------------
               // Recoloca os grupos/localizações/responsáveis dos saldos reconstruidos
               //-------------------------------------------------------------------------
               qrySaldoContabBem.Last;
               while not qrySaldoContabBem.BOF do
               begin
                  //----------------------------------------------------------------------
                  // Dados anteriores do bem
                  //----------------------------------------------------------------------
                  qryMovTransf.Close;
                  qryMovTransf.ParamByName('IDBEM').AsInteger    := iBem;
                  qryMovTransf.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
                  qryMovTransf.Open;
                  //----------------------------------------------------------------------
                  while (not qrySaldoContabBem.BOF) and (qrySaldoContabBem.FieldByName('IDBEM').AsInteger = iBem) and
                                                        (qrySaldoContabBem.FieldByName('IDPESSOA').AsInteger = iEmpresaProp) do
                  begin
                     //-------------------------------------------------------------------
                     // Atualiza os dados na tabela SALDOCONTABBEM
                     //-------------------------------------------------------------------
                     qrySaldoContabBem.Edit;
                     qrySaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
                     qrySaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
                     qrySaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
                     qrySaldoContabBem.Post;
                     qrySaldoContabBem.ApplyUpdates;
                     //-------------------------------------------------------------------
                     // Verifica mudança no grupo, localização ou responsável do bem
                     //-------------------------------------------------------------------
                     if qrySaldoContabBem.FieldByName('DATASLDBEM').AsDateTime = qryMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime then
                     begin
                        dDataMov := qryMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                        while (not qryMovTransf.EOF) and
                              (qryMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime = dDataMov) do
                        begin
                           if not qryMovTransf.FieldByName('IDGRUPANT').IsNull then
                              isGrupo := qryMovTransf.FieldByName('IDGRUPANT').AsInteger;
                           if not qryMovTransf.FieldByName('IDLOCALANT').IsNull then
                              isLocalizacao := qryMovTransf.FieldByName('IDLOCALANT').AsInteger;
                           if not qryMovTransf.FieldByName('IDRESPANT').IsNull then
                              isResponsavel := qryMovTransf.FieldByName('IDRESPANT').AsInteger;
                           qryMovTransf.Next;
                        end;
                     end;
                     //-------------------------------------------------------------------
                     qrySaldoContabBem.Prior;
                  end;
               end;
            end;
            qrySaldoContabBem.Close;
         end;
      end;
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que executa a depreciacao de um bem
//----------------------------------------------------------------------------------------
// ATENÇÃO : Resta desenvolver o módulo de Correção Monetária
//----------------------------------------------------------------------------------------
function TAtivoFixo.ExecutaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                                       dDataMov : tDateTime; bMostraMsg : boolean;
                                       iTipDepProRata : Integer;
                                       Var fDepCmBem, fDepDepLanc, fDepCmDep : Extended) : Boolean;

Var
   idMoeda, iPosition, iSeqHist, iTipoMovimentacao,
   iaIdHistMov, iPlanilha, iExercicio, iPeriodo,
   iAux, iRecCount, iRecTotDeprec                  : Integer;
   fValAnt,fValAtual, fCorrecao,
   rTaxa,rFator,
   DepTotalO,DepTotalF,DepTotalG,CorrDep,ValOfi    : Extended;
   sMesRef, sMesRefA,
   Debito,DebitoCm,Credito,CreditoCm,
   Tipo,sAtivProjeto,sMensagem                     : String;
   dDataInicioDep,dDataUltDep,dDataUltDepAnt       : tDateTime;
   qryBem,
   qryReavaliacao,qryAcrescimo,qryUltDep           : TwwQuery;
   bTransacao, bPlanilha, bHouveDepreciacao,
   bFlgDeprec                                      : Boolean;
   aIdHistMov                                      : array [1..244] of Integer;
   iDia, iMes, iAno                                : Word;

begin
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // Caso o dia da movimentação seja 01, não calcular o pró-rata (CBS em 06/12/2001)
      //----------------------------------------------------------------------------------
      if iTipDepProRata = 0 then
      begin
         DecodeDate((dDataMov + 1),iAno,iMes,iDia);
      end else
      begin
         DecodeDate(dDataMov,iAno,iMes,iDia);
      end;
      if iDia = 1 then
      begin
         Result := True;
         Exit;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryUltDep.Prepared then qryUltDep.Prepare;
         if not qryMontaCtb.Prepared then qryMontaCtb.Prepare;
         if not qryGrupoCtb.Prepared then qryGrupoCtb.Prepare;
         if not qryConta.Prepared then qryConta.Prepare;
         if not qryCCrd.Prepared then qryCCrd.Prepare;
         if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
         if not qryMontaCtb.Active then qryMontaCtb.Open;
      end;
      //----------------------------------------------------------------------------------
      qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
      qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
      qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
      qryUltDep      := TwwQuery(dtmAtivoFixo.qryUltDep);
      //----------------------------------------------------------------------------------
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
      //----------------------------------------------------------------------------------
      // verifica se o bem ja está totalmente depreciado
      //----------------------------------------------------------------------------------
      iRecTotDeprec := 0;
      iRecCount     := 0;
      if qryBem.FieldByName('FLGDEPREC').AsInteger = 1 then
      begin
         iRecTotDeprec := iRecTotDeprec + 1;
      end;
      iRecCount  := iRecCount  + 1;
      //----------------------------------------------------------------------------------
      while not qryReavaliacao.EOF do
      begin
         if qryReavaliacao.FieldByName('FLGDEPREC').AsInteger = 1 then
         begin
            iRecTotDeprec := iRecTotDeprec + 1;
         end;
         iRecCount  := iRecCount  + 1;
         qryReavaliacao.Next;
      end;
      qryReavaliacao.First;
      //----------------------------------------------------------------------------------
      while not qryAcrescimo.EOF do
      begin
         if qryAcrescimo.FieldByName('FLGDEPREC').AsInteger = 1 then
         begin
            iRecTotDeprec := iRecTotDeprec + 1;
         end;
         iRecCount  := iRecCount  + 1;
         qryAcrescimo.Next;
      end;
      qryAcrescimo.First;
      //----------------------------------------------------------------------------------
      if iRecTotDeprec <> iRecCount then
         bFlgDeprec := False
      else
         bFlgDeprec := True;
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após a Depreciacao
      //----------------------------------------------------------------------------------
      if not bFlgDeprec then
      begin
         qryUltDep.Close;
         qryUltDep.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qryUltDep.ParamByName('PIDBEM').AsInteger    := iBem;
         qryUltDep.Open;
         if (qryUltDep.IsEmpty) or (qryUltDep.FieldByName('DATAULTDEP').AsDateTime > dDataMov) then
            Raise Exception.Create('Existe Depreciação com data posterior a esta movimentação no Bem ' +
                                   qryBem.FieldByName('PLACA').AsString + #13 +
                                   'Consulte Histórico de Movimentações!');
         //-------------------------------------------------------------------------------
         // Verifica se a data da movimentacao esta muito alem do periodo
         //-------------------------------------------------------------------------------
         if qryUltDep.FieldByName('DATAULTDEP').AsDateTime <> 0 then
            if (dDataMov - qryUltDep.FieldByName('DATAULTDEP').AsDateTime) > 40 then
               Raise Exception.Create('A data da movimentação está muito adiante ' + #13 +
                                      'do último fechamento ('+qryUltDep.FieldByName('DATAULTDEP').AsString+') do bem ' +
                                      qryBem.FieldByName('PLACA').AsString + '! ' + #13 +
                                      'Consulte Histórico de Movimentações!');
         //-------------------------------------------------------------------------------
         qryUltDep.Close;
      end;
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         if not VerificaPeriodoContabil(iEmpresaProp, dDataMov, iExercicio, iPeriodo,
                                        sMensagem, bMostraMsg) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('UNIDNEGOC').IsNull then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               Close;
               ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
               Open;
               if not IsEmpty then
                  sAtivProjeto := FieldByName('ATIVPROJETO').AsString
               else
                  sAtivProjeto := '';
            end;
         end else
         begin
            sAtivProjeto := qryBem.FieldByName('UNIDNEGOC').AsString;
         end;
      end;
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
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
         qryBem.FieldByName('DATAULTDEP').AsDateTime := dDataInicioDep;
         dDataUltDep := dDataInicioDep;
      end else
      begin
         if qryBem.FieldByName('DATAULTDEP').AsDateTime > qryBem.FieldByName('DATAINICIODEP').AsDateTime then
         begin
            dDataUltDep := qryBem.FieldByName('DATAULTDEP').AsDateTime;
         end else
         begin
            dDataUltDep := qryBem.FieldByName('DATAULTDEP').AsDateTime;
            qryBem.FieldByName('DATAULTDEP').AsDateTime := qryBem.FieldByName('DATAINICIODEP').AsDateTime;
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
          (rFator <> 0) and (qryBem.FieldByName('TAXADEP').AsFloat <> 0) then
      begin
         //-------------------------------------------------------------------------------
         rTaxa     := ((qryBem.FieldByName('TAXADEP').AsFloat / 100) * rFator);
         DepTotalO := (rTaxa * (qryBem.FieldByName('VALORG').AsFloat +
                                qryBem.FieldByName('CMBEM').AsFloat));
         if abs(DepTotalO) >= 0.01 then
            DepTotalO := strtofloat(FormatFloat('#0.00',((DepTotalO * 100) / 100)));
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
         if DepTotalO <> 0 then
         begin
            //----------------------------------------------------------------------------
            // Registra o Historico de Movimentacao
            //----------------------------------------------------------------------------
            iTipoMovimentacao := 14;
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                             dDataMov,-1,DepTotalO,0,0,dDataUltDepAnt,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,True);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
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
                                          qryBem.FieldByName('IDGRUPO').AsInteger,
                                          qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                          qryBem.FieldByName('IDRESPONSAVEL').AsInteger,0) then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            // Lançamentos Contábeis
            //----------------------------------------------------------------------------
            if IntegraContab(iEmpresaProp) then
            begin
               if not ContabilizaDepreciacao(iModulo,
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
                                             bMostraMsg) then
                  Raise Exception.Create(MensagemErro);
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
               DepTotalO := strtofloat(FormatFloat('#0.00',((DepTotalO * 100) / 100)));
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
                                                -1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,True);
               if iSeqHist = -1 then
                  Raise Exception.Create(MensagemErro);
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
                                                qryBem.FieldByName('IDGRUPO').AsInteger,
                                                qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 0) then
                     Raise Exception.Create(MensagemErro);
               end else
               begin
                  if not AtualizaSaldoContabBem(Sistema.IdModulo,
                                                qryReavaliacao.FieldByName('IDPESSOA').AsInteger,
                                                qryReavaliacao.FieldByName('IDBEM').AsInteger,
                                                dDataMov,
                                                0,0,0,0,
                                                0,0,0,0,
                                                0,0,DepTotalO,0,
                                                qryBem.FieldByName('IDGRUPO').AsInteger,
                                                qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 0) then
                     Raise Exception.Create(MensagemErro);
               end;
               //-------------------------------------------------------------------------
               // Lançamentos Contábeis
               //-------------------------------------------------------------------------
               if IntegraContab(iEmpresaProp) then
               begin
                  if not ContabilizaDepreciacao(iModulo,
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
                                                bMostraMsg) then
                     Raise Exception.Create(MensagemErro);
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
               DepTotalO := strtofloat(FormatFloat('#0.00',((DepTotalO * 100) / 100)));
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
                                                -1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,True);
               if iSeqHist = -1 then
                  Raise Exception.Create(MensagemErro);
               inc(iaIdHistMov);
               aIdHistMov[iaIdHistMov] := iSeqHist;
               //-------------------------------------------------------------------------
               qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
               qryAcrescimo.Post;
               //-------------------------------------------------------------------------
               // Atualiza a Tabela SALDOCONTABBEM
               //-------------------------------------------------------------------------
               if not AtualizaSaldoContabBem(Sistema.IdModulo,
                                             qryAcrescimo.FieldByName('IDPESSOA').AsInteger,
                                             qryAcrescimo.FieldByName('IDBEM').AsInteger,
                                             dDataMov,
                                             0,0,DepTotalO,0,
                                             0,0,0,0,
                                             0,0,0,0,
                                             qryBem.FieldByName('IDGRUPO').AsInteger,
                                             qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                             qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 0) then
                  Raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               // Lançamentos Contábeis
               //-------------------------------------------------------------------------
               if IntegraContab(iEmpresaProp) then
               begin
                  if not ContabilizaDepreciacao(iModulo,
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
                                                bMostraMsg) then
                     Raise Exception.Create(MensagemErro);
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
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo, dDataMov,
                                               sMensagem, bMostraMsg);
         dtmAtivoFixo.qryMontaCtb.Close;
         if iPlanilha <= 0 then
            Raise Exception.Create(MensagemErro);
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
      if not Sistema.GravaLogOperacoes('Depreciacao Pro-Rata do Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      Result := True;
      if bTransacao then
         CommitTransacao;
   except
      On E : Exception do
      begin
         Result := False;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
            if iTipoMov = 35 then // Depreciacao do Acrescimo
            begin
               dtmAtivoFixo.qryDeprecAcresc.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
               dtmAtivoFixo.qryDeprecAcresc.ParamByName('PIDACRESCIMO').AsInteger    := iIdMov;
               dtmAtivoFixo.qryDeprecAcresc.ParamByName('PDATAULTDEP').AsDateTime    := dDataUltDep;
               dtmAtivoFixo.qryDeprecAcresc.ExecSQL;
            end;
      result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que Contabiliza a Depreciacao do Bem / Reavaliacao / Acrescimo
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaDepreciacao(iModulo, iPessoa, iGrupo, iConjunto, iBem : Integer;
                                           dDataLanc : TDate;
                                           fDeprec : Double;
                                           sDesBem, sAtivProjeto, sTipoTab : String;
                                           iSubConta : Integer; sPlaca : String;
                                           bMostraMsg : Boolean) : Boolean;
var
   iTipoMov1, iPlanoConta              : Integer;
   fValLanc, fParticip1                : Extended;
   sMensErro, sDebito, sCredito,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre   : String;
   qryCcRD                             : TwwQuery;

begin
   try
      qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
      //----------------------------------------------------------------------------------
      if sTipoTab = 'B' then
      begin
         iTipoMov1 := 14;
         sMensErro := '';
      end else
      if sTipoTab = 'R' then
      begin
         if fDeprec > 0 then
            iTipoMov1 := 18
         else
            iTipoMov1 := 69;
         sMensErro := ' (Reavaliação) ';
      end else
      begin
         iTipoMov1 := 35;
         sMensErro := ' (Acréscimo) ';
      end;
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Depreciação do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMov1,'D',iPlanoConta,sDebito);
      //----------------------------------------------------------------------------------
      if sDebito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Débito para o Movimento de Depreciação no Grupo ' + sGrupo +
                                ' não cadastrada !' + sMensErro);
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Depreciacao do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMov1,'C',iPlanoConta,sCredito);
      //----------------------------------------------------------------------------------
      if sCredito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Crédito para o Movimento de Depreciação no Grupo ' + sGrupo +
                                ' não cadastrada !' + sMensErro);
      end;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      sHistor := 'Depreciação Pró-Rata';
      fParticip1 := 0;
      sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      //----------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         if fParticip1 < 100 then
         begin
            //----------------------------------------------------------------------------
            // Montagem da Partida Dobrada do Custo
            //----------------------------------------------------------------------------
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               fParticip1 := 100;
            //----------------------------------------------------------------------------
            fValLanc := (fDeprec * fParticip1) / 100;
            //----------------------------------------------------------------------------
            if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                         sCcDeb, sCCCre ,sAtivProjeto,
                                         sDebito, sCredito, sNumDoc, abs(fValLanc),
                                         iGrupo, iPlanoConta, iSubConta,
                                         sNomeContaDeb, sObrigaSubContaDeb,
                                         sNomeContaCre, sObrigaSubContaCre,
                                         iBem, iPessoa, 0, bMostraMsg) then
               raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         qryCcRD.Next;
      end;
      qryCcRD.Close;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      on E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
Procedure TAtivoFixo.ParamFatorPeriodo(var rFator : Extended; dDataUltDep,dDataMov : tDateTime);
var
   iMesFim,iAnoFim,iDiaFim,
   iDia,iMes,iAno           : Word;
   iNdias                   : LongInt;

begin
   if dDataMov = dDataUltDep then
   begin
      rFator := 0;
   end else
   begin
      DecodeDate(dDataMov, iAnoFim, iMesFim, iDiaFim);
      DecodeDate(DiasUteis.UltDiaMes(iAnoFim, iMesFim), iAno, iMes, iDia);
      //----------------------------------------------------------------------------------
      iNDias := round(dDataMov - dDataUltDep) + 1;
      rFator := (1 / 12 / iDia) * iNDias;
   end;
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
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryBem.Prepared then qryBem.Prepare;
         if not qryReavaliacao.Prepared then qryReavaliacao.Prepare;
         if not qryAcrescimo.Prepared then qryAcrescimo.Prepare;
         if not qryUltMov.Prepared then qryUltMov.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
      qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
      qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
      qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
      qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após a Depreciacao
      //----------------------------------------------------------------------------------
      qryUltMov.Close;
      qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
      qryUltMov.Open;
      if (qryUltMov.IsEmpty) or
         (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > (dDataMov + 1)) then
         Raise Exception.Create('Existem movimentações com data posterior. Consulte Histórico de Movimentações!');
      qryUltMov.Close;
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
         Raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
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
                         '   AND (TIPDEPPRORATA <> 2) '+
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
                            '   AND (TIPDEPPRORATA <> 2) '+
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
                            '   AND (TIPDEPPRORATA <> 2) '+
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
                         '                            AND (TIPDEPPRORATA <> 2) '+
                         '                            AND (IDTIPOMOVIMENTACAO IN (14,18,35)) )';
      qryAux.ExecSQL;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      iResult := 0;
      if IntegraContab(iEmpresaProp) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            if not RemovePlanContab(iEmpresaProp) then
            begin
               iResult := EstornaLanc(True, iPlnCodigo, 'BASEDADOS', datetostr(dDataEst),
                                      iExercicio, iPeriodo, iEmpresaProp, sMascara);
               //-------------------------------------------------------------------------
               if iResult = -1 then
                  raise Exception.Create('Estorno da Planilha Contábil não permitido!');
            end else
            begin
               with dtmAtivoFixo.qryParamCaf do
               begin
                  Close;
                  ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                  Open;
                  //----------------------------------------------------------------------
                  iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                        FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                        Sistema.IdUsuario, True, 0, sMascara);
                  //----------------------------------------------------------------------
                  if iResult = -1 then
                     raise Exception.Create('Remoção da Planilha Contábil não permitida!');
               end;
            end;
         end else
         begin
            raise Exception.Create(MensagemErro);
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
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF'+
                            ' FROM HISTORICOMOVIMENTACAO'+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (TIPDEPPRORATA <> 2) '+
                            '   AND (IDTIPOMOVIMENTACAO IN (14,18,35))';
         qryAux.Open;
         while not qryAux.Eof do
         begin
            if qryAux.FieldByName('NCAF').AsInteger = 0 then
            begin
               //-------------------------------------------------------------------------
               // Remove os lançamentos da modelagem antiga
               //-------------------------------------------------------------------------
               qryLegRemValMov.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryLegRemValMov.ExecSQL;
               qryLegRemDepBem.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryLegRemDepBem.ExecSQL;
               qryLegRemDepReav.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryLegRemDepReav.ExecSQL;
               qryLegRemDepAcresc.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryLegRemDepAcresc.ExecSQL;
            end;
            //----------------------------------------------------------------------------
            qryEstornaMov.ParamByName('PIDBEM').AsInteger    := iBem;
            qryEstornaMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryEstornaMov.ParamByName('PIDMOVIM').AsInteger  := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaMov.ExecSQL;
            if qryEstornaMov.RowsAffected <= 0 then
               raise Exception.Create('Erro ao estornar os dados registrados no histórico!');
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryAux.Close;
      end;
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Estorna a Depreciacao do Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iResult;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
   qryBem                   : TwwQuery;
   bTransacao               : Boolean;
   iSeqHist                 : Integer;
   dDataUltMov, dDataUltDep : tDate;

begin
   bTransacao := False;
   try
      with dtmAtivoFixo do
      begin
         if not qryBem.Prepared then qryBem.Prepare;
         if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
         if not qryRegistraTransfPlaca.Prepared then qryRegistraTransfPlaca.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryBem := TwwQuery(dtmAtivoFixo.qryBem);
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM no Bem que terá a Placa Substituída
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
         Raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
      //----------------------------------------------------------------------------------
      if iModulo <= 0 then
         Raise Exception.Create('É obrigatório fornecer o código do MODULO!')
      else
         if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
            Raise Exception.Create('Somente o módulo que cadastrou o bem pode manipula-lo');
      //----------------------------------------------------------------------------------
      // verifica se a placa nova não existe
      //----------------------------------------------------------------------------------
      if VerificaPlaca(fPlacaNova,bMostraMsg) > 0 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      // Verifica se a data da movimentação é válida
      //----------------------------------------------------------------------------------
      if not VerificaPeriodoCaf(qryBem.FieldByName('IDPESSOA').AsInteger,
                                qryBem.FieldByName('IDBEM').AsInteger,
                                qryBem.FieldByName('FLGIMOVEL').AsInteger,
                                '04', dDataMov, dDataUltMov, dDataUltDep) then
         Raise Exception.Create(MensagemErro);
      //-------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
      //-------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                       dDataMov,-1,0,0,0,-1,-1,-1,-1,-1,
                                       qryBem.FieldByName('PLACA').AsFloat,-1,-1,
                                       -1,-1,'',0,bMostraMsg);
      if iSeqHist = -1 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Altera a Tabela BEM
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('PLACA').AsFloat := fPlacaNova;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Troca de Placa de Tombamento') then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
   end;
end;
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
// fMovimentacao : id do lançamento no histórico da transf.grupo      (IDMOVIMENTACAO)
//
// bMostraMsg    : True  - mostra mensagens da Função
//                 False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function tAtivoFixo.ExecutaTransferencia(iModulo,
                                         iEmpresaProp,
                                         iBem : Integer;
                                         iGrupoNovo : Integer;
                                     Var iConjuntoNovo,
                                         iLocalNovo,
                                         iRespNovo : Integer;
                                         dDataMov : tDateTime;
                                     Var fMovimentacao : Extended;
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
   dDataUltMov,dDataUltDep         : tDate;
   fTrfValOrg, fTrfReavValOrg,
   fTrfAvValOrg, fTrfCmBem,
   fTrfReavCmBem, fTrfAvCmBem,
   fTrfDepLanc, fTrfReavDepLanc,
   fTrfAvDepLanc, fTrfCmDep,
   fTrfReavCmDep, fTrfAvCmDep      : Extended;

begin
   bTransacao := False;
   try
      with dtmAtivoFixo do
      begin
         if not qryBem.Prepared                  then qryBem.Prepare;
         if not qryGrupos.Prepared               then qryGrupos.Prepare;
         if not qryConjunto.Prepared             then qryConjunto.Prepare;
         if not qryLocalizacao.Prepared          then qryLocalizacao.Prepare;
         if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
      qryGrupos      := TwwQuery(dtmAtivoFixo.qryGrupos);
      qryConjunto    := TwwQuery(dtmAtivoFixo.qryConjunto);
      qryLocalizacao := TwwQuery(dtmAtivoFixo.qryLocalizacao);
      qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
      //----------------------------------------------------------------------------------
      // Posiciona as Tabelas GRUPO, CONJUNTO, LOCALIZACAO e BEM
      // no Bem que será transferido
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
         Raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
      //----------------------------------------------------------------------------------
      iGrupoAtual    := qryBem.FieldByName('IDGRUPO').AsInteger;
      iConjuntoAtual := qryBem.FieldByName('IDCONJUNTO').AsInteger;
      //----------------------------------------------------------------------------------
      if iModulo <= 0 then
      begin
         Raise Exception.Create('É obrigatório fornecer o código do MODULO!');
      end else
      begin
         if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
            Raise Exception.Create('Somente o módulo que cadastrou o bem pode manipulá-lo');
      end;
      //----------------------------------------------------------------------------------
      qryGrupos.Close;
      qryGrupos.ParamByName('PIDGRUPO').AsInteger := iGrupoNovo;
      qryGrupos.Open;
      if qryGrupos.IsEmpty then
         Raise Exception.Create('Os parâmetros relativos ao grupo novo estão incorretos!');
      //----------------------------------------------------------------------------------
      if iConjuntoNovo <> -1 then
      begin
         qryConjunto.Close;
         qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
         qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoNovo;
         qryConjunto.Open;
         if qryConjunto.IsEmpty then
            Raise Exception.Create('Os parâmetros relativos ao conjunto novo estão incorretos!');
         //-------------------------------------------------------------------------------
         if (iConjuntoAtual <> iConjuntoNovo) and
            ((iLocalNovo <> qryConjunto.FieldbyName('IDLOCALIZACAO').AsInteger) or
             (iRespNovo  <> qryConjunto.FieldbyName('IDRESPONSAVEL').AsInteger)) then
            Raise Exception.Create('Não é possível transferir um bem de conjunto e localização/responsável no mesmo movimento!');
      end;
      //----------------------------------------------------------------------------------
      if iLocalNovo <> -1 then
      begin
         qryLocalizacao.Close;
         qryLocalizacao.ParamByName('PIDPESSOA').AsInteger      := iEmpresaProp;
         qryLocalizacao.ParamByName('PIDLOCALIZACAO').AsInteger := iLocalNovo;
         qryLocalizacao.Open;
         if qryLocalizacao.IsEmpty then
            Raise Exception.Create('Os parâmetros relativos a nova localização estão incorretos!');
         //-------------------------------------------------------------------------------   
         sCCustoNovo := qryLocalizacao.FieldByName('CODCENTROCUSTO').AsString;
      end;
      //----------------------------------------------------------------------------------
      if iRespNovo <> -1 then
      begin
         with dtmAtivoFixo do
         begin
            qryResponsavel.Close;
            qryResponsavel.ParamByName('PIDRESP').AsInteger := iRespNovo;
            qryResponsavel.Open;
            if qryResponsavel.IsEmpty then
               Raise Exception.Create('Os parâmetros relativos ao novo responsável estão incorretos!');
         end;
      end;
      //----------------------------------------------------------------------------------
      // Registra a localização/centro de custo atual do conjunto do bem
      //----------------------------------------------------------------------------------
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
      //----------------------------------------------------------------------------------
      if iConjuntoNovo = -1 then
         iConjuntoNovo := iConjuntoAtual;
      if iLocalNovo = -1 then
         iLocalNovo := iLocalAtual;
      if iRespNovo = -1 then
         iRespNovo := iRespAtual;
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not (dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      // Verifica se a data da movimentação é válida
      //----------------------------------------------------------------------------------
      if not VerificaPeriodoCaf(qryBem.FieldByName('IDPESSOA').AsInteger,
                                qryBem.FieldByName('IDBEM').AsInteger,
                                qryBem.FieldByName('FLGIMOVEL').AsInteger,
                                '05,11,12',
                                dDataMov, dDataUltMov, dDataUltDep) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Processa a transferencia na contabilidade
      //----------------------------------------------------------------------------------
      fTrfValOrg  := 0; fTrfReavValOrg  := 0; fTrfAvValOrg  := 0;
      fTrfCmBem   := 0; fTrfReavCmBem   := 0; fTrfAvCmBem   := 0;
      fTrfDepLanc := 0; fTrfReavDepLanc := 0; fTrfAvDepLanc := 0;
      fTrfCmDep   := 0; fTrfReavCmDep   := 0; fTrfAvCmDep   := 0;
      //----------------------------------------------------------------------------------
      iPlanilha := 0;
      if IntegraContab(iEmpresaProp) and (qryBem.FieldByName('CONTROLE').AsString = 'T') then
      begin
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('UNIDNEGOC').IsNull then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               Close;
               ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
               Open;
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
                                               fTrfValOrg, fTrfCmBem, fTrfDepLanc, fTrfCmDep,
                                               fTrfReavValOrg, fTrfReavCmBem, fTrfReavDepLanc, fTrfReavCmDep,
                                               fTrfAvValOrg, fTrfAvCmBem, fTrfAvDepLanc, fTrfAvCmDep,
                                               bMostraMsg);
         if iPlanilha = -1 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // SE O GRUPO INFORMADO FOR DIFERENTE DO ATUAL, EXECUTA TRANSFERÊNCIA DE GRUPO
      //----------------------------------------------------------------------------------
      iSeqHistTransfGrupo := -1;
      if iGrupoAtual <> iGrupoNovo then
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
         //-------------------------------------------------------------------------------
         iSeqHistTransfGrupo := RegistraMovimentacao(iBem, iEmpresaProp, iModulo,
                                                     iTipoMovimentacao,dDataMov,-1,0,0,0,
                                                     -1,iGrupoAtual,-1,-1,-1,-1,iPlanilha,
                                                     -1,-1,-1,'',0,True);
         if iSeqHistTransfGrupo = -1 then
            Raise Exception.Create(MensagemErro);
         fMovimentacao := strtofloat(inttostr(iSeqHistTransfGrupo));
      end;
      //----------------------------------------------------------------------------------
      // SE O CONJUNTO INFORMADO FOR DIFERENTE DO ATUAL, EXECUTA TRANSFERÊNCIA DE CONJUNTO
      //----------------------------------------------------------------------------------
      iSeqHistTransfConj  := -1;
      iSeqHistTransfLocal := -1;
      if iConjuntoAtual <> iConjuntoNovo then
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao (HISTORICOMOVIMENTACAO)
         //-------------------------------------------------------------------------------
         iSeqHistTransfConj := RegistraMovimentacao(iBem, iEmpresaProp, iModulo,12,
                                                    dDataMov,-1,0,0,0,
                                                    -1,-1,iConjuntoAtual,-1,-1,-1,iPlanilha,
                                                    -1,-1,-1,'',0,True);
         if iSeqHistTransfConj = -1 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // SE A LOCALIZAÇÃO INFORMADA FOR DIFERENTE DA ATUAL, EXECUTA TRANSFERÊNCIA DE LOCAL
      //----------------------------------------------------------------------------------
      if (iLocalAtual <> iLocalNovo) or (iRespAtual <> iRespNovo) then
      begin
         //----------------------------------------------------------------------------
         // Registra a Movimentacao (HISTORICOMOVIMENTACAO)
         //----------------------------------------------------------------------------
         iSeqHistTransfLocal := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 11,
                                                     dDataMov,-1,0,0,0,
                                                     -1,-1,-1,iLocalAtual,iRespAtual,-1,iPlanilha,
                                                     -1,-1,-1,'',0,True);
         if iSeqHistTransfLocal = -1 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      if iPlanilha > 0 then
      begin
         //-------------------------------------------------------------------------------
         // Armazena os valores registrados na planilha contábil no
         // HistoricoMovimentacao
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            if iSeqHistTransfGrupo > 0 then
            begin
               qryHistTrf.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHistTransfGrupo;
               qryHistTrf.ParamByName('PTRFVALORG').AsFloat        := fTrfVALORG;
               qryHistTrf.ParamByName('PTRFCMBEM').AsFloat         := fTrfCMBEM;
               qryHistTrf.ParamByName('PTRFDEPLANC').AsFloat       := fTrfDEPLANC;
               qryHistTrf.ParamByName('PTRFCMDEP').AsFloat         := fTrfCMDEP;
               qryHistTrf.ParamByName('PTRFREAVVALORG').AsFloat    := fTrfReavVALORG;
               qryHistTrf.ParamByName('PTRFREAVCMBEM').AsFloat     := fTrfReavCMBEM;
               qryHistTrf.ParamByName('PTRFREAVDEPLANC').AsFloat   := fTrfReavDEPLANC;
               qryHistTrf.ParamByName('PTRFREAVCMDEP').AsFloat     := fTrfReavCMDEP;
               qryHistTrf.ParamByName('PTRFAVVALORG').AsFloat      := fTrfAvVALORG;
               qryHistTrf.ParamByName('PTRFAVCMBEM').AsFloat       := fTrfAvCMBEM;
               qryHistTrf.ParamByName('PTRFAVDEPLANC').AsFloat     := fTrfAvDEPLANC;
               qryHistTrf.ParamByName('PTRFAVCMDEP').AsFloat       := fTrfAvCMDEP;
               qryHistTrf.ExecSQL;
            end else
            if iSeqHistTransfConj > 0 then
            begin
               qryHistTrf.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHistTransfConj;
               qryHistTrf.ParamByName('PTRFVALORG').AsFloat        := fTrfVALORG;
               qryHistTrf.ParamByName('PTRFCMBEM').AsFloat         := fTrfCMBEM;
               qryHistTrf.ParamByName('PTRFDEPLANC').AsFloat       := fTrfDEPLANC;
               qryHistTrf.ParamByName('PTRFCMDEP').AsFloat         := fTrfCMDEP;
               qryHistTrf.ParamByName('PTRFREAVVALORG').AsFloat    := fTrfReavVALORG;
               qryHistTrf.ParamByName('PTRFREAVCMBEM').AsFloat     := fTrfReavCMBEM;
               qryHistTrf.ParamByName('PTRFREAVDEPLANC').AsFloat   := fTrfReavDEPLANC;
               qryHistTrf.ParamByName('PTRFREAVCMDEP').AsFloat     := fTrfReavCMDEP;
               qryHistTrf.ParamByName('PTRFAVVALORG').AsFloat      := fTrfAvVALORG;
               qryHistTrf.ParamByName('PTRFAVCMBEM').AsFloat       := fTrfAvCMBEM;
               qryHistTrf.ParamByName('PTRFAVDEPLANC').AsFloat     := fTrfAvDEPLANC;
               qryHistTrf.ParamByName('PTRFAVCMDEP').AsFloat       := fTrfAvCMDEP;
               qryHistTrf.ExecSQL;
            end else
            if iSeqHistTransfLocal > 0 then
            begin
               qryHistTrf.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHistTransfLocal;
               qryHistTrf.ParamByName('PTRFVALORG').AsFloat        := fTrfVALORG;
               qryHistTrf.ParamByName('PTRFCMBEM').AsFloat         := fTrfCMBEM;
               qryHistTrf.ParamByName('PTRFDEPLANC').AsFloat       := fTrfDEPLANC;
               qryHistTrf.ParamByName('PTRFCMDEP').AsFloat         := fTrfCMDEP;
               qryHistTrf.ParamByName('PTRFREAVVALORG').AsFloat    := fTrfReavVALORG;
               qryHistTrf.ParamByName('PTRFREAVCMBEM').AsFloat     := fTrfReavCMBEM;
               qryHistTrf.ParamByName('PTRFREAVDEPLANC').AsFloat   := fTrfReavDEPLANC;
               qryHistTrf.ParamByName('PTRFREAVCMDEP').AsFloat     := fTrfReavCMDEP;
               qryHistTrf.ParamByName('PTRFAVVALORG').AsFloat      := fTrfAvVALORG;
               qryHistTrf.ParamByName('PTRFAVCMBEM').AsFloat       := fTrfAvCMBEM;
               qryHistTrf.ParamByName('PTRFAVDEPLANC').AsFloat     := fTrfAvDEPLANC;
               qryHistTrf.ParamByName('PTRFAVCMDEP').AsFloat       := fTrfAvCMDEP;
               qryHistTrf.ExecSQL;
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
      qryConjunto.Close;
      qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
      qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoNovo;
      qryConjunto.Open;
      //----------------------------------------------------------------------------------
      if (iConjuntoAtual = iConjuntoNovo) and
         ((iLocalAtual <> iLocalNovo) or (iRespAtual <> iRespNovo)) then
      begin
         //-------------------------------------------------------------------------------
         // Altera a Localizacao do Conjunto
         //-------------------------------------------------------------------------------
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
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(Sistema.IdModulo,
                                    qryBem.FieldByName('IDPESSOA').AsInteger,
                                    qryBem.FieldByName('IDBEM').AsInteger,
                                    dDataMov,
                                    0,0,0,0,
                                    0,0,0,0,
                                    0,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger, 0) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Transferencia do Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iPlanilha;
   except
      On E : Exception do
      begin
         if bTransacao then
            RollBackTransacao;
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
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
                                             Var fTrfValOrg, fTrfCmBem, fTrfDepLanc, fTrfCmDep,
                                             fTrfReavValOrg, fTrfReavCmBem, fTrfReavDepLanc, fTrfReavCmDep,
                                             fTrfAvValOrg, fTrfAvCmBem, fTrfAvDepLanc, fTrfAvCmDep : Extended;
                                             bMostraMsg : Boolean) : Integer;

var
   iExercicio, iPeriodo, iPlanilha                      : Integer;
   sMensagem                                            : String;
   qryBem, qryReavaliacao, qryAcrescimo                 : TwwQuery;
   fBaixaB, fBaixaD, fBaixaCM, fBaixaCMD,
   fDepCmBem, fDepDepLanc, fDepCmDep                    : Extended;

begin
   try
      with dtmAtivoFixo do
      begin
         if not qryBem.Prepared         then qryBem.Prepare;
         if not qryReavaliacao.Prepared then qryReavaliacao.Prepare;
         if not qryAcrescimo.Prepared   then qryAcrescimo.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
      qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
      qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
      //----------------------------------------------------------------------------------
      // Calcula a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      fDepCmBem   := 0;
      fDepDepLanc := 0;
      fDepCmDep   := 0;
      if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),bMostraMsg,0,
                                fDepCmBem, fDepDepLanc, fDepCmDep) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
         if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
         if not qryConta.Prepared      then qryConta.Prepare;
         if not qryCCrd.Prepared       then qryCCrd.Prepare;
         if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
         if not qryMontaCtb.Active     then qryMontaCtb.Open;
      end;
      //----------------------------------------------------------------------------------
      // Transfere os valores do bem
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
                                     inttostr(iAtivProjetoAtual),'B',
                                     iSubContaAtual,
                                     qryBem.FieldByName('PLACA').AsString,
                                     bMostraMsg);
      if iPlanilha < 0 then
         Raise Exception.Create(MensagemErro + ' em ContabilizaTrans (BEM)');
      //----------------------------------------------------------------------------------
      fTrfValOrg  := fTrfValOrg  + fBaixaB;
      fTrfCmBem   := fTrfCmBem   + fBaixaCM;
      fTrfDepLanc := fTrfDepLanc + fBaixaD;
      fTrfCmDep   := fTrfCmDep   + fBaixaCMD;
      //----------------------------------------------------------------------------------
      // Transfere os Valores das reavaliações do bem
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
            Raise Exception.Create(MensagemErro + ' em ContabilizaTrans (REAVALIACAO)');
         //-------------------------------------------------------------------------------
         fTrfReavValOrg  := fTrfReavValOrg  + fBaixaB;
         fTrfReavCmBem   := fTrfReavCmBem   + fBaixaCM;
         fTrfReavDepLanc := fTrfReavDepLanc + fBaixaD;
         fTrfReavCmDep   := fTrfReavCmDep   + fBaixaCMD;
         //-------------------------------------------------------------------------------
         qryReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Transfere os Valores dos acréscimos de valor do bem
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
            Raise Exception.Create(MensagemErro + ' em ContabilizaTrans (ACRESCIMOVALOR)');
         //-------------------------------------------------------------------------------
         fTrfAvValOrg  := fTrfAvValOrg  + fBaixaB;
         fTrfAvCmBem   := fTrfAvCmBem   + fBaixaCM;
         fTrfAvDepLanc := fTrfAvDepLanc + fBaixaD;
         fTrfAvCmDep   := fTrfAvCmDep   + fBaixaCMD;
         //-------------------------------------------------------------------------------
         qryAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) and (iPlanilha >= 0) then
      begin
         if not VerificaPeriodoContabil(iEmpresaProp, dDataMov, iExercicio, iPeriodo,
                                        sMensagem, bMostraMsg) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                               dDataMov, sMensagem, bMostraMsg);
         if iPlanilha < 0 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      dtmAtivoFixo.qryMontaCtb.Close;
      Result := iPlanilha;
   except
      On E : Exception do
      begin
         dtmAtivoFixo.qryMontaCtb.Close;
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que Contabiliza a Transferencia por Bem
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaTransf(iModulo, iPessoa, iBem,
                                      iGrupoAtual, iGrupoNovo,
                                      iConjuntoAtual, iConjuntoNovo : Integer;
                                      sCCustoAtual, sCCustoNovo : String;
                                      dDataLanc : TDate;
                                      fBaixaB, fBaixaCMB, fBaixaD, fBaixaCMD : Extended;
                                      sDesBem, sAtivProjeto, sTipoTab : String;
                                      iSubConta : Integer; sPlaca : String;
                                      bMostraMsg : Boolean) : Integer;

type
   tRateio = Record
      CENTROCUSTOATUAL  : String;
      CENTROCUSTONOVO   : String;
      PARTICIPACAOATUAL : Extended;
      PARTICIPACAONOVO  : Extended;
   end;

var
   aCcRD                                  : array [1..25] of tRateio;
   iMaxCcRD, iCcRD, iCcRDAtual, iCcRDNovo : Integer;
   //-------------------------------------------------------------------------------------
   iTipoMov1, iTipoMov2, iTipoMov3,
   iTipoMov4, iPlanoConta                 : Integer;
   fValLanc, fValLancDeb, fValLancCre,
   fParticip1, fParticip2,
   fParticip3, fParticip4, fParticip5,
   fParticip6, fParticip7, fParticip8,
   fFatorDeb, fFatorCre                   : Extended;
   sMensErro, sDebito, sCredito,
   sDebitoCM, sCreditoCM,
   sDebitoD, sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCC, sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre      : String;
   qryCcRD                                : TwwQuery;
   bProcessar                             : Boolean;

begin
   try
      qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
      //----------------------------------------------------------------------------------
      if sTipoTab = 'B' then
      begin
         iTipoMov1 := 01;
         iTipoMov2 := 15;
         iTipoMov3 := 14;
         iTipoMov4 := 21;
         sMensErro := '';
      end else
      if sTipoTab = 'R' then
      begin
         if fBaixaB > 0 then
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
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Se for reavaliacao negativa, inverter o tipo de lançamento
      //----------------------------------------------------------------------------------
      if fBaixaB <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Transfencia do Custo do Bem
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoNovo,iTipoMov1,'D',iPlanoConta,sDebito)
         else
            Localiza_ContaContabil(iGrupoNovo,iTipoMov1,'C',iPlanoConta,sDebito);
         //-------------------------------------------------------------------------------
         if sDebito = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoNovo);
            raise Exception.Create('Conta a Débito para o Movimento de Transferência do Custo no Grupo ' + sGrupo +
                                   ' não cadastrada !'+sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Transferencia do Custo do Bem
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoAtual,iTipoMov1,'D',iPlanoConta,sCredito)
         else
            Localiza_ContaContabil(iGrupoAtual,iTipoMov1,'C',iPlanoConta,sCredito);
         //-------------------------------------------------------------------------------
         if sCredito = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoAtual);
            raise Exception.Create('Conta a Crédito para o Movimento de Transferência do Custo no Grupo ' + sGrupo +
                                   ' não cadastrada !'+sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      if fBaixaCMB <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Baixa da Correção Monetária do Custo
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoNovo,iTipoMov2,'D',iPlanoConta,sDebitoCM)
         else
            Localiza_ContaContabil(iGrupoNovo,iTipoMov2,'C',iPlanoConta,sDebitoCM);
         //-------------------------------------------------------------------------------
         if sDebitoCM = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoNovo);
            raise Exception.Create('Conta a Débito para o Movimento de Transferência da Correção Monetária do Custo no Grupo '
                                   + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Baixa da Correção Monetária do Custo
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoAtual,iTipoMov2,'D',iPlanoConta,sCreditoCM)
         else
            Localiza_ContaContabil(iGrupoAtual,iTipoMov2,'C',iPlanoConta,sCreditoCM);
         //-------------------------------------------------------------------------------
         if sCreditoCM = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoAtual);
            raise Exception.Create('Conta a Crédito para o Movimento de Transferência da Correção Monetária do Custo no Grupo '
                                   + sGrupo + ' não cadastrada !');
         end;
      end;
      //----------------------------------------------------------------------------------
      if fBaixaD <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Baixa da Depreciação Acumulada
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoAtual,iTipoMov3,'C',iPlanoConta,sDebitoD)
         else
            Localiza_ContaContabil(iGrupoAtual,iTipoMov3,'D',iPlanoConta,sDebitoD);
         //-------------------------------------------------------------------------------
         if sDebitoD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoAtual);
            raise Exception.Create('Conta a Débito para o Movimento de Transferência da Depreciação Acumulada no Grupo ' +
                                   sGrupo + ' não cadastrada !' + sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Entrada da Depreciação Inicial
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoNovo,iTipoMov3,'C',iPlanoConta,sCreditoD)
         else
            Localiza_ContaContabil(iGrupoNovo,iTipoMov3,'D',iPlanoConta,sCreditoD);
         //-------------------------------------------------------------------------------
         if sCreditoD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoNovo);
            raise Exception.Create('Conta a Crédito para o Movimento de Transferência da Depreciação Acumulada no Grupo ' +
                                   sGrupo + ' não cadastrada !' + sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      if fBaixaCMD <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Correção Monetária da Depreciacao Inicial
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoNovo,iTipoMov4,'C',iPlanoConta,sDebitoCMD)
         else
            Localiza_ContaContabil(iGrupoNovo,iTipoMov4,'D',iPlanoConta,sDebitoCMD);
         //-------------------------------------------------------------------------------
         if sDebitoCMD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoNovo);
            raise Exception.Create('Conta a Débito para o Movimento de Transferência da Correção Monetária da ' +
                                   'Depreciação Acumulada no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Correção Monetária da Depreciacao Inicial
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoAtual,iTipoMov4,'C',iPlanoConta,sCreditoCMD)
         else
            Localiza_ContaContabil(iGrupoAtual,iTipoMov4,'D',iPlanoConta,sCreditoCMD);
         //-------------------------------------------------------------------------------
         if sCreditoCMD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoAtual);
            raise Exception.Create('Conta a Crédito para o Movimento de Transferência da Correção Monetária da ' +
                                   'Depreciação Acumulada no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Transfere para arrays os rateios de custo, para permitir que as transferências
      // de local sejam possíveis sem afetar a transação
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoAtual;
      qryCcRD.Open;
      iMaxCcRD := 1;
      while not qryCcRD.EOF do
      begin
         aCcRD[iMaxCcRD].CENTROCUSTOATUAL  := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
         aCcRD[iMaxCcRD].PARTICIPACAOATUAL := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
         aCcRD[iMaxCcRD].CENTROCUSTONOVO   := '';
         aCcRD[iMaxCcRD].PARTICIPACAONOVO  := 0;
         iMaxCcRD := iMaxCcRD + 1;
         qryCcRD.Next;
      end;
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoNovo;
      qryCcRD.Open;
      iCcRD := 1;
      while not qryCcRD.EOF do
      begin
         aCcRD[iCcRD].CENTROCUSTONOVO  := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
         aCcRD[iCcRD].PARTICIPACAONOVO := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
         iCcRD := iCcRD + 1;
         if iCcRD > iMaxCcRD then
         begin
            iMaxCcRD := iCcRD;
            aCcRD[iMaxCcRD].CENTROCUSTOATUAL  := '';
            aCcRD[iMaxCcRD].PARTICIPACAOATUAL := 0;
         end;
         qryCcRD.Next;
      end;
      qryCcRD.Close;
      //----------------------------------------------------------------------------------
      // Atualiza o Centro de Custo do Conjunto Novo, caso haja tranferência de local
      //----------------------------------------------------------------------------------
      if sCCustoNovo <> sCCustoAtual then
      begin
         iCcRD := 1;
         while iCcRD < iMaxCcRD do
         begin
            if aCcRD[iCcRD].CENTROCUSTONOVO = sCCustoAtual then
               aCcRD[iCcRD].CENTROCUSTONOVO := sCCustoNovo;
            iCcRD := iCcRD + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Verifica se existe mudanca de Conta Contabil e/ou Centro de Custo.
      // Caso não haja mudança, não gera planilha contabil.
      //----------------------------------------------------------------------------------
      bProcessar := True;
      if ((sDebito  = sCredito)  and (sDebitoCM  = sCreditoCM) and
          (sDebitoD = sCreditoD) and (sDebitoCMD = sCreditoCMD)) then
      begin
         bProcessar := False;
         //-------------------------------------------------------------------------------
         // Verifica se existem centros de custos para as contas acima
         //-------------------------------------------------------------------------------
         sObrigaCC := 'N';
         if sDebito <> '' then
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito, sObrigaCC, sNomeContaDeb, sObrigaSubContaDeb);
         if sObrigaCC = 'N' then
            if sDebitoCM <> '' then
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCM, sObrigaCC, sNomeContaDeb, sObrigaSubContaDeb);
         if sObrigaCC = 'N' then
            if sDebitoD <> '' then
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoD, sObrigaCC, sNomeContaDeb, sObrigaSubContaDeb);
         if sObrigaCC = 'N' then
            if sDebitoCMD <> '' then
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCMD, sObrigaCC, sNomeContaDeb, sObrigaSubContaDeb);
         //-------------------------------------------------------------------------------
         if sObrigaCC = 'S' then
         begin
            iCcRDAtual := 1;
            while iCcRDAtual < iMaxCcRD do
            begin
               iCcRDNovo := 1;
               while iCcRDNovo < iMaxCcRD do
               begin
                  if (aCcRD[iCcRDAtual].CENTROCUSTOATUAL <> aCcRD[iCcRDNovo].CENTROCUSTONOVO) and
                     (aCcRD[iCcRDAtual].CENTROCUSTOATUAL <> '') and (aCcRD[iCcRDNovo].CENTROCUSTONOVO <> '') then
                     bProcessar := True;
                  iCcRDNovo  := iCcRDNovo  + 1;
               end;
               iCcRDAtual := iCcRDAtual + 1;
            end;
         end;
      end;
      if not bProcessar then
      begin
         Result := 0;
         Exit;
      end;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      sHistor    := 'Transferencia de Bem ';
      sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      fParticip1 := 0;
      fParticip2 := 0;
      fParticip3 := 0;
      fParticip4 := 0;
      fParticip5 := 0;
      fParticip6 := 0;
      fParticip7 := 0;
      fParticip8 := 0;
      //----------------------------------------------------------------------------------
      // Processa a Baixa dos valores da Conta Contábil / Centro de Custo Atuais
      //----------------------------------------------------------------------------------
      iCcRD := 1;
      while iCcRD < iMaxCcRD do
      begin
         //-------------------------------------------------------------------------------
         // Custo
         //-------------------------------------------------------------------------------
         if fBaixaB <> 0 then
         begin
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Entrada do Custo Novo
            //----------------------------------------------------------------------------
            if fParticip1 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  sCCDeb     := aCcRD[iCcRD].CENTROCUSTONOVO;
                  fParticip1 := aCcRD[iCcRD].PARTICIPACAONOVO;
               end else
               begin
                  sCCDeb     := '';
                  fParticip1 := 100;
               end;
               fFatorDeb := fParticip1 / 100;
            end else
            begin
               fFatorDeb := 0;
            end;
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Baixa do Custo Atual
            //----------------------------------------------------------------------------
            if fParticip2 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  sCCCre     := aCcRD[iCcRD].CENTROCUSTOATUAL;
                  fParticip2 := aCcRD[iCcRD].PARTICIPACAOATUAL;
               end else
               begin
                  sCCCre     := '';
                  fParticip2 := 100;
               end;
               fFatorCre := fParticip2 / 100;
            end else
            begin
               fFatorCre := 0;
            end;
            //----------------------------------------------------------------------------
            fValLancDeb := fBaixaB * fFatorDeb;
            fValLancCre := fBaixaB * fFatorCre;
            //----------------------------------------------------------------------------
            sHistor2 := 'Tranferencia do Custo de Aquisicao';
            if (iGrupoAtual <> iGrupoNovo) or (sCCDeb <> '') or (sCCCre <> '') then
            begin
               if fValLancDeb = fValLancCre then
               begin
                  //----------------------------------------------------------------------
                  // Lançamento em Partida Dobrada
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               sCCDeb, sCCCre ,sAtivProjeto,
                                               sDebito, sCredito, sNumDoc, fValLancDeb,
                                               iGrupoAtual, iPlanoConta, iSubConta,
                                               sNomeContaDeb, sObrigaSubContaDeb,
                                               sNomeContaCre, sObrigaSubContaCre,
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
               end else
               begin
                  //----------------------------------------------------------------------
                  // Lançamento a Débito
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               sCCDeb , '', sAtivProjeto,
                                               sDebito, '', sNumDoc, fValLancDeb,
                                               iGrupoNovo, iPlanoConta, iSubConta,
                                               sNomeContaDeb, sObrigaSubContaDeb,
                                               sNomeContaCre, '',
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
                  //----------------------------------------------------------------------
                  // Lançamento a Crédito
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               '', sCCCre ,sAtivProjeto,
                                               '', sCredito, sNumDoc, fValLancCre,
                                               iGrupoAtual, iPlanoConta, iSubConta,
                                               sNomeContaDeb, '',
                                               sNomeContaCre, sObrigaSubContaCre,
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Correção Monetária
         //-------------------------------------------------------------------------------
         if fBaixaCMB <> 0 then
         begin
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Entrada do Custo Novo
            //----------------------------------------------------------------------------
            if fParticip3 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCM,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  sCCDeb     := aCcRD[iCcRD].CENTROCUSTONOVO;
                  fParticip3 := aCcRD[iCcRD].PARTICIPACAONOVO;
               end else
               begin
                  sCCDeb     := '';
                  fParticip3 := 100;
               end;
               fFatorDeb := fParticip3 / 100;
            end else
            begin
               fFatorDeb := 0;
            end;
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Baixa do Custo Atual
            //----------------------------------------------------------------------------
            if fParticip4 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCM,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  sCCCre     := aCcRD[iCcRD].CENTROCUSTOATUAL;
                  fParticip4 := aCcRD[iCcRD].PARTICIPACAOATUAL;
               end else
               begin
                  sCCCre     := '';
                  fParticip4 := 100;
               end;
               fFatorCre := fParticip4 / 100;
            end else
            begin
               fFatorCre := 0;
            end;
            //----------------------------------------------------------------------------
            fValLancDeb := fBaixaCMB * fFatorDeb;
            fValLancCre := fBaixaCMB * fFatorCre;
            //----------------------------------------------------------------------------
            sHistor2 := 'Tranferencia da Correcao Monetaria do Custo de Aquisicao';
            if (iGrupoAtual <> iGrupoNovo) or (sCCDeb <> '') or (sCCCre <> '') then
            begin
               if fValLancDeb = fValLancCre then
               begin
                  //----------------------------------------------------------------------
                  // Lançamento em Partida Dobrada
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               sCCDeb, sCCCre ,sAtivProjeto,
                                               sDebitoCM, sCreditoCM, sNumDoc, fValLancDeb,
                                               iGrupoAtual, iPlanoConta, iSubConta,
                                               sNomeContaDeb, sObrigaSubContaDeb,
                                               sNomeContaCre, sObrigaSubContaCre,
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
               end else
               begin
                  //----------------------------------------------------------------------
                  // Lançamento a Débito
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               sCCDeb , '', sAtivProjeto,
                                               sDebitoCM, '', sNumDoc, fValLancDeb,
                                               iGrupoNovo, iPlanoConta, iSubConta,
                                               sNomeContaDeb, sObrigaSubContaDeb,
                                               sNomeContaCre, '',
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
                  //----------------------------------------------------------------------
                  // Lançamento a Crédito
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               '', sCCCre ,sAtivProjeto,
                                               '', sCreditoCM, sNumDoc, fValLancCre,
                                               iGrupoAtual, iPlanoConta, iSubConta,
                                               sNomeContaDeb, '',
                                               sNomeContaCre, sObrigaSubContaCre,
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Depreciacao
         //-------------------------------------------------------------------------------
         if fBaixaD <> 0 then
         begin
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Entrada do Custo Novo
            //----------------------------------------------------------------------------
            if fParticip5 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoD,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  sCCDeb     := aCcRD[iCcRD].CENTROCUSTONOVO;
                  fParticip5 := aCcRD[iCcRD].PARTICIPACAONOVO;
               end else
               begin
                  sCCDeb     := '';
                  fParticip5 := 100;
               end;
               fFatorDeb := fParticip5 / 100;
            end else
            begin
               fFatorDeb := 0;
            end;
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Baixa do Custo Atual
            //----------------------------------------------------------------------------
            if fParticip6 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoD,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  sCCCre     := aCcRD[iCcRD].CENTROCUSTOATUAL;
                  fParticip6 := aCcRD[iCcRD].PARTICIPACAOATUAL;
               end else
               begin
                  sCCCre     := '';
                  fParticip6 := 100;
               end;
               fFatorCre := fParticip6 / 100;
            end else
            begin
               fFatorCre := 0;
            end;
            //----------------------------------------------------------------------------
            fValLancDeb := fBaixaD * fFatorDeb;
            fValLancCre := fBaixaD * fFatorCre;
            //----------------------------------------------------------------------------
            sHistor2 := 'Tranferencia da Depreciacao';
            if (iGrupoAtual <> iGrupoNovo) or (sCCDeb <> '') or (sCCCre <> '') then
            begin
               if fValLancDeb = fValLancCre then
               begin
                  //----------------------------------------------------------------------
                  // Lançamento em Partida Dobrada
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               sCCDeb, sCCCre ,sAtivProjeto,
                                               sDebitoD, sCreditoD, sNumDoc, fValLancDeb,
                                               iGrupoAtual, iPlanoConta, iSubConta,
                                               sNomeContaDeb, sObrigaSubContaDeb,
                                               sNomeContaCre, sObrigaSubContaCre,
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
               end else
               begin
                  //----------------------------------------------------------------------
                  // Lançamento a Débito
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               sCCDeb , '', sAtivProjeto,
                                               sDebitoD, '', sNumDoc, fValLancDeb,
                                               iGrupoNovo, iPlanoConta, iSubConta,
                                               sNomeContaDeb, sObrigaSubContaDeb,
                                               sNomeContaCre, '',
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
                  //----------------------------------------------------------------------
                  // Lançamento a Crédito
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               '', sCCCre ,sAtivProjeto,
                                               '', sCreditoD, sNumDoc, fValLancCre,
                                               iGrupoAtual, iPlanoConta, iSubConta,
                                               sNomeContaDeb, '',
                                               sNomeContaCre, sObrigaSubContaCre,
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Correção Monetária da Depreciacao
         //-------------------------------------------------------------------------------
         if fBaixaCMD <> 0 then
         begin
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Entrada do Custo Novo
            //----------------------------------------------------------------------------
            if fParticip7 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCMD,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  sCCDeb     := aCcRD[iCcRD].CENTROCUSTONOVO;
                  fParticip7 := aCcRD[iCcRD].PARTICIPACAONOVO;
               end else
               begin
                  sCCDeb     := '';
                  fParticip7 := 100;
               end;
               fFatorDeb := fParticip7 / 100;
            end else
            begin
               fFatorDeb := 0;
            end;
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Baixa do Custo Atual
            //----------------------------------------------------------------------------
            if fParticip8 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCMD,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  sCCCre     := aCcRD[iCcRD].CENTROCUSTOATUAL;
                  fParticip8 := aCcRD[iCcRD].PARTICIPACAOATUAL;
               end else
               begin
                  sCCCre     := '';
                  fParticip8 := 100;
               end;
               fFatorCre := fParticip8 / 100;
            end else
            begin
               fFatorCre := 0;
            end;
            //----------------------------------------------------------------------------
            fValLancDeb := fBaixaCMD * fFatorDeb;
            fValLancCre := fBaixaCMD * fFatorCre;
            //----------------------------------------------------------------------------
            sHistor2 := 'Tranferencia da Correcao Monetaria da Depreciacao';
            if (iGrupoAtual <> iGrupoNovo) or (sCCDeb <> '') or (sCCCre <> '') then
            begin
               if fValLancDeb = fValLancCre then
               begin
                  //----------------------------------------------------------------------
                  // Lançamento em Partida Dobrada
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               sCCDeb, sCCCre ,sAtivProjeto,
                                               sDebitoCMD, sCreditoCMD, sNumDoc, fValLancDeb,
                                               iGrupoAtual, iPlanoConta, iSubConta,
                                               sNomeContaDeb, sObrigaSubContaDeb,
                                               sNomeContaCre, sObrigaSubContaCre,
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
               end else
               begin
                  //----------------------------------------------------------------------
                  // Lançamento a Débito
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               sCCDeb , '', sAtivProjeto,
                                               sDebitoCMD, '', sNumDoc, fValLancDeb,
                                               iGrupoNovo, iPlanoConta, iSubConta,
                                               sNomeContaDeb, sObrigaSubContaDeb,
                                               sNomeContaCre, '',
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
                  //----------------------------------------------------------------------
                  // Lançamento a Crédito
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                               '', sCCCre ,sAtivProjeto,
                                               '', sCreditoCMD, sNumDoc, fValLancCre,
                                               iGrupoAtual, iPlanoConta, iSubConta,
                                               sNomeContaDeb, '',
                                               sNomeContaCre, sObrigaSubContaCre,
                                               iBem, iPessoa, 0, bMostraMsg) then
                     raise Exception.Create(MensagemErro);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         iCcRD := iCcRD + 1;
      end;
      //----------------------------------------------------------------------------------
      result := 1;
   except
      On E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
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
function TAtivoFixo.EstornaTransferencia(iModulo, iEmpresaProp, iBem : Integer;
                                        dDataMov, dDataEst : tDate;
                                        iIdHistMovim : Integer;
                                        bMostraMsg : boolean) : Integer;
var
   iResult, iTotPlan,
   iExercicio,iPeriodo, iAux, iPlan  : Integer;
   sMascara,sMensagem,sCCustoAtual   : String;
   qryAux,qryAux2,qryBem,qryUltMov   : TwwQuery;
   bTransacao, bNovoPlnCodigo,
   bRemovePlanContab,bTransfConjunto : Boolean;
   aPlanilha                         : array of Integer;
   aDataMov                          : array of tDateTime;

begin
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not (dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
       with dtmAtivoFixo do
       begin
          if not qryUltMov.Prepared then qryUltMov.Prepare;
          if not qryBem.Prepared    then qryBem.Prepare;
       end;
       //---------------------------------------------------------------------------------
       qryBem    := TwwQuery(dtmAtivoFixo.qryBem);
       qryUltMov := TwwQuery(dtmAtivoFixo.qryUltMov);
       qryAux    := TwwQuery(dtmAtivoFixo.qryAux);
       qryAux2   := TwwQuery(dtmAtivoFixo.qryAux2);
       //---------------------------------------------------------------------------------
       // verifica se ja houve movimentação no bem após a Transferência
       //---------------------------------------------------------------------------------
       qryUltMov.Close;
       qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
       qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
       qryUltMov.Open;
       if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
          Raise Exception.Create('Existe movimentação após a transferência. Consulte Histórico de Movimentação!');
       //---------------------------------------------------------------------------------
       // Posiciona a Tabela BEM
       //---------------------------------------------------------------------------------
       qryBem.Close;
       qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
       qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
       qryBem.Open;
       if qryBem.IsEmpty then
          Raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
       //---------------------------------------------------------------------------------
       // Lê o Centro de Custo Atual
       //---------------------------------------------------------------------------------
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
          sCCustoAtual := qryLocalizacao.FieldByName('CODCENTROCUSTO').AsString;
       end;
       //---------------------------------------------------------------------------------
       if iIdHistMovim > 0 then
       begin
          qryAux2.Close;
          qryAux2.SQL.Text := ' SELECT DATAMOVIMENTACAO,PLNCODIGO' +
                              ' FROM HISTORICOMOVIMENTACAO ' +
                              ' WHERE (IDMOVIMENTACAO = ' + inttostr(iIdHistMovim) + ')' +
                              '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                              '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                              '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                              '   AND (IDTIPOMOVIMENTACAO IN (05,11,12))';
          qryAux2.Open;
          //------------------------------------------------------------------------------
          if qryAux2.IsEmpty then
             Raise Exception.Create('Os parâmetros relativos ao bem estão incorretos (HistMovBem)!');
       end;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if iIdHistMovim > 0 then
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT DATAMOVIMENTACAO, PLNCODIGO'+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDMOVIMENTACAO = ' + inttostr(iIdHistMovim) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (05,11,12))';
      end else
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT DATAMOVIMENTACAO, PLNCODIGO'+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (05,11,12))';
      end;
      qryAux.Open;
      //----------------------------------------------------------------------------------
      iTotPlan := 0;
      while not qryAux.EOF do
      begin
         bNovoPlnCodigo := True;
         iAux := 0;
         while iAux <= (iTotPlan - 1) do
         begin
            if aPlanilha[iAux] = qryAux.FieldByName('PLNCODIGO').AsInteger then
               bNovoPlnCodigo := False;
            iAux := iAux + 1;
         end;
         if bNovoPlnCodigo then
         begin
            iTotPlan := iTotPlan + 1;
            SetLength(aPlanilha,iTotPlan);
            SetLength(aDataMov,iTotPlan);
            aPlanilha[iTotPlan - 1] := qryAux.FieldByName('PLNCODIGO').AsInteger;
            aDataMov[iTotPlan - 1]  := qryAux.FieldByName('DATAMOVIMENTACAO').AsDateTime;
         end;
         qryAux.Next;
      end;
      //----------------------------------------------------------------------------------
      // RETIRA O LINK DA PLANILHA CONTÁBIL
      //----------------------------------------------------------------------------------
      if iIdHistMovim > 0 then
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
      // Estorna as planilhas contábeis
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         //-------------------------------------------------------------------------------
         // Estorna a Depreciacao no Dia da Movimentacao - 1
         //-------------------------------------------------------------------------------
         if EstornaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),dDataEst,
                               bMostraMsg) < 0 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         bRemovePlanContab := RemovePlanContab(iEmpresaProp);
         //-------------------------------------------------------------------------------
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            iPlan := 0;
            while iPlan <= (iTotPlan - 1) do
            begin
               if not bRemovePlanContab then
               begin
                  if aPlanilha[iPlan] <> 0 then
                  begin
                     iResult := EstornaLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                                datetostr(aDataMov[iPlan]), iExercicio, iPeriodo,
                                iEmpresaProp, sMascara);
                     if iResult = -1 then
                        Raise Exception.Create('Estorno da Planilha Contábil não Permitido!');
                  end;
               end else
               begin
                  if aPlanilha[iPlan] <> 0 then
                  begin
                     with dtmAtivoFixo.qryParamCaf do
                     begin
                        Close;
                        ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                        Open;
                        //----------------------------------------------------------------
                        iResult := ExcluiLanc(True, aPlanilha[iPlan], 'BASEDADOS', inttostr(iModulo),
                                              FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                              Sistema.IdUsuario, True, 0, sMascara);
                     end;
                     //-------------------------------------------------------------------
                     if iResult = -1 then
                        Raise Exception.Create('Remoção da Planilha da Contabilidade não Permitida!');
                  end;
               end;
               iPlan := iPlan + 1;
            end;
         end else
         begin
            Raise Exception.Create(MensagemErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      if iIdHistMovim > 0 then
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF, '+
                            '        IDGRUPANT, IDCONJANT, IDLOCALANT, IDRESPANT ' +
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDMOVIMENTACAO = ' + inttostr(iIdHistMovim) + ')' +
                            ' ORDER BY IDMOVIMENTACAO DESC' ;
      end else
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF, ' +
                            '        IDGRUPANT, IDCONJANT, IDLOCALANT, IDRESPANT ' +
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ') ' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '   AND (IDTIPOMOVIMENTACAO IN (05,12,11)) ' +
                            ' ORDER BY IDMOVIMENTACAO DESC' ;
      end;
      qryAux.Open;
      //----------------------------------------------------------------------------------
      bTransfConjunto := False;
      while not qryAux.EOF do
      begin
         qryBem.Edit;
         if qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 05 then
         begin
            qryBem.FieldByName('IDGRUPO').AsInteger := qryAux.FieldByName('IDGRUPANT').AsInteger;
         end else
         if qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 12 then
         begin
            qryBem.FieldByName('IDCONJUNTO').AsInteger := qryAux.FieldByName('IDCONJANT').AsInteger;
            bTransfConjunto := True;
         end;
         qryBem.Post;
         qryBem.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryAux.Next;
      end;
      //----------------------------------------------------------------------------------
      if not bTransfConjunto then
      begin
         qryAux.First;
         while not qryAux.EOF do
         begin
            if qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 11 then
            begin
               //-------------------------------------------------------------------------
               // Retorna os dados do Conjunto
               //-------------------------------------------------------------------------
               with dtmAtivoFixo do
               begin
                  qryLocalizacao.Close;
                  qryLocalizacao.ParamByName('PIDPESSOA').AsInteger      := iEmpresaProp;
                  qryLocalizacao.ParamByName('PIDLOCALIZACAO').AsInteger := qryAux.FieldByName('IDLOCALANT').AsInteger;
                  qryLocalizacao.Open;
                  //----------------------------------------------------------------------
                  qryAux2.SQL.Text := ' UPDATE CONJUNTO ' +
                                      ' SET IDLOCALIZACAO = ' + qryAux.FieldByName('IDLOCALANT').AsString + ', ' + #13 +
                                      '     IDRESPONSAVEL = ' + qryAux.FieldByName('IDRESPANT').AsString + #13 +
                                      ' WHERE (IDCONJUNTO = ' + qryBem.FieldByName('IDCONJUNTO').AsString + ')';
                  qryAux2.ExecSQL;
                  if qryAux2.RowsAffected <= 0 then
                     Raise Exception.Create('Erro no retorno da Localização/Responsável original do conjunto!');
                  //----------------------------------------------------------------------
                  qryAux2.SQL.Text := ' UPDATE RATEIODEPRECIACAO ' + #13 +
                                      ' SET CODCENTROCUSTO = ' + #39 + qryLocalizacaoCODCENTROCUSTO.AsString + #39 + #13 +
                                      ' WHERE (IDCONJUNTO = ' + qryBem.FieldByName('IDCONJUNTO').AsString + ') '+ #13 +
                                      '   AND (LTRIM(RTRIM(CODCENTROCUSTO)) = ' + #39 + sCCustoAtual + #39 + ')';
                  qryAux2.ExecSQL;
                  if qryAux2.RowsAffected <= 0 then
                     Raise Exception.Create('Erro no retorno do rateio de custo original do conjunto!');
               end;
            end;
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
      end;
      //----------------------------------------------------------------------------------
      qryAux.First;
      while not qryAux.EOF do
      begin
         if qryAux.FieldByName('NCAF').AsInteger = 0 then
         begin
            dtmAtivoFixo.qryLegRemTrfGrupo.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            dtmAtivoFixo.qryLegRemTrfGrupo.ExecSQL;
            dtmAtivoFixo.qryLegRemTrfConj.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            dtmAtivoFixo.qryLegRemTrfConj.ExecSQL;
            dtmAtivoFixo.qryLegRemTrfLocal.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            dtmAtivoFixo.qryLegRemTrfLocal.ExecSQL;
         end;
         //-------------------------------------------------------------------------------
         dtmAtivoFixo.qryEstornaMov.ParamByName('PIDBEM').AsInteger    := iBem;
         dtmAtivoFixo.qryEstornaMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         dtmAtivoFixo.qryEstornaMov.ParamByName('PIDMOVIM').AsInteger  := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
         dtmAtivoFixo.qryEstornaMov.ExecSQL;
         if dtmAtivoFixo.qryEstornaMov.RowsAffected < 1 then
            Raise Exception.Create('Erro no estorno da Transferência do histórico!');
         //-------------------------------------------------------------------------------
         qryAux.Next;
      end;
      qryAux.Close;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      dtmAtivoFixo.qryConjunto.Close;
      dtmAtivoFixo.qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
      dtmAtivoFixo.qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := qryBem.FieldByName('IDCONJUNTO').AsInteger;
      dtmAtivoFixo.qryConjunto.Open;
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,
                                    (dDataMov - 1),0,0,0,0,0,0,0,0,0,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    dtmAtivoFixo.qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                    dtmAtivoFixo.qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Estorna da Transferencia do Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := 1;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
   iTipoMovimentacao = 9;                                  // Codigo de Acréscimo

var
   iPlanoConta, iExercicio, iPeriodo,
   iSeqHist, iPlanilha, iIdAcrescimo                 : Integer;
   sDebito  , sDebitoCM  , sCredito  , sCreditoCM,
   sCCDebito, sCCDebitoCM, sCCCredito, sCCCreditoCM,
   sAtivProjeto,sMensagem                            : String;
   fSldCtbImob, fValFis, fValGer                     : Double;
   qryBem                                            : TwwQuery;
   bTransacao                                        : Boolean;
   dDataUltMov, dDataUltDep                          : tDate;

begin
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryBem.Prepared then qryBem.Prepare;
         if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
         if not qryRegistraAcrescimo.Prepared then qryRegistraAcrescimo.Prepare;
         if not qryRegistraAcresc.Prepared then qryRegistraAcresc.Prepare;
         if not qryTipoDespAV.Prepared then qryTipoDespAV.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryBem := TwwQuery(dtmAtivoFixo.qryBem);
      //----------------------------------------------------------------------------------
      // Valida os parâmetros obrigatórios para acréscimo de valor
      //----------------------------------------------------------------------------------
      if dDataAcres <= 0 then
         Raise Exception.Create('Informe o Data do Acréscimo de Valor!');
      //----------------------------------------------------------------------------------
      if fValAcres <= 0 then
         Raise Exception.Create('Informe o Valor do Acréscimo de Valor!');
      //----------------------------------------------------------------------------------
      if sObs = '' then
         Raise Exception.Create('Informe as informações relativas ao Fato Gerador do Acréscimo de Valor');
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM no bem que terá Acréscimo
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
         Raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
      //-------------------------------------------------------------------------------------
      if iModulo <= 0 then
         Raise Exception.Create('É obrigatório fornecer o código do MODULO!')
      else
         if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
            Raise Exception.Create('Somente o módulo que cadastrou o bem pode manipula-lo');
      //-------------------------------------------------------------------------------------
      // Calcula a taxa de depreciação, baseado na vida util restante do bem
      //-------------------------------------------------------------------------------------
      dtmAtivoFixo.qryReavaliacao.Close;
      dtmAtivoFixo.qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      dtmAtivoFixo.qryReavaliacao.ParamByName('PIDBEM').AsInteger := iBem;
      dtmAtivoFixo.qryReavaliacao.Open;
      if dtmAtivoFixo.qryReavaliacao.IsEmpty then
      begin
         fTaxaDep := CalculaTaxaDep((qryBem.FieldByName('DEPLANC').asFloat +
                                     qryBem.FieldByName('CMDEP').asFloat),
                                    (qryBem.FieldByName('VALORG').asFloat +
                                     qryBem.FieldByName('CMBEM').asFloat),
                                     qryBem.FieldByName('TAXADEP').asFloat,
                                     dDataAcres);
      end else
      begin
         if dtmAtivoFixo.qryReavaliacao.Locate('FLGULTREAVAL',1,[]) then
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
         fValFis := fValAcres / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                              dDataAcres, bMostraMsg);
         fValGer := fValAcres / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                              dDataAcres, bMostraMsg);
      end;
      //----------------------------------------------------------------------------------
      // Verifica se a data da movimentação é válida
      //----------------------------------------------------------------------------------
      if not VerificaPeriodoCaf(qryBem.FieldByName('IDPESSOA').AsInteger,
                                qryBem.FieldByName('IDBEM').AsInteger,
                                qryBem.FieldByName('FLGIMOVEL').AsInteger,
                                '09',
                                dDataAcres, dDataUltMov, dDataUltDep) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      iPlanilha := -1;
      if (IntegraContab(iEmpresaProp)) and
         (qryBem.FieldByName('CONTROLE').asString = 'T') then
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
         //-------------------------------------------------------------------------------
         // Busca o Periodo Contábil
         //-------------------------------------------------------------------------------
         if not VerificaPeriodoContabil(iEmpresaProp, dDataAcres, iExercicio, iPeriodo,
                                        sMensagem, bMostraMsg) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('UNIDNEGOC').IsNull then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               Close;
               ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
               Open;
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
                                           iExercicio, iPeriodo, bMostraMsg);
         dtmAtivoFixo.qryMontaCtb.Close;
         if iPlanilha <= 0 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
      //----------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                       dDataAcres, -1, fValAcres, fValFis, fValGer,
                                       -1,-1,-1,-1,-1,-1,iPlanilha,-1,-1,-1,'',0,True);
      if iSeqHist = -1 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if not RegistraAcresc(iSeqHist, iTipoDespesa, sObs, bMostraMsg) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Registra o Acréscimo de Valor
      //----------------------------------------------------------------------------------
      iIdAcrescimo := RegistraAcrescimo(iBem,iEmpresaProp,iSeqHist,fTaxaDep,dDataAcres,
                      fValAcres, fValFis, fValGer, 0, 0, 0, 0, 0, -1, -1,bMostraMsg);
      if iIdAcrescimo <= 0 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(Sistema.IdModulo, iEmpresaProp, iBem,
                                    dDataAcres,
                                    fValAcres,0,0,0,
                                    0,0,0,0,
                                    0,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryBem.FieldByName('IDRESPONSAVEL').AsInteger,0) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Acrescimo de Valor ao Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iIdAcrescimo;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
         fTaxaDiaria := strtofloat(FormatFloat('#0.000000',((fTaxaDiaria * 1000000) / 1000000)));
         fTaxaMensal := (fTaxaDiaria * 30) + 0.000001;
         result      := (fTaxaMensal * 12);
      except
         MensagemErro := 'Não foi possível calcular a Taxa de Depreciação do Acréscimo de Valor! '+
                         'Valor BEM '+floattostr(fValOrg)+' Deprec BEM '+floattostr(fDepLanc);
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
      On E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
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
   try
      with qryAcresc do
      begin
         ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         //-------------------------------------------------------------------------------
         if iTipoDespesa <= 0 then
            Raise Exception.Create('O Tipo de Despesa para Acréscimo de Valor deve ser informado!')
         else
            ParamByName('PIDTIPODESPESA').AsInteger := iTipoDespesa;
         //-------------------------------------------------------------------------------
         ParamByName('POBS').AsString := sObs;
         //-------------------------------------------------------------------------------
         ExecSQL;
         if RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível registrar a movimentação do Acréscimo de Valor!');
      end;
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que Contabiliza o Acréscimo
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaAcrescimo(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                         dDataLanc : TDate; fValAcresc : Extended;
                                         sDesBem, sAtivProjeto : String;
                                         iSubConta : Integer; sPlaca : String;
                                         iExercicio, iPeriodo : Integer;
                                         bMostraMsg : Boolean) : Integer;
const
   iTipoMovimentacao = 9;           // Codigo do Acréscimo de Valor

var
   iPlanoConta, iPlanilha              : Integer;
   fValLanc, fParticip1                : Extended;
   sMensagem, sDebito, sCredito,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre   : String;
   qryCcRD                             : TwwQuery;

begin
   try
      qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a débito para o Acréscimo de Valor no Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMovimentacao,'D',iPlanoConta,sDebito);
      //----------------------------------------------------------------------------------
      if sDebito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Débito para o Movimento de Acréscimo de Valor no Grupo ' + sGrupo +
                                ' não cadastrada !');
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para o Acréscimo de Valor no Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMovimentacao,'C',iPlanoConta,sCredito);
      //----------------------------------------------------------------------------------
      if sCredito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Crédito para o Movimento de Acréscimo de Valor no Grupo ' + sGrupo +
                                ' não cadastrada !');
      end;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      sHistor := 'Acréscimo de Valor';
      fParticip1 := 0;
      sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      //----------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         if fParticip1 < 100 then
         begin
            //----------------------------------------------------------------------------
            // Montagem da Partida Dobrada do Custo
            //----------------------------------------------------------------------------
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               fParticip1 := 100;
            //----------------------------------------------------------------------------
            fValLanc := (fValAcresc * fParticip1) / 100;
            //----------------------------------------------------------------------------
            if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                         sCcDeb, sCCCre ,sAtivProjeto,
                                         sDebito, sCredito, sNumDoc, abs(fValLanc),
                                         iGrupo, iPlanoConta, iSubConta,
                                         sNomeContaDeb, sObrigaSubContaDeb,
                                         sNomeContaCre, sObrigaSubContaCre,
                                         iBem, iPessoa, 0, bMostraMsg) then
               raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         qryCcRD.Next;
      end;
      qryCcRD.Close;
      //----------------------------------------------------------------------------------
      // Integra a planilha com a Contabilidade
      //----------------------------------------------------------------------------------
      iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                            dDataLanc, sMensagem, bMostraMsg);
      if iPlanilha < 0 then
         raise Exception.Create(MensagemErro);
      Result := iPlanilha;
   except
      on E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que Executa a Reavaliação de um Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
// iModulo        : id do Módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
// iEmpresaProp   : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iBem           : id do Bem movimentado                             (IDBEM)
// dDataLaudo     : Data do laudo de reavaliacao                      (DATAMOVIMENTACAO)
// fValLaudo      : Valor do laudo de reavaliacao em Moeda Corrente   (VALORG/VALOFI)
// iVidautil      : Novo tempo de vida útil em Meses
// sObs           : Informações relativas ao laudo
// iTipDepProRata : [0] DataLaudo - 1, [1] DataLaudo
//
//----------------------------------------------------------------------------------------
function TAtivoFixo.ExecutaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                                       dDataLaudo : tDate;
                                       fValLaudo : Double; iVidaUtil : Integer;
                                       sObs : String;
                                       Var fDifReaval,fDifReavalImob : Double;
                                       iTipDepProRata : Integer; bMostraMsg : boolean) : Integer;

const
   iTipoMovimentacao = 8;           // Codigo de Reavaliacao de Bem

var
   iPlanoConta, iPeriodo, iExercicio,
   iSeqHist, iIdReavaliacao, iPlanilha                       : Integer;
   sDebito  , sDebitoCM  , sCredito  , sCreditoCM,
   sCCDebito, sCCDebitoCM, sCCCredito, sCCCreditoCM,
   sAtivProjeto, sMensagem                                   : String;
   fDepCmBem, fDepDepLanc, fDepCmDep,
   fSldCtbImob, fValFis, fValGer,
   fNovaTaxaDep, fTaxaDepCalc                                : Extended;
   qryBem,qryReavaliacao,qryAcrescimo,qryUltMov,qryUltReav   : TwwQuery;
   bTransacao                                                : Boolean;
   aIdHistMov                                                : array [1..1] of Integer;
   dDataUltMov, dDataUltDep                                  : tDate;

begin
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not (dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      // Valida os Parâmetros obrigatórios para reavaliação de bens
      //----------------------------------------------------------------------------------
      if iVidaUtil < 0 then
         MensagemErro := 'Tempo de Vida Útil Zerado igual a Taxa de Depreciação Zerada!';
      //----------------------------------------------------------------------------------
      if fValLaudo <= 0 then
         raise Exception.Create('Informe o novo valor do bem!');
      //----------------------------------------------------------------------------------
      if sObs = '' then
         raise Exception.Create('Declare as informações relativas ao laudo de reavaliação!');
      //----------------------------------------------------------------------------------
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
      //----------------------------------------------------------------------------------
      qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
      qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
      qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
      qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
      qryUltReav     := TwwQuery(dtmAtivoFixo.qryUltReav);
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após a Reavaliação
      //----------------------------------------------------------------------------------
      qryUltMov.Close;
      qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
      qryUltMov.Open;
      if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataLaudo) then
         raise Exception.Create('Existe movimentação após a Reavaliação. Consulte Movimentação!');
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM no bem que será reavaliado
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
         raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
      //----------------------------------------------------------------------------------
      if iModulo <= 0 then
         raise Exception.Create('É obrigatório fornecer o código do MODULO!')
      else
         if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
            raise Exception.Create('Somente o módulo que cadastrou o bem pode manipula-lo');
      //----------------------------------------------------------------------------------
      // verifica se ja houve reavaliacao na data
      //----------------------------------------------------------------------------------
      qryUltReav.Close;
      qryUltReav.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryUltReav.ParamByName('PIDBEM').AsInteger    := iBem;
      qryUltReav.ParamByName('PDATAMOV').AsDateTime := dDataLaudo;
      qryUltReav.Open;
      if not qryUltReav.IsEmpty then
         Raise Exception.Create('O bem ' + qryBem.FieldByName('PLACA').AsString +
                                ' já foi reavaliado na data. Consulte!');
      //----------------------------------------------------------------------------------
      // Verifica se a data da movimentação é válida
      //----------------------------------------------------------------------------------
      if not VerificaPeriodoCaf(qryBem.FieldByName('IDPESSOA').AsInteger,
                                qryBem.FieldByName('IDBEM').AsInteger,
                                qryBem.FieldByName('FLGIMOVEL').AsInteger,
                                '08', dDataLaudo, dDataUltMov, dDataUltDep) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Calcula a Depreciacao PróRata
      //----------------------------------------------------------------------------------
      fDepCmBem   := 0;
      fDepDepLanc := 0;
      fDepCmDep   := 0;
      if iTipDepProRata = 0 then
      begin
         if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataLaudo - 1),bMostraMsg,
                                   iTipDepProRata, fDepCmBem, fDepDepLanc, fDepCmDep) then
            Raise Exception.Create(MensagemErro);
      end else
      begin
         if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,dDataLaudo,bMostraMsg,
                                   iTipDepProRata, fDepCmBem, fDepDepLanc, fDepCmDep) then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Reposiciona a Tabela BEM após a depreciação prorata
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
         Raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
      //----------------------------------------------------------------------------------
      // Calcula a Nova Taxa de Depreciacao
      //----------------------------------------------------------------------------------
      fNovaTaxaDep := 0;
      if iVidaUtil > 0 then
         fNovaTaxaDep := (100 / (iVidaUtil / 12));    // iVidaUtil está em número de meses
      //----------------------------------------------------------------------------------
      // Calcula o Saldo para Reavaliacao
      //----------------------------------------------------------------------------------
      fDifReaval := ConvNum(fValLaudo - CalculaSaldoContabil(iEmpresaProp, iBem, dDataLaudo,fSldCtbImob));
      //----------------------------------------------------------------------------------
      // Calcula o Saldo para Reavaliacao do Sistema de Adm Imobiliaria
      //----------------------------------------------------------------------------------
      fDifReavalImob := ConvNum(fValLaudo - fSldCtbImob);
      //----------------------------------------------------------------------------------
      // Le os Parametros do CAF
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo.qryParamCAF do
      begin
         Close;
         ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
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
                                       sObs,iTipDepProRata,bMostraMsg);
      if iSeqHist = -1 then
         Raise Exception.Create(MensagemErro);
      aIdHistMov[1] := iSeqHist;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(Sistema.IdModulo, iEmpresaProp, iBem,
                                    dDataLaudo,
                                    0,0,0,0,
                                    0,0,0,0,
                                    fDifReaval,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 1) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if fNovaTaxaDep <> 0 then
      begin
         fTaxaDepCalc := ConvNum(ConvNum((qryBem.FieldByName('VALORG').asFloat  +
                                          qryBem.FieldByName('CMBEM').asFloat)  -
                                         (qryBem.FieldByName('DEPLANC').asFloat +
                                          qryBem.FieldByName('CMDEP').asFloat)) /
                                 (iVidaUtil / 12) /
                                 ConvNum(qryBem.FieldByName('VALORG').asFloat +
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
                                          -1, '', iTipDepProRata, bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Calcula a Nova Taxa de Depreciacao
         //-------------------------------------------------------------------------------
         if fNovaTaxaDep <> 0 then
         begin
            fTaxaDepCalc := ConvNum(ConvNum((qryReavaliacao.FieldByName('VALORG').asFloat  +
                                             qryReavaliacao.FieldByName('CMBEM').asFloat)  -
                                            (qryReavaliacao.FieldByName('DEPLANC').asFloat +
                                             qryReavaliacao.FieldByName('CMDEP').asFloat)) /
                                    (iVidaUtil / 12) /
                                    ConvNum(qryReavaliacao.FieldByName('VALORG').asFloat +
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
                                          -1, '', iTipDepProRata,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Calcula a Nova Taxa de Depreciacao
         //-------------------------------------------------------------------------------
         if (fNovaTaxaDep <> 0) then
         begin
            fTaxaDepCalc := ConvNum(ConvNum((qryAcrescimo.FieldByName('VALORG').asFloat  +
                                             qryAcrescimo.FieldByName('CMBEM').asFloat)  -
                                            (qryAcrescimo.FieldByName('DEPLANC').asFloat +
                                             qryAcrescimo.FieldByName('CMDEP').asFloat)) /
                                    (iVidaUtil / 12) /
                                    ConvNum(qryAcrescimo.FieldByName('VALORG').asFloat +
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
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         //-------------------------------------------------------------------------------
         // Busca o Periodo Contábil
         //-------------------------------------------------------------------------------
         if not VerificaPeriodoContabil(iEmpresaProp, dDataLaudo, iExercicio, iPeriodo,
                                        sMensagem, bMostraMsg) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('UNIDNEGOC').IsNull then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               Close;
               ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
               Open;
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
         with dtmAtivoFixo do
         begin
            if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
            if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
            if not qryConta.Prepared      then qryConta.Prepare;
            if not qryCCrd.Prepared       then qryCCrd.Prepare;
            if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
            if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
            if not qryHistCtb.Active      then qryMontaCtb.Open;
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
                                            iExercicio, iPeriodo,
                                            bMostraMsg);
         dtmAtivoFixo.qryMontaCtb.Close;
         if iPlanilha <= 0 then
            Raise Exception.Create(MensagemErro);
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
      if not Sistema.GravaLogOperacoes('Reavaliacao do Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iIdReavaliacao;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
   qryAux         : TwwQuery;

begin
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryRegistraReavaliacao);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
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
      //----------------------------------------------------------------------------------
      // Registra o IDREAVALIACAO na tabela HISTORICOMOVIMENTACAO
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO '+
                         ' SET IDREAVALACRESC = '+inttostr(iSeq)+
                         ' WHERE IDMOVIMENTACAO = '+inttostr(iMov);
      qryAux.ExecSQL;
      //----------------------------------------------------------------------------------
      Result := iSeq;
   //-------------------------------------------------------------------------------------
   except
      On E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que Contabiliza a Reavaliação
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaReavaliacao(iModulo, iPessoa, iGrupo, iConjunto, iBem : Integer;
                                           dDataLanc : TDate; fValReaval : Extended;
                                           sDesBem,sAtivProjeto : String;
                                           iSubConta : Integer; sPlaca : String;
                                           iExercicio, iPeriodo : Integer;
                                           bMostraMsg : Boolean) : Integer;
var
   iPlanoConta, iPlanilha,
   iTipoMovimentacao                   : Integer;
   fValLanc, fParticip1                : Extended;
   sMensagem, sDebito, sCredito,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre   : String;
   qryCcRD                             : TwwQuery;

begin
   try
      qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
      //----------------------------------------------------------------------------------
      if fValReaval > 0 then
      begin
         iTipoMovimentacao := 8;
      end else
      begin
         iTipoMovimentacao := 23;
      end;
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Reavaliação do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMovimentacao,'D',iPlanoConta,sDebito);
      //----------------------------------------------------------------------------------
      if sDebito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         if iTipoMovimentacao = 08 then
            raise Exception.Create('Conta a Débito para o Movimento de Reavaliação no Grupo ' + sGrupo +
                                   ' não cadastrada !')
         else
            raise Exception.Create('Conta a Débito para o Movimento de Reavaliação Negativa no Grupo ' + sGrupo +
                                   ' não cadastrada !');
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para o Acréscimo de Valor no Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMovimentacao,'C',iPlanoConta,sCredito);
      //----------------------------------------------------------------------------------
      if sCredito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         if iTipoMovimentacao = 08 then
            raise Exception.Create('Conta a Crédito para o Movimento de Reavaliação no Grupo ' + sGrupo +
                                   ' não cadastrada !')
         else
            raise Exception.Create('Conta a Crédito para o Movimento de Reavaliação Negativa no Grupo ' + sGrupo +
                                   ' não cadastrada !');
      end;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      if iTipoMovimentacao = 08 then
         sHistor := 'Reavaliação Patrimonial'
      else
         sHistor := 'Reavaliação Patrimonial Negativa';
      fParticip1 := 0;
      sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      //----------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         if fParticip1 < 100 then
         begin
            //----------------------------------------------------------------------------
            // Montagem da Partida Dobrada do Custo
            //----------------------------------------------------------------------------
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               fParticip1 := 100;
            //----------------------------------------------------------------------------
            fValLanc := (fValReaval * fParticip1) / 100;
            //----------------------------------------------------------------------------
            if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                         sCcDeb, sCCCre ,sAtivProjeto,
                                         sDebito, sCredito, sNumDoc, abs(fValLanc),
                                         iGrupo, iPlanoConta, iSubConta,
                                         sNomeContaDeb, sObrigaSubContaDeb,
                                         sNomeContaCre, sObrigaSubContaCre,
                                         iBem, iPessoa, 0, bMostraMsg) then
               raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         qryCcRD.Next;
      end;
      qryCcRD.Close;
      //----------------------------------------------------------------------------------
      // Integra a planilha com a Contabilidade
      //----------------------------------------------------------------------------------
      iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                            dDataLanc, sMensagem, bMostraMsg);
      if iPlanilha < 0 then
         raise Exception.Create(MensagemErro);
      Result := iPlanilha;
   except
      on E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
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
   iExercicio,iPeriodo,iMaxIdReaval,
   iTipDepProRata                             : Integer;
   sMascara,sMensagem                         : String;
   fTaxaDepAnt                                : Double;
   qryAux,qryBem,qryReavaliacao,qryAcrescimo,
   qryUltMov                                  : TwwQuery;
   bTransacao                                 : Boolean;

begin
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not (dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryUltMov.Prepared then qryUltMov.Prepare;
         if not qryBem.Prepared then qryBem.Prepare;
         if not qryReavaliacao.Prepared then qryReavaliacao.Prepare;
         if not qryAcrescimo.Prepared then qryAcrescimo.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
      qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
      qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
      qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
      qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após a reavaliação
      //----------------------------------------------------------------------------------
      qryUltMov.Close;
      qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
      qryUltMov.Open;
      if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
         raise Exception.Create('Existe movimentação após a reavaliação. Consulte!');
      //----------------------------------------------------------------------------------
      // Retorna a Taxa de Depreciacao Anterior do Bem e o ID da Movimentacao
      //----------------------------------------------------------------------------------
      iPlnCodigo := 0;
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,PLNCODIGO,TAXADEPANT,TIPDEPPRORATA '+
                         ' FROM HISTORICOMOVIMENTACAO '+
                         ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (IDTIPOMOVIMENTACAO = 08) ';
      qryAux.Open;
      if qryAux.IsEmpty then
         raise Exception.Create('Os parâmetros relativos ao bem estão incorretos! (HISTMOVBEM)');
      iTipDepProRata  := qryAux.FieldByName('TIPDEPPRORATA').AsInteger;
      fTaxaDepAnt     := qryAux.FieldByName('TAXADEPANT').AsFloat;
      iIdMovimentacao := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
      if not qryAux.FieldByName('PLNCODIGO').IsNull then
         iPlnCodigo := qryAux.FieldByName('PLNCODIGO').AsInteger;
      //----------------------------------------------------------------------------------
      // Estorna a Depreciacao PróRata
      //----------------------------------------------------------------------------------
      if iTipDepProRata = 0 then
      begin
         if EstornaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),dDataEst,bMostraMsg) < 0 then
            Raise Exception.Create(MensagemErro);
      end else
      begin
         if EstornaDepreciacao(iModulo,iEmpresaProp,iBem,dDataMov,dDataEst,bMostraMsg) < 0 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
         Raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
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
               Raise Exception.Create('Os parâmetros relativos a reavaliacao ' +
                                      inttostr(qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) +
                                      ' no histórico estão incorretos!');
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
         if qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger = iMaxIdReaval then
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
            Raise Exception.Create('Os parâmetros relativos a reavaliacao ' +
                                   inttostr(qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger) +
                                   ' no histórico estão incorretos!');
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
      iResult := 0;
      if IntegraContab(iEmpresaProp) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            if not RemovePlanContab(iEmpresaProp) then
            begin
               iResult := EstornaLanc(True, iPlnCodigo, 'BASEDADOS', datetostr(dDataEst),
                                      iExercicio, iPeriodo, iEmpresaProp, sMascara);
               //-------------------------------------------------------------------------
               if iResult = -1 then
                  Raise Exception.Create('Estorno da Planilha Contábil não foi permitido!');
            end else
            begin
               with dtmAtivoFixo.qryParamCaf do
               begin
                  Close;
                  ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                  Open;
                  //----------------------------------------------------------------------
                  iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                        FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                        Sistema.IdUsuario, True, 0, sMascara);
               end;
               //-------------------------------------------------------------------------
               if iResult = -1 then
                  Raise Exception.Create('Remoção da Planilha da Contabilidade não foi permitida!');
            end;
         end else
         begin
            Raise Exception.Create(MensagemErro);
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
         qryEstornaReavaliacao.ParamByName('PIDMOVIMENTACAO').AsInteger := iIdMovimentacao;
         qryEstornaReavaliacao.ExecSQL;
         if qryEstornaReavaliacao.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover o lançamento da reavaliação!');
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF '+
                            ' FROM HISTORICOMOVIMENTACAO'+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (08,53,54))';
         qryAux.Open;
         while not qryAux.Eof do
         begin
            if qryAux.FieldByName('NCAF').AsInteger = 0 then
            begin
               //-------------------------------------------------------------------------
               // Remove os lançamentos da modelagem antiga
               //-------------------------------------------------------------------------
               qryLegRemReav.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryLegRemReav.ExecSQL;
               qryLegRemReavReav.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryLegRemReavReav.ExecSQL;
               qryLegRemReavAcres.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryLegRemReavAcres.ExecSQL;
            end;
            //----------------------------------------------------------------------------
            // Remove o Registro da Movimentacao
            //----------------------------------------------------------------------------
            qryEstornaMov.ParamByName('PIDBEM').AsInteger    := iBem;
            qryEstornaMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryEstornaMov.ParamByName('PIDMOVIM').AsInteger  := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaMov.ExecSQL;
            if qryEstornaMov.RowsAffected <= 0 then
               Raise Exception.Create('Não foi possível remover o lançamento da reavaliação no histórico!');
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryAux.Close;
      end;
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Estorno da Reavaliacao do Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,
                                    (dDataMov - 1),0,0,0,0,0,0,0,0,0,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      Result := iResult;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que executa a Baixa de um Bem
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
//    iModulo          : id do módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
//    iEmpresaProp     : id da empresa proprietária (Sistema.idEmpresa)    (IDPESSOA)
//    iBem             : id do bem movimentado                             (IDBEM)
//    iTipoBaixa       : id do tipo de baixa                               (MOTIVOBAIXA.IDMOTIVOBAIXA)
//    dDataBaixa       : Data da baixa                                     (DATAMOVIMENTACAO)
//    iTipoPropBaixa   : Tipo da Proporção da baixa                        (0 - Percentual, 1 - Valor)
//    fPropBaixa       : Proporção da baixa                                (0 - 100)
//    fValVenda        : Valor da Alienação (se Zero, não é Alienação)
//    sObsBaixa        : Informações relativas a baixa
//    sPlaContaDestino : Conta Contábil que irá receber o valor da baixa,
//                       em substituição ao definido nos parâmetros contábeis
//                       do sistema.
//    iTipDepProRata   : [0] dDataBaixa - 1, [1] dDataBaixa
//    fValResult       : Retorna o Resultado da Venda baseado no valor contábil
//    fValResultImob   : Retorna o Resultado da Venda baseado no valor do bem
//    iPlanilha        : Planilha Contábil Gerada
//
//----------------------------------------------------------------------------------------
function TAtivoFixo.ExecutaBaixa(iModulo, iEmpresaProp, iBem,
                                 iMotivoBaixa : Integer;
                                 dDataBaixa   : tDate;
                                 iTipoPropBaixa : Integer;
                                 Var fPropBaixa, fValVenda : Extended;
                                 sObsBaixa : String;
                                 sPlaContaDestino : String;
                                 iTipDepProRata : Integer;
                                 bMostraMsg : boolean;
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
   bPlanilha, bTransacao                                : Boolean;
   fPropBaixar, fPropResult, fSldContabil,
   fBaixaB , fBaixaBF, fBaixaBG, fSldCtbImob,
   fBaixaD , fBaixaDF, fBaixaDG,
   fBaixaCM, fBaixaCMD,
   fDepCmBem, fDepDepLanc, fDepCmDep                    : Extended;
   aIdHistMov                                           : array [1..244] of Integer;
   dDataUltMov,dDataUltDep                              : tDate;

begin
   bTransacao := False;
   try
      with dtmAtivoFixo do
      begin
         if not qryUltMov.Prepared               then qryUltMov.Prepare;
         if not qryBem.Prepared                  then qryBem.Prepare;
         if not qryReavaliacao.Prepared          then qryReavaliacao.Prepare;
         if not qryAcrescimo.Prepared            then qryAcrescimo.Prepare;
         if not qrySldContabil.Prepared          then qrySldContabil.Prepare;
         if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
         if not qryRegistraBaixaBem.Prepared     then qryRegistraBaixaBem.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
      qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
      qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
      qrySldContabil := TwwQuery(dtmAtivoFixo.qrySldContabil);
      qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
      //----------------------------------------------------------------------------------
      // Valida os Parâmetros obrigatórios para baixa de bens
      //----------------------------------------------------------------------------------
      if iMotivoBaixa <= 0 then
      begin
         dtmAtivoFixo.qryMotivoBaixa.Open;
         dtmAtivoFixo.qryMotivoBaixa.First;
         iMotivoBaixa := dtmAtivoFixo.qryMotivoBaixaIDMOTIVOBAIXA.AsInteger;
         dtmAtivoFixo.qryMotivoBaixa.Close;
      end;
      //----------------------------------------------------------------------------------
      if iTipoPropBaixa = 0 then
      begin
         if (fPropBaixa <= 0) or (fPropBaixa > 100) then
         begin
            MensagemErro := 'Forneça a Proporção Percentual da Baixa ! ('+floattostr(fPropBaixa)+')';
            Raise Exception.Create(MensagemErro);
         end;
      end else
      begin
         if fPropBaixa < 0 then
         begin
            MensagemErro := 'Valor da baixa inválido!';
            Raise Exception.Create(MensagemErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após a Baixa
      //----------------------------------------------------------------------------------
      qryUltMov.Close;
      qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
      qryUltMov.Open;
      if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataBaixa) then
      begin
         MensagemErro := 'Existe movimentação após a data da baixa. Consulte Historico de Movimentações!';
         Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      // Acerta o Saldo Contábil do Bem antes de executar a baixa
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryAtuBem.Close;
         qryAtuBem.SQL.Strings[59] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
         qryAtuBem.ParamByName('PDATAMOV').AsDateTime  := date;
         qryAtuBem.Open;
         while not qryAtuBem.EOF do
         begin
            if abs(qryAtuBemVALORG.AsFloat - qryAtuBemVALORG0.AsFloat) >= 0.01 then
            begin
               qryAtuBem.Edit;
               qryAtuBemVALORG.AsFloat := qryAtuBemVALORG0.AsFloat;
               qryAtuBem.Post;
               qryAtuBem.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if abs(qryAtuBemCMBEM.AsFloat - qryAtuBemCMBEM0.AsFloat) >= 0.01 then
            begin
               qryAtuBem.Edit;
               qryAtuBemCMBEM.AsFloat := qryAtuBemCMBEM0.AsFloat;
               qryAtuBem.Post;
               qryAtuBem.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if abs(qryAtuBemDEPLANC.AsFloat - qryAtuBemDEPLANC0.AsFloat) >= 0.01 then
            begin
               qryAtuBem.Edit;
               qryAtuBemDEPLANC.AsFloat := qryAtuBemDEPLANC0.AsFloat;
               qryAtuBem.Post;
               qryAtuBem.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if abs(qryAtuBemCMDEP.AsFloat - qryAtuBemCMDEP0.AsFloat) >= 0.01 then
            begin
               qryAtuBem.Edit;
               qryAtuBemCMDEP.AsFloat := qryAtuBemCMDEP0.AsFloat;
               qryAtuBem.Post;
               qryAtuBem.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            qryAtuBem.Next;
         end;
         //-------------------------------------------------------------------------------
         qryAtuReavaliacao.Close;
         qryAtuReavaliacao.SQL.Strings[59] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
         qryAtuReavaliacao.ParamByName('PDATAMOV').AsDateTime  := Date;
         qryAtuReavaliacao.Open;
         while not qryAtuReavaliacao.EOF do
         begin
            if abs(qryAtuReavaliacaoVALORG.AsFloat - qryAtuReavaliacaoVALORG0.AsFloat) >= 0.01 then
            begin
               qryAtuReavaliacao.Edit;
               qryAtuReavaliacaoVALORG.AsFloat := qryAtuReavaliacaoVALORG0.AsFloat;
               qryAtuReavaliacao.Post;
               qryAtuReavaliacao.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if abs(qryAtuReavaliacaoCMBEM.AsFloat - qryAtuReavaliacaoCMBEM0.AsFloat) >= 0.01 then
            begin
               qryAtuReavaliacao.Edit;
               qryAtuReavaliacaoCMBEM.AsFloat := qryAtuReavaliacaoCMBEM0.AsFloat;
               qryAtuReavaliacao.Post;
               qryAtuReavaliacao.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if abs(qryAtuReavaliacaoDEPLANC.AsFloat - qryAtuReavaliacaoDEPLANC0.AsFloat) >= 0.01 then
            begin
               qryAtuReavaliacao.Edit;
               qryAtuReavaliacaoDEPLANC.AsFloat := qryAtuReavaliacaoDEPLANC0.AsFloat;
               qryAtuReavaliacao.Post;
               qryAtuReavaliacao.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if abs(qryAtuReavaliacaoCMDEP.AsFloat - qryAtuReavaliacaoCMDEP0.AsFloat) >= 0.01 then
            begin
               qryAtuReavaliacao.Edit;
               qryAtuReavaliacaoCMDEP.AsFloat := qryAtuReavaliacaoCMDEP0.AsFloat;
               qryAtuReavaliacao.Post;
               qryAtuReavaliacao.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            qryAtuReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         qryAtuAcrescimo.Close;
         qryAtuAcrescimo.SQL.Strings[59] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
         qryAtuAcrescimo.ParamByName('PDATAMOV').AsDateTime  := Date;
         qryAtuAcrescimo.Open;
         while not qryAtuAcrescimo.EOF do
         begin
            if abs(qryAtuAcrescimoVALORG.AsFloat - qryAtuAcrescimoVALORG0.AsFloat) >= 0.01 then
            begin
               qryAtuAcrescimo.Edit;
               qryAtuAcrescimoVALORG.AsFloat := qryAtuAcrescimoVALORG0.AsFloat;
               qryAtuAcrescimo.Post;
               qryAtuAcrescimo.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if abs(qryAtuAcrescimoCMBEM.AsFloat - qryAtuAcrescimoCMBEM0.AsFloat) >= 0.01 then
            begin
               qryAtuAcrescimo.Edit;
               qryAtuAcrescimoCMBEM.AsFloat := qryAtuAcrescimoCMBEM0.AsFloat;
               qryAtuAcrescimo.Post;
               qryAtuAcrescimo.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if abs(qryAtuAcrescimoDEPLANC.AsFloat - qryAtuAcrescimoDEPLANC0.AsFloat) >= 0.01 then
            begin
               qryAtuAcrescimo.Edit;
               qryAtuAcrescimoDEPLANC.AsFloat := qryAtuAcrescimoDEPLANC0.AsFloat;
               qryAtuAcrescimo.Post;
               qryAtuAcrescimo.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            if abs(qryAtuAcrescimoCMDEP.AsFloat - qryAtuAcrescimoCMDEP0.AsFloat) >= 0.01 then
            begin
               qryAtuAcrescimo.Edit;
               qryAtuAcrescimoCMDEP.AsFloat := qryAtuAcrescimoCMDEP0.AsFloat;
               qryAtuAcrescimo.Post;
               qryAtuAcrescimo.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            qryAtuAcrescimo.Next;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela de Bens no Bem a ser baixado
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      //----------------------------------------------------------------------------------
      // Verifica se a data da movimentação é válida
      //----------------------------------------------------------------------------------
      if not VerificaPeriodoCaf(qryBem.FieldByName('IDPESSOA').AsInteger,
                                qryBem.FieldByName('IDBEM').AsInteger,
                                qryBem.FieldByName('FLGIMOVEL').AsInteger,
                                '06', dDataBaixa, dDataUltMov, dDataUltDep) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Calcula a Depreciacao PróRata
      //----------------------------------------------------------------------------------
      fDepCmBem   := 0;
      fDepDepLanc := 0;
      fDepCmDep   := 0;
      if qryBem.FieldByName('CONTROLE').AsString = 'T' then
      begin
         if iTipDepProRata = 0 then
         begin
            if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataBaixa - 1),bMostraMsg,
                                      iTipDepProRata, fDepCmBem, fDepDepLanc, fDepCmDep) then
               Raise Exception.Create(MensagemErro);
         end else
         begin
            if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,dDataBaixa,bMostraMsg,
                                      iTipDepProRata, fDepCmBem, fDepDepLanc, fDepCmDep) then
               Raise Exception.Create(MensagemErro);
         end;
      end;   
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela de Bens no Bem após a depreciação prorata
      //----------------------------------------------------------------------------------
      //qryBem.Close;
      //qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      //qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      //qryBem.Open;
      //----------------------------------------------------------------------------------
      if ((qryBem.FieldByName('BAIXATOTAL').AsString = 'S') or
          (qryBem.FieldByName('PROPBAIXA').AsFloat = 100)) then
         Raise Exception.Create('Bem ' + trim(qryBem.FieldByName('DESBEM').AsString) + ' - ' +
                                inttostr(qryBem.FieldByName('PLACA').AsInteger) + ' já Baixado !');
      //----------------------------------------------------------------------------------
      // Levanta o Saldo Contábil Atual para Realizar o Lancamento
      //----------------------------------------------------------------------------------
      fSldContabil := CalculaSaldoContabil(iEmpresaProp, iBem, dDataBaixa,fSldCtbImob);
      if (fValVenda <> 0) then
      begin
         fValResult     := fValVenda - fSldContabil;
         fValResultImob := fValVenda - fSldCtbImob;
      end else
      begin
         fValResult     := 0;
         fValResultImob := 0;
      end;
      //----------------------------------------------------------------------------------
      // Se a proporção for do tipo 1, calcular o valor percentual
      //----------------------------------------------------------------------------------
      if iTipoPropBaixa = 1 then
      begin
         if fSldContabil <> 0 then
         begin
            fPropBaixa := (fPropBaixa / fSldContabil) * 100 ;
            if (fPropBaixa < 0) or (fPropBaixa > 100) then
               Raise Exception.Create('O valor informado para baixa parcial está acima do valor contábil'+#13+
                                      'do bem no dia da baixa ('+FormatFloat('#0.00',fSldContabil)+')');
         end else
         begin
            fPropBaixa := 100;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ((qryBem.FieldByName('PROPBAIXA').AsFloat + fPropBaixa) > 100) then
      begin
         fPropBaixar := 100 - qryBem.FieldByName('PROPBAIXA').AsFloat;
      end else
      begin
         fPropBaixar := fPropBaixa;
      end;
      //----------------------------------------------------------------------------------
      iaIdHistMov := 0;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 06
      //----------------------------------------------------------------------------------
      fBaixaB  := ConvNum(qryBem.FieldByName('VALORG').asFloat) * (fPropBaixar / 100);
      fBaixaBF := ConvNum(qryBem.FieldByName('VALFIS').asFloat) * (fPropBaixar / 100);
      fBaixaBG := ConvNum(qryBem.FieldByName('VALGER').asFloat) * (fPropBaixar / 100);
      //----------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 06, dDataBaixa,
                                       -1, fBaixaB, fBaixaBF, fBaixaBG,
                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
      if iSeqHist = -1 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if not RegistraBaixaBem(iSeqHist,iMotivoBaixa,fPropBaixar,sObsBaixa,0,
                              bMostraMsg) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      inc(iaIdHistMov);
      aIdHistMov[iaIdHistMov] := iSeqHist;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 25
      //----------------------------------------------------------------------------------
      fBaixaCM := ConvNum(qryBem.FieldByName('CMBEM').asFloat) * (fPropBaixar / 100);
      if fBaixaCM <> 0 then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 25, dDataBaixa,
                                          -1,
                                          fBaixaCM, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 24
      //----------------------------------------------------------------------------------
      fBaixaD  := ConvNum(qryBem.FieldByName('DEPLANC').asFloat) * (fPropBaixar / 100);
      fBaixaDF := ConvNum(qryBem.FieldByName('DEPFIS').asFloat)  * (fPropBaixar / 100);
      fBaixaDG := ConvNum(qryBem.FieldByName('DEPGER').asFloat)  * (fPropBaixar / 100);
      if fBaixaD <> 0 then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 24, dDataBaixa,
                                          -1, fBaixaD, fBaixaDF, fBaixaDG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 26
      //----------------------------------------------------------------------------------
      fBaixaCMD := ConvNum(qryBem.FieldByName('CMDEP').asFloat) * (fPropBaixar / 100);
      if (fBaixaCMD <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 26, dDataBaixa,
                                          -1,
                                          fBaixaCMD, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      if (qryBem.FieldByName('CONTROLE').AsString = 'T') and (IntegraContab(iEmpresaProp)) then
      begin
         with dtmAtivoFixo do
         begin
            if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
            if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
            if not qryConta.Prepared      then qryConta.Prepare;
            if not qryCCrd.Prepared       then qryCCrd.Prepare;
            if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
            if not qryMontaCtb.Active     then qryMontaCtb.Open ;
         end;
         //-------------------------------------------------------------------------------
         // Busca o Periodo Contábil
         //-------------------------------------------------------------------------------
         if not VerificaPeriodoContabil(iEmpresaProp,dDataBaixa,iExercicio,iPeriodo,
                                        sMensagem,bMostraMsg) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('UNIDNEGOC').IsNull then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               Close;
               ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
               Open;
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
         if not ContabilizaBaixa(iModulo,
                                 qryBem.FieldByName('IDPESSOA').AsInteger,
                                 qryBem.FieldByName('IDGRUPO').AsInteger,
                                 qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                 qryBem.FieldByName('IDBEM').AsInteger,
                                 dDataBaixa,
                                 fBaixaB,fBaixaCM,fBaixaD,fBaixaCMD,
                                 qryBem.FieldByName('DESBEM').AsString,
                                 sAtivProjeto,'B',
                                 qryBem.FieldByName('CODSUBCONTA').AsInteger,
                                 qryBem.FieldByName('PLACA').AsString,
                                 sPlaContaDestino, bMostraMsg) then
            Raise Exception.Create(MensagemErro);
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
            fPropResult := strtofloat(FormatFloat('#0.000000',((fPropResult * 1000000) / 1000000)));
            if not ContabilizaResultadoBaixa(iModulo,
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
                                             bMostraMsg) then
               Raise Exception.Create(MensagemErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Registra as alteracoes na Tabela de Bens
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('VALORG').asFloat  := ConvNum(qryBem.FieldByName('VALORG').asFloat  - fBaixaB);
      qryBem.FieldByName('VALFIS').asFloat  := ConvNum(qryBem.FieldByName('VALFIS').asFloat  - fBaixaBF);
      qryBem.FieldByName('VALGER').asFloat  := ConvNum(qryBem.FieldByName('VALGER').asFloat  - fBaixaBG);
      qryBem.FieldByName('DEPLANC').asFloat := ConvNum(qryBem.FieldByName('DEPLANC').asFloat - fBaixaD);
      qryBem.FieldByName('DEPFIS').asFloat  := ConvNum(qryBem.FieldByName('DEPFIS').asFloat  - fBaixaDF);
      qryBem.FieldByName('DEPGER').asFloat  := ConvNum(qryBem.FieldByName('DEPGER').asFloat  - fBaixaDG);
      qryBem.FieldByName('CMBEM').asFloat   := ConvNum(qryBem.FieldByName('CMBEM').asFloat   - fBaixaCM);
      qryBem.FieldByName('CMDEP').asFloat   := ConvNum(qryBem.FieldByName('CMDEP').asFloat   - fBaixaCMD);
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
         fBaixaB  := ConvNum(qryReavaliacao.FieldByName('VALORG').asFloat * (fPropBaixar / 100));
         fBaixaBF := ConvNum(qryReavaliacao.FieldByName('VALFIS').asFloat * (fPropBaixar / 100));
         fBaixaBG := ConvNum(qryReavaliacao.FieldByName('VALGER').asFloat * (fPropBaixar / 100));
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 20, dDataBaixa,
                                          qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                          fBaixaB, fBaixaBF, fBaixaBG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 28
         //-------------------------------------------------------------------------------
         fBaixaCM := ConvNum(qryReavaliacao.FieldByName('CMBEM').asFloat * (fPropBaixar / 100));
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 28, dDataBaixa,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 27
         //-------------------------------------------------------------------------------
         fBaixaD  := ConvNum(qryReavaliacao.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100));
         fBaixaDF := ConvNum(qryReavaliacao.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100));
         fBaixaDG := ConvNum(qryReavaliacao.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100));
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 27, dDataBaixa,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaD, fBaixaDF, fBaixaDG,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 29
         //-------------------------------------------------------------------------------
         fBaixaCMD := ConvNum(qryReavaliacao.FieldByName('CMDEP').asFloat * (fPropBaixar / 100));
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 29, dDataBaixa,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCMD, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Lançamentos Contábeis
         //-------------------------------------------------------------------------------
         if (qryBem.FieldByName('CONTROLE').AsString = 'T') and (IntegraContab(iEmpresaProp)) then
         begin
            with dtmAtivoFixo do
            begin
               if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
               if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
               if not qryConta.Prepared      then qryConta.Prepare;
               if not qryCCrd.Prepared       then qryCCrd.Prepare;
               if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
               if not qryMontaCtb.Active     then qryMontaCtb.Open ;
            end;
            //----------------------------------------------------------------------------
            if not ContabilizaBaixa(iModulo,
                                    qryBem.FieldByName('IDPESSOA').AsInteger,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                    qryBem.FieldByName('IDBEM').AsInteger,
                                    dDataBaixa,
                                    fBaixaB,fBaixaCM,fBaixaD,fBaixaCMD,
                                    qryBem.FieldByName('DESBEM').AsString,
                                    sAtivProjeto,'R',
                                    qryBem.FieldByName('CODSUBCONTA').asInteger,
                                    qryBem.FieldByName('PLACA').AsString,
                                    sPlaContaDestino, bMostraMsg) then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            if fValVenda <> 0 then
            begin
               if fSldContabil <> 0 then
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
               fPropResult := strtofloat(FormatFloat('#0.000000',((fPropResult * 1000000) / 1000000)));
               if not ContabilizaResultadoBaixa(iModulo,
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
                                                bMostraMsg) then
                  Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Bens
         //-------------------------------------------------------------------------------
         qryReavaliacao.Edit;
         qryReavaliacao.FieldByName('VALORG').asFloat  := ConvNum(qryReavaliacao.FieldByName('VALORG').asFloat  - fBaixaB);
         qryReavaliacao.FieldByName('VALFIS').asFloat  := ConvNum(qryReavaliacao.FieldByName('VALFIS').asFloat  - fBaixaBF);
         qryReavaliacao.FieldByName('VALGER').asFloat  := ConvNum(qryReavaliacao.FieldByName('VALGER').asFloat  - fBaixaBG);
         qryReavaliacao.FieldByName('DEPLANC').asFloat := ConvNum(qryReavaliacao.FieldByName('DEPLANC').asFloat - fBaixaD);
         qryReavaliacao.FieldByName('DEPFIS').asFloat  := ConvNum(qryReavaliacao.FieldByName('DEPFIS').asFloat  - fBaixaDF);
         qryReavaliacao.FieldByName('DEPGER').asFloat  := ConvNum(qryReavaliacao.FieldByName('DEPGER').asFloat  - fBaixaDG);
         qryReavaliacao.FieldByName('CMBEM').asFloat   := ConvNum(qryReavaliacao.FieldByName('CMBEM').asFloat   - fBaixaCM);
         qryReavaliacao.FieldByName('CMDEP').asFloat   := ConvNum(qryReavaliacao.FieldByName('CMDEP').asFloat   - fBaixaCMD);
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
         fBaixaB  := ConvNum(qryAcrescimo.FieldByName('VALORG').asFloat * (fPropBaixar / 100));
         fBaixaBF := ConvNum(qryAcrescimo.FieldByName('VALFIS').asFloat * (fPropBaixar / 100));
         fBaixaBG := ConvNum(qryAcrescimo.FieldByName('VALGER').asFloat * (fPropBaixar / 100));
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 37, dDataBaixa,
                                          qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                          fBaixaB, fBaixaBF, fBaixaBG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 38
         //-------------------------------------------------------------------------------
         fBaixaCM := ConvNum(qryAcrescimo.FieldByName('CMBEM').asFloat * (fPropBaixar / 100));
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 38, dDataBaixa,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 39
         //-------------------------------------------------------------------------------
         fBaixaD  := ConvNum(qryAcrescimo.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100));
         fBaixaDF := ConvNum(qryAcrescimo.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100));
         fBaixaDG := ConvNum(qryAcrescimo.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100));
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 39, dDataBaixa,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaD, fBaixaDF, fBaixaDG,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 40
         //-------------------------------------------------------------------------------
         fBaixaCMD := ConvNum(qryAcrescimo.FieldByName('CMDEP').asFloat * (fPropBaixar / 100));
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 40, dDataBaixa,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaCMD, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Lançamentos Contábeis
         //-------------------------------------------------------------------------------
         if (qryBem.FieldByName('CONTROLE').AsString = 'T') and (IntegraContab(iEmpresaProp)) then
         begin
            with dtmAtivoFixo do
            begin
               if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
               if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
               if not qryConta.Prepared      then qryConta.Prepare;
               if not qryCCrd.Prepared       then qryCCrd.Prepare;
               if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
               if not qryMontaCtb.Active     then qryMontaCtb.Open ;
            end;
            //----------------------------------------------------------------------------
            if not ContabilizaBaixa(iModulo,
                                    qryBem.FieldByName('IDPESSOA').AsInteger,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                    qryBem.FieldByName('IDBEM').AsInteger,
                                    dDataBaixa,
                                    fBaixaB,fBaixaCM,fBaixaD,fBaixaCMD,
                                    qryBem.FieldByName('DESBEM').AsString,
                                    sAtivProjeto,'A',
                                    qryBem.FieldByName('CODSUBCONTA').asInteger,
                                    qryBem.FieldByName('PLACA').AsString,
                                    sPlaContaDestino, bMostraMsg) then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            if fValVenda <> 0 then
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
               fPropResult := strtofloat(FormatFloat('#0.000000',((fPropResult * 1000000) / 1000000)));
               if not ContabilizaResultadoBaixa(iModulo,
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
                                                bMostraMsg) then
                  Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Acrescimos de Valor
         //-------------------------------------------------------------------------------
         qryAcrescimo.Edit;
         qryAcrescimo.FieldByName('VALORG').asFloat  := ConvNum(qryAcrescimo.FieldByName('VALORG').asFloat  - fBaixaB);
         qryAcrescimo.FieldByName('VALFIS').asFloat  := ConvNum(qryAcrescimo.FieldByName('VALFIS').asFloat  - fBaixaBF);
         qryAcrescimo.FieldByName('VALGER').asFloat  := ConvNum(qryAcrescimo.FieldByName('VALGER').asFloat  - fBaixaBG);
         qryAcrescimo.FieldByName('DEPLANC').asFloat := ConvNum(qryAcrescimo.FieldByName('DEPLANC').asFloat - fBaixaD);
         qryAcrescimo.FieldByName('DEPFIS').asFloat  := ConvNum(qryAcrescimo.FieldByName('DEPFIS').asFloat  - fBaixaDF);
         qryAcrescimo.FieldByName('DEPGER').asFloat  := ConvNum(qryAcrescimo.FieldByName('DEPGER').asFloat  - fBaixaDG);
         qryAcrescimo.FieldByName('CMBEM').asFloat   := ConvNum(qryAcrescimo.FieldByName('CMBEM').asFloat   - fBaixaCM);
         qryAcrescimo.FieldByName('CMDEP').asFloat   := ConvNum(qryAcrescimo.FieldByName('CMDEP').asFloat   - fBaixaCMD);
         qryAcrescimo.Post;
         qryAcrescimo.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      if (qryBem.FieldByName('CONTROLE').AsString = 'T') and (IntegraContab(iEmpresaProp)) then
      begin
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                               dDataBaixa, sMensagem, bMostraMsg);
         if iPlanilha < 0 then
            Raise Exception.Create(MensagemErro);
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
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(Sistema.IdModulo,iEmpresaProp,iBem,(dDataBaixa - 1),
                                    0,0,0,0,0,0,0,0,0,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryBem.FieldByName('IDRESPONSAVEL').AsInteger,2) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Baixa do Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := True;
   except
      on E : Exception do
      begin
         Result := False;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
                                     fPropBaixar : Extended; sObsBaixa : string;
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
      On E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que Contabiliza a Baixa do Bem / Reavaliacao do Bem / Acréscimo de Valor do Bem
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaBaixa(iModulo, iPessoa, iGrupo, iConjunto, iBem : Integer;
                                     dDataLanc : TDate;
                                     fBaixaB, fBaixaCMB, fBaixaD, fBaixaCMD : Extended;
                                     sDesBem, sAtivProjeto, sTipoTab : String;
                                     iSubConta : Integer; sPlaca, sPlaContaDestino : String;
                                     bMostraMsg : Boolean) : Boolean;
var
   iTipoMov1, iTipoMov2, iTipoMov3,
   iTipoMov4, iPlanoConta              : Integer;
   fValLanc, fParticip1, fParticip2,
   fParticip3, fParticip4              : Extended;
   sMensErro, sDebito, sCredito,
   sDebitoCM, sCreditoCM,
   sDebitoD, sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre   : String;
   qryCcRD                             : TwwQuery;

begin
   try
      qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
      //----------------------------------------------------------------------------------
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
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Baixa do Custo do Bem
      //----------------------------------------------------------------------------------
      if sPlaContaDestino <> '' then
         sDebito := sPlaContaDestino
      else
         Localiza_ContaContabil(iGrupo,iTipoMov1,'D',iPlanoConta,sDebito);
      //----------------------------------------------------------------------------------
      if sDebito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Débito para o Movimento de Baixa do Custo no Grupo ' + sGrupo +
                                ' não cadastrada !'+sMensErro);
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Baixa do Custo do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMov1,'C',iPlanoConta,sCredito);
      //----------------------------------------------------------------------------------
      if sCredito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Crédito para o Movimento de Baixa do Custo no Grupo ' + sGrupo +
                                ' não cadastrada !'+sMensErro);
      end;
      //----------------------------------------------------------------------------------
      if fBaixaCMB <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Baixa da Correção Monetária do Custo
         //-------------------------------------------------------------------------------
         if sPlaContaDestino <> '' then
            sDebitoCM := sPlaContaDestino
         else
            Localiza_ContaContabil(iGrupo,iTipoMov2,'D',iPlanoConta,sDebitoCM);
         //-------------------------------------------------------------------------------
         if sDebitoCM = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Débito para o Movimento de Baixa da Correção Monetária do Custo no Grupo '
                                   + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Baixa da Correção Monetária do Custo
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov2,'C',iPlanoConta,sCreditoCM);
         //-------------------------------------------------------------------------------
         if sCreditoCM = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Crédito para o Movimento de Baixa da Correção Monetária do Custo no Grupo '
                                   + sGrupo + ' não cadastrada !');
         end;
      end;
      //----------------------------------------------------------------------------------
      if fBaixaD <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Baixa da Depreciação Acumulada
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov3,'D',iPlanoConta,sDebitoD);
         //-------------------------------------------------------------------------------
         if sDebitoD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Débito para o Movimento de Baixa da Depreciação Acumulada no Grupo ' +
                                   sGrupo + ' não cadastrada !' + sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Entrada da Depreciação Inicial
         //-------------------------------------------------------------------------------
         if sPlaContaDestino <> '' then
            sCreditoD := sPlaContaDestino
         else
            Localiza_ContaContabil(iGrupo,iTipoMov3,'C',iPlanoConta,sCreditoD);
         //-------------------------------------------------------------------------------
         if sCreditoD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Crédito para o Movimento de Baixa da Depreciação Acumulada no Grupo ' +
                                   sGrupo + ' não cadastrada !' + sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      if fBaixaCMD <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Correção Monetária da Depreciacao Inicial
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov4,'D',iPlanoConta,sDebitoCMD);
         //-------------------------------------------------------------------------------
         if sDebitoCMD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Débito para o Movimento de Baixa da Correção Monetária da ' +
                                   'Depreciação Acumulada no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Correção Monetária da Depreciacao Inicial
         //-------------------------------------------------------------------------------
         if sPlaContaDestino <> '' then
            sCreditoCMD := sPlaContaDestino
         else
            Localiza_ContaContabil(iGrupo,iTipoMov4,'C',iPlanoConta,sCreditoCMD);
         //-------------------------------------------------------------------------------
         if sCreditoCMD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Crédito para o Movimento de Baixa da Correção Monetária da ' +
                                   'Depreciação Acumulada no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      sHistor    := 'Baixa de Bem ';
      sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      fParticip1 := 0;
      fParticip2 := 0;
      fParticip3 := 0;
      fParticip4 := 0;
      //----------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         if fParticip1 < 100 then
         begin
            //----------------------------------------------------------------------------
            // Montagem da Partida Dobrada do Custo
            //----------------------------------------------------------------------------
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa a Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               fParticip1 := 100;
            //----------------------------------------------------------------------------
            fValLanc := (fBaixaB * fParticip1) / 100;
            //----------------------------------------------------------------------------
            if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                         sCcDeb, sCCCre ,sAtivProjeto,
                                         sDebito, sCredito, sNumDoc, abs(fValLanc),
                                         iGrupo, iPlanoConta, iSubConta,
                                         sNomeContaDeb, sObrigaSubContaDeb,
                                         sNomeContaCre, sObrigaSubContaCre,
                                         iBem, iPessoa, 0, bMostraMsg) then
            begin
               raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if fBaixaCMB <> 0 then
         begin
            if fParticip2 < 100 then
            begin
               sHistor := 'Baixa da Correção Monetária do Custo';
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada da Correção Monetária do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Pesquisa a Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCM,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCM,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  fParticip2 := 100;
               //-------------------------------------------------------------------------
               fValLanc := (fBaixaCMB * fParticip2) / 100;
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCcDeb, sCCCre ,sAtivProjeto,
                                            sDebitoCM, sCreditoCM, sNumDoc, abs(fValLanc),
                                            iGrupo, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if fBaixaD <> 0 then
         begin
            if fParticip3 < 100 then
            begin
               sHistor := 'Baixa da Depreciação Acumulada';
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada da Depreciacao do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Pesquisa a Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoD,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip3 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoD,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip3 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  fParticip3 := 100;
               //-------------------------------------------------------------------------
               fValLanc := (fBaixaD * fParticip3) / 100;
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCcDeb, sCCCre ,sAtivProjeto,
                                            sDebitoD, sCreditoD, sNumDoc, abs(fValLanc),
                                            iGrupo, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro)
            end;
         end;
         //-------------------------------------------------------------------------------
         if fBaixaCMD <> 0 then
         begin
            if fParticip4 < 100 then
            begin
               sHistor := 'Correção Monetária Inicial da Depreciação do Bem ';
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada da Correção Monetária da Depreciacao
               // do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Pesquisa a Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCMD,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip4 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoD,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip4 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  fParticip4 := 100;
               //-------------------------------------------------------------------------
               fValLanc := (fBaixaCMD * fParticip4) / 100;
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                            sCcDeb, sCCCre ,sAtivProjeto,
                                            sDebitoCMD, sCreditoCMD, sNumDoc, abs(fValLanc),
                                            iGrupo, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         qryCcRD.Next;
      end;
      qryCcRD.Close;
      //----------------------------------------------------------------------------------
      result := True;
   except
      on E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que Contabiliza o Resultado da Alienação de um bem
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaResultadoBaixa(iModulo, iPessoa, iGrupo, iConjunto, iBem : Integer;
                                              dDataLanc : TDate; fValResult : Extended;
                                              sDesBem, sAtivProjeto : String;
                                              iSubConta : Integer; sPlaca : String;
                                              bMostraMsg : Boolean) : Boolean;
var
   iTipoMov, iPlanoConta               : Integer;
   fValLanc, fParticip1                : Extended;
   sDebito, sCredito,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre   : String;
   qryCcRD                             : TwwQuery;

begin
   try
      qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
      //----------------------------------------------------------------------------------
      if fValResult > 0 then
      begin
         iTipoMov := 30;
      end else
      begin
         iTipoMov := 31;
      end;
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a débito para o Resultado da Alienaçao
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMov,'D',iPlanoConta,sDebito);
      //----------------------------------------------------------------------------------
      if sDebito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Débito para o Lançamento do Resultado da Alienação no Grupo ' + sGrupo +
                                ' não cadastrada !');
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para o Resultado da Alienaçao
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMov,'C',iPlanoConta,sCredito);
      //----------------------------------------------------------------------------------
      if sCredito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Crédito para o Lançamento do Resultado da Alienação no Grupo ' + sGrupo +
                                ' não cadastrada !');
      end;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      sHistor    := 'Resultado de Alienacao de Bem';
      sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      fParticip1 := 0;
      //----------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         if fParticip1 < 100 then
         begin
            //----------------------------------------------------------------------------
            // Montagem da Partida Dobrada do Custo
            //----------------------------------------------------------------------------
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa a Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               fParticip1 := 100;
            //----------------------------------------------------------------------------
            fValLanc := (abs(fValResult) * fParticip1) / 100;
            //----------------------------------------------------------------------------
            if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                         sCcDeb, sCCCre ,sAtivProjeto,
                                         sDebito, sCredito, sNumDoc, abs(fValLanc),
                                         iGrupo, iPlanoConta, iSubConta,
                                         sNomeContaDeb, sObrigaSubContaDeb,
                                         sNomeContaCre, sObrigaSubContaCre,
                                         iBem, iPessoa, 0, bMostraMsg) then
               raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         qryCcRD.Next;
      end;
      qryCcRD.Close;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      on E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
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
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryUltMov.Prepared      then qryUltMov.Prepare;
         if not qryBem.Prepared         then qryBem.Prepare;
         if not qryReavaliacao.Prepared then qryReavaliacao.Prepare;
         if not qryAcrescimo.Prepared   then qryAcrescimo.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
      qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
      qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
      qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
      qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após a Baixa
      //----------------------------------------------------------------------------------
      qryUltMov.Close;
      qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
      qryUltMov.Open;
      if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
         raise Exception.Create('Existe movimentação após a Baixa. Consulte Movimentação!');
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
         raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
      //----------------------------------------------------------------------------------
      // Retorna o Tipo de Depreciação PróRata usado
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT HM.TIPDEPPRORATA '+
                         ' FROM HISTORICOMOVIMENTACAO HM'+
                         ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (HM.IDTIPOMOVIMENTACAO IN (06,25,24,26)) ';
      qryAux.Open;
      //----------------------------------------------------------------------------------
      // Estorna a Depreciacao PróRata
      //----------------------------------------------------------------------------------
      if qryAux.FieldByName('TIPDEPPRORATA').AsInteger = 0 then
      begin
         if EstornaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),dDataEst,bMostraMsg) < 0 then
            Raise Exception.Create(MensagemErro);
      end else
      begin
         if EstornaDepreciacao(iModulo,iEmpresaProp,iBem,dDataMov,dDataEst,bMostraMsg) < 0 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM após estorno da depreciação pró-rata
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na Tabela BEM
      //----------------------------------------------------------------------------------
      iPlnCodigo := 0;
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT HM.IDMOVIMENTACAO,HM.PLNCODIGO,HM.IDTIPOMOVIMENTACAO,'+
                         '        HM.VALOFI,HM.VALFIS,HM.VALGER,BB.PROPBAIXAR, HM.TIPDEPPRORATA '+
                         ' FROM HISTORICOMOVIMENTACAO HM, '+
                         '      BAIXABEM BB '+
                         ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (HM.IDTIPOMOVIMENTACAO IN (06,25,24,26)) ' +
                         '   AND (HM.IDMOVIMENTACAO = BB.IDMOVIMENTACAO(+))' ;
      qryAux.Open;
      //----------------------------------------------------------------------------------
      qryAux.First;
      while not qryAux.EOF do
      begin
         qryBem.Edit;
         case qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
            06 : begin
                    if not qryAux.FieldByName('PLNCODIGO').IsNull then
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
      iResult := 0;
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
                  Raise Exception.Create('Estorno da Planilha Contábil não foi permitido!');
            end else
            begin
               //-------------------------------------------------------------------------
               with dtmAtivoFixo.qryParamCaf do
               begin
                  Close;
                  ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                  Open;
                  //----------------------------------------------------------------------
                  iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                        FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                        Sistema.IdUsuario, True, 0, sMascara);
               end;
               if iResult = -1 then
                  Raise Exception.Create('Remoção da Planilha Contábil não foi permitida!');
            end;
         end else
         begin
            Raise Exception.Create(MensagemErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         //-------------------------------------------------------------------------------
         // Remove o Registro da Movimentacao
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF '+
                            ' FROM HISTORICOMOVIMENTACAO'+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (06,25,24,26,20,28,27,29,37,38,39,40))';
         qryAux.Open;
         if qryAux.RecordCount <= 0 then
            Raise Exception.Create('Não foi possível estornar a baixa do Bem ' +
                                   trim(qryBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(qryBem.FieldByName('PLACA').AsFloat));
         //-------------------------------------------------------------------------------
         while not qryAux.Eof do
         begin
            if qryAux.FieldByName('NCAF').AsInteger = 0 then
            begin
               qryLegRemValMov.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryLegRemValMov.ExecSQL;
            end;
            //----------------------------------------------------------------------------
            if qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 06 then
            begin
               qryEstornaBaixaBem.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryEstornaBaixaBem.ExecSQL;
               if qryEstornaBaixaBem.RowsAffected <= 0 then
                  Raise Exception.Create('Não foi possível remover a baixa do Bem ' +
                                         trim(qryBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(qryBem.FieldByName('PLACA').AsFloat) + ' do SubTipo do Histórico!');
            end;                             
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
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover a baixa do Bem ' +
                   trim(qryBem.FieldByName('DESBEM').AsString) + ' - ' +
                   floattostr(qryBem.FieldByName('PLACA').AsFloat) + ' do Histórico!');
      end;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,
                                    (dDataMov - 1),0,0,0,0,0,0,0,0,0,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Estorno da Baixa do Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      Result := iResult;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
function tAtivoFixo.ExecutaEntradaTotal(iModulo,iEmpresaProp,iBem : Integer;
                                        dDataIniDep : tDateTime; fValor : Extended;
                                        iCodSubConta, iAtivProjeto : Integer;
                                        bMostraMsg : boolean) : Integer;

var
   iExercicio,iPeriodo,
   iSeqHist, iPlanilha,
   iAux, iSubConta                                   : Integer;
   sAtivProjeto, sDescBem, sRegistro,
   sMensagem                                         : String;
   fValFis, fValGer,fValOrg                          : Extended;
   bTransacao                                        : Boolean;
   qryBem, qryAux                                    : TwwQuery;

begin
   bTransacao := False;
   try
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryBem.Prepared then qryBem.Prepare;
         if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
      end;
      qryBem := TwwQuery(dtmAtivoFixo.qryBem);
      qryAux := TwwQuery(dtmAtivoFixo.qryAux);
      //----------------------------------------------------------------------------------
      // Valida os parâmetros obrigatórios
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.isEmpty then
         raise Exception.Create('Códigos da EMPRESA PROPRIETÁRIA e/ou do BEM inválidos ou não cadastrados!');
      //----------------------------------------------------------------------------------
      if iModulo <= 0 then
         raise Exception.Create('É obrigatório fornecer o código do MODULO!')
      else
         if (iModulo <> 7) and (iModulo <> qryBem.FieldByName('IDMODULO').asInteger) then
            raise Exception.Create('Somente o módulo que cadastrou o bem pode movimenta-lo!');
      //----------------------------------------------------------------------------------
      if qryBem.FieldByName('CONTROLE').asString = 'T' then
         raise Exception.Create('O bem já está em CONTROLE TOTAL!');
      //----------------------------------------------------------------------------------
      sDescBem  := qryBem.FieldByName('DESBEM').asString;
      sRegistro := qryBem.FieldByName('REGISTRO').asString;
      //----------------------------------------------------------------------------------
      if fValor <= 0 then
      begin
         if qryBem.FieldByName('VALORG').asFloat <> 0 then
         begin
            fValOrg := qryBem.FieldByName('VALORG').asFloat;
         end else
         begin
            raise Exception.Create('É obrigatório fornecer o VALOR DE AQUISIÇÃO do bem!');
         end;
      end else
      begin
         fValOrg := fValor;
      end;
      //----------------------------------------------------------------------------------
      if dDataIniDep <= 0 then
         raise Exception.Create('É obrigatório fornecer a DATA de INICIO da DEPRECIAÇÃO!');
      //----------------------------------------------------------------------------------
      if iCodSubConta <= 0 then
      begin
         if not qryBem.FieldByName('CODSUBCONTA').IsNull then
         begin
            iSubConta := qryBem.FieldByName('CODSUBCONTA').AsInteger;
         end else
         begin
            iSubConta := -1;
         end;
      end else
      begin
         iSubConta := iCodSubConta;
      end;
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
         fValFis := fValOrg / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                            dDataIniDep, bMostraMsg);
         fValGer := fValOrg / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                            dDataIniDep, bMostraMsg);
      end;
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      iPlanilha := 0;
      if IntegraContab(iEmpresaProp) then
      begin
         if not VerificaPeriodoContabil(iEmpresaProp,dDataIniDep,iExercicio,iPeriodo,
                                        sMensagem,bMostraMsg) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if iAtivProjeto <= 0 then
         begin
            if qryBem.FieldByName('UNIDNEGOC').IsNull then
            begin
               with dtmAtivoFixo.qryParamCaf do
               begin
                  Close;
                  ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
                  Open;
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
            if not qryMontaCtb.Prepared then qryMontaCtb.Prepare;
            if not qryGrupoCtb.Prepared then qryGrupoCtb.Prepare;
            if not qryConta.Prepared then qryConta.Prepare;
            if not qryCCrd.Prepared then qryCCrd.Prepare;
            if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
            if not qryHistCtb.Prepared then qryHistCtb.Prepare;
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
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                               dDataIniDep, sMensagem, bMostraMsg);
         if iPlanilha < 0 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Registra a Entrada do Bem
      //----------------------------------------------------------------------------------
      if not RegistraEntradaTotal(iEmpresaProp,iBem,dDataIniDep,fValOrg,fValFis,fValGer,
                                  iSubConta,iAtivProjeto,bMostraMsg) then
         Raise Exception.Create(MensagemErro);
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
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 01, dDataIniDep, -1,
                                       fValOrg, fValFis, fValGer,
                                       -1,-1,-1,-1,-1,-1,iPlanilha,-1,-1,-1,'',0,bMostraMsg);
      if iSeqHist = -1 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo,iEmpresaProp,iBem,
                                    dDataIniDep,
                                    fValOrg,0,0,0,
                                    0,0,0,0,
                                    0,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 0) then
         Raise Exception.Create('ControleTotal : AtualizaSaldoContabBem');
      //----------------------------------------------------------------------------------
      // Registro do Evento na Tabela LOGOPCAO
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Bem transferido para Controle Total') then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iPlanilha;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
      On E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
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
         bFlgBemIntContab : Boolean; dDtaContab : tDateTime;
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
   if iQuantidade <= 0 then
   begin
      MensagemErro := 'É obrigatório fornecer a quantidade de bens!';
      Result := False;
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
   fpValHist        := strtofloat(FormatFloat('#0.00',((fpValHist        * 100) / 100)));
   fpValIniDep      := strtofloat(FormatFloat('#0.00',((fpValIniDep      * 100) / 100)));
   fpValOrg         := strtofloat(FormatFloat('#0.00',((fpValOrg         * 100) / 100)));
   fpCmBem          := strtofloat(FormatFloat('#0.00',((fpCmBem          * 100) / 100)));
   fpDepLanc        := strtofloat(FormatFloat('#0.00',((fpDepLanc        * 100) / 100)));
   fpCmDep          := strtofloat(FormatFloat('#0.00',((fpCmDep          * 100) / 100)));
   fpReavValOrg     := strtofloat(FormatFloat('#0.00',((fpReavValOrg     * 100) / 100)));
   fpReavCmBem      := strtofloat(FormatFloat('#0.00',((fpReavCmBem      * 100) / 100)));
   fpReavDepLanc    := strtofloat(FormatFloat('#0.00',((fpReavDepLanc    * 100) / 100)));
   fpReavCmDep      := strtofloat(FormatFloat('#0.00',((fpReavCmDep      * 100) / 100)));
   fpUltReavValOrg  := strtofloat(FormatFloat('#0.00',((fpUltReavValOrg  * 100) / 100)));
   fpUltReavCmBem   := strtofloat(FormatFloat('#0.00',((fpUltReavCmBem   * 100) / 100)));
   fpUltReavDepLanc := strtofloat(FormatFloat('#0.00',((fpUltReavDepLanc * 100) / 100)));
   fpUltReavCmDep   := strtofloat(FormatFloat('#0.00',((fpUltReavCmDep   * 100) / 100)));
   //-------------------------------------------------------------------------------------
   bTransacao := False;
   try
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      iPlanilha := 0;
      iQtd := 1;
      while iQtd <= iQuantidade do
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
                   bFlgBemIntContab, dDtaContab, iPlanilha, bMostraMsg);
         //-------------------------------------------------------------------------------
         if (iIdBem <= 0) or (iPlanilha < 0) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         iQtd := iQtd + 1;
         //-------------------------------------------------------------------------------
         if iQtd <= iQuantidade then
            if sPlaca <> '' then
               fPlacaAtual := GeraProxPlacaTomb(iEmpresaProp, iGrupo, iClasseBem, fPlacaAtual);
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := True;
   except
      On E : Exception do
      begin
         if bTransacao then
            RollBackTransacao;
         Result := False;
         MensagemErro := E.Message;
      end;
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
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      if not dtmAtivoFixo.qryBem.Prepared then dtmAtivoFixo.qryBem.Prepare;
      //----------------------------------------------------------------------------------
      qryAux := TwwQuery(dtmAtivoFixo.qryAux);
      //----------------------------------------------------------------------------------
      // Posiciona a tabela BEM
      //----------------------------------------------------------------------------------
      dtmAtivoFixo.qryBem.Close;
      dtmAtivoFixo.qryBem.ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
      dtmAtivoFixo.qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      dtmAtivoFixo.qryBem.Open;
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após sua entrada
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                         ' FROM   HISTORICOMOVIMENTACAO ' +
                         ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (IDTIPOMOVIMENTACAO <> 01)  /* ENTRADA TOTAL                                      */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 03)  /* ENTRADA FISICA                                     */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 17)  /* INCLUSAO DE DEPRECIACAO                            */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 15)  /* CORRECAO MONETARIA                                 */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 21)  /* CORRECAO MONETARIA DA DEPRECIACAO                  */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 32)  /* INCLUSAO DO SALDO DE REAVALIACAO                   */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 33)  /* INCLUSAO DA DEPRECIACAO DO SALDO DE REAVALIACAO    */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 22)  /* CORRECAO MONETARIA DA REAVALIACAO                  */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 19)  /* CORRECAO MONETARIA DA DEPRECIACAO DA REAVALIACAO   */';
      qryAux.Open;
      if not qryAux.IsEmpty then
         Raise Exception.Create('Existe movimentação após a Entrada. Consulte Movimentação!');
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if (IntegraContab(iEmpresaProp) and (bFlgContab)) or
         (dtmAtivoFixo.qryBem.FieldByName('FLGBEMINTCONTAB').AsInteger = 1) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
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
                  if iResult = -1 then
                     raise Exception.Create('Estorno da Planilha Contábil não foi permitido!');
               end else
               begin
                  with dtmAtivoFixo.qryParamCaf do
                  begin
                     Close;
                     ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                     Open;
                     //-------------------------------------------------------------------
                     iResult := ExcluiLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                                           inttostr(Sistema.IdModulo),
                                           FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                           Sistema.IdUsuario, True, 0, sMascara);
                  end;
                  //----------------------------------------------------------------------
                  if iResult = -1 then
                     raise Exception.Create('Remoção da Planilha Contábil não foi permitida!');
               end;
               iPlan := iPlan + 1;
            end;
         end else
            raise Exception.Create(MensagemErro);
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
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover o lançamento de entrada do histórico!');
         //-------------------------------------------------------------------------------
         // Remove os Registros de Saldos Contábeis do Bem
         //-------------------------------------------------------------------------------
         qryAux.SQL.Text := ' DELETE FROM SALDOCONTABBEM ' +
                            ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         qryAux.ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover o lançamento de saldo contábil inicial!');
         //-------------------------------------------------------------------------------
         // Remove o Bem
         //-------------------------------------------------------------------------------
         qryEstornaBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qryEstornaBem.ParamByName('PIDBEM').AsInteger    := iBem;
         qryEstornaBem.ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover o lançamento de entrada no cadastro!');
      end;
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Estorno da Entrada do Bem ' + dtmAtivoFixo.qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      Result := 1;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryUltMov.Prepared    then qryUltMov.Prepare;
         if not qryBem.Prepared       then qryBem.Prepare;
         if not qryAcrescimo.Prepared then qryAcrescimo.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryBem       := TwwQuery(dtmAtivoFixo.qryBem);
      qryAcrescimo := TwwQuery(dtmAtivoFixo.qryAcrescimo);
      qryUltMov    := TwwQuery(dtmAtivoFixo.qryUltMov);
      qryAux       := TwwQuery(dtmAtivoFixo.qryAux);
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após o Acréscimo
      //----------------------------------------------------------------------------------
      qryUltMov.Close;
      qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
      qryUltMov.Open;
      if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
         raise Exception.Create('Existe movimentação após o acréscimo. Consulte Movimentação!');
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
         raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      if qryAcrescimo.IsEmpty then
         raise Exception.Create('Não existe acréscimo de valor registrado para esse Bem!');
      //----------------------------------------------------------------------------------
      if not qryAcrescimo.Locate('IDACRESCIMO',iAcrescimo,[]) then
         raise Exception.Create('Código de movimentação de acréscimo de valor inválido para esse Bem!');
      //----------------------------------------------------------------------------------
      iIdMovimentacao := qryAcrescimo.FieldByName('IDMOVIMENTACAO').AsInteger;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT PLNCODIGO'+
                         ' FROM HISTORICOMOVIMENTACAO '+
                         ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (IDTIPOMOVIMENTACAO = 09)' +
                         '   AND (IDMOVIMENTACAO = ' + inttostr(iIdMovimentacao) + ')';
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
                         '                            AND (IDTIPOMOVIMENTACAO = 09)' +
                         '                            AND (IDMOVIMENTACAO = ' + inttostr(iIdMovimentacao) + '))';
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
                  raise Exception.Create('Estorno da Planilha Contábil não foi permitido!');
            end else
            begin
               //-------------------------------------------------------------------------
               with dtmAtivoFixo.qryParamCaf do
               begin
                  Close;
                  ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                  Open;
                  //----------------------------------------------------------------------
                  iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                        FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                        Sistema.IdUsuario, True, 0, sMascara);
               end;
               if iResult = -1 then
                  raise Exception.Create('Remoção da Planilha Contabil não foi permitida!');
            end;
         end else
         begin
            raise Exception.Create(MensagemErro);
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
         if qryEstornaAcrescimo.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover o lançamento de acréscimo no cadastro!');
         //-------------------------------------------------------------------------------
         // Remove o Registro da Movimentacao
         //-------------------------------------------------------------------------------
         qryEstornaAcrescValor.ParamByName('PIDMOVIMENTACAO').AsInteger := iIdMovimentacao;
         qryEstornaAcrescValor.ExecSQL;
         if qryEstornaAcrescValor.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover o lançamento de acréscimo no histórico!(1)');
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDMOVIMENTACAO = ' + inttostr(iIdMovimentacao) + ')';
         qryAux.ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover o lançamento de acréscimo no histórico!(2)');
      end;
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Estorno do Acrescimo de Valor no Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,
                                    (dDataMov - 1),0,0,0,0,0,0,0,0,0,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      Result := 1;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
         bFlgBemIntContab : Boolean; dDtaContab : tDateTime;
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
   bTransacao := False;
   try
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryBem.Prepared                  then qryBem.Prepare;
         if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
         if not qryGrupos.Prepared               then qryGrupos.Prepare;
         if not qryConjunto.Prepared             then qryConjunto.Prepare;
         if not qryPessoa.Prepared               then qryPessoa.Prepare;
         if not qryClasseBem.Prepared            then qryClasseBem.Prepare;
         if not qrySubConta.Prepared             then qrySubConta.Prepare;
         if not qrySituacao.Prepared             then qrySituacao.Prepare;
      end;
      //----------------------------------------------------------------------------------
      // Valida os parâmetros obrigatórios para entrada de bens
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if sRegistro = '' then
            Raise Exception.Create('É obrigatório fornecer o Código de Registro do bem!')
         else
            if not ((sRegistro = 'I') or (sRegistro = 'O')) then
               Raise Exception.Create('Código de Registro do Bem inválido!');
         if sRegistro = 'O' then
            sControle := 'F';
         //-------------------------------------------------------------------------------
         if sControle = '' then
            Raise Exception.Create('É obrigatório fornecer o Código de Controle do bem!')
         else
            if not ((sControle = 'T') or (sControle = 'F')) then
               Raise Exception.Create('Código de Controle do bem inválido!');
         //-------------------------------------------------------------------------------
         if iModulo <= 0 then
            Raise Exception.Create('É obrigatório fornecer o código do MODULO!');
         //-------------------------------------------------------------------------------
         if iEmpresaProp <= 0 then
            Raise Exception.Create('É obrigatório fornecer o código da EMPRESA PROPRIETÁRIA!')
         else begin
            qryPessoa.Close;
            qryPessoa.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryPessoa.Open;
            if qryPessoa.isEmpty then
               Raise Exception.Create('Código da EMPRESA PROPRIETÁRIA inválido ou não cadastrado!');
         end;
         //-------------------------------------------------------------------------------
         if iConjunto <= 0 then
            Raise Exception.Create('É obrigatório fornecer o código do CONJUNTO do bem!')
         else begin
            qryConjunto.Close;
            qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
            qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
            qryConjunto.Open;
            if qryConjunto.isEmpty then
               Raise Exception.Create('Código do CONJUNTO do bem inexistente ou inválido!');
         end;
         //-------------------------------------------------------------------------------
         if iGrupo <= 0 then
            Raise Exception.Create('É obrigatório fornecer o código do GRUPO do bem!')
         else begin
            qryGrupos.Close;
            qryGrupos.ParamByName('PIDGRUPO').AsInteger := iGrupo;
            qryGrupos.Open;
            if qryGrupos.isEmpty then
               Raise Exception.Create('É obrigatório fornecer o código do GRUPO do bem!');
         end;
         //-------------------------------------------------------------------------------
         if iClasseBem <= 0 then
            Raise Exception.Create('É obrigatório fornecer o código da CLASSE do bem!')
         else begin
            qryClasseBem.Close;
            qryClasseBem.ParamByName('PIDCLASSEBEM').AsInteger := iClasseBem;
            qryClasseBem.Open;
            if qryClasseBem.isEmpty then
               Raise Exception.Create('Código de CLASSE de bem inexistente ou inválido!');
         end;
         //-------------------------------------------------------------------------------
         if iSubConta > 0 then
         begin
            qrySubConta.Close;
            qrySubConta.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
            qrySubConta.ParamByName('PIDSUBCONTA').AsInteger := iSubConta;
            qrySubConta.Open;
            if qrySubConta.isEmpty then
               Raise Exception.Create('Código de SubConta inexistente ou inválido!');
         end;
         //-------------------------------------------------------------------------------
         if iFornec > 0 then
         begin
            qryPessoa.Close;
            qryPessoa.ParamByName('PIDPESSOA').AsInteger := iFornec;
            qryPessoa.Open;
            if qryPessoa.isEmpty then
               Raise Exception.Create('Código do FORNECEDOR inválido ou não cadastrado!');
         end;
         //-------------------------------------------------------------------------------
         if fPlaca <= 0 then
         begin
            if qryGrupos.FieldByName('FLGSEMPLACA').AsInteger = 0 then
               Raise Exception.Create('É obrigatório fornecer o Número de TOMBAMENTO do bem!');
         end else
         begin
            if VerificaPlaca(fPlaca,bMostraMsg) > 0 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         if iSituacao <= 0 then
            Raise Exception.Create('É obrigatório fornecer a ID da SITUAÇÃO do bem!')
         else begin
            qrySituacao.Close;
            qrySituacao.ParamByName('PIDSITUACAO').AsInteger := iSituacao;
            qrySituacao.Open;
            if qrySituacao.isEmpty then
               Raise Exception.Create('ID da SITUAÇÃO do bem inválido ou inexistente!');
         end;
         //-------------------------------------------------------------------------------
         if sDescBem = '' then
            Raise Exception.Create('É obrigatório fornecer a DESCRIÇÃO do bem!');
         //-------------------------------------------------------------------------------
         if (fValOrg = 0) and (sControle = 'T') then
            Raise Exception.Create('O VALOR DE AQUISIÇÃO do bem está Zerado!');
         //-------------------------------------------------------------------------------
         sBaixaTotal := 'N';
         if fPropBaixa <> -1 then
         begin
            if (fPropBaixa < 0) or (fPropBaixa > 100) then
               Raise Exception.Create('Proporção da Baixa Inválida!');
         end else
         begin
            if fPropBaixa = 100 then
            begin
               sBaixaTotal := 'S';
            end;
         end;
         //-------------------------------------------------------------------------------
         if bFlgBemIntContab and (dDtaContab <= 0) then
            Raise Exception.Create('A data do registro do valor de entrada do bem na contabilidade deve ser informada!');
         //-------------------------------------------------------------------------------
         if ((fValIniDep + fCmDep) > (fValOrg + fCmBem)) then
            Raise Exception.Create('Valor da depreciação inicial não pode ser maior que valor do custo de aquisição !');
         //-------------------------------------------------------------------------------
         // Verificações relativas a reavaliação (se houver)
         //-------------------------------------------------------------------------------
         if ((fReavValOrg <> 0) or (fReavDepLanc <> 0)) and (dReavData <= 0) then
            Raise Exception.Create('A data da última reavaliação do bem deve ser fornecida!');
      end;
      //----------------------------------------------------------------------------------
      // Le a Unidade de Negocio da Tabela de Parametros Globais
      //----------------------------------------------------------------------------------
      if iAtivProjeto <= 0 then
      begin
         with dtmAtivoFixo.qryParamCAF do
         begin
            Close;
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
      //----------------------------------------------------------------------------------
      // Le os Parametros do CAF e calcula os valores nas moedas opcionais
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo.qryParamCAF do
      begin
         Close;
         ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         // Calcula os valores fornecidos em moeda fiscal e gerencial
         //-------------------------------------------------------------------------------
         fValFis := fValOrg / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                            dDataInclusao, bMostraMsg);
         fValGer := fValOrg / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                            dDataInclusao, bMostraMsg);
         fDepFis := fValIniDep / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                               dDataInclusao, bMostraMsg);
         fDepGer := fValIniDep / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                               dDataInclusao, bMostraMsg);
      end;
      //----------------------------------------------------------------------------------
      // Registra a Entrada do Bem
      //----------------------------------------------------------------------------------
      iIdBem := RegistraEntrada(iIdBemAlt,iModulo,iEmpresaProp,iConjunto,iTerceiro,iGrupo,iSubConta,
                iAtivProjeto,iClasseBem,iItensRecDev,iFornec,iImagem,fPlaca,iSituacao,
                sRegistro,sControle,sDescBem,sIdNota,sComplNota,sNumSerie,dDataNota,
                dDataInclusao,fValHist,fValOrg,fCmBem,dDataIniDep,fValIniDep,fTaxaDep,
                fDepLanc,fCmDep,fPropBaixa,fPrioridade,dDataInstalacao,dDataFimGar,fValFis,
                fValGer,fDepFis,fDepGer,sBaixaTotal,sIdOpcional,sProcessoAquis,
                sEmpenhoAquis,sPubAutor,sPubEditora,sPubAno,bFlgBemIntContab,dDtaContab,
                bMostraMsg);
      if iIdBem = -1 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Registra o Historico da Entrada do Bem
      //----------------------------------------------------------------------------------
      iaIdHistMov := 0;
      if sControle = 'T' then
      begin
         iTipoMovimentacao := 01;
      end else
      begin
         iTipoMovimentacao := 03;
      end;
      iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                       dDataInclusao, -1,
                                       fValOrg, fValFis, fValGer,
                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
      if iSeqHist = -1 then
         Raise Exception.Create(MensagemErro);
      inc(iaIdHistMov);
      aIdHistMov[iaIdHistMov] := iSeqHist;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Correção Monetaria Inicial do Bem
      //----------------------------------------------------------------------------------
      if fCmBem > 0 then
      begin
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 15,
                                          dDataInclusao, -1,
                                          fCmBem, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Depreciação Inicial do Bem
      //----------------------------------------------------------------------------------
      if fValIniDep > 0 then
      begin
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 17,
                                          dDataInclusao, -1,
                                          fValIniDep, fDepFis, fDepGer,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
      //----------------------------------------------------------------------------------
      if fCmDep > 0 then
      begin
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 21,
                                          dDataInclusao, -1,
                                          fCmDep, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
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
                                    iGrupo,
                                    dtmAtivoFixo.qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                    dtmAtivoFixo.qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger, 0) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) and bFlgBemIntContab and (sControle = 'T') then
      begin
         if not VerificaPeriodoContabil(iEmpresaProp,dDtaContab,iExercicio,iPeriodo,
                                        sMensagem,bMostraMsg) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
            if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
            if not qryConta.Prepared      then qryConta.Prepare;
            if not qryCCrd.Prepared       then qryCCrd.Prepare;
            if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
            if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
            if not qryMontaCtb.Active     then qryMontaCtb.Open;
         end;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaEntrada(iModulo,iEmpresaProp,iGrupo,iConjunto,iIdBem,
                                         dDtaContab,fValOrg,fValIniDep,fCmBem,fCmDep,
                                         sDescBem,sAtivProjeto,sRegistro,'E',iSubConta,
                                         floattostr(fPlaca),bMostraMsg);
         if iPlanilha <= 0 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                               dDtaContab, sMensagem, bMostraMsg);
         if iPlanilha < 0 then
            Raise Exception.Create(MensagemErro);
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
      if dReavData > 0 then
      begin
         iaIdHistMov := 0;
         with dtmAtivoFixo.qryParamCAF do
         begin
            //----------------------------------------------------------------------------
            // Calcula os valores fornecidos em moeda fiscal e gerencial
            //----------------------------------------------------------------------------
            fReavValFis := fReavValOrg / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                       dReavData, bMostraMsg);
            fReavValGer := fReavValOrg / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                       dReavData, bMostraMsg);
            fReavDepFis := fReavDepLanc / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                        dReavData, bMostraMsg);
            fReavDepGer := fReavDepLanc / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                        dReavData, bMostraMsg);
         end;
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 32,
                                          dReavData, -1,
                                          fReavValOrg, fReavValFis, fReavValGer,
                                          -1,-1,-1,-1,-1,-1,-1,-1,
                                          fTaxaDep,fReavValOrg,sReavObs,0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
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
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria Inicial da Reavaliação do Bem
         //-------------------------------------------------------------------------------
         if fReavCmBem <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 22,
                                             dReavData, -1,
                                             fReavCmBem, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,
                                             -1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação Inicial da Reavaliacao do Bem
         //-------------------------------------------------------------------------------
         if fReavDepLanc <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 33,
                                             dReavData, iIdReavaliacao,
                                             fReavDepLanc, fReavDepFis, fReavDepGer,
                                             dReavData,-1,-1,-1,-1,-1,-1,-1,
                                             -1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if fReavCmDep <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 19,
                                             dReavData, -1,
                                             fReavCmDep, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,
                                             -1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
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
                                       iGrupo,
                                       dtmAtivoFixo.qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                       dtmAtivoFixo.qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger, 0) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Lançamentos Contábeis
         //-------------------------------------------------------------------------------
         if IntegraContab(iEmpresaProp) and bFlgBemIntContab and (sControle = 'T') then
         begin
            with dtmAtivoFixo do
            begin
               if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
               if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
               if not qryConta.Prepared      then qryConta.Prepare;
               if not qryCCrd.Prepared       then qryCCrd.Prepare;
               if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
               if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
               if not qryMontaCtb.Active     then qryMontaCtb.Open;
            end;
            //----------------------------------------------------------------------------
            if not VerificaPeriodoContabil(iEmpresaProp, dDtaContab, iExercicio, iPeriodo,
                                           sMensagem,bMostraMsg) then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            iPlanResult := ContabilizaEntradaReav(iModulo,iEmpresaProp,iGrupo,iConjunto,
                                                  iIdBem,dDtaContab,fReavValOrg,fReavDepLanc,
                                                  fReavCmBem,fReavCmDep,sDescBem,sAtivProjeto,
                                                  sRegistro,'E','R',iSubConta,
                                                  floattostr(fPlaca), bMostraMsg);
            dtmAtivoFixo.qryMontaCtb.Close;
            if iPlanResult <= 0 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            iPlanResult := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                                    dDtaContab, sMensagem, bMostraMsg);
            if iPlanResult <= 0 then
               Raise Exception.Create(MensagemErro);
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
                                                       dUltReavData, bMostraMsg);
            fUltReavValGer := fUltReavValOrg / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                       dUltReavData, bMostraMsg);
            fUltReavDepFis := fUltReavDepLanc / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                        dUltReavData, bMostraMsg);
            fUltReavDepGer := fUltReavDepLanc / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                        dUltReavData, bMostraMsg);
         end;
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 32,
                                          dUltReavData, -1,
                                          fUltReavValOrg, fUltReavValFis,fUltReavValGer,
                                          -1,-1,-1,-1,-1,-1,-1,-1,
                                          fTaxaDep,fUltReavValOrg,sUltReavObs,0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
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
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria Inicial da Reavaliação do Bem
         //-------------------------------------------------------------------------------
         if fUltReavCmBem <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 22,
                                             dUltReavData, -1,
                                             fUltReavCmBem, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,
                                             -1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
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
                                             -1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
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
                                             -1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
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
                                       iGrupo,
                                       dtmAtivoFixo.qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                       dtmAtivoFixo.qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger, 0) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Lançamentos Contábeis
         //-------------------------------------------------------------------------------
         if IntegraContab(iEmpresaProp) and bFlgBemIntContab and (sControle = 'T') then
         begin
            if not VerificaPeriodoContabil(iEmpresaProp, dDtaContab, iExercicio, iPeriodo,
                                           sMensagem,bMostraMsg) then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            with dtmAtivoFixo do
            begin
               if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
               if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
               if not qryConta.Prepared      then qryConta.Prepare;
               if not qryCCrd.Prepared       then qryCCrd.Prepare;
               if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
               if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
               if not qryMontaCtb.Active     then qryMontaCtb.Open;
            end;
            //----------------------------------------------------------------------------
            iPlanResult := ContabilizaEntradaReav(iModulo,iEmpresaProp,iGrupo,iConjunto,
                                                  iIdBem,dDtaContab,fUltReavValOrg,fUltReavDepLanc,
                                                  fUltReavCmBem,fUltReavCmDep,sDescBem,sAtivProjeto,
                                                  sRegistro,'E','R',iSubConta,floattostr(fPlaca),
                                                  bMostraMsg);
            dtmAtivoFixo.qryMontaCtb.Close;
            if iPlanResult <= 0 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            iPlanResult := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                                    dDtaContab, sMensagem, bMostraMsg);
            if iPlanResult <= 0 then
               Raise Exception.Create(MensagemErro);
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
      // Registro do Evento na Tabela LOGOPCAO
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Entrada de Bem') then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iIdBem;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
         sPubAno : String; bFlgBemIntContab : Boolean; dDtaContab : tDateTime;
         bMostraMsg : boolean) : Integer;

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
         ParamByName('PDESBEM').asString          := sDescBem;            // DESBEM
         ParamByName('PDTAINCLUSAO').asDateTime   := dDataInclusao;       // DTAINCLUSAO
         ParamByName('PVALHISTORICO').asCurrency  := fValHist;            // VALHISTORICO
         ParamByName('PVALORG').asCurrency        := fValOrg;             // VALORG
         ParamByName('PDATAINICIODEP').asDateTime := dDataIniDep;         // DATAINICIODEP
         ParamByName('PTAXADEP').asFloat          := fTaxaDep;            // TAXADEP
         ParamByName('PDATAULTDEP').asDateTime    := dDataIniDep;         // DATAULTDEP
         ParamByName('PIDOPCIONAL').asString      := sIdOpcional;         // IDOPCIONAL
         //-------------------------------------------------------------------------------
         ParamByName('PPLACA').asFloat            := fPlaca;              // PLACA
         if fPlaca <= 0 then ParamByName('PPLACA').Clear;
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
         if bFlgBemIntContab then
            ParamByName('PFLGBEMINTCONTAB').asInteger := 1
         else
            ParamByName('PFLGBEMINTCONTAB').asInteger := 0;
         //-------------------------------------------------------------------------------
         ParamByName('PDTACONTAB').asDateTime         := dDtaContab;
         if dDtaContab <= 0 then ParamByName('PDTACONTAB').Clear;
         //-------------------------------------------------------------------------------
         ExecSQL;
      end;
      Result := iIdBem;
   //-------------------------------------------------------------------------------------
   except
      On E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que Contabiliza a Entrada do Bem
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaEntrada(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                       dDataLanc : TDate;
                                       fValOrg,fValIniDep,fCmBem,fCmDep : Double;
                                       sDesBem,sAtivProjeto,sRegistro,sTipoMov : String;
                                       iSubConta : Integer; sPlaca : String;
                                       bMostraMsg : Boolean) : Integer;
var
   iTipoMov1, iTipoMov2, iTipoMov3,
   iTipoMov4, iPlanoConta              : Integer;
   fValLanc, fParticip1, fParticip2,
   fParticip3, fParticip4              : Extended;
   sMensErro, sDebito, sCredito,
   sDebitoCM, sCreditoCM,
   sDebitoD, sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre   : String;
   qryCcRD                             : TwwQuery;

begin
   try
      qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
      //----------------------------------------------------------------------------------
      if sRegistro = 'I' then
      begin
         iTipoMov1 := 01;
         sMensErro := ' ';
      end else
      begin
         iTipoMov1 := 03;
         sMensErro := ' ';
      end;
      iTipoMov2 := 15;
      iTipoMov3 := 14;
      iTipoMov4 := 21;
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Entrada do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMov1,'D',iPlanoConta,sDebito);
      //----------------------------------------------------------------------------------
      if sDebito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Débito para o Movimento de Entrada no Grupo ' + sGrupo +
                                ' não cadastrada !'+sMensErro);
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Entrada do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMov1,'C',iPlanoConta,sCredito);
      //----------------------------------------------------------------------------------
      if sCredito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a crédito para o Movimento de Entrada no Grupo ' + sGrupo +
                                ' não cadastrada !'+sMensErro);
      end;
      //----------------------------------------------------------------------------------
      if fCmBem <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Correção Monetária Inicial do Bem
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov2,'D',iPlanoConta,sDebitoCM);
         //-------------------------------------------------------------------------------
         if sDebitoCM = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Débito para o Movimento de Correção Monetária no Grupo '
                                   + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Correção Monetária Inicial do Bem
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov2,'C',iPlanoConta,sCreditoCM);
         //-------------------------------------------------------------------------------
         if sCreditoCM = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a crédito para o Movimento de Correção Monetária no Grupo '
                                   + sGrupo + ' não cadastrada !');
         end;
      end;
      //----------------------------------------------------------------------------------
      if fValIniDep <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Entrada da Depreciação Inicial
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov3,'D',iPlanoConta,sDebitoD);
         //-------------------------------------------------------------------------------
         if sDebitoD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Débito para o Movimento de Depreciação Inicial no Grupo ' +
                                   sGrupo + ' não cadastrada !' + sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Entrada da Depreciação Inicial
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov3,'C',iPlanoConta,sCreditoD);
         //-------------------------------------------------------------------------------
         if sCreditoD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a crédito para o Movimento de Depreciação Inicial no Grupo ' +
                                   sGrupo + ' não cadastrada !' + sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      if fCmDep <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Correção Monetária da Depreciacao Inicial
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov4,'D',iPlanoConta,sDebitoCMD);
         //-------------------------------------------------------------------------------
         if sDebitoCMD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Débito para o Movimento de Correção Monetária da ' +
                                   'Depreciação no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Correção Monetária da Depreciacao Inicial
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov4,'C',iPlanoConta,sCreditoCMD);
         //-------------------------------------------------------------------------------
         if sCreditoCMD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Crédito para o Movimento de Correção Monetária da ' +
                                   'Depreciação no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      if sTipoMov = 'E' then
      begin
         sHistor := 'Entrada de Bem ';
      end else
      if sTipoMov = 'O' then
      begin
         sHistor := 'Encerramento de Obra';
      end else
      begin
         sHistor := ' ';
      end;
      fParticip1 := 0;
      fParticip2 := 0;
      fParticip3 := 0;
      fParticip4 := 0;
      sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      //----------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         if fParticip1 < 100 then
         begin
            //----------------------------------------------------------------------------
            // Montagem da Partida Dobrada do Custo
            //----------------------------------------------------------------------------
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa a Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               fParticip1 := 100;
            //----------------------------------------------------------------------------
            fValLanc := (fValOrg * fParticip1) / 100;
            //----------------------------------------------------------------------------
            if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                         sCcDeb, sCCCre ,sAtivProjeto,
                                         sDebito, sCredito, sNumDoc, abs(fValLanc),
                                         iGrupo, iPlanoConta, iSubConta,
                                         sNomeContaDeb, sObrigaSubContaDeb,
                                         sNomeContaCre, sObrigaSubContaCre,
                                         iBem, iPessoa, 0, bMostraMsg) then
            begin
               raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if fCmBem <> 0 then
         begin
            if fParticip2 < 100 then
            begin
               if sTipoMov <> 'T' then
               begin
                  sHistor := 'Correção Monetária Inicial do Bem ';
               end else
               begin
                  sHistor := 'Transferência (Entrada de Bem)';
               end;
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada da Correção Monetária do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Pesquisa a Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCM,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCM,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  fParticip2 := 100;
               //-------------------------------------------------------------------------
               fValLanc := (fCmBem * fParticip2) / 100;
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCcDeb, sCCCre ,sAtivProjeto,
                                            sDebitoCM, sCreditoCM, sNumDoc, abs(fValLanc),
                                            iGrupo, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if fValIniDep <> 0 then
         begin
            if fParticip3 < 100 then
            begin
               if sTipoMov <> 'T' then
               begin
                  sHistor := 'Depreciacao Inicial do Bem ';
               end else
               begin
                  sHistor := 'Transferência (Entrada de Bem)';
               end;
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada da Depreciacao do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Pesquisa a Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoD,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip3 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoD,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip3 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  fParticip3 := 100;
               //-------------------------------------------------------------------------
               fValLanc := (fValIniDep * fParticip3) / 100;
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCcDeb, sCCCre ,sAtivProjeto,
                                            sDebitoD, sCreditoD, sNumDoc, abs(fValLanc),
                                            iGrupo, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro)
            end;
         end;
         //-------------------------------------------------------------------------------
         if fCmDep <> 0 then
         begin
            if fParticip4 < 100 then
            begin
               if sTipoMov <> 'T' then
               begin
                  sHistor := 'Correção Monetária Inicial da Depreciação do Bem ';
               end else
               begin
                  sHistor := 'Transferência (Entrada de Bem)';
               end;
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada da Correção Monetária da Depreciacao
               // do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Pesquisa a Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCMD,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip4 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoD,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip4 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  fParticip4 := 100;
               //-------------------------------------------------------------------------
               fValLanc := (fCmDep * fParticip4) / 100;
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                            sCcDeb, sCCCre ,sAtivProjeto,
                                            sDebitoCMD, sCreditoCMD, sNumDoc, abs(fValLanc),
                                            iGrupo, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         qryCcRD.Next;
      end;
      qryCcRD.Close;
      //----------------------------------------------------------------------------------
      result := 1;
   except
      on E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que Contabiliza o Saldo de Reavaliacao na Entrada de um Bem
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaEntradaReav(iModulo,iPessoa,iGrupo,iConjunto,iBem : Integer;
                                           dDataLanc : TDate;
                                           fValOrg,fDepLanc,fCmBem,fCmDep : Extended;
                                           sDesBem,sAtivProjeto,sRegistro,
                                           sTipoMov, sTipoTab : String;
                                           iSubConta : Integer; sPlaca : String;
                                           bMostraMsg : Boolean) : Integer;
var
   iTipoMov1, iTipoMov2, iTipoMov3,
   iTipoMov4, iPlanoConta              : Integer;
   fValLanc, fParticip1, fParticip2,
   fParticip3, fParticip4              : Extended;
   sMensErro, sDebito, sCredito,
   sDebitoCM, sCreditoCM,
   sDebitoD, sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre   : String;
   qryCcRD                             : TwwQuery;

begin
   try
      qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
      //----------------------------------------------------------------------------------
      if sTipoTab = 'R' then
      begin
         iTipoMov1 := 32;
         iTipoMov2 := 22;
         iTipoMov3 := 33;
         iTipoMov4 := 19;
         sMensErro := '(Reavaliação)';
      end else
      begin
         iTipoMov1 := 09;
         iTipoMov2 := 34;
         iTipoMov3 := 35;
         iTipoMov4 := 36;
         sMensErro := '(Acréscimo de Valor)';
      end;
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Entrada do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMov1,'D',iPlanoConta,sDebito);
      //----------------------------------------------------------------------------------
      if sDebito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Débito para o Movimento de Entrada no Grupo ' + sGrupo +
                                ' não cadastrada !'+sMensErro);
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Entrada do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMov1,'C',iPlanoConta,sCredito);
      //----------------------------------------------------------------------------------
      if sCredito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a crédito para o Movimento de Entrada no Grupo ' + sGrupo +
                                ' não cadastrada !'+sMensErro);
      end;
      //----------------------------------------------------------------------------------
      if fCmBem <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Correção Monetária Inicial do Bem
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov2,'D',iPlanoConta,sDebitoCM);
         //-------------------------------------------------------------------------------
         if sDebitoCM = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Débito para o Movimento de Correção Monetária no Grupo '
                                   + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Correção Monetária Inicial do Bem
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov2,'C',iPlanoConta,sCreditoCM);
         //-------------------------------------------------------------------------------
         if sCreditoCM = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a crédito para o Movimento de Correção Monetária no Grupo '
                                   + sGrupo + ' não cadastrada !');
         end;
      end;
      //----------------------------------------------------------------------------------
      if fDepLanc <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Entrada da Depreciação Inicial
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov3,'D',iPlanoConta,sDebitoD);
         //-------------------------------------------------------------------------------
         if sDebitoD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Débito para o Movimento de Depreciação Inicial no Grupo ' +
                                   sGrupo + ' não cadastrada !' + sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Entrada da Depreciação Inicial
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov3,'C',iPlanoConta,sCreditoD);
         //-------------------------------------------------------------------------------
         if sCreditoD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a crédito para o Movimento de Depreciação Inicial no Grupo ' +
                                   sGrupo + ' não cadastrada !' + sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      if fCmDep <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Correção Monetária da Depreciacao Inicial
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov4,'D',iPlanoConta,sDebitoCMD);
         //-------------------------------------------------------------------------------
         if sDebitoCMD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Débito para o Movimento de Correção Monetária da ' +
                                   'Depreciação no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Correção Monetária da Depreciacao Inicial
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov4,'C',iPlanoConta,sCreditoCMD);
         //-------------------------------------------------------------------------------
         if sCreditoCMD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupo);
            raise Exception.Create('Conta a Crédito para o Movimento de Correção Monetária da ' +
                                   'Depreciação no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      fParticip1 := 0;
      fParticip2 := 0;
      fParticip3 := 0;
      fParticip4 := 0;
      sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      //----------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         if fParticip1 < 100 then
         begin
            //----------------------------------------------------------------------------
            // Montagem da Partida Dobrada do Custo
            //----------------------------------------------------------------------------
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa a Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               fParticip1 := 100;
            //----------------------------------------------------------------------------
            fValLanc := (fValOrg * fParticip1) / 100;
            //----------------------------------------------------------------------------
            sHistor := 'Entrada de Saldo de Reavaliacao ';
            if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                         sCcDeb, sCCCre ,sAtivProjeto,
                                         sDebito, sCredito, sNumDoc, abs(fValLanc),
                                         iGrupo, iPlanoConta, iSubConta,
                                         sNomeContaDeb, sObrigaSubContaDeb,
                                         sNomeContaCre, sObrigaSubContaCre,
                                         iBem, iPessoa, 0, bMostraMsg) then
               raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         if fCmBem <> 0 then
         begin
            if fParticip2 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada da Correção Monetária do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Pesquisa a Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCM,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCM,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  fParticip2 := 100;
               //-------------------------------------------------------------------------
               fValLanc := (fCmBem * fParticip2) / 100;
               //-------------------------------------------------------------------------
               sHistor := 'Correcao Monetaria Inicial do Saldo de Reavaliacao';
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCcDeb, sCCCre ,sAtivProjeto,
                                            sDebitoCM, sCreditoCM, sNumDoc, abs(fValLanc),
                                            iGrupo, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if fDepLanc <> 0 then
         begin
            if fParticip3 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada da Depreciacao do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Pesquisa a Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoD,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip3 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoD,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip3 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  fParticip3 := 100;
               //-------------------------------------------------------------------------
               fValLanc := (fDepLanc * fParticip3) / 100;
               //-------------------------------------------------------------------------
               sHistor := 'Depreciacao Inicial do Saldo de Reavaliacao';
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCcDeb, sCCCre ,sAtivProjeto,
                                            sDebitoD, sCreditoD, sNumDoc, abs(fValLanc),
                                            iGrupo, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro)
            end;
         end;
         //-------------------------------------------------------------------------------
         if fCmDep <> 0 then
         begin
            if fParticip4 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada da Correção Monetária da Depreciacao
               // do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Pesquisa a Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCMD,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip4 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoD,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     fParticip4 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  fParticip4 := 100;
               //-------------------------------------------------------------------------
               fValLanc := (fCmDep * fParticip4) / 100;
               //-------------------------------------------------------------------------
               sHistor := 'Correção Monetaria Inicial da Depreciação do Saldo de Reavaliacao';
               if not MontaPlanilhaContabil(sHistor,sHistor1,sHistor2,sHistor3,sHistor4,
                                            sCcDeb, sCCCre ,sAtivProjeto,
                                            sDebitoCMD, sCreditoCMD, sNumDoc, abs(fValLanc),
                                            iGrupo, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         qryCcRD.Next;
      end;
      qryCcRD.Close;
      //----------------------------------------------------------------------------------
      result := 1;
   except
      on E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
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
//    aGrupo         : ARRAY DINÂMICO contendo os id´s dos grupos contábeis dos
//                     bens a serem gerados
//    aConjunto      : ARRAY DINÂMICO contendo os id´s dos conjuntos dos
//                     bens a serem gerados
//    aPlaca         : ARRAY DINÂMICO contendo os números das placas patrimoniais dos
//                     bens a serem gerados
//    aDesBem        : ARRAY DINÂMICO contendo as descrições dos bens a serem gerados
//    aProporcoes    : ARRAY DINÂMICO contendo as proporções percentuais que serão
//                     aplicadas aos componentes contábeis do bem original
//    aIdBemResult   : ARRAY DINÂMICO contendo os id's dos bens gerados
//    aSaldoContab   : ARRAY DINÂMICO contendo os saldos contábeis dos bens gerados
//
//    bMostraMsg     : True  - mostra mensagens da Função
//                     False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function TAtivoFixo.ExecutaDesmembramento(iModulo, iEmpresaProp, iBem : Integer;
                                          dDataMov         : tDate;
                                          iQtdBens         : Integer;
                                          aGrupo           : Array of Integer;
                                          aConjunto        : Array of Integer;
                                          aPlaca           : Array of Extended;
                                          aDesBem          : Array of String;
                                          aProporcoes      : Array of Currency;
                                          Var aIdBemResult : Array of Integer;
                                          Var aSaldoContab : Array of Currency;
                                          bMostraMsg       : boolean) : Integer;

var
   iIdBem, iSeqHist, iAux, iProcBem,
   iTipoMovimentacao, iAux2,
   iIdReavaliacao, iIdAcrescimo,
   iMaxProcBem,
   iSeqHist07, iSeqHist15, iSeqHist17, iSeqHist21,
   iSeqHist32, iSeqHist22, iSeqHist33, iSeqHist19   : Integer;
   qryBem, qryReavaliacao, qryAcrescimo,
   qryUltMov, qryAux, qrySaldoContab,
   qryGrupos, qryConjunto, qryLocalizacao           : TwwQuery;
   bTransacao, bMaxProporcoes, bPlanilha            : Boolean;
   fValOrg, fCmBem, fDepLanc, fCmDep,
   fValFis, fValGer, fDepFis, fDepGer,
   fBaixaB, fBaixaBF, fBaixaBG,
   fBaixaCM, fBaixaD, fBaixaDF,
   fBaixaDG, fBaixaCMD,
   fDepCmBem, fDepDepLanc, fDepCmDep,
   fSomaProp, fMaxProporcoes,fPropBaixar            : Extended;
   fxValOrg, fxCmBem, fxDepLanc,
   fxCmDep, fxValCtb, fxReavValOrg, fxReavCmBem,
   fxReavDepLanc, fxReavCmDep,fSumValOrg,
   fSumCmBem, fSumDepLanc, fSumCmDep,
   fSumReavValOrg, fSumReavCmBem,
   fSumReavDepLanc, fSumReavCmDep,
   fSumSaldoContab                                  : Currency;
   cSeparador                                       : Char;
   dDataUltMov, dDataUltDep                         : tDate;
   iExercicio,iPeriodo, iPlanilha                   : Integer;
   sMensagem, sCCustoPai, sAtivProjeto              : String;

begin
   bTransacao := False;
   try
      with dtmAtivoFixo do
      begin
         if not qrySaldoContabBem.Prepared       then qrySaldoContabBem.Prepare;
         if not qryUltMov.Prepared               then qryUltMov.Prepare;
         if not qryBem.Prepared                  then qryBem.Prepare;
         if not qryReavaliacao.Prepared          then qryReavaliacao.Prepare;
         if not qryAcrescimo.Prepared            then qryAcrescimo.Prepare;
         if not qryGrupos.Prepared               then qryGrupos.Prepare;
         if not qryConjunto.Prepared             then qryConjunto.Prepare;
         if not qryLocalizacao.Prepared          then qryLocalizacao.Prepare;
         if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
         if not qryRegistraBaixaBem.Prepared     then qryRegistraBaixaBem.Prepare;
         if not qryRegistraAcresc.Prepared       then qryRegistraAcresc.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
      qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
      qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
      qryGrupos      := TwwQuery(dtmAtivoFixo.qryGrupos);
      qryConjunto    := TwwQuery(dtmAtivoFixo.qryConjunto);
      qryLocalizacao := TwwQuery(dtmAtivoFixo.qryLocalizacao);
      qryUltMov      := TwwQuery(dtmAtivoFixo.qryUltMov);
      qrySaldoContab := TwwQuery(dtmAtivoFixo.qrySaldoContabBem);
      qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
      //----------------------------------------------------------------------------------
      // Valida os Parâmetros obrigatórios para o Desmembramento
      //----------------------------------------------------------------------------------
      if ((High(aPlaca) + 1) <> iQtdBens) or ((High(aDesBem) + 1) <> iQtdBens) or
         ((High(aProporcoes) + 1) <> iQtdBens) or ((High(aIdBemResult) + 1) <> iQtdBens) or
         ((High(aSaldoContab) + 1) <> iQtdBens) then
      begin
         MensagemErro := 'Não existem Placas e/ou Descrições e/ou Proporções suficientes para a quantidade de '+
                         'bens a ser gerada!';
         raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Verifica se a soma das proporções é igual a 100%
      //----------------------------------------------------------------------------------
      fSomaProp := 0;
      for iAux := 0 to High(aProporcoes) do
          fSomaProp := fSomaProp + aProporcoes[iAux];
      if fSomaProp <> 100 then
      begin
         MensagemErro := 'A soma das proporções está diferente de 100% !';
         raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Verifica se existe Placa duplicada no array enviado
      //----------------------------------------------------------------------------------
      for iAux := 0 to (High(aPlaca) - 1) do
         for iAux2 := (iAux + 1) to High(aPlaca) do
             if (aPlaca[iAux] = aPlaca[iAux2]) and (aPlaca[iAux] > 0) then
             begin
                MensagemErro := 'Uma das placas (' + floattostr(aPlaca[iAux]) + ') está duplicada para a '+
                                'geração dos novos bens!';
                raise Exception.Create(MensagemErro);
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
            raise Exception.Create('Uma das placas (' + floattostr(aPlaca[iAux]) + ') fornecidas para a '+
                                   'geração dos novos bens já existe!');
      end;
      //----------------------------------------------------------------------------------
      qryUltMov.Close;
      qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
      qryUltMov.Open;
      if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
         raise Exception.Create('Existe movimentação após a data do desmembramento. '+
                                'Consulte Historico de Movimentações do Bem!');
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
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
      // Verifica se a data da movimentação é válida
      //----------------------------------------------------------------------------------
      if not VerificaPeriodoCaf(iEmpresaProp, iBem, qryBem.FieldByName('FLGIMOVEL').AsInteger,
                                '13', dDataMov, dDataUltMov, dDataUltDep) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if iModulo <= 0 then
      begin
         MensagemErro := 'É obrigatório fornecer o código do MODULO!';
         Raise Exception.Create(MensagemErro);
      end else
      begin
         if iModulo <> qryBem.FieldByName('IDMODULO').asInteger then
         begin
            MensagemErro := 'Somente o módulo que cadastrou o bem pode movimenta-lo';
            Raise Exception.Create(MensagemErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Calcula a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      fDepCmBem   := 0;
      fDepDepLanc := 0;
      fDepCmDep   := 0;
      if qryBem.FieldByName('CONTROLE').AsString = 'T' then
         if not ExecutaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),bMostraMsg,0,
                                   fDepCmBem, fDepDepLanc, fDepCmDep) then
            Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Calcula o Saldo Contábil do Bem antes do Desmembramento
      //----------------------------------------------------------------------------------
      qrySaldoContab.Close;
      qrySaldoContab.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qrySaldoContab.ParamByName('PIDBEM').AsInteger    := iBem;
      qrySaldoContab.ParamByName('PDATASLD').AsDateTime := dDataMov;
      qrySaldoContab.Open;
      fxValOrg      := ConvNum(qrySaldoContab.FieldByName('VALORG').AsFloat);
      fxCmBem       := ConvNum(qrySaldoContab.FieldByName('CMBEM').AsFloat);
      fxDepLanc     := ConvNum(qrySaldoContab.FieldByName('DEPLANC').AsFloat);
      fxCmDep       := ConvNum(qrySaldoContab.FieldByName('CMDEP').AsFloat);
      fxValCtb      := (qrySaldoContab.FieldByName('VALORG').AsFloat + qrySaldoContab.FieldByName('CMBEM').AsFloat -
                        qrySaldoContab.FieldByName('DEPLANC').AsFloat - qrySaldoContab.FieldByName('CMDEP').AsFloat);
      fxReavValOrg  := ConvNum(qrySaldoContab.FieldByName('REAVVALORG').AsFloat)  + ConvNum(qrySaldoContab.FieldByName('ULTREAVVALORG').AsFloat);
      fxReavCmBem   := ConvNum(qrySaldoContab.FieldByName('REAVCMBEM').AsFloat)   + ConvNum(qrySaldoContab.FieldByName('ULTREAVCMBEM').AsFloat);
      fxReavDepLanc := ConvNum(qrySaldoContab.FieldByName('REAVDEPLANC').AsFloat) + ConvNum(qrySaldoContab.FieldByName('ULTREAVDEPLANC').AsFloat);
      fxReavCmDep   := ConvNum(qrySaldoContab.FieldByName('REAVCMDEP').AsFloat)   + ConvNum(qrySaldoContab.FieldByName('ULTREAVCMDEP').AsFloat);
      //----------------------------------------------------------------------------------
      fSumValOrg      := 0;
      fSumCmBem       := 0;
      fSumDepLanc     := 0;
      fSumCmDep       := 0;
      fSumReavValOrg  := 0;
      fSumReavCmBem   := 0;
      fSumReavDepLanc := 0;
      fSumReavCmDep   := 0;
      //----------------------------------------------------------------------------------
      fMaxProporcoes := 0;
      for iProcBem := 0 to (iQtdBens - 1) do
      begin
         //-------------------------------------------------------------------------------
         // Seta variável que identifica a maior proporção
         //-------------------------------------------------------------------------------
         if aProporcoes[iProcBem] > fMaxProporcoes then
         begin
            bMaxProporcoes := True;
            fMaxProporcoes := aProporcoes[iProcBem];
         end else
         begin
            bMaxProporcoes := False;
         end;
         fSumSaldoContab := 0;
         //-------------------------------------------------------------------------------
         // Registra a Entrada do Bem por Desmembramento
         //-------------------------------------------------------------------------------
         fValOrg  := ConvNum(qryBem.FieldByName('VALORG').AsCurrency  * (aProporcoes[iProcBem] / 100));
         fCmBem   := ConvNum(qryBem.FieldByName('CMBEM').AsCurrency   * (aProporcoes[iProcBem] / 100));
         fDepLanc := ConvNum(qryBem.FieldByName('DEPLANC').AsCurrency * (aProporcoes[iProcBem] / 100));
         fCmDep   := ConvNum(qryBem.FieldByName('CMDEP').AsCurrency   * (aProporcoes[iProcBem] / 100));
         fValFis  := ConvNum(qryBem.FieldByName('VALFIS').AsCurrency  * (aProporcoes[iProcBem] / 100));
         fValGer  := ConvNum(qryBem.FieldByName('VALGER').AsCurrency  * (aProporcoes[iProcBem] / 100));
         fDepFis  := ConvNum(qryBem.FieldByName('DEPFIS').AsCurrency  * (aProporcoes[iProcBem] / 100));
         fDepGer  := ConvNum(qryBem.FieldByName('DEPGER').AsCurrency  * (aProporcoes[iProcBem] / 100));
         fValOrg  := strtofloat(FormatFloat('#0.00',((fValOrg  * 100) / 100)));
         fCmBem   := strtofloat(FormatFloat('#0.00',((fCmBem   * 100) / 100)));
         fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
         fCmDep   := strtofloat(FormatFloat('#0.00',((fCmDep   * 100) / 100)));
         //-------------------------------------------------------------------------------
         if fxValCtb = 0 then
         begin
            if ConvNum(fValOrg + fCmBem - fDepLanc - fCmDep) < 0 then
            begin
               fDepLanc := fDepLanc + ConvNum(fValOrg + fCmBem - fDepLanc - fCmDep);
            end else
            begin
               fValOrg  := fValOrg - ConvNum(fValOrg + fCmBem - fDepLanc - fCmDep);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Acumula componentes para calcular diferenças residuais
         //-------------------------------------------------------------------------------
         fSumValOrg      := ConvNum(fSumValOrg) + ConvNum(fValOrg);
         fSumCmBem       := ConvNum(fSumCmBem) + ConvNum(fCmBem);
         fSumDepLanc     := ConvNum(fSumDepLanc) + ConvNum(fDepLanc);
         fSumCmDep       := ConvNum(fSumCmDep) + ConvNum(fCmDep);
         fSumSaldoContab := ConvNum(fSumSaldoContab) + ConvNum(fValOrg + fCmBem - fDepLanc - fCmDep);
         //-------------------------------------------------------------------------------
         iIdBem := RegistraEntrada(-1,
                                   Sistema.IdModulo,
                                   Sistema.IdEmpresa,
                                   aConjunto[iProcBem],
                                   qryBem.FieldByName('IDTERCEIRO').AsInteger,
                                   aGrupo[iProcBem],
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
                                   False,-1,
                                   bMostraMsg);
         if iIdBem = -1 then
         begin
            MensagemErro := 'Erro na geração do bem Placa : '+floattostr(aPlaca[iProcBem]) + #13 + #13 +
                            MensagemErro;
            Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         if bMaxProporcoes then
            iMaxProcBem := iProcBem;
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
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         if bMaxProporcoes then iSeqHist07 := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria Inicial do Bem
         //-------------------------------------------------------------------------------
         if fCmBem > 0 then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             15, dDataMov, -1,
                                             fCmBem, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         if bMaxProporcoes then iSeqHist15 := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if fDepLanc > 0 then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             17, dDataMov, -1,
                                             fDepLanc, fDepFis, fDepGer,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         if bMaxProporcoes then iSeqHist17 := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if fCmDep > 0 then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             21, dDataMov, -1,
                                             fCmDep, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         if bMaxProporcoes then iSeqHist21 := iSeqHist;
         //-------------------------------------------------------------------------------
         // Processa as Reavaliações do Bem Desmembrado
         //-------------------------------------------------------------------------------
         qryReavaliacao.First;
         while not qryReavaliacao.EOF do
         begin
            fValOrg  := ConvNum(qryReavaliacao.FieldByName('VALORG').AsCurrency  * (aProporcoes[iProcBem] / 100));
            fCmBem   := ConvNum(qryReavaliacao.FieldByName('CMBEM').AsCurrency   * (aProporcoes[iProcBem] / 100));
            fDepLanc := ConvNum(qryReavaliacao.FieldByName('DEPLANC').AsCurrency * (aProporcoes[iProcBem] / 100));
            fCmDep   := ConvNum(qryReavaliacao.FieldByName('CMDEP').AsCurrency   * (aProporcoes[iProcBem] / 100));
            fValFis  := ConvNum(qryReavaliacao.FieldByName('VALFIS').AsCurrency  * (aProporcoes[iProcBem] / 100));
            fValGer  := ConvNum(qryReavaliacao.FieldByName('VALGER').AsCurrency  * (aProporcoes[iProcBem] / 100));
            fDepFis  := ConvNum(qryReavaliacao.FieldByName('DEPFIS').AsCurrency  * (aProporcoes[iProcBem] / 100));
            fDepGer  := ConvNum(qryReavaliacao.FieldByName('DEPGER').AsCurrency  * (aProporcoes[iProcBem] / 100));
            fValOrg  := strtofloat(FormatFloat('#0.00',((fValOrg  * 100) / 100)));
            fCmBem   := strtofloat(FormatFloat('#0.00',((fCmBem   * 100) / 100)));
            fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
            fCmDep   := strtofloat(FormatFloat('#0.00',((fCmDep   * 100) / 100)));
            //----------------------------------------------------------------------------
            // Acumula componentes para calcular diferenças residuais
            //----------------------------------------------------------------------------
            fSumReavValOrg  := ConvNum(fSumReavValOrg)  + ConvNum(fValOrg)  ;
            fSumReavCmBem   := ConvNum(fSumReavCmBem)   + ConvNum(fCmBem)   ;
            fSumReavDepLanc := ConvNum(fSumReavDepLanc) + ConvNum(fDepLanc) ;
            fSumReavCmDep   := ConvNum(fSumReavCmDep)   + ConvNum(fCmDep)   ;
            fSumSaldoContab := ConvNum(fSumSaldoContab) + ConvNum(fValOrg + fCmBem - fDepLanc - fCmDep);
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT TAXADEPANT,VALORGLAUDO,OBSREAVAL ' +
                               ' FROM HISTORICOMOVIMENTACAO ' +
                               ' WHERE IDMOVIMENTACAO = ' + qryReavaliacao.FieldByName('IDMOVIMENTACAO').AsString;
            qryAux.Open;
            //----------------------------------------------------------------------------
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             32, dDataMov, -1,
                                             fValOrg, fValFis, fValGer,
                                             -1, -1, -1, -1, -1, -1, -1, -1,
                                             qryAux.FieldByName('TAXADEPANT').AsFloat,
                                             qryAux.FieldByName('VALORGLAUDO').AsFloat,
                                             qryAux.FieldByName('OBSREAVAL').AsString,
                                             0, bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            qryAux.Close;
            //----------------------------------------------------------------------------
            if bMaxProporcoes then iSeqHist32 := iSeqHist;
            //----------------------------------------------------------------------------
            iIdReavaliacao := RegistraReavaliacao(iIdBem,iEmpresaProp,iSeqHist,
                                                  fValOrg,fValFis,fValGer,fCmBem,
                                                  fDepLanc,fDepFis,fDepGer,fCmDep,
                                                  qryReavaliacao.FieldByName('TAXADEP').AsFloat,
                                                  dDataMov, // DATAREAVALIACAO
                                                  qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger,
                                                  dDataMov - 1, // DATAULTDEP
                                                  qryReavaliacao.FieldByName('FLGDEPREC').AsInteger,
                                                  bMostraMsg);
            if iIdReavaliacao <= 0 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetaria da Reavaliação do Bem
            //----------------------------------------------------------------------------
            if fCmBem <> 0 then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                22, dDataMov, iIdReavaliacao,
                                                fCmBem, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create(MensagemErro);
            end;
            //----------------------------------------------------------------------------
            if bMaxProporcoes then iSeqHist22 := iSeqHist;
            //----------------------------------------------------------------------------
            // Registra o Historico da Depreciação da Reavaliacao do Bem
            //----------------------------------------------------------------------------
            if fDepLanc <> 0 then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                33, dDataMov, iIdReavaliacao,
                                                fDepLanc, fDepFis, fDepGer,
                                                dDataMov,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create(MensagemErro);
            end;
            //----------------------------------------------------------------------------
            if bMaxProporcoes then iSeqHist33 := iSeqHist;
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetária da Depreciação do Bem
            //----------------------------------------------------------------------------
            if fCmDep <> 0 then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                19, dDataMov, iIdReavaliacao,
                                                fCmDep, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create(MensagemErro);
            end;
            //----------------------------------------------------------------------------
            if bMaxProporcoes then iSeqHist19 := iSeqHist;
            //----------------------------------------------------------------------------
            qryReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // Processa os Acréscimos de Valor do Bem Desmembrado
         //-------------------------------------------------------------------------------
         qryAcrescimo.First;
         while not qryAcrescimo.EOF do
         begin
            fValOrg  := ConvNum(qryAcrescimo.FieldByName('VALORG').AsCurrency  * (aProporcoes[iProcBem] / 100));
            fCmBem   := ConvNum(qryAcrescimo.FieldByName('CMBEM').AsCurrency   * (aProporcoes[iProcBem] / 100));
            fDepLanc := ConvNum(qryAcrescimo.FieldByName('DEPLANC').AsCurrency * (aProporcoes[iProcBem] / 100));
            fCmDep   := ConvNum(qryAcrescimo.FieldByName('CMDEP').AsCurrency   * (aProporcoes[iProcBem] / 100));
            fValFis  := ConvNum(qryAcrescimo.FieldByName('VALFIS').AsCurrency  * (aProporcoes[iProcBem] / 100));
            fValGer  := ConvNum(qryAcrescimo.FieldByName('VALGER').AsCurrency  * (aProporcoes[iProcBem] / 100));
            fDepFis  := ConvNum(qryAcrescimo.FieldByName('DEPFIS').AsCurrency  * (aProporcoes[iProcBem] / 100));
            fDepGer  := ConvNum(qryAcrescimo.FieldByName('DEPGER').AsCurrency  * (aProporcoes[iProcBem] / 100));
            fValOrg  := strtofloat(FormatFloat('#0.00',((fValOrg  * 100) / 100)));
            fCmBem   := strtofloat(FormatFloat('#0.00',((fCmBem   * 100) / 100)));
            fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
            fCmDep   := strtofloat(FormatFloat('#0.00',((fCmDep   * 100) / 100)));
            //----------------------------------------------------------------------------
            // Acumula componentes para calcular diferenças residuais
            //----------------------------------------------------------------------------
            fSumValOrg  := ConvNum(fSumValOrg)  + ConvNum(fValOrg)  ;
            fSumCmBem   := ConvNum(fSumCmBem)   + ConvNum(fCmBem)   ;
            fSumDepLanc := ConvNum(fSumDepLanc) + ConvNum(fDepLanc) ;
            fSumCmDep   := ConvNum(fSumCmDep)   + ConvNum(fCmDep)   ;
            fSumSaldoContab := ConvNum(fSumSaldoContab) + ConvNum(fValOrg + fCmBem - fDepLanc - fCmDep);
            //----------------------------------------------------------------------------
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             09, dDataMov, -1,
                                             fValOrg, fValFis, fValGer,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',
                                             0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            iIdAcrescimo := RegistraAcrescimo(iIdBem, iEmpresaProp, iSeqHist,
                                              qryAcrescimo.FieldByName('TAXADEP').AsFloat,
                                              dDataMov,
                                              fValOrg,fValFis,fValGer,fCmBem,
                                              fCmDep,fDepLanc,fDepFis,fDepGer,
                                              qryAcrescimo.FieldByName('FLGDEPREC').AsInteger,
                                              qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime,
                                              bMostraMsg);
            if iIdAcrescimo < 0 then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT IDTIPODESPESA, OBS ' +
                               ' FROM ACRESCVALOR ' +
                               ' WHERE IDMOVIMENTACAO = ' + qryAcrescimo.FieldByName('IDMOVIMENTACAO').AsString;
            qryAux.Open;
            //----------------------------------------------------------------------------
            if not RegistraAcresc(iSeqHist,
                                  qryAux.FieldByName('IDTIPODESPESA').AsInteger,
                                  qryAux.FieldByName('OBS').AsString,
                                  bMostraMsg) then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            qryAux.Close;
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetaria da Reavaliação do Bem
            //----------------------------------------------------------------------------
            if fCmBem <> 0 then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                34, dDataMov, iIdAcrescimo,
                                                fCmBem, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create(MensagemErro);
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Depreciação da Reavaliacao do Bem
            //----------------------------------------------------------------------------
            if fDepLanc <> 0 then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                35, dDataMov, iIdAcrescimo,
                                                fDepLanc, fDepFis, fDepGer,
                                                dDataMov,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create(MensagemErro);
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetária da Depreciação do Bem
            //----------------------------------------------------------------------------
            if fCmDep <> 0 then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                36, dDataMov, iIdAcrescimo,
                                                fCmDep, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create(MensagemErro);
            end;
            //----------------------------------------------------------------------------
            qryAcrescimo.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Id e o Saldo Contábil no array de saída
         //-------------------------------------------------------------------------------
         aIdBemResult[iProcBem] := iIdBem;
         aSaldoContab[iProcBem] := fSumSaldoContab;
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
      fBaixaB  := ConvNum(qryBem.FieldByName('VALORG').asFloat * (fPropBaixar / 100));
      fBaixaBF := ConvNum(qryBem.FieldByName('VALFIS').asFloat * (fPropBaixar / 100));
      fBaixaBG := ConvNum(qryBem.FieldByName('VALGER').asFloat * (fPropBaixar / 100));
      //----------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 13, dDataMov,
                                       -1,
                                       fBaixaB, fBaixaBF, fBaixaBG,
                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
      if iSeqHist = -1 then
         Raise Exception.Create(MensagemErro);
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
            Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 25
      //----------------------------------------------------------------------------------
      fBaixaCM := qryBem.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
      if fBaixaCM <> 0 then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 25, dDataMov,
                                          -1,
                                          fBaixaCM, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 24
      //----------------------------------------------------------------------------------
      fBaixaD  := ConvNum(qryBem.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100));
      fBaixaDF := ConvNum(qryBem.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100));
      fBaixaDG := ConvNum(qryBem.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100));
      if fBaixaD <> 0 then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 24, dDataMov,
                                          -1, fBaixaD, fBaixaDF, fBaixaDG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 26
      //----------------------------------------------------------------------------------
      fBaixaCMD := ConvNum(qryBem.FieldByName('CMDEP').asFloat * (fPropBaixar / 100));
      if fBaixaCMD <> 0 then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 26, dDataMov,
                                          -1, fBaixaCMD, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Registra a Baixa na Tabela de Bens
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('VALORG').asFloat  := ConvNum(qryBem.FieldByName('VALORG').asFloat  - fBaixaB);
      qryBem.FieldByName('VALFIS').asFloat  := ConvNum(qryBem.FieldByName('VALFIS').asFloat  - fBaixaBF);
      qryBem.FieldByName('VALGER').asFloat  := ConvNum(qryBem.FieldByName('VALGER').asFloat  - fBaixaBG);
      qryBem.FieldByName('DEPLANC').asFloat := ConvNum(qryBem.FieldByName('DEPLANC').asFloat - fBaixaD);
      qryBem.FieldByName('DEPFIS').asFloat  := ConvNum(qryBem.FieldByName('DEPFIS').asFloat  - fBaixaDF);
      qryBem.FieldByName('DEPGER').asFloat  := ConvNum(qryBem.FieldByName('DEPGER').asFloat  - fBaixaDG);
      qryBem.FieldByName('CMBEM').asFloat   := ConvNum(qryBem.FieldByName('CMBEM').asFloat   - fBaixaCM);
      qryBem.FieldByName('CMDEP').asFloat   := ConvNum(qryBem.FieldByName('CMDEP').asFloat   - fBaixaCMD);
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
         fBaixaB  := ConvNum(qryReavaliacao.FieldByName('VALORG').asFloat * (fPropBaixar / 100));
         fBaixaBF := ConvNum(qryReavaliacao.FieldByName('VALFIS').asFloat * (fPropBaixar / 100));
         fBaixaBG := ConvNum(qryReavaliacao.FieldByName('VALGER').asFloat * (fPropBaixar / 100));
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 20, dDataMov,
                                          qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                          fBaixaB, fBaixaBF, fBaixaBG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 28
         //-------------------------------------------------------------------------------
         fBaixaCM := ConvNum(qryReavaliacao.FieldByName('CMBEM').asFloat * (fPropBaixar / 100));
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 28, dDataMov,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 27
         //-------------------------------------------------------------------------------
         fBaixaD  := ConvNum(qryReavaliacao.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100));
         fBaixaDF := ConvNum(qryReavaliacao.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100));
         fBaixaDG := ConvNum(qryReavaliacao.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100));
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 27, dDataMov,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaD, fBaixaDF, fBaixaDG,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 29
         //-------------------------------------------------------------------------------
         fBaixaCMD := ConvNum(qryReavaliacao.FieldByName('CMDEP').asFloat * (fPropBaixar / 100));
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 29, dDataMov,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCMD, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Reavaliações
         //-------------------------------------------------------------------------------
         qryReavaliacao.Edit;
         qryReavaliacao.FieldByName('VALORG').asFloat  := ConvNum(qryReavaliacao.FieldByName('VALORG').asFloat  - fBaixaB);
         qryReavaliacao.FieldByName('VALFIS').asFloat  := ConvNum(qryReavaliacao.FieldByName('VALFIS').asFloat  - fBaixaBF);
         qryReavaliacao.FieldByName('VALGER').asFloat  := ConvNum(qryReavaliacao.FieldByName('VALGER').asFloat  - fBaixaBG);
         qryReavaliacao.FieldByName('DEPLANC').asFloat := ConvNum(qryReavaliacao.FieldByName('DEPLANC').asFloat - fBaixaD);
         qryReavaliacao.FieldByName('DEPFIS').asFloat  := ConvNum(qryReavaliacao.FieldByName('DEPFIS').asFloat  - fBaixaDF);
         qryReavaliacao.FieldByName('DEPGER').asFloat  := ConvNum(qryReavaliacao.FieldByName('DEPGER').asFloat  - fBaixaDG);
         qryReavaliacao.FieldByName('CMBEM').asFloat   := ConvNum(qryReavaliacao.FieldByName('CMBEM').asFloat   - fBaixaCM);
         qryReavaliacao.FieldByName('CMDEP').asFloat   := ConvNum(qryReavaliacao.FieldByName('CMDEP').asFloat   - fBaixaCMD);
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
         fBaixaB  := ConvNum(qryAcrescimo.FieldByName('VALORG').asFloat * (fPropBaixar / 100));
         fBaixaBF := ConvNum(qryAcrescimo.FieldByName('VALFIS').asFloat * (fPropBaixar / 100));
         fBaixaBG := ConvNum(qryAcrescimo.FieldByName('VALGER').asFloat * (fPropBaixar / 100));
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 37, dDataMov,
                                          qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                          fBaixaB, fBaixaBF, fBaixaBG,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 38
         //-------------------------------------------------------------------------------
         fBaixaCM := ConvNum(qryAcrescimo.FieldByName('CMBEM').asFloat * (fPropBaixar / 100));
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 38, dDataMov,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 39
         //-------------------------------------------------------------------------------
         fBaixaD  := ConvNum(qryAcrescimo.FieldByName('DEPLANC').asFloat * (fPropBaixar / 100));
         fBaixaDF := ConvNum(qryAcrescimo.FieldByName('DEPFIS').asFloat  * (fPropBaixar / 100));
         fBaixaDG := ConvNum(qryAcrescimo.FieldByName('DEPGER').asFloat  * (fPropBaixar / 100));
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 39, dDataMov,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaD, fBaixaDF, fBaixaDG,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 40
         //-------------------------------------------------------------------------------
         fBaixaCMD := ConvNum(qryAcrescimo.FieldByName('CMDEP').asFloat * (fPropBaixar / 100));
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 40, dDataMov,
                                             qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                             fBaixaCMD, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Acrescimos de Valor
         //-------------------------------------------------------------------------------
         qryAcrescimo.Edit;
         qryAcrescimo.FieldByName('VALORG').asFloat  := ConvNum(qryAcrescimo.FieldByName('VALORG').asFloat  - fBaixaB);
         qryAcrescimo.FieldByName('VALFIS').asFloat  := ConvNum(qryAcrescimo.FieldByName('VALFIS').asFloat  - fBaixaBF);
         qryAcrescimo.FieldByName('VALGER').asFloat  := ConvNum(qryAcrescimo.FieldByName('VALGER').asFloat  - fBaixaBG);
         qryAcrescimo.FieldByName('DEPLANC').asFloat := ConvNum(qryAcrescimo.FieldByName('DEPLANC').asFloat - fBaixaD);
         qryAcrescimo.FieldByName('DEPFIS').asFloat  := ConvNum(qryAcrescimo.FieldByName('DEPFIS').asFloat  - fBaixaDF);
         qryAcrescimo.FieldByName('DEPGER').asFloat  := ConvNum(qryAcrescimo.FieldByName('DEPGER').asFloat  - fBaixaDG);
         qryAcrescimo.FieldByName('CMBEM').asFloat   := ConvNum(qryAcrescimo.FieldByName('CMBEM').asFloat   - fBaixaCM);
         qryAcrescimo.FieldByName('CMDEP').asFloat   := ConvNum(qryAcrescimo.FieldByName('CMDEP').asFloat   - fBaixaCMD);
         qryAcrescimo.Post;
         qryAcrescimo.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryAcrescimo.Next;
      end;
      //==================================================================================
      // Verifica se existe alguma diferença residual na geração dos bens.
      // Se houver, lançar a diferença na última reavaliação ou no bem.
      //==================================================================================
      cSeparador       := DecimalSeparator;
      DecimalSeparator := '.';
      //----------------------------------------------------------------------------------
      if fxValOrg <> fSumValOrg then
      begin
         qryAux.Close;
         if (fxValOrg - fSumValOrg) > 0 then
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI + ' + formatfloat('#0.00',ConvNum(fxValOrg - fSumValOrg)) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist07) + ') '
         else
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI - ' + formatfloat('#0.00',abs(ConvNum(fxValOrg - fSumValOrg))) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist07) + ') ';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         if fxValOrg - fSumValOrg > 0 then
            qryAux.SQL.Text := ' UPDATE BEM ' +
                               ' SET VALORG = VALORG + ' + formatfloat('#0.00',ConvNum(fxValOrg - fSumValOrg)) +
                               ' WHERE (IDBEM IN (SELECT IDBEM '+
                               '                  FROM HISTORICOMOVIMENTACAO '+
                               '                  WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist07) + ') ))'
         else
            qryAux.SQL.Text := ' UPDATE BEM ' +
                               ' SET VALORG = VALORG - ' + formatfloat('#0.00',abs(ConvNum(fxValOrg - fSumValOrg))) +
                               ' WHERE (IDBEM IN (SELECT IDBEM '+
                               '                  FROM HISTORICOMOVIMENTACAO '+
                               '                  WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist07) + ') ))';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         aSaldoContab[iMaxProcBem] := aSaldoContab[iMaxProcBem] + (fxValOrg - fSumValOrg);
      end;
      //----------------------------------------------------------------------------------
      if fxCmBem <> fSumCmBem then
      begin
         qryAux.Close;
         if (fxCmBem - fSumCmBem) > 0 then
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI + ' + formatfloat('#0.00',ConvNum(fxCmBem - fSumCmBem)) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist15) + ') '
         else
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI - ' + formatfloat('#0.00',abs(ConvNum(fxCmBem - fSumCmBem))) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist15) + ') ';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         if (fxCmBem - fSumCmBem) > 0 then
            qryAux.SQL.Text := ' UPDATE BEM ' +
                               ' SET CMBEM = CMBEM + ' + formatfloat('#0.00',ConvNum(fxCmBem - fSumCmBem)) +
                               ' WHERE (IDBEM IN (SELECT IDBEM '+
                               '                  FROM HISTORICOMOVIMENTACAO '+
                               '                  WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist15) + ') ))'
         else
            qryAux.SQL.Text := ' UPDATE BEM ' +
                               ' SET CMBEM = CMBEM - ' + formatfloat('#0.00',abs(ConvNum(fxCmBem - fSumCmBem))) +
                               ' WHERE (IDBEM IN (SELECT IDBEM '+
                               '                  FROM HISTORICOMOVIMENTACAO '+
                               '                  WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist15) + ') ))';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         aSaldoContab[iMaxProcBem] := ConvNum(aSaldoContab[iMaxProcBem] + ConvNum(fxCmBem - fSumCmBem));
      end;
      //----------------------------------------------------------------------------------
      if fxDepLanc <> fSumDepLanc then
      begin
         qryAux.Close;
         if (fxDepLanc - fSumDepLanc) > 0 then
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI + ' + formatfloat('#0.00',ConvNum(fxDepLanc - fSumDepLanc)) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist17) + ') '
         else
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI - ' + formatfloat('#0.00',abs(ConvNum(fxDepLanc - fSumDepLanc))) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist17) + ') ';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         if (fxDepLanc - fSumDepLanc) > 0 then
            qryAux.SQL.Text := ' UPDATE BEM ' +
                               ' SET DepLanc = DepLanc + ' + formatfloat('#0.00',ConvNum(fxDepLanc - fSumDepLanc)) +
                               ' WHERE (IDBEM IN (SELECT IDBEM '+
                               '                  FROM HISTORICOMOVIMENTACAO '+
                               '                  WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist17) + ') ))'
         else
            qryAux.SQL.Text := ' UPDATE BEM ' +
                               ' SET DepLanc = DepLanc - ' + formatfloat('#0.00',abs(ConvNum(fxDepLanc - fSumDepLanc))) +
                               ' WHERE (IDBEM IN (SELECT IDBEM '+
                               '                  FROM HISTORICOMOVIMENTACAO '+
                               '                  WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist17) + ') ))';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         aSaldoContab[iMaxProcBem] := ConvNum(aSaldoContab[iMaxProcBem] - ConvNum(fxDepLanc - fSumDepLanc));
      end;
      //----------------------------------------------------------------------------------
      if fxCmDep <> fSumCmDep then
      begin
         qryAux.Close;
         if (fxCmDep - fSumCmDep) > 0 then
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI + ' + formatfloat('#0.00',ConvNum(fxCmDep - fSumCmDep)) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist21) + ') '
         else
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI - ' + formatfloat('#0.00',abs(ConvNum(fxCmDep - fSumCmDep))) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist21) + ') ';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         if (fxCmDep - fSumCmDep) > 0 then
            qryAux.SQL.Text := ' UPDATE BEM ' +
                               ' SET CMDEP = CMDEP + ' + formatfloat('#0.00',ConvNum(fxCmDep - fSumCmDep)) +
                               ' WHERE (IDBEM IN (SELECT IDBEM '+
                               '                  FROM HISTORICOMOVIMENTACAO '+
                               '                  WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist21) + ') ))'
         else
            qryAux.SQL.Text := ' UPDATE BEM ' +
                               ' SET CMDEP = CMDEP - ' + formatfloat('#0.00',abs(ConvNum(fxCmDep - fSumCmDep))) +
                               ' WHERE (IDBEM IN (SELECT IDBEM '+
                               '                  FROM HISTORICOMOVIMENTACAO '+
                               '                  WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist21) + ') ))';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         aSaldoContab[iMaxProcBem] := ConvNum(aSaldoContab[iMaxProcBem] - ConvNum(fxCmDep - fSumCmDep));
      end;
      //----------------------------------------------------------------------------------
      if fxReavValOrg <> fSumReavValOrg then
      begin
         qryAux.Close;
         if (fxReavValOrg - fSumReavValOrg) > 0 then
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI + ' + formatfloat('#0.00',ConvNum(fxReavValOrg - fSumReavValOrg)) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist32) + ') '
         else
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI - ' + formatfloat('#0.00',abs(ConvNum(fxReavValOrg - fSumReavValOrg))) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist32) + ') ';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         if (fxReavValOrg - fSumReavValOrg) > 0 then
            qryAux.SQL.Text := ' UPDATE REAVALIACAO ' +
                               ' SET VALORG = VALORG + ' + formatfloat('#0.00',ConvNum(fxReavValOrg - fSumReavValOrg)) +
                               ' WHERE (IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                               '                          FROM HISTORICOMOVIMENTACAO '+
                               '                          WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist32) + ') ))'
         else
            qryAux.SQL.Text := ' UPDATE REAVALIACAO ' +
                               ' SET VALORG = VALORG - ' + formatfloat('#0.00',abs(ConvNum(fxReavValOrg - fSumReavValOrg))) +
                               ' WHERE (IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                               '                          FROM HISTORICOMOVIMENTACAO '+
                               '                          WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist32) + ') ))';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         aSaldoContab[iMaxProcBem] := aSaldoContab[iMaxProcBem] + (fxReavValOrg - fSumReavValOrg);
      end;
      //----------------------------------------------------------------------------------
      if fxReavCmBem <> fSumReavCmBem then
      begin
         qryAux.Close;
         if (fxReavCmBem - fSumReavCmBem) > 0 then
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI + ' + formatfloat('#0.00',ConvNum(fxReavCmBem - fSumReavCmBem)) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist22) + ') '
         else
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI - ' + formatfloat('#0.00',abs(ConvNum(fxReavCmBem - fSumReavCmBem))) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist22) + ') ';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         aSaldoContab[iMaxProcBem] := ConvNum(aSaldoContab[iMaxProcBem] + ConvNum(fxReavCmBem - fSumReavCmBem));
      end;
      //----------------------------------------------------------------------------------
      if fxReavDepLanc <> fSumReavDepLanc then
      begin
         qryAux.Close;
         if (fxReavDepLanc - fSumReavDepLanc) > 0 then
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI + ' + formatfloat('#0.00',ConvNum(fxReavDepLanc - fSumReavDepLanc)) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist33) + ') '
         else
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI - ' + formatfloat('#0.00',abs(ConvNum(fxReavDepLanc - fSumReavDepLanc))) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist33) + ') ';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         if (fxReavDepLanc - fSumReavDepLanc) > 0 then
            qryAux.SQL.Text := ' UPDATE REAVALIACAO ' +
                               ' SET DEPLANC = DEPLANC + ' + formatfloat('#0.00',ConvNum(fxReavDepLanc - fSumReavDepLanc)) +
                               ' WHERE (IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                               '                          FROM HISTORICOMOVIMENTACAO '+
                               '                          WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist33) + ') ))'
         else
            qryAux.SQL.Text := ' UPDATE REAVALIACAO ' +
                               ' SET DEPLANC = DEPLANC - ' + formatfloat('#0.00',abs(ConvNum(fxReavDepLanc - fSumReavDepLanc))) +
                               ' WHERE (IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                               '                          FROM HISTORICOMOVIMENTACAO '+
                               '                          WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist33) + ') ))';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         aSaldoContab[iMaxProcBem] := ConvNum(aSaldoContab[iMaxProcBem] - ConvNum(fxReavDepLanc - fSumReavDepLanc));
      end;
      //----------------------------------------------------------------------------------
      if fxReavCmDep <> fSumReavCmDep then
      begin
         qryAux.Close;
         if (fxReavCmDep - fSumReavCmDep) > 0 then
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI + ' + formatfloat('#0.00',ConvNum(fxReavCmDep - fSumReavCmDep)) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist19) + ') '
         else
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET VALOFI = VALOFI - ' + formatfloat('#0.00',abs(ConvNum(fxReavCmDep - fSumReavCmDep))) +
                               ' WHERE (IDMOVIMENTACAO = ' + inttostr(iSeqHist19) + ') ';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         aSaldoContab[iMaxProcBem] := ConvNum(aSaldoContab[iMaxProcBem] - ConvNum(fxReavCmDep - fSumReavCmDep));
      end;
      //----------------------------------------------------------------------------------
      // Contabilização do desmembramento
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         if not VerificaPeriodoContabil(iEmpresaProp,dDataMov,iExercicio,iPeriodo,
                                        sMensagem,bMostraMsg) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            if qryMontaCtb.Active then qryMontaCtb.Close;
            if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
            if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
            if not qryConta.Prepared      then qryConta.Prepare;
            if not qryCCrd.Prepared       then qryCCrd.Prepare;
            if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
            if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
            qryMontaCtb.Open;
         end;
         //-------------------------------------------------------------------------------
         // Levanta dados do bem desmembrado
         //-------------------------------------------------------------------------------
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
            sCCustoPai := qryLocalizacao.FieldByName('CODCENTROCUSTO').AsString;
         end;
         //-------------------------------------------------------------------------------
         for iProcBem := 0 to (iQtdBens - 1) do
         begin
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT B.IDBEM,B.IDGRUPO,B.IDCONJUNTO,C.IDLOCALIZACAO,L.CODCENTROCUSTO, ' +
                               '        B.VALORG,B.DEPLANC,B.CMBEM,B.CMDEP, '+
                               '        B.DESBEM,B.UNIDNEGOC,B.REGISTRO,B.CODSUBCONTA,B.PLACA '+
                               ' FROM BEM B, '+
                               '      CONJUNTO C, '+
                               '      LOCALIZACAO L '+
                               ' WHERE (B.IDBEM = '+inttostr(aIdBemResult[iProcBem])+') '+
                               '   AND (B.IDPESSOA = '+inttostr(iEmpresaProp)+') ' +
                               '   AND (B.IDCONJUNTO = C.IDCONJUNTO) '+
                               '   AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO)';
            qryAux.Open;
            //----------------------------------------------------------------------------
            // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
            //----------------------------------------------------------------------------
            if qryAux.FieldByName('UNIDNEGOC').IsNull then
            begin
               with dtmAtivoFixo.qryParamCaf do
               begin
                  Close;
                  ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
                  Open;
                  if not IsEmpty then
                     sAtivProjeto := FieldByName('ATIVPROJETO').AsString
                  else
                     sAtivProjeto := '';
               end;
            end else
            begin
               sAtivProjeto := qryBem.FieldByName('UNIDNEGOC').AsString;
            end;
            //----------------------------------------------------------------------------
            // Contabiliza Custo
            //----------------------------------------------------------------------------
            if not ContabilizaDesmembramento(iModulo,iEmpresaProp,
                                             qryAux.FieldByName('IDBEM').AsInteger,
                                             qryAux.FieldByName('IDGRUPO').AsInteger,       // iIdGrupoFilho
                                             qryBem.FieldByName('IDGRUPO').AsInteger,       // iIdGrupoPai
                                             qryAux.FieldByName('IDCONJUNTO').AsInteger,    // iIdConjuntoFilho
                                             qryBem.FieldByName('IDCONJUNTO').AsInteger,    // iIdConjuntoPai
                                             qryAux.FieldByName('CODCENTROCUSTO').AsString, // sCCustoFilho
                                             sCCustoPai,                                    // sCCustoPai
                                             dDataMov,
                                             qryAux.FieldByName('VALORG').AsFloat,
                                             qryAux.FieldByName('CMBEM').AsFloat,
                                             qryAux.FieldByName('DEPLANC').AsFloat,
                                             qryAux.FieldByName('CMDEP').AsFloat,
                                             qryAux.FieldByName('DESBEM').AsString,         // Descrição do Filho
                                             qryBem.FieldByName('DESBEM').AsString,         // Descrição do Pai
                                             sAtivProjeto,'B',
                                             qryAux.FieldByName('CODSUBCONTA').AsInteger,
                                             qryAux.FieldByName('PLACA').AsString,          // Placa do Filho
                                             qryBem.FieldByName('PLACA').AsString,          // Placa do Pai
                                             bMostraMsg) then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            // Contabiliza Reavaliação
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT B.IDBEM,B.IDGRUPO,B.IDCONJUNTO,C.IDLOCALIZACAO,L.CODCENTROCUSTO, '+
                               '        R.VALORG, R.DEPLANC, R.CMBEM, R.CMDEP, B.DESBEM, B.UNIDNEGOC, '+
                               '        B.CODSUBCONTA, B.PLACA, B.REGISTRO '+
                               ' FROM REAVALIACAO R,'+
                               '      BEM B, '+
                               '      CONJUNTO C, '+
                               '      LOCALIZACAO L '+
                               ' WHERE (R.IDBEM = '+inttostr(aIdBemResult[iProcBem])+') '+
                               '   AND (R.IDPESSOA = '+inttostr(iEmpresaProp)+') '+
                               '   AND (R.IDBEM = B.IDBEM) ' +
                               '   AND (R.IDPESSOA = B.IDPESSOA) '+
                               '   AND (B.IDCONJUNTO = C.IDCONJUNTO) '+
                               '   AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO)';
            qryAux.Open;
            while not qryAux.EOF do
            begin
               if not ContabilizaDesmembramento(iModulo,iEmpresaProp,
                                                qryAux.FieldByName('IDBEM').AsInteger,
                                                qryAux.FieldByName('IDGRUPO').AsInteger,       // iIdGrupoFilho
                                                qryBem.FieldByName('IDGRUPO').AsInteger,       // iIdGrupoPai
                                                qryAux.FieldByName('IDCONJUNTO').AsInteger,    // iIdConjuntoFilho
                                                qryBem.FieldByName('IDCONJUNTO').AsInteger,    // iIdConjuntoPai
                                                qryAux.FieldByName('CODCENTROCUSTO').AsString, // sCCustoFilho
                                                sCCustoPai,                                    // sCCustoPai
                                                dDataMov,
                                                qryAux.FieldByName('VALORG').AsFloat,
                                                qryAux.FieldByName('CMBEM').AsFloat,
                                                qryAux.FieldByName('DEPLANC').AsFloat,
                                                qryAux.FieldByName('CMDEP').AsFloat,
                                                qryAux.FieldByName('DESBEM').AsString,         // Descrição do Filho
                                                qryBem.FieldByName('DESBEM').AsString,         // Descrição do Pai
                                                sAtivProjeto,'R',
                                                qryAux.FieldByName('CODSUBCONTA').AsInteger,
                                                qryAux.FieldByName('PLACA').AsString,          // Placa do Filho
                                                qryBem.FieldByName('PLACA').AsString,          // Placa do Pai
                                                bMostraMsg) then
                  Raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               qryAux.Next;
            end;
            //----------------------------------------------------------------------------
            // Contabiliza Acrescimo
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT B.IDBEM,B.IDGRUPO,B.IDCONJUNTO,C.IDLOCALIZACAO,L.CODCENTROCUSTO, '+
                               '        A.VALORG, A.DEPLANC, A.CMBEM, A.CMDEP, B.DESBEM, B.UNIDNEGOC, '+
                               '        B.CODSUBCONTA, B.PLACA, B.REGISTRO '+
                               ' FROM ACRESCIMOVALOR A,'+
                               '      BEM B, '+
                               '      CONJUNTO C, '+
                               '      LOCALIZACAO L '+
                               ' WHERE (A.IDBEM = '+inttostr(aIdBemResult[iProcBem])+') '+
                               '   AND (A.IDPESSOA = '+inttostr(iEmpresaProp)+') '+
                               '   AND (A.IDBEM = B.IDBEM) ' +
                               '   AND (A.IDPESSOA = B.IDPESSOA) '+
                               '   AND (B.IDCONJUNTO = C.IDCONJUNTO) '+
                               '   AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO)';
            qryAux.Open;
            while not qryAux.EOF do
            begin
               if not ContabilizaDesmembramento(iModulo,iEmpresaProp,
                                                qryAux.FieldByName('IDBEM').AsInteger,
                                                qryAux.FieldByName('IDGRUPO').AsInteger,       // iIdGrupoFilho
                                                qryBem.FieldByName('IDGRUPO').AsInteger,       // iIdGrupoPai
                                                qryAux.FieldByName('IDCONJUNTO').AsInteger,    // iIdConjuntoFilho
                                                qryBem.FieldByName('IDCONJUNTO').AsInteger,    // iIdConjuntoPai
                                                qryAux.FieldByName('CODCENTROCUSTO').AsString, // sCCustoFilho
                                                sCCustoPai,                                    // sCCustoPai
                                                dDataMov,
                                                qryAux.FieldByName('VALORG').AsFloat,
                                                qryAux.FieldByName('CMBEM').AsFloat,
                                                qryAux.FieldByName('DEPLANC').AsFloat,
                                                qryAux.FieldByName('CMDEP').AsFloat,
                                                qryAux.FieldByName('DESBEM').AsString,         // Descrição do Filho
                                                qryBem.FieldByName('DESBEM').AsString,         // Descrição do Pai
                                                sAtivProjeto,'A',
                                                qryAux.FieldByName('CODSUBCONTA').AsInteger,
                                                qryAux.FieldByName('PLACA').AsString,          // Placa do Filho
                                                qryBem.FieldByName('PLACA').AsString,          // Placa do Pai
                                                bMostraMsg) then
                  Raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               qryAux.Next;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Planilha Contábil
         //-------------------------------------------------------------------------------
         iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                               dDataMov, sMensagem, bMostraMsg);
         if iPlanilha <= 0 then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         // Registra no Historico a Planilha Gerada
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM = '+inttostr(iBem)+') '+
                            '   AND (IDPESSOA = '+inttostr(iEmpresaProp)+') '+
                            '   AND (IDTIPOMOVIMENTACAO = 13)';
         qryAux.Open;
         with dtmAtivoFixo.qryHistCtb do
         begin
            ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            ParamByName('PPLNCODIGO').AsInteger := iPlanilha;
            ExecSQL;
         end;
         //-------------------------------------------------------------------------------
         for iProcBem := 0 to (iQtdBens - 1) do
         begin
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                               ' FROM HISTORICOMOVIMENTACAO '+
                               ' WHERE (IDBEM = '+inttostr(aIdBemResult[iProcBem])+') '+
                               '   AND (IDPESSOA = '+inttostr(iEmpresaProp)+') ';
            qryAux.Open;
            with dtmAtivoFixo.qryHistCtb do
            begin
               ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               ParamByName('PPLNCODIGO').AsInteger := iPlanilha;
               ExecSQL;
            end;
         end;
      end else
      begin
         iPlanilha := 0;
      end;
      dtmAtivoFixo.qryMontaCtb.Close;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM dos Bens Gerados pelo Desmembramento
      //----------------------------------------------------------------------------------
      for iProcBem := 0 to (iQtdBens - 1) do
      begin
         if not AtualizaSaldoContabBem(Sistema.IdModulo,iEmpresaProp,aIdBemResult[iProcBem],
                                       dDataMov,0,0,0,0,0,0,0,0,0,0,0,0,
                                       qryBem.FieldByName('IDGRUPO').AsInteger,
                                       qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                       qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM do Bem Desmembrado
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(Sistema.IdModulo,iEmpresaProp,iBem,
                                    dDataMov,0,0,0,0,0,0,0,0,0,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      DecimalSeparator := cSeparador;
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Desmembramento do Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que contabiliza o Desmembramento
//----------------------------------------------------------------------------------------
function TAtivoFixo.ContabilizaDesmembramento(iModulo,iPessoa,iBem,
                                              iGrupoFilho,iGrupoPai,
                                              iConjuntoFilho,iConjuntoPai : Integer;
                                              sCCustoFilho, sCCustoPai : String;
                                              dDataLanc : TDate;
                                              fBaixaB,fBaixaCMB,fBaixaD,fBaixaCMD : Extended;
                                              sDesBemFilho, sDesBemPai,
                                              sAtivProjeto, sTipoTab : String;
                                              iSubConta : Integer;
                                              sPlacaFilho, sPlacaPai : String;
                                              bMostraMsg : Boolean) : Boolean;

type
   tRateio = Record
      CENTROCUSTOPAI  : String;
      CENTROCUSTOFILHO   : String;
      PARTICIPACAOPAI : Extended;
      PARTICIPACAOFILHO  : Extended;
   end;

var
   aCcRD                                  : array [1..25] of tRateio;
   iMaxCcRD, iCcRD, iCcRDAtual, iCcRDNovo : Integer;
   //-------------------------------------------------------------------------------------
   iTipoMov1, iTipoMov2, iTipoMov3,
   iTipoMov4, iPlanoConta                 : Integer;
   fValLanc, fValLancDeb, fValLancCre,
   fParticip1, fParticip2,
   fParticip3, fParticip4, fParticip5,
   fParticip6, fParticip7, fParticip8,
   fFatorDeb, fFatorCre                   : Extended;
   sMensErro, sDebito, sCredito,
   sDebitoCM, sCreditoCM,
   sDebitoD, sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCC, sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre      : String;
   qryCcRD                                : TwwQuery;
   bProcessar                             : Boolean;

begin
   try
      qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
      //----------------------------------------------------------------------------------
      if sTipoTab = 'B' then
      begin
         iTipoMov1 := 01;
         iTipoMov2 := 15;
         iTipoMov3 := 14;
         iTipoMov4 := 21;
         sMensErro := '';
      end else
      if sTipoTab = 'R' then
      begin
         if fBaixaB > 0 then
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
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Se for reavaliacao negativa, inverter o tipo de lançamento
      //----------------------------------------------------------------------------------
      if fBaixaB <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Entrada do Custo do Bem Filho
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoFilho,iTipoMov1,'D',iPlanoConta,sDebito)
         else
            Localiza_ContaContabil(iGrupoFilho,iTipoMov1,'C',iPlanoConta,sDebito);
         //-------------------------------------------------------------------------------
         if sDebito = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoFilho);
            raise Exception.Create('Conta a Débito para o Movimento de Entrada por Desmembramento do Custo no Grupo ' + sGrupo +
                                   ' não cadastrada !'+sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Baixa do Custo do Bem Pai
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoPai,iTipoMov1,'D',iPlanoConta,sCredito)
         else
            Localiza_ContaContabil(iGrupoPai,iTipoMov1,'C',iPlanoConta,sCredito);
         //-------------------------------------------------------------------------------
         if sCredito = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoPai);
            raise Exception.Create('Conta a Crédito para o Movimento de Baixa por Desmembramento do Custo no Grupo ' + sGrupo +
                                   ' não cadastrada !'+sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      if fBaixaCMB <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Entrada da Correção Monetária do Custo
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoFilho,iTipoMov2,'D',iPlanoConta,sDebitoCM)
         else
            Localiza_ContaContabil(iGrupoFilho,iTipoMov2,'C',iPlanoConta,sDebitoCM);
         //-------------------------------------------------------------------------------
         if sDebitoCM = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoFilho);
            raise Exception.Create('Conta a Débito para o Movimento de Entrada por Desmembramento da Correção Monetária do Custo no Grupo '
                                   + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Baixa da Correção Monetária do Custo
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoPai,iTipoMov2,'D',iPlanoConta,sCreditoCM)
         else
            Localiza_ContaContabil(iGrupoPai,iTipoMov2,'C',iPlanoConta,sCreditoCM);
         //-------------------------------------------------------------------------------
         if sCreditoCM = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoPai);
            raise Exception.Create('Conta a Crédito para o Movimento de Baixa por Desmembramento da Correção Monetária do Custo no Grupo '
                                   + sGrupo + ' não cadastrada !');
         end;
      end;
      //----------------------------------------------------------------------------------
      if fBaixaD <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Entrada da Depreciação Acumulada do Bem Filho
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoPai,iTipoMov3,'C',iPlanoConta,sDebitoD)
         else
            Localiza_ContaContabil(iGrupoPai,iTipoMov3,'D',iPlanoConta,sDebitoD);
         //-------------------------------------------------------------------------------
         if sDebitoD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoPai);
            raise Exception.Create('Conta a Débito para o Movimento de Entrada por Desmembramento da Depreciação Acumulada no Grupo ' +
                                   sGrupo + ' não cadastrada !' + sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Baixa da Depreciação Acumulada do Bem Pai
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoFilho,iTipoMov3,'C',iPlanoConta,sCreditoD)
         else
            Localiza_ContaContabil(iGrupoFilho,iTipoMov3,'D',iPlanoConta,sCreditoD);
         //-------------------------------------------------------------------------------
         if sCreditoD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoFilho);
            raise Exception.Create('Conta a Crédito para o Movimento de Baixa por Desmembramento da Depreciação Acumulada no Grupo ' +
                                   sGrupo + ' não cadastrada !' + sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      if fBaixaCMD <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Entrada da Correção Monetária da Depreciacao
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoFilho,iTipoMov4,'C',iPlanoConta,sDebitoCMD)
         else
            Localiza_ContaContabil(iGrupoFilho,iTipoMov4,'D',iPlanoConta,sDebitoCMD);
         //-------------------------------------------------------------------------------
         if sDebitoCMD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoFilho);
            raise Exception.Create('Conta a Débito para o Movimento de Entrada por Desmembramento da Correção Monetária da ' +
                                   'Depreciação Acumulada no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro);
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Baixa da Correção Monetária da Depreciacao
         //-------------------------------------------------------------------------------
         if iTipoMov1 <> 23 then
            Localiza_ContaContabil(iGrupoPai,iTipoMov4,'C',iPlanoConta,sCreditoCMD)
         else
            Localiza_ContaContabil(iGrupoPai,iTipoMov4,'D',iPlanoConta,sCreditoCMD);
         //-------------------------------------------------------------------------------
         if sCreditoCMD = '' then
         begin
            sGrupo := Busca_Grupo(iPessoa,iGrupoPai);
            raise Exception.Create('Conta a Crédito para o Movimento de Baixa por Desmembramento da Correção Monetária da ' +
                                   'Depreciação Acumulada no Grupo ' + sGrupo + ' não cadastrada !' + sMensErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Transfere para arrays os rateios de custo, para permitir que as transferências de
      // valores entre centros de custo sejam possíveis sem afetar a transação
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoPai;
      qryCcRD.Open;
      iMaxCcRD := 1;
      while not qryCcRD.EOF do
      begin
         aCcRD[iMaxCcRD].CENTROCUSTOPAI  := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
         aCcRD[iMaxCcRD].PARTICIPACAOPAI := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
         aCcRD[iMaxCcRD].CENTROCUSTOFILHO   := '';
         aCcRD[iMaxCcRD].PARTICIPACAOFILHO  := 0;
         iMaxCcRD := iMaxCcRD + 1;
         qryCcRD.Next;
      end;
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjuntoFilho;
      qryCcRD.Open;
      iCcRD := 1;
      while not qryCcRD.EOF do
      begin
         aCcRD[iCcRD].CENTROCUSTOFILHO  := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
         aCcRD[iCcRD].PARTICIPACAOFILHO := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
         iCcRD := iCcRD + 1;
         if iCcRD > iMaxCcRD then
         begin
            iMaxCcRD := iCcRD;
            aCcRD[iMaxCcRD].CENTROCUSTOPAI  := '';
            aCcRD[iMaxCcRD].PARTICIPACAOPAI := 0;
         end;
         qryCcRD.Next;
      end;
      qryCcRD.Close;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      sHistor    := 'Desmembramento de Bem ';
      sHistor1   := trim(sPlacaPai) + '-' + trim(sDesBemPai);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      fParticip1 := 0;
      fParticip2 := 0;
      fParticip3 := 0;
      fParticip4 := 0;
      fParticip5 := 0;
      fParticip6 := 0;
      fParticip7 := 0;
      fParticip8 := 0;
      //----------------------------------------------------------------------------------
      // Processa o Rateio por Centro de Custo e Lança na Planilha Temporária
      //----------------------------------------------------------------------------------
      iCcRD := 1;
      while iCcRD < iMaxCcRD do
      begin
         //-------------------------------------------------------------------------------
         // Custo
         //-------------------------------------------------------------------------------
         if fBaixaB <> 0 then
         begin
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo do Custo de Aquisição do Bem Filho
            //----------------------------------------------------------------------------
            if fParticip1 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  sCCDeb     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                  fParticip1 := aCcRD[iCcRD].PARTICIPACAOFILHO;
               end else
               begin
                  sCCDeb     := '';
                  fParticip1 := 100;
               end;
               fFatorDeb := fParticip1 / 100;
            end else
            begin
               fFatorDeb := 0;
            end;
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo do Custo de Aquisição do Bem Pai
            //----------------------------------------------------------------------------
            if fParticip2 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  sCCCre     := aCcRD[iCcRD].CENTROCUSTOPAI;
                  fParticip2 := aCcRD[iCcRD].PARTICIPACAOPAI;
               end else
               begin
                  sCCCre     := '';
                  fParticip2 := 100;
               end;
               fFatorCre := fParticip2 / 100;
            end else
            begin
               fFatorCre := 0;
            end;
            //----------------------------------------------------------------------------
            fValLancDeb := fBaixaB * fFatorDeb;
            fValLancCre := fBaixaB * fFatorCre;
            //----------------------------------------------------------------------------
            sHistor3 := 'Tranferencia do Custo de Aquisicao';
            if fValLancDeb = fValLancCre then
            begin
               //-------------------------------------------------------------------------
               // Lançamento em Partida Dobrada
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCCDeb, sCCCre ,sAtivProjeto,
                                            sDebito, sCredito, sNumDoc, fValLancDeb,
                                            iGrupoFilho, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end else
            begin
               //-------------------------------------------------------------------------
               // Lançamento a Débito
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCCDeb , '', sAtivProjeto,
                                            sDebito, '', sNumDoc, fValLancDeb,
                                            iGrupoFilho, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, '',
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               // Lançamento a Crédito
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            '', sCCCre ,sAtivProjeto,
                                            '', sCredito, sNumDoc, fValLancCre,
                                            iGrupoPai, iPlanoConta, iSubConta,
                                            sNomeContaDeb, '',
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Correção Monetária
         //-------------------------------------------------------------------------------
         if fBaixaCMB <> 0 then
         begin
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Correção Monetária do Custo do Bem Filho
            //----------------------------------------------------------------------------
            if fParticip3 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCM,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  sCCDeb     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                  fParticip3 := aCcRD[iCcRD].PARTICIPACAOFILHO;
               end else
               begin
                  sCCDeb     := '';
                  fParticip3 := 100;
               end;
               fFatorDeb := fParticip3 / 100;
            end else
            begin
               fFatorDeb := 0;
            end;
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Correção Monetária do Custo do Bem Pai
            //----------------------------------------------------------------------------
            if fParticip4 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCM,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  sCCCre     := aCcRD[iCcRD].CENTROCUSTOPAI;
                  fParticip4 := aCcRD[iCcRD].PARTICIPACAOPAI;
               end else
               begin
                  sCCCre     := '';
                  fParticip4 := 100;
               end;
               fFatorCre := fParticip4 / 100;
            end else
            begin
               fFatorCre := 0;
            end;
            //----------------------------------------------------------------------------
            fValLancDeb := fBaixaCMB * fFatorDeb;
            fValLancCre := fBaixaCMB * fFatorCre;
            //----------------------------------------------------------------------------
            sHistor3 := 'Tranferencia da Correcao Monetaria do Custo de Aquisicao';
            if fValLancDeb = fValLancCre then
            begin
               //-------------------------------------------------------------------------
               // Lançamento em Partida Dobrada
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCCDeb, sCCCre ,sAtivProjeto,
                                            sDebitoCM, sCreditoCM, sNumDoc, fValLancDeb,
                                            iGrupoFilho, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end else
            begin
               //-------------------------------------------------------------------------
               // Lançamento a Débito
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCCDeb , '', sAtivProjeto,
                                            sDebitoCM, '', sNumDoc, fValLancDeb,
                                            iGrupoFilho, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, '',
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               // Lançamento a Crédito
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            '', sCCCre ,sAtivProjeto,
                                            '', sCreditoCM, sNumDoc, fValLancCre,
                                            iGrupoPai, iPlanoConta, iSubConta,
                                            sNomeContaDeb, '',
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Depreciacao
         //-------------------------------------------------------------------------------
         if fBaixaD <> 0 then
         begin
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Depreciacao Acumulada do Bem Pai
            //----------------------------------------------------------------------------
            if fParticip5 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoD,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  sCCDeb     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                  fParticip5 := aCcRD[iCcRD].PARTICIPACAOFILHO;
               end else
               begin
                  sCCDeb     := '';
                  fParticip5 := 100;
               end;
               fFatorDeb := fParticip5 / 100;
            end else
            begin
               fFatorDeb := 0;
            end;
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Depreciacao Acumulada do Bem Filho
            //----------------------------------------------------------------------------
            if fParticip6 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoD,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  sCCCre     := aCcRD[iCcRD].CENTROCUSTOPAI;
                  fParticip6 := aCcRD[iCcRD].PARTICIPACAOPAI;
               end else
               begin
                  sCCCre     := '';
                  fParticip6 := 100;
               end;
               fFatorCre := fParticip6 / 100;
            end else
            begin
               fFatorCre := 0;
            end;
            //----------------------------------------------------------------------------
            fValLancDeb := fBaixaD * fFatorDeb;
            fValLancCre := fBaixaD * fFatorCre;
            //----------------------------------------------------------------------------
            sHistor3 := 'Tranferencia da Depreciacao Acumulada';
            if fValLancDeb = fValLancCre then
            begin
               //-------------------------------------------------------------------------
               // Lançamento em Partida Dobrada
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCCDeb, sCCCre ,sAtivProjeto,
                                            sDebitoD, sCreditoD, sNumDoc, fValLancDeb,
                                            iGrupoFilho, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end else
            begin
               //-------------------------------------------------------------------------
               // Lançamento a Débito
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCCDeb , '', sAtivProjeto,
                                            sDebitoD, '', sNumDoc, fValLancDeb,
                                            iGrupoPai, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, '',
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               // Lançamento a Crédito
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            '', sCCCre ,sAtivProjeto,
                                            '', sCreditoD, sNumDoc, fValLancCre,
                                            iGrupoFilho, iPlanoConta, iSubConta,
                                            sNomeContaDeb, '',
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Correção Monetária da Depreciacao
         //-------------------------------------------------------------------------------
         if fBaixaCMD <> 0 then
         begin
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Correção Monetária da Depreciacao do Bem Pai
            //----------------------------------------------------------------------------
            if fParticip7 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebitoCMD,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  sCCDeb     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                  fParticip7 := aCcRD[iCcRD].PARTICIPACAOFILHO;
               end else
               begin
                  sCCDeb     := '';
                  fParticip7 := 100;
               end;
               fFatorDeb := fParticip7 / 100;
            end else
            begin
               fFatorDeb := 0;
            end;
            //----------------------------------------------------------------------------
            // Rateio por Centro de Custo da Correção Monetária da Depreciacao do Bem Filho
            //----------------------------------------------------------------------------
            if fParticip8 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, sCreditoCMD,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  sCCCre     := aCcRD[iCcRD].CENTROCUSTOPAI;
                  fParticip8 := aCcRD[iCcRD].PARTICIPACAOPAI;
               end else
               begin
                  sCCCre     := '';
                  fParticip8 := 100;
               end;
               fFatorCre := fParticip8 / 100;
            end else
            begin
               fFatorCre := 0;
            end;
            //----------------------------------------------------------------------------
            fValLancDeb := fBaixaCMD * fFatorDeb;
            fValLancCre := fBaixaCMD * fFatorCre;
            //----------------------------------------------------------------------------
            sHistor3 := 'Tranferencia da Correcao Monetaria da Depreciacao';
            if fValLancDeb = fValLancCre then
            begin
               //----------------------------------------------------------------------
               // Lançamento em Partida Dobrada
               //----------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCCDeb, sCCCre ,sAtivProjeto,
                                            sDebitoCMD, sCreditoCMD, sNumDoc, fValLancDeb,
                                            iGrupoFilho, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end else
            begin
               //-------------------------------------------------------------------------
               // Lançamento a Débito
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            sCCDeb , '', sAtivProjeto,
                                            sDebitoCMD, '', sNumDoc, fValLancDeb,
                                            iGrupoPai, iPlanoConta, iSubConta,
                                            sNomeContaDeb, sObrigaSubContaDeb,
                                            sNomeContaCre, '',
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               // Lançamento a Crédito
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                            '', sCCCre ,sAtivProjeto,
                                            '', sCreditoCMD, sNumDoc, fValLancCre,
                                            iGrupoFilho, iPlanoConta, iSubConta,
                                            sNomeContaDeb, '',
                                            sNomeContaCre, sObrigaSubContaCre,
                                            iBem, iPessoa, 0, bMostraMsg) then
                  raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         iCcRD := iCcRD + 1;
      end;
      //----------------------------------------------------------------------------------
      result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
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
      On E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
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
   qryAcrescimo                   : TwwQuery;
   bTransacao, bRemovePlanContab,
   bNovoPlnCodigo                 : Boolean;
   iExercicio,iPeriodo, iTotPlan,
   iPlan ,iResult, iAux           : Integer;
   sMensagem, sMascara            : String;
   aPlanilha                      : array of Integer;
   aDataMov                       : array of tDateTime;

begin
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not (dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryUltMov.Prepared          then qryUltMov.Prepare;
         if not qryBem.Prepared             then qryBem.Prepare;
         if not qryReavaliacao.Prepared     then qryReavaliacao.Prepare;
         if not qryAcrescimo.Prepared       then qryAcrescimo.Prepare;
         if not qryBensResultantes.Prepared then qryBensResultantes.Prepare;
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
               qryUltMov.Close;
               Raise Exception.Create('Existe movimentação após o Desmembramento.' + #13 +
                                      'Consulte Histórico de Movimentações!');
            end;
            qryBensResultantes.Next;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Estorna a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      if EstornaDepreciacao(iModulo,iEmpresaProp,iBem,(dDataMov - 1),dDataEst,bMostraMsg) < 0 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Remove a entrada dos bens resultantes
      //----------------------------------------------------------------------------------
      iTotPlan := 0;
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
            // Captura as planilhas contábeis
            //----------------------------------------------------------------------------
            if IntegraContab(iEmpresaProp) then
            begin
               if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                          sMensagem,bMostraMsg) then
               begin
                  qryAux.Close;
                  qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,DATAMOVIMENTACAO,PLNCODIGO '+
                                     ' FROM   HISTORICOMOVIMENTACAO '+
                                     ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ') '+
                                     '   AND (IDBEM    = ' + qryBensResultantes.FieldByName('IDBEM').AsString + ') ';
                  qryAux.Open;
                  while not qryAux.EOF do
                  begin
                     bNovoPlnCodigo := True;
                     iAux := 0;
                     while iAux <= (iTotPlan - 1) do
                     begin
                        if aPlanilha[iAux] = qryAux.FieldByName('PLNCODIGO').AsInteger then
                           bNovoPlnCodigo := False;
                        iAux := iAux + 1;
                     end;
                     if bNovoPlnCodigo then
                     begin
                        iTotPlan := iTotPlan + 1;
                        SetLength(aPlanilha,iTotPlan);
                        SetLength(aDataMov,iTotPlan);
                        aPlanilha[iTotPlan - 1] := qryAux.FieldByName('PLNCODIGO').AsInteger;
                        aDataMov[iTotPlan - 1]  := qryAux.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                     end;
                     qryAux.Next;
                  end;
                  //----------------------------------------------------------------------
                  // RETIRA O LINK DA PLANILHA CONTÁBIL
                  //----------------------------------------------------------------------
                  qryAux.Close;
                  qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                                     ' SET PLNCODIGO = NULL '+
                                     ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                                     '                          FROM HISTORICOMOVIMENTACAO'+
                                     '                          WHERE (IDBEM    = ' + qryBensResultantes.FieldByName('IDBEM').AsString + ')' +
                                     '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + '))';
                  qryAux.ExecSQL;
               end else
                  Raise Exception.Create(MensagemErro);
            end;
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
               if qryEstornaAcrescValor.RowsAffected <= 0 then
                  Raise Exception.Create('Não foi possível remover os lançamentos no historico dos acrescimos de valor dos bens gerados!');
               qryEstornaAcrescimo.ParamByName('PIDPESSOA').AsInteger       := iEmpresaProp;
               qryEstornaAcrescimo.ParamByName('PIDBEM').AsInteger          := qryBensResultantes.FieldByName('IDBEM').AsInteger;
               qryEstornaAcrescimo.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryEstornaAcrescimo.ExecSQL;
               if qryEstornaAcrescimo.RowsAffected <= 0 then
                  Raise Exception.Create('Não foi possível remover os lançamentos cadastrais dos acrescimos de valor dos bens gerados!');
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
               qryEstornaReavaliacao.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryEstornaReavaliacao.ExecSQL;
               qryAux.Next;
               if qryEstornaReavaliacao.RowsAffected <= 0 then
                  Raise Exception.Create('Não foi possível remover os lançamentos cadastrais das reavaliações dos bens gerados!');
            end;
            //----------------------------------------------------------------------------
            // Remove os Registros de Movimentacao Inicial do Bem
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                               ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                               '   AND (IDBEM    = ' + qryBensResultantes.FieldByName('IDBEM').AsString + ')';
            qryAux.ExecSQL;
            if qryAux.RowsAffected <= 0 then
               Raise Exception.Create('Não foi possível remover os lançamentos no histórico dos bens gerados!');
            //----------------------------------------------------------------------------
            // Remove os Lançamentos da tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' DELETE FROM SALDOCONTABBEM ' +
                               ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                               '   AND (IDBEM    = ' + qryBensResultantes.FieldByName('IDBEM').AsString + ')';
            qryAux.ExecSQL;
            if qryAux.RowsAffected <= 0 then
               Raise Exception.Create('Não foi possível remover os saldos contábeis dos bens gerados!');
            //----------------------------------------------------------------------------
            // Remove o Bem
            //----------------------------------------------------------------------------
            qryEstornaBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryEstornaBem.ParamByName('PIDBEM').AsInteger    := qryBensResultantes.FieldByName('IDBEM').AsInteger;
            qryEstornaBem.ExecSQL;
            if qryEstornaBem.RowsAffected <= 0 then
               Raise Exception.Create('Não foi possível remover os lançamentos cadastrais dos bens gerados!');
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
         Raise Exception.Create('Os parâmetros relativos ao bem estão incorretos!');
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            //----------------------------------------------------------------------------
            // Pesquisa planilha contábil
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,DATAMOVIMENTACAO,PLNCODIGO '+
                               ' FROM   HISTORICOMOVIMENTACAO '+
                               ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ') '+
                               '   AND (IDBEM    = ' + inttostr(iBem) + ') '+
                               '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                               '   AND (IDTIPOMOVIMENTACAO IN (13,25,24,26,20,28,27,29,37,38,39,40))';
            qryAux.Open;
            while not qryAux.EOF do
            begin
               bNovoPlnCodigo := True;
               iAux := 0;
               while iAux <= (iTotPlan - 1) do
               begin
                  if aPlanilha[iAux] = qryAux.FieldByName('PLNCODIGO').AsInteger then
                     bNovoPlnCodigo := False;
                  iAux := iAux + 1;
               end;
               if bNovoPlnCodigo then
               begin
                  iTotPlan := iTotPlan + 1;
                  SetLength(aPlanilha,iTotPlan);
                  SetLength(aDataMov,iTotPlan);
                  aPlanilha[iTotPlan - 1] := qryAux.FieldByName('PLNCODIGO').AsInteger;
                  aDataMov[iTotPlan - 1]  := qryAux.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               end;
               qryAux.Next;
            end;
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET PLNCODIGO = NULL '+
                               ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                               '                          FROM HISTORICOMOVIMENTACAO'+
                               '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                               '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                               '                            AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                               '                            AND (IDTIPOMOVIMENTACAO IN (13,25,24,26,20,28,27,29,37,38,39,40)))';
            qryAux.ExecSQL;
         end else
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Estorna as planilhas contábeis
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         bRemovePlanContab := RemovePlanContab(iEmpresaProp);
         //-------------------------------------------------------------------------------
         iPlan := 0;
         while iPlan <= (iTotPlan - 1) do
         begin
            if not bRemovePlanContab then
            begin
               if aPlanilha[iPlan] <> 0 then
               begin
                  iResult := EstornaLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                             datetostr(aDataMov[iPlan]), iExercicio, iPeriodo,
                             iEmpresaProp, sMascara);
                  if iResult = -1 then
                     Raise Exception.Create('Estorno da Planilha Contábil não foi permitido!');
               end;
            end else
            begin
               if aPlanilha[iPlan] <> 0 then
               begin
                  with dtmAtivoFixo.qryParamCaf do
                  begin
                     Close;
                     ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                     Open;
                     //-------------------------------------------------------------------
                     iResult := ExcluiLanc(True, aPlanilha[iPlan], 'BASEDADOS', inttostr(iModulo),
                                           FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                           Sistema.IdUsuario, True, 0, sMascara);
                  end;
                  //----------------------------------------------------------------------
                  if iResult = -1 then
                     Raise Exception.Create('Remoção da Planilha Contábil não foi permitida!');
               end;
            end;
            iPlan := iPlan + 1;
         end;
      end;
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
                            ' FROM DESMEMBRAMENTO '+
                            ' WHERE (IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                            '                           FROM HISTORICOMOVIMENTACAO '+
                            '                           WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '                             AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '                             AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '                             AND (IDTIPOMOVIMENTACAO = 13)))';
         qryAux.ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover o lançamento no historico da baixa do bem gerador! (1)');
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE '+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (13,25,24,26,20,28,27,29,37,38,39,40))';
         qryAux.ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover o lançamento no historico da baixa do bem gerador! (2)');
      end;
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Estorno do Desmembramento do Bem ' + qryBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
       if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(iModulo, iEmpresaProp, iBem,(dDataMov - 1),
                                    0,0,0,0,0,0,0,0,0,0,0,0,
                                    qryBem.FieldByName('IDGRUPO').AsInteger,
                                    qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                    qryBem.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
         Raise Exception.Create(MensagemErro);
      Result := 1
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
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
               Raise Exception.Create('Baixa : ExecutaDepreciacao');
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
         Raise Exception.Create('Entrada : RegistraBem');
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
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if (iSeqHist = -1) then
            Raise Exception.Create('Entrada : RegistraMovimentacao (ValOrg)');
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria Inicial do Bem
         //-------------------------------------------------------------------------------
         if (fCmBem > 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             15, dDataMov, -1,
                                             fCmBem, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create('Entrada : RegistraMovimentacao (CmBem)');
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if (fDepLanc > 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             17, dDataMov, -1,
                                             fDepLanc, fDepFis, fDepGer,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create('Entrada : RegistraMovimentacao (ValDepIni)');
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if (fCmDep > 0) then
         begin
            iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                             21, dDataMov, -1,
                                             fCmDep, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create('Entrada : RegistraMovimentacao');
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
                                             0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create('Entrada : RegistraMovimentacao (ReavValOrg)');
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
               Raise Exception.Create('Reavaliacao : RegistraReavaliacao');
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetaria da Reavaliação do Bem
            //----------------------------------------------------------------------------
            if (fCmBem <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                22, dDataMov, iIdReavaliacao,
                                                fCmBem, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create('Entrada : RegistraMovimentacao (ReavCmBem)');
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
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create('Entrada : RegistraMovimentacao (ReavValDepIni)');
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
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create('Entrada : RegistraMovimentacao (ReavCmDep)');
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
                                             0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create('Acréscimo : RegistraMovimentacao');
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
               Raise Exception.Create('Acréscimo : RegistraReavaliacao');
            //----------------------------------------------------------------------------
            if not RegistraAcresc(iSeqHist,
                                  qryAux.FieldByName('IDTIPODESPESA').AsInteger,
                                  qryAux.FieldByName('OBS').AsString,
                                  bMostraMsg) then
               Raise Exception.Create('Acréscimo : RegistraAcresc');
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetaria da Reavaliação do Bem
            //----------------------------------------------------------------------------
            if (fCmBem <> 0) then
            begin
               iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo,
                                                34, dDataMov, iIdAcrescimo,
                                                fCmBem, 0, 0,
                                                -1,-1,-1,-1,-1,-1,-1,-1,
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create('Entrada : RegistraMovimentacao');
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
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create('Entrada : RegistraMovimentacao');
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
                                                -1,-1,'',0,bMostraMsg);
               if iSeqHist = -1 then
                  Raise Exception.Create('Entrada : RegistraMovimentacao');
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
                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
      if iSeqHist = -1 then
         Raise Exception.Create('Baixa : RegistraMovimentacao - 13');
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
            Raise Exception.Create('Desmembramento : RegistraDesmembramento - 13');
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 25
      //----------------------------------------------------------------------------------
      fBaixaCM := qryBem.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
      if (fBaixaCM <> 0) then
      begin
         iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 25, dDataMov,
                                          -1,
                                          fBaixaCM, 0, 0,
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create('Baixa : RegistraMovimentacao - 25');
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
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create('Baixa : RegistraMovimentacao - 24');
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
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create('Baixa : RegistraMovimentacao - 26');
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
                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
         if iSeqHist = -1 then
            Raise Exception.Create('Baixa : RegistraMovimentacao - 20');
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 28
         //-------------------------------------------------------------------------------
         fBaixaCM := qryReavaliacao.FieldByName('CMBEM').asFloat * (fPropBaixar / 100);
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 28, dDataMov,
                                             qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                             fBaixaCM, 0, 0,
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create('Baixa : RegistraMovimentacao - 28');
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
                                             -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,bMostraMsg);
            if iSeqHist = -1 then
               Raise Exception.Create('Baixa : RegistraMovimentacao - 27');
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
               Raise Exception.Create('Baixa : RegistraMovimentacao - 29');
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
            Raise Exception.Create('Baixa : RegistraMovimentacao - 37');
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
               Raise Exception.Create('Baixa : RegistraMovimentacao - 38');
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
               Raise Exception.Create('Baixa : RegistraMovimentacao - 39');
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
               Raise Exception.Create('Baixa : RegistraMovimentacao - 40');
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
// Função que executa um Lançamento de uma Obra
//----------------------------------------------------------------------------------------
// Parâmetros :
// Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu a Obra (Sistema.idModulo)  (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)      (IDPESSOA)
// iCafObra     : id da Obra                                          (IDCAFOBRA)
// iObraEtapa   : id da Etapa da Obra que está sendo alimentada       (IDCAFOBRATIPOETAPA)
// iGrupo       : id do Grupo Contábil do Lançamento                  (IDGRUPO)
// iSubConta    : id da SubConta do Lancamento                        (CODSUBCONTA)
// iAtivProjeto : id da Atividade/Projeto do Lançamento               (UNIDNEGOC)
// dDtaLanc     : Data do fato que gerou o lançamento na obra         (DTALANCAMENTO)
// fValOfi      : Valor do Acréscimo de Valor em Moeda Corrente       (VALOFI)
// sNumNota,
// sComplNota,
// dDtaNota     : Dados do Documento que origina o lançamento
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function TAtivoFixo.ExecutaLancObra(iModulo, iEmpresaProp, iCafObra, iObraEtapa,
                                    iGrupo, iSubConta, iAtivProjeto : Integer;
                                    dDtaLanc : tDate; fValOfi : Extended;
                                    sNumNota, sComplNota : String;
                                    dDtaNota : tDate; bMostraMsg : Boolean) : LongInt;
var
   iPlanilha, iIdObraLanc,
   iExercicio, iPeriodo       : Integer;
   fValFis, fValGer, fValGerb : Extended;
   bTransacao                 : Boolean;
   sAtivProjeto, sMensagem    : String;
   qryCafObra                 : TwwQuery;

begin
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not (dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryCafObra.Prepared          then qryCafObra.Prepare;
         if not qryRegistraLancObra.Prepared then qryRegistraLancObra.Prepare;
      end;
      //----------------------------------------------------------------------------------
      qryCafObra := TwwQuery(dtmAtivoFixo.qryCafObra);
      //----------------------------------------------------------------------------------
      // Valida os parâmetros obrigatórios para Lançamento de Obra
      //----------------------------------------------------------------------------------
      if dDtaLanc <= 0 then
         Raise Exception.Create('Informe o Data do Lançamento de Obra!');
      //----------------------------------------------------------------------------------
      if iGrupo <= 0 then
         Raise Exception.Create('Informe o Grupo Contábil!');
      //----------------------------------------------------------------------------------
      if iObraEtapa <= 0 then
         Raise Exception.Create('Informe a Etapa da Obra!');
      //----------------------------------------------------------------------------------
      if fValOfi = 0 then
         Raise Exception.Create('Informe o Valor do Lançamento da Obra');
      //----------------------------------------------------------------------------------
      qryCafObra.Close;
      qryCafObra.ParamByName('PIDCAFOBRA').AsInteger := iCafObra;
      qryCafObra.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
      qryCafObra.Open;
      if qryCafObra.IsEmpty then
         Raise Exception.Create('Os parâmetros relativos a Obra estão incorretos!');
      //----------------------------------------------------------------------------------
      if iModulo <= 0 then
         Raise Exception.Create('É obrigatório fornecer o código do MODULO!')
      else
         if iModulo <> qryCafObra.FieldByName('IDMODULO').AsInteger then
            Raise Exception.Create('Somente o módulo que cadastrou a obra pode manipulá-lo');
      //----------------------------------------------------------------------------------
      // Lê os Parâmetros do CAF
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo.qryParamCAF do
      begin
         Close;
         ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         // Calcula os valores fornecidos em moeda fiscal e gerencial
         //-------------------------------------------------------------------------------
         fValFis  := fValOfi / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                             dDtaLanc, bMostraMsg);
         fValGer  := fValOfi / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                             dDtaLanc, bMostraMsg);
         fValGerb := 0;
      end;
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      iPlanilha := -1;
      if IntegraContab(iEmpresaProp) then
      begin
         //-------------------------------------------------------------------------------
         // Busca o Periodo Contábil
         //-------------------------------------------------------------------------------
         if not VerificaPeriodoContabil(iEmpresaProp, dDtaLanc, iExercicio, iPeriodo,
                                        sMensagem,bMostraMsg) then
            Raise Exception.Create(MensagemErro);
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
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if iAtivProjeto <= 0 then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               Close;
               ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
               Open;
               if not IsEmpty then
                  sAtivProjeto := FieldByName('ATIVPROJETO').AsString
               else
                  sAtivProjeto := '';
            end;
         end else
         begin
            sAtivProjeto := inttostr(iAtivProjeto);
         end;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaLancObra(iModulo, iEmpresaProp, iGrupo,
                                          iExercicio, iPeriodo,
                                          qryCafObra.FieldByName('IDCAFOBRA').AsInteger,
                                          dDtaLanc, fValOfi,
                                          qryCafObra.FieldByName('DESCCAFOBRA').AsString,
                                          sAtivProjeto, iSubConta, bMostraMsg);
         dtmAtivoFixo.qryMontaCtb.Close;
         if iPlanilha <= 0 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Registra o Lançamento em CAFOBRALANC
      //----------------------------------------------------------------------------------
      iIdObraLanc := RegistraLancObra(iCafObra, iEmpresaProp, iModulo,
                                      dDtaLanc, iObraEtapa, fValOfi, fValFis,
                                      fValGer, fValGerb, sNumNota, sComplNota,
                                      dDtaNota, iPlanilha, iGrupo, iSubConta,
                                      iAtivProjeto, True);
      if iIdObraLanc = -1 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iIdObraLanc;
   except
      On E : Exception do
      begin
         if bTransacao then
            RollBackTransacao;
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que registra os Lançamentos de Obras
//----------------------------------------------------------------------------------------
function TAtivoFixo.RegistraLancObra(iCafObra, iEmpresaProp, iModulo : Integer;
                                     dDtaLanc : tDate; iObraEtapa : Integer;
                                     fValOfi, fValFis, fValGer, fValGerb : Currency;
                                     sNumNota, sComplNota : String;
                                     dDtaNota : tDate; iPlanilha, iGrupo,
                                     iSubConta, iAtivProjeto : Integer;
                                     bMostraMsg : Boolean) : Integer;
var
   iSeq        : Integer;
   qryLancObra : TwwQuery;

begin
   qryLancObra := TwwQuery(dtmAtivoFixo.qryRegistraLancObra);
   //-------------------------------------------------------------------------------------
   try
      with qryLancObra do
      begin
         iSeq := LeUltRegistro(nil,'CAFOBRALANC');
         //-------------------------------------------------------------------------------
         ParamByName('IDOBRALANC').AsInteger      := iSeq;
         ParamByName('IDCAFOBRA').AsInteger       := iCafObra;
         ParamByName('IDPESSOA').AsInteger        := iEmpresaProp;
         ParamByName('IDOBRATIPOETAPA').AsInteger := iObraEtapa;
         ParamByName('IDGRUPO').AsInteger         := iGrupo;
         //-------------------------------------------------------------------------------
         if iSubConta <= 0 then
            ParamByName('CODSUBCONTA').AsInteger  := iSubConta
         else
            ParamByName('CODSUBCONTA').Clear;
         //-------------------------------------------------------------------------------
         if iAtivProjeto <= 0 then
            ParamByName('UNIDNEGOC').AsInteger    := iAtivProjeto
         else
            ParamByName('UNIDNEGOC').Clear;
         //-------------------------------------------------------------------------------
         if iPlanilha <> -1 then
            ParamByName('PLNCODIGO').AsInteger    := iPlanilha
         else
            ParamByName('PLNCODIGO').Clear;
         //-------------------------------------------------------------------------------
         if dDtaNota <> -1 then
            ParamByName('DTANOTA').AsDateTime     := dDtaNota
         else
            ParamByName('DTANOTA').Clear;
         //-------------------------------------------------------------------------------
         ParamByName('NUMNOTA').AsString          := sNumNota;
         ParamByName('COMPLNOTA').AsString        := sComplNota;
         ParamByName('DTALANCAMENTO').AsDateTime  := dDtaLanc;
         ParamByName('VALOFI').AsCurrency         := fValOfi;
         ParamByName('VALFIS').AsCurrency         := fValFis;
         ParamByName('VALGER').AsCurrency         := fValGer;
         ParamByName('VALGERB').AsCurrency        := fValGerb;
         //-------------------------------------------------------------------------------
         ExecSQL;
      end;
      Result := iSeq;
   //-------------------------------------------------------------------------------------
   except
      On E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que Contabiliza os Lançamentos de Obras
//----------------------------------------------------------------------------------------
Function TAtivoFixo.ContabilizaLancObra(iModulo, iPessoa, iGrupo,
                                        iExercicio, iPeriodo, iCafObra : Integer;
                                        dDataLanc : TDate;
                                        fValor : Extended;
                                        sDescCafObra,sAtivProjeto : String;
                                        iSubConta : Integer;
                                        bMostraMsg : Boolean) : Integer;
const
   iTipoMovimentacao = 67;

var
   iPlanoConta, iPlanilha              : Integer;
   fValLanc, fParticip1                : Extended;
   sDebito, sCredito,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre,
   sMensagem                           : String;
   qryCcRO                             : TwwQuery;

begin
   try
      qryCcRO := TwwQuery(dtmAtivoFixo.qryCcRO);
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Entrada do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMovimentacao,'D',iPlanoConta,sDebito);
      //----------------------------------------------------------------------------------
      if sDebito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a Débito para o Lançamento de Valores em Obras no Grupo ' + sGrupo +
                                ' não cadastrada !');
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Entrada do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupo,iTipoMovimentacao,'C',iPlanoConta,sCredito);
      //----------------------------------------------------------------------------------
      if sCredito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupo);
         raise Exception.Create('Conta a crédito para o Lançamento de Valores em Obras no Grupo' + sGrupo +
                                ' não cadastrada !');
      end;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      sHistor    := 'Lançamentos em Obras';
      sHistor1   := trim(sDescCafObra);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      fParticip1 := 0;
      //----------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //----------------------------------------------------------------------------------
      qryCcRO.Close;
      qryCcRO.ParamByName('PIDPESSOA').AsInteger  := iPessoa;
      qryCcRO.ParamByName('PIDCAFOBRA').AsInteger := iCafObra;
      qryCcRO.Open;
      //----------------------------------------------------------------------------------
      qryCcRO.First;
      while not qryCcRO.EOF do
      begin
         if fParticip1 < 100 then
         begin
            //----------------------------------------------------------------------------
            // Montagem da Partida Dobrada do Custo
            //----------------------------------------------------------------------------
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa a Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRO.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb     := qryCcRO.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRO.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRO.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRO.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre     := qryCcRO.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRO.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRO.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               fParticip1 := 100;
            //----------------------------------------------------------------------------
            fValLanc := (fValor * fParticip1) / 100;
            //----------------------------------------------------------------------------
            if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                         sCcDeb, sCCCre ,sAtivProjeto,
                                         sDebito, sCredito, sNumDoc, abs(fValLanc),
                                         iGrupo, iPlanoConta, iSubConta,
                                         sNomeContaDeb, sObrigaSubContaDeb,
                                         sNomeContaCre, sObrigaSubContaCre,
                                         iCafObra, iPessoa, 1, bMostraMsg) then
               raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         qryCcRO.Next;
      end;
      qryCcRO.Close;
      //----------------------------------------------------------------------------------
      iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                            dDataLanc, sMensagem, bMostraMsg);
      if iPlanilha <= 0 then
         raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      Result := iPlanilha;
   except
      on E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que executa o estorno de um lançamento de valor em Obra
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu a Obra (Sistema.idModulo) (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)     (IDPESSOA)
// iCafObra     : id da Obra                                         (IDCAFOBRA)
// dDataMov     : Data da Movimentação                               (DTALANCAMENTO)
// dDataEst     : Data do Estorno
// iObraLanc    : id do Lançamento de Obra a ser removido            (IDOBRALANC)
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function tAtivoFixo.EstornaLancObra(iModulo, iEmpresaProp, iCafObra : Integer;
                                    dDataMov, dDataEst : tDate;
                                    iObraLanc : Integer;
                                    bMostraMsg : boolean) : Integer;
const
   iTipoMovimentacao = 67;                                 // Codigo de Lançamento de Obra

var
   iPlnCodigo, iResult,
   iExercicio,iPeriodo              : Integer;
   sMascara,sMensagem               : String;
   qryAux, qryCafObra, qryLancObra  : TwwQuery;
   bTransacao                       : Boolean;

begin
   bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not (dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryUltMov.Prepared   then qryUltMov.Prepare;
         if not qryCafObra.Prepared  then qryCafObra.Prepare;
         if not qryLancObra.Prepared then qryLancObra.Prepare;
      end;
      //-------------------------------------------------------------------------------------
      qryCafObra   := TwwQuery(dtmAtivoFixo.qryCafObra);
      qryLancObra  := TwwQuery(dtmAtivoFixo.qryLancObra);
      qryAux       := TwwQuery(dtmAtivoFixo.qryAux);
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela CAFOBRA
      //----------------------------------------------------------------------------------
      qryCafObra.Close;
      qryCafObra.ParamByName('PIDCAFOBRA').AsInteger := iCafObra;
      qryCafObra.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
      qryCafObra.Open;
      if qryCafObra.IsEmpty then
         Raise Exception.Create('Os parâmetros relativos a Obra estão incorretos!');
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela CAFOBRALANC
      //----------------------------------------------------------------------------------
      qryLancObra.Close;
      qryLancObra.ParamByName('PIDCAFOBRA').AsInteger := iCafObra;
      qryLancObra.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
      qryLancObra.Open;
      if qryLancObra.IsEmpty then
         Raise Exception.Create('Os parâmetros relativos a Obra estão incorretos!');
      //----------------------------------------------------------------------------------
      if not (qryLancObra.Locate('IDOBRALANC',iObraLanc,[])) then
         Raise Exception.Create('Código do lançamento inválido para essa Obra!');
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT PLNCODIGO'+
                         ' FROM CAFOBRALANC '+
                         ' WHERE (IDCAFOBRA  = ' + inttostr(iCafObra) + ')' +
                         '   AND (IDPESSOA   = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (IDOBRALANC = ' + inttostr(iObraLanc) + ')' ;
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
      qryAux.SQL.Text := ' UPDATE CAFOBRALANC ' +
                         ' SET PLNCODIGO = NULL '+
                         ' WHERE (IDCAFOBRA  = ' + inttostr(iCafObra) + ')' +
                         '   AND (IDPESSOA   = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (IDOBRALANC = ' + inttostr(iObraLanc) + ')' ;
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
                  Raise Exception.Create('Estorno da Planilha Contábil não foi permitido!');
            end else
            begin
               //-------------------------------------------------------------------------
               with dtmAtivoFixo.qryParamCaf do
               begin
                  Close;
                  ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                  Open;
                  //----------------------------------------------------------------------
                  iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                        FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                        Sistema.IdUsuario, True, 0, sMascara);
               end;
               if iResult = -1 then
                  Raise Exception.Create('Remoção da Planilha Contábil não foi permitida!');
            end;
         end else
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE FROM CAFOBRALANC '+
                            ' WHERE (IDOBRALANC = ' + inttostr(iObraLanc) + ')';
         qryAux.ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover o lançamento selecionado do histórico!');
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      Result := 1;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que executa o Encerramento de uma Obra com a entrada de um bem no Ativo Fixo
//----------------------------------------------------------------------------------------
//    iModulo         - id do módulo responsável pela inclusão            (IDMODULO)
//    iEmpresaProp    - id da empresa proprietária                        (IDPESSOA)
//    iCafObra        - id da Obra                                        (IDCAFOBRA)
//    iConjunto       - id do conjunto ao qual o bem pertence             (IDCONJUNTO)
//    iGrupo          - id do grupo                                       (IDGRUPO)
//    iSubConta       - id da subconta                                    (CODSUBCONTA)
//    iAtivProjeto    - id da Atividade/Projeto associada ao bem          (UNIDNEGOC)
//    iClasseBem      - id da classificacao do bem                        (IDCLASSEBEM)
//    fPlaca          - número de tombamento do bem                       (PLACA)
//    iSituacao       - id da situação patrimonial do bem                 (IDSITUACAO)
//    sDescBem        - Descrição do Bem                                  (DESBEM)
//    dDataInclusao   - Data de Encerramento da Obra e de inclusão do bem (DTAINCLUSAO)
//    fValOrg         - valor do bem na moeda oficial atual               (VALORG)
//    dDataIniDep     - data de inicio da depreciacao                     (DATAINICIODEP)
//    fTaxaDep        - taxa de depreciacao anual                         (TAXADEP)
//
//    bMostraMsg : True  - mostra mensagens
//                 False - não mostra mensagens
//
//========================================================================================
function tAtivoFixo.ExecutaEncerraObra(iModulo,iEmpresaProp,iCafObra,iConjunto,iGrupo,iGrupoObra,
                                       iSubConta, iAtivProjeto, iClasseBem : integer; fPlaca : double;
                                       iSituacao : integer; sDescBem : string;
                                       dDataInclusao : tDateTime; fValOrg : double;
                                       dDataIniDep : tDateTime; fTaxaDep : double;
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
   fPropBaixa, fCmBem, fValIniDep, fCmDep,
   fValHist, fDepLanc, fPrioridade                   : Extended;
   bTransacao                                        : Boolean;
   //-------------------------------------------------------------------------------------
   iFornec, iIdBemAlt, iTerceiro, iItensRecDev,
   iImagem                                           : Integer;
   sRegistro, sControle, sIdNota, sNumSerie,
   sIdOpcional, sProcessoAquis, sEmpenhoAquis,
   sPubAutor, sComplNota, sPubEditora, sPubAno       : String;
   dDataInstalacao, dDataFimGar, dDtaContab,
   dDataNota                                         : tDateTime;
   bFlgBemIntContab                                  : Boolean;

begin
   bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryBem.Prepared                  then qryBem.Prepare;
         if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
         if not qryGrupos.Prepared               then qryGrupos.Prepare;
         if not qryConjunto.Prepared             then qryConjunto.Prepare;
         if not qryPessoa.Prepared               then qryPessoa.Prepare;
         if not qryClasseBem.Prepared            then qryClasseBem.Prepare;
         if not qrySubConta.Prepared             then qrySubConta.Prepare;
         if not qrySituacao.Prepared             then qrySituacao.Prepare;
      end;
      //----------------------------------------------------------------------------------
      // Preenche variáveis com valores padronizados
      //----------------------------------------------------------------------------------
      iTipoMovimentacao := 68;               // Movimento Entrada por Encerramento de Obra
      sRegistro         := 'O';
      sControle         := 'T';
      iFornec           := -1;
      iTerceiro         := -1;
      sBaixaTotal       := 'N';
      fPropBaixa        := 0;
      iIdBemAlt         := -1;
      fCmBem            := 0;
      fValIniDep        := 0;
      fCmDep            := 0;
      iItensRecDev      := -1;
      iImagem           := -1;
      sIdNota           := '';
      sComplNota        := '';
      dDataNota         := -1;
      sNumSerie         := '';
      fValHist          := fValOrg;
      fDepLanc          := 0;
      fPrioridade       := 0;
      dDataInstalacao   := -1;
      dDataFimGar       := -1;
      sIdOpcional       := '';
      sProcessoAquis    := '';
      sEmpenhoAquis     := '';
      sPubAutor         := '';
      sPubEditora       := '';
      sPubAno           := '';
      dDtaContab        := dDataInclusao;
      bFlgBemIntContab  := IntegraContab(iEmpresaProp);
      //----------------------------------------------------------------------------------
      // Valida os parâmetros obrigatórios para a entrada do bem gerado
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if (iModulo <= 0) then
         begin
            MensagemErro := 'É obrigatório fornecer o código do MODULO!';
            Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         if iEmpresaProp <= 0 then
         begin
            MensagemErro := 'É obrigatório fornecer o código da EMPRESA PROPRIETÁRIA!';
            Raise Exception.Create(MensagemErro);
         end else
         begin
            qryPessoa.Close;
            qryPessoa.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryPessoa.Open;
            if qryPessoa.isEmpty then
            begin
               MensagemErro := 'Código da EMPRESA PROPRIETÁRIA inválido ou não cadastrado!';
               Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if iCafObra <= 0 then
         begin
            MensagemErro := 'É obrigatório informar a OBRA!';
            Raise Exception.Create(MensagemErro);
         end else
         begin
            qryCafObra.Close;
            qryCafObra.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
            qryCafObra.ParamByName('PIDCAFOBRA').AsInteger := iCafObra;
            qryCafObra.Open;
            if qryCafObra.isEmpty then
            begin
               MensagemErro := 'OBRA inexistente ou inválida!';
               Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if iConjunto <= 0 then
         begin
            MensagemErro := 'É obrigatório fornecer o código do CONJUNTO do bem!';
            Raise Exception.Create(MensagemErro);
         end else
         begin
            qryConjunto.Close;
            qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
            qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
            qryConjunto.Open;
            if qryConjunto.isEmpty then
            begin
               MensagemErro := 'Código do CONJUNTO do bem inexistente ou inválido!';
               Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if iGrupo <= 0 then
         begin
            MensagemErro := 'É obrigatório fornecer o código do GRUPO do bem!';
            Raise Exception.Create(MensagemErro);
         end else
         begin
            qryGrupos.Close;
            qryGrupos.ParamByName('PIDGRUPO').AsInteger := iGrupo;
            qryGrupos.Open;
            if qryGrupos.isEmpty then
            begin
               MensagemErro := 'Código do GRUPO do bem inexistente ou inválido!';
               Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if iGrupoObra <= 0 then
         begin
            MensagemErro := 'É obrigatório fornecer o código do GRUPO da Obra que irá gerar o bem!';
            Raise Exception.Create(MensagemErro);
         end else
         begin
            qryGrupos.Close;
            qryGrupos.ParamByName('PIDGRUPO').AsInteger := iGrupoObra;
            qryGrupos.Open;
            if qryGrupos.isEmpty then
            begin
               MensagemErro := 'Código do GRUPO da Obra que irá gerar o bem inexistente ou inválido!';
               Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if iClasseBem <= 0 then
         begin
            MensagemErro := 'É obrigatório fornecer o código da CLASSE do bem!';
            Raise Exception.Create(MensagemErro);
         end else
         begin
            qryClasseBem.Close;
            qryClasseBem.ParamByName('PIDCLASSEBEM').AsInteger := iClasseBem;
            qryClasseBem.Open;
            if qryClasseBem.isEmpty then
            begin
               MensagemErro := 'Código de CLASSE de bem inexistente ou inválido!';
               Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if iSubConta > 0 then
         begin
            qrySubConta.Close;
            qrySubConta.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
            qrySubConta.ParamByName('PIDSUBCONTA').AsInteger := iSubConta;
            qrySubConta.Open;
            if qrySubConta.isEmpty then
            begin
               MensagemErro := 'Código de SubConta inexistente ou inválido!';
               Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if fPlaca <= 0 then
         begin
            if qryGrupos.FieldByName('FLGSEMPLACA').AsInteger = 0 then
            begin
               MensagemErro := 'É obrigatório fornecer o Número de TOMBAMENTO do bem!';
               Raise Exception.Create(MensagemErro);
            end;
         end else
         begin
            if VerificaPlaca(fPlaca,bMostraMsg) > 0 then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         if iSituacao <= 0 then
         begin
            MensagemErro := 'É obrigatório fornecer a ID da SITUAÇÃO do bem!';
            Raise Exception.Create(MensagemErro);
         end else
         begin
            qrySituacao.Close;
            qrySituacao.ParamByName('PIDSITUACAO').AsInteger := iSituacao;
            qrySituacao.Open;
            if qrySituacao.isEmpty then
            begin
               MensagemErro := 'ID da SITUAÇÃO do bem inválido ou inexistente!';
               Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         if sDescBem = '' then
         begin
            MensagemErro := 'É obrigatório fornecer a DESCRIÇÃO do bem!';
            Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         if fValOrg = 0 then
         begin
            MensagemErro := 'O VALOR do CUSTO da OBRA não foi Informado!';
            Raise Exception.Create(MensagemErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Lê a Atividade/Projeto da Tabela de Parâmetros Globais
      //----------------------------------------------------------------------------------
      if iAtivProjeto <= 0 then
      begin
         with dtmAtivoFixo.qryParamCAF do
         begin
            Close;
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
      //----------------------------------------------------------------------------------
      // Lê os parâmetros do CAF e converte para as moedas fiscais e gerenciais
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo.qryParamCAF do
      begin
         Close;
         ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         // Calcula os valores fornecidos em moeda fiscal e gerencial
         //-------------------------------------------------------------------------------
         fValFis := fValOrg / Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                            dDataInclusao, bMostraMsg);
         fValGer := fValOrg / Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                            dDataInclusao, bMostraMsg);
      end;
      //----------------------------------------------------------------------------------
      // Registra a Entrada do Bem Gerado
      //----------------------------------------------------------------------------------
      iIdBem := RegistraEntrada(iIdBemAlt,iModulo,iEmpresaProp,iConjunto,iTerceiro,iGrupo,iSubConta,
                iAtivProjeto,iClasseBem,iItensRecDev,iFornec,iImagem,fPlaca,iSituacao,
                sRegistro,sControle,sDescBem,sIdNota,sComplNota,sNumSerie,dDataNota,
                dDataInclusao,fValHist,fValOrg,fCmBem,dDataIniDep,fValIniDep,fTaxaDep,
                fDepLanc,fCmDep,fPropBaixa,fPrioridade,dDataInstalacao,dDataFimGar,fValFis,
                fValGer,fDepFis,fDepGer,sBaixaTotal,sIdOpcional,sProcessoAquis,
                sEmpenhoAquis,sPubAutor,sPubEditora,sPubAno,bFlgBemIntContab,dDtaContab,
                bMostraMsg);
      if iIdBem = -1 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      iPlanilha := -1;
      if IntegraContab(iEmpresaProp) then
      begin
         if not VerificaPeriodoContabil(iEmpresaProp,dDtaContab,iExercicio,iPeriodo,
                                        sMensagem,bMostraMsg) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
            if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
            if not qryConta.Prepared      then qryConta.Prepare;
            if not qryCCrd.Prepared       then qryCCrd.Prepare;
            if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
            if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
            if not qryMontaCtb.Active     then qryMontaCtb.Open;
         end;
         //-------------------------------------------------------------------------------
         iPlanilha := ContabilizaEncerraObra(iModulo, iEmpresaProp, iIdBem, iConjunto,
                                             iGrupoObra, iGrupo, iExercicio, iPeriodo,
                                             dDataInclusao, fValOrg,
                                             sDescBem, sAtivProjeto, iSubConta,
                                             floattostr(fPlaca), bMostraMsg);
         dtmAtivoFixo.qryMontaCtb.Close;
         //-------------------------------------------------------------------------------
         if iPlanilha <= 0 then
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Entrada do Bem
      //----------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 1,
                                       dDataInclusao, -1,
                                       fValOrg, fValFis, fValGer,
                                       -1,-1,-1,-1,-1,-1,iPlanilha,-1,-1,-1,'',0,bMostraMsg);
      if iSeqHist = -1 then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Registra o Link com HISTMOVIMBEM e atualiza CAFOBRA
      //----------------------------------------------------------------------------------
      if not RegistraEncerraObra(iSeqHist, iEmpresaProp, iCafObra, dDataInclusao, bMostraMsg) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtualizaSaldoContabBem(Sistema.IdModulo,iEmpresaProp,iIdBem,dDataInclusao,
                                    fValOrg,0,0,0,0,0,0,0,0,0,0,0,
                                    iGrupo,
                                    dtmAtivoFixo.qryConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                    dtmAtivoFixo.qryConjunto.FieldByName('IDRESPONSAVEL').AsInteger,0) then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      Result := iIdBem;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que registra o Encerramento da Obra
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iSeqHist        : id da Movimentacao que gerou o bem            (IDMOVIMENTACAO)
//    iEmpresaProp    : id da Empresa Proprietária do Bem             (IDPESSOA)
//    iCafObra        : id da Obra                                    (IDCAFOBRA)
//    dDtaEncerraObra : Id da Reavaliacao Baixada (0 se for Baixa do Bem)
//
//    bMostraMsg      : True  - mostra mensagens
//                      False - não mostra mensagens
//----------------------------------------------------------------------------------------
function TAtivoFixo.RegistraEncerraObra(iSeqHist, iEmpresaProp, iCafObra : Integer;
                                        dDtaEncerraObra : tDate;
                                        bMostraMsg : Boolean) : Boolean;

var
   qryHistEncObra, qryEncObra : TwwQuery;

begin
   qryEncObra     := TwwQuery(dtmAtivoFixo.qryEncerraObra);
   qryHistEncObra := TwwQuery(dtmAtivoFixo.qryHistEncerraObra);
   //-------------------------------------------------------------------------------------
   try
      with qryHistEncObra do
      begin
         ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         ParamByName('PIDCAFOBRA').AsInteger      := iCafObra;
         ExecSQL;
      end;
      //----------------------------------------------------------------------------------
      with qryEncObra do
      begin
         ParamByName('PIDCAFOBRA').AsInteger       := iCafObra;
         ParamByName('PIDPESSOA').AsInteger        := iEmpresaProp;
         ParamByName('PDTAENCERRAOBRA').AsDateTime := dDtaEncerraObra;
         ParamByName('PFLGOBRA').AsInteger         := 1;
         ExecSQL;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MensagemErro := 'Erro no registro do encerramento da obra' + #13 + #13 + E.Message;
      end;
   end;
end;
//========================================================================================
// Função que executa o estorno do encerramento de obra
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iCafObra     : id da Obra                                        (IDCAFOBRA)
// iBem         : id do Bem Gerado                                  (IDBEM)
// dDataMov     : Data do Encerramento da Obra                      (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function tAtivoFixo.EstornaEncerraObra(iModulo, iEmpresaProp, iCafObra, iBem : Integer;
                                       dDataMov, dDataEst : tDate;
                                       bMostraMsg : boolean) : Integer;
var
   iResult,
   iExercicio,iPeriodo           : Integer;
   sMascara,sMensagem            : String;
   qryAux, qryEncObra            : TwwQuery;
   bTransacao, bRemovePlanContab : Boolean;
   aPlanilha                     : array [1..12] of Integer;
   aDataMov                      : array [1..12] of tDateTime;
   iTotPlan, iPlan               : Integer;

begin
   bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      if not dtmAtivoFixo.qryBem.Prepared then dtmAtivoFixo.qryBem.Prepare;
      //----------------------------------------------------------------------------------
      qryAux     := TwwQuery(dtmAtivoFixo.qryAux);
      qryEncObra := TwwQuery(dtmAtivoFixo.qryEncerraObra);
      //----------------------------------------------------------------------------------
      // Posiciona a tabela BEM
      //----------------------------------------------------------------------------------
      dtmAtivoFixo.qryBem.Close;
      dtmAtivoFixo.qryBem.ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
      dtmAtivoFixo.qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      dtmAtivoFixo.qryBem.Open;
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após sua entrada
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                         ' FROM   HISTORICOMOVIMENTACAO ' +
                         ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (IDTIPOMOVIMENTACAO <> 01)  /* ENTRADA TOTAL                                      */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 03)  /* ENTRADA FISICA                                     */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 68)  /* ENTRADA POR OBRA                                   */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 17)  /* INCLUSAO DE DEPRECIACAO                            */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 15)  /* CORRECAO MONETARIA                                 */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 21)  /* CORRECAO MONETARIA DA DEPRECIACAO                  */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 32)  /* INCLUSAO DO SALDO DE REAVALIACAO                   */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 33)  /* INCLUSAO DA DEPRECIACAO DO SALDO DE REAVALIACAO    */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 22)  /* CORRECAO MONETARIA DA REAVALIACAO                  */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 19)  /* CORRECAO MONETARIA DA DEPRECIACAO DA REAVALIACAO   */';
      qryAux.Open;
      if not qryAux.IsEmpty then
         Raise Exception.Create('Existe movimentação nos bens gerados. Consulte o Histórico de Movimentações!');
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
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
            while iPlan <= iTotPlan do
            begin
               if not bRemovePlanContab then
               begin
                  iResult := EstornaLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                             datetostr(aDataMov[iPlan]), iExercicio, iPeriodo,
                             iEmpresaProp, sMascara);
                  if iResult = -1 then
                     Raise Exception.Create('Estorno da Planilha Contábil não foi permitido!');
               end else
               begin
                  with dtmAtivoFixo.qryParamCaf do
                  begin
                     Close;
                     ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                     Open;
                     //-------------------------------------------------------------------
                     iResult := ExcluiLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                                           inttostr(Sistema.IdModulo),
                                           FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                           Sistema.IdUsuario, True, 0, sMascara);
                  end;
                  //----------------------------------------------------------------------
                  if iResult = -1 then
                     Raise Exception.Create('Remoção da Planilha Contábil não foi permitida!');
               end;
               iPlan := iPlan + 1;
            end;
         end else
            Raise Exception.Create(MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         //-------------------------------------------------------------------------------
         // Remove os Registros de Movimentacao Inicial do Bem
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                            ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         qryAux.ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível estornar a movimentação inicial do bem!');
         //-------------------------------------------------------------------------------
         // Remove os Registros de Saldos Contábeis do Bem
         //-------------------------------------------------------------------------------
         qryAux.SQL.Text := ' DELETE FROM SALDOCONTABBEM ' +
                            ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         qryAux.ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível estornar o saldo contábil inicial do bem!');
         //-------------------------------------------------------------------------------
         // Remove o Bem
         //-------------------------------------------------------------------------------
         qryEstornaBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qryEstornaBem.ParamByName('PIDBEM').AsInteger    := iBem;
         qryEstornaBem.ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível estornar os dados cadastrais do bem!');
      end;
      //----------------------------------------------------------------------------------
      // Retorna o status da obra
      //----------------------------------------------------------------------------------
      with qryEncObra do
      begin
         ParamByName('PIDCAFOBRA').AsInteger := iCafObra;
         ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
         ParamByName('PFLGOBRA').AsInteger   := 0;
         ParamByName('PDTAENCERRAOBRA').Clear;
         ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível atualizar o status da obra!');
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := 1;
   except
      On E : Exception do
      begin
         Result := -1;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que contabiliza o encerramento da obra, com a entrada do bem resultante
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iModulo        : id do Módulo que incluiu o bem (Sistema.IdModulo)
//    iPessoa        : id da Empresa Proprietária (Sistema.IdEmpresa)
//    iBem           : id do Bem movimentado
//    iGrupoObra     : id do Grupo do Custo da Obra
//    iGrupoBem      : id do Grupo do Bem Gerado
//    dDataLanc      : Data do Encerramento da Obra
//    fBaixaB        : Valor do custo total da obra
//    sDesBem        : Descrição do Bem
//    sAtivProjeto   : Unidade de Negócio
//    iSubConta      : id de SubConta
//    sPlaca         : Placa do Bem Movimentado
//
//    bMostraMsg     : True  - mostra mensagens
//                     False - não mostra mensagens
//----------------------------------------------------------------------------------------
function TAtivoFixo.ContabilizaEncerraObra(iModulo,iPessoa,iBem,iConjunto,
                                           iGrupoObra, iGrupoBem,
                                           iExercicio, iPeriodo  : Integer;
                                           dDataLanc : tDate; fValor : Extended;
                                           sDesBem,sAtivProjeto : String;
                                           iSubConta : Integer; sPlaca : String;
                                           bMostraMsg : Boolean) : Integer;
var
   iPlanoConta, iPlanilha              : Integer;
   fValLanc, fParticip1                : Extended;
   sDebito, sCredito,
   sGrupo, sHistor, sHistor1,
   sHistor2, sHistor3, sHistor4,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre,
   sMensagem                           : String;
   qryCcRD                             : TwwQuery;

begin
   try
      qryCcRD  := TwwQuery(dtmAtivoFixo.qryCcRD);
      //----------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryParamCaf.Close;
         qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iPessoa;
         qryParamCaf.Open;
         iPlanoConta := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Entrada do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupoBem,01,'D',iPlanoConta,sDebito);
      //----------------------------------------------------------------------------------
      if sDebito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupoBem);
         raise Exception.Create('Conta a Débito para o Movimento de Entrada no Grupo ' + sGrupo +
                                ' não cadastrada !');
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Entrada do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaContabil(iGrupoObra,67,'D',iPlanoConta,sCredito);
      //----------------------------------------------------------------------------------
      if sCredito = '' then
      begin
         sGrupo := Busca_Grupo(iPessoa,iGrupoObra);
         raise Exception.Create('Conta a Débito para o Movimento de Lançamentos em Obra no Grupo ' + sGrupo +
                                ' não cadastrada !');
      end;
      //----------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //----------------------------------------------------------------------------------
      sHistor := 'Encerramento de Obra';
      fParticip1 := 0;
      sHistor1   := trim(sPlaca) + '-' + trim(sDesBem);
      sHistor2   := '';
      sHistor3   := '';
      sHistor4   := '';
      sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
      //----------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('PIDEMPRESA').AsInteger  := iPessoa;
      qryCcRD.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         if fParticip1 < 100 then
         begin
            //----------------------------------------------------------------------------
            // Montagem da Partida Dobrada do Custo
            //----------------------------------------------------------------------------
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa a Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sDebito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, sCredito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre     := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  fParticip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               fParticip1 := 100;
            //----------------------------------------------------------------------------
            fValLanc := (fValor * fParticip1) / 100;
            //----------------------------------------------------------------------------
            if not MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                         sCcDeb, sCCCre ,sAtivProjeto,
                                         sDebito, sCredito, sNumDoc, abs(fValLanc),
                                         iGrupoBem, iPlanoConta, iSubConta,
                                         sNomeContaDeb, sObrigaSubContaDeb,
                                         sNomeContaCre, sObrigaSubContaCre,
                                         iBem, iPessoa, 0, bMostraMsg) then
            begin
               raise Exception.Create(MensagemErro);
            end;
         end;
         qryCcRD.Next;
      end;
      qryCcRD.Close;
      //----------------------------------------------------------------------------------
      iPlanilha := RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo,
                                            dDataLanc, sMensagem, bMostraMsg);
      if iPlanilha <= 0 then
         raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      Result := iPlanilha;
   except
      on E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Funcao que verifica se o Ativo Fixo está integrado a Contabilidade
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iEmpresaProp   :   id da Empresa Proprietária (Sistema.idEmpresa)        (IDPESSOA)
//========================================================================================
function TAtivoFixo.IntegraContab(iEmpresaProp : Integer) : boolean;
begin
   dtmAtivoFixo.qryParamCaf.Close;
   dtmAtivoFixo.qryParamCaf.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   dtmAtivoFixo.qryParamCaf.Open;
   //-------------------------------------------------------------------------------------
   if (Sistema.IdModulo = 54) or (Sistema.IdModulo = 64) or (Sistema.IdModulo = 135) then
   begin
      if (not dtmAtivoFixo.qryParamCaf.IsEmpty) and
         (dtmAtivoFixo.qryParamCaf.FieldByName('INTEGRACONTAB').AsString = 'S') and
         (dtmAtivoFixo.qryParamCaf.FieldByName('FLGINTCAFCONT').AsInteger = 1) then
         Result := True
      else
         Result := False;
   end else
      if (not dtmAtivoFixo.qryParamCaf.IsEmpty) and
         (dtmAtivoFixo.qryParamCaf.FieldByName('INTEGRACONTAB').AsString = 'S') then
         Result := True
      else
         Result := False;
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
      Close;
      ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      Open;
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
Procedure TAtivoFixo.Localiza_ContaContabil(iGrupo,
                                            iTipoMovimentacao: Integer;
                                            sDebCred : String;
                                            iPlano : Integer;
                                            var sPlaConta : String);

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
end;
//========================================================================================
// Função que retorna a descrição de um grupo
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
// Verifica o periodo contábil
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
             MensagemErro := 'Período Contábil inexistente ! Impossível gerar lançamento ' +
                             'contábil da movimentação do Bem. Altere a data da movimentação.';
             Result := False;
          end;
      2 : begin
             MensagemErro := 'Período encontrado, mas não é único ! Impossível gerar ' +
                             'lançamento contábil da movimentação do Bem. Altere a data de ' +
                             'movimentação.';
             Result := False;
          end;
      3 : begin
             MensagemErro := 'Período já bloqueado pela Contabilidade ! Impossível gerar ' +
                             'lançamento contábil da movimentação do Bem. Altere a data de ' +
                             'movimentação.';
             Result := False;
          end;
      4 : begin
             MensagemErro := 'Período já bloqueado pela Integração ! Impossível gerar lançamento '+
                             'contábil da movimentação do Bem. Altere a data de movimentação.';
             Result := False;
          end;
      else
          Result := True
   end;
end;
//========================================================================================
// Função que recebe os lancamentos contábeis e os acumula para posterior registro
// em Planilha
//----------------------------------------------------------------------------------------
function TAtivoFixo.MontaPlanilhaContabil(sHistor, sHistor1, sHistor2, sHistor3, sHistor4,
                                          sCcDeb, sCcCre, sAtivProjeto,
                                          sContaDeb, sContaCre, sNumDoc : string;
                                          fValLanc : Extended;
                                          iGrupo, iPlano, iSubConta : Integer;
                                          sNomeContaDeb, sObrigaSubContaDeb,
                                          sNomeContaCre, sObrigaSubContaCre : String;
                                          iBem, iPessoa, iTipoContab : Integer;
                                          bMostraMsg : Boolean) : Boolean;
Var
   iCodSubContaDeb, iCodSubContaCre,
   iPatro, iPlanoPrev                     : Integer;
   fValOfi, fPercRateio                   : Extended;
   sTipoLanc,
   sPlaTipConvOfiDeb, sPlaTipConvOfiCre,
   sPlaTipConvGerDeb, sPlaTipConvGerCre   : String;

begin
   try
      if fValLanc = 0 then
      begin
         Result := True;
         exit;
      end;
      //----------------------------------------------------------------------------------
      fValOfi := fValLanc;
      //----------------------------------------------------------------------------------
      // Verifica se Centro de Custo está associado a Conta Contábil a Debito
      //----------------------------------------------------------------------------------
      if sCcDeb <> '' then
      begin
         with dtmAtivoFixo.qryContasxCc do
         begin
            Close;
            ParamByName('PIDEMPRESA').asInteger      := iPessoa;
            ParamByName('PPLANO').asInteger          := iPlano;
            ParamByName('PPLACONTA').asString        := trim(sContaDeb);
            ParamByName('PCODCENTROCUSTO').asString  := trim(sCcDeb);
            Open;
            if isEmpty then
               Raise Exception.Create('Associe o Centro de Custo ' + sCCDeb + ' à Conta Contábil ' + sContaDeb +
                                      ' no Plano ' + inttostr(iPlano) +
                                      ' usando o Cadastro de Plano de Contas no Sistema Contabilidade!');
         end;
      end;
      //----------------------------------------------------------------------------------
      // Verifica se Centro de Custo está associado a Conta Contábil a Credito
      //----------------------------------------------------------------------------------
      if sCcCre <> '' then
      begin
         with dtmAtivoFixo.qryContasxCc do
         begin
            Close;
            ParamByName('PIDEMPRESA').asInteger      := iPessoa;
            ParamByName('PPLANO').asInteger          := iPlano;
            ParamByName('PPLACONTA').asString        := trim(sContaCre);
            ParamByName('PCODCENTROCUSTO').asString  := trim(sCcCre);
            Open;
            if isEmpty then
               Raise Exception.Create('Associe o Centro de Custo ' + sCCCre +
                                      ' à Conta Contábil ' + sContaCre + ' no Plano ' + inttostr(iPlano) +
                                      ' usando o Cadastro de Plano de Contas no Sistema Contabilidade!');
         end;
      end;
      //----------------------------------------------------------------------------------
      // Verifica se a SubConta está associada a Conta Contábil a Debito
      //----------------------------------------------------------------------------------
      if sObrigaSubContaDeb = 'S' then
      begin
         with dtmAtivoFixo.qryContasxSubC do
         begin
            Close;
            ParamByName('PIDEMPRESA').asInteger   := Sistema.IdEmpresa;
            ParamByName('PPLANO').asInteger       := iPlano;
            ParamByName('PPLACONTA').asString     := sContaDeb;
            ParamByName('PCODSUBCONTA').asInteger := iSubConta;
            Open;
            if isEmpty then
            begin
               if iSubConta <= 0 then
               begin
                  Raise Exception.Create('A SubConta é obrigatória na Conta Contábil ' + sContaDeb +
                                         ' no Plano ' + inttostr(iPlano) + '. Informe-a.');
               end else
               begin
                  Raise Exception.Create('Associe a SubConta ' + inttostr(iSubConta) +
                                         ' à Conta Contábil ' + sContaDeb + ' no Plano ' + inttostr(iPlano) +
                                         ' usando o Cadastro de Plano de Contas no Sistema da Contabilidade');
               end;
            end;
            iCodSubContaDeb := iSubConta;
         end;
      end else
         iCodSubContaDeb := 0;
      //----------------------------------------------------------------------------------
      // Verifica se a SubConta está associada a Conta Contábil a Credito
      //----------------------------------------------------------------------------------
      if sObrigaSubContaCre = 'S' then
      begin
         with dtmAtivoFixo.qryContasxSubC do
         begin
            Close;
            ParamByName('PIDEMPRESA').asInteger   := Sistema.IdEmpresa;
            ParamByName('PPLANO').asInteger       := iPlano;
            ParamByName('PPLACONTA').asString     := sContaCre;
            ParamByName('PCODSUBCONTA').asInteger := iSubConta;
            Open;
            if isEmpty then
            begin
               if iSubConta <= 0 then
               begin
                  Raise Exception.Create('A SubConta é obrigatória na Conta Contábil ' + sContaCre +
                                         ' no Plano ' + inttostr(iPlano) + '. Informe-a.');
               end else
               begin
                  Raise Exception.Create('Associe a SubConta ' + inttostr(iSubConta) +
                                         ' à Conta Contábil ' + sContaCre + ' no Plano ' + inttostr(iPlano) +
                                         ' usando o Cadastro de Plano de Contas no Sistema da Contabilidade');
               end;
            end;
            iCodSubContaCre := iSubConta;
         end;
      end else
         iCodSubContaCre := 0;
      //----------------------------------------------------------------------------------
      // Processa o registro de acordo com o parametro iTIPOCONTAB
      // 0 - Normal
      // 1 - Lançamento em Obra
      // 2 - Desmembramento
      //----------------------------------------------------------------------------------
      if iTipoContab = 0 then
      begin
         //-------------------------------------------------------------------------------
         // Pesquisa o Rateio de PlanoPatrocinadora do Bem para o calculo do rateio.
         // Caso não haja rateio definido, usa o padrão setado nos Parâmetros do Sistema.
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            qryRatPP.Close;
            qryRatPP.ParamByName('PIDBEM').AsInteger     := iBem;
            qryRatPP.ParamByName('PIDEMPRESA').AsInteger := iPessoa;
            qryRatPP.Open;
            //----------------------------------------------------------------------------
            repeat
               if qryRatPP.IsEmpty then
               begin
                  with qryParamCaf do
                  begin
                     Close;
                     ParamByName('PIDPESSOA').asInteger := iPessoa;
                     Open;
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
                  iPatro      := qryRatPP.FieldByName('IDPATRO').AsInteger;
                  iPlanoPrev  := qryRatPP.FieldByName('IDPLANOPREV').AsInteger;
                  fPercRateio := qryRatPP.FieldByName('PPBPERCRATEIO').AsFloat / 100;
               end;
               //-------------------------------------------------------------------------
               // Realiza o registro como partida simples
               //-------------------------------------------------------------------------
               if (qryParamCAF.FieldByName('PACDOBRADA').AsString = 'N') or (sContaDeb = '') or (sContaCre = '') then
               begin
                  fValOfi := abs(fValOfi);
                  //----------------------------------------------------------------------
                  // Realiza o registro da Conta a Debito
                  //----------------------------------------------------------------------
                  if sContaDeb <> '' then
                  begin
                     sTipoLanc := 'D';
                     if not (qryMontaCtb.Locate('PLANO;PLACONTA;LACDEBCRE;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                             VarArrayOf([iPlano,sContaDeb,sTipoLanc,sCcDeb,iCodSubContaDeb,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[])) then
                     begin
                        //----------------------------------------------------------------
                        // Posiciona a tabela PlanoConta para obter informações adicionais
                        // da conta contábil envolvida no lançamento a Débito
                        //----------------------------------------------------------------
                        qryPlanoConta.Close;
                        qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                        qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaDeb;
                        qryPlanoConta.Open;
                        sPlaTipConvOfiDeb := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                        sPlaTipConvGerDeb := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                        //----------------------------------------------------------------
                        qryMontaCtb.Append;
                        qryMontaCtb.FieldByName('PLANO').AsInteger            := iPlano;
                        qryMontaCtb.FieldByName('PLACONTA').AsString          := sContaDeb;
                        qryMontaCtb.FieldByName('LACDEBCRE').AsString         := sTipoLanc;
                        qryMontaCtb.FieldByName('CODCENTROCUSTO').AsString    := sCcDeb;
                        //----------------------------------------------------------------
                        if iCodSubContaDeb <> 0 then
                           qryMontaCtb.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaDeb
                        else
                           qryMontaCtb.FieldByName('CODSUBCONTA').Clear;
                        //----------------------------------------------------------------
                        qryMontaCtb.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                        qryMontaCtb.FieldByName('IDPATRO').AsInteger          := iPatro;
                        qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                        qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').AsString  := sPlaTipConvOfiDeb;
                        qryMontaCtb.FieldByName('PLATIPCONVGERDEB').AsString  := sPlaTipConvGerDeb;
                        qryMontaCtb.FieldByName('PLATIPCONVOFICRE').Clear;
                        qryMontaCtb.FieldByName('PLATIPCONVGERCRE').Clear;
                        qryMontaCtb.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                        qryMontaCtb.FieldByName('LACHIST1').AsString          := sHistor;
                        qryMontaCtb.FieldByName('LACHIST2').AsString          := sHistor1;
                        qryMontaCtb.FieldByName('LACHIST3').AsString          := sHistor2;
                        qryMontaCtb.FieldByName('LACHIST4').AsString          := sHistor3;
                        qryMontaCtb.FieldByName('LACHIST5').AsString          := sHistor4;
                        //----------------------------------------------------------------
                        qryMontaCtb.FieldByName('LACVALOR').AsFloat           := fValOfi * fPercRateio;
                     end else
                     begin
                        qryMontaCtb.Edit;
                        qryMontaCtb.FieldByName('LACVALOR').AsFloat := qryMontaCtb.FieldByName('LACVALOR').AsFloat + (fValOfi * fPercRateio);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Realiza o registro da Conta a Credito
                  //----------------------------------------------------------------------
                  if sContaCre <> '' then
                  begin
                     sTipoLanc := 'C';
                     if not (qryMontaCtb.Locate('PLANO;PLACONTA;LACDEBCRE;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                             VarArrayOf([iPlano,sContaCre,sTipoLanc,sCcCre,iCodSubContaCre,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[])) then
                     begin
                        //----------------------------------------------------------------
                        // Posiciona a tabela PlanoConta para obter informações adicionais
                        // da conta contábil envolvida no lançamento a Credito
                        //----------------------------------------------------------------
                        qryPlanoConta.Close;
                        qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                        qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaCre;
                        qryPlanoConta.Open;
                        sPlaTipConvOfiCre := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                        sPlaTipConvGerCre := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                        //----------------------------------------------------------------
                        qryMontaCtb.Append;
                        qryMontaCtb.FieldByName('PLANO').AsInteger            := iPlano;
                        qryMontaCtb.FieldByName('PLACONTA').AsString          := sContaCre;
                        qryMontaCtb.FieldByName('CODCENTROCUSTO').AsString    := sCcCre;
                        //----------------------------------------------------------------
                        if iCodSubContaCre <> 0 then
                           qryMontaCtb.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaCre
                        else
                           qryMontaCtb.FieldByName('CODSUBCONTA').Clear;
                        //----------------------------------------------------------------
                        qryMontaCtb.FieldByName('LACDEBCRE').AsString         := sTipoLanc;
                        qryMontaCtb.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                        qryMontaCtb.FieldByName('IDPATRO').AsInteger          := iPatro;
                        qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                        qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').Clear;
                        qryMontaCtb.FieldByName('PLATIPCONVGERDEB').Clear;
                        qryMontaCtb.FieldByName('PLATIPCONVOFICRE').AsString  := sPlaTipConvOfiCre;
                        qryMontaCtb.FieldByName('PLATIPCONVGERCRE').AsString  := sPlaTipConvGerCre;
                        qryMontaCtb.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                        qryMontaCtb.FieldByName('LACHIST1').AsString          := sHistor;
                        qryMontaCtb.FieldByName('LACHIST2').AsString          := sHistor1;
                        qryMontaCtb.FieldByName('LACHIST3').AsString          := sHistor2;
                        qryMontaCtb.FieldByName('LACHIST4').AsString          := sHistor3;
                        qryMontaCtb.FieldByName('LACHIST5').AsString          := sHistor4;
                        //----------------------------------------------------------------
                        qryMontaCtb.FieldByName('LACVALOR').AsFloat := fValOfi * fPercRateio;
                     end else
                     begin
                        qryMontaCtb.Edit;
                        qryMontaCtb.FieldByName('LACVALOR').AsFloat := qryMontaCtb.FieldByName('LACVALOR').AsFloat + (fValOfi * fPercRateio);
                     end;
                  end;
               end else
               //-------------------------------------------------------------------------
               // Realiza o registro como PARTIDA DOBRADA
               //-------------------------------------------------------------------------
               begin
                  if not (qryMontaCtb.Locate('PLANO;PLACONTADEB;PLACONTACRE;CODCENTROCUSTODEB;CODCENTROCUSTOCRE;CODSUBCONTADEB;CODSUBCONTACRE;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                          VarArrayOf([iPlano,sContaDeb,sContaCre,sCcDeb,sCcCre,iCodSubContaDeb,iCodSubContaCre,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[])) then
                  begin
                     //-------------------------------------------------------------------
                     // Posiciona a tabela PlanoConta para obter informações adicionais
                     // da conta contábil envolvida no lançamento a Débito
                     //-------------------------------------------------------------------
                     qryPlanoConta.Close;
                     qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                     qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaDeb;
                     qryPlanoConta.Open;
                     sPlaTipConvOfiDeb := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                     sPlaTipConvGerDeb := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                     //-------------------------------------------------------------------
                     // Posiciona a tabela PlanoConta para obter informações adicionais
                     // da conta contábil envolvida no lançamento a Credito
                     //-------------------------------------------------------------------
                     qryPlanoConta.Close;
                     qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                     qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaCre;
                     qryPlanoConta.Open;
                     sPlaTipConvOfiCre := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                     sPlaTipConvGerCre := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                     //-------------------------------------------------------------------
                     qryMontaCtb.Append;
                     qryMontaCtb.FieldByName('PLANO').AsInteger            := iPlano;
                     qryMontaCtb.FieldByName('PLACONTADEB').AsString       := sContaDeb;
                     qryMontaCtb.FieldByName('PLACONTACRE').AsString       := sContaCre;
                     qryMontaCtb.FieldByName('CODCENTROCUSTODEB').AsString := sCcDeb;
                     qryMontaCtb.FieldByName('CODCENTROCUSTOCRE').AsString := sCcCre;
                     //-------------------------------------------------------------------
                     if iCodSubContaDeb <> 0 then
                        qryMontaCtb.FieldByName('CODSUBCONTADEB').AsInteger := iCodSubContaDeb
                     else
                        qryMontaCtb.FieldByName('CODSUBCONTADEB').Clear;
                     //-------------------------------------------------------------------
                     if iCodSubContaCre <> 0 then
                        qryMontaCtb.FieldByName('CODSUBCONTACRE').AsInteger := iCodSubContaCre
                     else
                        qryMontaCtb.FieldByName('CODSUBCONTACRE').Clear;
                     //-------------------------------------------------------------------
                     qryMontaCtb.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                     qryMontaCtb.FieldByName('IDPATRO').AsInteger          := iPatro;
                     qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                     qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').AsString  := sPlaTipConvOfiDeb;
                     qryMontaCtb.FieldByName('PLATIPCONVGERDEB').AsString  := sPlaTipConvGerDeb;
                     qryMontaCtb.FieldByName('PLATIPCONVOFICRE').AsString  := sPlaTipConvOfiCre;
                     qryMontaCtb.FieldByName('PLATIPCONVGERCRE').AsString  := sPlaTipConvGerCre;
                     qryMontaCtb.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                     qryMontaCtb.FieldByName('LACHIST1').AsString          := sHistor;
                     qryMontaCtb.FieldByName('LACHIST2').AsString          := sHistor1;
                     qryMontaCtb.FieldByName('LACHIST3').AsString          := sHistor2;
                     qryMontaCtb.FieldByName('LACHIST4').AsString          := sHistor3;
                     qryMontaCtb.FieldByName('LACHIST5').AsString          := sHistor4;
                     //-------------------------------------------------------------------
                     qryMontaCtb.FieldByName('LACVALOR').AsFloat := fValOfi * fPercRateio;
                  end else
                  begin
                     qryMontaCtb.Edit;
                     qryMontaCtb.FieldByName('LACVALOR').AsFloat := qryMontaCtb.FieldByName('LACVALOR').AsFloat + (fValOfi * fPercRateio);
                  end;
               end;
               //-------------------------------------------------------------------------
               if not qryRatPP.IsEmpty then
                  qryRatPP.Next;
               //-------------------------------------------------------------------------
            until qryRatPP.EOF;
         end;
      end else
      //----------------------------------------------------------------------------------
      // Contabilização de lançamentos em Obra
      //----------------------------------------------------------------------------------
      if iTipoContab = 1 then
      begin
         fValOfi := abs(fValOfi);
         //-------------------------------------------------------------------------------
         // Pesquisa o Rateio de PlanoPatrocinadora do Bem para o calculo do rateio.
         // Caso não haja rateio definido, usa o padrão setado nos Parâmetros do Sistema.
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            with qryParamCaf do
            begin
               Close;
               ParamByName('PIDPESSOA').asInteger := iPessoa;
               Open;
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
            //----------------------------------------------------------------------------
            // Realiza o registro como partida simples
            //----------------------------------------------------------------------------
            if (qryParamCAF.FieldByName('PACDOBRADA').AsString = 'N') then
            begin
               //-------------------------------------------------------------------------
               // Realiza o registro da Conta a Debito
               //-------------------------------------------------------------------------
               sTipoLanc := 'D';
               if not (qryMontaCtb.Locate('PLANO;PLACONTA;LACDEBCRE;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                       VarArrayOf([iPlano,sContaDeb,sTipoLanc,sCcDeb,iCodSubContaDeb,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[])) then
               begin
                  //----------------------------------------------------------------------
                  // Posiciona a tabela PlanoConta para obter informações adicionais
                  // da conta contábil envolvida no lançamento a Débito
                  //----------------------------------------------------------------------
                  qryPlanoConta.Close;
                  qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                  qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaDeb;
                  qryPlanoConta.Open;
                  sPlaTipConvOfiDeb := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                  sPlaTipConvGerDeb := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                  //----------------------------------------------------------------------
                  qryMontaCtb.Append;
                  qryMontaCtb.FieldByName('PLANO').AsInteger            := iPlano;
                  qryMontaCtb.FieldByName('PLACONTA').AsString          := sContaDeb;
                  qryMontaCtb.FieldByName('LACDEBCRE').AsString         := sTipoLanc;
                  qryMontaCtb.FieldByName('CODCENTROCUSTO').AsString    := sCcDeb;
                  //----------------------------------------------------------------------
                  if iCodSubContaDeb <> 0 then
                     qryMontaCtb.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaDeb
                  else
                     qryMontaCtb.FieldByName('CODSUBCONTA').Clear;
                  //----------------------------------------------------------------------
                  qryMontaCtb.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                  qryMontaCtb.FieldByName('IDPATRO').AsInteger          := iPatro;
                  qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                  qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').AsString  := sPlaTipConvOfiDeb;
                  qryMontaCtb.FieldByName('PLATIPCONVGERDEB').AsString  := sPlaTipConvGerDeb;
                  qryMontaCtb.FieldByName('PLATIPCONVOFICRE').Clear;
                  qryMontaCtb.FieldByName('PLATIPCONVGERCRE').Clear;
                  qryMontaCtb.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                  qryMontaCtb.FieldByName('LACHIST1').AsString          := sHistor;
                  qryMontaCtb.FieldByName('LACHIST2').AsString          := sHistor1;
                  qryMontaCtb.FieldByName('LACHIST3').AsString          := sHistor2;
                  qryMontaCtb.FieldByName('LACHIST4').AsString          := sHistor3;
                  qryMontaCtb.FieldByName('LACHIST5').AsString          := sHistor4;
                  //----------------------------------------------------------------------
                  qryMontaCtb.FieldByName('LACVALOR').AsFloat           := fValOfi * fPercRateio;
               end else
               begin
                  qryMontaCtb.Edit;
                  qryMontaCtb.FieldByName('LACVALOR').AsFloat := qryMontaCtb.FieldByName('LACVALOR').AsFloat + (fValOfi * fPercRateio);
               end;
               //-------------------------------------------------------------------------
               // Realiza o registro da Conta a Credito
               //-------------------------------------------------------------------------
               sTipoLanc := 'C';
               if not (qryMontaCtb.Locate('PLANO;PLACONTA;LACDEBCRE;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                       VarArrayOf([iPlano,sContaCre,sTipoLanc,sCcCre,iCodSubContaCre,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[])) then
               begin
                  //----------------------------------------------------------------------
                  // Posiciona a tabela PlanoConta para obter informações adicionais
                  // da conta contábil envolvida no lançamento a Credito
                  //----------------------------------------------------------------------
                  qryPlanoConta.Close;
                  qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                  qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaCre;
                  qryPlanoConta.Open;
                  sPlaTipConvOfiCre := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                  sPlaTipConvGerCre := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                  //----------------------------------------------------------------------
                  qryMontaCtb.Append;
                  qryMontaCtb.FieldByName('PLANO').AsInteger            := iPlano;
                  qryMontaCtb.FieldByName('PLACONTA').AsString          := sContaCre;
                  qryMontaCtb.FieldByName('CODCENTROCUSTO').AsString    := sCcCre;
                  //----------------------------------------------------------------------
                  if iCodSubContaCre <> 0 then
                     qryMontaCtb.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaCre
                  else
                     qryMontaCtb.FieldByName('CODSUBCONTA').Clear;
                  //----------------------------------------------------------------------
                  qryMontaCtb.FieldByName('LACDEBCRE').AsString         := sTipoLanc;
                  qryMontaCtb.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                  qryMontaCtb.FieldByName('IDPATRO').AsInteger          := iPatro;
                  qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                  qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').Clear;
                  qryMontaCtb.FieldByName('PLATIPCONVGERDEB').Clear;
                  qryMontaCtb.FieldByName('PLATIPCONVOFICRE').AsString  := sPlaTipConvOfiCre;
                  qryMontaCtb.FieldByName('PLATIPCONVGERCRE').AsString  := sPlaTipConvGerCre;
                  qryMontaCtb.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                  qryMontaCtb.FieldByName('LACHIST1').AsString          := sHistor;
                  qryMontaCtb.FieldByName('LACHIST2').AsString          := sHistor1;
                  qryMontaCtb.FieldByName('LACHIST3').AsString          := sHistor2;
                  qryMontaCtb.FieldByName('LACHIST4').AsString          := sHistor3;
                  qryMontaCtb.FieldByName('LACHIST5').AsString          := sHistor4;
                  //----------------------------------------------------------------------
                  qryMontaCtb.FieldByName('LACVALOR').AsFloat := fValOfi * fPercRateio;
               end else
               begin
                  qryMontaCtb.Edit;
                  qryMontaCtb.FieldByName('LACVALOR').AsFloat := qryMontaCtb.FieldByName('LACVALOR').AsFloat + (fValOfi * fPercRateio);
               end;
            end else
            //----------------------------------------------------------------------------
            // Realiza o registro como partida dobrada
            //----------------------------------------------------------------------------
            begin
               if not (qryMontaCtb.Locate('PLANO;PLACONTADEB;PLACONTACRE;CODCENTROCUSTODEB;CODCENTROCUSTOCRE;CODSUBCONTADEB;CODSUBCONTACRE;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                       VarArrayOf([iPlano,sContaDeb,sContaCre,sCcDeb,sCcCre,iCodSubContaDeb,iCodSubContaCre,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[])) then
               begin
                  //----------------------------------------------------------------------
                  // Posiciona a tabela PlanoConta para obter informações adicionais
                  // da conta contábil envolvida no lançamento a Débito
                  //----------------------------------------------------------------------
                  qryPlanoConta.Close;
                  qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                  qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaDeb;
                  qryPlanoConta.Open;
                  sPlaTipConvOfiDeb := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                  sPlaTipConvGerDeb := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                  //----------------------------------------------------------------------
                  // Posiciona a tabela PlanoConta para obter informações adicionais
                  // da conta contábil envolvida no lançamento a Credito
                  //----------------------------------------------------------------------
                  qryPlanoConta.Close;
                  qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                  qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaCre;
                  qryPlanoConta.Open;
                  sPlaTipConvOfiCre := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                  sPlaTipConvGerCre := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                  //----------------------------------------------------------------------
                  qryMontaCtb.Append;
                  qryMontaCtb.FieldByName('PLANO').AsInteger            := iPlano;
                  qryMontaCtb.FieldByName('PLACONTADEB').AsString       := sContaDeb;
                  qryMontaCtb.FieldByName('PLACONTACRE').AsString       := sContaCre;
                  qryMontaCtb.FieldByName('CODCENTROCUSTODEB').AsString := sCcDeb;
                  qryMontaCtb.FieldByName('CODCENTROCUSTOCRE').AsString := sCcCre;
                  //----------------------------------------------------------------------
                  if iCodSubContaDeb <> 0 then
                     qryMontaCtb.FieldByName('CODSUBCONTADEB').AsInteger := iCodSubContaDeb
                  else
                     qryMontaCtb.FieldByName('CODSUBCONTADEB').Clear;
                  //----------------------------------------------------------------------
                  if iCodSubContaCre <> 0 then
                     qryMontaCtb.FieldByName('CODSUBCONTACRE').AsInteger := iCodSubContaCre
                  else
                     qryMontaCtb.FieldByName('CODSUBCONTACRE').Clear;
                  //----------------------------------------------------------------------
                  qryMontaCtb.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                  qryMontaCtb.FieldByName('IDPATRO').AsInteger          := iPatro;
                  qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                  qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').AsString  := sPlaTipConvOfiDeb;
                  qryMontaCtb.FieldByName('PLATIPCONVGERDEB').AsString  := sPlaTipConvGerDeb;
                  qryMontaCtb.FieldByName('PLATIPCONVOFICRE').AsString  := sPlaTipConvOfiCre;
                  qryMontaCtb.FieldByName('PLATIPCONVGERCRE').AsString  := sPlaTipConvGerCre;
                  qryMontaCtb.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                  qryMontaCtb.FieldByName('LACHIST1').AsString          := sHistor;
                  qryMontaCtb.FieldByName('LACHIST2').AsString          := sHistor1;
                  qryMontaCtb.FieldByName('LACHIST3').AsString          := sHistor2;
                  qryMontaCtb.FieldByName('LACHIST4').AsString          := sHistor3;
                  qryMontaCtb.FieldByName('LACHIST5').AsString          := sHistor4;
                  //----------------------------------------------------------------------
                  qryMontaCtb.FieldByName('LACVALOR').AsFloat := fValOfi * fPercRateio;
               end else
               begin
                  qryMontaCtb.Edit;
                  qryMontaCtb.FieldByName('LACVALOR').AsFloat := qryMontaCtb.FieldByName('LACVALOR').AsFloat + (fValOfi * fPercRateio);
               end;
            end;
         end;
      end else
      //----------------------------------------------------------------------------------
      // Contabilizacao do Desmembramento
      //----------------------------------------------------------------------------------
      if iTipoContab = 2 then
      begin
         fValOfi := abs(fValOfi);
         //-------------------------------------------------------------------------------
         // Pesquisa o Rateio de PlanoPatrocinadora do Bem para o calculo do rateio.
         // Caso não haja rateio definido, usa o padrão setado nos Parâmetros do Sistema.
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            qryRatPP.Close;
            qryRatPP.ParamByName('PIDBEM').AsInteger     := iBem;
            qryRatPP.ParamByName('PIDEMPRESA').AsInteger := iPessoa;
            qryRatPP.Open;
            //----------------------------------------------------------------------------
            repeat
               if qryRatPP.IsEmpty then
               begin
                  with qryParamCaf do
                  begin
                     Close;
                     ParamByName('PIDPESSOA').asInteger := iPessoa;
                     Open;
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
                  iPatro      := qryRatPP.FieldByName('IDPATRO').AsInteger;
                  iPlanoPrev  := qryRatPP.FieldByName('IDPLANOPREV').AsInteger;
                  fPercRateio := qryRatPP.FieldByName('PPBPERCRATEIO').AsFloat / 100;
               end;
               //-------------------------------------------------------------------------
               // Realiza o registro como partida simples
               //-------------------------------------------------------------------------
               if (qryParamCAF.FieldByName('PACDOBRADA').AsString = 'N') then
               begin
                  //----------------------------------------------------------------------
                  // Realiza o registro da Conta a Debito
                  //----------------------------------------------------------------------
                  sTipoLanc := 'D';
                  //----------------------------------------------------------------------
                  // Posiciona a tabela PlanoConta para obter informações adicionais
                  // da conta contábil envolvida no lançamento a Débito
                  //----------------------------------------------------------------------
                  qryPlanoConta.Close;
                  qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                  qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaDeb;
                  qryPlanoConta.Open;
                  sPlaTipConvOfiDeb := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                  sPlaTipConvGerDeb := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                  //----------------------------------------------------------------------
                  qryMontaCtb.Append;
                  qryMontaCtb.FieldByName('PLANO').AsInteger            := iPlano;
                  qryMontaCtb.FieldByName('PLACONTA').AsString          := sContaDeb;
                  qryMontaCtb.FieldByName('LACDEBCRE').AsString         := sTipoLanc;
                  qryMontaCtb.FieldByName('CODCENTROCUSTO').AsString    := sCcDeb;
                  //----------------------------------------------------------------------
                  if iCodSubContaDeb <> 0 then
                     qryMontaCtb.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaDeb
                  else
                     qryMontaCtb.FieldByName('CODSUBCONTA').Clear;
                  //----------------------------------------------------------------------
                  qryMontaCtb.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                  qryMontaCtb.FieldByName('IDPATRO').AsInteger          := iPatro;
                  qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                  qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').AsString  := sPlaTipConvOfiDeb;
                  qryMontaCtb.FieldByName('PLATIPCONVGERDEB').AsString  := sPlaTipConvGerDeb;
                  qryMontaCtb.FieldByName('PLATIPCONVOFICRE').Clear;
                  qryMontaCtb.FieldByName('PLATIPCONVGERCRE').Clear;
                  qryMontaCtb.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                  qryMontaCtb.FieldByName('LACHIST1').AsString          := sHistor;
                  qryMontaCtb.FieldByName('LACHIST2').AsString          := sHistor1;
                  qryMontaCtb.FieldByName('LACHIST3').AsString          := sHistor2;
                  qryMontaCtb.FieldByName('LACHIST4').AsString          := sHistor3;
                  qryMontaCtb.FieldByName('LACHIST5').AsString          := sHistor4;
                  qryMontaCtb.FieldByName('LACVALOR').AsFloat           := fValOfi * fPercRateio;
                  //----------------------------------------------------------------------
                  // Realiza o registro da Conta a Credito
                  //----------------------------------------------------------------------
                  sTipoLanc := 'C';
                  //----------------------------------------------------------------------
                  // Posiciona a tabela PlanoConta para obter informações adicionais
                  // da conta contábil envolvida no lançamento a Credito
                  //----------------------------------------------------------------------
                  qryPlanoConta.Close;
                  qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                  qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaCre;
                  qryPlanoConta.Open;
                  sPlaTipConvOfiCre := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                  sPlaTipConvGerCre := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                  //----------------------------------------------------------------------
                  qryMontaCtb.Append;
                  qryMontaCtb.FieldByName('PLANO').AsInteger            := iPlano;
                  qryMontaCtb.FieldByName('PLACONTA').AsString          := sContaCre;
                  qryMontaCtb.FieldByName('CODCENTROCUSTO').AsString    := sCcCre;
                  //----------------------------------------------------------------------
                  if iCodSubContaCre <> 0 then
                     qryMontaCtb.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaCre
                  else
                     qryMontaCtb.FieldByName('CODSUBCONTA').Clear;
                  //----------------------------------------------------------------------
                  qryMontaCtb.FieldByName('LACDEBCRE').AsString         := sTipoLanc;
                  qryMontaCtb.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                  qryMontaCtb.FieldByName('IDPATRO').AsInteger          := iPatro;
                  qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                  qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').Clear;
                  qryMontaCtb.FieldByName('PLATIPCONVGERDEB').Clear;
                  qryMontaCtb.FieldByName('PLATIPCONVOFICRE').AsString  := sPlaTipConvOfiCre;
                  qryMontaCtb.FieldByName('PLATIPCONVGERCRE').AsString  := sPlaTipConvGerCre;
                  qryMontaCtb.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                  qryMontaCtb.FieldByName('LACHIST1').AsString          := sHistor;
                  qryMontaCtb.FieldByName('LACHIST2').AsString          := sHistor1;
                  qryMontaCtb.FieldByName('LACHIST3').AsString          := sHistor2;
                  qryMontaCtb.FieldByName('LACHIST4').AsString          := sHistor3;
                  qryMontaCtb.FieldByName('LACHIST5').AsString          := sHistor4;
                  qryMontaCtb.FieldByName('LACVALOR').AsFloat := fValOfi * fPercRateio;
               end else
               //-------------------------------------------------------------------------
               // Realiza o registro como partida dobrada
               //-------------------------------------------------------------------------
               begin
                  //----------------------------------------------------------------------
                  // Posiciona a tabela PlanoConta para obter informações adicionais
                  // da conta contábil envolvida no lançamento a Débito
                  //----------------------------------------------------------------------
                  qryPlanoConta.Close;
                  qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                  qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaDeb;
                  qryPlanoConta.Open;
                  sPlaTipConvOfiDeb := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                  sPlaTipConvGerDeb := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                  //----------------------------------------------------------------------
                  // Posiciona a tabela PlanoConta para obter informações adicionais
                  // da conta contábil envolvida no lançamento a Credito
                  //----------------------------------------------------------------------
                  qryPlanoConta.Close;
                  qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                  qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaCre;
                  qryPlanoConta.Open;
                  sPlaTipConvOfiCre := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                  sPlaTipConvGerCre := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                  //----------------------------------------------------------------------
                  qryMontaCtb.Append;
                  qryMontaCtb.FieldByName('PLANO').AsInteger            := iPlano;
                  qryMontaCtb.FieldByName('PLACONTADEB').AsString       := sContaDeb;
                  qryMontaCtb.FieldByName('PLACONTACRE').AsString       := sContaCre;
                  qryMontaCtb.FieldByName('CODCENTROCUSTODEB').AsString := sCcDeb;
                  qryMontaCtb.FieldByName('CODCENTROCUSTOCRE').AsString := sCcCre;
                  //----------------------------------------------------------------------
                  if iCodSubContaDeb <> 0 then
                     qryMontaCtb.FieldByName('CODSUBCONTADEB').AsInteger := iCodSubContaDeb
                  else
                     qryMontaCtb.FieldByName('CODSUBCONTADEB').Clear;
                  //----------------------------------------------------------------------
                  if iCodSubContaCre <> 0 then
                     qryMontaCtb.FieldByName('CODSUBCONTACRE').AsInteger := iCodSubContaCre
                  else
                     qryMontaCtb.FieldByName('CODSUBCONTACRE').Clear;
                  //----------------------------------------------------------------------
                  qryMontaCtb.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                  qryMontaCtb.FieldByName('IDPATRO').AsInteger          := iPatro;
                  qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                  qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').AsString  := sPlaTipConvOfiDeb;
                  qryMontaCtb.FieldByName('PLATIPCONVGERDEB').AsString  := sPlaTipConvGerDeb;
                  qryMontaCtb.FieldByName('PLATIPCONVOFICRE').AsString  := sPlaTipConvOfiCre;
                  qryMontaCtb.FieldByName('PLATIPCONVGERCRE').AsString  := sPlaTipConvGerCre;
                  qryMontaCtb.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                  qryMontaCtb.FieldByName('LACHIST1').AsString          := sHistor;
                  qryMontaCtb.FieldByName('LACHIST2').AsString          := sHistor1;
                  qryMontaCtb.FieldByName('LACHIST3').AsString          := sHistor2;
                  qryMontaCtb.FieldByName('LACHIST4').AsString          := sHistor3;
                  qryMontaCtb.FieldByName('LACHIST5').AsString          := sHistor4;
                  qryMontaCtb.FieldByName('LACVALOR').AsFloat           := fValOfi * fPercRateio;
               end;
               //-------------------------------------------------------------------------
               if not qryRatPP.IsEmpty then
                  qryRatPP.Next;
               //-------------------------------------------------------------------------
            until qryRatPP.EOF;
         end;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      on E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que registra os Lancamentos da Movimentacao
// em um planilha na Contabilidade Versão 2
//----------------------------------------------------------------------------------------
Function TAtivoFixo.RegistraPlanilhaContabil(iModulo, iExercicio, iPeriodo : Integer;
                                             dData : tDateTime;
                                             var sMensagem : String;
                                             bMostraMsg : Boolean) : Integer;
Var
   sTipOper,
   sContaDeb, sContaCre,
   sCcDeb, sCcCre,
   sSubContaDeb, sSubContaCre,
   sPlaTipConvOfiDeb, sPlaTipConvOfiCre,
   sPlaTipConvGerDeb, sPlaTipConvGerCre,
   sValLanc, sCodDebCred, sDebCred,
   sPlaCCust                             : String;
   bJunta                                : Boolean;
   fValLanc                              : Extended;
   iPln, iPlanilha                       : Integer;

begin
   try
      //----------------------------------------------------------------------------------
      // Inicializa uma nova planilha contábil
      //----------------------------------------------------------------------------------
      iPln := 0;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryParamCaf.Active then
         begin
            qryParamCaf.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
            qryParamCaf.Open;
         end;
         sTipOper := qryParamCaf.FieldByName('TIPOPERCTB').AsString;
         bJunta   := False;
         //-------------------------------------------------------------------------------
         // Registra os lançamentos da planilha na contabilidade
         //-------------------------------------------------------------------------------
         qryMontaCtb.First;
         while not qryMontaCtb.EOF do
         begin
            sContaDeb         := '';
            sContaCre         := '';
            sCcDeb            := '';
            sCcCre            := '';
            sSubContaDeb      := '';
            sSubContaCre      := '';
            sPlaTipConvOfiDeb := '';
            sPlaTipConvOfiCre := '';
            sPlaTipConvGerDeb := '';
            sPlaTipConvGerCre := '';
            sValLanc          := FormatFloat('#0.00',qryMontaCtb.FieldByName('LACVALOR').AsFloat);
            fValLanc          := StrToFloat(sValLanc);
            sPlaCCust         := '';
            sMensagem         := '';
            //----------------------------------------------------------------------------
            // Alimenta os elementos contábeis de acordo com o tipo de partida
            //----------------------------------------------------------------------------
            if (qryParamCAF.FieldByName('PACDOBRADA').AsString = 'N') or
               (qryMontaCtb.FieldByName('PLACONTADEB').AsString = '') or
               (qryMontaCtb.FieldByName('PLACONTACRE').AsString = '') then
            begin
               if qryMontaCtb.FieldByName('LACDEBCRE').AsString = 'D' then
               begin
                  sCodDebCred       := '0';
                  sDebCred          := qryMontaCtb.FieldByName('LACDEBCRE').AsString;
                  sContaDeb         := qryMontaCtb.FieldByName('PLACONTA').AsString;
                  sCcDeb            := qryMontaCtb.FieldByName('CODCENTROCUSTO').AsString;
                  sSubContaDeb      := qryMontaCtb.FieldByName('CODSUBCONTA').AsString;
                  sPlaTipConvOfiDeb := qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').AsString;
                  sPlaTipConvGerDeb := qryMontaCtb.FieldByName('PLATIPCONVGERDEB').AsString;
               end else
               begin
                  sCodDebCred       := '1';
                  sDebCred          := qryMontaCtb.FieldByName('LACDEBCRE').AsString;
                  sContaCre         := qryMontaCtb.FieldByName('PLACONTA').AsString;
                  sCcCre            := qryMontaCtb.FieldByName('CODCENTROCUSTO').AsString;
                  sSubContaCre      := qryMontaCtb.FieldByName('CODSUBCONTA').AsString;
                  sPlaTipConvOfiCre := qryMontaCtb.FieldByName('PLATIPCONVOFICRE').AsString;
                  sPlaTipConvGerCre := qryMontaCtb.FieldByName('PLATIPCONVGERCRE').AsString;
               end;
            end else
            begin
               sCodDebCred       := '2';
               sDebCred          := '';
               sContaDeb         := qryMontaCtb.FieldByName('PLACONTADEB').AsString;
               sContaCre         := qryMontaCtb.FieldByName('PLACONTACRE').AsString;
               sCcDeb            := qryMontaCtb.FieldByName('CODCENTROCUSTODEB').AsString;
               sCcCre            := qryMontaCtb.FieldByName('CODCENTROCUSTOCRE').AsString;
               sSubContaDeb      := qryMontaCtb.FieldByName('CODSUBCONTADEB').AsString;
               sSubContaCre      := qryMontaCtb.FieldByName('CODSUBCONTACRE').AsString;
               sPlaTipConvOfiDeb := qryMontaCtb.FieldByName('PLATIPCONVOFIDEB').AsString;
               sPlaTipConvGerDeb := qryMontaCtb.FieldByName('PLATIPCONVGERDEB').AsString;
               sPlaTipConvOfiCre := qryMontaCtb.FieldByName('PLATIPCONVOFICRE').AsString;
               sPlaTipConvGerCre := qryMontaCtb.FieldByName('PLATIPCONVGERCRE').AsString;
            end;
            //----------------------------------------------------------------------------
            if fValLanc <> 0 then
            begin
               iPlanilha := LancaContab(True,'BaseDados',                                 // Base de Dados
                                       datetostr(dData),                                  // Data de Lançamento
                                       inttostr(iModulo),                                 // Sistema de origem - tabela Módulo
                                       sCodDebCred,                                       // 0=> Débito, 1=> Crédito 2=>Partida Dobrada
                                       sDebCred,                                          // D=> Débito e C=> Crédito
                                       sPlaTipConvOfiDeb,                                 // Conversão à débito
                                       sPlaTipConvGerDeb,                                 // Conversão à débito
                                       sPlaTipConvGerDeb,                                 // Conversão à débito
                                       sPlaTipConvGerDeb,                                 // Conversão à débito
                                       'O',                                               // Origem da aplicação a débito
                                       sPlaTipConvOfiCre,                                 // Conversão à Crédito
                                       sPlaTipConvGerCre,                                 // Conversão à Crédito
                                       sPlaTipConvGerCre,                                 // Conversão à Crédito
                                       sPlaTipConvGerCre,                                 // Conversão à Crédito
                                       'O',                                               // Origem da aplicação a crédito
                                       qryMontaCtb.FieldByName('LACNUMDOC').AsString,     // Número do Documento
                                       qryMontaCtb.FieldByName('LACHIST1').AsString,      // Histórico 1
                                       qryMontaCtb.FieldByName('LACHIST2').AsString,      // Histórico 2
                                       qryMontaCtb.FieldByName('LACHIST3').AsString,      // Histórico 3
                                       qryMontaCtb.FieldByName('LACHIST4').AsString,      // Histórico 4
                                       qryMontaCtb.FieldByName('LACHIST5').AsString,      // Histórico 5
                                       sTipOper,                                          // Tipo de Operacao
                                       sCcDeb,                                            // ccusto a débito
                                       sContaDeb,                                         // Conta Contábil a débito
                                       sCcCre,                                            // ccusto a crédito
                                       sContaCre,                                         // conta contábil a crédito
                                       iExercicio,                                        // exercício (perexercício)
                                       iPeriodo,                                          // pernumero (tabperiodo)
                                       Sistema.IdEmpresa,                                 // pessoa
                                       Sistema.IdUsuario,                                 // usuário
                                       qryMontaCtb.FieldByName('PLANO').AsInteger,        // plano
                                       fValLanc,                                          // valor do lançamento
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       qryMontaCtb.FieldByName('UNIDNEGOC').AsString,     // unidade de negócio
                                       bJunta,                                            // bjunta = false
                                       0,                                                 //
                                       0,                                                 //
                                       sSubContaDeb,                                      // subconta a Débito
                                       sSubContaCre,                                      //
                                       '',                                                //
                                       '',                                                //
                                       iPln,                                              // Se 0, Cria Nova Pln, Senão Grava na pln
                                       sMensagem,
                                       IntegraBack.MascaraPlano,
                                       True,
                                       0,
                                       qryMontaCtb.FieldByName('IDPLANOPREV').AsInteger,  // Plano Previdenciário
                                       qryMontaCtb.FieldByName('IDPATRO').AsInteger,      // Patrocinadora
                                       Sistema.UsaPlanoPatro                              // EmpresaProp usa Plano/Patrocinadora
                                       );
               iPln := iPlanilha;
            end;
            //----------------------------------------------------------------------------
            if iPln = -1 then
               raise Exception.Create(sMensagem);
            //----------------------------------------------------------------------------
            qryMontaCtb.Next;
         end;
         Result := iPln;
      end;
   except
      on E : Exception do
      begin
         Result := -1;
         MensagemErro := 'Mensagem Contabilidade : ' + E.Message + #13 +
                         'Partida Dobrada ? ' + dtmAtivoFixo.qryParamCAF.FieldByName('PACDOBRADA').AsString + #13 +
                         'Tipo :            ' + dtmAtivoFixo.qryMontaCtb.FieldByName('LACDEBCRE').AsString + #13 +
                         'Plano :           ' + dtmAtivoFixo.qryMontaCtb.FieldByName('PLANO').AsString + #13 +
                         'Conta Contábil :  ' + dtmAtivoFixo.qryMontaCtb.FieldByName('PLACONTA').AsString;
      end;
   end;
   dtmAtivoFixo.qryMontaCtb.Close;
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
   sData                                  : string;
   qryMoeda,qryMoedaA,qryMoedaM,qryMoedaD : TwwQuery;

begin
   qryMoeda  := TwwQuery(dtmAtivoFixo.qryMoeda );
   qryMoedaA := TwwQuery(dtmAtivoFixo.qryMoedaA);
   qryMoedaM := TwwQuery(dtmAtivoFixo.qryMoedaM);
   qryMoedaD := TwwQuery(dtmAtivoFixo.qryMoedaD);
   Result := 1;
   try
      if not qryMoeda.Prepared then qryMoeda.Prepare;
      //----------------------------------------------------------------------------------
      qryMoeda.ParamByName('PMOEDA').asString := sMoeda;
      qryMoeda.Open;
      //----------------------------------------------------------------------------------
      if qryMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'A' then
      begin
         if not qryMoedaA.Prepared then qryMoedaA.Prepare;
         //-------------------------------------------------------------------------------
         sData := copy(datetostr(dData),7,4);
         qryMoedaA.ParamByName('PMOEDA').asString  := sMoeda;
         qryMoedaA.ParamByName('PCOTANO').asString := sData;
         qryMoedaA.Open;
         //-------------------------------------------------------------------------------
         if qryMoedaA.IsEmpty then
            Raise Exception.Create('Cotação da Moeda ' + qryMoeda.FieldByName('MOEDESC').AsString +
                                   ' do Ano ' + sData + ' não Cadastrada!')
         else
            Result := qryMoedaA.FieldByName('COTVALOR').AsCurrency;
         //-------------------------------------------------------------------------------
         qryMoedaA.Close;
      end else
      //----------------------------------------------------------------------------------
      if qryMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'M' then
      begin
         if not qryMoedaM.Prepared then qryMoedaM.Prepare;
         //-------------------------------------------------------------------------------
         sData := copy(datetostr(dData),4,2) + copy(datetostr(dData),7,4);
         qryMoedaM.ParamByName('PMOEDA').asString  := sMoeda;
         qryMoedaM.ParamByName('PCOTMES').asString := sData;
         qryMoedaM.Open;
         //-------------------------------------------------------------------------------
         if qryMoedaM.IsEmpty then
            Raise Exception.Create('Cotação da Moeda ' + qryMoeda.FieldByName('MOEDESC').AsString +
                                   ' do Mês ' + sData + ' não Cadastrada!')
         else
            Result := qryMoedaM.FieldByName('COTVALOR').AsCurrency;
         //-------------------------------------------------------------------------------
         qryMoedaM.Close;
      end else
      //----------------------------------------------------------------------------------
      if qryMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'D' then
      begin
         if not qryMoedaD.Prepared then qryMoedaD.Prepare;
         //-------------------------------------------------------------------------------
         qryMoedaD.ParamByName('PMOEDA').asString     := sMoeda;
         qryMoedaD.ParamByName('PCOTDATA').asDateTime := dData;
         qryMoedaD.Open;
         //-------------------------------------------------------------------------------
         if qryMoedaD.isEmpty then
            Raise Exception.Create('Cotação da Moeda ' + qryMoeda.FieldByName('MOEDESC').AsString +
                                   ' do Dia ' + datetostr(dData) + ' não Cadastrada!')
         else
            Result := qryMoedaD.FieldByName('COTVALOR').AsCurrency;
         //-------------------------------------------------------------------------------
         qryMoedaD.Close;
      end;
      //----------------------------------------------------------------------------------
      qryMoeda.Close;
   except
      On E : Exception do
      begin
         MensagemErro := E.Message;
         if qryMoeda.Active then qryMoeda.Close;
         if qryMoedaA.Active then qryMoedaA.Close;
         if qryMoedaM.Active then qryMoedaM.Close;
         if qryMoedaD.Active then qryMoedaD.Close;
      end;
   end;
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
   cMaxTipoMov = 69;

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
   aTipoMov[04].DESCTIPOMOVIMENTACAO := 'TROCA DO NUMERO DA PLACA DE TOMBAMENTO';
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
   aTipoMov[67].DESCTIPOMOVIMENTACAO := 'LANCAMENTO DE OBRA';
   aTipoMov[68].DESCTIPOMOVIMENTACAO := 'ENTRADA POR ENCERRAMENTO DE OBRA';
   aTipoMov[69].DESCTIPOMOVIMENTACAO := 'DEPRECIACAO DA REAVALIACAO NEGATIVA';
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
   aTipoMov[67].LANCAMENTO := 'S';
   aTipoMov[68].LANCAMENTO := 'N';
   aTipoMov[69].LANCAMENTO := 'S';
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
   aTipoMov[67].IDCONTAB := 03;
   aTipoMov[68].IDCONTAB := 03;
   aTipoMov[69].IDCONTAB := 03;
   //-------------------------------------------------------------------------------------
   bTransacao := False;
   try
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end;
      //----------------------------------------------------------------------------------
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
      On E : Exception do
      begin
         frmAguarde.Apaga;
         if bTransacao then
            RollBackTransacao;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
Procedure TAtivoFixo.CriaQry( Var q : TwwQuery );
begin
   q := TwwQuery.Create(Application);
   q.DatabaseName  := 'BASEDADOS';
end;
//========================================================================================
Procedure TAtivoFixo.FreeQry( Var q : TwwQuery );
begin
   q.Free;
end;

end.


