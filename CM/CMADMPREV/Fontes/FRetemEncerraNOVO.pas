// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************
//******************************************************************************

{-------------------------------------------------------------------------------
Alteração  : GravaHstPercGrupo
Nº SIG.....: 125281
Data.......: 03/05/2022
Responsável: André Imakawa
Descrição..: Passar parametro da Rotina para a procedure da PercGrupo
//------------------------------------------------------------------------------
Alteração  : (dfm) montaselect
Nº SIG.....: 124016
Data.......: 16/03/2022
Responsável: Edilaine
Descrição..: acrescentar filtro de CPF na procura
//------------------------------------------------------------------------------
Alteração  :
Nº SIG.....: 96001
Data.......: 07/01/2020
Responsável: Ewerton Beltramini
Descrição..: Alteração no filtro do monta select para corrigir a consulta. 
//------------------------------------------------------------------------------
Alteração  :
Nº SIG.....: 70882
Data.......: 06/08/2018
Responsável: Darivaldo Alencar
Descrição..: Inclusão de variável para verificar o menu eventos.
//------------------------------------------------------------------------------
Nº SIG.....: SIG TIBERO
Data.......: 05/03/2018
Responsável: Everson Luiz Pereira da Cunha
Descrição..: Melhoria no Planus para adequação ao TIBERO.
             Inclusão de alias nas tabelas e campos.
             Retirar INDEX, +rule etc
--------------------------------------------------------------------------------
Alteração  : (.dfm qry, qryBenefRecalculo) GeraDemonstrativo
Nº SIG.....: 55933
Data.......: 02/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
//------------------------------------------------------------------------------
Alteração  : bbtnProcurarClick
Nº SOL.....: 40540
Data       : 23/02/2017
Responsável: William Moreira da Silva
Descrição..: Mudança na consulta para buscar os participantes (.dfm)
{-------------------------------------------------------------------------------
Alteração  : GravaHstPercGrupo
Nº SOL.....: 271311
KTN / PPM  : 1361303
Data       : 06/04/2016
Responsável: Edilaine Ferraresi
Descrição..: o historico de percentual não está atualizando corretamente
{-------------------------------------------------------------------------------
Alteração  : GeraDemonstrativo
Nº SOL.....: 253577-18174
KTN / PPM  : 1327585
Data       : 31/03/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento do Deficit - gravação de demonstrativos
{-------------------------------------------------------------------------------
Alteração  : ProcessaRetencao, ProcessaEncerramento
Nº SOL.....: 253577-18152
KTN / PPM  : 1318911
Data       : 10/03/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - associação de taxas
{-------------------------------------------------------------------------------
Alteração  : Gerademonstrativo, ProcessaEncerramento
Nº SOL.....: 253577-17541
KTN / PPM  : 978024
Data       : 16/11/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - retenção/encerra
-------------------------------------------------------------------------------}
// Rotina:     ProcessaEncerramento
// Autor(a)    William Moreira da Silva
// Data        :15/10/2015
// Pendência   :SOL 248936 PPM 1115148
// Descricao   :O fluxo de encerramento não estava cadastrando a data de encerramento.
//------------------------------------------------------------------------------
// Rotina:     ProcessaEncerramento
// Autor(a)    Wylliam Leite da Silva
// Data        :29/05/20145
// Pendência   :SOL 255188 PPM 813109
// Descricao   : Não alterar o campo DATAMORTE na Tabela PESSOAFISICA na rotina
//               de encerramento de beneficio por falecimento, a responsabilidade
//               de alterar essa data é no módulo CadastroPrev na parte de "Eventos".
//------------------------------------------------------------------------------
// Rotina: ProcessaRetencao
// Autor(a)    Fernando Xavier
// Data        :21/11/2014
// Pendência   :SOL 243616 PPM 588500
// Descricao   : ajustar a rotina de encerramento de benefícios, pois com a versão
//               que entrou em produção hoje 21/11/2014 no período da manhã a
//               rotina fica processando infinitamente.
//------------------------------------------------------------------------------
// Rotina: ProcessaRetencao
// Autor(a)    Fernando Xavier
// Data        :17/10/2014
// Pendência   :SOL 241406 PPM 551078
// Descricao   :Ajuste na rotina de encerramento, ao encerrar o benefício altera
//              a situação na tabela benefícios, porém não altera não altera a
//              situação na tabela processos
//------------------------------------------------------------------------------
//Rotina: ProcessaRetencao
//Nº SOL: 236735
//Nº PPM: 474461
//Data da Alteração: 06/08/2014
//Alteração Form: Não foi efetuada alteração de Form
//Responsável: Sadi Freire
//Descrição: Ajuste na rotina de retenção
//*****************************************************************************
//------------------------------------------------------------------------------
// Autor(a)    Fernando Xavier
// Data        :25/07/2013
// Pendência   :SOL 236173 PPM  464127
// Descricao   :Ajuste na rotina de retenção e encerramento
//------------------------------------------------------------------------------
// SOL 236173 PPM  464127
//Rotina: ExecutaOperacoesReservaEContrib, ProcessaEncerramento
//Nº SOL:227769
//Nº KINTANA: 2061696
//Data da Alteração: 13/03/2014
//Alteração Form: retirado o update da PARTPREVPLAN e ELEGPATRO atualizaPart
//Responsável: Felipe A. Santos
//Descrição: comentado o chamado do metodo AtualizaSitPart,
//           para não atualizar as situações do participante no plano e na
//           fundação na PARTPREVPLAN e na ELEGPATRO.
//           Foi comentado a rotina GravaDataVolta, para não gravar mais a
//           DataVolta na tabela EVENTOSPREV
//------------------------------------------------------------------------------
// Autor(a)    :Douglas.Siqueira
// Data        :18/07/2013
// Pendência   :SOL 212205 Ktn 2036676
// Descricao   :Alteração nos parametros para a chamada da pkg.
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Data        : 16/05/2013
// Pendência   : SOL 204393 Ktn 2003327
// Descricao   : O demonstrativo de encerramento do benefício REG/REPLAN Saldado
//               da pensionista Luciana Oliveira Magalhães - 9721586,
//               está vindo em branco.
//------------------------------------------------------------------------------
// Autor(a)    : MARCIO SANCHES SPINOSA KINTANA 1985358 SOL 205240
// Data        : 18/04/2013
// Pendência   : SOL 205240 Kintana 1985358
// Descricao   : Adicionado o idplanoprev no update para evitar erro de chave
//               estrangeira;
//------------------------------------------------------------------------------
// Autor(a)    : Otacilio Aquino
// Data        : 18/01/2013
// Pendência   : SOL 197279.13823 Kintana 1914249
// Descricao   : Alterado filtro para retornar beneficio retido alteração no
//               .dfm no componete de busca antes (PP.FLGDESATIVADO = 0)
//               depois AND ((PP.FLGDESATIVADO = 0) OR (B.IDSITBENEFICIO = 2))
//------------------------------------------------------------------------------
// Autor(a)    : Otacilio Aquino
// Data        : 21/06/2012
// Pendência   : SOL 181600 Kintana 1704215
// Descricao   : O sistema alerta ENCERRAMENTO CANCELADO, porém efetiva todos
//               os acertos e encerra o benefício.
//------------------------------------------------------------------------------
// Autor(a)    : BRUNO AZEVEDO
// Data        : 01/06/2012
// Pendência   : SOL 181561 Kintana 1683560
// Descricao   : Ajustes no acerto financeiro ( Igual ao SOL179728/9861).
//------------------------------------------------------------------------------
// Autor(a)    : Fanuel Marinho
// Data        : 31/05/2012
// Pendência   : SOL179728/9861 Kintana1677119
// Descricao   : Favor corrigir os erros na tela de Retenção e Encerramento de
//               Benefício conforme relatado.
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Data        : 23/05/2012
// Pendência   : SOL 179728 Kintana 1666360
// Descricao   : ENCERRAMENTO DE BENEFÍCIOS: ao tentar encerrar o benefício da
// matricula 3228169 sistema não permite o encerramento.
//--------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Data        : 18/05/2012
// Pendência   : SOL 179681 Kintana 1665289
// Descricao   : ENCERRAMENTO DE BENEFÍCIOS:ajustar o sistema para que a funcionalidade
// faça o encerramento de acordo com a data informada
//--------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 05/04/2012
// Pendência   : SOL 177418 Kintana 1630606
// Descricao   : ERRO NO ENCERRAMENTO -> ChBxEfetuaAcerto deve estar default true
//               não mudar o radiogroup rgrpRetornaPatro para sim deve permanecer
//               não
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 25/11/2010
// Pendência   : SOL 149847 Kintana 1107845
// Descricao   : alteração na funcionalidade dos motivos de retenção e encerramento
//               de benefícios
//------------------------------------------------------------------------------
//Pendência   : SOL 168126 KINTANA 1480544
//Responsável : BRUNO AZEVEDO
//Data        : 08/11/2011
//Descrição   : Correção no acerto financeiro na retenção.
//------------------------------------------------------------------------------
//Pendência   : SOL 167416 KINTANA 1468721
//Responsável : BRUNO AZEVEDO
//Data        : 27/10/2011
//Descrição   : Ajuste na consulta dos benefícios para encerramento.
//------------------------------------------------------------------------------
//Pendência   : SOL 131703/4861 KINTANA 1277622
//Responsável : BRUNO AZEVEDO
//Data        : 06/10/2011
//Descrição   : Ajustes no cálculo do histórico dos encerramentos.
//------------------------------------------------------------------------------
//Pendência   : SOL 166021 KINTANA 1443437
//Responsável : BRUNO AZEVEDO
//Data        : 04/10/2011
//Descrição   : Ajustes na gravação da procedure PR_GRAVAHSTPERCGRUPO.
{//------------------------------------------------------------------------------
//Pendência   : SOL 149847/6241 KINTANA 1405080
//Responsável : FERNANDO XAVIER
//Data        : 13/09/2011
//Descrição   : Erro na inserção do motivo de retenção e encerramento.
//--------------------------------------------------------------------------------
//Pendência   : SOL 160529 KINTANA 1348864
//Responsável : BRUNO AZEVEDO
//Data        : 29/06/2011
//Descrição   : Ajustes quando não efetuamos o acerto no financeiro.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Pendência   : SOL 150727 Kintana 1107056
// Descricao   : Quando for Retenção e o motivo for igual a "CANCELAMENTO DE CONVENIO COM INSS"
// o sistema deve marcar flgpagainss = 0 na BenefbfCiario.
//------------------------------------------------------------------------------
// Autor(a)    : Fanuel Junior
// Data        : 25/11/2010
// Pendência   : SOL 131458 Kintana 751892
// Descricao   : Implementação de um dbcombobox para controlar os motivos de
// retenção e encerramento
//------------------------------------------------------------------------------
//Pendência   : SOL 136380 KINTANA 815875
//Responsável : BRUNO AZEVEDO
//Data        : 01/11/2010
//Descrição   : Travar encerramento por falecimento sem data óbito.
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Passos
// Rotina      : AcertaSituacaoProcesso / ProcessaRetenção / ProcessaEncerramento
// Data        : 18/12/2009
// Pendência   : SOL: 127564 KINTANA: 692657
// Alteração   : Acerta nas rotinas para gravarem corretamente o IDSITPROCESSO
//               da tabela ProcessoBenef conforme IDSitBeneficio da Benefbfciario
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Passos
// Rotina      : GravaHstPerc
// Data        : 26/02/2010
// Pendência   : SOL: 32837 KINTANA: 32837
// Alteração   : Ao encerrar um beneficio, gerar o historico de percentual
//               para o grupo familiar
// -----------------------------------------------------------------------------

// Autor(a)    : Adler Souza
// Rotina      : ExecutaOperacoesReservaEContrib
// Data        : 21/09/2009
// Pendência   : SOL: 124313 KINTANA: 632219
// Alteração   : A rotina estava desmarcando o FLGCOBRA tanto para retenção
//               quanto encerramento, mas no caso de retenção não deverá haver
//               esta desmarcação
// -----------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Rotina      : Diversas
// Data        : 30/06/2009
// Pendência   : 102758 - KINTANA 534.895
// Alteração   : Implementar tela de critica ao usuário nos processos de RESGATE
//               DE CONTRIBUICOES,não obrigando necessariamente o encerramento
//               de beneficio vitalício, conforme demonstrado nas telas em anexo.
// -----------------------------------------------------------------------------
// Autor(a)    : Ádler Teodoro de Souza
// Data        : 13/08/2009
// SOL         : 122922
// Kintana     : 609589
// Descricao   : Alteração na função ValidaBeneficioAnterior para aceitar o UPDATE
//               pela data de Encerramento(fReabNovaData) e não data do evento.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 10/08/2009
// Rotina      : QryTitular
// Pendencia   : SOL 122820 Kintana 609292
// Alteração   : Foi retirado a condição "AND PP.FLGDESATIVADO = 0" da qryTitular,
// pois os dados do participante não aparecia no relatorio de encerramento.
// -----------------------------------------------------------------------------

Rotina........: MostraDemonstrativoParticipante e  MostraDemonstrativoBeneficiario
N. Sol........: 97656
N. Kintana....: 425066
Data..........: 02/10/2008
Responsável...: Denise Arruda
Descrição.....: Acerto na data de falecimento no momento da geração do
                demonstrativo.
                A aplicação estava manipulando incorretamente a data digitada
                pelo usuário.
-----------------------------------------------------------------------------}
// Autor(a)    : Daniel Begnami
// Data        : 20/08/2008
// Rotina      : ProcessaEncerramento
// Pendencia   : SOL 93755
// Alteração   : Grava FLGTIPOREGISTRO = 1 (abono) para quando encerrado
// -----------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 06/05/2008
// Rotina      : qry
// Pendencia   : 27868
// Alteração   : Ajuste na qry que estava errada
// -----------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 05/09/2007
// Rotina      : PessoaChangeSubtipo
// Pendencia   : 22119
// Alteração   : Confirmar que a FrmAguarde seja sempre fechada qdo terminar a uma operação
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/08/2007
// Pendência   : 24821
// Rotina      : Varias
// Descricao   : Tratamento para possibilitar não efetuar acertos financeiros 
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/06/2007
// Pendencia   : 25642
// Rotina      : ProcessaEncerramento
// Alteração   : Comentada linha da query para não filtrar sitrecebimento = 9
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/04/2007
// Pendencia   : 23993
// Descrição   : Acerto na consulta dos acertos de contribuição para tratar Pensões
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 10/11/2006
// Pendencia   : 19483
// Rotina      : ProcessaEncerramento
// Alteração   : No caso de encerramento de retidos Atualizar os valores entre a retenção e o encerrramento
//               para serem pagos/cobrados dos beneficiários 
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Rotina      : ProcessaEncerramento
// Data        : 10/08/2006
// Pendencia   : 21821
// Descrição   : Desativação das rubricas individuais em caso de falecimento
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/06/2006
// Pendencia   : 22554
// Descrição   : Somente encerrar contribuições se não for beneficio do INSS
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 11/04/2006
// Pendência   : 21835
// Rotina      : ExecutaOperacoesReservaEContrib
// Descricao   : caso a tela fosse chamada do menu, flgevento = 'ts', e o motivo do encerramento
//               fosse falecimento, estava atualiazando o SITPART na PARTPREVPLAN
//------------------------------------------------------------------------------
// Rotina      : Qry / ProcessaRetencao / ProcessaEncerramento
// Autor(a)    : Augusto
// Data        : 15/02/2006
// Descrição   : 1) Atualizar O ULTMESPREPARO da BENEFBFCIARIO, quando Retenção
// Data        : 14/02/2006
// Descrição   : 1) Incluir CtrlBenefBfciario
// Data        : 10/02/2006
// Pendencia   : 19533
// Descrição   : 1) Atualizar o percentual de rateio de pensão com a cota pelo
//                  numero de beneficiários ativos.
// Data        : 17/01/2006
// Pendencia   : 21249
// Descrição   : 1) Retirar filtro nos beneificios do INSS. A rotina processará os
//                  beneficios, mesmo os de referencia, independentemente.
//               2) Somente encerrar contribuições se não for beneficio do INSS
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 10/01/2006
// Pendência   : 19531
// Rotina      : PedeInformacoesOperacao
// Descricao   : 1) Novo item para a lista de motivos de encerramento e retenção "CANCELAMENTO DE CONVENIO COM INSS"
//               2) Caso cancelamento de convenio DATAFINALPREVISTA = Ultimo dia do mês
// Rotina      : ProcessaRetencao
//               1) Novo valor para FLGENVIADO caso cancelamento de convenio, 8
//               2) Caso cancelamento de convenio FLGPAGAINSS = 0
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/01/2006
// Pendência   : 21190
// Rotina      : sbtnEncerramentoClick
// Descricao   : Nova resposta do formulário caso usuário cancele após exibir o demonstrativo  
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 28/12/2005
// Pendência   : 21081
// Rotina      : ProcessaEncerramento
// Descricao   : Passagem do parametro FLGINTEVENTO corretamente, FL - Falecimento.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 01/09/2005
// Pendência   : 20098
// Rotina      : GravaDataVolta
// Descricao   : retirei a cláusula EP.IDPLANOPREV     = '+pIdPlanoPrev+  para tratar participantes migrados.
//               participantes migrados tem o evento no plano anterior e o benefício no atual.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 08/08/2005
// Pendência   : 19240
// Rotina      : MostraDemonstrativoParticipante
// Descricao   : Acerto para visualizar em qual lote foram inseridos os acertos.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 02/08/2005
// Pendência   : 18993
// Rotina      : bbtnProcurarClick
// Descricao   : Atribuir o valor a variavel SFLGEVENTO caso venha direto pelo menu.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 15/07/2005
// Pendência   : 18892
// Rotina      : PedeInformacoesOperacao
// Descricao   : Criação de novos motivos para retenção.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/04/2005
// Pendência   : 18936
// Rotina      : ExecutaOperacoesReservaEContrib
// Descricao   : Para executar a rotina de atualização de situações do participante,
//               verifica também o parâmetro sFlgIntEvento
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 25/04/2005
// Pendência   : 18894
// Rotina      : ProcessaRetencao
// Descricao   : Retirado o update na contribprevapart para que se façam os devidos
//               cálculos na retenção.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 22/04/2005
// Pendência   : 18895
// Rotina      : Grid principal da tela
// Descricao   : Retirada do Nº do processo do mestre e colocado no grid do detalhe
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 02/02/2005
// Pendência   : 18711
// Rotina      : ProcessaEncerramento
// Descricao   : Acerto na chamada da função ProcessaAcertosRetemEncerra para
//               benefício de referência, informando o parâmetro de ENCERRAMENTO.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 02/02/2005
// Pendência   : 18610
// Rotina      : ProcessaEncerramento
// Descricao   : Só efetuar o UPDATE na PESSOAFISICA se vier pelo menu, pois a
//               concessão de benefícios de pensão já registra no evento de falecimento.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 14/01/2005
// Rotina      : ProcessaEncerramento
// Descricao   : Acerto na rotina para permitir encerramento de benefícios retidos.
//------------------------------------------------------------------------------
// Autor(a)    : LeoFuncef
// Data        : 27/10/2004
// Rotina      : ProcessaRetencao
// Descricao   : modificação da crítica de valores posteriores a data de encerramento
//               não considerando pagamentos efetuados
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 07/10/2004
// Rotina      : MostraDemonstrativoBeneficiario
// Alteração   : seleção do idpessoa do beneficiário, que estava sendo feito com o id do titular
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 30/09/2004
// Pendencia   : 16631
// Alteração   : Acerto no demonstrativo para mostrar beneficios do processo
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 23/09/2004
// Pendencia   : 17747
// Alteração   : Atualiza DATAMORTE na PESSOAFISICA quando encerrado por falecimento
//------------------------------------------------------------------------------
unit FRetemEncerraNOVO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Grids, Wwdbigrd, Wwdbgrid, Db,
  DBTables, Wwquery, Wwdatsrc, Mask, DBCtrls, uCtrlBenefBfciario, fcLabel,
  uDataBase, uDiasUteis, wwstorep, FPreview;

type
  TfrmRetemEncerraNOVO = class(TfrmOkCancelar)
    MontaSelect: TMontaSelect;
    ds: TwwDataSource;
    qry: TwwQuery;
    dbgrdBeneficiarios: TwwDBGrid;
    dbgrdBeneficiariosIButton: TwwIButton;
    pnlTitular: TPanel;
    pnlSubTitulo: TPanel;
    Label13: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    upd: TUpdateSQL;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    pnlBotoesRetemEncerra: TPanel;
    lblTitulo: TLabel;
    lblBeneficiario: TLabel;
    qryGrava: TwwQuery;
    qryAux: TwwQuery;
    qryBenefRef: TwwQuery;
    qryBenefRecalculo: TwwQuery;
    qryBenefRecalculoFLGPROCESSA: TFloatField;
    qryBenefRecalculoIDPESSOA: TFloatField;
    qryBenefRecalculoIDTITULAR: TFloatField;
    qryBenefRecalculoIDPLANOPREV: TFloatField;
    qryBenefRecalculoSEQPROPOSTA: TFloatField;
    qryBenefRecalculoIDPESSJUR: TFloatField;
    qryBenefRecalculoIDBENEFICIO: TFloatField;
    qryBenefRecalculoNUMEROPROCESSO: TFloatField;
    qryBenefRecalculoNUMPROCINSS: TStringField;
    qryBenefRecalculoVALORATUAL: TFloatField;
    qryBenefRecalculoVALORCALCULADO: TFloatField;
    qryBenefRecalculoVALORCOTAS: TFloatField;
    qryBenefRecalculoVALORTOTAL: TFloatField;
    qryBenefRecalculoVLRCALCINSS: TFloatField;
    qryBenefRecalculoVLRINFINSS: TFloatField;
    qryBenefRecalculoDATAFINAL: TDateTimeField;
    qryBenefRecalculoDATAINICIO: TDateTimeField;
    qryBenefRecalculoDATAINICIOFUND: TDateTimeField;
    qryBenefRecalculoDATAINICIOINSS: TDateTimeField;
    qryBenefRecalculoDATAREQUERIMENTO: TDateTimeField;
    qryBenefRecalculoIDSITBENEFICIO: TFloatField;
    qryBenefRecalculoIDTPPAGTOBENEFIC: TFloatField;
    qryBenefRecalculoULTMESREAJUSTE: TStringField;
    qryBenefRecalculoCODPORTFORMA: TFloatField;
    qryBenefRecalculoVALORBASE1: TFloatField;
    qryBenefRecalculoVALORBASE2: TFloatField;
    qryBenefRecalculoVALORBASE3: TFloatField;
    qryBenefRecalculoNOME: TStringField;
    qryBenefRecalculoIDPLANOORIGEM: TFloatField;
    qryBenefRecalculoPERCENTUAL: TFloatField;
    qryBenefRecalculoIDDEPENDENCIA: TStringField;
    qryBenefRecalculoNUMBENEF: TFloatField;
    qryBenefRecalculoFLGPROVISORIO: TFloatField;
    qryBenefRecalculoPRAZOPROVISORIO: TFloatField;
    qryBenefRecalculoPERCPROVISORIO: TFloatField;
    updBenefRecalculo: TUpdateSQL;
    qryResultadoHst: TwwQuery;
    qryResultado: TwwQuery;
    qryResultadoIDBENEFICIO: TFloatField;
    qryResultadoDESCRICAO: TStringField;
    qryResultadoVALORTOTAL: TFloatField;
    qryResultadoVALORATUAL: TFloatField;
    qryResultadoFLGPROVISORIO: TFloatField;
    qryResultadoPERCPROVISORIO: TFloatField;
    qryResultadoVALORCOTAS: TFloatField;
    qryResultadoVLRINFINSS: TFloatField;
    qryResultadoVLRCALCINSS: TFloatField;
    qryResultadoDATAINICIO: TDateTimeField;
    qryResultadoDATAFINALPREVISTA: TDateTimeField;
    qryResultadoDATAFINAL: TDateTimeField;
    qryResultadoDATAREQUERIMENTO: TDateTimeField;
    qryResultadoDATAINICIOINSS: TDateTimeField;
    qryResultadoDATAINICIOFUND: TDateTimeField;
    qryResultadoFLGPOSSUIACOMPINSS: TFloatField;
    qryResultadoNOME: TStringField;
    qryResultadoVALORCALCULADO: TFloatField;
    qryResultadoNUMEROPROCESSO: TFloatField;
    qryResultadoFLGFORMAPAGTO: TStringField;
    qryResultadoDATAULTREAJUSTE: TDateTimeField;
    qryResultadoIDPESSJUR: TFloatField;
    qryResultadoIDPLANOPREV: TFloatField;
    qryResultadoIDTITULAR: TFloatField;
    qryResultadoIDPESSOA: TFloatField;
    qryResultadoSEQPROPOSTA: TFloatField;
    qryResultadoCODPORTFORMA: TFloatField;
    qryResultadoIDSITBENEFICIO: TFloatField;
    qryResultadoIDDEPENDENCIA: TStringField;
    qryResultadoIDTPPAGTOBENEFIC: TFloatField;
    qryResultadoVALORBASE1: TFloatField;
    qryResultadoVALORBASE2: TFloatField;
    qryResultadoVALORBASE3: TFloatField;
    qryResultadoNUMPROCINSS: TStringField;
    qryResultadoNUMORDEMEVENTO: TFloatField;
    qryResultadoFLGRESGATE: TFloatField;
    qryResultadoDATACONCESSAO: TDateTimeField;
    qryResultadoPRAZOPROVISORIO: TFloatField;
    qryResultadoULTMESREAJUSTE: TStringField;
    qryResultadoULTVALORATUALREAJ: TFloatField;
    qryResultadoIDAGENCIARESGATE: TFloatField;
    qryResultadoIDRUBSALAUXDOENCA: TFloatField;
    qryResultadoFLGDATAPREVISTA: TFloatField;
    qryResultadoFLGTIPOINSS: TFloatField;
    qryResultadoDIBBENEFANT: TDateTimeField;
    qryResultadoVALORBENEFANT: TFloatField;
    qryResultadoFLGREFERENCIA: TFloatField;
    qryResultadoVALORBINSSANT1: TFloatField;
    qryResultadoVALORBINSSANT2: TFloatField;
    qryResultadoVALORBINSSANT3: TFloatField;
    qryResultadoVALORSRB: TFloatField;
    qryResultadoNOMEBENEFICIARIO: TStringField;
    qryResultadoFLGISENTOIRRF: TFloatField;
    qryTitular: TwwQuery;
    qryResultadoDATAFINALPRINT: TDateTimeField;
    pnlBotaoProcurar: TPanel;
    bbtnProcurar: TBitBtn;
    qryBenefAUX: TwwQuery;
    Panel1: TPanel;
    fcLabel1: TfcLabel;
    sbtnEncerramento: TSpeedButton;
    sbtnRetencao: TSpeedButton;
    sbtnAvanco: TSpeedButton;
    wwStoredProc1: TwwStoredProc;
    StoredProc1: TStoredProc;
    qryBenefRecalculoVLRBSTOTAL: TFloatField;
    qryBenefRecalculoVLRBSATUAL: TFloatField;
    qryBenefRecalculoVLRFABTOTAL: TFloatField;
    qryBenefRecalculoVLRFABATUAL: TFloatField;
    qryBenefRecalculoVLRBASEDEFICIT: TFloatField;
    qryBenefRecalculoIDPERFILINVEST: TFloatField;
    qryBenefRecalculoIDPERFILINVEST_1: TFloatField;
//    wwStoredProc1: TwwStoredProc;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure sbtnRetencaoClick(Sender: TObject);
    procedure sbtnEncerramentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbgrdBeneficiariosDblClick(Sender: TObject);
    procedure sbtnAvancoClick(Sender: TObject);
    // SOL 181600 Kintana 1704215 Otacilio aquino
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
     sMsgErro                        : string;
     sMotivo                         : string;
     sMotivoReal                     : string;	 
     sNovaDataFinal                  : string;
     sAnoMesPagamento                : string;
     sRetemEncerra                   : string;
     sIdsBeneficio, sNumeroProcesso  : string;
     sSQL                            : string;
     sSalarioIntegral                : string;
     sIdEventosPrev                  : string;
     sIdSitPart                      : string;
     sIdSitPlano                     : string;
     sIdSitFunc                      : string;
     sFlgIntEvento                   : string;
     
     iFlgDataPrevista                : word;
     iFlgIncluiMesConc               : integer;
     iNumBenef                       : integer;

     bAlgumProvisorio                : boolean;
     bVoltouPatro                    : boolean;
     bEncerraPorFale                 : boolean;
     bApenasMudouPrevistaParaEfetiva : boolean;
     bEncerraProvisorioPorInss       : boolean;
     bAlgumBenefTemp                 : boolean;

     iIdLoteRetemEncerra             : longint;
     iIdMotivoAux                    : longint;

     sdataInicioProcesso : string;   // edilaine - SOL 253577-17541 / PPM 978024

     CtrlBenefBfciario               : TCtrlBenefBfciario;

     function  ExecutaVerificacoes     ( pcOperacao : char ) : boolean;
     function  PedeInformacoesOperacao ( pcOperacao : char ) : boolean;
     function  PedeLoteOperacao        ( pcOperacao : char ) : boolean;
     function  PreencheMotivoRetemEncerra ( pcOperacao : char ) : longint;
     function  ExecutaOperacoesReservaEContrib( pcOperacao : char ) : boolean;
     function  CalculaNumeroBeneficiarios                    : integer;
     Function AcertaSituacaoProcesso(iSituacao: integer; iProcesso: Integer): boolean;
     function  ProcessaRetencao                              : boolean;
     function  ProcessaEncerramento                          : boolean;
     function  GravaDataVolta          ( pIdPessoa         : string;
                                         pIdPlanoPrev      : string;
                                         pIdPessjur        : string;
                                         pSeqProposta      : string;
                                         pIdEventoGerador  : string;
                                         pDataVolta        : string;
                                         pDataEvento       : string ) : boolean;
                                         
     function AtualizaSitPart          ( pIdPessoa         : string;
                                         pIdPlanoPrev      : string;
                                         pIdPessjur        : string;
                                         pSeqProposta      : string ) : boolean;


     procedure AtualizaSalarioMantido  ( sDataEncerramento : string);
     procedure GravaHstPercGrupo;//Ádler
     procedure MostraDemonstrativoParticipante (pcOperacao : char);
     procedure MostraDemonstrativoBeneficiario (pcOperacao : char);
     function  VerificaBeneficioINSS(pIdPessoa: Integer): Boolean; //BRUNO AZEVEDO SOL 136380 KINTANA 815875

     procedure GeraDemonstrativo(pcOperacao : char ;  // edilaine - SOL 253577-17541 / PPM 978024
                                 sStatusDemonstrativo : string = '' );          // edilaine - SOL 253577-18174 / PPM 1327585

  public
    { Public declarations }
    iNumeroProcesso                  : longint;
    iIdTitular                       : longint;
    iIdPessJur                       : longint;
    iIdPlanoPrev                     : longint;
    iIdPessoa                        : longint;
    iSeqProposta                     : longint;
    iIdPlanoOrigem                   : longint;

    bVeioDoMenu                      : boolean;
    bEncerrou                        : boolean;
    bObrigaDataEncerra               : boolean;
    bOperacaoEmAberto                : boolean;
    bCancelouEncerramento            : boolean; { Indica se cancelou o encerramento após demonstrativo }
    bEfetuaAcertoFinanceiro          : Boolean; { Indica se deverá ou não fazer acerto financeiro no encerramento }

    sFlgEvento                       : string;
    sDataFinalPrevista               : string;
    bEventoMorte                     : Boolean; //SOL 122922 - Ádler Souza
    bEncInssAnt                      : Boolean; //BRUNO AZEVEDO SOL 136380 KINTANA 815875
	bOutroEvTmp                      : Boolean; //Darivaldo Alencar SIG70882
  end;

var
  bRetemEncerraProvisorio, bProcessouSuplementacao : Boolean; //variável para controlar a chamada pela tela principal
  frmRetemEncerraNOVO: TfrmRetemEncerraNOVO;

implementation

uses DBaseDados,UMensErro, FReabNovaData, fAguarde, UAdmPrev, UBeneficio, FSelecionaLote,
     UParticipante, UContribuicaoPrev, FMostraAux, UFuncoesUteis, USistema,
     RDemonstraBeneficios,   // edilaine - SOL 253577-17541 / PPM 978024
     UMovReserva, UEventos;

{$R *.DFM}

function  TfrmRetemEncerraNOVO.ExecutaVerificacoes( pcOperacao : char) : boolean;
var bAlgum             : boolean;
    sBenefNaoMarcados  : string;
begin
   Result := False;

   if bOperacaoEmAberto
   then begin
      MsgDlg('Existe uma operação de '+sRetemEncerra+' ainda em aberto. '+#13+
             'Confirme ou Cancele esta operação antes de iniciar uma nova.','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   // 1. Verificar se algum registro foi selecionado e preencher variavel bAlgumProvisorio
   qry.First;
   bAlgum := False;
   bAlgumProvisorio := False;
   while not qry.Eof do
   begin
      if qry.FieldbyName('PROCESSAR').AsInteger = 1
      then bAlgum := True;

      if qry.FieldbyName('FLGPROVISORIO').AsInteger = 1
      then bAlgumProvisorio := True;
      qry.Next;
   end;

   if not bAlgum
   then begin
      MsgDlg('Selecione o(s) benefícios a processar clicando no '+#13+
             'campo "processar" de cada um dos benefícios desejados.','Informação',mtInformation,[mbOK],0);
      Exit;
   end;

   // 2. Verificar se algum benefício de uma pessoa foi selecionado e a pessoa
   //    tem outros beneficios em aberto
   qry.First;
   sBenefNaoMarcados := '';
   sIdsBeneficio     := ''; sNumeroProcesso := '';
   bAlgum            := False;
   bAlgumProvisorio := False;

   while not qry.Eof do
   begin
      if qry.FieldbyName('PROCESSAR').AsInteger = 0
      then begin
         if qry.FieldbyName('IDSITBENEFICIO').AsInteger = 1
         then sBenefNaoMarcados := sBenefNaoMarcados+#13+qry.FieldByName('NOMEBENEFICIO').AsString
      end
      else begin
         bAlgum := True;

         if Trim(sIdsBeneficio) = ''
         then sIdsBeneficio := QuotedStr(qry.FieldByName('IDBENEFICIO').AsString)
         else sIdsBeneficio := sIdsBeneficio +','+QuotedStr(qry.FieldByName('IDBENEFICIO').AsString);

         if Trim(sNumeroProcesso) = ''
         then sNumeroProcesso := QuotedStr(qry.FieldByName('NUMEROPROCESSO').AsString)
         else sNumeroProcesso := sNumeroProcesso +','+QuotedStr(qry.FieldByName('NUMEROPROCESSO').AsString);

      end;

      if qry.FieldByName('FLGPROVISORIO').AsInteger = 1
      then bAlgumProvisorio := True; 

      qry.Next;
   end;

   if bAlgum and (sBenefNaoMarcados <> '')
   then begin
      if MsgDlg('A pessoa '+qry.FieldbyName('NOME').AsString+' possui benefícios que não foram marcados para processar.'+#13+
                'Esses benefícios são : '+sBenefNaoMarcados+#13+
                'Confirma o processamento apenas do(s) benefício(s) selecionado(s) ? ','Confirmação',mtConfirmation, [mbYes,mbNo],0) = mrNo
      then Exit;
   end;

   Result := True;
end;

function  TfrmRetemEncerraNOVO.PedeInformacoesOperacao (pcOperacao : char ) : boolean;
var
    mrNovaData       : TModalResult;
    sDataFinalAnt : String;
begin
  inherited;

  Result := False;

  if bOperacaoEmAberto
  then begin
     MsgDlg('Existe uma operação de '+sRetemEncerra+' ainda em aberto. '+#13+
            'Confirme ou Cancele esta operação antes de iniciar uma nova.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  bOperacaoEmAberto := True;

  // Posicionar no 1o. registro a processar
  qry.First;
  qry.Locate('PROCESSAR',1,[loCaseInsensitive]);
  frmReabNovaData := TfrmReabNovaData.Create(Application);
  frmReabNovaData.pcOperacao := pcOperacao;

  with frmReabNovaData do
  begin
     bOutrosEvTmp               := bOutroEvTmp; //Darivaldo Alencar SIG70882;
     
     edDtInicioAntes.Text       := qry.FieldByName('DataInicio').AsString;
     edDtFinalAntes.Text        := qry.FieldByName('DataFinal').AsString;
     dtInicio.Visible           := False;
     lblDtInicio.Visible        := False;
     if (pcOperacao = 'E')
     then lblDtFinal.Caption    := 'Data de Encerramento'   // Encerramento
     else lblDtFinal.Caption    := 'Data de Retenção' ;      // Retenção
     rgrpReabertura.Visible     := False;

     liIdPessoa   := iIdTitular;
     liIdPessJur  := iIdPessJur;
     edtMatricula.Text := qry.FieldByName('MATRICULA').AsString;
     sEvento := sFlgEvento; //BRUNO AZEVEDO SOL 136380 KINTANA 815875
     sFontePagadora := qry.FieldByName('FONTEPAGADORA').AsString; //BRUNO AZEVEDO SOL 136380 KINTANA 815875
     bVeioMenu := bVeioDoMenu; //BRUNO AZEVEDO SOL 136380 KINTANA 815875
     bEncerrarInssAnt := bEncInssAnt; //BRUNO AZEVEDO SOL 136380 KINTANA 815875

     if (pcOperacao = 'E')        // Encerramento
     then begin
        rgrpEncerramento.Visible   := True;
        rgrpEncerramento.Caption:='   Motivo do Encerramento   ';
   {     With cbMotivo.Items do
         Begin
          Clear;
          Add('COMPLETOU MAIORIDADE');
          Add('FALTA DE RECADASTRAMENTO');
          Add('MUDANÇA DE ESTADO CIVIL');
          Add('CANCELAMENTO PELO INSS');
          Add('CONCLUSÃO DE CURSO SUPERIOR');
          Add('FALECIMENTO');
          Add('OUTROS');
         End;     }
     end
     else if (pcOperacao = 'R')   // Retenção
          then begin
            rgrpEncerramento.Visible   := True;
            rgrpEncerramento.Caption:='   Motivo da Retenção   ';
         {   With cbMotivo.Items do
             Begin
              Clear;
              Add('COMPLETOU MAIORIDADE');
              Add('FALTA DE RECADASTRAMENTO');
              Add('MUDANÇA DE ESTADO CIVIL');
              Add('CANCELAMENTO PELO INSS');
              Add('CONCLUSÃO DE CURSO SUPERIOR');  }
              

              { Era 'MUDANÇA PARA FORA DO CONVÊNIO' e a gora somente se FLGPAGAINSS = 1 }
            {  If Qry.FieldByName('FLGPAGAINSS').AsInteger = 1 Then Add('CANCELAMENTO DE CONVENIO COM INSS');     }

          {    Add('SEM DEPENDENTE VÁLIDO (INSS)');
              Add('BENEFICIÁRIO SEM CPF (INSS)');
              

              Add('OUTROS');
             End;             }
             If Qry.FieldByName('FLGPAGAINSS').AsInteger <> 1 Then
                  frmReabNovaData.qryMotivore.SQL.Add('AND ID_MOTIVO <> 11');
          end
     else rgrpEncerramento.Visible   := False;

     dtInicio.Enabled           := False;
     lblDtInicio.Enabled        := False;
     lblDtFinal.Left            := 130;
     dtFinal.Left               := 130;
     dtFinal.Text               := '';
     rgrpReabertura.ItemIndex   := -1;
  {   cbMotivo.ItemIndex         := -1;  }
     bVoltouPatro               := False;
     if pcOperacao = 'R'
     then iFlgDataPrevista := 1
     else iFlgDataPrevista := 0;

     if iFlgDataPrevista = 1
     then rgrpDataPrevEfet.ItemIndex := 0
     else rgrpDataPrevEfet.ItemIndex := 1;

     rgrpDataPrevEfet.Enabled := False;

     if (pcOperacao = 'E') and (bObrigaDataEncerra) and (not bVeioDoMenu)
     then begin
        
        if Trim(sDataFinalPrevista) = '' then sDataFinalPrevista := FormatDateTime('dd/mm/yyyy', Date); 
        dtFinal.Text     := sDataFinalPrevista;
     end;
     { Caso encerrando beneficio provisório, data final = DIB }
     If (bRetemEncerraProvisorio = True) and (bVeioDoMenu) Then Begin
       dtFinal.Text := qry.FieldByName('DataInicio').AsString;
     End;
     Caption                  := 'Datas para '+sRetemEncerra+' de Benefício';
  end;

  mrNovaData        := frmReabNovaData.ShowModal;
  sMotivo           := frmReabNovaData.sMotivo;
  bOperacaoEmAberto := frmReabNovaData.bDatasOK;
  sNovaDataFinal    := Trim(frmReabNovaData.dtFinal.Text);
  if frmReabNovaData.bErroMensagem then
     mrNovaData        := frmReabNovaData.ShowModal;

  bEfetuaAcertoFinanceiro := frmReabNovaData.EfetuaAcertoFinanceiro;

  { Caso cancelamento de convenio DATAFINALPREVISTA = Ultimo dia do mês }
  If sMotivo = '11' Then Begin

    sDataFinalAnt  := sNovaDataFinal;
    
    sNovaDataFinal := FormatDateTime('dd/mm/yyyy', DiasUteis.UltDiaMes ( StrToInt( Copy(sNovaDataFinal,7,4) ), StrToInt( Copy(sNovaDataFinal,4,2) ) ) ); 

    If sDataFinalAnt <> sNovaDataFinal Then Begin
      If MsgDlg('No caso de Cancelamento de Convênio com o INSS, a data de retenção deve '+#13+
                'ser no último dia do mês. Deseja continuar com a data '+sNovaDataFinal+'?',
                'Atenção',mtConfirmation,[mbYes,mbNo],0) = mrNo
      Then Begin
         frmAguarde.Apaga;
         Exit;
      End;
    End

  End;

  
  if (pcOperacao = 'E')        // Encerramento
  then bEncerraPorFale := ( frmReabNovaData.iMotivo = 5)
  else bEncerraPorFale := False;

  if bEncerraPorFale then
     sFlgIntEvento := 'FL'
  else
     sFlgIntEvento := ''; // Thiago Melo SOL 1797280 Kintana 1666360


  if bAlgumProvisorio and (StrToInt(frmReabNovaData.dbcbMotivore.LookupValue) = 3)
  then bEncerraProvisorioPorInss := True
  else bEncerraProvisorioPorInss := False;

  if frmReabNovaData.rgrpDataPrevEfet.ItemIndex = 0
  then iFlgDataPrevista := 1
  else iFlgDataPrevista := 0;


  if frmReabNovaData.rgrpRetornaPatro.ItemIndex = 0
  then bVoltouPatro := False
  else bVoltouPatro := True;

  if mrNovaData = mrCancel then begin
     frmReabNovaData.Free;
     Exit;
  end;
  frmReabNovaData.Free;

  if Trim(sNovaDataFinal) = '' then begin
     MsgDlg('Informe a data para '+sRetemEncerra+'.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  // Garantir que a data final está com o ano com 4 digitos
  try
     
     sNovaDataFinal := FormatDateTime('dd/mm/yyyy', StrToDate(sNovaDataFinal)); 
  except
    MsgDlg('Data com formato inválido.','Erro',mtError,[mbOk],0);
    Exit;                                                        
  end;

  Result := True;
end;

function  TfrmRetemEncerraNOVO.PedeLoteOperacao (pcOperacao : char ) : boolean;
begin
  Result := False;                       

  if bEncerraPorFale and (not prmFLGENVACERTOFALEC) then iIdLoteRetemEncerra := -1;

  if (iIdLoteRetemEncerra <= 0)  and
     ((not bEncerraPorFale) or (prmFLGENVACERTOFALEC) )       and 
     ( (not bEncerraProvisorioPorInss)  ) 
  then begin
     { sAnoMespagamento tbm é preenchida com a Data do Lote}
     iIdLoteRetemEncerra := SelecionaLoteBeneficioAberto( sAnoMesPagamento, iFlgIncluiMesConc );

     if iIdLoteRetemEncerra <= 0
     then begin
        frmAguarde.Apaga;
        MsgDlg('Nenhum lote selecinado para efetuar a '+sRetemEncerra+'. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
        if bVeioDoMenu and dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.RollBack;
        if pcOperacao = 'E' then bEncerrou := False;
        bOperacaoEmAberto := false;            // edilaine - SOL 253577-18152 / PPM 1318911
        Exit;
     end;
  end;

  if Trim(sAnoMesPagamento) = ''
  then sAnoMesPagamento := Copy(sNovaDataFinal,7,4)+Copy(sNovaDataFinal,3,3);

  Result := True;
end;

function  TfrmRetemEncerraNOVO.ProcessaRetencao : boolean;
Var
  sFlgEnviado, sUltDataMes : String;

begin
  Result := False;

  if not PedeLoteOperacao ('R') then Exit;

  iIdCalculoGeral := 0;

  if (qry.FieldByName('IDTITULAR').AsInteger = qry.FieldByName('IDPESSOA').AsInteger)
  then AtualizaSalarioMantido(sNovaDataFinal);


  // Abrir query com outros beneficiarios do processo com parametros iguais a -1
  // porque a RETENCAO NUNCA deve recalcular os beneficios desses outros beneficiarios
  with qryBenefRecalculo do
  begin
     Close;
     ParamByName('NumeroProcesso').AsInteger := -1;
     ParamByName('IdPessoa').AsInteger       := -1;
     Open;
  end;

  bProcessouSuplementacao := False; 
  qry.first;
  while not qry.Eof do
  begin
     if ( (qry.FieldByName('PROCESSAR').AsInteger       = 0) or
          (qry.FieldByName('IDSITBENEFICIO').AsInteger  = 2) or
          (qry.FieldByName('IDSITBENEFICIO').AsInteger  = 3) )
     then begin
        qry.Next;
        continue;
     end;

     { Guarda FLG caso tenha processado suplementação }
     If (qry.FieldByName('FLGREFERENCIA').AsInteger = 0) Then bProcessouSuplementacao := True;

     frmAguarde.Mostra('Analisando '+qry.FieldByName('NOMEBENEFICIO').AsString+' ... ');

     // Verificar parametro prmFLGRETDATAANT
     // Se for retencao e a parametrizacao não permitir reter beneficios com data
     // anterior ao ultimo pagamento
     // Entao verificar o ultimo pagamento para saber se o benefício poderá ser retido
     if (not prmFLGRETDATAANT) and
        (qry.FieldByName('ULTMES').AsString <> '') and
        (Copy(sNovaDataFinal,7,4)+'/'+Copy(sNovaDataFinal,4,2) <= qry.FieldByName('ULTMES').AsString) then
     begin
       frmAguarde.Apaga;
       MsgDlg('Existem pagamentos posteriores a data '+sNovaDataFinal+#13+
              'e o sistema está parametrizado para não aceitar retenções com data '+#13+
              'anterior ao último pagamento. Verifique.','Erro',mtError,[mbOK],0);
       Exit;
     end;

     iIdMotivoAux := PreencheMotivoRetemEncerra('R');

     if iIdMotivoAux <= 0 then
     begin
       frmAguarde.Apaga; 
       MsgDlg(sMsgErro,'Erro',mtError,[mbOK],0);
       Exit;
     end;

     if BenefExistePREVIA ( qryAux,
                            qry.FieldByName('IDPESSJUR').AsInteger,
                            qry.FieldByName('IDTITULAR').AsInteger,
                            qry.FieldByName('IDPLANOPREV').AsInteger,
                            prmIdMotivoFolhaBen,
                            qry.FieldByName('NUMEROPROCESSO').AsInteger,
                            qry.FieldByName('IDBENEFICIO').AsInteger,
                            qry.FieldByName('IDPESSOA').AsInteger,
                            qry.FieldByName('SEQPROPOSTA').AsInteger,
                            sAnoMesPagamento, sAnoMesPagamento) then
     begin
       frmAguarde.Apaga;
       MsgDlg('O benefício encerrado está incluído na Prévia com valor integral. '+#13+
              'Favor entrar em contato com o setor de Pagamento de Benefício para desbloquear o benefício. ',
              'Informação',mtInformation,[mbOK],0);
       bEncerrou := False;
       Exit;
     end;

     bbtnConfirmar.Enabled := True;
     bbtnCancelar.Enabled  := True;

     // Se houverem registros pendentes de pagamento após a data final, avisar
     with qryAux do
     begin
        Close;
        SQl.Clear;
        SQL.Add(' SELECT SUM(DECODE(FLGDEVOLUCAO,1,-VALORPREV,VALORPREV)) AS TOTAL '+
                ' FROM   HSTBENEFBFCIARIO                                          '+
                ' WHERE  NUMEROPROCESSO = '+qry.FieldByName('NUMEROPROCESSO').AsString+
                ' AND    IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString+
                ' AND    IDBENEFICIO    = '+qry.FieldByName('IDBENEFICIO').AsString+
                ' AND    MESREFERENCIA >= '''+Copy(sNovaDataFinal,7,4)+'/'+Copy(sNovaDataFinal,4,2)+''''+
                ' AND    NVL(VLBENEFPGTO,0) = 0 '+ 
                ' AND    FLGENVIADO = 0 '); 
        Open;

        if (not IsEmpty) and (FieldByName('TOTAL').AsFloat > 0) then
        begin
          if MsgDlg('Benefício : '+qry.FieldByName('NOMEBENEFICIO').AsString+':'+#13+
                    '   Existe um total de '+FormatFloat('#0.00',FieldByName('TOTAL').AsFloat)+' pendente de pagamento pela Folha. '+#13+
                    '   Caso continue a retenção esses benefícios também serão retidos. '+#13+
                    '   Deseja continuar ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
          
          begin
            frmAguarde.Apaga;
            Exit;
          end;
        end;
     end;

     // Se o usuario apenas transformou a datafinal (prevista) em data final efetiva
     // entao apenas verificar se o último mês foi pago e o abono. Nao comparar meses anteriores
     if (qry.FieldByName('FLGDATAPREVISTA').AsInteger = 1)          And
        (iFlgDataPrevista = 0 )                                     And
        (qry.FieldByName('DATAFINALANT').AsString = sNovaDataFinal) Then
       bApenasMudouPrevistaParaEfetiva := True
     else
       bApenasMudouPrevistaParaEfetiva := False;

     if (qry.FieldbyName('FLGBENEFTEMP').AsInteger = 1)      And
        (qry.FieldbyName('FLGSALVIRTBENEF').AsInteger   = 1) And
        (not bApenasMudouPrevistaParaEfetiva                 Or
        (Copy(sNovaDataFinal,7,4)+Copy(sNovaDataFinal,3,3) >= sAnoMesPagamento)) Then
     begin
       sSalarioIntegral  := BuscaSalarioPESSOAINTEGRAL ( qryAux,
                                                         qry.FieldByName('IdPessJur').AsInteger,
                                                         qry.FieldByName('IdPlanoPrev').AsInteger,
                                                         qry.FieldByName('IdPessoa').AsInteger,
                                                         qry.FieldByName('SeqProposta').AsInteger,
                                                         'AS',
                                                         sAnoMesPagamento);

       if not GeraSalarioRetroativo( iIdPessJur, iIdPlanoPrev,
                                     qry.FieldByName('IdPessoa').AsInteger,
                                     'AS',
                                     qry.FieldByName('DataInicio').AsString,
                                     sNovaDataFinal,
                                     sSalarioIntegral,
                                     sSalarioIntegral,
                                     sSalarioIntegral,
                                     qryAux,
                                     sMsgErro,
                                     qry.FieldByName('FLGINTEVENTO').AsString,
                                     False) then
        begin
          frmAguarde.Apaga;
          MsgDlg(' Ocorreram problemas na Geração dos Salários no Histórico.'+#13+
                    '[Erro : '+sMsgErro+']. Verifique.','Erro', mtError, [mbOk],0);
          Exit;
       end;
     end; 

     //BRUNO AZEVEDO SOL 168126 KINTANA 1480544
     If ( bEfetuaAcertoFinanceiro = True ) Then begin
       if not ProcessaAcertosRetemEncerra( qryAux,
                                           qryGrava,
                                           qryBenefRecalculo,
                                           'R',
                                           qry.FieldByName('InscricaoNumero').AsString,
                                           qry.FieldByName('Matricula').AsString,
                                           qry.FieldByName('FlgCalcTodoMes').AsString,
                                           qry.FieldByName('DataInicio').AsString,
                                           sNovaDataFinal,
                                           qry.FieldByName('UltMesReajuste').AsString,
                                           qry.FieldByName('NumeroProcesso').AsInteger,
                                           qry.FieldByName('IdBeneficio').AsInteger,
                                           qry.FieldByName('IdPessJur').AsInteger,
                                           qry.FieldByName('IdPlanoPrev').AsInteger,
                                           qry.FieldByName('IdTitular').AsInteger,
                                           qry.FieldByName('IdPessoa').AsInteger,
                                           qry.FieldByName('SeqProposta').AsInteger,
                                           qry.FieldByName('IdRegraUltPagto').AsInteger,
                                           qry.FieldByName('IdRegraCalculo').AsInteger,
                                           qry.FieldByName('ValorAtual').AsFloat,
                                           (qry.FieldByName('FLGREFERENCIA').AsInteger = 1),
                                           qry.FieldByName('IdEventoGerador').AsInteger,
                                           qry.FieldByName('FLGINTEVENTO').AsString,
                                           bEncerraPorFale,
                                           iIdLoteRetemEncerra,
                                           bApenasMudouPrevistaParaEfetiva,
                                           sMsgErro,
                                           qry.FieldByName('DATAFINALANT').AsString) then
       begin
         frmAguarde.Apaga;
         MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
         Exit;
       end;
     end;
     //BRUNO AZEVEDO SOL 168126 KINTANA 1480544
     frmAguarde.Apaga;

     frmAguarde.Mostra('Atualizando Novos Valores para ' + qry.FieldByName('NOME').AsString+' ... ');

     { Caso cancelamento de convenio FLGPAGAINSS = 0 }

     // ATUALIZAR BENEFBFCIARIO
     sSQL := ' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO    = 2 ,                                              '+
           //  '                          DATAFINAL         = NULL,                                            '+   //Inicio-Fim - Sadi - SOL 236735 - PPM  474461
             '                          DATAFINALPREVISTA = TO_DATE('''+sNovaDataFinal+''', ''dd/mm/yyyy''), '+
             '                          FLGDATAPREVISTA   = 1,                                               '+
             { Atualizar o ULTMESPREPARO }
             '                          ULTMESPREPARO     = ''' + Copy(sNovaDataFinal,7,4) + '/' +
                                                                  Copy(sNovaDataFinal,4,2) + '''  ';

     If (sMotivo = '11') or (sMotivo = '10') Then //Renato Visoni SOL 150727 Kintana 1107056
       sSQL := sSQL + ', FLGPAGAINSS = 0 ';

     sSQL := sSQL +
             ' WHERE  NUMEROPROCESSO = '+qry.FieldByName('NUMEROPROCESSO').AsString                           +
             ' AND    IDBENEFICIO    = '+qry.FieldByName('IDBENEFICIO').AsString                              +
             ' AND    IDTITULAR      = '+qry.FieldByName('IDTITULAR').AsString                                +
             ' AND    IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString                                 ;

     qryGrava.Close;
     qryGrava.SQL.Clear;
     qryGrava.SQL.Add(sSQL);
     try
        qryGrava.ExecSQL;
     except
        frmAguarde.Apaga;
        MsgDlg(sRetemEncerra+' : Erro na atualização do benefício de referência.','Erro',mtError,[mbOk],0);
        Exit;
     end;

     If Not AcertaSituacaoProcesso(2, qry.FieldByName('NUMEROPROCESSO').AsInteger) Then Exit; //Thiago Passos SOL 127564 Ktn 692657

     { Novo valor para FLGENVIADO caso cancelamento de convenio }
     sFlgEnviado := '9';
     If sMotivo = '11' Then sFlgEnviado := '8';

     // ATUALIZAR HSTBENEFBFCIARIO PARA RETER BENEFICIOS POSTERIORES AO MES DA RETENCAO QUE
     // JÁ TENHAM SIDO PREPARADOS E NÃO TENHAM SIDO PAGOS
     sSQL := ' UPDATE HSTBENEFBFCIARIO SET FLGCONCESSAO = 1, FLGENVIADO = '+ sFlgEnviado +
             ' WHERE  NUMEROPROCESSO = '+qry.FieldByName('NUMEROPROCESSO').AsString+
             ' AND    IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString+
             ' AND    IDBENEFICIO    = '+qry.FieldByName('IDBENEFICIO').AsString+
             ' AND    MESREFERENCIA  >= '''+Copy(sNovaDataFinal,7,4)+'/'+Copy(sNovaDataFinal,4,2)+''''+
             ' AND    NVL(VLBENEFPGTO,0) <= 0 '+
             ' AND    IDLOTE         <> '+IntToStr(iIdLoteRetemEncerra);

     

     qryGrava.Close;
     qryGrava.SQL.Clear;
     qryGrava.SQL.Add(sSQL);
     try
        qryGrava.ExecSQL;
     except
     //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
     on e:Exception do
     begin
        TratarErro(e.Message);
        frmAguarde.Apaga;
        MsgDlg(sRetemEncerra+' : Erro na retenção de beneficios posteriores.','Erro',mtError,[mbOk],0);
        Exit;
     end;
     //Brunno Mattos - KTN 767861 - SOL 132659 Fim

     end;

     // edilaine - SOL 253577-18152 / PPM 1318911 - inicio
     If (qry.FieldByName('FONTEPAGADORA').AsInteger = 1) Then Begin

       if qry.FieldByName('IdPessoa').AsString = qry.FieldByName('IdTitular').AsString then
       begin
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0, DATAFINAL = TO_DATE('''+sNovaDataFinal+''', ''dd/mm/yyyy'') '+
                    ' WHERE  IDPESSJUR   = '+qry.FieldByName('IdPessJur').AsString+
                    ' AND    IDPLANOPREV = '+qry.FieldByName('IdPlanoPrev').AsString+
                    ' AND    IDPESSOA    = '+qry.FieldByName('IdTitular').AsString+
                    ' AND    SEQPROPOSTA = '+qry.FieldByName('SeqProposta').AsString+
                    ' AND    NUMEROPROCESSO = '+qry.FieldByName('NumeroProcesso').AsString+
                    ' AND    FLGCOBRA    = 1 ');

            try
               ExecSQL;
            except
               frmAguarde.Apaga;
               MsgDlg(sRetemEncerra+' : Erro no encerramento das contribuições.','Erro',mtError,[mbOk,mbHelp],0);
               Exit;
            end;
         end;
       end
       else
       begin
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE CONTRIBPREVNUCLEO SET FLGCOBRA = 0, DATAFINAL = TO_DATE('''+sNovaDataFinal+''', ''dd/mm/yyyy'') '+
                    ' WHERE  IDPESSJUR   = '+qry.FieldByName('IdPessJur').AsString+
                    ' AND    IDPLANOPREV = '+qry.FieldByName('IdPlanoPrev').AsString+
                    ' AND    IDTITULAR   = '+qry.FieldByName('IdTitular').AsString+
                    ' AND    IDPESSOA    = '+qry.FieldByName('IdPessoa').AsString+
                    ' AND    SEQPROPOSTA = '+qry.FieldByName('SeqProposta').AsString+
                    ' AND    NUMEROPROCESSO = '+qry.FieldByName('NumeroProcesso').AsString+
                    ' AND    FLGCOBRA    = 1 ');
            try
               ExecSQL;
            except
               frmAguarde.Apaga;
               MsgDlg(sRetemEncerra+' : Erro no encerramento das contribuições.','Erro',mtError,[mbOk,mbHelp],0);
               Exit;
            end;
         end;
       end;
     end;
     // edilaine - SOL 253577-18152 / PPM 1318911 - FIM


     try
        CriaLogOcorrencia(qry.fieldbyname('IDPLANOPREV').asstring,
                          qry.fieldbyname('IDPESSJUR').asstring,
                          qry.fieldbyname('IDTITULAR').asstring,
                          qry.fieldbyname('IDBENEFICIO').asstring,
                          qry.fieldbyname('NUMEROPROCESSO').asstring,
                          qry.fieldbyname('IDPESSOA').asstring,
                          qry.fieldbyname('SEQPROPOSTA').asstring,
                          '3',                          
                          FormatDateTime('dd/mm/yyyy', Date), 
                          floattostr(qry.fieldbyname('VALORATUAL').asfloat),
                          floattostr(qry.fieldbyname('VALORTOTAL').asfloat),
                          floattostr(qry.fieldbyname('VALORCOTAS').asfloat),
                          qry.fieldbyname('DATAINICIO').AsString,
                          sNovaDataFinal,
                          qry.FieldByName('VALORATUAL').AsString,
                          qry.FieldByName('DATAINICIO').AsString,
                          qry.FieldByName('DATAFINALANT').AsString,
                          qry.FieldByName('IDSITBENEFICIO').AsString,
                          qry.FieldByName('FLGDATAPREVISTA').AsInteger,
                          qryGrava,
                          sMotivo,
                          iIdLoteRetemEncerra,
                          iIdCalculoGeral,
                          bVoltouPatro, {RetornaPatro}  // SOL 149847/6241 KINTANA 1405080
                          -1,  {UsuarioAutoriza}        // SOL 149847/6241 KINTANA 1405080
                          -1,  {FlgEmprestimo}          // SOL 149847/6241 KINTANA 1405080
                          True {RetencEncerramento} );  // SOL 149847/6241 KINTANA 1405080


     except
        frmAguarde.Apaga;
        MsgDlg(sRetemEncerra+' : Erro na gravação do log de ocorrência.','Erro',mtError,[mbOk],0);
        Exit;
     end;

     qry.Next;

  end; // while not qry.Eof

  if not ExecutaOperacoesReservaEContrib('R') then Exit;

  //if not AcertaSituacaoProcesso then Exit;

  frmAguarde.Apaga; 

  Result := True;
end;

Function TfrmRetemEncerraNOVO.AcertaSituacaoProcesso(iSituacao: integer; iProcesso: Integer): boolean;
Var iIdSitBenef: integer;
   bMesmaSituacao: boolean;
Begin
   Result := False;
   //Thiago Passos SOL 127564 Ktn 692657

   // Se todos os benefícios do processo forem encerrados
   // Entao encerrar o processo
  { qryBenefAux.Close;
   qryBenefAux.ParamByName('NumeroProcesso').AsInteger := qry.fieldbyname('NUMEROPROCESSO').asstring;
   qryBenefAux.Open;
   qryBenefAux.First;
   iIdSitBenef    := qryBenefAux.FieldByName('IdSitBeneficio').AsInteger;
   bMesmaSituacao := True;
   qryBenefAux.First;
   while not qryBenefAux.EOF do
   begin
      if qryBenefAux.FieldByName('IdSitBeneficio').AsInteger <> iIdSitBenef
      then bMesmaSituacao := False;
      qryBenefAux.Next;
   end;

   if bMesmaSituacao
   then begin
   }
   With qryAux Do
      Begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE PROCESSOBENEF SET IDSITPROCESSO  = ' + IntToStr(iSituacao) +
            ' WHERE  (NUMEROPROCESSO = ' + IntToStr(iProcesso) + ')');
         Try
            ExecSQL;
         Except
            frmAguarde.Apaga;
            MsgDlg(sRetemEncerra + ' : Erro na atualização da situação do processo. ', 'Erro', mtError, [mbOk, mbHelp], 0);
            bEncerrou := False;
            Exit;
         End;
      End;
   //end; // if bMesmaSituacao

   Result := True;
End; // AcertaSituacaoProcesso

function  TfrmRetemEncerraNOVO.CalculaNumeroBeneficiarios : integer;
var iResult : integer;
    sSQL    : string;
begin

   sSQL := ' SELECT DISTINCT PATRO.IDRUBSALAUXDOENCA,                                        '+
           '        BF.IDPESSOA,   BF.IDTITULAR,      BF.IDPLANOPREV, BF.SEQPROPOSTA,        '+
           '        BF.NUMEROPROCESSO,      BF.IDPLANOPREV,    BF.IDPESSJUR,                 '+
           '        PF.DATANASC,       PF.SEXO,                                              '+
           '        PRESP.NOME AS NOMERESPONSAVEL,     BT.PRIORIDADE,     BT.PERCENTUAL,     '+
           '        DT.NUMSEQUENCIA,     DT.IDDEPENDENCIA,    DT.FLGCONTAIMPOSTOR,           '+
           '        DT.FLGCONTASALARIOF, DT.FLGBENEFICIARIO,  D.DESCRICAO,                   '+
           '        P.NOME, S.DESCRICAO AS SITUACAO, BF.IDSITBENEFICIO, BT.IDRESPONSAVEL,    '+
           '        B.FLGBENEFTEMP                                                           '+
           ' FROM   BENEFICIO B, SITBENEFICIO S, BENEFBFCIARIO BF, PESSOA P,                 '+
           '        PESSOAFISICA PF, BFCIARIOTITPLAN BT,                                     '+
           '        PESSOA PRESP, DEPEN D, DEPENTIT DT, PATRO                                '+
           ' WHERE  (BF.NUMEROPROCESSO = '+qry.FieldByName('NUMEROPROCESSO').AsString+')     '+
           ' AND    (BF.IDSITBENEFICIO in (1,2) )                                            '+
           ' AND    (BF.IDPESSOA       = P.IDPESSOA)                                         '+
           ' AND    (PF.IDPESSOA       = P.IDPESSOA)                                         '+
           ' AND    (BF.IDPESSOA       = BT.IDPESSOA)                                        '+
           ' AND    (BF.IDTITULAR      = BT.IDTITULAR)                                       '+
           ' AND    (BF.IDPESSJUR      = BT.IDPESSJUR)                                       '+
           ' AND    (BF.IDPLANOPREV    = BT.IDPLANOPREV)                                     '+
           ' AND    (BF.IDPLANOORIGEM  = BT.IDPLANOORIGEM)                                   '+
           ' AND    (BF.IDBENEFICIO    = BT.IDBENEFICIO)                                     '+
           ' AND    (BF.IDSITBENEFICIO = S.IDSITBENEFICIO)                                   '+
           ' AND    (BT.IDPESSOA       = DT.IDPESSOA)                                        '+
           ' AND    (BT.IDTITULAR      = DT.IDTITULAR)                                       '+
           ' AND    (BT.IDRESPONSAVEL  = PRESP.IDPESSOA(+))                                  '+
           ' AND    (DT.IDDEPENDENCIA  = D.IDDEPENDENCIA)                                    '+
           ' AND    (B.IDBENEFICIO     = BF.IDBENEFICIO)                                     '+
           ' AND    (BF.IDPESSJUR      = PATRO.IDPESSOA)                                     ';
   qryAux.Close;
   qryAux.SQl.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   if not qryAux.IsEmpty
   then iResult := qryAux.RecordCount
   else iResult := 0;
   qryAux.Close;
   Result := iResult;
end; // CalculaNumeroBeneficiarios

function  TfrmRetemEncerraNOVO.PreencheMotivoRetemEncerra(pcOperacao : char) : longint;
begin
   if pcOperacao = 'R'
   then begin
      Result := prmIdMotDevolNaoIden;
      Exit;
   end;

   Result  := prmIdMotivoDevolBen;

   
   if bEncerraPorFale
   then begin

     if (qry.FieldByName('IDTITULAR').AsInteger = qry.FieldByName('IDPESSOA').AsInteger)
     then begin
       { Se o parametro prmFLGENVACERTOFALEC for TRUE e }
       { o lote for > 0 entao jogar no motivo normal pois significa que a    }
       { fundação acerta o beneficio diretamente na conta do participante    }
       if (prmFlgTipoAcertoFL = 1) or (prmFLGENVACERTOFALEC) then begin

       
         if prmIdMotivoAcertoFL <= 0
         then begin
            Result := -1;
            sMsgErro := 'Motivo para Acerto Pós-Morte na Conta do Participante não preenchido.';
            Exit;
         end;

         Result := prmIdMotivoAcertoFL;
       end else begin
         if prmIdMotDevolNaoIden <= 0
         then begin
            Result := -1;
            sMsgErro := 'Motivo para Pagamento com Recebedor não Identificado não preenchido.';
            Exit;
         end;

         Result := prmIdMotDevolNaoIden;
       end
     End
     else
     Result := prmIdMotDevolNaoIden;
   end;

end; // PreencheMotivoRetemEncerra




function  TfrmRetemEncerraNOVO.ProcessaEncerramento : boolean;
var  iBeneficiosProcessados    : integer;
     iBeneficiariosProcessados : integer;
     iTotalBeneficios          : integer;
     sSQLBenefAssoc            : string;
     bErro                     : boolean;
     rValorBeneficio           : double;
     sValorReserva             : string;
     iIdBenefRef               : longint;
     bAcertaContribuicao       : boolean;
     sDataFinal : String;
begin
  Result := False;

  if not PedeLoteOperacao ('E') then Exit;

  iIdCalculoGeral := 0;

  if (qry.FieldByName('IDTITULAR').AsInteger = qry.FieldByName('IDPESSOA').AsInteger)
  then AtualizaSalarioMantido(sNovaDataFinal);

  iNumBenef := CalculaNumeroBeneficiarios;
  iNumBenef := iNumBenef - 1;

  // Abrir query com outros beneficiarios do processo
  with qryBenefRecalculo do
  begin
     Close;
     ParamByName('NumeroProcesso').AsInteger := qry.FieldByName('NUMEROPROCESSO').AsInteger;
     ParamByName('IdPessoa').AsInteger       := qry.FieldByName('IDPESSOA').AsInteger;
     Open;
  end;

  iBeneficiosProcessados    := 0; // controlar que beneficios    já processou para saber quando estiver no ultimo
  iBeneficiariosProcessados := 0; // controlar que beneficiarios já processou para saber quando estiver no ultimo
  iTotalBeneficios          := qry.RecordCount;

  bProcessouSuplementacao := False;

  while not qry.Eof do
  begin
     inc(iBeneficiosProcessados);

     if ( (qry.FieldByName('PROCESSAR').AsInteger       = 0) or
          (qry.FieldByName('IDSITBENEFICIO').AsInteger  = 3) )
     then begin
        qry.Next;
        continue;
     end;

     { Guarda FLG caso tenha processado suplementação }
     If (qry.FieldByName('FLGREFERENCIA').AsInteger = 0) Then bProcessouSuplementacao := True;

     if (
         (Not qry.FieldbyName('DATAFINAL').IsNull)  And
         (trunc(qry.FieldbyName('DATAFINAL').AsDateTime) <= StrToDate(sNovaDataFinal))
         )
     then begin
      // Thiago Melo SOL 179681 Kintana 1665289 - Ini
       sSQL := ' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO    = 3 ,'+
               '                          DATAFINALPREVISTA = TO_DATE('''+sNovaDataFinal+''', ''dd/mm/yyyy''), '+
               '                          FLGDATAPREVISTA   = 0, ';
       if bEncerraPorFale
       then sSQL := sSQL +'               FLGENCERRAPORFALE = 1, '
       else sSQL := sSQL +'               FLGENCERRAPORFALE = 0, ';

       sSQL := sSQL +'                    DATAFINAL = TO_DATE('''+sNovaDataFinal+''', ''dd/mm/yyyy''), '+
       //William Moreira da Silva - SOL 248936 PPM 1115148
                     ' DATAENCERRAMENTO = TO_DATE('''+sNovaDataFinal+''', ''dd/mm/yyyy'') '+
       //William Moreira da Silva - SOL 248936 PPM 1115148
                     ' WHERE  (NUMEROPROCESSO = '+qry.FieldByName('NumeroProcesso').AsString+')'+
                     ' AND    (IDBENEFICIO    = '+qry.FieldByName('IdBeneficio').AsString+')'+
                     ' AND    (IDTITULAR      = '+qry.FieldByName('IdTitular').AsString+')'+
                     ' AND    (IDPESSOA       = '+qry.FieldByName('IdPessoa').AsString+')'+
                     ' AND    (IDBENEFICIO    = '+qry.FieldByName('IdBeneficio').AsString+') ';

       qryGrava.Close;
       qryGrava.SQL.Clear;
       qryGrava.SQL.Add(sSQL);
       try
          qryGrava.ExecSQL;
       except
          frmAguarde.Apaga;
          MsgDlg(sRetemEncerra+' : Erro na atualização dos percentuais de rateio da pensão.',
                 'Erro', mtError, [mbOk], 0);
          bEncerrou := False;
          Exit;
       end;
      // Thiago Melo SOL 179681 Kintana 1665289 - Fim

       If Not AcertaSituacaoProcesso(3, qry.FieldByName('NumeroProcesso').AsInteger) Then //Fernando Xavier SOL 241406 PPM 551078
          Exit; // SOL 243616 PPM 588500


        qry.Next;
        continue;
     end;

     frmAguarde.Mostra('Analisando '+qry.FieldByName('NOMEBENEFICIO').AsString+' ... ');

     iIdMotivoAux := PreencheMotivoRetemEncerra('E');

     if iIdMotivoAux <= 0 then
     begin
       frmAguarde.Apaga;
       MsgDlg(sMsgErro,'Erro',mtError,[mbOK],0);
       Exit;
     end;

     if BenefExistePREVIA ( qryAux,
                            qry.FieldByName('IDPESSJUR').AsInteger,
                            qry.FieldByName('IDTITULAR').AsInteger,
                            qry.FieldByName('IDPLANOPREV').AsInteger,
                            prmIdMotivoFolhaBen,
                            qry.FieldByName('NUMEROPROCESSO').AsInteger,
                            qry.FieldByName('IDBENEFICIO').AsInteger,
                            qry.FieldByName('IDPESSOA').AsInteger,
                            qry.FieldByName('SEQPROPOSTA').AsInteger,
                            sAnoMesPagamento, sAnoMesPagamento) then
     begin
       frmAguarde.Apaga;
       MsgDlg('O benefício encerrado está incluído na Prévia com valor integral. '+#13+
              'Favor entrar em contato com o setor de Pagamento de Benefício para desbloquear o benefício. ',
              'Informação',mtInformation,[mbOK],0);
       bEncerrou := False;
       Exit;
     end;

     bbtnConfirmar.Enabled := True;
     bbtnCancelar.Enabled  := True;

     // Se o usuario apenas transformou a datafinal (prevista) em data final efetiva
     // entao apenas verificar se o último mês foi pago e o abono. Nao comparar meses anteriores
     if (qry.FieldByName('FLGDATAPREVISTA').AsInteger = 1)          And
        (iFlgDataPrevista = 0 )                                     And
        (qry.FieldByName('DATAFINALANT').AsString = sNovaDataFinal) Then
       bApenasMudouPrevistaParaEfetiva := True
     else
       bApenasMudouPrevistaParaEfetiva := False;


     if (sFlgEvento <> 'FL') and
        (bVeioDoMenu)        and
        (qry.FieldByName('IDPESSOA').AsString = qry.FieldByName('IDTITULAR').AsString) then
     begin
       { // Felipe A. Santos SOL 227769 KINTANA 2061696 - Inicio
        if not GravaDataVolta( qry.FieldByName('IDTITULAR').AsString,
                              qry.FieldByName('IDPLANOPREV').AsString,
                              qry.FieldByName('IDPESSJUR').AsString,
                              qry.FieldByName('SEQPROPOSTA').AsString,
                              qry.FieldByName('IDEVENTOGERADOR').AsString,
                              sNovaDataFinal,
                              qry.FieldByName('DTEVENTO').AsString) then
       begin
         frmAguarde.Apaga;
         MsgDlg('Erro ao gravar data de retorno no histórico de evenots.','Erro',mtError,[mbOk, mbHelp],0);
         Exit;
        end; // Felipe A. Santos SOL 227769 KINTANA 2061696 - fim}
     end;

     // Se for beneficio para beneficiario E for encerramento
     // Entao recalcular o beneficio para os beneficiarios restantes
     if  (qry.FieldByName('IdTitular').AsInteger <> qry.FieldByName('IdPessoa').AsInteger) and
         (not qryBenefRecalculo.IsEmpty) then
     begin
        sSQLBenefAssoc := '';


        // Tratamento para a qryBenefRecalculo ter todos os beneficiarios+beneficios
        // dos beneficiarios restantes no processo
        // No encerramento, percentuais podem ser
        // diferentes, logo recalcular beneficio para cada beneficiario restante
        bErro :=  False;
        qryBenefRecalculo.First;

        while not qryBenefRecalculo.Eof do
        begin
          if qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger <> qry.FieldByName('IDBENEFICIO').AsInteger
          then begin
             qryBenefRecalculo.Next;
             continue;
          end;
          bErro :=  False;

          // edilaine - SOL 253577-17541 / PPM 978024 - inicio
          if (qryBenefRecalculo.FieldByName('VLRBSTOTAL').AsString <> '') and
             (qryBenefRecalculo.FieldByName('VLRBSTOTAL').AsCurrency > 0) then
          begin
            rValorBeneficio := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                                    qry.FieldByName('IdRegraCalculo').AsInteger,
                                                                    -1,
                                                                    qryBenefRecalculo.FieldByName('IdPessJur').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdPlanoPrev').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdTitular').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('SeqProposta').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdBeneficio').AsInteger,
                                                                    iNumeroProcesso,
                                                                    qryBenefRecalculo.FieldByName('NUMBENEF').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('ValorBase1').AsFloat,
                                                                    qryBenefRecalculo.FieldByName('ValorBase2').AsFloat,
                                                                    qryBenefRecalculo.FieldByName('ValorBase3').AsFloat,
                                                                    sSQLBenefAssoc,
                                                                    qry.FieldByName('DtEvento').AsString,
                                                                    qryBenefRecalculo.FieldByName('DataInicio').AsString,
                                                                    qryBenefRecalculo.FieldByName('DataInicioINSS').AsString,
                                                                    qryBenefRecalculo.FieldByName('VLRBSTOTAL').AsString,
                                                                    qryBenefRecalculo.FieldByName('VlrInfINSS').AsString,
                                                                    qryBenefRecalculo.FieldByName('VlrCalcINSS').AsString,
                                                                    sValorReserva,
                                                                    bErro, sMsgErro, iIdCalculoGeral,
                                                                    qryBenefRecalculo.FieldByName('IdPessoa').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdDependencia').AsString,
                                                                    qryBenefRecalculo.FieldByName('Percentual').AsString,2,
                                                                    '','','',-1,
                                                                    qryBenefRecalculo.FieldByName('FLGPROVISORIO').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('PRAZOPROVISORIO').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('PERCPROVISORIO').AsFloat
                                                                    );
            If not bErro then
            begin
              qryBenefRecalculo.Edit;
              qryBenefRecalculo.FieldByName('VLRBSATUAL').AsFloat := rValorBeneficio;
              qryBenefRecalculo.Post;
              qryBenefRecalculo.Next;
            End
            Else
            Begin
              frmAguarde.Apaga;
              MsgDlg('Erro no recálculo do benefício : '+sMsgErro,'Erro',mtError,[mbOk, mbHelp],0);
              Exit;
            End;
          end;

          if (qryBenefRecalculo.FieldByName('VLRFABTOTAL').AsString <> '') and
             (qryBenefRecalculo.FieldByName('VLRFABTOTAL').AsCurrency > 0) then
          begin
            rValorBeneficio := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                                    qry.FieldByName('IdRegraCalculo').AsInteger,
                                                                    -1,
                                                                    qryBenefRecalculo.FieldByName('IdPessJur').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdPlanoPrev').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdTitular').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('SeqProposta').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdBeneficio').AsInteger,
                                                                    iNumeroProcesso,
                                                                    qryBenefRecalculo.FieldByName('NUMBENEF').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('ValorBase1').AsFloat,
                                                                    qryBenefRecalculo.FieldByName('ValorBase2').AsFloat,
                                                                    qryBenefRecalculo.FieldByName('ValorBase3').AsFloat,
                                                                    sSQLBenefAssoc,
                                                                    qry.FieldByName('DtEvento').AsString,
                                                                    qryBenefRecalculo.FieldByName('DataInicio').AsString,
                                                                    qryBenefRecalculo.FieldByName('DataInicioINSS').AsString,
                                                                    qryBenefRecalculo.FieldByName('VLRFABTOTAL').AsString,
                                                                    qryBenefRecalculo.FieldByName('VlrInfINSS').AsString,
                                                                    qryBenefRecalculo.FieldByName('VlrCalcINSS').AsString,
                                                                    sValorReserva,
                                                                    bErro, sMsgErro, iIdCalculoGeral,
                                                                    qryBenefRecalculo.FieldByName('IdPessoa').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdDependencia').AsString,
                                                                    qryBenefRecalculo.FieldByName('Percentual').AsString,2,
                                                                    '','','',-1,
                                                                    qryBenefRecalculo.FieldByName('FLGPROVISORIO').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('PRAZOPROVISORIO').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('PERCPROVISORIO').AsFloat
                                                                    );
            If not bErro then
            begin
              qryBenefRecalculo.Edit;
              qryBenefRecalculo.FieldByName('VLRFABATUAL').AsFloat := rValorBeneficio;
              qryBenefRecalculo.Post;
              qryBenefRecalculo.Next;
            End
            Else
            Begin
              frmAguarde.Apaga;
              MsgDlg('Erro no recálculo do benefício : '+sMsgErro,'Erro',mtError,[mbOk, mbHelp],0);
              Exit;
            End;
          end;

          if (qryBenefRecalculo.FieldByName('VLRBASEDEFICIT').AsString <> '') and
             (qryBenefRecalculo.FieldByName('VLRBASEDEFICIT').AsCurrency > 0) then
          begin
            rValorBeneficio := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                                    qry.FieldByName('IdRegraCalculo').AsInteger,
                                                                    -1,
                                                                    qryBenefRecalculo.FieldByName('IdPessJur').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdPlanoPrev').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdTitular').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('SeqProposta').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdBeneficio').AsInteger,
                                                                    iNumeroProcesso,
                                                                    qryBenefRecalculo.FieldByName('NUMBENEF').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('ValorBase1').AsFloat,
                                                                    qryBenefRecalculo.FieldByName('ValorBase2').AsFloat,
                                                                    qryBenefRecalculo.FieldByName('ValorBase3').AsFloat,
                                                                    sSQLBenefAssoc,
                                                                    qry.FieldByName('DtEvento').AsString,
                                                                    qryBenefRecalculo.FieldByName('DataInicio').AsString,
                                                                    qryBenefRecalculo.FieldByName('DataInicioINSS').AsString,
                                                                    qryBenefRecalculo.FieldByName('VLRBASEDEFICIT').AsString,
                                                                    qryBenefRecalculo.FieldByName('VlrInfINSS').AsString,
                                                                    qryBenefRecalculo.FieldByName('VlrCalcINSS').AsString,
                                                                    sValorReserva,
                                                                    bErro, sMsgErro, iIdCalculoGeral,
                                                                    qryBenefRecalculo.FieldByName('IdPessoa').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('IdDependencia').AsString,
                                                                    qryBenefRecalculo.FieldByName('Percentual').AsString,2,
                                                                    '','','',-1,
                                                                    qryBenefRecalculo.FieldByName('FLGPROVISORIO').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('PRAZOPROVISORIO').AsInteger,
                                                                    qryBenefRecalculo.FieldByName('PERCPROVISORIO').AsFloat
                                                                    );
            If not bErro then
            begin
              qryBenefRecalculo.Edit;
              qryBenefRecalculo.FieldByName('VLRBASEDEFICIT').AsFloat := rValorBeneficio;
              qryBenefRecalculo.Post;
              qryBenefRecalculo.Next;
            End
            Else
            Begin
              frmAguarde.Apaga;
              MsgDlg('Erro no recálculo do benefício : '+sMsgErro,'Erro',mtError,[mbOk, mbHelp],0);
              Exit;
            End;
          end;
          // edilaine - SOL 253577-17541 / PPM 978024 - fim

          rValorBeneficio := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                                  qry.FieldByName('IdRegraCalculo').AsInteger,
                                                                  -1,
                                                                  qryBenefRecalculo.FieldByName('IdPessJur').AsInteger,
                                                                  qryBenefRecalculo.FieldByName('IdPlanoPrev').AsInteger,
                                                                  qryBenefRecalculo.FieldByName('IdTitular').AsInteger,
                                                                  qryBenefRecalculo.FieldByName('SeqProposta').AsInteger,
                                                                  qryBenefRecalculo.FieldByName('IdBeneficio').AsInteger,
                                                                  iNumeroProcesso,
                                                                  qryBenefRecalculo.FieldByName('NUMBENEF').AsInteger,
                                                                  qryBenefRecalculo.FieldByName('ValorBase1').AsFloat,
                                                                  qryBenefRecalculo.FieldByName('ValorBase2').AsFloat,
                                                                  qryBenefRecalculo.FieldByName('ValorBase3').AsFloat,
                                                                  sSQLBenefAssoc,
                                                                  qry.FieldByName('DtEvento').AsString,
                                                                  qryBenefRecalculo.FieldByName('DataInicio').AsString,
                                                                  qryBenefRecalculo.FieldByName('DataInicioINSS').AsString,
                                                                  qryBenefRecalculo.FieldByName('ValorTotal').AsString,
                                                                  qryBenefRecalculo.FieldByName('VlrInfINSS').AsString,
                                                                  qryBenefRecalculo.FieldByName('VlrCalcINSS').AsString,
                                                                  sValorReserva,
                                                                  bErro, sMsgErro, iIdCalculoGeral,
                                                                  qryBenefRecalculo.FieldByName('IdPessoa').AsInteger,
                                                                  qryBenefRecalculo.FieldByName('IdDependencia').AsString,
                                                                  qryBenefRecalculo.FieldByName('Percentual').AsString,2,
                                                                  '','','',-1,
                                                                  qryBenefRecalculo.FieldByName('FLGPROVISORIO').AsInteger,
                                                                  qryBenefRecalculo.FieldByName('PRAZOPROVISORIO').AsInteger,
                                                                  qryBenefRecalculo.FieldByName('PERCPROVISORIO').AsFloat
                                                                  );
          If not bErro then
          begin
            qryBenefRecalculo.Edit;
            qryBenefRecalculo.FieldByName('VALORATUAL').AsFloat := rValorBeneficio;
            qryBenefRecalculo.Post;
            qryBenefRecalculo.Next;
          End
          Else
          Begin
            frmAguarde.Apaga;
            MsgDlg('Erro no recálculo do benefício : '+sMsgErro,'Erro',mtError,[mbOk, mbHelp],0);
            Exit;
          End;

        end; // while not qryBenefRecalculo.Eof
     end;


     if (qry.FieldbyName('FLGBENEFTEMP').AsInteger = 1)      And
        (qry.FieldbyName('FLGSALVIRTBENEF').AsInteger   = 1) And
        (not bApenasMudouPrevistaParaEfetiva                 Or
        (Copy(sNovaDataFinal,7,4)+Copy(sNovaDataFinal,3,3) >= sAnoMesPagamento)) then
     begin
       sSalarioIntegral := BuscaSalarioPESSOAINTEGRAL ( qryAux,
                                                        qry.FieldByName('IdPessJur').AsInteger,
                                                        qry.FieldByName('IdPlanoPrev').AsInteger,
                                                        qry.FieldByName('IdPessoa').AsInteger,
                                                        qry.FieldByName('SeqProposta').AsInteger,
                                                        'AS',
                                                        sAnoMesPagamento);

       if not GeraSalarioRetroativo( iIdPessJur, iIdPlanoPrev,
                                     qry.FieldByName('IdPessoa').AsInteger,
                                     'AS',
                                     qry.FieldByName('DataInicio').AsString,
                                     sNovaDataFinal,
                                     sSalarioIntegral,
                                     sSalarioIntegral,
                                     sSalarioIntegral,
                                     qryAux,
                                     sMsgErro,
                                     qry.FieldByName('FLGINTEVENTO').AsString,
                                     False) then
        begin
          frmAguarde.Apaga;
          MsgDlg(' Ocorreram problemas na Geração dos Salários no Histórico.'+#13+
                    '[Erro : '+sMsgErro+']. Verifique.','Erro', mtError, [mbOk],0);
          Exit;
        end;
     end;

     { Para casos de beneficios retidos, atualizar os valores }
     { entre a data de retenção e a final para não identificado. Com isso esses valores   }
     { serão pagos/cobrados do pensionista.                                               }
     If ( Qry.FieldByName('IDSITBENEFICIO').AsInteger = 2 ) And
        ( Qry.FieldByName('DATAFINALPREVISTA').AsDateTime < StrToDate( sNovaDataFinal ) ) Then
     Begin
       sSQL := 'UPDATE HSTBENEFBFCIARIO SET '                                            + #13 +
               '  IDMOTIVO   =   '+ IntToStr( iIdMotivoAux ) + ', '                      + #13 +
               '  FLGENVIADO = 0 '                                                       + #13 +
               'WHERE '                                                                  + #13 +
               '      NUMEROPROCESSO = '+ Qry.FieldByName('NUMEROPROCESSO').AsString     + #13 +
               '  AND IDPESSOA       = '+ Qry.FieldByName('IDPESSOA').AsString           + #13 +
               '  AND IDBENEFICIO    = '+ Qry.FieldByName('IDBENEFICIO').AsString        + #13 +
               '  AND FLGENVIADO     = 9 '                                               + #13 +
               '  AND MESREFERENCIA >= '+ QuotedStr( FormatDateTime( 'YYYY/MM', Qry.FieldByName('DATAFINALPREVISTA').AsDateTime ) ) + #13 +
               '  AND MESREFERENCIA <  '+ QuotedStr( FormatDateTime( 'YYYY/MM', StrToDate( sNovaDataFinal ) ) )                     + #13 +
               '  AND NVL(VLBENEFPGTO,0) <= 0 ';

       QryAux.SQL.Clear;
       QryAux.SQL.Text := sSQL;

       QryAux.ExecSQL;
       if (qry.FieldbyName('FONTEPAGADORA').AsInteger = 1)  then // SOL 236173 PPM  464127
       begin
          sSQL := 'UPDATE HSTCONTRIBPREV SET '                                              + #13 +
               '  IDMOTIVO   =   '+ IntToStr( iIdMotivoAux ) + ', '                      + #13 +
               '  FLGCONCESSAO   = 1 , '                                                 + #13 +
               '  SITRECEBIMENTO = 0 '                                                   + #13 +
               'WHERE '                                                                  + #13 +
               '      IDPESSOA       = '+ Qry.FieldByName('IDPESSOA').AsString           + #13 +
               '  AND MESREFERENCIA >= '+ QuotedStr( FormatDateTime( 'YYYY/MM', Qry.FieldByName('DATAFINALPREVISTA').AsDateTime ) ) + #13 +
               '  AND MESREFERENCIA <  '+ QuotedStr( FormatDateTime( 'YYYY/MM', StrToDate( sNovaDataFinal ) ) )                     + #13 +
               '  AND IDPLANOPREV = ' + Qry.FieldByName('IDPLANOPREV').AsString + #13 + //MARCIO SANCHES SPINOSA KINTANA 1985358 SOL 205240
               '  AND NVL(VALORRECEBIDO,0) <= 0 ';

          QryAux.SQL.Clear;
          QryAux.SQL.Text := sSQL;

          QryAux.ExecSQL;
       end;
     End;

     // Tratamento para não fazer acerto financeiro
     If ( bEfetuaAcertoFinanceiro = True ) Then
     Begin
       if not ProcessaAcertosRetemEncerra( qryAux,
                                           qryGrava,
                                           qryBenefRecalculo,
                                           'E',
                                           qry.FieldByName('InscricaoNumero').AsString,
                                           qry.FieldByName('Matricula').AsString,
                                           qry.FieldByName('FlgCalcTodoMes').AsString,
                                           qry.FieldByName('DataInicio').AsString,
                                           sNovaDataFinal,
                                           qry.FieldByName('UltMesReajuste').AsString,
                                           qry.FieldByName('NumeroProcesso').AsInteger,
                                           qry.FieldByName('IdBeneficio').AsInteger,
                                           qry.FieldByName('IdPessJur').AsInteger,
                                           qry.FieldByName('IdPlanoPrev').AsInteger,
                                           qry.FieldByName('IdTitular').AsInteger,
                                           qry.FieldByName('IdPessoa').AsInteger,
                                           qry.FieldByName('SeqProposta').AsInteger,
                                           qry.FieldByName('IdRegraUltPagto').AsInteger,
                                           qry.FieldByName('IdRegraCalculo').AsInteger,
                                           qry.FieldByName('ValorAtual').AsFloat,
                                           (qry.FieldByName('FLGREFERENCIA').AsInteger = 1),
                                           qry.FieldByName('IdEventoGerador').AsInteger,
                                           sFlgIntEvento,
                                           bEncerraPorFale,
                                           iIdLoteRetemEncerra,
                                           bApenasMudouPrevistaParaEfetiva,
                                           sMsgErro,
                                           qry.FieldByName('DATAFINALANT').AsString) then
       begin
         frmAguarde.Apaga;
         MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
         bEncerrou := False;
         Exit;
       end;

     End;


     qryBenefRecalculo.First;
     while not qryBenefRecalculo.Eof do
     begin
        if qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger <> qry.FieldByName('IDBENEFICIO').AsInteger then
        begin
          qryBenefRecalculo.Next;
          continue;
        end;
        inc(iBeneficiariosProcessados);

        if (iBeneficiosProcessados    = iTotalBeneficios) and
           (iBeneficiariosProcessados = qryBenefRecalculo.FieldByName('NUMBENEF').AsInteger) then
          bAcertaContribuicao := True;

        { Tratamento para não fazer acerto financeiro }
        If ( bEfetuaAcertoFinanceiro = True ) Then
        Begin
          if not AcertaBeneficioNoPeriodo   ( qryAux,
                                              qryBenefRecalculo.FieldByName('NUMBENEF').AsInteger,
                                              'E',
                                              qry.FieldByName('DATAINICIO').AsString,
                                              sNovaDataFinal,
                                              qryBenefRecalculo.FieldByName('NumeroProcesso').AsInteger,
                                              qry.FieldByName('IdBeneficio').AsInteger,
                                              qryBenefRecalculo.FieldByName('IdPessJur').AsInteger,
                                              qryBenefRecalculo.FieldByName('IdPlanoPrev').AsInteger,
                                              qryBenefRecalculo.FieldByName('IdTitular').AsInteger,
                                              qryBenefRecalculo.FieldByName('IdPessoa').AsInteger,
                                              qryBenefRecalculo.FieldByName('SeqProposta').AsInteger,
                                              qryBenefRecalculo.FieldByName('VALORATUAL').AsFloat,
                                              qryBenefRecalculo.FieldByName('VALORTOTAL').AsFloat,
                                              bEncerraPorFale,
                                              iIdLoteRetemEncerra,
                                              sMsgErro,
                                              bAcertaContribuicao) then
          begin
            frmAguarde.Apaga;
            MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
            bEncerrou := False;
            Exit;
          end;

        End;

        qryBenefRecalculo.Next;
     end; // while not qryBenefRecalculo.Eof
     frmAguarde.Apaga;

     frmAguarde.Mostra('Atualizando Novos Valores para '+qry.FieldByName('NOME').AsString+' ... ');

     //Retiramos esse update do campo DATAMORTE da tabela PESSOAFISICA porque a rotina de encerramento não altera esse campo!
     //Wylliam Leite da Silva - SOL:255188 PPM:813109 - Início
     //Atualiza DATAMORTE na PESSOAFISICA caso encerre por falecimento
     {If ((bEncerraPorFale = True) And (bVeioDoMenu))
     Or (bEventoMorte)  Then //SOL 122922 - Ádler Souza
     Begin
       qryAux.Close;
       qryAux.Sql.Clear;
       qryAux.Sql.Add(' UPDATE PESSOAFISICA SET DATAMORTE = TO_DATE(''' + Trim(sNovaDataFinal) + ''',''DD/MM/YYYY'')' +
                      ' WHERE  IDPESSOA  = ' + qry.FieldByName('IdPessoa').AsString);
       try
         qryAux.ExecSQL;
       except
         on E:EDBEngineError do
           begin
             frmAguarde.Apaga;
             MostrarErro(E);
             Exit;
           end;
       end;
     End;}
     //Wylliam Leite da Silva - SOL:255188 PPM:813109 - Fim

     // ATUALIZAR BENEFBFCIARIO

     sDataFinal := sNovaDataFinal;

     If ( bEfetuaAcertoFinanceiro = False ) Then
     Begin
       //BRUNO AZEVEDO SOL 160529 KINTANA 1348864
       { Exclui registros em aberto após o falecimento }
       {sSQL := 'DELETE HSTBENEFBFCIARIO HST '+
               'WHERE (NUMEROPROCESSO = '+ qry.FieldByName('NUMEROPROCESSO').AsString +')'+
               '  AND (IDBENEFICIO    = '+ qry.FieldByName('IDBENEFICIO').AsString    +')'+
               '  AND (IDTITULAR      = '+ qry.FieldByName('IDTITULAR').AsString      +')'+
               '  AND (IDPESSOA       = '+ qry.FieldByName('IDPESSOA').AsString       +')'+
               '  AND (IDBENEFICIO    = '+ qry.FieldByName('IDBENEFICIO').AsString    +')'+
               '  AND (NVL(VLBENEFPGTO,0) = 0) '+
               '  AND (HST.MESREFERENCIA > '+ QuotedStr( Copy( sNovaDataFinal, 7, 4 ) + '/' +
                                                         Copy( sNovaDataFinal, 4, 2 ) ) + ' )';
       ExecutarQuery( QryAux, sSQL );

       sSQL := 'SELECT MAX( HST.MESREFERENCIA ) AS MESREFERENCIA '+
               'FROM HSTBENEFBFCIARIO HST '+
               'WHERE (NUMEROPROCESSO = '+ qry.FieldByName('NUMEROPROCESSO').AsString +')'+
               '  AND (IDBENEFICIO    = '+ qry.FieldByName('IDBENEFICIO').AsString    +')'+
               '  AND (IDTITULAR      = '+ qry.FieldByName('IDTITULAR').AsString      +')'+
               '  AND (IDPESSOA       = '+ qry.FieldByName('IDPESSOA').AsString       +')'+
               '  AND (IDBENEFICIO    = '+ qry.FieldByName('IDBENEFICIO').AsString    +')'+
               '  AND (NVL(VLBENEFPGTO,0) > 0) '+
               '  AND (HST.MESREFERENCIA <> ''2007/13'')';

       FazQuery( QryAux, sSQL );

       sDataFinal := DateToStr( DiasUteis.UltDiaMes( StrToInt( Copy( QryAux.FieldByName('MESREFERENCIA').AsString, 1, 4 ) ),
                                                     StrToInt( Copy( QryAux.FieldByName('MESREFERENCIA').AsString, 6, 2 ) ) ) );
       }
       //BRUNO AZEVEDO SOL 160529 KINTANA 1348864
     End;


     sSQL := ' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO    = 3 ,'+
               '                          DATAFINALPREVISTA = TO_DATE('''+sNovaDataFinal+''', ''dd/mm/yyyy''), '+
               '                          FLGDATAPREVISTA   = 0, ';
     if bEncerraPorFale
     then sSQL := sSQL +'               FLGENCERRAPORFALE = 1, '
     else sSQL := sSQL +'               FLGENCERRAPORFALE = 0, ';

     sSQL := sSQL +'                    DATAFINAL = TO_DATE('''+sDataFinal+''', ''dd/mm/yyyy''), '+
     //William Moreira da Silva - SOL 248936 PPM 1115148
                     ' DATAENCERRAMENTO = TO_DATE('''+sDataFinal+''', ''dd/mm/yyyy'') '+
     //William Moreira da Silva - SOL 248936 PPM 1115148
                   ' WHERE  (NUMEROPROCESSO = '+qry.FieldByName('NumeroProcesso').AsString+')'+
                   ' AND    (IDBENEFICIO    = '+qry.FieldByName('IdBeneficio').AsString+')'+
                   ' AND    (IDTITULAR      = '+qry.FieldByName('IdTitular').AsString+')'+
                   ' AND    (IDPESSOA       = '+qry.FieldByName('IdPessoa').AsString+')'+
                   ' AND    (IDBENEFICIO    = '+qry.FieldByName('IdBeneficio').AsString+') ';

     qryGrava.Close;
     qryGrava.SQL.Clear;
     qryGrava.SQL.Add(sSQL);
     try
        qryGrava.ExecSQL;
     except
        frmAguarde.Apaga;
        MsgDlg(sRetemEncerra+' : Erro na atualização dos percentuais de rateio da pensão.',
               'Erro', mtError, [mbOk], 0);
        bEncerrou := False;
        Exit;
     end;

     { Encerrar contribuições somente se não for INSS }
     //If (qry.FieldByName('FLGREFERENCIA').AsInteger = 0) Then Begin                         // edilaine - SOL 253577-18152 / PPM 1318911
     If (qry.FieldByName('FONTEPAGADORA').AsInteger = 1) Then Begin                           // edilaine - SOL 253577-18152 / PPM 1318911

       if qry.FieldByName('IdPessoa').AsString = qry.FieldByName('IdTitular').AsString then   // edilaine - SOL 253577-18152 / PPM 1318911
       begin
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0, DATAFINAL = TO_DATE('''+sDataFinal+''', ''dd/mm/yyyy'') '+
                    ' WHERE  IDPESSJUR   = '+qry.FieldByName('IdPessJur').AsString+
                    ' AND    IDPLANOPREV = '+qry.FieldByName('IdPlanoPrev').AsString+
                    ' AND    IDPESSOA    = '+qry.FieldByName('IdTitular').AsString+
                    ' AND    SEQPROPOSTA = '+qry.FieldByName('SeqProposta').AsString+
                    ' AND    NUMEROPROCESSO = '+qry.FieldByName('NumeroProcesso').AsString+       // edilaine - SOL 253577-18152 / PPM 1318911
                    ' AND    FLGCOBRA    = 1 ');
            try
               ExecSQL;
            except
               frmAguarde.Apaga;
               MsgDlg(sRetemEncerra+' : Erro no encerramento das contribuições.','Erro',mtError,[mbOk,mbHelp],0);
               bEncerrou := False;
               Exit;
            end;
         end;
       end
       else  // edilaine - SOL 253577-18152 / PPM 1318911 - INICIO
       begin
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE CONTRIBPREVNUCLEO SET FLGCOBRA = 0, DATAFINAL = TO_DATE('''+sDataFinal+''', ''dd/mm/yyyy'') '+
                    ' WHERE  IDPESSJUR   = '+qry.FieldByName('IdPessJur').AsString+
                    ' AND    IDPLANOPREV = '+qry.FieldByName('IdPlanoPrev').AsString+
                    ' AND    IDPESSOA    = '+qry.FieldByName('IdPessoa').AsString+
                    ' AND    IDTITULAR   = '+qry.FieldByName('IdTitular').AsString+
                    ' AND    SEQPROPOSTA = '+qry.FieldByName('SeqProposta').AsString+
                    ' AND    NUMEROPROCESSO = '+qry.FieldByName('NumeroProcesso').AsString+
                    ' AND    FLGCOBRA    = 1 ');

            try
               ExecSQL;
            except
               frmAguarde.Apaga;
               MsgDlg(sRetemEncerra+' : Erro no encerramento das contribuições.','Erro',mtError,[mbOk,mbHelp],0);
               bEncerrou := False;
               Exit;
            end;
         end;
       end; // edilaine - SOL 253577-18152 / PPM 1318911 - FIM

     End;



     { Atualizar percentual de pensão caso parametro }
     { esteja marcado.                                                           }
     If prmFLGATUPERCGF = 1 Then Begin

       If Not CtrlBenefBfciario.AtualizaNumeroBeneficiarios( Qry.fieldbyname('NUMEROPROCESSO').AsInteger,
                                                             Qry.fieldbyname('IDBENEFICIO').AsInteger )
       Then Begin

          frmAguarde.Apaga;
          MsgDlg(sRetemEncerra+' : Erro no recalculo dos percentuais da Pensão.','Erro',mtError,[mbOk,mbHelp],0);
          bEncerrou := False;

          Exit;
       End;

     End;



     if qry.FieldByName('FlgBenefTemp').AsInteger = 1 then bAlgumBenefTemp := True;

     try
        CriaLogOcorrencia(qry.fieldbyname('IDPLANOPREV').asstring,
                          qry.fieldbyname('IDPESSJUR').asstring,
                          qry.fieldbyname('IDTITULAR').asstring,
                          qry.fieldbyname('IDBENEFICIO').asstring,
                          qry.fieldbyname('NUMEROPROCESSO').asstring,
                          qry.fieldbyname('IDPESSOA').asstring,
                          qry.fieldbyname('SEQPROPOSTA').asstring,
                          '4',
                          FormatDateTime('dd/mm/yyyy', Date),
                          floattostr(qry.fieldbyname('VALORATUAL').asfloat),
                          floattostr(qry.fieldbyname('VALORTOTAL').asfloat),
                          floattostr(qry.fieldbyname('VALORCOTAS').asfloat),
                          qry.fieldbyname('DATAINICIO').AsString,
                          sDataFinal,
                          qry.FieldByName('VALORATUAL').AsString,
                          qry.FieldByName('DATAINICIO').AsString,
                          qry.FieldByName('DATAFINALANT').AsString,
                          qry.FieldByName('IDSITBENEFICIO').AsString,
                          qry.FieldByName('FLGDATAPREVISTA').AsInteger,
                          qryGrava,
                          sMotivo,
                          iIdLoteRetemEncerra,
                          iIdCalculoGeral,
                          bVoltouPatro, {RetornaPatro}    // SOL 149847/6241 KINTANA 1405080
                          -1,  {UsuarioAutoriza}          // SOL 149847/6241 KINTANA 1405080
                          -1,  {FlgEmprestimo}             // SOL 149847/6241 KINTANA 1405080
                          True {RetencEncerramento} );    // SOL 149847/6241 KINTANA 1405080
     except
        frmAguarde.Apaga;
        MsgDlg(sRetemEncerra+' : Erro na gravação do log de ocorrência.','Erro',mtError,[mbOk],0);
        Exit;
     end;
     If Not AcertaSituacaoProcesso(3, qry.FieldByName('NumeroProcesso').AsInteger) Then //Thiago Passos //Thiago Passos SOL 127564 Ktn 692657
            Exit;
     qry.Next;
  end; // while not qry.Eof

  if (not qryBenefRecalculo.IsEmpty)
  then begin
     qryBenefRecalculo.First;
     while not qryBenefRecalculo.Eof do
     begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET VALORATUAL = '+OraNumero(qryBenefRecalculo.FieldByName('ValorAtual').AsString)+
                       '                        , VLRBSATUAL = '+OraNumero(qryBenefRecalculo.FieldByName('VlrBBAtual').AsString)+      // edilaine - SOL 253577-17541 / PPM 978024
                       '                        , VLRFABATUAL = '+OraNumero(qryBenefRecalculo.FieldByName('VlrfabAtual').AsString)+    // edilaine - SOL 253577-17541 / PPM 978024
                       ' WHERE  NUMEROPROCESSO = '+qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsString+
                       ' AND    IDPESSJUR      = '+qryBenefRecalculo.FieldByName('IDPESSJUR').AsString+
                       ' AND    IDPLANOPREV    = '+qryBenefRecalculo.FieldByName('IDPLANOPREV').AsString+
                       ' AND    IDPLANOORIGEM  = '+qryBenefRecalculo.FieldByName('IDPLANOORIGEM').AsString+
                       ' AND    IDTITULAR      = '+qryBenefRecalculo.FieldByName('IDTITULAR').AsString+
                       ' AND    SEQPROPOSTA    = '+qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsString+
                       ' AND    IDPESSOA       = '+qryBenefRecalculo.FieldByName('IDPESSOA').AsString+
                       ' AND    IDBENEFICIO    = '+qryBenefRecalculo.FieldByName('IDBENEFICIO').AsString);
        try
           qryAux.EXECSQL;
        except
           frmAguarde.Apaga;
           MsgDlg(sRetemEncerra+' : ao atualizar novo valor rateado. ','Erro',mtError,[mbOk,mbHelp],0);
           bEncerrou := False;
           Exit;
        end;
        qryBenefRecalculo.Next;
     end;

  end;



   if bEncerraPorFale then
   begin
      try
         qryAux.Close;
         qryAux.SQL.Clear;

         qryAux.SQL.Text :=
         'UPDATE RUBRICAINDIV SET FLGDESATIVADO = 1 WHERE IDPESSOA = ' +
         FormatFloat('#0', qry.FieldByName('IDPESSOA').AsInteger);

         qryAux.ExecSQL;
      except
      //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
      on e:Exception do
      begin
        TratarErro(e.Message);
         frmAguarde.Apaga;
         MsgDlg(sRetemEncerra + ' : Erro ao desativar rubricas individuais.', 'AdmPrev', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;
      //Brunno Mattos - KTN 767861 - SOL 132659 Fim

      end;
   end;


  if not ExecutaOperacoesReservaEContrib('E') then Exit;


   // Daniel Begnami  Pendencia 93755
   // Grava FLGTIPOREGISTRO = 1 (abono) para quando encerrado
   qry.first;
   while not qry.Eof do
   begin

     sSQL := 'UPDATE HSTBENEFBFCIARIO SET '                                            + #13 +
             '  FLGTIPOREGISTRO = 1'                                                   + #13 +
             'WHERE '                                                                  + #13 +
             '      NUMEROPROCESSO = '+ Qry.FieldByName('NUMEROPROCESSO').AsString     + #13 +
             '  AND IDPESSOA       = '+ Qry.FieldByName('IDPESSOA').AsString           + #13 +
             '  AND IDBENEFICIO    = '+ Qry.FieldByName('IDBENEFICIO').AsString        + #13 +
             '  AND IDTITULAR      = '+ Qry.FieldByName('IDTITULAR').AsString          + #13 +
             '  AND FLGDEVOLUCAO   = 0'                                                + #13 +
             '  AND IDPLANOPREV    = '+ Qry.FieldByName('IDPLANOPREV').AsString;
     QryAux.SQL.Clear;
     QryAux.SQL.Text := sSQL;
     QryAux.ExecSQL;

     sSQL := 'UPDATE HSTBENEFBFCIARIO SET '                                            + #13 +
             '  FLGTIPOREGISTRO = 2'                                                   + #13 +
             'WHERE '                                                                  + #13 +
             '      NUMEROPROCESSO = '+ Qry.FieldByName('NUMEROPROCESSO').AsString     + #13 +
             '  AND IDPESSOA       = '+ Qry.FieldByName('IDPESSOA').AsString           + #13 +
             '  AND IDBENEFICIO    = '+ Qry.FieldByName('IDBENEFICIO').AsString        + #13 +
             '  AND IDTITULAR      = '+ Qry.FieldByName('IDTITULAR').AsString          + #13 +
             '  AND FLGDEVOLUCAO   = 1'                                                + #13 +
             '  AND IDPLANOPREV    = '+ Qry.FieldByName('IDPLANOPREV').AsString;
     QryAux.SQL.Clear;
     QryAux.SQL.Text := sSQL;
     QryAux.ExecSQL;

     qry.next;
   end;
   // Fim

  frmAguarde.Apaga;

  Result := True;
end;




function TfrmRetemEncerraNOVO.ExecutaOperacoesReservaEContrib(pcOperacao : char ) : boolean;
var iIdEventoOcorrido : longint;
    iIdSitPart        : longint;
    sFlgSitPart       : string;
begin
  Result := False;
  if bVoltouPatro
  then begin
     if not RODAPADRAOMOVRESERVA( iIdPessJur,
                                  iIdPlanoPrev,
                                  iIdTitular,
                                  iSeqProposta,
                                  -1,
                                  qry.FieldByName('IDEVENTOGERADOR').AsInteger,
                                  iIdPessJur,
                                  iIdPlanoPrev,
                                  qry.FieldByName('FLGINTERNO').AsString,
                                  FormatDateTime('dd/mm/yyyy', Date), 
                                  sMsgErro,
                                  iNumeroProcesso,
                                  'O',
                                  '',
                                  True)
     then begin
        frmAguarde.Apaga;
        MsgDlg(sRetemEncerra+' : Erro na execução do Padrão de Movimentação de Reserva.','Erro',mtError,[mbOk,mbHelp],0);
        bEncerrou := False;
        Exit;
     end;

  end;

  // Se o encerramento/retencao foi chamado do menu
  // Entao, independente de ser Encerramento ou Retencao, suspender a cobrança das contribuições atuais
  // Senao, NÃO desassociar, pois foi chamado por uma tela de evento e esta tela irá desassociar
   if (bVeioDoMenu) and
      ( bProcessouSuplementacao = True ) and
       (pcOperacao = 'E') and //SOL124313 - Adler Souza
      (not DesassociaContribuicoesParticipante( qryAux, qryGrava,
                                                qry.FieldByName('IDPESSJUR').AsInteger,
                                                qry.FieldByName('IDPLANOPREV').AsInteger,
                                                qry.FieldByName('IDTITULAR').AsInteger,
                                                qry.FieldByName('SEQPROPOSTA').AsInteger,
                                                qry.FieldByName('IDEVENTOGERADOR').AsInteger,
                                                sMsgErro))
  then begin
     frmAguarde.Apaga;
     MsgDlg(sRetemEncerra+' : Erro na desassociação das contribuições do participante','Erro',mtError,[mbOk,mbHelp],0);
     bEncerrou := False;
     Exit;
  end;


  If (pcOperacao = 'E')   and
     ((sFlgEvento <> 'FL') and
      (sFlgIntEvento <> 'FL')) and
     (bVeioDoMenu)        and
     (qry.FieldByName('IDPESSOA').AsString = qry.FieldByName('IDTITULAR').AsString) and
     (qry.FieldByName('IDSITBENEFICIO').AsInteger <> 2)
  Then Begin
    { // Felipe A. Santos SOL 227769 KINTANA 2061696 - inicio Comentário
    if not AtualizaSitPart( qry.FieldByName('IDTITULAR').AsString,
                            qry.FieldByName('IDPLANOPREV').AsString,
                            qry.FieldByName('IDPESSJUR').AsString,
                            qry.FieldByName('SEQPROPOSTA').AsString)
    then
    begin
       bEncerrou := False;   // SOL 177418 Kintana 1630606
       frmAguarde.Apaga;
       Exit;
    end;
    // Felipe A. Santos SOL 227769 KINTANA 2061696 - Fim Comentário}
  End;


  
  // Se   foi encerramento
  //    E o encerramento não foi por FALECIMENTO
  //    E o encerramento não foi para CONCEDER OUTRO BENEFÍCIO
  // Entao voltar as situacoes do participante E
  //       reassociar as contribuicoes antigas
  if (pcOperacao = 'E') and (sFlgEvento <> 'FL') and (bAlgumBenefTemp) and (bVeioDoMenu)
  then begin
     // Voltar situacoes do participante para a situacao anterior
     frmAguarde.Apaga;
     if not VoltaSituacoesParticipante( qryAux, qryGrava,
                                        qry.FieldByName('IDPESSJUR').AsInteger,
                                        qry.FieldByName('IDPLANOPREV').AsInteger,
                                        qry.FieldByName('IDTITULAR').AsInteger,
                                        qry.FieldByName('SEQPROPOSTA').AsInteger,
                                        qry.FieldByName('IdEventoGerador').AsInteger,
                                        iIdEventoOcorrido,
                                        iIdSitPart,
                                        sFlgSitPart,
                                        sMsgErro, True)
     then begin
        frmAguarde.Apaga;
        MsgDlg(sRetemEncerra+' : Erro na atualização das situações do participante','Erro',mtError,[mbOk,mbHelp],0);
        bEncerrou := False;
        Exit;
     end;

     // Associar novas contribuicoes
     if not ReassociaContribuicoesParticipante( qryAux, qryGrava,
                                                qry.FieldByName('IDPESSJUR').AsInteger,
                                                qry.FieldByName('IDPLANOPREV').AsInteger,
                                                qry.FieldByName('IDTITULAR').AsInteger,
                                                qry.FieldByName('SEQPROPOSTA').AsInteger,
                                                iIdEventoOcorrido,
                                                qry.FieldByName('IdEventoGerador').AsInteger, 
                                                sMsgErro)
     then begin
        frmAguarde.Apaga;
        MsgDlg(sRetemEncerra+' : Erro na associação das contribuições do participante','Erro',mtError,[mbOk,mbHelp],0);
        bEncerrou := False;
        Exit;
     end;
  end;
  Result := True;
end;

function TfrmRetemEncerraNOVO.GravaDataVolta( pIdPessoa         : string;
                                              pIdPlanoPrev      : string;
                                              pIdPessjur        : string;
                                              pSeqProposta      : string;
                                              pIdEventoGerador  : string;
                                              pDataVolta        : string;
                                              pDataEvento       : string ) : boolean;
begin
  Result := False;
  // Procurar o Ultimo Evento Gerador da pessoa
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT EP.IDEVENTOSPREV, '+
                 ' EP.IDSITPARTATUAL, EP.IDSITFUNCATUAL, EP.IDSITPLANOATUAL '+ 
                 ' FROM   EVENTOSPREV EP '+
                 ' WHERE  '+
                 ' EP.IDPESSOA        = '+pIdPessoa+
                 ' AND    EP.IDPESSJUR       = '+pIdPessjur+
                 ' AND    EP.DATAEVENTO      = TO_DATE('+QuotedStr(pDataEvento)+','+
                                                         QuotedStr('DD/MM/YYYY')+')'+
                 ' AND    EP.IDEVENTOGERADOR = '+pIdEventoGerador);
  qryAux.Open;
  sIdEventosPrev := qryAux.FieldByName('IdEventosPrev').AsString;
  sIdSitPart     := qryAux.FieldByName('IDSITPARTATUAL').AsString;
  sIdSitFunc     := qryAux.FieldByName('IDSITFUNCATUAL').AsString;
  sIdSitPlano    := qryAux.FieldByName('IDSITPLANOATUAL').AsString;

  // Grava a Data em que o participante voltou de um evento temporário
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAVOLTA = TO_DATE(' +
                               QuotedStr(Trim(pDataVolta))+','+QuotedStr('DD/MM/YYYY')+')' +
                 ' WHERE IDPESSJUR       = ' + OraNumero(pIdPessjur)   + ' AND ' +
                 '       IDPLANOPREV     = ' + OraNumero(pIdPlanoPrev) + ' AND ' +
                 '       IDPESSOA        = ' + OraNumero(pIdPessoa)    + ' AND ' +
                 '       SEQPROPOSTA     = ' + OraNumero(pSeqProposta) + ' AND ' +
                 '       IDEVENTOSPREV   = ' + OraNumero(sIdEventosPrev));
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
         MostrarErro(E);
         Result := False;
         Exit;
     end;
  end;
  Result := True;
end; // GravaDataVolta

function TfrmRetemEncerraNOVO.AtualizaSitPart ( pIdPessoa         : string;
                                                pIdPlanoPrev      : string;
                                                pIdPessjur        : string;
                                                pSeqProposta      : string ) : boolean;
begin
  { Criação do Procedimento }

  Result := False;
  if Trim(sIdSitPart) = ''
  then begin
     MsgDlg('O evento gerador do benefício não foi encontrado. '+#13+
            'Assim, a situação de retorno do participante não foi encontrada.'+#13+
            'Verifique.','Erro',mtError,[mbOK],0);
     frmAguarde.Apaga;
     Exit;
  end;

  if Trim(sIdSitPlano) = ''
  then begin
     MsgDlg('O evento gerador do benefício não foi encontrado. '+#13+
            'Assim, a situação de retorno do participante não foi encontrada.'+#13+
            'Verifique.','Erro',mtError,[mbOK],0);
     frmAguarde.Apaga;
     Exit;
  end;

  // Se a situação no plano ou na fundação estiverem nulas, então exibir mensagem
  //atualiza as situações do participante conforme situação anterior ao evento
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPLANOPREV = '''+sIdSitPlano+''' , '+
                 ' IDSITPART = '''+sidSitPart+''' '+
                 ' WHERE IDPESSJUR       = ' + pIdPessjur   + ' AND ' +
                 '       IDPLANOPREV     = ' + pIdPlanoPrev + ' AND ' +
                 '       IDPESSOA        = ' + pIdPessoa    + ' AND ' +
                 '       SEQPROPOSTA     = ' + pSeqProposta );
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
        begin
             MostrarErro(E);
             Exit;
        end;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = '''+sIdSitFunc+'''  '+
                 ' WHERE IDPESSJUR       = ' + pIdPessjur   + ' AND ' +
                 '       IDPESSOA        = ' + pIdPessoa) ;
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
        begin
             MostrarErro(E);
             Exit;
        end;
  end;
  Result := True;  

end; // AtualizaSitPart

{ Atualiza salario de Mantido com o ultimo sálario de Auxilio Doença           }
procedure TfrmRetemEncerraNOVO.AtualizaSalarioMantido(sDataEncerramento : String);
Var
  sMesLocal, sSQLLocal : String;
begin
  { Busca Rubrica na HISTRUBSAL }
  sMesLocal := Copy ( sDataEncerramento,7,4 ) +'/'+ Copy ( sDataEncerramento,4,2 );
  sSQLLocal := ' SELECT NVL(VALORPROVENTO,0) AS VALORPROVENTO FROM HISTRUBSAL ' +
               ' WHERE  IDPESSJUR = '+qry.FieldByName('IDPESSJUR').AsString +
               ' AND    IDPESSOA  = '+qry.FieldByName('IDPESSOA').AsString  +
               ' AND    IDRUBRICA = '+QuotedStr(qry.FieldByName('IDRUBSALAUXDOENCA').AsString)  +
               ' AND    MES       = '+QuotedStr(sMesLocal)  ;
  qryGrava.SQL.Clear;
  qryGrava.SQL.Add(sSQLLocal);
  qryGrava.Open;

  { Caso não encontre rubrica sai fora }
  If qryGrava.IsEmpty Then Exit;

  { Atualiza PARTPREVPLAN }
  sSQLLocal := 'UPDATE PARTPREVPLAN SET '+
               ' SALMANTIDO = '+OraNumero(qryGrava.FieldByName('VALORPROVENTO').AsString)    + '      ' +
               'WHERE IDPESSJUR   = '+qry.FieldByName('IDPESSJUR').AsString    + ' AND  ' +
               '      IDPLANOPREV = '+qry.FieldByName('IDPLANOPREV').AsString  + ' AND  ' +
               '      IDPESSOA    = '+qry.FieldByName('IDPESSOA').AsString  ;
  qryGrava.SQL.Clear;
  qryGrava.SQL.Add(sSQLLocal);
  qryGrava.ExecSQL;
end;

procedure TfrmRetemEncerraNOVO.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  if bRetemEncerraProvisorio then
  MontaSelect.filtro[15] := 'B.FLGPROVISORIO = 1'
  else
  MontaSelect.filtro[15] := 'NVL(B.FLGPROVISORIO,0) = 0';
  

  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     iNumeroProcesso := StrToInt(MontaSelect.ValoresChave[0]);
     iIdTitular      := StrToInt(MontaSelect.ValoresChave[1]);
     iSeqProposta    := StrToInt(MontaSelect.ValoresChave[2]);
     iIdPessJur      := StrToInt(MontaSelect.ValoresChave[3]);
     iIdPlanoPrev    := StrToInt(MontaSelect.ValoresChave[4]);
     iIdPlanoOrigem  := StrToInt(MontaSelect.ValoresChave[6]);
     iIdPessoa       := StrToInt(MontaSelect.ValoresChave[7]);

     frmAguarde.Mostra('Buscando Benefícios ... ');
     qry.Close;
     qry.ParamByName('IDPESSOA').AsInteger       := iIdPessoa;
     qry.ParamByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
     //BRUNO AZEVEDO SOL 131703-4861 KINTANA 1277622
     qry.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
     qry.Open;
     frmAguarde.Apaga;


     If bVeioDoMenu
      Then sFlgEvento := qry.FieldByName('FLGINTEVENTO').AsString;
     

     qryTitular.Close;
     qryTitular.ParamByName('IdPessoa').Value    := iIdTitular;
     qryTitular.ParamByName('IdPessJur').Value   := iIdPessJur;
     // Thiago Melo SOL 204393 Ktn 2003327
//     qryTitular.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
     qryTitular.ParamByName('IdPlanoPrev').Value := iIdPlanoOrigem;
     // Thiago Melo SOL 204393 Ktn 2003327     
     qryTitular.ParamByName('SeqProposta').Value := iSeqProposta;
     qryTitular.Open;

     if qry.FieldByName('IDPESSOA').AsInteger = qry.FieldByName('IDTITULAR').AsInteger
     then lblTitulo.Caption := 'Benefícios do Participante '
     else lblTitulo.Caption := 'Benefícios do Beneficiário ';
     lblBeneficiario.Caption := qry.FieldByName('NOME').AsString+' (Matricula : '+qry.FieldByName('MATRICULADEP').AsString+')';
     bbtnConfirmar.Enabled := False;
     bbtnCancelar.Enabled  := False;
  end;
  bOperacaoEmAberto := False;
  sMotivo           := '';
end;

procedure TfrmRetemEncerraNOVO.sbtnRetencaoClick(Sender: TObject);
begin
  inherited;

  bEfetuaAcertoFinanceiro := True;

  sRetemEncerra := 'Retenção';

  if not ExecutaVerificacoes('R') then Exit;

  if not PedeInformacoesOperacao('R') then Exit;

  // edilaine - SOL 253577-18152 / PPM 1318911 - inicio
  if bVeioDoMenu then
     If ( dtmBaseDados.dbBaseDados.InTransaction = True ) Then dtmBaseDados.dbBaseDados.RollBack;
       dtmBaseDados.dbBaseDados.StartTransaction;

  {if bVeioDoMenu then
     if dtmBaseDados.dbBaseDados.InTransaction then // xavier SOL179728/9861 Kintana1677119
        dtmBaseDados.dbBaseDados.StartTransaction;  }
  // edilaine - SOL 253577-18152 / PPM 1318911 - fim

  // edilaine - SOL 253577-17541 / PPM 978024 - inicio
  {guarda data e hora que iniciou a revisão para buscar contribuições geradas}
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('select to_char(sysdate,''dd/mm/yyyy hh24:mi'') AS datenow from dual ');
  qryAux.Open;
  sdataInicioProcesso := qryAux.fieldByName('datenow').asstring;
  qryAux.Close;
  // edilaine - SOL 253577-17541 / PPM 978024 - fim

  if ProcessaRetencao
  then begin
     frmAguarde.Apaga;

     // edilaine - SOL 253577-17541 / PPM 978024 - inicio
     {if qry.FieldByName('IDPESSOA').AsInteger = qry.FieldByName('IDTITULAR').AsInteger
     then MostraDemonstrativoParticipante('R')
     else MostraDemonstrativoBeneficiario('R');  }

     GeraDemonstrativo('R');

     // edilaine - SOL 253577-17541 / PPM 978024 - fim


     if MsgDlg('Retenção efetuada com sucesso. Deseja efetivar a operação ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
     then begin
        if bVeioDoMenu then
           if dtmBaseDados.dbBaseDados.InTransaction then // xavier SOL179728/9861 Kintana1677119
              dtmBaseDados.dbBaseDados.Commit;
        MsgDlg('Retenção Confirmada.','Informação',mtInformation,[mbOk],0);

        // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
        try
          frmAguarde.Apaga;

          GeraDemonstrativo('R', 'homologado');
          bEncerrou := True;

        except
          MsgDlg('Erro ao gravar o demonstrativo.','Erro',mtError,[mbOk,mbHelp],0);
        end;
        // edilaine - SOL 253577-18174 / PPM 1327585 - fim

        iIdLoteRetemEncerra := 0;//Fanuel Marinho SOL179728/9861 Kintana1677119
     end
     else begin
        if bVeioDoMenu then
           if dtmBaseDados.dbBaseDados.InTransaction then // xavier SOL179728/9861 Kintana1677119
              dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Retenção Cancelada.','Informação',mtInformation,[mbOk],0);
        iIdLoteRetemEncerra := 0;//Fanuel Marinho SOL179728/9861 Kintana1677119
     end;
     bEncerraPorFale := false; // Thiago Melo SOL 179728 Kintana 1666360
     iIdLoteRetemEncerra := 0;//Fanuel Marinho SOL179728/9861 Kintana1677119
  end
  else begin
     if bVeioDoMenu then
        if dtmBaseDados.dbBaseDados.InTransaction then // xavier SOL179728/9861 Kintana1677119
           dtmBaseDados.dbBaseDados.RollBack;
     MsgDlg('Ocorreram erros no processamento da retenção.'+#13+
            'Retenção Cancelada.','Erro',mtError,[mbOk],0);
     iIdLoteRetemEncerra := 0;//Fanuel Marinho SOL179728/9861 Kintana1677119
  end;
  qry.Close;
  qry.ParamByName('IDPESSOA').AsInteger       := iIdPessoa;
  qry.ParamByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
  //BRUNO AZEVEDO SOL 167416 KINTANA 1468721
  qry.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
  qry.Open;

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
end;

procedure TfrmRetemEncerraNOVO.sbtnEncerramentoClick(Sender: TObject);
begin
  inherited;
  //BRUNO AZEVEDO SOL 136380 KINTANA 815875
  bEncInssAnt := False;
  if (not VerificaBeneficioINSS(qry.FieldByName('IDPESSOA').AsInteger)) then begin
    bEncInssAnt := True;
    //MsgDlg('É necessário encerrar o benefício INSS antes de encerrar o benefício FUNCEF.','Informação',mtInformation,[mbOK],0);
    //Exit;
  end;
  //BRUNO AZEVEDO SOL 136380 KINTANA 815875

  if not ExecutaVerificacoes('E') then Exit;

  if not PedeInformacoesOperacao('E') then Exit;

  //Não sei porque ficou True??
  //bEfetuaAcertoFinanceiro := True;

  sRetemEncerra := 'Encerramento';


  if bVeioDoMenu Then Begin
    If ( dtmBaseDados.dbBaseDados.InTransaction = True ) Then dtmBaseDados.dbBaseDados.RollBack;
    dtmBaseDados.dbBaseDados.StartTransaction;
  End;

  // edilaine - SOL 253577-17541 / PPM 978024 - inicio
  {guarda data e hora que iniciou a revisão para buscar contribuições geradas}
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('select to_char(sysdate,''dd/mm/yyyy hh24:mi'') AS datenow from dual ');
  qryAux.Open;
  sdataInicioProcesso := qryAux.fieldByName('datenow').asstring;
  qryAux.Close;
  // edilaine - SOL 253577-17541 / PPM 978024 - fim


  bCancelouEncerramento := False;

  if ProcessaEncerramento
  then begin
     frmAguarde.Apaga;

     // edilaine - SOL 253577-17541 / PPM 978024 - inicio
     {if qry.FieldByName('IDPESSOA').AsInteger = qry.FieldByName('IDTITULAR').AsInteger
     then MostraDemonstrativoParticipante('E')
     else MostraDemonstrativoBeneficiario('E');  }

     GeraDemonstrativo('E');

     // edilaine - SOL 253577-17541 / PPM 978024 - fim

     if MsgDlg('Encerramento efetuado com sucesso. Deseja efetivar a operação ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
     then begin
        GravaHstPercGrupo; //Ádler
        if bVeioDoMenu then
           if dtmBaseDados.dbBaseDados.InTransaction then // xavier SOL179728/9861 Kintana1677119
              dtmBaseDados.dbBaseDados.Commit;
        MsgDlg('Encerramento Confirmado.','Informação',mtInformation,[mbOk],0);

        // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
        try
          frmAguarde.Apaga;

          GeraDemonstrativo('E', 'homologado');

        except
          MsgDlg('Erro ao gravar o demonstrativo.','Erro',mtError,[mbOk,mbHelp],0);
        end;
        // edilaine - SOL 253577-18174 / PPM 1327585 - fim

        bEncerrou := True;
        iIdLoteRetemEncerra := 0;
        if not bVeioDoMenu then frmRetemEncerraNOVO.Close;


     end
     else begin
        if bVeioDoMenu then
           if dtmBaseDados.dbBaseDados.InTransaction then // xavier SOL179728/9861 Kintana1677119
              dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Encerramento Cancelado.','Informação',mtInformation,[mbOk],0);
        bEncerrou := False;
        iIdLoteRetemEncerra := 0;
        bCancelouEncerramento := True;

        //BRUNO AZEVEDO SOL 131703-4861 KINTANA 1277622
        bOperacaoEmAberto := False;

        if not bVeioDoMenu then frmRetemEncerraNOVO.Close;
     end;
  end
  else begin
     if bVeioDoMenu then
     begin
        if dtmBaseDados.dbBaseDados.InTransaction then // xavier SOL179728/9861 Kintana1677119
           dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Ocorreram erros no processamento do encerramento.'+#13+
            'Encerramento Cancelado.','Erro',mtError,[mbOk],0);
        bEncerrou         := False;
        bOperacaoEmAberto := False; // Thiago Melo SOL 179728 Kintana 1666360
        iIdLoteRetemEncerra := 0;
     end;

     if not bVeioDoMenu then frmRetemEncerraNOVO.Close;
  end;
  qry.Close;
  qry.ParamByName('IDPESSOA').AsInteger       := iIdPessoa;
  qry.ParamByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
  //BRUNO AZEVEDO SOL 167416 KINTANA 1468721
  qry.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
  qry.Open;


  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
end;

//Ádler
procedure TfrmRetemEncerraNOVO.GravaHstPercGrupo;
var
  sSql : String;
  QryProc :TwwQuery;

  begin
// edilaine - SOL 271311 / PPM 1361303 - inicio
    //GravaHstPercGrupoHistorico(qry.FieldByName('IDTITULAR').AsInteger); // Andre Imakawa - SIG 125281
    GravaHstPercGrupoHistorico(qry.FieldByName('IDTITULAR').AsInteger,0 , -4); // Andre Imakawa - SIG 125281

{//Thiago Passos SOL 32837  Kintana  660515
    QryProc := TwwQuery.Create(Application);
    QryProc.DataBaseName := 'BaseDados';
    QryProc.close;
    QryProc.SQL.clear;
    //BRUNO AZEVEDO SOL 166021 KINTANA 1443437
//     := 'DECLARE BEGIN PCK_PREV_HISTORICO_BENEFICIO.PR_GRAVAHSTPERCGRUPO('+qry.FieldByName('IDTITULAR').AsString+','+qry.FieldByName('IDPESSOA').AsString+','+qry.FieldByName('IDPESSJUR').AsString+','+qry.FieldByName('IDPLANOPREV').AsString+','+qry.FieldByName('IDBENEFICIO').AsString+','+StringReplace(qry.FieldByName('PERCENTUAL').AsString, ',', '.', [])+','+qry.FieldByName('FontePagadora').AsString+',NULL,NULL); END;';
    sSQL := 'DECLARE BEGIN PCK_PREV_HISTORICO_BENEFICIO.PR_GRAVAHSTPERCGRUPO('+qry.FieldByName('IDPLANOPREV').AsString+','+qry.FieldByName('FontePagadora').AsString+','+qry.FieldByName('IDPESSJUR').AsString+','+qry.FieldByName('IDTITULAR').AsString+','+qry.FieldByName('IDPLANOORIGEM').AsString+','+qry.FieldByName('SEQPROPOSTA').AsString+','+#39+'S'+#39+','+#39+qry.FieldByName('DATAFINAL').AsString+#39+'); END;';//SOL212205
    //sSQL := 'DECLARE BEGIN PCK_PREV_HISTORICO_BENEFICIO.PR_GRAVAHSTPERCGRUPO('+qry.FieldByName('IDTITULAR').AsString+','+qry.FieldByName('IDPESSOA').AsString+','+qry.FieldByName('IDPESSJUR').AsString+','+qry.FieldByName('IDPLANOPREV').AsString+','+qry.FieldByName('IDBENEFICIO').AsString+','+qry.FieldByName('PERCENTUAL').AsString+','+qry.FieldByName('FontePagadora').AsString+',NULL,NULL); END;';
    //BRUNO AZEVEDO SOL 166021 KINTANA 1443437
    QryProc.SQL.Add(sSQL);
    QryProc.ExecSQL;
//    dtmBaseDados.dbBaseDados.Commit;

}// edilaine - SOL 271311 / PPM 1361303 - fim

end;


procedure TfrmRetemEncerraNOVO.MostraDemonstrativoParticipante (pcOperacao : char);
var dTotalBeneficio : double;
    sLinhaComplemento, 
    sSalarioNaDib   : string;
    sOpcoesContrib  : string;
    iIdContribAtual, iIdContribAnterior : longint;
    bAlgumPagadorPatro : boolean;
begin
   frmAguarde.Mostra('Preparando o Demonstrativo de '+sRetemEncerra+' ...');

   qryResultado.Close;
   qryResultado.SQL.Add(' AND BF.IDBENEFICIO IN ('+sIdsBeneficio+')');
   qryResultado.SQL.Add(' AND BF.NUMEROPROCESSO IN ('+sNumeroProcesso+')');
   qryResultado.Open;
   

   qryResultadoHst.Close;
   qryResultadoHst.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
   qryResultadoHst.Open;

   qryAux.Close;
   bAlgumPagadorPatro := False;
   frmMostraAux.Caption := 'Resumo de '+sRetemEncerra+' de Benefício ... ';

   // Exibir dados do participante
   with frmMostraAux.memResult.Lines do
   begin
      Clear;
      Add('--------------------------------------------------------------------------------------------------');
      Add('                                DEMONSTRATIVO DE '+PreparaStr(UPPERCASE(sRetemEncerra),12)+'            - VERSÃO : '+Sistema.Versao);
      if iIdLoteRetemEncerra > 0 
      then Add('                                                                           LOTE   : '+IntToStr(iIdLoteRetemEncerra))
      else Add('                                                                           LOTE   : < a definir > ');
      Add('USUÁRIO : '+Sistema.NomeUsuario+'                         DATA DA '+UPPERCASE(sRetemEncerra)+' : ' + FormatDateTime('dd/mm/yyyy', Date)); 
      Add('--------------------------------------------------------------------------------------------------');
      Add('Participante : '+qryTitular.FieldByName('Nome').AsString);
      Add(' ');
      Add('Data de Nascimento  : '+qryTitular.FieldByName('DataNasc').AsString);

      if bEncerraPorFale Then
        //Denise Arruda 02/10/2008 Sol Nº 97656 Kintana Nº 425066
        //Add('Data do Falecimento : ' + FormatDateTime('dd/mm/yyyy', StrToDate(sNovaDataFinal)+1))
        Add('Data do Falecimento : ' + FormatDateTime('dd/mm/yyyy', StrToDate(sNovaDataFinal)))
      else
        Add('Data do Falecimento : '+qryTitular.FieldByName('DataMorte').AsString);

      Add('--------------------------------------------------------------------------------------------------');

      // Dados na Patrocinadora
      Add('  ');
      Add(PreparaStr('Patrocinadora  : '  +qryTitular.FieldByName('NomePatro').AsString,50)+
          PreparaStr('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Tempo Serv. Total : '+qryTitular.FieldByName('TempoServTotal').AsString+' anos '+
                                            qryTitular.FieldByName('TempoServTotMes').AsString+' meses '+
                                            qryTitular.FieldByName('TempoServTotDia').AsString+' dias ',49));

      // Dados no Plano
      Add('  ');
      Add('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString);
      Add('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString);
      Add('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString);

      Add('--------------------------------------------------------------------------------------------------');
      Add('PROCESSO Nº : '+qry.FieldbyName('NumeroProcesso').AsString);
      if bEncerraPorFale Then
        //Denise Arruda 02/10/2008 Sol Nº 97656 Kintana Nº 425066
        //Add('EVENTO : '+qry.FieldbyName('NOMEEVENTO').AsString+ ' - DATA DO EVENTO : ' + FormatDateTime('dd/mm/yyyy', StrToDate(sNovaDataFinal)+1))
        Add('EVENTO : '+qry.FieldbyName('NOMEEVENTO').AsString+ ' - DATA DO EVENTO : ' + FormatDateTime('dd/mm/yyyy', StrToDate(sNovaDataFinal)))
      else
        Add('EVENTO : '+qry.FieldbyName('NOMEEVENTO').AsString+ ' - DATA DO EVENTO : '+qry.FieldbyName('DTEVENTO').AsString);

      Add('--------------------------------------------------------------------------------------------------');
      Add('=> BENEFÍCIOS :');
      qryResultado.First;
      dTotalBeneficio := 0;
      while not qryResultado.Eof do
      begin
         Add('--------------------------------------------------------------------------------------------------');

         if qryResultado.FieldByName('FLGISENTOIRRF').AsInteger = 0
         then Add(PreparaStr('- '+qryResultado.FieldByName('Nome').AsString,50)+
                  PreparaStr('Isento de Imposto de Renda : Não ', 49))
         else Add(PreparaStr('- '+qryResultado.FieldByName('Nome').AsString,50)+
                  PreparaStr('Isento de Imposto de Renda : Sim ', 49));

         Add(' ');
         Add(' '+PreparaStr('Data de Requerimento : '+qryResultado.FieldByName('DataRequerimento').AsString, 50)+
                 PreparaStr('Data de Concessão : '+qryResultado.FieldByName('DataConcessao').AsString, 49));

         if qryResultado.FieldByName('FlgResgate').AsInteger = 0 // nao é resgate
         then begin
            Add(' '+PreparaStr('Data de Início no INSS : '+qryResultado.FieldByName('DataInicioINSS').AsString,50)+
                    PreparaStr('Data de Início na Fundação : '+qryResultado.FieldByName('DataInicioFUND').AsString,49));

            if (qryResultado.FieldByName('FLGDATAPREVISTA').AsInteger = 1) and (qryResultado.FieldByName('DATAFINALPREVISTA').AsString <> '')
            then Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final (Prevista) : '+qryResultado.FieldByName('DATAFINALPREVISTA').AsString,49))
            else if qryResultado.FieldByName('DATAFINAL').AsString <> ''
                 then Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final (Efetiva) : '+qryResultado.FieldByName('DATAFINAL').AsString,49))
                 else Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final : <indefinida> ',49));

            Add(' '+PreparaStr('Valor do INSS : Calculado = R$ '+FormatFloat('#0.00', qryResultado.FieldByName('VLRCALCINSS').AsFloat),50)+
                PreparaStr('Informado = R$ '+FormatFloat('#0.00', qryResultado.FieldByName('VLRINFINSS').AsFloat),49));
         end
         else begin // é resgate
            Add(' Data de Início na Fundação : '+qryResultado.FieldByName('DataInicioFUND').AsString);
         end;

         sSalarioNaDib := BuscaSalarioPESSOAINTEGRAL ( qryAux,
                                                       iIdPessJur,
                                                       iIdPlanoPrev,
                                                       iIdTitular,
                                                       iSeqProposta,
                                                       'AS',
                                                       Copy(qryResultado.FieldByName('DataInicioFUND').AsString,7,4)+'/'+Copy(qryResultado.FieldByName('DataInicioFUND').AsString,4,2)); 
         Add(' ');
         Add(' Valor do Benefício = R$ '+FormatFloat('#0.00', qryResultado.FieldByName('VALORATUAL').AsFloat));

         dTotalBeneficio := dTotalBeneficio + qryResultado.FieldByName('VALORATUAL').AsFloat;
         qryResultado.Next;
      end; // while not qryResultado.Eof

      // FUNCEF Colocar o total de benefícios
      Add(' Total dos Benefícios do Processo : '+FormatFloat('#0.00', dTotalBeneficio));

      Add('--------------------------------------------------------------------------------------------------');

      if pcOperacao = 'R'
      then Add(' Situação dos Benefícios do Processo alterada para RETIDO. ')
      else Add(' Situação dos Benefícios do Processo alterada para ENCERRADO. ');
      Add('--------------------------------------------------------------------------------------------------');
      qryResultadoHst.First;
      // Mostrar mês a mês quanto será pago e quanto será descontado

      //Se o o checkbox "nao efetuar acerto financeiro" estiver selecionado, nao executar esse trecho
      //Fanuel Marinho SOL179728/9861 Kintana1677119
      if bEfetuaAcertoFinanceiro then
      begin


      Add('--------------------------------------------------------------------------------------------------');
      if pcOperacao = 'R'
      then  Add('=> ACERTOS A SEREM FEITOS PELA RETENÇÃO ')
      else  Add('=> ACERTOS A SEREM FEITOS PELO ENCERRAMENTO ');
      Add('--------------------------------------------------------------------------------------------------');
      Add('MÊS      ITEM                                         PAGO/       DEVIDO      PAGAR       DESCONTAR '); 
      Add('                                                      DESC.                                         '); 
      Add(' ');

      //BRUNO AZEVEDO SOL 131703-4861 KINTANA 1277622
      
      // Buscar BENEFICIOS a pagar no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
//         SQL.Add(' SELECT /*+ INDEX (HSTBENEFBFCIARIO XIE20HSTBENEFBFCIARIO) */ '+ //Everson TIBERO
         SQL.Add(' SELECT '+ //Everson TIBERO
                 '        B.NOME, H.MESREFERENCIA, H.VALORPREV                  '+
                 ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H                       '+
                 ' WHERE  H.IDTITULAR        = '+IntToStr(iIdTitular)            +
                 ' AND    H.IDPESSOA         = '+IntToStr(iIdTitular)            +
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)            +
                 ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)          +
                 ' AND    H.SEQPROPOSTA      = 1                                '+
                 ' AND    H.FLGDEVOLUCAO     = 0                                '+
                 //BRUNO AZEVEDO SOL 131703-4861 KINTANA 1277622
                 ' AND    NVL(H.FLGENVIADO,0) IN (0,8,9)                        ');
         if iIdLoteRetemEncerra > 0
         then SQL.Add(' AND    H.IDLOTE      = '+IntToStr(iIdLoteRetemEncerra)  )
         else SQL.Add(' AND    H.IDMOTIVO    = '+IntToStr(iIdMotivoAux)         );

         SQL.Add(' AND    B.IDBENEFICIO      = H.IDBENEFICIO                    '+
                 ' ORDER BY B.NOME, H.MESREFERENCIA '                           );
         Open;

         First;
         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                       , 9)+
                 PreparaStr(FieldByName('Nome').AsString                                ,45)+
                 PreparaStr('(+)'+FormatFloat('#0.00',0)                                ,12)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat) ,12)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat) ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',0)                                ,12));
            Next;
         end;
      end;

      // Buscar Beneficios a devolver(descontar) no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
//         SQL.Add(' SELECT /*+ INDEX (HSTBENEFBFCIARIO XIE20HSTBENEFBFCIARIO) */ '+ //Everson TIBERO
         SQL.Add(' SELECT  '+ //Everson TIBERO
                 '        B.NOME, H.MESREFERENCIA, H.VALORPREV,                                               '+
                 '        SUM(DECODE(HANTES.FLGDEVOLUCAO,1,-HANTES.VLBENEFPGTO,HANTES.VLBENEFPGTO)) VALORPAGO '+
                 ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H, HSTBENEFBFCIARIO HANTES                            ');

         if iIdLoteRetemEncerra > 0
         then SQL.Add(' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteRetemEncerra)     )
         else SQL.Add(' WHERE  H.IDMOTIVO         = '+IntToStr(iIdMotivoAux)            );

         SQL.Add(' AND    H.IDPESSJUR             = '+IntToStr(iIdPessJur)               +
                 ' AND    H.IDPLANOPREV           = '+IntToStr(iIdPlanoPrev)             +
                 ' AND    H.IDPESSOA              = '+IntToStr(iIdTitular)               +
                 ' AND    H.SEQPROPOSTA           = 1                                   '+
                 ' AND    H.FLGDEVOLUCAO          = 1                                   '+
                 //BRUNO AZEVEDO SOL 131703-4861 KINTANA 1277622
                 ' AND    NVL(H.FLGENVIADO,0)     IN (0,8,9)                             '+
                 ' AND    HANTES.IDTITULAR(+)     = H.IDTITULAR                         '+
                 ' AND    HANTES.IDPESSOA(+)      = H.IDPESSOA                          '+
                 ' AND    HANTES.IDPESSJUR(+)     = H.IDPESSJUR                         '+
                 ' AND    HANTES.IDPLANOPREV(+)   = H.IDPLANOPREV                       '+
                 ' AND    HANTES.SEQPROPOSTA(+)   = H.SEQPROPOSTA                       '+
                 ' AND    HANTES.MESREFERENCIA(+) = H.MESREFERENCIA                     '+
                 ' AND    HANTES.IDBENEFICIO(+)   = H.IDBENEFICIO                       '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO                            '+
                 ' GROUP BY B.NOME, H.MESREFERENCIA, H.VALORPREV                        '+
                 ' ORDER BY B.NOME, H.MESREFERENCIA                                     ');
         Open;

         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                       , 9)+
                 PreparaStr(FieldByName('Nome').AsString                                ,45)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPago').AsFloat) ,12)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPago').AsFloat - FieldByName('ValorPrev').AsFloat),12)+
                 PreparaStr('(+)'+FormatFloat('#0.00',0)                                ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat) ,12));
            Next;
         end;
      end;

      // Buscar CONTRIBUICOES a devolver no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT C.NOME, CP.FLGPAGADOR, HST.MESREFERENCIA, HST.VALORESPERADO,                                '+
                 '        SUM(DECODE(HANTES.FLGDEVOLUCAO,1,-HANTES.VALORRECEBIDO,HANTES.VALORRECEBIDO)) VALORRECEBIDO '+
                 ' FROM   CONTRIBUICAO C, CONTPREV CP, HSTCONTRIBPREV HST, HSTCONTRIBPREV HANTES                      '+
                 ' WHERE  HST.IDPESSJUR       = ' + qryResultadoHST.FieldByName('IdPessJur').AsString                  +
                 ' AND    HST.IDPLANOPREV     = ' + qryResultadoHST.FieldByName('IdPlanoPrev').AsString                +
                 ' AND    HST.IDPESSOA        = ' + qryResultadoHST.FieldByName('IdPessoa').AsString                   +
                 ' AND    HST.SEQPROPOSTA     = ' + qryResultadoHST.FieldByName('SeqProposta').AsString                );

         if iIdLoteRetemEncerra > 0
         then SQL.Add(' AND    HST.IDLOTE         = '+IntToStr(iIdLoteRetemEncerra))
         else SQL.Add(' AND    HST.IDMOTIVO       = '+IntToStr(iIdMotivoAux));

         SQL.Add(' AND    HST.FLGDEVOLUCAO        = 1                                                                 '+
                 ' AND    HST.FLGDESCFOLHA        = 1                                                                 '+
                 ' AND    HST.FLGCONCESSAO        = 1                                                                 '+
                 ' AND    HST.SITRECEBIMENTO      <= 1                                                                '+ 
                 ' AND    CP.IDPLANOPREV          = HST.IDPLANOPREV                                                   '+
                 ' AND    CP.IDCONTRIBUICAO       = HST.IDCONTRIBUICAO                                                '+
                 ' AND    C.IDCONTRIBUICAO        = HST.IDCONTRIBUICAO                                                '+
                 ' AND    HANTES.IDPESSJUR(+)     = HST.IDPESSJUR                                                     '+
                 ' AND    HANTES.IDPLANOPREV(+)   = HST.IDPLANOPREV                                                   '+
                 ' AND    HANTES.IDPESSOA(+)      = HST.IDPESSOA                                                      '+
                 ' AND    HANTES.SEQPROPOSTA(+)   = HST.SEQPROPOSTA                                                   '+
                 ' AND    HANTES.IDCONTRIBUICAO(+)= HST.IDCONTRIBUICAO                                                '+
                 ' AND    HANTES.MESREFERENCIA(+) = HST.MESREFERENCIA                                                 '+ 
                 ' GROUP BY C.NOME, CP.FLGPAGADOR, HST.MESREFERENCIA, HST.VALORESPERADO                               '+
                 ' ORDER BY C.NOME, HST.MESREFERENCIA                                                                 ');
         Open;

         while not Eof do
         begin

            if FieldByName('FLGPAGADOR').AsString <> 'C'
            then begin
               bAlgumPagadorPatro := True;
               Add( PreparaStr(FieldByName('MesReferencia').AsString                       , 9)+
                    PreparaStr(FieldByName('Nome').AsString                                ,45)+
                    PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorRecebido').AsFloat)                                ,12)+
                    PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorRecebido').AsFloat-FieldByName('ValorEsperado').AsFloat),12)+
                    PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,12)+
                    PreparaStr('(-)'+FormatFloat('#0.00',0)                                ,12) + '(*)');
            end
            else
               Add( PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                    PreparaStr(FieldByName('Nome').AsString                          ,45)+
                    PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorRecebido').AsFloat)                                ,12)+
                    PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorRecebido').AsFloat-FieldByName('ValorEsperado').AsFloat),12)+
                    PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,12)+
                    PreparaStr('(-)'+FormatFloat('#0.00',0)                                ,12));
            Next;
         end;
      end;

      // Buscar CONTRIBUICOES a COBRAR no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT '+
                 '        C.IDCONTRIBUICAO, C.NOME, CP.NOMEVALORBASE1, CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, CP.NUMOPCOES, '+
                 '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,                                                  '+
                 '        HST.MESREFERENCIA, HST.VALORESPERADO, CP.FLGPAGADOR,                                             '+
                 '        SUM(DECODE(HANTES.FLGDEVOLUCAO,1,-HANTES.VALORRECEBIDO,HANTES.VALORRECEBIDO)) VALORRECEBIDO      '+ 
                 ' FROM   CONTRIBUICAO C, CONTPREV CP, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST,HSTCONTRIBPREV HANTES      '+
                 ' WHERE  HST.IDPESSJUR       = ' + qryResultadoHST.FieldByName('IdPessJur').AsString                       +
                 ' AND    HST.IDPLANOPREV     = ' + qryResultadoHST.FieldByName('IdPlanoPrev').AsString                     +
                 ' AND    HST.IDPESSOA        = ' + qryResultadoHST.FieldByName('IdPessoa').AsString                        +
                 ' AND    HST.SEQPROPOSTA     = ' + qryResultadoHST.FieldByName('SeqProposta').AsString                     );

         if iIdLoteRetemEncerra > 0
         then SQL.Add(' AND    HST.IDLOTE          = '+IntToStr(iIdLoteRetemEncerra)                                        )
         else SQL.Add(' AND    HST.IDMOTIVO        = '+IntToStr(iIdMotivoAux)                                               );

         SQL.Add(' AND    HST.FLGDEVOLUCAO    = 0                                                                           '+
                 ' AND    HST.FLGDESCFOLHA    = 1                                                                           '+
                 ' AND    HST.FLGCONCESSAO    = 1                                                                           '+
                 
                 //mostrar somente não pagos
                 ' AND    HST.SITRECEBIMENTO   <= 1                                                                         '+ 
                 
                 ' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO                                                          '+
                 ' AND    CPP.IDPESSJUR       = HST.IDPESSJUR                                                               '+
                 ' AND    CPP.IDPLANOPREV     = HST.IDPLANOPREV                                                             '+
                 ' AND    CPP.IDPESSOA        = HST.IDPESSOA                                                                '+
                 ' AND    CPP.SEQPROPOSTA     = HST.SEQPROPOSTA                                                             '+
                 ' AND    CPP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO                                                          '+
                 ' AND    CP.IDPLANOPREV      = CPP.IDPLANOPREV                                                             '+
                 ' AND    CP.IDCONTRIBUICAO   = CPP.IDCONTRIBUICAO                                                          '+
                 ' AND    HANTES.IDPESSJUR(+)     = HST.IDPESSJUR                                                           '+
                 ' AND    HANTES.IDPLANOPREV(+)   = HST.IDPLANOPREV                                                         '+
                 ' AND    HANTES.IDPESSOA(+)      = HST.IDPESSOA                                                            '+
                 ' AND    HANTES.SEQPROPOSTA(+)   = HST.SEQPROPOSTA                                                         '+
                 ' AND    HANTES.IDCONTRIBUICAO(+)= HST.IDCONTRIBUICAO                                                      '+
                 ' AND    HANTES.MESREFERENCIA(+) = HST.MESREFERENCIA                                                       '+
                 ' GROUP BY C.IDCONTRIBUICAO, C.NOME, CP.NOMEVALORBASE1, CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, CP.NUMOPCOES,'+
                 '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,                                                   '+
                 '        HST.MESREFERENCIA, HST.VALORESPERADO, CP.FLGPAGADOR                                               '+
                 ' ORDER BY C.NOME, HST.MESREFERENCIA ');
         Open;
         sOpcoesContrib     := '';
         iIdContribAnterior := -1;


         while not Eof do
         begin

            { No caso de acerto de abono o valor esperado já é o valor integral da contribuicao }
            If ( Pos( '/13', FieldByName('MESREFERENCIA').AsString ) > 0 ) Then
            Begin
              sLinhaComplemento := PreparaStr('(-)'+FormatFloat('#0.00', 0 ) ,12);
            End
            Else
            Begin
              sLinhaComplemento := PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorRecebido').AsFloat+
                                                                        FieldByName('ValorEsperado').AsFloat) ,12)
            End;

            if FieldByName('FLGPAGADOR').AsString <> 'C'
            then begin
               bAlgumPagadorPatro := True;
               Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                    PreparaStr(FieldByName('Nome').AsString                                    ,45)+
                    
                    PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorRecebido').AsFloat) ,12)+ 

                    sLinhaComplemento +


                    PreparaStr('(+)'+FormatFloat('#0.00',0)                                    ,12)+
                    PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,12)+'(*)');

            end
            else
               Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                    PreparaStr(FieldByName('Nome').AsString                                    ,45)+
                    PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorRecebido').AsFloat) ,12)+

                    sLinhaComplemento +

                    PreparaStr('(+)'+FormatFloat('#0.00',0)                                    ,12)+
                    PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,12));

            iIdContribAtual    := FieldByName('IDCONTRIBUICAO').AsInteger;
            if iIdContribAtual <> iIdContribAnterior
            then begin
               sOpcoesContrib := sOpcoesContrib+#13+#10+
                                 PreparaStr(FieldByName('Nome').AsString                             ,50)+
                                 PreparaStr(' '                                                      ,5)+
                                 PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE1').AsFloat) ,13)+
                                 PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE2').AsFloat) ,13)+
                                 PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE3').AsFloat) ,7);
               iIdContribAnterior := FieldByName('IDCONTRIBUICAO').AsInteger;
            end;
            Next;
         end;
      end;
      //BRUNO AZEVEDO SOL 131703-4861 KINTANA 1277622

      //Fanuel Marinho SOL179728/9861 Kintana1677119
      end;
      //Fanuel Marinho SOL179728/9861 Kintana1677119

      if bAlgumPagadorPatro
      then begin
         Add('(*) Contribuições Patronais. Estas contribuições serão enviadas para o CAP/CAR. ');
      end;

      // Mostrar opções de contribuições a cobrar
      if Trim(sOpcoesContrib) <> ''
      then begin
         Add('--------------------------------------------------------------------------------------------------');
         Add('=> OPÇÕES DE CONTRIBUIÇÕES A COBRAR  ');
         Add('--------------------------------------------------------------------------------------------------');
         Add('CONTRIBUIÇÃO                                           OPÇÃO 1      OPÇÃO 2      OPÇÃO 3 ');
         Add(sOpcoesContrib);
      end;

      Add('--------------------------------------------------------------------------------------------------');
      Add('                               APENAS PARA CONFERÊNCIA ');
      Add('--------------------------------------------------------------------------------------------------');
   end; // with
   frmAguarde.Apaga;
   frmMostraAux.ShowModal;
end; // MostraDemonstrativoParticipante


procedure TfrmRetemEncerraNOVO.MostraDemonstrativoBeneficiario (pcOperacao : char);
var dTotalBeneficio : double;
    sSalarioNaDib   : string;
    sOpcoesContrib  : string;
    iIdContribAtual, iIdContribAnterior : longint;
    bPrimeiraVez,
    bAlgumPagadorPatro : boolean;
    iIdPessoaAtual     : longint;
begin
   frmAguarde.Mostra('Preparando o Demonstrativo de '+sRetemEncerra+' ...');

   qry.First;

   
   qryResultado.Close;
   
   qryResultado.SQL.Add(' AND BF.IDBENEFICIO IN ('+sIdsBeneficio+')');
   qryResultado.SQL.Add(' AND BF.NUMEROPROCESSO IN ('+sNumeroProcesso+')');
   qryResultado.Open;
   

   qryResultadoHst.Close;
   qryResultadoHst.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
   qryResultadoHst.Open;

   qryAux.Close;
   bAlgumPagadorPatro := False;
   frmMostraAux.Caption := 'Resumo de '+sRetemEncerra+' de Benefício ... ';

   // Exibir dados do participante
   with frmMostraAux.memResult.Lines do
   begin
      Clear;
      Add('--------------------------------------------------------------------------------------------------');
      Add('                                DEMONSTRATIVO DE '+PreparaStr(UPPERCASE(sRetemEncerra),12)+'            - VERSÃO : '+Sistema.Versao);

      if (iIdLoteRetemEncerra > 0) 
      then Add('                                                                           LOTE   : '+IntToStr(iIdLoteRetemEncerra))
      else Add('                                                                           LOTE   : < a definir > ');
      
      Add('USUÁRIO : '+Sistema.NomeUsuario+'                         DATA DA '+UPPERCASE(sRetemEncerra)+' : ' + FormatDateTime('dd/mm/yyyy', date)); 
      Add('--------------------------------------------------------------------------------------------------');
      Add('Participante : '+qryTitular.FieldByName('Nome').AsString);
      Add(' ');
      Add('Data de Nascimento  : '+qryTitular.FieldByName('DataNasc').AsString);

      if bEncerraPorFale Then
        //Denise Arruda 02/10/2008 Sol Nº 97656 Kintana Nº 425066
        //Add('Data do Falecimento : ' + FormatDateTime('dd/mm/yyyy', StrToDate(sNovaDataFinal)+1))
        Add('Data do Falecimento : ' + FormatDateTime('dd/mm/yyyy', StrToDate(sNovaDataFinal)))
      else
        Add('Data do Falecimento : '+qryTitular.FieldByName('DataMorte').AsString);

      Add('--------------------------------------------------------------------------------------------------');

      // Dados na Patrocinadora
      Add('  ');
      Add(PreparaStr('Patrocinadora  : '  +qryTitular.FieldByName('NomePatro').AsString,50)+
          PreparaStr('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Tempo Serv. Total : '+qryTitular.FieldByName('TempoServTotal').AsString+' anos '+
                                            qryTitular.FieldByName('TempoServTotMes').AsString+' meses '+
                                            qryTitular.FieldByName('TempoServTotDia').AsString+' dias ',49));

      // Dados no Plano
      Add('  ');
      Add('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString);
      Add('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString);
      Add('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString);

      Add('--------------------------------------------------------------------------------------------------');
      Add('PROCESSO Nº : '+qry.FieldbyName('NumeroProcesso').AsString);

      if bEncerraPorFale Then
        //Denise Arruda 02/10/2008 Sol Nº 97656 Kintana Nº 425066
        //Add('EVENTO : '+qry.FieldbyName('NOMEEVENTO').AsString+ ' - DATA DO EVENTO : ' + FormatDateTime('dd/mm/yyyy', StrToDate(sNovaDataFinal)+1))
        Add('EVENTO : '+qry.FieldbyName('NOMEEVENTO').AsString+ ' - DATA DO EVENTO : ' + FormatDateTime('dd/mm/yyyy', StrToDate(sNovaDataFinal)))
      else
        Add('EVENTO : '+qry.FieldbyName('NOMEEVENTO').AsString+ ' - DATA DO EVENTO : '+qry.FieldbyName('DTEVENTO').AsString);

      Add('--------------------------------------------------------------------------------------------------');
      Add('=> SITUAÇÃO ATUAL DOS BENEFICIÁRIOS DO PROCESSO : ');
      Add('--------------------------------------------------------------------------------------------------');
      Add(PreparaStr('NOME',30)+' '+PreparaStr('BENEFÍCIO',18)+' '+PreparaStr('DIB',12)+' '+PreparaStr('DATA' ,12)+' '+PreparaStr('VALOR',12)+' '+PreparaStr('SITUACAO',10));
      Add(PreparaStr(' '   ,30)+' '+PreparaStr('         ',18)+' '+PreparaStr('   ',12)+' '+PreparaStr('FINAL',12)+' '+PreparaStr('ATUAL',12)+' '+PreparaStr('ATUAL   ',10));
      qryResultado.First;
      dTotalBeneficio := 0;
      while not qryResultado.Eof do
      begin
         Add( PreparaStr(qryResultado.Fieldbyname('NOMEBENEFICIARIO').AsString               ,30)+' '+
              PreparaStr(qryResultado.FieldByName('NOME').AsString                           ,18)+' '+
              PreparaStr(qryResultado.FieldByName('DATAINICIOFUND').AsString                 ,12)+' '+
              PreparaStr(qryResultado.FieldByName('DATAFINALPRINT').AsString                 ,12)+' '+
              PreparaStr(FormatFloat('#0.00', qryResultado.FieldByName('VALORATUAL').AsFloat),12)+' '+
              PreparaStr(qryResultado.FieldByName('DESCRICAO').AsString                      ,10));

         dTotalBeneficio := dTotalBeneficio + qryResultado.FieldByName('VALORATUAL').AsFloat;
         qryResultado.Next;
      end; // while not qryResultado.Eof

      Add('--------------------------------------------------------------------------------------------------');
      Add(PreparaStr('TOTAL DOS BENEFÍCIOS DO PROCESSO : R$ ',76)+FormatFloat('#0.00', dTotalBeneficio));
      Add('--------------------------------------------------------------------------------------------------');

       //Se o o checkbox "nao efetuar acerto financeiro" estiver selecionado, nao executar esse trecho
      //Fanuel Marinho SOL179728/9861 Kintana1677119
      if bEfetuaAcertoFinanceiro then
      begin

      // Mostrar mês a mês quanto será pago e quanto será descontado
      if pcOperacao = 'R'
      then  Add('=> ACERTOS A SEREM FEITOS PELA RETENÇÃO ')
      else  Add('=> ACERTOS A SEREM FEITOS PELO ENCERRAMENTO ');
      Add('--------------------------------------------------------------------------------------------------');
      Add(PreparaStr('MÊS',8)+' '+PreparaStr('NOME',30)+' '+PreparaStr('ITEM'     ,18)+' '+PreparaStr('PAGAR',15)+' '+PreparaStr('DESCONTAR' ,15));

      // Buscar BENEFICIOS a pagar no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT P.NOME AS NOMEBENEFICIARIO, B.NOME, H.MESREFERENCIA, H.VALORPREV '+
                 ' FROM   PESSOA P, BENEFICIO B, HSTBENEFBFCIARIO H      ');
         if iIdLoteRetemEncerra > 0
         then SQL.Add(' WHERE  H.IDLOTE      = '+IntToStr(iIdLoteRetemEncerra))
         else SQL.Add(' WHERE  H.IDMOTIVO    = '+IntToStr(iIdMotivoAux));
         SQL.Add(' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                 ' AND    H.IDTITULAR        = '+IntToStr(iIdTitular)+
                 ' AND    H.SEQPROPOSTA      = 1 '+
                 ' AND    H.FLGDEVOLUCAO     = 0 '+
                 ' AND    H.FLGCONCESSAO     = 1 '+ 
                 ' AND    NVL(H.FLGENVIADO,0)   = 0 '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                 ' AND    P.IDPESSOA         = H.IDPESSOA '+
                 ' ORDER BY H.MESREFERENCIA, P.NOME, B.NOME   ');
         Open;

         First;
         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                       ,8) +' '+
                 PreparaStr(FieldByName('NOMEBENEFICIARIO').AsString                    ,30)+' '+
                 PreparaStr(FieldByName('NOME').AsString                                ,18)+' '+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat) ,15)+' '+
                 PreparaStr('(-)'+FormatFloat('#0.00',0)                                ,15));
            Next;
         end;
      end; { With }

      // Buscar CONTRIBUICOES a devolver no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT P.NOME AS NOMEBENEFICIARIO, C.NOME, CP.FLGPAGADOR, HST.MESREFERENCIA, HST.VALORESPERADO             '+
                 ' FROM   PESSOA P, CONTRIBUICAO C, CONTPREV CP, HSTCONTRIBPREV HST '+
                 ' WHERE  HST.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    HST.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+

                 ' AND    HST.IDPESSOA = ' + qryResultadoHST.FieldByName('IdPessoa').AsString+

                 ' AND    HST.SEQPROPOSTA      = 1 '+
                 ' AND    P.IDPESSOA          = HST.IDPESSOA ');

         if iIdLoteRetemEncerra > 0
         then SQL.Add(' AND    HST.IDLOTE          = '+IntToStr(iIdLoteRetemEncerra))
         else SQL.Add(' AND    HST.IDMOTIVO        = '+IntToStr(iIdMotivoAux));

         SQL.Add(' AND    HST.FLGDEVOLUCAO    = 1 '+
                 ' AND    HST.FLGDESCFOLHA    = 1 '+
                 ' AND    HST.FLGCONCESSAO    = 1 '+
                 ' AND    HST.SITRECEBIMENTO   <= 1 '+ 
                 ' AND    CP.IDPLANOPREV      = HST.IDPLANOPREV '+
                 ' AND    CP.IDCONTRIBUICAO   = HST.IDCONTRIBUICAO '+
                 ' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO  '+
                 ' ORDER BY C.NOME, HST.MESREFERENCIA');
         Open;

         while not Eof do
         begin

            if FieldByName('FLGPAGADOR').AsString <> 'C'
            then begin
               bAlgumPagadorPatro := True;
               Add( PreparaStr(FieldByName('MesReferencia').AsString                 ,8)+' '+
                    PreparaStr(FieldByName('NOMEBENEFICIARIO').AsString              ,30)+' '+
                    PreparaStr(FieldByName('Nome').AsString                          ,18)+' '+
                    PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,15)+' '+
                    PreparaStr('(-)'+FormatFloat('#0.00',0)                                ,15) + '(*)');

            end
            else
               Add( PreparaStr(FieldByName('MesReferencia').AsString                 ,8)+' '+
                    PreparaStr(FieldByName('NOMEBENEFICIARIO').AsString              ,30)+' '+
                    PreparaStr(FieldByName('Nome').AsString                          ,18)+' '+
                    PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,15)+' '+
                    PreparaStr('(-)'+FormatFloat('#0.00',0)                                ,15));
            Next;
         end;
      end;

      // Buscar Beneficios a devolver(descontar) no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT P.NOME AS NOMEBENEFICIARIO, H.IDTITULAR, H.IDPESSOA, B.NOME, H.MESREFERENCIA, H.VALORPREV '+
                 ' FROM   PESSOA P, BENEFICIO B, HSTBENEFBFCIARIO H      ');
         if iIdLoteRetemEncerra > 0
         then SQL.Add(' WHERE  H.IDLOTE      = '+IntToStr(iIdLoteRetemEncerra))
         else SQL.Add(' WHERE  H.IDMOTIVO    = '+IntToStr(iIdMotivoAux));

         SQL.Add(' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                 ' AND    H.IDTITULAR        = '+IntToStr(iIdTitular)+
                 ' AND    H.SEQPROPOSTA      = 1 '+
                 ' AND    H.FLGDEVOLUCAO     = 1 '+
                 ' AND    H.FLGCONCESSAO     = 1 '+ 
                 ' AND    NVL(H.FLGENVIADO,0)   = 0 '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                 ' AND    P.IDPESSOA         = H.IDPESSOA    '+
                 ' ORDER BY B.NOME, H.MESREFERENCIA ');
         Open;

         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                 ,8) +' '+
                 PreparaStr(FieldByName('NOMEBENEFICIARIO').AsString              ,30)+' '+
                 PreparaStr(FieldByName('Nome').AsString                          ,18)+' '+
                 PreparaStr('(+)'+FormatFloat('#0.00',0)                                ,15)+' '+
                 PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat) ,15));
            Next;
         end;
      end;

      // Buscar CONTRIBUICOES a COBRAR no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT P.NOME AS NOMEBENEFICIARIO, C.IDCONTRIBUICAO, C.NOME, CP.NOMEVALORBASE1, CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, CP.NUMOPCOES, '+
                 '       CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,                                '+
                 '       HST.MESREFERENCIA, HST.VALORESPERADO, CP.FLGPAGADOR '+

                 'FROM   PESSOA P, CONTRIBUICAO C, CONTPREV CP, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST '+

                 'WHERE  '+
                 '     HST.IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND HST.IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
                 ' AND HST.IDPESSOA     = ' + qryResultadoHST.FieldByName('IdPessoa').AsString+
                 ' AND HST.SEQPROPOSTA  = 1 ');

         if iIdLoteRetemEncerra > 0
         then SQL.Add(' AND    HST.IDLOTE          = '+IntToStr(iIdLoteRetemEncerra))
         else SQL.Add(' AND    HST.IDMOTIVO        = '+IntToStr(iIdMotivoAux));

         SQL.Add(' AND    HST.FLGDEVOLUCAO    = 0 '+
                 ' AND    HST.FLGDESCFOLHA    = 1 '+
                 ' AND    HST.FLGCONCESSAO    = 1 '+

                 ' AND    HST.SITRECEBIMENTO   <= 1 '+


                 ' AND HST.IDPESSOA       = P.IDPESSOA '+
                 
                 ' AND HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO  '+

                 ' AND HST.IDPLANOPREV     = CP.IDPLANOPREV     '+
                 ' AND HST.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO  '+

                 ' AND HST.IDPESSJUR      = CPP.IDPESSJUR(+)       '+
                 ' AND HST.IDPLANOPREV    = CPP.IDPLANOPREV(+)     '+
                 ' AND HST.IDPESSOA       = CPP.IDPESSOA(+)        '+
                 ' AND HST.SEQPROPOSTA    = CPP.SEQPROPOSTA(+)     '+
                 ' AND HST.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO(+)  '+


                 'ORDER BY C.NOME, HST.MESREFERENCIA ');

         Open;
         sOpcoesContrib     := '';
         iIdContribAnterior := -1;
         while not Eof do
         begin
            if FieldByName('FLGPAGADOR').AsString <> 'C'
            then begin
               bAlgumPagadorPatro := True;
               Add( PreparaStr(FieldByName('MesReferencia').AsString      ,8)+' '+
                    PreparaStr(FieldByName('NOMEBENEFICIARIO').AsString              ,30)+' '+
                    PreparaStr(FieldByName('Nome').AsString                          ,18)+' '+
                    PreparaStr('(+)'+FormatFloat('#0.00',0)                          ,15)+' '+
                    PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,15)+'(*)');
            end
            else
               Add( PreparaStr(FieldByName('MesReferencia').AsString      ,8)+' '+
                    PreparaStr(FieldByName('NOMEBENEFICIARIO').AsString              ,30)+' '+
                    PreparaStr(FieldByName('Nome').AsString                          ,18)+' '+
                    PreparaStr('(+)'+FormatFloat('#0.00',0)                          ,15)+' '+
                    PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,15));

            iIdContribAtual    := FieldByName('IDCONTRIBUICAO').AsInteger;
            if iIdContribAtual <> iIdContribAnterior
            then begin
               sOpcoesContrib := sOpcoesContrib+#13+#10+
                                 PreparaStr(FieldByName('Nome').AsString    ,50)+
                                 PreparaStr(' '                                                   ,5)+
                                 PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE1').AsFloat) ,13)+
                                 PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE2').AsFloat) ,13)+
                                 PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE3').AsFloat) ,7);
               iIdContribAnterior := FieldByName('IDCONTRIBUICAO').AsInteger;
            end;
            Next;
         end;
      end;

      end;
      //Fanuel Marinho SOL179728/9861 Kintana1677119


      if bAlgumPagadorPatro
      then begin
         Add('(*) Contribuições Patronais. Estas contribuições serão enviadas para o CAP/CAR. ');
      end;

       // Mostrar opções de contribuições a cobrar
      if Trim(sOpcoesContrib) <> ''
      then begin
         Add('--------------------------------------------------------------------------------------------------');
         Add('=> OPÇÕES DE CONTRIBUIÇÕES A COBRAR  ');
         Add('--------------------------------------------------------------------------------------------------');
         Add('CONTRIBUIÇÃO                                           OPÇÃO 1      OPÇÃO 2      OPÇÃO 3 ');
         Add(sOpcoesContrib);
      end;

      Add('--------------------------------------------------------------------------------------------------');
      Add('                               APENAS PARA CONFERÊNCIA ');
      Add('--------------------------------------------------------------------------------------------------');
   end; // with
   frmAguarde.Apaga;
   frmMostraAux.ShowModal;
end; // MostraDemonstrativoBeneficiario

procedure TfrmRetemEncerraNOVO.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDPESSOA').AsInteger := -1;
  qry.Open;

  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;

  bVeioDoMenu := True;
  bObrigaDataEncerra := False;

  CtrlBenefBfciario := TCtrlBenefBfciario.Create;

  CtrlBenefBfciario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer,
                               True, Nil );

end;

procedure TfrmRetemEncerraNOVO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil( CtrlBenefBfciario );  
                                                           
end;

procedure TfrmRetemEncerraNOVO.FormShow(Sender: TObject);
begin
  inherited;

  iIdCalculoGeral := -1;

end;

procedure TfrmRetemEncerraNOVO.dbgrdBeneficiariosDblClick(Sender: TObject);
var
  idBeneficio,x: integer;
begin
  inherited;
  // SOL 102758 - KTN 534.895 Daniel Begnami
  idBeneficio := Qry.FieldByname('IDBENEFICIO').asInteger;
  x:=0;

  Qry.Edit;
  if Qry.FieldByname('Processar').asInteger = 0 then begin
     Qry.FieldByname('Processar').asInteger :=1;
  end else begin
     Qry.FieldByname('Processar').asInteger :=0;
  end;
  Qry.Post;

  Qry.First;

  while not Qry.eof do begin
    if Qry.FieldByname('Processar').asInteger = 1 then begin
      inc(x);
    end;
    Qry.next;
  end;

  if x > 0 then begin
      sbtnEncerramento.Enabled :=True;
      sbtnAvanco.Enabled       :=False;

  end else begin
      sbtnEncerramento.Enabled :=False;
      sbtnAvanco.Enabled       :=True;

  end;

  qry.locate('idbeneficio',(idBeneficio),[]);

  Qry.Edit;
  if Qry.FieldByname('Processar').asInteger = 0 then begin
     Qry.FieldByname('Processar').asInteger :=1;
  end else begin
     Qry.FieldByname('Processar').asInteger :=0;
  end;
  Qry.Post;
  // FIM

end;

// SOL 102758 - KTN - 534.895 Daniel Begnami
procedure TfrmRetemEncerraNOVO.sbtnAvancoClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Nenhum benefício foi marcado para ser encerrado, deseja prosseguir?',Caption, mtError, [mbNo, mbYes], 0) = mrYes then
    close;
//    frmEventoDemissaoCancel.AbreRequerParticipLocal;
end;
// FIM

//BRUNO AZEVEDO SOL 136380 KINTANA 815875
function TfrmRetemEncerraNOVO.VerificaBeneficioINSS(pIdPessoa: Integer): Boolean;
var
  xQryAux: TwwQuery;
  bMarcadoINSS: Boolean;
begin
  Result := True;

  qry.First;
  bMarcadoINSS := False;
  while not qry.Eof do begin
    if (qry.FieldbyName('FONTEPAGADORA').AsInteger = 2) and (qry.FieldbyName('PROCESSAR').AsInteger = 1) then begin
      bMarcadoINSS := True;
      Break;
    end;
    qry.Next;
  end;

  try
    xQryAux := TwwQuery.Create(Nil);
    with xQryAux do begin
      DatabaseName := 'BaseDados';
      Close;
      Sql.Clear;
      Sql.Add('SELECT IDSITBENEFICIO FROM BENEFBFCIARIO');
      Sql.Add(' WHERE IDPESSOA  = ' + IntToStr(pIdPessoa));
      Sql.Add('   AND FONTEPAGADORA = 2');
      Open;

      if (RecordCount > 0) then begin
        //VERDADEIRO CASO O BENEFICIO INSS ESTEJA ENCERRADO OU ESTEJA MARCADO PRA ENCERRAR
        Result := ((FieldByName('IDSITBENEFICIO').AsInteger = 3) or
                   (FieldByName('IDSITBENEFICIO').AsInteger = 5) or
                   (bMarcadoINSS));
      end;
    end;
  finally
    FreeAndNil(xQryAux);
  end;
end;

procedure TfrmRetemEncerraNOVO.bbtnSairClick(Sender: TObject);
begin
  //Otacilio Aquino SOL 181600 Kintana 1704215
  bEncerrou := false;
  inherited;
end;

procedure TfrmRetemEncerraNOVO.bbtnCancelarClick(Sender: TObject);
begin
  //Otacilio Aquino SOL 181600 Kintana 1704215
  bEncerrou := False;
  inherited;

end;

// edilaine - SOL 253577-17541 / PPM 978024 - inicio
procedure TfrmRetemEncerraNOVO.GeraDemonstrativo(pcOperacao: char;
                                                 sStatusDemonstrativo : string = '' );         // edilaine - SOL 253577-18174 / PPM 1327585
var
  iIdReport : integer;
  sMensagem : String;
  sSituacao : string;
  sTitMotivo : string;
begin

  frmAguarde.Mostra('Preparando o Demonstrativo da '+sRetemEncerra+' ...');

  // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
  {qryAux.close;
  qryAux.sql.Text := 'Select idreports from reports where idmodulo = 454 and name = ''Demonstrativos de Benefícios'' ';
  qryAux.Open;
  if not qryAux.IsEmpty then
  begin
    iIdReport := qryAux.Fields[0].AsInteger;
  }// edilaine - SOL 253577-18174 / PPM 1327585 - fim

    sSituacao := '';

    if pcOperacao = 'R' then
    begin
      sSituacao  := 'RETIDO';
      sTitMotivo := 'Motivo da Retenção:';
    end
    else
    begin
     sSituacao := 'ENCERRADO';
     sTitMotivo := 'Motivo do Encerramento:';
    end;

    qryAux.close;
    qryAux.sql.text := 'SELECT DS_MOTIVO '+
                       ' FROM MOTIVORE   '+
                       ' WHERE ID_MOTIVO = '+QuotedStr(sMotivo);
    qryAux.Open;

    frmAguarde.Apaga;

    // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
    try
      RptDemonstraBeneficios :=  TRptDemonstraBeneficios.create(self);
      with RptDemonstraBeneficios do
      begin
        CmpRptCM.ParamValues[0].AsString  := sRetemEncerra;
        CmpRptCM.ParamValues[1].AsString  := DateToStr(date);
        CmpRptCM.ParamValues[2].AsString  := sNumeroProcesso;
        CmpRptCM.ParamValues[3].AsInteger := iIdLoteRetemEncerra;
        CmpRptCM.ParamValues[4].AsString  := sTitMotivo;
        CmpRptCM.ParamValues[5].AsString  := sSituacao;
        CmpRptCM.ParamValues[6].AsString  := sdataInicioProcesso;
        CmpRptCM.ParamValues[7].AsString  := qryAux.Fields[0].AsString;
        CmpRptCM.ParamValues[8].AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
        CmpRptCM.ParamValues[9].AsInteger := qry.FieldByName('IDPERFILINVEST').AsInteger;   //edilaine - SIG55933

        AbreConsultas();
        if sStatusDemonstrativo = '' then
           TFrmPreview.CreateModalPreview(Application, rpDemonstraBeneficios, sRetemEncerra+' de Benefícios')
        else
           SalvarArquivoDemonstrativo();

      end;
    finally
      RptDemonstraBeneficios.free;
    end;
    // edilaine - SOL 253577-18174 / PPM 1327585 - fim


    // edilaine - SOL 253577-18174 / PPM 1327585 - comentado inicio
    {if not TRptDemonstraBeneficios.PrintReport(iIdReport,1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                               sRetemEncerra                  + '|=| ' +   // tipo operacao
                                               DateToStr(date)                + '|=| ' +   // data
                                               sNumeroProcesso                + '|=| ' +   // numprocesso
                                               IntToStr(iIdLoteRetemEncerra)  + '|=| ' +   // numLote
                                               sTitMotivo                     + '|=| ' +   // Titulo Motivo
                                               sSituacao                  + '|=| ' +       // Situacao
                                               sdataInicioProcesso        + '|=| ' +       // DtHora Inicio Processo
                                               qryAux.Fields[0].AsString  + '|=| ' +       // Motivo
                                               qry.FieldByName('IDPESSOA').AsString + '|   ', // idpessoa
                                               '',
                                               'BaseDados',
                                               Sistema.NomeEmpresa,
                                               Sistema.NomeModulo,
                                               sMensagem) then
       MsgDlg(sMensagem, 'Impressão do Demonstrativo de '+sRetemEncerra+'.', mtError, [], 0);
  end;
  qryAux.close;
  }// edilaine - SOL 253577-18174 / PPM 1327585 - fim

  frmAguarde.Apaga;
end;
// edilaine - SOL 253577-17541 / PPM 978024 - fim

end.


