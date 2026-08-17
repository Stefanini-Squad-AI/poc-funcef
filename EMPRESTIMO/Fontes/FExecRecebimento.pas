unit FExecRecebimento;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 129599
Responsável : Leandro Pocebon
Data        : 02/12/2022
Descrição   : Segregação Financeira
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------
Pendência   : SOL 180837/14327 KINTANA 1989635
Responsável : HIGOR NAYDE FERREIRA
Data        : 23/07/2013
Descrição   : Criação de Processamento reestruturado.
--------------------------------------------------------------------------------
Pendência   : SOL 178622 KINTANA 1641054
Responsável : BRUNO AZEVEDO
Data        : 18/04/2012
Descrição   : Ajustes no cálculo de atualização diária.
--------------------------------------------------------------------------------
Pendência   : SOL 175961 KINTANA  1635435
Responsável : Fernando Xavier
Data        : 13/04/2012
Descrição   : Erro no recebimento automatico quando é executado pela segunda vez
              para um contrato
--------------------------------------------------------------------------------
Pendência   : SOL 177663 KINTANA 1629931
Responsável : BRUNO AZEVEDO
Data        : 04/04/2012
Descrição   : Ajuste no acerto de quitação.
--------------------------------------------------------------------------------
Pendência   : SOL 176971 Kintana 1617722
Responsável : BRUNO AZEVEDO	
Data        : 23/03/2012
Descrição   : Ajuste no acerto de quitação.
--------------------------------------------------------------------------------
Pendência   : SOL 167580 Kintana 1494022
Responsável : Monica Gonzaga
Data        : 13/03/2012
Descrição   : QryValorAcertoConcessao, QryContratos, QryDatas
             Foi feito um acerto de quitação com valor igual a zero e a quitação dos
             contratos quitados a partir desse contrato deve ser desfeita.
--------------------------------------------------------------------------------
Pendência   : SOL 173133 Kintana 1561788
Responsável : Wylliam Leite
Data        : 02/02/2012
Descrição   : Foi efetuado algumas alterações na query de busca para melhorar
              a performance da mesma.
--------------------------------------------------------------------------------
Pendência   : SOL 172815 Kintana 1557289
Responsável : Wylliam Leite
Data        : 31/01/2012
Descrição   : Foi retirado o indice XIE20TMPDESC da query de busca resolvendo 
			  assim o problema de lendidão da busca.
--------------------------------------------------------------------------------
Pendência   : SOL 168747 Kintana 1379628
Responsável : Wylliam Leite
Data        : 16/11/2011
Descrição   : O sistema não estava fazendo as baixas dos falecidos, foi criado
              a variavel bVerificacao para efetuar uma verificação e efetuar um
              update da HISTMOVEMPTMO e posteriormente na TMPDESC para corrigir
              o problema.
DFM         : Foi inserido uma Query "QryAux" para armazenar uma instução sql de
              update.              
--------------------------------------------------------------------------------
Pendência   : SOL 166988 Kintana 1467574
Responsável : Vinicius Ferreira
Data        : 04/11/2011
Descrição   : Correção barra de progresso pula de 0% para 100%,
              sem apresentar a evolução do processo.
--------------------------------------------------------------------------------
Pendência   : SOL 162334 Kintana 1379628
Responsável : Fanuel Junior
Data        : 02/08/2010
Descrição   : O sistema não estava efetuando o recebimento
              automatico dos itens de amortização enviados à Folha de Beneficios
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : SOL 127656 KINTANA 744421
Responsável : BRUNO AZEVEDO
Data        : 25/02/2010
Descrição   : Somente gravar o campo hmedataefetiva se a var. ddataefetiva > 0.
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : RecebeDocumentoCaPCaR(...) e EhRefinanciamento
Data      : 03/01/2008
Autor     : André Pontes
Pendencia : 23358/26875/26896
Descrição : Criada nova verificação: se houver itens de IOF ou Seguro Complementar (cadastro de
            itens por processo) no recebimento zerado de uma amortização, fica caracterizado um
            refinanciamento, que não poderá ser desfeito
--------------------------------------------------------------------------------
Rotina    : qryItensCaPCaR
Data      : 12/12/2007
Autor     : Marchetti
Pendencia : 26943
Descrição : Acerto na pendencia 26630, pois a mesma so alterou a query no objeto, mas como a mesma é reescrita
            em tempo de execução, o problema relatado na pendencia 26630 persistia
--------------------------------------------------------------------------------
Rotina    : qryItensCaPCaR
Data      : 31/10/2007
Autor     : Alberto
Pendencia : 26630
Descrição : Retirada da função ABS para identificar o valor previsto do documento.
            Quando há item com valor previsto negativo, o valor previsto do documento difere
            do valor a receber do documento e executa indevidamente a função ProcessaBaixaParcial
            A linha:
            ROUND(SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))), 2) AS VLR_PREVISTO_DOC,
            Passa para:
            ROUND( SUM( DECODE( HME.HMERECPAG, 'P', ABS( NVL( HME.HMEVLRPREVISTO, 0 ) ),
                        DECODE( HME.HMETIPOMOV, 0,  ABS( NVL( HME.HMEVLRPREVISTO, 0 ) ),
                                                         NVL( HME.HMEVLRPREVISTO, 0 ) ) ) ), 2) AS VLR_PREVISTO_DOC,
--------------------------------------------------------------------------------
Rotina    : qryTmpDesc
Data      : 03/10/2007
Autor     : Marchetti
Pendencia : 26480
Descrição : Retirada dos TFields e uso de FieldByName
--------------------------------------------------------------------------------
Rotina    : qryBaixaTodosItensTmpDesc
Data      : 11/05/2006
Autor     : Marchetti
Pendencia : 22165
Descrição : Retirado o Update no campo HMETIPOFOLHA que estava colocando o mesmo como NULL
--------------------------------------------------------------------------------
Rotina    : -
Data      : 21/02/2006
Autor     : André Pontes
Pendencia :
Descrição : (a) novo filtro por código do documento;
            (b) otimização da query de busca de documentos, inclusive com novo filtro (acima);
            (c) correção da query para buscar documentos baixados com valor ZERO;
--------------------------------------------------------------------------------
Rotina    : RecebeDocumentoCaPCaR
Data      : 04/10/2005
Autor     : André Pontes
Pendencia : 20409
Descrição : Correção da marcação de divergente para documentos baixados com valor = 0 (estava errado
            apenas para FUNCEF)
--------------------------------------------------------------------------------
Rotina    : RecebimentoCaPCaR
Data      : 24/08/2004
Autor     : André Pontes
Pendencia :
Descrição : Retirada do recebimento de Contas a Pagar do loop de patrocinadoras, para tentar corrigir
            recebimentos incorretos
--------------------------------------------------------------------------------
Rotina    : EncontrouRegistroAgrupado, EncontrouRegistroQuitadoAgrupado
Data      : 12/07/2004 a 16/07/2004
Autor     : André Pontes
Pendencia :
Descrição : Funções específicas para tratamento de múltiplos registros na HistMov (ver abaixo)
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDescAgrupada
Data      : 12/07/2004 a 16/07/2004
Autor     : André Pontes
Pendencia :
Descrição : Criação de nova função para recebimento da TMPDESC apenas para FUNCEF (regulada por
            novo parâmetro - FLGAGRUPAPARCFOL), onde 1 registro da TMPDESC, em função de
            agrupamentos para as Folhas, pode corresponder a + de 1 registro da HistMovEmptmo
            Por definição, esses registros (na TMPDESC) NÃO ADMITEM baixa parcial. Isso facilitará
            o processo de recebimento, uma vez que teremos registros recebidos ou não.
--------------------------------------------------------------------------------
Rotina    : RecebeDocumentoCaPCar
Data      : 13/07/2004
Autor     : Marchetti
Pendência : 16894
Descrição : Chamada da rotina ConciliaDocumento
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDesc
Data      : 25/03/2004
Autor     : André Pontes
Pendencia : -
Descrição : Retificando a questão dos recebimentos inesperados:
            Criado, para a FUNCEF, do conceito de "NÃO COMANDADO". Dessa forma, um registro enviado
            pelo sistema, mas quitado antes do recebimento é "INESPERADO", mas NÃO coracteriza
            "NÃO COMANDADO".
            (definição preliminar) Esses registros devem ser recebidos e devolvidos normalmente, ao
            passo que valores não comandados devem ser tratados por tela específica.

            Obs:  Só é possível saber, apenas a partir da TMPDESC:
                  - se o item for recebido com divergência (sitenvio = 1 ou valorrecebido <> valor)
                  - se o item não foi enviado pelo sistema
                  Assim, para saber se um recebimento será inesperado é necessário consultar a
                  HistMovEmptmo também.
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDesc
Data      : 19/02/2004
Autor     : André Pontes
Pendencia : -
Descrição : Para FUNCEF, não pode haver tratamento automático de registros inesperados, em função
            do item centralizador de prestações abater do saldo devedor. Há ainda a questão dos
            "tipo 1" e "tipo 3", que podem gerar amortização/incorporação ao invés de
            cobrança/devolução
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDesc
Data      : 12/09/2003
Autor     : André Pontes
Pendencia : -
Descrição : 1) qryTMPDESC: por causa do parâmetros PCRITICA, a query estava buscando registros
               com SITENVIO = '9'
            2) qryUpdateTMPDESC: filtro trocado para IDMODULO IN (15, 32) - estava só "15"
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDesc
Data      : 11/09/2003
Autor     : André Pontes
Pendencia : -
Descrição : Criado um checkbox que inibe a criação de registros de recebimento "inesperado" e de
            devolução em caso de recebimento "duplicado". É BACA, porém útil quando há alteração
            manual na TMPDESC ou a partir da Folha. JÁ FOI RETIRADO em 12/09: o problema estava na
            qryTMPDESC
--------------------------------------------------------------------------------
Rotina    : RecebeDocumentoCaPCar e RecebeParcelaTmpDesc
Data      : 17/07/2003
Autor     : Marchetti
Pendencia : 21496 (3S)
Descrição : Chamada da rotina de estorno de provisão de perdas
--------------------------------------------------------------------------------
Rotina    : RecebeDocumentoCaPCar
Data      : 11/06/2003
Autor     : André Pontes
Descrição : Adequação à filosofia do envio de concessões em lote: se o envento for concesão, não é
            feita a comparação do valor do documento com o valor do contrato (ver observação na
            própria rotina)
--------------------------------------------------------------------------------
Rotina    : -
Data      : 20/02/2003
Autor     : André Pontes
Descrição : Após RecebeParcela_, é novamente verificada a situação contratual
--------------------------------------------------------------------------------
Rotina    : RecebeDocumentoCaPCar
Data      : 04/02/2003
Autor     : Marchetti
Descrição : Quando valor recebido = ZERO, grava item como divergente tipo 6 (não será recebido)
--------------------------------------------------------------------------------
Rotina    : InsereInesperado e InsereDiferencaHist
Data      : 15/01/2003
Autor     : André Pontes
Descrição : Passagem da FormaCobranca e TipoFolha, acompanhando os registros originais
--------------------------------------------------------------------------------
Rotina    : AbreTmpDesc
Data      : 08/01/2003
Autor     : Marchetti
Descrição : Colocado o sitenvio 'X' na query para pegar os registros que não serão recebidos na folha
--------------------------------------------------------------------------------
Rotina    : InsereInesperadoQuitado
Data      : 07/01/2003
Autor     : André Pontes
Descrição : Nova rotina, para inserção de um registro "inesperado" em função do item que se está
            recebendo estar marcado como "quitado". É semelhante a InsereInesperado, mas os dados
            do item podem ser aproveitados, e o seqCobranca será incrementado a partir do item
            original (que está "quitado")
--------------------------------------------------------------------------------
Rotina    : - (TNovosDados)
Data      : 07/01/2003
Autor     : André Pontes
Descrição : Novos campos: ValorEfetivo e FlgEnvio
--------------------------------------------------------------------------------
Rotina    : InsereInesperado
Data      : 07/01/2003
Autor     : André Pontes
Descrição : Preenchimento do IDContrato no registro rContrato
--------------------------------------------------------------------------------
Rotina    : *** várias ***
Data      : 26/12/2002
Autor     : André Pontes
Descrição : Recebimento de CaP / CaR totalmente refeito, contemplando baixas parciais e valores
            inesperados
--------------------------------------------------------------------------------
Rotina    : qryTMPDESC
Data      : 09/12/2002
Autor     : André Pontes
Descrição : TMP.SITENVIO IN ('1', '2') ao invés de TMP.SITENVIO NOT IN ('0', '9')
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaBancoCR
Data      : 04/12/2002
Autor     : Marchetti
Descrição : Rotina alterada para contemplar o não pagamento da amortização e quitação
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDesc
Data      : 04/12/2002
Autor     : Marchetti
Descrição : Rotina alterada para contemplar o não pagamento da amortização
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 25/11/2002
Autor     : Marchetti
Descrição : É passado o record dos dados da concessão. Nesse processo os dados seguem sem valor, pois
            os mesmos somente serão utilizados na alteração de valores da concessão.
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDesc
Data      : 08/11/2002 a 18/11/2002
Autor     : André
Descrição : Rotina alterada para contemplar equivalência de 1 para 1 entre HistMovEmptmo e TMPDESC
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 12/11/2002
Autor     : Marchetti
Descrição : Passado o número de parcelas pagas
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaBancoCP,RecebeParcelaBancoCR
Data      : 11/11/2002
Autor     : Marchetti
Descrição : Quando o saldo do documento for igual ao saldo a receber, faz a baixa pelo valor pago,
            senão faz a baixa pela diferença entre valor a receber e valor recebido
--------------------------------------------------------------------------------
Rotina    : BuscaSaldoDocumento
Data      : 06/11/2002
Autor     : Marchetti
Descrição : Acertada a query para trazer o valor efetivamente pago no financeiro
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaBancoCR
Data      : 06/11/2002
Autor     : Marchetti
Descrição : Acertada a rotina para aceitar recebimento ZERO no financeiro colocando o mesmo como
            FlgTipoDiverg = 6
--------------------------------------------------------------------------------
Rotina    : MontaSql
Data      : 30/10/2002
Autor     : Marchetti
Descrição : Colocado filtro para não levar em consideração itens com valor previsto nulo ou igual a
            ZERO
--------------------------------------------------------------------------------
Rotina    : AbreTMPDESC
Data      : 25/10/2002
Autor     : André Pontes
Descrição : Query passa para o objeto, com passagem de parâmetros, ao invés de ter o SQL.Text passado
            dinamicamente. Estava EXTREMAMENTE lento...
--------------------------------------------------------------------------------
Rotina    : -
Data      : 25/10/2002
Autor     : André Pontes
Descrição : Retirado o filtro por plano
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaBancoCP, RecebeParcelaBancoCR, RecebeParcelaTmpDesc
Data      : 18/10/2002
Autor     : Marchetti
Descrição : Retirado o LimpaParametros da qryauxemptmo e colocado Close
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaBancoCR
Data      : 16/10/2002
Autor     : Marchetti
Descrição : Acerto no loop do contrato + parcela, pois quando haviam registros de parcela + encargos,
            a rotina baixava o valor dos encargos com o valor da parcela.
--------------------------------------------------------------------------------
Rotina    : ExisteItensEmAberto
Data      : 15/10/2002
Autor     : Marchetti
Descrição : Função que retorna possiveis itens em aberto
--------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDesc
Data      : 02/10/2002
Autor     : André Pontes
Descrição : *** Verificar isso !!! ***
--------------------------------------------------------------------------------
Rotina    : InsereDiferencaHist
Data      : 01/10/2002
Autor     : André Pontes
Descrição : Correção da data efetiva na gravação de um novo item (DataPrevista := 0)
--------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : label "Cobrança / Pagamento (mês/ano)" substitui "Cobrança (mês/ano)"
--------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Colocado filtro de ano e mes de cobranca para os itens do financeiro
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}




// --------------------------------------------------------------------
// --------------------------------------------------------------------
//
//    Tipo de Divergência:
//
//       1 - Valores AINDA não recebidos (não é usado no recebimento)
//
//       2 - Recebimentos Inesperados
//       3 - Valores recebidos a menor
//       4 - Valores recebidos a maior
//       5 - Divergência de datas
//       6 - Valores que não serão recebidos
//
// --------------------------------------------------------------------
// --------------------------------------------------------------------



interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, StdCtrls, Mask, wwdbedit, Wwdbspin, mListaPatro, wwdblook,
   mContratoEmptmo, mMutuario, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Db, DBTables,
   Wwquery, UFuncoesEmptmo ,

   uTypesEmptmo, wwdbdatetimepicker;

