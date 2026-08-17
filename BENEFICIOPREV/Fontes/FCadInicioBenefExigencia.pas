// **************************************************************************************
// ********************************** REGISTR DE ALTERAÇÕES ****************************
// **************************************************************************************
{-------------------------------------------------------------------------------
Alteração  : (dfm qryBenefRecalculo)  RecalculaBeneficiarios
Nº WO......: 39059
Data.......: 02/06/2026
Responsável: Leandro
Descrição..: Na liberação está considerando o valor atual reajustado e o
             valor anterior a data da liberação para aplicar o reajuste
//------------------------------------------------------------------------------
Alteração  :
Nº SIG.....: 126648
Data.......: 06/07/2022
Responsável: Luis Ferrari
Descrição..: Ajustar valor alterado do recebimento
-------------------------------------------------------------------------------
Alteração  :
Nº SIG.....: 125597
Data.......: 17/05/2022
Responsável: Luis Ferrari
Descrição..: Deixar o mês reembolso igual ao mês de referencia quando marcado e for inss
-------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick, RecalculaBeneficiarios, AjustaAbonoPago
Nº SIG.....: 124906
Data.......: 22/04/2022
Responsável: Edilaine
Descrição..: Alterar o motivo dos lançamentos para o processo de Liberação
//------------------------------------------------------------------------------
Alteração  : RecalculaBeneficiarios
Nº SIG.....: 124870
Data.......: 20/04/2022
Responsável: Edilaine
Descrição..: Na liberação de INSS nao calcula antecipação de abono corretamente
//------------------------------------------------------------------------------
Alteração  : (dfm qryBenef)  bbtnConfirmarClick
Nº SIG.....: 124212
Data.......: 30/03/2022
Responsável: Edilaine
Descrição..: Na liberação data prevista está vazia, causando erro de conversão
//------------------------------------------------------------------------------
Alteração  : (dfm) montaselect
Nº SIG.....:  124016
Responsável: Edilaine
Descrição..: acrescentar filtro de CPF na procura
Data.......: 16/03/2022
//------------------------------------------------------------------------------
Alteração  : RecalculaBeneficiarios
Nº SIG.....: 121019
Data.......: 24/11/2021
Responsável: Edilaine
Descrição..: Rateio indevido do abono anual. Se DIP de assistios ou DIB de pensao
             e benef. invalidez < 17/01 da data de liberação, não efetua o pro-rata
//------------------------------------------------------------------------------
Alteração  : (dfm qryBenefRecalculo)  RecalculaBeneficiarios
Nº SIG.....: 121009
Data.......: 24/11/2021
Responsável: Edilaine
Descrição..: Na liberação está considerando o valor atual reajustado e não o
             valor na data da liberação
//------------------------------------------------------------------------------
Alteração  : AtualizarDataFinalTaxa, bbtnConfirmarClick
Nº SIG.....: 119408
Data.......: 24/09/2021
Responsável: Edilaine
Descrição..: Não calcula taxas para liberação de pensão
//------------------------------------------------------------------------------
Alteração  : RecalculaBeneficiarios
Nº SIG.....: 65874
Data.......: 28/03/2018
Responsável: Andre Imakawa
Descrição..: Alterado a variavel sDataInicioParaAbono para usar a data digitada
             na tela.
//------------------------------------------------------------------------------
Alteração  : RecalculaBeneficiarios
Nº SIG.....: 65688
Data.......: 23/03/2018
Responsável: Andre Imakawa
Descrição..:
//------------------------------------------------------------------------------
Alteração  : RecalculaBeneficiarios
Nº SIG.....: 63981
Data.......: 28/02/2018
Responsável: Luiz Carlos
Descrição..: Ajuste Processamento calculo Abono   
//------------------------------------------------------------------------------
Alteração  : (.dfm qryBenefRecalculo, qryBenef) bbtnConfirmarClick, GeraDemonstrativo,
             RecalculaBeneficiarios
Nº SIG.....: 55933
Data.......: 02/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
//------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SIG.....: 19600
Data       : 27/04/2016
Responsável: André Imakawa
Descrição..: Sistema efetua Update mas deveria deletar e inserir na HSTBENEF.
             Em conversa com Raimundo e Tiago ficou definido que o update na
             HSTBENEF não deveria ocorrer e sim o delete e insert.
             Foi necessario alterar a rotina de insert da HSTBENEF, para que não
             valida-se o campo VALORPREV > 0, pois o problema do caso de teste
             ocorria com beneficios que não possuem valor.
{-------------------------------------------------------------------------------
Alteração  : GeraDemonstrativo, bbtnConfirmarClick
Nº SOL.....: 253577-18174
KTN / PPM  : 1327585
Data       : 31/03/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento do Deficit - gravação de demonstrativos
{-----------------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick, RecalculaBeneficiarios
Nº SOL.....: 253577-18143
KTN / PPM  : 1318908
Data       : 04/03/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - associaçao de taxas e liberacao
             do campo valor total para beneficios sem BS e FAB
{-----------------------------------------------------------------------------------------
Alteração  : qryBenefRecalculo
Nº SOL.....: 269297
KTN / PPM  : 1240079
Data       :17/02/2016
Responsável: Peterson Victor
Descrição..: Alteracao da query do qryBenefRecalculo(.dmf)
-----------------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick, RecalculaBeneficiarios
Nº SOL.....: 253577-18064
KTN / PPM  : 1240079
Data       : 14/01/2016
Responsável: Edilaine
Descrição..: valores nao sao atualizados na benefbfciario (BS, FAB, Base Deficit)
-----------------------------------------------------------------------------------------}
// Autor(a)    : Helio Lima Custódio
// Data        : 10/09/2015
// Pendência   : SOL: 253577/17514 PPM: 971383
// Descricao   : Ajustes para o equacionamento.
// --------------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier SOL: 243274 KTN: 583284
// Data        : 18/11/2014
// Pendência   : SOL: 243274 KTN: 583284
// Descricao   : Recompilação do SOL 243274 erro de merge.
// --------------------------------------------------------------------------------------
// Autor(a)    : Marcio Sanches Spinosa SOL: 243274 KTN: 583284
// Data        : 18/11/2014
// Pendência   : SOL: 243274 KTN: 583284
// Descricao   : Ajuste na data do mes de pagamento, referente ao lote.
// --------------------------------------------------------------------------------------
// Autor(a)    : Marcio Sanches Spinosa SOL: 243277 KTN: 583213
// Data        : 18/11/2014
// Pendência   : SOL: 243277 KTN: 583213
// Descricao   : A rotina esta inserido data nula.
// --------------------------------------------------------------------------------------
// Autor(a)    : William Moreira da Silva
// Data        : 18/09/2014
// Pendência   : SOL: 239684 KTN: 521320
// Descricao   : A rotina não esta atualizando o campo ULTMESPREPARO da estrutura BENEFBFCIARIO
// --------------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 30/08/2013
// Pendência   : SOL: 215159 KTN: 2044027
// Descricao   : Taxas de contribuição duplicadas no demonstrativo
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Data        : 02/08/2013
// Rotina      : MostraDemonstrativoConcessao, ef
// Pendência   : SOL: 212728 KTN 2038739
// Descricao   : ERRO NA TELA DE LIBERAÇÃO DE BENEFÍCIO RETIDO
// --------------------------------------------------------------------------------------
// Autor(a)  :  José Roberto Marque - JRM6
// Data      :  28/03/2012
// Pendência :  SOL 157203/4761 Kintana 1268806
// Descricao :  - Passa a chamar a Função RecalculaBeneficiarios para liberação de
//                beneficios retidos;
//              - Realiza a montagem do histórico de beneficios, para o caso de liberação
//                de Benefícios retidos.
//              - Complemento do mesmo SOL/KTM desenvolvido pelo Wyllian snteriormente;
//              - Passa a, por ocasião do recálculo a considerar os benefícios FORA DO
//                CONVENIO (flgenviado = 8) como retidos;
// --------------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 11/04/2012
// Rotina      : bbtnConfirmarClick
// Pendência   : SOL: 169562 KTN: 1507494
// Descricao   : Erro para liberação de mais de um benefício do mesmo titular
//------------------------------------------------------------------------------
// Autor(a)  :  BRUNO AZEVEDO
// Data      :  25/04/2012
// Pendência :  SOL 179060 KINTANA 1647220
// Descricao :  Retirado a implementação 157203_4761.
// --------------------------------------------------------------------------------------
// Autor(a)  :  Otacilio Aquino
// Data      :  29/09/2011
// Pendência :  SOL 162594 Kintana 1382922
// Descricao :  Adicionar código e descrição do plano contabil no demonstrativo.
// --------------------------------------------------------------------------------------
//Responsável : Renato Visoni
//Pendência   : SOL 152046/3701 Kintana 1129662
//Descrição   : O sistema está gerando duas contribuições no valor cheio com referência a 2010/13.
//---------------------------------------------------------------------------------------------------
// Autor(a)  :  Renato Visoni
// Pendência :  SOL 152046 Kintana 1126735
// Descricao :  Ao fazer a operação para a matrícula 2657951 o sistema esta
// trazendo informações do mês de 2010/07 sendo que a reativação do benefício acontece
// a partir de 2010/08. 
// --------------------------------------------------------------------------------------
// Autor(a)  :  BRUNO AZEVEDO
// Data      :  30/07/2010
// Pendência :  SOL 140428 KINTANA 885095
// Descricao :  Alteração na query do monta select.
// --------------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 20/08/2010
// Rotina      : PreparaBeneficioConcedido
// Pendência   : SOL: 140428/2281 KTN: 906763
// Descricao   : Retirado o +1 da variavel data sDataFinalAConsiderar ao efetuar
// uma liberação de benefício ao montar a query de entrada.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Santana
// Data        : 22/07/2010
// Rotina      : bbtnConfirmarClick
// Pendência   : SOL: 876768 KTN: 140245
// Descricao   : Considerar AnoMesPagamento caso a DATAFINALPREVISTA esteja nula.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 31/08/2009
// Rotina      : bbtnConfirmarClick
// Pendência   : SOL: 123670 KTN: 621008
// Descricao   : Implementação no filtro na gravação da BENEFBFCIARIO
//------------------------------------------------------------------------------
// Autor(a)    : Claudio
// Data        : 05/06/2008
// Rotina      : bbtnConfirmarClick
// Pendência   : 28044
// Descricao   : Alteração no filtro de datafinal da gravação da BENEFBFCIARIO
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 22/12/2007
// Rotina      : MontaSelect
// Pendência   : 27140
// Descricao   : Alteração do join de IDPLANOPREV para IDPLANOORIGEM na BENEFBFCIARIO
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 14/12/2007
// Rotina      : MontaSelect
// Pendência   : 27012
// Descricao   : Retirado o FlgDesativado = 0 do montaselect
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 26/10/2007
// Rotina      : bbtnConfirmarClick
// Pendência   : 26861
// Descricao   : Acerto na atualização da DATAFINAL do beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 26/10/2007
// Rotina      : bbtnConfirmarClick
// Pendência   : 26718
// Descricao   : Acerto na passagem do Valor do SRB para rotina de preparo de beneficios
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 21/09/2007
// Rotina      : bbtnConfirmarClick
// Pendência   : 26226
// Descricao   : Em caso de liberação integral, voltar a DATAFINAL apagada na retenção
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/08/2007
// Rotina      : bbtnConfirmarClick
// Pendência   : 26024
// Descricao   : Acerto no tratamento da DATAFINAL efetiva
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/07/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Rotina      : MontaSelect
// Data        : 15/06/2007
// Pendência   : 25524
// Descricao   : 1) Incluir join por PLANO entre o Beneficio e a PartPrevPlan
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/06/2007
// Pendência   : 24726                              
// Descricao   : 1) Retirado o FLGDESATIVADO da QryTitular
//               2) Caso o beneficio não seja selecionado para liberar, pular.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 10/05/2007
// Rotina      : QryBenef
// Pendência   : 25318
// Descricao   : Incluir coluna FLGPAGAINSSBENEF na query
// Data        : 11/04/2007
// Rotina      : MostraDemonstrativoConcessao
// Pendência   : 25045
// Descricao   : Mostrar o VALORTOTAL no demonstrativo
// Pendência   : 24955
// Descricao   : Acerto no demonstrativo. Historico de beneficios devolvidos estava
//               filtrando pelo IDPESSOA = IDTITULAR
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 14/03/2007
// Rotina      : bbtnConfirmarClick
// Pendência   : 24726
// Descricao   : Ajuste quando for liberação parcial.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 26/01/2007
// Rotina      : bbtnConfirmarClick
// Pendência   : 24313
// Descricao   : Tratamento para concessões fora do convênio do INSS
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 07/11/2006
// Pendência   : 23689
// Rotina      : bbtnConfirmarClick
// Descricao   : Inicialização da variavel iIdUsuarioAutoriza.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 11/01/2006
// Pendência   : 19531
// Rotina      : Varias
// Descricao   : Atualizar o campo FLGPAGAINSS da BENEFBFCIARIO
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Augusto
// Pendência   : 20041
// Data        : 29/09/2005
// Descricao   : Não estava calculando contribuições para pensioniostas
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Leo
// Pendência   : 19438 (acerto da pendência 18060)
// Data        : 09/06/2005
// Descricao   : não atualizar o campo com o mês 13
//------------------------------------------------------------------------------
// Rotina      : geral
// Autor(a)    : Leo
// Pendência   : 19306 - correção da 18895
// Data        : 23/04/2005
// Descricao   : a modificação feita em 22/04/2005 alteraou a variável snumeroprocesso para ser
//               a concatenação de vários números de processoa separados por vírgula.
//               O erro estava em que várias partes da tela estavam esperando esta variável como um número único
//               esta variável como um número único.
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Pendência   : 18896, 18897
// Data        : 25/04/2005
// Descricao   : Só calcula contribuições se o processo tiver benefícios que não
//               sejam de referência.
//------------------------------------------------------------------------------
// Rotina      : bbtnProcurarClick e MostraDemonstrativoConcessao
// Autor(a)    : Gleyber
// Pendência   : 18895
// Data        : 22/04/2005
// Descricao   : Alteração para trazer todos os benefícios que estão retidos do titular.
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Pendência   : 18060
// Data        : 22/03/2005
// Descricao   : Atualização da ultmêspreparo pelo maior mês na HSTBENEF preparado
//------------------------------------------------------------------------------
// Rotina      : bbtnProcurarClick
// Autor(a)    : Augusto
// Data        : 30/12/2004
// Descricao   : Acerto no controle do IDPLANOORIGEM
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Pendência   : 17993
// Data        : 10/11/2004
// Descricao   : Passa a abrir a tela de liberação integral/parcial por participante
//               e não mais por processo.
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Augusto
// Data        : 02/07/2004
// Descricao   : Alterações para retornar o Valor Integral do beneficio na data
//               da Liberação
//------------------------------------------------------------------------------
// Rotina      : VerificaPERCLimiteBeneficio
// Autor(a)    : Camille
// Pendência   : 16644
// Data        : 11.05.2004
// Descricao   : Nova rotina para tratamento de valor limite de beneficio
//------------------------------------------------------------------------------
// Rotina      : VerificaVALORLimiteBeneficio
// Autor(a)    : Camille
// Pendência   : 16644
// Data        : 04.05.2004
// Descricao   : Nova rotina para tratamento de valor limite de beneficio
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Ricardo Vigorito
// Pendência   : 16270
// Data        : 23/03/20034
// Alteração   : Na liberação de benefício retido, quando o benefício tiver
//               data final, ela será utilizada com limitador do pagamento.
///------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 14/11/2003
// Alteração   : Alteração do filtro de consulta, o IDPLANOPREV pelo IDPLANOORIGEM
//               Problemas com migração de beneficiarios.
// Data        : 09/02/2004
// Alteração   : VALORATUAL esta passando no lugar do VALORTOTAL para PreparaBeneficioConcedido
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/08/2003
// Pendencia   : 14821
// Alteração   : Numero de Beneficiários não estava sendo passado para rotina de
//               calculo do beneficio.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : ValorBeneficioNaData
// Autor(a)  : Augusto
// Data      : 27/05/2003
// Alteração : Data para pesquisa do Salario de Beneficio não adociona um dia.
// -----------------------------------------------------------------------------
// Rotina    : ValorBeneficioNaData
// Autor(a)  : Augusto
// Data      : 22/01/2003
// Alteração : Nova Funcionalidade para buscar o valor de um beneficio em uma data.
//             Utilizado nos calculos dereajuste retroativos.
// -----------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Carlos Guedes
// Data      : 24/10/2002
// Alteração : Acertando qry do demonstrativo
// -----------------------------------------------------------------------------
// Rotina    : CriaLogOcorrencia
// Autor(a)  : Camille
// Data      : 13.08.2002
// Alteração : Gravação do Lote da Movimentacao de Beneficio
// -----------------------------------------------------------------------------
// Rotina    : Várias
// Autor(a)  : Carlos Guedes
// Data      : 14/10/2002
// Alteração : Adicionado campo que indicará até que data será pago o benefício,
//             caso não seja informada, será pago até a data do lote.
// -----------------------------------------------------------------------------
// Autor     : Carlos Eduardo Guedes
// Data      : 16/05/2002
// Alteração : Adicionando crítica "If not dtmBaseDados.dbBaseDados.InTransaction Then"
// Alteração : sIdpessoa passado em BuscaSalarioPESSOAINTEGRAL e GeraSalarioRetroativo
//             não era alimentado.
// -----------------------------------------------------------------------------
unit FCadInicioBenefExigencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, MontaSelect,
  Mask, DBTables, Db, Wwdatsrc, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  TB97Tlbr, DBCtrls {DBCtrlt}, FPreview;

type
  TfrmCadInicioBenefExigencia = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    qryWork: TwwQuery;
    MontaSelectOLD: TMontaSelect;
    wwDBGrid1: TwwDBGrid;
    qryBenef: TwwQuery;
    dsBenef: TwwDataSource;
    updBenef: TUpdateSQL;
    qryTitular: TwwQuery;
    qryContrib: TwwQuery;
    QryBenefValidos: TwwQuery;
    Panel3: TPanel;
    pnlTitular: TPanel;
    Label13: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    pnlBotaoProcurar: TPanel;
    bbtnProcurar: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    MontaSelect: TMontaSelect;
    Panel1: TPanel;
    dsTitular: TwwDataSource;
    qryHstBenefAntesLiberar: TwwQuery;
    qryBenefRecalculo: TwwQuery;
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
    qryResultadoDATAFINALPRINT: TDateTimeField;
    qryBenefFLGLIBERA: TFloatField;
    qryBenefNUMEROPROCESSO: TFloatField;
    qryBenefNOMEBENEFICIO: TStringField;
    qryBenefNOME: TStringField;
    qryBenefIDDEPENDENCIA: TStringField;
    qryBenefDATAINICIO: TDateTimeField;
    qryBenefDATAFINALPREVISTA: TDateTimeField;
    qryBenefDATAFINAL: TDateTimeField;
    qryBenefVALORATUAL: TFloatField;
    qryBenefSITUACAO: TStringField;
    qryBenefDTINICIOLIBERACAO: TDateTimeField;
    qryBenefIDEVENTOGERADOR: TFloatField;
    qryBenefIDSITBENEFICIO: TFloatField;
    qryBenefIDPESSJUR: TFloatField;
    qryBenefIDPESSOA: TFloatField;
    qryBenefIDTITULAR: TFloatField;
    qryBenefSEQPROPOSTA: TFloatField;
    qryBenefIDBENEFICIO: TFloatField;
    qryBenefVALORSRB: TFloatField;
    qryBenefIDPLANOPREV: TFloatField;
    qryBenefULTMESREAJUSTE: TStringField;
    qryBenefFLGPAGAINSS: TFloatField;
    qryBenefFLGPAGAINSSBENEF: TFloatField;
    qryBenefDATAREQUERIMENTO: TDateTimeField;
    qryBenefDATAINICIOFUND: TDateTimeField;
    qryBenefDATACONCESSAO: TDateTimeField;
    qryBenefDATAINICIOINSS: TDateTimeField;
    qryBenefFLGDATAPREVISTA: TFloatField;
    qryBenefVLRINFINSS: TFloatField;
    qryBenefVLRCALCINSS: TFloatField;
    qryBenefVALORCOTAS: TFloatField;
    qryBenefVALORTOTAL: TFloatField;
    qryBenefFLGBENEFTEMP: TFloatField;
    qryBenefFLGSALVIRTBENEF: TFloatField;
    qryBenefIDREGRACALCULO: TFloatField;
    qryBenefIDREGRAPRIMPAGTO: TFloatField;
    qryBenefIDREGRAULTPAGTO: TFloatField;
    qryBenefIDTPPAGTOBENEFIC: TFloatField;
    qryBenefCODPORTFORMA: TFloatField;
    qryBenefFLGCALCTODOMES: TFloatField;
    qryBenefFLGRESGATE: TFloatField;
    qryBenefFLGINTERNO: TStringField;
    qryBenefIDSITPART: TFloatField;
    qryBenefFLGREFERENCIA: TFloatField;
    qryBenefDATAFINALANT: TDateTimeField;
    qryBenefIDRESPONSAVEL: TFloatField;
    qryVirtual: TwwQuery;
    dsVirtual: TwwDataSource;
    updVirtual: TUpdateSQL;
    qryVirtualNUMEROPROCESSO: TStringField;
    qryVirtualIDPLANOPREV: TStringField;
    qryVirtualIDTITULAR: TStringField;
    qryVirtualIDPESSJUR: TStringField;
    qryVirtualIDBENEFICIO: TStringField;
    qryVirtualIDPESSOA: TStringField;
    qryVirtualSEQPROPOSTA: TStringField;
    qryVirtualDTINICIOLIBERACAO: TStringField;
    qryHstbenef: TwwQuery;
    updHstBenef: TUpdateSQL;
    dsHstbenef: TwwDataSource;
    qryHstbenefIDTITULAR: TFloatField;
    qryHstbenefIDPESSJUR: TFloatField;
    qryHstbenefIDPLANOPREV: TFloatField;
    qryHstbenefIDBENEFICIO: TFloatField;
    qryHstbenefIDMOTIVO: TFloatField;
    qryHstbenefIDPESSOA: TFloatField;
    qryHstbenefNUMEROPROCESSO: TFloatField;
    qryHstbenefMES: TStringField;
    qryHstbenefVLBENEFPGTO: TFloatField;
    qryHstbenefIDREGRAABATERESE: TFloatField;
    qryHstbenefIDRETROATIVO: TFloatField;
    qryHstbenefSEQBENEFICIO: TFloatField;
    qryHstbenefSEQPROPOSTA: TFloatField;
    qryHstbenefIDREGRACALCULO: TFloatField;
    qryHstbenefIDLOTE: TFloatField;
    qryHstbenefDTEFETPGTO: TDateTimeField;
    qryHstbenefVALORPREV: TFloatField;
    qryHstbenefDATAPAGAMENTO: TDateTimeField;
    qryHstbenefCODPORTFORMA: TFloatField;
    qryHstbenefVALORBASE1: TFloatField;
    qryHstbenefVALORBASE2: TFloatField;
    qryHstbenefVALORBASE3: TFloatField;
    qryHstbenefVALORBASE4: TFloatField;
    qryHstbenefVALORBASE5: TFloatField;
    qryHstbenefVALORCALCULADO: TFloatField;
    qryHstbenefFLGACERTODESFEITO: TFloatField;
    qryHstbenefVALOROP1: TFloatField;
    qryHstbenefVALOROP2: TFloatField;
    qryHstbenefVALOROP3: TFloatField;
    qryHstbenefCODREFERENCIA: TStringField;
    qryHstbenefFLGENVIADO: TFloatField;
    qryHstbenefMESREFERENCIA: TStringField;
    qryHstbenefVLRTOTRETROATIVO: TFloatField;
    qryHstbenefVLRDIFRETROATIVO: TFloatField;
    qryHstbenefFLGCONCESSAO: TFloatField;
    qryHstbenefFLGDEVOLUCAO: TFloatField;
    qryHstbenefFLGFORMAPAGTO: TStringField;
    qryHstbenefVALORTOTAL: TFloatField;
    qryHstbenefFONTEPAGADORA: TFloatField;
    qryHstbenefCODDOCUMENTO: TFloatField;
    qryHstbenefTRGDTINCLUSAO: TDateTimeField;
    qryHstbenefTRGUSERINCLUSAO: TStringField;
    qryHstbenefIDAGENCIARESGATE: TFloatField;
    qryHstbenefVALORINTEGRAL: TFloatField;
    qryHstbenefVALORPREVMIN: TFloatField;
    qryHstbenefIDREGRABENEFMIN: TFloatField;
    qryHstbenefIDHSTFOLHABENEF: TFloatField;
    qryHstbenefFLGDESCIRMES: TFloatField;
    qryHstbenefVALORSRB: TFloatField;
    qryHstbenefPERCPROVISORIO: TFloatField;
    qryHstbenefFLGMANUAL: TFloatField;
    qryHstbenefIDPLANOORIGEM: TFloatField;
    qryHstbenefFLGPROVISORIO: TFloatField;
    qryHstbenefIDTITBENEF: TFloatField;
    qryHstbenefVALORACERTO: TFloatField;
    qryHstbenefIDSEQINTERNOFB: TFloatField;
    qryHstbenefIDMOVBENEF: TFloatField;
    qryHstbenefPERCENTUAL: TFloatField;
    qryHstbenefFLGTIPOREGISTRO: TFloatField;
    qryHstbenefFLGALIMRESERVA: TFloatField;
    qryHstbenefLOTEORIGINAL: TFloatField;
    qryHstbenefMESCOMPREEM: TStringField;
    qryBenefFONTEPAGADORA: TFloatField;
    qryBenefIDPERFILINVEST: TFloatField;
    procedure ef(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryBenefDTINICIOLIBERACAOChange(Sender: TField);
  private
    { Private declarations }
     iIdLoteConcessao           : longint;
     sAnoMesInicio              : string;
     sAnoMesPagamento           : string;
     sSeqProposta               : string;
     sIdPessoa                  : string;
     sIdTitular                 : string;
     sIdPessJur                 : string;
     sIdPlanoPrev, sIdPlanoOrigem : string;
     sNumeroProcesso            : string;
     dtliberacaoGravar          : string;
     iFlgIncluiMesConc          : integer;
     sDataInicioliberacao       : string;  //Wylliam Silva Kintana: 1268806 SOL: 157203/4761
     sDataIniciolib       : string;
     bLiberaFuncef,testareVlrInss        : boolean;        // edilaine - SOL 253577-18143 / PPM 1318908    //SIG 126648 Ferrari
     bLiberaInss          : boolean;        // edilaine - SOL 253577-18143 / PPM 1318908

    sDataHoraInicioProcesso : string; //Helio - SOL Nº 253577/17514 PPM Nº 971383

    // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
    function AtualizarDataFinalTaxa(iIdPlanoprev,
                                    iIdPessjur,
                                    iIdBeneficio,
                                    iNumeroProcesso,
                                    iIdPessoa,
                                    iIdTitular,
                                    iSeqproposta   : integer;
                                    sNovaDataFinal : string) : boolean;
    // edilaine - SOL 253577-18143 / PPM 1318908 - fim

    procedure MostraDemonstrativoConcessao;

    procedure GeraDemonstrativo(sDataHoraInicioProcesso, sProcessos : string;  //Helio - SOL Nº 253577/17514 PPM Nº 971383 - fim
                                sStatusDemonstrativo : string = '' );          // edilaine - SOL 253577-18174 / PPM 1327585


    function  RecalculaBeneficiarios ( psDataIniRecalculo : string ) : boolean;
    function  ValorBeneficioNaData(iIdPessjur, iIdPlanoPrev, iIdTitular, iIdPessoa,
                                   iIdBeneficio : LongInt; sMesReferencia : String;
                                   sFlgCampoRetorno : String = 'I'): Double; // I - VALORINTEGRAL
                                                                             // T - VALORTOTAL

    function TotalBeneficiariosValidos( iIdPessjur,
                                         iIdPlanoPrev,
                                         iIdTitular,
                                         iIdPessoa: Integer;
                                         sNumeroProcesso  : String ): Integer;

    //edilaine SIG121019 : inicio
    procedure AjustaAbonoPago(_qry : TwwQuery;
                              sAnomes, sAnoMesLote : string;
                              dataPagto, sVlrBS, sVlrFAB, sVlrDeficit : string;
                              rVlrSRB : double;
                              var rVlrPago : double);

    procedure GravarHSTBENEFBFCIARIO(_Tipo,_idmotivo,_flgtiporegistro,
                                     _SEQbeneficio,_datapagamento,
                                     _mesreflote,_ValorAtual,_PercAtual,
                                     _DataInicio,_DataFinal,_idpessjur,
                                     _idtitular, _idpessoa, _seqproposta,
                                     _idplanoprev, _idbeneficio,_numeroprocesso,
                                     _FONTEPAGADORA,_valortotal,_IDPLANOORIGEM,
                                     _IDSITBENEFICIO,
                                     _valorIntegral,
                                     _valorBS, _valorFAB, _vlrBaseDeficit:string;
                                     _IdPerfilInvest : string;
                                     _valorSRB : double);

    procedure AjustaContribAbonoPago(_qry : TwwQuery; sAnoMes, dataPagto : string);
    //edilaine SIG121019 : fim



  public
    { Public declarations }
  end;

var
  frmCadInicioBenefExigencia: TfrmCadInicioBenefExigencia;
  StrMesAnoInicioLibera:      String;
  sFlgDataLimite:             Integer;
  sDataBenefLimite:           String;   //guarda a limite em que será pago o benefício
  sMesAnoMESCOMPREEM:         string;    // SIG 125597 Ferrari

implementation

uses
  UMensErro, DBaseDados, UDataBase, USistema, UAdmPrev, FSelecionaLote,
  UBeneficio, fAguarde, FMostraAux, UFuncoesUteis, UContribuicaoPrev,
  RDemonstraBeneficios,   // edilaine - SOL 253577-17570 / PPM 989569
  DAPrev, UParticipante, fTipoLiberacao;

{$R *.DFM}

procedure TfrmCadInicioBenefExigencia.ef(Sender: TObject);
Var
  sNumProc : String;
  iControls: Integer;
begin
  inherited;
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    sIdTitular      := MontaSelect.ValoresChave[1];
    sSeqProposta    := MontaSelect.ValoresChave[2];
    sIdPessJur      := MontaSelect.ValoresChave[3];
    sIdPlanoPrev    := MontaSelect.ValoresChave[4];
    sIdPlanoOrigem  := MontaSelect.ValoresChave[6];
    sIdPessoa       := MontaSelect.ValoresChave[7];

    qryTitular.Close;
    qryTitular.ParamByName('IdPessoa').Value    := StrToInt(sIdTitular);
    qryTitular.ParamByName('IdPessJur').Value   := StrToInt(sIdPessJur);
    qryTitular.ParamByName('IdPlanoPrev').Value := StrToInt(sIdPlanoOrigem);
    qryTitular.ParamByName('SeqProposta').Value := StrToInt(sSeqProposta);
    qryTitular.Open;
    qryBenef.Close;

    qryBenef.ParamByName('IDTITULAR').AsString      := sIdTitular;
    qryBenef.ParamByName('IDPESSJUR').AsString      := sIdPessJur;
    qryBenef.ParamByName('IDPLANOPREV').AsString    := sIdPlanoOrigem;
    qryBenef.ParamByName('IDBENEF').AsString        := sIdPessoa; // Thiago Melo SOL 212728 KTN 2038739
    qryBenef.Open;


    sNumeroProcesso := '';
    sNumProc        := '';
    qryBenef.First;
    While Not qryBenef.Eof Do
    Begin
      If sNumProc = qryBenef.FieldByName('NUMEROPROCESSO').AsString Then
      Begin
        qryBenef.Next;
        Continue
      End
      Else
        sNumProc := qryBenef.FieldByName('NUMEROPROCESSO').AsString;

      If Trim(sNumeroProcesso) <> '' Then
        sNumeroProcesso := sNumeroProcesso+', ';

      sNumeroProcesso:= sNumeroProcesso + QuotedStr(qryBenef.FieldByName('NUMEROPROCESSO').AsString);

      qryBenef.Next;
    End;


    With qryHstBenefAntesLiberar do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MESREFERENCIA, IDPESSOA, IDBENEFICIO, NUMEROPROCESSO,');
      SQL.Add('       SUM(DECODE(FLGDEVOLUCAO,1,-(NVL(VLBENEFPGTO,VALORPREV)),(NVL(VLBENEFPGTO,VALORPREV)) ) ) AS TOTALRETIDO');
      SQL.Add('FROM HSTBENEFBFCIARIO');
      SQL.Add('WHERE NUMEROPROCESSO IN ('+sNumeroProcesso+')');
      SQL.Add('  AND FLGENVIADO     = 9');
      SQL.Add('GROUP BY MESREFERENCIA, IDPESSOA, IDBENEFICIO, NUMEROPROCESSO');
      Open;
    End;

    TB97oKCancelar.Visible := True;

    //Wylliam Silva Kintana: 1268806 SOL: 157203/4761 - Inicio
    qryBenef.First;
    while not qryBenef.eof do
    begin
      with qryAux do
      Begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT MOV.DTINICIOLIBERACAO ');
        SQL.Add('   FROM MOVBENEF MOV ');
        SQL.Add('  WHERE MOV.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) ');
        SQL.Add('   FROM MOVBENEF mb ');
        SQL.Add('  WHERE mb.NUMEROPROCESSO = '+ qryBenef.FieldByName('NUMEROPROCESSO').AsString);
        SQL.Add('    AND mb.IDPLANOPREV    = '+ qryBenef.FieldByName('IDPLANOPREV').AsString);
        SQL.Add('    AND mb.IDTITULAR      = '+ qryBenef.FieldByName('IDTITULAR').AsString);
        SQL.Add('    AND mb.IDPESSJUR      = '+ qryBenef.FieldByName('IDPESSJUR').AsString);
        SQL.Add('    AND mb.IDBENEFICIO    = '+ qryBenef.FieldByName('IDBENEFICIO').AsString);
        SQL.Add('    AND mb.IDPESSOA       = '+ qryBenef.FieldByName('IDPESSOA').AsString);
        SQL.Add('    AND mb.SEQPROPOSTA    = '+ qryBenef.FieldByName('SEQPROPOSTA').AsString+' ) ');
        Open;
      End;
      qryBenef.edit;
      if qryAux.FieldByName('DTINICIOLIBERACAO').AsDateTime <> 0  then
      begin
        qryBenef.FieldByName('DTINICIOLIBERACAO').Value := qryAux.FieldByName('DTINICIOLIBERACAO').Value;
      end
      else
      begin
        qryBenef.FieldByName('DTINICIOLIBERACAO').Value := qryBenef.FieldByName('DTINICIOLIBERACAO').Value;
      end;
      qryBenef.post;
      qryBenef.Next;
    end;

    qryVirtual.close;
    qryVirtual.open;
    //Wylliam Silva Kintana: 1268806 SOL: 157203/4761 Fim

  end
  {SOL 157203/4761 - KTN 1268806 - JRM6}
  else
  begin
    dsTitular.DataSet.Close;
    wwDBGrid1.DataSource.DataSet.Close;
    TB97oKCancelar.Visible := False;
  end;
  {SOL 157203/4761 - KTN 1268806 - JRM6}
end;

procedure TfrmCadInicioBenefExigencia.bbtnConfirmarClick(Sender: TObject);
var sSQL, sSQL2              : string;
    dValorBeneficio          : double;
    dValorTotalBeneficio     : double;
    rValorAtualizado         : double;
    rValorSRB                : double;
    sMsgErro                 : string;
    sDatafinal1              : string;
    sUltMesReajuste          : string;
    bErro                    : boolean;
    bPreparaContrib13        : boolean;
    iTotBeneficiariosValidos : integer;
    iUltDiaMesLote           : integer;
    sAnoMesReferencia        : string;
    sAnoMesSalario           : string;
    sDataFinalSalario        : string;
    sSalarioIntegral         : string;
    sSalarioContribuicao,sTeste     : string;
//    sDataBenefLimite         : string;  //guarda a limite em que será pago o benefício
//    sFlgDataLimite           : Integer;
    iIdUsuarioAutoriza       : longint;
    sDataFinalAConsiderar    : string;
    bAtualizaDataFinal       : boolean;     
    sNumProc                 : String;
    v_dia,
    v_mes,
    v_ano                    : Word;
    bpassou                  : Boolean;

    sAnoMesFinal, sSitBeneficio : String;
    dtliberacao   : TDateTime;
    sNumProcSelecionados    : string; //Helio - SOL Nº 253577/17514 PPM Nº 971383
begin
  {SOL 157203/4761 - KTN 1268806 - JRM6}
  wwDBGrid1.DataSource.DataSet.First;
  if wwDBGrid1.DataSource.DataSet.IsEmpty then
    Exit;
  //  Antes de solicitar a data, vamos verificar se o dbgrid tem alguma linha
  //  selecionada para liberação de beneficio. Caso não tenha ticado  nenhuma
  //  linha, o procedimento não deve prosseguir.
  bPassou := False;

  bLiberaInss   := false;               // edilaine - SOL 253577-18143 / PPM  - inicio 1318908
  bLiberaFuncef := false;               // edilaine - SOL 253577-18143 / PPM  - inicio 1318908
  sDataHoraInicioProcesso := '';        // edilaine - SOL 253577-18143 / PPM  - inicio 1318908

  sNumProcSelecionados := '';   // edilaine - SOL 253577-18064 / PPM 1240079
  while not wwDBGrid1.DataSource.DataSet.Eof do
  begin
    if wwDBGrid1.DataSource.DataSet.FieldByName('FLGLIBERA').AsString = '1' then
    begin
      bPassou := True;
      // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
      sNumProcSelecionados := sNumProcSelecionados + iff( trim(sNumProcSelecionados) <> '', ', ', '') + wwDBGrid1.DataSource.DataSet.FieldByName('NUMEROPROCESSO').AsString;
      //Break;
      // edilaine - SOL 253577-18064 / PPM 1240079 - fim

      // edilaine - SOL 253577-18143 / PPM  - inicio 1318908
      if qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1 then
         bLiberaFuncef := true;
      if qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 2 then
         bLiberaInss   := true;
      // edilaine - SOL 253577-18143 / PPM 1318908 - fim

    end;
    wwDBGrid1.DataSource.DataSet.Next;
  end;

  // Testa bpassou para saber se deve continuar.
  if (not bPassou) then
  begin
     MsgDlg('Nenhum Benefício selecionado para efetuar a liberação. ','Erro',mtError,[mbOk, mbHelp],0);
    Exit;
  end;

  // edilaine - SOL 253577-18143 / PPM 1318908  comentado inicio
  // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
  {refaz o historico de percentual para que nos meses liberados calcule o percentual correto nas pensões caso
   tenha tido reversao ou desdobramentos no meio do mês}
  {if (qryBenef.FieldByName('IDTITULAR').AsInteger <> qryBenef.FieldByName('IDPESSOA').AsInteger) then
  begin
    if not (GravaHstPercGrupoHistorico(wwDBGrid1.DataSource.DataSet.FieldByName('IDTITULAR').AsInteger)) then
    begin
      MsgDlg('Erro na gravação do histórico do percentual por grupo.','Erro',mtError,[mbOK],0);
      Exit;
    end;
  end;   }
  // edilaine - SOL 253577-18064 / PPM 1240079 - fim
  // edilaine - SOL 253577-18143 / PPM 1318908 - comentado fim

  // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
  If not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;
  // edilaine - SOL 253577-18143 / PPM 1318908 - fim

  // Pede a data-inicio de liberação.
  try
    frmTipoLiberacao := TfrmTipoLiberacao.Create(Self);
    frmTipoLiberacao.LerDataInicioLimite(qryBenef.FieldByName('DATAINICIO').AsString);
    //frmTipoLiberacao.AjustaTela(sNumProcSelecionados);    // edilaine - SOL 253577-18064 / PPM 1240079
    frmTipoLiberacao.AjustaTela(sNumProcSelecionados, bLiberaFuncef, bLiberaInss);    // edilaine - SOL 253577-18143 / PPM 1318908
    frmTipoLiberacao.ShowModal;
    if frmTipoLiberacao.reVlrInss.Modified then
      testareVlrInss := True
    else
      testareVlrInss := False;
    if frmTipoLiberacao.ModalResult = mrOk then
    begin
      dtliberacaoGravar := frmTipoLiberacao.DataInicio;
      sDataBenefLimite  := frmTipoLiberacao.DataLimite;
      // aqui tratar a data - Ferrari SIG 125597
      sMesAnoMESCOMPREEM := frmTipoLiberacao.medtMesAno.Text;

      if Copy(Trim(sMesAnoMESCOMPREEM),1,1) = '/' then
        sMesAnoMESCOMPREEM := '';
         
      If Trim(sDataBenefLimite) <> '' Then
        sFlgDataLimite := 1;
    end
    else
    begin
      exit;
    end;
  finally
    frmTipoLiberacao.Release;
  end;

  // edilaine - SOL 253577-18143 / PPM 1318908 - inicio  {mudança no fluxo, pedir lote após a data}
  // Antes de pedir a data de liberação, pede o numero do lote.
  iIdLoteConcessao   := SelecionaLoteBeneficioAberto(sAnoMesPagamento, iFlgIncluiMesConc );
  if iIdLoteConcessao <= 0 then
  begin
    MsgDlg('Nenhum lote selecionado para efetuar a liberação. ','Erro',mtError,[mbOk, mbHelp],0);
    Exit;
  end;
  // edilaine - SOL 253577-18143 / PPM 1318908 - fim

  {SOL 157203/4761 - KTN 1268806 - JRM6}
  if(dtliberacaoGravar<>'')   then
  begin
        wwDBGrid1.DataSource.DataSet.First;
        while not wwDBGrid1.DataSource.DataSet.Eof do
        begin

          // Wylliam Silva Kintana: 1268806 SOL: 157203/4761 - Inicio
          if wwDBGrid1.DataSource.DataSet.FieldByName('FLGLIBERA').AsString = '1' then
          begin
            qryVirtual.Insert;
            qryVirtualNUMEROPROCESSO.AsString    := wwDBGrid1.DataSource.DataSet.FieldByName('NUMEROPROCESSO').AsString;
            qryVirtualIDPLANOPREV.AsString       := wwDBGrid1.DataSource.DataSet.FieldByName('IDPLANOPREV').AsString;
            qryVirtualIDTITULAR.AsString         := wwDBGrid1.DataSource.DataSet.FieldByName('IDTITULAR').AsString;
            qryVirtualIDPESSJUR.AsString         := wwDBGrid1.DataSource.DataSet.FieldByName('IDPESSJUR').AsString;
            qryVirtualIDBENEFICIO.AsString       := wwDBGrid1.DataSource.DataSet.FieldByName('IDBENEFICIO').AsString;
            qryVirtualIDPESSOA.AsString          := wwDBGrid1.DataSource.DataSet.FieldByName('IDPESSOA').AsString;
            qryVirtualSEQPROPOSTA.AsString       := wwDBGrid1.DataSource.DataSet.FieldByName('SEQPROPOSTA').AsString;
            qryVirtualDTINICIOLIBERACAO.AsString := dtliberacaoGravar;
            qryVirtual.post;
          end;
          wwDBGrid1.DataSource.DataSet.Next;
        end;
        //Wylliam Silva Kintana: 1268806 SOL: 157203/4761 - Fim

        {SOL 157203/4761 - KTN 1268806 - JRM6 }
        DecodeDate( StrToDate( dtliberacaoGravar ) , v_ano,  v_mes, v_dia );

        wwDBGrid1.DataSource.DataSet.First;

        while not wwDBGrid1.DataSource.DataSet.Eof do
        begin
          if wwDBGrid1.DataSource.DataSet.FieldByName('FLGLIBERA').AsString = '1' then
          begin
            if qryHstbenef.Active then
            begin
              qryHstbenef.close;
              qryHstbenef.UnPrepare;
            end;
            // Passa os parâmetros de busca para a query
            qryHstbenef.ParamByName('P_IDPLANOPREV').AsString     :=  wwDBGrid1.DataSource.DataSet.FieldByName('IDPLANOPREV').AsString;
            qryHstbenef.ParamByName('P_IDBENEFICIO').AsString     :=  wwDBGrid1.DataSource.DataSet.FieldByName('IDBENEFICIO').AsString;
            qryHstbenef.ParamByName('P_MES').AsString             :=  IntToStr(v_ano) + '/' + FormatFloat('00',v_mes);
            qryHstbenef.ParamByName('P_NUMEROPROCESSO').AsString  :=  wwDBGrid1.DataSource.DataSet.FieldByName('NUMEROPROCESSO').AsString;
            qryHstbenef.ParamByName('P_IDPESSJUR').AsString       :=  wwDBGrid1.DataSource.DataSet.FieldByName('IDPESSJUR').AsString;
            qryHstbenef.ParamByName('P_IDTITULAR').AsString       :=  wwDBGrid1.DataSource.DataSet.FieldByName('IDTITULAR').AsString;
            qryHstbenef.ParamByName('P_IDPESSOA').AsString        :=  wwDBGrid1.DataSource.DataSet.FieldByName('IDPESSOA').AsString;
            qryHstbenef.ParamByName('P_SEQPROPOSTA').AsString     :=  wwDBGrid1.DataSource.DataSet.FieldByName('SEQPROPOSTA').AsString;
            //
            //sAnoMesPagamento := Copy(qryVirtualDTINICIOLIBERACAO.AsString, 7, 4) + Copy(qryVirtualDTINICIOLIBERACAO.AsString, 3, 3);
            if sFlgDataLimite = 1 then
              sAnoMesPagamento := Copy(sDataBenefLimite, 7, 4) + Copy(sDataBenefLimite, 3, 3);
            //else
              //sAnoMesPagamento := Copy( DateToStr( Date ) ,7,4)+'/'+Copy( DateToStr( Date ) ,4,2);

            // Prepara e abre a query
            qryHstbenef.Prepare;
            qryHstbenef.Open;
            //  Elimina os registros de status 2 = retido (Caso o dataset não esteja vazio)
            if qryHstbenef.Active then
              if not qryHstbenef.IsEmpty then
              begin
                qryHstbenef.Delete;
              end;

            sDataFinalAConsiderar := '01/'+ FormatFloat('00',v_mes) + '/' + IntToStr(v_ano);
             sDataIniciolib :=   DateToStr(StrToDate(sDataFinalAConsiderar)+1);

            If not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;   //Wylliam Silva Kintana: 1268806 SOL: 157203/4761

            // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
            if sDataHoraInicioProcesso = '' then begin
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(' select to_char(sysdate,''dd/mm/yyyy hh24:mi'') AS datenow from dual ');
              qryAux.Open;
              sDataHoraInicioProcesso := qryAux.fieldByName('datenow').AsString;
            end;
            // edilaine - SOL 253577-18143 / PPM 1318908 - fim

            // Aqui vai ser chamado o recálculo
            if not RecalculaBeneficiarios(sDataFinalAConsiderar) then
            begin
              dtmBaseDados.dbBaseDados.RollBack;
              MsgDlg('Erro recalcular valores dos beneficiários do processo.','Erro',mtError,[mbOk,mbHelp],0);
              TiraSQL(qryAux);
              Exit;
            end;

          end;
          wwDBGrid1.DataSource.DataSet.Next;
        end;
             {SOL 157203/4761 - KTN 1268806 - JRM6}
  end;
  If sFlgDataLimite = 1 then
  If Trim(sDataBenefLimite) <> '' Then
    If Copy(sDataBenefLimite,7,4)+Copy(sDataBenefLimite,3,3) > sAnoMesPagamento Then
    Begin
      MsgDlg('A data de pagamento PARCIAL não pode ser superior à data do lote. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
      Exit;
    End;

  If not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;   //Wylliam Silva Kintana: 1268806 SOL: 157203/4761

  //Helio - SOL Nº 253577/17514 PPM Nº 971383 - inicio
  if sDataHoraInicioProcesso = '' then begin                 // edilaine - SOL 253577-18143 / PPM 1318908
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' select to_char(sysdate,''dd/mm/yyyy hh24:mi'') AS datenow from dual ');
    qryAux.Open;
    sDataHoraInicioProcesso := qryAux.fieldByName('datenow').AsString;
  end;                                                       // edilaine - SOL 253577-18143 / PPM 1318908
  //Helio - SOL Nº 253577/17514 PPM Nº 971383 - fim

  frmAguarde.Mostra('Atualizando processo ...');   // DOIS
  qryBenef.First;
  While not qryBenef.Eof do
  begin

    iIdCalculoGeral := 0;
    sSitBeneficio   := '1';

    if qryBenef.FieldByName('FlgLibera').AsInteger = 0 then
    begin
      qryBenef.Next;
      continue;
    end;

    If ( ( qryBenef.FieldByName('FLGREFERENCIA').AsInteger    = 1 ) And ( qryBenef.FieldByName('FLGPAGAINSSBENEF').AsInteger = 0 ) ) Then
    Begin
      sDataFinalAConsiderar := '01/' + Copy( sAnoMesPagamento, 6, 2) + '/' + Copy( sAnoMesPagamento, 1, 4);
      sDataIniciolib :=   DateToStr(StrToDate(sDataFinalAConsiderar)+1);
      bAtualizaDataFinal    := True;
    End
    Else
    Begin

// inicio - comentado por : Fernando Santana- SOL: 876768 KTN: 140245
//       if (qryBenef.FieldByName('DATAFINALPREVISTA').AsString = '') and
//          (qryBenef.FieldByName('DATAFINAL').AsString = '')
//       then begin
//          frmAguarde.Apaga;
//          dtmBaseDados.dbBaseDados.RollBack;
//          MsgDlg('O benefício '+qryBenef.FieldByName('NOMEBENEFICIO').AsString+' está '+
//                 UpperCase(qryBenef.FieldByName('SITUACAO').AsString)+' para o beneficiário '+
//                 qryBenef.FieldByName('NOME').AsString+' porém não possui NENHUMA data final '+
//                 ' indicada. '+#13+
//                 'Não é possível liberar benefício sem data final. Verifique.','Erro',mtError,[mbOK],0);
//          Exit;
//       end;
// Fim - comentado por : Fernando Santana- SOL: 876768 KTN: 140245

//   inicio - Fernando Santana- SOL: 876768 KTN: 140245
      if (qryBenef.FieldByName('DATAFINALPREVISTA').AsString = '') and
         (qryBenef.FieldByName('DATAFINAL').AsString = '') then
        sDataFinalAConsiderar := '01/' + Copy( sAnoMesPagamento, 6, 2) + '/' + Copy( sAnoMesPagamento, 1, 4)
      else
        sDataFinalAConsiderar := qryBenef.FieldByName('DATAFINALPREVISTA').AsString;

        //SIG124212 : inicio
        if sDataFinalAConsiderar <> '' then
           sDataIniciolib :=   DateToStr(StrToDate(sDataFinalAConsiderar)+1);
        //SIG124212 : fim


//   Fim - Fernando Santana- SOL: 876768 KTN: 140245

      if (qryBenef.FieldByName('DATAFINALPREVISTA').AsString = '') and
         (qryBenef.FieldByName('DATAFINAL').AsString <> '') then
      begin
         frmAguarde.Apaga;

        if MsgDlg('O benefício '+qryBenef.FieldByName('NOMEBENEFICIO').AsString+' está '+
           UpperCase(qryBenef.FieldByName('SITUACAO').AsString)+' para o beneficiário '+
           qryBenef.FieldByName('NOME').AsString+' porém não possui Data Final '+
           'PREVISTA.'+#13+
           'Deseja considerar a Data Final EFETIVA ('+qryBenef.FieldByName('DATAFINAL').AsString+') '+
           'para liberação do benefício ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
        begin
          dtmBaseDados.dbBaseDados.RollBack;
          Exit;
        end;

        sDataFinalAConsiderar := qryBenef.FieldByName('DATAFINAL').AsString;
         sDataIniciolib :=   DateToStr(StrToDate(sDataFinalAConsiderar)+1);
        bAtualizaDataFinal    := True;
      end;

      { Caso exista DATAFINAL considerar essa como }
      { data final do processo e excluir preparos após essa data               }
      if (qryBenef.FieldByName('DATAFINALPREVISTA').AsString <> '') and
         (qryBenef.FieldByName('DATAFINAL').AsString <> '') Then
      Begin
        bAtualizaDataFinal    := False;

        { Caso a DATAFINAL seja menor que a DATA DO LOTE então manter DATAFINAL }
        { e encerrar o beneficio                                                }
        If ( Copy( qryBenef.FieldByName('DATAFINAL').AsString, 7, 4 ) +
             Copy( qryBenef.FieldByName('DATAFINAL').AsString, 3, 3 ) <= sAnoMesPagamento ) Then
        Begin
          sSitBeneficio      := '3';
        End;
          if(dtliberacaoGravar='')   then
          begin
              sSQL := 'DELETE HSTBENEFBFCIARIO '+
                      ' WHERE IDPESSJUR      = '+qryBenef.FieldByName('IDPESSJUR').AsString+
                      '   AND IDPLANOPREV    = '+qryBenef.FieldByName('IDPLANOPREV').AsString+
                      '   AND IDTITULAR      = '+qryBenef.FieldByName('IDTITULAR').AsString+
                      '   AND SEQPROPOSTA    = '+qryBenef.FieldByName('SEQPROPOSTA').AsString+
                      '   AND NUMEROPROCESSO = '+qryBenef.FieldByName('NUMEROPROCESSO').AsString+
                      '   AND IDBENEFICIO    = '+qryBenef.FieldByName('IDBENEFICIO').AsString+
                      '   AND IDPESSOA       = '+qryBenef.FieldByName('IDPESSOA').AsString+
                      '   AND FLGENVIADO     = 0 '+
                      '   AND IDLOTE IS NULL '+
                      '   AND MESREFERENCIA >= '''+Copy(sDataFinalAConsiderar,7,4)+Copy(sDataFinalAConsiderar,3,3)+'''';

              ExecutarQuery( QryAux, sSQL );
          end;
      End;
    End;
    if(dtliberacaoGravar='')   then
    begin
         {SOL 157203/4761 - KTN 1268806 - JRM6}
         sSQL := ' UPDATE HSTBENEFBFCIARIO                          '+
           ' SET    FLGENVIADO     = 0,                       '+
           '        IDLOTE = '+IntToStr(iIdLoteConcessao)+',  '+
           '        FLGCONCESSAO   = 1,                       '+
           '        MES            = '''+sAnoMesPagamento+''' '+
           ' WHERE  IDPESSJUR      = '+qryBenef.FieldByName('IDPESSJUR').AsString+
           ' AND    IDPLANOPREV    = '+qryBenef.FieldByName('IDPLANOPREV').AsString+
           ' AND    IDTITULAR      = '+qryBenef.FieldByName('IDTITULAR').AsString+
           ' AND    SEQPROPOSTA    = '+qryBenef.FieldByName('SEQPROPOSTA').AsString+
           ' AND    NUMEROPROCESSO = '+qryBenef.FieldByName('NUMEROPROCESSO').AsString+
           ' AND    IDBENEFICIO    = '+qryBenef.FieldByName('IDBENEFICIO').AsString+
           ' AND    IDPESSOA       = '+qryBenef.FieldByName('IDPESSOA').AsString+
           ' AND    FLGTIPOREGISTRO   <> 2                    '+ //SOL 123670 - Ádler Souza
           //' AND    FLGENVIADO     = 9                      '+  // SOL: 169562 KTN: 1507494
            ' AND    FLGENVIADO     in (8, 9)                  '+  // SOL: 169562 KTN: 1507494  passou a considerar tambem a opção fora do convenio FLGENVIADO = 8
            ' AND    IDLOTE IS NULL                            ';

           If trim(sDataBenefLimite) <> '' Then
              sSQL := sSQL + ' AND MESREFERENCIA <= '''+Copy(sDataBenefLimite,7,4)+Copy(sDataBenefLimite,3,3)+'''';

       qryAux.Close;
       qryAux.SQl.Clear;
       qryAux.SQL.Add(sSQL);
       try
         qryAux.ExecSQL;
       except
         on E:EDBEngineError do
         begin
           TratarErro(e.Message); //Brunno Mattos - KTN 767861 - SOL 132659
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MostrarErro(E);
           Exit;
         end;
        end;
    end;
    {SOL 157203/4761 - KTN 1268806 - JRM6}

    sSQL := ' UPDATE HSTCONTRIBPREV '+
            '    SET IDLOTE = '+IntToStr(iIdLoteConcessao)+','+
            '        FLGCONCESSAO = 1, '+
            '        MESCOBRANCA    = '''+sAnoMesPagamento+''''+
            '  WHERE IDPESSJUR      = '+qryBenef.FieldByName('IDPESSJUR').AsString+
            '    AND IDPLANOPREV    = '+qryBenef.FieldByName('IDPLANOPREV').AsString+
            '    AND IDPESSOA       = '+qryBenef.FieldByName('IDTITULAR').AsString+
            '    AND SEQPROPOSTA    = '+qryBenef.FieldByName('SEQPROPOSTA').AsString+
            '    AND IDLOTE         IS NULL '+
            '    AND FLGSITFUNDACAO = ''AS'' '+
            '    AND SITRECEBIMENTO = 0 ' +
            '    AND MESREFERENCIA  >= ' + QuotedStr( sAnoMesInicio );

    If trim(sDataBenefLimite) <> '' Then
      sSQL := sSQL + ' AND MESREFERENCIA <= '''+Copy(sDataBenefLimite,7,4)+Copy(sDataBenefLimite,3,3)+'''';

    qryAux.Close;
    qryAux.SQl.Clear;
    qryAux.SQL.Add(sSQL);
    try
      qryAux.ExecSQL;
    except
      on E:EDBEngineError do
      begin
         frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
           MostrarErro(E);
        Exit;
      end;
    end;

    { Tratamento para atualizar a DATAFINALPREVISTA }
    { quando for liberação parcial.                                             }
    If Trim (sDataBenefLimite) = '' Then
    Begin

      sSQL := ' UPDATE BENEFBFCIARIO SET '+
              '        IDSITBENEFICIO    = '+ sSitBeneficio +', '+
              '        DATAFINALPREVISTA = NULL, '+
              '        FLGDATAPREVISTA   = 0 ';
    End
    Else
    Begin
      sSQL := ' UPDATE BENEFBFCIARIO SET         '+
              '        DATAFINALPREVISTA = TO_DATE('''+ sDataBenefLimite +''',''DD/MM/YYYY''), '+
              '        FLGDATAPREVISTA   = 1     ';

    End;
    { Voltar FLGPAGAINSS para 1 }
    If (QryBenef.FieldByName('FLGREFERENCIA').AsString = '1') And
       (QryBenef.FieldByName('FLGPAGAINSS').AsString = '1') Then
    Begin
      sSQL := sSQL +', FLGPAGAINSS = 1 ';
    End;

    //CPrev - 28044 - Inicio
    //If bAtualizaDataFinal Then
    //    sSQL := sSQL +', DATAFINAL = NULL ';
    //CPrev - 28044 - Fim

    { Em caso de liberação de Pensão, voltar a          }
    { DATAFINAL do beneficio que foi armazenada na MOVBENEF no momento da retenção. }
    If ( ( qryBenef.FieldByName('IDTITULAR').AsInteger <> qryBenef.FieldByName('IDPESSOA').AsInteger ) And
        ( sDataBenefLimite = '' ) ) Then
    Begin
      sSQL2 := 'SELECT '+
              '  MOV.DATAFINALANT '+
              'FROM   '+
              '  MOVBENEF MOV     '+
              'WHERE          '+
              '  MOV.IDMOVBENEF = (SELECT MAX(IDMOVBENEF) '+
              '                    FROM   MOVBENEF '+
              '                    WHERE  IDPESSJUR       = '+qryBenef.FieldByName('IDPESSJUR').AsString     +
              '                      AND  IDPLANOPREV     = '+qryBenef.FieldByName('IDPLANOPREV').AsString   +
              '                      AND  IDTITULAR       = '+qryBenef.FieldByName('IDTITULAR').AsString     +
              '                      AND  SEQPROPOSTA     = '+qryBenef.FieldByName('SEQPROPOSTA').AsString   +
              '                      AND  IDPESSOA        = '+qryBenef.FieldByName('IDPESSOA').AsString      +
              '                      AND  IDBENEFICIO     = '+qryBenef.FieldByName('IDBENEFICIO').AsString   +
              '                      AND  NUMEROPROCESSO  = '+qryBenef.FieldByName('NUMEROPROCESSO').AsString+
              '                      AND  TIPOMOV        IN (3,4)) ';


      If ( FazQuery( QryAux, sSQL2 ) ) Then
      Begin
        //Marcio Sanches Spinosa SOL: 243277 KTN: 583213 - Inicio
        if (QryAux.FieldByName('DATAFINALANT').AsString <> '')
        and (qryBenef.FieldByName('DATAFINAL').AsString < FormatDateTime('DD/MM/YYYY', Now)) then
        //Marcio Sanches Spinosa SOL: 243277 KTN: 583213 - Fim
        sSQL := sSQL +', DATAFINAL = TO_DATE('''+ QryAux.FieldByName('DATAFINALANT').AsString +''',''DD/MM/YYYY'') ';
      End;
    End
    Else
    Begin
      If bAtualizaDataFinal Then
        sSQL := sSQL +', DATAFINAL = NULL ';  //CPrev - 28044
    End;

    sSQL := sSQL +' WHERE  IDPLANOPREV       = '+qryBenef.FieldByName('IDPLANOPREV').AsString+
                  ' AND    IDPESSJUR         = '+qryBenef.FieldByName('IDPESSJUR').AsString+
                  ' AND    IDTITULAR         = '+qryBenef.FieldByName('IDTITULAR').AsString+
                  ' AND    IDBENEFICIO       = '+qryBenef.FieldByName('IDBENEFICIO').AsString+
                  ' AND    NUMEROPROCESSO    = '+qryBenef.FieldByName('NUMEROPROCESSO').AsString+
                  ' AND    IDPESSOA          = '+qryBenef.FieldByName('IDPESSOA').AsString+
                  ' AND    SEQPROPOSTA       = '+qryBenef.FieldByName('SEQPROPOSTA').AsString+
                  ' AND  ( ( IDSITBENEFICIO IN (2,7) ) OR ( (IDSITBENEFICIO = 1) AND (FLGPAGAINSS = 0) ) ) ';

    qryAux.Close;
    qryAux.SQl.Clear;
    qryAux.SQL.Add(sSQL);
    try
      qryAux.ExecSQL;
    except
      on E:EDBEngineError do
      begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        MostrarErro(E);
        Exit;
      end;
    end;

    // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
    if not AtualizarDataFinalTaxa(qryBenef.FieldByName('IDPLANOPREV').AsInteger,
                                  qryBenef.FieldByName('IDPESSJUR').AsInteger,
                                  qryBenef.FieldByName('IDBENEFICIO').AsInteger,
                                  qryBenef.FieldByName('NUMEROPROCESSO').AsInteger,
                                  qryBenef.FieldByName('IDPESSOA').AsInteger,
                                  qryBenef.FieldByName('IDTITULAR').AsInteger,
                                  qryBenef.FieldByName('SEQPROPOSTA').AsInteger,
                                  '') then
    begin
      frmAguarde.Apaga;
      MsgDlg('Erro na atualização da data final de dcontribuições.','Erro',mtError,[mbOk,mbHelp],0);
      dtmBaseDados.dbBaseDados.RollBack;
      Exit;
    end;
    // edilaine - SOL 253577-18143 / PPM 1318908 - fim


    {SOL 157203/4761 - KTN 1268806 - JRM6}
    if(dtliberacaoGravar = '')then
    begin
      // TESTAR PARAMETRO QUE INDICA SE O BENEFICIO DEVE SER RECALCULADO
     // Se o parametro de recalcular beneficiarios (prmFlgLibRecalcBen) estiver
     // marcado, então não recalcular agora e deixar para recalcular após o loop
     if prmFlgLibRecalc and
        ( (qryBenef.FieldByName('IDTITULAR').AsInteger = qryBenef.FieldByName('IDPESSOA').AsInteger)  or
          (not prmFlgLibRecalcBen)
        )
     then begin
        rValorAtualizado  := qryBenef.FieldByName('ValorAtual').AsFloat;
        rValorSRB         := qryBenef.FieldByName('VALORSRB').AsFloat;
        sUltMesReajuste   := qryBenef.FieldByName('ULTMESREAJUSTE').AsString;
        bPreparaContrib13 := False;
        sMsgErro          := '';

        sAnoMesSalario    := sDataFinalAConsiderar;
        sAnoMesSalario    := Copy(sAnoMesSalario,7,4)+'/'+Copy(sAnoMesSalario,4,2);

        if sDataFinalAConsiderar <> '' then //   inicio Fernando Santana- SOL: 876768 KTN: 140245
        begin
          sAnoMesReferencia    := DateToStr(StrToDate(sDataFinalAConsiderar)+1);
          sAnoMesReferencia    := Copy(sAnoMesReferencia,7,4)+'/'+Copy(sAnoMesReferencia,4,2);
        end;

        dValorBeneficio := ValorBeneficioNaData(qryBenef.FieldByName('IDPESSJUR').AsInteger,
                                                qryBenef.FieldByName('IDPLANOPREV').AsInteger,
                                                qryBenef.FieldByName('IDTITULAR').AsInteger,
                                                qryBenef.FieldByName('IDPESSOA').AsInteger,
                                                qryBenef.FieldByName('IDBENEFICIO').AsInteger,
                                                sAnoMesSalario,
                                                'I');

        dValorTotalBeneficio := ValorBeneficioNaData(qryBenef.FieldByName('IDPESSJUR').AsInteger,
                                  qryBenef.FieldByName('IDPLANOPREV').AsInteger,
                                  qryBenef.FieldByName('IDTITULAR').AsInteger,
                                  qryBenef.FieldByName('IDPESSOA').AsInteger,
                                  qryBenef.FieldByName('IDBENEFICIO').AsInteger,
                                  sAnoMesSalario,
                                  'T');

        { Busca total de beneficiários validos }
        iTotBeneficiariosValidos := TotalBeneficiariosValidos(qryBenef.FieldByName('IDPESSJUR').AsInteger,
                                                              qryBenef.FieldByName('IDPLANOPREV').AsInteger,
                                                              qryBenef.FieldByName('IDTITULAR').AsInteger,
                                                              qryBenef.FieldByName('IDPESSOA').AsInteger,
                                                              qryBenef.FieldByName('NUMEROPROCESSO').AsString);

        frmAguarde.Mostra('Verificando acertos ...');

        sDatafinal1 := qryBenef.FieldByName('DATAFINAL').AsString;
        if Copy(sDatafinal1,7,4)+Copy(sDatafinal1,3,3)  < sAnoMesPagamento
        Then begin
          if  (qryBenef.FieldByName('DATAFINAL').Asstring <> '') and
              ((sDataBenefLimite = '') or (StrToDate(sDataBenefLimite) >qryBenef.FieldByName('DATAFINAL').AsDateTime ))
          then sDataBenefLimite :=  DateToStr(qryBenef.FieldByName('DATAFINAL').AsDateTime);
        end;


        if not PreparaBeneficioConcedido(qryAux,
                                         qryBenef.FieldByName('IDTITULAR').AsInteger,
                                         qryBenef.FieldByName('IDPESSOA').AsInteger,// piIdBeneficiario,
                                         qryBenef.FieldByName('SEQPROPOSTA').AsInteger,// piSeqProposta,
                                         qryBenef.FieldByName('IDPESSJUR').AsInteger,
                                         qryBenef.FieldByName('IDPLANOPREV').AsInteger,
                                         qryBenef.FieldByName('NUMEROPROCESSO').AsInteger,
                                         qryBenef.FieldByName('IDBENEFICIO').AsInteger,
                                         3128,   {prmIDMOTIVOFOLHABEN,}    //edilaine SIG124906
                                         iTotBeneficiariosValidos,

                                         qryBenef.FieldByName('IDREGRACALCULO').AsInteger,
                                         -1, // IDREGRAREAJBENEF
                                         qryBenef.FieldByName('IDREGRAPRIMPAGTO').AsInteger,
                                         qryBenef.FieldByName('IDREGRAULTPAGTO').AsInteger,
                                         qryBenef.FieldByName('IDTPPAGTOBENEFIC').AsInteger,
                                         qryBenef.FieldByName('CODPORTFORMA').AsInteger,
                                         qryBenef.FieldByName('NOMEBENEFICIO').AsString,
                                         qryTitular.FieldbyName('NOMEPATRO').AsString,
                                         qryTitular.FieldbyName('NOMEPLANO').AsString,
                                         qryTitular.FieldbyName('MATRICULA').AsString,
                                         //DateToStr(StrToDate(sDataFinalAConsiderar)), // SOL: 140428/2281 KTN: 906763
                                         DateToStr(StrToDate(sDataFinalAConsiderar)+1), // Renato Visoni SOL 152046 Kintana 1126735
                                         sDataBenefLimite,
                                         qryBenef.FieldByName('FLGCALCTODOMES').AsString,
                                         dValorBeneficio,
                                         qryBenef.FieldByName('VALORCOTAS').AsFloat,
                                         dValorTotalBeneficio,
                                         True,
                                         rValorAtualizado,
                                         rValorAtualizado,
                                         sUltMesReajuste,
                                         bErro,
                                         bPreparaContrib13,
                                         sMsgErro,
                                         iIdLoteConcessao,
                                         qryBenef.FieldByName('DATAINICIOFUND').AsString,
                                         12, // TIPOMOV
                                         0,
                                         rValorSRB,
                                         iIdCalculoGeral,
                                         false, True,                                        //edilaine - SIG55933
                                         qryBenef.FieldByName('IDPERFILINVEST').AsInteger    //edilaine - SIG55933
                                         )

        then begin
           frmAguarde.Apaga;
           MsgDlg('Erro ao preparar benefício : '+sMsgErro,'Erro', mtError,[mbOk, mbHelp],0);
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        end;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE BENEFBFCIARIO B');
        qryAux.SQL.Add('   SET B.ULTMESPREPARO = (SELECT MAX(H.MESREFERENCIA)');
        qryAux.SQL.Add('                          FROM HSTBENEFBFCIARIO H');
        qryAux.SQL.Add('                          WHERE H.IDPESSJUR      = B.IDPESSJUR');
        qryAux.SQL.Add('                            AND H.IDTITULAR      = B.IDTITULAR');
        qryAux.SQL.Add('                            AND H.IDPLANOPREV    = B.IDPLANOPREV');
        qryAux.SQL.Add('                            AND H.IDBENEFICIO    = B.IDBENEFICIO');
        qryAux.SQL.Add('                            AND H.NUMEROPROCESSO = B.NUMEROPROCESSO');
        qryAux.SQL.Add('                            AND H.IDPESSOA       = B.IDPESSOA');
        qryAux.SQL.Add('                            AND H.VLBENEFPGTO    IS NULL ');
        qryAux.SQL.Add('                            AND SUBSTR(MESREFERENCIA,6,2) <> ''13'') ');
        qryAux.SQL.Add('WHERE (B.IDPLANOPREV    = '+qryBenef.FieldByName('IDPLANOPREV').AsString+')');
        qryAux.SQL.Add('  AND (B.IDPESSJUR      = '+qryBenef.FieldByName('IDPESSJUR').AsString+')');
        qryAux.SQL.Add('  AND (B.IDTITULAR      = '+qryBenef.FieldByName('IDTITULAR').AsString+')');
        qryAux.SQL.Add('  AND (B.NUMEROPROCESSO = '+qryBenef.FieldByName('NUMEROPROCESSO').AsString+')');
        qryAux.SQL.Add('  AND (B.IDBENEFICIO    = '+qryBenef.FieldByName('IDBENEFICIO').AsString+')');
        qryAux.SQL.Add('  AND (B.IDPESSOA       = '+qryBenef.FieldByName('IDPESSOA').AsString+')');
        qryAux.SQL.Add('  AND (B.SEQPROPOSTA    = '+qryBenef.FieldByName('SEQPROPOSTA').AsString+')');

        Try
          qryAux.ExecSQL
        Except
           frmAguarde.Apaga;
           MsgDlg('Erro ao atualizar ultimo mês preparado.','Erro', mtError,[mbOk, mbHelp],0);
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        End;

        iIdUsuarioAutoriza := VerificaVALORLimiteBeneficio ( qryAux,
                                                             frmCadInicioBenefExigencia.Caption,
                                                             qryBenef.FieldByName('NumeroProcesso').AsInteger,
                                                             qryBenef.FieldByName('IdPessJur').AsInteger,
                                                             qryBenef.FieldByName('IdPlanoPrev').AsInteger,
                                                             qryBenef.FieldByName('IdTitular').AsInteger,
                                                             qryBenef.FieldByName('IdPessoa').AsInteger,
                                                             qryBenef.FieldByName('IdBeneficio').AsInteger,
                                                             rValorAtualizado,
                                                             True); // Requerimento = False, Outras = True
        if iIdUsuarioAutoriza < 0
        then begin
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Liberação não permitida por exceder valor limite e não ter autorização. Verifique. ','Erro',mtError,[mbOk],0);
           Exit;
        end;

        iIdUsuarioAutoriza := VerificaPERCLimiteBeneficio  ( qryAux,
                                                             frmCadInicioBenefExigencia.Caption,
                                                             qryBenef.FieldByName('NumeroProcesso').AsInteger,
                                                             qryBenef.FieldByName('IdPessJur').AsInteger,
                                                             qryBenef.FieldByName('IdPlanoPrev').AsInteger,
                                                             qryBenef.FieldByName('IdTitular').AsInteger,
                                                             qryBenef.FieldByName('IdPessoa').AsInteger,
                                                             qryBenef.FieldByName('IdBeneficio').AsInteger,
                                                             qryBenef.FieldByName('VALORATUAL').AsFloat,
                                                             rValorAtualizado,
                                                             True); // Requerimento = False, Outras = True
        if iIdUsuarioAutoriza < 0
        then begin
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Liberação não permitida por exceder percentual limite e não ter autorização. Verifique. ','Erro',mtError,[mbOk],0);
           Exit;
        end;
     end; // if prmFlgLibRecalc
    end;

    //William Moreira da Silva SOL: 239684 KTN: 521320
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE BENEFBFCIARIO B');
        qryAux.SQL.Add('   SET B.ULTMESPREPARO = (SELECT MAX(H.MESREFERENCIA)');
        qryAux.SQL.Add('                          FROM HSTBENEFBFCIARIO H');
        qryAux.SQL.Add('                          WHERE H.IDPESSJUR      = B.IDPESSJUR');
        qryAux.SQL.Add('                            AND H.IDTITULAR      = B.IDTITULAR');
        qryAux.SQL.Add('                            AND H.IDPLANOPREV    = B.IDPLANOPREV');
        qryAux.SQL.Add('                            AND H.IDBENEFICIO    = B.IDBENEFICIO');
        qryAux.SQL.Add('                            AND H.NUMEROPROCESSO = B.NUMEROPROCESSO');
        qryAux.SQL.Add('                            AND H.IDPESSOA       = B.IDPESSOA');
        qryAux.SQL.Add('                            AND H.VLBENEFPGTO    IS NULL ');
        qryAux.SQL.Add('                            AND SUBSTR(MESREFERENCIA,6,2) <> ''13'') ');
        qryAux.SQL.Add('WHERE (B.IDPLANOPREV    = '+qryBenef.FieldByName('IDPLANOPREV').AsString+')');
        qryAux.SQL.Add('  AND (B.IDPESSJUR      = '+qryBenef.FieldByName('IDPESSJUR').AsString+')');
        qryAux.SQL.Add('  AND (B.IDTITULAR      = '+qryBenef.FieldByName('IDTITULAR').AsString+')');
        qryAux.SQL.Add('  AND (B.NUMEROPROCESSO = '+qryBenef.FieldByName('NUMEROPROCESSO').AsString+')');
        qryAux.SQL.Add('  AND (B.IDBENEFICIO    = '+qryBenef.FieldByName('IDBENEFICIO').AsString+')');
        qryAux.SQL.Add('  AND (B.IDPESSOA       = '+qryBenef.FieldByName('IDPESSOA').AsString+')');
        qryAux.SQL.Add('  AND (B.SEQPROPOSTA    = '+qryBenef.FieldByName('SEQPROPOSTA').AsString+')');

        Try
          qryAux.ExecSQL
        Except
           frmAguarde.Apaga;
           MsgDlg('Erro ao atualizar ultimo mês preparado.','Erro', mtError,[mbOk, mbHelp],0);
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        End;
        //William Moreira da Silva SOL: 239684 KTN: 521320

     (**)
    {SOL 157203/4761 - KTN 1268806 - JRM6}
    CriaLogOcorrencia(qryBenef.FieldByName('IdPlanoPrev').AsString,
                      qryBenef.FieldByName('IdPessJur').AsString,
                      qryBenef.FieldByName('IdTitular').AsString,
                      qryBenef.FieldByName('IdBeneficio').AsString,
                      qryBenef.FieldByName('NumeroProcesso').AsString,
                      qryBenef.FieldByName('IdPessoa').AsString,
                      qryBenef.FieldByName('SeqProposta').AsString,
                      '12',
                      DateToStr(date),
                      qryBenef.FieldByName('ValorAtual').AsString,
                      qryBenef.FieldByName('ValorTotal').AsString,
                      qryBenef.FieldByName('ValorCotas').AsString,
                      qryBenef.FieldByName('DataInicio').AsString,
                      '',
                      qryBenef.FieldByName('ValorAtual').AsString,
                      qryBenef.FieldByName('DataInicio').AsString,
                      qryBenef.FieldByName('DataFinalAnt').AsString,
                      qryBenef.FieldByName('IDSITBENEFICIO').AsString,
                      qryBenef.FieldByName('FlgDataPrevista').AsInteger,
                      qryAux,
                      '',
                      iIdLoteConcessao,
                      iIdCalculoGeral,
                      False,
                      iIdUsuarioAutoriza);


    frmAguarde.Apaga;
    qryBenef.Next;
  end;

  // Como agora se verifica vários processos dentro de uma mesma liberação,
  // este procedimento abaixo agora passa a ser realizado por processo/evento.
  // Também se verifica, em caso de contribuição, se é necessário o recálculo
  // para casos de benefícios de referência.
  qryBenef.First;
  sNumProc := '';
  While Not qryBenef.Eof do
  Begin
    if qryBenef.FieldByName('FlgLibera').AsInteger = 0 then
    begin
      qryBenef.Next;
      continue;
    end;

    //Helio - SOL Nº 253577/17514 PPM Nº 971383 - inicio
    if (sNumProc <> qryBenef.FieldByName('NUMEROPROCESSO').AsString) Then
       sNumProcSelecionados := sNumProcSelecionados + iff( trim(sNumProcSelecionados) <> '', ', ', '') + qryBenef.FieldByName('NUMEROPROCESSO').AsString;
    //Helio - SOL Nº 253577/17514 PPM Nº 971383 - fim

    If (qryBenef.FieldByName('FLGREFERENCIA').AsInteger = 1) Or
       (sNumProc = qryBenef.FieldByName('NUMEROPROCESSO').AsString) Then
    Begin
      qryBenef.Next;
      Continue;
    End
    Else
      sNumProc := qryBenef.FieldByName('NUMEROPROCESSO').AsString;

    // TESTAR PARAMETRO QUE INDICA SE O BENEFICIO DEVE SER RECALCULADO
    // Se o parametro de recalcular beneficiarios (prmFlgLibRecalcBen) estiver
    // marcado, então não recalcular agora e deixar para recalcular após o loop
    if (prmFlgLibRecalc) and ((qryBenef.FieldByName('IDTITULAR').AsInteger = qryBenef.FieldByName('IDPESSOA').AsInteger) ) then
    begin
      // ************************************************************************
      // GERAR SALARIOS VIRTUAIS RETROATIVOS
      // ************************************************************************
      if (qryBenef.FieldbyName('FLGBENEFTEMP').AsInteger = 1) and (qryBenef.FieldbyName('FLGSALVIRTBENEF').AsInteger    = 1) then
      begin
        frmAguarde.Mostra('Verificando Salários Virtuais ...');
        Application.ProcessMessages;
        iUltDiaMesLote    := TrazUltDiaMes(StrToInt(Copy(sAnoMesPagamento,6,2)), StrToInt(Copy(sAnoMesPagamento,1,4)));
        sDataFinalSalario := IntToStr(iUltDiaMesLote)+'/'+Copy(sAnoMesPagamento,6,2)+'/'+Copy(sAnoMesPagamento,1,4);
        sSalarioIntegral  := BuscaSalarioPESSOAINTEGRAL ( dtmAPrev.qry,
                                                          StrToInt(sIdPessJur),
                                                          StrToInt(sIdPlanoPrev),
                                                          qryBenef.FieldByName('IdPessoa').AsInteger,
                                                          StrToInt(sSeqProposta),
                                                          'AS', sAnoMesPagamento);

        if not GeraSalarioRetroativo( StrToInt(sIdPessJur),
                                      StrToInt(sIdPlanoPrev),
                                      qryBenef.FieldByName('IdPessoa').AsInteger,
                                      'AS',
                                      DateToStr(StrToDate(sDataFinalAConsiderar)+1),
                                      sDataFinalSalario,
                                      sSalarioIntegral,
                                      sSalarioIntegral,
                                      sSalarioIntegral,
                                      qryAux, sMsgErro,
                                      qryBenef.FieldByName('FLGINTERNO').AsString, True) then
        begin
          frmAguarde.Apaga;
          dtmBaseDados.dbBaseDados.RollBack;
          MsgDlg(' Ocorreram problemas na Geração dos Salários no Histórico.'+#13+
                   '[Erro : '+sMsgErro+']. Verifique.','Erro', mtError, [mbOk],0);
          Exit;
        end;
        sSalarioContribuicao := sSalarioIntegral
      end
      else
        sSalarioContribuicao := qryBenef.FieldByName('VALORTOTAL').AsString;

      // Só realiza a verificação/preparo se o processo não for de
      // benefício de referência
      If qryBenef.FieldByName('FLGREFERENCIA').AsInteger = 0 Then
      Begin
        frmAguarde.Mostra('Verificando Contribuições ...');
        Application.ProcessMessages;
        // Cobrar contribuicoes posteriores a data de inicio
        // Dentro da rotina de preparo, se já houver linha no histórico, a rotina irá inserir apenas a diferença
        sSQL := ' SELECT CPP.IDCONTRIBUICAO, CPP.SEQPROPOSTA,  CPP.IDCONTRIBUICAO, CPP.IDPESSOA,   '+
                '        CPP.CODPORTFORMA,   CPP.FLGDESCFOLHA, CPP.VALORBASE1,     CPP.VALORBASE2, '+
                '        CPP.VALORBASE3,     CPP.DATAINICIO,   CPP.DATAFINAL,      C.NOME,        '+
                '        PP.INSCRICAODATA,   PF.DATANASC,      CP.ORDEMCALCULO                   '+
                ' FROM   CONTRIBUICAO C, EVENTOGERADOR EG, CONTPREV CP,  CONTPREVEVENTO CE, PARTPREVPLAN PP,     '+
                '        CONTRIBPREVPARTP CPP,   PESSOAFISICA PF                               '+
                ' WHERE CPP.IDPESSJUR      = '+ sIdPessJur    +
                ' AND   CPP.IDPLANOPREV    = '+ sIdPlanoPrev  +
                ' AND   CPP.IDPESSOA       = '+ sIdTitular    +
                ' AND   CPP.SEQPROPOSTA    = '+ sSeqProposta +
                ' AND   CPP.DATAINICIO     >= TO_DATE('''+qryBenef.FieldByName('DATAINICIOFUND').AsString+''',''dd/mm/yyyy'') '+
                ' AND   ((CPP.DATAFINAL      = TO_DATE('''+qryBenef.FieldByName('DATAFINALANT').AsString+''',''DD/MM/YYYY'')) OR (CPP.DATAFINAL IS NULL))  '+
                ' AND   CE.IDPLANOPREV     = CPP.IDPLANOPREV           '+
                ' AND   CE.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO         '+
                ' AND   CE.IDEVENTOGERADOR = EG.IDEVENTOGERADOR        '+
                ' AND   EG.IDEVENTOGERADOR = '+qryBenef.FieldByName('IDEVENTOGERADOR').AsString+
                ' AND   CPP.IDCONTRIBUICAO = C.IDCONTRIBUICAO          '+
                ' AND   PP.IDPESSJUR       = CPP.IDPESSJUR             '+
                ' AND   PP.IDPLANOPREV     = CPP.IDPLANOPREV           '+
                ' AND   PP.IDPESSOA        = CPP.IDPESSOA              '+
                ' AND   PP.SEQPROPOSTA     = CPP.SEQPROPOSTA           '+
                ' AND   PF.IDPESSOA        = CPP.IDPESSOA              '+
                ' AND   CP.IDPLANOPREV     = CPP.IDPLANOPREV           '+
                ' AND   CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO        '+
                ' ORDER BY CP.ORDEMCALCULO ' ;

        //Inicio - Helio - SOL Nº 253577/17514 PPM Nº 971383
        {if qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1 then
           bErro := ExecutaSP_PreparoContribuicao(qrybenef.fieldbyname('NUMEROPROCESSO').AsInteger,
                                                  qryBenef.fieldByName('IDTITULAR').AsInteger,
                                                  prmIDMOTIVOFOLHABEN,
                                                  iIdLoteConcessao,
                                                  'Não',
                                                  sAnoMesPagamento,
                                                  ''
                                                  );}



        {bErro := PreparaContribuicaoASSISTIDO( StrToInt(sIdPessJur),
                                              StrToInt(sIdPlanoPrev),
                                              prmIDMOTIVOFOLHABEN,
                                              0,
                                              qryContrib, qryAux, sSQL,
                                              '', // sSQLRegra,
                                              '', // sWhereSQLRegra,
                                              '', // sAliasSQLRegra,
                                              'AS',
                                              'Contribuição de Assistido - Matrícula: ' + qryTitular.FieldByName('MATRICULA').AsString+' - Processo n°: ' + qryBenef.FieldByName('NUMEROPROCESSO').AsString,
                                              'R','1',
                                              False,  // bValorQry
                                              False,  // bParaCobranca
                                              sMsgErro,
                                              iIdLoteConcessao,
                                              sSalarioContribuicao,
                                              qryBenef.FieldByName('IDSITPART').AsString,
                                              qryBenef.FieldByName('FLGINTERNO').AsString,
                                              True,
                                              False,
                                              '',
                                              False,
                                              qryBenef.FieldbyName('IdEventoGerador').AsInteger,
                                              DateToStr(StrToDate(sDataFinalAConsiderar)+1),
                                              sDataBenefLimite,
                                              //2,
                                              5,
                                              0,
                                              qryBenef.FieldbyName('DATAINICIO').AsString,
                                              qryBenef.FieldByName('NumeroProcesso').AsInteger
                                              ,True //Renato Visoni SOL 152046/3701 Kintana 1129662
                                              );
        } //Fim - Helio - SOL Nº 253577/17514 PPM Nº 971383


        if bErro then
        begin
          frmAguarde.Apaga;
          dtmBaseDados.dbBaseDados.RollBack;
          MsgDlg('Erro ao preparar contribuições ['+sMsgErro+'].' ,'Erro',mtError,[mbOk,mbHelp],0);
          TiraSQL(qryAux);
          Exit;
        end;
      End; // If qryBenef.FieldByName('FLGREFERENCIA').AsInteger = 0
    End
    Else
    If ( prmFlgLibRecalc = True ) And
      ( (qryBenef.FieldByName('IDTITULAR').AsInteger <> qryBenef.FieldByName('IDPESSOA').AsInteger) And
        (prmFlgLibRecalcBen = False)  ) Then
    Begin
      sAnoMesInicio := Copy(sDataFinalAConsiderar,7,4)+'/'+Copy(sDataFinalAConsiderar,4,2);
      sDataIniciolib :=   DateToStr(StrToDate(sDataFinalAConsiderar)+1);
      sAnoMesFinal  := sAnoMesPagamento;

      // Andre Imakawa - SIG 121019 - Inicio
      {
      // SOL: 215159 KTN: 2044027
      with qryAux do
      begin
        Close;
        SQL.Clear;
        SQL.Add(' DELETE FROM HSTCONTRIBPREV   HST '+
                ' WHERE HST.IDPLANOPREV = '+ sIdPlanoPrev+
                ' AND HST.IDPESSOA = '+ qryBenef.FieldByName('IDPESSOA').AsString+
                ' AND HST.IDLOTE = '+ IntToStr(iIdLoteConcessao)+
                ' AND HST.SITRECEBIMENTO = 0 '+
                ' AND HST.MESREFERENCIA >= '+ QuotedStr(sAnoMesPagamento) );
        ExecSQL;
      end;
      // SOL: 215159 KTN: 2044027

      //Inicio - Helio - SOL Nº 253577/17514 PPM Nº 971383
      if qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1 then
         bErro := ExecutaSP_PreparoContribuicao(qrybenef.fieldbyname('NUMEROPROCESSO').AsInteger,
                                                qryBenef.fieldByName('IDTITULAR').AsInteger,
                                                prmIDMOTIVOFOLHABEN,
                                                iIdLoteConcessao,
                                                'Não',
                                                sAnoMesPagamento,
                                                '',
                                                -1,                                           //edilaine SIG119408
                                                -1,                                           //edilaine SIG119408
                                                8        // passar cod TipoMov: Concessao     //edilaine SIG119408
                                                );


      if bErro then
         Exit;
      }
      // Andre Imakawa - SIG 121019 - Fim

      {If Not GeraContribBenef( dtmAPrev.qryAux,
                               qryContrib,
                               qryAux,
                               qryBenef.FieldByName('IDPESSOA').AsString+',',
                               qrybenef.fieldbyname('NUMEROPROCESSO').AsInteger,
                               iIdLoteConcessao,
                               sAnoMesPagamento,
                               '',
                               sAnoMesInicio,    // sAnoMesInicio
                               '',               // sMotivoAtraso
                               iIdLoteConcessao, // iIdLoteRevisao
                               ''                // DataEncerramento
                              ) Then
      Exit; }
      //Fim - Helio - SOL Nº 253577/17514 PPM Nº 971383

    End; // If prmLibRecalc

    if sFlgDataLimite = 0 then
    begin
      sSQL := ' UPDATE CONTRIBPREVPARTP SET  FLGCOBRA = 1 ';
      if qryBenef.FieldByName('DATAFINAL').AsString <> '' then
        sSQL := sSQL + ',DATAFINAL = TO_DATE('''+sDatafinal1+''',''dd/mm/yyyy'') '
      else
        sSQL := sSQL + ',DATAFINAL = NULL';

      sSQL := sSQL + ' WHERE IDPESSJUR      = '+ sIdPessJur   +
                     '   AND IDPLANOPREV    = '+ sIdPlanoPrev +
                     '   AND IDPESSOA       = '+ sIdTitular   +
                     '   AND SEQPROPOSTA    = '+ sSeqProposta +
                     '   AND DATAINICIO     >= TO_DATE('''+qryBenef.FieldbyName('DATAINICIOFUND').AsString+''',''DD/MM/YYYY'') '+
                     '   AND DATAFINAL      = TO_DATE('''+qryBenef.FieldbyName('DATAFINALANT').AsString+''',''DD/MM/YYYY'')   '+
                     '   AND IDCONTRIBUICAO IN ( SELECT CE.IDCONTRIBUICAO FROM CONTPREVEVENTO CE '+
                     '                               WHERE  CE.IDEVENTOGERADOR = '+qryBenef.FieldByName('IDEVENTOGERADOR').AsString+')';

      with qryAux do
      begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        try
          ExecSQL;
        except
          frmAguarde.Apaga;
          dtmBaseDados.dbBaseDados.RollBack;
          MsgDlg('Erro ao atualizar situação das contribuições.','Erro',mtError,[mbOk,mbHelp],0);
          TiraSQL(qryAux);
          Exit;
        end;
      end;
    end;

    frmAguarde.Apaga;
    {SOL 157203/4761 - KTN 1268806 - JRM6}
    // TESTAR PARAMETRO QUE INDICA SE O BENEFICIO DEVE SER RECALCULADO PARA BENEFICIARIOS
    // Se o parametro de recalcular beneficiarios (prmFlgLibRecalcBen) estiver
    // marcado, então não recalcular agora e deixar para recalcular após o loop
    {SOL 157203/4761 - KTN 1268806 - JRM6 - O Recalculo passou a ser realizado em outro ponto  }
    if(dtliberacaoGravar = '')then    begin

      if prmFlgLibRecalc    and
         prmFlgLibRecalcBen and
         (qryBenef.FieldByName('IDTITULAR').AsInteger <> qryBenef.FieldByName('IDPESSOA').AsInteger) then
      begin
        if not RecalculaBeneficiarios(sDataFinalAConsiderar) then
        begin
          frmAguarde.Apaga;
          dtmBaseDados.dbBaseDados.RollBack;
          MsgDlg('Erro recalcular valores dos beneficiários do processo.','Erro',mtError,[mbOk,mbHelp],0);
          TiraSQL(qryAux);
          Exit;
        end;
      end;
      {SOL 157203/4761 - KTN 1268806 - JRM6}

      qryBenef.Next;
    End;
  end;

  frmAguarde.Mostra('Atualizando processo ...');

  If Trim (sDataBenefLimite) = '' Then
  Begin
    sSQL := ' UPDATE PROCESSOBENEF SET IDSITPROCESSO = 1 ' +
            ' WHERE  NUMEROPROCESSO IN (' + sNumeroProcesso + ')';
    qryAux.Close;
    qryAux.SQl.Clear;
    qryAux.SQL.Add(sSQL);
    try
      qryAux.ExecSQL;
    except
      on E:EDBEngineError do begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        MostrarErro(E);
        Exit;
      end;
    end;
  End;

  frmAguarde.Apaga;

  //Helio - SOL Nº 253577/17514 PPM Nº 971383 - inicio
  //MostraDemonstrativoConcessao;

  GeraDemonstrativo(sDataHoraInicioProcesso, sNumProcSelecionados);
  //Helio - SOL Nº 253577/17514 PPM Nº 971383 - fim

  if MsgDlg('Deseja confirmar a Liberação do(s) Benefício(s) ? ','Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo
  then begin
     dtmBaseDados.dbBaseDados.RollBack;
     MsgDlg('Liberação de Benefício Cancelada.','Informação',mtInformation,[mbOk, mbHelp],0);
  end
  else begin
     Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

    dtmBaseDados.dbBaseDados.Commit;
    MsgDlg('Liberação de Benefício Confirmada.','Informação',mtInformation,[mbOk, mbHelp],0);

    // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
    try
      frmAguarde.Apaga;

      GeraDemonstrativo(sDataHoraInicioProcesso, sNumProcSelecionados, 'homologado');

    except
      MsgDlg('Erro ao gravar o demonstrativo.','Erro',mtError,[mbOk,mbHelp],0);
    end;
    // edilaine - SOL 253577-18174 / PPM 1327585 - fim

  end;

  If not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

  qryVirtual.First;
  While Not qryVirtual.Eof do
  Begin
    if qryVirtualDTINICIOLIBERACAO.AsString <> '' then
    begin
      with qryAux do
      Begin
       { if trim(dtliberacaoGravar) = '' then
            dtliberacao := qryBenef.FieldByName('DATAINICIO').AsDateTime
         else
            dtliberacao := strtodate(dtliberacaoGravar);
         //if dtliberacao <>   qryBenefDTINICIOLIBERACAO.AsDateTime then
         //   dtliberacao := qryBenefDTINICIOLIBERACAO.AsDateTime; }

        Close;
        SQL.Clear;
        SQL.Add(' UPDATE MOVBENEF SET DTINICIOLIBERACAO = '''+ qryVirtualDTINICIOLIBERACAO.AsString+''''); //qryBenef.FieldByName('DATAINICIO').AsString);
        SQL.Add('  WHERE IDMOVBENEF = (SELECT MAX(IDMOVBENEF) ');
        SQL.Add('   FROM MOVBENEF mb ');
        SQL.Add('  WHERE mb.NUMEROPROCESSO = '+ qryVirtualNUMEROPROCESSO.AsString);
        SQL.Add('    AND mb.IDPLANOPREV    = '+ qryVirtualIDPLANOPREV.AsString);
        SQL.Add('    AND mb.IDTITULAR      = '+ qryVirtualIDTITULAR.AsString);
        SQL.Add('    AND mb.IDPESSJUR      = '+ qryVirtualIDPESSJUR.AsString);
        SQL.Add('    AND mb.IDBENEFICIO    = '+ qryVirtualIDBENEFICIO.AsString);
        SQL.Add('    AND mb.IDPESSOA       = '+ qryVirtualIDPESSOA.AsString);
        SQL.Add('    AND mb.SEQPROPOSTA    = '+ qryVirtualSEQPROPOSTA.AsString+' )  ');
        SQL.Add('  ');
        ExecSQL;
      End;
    end;
    qryVirtual.Next;
  end;
  If dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.COMMIT;
  // Wylliam Silva Kintana: 1268806 SOL: 157203/4761
  inherited;
  bbtnCancelarClick(Self);
end;

procedure TfrmCadInicioBenefExigencia.FormShow(Sender: TObject);
begin
  inherited;
  bbtnProcurar.SetFocus;
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

end;

procedure TfrmCadInicioBenefExigencia.FormCreate(Sender: TObject);
begin
  inherited;
  TB97oKCancelar.Visible := False;

end;

procedure TfrmCadInicioBenefExigencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryBenef.Close;
  qryBenefValidos.Close;
  inherited;
end;

procedure TfrmCadInicioBenefExigencia.bbtnCancelarClick(Sender: TObject);
begin
  If ( dtmBaseDados.dbBaseDados.InTransaction ) Then
    dtmBaseDados.dbBaseDados.RollBack;

  inherited;
  qryTitular.Close;
  qryTitular.ParamByName('IdPessoa').Value := -1;
  qryTitular.ParamByName('IdPessJur').Value := -1;
  qryTitular.ParamByName('IdPlanoPrev').Value := -1;
  qryTitular.ParamByName('SeqProposta').Value := -1;
  qryTitular.Open;

  qryBenef.Close;
  qryBenef.ParamByName('IDTITULAR').AsString      := '0';
  qryBenef.ParamByName('IDPESSJUR').AsString      := '0';
  qryBenef.ParamByName('IDPLANOPREV').AsString    := '0';
  qryBenef.Open;


  bbtnProcurar.SetFocus;

end;

procedure TfrmCadInicioBenefExigencia.MostraDemonstrativoConcessao;
var dTotalBeneficio : double;
    sSalarioNaDib   : string;
    sOpcoesContrib  : string;
    iIdContribAtual, iIdContribAnterior : longint;
    varFields : variant;
    sValorRetido : string;
    sTexto       : String;
begin
  frmAguarde.Mostra('Preparando o Demonstrativo da Liberação...');

  qryAux.Close;
  try
    varFields := VarArrayCreate([0,3],varVariant);
  except
    raise;
  end;


  frmMostraAux.Caption := 'Resumo da Liberação de Benefício ... ';

  // Exibir dados do participante
  with frmMostraAux.memResult.Lines do
  begin
    Clear;
    Add('--------------------------------------------------------------------------------------------------');
    Add('                                DEMONSTRATIVO DE LIBERAÇÃO                              ');
    Add(' ');
    Add('USUÁRIO : '+Sistema.NomeUsuario+'                         DATA DA LIBERAÇÃO : '+DateToStr(date));
    Add('PARÂMETROS PARA LIBERAÇÃO : ');
    if prmFlgLibRecalc then
      Add('Recalcular Valores do Benefício Retido  : Sim ')
    else
      Add('Recalcular Valores do Benefício Retido  : Não ');

    if prmFlgLibRecalcBen then
      Add('Recalcular Benefícios do Grupo Familiar : Sim ')
    else
      Add('Recalcular Benefícios do Grupo Familiar : Não ');

    Add('--------------------------------------------------------------------------------------------------');
    Add('Participante  : '+qryTitular.FieldByName('Nome').AsString);
    Add('Beneficiário .: '+qryBenef.FieldByName('NOME').AsString);
    Add(' ');
    Add('Data de Nascimento  : '+qryTitular.FieldByName('DataNasc').AsString);
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

    qryBenef.First;

    While Not qryBenef.Eof do
    Begin
      If qryBenef.RecNo = 1
      Then sTexto := qryBenef.FieldbyName('NumeroProcesso').AsString
      Else sTexto := sTexto + ', ' + qryBenef.FieldbyName('NumeroProcesso').AsString;

      qryBenef.Next;
    End;

    Add('PROCESSO(S) Nº : ' + sTexto);

    Add(' ');
    Add('--------------------------------------------------------------------------------------------------');
    Add('=> BENEFÍCIOS LIBERADOS :');

    qryBenef.First;
    dTotalBeneficio := 0;
    while not qryBenef.Eof do
    begin
      Add('--------------------------------------------------------------------------------------------------');
      Add('- '+qryBenef.FieldByName('NOMEBENEFICIO').AsString);
      Add(' ');
      Add(' '+PreparaStr('Data de Requerimento : '+qryBenef.FieldByName('DataRequerimento').AsString, 50)+
         PreparaStr('Data de Concessão : '+qryBenef.FieldByName('DataConcessao').AsString, 49));

       if qryBenef.FieldByName('FlgResgate').AsInteger = 0 // nao é resgate
       then begin
          Add(' '+PreparaStr('Data de Início no INSS : '+qryBenef.FieldByName('DataInicioINSS').AsString,50)+
                  PreparaStr('Data de Início na Fundação : '+qryBenef.FieldByName('DataInicioFUND').AsString,49));

          if (qryBenef.FieldByName('FLGDATAPREVISTA').AsInteger = 1) and (qryBenef.FieldByName('DATAFINALPREVISTA').AsString <> '')
          then Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final (Prevista) : '+qryBenef.FieldByName('DATAFINALPREVISTA').AsString,49))
          else if qryBenef.FieldByName('DATAFINAL').AsString <> ''
               then Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final (Efetiva) : '+qryBenef.FieldByName('DATAFINAL').AsString,49))
               else Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final : <indefinida> ',49));

          Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final Alterada para : __/__/____',49));

          Add(' '+PreparaStr('Valor do INSS : Calculado = R$ '+FormatFloat('#0.00', qryBenef.FieldByName('VLRCALCINSS').AsFloat),50)+
                  PreparaStr('Informado = R$ '+FormatFloat('#0.00', qryBenef.FieldByName('VLRINFINSS').AsFloat),49));
       end
       else begin // é resgate
          Add(' Data de Início na Fundação : '+qryBenef.FieldByName('DataInicioFUND').AsString);
       end;

        Add(' Valor do Benefício = R$ '+FormatFloat('#0.00', qryBenef.FieldByName('VALORATUAL').AsFloat));

       dTotalBeneficio := dTotalBeneficio + qryBenef.FieldByName('VALORATUAL').AsFloat;
       qryBenef.Next;
    end; // while not qryBenef.Eof

    qryBenef.First;
    if qryBenef.FieldByName('IDTITULAR').AsInteger <> qryBenef.FieldByName('IDPESSOA').AsInteger then
    begin
      qryResultado.Close;

      qryResultado.ParamByName('NumeroProcesso').AsInteger := qryBenef.FieldByName('NumeroProcesso').AsInteger;

      qryResultado.Open;

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
    end;
    Add('--------------------------------------------------------------------------------------------------');
    Add(PreparaStr('TOTAL DOS BENEFÍCIOS DO PROCESSO : R$ ',76)+FormatFloat('#0.00', dTotalBeneficio));
    Add('--------------------------------------------------------------------------------------------------');

    qryBenef.First;

    // Mostrar mês a mês quanto será pago e quanto será descontado
    Add('--------------------------------------------------------------------------------------------------');
    Add('=> VALORES A PAGAR / RECEBER                                                                                         ');
    Add('--------------------------------------------------------------------------------------------------');

    Add(PreparaStr('MÊS',8)+' '+PreparaStr('NOME',25)+' '+PreparaStr('ITEM'     ,18)+' '+PreparaStr('RETIDO',12)+' '+
        PreparaStr('TOTAL',12)+' '+PreparaStr('PAGAR',12)+' '+PreparaStr('DESCONTAR' ,12));

//    if sAnoMesInicio = '' then
//      sAnoMesInicio := Copy(sDataFinalAConsiderar,7,4)+Copy(sDataFinalAConsiderar,3,3);


    // Buscar BENEFICIOS a pagar no mês
    with qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT B.NOME,      P.NOME AS NOMEBENEFICIARIO, H.MESREFERENCIA, H.VALORTOTAL, '+
              '        H.VALORPREV, H.IDBENEFICIO, H.IDPESSOA, H.NUMEROPROCESSO '+
              ' FROM   PESSOA P, BENEFICIO B, HSTBENEFBFCIARIO H      '+
              ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
              ' AND    H.IDPESSJUR        = '+sIdPessJur+
              ' AND    H.IDPLANOPREV      = '+sIdPlanoPrev+
              ' AND    H.IDTITULAR        = '+sIdTitular+
              ' AND    H.IDPESSOA        = '+sIdPessoa+ // Thiago Melo SOL 212728 KTN 2038739
              ' AND    H.SEQPROPOSTA      = 1 '+
              ' AND    H.FLGDEVOLUCAO     = 0 '+
              ' AND    H.FLGENVIADO       = 0 ');
  {SOL 157203/4761 - KTN 1268806 - JRM6}
              if (sAnoMesInicio<>'')then
                 SQL.Add(' AND    H.MESREFERENCIA >= ' + QuotedStr( sAnoMesInicio ));
  {SOL 157203/4761 - KTN 1268806 - JRM6}
     SQL.Add( ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
              ' AND    P.IDPESSOA         = H.IDPESSOA '+
              ' ORDER BY B.NOME, H.MESREFERENCIA ');
      //sql.SaveToFile('c:\planus\temp\1savequery.sql');
      Open;
      First;
      while not Eof do
      begin
        varFields[0] := FieldByName('MESREFERENCIA').AsString;
        varFields[1] := FieldByName('IDPESSOA').AsString;
        varFields[2] := FieldByName('IDBENEFICIO').AsString;
        varFields[3] := FieldByName('NUMEROPROCESSO').AsString;
        if qryHstBenefAntesLiberar.Locate('MESREFERENCIA;IDPESSOA;IDBENEFICIO;NUMEROPROCESSO',varFields,[loCaseInsensitive]) then
          sValorRetido := qryHstBenefAntesLiberar.FieldByName('TOTALRETIDO').AsString
        else
          sValorRetido := '0';

        Add( PreparaStr(FieldByName('MesReferencia').AsString                              ,08)+' '+
             PreparaStr(FieldByName('NomeBeneficiario').AsString                           ,25)+' '+
             PreparaStr(FieldByName('Nome').AsString                                       ,18)+' '+
             PreparaStr('(+)'+FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRetido))) ,12)+' '+
             PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('VALORTOTAL').AsFloat)       ,12)+' '+
             PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)        ,12)+' '+
             PreparaStr('(-)'+FormatFloat('#0.00',0)                                       ,12));
        Next;
      end;
    end;

    // Buscar CONTRIBUICOES a devolver no mês
    with qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT C.NOME, P.NOME AS NOMEBENEFICIARIO, HST.MESREFERENCIA, HST.VALORESPERADO             '+
              '   FROM PESSOA P, CONTRIBUICAO C, HSTCONTRIBPREV HST '+
              '  WHERE HST.IDPESSJUR       = ' + qryBenef.FieldByName('IdPessJur').AsString   +
              '    AND HST.IDPLANOPREV     = ' + qryBenef.FieldByName('IdPlanoPrev').AsString +
              '    AND HST.IDPESSOA        = ' + qryBenef.FieldByName('IdPessoa').AsString    +
              '    AND HST.SEQPROPOSTA     = ' + qryBenef.FieldByName('SeqProposta').AsString +
              '    AND HST.IDLOTE          = '+IntToStr(iIdLoteConcessao)+
              '    AND HST.FLGDEVOLUCAO    = 1 '+
              '    AND HST.FLGDESCFOLHA    = 1 '+
              '    AND HST.FLGCONCESSAO    = 1 ');
  {SOL 157203/4761 - KTN 1268806 - JRM6}
              if (sAnoMesInicio<>'')then
                 SQL.Add(' AND    HST.MESREFERENCIA >= ' + QuotedStr( sAnoMesInicio ));
  {SOL 157203/4761 - KTN 1268806 - JRM6}
     SQL.Add( '     AND C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO  '+
              '    AND P.IDPESSOA          = HST.IDPESSOA '+
              '  ORDER BY C.NOME, HST.MESREFERENCIA');
//      sql.SaveToFile('c:\planus\temp\2savequery.sql');
      Open;

      while not Eof do
      begin
        Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,05)+' '+
             PreparaStr(FieldByName('NomeBeneficiario').AsString                        ,25)+' '+
             PreparaStr(FieldByName('Nome').AsString                                    ,18)+' '+
             PreparaStr('(+)'+FormatFloat('#0.00',0)                                    ,12)+' '+
             PreparaStr('(+)'+FormatFloat('#0.00',0)                                    ,12)+' '+
             PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,12)+' '+
             PreparaStr('(-)'+FormatFloat('#0.00',0)                                    ,12));
        Next;
      end;
    end;

    // Buscar Beneficios a devolver(descontar) no mês
    with qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT B.NOME, P.NOME AS NOMEBENEFICIARIO, H.MESREFERENCIA, H.VALORTOTAL, H.VALORPREV '+
              ' FROM   PESSOA P, BENEFICIO B, HSTBENEFBFCIARIO H '+
              ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
              ' AND    H.IDPESSJUR        = '+sIdPessJur+
              ' AND    H.IDPLANOPREV      = '+sIdPlanoPrev+
              ' AND    H.IDTITULAR        = '+sIdTitular+
              ' AND    H.SEQPROPOSTA      = 1 '+
              ' AND    H.FLGDEVOLUCAO     = 1 '+
              ' AND    H.FLGCONCESSAO     = 1 ');
  {SOL 157203/4761 - KTN 1268806 - JRM6}
              if (sAnoMesInicio<>'')then
                 SQL.Add(' AND    H.MESREFERENCIA >= ' + QuotedStr( sAnoMesInicio ) );
  {SOL 157203/4761 - KTN 1268806 - JRM6}
      SQL.Add(' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
              ' AND    P.IDPESSOA         = H.IDPESSOA '+
              ' ORDER BY B.NOME, H.MESREFERENCIA ');
//      sql.SaveToFile('c:\planus\temp\3savequery.sql');
      Open;

      while not Eof do
      begin
        Add( PreparaStr(FieldByName('MesReferencia').AsString                        ,08)+' '+
             PreparaStr(FieldByName('NomeBeneficiario').AsString                     ,25)+' '+
             PreparaStr(FieldByName('Nome').AsString                                 ,18)+' '+
             PreparaStr('(+)'+FormatFloat('#0.00',0)                                 ,12)+' '+
             PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('VALORTOTAL').AsFloat) ,12)+' '+
             PreparaStr('(+)'+FormatFloat('#0.00',0)                                 ,12)+' '+
             PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)  ,12));
         Next;
      end;
    end;

    // Buscar CONTRIBUICOES a COBRAR no mês
    with qryAux do
    begin
      Close;
      SQL.Clear;
      If qryBenef.FieldByName('IDTITULAR').AsString = qryBenef.FieldByName('IDPESSOA').AsString Then
      Begin
        SQL.Add(' SELECT DISTINCT C.IDCONTRIBUICAO, C.NOME, P.NOME AS NOMEBENEFICIARIO, CP.NOMEVALORBASE1,       '+
                '        CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, CP.NUMOPCOES, '+
                '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,     '+
                '        HST.MESREFERENCIA, HST.VALORESPERADO                '+

                ' FROM   PESSOA P, CONTRIBUICAO C, CONTPREV CP, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST '+

                ' WHERE  HST.IDPESSJUR       = ' + qryBenef.FieldByName('IDPESSJUR').AsString   +
                ' AND    HST.IDPLANOPREV     = ' + qryBenef.FieldByName('IDPLANOPREV').AsString +
                ' AND    HST.IDPESSOA        = ' + qryBenef.FieldByName('IDPESSOA').AsString    +
                ' AND    HST.SEQPROPOSTA     = ' + qryBenef.FieldByName('SEQPROPOSTA').AsString +
                ' AND    HST.IDLOTE          = ' + IntToStr(iIdLoteConcessao)                   +
                ' AND    HST.FLGDEVOLUCAO    = 0 '+
                ' AND    HST.FLGDESCFOLHA    = 1 '+
                ' AND    HST.FLGCONCESSAO    = 1 ');
  {SOL 157203/4761 - KTN 1268806 - JRM6}
                if (sAnoMesInicio<>'')then
                   SQL.Add(' AND    HST.MESREFERENCIA >= ' + QuotedStr( sAnoMesInicio ));
  {SOL 157203/4761 - KTN 1268806 - JRM6}
        SQL.Add(' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO  '+
                ' AND    CPP.IDPESSJUR       = HST.IDPESSJUR       '+
                ' AND    CPP.IDPLANOPREV     = HST.IDPLANOPREV     '+
                ' AND    CPP.IDPESSOA        = HST.IDPESSOA        '+
                ' AND    CPP.SEQPROPOSTA     = HST.SEQPROPOSTA     '+
                ' AND    CPP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO  '+
                ' AND    CP.IDPLANOPREV      = CPP.IDPLANOPREV     '+
                ' AND    CP.IDCONTRIBUICAO   = CPP.IDCONTRIBUICAO  '+
                ' AND    P.IDPESSOA          = HST.IDPESSOA        '+
                ' ORDER BY C.NOME, HST.MESREFERENCIA ');
      End
      Else
      Begin
        SQL.Add('SELECT DISTINCT '+
                '   P.NOME AS NOMEBENEFICIARIO, '+
                '   CO.NOME,    '+
                '   H.IDPESSOA AS IDRESPONSAVEL, H.MESREFERENCIA,  H.VALORESPERADO, '+
                '   H.IDCONTRIBUICAO, H.FLGDEVOLUCAO '+
                ' FROM   '+
                '   PESSOA P, HSTCONTRIBPREV H, CONTRIBUICAO CO , BFCIARIOTITPLAN BT '+
                ' WHERE  H.IDLOTE         = '+ IntToStr(iIdLoteConcessao)                   +
                ' AND    H.IDPESSOA       = '+ qryBenef.FieldByName('IDRESPONSAVEL').AsString   +
                ' AND    H.IDPESSJUR      = '+ qryBenef.FieldByName('IDPESSJUR').AsString   +
                ' AND    H.IDPLANOPREV    = '+ qryBenef.FieldByName('IDPLANOPREV').AsString +
                ' AND    H.SEQPROPOSTA    = '+ qryBenef.FieldByName('SEQPROPOSTA').AsString +
                ' AND    H.FLGDEVOLUCAO = 0 '+
                ' AND    H.FLGDESCFOLHA = 1 '+
                ' AND    H.FLGCONCESSAO = 1 ');
  {SOL 157203/4761 - KTN 1268806 - JRM6}
               if (sAnoMesInicio<>'')then
                 SQL.Add(' AND    H.MESREFERENCIA >= ' + QuotedStr( sAnoMesInicio ));
  {SOL 157203/4761 - KTN 1268806 - JRM6}
       SQL.Add( ' AND    H.IDPESSOA      = BT.IDRESPONSAVEL '+
                ' AND    BT.IDPESSJUR    = H.IDPESSJUR      '+
                ' AND    BT.IDPLANOPREV  = H.IDPLANOPREV    '+
                ' AND    BT.IDTITULAR    = '+ qryBenef.FieldByName('IDTITULAR').AsString +
                ' AND    CO.IDCONTRIBUICAO = H.IDCONTRIBUICAO         '+
                ' AND    P.IDPESSOA        = H.IDPESSOA               '+
                ' ORDER BY '+
                '   H.IDPESSOA, H.MESREFERENCIA, CO.NOME ')
      End;
//      sql.SaveToFile('c:\planus\temp\4savequery.sql');
      Open;
      sOpcoesContrib     := '';
      iIdContribAnterior := -1;
      while not Eof do
      begin
        Add(PreparaStr(FieldByName('MESREFERENCIA').AsString                           ,08)+' '+
            PreparaStr(FieldByName('NOMEBENEFICIARIO').AsString                        ,25)+' '+
            PreparaStr(FieldByName('NOME').AsString                                    ,18)+' '+
            PreparaStr('(+)'+FormatFloat('#0.00',0)                                    ,12)+' '+
            PreparaStr('(+)'+FormatFloat('#0.00',0)                                    ,12)+' '+
            PreparaStr('(+)'+FormatFloat('#0.00',0)                                    ,12)+' '+
            PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('VALORESPERADO').AsFloat) ,12));

        iIdContribAtual    := FieldByName('IDCONTRIBUICAO').AsInteger;
        if ( iIdContribAtual <> iIdContribAnterior )
            And ( qryBenef.FieldByName('IDTITULAR').AsString =
                  qryBenef.FieldByName('IDPESSOA').AsString ) then
        begin
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

    // Mostrar opções de contribuições a cobrar
    Add('--------------------------------------------------------------------------------------------------');
    Add('=> OPÇÕES DE CONTRIBUIÇÕES A COBRAR  ');
    Add('--------------------------------------------------------------------------------------------------');
    Add('CONTRIBUIÇÃO                                           OPÇÃO 1      OPÇÃO 2      OPÇÃO 3 ');
    Add(sOpcoesContrib);

    Add('----------------------------------------------------------------------------------------------');
    Add('Legenda Plano Contábil                                                                        ');
    Add('Código    Descrição                                                                           ');

    // Kintana 1382922 SOL 162594 - Otacilio Aquino - Inicio
    // Pegar o Codigo e descricao do plano contabil
    with qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT(SELECT BF.IDPLANPREVCONTAB '            +
              '         FROM   BENEFBFCIARIO BF, PLANPREVCONTABIL PPC ' +
              '         WHERE  PPC.IDPLANOPREV  = BF.IDPLANPREVCONTAB ' +
              '         AND    BF.IDPLANOPREV   = H.IDPLANOPREV '       +
              '         AND    BF.IDPESSOA      = H.IDPESSOA '          +
              '         AND BF.IDBENEFICIO      = H.IDBENEFICIO '       +
              '         AND BF.NUMEROPROCESSO   = H.NUMEROPROCESSO '    +
              '         AND BF.IDPESSJUR        = H.IDPESSJUR '         +
              '         AND BF.IDTITULAR        = H.IDTITULAR '         +
              '         AND BF.IDPLANOORIGEM    = H.IDPLANOORIGEM '     +
              '         AND BF.SEQPROPOSTA      = H.SEQPROPOSTA '       +
              '         AND ROWNUM <= 1 ) AS  CODIGO, '                 +
              '        (SELECT PPC.NOME '                               +
              '         FROM   BENEFBFCIARIO BF, PLANPREVCONTABIL PPC ' +
              '         WHERE  PPC.IDPLANOPREV  = BF.IDPLANPREVCONTAB ' +
              '         AND    BF.IDPLANOPREV   =  H.IDPLANOPREV '      +
              '         AND    BF.IDPESSOA      =  H.IDPESSOA '         +
              '         AND BF.IDBENEFICIO      = H.IDBENEFICIO '       +
              '         AND BF.NUMEROPROCESSO   = H.NUMEROPROCESSO '    +
              '         AND BF.IDPESSJUR        = H.IDPESSJUR '         +
              '         AND BF.IDTITULAR        = H.IDTITULAR '         +
              '         AND BF.IDPLANOORIGEM    = H.IDPLANOORIGEM '     +
              '         AND BF.SEQPROPOSTA      = H.SEQPROPOSTA '       +
              '         AND ROWNUM <= 1) AS  PLANO '                                           +
              ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP '                    +
              ' WHERE  H.IDLOTE           = ' + IntToStr(iIdLoteConcessao)                     +
              ' AND    H.IDPESSJUR        = ' + qryBenef.FieldByName('IDPESSJUR').AsString     +
              ' AND    H.IDPESSOA         = ' + qryBenef.FieldByName('IDRESPONSAVEL').AsString +
              ' AND    H.SEQPROPOSTA      = 1 '            +
              ' AND    BPP.IDBENEFICIO = H.IDBENEFICIO '   +
              ' AND    BPP.IDPLANOPREV = H.IDPLANOPREV '   +
              ' AND    H.FLGDEVOLUCAO     = 0 '            +
              ' AND    H.FLGENVIADO       = 0 '            +
              ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
              ' ORDER BY 1, 2 ');
//      sql.SaveToFile('c:\planus\temp\5savequery.sql');
      Open;
      First;
      while not Eof do
      begin
        Add( PreparaStr(FieldByName('CODIGO').AsString                                ,10) +
             PreparaStr(FieldByName('PLANO').AsString                                 ,40));
        Next;
      end;
    end;
    // Kintana 1382922 SOL 162594 - Otacilio Aquino - Fim



      Add('--------------------------------------------------------------------------------------------------');
      Add('                               APENAS PARA CONFERÊNCIA ');
      Add('--------------------------------------------------------------------------------------------------');
  end; // with
  frmAguarde.Apaga;
  frmMostraAux.ShowModal;
end; // MostraDemonstrativoConcessao

{------------------------------------------------------------------------------}
{ Nova Funcionalidade para buscar o valor de um beneficio em uma data.         }
{ Utilizado nos calculos de reajuste retroativos.                              }
function TfrmCadInicioBenefExigencia.ValorBeneficioNaData(iIdPessjur,
                                                          iIdPlanoPrev, iIdTitular,
                                                          iIdPessoa, iIdBeneficio: Integer;
                                                          sMesReferencia: String;
                                                          sFlgCampoRetorno : String = 'I'): Double; // I - VALORINTEGRAL
                                                                                                      // T - VALORTOTAL
Var
  sSQL : String;
begin
  Result := 0;
  { Monta e executa consulta que vai buscar o valor do beneficio na data }
  sSQL := 'SELECT '+
          '  HST.VALORINTEGRAL, HST.VALORTOTAL '+
          'FROM   '+
          '  HSTBENEFBFCIARIO HST '+
          'WHERE  '+
          '  HST.IDPESSJUR       = '+IntToStr(iIdPessjur)     +' AND '+
          '  HST.IDPLANOPREV     = '+IntToStr(iIdPlanoPrev)   +' AND '+
          '  HST.IDTITULAR       = '+IntToStr(iIdTitular)     +' AND '+
          '  HST.IDPESSOA        = '+IntToStr(iIdPessoa)      +' AND '+
          '  HST.IDBENEFICIO     = '+IntToStr(iIdBeneficio)   +' AND '+
          '  HST.MESREFERENCIA  <= '+QuotedStr(sMesReferencia)+'     '+
          'ORDER BY  '+
          '  HST.MESREFERENCIA DESC ';

  QryAux.SQL.Clear;
  QryAux.SQL.Add( sSQL );
  QryAux.Open;
  { Havendo encontrado, retorna o Valor Integral (Valor do Beneficio) }
  If Not QryAux.IsEmpty Then Begin
    If sFlgCampoRetorno = 'I' Then Begin
      Result := QryAux.FieldByName('VALORINTEGRAL').AsFloat;
    End Else Begin
      Result := QryAux.FieldByName('VALORTOTAL').AsFloat;
    End;
  End;

end;{ ValorBeneficioNaData }


{-------------------------------------------------------------------------------------------------------}
{ Retorna total de beneficiários validos para fazer calculo do rateio do beneficio                 }
function TfrmCadInicioBenefExigencia.TotalBeneficiariosValidos(iIdPessjur, iIdPlanoPrev, iIdTitular,
                                                               iIdPessoa : Integer;
                                                               sNumeroProcesso: String): Integer;
begin
  { Busca total de beneficiários validos }
  QryBenefValidos.Close;
  QryBenefValidos.ParamByName('NUMEROPROCESSO').AsString  := sNumeroProcesso;
  QryBenefValidos.ParamByName('IDTITULAR').AsInteger      := iIdTitular;
  QryBenefValidos.ParamByName('IDPESSJUR').AsInteger      := iIdPessJur;
  QryBenefValidos.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
  qryBenefValidos.Open;

  Result := QryBenefValidos.RecordCount;
end;

function TfrmCadInicioBenefExigencia.RecalculaBeneficiarios ( psDataIniRecalculo : string ) : boolean;
var sAnoMesFinal                      : string;
    sAnoMesAtual                      : string;
    sAnoMesLote                       : string;
    sDataPagamento                    : string;
    sMesAbono                         : string;
    sAnoMesDataFinal                  : string;
    sIdRegraAntecipAbono              : string;
    sDataFinalAntecip                 : string;
    sDIB                              : string;
    bEhAntecipacao                    : Boolean;
    bEhAdiantamentoAbono              : Boolean;
    bPagaAbono                        : Boolean;
    bPagtoUnico                       : Boolean;
    dValorBeneficioNoMes              : double;
    rValorBase1                       : double;
    rValorBase2                       : double;
    rValorBase3                       : double;
    bErro,
    bReajustou                        : boolean;
    bPossuiAbono                      : boolean;
    pbMigracaoPlano                   : boolean;
    iIncluiMesConc                    : Integer;
    iTotBeneficiariosValidos          : integer;
    iIdTitBenef                       : integer;
    sUltMesReajuste                   : string;
    dValorBeneficioIntegral           : double;
    dValorBeneficioIntegralAposMinimo : double;
    dValorPrevAntesMinimo             : double;
    dValorBenefRateado                : double;
    dValorSRB                         : double;
    dValorPago                        : double;
    dValorAcerto                      : double;
    dValorEmReal                      : double;
    dValorTotal                       : double;
    rValorAbono                       : double;
    sValorAbono                       : string;
    sFlgDevolucao                     : string;
    sDataFolha                        : string;
    sMsgErro                          : string;
    sDataInicioParaAbono              : String;
    sAnoMesDataInicio                 : string;
    sAnoMesPagAbono                   : String;
    sAnoMesRefAbono                   : string;
    sFlgReferencia                    : string;
    iFlgEnviado                       : integer;
    iSeqBeneficio                     : LongInt;
    cTipoAbono                        : Char;
    sSql,
    strConcedidos                     : string;
    sIdRegraCalculo                   : string;
    iIdCalculo,
    iIdRegraAbono : LongInt;
    //Inicio - Helio - SOL Nº 253577/17514 PPM Nº 971383
    rVlrBCDeficit, rVlrBSTotal, rVlrFABTotal : String;
    rVlrDeficitMes, rVlrBSMes, rVlrFABMes    : String;
    rVlrBSTotalAbono, rVlrFABTotalAbono, rVlrBCDeficitAbono : string;
    rVlrCalculo : double;
    //Fim - Helio - SOL Nº 253577/17514 PPM Nº 971383
    rValorTotal, rVlrBSAtual, rVlrFABAtual : String;                     // edilaine - SOL 253577-18064 / PPM 1240079
    rVlrBSRateado, rVlrFABRateado, rVlrDeficitRateado : double;          // edilaine - SOL 253577-18064 / PPM 1240079
    rVlrCalcAbono, rVlrBSAbono, rVlrFABAbono, rVlrDeficitAbono, rVlrAntecAbono : double;          // edilaine - SIG121019
begin
  Result := False;

  bEhAntecipacao := False;
  bPagtoUnico := False;
  pbMigracaoPlano:= False;
  sAnoMesInicio := Copy(psDataIniRecalculo,7,4)+'/'+Copy(psDataIniRecalculo,4,2);
  sAnoMesFinal  := sAnoMesPagamento;
  bPossuiAbono := False;
  iIdRegraAbono :=-1;
  rValorAbono   := 0;    sValorAbono := '0';
   sAnoMesDataFinal := Copy(sDataBenefLimite,7,4)+'/'+Copy(sDataBenefLimite,4,2);
  {SOL 157203/4761 - KTN 1268806 - JRM6}
  if sFlgDataLimite = 1 then
    sAnoMesFinal  := Copy( sDataBenefLimite, 7,4)+'/'+Copy( sDataBenefLimite, 4,2);
  //else
    //sAnoMesFinal  := Copy( DateToStr( Date ) ,7,4)+'/'+Copy( DateToStr( Date ) ,4,2);



  qryBenefRecalculo.Close;
  //qryBenefRecalculo.ParamByName('NUMEROPROCESSO').AsString := sNumeroProcesso;
  qryBenefRecalculo.ParamByName('NUMEROPROCESSO').AsString := qryBenef.FieldByName('NUMEROPROCESSO').AsString; //leofuncef - 23052005
  qryBenefRecalculo.ParamByName('DATA_LIBERACAO').AsDateTime:= Strtodate( psDataIniRecalculo); // Andre Imakawa - SIG 121019

  qryBenefRecalculo.Open;


  strConcedidos := '';
  while not qryBenefRecalculo.Eof do
  begin
    iIdCalculo := 0;
    iTotBeneficiariosValidos := TotalBeneficiariosValidos(qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,
                                                              qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                                              qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,
                                                              qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger,
                                                              qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsString);
    with qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT CIF.DATAPAGAMENTO, CIF.DATAPREPARO, CIF.MESREFERENCIA, '+
              'NVL(CIF.FLGINCLUIMESCONC,1) AS FLGINCLUIMESCONC '+
              'FROM CTRLINTERFACE CIF '+
              'WHERE  CIF.IDLOTE = '+IntToStr(iIdLoteConcessao));
      Open;

      iIncluiMesConc := FieldByName('FLGINCLUIMESCONC').Asinteger;
      sAnoMesLote    := FieldByName('MESREFERENCIA').AsString;
      sDataPagamento := FieldByName('DATAPAGAMENTO').AsString;
      sDataFolha     := CriticaDataCobrancaSit( qryAux,IntToStr(iIdFundacao),'', 'AS', 'P',

                                                Copy(sAnoMesLote,6,2),
                                                Copy(sAnoMesLote,1,4) );
    end;
    {SOL 157203/4761 - KTN 1268806 - JRM6}
    sAnoMesDataInicio := Copy(sDataIniciolib, 7,4)+'/'+Copy(sDataIniciolib, 4,2);
    sDataFolha    := CriticaDataCobrancaSit( qryAux,
                                            IntToStr(iIdFundacao),'', 'AS', 'P',
                                            Copy(sAnoMesPagamento,6,2),
                                            Copy(sAnoMesPagamento,1,4) );



     { Se não tem DATA FINAL -> Gerar beneficios da data de inicio até hoje       }
    { Se tem DATA FINAL e a DATA FINAL é menor que hoje,                         }
    {    o mes final será o mes da data final.                                   }
    { Senão o MES FINAL será o MES DA FOLHA                                      }
    if Trim(sDataBenefLimite) = '' then
    begin
      if bPagtoUnico
      then sAnoMesFinal := sAnoMesDataInicio
      else sAnoMesFinal := sAnoMesLote;
    end
    else
    begin
      sAnoMesDataFinal := Copy(sDataBenefLimite,7,4)+'/'+Copy(sDataBenefLimite,4,2);
      sAnoMesFinal        := sAnoMesLote;
    end;

    { Se o beneficio tem DATAFINAL <= MESATUAL                                   }
    { Então Se a DATA FINAL for no MES ATUAL (MES DO LOTE)                       }
    {       Então Se o parametro de concessão for para conceder até mes anterior }
    {             Então NAO ENCERRAR BENEFICIO e NAO PAGAR MES ATUAL             }
    {             Senão ENCERRAR BENEFICIO e PAGAR MES ATUAL                     }
    {       Senão DATA FINAL anterior ao mes atual                               }
    {             ENCERRAR BENEFICIO e PAGAR ULTIMO MES                          }
    if (Trim(sDataBenefLimite) <> '') and ((Copy(sDataBenefLimite,7,4)+'/'+Copy(sDataBenefLimite,4,2) <=  sAnoMesLote)) then
    begin
      if (Copy(sDataBenefLimite,7,4)+'/'+Copy(sDataBenefLimite,4,2)) = sAnoMesLote
      then begin
        if iIncluiMesConc = 0
        then sAnoMesFinal := SAnoMesAnterior(sAnoMesFinal)
        else sAnoMesFinal := sAnoMesFinal;
      end
      else
        sAnoMesFinal := sAnoMesDataFinal;
    end
    else
    begin
      if (iIncluiMesConc = 0) and
        (not bPagtoUnico        ) and
        ( (Trim(sDataBenefLimite) = '') or  //Marcio Sanches Spinosa SOL: 243274 KTN: 583284
        (Copy(sDataBenefLimite,7,4)+'/'+Copy(sDataBenefLimite,4,2) >=  sAnoMesLote) )
      then sAnoMesFinal := SAnoMesAnterior(sAnoMesFinal);
    end;

    if (qryBenefRecalculo.FieldByName('VALORBASE1').AsString<>'') then
        rValorBase1     := qryBenefRecalculo.FieldByName('VALORBASE1').AsFloat
    else
        rValorBase1    := 0;

    if (qryBenefRecalculo.FieldByName('VALORBASE2').AsString<>'') then
        rValorBase2     := qryBenefRecalculo.FieldByName('VALORBASE2').AsFloat
    else
        rValorBase2    := 0;

    if (qryBenefRecalculo.FieldByName('VALORBASE3').AsString<>'') then
        rValorBase3     := qryBenefRecalculo.FieldByName('VALORBASE3').AsFloat
    else
        rValorBase3    := 0 ;


    rValorBase3     := qryBenefRecalculo.FieldByName('VALORBASE3').AsFloat;

    if (qryBenef.FieldByName('IDTITULAR').AsInteger <> qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger)then
       iIdTitBenef := qryBenefRecalculo.FieldByName('IDTITBENEF').AsInteger
    else iIdTitBenef := -1;

    { Buscar o tipo de pagamento de beneficio }
    sSQL := 'SELECT TPB.FLGFREQUENCIA FROM TPPAGTOBENEFICIO TPB WHERE TPB.IDTPPAGTOBENEFIC = '+IntToStr( qryBenefRecalculo.FieldByName('IDREGRAULTPAGTO').AsInteger );
    FazQuery( QryAux, sSQL );
    if (QryAux.IsEmpty) or (QryAux.FieldByName('FLGFREQUENCIA').AsString <> 'U')
    then bPagtoUnico := False
    else bPagtoUnico := True;
    if ( bPagtoUnico and (sDataBenefLimite <> '') ) then
       sDataBenefLimite := '';


    sAnoMesAtual := sAnoMesInicio;
    if strConcedidos = '' then
      strConcedidos := qryBenefRecalculo.FieldByName('IDPESSOA').AsString
    else
      strConcedidos := strConcedidos +','+qryBenefRecalculo.FieldByName('IDPESSOA').AsString;

    //edilaine SIG121009 : inicio
    {dValorEmReal                      := qryBenefRecalculo.FieldByName('VALORATUAL').AsFloat;
    dValorTotal                       := qryBenefRecalculo.FieldByName('VALORTOTAL').AsFloat;
    sUltMesReajuste                   := qryBenefRecalculo.FieldByName('ULTMESREAJUSTE').AsString;
    dValorBeneficioIntegral           := qryBenefRecalculo.FieldByName('VALORTOTAL').AsFloat;
    dValorBeneficioIntegralAposMinimo := qryBenefRecalculo.FieldByName('VALORTOTAL').AsFloat;
    dValorPrevAntesMinimo             := qryBenefRecalculo.FieldByName('VALORATUAL').AsFloat;
    dValorBenefRateado                := qryBenefRecalculo.FieldByName('VALORATUAL').AsFloat; }

    //Inicio SIG126648  Ferrari
    if testareVlrInss then
      Begin
        dValorEmReal                      := qryBenefRecalculo.FieldByName('VALORATUAL').AsFloat;
        dValorTotal                       := qryBenefRecalculo.FieldByName('VALORATUAL').AsFloat;
        dValorBeneficioIntegral           := qryBenefRecalculo.FieldByName('VALORTOTAL').AsFloat;
        dValorBeneficioIntegralAposMinimo := qryBenefRecalculo.FieldByName('VALORTOTAL').AsFloat;
        dValorPrevAntesMinimo             := qryBenefRecalculo.FieldByName('VALORATUAL').AsFloat;
        dValorBenefRateado                := qryBenefRecalculo.FieldByName('VALORATUAL').AsFloat;
      end
    else
      begin
        dValorEmReal                      := qryBenefRecalculo.FieldByName('VALORATUALANT').AsFloat;
        dValorTotal                       := qryBenefRecalculo.FieldByName('VALORTOTALANT').AsFloat;
        dValorBeneficioIntegral           := qryBenefRecalculo.FieldByName('VALORTOTALANT').AsFloat;
        dValorBeneficioIntegralAposMinimo := qryBenefRecalculo.FieldByName('VALORTOTALANT').AsFloat;
        dValorPrevAntesMinimo             := qryBenefRecalculo.FieldByName('VALORATUALANT').AsFloat;
        dValorBenefRateado                := qryBenefRecalculo.FieldByName('VALORATUALANT').AsFloat;
      end;
    sUltMesReajuste                   := qryBenefRecalculo.FieldByName('ULTMESREAJUSTE').AsString;
    dValorSRB                         := qryBenefRecalculo.FieldByName('VALORSRB').AsFloat;
    // FIM SIG 126648 Ferrari
    //edilaine SIG121009 : fim

    //Helio - SOL Nº 253577/17514 PPM Nº 971383
    rVlrBCDeficit := '';
    rVlrBSTotal     := '';
    rVlrFABTotal    := '';
    rVlrBSAtual     := '';         // edilaine - SOL 253577-18064 / PPM 1240079
    rVlrFABAtual    := '';         // edilaine - SOL 253577-18064 / PPM 1240079
    rValorTotal     := FloatToStr(dValorTotal); // edilaine - SOL 253577-18064 / PPM 1240079

    if qryBenefRecalculo.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1 then
       rVlrBCDeficit := qryBenefRecalculo.FieldByName('VLRBASEDEFICIT').AsString;

    if qryBenefRecalculo.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1 then
    begin
      rVlrBSTotal  := qryBenefRecalculo.FieldByName('VLRBSTOTAL').AsString;      // edilaine - SOL 253577-18064 / PPM 1240079
      rVlrFABTotal := qryBenefRecalculo.FieldByName('VLRFABTOTAL').AsString;     // edilaine - SOL 253577-18064 / PPM 1240079
    end;
    //Helio - SOL Nº 253577/17514 PPM Nº 971383


    { Verificar se o benefício tem abono }

    bPossuiAbono := VerificaSePagaAbonoParticip( qryAux,        qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                               qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                               DateToStr(StrToDate(dtliberacaoGravar)+1),  sDataBenefLimite,   iIdRegraAbono,
                                                                                        cTipoAbono,    bErro,         sMsgErro );


    // edilaine - SOL 253577-18143 / PPM  - inicio 1318908 - inicio
    {busca valores atualiados da Benef}
    qryAux.close;
    qryAux.sql.clear;
    qryAux.sql.Add('SELECT BF.VLRBSTOTAL,  BF.VLRBSATUAL,');
    qryAux.sql.Add('       BF.VLRFABTOTAL, BF.VLRFABATUAL, BF.VLRBASEDEFICIT, ');
    qryAux.sql.Add('       BP.FLGAPRESENTABSFAB,  ');
    qryAux.sql.Add('       BP.FLGAPRESENTADEFICIT ');
    qryAux.sql.Add('  FROM BENEFBFCIARIO BF, BENEFPLANPREV BP    ');
    qryAux.sql.Add(' WHERE (BP.IDPLANOPREV    = BF.IDPLANOPREV)  ');
    qryAux.sql.Add('   AND (BP.IDBENEFICIO    = BF.IDBENEFICIO)  ');
    qryAux.sql.Add('   AND (BF.NUMEROPROCESSO = :NUMEROPROCESSO) ');
    qryAux.sql.Add('   AND (BF.IDSITBENEFICIO <> 3 )             ');
    qryAux.ParamByName('NUMEROPROCESSO').AsString := qryBenef.FieldByName('NUMEROPROCESSO').AsString; //leofuncef - 23052005
    qryAux.Open;

    if qryAux.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1 then
    begin
      rVlrBCDeficit := qryAux.FieldByName('VLRBASEDEFICIT').AsString;
      rVlrBCDeficitAbono := rVlrBCDeficit;
    end;

    if qryAux.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1 then
    begin
      rVlrBSTotal  := qryAux.FieldByName('VLRBSTOTAL').AsString;
      rVlrFABTotal := qryAux.FieldByName('VLRFABTOTAL').AsString;
      rVlrBSAtual  := qryAux.FieldByName('VLRBSATUAL').AsString;
      rVlrFABAtual := qryAux.FieldByName('VLRFABATUAL').AsString;
      rVlrBSTotalAbono   := rVlrBSAtual;
      rVlrFABTotalAbono  := rVlrFABAtual;
    end;
    // edilaine - SOL 253577-18143 / PPM  - inicio 1318908 - fim

    // Andre Imakawa - SIG 121019 - Inicio
    if not AtualizarDataFinalTaxa(qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                      qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,
                                      qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                      qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsInteger,
                                      qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger,
                                      qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,
                                      qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                      qryBenefRecalculo.FieldByName('DATAFINAL').AsString) then
    begin
      MsgDlg('Erro na atualização da data final de dcontribuições.','Erro',mtError,[mbOk,mbHelp],0);
      result := false;
    end;
    // Andre Imakawa - SIG 121019 - Fim

    while sAnoMesAtual <= sAnoMesFinal do
    begin
      frmAguarde.Mostra('Recalculando Mês '+sAnoMesAtual+' para '+qryBenefRecalculo.FieldByName('NOMEBENEFICIARIO').AsString);
      Application.ProcessMessages;

      bErro      := False;
      bReajustou := False;

      // edilaine - SOL 253577-18143 / PPM 1318908 - comentado inicio - passou para fora do loop
      // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
      {busca valores atualiados da Benef}
      {qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.Add('SELECT BF.VLRBSTOTAL,  BF.VLRBSATUAL,');
      qryAux.sql.Add('       BF.VLRFABTOTAL, BF.VLRFABATUAL, BF.VLRBASEDEFICIT, ');
      qryAux.sql.Add('       BP.FLGAPRESENTABSFAB,  ');
      qryAux.sql.Add('       BP.FLGAPRESENTADEFICIT ');
      qryAux.sql.Add('  FROM BENEFBFCIARIO BF, BENEFPLANPREV BP    ');
      qryAux.sql.Add(' WHERE (BP.IDPLANOPREV    = BF.IDPLANOPREV)  ');
      qryAux.sql.Add('   AND (BP.IDBENEFICIO    = BF.IDBENEFICIO)  ');
      qryAux.sql.Add('   AND (BF.NUMEROPROCESSO = :NUMEROPROCESSO) ');
      qryAux.sql.Add('   AND (BF.IDSITBENEFICIO <> 3 )             ');
      qryAux.ParamByName('NUMEROPROCESSO').AsString := qryBenef.FieldByName('NUMEROPROCESSO').AsString; //leofuncef - 23052005
      qryAux.Open;

      if qryAux.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1 then
      begin
        rVlrBCDeficit := qryAux.FieldByName('VLRBASEDEFICIT').AsString;
        rVlrBCDeficitAbono := rVlrBCDeficit;
      end;

      if qryAux.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1 then
      begin
        rVlrBSTotal  := qryAux.FieldByName('VLRBSTOTAL').AsString;     
        rVlrFABTotal := qryAux.FieldByName('VLRFABTOTAL').AsString;
        rVlrBSAtual  := qryAux.FieldByName('VLRBSATUAL').AsString;
        rVlrFABAtual := qryAux.FieldByName('VLRFABATUAL').AsString;
        rVlrBSTotalAbono   := rVlrBSAtual;
        rVlrFABTotalAbono  := rVlrFABAtual;
      end;
      // edilaine - SOL 253577-18064 / PPM 1240079 - fim
      } // edilaine - SOL 253577-18143 / PPM 1318908 - comentado fim - passou para fora do loop


      //Inicio - Helio - SOL Nº 253577/17514 PPM Nº 971383
      if (rVlrBSTotal <> '') then
      begin
        rVlrCalculo := 0;
        bReajustou  := false;
        dValorBeneficioIntegral := 0;

        if (StrToFloat(rVlrBSTotal) > 0) then
        begin
          rVlrCalculo := StrToFloat(rVlrBSTotal);
          rVlrCalculo := CalculaBeneficioAPagarNoMes( qryAux,
                                                     sAnoMesAtual,
                                                     qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger,
                                                     qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                                     qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                                     qryBenefRecalculo.FieldByName('NUMBENEF').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDREGRAPRIMPAGTO').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDREGRAULTPAGTO').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDTPPAGTOBENEFIC').AsInteger,
                                                     qryBenefRecalculo.FieldByName('DATAINICIO').AsString,
                                                     qryBenefRecalculo.FieldByName('DATAFINALREAL').AsString,
                                                     sAnoMesFinal,
                                                     qryBenefRecalculo.FieldByName('FLGCALCTODOMES').AsString,
                                                     rVlrCalculo,
                                                     rVlrCalculo,
                                                     qryBenefRecalculo.FieldByName('VALORCOTAS').AsFloat,
                                                     True, // pbCalculaPrimUltPgto
                                                     qryBenefRecalculo.FieldByName('DATAINICIO').AsString,
                                                     12, // iTipoMov
                                                     qryBenefRecalculo.FieldByName('FLGDATAPREVISTA').AsInteger,
                                                     bErro,
                                                     bReajustou,
                                                     sUltMesReajuste,
                                                     dValorBeneficioIntegral,
                                                     dValorBeneficioIntegralAposMinimo,
                                                     dValorPrevAntesMinimo,
                                                     rVlrBSRateado,
                                                     dValorSRB,
                                                     iIdCalculo,
                                                     sDataFolha, false, pbMigracaoPlano, -1, false, true, true, true // edilaine - SOL 253577-18064 / PPM 1240079
                                                     );
        end;
        rVlrBSMes  := FloatToStr(rVlrCalculo);
        if bReajustou then
           rVlrBSTotal := FloatToStr(dValorBeneficioIntegral);
      end;

      if (rVlrFABTotal <> '')   then
      begin
        rVlrCalculo := 0;
        bReajustou  := false;
        dValorBeneficioIntegral := 0;

        if (StrToFloat(rVlrFABTotal) > 0) then
        begin
          rVlrCalculo := StrToFloat(rVlrFABTotal);
          rVlrCalculo := CalculaBeneficioAPagarNoMes( qryAux,
                                                     sAnoMesAtual,
                                                     qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger,
                                                     qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                                     qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                                     qryBenefRecalculo.FieldByName('NUMBENEF').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDREGRAPRIMPAGTO').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDREGRAULTPAGTO').AsInteger,
                                                     qryBenefRecalculo.FieldByName('IDTPPAGTOBENEFIC').AsInteger,
                                                     qryBenefRecalculo.FieldByName('DATAINICIO').AsString,
                                                     qryBenefRecalculo.FieldByName('DATAFINALREAL').AsString,
                                                     sAnoMesFinal,
                                                     qryBenefRecalculo.FieldByName('FLGCALCTODOMES').AsString,
                                                     rVlrCalculo,
                                                     rVlrCalculo,
                                                     qryBenefRecalculo.FieldByName('VALORCOTAS').AsFloat,
                                                     True, // pbCalculaPrimUltPgto
                                                     qryBenefRecalculo.FieldByName('DATAINICIO').AsString,
                                                     12, // iTipoMov
                                                     qryBenefRecalculo.FieldByName('FLGDATAPREVISTA').AsInteger,
                                                     bErro,
                                                     bReajustou,
                                                     sUltMesReajuste,
                                                     dValorBeneficioIntegral,
                                                     dValorBeneficioIntegralAposMinimo,
                                                     dValorPrevAntesMinimo,
                                                     rVlrFABRateado,
                                                     dValorSRB,
                                                     iIdCalculo,
                                                     sDataFolha, false, pbMigracaoPlano, -1, false, true, true, false // edilaine - SOL 253577-18064 / PPM 1240079
                                                     );
        end;

        rVlrFABMes  := FloatToStr(rVlrCalculo);
        if bReajustou then
           rVlrFABTotal := FloatToStr(dValorBeneficioIntegral);
      end;

      if (rVlrBCDeficit <> '')  then
      begin
        rVlrCalculo := 0;
        bReajustou  := false;
        dValorBeneficioIntegral := 0;

        if (StrToFloat(rVlrBCDeficit) > 0) then
        begin
          rVlrCalculo := StrToFloat(rVlrBCDeficit);
          rVlrCalculo := CalculaBeneficioAPagarNoMes( qryAux,
                                                        sAnoMesAtual,
                                                        qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,
                                                        qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger,
                                                        qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                                        qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,
                                                        qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                                        qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsInteger,
                                                        qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                                        qryBenefRecalculo.FieldByName('NUMBENEF').AsInteger,
                                                        qryBenefRecalculo.FieldByName('IDREGRAPRIMPAGTO').AsInteger,
                                                        qryBenefRecalculo.FieldByName('IDREGRAULTPAGTO').AsInteger,
                                                        qryBenefRecalculo.FieldByName('IDTPPAGTOBENEFIC').AsInteger,
                                                        qryBenefRecalculo.FieldByName('DATAINICIO').AsString,
                                                        qryBenefRecalculo.FieldByName('DATAFINALREAL').AsString,
                                                        sAnoMesFinal,
                                                        qryBenefRecalculo.FieldByName('FLGCALCTODOMES').AsString,
                                                        rVlrCalculo,
                                                        rVlrCalculo,
                                                        qryBenefRecalculo.FieldByName('VALORCOTAS').AsFloat,
                                                        True, // pbCalculaPrimUltPgto
                                                        qryBenefRecalculo.FieldByName('DATAINICIO').AsString,
                                                        12, // iTipoMov
                                                        qryBenefRecalculo.FieldByName('FLGDATAPREVISTA').AsInteger,
                                                        bErro,
                                                        bReajustou,
                                                        sUltMesReajuste,
                                                        dValorBeneficioIntegral,
                                                        dValorBeneficioIntegralAposMinimo,
                                                        dValorPrevAntesMinimo,
                                                        rVlrDeficitRateado,
                                                        dValorSRB,
                                                        iIdCalculo,
                                                        sDataFolha, false, pbMigracaoPlano, -1, false, true, false, true // edilaine - SOL 253577-18064 / PPM 1240079
                                                       );
        end;

        rVlrDeficitMes  := FloatToStr(rVlrCalculo);
        if bReajustou then
           rVlrBCDeficit := FloatToStr(dValorBeneficioIntegral);
      end;
      //Fim - Helio - SOL Nº 253577/17514 PPM Nº 971383


      dValorBeneficioNoMes := CalculaBeneficioAPagarNoMes( qryAux,
                                                           sAnoMesAtual,
                                                           qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,
                                                           qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger,
                                                           qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                                           qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,
                                                           qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                                           qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsInteger,
                                                           qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                                           qryBenefRecalculo.FieldByName('NUMBENEF').AsInteger,
                                                           qryBenefRecalculo.FieldByName('IDREGRAPRIMPAGTO').AsInteger,
                                                           qryBenefRecalculo.FieldByName('IDREGRAULTPAGTO').AsInteger,
                                                           qryBenefRecalculo.FieldByName('IDTPPAGTOBENEFIC').AsInteger,
                                                           qryBenefRecalculo.FieldByName('DATAINICIO').AsString,
                                                           qryBenefRecalculo.FieldByName('DATAFINALREAL').AsString,
                                                           sAnoMesFinal,
                                                           qryBenefRecalculo.FieldByName('FLGCALCTODOMES').AsString,
                                                           dValorEmReal,
                                                           dValorTotal,
                                                           qryBenefRecalculo.FieldByName('VALORCOTAS').AsFloat,
                                                           True, // pbCalculaPrimUltPgto
                                                           qryBenefRecalculo.FieldByName('DATAINICIO').AsString,
                                                           12, // iTipoMov
                                                           qryBenefRecalculo.FieldByName('FLGDATAPREVISTA').AsInteger,
                                                           bErro,
                                                           bReajustou,
                                                           sUltMesReajuste,
                                                           dValorBeneficioIntegral,
                                                           dValorBeneficioIntegralAposMinimo,
                                                           dValorPrevAntesMinimo,
                                                           dValorBenefRateado,
                                                           dValorSRB,
                                                           iIdCalculo,
                                                           sDataFolha,pbMigracaoPlano
                                                           );

       // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
       if bReajustou then
         rValorTotal := FloatToStr(dValorBeneficioIntegral);
       // edilaine - SOL 253577-18064 / PPM 1240079 - fim

       // Andre Imakawa - SIG 121019 - Inicio
       if qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger = 2 then
         dValorBeneficioIntegralAposMinimo := dValorBeneficioNoMes;
       // Andre Imakawa - SIG 121019 - Fim

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT SUM(DECODE(FLGDEVOLUCAO,1,-NVL(VLBENEFPGTO, VALORPREV),  NVL(VLBENEFPGTO,VALORPREV))) AS VALORPAGO '+#13+
                     '   FROM HSTBENEFBFCIARIO '+#13+
                     '  WHERE IDPESSOA       = '+qryBenefRecalculo.FieldByName('IDPESSOA').AsString         +#13+
                     '    AND MESREFERENCIA  = '''+sAnoMesAtual+'''                                     '   +#13+
                     '    AND IDBENEFICIO    = '+qryBenefRecalculo.FieldByName('IDBENEFICIO').AsString      +#13+
                     '    AND NUMEROPROCESSO = '+qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsString   +#13+
                     // Considera somente os valores processados

                     '    AND FLGENVIADO     = 1 ');
      {SOL 157203/4761 - KTN 1268806 - JRM6}

      qryAux.Open;

      if (not qryAux.Eof) and (qryAux.FieldByName('VALORPAGO').AsFloat > 0) then
        dValorPago := qryAux.FieldByName('VALORPAGO').AsFloat
      else
        dValorPago := 0;

      // Andre Imakawa - SIG 19600 - Inicio
      {
      if (Abs(dValorPago-dValorBeneficioNoMes) <= 0.01) then
      begin
        // Neste caso , o histórico não deve ser recalculado, mas se estiver como
        // "retido" ou "fora do convenio", deve ter seu status modificado para
        //  "a Processar" - JRM6
        // Deve também ser agregado ao lote escolhido.
        if qryWork.Active then
           qryWork.Close;

        qryWork.SQL.Clear;
        qryWork.SQL.Add(' UPDATE HSTBENEFBFCIARIO ');
        qryWork.SQL.Add('        SET FLGENVIADO = 0 ,');
        qryWork.SQL.Add('            IDLOTE     = ' + IntToStr(iIdLoteConcessao));
        qryWork.SQL.Add('  WHERE IDPESSOA       = ' + qryBenefRecalculo.FieldByName('IDPESSOA').AsString);
        qryWork.SQL.Add('    AND MESREFERENCIA  = ' + QuotedStr(sAnoMesAtual));
        qryWork.SQL.Add('    AND IDBENEFICIO    = ' + qryBenefRecalculo.FieldByName('IDBENEFICIO').AsString);
        qryWork.SQL.Add('    AND NUMEROPROCESSO = ' + qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsString);
        // 8 - Fora do convenio (tratar como retido)
        // 9 - Retido
        qryWork.SQL.Add('    AND FLGENVIADO    IN (8,9) ');
        qryWork.ExecSqL;

        sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
        //AnoMesAtual := ProximoAnoMes13(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
        continue;
      end;
      }
      // Andre Imakawa - SIG 19600 - Fim

      if dValorPago > dValorBeneficioNoMes then
      begin
        sFlgDevolucao := '1';
        dValorAcerto  := dValorPago - dValorBeneficioNoMes;
      end
      else
      begin
        sFlgDevolucao := '0';
        dValorAcerto  := dValorBeneficioNoMes - dValorPago;
      end;
     {SOL 157203/4761 - KTN 1268806 - JRM6 - vai deletar o registro retido }
      qryWork.Close;
      qryWork.SQL.Clear;
      qryWork.SQL.Add('/* Tratamento do Registro a Processar */');
      qryWork.SQL.Add(' DELETE FROM HSTBENEFBFCIARIO ');
      qryWork.SQL.Add(' WHERE IDPESSOA       = ' + qryBenefRecalculo.FieldByName('IDPESSOA').AsString);
      qryWork.SQL.Add('   AND MESREFERENCIA  = ' + QuotedStr(sAnoMesAtual));
      qryWork.SQL.Add('   AND IDBENEFICIO    = ' + qryBenefRecalculo.FieldByName('IDBENEFICIO').AsString);
      qryWork.SQL.Add('   AND NUMEROPROCESSO = ' + qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsString);
      // 0 - A Processar
      // 8 - Fora do convenio (tratar como retido)
      // 9 - Retido
      qryWork.SQL.Add('   AND FLGENVIADO    IN (0,8,9) ');
//      qryWork.sql.savetofile('c:\Planus\temp\querydel.sql');
      qryWork.ExecSQL;

      {SOL 157203/4761 - KTN 1268806 - JRM6}

      // SIG 125597 Ferrari   trocar a variavel do campo
      if not InsereHstBenefBfciario ( qryAux,
                                      -1,                                                            // 2
                                      qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsInteger,
                                      qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,     // 4
                                      qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,
                                      qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,     //  6
                                      qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,
                                      qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,     //  8
                                      qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger,
                                      qryBenefRecalculo.FieldByName('IDREGRACALCULO').AsInteger,  //  10
                                      3128,   {prmIDMOTIVOFOLHABEN,}    //edilaine SIG124906
                                      qryBenefRecalculo.FieldByName('CODPORTFORMA').AsInteger,    //  12
                                      sAnoMesAtual,                                               //  *13
                                      sAnoMesLote,                                               //  *14    // SOL: 243274 KTN: 583284
                                      qryBenefRecalculo.FieldByName('MATRICULA').AsString,        //  15
                                      qryTitular.FieldByName('INSCRICAONUMERO').AsString,         //  16
                                      '',
                                      dValorAcerto,                                               //  18
                                      dValorBeneficioNoMes,
                                      dValorBeneficioIntegralAposMinimo,                          //  19
                                      0,
                                      0,                                                          //  21
                                      1,
                                      StrToInt(sFlgDevolucao),                                    //  23
                                      iIdLoteConcessao,
                                      sMsgErro,                                                   //  25
                                      sDataFolha,                                                 //  *26
                                      dValorTotal,
                                      dValorSRB,
                                      0,                   //Inicio - Helio - SOL Nº 253577/17514 PPM Nº 971383
                                      0,
                                      0,
                                      0,
                                      0,
                                      -1,
                                      '',
                                      -1,
                                    //  '',      // SIG 125597 Ferrari
                                      iif(sMesAnoMESCOMPREEM = '', sAnoMesAtual , sMesAnoMESCOMPREEM ),     // SIG 125597 Ferrari
                                      False,
                                      rVlrFABMes,
                                      rVlrBSMes,
                                      rVlrDeficitMes,      //Fim - Helio - SOL Nº 253577/17514 PPM Nº 971383
                                      1                    // Andre Imakawa - SIG 19600
                                      , qryBenef.FieldByName('IDPERFILINVEST').AsInteger      // eGdilaine - SIG55933
                                      ) then
        Exit;

        // Andre Imakawa - SIG 121019 - Inicio
        
        if qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1 then
           bErro := ExecutaSP_PreparoContribuicao(qrybenef.fieldbyname('NUMEROPROCESSO').AsInteger,
                                                  qryBenef.fieldByName('IDTITULAR').AsInteger,
                                                  3128,   {prmIDMOTIVOFOLHABEN,}    //edilaine SIG124906
                                                  iIdLoteConcessao,
                                                  'Não',
                                                  sAnoMesPagamento,
                                                  sAnoMesAtual,
                                                  -1,-1,12, sAnoMesAtual
                                                  );
        // Andre Imakawa - SIG 121019 - Fim

        {-----------------------------------------------------------------------------------}
      { Testar condições para pagamento do abono anual de benefício                       }
      {-----------------------------------------------------------------------------------}
      { Se benefício é parametrizado para pagar abono E                                   }
      { [ ( o mês que está sendo calculado neste momento é o mes 12 ) ou                  }
      {   ( Abono é no final do Ano e Estou no mes 12 ) ou                                }
      {   ( Abono é no final do Beneficio e estou no ultimo mes do benefico) ] ou         }
      {   ( Abono é no final do Ano mas o beneficio comecou e acabou no ano anterior ) ou }
      { Entao calcular abono e inserí-lo no historico de beneficio                        }

     If ( bPossuiAbono ) Then
      Begin
        { Verifica se existe o cadastro de mês de pagamento do abono casoexista, }
        { assume-se este mês caso não, asusme-se como o mês 12                   }
        sMesAbono := PagaMesPagAbono( QryAux,qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,
                                      qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                      qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                      sAnoMesAtual,
                                      bEhAntecipacao
                                     );

        // Andre Imakawa - SIG 65688 - Inicio
        {
        //Luiz Carlos - SIG63981 - Inicio
        //if sDataIniciolib > '01/'+sMesAbono+copy(sAnoMesAtual,1,4) then
        //   sMesAbono :=  copy(sDataIniciolib,4,2);
        //Luiz Carlos - SIG63981 - Fim
        }
        // Andre Imakawa - SIG 65688 - Fim

        if Trim(sDataBenefLimite) = '' then
        begin
          //if (Copy(sAnoMesAtual,6,2) = sMesAbono) then  // Andre Imakawa - SIG 65688
          if (Copy(sAnoMesAtual,6,2) = sMesAbono) OR      // Andre Imakawa - SIG 65688
            ((copy(sDataIniciolib,4,2)>sMesAbono) AND (copy(sDataIniciolib,7,4) = Copy(sAnoMesAtual,1,4))) then  // Andre Imakawa - SIG 65688
             bPagaAbono := True
          else
             bPagaAbono := False;
        end
        else
        begin

            if (Copy(sAnoMesAtual,1,4) < Copy(sAnoMesDataFinal,1,4)) and (Copy(sAnoMesAtual,6,2) = sMesAbono)
            then bPagaAbono := True
            else begin
              if (Copy(sAnoMesDataFinal,1,4) < Copy(sAnoMesAtual,1,4)) and (Copy(sAnoMesAtual,6,2) = sMesAbono)
              then bPagaAbono := True
              else begin
                if (cTipoAbono = 'B') and (sAnoMesAtual = sAnoMesDataFinal)
                then bPagaAbono := True
                else
                  if Copy(sAnoMesAtual,6,2) = sMesAbono
                  then bPagaAbono := True
                  else bPagaAbono := False;
              end;

            end;

        end;

      End;


      //Caso esteja no último mês do processo então 
      //verificar se deve ou não pagar o adiantamento de abono.

      bEhAdiantamentoAbono := False;

      If (sAnoMesAtual = sAnoMesFinal) Then
      Begin

        If ( ( bPagaAbono = True ) And ( bEhAntecipacao = True ) ) Then
        Begin

          If FazQuery( QryAux, 'SELECT IDREGRA, PERCENTUAL FROM PARAMANTECIPABONO '+
                               'WHERE IDPESSJUR   = '+ IntToStr( qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger    ) +' AND '+
                               '      IDPLANOPREV = '+ IntToStr( qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger  ) +' AND '+ 
                               '      IDBENEFICIO = '+ IntToStr( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger  ) +' AND '+ 
                               '      SUBSTR(MES,1,4) = '+ QuotedStr( Copy( sAnoMesAtual, 1, 4 )  ) +' '+
                               'ORDER BY MES DESC ' ) Then
          Begin

            sIdRegraAntecipAbono := QryAux.FieldByName('IDREGRA').AsString;

            If Trim( sIdRegraAntecipAbono ) <> '' Then
            Begin

              { Aplicar a regra de antecipação }

              If Trim( sDataBenefLimite ) = ''
              Then sDataFinalAntecip := ' '
              Else sDataFinalAntecip := sDataBenefLimite;

              sSQL := ' SELECT '+
                      IntToStr( qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger )+      ' AS IDTITULAR,   '+
                      IntToStr( qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger )+ ' AS IDPESSOA,    '+
                      IntToStr( qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger )+      ' AS IDPESSJUR,   '+
                      IntToStr( qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger )+    ' AS IDPLANOPREV, '+
                      '1 AS SEQPROPOSTA, '+
                      QryAux.FieldByName('IDREGRA').AsString +' AS REGRANTECIPABONO, '+
                      OraNumero( FormatFloat('#0.00', QryAux.FieldByName('PERCENTUAL').AsFloat) ) + ' AS PERCANTECIPABONO, '+
                      IntToStr( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger )+       ' AS IDBENEFICIO,    '+
                      QuotedStr( sDataIniciolib )+       ' AS DATAINICIO,     '+
                      QuotedStr( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsString )+               ' AS DATAINICIOFUND, '+
                      QuotedStr( sDataFinalAntecip )+  ' AS DATAFINAL,      '+
                      QuotedStr( sDataIniciolib )+       ' AS DATAREF,        '+
                      QuotedStr( sDataFolha )+         ' AS DATAPAGAMENTO,  '+
                      QuotedStr( sAnoMesAtual )+          ' AS MESREFERENCIA,  '+
                      QuotedStr( sAnoMesAtual )+          ' AS ANOMESREF,      '+
                      QuotedStr( sAnoMesAtual )+          ' AS ANOREF,         '+
                      QuotedStr( sAnoMesLote )+        ' AS ANOMESCOBRANCA, '+
                      OraNumero( qryBenefRecalculo.FieldByName('VLRINFINSS').AsString  )+ ' VLRINFINSS,  '+
                      OraNumero( FloatToStr( dValorBenefRateado ) )+ ' AS VLBENEFPGTO, '+
                      OraNumero( FloatToStr( dValorBenefRateado ) )+ ' AS VALORATUAL   '+
                      ' FROM DUAL ';

              Try
                sValorAbono := RegraNumerica( QryAux.FieldByName('IDREGRA').AsString, sSQL ,bErro, iIdCalculoGeral );
              Except
                bErro := True;
                Exit;
              End;

              // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
              if (rVlrBSTotal <> '') and (StrToFloat(rVlrBSTotal) > 0) then
              begin
                sSQL := ' SELECT '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger )+      ' AS IDTITULAR,   '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger )+ ' AS IDPESSOA,    '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger )+      ' AS IDPESSJUR,   '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger )+    ' AS IDPLANOPREV, '+
                        '1 AS SEQPROPOSTA, '+
                        QryAux.FieldByName('IDREGRA').AsString +' AS REGRANTECIPABONO, '+
                        OraNumero( FormatFloat('#0.00', QryAux.FieldByName('PERCENTUAL').AsFloat) ) + ' AS PERCANTECIPABONO, '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger )+       ' AS IDBENEFICIO,    '+
                        QuotedStr( sDataIniciolib )+       ' AS DATAINICIO,     '+
                        QuotedStr( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsString )+               ' AS DATAINICIOFUND, '+
                        QuotedStr( sDataFinalAntecip )+  ' AS DATAFINAL,      '+
                        QuotedStr( sDataIniciolib )+       ' AS DATAREF,        '+
                        QuotedStr( sDataFolha )+         ' AS DATAPAGAMENTO,  '+
                        QuotedStr( sAnoMesAtual )+          ' AS MESREFERENCIA,  '+
                        QuotedStr( sAnoMesAtual )+          ' AS ANOMESREF,      '+
                        QuotedStr( sAnoMesAtual )+          ' AS ANOREF,         '+
                        QuotedStr( sAnoMesLote )+        ' AS ANOMESCOBRANCA, '+
                        OraNumero( qryBenefRecalculo.FieldByName('VLRINFINSS').AsString  )+ ' VLRINFINSS,  '+
                        OraNumero( rVlrBSAtual )+ ' AS VLBENEFPGTO, '+
                        OraNumero( rVlrBSAtual )+ ' AS VALORATUAL   '+
                        ' FROM DUAL ';

                Try
                  rVlrBSTotalAbono := RegraNumerica( QryAux.FieldByName('IDREGRA').AsString, sSQL ,bErro, iIdCalculoGeral );
                Except
                  bErro := True;
                  Exit;
                End;
              end;

              if (rVlrFABTotal <> '') and (StrToFloat(rVlrFABTotal) > 0)  then
              begin
                sSQL := ' SELECT '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger )+      ' AS IDTITULAR,   '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger )+ ' AS IDPESSOA,    '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger )+      ' AS IDPESSJUR,   '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger )+    ' AS IDPLANOPREV, '+
                        '1 AS SEQPROPOSTA, '+
                        QryAux.FieldByName('IDREGRA').AsString +' AS REGRANTECIPABONO, '+
                        OraNumero( FormatFloat('#0.00', QryAux.FieldByName('PERCENTUAL').AsFloat) ) + ' AS PERCANTECIPABONO, '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger )+       ' AS IDBENEFICIO,    '+
                        QuotedStr( sDataIniciolib )+       ' AS DATAINICIO,     '+
                        QuotedStr( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsString )+               ' AS DATAINICIOFUND, '+
                        QuotedStr( sDataFinalAntecip )+  ' AS DATAFINAL,      '+
                        QuotedStr( sDataIniciolib )+       ' AS DATAREF,        '+
                        QuotedStr( sDataFolha )+         ' AS DATAPAGAMENTO,  '+
                        QuotedStr( sAnoMesAtual )+          ' AS MESREFERENCIA,  '+
                        QuotedStr( sAnoMesAtual )+          ' AS ANOMESREF,      '+
                        QuotedStr( sAnoMesAtual )+          ' AS ANOREF,         '+
                        QuotedStr( sAnoMesLote )+        ' AS ANOMESCOBRANCA, '+
                        OraNumero( qryBenefRecalculo.FieldByName('VLRINFINSS').AsString  )+ ' VLRINFINSS,  '+
                        OraNumero( rVlrFABAtual )+ ' AS VLBENEFPGTO, '+
                        OraNumero( rVlrFABAtual )+ ' AS VALORATUAL   '+
                        ' FROM DUAL ';

                Try
                  rVlrFABTotalAbono := RegraNumerica( QryAux.FieldByName('IDREGRA').AsString, sSQL ,bErro, iIdCalculoGeral );
                Except
                  bErro := True;
                  Exit;
                End;
              end;

              if (rVlrBCDeficit <> '') and (StrToFloat(rVlrBCDeficit) > 0) then
              begin
                sSQL := ' SELECT '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger )+      ' AS IDTITULAR,   '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger )+ ' AS IDPESSOA,    '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger )+      ' AS IDPESSJUR,   '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger )+    ' AS IDPLANOPREV, '+
                        '1 AS SEQPROPOSTA, '+
                        QryAux.FieldByName('IDREGRA').AsString +' AS REGRANTECIPABONO, '+
                        OraNumero( FormatFloat('#0.00', QryAux.FieldByName('PERCENTUAL').AsFloat) ) + ' AS PERCANTECIPABONO, '+
                        IntToStr( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger )+       ' AS IDBENEFICIO,    '+
                        QuotedStr( sDataIniciolib )+       ' AS DATAINICIO,     '+
                        QuotedStr( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsString )+               ' AS DATAINICIOFUND, '+
                        QuotedStr( sDataFinalAntecip )+  ' AS DATAFINAL,      '+
                        QuotedStr( sDataIniciolib )+       ' AS DATAREF,        '+
                        QuotedStr( sDataFolha )+         ' AS DATAPAGAMENTO,  '+
                        QuotedStr( sAnoMesAtual )+          ' AS MESREFERENCIA,  '+
                        QuotedStr( sAnoMesAtual )+          ' AS ANOMESREF,      '+
                        QuotedStr( sAnoMesAtual )+          ' AS ANOREF,         '+
                        QuotedStr( sAnoMesLote )+        ' AS ANOMESCOBRANCA, '+
                        OraNumero( qryBenefRecalculo.FieldByName('VLRINFINSS').AsString  )+ ' VLRINFINSS,  '+
                        OraNumero( rVlrBCDeficit )+ ' AS VLBENEFPGTO, '+
                        OraNumero( rVlrBCDeficit )+ ' AS VALORATUAL   '+
                        ' FROM DUAL ';

                Try
                  rVlrBCDeficitAbono := RegraNumerica( QryAux.FieldByName('IDREGRA').AsString, sSQL ,bErro, iIdCalculoGeral );
                Except
                  bErro := True;
                  Exit;
                End;
              end;
              // edilaine - SOL 253577-18064 / PPM 1240079 - fim


            End Else Begin

              { Apilcar o percentual direto no valor }

              rValorAbono := ( dValorBenefRateado * (QryAux.FieldByName('PERCENTUAL').AsFloat / 100) );
              sValorAbono := FloatToStr( rValorAbono );

              // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
              if (rVlrBSTotal <> '') and (StrToFloat(rVlrBSTotal) > 0) then
              begin
                rVlrCalculo :=  StrToFloat(rVlrBSAtual);
                rVlrCalculo := ( rVlrCalculo * (QryAux.FieldByName('PERCENTUAL').AsFloat / 100) );
                rVlrBSTotalAbono := FloatToStr(rVlrCalculo);
              end;

              if  (rVlrFABTotal <> '') and (StrToFloat(rVlrFABTotal) > 0)  then
              begin
                rVlrCalculo :=  StrToFloat(rVlrFABAtual);
                rVlrCalculo := ( rVlrCalculo * (QryAux.FieldByName('PERCENTUAL').AsFloat / 100) );
                rVlrFABTotalAbono := FloatToStr(rVlrCalculo);
              end;

              if (rVlrBCDeficit <> '') and (StrToFloat(rVlrBCDeficit) > 0) then
              begin
                rVlrCalculo :=  StrToFloat(rVlrBCDeficit);
                rVlrCalculo := ( rVlrCalculo * (QryAux.FieldByName('PERCENTUAL').AsFloat / 100) );
                rVlrBCDeficitAbono := FloatToStr(rVlrCalculo);
              end;
              // edilaine - SOL 253577-18064 / PPM 1240079 - fim

            End; 

            bEhAdiantamentoAbono := True;
            bPagaAbono           := True;

          End;


        End;

      End;

      If ( bPagaAbono ) Then
      Begin


        //sDataInicioParaAbono := qryBenefRecalculo.FieldByName('DATAINICIOFUND').AsString; // Andre Imakawa - SIG 65688
        //sDataInicioParaAbono := sDataIniciolib;                                           // Andre Imakawa - SIG 65688
        sDataInicioParaAbono := dtliberacaoGravar;                                          // Andre Imakawa - SIG 65874

        //edilaine SIG121019 : inicio
        If bEhAdiantamentoAbono = False Then
        begin
          if (qryBenefRecalculo.FieldByName('IDTITULAR').AsString <> qryBenefRecalculo.FieldByName('IDPESSOA').AsString) or
             (qryBenefRecalculo.FieldByName('FLGINVALIDEZ').AsInteger = 1) then
          begin
            //verifica a DIB
            if qryBenefRecalculo.FieldByName('DIBBENEFANT').AsDateTime < StrToDate('17/01/'+copy(dtliberacaoGravar,7,4)) then
               sDataInicioParaAbono := qryBenefRecalculo.FieldByName('DIBBENEFANT').AsString;

             if sDataInicioParaAbono = '' then
               sDataInicioParaAbono := qryBenefRecalculo.FieldByName('DATAINICIO').AsString; // Andre Imakawa - SIG SIG121019

          end
          else
          begin
            //verifica a DIP
            if qryBenefRecalculo.FieldByName('DATAINICIO').AsDateTime < StrToDate('17/01/'+copy(dtliberacaoGravar,7,4)) then
               sDataInicioParaAbono := qryBenefRecalculo.FieldByName('DATAINICIO').AsString;
          end;
        end;
        //edilaine SIG121019 : fim

        //edilaine SIG124870 : inicio
        if (qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 2) and
           (copy(sAnoMesAtual, 1, 4) = copy(sAnoMesFinal, 1, 4)) then
        begin
          If FazQuery( QryAux, 'SELECT IDREGRA, PERCENTUAL, '+
                               '       (SELECT  MESABONOINSS FROM PARAMAPREV) AS ABONO '+
                               '  FROM PARAMANTECIPABONO  '+
                               'WHERE IDPESSJUR   = '+ IntToStr( qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger    ) +' AND '+
                               '      IDPLANOPREV = '+ IntToStr( qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger  ) +' AND '+
                               '      IDBENEFICIO = '+ IntToStr( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger  ) +' AND '+
                               '      SUBSTR(MES,1,4) = '+ QuotedStr( Copy( sAnoMesAtual, 1, 4 )  ) +' '+
                               'ORDER BY MES DESC ' ) Then
          begin
            if (copy(sAnoMesFinal,6,2) < QryAux.FieldByName('ABONO').AsString) and
               (QryAux.FieldByName('IDREGRA').AsString <> '') then
               iIdRegraAbono := QryAux.FieldByName('IDREGRA').AsInteger;
          end;
        end;
        //edilaine SIG124870 : fim



        { No caso de migração de beneficios, o Abono deve ser calculado com base }
        { na DATAINICIO do beneficios origem da migração.                        }
        If pbMigracaoPlano Then Begin
          sDataInicioParaAbono := qryBenefRecalculo.FieldByName('DIBBENEFANT').AsString;
        End;

        { Caso seja adiantamento (ultimo mês processado) o valor do abono }
        { já foi calculado no adiantamento.                               }
        If bEhAdiantamentoAbono = False Then
        Begin

          //edilaine SIG121019 : inicio
          qryAux.close;
          qryAux.sql.clear;
          qryAux.SQl.Add(' SELECT SUM(DECODE(FLGDEVOLUCAO,1,-VLBENEFPGTO,VLBENEFPGTO)) AS VLBENEFPGTO, '+
                         '        MAX(NVL(VALORBS,0))  AS VALORBS,             '+
                         '        MAX(NVL(VALORFAB,0)) AS VALORFAB,            '+
                         '        MAX(NVL(VLRBASEDEFICIT,0)) AS VLRBASEDEFICIT, '+
                         '        SUM(DECODE(FLGTIPOREGISTRO,2,1,3,1,0)) AS FLGTIPOREGISTRO '+
                         ' FROM   HSTBENEFBFCIARIO '+
                         ' WHERE  (IDPESSOA       = '+qryBenefRecalculo.fieldbyname('IDPESSOA').text      +')'+
                         ' AND    (MESREFERENCIA  = '''+Copy(sAnoMesAtual,1,4)+'/13'+''')'+
                         ' AND    (IDBENEFICIO    = '+qryBenefRecalculo.fieldbyname('IDBENEFICIO').text+')'+
                         ' AND    (NVL(VLBENEFPGTO,0) > 0 )'+
                         ' AND    (NUMEROPROCESSO = '+ qryBenefRecalculo.fieldbyname('NUMEROPROCESSO').text+')');
          qryAux.open;
          if not qryAux.isEmpty then
          begin
            rVlrAntecAbono := qryAux.FieldByName('VLBENEFPGTO').AsFloat;
            if (rVlrAntecAbono <> 0) and (rVlrAntecAbono < dValorTotal) then
            begin
              AjustaAbonoPago(qryBenefRecalculo,
                              sAnoMesAtual, sAnoMesLote, sDataPagamento,
                              qryAux.FieldByName('VALORBS').AsString,
                              qryAux.FieldByName('VALORFAB').AsString,
                              qryAux.FieldByName('VLRBASEDEFICIT').AsString,
                              dValorSRB,
                              rVlrAntecAbono);
            end;                               
          end;

          {if not qryAux.isEmpty then
          begin
            rVlrBSAbono      := qryAux.FieldByName('VALORBS').AsFloat;
            rVlrFABAbono     := qryAux.FieldByName('VALORFAB').AsFloat;
            rVlrDeficitAbono := qryAux.FieldByName('VLRBASEDEFICIT').AsFloat;
            rVlrAntecAbono   := qryAux.FieldByName('VLBENEFPGTO').AsFloat;
          end
          else
          begin
            rVlrBSAbono      := 0;
            rVlrFABAbono     := 0;
            rVlrDeficitAbono := 0;
            rVlrAntecAbono   := 0;
          end;          }
          rVlrCalcAbono := dValorTotal - rVlrAntecAbono;    //edilaine SIG121019
          //edilaine SIG121019 : inicio


          // Calculo do abono do BS Fab e Deficit
          //Inicio - Helio - SOL Nº 253577/17514 PPM Nº 971383
          if (rVlrBSTotal <> '') and (StrToFloat(rVlrBSTotal) > 0) then
          begin
             //rVlrCalculo :=  StrToFloat(rVlrBSTotalAbono);    // edilaine - SOL 253577-18064 / PPM 1240079      // edilaine - SOL 253577-18143 / PPM 1318908 - comentado
             rVlrCalculo :=  ExecutaRegraValorAbono ( qryAux,
                                                      iIdRegraAbono,
                                                      qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,      qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                                      qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,       qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                                      qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger, qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                                      sDataInicioParaAbono,
                                                      sDataBenefLimite,
                                                      sAnoMesAtual,
                                                      //rVlrBSRateado, //rVlrCalculo , { Para Regra de Abono, passar valor do BS total}      // edilaine - SOL 253577-18143 / PPM 1318908
                                                      (rVlrBSRateado - rVlrBSAbono),                                                //edilaine SIG121019
                                                      qryBenefRecalculo.FieldByName('FLGPROVISORIO').AsString,
                                                      bErro,
                                                      sMsgErro,
                                                      iIdCalculoGeral,
                                                      12,
                                                      iTotBeneficiariosValidos
                                                      sDataInicioParaAbono,
                                                      // dValorTotal,       //edilaine SIG121019
                                                      rVlrCalcAbono,        //edilaine SIG121019
                                                      sAnoMesLote
                                                    );

             if bErro
             then Exit;

             rVlrBSTotalAbono := FloatToStr(rVlrCalculo);
          end;

          if  (rVlrFABTotal <> '') and (StrToFloat(rVlrFABTotal) > 0)  then
          begin
             //rVlrCalculo :=  StrToFloat(rVlrFABTotalAbono);    // edilaine - SOL 253577-18064 / PPM 1240079        // edilaine - SOL 253577-18143 / PPM 1318908 - comentado
             rVlrCalculo :=  ExecutaRegraValorAbono ( qryAux,
                                                      iIdRegraAbono,
                                                      qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,      qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                                      qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,       qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                                      qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger, qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                                      sDataInicioParaAbono,
                                                      sDataBenefLimite,
                                                      sAnoMesAtual,
                                                      //rVlrFABRateado,     //rVlrCalculo, { Para Regra de Abono, passar valor do fab total}       // edilaine - SOL 253577-18143 / PPM 1318908
                                                      (rVlrFABRateado - rVlrFABAbono),                                              //edilaine SIG121019
                                                      qryBenefRecalculo.FieldByName('FLGPROVISORIO').AsString,
                                                      bErro,
                                                      sMsgErro,
                                                      iIdCalculoGeral,
                                                      12,
                                                      iTotBeneficiariosValidos
                                                      sDataInicioParaAbono,
                                                      //dValorTotal,         //edilaine SIG121019
                                                      rVlrCalcAbono          //edilaine SIG121019
                                                      sAnoMesLote
                                                    );

             if bErro
             then Exit;

             rVlrFABTotalAbono := FloatToStr(rVlrCalculo);
          end;


          if (rVlrBCDeficit <> '') and (StrToFloat(rVlrBCDeficit) > 0) then
          begin
             rVlrCalculo :=  ExecutaRegraValorAbono ( qryAux,
                                                      iIdRegraAbono,
                                                      qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,      qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                                      qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,       qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                                      qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger, qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                                      sDataInicioParaAbono,
                                                      sDataBenefLimite,
                                                      sAnoMesAtual,
                                                      //rVlrCalculo, { Para Regra de Abono, passar valor do deficit }  //edilaine SIG121019 
                                                      rVlrDeficitRateado - rVlrDeficitAbono,                           //edilaine SIG121019
                                                      qryBenefRecalculo.FieldByName('FLGPROVISORIO').AsString,
                                                      bErro,
                                                      sMsgErro,
                                                      iIdCalculoGeral,
                                                      12,
                                                      iTotBeneficiariosValidos
                                                      sDataInicioParaAbono,
                                                      // dValorTotal,        //edilaine SIG121019
                                                      rVlrCalcAbono,         //edilaine SIG121019
                                                      sAnoMesLote
                                                    );
             if bErro
             then Exit;

             rVlrBCDeficitAbono := FloatToStr(rVlrCalculo);
          end;
          //Fim - Helio - SOL Nº 253577/17514 PPM Nº 971383

          rValorAbono :=  ExecutaRegraValorAbono ( qryAux,
                                                   iIdRegraAbono,
                                                   qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,      qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                                   qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,       qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                                   qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger, qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                                   sDataInicioParaAbono,
                                                   sDataBenefLimite,
                                                   sAnoMesAtual,
                                                   //dValorBenefRateado, { Para Regra de Abono, passar valor do Beneficio Final, rateado }  //edilaine SIG121019
                                                   dValorBenefRateado  - rVlrAntecAbono,                       //edilaine SIG121019
                                                   qryBenefRecalculo.FieldByName('FLGPROVISORIO').AsString,
                                                   bErro,
                                                   sMsgErro,
                                                   iIdCalculoGeral,
                                                   12,
                                                   iTotBeneficiariosValidos
                                                   sDataInicioParaAbono,
                                                   // dValorTotal,       //edilaine SIG121019
                                                   rVlrCalcAbono,        //edilaine SIG121019
                                                   sAnoMesLote
                                                 );

          if bErro
          then Exit
          else sValorAbono := OraNumero(FloatToStr(rValorAbono));

          if iIdRegraAbono > 0
          then sIdRegraCalculo := IntToStr( iIdRegraAbono )
          else sIdRegraCalculo := ' NULL ';

        End
        Else 
        Begin

          If ( Trim( sIdRegraAntecipAbono ) <> '' )
          Then sIdRegraCalculo := sIdRegraAntecipAbono
          Else sIdRegraCalculo := ' NULL ';

        End; 

        sAnoMesPagAbono := sAnoMesLote;
        sAnoMesRefAbono := Copy(sAnoMesAtual,1,4)+'/13';

        { Verifica se o adiantamento de abono e o abono estão sendo inseridos no mesmo cálculo. }
        { Caso estejam, deleta os adiantamentos e lança apenas o abono                          }
        qryaux.close;
        qryaux.sql.text := ' DELETE HSTBENEFBFCIARIO '+
                           ' WHERE (IDPESSOA       = '+IntToStr(qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger)+') '+
                           ' AND   (MESREFERENCIA  = '''+sAnoMesRefAbono+'''       ) '+
                           ' AND   (MES            = '''+sAnoMesPagAbono+'''       ) '+
                           ' AND   (IDBENEFICIO    = '+IntToStr(qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger)+'   ) '+
                           ' AND   (NUMEROPROCESSO = '+IntToStr(qryBenef.FieldByName('NUMEROPROCESSO').AsInteger)+') '+
                           ' AND   FLGDEVOLUCAO = 0 '+   //edilaine SIG121019
                           ' AND   FLGENVIADO = 0  ';    //edilaine SIG121019
                           //' AND   TRUNC(TRGDTINCLUSAO) = TRUNC(SYSDATE) ';
        try
          qryAux.ExecSQL;
        except
        //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
        on e:Exception do
        begin
          TratarErro(e.Message);
          bErro := True;
          sMsgErro := 'Erro na deleção de adiantamentos de abono no mesmo processo.';
          Exit;
        end;
        //Brunno Mattos - KTN 767861 - SOL 132659 Fim
        end;

        sFlgDevolucao        := '0';

        { Verificar se uma parte do abono já foi paga em algum mês. Se foi, então }
        { inserir apenas a diferença                                              }
        With QryAux Do
        Begin
          { Caso Liberação, excluir preparo existente }
          {

            sSQL := ' DELETE '+
                    ' FROM   HSTBENEFBFCIARIO '+
                    ' WHERE  (IDPESSOA       = '+IntToStr ( qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger ) +')'+
                    ' AND    (MESREFERENCIA  = '+QuotedStr( sAnoMesRefAbono )  +')'+
                    ' AND    (MES            = '+QuotedStr( sAnoMesLote )      +')'+
                    ' AND    (IDBENEFICIO    = '+IntToStr ( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger )    +')'+
                    ' AND    (NUMEROPROCESSO = '+IntToStr ( qryBenef.FieldByName('NUMEROPROCESSO').AsInteger ) +')'+
                    ' AND    FLGDEVOLUCAO = 0 '+   //edilaine SIG121019
                    ' AND    (VLBENEFPGTO <= 0 OR VLBENEFPGTO IS NULL) ' ;
             ExecutarQuery(QryAux, sSQL);
          }

          {SOL 157203/4761 - KTN 1268806 - JRM6 - vai deletar o registro retido }
          qryWork.Close;
          qryWork.SQL.Clear;
          qryWork.SQL.Add('/* Tratamento do Registro a Processar */');
          qryWork.SQL.Add(' DELETE FROM HSTBENEFBFCIARIO ');
          qryWork.SQL.Add(' WHERE IDPESSOA       = ' + qryBenefRecalculo.FieldByName('IDPESSOA').AsString);
          qryWork.SQL.Add('   AND MESREFERENCIA  = ' + QuotedStr(sAnoMesRefAbono));
          qryWork.SQL.Add('   AND IDBENEFICIO    = ' + qryBenefRecalculo.FieldByName('IDBENEFICIO').AsString);
          qryWork.SQL.Add('   AND NUMEROPROCESSO = ' + qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsString);
          // 0 - A Processar
          // 8 - Fora do convenio (tratar como retido)
          // 9 - Retido
          qryWork.SQL.Add('   AND FLGENVIADO    IN (8,9) ');                    //edilaine SIG121019
          //qryWork.SQL.Add('   AND FLGENVIADO    IN (0,8,9) ');                //edilaine SIG121019
          //qryWork.SQL.Add(' AND   TRUNC(TRGDTINCLUSAO) <> TRUNC(SYSDATE) ');  //edilaine SIG121019
          //qryWork.sql.savetofile('c:\Planus\temp\querydel.sql');
          qryWork.ExecSQL;

          {SOL 157203/4761 - KTN 1268806 - JRM6}

        End; 


        if dValorBeneficioIntegralAposMinimo > 0
        then dValorPrevAntesMinimo := StrToFloat(ClienteNumero(sValorAbono)) * dValorPrevAntesMinimo / dValorBeneficioIntegralAposMinimo
        else dValorPrevAntesMinimo := StrToFloat(ClienteNumero(sValorAbono));

        If StrToFloat(ClienteNumero(sValorAbono)) >  0 then
        begin

          iSeqBeneficio := PegaSeqBeneficio(qryAux,
                                            qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,     qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,
                                            qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,   qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger,
                                            qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,   qryBenef.FieldByName('NUMEROPROCESSO').AsInteger,
                                            qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,   12,
                                            sAnoMesPagAbono, sAnoMesRefAbono);

          If qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger = qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger
          Then dValorBeneficioIntegralAposMinimo := dValorBeneficioIntegral
          Else dValorBeneficioIntegralAposMinimo := dValorBenefRateado;

          { Caso seja concessão, beneficio do INSS e a fundação pague o beneficio.   }
          { Então entre a DIB e a DIP preparar com FLGENVADO 8 (não pagar)           }
          iFlgEnviado := 0;

          If not InsereHstBenefBfciario( QryAux,
                                         qryBenef.FieldByName('NUMEROPROCESSO').AsInteger,
                                         qryBenef.FieldByName('NUMEROPROCESSO').AsInteger, qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                         qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,      qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                         qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,      qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                         qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger, 	  qryBenef.FieldByName('IDREGRACALCULO').AsInteger,
                                         3128,  {3008,}   {12,}       // edilaine - SOL 253577-17514 / PPM 971383    //edilaine SIG124906
                                         qryBenefRecalculo.FieldByName('CODPORTFORMA').AsInteger,
                                         sAnoMesRefAbono,  sAnoMesPagAbono,
                                         '',
                                         '',
                                         '',
                                         StrToFloat( ClienteNumero( sValorAbono ) ),
                                         StrToFloat( ClienteNumero( sValorAbono ) ),
                                         dValorBeneficioIntegralAposMinimo,
                                         0,
                                         iFlgEnviado,
                                         1,
                                         StrToInt( sFlgDevolucao ),
                                         iIdLoteConcessao,
                                         sMsgErro,
                                         sDataPagamento,
                                         dValorTotal ,
                                         dValorSRB,
                                         0,
                                         dValorPrevAntesMinimo,
                                         rValorBase1,
                                         rValorBase2,
                                         rValorBase3,
                                         iIdTitBenef,
                                         sAnoMesAtual,
                                         12,
                                      //   '',
                                         iif(sMesAnoMESCOMPREEM = '', sAnoMesAtual , sMesAnoMESCOMPREEM ),     // SIG 125597 Ferrari
                                         false,
                                         rVlrFABTotalAbono,     // Helio - SOL Nº 253577/17514 PPM Nº 971383
                                         rVlrBSTotalAbono,      // Helio - SOL Nº 253577/17514 PPM Nº 971383
                                         rVlrBCDeficitAbono,    // Helio - SOL Nº 253577/17514 PPM Nº 971383
                                         0, qryBenef.FieldByName('IDPERFILINVEST').AsInteger      // eGdilaine - SIG55933
                                         )
          Then Begin
                bErro := True;
                sMsgErro := 'Erro na gravação do abono . ';
                Exit;
          End;

          // Andre Imakawa - SIG 121019 - Inicio
          //if qryBenef.fieldByName('IDTITULAR').AsInteger = qryBenef.fieldByName('IDPESSOA').AsInteger then
            if qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1 then
               bErro := ExecutaSP_PreparoContribuicao(qrybenef.fieldbyname('NUMEROPROCESSO').AsInteger,
                                                      qryBenef.fieldByName('IDTITULAR').AsInteger,
                                                      3128,   {prmIDMOTIVOFOLHABEN,}    //edilaine SIG124906
                                                      iIdLoteConcessao,
                                                      'Não',
                                                      sAnoMesPagamento,
                                                      sAnoMesRefAbono,
                                                      -1,-1,12, sAnoMesRefAbono
                                                      );
          // Andre Imakawa - SIG 121019 - Fim                                                      

        End;
      End;

      // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
      If (sAnoMesAtual = sAnoMesFinal) Then
      begin
        qryAux.close;
        qryAux.SQL.clear;
        qryAux.Sql.Add(' UPDATE BENEFBFCIARIO SET ' +
                       '        VALORTOTAL  = ' + '''' + rValorTotal + ''' ' +
                       '       ,VALORATUAL  = ' + '''' + FloatToStr(dValorBeneficioNoMes) + ''' ' +
                       '       ,VLRBSTOTAL  = ' + '''' + rVlrBSTotal + '''  ' +
                       '       ,VLRBSATUAL  = ' + '''' + rVlrBSMes + '''  ' +
                       '       ,VLRFABTOTAL = ' + '''' + rVlrFABTotal + ''' ' +
                       '       ,VLRFABATUAL = ' + '''' + rVlrFABMes + ''' ' +
                       '       ,VLRBASEDEFICIT  = ' + '''' + rVlrDeficitMes + ''' ' +
                       '  WHERE SEQPROPOSTA    = ' + qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsString   +
                       '    AND IDPLANOPREV    = ' + qryBenefRecalculo.FieldByName('IDPLANOPREV').AsString  +   // iIdPlanoPrev,
                       '    AND IDPESSJUR      = ' + qryBenefRecalculo.FieldByName('IDPESSJUR').AsString    +   // iIdPessJur,
                       '    AND IDPESSOA       = ' + qryBenefRecalculo.FieldByName('IDPESSOA').AsString     +   // iIdPessoa,
                       '    AND IDTITULAR      = ' + qryBenefRecalculo.FieldByName('IDTITULAR').AsString    +   // iIdTitular,
                       '    AND IDBENEFICIO    = ' + qryBenefRecalculo.FieldByName('IDBENEFICIO').AsString  +   // IdBeneficio
                       '    AND NUMEROPROCESSO = ' + qryBenef.FieldByName('NUMEROPROCESSO').AsString); // NumeroProcesso
        try
          qryAux.ExecSQL;
        except
          MsgDlg('Ocorreu um erro ao atualizar os valores do BS, FAB e Base do Déficit.', 'Informação', mtInformation, [mbOK], 0);
          result := false;
        end;
      end;
      // edilaine - SOL 253577-18064 / PPM 1240079 - fim

      // Andre Imakawa - SIG 121019 - Inicio
      {
      // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
      if not AtualizarDataFinalTaxa(qryBenefRecalculo.FieldByName('IDPLANOPREV').AsInteger,
                                    qryBenefRecalculo.FieldByName('IDPESSJUR').AsInteger,
                                    qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger,
                                    qryBenefRecalculo.FieldByName('NUMEROPROCESSO').AsInteger,
                                    qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger,
                                    qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger,
                                    qryBenefRecalculo.FieldByName('SEQPROPOSTA').AsInteger,
                                    qryBenefRecalculo.FieldByName('DATAFINAL').AsString) then
      begin
        MsgDlg('Erro na atualização da data final de dcontribuições.','Erro',mtError,[mbOk,mbHelp],0);
        result := false;
      end;
      // edilaine - SOL 253577-18143 / PPM 1318908 - fim
      }
      // Andre Imakawa - SIG 121019 - Fim      

      (**)
       sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
       //sAnoMesAtual := ProximoAnoMes13(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
    end;
    qryBenefRecalculo.Next;
  end;

  //edilaine SIG121019 : inicio
  {// SOL: 215159 KTN: 2044027
  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' DELETE FROM HSTCONTRIBPREV   HST '+
            ' WHERE HST.IDPLANOPREV = '+ sIdPlanoPrev+
            ' AND HST.IDPESSOA = '+ qryBenef.FieldByName('IDPESSOA').AsString+
            ' AND HST.IDLOTE = '+ IntToStr(iIdLoteConcessao)+
            ' AND HST.SITRECEBIMENTO = 0 '+
            ' AND HST.MESREFERENCIA >= '+ QuotedStr(sAnoMesPagamento)) ;
    ExecSQL;
  end;
  }// SOL: 215159 KTN: 2044027
  {
  qryAux.close;
  qryAux.sql.text := 'UPDATE HSTCONTRIBPREV   '+
                     '   SET FLGCONCESSAO   = 1'+
                     ' WHERE IDPLANOPREV    = '+ sIdPlanoPrev+
                     '   AND IDPESSOA       = '+ qryBenef.FieldByName('IDPESSOA').AsString+
                     '   AND IDLOTE         = '+ IntToStr(iIdLoteConcessao)+
                     '   AND SITRECEBIMENTO = 0 '+
                     '   AND FLGDEVOLUCAO   = 1 '+
                     '   AND FLGCONCESSAO   = 0 '+
                     '   AND MESCOBRANCA    = '+ QuotedStr(sAnoMesPagamento) ;
  qryAux.ExecSQL;

  }
  {
  if qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger <> qryBenefRecalculo.FieldByName('IDTITULAR').AsInteger then
    //Inicio - Helio - SOL Nº 253577/17514 PPM Nº 971383
    if qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1 then
       bErro := ExecutaSP_PreparoContribuicao(qryBenef.FieldByName('NumeroProcesso').AsInteger,
                                              qryBenef.fieldByName('IDTITULAR').AsInteger,
                                              prmIDMOTIVOFOLHABEN,
                                              iIdLoteConcessao,
                                              '0',
                                              sAnoMesPagamento,
                                              '',
                                              -1,-1, 5    //edilaine SIG121019
                                              );

  }
  //edilaine SIG121019 : fim
  if bErro then
     Exit;

  {if not GeraContribBenef( dtmAPrev.qryAux,
                          qryContrib,
                          qryAux,
                          strConcedidos,
                          qrybenef.fieldbyname('NUMEROPROCESSO').AsInteger,
                          iIdLoteConcessao,
                          sAnoMesPagamento,
                          '',
                          sAnoMesInicio,    // sAnoMesInicio
                          '',               // sMotivoAtraso
                          iIdLoteConcessao, // iIdLoteRevisao
                          ''  ) then        // DataEncerramento
    Exit;  }

  //Fim - Helio - SOL Nº 253577/17514 PPM Nº 971383

  frmAguarde.Apaga;
  Result := True;
end; // RecalculaBeneficiarios



procedure TfrmCadInicioBenefExigencia.qryBenefDTINICIOLIBERACAOChange(sender: TField);
begin
  inherited;
  sDataInicioliberacao := qryBenefDTINICIOLIBERACAO.asstring ; //Wylliam Silva Kintana: 1268806 SOL: 157203/4761
end;



//Helio - SOL Nº 253577/17514 PPM Nº 971383 - inicio
procedure TfrmCadInicioBenefExigencia.GeraDemonstrativo(sDataHoraInicioProcesso, sProcessos : string;
                                                        sStatusDemonstrativo : string = '' );     // edilaine - SOL 253577-18174 / PPM 1327585

var
  iIdReport : integer;
  iOrigemcm : integer;
  sMensagem : String;
  sSituacao : string;
begin
  frmAguarde.Mostra('Preparando o Demonstrativo de Liberação...');

  // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
  {qryAux.close;
  qryAux.sql.Text := 'Select idreports, origemcm from reports where idmodulo = 454 and name = ''Demonstrativos de Benefícios'' ';
  qryAux.Open;
  if not qryAux.IsEmpty then
  begin
    iIdReport  := qryAux.Fields[0].AsInteger;
    iOrigemCm  := qryAux.Fields[1].AsInteger;
    sSituacao  := '';
    //sProcessos := stringReplace(sNumeroProcesso, '''', '', [rfReplaceAll]);

    if not TRptDemonstraBeneficios.PrintReport(iIdReport,1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                               'Liberação'                + '|=| ' +   // tipo operacao
                                               DateToStr(date)            + '|=| ' +   // data
                                               sProcessos                 + '|=| ' +   // numprocesso
                                               IntToStr(iIdLoteConcessao) + '|=| ' +   // numLote
                                               ''                         + '|=| ' +   // Titulo Motivo
                                               sSituacao                  + '|=| ' +   // Situacao
                                               sDataHoraInicioProcesso    + '|=| ' +   // DtHora Inicio Processo
                                               ''                         + '|=| ' +   // motivo
                                               qryBenef.FieldByName('IDPESSOA').AsString + '|   ', // idpessoa
                                               '',
                                               'BaseDados',
                                               Sistema.NomeEmpresa,
                                               Sistema.NomeModulo,
                                               sMensagem) then
       MsgDlg(sMensagem, 'Impressão do Demonstrativo de Liberação.', mtError, [], 0);
  end;
  }// edilaine - SOL 253577-18174 / PPM 1327585 - fim

  // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
  try
    RptDemonstraBeneficios :=  TRptDemonstraBeneficios.create(self);
    with RptDemonstraBeneficios do
    begin
      CmpRptCM.ParamValues[0].AsString  := 'Liberação';
      CmpRptCM.ParamValues[1].AsString  := DateToStr(date);
      CmpRptCM.ParamValues[2].AsString  := sProcessos;
      CmpRptCM.ParamValues[3].AsInteger := iIdLoteConcessao;
      CmpRptCM.ParamValues[4].AsString  := '';
      CmpRptCM.ParamValues[5].AsString  := '';
      CmpRptCM.ParamValues[6].AsString  := sDataHoraInicioProcesso;
      CmpRptCM.ParamValues[7].AsString  := '';
      CmpRptCM.ParamValues[8].AsInteger := qryBenef.FieldByName('IDPESSOA').AsInteger;
      CmpRptCM.ParamValues[9].AsInteger := qryBenef.FieldByName('IDPERFILINVEST').AsInteger;    //edilaine - SIG55933

      AbreConsultas();
      if sStatusDemonstrativo = '' then
         TFrmPreview.CreateModalPreview(Application, rpDemonstraBeneficios, 'Liberação de Benefícios')
      else
         SalvarArquivoDemonstrativo();

    end;
  finally
    RptDemonstraBeneficios.free;
  end;
  // edilaine - SOL 253577-18174 / PPM 1327585 - fim

  frmAguarde.Apaga;

end;
//Helio - SOL Nº 253577/17514 PPM Nº 971383 - fim


// edilaine - SOL 253577-18143 / PPM 1318908 - inicio
function TfrmCadInicioBenefExigencia.AtualizarDataFinalTaxa(iIdPlanoprev,
                                                            iIdPessjur,
                                                            iIdBeneficio,
                                                            iNumeroProcesso,
                                                            iIdPessoa,
                                                            iIdTitular,
                                                            iSeqproposta   : integer;
                                                            sNovaDataFinal : string) : boolean;
begin
  Result := true;

  {se nao passar a data, buscar da benef}
  if sNovaDataFinal = '' then
  begin
    qryAux.close;
    qryAux.Sql.clear;
    qryAux.Sql.add('SELECT B.DATAFINAL    ');
    qryAux.Sql.add('  FROM BENEFBFCIARIO B');
    qryAux.Sql.add(' WHERE IDPLANOPREV       = '+IntToStr(iIdPlanoprev)    );
    qryAux.Sql.add('   AND IDPESSJUR         = '+IntToStr(iIdPessjur)      );
    qryAux.Sql.add('   AND IDBENEFICIO       = '+IntToStr(iIdBeneficio)    );
    qryAux.Sql.add('   AND NUMEROPROCESSO    = '+IntToStr(iNumeroProcesso) );
    qryAux.Sql.add('   AND IDPESSOA          = '+IntToStr(iIdPessoa)       );
    qryAux.Sql.add('   AND SEQPROPOSTA       = '+IntToStr(iSeqproposta)    );
    qryAux.Open;
    if not qryAux.eof then
       sNovaDataFinal := qryAux.Fields[0].AsString;
  end;


  if iIdPessoa = iIdTitular then
  begin
    with qryAux do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1, '+
               iif(sNovaDataFinal = '', 'DATAFINAL = NULL', 'DATAFINAL = TO_DATE('''+sNovaDataFinal+''', ''dd/mm/yyyy'')' )+ 
               ' WHERE  IDPLANOPREV       = '+IntToStr(iIdPlanoprev)+
               ' AND    IDPESSJUR         = '+IntToStr(iIdPessjur)+
               ' AND    IDBENEFICIO       = '+IntToStr(iIdBeneficio)+
               ' AND    NUMEROPROCESSO    = '+IntToStr(iNumeroProcesso)+
               ' AND    IDPESSOA          = '+IntToStr(iIdPessoa)+
               ' AND    SEQPROPOSTA       = '+IntToStr(iSeqproposta) );
       try
          ExecSQL;
       except
          Result := false;
       end;
    end;
  end
  else
  begin
    with qryAux do
    begin
       Close;
       SQL.Clear;
       //SQL.Add(' UPDATE CONTRIBPREVNUCLEO SET FLGCOBRA = 0, '+        //edilaine SIG119408
       SQL.Add(' UPDATE CONTRIBPREVNUCLEO SET FLGCOBRA = 1, '+          //edilaine SIG119408
               iif(sNovaDataFinal = '', 'DATAFINAL = NULL', 'DATAFINAL = TO_DATE('''+sNovaDataFinal+''', ''dd/mm/yyyy'')' )+
               ' WHERE  IDPLANOPREV       = '+IntToStr(iIdPlanoprev)+
               ' AND    IDPESSJUR         = '+IntToStr(iIdPessjur)+
               ' AND    IDBENEFICIO       = '+IntToStr(iIdBeneficio)+
               ' AND    NUMEROPROCESSO    = '+IntToStr(iNumeroProcesso)+
               ' AND    IDPESSOA          = '+IntToStr(iIdPessoa)+
               ' AND    IDTITULAR         = '+IntToStr(iIdTitular)+
               ' AND    SEQPROPOSTA       = '+IntToStr(iSeqproposta) );
       try
          ExecSQL;
       except
          Result := false;
       end;
    end;
  end;
end;
// edilaine - SOL 253577-18143 / PPM 1318908 - fim


//inicio - edilaine - SIG 121019
procedure TfrmCadInicioBenefExigencia.AjustaAbonoPago(_qry : TwwQuery;
                                                      sAnomes, sAnoMesLote : string;
                                                      dataPagto, sVlrBS, sVlrFAB, sVlrDeficit : string;
                                                      rVlrSRB : double;
                                                      var rVlrPago : double);
var
 sSql        : String;
 rVlrAbono   : Double;
 sAnoMesRefAbono : string;
begin
  try
    sAnoMesRefAbono := Copy(sAnomes,1,4)+'/13';

    sSQL := ' DELETE '+
            ' FROM   HSTBENEFBFCIARIO '+
            ' WHERE  (IDPESSOA       = '+IntToStr ( qryBenefRecalculo.FieldByName('IDPESSOA').AsInteger ) +')'+
            ' AND    (MESREFERENCIA  = '+QuotedStr( sAnoMesRefAbono )  +')'+
            ' AND    (MES            = '+QuotedStr( sAnoMesLote )      +')'+
            ' AND    (IDBENEFICIO    = '+IntToStr ( qryBenefRecalculo.FieldByName('IDBENEFICIO').AsInteger )    +')'+
            ' AND    (NUMEROPROCESSO = '+IntToStr ( qryBenef.FieldByName('NUMEROPROCESSO').AsInteger ) +')'+
            ' AND    (VLBENEFPGTO <= 0 OR VLBENEFPGTO IS NULL) ' +
            ' AND    FLGENVIADO    IN (8,9) ';
     ExecutarQuery(QryAux, sSQL);

//    sVlrBS      := iff(StrToFloat(sVlrBS) < 0, '', sVlrBS);
//    sVlrFAB     := iff(StrToFloat(sVlrFAB) < 0, '', sVlrFAB);
//    sVlrDeficit := iff(StrToFloat(sVlrDeficit) < 0, '', sVlrDeficit);

    //se houver abono pago no ano gravar o valor com sinal oposto na tabela
    if rVlrPago > 0 then
      rVlrAbono := -rVlrPago
    else
      rVlrAbono := (rVlrPago * -1);

      {usar o FlgTipoRegistro da HSTBENEFBFCIARIO para diferenciar o lançamento de estorno
      Indica o tipo de registro do histórico de benefícios, segundo a legenda:
        0 - pagamento normal mensal
        1 - pagamento normal de abono anual
        2 - pagamento de antecipação de abono anual     <<<<<<
        3 - revisão de pagamento normal mensal
        4 - revisão de pagamento normal de abono anual
        5 - revisão de pagamento de antecipação de abono anual.}

    GravarHSTBENEFBFCIARIO('B',
                           '3128',  {'3008',}    //edilaine SIG124906
                           '2',
                           '2',
                           dataPagto,
                           Copy(sAnomes,1,4)+'/13',
                           FloatToStr(rVlrAbono),
                           _Qry.fieldbyname('PERCENTUAL').AsString,
                           _Qry.fieldbyname('DATAINICIO').AsString,
                           _Qry.fieldbyname('DATAFINAL').AsString,
                           _Qry.fieldbyname('IDPESSJUR').AsString,
                           _Qry.fieldbyname('IDTITULAR').AsString,
                           _Qry.fieldbyname('IDPESSOA').AsString,
                           _Qry.fieldbyname('SEQPROPOSTA').AsString,
                           _Qry.fieldbyname('IDPLANOPREV').AsString,
                           _Qry.fieldbyname('IDBENEFICIO').AsString,
                           _Qry.fieldbyname('NUMEROPROCESSO').AsString,
                           qryBenef.fieldbyname('FONTEPAGADORA').AsString,
                           FloatToStr(rVlrPago),
                           _Qry.fieldbyname('IDPLANOORIGEM').AsString,
                           _Qry.fieldbyname('IDSITBENEFICIO').AsString,
                           //_Qry.fieldbyname('VALORATUAL').AsString,
                           FloatToStr(rVlrPago), 
                           sVlrBS,
                           sVlrFAB,
                           sVlrDeficit,
                           _Qry.fieldbyname('IDPERFILINVEST').AsString,
                           rVlrSRB
                           );

    rVlrPago := 0;

  except
     MsgDlg('Ocorreu um erro ao ajustar antecipação do abono pago.','Informação',mtWarning,[MbOk],0);
  end;
end;


procedure TfrmCadInicioBenefExigencia.GravarHSTBENEFBFCIARIO(_Tipo,_idmotivo,_flgtiporegistro,
                                                             _SEQbeneficio,_datapagamento,
                                                             _mesreflote,_ValorAtual,_PercAtual,
                                                             _DataInicio,_DataFinal,_idpessjur,
                                                             _idtitular, _idpessoa, _seqproposta,
                                                             _idplanoprev, _idbeneficio,_numeroprocesso,
                                                             _FONTEPAGADORA,_valortotal,_IDPLANOORIGEM,
                                                             _IDSITBENEFICIO,
                                                             _valorIntegral,
                                                             _valorBS, _valorFAB, _vlrBaseDeficit:string;
                                                             _IdPerfilInvest : string;
                                                             _valorSRB : double);
var
 _query :TwwQuery;
 _query2 :TwwQuery;
begin

  try
    _ValorAtual := ClienteNumero(_ValorAtual);
    _PercAtual  := ClienteNumero(_PercAtual);

    _query := TwwQuery.Create(Application);
    _query.DataBaseName := 'BaseDados';
    _query.close;
    _query.SQL.clear;

    _query2 := TwwQuery.Create(Application);
    _query2.DataBaseName := 'BaseDados';
    _query2.close;
    _query2.SQL.clear;

    _query.Close;
    _query.sql.Clear;
    _query.sql.Add('insert into HSTBENEFBFCIARIO ');
    _query.sql.Add('  (  ');
    _query.sql.Add('  FLGDEVOLUCAO, ');
    _query.sql.Add('  IDTITULAR, ');
    _query.sql.Add('  IDPESSJUR, ');
    _query.sql.Add('  IDPLANOPREV, ');
    _query.sql.Add('  IDBENEFICIO , ');
    _query.sql.Add('  IDMOTIVO, ');
    _query.sql.Add('  IDPESSOA, ');
    _query.sql.Add('  NUMEROPROCESSO, ');
    _query.sql.Add('  MES, ');
    _query.sql.Add('  SEQBENEFICIO, ');
    _query.sql.Add('  IDLOTE, ');
    _query.sql.Add('  LOTEORIGINAL, ');
    _query.sql.Add('  VALORPREV, ');
    _query.sql.Add('  DATAPAGAMENTO, ');
    _query.sql.Add('  CODPORTFORMA, ');
    _query.sql.Add('  VALORCALCULADO, ');
    _query.sql.Add('  FLGENVIADO, ');
    _query.sql.Add('  MESREFERENCIA, ');
    _query.sql.Add('  FLGCONCESSAO, ');
    _query.sql.Add('  VALORTOTAL, ');
    _query.sql.Add('  FONTEPAGADORA, ');
    _query.sql.Add('  VALORINTEGRAL, ');
    _query.sql.Add('  IDPLANOORIGEM, ');
    _query.sql.Add('  IDTITBENEF, ');
    _query.sql.Add('  PERCENTUAL, ');
    _query.sql.Add('  FLGTIPOREGISTRO, ');
    _query.sql.Add('  MESCOMPREEM, ');
    _query.sql.Add('  VALORSRB, ');
    _query.sql.Add('  IDPERFILINVEST, ');
    _query.sql.Add('  SEQPROPOSTA, ');
    _query.sql.Add('  VALORBS, ');
    _query.sql.Add('  VALORFAB, ');
    _query.sql.Add('  VLRBASEDEFICIT ');
    _query.sql.Add('  )  ');
    _query.sql.Add(' values');
    _query.sql.Add('  (  ');

    if StrToFloat(_ValorAtual)<0 then
    begin
       _query.sql.Add(' '+'1'+',');
       _ValorAtual := floattostr(StrToFloat(_ValorAtual)*(-1));
     end
     else
       _query.sql.Add(' '+'0'+',');

    _query.sql.Add(' '+#39+_IDTITULAR+#39+',');//IDTITULAR
    _query.sql.Add(' '+#39+_IDPESSJUR+#39',');//IDPESSJUR
    _query.sql.Add(' '+#39+_IDPLANOPREV+#39+',');//IDPLANOPREV
    _query.sql.Add(' '+#39+_IDBENEFICIO+#39+',');//IDBENEFICIO
    _query.sql.Add(' '+#39+_idmotivo+#39+',');///feito RN09//_idmotivo
    _query.sql.Add(' '+#39+_IDPESSOA+#39+','); //IDPESSOA
    _query.sql.Add(' '+#39+_NUMEROPROCESSO+#39+',');//NUMEROPROCESSO
    _query.sql.Add(' '+#39+Copy(_datapagamento, 7,4)+'/'+Copy(_datapagamento, 4,2)+#39+',');//212299
    _query.sql.Add(' '+#39+_SEQbeneficio+#39+',');///feito
    _query.sql.Add(' '+#39+INTTOSTR(iIdLoteConcessao)+#39+','); //idlote
    _query.sql.Add(' '+#39+INTTOSTR(iIdLoteConcessao)+#39+','); //loteoriginal //Helio - SOL Nº 253577/17666 PPM Nº 1019935
    _query.sql.Add(' round(('+OraNumero(_ValorAtual)+'),2),');
    _query.sql.Add(' '+#39+_datapagamento+#39+',');

    _query2.close;
    _query2.sql.clear;
    _query2.sql.append(' select CODPORTFORMA from benefplanprev where idplanoprev='+#39+_idplanoprev+#39);
    _query2.sql.append(' and  idbeneficio='+#39+_idbeneficio+#39);
    _query2.open;
    _query.sql.Add(' '+#39+_query2.fieldbyname('CODPORTFORMA').text+#39+',');///feito
    _query2.close;


    If ( Pos( '/13', _mesreflote ) > 0 ) Then
      _query.sql.Add(' '+OraNumero(_valortotal)+',')
    else
      _query.sql.Add(' round(('+OraNumero(_ValorAtual)+'),2),');

    if _FONTEPAGADORA = '2' then
    begin
      //if _IDSITBENEFICIO='2' then
      //   _query.sql.Add(' '+#39+'8'+#39+',')
      //else
         _query.sql.Add(' '+#39+'0'+#39+',');     //FLGENVIADO
    end
    else
    begin
      //if _IDSITBENEFICIO = '2' then
      //     _query.sql.Add(' '+#39+'9'+#39+',')//FLGENVIADO - Retido
      //else
         _query.sql.Add(' '+#39+'0'+#39+',');//FLGENVIADO - A Processar
    end;

    _query.sql.Add(' '+#39+_mesreflote+#39+',');///feito
    _query.sql.Add(' '+#39+'1'+#39+',');//FLGCONCESSAO

    If ( Pos( '/13', _mesreflote ) > 0 ) Then
       _query.sql.Add(' '+OraNumero(_valortotal)+',')
    else
       _query.sql.Add(' round(('+OraNumero(_ValorAtual)+'),2),');


    _query.sql.Add(' '+#39+_FONTEPAGADORA+#39+',');
    _query.sql.Add(' round(('+OraNumero(_valorIntegral)+'),2),');
    _query.sql.Add(' '+#39+_IDPLANOORIGEM+#39+','); //IDPLANOORIGEM
    _query.sql.Add(' '+#39+_IDTITULAR+#39+',');//IDTITBENEF
    _query.sql.Add(' TRUNC('+#39+_PercAtual+#39+',4),');//ver Hébio
    _query.sql.Add(' '+#39+_flgtiporegistro+#39+',');
    // aqui grava a data inss Ferrari SIG 125597      se não mesreflote   _query.sql.Add(' '+#39+_mesreflote+#39+',');
    if sMesAnoMESCOMPREEM <> '' then
      _query.sql.Add(' '+#39+sMesAnoMESCOMPREEM+#39+',')
    else
      _query.sql.Add(' '+#39+_mesreflote+#39+',');
    // _query.sql.Add(' '+#39+Copy(_datapagamento, 7,4)+'/'+Copy(_datapagamento, 4,2)+#39+',');  // retirado SIG 125597 Ferrari
    _query.sql.Add(' '+OraNumero(FloatToStr(_valorSRB))+',');

    _query.sql.Add(' '+#39+_IdPerfilInvest+#39+', ' );
    _query.sql.Add(' '+_seqproposta+',');
    _query.sql.Add(' '+#39+ _valorBS +#39+',');
    _query.sql.Add(' '+#39+ _valorFAB +#39+',');
    _query.sql.Add(' '+#39+ _vlrBaseDeficit +#39);
    _query.sql.Add('  )  ');

    try
      _query.ExecSQL;

      //if _IDTITULAR = _IDPESSOA then

        ExecutaSP_PreparoContribuicao(qrybenef.fieldbyname('NUMEROPROCESSO').AsInteger,
                                               qryBenef.fieldByName('IDTITULAR').AsInteger,
                                               StrToInt(_idmotivo),
                                               iIdLoteConcessao,
                                               'Não',
                                               Copy(_datapagamento, 7,4)+'/'+Copy(_datapagamento, 4,2),
                                               _mesreflote,
                                               -1,-1,12,
                                               _mesreflote
                                               );

     
    except
      begin
        MsgDlg('Ocorreu um erro ao lançar o ajuste da antecipação do abono.','Informação',mtWarning,[MbOk],0);
      end;
    end;

  finally
    _query.Destroy;
    _query2.Destroy;
  end;
end;


procedure TfrmCadInicioBenefExigencia.AjustaContribAbonoPago(_qry : TwwQuery; sAnoMes, dataPagto : string );
var
 iFlgDevolve : byte;
 sSQL : string;
begin
  try
     // verificar se houve contribuição sobre abono pago
     sSql := 'SELECT HC.IDCONTRIBUICAO, HB.IDBENEFICIO, '+
             '       HC.VALOROP1, HC.VALOROP2, HC.VALOROP3, '+
             '       SUM(DECODE(HC.FLGDEVOLUCAO,1,-HC.VALORESPERADO, HC.VALORESPERADO)) AS VLRPAGO '+
             '  FROM HSTCONTRIBPREV HC '+
             '  JOIN HSTBENEFBFCIARIO HB ON HB.IDPESSOA    = HC.IDPESSOA     '+
             '                          AND HB.IDTITULAR   = HC.IDTITULAR    '+
             '                          AND HB.IDPESSJUR   = HC.IDPESSJUR    '+
             '                          AND HB.IDPLANOPREV = HC.IDPLANOPREV  '+
             '                          AND HB.SEQPROPOSTA = HC.SEQPROPOSTA  '+
             '                          AND NVL(HB.VLBENEFPGTO,0) > 0        '+
             '                          AND HB.MESREFERENCIA  = '+QuotedStr(Copy(sAnoMes,1,4)+'/13') +
             '                          AND HB.IDBENEFICIO    = '+_qry.fieldbyname('IDBENEFICIO').AsString   +
             ' JOIN BENEFXTAXA BXT ON BXT.IDCONTRIBUICAO = HC.IDCONTRIBUICAO '+
             '                    AND BXT.IDBENEFICIO    = HB.IDBENEFICIO    '+
             ' WHERE HC.IDPESSOA = '+_qry.fieldbyname('IDPESSOA').AsString     +
             '   AND HC.MESREFERENCIA = '+QuotedStr(Copy(sAnoMes,1,4)+'/13') +
             ' GROUP BY HC.IDCONTRIBUICAO,  HB.IDBENEFICIO,   '+
             '          HC.VALOROP1, HC.VALOROP2, HC.VALOROP3 ';



     if FazQuery( QryAux, sSQL ) then
     begin
       while not QryAux.eof do
       begin
         // inverte sinal para devolver
         iFlgDevolve := IFF(QryAux.FieldByName('VlrPago').AsFloat < 0, 0, 1);

         InsereHstContribPREV( dtmAPrev.qryAux,
                               _qry.fieldbyname('IDPESSOA').AsInteger,           //piIdPessoa
                               1,                                                //piSeqProposta
                               _qry.fieldbyname('IDPESSJUR').AsInteger,          //piIdPessJur
                               _qry.fieldbyname('IDPLANOPREV').AsInteger,        //piIdPlanoPrev
                               QryAux.FieldByName('IdContribuicao').AsInteger,   //piIdContribuicao
                               3056,                                             //piIdMotivo
                               Copy(sAnoMes,1,4)+'/13',                          //psMesReferencia
                               FormatDateTime('yyyy/mm', StrToDate(dataPagto)),  //psMesCobranca
                               -1,                                               //piCodPortForma
                               dataPagto,                                        //psDataCobranca
                               '',                                               //psDataRecebimento
                               QryAux.FieldByName('VlrPago').AsFloat,            //pdValorEsperado
                               QryAux.FieldByName('VlrPago').AsFloat,            //pdValorCalculado
                               0,                                                //pdValorRecebido
                               -1,                                               //piIdRegraCalculo
                               1,                                                //piFlgDescFolha
                               QryAux.FieldByName('ValorOp1').AsFloat,           //pdValorBase1
                               QryAux.FieldByName('ValorOp2').AsFloat,           //pdValorBase2
                               QryAux.FieldByName('ValorOp3').AsFloat,           //pdValorBase3
                               _qry.fieldbyname('DATAINICIO').AsString,          //psDataInicio
                               _qry.fieldbyname('DATAFINAL').AsString,           //psDataFinal
                               'AS',                                             //psFlgIntSitPart
                               2,                                                //piSitRecebimento
                               1,                                                //piParcela
                               iIdLoteConcessao,                                 //piIdLote
                               'F',                                              //pcTipoPrevidencia
                               0,                                                //piFlgCalcReserva
                               iFlgDevolve,                                      //piFlgDevolucao
                               1,                                                //piFlgConcessao
                               0,                                                //piFlgEvento
                               'B');                                             //psFolhaOrigem

         QryAux.next;
       end;
     end;
  except
     MsgDlg('Ocorreu um erro ao ajustar contribuições sobre a antecipação do abono.','Informação',mtWarning,[MbOk],0);
  end;
end;
//Fim - edilaine - SIG 121019


End.
