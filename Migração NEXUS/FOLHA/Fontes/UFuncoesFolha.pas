// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//**************************************************************************************************
//******************************************************************************
// Rotina    :
// Autor(a)  : Edilaine
// Data      : 04/08/2025
// Pendencia : WO24218
// Alteração : Habilitar a execução da Previa via ETL
//------------------------------------------------------------------------------
//Nº WO.......: 19556
//Data        : 11/03/2025
//Responsavel : Edilaine
//Alteração   : Refatoraçao do processo da previa
//              - usar NIL na crição dos objetos e usar FreeAndNil para liberar
//------------------------------------------------------------------------------
//Alteração  : EnviaMonitoramento
//Nº SIG.....: 100935
//Data.......: 10/07/2020
//Responsável: Andre Imakawa
//Descrição..: Removido EnviaMonitoramento da Unit. Utilizar uFuncaoGeral - EnviaMonitoramento.
//***************************************************************************************************
//Alteração  : ApagaPreviaEfetivacao, ApagaPreviaEfetivacaoLista, ApagaPreviaEfetivacaoPessoa
//Nº SIG.....: 99346
//Data.......: 03/04/2020
//Responsável: Andre Imakawa
//Descrição..: Ao desfazer previa sensibilizar a tabela TMPDESC.
//             A procedure SP_APAGA_PREVIA está apagando as tabelas auxiliares.
//***************************************************************************************************
//Alteração  : ValidaUsuarioFolha
//Nº SIG.....: 87467
//Data.......: 21/06/2019
//Responsável: Andre Imakawa
//Descrição..: Valida se usuário esta com bloqueio na folha
//***************************************************************************************************
// Data       : 22/05/2019
// SIG        : 83677
// Autor      : Andre Imakawa
// Descrição  : Atualizar o FLGPROCESSADO = 1 na tabela HSTPRAZOACUMULACAOFOLHA
//***************************************************************************************************
// Data       : 05/02/2019
// SIG        : 81798
// Autor      : Andre Imakawa
// Descrição  : Recompilação
//***************************************************************************************************
//Alteração  : EnviaMonitoramento
//Nº SIG.....: 81948
//Data.......: 07/02/2019
//Responsável: Andre Imakawa
//Descrição..: Criado rotina para 
//***************************************************************************************************
//Alteração  : ApagaPreviaEfetivacao, ApagaPreviaEfetivacaoLista, ApagaPreviaEfetivacaoPessoa
//Nº SIG.....: SIG TIBERO
//Data.......: 15/10/2018
//Responsável: Andre Imakawa
//Descrição..: Correção Tibero.
//***************************************************************************************************
//Alteração  : ApagaPreviaEfetivacao, ApagaPreviaEfetivacaoLista
//Nº SIG.....: 68391
//Data.......: 07/05/2018
//Responsável: Andre Imakawa
//Descrição..: Desfazer implementação do SIG 67635.
//***************************************************************************************************
//Alteração  : ApagaPreviaEfetivacao, ApagaPreviaEfetivacaoLista
//Nº SIG.....: 67635
//Data.......: 07/05/2018
//Responsável: Andre Imakawa
//Descrição..: Apagar tabelas auxiliares da Previa utilizando procedure SP_APAGA_PREVIA_AUXILIAR
//***************************************************************************************************
//Alteração  : ApagaPreviaEfetivacao, ApagaPreviaEfetivacaoLista, ApagaPreviaEfetivacaoPessoa
//Nº SIG.....: 65680
//Data.......: 28/03/2018
//Responsável: Andre Imakawa
//Descrição..: Deletar tabela LOG_ALT_BASEPGTO
//***************************************************************************************************
//Alteração  : ApagaPreviaEfetivacao, ApagaPreviaEfetivacaoLista, ApagaPreviaEfetivacaoPessoa
//Nº SIG.....: 62918
//Data.......: 27/02/2018
//Responsável: Andre Imakawa
//Descrição..: Deletar tabelas BASEDEPAGAMENTOAPOIO e BASEDEPAGAMENTO com até 2000 registros e Commitar.
//***************************************************************************************************
//Alteração  : ApagaPreviaEfetivacao, ApagaPreviaEfetivacaoLista, ApagaPreviaEfetivacaoPessoa
//Nº SIG.....: 55810
//Data.......: 20/10/2017
//Responsável: Andre Imakawa
//Descrição..: Retornar o ULTMESPROC da tabela BITRIBUTACAO, conforme o registro
//             da tabela HSTBITRIBUTACAO
//***************************************************************************************************
//Pendência   : SIG35762
//Data        : 21/09/2017
//Responsável : RODRIGO RAMOS
//Alteração   : procedure VerificadependenteIR;
//o	Caso a relação de dependência seja “COMPANHEIRO(A)”, “CONJUGE/EQUIP.”,
//“PAI/MÃE”, “AVÓS/BISAVÓS”, “SOGRO/SOGRA” ou “OUTROS”, 
//o sistema identifica estes dependentes como dependente de IR.
//RESUMO: ACRESCENTADO SOGRO/SOGRA
//--------------------------------------------------------------------------------
//Pendência   : SIG49444
//Data        : 29/06/2017
//Responsável : Fábio Sampaio
//Alteração   : Disponibilização do fonte SOL 207789/16579.
//--------------------------------------------------------------------------------
//Pendência   : SOL 207789/16579 PPM 543916
//Data        : 05/07/2015
//Responsável : Fernando Xavier
//Alteração   : Criação de Nova Funcionalidade para Batimento de Retorno das
//              Informações da Fita de Crédito
//--------------------------------------------------------------------------------
// Autor(a)    : Higor Nayde
// Pendência   : SOL 242624/17054 Kintana 715180
// Data        : 20/04/2015
// Descricao   : Ajuste para passar a aceitar dependente.
//--------------------------------------------------------------------------------
//Pendência   : SOL 242846 PPM 579506
//Responsável : Fernando Xavier
//Data        : 22/01/2015
//Descrição   : Sistema apresenta lentidão ao reprocessar prévia.
//--------------------------------------------------------------------------------
//Pendência   : SOL 208662/15267 Kintana 2049259
//Responsável : Felipe A. Santos
//Data        : 04/12/2013
//Descrição   : Inclusão da rotina AlinhaEsquerda
//--------------------------------------------------------------------------------
//Pendência   : SOL 205224
//Responsável : douglas.siqueira
//Descrição   : IN1343 .
//--------------------------------------------------------------------------------
//Pendência   : SOL 146990 KINTANA 1009796
//Responsável : Ádler Souza
//Data        : 03/11/2010
//Descrição   : Inclusão de campos na query de entrada.
//--------------------------------------------------------------------------------
//Pendência   : SOL 140974 KINTANA 889580
//Responsável : BRUNO AZEVEDO
//Data        : 05/08/2010
//Descrição   : Correção na atualização de Dependentes. Salvar Previa\Efet\Preparo na rede.
//--------------------------------------------------------------------------------
//Pendência   : SOL 131129 KINTANA 748012
//Responsável : BRUNO AZEVEDO
//Data        : 01/03/2010
//Descrição   : Alterado a datafim de ir de 21 anos para 22 anos e quando o ben.
//              esta cursando ensino superior, alterado de 24 para 25 anos.
//--------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 04/12/2008
// Rotina      : AtualizaNumeroDependentes
// Pendência   : 103035 - 458476
// Descricao   : Reforço da implementação abaixo. 100376
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 05/11/2008
// Rotina      : AtualizaNumeroDependentes
// Pendência   : 100376 - 443953
// Descricao   : Quando preenchido com "superior incompleto" e a data final de dependencia esteja em branco deve
//               ser inserido a data que o dependente completa 24 anos. Mas quando a data final está preenchida
//               o sistema deve obedecer esta data final.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 30/10/2008
// Rotina      : AtualizaNumeroDependentes
// Pendência   : 99769 - 439604
// Descricao   : O sistema deve atualizar a contagem de dependente para ATIVOS com o (FLGINTERNO = AT).
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 13/09/2007
// Rotina      : ApagaPreviaEfetivacaoPessoa
// Pendência   : 14004
// Descricao   : Continuar a previa do momento onde foi interompido
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 11/07/2007
// Rotina      : ApagaPreviaEfetivacaoLista, ApagaPreviaEfetivacao
// Pendência   : 25843
// Descricao   : Tratar contagem de registros para delete, pois o commit passou
//   de 1000 para 10000.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 20/09/2006
// Rotina      : Diversas
// Pendência   : 23361
// Descricao   : Retirar RULE de consultas.
//------------------------------------------------------------------------------
unit UFuncoesFolha;

interface

uses Windows, SysUtils, Classes, Forms, Dialogs, DBTables, Wwquery,
     StdCtrls, checklst, UFiario, UMovReservaFB, UFuncoesUteisFB,
     uSistema, UAdmPrevFB, DBaseDados, UDataBase, DFolha, uObjFolha,
     IdHTTP, // Andre Imakawa - SIG 81948
     UMensErro,// Andre Imakawa - SIG 87467
     UCripto,   //edilaine WO24218
     DBClient, Db, wwstorep; // SOL 242846 PPM 579506

procedure DefineRubricaBeneficio(
   qryRubBenef: twwquery;
   qryAux: twwquery;
   aiidpessjur: integer;
   aiidplanoprev: integer;
   aiidbeneficio: integer;
   aiflgdevolucao: integer;
   aiflgprovisorio: integer;
   aiidmotivo: integer;
   aiidtitular: integer;
   aiidpessoa: integer;
   aiacaojudganha: integer;
   asmespag: string;
   asmesref: string;
   aiidlote: integer;
   aiantecipabonomes: integer;
   aiantecipabonoano: integer;
   asflgfrequencia: string;
   var aiidrubrica : integer;
   var aiidrubricaacjud: integer;
   var asmsg: string;
   var asmsgacjud: string);

  function EscreveRubrica1(pIdPessoa, pIdTitular, pIdPessJur, pIdPlanoprev,
                           pIdRubrica, pCodProvDesc,
                           pIdMotivo, pMes, pMesCobranca, pReferencia, pIdRegraCalculo,
                           pFlgCompoeSalPart, pFlgCompoeSalBenef, pFlgIRRF, pCodMoeda,
                           pValorCotas: string; pValorProvento, pValorIntegral : double;
                           pOrdem : integer;
                           pFLGSRB:Integer;pIdResponsavel:Integer):boolean;

  procedure BuscaInfIntegra(pIdPessJur, pIdRubrica, pIdPlanoPrev : integer;
                            var sTipCodigo,sCodTipRecDes,sRecPag,sIdPessoa,sCodTipDoc,sCodPortForma,sCodCentroRespon,
                            sCodSubConta,sCodCentroCustoD,sIdEmpresa,sCodCentroCustoC,sPlaContaD,sPlano,sPlaContaC,
                            sUnidNegoc,sIdEmpresaProp : string);

  function AtualizaDataFolha(pMesRef, pAnoRef : string) : string;
  function PegaIndiceMes(pCodMoeda : integer; pMesRef : string; var pIndice : double) : boolean;
  function PegaIndiceData(pCodMoeda : integer; pDataRef : string; var pIndice : double) : boolean;

  Function ApagaPreviaEfetivacao(sIdLote : string; bcommitparcial: boolean): boolean; // SOL 242846 PPM 579506

  Function ApagaPreviaEfetivacaoLista(sIdLote : string): boolean; //APAGA PREVIA DA LISTA DO USUARIO // SOL 242846 PPM 579506

  Function ApagaPreviaEfetivacaoPessoa(piIDLote, piIDTitular, piIDPessoa : Integer): boolean; // SOL 242846 PPM 579506 // SOL 242624/17054 Kintana 715180

  function ExecutaRegraValorAbono(qryAux : TwwQuery;
    piIdRegraCalculo,
    piIdPessJur, piIdPlanoPrev, piIdTitular,
    piSeqProposta, piIdPessoa, piIdBeneficio : longInt;
    psDataInicio,psDataFinal : string;
    prValorBenef : double;
    psFlgProvisorio: string;
    var bErro : boolean;
    var sMsgErro : string) : double;

  Procedure FazerInsertFiario(pIdPessoa,PIdTitular,pIdUsuario,pIdModulo:Integer;pDescricao:String);

  function BuscaIndice(moecodigo:Integer;dataref:String;dataevento:String;var IndiceDataRef:double;var IndiceDataEvento:double): Boolean ;

  // Função de verificação de processo(PREPARO/PREVIA/EFETIVAÇÃO)
  // a regra(do usuário) faz verificações a partir de parâmetros e retorna 0 ou 1
  // que prossegue ou para o processo.
  Function VerificaFolha(TIPOPROCESSO, MESPAGAMENTO, TIPOOPERACAO,
                         DATAPAGAMENTO: String): Boolean;

  function Piece(S : string; D : char; Col : integer) : string;
  function LeftPadCh(const S : string; Ch : Char; Len : integer) : string;
  function IdentificaTipoPessoa(qry : twwquery; alidTitular,
    alidRecebedor : longint) : char;
  { - Identifica o tipo de uma pessoa classificando como:
    'P' - PARTICIPANTE
    'B' - BENEFICIARIO
    'T' - TUTOR RESPONSAVEL
    'C' - CONSIGNATARIO
    'N' - NAO IDENTIFICADO}

function GeraLoteFolha(qry : twwquery;
  idPatro : integer; bGravaLote : boolean; sMesReferencia,sTipo,sDescricao,sAtrasoDevol,
  sFlgPreparado,sFlgIdaTmp, sFlgVoltaTmp, sFlgIdaInterface,sFlgVoltaInterface,
  sDataPreparo,sDataIdaTmp,sDataVoltaTmp,sDataIdaInterface,sDATAVOLTAINTERFA : string ) : integer;

function BuscaDadosRubrica(aiidrubrica : integer; astipodesc : string) : string;

function SomaString(s1, s2 : string) : string;
function MultiplicaString(s1 : string; ch : char) : string;

procedure MontaFiltro(ChkList : TCheckListBox;
                      ListaAux : tstrings;
                      var StrLista : string);

procedure MontaFiltroCompleto(ChkList : TCheckListBox;
                              ListaAux : tstrings;
                              var StrLista : string);

procedure MarcaLista(ChkList : TCheckListBox; bMarca : boolean);
function VerificaLista(ChkList : TCheckListBox): boolean;

//GERA SALÁRIO VIRTUAL.
function GeraSalarioVirtual(sMes, sMesCob: string; iProcesso, iIdtitular,
  iIdResponsavel, iIdFundacao, iIdPessjur, iIdPlanoprev, iSeqProposta,
  iIdRubAuxDoenca, iidmotivo: integer; dSalAuxDoencaIntegral, dSalAuxDoencaProporcional: double): boolean;

//PEGA QUANTIDADE DE LOTES DA FOLHA NO MÊS DE REFERENCIA ANTERIOR AO LOTE.
function QuantidadeLotes(smesref: string; iidlote: integer): integer;

//ATUALIZA NUMERO DE DEPENDENTES DE IMPOSTO DE RENDA E SALARIO FAMILIA.
procedure AtualizaNumeroDependentes(pMemo: TMemo;
                                    aIdTitular: Integer;
                                    aIdResponsavel: Integer;
                                    asFlgInterno: string; //CONTROLAR ATUALIZAÇÃO DOS FLAGS DOS DEPENDENTES
                                        //     NÃO ATUALIZAR SE SITUAÇÃO ATIVO (AT, MA, MP)
                                    sDataFolha: string;
                                    asCodTipRecebedor: string;
                                    asMatriculaBen: string;
                                    asNomeBen: string;
                                    ainumdepir: integer;
                                    ainumdepsf: integer;
                                    ainumdeptot: integer;
                                    bcommit: boolean);

//OBJETO LISTA DE CONTRIBUICAO
type tobjContribuicao = class
     public
       rvalorassoc1: real;
       rvalorassoc2: real;
       rvalorassoc3: real;
       rvaloresperado: real;
       constructor Create(arvalorassoc1, arvalorassoc2, arvalorassoc3,
         arvaloresperado: real);
     end;

type tListaContribuicao = class(tstringlist)
     public
       destructor Destroy; override;
       procedure InsereLista(aidcontribuicao: integer; arvalorassoc1,
         arvalorassoc2, arvalorassoc3, arvaloresperado: real);
       function VerificaLista(aidcontribuicao: integer): tobjContribuicao;
     end;

function VerificaPessoaFisica(qryAux: twwquery; aiidpessoa: integer): boolean;

function IsLoteReserva(qryAux: twwquery; iidlote: integer): boolean;

function IsLoteResgate(pidlote: string): boolean; // Andre Imakawa - SIG 83677

procedure PulaRegistros(aqry: twwquery; alinum: integer); 

function ValidaRubrica(aqry: twwquery;
  aidrubrica: integer; var asmsg: string): boolean;
function VerificaRubricasIR(aqry: twwquery;
  var asmsg: string): boolean;

function IsRubricaIRRF(alidrubrica: integer): boolean; 

//FERNANDO XAVIER
function Replicate(aTexto:string;NumVezes:Integer):string;

function AlinhaEsquerda(pCampo : string; pCasas: Byte) : string; // Felipe A. Santos SOL 208662/15267 Kintana 2049259

//Function EnviaMonitoramento(pHost, pType, pMensagem: String):Boolean; // Andre Imakawa - SIG 81948 //// Andre Imakawa - SIG 100935

Function ValidaUsuarioFolha(var pMensagem: String):Boolean; // Andre Imakawa - SIG 87467

procedure AplicaCritpoDePara(pIdDePara : integer; sValor : string);      //edilaine WO24218
function  AplicaDecritpoDePara(sValor : string): string;                 //edilaine WO24218

implementation

uses uConstFolha;

// Felipe A. Santos SOL 208662/15267 Kintana 2049259
function AlinhaEsquerda(pCampo : string; pCasas: Byte) : string;
var i : integer;
begin
  If Length(Trim(pCampo))>pCasas Then Result := pCampo;
  i := pCasas - Length(Trim(pCampo));
  Result := pCampo + Replicate(' ',i)
end;

//FERNANDO XAVIER
function Replicate(aTexto:string;NumVezes:Integer):string;
var
  I:Integer;
  Temp:string;
begin
  Temp:='';
  for I:=1 to NumVezes do
    Temp:=Temp+aTexto;
  Result:=Temp;
end;

