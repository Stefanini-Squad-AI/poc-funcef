{
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 172385/10082
Nº KINTANA..: 1690505
Data........: 01/08/2012
Responsável.: Vander Campos
Descrição...: EF - RN010 - Validação do Centro de Responsabilidade do usuário com o Grupo Orçamentário
-----------------------------------------------------------------------------
Data      : 04/11/2014
Autor     : Marcio Sanches Spinosa SOL 241969 PPM 564261
Sol       : 241969
PPM       : 564261
Rotina    : ListaContasEntDados
Descrição : Ajuste na validação para criação das contas.
--------------------------------------------------------------------------------------------------
Data      : 24/09/2014
Autor     : Thiago Melo
Sol       : 238673
PPM       : 509672
Rotina    : ListaContasParaTransf
Descrição : Permitir transferencia entre contas inativas
--------------------------------------------------------------------------------------------------
Data      : 24/09/2014
Autor     : Thiago Melo
Sol       : 239565
PPM       : 519993
Rotina    : ListaContasParaTransf
Descrição : Permitir transferencia entre contas inativas
--------------------------------------------------------------------------------------------------
Data      : 13/08/2014
Autor     : Thiago Melo
Sol       : 237210
PPM       : 482255
Rotina    : Não há atualizações
Descrição : A performance gerada na solicitação 225755, não está mais presente na tela.
Alteracão Form: Melhora de performance
--------------------------------------------------------------------------------------------------
Data      : 27/06/2014
Autor     : Thiago Melo
Sol       : 225755
Kintana   : 2061004
Rotina    : ListaTransfEfetuadas
Descrição : Melhora de performance na tela de de transferencia orcamentaria
Alteracão Form: Melhora de performance
--------------------------------------------------------------------------------------------------
Data      : 11/10/2013
Autor     : Thiago Melo
Sol       : 217651
Kintana   : 2048155
Rotina    : ListaTransfEfetuadas
Descrição : Melhora de performance na tela de de transferencia orcamentaria
Alteracão Form: Melhora de performance
--------------------------------------------------------------------------------------------------
Data      : 10/03/2014
Autor     : Felipe A. Santos
Sol       : 227156
Kintana   : 2061700
Rotina    : ListaSuplContas
Descrição : mudança no cálculo do Saldo.
Alteracão Form: mudança no cálculo do Saldo.
--------------------------------------------------------------------------------------------------
Data      : 29/10/2013
Autor     : Marcio Sanches Spinosa SOL 219321 Kintana 2051325
Sol       : 219321
Kintana   : 2051325
Rotina    : ListaContasParaTransf
Descrição : retirado o periodo e trabalhar somente com o saldo anual.
--------------------------------------------------------------------------------------------------
Data      : 29/10/2013
Autor     : Marcio Sanches Spinosa SOL 219322 Kintana 2051324
Sol       : 219322
Kintana   : 2051324
Rotina    : verificaSubDespesa
Descrição : Verifica se existe SubDespesa e caso sim, é obrigatorio a escolher.
--------------------------------------------------------------------------------------------------
Data      : 29/10/2013
Autor     : Marcio Sanches Spinosa SOL 219320 Kintana 2051323
Sol       : 219320
Kintana   : 2051323
Rotina    : Carregar Programa
Descrição : Ajuste para sempre carregar o combo programa quando selecionar um centro de custo.
--------------------------------------------------------------------------------------------------
Data      : 24/09/2013
Autor     : Marcio Sanches Spinosa SOL 217025 Kintana 2046511
Sol       : 217025
Kintana   : 2046511
Rotina    : calcularateiotransf2
Descrição : Ajuste realizado para efetuar o rateio de forma correta.
--------------------------------------------------------------------------------------------------
Data      : 09/08/2013
Autor     : Marcio Sanches Spinosa SOL 209766 Kintana 2040660
Sol       : 209766
Kintana   : 2040660
Rotina    : varias (uso do plano orçamentario selecionado no grupo)
Descrição : Troca do campo reservado para o realizado
----------------------------------------------------------------------------------------------------
Data      : 19/07/2013
Autor     : Marcio Sanches Spinosa SOL 212127 Kintana 2036755
Sol       : 212127
Kintana   : 2036755
Rotina    : varias (uso do plano orçamentario selecionado no grupo)
Descrição : Ajuste no select para trazer dados corretos, estava duplicando e ajuste no filtro de
calculo do valor.
----------------------------------------------------------------------------------------------------
Data      : 08/07/2013
Autor     : Marcio Sanches Spinosa SOL 210745 Kintana 2030612
Sol       : 210745
Kintana   : 2030612
Rotina    : varias (uso do plano orçamentario selecionado no grupo)
Descrição : Ajuste no select para trazer dados corretos, estava duplicando e ajuste no filtro de
calculo do valor.
----------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 210712
Nº KINTANA..: 2029487
Data........: 03/07/2013
Responsável.: Fernando Xavier
Descrição...: Na inclusão de linhas para uma nova sub-despesa, as linha referentes aos meses 1,2,3
              está vindo desabilitada.
--------------------------------------------------------------------------------------------------
Rotina......: ListaContasParaTransf
Nº SOL......: 190311
Nº KINTANA..: 1799290
Data........: 30/04/2013
Responsável.: Edilaine Ferraresi
Descrição...: permitir transferencia entre grupos diferentes
{ --------------------------------------------------------------------------------------------------
Data      : 20/06/2013
Autor     : Thiago Melo
Sol       : 209723
Kintana   : 2023107
Rotina    : ListaContasParaTransf
Descrição : No grupo de origem, carregar somente o saldo que estiver diferente de 0.
----------------------------------------------------------------------------------------------------
Rotina    : GrupoOrcamentarioxSubdespesa, ValidaSubDespesa, ListaSuplContas, AplicarReservaCompromissoPorGrupo,
            ListaSuplementacoes, CancelaReservaCompromisso, ListaContasEntDados
Data      : 08/05/2013
Autor     : Edilaine Ferraresi
Sol       : 190488
Kintana   : 1909246
Descrição : adequação do rateio e obritatoriedade de sub-despesa
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaTransfEfetuadas, CalcularRateio
Nº SOL......: 193146
Nº KINTANA..: 1940385
Data........: 19/02/2013
Responsável.: Rodrigo / Edilaine
Descrição...: ajustes para utilização correta da funcionalide
{--------------------------------------------------------------------------------------------------
Rotina......: ValidaSubDespesa, CalcularRateio
Nº SOL......: 197740
Nº KINTANA..: 1894943
Data........: 27/12/2012
Responsável.: Edilaine Ferraresi
Descrição...: Verificar se os registros selecionados são todos com IDDESPESAORC = -1 e permitir a
              mudança para despesa selecionada
{--------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
--------------------------------------------------------------------------------------------------
Rotina......: ValidaSubDespesa
Nº SOL......: 193936
Nº KINTANA..: 1852777
Data........: 08/11/2012
Responsável.: Edilaine Ferraresi
Descrição...: considerar apenas o flgStatusAtivo = A(tivo) na validação de sub-despesa
{--------------------------------------------------------------------------------------------------
Rotina......: ValidaSubDespesa
Nº SOL......: 192079
Nº KINTANA..: 1822802
Data........: 11/10/2012
Responsável.: Higor Nayde Ferreira
Descrição...: Alterar Consulta de Validação de subDespesa
{--------------------------------------------------------------------------------------------------
Rotina......: ListaContasEntDados
Nº SOL......: 191942
Nº KINTANA..: 1820656
Data........: 10/10/2012
Responsável.: Higor Nayde Ferreira
Descrição...: Alteração na Consulta de ListaContasEntDados para
trazer apenas contatos não cancelados
{ --------------------------------------------------------------------------------------------------
Rotina......: CriaSaldoContas
Nº SOL......: 191669
Nº KINTANA..: 1816552
Data........: 03/10/2012
Responsável.: Edilaine Ferraresi
Descrição...: a cada 5000 registros processados efetuar o commit
{--------------------------------------------------------------------------------------------------
Rotina......: ListaSuplContas, ListaContasParaTransf, ListaContas
              Adicionei filtros Centro de Custo, Plano Orçamentário, Sub/Despesa
Nº SOL......: 172384/9361
Nº KINTANA..: 1653184
Data........: 05/06/2012
Responsável.: Vander Campos
Descrição...: Adequação da interface aos padrões de utilização da funcionalidade Especial
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: CalcularRateio, CriaSaldoContas
Nº SOL......: 189698
Nº KINTANA..: 1794093
Data........: 12/09/2012
Responsável.: Edilaine Ferraresi
Descrição...: ajustar rateio quando período for anual
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContasEntDados
Nº SOL......: 189683
Nº KINTANA..: 1790559
Data........: 06/09/2012
Responsável.: Edilaine Ferraresi
Descrição...: alterar critério para lançar diferenças de rateio
{ --------------------------------------------------------------------------------------------------
Rotina......: CalcularRateio, iif
Nº SOL......: 187127
Nº KINTANA..: 1761657
Data........: 08/08/2012
Responsável.: Edilaine Ferraresi
Descrição...: efetuar rateio de valores negativos
{ --------------------------------------------------------------------------------------------------
Rotina......: CriaSaldoContas
Nº SOL......: 185723
Nº KINTANA..: 1742408
Data........: 26/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: melhor performance da rotina de importação
{--------------------------------------------------------------------------------------------------
Rotina......: ListaContasEntDados
Nº SOL......: 172384-10063
Nº KINTANA..: 1689960
Data........: 11/06/2012
Responsável.: Edilaine Ferraresi
Descrição...: ratear o resto da divisão para primeira conta orçamentaria de cada CENTRO DE CUSTO
--------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina......: ListaPlanoOrcamento, ListaCentroCusto, ListaSubDespesa, ListaContasEntDados,
              GetCCustoSubDespesa, GetFornecedorSubDespesa, ValidaSubDespesa, CriaSaldoContas
Nº SOL......: 172383-7763
Nº KINTANA..: 1557030
Data........: 29/02/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusão de novos parâmetros para filtro: Plano Orçamentário, Centro de Custo
              e Fornecedor/Sub-Despesa
--------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina......: ListaContasParaTransf, ListaTransfEfetuadas
Nº SOL......: 163908
Nº KINTANA..: 1403202
Data........: 26/12/2011
Responsável.: Edilaine Ferraresi
Descrição...: alteração da query para incluir parametros ATIVIDADE PROJETO, PROGRAMA e
              TIPO DESPESA, alteração da query para incluir parametros ATIVIDADE PROJETO, PROGRAMA e
              TIPO DESPESA e overload da função acrescetando flag para tipo de Conta:
              Origem / Destino / Ambas
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaSuplContas, ListaSuplementacoes
Nº SOL......: 163910
Nº KINTANA..: 1403215
Data........: 05/01/2012
Responsável.: Edilaine Ferraresi
Descrição...: Adicionado parâmetros de Atividade de Projeto, Tipo de Despesa e Programa
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContas,ListaReservaCompromissoEfetuado
Nº SOL......: 163903
Nº KINTANA..: 1403195
Data........: 09/12/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Adicionado parâmetros de Atividade de Projeto, Tipo de Despesa e Programa
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 22/11/2011
// Nº SOL........: 166069
// Nº KINTANA....: 1468025
// Rotina........: PesquisaCriterio
// Descrição.....: Adicionado parâmetro de Atividade de Projeto
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaAtivProj
Nº SOL......: 163982/7003
Nº KINTANA..: 1489901
Data........: 22/11/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Foi alterada esta rotina para que o combo Box Atividade/
               Projeto retorne apenas as atividades analiticas e Ativas.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 27/10/2011
// Nº SOL........: 167449
// Nº KINTANA....: 1469512
// Rotina........: CriaSaldoContas
// Descrição.....: Retirar o trava de valores > 0 para poder cadastrar saldo orçamentário,
                   negativos.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ValidarDados
Nº SOL......: 166064
Nº KINTANA..: 1444100
Data........: 10/10/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Retornar campo NOMECRITERIO devido a rotina de cálculo da valor de rateio 
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor.........: Ricardo de Freitas Araújo Silva
Data..........: 22/08/2011
Nº SOL........: 159248
Nº KINTANA....: 1337823
Rotina........: PesquisaCriterio
Descrição.....: Adicionado parâmetros de Programa de Tipo de Despesa
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContas, ListaSuplContas, ListaSuplementacoes e ListaReservaCompromissoEfetuado
Nº SOL......: 153584/4161
Nº KINTANA..: 1170663
Data........: 15/01/2011
Responsável.: Brunno Mattos
Descrição...: Adiciona campos aos selects, para se adequar ao que é necessário quando passar o Cds
              para funções.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: Retornar_IdCriterio_porGrupoPeriodo
Nº SOL......: 153918
Nº KINTANA..: 1166699
Data........: 01/03/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Retorna o Id Criterio de Rateio utilizado para o grupo por um determinado
              exercício\período na tela de Entrada de Dados Especiais conforme SaldoOrcado.

Rotina......: ListaContasParaTransf,ListaTransfEfetuadas
Data........: 01/03/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Adicionado campo virtual "VALOR" pois a rotina de calculo de rateio
              por critério utiliza este campo na tela de tranferência.

Rotina......: TestaContasSelRaxtGrupoOrc
Data........: 03/03/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Ao verificar os centros de custas do critério de rateio, deverá ter
              VR.VLRCRIRATORC > 0
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContas, AplicarReservaCompromissoPorGrupo, ListaSuplContas, ListaSuplementacoes,
              ListaReservaCompromissoEfetuado e ListaContasEntDados
Nº SOL......: 153584
Nº KINTANA..: 1159883
Data........: 01/03/2010
Responsável.: Brunno Mattos
Descrição...: efetua compromisso ao lançar um ajuste
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaSuplementacoes
Nº SOL......: 152922/4001
Nº KINTANA..: 1161267
Data........: 28/02/2011
Responsável.: Brunno Mattos
Descrição...: inclui VLRSOLICITADO na qry para exclusão do ajuste
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContas, ListaReservaCompromissoEfetuado
Nº SOL......: 153803
Nº KINTANA..: 1163260
Data........: 25/02/2011
Responsável.: Brunno Mattos
Descrição...: Inclusão dos campos IDCRITERIORATORC, NOMECRITERIO na qry
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContasParaTransf
Nº SOL......: 153170
Nº KINTANA..: 1150546
Data........: 18/02/2011
Responsável.: Brunno Mattos
Descrição...: Alteração da query para trazer SALDODISP
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContasParaTransfs
Nº SOL......: 152921
Nº KINTANA..: 1146742
Data........: 15/02/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Permissão de consultas de contas orçamentária por período anual
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaTransfEfetuadas
Nº SOL......: 152918
Nº KINTANA..: 1146743
Data........: 15/02/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: No retorno do campo de observação (OBSALTERORCAMEN), foi limitado
o tamanho deste campo para 255, para o clientdataset interpetrar este campo como
um TStringField, assim aparecendo no dbgrid normalmente.
--------------------------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContasEntDados
Nº SOL......: 152788
Nº KINTANA..: 1145736
Data........: 14/02/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: A data de referência deverá ser a data inicial do período, pois é
              a data inicial de período que o módulo de Geração de Dados verifica
              para dar o INSERT\UPDATE na tabela SALDOORCADO
--------------------------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
Rotina......: EditarDatasReferencia
Nº SOL......: 151878
Nº KINTANA..: 1121572
Data........: 01/02/2011
Responsável.: Brunno Mattos
Descrição...: Incremento das querys para contemplar o período ANUAL.
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContas, ListaReservaCompromissoEfetuado e VerificaSaldoGrupo
Nº SOL......: 151865
Nº KINTANA..: 1121572
Data........: 01/02/2011
Responsável.: Brunno Mattos
Descrição...: Incremento das querys para contemplar o período ANUAL.
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContasEntDados, ListaContas, ListaContasParaTransf, ListaSuplContas
Nº SOL......: 151660
Nº KINTANA..: 1115295
Data........: 27/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do parâmetro para trazer apenas os centros de custos ativos
---------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina......: ListaContas, ListaSuplContas, ListaContasParaTransf
Nº SOL......: 151079
Nº KINTANA..: 1103455
Data........: 18/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Retirada a obrigatoriedade do plano de trabalho.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: CalcularRateio
Nº SOL......: 150140
Nº KINTANA..: 1087554
Data........: 12/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do Plano e Patro no Critério de Rateio
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 150137
Nº KINTANA..: 1087555
Data........: 12/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção da Entrada de Dados para o período anual e alteração da busca para
              trazer os resultados agrupado por Grupo/Periodo/Exercício.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 149003
Nº KINTANA..: 1074595
Data........: 24/12/2010
Responsável.: Thaise Amaral Martins
Descrição...: Criação das procedures DeletaGrupoNaoGerado, AtualizaValorSaldoAnual e InsereAnual para
              trabalhar com os valores do saldo. Em CriaSaldoContas, a rotina foi alterada para
              fazer o novo Calculo caso o período seja ANUAL
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaContasEntDados
Nº SOL......: 147990
Nº KINTANA..: 1031358
Data........: 22/11/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção da SQL
---------------------------------------------------------------------------------------------------}
{*******************************************************
Rotina..........: CalcularRateio
N. Sol..........: 124422
N. Kintana......: 631745
Data............: 05/10/2009
Responsável.....: Ricardo Alves
Descrição.......: Corrigido erro no cálculo de rateio e na entrada de dados quando
  período diferente de ANUAL na janela de entrada de dados especial.
*******************************************************}
{*******************************************************
Rotina..........: ListaPlanoTrab
N. Sol..........: 123721
N. Kintana......: 620954
Data............: 11/09/2009
Responsável.....: Bruno Bastos
Descrição.......: Comparar o parâmetro com o último dia do período final.
*******************************************************}
{*******************************************************
Rotina..........: TCtrlTransacoesPorGrupo.ListaPlanoTrab
N. Sol..........: 110247
N. Kintana......: 502307
Data............: 19/03/2009
Responsável.....: Marilza Colpani
Descrição.......:  Quando o Exercício for alterado, as informações pertinentes
                  ao Plano de Trabalho serão mostradas.
*******************************************************}
{
   Data      : 09/04/2007
   Autor     : Rodolpho da Silva
   Pendência : 23802
   Descrição : Vincular o critério de rateio utilizado na dotação efetuada.
{----------------------------------------------------------------------------------------
   Data      : 05/03/2007
   Autor     : Rodolpho da Silva
   Pendência : 24621
   Descrição : Retirar a busca do campo IDOPERACAO para join's na tabela SALDOORCAO
{----------------------------------------------------------------------------------------
   Data      : 18/12/2006
   Autor     : Rodolpho da Silva
   Pendência : 23238
   Descrição : Implementar identificador de processos para cada transação por grupo
----------------------------------------------------------------------------------------}

unit uCtrlTransacoesPorGrupo;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils,wwQuery, provider,
  uCtrlPeriodoOrcamen, uCtrlOrcamento, uCtrlReservaOrcamen, uCtrlSaldoOrcado,
  uData, uCMTypes, uDbReservaorcamen, Classes, uString, uDbResxcomp,
  uCmMath, JCLMath, uDbDescdivergorc,DbGrids,Dialogs,uModulo, uSistema;

Type
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202
  tTipoConta = (tcOrigem, tcDestino, tcAmbas);
  tTipoFiltro = (tfOrigem, tfDestino, tfNone);
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

  // Edilaine - SOL 172383-7763 / KTN 1557030
  tParametros = record
    iPeriodo       : integer;
    iExercicio     : integer;
    iIdPlanoOrc    : integer;
    iUnidNegoc     : integer;
    sCodCentRespon : string;
    iIdPlano       : integer;
    iIdPatro       : integer;
    sCodCCusto     : string;
    iIdSubDespesa  : integer;
    iIdPrograma    : integer;
    iIdTIpoDespesa : integer;
    idGrupoOrc     : Integer; // VANDER - SOL 172384/9361 KINTANA 1653184
  end;
  // Edilaine - SOL 172383-7763 / KTN 1557030 - fim

  //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
  TGRUPOORCAMEN = Record
    Id   : Integer;
    Nome : String;
    Cod  : String;
    FlgTransf : String;  // Edilaine - SOL 190311 / KTN 1799290
    //flganalsint      : Boolean;
    //flgsinalgrupo    : Boolean;
    //flgresultado     : Boolean;
    //idplanoorcamen   : Integer;
    //idformorcado     : Integer;
  End;

  TRESERVAORCAMEN = Record
    ObsReserva : String;
  End;

  TTipoParamEntradaEspecial = (tpeeCentroCusto, tpeeSubDespesa, tpeePlanoOrc);
  EParamEntradaEspecial = Class(Exception);

  TParamEntradaEspecial = Class
  Private
    FParam          : tParametros;
    FGRUPOORCAMEN   : TGRUPOORCAMEN;
    FRESERVAORCAMEN : TRESERVAORCAMEN;
  Public
    Property Parametros          : tParametros     Read FParam;
    Property GrupoOrcamentario   : TGRUPOORCAMEN   Read FGRUPOORCAMEN;
    Property ReservaOrcamentaria : TRESERVAORCAMEN Read FRESERVAORCAMEN;

    Constructor Create(ADefaultValues : Boolean = True);Reintroduce;
    { AAll -> Define se irá limpar apenas FParam ou todos os atributos  }
    Procedure Clear(AAll : Boolean = True);
    Class Function GetParam(AFieldName                : String;
                            AParamEntradaEspecial     : TParamEntradaEspecial;
                            ATipoParamEntradaEspecial : TTipoParamEntradaEspecial;
                            ADefaultValue             : String = ''
                           ) : String;Overload;
    Class Procedure GetParam(Var ASQL                  : String;
                             AFieldName                : String;
                             AParamEntradaEspecial     : TParamEntradaEspecial;
                             ATipoParamEntradaEspecial : TTipoParamEntradaEspecial;
                             ADefaultValue             : String = ''
                            );Overload;
  End;
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184


  tTipoUnidNegoc = (tuAnalitico,tuSintetico,tuAmbos);

  TCtrlTransacoesPorGrupo = class(TCmControlObject)
  private
      function RetornaCodGrupoOrcamento(iIdGrupo : string) : string;  // Edilaine - SOL 189698 / KTN 1794093

      function MontaListaCentroCusto(ACodUsuario     : Integer = 0;
                                     AIDGrupoOrcamen : Integer = 0) : String;  // VANDER   - SOL 172385/10082 - Kintana - 1690505

  Protected
      procedure DoChangeDataBase; Override;

  private
      CtrlPeriodoOrcamen : TCtrlPeriodoOrcamen;
      CtrlOrcamentoBack  : TOrcamentoBackMT;
      CtrlReservaOrcamen : TCtrlReservaOrcamen;
      CtrlSaldoOrcado    : TCtrlSaldoOrcado;
      DbReservaorcamen   : TDbReservaorcamen;
      DbResxComp         : TDbResxcomp;
      DbDescdivergorc    : TDbDescdivergorc;
      CdsResxComp,CdsAux,
      CdsRateioAnual     : TClientDataSet;
      CdsEspelhoCds      : TClientDataSet; // Teste Renato visoni

  public
      function iif(c: boolean; a, b: single): single; overload;  // Edilaine - SOL 187127 / KTN 1761657
      function iif(c: boolean; a, b: string): string; overload;  // Edilaine - SOL 189698 / KTN 1794093

      Constructor Create;  Override;
      Destructor  Destroy; Override;
      procedure   AfterInitialize; Override;


      // Métodos das tela Reserva e Compromisso Especial (Grupo de Contas)
      function ListaContas(iIdPlanoOrc,iIdPessoaAcesso,iIdPessoa,iIdGrupoOrc,
                           iUnidNegoc, iIdPlanoPrev, iIdPatro, iPeriodo, iExercicio: integer;
                           sCodCentRespon, sUsuario: string;
                           bSomenteCCAtivo: Boolean = False;
                           //Ricardo SOL 163903 KTN 1403195
                           iPrograma : integer = -1;
                           iTipoDespesa : integer = -1;
                           //Ricardo SOL 163903 KTN 1403195 - fims
                           //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
                           AParamEntradaEspecial : TParamEntradaEspecial = Nil
                           //Fim    - VANDER SOL 172384/9361 KINTANA 1653184
                           ): OleVariant;
      // Arnaldo V. Scarin - Pendencia 27744 - 19/6/2008
//      function ListaPlanoTrab(iIdUsuario,iIdPessoa: integer): OleVariant;
      function ListaPlanoTrab(iIdUsuario,iIdPessoa: integer; dData : TDateTime; bPeriodoAnual: Boolean = False): OleVariant;

      function ValidaPlanoTrab(iIdPlanoTrab,iExercicio: integer): Boolean;

      function ListaReservaCompromissoEfetuado(sFlgResComp,sResCompStatus: string; iIdPlanoOrc, iIdPessoa, iIdGrupoOrc,
                                               iPeriodo, iIdOperacao, iExercicio: integer; dDataReferencia: TDateTime): OleVariant;
      function AplicarReservaCompromissoPorGrupo(ovDadosContas: OleVariant;
                                                 sFlgResComp,
                                                 sPermiteSaldoNeg: string;
                                                 iIdModulo,
                                                 iIdEmpresa,
                                                 iIdPlanoOrcamen: integer;
                                                 ovDadosResxComp: OleVariant;
                                                 var iIdOperacao: integer;
                                                 bCompromissoComReserva: boolean = True;
                                                 isAjuste: Boolean = False): boolean;
      function ExluirReservasCompromissoPorGrupo(ovDadosConta: OleVariant;
                                                 sFlgResComp: string;
                                                 iIdPessoa,iPlanoOrc: integer;
                                                 bCompromissoComReserva: boolean = false): Boolean;
      function ListaResxComp(iIdPessoa,iIdCompromisso: integer): OleVariant;
      function ListaReservasDisponiveis(iIdPessoa,iIdGrupoOrc,iIdPlanoOrc,iPeriodo,iExercicio: integer; bAgrupar: Boolean): OleVariant;
      function ListaResxCompEfetuado(iIdPessoa,iIdCompromisso: integer): OleVariant;

      //  Funções da tela Reservas Especial (Grupo de Contas)
      function ListaReservaRatCriter(iIdPessoa: integer; iIdCriterioRateio: integer = -1): OleVariant;
      function ListaReservaValorCC(iIdPessoa,iExercicio,iPeriodo,iIdRatCriter: integer; sCodCentroCusto: string = ''): OleVariant;
      function ListaReservaDataView(iIdDataView: integer): OleVariant;
      function RetornaPeriodo(sDataReferencia: string): integer;




      //  Funções da tela Transferências Especial (Grupo de Contas)
      function ListaTransfContas(iIdPlanoOrc,iIdPessoaAcesso,iIdGrupoOrc,
                                 iUnidNegoc,iIdPlanoPrev,iIdPatro,iPeriodo,iExercicio,iIdEmpresa: integer; sCodCentroCusto,sCodCentroRespon: string): OleVariant;

      function ListaContasParaTransf(iPeriodo,
                                     iExercicio,
                                     iIdEmpresa,
                                     iIdPlanOrc, iIdGrupoOrc,
                                     iIdUsuario: integer;
                                     iUnidNegoc: integer = -1;
                                     sCodCentroRespon: string = '';
                                     iIdPlanoPrev: integer = -1;
                                     iIdPatro: integer = -1;
                                     // Edilaine Ferraresi - SOL 163908 / KTN 1403202
                                     iIdPrograma : integer = -1;
                                     iIdTipoDespesa : integer = -1;
                                     // Edilaine Ferraresi - SOL 163908 / KTN 1403202- fim
                                     bSomenteCCAtivo: Boolean = False;
                                     //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
                                     AParamEntradaEspecial : TParamEntradaEspecial = Nil
                                     //Fim    - VANDER SOL 172384/9361 KINTANA 1653184
                                     // Thiago Melo Sol 209723 Kintana 2023107
                                     ; flgTipo : SmallInt = 1
                                     // Thiago Melo Sol 209723 Kintana 2023107
                                     ): OleVariant;
      function ListaTransfCCusto(iIdPessoaAcesso,iIdEmpresa: integer) :OleVariant;
      function ListaTransfCRespon(iIdPessoaAcesso: integer) :OleVariant;
      // Edilaine - SOL 190488 / KTN 1909246 - comentado
      {function ListaTransfEfetuadas(sDataRef,ExercicioO,ExercicioD: string; iIdOperacao, iPeriodo: integer): OleVariant; overload;
      function ListaTransfEfetuadas(sDataRef,ExercicioO,ExercicioD: string; iIdOperacao, iPeriodo: integer; TipoConta :tTipoConta): OleVariant; overload; // Edilaine Ferraresi - SOL 163908 / KTN 1403202
      } // Edilaine - SOL 190488 / KTN 1909246 - fim

      // Edilaine - SOL 190488 / KTN 1909246
      function ListaTransfEfetuadas(sDataRef, IdPlanoOrc : string; iIdOperacao, iPeriodoOri, iPeriodoDest : integer): OleVariant; overload;
      function ListaTransfEfetuadas(sDataRef, IdPlanoOrc : string; iIdOperacao, iPeriodoOri, iPeriodoDest : integer; TipoConta :tTipoConta): OleVariant; overload;
      // Edilaine - SOL 190488 / KTN 1909246 - fim

      // Edilaine - SOL 172383-7763 / KTN 1557030
      function ListaPlanoOrcamento(sGrupoOrcamento : string) : OleVariant;

      // VANDER   - SOL 172385/10082 - Kintana - 1690505
      // Inclusão dos parâmetros ACodUsuario e AIDGrupoOrcamen
      function ListaCentroCusto(ACodUsuario     : Integer = 0;
                                AIDGrupoOrcamen : Integer = 0) : OleVariant;

      function GetCCustoSubDespesa(iSubDespesa : integer): String;
      function GetFornecedorSubDespesa(iSubDespesa : integer): String;
      function GrupoOrcamentarioxSubdespesa(iIdGrupoOrc : integer) : boolean;   // Edilaine - SOL 190488 / KTN 1909246
      function ValidaSubDespesa(iIdGrupoOrc : integer; rParams : tParametros) : boolean;
      // Edilaine - SOL 172383-7763 / KTN 1557030 - fim


      // Funções da tela Suplementações Especial (Grupo de Contas)
      function ListaSuplContas(iIdPlanoOrc,iIdPessoaAcesso,iIdGrupoOrc,
                               iUnidNegoc, iIdPlanoPrev, iIdPatro, iPeriodo, iExercicio, iIdEmpresa,
                               iIdPrograma, iIdTipoDespesa : integer; // Edilaine Ferraresi - SOL 163910 / KTN 1403215
                               sCodCentroRespon: string;
                               bSomenteCCAtivo: Boolean = False;
                               //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
                               AParamEntradaEspecial : TParamEntradaEspecial = Nil
                               //Fim    - VANDER SOL 172384/9361 KINTANA 1653184
                               ): OleVariant;

      function ListaSuplementacoes(iIdPlanoOrc,
                                   iPeriodo,
                                   iExercicio,
                                   iIdGrupoOrc,
                                   iIdEmpresa,
                                   iIdOperacao: integer;
                                   dDataReferencia: TDateTime): OleVariant;


      // Métodos da tela Entrada de dados Especial (Grupo de Contas)
      function ListaContasEntDados(iPeriodo,
                                   iExercicio,
                                   idEmpresa,
                                   iIdPlanOrc,
                                   iIdGrupoOrc,
                                   iIdUsuario: integer;
                                   iUnidNegoc: integer = -1;
                                   sCodCentroRespon: string = '';
                                   iIdPlanoPrev: integer = -1;
                                   iIdPatro: integer = -1;
                                   //Ricardo SOL 159248 KTN 1337823
                                   iIdPrograma: integer = -1;
                                   iIdTipoDespesa: integer = -1;
                                   //Ricardo SOL 159248 KTN 1337823 - fim
                                   // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
                                   iIdSubDespesa : integer = -1;
                                   sCodCentroCusto : string = '';
                                   Operacao : TOperacao = opIdle;
                                   // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim
                                   bProcura: Boolean = False;
                                   bSomenteCCAtivo: Boolean = False): OleVariant;

      function CriaSaldoContas(ovDadosContas: OleVariant;
                               iPeriodo, iIdEmpresa: integer; bSobescreveSaldo: boolean;
                               const iIdDespesa : integer = -1; const bAtuIdDespesa : boolean = false): Boolean; // Edilaine - SOL 172383-7763 / KTN 1557030

      function DeletaSaldos(ovDadosContas: OleVariant; iIdEmpresa: integer): Boolean;
      function AlteraSaldos(ovDadosContas: OleVariant; iIdEmpresa: integer): Boolean;



      // Funções gerais
      function CalcularRateio(cCds: TClientDataSet;
                              iIdCriterioRateio: integer;
                              iIdPessoa: integer;
                              rValor: Double;
                              sNomeCriterio: string;
                              iIdPlano: integer = -1;
                              iIdPatro: integer = -1;
                              sAtivProj: string = '';
                              sCRespon : string = '';
                              //Ricardo SOL 159248 KTN 1337823
                              sPrograma   : string = '';
                              sTipoDespesa: string = '';
                              //Ricardo SOL 159248 KTN 1337823 - fim
                              bNovoCalcCriterioRateio: Boolean = False;
                              pPeriodo: integer = 0;
                              pExercicio: integer = 0;
                              bTranfMonta : Boolean = False    // Edilaine - SOL 193146 / KTN 1940385
                              ): boolean;

      function RateiaValor(iIdPessoa,
                           iExercicioIni,
                           iPeriodoIni,
                           iExercicioFim,
                           iPeriodoFim,
                           iIdCriterioRateio,
                           iIdGrupoOrcamen: integer;
                           sCodCentroCusto: string;
                           //Ricardo SOL 159248 KTN 1337823
                           iIdPrograma   : integer;
                           iIdTipoDespesa: integer;
                           //Ricardo SOL 159248 KTN 1337823 - fim
                           rValorRateio: Double;
                           iIdPlano: integer = -1;
                           iIdPatro: integer = -1;
                           sAtivProj: string = '';
                           sCRespon: string = ''): Double;

      // Alterado por FHBS - SOL: 150140 KTN: 1087554 - Faz o calculo do rateio de um critério
      procedure RateiaValorCriterioCDS(pCds: TClientDataSet;
                                       iIdCriterioRateio: integer;
                                       sNomeCriterio: string;
                                       pExercicio: integer;
                                       pPeriodo: integer;
                                       rValorRateio: Double);

//      function TestaCCustoRatxGrupoOrc(iIdCritRat,iIdGrupoOrc: integer): integer;
      //pendência 27798 - 06/05/2008 - para mostrar quais centros de custo não estão relacionados
      function TestaCCustoRatxGrupoOrc(iIdCritRat,iIdGrupoOrc: integer): olevariant;
      function TestaVigenciaRateio(iPerIni,iPerFim,iExeIni,iExeFim,iIdCriterio,iIdPessoa,iIdEmpresa: integer): boolean;


      //Ricardo SOL 159248 KTN 1337823
      function TestaProgramaRatxGrupoOrc(iIdCritRat,iIdGrupoOrc: integer): olevariant;
      function TestaTipoDespesaRatxGrupoOrc(iIdCritRat,iIdGrupoOrc: integer): olevariant;
      //Ricardo SOL 159248 KTN 1337823 - fim


      function TestaContasSelRaxtGrupoOrc(ovDados: OleVariant; iIdCritRat: integer): boolean;
      function VerificaSaldoGrupo(iIdGrupo,iPeriodo,iExecicio,iIdPessoa,iIdPlanoOrcamen: integer): boolean;

      function ListaPlano: OleVariant;
      function ListaPatro: OleVariant;

      //Ricardo SOL 159248 KTN 1337823
      function ListaPrograma: OleVariant;
      function ListaTipoDespesa: OleVariant;
      //Ricardo SOL 159248 KTN 1337823 - fim


      //Ricardo Freitas SOL 166069 KTN 1468025
      function ListaAtividadeProj: OleVariant;
      //Ricardo Freitas SOL 166069 KTN 1468025 - fim

      //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
      //function ListaAtivProj(iIdPessoa: integer; TipoUnid: tTipoUnidNegoc): OleVariant;
      function ListaAtivProj(iIdPessoa: integer; TipoUnid: tTipoUnidNegoc; sAtivo : String = ''): OleVariant;
      //Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM

      function ListaCenario: OleVariant;
      function ListaCriterio(iIdPessoa: integer): OleVariant;
      function ListaCCusto(iIdEmpresa: integer): OleVariant;
      function ListaCRespon(iIdPessoa: integer): OleVariant;

      function CancelaReservaCompromisso(ovDados: OleVariant; sResOuComp: string; bCompPorReserva: boolean; iIdEmpresa: integer; bAjuste : Boolean = False): Boolean;
      function RetornaFiltroUsuario(iIdUsuario: integer; sCodCentroRespon: string): string;

      function ListaDivergencia(iIdDescdivergorc: integer): OleVariant;
      function ListaDescDiverg(iIdPessoa,iIdPlanoOrc,iExercicio,iPerIni,iPerFim: integer): OleVariant;
      function ListaPeriodo(iIdPessoa,iExercicio: integer): OleVariant;
      function GravaDivergencia(ovDados: OleVariant; Operacao: TOperacao): boolean;






      // Qry's de relatórios
      function ListaResCompPorGrupo(iIdPlanoOrc,
                                    iIdPessoa,
                                    iPeriodoIni,
                                    iPeriodoFim,
                                    iExercicio,
                                    iIdGrupoOrc,
                                    iIdOperacao
                                    : integer;
                                    sFlgResComp,
                                    sFlgStatus: string) : OleVariant;
     function ListaImagem(iIdPessoa: integer): OleVariant;
     function ListaAlterOrcamenPorGrupo(sFlgTipoALter: string;
                                        iIdEmpresa,
                                        iGOrigem,
                                        iGDestino,
                                        iPerIni,
                                        iPerFim,
                                        iExercicio,
                                        iIdOperacao: integer): OleVariant;
     function ListaAjustesOrcEfetuados(dDataIni,dDataFim: TDateTime;
                                       iIdEmpresa,
                                       iCodGrupoOrc,iIdOperacao: integer): OleVariant;
     function ListaGrupoRealxContabxFluxo(cContabOuFluxo: Char; iIdPessoa, iPeriodo,
                                          iExercicio,iIdPlanoOrc: integer; iIdGrupoOrc: integer = 0): OleVariant;
     function ListaContasRealxContabxFluxo(cContabOuFluxo: Char;
                                           iIdPessoa, iPeriodo, iExercicio, iIdPlanoOrc: integer;
                                           iIdGrupoOrc :integer = 0): OleVariant;
     function ListaCompContasRealxContabxFluxo(iPeriodo,iExercicio,iIdPessoa,iIdPlanoOrc: integer;
                                               iIdGrupoOrc: integer = 0): OleVariant;

     function ListaDivergOrcxReal(iPerIni,iPerFim,iExercicio,iIdPessoa,iIdPlanoOrc: integer;
                                  sCodGrupoIni,sCodGrupoFim,sContaIni,sContaFim,
                                  sCodCentroCusto,sCodCentroResp,sIdPlanoPrev,sIdPatro,sIdUnidNegoc: string): OleVariant;

     procedure EditarDatasReferencia(cds:TDataset;Dt_Refer:TDateTime);

     //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
     //Retorna o Id Criterio de Rateio utilizado para o grupo por um determinado
     //exercício\período na tela de Entrada de Dados Especiais conforme SaldoOrcado.
     function Retornar_IdCriterio_porGrupoPeriodo(idPessoa:integer;
                                                 idPlanoOrcamen:integer;
                                                 idGrupoorcamen:Integer;
                                                 sExercicio:string;
                                                 sPeriodo:string):real;


     //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
     function Clona_CLientDataset(cdsOrigem,cdsDestino:TClientDataSet):Boolean;

     //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
     Function UsuarioCOPEF(AIdUser : Integer) : Boolean;
     //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

     Function verificaSubDespesa(pIdGrupoOrcamen : Integer) : Boolean;//Marcio Sanches Spinosa SOL 219322 Kintana 2051324
  end;




implementation

uses
  Math, uFuncoesOrcamento;


procedure TCtrlTransacoesPorGrupo.DoChangeDataBase;
begin
  inherited;
  DbReservaorcamen.DataBaseName := DataBaseName;
  DbResxComp.DataBaseName       := DataBaseName;
  DbDescdivergorc.DataBaseName  := DataBaseName;  
end;




constructor TCtrlTransacoesPorGrupo.Create;
begin
  inherited;
  CtrlPeriodoOrcamen := TCtrlPeriodoOrcamen.Create;
  CtrlOrcamentoBack  := TOrcamentoBackMT.Create;
  CtrlReservaOrcamen := TCtrlReservaOrcamen.Create;
  CtrlSaldoOrcado    := TCtrlSaldoOrcado.Create;
  DbReservaorcamen   := TDbReservaorcamen.Create(self);
  DbResxComp         := TDbResxcomp.Create(self);
  DbDescdivergorc    := TDbDescdivergorc.Create(self);
  CdsResxComp        := TClientDataSet.Create(nil);
  CdsAux             := TClientDataSet.Create(nil);

  CdsRateioAnual     := TClientDataSet.Create(nil);
  CdsEspelhoCds      := TClientDataSet.Create(nil); // Teste Renato Visoni

end;

destructor TCtrlTransacoesPorGrupo.Destroy;
begin
  FreeAndNil(CtrlPeriodoOrcamen);
  FreeAndNil(CtrlOrcamentoBack);
  FreeAndNil(CtrlReservaOrcamen);
  FreeAndNil(CtrlSaldoOrcado);
  FreeAndNil(DbReservaorcamen);
  FreeAndNil(CdsResxComp);
  FreeAndNil(DbResxComp);
  FreeAndNil(DbDescdivergorc);
  FreeAndNil(CdsAux);
  FreeAndNil(CdsRateioAnual);
  FreeAndNil(CdsEspelhoCds);// Teste Renato Visoni
  
  inherited;
end;

function TCtrlTransacoesPorGrupo.ListaPlanoTrab (iIdUsuario,iIdPessoa: integer; dData : tDateTime; bPeriodoAnual : Boolean = False): OleVariant;
   //Marilza Colpani 19/03/2009 N.Sol 110247/N.Kintana 503094
  function EndOfAMonth( Mes, Ano: String ): String;
  var
    DtTemp: TDateTime;
  begin
    if (Mes = '12') then
      DtTemp := StrToDate( '31/' + '12/' + Ano )
    else
    begin
      DtTemp := StrToDate( '01/' + IntToStr( StrToInt( Mes ) + 1 ) + '/' + Ano );
      DtTemp := DtTemp -1;
    end;
    Result := DateToStr( DtTemp );
  end;

var
  sData1, sData2, sSQL : String;
  iMes, iAno: Word;
begin
   //se a data for igual a zero então o período é anual
   if bPeriodoAnual then
   begin
     iMes := 1;
     iAno := Year( dData );
   end
   else
   begin
     iMes := Month( dData );
     iAno := Year( dData );
   end;

   sData1 := '01/' + inttostr ( iMes ) + '/' + inttostr( iAno );

   //se a data for igual a zero então o período é anual
   if bPeriodoAnual then
     sData2 := '31/12/' + inttostr( iAno )
   else
     sData2 := EndOfAMonth( IntToStr( iMes ), IntToStr( iAno ) );

   // Arnaldo V. Scarin - pendencia 27744 - 19/6/2008
   sSQL := 'SELECT '                                                     +
           '  DISTINCT O.DESCRICAO, '                                    +
           '  O.IDPLANOTRABALHO, '                                       +
           '  O.UNIDNEGOC, '                                             +
           '  U.NOME AS NOMEUN, '                                        +
           '  O.CODCENTRORESPON, '                                       +
           '  CR.NOME AS NOMECR '                                        +
           'FROM '                                                       +
           '  PLANOTRABALHOORC O, '                                      +
           '  CENTRESPON CR, '                                           +
           '  UNIDNEGOCIO U '                                            +
           'WHERE '                                                      +
           '  (O.IDPESSOA = CR.IDPESSOA) AND '                           +
//pendência 26595 - 26/11/2007
//           '  (CR.ATIVO = ''S'') AND '                                   +
           '  (CR.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND '          +
           '  (CR.CODCENTRORESPON = O.CODCENTRORESPON) AND '             +
           '  (CR.IDPESSOA = O.IDPESSOA) AND '                           +
           '  (U.UNIDNEGOC = O.UNIDNEGOC) AND '                          +
           '  (U.IDPESSOA = O.IDPESSOA) AND'                             +
           // Arnaldo V. Scarin - pendencia 27744 - 19/6/2008
           '  (TO_DATE('+QuotedStr(sData1)+',''DD/MM/YYYY'') >= TO_DATE(''01/''||O.PERIODOINI||''/''||O.EXERCICIOINI,''DD/MM/YYYY'')) AND'+
           //Bruno Bastos - Sol 123721 - Kintana 620954 - 11/09/2009 -                          '  (TO_DATE('+QuotedStr(sData2)+',''DD/MM/YYYY'') <= TO_DATE(''01/''||O.PERIODOFIM||''/''||O.EXERCICIOFIM,''DD/MM/YYYY'')) '+
           '  (TO_DATE('+QuotedStr(sData2)+',''DD/MM/YYYY'') <= LAST_DAY(TO_DATE(''01/''||O.PERIODOFIM||''/''||O.EXERCICIOFIM,''DD/MM/YYYY''))) '+ //Bruno Bastos - Sol 123721 - Kintana 620954 - 11/09/2009
           'ORDER BY '                                                   +
           '  O.DESCRICAO ';
  Result := GetDataPacket(sSQL);
end;

function TCtrlTransacoesPorGrupo.ListaReservaRatCriter(iIdPessoa: integer; iIdCriterioRateio: integer = -1): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' +
           ' C.IDCRITERIORATORC, ' +
           ' C.DESCRICAO, ' +
           ' C.TIPORATEIO, ' +
           ' DECODE(C.TIPORATEIO,''M'',''Pré-Definido'',''G'',''Gerado por pesquisa'') AS DESCTIPORAT, ' +
           ' C.IDDATAVIEW, ' +
           ' C.PERNUMERO, ' +
           ' C.PEREXERCICIO, ' +
           ' P.PERDATINI, ' +
           ' P.PERDATFIM ' +
           'FROM ' +
           '  CRITERIORATORC C, ' +
           '  PERIODO P ' +
           'WHERE ' +
           ' (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
           ' (C.PERNUMERO = P.PERNUMERO(+)) AND ' +
           ' (C.PEREXERCICIO = P.PEREXERCICIO(+)) AND ' +
           ' (C.IDPESSOA = P.IDPESSOA(+)) ';

           if iIdCriterioRateio <> -1 then
              sSQL := sSQL + ' AND C.IDCRITERIORATORC = ' + IntToStr(iIdCriterioRateio);

           sSQL := sSQL + ' ORDER BY ' +
                          ' C.DESCRICAO ';

   Result := GetDataPacket(sSQL);
end;




function TCtrlTransacoesPorGrupo.ListaContas(iIdPlanoOrc,iIdPessoaAcesso,iIdPessoa,iIdGrupoOrc,
                                             iUnidNegoc,iIdPlanoPrev,iIdPatro,iPeriodo,iExercicio: integer;
                                             sCodCentRespon, sUsuario: string;
                                             bSomenteCCAtivo: Boolean;
                                             //Ricardo SOL 163903 KTN 1403195
                                             iPrograma : integer;
                                             iTipoDespesa : integer;
                                             //Ricardo SOL 163903 KTN 1403195 - fims
                                             //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
                                             AParamEntradaEspecial : TParamEntradaEspecial
                                             //Fim    - VANDER SOL 172384/9361 KINTANA 1653184
                                             ): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' +
           '  ''S'' AS VALIDAR, ' +
           '  0 AS IDOPERACAO, ' +
           //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui IDOPERACAOAJUSTE
           '  0 AS IDOPERACAOAJUSTE, ' +
           '  NVL(SALDODISP.SALDO,0) AS SALDO, ' +
           '  PPV.NOME AS PLANO, ' +
           '  P.NOME AS PATRO, ' +
           '  C.IDCONTAORCAMEN, ' +
           '  C.IDGRUPOORCAMEN, ' +
           '  G.NOMEGRUPOORCAMEN, ' +
           '  G.CODGRUPOORC, ' +
            //Brunno Mattos SOL 153803 KINTANA 1163260 inclui IDCRITERIORATORC, NOMECRITERIO e VALORRATEIO
           '   0 AS IDCRITERIORATORC,'+
           '   ''0'' AS NOMECRITERIO,'+
           '   0 AS VALORRATEIO,'+
           
           '  TRIM(R.CODEXTERNO) || '' - '' || R.NOME AS CENTRORESPON, ' +
           '  TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUSTO, ' +
           '  CC.CODCENTROCUSTO, ' +
           '  C.CODCENTRORESPON, ' +

           //Ricardo SOL 163903 KTN 1403195
           '  C.IDPROGRAMAORCAMEN, '  +
           '  POR.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' +
           '  C.IDTIPO_DEPESAORCAMEN, ' +
           '  DES.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA , ' +
           '  C.UNIDNEGOC, ' +
           '  UN.NOME AS ATIVIDADEPROJ, ' +
           //Ricardo SOL 163903 KTN 1403195 - fim

           '  C.IDPATRO, ' + CR_LF +
           '  C.IDPLANOPREV, ' + CR_LF +
           '  (0) AS IDRESERVAORCAMEN, ' + CR_LF +
           '  (0) AS NUMRESERVA, ' + CR_LF +
           '  '' '' AS FLGRESERVA, ' + CR_LF +
           '  ''Inserindo'' AS DESCRESERVA, ' + CR_LF +
           '  PER.PERIODO, ' + CR_LF +
           '  PER.EXERCICIO, ' + CR_LF +
           '  TRUNC(SYSDATE) AS DATAREFERENCIA, ' + CR_LF +
           //'       decode(lag(PER.PERIODO) over(order by PER.PERIODO), PER.PERIODO, ''N'', ''S'') as LANC_DIF, ' +
           '       decode(lag(CC.CODEXTERNO) over(order by PER.PERIODO, CC.CODEXTERNO, PPV.NOME, P.NOME, C.IDCONTAORCAMEN), CC.CODEXTERNO, ''N'', ''S'') as LANC_DIF, ' + CR_LF +
           '       ''N'' as LANC_DIF_AUX, ' + CR_LF +
           '  ''                                                                                                                                                                                '' AS OBSRESERVA, ' + CR_LF +
           '  ' + QuotedStr(sUsuario) + ' AS USUARIO, ' + CR_LF +
           '  (0) AS VALOR, ' + CR_LF +
           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           '  ''N'' AS SELECIONADO, ' + CR_LF +
           '  Desp.Fornecedor,' + CR_LF +
           '  Desp.SUBDESPESA as SUBDESP,' + CR_LF +
           '  trim(NVL(DESP.FORNECEDOR,'''')) || decode(DESP.FORNECEDOR, null, '''', ''/'') || trim(DESP.SUBDESPESA) AS SUBDESPESA ' + CR_LF +
           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184

           'FROM ' +
           '  CONTASORCAMEN C, ' +
           '  PESSOA P, ' +
           '  PLANPREVCONTABIL PPV, ' +
           '  CENTRESPON R, ' +
           '  GRUPOORCAMEN G, ' +
           
           //Ricardo SOL 163903 KTN 1403195
           ' CM.PROGRAMAORCAMEN POR, ' +
           ' CM.TIPO_DESPESAORCAMEN DES,  ' +
           ' UNIDNEGOCIO UN ,' +
           //Ricardo SOL 163903 KTN 1403195 - fim

           '  PERIODOORCAMEN PER, ' + //Brunno Mattos - KTN 1121572 - SOL 151865
           ' (SELECT S.IDCONTAORCAMEN, S.IDPLANOORCAMEN, ' +
           '          NVL(ROUND(SUM(NVL(S.VLRORCADO,0)) - ' +
           //Brunno Mattos KTN 1159883  SOL 153584
           //Subtrai VLRAJUSTE do VLRCOMPROMETIDO, pois no momento em que é feito o ajuste, o valor do mesmo ja é comprometido
           //'           SUM(NVL(S.VLRCOMPROMETIDO,0) + NVL(S.VLRRESERVADO,0) - NVL(S.VLRAJUSTE,0)),2),0) AS SALDO, ' +
           // Edilaine - SOL 190488 / KTN 1909246 - o VLRORCADO não será alterado pelas transf e suplementacoes,
           // o valor será composto pelos campos de ajuste nas consultas que retornem o saldo das contas
           '           SUM(NVL(S.VLRCOMPROMETIDO,0) + NVL(S.VLRRESERVADO,0)) + SUM(NVL(S.VLRAJUSTE,0)) +  SUM(NVL(VLRTRANSF, 0)) ,2),0) AS SALDO, ' +

           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           '         S.IDDESPESAORC' +
           //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

           '  FROM SALDOORCADO S ';

           _Cds.Data := GetDataPacket('SELECT FLGTIPOSALDO FROM PARAMORCAMENTO WHERE IDPESSOA = ' + IntToStr(iIdPessoa));
             if not _Cds.IsEmpty then
             begin
                case _Cds.FieldByName('FLGTIPOSALDO').AsString[1] of
                   // Por período
                   'P': begin
                           if iPeriodo <> 0 then //Brunno Mattos - KTN 1121572 - SOL 151865
                             sSQL := sSQL +  '  WHERE PERIODO   = ' + IntToStr(iPeriodo) + ' AND ' +
                                             '        EXERCICIO = ' + IntToStr(iExercicio)
                           else
                             //Brunno Mattos - KTN 1121572 - SOL 151865 caso for periodo anual
                             sSQL := sSQL +  '  WHERE PERIODO   = 1 AND ' +
                                             '        EXERCICIO = ' + IntToStr(iExercicio);
                        end;

                   // Acumulado do exercício
                   'E': begin
                           sSQL := sSQL +  '  WHERE EXERCICIO = ' + IntToStr(iExercicio);
                        end;

                   // Acumulado até o período
                   'A': begin
                           if iPeriodo <> 0 then
                             sSQL := sSQL +  '  WHERE PERIODO   <= ' + IntToStr(iPeriodo) + ' AND ' +
                                             '        EXERCICIO <= ' + IntToStr(iExercicio)
                           else
                             //Brunno Mattos - KTN 1121572 - SOL 151865 caso for periodo anual
                             sSQL := sSQL +  '  WHERE PERIODO   <= 12 AND ' +
                                             '        EXERCICIO <= ' + IntToStr(iExercicio);
                        end;
                end;
             end
             else
                sSQL := sSQL +  '  WHERE PERIODO   <= -1 AND ' +
                                '        EXERCICIO <= -1 ';


           sSQL := sSQL +
           '  GROUP BY S.IDCONTAORCAMEN,S.IDPLANOORCAMEN, S.IDDESPESAORC) SALDODISP, ' +
           '  CENTCUST CC, ' +
           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           '  (Select' +
           '    D.IDDESPESAORC,' +
           '    D.IDFORNECEDOR,' +
           '    P.NOME AS FORNECEDOR,' +
           '    D.FLGSTATUSDESPESA,' +
           '    DECODE(D.FLGSTATUSDESPESA, ''I'', ''INATIVO'', ''ATIVO'') AS STATUS,' +
           '    D.NATUREZA,' +
           '    D.SUBDESPESA,' +
           '    D.ACAO,' +
           '    D.DESCRICAO,' +
           '    D.IDPESSOA' +
           '   From DESPESAORCAMENTARIA D, PESSOA P' +
           '   Where D.IDFORNECEDOR = P.IDPESSOA(+)) Desp ' +
           //FIM    - VANDER SOL 172384/9361 KINTANA 1653184
           'WHERE ' +
           '  (PER.EXERCICIO) =  ' + IntToStr(iExercicio) + ' AND '; //Brunno Mattos - KTN 1121572 - SOL 151865 Inicio

           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           //Centro de Custo
           TParamEntradaEspecial.GetParam(sSQL, 'C.CODCENTROCUSTO',  AParamEntradaEspecial, tpeeCentroCusto);
           //Plano Orçamentário
           TParamEntradaEspecial.GetParam(sSQL, 'C.IDPLANOORCAMEN',  AParamEntradaEspecial, tpeePlanoOrc);
           //Sub-Despesa
           TParamEntradaEspecial.GetParam(sSQL, 'SALDODISP.IDDESPESAORC', AParamEntradaEspecial, tpeeSubDespesa);
           //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

           sSQL := sSQL +
           '  (PPV.IDPLANOPREV(+) = C.IDPLANOPREV) AND ' +
           '  (P.IDPESSOA(+)      = C.IDPATRO) AND ' +
           '  (R.CODCENTRORESPON(+) = C.CODCENTRORESPON) AND ' +

           '  (SALDODISP.IDCONTAORCAMEN(+) = C.IDCONTAORCAMEN) AND ' +
           '  (SALDODISP.IDPLANOORCAMEN(+) = C.IDPLANOORCAMEN) AND ' +


           '  (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ';// +
           //'  (C.IDPLANOORCAMEN =  ' + IntToStr(iIdPlanoOrc) + ') AND ';

           if iPeriodo <> 0 then  //Brunno Mattos - KTN 1121572 - SOL 151865
              sSql := sSql + '(PER.PERIODO = ' + IntToStr(iPeriodo) + ') AND';

           if Trim(sCodCentRespon) <> '' then // Alterado por FHBS - SOL: 151079 KTN: 1103455
             sSQL := sSQL + RetornaFiltroUsuario(iIdPessoaAcesso,sCodCentRespon);

           sSQL := sSQL +
           '  (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND ' +

//pendência 26595 - 26/11/2007
//           '  (CC.ATIVO = ''S'') AND ' +

           // Alterado por FHBS - SOL: 151079 KTN: 1103455
           //'  (CC.IDEMPRESA = ' + IntToStr(iIdPessoa) + ' ) AND ' +
           '  (C.IDEMPRESA = CC.IDEMPRESA(+) ) AND ' +

           '  (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ' ) AND ' +
           '  (C.IDGRUPOORCAMEN =  ' + IntToStr(iIdGrupoOrc) + ' ) ';

           if iUnidNegoc <> 0 then
              sSQL := sSQL + ' AND (C.UNIDNEGOC = ' + IntToStr(iUnidNegoc) + ')  ';
              
           //Ricardo SOL 163903 KTN 1403195
           sSQL := sSQL + ' AND (C.UNIDNEGOC = UN.UNIDNEGOC(+)) ';
           sSQL := sSQL + ' AND (C.IDPROGRAMAORCAMEN = POR.IDPROGRAMAORCAMEN(+)) ';
           sSQL := sSQL + ' AND (C.IDTIPO_DEPESAORCAMEN = DES.IDTIPO_DEPESAORCAMEN(+)) ';

           if iPrograma  <> -1 then
              sSQL := sSQL + ' AND (C.IDPROGRAMAORCAMEN = ' + IntToStr(iPrograma) + ')  ';

           if iTipoDespesa <> -1 then
              sSQL := sSQL + ' AND (C.IDTIPO_DEPESAORCAMEN = ' + IntToStr(iTipoDespesa) + ')  ';
           //Ricardo SOL 163903 KTN 1403195 - fim

           if iIdPlanoPrev <> -1 then
              sSQL := sSQL + ' AND (C.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ') ';

           if iIdPatro <> -1 then
              sSQL := sSQL + ' AND (C.IDPATRO = ' + IntToStr(iIdPatro) + ')';

           // Alterado por FHBS - SOL: 151660 KTN: 1115295
           if bSomenteCCAtivo then
              sSQL := sSQL + ' and nvl(CC.ATIVO,''S'') = ''S'' ' + CR_LF +
                             ' and nvl(CC.STATUSGRUPOCDC,''A'') = ''A'' ' + CR_LF;
           // Fim - Alterado por FHBS - SOL: 151660 KTN: 1115295

           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           sSQL := sSQL +
                ' AND SALDODISP.IDDESPESAORC = Desp.IDDESPESAORC(+)';

           With AParamEntradaEspecial.ReservaOrcamentaria do
             if Trim(ObsReserva) <> '' Then
                sSQL := sSQL +
                     ' And Exists ( Select R.IDPLANOORCAMEN, R.IDCONTAORCAMEN'
                                 + '  From RESERVAORCAMEN R'
                                 + ' Where R.IDPLANOORCAMEN = C.IDPLANOORCAMEN'
                                 + '   And R.IDCONTAORCAMEN = C.IDCONTAORCAMEN'
                                 + '   and upper(R.ObsReserva) like ' + QuotedStr('%' + AnsiUpperCase(Trim(ObsReserva)) + '%')
                                 + ')';
           //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

           {ao alterar o ORDER BY verificar a linha referente ao LANC_DIF, se não será afetada}
           sSQL := sSQL +
                //' ORDER BY PERIODO, CENTROCUSTO, PLANO, PATRO';
                ' order by PER.PERIODO, CENTROCUSTO, PPV.NOME, P.NOME, C.IDCONTAORCAMEN  ';
                //' ORDER BY CENTROCUSTO ';


   Result := GetDataPacket(sSQL);
end;




function TCtrlTransacoesPorGrupo.ListaReservaValorCC(iIdPessoa,
  iExercicio, iPeriodo, iIdRatCriter: integer;
  sCodCentroCusto: string = ''): OleVariant;
var
   sSQL: string;

begin
   sSQL := 'SELECT ' +
           '   NVL(SUM(NVL(VLRCRIRATORC,0)),0) AS VLRCRIRATORC ' +
           'FROM ' +
           '   VALORCRIRATORC ' +
           'WHERE ' +
           '       (IDPESSOA         = ' + IntToStr(iIdPessoa) + ') ' +
           '   AND (EXERCICIO       >= ' + IntToStr(iExercicio) + ') ' +
           '   AND (PERIODO         >= ' + IntToStr(iPeriodo) + ') ' +
           '   AND (EXERCICIOFIM    <= ' + IntToStr(iExercicio) + ') ' +
           '   AND (PERIODOFIM      <= ' + IntToStr(iPeriodo) + ') ' +
           '   AND (IDEMPRESA        = ' + IntToStr(iIdPessoa) + ') ' +
           '   AND (IDCRITERIORATORC = ' + IntToStr(iIdRatCriter) + ')';


   if sCodCentroCusto <> '' then
     sSQL := sSQL + '   AND (TRIM(CODCENTROCUSTO)   = ' + Trim(sCodCentroCusto) + ') ';

   Result := GetDataPacket(sSQL);                        
end;




function TCtrlTransacoesPorGrupo.ListaReservaDataView(
  iIdDataView: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '  NAME, ' +
                           '  IDDATAVIEW, ' +
                           '  CLASSNAME, ' +
                           '  ORIGEMCMDV, ' +
                           '  TEMPLATE, ' +
                           '  DESCRIPTION ' +
                           'FROM ' +
                           '  DATAVIEW ' +
                           'WHERE ' +
                           '  (IDDATAVIEW = ' + IntToStr(iIdDataView) + ') AND ' +
                           '  (ORIGEMCMDV = ''0'') ');
end;




function TCtrlTransacoesPorGrupo.AplicarReservaCompromissoPorGrupo(ovDadosContas: OleVariant;
                                                                   sFlgResComp,
                                                                   sPermiteSaldoNeg: string;
                                                                   iIdModulo,
                                                                   iIdEmpresa,
                                                                   iIdPlanoOrcamen: integer;
                                                                   ovDadosResxComp: OleVariant;
                                                                   var iIdOperacao: integer;
                                                                   bCompromissoComReserva: boolean = True;
                                                                   isAjuste: Boolean = False): boolean;
var
  CdsAux: TClientDataSet;
  iExercicio,iPeriodo, iNumreserva, iIdReservaCompOrcamen: integer;
  sAux: string;
  bInTrans : boolean;    // Edilaine - SOL 190488 / KTN 1909246
begin

   bInTrans := InTransaction();  // Edilaine - SOL 190488 / KTN 1909246

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicarReservaPorGrupo(ovDadosContas,
                                                            sPermiteSaldoNeg,
                                                            iIdEmpresa,
                                                            iIdPlanoOrcamen,
                                                            bCompromissoComReserva);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin

      Result := False;

      try
         CdsAux                      := TClientDataSet.Create(nil);
         CtrlOrcamentoBack.IdEmpresa := iIdEmpresa;


         // Pego os dados das contas e passo para um Cds da classe TCMControlObject
         _Cds.Data        := ovDadosContas;
         CdsResxComp.Data := ovDadosResxComp;




         // Instancia a variável que irá relacionar as dotações
         //efetuadas no processo corrente
         iIdOperacao := GetSequence('IDOPERACAOORC');

         // Filtra somente as linhas habilitadas para o processo
         _Cds.Filtered := false;
         _Cds.Filter   := 'VALIDAR = ''S''';
         _Cds.Filtered := true;

         sAux := '  Operação nº ' + IntToStr(iIdOperacao);

         if not bInTrans then   // Edilaine - SOL 190488 / KTN 1909246
            StartTransaction;

         // Varre todo o Cds para inserir os valores de reserva nas contas orçamentárias
         //---------------------------------------------------------------------
         while not _Cds.Eof do
         begin
             iPeriodo   := _Cds.FieldByName('PERIODO').AsInteger;
             iExercicio := _Cds.FieldByName('EXERCICIO').AsInteger;


             if not CtrlPeriodoOrcamen.PeriodoLiberado('1/' +
                                                       _Cds.FieldByName('PERIODO').AsString + '/' +
                                                       _Cds.FieldByName('EXERCICIO').AsString,
                                                       iIdEmpresa) then
                raise Exception.Create('Período BLOQUEADO para lançamentos e alterações!');

             //  Só insere a reserva se a mesma for informada
             if _Cds.FieldByName('VALOR').AsFloat > 0then
             begin
                // Verifica a tabela de Saldos para ver se o compromisso pode ser feita com o Saldo corrente
                if sPermiteSaldoNeg = 'N' then
                begin
                   // Só não faz a crítica de saldo caso seja um compromisso por reserva
                   if not (bCompromissoComReserva and (sFlgResComp = 'C')) then
                   begin

                      //Ricardo SOL151907 KINTANA - adiciona if
                      if _Cds.FieldByName('SALDO').AsFloat > 0 then
                      begin
                          //Brunno Mattos KTN 1159883  SOL 153584 inclui if not isAjuste
                          if not isAjuste then
                          if not CtrlOrcamentoBack.VerificaSaldoProcesso(iIdPlanoOrcamen,
                                                                       _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                                       iExercicio,
                                                                       iPeriodo,
                                                                       _Cds.FieldByName('VALOR').AsFloat,
                                                                       false) then
                           raise Exception.Create('Não existe saldo suficiente para esta reserva/compromisso. Conta(' + _Cds.FieldByName('IDCONTAORCAMEN').AsString + ')');
                      end;
                   end;
                end;

                //  Faz este select somente para impedir que outro usuário use o mesmo número da reserva
                GetDataPacket('SELECT * FROM PARAMORCAMENTO FOR UPDATE');
                CdsAux.Data := CtrlReservaorcamen.ProximaReserva(iIdEmpresa);
                iNumReserva := (CdsAux.FieldByName('PROXIMA').asInteger + 1);


               iIdReservaCompOrcamen := CtrlReservaOrcamen.LerUltimaSequencia;
               // Cria reserva ou compromisso, de acordo como parâmetro sFlgResComp

               if not CtrlReservaorcamen.CriaReservaOuCompromisso(iIdReservaCompOrcamen,
                                                                  iIdEmpresa,
                                                                  iExercicio,
                                                                  iPeriodo,
                                                                  iIdPlanoOrcamen,
                                                                  iNumReserva,
                                                                  iIdModulo,
                                                                  _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                                  _Cds.FieldByName('OBSRESERVA').AsString + sAux,

                                                                  sFlgResComp,
                                                                  false, {True,}   // Edilaine - SOL 190488 / KTN 1909246
                                                                  True,
                                                                  _Cds.FieldByName('VALOR').AsFloat,
                                                                  _Cds.FieldByName('DATAREFERENCIA').AsDateTime,
                                                                  bCompromissoComReserva) then
                  raise Exception.Create(CtrlReservaOrcamen.MessageInfo);

               // Atualiza a linha relacionando com a operação em foco
               if not ExecSQL(' UPDATE RESERVAORCAMEN ' +
                              ' SET IDOPERACAO         = ' + IntToStr(iIdOperacao) +
                              ' WHERE IDRESERVAORCAMEN = ' + IntToStr(iIdReservaCompOrcamen)) then
                  raise Exception.Create(MessageInfo);


                // Tratamento para compromissos criados a partir de reservas
                if bCompromissoComReserva then
                begin
                   // Filtra as reservas relacionadas como o compromisso através do
                   //idcompromisso "virtual" atribuido na tela
                   CdsResxComp.Filtered := False;
                   CdsResxComp.Filter   := 'IDCOMPROMISSO = ' + _Cds.FieldByName('NUMRESERVA').AsString;
                   CdsResxComp.Filtered := True;

                   // Altera os idcompromisso "virtual" para o que realmente será gravado
                   // na tabela
                   CdsResxComp.First;
                   while not CdsResxComp.Eof do
                   begin
                      // Marca a reserva como Efetivada (E)
                      if not ExecSQL('UPDATE '+
                                     '   RESERVAORCAMEN ' +
                                     'SET ' +
                                     '   FLGRESERVA = ''E'' ' +
                                     'WHERE ' +
                                     '   (IDRESERVAORCAMEN = ' + CdsResxComp.FieldByName('IDRESERVA').AsString + ')') then
                         raise Exception.Create(MessageInfo);

                      CdsResxComp.Edit;
                      CdsResxComp.FieldByName('IDCOMPROMISSO').AsInteger := iIdReservaCompOrcamen;
                      CdsResxComp.Post;

                      //  Não pode executar o Next aqui, porque com estamos filtrando o Cds pelo numero de
                      //compromisso "virtual", sofrerá um efeito semelhante ao método Delete
                   end;

                end;
             end;

            _Cds.Next;
         end;
         // Fim do loop do Cds das contas orçamentárias
         //---------------------------------------------------------------------


         // Aplica as alterações na tabela de Reservas x Compromissos
         if bCompromissoComReserva then
         begin
            if not ApplyCds(CdsResxComp, DbResxComp, [], []) then
               raise Exception.Create(DbResxComp.MessageInfo);
         end;


         if not bInTrans then      // Edilaine - SOL 190488 / KTN 1909246
            Commit;

         Result := true;
         _Cds.Filtered := false;
         FreeAndNil(CdsAux);

      except
         on E:Exception do
         begin
           if not bInTrans then      // Edilaine - SOL 190488 / KTN 1909246
              Rollback;
            FreeAndNil(CdsAux);
            _Cds.Filtered := false;
            Result      := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



procedure TCtrlTransacoesPorGrupo.AfterInitialize;
begin
  inherited;
  CtrlPeriodoOrcamen.InitializeAs(self);
  CtrlOrcamentoBack.InitializeAs(self);
  CtrlReservaOrcamen.InitializeAs(self);
  CtrlSaldoOrcado.InitializeAs(Self);
  CdsRateioAnual.Data := GetDataPacket('SELECT ''                                '' AS IDCONTAORCAMEN, ' +
                                       '       0 AS IDPLANOORCAMEN, ' +
                                       '       0 AS PERIODO, ' +
                                       '       0 AS EXERCICIO, ' +
                                       '       0.00 AS VALOR ' +
                                       'FROM DUAL ' +
                                       'WHERE 1 = 2');


  // Teste Renato Visoni
  CdsEspelhoCds.Data  := GetDataPacket('SELECT ''                                '' AS IDCONTAORCAMEN, ' +
                                       '       0 AS IDPLANOORCAMEN, ' +
                                       '       0 AS PERIODO, ' +
                                       '       0 AS EXERCICIO, ' +
                                       '       0.00 AS VALOR, ' +
                                       '       0.00 AS VALORORCADO ' +
                                       'FROM DUAL ' +
                                       'WHERE 1 = 2');
  // Teste Renato Visoni



end;




function TCtrlTransacoesPorGrupo.RetornaPeriodo(
  sDataReferencia: string): integer;
begin
  Result := CtrlOrcamentoBack.EncontraPeriodo(sDataReferencia);
end;




function TCtrlTransacoesPorGrupo.ListaTransfContas(iIdPlanoOrc,
  iIdPessoaAcesso, iIdGrupoOrc, iUnidNegoc, iIdPlanoPrev,
  iIdPatro, iPeriodo,iExercicio,iIdEmpresa: integer; sCodCentroCusto,
  sCodCentroRespon: string): OleVariant;
var
  sSQL: string;

begin
//
end;




function TCtrlTransacoesPorGrupo.ListaTransfCCusto(
  iIdPessoaAcesso,iIdEmpresa: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '   CODEXTERNO, ' +
                           '   CODCENTROCUSTO, ' +
                           '   NOME,   ' +
                           '   IDPROGRAMAORCAMEN ' +
                           'FROM ' +
                           '   CENTCUST C ' +
                           ' INNER JOIN PROGRAMA P ON P.IDPROGRAMA = C.IDPROGRAMA ' +
                           'WHERE ' +
                           '   CODCENTROCUSTO IN ' +
                           '                (SELECT ' +
                           '                    U.CODCENTROCUSTO ' +
                           '                 FROM ' +
                           '                    USCCUSTO U ' +
                           '                 WHERE ' +
                           '                    (U.IDEMPRESA = ' + IntToStr(iIdEmpresa) + ') AND ' +
                           '                    (U.IDUSUARIO = ' + IntToStr(iIdPessoaAcesso) + ' )) ' +

                           'ORDER BY ' +
                           '   CODEXTERNO ');
end;




function TCtrlTransacoesPorGrupo.ListaTransfCRespon(
  iIdPessoaAcesso: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '   CODCENTRORESPON, ' +
                           '   NOME ' +
                           'FROM ' +
                           '   CENTRESPON ' +
                           'WHERE ' +
                           '   CODCENTRORESPON IN ' +
                           '                (SELECT CODCENTRORESPON ' +
                           '                 FROM PESSOAXCRESP ' +
                           '                 WHERE IDPESSOAACESSO = ' + IntToStr(iIdPessoaAcesso) + ' ) ' +
                           'ORDER BY ' +
                           '   CODCENTRORESPON ');
end;




function TCtrlTransacoesPorGrupo.ListaSuplContas(iIdPlanoOrc,
  iIdPessoaAcesso, iIdGrupoOrc, iUnidNegoc, iIdPlanoPrev, iIdPatro,
  iPeriodo, iExercicio, iIdEmpresa,
  iIdPrograma, iIdTipoDespesa : integer; // Edilaine Ferraresi - SOL 163910 / KTN 1403215
  sCodCentroRespon: string;
  bSomenteCCAtivo: Boolean;
  //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
  AParamEntradaEspecial : TParamEntradaEspecial
  //Fim    - VANDER SOL 172384/9361 KINTANA 1653184

  ): OleVariant;
var
  sSQL: string;
  sCodGrupoOrc : string;   // Edilaine - SOL 190488 / KTN 1909246
begin
   sSQL := 'SELECT ' +
           '   NVL(CC.CODEXTERNO, ''-1'') AS CODEXTERNO, ' +   // Edilaine - SOL 190488 / KTN 1909246
           '   ''S'' AS VALIDAR, ' +
           '   0 AS IDALTERORCAMENTO, ' +
           '   0 AS IDPESSOA, ' +
           '   0 AS NUMALTERACAO, ' +
           '   0 AS IDOPERACAO, ' +
           //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui IDOPERACAOCOMPROMISSO
           '   0 AS IDOPERACAOCOMPROMISSO, ' +
           '   C.IDPLANOORCAMEN, ' +
           '   C.IDGRUPOORCAMEN, ' +
           '   PER.PERIODO AS PERIODOORIGEM, '+
           '   PER.EXERCICIO AS EXERCICIOORIGEM, ' +
           //Renan Cristiano SOL 152790 KINTANA 1145737 inicio
           '   0 AS IDCRITERIORATORC,'+
           '   ''0'' AS NOMECRITERIO,'+
           '   PER.PERIODO AS PERIODO, '+
           '   PER.EXERCICIO AS EXERCICIO, ' +
           '   C.IDPLANOPREV, '+
           '   C.IDPATRO, '+
           // Edilaine - SOL 190488 / KTN 1909246
           {'   decode(lag(PER.PERIODO) over(order by PER.PERIODO), ' +
           '   PER.PERIODO, ' +
           ' ''N'', ' +
           ' ''S'') as LANC_DIF, ' +
           '   decode(lag(PER.PERIODO) over(order by PER.PERIODO), PER.PERIODO, ''N'', ''S'') as LANC_DIF, ' + }
           // Edilaine - SOL 190488 / KTN 1909246  - fim
           ' ''N'' as LANC_DIF_AUX, ' +
           //Renan Cristiano SOL 152790 KINTANA 1145737 Fim
           '   TRUNC(SYSDATE) AS DATAREFERENCIA, ' +
           '   C.IDGRUPOORCAMEN AS IDGRUPOORCORIGEM, ' +
           //Brunno Mattos KTN 1159883  SOL 153584 inclui IDCONTAORCAMEN, VALOR, DATAREFERENCIA, VLRAJUSTE,
           //OBSRESERVA(não traz nada pois essa função será chamada apenas para carregar o CDS quando se esta inserindo)
           '   C.IDCONTAORCAMEN, ' +
           //'  (0) AS VALOR, ' +                     // Edilaine - SOL 190488 / KTN 1909246
           //'  TRUNC(SYSDATE) AS DATAREFERENCIA, ' + // Edilaine - SOL 190488 / KTN 1909246
           '   S.VLRAJUSTE, ' +
           '   ''                                                                                                                                                                                                                                     '' AS OBSRESERVA, ' +
           '   C.IDCONTAORCAMEN AS IDCONTAORIGEM, ' +
           '   G.CODGRUPOORC, ' +
           '   G.NOMEGRUPOORCAMEN, ' +
           '   C.NOMECONTAORCAMEN, ' +
           '   '' '' AS FLGTIPOALTER, ' +
           '   TRIM(CC.CODEXTERNO) ||'' - ''|| CC.NOME AS CENTROCUSTO, ' +
           '   TRIM(CR.CODCENTRORESPON) ||'' - ''|| CR.NOME AS CENTRORESPON, ' +
           '   PPV.NOME AS PLANO, ' +

           '   P.NOME AS PATRO, ' +
           '   ''                                                                                                                                                                                                                                     '' AS OBSALTERORCAMEN, ' +

           // Edilaine Ferraresi - SOL 163910 / KTN 1403215
           '    C.UNIDNEGOC, ' +
           '    ATV.NOME AS ATIVIDADEPROJ, ' +
           '    C.IDPROGRAMAORCAMEN, '  +
           '    PG.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' +
           '    C.IDTIPO_DEPESAORCAMEN, ' +
           '    TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA, ' +
           // Edilaine Ferraresi - SOL 163910 / KTN 1403215 - fim

           //Renan Cristiano SOL 152790 KINTANA 1145737 Inicio
           '   0 AS VALOR, ' + CR_LF +
           '   NVL(S.SALDO,0) AS SALDO, ' + CR_LF +
           '   C.CODCENTROCUSTO, ' + CR_LF +
           //Renan Cristiano SOL 152790 KINTANA 1145737 Fim

           '  Desp.IDDESPESAORC, ' + CR_LF +   // Edilaine - SOL 190488 / KTN 1909246

           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           '  ''N'' AS SELECIONADO, ' + CR_LF +
           '  Desp.Fornecedor,' + CR_LF +
           '  Desp.SUBDESPESA as SUBDESP,' + CR_LF +
           '  trim(NVL(DESP.FORNECEDOR,'''')) || decode(DESP.FORNECEDOR, null, '''', ''/'') || trim(DESP.SUBDESPESA) AS SUBDESPESA ' + CR_LF +
           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184

           'FROM ' + CR_LF +
           '   CONTASORCAMEN C, ' +
           '   PERIODOORCAMEN PER, ' +
           '   GRUPOORCAMEN G, ' +
           '   CENTCUST CC, ' +
           '   PLANPREVCONTABIL PPV, ' +
           '   PESSOA P, ' +

           // Edilaine Ferraresi - SOL 163910 / KTN 1403215
           '    UNIDNEGOCIO ATV, ' +
           '    PROGRAMAORCAMEN PG, ' +
           '    TIPO_DESPESAORCAMEN TD, ' +
           // Edilaine Ferraresi - SOL 163910 / KTN 1403215 - fim

            '   (SELECT SO.IDCONTAORCAMEN, SO.IDPLANOORCAMEN, SO.VLRAJUSTE, ' + //Brunno Mattos KTN 1159883  SOL 153584 inclui VLRAJUSTE
           //Brunno Mattos KTN 1159883  SOL 153584 inclui - NVL(VLRAJUSTE),0)
           //'           NVL(SUM(NVL(VLRORCADO,0)),0) - NVL(SUM(NVL(VLRCOMPROMETIDO,0) + NVL(VLRRESERVADO,0) - NVL(VLRAJUSTE,0)),0) AS SALDO, ' +
           // Edilaine - SOL 190488 / KTN 1909246 - o VLRORCADO não será alterado pelas transf e suplementacoes,
           // o valor será composto pelos campos de ajuste nas consultas que retornem o saldo das contas
//           '           NVL(SUM(NVL(VLRORCADO,0)),0) - NVL(SUM(NVL(VLRCOMPROMETIDO,0) + NVL(VLRRESERVADO,0)),0) + NVL(SUM(VLRAJUSTE),0) + NVL(SUM(VLRTRANSF), 0) AS SALDO, ' +

             // Felipe A. Santos SOL 227156 KINTANA 2061700 - inicio comentário
             {'NVL(ROUND((SUM(NVL(SO.VLRORCADO, 0)) - '+
             '                    SUM(NVL(SO.VLRCOMPROMETIDO, 0)) + ' +
             '                    sum(NVL(SO.VLRREALIZADO, 0))) + '+ //Marcio Sanches Spinosa SOL 209766 Kintana 2040660
             '                    SUM(NVL(SO.VLRAJUSTE, 0)) + '+
             '                    SUM(NVL(SO.VLRTRANSF, 0)), 2), '+
             '              0) AS SALDO, '+}
             // Felipe A. Santos SOL 227156 KINTANA 2061700 - Fim comentário

             // Felipe A. Santos SOL 227156 KINTANA 2061700 - Inicio - regra passada pelo Luiz Paulo
             'NVL(ROUND( ' +
             '(sum(NVL(so.vlrorcado,0)) - ' +
             '(sum(NVL(so.vlrrealizado,0)) + sum(NVL(so.vlrcomprometido,0)))) + ' +
             '(sum(nvl(so.vlrajuste,0)) + sum(nvl(so.vlrtransf,0))) ' +
             ', 2), 0) AS SALDO, ' +
             // Felipe A. Santos SOL 227156 KINTANA 2061700 - Fim

             ' SO.PERIODO, ' +////Marcio Sanches Spinosa SOL 212127 Kintana 2036755
           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           '         SO.IDDESPESAORC ' +
           //FIM    - VANDER SOL 172384/9361 KINTANA 1653184
           '    FROM SALDOORCADO SO';

   _Cds.Data := GetDataPacket('SELECT FLGTIPOSALDO FROM PARAMORCAMENTO WHERE IDPESSOA = ' + IntToStr(iIdEmpresa));
     if not _Cds.IsEmpty then
     begin
        case _Cds.FieldByName('FLGTIPOSALDO').AsString[1] of
           // Por período
           'P': begin
                   if iPeriodo <> 0 then
                     sSQL := sSQL +  '  WHERE PERIODO   = ' + IntToStr(iPeriodo) + ' AND ' +
                                     '        EXERCICIO = ' + IntToStr(iExercicio)
                   else
                   //Marcio Sanches Spinosa SOL 212127 Kintana 2036755 - inicio
//                     sSQL := sSQL +  '  WHERE PERIODO   = 1 AND ' +
//                                     '        EXERCICIO = ' + IntToStr(iExercicio);
                     sSQL := sSQL +  '  WHERE SO.PERIODO = PERIODO AND ' +
                                     '        EXERCICIO = ' + IntToStr(iExercicio);
                     //Marcio Sanches Spinosa SOL 212127 Kintana 2036755 - Fim

                end;

           // Acumulado do exercício
           'E': begin
                   sSQL := sSQL +  '  WHERE EXERCICIO = ' + IntToStr(iExercicio);
                end;

           // Acumulado até o período
           'A': begin
                   if iPeriodo <> 0 then //Brunno Mattos - KTN 1121572 - SOL 151865
                     sSQL := sSQL +  '  WHERE PERIODO   <= ' + IntToStr(iPeriodo) + ' AND ' +
                                   '        EXERCICIO <= ' + IntToStr(iExercicio)
                   else //Brunno Mattos - KTN 1121572 - SOL 151865
                     sSQL := sSQL +  '  WHERE PERIODO   <= 12 AND ' +
                                   '        EXERCICIO <= ' + IntToStr(iExercicio);
                end;
        end;
     end
     else
        sSQL := sSQL +  '  WHERE PERIODO   <= -1 AND ' +
                        '        EXERCICIO <= -1 ';



   sSQL := sSQL +
           '    GROUP BY ' +
           '      SO.IDCONTAORCAMEN,SO.IDPLANOORCAMEN, SO.VLRAJUSTE, SO.IDDESPESAORC, '+ //Brunno Mattos KTN 1159883  SOL 153584 inclui VLRAJUSTE
           '  SO.PERIODO ) S, ' + //Marcio Sanches Spinosa SOL 212127 Kintana 2036755
           '   CENTRESPON CR, ' +

           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           '  (Select' +
           '    D.IDDESPESAORC,' +
           '    D.IDFORNECEDOR,' +
           '    P.NOME AS FORNECEDOR,' +
           '    D.FLGSTATUSDESPESA,' +
           '    DECODE(D.FLGSTATUSDESPESA, ''I'', ''INATIVO'', ''ATIVO'') AS STATUS,' +
           '    D.NATUREZA,' +
           '    D.SUBDESPESA,' +
           '    D.ACAO,' +
           '    D.DESCRICAO,' +
           '    D.IDPESSOA' +
           '   From DESPESAORCAMENTARIA D, PESSOA P' +
           '   Where D.IDFORNECEDOR = P.IDPESSOA(+)) Desp ' +
           //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

           'WHERE ' +
           '   (PER.EXERCICIO) =  ' + IntToStr(iExercicio) + ' AND' +//Brunno Mattos - KTN 1121572 - SOL 151865 Inicio
           '   (C.IDPLANOPREV     = PPV.IDPLANOPREV(+))    AND ' +
           '   (C.IDPATRO         = P.IDPESSOA(+))         AND ';

           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           //Centro de Custo
           TParamEntradaEspecial.GetParam(sSQL, 'C.CODCENTROCUSTO', AParamEntradaEspecial, tpeeCentroCusto);
           //Plano Orçamentário
           //TParamEntradaEspecial.GetParam(sSQL, 'C.IDPLANOORCAMEN', AParamEntradaEspecial, tpeePlanoOrc   );  // Edilaine - SOL 190488 / KTN 1909246
           //Sub-Despesa
           TParamEntradaEspecial.GetParam(sSQL, 'S.IDDESPESAORC',   AParamEntradaEspecial, tpeeSubDespesa);
           //FIM    - VANDER SOL 172384/9361 KINTANA 1653184


   sSQL := sSQL +
           '   (S.IDCONTAORCAMEN(+)  = C.IDCONTAORCAMEN)      AND ' +
           '   (S.IDPLANOORCAMEN(+)  = C.IDPLANOORCAMEN)      AND ' +
           '    (S.PERIODO = PER.PERIODO ) AND ' + //Marcio Sanches Spinosa SOL 212127 Kintana 2036755

           '   (G.IDGRUPOORCAMEN  = C.IDGRUPOORCAMEN)      AND ' +

           '   (C.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+))  AND ' +
           '   (C.IDEMPRESA = CC.IDEMPRESA(+) ) AND ' +

           '   (C.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND ' +


           // Edilaine Ferraresi - SOL 163910 / KTN 1403215
           '   (C.UNIDNEGOC = ATV.UNIDNEGOC(+)) AND ' +
           '   (C.IDPROGRAMAORCAMEN = PG.IDPROGRAMAORCAMEN(+)) AND ' +
           '   (C.IDTIPO_DEPESAORCAMEN = TD.IDTIPO_DEPESAORCAMEN(+)) AND ';
           // Edilaine Ferraresi - SOL 163910 / KTN 1403215


         // Alterado por FHBS - SOL: 151079 KTN: 1103455
         //'   (C.CODCENTRORESPON IN ' +
         //'                  (SELECT CODCENTRORESPON ' +
         //'                   FROM PESSOAXCRESP ' +
         //'                   WHERE IDPESSOAACESSO = ' + IntToStr(iIdPessoaAcesso) + ')) AND ' +

   if iPeriodo <> 0 then  //Brunno Mattos - KTN 1121572 - SOL 151865
              sSql := sSql + '(PER.PERIODO = ' + IntToStr(iPeriodo) + ') AND';

   if Trim(sCodCentroRespon) <> '' then // Alterado por FHBS - SOL: 151079 KTN: 1103455
     sSQL := sSQL + RetornaFiltroUsuario(iIdPessoaAcesso,sCodCentroRespon);

   sSQL := sSQL +
           '   (C.IDGRUPOORCAMEN  = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
           '   (C.IDPLANOORCAMEN  = ' + IntToStr(iIdPlanoOrc) + ') ';

   if iUnidNegoc <> 0 then //Renan Cristiano SOL 152790 KINTANA 1145737 Inicio
      sSQL := sSQL + ' AND (C.UNIDNEGOC = ' + IntToStr(iUnidNegoc) + ') ';

   if iIdPlanoPrev <> -1 then
      sSQL := sSQL + ' AND (C.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ') ';

   if iIdPatro <> -1 then
      sSQL := sSQL + ' AND (C.IDPATRO = ' + IntToStr(iIdPatro) + ') ';

   // Edilaine Ferraresi - SOL 163910 / KTN 1403215
   if iIdPrograma > 0 then
      sSQL := sSQL + ' AND (C.IDPROGRAMAORCAMEN = ' + IntToStr(iIdPrograma)  + ') ';

   if iIdTipoDespesa > 0 then
      sSQL := sSQL + ' AND (C.IDTIPO_DEPESAORCAMEN = ' + IntToStr(iIdTipoDespesa)  + ') ';
   // Edilaine Ferraresi - SOL 163910 / KTN 1403215 - fim


   // Alterado por FHBS - SOL: 151660 KTN: 1115295
   if bSomenteCCAtivo then
      sSQL := sSQL + ' and nvl(CC.ATIVO,''S'') = ''S'' ' + CR_LF +
                     ' and nvl(CC.STATUSGRUPOCDC,''A'') = ''A'' ' + CR_LF;
   // Fim - Alterado por FHBS - SOL: 151660 KTN: 1115295

   //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
   sSQL := sSQL + ' AND S.IDDESPESAORC = Desp.IDDESPESAORC(+)';

   With AParamEntradaEspecial.ReservaOrcamentaria do
     if Trim(ObsReserva) <> '' Then
        sSQL := sSQL +
             ' And Exists ( Select R.IDPLANOORCAMEN, R.IDCONTAORCAMEN'
                         + '  From RESERVAORCAMEN R'
                         + ' Where R.IDPLANOORCAMEN = C.IDPLANOORCAMEN'
                         + '   And R.IDCONTAORCAMEN = C.IDCONTAORCAMEN'
                         + '   and upper(R.ObsReserva) like ' + QuotedStr('%' + AnsiUpperCase(Trim(ObsReserva)) + '%')
                         + ')';
   ///

   //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

   {ao alterar o ORDER BY verificar a linha referente ao LANC_DIF, se não será afetada}
   //sSQL := sSQL + 'ORDER BY PERIODO, CENTROCUSTO, PLANO, PATRO ';
   //sSQL := sSQL + ' order by PER.PERIODO, CENTROCUSTO, PPV.NOME, P.NOME, C.IDCONTAORCAMEN  ';   // Edilaine - SOL 190488 / KTN 1909246


   // Edilaine - SOL 190488 / KTN 1909246
   sCodGrupoOrc := RetornaCodGrupoOrcamento( IntToStr( iIdGrupoOrc ) );

   sSQL := 'SELECT ' +
               iif( copy(sCodGrupoOrc,1,1) = '4',
                   '       decode(lag(YY.CODEXTERNO) over(order by YY.PERIODO, YY.CODEXTERNO, YY.PLANO, YY.PATRO, YY.IDCONTAORCAMEN), YY.CODEXTERNO, ''N'', ''S'') as LANC_DIF, ',
                   '       decode(lag(YY.PERIODO) over(order by YY.PERIODO), YY.PERIODO, ''N'', ''S'') as LANC_DIF, '
                  ) +
           '       YY.*  '+
           '  FROM (  ' +  sSQL +

           ') YY '+
           ' order by YY.PERIODO, YY.CENTROCUSTO, YY.PLANO, YY.PATRO, YY.IDCONTAORCAMEN';
   // Edilaine - SOL 190488 / KTN 1909246 - fim

   Result := GetDataPacket(sSQL);


end;




function TCtrlTransacoesPorGrupo.ListaSuplementacoes(iIdPlanoOrc,
                                                     iPeriodo,
                                                     iExercicio,
                                                     iIdGrupoOrc,
                                                     iIdEmpresa,
                                                     iIdOperacao: integer;
                                                     dDataReferencia: TDateTime): OleVariant;
var
  sSQL: string;
begin
   sSQL := 'SELECT ' +
           ' ''S'' AS VALIDAR, ' +
           '  A.IDALTERORCAMENTO, ' +
           '  A.IDPESSOA, ' +
           '  A.NUMALTERACAO, ' +
            //Brunno Mattos SOL 152922/4001  KTN 1161267 inclui VLRSOLICITADO para exclusão do ajuste
           '  A.VLRSOLICITADO, ' +
           '  S.VLRAJUSTE, ' +

           '  A.IDOPERACAO, ' +
           // Edilaine - SOL 190488 / KTN 1909246 - comentado por nao gerar compromisso na suplem/deducao
           //Brunno Mattos SOL 153584/4161  KTN 1170663 inicio
           {
           '  CXA.IDOPERACAOCOMPROMISSO, ' +
           '  CXA.IDOPERACAOAJUSTE, ' +
           '  R.FLGRESERVA, ' +
           '  R.PERIODO, ' +
           '  R.EXERCICIO, ' +
           '  R.IDCONTAORCAMEN, ' +
           '  NVL(R.VLRRESERVA, 0) AS VALOR, ' +
           '  R.NUMRESERVA, ' +
           '  C.IDCONTAORCAMEN, ' +
           '  R.IDRESERVAORCAMEN, ' +
           //Brunno Mattos SOL 153584/4161  KTN 1170663 Fim
           } // Edilaine - SOL 190488 / KTN 1909246 - fim comentario

           '  C.IDCONTAORCAMEN, ' +
           '  A.IDPLANOORCAMEN, ' +
           '  A.PERIODOORIGEM, ' +
           '  A.EXERCICIOORIGEM, ' +
           '  A.DATAREFERENCIA, ' +
           '  A.IDGRUPOORCORIGEM, ' +
           '  A.IDCONTAORIGEM, ' +
           '  G.CODGRUPOORC, ' +
           '  G.NOMEGRUPOORCAMEN, ' +
           '  C.NOMECONTAORCAMEN, ' +
           '  A.OBSALTERORCAMEN, ' +
           '  A.FLGTIPOALTER, ' +
           '  TRIM(CC.CODEXTERNO)      ||'' - ''|| CC.NOME AS CENTROCUSTO, ' +
           '  TRIM(CR.CODCENTRORESPON) ||'' - ''|| CR.NOME AS CENTRORESPON, ' +
           '  PPV.NOME AS PLANO, ' +
           '  P.NOME AS PATRO, ' +

           // Edilaine Ferraresi - SOL 163910 / KTN 1403215
           '  C.UNIDNEGOC, ' +
           '  ATV.NOME AS ATIVIDADEPROJ, ' +
           '  C.IDPROGRAMAORCAMEN, '  +
           '  PG.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' +
           '  C.IDTIPO_DEPESAORCAMEN, ' +
           '  TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA, ' +
           // Edilaine Ferraresi - SOL 163910 / KTN 1403215 - fim

           //Renan Cristiano SOL 152790 KINTANA 1145737 Inicio
           //Brunno Mattos KTN 1159883  SOL 153584 substitui A.VLRSOLICITADO por S.VLRAJUSTE
           //'  DECODE(A.FLGTIPOALTER,''S'',S.VLRAJUSTE,''R'',A.VLRSOLICITADO * -1) AS VALOR, ' +      // Edilaine - SOL 190488 / KTN 1909246  - comentado
           '  DECODE(A.FLGTIPOALTER,''S'', A.VLRSOLICITADO,''R'', A.VLRSOLICITADO * -1) AS VALOR, ' +  // Edilaine - SOL 190488 / KTN 1909246  - considera vlrsolicitado
           '  S.SALDO, ' +
           '   0 AS IDCRITERIORATORC,'+
           ' ''0'' AS NOMECRITERIO, '+
           //Renan Cristiano SOL 152790 KINTANA 1145737 Fim

           // Edilaine - SOL 190488 / KTN 1909246
           '  A.IDDESPESAORCORIGEM, ' +
           '  A.IDDESPESAORCDESTINO, ' +
           '  ''N'' AS SELECIONADO, ' +
           '  Desp.Fornecedor,'       +
           '  Desp.SUBDESPESA as SUBDESP, ' +
           '  trim(NVL(DESP.FORNECEDOR,'''')) || decode(DESP.FORNECEDOR, null, '''', ''/'') || trim(DESP.SUBDESPESA) AS SUBDESPESA ' +
           // Edilaine - SOL 190488 / KTN 1909246

            'FROM ' +
           '   (SELECT IDCONTAORCAMEN, IDPLANOORCAMEN, NVL(SUM(VLRAJUSTE),0) VLRAJUSTE,' +   // Edilaine - SOL 190488 / KTN 1909246
           //Brunno Mattos KTN 1159883  SOL 153584 inclui - NVL(VLRAJUSTE,0)
           //'           NVL(SUM(NVL(VLRORCADO,0)),0) - NVL(SUM(NVL(VLRCOMPROMETIDO,0) + NVL(VLRRESERVADO,0) - NVL(VLRAJUSTE,0)),0) AS SALDO, ' +  // Edilaine - SOL 190488 / KTN 1909246 - comentado
           // Edilaine - SOL 190488 / KTN 1909246 - o VLRORCADO não será alterado pelas transf e suplementacoes,
           // o valor será composto pelos campos de ajuste nas consultas que retornem o saldo das contas
           '           NVL(SUM(NVL(VLRORCADO,0)),0) - NVL(SUM(NVL(VLRCOMPROMETIDO,0) + NVL(VLRRESERVADO,0)),0) + NVL(SUM(VLRAJUSTE),0) + NVL(SUM(VLRTRANSF), 0) AS SALDO, ' +
           '           IDDESPESAORC  ' +   // Edilaine - SOL 190488 / KTN 1909246
           '    FROM SALDOORCADO ';

           _Cds.Data := GetDataPacket('SELECT FLGTIPOSALDO FROM PARAMORCAMENTO WHERE IDPESSOA = ' + IntToStr(iIdEmpresa));
           //if iPeriodo <> 0 then //Brunno Mattos - KTN 1121572 - SOL 151865
            //begin
             if not _Cds.IsEmpty then
             begin
                case _Cds.FieldByName('FLGTIPOSALDO').AsString[1] of
                   // Por período
                   'P': begin
                           if iPeriodo <> 0 then //Brunno Mattos - KTN 1121572 - SOL 151865
                             sSQL := sSQL +  '  WHERE PERIODO   = ' + IntToStr(iPeriodo) + ' AND ' +
                                             '        EXERCICIO = ' + IntToStr(iExercicio)
                           else
                             //Brunno Mattos - KTN 1121572 - SOL 151865 caso for periodo anual
                             //sSQL := sSQL +  '  WHERE PERIODO   = 1 AND  ' +                // Edilaine - SOL 190488 / KTN 1909246 - comentado
                             sSQL := sSQL +  '  WHERE PERIODO between 1 AND 12  AND  ' +      // Edilaine - SOL 190488 / KTN 1909246
                                             '        EXERCICIO = ' + IntToStr(iExercicio);
                        end;

                   // Acumulado do exercício
                   'E': begin
                           sSQL := sSQL +  '  WHERE EXERCICIO = ' + IntToStr(iExercicio);
                        end;

                   // Acumulado até o período
                   'A': begin
                           if iPeriodo <> 0 then
                             sSQL := sSQL +  '  WHERE PERIODO   <= ' + IntToStr(iPeriodo) + ' AND ' +
                                             '        EXERCICIO <= ' + IntToStr(iExercicio)
                           else
                             //Brunno Mattos - KTN 1121572 - SOL 151865 caso for periodo anual
                             sSQL := sSQL +  '  WHERE PERIODO   <= 12 AND ' +
                                             '        EXERCICIO <= ' + IntToStr(iExercicio);
                        end;
                end;
             end
             else
                sSQL := sSQL +  '  WHERE PERIODO   <= -1 AND ' +
                                '        EXERCICIO <= -1 ';

           sSQL := sSQL +
           '   GROUP BY ' +
           //'      IDCONTAORCAMEN,IDPLANOORCAMEN, VLRAJUSTE ) S, ' + //Brunno Mattos KTN 1159883  SOL 153584 inclui VLRAJUSTE
           '      IDCONTAORCAMEN,IDPLANOORCAMEN, IDDESPESAORC ) S, ' + // Edilaine - SOL 190488 / KTN 1909246

           '   ALTERORCAMENTO A, ' +
           '   CONTASORCAMEN C, ' +
           '   GRUPOORCAMEN G, ' +
           '   PESSOA P, ' +
           '   PLANPREVCONTABIL PPV, ' +
           '   CENTCUST CC, ' +
           '   CENTRESPON CR, ' +

           // Edilaine - SOL 190488 / KTN 1909246
           '  (Select' +
           '    D.IDDESPESAORC,' +
           '    D.IDFORNECEDOR,' +
           '    P.NOME AS FORNECEDOR,' +
           '    D.FLGSTATUSDESPESA,' +
           '    DECODE(D.FLGSTATUSDESPESA, ''I'', ''INATIVO'', ''ATIVO'') AS STATUS,' +
           '    D.NATUREZA,' +
           '    D.SUBDESPESA,' +
           '    D.ACAO,' +
           '    D.DESCRICAO,' +
           '    D.IDPESSOA' +
           '   From DESPESAORCAMENTARIA D, PESSOA P' +
           '   Where D.IDFORNECEDOR = P.IDPESSOA(+)) Desp, ' +
           // Edilaine - SOL 190488 / KTN 1909246 - FIM


           // Edilaine Ferraresi - SOL 163910 / KTN 1403215
           '    UNIDNEGOCIO ATV, ' +
           '    PROGRAMAORCAMEN PG, ' +
           '    TIPO_DESPESAORCAMEN TD ' +
           // Edilaine Ferraresi - SOL 163910 / KTN 1403215 - fim

           // Edilaine - SOL 190488 / KTN 1909246 - comentado por nao gerar compromisso na suplem/deducao
           //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui tabela COMPROMISSOXAJUSTE e RESERVAORCAMEN
           {'   COMPROMISSOXAJUSTE CXA, ' +
           '   RESERVAORCAMEN R ' +
           } // Edilaine - SOL 190488 / KTN 1909246 - fim comentario

           'WHERE ' +
           '  (C.IDPLANOPREV     = PPV.IDPLANOPREV(+)) AND ' +
           '  (C.IDPATRO         = P.IDPESSOA(+)) AND';

           if iPeriodo <> 0 then
             sSql:= sSql +
           '  (A.PERIODOORIGEM   = ' + IntToStr(iPeriodo) + ') AND' +
           '  (A.DATAREFERENCIA  = TO_DATE(' + QuotedStr(DateToStr(dDataReferencia)) + ',''DD/MM/YYYY'')) AND ';


           sSql:= sSql +
           '  (A.IDOPERACAO = ' + IntToStr(iIdOperacao) + ') AND ' +
           '  (A.EXERCICIOORIGEM = ' + IntToStr(iExercicio) + ') AND ' +
           '  (A.IDPESSOA        = ' + IntToStr(iIdEmpresa) + ') AND ' +
           '  (A.IDPLANOORCAMEN  = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
           '  (G.IDGRUPOORCAMEN  = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
           '  (A.IDCONTAORIGEM   = C.IDCONTAORCAMEN) AND ' +

           '  (A.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
           '  (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
           '  (S.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
           '  (S.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +

           '  (S.IDDESPESAORC = Desp.IDDESPESAORC(+)) AND ' +   // Edilaine - SOL 190488 / KTN 1909246
           '  (S.IDDESPESAORC = A.IDDESPESAORCORIGEM) AND ' +   // Edilaine - SOL 190488 / KTN 1909246

           // Edilaine Ferraresi - SOL 163910 / KTN 1403215
           '  (C.UNIDNEGOC = ATV.UNIDNEGOC(+)) AND ' +
           '  (C.IDPROGRAMAORCAMEN = PG.IDPROGRAMAORCAMEN(+)) AND ' +
           '  (C.IDTIPO_DEPESAORCAMEN = TD.IDTIPO_DEPESAORCAMEN(+)) AND ' +
           // Edilaine Ferraresi - SOL 163910 / KTN 1403215

           '  (A.FLGTIPOALTER IN (''S'',''R'')) AND ' +
           '  (C.CODCENTROCUSTO   = CC.CODCENTROCUSTO(+))  AND ' +
           '  (C.CODCENTRORESPON  = CR.CODCENTRORESPON(+)) ';
           // Edilaine - SOL 190488 / KTN 1909246 - comentado por nao gerar compromisso na suplem/deducao
           //Brunno Mattos SOL 153584/4161  KTN 1170663 inicio
           {'  (A.IDOPERACAO     =  CXA.IDOPERACAOAJUSTE(+)) AND' +
           '  (R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
           '  (R.DATAREFERENCIA = A.DATAREFERENCIA) AND ' +
           '  (R.PERIODO        = A.PERIODOORIGEM) AND ' +
           '  (R.EXERCICIO      = A.EXERCICIOORIGEM) AND ' +
           '  (R.IDOPERACAO     = CXA.IDOPERACAOCOMPROMISSO)';
           //Brunno Mattos SOL 153584/4161  KTN 1170663 fim
           } // Edilaine - SOL 190488 / KTN 1909246 - fim comentario

  Result := GetDataPacket(sSQL);


end;







function TCtrlTransacoesPorGrupo.ListaResCompPorGrupo(iIdPlanoOrc,
  iIdPessoa, iPeriodoIni, iPeriodoFim, iExercicio, iIdGrupoOrc,iIdOperacao: integer;
  sFlgResComp, sFlgStatus: string): OleVariant;
var
   sSQL: string;

begin
   sSQL := 'SELECT ' +
           '   TRIM(G.CODGRUPOORC) || '' - '' || G.NOMEGRUPOORCAMEN AS NOMEGRUPOORCAMEN, ' +
           '   G.CODGRUPOORC, ' +
           '   DECODE(CC.CODEXTERNO,'''',''Não Informado'',TRIM(CC.CODEXTERNO) || '' - '' ||  CC.NOME) AS CENTROCUSTO, ' +
           '   DECODE(CR.CODEXTERNO,'''','''',TRIM(CR.CODEXTERNO) || '' - '' ||CR.NOME) AS CENTRORESPON, ' +
           '   R.PERIODO AS PEROORDENACAO, ' +
           '   NVL(R.IDOPERACAO,0) AS IDOPERACAO, ' +
           '   DECODE(R.PERIODO,1,''Janeiro'', ' +
           '                    2,''Fevereiro'', ' +
           '                    3,''Março'', ' +
           '                    4,''Abril'', ' +
           '                    5,''Maio'', ' +
           '                    6,''Junho'', ' +
           '                    7,''Julho'', ' +
           '                    8,''Agosto'', ' +
           '                    9,''Setembro'', ' +
           '                    10,''Outubro'', ' +
           '                    11,''Novembro'', ' +
           '                    12,''Dezembro'') AS PERIODO, ' +
           '   R.EXERCICIO, ' +
           '   DECODE(R.FLGRESERVA,''A'',''Aguardando'', ' +
           '                       ''E'',''Efetivada'', ' +
           '                       ''C'',''Cancelada'', ' +
           '                       ''U'',''Em Uso'') AS FGLRESERVA, ' +
           '   PPV.NOME AS PLANO, ' +
           '   P.NOME AS PATRO, ' +
           '   R.DATAREFERENCIA, ' +
           '   R.NUMRESERVA, ';

           if sFlgResComp = 'R' then
              sSQL := sSQL + '   NVL(R.VLRRESERVA,0) AS VLRRESERVA '
           else
              sSQL := sSQL + '   NVL(R.VLRCOMPROMISSO,0) AS VLRRESERVA ';

              
           sSQL := sSQL +

           'FROM ' +
           '   GRUPOORCAMEN G, ' +
           '   CONTASORCAMEN C, ' +
           '   CENTCUST CC, ' +
           '   CENTRESPON CR, ' +
           '   RESERVAORCAMEN R, ' +
           '   PESSOA P, ' +
           '   PLANPREVCONTABIL PPV ' +

           'WHERE ' +
           '   (PPV.IDPLANOPREV(+)   = C.IDPLANOPREV) AND ' +
           '   (P.IDPESSOA(+)        = C.IDPATRO) AND ' +
           '   (G.IDGRUPOORCAMEN  = C.IDGRUPOORCAMEN) AND ' +
           '   (C.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND ' +
           '   (C.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND ' +
           '   (C.IDPLANOORCAMEN  = R.IDPLANOORCAMEN) AND ' +
           '   (C.IDCONTAORCAMEN  = R.IDCONTAORCAMEN) AND ' +
           '   (R.IDPESSOA        = ' + IntToStr(iIdPessoa)    + ') AND ' +
           '   (R.PERIODO BETWEEN '   + IntToStr(iPeriodoIni)  + '  AND ' + IntToStr(iPeriodoFim) + ') AND ' +
           '   (R.EXERCICIO       = ' + IntToStr(iExercicio)   + ') AND ' +
           '   (R.FLGRESCOMP      = ' + QuotedStr(sFlgResComp) + ') ';

           if iIdGrupoOrc <> 0 then
           sSQL := sSQL + ' AND  (G.IDGRUPOORCAMEN  = ' + IntToStr(iIdGrupoOrc)  + ') ';

           if iIdOperacao <> 0 then
           sSQL := sSQL + ' AND  (R.IDOPERACAO  = ' + IntToStr(iIdOperacao) + ') ';

           if Trim(sFlgStatus) <> '' then
              sSQL := sSQL + ' AND (R.FLGRESERVA IN (' + sFlgStatus + ') ) ';


           sSQL := sSQL +
           ' ORDER BY ' +
           '  R.IDOPERACAO, G.CODGRUPOORC, CENTROCUSTO,PEROORDENACAO,R.EXERCICIO,CENTRORESPON ' ;


   Result := GetDataPacket(sSQL);
end;




function TCtrlTransacoesPorGrupo.ListaImagem(
  iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('select ' +
                           '   i.imagem ' +
                           'from ' +
                           '   imagens i, ' +
                           '   pessoa p ' +
                           'where ' +
                           '  (p.idimagem = i.idimagem) and ' +
                           '  (p.idpessoa = ' + IntToStr(iIdPessoa)+ ') ');
end;




function TCtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado(sFlgResComp,
                                                                 sResCompStatus: string;
                                                                 iIdPlanoOrc,
                                                                 iIdPessoa,
                                                                 iIdGrupoOrc,
                                                                 iPeriodo,
                                                                 iIdOperacao,
                                                                 iExercicio: integer;
                                                                 dDataReferencia: TDateTime): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' +
           '   ''S'' AS VALIDAR, ' +
           '    SALDODISP.SALDO, ' +
           '    PPV.NOME AS PLANO, ' +
           '    P.NOME AS PATRO, ' +
           '    C.IDCONTAORCAMEN, ' +
           '    C.IDPLANOORCAMEN, ' +
           '    R.IDPESSOA, ' +
            //Brunno Mattos SOL 153803 KINTANA 1163260 inclui IDCRITERIORATORC, NOMECRITERIO e VALORRATEIO
           '   0 AS IDCRITERIORATORC,'+
           '   ''0'' AS NOMECRITERIO,'+
           '   0 AS VALORRATEIO,'+

           '    R.IDOPERACAO, ' +
           //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui IDOPERACAOAJUSTE
           '    CXA.IDOPERACAOAJUSTE, ' +

           '    G.NOMEGRUPOORCAMEN, ' +
           '    G.CODGRUPOORC, ' +
           '    TRIM(CR.CODEXTERNO) || '' - '' || CR.NOME AS CENTRORESPON, ' +
           '    TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUSTO, ' +
           '    CC.CODCENTROCUSTO, ' +
           '    R.IDRESERVAORCAMEN, ' +
           '    R.NUMRESERVA, ' +
           '    R.FLGRESERVA, ' +
           '    DECODE(R.FLGRESERVA,''A'',''Aguardando'', ' +
           '                        ''E'',''Efetivada'', ' +
           '                        ''C'',''Cancelada'', ' +
           '                        ''U'',''Em Uso'') AS DESCRESERVA, ' +
           '    R.PERIODO, ' +
           '    R.EXERCICIO, ' +
           '    R.DATAREFERENCIA, ' +
           '    R.OBSRESERVA, ' +

           '    DECODE(U.NOME,'''',R.TRGUSERINCLUSAO,U.NOME) AS USUARIO, ' +


           //Ricardo SOL 163903 KTN 1403195
           '  C.IDPROGRAMAORCAMEN, '  +
           '  POR.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' +
           '  C.IDTIPO_DEPESAORCAMEN, ' +
           '  DES.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA , ' +
           '  C.UNIDNEGOC, ' +
           '  UN.NOME AS ATIVIDADEPROJ, ';
           //Ricardo SOL 163903 KTN 1403195 - fim

           //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
           sSQL := sSQL +  ' DOC.NODOCUMENTO, '
                        +  ' Case'
                        +  '  When Doc.Compldocumento is Null '
                        +  '  Then To_CHAR(Doc.Nodocumento) '
                        +  '  Else Doc.Nodocumento||''/''||Doc.Compldocumento '
                        +  ' end NUMDOC, ';
           //Fim    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

          {A rotina abaixo foi modificada pois conforme
           má estruturação de negócios, tanto o valor da
           reserva como o valor do compromissos tem que
           estar gravado na coluna VLRRESERVA. Isto acontece
           em 99% no sistema e se for gravar o valor do
           compromisso na coluna VLRCOMPROMISSO, pode
           acarretar em uma série de divergências de saldo}
           //sSQL := sSQL +  '    NVL(R.VLRRESERVA,0) AS VALOR ';
           //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
           sSQL := sSQL +  '    NVL(R.VLRCOMPROMISSO,0) AS VALOR ';


           sSQL := sSQL +
           ' FROM ' +
           //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui tabela COMPROMISSOXAJUSTE
           '    COMPROMISSOXAJUSTE CXA, ' +
           '    RESERVAORCAMEN R, ' +
           '    CENTRESPON CR, ' +
           '    CENTCUST CC, ' +
           '    CONTASORCAMEN C, ' +
           '    PESSOA P, ' +
           '    PESSOA U, ' +
           //Ricardo SOL 163903 KTN 1403195
           ' CM.PROGRAMAORCAMEN POR, ' +
           ' CM.TIPO_DESPESAORCAMEN DES,  ' +
           ' UNIDNEGOCIO UN ,' +
           //Ricardo SOL 163903 KTN 1403195 - fim
           '    PLANPREVCONTABIL PPV, ' +
           '    GRUPOORCAMEN G, ' +

           '   (SELECT S.IDCONTAORCAMEN, S.IDPLANOORCAMEN, ' +
           '             NVL(ROUND(SUM(NVL(S.VLRORCADO,0)) - ' +
                                   //Brunno Mattos KTN 1159883  SOL 153584
                                   //Subtrai VLRAJUSTE do VLRCOMPROMETIDO, pois no momento em que é feito o ajuste, o valor do mesmo ja é comprometido
           '                       SUM(NVL(S.VLRCOMPROMETIDO,0) + NVL(S.VLRRESERVADO,0) - NVL(S.VLRAJUSTE,0)),2),0) AS SALDO ' +
           '     FROM SALDOORCADO S ';

           _Cds.Data := GetDataPacket('SELECT FLGTIPOSALDO FROM PARAMORCAMENTO WHERE IDPESSOA = ' + IntToStr(iIdPessoa));

           //if iPeriodo <> 0 then
            //begin
             if not _Cds.IsEmpty then
             begin
                case _Cds.FieldByName('FLGTIPOSALDO').AsString[1] of
                   // Por período
                   'P': begin
                           if iPeriodo <> 0 then //Brunno Mattos - KTN 1121572 - SOL 151865
                             sSQL := sSQL +  '  WHERE PERIODO   = ' + IntToStr(iPeriodo) + ' AND ' +
                                             '        EXERCICIO = ' + IntToStr(iExercicio)
                           else
                             //Brunno Mattos - KTN 1121572 - SOL 151865 caso for periodo anual
                             sSQL := sSQL +  '  WHERE PERIODO   = 1 AND ' +
                                             '        EXERCICIO = ' + IntToStr(iExercicio);
                        end;

                   // Acumulado do exercício
                   'E': begin
                           sSQL := sSQL +  '  WHERE EXERCICIO = ' + IntToStr(iExercicio);
                        end;

                   // Acumulado até o período
                   'A': begin
                           if iPeriodo <> 0 then
                             sSQL := sSQL +  '  WHERE PERIODO   <= ' + IntToStr(iPeriodo) + ' AND ' +
                                             '        EXERCICIO <= ' + IntToStr(iExercicio)
                           else
                             //Brunno Mattos - KTN 1121572 - SOL 151865 caso for periodo anual
                             sSQL := sSQL +  '  WHERE PERIODO   <= 12 AND ' +
                                             '        EXERCICIO <= ' + IntToStr(iExercicio);
                        end;
                end;
             end
             else
                sSQL := sSQL +  '  WHERE PERIODO   <= 0 AND ' +
                                '        EXERCICIO <= 0 ';
            //end
           //Brunno Mattos - KTN 1121572 - SOL 151865 Inicio
           //else
           //    sSQL := sSQL + ' WHERE PERIODO >= 1 AND PERIODO <= 12';
           //Brunno Mattos - KTN 1121572 - SOL 151865 Fim




           sSQL := sSQL +
           '  GROUP BY S.IDCONTAORCAMEN,S.IDPLANOORCAMEN) SALDODISP, ' +

           //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
               '  RATEIODOCUM RAT, DOCUMENTO DOC ' +
           //Fim    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662


           ' WHERE ' +
           //Brunno Mattos SOL 153584/4161  KTN 1170663
           '    (R.IDOPERACAO   = CXA.IDOPERACAOCOMPROMISSO(+)) AND ' +
           '    (U.IDPESSOA(+) = TO_NUMBER(SUBSTR(R.TRGUSERINCLUSAO,3,30))) AND ' +

           '    (PPV.IDPLANOPREV(+) = C.IDPLANOPREV) AND ' +
           '    (P.IDPESSOA(+)     = C.IDPATRO) AND ' +
           '    (C.IDCONTAORCAMEN  = R.IDCONTAORCAMEN) AND ' +
           '    (C.IDGRUPOORCAMEN  = G.IDGRUPOORCAMEN) AND ' +

           '    (SALDODISP.IDCONTAORCAMEN(+) = C.IDCONTAORCAMEN) AND ' +
           '    (SALDODISP.IDPLANOORCAMEN(+) = C.IDPLANOORCAMEN) AND ' +

           '    (C.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND ' +
           '    (C.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND ';


           //Ricardo SOL 163903 KTN 1403195
           sSQL := sSQL + ' (C.UNIDNEGOC = UN.UNIDNEGOC(+)) AND ';
           sSQL := sSQL + ' (C.IDPROGRAMAORCAMEN = POR.IDPROGRAMAORCAMEN(+)) AND ';
           sSQL := sSQL + ' (C.IDTIPO_DEPESAORCAMEN = DES.IDTIPO_DEPESAORCAMEN(+)) AND ';

           sSQL := sSQL +
           '    (R.FLGRESCOMP      = ' + QuotedStr(sFlgResComp) + ') AND ' +
           '    (R.IDPLANOORCAMEN  = ' + IntToStr(iIdPlanoOrc)  + ') AND ' +
           '    (R.IDPESSOA        = ' + IntToStr(iIdPessoa)    + ') AND ';

           if iPeriodo <> 0 then //Brunno Mattos - KTN 1121572 - SOL 151865
           begin
              sSql := sSql +
             '    (R.PERIODO         = ' + IntToStr(iPeriodo)     + ') AND '+
             '    (R.DATAREFERENCIA  = TO_DATE ('+ QuotedStr(DateToStr(dDataReferencia)) +',''dd/mm/yyyy'')) AND';
               if Trim(sResCompStatus) <> '' then
                  sSQL := sSQL + ' (R.FLGRESERVA = ' + QuotedStr(sResCompStatus) + ') AND ';
           end;

           if iIdOperacao <> 0 then
              sSQL := sSQL + '    (R.IDOPERACAO = ' + IntToStr(iIdOperacao) + ') AND';

           sSql := sSql +
           '    (R.EXERCICIO       = ' + IntToStr(iExercicio)   + ') AND ' +
           '    (G.IDGRUPOORCAMEN  = ' + IntToStr(iIdGrupoOrc)  + ')';

           //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
           sSql := sSql
                 + ' AND R.Idreservaorcamen  = RAT.Idreservaorcamen(+) '
                 + ' AND DOC.coddocumento(+) = RAT.CODDOCUMENTO ';
           //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662


           sSQL := sSQL +
           ' ORDER BY ' +
           '    idoperacao, CENTROCUSTO, CENTRORESPON, R.PERIODO, R.EXERCICIO ';

  Result := GetDataPacket(sSQL);

end;




function TCtrlTransacoesPorGrupo.ListaAlterOrcamenPorGrupo(sFlgTipoALter: string;
                                                           iIdEmpresa,
                                                           iGOrigem,
                                                           iGDestino,
                                                           iPerIni,
                                                           iPerFim,
                                                           iExercicio,iIdOperacao: integer): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' +
           '   CCORIGEM.NOME, ' +
           '   GORIGEM.IDGRUPOORCAMEN, ' +
           '   TRIM(GORIGEM.CODGRUPOORC) || '' - '' || GORIGEM.NOMEGRUPOORCAMEN AS GRUPOORIGEM, ' +
           '   TRIM(CRORIGEM.CODEXTERNO) || '' - '' || CRORIGEM.NOME AS CENTRESPORIGEM, ' +
           '   TRIM(CCORIGEM.CODEXTERNO) || '' - '' || CCORIGEM.NOME AS CENTCUSTORIGEM, ' +
           '   PPVO.NOME AS PLANOORIGEM, ' +
           '   PO.NOME AS PATROORIGEM, ' +
           '   A.IDOPERACAO, ' +
           '   A.PERIODOORIGEM, ' +
           '   A.PERIODOORIGEM || '' / '' || A.EXERCICIOORIGEM AS PEREXERCORIGEM, ' +
           '   DECODE(A.PERIODOORIGEM,1, ''Janeiro'', ' +
           '                          2, ''Fevereiro'', ' +
           '                          3, ''Março'', ' +
           '                          4, ''Abril'', ' +
           '                          5, ''Maio'', ' +
           '                          6, ''Junho'', ' +
           '                          7, ''Julho'', ' +
           '                          8, ''Agosto'', ' +
           '                          9, ''Setembro'', ' +
           '                          10,''Outubro'', ' +
           '                          11,''Novembro'', ' +
           '                          12,''Dezembro'') AS PERIODOORIGEM, ' +
           '   A.EXERCICIOORIGEM, ' +
           '   A.IDCONTADESTINO, ' +
           '   TRIM(GDESTINO.CODGRUPOORC) || '' - '' || GDESTINO.NOMEGRUPOORCAMEN AS GRUPODESTINO, ' +
           '   A.IDGRUPOORCDESTINO, ' +
           '   TRIM(CRDESTINO.CODEXTERNO) || '' - '' || CRDESTINO.NOME AS CENTRESPDESTINO, ' +
           '   TRIM(CCDESTINO.CODEXTERNO) || '' - '' || CCDESTINO.NOME AS CENTCUSTDESTINO, ' +
           '   PPVD.NOME AS PLANODESTINO, ' +
           '   PD.NOME AS PATRODESTINO, ' +
           '   A.PERIODODESTINO || '' / '' || A.EXERCICIODESTINO AS PEREXERCDESTINO, ' +          
           '   DECODE(A.PERIODODESTINO,1, ''Janeiro'', ' +
           '                           2, ''Fevereiro'', ' +
           '                           3, ''Março'', ' +
           '                           4, ''Abril'', ' +
           '                           5, ''Maio'', ' +
           '                           6, ''Junho'', ' +
           '                           7, ''Julho'', ' +
           '                           8, ''Agosto'', ' +
           '                           9, ''Setembro'', ' +
           '                           10,''Outubro'', ' +
           '                           11,''Novembro'', ' +
           '                           12,''Dezembro'') AS PERIODODESTINO, ' +
           '  A.EXERCICIODESTINO, ' +
           '  A.DATAREFERENCIA, ' +
           '  A.NUMALTERACAO, ' +
           '  NVL(A.VLRSOLICITADO,0) AS VLRSOLICITADO ' +
           'FROM ' +
           '   ALTERORCAMENTO A, ' +
           '   CONTASORCAMEN CORIGEM, ' +
           '   GRUPOORCAMEN GORIGEM, ' +
           '   CENTCUST CCORIGEM, ' +
           '   CENTRESPON CRORIGEM, ' +
           '   PLANPREVCONTABIL PPVO, ' +
           '   PLANPREVCONTABIL PPVD, ' +
           '   PESSOA PO, ' +
           '   PESSOA PD, ' +

           '   (SELECT IDCONTAORCAMEN, IDPLANOORCAMEN, CODCENTROCUSTO, CODCENTRORESPON, IDGRUPOORCAMEN, IDPATRO, IDPLANOPREV ' +
           '    FROM CONTASORCAMEN) CDESTINO, ' +

           '   (SELECT IDGRUPOORCAMEN, NOMEGRUPOORCAMEN, CODGRUPOORC ' +
           '    FROM GRUPOORCAMEN) GDESTINO, ' +

           '   (SELECT CODCENTROCUSTO, CODEXTERNO, NOME ' +
           '    FROM CENTCUST) CCDESTINO, ' +

           '   (SELECT CODCENTRORESPON, CODEXTERNO, NOME ' +
           '    FROM CENTRESPON) CRDESTINO ' +
           
           'WHERE ' +
           '   (CORIGEM.IDPATRO          = PO.IDPESSOA(+)) AND ' +
           '   (CORIGEM.IDPLANOPREV      = PPVO.IDPLANOPREV(+)) AND ' +
           '   (CDESTINO.IDPATRO         = PD.IDPESSOA(+)) AND ' +
           '   (CDESTINO.IDPLANOPREV     = PPVD.IDPLANOPREV(+)) AND ' +
           '   (A.IDPLANOORCAMEN         = CORIGEM.IDPLANOORCAMEN) AND ' +
           '   (A.IDCONTAORIGEM          = CORIGEM.IDCONTAORCAMEN) AND ' +
           '   (CORIGEM.IDGRUPOORCAMEN   = GORIGEM.IDGRUPOORCAMEN) AND ' +
           '   (CORIGEM.CODCENTROCUSTO   = CCORIGEM.CODCENTROCUSTO(+)) AND ' +
           '   (CORIGEM.CODCENTRORESPON  = CRORIGEM.CODCENTRORESPON(+)) AND ' +
           '   (A.IDCONTADESTINO         = CDESTINO.IDCONTAORCAMEN) AND ' +
           '   (A.IDPLANOORCAMEN         = CDESTINO.IDPLANOORCAMEN) AND ' +
           '   (CDESTINO.IDGRUPOORCAMEN  = GDESTINO.IDGRUPOORCAMEN) AND ' +
           '   (CDESTINO.CODCENTRORESPON = CRDESTINO.CODCENTRORESPON(+)) AND ' +
           '   (CDESTINO.CODCENTROCUSTO  = CCDESTINO.CODCENTROCUSTO(+)) AND ' +
           '   (A.IDPESSOA               = ' + IntToStr(iIdEmpresa) + ') AND ' +
           '   (A.FLGTIPOALTER           = ' + QuotedStr(sFlgTipoALter) + ') AND ' +
           '   (A.PERIODOORIGEM BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') ';

           if iGOrigem <> -1 then
              sSQL := sSQL + ' AND (GORIGEM.IDGRUPOORCAMEN = ' + IntToStr(iGOrigem) + ') ';

           if iGDestino <> -1 then
              sSQL := sSQL + ' AND (GDESTINO.IDGRUPOORCAMEN = ' + IntToStr(iGDestino) + ') ';

           if iIdOperacao <> 0 then
              sSQL := sSQL + ' AND (A.IDOPERACAO = ' + IntToStr(iIdOperacao) + ') ';

           sSQL := sSQL + 'ORDER BY ' +
                          '  CCORIGEM.NOME, A.PERIODOORIGEM, A.EXERCICIOORIGEM, CCDESTINO.NOME, A.PERIODODESTINO, A.EXERCICIODESTINO ';

   Result := GetDataPacket(sSQL);
end;




function TCtrlTransacoesPorGrupo.ExluirReservasCompromissoPorGrupo(ovDadosConta: OleVariant;
                                                                   sFlgResComp: string;
                                                                   iIdPessoa,iPlanoOrc: integer;
                                                                   bCompromissoComReserva: boolean = false): Boolean;
var
   CdsAux : TClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExluirReservasPorGrupo(ovDadosConta,iIdPessoa,iPlanoOrc);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         CdsAux      := TClientDataSet.Create(nil);
         CdsAux.Data := ovDadosConta;


         // Deleta todos as reservas/compromissos do grupo
         CdsAux.First;
         while not CdsAux.Eof do
         begin
            if not (CdsAux.FieldByName('FLGRESERVA').AsString[1] in ['A','C'])  then
               raise Exception.Create('Não é possível excluir uma Reserva/Compromisso orçamentário que já está em uso!');
            CdsAux.Delete;
         end;

         // Filtras TODOS os registros deletados e atualiza o saldo das contas orçamentárias
         CdsAux.StatusFilter := [usDeleted];
         CdsAux.First;
         while not CdsAux.Eof do
         begin
             CtrlReservaOrcamen.AtualizaSaldo(iIdPessoa,
                                              iPlanoOrc,
                                              CdsAux.FieldByName('PERIODO').AsInteger,
                                              CdsAux.FieldByName('EXERCICIO').AsInteger,
                                              CdsAux.FieldByName('IDCONTAORCAMEN').AsString,
                                              sFlgResComp,
                                              CdsAux.FieldByName('DATAREFERENCIA').AsDateTime,
                                              True,
                                              False,
                                              (CdsAux.FieldByName('VALOR').AsFloat * -1));

             if bCompromissoComReserva then
             begin
                // Seleciona as reservas relacionadas com o compromisso
                CdsResxComp.Data := ListaResxCompEfetuado(iIdPessoa,CdsAux.FieldByName('NUMRESERVA').AsInteger);

                while not CdsResxComp.Eof do
                begin
                   // Atualiza a reserva para o status de "Aguardando"
                   if not ExecSQL('UPDATE RESERVAORCAMEN  ' +
                                  'SET FLGRESERVA   = ''A'' ' +
                                  'WHERE NUMRESERVA = ' + CdsResxComp.FieldByName('IDRESERVA').AsString) then
                     raise Exception.Create(MessageInfo);

                   CdsResxComp.Delete;
                end;
                // Deleta os relacionamentos
                if not ApplyCds(CdsResxComp, DbResxComp, [], []) then
                   raise Exception.Create(DbResxComp.MessageInfo);
             end;

             CdsAux.Next;
         end;
         CdsAux.StatusFilter := [];

         // Exclui TODAS as reservas/compromissos efetuadas do grupo
         Result := ApplyCds(CdsAux,DbReservaorcamen,[],[]);

         Commit;

         FreeAndNil(CdsAux);

      except
         on E: Exception do
         begin
            Rollback;
            Result      := false;
            MessageInfo := E.Message;
            FreeAndNil(CdsAux);
         end;
      end;
   end;
end;


function TCtrlTransacoesPorGrupo.CalcularRateio(cCds: TClientDataSet;
                                                iIdCriterioRateio: integer;
                                                iIdPessoa: integer;
                                                rValor: Double;
                                                sNomeCriterio: string;
                                                iIdPlano: integer;
                                                iIdPatro: integer;
                                                sAtivProj: string;
                                                sCRespon : string;
                                                //Ricardo SOL 159248 KTN 1337823
                                                sPrograma   : string;
                                                sTIpoDespesa: string;
                                                //Ricardo SOL 159248 KTN 1337823 - fim
                                                bNovoCalcCriterioRateio: Boolean;
                                                pPeriodo: integer;
                                                pExercicio: integer;
                                                bTranfMonta : Boolean  // Edilaine - SOL 193146 / KTN 1940385
                                                ): boolean;

     function RetornaQtdMesesPeriodo : byte;
     var
        x : integer;
        xFiltro : string;
        bFiltrado : boolean;
     begin
       Result := 0;

       // guarda o filtro atual
       bFiltrado := cCds.Filtered;
       xFiltro   := cCds.filter;

       // verifica no. de meses válidos, qual o maior e qual o menor
       for x:= 1 to 12 do
       begin
         cCds.Filtered := false;
         cCds.Filter   := xFiltro + ' and PERIODO = '+intToStr(x);
         cCds.Filtered := true;

         if not cCds.IsEmpty then
            inc(Result);
       end;

       // volta o filtro original
       cCds.Filtered := false;
       cCds.Filter   := xFiltro;
       cCds.Filtered := bFiltrado;
     end;
var
   rTotal         : Double;
   bComLike       : Boolean;
   bComData       : Boolean;
   bComAnoMes     : Boolean;
   sAnoMes        : String;
   sSQL           : TStringList;
   dDataRef       : TDateTime;
   iExercicio     : Integer;
   iPeriodo       : Integer;
   iMes           : integer;
   sAntigo, sNovo : String;

   rValorRateio   : Double;

   rValorRateio1: Double;
   rValorRateio2: Double;
   rValorRateio3: Double;

   rValorRateioM: Double;        // Edilaine - SOL 189698 / KTN 1794093
   iMesIni      : integer;       // Edilaine - SOL 189698 / KTN 1794093
   iMesFim      : integer;       // Edilaine - SOL 189698 / KTN 1794093
   sFiltro      : string;        // Edilaine - SOL 189698 / KTN 1794093
   iNumMeses    : integer;       // Edilaine - SOL 189698 / KTN 1794093

   iQtdeRateio1: Integer;
   iQtdeRateio2: Integer;


   CdsCriterioRateio,
   CdsValorCentCust,
   CdsDataView: TClientDataSet;

   //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
   Procedure AddFilterSelecionado;
   Begin
     if cCds.FindField('SELECIONADO') <> nil then
        cCds.Filter   := cCds.Filter + ' and SELECIONADO <> ''S'' '
   End;
   //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

begin
  inherited;
  try
     try
        sSQL              := TStringList.Create;
        CdsCriterioRateio := TClientDataSet.Create(nil);
        CdsValorCentCust  := TClientDataSet.Create(nil);
        CdsDataView       := TClientDataSet.Create(nil);

        // Zera o Cds que vai conter os valores
        // rateados para cada período do ano
        CdsRateioAnual.EmptyDataSet;

        // Edilaine - SOL 189698 / KTN 1794093
        // quando periodo for anual (pPeriodo = 0) os rateios devem ser feitos por mês
        if pPeriodo > 0 then
        begin
          // Qtde de registro para o rateio da diferença (LANC_DIF = 'S')
          iQtdeRateio2 := 0;

          if cCds.FindField('LANC_DIF') <> nil then
          begin
            cCds.Filtered := False;

            // Edilaine - SOL 193146 / KTN 1940385
            if (bTranfMonta)then
               cCds.Filter   := ' LANC_DIF = ''S'' '
            else
               cCds.Filter   := ' VALIDAR = ''S'' and LANC_DIF = ''S'' ';
            // Edilaine - SOL 193146 / KTN 1940385 - fim

            if cCds.FindField('SELECIONADO') <> nil then    // Edilaine - SOL 189698 / KTN 1794093
               cCds.Filter   := cCds.Filter + ' and SELECIONADO <> ''S'' ';  // Edilaine - SOL 172383-7763 / KTN 1557030
            cCds.Filtered := True;

            iQtdeRateio2 := cCds.RecordCount;
          end;
        end;
        // Edilaine - SOL 189698 / KTN 1794093 - fim

        // Filtra somente as linhas válidas para rateio
        cCds.Filtered := False;

        // Edilaine - SOL 193146 / KTN 1940385
        if not (bTranfMonta)then
           cCds.Filter   := 'VALIDAR = ''S'''
        else
           cCds.Filter   := '';
        // Edilaine - SOL 193146 / KTN 1940385

        if cCds.FindField('SELECIONADO') <> nil then    // Edilaine - SOL 189698 / KTN 1794093
           cCds.Filter   := cCds.Filter + iif(cCds.filter <> '', ' and ', '') + ' SELECIONADO <> ''S'' ';  // Edilaine - SOL 172383-7763 / KTN 1557030
        cCds.Filtered := True;

        iQtdeRateio1 := cCds.RecordCount;

        // Validações
        if (cCds.RecordCount = 0) then
        begin
           MessageInfo := 'Não há registros para calcular o rateio';
           Result      := False;
           Exit;
        end;

        //Ricardo de Freitas SOL: 122291 KINTANA: 597829
        {if rValor = 0 then
           raise Exception.Create('Obrigatório informar um valor para rateio!');}

        // Extrai os dados do critério
        CdsCriterioRateio.Data := ListaReservaRatCriter(iIdPessoa, iIdCriterioRateio);

        //======================================================================
        //  Se valor for rateado normalmente entre as contas
        //======================================================================
        if iIdCriterioRateio = -1 then
        begin
           try
              cCds.DisableControls;

              // Edilaine - SOL 189698 / KTN 1794093
              if pPeriodo = 0 then
              begin
                // verifica quantos meses existe no periodo
                iNumMeses := RetornaQtdMesesPeriodo();
                iMesIni   := 1;
                iMesFim   := 12;

                // calcula o rateio do mes e a sobra
                rTotal        := RoundCM( rValor / iNumMeses, 2) ;
                rValorRateioM := rValor - (rTotal * iNumMeses);
                rValorRateioM := RoundCM( rValorRateioM , 2 );
              end
              else
              begin
                iMesIni := pPeriodo;
                iMesFim := pPeriodo;
                rValorRateio := rValor;
              end;

              sFiltro := cCds.Filter;
              // Edilaine - SOL 189698 / KTN 1794093 - fim

              for iMes := iMesIni to iMesFim do     // Edilaine - SOL 189698 / KTN 1794093
              begin
                // filtra e verifica se tem o periodo
                cCds.Filtered := False;
                cCds.Filter   := sFiltro + ' and PERIODO = '+intToStr(iMes);
                cCds.Filtered := True;

                // vai para próximo mês se estiver vazio
                if cCds.IsEmpty then
                   continue;

                if pPeriodo = 0 then
                begin
                  // qtd de contas no 1o rateio
                  iQtdeRateio1 := cCds.RecordCount;

                  // atribui novamente o valor original do rateio
                  rValorRateio := rTotal;

                  // rateio da sobra de centavos anual entre os meses
                  if abs(rValorRateioM) > 0 then
                  begin
                    if rValorRateioM > 0 then
                       rValorRateio := rValorRateio + 0.01
                    else
                       rValorRateio := rValorRateio + (-0.01);

                    rValorRateioM := rValorRateioM * 100;
                    if Trunc(abs(rValorRateioM)) = 1 then
                      rValorRateioM := 0
                    else
                      rValorRateioM := iif(rValorRateioM >0, rValorRateioM - 1, rValorRateioM + 1);

                    rValorRateioM := rValorRateioM / 100;
                  end;

                  // Qtde de registro para o rateio da diferença (LANC_DIF = 'S')
                  iQtdeRateio2 := 0;

                  if cCds.FindField('LANC_DIF') <> nil then
                  begin
                    cCds.Filtered := False;
                    cCds.Filter   := sFiltro + ' and PERIODO = '+intToStr(iMes) + ' and LANC_DIF = ''S'' ';
                    cCds.Filtered := True;

                    iQtdeRateio2 := cCds.RecordCount;

                    // volta filtro original + periodo
                    cCds.Filtered := False;
                    cCds.Filter   := sFiltro + ' and PERIODO = '+intToStr(iMes);
                    cCds.Filtered := True;
                  end;
                end;

                // Edilaine - SOL 189698 / KTN 1794093 - fim

                //--------------------------------------------
                // Efetuando o rateio geral...
                //--------------------------------------------
                //rValorRateio1 := Trunc( rValor / iQtdeRateio1 * 100 ) / 100;      // Edilaine - SOL 189698 / KTN 1794093 - comentado
                rValorRateio1 := Trunc( rValorRateio / iQtdeRateio1 * 100 ) / 100;  // Edilaine - SOL 189698 / KTN 1794093
                rValorRateio2 := 0;
                rValorRateio3 := 0;

                if iQtdeRateio2 > 0 then
                begin
                  //rValorRateio2 := rValor - (rValorRateio1 * iQtdeRateio1);     // Edilaine - SOL 189698 / KTN 1794093 - comentado
                  rValorRateio2 := rValorRateio - (rValorRateio1 * iQtdeRateio1); // Edilaine - SOL 189698 / KTN 1794093
                  rValorRateio2 := RoundCM( rValorRateio2, 2) ;
                  rValorRateio2 := rValorRateio2 / iQtdeRateio2;
                  rValorRateio2 := Trunc( rValorRateio2 * 100 ) / 100;
                end
                else if abs(rValorRateio - rValorRateio1) > 0 then   // Edilaine - SOL 197740 / KTN 1894943
                    rValorRateio1 := rValorRateio;                   // Edilaine - SOL 197740 / KTN 1894943


                //rValorRateio3 := rValor - ( (rValorRateio2 * iQtdeRateio2) + (rValorRateio1 * iQtdeRateio1) );      // Edilaine - SOL 189698 / KTN 1794093 - comentado
                rValorRateio3 := rValorRateio - ( (rValorRateio2 * iQtdeRateio2) + (rValorRateio1 * iQtdeRateio1) );  // Edilaine - SOL 189698 / KTN 1794093
                rValorRateio3 := RoundCM( rValorRateio3 , 2 );

                cCds.First;
                while not cCds.Eof do
                begin
                   cCds.Edit;

                   if cCds.FindField('LANC_DIF') <> nil then
                   begin
                     if cCds.FieldByName('LANC_DIF').AsString = 'N' then
                       cCds.FieldByName('VALOR').AsFloat := rValorRateio1     
                     else
                     begin
                        //Brunno Mattos inicio substituindo linha
                        //Realiza o rateio igualmente para os periodos até que não haja mais centavos para ser rateado
                       if abs(rValorRateio3) > 0 then       // Edilaine - SOL 187127 / KTN 1761657
                       begin
                         //cCds.FieldByName('VALOR').AsFloat := rValorRateio1 + rValorRateio2 + rValorRateio3;

                         if rValorRateio3 > 0 then  // Edilaine - SOL 187127 / KTN 1761657
                            cCds.FieldByName('VALOR').AsFloat := rValorRateio1 + rValorRateio2 + 0.01   
                         else
                            cCds.FieldByName('VALOR').AsFloat := rValorRateio1 + rValorRateio2 + (-0.01);    // Edilaine - SOL 187127 / KTN 1761657

                         rValorRateio3 := rValorRateio3 * 100;
                         //Por conta do arrendondamento foi necessário o truncamento para realizar a comparação
                         if Trunc(abs(rValorRateio3)) = 1 then
                           rValorRateio3 := 0
                         else
                           rValorRateio3 := iif(rValorRateio3 >0, rValorRateio3 - 1, rValorRateio3 + 1);   // Edilaine - SOL 187127 / KTN 1761657

                         rValorRateio3 := rValorRateio3 / 100;
                       end
                       else
                         cCds.FieldByName('VALOR').AsFloat := rValorRateio1 + rValorRateio2;  
                     end;
                   end
                   else
                   begin
                     cCds.FieldByName('VALOR').AsFloat := rValorRateio1 + rValorRateio3; 
                     rValorRateio3 := 0;
                   end;

                   if cCds.FindField('IDCRITERIORATORC') <> nil then
                   begin
                      cCds.FieldByName('IDCRITERIORATORC').AsInteger := -1;
                      if cCds.FindField('NOMECRITERIO') <> nil then //Ricardo SOL: 166064 Nº KINTANA: 1444100
                         cCds.FieldByName('NOMECRITERIO').AsString      := '';
                   end;
                   cCds.Post;

                   cCds.Next;
                end;
              end;   // Edilaine - SOL 189698 / KTN 1794093 - FOR

              cCds.Filtered := False;  // Edilaine - SOL 189698 / KTN 1794093
              cCds.Filter   := '';     // Edilaine - SOL 189698 / KTN 1794093

              cCds.First;
           finally
              cCds.EnableControls;
           end;
        end
        else
        begin
           case CdsCriterioRateio.FieldByName('TIPORATEIO').AsString[1] of
              //======================================================================
              //  Se o tipo de critério para rateio for pré-determinado...
              //======================================================================
              {'M' : begin
                       cCds.DisableControls;
                       cCds.First;
                       cCds.Filter   := 'VALIDAR = ''S''';
                       cCds.Filtered := True;
                       rTotal        := 0;
                       iExercicio    := cCds.FieldByName('EXERCICIO').AsInteger;
                       iPeriodo      := cCds.FieldByName('PERIODO').AsInteger;

                       //  Verifica se exite C.Custo no critério de rateio que não esteja
                       //no grupo de contas, o que causa uma inconsistência no rateio
                       //iTotRatNaoRelac := TestaCCustoRatxGrupoOrc(iIdCriterioRateio,cCds.FieldByName('IDGRUPOORCAMEN').AsInteger);
                       //pendência 27798 - 06/05/2008 - para mostrar quais centros de custo não estão relacionados
                       //if iTotRatNaoRelac > 0 then
                       //   raise Exception.Create('Existe(m) ' + IntToStr(iTotRatNaoRelac) + ' Centro de Custo(s) que estão relacionados ' + #13 +
                       //                          'no critério de rateio informado, porém não está neste grupo de contas, o que causa inconsistências nos valores rateados');
                       _cds.data := TestaCCustoRatxGrupoOrc(iIdCriterioRateio,cCds.FieldByName('IDGRUPOORCAMEN').AsInteger);
                       if not _cds.isEmpty then
                         messageInfo := 'O(s) Centro(s) de Custo(s) relacionados no critério de rateio informado, não está neste grupo de contas, o que causa inconsistências nos valores rateados: '+#13;
                       _cds.first;
                       while not _cds.eof do
                       begin
                         messageInfo := messageInfo + 'Código: '+ _cds.FieldByName('CODEXTERNO').asString + ' - Nome: '+ _cds.FieldByName('NOME').asString +
                                                      ' - Status: '+ _cds.FieldByName('ATIVO').asString +' - Plano de Centro de Custo: '+_cds.FieldByName('DESCPLANCENTCUST').asString + #13;
                         _cds.next;
                       end;
                       if not _cds.isEmpty then
                         raise Exception.Create(messageInfo);

                       // Verifica se entre as contas selecionadas, existe algum C.Custo que não possa
                       //ser rateado
                       if not TestaContasSelRaxtGrupoOrc(cCds.Data,iIdCriterioRateio) then
                          raise Exception.Create(MessageInfo);


                       // Verifica se a vigência do critério de rateio comporta o exercício/período
                       if not TestaVigenciaRateio(iPeriodo,iPeriodo,iExercicio,iExercicio,
                                                  iIdCriterioRateio,iIdPessoa,iIdPessoa) then
                          raise Exception.Create('A vigência deste critério de rateio não comporta este período/exercício');


                       if not(bNovoCalcCriterioRateio) then // Alterado por FHBS - SOL: 150140 KTN: 1087554
                       begin
                         while not(cCds.EOF) do
                         begin
                            rTotal := 0;
                            // Se o período for anual, retornar o valor acumulado do exercício,
                            //ou seja, varre mês a mês e pega a cotação do rateio no mês, acumulando-o
                            if iPeriodo = 0 then
                            begin
                                for iMes := 1 to 12 do
                                begin
                                  rValorRateio := RateiaValor(iIdPessoa,iExercicio,iMes,
                                                              iExercicio,iMes,iIdCriterioRateio,
                                                              cCds.FieldByName('IDGRUPOORCAMEN').AsInteger,
                                                              cCds.FieldByName('CODCENTROCUSTO').AsString,
                                                              RoundCM((rValor / 12),2),iIdPlano,iIdPatro,sAtivProj,sCRespon);

                                  CdsRateioAnual.Append;
                                  CdsRateioAnual.FieldByName('IDCONTAORCAMEN').AsString  := cCds.FieldByName('IDCONTAORCAMEN').AsString;
                                  CdsRateioAnual.FieldByName('IDPLANOORCAMEN').AsInteger := cCds.FieldByName('IDPLANOORCAMEN').AsInteger;
                                  CdsRateioAnual.FieldByName('PERIODO').AsInteger        := iMes;
                                  CdsRateioAnual.FieldByName('EXERCICIO').AsInteger      := iExercicio;
                                  CdsRateioAnual.FieldByName('VALOR').AsFloat            := rValorRateio;
                                  CdsRateioAnual.Post;

                                  // Acumula o valor
                                  rTotal := rTotal + rValorRateio;
                                end;
                            end
                            else
                               rTotal := RateiaValor(iIdPessoa,iExercicio,iPeriodo,
                                                     iExercicio,iPeriodo,iIdCriterioRateio,
                                                     cCds.FieldByName('IDGRUPOORCAMEN').AsInteger,
                                                     cCds.FieldByName('CODCENTROCUSTO').AsString,
                                                     rValor,iIdPlano,iIdPatro,sAtivProj,sCRespon);

                            cCds.Edit;
                            cCds.FieldByName('VALOR').AsFloat := rTotal;
                            if cCds.FindField('IDCRITERIORATORC') <> nil then
                            begin
                               cCds.FieldByName('IDCRITERIORATORC').AsInteger := iIdCriterioRateio;
                               cCds.FieldByName('NOMECRITERIO').AsString      := sNomeCriterio;
                               cCds.FieldByName('VALORRATEIO').AsFloat        := rValor;
                            end;

                            cCds.Post;

                            cCds.Next;
                         end;

                       end
                       else
                       // Alterado por FHBS - SOL: 150140 KTN: 1087554 - Novo Critério de Rateio
                       begin
                         RateiaValorCriterioCDS(cCds, iIdCriterioRateio, sNomeCriterio, pExercicio, pPeriodo, rValor);
                       end;

                       cCds.First;
                       cCds.EnableControls;
                    end;}

              //======================================================================
              //  Se o tipo de critério para rateio for pré-determinado...
              //======================================================================
              'M' : begin
                       cCds.DisableControls;
                       cCds.First;


                       // Edilaine - SOL 193146 / KTN 1940385
                       if not (bTranfMonta) then
                          cCds.Filter   := 'VALIDAR = ''S'''
                       else
                          cCds.Filter   := '';
                       // Edilaine - SOL 193146 / KTN 1940385 - fim

                       if cCds.FindField('SELECIONADO') <> nil then    // Edilaine - SOL 189698 / KTN 1794093
                          cCds.Filter   := cCds.Filter + iif(cCds.filter <> '', ' and ', '') + ' SELECIONADO <> ''S'' ';  // Edilaine - SOL 172383-7763 / KTN 1557030
                       cCds.Filtered := True;
                       rTotal        := 0;
                       iExercicio    := cCds.FieldByName('EXERCICIO').AsInteger;
                       iPeriodo      := cCds.FieldByName('PERIODO').AsInteger;

                       //Verifica se a vigência do critério de rateio comporta o exercício/período
                       if not TestaVigenciaRateio(iPeriodo,iPeriodo,iExercicio,iExercicio,
                                                  iIdCriterioRateio,iIdPessoa,iIdPessoa) then
                          raise Exception.Create('A vigência deste critério de rateio não comporta este período/exercício');

                       //Ricardo SOL 159248 KTN 1337823
              
                       //Verifica se exite Programa no critério de rateio que não esteja
                       //no grupo de contas, o que causa uma inconsistência no rateio
                       _cds.data := TestaProgramaRatxGrupoOrc(iIdCriterioRateio,cCds.FieldByName('IDGRUPOORCAMEN').AsInteger);
                       if not _cds.isEmpty then
                         messageInfo := 'O(s) Programa(s) relacionados no critério de rateio informado, não está neste grupo de contas, o que causa inconsistências nos valores rateados: '+#13;
                       _cds.first;
                       while not _cds.eof do
                       begin
                         messageInfo := messageInfo + 'Código: '+ _cds.FieldByName('IDPROGRAMAORCAMEN').asString + ' - Programa: '+ _cds.FieldByName('PROGRAMA').asString + #13;
                         _cds.next;
                       end;
                       if not _cds.isEmpty then
                         raise Exception.Create(messageInfo);

                       _cds.EmptyDataSet;

                       //Verifica se exite Tipo de Despesa no critério de rateio que não esteja
                       //no grupo de contas, o que causa uma inconsistência no rateio
                       _cds.data := TestaProgramaRatxGrupoOrc(iIdCriterioRateio,cCds.FieldByName('IDGRUPOORCAMEN').AsInteger);
                       if not _cds.isEmpty then
                         messageInfo := 'O(s) Tipo de Despesa(s) relacionados no critério de rateio informado, não está neste grupo de contas, o que causa inconsistências nos valores rateados: '+#13;
                       _cds.first;
                       while not _cds.eof do
                       begin
                         messageInfo := messageInfo + 'Código: '+ _cds.FieldByName('IDTIPO_DEPESAORCAMEN').asString + ' - Tipo de Despesa: '+ _cds.FieldByName('TIPODESPESA').asString + #13;
                         _cds.next;
                       end;
                       if not _cds.isEmpty then
                         raise Exception.Create(messageInfo);

                       _cds.EmptyDataSet;

                       //Ricardo SOL 159248 KTN 1337823 - fim

                       //Verifica se exite C.Custo no critério de rateio que não esteja
                       //no grupo de contas, o que causa uma inconsistência no rateio
                       _cds.data := TestaCCustoRatxGrupoOrc(iIdCriterioRateio,cCds.FieldByName('IDGRUPOORCAMEN').AsInteger);
                       if not _cds.isEmpty then
                         messageInfo := 'O(s) Centro(s) de Custo(s) relacionados no critério de rateio informado, não está neste grupo de contas, o que causa inconsistências nos valores rateados: '+#13;
                       _cds.first;
                       while not _cds.eof do
                       begin
                         messageInfo := messageInfo + 'Código: '+ _cds.FieldByName('CODEXTERNO').asString + ' - Nome: '+ _cds.FieldByName('NOME').asString +
                                                      ' - Status: '+ _cds.FieldByName('ATIVO').asString +' - Plano de Centro de Custo: '+_cds.FieldByName('DESCPLANCENTCUST').asString + #13;
                         _cds.next;
                       end;
                       if not _cds.isEmpty then
                         raise Exception.Create(messageInfo);

                       //Verifica se entre as contas selecionadas, existe algum C.Custo que não possa
                       //ser rateado
                       if not TestaContasSelRaxtGrupoOrc(cCds.Data,iIdCriterioRateio) then
                          raise Exception.Create(MessageInfo);


                       if not(bNovoCalcCriterioRateio) then // Alterado por FHBS - SOL: 150140 KTN: 1087554
                       begin
                         while not(cCds.EOF) do
                         begin
                            rTotal := 0;
                            // Se o período for anual, retornar o valor acumulado do exercício,
                            //ou seja, varre mês a mês e pega a cotação do rateio no mês, acumulando-o
                            if iPeriodo = 0 then
                            begin
                                for iMes := 1 to 12 do
                                begin
                                  rValorRateio := RateiaValor(iIdPessoa,iExercicio,iMes,
                                                              iExercicio,iMes,iIdCriterioRateio,
                                                              cCds.FieldByName('IDGRUPOORCAMEN').AsInteger,
                                                              cCds.FieldByName('CODCENTROCUSTO').AsString,

                                                              //Ricardo SOL 159248 KTN 1337823
                                                              cCds.FieldByName('IDPROGRAMAORCAMEN').AsInteger,
                                                              cCds.FieldByName('IDTIPO_DEPESAORCAMEN').AsInteger,
                                                              //Ricardo SOL 159248 KTN 1337823 - fim


                                                              RoundCM((rValor / 12),2),iIdPlano,iIdPatro,sAtivProj,sCRespon);

                                  CdsRateioAnual.Append;
                                  CdsRateioAnual.FieldByName('IDCONTAORCAMEN').AsString  := cCds.FieldByName('IDCONTAORCAMEN').AsString;
                                  CdsRateioAnual.FieldByName('IDPLANOORCAMEN').AsInteger := cCds.FieldByName('IDPLANOORCAMEN').AsInteger;
                                  CdsRateioAnual.FieldByName('PERIODO').AsInteger        := iMes;
                                  CdsRateioAnual.FieldByName('EXERCICIO').AsInteger      := iExercicio;
                                  CdsRateioAnual.FieldByName('VALOR').AsFloat            := rValorRateio;
                                  CdsRateioAnual.Post;

                                  // Acumula o valor
                                  rTotal := rTotal + rValorRateio;
                                end;
                            end
                            else
                               rTotal := RateiaValor(iIdPessoa,iExercicio,iPeriodo,
                                                     iExercicio,iPeriodo,iIdCriterioRateio,
                                                     cCds.FieldByName('IDGRUPOORCAMEN').AsInteger,
                                                     cCds.FieldByName('CODCENTROCUSTO').AsString,
                                                     //Ricardo SOL 159248 KTN 1337823
                                                     cCds.FieldByName('IDPROGRAMAORCAMEN').AsInteger,
                                                     cCds.FieldByName('IDTIPO_DEPESAORCAMEN').AsInteger,
                                                     //Ricardo SOL 159248 KTN 1337823 - fim
                                                     rValor,iIdPlano,iIdPatro,sAtivProj,sCRespon);

                            cCds.Edit;
                            cCds.FieldByName('VALOR').AsFloat := rTotal;
                            if cCds.FindField('IDCRITERIORATORC') <> nil then
                            begin
                               cCds.FieldByName('IDCRITERIORATORC').AsInteger := iIdCriterioRateio;
                               cCds.FieldByName('NOMECRITERIO').AsString      := sNomeCriterio;
                               cCds.FieldByName('VALORRATEIO').AsFloat        := rValor;
                            end;

                            cCds.Post;

                            cCds.Next;
                         end;

                       end
                       else
                       // Alterado por FHBS - SOL: 150140 KTN: 1087554 - Novo Critério de Rateio
                       begin
                         RateiaValorCriterioCDS(cCds, iIdCriterioRateio, sNomeCriterio, pExercicio, pPeriodo, rValor);
                       end;

                       cCds.First;
                       cCds.EnableControls;
                    end;







              //======================================================================
              //  Se o tipo de critério para rateio for a partir de um resultado
              //gerado na base (SELECT)...
              //======================================================================
              'G' : begin
                       CdsDataView.Data := ListaReservaDataView(CdsCriterioRateio.FieldByName('IDDATAVIEW').AsInteger);

                       if not(CdsDataView.FieldByName('TEMPLATE').isNull) then
                       begin
                          sSQL.Add(CdsDataView.FieldByName('TEMPLATE').AsString);
                          dDataRef := cCds.FieldByName('DATAREFERENCIA').AsDateTime;

                          if not(CdsCriterioRateio.FieldByName('PERNUMERO').IsNull) then
                             dDataRef := CdsCriterioRateio.FieldByName('PERDATFIM').AsDatetime;

                          bComData := True;
                          if Pos(':DATA',sSQL.Text) = 0 then
                             bComData := False;

                          sAnoMes  := '';
                          bComLike := True;
                          if Pos('LIKE :CODCENTROCUSTO',sSQL.Text) = 0 then
                             bComLike := False;

                          if Pos(':ANOMES',sSQL.Text) = 0 then
                             bComAnoMes := False
                          else
                          begin
                             bComAnoMes := True;
                             sAnoMes    := FormatDateTime('yyyy', dDataRef) + FormatDateTime('mm', dDataRef);
                          end;

                          rTotal  :=0;
                          cCds.DisableControls;
                          cCds.First;

                          while not(cCds.EOF) do
                          begin
                             if bComLike then
                             begin
                                sAntigo   := 'LIKE :CODCENTROCUSTO';
                                sNovo     := 'LIKE ' + QuotedStr(TRIM(cCds.FieldByName('CODCENTROCUSTO').AsString) + '%');
                                sSQL.Text := StringReplace(sSQL.Text,sAntigo,sNovo,[rfReplaceAll]);
                             end
                             else
                             begin
                                sAntigo   := ':CODCENTROCUSTO';
                                sNovo     := QuotedStr(Espaco(cCds.FieldByName('CODCENTROCUSTO').AsString,10));
                                sSQL.Text := StringReplace(sSQL.Text,sAntigo,sNovo,[rfReplaceAll]);
                             end;


                             sAntigo   := ':IDEMPRESA';
                             sNovo     := IntToStr(iIdPessoa);
                             sSQL.Text := StringReplace(sSQL.Text,sAntigo,sNovo,[rfReplaceAll]);


                             if bComData then
                             begin
                                sAntigo   := ':DATA';
                                sNovo     := DateToStr(dDataRef);
                                sSQL.Text := StringReplace(sSQL.Text,sAntigo,sNovo,[rfReplaceAll]);
                             end;


                             if bComAnoMes then
                             begin
                                sAntigo   := ':ANOMES';
                                sNovo     :=  QuotedStr(sAnoMes);
                                sSQL.Text := StringReplace(sSQL.Text,sAntigo,sNovo,[rfReplaceAll]);
                             end;


                             _Cds.Data := GetDataPacket(sSQL);

                             cCds.Edit;
                             cCds.FieldByName('VALOR').AsFloat := _Cds.FieldByName('VALOR').AsFloat;
                             cCds.Post;

                             rTotal := rTotal + _Cds.FieldByName('VALOR').AsFloat;

                             cCds.Next;
                          end;

                          if rTotal <> 0 then
                          begin
                             cCds.First;

                             while not(cCds.EOF) do
                             begin
                                cCds.Edit;
                                cCds.FieldByName('VALOR').AsFloat := rValor * (cCds.FieldByName('VALOR').AsFloat/rTotal);
                                cCds.FieldByName('IDCRITERIORATORC').AsInteger := iIdCriterioRateio;
                                cCds.FieldByName('NOMECRITERIO').AsString      := sNomeCriterio;

                                cCds.Post;
                                cCds.Next;
                             end;
                          end;

                          cCds.First;
                          cCds.EnableControls;
                       end;
                    end;
           end;
        end;

        Result := True;
        cCds.Filtered := False;

     finally
        cCds.EnableControls;
        FreeAndNil(sSQL);
        FreeAndNil(CdsCriterioRateio);
        FreeAndNil(CdsValorCentCust);
        FreeAndNil(CdsDataView);
     end;

   Except
      on E:Exception do
      begin
         cCds.Filtered := False;
         Result        := False;
         MessageInfo   := E.Message;
      end;
   end;
end;


function TCtrlTransacoesPorGrupo.GetCCustoSubDespesa(iSubDespesa : integer): String;
var
  CdsLocal : TClientDataSet;
  sqltxt   : String;
begin
   CdsLocal := TClientDataSet.Create(Nil);

   sqlTxt := 'SELECT CODCENTROCUSTO '+
             '  FROM DESPESAORCXCCUSTO ' +
             ' WHERE IDDESPESAORC = '+IntToStr( iSubDespesa );

   try
      CdsLocal.Data := GetDataPacket( sqltxt );
      result := '';

      while not cdsLocal.eof do
      begin
        if result <> '' then
           result := Result + ', ';

        Result := Result + QuotedStr(CdsLocal.Fields[0].AsString);
        CdsLocal.next;
      end;
    Finally
     CdsLocal.Free;
    End;

end;


function TCtrlTransacoesPorGrupo.GetFornecedorSubDespesa(iSubDespesa : integer): String;
var
  CdsLocal : TClientDataSet;
  sqltxt   : String;
begin
   CdsLocal := TClientDataSet.Create(Nil);

   sqlTxt := 'SELECT P.NOME || DECODE(P.NOME, null, '''', ''/'') || D.SUBDESPESA '+
             '  FROM DESPESAORCAMENTARIA D, PESSOA P ' +
             ' WHERE IDDESPESAORC = '+IntToStr( iSubDespesa ) +
             '   AND D.IDFORNECEDOR = P.IDPESSOA';

   try
      CdsLocal.Data := GetDataPacket( sqltxt );
      Result := '';
      if not cdsLocal.isEmpty then
         Result := CdsLocal.Fields[0].AsString;
    Finally
     CdsLocal.Free;
    End;
end;


function TCtrlTransacoesPorGrupo.ValidaSubDespesa(iIdGrupoOrc : integer; rParams : tParametros) : boolean;    // Edilaine - SOL 190488 / KTN 1909246
   //Higor Nayde Ferreira SOL 192079 -  KINTANA 1822802 Inicio
   function MontaQueryEntradaDados : string;
   var
     _sqlTxt : string;
   begin
     _sqlTxt :=  'select '+
                 '       count(*), '+
                 '       NVL(S.IDDESPESAORC, -1) IDDESPESAORC '+
                 '  from (select distinct P.PERIODO, '+
                 '              DECODE(NVL(DC.IDDESPESAORC, -1), -1, '+IntToStr(rParams.iIdSubDespesa)+', DC.IDDESPESAORC) IDDESPESAORC, '+
                 '              P.EXERCICIO,       '+
                 '              C.IDCONTAORCAMEN,  '+
                 '              C.IDPLANOORCAMEN,  '+
                 '              C.IDPESSOA, '+
                 '              C.CODCENTROCUSTO '+
                 '         from CONTASORCAMEN C,  '+
                 '              GRUPOORCAMEN G,   '+
                 '              (SELECT D1.IDDESPESAORC, D1.IDGRUPOORCAMEN, DC1.CODCENTROCUSTO  '+
                 '                 FROM DESPESAORCAMENTARIA D1, DESPESAORCXCCUSTO DC1  '+
                 '                WHERE D1.IDDESPESAORC = DC1.IDDESPESAORC ';
                 if rParams.iPeriodo <> 0 then
                    _sqlTxt := _sqlTxt +
                      '          and D1.IDDESPESAORC = ' + IntToStr(rParams.iIdSubDespesa);

                 _sqlTxt := _sqlTxt +
                 '                  AND D1.IDGRUPOORCAMEN = '+IntToStr( iIdGrupoOrc ) +') DC, '+
                 '              PERIODOORCAMEN P '+
                 '        where G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN '+
                 '          and C.CODCENTROCUSTO = DC.CODCENTROCUSTO(+) '+
                 '          and C.IDPLANOORCAMEN = '+IntToStr( rParams.iIdPlanoOrc ) +
                 '          and C.IDGRUPOORCAMEN = '+IntToStr( iIdGrupoOrc ) +
                 '          and P.EXERCICIO =  ' + IntToStr( rParams.iExercicio ) +
                 '          and C.TIPOCALCORCADO = ''V'' '+
                 '          and C.FLGATIVA = ''A'' ';
                 if rParams.iPeriodo <> 0 then
                    _sqlTxt := _sqlTxt +
                      '          and P.PERIODO = ' + IntToStr(rParams.iPeriodo);

                 if rParams.iUnidNegoc <> 0 then
                   _sqlTxt := _sqlTxt +
                      '          and C.UNIDNEGOC  = ' + IntToStr(rParams.iUnidNegoc);

                 if rParams.iIdPlano <> - 1 then
                   _sqlTxt := _sqlTxt +
                      '          and C.IDPLANOPREV = ' + IntToStr(rParams.iIdPlano);

                 if rParams.iIdPatro <> - 1 then
                   _sqlTxt := _sqlTxt +
                      '          and C.IDPATRO = ' + IntToStr(rParams.iIdPatro);

                 if (rParams.iIdPrograma <> - 1) and (rParams.iIdPrograma > 0)  then
                   _sqlTxt := _sqlTxt +
                      '          and C.IDPROGRAMAORCAMEN = ' + IntToStr(rParams.iIdPrograma);

                 if (rParams.iIdTipoDespesa <> - 1) and (rParams.iIdTipoDespesa > 0)  then
                   _sqlTxt := _sqlTxt +
                      '          and C.IDTIPO_DEPESAORCAMEN = ' + IntToStr(rParams.iIdTipoDespesa);

                 if (rParams.sCodCCusto <> '') then
                   _sqlTxt := _sqlTxt +
                      '          and C.CODCENTROCUSTO = ' + Quotedstr(rParams.sCodCCusto);

                 if (rParams.iIdSubDespesa > 0) then
                   _sqlTxt := _sqlTxt +
                      '          and DC.IDDESPESAORC = ' + IntToStr(rParams.iIdSubDespesa);

                 _sqlTxt := _sqlTxt +
                      '       ) CG, '+
                      '       CENTCUST CC, '+
                      '       SALDOORCADO S  '+
                      ' where CG.IDCONTAORCAMEN = S.IDCONTAORCAMEN(+) '+
                      '   and CG.IDPLANOORCAMEN = S.IDPLANOORCAMEN(+) '+
                      '   and CG.IDDESPESAORC = S.IDDESPESAORC(+) '+
                      '   and CG.IDPESSOA = S.IDPESSOA(+) '+
                      '   and CG.EXERCICIO = S.EXERCICIO(+) '+
                      '   and CG.PERIODO = S.PERIODO(+) '+
                      '   and CG.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) '+
                      '   and nvl(S.IDDESPESAORC, -1) IN (-1, '+IntToStr(rParams.iIdSubDespesa)+') '+
                      '   and nvl(CC.ATIVO,''S'') = ''S'' '+
                      '   and nvl(CC.STATUSGRUPOCDC,''A'') = ''A'' ';
     Result := _sqlTxt;
   end;
   //Higor Nayde Ferreira SOL 192079 -  KINTANA 1822802  fim
var
  CdsLocal : TClientDataSet;
  iTotCtas : integer;
  sqltxt   : String;
begin
   MessageInfo := '';
   Result      := true;

   CdsLocal    := TClientDataSet.Create(Nil);
   
   try
      // pesquisa se existe Subdespesa cadastrada para o grupo
      if GrupoOrcamentarioxSubDespesa( iIdGrupoOrc ) then          // Edilaine - SOL 190488 / KTN 1909246
      begin
        if (rParams.iIdSubDespesa > 0) then
        begin
          // se existe, verificar se a despesa selecionada já foi utilizada
          sqlTxt := 'SELECT S.IDCONTAORCAMEN '+
                    '  FROM SALDOORCADO S, CONTASORCAMEN C ' +
                    ' WHERE S.IDCONTAORCAMEN = C.IDCONTAORCAMEN '+
                    '   AND C.FLGATIVA = ''A''  '+
                    '   AND C.TIPOCALCORCADO = ''V'' '+
                    '   AND C.IDGRUPOORCAMEN = '+IntToStr( iIdGrupoOrc ) +
                    '   AND S.IDPLANOORCAMEN = '+IntToStr( rParams.iIdPlanoOrc ) +
                    '   AND nvl(S.IDDESPESAORC, -1) = '+IntToStr( rParams.iIdSubDespesa ) +
                    '   AND S.EXERCICIO =  ' + IntToStr(rParams.iExercicio);
          if rParams.iPeriodo <> 0 then
             sqlTxt := sqlTxt +
                    '  AND S.PERIODO =  ' + IntToStr(rParams.iPeriodo);

          CdsLocal.Data := GetDataPacket( sqltxt );
          if not cdsLocal.IsEmpty then
          begin   //Higor Nayde Ferreira SOL 192079 -  KINTANA 1822802 Inicio

            // verifica se nas contas seleciondas tem o cod da despesa
            sqlTxt := MontaQueryEntradaDados();
            sqltxt := sqltxt + ' group by S.IDDESPESAORC';

            CdsLocal.Data := GetDataPacket( sqltxt );
            // procura se a despesa faz parte das contas selecionadas
            Result := CdsLocal.Locate('IDDESPESAORC', rParams.iIdSubDespesa, []);

            // Edilaine - SOL 197740 / KTN 1894943
            if not Result then
            begin
              // se a despesa não foi usada, verificar se existe SÓ o codigo -1
              CdsLocal.Filtered := false;
              CdsLocal.Filter   := 'IDDESPESAORC <> -1';
              CdsLocal.Filtered := true;

              Result := CdsLocal.isEmpty;
            end;
            // Edilaine - SOL 197740 / KTN 1894943 - fim

            //Result := false;
            //Higor Nayde Ferreira SOL 192079 -  KINTANA 1822802 fim
          end;
        end
        else
        begin
          // se não selecionou verifica se as contas possuem vínculo com centro de custo

          //Higor Nayde Ferreira SOL 192079 -  KINTANA 1822802 Inicio
          sqlTxt := MontaQueryEntradaDados();
          sqltxt := sqltxt +    '   AND Cc.CODCENTROCUSTO in '+
                                '       (Select dc.CodCentroCusto '+
                                '          from DESPESAORCXCCUSTO DC, DESPESAORCAMENTARIA D '+
                                '         Where DC.idDespesaOrc = D.idDespesaOrc '+
                                '           and D.IdGrupoOrcamen = '+IntToStr( iIdGrupoOrc )+' '+
                                '           and D.FLGSTATUSDESPESA = ''A'' )' +  // Edilaine - SOL 193936 / KTN 1852777
                                'group by S.IDDESPESAORC';
          //Higor Nayde Ferreira SOL 192079 -  KINTANA 1822802 fim

          //Higor Nayde Ferreira SOL 192079 -  KINTANA 1822802 - comentado
          {sqlTxt := 'select '+
                    '       distinct '+
                    '       decode(S.IDCONTAORCAMEN, null, ''S'', ''N'') as LANC_NEW, '+
                    '       CG.IDCONTAORCAMEN '+
                    '  from (select distinct P.PERIODO, '+
                    '              NVL(DC.IDDESPESAORC, -1) IDDESPESAORC, '+
                    '              P.EXERCICIO,       '+
                    '              C.IDCONTAORCAMEN,  '+
                    '              C.IDPLANOORCAMEN,  '+
                    '              C.IDPESSOA, '+
                    '              C.CODCENTROCUSTO '+
                    '         from CONTASORCAMEN C,  '+
                    '              GRUPOORCAMEN G,   '+
                    '              (SELECT D1.IDDESPESAORC, D1.IDGRUPOORCAMEN, DC1.CODCENTROCUSTO  '+
                    '                 FROM DESPESAORCAMENTARIA D1, DESPESAORCXCCUSTO DC1  '+
                    '                WHERE D1.IDDESPESAORC = DC1.IDDESPESAORC '+
                    '                  AND D1.IDGRUPOORCAMEN = '+IntToStr( iIdGrupoOrc ) +') DC, '+
                    '              PERIODOORCAMEN P '+
                    '        where G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN '+
                    '          and C.CODCENTROCUSTO = DC.CODCENTROCUSTO(+) '+
                    '          and C.IDPLANOORCAMEN = '+IntToStr( rParams.iIdPlanoOrc ) +
                    '          and C.IDGRUPOORCAMEN = '+IntToStr( iIdGrupoOrc ) +
                    '          and P.EXERCICIO =  ' + IntToStr( rParams.iExercicio ) +
                    '          and C.TIPOCALCORCADO = ''V'' '+
                    '          and C.FLGATIVA = ''A'' ';
          if rParams.iPeriodo <> 0 then
            sqlTxt := sqlTxt +
                    '          and P.PERIODO = ' + IntToStr(rParams.iPeriodo);

          if rParams.iUnidNegoc <> 0 then
            sqlTxt := sqlTxt +
                    '          and C.UNIDNEGOC  = ' + IntToStr(rParams.iUnidNegoc);

          if rParams.iIdPlano <> - 1 then
            sqlTxt := sqlTxt +
                    '          and C.IDPLANOPREV = ' + IntToStr(rParams.iIdPlano);

          if rParams.iIdPatro <> - 1 then
            sqlTxt := sqlTxt +
                    '          and C.IDPATRO = ' + IntToStr(rParams.iIdPatro);

          if (rParams.iIdPrograma <> - 1) and (rParams.iIdPrograma > 0)  then
            sqlTxt := sqlTxt +
                    '          and C.IDPROGRAMAORCAMEN = ' + IntToStr(rParams.iIdPrograma);

          if (rParams.iIdTipoDespesa <> - 1) and (rParams.iIdTipoDespesa > 0)  then
            sqlTxt := sqlTxt +
                    '          and C.IDTIPO_DEPESAORCAMEN = ' + IntToStr(rParams.iIdTipoDespesa);

          if (rParams.sCodCCusto <> '') then
            sqlTxt := sqlTxt +
                    '          and C.CODCENTROCUSTO = ' + Quotedstr(rParams.sCodCCusto);
          sqlTxt := sqlTxt +
                    '       ) CG, '+
                    '       CENTCUST CC, '+
                    '       SALDOORCADO S  '+
                    ' where CG.IDCONTAORCAMEN = S.IDCONTAORCAMEN(+) '+
                    '   and CG.IDPLANOORCAMEN = S.IDPLANOORCAMEN(+) '+
                    '   and CG.IDDESPESAORC = S.IDDESPESAORC(+) '+
                    '   and CG.IDPESSOA = S.IDPESSOA(+) '+
                    '   and CG.EXERCICIO = S.EXERCICIO(+) '+
                    '   and CG.PERIODO = S.PERIODO(+) '+
                    '   and CG.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) '+
                    '   and nvl(S.IDDESPESAORC, -1) = -1 '+
                    '   and nvl(CC.ATIVO,''S'') = ''S'' '+
                    '   and nvl(CC.STATUSGRUPOCDC,''A'') = ''A'' '+
                    '   AND Cc.CODCENTROCUSTO in '+
                    '       (Select dc.CodCentroCusto '+
                    '          from DESPESAORCXCCUSTO DC, DESPESAORCAMENTARIA D '+
                    '         Where DC.idDespesaOrc = D.idDespesaOrc '+
                    '           and D.IdGrupoOrcamen = '+IntToStr( iIdGrupoOrc )+')';
          }
          //Higor Nayde Ferreira SOL 192079 -  KINTANA 1822802 fim

          CdsLocal.Data := GetDataPacket( sqltxt );
          if not cdsLocal.IsEmpty then
             Result := false;
        end;
      end;

      if (not Result) then
         MessageInfo := 'Esse lançamento deve ser realizado para um dos ''Fornecedor/Sub-despesa'' relacionado a esse Grupo Orçamentário!';

    Finally
     CdsLocal.Free;
    End;
end;


function TCtrlTransacoesPorGrupo.ListaContasEntDados(iPeriodo: integer;
                                                     iExercicio: integer;
                                                     idEmpresa: integer;
                                                     iIdPlanOrc: integer;
                                                     iIdGrupoOrc: integer;
                                                     iIdUsuario: integer;
                                                     iUnidNegoc: integer;
                                                     sCodCentroRespon: string;
                                                     iIdPlanoPrev: integer;
                                                     iIdPatro: integer;
                                                     //Ricardo SOL 159248 KTN 1337823
                                                     iIdPrograma: integer;
                                                     iIdTipoDespesa: integer;
                                                     //Ricardo SOL 159248 KTN 1337823 - fim

                                                     // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
                                                     iIdSubDespesa : integer;
                                                     sCodCentroCusto : string;
                                                     Operacao : TOperacao;
                                                     // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim

                                                     bProcura: Boolean;
                                                     bSomenteCCAtivo: Boolean): OleVariant;
var
  sSQL: string;
  sSQL_dif : string;
  sCodGrupoOrc : string;
begin
  // Alterado por FHBS - SOL: 151852 KTN:
  //sSQL := 'select decode(A.IDCONTAORIGEM,null,(decode(RS.IDCONTAORCAMEN,null,''S'',''N'')),''N'') as VALIDAR, ' + CR_LF +


  sSQL := 'select ' + CR_LF +
          '       distinct ' + CR_LF + // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
          '       nvl(CC.CODEXTERNO, ''-1'') AS CODEXTERNO, '+CR_LF+    // Edilaine - SOL 189683 / KTN 1790559
          '       decode((select count(1)' + CR_LF +
          '                from ALTERORCAMENTO A' + CR_LF +
          '               where A.IDCONTAORIGEM = CG.IDCONTAORCAMEN' + CR_LF +
          '                 and A.IDPLANOORCAMEN = CG.IDPLANOORCAMEN' + CR_LF +
          '                 and A.IDPESSOA = CG.IDPESSOA' + CR_LF +
          '                 and A.EXERCICIOORIGEM = CG.EXERCICIO' + CR_LF +
          '                 and A.IDDESPESAORCORIGEM = CG.IDDESPESAORC' + CR_LF + //Marcio Sanches Spinosa SOL 241969 PPM 564261
          '                 and A.PERIODOORIGEM = CG.PERIODO),' + CR_LF +
          '              0,' + CR_LF +
          '              (decode((select count(1)' + CR_LF +
          '                        from RESERVAORCAMEN RS' + CR_LF +
          '                        inner join RATEIODOCUM R ON R.IDRESERVAORCAMEN = RS.IDRESERVAORCAMEN ' + CR_LF + //Marcio Sanches Spinosa SOL 241969 PPM 564261
          '                       where RS.IDCONTAORCAMEN = CG.IDCONTAORCAMEN' + CR_LF +
          '                         and RS.IDPLANOORCAMEN = CG.IDPLANOORCAMEN' + CR_LF +
          '                         and RS.IDPESSOA = CG.IDPESSOA' + CR_LF +
          '                         and RS.EXERCICIO = CG.EXERCICIO' + CR_LF +
          '                         and R.IDDESPESAORC = CG.IDDESPESAORC' + CR_LF + //Marcio Sanches Spinosa SOL 241969 PPM 564261
          '                         and RS.PERIODO = CG.PERIODO' + CR_LF +
          '                         and RS.FLGRESERVA <> ''C''),' + CR_LF +  //Higor - SOL: 191942 / KTNA 1820656
          '                      0,' + CR_LF +
          '                      ''S'',' + CR_LF +
          '                      ''N'')),' + CR_LF +
          '              ''N'') as VALIDAR,' + CR_LF +
  // Fim - Alterado por FHBS - SOL: 151852 KTN:

          // Edilaine - SOL 172384-10063 / KTN 1689960
          //'       decode(lag(CG.PERIODO) over(order by CG.PERIODO), CG.PERIODO, ''N'', ''S'') as LANC_DIF, ' + CR_LF +
          //'       decode(lag(CC.CODEXTERNO) over(order by CG.PERIODO, CC.CODEXTERNO, PPV.NOME, P.NOME, CG.IDCONTAORCAMEN), CC.CODEXTERNO, ''N'', ''S'') as LANC_DIF, ' + CR_LF +  // Edilaine - SOL 189683 / KTN 1790559 - comentado
          // Edilaine - SOL 172384-10063 / KTN 1689960 - fim

          '       ''N'' as LANC_DIF_AUX, ' + CR_LF +
          '       decode(S.IDCONTAORCAMEN, null, ''S'', ''N'') as LANC_NEW, ' + CR_LF +

          '       CG.IDPLANOORCAMEN, ' + CR_LF +
          '       CG.IDCONTAORCAMEN, ' + CR_LF +
          //Ricardo SOL: 152788 KTN: 1145736 - comentado
          //'       nvl( S.DATAREFERENCIA, CG.DATAFIMPERIODO ) as DATAREFERENCIA, ' + CR_LF +
          //Ricardo SOL: 152788 KTN: 1145736 - a data d e referência é a data de início
          '       (CG.DATAINIPERIODO ) as DATAREFERENCIA, ' + CR_LF +

          '       CG.IDPESSOA, ' + CR_LF +
          '       CG.EXERCICIO, ' + CR_LF +
          '       CG.PERIODO,   ' + CR_LF +

          '       CG.IDGRUPOORCAMEN, ' + CR_LF +
          '       CG.CODGRUPOORC, ' + CR_LF +
          '       CG.NOMEGRUPOORCAMEN, ' + CR_LF +

          '       PPV.NOME as PLANO, ' + CR_LF +
          '       P.NOME as PATRO, ' + CR_LF +
          '       U.NOME as ATIVPROJ, ' + CR_LF +
          '       trim(R.CODEXTERNO)  || '' - '' || R.NOME as CENTRORESPON, ' + CR_LF +
          //'       trim(CC.CODEXTERNO) || '' - '' || CC.NOME as CENTROCUSTO, ' + CR_LF +    // VANDER   - SOL 172385/10082 - Kintana - 1690505
          '       trim(CC.CODEXTERNO) || '' - '' || CC.NOMECC as CENTROCUSTO, ' + CR_LF +  // VANDER   - SOL 172385/10082 - Kintana - 1690505
          '       trim(CC.CODCENTROCUSTO) as CODCENTROCUSTO, ' + CR_LF +
          '       CG.UNIDNEGOC, ' + CR_LF +
          '       CG.IDPLANOPREV, ' + CR_LF +
          '       CG.IDPATRO, ' + CR_LF +
          '       CG.CODCENTRORESPON, ' + CR_LF +

          // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
          '       trim(NVL(DP.FORNECEDOR,'''')) || decode(DP.FORNECEDOR, null, '''', ''/'') || trim(DP.SUBDESPESA) AS SUBDESPESA, ' + CR_LF +
          '       NVL(S.IDDESPESAORC, -1) AS IDDESPESAORC, ' + CR_LF +
          '       ''N'' AS SELECIONADO, ' + CR_LF +
          '       S.CHAVEAUX, ' + CR_LF +
          // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim

          //Ricardo SOL 159248 KTN 1337823
          '       CG.IDPROGRAMAORCAMEN, ' + CR_LF +
          '       CG.IDTIPO_DEPESAORCAMEN, ' + CR_LF +
          '       trim(PR.DESCRICAO_PROGRAMAORCAMEN) AS PROGRAMA, ' + CR_LF +
          '       trim(TD.DESCRICAO_TIPO_DEPESAOCAMEN ) AS TIPODESPESA, ' + CR_LF;
          //Ricardo SOL 159248 KTN 1337823 - fim

  if bProcura then
    sSQL := sSQL +
          '       CT.IDCRITERIORATORC, ' + CR_LF +
          '       CT.DESCRICAO as NOMECRITERIO, ' + CR_LF
  else
    sSQL := sSQL +
          '       -1 AS IDCRITERIORATORC, ' + CR_LF +
          '       cast(null as varchar2(40)) as NOMECRITERIO, ' + CR_LF;

  sSQL := sSQL +
          '       0 as VALORRATEIO, ' + CR_LF +
          '       0 AS VALOR,  ' + CR_LF +

          // O valor deste campo, tem como objetivo de sempre
          // retornar o valor original da dotação efetuada
          //Brunno Mattos KTN 1159883  SOL 153584 Adicionei - nvl(S.VLRAJUSTE,0)
          //Brunno Mattos SOL 153584/4161  KTN 1170663 Retirei + nvl(SALDOPROC.VALOR,0) - nvl(S.VLRAJUSTE,0)
          //pois o VLRORCADO será o valor de dotação realizado, e não pode ser alterado
          //Brunno Mattos SOL 154957  KTN 1193108 inclui "- nvl(S.VLRTRANSF, 0)"
          //'       nvl(S.VLRORCADO,0) - nvl(S.VLRTRANSF, 0) AS VLRORCADO ' + CR_LF +

          // Edilaine - SOL 190488 / KTN 1909246 - o VLRORCADO não será alterado pelas transf e suplementacoes,
          // o valor será composto pelos campos de ajuste nas consultas que retornem o saldo das contas
          //'     nvl(S.VLRORCADO,0) - nvl(S.VLRTRANSF, 0) AS VLRORCADO ' + CR_LF +
          '       nvl(S.VLRORCADO,0) + nvl(S.VLRAJUSTE,0) AS VLRORCADO ' + CR_LF +
          '       ,nvl(S.VLRAJUSTE,0) AS VLRAJUSTE ' + CR_LF + // SOL 210712 KINTANA 2029487
          '       ,nvl(S.VLRTRANSF,0) AS VLRTRANSF ' + CR_LF + // SOL 210712 KINTANA 2029487

          '  from (select distinct P.PERIODO,' + CR_LF +                      // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
          // Edilaine - SOL 189698 / KTN 1794093
          //'               NVL(DC.IDDESPESAORC, -1) IDDESPESAORC, ' + CR_LF +  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
          '               DECODE(NVL(DC.IDDESPESAORC, -1), -1, '+IntToStr(iIdSubDespesa)+', DC.IDDESPESAORC) IDDESPESAORC, ' + CR_LF +
          // Edilaine - SOL 189698 / KTN 1794093 - fim
          '               P.EXERCICIO,' + CR_LF +
          '               C.IDCONTAORCAMEN,' + CR_LF +
          '               C.IDPLANOORCAMEN,' + CR_LF +
          '               C.IDGRUPOORCAMEN,' + CR_LF +
          '               G.CODGRUPOORC,' + CR_LF +
          '               G.NOMEGRUPOORCAMEN,' + CR_LF +
          '               C.UNIDNEGOC,' + CR_LF +
          '               C.IDPLANOPREV,' + CR_LF +
          '               C.IDPATRO,' + CR_LF +
          '               C.IDPESSOA,' + CR_LF +
          '               C.CODCENTRORESPON,' + CR_LF +
          '               C.IDEMPRESA,' + CR_LF +
          '               C.CODCENTROCUSTO,' + CR_LF +
          //Ricardo SOL: 152788 KTN: 1145736 -  comentado: '               P.DATAFIMPERIODO' + CR_LF +
          //Ricardo SOL: 152788 KTN: 1145736 - a data de referência é a data de início
          '               P.DATAINIPERIODO,' + CR_LF +
          //Ricardo SOL 159248 KTN 1337823
          '               C.IDPROGRAMAORCAMEN,' + CR_LF +
          '               C.IDTIPO_DEPESAORCAMEN' + CR_LF +
          //Ricardo SOL 159248 KTN 1337823 - fim

          '          from CONTASORCAMEN C,' + CR_LF +
          '               GRUPOORCAMEN G,' + CR_LF +
          // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
          '              (SELECT D1.IDDESPESAORC, D1.IDGRUPOORCAMEN, DC1.CODCENTROCUSTO ' + CR_LF +
          '                 FROM DESPESAORCAMENTARIA D1, DESPESAORCXCCUSTO DC1 ' + CR_LF +
          '                WHERE D1.IDDESPESAORC = DC1.IDDESPESAORC ' + CR_LF;

          // Edilaine - SOL 189698 / KTN 1794093
          if iPeriodo <> 0 then  // inclui apenas se o período não for ANUAL
             sSQL := sSQL +
          '                  AND D1.IDDESPESAORC = '+IntToStr(iIdSubDespesa) +CR_LF;
          // Edilaine - SOL 189698 / KTN 1794093 - fim

          sSQL := sSQL +
          '                  AND D1.IDGRUPOORCAMEN = '+ IntToStr(iIdGrupoOrc) +') DC, ' + CR_LF +
          // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - FIM
          '               PERIODOORCAMEN P' + CR_LF;

  sSQL := sSQL +
          '         where G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN' + CR_LF +
          '           and C.CODCENTROCUSTO = DC.CODCENTROCUSTO(+) ' + CR_LF +  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
          '           and C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanOrc) + CR_LF +
          '           and C.IDEMPRESA = ' + IntToStr(idEmpresa) + CR_LF +
          '           and C.IDPESSOA = ' + IntToStr(idEmpresa) + CR_LF +
          '           and C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + CR_LF +
          '           and C.TIPOCALCORCADO = ''V'' ' + CR_LF +
          '           and C.FLGATIVA = ''A'' ' + CR_LF +
          '           and P.EXERCICIO =  ' + IntToStr(iExercicio) + CR_LF;

  if iPeriodo <> 0 then
    sSQL := sSQL +
          '           and P.PERIODO =  ' + IntToStr(iPeriodo) + CR_LF;

  if iUnidNegoc <> 0 then
    sSQL := sSQL +
          '           and C.UNIDNEGOC  = ' + IntToStr(iUnidNegoc) + CR_LF;

  if iIdPlanoPrev <> - 1 then
    sSQL := sSQL +
          '           and C.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + CR_LF;

  if iIdPatro <> - 1 then
    sSQL := sSQL +
          '           and C.IDPATRO = ' + IntToStr(iIdPatro) + CR_LF;


  //Ricardo SOL 159248 KTN 1337823
  if (iIdPrograma <> - 1) and (iIdPrograma > 0)  then
    sSQL := sSQL +
          '           and C.IDPROGRAMAORCAMEN = ' + IntToStr(iIdPrograma) + CR_LF;

  if (iIdTipoDespesa <> - 1) and (iIdTipoDespesa > 0)  then
    sSQL := sSQL +
          '           and C.IDTIPO_DEPESAORCAMEN = ' + IntToStr(iIdTipoDespesa) + CR_LF;
  //Ricardo SOL 159248 KTN 1337823 - fim


  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
  if (sCodCentroCusto <> '') then
    sSQL := sSQL +
          '           and C.CODCENTROCUSTO = ' + Quotedstr(sCodCentroCusto) + CR_LF;

  if (iIdSubDespesa > 0) then
  begin
    sSQL := sSQL +
          '           and DC.IDDESPESAORC = ' + IntToStr(iIdSubDespesa)+ CR_LF;
  end;

  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim

  sSQL := sSQL +
          '        ) CG,'  + CR_LF +

          '       PESSOA P, ' + CR_LF +
          '       PLANPREVCONTABIL PPV, ' + CR_LF +
          '       CENTRESPON R, ' + CR_LF +
          //'       CENTCUST CC, ' + CR_LF +    // VANDER   - SOL 172385/10082 - Kintana - 1690505
          '       UNIDNEGOCIO U, ' + CR_LF +

          '       CRITERIORATORC CT, ' + CR_LF +

          // Edilaine - SOL 189698 / KTN 1794093
          //'       SALDOORCADO S, ' + CR_LF +
          '       (select IDCONTAORCAMEN, CHAVEAUX, VLRORCADO, VLRTRANSF, IDCRITERIORATORC, ' + CR_LF +
          '               PERIODO, EXERCICIO, IDPESSOA, IDPLANOORCAMEN, VLRAJUSTE, ' + CR_LF +     // Edilaine - SOL 190488 / KTN 1909246
          '               DECODE(NVL(IDDESPESAORC, -1), -1, '+IntToStr(iIdSubDespesa)+', IDDESPESAORC) IDDESPESAORC ' + CR_LF +
          '          from SALDOORCADO ' + CR_LF +
          '       ) S, ' + CR_LF;
          // Edilaine - SOL 189698 / KTN 1794093

  // VANDER   - SOL 172385/10082 - Kintana - 1690505
  sSQL := sSQL + '       (' +  MontaListaCentroCusto(iIdUsuario, iIdGrupoOrc) + CR_LF +
                 '       ) CC, ' + CR_LF;

  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
  sSQL := sSQL +
          ' (SELECT D.IDDESPESAORC, D.IDFORNECEDOR, P.NOME AS FORNECEDOR, D.FLGSTATUSDESPESA, ' + CR_LF +
          '         DECODE(D.FLGSTATUSDESPESA, ''I'', ''INATIVO'', ''ATIVO'') AS STATUS, D.NATUREZA, ' + CR_LF +
          '         D.SUBDESPESA, D.ACAO, D.DESCRICAO, D.IDPESSOA ' + CR_LF +
          '    FROM DESPESAORCAMENTARIA D, PESSOA P ' + CR_LF +
          '   WHERE D.IDFORNECEDOR = P.IDPESSOA(+) ) DP, ' + CR_LF +

  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - FIM

          // Alterado por FHBS - SOL: 151852 KTN:
          //'       ALTERORCAMENTO A, ' + CR_LF +
          //'       RESERVAORCAMEN RS, ' + CR_LF +
          // Fim - Alterado por FHBS - SOL: 151852 KTN:


          // O objetivo deste subselect é de sempre manter o valor da dotação inicial
          '       (select S.IDCONTAORCAMEN, S.IDPLANOORCAMEN, S.IDPESSOA, S.PERIODO, S.EXERCICIO, ' + CR_LF +
          '               round(sum(nvl(decode(AO.FLGTIPOALTER,''S'',(nvl(AO.VLRSOLICITADO,0) * -1) , ' + CR_LF +
          '                                                    ''R'', nvl(AO.VLRSOLICITADO,0), ' + CR_LF +
          '                                                    ''T'', nvl(AO.VLRSOLICITADO,0) ),0) - nvl(AD.VLRSOLICITADO,0)),2) AS VALOR ' + CR_LF +
          '          from (select distinct IDCONTAORCAMEN, IDPLANOORCAMEN, PERIODO, EXERCICIO, IDPESSOA ' + CR_LF +
          '                  from SALDOORCADO ' + CR_LF +
          '                 where EXERCICIO = ' + IntToStr(iExercicio) + CR_LF;

  if iPeriodo <> 0 then
    sSQL := sSQL +
           '                  and PERIODO = ' + IntToStr(iPeriodo) + CR_LF ;

  sSQL := sSQL +
           '               ) S, ' + CR_LF +

           '              (select IDPLANOORCAMEN, IDCONTAORIGEM, FLGTIPOALTER, PERIODOORIGEM, EXERCICIOORIGEM, VLRSOLICITADO ' + CR_LF +
           '                 from ALTERORCAMENTO)  AO, ' + CR_LF +

           '              (select IDPLANOORCAMEN, IDCONTADESTINO, PERIODODESTINO, EXERCICIODESTINO, VLRSOLICITADO ' + CR_LF +
           '                 from ALTERORCAMENTO ' + CR_LF +
           '                where FLGTIPOALTER  = ''T'')  AD ' + CR_LF +

           '        where S.IDCONTAORCAMEN = AO.IDCONTAORIGEM(+) ' + CR_LF +
           '          and S.IDPLANOORCAMEN = AO.IDPLANOORCAMEN(+) ' + CR_LF +
           '          and S.PERIODO        = AO.PERIODOORIGEM(+) ' + CR_LF +
           '          and S.EXERCICIO      = AO.EXERCICIOORIGEM(+) ' + CR_LF +
           '          and S.IDCONTAORCAMEN = AD.IDCONTADESTINO(+) ' + CR_LF +
           '          and S.IDPLANOORCAMEN = AD.IDPLANOORCAMEN(+) ' + CR_LF +
           '          and S.PERIODO        = AD.PERIODODESTINO(+) ' + CR_LF +
           '          and S.EXERCICIO      = AD.EXERCICIODESTINO(+) ' + CR_LF +

           '        group by S.IDCONTAORCAMEN, S.IDPLANOORCAMEN,S.IDPESSOA, S.PERIODO, S.EXERCICIO) SALDOPROC ' + CR_LF +

           //Ricardo SOL 159248 KTN 1337823
           '        ,CM.PROGRAMAORCAMEN PR, CM.TIPO_DESPESAORCAMEN TD ' + CR_LF ;
           //Ricardo SOL 159248 KTN 1337823 - fim

  if bProcura then
    sSQL := sSQL +
           ' where CG.IDCONTAORCAMEN = S.IDCONTAORCAMEN ' + CR_LF +
           '   and CG.IDPLANOORCAMEN = S.IDPLANOORCAMEN ' + CR_LF +
           '   and CG.IDDESPESAORC = S.IDDESPESAORC ' + CR_LF + // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
           '   and CG.IDPESSOA = S.IDPESSOA ' + CR_LF +
           '   and CG.EXERCICIO = S.EXERCICIO ' + CR_LF +
           '   and CG.PERIODO = S.PERIODO ' + CR_LF
  else
    sSQL := sSQL +
           ' where CG.IDCONTAORCAMEN = S.IDCONTAORCAMEN(+) ' + CR_LF +
           '   and CG.IDPLANOORCAMEN = S.IDPLANOORCAMEN(+) ' + CR_LF +
           '   and CG.IDDESPESAORC = S.IDDESPESAORC(+) ' + CR_LF +  // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
           '   and CG.IDPESSOA = S.IDPESSOA(+) ' + CR_LF +
           '   and CG.EXERCICIO = S.EXERCICIO(+) ' + CR_LF +
           '   and CG.PERIODO = S.PERIODO(+) ' + CR_LF;


  sSQL := sSQL +
           '   and S.IDCRITERIORATORC = CT.IDCRITERIORATORC(+) ' + CR_LF +

           '   and CG.IDPLANOORCAMEN = SALDOPROC.IDPLANOORCAMEN(+) ' + CR_LF +
           '   and CG.IDCONTAORCAMEN = SALDOPROC.IDCONTAORCAMEN(+) ' + CR_LF +
           '   and CG.IDPESSOA = SALDOPROC.IDPESSOA(+) ' + CR_LF +
           '   and CG.EXERCICIO = SALDOPROC.EXERCICIO(+) ' + CR_LF +
           '   and CG.PERIODO = SALDOPROC.PERIODO(+) ' + CR_LF +

           // Alterado por FHBS - SOL: 151852 KTN:
           //'   and CG.IDCONTAORCAMEN = A.IDCONTAORIGEM(+) ' + CR_LF +
           //'   and CG.IDPLANOORCAMEN = A.IDPLANOORCAMEN(+) ' + CR_LF +
           //'   and CG.IDPESSOA = A.IDPESSOA(+) ' + CR_LF +
           //'   and CG.EXERCICIO = A.EXERCICIOORIGEM(+) ' + CR_LF +
           //'   and CG.PERIODO = A.PERIODOORIGEM(+) ' + CR_LF +

           //'   and CG.IDCONTAORCAMEN = RS.IDCONTAORCAMEN(+) ' + CR_LF +
           //'   and CG.IDPLANOORCAMEN = RS.IDPLANOORCAMEN(+) ' + CR_LF +
           //'   and CG.IDPESSOA = RS.IDPESSOA(+) ' + CR_LF +
           //'   and CG.EXERCICIO = RS.EXERCICIO(+) ' + CR_LF +
           //'   and CG.PERIODO = RS.PERIODO(+) ' + CR_LF +
           // Fim - Alterado por FHBS - SOL: 151852 KTN:

           '   and CG.IDPLANOPREV = PPV.IDPLANOPREV(+) ' + CR_LF +
           '   and CG.IDPATRO = P.IDPESSOA(+) ' + CR_LF +

           '   and CG.IDPESSOA = U.IDPESSOA(+) ' + CR_LF +
           '   and CG.UNIDNEGOC = U.UNIDNEGOC(+) ' + CR_LF +

           '   and CG.IDPESSOA = R.IDPESSOA(+) ' + CR_LF +
           '   and CG.CODCENTRORESPON = R.CODCENTRORESPON(+) ' + CR_LF +

           '   and CG.IDEMPRESA = CC.IDEMPRESA(+) ' + CR_LF +
           //'   and CG.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ' + CR_LF +   //VANDER - SOL 172385/10082 - Kintana - 1690505
           '   and CG.CODCENTROCUSTO = CC.CODCENTROCUSTO ' + CR_LF +     //VANDER - SOL 172385/10082 - Kintana - 1690505

           //Ricardo SOL 159248 KTN 1337823
           '   and CG.IDPROGRAMAORCAMEN = PR.IDPROGRAMAORCAMEN(+) ' + CR_LF +
           '   and CG.IDTIPO_DEPESAORCAMEN = TD.IDTIPO_DEPESAORCAMEN(+) ' + CR_LF;
           //Ricardo SOL 159248 KTN 1337823 - fim

    // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030
    sSQL := sSQL +
           '   and S.IDDESPESAORC = DP.IDDESPESAORC(+) ' + CR_LF;

    // na inclusão eliminar do grid as despesas que ja tiveram lançamentos para uma despesa qualquer
    if Operacao = opInserir then
      sSQL := sSQL +
            //'  and nvl(S.IDDESPESAORC, -1) = -1 ' + CR_LF; // Edilaine - SOL 189698 / KTN 1794093 - comentado
            '  and nvl(S.IDDESPESAORC, -1) IN (-1, '+IntToStr(iIdSubDespesa)+') ' + CR_LF; // Edilaine - SOL 189698 / KTN 1794093

    // Edilaine Ferraresi - SOL 172383-7763 / KTN 1557030 - fim


  // Alterado por FHBS - SOL: 151660 KTN: 1115295
  if bSomenteCCAtivo then
    sSQL := sSQL +
           '   and nvl(CC.ATIVO,''S'') = ''S'' ' + CR_LF +
           '   and nvl(CC.STATUSGRUPOCDC,''A'') = ''A'' ' + CR_LF;
  // Fim - Alterado por FHBS - SOL: 151660 KTN: 1115295


  sCodGrupoOrc := RetornaCodGrupoOrcamento( IntToStr( iIdGrupoOrc ) );   // Edilaine - SOL 189698 / KTN 1794093

  // Edilaine - SOL 189683 / KTN 1790559
  sSQL_DIF := 'SELECT '+ CR_LF +
                 iif( copy(sCodGrupoOrc,1,1) = '4',   // Edilaine - SOL 189698 / KTN 1794093
                         '       decode(lag(YY.CODEXTERNO) over(order by YY.PERIODO, YY.CODEXTERNO, YY.PLANO, YY.PATRO, YY.IDCONTAORCAMEN), YY.CODEXTERNO, ''N'', ''S'') as LANC_DIF, ',   // Edilaine - SOL 189698 / KTN 1794093
                         '       decode(lag(YY.PERIODO) over(order by YY.PERIODO), YY.PERIODO, ''N'', ''S'') as LANC_DIF, '     // Edilaine - SOL 189698 / KTN 1794093
                    )+ CR_LF +
              //'       decode(lag(YY.CODEXTERNO) over(order by YY.PERIODO, YY.CODEXTERNO, YY.PLANO, YY.PATRO, YY.IDCONTAORCAMEN), YY.CODEXTERNO, ''N'', ''S'') as LANC_DIF, ' + CR_LF +      // Edilaine - SOL 189698 / KTN 1794093 - comentado
              '       YY.* ' +
              '  FROM (' +CR_LF+  sSQL  +CR_LF+
              '       ) YY '+CR_LF+
              ' order by YY.PERIODO, YY.CENTROCUSTO, YY.PLANO, YY.PATRO, YY.IDCONTAORCAMEN  ';
  // Edilaine - SOL 189683 / KTN 1790559 - fim

  // Edilaine - SOL 172384-10063 / KTN 1689960
  {ao alterar o ORDER BY verificar a linha referente ao LANC_DIF, se não será afetada}
  //sSQL := sSQL +    // Edilaine - SOL 189683 / KTN 1790559 - comentado
  //        ' order by CG.PERIODO, CENTROCUSTO, PLANO, PATRO  ';
  //        ' order by CG.PERIODO, CENTROCUSTO, PLANO, PATRO, CG.IDCONTAORCAMEN  ';  // Edilaine - SOL 189683 / KTN 1790559 - comentado
  // Edilaine - SOL 172384-10063 / KTN 1689960 - fim

  with TStringList.Create do
  try
    Text := sSQL_DIF;     // Edilaine - SOL 189683 / KTN 1790559
    SaveToFile('C:\Planus\Temp\ListaContasEntDados.sql');
  finally
    Free;
  end;

  Result := GetDataPacket(sSQL_DIF);  // Edilaine - SOL 189683 / KTN 1790559
end;


function TCtrlTransacoesPorGrupo.CriaSaldoContas(ovDadosContas: OleVariant;
  iPeriodo, iIdEmpresa: integer;
  bSobescreveSaldo: boolean;
  const iIdDespesa : integer; const bAtuIdDespesa : boolean): Boolean;   // Edilaine - SOL 172383-7763 / KTN 1557030
//  Legenda do FormProgresso
//   vParam[0] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)

//    Acima
//-------------------------------------
//   vParam[1]  :  Mínimo de Registros
//   vParam[2]  :  Total de Registros
//   vParam[3]  :  Registro Atual
//   vParam[4]  :  Legenda

//    Abaixo
//-------------------------------------
//   vParam[5]  :  Mínimo de Registros
//   vParam[6]  :  Total de Registros
//   vParam[7]  :  Registro Atual
//   vParam[8]  :  Legenda
var
   sDataRef: string;
   iMesCorrente, iMesIni, iMesFim: integer;
   rValorDot, rValorPerAcum: Double;
   valor1, valor2, valor3, valor4 : Double;
   lstCodeBlock : TStringList;  // Edilaine - SOL 185723 / KTN 1742408
   iIdDespesaAux : integer; // Edilaine - SOL 191669 / KTN 1816552
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.CriaSaldoContas(ovDadosContas);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
     // Edilaine - SOL 185723 / KTN 1742408
     { a lista lstCodeBlock conterá instruções INSERT e UPDATE para atualização de saldo
       O bloco será executado antes do commit. Para voltar ao processo anterior (executar
       instrução por instrução) basta comentar a passagem do parâmetro lstCodeBlock
       nas funções InsereSaldo e AtualizaSaldo }
     lstCodeBlock := TStringList.Create;
    // Edilaine - SOL 185723 / KTN 1742408 - fim

     try  // Edilaine - SOL 185723 / KTN 1742408
      try
         StartTransaction;

         _Cds.Data     := ovDadosContas;

         // Filtra somente as linhas autorizadas para a inserção de saldo
         _Cds.Filter  := 'VALIDAR = ''S''';
         if _Cds.FindField('SELECIONADO') <> nil then    // Edilaine - SOL 189698 / KTN 1794093
            _Cds.Filter  := _Cds.Filter + ' and SELECIONADO <> ''S'' ';  // Edilaine - SOL 172383-7763 / KTN 1557030
         _Cds.Filtered := True;

         if _Cds.IsEmpty then
         begin
           _Cds.Filtered := False;
           raise Exception.Create('Não há nenhum relacionamento disponível');
         end;

         // Se o perído for anual, monta o array dos meses
         if iPeriodo = 0 then
         begin
            iMesIni := 1;
            iMesFim := 12;
         end
         else
         begin
            iMesIni := iPeriodo;
            iMesFim := iPeriodo;
         end;

         iMesCorrente := iMesIni;

         // Exibe a barra de progresso
         DoProgresso([0, iMesIni, iMesFim, iMesCorrente, '', 1, _Cds.RecordCount, _Cds.RecNo, '']);

         _Cds.First;
         while not _Cds.Eof do
         begin
             // Anda a barra de progresso
             iMesCorrente := _Cds.FieldByName('PERIODO').AsInteger;

             DoProgresso([1, iMesIni, iMesFim, iMesCorrente, 'Processando período ' + IntToStr(iMesIni) + ' à ' + IntToStr(iMesFim),
                          1, _Cds.RecordCount, _Cds.RecNo, 'Processando conta ' + _Cds.FieldByName('IDCONTAORCAMEN').AsString]);

             if _Cds.FieldByName('LANC_NEW').AsString = 'S' then
             begin
               // Insere a dotação. Só insere se o usuário informar um valor


               //Ricardo de Freitas - SOL 167449 Kintana 1469512 - comentado
               {if _Cds.FieldByName('VALOR').AsFloat > 0 then
               begin}
                  DoProgresso([1, iMesIni, iMesFim, iMesCorrente, 'Inserindo dotação...',
                               1, _Cds.RecordCount, _Cds.RecNo, 'Processando conta ' + _Cds.FieldByName('IDCONTAORCAMEN').AsString]);

                  CtrlSaldoOrcado.InsereSaldo(_Cds.FieldByName('EXERCICIO').AsInteger,
                                              _Cds.FieldByName('PERIODO').AsInteger,
                                              _Cds.FieldByName('IDPLANOORCAMEN').AsInteger,
                                              iIdEmpresa,
                                              _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                              _Cds.FieldByName('DATAREFERENCIA').AsString,
                                              _Cds.FieldByName('VALOR').AsFloat,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              // Se for informado um critério de rateio, vincular
                                              //este critério a dotação que está sendo criada
                                              _Cds.FieldByName('IDCRITERIORATORC').AsInteger,
                                              // se informado uma SubDespesa vincuar a dotação
                                              iIdDespesa,  // Edilaine - SOL 172383-7763 / KTN 1557030
                                              lstCodeBlock   // Edilaine - SOL 185723 / KTN 1742408
                                              );
               //Ricardo de Freitas - SOL 167449 Kintana 1469512 - comentado
               //end;
             end
             else
             begin
               // Edilaine - SOL 191669 / KTN 1816552
               if (not bAtuIdDespesa) and (iIdDespesa <> _Cds.FieldByName('IDDESPESAORC').AsInteger) then
                  iIdDespesaAux := _Cds.FieldByName('IDDESPESAORC').AsInteger
               else
                  iIdDespesaAux := iIdDespesa;
               // Edilaine - SOL 191669 / KTN 1816552 - fim

                DoProgresso([1, iMesIni, iMesFim, iMesCorrente, 'Atualizando dotação...',
                             1, _Cds.RecordCount, _Cds.RecNo, 'Processando conta ' + _Cds.FieldByName('IDCONTAORCAMEN').AsString]);

                CtrlSaldoOrcado.AtualizaSaldo(_Cds.FieldByName('IDPLANOORCAMEN').AsInteger,
                                              iIdEmpresa,
                                              _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                              _Cds.FieldByName('DATAREFERENCIA').AsString,
                                              _Cds.FieldByName('VALOR').AsFloat,
                                              bSobescreveSaldo,
                                              _Cds.FieldByName('IDCRITERIORATORC').AsInteger,
                                              // se informado uma SubDespesa vincuar a dotação
                                              //iIdDespesa, bAtuIdDespesa,  // Edilaine - SOL 172383-7763 / KTN 1557030
                                              iIdDespesaAux, bAtuIdDespesa,    // Edilaine - SOL 191669 / KTN 1816552
                                              lstCodeBlock   // Edilaine - SOL 185723 / KTN 1742408
                                              );
             end;

             // Edilaine - SOL 191669 / KTN 1816552
             if lstCodeBlock.Count > 2000 then
             begin
               ExecSQL('BEGIN ' + lstCodeBlock.text + ' END;');

               Commit;
               StartTransaction;

               lstCodeBlock.clear;
             end;
             // Edilaine - SOL 191669 / KTN 1816552 - fim

            _Cds.Next;
         end;

         // Edilaine - SOL 185723 / KTN 1742408
         if lstCodeBlock.Count > 0 then
            ExecSQL('BEGIN ' + lstCodeBlock.text + ' END;');
         // Edilaine - SOL 185723 / KTN 1742408 - fim

         Commit;

         // Esconde a barra de progresso
         DoProgresso([2,1,1,1,'',1,1,1,'']);

         // Desfaz o filtro
         _Cds.Filtered := False;
         Result        := true;

      except
         on E:Exception do
         begin
            Rollback;
            // Esconde a barra de progresso
            DoProgresso([2,1,1,1,'',1,1,1,'']);
            Result      := false;
            _Cds.Filtered := False;
            MessageInfo := e.Message;
         end;
      end;

     finally
       lstCodeBlock.Free;
     end;
   end;

end;


function TCtrlTransacoesPorGrupo.DeletaSaldos(ovDadosContas: OleVariant;
  iIdEmpresa: integer): Boolean;
var
  _CdsAux: TClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.DeletaSaldos(ovDadosContas,iIdEmpresa);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;
         _CdsAux          := TClientDataSet.Create(nil);
         _CdsAux.Data     := ovDadosContas;
         //  Exclui todos os registros. Isso é necessário, pois o padrão
         //exclui o primeiro registro em foco. Se não fizer isso, o registro
         //excluído não será tratado
         while not _CdsAux.Eof do
            _CdsAux.Delete;

         _CdsAux.StatusFilter := [usDeleted];
         _CdsAux.First;

         // Exibe a barra de progresso
         if not _CdsAux.Eof then
            DoProgresso([3,_CdsAux.RecNo,_CdsAux.RecordCount,_CdsAux.RecNo,'Excluindo dotações...']);

         Result := _CdsAux.Eof;

         while not _CdsAux.Eof do
         begin
             if (_CdsAux.FieldByName('VALIDAR').AsString = 'S') then
             begin
                // Anda a barra de progresso
                DoProgresso([4,_CdsAux.RecNo,_CdsAux.RecordCount,_CdsAux.RecNo,
                             'Excluindo dotação conta ' + _CdsAux.FieldByName('IDCONTAORCAMEN').AsString + ' - Período ' + _CdsAux.FieldByName('PERIODO').AsString + '/' + _CdsAux.FieldByName('EXERCICIO').AsString ]);

                Result := CtrlSaldoOrcado.Exclui(_CdsAux.FieldByName('IDCONTAORCAMEN').AsString,
                                                 _CdsAux.FieldByName('PERIODO').AsInteger,
                                                 _CdsAux.FieldByName('EXERCICIO').AsInteger,
                                                 iIdEmpresa,
                                                 _CdsAux.FieldByName('IDPLANOORCAMEN').AsInteger);

                if not Result then
                   raise Exception.Create(MessageInfo);
             end;

            _CdsAux.Next;
         end;
         _CdsAux.StatusFilter := [];

         // Esconde a barra de progresso
         DoProgresso([5]);

         Commit;
         FreeAndNil(_CdsAux);

      except
         on E:Exception do
         begin
            Rollback;
            FreeAndNil(_CdsAux);
            // Esconde a barra de progresso
            DoProgresso([5]);
            Result      := false;
            MessageInfo := e.Message;
         end;
      end;
   end;
end;


//function TCtrlTransacoesPorGrupo.ListaTransfEfetuadas(sDataRef,ExercicioO,ExercicioD: string; iIdOperacao, iPeriodo: integer; TipoConta :tTipoConta): OleVariant;
function TCtrlTransacoesPorGrupo.ListaTransfEfetuadas(sDataRef, IdPlanoOrc : string; iIdOperacao, iPeriodoOri, iPeriodoDest : integer; TipoConta :tTipoConta): OleVariant;   // Edilaine - SOL 190488 / KTN 1909246
var
   conta    : string;
   sSQL     : string;
   //exercicio: string;  // Edilaine - SOL 190488 / KTN 1909246
   periodo  : string;    // Edilaine - SOL 190488 / KTN 1909246
begin
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202
  if TipoConta = tcAmbas then
     //Result := ListaTransfEfetuadas(sDataRef,ExercicioO,ExercicioD, iIdOperacao, iPeriodo)      // Edilaine - SOL 190488 / KTN 1909246 - comentado
     Result := ListaTransfEfetuadas(sDataRef,IdPlanoOrc, iIdOperacao, iPeriodoOri, iPeriodoDest)  // Edilaine - SOL 190488 / KTN 1909246
  else
  begin
    if TipoConta = tcOrigem then
       begin
       conta := 'ORIGEM';
       //exercicio := ExercicioO;            // Edilaine - SOL 190488 / KTN 1909246 - comentado
       periodo   := IntToStr(iPeriodoOri);   // Edilaine - SOL 190488 / KTN 1909246
       end
    else
    begin
       conta := 'DESTINO';
       //exercicio:= ExercicioD;             // Edilaine - SOL 190488 / KTN 1909246 - comentado
       periodo  := IntToStr(iPeriodoDest);   // Edilaine - SOL 190488 / KTN 1909246
    end;

    sSQL := ' SELECT  DISTINCT ' +                                                          // Edilaine - SOL 190311 / KTN 1799290
            '   A.IDCONTA'+conta+', ' +
            '   A.IDGRUPOORC'+conta+', ' +
            '   Desp.NOMEGRUPOORCAMEN AS GRUPO'+conta+', ' +                                // Edilaine - SOL 190488 / KTN 1909246
            '   TRIM(CTR.CODEXTERNO) || '' - '' || CTR.NOME AS CENTRESP'+conta+', ' +
            '   TRIM(CTC.CODEXTERNO) || '' - '' || CTC.NOME AS CENTCUST'+conta+', ' +
            '   PPV.NOME AS PLANO'+conta+', ' +
            '   PES.NOME AS PATRO'+conta+', ' +
            '   A.PERIODO'+conta+', ' +
            '   A.EXERCICIO'+conta+', ' +
            '   A.IDOPERACAO, ' +
            '   A.IDPESSOA, ' +
            '   A.IDALTERORCAMENTO, ' +
            '   A.IDPLANOORCAMEN, ' +
            //Ricardo SOL 152918 KTN 1146743 comentado - '   A.OBSALTERORCAMEN, ' +
            //Ricardo SOL 152918 KTN 1146743
            'SUBSTR (A.OBSALTERORCAMEN, 1 ,255) AS OBSALTERORCAMEN, ' +
            '   A.DATAREFERENCIA, ' +
            '   A.NUMALTERACAO, ' +
            '   A.FLGTIPOALTER, ' +
            '   NVL(A.VLRSOLICITADO,0) AS VLRSOLICITADO, ' +
            //Ricardo de Freitas Araújo SOL 153918 KTN 1166699

            //Campos Virtuias para Cálculo de Rateio
            ' 0 AS IDGRUPOORCAMEN,' +
            //' 0 AS IDPLANOORCAMEN, ' +                     // Edilaine - SOL 193146 / KTN 1940385
            ' Desp.IDCONTAORCAMEN AS IDCONTAORCAMEN, ' +      // Edilaine - SOL 190488 / KTN 1909246
            ' Desp.CODCENTROCUSTO AS CODCENTROCUSTO, ' +      // Edilaine - SOL 190488 / KTN 1909246
            ' A.EXERCICIODESTINO AS EXERCICIO, ' +
            ' A.PERIODODESTINO AS PERIODO, ' +
            //Campos Virtuais para rateio
            ' 0 AS VALOR, ' +
            QuotedStr('S') + ' AS VALIDAR, ' +
            //Brunno Mattos SOL 154957  KTN 1193108 Adiciona campos VLRORCADO, VLRSOLICITADOORIGEM e VLRSOLICITADODESTINO
            ' 0 AS VLRORCADO, ' +
            ' 0 AS VLRSOLICITADOORIGEM, ' +
            ' 0 AS VLRSOLICITADODESTINO, ' +
            ' 0 AS IDCRITERIORATORC, ' +
            QuotedStr('CRITERIO RATEIO') + ' AS NOMECRITERIO, ' +
            ' 0 AS VALORRATEIO, ' +
            ' 0 AS IDPLANOPREV, ' +
            ' 0 AS IDPATRO,      ' +
            ' ''N'' as LANC_DIF_AUX, ' +
            //Ricardo de Freitas Araújo SOL 153918 KTN 1166699 - fim

            // Edilaine Ferraresi - SOL 163908 / KTN 1403202
            ' A.FLGTIPOCONTA, ' +
            ' PRG.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA'+conta+', ' +
            ' TPD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA'+conta+', ' +
            ' ATP.NOME AS ATIVPROJ'+conta+' ,' +
            // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

            'DESP.IDDESPESAORC AS IDDESP'+conta+', '+   // Edilaine - SOL 193146 / KTN 1940385
            'DESP.SUBDESPESA AS SB'+conta+' '+          // Edilaine - SOL 193146 / KTN 1940385

            'FROM ' +
            '   ALTERORCAMENTO A, ' +

            // Contas de Origem
            //'   CONTASORCAMEN CTA, ' +       // Edilaine - SOL 190488 / KTN 1909246 - comentado
            //'   GRUPOORCAMEN GRP, ' +        // Edilaine - SOL 190488 / KTN 1909246 - comentado
            '   CENTCUST CTC, ' +
            '   CENTRESPON CTR, ' +
            '   PLANPREVCONTABIL PPV, ' +
            '   PESSOA PES, ' +
            '   PROGRAMAORCAMEN PRG, ' +
            '   TIPO_DESPESAORCAMEN TPD, ' +
            '   UNIDNEGOCIO ATP, ' +

            // Edilaine - SOL 193146 / KTN 1940385
            '(SELECT DISTINCT SO.IDCONTAORCAMEN, SO.IDDESPESAORC, SO.EXERCICIO, SO.PERIODO, '+
            '                DO.IDFORNECEDOR, '+
            '                PO.NOME AS FORNECEDOR, '+
            '                TRIM(NVL(PO.NOME, '''')) || DECODE(PO.NOME, NULL, '''', ''/'') || TRIM(DO.SUBDESPESA) AS SUBDESPESA, '+
            // Edilaine - SOL 190488 / KTN 1909246
            '                GRO.NOMEGRUPOORCAMEN,     '+
            '                CO.IDPLANOPREV,           '+
            '                CO.IDPATRO,               '+
            '                CO.IDPLANOORCAMEN,        '+
            '                CO.CODCENTRORESPON,       '+
            '                CO.CODCENTROCUSTO,        '+
            '                CO.IDPROGRAMAORCAMEN,     '+
            '                CO.IDTIPO_DEPESAORCAMEN,  '+
            '                CO.UNIDNEGOC              '+

            // Edilaine - SOL 190488 / KTN 1909246 - FIM
            '          FROM SALDOORCADO SO,  '+
            '               DESPESAORCAMENTARIA DO,  '+
            '               CONTASORCAMEN CO, GRUPOORCAMEN GRO, ' +        // Edilaine - SOL 190488 / KTN 1909246
            '               PESSOA PO '+
            '         WHERE GRO.IDGRUPOORCAMEN = CO.IDGRUPOORCAMEN  ' +    // Edilaine - SOL 190488 / KTN 1909246
            '           AND CO.IDCONTAORCAMEN = SO.IDCONTAORCAMEN  ' +    // Edilaine - SOL 190488 / KTN 1909246
            '           AND DO.IDDESPESAORC = SO.IDDESPESAORC '+
            '           AND DO.IDFORNECEDOR = PO.IDPESSOA(+) '+
            '           AND (SO.PERIODO = '+ Periodo +') '+               // Edilaine - SOL 190488 / KTN 1909246
            '           AND (CO.IDPLANOORCAMEN = '+ IdPlanoOrc +') '+     // Edilaine - SOL 190488 / KTN 1909246
            //'           AND (SO.EXERCICIO = '+Exercicio+') '+           // Edilaine - SOL 190488 / KTN 1909246 - comentado
            '       ) DESP '+
            // Edilaine - SOL 193146 / KTN 1940385 - fim

            'WHERE ' +
            '   (Desp.IDPLANOPREV      = PPV.IDPLANOPREV(+)) AND ' +       // Edilaine - SOL 190488 / KTN 1909246
            '   (Desp.IDPATRO          = PES.IDPESSOA(+)) AND ' +          // Edilaine - SOL 190488 / KTN 1909246
            //'   (A.IDCONTA'+conta+'   = CTA.IDCONTAORCAMEN) AND ' +      // Edilaine - SOL 190488 / KTN 1909246 - comentado
            '   (A.IDPLANOORCAMEN     = Desp.IDPLANOORCAMEN) AND ' +       // Edilaine - SOL 190488 / KTN 1909246
            //'   (CTA.IDGRUPOORCAMEN   = GRP.IDGRUPOORCAMEN) AND ' +      // Edilaine - SOL 190488 / KTN 1909246 - comentado
            '   (Desp.CODCENTRORESPON  = CTR.CODCENTRORESPON(+)) AND ' +   // Edilaine - SOL 190488 / KTN 1909246
            '   (Desp.CODCENTROCUSTO   = CTC.CODCENTROCUSTO(+)) AND ' +    // Edilaine - SOL 190488 / KTN 1909246
            '   (A.FLGTIPOALTER       = ''T'') AND ' +
            '   (DESP.IDCONTAORCAMEN = A.IDCONTA'+conta+') AND '+          // Edilaine - SOL 193146 / KTN 1940385
            '   (DESP.IDDESPESAORC = A.IDDESPESAORC'+conta+') AND '+         // Edilaine - SOL 193146 / KTN 1940385
            // Edilaine Ferraresi - SOL 163908 / KTN 1403202
            '   (Desp.IDPROGRAMAORCAMEN    = PRG.IDPROGRAMAORCAMEN(+)) AND ' +       // Edilaine - SOL 190488 / KTN 1909246
            '   (Desp.IDTIPO_DEPESAORCAMEN = TPD.IDTIPO_DEPESAORCAMEN(+)) AND ' +    // Edilaine - SOL 190488 / KTN 1909246
            '   (Desp.UNIDNEGOC            = ATP.UNIDNEGOC(+)) AND ' +               // Edilaine - SOL 190488 / KTN 1909246
            // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - FIM

            '   (A.IDOPERACAO = ' + IntToStr(iIdOperacao) + ') AND ' +

            '   (A.DATAREFERENCIA  = TO_DATE(' + QuotedStr(sDataRef) +  ',''DD/MM/YYYY'')) ';

    if iPeriodoOri <> 0 then    // Edilaine - SOL 190488 / KTN 1909246
       sSql := sSql +
           'AND (A.PERIODOORIGEM = ' + IntToStr(iPeriodoOri) + ')';

    sSql := sSql +
            'ORDER BY ' +
            '   CENTRESP'+conta+', A.PERIODOORIGEM, A.EXERCICIOORIGEM '; //, CENTRESPDESTINO, A.PERIODODESTINO, A.EXERCICIODESTINO ';

  // edilaine xxx
  with TStringList.Create do
  try
    Text := sSQL;
    SaveToFile('C:\Planus\Temp\ListaTransEntreCtas.sql');
  finally
    Free;
  end;


    Result := GetDataPacket(sSQL);

  end;
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim
end;


//function TCtrlTransacoesPorGrupo.ListaTransfEfetuadas(sDataRef,ExercicioO,ExercicioD: string; iIdOperacao, iPeriodo: integer): OleVariant;
function TCtrlTransacoesPorGrupo.ListaTransfEfetuadas(sDataRef, IdPlanoOrc : string; iIdOperacao, iPeriodoOri, iPeriodoDest : integer): OleVariant;   // Edilaine - SOL 190488 / KTN 1909246
var
   sSQL: string;
begin      // Edilaine - SOL 193146 / KTN 1940385
   sSQL := ' SELECT ' +
           ' decode(lag(YY.CCDESTINOEXTERNO) over(order by YY.FLGTIPOCONTA, YY.PERIODO, YY.CCDESTINOEXTERNO, ' +
           '                                               YY.PLANODESTINO, YY.PATRODESTINO,   YY.IDCONTADESTINO), ' +
           '        YY.CCDESTINOEXTERNO,''N'',''S'') as LANC_DIF, YY.*  ' +
           '  From(   ' +
           '      Select   DISTINCT ' + //Marcio Sanches Spinosa SOL 210745 Kintana 2030612
           '     NVL(CCDESTINO.CODEXTERNO, -1) AS CCDESTINOEXTERNO, ' +
           // Edilaine - SOL 193146 / KTN 1940385 - fim
           '   A.IDCONTAORIGEM, ' +
           '   A.IDGRUPOORCORIGEM, ' +
           '   SORIGEM.NOMEGRUPOORCAMEN AS GRUPOORIGEM, ' +                                   // Edilaine - SOL 190488 / KTN 1909246
           '   TRIM(CRORIGEM.CODEXTERNO) || '' - '' || CRORIGEM.NOME AS CENTRESPORIGEM, ' +
           '   TRIM(CCORIGEM.CODEXTERNO) || '' - '' || CCORIGEM.NOME AS CENTCUSTORIGEM, ' +
           '   PPVORIGEM.NOME AS PLANOORIGEM, ' +
           '   PORIGEM.NOME AS PATROORIGEM, ' +
           '   A.PERIODOORIGEM, ' +
           '   A.EXERCICIOORIGEM, ' +

           '   A.IDCONTADESTINO, ' +
           '   A.IDGRUPOORCDESTINO, ' +
           '   SDESTINO.NOMEGRUPOORCAMEN AS GRUPODESTINO, ' +                                 // Edilaine - SOL 190488 / KTN 1909246
           '   TRIM(CRDESTINO.CODEXTERNO) || '' - '' || CRDESTINO.NOME AS CENTRESPDESTINO, ' +
           '   TRIM(CCDESTINO.CODEXTERNO) || '' - '' || CCDESTINO.NOME AS CENTCUSTDESTINO, ' +
           '   PPVDESTINO.NOME AS PLANODESTINO, ' +
           '   PDESTINO.NOME AS PATRODESTINO, ' +
           '   A.PERIODODESTINO, ' +
           '   A.EXERCICIODESTINO, ' +
           '   A.IDOPERACAO, ' +
           '   A.IDPESSOA, ' +
           '   A.IDALTERORCAMENTO, ' +
           '   A.IDPLANOORCAMEN, ' +
           //Ricardo SOL 152918 KTN 1146743 comentado - '   A.OBSALTERORCAMEN, ' +
           //Ricardo SOL 152918 KTN 1146743
           '   SUBSTR (A.OBSALTERORCAMEN, 1 ,255) AS OBSALTERORCAMEN, ' +
           '   A.DATAREFERENCIA, ' +
           '   A.NUMALTERACAO, ' +
           '   A.FLGTIPOALTER, ' +
           '   NVL(A.VLRSOLICITADO,0) AS VLRSOLICITADO, ' +


           //Ricardo de Freitas Araújo SOL 153918 KTN 1166699

           //Campos Virtuias para Cálculo de Rateio
           ' 0 AS IDGRUPOORCAMEN,' +
           //' 0 AS IDPLANOORCAMEN, ' +           // Edilaine - SOL 193146 / KTN 1940385
           ' SDESTINO.IDCONTAORCAMEN AS IDCONTAORCAMEN, ' +      // Edilaine - SOL 190488 / KTN 1909246
           ' SDESTINO.CODCENTROCUSTO AS CODCENTROCUSTO, ' +      // Edilaine - SOL 190488 / KTN 1909246
           ' A.EXERCICIODESTINO AS EXERCICIO, ' +
           ' A.PERIODODESTINO AS PERIODO, ' +
           //Campos Virtuais para rateio
           ' 0 AS VALOR, ' +
           QuotedStr('S') + ' AS VALIDAR, ' +
           //Brunno Mattos SOL 154957  KTN 1193108 Adiciona campos VLRORCADO, VLRSOLICITADOORIGEM e VLRSOLICITADODESTINO
           ' 0 AS VLRORCADO, ' +
           ' 0 AS VLRSOLICITADOORIGEM, ' +
           ' 0 AS VLRSOLICITADODESTINO, ' +
           ' 0 AS IDCRITERIORATORC, ' +
           QuotedStr('CRITERIO RATEIO') + ' AS NOMECRITERIO, ' +
           ' 0 AS VALORRATEIO, ' +
           ' 0 AS IDPLANOPREV, ' +
           ' 0 AS IDPATRO,      ' +
           ' ''N'' as LANC_DIF_AUX, ' +
           //Ricardo de Freitas Araújo SOL 153918 KTN 1166699 - fim

           // Edilaine Ferraresi - SOL 163908 / KTN 1403202
           ' NVL(A.FLGTIPOCONTA, ''-'') AS FLGTIPOCONTA, ' +
           ' PGORIGEM.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMAORIGEM, ' +
           ' TDORIGEM.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESAORIGEM, ' +
           ' APORIGEM.NOME AS ATIVPROJORIGEM, ' +

           ' PGDESTINO.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMADESTINO, ' +
           ' TDDESTINO.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESADESTINO, ' +
           ' APDESTINO.NOME AS ATIVPROJDESTINO, ' +
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

           // Edilaine - SOL 193146 / KTN 1940385
           // 'SORIGEM.IDDESPORIGEM AS IDDESPORIGEM, '+       // Edilaine - SOL 190488 / KTN 1909246 - comentado
           // 'SDESTINO.IDDESPDESTINO AS IDDESPDESTINO, '+    // Edilaine - SOL 190488 / KTN 1909246 - comentado
           '  A.IDDESPESAORCORIGEM,  '+                       // Edilaine - SOL 190488 / KTN 1909246
           '  A.IDDESPESAORCDESTINO, '+                       // Edilaine - SOL 190488 / KTN 1909246

           ' SORIGEM.SUBDESPESAORIGEM AS SBORIGEM, '+
           ' SDESTINO.SUBDESPESADESTINO AS SBDESTINO '+
           // Edilaine - SOL 193146 / KTN 1940385 - fim

           'FROM ' +
           '   ALTERORCAMENTO A, ' +

           // Contas de Origem
           //'   CONTASORCAMEN CORIGEM, ' +        // Edilaine - SOL 190488 / KTN 1909246 - comentado
           //'   GRUPOORCAMEN GORIGEM, ' +         // Edilaine - SOL 190488 / KTN 1909246 - comentado
           '   CENTCUST CCORIGEM, ' +
           '   CENTRESPON CRORIGEM, ' +
           '   PLANPREVCONTABIL PPVORIGEM, ' +
           '   PESSOA PORIGEM, ' +

           // Edilaine - SOL 193146 / KTN 1940385
           '(SELECT DISTINCT SO.IDCONTAORCAMEN, SO.EXERCICIO, SO.PERIODO, '+
           '                DO.IDDESPESAORC AS IDDESPORIGEM, '+
           '                DO.IDFORNECEDOR, '+
           '                PO.NOME AS FORNECEDOR, '+
           '                DO.SUBDESPESA, '+
           '                TRIM(NVL(PO.NOME, '''')) || DECODE(PO.NOME, NULL, '''', ''/'') || TRIM(DO.SUBDESPESA) AS SUBDESPESAORIGEM, '+
           // Edilaine - SOL 190488 / KTN 1909246
           '                GRO.NOMEGRUPOORCAMEN,      '+
           '                CO.IDPLANOPREV,            '+
           '                CO.IDPATRO,                '+
           '                CO.IDPLANOORCAMEN,         '+
           '                CO.CODCENTRORESPON,        '+
           '                CO.CODCENTROCUSTO,         '+
           '                CO.IDPROGRAMAORCAMEN,      '+
           '                CO.IDTIPO_DEPESAORCAMEN,   '+
           '                CO.UNIDNEGOC               '+
           // Edilaine - SOL 190488 / KTN 1909246 - fim
           '          FROM SALDOORCADO SO,  '+
           '               DESPESAORCAMENTARIA DO,  '+
           '               CONTASORCAMEN CO, GRUPOORCAMEN GRO, '+         // Edilaine - SOL 190488 / KTN 1909246
           '               PESSOA PO '+
           '         WHERE GRO.IDGRUPOORCAMEN = CO.IDGRUPOORCAMEN  '+     // Edilaine - SOL 190488 / KTN 1909246
           '           AND SO.IDDESPESAORC = DO.IDDESPESAORC '+
           '           AND DO.IDFORNECEDOR = PO.IDPESSOA(+) '+
           '           AND (SO.PERIODO = '+ IntToStr(iPeriodoOri)+') '+  // Edilaine - SOL 190488 / KTN 1909246

           '           AND (SO.EXERCICIO = ' + QuotedStr(Copy(sDataRef,7,4)) + ' ) ' + // Thiago Melo SOL 225755 Kintana 2061004

           '           AND SO.IDCONTAORCAMEN = CO.IDCONTAORCAMEN  '+     // Edilaine - SOL 190488 / KTN 1909246
           '           AND SO.IDPLANOORCAMEN = CO.IDPLANOORCAMEN  -- Thiago Melo ' + #13#10 + // Thiago Melo SOL 217651 Kintana 2048155
// THIAGO MELO SOL 238673 PPM 509672          '     AND DO.IDGRUPOORCAMEN = GRO.IDGRUPOORCAMEN ' + // Thiago Melo SOL 217651 Kintana 2048155
           '           AND (CO.IDPLANOORCAMEN = ' + IdPlanoOrc +' ) ' +  // Edilaine - SOL 190488 / KTN 1909246
           //'           AND (SO.EXERCICIO = '+ExercicioO+') '+          // Edilaine - SOL 190488 / KTN 1909246 - comentado
           '       ) SORIGEM, '+
           '(SELECT DISTINCT SD.IDCONTAORCAMEN, SD.EXERCICIO, SD.PERIODO, '+
           '                DD.IDDESPESAORC AS IDDESPDESTINO, '+
           '                DD.IDFORNECEDOR, '+
           '                PD.NOME AS FORNECEDOR, '+
           '                DD.SUBDESPESA, '+
           '                TRIM(NVL(PD.NOME, '''')) || DECODE(PD.NOME, NULL, '''', ''/'') || TRIM(DD.SUBDESPESA) AS SUBDESPESADESTINO, '+
           // Edilaine - SOL 190488 / KTN 1909246
           '                GD.NOMEGRUPOORCAMEN,      '+
           '                CD.IDPLANOPREV,           '+
           '                CD.IDPATRO,               '+
           '                CD.IDPLANOORCAMEN,        '+
           '                CD.CODCENTRORESPON,       '+
           '                CD.CODCENTROCUSTO,        '+
           '                CD.IDPROGRAMAORCAMEN,     '+
           '                CD.IDTIPO_DEPESAORCAMEN,  '+
           '                CD.UNIDNEGOC              '+
           // Edilaine - SOL 190488 / KTN 1909246 - fim
           '          FROM SALDOORCADO SD,  '+
           '               DESPESAORCAMENTARIA DD,  '+
           '               CONTASORCAMEN CD, GRUPOORCAMEN GD, '+         // Edilaine - SOL 190488 / KTN 1909246
           '               PESSOA PD '+
           '         WHERE GD.IDGRUPOORCAMEN = CD.IDGRUPOORCAMEN  '+     // Edilaine - SOL 190488 / KTN 1909246
           '           AND SD.IDPLANOORCAMEN = CD.IDPLANOORCAMEN ' + // Thiago Melo SOL 217651 Kintana 2048155
           '           AND SD.IDCONTAORCAMEN = CD.IDCONTAORCAMEN ' + // Thiago Melo SOL 217651 Kintana 2048155
           '           AND SD.IDDESPESAORC = DD.IDDESPESAORC '+
           '           AND DD.IDFORNECEDOR = PD.IDPESSOA(+) '+
           '           AND (SD.PERIODO = '+ IntToStr(iPeriodoDest)+') '+ // Edilaine - SOL 190488 / KTN 1909246

           '           AND (SD.EXERCICIO = ' + QuotedStr(Copy(sDataRef,7,4)) + ' ) ' +  // Thiago Melo SOL 225755 Kintana 2061004

           //'           AND SD.IDCONTAORCAMEN = CD.IDCONTAORCAMEN  '+     // Edilaine - SOL 190488 / KTN 1909246 Thiago Melo SOL 217651 Kintana 2048155
//  // THIAGO MELO SOL 238673 PPM 509672          '           AND DD.IDGRUPOORCAMEN = GD.IDGRUPOORCAMEN ' + // Thiago Melo SOL 217651 Kintana 2048155
           '           AND (CD.IDPLANOORCAMEN = ' + IdPlanoOrc +' ) ' +    // Edilaine - SOL 190488 / KTN 1909246
           //'           AND (SD.EXERCICIO = '+ExercicioD+') '+          // Edilaine - SOL 190488 / KTN 1909246
           '       ) SDESTINO,     '+
           // Edilaine - SOL 193146 / KTN 1940385 - fim

           // Edilaine Ferraresi - SOL 163908 / KTN 1403202
           '    PROGRAMAORCAMEN PGORIGEM, ' +
           '    TIPO_DESPESAORCAMEN TDORIGEM, ' +
           '    UNIDNEGOCIO APORIGEM, ' +
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

           // Contas de Destino
           // Edilaine - SOL 190488 / KTN 1909246 - COMENTADO
           {'   (SELECT IDCONTAORCAMEN, IDPLANOORCAMEN, CODCENTROCUSTO, CODCENTRORESPON, ' +
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202
           '   IDPROGRAMAORCAMEN, IDTIPO_DEPESAORCAMEN, UNIDNEGOC, ' +
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim
           //'    IDGRUPOORCAMEN,IDPATRO,IDPLANOPREV ' +                       
           //'    FROM CONTASORCAMEN ) CDESTINO, ' +

           //'   (SELECT IDGRUPOORCAMEN, NOMEGRUPOORCAMEN ' +                  
           //'    FROM GRUPOORCAMEN) GDESTINO, ' +
           } // Edilaine - SOL 190488 / KTN 1909246 - fim

           '   (SELECT CODCENTROCUSTO, CODEXTERNO, NOME ' +
           '    FROM CENTCUST) CCDESTINO, ' +

           '   (SELECT CODCENTRORESPON, CODEXTERNO, NOME ' +
           '    FROM CENTRESPON) CRDESTINO, ' +

           '   (SELECT IDPESSOA,NOME ' +
           '    FROM PESSOA) PDESTINO, ' +

           '   (SELECT IDPLANOPREV, NOME ' +
           '    FROM PLANPREVCONTABIL) PPVDESTINO, ' +


           // Edilaine Ferraresi - SOL 163908 / KTN 1403202
           '   (SELECT IDPROGRAMAORCAMEN, DESCRICAO_PROGRAMAORCAMEN FROM PROGRAMAORCAMEN) PGDESTINO, ' +
           '   (SELECT IDTIPO_DEPESAORCAMEN, DESCRICAO_TIPO_DEPESAOCAMEN FROM TIPO_DESPESAORCAMEN) TDDESTINO, ' +
           '   (SELECT NOME, UNIDNEGOC, UNETIPO, CODORCAMEN FROM UNIDNEGOCIO) APDESTINO ' +
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - FIM

           'WHERE ' +
           '   (SORIGEM.IDPLANOPREV      = PPVORIGEM.IDPLANOPREV(+)) AND ' +     // Edilaine - SOL 190488 / KTN 1909246
           '   (SORIGEM.IDPATRO          = PORIGEM.IDPESSOA(+)) AND ' +          // Edilaine - SOL 190488 / KTN 1909246
           '   (SDESTINO.IDPLANOPREV     = PPVDESTINO.IDPLANOPREV(+)) AND ' +    // Edilaine - SOL 190488 / KTN 1909246
           '   (SDESTINO.IDPATRO         = PDESTINO.IDPESSOA(+)) AND ' +         // Edilaine - SOL 190488 / KTN 1909246
           //'   (A.IDPLANOORCAMEN         = CORIGEM.IDPLANOORCAMEN) AND ' +     // Edilaine - SOL 190488 / KTN 1909246 - comentado
           //'   (A.IDCONTAORIGEM          = CORIGEM.IDCONTAORCAMEN) AND ' +     // Edilaine - SOL 190488 / KTN 1909246 - comentado
           //'   (CORIGEM.IDGRUPOORCAMEN   = GORIGEM.IDGRUPOORCAMEN) AND ' +     // Edilaine - SOL 190488 / KTN 1909246 - comentado
           '   (SORIGEM.CODCENTROCUSTO   = CCORIGEM.CODCENTROCUSTO(+)) AND ' +   // Edilaine - SOL 190488 / KTN 1909246
           '   (SORIGEM.CODCENTRORESPON  = CRORIGEM.CODCENTRORESPON(+)) AND ' +  // Edilaine - SOL 190488 / KTN 1909246
           //'   (A.IDCONTADESTINO         = CDESTINO.IDCONTAORCAMEN) AND ' +    // Edilaine - SOL 190488 / KTN 1909246 - comentado
           //'   (A.IDPLANOORCAMEN         = CDESTINO.IDPLANOORCAMEN) AND ' +    // Edilaine - SOL 190488 / KTN 1909246 - comentado
           //'   (CDESTINO.IDGRUPOORCAMEN  = GDESTINO.IDGRUPOORCAMEN) AND ' +    // Edilaine - SOL 190488 / KTN 1909246 - comentado
           '   (SDESTINO.CODCENTRORESPON = CRDESTINO.CODCENTRORESPON(+)) AND ' + // Edilaine - SOL 190488 / KTN 1909246
           '   (SDESTINO.CODCENTROCUSTO  = CCDESTINO.CODCENTROCUSTO(+)) AND ' +  // Edilaine - SOL 190488 / KTN 1909246 
           '   (A.FLGTIPOALTER           = ''T'') AND ' +

           // Edilaine - SOL 193146 / KTN 1940385
           '   (SORIGEM.IDCONTAORCAMEN(+) = A.IDCONTAORIGEM) AND '+
           '   (SDESTINO.IDCONTAORCAMEN(+) = A.IDCONTADESTINO) AND '+
           // Edilaine - SOL 193146 / KTN 1940385 - fim

           // Edilaine Ferraresi - SOL 163908 / KTN 1403202
           '   (SORIGEM.IDDESPORIGEM(+) = A.IDDESPESAORCORIGEM) AND '+                       // Edilaine - SOL 190488 / KTN 1909246
           '   (SORIGEM.IDPROGRAMAORCAMEN = PGORIGEM.IDPROGRAMAORCAMEN(+)) AND ' +           // Edilaine - SOL 190488 / KTN 1909246
           '   (SORIGEM.IDTIPO_DEPESAORCAMEN = TDORIGEM.IDTIPO_DEPESAORCAMEN(+)) AND ' +     // Edilaine - SOL 190488 / KTN 1909246
           '   (SORIGEM.UNIDNEGOC            = APORIGEM.UNIDNEGOC(+)) AND ' +                // Edilaine - SOL 190488 / KTN 1909246
           '   (SDESTINO.IDPROGRAMAORCAMEN    = PGDESTINO.IDPROGRAMAORCAMEN(+)) AND ' +      // Edilaine - SOL 190488 / KTN 1909246
           '   (SDESTINO.IDTIPO_DEPESAORCAMEN = TDDESTINO.IDTIPO_DEPESAORCAMEN(+)) AND ' +   // Edilaine - SOL 190488 / KTN 1909246
           '   (SDESTINO.UNIDNEGOC            = APDESTINO.UNIDNEGOC(+)) AND ' +              // Edilaine - SOL 190488 / KTN 1909246
           '   (SDESTINO.IDDESPDESTINO(+) = A.IDDESPESAORCDESTINO) AND '+                    // Edilaine - SOL 190488 / KTN 1909246
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - FIM
           '   (A.IDOPERACAO = ' + IntToStr(iIdOperacao) + ') AND ' +

           '   (A.DATAREFERENCIA         = TO_DATE(' + QuotedStr(sDataRef) +  ',''DD/MM/YYYY'')) ';

   if iPeriodoOri <> 0 then
      sSql := sSql +
           'AND (A.PERIODOORIGEM = ' + IntToStr(iPeriodoOri) + ')';

   sSql := sSql +
            // Edilaine - SOL 193146 / KTN 1940385
            ' ) YY ' +
            ' ORDER BY YY.FLGTIPOCONTA, YY.PERIODO, ' +
            '          YY.CENTCUSTDESTINO,              ' +
            '          YY.PLANODESTINO,                 ' +
            '          YY.PATRODESTINO,                 ' +
            '          YY.IDCONTADESTINO                ';

           {'ORDER BY ' +
           '   CENTRESPORIGEM, A.PERIODOORIGEM, A.EXERCICIOORIGEM, CENTRESPDESTINO, A.PERIODODESTINO, '+
           '   A.EXERCICIODESTINO, SORIGEM.SUBDESPESAORIGEM,SDESTINO.SUBDESPESADESTINO ';  }
           // Edilaine - SOL 193146 / KTN 1940385 - fim

    // edilaine xxx         
  with TStringList.Create do
  try
    Text := sSQL;
    SaveToFile('C:\Planus\Temp\ListaTransEntreCtasTodas.sql');
  finally
    Free;
  end;

   Result := GetDataPacket(sSQL);
end;




function TCtrlTransacoesPorGrupo.ListaResxComp(iIdPessoa,
  iIdCompromisso: integer): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' +
           '  ''                                                        '' AS GRUPO,' +
           '  ''                                                        '' AS IDCONTAORCAMEN, ' +
           ' R.IDOPERACAO,' +
           ' PPV.NOME, '+
           ' 0 AS PERIODO, ' +
           ' 0 AS EXERCICIO, ' +
           ' R.NUMRESERVA, ' +
           ' C.CODCENTROCUSTO, ' +
           ' C.CODCENTRORESPON, ' +
           ' C.IDPATRO, ' +
           ' C.IDPLANOPREV, ' +
           ' R.OBSRESERVA, ' +
           ' R.IDRESERVAORCAMEN, ' +

           //Renan Inicio
           '  C.IDPLANOORCAMEN, ' +
           '  C.IDGRUPOORCAMEN, ' +
           //Renan Fim

           '  RxC.IDPESSOA, ' +
           '  RxC.IDCOMPROMISSO, ' +
           '  RxC.IDRESERVA, ' +
           '  TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUSTO, ' +
           '  NVL(R.VLRRESERVA,0) AS VLRRESERVA ' +
           'FROM ' +
           '   RESXCOMP RxC, ' +
           '   RESERVAORCAMEN R, ' +
           '   CONTASORCAMEN C, ' +
           '   CENTCUST CC, ' +
           '   PLANPREVCONTABIL PPV ' +
           'WHERE ' +
           '   (RxC.IDRESERVA    = R.IDRESERVAORCAMEN) AND ' +
           '   (R.FLGRESCOMP     = ''R'') AND ' +
           '   (PPV.IDPLANOPREV  = C.IDPLANOPREV) AND ' +
           '   (R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
           '   (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND ' +
           '   (R.IDPESSOA       = ' + IntToStr(iIdPessoa) + ' ) AND ' +
           '   (R.NUMRESERVA     = ' + IntToStr(iIdCompromisso) + ' )' ;

   Result := GetDataPacket(sSQL);
   //RENAN FIM
end;




function TCtrlTransacoesPorGrupo.ListaReservasDisponiveis(iIdPessoa,iIdGrupoOrc,iIdPlanoOrc,iPeriodo,iExercicio: integer; bAgrupar: Boolean): OleVariant;
var
   sSQL, sSQLTot: string;
begin
   sSQL := 'SELECT ' +
           '  TRIM(G.CODGRUPOORC) || '' - '' || G.NOMEGRUPOORCAMEN AS GRUPO, ' +
           '  R.PERIODO, ' +
           '  R.EXERCICIO, ' +
           '  PPV.NOME, ' +
           '  R.IDOPERACAO,' +
           '  C.IDCONTAORCAMEN,' +
           '  R.IDCONTAORCAMEN, ' +
           '  R.IDRESERVAORCAMEN, ' +
           '  R.NUMRESERVA, ' +

           '  CC.CODCENTROCUSTO, ' +
           '  C.IDPATRO, ' +
           '  C.IDPLANOPREV, ' +
           '  C.CODCENTRORESPON, ' +
           '  R.IDPESSOA, ' +
           '  R.OBSRESERVA, ' +

           //Renan Inicio
           '  C.IDPLANOORCAMEN, ' +
           '  C.IDGRUPOORCAMEN, ' +
           //Renan Fim

           '  TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUSTO, ' +
           '  NVL(R.VLRRESERVA,0) AS VLRRESERVA ' +
           'FROM ' +
           '   RESERVAORCAMEN R, ' +
           '   CONTASORCAMEN C, ' +
           '   GRUPOORCAMEN G, ' +
           '   CENTCUST CC, ' +
           '   PLANPREVCONTABIL PPV ' +
           'WHERE ' +
           '   (R.FLGRESCOMP     = ''R'') AND ' +
           '   (R.FLGRESERVA     = ''A'') AND ' +
           '   (R.IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
           '   (R.IDCONTAORCAMEN = C.IDCONTAORCAMEN)  AND ' +
           '   (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND ' +
           '   (C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
           '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
           '   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND' +
           '   (PPV.IDPLANOPREV  = C.IDPLANOPREV) AND' +
           '   (R.EXERCICIO      = ' + IntToStr(iExercicio)  + ')';

   //Brunno Mattos - KTN 1121522 - SOL 151908
   if iPeriodo <> 0 then
     sSql := sSql +
           ' AND (R.PERIODO      = ' + IntToStr(iPeriodo) +  ')';

   sSql := sSql +
           'ORDER BY ' +
           '   CENTROCUSTO ';

   //RENAN INICIO
   if (bAgrupar) then
   begin
     sSQLTot := 'SELECT GRUPO, PERIODO, EXERCICIO, IDOPERACAO, CODCENTRORESPON, IDPESSOA, '+
             'OBSRESERVA, IDPLANOORCAMEN, IDGRUPOORCAMEN, SUM(VLRRESERVA) AS VLRRESERVA '+
             'FROM ('+
             sSql +
             ') GROUP BY GRUPO, PERIODO, EXERCICIO, IDOPERACAO, CODCENTRORESPON, IDPESSOA, OBSRESERVA, IDPLANOORCAMEN, IDGRUPOORCAMEN';
     Result := GetDataPacket(sSQLTot);
   end else
   Result := GetDataPacket(sSQL);
   //RENAN FIM
end;








function TCtrlTransacoesPorGrupo.ListaResxCompEfetuado(iIdPessoa,
  iIdCompromisso: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT ' +
          '  RxC.IDRESXCOMP, ' +
          '  TRIM(G.CODGRUPOORC) || '' - '' || G.NOMEGRUPOORCAMEN AS GRUPO, ' +
          '  C.IDCONTAORCAMEN, ' +
          '  RxC.IDPESSOA, ' +
          '  RxC.IDCOMPROMISSO, ' +
          '  RxC.IDRESERVA, ' +
          '  R.OBSRESERVA, ' +
          '  TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUSTO, ' +
          '  NVL(R.VLRRESERVA,0) AS VLRRESERVA ' +

          'FROM ' +
          '  RESXCOMP RxC, ' +
          '  RESERVAORCAMEN R, ' +
          '  CONTASORCAMEN C, ' +
          '  CENTCUST CC, ' +
          '  GRUPOORCAMEN G ' +
          'WHERE ' +
          '  (RxC.IDRESERVA     = R.IDRESERVAORCAMEN) AND ' +
          '  (C.IDGRUPOORCAMEN  = G.IDGRUPOORCAMEN) AND ' +
          '  (R.FLGRESCOMP      = ''R'') AND ' +
          '  (R.IDCONTAORCAMEN  = C.IDCONTAORCAMEN) AND ' +
          '  (C.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND ' +
          '  (R.IDPESSOA        = ' + IntToStr(iIdPessoa) +' ) AND ' +
          '  (RXC.IDCOMPROMISSO = ' + IntToStr(iIdCompromisso) + ' ) ';

  Result := GetDataPacket(sSQL);        
end;




function TCtrlTransacoesPorGrupo.VerificaSaldoGrupo(iIdGrupo, iPeriodo,
  iExecicio, iIdPessoa, iIdPlanoOrcamen: integer): boolean;
var
sSql: string; //Brunno Mattos - KTN 1121572 - SOL 151865
begin
       sSql:= '';
       sSql:= sSql + 'SELECT ' +
                     '   NVL(ROUND(SUM(NVL(S.VLRORCADO,0)) - ' +
                     '   SUM(NVL(S.VLRCOMPROMETIDO,0) + NVL(S.VLRRESERVADO,0)),2),0) AS SALDO ' +
                     'FROM SALDOORCADO S, CONTASORCAMEN C ' +
                     'WHERE (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ' +
                     '      (C.IDPESSOA = S.IDPESSOA) AND ' +
                     '      (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND ' +

                     '      (C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ' +
                     '      (C.IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
                     '      (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
                     '      (EXERCICIO        = ' + IntToStr(iExecicio) + ')';
        //Brunno Mattos - KTN 1121572 - SOL 151865 Inicio
        if iPeriodo <> 0 then
           sSql := sSql + 'AND (PERIODO          = ' + IntToStr(iPeriodo) + ')';
        //Brunno Mattos - KTN 1121572 - SOL 151865 Fim

  _Cds.Data := GetDataPacket(sSql);
  Result := (_Cds.FieldByName('SALDO').AsFloat <> 0);
end;




function TCtrlTransacoesPorGrupo.ListaAjustesOrcEfetuados(dDataIni,
  dDataFim: TDateTime; iIdEmpresa, iCodGrupoOrc,iIdOperacao: integer): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' +
           '   A.IDALTERORCAMENTO, ' +
           '   G.IDGRUPOORCAMEN, ' +
           '   TRIM(G.CODGRUPOORC) || '' - '' || G.NOMEGRUPOORCAMEN AS NOMEGRUPOORCAMEN, ' +
           '   TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUSTO, ' +
           '   TRIM(CR.CODEXTERNO) || '' - '' || CR.NOME AS CENTRORESPON, ' +
           '   A.IDOPERACAO, ' +
           '   PV.NOME AS PLANO, ' +
           '   PT.NOME AS PATRO, ' +
           '   A.PERIODOORIGEM ||'' / '' || A.EXERCICIOORIGEM AS PEREXERC, ' +
           '   A.DATAREFERENCIA, ' +
           '   DECODE(A.FLGTIPOALTER,''S'',''Suplementação'',''R'',''Dedução'') AS OPERACAO, ' +
           '   NVL(A.VLRSOLICITADO,0) AS VALOR ' +
           'FROM ' +
           '   ALTERORCAMENTO A, ' +
           '   CONTASORCAMEN C, ' +
           '   GRUPOORCAMEN G, ' +
           '   CENTRESPON CR, ' +
           '   CENTCUST CC, ' +
           '   PESSOA PT, ' +
           '   PLANPREVCONTABIL PV ' +
           'WHERE ' +
           '   (A.FLGTIPOALTER IN (''S'',''R'')) AND ' +
           '   (A.IDCONTAORIGEM   = C.IDCONTAORCAMEN) AND ' +
           '   (A.IDPLANOORCAMEN  = C.IDPLANOORCAMEN) AND ' +
           '   (A.IDPESSOA        = C.IDPESSOA) AND ' +
           '   (C.IDGRUPOORCAMEN  = G.IDGRUPOORCAMEN) AND ' +
           '   (C.IDPLANOORCAMEN  = G.IDPLANOORCAMEN) AND ' +
           '   (C.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND ' +
           '   (C.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND ' +
           '   (C.IDPLANOPREV     = PV.IDPLANOPREV(+)) AND ' +
           '   (C.IDPATRO         = PT.IDPESSOA(+)) AND ' +
           '   (C.IDPESSOA        = ' + IntToStr(iIdEmpresa) + ') ';

           if dDataIni <> 0 then
             sSQL := sSQL + ' AND (A.DATAREFERENCIA >= TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ',''DD/MM/YYYY'')  ) ';

           if dDataFim <> 0 then
             sSQL := sSQL + ' AND (A.DATAREFERENCIA <= TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ',''DD/MM/YYYY'')  ) ';

           if iCodGrupoOrc <> 0 then
             sSQL := sSQL + ' AND (C.IDGRUPOORCAMEN = ' + IntToStr(iCodGrupoOrc) + ') ';

           if iIdOperacao <> 0 then
             sSQL := sSQL + ' AND (A.IDOPERACAO = ' + IntToStr(iIdOperacao) + ') ';


   Result := GetDataPacket(sSQL);           
end;




function TCtrlTransacoesPorGrupo.RateiaValor(iIdPessoa, iExercicioIni,
                                            iPeriodoIni,iExercicioFim,iPeriodoFim,iIdCriterioRateio,
                                            iIdGrupoOrcamen: integer; sCodCentroCusto: string;
                                            //Ricardo SOL 159248 KTN 1337823
                                            iIdPrograma   : integer;
                                            iIdTipoDespesa: integer;
                                            //Ricardo SOL 159248 KTN 1337823 - fim
                                            rValorRateio: Double;
                                            iIdPlano: integer = -1;
                                            iIdPatro: integer = -1;
                                            sAtivProj: string = '';
                                            sCRespon: string = ''): Double;
var
   sSQL: string;
   _CdsAux: TClientDataSet;
begin
   try
      _CdsAux := TClientDataSet.Create(nil);
      // Pega o percentual para rateio do c.custo
      sSQL :=  'SELECT  ' +
               '   NVL((ROUND((VLRCRIRATORC / SOMA.VLRTOTCRIT * 100),2)) / CC.QTDCONTCC,0) AS PERCENTUAL ' +
               'FROM ' +
               '   VALORCRIRATORC, ' +

               '   (SELECT SUM(NVL(VLRCRIRATORC,0)) AS VLRTOTCRIT ' +
               '    FROM VALORCRIRATORC ' +
               '    WHERE (IDCRITERIORATORC = ' + IntToStr(iIdCriterioRateio) + ') AND ' +
               '          (IDPESSOA         = ' + IntToStr(iIdPessoa) + ') AND ' +
               '          (EXERCICIO       >= ' + IntToStr(iExercicioIni) + ') AND ' +
               '          (EXERCICIOFIM    <= ' + IntToStr(iExercicioFim) + ') AND ' +
               '          (' + IntToStr(iPeriodoIni) + ' >= PERIODO) AND ' +
               '          (' + IntToStr(iPeriodoFim) + ' <= PERIODOFIM) AND ' +
               '          (IDEMPRESA        = ' + IntToStr(iIdPessoa) + ') )SOMA, ' +

               '   (SELECT COUNT(IDCONTAORCAMEN) AS QTDCONTCC ' +
               '    FROM CONTASORCAMEN ' +
               '    WHERE (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrcamen) + ' ) AND ' +
               '          (CODCENTROCUSTO = ' + QuotedStr(sCodCentroCusto) + ' ) ';

               if iIdPlano <> -1 then
                  sSQL := sSQL + ' AND (IDPLANOPREV = ' + IntToStr(iIdPlano) + ') ';

               if iIdPatro <> -1 then
                  sSQL := sSQL + ' AND (IDPATRO = ' + IntToStr(iIdPatro) + ') ';

               if Trim(sAtivProj) <> '' then
                  sSQL := sSQL + ' AND (UNIDNEGOC = ' + sAtivProj + ') ';


               sSQL := sSQL +  '  ) CC ' +

               'WHERE ' +
               '    (IDPESSOA         = ' + IntToStr(iIdPessoa) + ') AND ' +
               '    (EXERCICIO       >= ' + IntToStr(iExercicioIni) + ') AND ' +
               '    (EXERCICIOFIM    <= ' + IntToStr(iExercicioFim) + ') AND ' +
               '    (' + IntToStr(iPeriodoIni) + ' >= PERIODO) AND ' +
               '    (' + IntToStr(iPeriodoFim) + ' <= PERIODOFIM) AND ' +
               '    (IDEMPRESA        = ' + IntToStr(iIdPessoa) + ') AND ' +
               '    (IDCRITERIORATORC = ' + IntToStr(iIdCriterioRateio) + ') AND ' +
               '    (CODCENTROCUSTO   = ' + QuotedStr(sCodCentroCusto) + ') ';


               //Ricardo SOL 159248 KTN 1337823
               if iIdPrograma > 0 then
                  sSQL := sSQL +  ' AND  (IDPROGRAMAORCAMEN    = ' + IntToStr(iIdPrograma) + ')';
               if iIdTipoDespesa > 0 then
                  sSQL := sSQL +  ' AND  (IDTIPO_DEPESAORCAMEN = ' + IntToStr(iIdTipoDespesa) + ')';
               //Ricardo SOL 159248 KTN 1337823 - fim





      _CdsAux.Data := GetDataPacket(sSQL);

      Result := RoundCM(((rValorRateio / 100) * _CdsAux.FieldByName('PERCENTUAL').AsFloat),2);

   finally
      FreeAndNil(_CdsAux);
   end;
end;



{
function TCtrlTransacoesPorGrupo.TestaCCustoRatxGrupoOrc(iIdCritRat,iIdGrupoOrc: integer): integer;
begin
   _Cds.Data := GetDataPacket(' SELECT COUNT(CODCENTROCUSTO) AS TOTAL ' +
                              ' FROM VALORCRIRATORC ' +
                              ' WHERE (IDCRITERIORATORC = ' + IntToStr(iIdCritRat) + ') AND ' +
                              '       (CODCENTROCUSTO NOT IN (SELECT CODCENTROCUSTO ' +
                              '                               FROM CONTASORCAMEN ' +
                              '                               WHERE (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + '))) ');
   Result := _Cds.FieldByName('TOTAL').AsInteger;
end;
}

//pendência 27798 - 06/05/2008 - para mostrar quais centros de custo não estão relacionados
function TCtrlTransacoesPorGrupo.TestaCCustoRatxGrupoOrc(iIdCritRat,iIdGrupoOrc: integer): olevariant;
begin
  result := GetDataPacket(' SELECT DECODE(CC.ATIVO, ''S'', ''ATIVO'', ''INATIVO'') AS ATIVO, '+
                          '        PC.DESCPLANCENTCUST, '+
                          '        CC.CODCENTROCUSTO, '+
                          '        CC.CODEXTERNO, '+
                          '        CC.NOME '+
                          ' FROM VALORCRIRATORC V, CENTCUST CC, PLANCENTCUST PC '+
                          ' WHERE (V.IDCRITERIORATORC = ' + IntToStr(iIdCritRat) + ') AND '+
                          '       (V.CODCENTROCUSTO NOT IN (SELECT CODCENTROCUSTO FROM CONTASORCAMEN '+
                          '                                 WHERE (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ' )) '+
                          '        ) AND '+
                          '        V.CODCENTROCUSTO = CC.CODCENTROCUSTO AND '+
                          '        PC.IDPLANCENTCUST = CC.IDPLANCENTCUST ');
end;



function TCtrlTransacoesPorGrupo.AlteraSaldos(ovDadosContas: OleVariant;
  iIdEmpresa: integer): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AlteraSaldos(ovDadosContas, iIdEmpresa);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         _Cds.Data := ovDadosContas;
         _Cds.First;

         // Exibe a barra de progresso
         DoProgresso([3,_Cds.RecNo,_Cds.RecordCount,_Cds.RecNo,'Alterando dotações...']);

         StartTransaction;

         while not _Cds.Eof do
         begin
             // Anda a barra de progresso
             DoProgresso([4,_Cds.RecNo, _Cds.RecordCount, _Cds.RecNo,
                          'Alterando dotação conta ' + _Cds.FieldByName('IDCONTAORCAMEN').AsString + ' - Período ' + _Cds.FieldByName('PERIODO').AsString + '/' + _Cds.FieldByName('EXERCICIO').AsString ]);

             if _Cds.UpdateStatus = usModified then
             begin
                if not ExecSQL(' UPDATE SALDOORCADO ' +
                               ' SET VLRORCADO         = ' + StringReplace(_Cds.FieldByName('VALOR').AsString,',','.',[rfReplaceAll]) +
                               ' WHERE (IDCONTAORCAMEN = ' + QuotedStr(_Cds.FieldByNAme('IDCONTAORCAMEN').AsString) + ') AND ' +
                               '       (IDPLANOORCAMEN = ' + _Cds.FieldByName('IDPLANOORCAMEN').AsString            + ') AND ' +
                               '       (IDPESSOA       = ' + IntToStr(iIdEmpresa)                                   + ') AND ' +
                               '       (PERIODO        = ' + _Cds.FieldByName('PERIODO').AsString                   + ') AND ' +
                               '       (EXERCICIO      = ' + _Cds.FieldByName('EXERCICIO').AsString                 + ')') then
                   raise Exception.Create(MessageInfo);
             end;      

            _Cds.Next;
         end;

         Commit;
         Result := true;
         // Esconde a barra de progresso
         DoProgresso([5]);

      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result      := False;
            Rollback;
            // Esconde a barra de progresso
            DoProgresso([5]);
         end;
      end;
   end;
end;




function TCtrlTransacoesPorGrupo.ListaPatro: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '  P.NOME AS NOME, PT.IDPESSOA AS IDPATRO, PT.IDPESSOA ' +
                           'FROM ' +
                           '   PESSOA P, ' +
                           '   PATRO  PT ' +
                           'WHERE ' +
                           '   P.IDPESSOA   = PT.IDPESSOA ' +
                           'ORDER BY NOME ');
end;




function TCtrlTransacoesPorGrupo.ListaPlano: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '   NOME AS NOME, IDPLANOPREV ' +
                           'FROM ' +
                           '  PLANPREVCONTABIL ' +
                           'WHERE ' +
                           '  ATIVO = ''S'' ' +
                           'ORDER BY  NOME ');
end;




function TCtrlTransacoesPorGrupo.TestaContasSelRaxtGrupoOrc(ovDados: OleVariant;iIdCritRat: integer): boolean;
var
   CdsRelac, CdsCriter: TClientDataSet;
   iNumCCusto: integer;

begin
   try
      CdsRelac          := TClientDataSet.Create(nil);
      CdsCriter         := TClientDataSet.Create(nil);
      iNumCCusto        := 0;
      MessageInfo       := '';

      CdsRelac.Data     := ovDados;
      CdsRelac.Filter   := 'VALIDAR = ''S''';
      CdsRelac.Filtered := True;

      CdsCriter.Data    := GetDataPacket('SELECT ' +
                                         '   VR.CODCENTROCUSTO, TRIM(CC.CODEXTERNO)|| '' - '' ||  CC.NOME AS CENTCUST ' +
                                         'FROM ' +
                                         '   VALORCRIRATORC VR, CENTCUST CC ' +
                                         'WHERE ' +
                                         //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
                                         ' (VR.VLRCRIRATORC > 0) AND ' +
                                         '   (VR.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND ' +
                                         '   (VR.IDEMPRESA      = CC.IDEMPRESA)  AND ' +
                                         '   (VR.IDCRITERIORATORC = ' + IntToStr(iIdCritRat) + ') ' +
                                         'ORDER BY ' +
                                         '   VR.CODCENTROCUSTO');

      // Confere se todos os C.Custos estão nos relacionamentos
      //informados, para poder efetuar o rateio consistente
      while not CdsCriter.Eof do
      begin
         CdsRelac.Filter   := ' CODCENTROCUSTO = ' + QuotedStr(CdsCriter.FieldByName('CODCENTROCUSTO').AsString);
         CdsRelac.Filtered := True;

         if CdsRelac.IsEmpty then
         begin
            if Trim(MessageInfo) <> '' then
               MessageInfo := MessageInfo + CdsCriter.FieldByName('CENTCUST').AsString + #13
            else
               MessageInfo := CdsCriter.FieldByName('CENTCUST').AsString + #13;


            Inc(iNumCCusto);
         end;

         CdsCriter.Next;
      end;

      if Trim(MessageInfo) <> '' then
      begin
         MessageInfo := 'Existe(m) ' + IntToStr(iNumCCusto) + ' Centro de Custo(s) que faz(em) parte do critério de rateio, ' + #13 +
                        'porém está(ão) indisponível(eis) no(s) lançamento(s), no que resultará uma ' + #13 +
                        'inconsistência no rateio. ' + #13 + #13 +
                         MessageInfo;
         Result := False;
      end
      else
         Result := True;


   finally
      FreeAndNil(CdsAux);
   end;
end;




function TCtrlTransacoesPorGrupo.ValidaPlanoTrab(iIdPlanoTrab,
  iExercicio: integer): Boolean;
var
   sSQL: string;  
begin
  sSQL := 'SELECT ' +
          '   IDPLANOTRABALHO, EXERCICIOINI, EXERCICIOFIM ' +
          'FROM ' +
          '   PLANOTRABALHOORC ' +
          'WHERE ' +
          '   (IDPLANOTRABALHO = ' + IntToStr(iIdPlanoTrab) + ') AND ' +
          '   ((EXERCICIOINI BETWEEN ' + IntToStr(iExercicio) +  ' AND ' + IntToStr(iExercicio) +  ') ' +
          ' OR (EXERCICIOFIM BETWEEN ' + IntToStr(iExercicio) +  ' AND ' + IntToStr(iExercicio) +  ')) ';

  _Cds.Data := GetDataPacket(sSQL);

  Result := not (_Cds.IsEmpty);
  if not Result then
     MessageInfo := 'Este plano de trabalho não está vigente para este exercício.';
end;




function TCtrlTransacoesPorGrupo.CancelaReservaCompromisso(
  ovDados: OleVariant; sResOuComp: string;
  bCompPorReserva: boolean; iIdEmpresa: integer; bAjuste : Boolean = False): Boolean;

var
   sSQL: string;
   CdsAux: TClientDataSet;
   bInTrans : boolean;      // Edilaine - SOL 190488 / KTN 1909246
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.CancelaReservaCompromisso(ovDados,sResOuComp,bCompPorReserva);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      bInTrans := InTransaction;      // Edilaine - SOL 190488 / KTN 1909246

      try
         if not bInTrans then     // Edilaine - SOL 190488 / KTN 1909246
            StartTransaction;

         _Cds.Data := ovDados;
         CdsAux    := TClientDataSet.Create(nil);

         // Filtra somente as linhas habilitadas para o processo
         _Cds.Filtered := false;
         _Cds.Filter   := 'VALIDAR = ''S''';
         _Cds.Filtered := true;


         while not _Cds.Eof do
         begin
             if _Cds.FieldByName('FLGRESERVA').AsString <> 'A' then
                raise Exception.Create('Não é possível cancelar uma reserva/compromisso que não esteja no status de ''Aguardando''.');

             // Cancela a reserva/compromisso
             sSQL := 'UPDATE ' +
                     '   RESERVAORCAMEN ' +
                     'SET ' +
                     '   FLGRESERVA = ''C'' ' +
                     'WHERE ' +
                     '   IDRESERVAORCAMEN = ' + _Cds.FieldByName('IDRESERVAORCAMEN').AsString;

             if not ExecSQL(sSQL) then
                raise Exception.Create(MessageInfo);

             // Devolve o saldo
             if not CtrlReservaOrcamen.AtualizaSaldo(iIdEmpresa,
                                                     _Cds.FieldByName('IDPLANOORCAMEN').AsInteger,
                                                     _Cds.FieldByName('PERIODO').AsInteger,
                                                     _Cds.FieldByName('EXERCICIO').AsInteger,
                                                     _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                     sResOuComp,
                                                     _Cds.FieldByName('DATAREFERENCIA').AsDateTime,
                                                     True,
                                                     bCompPorReserva,
                                                     _Cds.FieldByName('VALOR').AsFloat,
                                                     True,
                                                     //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui bAjuste
                                                     bAjuste) then
                raise Exception.Create(CtrlReservaOrcamen.MessageInfo);


             // Se for um compromisso a partir de reservas, cancela
             //todas as reservas relacionadas ao compromisso
             if bCompPorReserva then
             begin
                sSQL := 'UPDATE ' +
                        '   RESERVAORCAMEN ' +
                        'SET ' +
                        '   FLGRESERVA = ''C'' ' +
                        'WHERE ' +
                        '   IDRESERVAORCAMEN = (SELECT IDRESERVA FROM RESXCOMP WHERE IDCOMPROMISSO = ' + _Cds.FieldByName('IDRESERVAORCAMEN').AsString + ') ';
                if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);
             end;


            _Cds.Next;
         end;

         if not bInTrans then     // Edilaine - SOL 190488 / KTN 1909246
            Commit;

         Result        := true;
         _Cds.Filtered := false;
         FreeAndNil(CdsAux);


      except
         on E:Exception do
         begin
            if not bInTrans then     // Edilaine - SOL 190488 / KTN 1909246
               Rollback;
            FreeAndNil(CdsAux);
            _Cds.Filtered := false;
            MessageInfo   := E.Message;
            Result        := False;
         end;
      end;
   end;
end;




function TCtrlTransacoesPorGrupo.RetornaFiltroUsuario(iIdUsuario: integer;
         sCodCentroRespon: string): string;
var
   sSQL: string;
   CdsAux: TClientDataSet;
begin
   try
      CdsAux := TClientDataSet.Create(nil);
      // Verifica se o usuário tem acesso ao centro de responsabilidade
      sSQL := ' SELECT CODCENTRORESPON ' +
              ' FROM PESSOAXCRESP ' +
              ' WHERE (IDPESSOAACESSO = ' + IntToStr(iIdUsuario) + ') AND ' +
              '       (TRIM(CODCENTRORESPON) = ' + QuotedStr(Trim(sCodCentroRespon)) + ') ';

      CdsAux.Data := GetDataPacket(sSQL);

      // Se o usuário não estiver habilitado ao C.Respon, validar a operação pelo C.Custo
      if CdsAux.IsEmpty then
      begin
        Result := ' (C.CODCENTROCUSTO IN ' +
                  '      (SELECT CODCENTROCUSTO '+
                  '       FROM USCCUSTO ' +
                  '       WHERE IDUSUARIO = ' + IntToStr(iIdUsuario) + ')) AND ';


      end
      else
      begin
         Result := '    (C.CODCENTRORESPON IN ' +
                   '         (SELECT CODCENTRORESPON ' +
                   '          FROM PESSOAXCRESP ' +
                   '          WHERE IDPESSOAACESSO = ' + IntToStr(iIdUsuario) + ' )) AND ';
      end;
   finally
       FreeAndNil(CdsAux);
   end;
end;




function TCtrlTransacoesPorGrupo.ListaContasParaTransf(iPeriodo,
                                                       iExercicio,
                                                       iIdEmpresa,
                                                       iIdPlanOrc, iIdGrupoOrc,
                                                       iIdUsuario: integer;
                                                       iUnidNegoc: integer;
                                                       sCodCentroRespon: string;
                                                       iIdPlanoPrev: integer;
                                                       iIdPatro: integer;
                                                       // Edilaine Ferraresi - SOL 163908 / KTN 1403202
                                                       iIdPrograma : integer;
                                                       iIdTipoDespesa : integer;
                                                       // Edilaine Ferraresi - SOL 163908 / KTN 1403202- fim
                                                       bSomenteCCAtivo: Boolean;
                                                       //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
                                                       AParamEntradaEspecial : TParamEntradaEspecial
                                                       //Fim    - VANDER SOL 172384/9361 KINTANA 1653184

                                                       // Thiago Melo Sol 209723 Kintana 2023107
                                                       ; flgTipo : SmallInt
                                                       // Thiago Melo Sol 209723 Kintana 2023107

                                                       ): OleVariant;
var
   sSQL, sAux: string;
   sRateio   : string;  // Edilaine - SOL 193146 / KTN 1940385
begin
   sRateio := 'SELECT  ' +
              '       DECODE(LAG(YY.CODEXTERNO) OVER(ORDER BY /* YY.PERIODO, */ YY.CODEXTERNO, YY.PLANO, YY.PATRO, YY.IDCONTAORCAMEN), '+
              '       YY.CODEXTERNO, ''N'',''S'') AS LANC_DIF, YY.* '+
              '  FROM (  ';

   sSQL := ' SELECT DISTINCT ' +
           '    DECODE(A.IDCONTAORIGEM,'''',(DECODE(RS.IDCONTAORCAMEN,'''',''S'',''N'')),''N'') AS VALIDAR, ' +
           '    NVL(CC.CODEXTERNO, ''-1'') AS CODEXTERNO, '+  // Edilaine - SOL 193146 / KTN 1940385
           //Brunno Mattos SOL 154957  KTN 1193108 - Adiciona C.IDPESSOA e VLRSOLICITADO
           '    C.IDPESSOA, ' +
           '    0 AS VLRSOLICITADO, ' + //campo virtual, será preenchido na rorina calculaRateio e posteriormente servirá para atualizar a tabela SALDOORCADO
           '    C.IDPLANOORCAMEN, ' +
           '    C.IDGRUPOORCAMEN, ' +
           '    G.CODGRUPOORC, ' +
           '    G.NOMEGRUPOORCAMEN, ' +
           '    PPV.NOME AS PLANO, ' +
           '    P.NOME AS PATRO, ' +
           '    U.NOME AS ATIVPROJ, ' +
           '    C.IDCONTAORCAMEN, ' +
           '    TRIM(R.CODEXTERNO)  || '' - '' || R.NOME AS CENTRORESPON, ' +
           '    TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUSTO, ' +
           '    TRIM(CC.CODCENTROCUSTO) AS CODCENTROCUSTO, ' +
           '    C.UNIDNEGOC, ' +
           '    C.IDPLANOPREV, ' +
           '    C.IDPATRO, ' +
           '    C.CODCENTRORESPON, ' +
           //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
           //'    0 AS VALOR, ' +   // Edilaine - SOL 193146 / KTN 1940385

           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           '  ''S'' AS SELECIONADO, ' + CR_LF +   // Edilaine - SOL 193146 / KTN 1940385
           '  Desp.Fornecedor,' +
           '  Desp.SUBDESPESA as SUBDESP,' +
           '  trim(NVL(DESP.FORNECEDOR,'''')) || decode(DESP.FORNECEDOR, null, '''', ''/'') || trim(DESP.SUBDESPESA) AS SUBDESPESA, ' +
           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184

           '  Desp.IDDESPESAORC, ';   // Edilaine - SOL 193146 / KTN 1940385

           // Todos os período do exercício
           if iPeriodo = 0 then
              sSQL := sSQL + '   TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',Now)) + ', ''DD/MM/YYYY'') AS DATAREFERENCIA, '
           else
              sSQL := sSQL + '   TO_DATE(''01/' +  IntToStr(iPeriodo) + '/' + IntToStr(iExercicio) + ''', ''DD/MM/YYYY'') AS DATAREFERENCIA, ';

           sSQL := sSQL +

           //Ricardo de Freitas SOL 152921 KINTANA 1146742 - comentado '    ' + IntToStr(iPeriodo) + ' AS PERIODO, ' +
           //Ricardo de Freitas SOL 152921 KINTANA 1146742
//           '    PER.PERIODO AS PERIODO, ' +// Marcio Sanches Spinosa SOL 219321 Kintana 2051325
           '    S.PERIODO, ' +// Marcio Sanches Spinosa SOL 219321 Kintana 2051325
           '    ' + IntToStr(iExercicio) + ' AS EXERCICIO, ' +
           '    NVL(S.VLRORCADO,0) AS VALOR, ' +
           '    NVL(S.VLRORCADO,0) AS VLRORCADO, ' +
           '    NVL(S.VLRTRANSF,0) as VLRTRANSF, ' + //Brunno Mattos SOL 154957  KTN 1193108
           '    NVL(S.SALDODISP,0) AS SALDODISP, ' +  //Brunno Mattos - KTN 1150546 - SOL 153170
           '    PG.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' +     // Edilaine Ferraresi - SOL 163908 / KTN 1403202
           '    TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA ' + // Edilaine Ferraresi - SOL 163908 / KTN 1403202
           ' FROM ' +
           '    CONTASORCAMEN C,  GRUPOORCAMEN G,  ' +
           '    PESSOA P,    PLANPREVCONTABIL PPV, ' +
           '    CENTRESPON R,    CENTCUST CC,    UNIDNEGOCIO U, ' +
           '    ALTERORCAMENTO A, ' +
           '    RESERVAORCAMEN RS, ' +

           //Ricardo de Freitas SOL 152921 KINTANA 1146742
//           '    PERIODOORCAMEN PER, ' + // Marcio Sanches Spinosa SOL 219321 Kintana 2051325
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202
           '    PROGRAMAORCAMEN PG, ' +
           '    TIPO_DESPESAORCAMEN TD, ' +
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

           //Ricardo de Freitas SOL 152921 KINTANA 1146742 - adicionado o PERIODO
           //Brunno Mattos SOL 154957  KTN 1193108 - adiciona "VLRTRANSF" e "- NVL(VLRTRANSF,0)"
           //'   (SELECT IDCONTAORCAMEN, IDPLANOORCAMEN, PERIODO, VLRTRANSF, NVL(SUM(NVL(VLRORCADO, 0) - NVL(VLRTRANSF,0)), 0) AS VLRORCADO, ' +
//           '   (SELECT IDCONTAORCAMEN, IDPLANOORCAMEN, TO_CHAR(SYSDATE, ''MM'') PERIODO,   /* VLRTRANSF, SUM(NVL(VLRORCADO, 0)) AS VLRORCADO, */ ' +//Marcio Sanches Spinosa SOL 219321 Kintana 2051325
           '   (SELECT IDCONTAORCAMEN, IDPLANOORCAMEN, TO_CHAR(SYSDATE, ''MM'') PERIODO,   ' + //Marcio Sanches Spinosa SOL 219321 Kintana 2051325

           //Marcio Sanches Spinosa SOL 210745 Kintana 2030612 - Inicio
           //Brunno Mattos - KTN 1150546 - SOL 153170
           //'   NVL(ROUND(SUM(NVL(VLRORCADO, 0)) - SUM(NVL(VLRCOMPROMETIDO, 0) + NVL(VLRRESERVADO, 0)),2),0) AS SALDODISP, ' +
           // Edilaine - SOL 190488 / KTN 1909246 - o VLRORCADO não será alterado pelas transf e suplementacoes,
           // o valor será composto pelos campos de ajuste nas consultas que retornem o saldo das contas
           //'   NVL(ROUND(SUM(NVL(VLRORCADO, 0)) - SUM(NVL(VLRCOMPROMETIDO, 0) + NVL(VLRRESERVADO, 0)) + SUM(NVL(VLRAJUSTE,0)) + SUM(NVL(VLRTRANSF, 0)),2),0) AS SALDODISP, ' +
           //Marcio Sanches Spinosa SOL 219321 Kintana 2051325 - inicio
//             'NVL(ROUND((SUM(NVL(VLRORCADO, 0)) - '+
//             '                    SUM(NVL(VLRCOMPROMETIDO, 0)) + ' +
//             '                    sum(NVL(VLRREALIZADO, 0))) + '+ //Marcio Sanches Spinosa SOL 209766 Kintana 2040660
//             '                    SUM(NVL(VLRAJUSTE, 0)) + '+
//             '                    SUM(NVL(VLRTRANSF, 0)), 2), '+
//             '              0) AS SALDODISP, '+

               '  sum(NVL(VLRORCADO, 0)) VLRORCADO, '+
               '  sum(NVL(VLRTRANSF, 0)) VLRTRANSF, '+
               '  sum(NVL(ROUND(NVL(VLRORCADO, 0) - ' +
               '           (NVL(VLRCOMPROMETIDO, 0) + NVL(VLRREALIZADO, 0)) + '+
               '           (NVL(VLRAJUSTE, 0) + NVL(VLRTRANSF, 0)) '+
               '      ,2),0)) AS SALDODISP, '+
               //Marcio Sanches Spinosa SOL 219321 Kintana 2051325 - Fim


           //Marcio Sanches Spinosa SOL 210745 Kintana 2030612 - Fim
           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           '         IDDESPESAORC' +
           //FIM    - VANDER SOL 172384/9361 KINTANA 1653184
           '    FROM SALDOORCADO ';

           _Cds.Data := GetDataPacket('SELECT FLGTIPOSALDO FROM PARAMORCAMENTO WHERE IDPESSOA = ' + IntToStr(iIdEmpresa));
           if not _Cds.IsEmpty then
           begin
              case _Cds.FieldByName('FLGTIPOSALDO').AsString[1] of
                 // Por período
                 'P': begin

                         //Ricardo de Freitas SOL 152921 KINTANA 1146742 - comentado
                         {sSQL := sSQL +  '  WHERE PERIODO   = ' + IntToStr(iPeriodo) + ' AND ' +
                                         '        EXERCICIO = ' + IntToStr(iExercicio);}

                         //Ricardo de Freitas SOL 152921 KINTANA 1146742 - Início
                         sSQL := sSQL +  '  WHERE EXERCICIO = ' + IntToStr(iExercicio);
                         //Marcio Sanches Spinosa SOL 219321 Kintana 2051325 - Inicio
                         //Período Mensal
//                         if iPeriodo > 0 then
//                            sSQL := sSQL + ' AND PERIODO = ' + IntToStr(iPeriodo);
                         //Ricardo de Freitas SOL 152921 KINTANA 1146742 - Fim
                         //Marcio Sanches Spinosa SOL 219321 Kintana 2051325 - fim

                      end;

                 // Acumulado do exercício
                 'E': begin
                         sSQL := sSQL +  '  WHERE EXERCICIO = ' + IntToStr(iExercicio);
                      end;

                 // Acumulado até o período
                 'A': begin
                         //Ricardo de Freitas SOL 152921 KINTANA 1146742 - comentado
                         {sSQL := sSQL +  '  WHERE PERIODO   <= ' + IntToStr(iPeriodo) + ' AND ' +
                                         '        EXERCICIO <= ' + IntToStr(iExercicio);}
                         //Ricardo de Freitas SOL 152921 KINTANA 1146742 - Início
                         sSQL := sSQL +  '  WHERE EXERCICIO <= ' + IntToStr(iExercicio);

                         //Marcio Sanches Spinosa SOL 219321 Kintana 2051325 - Inicio
                         //Período Mensal
//                         if iPeriodo > 0 then
//                            sSQL := sSQL + ' AND PERIODO   <= ' + IntToStr(iPeriodo);
                         //Ricardo de Freitas SOL 152921 KINTANA 1146742 - Fim
                         //Marcio Sanches Spinosa SOL 219321 Kintana 2051325 - Fim
                      end;
              end;
           end
           else
//              sSQL := sSQL +  '  WHERE PERIODO   <= -1 AND ' + //Marcio Sanches Spinosa SOL 219321 Kintana 2051325
              sSQL := sSQL +  '  WHERE  ' +  //Marcio Sanches Spinosa SOL 219321 Kintana 2051325
                              '        EXERCICIO <= -1 ';

           sSQL := sSQL +
           //Ricardo de Freitas SOL 152921 KINTANA 1146742 - adicionado o PERIODO
           //Brunno Mattos SOL 154957  KTN 1193108 - adiciona VLRTRANSF
//           '    GROUP BY IDCONTAORCAMEN, IDPLANOORCAMEN, /* TO_CHAR(SYSDATE, ''MM'') PERIODO,  VLRTRANSF,*/ IDDESPESAORC) S, ' +  //Marcio Sanches Spinosa SOL 219321 Kintana 2051325
           '    GROUP BY IDCONTAORCAMEN, IDPLANOORCAMEN,  IDDESPESAORC) S, ' + //Marcio Sanches Spinosa SOL 219321 Kintana 2051325
           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           '  (Select' +
           '    D.IDDESPESAORC,' +
           '    D.IDFORNECEDOR,' +
           '    P.NOME AS FORNECEDOR,' +
           '    D.FLGSTATUSDESPESA,' +
           '    DECODE(D.FLGSTATUSDESPESA, ''I'', ''INATIVO'', ''ATIVO'') AS STATUS,' +
           '    D.NATUREZA,' +
           '    D.SUBDESPESA,' +
           '    D.ACAO,' +
           '    D.DESCRICAO,' +
           '    D.IDPESSOA' +
           '   From DESPESAORCAMENTARIA D, PESSOA P' +
           '   Where D.IDFORNECEDOR = P.IDPESSOA(+)) Desp ' +
           //FIM    - VANDER SOL 172384/9361 KINTANA 1653184
           ' WHERE ' +
           '    (PPV.IDPLANOPREV(+)   = C.IDPLANOPREV) AND ' +
           '    (P.IDPESSOA(+)        = C.IDPATRO) AND ' +
           '    (R.CODCENTRORESPON(+) = C.CODCENTRORESPON) AND ' +
           '    (C.UNIDNEGOC          = U.UNIDNEGOC(+)) AND ' +
           '    (C.IDCONTAORCAMEN     = A.IDCONTAORIGEM(+)) AND ' +
           '    (C.IDPLANOORCAMEN     = A.IDPLANOORCAMEN(+)) AND ' +
           '    (C.IDPESSOA           = A.IDPESSOA(+)) AND ' +
           '    (C.IDCONTAORCAMEN     = RS.IDCONTAORCAMEN(+)) AND ' +
           '    (C.IDPLANOORCAMEN     = RS.IDPLANOORCAMEN(+)) AND ' +
           '    (C.IDPESSOA           = RS.IDPESSOA(+)) AND ' +
           '    (C.IDGRUPOORCAMEN     = G.IDGRUPOORCAMEN) AND ' +
           '    (C.TIPOCALCORCADO     = ''V'') AND ' +
           '    (C.FLGATIVA           = ''A'') AND ' +
           '    (C.IDPLANOORCAMEN     = ' + IntToStr(iIdPlanOrc) + ' ) AND ';

           //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
           //Centro de Custo
           TParamEntradaEspecial.GetParam(sSQL, 'C.CODCENTROCUSTO',  AParamEntradaEspecial, tpeeCentroCusto);
           //Plano Orçamentário
           //TParamEntradaEspecial.GetParam(sSQL, 'C.IDPLANOORCAMEN',  AParamEntradaEspecial, tpeePlanoOrc);  // Edilaine - SOL 190311 / KTN 1799290 - comentado
           //Sub-Despesa
           TParamEntradaEspecial.GetParam(sSQL, 'S.IDDESPESAORC', AParamEntradaEspecial, tpeeSubDespesa);
           //FIM    - VANDER SOL 172384/9361 KINTANA 1653184


           if Trim(sCodCentroRespon) <> '' then // Alterado por FHBS - SOL: 151079 KTN: 1103455
             sSQL := sSQL + RetornaFiltroUsuario(iIdUsuario,sCodCentroRespon);


           sSQL := sSQL +
           '    (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND ' +
//pendência 26595 - 26/11/2007
//           '    (CC.ATIVO = ''S'') AND ' +

           // Alterado por FHBS - SOL: 151079 KTN: 1103455
           //'    (CC.IDEMPRESA     = ' + IntToStr(iIdEmpresa)   + ' ) AND ' +
           '    (C.IDEMPRESA = CC.IDEMPRESA(+) ) AND ' +


           '    (C.IDPESSOA       = ' + IntToStr(iIdEmpresa)   + ' ) AND ' +
           '    (C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ' ) AND ' +
           '    (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN(+)) AND ' +
           '    (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN(+)) AND ' +

           //Ricardo de Freitas SOL 152921 KINTANA 1146742 - adicionado clásula JOIN
//           '    (PER.PERIODO = S.PERIODO) ' + //Marcio Sanches Spinosa SOL 219321 Kintana 2051325
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202
           //Marcio Sanches Spinosa SOL 219321 Kintana 2051325
//           '  AND (C.IDPROGRAMAORCAMEN = PG.IDPROGRAMAORCAMEN(+)) ' + //Marcio Sanches Spinosa SOL 219321 Kintana 2051325
           '  (C.IDPROGRAMAORCAMEN = PG.IDPROGRAMAORCAMEN(+)) ' + //Marcio Sanches Spinosa SOL 219321 Kintana 2051325
//           '  AND (C.IDTIPO_DEPESAORCAMEN = TD.IDTIPO_DEPESAORCAMEN(+)) ';//Marcio Sanches Spinosa SOL 219321 Kintana 2051325
           '  AND (C.IDTIPO_DEPESAORCAMEN = TD.IDTIPO_DEPESAORCAMEN) ';//Marcio Sanches Spinosa SOL 219321 Kintana 2051325
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim
           //Ricardo de Freitas SOL 152921 KINTANA 1146742 - adicionado clásula JOIN
 //         if (iPeriodo > 0) then
//              sSQL := sSQL + ' AND PER.PERIODO = ' + IntToStr(iPeriodo);
           //Ricardo de Freitas SOL 152921 KINTANA 1146742 - Fim

           //Filtros da tela
           sAux := '';
           if iUnidNegoc <> 0 then
              sAux := ' AND (C.UNIDNEGOC  = ' + IntToStr(iUnidNegoc)  + ') ';

           // Edilaine Ferraresi - SOL 163908 / KTN 1403202
           if iIdPrograma > 0 then
              sAux := sAux + ' AND (C.IDPROGRAMAORCAMEN = ' + IntToStr(iIdPrograma)  + ') ';

           if iIdTipoDespesa > 0 then
              sAux := sAux + ' AND (C.IDTIPO_DEPESAORCAMEN = ' + IntToStr(iIdTipoDespesa)  + ') ';
           // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim
           if iIdPlanoPrev <> - 1 then
           begin
              if Trim(sAux) <> '' then
                 sAux := sAux + ' AND (C.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev)+ ') '
              else
                 sAux := ' AND (C.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev)+ ') ';
           end;

           if iIdPatro <> - 1 then
           begin
              if Trim(sAux) <> '' then
                 sAux := sAux + ' AND (C.IDPATRO = ' + IntToStr(iIdPatro)+ ') '
              else
                 sAux := ' AND (C.IDPATRO = ' + IntToStr(iIdPatro)+ ') ';
           end;

           // Alterado por FHBS - SOL: 151660 KTN: 1115295
           if bSomenteCCAtivo then

              // Thiago Melo SOL 239565 PPM 519993
              {sSQL := sSQL + ' and nvl(CC.ATIVO,''S'') = ''S'' ' + CR_LF +
                             ' and nvl(CC.STATUSGRUPOCDC,''A'') = ''A'' ' + CR_LF;}
              sSQL := sSQL + ' and nvl(CC.STATUSGRUPOCDC,''A'') = ''A'' ' + CR_LF;

              // Thiago Melo SOL 239565 PPM 519993
           // Fim - Alterado por FHBS - SOL: 151660 KTN: 1115295


           //Ricardo de Freitas SOL 152921 KINTANA 1146742 - altera clásula
           //ORDER BY conforme período

           //VANDER SOL 172384/9361 KINTANA 1653184
           sSQL := sSQL +
//                ' AND S.IDDESPESAORC = Desp.IDDESPESAORC(+)';//Marcio Sanches Spinosa SOL 219321 Kintana 2051325
                ' AND S.IDDESPESAORC = Desp.IDDESPESAORC ';//Marcio Sanches Spinosa SOL 219321 Kintana 2051325

      // Thiago Melo Sol 209723 Kintana 2023107
      sRateio := sRateio + sSQL + sAux;
                 if flgTipo = 0 then begin
//                   sRateio := sRateio + ' AND (S.SALDODISP <> 0) ';
                   sRateio := sRateio + ' AND (S.SALDODISP > 0) ';  //Marcio Sanches Spinosa SOL 217025 Kintana 2046511
                 end;
                 sRateio := sRateio +
                 ' ) YY '+
//                 'ORDER BY  YY.PERIODO,  YY.CENTROCUSTO, YY.PLANO, YY.PATRO, YY.IDCONTAORCAMEN';//Marcio Sanches Spinosa SOL 219321 Kintana 2051325
                 'ORDER BY  YY.CENTROCUSTO, YY.PLANO, YY.PATRO, YY.IDCONTAORCAMEN'; //Marcio Sanches Spinosa SOL 219321 Kintana 2051325
      // Thiago Melo Sol 209723 Kintana 2023107


{ // Edilaine - SOL 193146 / KTN 1940385
           if iPeriodo > 0 then
              //Período Mensal
              sSQL := sSQL + sAux + ' ORDER BY ' +
                                    ' CENTROCUSTO,PLANO,PATRO,PER.PERIODO '
           else
              //Período Anual
              sSQL := sSQL + sAux + ' ORDER BY ' +
                                    ' PER.PERIODO, CENTROCUSTO,PLANO,PATRO';
} // Edilaine - SOL 193146 / KTN 1940385 - fim

   Result := GetDataPacket( sRateio {sSQL});    // Edilaine - SOL 193146 / KTN 1940385
end;




function TCtrlTransacoesPorGrupo.TestaVigenciaRateio(iPerIni, iPerFim,
  iExeIni, iExeFim, iIdCriterio,iIdPessoa,iIdEmpresa: integer): boolean;
var
   CdsAux: TClientDataSet;
   sSQL: string;
begin
   try
      CdsAux := TClientDataSet.Create(nil);
      sSQL   := 'SELECT COUNT(IDCRITERIORATORC) AS TOTAL ' +
                 'FROM VALORCRIRATORC ' +
                 'WHERE (IDCRITERIORATORC = ' + IntToStr(iIdCriterio) + ') AND ' +
                 '      (IDPESSOA         = ' + IntToStr(iIdPessoa) + ') AND ' +
                 '      (EXERCICIO       >= ' + IntToStr(iExeIni) + ') AND ' +
                 '      (EXERCICIOFIM    <= ' + IntToStr(iExeFim) + ') AND ' +
                 '      (IDEMPRESA        = ' + IntToStr(iIdEmpresa) + ') ';

                 // Se o período for informado (descartando a opção anual), verifica-se o mesmo
                 if iPerIni > 0 then
                    sSQL := sSQL + '  AND (' + IntToStr(iPerIni) + ' >= PERIODO) ' +
                                   '  AND (' + IntToStr(iPerFim) + ' <= PERIODOFIM)  ';

      CdsAux.Data := GetDataPacket(sSQL);

      Result := (CdsAux.FieldByName('TOTAL').AsInteger > 0);

   finally
      FreeAndNil(CdsAux)
   end;
end;




function TCtrlTransacoesPorGrupo.ListaGrupoRealxContabxFluxo(
  cContabOuFluxo: Char; iIdPessoa, iPeriodo,
  iExercicio,iIdPlanoOrc: integer; iIdGrupoOrc: integer): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' +
           '   G.IDGRUPOORCAMEN, ' +
           '   TRUNC(G.CODGRUPOORC) || '' - '' || G.NOMEGRUPOORCAMEN AS NOMEGRUPO,' +
           '   DECODE(C.TIPOCALCREALIZADO,''P'',''Contabilidade'',''X'',''Fluxo de Caixa'') AS DESCTIPOCALC,' +
           '   SUM(NVL(COMPCONTAS.VALOR,0)) AS VALOR, ' +
           '   SUM(NVL(S.VLRREALIZADO,0)) AS VLRREALIZADO, ' +
           '   SUM(NVL(COMPCONTAS.VALOR,0)) - SUM(NVL(S.VLRREALIZADO,0)) AS DIFERENCA  ' +

           'FROM ' +
           '   CONTASORCAMEN C, ' +
           '   GRUPOORCAMEN G, ' +

           '   (SELECT IDCONTAORCAMEN, IDPLANOORCAMEN,VLRREALIZADO ' +
           '    FROM SALDOORCADO ' +
           '    WHERE PERIODO           = ' + IntToStr(iPeriodo)   + ' AND ' +
           '          EXERCICIO         = ' + IntToStr(iExercicio) + ' AND ' +
           '          IDPESSOA          = ' + IntToStr(iIdPessoa)  + 
           '    )S, ' +

           '(SELECT ' +
           '   CP.IDPLANOORCAMEN, CP.IDCONTAORCAMEN, ' +
           '   SUM(PLSALDO.VALOR) AS VALOR  ' +
           ' FROM ' +
           '   (SELECT IDPLANOORCAMEN, IDCONTAORCAMEN, ' +
           '           PLANO, PLACONTA, CODCENTROCUSTO, ' +
           '           UNIDNEGOC, IDPLANOPREV, IDPATRO, ' +
           '           IDEMPRESA ' +
           '    FROM COMPCONTASORCAMEN) CP, ' +

           '   (SELECT SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR, ' +
           '           PLACONTA,PLANO,CODCENTROCUSTO,IDEMPRESA, ' +
           '           UNIDNEGOC, IDPLANOPREV, IDPATRO ' +
           '    FROM PLANOSALDO ' +
           '    WHERE ' +
           '          (PERNUMERO    = ' + IntToStr(iPeriodo) + ') AND ' +
           '          (PEREXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
           '          (IDPESSOA     = ' + IntToStr(iIdPessoa) + ') ' +

           '    GROUP BY ' +
           '           PLACONTA,PLANO,CODCENTROCUSTO,IDEMPRESA, ' +
           '           UNIDNEGOC, IDPLANOPREV, IDPATRO) PLSALDO ' +
           ' WHERE ' +
           '    (CP.PLACONTA       = PLSALDO.PLACONTA(+)) AND ' +
           '    (CP.PLANO          = PLSALDO.PLANO(+)) AND ' +
           '    ((CP.CODCENTROCUSTO IS NULL) OR ((CP.CODCENTROCUSTO  = PLSALDO.CODCENTROCUSTO) AND ' +
           '                                     (CP.IDEMPRESA       = PLSALDO.IDEMPRESA))) AND ' +
           '    ((CP.UNIDNEGOC           IS NULL) OR (CP.UNIDNEGOC   = PLSALDO.UNIDNEGOC)) AND ' +
           '    ((CP.IDPLANOPREV         IS NULL) OR (CP.IDPLANOPREV = PLSALDO.IDPLANOPREV)) AND ' +
           '    ((CP.IDPATRO             IS NULL) OR (CP.IDPATRO     = PLSALDO.IDPATRO)) ' +
           ' GROUP BY ' +
           '   CP.IDPLANOORCAMEN, CP.IDCONTAORCAMEN) COMPCONTAS ' +

           'WHERE ' +
           '   (C.IDGRUPOORCAMEN    = G.IDGRUPOORCAMEN) AND ' +
           '   (C.IDPLANOORCAMEN    = COMPCONTAS.IDPLANOORCAMEN(+)) AND ' +
           '   (C.IDCONTAORCAMEN    = COMPCONTAS.IDCONTAORCAMEN(+)) AND ' +
           '   (C.IDCONTAORCAMEN    = S.IDCONTAORCAMEN(+)) AND ' +
           '   (C.IDPLANOORCAMEN    = S.IDPLANOORCAMEN(+)) AND ';

           if iIdGrupoOrc <> 0 then
              sSQL := sSQL + ' (G.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ';

           sSQL := sSQL +
           '   (C.IDPLANOORCAMEN    = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
           '   (C.TIPOCALCREALIZADO = ' + QuotedStr(cContabOuFluxo) + ')  ' +

           'GROUP BY ' +
           '   G.NOMEGRUPOORCAMEN, G.IDGRUPOORCAMEN, C.TIPOCALCREALIZADO, G.CODGRUPOORC ' +
           'ORDER BY ' +
           '   NOMEGRUPO';
           
   Result := GetDataPacket(sSQL);           
end;




function TCtrlTransacoesPorGrupo.ListaContasRealxContabxFluxo(
  cContabOuFluxo: Char; iIdPessoa, iPeriodo,
  iExercicio,iIdPlanoOrc: integer; iIdGrupoOrc :integer): OleVariant;
var
   sSQL: string;

begin
  sSQL := 'SELECT DISTINCT ' +
          '   C.IDCONTAORCAMEN, ' +
          '   G.IDGRUPOORCAMEN, ' +
          '   DECODE(TRIM(CC.CODEXTERNO),'''','''',TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME) AS CENTCUSTO, ' +
          '   PRV.NOME AS NOMEPLANO, ' +
          '   PTR.NOME AS NOMEPATRO, ' +
          '   ATV.NOME AS ATIVPROJ, ' +
          '   NVL(COMPCONTASSALDO.VALOR,0) AS VALOR, ' +
          '   NVL(S.VLRREALIZADO,0) AS VLRREALIZADO, ' +
          '   NVL(S.VLRREALIZADO,0) - NVL(COMPCONTASSALDO.VALOR,0) AS DIFERENCA ' +

          'FROM ' +
          '   CONTASORCAMEN C, ' +
          '   GRUPOORCAMEN G, ' +
          '   CENTCUST CC, ' +
          '   PLANPREVCONTABIL PRV, ' +
          '   PESSOA PTR, ' +
          '   UNIDNEGOCIO ATV, ' +

          '   (SELECT IDCONTAORCAMEN, IDPLANOORCAMEN,VLRREALIZADO ' +
          '    FROM SALDOORCADO ' +
          '    WHERE PERIODO           = ' + IntToStr(iPeriodo)   + ' AND ' +
          '          EXERCICIO         = ' + IntToStr(iExercicio) + ' AND ' +
          '          IDPESSOA          = ' + IntToStr(iIdPessoa)  +
          '    )S, ' +

          '   COMPCONTASORCAMEN COMPCONTAS, ' +

          '(SELECT ' +
          '   CP.IDPLANOORCAMEN, CP.IDCONTAORCAMEN, ' +
          '   SUM(NVL(PLSALDO.VALOR,0)) AS VALOR ' +
          ' FROM ' +
          '   (SELECT IDPLANOORCAMEN, IDCONTAORCAMEN,IDPESSOA, ' +
          '           PLANO, PLACONTA, CODCENTROCUSTO, ' +
          '           UNIDNEGOC, IDPLANOPREV, IDPATRO, ' +
          '           IDEMPRESA ' +
          '    FROM COMPCONTASORCAMEN ' +
          '    ) CP, ' +

          '   (SELECT SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR, ' +
          '           PLACONTA,PLANO,CODCENTROCUSTO,IDEMPRESA, ' +
          '           UNIDNEGOC, IDPLANOPREV, IDPATRO ' +
          '    FROM PLANOSALDO ' +
          '    WHERE ' +
          '          (PERNUMERO    = ' + IntToStr(iPeriodo)   + ') AND ' +
          '          (PEREXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '          (IDPESSOA     = ' + IntToStr(iIdPessoa)  + ') ' +
          '    GROUP BY ' +
          '           PLACONTA,PLANO,CODCENTROCUSTO,IDEMPRESA, ' +
          '           UNIDNEGOC, IDPLANOPREV, IDPATRO) PLSALDO ' +

          ' WHERE ' +
          '   (CP.PLACONTA       = PLSALDO.PLACONTA(+)) AND ' +
          '   (CP.PLANO          = PLSALDO.PLANO(+)) AND ' +
          '   ((CP.CODCENTROCUSTO IS NULL) OR ((CP.CODCENTROCUSTO  = PLSALDO.CODCENTROCUSTO) AND ' +
          '                                    (CP.IDEMPRESA       = PLSALDO.IDEMPRESA))) AND ' +
          '   ((CP.UNIDNEGOC IS NULL) OR (CP.UNIDNEGOC = PLSALDO.UNIDNEGOC)) AND ' +
          '   ((CP.IDPLANOPREV IS NULL) OR (CP.IDPLANOPREV = PLSALDO.IDPLANOPREV)) AND ' +
          '   ((CP.IDPATRO IS NULL) OR (CP.IDPATRO = PLSALDO.IDPATRO)) ' +
          'GROUP BY ' +
          '     CP.IDPLANOORCAMEN, CP.IDCONTAORCAMEN) COMPCONTASSALDO ' +

          'WHERE ' +
          '   (C.IDGRUPOORCAMEN          = G.IDGRUPOORCAMEN) AND ' +
          '   (C.CODCENTROCUSTO          = CC.CODCENTROCUSTO(+)) AND ' +
          '   (C.IDPLANOPREV             = PRV.IDPLANOPREV(+)) AND ' +
          '   (C.IDPATRO                 = PTR.IDPESSOA(+)) AND ' +
          '   (C.UNIDNEGOC               = ATV.UNIDNEGOC(+)) AND ' +
          '   (C.IDPLANOORCAMEN          = S.IDPLANOORCAMEN(+)) AND ' +
          '   (C.IDCONTAORCAMEN          = S.IDCONTAORCAMEN(+)) AND ' +
          '   (C.IDPLANOORCAMEN          = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
          '   (C.TIPOCALCREALIZADO       = ' + QuotedStr(cContabOuFluxo) + ') AND  ' +

          '   (COMPCONTAS.IDPLANOORCAMEN   = COMPCONTASSALDO.IDPLANOORCAMEN(+)) AND ' +
          '   (COMPCONTAS.IDCONTAORCAMEN   = COMPCONTASSALDO.IDCONTAORCAMEN(+)) AND ' +
          '   (COMPCONTAS.IDPLANOORCAMEN   = C.IDPLANOORCAMEN) AND ' +
          '   (COMPCONTAS.IDCONTAORCAMEN   = C.IDCONTAORCAMEN) AND ' +


          '   (COMPCONTAS.IDPLANOORCAMEN(+) = C.IDPLANOORCAMEN) AND ' +
          '   (COMPCONTAS.IDCONTAORCAMEN(+) = C.IDCONTAORCAMEN)  ';


          if iIdGrupoOrc <> 0 then
             sSQL := sSQL + ' AND  (C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') ';

          sSQL := sSQL +
          'ORDER BY ' +
          '   C.IDCONTAORCAMEN ';

   Result := GetDataPacket(sSQL);
end;




function TCtrlTransacoesPorGrupo.ListaCompContasRealxContabxFluxo(iPeriodo,iExercicio,iIdPessoa,iIdPlanoOrc: integer;
                                                                  iIdGrupoOrc: integer): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' +
           '   CP.IDPLANOORCAMEN,CP.IDCONTAORCAMEN,CP.IDPESSOA, ' +
           '   PLANOCONTABIL.DESCPLANO, CP.PLACONTA, ' +
           '   DECODE(TRIM(CC.CODEXTERNO),'''','''',TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME) AS CENTROCUSTO, ' +
           '   ATIVPROJ.NOME AS ATIVPROJETO, ' +
           '   PLANO.NOME AS PLANOPREV, ' +
           '   PATRO.NOME AS NOMEPATRO, ' +
           '   NVL(SALDO.VALOR,0) AS VALOR, ' +
           '   NVL(TOTPLACONTA.VALOR,0) AS VALORTOTAL ' +

           'FROM ' +
           '    COMPCONTASORCAMEN CP, ' +
           '    CONTASORCAMEN C, ' +
           '    PESSOA PATRO, ' +
           '    PLANPREVCONTABIL PLANO, ' +
           '    CENTCUST CC, ' +
           '    UNIDNEGOCIO ATIVPROJ, ' +
           '    PLANO PLANOCONTABIL, ' +

           '   (SELECT PLACONTA, PLANO, ' +
           '        SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR ' +
           '    FROM PLANOSALDO ' +
           '    WHERE (PERNUMERO    = ' + IntToStr(iPeriodo)   + ') AND ' +
           '          (PEREXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
           '          (IDPESSOA     = ' + IntToStr(iIdPessoa)  + ') ' +
           '    GROUP BY  PLACONTA,PLANO  ) TOTPLACONTA, ' +

           '    (SELECT COMP.IDCOMPCONTASORC, ' +
           '        SUM(NVL(PLSALDO.VALOR,0)) AS VALOR ' +
           '     FROM ' +
           '        COMPCONTASORCAMEN COMP, ' +

           '       (SELECT SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR, ' +
           '               PLACONTA,PLANO,CODCENTROCUSTO,IDEMPRESA, ' +
           '               UNIDNEGOC, IDPLANOPREV, IDPATRO ' +
           '        FROM PLANOSALDO ' +
           '        WHERE (PERNUMERO    = ' + IntToStr(iPeriodo)   + ') AND ' +
           '              (PEREXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
           '              (IDPESSOA     = ' + IntToStr(iIdPessoa)  + ') ' +
           '        GROUP BY PLACONTA,PLANO,CODCENTROCUSTO,IDEMPRESA, ' +
           '                 UNIDNEGOC, IDPLANOPREV, IDPATRO) PLSALDO ' +

           '     WHERE (COMP.PLACONTA       = PLSALDO.PLACONTA(+)) AND ' +
           '           (COMP.PLANO          = PLSALDO.PLANO(+)) AND ' +
           '           ((COMP.CODCENTROCUSTO IS NULL) OR ((COMP.CODCENTROCUSTO = PLSALDO.CODCENTROCUSTO) AND ' +
           '                                              (COMP.IDEMPRESA      = PLSALDO.IDEMPRESA))) AND ' +
           '           ((COMP.UNIDNEGOC   IS NULL) OR (COMP.UNIDNEGOC   = PLSALDO.UNIDNEGOC)) AND ' +
           '           ((COMP.IDPLANOPREV IS NULL) OR (COMP.IDPLANOPREV = PLSALDO.IDPLANOPREV)) AND ' +
           '           ((COMP.IDPATRO     IS NULL) OR (COMP.IDPATRO     = PLSALDO.IDPATRO)) ' +
           '     GROUP BY COMP.IDCOMPCONTASORC) SALDO ' +

           'WHERE ' +
           '   (CP.IDCONTAORCAMEN  = C.IDCONTAORCAMEN) AND ' +
           '   (CP.IDPLANOORCAMEN  = C.IDPLANOORCAMEN) AND ' +
           '   (CP.PLACONTA        = TOTPLACONTA.PLACONTA(+)) AND ' +
           '   (CP.PLANO           = TOTPLACONTA.PLANO(+)) AND ';

           if iIdGrupoOrc <> 0 then
              sSQL := sSQL + ' (C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ';

           sSQL := sSQL +
           '   (C.IDPLANOORCAMEN   = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
           '   (CP.IDPATRO         = PATRO.IDPESSOA(+)) AND ' +
           '   (CP.IDPLANOPREV     = PLANO.IDPLANOPREV(+)) AND ' +
           '   (CP.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND ' +
           '   (CP.UNIDNEGOC       = ATIVPROJ.UNIDNEGOC(+)) AND ' +
           '   (CP.PLANO           = PLANOCONTABIL.PLANO(+)) AND ' +
           '   (CP.IDCOMPCONTASORC = SALDO.IDCOMPCONTASORC(+)) ' +
           'ORDER BY ' +
           '   CP.IDCONTAORCAMEN, CP.PLACONTA ';

   Result := GetDataPacket(sSQL);
end;




function TCtrlTransacoesPorGrupo.ListaDivergOrcxReal(iPerIni, iPerFim,
  iExercicio, iIdPessoa, iIdPlanoOrc: integer; sCodGrupoIni, sCodGrupoFim,
  sContaIni, sContaFim, sCodCentroCusto,sCodCentroResp,sIdPlanoPrev,sIdPatro,sIdUnidNegoc: string): OleVariant;
var
   sSQL: string;
begin
   sSQL := ' SELECT ' +
           '   G.CODGRUPOORC, ' +
           '   TRIM(G.CODGRUPOORC) || '' - ''|| G.NOMEGRUPOORCAMEN AS NOMEGRUPOORCAMEN, ' +
           '   C.IDCONTAORCAMEN, ' +
           '   C.NOMECONTAORCAMEN, ' +
           '   DECODE(TRIM(CC.CODEXTERNO),'''','''',TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME) AS CENTROCUSTO, ' +
           '   ATIV.NOME AS ATIVPROJ, ' +
           '   PATRO.NOME AS PATRO, ' +
           '   PRV.NOME AS PLANO, ' +

           // Para cada linha referente ao mês, é calculado o saldo Orçado,
           //Realizado, direrença entre ambos (Orçado - Realizado) e
           //o percentual de diferença (análise vertical)

           // Janeiro
           '   SUM(DECODE(S.PERIODO,1,ROUND(S.VLRORCADO,2),0)) AS VLRORC01, ' +
           '   SUM(DECODE(S.PERIODO,1,ROUND(S.VLRREALIZADO,2),0)) AS VLRREAL01, ' +
           '   SUM(DECODE(S.PERIODO,1,ABS(ROUND(S.VLRORCADO,2)),0)) - SUM(DECODE(S.PERIODO,1,ABS(ROUND(S.VLRREALIZADO,2)),0)) AS DIF01, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,1,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,1,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                      (100 - (SUM(DECODE(S.PERIODO,1,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                              SUM(DECODE(S.PERIODO,1,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT01, ' +
           // Fevereiro
           '   SUM(DECODE(S.PERIODO,2,S.VLRORCADO,0)) AS VLRORC02, ' +
           '   SUM(DECODE(S.PERIODO,2,S.VLRREALIZADO,0)) AS VLRREAL02, ' +
           '   SUM(DECODE(S.PERIODO,2,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,2,ABS(S.VLRREALIZADO),0)) AS DIF02, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,2,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,2,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                      (100 - (SUM(DECODE(S.PERIODO,2,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                              SUM(DECODE(S.PERIODO,2,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT02, ' +
           // Março
           '   SUM(DECODE(S.PERIODO,3,S.VLRORCADO,0)) AS VLRORC03, ' +
           '   SUM(DECODE(S.PERIODO,3,S.VLRREALIZADO,0)) AS VLRREAL03, ' +
           '   SUM(DECODE(S.PERIODO,3,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,3,ABS(S.VLRREALIZADO),0)) AS DIF03, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,3,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,3,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                      (100 - (SUM(DECODE(S.PERIODO,3,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                              SUM(DECODE(S.PERIODO,3,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT03, ' +
           // Abril
           '   SUM(DECODE(S.PERIODO,4,S.VLRORCADO,0)) AS VLRORC04, ' +
           '   SUM(DECODE(S.PERIODO,4,S.VLRREALIZADO,0)) AS VLRREAL04, ' +
           '   SUM(DECODE(S.PERIODO,4,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,4,ABS(S.VLRREALIZADO),0)) AS DIF04, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,4,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,4,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                      (100 - (SUM(DECODE(S.PERIODO,4,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                              SUM(DECODE(S.PERIODO,4,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT04, ' +
           // Maio
           '   SUM(DECODE(S.PERIODO,5,S.VLRORCADO,0)) AS VLRORC05, ' +
           '   SUM(DECODE(S.PERIODO,5,S.VLRREALIZADO,0)) AS VLRREAL05, ' +
           '   SUM(DECODE(S.PERIODO,5,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,5,ABS(S.VLRREALIZADO),0)) AS DIF05, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,5,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,5,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                      (100 - (SUM(DECODE(S.PERIODO,5,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                              SUM(DECODE(S.PERIODO,5,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT05, ' +
           // Junho
           '   SUM(DECODE(S.PERIODO,6,S.VLRORCADO,0)) AS VLRORC06, ' +
           '   SUM(DECODE(S.PERIODO,6,S.VLRREALIZADO,0)) AS VLRREAL06, ' +
           '   SUM(DECODE(S.PERIODO,6,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,6,ABS(S.VLRREALIZADO),0)) AS DIF06, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,6,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,6,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                      (100 - (SUM(DECODE(S.PERIODO,6,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                              SUM(DECODE(S.PERIODO,6,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT06, ' +
           // Julho
           '   SUM(DECODE(S.PERIODO,7,S.VLRORCADO,0)) AS VLRORC07, ' +
           '   SUM(DECODE(S.PERIODO,7,S.VLRREALIZADO,0)) AS VLRREAL07, ' +
           '   SUM(DECODE(S.PERIODO,7,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,7,ABS(S.VLRREALIZADO),0)) AS DIF07, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,7,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,7,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                      (100 - (SUM(DECODE(S.PERIODO,7,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                              SUM(DECODE(S.PERIODO,7,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT07, ' +
           // Agosto
           '   SUM(DECODE(S.PERIODO,8,S.VLRORCADO,0)) AS VLRORC08, ' +
           '   SUM(DECODE(S.PERIODO,8,S.VLRREALIZADO,0)) AS VLRREAL08, ' +
           '   SUM(DECODE(S.PERIODO,8,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,8,ABS(S.VLRREALIZADO),0)) AS DIF08, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,8,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,8,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                      (100 - (SUM(DECODE(S.PERIODO,8,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                              SUM(DECODE(S.PERIODO,8,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT08, ' +
           // Setembro
           '   SUM(DECODE(S.PERIODO,9,S.VLRORCADO,0)) AS VLRORC09, ' +
           '   SUM(DECODE(S.PERIODO,9,S.VLRREALIZADO,0)) AS VLRREAL09, ' +
           '   SUM(DECODE(S.PERIODO,9,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,9,ABS(S.VLRREALIZADO),0)) AS DIF09, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,9,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,9,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                      (100 - (SUM(DECODE(S.PERIODO,9,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                              SUM(DECODE(S.PERIODO,9,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT09, ' +
           // Outubro
           '   SUM(DECODE(S.PERIODO,10,S.VLRORCADO,0)) AS VLRORC10, ' +
           '   SUM(DECODE(S.PERIODO,10,S.VLRREALIZADO,0)) AS VLRREAL10, ' +
           '   SUM(DECODE(S.PERIODO,10,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,10,ABS(S.VLRREALIZADO),0)) AS DIF10, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,10,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,10,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                     (100 - (SUM(DECODE(S.PERIODO,10,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                             SUM(DECODE(S.PERIODO,10,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT10, ' +
           // Novembro
           '   SUM(DECODE(S.PERIODO,11,S.VLRORCADO,0)) AS VLRORC11, ' +
           '   SUM(DECODE(S.PERIODO,11,S.VLRREALIZADO,0)) AS VLRREAL11, ' +
           '   SUM(DECODE(S.PERIODO,11,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,11,ABS(S.VLRREALIZADO),0)) AS DIF11, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,11,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,11,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                     (100 - (SUM(DECODE(S.PERIODO,11,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                             SUM(DECODE(S.PERIODO,11,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT11, ' +
           // Dezembro
           '   SUM(DECODE(S.PERIODO,12,S.VLRORCADO,0)) AS VLRORC12, ' +
           '   SUM(DECODE(S.PERIODO,12,S.VLRREALIZADO,0)) AS VLRREAL12, ' +
           '   SUM(DECODE(S.PERIODO,12,ABS(S.VLRORCADO),0)) - SUM(DECODE(S.PERIODO,12,ABS(S.VLRREALIZADO),0)) AS DIF12, ' +
           '   ROUND(DECODE(SUM(DECODE(S.PERIODO,12,ROUND(S.VLRREALIZADO,2),0)),0,0, ' +
           '               DECODE(SUM(DECODE(S.PERIODO,12,ROUND(S.VLRORCADO,   2),0)),0,0, ' +
           '                     (100 - (SUM(DECODE(S.PERIODO,12,ROUND(S.VLRREALIZADO,2),0)) * 100 / ' +
           '                             SUM(DECODE(S.PERIODO,12,ROUND(S.VLRORCADO,   2),0)))))),2) || ''%''   AS PERCENT12, ' +

           '   SUM(NVL(S.VLRORCADO,0)) AS TOTALORCADO, ' +
           '   SUM(NVL(S.VLRREALIZADO,0)) AS TOTALREALIZADO, ' +
           '   SUM(NVL(S.VLRORCADO,0)) - SUM(NVL(S.VLRREALIZADO,0)) AS DIFERENCATOTAL, ' + //22175
           '   DECODE(SUM(NVL(S.VLRORCADO,0)),0,0, ' +
           '         DECODE(SUM(NVL(S.VLRREALIZADO,0)),0,0, ' +
           '               ROUND(100 - (SUM(S.VLRREALIZADO) * 100 / SUM(S.VLRORCADO)),2))) AS PERCENTTOTAL ' +

           'FROM ' +
           '   CONTASORCAMEN C, ' +
           '   GRUPOORCAMEN G, ' +
           '   CENTCUST CC, ' +
           '   UNIDNEGOCIO ATIV, ' +
           '   PLANPREVCONTABIL PRV, ' +
           '   PESSOA  PATRO, ' +
           '   (SELECT IDCONTAORCAMEN, IDPLANOORCAMEN, PERIODO, EXERCICIO, ' +
           '       SUM(NVL(VLRORCADO,0)) AS VLRORCADO, ' +
           '       SUM(NVL(VLRREALIZADO,0)) AS VLRREALIZADO ' +
           '    FROM ' +
           '       SALDOORCADO ' +
           '    WHERE ' +
           '       (EXERCICIO = ' + IntToStr(iExercicio) + ')  AND ' +
           '       (PERIODO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') AND ' +
           '       (IDPESSOA = ' + IntToStr(iIdPessoa) + ') ' +

           '    GROUP BY ' +
           '      IDCONTAORCAMEN, IDPLANOORCAMEN, PERIODO, EXERCICIO ' +
           '   ) S ' +

           'WHERE ' +
           '   (G.IDPLANOORCAMEN  = ' + IntToStr(iIdPlanoOrc) + ')  AND ' +
           '   (C.IDGRUPOORCAMEN  = G.IDGRUPOORCAMEN) AND ' +
           '   (C.IDPLANOORCAMEN  = G.IDPLANOORCAMEN) AND ' +
           '   (C.IDPESSOA        = ' + IntToStr(iIdPessoa) + ') AND ' +
           '   (C.IDPLANOPREV     = PRV.IDPLANOPREV(+)) AND ' +
           '   (C.IDPATRO         = PATRO.IDPESSOA(+)) AND ' +
           '   (C.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND ' +
           '   (C.UNIDNEGOC       = ATIV.UNIDNEGOC(+)) AND ' +
           '   (C.FLGATIVA        = ''A'') AND ' +
           '   (C.IDPLANOORCAMEN  = S.IDPLANOORCAMEN(+)) AND ' +
           '   (C.IDCONTAORCAMEN  = S.IDCONTAORCAMEN(+)) ';

           if Trim(sContaIni) <> '' then
              sSQL := sSQL + ' AND (C.IDCONTAORCAMEN >= ' + QuotedStr(sContaIni) + ') ';

           if Trim(sContaFim) <> '' then
              sSQL := sSQL + ' AND (C.IDCONTAORCAMEN <= ' + QuotedStr(sContaFim) + ') ';

           if Trim(sCodGrupoIni) <> '' then
              sSQL := sSQL + '  AND  G.CODGRUPOORC >= ' + QuotedStr(Espaco(sCodGrupoIni,12));

           if Trim(sCodGrupoFim) <> '' then
              sSQL := sSQL + '  AND  G.CODGRUPOORC <= ' + QuotedStr(Espaco(sCodGrupoFim,12));

           if Trim(sCodCentroCusto) <> '' then
              sSQL := sSQL + ' AND (C.CODCENTROCUSTO = ' + QuotedStr(sCodCentroCusto) + ' ) ';

           if Trim(sCodCentroResp) <> '' then
              sSQL := sSQL + ' AND (C.CODCENTRORESPON = ' + QuotedStr(sCodCentroResp) + ' ) ';  //22175

           if Trim(sIdUnidNegoc) <> '' then
              sSQL := sSQL + ' AND (C.UNIDNEGOC = ' + sIdUnidNegoc + ' ) ';

           if Trim(sIdPlanoPrev) <> '' then
              sSQL := sSQL + ' AND (C.IDPLANOPREV = ' + sIdPlanoPrev + ' ) ';

           if Trim(sIdPatro) <> '' then
              sSQL := sSQL + ' AND (C.IDPATRO = ' + sIdPatro + ' ) ';



           sSQL := sSQL +
           'GROUP BY ' +
           '   G.CODGRUPOORC, G.NOMEGRUPOORCAMEN, ' +
           '   C.IDCONTAORCAMEN,C.NOMECONTAORCAMEN, ' +
           '   CC.CODEXTERNO,CC.NOME,ATIV.NOME,PATRO.NOME,PRV.NOME ' +

           'ORDER BY ' +
           '   G.CODGRUPOORC ';

   Result := GetDataPacket(sSQL);
end;




function TCtrlTransacoesPorGrupo.ListaDivergencia(iIdDescdivergorc: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '   IDDESCDIVERGORC, ' +
                           '   IDCONTAORCAMEN, ' +
                           '   IDPLANOORCAMEN, ' +
                           '   PERIODO, ' +
                           '   EXERCICIO, ' +
                           '   DESCRICAO ' +
                           'FROM ' +
                           '  DESCDIVERGORC ' +
                           'WHERE ' +
                           '  IDDESCDIVERGORC = ' + IntToStr(iIdDescdivergorc));
end;




function TCtrlTransacoesPorGrupo.GravaDivergencia(
  ovDados: OleVariant; Operacao: TOperacao): boolean;
var
  CdsAux: TClientDataSet;
  sPeriodo: string;
begin
   try
      try
         CdsAux      := TClientDataSet.Create(nil);
         CdsAux.Data := ovDados;
         StartTransaction;

         case Operacao of 
            opInserir: begin
                          _Cds.Data := GetDataPacket('SELECT COUNT(PERIODO) AS TOTAL ' +
                                                     'FROM DESCDIVERGORC ' +
                                                     'WHERE (EXERCICIO      = ' + CdsAux.FieldByName('EXERCICIO').AsString + ') AND ' +
                                                     '      (PERIODO        = ' + CdsAux.FieldByName('PERIODO').AsString + ') AND ' +
                                                     '      (IDCONTAORCAMEN = ' + QuotedStr(CdsAux.FieldByName('IDCONTAORCAMEN').AsString) + ') AND ' +
                                                     '      (IDPLANOORCAMEN = ' + CdsAux.FieldByName('IDPLANOORCAMEN').AsString + ') ');
                          if _Cds.Fields[0].AsInteger > 0 then
                             raise Exception.Create('Já existe um registro cadastrado para este período/exercício');

                       end;

            opAlterar: begin
                          if CdsAux.FieldByName('PERIODO').OldValue <> CdsAux.FieldByName('PERIODO').NewValue then
                          begin
                             sPeriodo  := CdsAux.FieldByName('PERIODO').NewValue;
                             _Cds.Data := GetDataPacket('SELECT COUNT(PERIODO) AS TOTAL ' +
                                                        'FROM DESCDIVERGORC ' +
                                                        'WHERE (EXERCICIO      = ' + CdsAux.FieldByName('EXERCICIO').AsString + ') AND ' +
                                                        '      (PERIODO        = ' + sPeriodo + ') AND ' +
                                                        '      (IDCONTAORCAMEN = ' + QuotedStr(CdsAux.FieldByName('IDCONTAORCAMEN').AsString) + ') AND ' +
                                                        '      (IDPLANOORCAMEN = ' + CdsAux.FieldByName('IDPLANOORCAMEN').AsString + ') ');
                             if _Cds.Fields[0].AsInteger > 0 then
                                raise Exception.Create('Já existe um registro cadastrado para este período/exercício');
                          end;
                       end;
         end;


         Result := ApplyCds(CdsAux,DbDescdivergorc,[],[]);
         if not Result then
            raise Exception.Create(DbDescdivergorc.MessageInfo);
            
         Commit;

      except
         on E:Exception do
         begin
            Rollback;
            MessageInfo := E.Message;
            Result := false;
         end;
      end;

   finally
       FreeAndNil(CdsAux);
   end;
end;




function TCtrlTransacoesPorGrupo.ListaPeriodo(iIdPessoa,
  iExercicio: integer): OleVariant;
begin
   Result := CtrlPeriodoOrcamen.ListaPeriodoOrc(iIdPessoa,iExercicio);
end;




function TCtrlTransacoesPorGrupo.ListaDescDiverg(iIdPessoa, iIdPlanoOrc,
  iExercicio, iPerIni, iPerFim: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '   C.IDCONTAORCAMEN, ' +
                           '   P.NOMEPERIODO, ' +
                           '   D.DESCRICAO ' +
                           'FROM ' +
                           '   CONTASORCAMEN C, ' +
                           '   PERIODOORCAMEN P, ' +
                           '   (SELECT IDCONTAORCAMEN, IDPLANOORCAMEN, ' +
                           '           PERIODO,EXERCICIO, DESCRICAO ' +
                           '    FROM DESCDIVERGORC ' +
                           '    WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                           '          (PERIODO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ')  ) D ' +
                           'WHERE ' +
                           '   (C.IDCONTAORCAMEN = D.IDCONTAORCAMEN) AND ' +
                           '   (C.IDPLANOORCAMEN = D.IDPLANOORCAMEN) AND ' +
                           '   (D.PERIODO        = P.PERIODO(+)) AND ' +
                           '   (D.EXERCICIO      = P.EXERCICIO(+)) AND ' +
                           '   (C.IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
                           '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ')');

end;




function TCtrlTransacoesPorGrupo.ListaAtivProj(iIdPessoa: integer;
  TipoUnid: tTipoUnidNegoc
  ;sAtivo : String): OleVariant;   //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
var
   sSQL: string;  
begin
   sSQL := ' SELECT ' +
           '    UNIDNEGOC, NOME, UNECODIGO ' +
           ' FROM  ' +
           '    UNIDNEGOCIO ' +
           ' WHERE' +
           '    IDPESSOA = ' + IntToStr(iIdPessoa);

           case TipoUnid of
             tuAnalitico : sSQL := sSQL + ' AND UNETIPO = ''A'' ';
             tuSintetico : sSQL := sSQL + ' AND UNETIPO = ''S'' ';
           end;
           //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
           if (sAtivo <> '') then
           sSQL := sSQL + ' AND ATIVO = '+QuotedStr('S');
           //Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM

           sSQL := sSQL +
           ' ORDER BY ' +
           '    NOME';
   Result := GetDataPacket(sSQL);        
end;




function TCtrlTransacoesPorGrupo.ListaCenario: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '  IDCENARIOORCAMEN, NOMECENARIO ' +
                           'FROM ' +
                           '  CENARIOORCAMEN ' +
                           'ORDER BY ' +
                           '  NOMECENARIO');
end;




function TCtrlTransacoesPorGrupo.ListaCriterio(iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '  C.IDCRITERIORATORC, C.DESCRICAO, C.TIPORATEIO, C.IDDATAVIEW, ' +
                           ' C.PERNUMERO, ' +
                           '  C.PEREXERCICIO, P.PERDATINI, P.PERDATFIM ' +
                           'FROM ' +
                           '  CRITERIORATORC C, PERIODO P ' +
                           'WHERE ' +
                           '  ( C.IDPESSOA     = ' + IntToStr(iIdPessoa) + ' ) AND ' +
                           '  ( C.PERNUMERO    = P.PERNUMERO    (+) ) AND ' +
                           '  ( C.PEREXERCICIO = P.PEREXERCICIO (+) ) AND ' +
                           '  ( C.IDPESSOA     = P.IDPESSOA     (+)) ' +
                           'ORDER BY ' +
                           '  C.DESCRICAO ');
end;




function TCtrlTransacoesPorGrupo.ListaCCusto(
  iIdEmpresa: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT DISTINCT ' +
                           '  CODCENTROCUSTO, ' +
                           '  NOME ' +
                           'FROM ' +
                           '  CENTCUST ' +
                           'WHERE ' +
                           '  IDEMPRESA      = ' + IntToStr(iIdEmpresa) + ' AND ' +
                           '  STATUSGRUPOCDC = ''A'' ' +
                           'ORDER BY ' +
                           '  NOME');
end;




function TCtrlTransacoesPorGrupo.ListaCRespon(iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '    CODCENTRORESPON, NOME ' +
                           ' FROM ' +
                           '    CENTRESPON ' +
                           ' WHERE ' +
                           '    IDPESSOA = ' + IntToStr(iIdPessoa) +
                           ' ORDER BY ' +
                           '    NOME');
end;


procedure TCtrlTransacoesPorGrupo.RateiaValorCriterioCDS(pCds: TClientDataSet;
  iIdCriterioRateio: integer; sNomeCriterio: string;
  pExercicio, pPeriodo: integer; rValorRateio: Double);
var
  CdsVlrCrit: TClientDataSet;
  sSQL: String;
  oldFilter, sFilter: String;
  oldFiltered: Boolean;
  rTotalRateio: Double;

  rValor: Double;
  rValorRateio1: Double;
  rValorRateio2: Double;
  rValorRateio3: Double;

  iQtdeRateio1: Integer;
  iQtdeRateio2: Integer;

  sAux: String;

begin
  CdsVlrCrit := TClientDataSet.Create(nil);
  try
    sSQL := 'select VR.CODCENTROCUSTO,' + CR_LF +
            '       VR.IDPLANOPREV,' + CR_LF +
            '       VR.IDPATRO,' + CR_LF +
            
            //Ricardo SOL 159248 KTN 1337823
            '       VR.IDPROGRAMAORCAMEN,' + CR_LF +
            '       VR.IDTIPO_DEPESAORCAMEN,' + CR_LF +
            //Ricardo SOL 159248 KTN 1337823 - fim

            '       VR.EXERCICIO,' + CR_LF +
            '       VR.EXERCICIOFIM,' + CR_LF +
            '       VR.PERIODO,' + CR_LF +
            '       VR.PERIODOFIM,' + CR_LF +
            '       decode(ROWNUM, 1, VR.VALORRATEIO + (' + TrocaVPP(FloatToStr(rValorRateio)) + ' - sum(VR.VALORRATEIO) over()), VR.VALORRATEIO) as VALORRATEIO' + CR_LF +
            '  from (' + CR_LF +
            'select VR.CODCENTROCUSTO,' + CR_LF +

            //Ricardo SOL 159248 KTN 1337823
            '       VR.IDPROGRAMAORCAMEN,' + CR_LF +
            '       VR.IDTIPO_DEPESAORCAMEN,' + CR_LF +
            //Ricardo SOL 159248 KTN 1337823 - fim

            '       VR.IDPLANOPREV,' + CR_LF +
            '       VR.IDPATRO,' + CR_LF +
            '       VR.EXERCICIO,' + CR_LF +
            '       VR.EXERCICIOFIM,' + CR_LF +
            '       VR.PERIODO,' + CR_LF +
            '       VR.PERIODOFIM,' + CR_LF +
            '       round(' + TrocaVPP(FloatToStr(rValorRateio)) + ' * ' + CR_LF +
            '             decode(sum(nvl(VR.VLRCRIRATORC, 0)) over(),' + CR_LF +
            '                    0,' + CR_LF +
            '                    0,' + CR_LF +
            '                    nvl(VR.VLRCRIRATORC, 0) / sum(nvl(VR.VLRCRIRATORC, 0)) over()), 2) as ValorRateio' + CR_LF +
            '  from VALORCRIRATORC VR' + CR_LF +
            ' where VR.IDCRITERIORATORC = ' + IntToStr(iIdCriterioRateio) + CR_LF;

    if pPeriodo > 0 then
      sSQL := sSQL +
            '   and ' + FormatFloat('0000', pExercicio) + FormatFloat('00', pPeriodo) + ' between ' + CR_LF +
            '       to_number(trim(to_char(VR.EXERCICIO)) || trim(to_char(VR.PERIODO, ''00''))) and ' + CR_LF +
            '       to_number(trim(to_char(VR.EXERCICIOFIM)) || trim(to_char(VR.PERIODOFIM, ''00'')))' + CR_LF
    else
      sSQL := sSQL +
            '   and ' + IntToStr(pExercicio) + ' between VR.EXERCICIO and VR.EXERCICIOFIM' + CR_LF;

    sSQL := sSQL + ' ) VR';

    CdsVlrCrit.Data := GetDataPacket(sSQL);

    // Salvando a situação inicial do CDS
    oldFilter := pCds.Filter;
    oldFiltered := pCds.Filtered;

    CdsVlrCrit.First;
    while not(CdsVlrCrit.Eof) do
    begin
      sFilter := '(VALIDAR = ''S'') and ' +
                 '(EXERCICIO >= ' + CdsVlrCrit.FieldByName('EXERCICIO').AsString + ') and ' +
                 '(EXERCICIO <= ' + CdsVlrCrit.FieldByName('EXERCICIOFIM').AsString + ') and ' +
                 '(PERIODO >= ' + CdsVlrCrit.FieldByName('PERIODO').AsString + ') and ' +
                 '(PERIODO <= ' + CdsVlrCrit.FieldByName('PERIODOFIM').AsString + ') ';

      if Trim(CdsVlrCrit.FieldByName('CODCENTROCUSTO').AsString) = '' then
        sFilter := sFilter //+ ' and (CODCENTROCUSTO = '''') ' //Ricardo SOL 159248 KTN 1337823 - comentado
      else
        sFilter := sFilter + ' and (CODCENTROCUSTO = ' + QuotedStr(Trim(CdsVlrCrit.FieldByName('CODCENTROCUSTO').AsString)) + ') ';

      if Trim(CdsVlrCrit.FieldByName('IDPLANOPREV').AsString) = '' then
        sFilter := sFilter + ' and (IDPLANOPREV = '''') '
      else
        sFilter := sFilter + ' and (IDPLANOPREV = ' + CdsVlrCrit.FieldByName('IDPLANOPREV').AsString + ') ';

      if Trim(CdsVlrCrit.FieldByName('IDPATRO').AsString) = '' then
        sFilter := sFilter + ' and (IDPATRO = '''') '
      else
        sFilter := sFilter + ' and (IDPATRO = ' + CdsVlrCrit.FieldByName('IDPATRO').AsString + ') ';


      //Ricardo SOL 159248 KTN 1337823
      if Trim(CdsVlrCrit.FieldByName('IDPROGRAMAORCAMEN').AsString) = '' then
        sFilter := sFilter + ' and (IDPROGRAMAORCAMEN = 0) '
      else
        sFilter := sFilter + ' and (IDPROGRAMAORCAMEN = ' + QuotedStr(Trim(CdsVlrCrit.FieldByName('IDPROGRAMAORCAMEN').AsString)) + ') ';

      if Trim(CdsVlrCrit.FieldByName('IDTIPO_DEPESAORCAMEN').AsString) = '' then
        sFilter := sFilter + ' and (IDTIPO_DEPESAORCAMEN = 0) '
      else
        sFilter := sFilter + ' and (IDTIPO_DEPESAORCAMEN = ' + QuotedStr(Trim(CdsVlrCrit.FieldByName('IDTIPO_DEPESAORCAMEN').AsString)) + ') ';
      //Ricardo SOL 159248 KTN 1337823 - fim

      pCds.Filtered := False;
      pCds.Filter   := sFilter;
      pCds.Filtered := True;

      if (pCds.RecordCount > 0) then
      begin
        iQtdeRateio1 := pCds.RecordCount;
        iQtdeRateio2 := 0;

        // Limpando Lanc_Dif_Aux e Obetendo a quantidade de Períodos
        sAux := '';
        pCds.First;
        while not(pCds.Eof) do
        begin
          if (sAux <> pCds.FieldByName('PERIODO').AsString) then
          begin
            iQtdeRateio2 := iQtdeRateio2 + 1;
            pCds.Edit;
            pCds.FieldByName('Lanc_Dif_Aux').AsString := 'S';
            pCds.Post;
          end
          else
          if (pCds.FieldByName('Lanc_Dif_Aux').AsString = 'S') then
          begin
            pCds.Edit;
            pCds.FieldByName('Lanc_Dif_Aux').AsString := 'N';
            pCds.Post;
          end;

          pCds.Next;
        end;

        //--------------------------------------------
        // Efetuando o rateio para o Filtro...
        //--------------------------------------------
        rValor := CdsVlrCrit.FieldByName('ValorRateio').AsFloat;

        rValorRateio1 := Trunc( rValor / iQtdeRateio1 * 100 ) / 100;
        rValorRateio2 := 0;
        rValorRateio3 := 0;

        if iQtdeRateio2 > 0 then
        begin
          rValorRateio2 := rValor - (rValorRateio1 * iQtdeRateio1);
          rValorRateio2 := Trunc( rValorRateio2 / iQtdeRateio2 * 100 ) / 100;
        end;

        rValorRateio3 := rValor - ( (rValorRateio2 * iQtdeRateio2) + (rValorRateio1 * iQtdeRateio1) );
        rValorRateio3 := RoundCM( rValorRateio3 , 2 );


        pCds.First;
        while not(pCds.Eof) do
        begin
          pCds.Edit;

          if pCds.FieldByName('LANC_DIF_AUX').AsString = 'N' then
            pCds.FieldByName('VALOR').AsFloat := rValorRateio1
          else
          begin
            pCds.FieldByName('VALOR').AsFloat := rValorRateio1 + rValorRateio2 + rValorRateio3;
            rValorRateio3 := 0;
          end;

          pCds.FieldByName('IDCRITERIORATORC').AsInteger := iIdCriterioRateio;
          pCds.FieldByName('NOMECRITERIO').AsString      := sNomeCriterio;

          pCds.Post;

          pCds.Next;
        end;
      end;

      CdsVlrCrit.Next;
    end;

    // Voltando a situação inicial do CDS
    pCds.Filtered := False;
    pCds.Filter := oldFilter;
    pCds.Filtered := oldFiltered;

  finally
    if CdsVlrCrit.Active then CdsVlrCrit.Close;
    FreeAndNil(CdsVlrCrit);
  end;
end;

procedure TCtrlTransacoesPorGrupo.EditarDatasReferencia(cds:TDataSet;
  Dt_Refer: TDateTime);
var
   bmk:TBookmarkList;
begin
     if not cds.IsEmpty then
     begin
           bmk := (cds As TCLientDataset).GetBookmark;
           cds.first;
           cds.fieldbyname('DATAREFERENCIA').ReadOnly := false;
           while not cds.Eof Do
           begin
               cds.Edit;
               cds.fieldbyname('DATAREFERENCIA').AsDateTime := Dt_Refer;
               cds.Next;
           end;
           (cds As TClientDataset).GoToBookMark(bmk);
           cds.fieldbyname('DATAREFERENCIA').ReadOnly := true;
     end;
end;

function TCtrlTransacoesPorGrupo.Retornar_IdCriterio_porGrupoPeriodo(
  idPessoa, idPlanoOrcamen, idGrupoorcamen: Integer; sExercicio,
  sPeriodo: string): real;
var
   sSql:string;
   cds:TClientDataSet;
begin
     Result := -1;

     sSql :=   ' SELECT NVL(MAX(IDCRITERIORATORC),-1) AS IDCRITERIORATORC ' +
               ' FROM   CONTASORCAMEN C ' +
               ' JOIN   SALDOORCADO S ' +
               ' ON ' +
               '     C.IDPESSOA       = S.IDPESSOA AND ' +
               '     C.IDPLANOORCAMEN = S.IDPLANOORCAMEN AND ' +
               '     C.IDCONTAORCAMEN = S.IDCONTAORCAMEN ' +
               ' WHERE ' +
               '     S.IDPESSOA           = ' + IntToStr(idPessoa) +
               '     AND S.IDPLANOORCAMEN = ' + IntToStr(idPlanoOrcamen) +
               '     AND S.EXERCICIO      = ' + QuotedStr(Trim(sExercicio)) ;

     //O período poderá vim "0" para os casos de período anual
     if  StrToIntDef(Trim(sPeriodo),0) > 0 then
         sSql :=   sSql + '     AND S.PERIODO        = ' + QuotedStr(Trim(sPeriodo));
                      
     sSql :=   sSql + '     AND C.IDGRUPOORCAMEN = ' + IntToStr(idGrupoorcamen) +
                      ' GROUP BY ' +
                      '       C.IDGRUPOORCAMEN,S.IDPESSOA,S.IDPLANOORCAMEN,' +
                      '       S.EXERCICIO,S.PERIODO';
               
     TRY
       cds := TClientDataSet.Create(nil);
       cds.Data := GetDataPacket(sSql);

       if not cds.IsEmpty then
         if cds.Fields[0].AsFloat <> Result then
          Result := cds.Fields[0].AsFloat;
     finally
       cds.Close;
       FreeAndNil(cds);
     end;
end;

function TCtrlTransacoesPorGrupo.Clona_CLientDataset(cdsOrigem,
  cdsDestino: TClientDataSet): Boolean;
var
  i:Integer;
begin

    cdsDestino.Close;
    cdsDestino.Data := cdsOrigem.Data;
    cdsDestino.EmptyDataSet;

    cdsOrigem.First;
    while not cdsOrigem.Eof Do
    begin
      cdsDestino.Append;

      for i:= 0 to cdsOrigem.Fields.Count - 1 Do
      begin
          cdsDestino.Fields[i].Value := cdsOrigem.Fields[i].Value;
      end;

      cdsDestino.Post;

      cdsOrigem.Next;
    end;


end;

function TCtrlTransacoesPorGrupo.ListaPrograma: OleVariant;
begin
   Result := GetDataPacket('SELECT IDPROGRAMAORCAMEN,DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA ' +
                           ' FROM CM.PROGRAMAORCAMEN ORDER BY DESCRICAO_PROGRAMAORCAMEN');

end;

function TCtrlTransacoesPorGrupo.ListaTipoDespesa: OleVariant;
begin
   Result := GetDataPacket('SELECT IDTIPO_DEPESAORCAMEN,DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA ' +
                           'FROM CM.TIPO_DESPESAORCAMEN ORDER BY DESCRICAO_TIPO_DEPESAOCAMEN');
end;

function TCtrlTransacoesPorGrupo.TestaProgramaRatxGrupoOrc(iIdCritRat,
  iIdGrupoOrc: integer): olevariant;
begin
  result := GetDataPacket(' SELECT PR.IDPROGRAMAORCAMEN,PR.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA ' +
                          ' FROM VALORCRIRATORC V, PROGRAMAORCAMEN PR ' +
                          ' WHERE (V.IDCRITERIORATORC = ' + IntToStr(iIdCritRat) + ') AND ' +
                          '       (V.IDPROGRAMAORCAMEN NOT IN (SELECT IDPROGRAMAORCAMEN FROM CONTASORCAMEN ' +
                          '                                 WHERE (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ' )) '+
                          '        ) AND ' +
                          '        V.IDPROGRAMAORCAMEN = PR.IDPROGRAMAORCAMEN ');

end;

function TCtrlTransacoesPorGrupo.TestaTipoDespesaRatxGrupoOrc(iIdCritRat,
  iIdGrupoOrc: integer): olevariant;
begin
  result := GetDataPacket(' SELECT TD.IDTIPO_DEPESAORCAMEN,TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA ' +
                          ' FROM VALORCRIRATORC V, TIPO_DESPESAORCAMEN TD ' +
                          ' WHERE (V.IDCRITERIORATORC = ' + IntToStr(iIdCritRat) + ') AND ' +
                          '       (V.IDTIPO_DEPESAORCAMEN NOT IN (SELECT IDTIPO_DEPESAORCAMEN FROM CONTASORCAMEN ' +
                          '                                 WHERE (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ' )) '+
                          '        ) AND ' +
                          '        V.IDPROGRAMAORCAMEN = TD.IDTIPO_DEPESAORCAMEN ');
end;

function TCtrlTransacoesPorGrupo.ListaAtividadeProj: OleVariant;
begin
   {Result := GetDataPacket('SELECT IDTIPO_DEPESAORCAMEN,DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA ' +
                           'FROM CM.TIPO_DESPESAORCAMEN ORDER BY DESCRICAO_TIPO_DEPESAOCAMEN');}

   Result := GetDataPacket(
      ' SELECT trim(NOME) || decode(UNETIPO,' + QuotedStr('S') + ',' +    QuotedStr('*') +   ',' + QuotedStr('') + ') as NOME,' +
      ' UNIDNEGOC, UNETIPO, CODORCAMEN AS UNECODIGO '  +
      'FROM ' +
      '   UNIDNEGOCIO ' +
      'WHERE ' +
      '       IDPESSOA = ' + FloatToStr(Sistema.IdEmpresa) +
      ' ORDER BY NOME ');
end;

function TCtrlTransacoesPorGrupo.ListaCentroCusto(ACodUsuario     : Integer;
                                                  AIDGrupoOrcamen : Integer): OleVariant;
var
  sSQL : string;
begin

  // INICIO - VANDER   - SOL 172385/10082 - Kintana - 1690505
  {sSql := 'SELECT CODCENTROCUSTO, ' +
          '       trim(NOME) || decode(STATUSGRUPOCDC,''S'','' *'','''') || ' +
          '                     decode(ATIVO, ''S'', '''', '' (Inativo)'') as NOME, ' +
          '   IDPROGRAMAORCAMEN,' + //Marcio Sanches Spinosa SOL 219320 Kintana 2051323
          '   DESCRICAO_PROGRAMAORCAMEN ' +
          '  from CENTCUST C ' +
          ' INNER JOIN PROGRAMA P ON P.IDPROGRAMA = C.IDPROGRAMA ' + //Marcio Sanches Spinosa SOL 219320 Kintana 2051323
          ' INNER JOIN PROGRAMAORCAMEN PO ON PO.IDPROGRAMAORCAMEN = P.IDPROGRAMAORCAMEN ' + //Marcio Sanches Spinosa SOL 219320 Kintana 2051323
          ' where ATIVO = ''S'' ' +
          ' order by NOME, CODCENTROCUSTO ';  }

  sSQL := MontaListaCentroCusto(ACodUsuario, AIDGrupoOrcamen);
  sSQL := sSQL
        + ' order by C.NOME, C.CODCENTROCUSTO ';
  // FIM - VANDER   - SOL 172385/10082 - Kintana - 1690505

  result := GetDataPacket( sSQL );
end;


// INICIO - VANDER   - SOL 172385/10082 - Kintana - 1690505
function TCtrlTransacoesPorGrupo.MontaListaCentroCusto(ACodUsuario     : Integer;
                                                       AIDGrupoOrcamen : Integer) : String;
Const
  _Param_CodUsuario     = '***USUARIO***';
  _Param_IDGrupoOrcamen = '***GRUPOCONTA***';

  _Select_Usuario       = 'Select C.CODCENTROCUSTO, C.NOME, C.CODEXTERNO, C.IDEMPRESA, C.STATUSGRUPOCDC, C.NOMECC, C.ATIVO '
                        + ' From'
                        + '  PESSOAXCRESP UXA,'
                        + '  (Select CU.IDEMPRESA,'
                        + '          CU.CODCENTROCUSTO,'
                        + '          CU.CODEXTERNO,'
                        + '          CU.STATUSGRUPOCDC,'
                        + '          trim(CU.NOME) AS NOMECC,'
                        + '          CU.ATIVO,'
                        + '          trim(CU.NOME) ||'
                        + '          decode(CU.STATUSGRUPOCDC,''S'','' *'','''') ||'
                        + '          decode(CU.ATIVO, ''S'', '''','' (Inativo)'') as NOME'
                        + '     From Centcust CU,'
                        + '          USCCUSTO U'
                        + '    Where CU.ATIVO = ''S'' '
                        + '      And CU.IDEMPRESA      = U.IDEMPRESA'
                        + '      And CU.CODCENTROCUSTO = U.CODCENTROCUSTO'
                        + '      And U.IDUSUARIO       =  ' + _Param_CodUsuario + ') C,'
                        + '  (Select CO.CODCENTROCUSTO, CO.Idempresa, CO.CodCentroRespon'
                        + '     From CONTASORCAMEN CO'
                        + '    Where CO.IDGRUPOORCAMEN = ' + _Param_IDGrupoOrcamen
                        + '    Group By CO.CODCENTROCUSTO, CO.Idempresa, CO.CodCentroRespon) CT'
                        + '  where ( UXA.IDPESSOAACESSO  = ' + _Param_CodUsuario + ' )'
                        + '    and ( UXA.Codcentrorespon = CT.codcentrorespon )'
                        + '    And ( C.IDEMPRESA         = CT.IDEMPRESA       )'
                        + '    And ( C.CODCENTROCUSTO    = CT.CODCENTROCUSTO  )';

  _Select_Todos         = 'SELECT C.CODCENTROCUSTO, C.CODEXTERNO, C.IDEMPRESA, C.STATUSGRUPOCDC, C.NOME AS NOMECC, C.ATIVO, ' +
                          '       trim(C.NOME) || decode(C.STATUSGRUPOCDC,''S'','' *'','''') || ' +
                          '                       decode(C.ATIVO, ''S'', '''', '' (Inativo)'') as NOME ' +
                          '  from CENTCUST C' +
                          ' where C.ATIVO = ''S'' ';

var
  sSQL : string;
begin

  if (ACodUsuario > 0) and (AIDGrupoOrcamen > 0) Then
  Begin
     sSQL := _Select_Usuario;
     sSQL := StringReplace(sSQL, _Param_CodUsuario,     IntToStr(ACodUsuario    ), [rfReplaceAll]);
     sSQL := StringReplace(sSQL, _Param_IDGrupoOrcamen, IntToStr(AIDGrupoOrcamen), [rfReplaceAll]);
  End else
     sSQL := _Select_Todos;

  result := sSQL ;
end;
// FIM    - VANDER   - SOL 172385/10082 - Kintana - 1690505


function TCtrlTransacoesPorGrupo.ListaPlanoOrcamento(
  sGrupoOrcamento: string): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT P.IDPLANOORCAMEN, '+
          '       P.NOMEPLANOORC, '+
          '       P.ANO '+
          '  FROM GRUPOORCAMEN G, '+
          '       PLANOORCAMENTARIO P '+
          ' WHERE ( P.IDPLANOORCAMEN = G.IDPLANOORCAMEN ) '+
          '   AND ( G.CODGRUPOORC = '+ QuotedStr(sGrupoOrcamento) + ') ' +
          'order by P.NOMEPLANOORC';

  result := GetDataPacket( sSQL );
end;

// Edilaine - SOL 187127 / KTN 1761657
function TCtrlTransacoesPorGrupo.iif(c: boolean; a, b: single): single;
begin
  if c then
     iif := RoundCM( a , 2 )
  else
     iif := RoundCM( b , 2 );
end;
// Edilaine - SOL 187127 / KTN 1761657 - fim

{ TParamEntradaEspecial }

// Edilaine - SOL 189698 / KTN 1794093
function TCtrlTransacoesPorGrupo.iif(c: boolean; a, b: string): string;
begin
  if c then
     iif := a
  else
     iif := b;
end;
// Edilaine - SOL 189698 / KTN 1794093 - fim


// Edilaine - SOL 189698 / KTN 1794093
function TCtrlTransacoesPorGrupo.RetornaCodGrupoOrcamento(iIdGrupo: string): string;
var
   _CdsAux: TClientDataSet;
begin
   result := '';
   
   if iIdGrupo <> '-1' then
   begin
     try
        _CdsAux := TClientDataSet.Create(nil);
        _CdsAux.Data := GetDataPacket('SELECT CODGRUPOORC FROM GRUPOORCAMEN WHERE IDGRUPOORCAMEN = '+iIdGrupo);

        if not _CdsAux.IsEmpty then
           Result := _CdsAux.Fields[0].AsString;

     finally
         FreeAndNil(_CdsAux);
     end;
   end;
end;
// Edilaine - SOL 189698 / KTN 1794093 - fim

{ TParamEntradaEspecial }

procedure TParamEntradaEspecial.Clear(AAll : Boolean);
begin
  FParam.iPeriodo       := -1;
  FParam.iExercicio     := -1;
  FParam.iIdPlanoOrc    := -1;
  FParam.iUnidNegoc     := -1;
  FParam.sCodCentRespon := '';
  FParam.iIdPlano       := -1;
  FParam.iIdPatro       := -1;
  FParam.sCodCCusto     := '';
  FParam.iIdSubDespesa  := -1;
  FParam.iIdPrograma    := -1;
  FParam.iIdTIpoDespesa := -1;

  if NOT AAll Then Exit;

  // Grupo Orcamentario
  FGRUPOORCAMEN.Id   := -1;
  FGRUPOORCAMEN.Nome := '';
  FGRUPOORCAMEN.Cod  := '';

end;

constructor TParamEntradaEspecial.Create(ADefaultValues: Boolean);
begin
  if ADefaultValues Then
     Clear;
end;

class function TParamEntradaEspecial.GetParam(AFieldName                : String;
                                              AParamEntradaEspecial     : TParamEntradaEspecial;
                                              ATipoParamEntradaEspecial : TTipoParamEntradaEspecial;
                                              ADefaultValue             : String): String;
//////
  Procedure GetParamValue(Var AResult : String; AString : String; AAspas : Boolean );Overload;
  Begin
     if Trim(AString) <> '' then
        if AAspas then
           AResult := ' (' + AFieldName + ' = ' + QuotedStr(AString)  + ') AND '
        else
           AResult := ' (' + AFieldName + ' = ' + AString             + ') AND ';
  End;
//////
  Procedure GetParamValue(Var AResult : String; AInteger : Integer);Overload;
  Begin
     if AInteger <> (-1) then
        GetParamValue(AResult, IntTostr(AInteger), FALSE);
  End;
//////
begin
  Assert(Trim(AFieldName) <> '', 'Informe o nome do campo!');

  Result := ADefaultValue;

  // NÃO USAR WITH //
  if AParamEntradaEspecial <> Nil Then
     Case ATipoParamEntradaEspecial of
       tpeeCentroCusto : GetParamValue(Result, AParamEntradaEspecial.Parametros.sCodCCusto   , TRUE  );
       tpeeSubDespesa  : GetParamValue(Result, AParamEntradaEspecial.Parametros.iIdSubDespesa);
       tpeePlanoOrc    : GetParamValue(Result, AParamEntradaEspecial.Parametros.iIdPlanoOrc  );
     Else
       Raise EParamEntradaEspecial.Create('Tipo de parâmetro de entrada especial não tratado!');
     end;

end;

class procedure TParamEntradaEspecial.GetParam(var ASQL: String;
                                                   AFieldName: String;
                                                   AParamEntradaEspecial: TParamEntradaEspecial;
                                                   ATipoParamEntradaEspecial: TTipoParamEntradaEspecial;
                                                   ADefaultValue             : String);
begin
   ASQL := ASQL + TParamEntradaEspecial.GetParam(AFieldName,
                                                 AParamEntradaEspecial,
                                                 ATipoParamEntradaEspecial,
                                                 ADefaultValue);
end;

function TCtrlTransacoesPorGrupo.UsuarioCOPEF(AIdUser: Integer): Boolean;
Const
  _SQL = 'Select C.CODCENTROCUSTO'
       + ' From CENTCUST C, USCCUSTO U'
       + ' Where C.NOME = ''COPEF'' '
       + '   and U.CODCENTROCUSTO = C.CodCentroCusto'
       + '   and U.Idempresa      = C.IdEmpresa'
       + '   And U.Idusuario      = ';
Var
  cdsUser : TClientDataSet;
begin
  cdsUser := TClientDataSet.Create(NIL);
  Try
    cdsUser.Data := GetDataPacket(_SQL + IntToStr(AIdUser));
    Result := NOT cdsUser.IsEmpty;
  Finally
    FreeAndNil(cdsUser);
  End;
end;

// Edilaine - SOL 190488 / KTN 1909246
function TCtrlTransacoesPorGrupo.GrupoOrcamentarioxSubdespesa(iIdGrupoOrc: integer): boolean;
var
  CdsLocal : TClientDataSet;
  sqlSub   : String;
begin
   CdsLocal    := TClientDataSet.Create(Nil);

   sqlSub := 'SELECT D.IDDESPESAORC, D.SUBDESPESA, P.NOME ' +
             '  FROM DESPESAORCAMENTARIA D, ' +
             '       PESSOA P ' +
             ' WHERE D.IDFORNECEDOR = P.IDPESSOA(+) ' +
             '   AND D.FLGSTATUSDESPESA = ''A'' ' +  // Edilaine - SOL 193936 / KTN 1852777
             '   AND D.IdGrupoOrcamen = ' + IntToStr( iIdGrupoOrc );
   try
      // pesquisa se existe Subdespesa cadastrada para o grupo
      CdsLocal.Data := GetDataPacket( sqlSub );

      Result := not cdsLocal.isEmpty;
             
   finally
     CdsLocal.Free;
   end;
end;
// Edilaine - SOL 190488 / KTN 1909246 - fim

//Marcio Sanches Spinosa SOL 219322 Kintana 2051324 - Inicio
function TCtrlTransacoesPorGrupo.verificaSubDespesa(
  pIdGrupoOrcamen: Integer): Boolean;
var ssql : string;
begin
  with TClientDataSet.Create(nil) do
  begin
     try
       Data := GetDataPacket('SELECT COUNT(1) AS TOTAL FROM DESPESAORCAMENTARIA WHERE IDGRUPOORCAMEN = ' + IntToStr(pIdGrupoOrcamen));
       Result := (FieldByName('TOTAL').AsInteger > 0);
     finally
       free;
     end;
  end;
end;
//Marcio Sanches Spinosa SOL 219322 Kintana 2051324 - Fim
end.
