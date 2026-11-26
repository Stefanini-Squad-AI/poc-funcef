// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//***************************************************************************************
//Nº WO......: ORACLE
//Data.......: 10/06/2025
//Responsável: Leandro Pocebon
//Descrição..: Correção Oracle.
//***************************************************************************************************
// Rotina    : (dfm chkETL, tbsExecETL)
// Autor(a)  : Edilaine
// Data      : 04/08/2025
// Pendencia : WO24218
// Alteração : Habilitar a execução da Previa via ETL
//--------------------------------------------------------------------------------------------------
// Alteração : ExecutaPrevia
// Nº WO.....: 20725
// Autor(a)  : Leandro Pocebon
// Data      : 02/05/2025
// Alteração : Considerar o Tipo de Opcao de IR parametrizado par ao Beneficiario
//--------------------------------------------------------------------------------------------------
//Alteração  : BtnAtualizaNumDep
//Atender....: WO21835    
//Data.......: 13/05/2025
//Responsável: Luis Ferrari
//Descrição..: criar e destruir dtmFolhaPrevia e dtmContabil.
//--------------------------------------------------------------------------------------------------
// Rotina    : (dfm) bbtnPreparoClick, ExecutaPrevia
// Autor(a)  : Edilaine
// Data      : 11/03/2025
// Pendencia : WO19556
// Alteração : Refatoraçao do processo da previa e criação de mecanismo para automatizar tratamento
//             das listas de execução
//             - criação de objetos usando nil
//             - criar e destruir dtmFolhaPrevia e dtmContabil a cada lista processada
//             - uso de try..finally em toda criação de objeto para liberação
//             - substituição de .free por freeAndNil
//             - eliminar criaçãdo do dtmFolhaPrevia do dpr
//--------------------------------------------------------------------------------------------------
// Rotina    : bbtnPreparoClick
// Autor(a)  : Edilaine
// Data      : 07/07/2023
// Pendencia : 136670
// Alteração : Criação parametros para Desconto Simplificado MP 1171
//--------------------------------------------------------------------------------------------------
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 136844
//Data.......: 02/03/2022
//Responsável: Andre Imakawa
//Descrição..: Exibir a propriedade ClassName na exceção.
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 115439
//Data.......: 02/03/2022
//Responsável: Andre Imakawa
//Descrição..: Remover tratamento do FLGISENTOIRRF quando for Resgate.
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: SIG71773 (SOL247533-18324)
//Data.......: 26/03/2017
//Responsável: Edilaine
//Descrição..: Gravação dos parametros RUBRICAIRTOTAL, RUBRICAIRTOTALPARC e RUBRICAIRTOTALCOMP
//***************************************************************************************************
//Alteração  : Add Campo Query
//Nº SIG.....: 26149
//Data.......: 24/05/2021
//Responsável: Andre Imakawa
//Descrição..: Ajuste no cálculo do IR Regressivo para Resgate parcelado.
//***************************************************************************************************
//Alteração  : Monitoramento e GravaLog
//Nº SIG.....: 102321
//Data.......: 15/09/2020
//Responsável: Andre Imakawa
//Descrição..: Criação da propriedade MAQUINA
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 100935
//Data.......: 10/07/2020
//Responsável: Andre Imakawa
//Descrição..: Tratamento para ALIAS diferente de PRODUCAO.
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 99499
//Data.......: 20/03/2020
//Responsável: Andre Imakawa
//Descrição..: Verifica se parametros da folha foram cadastrados(Abono)
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 99272
//Data.......: 30/03/2020
//Responsável: Andre Imakawa
//Descrição..: Verifica se parametros da folha foram cadastrados
//***************************************************************************************************
//Alteração  : VerificaDuplicidadeLotes
//Nº SIG.....: 97258
//Data.......: 05/02/2020
//Responsável: Andre Imakawa
//Descrição..: Rotina Duplicidade de Lotes não está apagando o lote de Concessão.
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 87467
//Data.......: 21/06/2019
//Responsável: Andre Imakawa
//Descrição..: Valida se usuário esta com bloqueio na folha
//***************************************************************************************************
//Alteração  : ExecutaPerfil e bbtnPreparoClick
//Nº SIG.....: 87202
//Data.......: 21/05/2019
//Responsável: Andre Imakawa
//Descrição..: Quando execução da previa geral, perfil de investimento deve ser executado no final.

//***************************************************************************************************
//Alteração  : bbtnDesfazPreparoClick
//Nº SIG.....: 84221
//Data.......: 30/05/2019
//Responsável: Andre Imakawa
//Descrição..: Não abrir transação.S
//***************************************************************************************************
//Alteração  : bbtnPreparoClick, BtnApagaPreviaClick e bbtnDesfazPreparoClick
//Nº SIG.....: 85168
//Data.......: 10/04/2019
//Responsável: Andre Imakawa
//Descrição..: Apagar o idusuario das listas com o FLGTIPOLISTA = 3
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 83696
//Data.......: 25/03/2019
//Responsável: Andre Imakawa
//Descrição..: icont
//***************************************************************************************************
//Rotina     : Monitoramento
//Data       : 25/02/2019
//SIG        : 82710
//Autor      : Andre Imakawa
//Descrição  : Monitoramento
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 60759
//Data.......: 20/08/2018
//Responsável: Andre Imakawa
//Descrição..: Verifica se Beneficio está isento.
//***************************************************************************************************
// Data       : 05/02/2019
// SIG        : 81798
// Autor      : Andre Imakawa
// Descrição  : Recompilação
//***************************************************************************************************
//Alteração  : Monitoramento e bbtnPreparoClick
//Nº SIG.....: 81948
//Data.......: 07/02/2019
//Responsável: Andre Imakawa
//Descrição..: Monitoramento e PGA
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 79508
//Data.......: 20/12/2018
//Responsável: Edilaine
//Descrição..: Utilizar lista fracionada para geração da Previa.
//***************************************************************************************************
//Alteração  : ResolveRubrica
//Nº SIG.....: 80669
//Data.......: 13/01/2019
//Responsável: Andre Imakawa
//Descrição..: Tratamento caso ocorra erro no insert da previa
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 78703/78056
//Data.......: 28/11/2018
//Responsável: Andre Imakawa
//Descrição..: Utilizar lista fracionada para geração da Previa.
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 77851
//Data.......: 05/11/2018
//Responsável: Andre Imakawa
//Descrição..: Não esperar retorno do ETL para rotina do Perfil de Investimento.
//***************************************************************************************************
//Alteração  : bbtnPreparoClick
//Nº SIG.....: SIG TIBERO
//Data.......: 15/10/2018
//Responsável: Andre Imakawa
//Descrição..: Correção Tibero.
//***************************************************************************************************
//Alteração  : AtualizaPreviBenefETL, VerificaPreviBenefETL, RetornaDiretorioETL e
//             bbtnPreparoClick
//Nº SIG.....: 74538
//Data.......: 03/09/2018
//Responsável: Andre Imakawa
//Descrição..: Perfil de Investimento gerado através do ETL.
//---------------------------------------------------------------------------------------------------
//Nº SIG.....: SIG TIBERO
//Data.......: 21/02/2018
//Responsável: Everson Luiz Pereira da Cunha
//Descrição..: Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//             Retirada de INDEX, +rule etc.
//             Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 54393
//Data.......: 12/09/2017
//Responsável: Andre Imakawa
//Descrição..: Correção para gravar quantidade de rubricas processadas corretamente
//---------------------------------------------------------------------------------------------------
//Alteração  : BtnApagaPreviaClick
//Nº SIG.....: 34175
//Data.......: 07/12/2016
//Responsável: Andre Imakawa
//Descrição..: Apagar Previa por lista individual
//---------------------------------------------------------------------------------------------------
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 28402
//Data.......: 26/08/2016
//Responsável: Andre Imakawa
//Descrição..: Gravação do Log na base de dados.
//---------------------------------------------------------------------------------------------------
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 25700
//Data.......: 22/07/2016
//Responsável: Andre Imakawa
//Descrição..: Ajustar a rotina de prévia, pois a rotina calculou o IR (REGRESSIVO) para uma rubrica
//             de portabilidade indevidamente. O sistema não deve calcular nenhum tipo de IR para
//             benefícios/rubricas deste tipo.
//---------------------------------------------------------------------------------------------------
//Alteração  : bbtnPreparoClick
//Nº SIG.....: 21958
//Data.......: 02/06/2016
//Responsável: Fernando Xavier
//Descrição..: Sistema não realiza o correto abatimento do histórico de contribuições com bitributção
//             para dependentes conforme prevê a IN 1495.
//---------------------------------------------------------------------------------------------------
// Autor(a)    : Higor Nayde
// Pendência   : SOL 242624/17054 Kintana 715180
// Data        : 20/04/2015
// Descricao   : Ajuste para passar a aceitar dependente.
//---------------------------------------------------------------------------------------------------
//Nº SOL............: 251048.17830     
//Nº PPM............: 1115143
//Data da Alteração.: 30/10/2015
//Alteração Form....: Inclusão de campos e nova tabela na query da Prévia
//Responsável.......: William Santana
//Descrição.........: Inclusão de campos e nova tabela na query da Prévia
//**************************************************************************************************
//Pendência   : SOL 258357/17801 PPM 1083052  
//Responsável : Felipe A. Santos
//Data        : 27/10/2015
//Descrição   : Mudança de escopo na forma de identificar as rubricas de RRA provento e IRRF RRA.
//**************************************************************************************************
//Pendência   : SOL 261281 PPM 1065000
//Responsável : Fernando Xavier
//Data        : 28/09/2015
//Descrição   : Otimizar a query com foco em performance
//**************************************************************************************************
//Pendência   : SOL 252343/17434 PPM 874741
//Responsável : Fernando Xavier
//Data        : 26/06/2015
//Descrição   : Stored Procedure para o geração da estrutura de cálculos
//--------------------------------------------------------------------------------
//Pendência   : SOL 249101-17085 PPM 736484
//Responsável : Helio Lima Custodio
//Data        : 15/04/2015
//Descrição   : Rotina Botão Desfazer Prévia
//--------------------------------------------------------------------------------
//Pendência   : SOL 251667 PPM 749703
//Responsável : Fernando Xavier
//Data        : 05/05/2015
//Descrição   : Melhoria de performance do fonte da rotina que gera o SEQINTERNOFB na Folha de Benefícios
//--------------------------------------------------------------------------------
//Pendência   : SOL 252347 KINTANA 755091
//Responsável : BRUNO AZEVEDO
//Data        : 22/04/2015
//Descrição   : VERIFICAR SE A PESSOA DA RUBRICA ATUAL TEM RRA MESMO
//              TIRAMOS TODA PARTE DE RUBRICA INDIVIDUAL DESTA QUERY, VISTO QUE A RUBRICA INDIVIDUAL JÁ É LANÇADA COMO RRA
// *************************************************************************************************
//Pendência   : SOL 251642 PPM 741033
//Responsável : Fernando Xavier
//Data        : 10/04/2015
//Descrição   : Identificamos que para alguns assistidos que possuem pagamento de
//              IN1343 não está sendo lançada a rubrica de dependentes de IR no
//              calculo da previa. Exemplo 0182774.
//--------------------------------------------------------------------------------
//Pendência   : SOL 242740 PPM 575822
//Responsável : Fernando Xavier
//Data        : 06/03/2015
//Descrição   : Queda de performance do processamento da prévia
//--------------------------------------------------------------------------------
//Pendência   : SOL 248569 PPM 669718
//Responsável : Fernando Xavier
//Data        : 11/02/2015
//DFM         : Botão BtnAtualizaNumDep e barra de progresso PBPrevia
//Descrição   : Alteração na rotina de processamento da atualização dos dependentes
//              para imposto de renda.
//--------------------------------------------------------------------------------
//Pendência   : SOL 242846 PPM 579506
//Responsável : Fernando Xavier
//Data        : 22/01/2015
//Descrição   : Sistema apresenta lentidão ao reprocessar prévia.
//--------------------------------------------------------------------------------
//Pendência   : SOL 205224/15237 - KTN 2048156
//Responsável : Douglas Siqueira
//Data        : 04/11/2013
//Descrição   : Atividade aberta para recebimento do produto do ajuste do 13º dos idosos e do manual de histórico de benefícios - atividade 15007.
//**************************************************************************************************
//Pendência   : SOL 215766 - KTN 2044856
//Responsável : FERNANDO XAVIER
//Data        : 04/08/2013
//Descrição   : Travamento gerado pelo módulo Folha de Benefícios
//------------------------------------------------------------------------------
//Pendência   : SOL 214520 - KTN 2042434
//Responsável : FERNANDO XAVIER
//Data        : 19/08/2013
//Descrição   : ERRO CALCULO IR FOLHA DE BENEFICIO
//------------------------------------------------------------------------------
//Pendência   : SOL 205224
//Responsável : douglas.siqueira
//Descrição   : IN1343 .
//**************************************************************************************************
// -----------------------------------------------------------------------------
//Pendência   : SOL 212974 - KTN 2039971
//Responsável : FERNANDO XAVIER
//Data        : 06/08/2013
//Descrição   : não lança rubricas de INSS no mês final de moléstia grave
//------------------------------------------------------------------------------
//Pendência   : SOL 200541 KTN 1932929
//Responsável : Felipe A. Santos
//Data        : 20/02/2013
//Descrição   : correção do tempo de processamento
//--------------------------------------------------------------------------------
//Pendência   : SOL 191996 KINTANA 1820068
//Responsável : Fernando Xavier
//Data        : 08/10/2012
//Descrição   : ERRO PREVIA BENEFICIO/RESGATE
//--------------------------------------------------------------------------------
//Pendência   : SOL 63067 - KTN 524520
//Responsável : FERNANDO XAVIER
//Data        : 12/01/2012
//Descrição   : Cadastro Previdenciário - Resgate de Contribuições
//--------------------------------------------------------------------------------
//Pendência   : SOL 165198 KINTANA 
//Responsável : BRUNO AZEVEDO E MARCOS MEROLA
//Data        : 07/10/2011
//Descrição   : Ajuste no processamento de resgate.
// -----------------------------------------------------------------------------
//Pendência   : SOL 164085 KINTANA 1406577
//Responsável : BRUNO AZEVEDO
//Data        : 30/08/2011
//Descrição   : Ajuste no processamento de resgate.
//------------------------------------------------------------------------------
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Reembolso INSS .
// -----------------------------------------------------------------------------
//Pendência   : SOL 163247 KINTANA 1392627
//Responsável : BRUNO AZEVEDO
//Data        : 15/08/2011
//Descrição   : Ajuste no caminho do log gerado.
//------------------------------------------------------------------------------
//Pendência   : SOL 147218 KINTANA 1015910
//Responsável : BRUNO AZEVEDO
//Data        : 08/11/2010
//Descrição   : Na opção "Folha de Resgate" acrescentar "/Portabilidade" na Prévia e Efetivação.
//--------------------------------------------------------------------------------
//Pendência   : SOL 145174 KINTANA 966401
//Responsável : BRUNO AZEVEDO
//Data        : 04/10/2010
//Descrição   : Ajuste no Check para folha de resgate.
//--------------------------------------------------------------------------------
//Pendência   : SOL 138157 Kintana 840763
//Responsável : Renato Visoni
//Data        : 26/07/2010
//Descrição   : Rodar a previa para folha de Resgate.
//--------------------------------------------------------------------------------
//Pendência   : SOL 141256 Kintana 894087
//Responsável : Renato Visoni
//Data        : 10/08/2010
//Descrição   : Na geração da Previa, os assistidos que possuem lançamentos
//              em dois lotes distintos devem ser agrupados para o lote de manuntenção
//--------------------------------------------------------------------------------
//Pendência   : SOL 140974 KINTANA 889580
//Responsável : BRUNO AZEVEDO
//Data        : 05/08/2010
//Descrição   : Correção na atualização de Dependentes. Salvar Previa\Efet\Preparo na rede.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136627 KINTANA 820014
//Responsável : BRUNO AZEVEDO
//Data        : 28/05/2010
//Descrição   : Após a prévia, Atualizar o valor total e número de registros.
//--------------------------------------------------------------------------------
// Autor(a)    : Thiago Passos
// Data        : 11/02/2010
// Rotina      : VerificaDuplicidadeLotes
// Pendência   : SOL 130584 Kintana 735206
// Descricao   :Incluir os lotes selecionados nas querys para não agrupar Pessoas
//              de lotes não selecionados para processamento
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 16/11/2009
// Rotina      : VerificaDuplicidadeLotes
// Pendência   : SOL 127182 Kintana 671855
// Descricao   :Identificamos assistidos que estão em 2 planos contabeis e recebem
// devolução de contribuição/Taxa adm referente ao adiantamento do 13º salário.
// Para esses assistidos na devolução somou-se os 2 valores e lançou cada valor
// somado em um plano, ficando assim com a devolução incorreta.
//------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
// Autor(a)    : Renato Visoni
// Data        : 18/02/2009
// Rotina      : VerificaDuplicidadeLotes
// Pendência   : SOL 109546 KINTANA 496984
// Descricao   : Estava ocorrendo o erro "Nome de Coluna inválido" na execução da PREVIA pois
//               a Tabela Beneficio não estava sendo selecionada.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 14/07/2008
// Rotina      : VerificaDuplicidadeLotes
// Pendência   : 98253
// Descricao   : Não considerar os registros cuja o tipo de beneficio seja diferente 6.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 07/11/2008
// Rotina      : ProcessaAtualizacao
// Pendência   : 100080_443326
// Descricao   : Na geração da Prévia da Folha de resgate, o sistema está
//               fazendo UPDATE para alteração do Lote corretamente.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 14/07/2008
// Rotina      : VerificaDuplicidadeLotes
// Pendência   : 90146_379434
// Descricao   : Agrupar no lote de manutenção caso possua mais de um lote.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 25/09/2007
// Rotina      : bbtnPreparoClick
// Pendência   : 19378
// Descricao   : Implementação da utilização da data de previsão de pagamento.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 13/09/2007
// Rotina      : bbtnPreparoClick
// Pendência   : 14004
// Descricao   : Continuar a previa do momento onde foi interompido
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 03/05/2007
// Rotina      : Diversas
// Pendência   : 21962
// Descricao   : Controlar o pagamento de beneficio de portabilidade para favorecidos EPP
//----------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 16/01/2007
// Rotina      : Diversas
// Pendência   : 21808
// Descricao   : Tratar máscara de data do windows na construção da data de pa-
//   gamento para execução da Prévia.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 20/09/2006
// Rotina      : Diversas
// Pendência   : 23361
// Descricao   : Retirar RULE de consultas.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/09/2006
// Rotina      : VerificaDuplicidadeLotes
// Pendência   : 23343
// Descricao   : Tratar duplicidade de lotes para grupo familiar agrupando por responsavel.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 31/05/2006
// Rotina      : bbtnPreparoClick
// Pendência   : 22070
// Descricao   : Trocar a palavra parcial para total
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 26.01.2006
// Rotina      : Consulta para Prévia
// Pendência   : 16608
// Descricao   : Atribuição de rubricas pelo tipo do registro na Hstbenefbfciario
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/01/2006
// Rotina      : Várias, controle do tempo
// Pendência   : 20914
// Descricao   : Alteração exibição dos tempos do processo, pois a rotina
//               TempoDecorrido retorna em branco quando o processo se inicia
//               num dia e termina no seguinte.
//------------------------------------------------------------------------------
Unit FFolhaNormalPrevia;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Spin, Db,
   DBTables, Wwquery, ComCtrls, checklst, Gauges,
   TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, IvDictio, IvMulti,
   IvEMulti, MontaSelect, DBGrids, wwdbdatetimepicker, CMDateTimePicker,
   UobjFolha, DBCtrls, uDesfazerPreparo, uReajustaPercPensao, fFrameLista,
   dContabil, dFolhaPrevia,
   uconstfolha, wwstorep, uCmfileUtils, Mask, Provider, DBClient;//SOL205224 douglas.siqueira