procedure DefineRubricaBeneficio(
   qryRubBenef: twwquery;
   qryAux: twwquery;
   aiidpessjur: integer;
   aiidplanoprev: integer;
   aiidbeneficio: integer;
   aiflgdevolucao: integer;
   aiflgprovisorio: integer;
   aiidmotivo: integer;
   aiidtitular: integer;
   aiidpessoa: integer;
   aiacaojudganha: integer;
   asmespag: string;
   asmesref: string;
   aiidlote: integer;
   aiantecipabonomes: integer;
   aiantecipabonoano: integer;
   asflgfrequencia: string;
   var aiidrubrica: integer;
   var aiidrubricaacjud: integer;
   var asmsg: string;
   var asmsgacjud: string);

  function VerificaRevisao: integer;
  var ssql: string;
  begin
    result:=0;
    if (aiidmotivo <> prmidmotivofolhaben) and
       (aiidmotivo <> prmIdMotivoAbono) then
    begin
      ssql:=
        'SELECT 1 '+_clinefeed+
        'FROM MOVBENEF '+_clinefeed+
        'WHERE IDTITULAR = '+inttostr(aiidtitular)+' '+_clinefeed+
        'AND IDPESSOA = '+inttostr(aiidpessoa)+' '+_clinefeed+
        'AND IDLOTE = '+inttostr(aiidlote)+' '+_clinefeed+
        'AND TIPOMOV = 13 ';
      if FazQuery(qryAux, ssql) then
        result:=1;
    end;
  end;

{
       IDRUBRICAATRASO  => IDRUBRICA
       IDRUBADIANT      => IDRUBRICA
       IDRUBATRACJUD    => IDRUBACJUD       => IDRUBRICA
       IDRUBATRREVISAO  => IDRUBRICAREVISAO
       IDRUBATRREVACJUD => IDRUBREVACJUD    => IDRUBRICAREVISAO

       IDRUBDEVOLADIANT => IDRUBDEVOLUCAO
       IDRUBDEVACJUD    => IDRUBDEVOLUCAO
       IDRUBDEVREVISAO  => IDRUBDEVOLUCAO
       IDRUBDEVREVACJUD => IDRUBDEVREVISAO  => IDRUBDEVOLUCAO

       IDRUBATRASOABONO => IDRUBABONO
       IDRUBACERTOABONO => IDRUBANTECABONO  => IDRUBABONO
       IDRUB13ACJUD     => IDRUBABONO
       IDRUBATR13ACJUD  => IDRUB13ACJUD     => IDRUBABONO

       IDRUBDEVANTABONO => IDRUBDEVOLABONO
       IDRUBDEV13ACJUD  => IDRUBDEVOLABONO
}

var lirevisao: integer;
begin
  aiidrubrica:=-1;
  aiidrubricaacjud:=-1;
  lirevisao:=VerificaRevisao;
//
//1. Pagamento Normal
//Rubrica de pagamento              IDRUBRICA x
//Rubrica de atraso                 IDRUBRICAATRASO x
//Rubrica de Adiantamento           IDRUBADIANT
//Rubrica de reposição (devolução)  IDRUBDEVOLUCAO
//Rubrica de Devolução de Adiant    IDRUBDEVOLADIANT
//
//2. Adiantamento de abono anual (Fevereiro) - (apenas suplementação / Não tributado)
//Rubrica de pagamento              IDRUBANTECABONO
//Rubrica de atraso                 IDRUBACERTOABONO
//Rubrica de reposição (devolução)  IDRUBDEVANTABONO
//
//3. Abono normal – (INSS e Suplementação / Tributado)
//Rubrica de pagamento              IDRUBABONO
//Rubrica de atraso                 IDRUBATRASOABONO
//Rubrica de reposição (devolução)  IDRUBDEVOLABONO
//
//4.1 Ação Judicial pagamento normal
//Rubrica de pagamento              IDRUBACJUD x
//Rubrica de atraso                 IDRUBATRACJUD x
//Rubrica de reposição (devolução)  IDRUBDEVACJUD
//
//4.2 Ação Judicial – abono
//Rubrica de pagamento              IDRUB13ACJUD
//Rubrica de atraso                 IDRUBATR13ACJUD
//Rubrica de reposição (devolução)  IDRUBDEV13ACJUD
//
//5.1 Revisão - Ação Judicial (Não tributada)
//Rubrica de pagamento                   IDRUBREVACJUD
//Rubrica de atraso                      IDRUBATRREVACJUD
//Rubrica de reposição (devolução)       IDRUBDEVREVACJUD
//
//5.2 Outras Revisões (Tributadas)
//Rubrica de pagamento                   IDRUBRICAREVISAO
//Rubrica de atraso                      IDRUBATRREVISAO
//Rubrica de reposição (devolução)       IDRUBDEVREVISAO


  if lirevisao = 0 then //não é revisão de benefício
  begin
    if aiflgdevolucao = 0 then //pagamento
    begin
      if copy(asmesref,6,2) = '13' then //mes de abono
      begin
        if qryRubBenef.fieldbyname('FLGREFERENCIA').asinteger = 0 then //benefício da fundação
        begin
          if copy(asmesref,1,4) < copy(asmespag,1,4) then //abono de ano anterior
          begin
            aiidrubrica:=qryRubBenef.fieldbyname('IDRUBATRASOABONO').asinteger;
            asmsg:='Atraso de Abono';
            if aiacaojudganha = 1 then
              aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBATR13ACJUD').asinteger;
          end
          else
          begin
            if aiantecipabonomes = 1 then //existe antecipacao de abono no mês
            begin
              aiidrubrica:=qryRubBenef.fieldbyname('IDRUBANTECABONO').asinteger;
              asmsg:='Antecipação de Abono';
              if aiacaojudganha = 1 then
                aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBANTECABONO').asinteger;
            end
            else
            begin
              if aiantecipabonoano = 1 then //existe antecipacao de abono no ano
              begin
                if strtoint(copy(asmespag,6,2)) < qryRubBenef.fieldbyname('MESPGABONO').asinteger then //mês anterior ao abono
                begin
                  aiidrubrica:=qryRubBenef.fieldbyname('IDRUBACERTOABONO').asinteger;
                  asmsg:='Atraso de Antecipação de Abono';
                  if aiacaojudganha = 1 then
                    aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBATR13ACJUD').asinteger;
                end
                else
                begin
                  aiidrubrica:=qryRubBenef.fieldbyname('IDRUBABONO').asinteger;
                  asmsg:='Abono';
                  if aiacaojudganha = 1 then
                    aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUB13ACJUD').asinteger;
                end;
              end
              else
              begin
                aiidrubrica:=qryRubBenef.fieldbyname('IDRUBABONO').asinteger;
                asmsg:='Abono';
                if aiacaojudganha = 1 then
                  aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUB13ACJUD').asinteger;
              end;
            end;
          end;
        end
        else
        begin
          aiidrubrica:=qryRubBenef.fieldbyname('IDRUBABONO').asinteger;
          asmsg:='Abono';
        end;
      end
      else
      begin
        if asflgfrequencia <> 'U' then
        begin
          if qryRubBenef.fieldbyname('FLGREFERENCIA').asinteger = 0 then //benefício da fundação
          begin
            if asmesref < asmespag then //atraso
            begin
              aiidrubrica:=qryRubBenef.fieldbyname('IDRUBRICAATRASO').asinteger;
              asmsg:='Atraso';
              if aiacaojudganha = 1 then
                aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBATRACJUD').asinteger;
            end
            else
            begin
              if aiflgprovisorio = 1 then
              begin
                aiidrubrica:=qryRubBenef.fieldbyname('IDRUBADIANT').asinteger;
                asmsg:='Provisório';
              end
              else
              begin
                aiidrubrica:=qryRubBenef.fieldbyname('IDRUBRICA').asinteger;
                asmsg:='Normal';
                if aiacaojudganha = 1 then
                  aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBACJUD').asinteger;
              end;
            end;
          end
          else
          begin
            if asmesref < asmespag then //atraso
            begin
              aiidrubrica:=qryRubBenef.fieldbyname('IDRUBRICAATRASO').asinteger;
              asmsg:='Atraso';
            end
            else
            begin
              aiidrubrica:=qryRubBenef.fieldbyname('IDRUBRICA').asinteger;
              asmsg:='Normal';
            end
          end;
        end
        else
        begin
          aiidrubrica:=qryRubBenef.fieldbyname('IDRUBRICA').asinteger;
          asmsg:='Normal';
          if aiacaojudganha = 1 then
            aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBACJUD').asinteger;
        end;
      end;
    end
    else //devolução
    begin
      if copy(asmesref,6,2) = '13' then //mes de abono
      begin
        if qryRubBenef.fieldbyname('FLGREFERENCIA').asinteger = 0 then //benefício da fundação
        begin
          if copy(asmesref,1,4) < copy(asmespag,1,4) then //abono de ano anterior
          begin
            aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVOLABONO').asinteger;
            asmsg:='Devolução de Abono';
            if aiacaojudganha = 1 then
              aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBDEV13ACJUD').asinteger;
          end
          else
          begin
            if aiantecipabonomes = 1 then //existe antecipacao de abono no mês
            begin
              aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVANTABONO').asinteger;
              asmsg:='Devolução de Antecipação de Abono';
            end
            else
            begin
              if aiantecipabonoano = 1 then //existe antecipacao de abono no ano
              begin
                if strtoint(copy(asmespag,6,2)) < qryRubBenef.fieldbyname('MESPGABONO').asinteger then //mês anterior ao abono
                begin
                  aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVANTABONO').asinteger;
                  asmsg:='Devolução de Antecipação de Abono';
                end
                else
                begin
                  aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVOLABONO').asinteger;
                  asmsg:='Devolução de Abono';
                  if aiacaojudganha = 1 then
                    aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBDEV13ACJUD').asinteger;
                end;
              end
              else
              begin
                aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVOLABONO').asinteger;
                asmsg:='Devolução de Abono';
                if aiacaojudganha = 1 then
                  aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBDEV13ACJUD').asinteger;
              end;
            end;
          end;
        end
        else
        begin
          aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVOLABONO').asinteger;
          asmsg:='Devolução de Abono';
        end;
      end
      else
      begin
        if asflgfrequencia <> 'U' then
        begin
          if qryRubBenef.fieldbyname('FLGREFERENCIA').asinteger = 0 then //benefício da fundação
          begin
            if asmesref < asmespag then //atraso
            begin
              aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVOLUCAO').asinteger;
              asmsg:='Devolução';
              if aiacaojudganha = 1 then
                aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBDEVACJUD').asinteger;
            end
            else
            begin
              if aiflgprovisorio = 1 then
              begin
                aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVOLADIANT').asinteger;
                asmsg:='Devolução de Provisório';
              end
              else
              begin
                aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVOLUCAO').asinteger;
                asmsg:='Devolução';
                if aiacaojudganha = 1 then
                  aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBDEVACJUD').asinteger;
              end;
            end;
          end
          else
          begin
            aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVOLUCAO').asinteger;
            asmsg:='Devolução';
          end;
        end
        else
        begin
          aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVOLUCAO').asinteger;
          asmsg:='Devolução';
          if aiacaojudganha = 1 then
            aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBDEVACJUD').asinteger;
        end;
      end;
    end;
  end
  else
  begin
    if aiflgdevolucao = 0 then //pagamento
    begin
      if asmesref < asmespag then //atraso
      begin
        aiidrubrica:=qryRubBenef.fieldbyname('IDRUBATRREVISAO').asinteger;
        asmsg:='Revisão Atraso';
        if aiacaojudganha = 1 then
          aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBATRREVACJUD').asinteger;
      end
      else
      begin
        aiidrubrica:=qryRubBenef.fieldbyname('IDRUBRICAREVISAO').asinteger;
        asmsg:='Revisão Normal';
        if aiacaojudganha = 1 then
          aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBREVACJUD').asinteger;
      end;
    end
    else //devolução
    begin
      aiidrubrica:=qryRubBenef.fieldbyname('IDRUBDEVREVISAO').asinteger;
      asmsg:='Revisão Devolução';
      if aiacaojudganha = 1 then
        aiidrubricaacjud:=qryRubBenef.fieldbyname('IDRUBDEVREVACJUD').asinteger;
    end;
  end;
end;

function BuscaIndice(moecodigo: Integer; dataref: String; dataevento: String;
  var IndiceDataRef: double; var IndiceDataEvento: double): Boolean;
Var qryIndiceRef : TwwQuery;
begin
  try
   qryIndiceRef := TwwQuery.Create(nil);          //edilaine WO19556
   qryIndiceRef.DatabaseName := 'Basedados';
   qryIndiceRef.close;
   qryIndiceRef.SQL.Clear;
   qryIndiceRef.SQL.Add(' SELECT CT.MOECODIGO, CT.COTDATA, CT.COTVALOR AS VALORREF, ');
   qryIndiceRef.SQL.Add(' CT1.COTDATA, CT1.COTVALOR AS VALORPAGTO ');
   qryIndiceRef.SQL.Add(' FROM COTACAOMOEDA CT, COTACAOMOEDA CT1 ');
   qryIndiceRef.SQL.Add(' WHERE CT.MOECODIGO = '+inttostr(moecodigo)+' AND CT.COTDATA = ');
   qryIndiceRef.SQL.Add(' TO_DATE('+''''+dataref+''''+','+''''+'DD/MM/YYYY'+''''+')');
   qryIndiceRef.SQL.Add(' AND CT.MOECODIGO = CT1.MOECODIGO AND CT1.COTDATA = ');
   qryIndiceRef.SQL.Add(' TO_DATE('+''''+dataevento+''''+','+''''+'DD/MM/YYYY'+''''+')');
   try
      qryIndiceRef.Open;
   except
      ShowMessage('Erro, na Busca do Índice de Conversão em Cotas!!!');
      exit;
   end;

   if qryIndiceRef.IsEmpty then
   begin
      ShowMessage('Não achou Indice de Conversão em Cotas !!!');
      Exit;
   end;

   IndiceDataRef    := qryIndiceRef.FieldByName('VALORREF').AsFloat;
   IndiceDataEvento := qryIndiceRef.FieldByName('VALORPAGTO').AsFloat;
  finally
   qryIndiceRef.close;
   FreeAndNil(qryIndiceRef);       //edilaine WO19556
  end;
end;

function EscreveRubrica1(pIdPessoa, pIdTitular, pIdPessJur, pIdPlanoprev,
  pIdRubrica, pCodProvDesc, pIdMotivo, pMes, pMesCobranca, pReferencia,
  pIdRegraCalculo, pFlgCompoeSalPart, pFlgCompoeSalBenef, pFlgIRRF, pCodMoeda,
  pValorCotas: string; pValorProvento, pValorIntegral: double; pOrdem: integer;
  pFLGSRB: Integer; pIdResponsavel: Integer) : boolean;
var
  Msg:string;
begin
  Result := true;
  with dtmFolha.qryInsRubSal do
  begin
    Close;
    ParamByName('IdTitular').Value         := StrToInt(pIdTitular);
    ParamByName('IdPlanoprev').Value       := StrToInt(pIdPlanoprev);
    ParamByName('IdPessoa').Value          := StrToInt(pIdPessoa);
    ParamByName('IdPessJur').Value         := StrToInt(pIdPessJur);
    ParamByName('IdRubrica').Value         := StrToInt(pIdRubrica);
    ParamByName('CodProvDesc').Value       := pCodProvDesc;
    ParamByName('IdMotivo').Value          := StrToInt(pIdMotivo);
    ParamByName('Mes').Value               := pMes;
    ParamByName('MesCobranca').Value       := pMesCobranca;
    ParamByName('Referencia').Value        := pReferencia;
    ParamByName('FLGCOMPOESALPART').Value  := StrToInt(pFlgCompoeSalPart);
    ParamByName('FLGCOMPOESALBENEF').Value := StrToInt(pFlgCompoeSalBenef);
    ParamByName('FLGIRRF').Value           := StrToInt(pFlgIRRF);
    ParamByName('SEQRUBRICA').Value        := pOrdem;
    ParamByName('IdResponsavel').Value     := pIdResponsavel;
    ParamByName('ValorProvento').Value     := pValorProvento;
    ParamByName('ValorIntegral').Value     := pValorIntegral;

    if pIdRegraCalculo = '' then
      ParamByName('IdRegraCalculo').Clear
    else
      ParamByName('IdRegraCalculo').Value  := StrToInt(pIdRegraCalculo);

    if (pCodMoeda = '0') or (pCodMoeda = '') then
       ParamByName('CodMoeda').Clear
    else
      ParamByName('CodMoeda').Value:=StrToInt(pCodMoeda);

    if pValorCotas = '' then
      ParamByName('VALORCOTAS').Clear
    else
      ParamByName('VALORCOTAS').Value:=StrToFloat(pValorCotas);

    if pFLGSRB=0 then
      ParamByName('FLGSRB').Clear
    else
      ParamByName('FLGSRB').Value:=pFLGSRB;

    try
      ExecSql;
    except
      on E:EDBEngineError do
      begin
        Result := False;
      end;
    end;
  end;
end;

function GeraSalarioVirtual(sMes, sMesCob: string; iProcesso, iIdtitular,
  iIdResponsavel, iIdFundacao, iIdPessjur, iIdPlanoprev, iSeqProposta,
  iIdRubAuxDoenca,
  iidmotivo: integer;
  dSalAuxDoencaIntegral, dSalAuxDoencaProporcional: double): boolean;
var
  sCodPDescAuxDoenca:string;
  iDia,iMes,iAno:Word;
  iMesRef,iAnoRef:word;
  ProRata:Double;
  ssql: string;