type
   TNovosDados = record
      IDItemEmptmo   : Int64;
      ValorPrevisto  : Currency;
      ValorEfetivo   : Currency;
      DataEfetiva    : TDateTime;
      DataPrevista   : TDateTime;
      DataVencto     : TDateTime;
      FlgDivergPend  : Integer;
      FlgBaixado     : Integer;
      FlgEnvio       : Integer;
      AnoCompetencia : Integer;
      MesCompetencia : Integer;
      AnoCobranca    : Integer;
      MesCobranca    : Integer;
      IDRubrica      : Int64;
      FlgTipoDiverg  : Integer;
      SeqCobranca    : Integer;
      FormaCoranca   : String;
      TipoFolha      : String;
   end;

   TfrmExecRecebimento = class(TfrmWizardMTEP)
      molMutuario: TmolMutuario;
      molContratoEmptmo: TmolContratoEmptmo;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      Label3: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      molListaPatro: TmolListaPatro;
      grpRecebimento: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      chkCaP: TCheckBox;
      chkCaR: TCheckBox;
      Panel2: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      chkDiverg: TCheckBox;
      Panel3: TPanel;
      memResult: TMemo;
      qryHistMov: TwwQuery;
      qryTmpDesc: TwwQuery;
      qryContratosGeracao: TwwQuery;
      qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField;
      qryContratosGeracaoIDCONTRQUITACAO: TFloatField;
      qryContratosGeracaoIDTIPOEMPTMO: TFloatField;
      qryContratosGeracaoIDINSCRICAOEMPTMO: TFloatField;
      qryContratosGeracaoIDTIPOCONTREMPTMO: TFloatField;
      qryContratosGeracaoIDPATRO: TFloatField;
      qryContratosGeracaoIDPLANOPREV: TFloatField;
      qryContratosGeracaoIDVERBA: TFloatField;
      qryContratosGeracaoIDPESSOA: TFloatField;
      qryContratosGeracaoIDBENEF: TFloatField;
      qryContratosGeracaoFLGSITUACAO: TStringField;
      qryContratosGeracaoFLGFORMAREC: TStringField;
      qryContratosGeracaoFLGFORMAPAG: TStringField;
      qryContratosGeracaoCODFORMAPAG: TFloatField;
      qryContratosGeracaoPORTFORMAREC: TFloatField;
      qryContratosGeracaoPORTFORMAPAG: TFloatField;
      qryContratosGeracaoIDCBANCARIA: TFloatField;
      qryContratosGeracaoDATAASSINATURA: TDateTimeField;
      qryContratosGeracaoDATASITUACAO: TDateTimeField;
      qryContratosGeracaoDATACREDITO: TDateTimeField;
      qryContratosGeracaoDATAPRIMPARC: TDateTimeField;
      qryContratosGeracaoDATACANC: TDateTimeField;
      qryContratosGeracaoVLRCONTRATO: TFloatField;
      qryContratosGeracaoVLRPARCELA: TFloatField;
      qryContratosGeracaoTXJUROS: TFloatField;
      qryContratosGeracaoHMENUMPARCELAS: TFloatField;
      qryContratosGeracaoHMEPARCELA: TFloatField;
      qryContratosGeracaoIDREGRAJURCONC: TFloatField;
      qryContratosGeracaoIDREGRALIMITES: TFloatField;
      qryContratosGeracaoIDREGRASUSPCOBR: TFloatField;
      qryContratosGeracaoIDREGRASLDDIA: TFloatField;
      qryContratosGeracaoIDREGRAJURANTCONC: TFloatField;
      qryContratosGeracaoIDREGRAELEG: TFloatField;
      qryContratosGeracaoIDREGRARESERVA: TFloatField;
      qryContratosGeracaoIDREGRAMARGEM: TFloatField;
      qryContratosGeracaoIDREGRAPRAZOSCONC: TFloatField;
      qryContratosGeracaoDATAINSC: TDateTimeField;
      qryContratosGeracaoDATAULTATUALIZA: TDateTimeField;
      qryContratosGeracaoMOECODIGO: TFloatField;
      qryContratosGeracaoMOESIGLA: TStringField;
      qryBuscaParcela: TwwQuery;
      qryBuscaParcelaIDITEMEMPTMO: TFloatField;
      qryBuscaParcelaHMEPARCELA: TFloatField;
      qryBuscaParcelaHMENUMPARCELAS: TFloatField;
      qryBuscaParcelaHMECENTRALIZA: TFloatField;
      qryBuscaParcelaHMEDESTACADO: TFloatField;
      qryBuscaParcelaHMESALDODEV: TFloatField;
      qryBuscaItem: TwwQuery;
      qryBuscaItemIDITEMEMPTMO: TFloatField;
      qryUpdateHistMov: TwwQuery;
      qryBaixaItensDoc: TwwQuery;
      FloatField1: TFloatField;
      qryItensABaixar: TwwQuery;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovHMEORIGEM: TFloatField;
      qryHistMovHMERECPAG: TStringField;
      qryHistMovHMEFORMACOBRANCA: TStringField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovIDRUBRICA: TFloatField;
      qryHistMovHMEPRIORIDADE: TFloatField;
      qryHistMovHMEDATAATUALIZA: TDateTimeField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovIDREGRA: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovHMECENTRALIZA: TFloatField;
      qryHistMovHMEDESTACADO: TFloatField;
      qryHistMovIDITEMCENTRALIZA: TFloatField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMEVLREFETIVO: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      qryHistMovHMEDATAEFETIVA: TDateTimeField;
      qryHistMovFLGBAIXADO: TFloatField;
      qryHistMovFLGDIVERGPEND: TFloatField;
      qryHistMovFLGBAIXAMANUAL: TFloatField;
      qryHistMovFLGESTORNADO: TFloatField;
      qryHistMovFLGQUITADO: TFloatField;
      qryHistMovFLGABONADO: TFloatField;
      qryHistMovQuitado: TwwQuery;
      qryHistMovQuitadoIDHISTMOVEMPTMO: TFloatField;
      qryHistMovQuitadoIDCONTRATOEMPTMO: TFloatField;
      qryHistMovQuitadoIDITEMEMPTMO: TFloatField;
      qryHistMovQuitadoHMEANOCOMPETENCIA: TFloatField;
      qryHistMovQuitadoHMEMESCOMPETENCIA: TFloatField;
      qryHistMovQuitadoHMEANOCOBRANCA: TFloatField;
      qryHistMovQuitadoHMEMESCOBRANCA: TFloatField;
      qryHistMovQuitadoHMETIPOMOV: TFloatField;
      qryHistMovQuitadoHMEORIGEM: TFloatField;
      qryHistMovQuitadoHMERECPAG: TStringField;
      qryHistMovQuitadoHMEFORMACOBRANCA: TStringField;
      qryHistMovQuitadoHMESEQCOBRANCA: TFloatField;
      qryHistMovQuitadoIDRUBRICA: TFloatField;
      qryHistMovQuitadoHMEPRIORIDADE: TFloatField;
      qryHistMovQuitadoHMEDATAATUALIZA: TDateTimeField;
      qryHistMovQuitadoHMESALDODEV: TFloatField;
      qryHistMovQuitadoHMETXJUROS: TFloatField;
      qryHistMovQuitadoIDREGRA: TFloatField;
      qryHistMovQuitadoHMEPARCELA: TFloatField;
      qryHistMovQuitadoHMENUMPARCELAS: TFloatField;
      qryHistMovQuitadoHMECENTRALIZA: TFloatField;
      qryHistMovQuitadoHMEDESTACADO: TFloatField;
      qryHistMovQuitadoIDITEMCENTRALIZA: TFloatField;
      qryHistMovQuitadoHMEVLRPREVISTO: TFloatField;
      qryHistMovQuitadoHMEVLREFETIVO: TFloatField;
      qryHistMovQuitadoHMEDATAPREVISTA: TDateTimeField;
      qryHistMovQuitadoHMEDATAVENCTO: TDateTimeField;
      qryHistMovQuitadoHMEDATAEFETIVA: TDateTimeField;
      qryHistMovQuitadoFLGBAIXADO: TFloatField;
      qryHistMovQuitadoFLGDIVERGPEND: TFloatField;
      qryHistMovQuitadoFLGBAIXAMANUAL: TFloatField;
      qryHistMovQuitadoFLGESTORNADO: TFloatField;
      qryHistMovQuitadoFLGQUITADO: TFloatField;
      qryHistMovQuitadoFLGABONADO: TFloatField;
      qryHistMovHMETIPOFOLHA: TStringField;
      qryHistMovQuitadoHMETIPOFOLHA: TStringField;
      qryBaixaItensZero: TwwQuery;
      qryEstornoProvisaoItensDoc: TwwQuery;
      qryEstornoProvisaoItensDocIDCONTRATOEMPTMO: TFloatField;
      chkCritica: TCheckBox;
      chkInesperado: TCheckBox;
      Label2: TLabel;
      qryItensCaPCaR: TwwQuery;
      qryItensCaPCaRVLR_PREVISTO_DOC: TFloatField;
      qryItensCaPCaRHMEDATAVENCTO: TDateTimeField;
      grpDataEfetiva: TGroupBox;
      Label4: TLabel;
      edtDataEfetivaIni: TwwDBDateTimePicker;
      edtDataEfetivaFim: TwwDBDateTimePicker;
      Panel4: TPanel;
      memErro: TMemo;
      qryHistMovAgrupado: TwwQuery;
      qryHistMovQuitadoAgrupado: TwwQuery;
      qryTotalizaHist: TwwQuery;
      qryHistMovQuitadoAgrupadoIDHISTMOVEMPTMO: TFloatField;
      qryHistMovQuitadoAgrupadoIDCONTRATOEMPTMO: TFloatField;
      qryHistMovQuitadoAgrupadoIDITEMEMPTMO: TFloatField;
      qryHistMovQuitadoAgrupadoHMEANOCOMPETENCIA: TFloatField;
      qryHistMovQuitadoAgrupadoHMEMESCOMPETENCIA: TFloatField;
      qryHistMovQuitadoAgrupadoHMEANOCOBRANCA: TFloatField;
      qryHistMovQuitadoAgrupadoHMEMESCOBRANCA: TFloatField;
      qryHistMovQuitadoAgrupadoHMETIPOMOV: TFloatField;
      qryHistMovQuitadoAgrupadoHMEORIGEM: TFloatField;
      qryHistMovQuitadoAgrupadoHMERECPAG: TStringField;
      qryHistMovQuitadoAgrupadoHMEFORMACOBRANCA: TStringField;
      qryHistMovQuitadoAgrupadoHMETIPOFOLHA: TStringField;
      qryHistMovQuitadoAgrupadoHMESEQCOBRANCA: TFloatField;
      qryHistMovQuitadoAgrupadoIDRUBRICA: TFloatField;
      qryHistMovQuitadoAgrupadoHMEPRIORIDADE: TFloatField;
      qryHistMovQuitadoAgrupadoHMEDATAATUALIZA: TDateTimeField;
      qryHistMovQuitadoAgrupadoHMESALDODEV: TFloatField;
      qryHistMovQuitadoAgrupadoHMETXJUROS: TFloatField;
      qryHistMovQuitadoAgrupadoIDREGRA: TFloatField;
      qryHistMovQuitadoAgrupadoHMEPARCELA: TFloatField;
      qryHistMovQuitadoAgrupadoHMENUMPARCELAS: TFloatField;
      qryHistMovQuitadoAgrupadoHMECENTRALIZA: TFloatField;
      qryHistMovQuitadoAgrupadoHMEDESTACADO: TFloatField;
      qryHistMovQuitadoAgrupadoIDITEMCENTRALIZA: TFloatField;
      qryHistMovQuitadoAgrupadoHMEVLRPREVISTO: TFloatField;
      qryHistMovQuitadoAgrupadoHMEVLREFETIVO: TFloatField;
      qryHistMovQuitadoAgrupadoHMEDATAPREVISTA: TDateTimeField;
      qryHistMovQuitadoAgrupadoHMEDATAVENCTO: TDateTimeField;
      qryHistMovQuitadoAgrupadoHMEDATAEFETIVA: TDateTimeField;
      qryHistMovQuitadoAgrupadoFLGBAIXADO: TFloatField;
      qryHistMovQuitadoAgrupadoFLGDIVERGPEND: TFloatField;
      qryHistMovQuitadoAgrupadoFLGBAIXAMANUAL: TFloatField;
      qryHistMovQuitadoAgrupadoFLGESTORNADO: TFloatField;
      qryHistMovQuitadoAgrupadoFLGQUITADO: TFloatField;
      qryHistMovQuitadoAgrupadoFLGABONADO: TFloatField;
      qryHistMovAgrupadoIDHISTMOVEMPTMO: TFloatField;
      qryHistMovAgrupadoIDCONTRATOEMPTMO: TFloatField;
      qryHistMovAgrupadoIDITEMEMPTMO: TFloatField;
      qryHistMovAgrupadoHMEANOCOMPETENCIA: TFloatField;
      qryHistMovAgrupadoHMEMESCOMPETENCIA: TFloatField;
      qryHistMovAgrupadoHMEANOCOBRANCA: TFloatField;
      qryHistMovAgrupadoHMEMESCOBRANCA: TFloatField;
      qryHistMovAgrupadoHMETIPOMOV: TFloatField;
      qryHistMovAgrupadoHMEORIGEM: TFloatField;
      qryHistMovAgrupadoHMERECPAG: TStringField;
      qryHistMovAgrupadoHMEFORMACOBRANCA: TStringField;
      qryHistMovAgrupadoHMETIPOFOLHA: TStringField;
      qryHistMovAgrupadoHMESEQCOBRANCA: TFloatField;
      qryHistMovAgrupadoIDRUBRICA: TFloatField;
      qryHistMovAgrupadoHMEPRIORIDADE: TFloatField;
      qryHistMovAgrupadoHMEDATAATUALIZA: TDateTimeField;
      qryHistMovAgrupadoHMESALDODEV: TFloatField;
      qryHistMovAgrupadoHMETXJUROS: TFloatField;
      qryHistMovAgrupadoIDREGRA: TFloatField;
      qryHistMovAgrupadoHMEPARCELA: TFloatField;
      qryHistMovAgrupadoHMENUMPARCELAS: TFloatField;
      qryHistMovAgrupadoHMECENTRALIZA: TFloatField;
      qryHistMovAgrupadoHMEDESTACADO: TFloatField;
      qryHistMovAgrupadoIDITEMCENTRALIZA: TFloatField;
      qryHistMovAgrupadoHMEVLRPREVISTO: TFloatField;
      qryHistMovAgrupadoHMEVLREFETIVO: TFloatField;
      qryHistMovAgrupadoHMEDATAPREVISTA: TDateTimeField;
      qryHistMovAgrupadoHMEDATAVENCTO: TDateTimeField;
      qryHistMovAgrupadoHMEDATAEFETIVA: TDateTimeField;
      qryHistMovAgrupadoFLGBAIXADO: TFloatField;
      qryHistMovAgrupadoFLGDIVERGPEND: TFloatField;
      qryHistMovAgrupadoFLGBAIXAMANUAL: TFloatField;
      qryHistMovAgrupadoFLGESTORNADO: TFloatField;
      qryHistMovAgrupadoFLGQUITADO: TFloatField;
      qryHistMovAgrupadoFLGABONADO: TFloatField;
      qryTotalizaHistHMEVLRPREVISTO: TFloatField;
      qryBaixaTodosItensTmpDesc: TwwQuery;
      FloatField2: TFloatField;
      qryItensCaPCaRCODDOCUMENTO: TFloatField;
      qryEventoDoc: TwwQuery;
      qryEventoDocIDCONTRATOEMPTMO: TFloatField;
      qryEventoDocHMETIPOMOV: TFloatField;
      qryItensABaixarIDHISTMOVEMPTMO: TFloatField;
      qryItensABaixarIDCONTRATOEMPTMO: TFloatField;
      qryItensABaixarIDITEMEMPTMO: TFloatField;
      qryItensABaixarCODDOCUMENTO: TFloatField;
      qryItensABaixarHMEANOCOMPETENCIA: TFloatField;
      qryItensABaixarHMEMESCOMPETENCIA: TFloatField;
      qryItensABaixarHMEANOCOBRANCA: TFloatField;
      qryItensABaixarHMEMESCOBRANCA: TFloatField;
      qryItensABaixarHMETIPOMOV: TFloatField;
      qryItensABaixarHMEORIGEM: TFloatField;
      qryItensABaixarHMERECPAG: TStringField;
      qryItensABaixarHMEFORMACOBRANCA: TStringField;
      qryItensABaixarHMESEQCOBRANCA: TFloatField;
      qryItensABaixarIDRUBRICA: TFloatField;
      qryItensABaixarHMEPRIORIDADE: TFloatField;
      qryItensABaixarHMEDATAATUALIZA: TDateTimeField;
      qryItensABaixarHMESALDODEV: TFloatField;
      qryItensABaixarHMETXJUROS: TFloatField;
      qryItensABaixarIDREGRA: TFloatField;
      qryItensABaixarHMEPARCELA: TFloatField;
      qryItensABaixarHMEPARCELAALT: TFloatField;
      qryItensABaixarHMENUMPARCELAS: TFloatField;
      qryItensABaixarHMECENTRALIZA: TFloatField;
      qryItensABaixarHMEDESTACADO: TFloatField;
      qryItensABaixarHMEVLRPREVISTO: TFloatField;
      qryItensABaixarHMEVLREFETIVO: TFloatField;
      qryItensABaixarHMEDATAPREVISTA: TDateTimeField;
      qryItensABaixarHMEDATAVENCTO: TDateTimeField;
      qryItensABaixarHMEDATAEFETIVA: TDateTimeField;
      qryItensABaixarFLGBAIXADO: TFloatField;
      qryItensABaixarFLGDIVERGPEND: TFloatField;
      qryItensABaixarFLGBAIXAMANUAL: TFloatField;
      qryItensABaixarFLGESTORNADO: TFloatField;
      qryItensABaixarFLGQUITADO: TFloatField;
      qryItensABaixarFLGABONADO: TFloatField;
      qryHistMovHMEPARCELAALT: TFloatField;
      qryHistMovQuitadoHMEPARCELAALT: TFloatField;
      qryHistMovAgrupadoHMEPARCELAALT: TFloatField;
      qryEventoDocHMEORIGEM: TFloatField;
      Panel5: TPanel;
      Label7: TLabel;
      edtCodDocumento: TEdit;
    qryItensABaixarIDTIPOCONTREMPTMO: TFloatField;
    qryItemProcesso: TwwQuery;
    qryItemProcessoIDITEMEMPTMO: TFloatField;
    qryItemProcessoIDTIPOCONTREMPTMO: TFloatField;
    qryItemProcessoIDPROCESSO: TFloatField;
    qryItemProcessoFLGTIPOITEM: TFloatField;
    QryAux: TwwQuery;  // Wylliam Silva kINTANA: 1503641 SOL: 168747
    QryValorAcertoConcessao: TwwQuery;
    QryContratos: TwwQuery;
    QryValorAcertoConcessaoHMEVLRPREVISTO: TFloatField;
    QryContratosIDCONTRATOEMPTMO: TFloatField;
    QryDatas: TwwQuery;
    QryDatasDATAPREV: TDateTimeField;
    QryDatasDATACONC: TDateTimeField;
    qryUpdateContratos: TwwQuery;
    qryUpdateContratosFinal: TwwQuery;
    rgProcessamento: TRadioGroup;
    SP_PROC: TStoredProc;
    qryResultado: TwwQuery;
    gbFormaRecDif: TGroupBox;
    btnAtribuiParametro: TSpeedButton;
    DBcboFormaRecebimento: TwwDBLookupCombo;
    btnLimpaFormaRecebimento: TBitBtn;

//    edtIdContrato : TEdit;

      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure pgcControleChange(Sender: TObject);
      procedure molMutuariobtnBuscaPartClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure edtCodDocumentoExit(Sender: TObject);
      procedure edtCodDocumentoKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure SP_RECEBIMENTO_AUTOMATICO(vPatro :String);

    procedure edtDataEfetivaIniChange(Sender: TObject);
    procedure edtDataEfetivaFimChange(Sender: TObject);
    function Meses :Integer;
    procedure btnVoltarClick(Sender: TObject);
    procedure chkCaRClick(Sender: TObject);
    procedure btnAtribuiParametroClick(Sender: TObject);
    procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
    procedure molMutuariobtnLimpaPartClick(Sender: TObject);
    procedure btnLimpaFormaRecebimentoClick(Sender: TObject);

   private // Private declarations

      rConcessao        : TDadosConcessao;
      dDataAtualizacao  : TDateTime;
      rSaldoDevAnt      : TSaldoDevAnt;

      vItens            : TListaItem;

      teste             :integer;

      iPais             : Integer;
      sEstado           : String;
      iCidade           : Integer;

      rLogTotalPrev     : TLogTotalPrev;

      bVerificacao      : Boolean;  // Wylliam Silva kINTANA: 1503641 SOL: 168747

      // -------------------------------------------------------------------------------------------

      procedure AbreQueries;
      function  VerificaPreenchimento: Boolean;

      // -------------------------------------------------------------------------------------------

      procedure AbreCaPCaR(const iPatro   : Int64;
                           const sRecPag  : String
                          );

      function  RecebimentoCaPCar(const iIndicePatro: Integer;
                                  const sRecPag     : String
                                 ): Currency;

      function  RecebeDocumentoCaPCaR(const sRecPag: String): Currency;

      function  BaixaTodosItensDocumento(const iDocumento  : Extended;
                                         const dDataBaixa  : TDateTime;
                                         const bDivergente : Boolean;
                                         const iTipoDiverg : Integer
                                        ): Integer;

      function  ProcessaBaixaParcial(const fDocumento: Extended;
                                     const fVlrBaixa : Currency;
                                     const dDataBaixa: TDateTime
                                    ): Integer;

      // -------------------------------------------------------------------------------------------

      procedure AbreTMPDESC(const iPatro: Int64);

      function  RecebimentoTMPDESC(const iIndicePatro: Integer): Currency;

      function  RecebeParcelaTmpDesc: Currency;
      function  RecebeParcelaTmpDescAgrupada: Currency;

      function  EncontrouRegistro(const IDHist          : Extended;
                                  const IDContrato      : Extended;
                                  const iAnoCobranca    : Integer;
                                  const iMesCobranca    : Integer;
                                  const iAnoCompetencia : Integer;
                                  const iMesCompetencia : Integer
                                 ): Boolean;

      function  EncontrouRegistroAgrupado(const IDTMPDESC       : Extended;
                                          const IDContrato      : Extended;
                                          const iAnoCobranca    : Integer;
                                          const iMesCobranca    : Integer;
                                          const iAnoCompetencia : Integer;
                                          const iMesCompetencia : Integer
                                         ): Integer;

      function  EncontrouRegistroQuitado(const IDHist          : Extended;
                                         const IDContrato      : Extended;
                                         const iAnoCobranca    : Integer;
                                         const iMesCobranca    : Integer;
                                         const iAnoCompetencia : Integer;
                                         const iMesCompetencia : Integer
                                        ): Boolean;

      function  EncontrouRegistroQuitadoAgrupado(const IDTMPDESC       : Extended;
                                                 const IDContrato      : Extended;
                                                 const iAnoCobranca    : Integer;
                                                 const iMesCobranca    : Integer;
                                                 const iAnoCompetencia : Integer;
                                                 const iMesCompetencia : Integer
                                                ): Integer;

      // -------------------------------------------------------------------------------------------

      function  TotalizaVlrHist(const IDTMPDESC       : Extended;
                                const IDContrato      : Extended;
                                const iAnoCobranca    : Integer;
                                const iMesCobranca    : Integer;
                                const iAnoCompetencia : Integer;
                                const iMesCompetencia : Integer
                               ): Currency;

      function  BaixaTodosRegistrosHist(const IDTMPDESC       : Extended;
                                        const IDContrato      : Extended;
                                        const iAnoCobranca    : Integer;
                                        const iMesCobranca    : Integer;
                                        const iAnoCompetencia : Integer;
                                        const iMesCompetencia : Integer;
                                        const dDataBaixa      : TDateTime
                                       ): Integer;

      // -------------------------------------------------------------------------------------------
      procedure InsereDiferencaHist(var   qryLocal   : TwwQuery;
                                    const NovosDados : TNovosDados
                                   );

      procedure InsereInesperado(const IDContrato      : Extended;
                                 const IDTipoContr     : Int64;
                                 const fVlrInserir     : Currency;
                                 const dData           : TDateTime;
                                 const sFormaCobranca  : String;
                                 const sTipoFolha      : String
                                );
      // -------------------------------------------------------------------------------------------

      function  VerificaEventoDoc: Boolean;

      function  DesfazAmortizacaoQuitacao(const IDContrato  : Extended;
                                          const iEvento     : Integer;
                                          const iOrigem     : Integer;
                                          const dDataVencto : TDateTime
                                         ): Integer;

      function  DesfazQuitacaoAcertoConcessao(const IDContrato  : Extended;
                                              const VlrRecebido : Currency;
                                              const dData       : TDateTime
                                             ): Integer;


      function EhRefinanciamento: Boolean;

      // -------------------------------------------------------------------------------------------

   public // Public declarations
     datainicio : string;
     dataFim : string;
     vMes    : Integer;
   end;



var
  frmExecRecebimento: TfrmExecRecebimento;



implementation
{$R *.DFM}
uses
   USistema,
   UDataBase,
   UMensErro,
   FProgresso,
   dBaseDados,
   uModulo,
   uVerificaPreenchimento,
   DLookEmptmo,
   dMS,
   uIntegraEmptmo,
   DEmptmo,
   uDiasUteis,
   UCalcEmptmo,
   dAtualizacaoDiaria,
   fAguarde;

procedure TfrmExecRecebimento.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   //Leandro Pocebon - SIG129599 - 14/12/2022 - Inicio
   with dtmLookEmptmo.qryLookPortadorFormaR do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
   //Leandro Pocebon - SIG129599 - 14/12/2022 - Fim

end;

function  TfrmExecRecebimento.VerificaPreenchimento: Boolean;
begin
     teste := cboMes.ItemIndex;
	Result := False;

	try
      if (cboMes.ItemIndex < 0) then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Cobrança!', cboMes);

      if DBspnAno.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o Ano de Cobrança!', DBspnAno);

   except

      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then
            ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;

function TfrmExecRecebimento.RecebimentoCaPCar(const iIndicePatro: Integer;
                                               const sRecPag     : String
                                              ): Currency;