Type
   TfrmFolhaNormalPrevia = Class(TfrmOkCancelar)
      Panel2: TPanel;
      qryAux1: TwwQuery;
      SaveDlg: TSaveDialog;
      grpMesRef: TGroupBox;
      cmbMes: TComboBox;
      spnedAno: TSpinEdit;
      GroupBox2: TGroupBox;
      updPreparos: TUpdateSQL;
      qryPreparosAnt: TwwQuery;
      dsPreparosAnt: TwwDataSource;
      pgctrlOpcoes: TPageControl;
      tbsPreparos: TTabSheet;
      pnlTabSheet3: TPanel;
      dbgrdPreparosAnt: TwwDBGrid;
      tbsResultado: TTabSheet;
      pnlTabSheet4: TPanel;
      grpProcessar: TGroupBox;
      chkConcessao: TCheckBox;
      chkManutencao: TCheckBox;
      tbsIndividual: TTabSheet;
      qryAux2: TwwQuery;
      Panel1: TPanel;
      btnInverte: TBitBtn;
      chkAbono: TCheckBox;
      edDataFolha: TCMDateTimePicker;
      bbtnDesfazPreparo: TBitBtn;
      Panel5: TPanel;
      memResult: TMemo;
      PnlProgress: TPanel;
      qryUpdateHst: TwwQuery;
      bbtnPreparo: TBitBtn;
      bbtnOutro: TBitBtn;
      ToolbarSep972: TToolbarSep97;
      ToolbarSep973: TToolbarSep97;
      qryPreparosAntIDLOTE: TFloatField;
      qryPreparosAntFLGIDATMP: TFloatField;
      qryPreparosAntJAPROC: TStringField;
      qryPreparosAntDATAPAGAMENTO: TDateTimeField;
      qryPreparosAntTIPO: TStringField;
      qryPreparosAntFLGPREPARADO: TFloatField;
      qryPreparosAntFLGTIPOFOLHA: TFloatField;
      qryPreparosAntFLGCONCESSAO: TFloatField;
      qryPreparosAntDESCRTIPOFOLHA: TStringField;
      qryPreparosAntQTREGS: TFloatField;
      qryPreparosAntMESREFERENCIA: TStringField;
      qryPreparosAntDESCRICAO: TStringField;
      qryPreparosAntFLGENVIAR: TFloatField;
      qryPreparosAntVLRTOTAL: TFloatField;
      dbrgAtualiza: TDBRadioGroup;
      frameBenef: TfrmFrameListaBenef;
      cboxIndividual: TCheckBox;
      qryAux3: TwwQuery;
      Panel3: TPanel;
      Label5: TLabel;
      Mensagem: TLabel;
      lblContagem: TLabel;
      bbtnSalvar: TBitBtn;
      ToolbarSep974: TToolbarSep97;
      chkUsaPrevisaoPagto: TCheckBox;
    chkResgate: TCheckBox;
    BtnAtualizaNumDep: TBitBtn; // SOL 248569 PPM 669718
    PBPrevia: TProgressBar;  // SOL 242740 PPM 575822
    ChkPreviaGeral: TCheckBox; // SOL 242740 PPM 575822
    BtnApagaPrevia: TBitBtn;// SOL 248569 PPM 669718
    qrylog: TwwQuery; // Andre Imakawa - SIG 28402
    grpdividelista: TGroupBox; // Andre Imakawa - SIG 78703
    chkDivideLista: TCheckBox; // Andre Imakawa - SIG 78703
    speDivideLista: TSpinEdit; // Andre Imakawa - SIG 78703
    chkapagaprevia: TCheckBox; // Andre Imakawa - SIG 78703
    qryControle: TwwQuery;
    chkModoAuto: TCheckBox;
    qryModoAuto: TwwQuery;
    chkETL: TCheckBox;
    qryConsulta: TwwQuery;
    tbsETL: TTabSheet;
    pnlExecETL: TPanel;
    dbgrdExecETL: TwwDBGrid;
    qryExecETL: TwwQuery;
    dsExecETL: TDataSource;
    btnRefresh: TBitBtn;

      Procedure bbtnProcessarClick(Sender: TObject);
      Procedure bbtnSalvarClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure cmbMesChange(Sender: TObject);
      Procedure spnedAnoChange(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure grpMesRefEnter(Sender: TObject);
      Procedure bbtnDesfazPreparoClick(Sender: TObject);
      Procedure chkProcessarClick(Sender: TObject);
      Procedure btnInverteClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure cmbMesExit(Sender: TObject);
      Procedure spnedAnoExit(Sender: TObject);
      Procedure dbgrdPreparosAntCalcCellColors(Sender: TObject;
         Field: TField; State: TGridDrawState; Highlight: Boolean;
         AFont: TFont; ABrush: TBrush);
      Procedure bbtnPreparoClick(Sender: TObject);
      Procedure cboxIndividualClick(Sender: TObject);
    procedure chkResgateClick(Sender: TObject);
	procedure chkResgateParceladoClick(Sender: TObject);
    procedure BtnAtualizaNumDepClick(Sender: TObject); // SOL 248569 PPM 669718
    procedure BtnApagaPreviaClick(Sender: TObject);
    procedure ChkPreviaGeralClick(Sender: TObject);   // SOL 242740 PPM 575822
    procedure chkDivideListaClick(Sender: TObject);   // Andre Imakawa - SIG 78703
    procedure Monitoramento(pRotina:String; ptipo: Integer; pErro:String=''); // Andre Imakawa - SIG 81948
    procedure chkModoAutoClick(Sender: TObject);
    procedure chkETLClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
   Private
      { Private declarations }
      bglobalErro, PrimeiraVez: boolean;
      sTodasPessoas, sMesAbono, sMesCobranca, sMesPagamento: String;
      wHora, wMin, wSeg, wMSeg: word;

      sIdExecucaoETL : string;      //edilaine WO24218
      iIdProcessoETL : integer;     //edilaine WO24218


      //BRUNO AZEVEDO - SOL 252347 KINTANA 755091 - PROJETO DE MELHORIA DA FOLHA
      //MUDEI A VARIÁVEL DE PRIVATE PARA PUBLICA, POIS VOU UTILIZAR NO DTMFOLHAPREVIA
      //sLotesSelecionados: String;
      //BRUNO AZEVEDO - SOL 252347 KINTANA 755091 - PROJETO DE MELHORIA DA FOLHA
      Procedure MontaQueryLotes;
      Procedure VerificaDuplicidadeLotes;
      function  InserePreviBenef(iIdTipoPreviaBenef: Integer):Double;// SOL 252343/17434 PPM 874741
      Procedure InsereLotePreviBenef(pidPreviaBenef: Double; pIdLote: Integer);// SOL 252343/17434 PPM 874741
      Procedure AtualizaPreviBenef(pidPreviaBenef: Double);// SOL 252343/17434 PPM 874741
      Procedure AtualizaPreviBenefETL(pidPreviaBenef: Double);                 // Andre Imakawa - SIG 74538
      Function VerificaPreviBenefETL(pidPreviaBenef: Double = 0): Integer;   overload;       // Andre Imakawa - SIG 74538    //edilaine WO24218
      //function RetornaDiretorioETL(var pDiretorio: string; var pTimeRepeat, pTimeAbort: Integer): Integer;       // Andre Imakawa - SIG 74538 // Andre Imakawa - SIG 82710
      procedure VerificaParametrizacaoRRAIRRF; // Felipe A. Santos - SOL 258357/17801 PPM 1083052
      Procedure ExecutaPerfil; // Andre Imakawa - SIG 87202
      Procedure ExecutaPrevia;      //edilaine WO19556
      Procedure ModoAutomatico(bMarcarItens : boolean);       //edilaine WO19556
      Procedure MarcarLotes;                                  //edilaine WO19556

      //edilaine WO24218 : inicio
      Function  ProcessaPreviaETL : boolean;
      function  RetornaDiretorioETL(pFuncionalidade, pRotina: String;
                                    var pDiretorio: string; var pTimeRepeat, pTimeAbort: Integer): Integer;
      Function  InsereControleETL_Previa(pIdPreviaBenef : double) : boolean;
      function  CriaArquivosParamETL(sDiretorio, sFiltro : string; iIdRotina : integer; lUsaDePara : boolean = true) : boolean;
      Function  VerificaPreviBenefETL(pidPreviaBenef: Double; var piEtapa : integer): Integer;  overload;   //edilaine WO24218
      //edilaine WO24218 : fim

   Public
      dtmContabilPrevia : TdtmContabil;                //edilaine WO19556
      dtmFolhaPrevia    : TdtmFolhaPrevia;             //edilaine WO19556

      lstINTitular         : tstringlist; //SIG21958
      lstINDependentes     : tstringlist; //SIG21958

      iflgconcessao, iidlote: integer;
      dtDataPagamento: TDateTime;
      sUltMespreparo: String;
      //BRUNO AZEVEDO - SOL 252347 KINTANA 755091 - PROJETO DE MELHORIA DA FOLHA
      //MUDEI A VARIÁVEL DE PRIVATE PARA PUBLICA, POIS VOU UTILIZAR NO DTMFOLHAPREVIA
      sLotesSelecionados: String;
      iIdPreviaBenef: double; // SOL 252343/17434 PPM 874741 //SOL 261281 PPM 1065000 passado a variavel de private para global
      //BRUNO AZEVEDO - SOL 252347 KINTANA 755091 - PROJETO DE MELHORIA DA FOLHA

      bErroMemory: Boolean; // Andre Imakawa - SIG 81948
      IdExec: Integer;	    // Andre Imakawa - SIG 81948

      Procedure AtualizaSeqInterno(aqryaux1, aqryaux2: twwquery; astabela: String);
      Procedure GravaLog(aqryaux2: twwquery); // Andre Imakawa - SIG 28402

      Function ExecEstruturaCalculo(mescobranca: String):Integer; // SOL 252343/17434 PPM 874741

      // Andre Imakawa - SIG 78703 - Inicio
      Function IncluirNovaLista(aNome: String): Integer;
      procedure IncluiPessoaListaporListagem(var aidlista: Integer; aIdExecPrevia, aIdListaOrigem, aTotalLinhas: integer;
                                                             aLimitador: Boolean );
      Procedure AtualizaIdUsuarioListaBenef(pIdLista, pValor, pIdUsuario: String);

      Procedure AtualizaPreviaControle(pIdSeqExecPrevia, pIdListaOrigem, pIdListaClone, pIdPreviaBenef,
                                                       pFlgProcessado: String);
      Procedure VerificaDivideLista;                                                       
      // Andre Imakawa - SIG 78703 - Fim

   End;

Var
   frmFolhaNormalPrevia: TfrmFolhaNormalPrevia;

Implementation

Uses
   UMensErro, UDataBase, UAdmPrevFB, DBaseDados,
   USistema, UAutorizacao, UModulo,
   UFuncoesUteisFB, UFuncoesFolha, FMotivoDesFazPreparo, dFolha,
   UFuncoesUteis, uFuncaoGeral;    //edilaine - SIG79508
   
{$R *.DFM}

Procedure TfrmFolhaNormalPrevia.FormCreate(Sender: TObject);
Begin
   //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
   SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

   //edilaine WO19556 : inicio
   //Application.CreateForm(TdtmFolhaPrevia, dtmFolhaPrevia);
   //dtmfolhaprevia.mmemo := memResult;
   // dtmfolhaprevia.lblmsg := lblContagem;
   //edilaine WO19556 : fim

   cboxIndividual.checked := false;
   cboxIndividualClick(sender);

End;

Procedure TfrmFolhaNormalPrevia.FormDestroy(Sender: TObject);
Begin
   //dtmFolhaPrevia.free;          //edilaine WO19556
   Inherited;
End;

Procedure TfrmFolhaNormalPrevia.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Inherited;
   With dtmBasedados.dbBaseDados Do
      If InTransaction Then
      begin
         RollBack;
      end;
End;

Procedure TfrmFolhaNormalPrevia.bbtnSalvarClick(Sender: TObject);
Begin
   Inherited;
   If savedlg.Execute Then
      memResult.Lines.SaveToFile(savedlg.filename);
End;

Procedure TfrmFolhaNormalPrevia.cmbMesChange(Sender: TObject);
Var sAnoAux, sMesAux, sDataFolha: String;
   dt: tdatetime;
Begin
   Inherited;
   sAnoAux := spnedAno.Text;
   If cmbMes.ItemIndex <= 8 Then
      sMesAux := '0' + IntToStr(cmbMes.ItemIndex + 1)
   Else
      Begin
         If cmbMes.ItemIndex <> 12 Then
            sMesAux := IntToStr(cmbMes.ItemIndex + 1)
         Else
            sMesAux := '12';
      End;
   sMesPagamento := sAnoAux + '/' + sMesAux;
   sDataFolha := AtualizaDataFolha(sMesAux, sAnoAux);
   If sDataFolha <> '' Then
      Begin
         dt := strtodatetime(sdatafolha);
         edDataFolha.date := dt;
      End
   Else
      Begin
         MsgDlg('Erro na Data de Pagamento da Folha de Benefícios. Consulte o Cadastro de Fundação', 'Erro', mtError, [mbOk, mbHelp], 0);
         Exit;
      End;
   dtDataPagamento := strtodatetime(sDataFolha);
End;

Procedure TfrmFolhaNormalPrevia.spnedAnoChange(Sender: TObject);
Var sAnoAux, sMesAux, sDataFolha: String;
   dt: tdatetime;
Begin
   Inherited;
   sAnoAux := spnedAno.Text;
   If cmbMes.ItemIndex <= 8 Then
      sMesAux := '0' + IntToStr(cmbMes.ItemIndex + 1)
   Else
      If cmbMes.ItemIndex <> 12 Then
         sMesAux := IntToStr(cmbMes.ItemIndex + 1)
      Else
         sMesAux := '12';
   sMesPagamento := sAnoAux + '/' + sMesAux;
   sDataFolha := AtualizaDataFolha(sMesAux, sAnoAux);
   If sDataFolha <> '' Then
      Begin
         dt := strtodatetime(sdatafolha);
         edDataFolha.date := dt;
      End
   Else
      Begin
         MsgDlg('Erro na Data de Pagamento da Folha de Benefícios. Consulte o Cadastro de Fundação', 'Erro', mtError, [mbOk, mbHelp], 0);
         Exit;
      End;
   dtDataPagamento := strtodatetime(sDataFolha);
   MontaQueryLotes;
End;

Procedure TfrmFolhaNormalPrevia.MontaQueryLotes;
Var stipos, ssql, sAno, sMes: String;
   ProcFolhaConcessao, ProcFolhaManutencao, ProcFolhaAbono: boolean;
   ProcResgate : Boolean; //Renato Visoni SOL 138157 Kintana 840763
Begin
   ProcFolhaConcessao := chkConcessao.Checked;
   ProcFolhaManutencao := chkManutencao.Checked;
   ProcFolhaAbono := chkAbono.Checked;
   ProcResgate    := chkResgate.Checked; //Renato Visoni SOL 138157 Kintana 840763

   sAno := Trim(spnedAno.Text);
   If cmbMes.ItemIndex <= 8 Then
      sMes := '0' + IntToStr(cmbMes.ItemIndex + 1)
   Else
      sMes := IntToStr(cmbMes.ItemIndex + 1);
   sMesCobranca := sAno + '/' + sMes;
   sMesAbono := sAno + '/' + '13';
   With qryPreparosAnt Do
      Begin
         sSQL :=
            'SELECT IDLOTE, FLGTIPOFOLHA, NVL(FLGCONCESSAO,0) AS FLGCONCESSAO, ' +
            'FLGIDATMP, DECODE(FLGIDATMP,1,''Sim'',''Não'') AS JAPROC, ' +
            'DATAPAGAMENTO, TIPO, FLGPREPARADO, ' +
            'DECODE(FLGTIPOFOLHA,1,''Pagto Pendente'',2,''Extra'',3,''Abono'',' +
            '4,''Adiant. Abono'', ' + '5,''Exclusões Efetivação'',' +
            'DECODE(FLGCONCESSAO,1,''Concessão'',''Normal'')) DESCRTIPOFOLHA, ' +
            'NUMREG AS QTREGS, MESREFERENCIA, ' +
            'DESCRICAO, 0 AS FLGENVIAR, ROUND(VLRTOTAL,2) AS VLRTOTAL ' +
            'FROM CTRLINTERFACE CI ' +
            'WHERE (FLGPREPARADO = 1) ' +
            'AND (IDPESSOA = ' + inttostr(iidfundacao) + ') ' +
            'AND (FLGVOLTATMP = 0) ' +
            'AND (TIPO = ''B'') ' ;

         //PEGAR SEMPRE LOTES PARA O MÊS SELECIONADO.
         //   OS LOTES EM ABERTO DE MESES ANTERIORES DEVEM SER TRANSFERIDOS PARA O
         //   MÊS ATUAL DE PAGAMENTO ATRAVÉS DE UM PROCESSO A PARTE QUE DEVE SER
         //   ESPECIFICADO.
         If SistemaFolha.FLGTRATALOTEINDEPENDENTE = 1 Then
            ssql := ssql + 'AND (MESREFERENCIA = ' + QuotedStr(sMesCobranca) + ') '
         Else
            ssql := ssql + 'AND (MESREFERENCIA <= ' + QuotedStr(sMesCobranca) + ') ';



         //Renato Visoni SOL 138157 Kintana 840763
         if not ProcResgate then begin
         If ProcFolhaConcessao And Not ProcFolhaManutencao Then
            sSql := sSql + ' AND (FLGCONCESSAO = 1) '
         Else
            If Not (ProcFolhaConcessao And ProcFolhaManutencao) Then
               sSql := sSql + ' AND (FLGCONCESSAO = 0) '
            Else
               sSql := sSql + ' AND (FLGCONCESSAO IN (0,1)) ';
         end;
         //Renato Visoni SOL 138157 Kintana 840763

         stipos := '';

         If ProcFolhaConcessao Or ProcFolhaManutencao Then
            stipos := stipos + '0,5,6,';

         If ProcFolhaAbono Then
            stipos := stipos + '3,4,';

         //Renato Visoni SOL 138157 Kintana 840763
         if chkResgate.Checked then begin
           sSql := sSQL + ' AND ((NVL(FLGRESGATE, 0) = 1) or ((NVL(FLGRESGATE, 0) = 0) and NVL(FLGRESGATEPARCELADO,0) = 1 )) ';
         end else begin
           sSql := sSQL + ' AND (NVL(FLGRESGATE,0) = 0) AND  (NVL(FLGRESGATEPARCELADO,0) = 0)';
         end;
         //Renato Visoni SOL 138157 Kintana 840763

         system.delete(stipos, length(stipos), 1);

         //Renato Visoni SOL 138157 Kintana 840763
         if ProcResgate then begin
           sSql := sSql + 'ORDER BY IDLOTE';
         end else begin
         If ProcFolhaConcessao Or ProcFolhaManutencao Then
            sSql := sSql + 'AND (FLGTIPOFOLHA IN (' + stipos + ') OR FLGTIPOFOLHA IS NULL) ' +
               'ORDER BY IDLOTE'
         Else
            sSql := sSql + 'AND FLGTIPOFOLHA IN (' + stipos + ') ' +
               'ORDER BY IDLOTE';
         end;
         //Renato Visoni SOL 138157 Kintana 840763

         Close;
         Sql.Clear;
         Sql.Add(sSql);
         Open;

         If Not PrimeiraVez And qryPreparosAnt.IsEmpty Then
            MsgDlg('Não existe informação no Mês Referência para a Prévia. Rodar o Preparo. ', 'Erro',
               mtError, [mbOk, mbHelp], 0);
      End;

   //edilaine WO19556 : inicio
   if (chkModoAuto.checked) and (not qryPreparosAnt.IsEmpty) then
      MarcarLotes;
   //edilaine WO19556 : fim

   //edilaine WO24218 : inicio
   qryExecETL.close;
   qryExecETL.Params[0].AsString := sMesCobranca;
   qryExecETL.Open;
   //edilaine WO24218 : fim
End;

Procedure TfrmFolhaNormalPrevia.grpMesRefEnter(Sender: TObject);
Begin
   Inherited;
   PrimeiraVez := false;
End;

Procedure TfrmFolhaNormalPrevia.bbtnDesfazPreparoClick(Sender: TObject);
Var inumlote, itipofolha: integer;
Begin
   {- INCLUSAO NAS QUERYS DE ELIMINACAO HISTORICOS PARA TRATAR TAMBEM O
      MESREFERNCIA IGUAL AO MES DO ABONO ANUAL.}
   Inherited;
   // Andre Imakawa - SIG 85168 - Inicio
   If Not dtmBaseDados.dbBaseDados.InTransaction Then
     dtmBaseDados.dbBaseDados.StartTransaction;
   framebenef.LimpaListaTipo3;
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
     dtmBaseDados.dbBaseDados.commit;
     //dtmBaseDados.dbBaseDados.StartTransaction; // Andre Imakawa - SIG 84221
   end;
   // Andre Imakawa - SIG 85168 - Fim

   If prmIdMotivoFolhaBen <= 0 Then
      Begin
         MsgDlg('O Motivo [padrão] para a Geração da Folha de Benefícios deverá ser preenchido. ' +
            'Utilize a tela de Parâmetros do Sistema.',
            'Informação', mtInformation, [mbOk, mbHelp], 0);
         exit;
      End;

   If trim(cmbMes.Text) = '' Then
      Begin
         MsgDlg('Mês de Referência deve ser preenchido.', 'Erro', mtError,
            [mbOk, mbHelp], 0);
         cmbMes.SetFocus;
         exit;
      End;

   If (trim(spnedAno.Text) = '') Or (spnedAno.value = 0) Then
      Begin
         MsgDlg('Ano de Referência deve ser preenchido.', 'Erro', mtError,
            [mbOk, mbHelp], 0);
         spnedAno.SetFocus;
         exit;
      End;

   If qryPreparosAnt.IsEmpty Then
      Begin
         MsgDlg('Não existem lotes preparados de Folha de Manutenção disponíveis.',
            'Erro', mtError, [mbOk, mbHelp], 0);
         exit;
      End;

   inumlote := 0;
   qryPreparosAnt.disablecontrols;
   //qryPreparosAnt.First; // SOL 242740 PPM 575822
   qryPreparosAnt.filter:='flgEnviar = 1'; // SOL 242740 PPM 575822
   qryPreparosAnt.filtered:=true; // SOL 242740 PPM 575822
   While Not qryPreparosAnt.Eof Do
      Begin
         If (qryPreparosAnt.FieldByName('FLGENVIAR').AsInteger = 1) And
            (qryPreparosAnt.FieldByName('FLGTIPOFOLHA').AsInteger In [0, 3, 4]) And
            (qryPreparosAnt.FieldByName('FLGCONCESSAO').AsInteger = 0) Then
            Begin
               iIdLote := qryPreparosAnt.fieldbyname('IDLOTE').asinteger;
               sUltMespreparo := qryPreparosAnt.fieldbyname('MESREFERENCIA').asstring;
               itipofolha := qryPreparosAnt.FieldByName('FLGTIPOFOLHA').AsInteger;
               inc(inumlote);
            End;
         qryPreparosAnt.Next;
      End;
   qryPreparosAnt.filtered:=false; // SOL 242740 PPM 575822
   If inumlote = 0 Then
      Begin
         MsgDlg('Nenhum lote de Folha de Manutenção foi selecionado para ser desfeito.',
            'Erro', mtError, [mbOk, mbHelp], 0);
         exit;
      End;

   If inumlote > 1 Then
      Begin
         MsgDlg('Apenas um lote de Folha de Manutenção pode ser selecionado para operação de DESFAZER PREPARO/PRÉVIA.',
            'Erro', mtError, [mbOk, mbHelp], 0);
         exit;
      End;

   qryPreparosAnt.EnableControls;

   PnlProgress.Visible := True;
   pgctrlOpcoes.ActivePage := tbsResultado;
   enabled := false;

   DesfazerPreparo(frameBenef.qryLista, qryAux1, qryAux2, qryAux3, iidlote,
      itipofolha, cboxIndividual.Checked, sUltmespreparo, sMesAbono, Mensagem,
      memResult);

   MsgDlg('Desfazer preparo concluído. ', 'Informação',
      mtInformation, [mbOk, mbHelp], 0);

   If memResult.text = '' Then
      pgctrlOpcoes.ActivePage := tbsPreparos;

   MontaQueryLotes;
   PnlProgress.Visible := false;
   enabled := true;
End;

Procedure TfrmFolhaNormalPrevia.AtualizaSeqInterno(aqryaux1, aqryaux2: twwquery;
   astabela: String);
Var lidseq: integer;
   litotal, licont: integer;
   ssql: String;
Begin
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;
      licont := 0; litotal := aqryaux1.recordcount;
      While Not aqryaux1.eof Do
         Begin
            //lidseq := LeUltRegistro(Nil, 'SEQINTERNOFB');  // SOL 251667 PPM 749703
            ssql := 'UPDATE ' + astabela + ' ' +
               //'SET IDSEQINTERNOFB = ' + inttostr(lidseq) + ' ' +  // SOL 251667 PPM 749703
               'SET IDSEQINTERNOFB = SEQSEQINTERNOFB.nextval ' + // SOL 251667 PPM 749703
               'WHERE ROWID = ' + quotedstr(aqryaux1.fieldbyname('RWI').asstring);
            ExecutarQuery(aqryaux2, ssql);
            inc(licont);
            Mensagem.Caption := 'Registro: ' + inttostr(licont) + ' de ' + inttostr(litotal);
            mensagem.Update;
            If licont Mod 100 = 0 Then
               Begin
                  dtmBaseDados.dbBaseDados.Commit;
                  dtmBaseDados.dbBaseDados.StartTransaction;
                  application.processmessages;
               End;
            aqryaux1.next;
         End;
   Finally
      dtmBaseDados.dbBaseDados.Commit;
   End;
End;

Procedure TfrmFolhaNormalPrevia.InsereLotePreviBenef(pidPreviaBenef: Double; pIdLote: Integer); // // SOL 252343/17434 PPM 874741
begin

   with TwwQuery.Create(nil) do
   begin
      DataBaseName := 'BaseDados';
      Close;
      SQl.Clear;
      SQL.Add('INSERT INTO cm.LOTESPREVIABENEF ');
      SQL.Add(' (IDLOTESPREVIABENEF, IDPREVIABENEF, IDLOTE) ');
      SQL.Add(' VALUES ');
      SQL.Add(' ( SEQLOTESPREVIABENEF.NEXTVAL, '+FloatToStr(pidPreviaBenef)+','+IntToStr(pIdLote)+' ) ');
      if not dtmBaseDados.dbBaseDados.InTransaction then
      begin
         dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      ExecSQL;
      dtmBaseDados.dbBaseDados.Commit;
   end;
end;

function TfrmFolhaNormalPrevia.InserePreviBenef(iIdTipoPreviaBenef: Integer):Double; // SOL 252343/17434 PPM 874741
Var  didPreviaBenef: Double;
begin
   Result := 0;

   with TwwQuery.Create(nil) do
   begin
      DataBaseName := 'BaseDados';
      Close;
      SQl.Clear;
      SQL.Add('SELECT SEQPREVIABENEF.NEXTVAL AS IDPREVIABENEF FROM DUAL ');
      if not dtmBaseDados.dbBaseDados.InTransaction then
      begin
         dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      Open;
      didPreviaBenef := FieldByName('IDPREVIABENEF').AsFloat;
      dtmBaseDados.dbBaseDados.Commit;
   end;


   with TwwQuery.Create(nil) do
   begin
      DataBaseName := 'BaseDados';
      Close;
      SQl.Clear;
      SQL.Add('INSERT INTO CM.PREVIABENEF ');
      SQL.Add(' (IDPREVIABENEF, IDTIPOPREVIABENEF, IDUSUARIOLISTA, IDMODULO, TOTALRECEBEDORES) ');
      SQL.Add(' VALUES ');
      if cboxIndividual.Checked then
         SQL.Add(' ('+FloatToStr(didPreviaBenef)+','+IntToStr(iIdTipoPreviaBenef)+','+IntToStr(Sistema.IdUsuario)+','+IntToStr(Sistema.IdModulo)+','+IntToStr(0)+' ) ')
      else
         SQL.Add(' ('+FloatToStr(didPreviaBenef)+','+IntToStr(iIdTipoPreviaBenef)+', NULL,'+IntToStr(Sistema.IdModulo)+','+IntToStr(0)+' ) ');

      if not dtmBaseDados.dbBaseDados.InTransaction then
      begin
         dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      ExecSQL;
      dtmBaseDados.dbBaseDados.Commit;
   end;
   Result :=  didPreviaBenef;
end;

Procedure TfrmFolhaNormalPrevia.AtualizaPreviBenef(pidPreviaBenef: Double); // SOL 252343/17434 PPM 874741
begin

   with TwwQuery.Create(nil) do
   begin
      DataBaseName := 'BaseDados';
      Close;
      SQl.Clear;
      SQL.Add('UPDATE CM.PREVIABENEF SET DATATERMINO = SYSDATE, TOTALRUBRICAS = '+IntToStr(dtmFolhaPrevia.lContadorTotal) +', TOTALRECEBEDORES = '+ IntToStr(dtmFolhaPrevia.lContadorRespTotal));
      SQL.Add(' WHERE IDPREVIABENEF = '+FloatToStr(pidPreviaBenef));
      if not dtmBaseDados.dbBaseDados.InTransaction then
      begin
         dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      ExecSQL;
      dtmBaseDados.dbBaseDados.Commit;
   end;

end;

// Andre Imakawa - SIG 74538 - Inicio
Procedure TfrmFolhaNormalPrevia.AtualizaPreviBenefETL(pidPreviaBenef: Double);
var
  query:TwwQuery;
begin
 try
  query := TwwQuery.Create(nil);

  query.DataBaseName := 'BaseDados';
  query.Close;
  query.SQl.Clear;
  query.SQL.Add('UPDATE CM.PREVIABENEF SET INICIOPERFILINVESTETL = SYSDATE' );
  query.SQL.Add(' WHERE IDPREVIABENEF = '+FloatToStr(pidPreviaBenef));
  if not dtmBaseDados.dbBaseDados.InTransaction then
  begin
     dtmBaseDados.dbBaseDados.StartTransaction;
  end;
  query.ExecSQL;
  dtmBaseDados.dbBaseDados.Commit;
 finally
  FreeAndNil(query);
 end;
end;


function TfrmFolhaNormalPrevia.VerificaPreviBenefETL(pidPreviaBenef: Double = 0): Integer;
var
  query : TwwQuery;
begin
 try
  query := TwwQuery.Create(nil);
  query.DataBaseName := 'BaseDados';

  query.Close;
  query.SQl.Clear;
  //edilaine WO24218 : inicio
  if pidPreviaBenef = 0 then
  begin
    //verifica se tem qualquer ETL executando
    query.SQL.Add('SELECT COUNT(1) AS QTD, MAX(ETAPA) AS ETAPA ');
    query.SQL.Add('  FROM CM.ETL_FOLHA_PREVIA');
    query.SQL.Add(' WHERE DATA_FIM IS NULL   ');
  end
  else
  begin
  query.SQL.Add('SELECT COUNT(1) AS QTD FROM CM.PREVIABENEF' );
  query.SQL.Add(' WHERE IDPREVIABENEF = '+FloatToStr(pidPreviaBenef));
  query.SQL.Add(' AND FIMPERFILINVESTETL IS NOT NULL ');
  end;
  //edilaine WO24218 : fim
  query.Open;

  if query.IsEmpty then
    Result := 0
  else
    result := query.FieldByName('QTD').AsInteger;
 finally
  FreeAndNil(query);
 end;
end;


function TfrmFolhaNormalPrevia.RetornaDiretorioETL(pFuncionalidade, pRotina: String;                                       // edilaine WO24218
                                                   var pDiretorio: string; var pTimeRepeat, pTimeAbort: Integer): Integer; // Andre Imakawa - SIG 82710
var
  query:TwwQuery;
begin
 try
  query := TwwQuery.Create(nil);
  query.DataBaseName := 'BaseDados';
  query.Close;
  query.SQl.Clear;
  query.SQL.Add(' SELECT PEP.DIRETORIO_PROD, DIRETORIO_DEV, TEMPO_REPETE, TEMPO_ABORTA, ' );// Andre Imakawa - SIG 82710
  query.SQL.Add('        PEP.IDPARAMETL      ');                                            //edilaine WO24218
  query.SQL.Add(' FROM CM.PARAMETLPLANUS PEP ');
  query.SQL.Add(' WHERE PEP.IDMODULO = 18 ');
  // edilaine WO24218 : inicio
  //query.SQL.Add(' AND PEP.FUNCIONALIDADE = ''PREVIA'' ');
  //query.SQL.Add(' AND PEP.ROTINA = ''PERFIL DE INVESTIMENTOS'' ');
  query.SQL.Add(' AND PEP.FUNCIONALIDADE = '+QuotedStr(pFuncionalidade) );
  query.SQL.Add(' AND PEP.ROTINA = '+QuotedStr(pRotina));
  // edilaine WO24218 : fim

  query.Open;

  if query.IsEmpty then
    Result := -1	// Andre Imakawa - SIG 82710
  else
  // Andre Imakawa - SIG 82710 - Inicio
  begin
    //if UpperCase(Sistema.AliasServidor) = 'PRODUCAO' then           // Andre Imakawa - SIG 100935
    if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then  // Andre Imakawa - SIG 100935
      pDiretorio := query.FieldByName('DIRETORIO_PROD').AsString
    else
      pDiretorio := query.FieldByName('DIRETORIO_DEV').AsString;

    pTimeRepeat := query.FieldByName('TEMPO_REPETE').AsInteger;
    pTimeAbort := query.FieldByName('TEMPO_ABORTA').AsInteger;

    result := query.FieldByName('IDPARAMETL').AsInteger;    //edilaine WO24218
  end;
  // Andre Imakawa - SIG 82710 - Inicio
 finally
  FreeAndNil(query);
 end;
end;

// Andre Imakawa - SIG 74538 - Fim


// TODA A ROTINA EXECUTADA NO EVENTO DO BOTÃO PROCESSAR FOI TRANSFERIDA PARA ESTE MÉTODO
// REESCRITA PARA TRATAR MULTIPLICIDADE DE LOTES DE CONCESSÃO
// AS ALTERAÇÕES DE LOTES NO HISTÓRICO DE BENEFÍCIO DEVEM SE ESTENDER PARA MOVBENEF
Procedure TfrmFolhaNormalPrevia.VerificaDuplicidadeLotes;
Var liidlote: integer;
   iLoteManutencao: integer;
   lii: integer;
   //beliminaprevia: boolean; // Andre Imakawa - SIG 97258
   lstlotes: tstringlist;
   lberro: boolean;
   lssql: String;
   idLoteAtualizacao : Integer; //Renato Visoni SOL 141256 Kintana 894087
   SaldoINI:double;
   ListaApagaPrevia: TStringList; // Andre Imakawa - SIG 97258
   nItens : integer;   //edilaine WO24218
//SOL205224 douglas.siqueira

   //subrotina usada em 2 pontos do código abaixo
   Procedure ProcessaAtualizacao;
   Begin

      try
         If FazQuery(qryAux2, lssql) Then
         Begin
            //BUSCA LOTE DE MANUTENÇÃO COM MOTIVO DE PAGAMENTO NORMAL
            liidlote := -1;
            iLoteManutencao := -1;
            idLoteAtualizacao := -1; //Renato Visoni SOL 141256 Kintana 894087

            qryAux2.first;
            // SOL 242846 PPM 579506 inicio
            While Not qryAux2.Eof Do
               Begin
                  // Daniel Begnami SOL:100080
                  // if (qryAux2.fieldbyname('IDMOTIVO').asinteger = prmidmotivofolhaben) and
                  If (qryAux2.fieldbyname('FLGCONCESSAO').asinteger = 0) Then
                     Begin
                        // liidlote:=qryAux2.fieldbyname('IDLOTE').asinteger;
                        iLoteManutencao := qryAux2.fieldbyname('IDLOTE').asinteger;
                        // FIM
                        break;
                     End;
                  qryAux2.next;
               End;

            If liidlote = -1 Then
               Begin
                  //BUSCA LOTE DE CONCESSÃO COM MOTIVO DE PAGAMENTO NORMAL
                  qryAux2.first;
                  While Not qryAux2.Eof Do
                     Begin
                        If (qryAux2.fieldbyname('IDMOTIVO').asinteger = prmidmotivofolhaben) And
                           (qryAux2.fieldbyname('FLGCONCESSAO').asinteger = 1) Then
                           Begin
                              liidlote := qryAux2.fieldbyname('IDLOTE').asinteger;
                              break;
                           End;
                        qryAux2.next;
                     End;
               End;

            If liidlote = -1 Then
               Begin
                  //BUSCA LOTE COM MOTIVO DE PAGAMENTO DE ABONO
                  qryAux2.first;
                  While Not qryAux2.Eof Do
                     Begin
                        If (qryAux2.fieldbyname('IDMOTIVO').asinteger = prmidmotivoabono) And
                           (qryAux2.fieldbyname('FLGCONCESSAO').asinteger = 0) Then
                           Begin

                              liidlote := qryAux2.fieldbyname('IDLOTE').asinteger;
                              break;
                           End;

                        qryAux2.next;
                     End;
               End;

            //SE AINDA NÃO CONSEGUIU O LOTE PEGA O MENOR
            If liidlote = -1 Then
            Begin
               qryAux2.first;
               liidlote := qryAux2.fieldbyname('IDLOTE').asinteger;
            End;

            try
              ListaApagaPrevia := TStringList.Create; // Andre Imakawa - SIG 97258
              // SOL 242846 PPM 579506 fim
              //ATUALIZA OS REGISTROS UM A UM
              //beliminaprevia := true; // Andre Imakawa - SIG 97258
              qryAux2.first;
              While Not qryAux2.Eof Do
              Begin
                 If ((liidlote <> qryAux2.fieldbyname('IDLOTE').asinteger) Or
                 (liidlote <> iLoteManutencao)) Then
                 Begin
                    //If beliminaprevia Then // Andre Imakawa - SIG 97258
                    If ListaApagaPrevia.IndexOf(qryAux2.fieldbyname('IDLOTE').AsString+';'+qryAux2.fieldbyname('IDTITULAR').AsString+';'+ qryAux2.fieldbyname('IDPESSOA').AsString) = -1 Then // Andre Imakawa - SIG 97258
                    Begin
                      ListaApagaPrevia.add(qryAux2.fieldbyname('IDLOTE').AsString+';'+qryAux2.fieldbyname('IDTITULAR').AsString+';'+ qryAux2.fieldbyname('IDPESSOA').AsString); // Andre Imakawa - SIG 97258
                    // SOL 242846 PPM 579506 inicio
                      //elimina a Prévia existente no mês para o titular
                      if not(ApagaPreviaEfetivacaoPessoa(qryAux2.fieldbyname('IDLOTE').asinteger, qryAux2.fieldbyname('IDTITULAR').AsInteger, qryAux2.fieldbyname('IDPESSOA').AsInteger )) then  // SOL 242846 PPM 579506  // SOL 242624/17054 Kintana 715180
                      begin
                         memResult.Lines.Add('Erro na SP_APAGAPREVIA ao tentar apagar a Prévia. Lote: ' +
                         qryAux2.fieldbyname('IDLOTE').AsString);
                         memResult.Lines.Add('--------------------------------------------------------------');
                      end;

                    end;
                 End;
                 //beliminaprevia := false; // Andre Imakawa - SIG 97258
                 // SOL 242846 PPM 579506 fim

                 //Renato Visoni SOL 141256 Kintana 894087
                 If (iLoteManutencao <> -1) Then
                 begin
                    idLoteAtualizacao := iLoteManutencao;
                 end else
                 begin
                    idLoteAtualizacao := liidlote;
                 end;
                 //Renato Visoni SOL 141256 Kintana 894087


                 //atualização da Hstbenefbfciario
                 If ((iLoteManutencao <>  qryAux2.fieldbyname('IDLOTE').asinteger) and (iLoteManutencao <> -1)) or
                    (((liidlote <>  qryAux2.fieldbyname('IDLOTE').asinteger) and (iLoteManutencao = -1) ) )
                  then  // SOL 242740 PPM 575822
                 begin
                     lssql :=
                        'UPDATE HSTBENEFBFCIARIO ' + _clinefeed +
                        'SET IDLOTE = ' + _clinefeed;
                     // Daniel Begnami SOL: 100080
                     If (iLoteManutencao <> -1) Then
                        // FIM
                        lssql := lssql + inttostr(iLoteManutencao) + ' ' + _clinefeed
                     Else
                        lssql := lssql + inttostr(liidlote) + ' ' + _clinefeed;

                     lssql := lssql +
                        'WHERE IDLOTE = ' + inttostr(qryAux2.fieldbyname('IDLOTE').asinteger) + _clinefeed +
                        'AND IDTITULAR = ' + inttostr(qryAux2.fieldbyname('IDTITULAR').asinteger) + ' ' + _clinefeed +
                        'AND IDPESSOA = ' + inttostr(qryAux2.fieldbyname('IDPESSOA').asinteger) + ' ' + _clinefeed +
                        'AND NUMEROPROCESSO = ' + inttostr(qryAux2.fieldbyname('NUMEROPROCESSO').asinteger) + ' ' + _clinefeed +
                        'AND IDPESSJUR = ' + inttostr(qryAux2.fieldbyname('IDPESSJUR').asinteger) + ' ' + _clinefeed +
                        'AND IDPLANOPREV = ' + inttostr(qryAux2.fieldbyname('IDPLANOPREV').asinteger) + ' ' + _clinefeed +
                        'AND IDPLANOORIGEM = ' + inttostr(qryAux2.fieldbyname('IDPLANOORIGEM').asinteger) + ' ' + _clinefeed +
                        'AND SEQPROPOSTA = ' + inttostr(qryAux2.fieldbyname('SEQPROPOSTA').asinteger) + ' ' + _clinefeed +
                        'AND IDBENEFICIO = ' + inttostr(qryAux2.fieldbyname('IDBENEFICIO').asinteger) + ' ' + _clinefeed +
                        'AND IDMOTIVO = ' + inttostr(qryAux2.fieldbyname('IDMOTIVO').asinteger) + ' ' + _clinefeed +
                        //'AND FLGENVIADO = 0 ' + _clinefeed + //Renato Visoni SOL 141256 Kintana 894087
                        'AND MES = ' + quotedstr(sMesCobranca) + ' ' + _clinefeed;
                        //'AND VLBENEFPGTO IS NULL ' + _clinefeed; //Renato Visoni SOL 141256 Kintana 894087

                        Try
                           qryAux3.close;
                           qryAux3.sql.clear;
                           qryAux3.sql.add(lssql);
                           qryAux3.execsql;
                        Except
                          On E: EDBEngineError Do
                          Begin
                             memResult.Lines.Add('Erro ao alterar registro do Histórico de Benefício');
                             memResult.Lines.Add('Mensagem de erro : ' + E.message);
                             memResult.Lines.Add('Dados do registro:');
                             memResult.Lines.Add('IDLOTE         = ' + inttostr(qryAux2.fieldbyname('IDLOTE').asinteger));
                             memResult.Lines.Add('IDTITULAR      = ' + inttostr(qryAux2.fieldbyname('IDTITULAR').asinteger));
                             memResult.Lines.Add('IDPESSOA       = ' + inttostr(qryAux2.fieldbyname('IDPESSOA').asinteger));
                             memResult.Lines.Add('NUMEROPROCESSO = ' + inttostr(qryAux2.fieldbyname('NUMEROPROCESSO').asinteger));
                             memResult.Lines.Add('IDPESSJUR      = ' + inttostr(qryAux2.fieldbyname('IDPESSJUR').asinteger));
                             memResult.Lines.Add('IDPLANOPREV    = ' + inttostr(qryAux2.fieldbyname('IDPLANOPREV').asinteger));
                             memResult.Lines.Add('IDPLANOORIGEM  = ' + inttostr(qryAux2.fieldbyname('IDPLANOORIGEM').asinteger));
                             memResult.Lines.Add('IDBENEFICIO    = ' + inttostr(qryAux2.fieldbyname('IDBENEFICIO').asinteger));
                                   memResult.Lines.Add('IDMOTIVO       = ' + inttostr(qryAux2.fieldbyname('IDMOTIVO').asinteger));
                                   memResult.Lines.Add('---------------------------------------------------------------');
                                   lberro := true;
                          End;
                        End;
                    End;

                    //atualização da Movbenef
                    If idLoteAtualizacao <>  qryAux2.fieldbyname('IDLOTE').asinteger then // SOL 242740 PPM 575822
                    begin
                        lssql :=
                           'UPDATE MOVBENEF  ' + _clinefeed +
                           '   SET IDLOTEMOV     = ' + IntToStr(idLoteAtualizacao) + ' ' + _clinefeed +
                           'WHERE IDLOTEMOV      = ' + IntToStr(qryAux2.fieldbyname('IDLOTE').asinteger) + ' ' + _clinefeed +
                           '  AND IDTITULAR      = ' + IntToStr(qryAux2.fieldbyname('IDTITULAR').asinteger) + ' ' + _clinefeed +
                           '  AND IDPESSOA       = ' + IntToStr(qryAux2.fieldbyname('IDPESSOA').asinteger) + ' ' + _clinefeed +
                           '  AND NUMEROPROCESSO = ' + IntToStr(qryAux2.fieldbyname('NUMEROPROCESSO').asinteger) + ' ' + _clinefeed +
                           '  AND IDPESSJUR      = ' + IntToStr(qryAux2.fieldbyname('IDPESSJUR').asinteger) + ' ' + _clinefeed +
                           '  AND IDPLANOPREV    = ' + IntToStr(qryAux2.fieldbyname('IDPLANOPREV').asinteger) + ' ' + _clinefeed +
                           '  AND IDPLANOORIGEM  = ' + IntToStr(qryAux2.fieldbyname('IDPLANOORIGEM').asinteger) + ' ' + _clinefeed +
                           '  AND SEQPROPOSTA    = ' + IntToStr(qryAux2.fieldbyname('SEQPROPOSTA').asinteger) + ' ' + _clinefeed +
                           '  AND IDBENEFICIO    = ' + IntToStr(qryAux2.fieldbyname('IDBENEFICIO').asinteger) + ' ' + _clinefeed;

                        Try
                           qryAux3.close;
                           qryAux3.sql.clear;
                           qryAux3.sql.add(lssql);
                           qryAux3.execsql;
                        Except
                          On E: EDBEngineError Do
                          Begin
                             memResult.Lines.Add('Erro ao alterar registro do Histórico de Benefício');
                             memResult.Lines.Add('Mensagem de erro : ' + E.message);
                             memResult.Lines.Add('Dados do registro:');
                             memResult.Lines.Add('IDLOTE         = ' + inttostr(qryAux2.fieldbyname('IDLOTE').asinteger));
                             memResult.Lines.Add('IDTITULAR      = ' + inttostr(qryAux2.fieldbyname('IDTITULAR').asinteger));
                             memResult.Lines.Add('IDPESSOA       = ' + inttostr(qryAux2.fieldbyname('IDPESSOA').asinteger));
                             memResult.Lines.Add('NUMEROPROCESSO = ' + inttostr(qryAux2.fieldbyname('NUMEROPROCESSO').asinteger));
                             memResult.Lines.Add('IDPESSJUR      = ' + inttostr(qryAux2.fieldbyname('IDPESSJUR').asinteger));
                             memResult.Lines.Add('IDPLANOPREV    = ' + inttostr(qryAux2.fieldbyname('IDPLANOPREV').asinteger));
                             memResult.Lines.Add('IDPLANOORIGEM  = ' + inttostr(qryAux2.fieldbyname('IDPLANOORIGEM').asinteger));
                             memResult.Lines.Add('IDBENEFICIO    = ' + inttostr(qryAux2.fieldbyname('IDBENEFICIO').asinteger));
                             memResult.Lines.Add('IDMOTIVO       = ' + inttostr(qryAux2.fieldbyname('IDMOTIVO').asinteger));
                             memResult.Lines.Add('---------------------------------------------------------------');
                             lberro := true;
                          End;
                        End;
                    End; // SOL 242740 PPM 575822
                    //Renato Visoni SOL 141256 Kintana 894087

                    //atualização da HstContribPrev
                    If idLoteAtualizacao <> qryAux2.fieldbyname('IDLOTE').asinteger then  // SOL 242740 PPM 575822
                    begin
                         lssql :=
                                     'UPDATE HSTCONTRIBPREV  ' + _clinefeed +
                                     ' SET IDLOTE          = ' + IntToStr(idLoteAtualizacao) + ' ' + _clinefeed +
                                     '  WHERE IDPESSOA     = ' + IntToStr(qryAux2.fieldbyname('IDPESSOA').asinteger) + ' ' + _clinefeed +
                                     '  AND IDPESSJUR      = ' + IntToStr(qryAux2.fieldbyname('IDPESSJUR').asinteger) + ' ' + _clinefeed +
                                     '  AND IDPLANOPREV    = ' + IntToStr(qryAux2.fieldbyname('IDPLANOPREV').asinteger) + ' ' + _clinefeed +
                                     '  AND SEQPROPOSTA    = ' + IntToStr(qryAux2.fieldbyname('SEQPROPOSTA').asinteger) + ' ' + _clinefeed +
                                     '  AND IDLOTE         = ' + IntToStr(qryAux2.fieldbyname('IDLOTE').asinteger) + ' ' + _clinefeed +
                                     '  AND MESCOBRANCA    = ' + Quotedstr(sMesCobranca);

                         Try
                                     qryAux3.close;
                                     qryAux3.sql.clear;
                                     qryAux3.sql.add(lssql);
                                     qryAux3.execsql;
                         Except
                           On E: EDBEngineError Do
                           Begin
                                             memResult.Lines.Add('Erro ao alterar registro do Histórico de Contribuição');
                                             memResult.Lines.Add('Mensagem de erro : ' + E.message);
                                             memResult.Lines.Add('Dados do registro:');
                                             memResult.Lines.Add('IDLOTE         = ' + inttostr(qryAux2.fieldbyname('IDLOTE').asinteger));
                                             memResult.Lines.Add('IDTITULAR      = ' + inttostr(qryAux2.fieldbyname('IDTITULAR').asinteger));
                                             memResult.Lines.Add('IDPESSOA       = ' + inttostr(qryAux2.fieldbyname('IDPESSOA').asinteger));
                                             memResult.Lines.Add('IDPESSJUR      = ' + inttostr(qryAux2.fieldbyname('IDPESSJUR').asinteger));
                                             memResult.Lines.Add('IDPLANOPREV    = ' + inttostr(qryAux2.fieldbyname('IDPLANOPREV').asinteger));
                                             memResult.Lines.Add('---------------------------------------------------------------');
                                             lberro := true;
                           End;
                         End;
                    end; // SOL 242740 PPM 575822

                      //atualização da TMPDESC
                    If  idLoteAtualizacao <>  qryAux2.fieldbyname('IDLOTE').asinteger then   // SOL 242740 PPM 575822
                    begin
                        lssql :=

                           'UPDATE TMPDESC  ' + _clinefeed +
                           ' SET IDLOTE        = ' + IntToStr(idLoteAtualizacao) + ' ' + _clinefeed +
                           '  WHERE IDTITULAR      = ' + IntToStr(qryAux2.fieldbyname('IDTITULAR').asinteger) + ' ' + _clinefeed +
                           '  AND IDPESSOA       = ' + IntToStr(qryAux2.fieldbyname('IDPESSOA').asinteger) + ' ' + _clinefeed +
                           '  AND IDPESSJUR      = ' + IntToStr(qryAux2.fieldbyname('IDPESSJUR').asinteger) + ' ' + _clinefeed +
                           '  AND IDPLANOPREV    = ' + IntToStr(qryAux2.fieldbyname('IDPLANOPREV').asinteger) + ' ' + _clinefeed +
                           '  AND IDLOTE         = ' + IntToStr(qryAux2.fieldbyname('IDLOTE').asinteger) + ' ' + _clinefeed +
                           '  AND MESCOBRANCA    = ' + Quotedstr(sMesCobranca) + _clinefeed +
                           '  AND FLGTIPODESC IN (''C'',''P'',''A'')';


                        Try
                           qryAux3.close;
                           qryAux3.sql.clear;
                           qryAux3.sql.add(lssql);
                           qryAux3.execsql;
                        Except
                           On E: EDBEngineError Do
                              Begin
                                 memResult.Lines.Add('Erro ao alterar registro na TMPDESC');
                                 memResult.Lines.Add('Mensagem de erro : ' + E.message);
                                 memResult.Lines.Add('Dados do registro:');
                                 memResult.Lines.Add('IDLOTE         = ' + inttostr(qryAux2.fieldbyname('IDLOTE').asinteger));
                                 memResult.Lines.Add('IDTITULAR      = ' + inttostr(qryAux2.fieldbyname('IDTITULAR').asinteger));
                                 memResult.Lines.Add('IDPESSOA       = ' + inttostr(qryAux2.fieldbyname('IDPESSOA').asinteger));
                                 memResult.Lines.Add('IDPESSJUR      = ' + inttostr(qryAux2.fieldbyname('IDPESSJUR').asinteger));
                                 memResult.Lines.Add('IDPLANOPREV    = ' + inttostr(qryAux2.fieldbyname('IDPLANOPREV').asinteger));
                                 memResult.Lines.Add('---------------------------------------------------------------');
                                 lberro := true;
                              End;
                        End;
                    end;  // SOL 242740 PPM 575822
                      //Renato Visoni SOL 141256 Kintana 894087

                    lstlotes.add(qryAux2.fieldbyname('IDLOTE').asstring + '-' +
                       qryAux2.fieldbyname('DESCRICAO').asstring);

                    qryAux2.next;
              End;
            finally
              FreeAndNil(ListaApagaPrevia); // Andre Imakawa - SIG 97258
            end;
         End;

      If Not lberro Then
         Begin
            if (dtmBaseDados.dbBaseDados.InTransaction) then
               dtmBaseDados.dbBaseDados.commit;
            memResult.Lines.Add('---------------------------------------------------------------');
         End
      Else
      begin
         if (dtmBaseDados.dbBaseDados.InTransaction) then
            dtmBaseDados.dbBaseDados.rollback;
      end;
   finally

      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         dtmBaseDados.dbBaseDados.Commit;
      end;
   end;

   End;


Begin
   lstlotes := tstringlist.create;
   lstlotes.sorted := true;
   lstlotes.duplicates := dupIgnore;
   Try

      // DANIEL BEGNAMI
      // INICIO PENDENCIA: SOL N. 90146_379434

      { lssql:=
        'SELECT COUNT(DISTINCT H.IDLOTE), H.IDTITULAR, H.IDPESSOA, '+_clinefeed+
        '       E.MATRICULA AS MATTIT, D.MATRICULA, P.NOME '+_clinefeed+
        'FROM HSTBENEFBFCIARIO H, CTRLINTERFACE C, PATRO PAT, ELEGPATRO E, DEPENTIT D, PESSOA P '+_clinefeed+
        'WHERE (H.MES = '+quotedstr(sMesCobranca)+') '+_clinefeed+
        'AND (H.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
        'AND (H.VLBENEFPGTO IS NULL) '+_clinefeed+
        'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
        'AND (H.FLGENVIADO = 0) '+_clinefeed+
        'AND (H.IDTITULAR = E.IDPESSOA) '+_clinefeed+
        'AND (H.IDPESSOA = P.IDPESSOA) '+_clinefeed+
        'AND (H.IDTITULAR = D.IDTITULAR) '+_clinefeed+
        'AND (H.IDLOTE = C.IDLOTE) '+_clinefeed+
        'AND (C.FLGTIPOFOLHA IN (0,5,6)) '+_clinefeed+
        'AND (H.IDPESSOA = D.IDPESSOA) '+_clinefeed;

      if cboxIndividual.Checked then
        lssql:=lssql+
          'AND EXISTS (SELECT 1 '+_clinefeed+
          '            FROM LISTAFOLHABENEFDET LD '+_clinefeed+
          '            WHERE H.IDTITULAR = LD.IDTITULAR '+_clinefeed+
          '            AND LD.IDLISTA = '+IntToStr(framebenef.ListaUsuario)+') '+_clinefeed;

      lssql:=lssql+
        'GROUP BY H.IDTITULAR, H.IDPESSOA, E.MATRICULA, D.MATRICULA, P.NOME '+_clinefeed+
        'HAVING COUNT(DISTINCT H.IDLOTE) > 1 '+_clinefeed; }

      memResult.Lines.Add('---------------------------------------------------------------');
      memResult.Lines.Add('VERIFICANDO DUPLICIDADE DE LOTES');
      memResult.Lines.Add('---------------------------------------------------------------');

      //Renato Visoni SOL 127182 Kintana 671855
      lssql := 'SELECT DISTINCT H.IDLOTE, H.IDTITULAR, H.IDPESSOA, E.MATRICULA AS MATTIT, D.MATRICULA, P.NOME ' + _clinefeed +
         'FROM HSTBENEFBFCIARIO H, CTRLINTERFACE C, PATRO PAT, ELEGPATRO E, DEPENTIT D, PESSOA P, BENEFICIO B ' + _clinefeed + // Renato Visoni BENEFICIO B  SOL 109546 KINTANA 496984
      'WHERE (H.MES = ' + quotedstr(sMesCobranca) + ') ' + _clinefeed +
         '  AND (H.IDPESSJUR = PAT.IDPESSOA) ' + _clinefeed +
         '  AND (H.VLBENEFPGTO IS NULL) ' + _clinefeed +
         //'  AND EXISTS (SELECT  H2.IDPESSOA ' + _clinefeed +                  // Andre Imakawa - SIG 77851
         '  AND EXISTS (SELECT /*+ no_unnest  */ H2.IDPESSOA ' + _clinefeed +   // Andre Imakawa - SIG 77851
         '                     FROM HSTBENEFBFCIARIO H2 ' + _clinefeed +
         '                     WHERE h.idpessoa = h2.idpessoa ' + _clinefeed +
         '                       AND (H2.MES = ' + quotedstr(sMesCobranca) + ')' + _clinefeed +
         //'                       AND H2.VLBENEFPGTO IS NULL ' + _clinefeed + //Renato Visoni SOL 141256 Kintana 894087
         //'                       AND H2.FLGENVIADO = 0 ' + _clinefeed +      //Renato Visoni SOL 141256 Kintana 894087
         '                     GROUP BY H2.IDPESSOA ' + _clinefeed +
         '                     HAVING COUNT(DISTINCT H2.IDLOTE) > 1)' + _clinefeed +

         '  AND (PAT.IDFUNDACAO = ' + inttostr(iidfundacao) + ') ' + _clinefeed +
         '  AND (H.FLGENVIADO = 0) ' + _clinefeed +
         '  AND (H.IDTITULAR = E.IDPESSOA) ' + _clinefeed +
         '  AND (H.IDPESSOA = P.IDPESSOA) ' + _clinefeed +
         '  AND (H.IDTITULAR = D.IDTITULAR) ' + _clinefeed +
         '  AND (H.IDLOTE = C.IDLOTE) ' + _clinefeed +
         '  AND (C.FLGTIPOFOLHA IN (0,5,6)) ' + _clinefeed +
         '  AND (H.IDPESSOA = D.IDPESSOA) ' + _clinefeed +
         '  AND (H.IDBENEFICIO = B.IDBENEFICIO)' + _clinefeed + // Daniel Begnami Sol:98253
      '  AND (H.IDLOTE IN (' + sLotesSelecionados + '))' + _clinefeed + //Thiago Passos SOL 130584 Kintana 735206
      '  AND (B.TIPOBENEFICIO <> 6)' + _clinefeed; // Fim



      If cboxIndividual.Checked Then
         lssql := lssql +
            ' AND EXISTS (SELECT LD.IDPESSOA ' + _clinefeed +
            '                    FROM LISTAFOLHABENEFDET LD ' + _clinefeed +
            '                    WHERE h.idpessoa = LD.idpessoa ' + _clinefeed +
            '                      AND LD.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) + ')';
      lssql := lssql +
         ' ORDER BY H.IDPESSOA ' + _clinefeed;
      //Renato Visoni SOL 127182 Kintana 671855

      // DANIEL BEGNAMI
      // FIM PENDENCIA: SOL N. 90146_379434


      If FazQuery(qryAux1, lssql) Then
         Begin

            //IDENTIFICANDO HSTBENEFBFCIARIO EM OUTROS LOTES.
            memResult.Lines.Add('---------------------------------------------------------------');
            memResult.Lines.Add('AGRUPANDO LOTES EM DUPLICIDADE');
            memResult.Lines.Add('---------------------------------------------------------------');

            nItens := 0;    //edilaine WO24218

            While Not qryAux1.eof Do
               Begin
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;
                  lberro := false;
                  memResult.Lines.Add('Alteração registros do beneficiário:');

                  If qryAux1.fieldbyname('mattit').asstring <> qryAux1.fieldbyname('matricula').asstring Then
                     memResult.Lines.Add('Matrícula origem (titular): ' + qryAux1.fieldbyname('mattit').asstring);

                  memResult.Lines.Add('Matrícula beneficiário: ' + qryAux1.fieldbyname('matricula').asstring);
                  memResult.Lines.Add('Nome beneficiário: ' + qryAux1.fieldbyname('nome').asstring);

                  lssql :=
                     'SELECT H.IDLOTE, C.FLGCONCESSAO, C.DESCRICAO, H.NUMEROPROCESSO, ' + _clinefeed +
                     '       H.IDPESSJUR, H.IDPLANOPREV, H.IDPLANOORIGEM, H.IDTITULAR, ' + _clinefeed +
                     '       H.IDPESSOA, H.IDBENEFICIO, H.VALORPREV, H.IDMOTIVO, H.SEQPROPOSTA ' + _clinefeed +
                     'FROM HSTBENEFBFCIARIO H, PATRO PAT, CTRLINTERFACE C ' + _clinefeed +
                     'WHERE H.IDLOTE = C.IDLOTE ' + _clinefeed +
                     '--AND H.IDTITULAR = ' + inttostr(qryAux1.fieldbyname('IDTITULAR').asinteger) + ' ' + _clinefeed +
                     'AND H.IDPESSOA = ' + inttostr(qryAux1.fieldbyname('IDPESSOA').asinteger) + ' ' + _clinefeed +
                     //'AND H.FLGENVIADO = 0 ' + _clinefeed +   //Renato Visoni SOL 141256 Kintana 894087
                     'AND H.IDLOTE IS NOT NULL ' + _clinefeed +
                     'AND H.MES = ' + quotedstr(sMesCobranca) + ' ' + _clinefeed +
                     //'AND H.VLBENEFPGTO IS NULL ' + _clinefeed +  //Renato Visoni SOL 141256 Kintana 894087
                     'AND PAT.IDFUNDACAO = ' + inttostr(iidfundacao) + ' ' + _clinefeed +
                     'AND H.IDPESSJUR = PAT.IDPESSOA ' + _clinefeed +
                     'AND C.FLGTIPOFOLHA IN (0,5,6) ' + _clinefeed +
                     'AND H.IDLOTE IN (' + sLotesSelecionados + ') ' + _clinefeed + //Thiago Passos SOL 130584 Kintana 735206
                  'ORDER BY C.FLGCONCESSAO, H.IDLOTE ' + _clinefeed;

                  ProcessaAtualizacao;

                  //edilaine WO24218 - inicio
                  if chkETL.checked then
                  begin
                    inc(nItens);
                    If nItens Mod 100 = 0 Then
                       application.processmessages;
                  end;
                  //edilaine WO24218 - fim

                  qryAux1.next;
               End;
         End;

      lssql :=
         'SELECT COUNT(DISTINCT H.IDLOTE), H.IDTITULAR, BF.IDRESPONSAVEL, ' + _clinefeed +
         '       E.MATRICULA AS MATTIT, D.MATRICULA, P.NOME ' + _clinefeed +
         'FROM HSTBENEFBFCIARIO H, CTRLINTERFACE C, PATRO PAT, ELEGPATRO E, ' + _clinefeed +
         '     DEPENTIT D, PESSOA P, BFCIARIOTITPLAN BF ' + _clinefeed +
         'WHERE (H.MES = ' + quotedstr(sMesCobranca) + ') ' + _clinefeed +
         'AND (H.IDPESSJUR = PAT.IDPESSOA) ' + _clinefeed +
         //'AND (H.VLBENEFPGTO IS NULL) ' + _clinefeed + //Renato Visoni SOL 141256 Kintana 894087
         'AND (PAT.IDFUNDACAO = ' + inttostr(iidfundacao) + ') ' + _clinefeed +
         //'AND (H.FLGENVIADO = 0) ' + _clinefeed +   //Renato Visoni SOL 141256 Kintana 894087
         'AND (H.IDTITULAR = E.IDPESSOA) ' + _clinefeed +
         'AND (BF.IDRESPONSAVEL = P.IDPESSOA) ' + _clinefeed +
         'AND (H.IDTITULAR = D.IDTITULAR) ' + _clinefeed +
         'AND (H.IDLOTE = C.IDLOTE) ' + _clinefeed +
         'AND (C.FLGTIPOFOLHA IN (0,5,6)) ' + _clinefeed +
         'AND (BF.IDRESPONSAVEL = D.IDPESSOA) ' + _clinefeed +
         'AND (BF.IDTITULAR = H.IDTITULAR) ' + _clinefeed +
         'AND (BF.IDPESSOA = H.IDPESSOA) ' + _clinefeed +
         'AND (BF.IDBENEFICIO = H.IDBENEFICIO) ' + _clinefeed +
         'AND (BF.IDPLANOPREV = H.IDPLANOPREV) ' + _clinefeed +
         'AND (BF.IDPLANOORIGEM = H.IDPLANOORIGEM) ' + _clinefeed +
         'AND (BF.SEQPROPOSTA = H.SEQPROPOSTA) ' + _clinefeed +
         'AND H.IDLOTE IN (' + sLotesSelecionados + ') ' + _clinefeed + //Thiago Passos SOL 130584 Kintana 735206
      'AND (BF.IDPESSJUR = H.IDPESSJUR) ' + _clinefeed;

      If cboxIndividual.Checked Then
         lssql := lssql +
            'AND EXISTS (SELECT 1 ' + _clinefeed +
            '            FROM LISTAFOLHABENEFDET LD ' + _clinefeed +
            '            WHERE H.IDTITULAR = LD.IDTITULAR ' + _clinefeed +
            '            AND LD.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) + ') ' + _clinefeed;

      lssql := lssql +
         'GROUP BY H.IDTITULAR, BF.IDRESPONSAVEL, E.MATRICULA, D.MATRICULA, P.NOME ' + _clinefeed +
         'HAVING COUNT(DISTINCT H.IDLOTE) > 1 ' + _clinefeed;

      If FazQuery(qryAux1, lssql) Then
         Begin

            //IDENTIFICANDO HSTBENEFBFCIARIO EM OUTROS LOTES.
            memResult.Lines.Add('---------------------------------------------------------------');
            memResult.Lines.Add('AGRUPANDO LOTES EM DUPLICIDADE (DENTRO DE GRUPO FAMILIAR)');
            memResult.Lines.Add('---------------------------------------------------------------');

            nItens := 0;    //edilaine WO24218

            While Not qryAux1.eof Do
               Begin
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;
                  lberro := false;
                  memResult.Lines.Add('Alteração registros do beneficiário vinculados ao responsável do grupo familiar:');

                  If qryAux1.fieldbyname('mattit').asstring <> qryAux1.fieldbyname('matricula').asstring Then
                     memResult.Lines.Add('Matrícula origem (titular): ' + qryAux1.fieldbyname('mattit').asstring);

                  memResult.Lines.Add('Matrícula responsável: ' + qryAux1.fieldbyname('matricula').asstring);
                  memResult.Lines.Add('Nome responsável: ' + qryAux1.fieldbyname('nome').asstring);

                  lssql :=
                     'SELECT H.IDLOTE, C.FLGCONCESSAO, C.DESCRICAO, H.NUMEROPROCESSO, ' + _clinefeed +
                     '       H.IDPESSJUR, H.IDPLANOPREV, H.IDPLANOORIGEM, H.IDTITULAR, ' + _clinefeed +
                     '       H.IDPESSOA, H.IDBENEFICIO, H.VALORPREV, H.IDMOTIVO, H.SEQPROPOSTA ' + _clinefeed +
                     'FROM HSTBENEFBFCIARIO H, PATRO PAT, CTRLINTERFACE C, BFCIARIOTITPLAN BF ' + _clinefeed +
                     'WHERE H.IDLOTE = C.IDLOTE ' + _clinefeed +
                     'AND (H.IDTITULAR = ' + inttostr(qryAux1.fieldbyname('IDTITULAR').asinteger) + ') ' + _clinefeed +
                     'AND (BF.IDRESPONSAVEL = ' + inttostr(qryAux1.fieldbyname('IDRESPONSAVEL').asinteger) + ') ' + _clinefeed +
                     //'AND (H.FLGENVIADO = 0) ' + _clinefeed + //Renato Visoni SOL 141256 Kintana 894087
                     'AND (H.IDLOTE IS NOT NULL) ' + _clinefeed +
                     'AND (H.MES = ' + quotedstr(sMesCobranca) + ') ' + _clinefeed +
                     //'AND (H.VLBENEFPGTO IS NULL) ' + _clinefeed +  //Renato Visoni SOL 141256 Kintana 894087
                     'AND (PAT.IDFUNDACAO = ' + inttostr(iidfundacao) + ') ' + _clinefeed +
                     'AND (H.IDPESSJUR = PAT.IDPESSOA) ' + _clinefeed +
                     'AND (C.FLGTIPOFOLHA IN (0,5,6)) ' + _clinefeed +
                     'AND (BF.IDTITULAR = H.IDTITULAR) ' + _clinefeed +
                     'AND (BF.IDPESSOA = H.IDPESSOA) ' + _clinefeed +
                     'AND (BF.IDBENEFICIO = H.IDBENEFICIO) ' + _clinefeed +
                     'AND (BF.IDPLANOPREV = H.IDPLANOPREV) ' + _clinefeed +
                     'AND (BF.IDPLANOORIGEM = H.IDPLANOORIGEM) ' + _clinefeed +
                     'AND (BF.SEQPROPOSTA = H.SEQPROPOSTA) ' + _clinefeed +
                     'AND (BF.IDPESSJUR = H.IDPESSJUR) ' + _clinefeed +
                     'ORDER BY H.IDLOTE ' + _clinefeed;

                  ProcessaAtualizacao;

                  //edilaine WO24218 - inicio
                  if chkETL.checked then
                  begin
                    inc(nItens);
                    If nItens Mod 100 = 0 Then
                       application.processmessages;
                  end;
                  //edilaine WO24218 - fim
                  
                  qryAux1.next;
               End;
         End;

      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            dtmBaseDados.dbBaseDados.Commit;
            dtmBaseDados.dbBaseDados.StartTransaction;
         End;

      If lstlotes.count > 0 Then
         Begin
            memResult.Lines.Add('');
            memResult.Lines.Add('---------------------------------------------------------------');
            memResult.Lines.Add(' LOTES QUE SOFRERAM ALTERAÇÃO EM VIRTUDE DE AGRUPAMENTO');
            memResult.Lines.Add(' DE REGISTROS DE HISTÓRICO DE BENEFÍCIOS.');
            memResult.Lines.Add(' PARA ESTES LOTES A PRÉVIA DEVE SER PROCESSADA POSTERIORMENTE,');
            memResult.Lines.Add(' CASO ELES NÃO TENHAM SIDO MARCADOS NESTE PROCESSAMENTO:');
            memResult.Lines.Add('');
            For lii := 0 To lstlotes.count - 1 Do
               memResult.Lines.Add('  ' + lstLotes[lii]);
            memResult.Lines.Add('');
            memResult.Lines.Add('---------------------------------------------------------------');
            memResult.Lines.Add('');
         End;
   Finally //except
      lstlotes.free;
   End;