begin
  ProRata:=1;
  iMesRef:=StrToInt(copy(sMES,6,2));   // yyyy/mm
  iAnoRef:=StrToInt(copy(sMES,1,4));   // yyyy/mm

  dtmFolha.qryBeneficio.close;
  dtmFolha.qryBeneficio.parambyname('numeroprocesso').asinteger:=iprocesso;
  dtmFolha.qryBeneficio.parambyname('idtitular').asinteger:=iIdTitular;
  dtmFolha.qryBeneficio.open;
  if not dtmFolha.qryBeneficio.isempty then
  begin
    if dtmFolha.qryBeneficio.FieldByName('DATAINICIO').AsString <> '' then
    begin
      DecodeDate(dtmFolha.qryBeneficio.FieldByName('DATAINICIO').AsDateTime, iAno, iMes,iDia);
      if (iAno=iAnoRef) and (iMes=iMesRef) then
        ProRata:=(30-iDia+1)/30;
    end;
    if dtmFolha.qryBeneficio.FieldByName('DATAFINAL').AsString<>'' then
    begin
      DecodeDate(dtmFolha.qryBeneficio.FieldByName('DATAFINAL').AsDateTime,iAno,iMes,iDia);
      if (iAno=iAnoRef) and (iMes=iMesRef) then
      begin
        ProRata:=(iDia/30);
      end;
    end;
    sCodPDescAuxDoenca:=inttostr(iIdRubAuxDoenca);

    ssql:=' DELETE HISTRUBSAL '+
          ' WHERE IDTITULAR = '+inttostr(iIdTitular)+' '+
          ' AND IDPESSOA = '+inttostr(iIdTitular)+' '+
          ' AND IDPLANOPREV = '+inttostr(iIdPlanoPrev)+' '+
          ' AND IDPESSJUR = '+inttostr(iIdPessjur)+' '+
          ' AND MES = '+QuotedStr(sMes)+' '+
          ' AND MESCOBRANCA = '+QuotedStr(sMesCob)+' '+
          ' AND IDRUBRICA = '+inttostr(iIdRubAuxDoenca);

    ExecutarQuery(dtmfolha.qryAux, ssql);

    result:=EscreveRubrica1(IntToStr(iIdTitular), IntToStr(iIdTitular), IntToStr(iIdPessjur),
      IntToStr(iIdPlanoPrev), IntToStr(iIdRubAuxDoenca),sCodPDescAuxDoenca,
      inttostr(iidmotivo),
      sMes, sMesCob, '***','','0','0','0','0','',
      dSalAuxDoencaProporcional,dSalAuxDoencaIntegral,
      1,4,iIdResponsavel);
  end;
end;

procedure BuscaInfIntegra(pIdPessJur, pIdRubrica, pIdPlanoPrev : integer;
                          var sTipCodigo,sCodTipRecDes,sRecPag,sIdPessoa,sCodTipDoc,sCodPortForma,sCodCentroRespon,
                          sCodSubConta,sCodCentroCustoD,sIdEmpresa,sCodCentroCustoC,sPlaContaD,sPlano,sPlaContaC,
                          sUnidNegoc,sIdEmpresaProp : string);

begin
  with dtmFolha.qryIntegraRubXPlano do
  begin
    // Busca Informações de Integração na tabela RUBRICAXPLANO
    Close;
    ParamByName('pIdPessJur').Value := pIdPessJur;
    ParamByName('pIdRubrica').Value := pIdRubrica;
    ParamByName('pIdPlanoPrev').Value := pIdPlanoPrev;
    Open;
    if not IsEmpty
    then begin
           if FieldByName('TipCodigo').AsString <> ''
           then sTipCodigo := FieldByName('TipCodigo').AsString
           else sTipCodigo := '';

           if FieldByName('CodTipRecDes').AsString <> ''
           then sCodTipRecDes := FieldByName('CodTipRecDes').AsString
           else sCodTipRecDes := '';

           if FieldByName('RecPag').AsString <> ''
           then sRecPag := FieldByName('RecPag').AsString
           else sRecPag := '';

           if FieldByName('IdPessoa').AsInteger <> NULL
           then
           begin
              sIdPessoa := IntToStr(FieldByName('IdPessoa').AsInteger);
           end
           else sIdPessoa := '';

           if FieldByName('CodTipDoc').AsString <> ''
           then sCodTipDoc := FieldByName('CodTipDoc').AsString
           else sCodTipDoc := '';

           if FieldByName('CodPortForma').AsString <> ''
           then sCodPortForma := FieldByName('CodPortForma').AsString
           else sCodPortForma := '';

           if FieldByName('CodCentroRespon').AsString <> ''
           then sCodCentroRespon := FieldByName('CodCentroRespon').AsString
           else sCodCentroRespon := '';

           if FieldByName('CodSubConta').AsString <> ''
           then sCodSubConta := FieldByName('CodSubConta').AsString
           else sCodSubConta := '';

           if FieldByName('CodCentroCustoD').AsString <> ''
           then sCodCentroCustoD := FieldByName('CodCentroCustoD').AsString
           else sCodCentroCustoD := '';

           if FieldByName('IdEmpresa').AsString <> ''
           then sIdEmpresa := FieldByName('IdEmpresa').AsString
           else sIdEmpresa := '';

           if FieldByName('CodCentroCustoC').AsString <> ''
           then sCodCentroCustoC := FieldByName('CodCentroCustoC').AsString
           else sCodCentroCustoC := '';

           if FieldByName('PlaContaD').AsString <> ''
           then sPlaContaD := FieldByName('PlaContaD').AsString
           else sPlaContaD := '';

           if FieldByName('Plano').AsString <> ''
           then sPlano := FieldByName('Plano').AsString
           else sPlano := '';

           if FieldByName('PlaContaC').AsString <> ''
           then sPlaContaC := FieldByName('PlaContaC').AsString
           else sPlaContaC := '';

           if FieldByName('UnidNegoc').AsString <> ''
           then sUnidNegoc := FieldByName('UnidNegoc').AsString
           else sUnidNegoc := '';

           if FieldByName('IdEmpresaProp').AsString <> ''
           then sIdEmpresaProp := FieldByName('IdEmpresaProp').AsString
           else sIdEmpresaProp := '';

         end;
  end;

  // Busca Informações de Integração na tabela PLANPREV
  with dtmFolha.qryIntegraPlano do
  begin
    Close;
    ParamByName('pIdPlanoPrev').Value := pIdPlanoPrev;
    Open;
    if not IsEmpty
    then begin
           if sCodTipDoc = ''
           then if FieldByName('CodTipDoc').AsString <> ''
                then sCodTipDoc := FieldByName('CodTipDoc').AsString
                else sCodTipDoc := '';

           if sCodTipRecDes = ''
           then if FieldByName('CodTipRecDes').AsString <> ''
                then sCodTipRecDes := FieldByName('CodTipRecDes').AsString
                else sCodTipRecDes := '';

           if sRecPag = ''
           then if FieldByName('RecPag').AsString <> ''
                then sRecPag := FieldByName('RecPag').AsString
                else sRecPag := '';

           if sIdEmpresaProp = ''
           then if FieldByName('IdEmpresaProp').AsString <> ''
                then sIdEmpresaProp := FieldByName('IdEmpresaProp').AsString
                else sIdEmpresaProp := '';
         end;
  end;

end; // BuscaInfIntegra

function AtualizaDataFolha(pMesRef, pAnoRef : string) : string;
begin
  if pMesRef = '13' then
    pMesRef:='12';
  with dtmFolha.qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT C.DATAPAGBENEF '+
            ' FROM CALENDDATAS C, FUNDACAO F '+
            ' WHERE (F.IDPESSOA = ' + IntToStr(iIdFundacao)+') '+
            ' AND (F.IDCALENDARIO = C.IDCALENDARIO) '+
            ' AND (C.ANOMESREF = '''+pAnoRef+'/'+pMesRef+''') '+
            ' AND (C.FLGINTERNO = ''AS'') ');
    Open;
    if not IsEmpty then
      Result:=FieldByName('DATAPAGBENEF').asstring
    else
      Result:='01/'+pMesRef+'/'+pAnoRef;
    Close;
  end;
end;

function PegaIndiceData(pCodMoeda : integer; pDataRef : string; var pIndice : double) : boolean;
var
  bOk : boolean;
  aData:string;
begin
  bOk := True;
  with dtmFolha.qryCotMoedaData do
  begin
    ParamByName('MoeCodigo').Value := pCodMoeda;
    ParamByName('pDataRef').Value   := pDataRef;
    try
      Open;
    except
      on E:EDBEngineError do
      begin
        bOk := False;
      end;
    end;
    if bOk then
    begin
      if not dtmFolha.qryCotMoedaData.IsEmpty then
        pIndice := FieldByName('CotValor').AsFloat
      else
        bOk := False;
    end;
    Close;
  end;
  Result := bOk;
end;

function PegaIndiceMes(pCodMoeda:integer; pMesRef:string; var pIndice:double):boolean;
var
  pDataRef: string;
begin
  if copy(pMesRef,6,2)='13' then
    pMesRef:=copy(pMesRef,1,4)+'/12';
  pDataRef:=AjustaDataUltDiaMes('31'+copy(pMesRef,5,3)+'/'+copy(pMesRef,1,4));
  Result:= PegaIndiceData(pCodMoeda,pDataRef,pIndice);
end;

procedure BuscaInfIntegraAbono(pIdPessoa,pIdPessJur,pIdPlanoPrev,pIdBeneficio,pSeqProposta : integer;
                               var sTipCodigo,sCodTipRecDes,sRecPag,sCodTipDoc,sCodPortForma,sCodCentroRespon,
                               sCodSubConta,sCodCentroCustoD,sIdEmpresa,sCodCentroCustoC,sPlaContaD,sPlano,sPlaContaC,
                               sUnidNegoc,sIdEmpresaProp : string);
begin
  with dtmFolha.qryABNPart do
  begin
    // Busca Informações de Integração na tabela BENEFPLANOPART
    Close;
    ParamByName('pIdPessoa').AsInteger := pIdPessoa;
    ParamByName('pIdPessJur').AsInteger := pIdPessJur;
    ParamByName('pIdBeneficio').AsInteger := pIdBeneficio;
    ParamByName('pIdPlanoPrev').AsInteger := pIdPlanoPrev;
    ParamByName('pSeqProposta').AsInteger := pSeqProposta;
    Open;
    if not IsEmpty
    then begin
           if FieldByName('TipCodigoABN').AsString <> ''
           then sTipCodigo := FieldByName('TipCodigoABN').AsString
           else sTipCodigo := '';

           if FieldByName('CodTipRecDesABN').AsString <> ''
           then sCodTipRecDes := FieldByName('CodTipRecDesABN').AsString
           else sCodTipRecDes := '';

           if FieldByName('RecPagABN').AsString <> ''
           then sRecPag := FieldByName('RecPagABN').AsString
           else sRecPag := '';

           if FieldByName('CodTipDocABN').AsString <> ''
           then sCodTipDoc := FieldByName('CodTipDocABN').AsString
           else sCodTipDoc := '';

           if FieldByName('CodPortFormaABN').AsString <> ''
           then sCodPortForma := FieldByName('CodPortFormaABN').AsString
           else sCodPortForma := '';

           if FieldByName('CODCENTRORESPONA').AsString <> ''
           then sCodCentroRespon := FieldByName('CODCENTRORESPONA').AsString
           else sCodCentroRespon := '';

           if FieldByName('CodSubContaABN').AsString <> ''
           then sCodSubConta := FieldByName('CodSubContaABN').AsString
           else sCodSubConta := '';

           if FieldByName('CODCENTROCUSTODA').AsString <> ''
           then sCodCentroCustoD := FieldByName('CODCENTROCUSTODA').AsString
           else sCodCentroCustoD := '';

           if FieldByName('IdEmpresaABN').AsString <> ''
           then sIdEmpresa := FieldByName('IdEmpresaABN').AsString
           else sIdEmpresa := '';

           if FieldByName('CODCENTROCUSTOCA').AsString <> ''
           then sCodCentroCustoC := FieldByName('CODCENTROCUSTOCA').AsString
           else sCodCentroCustoC := '';

           if FieldByName('PlaContaDABN').AsString <> ''
           then sPlaContaD := FieldByName('PlaContaDABN').AsString
           else sPlaContaD := '';

           if FieldByName('PlanoABN').AsString <> ''
           then sPlano := FieldByName('PlanoABN').AsString
           else sPlano := '';

           if FieldByName('PlaContaCABN').AsString <> ''
           then sPlaContaC := FieldByName('PlaContaCABN').AsString
           else sPlaContaC := '';

           if FieldByName('UnidNegocABN').AsString <> ''
           then sUnidNegoc := FieldByName('UnidNegocABN').AsString
           else sUnidNegoc := '';

           if FieldByName('IdEmpresaPropABN').AsString <> ''
           then sIdEmpresaProp := FieldByName('IdEmpresaPropABN').AsString
           else sIdEmpresaProp := '';

         end;
  end;

  with dtmFolha.qryABNPlanoPatro do
  begin
    // Busca Informações de Integração na tabela BENEFPLANPATRO
    Close;
    ParamByName('pIdPessJur').AsInteger := pIdPessJur;
    ParamByName('pIdBeneficio').AsInteger := pIdBeneficio;
    ParamByName('pIdPlanoPrev').AsInteger := pIdPlanoPrev;
    Open;
    if not IsEmpty
    then begin
           if (FieldByName('TipCodigoABN').AsString <> '') and
              (Trim(sTipCodigo) = '')
           then sTipCodigo := FieldByName('TipCodigoABN').AsString;

           if (FieldByName('CodTipRecDesABN').AsString <> '') and
              (Trim(sCodTipRecDes) = '')
           then sCodTipRecDes := FieldByName('CodTipRecDesABN').AsString;

           if (FieldByName('RecPagABN').AsString <> '') and
              (Trim(sRecPag) = '')
           then sRecPag := FieldByName('RecPagABN').AsString;

           if (FieldByName('CodTipDocABN').AsString <> '') and
              (Trim(sCodTipDoc) = '')
           then sCodTipDoc := FieldByName('CodTipDocABN').AsString;

           if (FieldByName('CodPortFormaABN').AsString <> '') and
              (Trim(sCodPortForma) = '')
           then sCodPortForma := FieldByName('CodPortFormaABN').AsString;

           if (FieldByName('CODCENTRORESPONA').AsString <> '') and
              (Trim(sCodCentroRespon) = '')
           then sCodCentroRespon := FieldByName('CODCENTRORESPONA').AsString;

           if (FieldByName('CodSubContaABN').AsString <> '') and
              (Trim(sCodSubConta) = '')
           then sCodSubConta := FieldByName('CodSubContaABN').AsString;

           if (FieldByName('CODCENTROCUSTODA').AsString <> '') and
              (Trim(sCodCentroCustoD) = '')
           then sCodCentroCustoD := FieldByName('CODCENTROCUSTODA').AsString;

           if (FieldByName('IdEmpresaABN').AsString <> '') and
              (Trim(sIdEmpresa) = '')
           then sIdEmpresa := FieldByName('IdEmpresaABN').AsString;

           if (FieldByName('CODCENTROCUSTOCA').AsString <> '') and
              (Trim(sCodCentroCustoC) = '')
           then sCodCentroCustoC := FieldByName('CODCENTROCUSTOCA').AsString;

           if (FieldByName('PlaContaDABN').AsString <> '') and
              (Trim(sPlaContaD) = '')
           then sPlaContaD := FieldByName('PlaContaDABN').AsString;

           if (FieldByName('PlanoABN').AsString <> '') and
              (Trim(sPlano) = '')
           then sPlano := FieldByName('PlanoABN').AsString;

           if (FieldByName('PlaContaCABN').AsString <> '') and
              (Trim(sPlaContaC) = '')
           then sPlaContaC := FieldByName('PlaContaCABN').AsString;

           if (FieldByName('UnidNegocABN').AsString <> '') and
              (Trim(sUnidNegoc) = '')
           then sUnidNegoc := FieldByName('UnidNegocABN').AsString;

           if (FieldByName('IdEmpresaPropABN').AsString <> '') and
              (Trim(sIdEmpresaProp) = '')
           then sIdEmpresaProp := FieldByName('IdEmpresaPropABN').AsString;
         end;
  end;

  with dtmFolha.qryABNPlano do
  begin
    // Busca Informações de Integração na tabela BENEFPLANPREV
    Close;
    ParamByName('pIdBeneficio').AsInteger := pIdBeneficio;
    ParamByName('pIdPlanoPrev').AsInteger := pIdPlanoPrev;
    Open;
    if not IsEmpty
    then begin
           if (FieldByName('TipCodigoABN').AsString <> '') and
              (Trim(sTipCodigo) = '')
           then sTipCodigo := FieldByName('TipCodigoABN').AsString;

           if (FieldByName('CodTipRecDesABN').AsString <> '') and
              (Trim(sCodTipRecDes) = '')
           then sCodTipRecDes := FieldByName('CodTipRecDesABN').AsString;

           if (FieldByName('RecPagABN').AsString <> '') and
              (Trim(sRecPag) = '')
           then sRecPag := FieldByName('RecPagABN').AsString;

           if (FieldByName('CodTipDocABN').AsString <> '') and
              (Trim(sCodTipDoc) = '')
           then sCodTipDoc := FieldByName('CodTipDocABN').AsString;

           if (FieldByName('CodPortFormaABN').AsString <> '') and
              (Trim(sCodPortForma) = '')
           then sCodPortForma := FieldByName('CodPortFormaABN').AsString;

           if (FieldByName('CODCENTRORESPONA').AsString <> '') and
              (Trim(sCodCentroRespon) = '')
           then sCodCentroRespon := FieldByName('CODCENTRORESPONA').AsString;

           if (FieldByName('CodSubContaABN').AsString <> '') and
              (Trim(sCodSubConta) = '')
           then sCodSubConta := FieldByName('CodSubContaABN').AsString;

           if (FieldByName('CODCENTROCUSTODA').AsString <> '') and
              (Trim(sCodCentroCustoD) = '')
           then sCodCentroCustoD := FieldByName('CODCENTROCUSTODA').AsString;

           if (FieldByName('IdEmpresaABN').AsString <> '') and
              (Trim(sIdEmpresa) = '')
           then sIdEmpresa := FieldByName('IdEmpresaABN').AsString;

           if (FieldByName('CODCENTROCUSTOCA').AsString <> '') and
              (Trim(sCodCentroCustoC) = '')
           then sCodCentroCustoC := FieldByName('CODCENTROCUSTOCA').AsString;

           if (FieldByName('PlaContaDABN').AsString <> '') and
              (Trim(sPlaContaD) = '')
           then sPlaContaD := FieldByName('PlaContaDABN').AsString;

           if (FieldByName('PlanoABN').AsString <> '') and
              (Trim(sPlano) = '')
           then sPlano := FieldByName('PlanoABN').AsString;

           if (FieldByName('PlaContaCABN').AsString <> '') and
              (Trim(sPlaContaC) = '')
           then sPlaContaC := FieldByName('PlaContaCABN').AsString;

           if (FieldByName('UnidNegocABN').AsString <> '') and
              (Trim(sUnidNegoc) = '')
           then sUnidNegoc := FieldByName('UnidNegocABN').AsString;

           if (FieldByName('IdEmpresaPropABN').AsString <> '') and
              (Trim(sIdEmpresaProp) = '')
           then sIdEmpresaProp := FieldByName('IdEmpresaPropABN').AsString;
         end;
  end;

end; // BuscaInfIntegraAbono
// SOL 242846 PPM 579506 refeito o delete da ApagaPreviaEfetivacao em procedure
Function ApagaPreviaEfetivacao(sIdLote : string; bcommitparcial: boolean): boolean;
 var SP_ApagaPrevia:TwwStoredProc;
     //query:TwwQuery;            // Andre Imakawa - SIG 55810 // Andre Imakawa - SIG 99346
     //iTotalProcessado: Integer; // Andre Imakawa - SIG 55810 // Andre Imakawa - SIG 99346
     //SP_ApagaPreviaAux:TwwStoredProc; // Andre Imakawa - SIG 67635 // Andre Imakawa - SIG 68391
     //sSQL: string; // Andre Imakawa - SIG 83677              // Andre Imakawa - SIG 99346
begin
  Result := true;
  try
    // Andre Imakawa - SIG 99346 - Inicio
    {
    // Andre Imakawa - SIG 83677 - Inicio
    if IsLoteResgate(sIdLote) then
    begin
        sSQL := ' UPDATE CM.HSTPRAZOACUMULACAOFOLHA HST                      '
              + ' SET FLGPROCESSADO = 1                                      '
              + ' WHERE FLGPROCESSADO = 2                                    '
              + ' AND IDHSTFOLHABENEF IS NULL                                '
              + ' AND EXISTS (SELECT 1                                       '
              + '         FROM PREVIA P                                      '
              + '        WHERE P.IDPESSOA = HST.IDPESSOA                     '
              + '          AND P.IDTITULAR = HST.IDTITULAR                   '
              + '          AND P.IDPLANOPREV = HST.IDPLANOPREV               '
              + '          AND P.IDLOTE = ' + sIdLote
              + '          AND EXISTS(  SELECT 1                             '
              + '                 FROM PARTPREVPLAN PART                     '
              + '                WHERE PART.IDPESSOA    = P.IDTITULAR        '
              + '                  AND PART.IDPESSJUR   = P.IDPATRO          '
              + '                  AND PART.IDPLANOPREV = P.IDPLANOPREV      '
              + '                  AND PART.TIPOOPCAOIR = 2))                ';

      with TwwQuery.Create(nil) do
      begin
        DataBaseName := 'BaseDados';
        Close;
        SQl.Clear;
        SQL.Add(sSQL);

        if not dtmBaseDados.dbBaseDados.InTransaction then
        begin
          dtmBaseDados.dbBaseDados.StartTransaction;
        end;
        ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;
        Close;
        Free;
      end;

    end;
    // Andre Imakawa - SIG 83677 - Fim
    }
    // Andre Imakawa - SIG 99346 - Fim

    SP_ApagaPrevia := TwwStoredProc.Create(nil);      //edilaine WO19556
    SP_ApagaPrevia.DataBaseName := 'BaseDados';
    SP_ApagaPrevia.StoredProcName:='CM.SP_APAGAPREVIA';
    SP_ApagaPrevia.Params.CreateParam(ftFloat, 'pIdLote', ptInput);
    SP_ApagaPrevia.Params.CreateParam(ftInteger, 'pIdUsuario', ptInput);
    SP_ApagaPrevia.Params.CreateParam(ftInteger, 'pIdTitular', ptInput);
    SP_ApagaPrevia.ParamByName('pIdLote').asfloat := strtofloat(sIdLote);
    SP_ApagaPrevia.ParamByName('pIdUsuario').AsInteger := 0;
    SP_ApagaPrevia.ParamByName('pIdTitular').AsInteger := 0;

    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
    try
      SP_ApagaPrevia.Prepare; // SOL 215766 - KTN 2044856
      SP_ApagaPrevia.ExecProc; // SOL 215766 - KTN 2044856
      dtmBaseDados.dbBaseDados.Commit;
    except
      Result := false;
    end;




    // Andre Imakawa - SIG 68391 - Inicio
    {
    // Andre Imakawa - SIG 67635 - Inicio

    SP_ApagaPreviaAux := TwwStoredProc.Create(Application);
    SP_ApagaPreviaAux.DataBaseName := 'BaseDados';
    SP_ApagaPreviaAux.StoredProcName:='CM.SP_APAGA_PREVIA_AUXILIAR';
    SP_ApagaPreviaAux.Params.CreateParam(ftFloat, 'IN_IDLOTE', ptInput);
    SP_ApagaPreviaAux.Params.CreateParam(ftInteger, 'IN_IDUSUARIO', ptInput);
    SP_ApagaPreviaAux.Params.CreateParam(ftInteger, 'IN_FLGUSALISTA', ptInput);
    SP_ApagaPreviaAux.ParamByName('IN_IDLOTE').asfloat := strtofloat(sIdLote);
    SP_ApagaPreviaAux.ParamByName('IN_IDUSUARIO').AsInteger := 0;
    SP_ApagaPreviaAux.ParamByName('IN_FLGUSALISTA').AsInteger := 0;

    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

    SP_ApagaPreviaAux.Prepare;
    SP_ApagaPreviaAux.ExecProc;
    dtmBaseDados.dbBaseDados.Commit;


    }


    // Andre Imakawa - SIG 99346 - Inicio
    {
    // Andre Imakawa - SIG 65680 - Inicio
    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE CM.LOG_EXCLUSAO_PREVIA B');
       SQL.Add('WHERE B.IDLOTE  = '+sIdLote);
       //SQL.Add('  AND ROWNUM < 2000 '); // Andre Imakawa - SIG TIBERO

       //repeat // Andre Imakawa - SIG TIBERO
         if not dtmBaseDados.dbBaseDados.InTransaction then
         begin
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
       //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO

    end;

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE CM.LOG_ALT_PREVIA B');
       SQL.Add('WHERE B.IDLOTE  = '+sIdLote);
       //SQL.Add('  AND ROWNUM < 2000 '); // Andre Imakawa - SIG TIBERO

       //repeat // Andre Imakawa - SIG TIBERO
         if not dtmBaseDados.dbBaseDados.InTransaction then
         begin
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
       //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO

    end;

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add(' DELETE FROM CM.OBS_PREVIA_BASEPGTO OBA ');
       SQL.Add(' WHERE EXISTS (SELECT 1 FROM CM.LOG_ALT_BASEPGTO BA ');
       SQL.ADD(' WHERE BA.IDOBS = OBA.IDOBS ');
       SQL.ADD(' AND EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO ');
       SQL.Add(' AND B.IDLOTE  = '+sIdLote+ ' ))' );

       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;

    end;
    
    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add(' DELETE FROM CM.LOG_ALT_BASEPGTO BA ');
       SQL.ADD(' WHERE EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO ');
       SQL.Add(' AND B.IDLOTE  = '+sIdLote+ ' )' );

       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;
       dtmBaseDados.dbBaseDados.Commit;
       
    end;

    // Andre Imakawa - SIG 65680 - Fim

//SOL 207789/16579 PPM 543916
    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE FROM CM.BASEDEPAGAMENTOAPOIO BA ');
       //SQL.Add(' WHERE ROWNUM < 2000 ');                                                               // Andre Imakawa - SIG 62918 // Andre Imakawa - SIG TIBERO
       SQL.Add(' WHERE EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO ');   // Andre Imakawa - SIG 62918
       SQL.Add(' AND B.IDLOTE  = '+sIdLote+ ' )' );

       // Andre Imakawa - SIG 62918 - Inicio
       //repeat // Andre Imakawa - SIG TIBERO
         if not dtmBaseDados.dbBaseDados.InTransaction then
         begin
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
       //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO
       // Andre Imakawa - SIG 62918 - Fim
    end;

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE BASEDEPAGAMENTO B');
       SQL.Add('WHERE B.IDLOTE  = '+sIdLote);
       //SQL.Add('  AND ROWNUM < 2000 '); // Andre Imakawa - SIG 62918 // Andre Imakawa - SIG TIBERO

       // Andre Imakawa - SIG 62918 - Inicio
       //repeat // Andre Imakawa - SIG TIBERO
         if not dtmBaseDados.dbBaseDados.InTransaction then
         begin
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
       //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO
       // Andre Imakawa - SIG 62918 - Fim
    end;
//SOL 207789/16579 PPM 543916

    // Andre Imakawa - SIG 55810 - Inicio
    query := TwwQuery.Create(Application);

    with query do
    begin
      DataBaseName := 'BaseDados';
      Close;
      SQl.Clear;
      //SQL.Add(' SELECT H.IDTITULAR, H.ROWID,  '); // Andre Imakawa - SIG TIBERO
      SQL.Add(' SELECT H.IDTITULAR,  '); // Andre Imakawa - SIG TIBERO      
      SQL.Add('(SELECT MAX(MESCOBRANCA) FROM HSTBITRIBUTACAO H1 WHERE OPERACAO IN (''S'', ''A'') ');
      SQL.Add(' AND H.IDTITULAR = H1.IDTITULAR AND H.ROWID <> H1.ROWID) AS ULTIMOMES');
      SQL.Add(' FROM HSTBITRIBUTACAO H ');
      SQL.Add(' WHERE IDLOTE  = '+sIdLote);
      Open;
    end;

    // Andre Imakawa - SIG 55810 - Fim

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE HSTBITRIBUTACAO ');
       SQL.Add('WHERE OPERACAO=''S''');
       SQL.Add('AND IDLOTE  = '+sIdLote);
       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;
       dtmBaseDados.dbBaseDados.Commit;
    end;

    // Andre Imakawa - SIG 55810 - Inicio
    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

    iTotalProcessado := 0;

    with TwwQuery.Create(nil) do
    begin
      DataBaseName := 'BaseDados';
      while not query.Eof do begin
        Close;
        SQl.Clear;
        SQL.Add(' UPDATE BITRIBUTACAO B ');
        SQL.Add(' SET B.ULTMESPROC = '+ QuotedStr(query.Fieldbyname('ULTIMOMES').AsString));
        SQL.Add(' WHERE IDTITULAR  = '+ query.Fieldbyname('IDTITULAR').AsString);

        ExecSQL;

        inc(iTotalProcessado);

        if iTotalProcessado >= 100 then begin
          if dtmBaseDados.dbBaseDados.InTransaction then
          begin
            dtmBaseDados.dbBaseDados.Commit;
          end;
          If Not dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.StartTransaction;
    
          iTotalProcessado := 0;

        end;
        query.Next;
      end;
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
        dtmBaseDados.dbBaseDados.Commit;
      end;
    end;


    query.Close;
    query.Free;

    // Andre Imakawa - SIG 55810 - Fim

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE ');
       SQL.Add('  FROM HSTDEDIDADEBITRIB H ');
       SQL.Add('   WHERE ');
       SQL.Add('   IDLOTE = '+sIdLote);
       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;
       dtmBaseDados.dbBaseDados.Commit;
    End;

    // Andre Imakawa - SIG 67635 - Fim
    }
    // Andre Imakawa - SIG 99346 - Fim
  finally
    FreeAndNil(SP_ApagaPrevia);
    //FreeAndNil(SP_ApagaPreviaAux);// Andre Imakawa - SIG 67635 // Andre Imakawa - SIG 68391
  end;