var
   iContador      : Integer;
   fValor         : Currency;
   fValorPatro    : Currency;
   sTextoRecPag   : String;
   sTextoPatro    : String;
begin
   try
      fValorPatro := 0;

      if ((chkCaP.Checked) and (sRecPag = 'P')) or ((chkCaR.Checked) and (sRecPag = 'R')) then
      begin
         case sRecPag[1] of
            'P': sTextoRecPag := 'a Pagar';
            'R': sTextoRecPag := 'a Receber';
         end;

         MostraEspera('Verificando valores do Financeiro (' + sTextoRecPag + ')...');

         // André Pontes - 24/08/2004
         if iIndicePatro = -1 then
         begin
            sTextoPatro := '';
            AbreCaPCar(-1, sRecPag);
         end
         else
         begin
            sTextoPatro := ' ' + molListaPatro.lstPatro.Items[iIndicePatro];
            AbreCaPCar(molListaPatro.vIDPatro[iIndicePatro], sRecPag);
         end;
         // FIM André Pontes - 24/08/2004

         EscondeEspera;

         frmProgresso.MostraFormProgresso('Realizando Recebimentos do Financeiro (' + sTextoRecPag + ')' +
                                          sTextoPatro + '...',
                                          True,
                                          True,
                                          True,
                                          0,
                                          qryItensCaPCaR.RecordCount
                                         );

         iContador   := 0;
         // ----------------------------------------------------------------------------------
         while not(qryItensCaPCaR.EOF) do
         begin
            if frmProgresso.Cancelou then
               Break; // interrompeu o processo

            if not(dtmBaseDados.dbBaseDados.InTransaction) then
               StartTransacao;

            try
               fValor := RecebeDocumentoCaPCaR(sRecPag);

               if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
            except
               if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
            end;

            // Totalizador
            fValorPatro := fValorPatro + fValor;

            inc(iContador);
            frmProgresso.AndaFormProgresso(iContador);

            qryItensCaPCaR.Next;// SOL 166988 Kintana 1467574 - Vinicius Ferreira

         end; // while not(EOF)
         // ----------------------------------------------------------------------------------
      end;

   finally
      frmProgresso.EscondeFormProgresso;

      Result := fValorPatro;

      qryItensCaPCaR.Close;
   end;
end;

procedure TfrmExecRecebimento.AbreCaPCaR(const iPatro: Int64; const sRecPag: String);
var
   sSQL              : String;

   dDataIni          : TDateTime;
   dDataFim          : TDateTime;
begin
   dDataIni := EncodeDate(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataFim := DiasUteis.UltDiaMes(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   HME.CODDOCUMENTO, '                                                                         + #13 +
   // Marchetti - Pendencia 26943
   // Acerto na pendencia 26630, pois a mesma so alterou a query no objeto, mas como a mesma é reescrita
   // em tempo de execução, o problema relatado na pendencia 26630 persistia
//   '   ROUND(SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))), 2) AS VLR_PREVISTO_DOC, '                       + #13 +
   '   ROUND( SUM( DECODE( HME.HMERECPAG, ''P'', ABS( NVL( HME.HMEVLRPREVISTO, 0 ) ), '            + #13 +
   '               DECODE( HME.HMETIPOMOV, 0,  ABS( NVL( HME.HMEVLRPREVISTO, 0 ) ),  '             + #13 +
   '                                                NVL( HME.HMEVLRPREVISTO, 0 ) ) ) ), 2) AS VLR_PREVISTO_DOC, ' + #13 +
   // Fim Marchetti - Pendencia 26943
   '   HME.HMEDATAVENCTO '                                                                         + #13 +
   'FROM '                                                                                         + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                      + #13 +
   '   DOCUMENTO       DOC, '                                                                      + #13;

   sSQL := sSQL +
   '   ( '                                                                                         + #13 +
   '   SELECT '                                                                                    + #13 +
   '      DCO.CODDOCUMENTO, '                                                                      + #13 +
   '      MAX(DATABAIXA) AS DATABAIXA '                                                            + #13 +
   '   FROM '                                                                                      + #13 +
   '      RECBTOPAGTO  RCP, '                                                                      + #13 +
   '      DOCUMENTO    DCO '                                                                       + #13 +
   '   WHERE '                                                                                     + #13 +
   '          DCO.RECPAG             = ' + QuotedStr(sRecPag)                                      + #13 +
   '      AND DCO.IDMODULO           in (15,18) '                                                  + #13;  //Fanuel Junior SOL162334 Kintana1379628

   // ----------------------------------------------------------------------------------------------

   //Leandro Pocebon - SIG129599 - Inicio
   if (chkCaR.Checked) and (sRecPag = 'R') and (trim(DBcboFormaRecebimento.LookupValue) <> EmptyStr) then
        sSQL := sSQL + ' AND DCO.CODPORTFORMA = ' + DBcboFormaRecebimento.LookupValue              + #13;
   //Leandro Pocebon - SIG129599 - Inicio

   if length(trim(edtCodDocumento.Text)) > 0 then
      sSQL := sSQL +
   '      AND DCO.CODDOCUMENTO       = ' + trim(edtCodDocumento.Text)                             + #13
   else
   begin
      if length(trim(edtDataEfetivaIni.Text)) > 0 then
         sSQL := sSQL +
   '      AND RCP.DATABAIXA      >= ' + OraData(edtDataEfetivaIni.Date)                            + #13
      else sSQL := sSQL +

   //Pendência 22880 - 20/07/2006 - Alberto
   '      AND DCO.DATAVENCTO     >= ' + OraData(dDataIni)                                          + #13;

      if length(trim(edtDataEfetivaFim.Text)) > 0 then
          sSQL := sSQL +
   '      AND RCP.DATABAIXA      <= ' + OraData(edtDataEfetivaFim.Date)                            + #13
      else sSQL := sSQL +
   '      AND DCO.DATAVENCTO     <= ' + OraData(dDataFim)                                          + #13;
   //Fim Pendência 22880
   end;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '      AND DCO.CODDOCUMENTO       = RCP.CODDOCUMENTO '                                          + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      DCO.CODDOCUMENTO '                                                                       + #13 +
   '   ) REC, '                                                                                    + #13 +

   '   CONTRATOEMPTMO  CON, '                                                                      + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                      + #13 +
   '   TIPOEMPTMO      TEP '                                                                       + #13 +

   'WHERE '                                                                                        + #13 +
   '       TEP.IDEMPRESAPROP         = ' + FormatFloat('#0', Sistema.IDEmpresa)                    + #13;

   // ----------------------------------------------------------------------------------------------

   if sRecPag = 'R' then sSQL := sSQL +
   '   AND CON.IDPATRO               = ' + FormatFloat('#0', iPatro)                               + #13;

   // ----------------------------------------------------------------------------------------------

   if length(trim(edtCodDocumento.Text)) > 0 then sSQL := sSQL +
   '   AND DOC.CODDOCUMENTO          = ' + edtCodDocumento.Text                                    + #13
   else
   begin
      if length(trim(edtDataEfetivaIni.Text)) > 0 then sSQL := sSQL +

      //Pendência 22880 - 20/07/2006 - Alberto
   '  AND ( REC.DATABAIXA             >= ' + OraData(edtDataEfetivaIni.Date) +
   '  OR ( REC.DATABAIXA IS NULL AND HME.HMEDATAVENCTO >= ' + OraData(edtDataEfetivaIni.Date) + '))' + #13;

      if length(trim(edtDataEfetivaFim.Text)) > 0 then sSQL := sSQL +
   '  AND ( REC.DATABAIXA             <= ' + OraData(edtDataEfetivaFim.Date) +
   '  OR ( REC.DATABAIXA IS NULL AND HME.HMEDATAVENCTO <= ' + OraData(edtDataEfetivaFim.Date) + '))' +  #13;
      //Fim Pendência 22880
   end;

   // ----------------------------------------------------------------------------------------------

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND TCE.IDTIPOEMPTMO           = ' + DBcboTipoEmptmo.LookupValue                             + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO      = ' + DBcboTipoContrato.LookupValue                           + #13;

   if molMutuario.IDBenef > 0 then sSQL := sSQL +
   '  AND CON.IDBENEF                = ' + FormatFloat('#0', molMutuario.IDBenef)                  + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '  AND CON.IDCONTRATOEMPTMO       = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;
       
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND DOC.RECPAG                = ' + QuotedStr(sRecPag)                                      + #13 +
   '   AND LTRIM(RTRIM(DOC.STATUS))  = ''2'' '                                                     + #13 +

   '   AND HME.HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)                     + #13 +
   '   AND HME.HMEMESCOBRANCA        = ' + FormatFloat('00', (cboMes.ItemIndex + 1))               + #13 +

   '   AND HME.FLGBAIXADO            = 0 '                                                         + #13 +
   '   AND HME.HMETIPOMOV            NOT IN (5, 8) '                                               + #13 +

   '   AND HME.HMEVLREFETIVO         IS NULL '                                                     + #13 +
   '   AND HME.HMEDATAEFETIVA        IS NULL '                                                     + #13 +

   '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ) '                            + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0)  = 0 '                                                         + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)    = 0 '                                                         + #13 +
   '   AND NVL(HME.FLGABONADO, 0)    = 0 '                                                         + #13 +

   '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '                                      + #13 +
   '   AND HME.CODDOCUMENTO          = DOC.CODDOCUMENTO '                                          + #13 +
   '   AND DOC.CODDOCUMENTO          = REC.CODDOCUMENTO(+) '                                       + #13 +
   '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO '                                     + #13 +
   '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO '                                          + #13 +

   'GROUP BY '                                                                                     + #13 +
   '   HME.CODDOCUMENTO, HME.HMEDATAVENCTO ';

   with qryItensCaPCaR do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-ItensRecebimento' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-ItensRecebimento' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.txt');
      Open;
   end;
end;



function TfrmExecRecebimento.RecebeDocumentoCaPCaR(const sRecPag: String): Currency;
var
   fVlrDocumento  : Currency;
   fVlrReceber    : Currency;
   fVlrRecebido   : Currency;
   dDataBaixa     : TDateTime;
   bBaixaDiverg   : Boolean;
begin
   Result         := 0;

   // Guarda os dados do registro processado
   fVlrDocumento  := qryItensCaPCaRVLR_PREVISTO_DOC.AsCurrency;

   // Verifica o valor baixado no Documento
   fVlrReceber    := IntegraEmptmo.VlrBaixadoDoc(qryItensCaPCaRCODDOCUMENTO.AsFloat);

   // Verifica a data de baixa
   dDataBaixa     := IntegraEmptmo.UltDataBaixaDoc(qryItensCaPCaRCODDOCUMENTO.AsFloat);

   // obs:  é possível que um Documento tenha status = '2' (baixado),
   //       mas o valor efetivamente baixado seja ZERO

   if Arredonda(fVlrReceber, 2) = 0 then
   begin
      bBaixaDiverg := True;

      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger  = 1) or
         (dtmEmptmo.qryParamEmptmoFLGTRATQUITCANC.AsInteger = 1) then
      begin
         if VerificaEventoDoc then
         begin
            if (qryEventoDocHMETIPOMOV.AsInteger in [2, 3]) or
               ((qryEventoDocHMETIPOMOV.AsInteger = 0) and (qryEventoDocHMEORIGEM.AsInteger = 13)) then
            begin
               if not(EhRefinanciamento) then // André Pontes - pendências 23358/26875/26896 - 03/01/2008
               begin
               DesfazAmortizacaoQuitacao(qryEventoDocIDCONTRATOEMPTMO.AsFloat,
                                         qryEventoDocHMETIPOMOV.AsInteger,
                                         qryEventoDocHMEORIGEM.AsInteger,
                                         qryItensCaPCaRHMEDATAVENCTO.AsDateTime
                                        );
               end;
                                                
               bBaixaDiverg := False;
            end;  // if qryEventoDocHMETIPOMOV in [2, 3]
         end;  // if VerificaEventoDoc

         qryEventoDoc.Close;
      end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1

      if bBaixaDiverg then // André Pontes - 04/10/2005 - pendência 20409
      begin
         BaixaTodosItensDocumento(qryItensCaPCaRCODDOCUMENTO.AsFloat,
                                  dDataBaixa,
                                  True,   // bDivergente
                                  6       // Valor não será recebido
                                 );

         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Documento ' +
                             CompletaInicio(FormatFloat('#0', qryItensCaPCaRCODDOCUMENTO.AsFloat), ' ', 15) +
                             ' - Itens marcados como NÃO RECEBIDOS '
                            );
         memResult.Lines.Add(' ');
      end;  // if bBaixaDiverg

      Exit;
   end;  // if Arredonda(fVlrReceber, 2) = 0

   //BRUNO AZEVEDO SOL 167580
   if trim(sRecPag) = 'R' then
   begin
      if VerificaEventoDoc then // xavier  //SOL 167580 Monica Gonzaga
      begin

        qryEventoDoc.first;
        while not(qryEventoDoc.Eof) do
        begin
           //BRUNO AZEVEDO SOL 177663 KINTANA 1629931
           if ((qryEventoDocHMETIPOMOV.AsInteger = 0) and (qryEventoDocHMEORIGEM.AsInteger = 13)) then
           begin
             QryValorAcertoConcessao.close;
             QryValorAcertoConcessao.ParamByName('PIDCONTRATOEMPTMO').AsFloat :=  qryEventoDocIDCONTRATOEMPTMO.AsFloat;
             QryValorAcertoConcessao.open;

             if QryValorAcertoConcessao.FieldByName('HMEVLRPREVISTO').AsFloat = 0 then  //BRUNO AZEVEDO SOL 167580
             begin
                DesfazQuitacaoAcertoConcessao(qryEventoDocIDCONTRATOEMPTMO.AsFloat,
                                              fVlrReceber,
                                              qryItensCaPCaRHMEDATAVENCTO.AsDateTime
                                              );
             end; // xavier  //SOL 167580 Monica Gonzaga
           end; //BRUNO AZEVEDO SOL 177663 KINTANA 1629931
           qryEventoDoc.next;
        end;
      end;
   end;

   Result := fVlrReceber;

   // Verifica se o valor baixado do Documento corresponde ao esperado
   if ( FormatFloat('#,#0.00', Arredonda(fVlrReceber, 2)) = FormatFloat('#,#0.00', Arredonda(fVlrDocumento, 2)) ) then
   begin
      // Baixa todos os itens de uma só vez
      if dDataBaixa <= qryItensCaPCaRHMEDATAVENCTO.AsDateTime then
      begin
         // ----------------------------------------------------------------------------------------
         // Baixa sem divergência
         // ----------------------------------------------------------------------------------------
         if BaixaTodosItensDocumento(qryItensCaPCaRCODDOCUMENTO.AsFloat,
                                     dDataBaixa,
                                     False,  // bDivergente
                                     0       // tipo de divergência (nesse caso não importa)
                                     ) <= 0 then
         begin
            memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Documento ' +
                                CompletaInicio(FormatFloat('#0', qryItensCaPCaRCODDOCUMENTO.AsFloat), ' ', 15) +
                                ' - Baixa de todos os itens (sem divergência) '
                               );

            memResult.Lines.Add(' ');
         end;
         // ----------------------------------------------------------------------------------------
      end
      else // if dDataBaixa <= qryItensCaPCaRHMEDATAVENCTO.AsDateTime
      begin
         // ----------------------------------------------------------------------------------------
         // Baixa com divergência de datas
         // ----------------------------------------------------------------------------------------
         if BaixaTodosItensDocumento(qryItensCaPCaRCODDOCUMENTO.AsFloat,
                                     dDataBaixa,
                                     True,   // bDivergente
                                     5       // divergência de datas
                                     ) <= 0 then
         begin
            memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Documento ' +
                                CompletaInicio(FormatFloat('#0', qryItensCaPCaRCODDOCUMENTO.AsFloat), ' ', 15) +
                                ' - Baixa de todos os itens (divergência de datas) '
                               );

            memResult.Lines.Add(' ');
         end;
         // ----------------------------------------------------------------------------------------
      end; // if dDataBaixa <= qryItensCaPCaRHMEDATAVENCTO.AsDateTime

      // André Pontes - 24/08/2004
      // -------------------------------------------------------------------------------------------
      //    Acerto da situação do Contrato
      // -------------------------------------------------------------------------------------------

      // Aqui é necessário abrir os contratos que estão dentro de cada documento para iterar pelos
      // mesmos e acertar a situação contratual
      // Será aproveitada a qryItensABaixar, a mesma usada no processo de baixa parcial. Não é a
      // forma mais otimizada (pq, como pega por item, repete os contratos, e o acerto da situação é
      // por contrato - o que fará mais de um acerto por contrato, potencialmente), mas permite
      // reutilizar uma query ja pronta

      // seleciona os itens (na HistMovEmptmo) que compõem o Documento
      with qryItensABaixar do
      begin
         LimpaParametros(qryItensABaixar);
         ParamByName('PCODDOCUMENTO').AsFloat := qryItensCaPCaRCODDOCUMENTO.AsFloat;
         ParamByName('PJABAIXADO').AsInteger  := 1;
         Open;
      end;

      qryItensABaixar.First;
      while not(qryItensABaixar.EOF) do
      begin
         CalcEmptmo.AcertaSituacaoContratual(qryItensABaixarIDCONTRATOEMPTMO.AsFloat, 11);
         Application.ProcessMessages;
         qryItensABaixar.Next;
         // ----------------------------------------------------------------------------------------
      end; // while not(qryItensABaixar.EOF)

      // -------------------------------------------------------------------------------------------
      //    FIM Acerto da situação do Contrato
      // -------------------------------------------------------------------------------------------
      // FIM André Pontes - 24/08/2004


   end
   else // if Arredonda(fVlrReceber, 2) = Arredonda(fVlrDocumento, 2)
   begin
      // -------------------------------------------------------------------------------------------
      //    Processamento de baixa Parcial
      // -------------------------------------------------------------------------------------------

      if sRecPag = 'R' then
      begin
         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Documento ' +
                             CompletaInicio(FormatFloat('#0', qryItensCaPCaRCODDOCUMENTO.AsFloat), ' ', 15) +
                             ' - Baixa parcial (' +
                             FormatFloat('#,#0.00', Arredonda(fVlrReceber, 2)) + ' vs. ' +
                             FormatFloat('#,#0.00', Arredonda(fVlrDocumento, 2)) + ') '
                            );

         memResult.Lines.Add(' ');

         ProcessaBaixaParcial(qryItensCaPCaRCODDOCUMENTO.AsFloat, fVlrDocumento, dDataBaixa);
      end
      else
      begin
         Result := 0;

         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Documento ' +
                             CompletaInicio(FormatFloat('#0', qryItensCaPCaRCODDOCUMENTO.AsFloat), ' ', 15) +
                             ' - Divergência de valores: ' +
                             FormatFloat('#,#0.00', Arredonda(fVlrReceber, 2)) + ' vs. ' +
                             FormatFloat('#,#0.00', Arredonda(fVlrDocumento, 2)) + ' - Baixa NÃO EFETUADA '
                            );

         memResult.Lines.Add(' ');
      end;

      // -------------------------------------------------------------------------------------------
   end; // if Arredonda(fVlrReceber, 2) = Arredonda(fVlrDocumento, 2)

   // Pendencia 16894
   IntegraEmptmo.ConciliaDocumento(qryItensCaPCaRCODDOCUMENTO.AsFloat, 0);
end;



function TfrmExecRecebimento.ProcessaBaixaParcial(const fDocumento: Extended;
                                                  const fVlrBaixa : Currency;
                                                  const dDataBaixa: TDateTime
                                                 ): Integer;
var
   bBaixado          : Boolean;
   bDivergente       : Boolean;
   bDivergTrat       : Boolean;
   iTipoDiverg       : Integer;
   fVlrRestante      : Currency;
   fVlrEfetivo       : Currency;
   fDiferenca        : Currency;
   NovosDadosParcela : TNovosDados;