End;


//edilaine WO19556 : inicio
Procedure TfrmFolhaNormalPrevia.bbtnPreparoClick(Sender: TObject);
Var {iInicio, iFim, }
   lbConfirma: boolean;
   lsmsg: String;
   query :TwwQuery;//SOL205224 douglas.siqueira // Andre Imakawa - SIG 78703
   i, iListaErro, iIdListaAux, iSEQLISTA_CONTROLE: Integer; // Andre Imakawa - SIG 78703
   sSEQLISTA_CONTROLE: String;										// Andre Imakawa - SIG 78703
   bPGA: Boolean; // Andre Imakawa - SIG 81948
   sErroValida: string;
   sNomeArqLog: string;      //edilaine WO19556
Begin
   iListaErro := 0;
   bErroMemory := False; // Andre Imakawa - SIG 81948
   qrycontrole.Close;
   qrycontrole.SQl.Clear;

   //edilaine WO24218 : inicio
   if VerificaPreviBenefETL() > 0 then
   begin
     MsgDlg('Já existe um processo ETL em execução.', 'Informação', mtInformation, [mbOk], 0);
     pgctrlOpcoes.activePage := tbsETL;
     Exit;
   end;
   //edilaine WO24218 : fim


   // Andre Imakawa - SIG 87467 - Inicio
   if not(ValidaUsuarioFolha(sErroValida)) then
   begin
     CMDebugToFile('Erro ao executar Previa: ' + sErroValida);
     memResult.Lines.Add('------------------------------------------------------------------------------');
     memResult.Lines.Add('Mensagem: '+sErroValida);
     memResult.Lines.Add('------------------------------------------------------------------------------');
     pgctrlOpcoes.activepage := tbsResultado;
     Exit;
   end;
   // Andre Imakawa - SIG 87467 - Fim

   // Andre Imakawa - SIG 82710 - Inicio
   // Andre Imakawa - SIG 81948 - Inicio
   {
   bPGA := False;
   try
     AlterSessionBD('alter session set _PGA_CR_CACHE_SIZE = 3145728');
     bPGA := True;
   except
     bPGA := False;
     memResult.Lines.Add('Falha ao alterar _PGA_CR_CACHE_SIZE');
     memResult.Lines.Add('---------------------------------------------------------------');
   end;
   }
   // Andre Imakawa - SIG 81948 - Fim
   // Andre Imakawa - SIG 82710 - Fim


   //---------------------------------------------------------------------------
   // Validações
   //---------------------------------------------------------------------------
   try
     if chkModoAuto.checked then
        MarcarLotes;

     qryPreparosAnt.disablecontrols;
     qryPreparosAnt.filter:='flgEnviar = 1';
     qryPreparosAnt.filtered:=true;
     if qryPreparosAnt.isempty then
     begin
       MsgDlg('Nenhum lote selecionado.', 'Informação', mtInformation, [mbOk], 0);
       Exit;
     end;
     //edilaine WO24218 : inicio
   finally
     qryPreparosAnt.filtered:=false;
     qryPreparosAnt.enablecontrols;
   end;

   if (not chkModoAuto.checked) and (cboxIndividual.Checked) and (frameBenef.qryLista.recordcount = 0) then
   begin
     MsgDlg('Lista Individual vazia.', 'Informação', mtInformation, [mbOk], 0);
     pgctrlOpcoes.activepage := tbsIndividual;
     Exit;
   end;

   If (chkUsaPrevisaoPagto.Checked) And (edDataFolha.Date < Date) Then
      Begin
         MsgDlg('Previsão de pagamento informada menor que a data atual. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         edDataFolha.SetFocus;
         exit;
      End;

   If pgctrlOpcoes.ActivePage = tbsPreparos Then
      If qryPreparosAnt.IsEmpty Then
         Begin
            MsgDlg('Não existe informação no Mês para a Prévia. Rodar o Preparo. ', 'Erro',
               mtError, [mbOk, mbHelp], 0);
            PnlProgress.Visible := False;
            enabled := true;
            exit;
         End;


   If Not VerificaFolha('2', sMesCobranca, '1', edDataFolha.Text) Then
      Begin
         MsgDlg('A Regra de Verificação da Folha impede que a Prévia prossiga. ' + #13#13 +
            'Verifique os parâmetros necessários para o Prévia.',
            'Informação', mtInformation, [mbOk, mbHelp], 0);
         enabled := true;
         exit;
      End;

   // Testar se o motivo default está preenchido
   If prmIDMOTIVOFOLHABEN <= 0 Then
      Begin
         MsgDlg('O Motivo [padrão] para a Geração da Folha de Benefícios deverá ser preenchido. Utilize a tela de Parâmetros do Modulo.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         PnlProgress.Visible := False;
         enabled := true;
         Exit;
      End;

   // Andre Imakawa - SIG 99272 - Inicio
   If (prmMesAdiantAbonoFund = '') or (prmMesAdiantAbonoINSS = '') Then
      Begin
         MsgDlg('O Mês de adiantamento do abono Fundacação e INSS deverá ser preenchido. Utilize a tela de Parâmetros do Modulo.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         PnlProgress.Visible := False;
         enabled := true;
         Exit;
      End;
   // Andre Imakawa - SIG 99272 - Fim

   // Andre Imakawa - SIG 99499 - Inicio
   If (prmMesAbonoFund = '') or (prmMesAbonoINSS = '') Then
      Begin
         MsgDlg('O Mês do abono Fundacação e INSS deverá ser preenchido. Utilize a tela de Parâmetros do Modulo.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         PnlProgress.Visible := False;
         enabled := true;
         Exit;
      End;
   // Andre Imakawa - SIG 99499 - Fim


   // Testar mês
   If Trim(cmbMes.Text) = '' Then
      Begin
         MsgDlg('Mês de Referência não preenchido. ', 'Erro', mtError, [mbOk, mbHelp], 0);
         PnlProgress.Visible := False;
         cmbMes.SetFocus;
         enabled := true;
         Exit;
      End;

   // Testar ano
   If Trim(spnedAno.Text) = '' Then
      Begin
         MsgDlg('Ano de Referência não preenchido. ', 'Erro', mtError, [mbOk, mbHelp], 0);
         spnedAno.SetFocus;
         PnlProgress.Visible := False;
         enabled := true;
         Exit;
      End;

   // Testar a data da folha
   If (Trim(edDataFolha.Text) = '') Then
      Begin
         MsgDlg('Preencha a Data da Folha de Benefícios', 'Erro', mtError, [mbOk, mbHelp], 0);
         edDataFolha.SetFocus;
         PnlProgress.Visible := False;
         enabled := true;
         Exit;
      End;


   //Thiago Passos SOL 130584 Kintana 735206 - Inicio
   sLotesSelecionados := '';
   lbConfirma := false; // SOL 242740 PPM 575822
   qryPreparosAnt.filter:='flgEnviar = 1'; //SOL 242740 PPM 575822
   qryPreparosAnt.filtered:=true; //SOL 242740 PPM 575822

   While Not qryPreparosAnt.Eof Do
   Begin
      If qryPreparosAnt.FieldByName('FLGENVIAR').asInteger = 1 Then
         Begin
            // SOL 242846 PPM 579506
            //VERIFICAÇÃO DO MÊS DE PROCESSAMENTO CONTRA O MÊS DE REFERÊNCIA DOS LOTES SELECIONADOS
            If (sMesCobranca > qryPreparosAnt.FieldByName('MESREFERENCIA').asstring) Then
               lbConfirma := true;
            // SOL 242846 PPM 579506
            If sLotesSelecionados = '' Then
               sLotesSelecionados := qryPreparosAnt.FieldByName('idlote').asString
            Else
               sLotesSelecionados := sLotesSelecionados + ',' + qryPreparosAnt.FieldByName('idlote').asString;
         End;

      qryPreparosAnt.Next;
   End;
   qryPreparosAnt.filtered:=False; //SOL 242740 PPM 575822
   //qryPreparosAnt.First;
   //Thiago Passos SOL 130584 Kintana 735206  - Fim

   //PROCESSAR OS LOTES INDEPENDENTEMENTE.
   sMesCobranca := Trim(spnedAno.Text) + '/';
   sMesAbono := Trim(spnedAno.Text) + '/13';
   If cmbMes.ItemIndex <= 8 Then
      sMesCobranca := sMesCobranca + '0' + IntToStr(cmbMes.ItemIndex + 1)
   Else
      Begin
         If cmbMes.ItemIndex <> 12 Then
            sMesCobranca := sMesCobranca + IntToStr(cmbMes.ItemIndex + 1)
         Else
            sMesCobranca := sMesCobranca + '12';
      End;
   // SOL 242846 PPM 579506  inicio
   If lbConfirma Then
   Begin
      If MsgDlg('Existem lotes selecionados com mês de referência anterior ao ' +
            'mês para processamento.' + #13 +
            'Confirma a execução da Prévia ?' + #13 +
            'Caso deseje alterar o mês de processamento não confirme.',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo Then
      Begin
         edDataFolha.SetFocus;
         PnlProgress.Visible := False;
         enabled := true;
         Exit;
      End;
   End;
   // SOL 242846 PPM 579506  fim


   pgctrlOpcoes.activepage := tbsResultado;
   Mensagem.Caption := 'Verificando informações para Cálculo da Folha de Benefício...';
   mensagem.Update;

   If Not VerificaRubricasIR(qryAux1, lsmsg) Then
      Begin
         memResult.Lines.Add('---------------------------------------------------------------');
         memResult.Lines.Add('ANÁLISE DO CADASTRO DE RUBRICAS PARA IR.');
         memResult.Lines.Add('---------------------------------------------------------------');
         memResult.Lines.Add(lsmsg);
         memResult.Lines.Add('---------------------------------------------------------------');
         MsgDlg(
            'Foram identificados problemas de cadastro em algumas rubricas de IR.' +
            'Favor verificar o LOG gerado e efetuar o acerto no Cadastro de Rubricas.',
            'Erro', mtError, [mbOk, mbHelp], 0);
         PnlProgress.Visible := False;
         enabled := true;
         Exit;
      End;

   //---------------------------------------------------------------------------
   // Prepara listas para processamento
   //---------------------------------------------------------------------------

   framebenef.LimpaListaTipo3; // Andre Imakawa - SIG 85168

   if chkDivideLista.Checked then
   begin
     pgctrlOpcoes.activepage := tbsResultado;
     memResult.Lines.Add('==================================================');
     memResult.Lines.Add('PRÉVIA DA FOLHA - UTILIZANDO DIVISAO DE LISTAS');
     memResult.Lines.Add('==================================================');
     memResult.Lines.Add('');
     AtualizaIdUsuarioListaBenef(IntToStr(framebenef.ListaUsuario), 'NULL',IntToStr(SISTEMA.IdUsuario));
     if MsgDlg('Deseja reprocessar lista não finalizada?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
       InputQuery('Divisão de Listas', 'Digite o código de Execução:' , sSEQLISTA_CONTROLE );

       memResult.Lines.Add('---------------------------------------------------------------');
       memResult.Lines.Add('REPROCESSAMENTO DA EXECUÇÃO: '+ sSEQLISTA_CONTROLE);
       memResult.Lines.Add('---------------------------------------------------------------');

       qrycontrole.SQL.add(' SELECT * FROM CM.PREVIA_CONTROLE PC WHERE PC.IDSEQEXECPREVIA = '+sSEQLISTA_CONTROLE);
       qrycontrole.SQL.add('    AND FLGPROCESSADO < 2 ORDER BY FLGPROCESSADO ASC, IDLISTACLONE ASC');
       try
         qrycontrole.open;
       except
         MsgDlg('Código de Execução inválido.', 'Erro', mtError, [mbOk], 0);
         memResult.Lines.Add('---------------------------------------------------------------');
         memResult.Lines.Add('CÓDIGO DE EXECUÇÃO INVÁLIDO. ');
         memResult.Lines.Add('---------------------------------------------------------------');

         Exit;
       end;
       if (qrycontrole.isempty) then
       begin
         MsgDlg('Código de Execução inválido ou finalizado.', 'Informação', mtInformation, [mbOk], 0);
         memResult.Lines.Add('---------------------------------------------------------------');
         memResult.Lines.Add('CÓDIGO DE EXECUÇÃO INVÁLIDO. ');
         memResult.Lines.Add('---------------------------------------------------------------');

         Exit;
       end
       else
       begin
         iIdListaAux := framebenef.ListaUsuario;
         iSEQLISTA_CONTROLE := strtoint(sSEQLISTA_CONTROLE);
         qrycontrole.First;
         while not(qrycontrole.eof) do
         begin
           if qrycontrole.FieldByName('FLGPROCESSADO').AsInteger = 1 then
           begin
             iListaErro := 1;
             Break;
           end;
           qrycontrole.next;
         end;

         if iListaErro = 1 then
         begin
           if MsgDlg('Existe(m) lista(s) processada(s) parcialmente, Deseja reprocessar?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           begin
             qrycontrole.Close;
             qrycontrole.SQl.Clear;
             qrycontrole.SQL.add(' SELECT * FROM CM.PREVIA_CONTROLE PC WHERE PC.IDSEQEXECPREVIA = '+inttostr(iSEQLISTA_CONTROLE));
             qrycontrole.SQL.add('    AND FLGPROCESSADO < 2 ORDER BY FLGPROCESSADO DESC, IDLISTACLONE ASC' );

           end
           else
           begin
             qrycontrole.Close;
             qrycontrole.SQl.Clear;
             qrycontrole.SQL.add(' SELECT * FROM CM.PREVIA_CONTROLE PC WHERE PC.IDSEQEXECPREVIA = '+inttostr(iSEQLISTA_CONTROLE));
             qrycontrole.SQL.add('    AND FLGPROCESSADO < 1 ORDER BY FLGPROCESSADO ASC, IDLISTACLONE ASC');

           end;
         end
         else
         begin
           qrycontrole.Close;
           qrycontrole.SQl.Clear;
           qrycontrole.SQL.add(' SELECT * FROM CM.PREVIA_CONTROLE PC WHERE PC.IDSEQEXECPREVIA = '+inttostr(iSEQLISTA_CONTROLE));
           qrycontrole.SQL.add('    AND FLGPROCESSADO < 1 ORDER BY FLGPROCESSADO ASC, IDLISTACLONE ASC');

         end;
       end;
     end
     else
     begin
       if MsgDlg('Atenção lista selecionada possui '+  IntToStr(frameBenef.qryLista.recordcount) +' registro(s), Deseja continuar?',
        'Atenção', mtInformation, [mbYes, mbNo], 0)= mrNo then
       begin
         memResult.Lines.Add('---------------------------------------------------------------');
         memResult.Lines.Add('PRÉVIA DA FOLHA - UTILIZANDO DIVISAO DE LISTAS - CANCELADA ');
         memResult.Lines.Add('---------------------------------------------------------------');
         Exit;
       end;
       iSEQLISTA_CONTROLE := LeUltRegistro(Nil,'PREVIA_CONTROLE');

       memResult.Lines.Add('---------------------------------------------------------------');
       memResult.Lines.Add('NOVA EXECUÇÃO, CÓDIGO DE EXECUÇÃO:  '+ inttostr(iSEQLISTA_CONTROLE));
       memResult.Lines.Add('---------------------------------------------------------------');

       IncluiPessoaListaporListagem(iIdListaAux,iSEQLISTA_CONTROLE, framebenef.ListaUsuario, 0, FALSE);
       IncluiPessoaListaporListagem(iIdListaAux,iSEQLISTA_CONTROLE, framebenef.ListaUsuario, StrToInt(speDivideLista.text), TRUE);

       MsgDlg('Código de Execução: '+ IntToStr(iSEQLISTA_CONTROLE), 'Informação', mtInformation, [mbOk], 0);

       iIdListaAux := framebenef.ListaUsuario;

       qrycontrole.SQL.add(' SELECT * FROM CM.PREVIA_CONTROLE PC WHERE PC.IDSEQEXECPREVIA = '+inttostr(iSEQLISTA_CONTROLE));

     end;
   end
   else
   begin
     qrycontrole.SQL.add(' SELECT 1 FROM DUAL');
   end;

   qrycontrole.open;
   qrycontrole.First;

   IdExec := iSEQLISTA_CONTROLE; 	// Andre Imakawa - SIG 81948

   SistemaFolha.objIrrf.CarregaFaixasIRRF(FormatDateTime('dd/mm/yyyy', Now)); // SOL 251642 PPM 741033

   try
     try
       while not (qryControle.eof) do
       begin
         // ajustando contole
       if chkDivideLista.Checked then
       begin
         AtualizaIdUsuarioListaBenef(IntToStr(iIdListaAux), 'NULL','');
         AtualizaIdUsuarioListaBenef(qrycontrole.FieldByName('IDLISTACLONE').AsString, IntToStr(SISTEMA.IdUsuario),'');
         framebenef.ListaUsuario := qrycontrole.FieldByName('IDLISTACLONE').AsInteger;
         framebenef.AbreQryLista;
         if (qrycontrole.FieldByName('IDPREVIABENEF').AsString = '') then
         begin
           iIdPreviaBenef := InserePreviBenef(0);// SOL 252343/17434 PPM 874741
           qryPreparosAnt.disablecontrols;
           qryPreparosAnt.filter:='flgEnviar = 1';
           qryPreparosAnt.filtered:=true;
           While Not qryPreparosAnt.Eof Do
           Begin
             If (qryPreparosAnt.FieldByName('flgEnviar').AsInteger = 1) Then
             Begin
               InsereLotePreviBenef(iIdPreviaBenef, qryPreparosAnt.FieldByName('IDLOTE').AsInteger);
             end;
             qryPreparosAnt.Next;
           end;
           qryPreparosAnt.enablecontrols;
           qryPreparosAnt.filtered:=false;
           AtualizaPreviaControle(qrycontrole.FieldByName('IDSEQEXECPREVIA').AsString,
                                  qrycontrole.FieldByName('IDLISTAORIGEM').AsString,
                                  qrycontrole.FieldByName('IDLISTACLONE').AsString,
                                  FloatToStr(iIdPreviaBenef),
                                  '1');
         end
         else
         begin
           iIdPreviaBenef := qrycontrole.FieldByName('IDPREVIABENEF').asinteger;
		   // Andre Imakawa - SIG 80669 - Inicio
           AtualizaPreviaControle(qrycontrole.FieldByName('IDSEQEXECPREVIA').AsString,
                                  qrycontrole.FieldByName('IDLISTAORIGEM').AsString,
                                  qrycontrole.FieldByName('IDLISTACLONE').AsString,
                                  FloatToStr(iIdPreviaBenef),
                                  '1');
		   // Andre Imakawa - SIG 80669 - Fim
         end;

         memResult.Lines.Add('---------------------------------------------------------------');
         memResult.Lines.Add('INÍCIO DA LISTA :  '+ qrycontrole.FieldByName('IDLISTACLONE').AsString);
         memResult.Lines.Add('---------------------------------------------------------------');

       end
       else
       begin
         iIdPreviaBenef := InserePreviBenef(0);// SOL 252343/17434 PPM 874741
         qryPreparosAnt.disablecontrols;
         qryPreparosAnt.filter:='flgEnviar = 1';
         qryPreparosAnt.filtered:=true;
         While Not qryPreparosAnt.Eof Do
         Begin
           If (qryPreparosAnt.FieldByName('flgEnviar').AsInteger = 1) Then
           Begin
             InsereLotePreviBenef(iIdPreviaBenef, qryPreparosAnt.FieldByName('IDLOTE').AsInteger);
           end;
           qryPreparosAnt.Next;
         end;
         qryPreparosAnt.enablecontrols;
         qryPreparosAnt.filtered:=false;

       end;
         iIdListaAux := framebenef.ListaUsuario;

         //-------------------------------------------------------------------------
         // Executando o Processo da Previa
         //-------------------------------------------------------------------------
         ExecutaPrevia();


         qrycontrole.Next;

         //edilaine WO19556 : inicio
         sNomeArqLog := sistema.NomeUsuario+'_'+IntToStr(iSEQLISTA_CONTROLE)+'_'+
                        IntToStr(iIdListaAux)+'.txt';

         memResult.lines.SaveToFile(sistema.RetornaCaminhoArquivos(sistema.idEmpresa)+'\'+sNomeArqLog);

         if (chkModoAuto.checked) then
         begin
           sleep(2000);

           if Copy(UpperCase(Sistema.AliasServidor), 1, 8) = 'PRODUCAO' then
              copyfile(PChar(sistema.RetornaCaminhoArquivos(sistema.idEmpresa)+'\'+sNomeArqLog),
                       PChar('\\rubeo\WebConvenio\logsPrevia\'+sNomeArqLog), false)
           else
              copyfile(PChar(sistema.RetornaCaminhoArquivos(sistema.idEmpresa)+'\'+sNomeArqLog),
                       PChar('\\tauri\WebConvenio\logsPrevia\'+sNomeArqLog), false);

         end;
         //edilaine WO19556 : fim

       end;

        //edilaine WO24218 : inicio
        if not chkETL.checked then
        begin
         // Andre Imakawa - SIG 87202 - Inicio
         //if (chkDivideLista.Checked) then
            ExecutaPerfil;
         // Andre Imakawa - SIG 87202 - Fim
        end;
        //edilaine WO24218 : fim

       if chkDivideLista.Checked then
          begin
            memResult.Lines.Add('---------------------------------------------------------------');
            memResult.Lines.Add('PRÉVIA DA FOLHA - UTILIZANDO DIVISAO DE LISTAS - FINALIZADA ');
            memResult.Lines.Add('---------------------------------------------------------------');
            // Andre Imakawa - SIG 85168 - Inicio
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;
            framebenef.LimpaListaTipo3;
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
              dtmBaseDados.dbBaseDados.commit;
              dtmBaseDados.dbBaseDados.StartTransaction;
            end;
            // Andre Imakawa - SIG 85168 - Fim
          end;
          pnlProgress.visible := false;
          pgctrlOpcoes.ActivePage := tbsResultado;

          bbtnSalvar.visible := true;
          enabled := true;
          tag := 0;

          //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
          //memResult.lines.SaveToFile('c:\previafolha.txt');
          memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\previafolha.txt');

          //BRUNO AZEVEDO SOL 140974 KINTANA 889580
          Mensagem.Caption := ''; // Andre Imakawa - SIG 28402
          Mensagem.Update; // Andre Imakawa - SIG 28402
          try
             //memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\previafolha.txt');  // Andre Imakawa - SIG 28402
             GravaLog(qryAux2); // Andre Imakawa - SIG 28402
          except
          end;

     except
       on e:exception do
       begin
         CMDebugToFile('Erro ao executar Previa: ' + E.ClassName);         // Andre Imakawa - SIG 99651/136844
         CMDebugToFile('Erro ao executar Previa: ' + E.message);
         dtmFolhaPrevia.ExibeMensagem('Erro na execução da Previa.');
         dtmFolhaPrevia.ExibeMensagemSemRecebedor('Mensagem de erro : '+E.ClassName);    // Andre Imakawa - SIG 99651/136844
         dtmFolhaPrevia.ExibeMensagemSemRecebedor('Mensagem de erro : '+E.message);
         dtmFolhaPrevia.ExibeMensagemSemRecebedor('---------------------------------------------------------------');
       end;
     end;

  finally
     //edilaine WO19556 : inicio
     sNomeArqLog := sistema.NomeUsuario+'_'+IntToStr(iSEQLISTA_CONTROLE)+'_'+
                    IntToStr(iIdListaAux)+'.txt';

     memResult.lines.SaveToFile(sistema.RetornaCaminhoArquivos(sistema.idEmpresa)+'\'+sNomeArqLog);

     if (chkModoAuto.checked) then
     begin
       sleep(2000);

       if Copy(UpperCase(Sistema.AliasServidor), 1, 8) = 'PRODUCAO' then
          copyfile(PChar(sistema.RetornaCaminhoArquivos(sistema.idEmpresa)+'\'+sNomeArqLog),
                   PChar('\\rubeo\WebConvenio\logsPrevia\'+sNomeArqLog), false)
       else
          copyfile(PChar(sistema.RetornaCaminhoArquivos(sistema.idEmpresa)+'\'+sNomeArqLog),
                   PChar('\\tauri\WebConvenio\logsPrevia\'+sNomeArqLog), false);

     end;
     //edilaine WO19556 : fim

  end;

   // Andre Imakawa - SIG 82710 - Inicio
   // Andre Imakawa - SIG 81948 - Inicio
   {
   if bPGA then
   begin
     try
       AlterSessionBD('alter session set _PGA_CR_CACHE_SIZE = 524288');
     except
       memResult.Lines.Add('Falha ao alterar _PGA_CR_CACHE_SIZE');
       memResult.Lines.Add('---------------------------------------------------------------');
     end
   end;
   }
   // Andre Imakawa - SIG 81948 - Fim
   // Andre Imakawa - SIG 82710 - Fim

end;


Procedure TfrmFolhaNormalPrevia.ExecutaPrevia;
Var {iInicio, iFim, }
   tInicio, tFim, tTotal,
   tInicioEstCalc, tFimEstCalc: tdatetime;  // SOL 252343/17434 PPM 874741
   bPrevia: boolean;
   sSQL: String;
   lsLista: String;
   iUltDTitularPrevia, iUltDPessoaPrevia : Integer; // SOL 242624
   mrOpcaoPrevia: TModalResult;
   xQryUpd: TwwQuery;
   vValor, vQtd: String;
   query :TwwQuery;//SOL205224 douglas.siqueira // Andre Imakawa - SIG 78703
   flgBdelbit:boolean;
   i : Integer; // Andre Imakawa - SIG 78703
   bPossuiErro, bErroInserePrevia: Boolean;                         // Andre Imakawa - SIG 80669
   iIdListaAux : integer;             //edilaine WO19556 : fim
   lExecutou1Vez : boolean;           //edilaine WO24218
Begin

 try
     //edilaine WO19556 : inicio
     dtmContabilPrevia := TdtmContabil.create(nil);
     dtmFolhaPrevia    := TdtmFolhaPrevia.create(nil);
     dtmfolhaprevia.mmemo := memResult;
     dtmfolhaprevia.lblmsg := lblContagem;

     dtmfolhaprevia.InstanciaDtmLocal(dtmfolhaprevia, dtmContabilPrevia);
     //edilaine WO19556 : fim

   try
     //While not(qrycontrole.eof) do      //edilaine WO19556
     Begin
       bPossuiErro := False;		  // Andre Imakawa - SIG 80669
       bErroInserePrevia := False;	  // Andre Imakawa - SIG 80669
       VerificaParametrizacaoRRAIRRF;     // Felipe A. Santos - SOL 258357/17801 PPM 1083052

       Inherited;
       //SistemaFolha.objIrrf.CarregaFaixasIRRF(FormatDateTime('dd/mm/yyyy', Now)); // SOL 251642 PPM 741033
       dtmFolhaPrevia.lContadorTotal :=  0;// SOL 252343/17434 PPM 874741
       dtmFolhaPrevia.lContadorEstrutura :=  0; // Andre Imakawa - SIG 54393
       flgBdelbit:=true;

       //Pegando os Lotes Selecionados para Processamento


       //Para evitar o problema de fechar o lote, mesmo quando roda uma prévia individual
       If (cboxIndividual.Checked) and not(ChkPreviaGeral.Checked) Then // SOL 242740 PPM 575822
          sTodasPessoas := 'Indiv'
       Else
          sTodasPessoas := '';

       If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;
       If Not Sistema.GravaLogOperacoes('Processamento da Prévia Normal.') Then
          Begin
             dtmBaseDados.dbBaseDados.rollback;
             Raise Exception.Create('Não foi possível gravar o log.');

          End
       Else
       begin
          dtmBaseDados.dbBaseDados.Commit;
       end;
       enabled := false;
       //PARA INIBIR DESCONEXAO AUTOMATICA DO PADRAO
       tag := 9999;

       Try
          PnlProgress.Visible := True;
          PnlProgress.BringToFront;

          tInicio := now;

          //ATUALIZAR SEQUENCIAL NA TMPDESC, RUBRICAINDIV E HSTBENEFBFCIARIO
          memResult.Lines.Add('---------------------------------------------------------------');
          memResult.Lines.Add('ANALISANDO E ATUALIZANDO HISTÓRICO DE BENEFÍCIOS.');
          memResult.Lines.Add('---------------------------------------------------------------');
          ssql := 'SELECT ROWID AS RWI ' + _clinefeed + // Andre Imakawa - SIG TIBERO  //Leandro - Oracle
          //ssql := 'SELECT TO_CHAR(ROWID) AS RWI ' + _clinefeed + // Andre Imakawa - SIG TIBERO //Leandro - Oracle
             'FROM HSTBENEFBFCIARIO H ' + _clinefeed +
             'WHERE IDLOTE IS NOT NULL ' + _clinefeed +
             'AND FLGENVIADO = 0 ' + _clinefeed +
             'AND MES = ' + quotedstr(sMesCobranca) + ' ' + _clinefeed +
             'AND NVL(IDSEQINTERNOFB,0) <= 0 ' + _clinefeed;
             //BRUNO AZEVEDO SOL 164085 KINTANA 1406577
                     //BRUNO AZEVEDO E MEROLA SOL 165198 KINTANA
          If chkResgate.Checked Then
             ssql:= ssql + 'AND IDLOTE IN (SELECT C.IDLOTE FROM CTRLINTERFACE C WHERE C.FLGRESGATE = 1)' + _clinefeed;

          If cboxIndividual.Checked Then
             ssql := ssql + 'AND EXISTS (SELECT 1 ' + _clinefeed +
                'FROM LISTAFOLHABENEFDET LD ' + _clinefeed +
                'WHERE H.IDTITULAR = LD.IDTITULAR ' + _clinefeed +
                'AND LD.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) + ') ' + _clinefeed;

          If FazQuery(qryaux1, ssql) Then
             AtualizaSeqInterno(qryaux1, qryaux2, 'HSTBENEFBFCIARIO');

          memResult.Lines.Add('---------------------------------------------------------------');
          memResult.Lines.Add('ANALISANDO E ATUALIZANDO RUBRICAS INDIVIDUAIS.');
          memResult.Lines.Add('---------------------------------------------------------------');
          ssql := 'SELECT ROWID AS RWI ' + _clinefeed + // Andre Imakawa - SIG TIBERO   //Leandro - Oracle
          //ssql := 'SELECT TO_CHAR(ROWID) AS RWI ' + _clinefeed + // Andre Imakawa - SIG TIBERO  //Leandro - Oracle
             'FROM RUBRICAINDIV R ' + _clinefeed +
             'WHERE FLGTPRUBMANUT = ''1'' ' + _clinefeed +
             'AND NVL(IDSEQINTERNOFB,0) <= 0 ' + _clinefeed;
             //BRUNO AZEVEDO SOL 164085 KINTANA 1406577
                     //BRUNO AZEVEDO E MEROLA SOL 165198 KINTANA
          If chkResgate.Checked Then
             ssql := ssql + 'AND IDLOTE IN (SELECT C.IDLOTE FROM CTRLINTERFACE C WHERE C.FLGRESGATE = 1)' + _clinefeed;

          If cboxIndividual.Checked Then
             ssql := ssql + 'AND EXISTS (SELECT 1 ' + _clinefeed +
                'FROM LISTAFOLHABENEFDET LD ' + _clinefeed +
                'WHERE R.IDTITULAR = LD.IDTITULAR ' + _clinefeed +
                'AND LD.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) + ') ' + _clinefeed;

          If FazQuery(qryaux1, ssql) Then
             AtualizaSeqInterno(qryaux1, qryaux2, 'RUBRICAINDIV');

          memResult.Lines.Add('---------------------------------------------------------------');
          memResult.Lines.Add('ANALISANDO E ATUALIZANDO LANÇAMENTOS AVULSOS.');
          memResult.Lines.Add('---------------------------------------------------------------');
          ssql := 'SELECT ROWID AS RWI ' + _clinefeed + // Andre Imakawa - SIG TIBERO  //Leandro - Oracle
          //ssql := 'SELECT TO_CHAR(ROWID) AS RWI ' + _clinefeed + // Andre Imakawa - SIG TIBERO  //Leandro - Oracle
             'FROM TMPDESC T ' + _clinefeed +
             'WHERE FLGDESCFOLHA = ''B'' ' + _clinefeed +
             'AND MESCOBRANCA = ' + quotedstr(sMesCobranca) + ' ' + _clinefeed +
             'AND NVL(IDSEQINTERNOFB,0) <= 0 ' + _clinefeed;
             //BRUNO AZEVEDO SOL 164085 KINTANA 1406577
                     //BRUNO AZEVEDO E MEROLA SOL 165198 KINTANA
          If chkResgate.Checked Then
             ssql := ssql + 'AND IDLOTE IN (SELECT C.IDLOTE FROM CTRLINTERFACE C WHERE C.FLGRESGATE = 1)' + _clinefeed;

          If cboxIndividual.Checked Then
             ssql := ssql + 'AND EXISTS (SELECT 1 ' + _clinefeed +
                'FROM LISTAFOLHABENEFDET LD ' + _clinefeed +
                'WHERE T.IDTITULAR = LD.IDTITULAR ' + _clinefeed +
                'AND LD.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) + ') ' + _clinefeed;

          If FazQuery(qryaux1, ssql) Then
             AtualizaSeqInterno(qryaux1, qryaux2, 'TMPDESC');

          //edilaine WO19556 : inicio
          //dtmContabil.AbreQryContabFinan;
          //dtmContabil.HabilitaControleListas := true;
          //dtmContabil.AlocaListas;

          dtmContabilPrevia.AbreQryContabFinan;
          dtmContabilPrevia.HabilitaControleListas := true;
          dtmContabilPrevia.AlocaListas;
          //edilaine WO19556 - fim

          //edilaine WO24218 : inicio
          if not chkETL.checked then
          begin
          mensagem.Update;
          memResult.Lines.Add('==================================================');
          memResult.Lines.Add('PRÉVIA DA FOLHA');
          memResult.Lines.Add('==================================================');
          memResult.Lines.Add('');
          end;
          //edilaine WO24218 : fim

          lstINDependentes := tstringlist.create; //SIG21958
          lstINTitular     := tstringlist.create; //SIG21958


          If SistemaFolha.FlgCalcPensAlimAntPrevia = 1 Then
             Begin
                ProcessaReajuste(sMesCobranca, memResult, Mensagem);
             End;


          VerificaDuplicidadeLotes;

          lExecutou1Vez := false;           //edilaine WO24218

          qryPreparosAnt.disablecontrols;
          //qryPreparosAnt.First; // SOL 248569 PPM 669718
          qryPreparosAnt.filter:='flgEnviar = 1';// SOL 248569 PPM 669718
          qryPreparosAnt.filtered:=true;// SOL 248569 PPM 669718
          While Not qryPreparosAnt.Eof Do
             Begin
                If (qryPreparosAnt.FieldByName('flgEnviar').AsInteger = 1) Then
                   Begin
                      //edilaine WO24218 : inicio
                      if not chkETL.checked then
                      begin

                      ssql := 'SELECT NVL(CTL.FLGTIPOFOLHA,0) FLGTIPOFOLHA, HST.MES, ' + _clinefeed;
                      ssql := ssql +
                         ' DECODE (CTL.FLGRESGATE,1,0,NVL(PF.FLGMOLESTIAGRAVE, 0)) AS FLGMOLESTIAGRAVE, ' + _clinefeed +
                         // Andre Imakawa - SIG 115439 - Inicio
                         //'DECODE(DECODE (CTL.FLGRESGATE,1,0,NVL(PF.FLGMOLESTIAGRAVE,0)), 1, 1, DECODE (CTL.FLGRESGATE,1,0,NVL(PF.FLGISENTOIRRF,0))) AS FLGISENTOIRRF, ' + _clinefeed +
                         'DECODE(NVL(PF.FLGMOLESTIAGRAVE,0), 1, 1, NVL(PF.FLGISENTOIRRF,0)) AS FLGISENTOIRRF, ' + _clinefeed +
                         // Andre Imakawa - SIG 115439 - Fim
                         'BEN.FLGDESTBENEF, ' + _clinefeed +
                         'HST.MESREFERENCIA, ' + _clinefeed +
                         'HST.IDPESSJUR,HST.IDPLANOPREV, HST.IDPESSOA, HST.IDTITULAR, ' + _clinefeed +
                         'NVL(BBF.PLACONTAC, '''') AS PLACONTAC, ' + _clinefeed +
                         'NVL(BBF.PLACONTAD, '''') AS PLACONTAD, ' + _clinefeed +
                         'NVL(BBF.IDPLANPREVCONTAB,HST.IDPLANOPREV) AS IDPLANOCONTABIL, ' + _clinefeed +
                         'HST.SEQPROPOSTA, HST.IDBENEFICIO, HST.IDMOTIVO, ' + _clinefeed +
                         'NVL(HST.IDPLANOORIGEM,HST.IDPLANOPREV) AS IDPLANOORIGEM, ' + _clinefeed +
                         'NVL(HST.SEQBENEFICIO,1) AS SEQBENEFICIO, ' + _clinefeed +
                         'HST.NUMEROPROCESSO,HST.IDLOTE, ' + _clinefeed +
                         'HST.FLGDEVOLUCAO, HST.VALORPREV, HST.VALORPREVMIN, CTL.FLGCONCESSAO, ' + _clinefeed +
                         'HST.FLGCONCESSAO AS FLGCONCESSAOHST, ' + _clinefeed +
                         'HST.DATAPAGAMENTO, BTP.IDRESPONSAVEL, BEN.NUMORDEMEVENTO, HST.VALORTOTAL, ' + _clinefeed +
                         ' DECODE(BEN.FLGDESTBENEF, ''E'', NVL(BTP.IDRESPONNAOREC,0), 0) AS IDRESPONNAOREC, ' + _clinefeed +
                         'BTP.CODTIPORECEBEDOR, PREC.NOME AS NOMERESP, ' + _clinefeed +
                         'NVL(BBF.FLGDESCIRMES,0) FLGDESCIRMES, ' + _clinefeed +
                         'NVL(PF.FLGSOMAIRSUPINSS,0) FLGSOMAIRSUPINSS, ' + _clinefeed +
                         'DECODE(BTP.IDRESPONSAVEL,null,HST.IDPESSOA,BTP.IDRESPONSAVEL) RESPONSAVEL, ' + _clinefeed +
                         'BPP.IDRUBRICA, BPP.IDRUBABONO, ' + _clinefeed +
                         'BPP.IDRUBRICAQUITANT, ' + _clinefeed +
                         'BPP.IDRUBANTECABONO, ' + _clinefeed +
                         'BPP.IDRUBACJUD, BPP.IDRUBATRACJUD, BPP.IDRUBDEVACJUD, BPP.IDRUBREVACJUD, ' + _clinefeed +
                         'BPP.IDRUBADTACJUD, BPP.IDRUBDADACJUD, BPP.IDRUB13ACJUD, BPP.IDRUB13DESACJUD, ' + _clinefeed +
                         'BPP.IDRUB13PGAN1ACJUD, BPP.IDRUB13DVANACJUD, BPP.IDRUB13ADTACJUD, BPP.IDRUB13DADACJUD, ' + _clinefeed +

    //                     'IDRUBATRREVISAO, IDRUBDEVANTABONO, IDRUBATRREVACJUD, ' + _clinefeed +  //Everson TIBERO
    //                     'IDRUBDEVREVACJUD, IDRUBDEVREVISAO, IDRUBATRASOABONO, ' + _clinefeed +  //Everson TIBERO
    //                     'IDRUBATR13ACJUD, IDRUBDEV13ACJUD, IDRUBACERTOABONO, ' + _clinefeed +   //Everson TIBERO

                         'BPP.IDRUBATRREVISAO, BPP.IDRUBDEVANTABONO, BPP.IDRUBATRREVACJUD, ' + _clinefeed + //Everson TIBERO
                         'BPP.IDRUBDEVREVACJUD, BPP.IDRUBDEVREVISAO, BPP.IDRUBATRASOABONO, ' + _clinefeed + //Everson TIBERO
                         'BPP.IDRUBATR13ACJUD, BPP.IDRUBDEV13ACJUD, BPP.IDRUBACERTOABONO, ' + _clinefeed +  //Everson TIBERO

                         'NVL(HST.FLGTIPOREGISTRO,0) AS FLGTIPOREGISTRO, ' +
                         'BPP.FLGREFERENCIA,BPP.IDRUBDEVOLUCAO,BPP.IDRUBDEVOLABONO,BPP.IDREGRACALCABONO, ' + _clinefeed +
                         'BPP.FLGACEITAZERO, ' + _clinefeed +
                         'BPP.IDRUBADIANT, BPP.IDRUBDEVOLADIANT, BPP.IDRUBADIANT13, BPP.IDRUBDEVADIANT13, ' + _clinefeed +
                         'NVL(BBF.FLGPROVISORIO,0) FLGPROVISORIO, BBF.DATALIBERACAO, BBF.MESPAGLIBERACAO, ' + _clinefeed +
                         'BBF.DATACONCESSAO, ' + _clinefeed +
                         'BPP.IDRUBRICAATRASO, BPP.IDRUBRICACORRECAO, BPP.FLGCALCTODOMES, ' + _clinefeed +
                         //PEGA DATA ATUAL COMO DATA DE NASCIMENTO CASO ESTEJA NULA
                      'PROC.DTDIREITO, PF.DATANASC, ' + _clinefeed +
                         'NVL(PF.FLGMOLESTIAGRAVE,0) AS FLGMOLESTIAGRAVE, ' + _clinefeed +
                         'NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF,PAT.IDFUNDACAO, ' + _clinefeed +
                         'NVL(PF.NUMDEPSALF,0) AS NUMDEPSALF, ' + _clinefeed +
                         'BPP.INDICEREAJBENEF, 0 AS CODMOEDA,PES.NOME,HST.FONTEPAGADORA, ' + _clinefeed +
                         'DECODE(NVL(PF.FLGMOLESTIAGRAVE,0), 1, 1, NVL(PF.FLGISENTOIRRF,0)) AS FLGISENTOIRRF, ' + _clinefeed +
                         'BPP.FLGPAGAINSS, BEN.FLGRESGATE, HST.CODPORTFORMA, ' + _clinefeed +
                         'BBF.DATAREQUERIMENTO, BBF.DFLOATPAGTO, ' + _clinefeed +
                         'NVL(BBF.DATAINICIOFUND, BBF.DATAINICIO) AS DATADIB, ' + _clinefeed +
                         //PASSAR ESTES CAMPOS PARA REGRA DE ULTIMO PAGAMENTO
                   //  EXECUTADA APÓS A REGRA DE BENEFICIO MINIMO
                      'BBF.DATAINICIO, BBF.DATAFINAL, BBF.DATAFINALPREVISTA, ' + _clinefeed +
                         //COLOCAR ZERO SE FLGBENEFMIN É NULO
                   //  EXECUTADA APÓS A REGRA DE BENEFICIO MINIMO
                      'BBF.IDSITBENEFICIO, BPP.FLGABONOFINALBEN, ' +
                         'BPP.FLGPOSSUIABONO, ' +
                         'NVL(BBF.FLGBENEFMIN,0) AS FLGBENEFMIN, ' + _clinefeed +
                         'BBF.VLRINFINSS, BBF.NUMPROCINSS, ' + _clinefeed +
                         'PP.IDSITPART, PP.IDSITPLANOPREV, ' + _clinefeed +
                         'PF.DATAFIMMOLESTIA, ' + _clinefeed +
                         'PF.DATAMOLESTIAGRAVE, ' + _clinefeed + // SOL 214520 - KTN 2042434
                         'HST.FLGPROVISORIO, ' + _clinefeed +
                         'BEN.TIPOBENEFICIO, ' + _clinefeed +
                         'TPB.FLGFREQUENCIA, ' + _clinefeed +
                         'EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3, ' + _clinefeed +
                         'EL.VALORBASE4, EL.VALORBASE5, EL.VALORBASE6, ' + _clinefeed +
                         'DECODE(BBF.IDTITULAR,BBF.IDPESSOA,NVL(BPART.VALORBASE1,0),NVL(BBF.VALORBASE1,0)) AS VALORBASEBEN1, ' + _clinefeed +
                         'DECODE(BBF.IDTITULAR,BBF.IDPESSOA,NVL(BPART.VALORBASE2,0),NVL(BBF.VALORBASE2,0)) AS VALORBASEBEN2, ' + _clinefeed +
                         'DECODE(BBF.IDTITULAR,BBF.IDPESSOA,NVL(BPART.VALORBASE3,0),NVL(BBF.VALORBASE3,0)) AS VALORBASEBEN3, ' + _clinefeed +
                         'CIRRF.IDCOMPIRRF, ' + _clinefeed +
                         'CIRRF.ANOMESINICIO, ' + _clinefeed +
                         'CIRRF.ANOMESFIM, ' + _clinefeed +
                         'CIRRF.COMPTOTAL-CIRRF.SALDOCOMP AS SALDOACOMP, ' + _clinefeed +
                         'UPPER(NVL(NVL(PA.CODINTERNACIONAL,SUBSTR(PA.NOMEPAIS,1,3)),''BRA'')) AS CODPAIS, ' + _clinefeed +
                         'NVL(PP.FLGFITESPECIAL,0) AS FLGFITESPECIAL, ' + _clinefeed +
                         'HST.IDSEQINTERNOFB, ' + _clinefeed +
                         'PL.MESPGABONO, ' + _clinefeed +
                         //'PP.TIPOOPCAOIR, ' + _clinefeed +  // WO20725 - Leandro
                         'DECODE(HST.IDTITULAR,HST.IDPESSOA,PP.TIPOOPCAOIR,BTP.TIPOOPCAOIR) AS TIPOOPCAOIR, ' + _clinefeed +   // WO20725 - Leandro
                         //edilaine - SIG71773 - inicio
                         'BEN.FLGIRREGRESSIVO, BEN.FLGPORTADO, EL.MATRICULA, ' + _clinefeed +
                         //edilaine - SIG71773 - fim
                         'BPP.TPMODALIDADE, ' + _clinefeed +
                         'EL.IDSITFUNC, EL.TEMPOSERVTOTAL, HST.VALORTOTAL, BPP.IDREGRAULTPAGTO, ' + _clinefeed +
                         'HST.MESCOMPREEM ' + _clinefeed + //SOL 140042 Kintana 900220

                         ', PPAR.VALOR NaoMoraNoBrasil ' + _clinefeed  + //William Santana - SOL 251048.17830 - PPM 1115143
                         ', BEN.FLGDESTBENEF ' + _clinefeed  + //Andre Imakawa - SIG25700

                         //edilaine SIG136670 : inicio
                         ', (SELECT PP.VALOR       ' + _clinefeed  +
                         '         FROM PESSOAPARAM     PP   ' + _clinefeed  +
                         '         JOIN PARAMFLAGPESSOA PF   ' + _clinefeed  +
                         '           ON PF.IDPARAM = PP.IDPARAM  ' + _clinefeed  +
                         '        WHERE PF.DESCRICAO = ''SEM DESCONTO SIMPLIF. BASE IR'' ' + _clinefeed  +
                         '          AND PP.IDPESSOA  = HST.IDPESSOA ' + _clinefeed  +
                         '          AND PP.DATAINICIO <= TO_DATE('+QuotedStr(edDataFolha.Text)+', ''DD/MM/YYYY'') ' + _clinefeed  +
                         '          AND (PP.DATAFIM >= TO_DATE('+QuotedStr(edDataFolha.Text)+', ''DD/MM/YYYY'')   ' + _clinefeed  +
                         '           OR PP.DATAFIM IS NULL)) AS FLGNAOAPLICADEDSIMP_IRRF '+ _clinefeed  +
                         //edilaine SIG136670 : fim

                         // Andre Imakawa - SIG 49800-60759 - Inicio
                         ', (SELECT COUNT(1) AS QTD' + _clinefeed  +
                         '  FROM HISTISENCAOIRRFBENF HIB' + _clinefeed  +
                         ' WHERE HIB.IDPLANOPREV = HST.IDPLANOPREV' + _clinefeed  +
                         '   AND HIB.IDBENEFICIO = HST.IDBENEFICIO' + _clinefeed  +
                         '   AND HIB.NUMEROPROCESSO = HST.NUMEROPROCESSO' + _clinefeed  +
                         '   AND HIB.IDPESSJUR = HST.IDPESSJUR' + _clinefeed  +
                         '   AND HIB.IDTITULAR = HST.IDTITULAR' + _clinefeed  +
                         '   AND HIB.IDPLANOORIGEM = HST.IDPLANOORIGEM' + _clinefeed  +
                         '   AND HIB.IDPESSOA = HST.IDPESSOA' + _clinefeed  +
                         '   AND HIB.SEQPROPOSTA = HST.SEQPROPOSTA' + _clinefeed  +
                         '   AND HIB.DTINICIO <= ' + pStr(sMesCobranca) + _clinefeed  +
                         '   AND (HIB.DTFIM IS NULL OR HIB.DTFIM >= ' + pStr(sMesCobranca) + ' )) AS BENEF_ISENTO' + _clinefeed  +
                         // Andre Imakawa - SIG 49800-60759 - Fim
                         ', BBF.QTDEPARCELAS ' + _clinefeed  + //Andre Imakawa - SIG26149
                         ' FROM HSTBENEFBFCIARIO HST, PESSOA PES, PESSOAFISICA PF, PATRO PAT, ' + _clinefeed +
                         'BENEFPLANPREV BPP, BENEFPLANPATRO BPPAT, CTRLINTERFACE CTL, ' + _clinefeed +
                         'BFCIARIOTITPLAN BTP, ' + _clinefeed +
                         'TPPAGTOBENEFICIO TPB, ' + _clinefeed +
                         'BENEFBFCIARIO BBF, PARTPREVPLAN PP, ELEGPATRO EL, ' + _clinefeed +
                         'PESSOA PREC, ' + _clinefeed +
                         'PLANPREV PL, ' + _clinefeed +
                         'BENEFPLANOPART BPART, COMPENSAIRRF CIRRF, ' + _clinefeed +
                         'ENDPESS EN, CIDADES CI, ESTADO ES, PAIS PA, ' + _clinefeed +
                         'PESSOAPARAM PPAR, ' + _clinefeed  + //William Santana - SOL 251048.17830 - PPM 1115143
                         'PROCESSOBENEF PROC, BENEFICIO BEN' + _clinefeed;

                      sSql := sSql +
                         ' WHERE (HST.FLGENVIADO=0) ' + _clinefeed +
                         ' AND (HST.IDLOTE = ' + qryPreparosAnt.FieldByName('IdLote').AsString + ') ' + _clinefeed +
                         ' AND ((HST.MESREFERENCIA <= ' + pStr(sMesCobranca) + ') or ' + _clinefeed +
                         ' (HST.MESREFERENCIA  = ' + pStr(sMesAbono) + ' )) ' + _clinefeed +
                         ' AND (HST.MES <= ' + pStr(sMesCobranca) + ') ' + _clinefeed;

                      If cboxIndividual.Checked Then
                         Begin
                            If frameBenef.qryLista.recordcount > 100 Then
                               Begin
                                  ssql := ssql +
                                     'AND EXISTS (SELECT 1 ' + _clinefeed +
                                     'FROM LISTAFOLHABENEFDET LD ' + _clinefeed +
                                     'WHERE HST.IDTITULAR = LD.IDTITULAR ' + _clinefeed +
                                     'AND LD.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) + ') ' + _clinefeed;
                               End
                            Else
                               Begin
                                  frameBenef.qryLista.disablecontrols;
                                  frameBenef.qryLista.first;
                                  lsLista := '';
                                  While Not frameBenef.qryLista.eof Do
                                     Begin
                                        lsLista := lsLista + frameBenef.qryLista.fieldbyname('IDTITULAR').asstring + ',';
                                        frameBenef.qryLista.next;
                                     End;
                                  If lsLista <> '' Then
                                     delete(lsLista, length(lsLista), 1);
                                  ssql := ssql +
                                     'AND HST.IDTITULAR IN (' + lsLista + ')' + _clinefeed;
                                  frameBenef.qryLista.enablecontrols;
                               End;
                         End;

                      sSql := sSql +
                         ' AND (HST.DTEFETPGTO IS NULL) ' + _clinefeed +
                         ' AND (HST.VLBENEFPGTO IS NULL) ' + _clinefeed +
                         ' AND (HST.IDLOTE = CTL.IDLOTE)' + _clinefeed +
                         ' AND (HST.VALORPREV >= 0 OR NVL(BPP.FLGACEITAZERO,0)=1)' + _clinefeed +
                         ' AND (BEN.IDBENEFICIO = HST.IDBENEFICIO) ' + _clinefeed +
                         'AND (PL.IDPLANOPREV = HST.IDPLANOPREV) ' + _clinefeed +
                         ' AND (BTP.IDPESSJUR = HST.IDPESSJUR) ' + _clinefeed +
                         ' AND (BTP.IDPLANOPREV = HST.IDPLANOPREV) ' + _clinefeed +
                         ' AND (BTP.IDPLANOORIGEM = HST.IDPLANOORIGEM) ' + _clinefeed +
                         ' AND (BTP.IDPESSOA = HST.IDPESSOA) ' + _clinefeed +
                         ' AND (BTP.SEQPROPOSTA = HST.SEQPROPOSTA) ' + _clinefeed +
                         ' AND (BTP.IDTITULAR = HST.IDTITULAR) ' + _clinefeed +
                         ' AND (BTP.IDBENEFICIO = HST.IDBENEFICIO) ' + _clinefeed +
                         ' AND (BPART.IDPESSJUR(+) = HST.IDPESSJUR) ' + _clinefeed +
                         ' AND (BPART.IDPLANOPREV(+) = HST.IDPLANOPREV) ' + _clinefeed +
                         ' AND (BPART.IDPESSOA(+) = HST.IDPESSOA) ' + _clinefeed +
                         ' AND (BPART.SEQPROPOSTA(+) = HST.SEQPROPOSTA) ' + _clinefeed +
                         ' AND (BPART.IDBENEFICIO(+) = HST.IDBENEFICIO) ' + _clinefeed +
                         ' AND (CIRRF.IDPESSOA(+) = BTP.IDRESPONSAVEL) ' + _clinefeed +
                         ' AND (EN.IDPESSOA(+) = PREC.IDPESSOA) ' + _clinefeed +
                         ' AND NVL(PREC.IDENDRESIDENCIAL, PREC.IDENDCORRESP) = EN.IDENDERECO(+) ' + _clinefeed +
                         ' AND (CI.IDCIDADES(+) = EN.IDCIDADES) ' + _clinefeed +
                         ' AND (ES.IDESTADO(+) = CI.IDESTADO) ' + _clinefeed +
                         ' AND (PA.IDPAIS(+) = ES.IDPAIS) ' + _clinefeed +
                         ' AND (BPP.IDPLANOPREV = HST.IDPLANOPREV) ' + _clinefeed +
                         ' AND (BPP.IDBENEFICIO = HST.IDBENEFICIO) ' + _clinefeed +
                         //TRATAMENTO BENEFICIO REFERENCIA
                      ' AND (   (BPP.FLGREFERENCIA IS NULL) ' + _clinefeed +
                         ' OR (BPP.FLGREFERENCIA = 0) ' + _clinefeed +
                         ' OR ((BPP.FLGREFERENCIA = 1) AND (BPP.FLGPAGAINSS = 1))) ' + _clinefeed +
                         ' AND (BBF.NUMEROPROCESSO = HST.NUMEROPROCESSO) ' + _clinefeed +
                         ' AND (BBF.IDPESSOA = HST.IDPESSOA) ' + _clinefeed +
                         ' AND (BBF.IDPESSJUR = HST.IDPESSJUR) ' + _clinefeed +
                         ' AND (BBF.IDPLANOPREV = HST.IDPLANOPREV) ' + _clinefeed +
                         ' AND (BBF.IDTITULAR = HST.IDTITULAR) ' + _clinefeed +
                         ' AND (BBF.IDBENEFICIO = HST.IDBENEFICIO) ' + _clinefeed +
                         ' AND (BBF.SEQPROPOSTA = HST.SEQPROPOSTA) ' + _clinefeed +
                         ' AND (BBF.IDPLANOORIGEM = HST.IDPLANOORIGEM) ' + _clinefeed +
                         ' AND (TPB.IDTPPAGTOBENEFIC = BBF.IDTPPAGTOBENEFIC) ' + _clinefeed +
                         ' AND (PP.IDPESSOA = HST.IDTITULAR) ' + _clinefeed +
                         ' AND (PP.IDPESSJUR = HST.IDPESSJUR) ' + _clinefeed +
                         'AND ( (HST.IDPLANOPREV = PP.IDPLANOPREV AND HST.IDPESSOA = HST.IDTITULAR) ' + _clinefeed +
                         'OR (HST.IDPLANOORIGEM = PP.IDPLANOPREV AND HST.IDPESSOA <> HST.IDTITULAR) ) ' + _clinefeed +
                         ' AND (EL.IDPESSOA = HST.IDTITULAR) ' + _clinefeed +
                         ' AND (EL.IDPESSJUR = HST.IDPESSJUR) ' + _clinefeed +
                         ' AND (PROC.NUMEROPROCESSO = HST.NUMEROPROCESSO) ' + _clinefeed +
                         ' AND (BPPAT.IDPESSJUR(+) = HST.IDPESSJUR) ' + _clinefeed +
                         ' AND (BPPAT.IDPLANOPREV(+) = HST.IDPLANOPREV) ' + _clinefeed +
                         ' AND (BPPAT.IDBENEFICIO(+) = HST.IDBENEFICIO) ' + _clinefeed +
                         ' AND (PF.IDPESSOA = BTP.IDRESPONSAVEL) ' + _clinefeed + // DATA DE NASCIMENTO DO RESPONSAVEL
                      'AND (PREC.IDPESSOA = BTP.IDRESPONSAVEL) ' + _clinefeed +
                         ' AND (PAT.IDPESSOA = HST.IDPESSJUR) ' + _clinefeed +
                         ' AND (PAT.IDFUNDACAO = ' + inttostr(iidfundacao) + ') ' + _clinefeed +
                         ' AND (PES.IDPESSOA = HST.IDPESSOA) ' + _clinefeed;

                         //Início - William Santana - SOL 251048.17830 - PPM 1115143
                     ssql := ssql + ' AND (PPAR.IDPESSOA(+) = HST.IDPESSOA)'  + _clinefeed +
                         ' AND (PPAR.IDPARAM(+) = 210 )'  + _clinefeed +
                         ' AND (TO_DATE(NVL(TO_CHAR(PPAR.DATAINICIO(+),''YYYY/MM''),HST.MES),''YYYY/MM'') <= TO_DATE(HST.MES, ''YYYY/MM''))'  + _clinefeed +
                         ' AND (TO_DATE(NVL(TO_CHAR(PPAR.DATAFIM(+),''YYYY/MM''),HST.MES),''YYYY/MM'') >= TO_DATE(HST.MES, ''YYYY/MM''))'  + _clinefeed ;
                          //Término - William Santana - SOL 251048.17830 - PPM 1115143

                      ssql := ssql + ' ORDER BY HST.IDTITULAR, ' + _clinefeed +
                         'RESPONSAVEL, HST.IDPESSOA, HST.FLGDEVOLUCAO, HST.MES, ' + _clinefeed +
                         //COLOCA O FLGREFERENCIA NO ORDER BY PARA TRATAR A FONTE PAGADORA DEFAULT NA PREVIA
                      'HST.MESREFERENCIA, BPP.FLGREFERENCIA, BPP.IDRUBRICA ' + _clinefeed;

                      dtmFolhaPrevia.qryPrevia.Close;
                      dtmFolhaPrevia.qryPrevia.SQL.Clear;
                      dtmFolhaPrevia.qryPrevia.SQL.Add(sSQL);
                      Try
                         dtmFolhaPrevia.qryPrevia.Open;
                      Except
                         On E: EDBEngineError Do
                            Begin
                               bglobalErro := True;
                               memResult.Lines.Add('Erro na leitura de Benefícios a pagar. Lote: ' +
                                  qryPreparosAnt.FieldByName('IdLote').AsString);
                               memResult.Lines.Add('Mensagem de erro : ' + E.message);
                               memResult.Lines.Add('--------------------------------------------------------------');
                               qryPreparosAnt.Next;
                               continue;
                            End;
                      End;

                      dtmFolhaPrevia.qryPrevia.First;

                      If (dtmFolhaPrevia.GetCtrlInterface(qryPreparosAnt.FieldByName('IDLOTE').AsInteger) = 1) And
                         (Not cboxIndividual.Checked) Then
                         Begin
                            mrOpcaoPrevia := MsgDlg('Essa prévia referente ao lote ' +
                               qryPreparosAnt.FieldByName('IDLOTE').AsString +
                               ' não está completa,' + #13 +
                               ' [Sim] Para começar de onde parou ' + #13 +
                               ' [Não] Fazer a prévia completa ' + #13 +
                               ' [Cancelar] Não fazer a prévia', 'Informação',
                               mtInformation, [mbYes, mbNo, mbCancel], 0);

                            Case mrOpcaoPrevia Of
                               mrYes: Begin
                                     iUltDTitularPrevia := dtmFolhaPrevia.LocalizaUltIDTitularPrevia(qryPreparosAnt.FieldByName('IDLOTE').AsInteger);
                                     iUltDPessoaPrevia  := dtmFolhaPrevia.LocalizaUltIDPessoaPrevia(qryPreparosAnt.FieldByName('IDLOTE').AsInteger);// SOL 242624/17054 Kintana 715180
                                     dtmFolhaPrevia.qryPrevia.Locate('IDLOTE; IDTITULAR', VarArrayOf([qryPreparosAnt.FieldByName('IDLOTE').AsString, IntToStr(iUltDTitularPrevia)]), []);
                                     //ApagaPreviaEfetivacaoPessoa(qryPreparosAnt.FieldByName('IdLote').AsInteger, iUltDTitularPrevia); // SOL 242846 PPM 579506
                                     if not(ApagaPreviaEfetivacaoPessoa(qryPreparosAnt.FieldByName('IdLote').AsInteger, iUltDTitularPrevia, iUltDPessoaPrevia)) then  // SOL 242846 PPM 579506 // // SOL 242624/17054 Kintana 715180
                                     begin
                                        memResult.Lines.Add('Erro na SP_APAGAPREVIA ao tentar apagar a Prévia. Lote: ' +
                                        qryPreparosAnt.FieldByName('IdLote').AsString);
                                        memResult.Lines.Add('--------------------------------------------------------------');
                                     end;
                                  End;
                               //mrNo: ApagaPreviaEfetivacao(qryPreparosAnt.FieldByName('IdLote').AsString, true); // SOL 242846 PPM 579506
                               mrNo: if not(ApagaPreviaEfetivacao(qryPreparosAnt.FieldByName('IdLote').AsString,true)) then // SOL 242846 PPM 579506
                               begin
                                  memResult.Lines.Add('Erro na SP_APAGAPREVIA ao tentar apagar a Prévia. Lote: ' +
                                  qryPreparosAnt.FieldByName('IdLote').AsString);
                                  memResult.Lines.Add('--------------------------------------------------------------');
                               end;
                               mrCancel: Exit;
                            End;
                         End
                      Else
                         Begin
                            if not(chkDivideLista.checked) or  ((chkapagaprevia.checked) and (chkDivideLista.checked)) or
                               ((chkDivideLista.checked) and (qrycontrole.FieldByName('FLGPROCESSADO').AsInteger = 1)) then
                              //APAGA A PREVIA RELACIONADA AO LOTE MESMO QUE A QRYPRINCIPAL ESTEJA VAZIA.
                              If Not cboxIndividual.Checked Then
                              begin
                                 //ApagaPreviaEfetivacao(qryPreparosAnt.FieldByName('IdLote').AsString, true) // SOL 242846 PPM 579506
                                 if not(ApagaPreviaEfetivacao(qryPreparosAnt.FieldByName('IdLote').AsString,true)) then // SOL 242846 PPM 579506
                                 begin
                                    memResult.Lines.Add('Erro na SP_APAGAPREVIA ao tentar apagar a Prévia. Lote: ' +
                                    qryPreparosAnt.FieldByName('IdLote').AsString);
                                    memResult.Lines.Add('--------------------------------------------------------------');
                                 end;
                              end
                              Else
                                 //APAGA PREVIA DA LISTA DO USUARIO
                                 //ApagaPreviaEfetivacaoLista(qryPreparosAnt.FieldByName('IdLote').AsString); // SOL 242846 PPM 579506
                                 if not(ApagaPreviaEfetivacaoLista(qryPreparosAnt.FieldByName('IdLote').AsString)) then  // SOL 242846 PPM 579506
                                 begin
                                    memResult.Lines.Add('Erro na SP_APAGAPREVIA ao tentar apagar a Prévia. Lote: ' +
                                    qryPreparosAnt.FieldByName('IdLote').AsString);
                                    memResult.Lines.Add('--------------------------------------------------------------');
                                    // Andre Imakawa - SIG 80669 - Inicio
                                    bPossuiErro := True;
                                    qryPreparosAnt.Next;
                                    continue;
                                    // Andre Imakawa - SIG 80669 - Fim
                                 end;
                         End;

                      If dtmFolhaPrevia.qryPrevia.IsEmpty Then
                         Begin
                            memResult.Lines.Add('Não existem Benefícios a pagar. Lote: ' +
                               qryPreparosAnt.FieldByName('IdLote').AsString);
                            memResult.Lines.Add('--------------------------------------------------------------');
                            dtmFolhaPrevia.qryPrevia.Close;
                            qryPreparosAnt.Next;
                            continue;
                         End;

                      Mensagem.Caption := 'Processando Cálculo. Lote: ' +
                         qryPreparosAnt.FieldByName('IdLote').AsString;
                      mensagem.Update;

                      memResult.Lines.Add('PROCESSAMENTO DO LOTE: ' + qryPreparosAnt.FieldByName('IdLote').AsString);
                      memResult.Lines.Add('---------------------------------------------------------------');
                      end;
                      //edilaine WO24218 : fim

                      If (Not chkUsaPrevisaoPagto.Checked) Then
                         Begin
                            If (qryPreparosAnt.FieldByName('DATAPAGAMENTO').AsDateTime < edDataFolha.Date) Then
                               dtmFolhaPrevia.SetaDataPagamento(edDataFolha.date, smespagamento, sMesAbono)
                            Else
                               dtmFolhaPrevia.SetaDataPagamento(qryPreparosAnt.FieldByName('DATAPAGAMENTO').AsDateTime, smespagamento, sMesAbono);
                         End
                      Else
                         dtmFolhaPrevia.SetaDataPagamento(edDataFolha.date, smespagamento, sMesAbono);

                      If (Not cboxIndividual.Checked) Then
                         Begin
                            If Not dtmBaseDados.dbBaseDados.InTransaction Then
                            begin
                               dtmBaseDados.dbBaseDados.StartTransaction;
                            end;
                            //dtmFolhaPrevia.SetCtrlInterface(1, dtmFolhaPrevia.qryPrevia.FieldByName('IDLOTE').AsInteger);  //edilaine WO24218
                            dtmFolhaPrevia.SetCtrlInterface(1, qryPreparosAnt.FieldByName('IDLOTE').AsInteger);              //edilaine WO24218

                            dtmBaseDados.dbBaseDados.Commit;
                            dtmBaseDados.dbBaseDados.StartTransaction;
                         End;


                      dtmFolhaPrevia.bFolhaResgate := chkResgate.Checked; //Renato Visoni SOL 138157 Kintana 840763

                      //edilaine WO19556 : inicio
                      if cboxIndividual.checked then
                        iIdListaAux := framebenef.ListaUsuario
                      else
                        iIdListaAux := -1;
                      //edilaine WO19556 : fim

                      //edilaine WO24218 : inicio
                      if (chkETL.checked) then
                      begin
                        if not lExecutou1Vez then
                        begin
                          lExecutou1Vez := true;
                          bPossuiErro := not ProcessaPreviaETL();
                        end;
                      end
                      else
                      begin
                      // Andre Imakawa - SIG 80669 - Inicio
                      bPrevia := dtmFolhaPrevia.ProcessaPrevia(SistemaFolha.FLGTRATALOTEINDEPENDENTE = 1,
                                                                 cboxIndividual.Checked, bErroInserePrevia,
                                                                 iIdListaAux      //edilaine WO19556
                                                                );

                      if bErroInserePrevia then
                      begin
                        bPossuiErro := true;
                      end;
                      // Andre Imakawa - SIG 80669 - Fim

                      If bPrevia Then
                         memResult.Lines.Add('Prévia da Folha de Benefícios efetuado com sucesso.')
                      Else
                         memResult.Lines.Add('Prévia da Folha de Benefícios efetuado com problemas.');

                      //memResult.Lines.Add('---------------------------------------------------------------');
                      memResult.Lines.Add('Total de Rubricas processadas: ' + inttostr(dtmFolhaPrevia.lContador));
                      end;
                      //edilaine WO24218 : fim


                      If (qryPreparosAnt.FieldByName('IdLote').AsString <> '') And (sTodasPessoas = '') Then
                         Begin

                           //BRUNO AZEVEDO SOL 136627 KINTANA 820014
                           try
                             xQryUpd := TwwQuery.Create(nil);
                             with xQryUpd do begin
                               DataBaseName := 'BaseDados';

                               //BUSCA VALOR DO LOTE
                               // SOL 242740 PPM 575822
                               Close;
                               Sql.Clear;
                               Sql.Add('SELECT SUM(DECODE(flgdesconto,0,valorprovento,-valorprovento)) valor, COUNT(DISTINCT IDRESPONSAVEL) qtd ');
                               Sql.Add('  FROM previa');
                               Sql.Add(' WHERE mescobranca = '+QuotedStr(sMesCobranca));
                               Sql.Add('   AND idlote = '+qryPreparosAnt.FieldByName('IdLote').AsString+'');
                               Sql.Add('   AND flgdesconto IN (0,1)');
                               Open;
                               vValor := FieldByName('valor').AsString;

                               // Andre Imakawa - SIG 136670 - Inicio
                               if vValor = '' then
                                 vValor := '0';
                               // Andre Imakawa - SIG 136670 - Fim

                               vQtd := IntToStr(FieldByName('qtd').AsInteger)
                               // SOL 242740 PPM 575822
                             end;
                           finally
                             FreeAndNil(xQryUpd);
                           end;
                           //BRUNO AZEVEDO SOL 136627 KINTANA 820014

                            //ACERTANDO A FLGIDATMP DA CTRLINTERFACE
                            sSQL := ' UPDATE CTRLINTERFACE CI' +
                               ' SET FLGIDATMP = 1,          ' +
                               ' VLRTOTAL      = '+StringReplace(vValor,',','.',[])+', ' + //BRUNO AZEVEDO SOL 136627 KINTANA 820014
                               ' NUMREG        = '+vQtd+',   ' + //BRUNO AZEVEDO SOL 136627 KINTANA 820014
                               ' IDSITPREVIA   = 0,          ' +
                               ' DATAIDATMP = SYSDATE';
                            sSQL := sSQL + ' WHERE (IDLOTE = ' + qryPreparosAnt.FieldByName('IdLote').AsString + ')';
                            qryAux1.Close;
                            qryAux1.SQL.Clear;
                            qryAux1.SQL.Add(sSQL);
                            Try
                               qryAux1.ExecSQL;
                            Except
                               On E: EDBEngineError Do
                                  Begin
                                     MostrarErro(E);
                                     memResult.Lines.Add('Erro na gravação do Controle de Interface. Lote: ' +
                                        qryPreparosAnt.FieldByName('IdLote').AsString);
                                     memResult.Lines.Add('Mensagem de erro : ' + E.message);
                                  End;
                            End;
                         End;
                      If dtmBaseDados.dbBaseDados.InTransaction Then
                      begin
                         dtmBaseDados.dbBaseDados.Commit;
                      end;
                      //edilaine WO24218 : inicio
                      if not chkETL.checked then
                      memResult.Lines.Add('-------------------------------------------------------');
                   End;

                  //edilaine WO24218 : inicio
                  if not chkETL.checked then
                  begin
                   dtmFolhaPrevia.lContadorTotal := dtmFolhaPrevia.lContadorTotal + dtmFolhaPrevia.lContador;// SOL 252343/17434 PPM 874741
                   dtmFolhaPrevia.lContadorRespTotal  := dtmFolhaPrevia.lContadorRespTotal + StrToIntDef(vQtd,0);// SOL 252343/17434 PPM 874741
                dtmFolhaPrevia.qryPrevia.Close;
                  end;
                  //edilaine WO24218 : fim

                qryPreparosAnt.Next;
             End; //while


          //edilaine WO24218 : inicio
          if not chkETL.checked then
          begin
                      // SOL 252343/17434 PPM 874741 inicio
                      memResult.Lines.Add(' ');
                      memResult.Lines.Add('---------------------------------------------------------------');
                      memResult.Lines.Add('RUBRICAS DA ESTRUTURA DE CÁLCULO.');
                      memResult.Lines.Add('---------------------------------------------------------------');
                      tInicioEstCalc := now;
                      memResult.Lines.Add('Inicio do Processo de Estrutura de cálculo: ' + formatdatetime('hh:nn:ss', tInicioEstCalc));
                      dtmFolhaPrevia.lContadorEstrutura := ExecEstruturaCalculo(sMesCobranca); // Andre Imakawa - SIG 54393
                      //dtmFolhaPrevia.lContador :=  dtmFolhaPrevia.lContador + ExecEstruturaCalculo(sMesCobranca);   // Andre Imakawa - SIG 54393
                      dtmFolhaPrevia.lContador :=  dtmFolhaPrevia.lContador + dtmFolhaPrevia.lContadorEstrutura;      // Andre Imakawa - SIG 54393
                      dtmFolhaPrevia.lContadorTotal := dtmFolhaPrevia.lContadorTotal + dtmFolhaPrevia.lContadorEstrutura;  // Andre Imakawa - SIG 54393
                      tFimEstCalc := now;
                      memResult.Lines.Add('Final do Processo de Estrutura de cálculo:  ' + formatdatetime('hh:nn:ss', tFimEstCalc));
                      memResult.Lines.Add('Total de Rubricas de Estrutura de cálculo: ' + inttostr(dtmFolhaPrevia.lContadorEstrutura));  // Andre Imakawa - SIG 54393
                      memResult.Lines.Add('Tempo total de processamento: ' + formatdatetime('hh:nn:ss', tFimEstCalc - tInicioEstCalc));
                      memResult.Lines.Add('---------------------------------------------------------------');
                      memResult.Lines.Add(' ');
                                      // SOL 252343/17434 PPM 874741 final
          end;
          //edilaine WO24218 : fim

          qryPreparosAnt.enablecontrols;
          qryPreparosAnt.filtered:=false; // SOL 248569 PPM 669718
          memResult.Lines.Add('');

          //edilaine WO19556 : inicio
          //dtmContabil.DescarregaInformacoesCF(memResult);
          //dtmContabil.DesalocaListas;
          dtmContabilPrevia.DescarregaInformacoesCF(memResult);
          dtmContabilPrevia.DesalocaListas;
          //edilaine WO19556 : fim

          tFim := now;
          memResult.Lines.Add('');

          // Felipe Santos SOL 200541 KTN 1932929
          // passou de 24 horas
          if (tFim - tInicio) >= 1 then
          begin
              tTotal := (tFim - tInicio) * 24;
              memResult.Lines.Add('Tempo Total de Processamento :  ' + FloatToStr(Trunc(tTotal))
                                   + ':' + formatdatetime('nn:ss', tFim - tInicio));
          end
          else
          // não passou de 24 horas
          begin
              memResult.Lines.Add('Tempo Total de Processamento :  ' + formatdatetime('hh:nn:ss', tFim - tInicio));
          end;
          // Felipe Santos SOL 200541 KTN 1932929 - FIM


          AtualizaPreviBenef(iIdPreviaBenef); // SOL 252343/17434 PPM 874741


          //pnlProgress.visible := false;
          //pgctrlOpcoes.ActivePage := tbsResultado;
          TiraSQL(qryAux1);
       Finally
          FreeAndNil(lstINDependentes); //SIG21958
          FreeAndNil(lstINTitular); //SIG21958
          if dtmBaseDados.dbBaseDados.InTransaction then
          begin
             dtmBaseDados.dbBaseDados.Commit;
          end;

          enabled := true;
          tag := 0;
       End;

       if chkDivideLista.Checked then
       begin
         //iIdListaAux :=  StrToInt(qrycontrole.FieldByName('IDLISTACLONE').AsString);

         // Andre Imakawa - SIG 80669 - Inicio
         if not(bPossuiErro) then
         begin
           AtualizaPreviaControle(qrycontrole.FieldByName('IDSEQEXECPREVIA').AsString,
                                  qrycontrole.FieldByName('IDLISTAORIGEM').AsString,
                                  qrycontrole.FieldByName('IDLISTACLONE').AsString,
                                  '',
                                  '2');
         end;
         // Andre Imakawa - SIG 80669 - Fim

         memResult.Lines.Add('---------------------------------------------------------------');
         memResult.Lines.Add('FIM DA LISTA :  '+ qrycontrole.FieldByName('IDLISTACLONE').AsString );
         memResult.Lines.Add('---------------------------------------------------------------');

         memResult.Lines.Add('');
       end;
     End;

   except
     on e:exception do
     begin
       CMDebugToFile('Erro ao executar Previa: ' + E.ClassName);         // Andre Imakawa - SIG 99651/136844
       CMDebugToFile('Erro ao executar Previa: ' + E.message);
       dtmFolhaPrevia.ExibeMensagem('Erro na execução da Previa.');
       dtmFolhaPrevia.ExibeMensagemSemRecebedor('Mensagem de erro : '+E.ClassName);    // Andre Imakawa - SIG 99651/136844
       dtmFolhaPrevia.ExibeMensagemSemRecebedor('Mensagem de erro : '+E.message);
       dtmFolhaPrevia.ExibeMensagemSemRecebedor('---------------------------------------------------------------');

     end;
   end;
 finally
    //edilaine WO19556 : inicio
    FreeAndNil(dtmFolhaPrevia);
    FreeAndNil(dtmContabilPrevia);
    //edilaine WO19556 : fim
     end;

End;

Procedure TfrmFolhaNormalPrevia.bbtnProcessarClick(Sender: TObject);
Begin
   Inherited;
End; // bbtnEnviarPagtoClick

Procedure TfrmFolhaNormalPrevia.chkProcessarClick(Sender: TObject);
Begin
   Inherited;
   If Not chkConcessao.Checked And Not chkManutencao.Checked And Not chkAbono.Checked Then
      Begin
         If TCheckBox(Sender).Tag = 1 Then
            chkManutencao.Checked := true
         Else
            chkConcessao.Checked := true;
      End;
   MontaQueryLotes;
End;

Procedure TfrmFolhaNormalPrevia.btnInverteClick(Sender: TObject);
Begin
   Inherited;
   qryPreparosAnt.DisableControls;
   qryPreparosAnt.First;
   While Not qryPreparosAnt.Eof Do
      Begin
         qryPreparosAnt.Edit;
         qryPreparosAnt.FieldByName('flgEnviar').AsInteger :=
            abs(qryPreparosAnt.FieldByName('flgEnviar').AsInteger - 1);
         qryPreparosAnt.Next;
      End; //while
   qryPreparosAnt.EnableControls;
End;

Procedure TfrmFolhaNormalPrevia.FormShow(Sender: TObject);
Var AYear, AMonth, ADay: Word;
   sAnoAux, sMesAux, sDataFolha: String;
   dt: tdatetime;
Begin
   Inherited;
   WindowState := wsMaximized;
   pgctrlOpcoes.ActivePage := tbsPreparos;
   PrimeiraVez := true;
   DecodeDate(date, AYear, AMonth, ADay);
   If (AMonth >= 1) And (AMonth <= 12) Then
      Begin
         cmbMes.ItemIndex := AMonth - 1;
         cmbMes.Text := cmbMes.Items[cmbMes.ItemIndex];
         spnedAno.Text := IntToStr(AYear);
      End;
   sAnoAux := spnedAno.Text;
   If cmbMes.ItemIndex <= 8 Then
      sMesAux := '0' + IntToStr(cmbMes.ItemIndex + 1)
   Else
      Begin
         If cmbMes.ItemIndex <> 12 Then
            sMesAux := IntToStr(cmbMes.ItemIndex + 1)
         Else sMesAux := '12';
      End;
   sMesPagamento := sAnoAux + '/' + sMesAux;
   sDataFolha := AtualizaDataFolha(sMesAux, sAnoAux);
   If sDataFolha <> '' Then
      Begin
         dt := strtodatetime(sdatafolha);
         edDataFolha.date := dt;
      End
   Else
      Begin
         MsgDlg('Erro na Data de Pagamento da Folha de Benefícios. ' +
            'Consulte o Cadastro de Fundação', 'Erro', mtError, [mbOk, mbHelp], 0);
         Exit;
      End;

   If Sistemafolha.FlgNumDepIRNumDepSalFam = 0 Then
      dbrgAtualiza.itemindex := 1
   Else
      dbrgAtualiza.ItemIndex := 0;

   {Configurar painéis}
   MontaQueryLotes;
   frameBenef.DefineLista(0);

   tbsETL.tabvisible := chkETL.Enabled;   //edilaine WO24218
   
   //edilaine WO19556 : inicio
   if chkModoAuto.enabled then
   begin
     qryModoAuto.DisableControls;
     qryModoAuto.close;
     qryModoAuto.Sql.Text := 'SELECT VALORPARAM FROM PARAMFOLHA  '+
                             ' WHERE NOMEPARAM = ''PREVIAMODOAUTO'' ';
     qryModoAuto.Open;
     if qryModoAuto.eof then
     begin
       qryModoauto.close;
       qryModoauto.sql.text := 'INSERT INTO PARAMFOLHA (IDFUNDACAO, NOMEPARAM, TIPOPARAM, VALORPARAM)'+
                               ' VALUES(1, ''PREVIAMODOAUTO'', ''N'', ''0'') ';
       qryModoauto.ExecSql;
       chkModoAuto.checked := false;
     end
     else
       chkModoAuto.checked := qryModoAuto.Fields[0].AsInteger = 1;

     if chkModoAuto.checked then
        ModoAutomatico(true);

     qryModoAuto.EnableControls;
   end;
   //edilaine WO19556 : fim

End;

Procedure TfrmFolhaNormalPrevia.cmbMesExit(Sender: TObject);
Begin
   MontaQueryLotes;
End;

Procedure TfrmFolhaNormalPrevia.spnedAnoExit(Sender: TObject);
Begin
   MontaQueryLotes;
End;

Procedure TfrmFolhaNormalPrevia.dbgrdPreparosAntCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   Inherited;
   If Field = qryPreparosAntFLGENVIAR Then
      Abrush.color := $00BDF9F8
End;

Procedure TfrmFolhaNormalPrevia.cboxIndividualClick(Sender: TObject);
Begin
   Inherited;
   tbsIndividual.tabvisible := cboxIndividual.checked;
   VerificaDivideLista;
End;

procedure TfrmFolhaNormalPrevia.chkResgateClick(Sender: TObject);
begin
  inherited;
  if chkResgate.Checked then begin
    chkManutencao.OnClick := nil;
    chkConcessao.OnClick  := nil;
    chkAbono.OnClick      := nil;

    chkManutencao.Checked := False;
    chkConcessao.Checked  := False;
    chkAbono.Checked      := False;
    MontaQueryLotes;
  end else begin
    chkManutencao.OnClick := chkProcessarClick;
    chkConcessao.OnClick  := chkProcessarClick;
    chkAbono.OnClick      := chkProcessarClick;
    chkManutencao.Checked := True;
  end;

end;

procedure TfrmFolhaNormalPrevia.chkResgateParceladoClick(Sender: TObject);
begin
  inherited;
   If Not chkConcessao.Checked And Not chkManutencao.Checked And Not chkAbono.Checked  Then
      Begin
         If TCheckBox(Sender).Tag = 1 Then
            chkManutencao.Checked := true
         Else
            chkConcessao.Checked := true;
      End;
   MontaQueryLotes;
end;
// SOL 248569 PPM 669718 inclusão do metodo Atualização automática do Nº de dependentes dentro de um botão fora da rotina da Previa.
procedure TfrmFolhaNormalPrevia.BtnAtualizaNumDepClick(Sender: TObject);
var ssql: String;
    nProcessados: Integer;
    tInicio, tFim, tTotal: tdatetime;
begin
   inherited;
 try
   //Inicio WO21835 Ferrari
   dtmContabilPrevia := TdtmContabil.create(nil);
   dtmFolhaPrevia    := TdtmFolhaPrevia.create(nil);
   dtmfolhaprevia.mmemo := memResult;
   dtmfolhaprevia.lblmsg := lblContagem;

   dtmfolhaprevia.InstanciaDtmLocal(dtmfolhaprevia, dtmContabilPrevia);
   //Fim WO21835 Ferrari
   memResult.Lines.Add('---------------------------------------------------------------');
   memResult.Lines.Add('Atualização automática do Nº de dependentes para IRRF e Salario Familia');
   memResult.Lines.Add('---------------------------------------------------------------');
   tInicio := now;
   PBPrevia.visible := true;
   memResult.Lines.Add(' ');
   if qryPreparosAnt.State in [dsedit] then
      qryPreparosAnt.post;

   PnlProgress.Visible := True;
   pgctrlOpcoes.ActivePage := tbsResultado;
   enabled := false;
   qryPreparosAnt.disablecontrols;

   //qryPreparosAnt.First;
   qryPreparosAnt.filter:='flgEnviar = 1';
   qryPreparosAnt.filtered:=true;
   While Not qryPreparosAnt.Eof Do
   Begin
      if qryPreparosAnt.fieldbyname('flgEnviar').asinteger <> 1 then
      begin
        qryPreparosAnt.next;
        continue;
      end;
      If Sistemafolha.FLGNUMDEPIRNUMDEPSALFAM = 1 Then
      Begin
         memResult.Lines.Add('PROCESSAMENTO DA ATUALIZACAO DE DEPENDENTE - LOTE: ' + qryPreparosAnt.FieldByName('IdLote').AsString);

         ssql := 'SELECT DISTINCT E.MATRICULA AS MATTIT, D.MATRICULA AS MATDEP, BTP.IDTITULAR, ' + _clinefeed +
             'BTP.IDRESPONSAVEL, BTP.CODTIPORECEBEDOR, ' + _clinefeed +
             'S.FLGINTERNO, ' + _clinefeed + //CONTROLAR ATUALIZAÇÃO DOS FLAGS DOS DEPENDENTES
             'NVL(PF.NUMDEPIRRF,-1) AS NUMDEPIRRF, ' + _clinefeed +
             'NVL(PF.NUMDEPSALF,-1) AS NUMDEPSALF, ' + _clinefeed +
             'NVL(PF.NUMDEPTOT,-1) AS NUMDEPTOT, ' + _clinefeed +
             'PRESP.NOME AS NOMERESP, PTIT.NOME AS NOMETIT, ' + _clinefeed +
             ' HST.MESCOMPREEM ' + _clinefeed + // SOL 140042 Kintana 900220
             'FROM HSTBENEFBFCIARIO HST, BFCIARIOTITPLAN BTP, ' + _clinefeed +
             'ELEGPATRO E, DEPENTIT D, ' + _clinefeed +
             'PARTPREVPLAN PP, SITPART S, ' + _clinefeed +
             'PESSOAFISICA PF, PESSOA PRESP, PESSOA PTIT ' + _clinefeed;

         sSql := sSql + 'WHERE (HST.IDLOTE = ' + qryPreparosAnt.FieldByName('IdLote').AsString + ') ' + _clinefeed +
             'AND (BTP.IDPESSJUR = HST.IDPESSJUR) ' + _clinefeed +
             'AND (BTP.IDPLANOPREV = HST.IDPLANOPREV) ' + _clinefeed +
             'AND (BTP.IDPESSOA = HST.IDPESSOA) ' + _clinefeed +
             'AND (BTP.SEQPROPOSTA = HST.SEQPROPOSTA) ' + _clinefeed +
             'AND (BTP.IDTITULAR = HST.IDTITULAR) ' + _clinefeed +
             'AND (BTP.IDBENEFICIO = HST.IDBENEFICIO) ' + _clinefeed +
             'AND (PP.IDPESSOA = HST.IDTITULAR) ' + _clinefeed +
             'AND (PP.IDPESSJUR = HST.IDPESSJUR) ' + _clinefeed +
             'AND ( (HST.IDPLANOPREV = PP.IDPLANOPREV AND HST.IDPESSOA = HST.IDTITULAR) ' + _clinefeed +
             'OR (HST.IDPLANOORIGEM = PP.IDPLANOPREV AND HST.IDPESSOA <> HST.IDTITULAR) ) ' + _clinefeed +
             'AND (PP.IDSITPART = S.IDSITPART) ' + _clinefeed +
             'AND (BTP.IDRESPONSAVEL = PRESP.IDPESSOA) ' + _clinefeed +
             'AND (BTP.IDRESPONSAVEL = PF.IDPESSOA) ' + _clinefeed +
             'AND (HST.IDTITULAR = PTIT.IDPESSOA) ' + _clinefeed +
             'AND (D.IDTITULAR = BTP.IDTITULAR) ' + _clinefeed +
             'AND (D.IDPESSOA = BTP.IDRESPONSAVEL) ' + _clinefeed +
             'AND (E.IDPESSOA = HST.IDTITULAR) ' + _clinefeed +
             'AND (E.IDPESSJUR = HST.IDPESSJUR) ' + _clinefeed;

         If cboxIndividual.Checked Then
            ssql := ssql + 'AND EXISTS (SELECT 1 ' + _clinefeed +
                'FROM LISTAFOLHABENEFDET LD ' + _clinefeed +
                'WHERE HST.IDTITULAR = LD.IDTITULAR ' + _clinefeed +
                'AND LD.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) + ') ' + _clinefeed;

         ssql := ssql + 'ORDER BY E.MATRICULA, D.MATRICULA' + _clinefeed;

         If not(dtmBaseDados.dbBaseDados.InTransaction) Then
         begin
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;


         lblContagem.caption := '';
         Mensagem.Caption := 'Lendo informações para atualização automática de dependente. Lote: ' + qryPreparosAnt.FieldByName('IdLote').AsString;
         mensagem.Update;

         dtmFolhaPrevia.qryPrevia.SQL.Clear;
         dtmFolhaPrevia.qryPrevia.Close;
         dtmFolhaPrevia.qryPrevia.SQL.Add(sSQL);

         Try
            dtmFolhaPrevia.qryPrevia.Open;
         Except
            On E: EDBEngineError Do
               Begin
                   bglobalErro := True;
                   memResult.Lines.Add('Erro na leitura de beneficiários para atualização automática. Lote: ' +
                      qryPreparosAnt.FieldByName('IdLote').AsString);
                   memResult.Lines.Add('Mensagem de erro : ' + E.message);
                   memResult.Lines.Add('--------------------------------------------------------------');
               End;
         End; //try

         If dtmFolhaPrevia.qryPrevia.IsEmpty Then
         Begin
             memResult.Lines.Add('Não existem de beneficiários para atualização automática. Lote: ' +
                qryPreparosAnt.FieldByName('IdLote').AsString);
             memResult.Lines.Add('--------------------------------------------------------------');
             ///dtmFolhaPrevia.qryPrevia.Close;
         End;

         nProcessados   := 0;
         PBPrevia.Min   := 0;
         PBPrevia.Max   := dtmFolhaPrevia.qryPrevia.RecordCount;
         PBPrevia.Width := lblContagem.Width;
         While Not dtmFolhaPrevia.qryPrevia.eof Do
         Begin
            inc(nProcessados);
            PBPrevia.Position := nProcessados;
            PBPrevia.Update;
            lblContagem.caption := 'Responsáveis processados: ' + inttostr(nProcessados);
            lblContagem.update;
            AtualizaNumeroDependentes(memResult,
               dtmFolhaPrevia.qryPrevia.fieldbyname('IDTITULAR').asInteger,
               dtmFolhaPrevia.qryPrevia.fieldbyname('IDRESPONSAVEL').asInteger,
               dtmFolhaPrevia.qryPrevia.fieldbyname('FLGINTERNO').asstring,
               formatdatetime('dd/mm/yyyy', edDataFolha.date),
               dtmFolhaPrevia.qryPrevia.fieldbyname('CODTIPORECEBEDOR').asstring,
               dtmFolhaPrevia.qryPrevia.fieldbyname('MATDEP').asstring,
               dtmFolhaPrevia.qryPrevia.fieldbyname('NOMERESP').asstring,
               dtmFolhaPrevia.qryPrevia.fieldbyname('NUMDEPIRRF').asinteger,
               dtmFolhaPrevia.qryPrevia.fieldbyname('NUMDEPSALF').asinteger,
               dtmFolhaPrevia.qryPrevia.fieldbyname('NUMDEPTOT').asinteger,
               false);

            If nProcessados Mod 100 = 0 Then
               application.processmessages;

            If nProcessados Mod 100 = 0 Then
               Begin
                  dtmBaseDados.dbBaseDados.Commit;
                  dtmBaseDados.dbBaseDados.StartTransaction;
               End;

            dtmFolhaPrevia.qryPrevia.next;
         End;

         If dtmBaseDados.dbBaseDados.InTransaction Then
         begin
            dtmBaseDados.dbBaseDados.commit;
         end;
         memResult.Lines.Add('Total de Responsáveis processados: ' + inttostr(nProcessados));
         memResult.Lines.Add('Fim da atualização automática do Nº de dependentes para IRRF e Salario Familia');
         tFim := now;
         memResult.Lines.Add('');
       End;
      qryPreparosAnt.Next;
   End;
   tFim := now;
   if (tFim - tInicio) >= 1 then
   begin
      tTotal := (tFim - tInicio) * 24;
      memResult.Lines.Add('Tempo de Processamento :  ' + FloatToStr(Trunc(tTotal)) + ':' + formatdatetime('nn:ss', tFim - tInicio));
   end
   else
   begin
      memResult.Lines.Add('Tempo de Processamento :  ' + formatdatetime('hh:nn:ss', tFim - tInicio));
   end;
   memResult.Lines.Add('===========================================================================');
   qryPreparosAnt.EnableControls;
   PnlProgress.Visible := false;
   enabled := true;
   PBPrevia.visible := false;
   qryPreparosAnt.filtered:=false;
 finally
    //Inicio WO21835 Ferrari
    FreeAndNil(dtmFolhaPrevia);
    FreeAndNil(dtmContabilPrevia);
    //Fim WO21835 Ferrari
 end;

end;

procedure TfrmFolhaNormalPrevia.BtnApagaPreviaClick(Sender: TObject);
var tInicio, tFim, tTotal: tdatetime;
    resuDlg : Integer; //Helio - SOL Nº 249101-17085 PPM Nº 736484
begin
   inherited;
   //Helio - SOL Nº 249101-17085 PPM Nº 736484

   // Andre Imakawa - SIG 85168 - Inicio
   If Not dtmBaseDados.dbBaseDados.InTransaction Then
     dtmBaseDados.dbBaseDados.StartTransaction;
   framebenef.LimpaListaTipo3;
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
     dtmBaseDados.dbBaseDados.commit;
     dtmBaseDados.dbBaseDados.StartTransaction;
   end;
   // Andre Imakawa - SIG 85168 - Fim

   qryPreparosAnt.filter:='flgEnviar = 1';
   qryPreparosAnt.filtered:=true;
   qryPreparosAnt.First;
   if qryPreparosAnt.Eof then
   begin
        enabled := True;
        qryPreparosAnt.filtered := False;
        MsgDlg('Nenhum lote foi selecionado para ser desfeito.',
               Sistema.NomeModulo,
               mtInformation,
               [mbOk],
               0);

        Exit;
   end;

   // Andre Imakawa - SIG 34175 - Inicio
   If Not cboxIndividual.Checked Then
     resuDlg := MsgDlg('Esta opção irá APAGAR todas as informações da Prévia do Lote selecionado. Deseja CONTINUAR?',
                       Sistema.NomeModulo,
                       mtInformation,
                       [mbYes, mbNo],
                       0)
   else
     resuDlg := MsgDlg('Esta opção irá APAGAR as informações da Prévia por lista individual para o Lote selecionado. Deseja CONTINUAR?',
                       Sistema.NomeModulo,
                       mtInformation,
                       [mbYes, mbNo],
                       0);
   // Andre Imakawa - SIG 34175 - Fim

   if resuDlg = mrNo then
   begin
        enabled := True;
        qryPreparosAnt.filtered := False;
        MsgDlg('Desfazer Prévia não realizado.',
               Sistema.NomeModulo,
               mtInformation,
               [mbOk],
               0);

        Exit;
   end;
   //FIM Helio - SOL Nº 249101-17085 PPM Nº 736484

   tInicio := now;
   pgctrlOpcoes.ActivePage := tbsResultado;
   enabled := false;
   memResult.Lines.Add('Início do Processamento :  ' + formatdatetime('hh:nn:ss', tInicio) );
   memResult.Lines.Add('---------------------------------------------------------------');

   // Andre Imakawa - SIG 34175 - Inicio
   If Not cboxIndividual.Checked Then
     memResult.Lines.Add('Exclusão dos registros das Prévias por lote.')
   else
     memResult.Lines.Add('Exclusão dos registros das Prévias por lote utilizando lista individual.');
   // Andre Imakawa - SIG 34175 - Fim

   memResult.Lines.Add('---------------------------------------------------------------');
   //Helio - SOL Nº 249101-17085 PPM Nº 736484
   //comenta, feito no inicio do metodo agora
   //qryPreparosAnt.filter:='flgEnviar = 1';
   //qryPreparosAnt.filtered:=true;
   //FIM Helio - SOL Nº 249101-17085 PPM Nº 736484

   // Andre Imakawa - SIG 34175 - Inicio
   while not(qryPreparosAnt.Eof) do
   begin
     If Not cboxIndividual.Checked Then
     begin
       memResult.Lines.Add('EXCLUINDO PRÉVIA - LOTE: ' + qryPreparosAnt.FieldByName('IdLote').AsString);
       if not(ApagaPreviaEfetivacao(qryPreparosAnt.FieldByName('IdLote').AsString,true)) then // SOL 242846 PPM 579506
       begin
          memResult.Lines.Add('Erro na SP_APAGAPREVIA ao tentar apagar a Prévia. Lote: ' +
          qryPreparosAnt.FieldByName('IdLote').AsString);
          memResult.Lines.Add('--------------------------------------------------------------');
       end;
       qryPreparosAnt.Next;
     end
     else
     begin
       memResult.Lines.Add('EXCLUINDO PRÉVIA - LOTE: ' + qryPreparosAnt.FieldByName('IdLote').AsString);
       if not(ApagaPreviaEfetivacaoLista(qryPreparosAnt.FieldByName('IdLote').AsString)) then
       begin
          memResult.Lines.Add('Erro na SP_APAGAPREVIA ao tentar apagar a Prévia por lista individual. Lote: ' +
          qryPreparosAnt.FieldByName('IdLote').AsString);
          memResult.Lines.Add('--------------------------------------------------------------');
       end;
       qryPreparosAnt.Next;
     end;
   end;
   // Andre Imakawa - SIG 34175 - Fim
   tFim  := now;
   memResult.Lines.Add('--------------------------------------------------------------');
   if (tFim - tInicio) >= 1 then
   begin
      tTotal := (tFim - tInicio) * 24;
      memResult.Lines.Add('Tempo de Processamento :  ' + FloatToStr(Trunc(tTotal)) + ':' + formatdatetime('nn:ss', tFim - tInicio));
   end
   else
   begin
      memResult.Lines.Add('Tempo de Processamento :  ' + formatdatetime('hh:nn:ss', tFim - tInicio));
   end;
  qryPreparosAnt.filtered:=false;
  enabled := true;
end;

procedure TfrmFolhaNormalPrevia.ChkPreviaGeralClick(Sender: TObject);
begin
  inherited;
  BtnApagaPrevia.Visible := (ChkPreviaGeral.Checked);  // SOL 242740 PPM 575822
  VerificaDivideLista;
end;

Function TfrmFolhaNormalPrevia.ExecEstruturaCalculo(mescobranca: String):Integer; // SOL 252343/17434 PPM 874741 criação
var
    wwStoredProc : TwwStoredProc;
begin
  Result := 0;
  wwStoredProc := TwwStoredProc.Create( nil );
  try
   wwStoredProc.DatabaseName   := dtmBaseDados.dbBaseDados.DataBaseName;
   wwStoredProc.StoredProcName := 'CM.SP_FB_CALCULO_RUBRICA';
   wwStoredProc.Params.CreateParam( ftString, 'IN_MESCOBRANCA' , ptInput).AsString    := mescobranca;
   wwStoredProc.Params.CreateParam( ftFloat, 'IN_IDPREVIABENEF' , ptInput).AsFloat    := iIdPreviaBenef;
   //wwStoredProc.Params.CreateParam(  ftFloat, 'IN_IDUSUARIO', ptInput).AsString := IntToStr(Sistema.IdUsuario);
   if (cboxIndividual.Checked) then begin
     wwStoredProc.Params.CreateParam(  ftFloat, 'IN_IDUSUARIO', ptInput).AsFloat        := Sistema.IdUsuario;
   end else begin
     wwStoredProc.Params.CreateParam(  ftFloat, 'IN_IDUSUARIO', ptInput).Clear;
   end;
   wwStoredProc.Params.CreateParam(  ftFloat, 'OUT_QUANT_RUBRICAS', ptOutput).AsString;

   wwStoredProc.Prepare;
   wwStoredProc.ExecProc;

   Result := wwStoredProc.parambyName('OUT_QUANT_RUBRICAS').AsInteger;
  finally
    wwStoredProc.Free;
  end;
end;

// Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início
procedure TfrmFolhaNormalPrevia.VerificaParametrizacaoRRAIRRF;
var
  sSQL : string;
begin
  try
     dtmFolhaPrevia.RRAIRRFParametrizadoINSS := False;
     dtmFolhaPrevia.RRAIRRFParametrizadoFUND := False;

     // separei a verificação da parametrização IRRF RRA INSS e Fundação para que um não influêncie no outro
     try
       // IRRF RRA INSS
       sSQL := 'SELECT VALORPARAM, NOMEPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''RUBRICAIRRFRRA''';

       dtmFolhaPrevia.qryAuxRRA.Close;
       dtmFolhaPrevia.qryAuxRRA.SQL.Clear;
       dtmFolhaPrevia.qryAuxRRA.SQL.Add(sSQL);
       dtmFolhaPrevia.qryAuxRRA.Open;

       if (dtmFolhaPrevia.qryAuxRRA.FieldByName('VALORPARAM').AsString <> '') then
           dtmFolhaPrevia.RRAIRRFParametrizadoINSS := True;

     except
       dtmFolhaPrevia.RRAIRRFParametrizadoINSS := False;
     end;

     try
       // IRRF RRA Fundação

       sSQL := 'SELECT VALORPARAM, NOMEPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''RUBRICAIRRFRRAFUND''';

       dtmFolhaPrevia.qryAuxRRA.Close;
       dtmFolhaPrevia.qryAuxRRA.SQL.Clear;
       dtmFolhaPrevia.qryAuxRRA.SQL.Add(sSQL);
       dtmFolhaPrevia.qryAuxRRA.Open;

       if (dtmFolhaPrevia.qryAuxRRA.FieldByName('VALORPARAM').AsString <> '') then
           dtmFolhaPrevia.RRAIRRFParametrizadoFUND := True;
     except
       dtmFolhaPrevia.RRAIRRFParametrizadoFUND := False;
     end;
  finally
    dtmFolhaPrevia.qryAuxRRA.Close;
  end;
end;
 // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim

// Andre Imakawa - SIG 28402 - Inicio
Procedure TfrmFolhaNormalPrevia.GravaLog(aqryaux2: twwquery);
Var licont, nProcessados: integer;
   ssql, Linha: String;
Begin
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      PnlProgress.Visible := True;
      PBPrevia.visible := true;

      nProcessados   := 0;
      PBPrevia.Min   := 0;
      PBPrevia.Max   := memResult.Lines.Count;
      PBPrevia.Width := lblContagem.Width;


      for licont := 0 to memResult.Lines.Count -1 do
         Begin
            Linha := memResult.Lines[licont];

            inc(nProcessados);
            PBPrevia.Position := nProcessados;
            PBPrevia.Update;
            Label5.Caption :=  'PREVIA PROCESSADA';
            lblContagem.caption := 'PREVIA PROCESSADA - Armazenando log na base: ' +  inttostr(nProcessados);
            lblContagem.update;


            ssql := 'INSERT INTO CM.REGISTRO_LOG_PREVIA' + #13#10 +
                    '  (IDREGISTROLOG, IDLISTA, SEQLOG, LINHALOG, DTINCLUSAO, USERINCLUSAO, MAQUINA)' + #13#10 + // Andre Imakawa - SIG 102321
                    'VALUES' + #13#10 +
                    '  (SEQ_REGISTRO_LOG_PREVIA.NEXTVAL, ' + IntToStr(framebenef.ListaUsuario) +' , ' + IntToStr(licont +1) +
                    '   , ' + QuotedStr(Linha) + ', SYSDATE, '+IntToStr(Sistema.IdUsuario)+ ', '+ QuotedStr(FuncaoGeral.GetNomeComputador) +')'; // Andre Imakawa - SIG 102321

            try

              ExecutarQuery(aqryaux2, ssql);
            except
            end;
            If licont Mod 2000 = 0 Then
               Begin
                  If dtmBaseDados.dbBaseDados.InTransaction Then
                  begin
                     dtmBaseDados.dbBaseDados.Commit;
                     dtmBaseDados.dbBaseDados.StartTransaction;
                  end;
               End;
         End;
   Finally
      PnlProgress.Visible := false;
      PBPrevia.visible := false;
      lblContagem.caption := '';
      lblContagem.Update;
      PBPrevia.Position := 0;
      Label5.Caption := 'Processando a Prévia da Folha de Benefício';
      If dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.Commit;
   End;

End;
// Andre Imakawa - SIG 28402 - Fim


Function TfrmFolhaNormalPrevia.IncluirNovaLista(aNome: String): Integer;
var ssql, sNome: string;
  ListaUsuario: Integer;
  qryaux:TwwQuery;
begin
  try
    qryaux := TwwQuery.Create(nil);
    qryaux.DataBaseName := 'BaseDados';
    qryaux.Close;
    qryaux.SQl.Clear;


    ListaUsuario := LeUltRegistro(Nil,'LISTAFOLHABENEF');
    qryaux.sql.Clear;
    qryaux.SQL.add('INSERT INTO CM.LISTAFOLHABENEF(IDLISTA, FLGTIPOLISTA,NOME) VALUES ('+
                   ' :IDLISTA, :FLGTIPOLISTA,:NOME)');
    qryAux.ParamByName('IDLISTA').AsFloat := ListaUsuario;
    qryAux.ParamByName('FLGTIPOLISTA').AsFloat := 3;
    if aNome <> '' then
      sNome := Sistema.NomeUsuario + ' - ' + aNome
    else
      sNome := Sistema.NomeUsuario;

    qryaux.ParamByName('NOME').AsString := sNome;
 
    try
      qryaux.ExecSQL;
      result := ListaUsuario;
    except
    end;
  finally
    FreeAndNil(qryaux);
  end;
end;



procedure TfrmFolhaNormalPrevia.IncluiPessoaListaporListagem(var aidlista: Integer; aIdExecPrevia, aIdListaOrigem, aTotalLinhas: integer;
                                                             aLimitador: Boolean );
 var
   ssql, sFiltro : string;                 //edilaine - SIG79508
   inovalista, iCont, iLinhas, iLinhasAux, idtitularaux: Integer;
   qryaux, qrycontrole, qrydelete, qryinsert, qrynucleo:TwwQuery;
   lstNucleos : TStringList;              //edilaine - SIG79508
begin

  try
    qryaux := TwwQuery.Create(nil);
    qrydelete := TwwQuery.Create(nil);
    qrycontrole := TwwQuery.Create(nil);
    qryinsert := TwwQuery.Create(nil);
    qrynucleo := TwwQuery.Create(nil);
    qryaux.DataBaseName := 'BaseDados';
    qrydelete.DataBaseName := 'BaseDados';
    qrycontrole.DataBaseName := 'BaseDados';
    qryinsert.DataBaseName := 'BaseDados';
    qrynucleo.DataBaseName := 'BaseDados';
    qryaux.Close;
    qrydelete.Close;
    qrycontrole.Close;
    qryinsert.Close;
    qrynucleo.Close;
    qryaux.SQl.Clear;
    qrydelete.SQl.Clear;
    qrycontrole.SQl.Clear;
    qryinsert.SQl.Clear;
    qrynucleo.SQl.Clear;

    lstNucleos := TStringList.create;     //edilaine - SIG79508

    If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;
    
    if aLimitador then
    begin
      iCont := 0;

      qrycontrole.SQL.add(' SELECT COUNT(1) AS QTD FROM CM.LISTAFOLHABENEFDET LFD WHERE LFD.IDLISTA = '+ IntToStr(aidlista));
      qrycontrole.Open;

      if not(qrycontrole.IsEmpty) then
      begin

        iLinhasAux := 0;
        while (qrycontrole.FieldByName('QTD').AsInteger > 0) do
        begin
          iLinhasAux := aTotalLinhas;
          idtitularaux := 0;
          iLinhas :=0;
          lstNucleos.clear;         //edilaine - SIG79508
          //if (qrycontrole.FieldByName('QTD').AsInteger >= iLinhasAux )then       //edilaine - SIG79508
          begin
            qrynucleo.Close;
            qrynucleo.SQl.Clear;
            //edilaine - SIG79508 - inicio
            //qrynucleo.SQL.add(' SELECT * FROM CM.LISTAFOLHABENEFDET LFD WHERE LFD.IDLISTA = '+ IntToStr(aidlista));
            //qrynucleo.SQL.add(' AND ROWNUM <= ' + IntToStr(iLinhasAux+50));

            {traz idtitular atual e o próximo no campo NUCLEO, filtrando apenas as linhas onde há mudança de nucleo}
            qrynucleo.SQL.add(' SELECT L.*, DECODE(L.IDTITULAR, L.NUCLEO, '''', ''S'') AS MUDOU ');
            qrynucleo.SQL.add(' FROM ( ');
            qrynucleo.SQL.add('  SELECT LFD.IDLISTA, LFD.IDTITULAR, LFD.IDPESSOA, ');
            qrynucleo.SQL.add('         LEAD(LFD.IDTITULAR, 1, 0) OVER (ORDER BY LFD.IDTITULAR) AS NUCLEO, ');
            qrynucleo.SQL.add('         ROWNUM AS LINHA ');
            qrynucleo.SQL.add('  FROM CM.LISTAFOLHABENEFDET LFD WHERE LFD.IDLISTA = '+ IntToStr(aidlista) );
            qrynucleo.SQL.add('  ORDER BY LFD.IDTITULAR ');
            qrynucleo.SQL.add('  ) L ');
            qrynucleo.SQL.add('  WHERE DECODE(L.IDTITULAR, L.NUCLEO, '''', ''S'') = ''S'' ');
            qrynucleo.SQL.add('    AND L.LINHA <= '+IntToStr(iLinhasAux+50) );
            qrynucleo.SQL.add('  ORDER BY L.LINHA  ');
            //edilaine - SIG79508 - fim

            qrynucleo.open;
            qrynucleo.first;
            while not(qrynucleo.eof) do
            begin
              //edilaine - SIG79508 - inicio
              {Inc(iLinhas);
              if iLinhas >= aTotalLinhas then
              begin
                if (idtitularaux > 0) and (idtitularaux <> qrynucleo.FieldByName('IDTITULAR').asinteger) then
                  Break;
              end;
              idtitularaux := qrynucleo.FieldByName('IDTITULAR').asinteger; }

              lstNucleos.add(qrynucleo.FieldByName('IDTITULAR').asString);

              iLinhas := qrynucleo.FieldByName('LINHA').asinteger;
              if iLinhas >= aTotalLinhas then
                 break;
              //edilaine - SIG79508 - fim

              qrynucleo.next;
            end;
            iLinhasAux := iLinhas {-1};  //edilaine - SIG79508
            sFiltro := QuebrarListaFiltro(2, 'IDTITULAR', lstNucleos.CommaText, 300);  //edilaine - SIG79508

            qrydelete.Close;
            qrydelete.SQl.Clear;
            qrydelete.SQl.add(' DELETE FROM CM.LISTAFOLHABENEFDET LFD WHERE IDLISTA = '+ IntToStr(aidlista));
            //edilaine - SIG79508 - inicio
            //qrydelete.SQL.add(' AND ROWNUM <= ' + IntToStr(iLinhasAux));
            qrydelete.SQL.add(' AND '+sFiltro );
            //edilaine - SIG79508 - fim

          end;

          Inc(iCont);
          inovalista := IncluirNovaLista('Lista Numero: '+ IntToStr(iCont));

          qryaux.Close;
          qryaux.SQl.Clear;
          qryaux.SQL.add('INSERT INTO CM.LISTAFOLHABENEFDET (IDLISTA, IDTITULAR,IDPESSOA,IDREFERENCIA) '+
                ' SELECT  '+inttostr(inovalista)+', IDTITULAR, IDPESSOA, 0 FROM LISTAFOLHABENEFDET WHERE IDLISTA =  '+inttostr(aidlista));
          //edilaine - SIG79508 - inicio
          //qryaux.SQL.add(' AND ROWNUM <= ' + IntToStr(iLinhasAux));
          qryaux.SQL.add(' AND '+sFiltro );
          //edilaine - SIG79508 - fim

          qryinsert.Close;
          qryinsert.SQl.Clear;
          qryinsert.SQL.add(' INSERT INTO CM.PREVIA_CONTROLE (IDSEQEXECPREVIA, IDLISTAORIGEM, IDLISTACLONE)');
          qryinsert.SQL.add(' VALUES ( '+ IntToStr(aIdExecPrevia)+ ', '+ IntToStr(aIdListaOrigem) +', ');
          qryinsert.SQL.add(  IntToStr(inovalista) + ')');

          try
            qryaux.ExecSQL;
            qrydelete.ExecSQL;
            qryinsert.ExecSQL;
            dtmBaseDados.dbBaseDados.Commit;
            dtmBaseDados.dbBaseDados.StartTransaction;
          except
          end;

          qrycontrole.Close;
          qrycontrole.Open;

        end;
        memResult.Lines.Add('---------------------------------------------------------------');
        memResult.Lines.Add('FORAM GERADA(S) UM TOTAL DE: '+ inttostr(iCont) + ' LISTA(S).');
        memResult.Lines.Add('---------------------------------------------------------------');

      end;
    end
    else
    begin
      inovalista := IncluirNovaLista('Lista Clone - Tibero');

      qryaux.SQL.add('INSERT INTO CM.LISTAFOLHABENEFDET (IDLISTA, IDTITULAR,IDPESSOA,IDREFERENCIA) '+
            ' SELECT  :IDLISTA, IDTITULAR, IDPESSOA, 0 FROM CM.LISTAFOLHABENEFDET WHERE IDLISTA =  :IDLISTAREF');

      qryAux.ParamByName('IDLISTA').AsFloat := inovalista;
      qryaux.ParamByName('IDLISTAREF').AsFloat := aIdListaOrigem;

      aidlista:= inovalista;
      
      try
        qryaux.ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;
      except
      end;
    end;

  finally
    FreeAndNil(qryaux);
    FreeAndNil(qrydelete);
    FreeAndNil(qrycontrole);
    FreeAndNil(qryinsert);

    FreeAndNil(qrynucleo);      //edilaine - SIG79508
    FreeAndNil(lstNucleos);     //edilaine - SIG79508

  end;
end;

Procedure TfrmFolhaNormalPrevia.AtualizaIdUsuarioListaBenef(pIdLista, pValor, pIdUsuario: String);
var
  query:TwwQuery;
begin

  query := TwwQuery.Create(nil);

  query.DataBaseName := 'BaseDados';
  query.Close;
  query.SQl.Clear;
  query.SQL.Add('UPDATE CM.LISTAFOLHABENEF SET IDUSUARIO = '+ pValor );
  if pIdUsuario = '' then
    query.SQL.Add(' WHERE IDLISTA = '+pIdLista)
  else
    query.SQL.Add(' WHERE IDLISTA <> '+pIdLista + ' AND IDUSUARIO = '+ pIdUsuario);
  if not dtmBaseDados.dbBaseDados.InTransaction then
  begin
     dtmBaseDados.dbBaseDados.StartTransaction;
  end;
  query.ExecSQL;
  dtmBaseDados.dbBaseDados.Commit;

  FreeAndNil(query);
end;


Procedure TfrmFolhaNormalPrevia.AtualizaPreviaControle(pIdSeqExecPrevia, pIdListaOrigem, pIdListaClone, pIdPreviaBenef,
                                                       pFlgProcessado: String);
var
  query:TwwQuery;
begin

  query := TwwQuery.Create(nil);

  query.DataBaseName := 'BaseDados';
  query.Close;
  query.SQl.Clear;
  query.SQL.Add('UPDATE CM.PREVIA_CONTROLE ' );
  if (pIdPreviaBenef <> '') and (pFlgProcessado <> '') then
    query.SQL.Add('   SET IDPREVIABENEF = '+ pIdPreviaBenef + ', FLGPROCESSADO = ' + pFlgProcessado)
  else
    if pIdPreviaBenef <> '' then
      query.SQL.Add('   SET IDPREVIABENEF = '+ pIdPreviaBenef)
    else
      query.SQL.Add('   SET FLGPROCESSADO = '+ pFlgProcessado );
 
  query.SQL.Add(' WHERE IDSEQEXECPREVIA = ' + pIdSeqExecPrevia + ' AND ');
  query.SQL.Add('       IDLISTAORIGEM = ' + pIdListaOrigem + ' AND ');
  query.SQL.Add('       IDLISTACLONE = ' + pIdListaClone);
  
  if not dtmBaseDados.dbBaseDados.InTransaction then
  begin
     dtmBaseDados.dbBaseDados.StartTransaction;
  end;
  query.ExecSQL;
  dtmBaseDados.dbBaseDados.Commit;

  FreeAndNil(query);
end;

Procedure TfrmFolhaNormalPrevia.VerificaDivideLista;
begin
  grpdividelista.visible := (cboxIndividual.checked and ChkPreviaGeral.checked and
                             grpdividelista.Enabled // SIG78703 - FHBS - 28/11/2018 - Para não mostrar quando não tiver permissão.
                             );
  if not(grpdividelista.visible) then
  begin
    chkDivideLista.Checked := False;
    chkapagaprevia.Checked := False;
  end;

end;


procedure TfrmFolhaNormalPrevia.chkDivideListaClick(Sender: TObject);
begin
  inherited;
  speDivideLista.Enabled := chkDivideLista.Checked;
end;

// Andre Imakawa - SIG 81948 - Inicio
procedure TfrmFolhaNormalPrevia.Monitoramento(pRotina:String; ptipo: Integer; pErro:String='');
var lParams :TStringList;
    lResponse : TStringStream;
    sHeader, sUsuario, sHorario, sErro, sMensagem, sIdExec : string;
    sGrupo, sQuebra: string; // Andre Imakawa - SIG 100935
    dia: TDateTime;
    sMaquina, sRetorno: string; // Andre Imakawa - SIG 102321
begin
  inherited;
  // Andre Imakawa - SIG 100935 - Inicio
  sQuebra := ' \ue008\ue007\ue000';
  
  if Copy(UpperCase(Sistema.AliasServidor),1,8) <> 'PRODUCAO' then
     sGrupo := 'Checklist Sistemas'
  else
    sGrupo := 'Monitoramento';

  // Andre Imakawa - SIG 100935 - Fim

  Try
    try

      if IdExec = 0 then
      begin
        case ptipo of
          0: sHeader := ' - INICIO';
          1: sHeader := ' - FIM';
          2: sHeader := ' - ERRO';
        end;
        sHeader := sHeader + '';
      end
      else
      begin
        case ptipo of
          0: sHeader := ' - INICIO DA EXECUCAO';
          1: sHeader := ' - FIM DA EXECUCAO';
          2: sHeader := ' - ERRO NA EXECUCAO';
        end;
        sHeader := sHeader + ': '+inttostr(IdExec);
      end;

      sUsuario := 'USUARIO: '+Sistema.NomeUsuario;
      sHorario := 'HORARIO: '+ formatdatetime('dd/mm/yyyy hh:nn:ss',now);
      sMaquina := 'MAQUINA: '+ UpperCase(trim(FuncaoGeral.GetNomeComputador)); // Andre Imakawa - SIG 102321
      sErro    := 'MSG: '+pErro;

      lParams := TStringList.Create;
      lResponse := TStringStream.Create('');

      case ptipo of
        0,1: sMensagem := '{"numero":"'+ sGrupo +'","mensagem":"'+ pRotina + sHeader + sQuebra + sUsuario + sQuebra + sHorario + sQuebra + sMaquina +'"}'; // Andre Imakawa - SIG 102321
        2:   sMensagem := '{"numero":"'+ sGrupo +'","mensagem":"'+ pRotina + sHeader + sQuebra + sErro + sQuebra + sUsuario + sQuebra + sHorario + sQuebra + sMaquina +'"}'; // Andre Imakawa - SIG 102321
      end;

      //FuncaoGeral.EnviaMonitoramento('http://mw.funcef.com.br:5000/api/envia', 'application/json', sMensagem); // Andre Imakawa - SIG 82710
      FuncaoGeral.RequestAPI('http://mw.funcef.com.br:5000/api/envia', sMensagem, sRetorno, 'application/json',''); // Andre Imakawa - SIG 102321
    Except
      on E: Exception do
      begin
        // Andre Imakawa - SIG 82710 - Inicio
        //memResult.Lines.Add('--------------------------------------------------------------');
        //memResult.Lines.Add('ERRO INT1-C.');
        //memResult.Lines.Add('--------------------------------------------------------------');
		// Andre Imakawa - SIG 82710 - Fim        
      end;
    end;
  finally
    FreeAndNil(lParams);
    FreeAndNil(lResponse);
  end;
end;
// Andre Imakawa - SIG 81948 - Fim


// Andre Imakawa - SIG 87202 - Inicio
Procedure TfrmFolhaNormalPrevia.ExecutaPerfil;
var
  sDiretorioETL: String;  // Andre Imakawa - SIG 74538
  iCont, iContAbort, iTimeRepeat, iTimeAbort, iFalhaPerfil : Integer; // Andre Imakawa - SIG 82710
  F : TextFile;           // Andre Imakawa - SIG 74538
begin
  // Andre Imakawa - SIG 74538 - Inicio
  sDiretorioETL := '';
  // Andre Imakawa - SIG 82710 - Inicio
  iTimeRepeat := 15000;
  iTimeAbort := 180000;
  iFalhaPerfil := 0;
  iCont := 0; // Andre Imakawa - SIG 83696
  RetornaDiretorioETL('PREVIA', 'PERFIL DE INVESTIMENTOS',          //edilaine WO24218
                      sDiretorioETL, iTimeRepeat, iTimeAbort);
  // Andre Imakawa - SIG 82710 - Fim
  if sDiretorioETL <> '' then
  begin
    try
      iContAbort := Trunc((iTimeAbort/iTimeRepeat)); // Andre Imakawa - SIG 82710
      AssignFile( F, sDiretorioETL + '\Iniciar_Previa.csv '  );
      ReWrite( F );
      Closefile( F );
      AtualizaPreviBenefETL(iIdPreviaBenef);
      memResult.Lines.Add('---------------------------------------------------------------------------');
      memResult.Lines.Add('PERFIL DE INVESTIMENTO.');
      memResult.Lines.Add('---------------------------------------------------------------------------');
      memResult.Lines.Add('Inicio do processo de preenchimento do Perfil de Investimento.');
      // Andre Imakawa - SIG 82710 - Inicio
      // Andre Imakawa - SIG 77851 - Inicio
      While VerificaPreviBenefETL(iIdPreviaBenef) = 0 do
      begin
        sleep(iTimeRepeat);
        inc(iCont);
        if iCont = iContAbort then
        begin
          iFalhaPerfil := 1;
          //sleep(60000);
          memResult.Lines.Add('Perfil de Investimento em execução, favor aguardar conclusão do processo.');
          break;
        end;
      end;
      if iFalhaPerfil = 0 then
      begin
        memResult.Lines.Add('Fim do processo de preenchimento do Perfil de Investimento.');
      end;
      memResult.Lines.Add('---------------------------------------------------------------------------');

      // Andre Imakawa - SIG 77851 - Fim
      // Andre Imakawa - SIG 82710 - Fim
    except
      //memResult.Lines.Add('Erro ao executar rotina de ETL - Perfil de Investimento.');
    end;
  end;

  // Andre Imakawa - SIG 74538 - Fim

end;
// Andre Imakawa - SIG 87202 - Fim


//edilaine WO19556 : inicio
procedure TfrmFolhaNormalPrevia.chkModoAutoClick(Sender: TObject);
begin
  inherited;
  if qryModoAuto.ControlsDisabled then
     exit;

  if chkModoAuto.checked then
  begin
    if MsgDlg('Serão marcadas automaticamente as opções abaixo toda vez que acessar a funcionalidade:'+char(10)+char(13)+
              ' - Utiliza lista Individual de Processamento '+char(10)+char(13)+
              ' - Prévia Geral usando lista Individual '+char(10)+char(13)+
              ' - Divisão de listas '+char(10)+char(13)+
              ' - Apagar Prévia antes do Processamento '+char(10)+char(13)+char(10)+char(13)+
              'Confirma?' , 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
    begin
       try
         If Not dtmBaseDados.dbBaseDados.InTransaction Then
           dtmBaseDados.dbBaseDados.StartTransaction;

         qryModoAuto.close;
         qryModoAuto.sql.Text := 'UPDATE PARAMFOLHA SET VALORPARAM = 1 '+
                                 ' WHERE NOMEPARAM = ''PREVIAMODOAUTO'' ';
         try
           qryModoAuto.ExecSQL;

           If dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.Commit;

           MsgDlg('Marcação automática de opções ativada', 'Informação', mtInformation, [mbOk, mbHelp], 0);

           ModoAutomatico(true);

         except
           If dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Ocorreu um erro ao desabilitar Marcação automática de opções', 'Erro', mtError, [mbOk, mbHelp], 0);
         end;
       finally
         qryModoAuto.close;
       end;
    end;
  end
  else
  begin
     try
       If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

       qryModoAuto.close;
       qryModoAuto.close;
       qryModoAuto.sql.Text := 'UPDATE PARAMFOLHA SET VALORPARAM = 0 '+
                               ' WHERE NOMEPARAM = ''PREVIAMODOAUTO'' ';
       try
         qryModoAuto.ExecSQL;

         If dtmBaseDados.dbBaseDados.InTransaction Then
           dtmBaseDados.dbBaseDados.Commit;

         MsgDlg('Marcação automática de opções desativada', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         
         ModoAutomatico(false);
       except
         If dtmBaseDados.dbBaseDados.InTransaction Then
           dtmBaseDados.dbBaseDados.RollBack;
         MsgDlg('Ocorreu um erro ao habilitar Marcação automática de opções', 'Erro', mtError, [mbOk, mbHelp], 0);
       end;
     finally
       qryModoAuto.close;
     end;
  end;
end;


procedure TfrmFolhaNormalPrevia.ModoAutomatico(bMarcarItens: boolean);
begin
  cboxIndividual.Checked := bMarcarItens;
  ChkPreviaGeral.checked := bMarcarItens;
  chkDivideLista.checked := bMarcarItens;
  chkapagaprevia.checked := bMarcarItens;
  if bMarcarItens then
     MarcarLotes;
end;


procedure TfrmFolhaNormalPrevia.MarcarLotes;
begin
   qryPreparosAnt.DisableControls;
   qryPreparosAnt.First;
   While Not qryPreparosAnt.Eof Do
   Begin
      if qryPreparosAnt.FieldByName('flgEnviar').AsInteger <> 1 then
      begin
        qryPreparosAnt.Edit;
        qryPreparosAnt.FieldByName('flgEnviar').AsInteger := 1;
      end;
      qryPreparosAnt.Next;
   End; //while
   qryPreparosAnt.EnableControls;
end;
//edilaine WO19556 : fim


//edilaine WO24218 : inicio
procedure TfrmFolhaNormalPrevia.chkETLClick(Sender: TObject);
begin
  inherited;

  cboxIndividual.enabled := not chkETL.checked;
  if cboxIndividual.Checked then
     cboxIndividual.Checked := not chkETL.checked;

  if (ChkPreviaGeral.checked) and (chkETL.checked) then
     ChkPreviaGeral.checked := true;

  chkModoAuto.enabled := not chkETL.checked;
  if chkModoAuto.checked then
  begin
    chkModoAuto.Checked   := not chkETL.checked;
    chkManutencao.checked := true;
    chkConcessao.checked  := true;
    chkAbono.checked      := false;
    chkResgate.checked    := false;
  end;
  grpdividelista.enabled := not chkETL.checked;
  chkAbono.enabled       := not chkETL.checked;
  chkResgate.enabled     := not chkETL.checked;
end;


function TfrmFolhaNormalPrevia.InsereControleETL_Previa(pIdPreviaBenef : double) : boolean;
var
  qryIns : TwwQuery;
  sInicio       : string;
begin
  qryIns := TwwQuery.Create(nil);
  qryIns.DataBaseName := 'BaseDados';
  try
    try

       //data/hora inicio da execuao
       qryConsulta.close;
       qryConsulta.sql.clear;
       qryConsulta.sql.Add('select to_char(sysdate,''yyyy/mm/dd hh24:mi:ss'') AS datenow from dual');
       qryConsulta.Open;
       sInicio := qryConsulta.FieldByName('DATENOW').AsString;
       sInicio := StringReplace(StringReplace(StringReplace(sInicio, '/', '', [rfReplaceAll]), ':', '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);

       //Id da execução
       qryConsulta.Close;
       qryConsulta.SQl.Clear;
       qryConsulta.SQL.Add('SELECT SEQETL_FOLHA_PREVIA.nextval AS ID_ETL_PREVIA FROM DUAL ');
       qryConsulta.Open;
       iIdProcessoETL := qryConsulta.FieldByName('ID_ETL_PREVIA').AsInteger;
       memResult.Lines.Add('Gera Identificador de Execução.');


       //ID00950_202505_20250610094240
       sIdExecucaoETL := 'ID'+ColocaZeros(IntToStr(iIdProcessoETL), 5)+'_'+StringReplace(  sMesCobranca, '/', '', [])+'_'+sInicio;

       qryIns.close;
       qryIns.SQL.Add('Insert into ETL_FOLHA_PREVIA (  ');
       qryIns.SQL.Add('   ID,                          ');
       qryIns.SQL.Add('   IDPREVIABENEF,               ');
       qryIns.SQL.Add('   IDEXECUCAO,                  ');
       qryIns.SQL.Add('   MESCOBRANCA,                 ');
       qryIns.SQL.Add('   ANOMESCOBRANCA,              ');
       qryIns.SQL.Add('   DATAPAGTO,                   ');
       qryIns.SQL.Add('   IDLOTE_LISTA,                ');
       qryIns.SQL.Add('   DTPAGTO_D1,                  ');
       qryIns.SQL.Add('   DTPAGTO_D2,                  ');
       qryIns.SQL.Add('   DTPAGTO_D3,                  ');
       qryIns.SQL.Add('   IDUSUARIO,                   ');
       qryIns.SQL.Add('   DATA_INICIO                  ');
       qryIns.SQL.Add(') Values ( ');
       qryIns.SQL.Add('  '+IntToStr(iIdProcessoETL)+      ', ');
       qryIns.SQL.Add('  '+FloatToStr(pIdPreviaBenef)+  ', ');
       qryIns.SQL.Add('  '+QuotedStr(sIdExecucaoETL)+   ', ');
       qryIns.SQL.Add('  '+QuotedStr(sMesCobranca)+     ', ');
       qryIns.SQL.Add('  '+QuotedStr(Copy(sMesCobranca,1,4))+  ', ');
       qryIns.SQL.Add('  '+QuotedStr(edDataFolha.Text)+ ', ');
       qryIns.SQL.Add('  '+QuotedStr(sLotesSelecionados)+                        ', ');
       qryIns.SQL.Add('  '+QuotedStr(FormatDateTime('mm/dd/yyyy', dtmFolhaPrevia.dataspagto[0]))+   ', ');
       qryIns.SQL.Add('  '+QuotedStr(FormatDateTime('mm/dd/yyyy', dtmFolhaPrevia.dataspagto[1]))+   ', ');
       qryIns.SQL.Add('  '+QuotedStr(FormatDateTime('mm/dd/yyyy', dtmFolhaPrevia.dataspagto[2]))+   ', ');
       qryIns.SQL.Add('  '+QuotedStr(inttostr(Sistema.Idusuario))+', ');
       qryIns.SQL.Add('  sysdate)');

       if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       qryIns.ExecSql;
       dtmBaseDados.dbBaseDados.Commit;
       memResult.Lines.Add('Insere dados de Controle do ETL da Prévia.');
       result := true;
    except
      memResult.Lines.Add('Erro ao Inserir dados de Controle do ETL da Prévia.');
      result := false;
      exit;
    end;
  finally
    FreeAndNil(qryIns);
    qryConsulta.close;
  end;
end;


function TfrmFolhaNormalPrevia.CriaArquivosParamETL(sDiretorio, sFiltro : string; iIdRotina : integer; lUsaDePara : boolean = true) : boolean;
var
  ArqETL, lListaDE,
  lListaPARA : TStringList;
  qryDePara  : TwwQuery;
  qryBusca   : TwwQuery;
  sNomeArq, sPrefixo  : string;
  iIndex     : integer;
  sLeBloco   : string;
  sSQL       : string;
  sValorPara : string;
begin
  ArqETL     := TStringList.create;
  lListaDE   := TStringList.Create;
  lListaPARA := TstringList.Create;

  qryDePara := TwwQuery.create(nil);
  qryDePara.DataBaseName := 'BaseDados';
  qryBusca  := TwwQuery.create(nil);
  qryBusca.DataBaseName  := 'BaseDados';

  try
    try
      //busca parametros que deverão ser substitudos
      if lUsaDePara then
      begin
        qryDePara.close;
        qryDePara.Sql.Clear;
        qryDePara.Sql.Add('SELECT DP.IDDEPARAEXTERNO, DP.VLRCM, DP.VLREXTERNO, DP.TABELAORIGEM,');
        qryDePara.Sql.Add('       DP.CAMPOFILTROORIGEM, DP.FLGUSACRITPO, DP.FLGAPLICACRITPO    ');
        qryDePara.Sql.Add('  FROM DEPARAEXTERNO DP                        ');
        qryDePara.Sql.Add(' WHERE DP.ATRIBUTO = ''ETL-PREVIA''            ');
        qryDePara.Open;
        while not qryDePara.eof do
        begin
          sValorPara := '';
          //lista dos valores
          //  - se TABELAORIBEM estiver vazia assume que é um valor fixo
          if qryDePara.FieldByName('TABELAORIGEM').AsString = '' then
          begin
             if qryDePara.FieldByName('CAMPOFILTROORIGEM').AsString = '' then
             begin
               //sem filtro não valida conexao e insere macros + valores
               lListaDE.Add(qryDePara.FieldByName('VLREXTERNO').AsString);
               sValorPara := qryDePara.FieldByName('VLRCM').AsString
             end
             else
             begin
               //sem tabela + com filtro: validar conexao (executando teste ou producao)
               if ((UpperCase(Sistema.AliasServidor) = 'PRODUCAO')  and (qryDePara.FieldByName('CAMPOFILTROORIGEM').AsString = 'PRODUCAO')) or
                  ((UpperCase(Sistema.AliasServidor) <> 'PRODUCAO') and (qryDePara.FieldByName('CAMPOFILTROORIGEM').AsString <> 'PRODUCAO')) then
               begin
                 //lista das macros + valores
                 lListaDE.Add(qryDePara.FieldByName('VLREXTERNO').AsString);
                 sValorPara := qryDePara.FieldByName('VLRCM').AsString
               end;
             end;
          end
          else
          begin
            //  - se TABELAORIBEM estiver preenchida, busca o campo
            if qryDePara.FieldByName('VLRCM').AsString = 'CONEXAO_ETL' then
            begin
              sSql := 'SELECT '+qryDePara.FieldByName('VLRCM').AsString +
                      '  FROM '+qryDePara.FieldByName('TABELAORIGEM').AsString +
                      ' WHERE '+qryDePara.FieldByName('CAMPOFILTROORIGEM').AsString+ ' = '+IntToStr(iIdRotina) +
                      '   AND CONEXAO_PLANUS = '+QuotedStr(UpperCase(Sistema.AliasServidor));

              qryBusca.close;
              qryBusca.Sql.Text := sSQL;
              qryBusca.Open;
              if not qryBusca.isEmpty then
              begin
                //lista das macros
                lListaDE.Add(qryDePara.FieldByName('VLREXTERNO').AsString);
                sValorPara := qryBusca.FieldS[0].AsString;
              end
              else
              begin
                sSql := 'SELECT '+iff(UpperCase(Sistema.AliasServidor) = 'PRODUCAO', 'CONEXAO_PROD', 'CONEXAO_DEV') +
                        '  FROM PARAMETLPLANUS '+
                        ' WHERE IDPARAMETL = '+IntToStr(iIdRotina);
                qryBusca.close;
                qryBusca.Sql.Text := sSQL;
                qryBusca.Open;
                if not qryBusca.isEmpty then
                begin
                  //lista das macros
                  lListaDE.Add(qryDePara.FieldByName('VLREXTERNO').AsString);
                  sValorPara := qryBusca.FieldS[0].AsString;
                end;
              end;
            end
            else
            begin
              sSql := 'SELECT '+qryDePara.FieldByName('VLRCM').AsString +
                      '  FROM '+qryDePara.FieldByName('TABELAORIGEM').AsString;
              if qryDePara.FieldByName('CAMPOFILTROORIGEM').AsString <> '' then
                 sSql := sSQL + ' WHERE '+qryDePara.FieldByName('CAMPOFILTROORIGEM').AsString+ ' = '+sFiltro;

              qryBusca.close;
              qryBusca.Sql.Text := sSQL;
              qryBusca.Open;
              if not qryBusca.isEmpty then
              begin
                //lista das macros
                lListaDE.Add(qryDePara.FieldByName('VLREXTERNO').AsString);
                sValorPara := qryBusca.FieldS[0].AsString;
              end;
            end;
          end;
          //tem valor de PARA parametrizado
          if sValorPara <> '' then
          begin
            //verifica se precisa aplicar criptografia
            if qryDePara.FieldByName('FLGAPLICACRITPO').AsInteger = 1 then
               AplicaCritpoDePara(qryDePara.FieldByName('IDDEPARAEXTERNO').AsInteger, sValorPara)
            else if qryDePara.FieldByName('FLGUSACRITPO').AsInteger = 1 then
               sValorPara := AplicaDecritpoDePara(sValorPara);

            lListaPARA.Add( sValorPara );
          end;

          qryDePara.next;
        end;
      end;

      //busca arquivos e blocos de dados dos arquivos
      qryConsulta.Close;
      qryConsulta.Sql.clear;
      qryConsulta.Sql.Add('SELECT A.IDPARAMETLARQ, A.ORDEM AS ORDEMARQ, A.FLGUSAPREFIXO, A.NOMEETLARQUIVO, ');
      qryConsulta.Sql.Add('       AD.ORDEM AS ORDEMDET, AD.NOMESESSAO, AD.BLOCO      ');
      qryConsulta.Sql.Add('  FROM PARAM_ETL_ARQUIVO A                                ');
      qryConsulta.Sql.Add('  JOIN PARAM_ETL_ARQUIVODET AD                            ');
      qryConsulta.Sql.Add('    ON AD.IDPARAMETL    = A.IDPARAMETL                    ');
      qryConsulta.Sql.Add('   AND AD.IDPARAMETLARQ = A.IDPARAMETLARQ                 ');
      qryConsulta.Sql.Add(' WHERE A.IDPARAMETL     = '+IntToStr(iIdRotina)            );
      qryConsulta.Sql.Add(' ORDER BY A.ORDEM, AD.ORDEM                               ');
      qryConsulta.Open;
      if not qryConsulta.isEmpty then
      begin
        sNomeArq := qryConsulta.FieldByName('NOMEETLARQUIVO').AsString;
        sPrefixo := iff(qryConsulta.FieldByName('FLGUSAPREFIXO').AsInteger = 1, sIdExecucaoETL, '');
        while not qryConsulta.eof do
        begin
          if sNomeArq <> qryConsulta.FieldByName('NOMEETLARQUIVO').AsString then
          begin
            ArqETL.SaveToFile(sDiretorio + sPrefixo + sNomeArq);
            ArqETL.Clear;
            sNomeArq := qryConsulta.FieldByName('NOMEETLARQUIVO').AsString;
            sPrefixo := iff(qryConsulta.FieldByName('FLGUSAPREFIXO').AsInteger = 1, sIdExecucaoETL, '');
          end;

          if qryConsulta.FieldByName('NOMESESSAO').AsString <> '' then
             ArqETL.Add( qryConsulta.FieldByName('NOMESESSAO').AsString );

          sLeBloco := qryConsulta.FieldByName('BLOCO').AsString;
          for iIndex := 0 to lListaDE.count-1 do
          begin
            sLeBloco := StringReplace(sLeBloco, lListaDE.strings[iIndex], lListaPARA.strings[iIndex], [rfReplaceAll, rfIgnoreCase]);
          end;
          ArqETL.Add( sLeBloco );
          ArqETL.Add('');

          qryConsulta.next;
        end;
        if ArqETL.Count > 0 then
           ArqETL.SaveToFile(sDiretorio + sPrefixo + sNomeArq);
      end
      else
      begin
        qryConsulta.Close;
        qryConsulta.Sql.clear;
        qryConsulta.Sql.Add('SELECT A.IDPARAMETLARQ, A.ORDEM AS ORDEMARQ, A.FLGUSAPREFIXO, A.NOMEETLARQUIVO ');
        qryConsulta.Sql.Add('  FROM PARAM_ETL_ARQUIVO A                                ');
        qryConsulta.Sql.Add(' WHERE A.IDPARAMETL     = '+IntToStr(iIdRotina)            );
        qryConsulta.Sql.Add(' ORDER BY A.ORDEM                                         ');
        qryConsulta.Open;
        if not qryConsulta.isEmpty then
        begin
          sNomeArq := qryConsulta.FieldByName('NOMEETLARQUIVO').AsString;
          sPrefixo := iff(qryConsulta.FieldByName('FLGUSAPREFIXO').AsInteger = 1, sIdExecucaoETL, '');
          ArqETL.Add('vazio');
          ArqETL.SaveToFile(sDiretorio + sPrefixo + sNomeArq);
        end;
      end;
      Result := true;
    except
      Result := false;
    end;
  finally
    ArqETL.Clear;
    qryConsulta.close;
    qryDePara.close;
    qryBusca.close;

    FreeAndNil(ArqETL);
    FreeAndNil(qryDePara);
    FreeAndNil(qryBusca);
    FreeAndNil(lListaDE);
    FreeAndNil(lListaPARA);
  end;
end;


function TfrmFolhaNormalPrevia.ProcessaPreviaETL: boolean;
const
  vetEtapa : Array[1..16] of string = (' - Apaga Previa',                                      ' - Buscando Informações Recebedores',
                                       ' - Gerando Benefícios / TMPDESC',                      ' - Gerando Rubricas Individuais',
                                       ' - Prepara Regras (RubricaIndiv / TMPDESC)',           ' - Executando Regras (RubricaIndiv / TMPDESC)',
                                       ' - Atribuindo Regras (RubricaIndiv / TMPDESC)',        ' - Determina Base para Impostos',
                                       ' - Cáculo de Impostos',                                ' - Executando Regras (Impostos)',
                                       ' - Atribuindo Regras (Impostos)',                      ' - Verifica Margem de Desconto',
                                       ' - Gerando Bases de Pagamento, Contábil e Financeiro', ' - Carregando Previa',
                                       ' - Executando Estrutura de Cálculos',                  ' - Executando Perfil de Investimento');
var
  sDiretorioETL: String;
  iCont, iContAbort, iProcesso,
  iTimeRepeat, iTimeAbort, iFalhaPrevia,
  iEtapaAux, iEtapaETL : Integer;
begin
  sDiretorioETL := '';
  Application.ProcessMessages;

  try
    //Parametrizacao
    iProcesso := RetornaDiretorioETL('PREVIA', 'PARAMETROS', sDiretorioETL, iTimeRepeat, iTimeAbort);

    //if iTimeRepeat = 0 then iTimeRepeat   := 15000;
    //if iTimeAbort  = 0 then iTimeAbort    := 180000;

    if sDiretorioETL <> '' then
    begin
      try
        memResult.Lines.Add('---------------------------------------------------------------------------');
        memResult.Lines.Add('EXECUÇÃO DA PREVIA - ETL.');
        memResult.Lines.Add('---------------------------------------------------------------------------');
        memResult.Lines.Add('Inicio do processo de parametrização.');

        //insere informaçoes de controle
        Result := InsereControleETL_Previa(iIdPreviaBenef);

        //criar arquivos de parametrizacao
        if Result then
        begin
          memResult.Lines.Add('Criando Arquivo de Parâmetros.');
          if not CriaArquivosParamETL(sDiretorioETL, IntToStr(iIdProcessoETL), iProcesso) then
          begin
            memResult.Lines.Add('Erro ao Criar Arquivos.');
            result := false;
            exit;
          end;
        end;

        //criar arquivos de start do processo
        if Result then
        begin
          iProcesso := RetornaDiretorioETL('PREVIA', 'PREVIA', sDiretorioETL, iTimeRepeat, iTimeAbort);
          memResult.Lines.Add('Iniciando o ETL.');
          if not CriaArquivosParamETL(sDiretorioETL, IntToStr(iIdProcessoETL), iProcesso, false) then
          begin
             memResult.Lines.Add('Erro ao Criar Arquivo Inicial do ETL.');
             result := false;
             exit;
          end;
        end;

        if Result then
        begin
          if (iTimeRepeat > 0) and (iTimeAbort > 0) then
             iContAbort := Trunc((iTimeAbort/iTimeRepeat))
          else
             iContAbort := 0;

          iCont := 0;
          iFalhaPrevia := 0;
          iEtapaETL := 0;
          iEtapaAux := 0;
          While VerificaPreviBenefETL(iIdPreviaBenef, iEtapaAux) = 0 do
          begin
            if iEtapaAux <> iEtapaETL then
            begin
              iEtapaETL := iEtapaAux;
              memResult.Lines.Add(IntToStr(iEtapaETL) + vetEtapa[iEtapaETL] );
              Application.ProcessMessages;
            end;

            if iTimeRepeat > 0 then
               sleep(iTimeRepeat);

            if iContAbort > 0 then
            begin
              inc(iCont);
              if iCont = iContAbort then
              begin
                iFalhaPrevia := 1;
                //sleep(60000);
                memResult.Lines.Add('Prévia em execução, favor aguardar conclusão do processo.');
                break;
              end;
            end;
          end;
          if iFalhaPrevia = 0 then
          begin
            memResult.Lines.Add('Fim do processo Prévia via ETL.');
          end;
          memResult.Lines.Add('---------------------------------------------------------------------------');
        end;

      except
        memResult.Lines.Add('Erro ao executar rotina de ETL - Prévia.');
        result := false;
      end;
    end;
  finally
  end;
end;


Function  TfrmFolhaNormalPrevia.VerificaPreviBenefETL(pidPreviaBenef: Double; var piEtapa : integer): Integer;
var
  query : TwwQuery;
begin
 try
  query := TwwQuery.Create(nil);
  query.DataBaseName := 'BaseDados';

  query.Close;
  query.SQl.Clear;
  //verifica ETL específico
  query.SQL.Add('SELECT DECODE(DATA_FIM, NULL, 0, 1) AS QTD, NVL(ETAPA,0) ETAPA ');
  query.SQL.Add('  FROM CM.ETL_FOLHA_PREVIA  ');
  query.SQL.Add(' WHERE IDPREVIABENEF = '+FloatToStr(pidPreviaBenef));
  query.Open;

  piEtapa := query.FieldByName('ETAPA').AsInteger;
  result  := query.FieldByName('QTD').AsInteger;

 finally
  FreeAndNil(query);
 end;
end;


procedure TfrmFolhaNormalPrevia.btnRefreshClick(Sender: TObject);
begin
  inherited;
   qryExecETL.close;
   qryExecETL.Params[0].AsString := sMesCobranca;
   qryExecETL.Open;
end;
//edilaine WO24218 : fim




End.
{==============================================================================|
| UNIT: FFOLHANORMALPREVIA                                                     |
| DESCRIÇÃO FUNCIONAL:                                                         |
|  TELA PARA SELEÇÃO DE INFORMAÇÕES NECESSÁRIAS PARA A EXECUÇÃO DE UMA PRÉVIA  |
|  DE FOLHA DE BENEFÍCIOS. DISPARA O PROCESSAMENTO DO OBJETO DFOLHAPREVIA, QUE |
|  EFETIVAMENTE FAZ TODO O PROCESSAMENTO DA PREVIA. NESTA TELA SE MONTA A CON- |
|  SULTA PRINCIPÁL, SEJA PARA UM LOTE COMPLETO OU A PREVIA INDIVIDUAL PARA AL- |
|  GUMAS PESSOAS. NESTA TELA TAMBÉM SE EFETUA O DESFAZER PREPARO DE UM LOTE DE |
|  MANUTENÇÃO, PROCESSADO NA FASE DE PREPARO DA FOLHA. ESTA OPÇÃO DE DESFAZER  |
|  PODE SER REALIZADA PARA O LOTE COMPLETO OU INDIVIDUALMENTE PARA APENAS      |
|  ALGUMAS PESSOAS SELECIONADAS.                                               |
|                                                                              |
|                                                                              |
===============================================================================|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/02/2005 A 10/02/2005                         |
| VERSÃO PARA LIBERAÇÃO: 3.05.03                                               |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Foi colocado na query que busca na BenefPlanPrev a rubrica de quitação  |
|    antecipada.                                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUIU-SE A OPÇÃO DE SELEÇÃO DE PESSOAS PARA PROCESSAMENTO INDIVIDUAL     |
|   ATRAVÉS DE UM ARQUIVO DE INSCRIÇÃO NA FUNDAÇÃO, EXTENDENDO A FUNCIONALI-   |
|   DADE ANTERIOR QUE PERMITIA A IMPORTAÇÃO DE UM ARQUIVO DE MATRÍCULAS.       |
| - NO DESFAZER PREPARO ELIMINAR O SALÁRIO VIRTUAL DA HISTRUBSAL.              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/02/2002 A 25/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12C                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DO PROCESSAMENTO PARA TRATAR OS LOTES INDEPENDENTEMENTE.         |
| - ALTERAÇÃO NA TELA PARA A EXIBIÇÃO DO PAINEL DE PROCESSAMENTO.              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/02/2002 A 28/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - IDENTIFICA-SE A RUBRICA DE DEVOLUÇÃO DE ABONO ANUAL (IDRUBDEVOLABONO)      |
| PARAMETRIZADA NA BENEFPLANPREV.                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/04/2002 A 09/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12I                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUIR DESFAZER PREPARO NO LOGTOTALPREV                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FLGMOLESTIAGRAVE                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/04/2002 A 19/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12K                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUI O CAMPO FLGMOLESTIAGRAVE NA QUERY PRINCIPAL                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/05/2002 A 21/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12T                                              |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - DESFAZER PREPARO :                                                         |
|   * Atualização do Nº de Registros e o Valor Total do Lote de Pagamentos     |
|   * Criação do form  frmMotivoDesFazPreparo, para armazenar a descrição do   |
|     motivo do desfazer do preparo                                            |
|   * Correção da query que apaga o salario virtual na histrubsal              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/07/2002 A 31/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13K                                              |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Incluí o campo NUMDEPSALF na queryprinc.                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/08/2002 A 09/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - EXCLUIR DA CONSULTA PRINCIPAL OS BENEFÍCIOS DE REFERENCIA DE INSS.         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/08/2002 A 16/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13o                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Alterei a procedure bbtnDesfazPreparoClick para passar a desfazer tambem o |
|   valor do Auxilio Doenca.                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/11/2002 A 07/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT/FUNCEF)                                                       |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PENDENCIA: 10387 - PARA COLOCAR NA PREVIA O BENEFICIO PRINCIPAL EM TODAS AS  |
|  RUBRICAS DE DESCONTO DE FORMA A QUE A CONTABILIZAÇÃO UTILIZE A CONTA        |
|  CONTABIL DE LIQUIDO CORRETA.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/11/2002 A 22/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PERMITIR O PREVIA DE BENEFÍCIO QUANDO O VALOR DO BENEFÍCIO É ZERO.         |
| PENDENCIA 10542.                                                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/11/2002 A 27/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ACERTO NO DESFAZER PREPARO DE ABONO ANUAL                                  |
|   PENDÊNCIA 5922                                                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/02/2003 A 19/02/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.03G                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PENDENCIA 11866 - ELIMINAR PREVIA DE PESSOAS CUJO BENEFÍCIO ESTÁ RETIDO.   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/04/2003 A 10/04/2003                         |
| PENDÊNCIA: 13739                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04D                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Quando existe lançamento de 2 benefícios na tabela de Históricos de          |
| benefício a correção do benefício para a segunda linha está sendo feita      |
| utilizando erroneamente o valor somado dos 2 registros.                      |
| Usar seqrubrica na previa.                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/05/2003 A 30/05/2003                         |
| PENDÊNCIA: 14185                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - JUNTAR NO LOTE DE MANUTENÇÃO OS LANÇAMENTOS DE BENEFÍCIOS QUE ESTEJAM EM   |
| OUTROS LOTES. EXEMPLO: REVISÃO DE BENEFÍCIO COLOCAR OS VALORES NUM LOTE DE   |
| CONCESSÃO, MESMO PARA OS BENEFICIÁRIOS QUE ESTEJAM EM MANUTENÇÃO.            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/06/2003 A 16/06/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.06B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - MESMO CANCELANDO A OPÇÃO DE DESFAZER PREPARO NA TELA DE MOTIVO, O SISTEMA  |
| CONTINUAVA O PROCESSO DE DESFAZER.                                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/07/2003 A 07/07/2003                         |
| PENDÊNCIA: 14440                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO DOS PROCESSOS E CONSULTAS PARA MULTI-FUNDAÇÃO.                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/07/2003 A 08/07/2003                         |
| PENDÊNCIA: 14462                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - TRATAMENTO DE ELIMINAÇÃO DOS REGISTROS DA PREVIA PARA BENEFÍCIOS RETIDOS   |
| NA FOLHA DE ABONO ANUAL.                                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/07/2003 A 29/07/2003                         |
| PENDÊNCIA: 14738                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07s                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Não utilizar parâmetro de agrupamento de rubricas na consulta geral da     |
| Prévia.                                                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/09/2003 A 08/09/2003                         |
| PENDÊNCIA: 14990                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.02A                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - QUANDO O MENOR BENEFICIÁRIO TIVER TUTOR, CURADOR OU PROCURADOR REGISTRADO  |
| NO CAMPO IDRESPONNAOREC DA BFCIARIOTITPLAN UTILIZAR ESTA INFORMAÇÃO COMO O   |
| FAVORECIDO DO CRÉDITO DO PAGAMENTO DE BENEFÍCIO.                             |
| Esta pendencia foi recusada provisoriamente                                  |
|                                                                              |
|------------------------------------------------------------------------------}