end;
// SOL 242846 PPM 579506 refeito o delete em procedure
//APAGA PREVIA DA LISTA DO USUARIO
// SOL 242846 PPM 579506 refeito o delete da ApagaPreviaEfetivacaoLista em procedure
Function ApagaPreviaEfetivacaoLista(sIdLote : string): boolean;
 var SP_ApagaPrevia:TwwStoredProc;
     //query:TwwQuery;            // Andre Imakawa - SIG 55810 // Andre Imakawa - SIG 99346
     //iTotalProcessado: Integer; // Andre Imakawa - SIG 55810 // Andre Imakawa - SIG 99346
     //SP_ApagaPreviaAux:TwwStoredProc; // Andre Imakawa - SIG 67635 // Andre Imakawa - SIG 68391
     //sSQL: string; // Andre Imakawa - SIG 83677              // Andre Imakawa - SIG 99346
begin
  Result := true;
  try
    // Andre Imakawa - SIG 99346 - Inicio
    {
    // Andre Imakawa - SIG 83677 - Inicio
    if IsLoteResgate(sIdLote) then
    begin
        sSQL := ' UPDATE CM.HSTPRAZOACUMULACAOFOLHA HST                      '
              + ' SET FLGPROCESSADO = 1                                      '
              + ' WHERE FLGPROCESSADO = 2                                    '
              + ' AND IDHSTFOLHABENEF IS NULL                                '
              + ' AND EXISTS (SELECT 1                                       '
              + '         FROM PREVIA P                                      '
              + '        WHERE P.IDPESSOA = HST.IDPESSOA                     '
              + '          AND P.IDTITULAR = HST.IDTITULAR                   '
              + '          AND P.IDPLANOPREV = HST.IDPLANOPREV               '
              + '          AND P.IDLOTE = ' + sIdLote
              + '          AND EXISTS(  SELECT 1                             '
              + '                 FROM PARTPREVPLAN PART                     '
              + '                WHERE PART.IDPESSOA    = P.IDTITULAR        '
              + '                  AND PART.IDPESSJUR   = P.IDPATRO          '
              + '                  AND PART.IDPLANOPREV = P.IDPLANOPREV      '
              + '                  AND PART.TIPOOPCAOIR = 2)                '
              + ' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD, LISTAFOLHABENEF L '
              + '                                        WHERE P.IDTITULAR = LD.IDTITULAR '
              + '                                        AND L.IDUSUARIO = '+IntToStr(sistema.IdUsuario)
              + '                                        AND L.IDLISTA = LD.IDLISTA)) ';

      with TwwQuery.Create(nil) do
      begin
        DataBaseName := 'BaseDados';
        Close;
        SQl.Clear;
        SQL.Add(sSQL);

        if not dtmBaseDados.dbBaseDados.InTransaction then
        begin
          dtmBaseDados.dbBaseDados.StartTransaction;
        end;
        ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;
        Close;
        Free;
      end;

    end;
    // Andre Imakawa - SIG 83677 - Fim
    }
    // Andre Imakawa - SIG 99346 - Fim

    SP_ApagaPrevia := TwwStoredProc.Create(nil);       //edilaine WO19556
    SP_ApagaPrevia.DataBaseName := 'BaseDados';
    SP_ApagaPrevia.StoredProcName:='CM.SP_APAGAPREVIA';
    SP_ApagaPrevia.Params.CreateParam(ftFloat, 'pIdLote', ptInput);
    SP_ApagaPrevia.Params.CreateParam(ftInteger, 'pIdUsuario', ptInput);
    SP_ApagaPrevia.Params.CreateParam(ftInteger, 'pIdTitular', ptInput);
    SP_ApagaPrevia.ParamByName('pIdLote').asfloat := strtofloat(sIdLote);
    SP_ApagaPrevia.ParamByName('pIdUsuario').AsInteger := sistema.IdUsuario;
    SP_ApagaPrevia.ParamByName('pIdTitular').AsInteger := 0;

    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
    try
      SP_ApagaPrevia.Prepare; // SOL 215766 - KTN 2044856
      SP_ApagaPrevia.ExecProc; // SOL 215766 - KTN 2044856
      dtmBaseDados.dbBaseDados.Commit;
    except
      Result := false;
    end;


    // Andre Imakawa - SIG 68391 - Inicio
    {
    // Andre Imakawa - SIG 67635 - Inicio

    SP_ApagaPreviaAux := TwwStoredProc.Create(Application);
    SP_ApagaPreviaAux.DataBaseName := 'BaseDados';
    SP_ApagaPreviaAux.StoredProcName:='CM.SP_APAGA_PREVIA_AUXILIAR';
    SP_ApagaPreviaAux.Params.CreateParam(ftFloat, 'IN_IDLOTE', ptInput);
    SP_ApagaPreviaAux.Params.CreateParam(ftInteger, 'IN_IDUSUARIO', ptInput);
    SP_ApagaPreviaAux.Params.CreateParam(ftInteger, 'IN_FLGUSALISTA', ptInput);
    SP_ApagaPreviaAux.ParamByName('IN_IDLOTE').asfloat := strtofloat(sIdLote);
    SP_ApagaPreviaAux.ParamByName('IN_IDUSUARIO').AsInteger := sistema.IdUsuario;
    SP_ApagaPreviaAux.ParamByName('IN_FLGUSALISTA').AsInteger := 1;

    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

    SP_ApagaPreviaAux.Prepare;
    SP_ApagaPreviaAux.ExecProc; 
    dtmBaseDados.dbBaseDados.Commit;

    } // Andre Imakawa - SIG 68391 - Fim

    // Andre Imakawa - SIG 99346 - Inicio
    {
    // Andre Imakawa - SIG 65680 - Inicio
    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE FROM CM.LOG_EXCLUSAO_PREVIA B ');
       //SQL.Add(' WHERE ROWNUM < 2000 ');      // Andre Imakawa - SIG TIBERO
       SQL.Add(' WHERE B.IDLOTE  = '+sIdLote ); // Andre Imakawa - SIG TIBERO
       SQL.Add(' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD, LISTAFOLHABENEF L ');
       SQL.Add('                                        WHERE B.IDTITULAR = LD.IDTITULAR '); // SOL 242624/17054 Kintana 715180
       SQL.Add('                                        AND L.IDUSUARIO = '+IntToStr(sistema.IdUsuario));
       SQL.Add('                                        AND L.IDLISTA = LD.IDLISTA) ');

      //repeat // Andre Imakawa - SIG TIBERO
        if not dtmBaseDados.dbBaseDados.InTransaction then
        begin
           dtmBaseDados.dbBaseDados.StartTransaction;
        end;
        ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;
      //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO

    end;

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE FROM CM.LOG_ALT_PREVIA B ');
       //SQL.Add(' WHERE ROWNUM < 2000 ');      // Andre Imakawa - SIG TIBERO
       SQL.Add(' WHERE B.IDLOTE  = '+sIdLote ); // Andre Imakawa - SIG TIBERO
       SQL.Add(' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD, LISTAFOLHABENEF L ');
       SQL.Add('                                        WHERE B.IDTITULAR = LD.IDTITULAR '); // SOL 242624/17054 Kintana 715180
       SQL.Add('                                        AND L.IDUSUARIO = '+IntToStr(sistema.IdUsuario));
       SQL.Add('                                        AND L.IDLISTA = LD.IDLISTA) ');

      //repeat // Andre Imakawa - SIG TIBERO
        if not dtmBaseDados.dbBaseDados.InTransaction then
        begin
           dtmBaseDados.dbBaseDados.StartTransaction;
        end;
        ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;
      //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO

    end;

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add(' DELETE FROM CM.OBS_PREVIA_BASEPGTO OBA ');
       SQL.Add(' WHERE EXISTS (SELECT 1 FROM CM.LOG_ALT_BASEPGTO BA ');
       SQL.ADD(' WHERE BA.IDOBS = OBA.IDOBS ');
       SQL.ADD(' AND EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO ');
       SQL.Add(' AND B.IDLOTE  = '+sIdLote);
       SQL.Add(' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD, LISTAFOLHABENEF L ');
       SQL.Add('                                        WHERE B.IDTITULAR = LD.IDTITULAR ');
       SQL.Add('                                        AND L.IDUSUARIO = '+IntToStr(sistema.IdUsuario));
       SQL.Add('                                        AND L.IDLISTA = LD.IDLISTA) '+ '))');

       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;

    end;
    
    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add(' DELETE FROM CM.LOG_ALT_BASEPGTO BA ');
       SQL.ADD(' WHERE EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO ');
       SQL.Add(' AND B.IDLOTE  = '+sIdLote);
       SQL.Add(' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD, LISTAFOLHABENEF L ');
       SQL.Add('                                        WHERE B.IDTITULAR = LD.IDTITULAR ');
       SQL.Add('                                        AND L.IDUSUARIO = '+IntToStr(sistema.IdUsuario));
       SQL.Add('                                        AND L.IDLISTA = LD.IDLISTA) '+ ' )');

       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;
       dtmBaseDados.dbBaseDados.Commit;
    end;

    // Andre Imakawa - SIG 65680 - Fim

//SOL 207789/16579 PPM 543916
    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE FROM CM.BASEDEPAGAMENTOAPOIO BA ');
       //SQL.Add(' WHERE ROWNUM < 2000 ');                                                  // Andre Imakawa - SIG 62918 // Andre Imakawa - SIG TIBERO
       SQL.Add(' WHERE EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO ');  // Andre Imakawa - SIG 62918queryBase.SQL.Add(' WHERE EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO ');  // Andre Imakawa - SIG 62918 // Andre Imakawa - SIG TIBERO
       SQL.Add(' AND B.IDLOTE  = '+sIdLote );
       SQL.Add(' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD, LISTAFOLHABENEF L ');
       SQL.Add('                                        WHERE B.IDTITULAR = LD.IDTITULAR '); // SOL 242624/17054 Kintana 715180
       SQL.Add('                                        AND L.IDUSUARIO = '+IntToStr(sistema.IdUsuario));
       SQL.Add('                                        AND L.IDLISTA = LD.IDLISTA) '+ ' )');

       // Andre Imakawa - SIG 62918 - Incio
       //repeat // Andre Imakawa - SIG TIBERO
         if not dtmBaseDados.dbBaseDados.InTransaction then
         begin
           dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
       //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO
       // Andre Imakawa - SIG 62918 - Fim
    end;

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE FROM CM.BASEDEPAGAMENTO B ');
       //SQL.Add(' WHERE ROWNUM < 2000 ');                            // Andre Imakawa - SIG 62918 // Andre Imakawa - SIG TIBERO
       SQL.Add(' WHERE B.IDLOTE  = '+sIdLote );                       // Andre Imakawa - SIG 62918 // Andre Imakawa - SIG TIBERO
       SQL.Add(' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD, LISTAFOLHABENEF L ');
       SQL.Add('                                        WHERE B.IDTITULAR = LD.IDTITULAR '); // SOL 242624/17054 Kintana 715180
       SQL.Add('                                        AND L.IDUSUARIO = '+IntToStr(sistema.IdUsuario));
       SQL.Add('                                        AND L.IDLISTA = LD.IDLISTA) ');

       // Andre Imakawa - SIG 62918 - Inicio
      //repeat // Andre Imakawa - SIG TIBERO
        if not dtmBaseDados.dbBaseDados.InTransaction then
        begin
           dtmBaseDados.dbBaseDados.StartTransaction;
        end;
        ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;
      //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO
      // Andre Imakawa - SIG 62918 - Fim
    end;
//SOL 207789/16579 PPM 543916

    // Andre Imakawa - SIG 55810 - Inicio
    query := TwwQuery.Create(Application);

    with query do
    begin
      DataBaseName := 'BaseDados';
      Close;
      SQl.Clear;
      //SQL.Add(' SELECT H.IDTITULAR, H.ROWID,  '); // Andre Imakawa - SIG TIBERO
      SQL.Add(' SELECT H.IDTITULAR,   '); // Andre Imakawa - SIG TIBERO
      SQL.Add('(SELECT MAX(MESCOBRANCA) FROM HSTBITRIBUTACAO H1 WHERE OPERACAO IN (''S'', ''A'') ');
      SQL.Add(' AND H.IDTITULAR = H1.IDTITULAR AND H.ROWID <> H1.ROWID) AS ULTIMOMES');
      SQL.Add(' FROM HSTBITRIBUTACAO H ');
      SQL.Add(' WHERE IDLOTE  = '+sIdLote);
      SQL.Add(' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD, LISTAFOLHABENEF L ');
      SQL.Add('                                        WHERE H.IDPESSOA  = LD.IDPESSOA ');
      SQL.Add('                                        AND   H.IDTITULAR = LD.IDTITULAR ');
      SQL.Add('                                        AND L.IDUSUARIO = '+IntToStr(sistema.IdUsuario));
      SQL.Add('                                        AND L.IDLISTA = LD.IDLISTA) ');
      Open;
    end;

    // Andre Imakawa - SIG 55810 - Fim

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE HSTBITRIBUTACAO H ');
       SQL.Add('WHERE OPERACAO=''S''');
       SQL.Add('AND IDLOTE  = '+sIdLote);
       SQL.Add('AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD, LISTAFOLHABENEF L ');
       SQL.Add('                                        WHERE H.IDPESSOA  = LD.IDPESSOA ');  // SOL 242624/17054 Kintana 715180
       SQL.Add('                                        AND   H.IDTITULAR = LD.IDTITULAR '); // SOL 242624/17054 Kintana 715180
       SQL.Add('                                        AND L.IDUSUARIO = '+IntToStr(sistema.IdUsuario));
       SQL.Add('                                        AND L.IDLISTA = LD.IDLISTA) ');
       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;
       dtmBaseDados.dbBaseDados.Commit;
    end;

    // Andre Imakawa - SIG 55810 - Inicio
    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

    iTotalProcessado := 0;

    with TwwQuery.Create(nil) do
    begin
      DataBaseName := 'BaseDados';
      while not query.Eof do begin
        Close;
        SQl.Clear;
        SQL.Add(' UPDATE BITRIBUTACAO B ');
        SQL.Add(' SET B.ULTMESPROC = '+ QuotedStr(query.Fieldbyname('ULTIMOMES').AsString));
        SQL.Add(' WHERE IDTITULAR  = '+ query.Fieldbyname('IDTITULAR').AsString);

        ExecSQL;

        inc(iTotalProcessado);

        if iTotalProcessado >= 100 then begin
          if dtmBaseDados.dbBaseDados.InTransaction then
          begin
            dtmBaseDados.dbBaseDados.Commit;
          end;
          If Not dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.StartTransaction;
    
          iTotalProcessado := 0;

        end;
        query.Next;
      end;
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
        dtmBaseDados.dbBaseDados.Commit;
      end;
    end;


    query.Close;
    query.Free;

    // Andre Imakawa - SIG 55810 - Fim

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE ');
       SQL.Add('  FROM HSTDEDIDADEBITRIB H ');
       SQL.Add('   WHERE ');
       SQL.Add('   IDLOTE = '+sIdLote);
       SQL.Add('   AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD, LISTAFOLHABENEF L ');
       SQL.Add('                                        WHERE H.IDPESSOA  = LD.IDPESSOA '); // SOL 242624/17054 Kintana 715180
       SQL.Add('                                        AND   H.IDTITULAR = LD.IDTITULAR '); // SOL 242624/17054 Kintana 715180
       SQL.Add('                                        AND L.IDUSUARIO = '+IntToStr(sistema.IdUsuario));
       SQL.Add('                                        AND L.IDLISTA = LD.IDLISTA) ');
       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;
       dtmBaseDados.dbBaseDados.Commit;
    End;


    // Andre Imakawa - SIG 67635 - Fim
    }
    // Andre Imakawa - SIG 99346 - Fim
  finally
    FreeAndNil(SP_ApagaPrevia);
    //FreeAndNil(SP_ApagaPreviaAux);// Andre Imakawa - SIG 67635 // Andre Imakawa - SIG 68391
  end;