begin
   Application.ProcessMessages;

   // inicializa o valor restante com o valor baixado no Documento
   fVlrRestante   := fVlrBaixa;

   // seleciona os itens (na HistMovEmptmo) que compõem o Documento
   with qryItensABaixar do
   begin
      LimpaParametros(qryItensABaixar);
      ParamByName('PCODDOCUMENTO').AsFloat := fDocumento;
      Open;
   end;

   qryItensABaixar.First;
   while not(qryItensABaixar.EOF) do
   begin
      // -------------------------------------------------------------------------------------------
      //    Baixa item a item, subtraindo do valor restante a baixar
      // -------------------------------------------------------------------------------------------

      bBaixado       := False;
      bDivergente    := False;
      bDivergTrat    := False;
      iTipoDiverg    := -1;

      // enquanto houver valor restante, haverá valor a baixar
      if fVlrRestante > 0 then
      begin
         bBaixado    := True;    // haverá valor recebido

         if Arredonda(fVlrRestante, 2) < Arredonda(abs(qryItensABaixarHMEVLRPREVISTO.AsCurrency), 2) then
         begin
            bDivergTrat := True;    // será considerada tratada pq há inserção da diferença
            iTipoDiverg := 3;       // valor menor que o esperado

            fVlrEfetivo := fVlrRestante;
            fDiferenca  := abs(qryItensABaixarHMEVLRPREVISTO.AsCurrency) - fVlrRestante;

            // se o item já era negativo, a diferença também deve ser
            if (qryItensABaixarHMEVLRPREVISTO.AsCurrency < 0) then
                fDiferenca := fDiferenca * (-1);

            // -------------------------------------------------------------------------------------
            //    Inserção da Diferença
            // -------------------------------------------------------------------------------------

            // Prepara os dados para inserção da diferença no Histórico
            NovosDadosParcela.ValorPrevisto  := fDiferenca;
            NovosDadosParcela.ValorEfetivo   := 0;
            NovosDadosParcela.IDItemEmptmo   := qryItensABaixarIDITEMEMPTMO.AsInteger;

            NovosDadosParcela.SeqCobranca    := qryItensABaixarHMESEQCOBRANCA.AsInteger + 1;

            NovosDadosParcela.FlgEnvio       := 0;
            NovosDadosParcela.FlgBaixado     := 0;
            NovosDadosParcela.FlgDivergPend  := 1;
            NovosDadosParcela.FlgTipoDiverg  := iTipoDiverg;

            NovosDadosParcela.AnoCompetencia := qryItensABaixarHMEANOCOMPETENCIA.AsInteger;
            NovosDadosParcela.MesCompetencia := qryItensABaixarHMEMESCOMPETENCIA.AsInteger;
            NovosDadosParcela.AnoCobranca    := qryItensABaixarHMEANOCOBRANCA.AsInteger;
            NovosDadosParcela.MesCobranca    := qryItensABaixarHMEMESCOBRANCA.AsInteger;

            NovosDadosParcela.DataPrevista   := qryItensABaixarHMEDATAPREVISTA.AsDateTime;
            NovosDadosParcela.DataVencto     := qryItensABaixarHMEDATAVENCTO.AsDateTime;
            NovosDadosParcela.DataEfetiva    := 0;

            NovosDadosParcela.FormaCoranca   := 'C';
            NovosDadosParcela.TipoFolha      := '';

            // -------------------------------------------------------------------------------------

            // Inclui diferença a receber no Historico
            InsereDiferencaHist(qryItensABaixar, NovosDadosParcela);

            // -------------------------------------------------------------------------------------
         end
         else  // if fVlrRestante < abs(qryItensABaixarHMEVLRPREVISTO.AsCurrency)
         begin
            // o valor restante é maior ou igual ao valor previsto
            bDivergente := False;

            fVlrEfetivo := qryItensABaixarHMEVLRPREVISTO.AsCurrency;

         end;  // if fVlrRestante < abs(qryItensABaixarHMEVLRPREVISTO.AsCurrency)
         // ----------------------------------------------------------------------------------------
      end
      else // if fVlrRestante > 0
      begin
         // fVlrRestante <= 0
         // não há mais valor restante no documento
         bBaixado       := False;
         bDivergente    := True;
         bDivergTrat    := False;
         iTipoDiverg    := 6;       // Valor não será recebido


      end; // if fVlrRestante > 0


      // -------------------------------------------------------------------------------------------
      //    Baixa do Item
      // -------------------------------------------------------------------------------------------
      with qryUpdateHistMov do
      begin
         LimpaParametros(qryUpdateHistMov);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat      := qryItensABaixarIDCONTRATOEMPTMO.AsFloat;
         ParamByName('PIDHISTMOVEMPTMO').AsFloat       := qryItensABaixarIDHISTMOVEMPTMO.AsFloat;

         ParamByName('PHMEFORMACOBRANCA').AsString       := 'C';
         ParamByName('PHMEDATARECEB').AsDate             := Sysdate;


         if bBaixado then
         begin
            ParamByName('PFLGRECEBIMENTO').AsInteger     := 0;
            //BRUNO AZEVEDO SOL 127656 KINTANA 744421
            if (dDataBaixa > 0) then begin
               ParamByName('PHMEDATAEFETIVA').AsDateTime    := dDataBaixa;
            end else begin
               ParamByName('PHMEDATAEFETIVA').Clear;
            end;
            //BRUNO AZEVEDO SOL 127656 KINTANA 744421
            ParamByName('PHMEVLREFETIVO').AsCurrency     := fVlrEfetivo;

            // se for devolução, inverte o sinal do valor efetivo
            if (qryItensABaixarHMEVLRPREVISTO.AsCurrency < 0) then
                ParamByName('PHMEVLREFETIVO').AsCurrency := fVlrEfetivo * (-1);
         end
         else // if bBaixado
         begin
            ParamByName('PFLGBAIXADO').AsInteger         := 0;
         end;

         if bDivergente then
         begin
            ParamByName('PFLGDIVERGPEND').AsInteger      := 1;
            if (iTipoDiverg > 0) then
                ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
         end;

         if bDivergTrat then
         begin
            ParamByName('PFLGDIVERGTRAT').AsInteger      := 1;
            if (iTipoDiverg > 0) then
                ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
         end;

         // só grava divergente/tratado se não for quitação tampouco amortização
         qryUpdateHistMov.ExecSQL;
      end;
      bVerificacao := True;    // Wylliam Silva kINTANA: 1503641 SOL: 168747
      // -------------------------------------------------------------------------------------------
      //    FIM da Baixa do Item
      // -------------------------------------------------------------------------------------------


      // Abate do valor restante o valor do item atual
      fVlrRestante := fVlrRestante - abs(qryItensABaixarHMEVLRPREVISTO.AsCurrency);

      // André Pontes - 24/08/2004
      // -------------------------------------------------------------------------------------------
      //    Acerto da situação do Contrato
      // -------------------------------------------------------------------------------------------
      CalcEmptmo.AcertaSituacaoContratual(qryItensABaixarIDCONTRATOEMPTMO.AsFloat, 11);

      qryItensABaixar.Next;
      // -------------------------------------------------------------------------------------------
   end; // while not(qryItensABaixar.EOF)


   // Se, terminados os itens do Documento, ainda houver algum valor a baixar...
   if (fVlrRestante > 0) then
   begin
      // -------------------------------------------------------------------------------------------
      //    Tratamento para recebimento "inesperado"
      // ---------------------------------------------------------------------------------------
      InsereInesperado(qryTmpDesc.FieldByName('IDDESCONTO').AsFloat,
                       qryTmpDesc.FieldByName('IDTIPOCONTREMPTMO').AsInteger,
                       fVlrRestante,
                       dDataBaixa,
                       'C',
                       ''
                       );
     // ---------------------------------------------------------------------------------------
   end;
end;



function TfrmExecRecebimento.BaixaTodosItensDocumento(const iDocumento  : Extended;
                                                      const dDataBaixa  : TDateTime;
                                                      const bDivergente : Boolean;
                                                      const iTipoDiverg : Integer
                                                     ): Integer;
begin
   try
      if iTipoDiverg = 6 then
      begin
         with qryBaixaItensZero do
         begin
            LimpaParametros(qryBaixaItensZero);
            ParamByName('PCODDOCUMENTO').AsFloat       := iDocumento;

            if bDivergente then
            begin
               ParamByName('PFLGDIVERGPEND').AsInteger   := 1;
               ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
            end; // bDivergente
            ExecSQL;

            Result := RowsAffected;
         end;
      end
      else
      begin
         with qryBaixaItensDoc do
         begin
            LimpaParametros(qryBaixaItensDoc);
            ParamByName('PCODDOCUMENTO').AsFloat         := iDocumento;
            //BRUNO AZEVEDO SOL 127656 KINTANA 744421
            if (dDataBaixa > 0) then begin
               ParamByName('PHMEDATAEFETIVA').AsDate    := dDataBaixa;
            end else begin
               ParamByName('PHMEDATAEFETIVA').Clear;
            end;
            //BRUNO AZEVEDO SOL 127656 KINTANA 744421
            ParamByName('PHMEDATARECEB').AsDate          := Sysdate;

            if bDivergente then
            begin
               ParamByName('PFLGDIVERGPEND').AsInteger   := 1;
               ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
            end; // bDivergente
            ExecSQL;

            Result := RowsAffected;

         end;
      end;
   except
      Result := -1;
   end;
end;

function TfrmExecRecebimento.RecebimentoTMPDESC(const iIndicePatro: Integer): Currency;
var
   iContador      : Integer;
   fValor         : Currency;
   fValorPatro    : Currency;
   fContratoAnt   : Extended;
   fContratoPos   : Extended;
begin
   try
      fValorPatro := 0;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      if (chkFolhaPatro.Checked) or (chkFolhaBenef.Checked) then
      begin
         AbreTMPDESC(molListaPatro.vIDPatro[iIndicePatro]);

         frmProgresso.MostraFormProgresso('Realizando Recebimentos Folha ' +
                                          molListaPatro.lstPatro.Items[iIndicePatro] + '...',
                                          True,
                                          True,
                                          True,
                                          0,
                                          qryTmpDesc.RecordCount
                                         );

         iContador      := 0;
         fContratoAnt   := 0;

         // ----------------------------------------------------------------------------------------
         while not(qryTmpDesc.EOF) do
         begin
            // SOL 175961 KINTANA  1635435 inicio
            // Para os flags é importante observar que:
            // flgbaixado  -     NULL -> Baixado       0 (zero) -> não baixado
            // flgquitado  -     1    -> quitado       NULL ou 0 (zero) -> não quitado
            // flgabonado  -     1    -> abonado       NULL ou 0 (zero) -> não abonado

            Qryaux.close;
            Qryaux.sql.clear;
            Qryaux.sql.add(' select 1 from histmovemptmo ');
            Qryaux.sql.add(' where ((flgbaixado is null) or (flgabonado = 1) or (flgquitado = 1 )) ');
            Qryaux.sql.add(' and IDCONTRATOEMPTMO = '+qryTmpDesc.FieldByName('IDDESCONTO').AsString);
            Qryaux.sql.add(' and idtmpdesc        = '+qryTmpDesc.FieldByName('IDTMPDESC').AsString);
            Qryaux.open;

            if not(Qryaux.isEmpty) then // se estiver Baixado - quitado - abonado não executar o processo
            begin
               qryTmpDesc.Next;
               Continue;
            end;
            // SOL 175961 KINTANA  1635435 final

            if frmProgresso.Cancelou then Break; // interrompeu o processo
               fContratoPos := qryTmpDesc.FieldByName('IDDESCONTO').AsFloat;

            if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

            try
               // André Pontes - 12/07/2004
               // Criação de função para receber prestação da TMPDESC especificamente para FUNCEF,
               // onde 1 registro TMPDESC pode corresponder a + de 1 registro da HistMovEmptmo
               if dtmEmptmo.qryParamEmptmoFLGAGRUPAPARCFOL.AsInteger = 1 then
               begin
                  fValor := RecebeParcelaTmpDescAgrupada;
               end
               else
               begin
                  fValor := RecebeParcelaTmpDesc;
               end;
               // FIM André Pontes - 12/07/2004

               // -------------------------------------------------------------------------------
               //    Acerto da situação do Contrato
               // -------------------------------------------------------------------------------
               CalcEmptmo.AcertaSituacaoContratual(qryTmpDesc.FieldByName('IDDESCONTO').AsFloat, 11);

               if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
            except
               if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
            end;

            // Totalizador
            fValorPatro := (fValorPatro + fValor);

            inc(iContador);
            frmProgresso.AndaFormProgresso(iContador);

            qryTmpDesc.Next;

            fContratoAnt := fContratoPos;
         end; // while not(EOF)
         // ----------------------------------------------------------------------------------------
      end;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
   finally
      frmProgresso.EscondeFormProgresso;
      Result := fValorPatro;

      qryTmpDesc.Close;
   end;
end;

procedure TfrmExecRecebimento.AbreTMPDESC(const iPatro: Int64);
var
   sTipoFolha  : String;
   iTipoFolha  : integer;
begin
   // Filtro por tipo de Folha (Benefícios / Patrocinadora) ----------------------------------------

   sTipoFolha := '';

   if chkFolhaPatro.Checked then
   begin
      if chkFolhaBenef.Checked then
      begin
         sTipoFolha := QuotedStr('B') + ',' + QuotedStr('P');
         iTipoFolha := -1;
      end
      else
      begin
         sTipoFolha := QuotedStr('P');
         iTipoFolha := 1;
      end;
   end
   else
   begin
      if chkFolhaBenef.Checked then sTipoFolha := QuotedStr('B');
      iTipoFolha := 2;
   end;

   // ----------------------------------------------------------------------------------------------

   with qryTmpDesc do
   begin
      //LimpaParametros(qryTmpDesc);
      qryTmpDesc.Close;
      qryTmpDesc.ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      qryTmpDesc.ParamByName('PMESCOBRANCA').AsString      := FormatFloat('0000', DBspnAno.Value) + '/' +
                                                              FormatFloat('00', cboMes.ItemIndex + 1);

      qryTmpDesc.ParamByName('PIDPESSJUR').AsInteger       := iPatro;

      if trim(DBcboTipoEmptmo.LookupValue) <> EmptyStr   then
         qryTmpDesc.ParamByName('PIDTIPOEMPTMO').AsInteger        := StrToInt(DBcboTipoEmptmo.LookupValue);
      if trim(DBcboTipoContrato.LookupValue) <> EmptyStr then
         qryTmpDesc.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := StrToInt(DBcboTipoContrato.LookupValue);

      if trim(edtDataEfetivaIni.Text) <> EmptyStr  then
         qryTmpDesc.ParamByName('PHMEDATAEFETIVAINI').AsString  := trim(edtDataEFETIVAIni.Text);
      if trim(edtDataEfetivaFim.Text) <> EmptyStr then
          qryTmpDesc.ParamByName('PHMEDATAEFETIVAFIM').AsString := trim(edtDataEFETIVAFim.Text);

      if iTipoFolha > 0                      then qryTmpDesc.ParamByName('PFLGDESCFOLHA').AsInteger        := iTipoFolha;
      if chkDiverg.Checked                   then qryTmpDesc.ParamByName('PSITENVIO').AsInteger            := 2;
      if molContratoEmptmo.IDContrato > 0    then qryTmpDesc.ParamByName('PIDDESCONTO').AsFloat            := molContratoEmptmo.IDContrato;
      if molMutuario.IDBenef > 0             then qryTmpDesc.ParamByName('PIDPESSOA').AsInteger            := molMutuario.IDBenef;
      if chkCritica.Checked                  then qryTmpDesc.ParamByName('PCRITICA').AsString              := 'X';

      qryTmpDesc.Prepare;
      qryTmpDesc.Open;
   end; // with qryTmpDesc
end;

// Executa o recebimento de uma Parcela de Emprestimo enviada para TMPDESC
function TfrmExecRecebimento.RecebeParcelaTmpDesc: Currency;
var
   NovosDadosParcela                : TNovosDados;

   IDTmpDesc, IDHistMov, IDContrato : Extended;
   IDMutuario, IDRubrica            : Int64;

   iPlanilha, iDocumento            : Int64;

   fVlrPrevisto, fVlrEfetivo        : Currency;
   fVlrPrevistoHist                 : Currency;
   fDiferenca                       : Currency;

   bInesperado, bNaoProgramado      : Boolean;
   bBaixado                         : Boolean;
   bDivergente, bDivergTrat         : Boolean;

   iEvento, iTipoDiverg             : Integer;

   dDataEfetiva, dDataRecebimento   : TDateTime;

   sMsg                             : String;
   sSituacaoContrato                : String;
   sMesCobranca, sMesReferencia     : String;
   sTipoFolha                       : String;
   sParcelaTmpDesc                  : String;

   iAnoCobranca, iAnoCompetencia    : Integer;
   iMescobranca, iMesCompetencia    : Integer;
begin
   // Guarda os dados
   IDTmpDesc         := qryTmpDesc.FieldByName('IDTMPDESC').AsFloat;

   if qryTmpDesc.FieldByName('IDHISTMOVEMPTMO').IsNULL then
   begin
      IDHistMov      := qryTmpDesc.FieldByName('ORDEM').AsFloat;
   end
   else
   begin
      IDHistMov      := qryTmpDesc.FieldByName('IDHISTMOVEMPTMO').AsFloat;
   end;

   IDContrato        := qryTmpDesc.FieldByName('IDDESCONTO').AsFloat;
   IDMutuario        := qryTmpDesc.FieldByName('IDPESSOA').AsInteger;

   sMesCobranca      := qryTmpDesc.FieldByName('MESCOBRANCA').AsString;
   iAnoCobranca      := StrToInt(Copy(sMesCobranca, 1, 4));
   iMesCobranca      := StrToInt(Copy(sMesCobranca, 6, 2));

   sMesReferencia    := qryTmpDesc.FieldByName('MESREFERENCIA').AsString;
   iAnoCompetencia   := StrToInt(Copy(sMesReferencia, 1, 4));
   iMesCompetencia   := StrToInt(Copy(sMesReferencia, 6, 2));

   IDRubrica         := qryTmpDesc.FieldByName('IDPROVENTO').AsInteger;

   fVlrPrevisto      := Arredonda(qryTmpDesc.FieldByName('VALOR').AsCurrency, 2);
   fVlrEfetivo       := Arredonda(qryTmpDesc.FieldByName('VALORRECEBIDO').AsCurrency, 2);

   dDataRecebimento  := qryTmpDesc.FieldByName('DATARECEBIMENTO').AsDateTime;

   sSituacaoContrato := qryTmpDesc.FieldByName('FLGSITUACAO').AsString;

   sTipoFolha        := qryTmpDesc.FieldByName('FLGDESCFOLHA').AsString;

   sParcelaTmpDesc   := FormatFloat('00', qryTmpDesc.FieldByName('PARCELA').AsFloat) + '/' +
                        FormatFloat('00', qryTmpDesc.FieldByName('NUMPARCELAS').AsFloat);

   iTipoDiverg       := -1;
   bDivergente       := False;
   bDivergTrat       := False;

   // ----------------------------------------------------------------------------------------------

   // 2º - Verifica se o valor a receber é esperado ou não (campo IDHISTMOVEMPTMO)
   if qryTmpDesc.FieldByName('IDHISTMOVEMPTMO').isNull then
   begin
      // Recebimento não programado
      if fVlrEfetivo > 0 then
      begin
         bNaoProgramado := True;
         bInesperado    := True;
      end
      else
      begin
         bNaoProgramado := False;
         bInesperado    := False;
      end;
   end
   else
   begin
      bNaoProgramado    := False;

      // 2º - Verifica se o valor a receber é esperado ou não (procurando o registro na HistMovEmptmo)
      if EncontrouRegistro(IDHistMov,
                           IDContrato,
                           iAnoCobranca,
                           iMesCobranca,
                           iAnoCompetencia,
                           iMesCompetencia
                          ) then
      begin
         bInesperado := False;

         fVlrPrevistoHist  := Arredonda(qryHistMovHMEVLRPREVISTO.AsCurrency, 2);
         iEvento           := qryHistMovHMETIPOMOV.AsInteger;

         // Verifica se o registro ainda não foi baixado e se NÃO foi abonado
         // "quitado" não se aplica aqui, pois implica em devolução
         if ( qryHistMovHMEVLREFETIVO.IsNull and
            ((qryHistMovFLGABONADO.IsNull) or (qryHistMovFLGABONADO.AsInteger = 0))
            ) then
         begin
            // Recebimento "normal" (enviado pelo Empréstimo)

            // 3º - Verifica a situação na TMPDESC (há 3 possibilidades):
            //    (a) valor recebido ZERO
            //    (b) valor recebido = valor enviado
            //    (c) valor recebido <> valor enviado

            // (a) Valor recebido ZERO
            if fVlrEfetivo = 0 then
            begin
               bBaixado       := False;
               bDivergente    := True;
               bDivergTrat    := False;
               iTipoDiverg    := 6;       // Valor não será recebido
            end
            else
            begin
               // (b) Valor recebido = valor enviado
               // NADA a fazer (só o update na Hist)

               bBaixado       := True;
               bDivergente    := False;
               dDataEfetiva   := dDataRecebimento;

               // (c) Valor recebido <> valor enviado
               if FormatFloat('#,#0.00', fVlrEfetivo) <> FormatFloat('#,#0.00', abs(fVlrPrevistoHist)) then
               begin
                  bDivergTrat    := True;

                  if (fVlrEfetivo < abs(fVlrPrevistoHist)) then
                      iTipoDiverg := 3;    // valor menor que o esperado
                  if (fVlrEfetivo > abs(fVlrPrevistoHist)) then
                      iTipoDiverg := 4;    // valor maior que o esperado

                  fDiferenca     := Arredonda((abs(fVlrPrevistoHist) - fVlrEfetivo), 2);

                  // se for devolução
                  if (fVlrPrevistoHist < 0) then
                      fDiferenca := fDiferenca * (-1);

                  // -------------------------------------------------------------------------------

                  // Prepara os dados para inserção da diferença no Histórico
                  NovosDadosParcela.ValorPrevisto  := fDiferenca;
                  NovosDadosParcela.ValorEfetivo   := 0;
                  NovosDadosParcela.IDItemEmptmo   := qryHistMovIDITEMEMPTMO.AsInteger;

                  NovosDadosParcela.SeqCobranca    := qryHistMovHMESEQCOBRANCA.AsInteger + 1;

                  NovosDadosParcela.FlgEnvio       := 0;
                  NovosDadosParcela.FlgBaixado     := 0;
                  NovosDadosParcela.FlgDivergPend  := 1;
                  NovosDadosParcela.FlgTipoDiverg  := iTipoDiverg;

                  NovosDadosParcela.AnoCompetencia := qryHistMovHMEANOCOMPETENCIA.AsInteger;
                  NovosDadosParcela.MesCompetencia := qryHistMovHMEMESCOMPETENCIA.AsInteger;
                  NovosDadosParcela.AnoCobranca    := qryHistMovHMEANOCOBRANCA.AsInteger;
                  NovosDadosParcela.MesCobranca    := qryHistMovHMEMESCOBRANCA.AsInteger;

                  NovosDadosParcela.IDRubrica      := qryHistMovIDRUBRICA.AsInteger;

                  NovosDadosParcela.DataPrevista   := qryHistMovHMEDATAPREVISTA.AsDateTime;
                  NovosDadosParcela.DataVencto     := qryHistMovHMEDATAVENCTO.AsDateTime;
                  NovosDadosParcela.DataEfetiva    := 0;

                  NovosDadosParcela.FormaCoranca   := 'F';
                  NovosDadosParcela.TipoFolha      := sTipoFolha;

                  // -------------------------------------------------------------------------------

                  // Inclui diferença a receber no Historico
                  InsereDiferencaHist(qryHistMov, NovosDadosParcela);

                  // -------------------------------------------------------------------------------

               end; // if fValorEfetivo <> fValorPrevisto

            end; // if fValorEfetivo = 0


            // -------------------------------------------------------------------------------------
            //    Update do Histórico (registro sendo processado)
            // -------------------------------------------------------------------------------------
            with qryUpdateHistMov do
            begin
               LimpaParametros(qryUpdateHistMov);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat      := IDContrato;
               ParamByName('PIDHISTMOVEMPTMO').AsFloat       := IDHistMov;

               ParamByName('PHMEFORMACOBRANCA').AsString       := 'F';
               ParamByName('PHMETIPOFOLHA').AsString           := sTipoFolha;
               ParamByName('PHMEDATARECEB').AsDate             := Sysdate;

               if bBaixado then
               begin
                  ParamByName('PFLGRECEBIMENTO').AsInteger     := 0;
                  //BRUNO AZEVEDO SOL 127656 KINTANA 744421
                  if (dDataEfetiva > 0) then begin
                     ParamByName('PHMEDATAEFETIVA').AsDateTime    := dDataEfetiva;
                  end else begin
                     ParamByName('PHMEDATAEFETIVA').Clear;
                  end;
                  //BRUNO AZEVEDO SOL 127656 KINTANA 744421
                  ParamByName('PHMEVLREFETIVO').AsCurrency     := fVlrEfetivo;

                  // se for devolução, inverte o sinal do valor efetivo
                  if fVlrPrevistoHist < 0 then ParamByName('PHMEVLREFETIVO').AsCurrency   := fVlrEfetivo * (-1);
               end
               else
               begin
                  ParamByName('PFLGBAIXADO').AsInteger         := 0;
               end;

               if bDivergente then
               begin
                  ParamByName('PFLGDIVERGPEND').AsInteger   := 1;
                  if iTipoDiverg > 0 then ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
               end;

               if bDivergTrat then
               begin
                  ParamByName('PFLGDIVERGTRAT').AsInteger   := 1;
                  if iTipoDiverg > 0 then ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
               end;

               ExecSQL;
            end;
            bVerificacao := true; // Wylliam Silva kINTANA: 1503641 SOL: 168747
            // -------------------------------------------------------------------------------------
            //    FIM Update do Histórico (registro sendo processado)
            // -------------------------------------------------------------------------------------


            // -------------------------------------------------------------------------------------
            //    Tratamento de Quitação Contratual (item de quitação)
            // -------------------------------------------------------------------------------------

            // É preciso criar um parâmetro para definir se um não recebimento de quitação deve
            // fazer com que a quitação seja desfeita
            // pensar também na situação em que um recebimento de quitação ocorrer de forma parcial

            // No momento, só se aceita recebimento TOTAL da quitação
            if iEvento = 3 then
            begin
               // Houve baixa total do registro de recebimento
               // apenas marca
               if (bBaixado) and (FormatFloat('#,#0.00', fVlrEfetivo) = FormatFloat('#,#0.00', abs(fVlrPrevistoHist))) then
               begin

               end
               else
               begin
                  // Houve recebimento parcial ou nenhum do item de quitação

                  // é necessário cancelar a quitação e voltar o contrato para 'A'
                  // Pega o contrato no historico de contrato e verifica se ta vazio
                  if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
                  begin
                  end
                  else // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
                  begin
                     if (bBaixado) and (fVlrEfetivo <> abs(fVlrPrevistoHist)) then
                     begin
                        CalcEmptmo.AcertaSituacaoContratual(IDContrato, 11);
                     end;
                  end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
               end;  // if (bBaixado) and (fVlrEfetivo = abs(fVlrPrevistoHist))
            end;  // if iEvento = 3
            // -------------------------------------------------------------------------------------
            //    FIM Tratamento de Quitação Contratual (item de quitação)
            // -------------------------------------------------------------------------------------


            // -------------------------------------------------------------------------------------
            //    Tratamento de Amortização
            // -------------------------------------------------------------------------------------
            if iEvento = 2 then
            begin
               // Houve baixa total do registro de recebimento
               // apenas marca
               if (bBaixado) and (FormatFloat('#,#0.00', fVlrEfetivo) = FormatFloat('#,#0.00', abs(fVlrPrevistoHist))) then
               begin
                  // Não faz nada
               end
               else
               begin
                  // Houve recebimento parcial ou nenhum do item de quitação
                  // é necessário cancelar a quitação e voltar o contrato para 'A'

                  // Pega o contrato no historico de contrato e verifica se ta vazio
                  if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
                  begin
                  end;
               end;

            end;
            // ----------------------------------------------------------------------------------
            //    FIM Tratamento de Amortização
            // ----------------------------------------------------------------------------------
         end
         else
         begin
            // Verifica se o registro já foi baixado MANUALMENTE ou se já foi abonado
            if ( (qryHistMovFLGBAIXAMANUAL.AsInteger = 1) or (qryHistMovFLGABONADO.AsInteger = 1) ) then
            begin
               // ----------------------------------------------------------------------------------
               //    Deve apenas fazer SITENVIO = '9'
               // ----------------------------------------------------------------------------------
            end
            else  // if flgBaixaManual or Abono
            begin
               // ----------------------------------------------------------------------------------
               //    O Item já foi baixado (e NÃO foi manual) e NÃO está abonado
               //    Nesse caso configura-se um recebimento "duplicado"
               // ----------------------------------------------------------------------------------
               bInesperado := False;

               // André Pontes - 11/09/2003 - "and not(chkInesperado.Checked)"
               if (fVlrEfetivo > 0) and not(chkInesperado.Checked) then
               // FIM André Pontes - 11/09/2003
               begin
                  // Prepara os dados para inserção da diferença no Histórico
                  NovosDadosParcela.ValorPrevisto  := 0;
                  NovosDadosParcela.ValorEfetivo   := fVlrEfetivo;
                  NovosDadosParcela.IDItemEmptmo   := qryHistMovIDITEMEMPTMO.AsInteger;

                  NovosDadosParcela.SeqCobranca    := qryHistMovHMESEQCOBRANCA.AsInteger + 1;

                  NovosDadosParcela.FlgEnvio       := -1;
                  NovosDadosParcela.FlgBaixado     := -1;
                  NovosDadosParcela.FlgDivergPend  := -1;
                  NovosDadosParcela.FlgTipoDiverg  := 2;

                  NovosDadosParcela.AnoCompetencia := qryHistMovHMEANOCOMPETENCIA.AsInteger;
                  NovosDadosParcela.MesCompetencia := qryHistMovHMEMESCOMPETENCIA.AsInteger;
                  NovosDadosParcela.AnoCobranca    := iAnoCobranca;
                  NovosDadosParcela.MesCobranca    := iMesCobranca;

                  NovosDadosParcela.IDRubrica      := qryTmpDesc.FieldByName('IDPROVENTO').AsInteger;

                  NovosDadosParcela.DataPrevista   := qryHistMovHMEDATAPREVISTA.AsDateTime;
                  NovosDadosParcela.DataVencto     := dDataRecebimento;
                  NovosDadosParcela.DataEfetiva    := dDataRecebimento;

                  NovosDadosParcela.FormaCoranca   := 'F';
                  NovosDadosParcela.TipoFolha      := sTipoFolha;

                  // -------------------------------------------------------------------------------

                  // Inclui o valor recebido na Hist
                  InsereDiferencaHist(qryHistMov, NovosDadosParcela);

                  // -------------------------------------------------------------------------------

                  NovosDadosParcela.ValorPrevisto  := fVlrEfetivo * (-1);
                  NovosDadosParcela.ValorEfetivo   := 0;
                  NovosDadosParcela.DataEfetiva    := 0;

                  NovosDadosParcela.SeqCobranca    := qryHistMovHMESEQCOBRANCA.AsInteger + 2;

                  NovosDadosParcela.FlgEnvio       := 0;
                  NovosDadosParcela.FlgBaixado     := 0;
                  NovosDadosParcela.FlgDivergPend  := 1;
                  NovosDadosParcela.FlgTipoDiverg  := 2;

                  // -------------------------------------------------------------------------------

                  // Inclui o valor a devolver na Hist
                  InsereDiferencaHist(qryHistMov, NovosDadosParcela);

                  // -------------------------------------------------------------------------------
               end;

               // ----------------------------------------------------------------------------------
            end;
         end;  // if flgBaixaManual or Abono
      end
      else  // if EncontrouRegistro
      begin
         if EncontrouRegistroQuitado(IDHistMov,
                                     IDContrato,
                                     iAnoCobranca,
                                     iMesCobranca,
                                     iAnoCompetencia,
                                     iMesCompetencia
                                    ) then
         begin
            bInesperado := False;

            if fVlrEfetivo > 0 then
            begin
               // Prepara os dados para inserção da diferença no Histórico
               NovosDadosParcela.ValorPrevisto  := 0;
               NovosDadosParcela.ValorEfetivo   := fVlrEfetivo;
               NovosDadosParcela.IDItemEmptmo   := qryHistMovQuitadoIDITEMEMPTMO.AsInteger;

               NovosDadosParcela.SeqCobranca    := qryHistMovQuitadoHMESEQCOBRANCA.AsInteger + 1;

               NovosDadosParcela.FlgEnvio       := -1;
               NovosDadosParcela.FlgBaixado     := -1;
               NovosDadosParcela.FlgDivergPend  := -1;
               NovosDadosParcela.FlgTipoDiverg  := 2;

               NovosDadosParcela.AnoCompetencia := qryHistMovQuitadoHMEANOCOMPETENCIA.AsInteger;
               NovosDadosParcela.MesCompetencia := qryHistMovQuitadoHMEMESCOMPETENCIA.AsInteger;
               NovosDadosParcela.AnoCobranca    := iAnoCobranca;
               NovosDadosParcela.MesCobranca    := iMesCobranca;

               NovosDadosParcela.IDRubrica      := qryTmpDesc.FieldByName('IDPROVENTO').AsInteger;

               NovosDadosParcela.DataPrevista   := qryHistMovQuitadoHMEDATAPREVISTA.AsDateTime;
               NovosDadosParcela.DataVencto     := dDataRecebimento;
               NovosDadosParcela.DataEfetiva    := dDataRecebimento;

               NovosDadosParcela.FormaCoranca   := 'F';
               NovosDadosParcela.TipoFolha      := sTipoFolha;

               // ----------------------------------------------------------------------------------

               // Inclui o valor recebido na Hist
               InsereDiferencaHist(qryHistMovQuitado, NovosDadosParcela);

               // ----------------------------------------------------------------------------------

               NovosDadosParcela.ValorPrevisto  := fVlrEfetivo * (-1);
               NovosDadosParcela.ValorEfetivo   := 0;
               NovosDadosParcela.DataEfetiva    := 0;

               NovosDadosParcela.SeqCobranca    := qryHistMovQuitadoHMESEQCOBRANCA.AsInteger + 2;

               NovosDadosParcela.FlgEnvio       := 0;
               NovosDadosParcela.FlgBaixado     := 0;
               NovosDadosParcela.FlgDivergPend  := 1;
               NovosDadosParcela.FlgTipoDiverg  := 2;

               // ----------------------------------------------------------------------------------

               // Inclui o valor a devolver na Hist
               InsereDiferencaHist(qryHistMovQuitado, NovosDadosParcela);

               // ----------------------------------------------------------------------------------
            end;

            // -------------------------------------------------------------------------------------
         end
         else  // if EncontrouRegistroQuitado
         begin
            // -------------------------------------------------------------------------------------
            // Recebimento não esperado
            if (fVlrEfetivo > 0) then
            begin
               bInesperado := True;
            end
            else
            begin
               bInesperado := False;
            end;
            // -------------------------------------------------------------------------------------
         end;  // if EncontrouRegistroQuitado
      end;  // if EncontrouRegistro

   end;  // if qryTmpDescORDEM.isNull

   // ----------------------------------------------------------------------------------------------
   //    Update da TMPDESC (registro sendo processado)
   // ----------------------------------------------------------------------------------------------

   // André Pontes - 19/02/2004    Atualiza TMPDESC com SITENVIO = 9
   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) or not(bNaoProgramado) then
   begin
if bVerificacao = True then  // Wylliam Silva kINTANA: 1503641 SOL: 168747
    IntegraEmptmo.MarcaBaixaTMPDESC(IDTmpdesc);
    end;
    bVerificacao := False;  // Wylliam Silva kINTANA: 1503641 SOL: 168747

   // ----------------------------------------------------------------------------------------------
   //    FIM Update da TMPDESC (registro sendo processado)
   // ----------------------------------------------------------------------------------------------



   // Não dá para usar a InserDiferencaHist pq a função se baseia em uma linha pré-existente
   // da HistMovEmptmo. Como se está querendo inserir um registro totalmente novo, é necessário
   // inicializar TODOS os campos necessários.

   // André Pontes - 19/02/2004
   if (bInesperado) and not(bNaoProgramado) then
   begin
      // -------------------------------------------------------------------------------------------
      //    Tratamento para recebimento "inesperado"
      // ---------------------------------------------------------------------------------------
      InsereInesperado(qryTmpDesc.FieldByName('IDDESCONTO').AsFloat,
                       qryTmpDesc.FieldByName('IDTIPOCONTREMPTMO').AsInteger,
                       qryTmpDesc.FieldByName('VALORRECEBIDO').AsCurrency,
                       qryTmpDesc.FieldByName('DATARECEBIMENTO').AsDateTime,
                       'F',
                       sTipoFolha
                      );
      // -------------------------------------------------------------------------------------------
   end;

   Result := fVlrEfetivo;
end;



function TfrmExecRecebimento.RecebeParcelaTmpDescAgrupada: Currency;
var
   NovosDadosParcela                : TNovosDados;

   IDTmpDesc, IDHistMov, IDContrato : Extended;
   IDMutuario, IDRubrica            : Int64;

   iPlanilha, iDocumento            : Int64;

   fVlrPrevisto, fVlrEfetivo        : Currency;
   fVlrPrevistoHist                 : Currency;
   fDiferenca                       : Currency;

   bInesperado, bNaoProgramado      : Boolean;
   bBaixado                         : Boolean;
   bDivergente, bDivergTrat         : Boolean;

   iEvento, iTipoDiverg             : Integer;
   iQuantRegistros                  : Integer;
   iQuantRegistrosQuitados          : Integer;

   dDataEfetiva, dDataRecebimento   : TDateTime;

   sMsg                             : String;
   sSituacaoContrato                : String;
   sMesCobranca, sMesReferencia     : String;
   sTipoFolha                       : String;
   sParcelaTmpDesc                  : String;

   iAnoCobranca, iAnoCompetencia    : Integer;
   iMescobranca, iMesCompetencia    : Integer;