end;
// SOL 242846 PPM 579506 refeito o delete em procedure

// SOL 242846 PPM 579506 refeito o delete da ApagaPreviaEfetivacaoPessoa em procedure
Function ApagaPreviaEfetivacaoPessoa(piIDLote, piIDTitular, piIDPessoa : Integer): boolean;  // SOL 242624/17054 Kintana 715180
 var SP_ApagaPrevia:TwwStoredProc;
     //query:TwwQuery;            // Andre Imakawa - SIG 55810  // Andre Imakawa - SIG 99346
     //iTotalProcessado: Integer; // Andre Imakawa - SIG 55810  // Andre Imakawa - SIG 99346
     //sSQL: string; // Andre Imakawa - SIG 83677               // Andre Imakawa - SIG 99346
begin
  Result := true;
  try
    // Andre Imakawa - SIG 99346 - Inicio
    {
    // Andre Imakawa - SIG 83677 - Inicio

    if IsLoteResgate(inttostr(piIDLote)) then
    begin
        sSQL := ' UPDATE CM.HSTPRAZOACUMULACAOFOLHA HST                      '
              + ' SET FLGPROCESSADO = 1                                      '
              + ' WHERE FLGPROCESSADO = 2                                    '
              + ' AND IDHSTFOLHABENEF IS NULL                                '
              + ' AND EXISTS (SELECT 1                                       '
              + '         FROM PREVIA P                                      '
              + '        WHERE P.IDPESSOA = HST.IDPESSOA                     '
              + '          AND P.IDTITULAR = HST.IDTITULAR                   '
              + '          AND P.IDPLANOPREV = HST.IDPLANOPREV               '
              + '          AND P.IDTITULAR = '+IntToStr(piIDTitular)         
              + '          AND P.IDLOTE = ' + inttostr(piIDLote)
              + '          AND EXISTS(  SELECT 1                             '
              + '                 FROM PARTPREVPLAN PART                     '
              + '                WHERE PART.IDPESSOA    = P.IDTITULAR        '
              + '                  AND PART.IDPESSJUR   = P.IDPATRO          '
              + '                  AND PART.IDPLANOPREV = P.IDPLANOPREV      '
              + '                  AND PART.TIPOOPCAOIR = 2))                ';

      with TwwQuery.Create(nil) do
      begin
        DataBaseName := 'BaseDados';
        Close;
        SQl.Clear;
        SQL.Add(sSQL);

        if not dtmBaseDados.dbBaseDados.InTransaction then
        begin
          dtmBaseDados.dbBaseDados.StartTransaction;
        end;
        ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;
        Close;
        Free;
      end;

    end;
    
    // Andre Imakawa - SIG 83677 - Fim
    }
    // Andre Imakawa - SIG 99346 - Fim

    SP_ApagaPrevia := TwwStoredProc.Create(nil);         //edilaine WO19556
    SP_ApagaPrevia.DataBaseName := 'BaseDados';
    SP_ApagaPrevia.StoredProcName:='CM.SP_APAGAPREVIA';
    SP_ApagaPrevia.Params.CreateParam(ftInteger, 'pIdLote', ptInput);
    SP_ApagaPrevia.Params.CreateParam(ftInteger, 'pIdUsuario', ptInput);
    SP_ApagaPrevia.Params.CreateParam(ftInteger, 'pIdTitular', ptInput);
    SP_ApagaPrevia.ParamByName('pIdLote').AsInteger := piIDLote;
    SP_ApagaPrevia.ParamByName('pIdUsuario').AsInteger := 0;
    SP_ApagaPrevia.ParamByName('pIdTitular').AsInteger := piIDTitular;

    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
    try
      SP_ApagaPrevia.Prepare; // SOL 215766 - KTN 2044856
      SP_ApagaPrevia.ExecProc; // SOL 215766 - KTN 2044856
      dtmBaseDados.dbBaseDados.Commit;
    except
      Result := false;
    end;

    // Andre Imakawa - SIG 99346 - Inicio
    {
    // Andre Imakawa - SIG 65680 - Inicio
    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE FROM CM.LOG_EXCLUSAO_PREVIA B  ');
       SQL.Add(' WHERE B.IDLOTE  = '+IntToStr(piIDLote) );
       SQL.Add('AND B.IDTITULAR = '+IntToStr(piIDTitular));
       SQL.Add(' AND ROWNUM < 2000 ');                              // Andre Imakawa - SIG 62918

       repeat
         if not dtmBaseDados.dbBaseDados.InTransaction then
         begin
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
       until (RowsAffected = 0);
    end;

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE FROM CM.LOG_ALT_PREVIA B  ');
       SQL.Add(' WHERE B.IDLOTE  = '+IntToStr(piIDLote) );
       SQL.Add('AND B.IDTITULAR = '+IntToStr(piIDTitular));
       //SQL.Add(' AND ROWNUM < 2000 ');                              // Andre Imakawa - SIG 62918 // Andre Imakawa - SIG TIBERO

       //repeat // Andre Imakawa - SIG TIBERO
         if not dtmBaseDados.dbBaseDados.InTransaction then
         begin
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
       //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO
    end;

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add(' DELETE FROM CM.OBS_PREVIA_BASEPGTO OBA ');
       SQL.Add(' WHERE EXISTS (SELECT 1 FROM CM.LOG_ALT_BASEPGTO BA ');
       SQL.ADD(' WHERE BA.IDOBS = OBA.IDOBS '); // Andre Imakawa - SIG TIBERO
       SQL.ADD(' AND EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO ');
       SQL.Add(' AND B.IDLOTE  = '+IntToStr(piIDLote) );
       SQL.Add(' AND B.IDTITULAR = '+IntToStr(piIDTitular)+' )) ');

       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;

    end;
    
    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add(' DELETE FROM CM.LOG_ALT_BASEPGTO BA ');
       SQL.ADD(' WHERE EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO ');
       SQL.Add(' AND B.IDLOTE  = '+IntToStr(piIDLote) );
       SQL.Add(' AND B.IDTITULAR = '+IntToStr(piIDTitular)+' ) ');

       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;
       dtmBaseDados.dbBaseDados.Commit;
    end;

    // Andre Imakawa - SIG 65680 - Fim

//SOL 207789/16579 PPM 543916
    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE CM.BASEDEPAGAMENTOAPOIO BA ');
       //SQL.Add(' WHERE ROWNUM < 2000 ');                                                 // Andre Imakawa - SIG 62918 // Andre Imakawa - SIG TIBERO
       SQL.Add(' WHERE EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO '); // Andre Imakawa - SIG 62918 // Andre Imakawa - SIG TIBERO
       SQL.Add(' AND B.IDLOTE  = '+IntToStr(piIDLote) );
       SQL.Add('AND B.IDTITULAR = '+IntToStr(piIDTitular)+' ) ');

       // Andre Imakawa - SIG 62918 - Inicio
       //repeat // Andre Imakawa - SIG TIBERO
         if not dtmBaseDados.dbBaseDados.InTransaction then
         begin
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
       //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO
       // Andre Imakawa - SIG 62918 - Fim
    end;

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE  FROM BASEDEPAGAMENTO B  ');
       SQL.Add(' WHERE B.IDLOTE  = '+IntToStr(piIDLote) );
       SQL.Add('AND B.IDTITULAR = '+IntToStr(piIDTitular));
       //SQL.Add(' AND ROWNUM < 2000 ');                              // Andre Imakawa - SIG 62918 // Andre Imakawa - SIG TIBERO

       // Andre Imakawa - SIG 62918 - Inicio
       //repeat // Andre Imakawa - SIG TIBERO
         if not dtmBaseDados.dbBaseDados.InTransaction then
         begin
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
       //until (RowsAffected = 0); // Andre Imakawa - SIG TIBERO
       // Andre Imakawa - SIG 62918 - Fim
    end;
//SOL 207789/16579 PPM 543916

    // Andre Imakawa - SIG 55810 - Inicio
    query := TwwQuery.Create(Application);

    with query do
    begin
      DataBaseName := 'BaseDados';
      Close;
      SQl.Clear;
      //SQL.Add(' SELECT H.IDTITULAR, H.ROWID,  '); // Andre Imakawa - SIG TIBERO
      SQL.Add(' SELECT H.IDTITULAR, '); // Andre Imakawa - SIG TIBERO      
      SQL.Add('(SELECT MAX(MESCOBRANCA) FROM HSTBITRIBUTACAO H1 WHERE OPERACAO IN (''S'', ''A'') ');
      SQL.Add(' AND H.IDTITULAR = H1.IDTITULAR AND H.ROWID <> H1.ROWID) AS ULTIMOMES');
      SQL.Add(' FROM HSTBITRIBUTACAO H ');
      SQL.Add(' WHERE OPERACAO=''S''');
      SQL.Add(' AND IDLOTE  = '+IntToStr(piIDLote));
      SQL.Add(' AND IDPESSOA  = '+IntToStr(piIDPessoa));   // SOL 242624/17054 Kintana 715180
      SQL.Add(' AND IDTITULAR = '+IntToStr(piIDTitular));  // SOL 242624/17054 Kintana 715180
      Open;
    end;

    // Andre Imakawa - SIG 55810 - Fim

    with TwwQuery.Create(nil) do
    begin
       DataBaseName := 'BaseDados';
       Close;
       SQl.Clear;
       SQL.Add('DELETE HSTBITRIBUTACAO ');
       SQL.Add('WHERE OPERACAO=''S''');
       SQL.Add('AND IDPESSOA  = '+IntToStr(piIDPessoa));   // SOL 242624/17054 Kintana 715180
       SQL.Add('AND IDTITULAR = '+IntToStr(piIDTitular));  // SOL 242624/17054 Kintana 715180
       SQL.Add('AND IDLOTE  = '+IntToStr(piIDLote));
       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
          dtmBaseDados.dbBaseDados.StartTransaction;
       end;
       ExecSQL;
       dtmBaseDados.dbBaseDados.Commit;
    end;

    // Andre Imakawa - SIG 55810 - Inicio
    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

    iTotalProcessado := 0;

    with TwwQuery.Create(nil) do
    begin
      DataBaseName := 'BaseDados';
      while not query.Eof do begin
        Close;
        SQl.Clear;
        SQL.Add(' UPDATE BITRIBUTACAO B ');
        SQL.Add(' SET B.ULTMESPROC = '+ QuotedStr(query.Fieldbyname('ULTIMOMES').AsString));
        SQL.Add(' WHERE IDTITULAR  = '+ query.Fieldbyname('IDTITULAR').AsString);

        ExecSQL;

        inc(iTotalProcessado);

        if iTotalProcessado >= 100 then begin
          if dtmBaseDados.dbBaseDados.InTransaction then
          begin
            dtmBaseDados.dbBaseDados.Commit;
          end;
          If Not dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.StartTransaction;
    
          iTotalProcessado := 0;

        end;
        query.Next;
      end;
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
        dtmBaseDados.dbBaseDados.Commit;
      end;
    end;


    query.Close;
    query.Free;

    // Andre Imakawa - SIG 55810 - Fim
    }
    // Andre Imakawa - SIG 99346 - Fim
  finally
    FreeAndNil(SP_ApagaPrevia);
  end;
end;
// SOL 242846 PPM 579506 refeito o delete em procedure

function ExecutaRegraValorAbono(qryAux : TwwQuery;
                                piIdRegraCalculo,
                                piIdPessJur, piIdPlanoPrev, piIdTitular,
                                piSeqProposta, piIdPessoa, piIdBeneficio : longInt;
                                psDataInicio,psDataFinal : string;
                                prValorBenef : double;
                                psFlgProvisorio: string;
                                var bErro : boolean;
                                var sMsgErro : string) : double;
var sSQL, sSqlAux, sDataInicio, sDataFinal, smesref, smesabono, sValorAbono : string;
    rValorAbono : double;
    qryAuxTemp   : TwwQuery;
begin
  Result:=-1;
  if piIdRegraCalculo <= 0 then
    Exit;

  // Para a regra de calculo, DATAINICIO = DIB - DATA DE DIREITO = (QUASE SEMPRE) DATA DO EVENTO
  //                          DATAREF    = DATA DO EVENTO
  sDataInicio:=psDataInicio;
  sDataFinal:=psDataFinal;
  smesref:=copy(psDataFinal,7,4)+'/'+copy(psDataFinal,4,2);
  smesabono:=copy(psDataFinal,7,4)+'/13';

  if Trim(sDataInicio) = '' then
    sDataInicio:=FormatDateTime('dd/mm/yyyy', Date);
 try
  // Ádler Souza - SOL 146990 KINTANA 1009796
  qryAuxTemp               := TwwQuery.Create(nil);     //edilaine WO19556
  qryAuxTemp.DatabaseName  := 'BaseDados';

  sSqlAux :=
  ' SELECT  max(TIPOMOV) '+
  ' FROM MOVBENEF        '+
  ' WHERE IDPESSOA = '+ intToStr(piIdPessoa);

  qryAuxTemp.Sql.Text := sSqlAux;
  qryAuxTemp.Open;

  //Fim - Ádler Souza - SOL 146990 KINTANA 1009796

  // Executa Regra de Cálculo do Valor do Beneficio
  sSQL:='SELECT 0 AS FLGCONCESSAO,'+
                psFlgProvisorio+' AS FLGPROVISORIO, '+
                IntToStr(piIdPessoa)+' AS IDPESSOA, '+
                IntToStr(piIdPessJur)+' AS IDPESSJUR, '+
                IntToStr(piIdTitular)+' AS IDTITULAR, '+
                IntToStr(piIdPlanoPrev)+' AS IDPLANOPREV, '+
                IntToStr(piSeqProposta)+' AS SEQPROPOSTA, '+
                IntToStr(piIdBeneficio)+' AS IDBENEFICIO, '+
                ''''+Trim(sDataInicio)+''' AS DATAINICIO, '+
                ''''+Trim(sDataFinal)+''' AS DATAFINAL, '+
                ''''+Trim(sDataFinal)+''' AS DATAREF, '+
                QuotedStr(smesref) +' AS MESREFERENCIA, '+
                QuotedStr(smesabono) +' AS ANOMESREF, '+
                QuotedStr(smesref) +' AS ANOREF, '+
                OraNumero(FloatToStr(prValorBenef))+' AS VALORATUAL, '+
                OraNumero(FloatToStr(prValorBenef))+' AS VLBENEFPGTO,'+
                // Ádler Souza - SOL 146990 KINTANA 1009796
                OraNumero(FloatToStr(prValorBenef))+' AS VALINSS, '+
                qryAux.FieldByName('TIPOMOV').AsString + ' AS TIPOMOV, '+
                ''''+Trim(sDataInicio)+''' AS INSCRICAODATAFUND, '+
                ' 0 AS BSRUBRICA '+
                // Fim - Ádler Souza - SOL 146990 KINTANA 1009796
        'FROM DUAL';

  try
    sValorAbono:=RegraNumerica(IntToStr(piIdRegraCalculo), sSQL, bErro,
      iIdCalculoGeral);
  except
    bErro:=True;
    sMsgErro:=' Ocorreu um erro na Regra de Cálculo do Valor do Abono  (nº '+
      IntToStr(piIdRegraCalculo)+') ';
    Result:=-1;
    Exit;
  end;

  if bErro then
  begin
    bErro:=True;
    sMsgErro:=' Ocorreu um erro na Regra de Cálculo do Valor do Abono  (nº '+
      IntToStr(piIdRegraCalculo)+') ';
    Result:=-1;
    Exit;
  end;

  if Trim(sValorAbono) = '' then
  begin
    bErro:=True;
    sMsgErro:=' A Regra de Cálculo do Valor do Abono (nº '+IntToStr(piIdRegraCalculo)+')'+
              ' retornou um valor em branco. ';
    Result:=-1;
    Exit;
  end;

  try
    rValorAbono:=StrToFloat(ClienteNumero(sValorAbono));
  except
    bErro:=True;
    sMsgErro:=' A Regra de Cálculo do Valor do Abono (nº '+
      IntToStr(piIdRegraCalculo)+')' +
      ' retornou um valor inválido. [Valor Retornado = '+sValorAbono+']';
    Result:=-1;
    Exit;
  end;
  bErro:=False;
  sMsgErro:=' ';
  Result:=rValorAbono;
 finally
  FreeAndNil(qryAuxTemp);    //edilaine WO19556
 end;
end;

Procedure FazerInsertFiario(pIdPessoa, PIdTitular, pIdUsuario, pIdModulo: Integer; pDescricao: String);
begin
  Fiario:=TFiario.Create;
  With Fiario do
  begin
    Idpessoa:=pIdPessoa;
    IdTitular:=pIdTitular;
    IdUsuario:=pIdUsuario;
    IdModulo:=pIdModulo;
    Descricao:=pDescricao;
    IdRubs:=0;
    StartTransacao;
    If Inserir Then
    begin
    CommitTransacao;
    end
    else
    begin
    RollbackTransacao;
    end;
    Free;
  end;
end;

Function VerificaFolha(TIPOPROCESSO, MESPAGAMENTO, TIPOOPERACAO,
                       DATAPAGAMENTO: String): Boolean;
 var sSql: String;
     iIdCalculoGeral : integer;
     bErro : boolean;
begin
  result:=true;

  if prmIdRegraVerifica <= 0 then
    exit;

  sSql := 'SELECT '+TIPOPROCESSO+' AS TIPOPROCESSO, '+
                  QuotedStr(MESPAGAMENTO)+' AS MESPAGAMENTO, '+
                  TIPOOPERACAO+' AS TIPOOPERACAO, '+
                  QuotedStr(DATAPAGAMENTO)+' AS DATAPAGAMENTO '+
          'FROM DUAL ';

  try
    result:=RegraBooleana(inttostr(prmIdRegraVerifica), ssql, bErro);
    if bErro then
      result:=false;
  except
    result:=false;
  end;
end;

function Piece(S : string; D : char; Col : integer) : string;
 var I, j : integer;
begin
  Piece:='';
  for I:=1 to Col-1 do
  begin
    j:=pos(D, S);
    if j=0 then
      S:=''
    else
      S:=copy(S, j+1, 255);
  end;
  I:=pos(D, S);
  if I = 0 then
    I:=255;
  Piece:=copy(S, 1, I - 1);
end;

function IdentificaTipoPessoa(qry : twwquery; alidTitular, alidRecebedor : longint) : char;
{ - Identifica o tipo de uma pessoa classificando como:
  'P' - PARTICIPANTE
  'B' - BENEFICIARIO
  'T' - TUTOR RESPONSAVEL
  'C' - CONSIGNATARIO
  'N' - NAO IDENTIFICADO}
begin
  result:='N';
  try
    if FazQuery(qry, 'SELECT IDPESSOA FROM PARTPREVPLAN WHERE IDPESSOA = '+
         inttostr(alidrecebedor)) then
    begin
      qry.close;
      result:='P';
      exit;
    end;

    if FazQuery(qry, 'SELECT IDPESSOA, IDTITULAR FROM BENEFBFCIARIO '+
         'WHERE IDPESSOA = '+inttostr(alidrecebedor)) then
    begin
      if qry.fieldbyname('IDPESSOA').asinteger = qry.fieldbyname('IDTITULAR').asinteger then
        result:='P'
      else
        result:='B';
      qry.close; 
      exit;
    end;

    if FazQuery(qry, 'SELECT DISTINCT IDRESPONSAVEL, IDPESSOA, IDTITULAR '+
         'FROM BFCIARIOTITPLAN WHERE IDRESPONSAVEL = '+inttostr(alidrecebedor)) then
    begin
      if qry.fieldbyname('IDRESPONSAVEL').asinteger = qry.fieldbyname('IDTITULAR').asinteger then
        result:='P'
      else
        if qry.fieldbyname('IDRESPONSAVEL').asInteger = qry.fieldbyname('IDPESSOA').asinteger then
          result:='B'
        else
          result:='T';
      qry.close; 
      exit;
    end;

    if FazQuery(qry, ' SELECT DISTINCT IDTITULAR, IDFAVORECIDO FROM RUBRICAINDIV '+
         'WHERE FLGPENSAOALIM = ''1'' AND IDTITULAR = '+inttostr(alidtitular)+
         'AND IDFAVORECIDO = '+inttostr(alidrecebedor)) then
      result:='C';

    if FazQuery(qry, 'SELECT TIPO FROM VW_RECEBEDOR WHERE IDTITULAR = '+inttostr(alidtitular)+
                     'AND IDRECEBEDOR = '+inttostr(alidrecebedor)) then
      result:=qry.fieldbyname('TIPO').asstring[1];

  except
    qry.close; 
    result:='N';
  end;
end;

function GeraLoteFolha(qry : twwquery;
  idPatro : integer; bGravaLote : boolean; sMesReferencia,sTipo,sDescricao,sAtrasoDevol,
  sFlgPreparado,sFlgIdaTmp, sFlgVoltaTmp, sFlgIdaInterface,sFlgVoltaInterface,
  sDataPreparo,sDataIdaTmp,sDataVoltaTmp,sDataIdaInterface,sDATAVOLTAINTERFA : string ) : integer;
var iIdLote    : integer;
    sSQLValues : string;