begin
   // Guarda os dados
   IDTmpDesc         := qryTmpDesc.FieldByName('IDTMPDESC').AsFloat;

   if qryTmpDesc.FieldByName('IDHISTMOVEMPTMO').IsNULL then
   begin
      IDHistMov      := qryTmpDesc.FieldByName('ORDEM').AsFloat;
   end
   else
   begin
      IDHistMov      := qryTmpDesc.FieldByName('IDHISTMOVEMPTMO').AsFloat;
   end;

   IDContrato        := qryTmpDesc.FieldByName('IDDESCONTO').AsFloat;
   IDMutuario        := qryTmpDesc.FieldByName('IDPESSOA').AsInteger;

   sMesCobranca      := qryTmpDesc.FieldByName('MESCOBRANCA').AsString;
   iAnoCobranca      := StrToInt(Copy(sMesCobranca, 1, 4));
   iMesCobranca      := StrToInt(Copy(sMesCobranca, 6, 2));

   sMesReferencia    := qryTmpDesc.FieldByName('MESREFERENCIA').AsString;
   iAnoCompetencia   := StrToInt(Copy(sMesReferencia, 1, 4));
   iMesCompetencia   := StrToInt(Copy(sMesReferencia, 6, 2));

   IDRubrica         := qryTmpDesc.FieldByName('IDPROVENTO').AsInteger;

   fVlrPrevisto      := Arredonda(qryTmpDesc.FieldByName('VALOR').AsCurrency, 2);
   fVlrEfetivo       := Arredonda(qryTmpDesc.FieldByName('VALORRECEBIDO').AsCurrency, 2);

   dDataRecebimento  := qryTmpDesc.FieldByName('DATARECEBIMENTO').AsDateTime;

   sSituacaoContrato := qryTmpDesc.FieldByName('FLGSITUACAO').AsString;

   sTipoFolha        := qryTmpDesc.FieldByName('FLGDESCFOLHA').AsString;

   sParcelaTmpDesc   := FormatFloat('00', qryTmpDesc.FieldByName('PARCELA').AsFloat) + '/' +
                        FormatFloat('00', qryTmpDesc.FieldByName('NUMPARCELAS').AsFloat);

   iTipoDiverg       := -1;
   bDivergente       := False;
   bDivergTrat       := False;

   // ----------------------------------------------------------------------------------------------

   // 2º - Verifica se o valor a receber é esperado ou não (campo IDHISTMOVEMPTMO)
   if ( (qryTmpDesc.FieldByName('IDHISTMOVEMPTMO').isNull) and (qryTmpDesc.FieldByName('ORDEM').isNull) ) then
   begin
      // Recebimento não programado
      if (fVlrEfetivo > 0) then
      begin
         bNaoProgramado := True;
         bInesperado    := True;
      end
      else
      begin
         bNaoProgramado := False;
         bInesperado    := False;
      end;
   end
   else
   begin
      bNaoProgramado    := False;

      // 2º - Verifica se o valor a receber é esperado ou não
      //      (procurando o registro na HistMovEmptmo)
      iQuantRegistros := EncontrouRegistroAgrupado(IDTmpDesc,
                                                 IDContrato,
                                                 iAnoCobranca,
                                                 iMesCobranca,
                                                 iAnoCompetencia,
                                                 iMesCompetencia
                                                );

      if (iQuantRegistros > 0) then
      begin
         if (iQuantRegistros > 1) then
         begin
            fVlrPrevistoHist := TotalizaVlrHist(IDTmpDesc,
                                                IDContrato,
                                                iAnoCobranca,
                                                iMesCobranca,
                                                iAnoCompetencia,
                                                iMesCompetencia
                                               );

            // -------------------------------------------------------------------------------------
            // Se o valor previsto for igual ao efetivo, baixa todos,
            // senão dá msg de erro
            if fVlrEfetivo = abs(fVlrPrevistoHist) then  // Wylliam Silva kINTANA: 1503641 SOL: 168747
            begin
               BaixaTodosRegistrosHist(IDTmpDesc,
                                       IDContrato,
                                       iAnoCobranca,
                                       iMesCobranca,
                                       iAnoCompetencia,
                                       iMesCompetencia,
                                       dDataRecebimento
                                      );
            end
            else
            begin
               memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                                 CompletaInicio(FormatFloat('#0', qryTmpDesc.FieldByName('IDDESCONTO').AsFloat), ' ', 15) + ' ' +
                                 CompletaFim(qryTmpDesc.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                 CompletaFim(FormatFloat('#0', qryTmpDesc.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                 CompletaFim(FormatFloat('#0', qryTmpDesc.FieldByName('IDPESSJUR').AsFloat), ' ', 5) + ' ' +
                                 CompletaFim(sParcelaTmpDesc, ' ', 7) + ' ' +
                                 CompletaFim(FormatFloat('#,#0.00', qryTmpDesc.FieldByName('VALOR').AsCurrency), ' ', 15) + ' ' +
                                 'Valor Recebido diferente do Valor Previsto'
                                );
            end;
            // -------------------------------------------------------------------------------------
         end
         else  // if iQuantRegistros > 1
         begin
            // Se houver apenas 1 registro a receber, faz o tratamento padrão de todos os clientes
            bInesperado       := False;

            fVlrPrevistoHist  := Arredonda(qryHistMovAgrupadoHMEVLRPREVISTO.AsCurrency, 2);
            iEvento           := qryHistMovAgrupadoHMETIPOMOV.AsInteger;

            // Verifica se o registro ainda não foi baixado e se NÃO foi abonado
            // "quitado" não se aplica aqui, pois implica em devolução
            if ( qryHistMovAgrupadoHMEVLREFETIVO.IsNull and
               ((qryHistMovAgrupadoFLGABONADO.IsNull) or (qryHistMovAgrupadoFLGABONADO.AsInteger = 0))
               ) then
            begin
               // Recebimento "normal" (enviado pelo Empréstimo)

               // 3º - Verifica a situação na TMPDESC (há 3 possibilidades):
               //    (a) valor recebido ZERO
               //    (b) valor recebido = valor enviado
               //    (c) valor recebido <> valor enviado

               // (a) Valor recebido ZERO
               if fVlrEfetivo = 0 then
               begin
                  bBaixado       := False;
                  bDivergente    := True;
                  bDivergTrat    := False;
                  iTipoDiverg    := 6;       // Valor não será recebido
               end
               else
               begin
                  // (b) Valor recebido = valor enviado
                  // NADA a fazer (só o update na Hist)

                  bBaixado       := True;
                  bDivergente    := False;
                  dDataEfetiva   := dDataRecebimento;

                  // (c) Valor recebido <> valor enviado
                  if FormatFloat('#,#0.00', fVlrEfetivo) <> FormatFloat('#,#0.00', abs(fVlrPrevistoHist)) then
                  begin
                     bDivergTrat    := True;

                     if (fVlrEfetivo < abs(fVlrPrevistoHist)) then
                         iTipoDiverg := 3;    // valor menor que o esperado
                     if (fVlrEfetivo > abs(fVlrPrevistoHist)) then
                         iTipoDiverg := 4;    // valor maior que o esperado

                     fDiferenca     := Arredonda((abs(fVlrPrevistoHist) - fVlrEfetivo), 2);

                     // se for devolução
                     if fVlrPrevistoHist < 0 then fDiferenca := fDiferenca * (-1);

                     // -------------------------------------------------------------------------------

                     // Prepara os dados para inserção da diferença no Histórico
                     NovosDadosParcela.ValorPrevisto  := fDiferenca;
                     NovosDadosParcela.ValorEfetivo   := 0;
                     NovosDadosParcela.IDItemEmptmo   := qryHistMovAgrupadoIDITEMEMPTMO.AsInteger;

                     NovosDadosParcela.SeqCobranca    := qryHistMovAgrupadoHMESEQCOBRANCA.AsInteger + 1;

                     NovosDadosParcela.FlgEnvio       := 0;
                     NovosDadosParcela.FlgBaixado     := 0;
                     NovosDadosParcela.FlgDivergPend  := 1;
                     NovosDadosParcela.FlgTipoDiverg  := iTipoDiverg;

                     NovosDadosParcela.AnoCompetencia := qryHistMovAgrupadoHMEANOCOMPETENCIA.AsInteger;
                     NovosDadosParcela.MesCompetencia := qryHistMovAgrupadoHMEMESCOMPETENCIA.AsInteger;
                     NovosDadosParcela.AnoCobranca    := qryHistMovAgrupadoHMEANOCOBRANCA.AsInteger;
                     NovosDadosParcela.MesCobranca    := qryHistMovAgrupadoHMEMESCOBRANCA.AsInteger;

                     NovosDadosParcela.IDRubrica      := qryHistMovAgrupadoIDRUBRICA.AsInteger;

                     NovosDadosParcela.DataPrevista   := qryHistMovAgrupadoHMEDATAPREVISTA.AsDateTime;
                     NovosDadosParcela.DataVencto     := qryHistMovAgrupadoHMEDATAVENCTO.AsDateTime;
                     NovosDadosParcela.DataEfetiva    := 0;

                     NovosDadosParcela.FormaCoranca   := 'F';
                     NovosDadosParcela.TipoFolha      := sTipoFolha;

                     // ----------------------------------------------------------------------------

                     // Inclui diferença a receber no Historico
                     InsereDiferencaHist(qryHistMovAgrupado, NovosDadosParcela);

                     // ----------------------------------------------------------------------------
                  end; // if fValorEfetivo <> fValorPrevisto
               end; // if fValorEfetivo = 0


               // ----------------------------------------------------------------------------------
               //    Update do Histórico (registro sendo processado)
               // ----------------------------------------------------------------------------------
               with qryUpdateHistMov do
               begin
                  LimpaParametros(qryUpdateHistMov);
                  ParamByName('PIDCONTRATOEMPTMO').AsFloat        := IDContrato;
                  ParamByName('PIDHISTMOVEMPTMO').AsFloat         := IDHistMov;

                  ParamByName('PHMEFORMACOBRANCA').AsString       := 'F';
                  ParamByName('PHMETIPOFOLHA').AsString           := sTipoFolha;
                  ParamByName('PHMEDATARECEB').AsDate             := Sysdate;

                  if bBaixado then
                  begin
                     ParamByName('PFLGRECEBIMENTO').AsInteger     := 0;
                     //BRUNO AZEVEDO SOL 127656 KINTANA 744421
                     if (dDataEfetiva > 0) then begin
                        ParamByName('PHMEDATAEFETIVA').AsDateTime := dDataEfetiva;
                     end else begin
                        ParamByName('PHMEDATAEFETIVA').Clear;
                     end;
                     //BRUNO AZEVEDO SOL 127656 KINTANA 744421
                     ParamByName('PHMEVLREFETIVO').AsCurrency     := fVlrEfetivo;

                     // se for devolução, inverte o sinal do valor efetivo
                     if (fVlrPrevistoHist < 0) then
                         ParamByName('PHMEVLREFETIVO').AsCurrency := fVlrEfetivo * (-1);
                  end
                  else
                  begin
                     ParamByName('PFLGBAIXADO').AsInteger         := 0;
                  end;

                  if bDivergente then
                  begin
                     ParamByName('PFLGDIVERGPEND').AsInteger   := 1;
                     if (iTipoDiverg > 0) then
                         ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
                  end;

                  if bDivergTrat then
                  begin
                     ParamByName('PFLGDIVERGTRAT').AsInteger   := 1;
                     if (iTipoDiverg > 0) then
                         ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
                  end;

                  ExecSQL;
               end;
               // ----------------------------------------------------------------------------------
               //    FIM Update do Histórico (registro sendo processado)
               // ----------------------------------------------------------------------------------


               // ----------------------------------------------------------------------------------
               //    Tratamento de Quitação Contratual (item de quitação)
               // ----------------------------------------------------------------------------------

               // É preciso criar um parâmetro para definir se um não recebimento de quitação deve
               // fazer com que a quitação seja desfeita
               // pensar também na situação em que um recebimento de quitação ocorrer de forma parcial

               // No momento, só se aceita recebimento TOTAL da quitação
               if (iEvento = 3) then
               begin
                  // Houve baixa total do registro de recebimento
                  // apenas marca
                  if (bBaixado) and (FormatFloat('#,#0.00', fVlrEfetivo) = FormatFloat('#,#0.00', abs(fVlrPrevistoHist))) then
                  begin
                     // RETIRADO: está redundante agora
                     // CalcEmptmo.AtualizaFlgSituacao(IDContrato, 'CONTRATOEMPTMO', 'Q', sMsg);
                  end
                  else
                  begin
                     // Houve recebimento parcial ou nenhum do item de quitação
                     // é necessário cancelar a quitação e voltar o contrato para 'A'
                     // Pega o contrato no historico de contrato e verifica se ta vazio
                     if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
                     begin
                     end
                     else // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
                     begin
                        if (bBaixado) and (fVlrEfetivo <> abs(fVlrPrevistoHist)) then
                        begin
                           CalcEmptmo.AcertaSituacaoContratual(IDContrato, 11);
                        end;
                     end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
                  end;  // if (bBaixado) and (fVlrEfetivo = abs(fVlrPrevistoHist))
               end;  // if iEvento = 3
               // -------------------------------------------------------------------------------------
               //    FIM Tratamento de Quitação Contratual (item de quitação)
               // -------------------------------------------------------------------------------------


               // -------------------------------------------------------------------------------------
               //    Tratamento de Amortização
               // -------------------------------------------------------------------------------------
               if (iEvento = 2) then
               begin
                  // Houve baixa total do registro de recebimento
                  // apenas marca
                  if (bBaixado) and (FormatFloat('#,#0.00', fVlrEfetivo) = FormatFloat('#,#0.00', abs(fVlrPrevistoHist))) then
                  begin
                     // Não faz nada
                  end
                  else
                  begin
                     // Houve recebimento parcial ou nenhum do item de quitação
                     // é necessário cancelar a quitação e voltar o contrato para 'A'

                     // Pega o contrato no historico de contrato e verifica se ta vazio
                     if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
                     begin
                     end;
                  end;

               end;
               // ----------------------------------------------------------------------------------
               //    FIM Tratamento de Amortização
               // ----------------------------------------------------------------------------------
            end
            else
            begin
               // Verifica se o registro já foi baixado MANUALMENTE ou se já foi abonado
               if ( (qryHistMovAgrupadoFLGBAIXAMANUAL.AsInteger = 1) or (qryHistMovAgrupadoFLGABONADO.AsInteger = 1) ) then
               begin
                  // ----------------------------------------------------------------------------------
                  //    Deve apenas fazer SITENVIO = '9'
                  // ----------------------------------------------------------------------------------
               end
               else  // if flgBaixaManual or Abono
               begin
                  // ----------------------------------------------------------------------------------
                  //    O Item já foi baixado (e NÃO foi manual) e NÃO está abonado
                  //    Nesse caso configura-se um recebimento "duplicado"
                  // ----------------------------------------------------------------------------------
                  bInesperado := False;

                  // André Pontes - 11/09/2003 - "and not(chkInesperado.Checked)"
                  if (fVlrEfetivo > 0) and not(chkInesperado.Checked) then
                  // FIM André Pontes - 11/09/2003
                  begin
                     // Prepara os dados para inserção da diferença no Histórico
                     NovosDadosParcela.ValorPrevisto  := 0;
                     NovosDadosParcela.ValorEfetivo   := fVlrEfetivo;
                     NovosDadosParcela.IDItemEmptmo   := qryHistMovAgrupadoIDITEMEMPTMO.AsInteger;

                     NovosDadosParcela.SeqCobranca    := qryHistMovAgrupadoHMESEQCOBRANCA.AsInteger + 1;

                     NovosDadosParcela.FlgEnvio       := -1;
                     NovosDadosParcela.FlgBaixado     := -1;
                     NovosDadosParcela.FlgDivergPend  := -1;
                     NovosDadosParcela.FlgTipoDiverg  := 2;

                     NovosDadosParcela.AnoCompetencia := qryHistMovAgrupadoHMEANOCOMPETENCIA.AsInteger;
                     NovosDadosParcela.MesCompetencia := qryHistMovAgrupadoHMEMESCOMPETENCIA.AsInteger;
                     NovosDadosParcela.AnoCobranca    := iAnoCobranca;
                     NovosDadosParcela.MesCobranca    := iMesCobranca;

                     NovosDadosParcela.IDRubrica      := qryTmpDesc.FieldByName('IDPROVENTO').AsInteger;

                     NovosDadosParcela.DataPrevista   := qryHistMovAgrupadoHMEDATAPREVISTA.AsDateTime;
                     NovosDadosParcela.DataVencto     := dDataRecebimento;
                     NovosDadosParcela.DataEfetiva    := dDataRecebimento;

                     NovosDadosParcela.FormaCoranca   := 'F';
                     NovosDadosParcela.TipoFolha      := sTipoFolha;

                     // ----------------------------------------------------------------------------

                     // Inclui o valor recebido na Hist
                     InsereDiferencaHist(qryHistMovAgrupado, NovosDadosParcela);

                     // ----------------------------------------------------------------------------

                     NovosDadosParcela.ValorPrevisto  := fVlrEfetivo * (-1);
                     NovosDadosParcela.ValorEfetivo   := 0;
                     NovosDadosParcela.DataEfetiva    := 0;

                     NovosDadosParcela.SeqCobranca    := qryHistMovAgrupadoHMESEQCOBRANCA.AsInteger + 2;

                     NovosDadosParcela.FlgEnvio       := 0;
                     NovosDadosParcela.FlgBaixado     := 0;
                     NovosDadosParcela.FlgDivergPend  := 1;
                     NovosDadosParcela.FlgTipoDiverg  := 2;

                     // ----------------------------------------------------------------------------

                     // Inclui o valor a devolver na Hist
                     InsereDiferencaHist(qryHistMovAgrupado, NovosDadosParcela);

                     // ----------------------------------------------------------------------------
                  end;

                  // -------------------------------------------------------------------------------------
               end;
            end;  // if flgBaixaManual or Abono
         end;  // if iQuantRegistros > 1
      end
      else  // if iQuantRegistros > 0
      begin
         iQuantRegistrosQuitados := EncontrouRegistroQuitadoAgrupado(IDTmpDesc,
                                                                     IDContrato,
                                                                     iAnoCobranca,
                                                                     iMesCobranca,
                                                                     iAnoCompetencia,
                                                                     iMesCompetencia
                                                                    );
         if (iQuantRegistrosQuitados > 0) then
         begin
            if (iQuantRegistrosQuitados > 1) then
            begin
               memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                                 CompletaInicio(FormatFloat(#0, qryTmpDesc.FieldByName('IDDESCONTO').AsFloat), ' ', 15) + ' ' +
                                 CompletaFim(qryTmpDesc.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                 CompletaFim(FormatFloat(#0, qryTmpDesc.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                 CompletaFim(FormatFloat(#0, qryTmpDesc.FieldByName('IDPESSJUR').AsFloat), ' ', 5) + ' ' +
                                 CompletaFim(sParcelaTmpDesc, ' ', 7) + ' ' +
                                 CompletaFim(FormatFloat('#,#0.00', qryTmpDesc.FieldByName('VALOR').AsCurrency), ' ', 15) + ' ' +
                                 'Foram encontrados registros "quitados"'
                                );

            end
            else  // if iQuantRegistrosQuitados > 1
            begin
               if EncontrouRegistroQuitado(IDHistMov,
                                           IDContrato,
                                           iAnoCobranca,
                                           iMesCobranca,
                                           iAnoCompetencia,
                                           iMesCompetencia
                                          ) then
               begin
                  bInesperado := False;

                  if fVlrEfetivo > 0 then
                  begin
                     // Prepara os dados para inserção da diferença no Histórico
                     NovosDadosParcela.ValorPrevisto  := 0;
                     NovosDadosParcela.ValorEfetivo   := fVlrEfetivo;
                     NovosDadosParcela.IDItemEmptmo   := qryHistMovQuitadoIDITEMEMPTMO.AsInteger;

                     NovosDadosParcela.SeqCobranca    := qryHistMovQuitadoHMESEQCOBRANCA.AsInteger + 1;

                     NovosDadosParcela.FlgEnvio       := -1;
                     NovosDadosParcela.FlgBaixado     := -1;
                     NovosDadosParcela.FlgDivergPend  := -1;
                     NovosDadosParcela.FlgTipoDiverg  := 2;

                     NovosDadosParcela.AnoCompetencia := qryHistMovQuitadoHMEANOCOMPETENCIA.AsInteger;
                     NovosDadosParcela.MesCompetencia := qryHistMovQuitadoHMEMESCOMPETENCIA.AsInteger;
                     NovosDadosParcela.AnoCobranca    := iAnoCobranca;
                     NovosDadosParcela.MesCobranca    := iMesCobranca;

                     NovosDadosParcela.IDRubrica      := qryTmpDesc.FieldByName('IDPROVENTO').AsInteger;

                     NovosDadosParcela.DataPrevista   := qryHistMovQuitadoHMEDATAPREVISTA.AsDateTime;
                     NovosDadosParcela.DataVencto     := dDataRecebimento;
                     NovosDadosParcela.DataEfetiva    := dDataRecebimento;

                     NovosDadosParcela.FormaCoranca   := 'F';
                     NovosDadosParcela.TipoFolha      := sTipoFolha;

                     // ----------------------------------------------------------------------------

                     // Inclui o valor recebido na Hist
                     InsereDiferencaHist(qryHistMovQuitado, NovosDadosParcela);

                     // ----------------------------------------------------------------------------

                     NovosDadosParcela.ValorPrevisto  := fVlrEfetivo * (-1);
                     NovosDadosParcela.ValorEfetivo   := 0;
                     NovosDadosParcela.DataEfetiva    := 0;

                     NovosDadosParcela.SeqCobranca    := qryHistMovQuitadoHMESEQCOBRANCA.AsInteger + 2;

                     NovosDadosParcela.FlgEnvio       := 0;
                     NovosDadosParcela.FlgBaixado     := 0;
                     NovosDadosParcela.FlgDivergPend  := 1;
                     NovosDadosParcela.FlgTipoDiverg  := 2;

                     // ----------------------------------------------------------------------------

                     // Inclui o valor a devolver na Hist
                     InsereDiferencaHist(qryHistMovQuitado, NovosDadosParcela);

                     // ----------------------------------------------------------------------------
                  end;

                  // -------------------------------------------------------------------------------
               end
               else  // if EncontrouRegistroQuitado
               begin
                  // -------------------------------------------------------------------------------
                  // Recebimento não esperado
                  if (fVlrEfetivo > 0) then
                  begin
                     bInesperado := True;
                  end
                  else
                  begin
                     bInesperado := False;
                  end;
                  // -------------------------------------------------------------------------------
               end;  // if EncontrouRegistroQuitado
            end;  // if iQuantRegistrosQuitados > 1
            // -------------------------------------------------------------------------------------
         end;  // if iQuantRegistrosQuitados > 0
      end;  // if iQuantRegistros > 0

   end;  // if ( (qryTmpDescIDHISTMOVEMPTMO.isNull) and (qryTmpDescORDEM.isNull) )

   // ----------------------------------------------------------------------------------------------
   //    Update da TMPDESC (registro sendo processado)
   // ----------------------------------------------------------------------------------------------

   // André Pontes - 19/02/2004   Atualiza TMPDESC com SITENVIO = 9
   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) or not(bNaoProgramado) then
   begin
    if bVerificacao = True then  // Wylliam Silva kINTANA: 1503641 SOL: 168747
    IntegraEmptmo.MarcaBaixaTMPDESC(IDTmpdesc);
    end;
    bVerificacao := False;   // Wylliam Silva kINTANA: 1503641 SOL: 168747
   // ----------------------------------------------------------------------------------------------
   //    FIM Update da TMPDESC (registro sendo processado)
   // ----------------------------------------------------------------------------------------------



   // Não dá para usar a InserDiferencaHist pq a função se baseia em uma linha pré-exixtente
   // da HistMovEmptmo. Como se está querendo inserir um registro totalmente novo, é necessário
   // inicializar TODOS os campos necessários.

   // André Pontes - 19/02/2004
   if (bInesperado) and not(bNaoProgramado) then
   begin
      // -------------------------------------------------------------------------------------------
      //    Tratamento para recebimento "inesperado"
      // ---------------------------------------------------------------------------------------
      InsereInesperado(qryTmpDesc.FieldByName('IDDESCONTO').AsFloat,
                       qryTmpDesc.FieldByName('IDTIPOCONTREMPTMO').AsInteger,
                       qryTmpDesc.FieldByName('VALORRECEBIDO').AsCurrency,
                       qryTmpDesc.FieldByName('DATARECEBIMENTO').AsDateTime,
                       'F',
                       sTipoFolha
                      );
      // -------------------------------------------------------------------------------------------
   end;

   Result := fVlrEfetivo;
end;



procedure TfrmExecRecebimento.InsereInesperado(const IDContrato      : Extended;
                                               const IDTipoContr     : Int64;
                                               const fVlrInserir     : Currency;
                                               const dData           : TDateTime;
                                               const sFormaCobranca  : String;
                                               const sTipoFolha      : String
                                               );
var
   rItem             : TItemRecDep;
   rContrato         : TDadosContrato;
begin
   // *******************************************************************************************
   //
   // Não dá para usar a InserDiferencaHist pq a função se baseia em uma linha pré-exixtente
   // da HistMovEmptmo. Como se está querendo inserir um registro totalmente novo, é necessário
   // inicializar TODOS os campos necessários.
   //
   // Serão necessários também DOIS inserts na HistMovEmptmo:
   //    - o recebimento inesperado (baixado);
   //    - a devolução do valor inesperado (previsto);
   //
   // *******************************************************************************************

   // ----------------------------------------------------------------------------------------------
   memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                     CompletaInicio(FormatFloat('#0', qryTmpDesc.FieldByName('IDDESCONTO').AsFloat), ' ', 15) + ' ' +
                     CompletaFim(qryTmpDesc.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                     CompletaFim(FormatFloat('#0', qryTmpDesc.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                     CompletaFim(FormatFloat('#0', qryTmpDesc.FieldByName('IDPESSJUR').AsFloat), ' ', 5) + ' ' +
                     CompletaFim((FormatFloat('00', qryTmpDesc.FieldByName('PARCELA').AsFloat) + '/' +
                                  FormatFloat('00', qryTmpDesc.FieldByName('NUMPARCELAS').AsFloat)
                                 ), ' ', 7) + ' ' +
                     CompletaFim(FormatFloat('#,#0.00', fVlrInserir), ' ', 15) + ' ' +
                     'Valor Inesperado'
                    );
   // ----------------------------------------------------------------------------------------------

   LimpaRegistro(rItem);
   LimpaRegistroContrato(rContrato);

   rContrato.IDContratoEmptmo := IDContrato;

   // Busca o item para gravar na HISTMOVEMPTMO
   with qryBuscaParcela do
   begin
      LimpaParametros(qryBuscaParcela);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;
      Open;
   end;

   // preenche os campos necessários
   rItem.CodigoItem     := qryBuscaParcelaIDITEMEMPTMO.AsInteger;
   rItem.Parcela        := qryBuscaParcelaHMEPARCELA.AsInteger;
   rItem.ParcResta      := qryBuscaParcelaHMENUMPARCELAS.AsInteger;

   rItem.iEvento        := 1;    // presume-se que seja uma parcela

   rItem.FlgEnvio       := -1;
   rItem.FlgBaixado     := -1;
   rItem.RecPag         := 'R';
   rItem.FormaCobranca  := sFormaCobranca;
   rItem.TipoFolha      := sTipoFolha;
   rItem.Origem         := 11;   // Recebimento
   rItem.SeqCobranca    := 2;
   rItem.FlgTipoDiverg  := 2;    // Recebimento Inesperado

   rItem.AnoCompetencia := trunc(DBspnAno.Value);
   rItem.MesCompetencia := (cboMes.ItemIndex + 1);
   rItem.AnoCobranca    := trunc(DBspnAno.Value);
   rItem.MesCobranca    := (cboMes.ItemIndex + 1);

   rItem.FlgCentraliza  := qryBuscaParcelaHMECENTRALIZA.AsInteger;
   rItem.FlgDestacado   := qryBuscaParcelaHMEDESTACADO.AsInteger;

   rItem.DataPrevista   := dData;
   rItem.DataVencto     := dData;
   rItem.DataEfetiva    := dData;
   rItem.DataReceb      := Sysdate;

   rItem.Valor          := 0;
   rItem.ValorEfetivo   := fVlrInserir;
   rItem.SaldoDevedor   := qryBuscaParcelaHMESALDODEV.AsCurrency;
   rItem.TxJuros        := 0;

   // faz o insert
   CalcEmptmo.InsertMovEmptmo(rItem, rContrato);

   // ----------------------------------------------------------------------------------------------

   // aproveitando o registro (do item) que já foi preparado,
   // altera apenas os dados necessários

   rItem.RecPag         := 'P';
   rItem.SeqCobranca    := 3;

   rItem.FlgEnvio       := 0;
   rItem.FlgBaixado     := 0;

   rItem.Valor          := rItem.ValorEfetivo * (-1);
   rItem.ValorEfetivo   := 0;

   rItem.DataEfetiva    := 0;

   rItem.FlgDivergPend  := 1;

   // ----------------------------------------------------------------------------------------------
   // no caso da FUNCEF, já prepara a devolução para D + 2 (útil)
   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
   begin
      rItem.DataVencto     := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IDEmpresa,
                                                                 (rItem.DataVencto + 1),
                                                                 True,
                                                                 True,
                                                                 False
                                                                );

      if (Time > StrToTime(FormatDateTime('hh:nn:ss', dtmEmptmo.qryParamEmptmoHORAENCERRA.AsDateTime))) then
      begin
         rItem.DataVencto  := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IDEmpresa,
                                                                 (rItem.DataVencto + 1),
                                                                 True,
                                                                 True,
                                                                 False
                                                                );
      end
   end;
   // ----------------------------------------------------------------------------------------------

   // faz o insert
   CalcEmptmo.InsertMovEmptmo(rItem, rContrato);

   // ----------------------------------------------------------------------------------------------

   qryBuscaParcela.Close;
end;

function TfrmExecRecebimento.EncontrouRegistro(const IDHist          : Extended;
                                               const IDContrato      : Extended;
                                               const iAnoCobranca    : Integer;
                                               const iMesCobranca    : Integer;
                                               const iAnoCompetencia : Integer;
                                               const iMesCompetencia : Integer
                                              ): Boolean;
begin
   // Procura pelo registro de origem na HistMovEmptmo
   LimpaParametros(qryHistMov);
   qryHistMov.ParamByName('PIDHISTMOVEMPTMO').AsFloat       := IDHist;
   qryHistMov.ParamByName('PIDCONTRATOEMPTMO').AsFloat      := IDContrato;
   qryHistMov.ParamByName('PHMEANOCOBRANCA').AsInteger      := iAnoCobranca;
   qryHistMov.ParamByName('PHMEMESCOBRANCA').AsInteger      := iMesCobranca;
   qryHistMov.Open;

   Result := not(qryHistMov.IsEmpty);
end;

function TfrmExecRecebimento.EncontrouRegistroAgrupado(const IDTMPDESC       : Extended;
                                                     const IDContrato      : Extended;
                                                     const iAnoCobranca    : Integer;
                                                     const iMesCobranca    : Integer;
                                                     const iAnoCompetencia : Integer;
                                                     const iMesCompetencia : Integer
                                                    ): Integer;
begin
   // Procura pelo registro de origem na HistMovEmptmo
   LimpaParametros(qryHistMovAgrupado);
   qryHistMovAgrupado.ParamByName('PIDTMPDESC').AsFloat             := IDTMPDESC;
   qryHistMovAgrupado.ParamByName('PIDCONTRATOEMPTMO').AsFloat      := IDContrato;
   qryHistMovAgrupado.ParamByName('PHMEANOCOBRANCA').AsInteger      := iAnoCobranca;
   qryHistMovAgrupado.ParamByName('PHMEMESCOBRANCA').AsInteger      := iMesCobranca;
   qryHistMovAgrupado.Open;

   Result := 0;
   if not(qryHistMovAgrupado.IsEmpty) then Result := qryHistMovAgrupado.RecordCount;
end;



function TfrmExecRecebimento.EncontrouRegistroQuitado(const IDHist          : Extended;
                                                      const IDContrato      : Extended;
                                                      const iAnoCobranca    : Integer;
                                                      const iMesCobranca    : Integer;
                                                      const iAnoCompetencia : Integer;
                                                      const iMesCompetencia : Integer
                                                     ): Boolean;
begin
   // Procura pelo registro de origem na HistMovEmptmo
   LimpaParametros(qryHistMovQuitado);
   qryHistMovQuitado.ParamByName('PIDHISTMOVEMPTMO').AsFloat      := IDHist;
   qryHistMovQuitado.ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
   qryHistMovQuitado.ParamByName('PHMEANOCOBRANCA').AsInteger     := iAnoCobranca;
   qryHistMovQuitado.ParamByName('PHMEMESCOBRANCA').AsInteger     := iMesCobranca;
   qryHistMovQuitado.Open;

   Result := not(qryHistMovQuitado.IsEmpty);
end;

function TfrmExecRecebimento.EncontrouRegistroQuitadoAgrupado(const IDTMPDESC       : Extended;
                                                              const IDContrato      : Extended;
                                                              const iAnoCobranca    : Integer;
                                                              const iMesCobranca    : Integer;
                                                              const iAnoCompetencia : Integer;
                                                              const iMesCompetencia : Integer
                                                             ): Integer;
begin
   // Procura pelo registro de origem na HistMovEmptmo
   LimpaParametros(qryHistMovQuitadoAgrupado);
   qryHistMovQuitadoAgrupado.ParamByName('PIDTMPDESC').AsFloat            := IDTMPDESC;
   qryHistMovQuitadoAgrupado.ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
   qryHistMovQuitadoAgrupado.ParamByName('PHMEANOCOBRANCA').AsInteger     := iAnoCobranca;
   qryHistMovQuitadoAgrupado.ParamByName('PHMEMESCOBRANCA').AsInteger     := iMesCobranca;
   qryHistMovQuitadoAgrupado.Open;

   Result := 0;
   if not(qryHistMovQuitadoAgrupado.IsEmpty) then Result := qryHistMovQuitadoAgrupado.RecordCount;
end;



function  TfrmExecRecebimento.TotalizaVlrHist(const IDTMPDESC       : Extended;
                                              const IDContrato      : Extended;
                                              const iAnoCobranca    : Integer;
                                              const iMesCobranca    : Integer;
                                              const iAnoCompetencia : Integer;
                                              const iMesCompetencia : Integer
                                             ): Currency;
begin
   // Procura pelo registro de origem na HistMovEmptmo
   LimpaParametros(qryTotalizaHist);
   qryTotalizaHist.ParamByName('PIDTMPDESC').AsFloat             := IDTMPDESC;
   qryTotalizaHist.ParamByName('PIDCONTRATOEMPTMO').AsFloat      := IDContrato;
   qryTotalizaHist.ParamByName('PHMEANOCOBRANCA').AsInteger      := iAnoCobranca;
   qryTotalizaHist.ParamByName('PHMEMESCOBRANCA').AsInteger      := iMesCobranca;
   qryTotalizaHist.Open;

   Result := 0;
   if not(qryTotalizaHist.IsEmpty) then Result := qryTotalizaHistHMEVLRPREVISTO.AsFloat;
   qryTotalizaHist.Close;
end;

function  TfrmExecRecebimento.BaixaTodosRegistrosHist(const IDTMPDESC       : Extended;
                                                      const IDContrato      : Extended;
                                                      const iAnoCobranca    : Integer;
                                                      const iMesCobranca    : Integer;
                                                      const iAnoCompetencia : Integer;
                                                      const iMesCompetencia : Integer;
                                                      const dDataBaixa      : TDateTime
                                                     ): Integer;
begin
   with qryBaixaTodosItensTmpDesc do
   begin
      LimpaParametros(qryBaixaTodosItensTmpDesc);

      ParamByName('PIDTMPDESC').AsFloat         := IDTMPDESC;
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContrato;
      ParamByName('PHMEANOCOBRANCA').AsInteger  := iAnoCobranca;
      ParamByName('PHMEMESCOBRANCA').AsInteger  := iMesCobranca;
      //BRUNO AZEVEDO SOL 127656 KINTANA 744421
      if (dDataBaixa > 0) then begin
         ParamByName('PHMEDATAEFETIVA').AsDate    := dDataBaixa;
      end else begin
         ParamByName('PHMEDATAEFETIVA').Clear;
      end;
      //BRUNO AZEVEDO SOL 127656 KINTANA 744421
      ParamByName('PHMEDATARECEB').AsDate       := Sysdate;

      ExecSQL;

      Result := RowsAffected;
   end;
end;

procedure TfrmExecRecebimento.InsereDiferencaHist(var   qryLocal   : TwwQuery;
                                                  const NovosDados : TNovosDados
                                                 );
var
   rContrato      : TDadosContrato;
   ItemContrato   : TItemRecDep;
begin

   try
      // Limpa o registro com os dados do Contrato
      LimpaRegistroContrato(rContrato);

      rContrato.IDContratoEmptmo       := qryLocal.FieldByName('IDCONTRATOEMPTMO').AsFloat;

      // -------------------------------------------------------------------------------------------
      if (qryLocal = qryHistMov) or (qryLocal = qryHistMovAgrupado) or (qryLocal = qryHistMovQuitado) then
      begin
         ItemContrato.Parcela          := qryLocal.FieldByName('HMEPARCELA').AsInteger;
         ItemContrato.ParcelaAlt       := qryLocal.FieldByName('HMEPARCELAALT').AsInteger;
         ItemContrato.ParcResta        := qryLocal.FieldByName('HMENUMPARCELAS').AsInteger;
         ItemContrato.IdItemCentraliza := qryLocal.FieldByName('IDITEMCENTRALIZA').AsInteger;
         ItemContrato.iEvento          := qryLocal.FieldByName('HMETIPOMOV').AsInteger;
      end;

      if qryLocal = qryItensABaixar then
      begin
         ItemContrato.Parcela          := qryItensABaixarHMEPARCELA.AsInteger;
         ItemContrato.ParcelaAlt       := qryItensABaixarHMEPARCELAALT.AsInteger;
         ItemContrato.ParcResta        := qryItensABaixarHMENUMPARCELAS.AsInteger;
         ItemContrato.iEvento          := qryItensABaixarHMETIPOMOV.AsInteger;
      end;
      // -------------------------------------------------------------------------------------------

      ItemContrato.CodigoItem          := NovosDados.IDItemEmptmo;

      ItemContrato.FormaCobranca       := NovosDados.FormaCoranca;
      ItemContrato.TipoFolha           := NovosDados.TipoFolha;

      ItemContrato.DataPrevista        := NovosDados.DataPrevista;
      ItemContrato.DataVencto          := NovosDados.DataVencto;
      ItemContrato.DataEfetiva         := NovosDados.DataEfetiva;
      ItemContrato.DataReceb           := Sysdate;

      ItemContrato.DataUltAtualiza     := qryLocal.FieldByName('HMEDATAATUALIZA').AsDateTime;
      ItemContrato.AnoCompetencia      := NovosDados.AnoCompetencia;
      ItemContrato.MesCompetencia      := NovosDados.MesCompetencia;

      ItemContrato.AnoCobranca         := NovosDados.AnoCobranca;
      ItemContrato.MesCobranca         := NovosDados.MesCobranca;

      ItemContrato.Valor               := NovosDados.ValorPrevisto;
      ItemContrato.ValorEfetivo        := NovosDados.ValorEfetivo;

      if ItemContrato.Valor >= 0 then
      begin
         ItemContrato.RecPag           := 'R';
      end
      else
      begin
         ItemContrato.RecPag           := 'P';
      end;

      ItemContrato.SaldoDevedor        := qryLocal.FieldByName('HMESALDODEV').ASCurrency;
      ItemContrato.TxJuros             := qryLocal.FieldByName('HMETXJUROS').AsFloat;
      ItemContrato.Regra               := qryLocal.FieldByName('IDREGRA').AsInteger;
      ItemContrato.Rubrica             := NovosDados.IDRubrica;

      ItemContrato.Origem              := 11; // Recebimento

      ItemContrato.Prioridade          := qryLocal.FieldByName('HMEPRIORIDADE').AsInteger;
      ItemContrato.SeqCobranca         := NovosDados.SeqCobranca;

      ItemContrato.FlgCentraliza       := qryLocal.FieldByName('HMECENTRALIZA').AsInteger;
      ItemContrato.FlgDestacado        := qryLocal.FieldByName('HMEDESTACADO').AsInteger;

      ItemContrato.FlgEnvio            := NovosDados.FlgEnvio;
      ItemContrato.FlgBaixado          := NovosDados.FlgBaixado;
      ItemContrato.FlgDivergPend       := NovosDados.FlgDivergPend;
      ItemContrato.FlgTipoDiverg       := NovosDados.FlgTipoDiverg;

      // função que grava as informações pertinentes a um contrato no histórico de movimento
      // de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
      // bem sucedida e False caso negativo
      if not(CalcEmptmo.InsertMovEmptmo(ItemContrato, rContrato)) then
      begin
         memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                           CompletaInicio(FormatFloat('#0', qryTmpDesc.FieldByName('IDDESCONTO').AsFloat), ' ', 15) + ' ' +
                           CompletaFim(qryTmpDesc.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                           CompletaFim(FormatFloat('#0', qryTmpDesc.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                           CompletaFim(FormatFloat('#0', qryTmpDesc.FieldByName('IDPESSJUR').AsFloat), ' ', 5) + ' ' +
                           CompletaFim((FormatFloat('00', qryTmpDesc.FieldByName('PARCELA').AsFloat) + '/' +
                                        FormatFloat('00', qryTmpDesc.FieldByName('NUMPARCELAS').AsFloat)
                                       ), ' ', 7) + ' ' +
                           CompletaFim(FormatFloat('#,#0.00', qryTmpDesc.FieldByName('VALOR').AsCurrency), ' ', 15) + ' ' +
                           'Erro ao inserir diferença'
                          );
      end
      else
      begin
        memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                          CompletaInicio(FormatFloat('#0', qryTmpDesc.FieldByName('IDDESCONTO').AsFloat), ' ', 15) + ' ' +
                          CompletaFim(qryTmpDesc.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                          CompletaFim(FormatFloat('#0', qryTmpDesc.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                          CompletaFim(FormatFloat('#0', qryTmpDesc.FieldByName('IDPESSJUR').AsFloat), ' ', 5) + ' ' +
                           CompletaFim((FormatFloat('00', qryTmpDesc.FieldByName('PARCELA').AsFloat) + '/' +
                                        FormatFloat('00', qryTmpDesc.FieldByName('NUMPARCELAS').AsFloat)
                                       ), ' ', 7) + ' ' +
                          CompletaFim(FormatFloat('#,#0.00', qryTmpDesc.FieldByName('VALOR').AsCurrency), ' ', 15) + ' ' +
                          'Diferença inserida - ' + FormatFloat('#,#0.00', ItemContrato.Valor)
                         );
      end;

   finally
      // Limpa o registro com os dados do Contrato
      LimpaRegistroContrato(rContrato);
   end;
end;



procedure TfrmExecRecebimento.btnContinuarClick(Sender: TObject);
var
   i,j              : Integer;
   iContador      : Integer;
   fVlrReceb      : Currency;
   fVlrRecebPatro : Currency;
   fVlrRecebTotal : Currency;
   dHoraIni       : TDateTime;
   dHoraFim       : TDateTime;
   patro          :string;
   teste :integer;
begin
   inherited;

   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,' O processo não poderá ser executado. '+#13#10+
                           ' O usuário é o próprio mutuário do contrato de empréstimo! ','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;

      ParametrosSistema;

   if ((chkCaP.Checked) or (chkCaR.Checked)) and
      (
      (length(trim(edtDataEfetivaIni.Text)) = 0) or
      (length(trim(edtDataEfetivaFim.Text)) = 0)
      ) and
      (length(trim(edtCodDocumento.Text)) = 0) then
   begin
      if MsgDlg(' Não foi indicada uma faixa de datas de baixa para recebimento do Financeiro. ' + #13 +
                ' Deseja prosseguir sem esse filtro ? ', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;
      Repaint;
   end;

   if not(VerificaPreenchimento) then
      Exit;
   //HIGOR NAYDE FERREIRA SOL 180837/14327 KINTANA 1989635
   if (rgProcessamento.ItemIndex = 0)then
   begin
     try
        // vai para página de Resultados
        Repaint;
        Application.ProcessMessages;

        dHoraIni := Now;

        // limpa os memos de resultado e erro
        memErro.Clear;
        memResult.Clear;
        memResult.Lines.Add(FormatDateTime('hh:nn:ss', dHoraIni) +
                           ' - Iniciando Recebimento...' + DBcboTipoEmptmo.LookupValue
                           );
        memResult.Lines.Add(' ');

        Repaint;
        Application.ProcessMessages;

        fVlrRecebTotal := 0;


        // ----------------------------------------------------------------------------------------
        // André Pontes - 24/08/2004
        // CaP passa a ser processado fora do loop por patro, que não faz mais sentido
        // ----------------------------------------------------------------------------------------
        memResult.Lines.Add('------------------------------------------------------------');
        memResult.Lines.Add('Processando ' + 'Financeiro (a Pagar)' + '...');
        memResult.Lines.Add(' ');

        memErro.Lines.Add(' ');
        memErro.Lines.Add('Processando ' + 'Financeiro (a Pagar)' + '...');
        memErro.Lines.Add(' ');

        memErro.Lines.Add('           Nº Contrato     Matrícula       Plano Patro Parcela Valor           Ocorrência                                             ');
        memErro.Lines.Add('           --------------- --------------- ----- ----- ------- --------------- -------------------------------------------------------');

        // ----------------------------------------------------------------------------------------

        fVlrReceb      := RecebimentoCaPCar(-1, 'P');
        fVlrRecebPatro := fVlrRecebTotal + fVlrReceb;
        memResult.Lines.Add(' Financeiro (a Pagar)   : ' + FormatFloat('#,0.00', fVlrReceb));

        // ----------------------------------------------------------------------------------------

        memResult.Lines.Add('------------------------------------------------------------');
        memResult.Lines.Add(' Valor Recebido - ' + 'Financeiro (a Pagar)' + ': ' + FormatFloat('#,0.00', fVlrReceb));
        memResult.Lines.Add('------------------------------------------------------------');
        memResult.Lines.Add(' ');

        // ----------------------------------------------------------------------------------------
        // FIM André Pontes - 24/08/2004
        // ----------------------------------------------------------------------------------------

        // Laço das Patrocinadoras escolhidas
        for i := 0 to High(molListaPatro.vIDPatro) do
        begin
           // Caso patrocinadora não tenha sido selecionada passa para próxima
           if not(molListaPatro.lstPatro.Checked[i]) then
              Continue;

           fVlrRecebPatro := 0;

           // Atualiza Resultado
           memResult.Lines.Add('------------------------------------------------------------');
           memResult.Lines.Add('Processando ' + molListaPatro.lstPatro.Items[i] + '...');
           memResult.Lines.Add(' ');

           memErro.Lines.Add(' ');
           memErro.Lines.Add('Processando ' + molListaPatro.lstPatro.Items[i] + '...');
           memErro.Lines.Add(' ');

           memErro.Lines.Add('           Nº Contrato     Matrícula       Plano Patro Parcela Valor           Ocorrência                                             ');
           memErro.Lines.Add('           --------------- --------------- ----- ----- ------- --------------- -------------------------------------------------------');

           // ----------------------------------------------------------------------------------------
           fVlrReceb      := RecebimentoCaPCar(i, 'R');     //ALEX VAI MECHER AQUI
           fVlrRecebPatro := fVlrRecebPatro + fVlrReceb;
           memResult.Lines.Add(' Financeiro (a Receber) : ' + FormatFloat('#,0.00', fVlrReceb));
           // ----------------------------------------------------------------------------------------
           fVlrReceb      := RecebimentoTMPDESC(i);
           fVlrRecebPatro := fVlrRecebPatro + fVlrReceb;
           memResult.Lines.Add(' Folha(s)               : ' + FormatFloat('#,0.00', fVlrReceb));
           // ----------------------------------------------------------------------------------------
           // ----------------------------------------------------------------------------------------

           // Atualiza Resultado
           memResult.Lines.Add('------------------------------------------------------------');
           memResult.Lines.Add(' Valor Recebido - ' +
                               molListaPatro.lstPatro.Items[i] + ': ' +
                               FormatFloat('#,0.00', fVlrRecebPatro));
           memResult.Lines.Add('------------------------------------------------------------');
           memResult.Lines.Add(' ');

           Repaint;

           // Totaliza
           fVlrRecebTotal := fVlrRecebTotal + fVlrRecebPatro;
        end; // for i := 0 to High(molListaPatro.vIDPatro)

        // Atualiza Resultado
        memResult.Lines.Add(' ');
        memResult.Lines.Add('------------------------------------------------------------');
        memResult.Lines.Add('------------------------------------------------------------');
        memResult.Lines.Add(' Valor TOTAL Recebido: ' + FormatFloat('#,0.00', fVlrRecebTotal));
        memResult.Lines.Add('------------------------------------------------------------');
        memResult.Lines.Add('------------------------------------------------------------');
        memResult.Lines.Add(' ');

        dHoraFim := Now;

        memResult.Lines.Add(FormatDateTime('hh:nn:ss', dHoraFim) + ' - Final do Processo');

        memResult.Lines.Add(' ');
        memResult.Lines.Add('Tempo total do processo: ' + FormatDateTime('hh:nn:ss', dHoraFim - dHoraIni));

     finally
     // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
     // memResult.Lines.SaveToFile(Sistema.TempDir + 'EP-Recebimento ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');

        memResult.Lines.SaveToFile(ftempregra + '\' + 'EP-Recebimento ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
     end; // try
   end
   else If (rgProcessamento.ItemIndex = 1) then
   begin
       try
           for i := 0 to High(molListaPatro.vIDPatro) do begin
              if (molListaPatro.lstPatro.Checked[i]) then begin
                 //patro:=   molListaPatro.lstPatro.Items[i];
                patro:= IntToSTR(molListaPatro.vIDPatro[i]);
                 j:=i+1;
              break;
              end;
           end;

           for j := j to High(molListaPatro.vIDPatro) do begin
              if (molListaPatro.lstPatro.Checked[j]) then
               //patro :=   patro+', ' + molListaPatro.lstPatro.Items[j];
               patro:=  patro+', ' + IntToSTR(molListaPatro.vIDPatro[j]);
           end;
           SP_RECEBIMENTO_AUTOMATICO(patro);
           //SP_PROCssss;
       finally                                                    
       end;
   end;
        //HIGOR NAYDE FERREIRA SOL 180837/14327 KINTANA 1989635

end;

procedure TfrmExecRecebimento.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;


procedure TfrmExecRecebimento.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;

procedure TfrmExecRecebimento.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;

   chkDiverg.Visible := (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);
   chkDiverg.Checked := (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);

   molMutuario.Enabled  := not(dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);
   molMutuario.Visible  := not(dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);

   AbreQueries;

   molMutuario.btnLimpaPart.Click;
   molContratoEmptmo.btnLimpaContrato.Click;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatro.btnMarcaTodosPatroClick(self);

   cboMes.ItemIndex := DiasUteis.ExtraiMes(SysDate) - 1;
   dbspnAno.Value   := DiasUteis.ExtraiAno(SysDate);
   bVerificacao := false; // Wylliam Silva kINTANA: 1503641 SOL: 168747

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then chkCritica.Visible := True;
end;

procedure TfrmExecRecebimento.pgcControleChange(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
end;

function TfrmExecRecebimento.DesfazAmortizacaoQuitacao(const IDContrato  : Extended;
                                                       const iEvento     : Integer;
                                                       const iOrigem     : Integer;
                                                       const dDataVencto : TDateTime
                                                      ): Integer;
begin
   try
      with dtmEmptmo.qryDadosContrato do
      begin
         LimpaParametros(dtmEmptmo.qryDadosContrato);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;
         Open;
      end;

      if (iEvento = 3) then
      begin
         // ----------------------------------------------------------------------------------------
         memResult.Lines.Add(' ');
         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Documento ' +
                             CompletaInicio(FormatFloat('#0', qryItensCaPCaRCODDOCUMENTO.AsFloat), ' ', 15) +
                             ' - Cancelamento de Quitação '
                            );
         memResult.Lines.Add(' ');

         //BRUNO AZEVEDO SOL 178622 KINTANA 1641054
         dtmEmptmo.qryAtualizaSituacao.Close;
         dtmEmptmo.qryAtualizaSituacao.ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;
         dtmEmptmo.qryAtualizaSituacao.ExecSql;


         Result := CalcEmptmo.CancelaQuitacao(IDContrato,
                                              dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime,
                                              dDataVencto,
                                              -1,
                                              False
                                             );

         // ----------------------------------------------------------------------------------------
      end
      else
      if (iEvento = 2) then
      begin
         // ----------------------------------------------------------------------------------------
         memResult.Lines.Add(' ');
         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Documento ' +
                             CompletaInicio(FormatFloat('#0', qryItensCaPCaRCODDOCUMENTO.AsFloat), ' ', 15) +
                             ' - Cancelamento de Amortização '
                            );
         memResult.Lines.Add(' ');

         Result := CalcEmptmo.CancelaAmortizacao(IDContrato,
                                                 dtmEmptmo.qryDadosContratoAMODATAPREVISTA.AsDateTime,
                                                 dDataVencto,
                                                 False
                                                );
         // ----------------------------------------------------------------------------------------
      end
      else
      if (iEvento = 0) and (iOrigem = 13) then
      begin
         memResult.Lines.Add(' ');
         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Documento ' +
                             CompletaInicio(FormatFloat('#0', qryItensCaPCaRCODDOCUMENTO.AsFloat), ' ', 15) +
                             ' - Cancelamento de Alteração de Concessão '
                            );
         memResult.Lines.Add(' ');

         Result := CalcEmptmo.CancelaAlteracaoConcessao(IDContrato,
                                                        dDataVencto,
                                                        dDataVencto,
                                                        False
                                                       );
      end;


      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
      begin
         // -------------------------------------------------------------------------------------------
         dtmAtualizacaoDiaria.ExecutaAtuDia(IDContrato,           // Contrato
                                            Sistema.IDModulo,
                                            -1,                   // Tipo Contr
                                            -1,                   // Tipo Emptmo
                                            -1,                   // Patro
                                            -1,                   // Plano
                                            1,                    // Estorno
                                            0,                    // Prov Perda
                                            1,                    // Atu Saldo
                                            -1,                   // In Arquivo
                                            -1,                   // Not In Arquivo
                                            dDataVencto,          // Data Ini
                                            dDataVencto + 15,     // Data Fim
                                            dDataVencto - 1       // Data Considera
                                           );
         // -------------------------------------------------------------------------------------------
      end;
   except
      Result := -1;
   end;
end;
//SOL 167580 Monica Gonzaga
//SOL 167580 Xavier

function TfrmExecRecebimento.DesfazQuitacaoAcertoConcessao(const IDContrato  : Extended;
                                                           const VlrRecebido : Currency;
                                                           const dData       : TDateTime
                                                           ): Integer;
var Data : TDateTime;
begin



   // com o contrato passado traz o valor do acerto de concessao
   QryValorAcertoConcessao.close;
   QryValorAcertoConcessao.ParamByName('PIDCONTRATOEMPTMO').AsFloat :=  IDContrato;
   QryValorAcertoConcessao.open;
   // se o valor do campo HMEVLRPREVISTO *-1 for igual ao valor recebido é porque
   // foi feito um acerto de quitação com valor igual a zero e a quitação dos contratos
   // quitados a partir desse contrato deve ser desfeita
   //if (QryValorAcertoConcessao.FieldByName('HMEVLRPREVISTO').AsCurrency * -1 ) = VlrRecebido then
//   if (QryValorAcertoConcessao.FieldByName('HMEVLRPREVISTO').AsFloat * -1 ) = VlrRecebido then
   //begin

         // pega os contratos quitados a partir do contrato passado como parametro
      QryContratos.close;
      QryContratos.ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;
      QryContratos.open;
      QryContratos.first;

      // loop nos contratos quitados
      while not(QryContratos.Eof)  do
      begin

         QryDatas.close;                                      //BRUNO AZEVEDO SOL 176971 KINTANA 1617722
         QryDatas.ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;//QryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
         QryDatas.open;


         qryUpdateContratos.Close;
         qryUpdateContratos.ParamByName('IDCONTRATOEMPTMO').AsFloat := QryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
         qryUpdateContratos.ParamByName('HMEDATAPREVISTA').AsDateTime := QryDatas.FieldByName('DATAPREV').AsDateTime;
         qryUpdateContratos.ExecSQL;


         QryContratos.next;
      end;
      // pega os contratos quitados a partir do contrato passado como parametro
      QryContratos.close;
      QryContratos.ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;
      QryContratos.open;
      QryContratos.first;
       // loop nos contratos quitados
      while not(QryContratos.Eof)  do
      begin
         QryDatas.close;                                      //BRUNO AZEVEDO SOL 176971 KINTANA 1617722
         QryDatas.ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;//QryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
         QryDatas.open;
         QryDatas.FieldByName('DATAPREV').AsString;

         with dtmEmptmo.qryDadosContrato do
         begin
            LimpaParametros(dtmEmptmo.qryDadosContrato);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat := QryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
            Open;
         end;

         if CalcEmptmo.CancelaQuitacao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                       QryDatas.FieldByName('DATAPREV').AsDateTime,
                                       Date,// BRUNO AZEVEDO SOL 167580
                                       0,
                                       True
                                       ) = 0 then
         begin
         end;

         qryUpdateContratosFinal.Close;
         qryUpdateContratosFinal.ParamByName('IDCONTRATOEMPTMO').AsFloat := QryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
         qryUpdateContratosFinal.ExecSQL;

         QryContratos.next;
      end;
  // end;
end;
//SOL 167580 Xavier
//SOL 167580 Monica Gonzaga

procedure TfrmExecRecebimento.molMutuariobtnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;

procedure TfrmExecRecebimento.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;

function TfrmExecRecebimento.VerificaEventoDoc: Boolean;
begin
   Result := False;

   with qryEventoDoc do
   begin
      LimpaParametros(qryEventoDoc);
      ParamByName('PCODDOCUMENTO').AsFloat := qryItensCaPCaRCODDOCUMENTO.AsFloat;
      Open;

      if qryEventoDoc.RecordCount = 1 then Result := True;
   end;
end;

procedure TfrmExecRecebimento.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;

procedure TfrmExecRecebimento.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;
         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;

procedure TfrmExecRecebimento.edtCodDocumentoExit(Sender: TObject);
var
   iDocumento : Integer;
begin
   inherited;
   if length(trim(edtCodDocumento.Text)) > 0 then
   begin
      try
         iDocumento := StrToInt(edtCodDocumento.Text);
      except
         MsgDlg('É necessário indicar um valor numérico e inteiro para o código do Documento!', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         edtCodDocumento.SetFocus;
         Exit;
      end;
   end;
end;

procedure TfrmExecRecebimento.edtCodDocumentoKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if IsCharAlpha(Key) then Key := #0;
end;

function TfrmExecRecebimento.EhRefinanciamento: Boolean;
begin
   Result := False;
   // Essa verificação é só para FUNCEF
   if Sistema.TipoCliente <> 19991 then Exit;
   try
      // seleciona os itens (na HistMovEmptmo) que compõem o Documento
      with qryItensABaixar do
      begin
         LimpaParametros(qryItensABaixar);
         ParamByName('PCODDOCUMENTO').AsFloat := qryItensCaPCaRCODDOCUMENTO.AsFloat;
         ParamByName('PJABAIXADO').AsInteger  := 1;
         Open;
      end;
      // verifica se cada item é IOF ou Seguro, o que configuraria refinanciamento
      qryItensABaixar.First;
      while not(qryItensABaixar.EOF) do
      begin
         with qryItemProcesso do
         begin
            LimpaParametros(qryItemProcesso);
            ParamByName('PIDEMPRESAPROP').AsInteger     := Sistema.IDEmpresa;
            ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryItensABaixarIDTIPOCONTREMPTMO.AsInteger;
            ParamByName('PIDITEMEMPTMO').AsInteger      := qryItensABaixarIDITEMEMPTMO.AsInteger;
            Open;
         end;

         if not(qryItemProcesso.IsEmpty) then
         begin
            Result := True;
            Exit;
         end;

         qryItensABaixar.Next;
      end; // while not(qryItensABaixar.EOF)

   finally
      qryItensABaixar.Close;
      qryItemProcesso.Close;
   end;
end;

procedure TfrmExecRecebimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UFuncoesEmptmo.bBuscaMutuario := false;
end;
//HIGOR NAYDE FERREIRA SOL 180837/14327 KINTANA 1989635
procedure TfrmExecRecebimento.SP_RECEBIMENTO_AUTOMATICO(vPatro :String);
var
  SP_MSGERRO  : string;
  SP_ERRO     : string;
  SP_TMSGERRO : TStringlist;
  SP_TERRO     : TStringlist;
  Linha        : Boolean;
begin
   try
      Linha := True;
      SP_TMSGERRO := TStringlist.Create;
      SP_TERRO    := TStringlist.Create;

      if(molContratoEmptmo.edtIdContrato.Text <> '' )then
       begin
          SP_PROC.ParamByName('pNumContrato').text      := molContratoEmptmo.edtIdContrato.Text;
          SP_PROC.ParamByName('pNumContrato').asfloat      :=strtofloat(SP_PROC.ParamByName('pNumContrato').text);
       end
      else
          SP_PROC.ParamByName('pNumContrato').AsFloat      := -1;

      if(DBcboTipoEmptmo.LookupValue <> '')then
          SP_PROC.ParamByName('pTipoEmptmo').AsFloat       := StrToFloat(DBcboTipoEmptmo.LookupValue)
      else
          SP_PROC.ParamByName('pTipoEmptmo').AsFloat       :=  -1;

      if (DBcboTipoContrato.LookupValue <> '')then
          SP_PROC.ParamByName('pTipoContrato').AsFloat    := StrToFloat(DBcboTipoContrato.LookupValue)
      else
          SP_PROC.ParamByName('pTipoContrato').AsFloat    := -1;

      if vPatro <> '' then
          SP_PROC.ParamByName('pPatro').AsString          := vPatro
      else
          SP_PROC.ParamByName('pPatro').AsString          := '';

      if (chkFolhaPatro.Checked) then
          SP_PROC.ParamByName('pFlgFolhaPatro').AsInteger := 1
      else
          SP_PROC.ParamByName('pFlgFolhaPatro').AsInteger := 0;

      if (chkFolhaBenef.Checked) then
          SP_PROC.ParamByName('pFlgFolhaBenef').AsInteger := 1
      else
          SP_PROC.ParamByName('pFlgFolhaBenef').AsInteger := 0;

      if (chkCaP.Checked) then
          SP_PROC.ParamByName('pFlgFinanAPagar').AsInteger := 1
      else
          SP_PROC.ParamByName('pFlgFinanAPagar').AsInteger := 0;

      if (chkCaR.Checked) then
          SP_PROC.ParamByName('pFlgFinanAReceber').AsInteger := 1
      else
          SP_PROC.ParamByName('pFlgFinanAReceber').AsInteger := 0;

      //Leandro Pocebon - SIG129599 - Inicio
      if (chkCaR.Checked) and (trim(DBcboFormaRecebimento.LookupValue) <> EmptyStr) then
          SP_PROC.ParamByName('pPortadorForma').AsInteger := StrToInt(Trim(DBcboFormaRecebimento.LookupValue))
      else
          SP_PROC.ParamByName('pPortadorForma').AsInteger :=  0;
      //Leandro Pocebon - SIG129599 - Inicio

      SP_PROC.ParamByName('pMesCobranca').AsFloat := Meses;

      if (DBspnAno.Value > 0) then
          SP_PROC.ParamByName('pAnoCobranca').AsFloat := DBspnAno.Value
      else
          SP_PROC.ParamByName('pAnoCobranca').AsFloat := -1;

      if (edtCodDocumento.Text <> '') then
         SP_PROC.ParamByName('pCodDocumento').AsFloat :=  StrToFloat(edtCodDocumento.Text)
      else
         SP_PROC.ParamByName('pCodDocumento').AsFloat :=  -1;

      if (edtDataEfetivaIni.Text <> '')then
         SP_PROC.ParamByName('pDataBaixaRecInicio').AsDateTime := edtDataEfetivaIni.dateTime
      else
         SP_PROC.ParamByName('pDataBaixaRecInicio').AsDate := -1;

      if (edtDataEfetivaFim.Text <> '') then
         SP_PROC.ParamByName('pDataBaixaRecFim').AsDateTime := edtDataEfetivaFim.DateTime
      else
        SP_PROC.ParamByName('pDataBaixaRecFim').AsDate := -1;

      frmAguarde.Pos := 0;
      frmExecRecebimento.Enabled := False;
      frmAguarde.Mostra('Processando, Aguarde...');

      SP_PROC.Prepare;
      SP_PROC.ExecProc;

      qryResultado.Close;
      qryResultado.sql.clear;
      qryResultado.SQL.add(' SELECT LINHARESULTADO FROM CM.RESULT_RECEBIMENTOAUTO WHERE TIPORESULTADO = 1 ORDER BY ORDEM ');
      qryResultado.Open;
      frmAguarde.pbAguarde.Position:=3;
      while not qryResultado.eof do begin
            memResult.Lines.Add(qryResultado.FieldByName('LINHARESULTADO').AsString);
            qryResultado.Next;
      end;
      frmAguarde.pbAguarde.Position:=4;

      qryResultado.Close;
      qryResultado.sql.clear;
      qryResultado.SQL.add('SELECT LINHARESULTADO FROM CM.RESULT_RECEBIMENTOAUTO WHERE TIPORESULTADO = 2 ORDER BY ORDEM ');
      qryResultado.Open;
      
//      IF not qryResultado.IsEmpty then begin
       while ((not qryResultado.IsEmpty) and (not qryResultado.Eof) or ((not qryResultado.IsEmpty)and (Linha))) do begin
            memErro.Lines.Add(qryResultado.FieldByName('LINHARESULTADO').AsString);
            qryResultado.Next;
            Linha := False;
      end;

      {SP_PROC.First;
      TBlobField(SP_PROC.FieldByName('Resultado')).SaveToFile('c:\planus\temp\ResultadoRecebimento.tmp');
      memResult.Lines.LoadFromFile('c:\planus\temp\ResultadoRecebimento.tmp');
      deletefile('c:\planus\temp\ResultadoRecebimento.tmp');

      TBlobField(SP_PROC.FieldByName('Ocorrencias')).SaREveToFile('c:\planus\temp\OcorrenciasRecebimento.tmp');
      memErro.Lines.LoadFromFile('c:\planus\temp\OcorrenciasRecebimento.tmp');
      deletefile('c:\planus\temp\OcorrenciasRecebimento.tmp'); }
      frmAguarde.pbAguarde.Position:=5;
      if  (SP_PROC.ParamByName('pErro').AsInteger > 0) then begin
             MsgDlg((SP_PROC.ParamByName('pmsgerro').AsString),'Atenção',mtError, [mbOk], 0);
      end;
      frmAguarde.pbAguarde.Position:=10;
      frmAguarde.Close;
      frmExecRecebimento.Enabled := True;
   finally
     SP_PROC.Close;
   end;
   //HIGOR NAYDE FERREIRA SOL 180837/14327 KINTANA 1989635
end;

procedure TfrmExecRecebimento.edtDataEfetivaIniChange(Sender: TObject);
begin
  inherited;
          datainicio :=  edtDataEfetivaIni.Text;
end;

procedure TfrmExecRecebimento.edtDataEfetivaFimChange(Sender: TObject);
begin
  inherited;
  datafim :=  edtDataEfetivaFim.Text;
end;

function TfrmExecRecebimento.Meses : Integer;
begin
   //HIGOR NAYDE FERREIRA SOL 180837/14327 KINTANA 1989635
    if (trim(cboMes.Text) = 'Janeiro') then
        vMes := 1;
    if (trim(cboMes.Text) = 'Fevereiro') then
       vMes := 2;
    if (trim(cboMes.Text) = 'Março') then
       vMes := 3;
    if (trim(cboMes.Text) = 'Abril') then
       vMes := 4;
    if (trim(cboMes.Text) = 'Maio') then
       vMes := 5;
    if (trim(cboMes.Text) = 'Junho') then
       vMes := 6;
    if (trim(cboMes.Text) = 'Julho') then
       vMes := 7;
    if (trim(cboMes.Text) = 'Agosto') then
       vMes := 8;
    if (trim(cboMes.Text) = 'Setembro') then
       vMes := 9;
    if (trim(cboMes.Text) = 'Outubro') then
       vMes := 10;
    if (trim(cboMes.Text) = 'Novembro') then
       vMes := 11;
    if (trim(cboMes.Text) = 'Dezembro') then
       vMes := 12;
   Result := vMes;
   //HIGOR NAYDE FERREIRA SOL 180837/14327 KINTANA 1989635
end;

procedure TfrmExecRecebimento.btnVoltarClick(Sender: TObject);
begin
   inherited;
   memResult.Clear;
   memErro.Clear;
end;

procedure TfrmExecRecebimento.chkCaRClick(Sender: TObject);
begin
  inherited;
   //Leandro Pocebon - SIG129599 - 14/12/2022 - Inicio
   if gbFormaRecDif.Enabled then begin
     DBcboFormaRecebimento.Enabled := chkCar.Checked;
     btnAtribuiParametro.Enabled   := chkCar.Checked;
     btnLimpaFormaRecebimento.Enabled   := chkCar.Checked;
   end;
   //Leandro Pocebon - SIG129599 - 14/12/2022 - Fim
end;

procedure TfrmExecRecebimento.btnAtribuiParametroClick(Sender: TObject);
begin
  inherited;
   //Leandro Pocebon - SIG129599 - 14/12/2022 - Inicio
   DBcboFormaRecebimento.LookupValue := IntToStr(dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsInteger);
   //Leandro Pocebon - SIG129599 - 14/12/2022 - Fim
end;

procedure TfrmExecRecebimento.molContratoEmptmobtnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnLimpaContratoClick(Sender);

end;

procedure TfrmExecRecebimento.molMutuariobtnLimpaPartClick(
  Sender: TObject);
begin
  inherited;
  molMutuario.btnLimpaPartClick(Sender);

end;

procedure TfrmExecRecebimento.btnLimpaFormaRecebimentoClick(
  Sender: TObject);
begin
  inherited;
  //Leandro Pocebon - SIG129599 - 14/12/2022 - Inicio
  DBcboFormaRecebimento.LookupValue := '';
  //Leandro Pocebon - SIG129599 - 14/12/2022 - Fim
end;

end.