begin
   Result := -1;
   iIdLote := LeUltRegistro(qry,'CTRLINTERFACE');
   if not bGravaLote then
   begin
     Result := iIdLote;
     Exit;
   end;

   if sDescricao = '' then
     sDescricao := ' NULL '
   else
     sDescricao := ''''+sDescricao+'''';

   if sFlgPreparado          = '' then sFlgPreparado          := '0';
   if sFlgIdaTmp             = '' then sFlgIdaTmp             := '0';
   if sFlgVoltaTmp           = '' then sFlgVoltaTmp           := '0';
   if sFlgIdaInterface       = '' then sFlgIdaInterface       := '0';
   if sFlgVoltaInterface     = '' then sFlgVoltaInterface     := '0';

   if sDataPreparo = '' then
     sDataPreparo:=' NULL'
   else
     sDataPreparo:=' TO_DATE('''+sDataPreparo+''',''dd/mm/yyyy'') ';

   if sDataIdaTmp = '' then
     sDataIdaTmp:=' NULL'
   else
     sDataIdaTmp:=' TO_DATE('''+sDataIdaTmp+''',''dd/mm/yyyy'') ';

   if sDataVoltaTmp = '' then
     sDataVoltaTmp:=' NULL'
   else
     sDataVoltaTmp:=' TO_DATE('''+sDataVoltaTmp+''',''dd/mm/yyyy'') ';

   if sDataIdaInterface = '' then
     sDataIdaInterface:=' NULL'
   else
     sDataIdaInterface:=' TO_DATE('''+sDataIdaInterface+''',''dd/mm/yyyy'') ';

   if sDATAVOLTAINTERFA = '' then
     sDATAVOLTAINTERFA:=' NULL'
   else
     sDATAVOLTAINTERFA:=' TO_DATE('''+sDATAVOLTAINTERFA+''',''dd/mm/yyyy'') ';

   sSQLValues := '';
   sSQLValues := IntToStr(iIdLote);
   sSQLValues := sSQLValues +', '+IntToStr(idPatro);
   sSQLValues := sSQLValues+', '''+sMesReferencia+'''';
   sSQLValues := sSQLValues+', '''+sTipo+'''';
   sSQLValues := sSQLValues+', '+sDescricao;
   sSQLValues := sSQLValues+', '''+sAtrasoDevol+'''';
   sSQLValues := sSQLValues+', '+sFlgPreparado;
   sSQLValues := sSQLValues+', '+sFlgIdaTmp;
   sSQLValues := sSQLValues+', '+sFlgVoltaTmp;
   sSQLValues := sSQLValues+', '+sFlgIdaInterface;
   sSQLValues := sSQLValues+', '+sFlgVoltaInterface;
   sSQLValues := sSQLValues+', '+sDataPreparo;
   sSQLValues := sSQLValues+', '+sDataIdaTmp;
   sSQLValues := sSQLValues+', '+sDataVoltaTmp;
   sSQLValues := sSQLValues+', '+sDataIdaInterface;
   sSQLValues := sSQLValues+', '+sDATAVOLTAINTERFA;

   with qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' INSERT INTO CTRLINTERFACE (IDLOTE,IDPESSOA,MESREFERENCIA,TIPO,DESCRICAO, FLGATRASODEVOL,'+
             '                            FLGPREPARADO,FLGIDATMP,FLGVOLTATMP, '+
             '                            FLGIDAINTERFACE,FLGVOLTAINTERFACE,  '+
             '                            DATAPREPARO,DATAIDATMP,DATAVOLTATMP,DATAIDAINTERFACE,DATAVOLTAINTERFA) '+
             ' VALUES('+sSQLValues+')');
     try
       ExecSQL;
     except
       Exit;
     end;
   end;
   Result := iIdLote;
end;//GeraLoteFolha

function LeftPadCh(const S : string; Ch : Char;
  Len : integer) : string;
var SLen : integer;
begin
  SLen:=Length(S);
  if SLen >= Len then
    result:= S
  else
  begin
    result:=s;
    while len > length(result) do
      result:=Ch+result;
  end;
end;

function BuscaDadosRubrica(aiidrubrica : integer;
  astipodesc : string) : string;
begin
  dtmFolha.qryProventoPrevia.close;
  dtmFolha.qryProventoPrevia.parambyname('pidprovento').asinteger:=aiidrubrica;
  dtmFolha.qryProventoPrevia.open;
  if dtmFolha.qryProventoPrevia.fieldbyname('FLGDESCONTO').asinteger = 2 then
    result:='K'
  else
    result:=astipodesc;
end;

function TiraZeroEsq(s : string) : string;
begin
  repeat
    if length(s) > 0 then
    begin
      if s[1] = '0' then
        delete(s,1,1)
      else
        break
    end
    else
      break;
  until false;
  result:=s;
end;

function SomaString(s1, s2 : string) : string;
 var bvai, b1, b2 : byte;
     isoma, li : integer;
begin
  while length(s1) <> length(s2) do
  begin
    if length(s1) > length(s2) then
      s2:='0'+s2
    else
      s1:='0'+s1;
  end;
  result:=''; bvai:=0;
  for li:=length(s1) downto 1 do
  begin
    b1:=ord(s1[li])-48;
    b2:=ord(s2[li])-48;
    isoma:=b1+b2+bvai;
    bvai:=isoma div 10;
    b2:=isoma mod 10;
    result:=chr(b2+48)+result;
  end;
  if bvai > 0 then
    result:=chr(bvai+ord('0'))+result;
  result:=TiraZeroEsq(result);
end;

function MultiplicaString(s1 : string; ch : char) : string;
 var bvai, b1, b2 : byte;
     imult, li : integer;
begin
  result:=''; bvai:=0;
  b2:=ord(ch)-48;
  for li:=length(s1) downto 1 do
  begin
    b1:=ord(s1[li])-48;
    imult:=(b1*b2)+bvai;
    bvai:=imult div 10;
    b1:=imult mod 10;
    result:=chr(b1+48)+result;
  end;
  if bvai > 0 then
    result:=chr(bvai+ord('0'))+result;
  result:=TiraZeroEsq(result);
end;

procedure MontaFiltro(ChkList : TCheckListBox; ListaAux : tstrings;
  var StrLista : string);
 var i : integer;
     btudo : boolean;
begin
  strLista:=''; btudo:=true;
  for i:=0 to chklist.items.count-1 do
    if chklist.checked[I] then
    begin
      if strLista = '' then
        strLista:=ListaAux[I]
      else
        strLista:=strLista+','+ListaAux[I];
    end
    else
      btudo:=false;
  if btudo then
    strLista:='';
end;


procedure MontaFiltroCompleto(ChkList : TCheckListBox; ListaAux : tstrings;
  var StrLista : string);
 var i : integer;
begin
  strLista:='';
  for i:=0 to chklist.items.count-1 do
    if chklist.checked[I] then
    begin
      if strLista = '' then
        strLista:=ListaAux[I]
      else
        strLista:=strLista+','+ListaAux[I];
    end;
end;

procedure MarcaLista(ChkList : TCheckListBox; bMarca : boolean);
 var i : integer;
begin
  for i:=0 to ChkList.Items.Count-1 do
    ChkList.Checked[i]:=bMarca;
end;

function VerificaLista(ChkList : TCheckListBox): boolean;
 var i: integer;
     b: boolean;
begin
  b:=true;
  for i:=0 to ChkList.Items.Count-1 do
    b:=b and ChkList.Checked[i];
  result:=b;
end;

//PEGA QUANTIDADE DE LOTES DA FOLHA NO MÊS DE REFERENCIA.
function QuantidadeLotes(smesref: string; iidlote: integer): integer;
begin
  if FazQuery(dtmfolha.qryaux, 'select count(*)+1 from ctrlinterface '+
       'where substr(mesreferencia,1,4) = '+QuotedStr(copy(smesref,1,4))+' and tipo = ''B'' '+
       'and idlote < '+inttostr(iidlote)) then
  begin
    result:=dtmfolha.qryaux.fields[0].asinteger;
  end
  else
    result:=0;
  dtmfolha.qryaux.close;   
end;

//OBJETO LISTA DE CONTRIBUICAO
constructor tobjContribuicao.Create(arvalorassoc1, arvalorassoc2, arvalorassoc3,
  arvaloresperado: real);
begin
  rvalorassoc1:=arvalorassoc1;
  rvalorassoc2:=arvalorassoc2;
  rvalorassoc3:=arvalorassoc3;
  rvaloresperado:=arvaloresperado;
end;

destructor tListaContribuicao.Destroy;
 var lii : longint;
begin
  for lii:=0 to count-1 do
    objects[lii].free;
  inherited;
end;

procedure tListaContribuicao.InsereLista(aidcontribuicao: integer; arvalorassoc1,
  arvalorassoc2, arvalorassoc3, arvaloresperado: real);
 var lii: longint;
     objContrib: tobjContribuicao;
begin
  for lii:=0 to count-1 do
  begin
    objContrib:=(objects[lii] as tobjContribuicao);
    if (inttostr(aidcontribuicao) = strings[lii]) then
      exit;
  end;
  objContrib:=tobjContribuicao.create(arvalorassoc1, arvalorassoc2,
    arvalorassoc3, arvaloresperado);
  addobject(inttostr(aidcontribuicao), objContrib);
end;

function tListaContribuicao.VerificaLista(aidcontribuicao: integer): tobjContribuicao;
 var lii, lindex: longint;
     objContrib: tobjContribuicao;
begin
  lindex:=-1;
  for lii:=0 to count-1 do
  begin
    objContrib:=(objects[lii] as tobjContribuicao);
    if (inttostr(aidcontribuicao) = strings[lii]) then
    begin
      lindex:=lii;
      break;
    end;
  end;
  if lindex<0 then
    objContrib:=nil
  else
    objContrib:=(objects[lindex] as tobjContribuicao);
  result:=objContrib;
end;

// ATUALIZA NUMERO DE DEPENDENTES DE IMPOSTO DE RENDA E SALARIO
// FAMILIA. - NUMDEPIRSF
procedure AtualizaNumeroDependentes(pMemo: TMemo;
                                    aIdTitular: Integer;
                                    aIdResponsavel: Integer;
                                    asFlgInterno: string; // CONTROLAR ATUALIZAÇÃO DOS FLAGS DOS DEPENDENTES
                                        //     NÃO ATUALIZAR SE SITUAÇÃO ATIVO (AT, MA, MP)
                                    sDataFolha: string;
                                    asCodTipRecebedor: string;
                                    asMatriculaBen: string;
                                    asNomeBen: string;
                                    ainumdepir: integer;
                                    ainumdepsf: integer;
                                    ainumdeptot: integer;
                                    bcommit: boolean);
var ssql: string;
    bValidaDep, //VERIFCA SE DEVE VALIDAR O DEPENDENTE
    bContaIR                                          : Boolean;
    bContaSF, bDataInvalida                           : Boolean;
    sDependencia,sDataInicio,sDataFim                 : String;
    sDataInicioInvalidez,sDataFimInvalidez            : String;
    sDataNasc, sDataQuatorze, sDataVinteeUm           : String;
    sDataVinteeQuatro, sMatric_Dep                    : String;
    sDataInicioSF,sDataFimSF                          : String;
    NumDias, NumAnos, NumDiasQuatorze,NumDiasVinteeUm : Extended;
    NumDiasVinteeQuatro                               : Extended;
    nTotalDepSF, nTotalDepIR                          : Integer;
    dDataNasc                                         : TDateTime;
    qryDependente, qryUpd, qryAux                     : TwwQuery;
    lidpessoaatualiza: integer;

    procedure VerificadependenteIR;
    begin
      bContaIR := false;
      NumDiasVinteeUm := 0;
      if sdataInicio <> '' then
      begin
        // COMPARAÇÃO APENAS PELO MÊS
        if formatdatetime('YYYYMM', strtodate(sDataInicio)) <=
          formatdatetime('YYYYMM', strtodate(sDataFolha)) then
        begin

          // COMPANHEIRO ,CONJUGE , PAI e MAE
          if (sDependencia = 'COP') or
            (sDependencia = 'COM') or
            (sDependencia = 'PAI') or
            (sDependencia = 'AVO') or   //BRUNO AZEVEDO SOL 140974 KINTANA 889580
            (sDependencia = 'SOG') or  // RODRIGO RAMOS SIG35762 - 21/09/2017
            (sDependencia = 'OUT') then
          begin
            if sDataFim <> '' then
            begin
              if (strtodate(sDataFim) >= strtodate(sDataFolha)) then
                bContaIR := true
              else
                bContaIR := false
            end
            else
              bContaIR := true
          end
          else
          begin
            bcontaIR := false;
          end;
          // ------- //

          // FILHO OU ENTEADO
          if (sDependencia = 'FIL') or
            (sDependencia = 'ENT') or
            (sDependencia = 'IRM') or
            (sDependencia = 'NTO') or
            (sDependencia = 'BIS') or
            //INCLUI MENOR SOB GUARDA
          (sDependencia = 'MSG') then
          begin

            if sdatafim <> '' then
            begin
              if strtodate(sdatafim) >= strtodate(sDataFolha) then
                bcontaIR := true
              else
                bcontair := false
            end
            else
            begin
              //  NORMAL ATE 22 ANOS
              //BRUNO SOL 131129 KINTANA 748012
              NumDiasVinteeUm := (22 * 365.25);
              //BRUNO SOL 131129 KINTANA 748012
              
              sDataVinteeUm := formatdatetime('DD/MM/YYYY',
                (qryDependente.FieldByName('DATANASC').AsDateTime + NumDiasVinteeUm));
              sDataFim := sDataVinteeUm;
              NumDias := (StrToDate(sDataFolha) - strToDate(sDataNasc));
              NumAnos := Trunc(Numdias / 365.25);
              //BRUNO SOL 131129 KINTANA 748012
              if Numanos < 22 then
              //BRUNO SOL 131129 KINTANA 748012
                bContaIR := true
              else
                bContaIR := false;
            end;

            // UNIVERSITARIO
            if (prmIDGRINSTR = qryDependente.FieldByName('IDGRINSTR').AsInteger)
              then
            begin
              // Daniel Begnami SOL: 100376
              if qryDependente.FieldByName('FIMIMPOSTOR').isnull then
              begin
                //BRUNO SOL 131129 KINTANA 748012
                NumDiasVinteeQuatro := (25 * 365.25);
                //BRUNO SOL 131129 KINTANA 748012
                sDataVinteeQuatro := formatdatetime('DD/MM/YYYY',
                  (qryDependente.FieldByName('DATANASC').AsDateTime +
                  NumDiasVinteeQuatro));
                sDataFim := sDataVinteeQuatro;
                NumDias := (StrToDate(sDataFolha) - strToDate(sDataNasc));
                NumAnos := Trunc(Numdias / 365.25);
                //BRUNO SOL 131129 KINTANA 748012
                if Numanos < 25 then
                //BRUNO SOL 131129 KINTANA 748012
                  bContaIR := true
                else
                  bContaIR := false;
              end
              else
              begin
                sDataFim := formatdatetime('DD/MM/YYYY',
                  qryDependente.FieldByName('FIMIMPOSTOR').AsDateTime);

                if strtodate(sdatafim) > strtodate(sDataFolha) then   // Sol103035
                  bContaIR := true
                else
                  bContaIR := false;
              end;
              // FIM SOL:100376

            end
            else  // if (prmIDGRINSTR = qryDependente.FieldByName('IDGRINSTR').AsInteger)
            begin

              // INCAPACITADO FISICA OU MENTALMENTE
              // CONSIDERAR INICIO DA INVALIDEZ
              if sdataInicioInvalidez <> '' then
              begin
                sDataFim := '';
                if (sDataFimInvalidez <> '') then
                begin
                  if ((strtodate(sdataInicioInvalidez) < strtodate(sDataFolha)) and
                    ((strtodate(sDataFimInvalidez) > strtodate(sdataFolha)))) then
                    bcontaIR := true
                  else
                  begin
                    bContaIR := false;
                    sDataFim := sDataFimInvalidez;
                  end;
                end
                else
                begin
                  bcontaIR := true;
                end;
              end;

            end;
          end;

        end;  // if formatdatetime('YYYYMM', strtodate(sDataInicio)) <= formatdatetime('YYYYMM', strtodate(sDataFolha)) then
      end; // if sdataInicio <> '' then
    end;
    //Fim - VerificadependenteIR;

   procedure VerificadependenteSF;
   begin
     bContaSF        := false;
     NumDiasQuatorze := 0;
     If sdataInicioSF = '' then
       sDataInicioSF := datetostr(strtodate(sdataFolha)+1);
     If sdataInicioInvalidez = '' then
       sDataInicioInvalidez := datetostr(strtodate(sdataFolha)+1);
     If strtodate(sDataInicioSF) <= strtodate(sDataFolha) then
     begin
       // FILHO OU ENTEADO
       If ((sDependencia = 'FIL') or (sDependencia = 'ENT')) then
       begin
         // INCAPACITADO FISICA OU MENTALMENTE
         If (sDataFimInvalidez <> '') then
         begin
           If ((strtodate(sdataInicioInvalidez) < strtodate(sDataFolha) ) and
              ((strtodate(sDataFimInvalidez) > strtodate(sdataFolha)) )) then
             bcontaSF := true
           else
             bContaSF := false;
         end
         else
         begin
           //  NORMAL ATE 14 ANOS
           NumDiasQuatorze := (14 * 365.25);
           sDataQuatorze   := formatdatetime('DD/MM/YYYY',(qryDependente.FieldByName('DATANASC').AsDateTime + NumDiasQuatorze));
           sDataFimSF      := sDataQuatorze;
           NumDias := (StrToDate(sDataFolha)-strToDate(sDataNasc));
           NumAnos := Trunc(Numdias/365.25);
           If Numanos <= 14  then
             bContaSF := true
           else
             bContaSF := false;
         end;
       end;
     end;
   end;

   procedure AtualizaDependente;
   var dtfimIR, dtfimSF: tdatetime;
   begin
     nTotalDepIR:=nTotalDepIR+byte(bcontaIR);
     nTotalDepSF:=nTotalDepSF+byte(bcontaSF);

     if bcommit then
       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
         dtmBaseDados.dbBaseDados.StartTransaction;
       end;

     try
       dtfimIR:=strtodate(sDataFim);
     except
       dtfimIR:=0;
     end;
     try
       dtfimSF:=strtodate(sDataFimSF);
     except
       dtfimSF:=0;
     end;

     if (qryDependente.fieldbyname('FLGCONTAIMPOSTOR').asinteger <> byte(bcontaIR)) or
        (qryDependente.fieldbyname('FLGCONTASALARIOF').asinteger <> byte(bContaSF)) or
        (qryDependente.fieldbyname('FIMIMPOSTOR').asdatetime <> dtfimIR) or
        (qryDependente.fieldbyname('FIMSALARIOF').asdatetime <> dtfimSF) then
     begin
       ssql:='UPDATE DEPENTIT '+
             'SET FLGCONTAIMPOSTOR = '+inttostr(byte(bcontaIR))+','+
                 'FLGCONTASALARIOF = '+inttostr(byte(bContaSF))+',';

       ssql:=ssql+'FIMIMPOSTOR = ';
       If (sDataFim <> '') then
         ssql:=ssql+'TO_DATE('+QuotedStr(sDataFim)+',''DD/MM/YYYY''),'
       else
         ssql:=ssql+'NULL,';

       ssql:=ssql+'FIMSALARIOF = ';
       If (sDataFimSF <> '') then
         ssql:=ssql+'TO_DATE('+QuotedStr(sDataFimSF)+',''DD/MM/YYYY'') '
       else
         ssql:=ssql+'NULL ';

       ssql:=ssql+'WHERE IDTITULAR = '+inttostr(lidpessoaatualiza)+' '+
                  'AND IDPESSOA = '+inttostr(qryDependente.FieldByName('IDPESSOA').AsInteger);

       if ExecutarQuery(qryUpd, ssql) then
         if bcommit then
         begin
           dtmBaseDados.dbBaseDados.commit;
         end;
     end;
   end;

   procedure AtualizaTitular;
   begin
     if bcommit then
       if not dtmBaseDados.dbBaseDados.InTransaction then
       begin
         dtmBaseDados.dbBaseDados.StartTransaction;
       end;

     if (ainumdepir <> nTotalDepIR) or
        (ainumdepsf <> nTotalDepSF) or
        (ainumdeptot <> nTotalDepIR+nTotalDepSF) then
     begin
       ssql:='UPDATE PESSOAFISICA '+
             'SET NUMDEPIRRF = '+inttostr(nTotalDepIR)+', '+
                 'NUMDEPSALF = '+inttostr(nTotalDepSF)+', '+
                 'NUMDEPTOT = '+inttostr(nTotalDepIR+nTotalDepSF)+' '+
             'WHERE IDPESSOA = '+inttostr(lidpessoaatualiza);

       if ExecutarQuery(qryUpd, ssql) then
         if bcommit then
         begin
           dtmBaseDados.dbBaseDados.commit;
         end;
     end;
   end;

begin
 try
    qryDependente:=twwquery.create(nil);           //edilaine WO19556
    qryUpd:=twwquery.create(nil);                  //edilaine WO19556
    qryaux:=twwquery.create(nil);                  //edilaine WO19556
    qryDependente.databasename:='Basedados';
    qryUpd.databasename:='Basedados';
    qryaux.databasename:='Basedados';

    sDataFolha := '01/' + Copy(sDataFolha, 4, 7);

    //PARA ATUALIZAR DE DEPENDENTE
    if aidtitular = aidresponsavel then
      lidpessoaatualiza:=aidtitular
    else
      lidpessoaatualiza:=aidresponsavel;

    //VERIFICA SE DEVE VALIDAR DEPENDENTE
    bValidaDep:=((aidtitular = aidresponsavel) and
    // Daniel Begnami - SOL 99769
    //           (asFlgInterno <> 'AT') and
    // Fim
                 (asFlgInterno <> 'CA')) or (aidtitular <> aidresponsavel);

  //try
    ssql:='SELECT P.NOME, P.IDPESSOA, P.NUMDOCUMENTO, '+
                 'D.IDTITULAR, DP.DESCRICAO AS TIPODEPENDENCIA, D.NUMSEQUENCIA, '+
                 'D.FLGCONTAIMPOSTOR, D.FLGCONTASALARIOF, '+
                 'DECODE(PF.ESTCIVIL, ''S'', ''Solteiro'', '+
                             '''C'', ''Casado(a) ou Equiparado(a)'', '+
                             '''D'', ''Divorciado(a)'', '+
                             '''E'', ''Desquitado(a)'', '+
                             '''J'', ''Separado(a) Judicial'', '+
                             '''V'', ''Viúvo(a)'', '+
                             '''M'', ''Marital'', '+
                             '''P'', ''Separado(a)'', '+
                             '''O'', ''Outros'') AS DESCESTCIVIL, '+
                 'D.FLGDESIGNADO, D.FLGDEPLEGAL, D.IDDEPENDENCIA, D.MATRICULA, '+
                 'NVL(D.INICIOIMPOSTOR,NULL) INICIOIMPOSTOR, D.FIMIMPOSTOR, '+
                 'NVL(D.INICIOSALARIOF,NULL) INICIOSALARIOF, D.FIMSALARIOF, '+
                 'PF.DATANASC, PF.DATAMORTE, PF.NOMEPAI, PF.NOMEMAE, PF.SEXO, '+
                 'PF.FLGMOLESTIAGRAVE, PF.DATAMOLESTIAGRAVE , PF.FLGISENTOIRRF, '+
                 'PF.INICIOINVALIDEZ, PF.FIMINVALIDEZ, '+
                 'NVL(PF.IDGRINSTR,0) IDGRINSTR, '+
                 'SIT.DESCRICAO AS SITUACAODEPEN, '+
                 '0 AS FLGELEGIVEL '+
          'FROM DEPENTIT D, DEPENDENTE DEP, PESSOA P, PESSOAFISICA PF, SITDEPENDENTE SIT, DEPEN DP '+
          'WHERE D.IDTITULAR = '+inttostr(lidpessoaatualiza)+' '+
          'AND D.IDDEPENDENCIA <> ''PRP'' '+
          'AND D.IDPESSOA = P.IDPESSOA '+
          'AND NVL(D.FLGIGNORAVALIR,0) = 0 '+ 
          'AND D.IDDEPENDENCIA = DP.IDDEPENDENCIA '+
          'AND PF.IDPESSOA = D.IDPESSOA '+
          'AND DEP.IDPESSOA = D.IDPESSOA '+
          'AND DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+) '+
          'ORDER BY D.NUMSEQUENCIA ';

    if FazQuery(qryDependente, ssql) then
    begin
      nTotalDepSF:=0;
      nTotalDepIR:=0;
      while not qryDependente.eof do
      begin
        try
          if bValidaDep then
          begin
            bDataInvalida := False;
            sMatric_Dep   := qryDependente.FieldByName('MATRICULA').AsString;
            sDependencia  := qryDependente.fieldbyname('IDDEPENDENCIA').asstring;

	    If qryDependente.FieldByName('INICIOSALARIOF').isnull then
              sDataInicioSF:=''
            else
              sDataInicioSF:=formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('INICIOSALARIOF').AsDateTime);

            If qryDependente.FieldByName('FIMSALARIOF').isnull then
              sDataFimSF:=''
            else
              sDataFimSF:=formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('FIMSALARIOF').AsDateTime);

            If qryDependente.FieldByName('INICIOIMPOSTOR').isnull then
              sDataInicio := ''
            else
              sDataInicio := formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('INICIOIMPOSTOR').AsDateTime);

            If qryDependente.FieldByName('FIMIMPOSTOR').isnull then
              sDataFim := ''
            else
              sDataFim := formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('FIMIMPOSTOR').AsDateTime);

            //VERIFICA DATAS INVALIDEZ
            if (trim(sDataFim) <> '') and
               (trim(sDataInicio) = '') then
            Begin
              pMemo.Lines.Add('--------------------------------------------------------------');
              pMemo.Lines.Add('Data início para imposto de renda não está cadastrada.');
              pMemo.Lines.Add('Matr.Ben:'+asMatriculaBen+' - NomeBen.: '+asNomeBen);
              pMemo.Lines.Add('Matr.Dep:'+sMatric_Dep+' - NomeDep.:'+
                qryDependente.FieldByName('NOME').asstring);
              bDataInvalida := True;
            End;

            If qryDependente.FieldByName('INICIOINVALIDEZ').isnull then
              sDataInicioInvalidez :=  ''
            else
              sDataInicioInvalidez := formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('INICIOINVALIDEZ').AsDateTime);

            If qryDependente.FieldByName('FIMINVALIDEZ').isnull then
              sDataFimInvalidez := ''
            else
              sDataFimInvalidez := formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('FIMINVALIDEZ').AsDateTime);

            if (trim(sDataFimInvalidez) <> '') and
               (trim(sDataInicioInvalidez) = '') then
            Begin
              pMemo.Lines.Add('--------------------------------------------------------------');
              pMemo.Lines.Add('Data início de invalidez não está cadastrada.');
              pMemo.Lines.Add('Matr.Ben:'+asMatriculaBen+' - NomeBen.: '+asNomeBen);
              pMemo.Lines.Add('Matr.Dep:'+sMatric_Dep+' - NomeDep.:'+
                qryDependente.FieldByName('NOME').asstring);
              bDataInvalida := True;
            End;

            sDataNasc := formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('DATANASC').AsDateTime);
            dDataNasc := qryDependente.FieldByName('DATANASC').AsDateTime;

            If dDataNasc = 0 Then
            Begin
              pMemo.Lines.Add('--------------------------------------------------------------');
              pMemo.Lines.Add('Não está cadastrado a data de nascimento.');
              pMemo.Lines.Add('Matr.Ben:'+asMatriculaBen+' - NomeBen.: '+asNomeBen);
              pMemo.Lines.Add('Matr.Dep:'+sMatric_Dep+' - NomeDep.:'+
                qryDependente.FieldByName('NOME').asstring);
              bDataInvalida := True;
            End;

            if not bDataInvalida then
            begin
              VerificaDependenteIR;
              VerificaDependenteSF;
              AtualizaDependente;
            end;
          end
          else
          begin
            If (qryDependente.FieldByName('FLGCONTAIMPOSTOR').asinteger = 1) then
              nTotalDepIR:=nTotalDepIR+1;
            If (qryDependente.FieldByName('FLGCONTASALARIOF').asinteger = 1) then
              nTotalDepSF:=nTotalDepSF+1;
          end;
        except
          on e:exception do
          begin
            pMemo.Lines.Add('--------------------------------------------------------------');
            pMemo.Lines.Add('Erro:'+e.message);
            pMemo.Lines.Add('Matr.Ben:'+asMatriculaBen+' - NomeBen.: '+asNomeBen);
            pMemo.Lines.Add('Matr.Dep:'+sMatric_Dep+' - NomeDep.:'+
              qryDependente.FieldByName('NOME').asstring);
          end;
        end;
        qryDependente.next;
      end;
      try
        AtualizaTitular;
      except
        on e:exception do
        begin
          pMemo.Lines.Add('--------------------------------------------------------------');
          pMemo.Lines.Add('Erro:'+e.message);
          pMemo.Lines.Add('Matr.Ben:'+asMatriculaBen+' - NomeBen.: '+asNomeBen);
        end;
      end;
    end
    //SE NÃO RETORNAR DEPENDENTE DEVE-SE ZERAR AS QUANTIDADES
    else
    begin
      nTotalDepSF:=0;
      nTotalDepIR:=0;
      try
        AtualizaTitular;
      except
        on e:exception do
        begin
          pMemo.Lines.Add('--------------------------------------------------------------');
          pMemo.Lines.Add('Erro:'+e.message);
          pMemo.Lines.Add('Matr.Ben:'+asMatriculaBen+' - NomeBen.: '+asNomeBen);
        end;
      end;
    end;
  finally
    qryDependente.close;
    FreeAndNil(qryDependente);                   //edilaine WO19556
    FreeAndNil(qryupd);                          //edilaine WO19556
    FreeAndNil(qryaux);                          //edilaine WO19556
  end;
end;

//VERIFICAÇÃO SE É PESSOA FÍSICA
function VerificaPessoaFisica(qryAux: twwquery; aiidpessoa: integer): boolean;
begin
  result:=FazQuery(qryAux,
    'SELECT IDPESSOA FROM PESSOA WHERE TIPO = ''F'' AND IDPESSOA = '+inttostr(aiidpessoa));
  qryAux.close; 
end;

function IsLoteReserva(qryAux: twwquery; iidlote: integer): boolean;
var btemreserva, btemoutro: boolean;
begin
  result:=false;
  btemoutro:=false;
  btemreserva:=false;
  try
    qryAux.close;
    if FazQuery(qryAux, 'SELECT COUNT(*) AS NUM, NVL(B.FLGRESGATE,0) AS FLGRESGATE '+
                        'FROM HSTBENEFBFCIARIO H, BENEFICIO B '+
                        'WHERE H.IDLOTE = '+inttostr(iidlote)+' '+
                        'AND H.IDBENEFICIO = B.IDBENEFICIO '+
                        'GROUP BY NVL(B.FLGRESGATE,0)') then
    begin
      while not qryAux.eof do
      begin
        if qryAux.fieldbyname('FLGRESGATE').asinteger = 0 then
          btemoutro:=(qryAux.fieldbyname('NUM').asinteger > 0);
        if qryAux.fieldbyname('FLGRESGATE').asinteger = 1 then
          btemreserva:=(qryAux.fieldbyname('NUM').asinteger > 0);
        qryAux.next;
      end;
      result:=not btemoutro and btemreserva;
    end;
  finally
    qryAux.close;
  end;
end;

procedure PulaRegistros(aqry: twwquery; alinum: integer); 
var licont: integer;
begin
  licont:=0;
  while not aqry.eof do
  begin
    if licont = alinum then
      break;
    inc(licont);
    aqry.next;
  end;
end;

function ValidaRubrica(aqry: twwquery;
  aidrubrica: integer; var asmsg: string): boolean;
var lssql: string;
begin
  Result := True;
  asmsg  := '';
  if aidrubrica <> 0 then
  begin
    lssql:=
      'SELECT IDPROVENTO, NVL(FLGDESCONTO,0) AS FLGDESCONTO, NVL(FLGESPECIAL,0) AS FLGESPECIAL '+
      'FROM PROVDESC '+
      'WHERE IDPROVENTO = '+inttostr(aidrubrica);
    if FazQuery(aqry, lssql) then
    begin
      if aqry.fieldbyname('FLGESPECIAL').asinteger > 0 then
        asmsg:='tipo especial';
      if aqry.fieldbyname('FLGDESCONTO').asinteger > 1 then
      begin
        if asmsg <> '' then
          asmsg:=asmsg+' e ';
        asmsg:=asmsg+'finalidade outros';
      end;
    end
    else
      asmsg:='não encontrada';
    if asmsg <> '' then
    begin
      asmsg:=' - Cód.Int.: '+inttostr(aidrubrica)+' ['+asmsg+']';
      result:=false;
    end;
  end;
end;

function VerificaRubricasIR(aqry: twwquery;
  var asmsg: string): boolean;
var lsmsg: string;
begin
  asmsg:='';
  if not ValidaRubrica(aqry, prmIdRubricaIRRF, lsmsg) then
    asmsg:=asmsg+'Rub. IR Normal'+lsmsg+#13#10;

  if not ValidaRubrica(aqry, prmIDRUBIRRFINSS, lsmsg) then
    asmsg:=asmsg+'Rub. IR INSS'+lsmsg+#13#10;

  if not ValidaRubrica(aqry, prmIdRubIRRFResg, lsmsg) then
    asmsg:=asmsg+'Rub. IR Reserva'+lsmsg+#13#10;

  if not ValidaRubrica(aqry, prmIDRUBIRRFABONO, lsmsg) then
    asmsg:=asmsg+'Rub. IR Abono'+lsmsg+#13#10;

  if not ValidaRubrica(aqry, SistemaFolha.IdRubIRRFINSSAbono, lsmsg) then
    asmsg:=asmsg+'Rub. IR Abono INSS'+lsmsg+#13#10;

  if asmsg = '' then
    result:=true
  else
  begin
    result:=false;
    asmsg:='O PROCESSO DA PRÉVIA NÃO PODE CONTINUAR !!!'+#13#10+#13#10+
           'Favor verificar o cadastro das rubricas de IR abaixo, '+#13#10+
           'que estão parametrizadas para uso na Prévia:'+#13#10+
           asmsg;
  end;
end;

//UNIFICA ROTINA DE FOLHA EXTRA E PAGAMENTO PENDENTE
function IsRubricaIRRF(alidrubrica: integer): boolean;
begin
  result:=true;
  if alidrubrica = prmIdRubricaIRRF then
    exit;
  if alidrubrica = prmIdRubIRRFResg then
    exit;
  if alidrubrica = prmIDRUBIRRFINSS then
    exit;
  if alidrubrica = prmIDRUBIRRFABONO then
    exit;
  if alidrubrica = prmIdRubDeducaoDep then
    exit;
  if alidrubrica = prmIdRubDeducaoIdade then
    exit;
  if alidrubrica = SistemaFolha.IdRubDescIdadeIRResgate then
    exit;
  if alidrubrica = SistemaFolha.IdRubDescDepIRResgate then
    exit;
  if alidrubrica = SistemaFolha.IdRubDedDepAbono then
    exit;
  if alidrubrica = SistemaFolha.IdRubDedIdadeAbono then
    exit;
  result:=false;
end;

// Andre Imakawa - SIG 100935
{
// Andre Imakawa - SIG 81948 - Inicio
Function EnviaMonitoramento(pHost, pType, pMensagem: String):Boolean;
var lParams :TStringList;
    lResponse : TStringStream;
    sMensagem: string;
    IdHTTP1: TIdHTTP;
begin

  Try
    try
      IdHTTP1 := TidHTTP.Create(Nil);
      lParams := TStringList.Create;
      lResponse := TStringStream.Create('');

      lParams.Add(pMensagem);
      IdHTTP1.Request.ContentType := pType;
      IdHTTP1.Post(pHost, lParams, lResponse);
      Result := True;
      
    Except
      on E: Exception do
      begin
        Result := False;
      end;
    end;
  finally
    FreeAndNil(IdHTTP1);
    FreeAndNil(lParams);
    FreeAndNil(lResponse);
  end;
end;
// Andre Imakawa - SIG 81948 - Fim
}
// Andre Imakawa - SIG 100935
// Andre Imakawa - SIG 83677 - Inicio
function IsLoteResgate(pidlote: string): boolean;
var qryAux: twwquery;
    sSQL: string;
begin
  result:=false;

  try

    sSQL := 'SELECT COUNT(1) AS QTD FROM CM.CTRLINTERFACE C '+
            'WHERE ((NVL(C.FLGRESGATE, 0) = 1) or ((NVL(C.FLGRESGATE, 0) = 0) and NVL(C.FLGRESGATEPARCELADO,0) = 1 ))'+
            '  AND C.IDLOTE ='+ pidlote ;
    qryAux := TwwQuery.Create(nil);              //edilaine WO19556
    qryAux.DataBaseName := 'BaseDados';
    qryAux.close;
    qryAux.SQL.clear;
    qryAux.SQL.Add(sSQL);
    qryAux.Open;

    if not qryAux.isempty then
      Result := (qryAux.FieldByName('QTD').AsInteger > 0);

  finally
    FreeAndNil(qryAux);
  end;
end;
// Andre Imakawa - SIG 83677 - Fim

// Andre Imakawa - SIG 87467 - Inicio
Function ValidaUsuarioFolha(var pMensagem: String):Boolean;
var
    wwStoredProc : TwwStoredProc;
begin
  Result := True;
  pMensagem := '';
  wwStoredProc := TwwStoredProc.Create( nil );
  try
    wwStoredProc.DatabaseName   := dtmBaseDados.dbBaseDados.DataBaseName;
    wwStoredProc.StoredProcName := 'CM.PR_VALIDA_USUARIO_FOLHA';

    try
      wwStoredProc.Prepare;
      wwStoredProc.ExecProc;
    except
      on e:EDBEngineError do
      begin
        Result := False;
        pMensagem := LerMensDBErro(EDBEngineError(E));
      end;
    end;
  finally
    FreeAndNil(wwStoredProc);   //edilaine WO19556
  end;
end;
// Andre Imakawa - SIG 87467 - Fim


//edilaine WO24218 : inicio
procedure AplicaCritpoDePara(pIdDePara : integer; sValor : string);
var
  qryAux: twwquery;
  lInTran : boolean;
  sEncriptado : string;
begin

  sEncriptado := CriptografarString(sValor, CKEYCRIPTO);

  try
    qryAux := TwwQuery.Create(nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.close;
    qryAux.SQL.clear;
    qryAux.SQL.text := 'UPDATE DEPARAEXTERNO SET VLRCM = '+QuotedStr(sEncriptado)+ ', FLGAPLICACRITPO = 0 '+
                       ' WHERE IDDEPARAEXTERNO = '+IntToStr(pIdDePara);

    lInTran := dtmBaseDados.dbBaseDados.InTransaction;

    if not lInTran then
       dtmBaseDados.dbBaseDados.StartTransaction;

    qryAux.ExecSQL;

    if not lInTran then
       dtmBaseDados.dbBaseDados.Commit;

  finally
    FreeAndNil(qryAux);
  end;
end;


function AplicaDecritpoDePara(sValor : string): string;
begin
  Result := DeCriptografarString(sValor, CKEYCRIPTO);
end;
//edilaine WO24218 : fim


initialization

end.
{------------------------------------------------------------------------------|
| UNIT: UFUNCOESFOLHA                                                          |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   ROTINAS ESPECÍFICAS PARA PROCESSAMENTO DA FOLHA                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   GERACAO DO SALARIO VIRTUAL PARA OS ASSISTIDOS.                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/01/2002 A 31/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12a                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   CORREÇÃO DA CHAMADA DA FUNÇÃO LANCACONTAB INVERTENDO OS PARÂMETROS PLANO   |
| PREVIDENCIÁRIO E PATROCINADORA.                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/02/2002 A 27/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12d                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - NO LANÇAMENTO CONTÁBIL (LANCACONTAB) PASSOU-SE A USAR O PARÂMETRO BJUNTA = |
| FALSO, PARA PODER FAZER OS LANÇAMENTOS DAS RUBRICAS INDEPENDENTEMENTE MESMO  |
| QUE VINCULADOS A MESMO PLANO, PATRO, PLACONTA E UNIDNEGOC.                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/05/2002                                      |
| VERSÃO PARA LIBERAÇÃO: 3.02.13                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ROTINA PARA IDENTIFICAR NUMERO DE LOTES NO MES DE REFERENCIA E MENORES DO  |
| QUE O LOTE DESEJADO.                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/05/2002                                      |
| VERSÃO PARA LIBERAÇÃO: 3.02.13                                               |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - LISTA DE OBJETOS DE CONTRIBUICAO CALCULADA.                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B. Marins.                                             |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/06/2002 A 10/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação na função InserePrevia para incluir  |
|                              o codportforma.                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2002 A 10/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13D                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|    Implementação da procedure que controla o nro. de dependentes para IRRF e |
|     salario familia.                                                         |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13g                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|| - Alterei o form  para contemplar os novos                                  |
|   parametros de integração contábil/financeira da folha                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/09/2002 A 06/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA ROTINA FazerInsertContabFolha POIS ALGUNS VALORES NULOS DO    |
| CENTRO DE CUSTO E CODSUBCONTA, FAZ COM QUE O REGISTRO NÃO SEJA ENCONTRADO    |
| POSTERIORMENTE. COLOCAMOS TAMBÉM TRIM NAS VARIAVEIS STRING.                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/04/2003 A 25/04/2003                         |
| PENDÊNCIA: 13821                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Alterar rotina para identificar tipo da pessoa quando favorecido de outras   |
| rubricas.                                                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/04/2003 A 29/04/2003                         |
| PENDÊNCIA: 13882                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Rotina para verificar se pessoa é física.                                    |
|                                                                              |
|------------------------------------------------------------------------------|                                                                                   |
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/06/2003 A 06/06/2003                         |
| PENDÊNCIA: 14189                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05e                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| COLOCAR FILTRO DO CAMPO IDMODULO DA FOLHA NAS CONSULTAS DA BANCOPORTORMA.    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/06/2003 A 17/06/2003                         |
| PENDÊNCIA: 14297                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Rotina de DefiniPortadorForma identificar duplicidade de conta preferen-   |
| cial.                                                                        |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/06/2003 A 26/06/2003                         |
| PENDÊNCIA: 14381                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA ROTINA DE PROCURA SUBSTITUIR O LOCATE PELO WHILE              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2003 A 10/03/2003                         |
| PENDÊNCIA: 14483                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07e                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CORRIGIR DEFINIÇÃO DO PORTADOR FORMA QUANDO EXISTE PARAMETRIZAÇÃO DO TIPO  |
| CONTA.                                                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/07/2003 A 17/07/2003                         |
| PENDÊNCIA: 14441                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTIFUNDACAO.                                              |
| - ALTERAÇÃO NA ROTINA DE DEFINIR PORTADOR FORMA DE PAGAMENTO.                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/07/2003 A 30/07/2003                         |
| PENDÊNCIA: 14746                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00b                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Trocar parametro de agrupa rubrica antigo (prmCalcJunto) pelo novo         |
| (Sistema.FLGAGRUPARUBRICA).                                                  |
| A variavel global referente a este parâmetro foi inibida.                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/08/2003 A 07/08/2003                         |
| PENDÊNCIA: 14797                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - QUANDO SE ALTERA A CONTA BANCARIA DEVE-SE REDEFINIR O PORTADORFORMA DE PA- |
| GAMENTO COMPARANDO OS DADOS BANCARIOS REGISTRADOS NA PREVIA E OS CONSTANTES  |
| NA TABELA CONTA BANCARIA.                                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/08/2003 A 07/08/2003                         |
| PENDÊNCIA: 14787                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - IDPLANOPREV DO REB 2002 DEVE SER CONSIDERADO REPLAN PARA EFETIO DE CONTA-  |
| BILIZAÇÃO POR CAUSA DA LIMINAR.                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Ricardo Vigorito                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/01/2004 A 29/01/2004                         |
| PENDÊNCIA:  15948                                                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| O sistema passou a permitir associar,para o mesmo banco, um portador         |
| forma   para cada tipo de folha                                              |
|------------------------------------------------------------------------------}