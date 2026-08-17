{-------------------------------------------------------------------------------
------------------------------- ALTERAÇÕES -------------------------------------
--------------------------------------------------------------------------------
 N. Chamado....: WO33342
 Dt Alteração..: 25/02/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .Ajustando o padrão da mascara atual do CNPJ para
                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'.
                 .Desabilitando funções sem função e nunca usadas..  
--------------------------------------------------------------------------------
 N. Chamado....: WO32908
 Dt Alteração..: 19/02/2026
 Responsável...: Paulo Nobre
 Descrição.....: O uso do RoundCM, como aplicado na solução da WO abaixo, não
                 surtiu efeito em todos os casos, sendo necessário transformar
                 os valores na comparação em string.
--------------------------------------------------------------------------------
 N. Chamado....: WO28166
 Dt Alteração..: 03/12/2025
 Responsável...: Paulo Nobre
 Descrição.....: Por alguma questão da migração, a comparação entre os valores
                 iguais passou a não dar mais certo, sendo necessário a inclusão
                 da função RoundCM.
--------------------------------------------------------------------------------
 N. Chamado....: MIGRACAO-ORACLE
 Dt Alteração..: 09/10/2025
 Responsável...: LEANDRO
 Descrição.....: colocado CAST nas consultas para defdinir o tamanho do campo NSA
--------------------------------------------------------------------------------
 N. Chamado....: WO13745
 Dt Alteração..: 16/08/2024
 Responsável...: Edilaine
 Descrição.....: Remover atualização WO9474_9284 - WO11547
--------------------------------------------------------------------------------
// N. Chamado....: WO13032
// Dt Alteração..: 30/07/2024
// Responsável...: Edilaine
// Descrição.....: Remover atualização WO9474_9284 - WO11547
--------------------------------------------------------------------------------
// N. Chamado....: WO9474_9284 - WO11547
// Dt Alterações.: 08/04/2024  14/05/2024  05/06/2024
//                 11/06/2024  14/06/2024  26/06/2024
//                 03/07/2024
// Responsável...: Paulo Nobre
// Descrição.....: .Ajuste em várias rotinas para tratar o novo tipo de
//                  pagamento: "PIX".
//                 .Alteração do tamanho dos campos NUMLEITCODBARRAS e
//                  NUMCODBARRAS na tabela DOCUMENTO e DOCUMENTOXCODBARRAS para
//                  79 caracteres.
//                 .Ajuste em várias rotinas para melhorar a performance geral
//                  . Troca de componentes query por cds;
//                  . Habilitação/Desabilitação de controles antes da
//                    movimentação das querys e cds;
//                 .Inclusão de mensagens de aviso no processamento das rotinas
--------------------------------------------------------------------------------
// N. Chamado....: WO6243
// Dt Alteração..: 31/01/2024
// Responsável...: Everson Cunha
// Descrição.....: Ordenação da query _SelecionaMovArqDetalhe
--------------------------------------------------------------------------------
// N. Chamado....: WO3978
// Dt Alteração..: 03/11/2023
// Responsável...: Leandro Pocebon
// Descrição.....: Importtação da Lista de Titulos via arquivo
--------------------------------------------------------------------------------
// N. Chamado....: WO4485
// Dt Alteração..: 31/10/2023
// Responsável...: Everson Cunha
// Descrição.....: Ajuste no IF da procedure ppDetailBand2BeforePrint
--------------------------------------------------------------------------------
// N. Chamado....: WO1822
// Dt Alteração..: 18/09/2023
// Responsável...: Everson Cunha
// Descrição.....: Imprimir relatório "Relação de Pagamentos via Remessa
//                 Eletrônica - Modelo COFIN" após a geração do Arquivo
--------------------------------------------------------------------------------
// Rotina.............: spbPrepararEnvioClick
// N. SIG.............: 131339
// Data da Alteração..: 22/12/2022
// Responsável........: Cássio Florencio Rovaroto
// Descrição..........: Alteração verificação de documentos a serem incluídos na
//						          remessa eletrônica.
//------------------------------------------------------------------------------
// Rotina.............:_AnaliseDoMovimento
// N. SIG.............: 130274
// Data da Alteração..: 04/11/2022
// Responsável........: Cássio Florencio Rovaroto
// Descrição..........: Inclusão de tratamento para a forma de pagamento
//                      "DARF COD 5565 - COD DE BARRAS".
//------------------------------------------------------------------------------
// Rotina.............:_AnaliseDoMovimento
// N. SIG.............: 125556
// Data da Alteração..: 13/05/2022
// Responsável........: Cássio Florencio Rovaroto
// Descrição..........: Inclusão de tratamento para as formas de pagamento
//                      "Crédito CAIXA, DOC e TED".
//------------------------------------------------------------------------------
// Rotina.............:_AnaliseDoMovimento
// N. SIG.............: 122415
// Data da Alteração..: 03/02/2022
// Responsável........: Cássio Florencio Rovaroto
// Descrição..........: Inclusão de tratamento para as formas de pagamento
//                      "DARF DCTFWEB - INSS" e "DARF - CODIGO DE BARRAS".
//------------------------------------------------------------------------------
//N. SIG........: 121770
//Dt Alteração..: 18/03/2022
//Responsável...: Luis Ferrari
//Descrição.....: Retirar validação de cpf e cnpj para valor maior que 250000
--------------------------------------------------------------------------------
//N. SIG........: 117206
//Dt Alteração..: 23/12/2021
//Responsável...: Everson Cunha
//Descrição.....: DCTFWeb
--------------------------------------------------------------------------------
// N. SIG.............: 117008
// Data da Alteração..: 01/07/2021
// Responsável........: Everson Cunha
// Descrição..........: Melhoria na rotina "ExlcuiFavorecidosNaoGerados"
//------------------------------------------------------------------------------
//Pendência   : SIG 114623
//Responsável : Ewerton Beltramini
//Data        : 29/01/2021
//Descrição   : Implementação do comando Copy, para igualar as bases de produção
//******************************************************************************
//Rotina.............: qryDocumentoAfterScroll, btnAltGeralClick, btnConTitClick
//                     dbeCodigoBarrasTitulosExit, DbeCodigoBarrasGeralExit
//DFM................: dbeValorPagtoKeyUp
//N. SIG.............: 112509
//Data da Alteração..: 10/03/2021
//Responsável........: Edilaine
//Descrição..........: Nos boletos com valor zerado, apresentar valor liquido
//                     do documento
//******************************************************************************
//Rotina.............: spbGerarArqClick, spbCancelarMovArqGeradoClick,
//                     spbRegerarArqClick  
//N. SIG.............: 114764
//Data da Alteração..: 06/04/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação da montagem de arquivos de remessa para o
//                     BANCO DO BRASIL.
//******************************************************************************
//Rotina.............: _AnaliseDoMovimento
//N. SIG.............: 102967
//Data da Alteração..: 08/10/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na forma de análise de documentos para remessa,
//                     voltando a versão anterior.
//******************************************************************************
//Rotina.............: _AnaliseDoMovimento, spbAnalisarClick
//N. SIG.............: 102320   
//Data da Alteração..: 30/09/2020
//Alteração Form.....: FRemessaEletronica
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na forma de análise de documentos para remessa.
//******************************************************************************
//Rotina.............: _AnaliseDoMovimento
//N. SIG.............: 102316
//Data da Alteração..: 15/09/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de novos códigos DARF no procedimento de análise.
//******************************************************************************
//N. SIG.............: 102122
//Data da Alteração..: 08/09/2020
//Alteração Form.....: FRemessaEletronica
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção da alteração de remessa COD 2100
//******************************************************************************
//Rotina.............: spbDesfazerPrepClick
//N. SIG.............: 101753
//Data da Alteração..: 24/08/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Tratamento na exclusão de Lista de Favorecidos.
//******************************************************************************
//Rotina.............: bbtnSairClick
//N. SIG.............: 101677
//Data da Alteração..: 18/08/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação da funcionalidade para não excluir favorecidos
//                     em remessas não geradas.
//******************************************************************************
//Rotina.............: spbGerarArqClick, spbRegerarArqClick
//N. SIG.............: 101591
//Data da Alteração..: 14/08/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção no formato geração do arquivo.
//******************************************************************************
//Rotina             : btnAltGeralClick
//N. SIG..........   : 100970
//Data da Alteração: : 14/08/2020
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Correção no tratamento de detalhamento de pagamentos de
//                     tributos.
//******************************************************************************
//Rotina             : spbLocalizaArqRetClick, spbLocalizaArqRetClick,
//                     _AnaliseDoMovimento
//N. SIG..........   : 64071
//Data da Alteração: :
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Adequação da funcionalidade para utilização, também, no
//                     módulo Empréstimo.
//*********************************************************************************
//Rotina             : FormCreate, spbSelRemessaClick, cdsMovRemessaAfterScroll,
//                     spbImportarMovListaClick, spbPrepararEnvioClick
//N. SIG..........   : 60540
//Data da Alteração: :
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Adequação da funcionalidade para utilização, também, no
//                     módulo Folha de Benefício.
//*********************************************************************************
//N. SIG.............: 100662
//Data da Alteração..: 29/06/2020
//Alteração Form.....: FRemessaEletronica
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Tratamento nas informações da Guia de Previdência Social,
//                     para que os dados não sejam alterados. 
//******************************************************************************
//Rotina.............: dbeVLRINSSExit, dbeVLROUTRAS_ENTIDADESExit, dbeVLRIRRFExit,
//					   dbeVLRMULTA_DARFExit, dbeVLRJUROSExit, _AnaliseDoMovimento,
//					   btnAltGeralClick, btnConGeralClick, HabilitaDesabilitaCampos,
//					   AtualizaValorTotal_DARF_INSS
//N. SIG.............: 100343
//Data da Alteração..: 12/06/2020
//Alteração Form.....: FFemessaEletronica
//Responsável........: Cássio Flroencio Rovaroto
//Descrição..........: Tratamento da geração de linhas de pagamento de GPS de
//                     Autônomos e possibilidade de ajustes nos dados básicos de 
//					   DARF e GPS.  
//******************************************************************************
//N. SIG.............: 100336
//Data da Alteração..: 05/06/2020
//Alteração Form.....: FRemessaEletronica
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Retirada das informações de Centro de Responsabilidade da
//                     funcionalidade.
//******************************************************************************
//Rotina.............: _AnaliseDoMovimento
//N. SIG.............: 99887
//Data da Alteração..: 14/05/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de tratamento para as novas tipos de DARF,
//                     durante análise.
//******************************************************************************
//N. SIG.............: 99642
//Data da Alteração..: 29/04/2020
//Responsável........: Everson Cunha
//Descrição..........: Correção na rotina que verifica gravação de códigos de
//                     barras duplicado. _ExisteCodBarras
//******************************************************************************
//Rotina.............: _AnaliseDoMovimento
//N. SIG.............: 99446
//Data da Alteração..: 14/04/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de tratamento para as novas GPS criadas, durante
//                     análise.
//******************************************************************************
//N. SIG.............: 84050
//Data da Alteração..: 18/02/2020
//Responsável........: Everson Cunha
//Descrição..........: Solicito a criação de ferramenta na Remessa Eletrônica
//                     para liquidações de Tributos (GPS, DARFs, FGTS, DAR),
//                     conforme layout encaminhado pelo Fernando (NEXXERA).
//******************************************************************************
//N. SIG.............: 88640
//Data da Alteração..: 12/12/2019
//Responsável........: Everson Cunha
//Descrição..........: Não permitir a gravação de códigos de barras duplicado
//******************************************************************************
//Rotina.............: spbPrepararEnvioClick
//N. SIG.............: 94306
//Data da Alteração..: 13/11/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na linha que gera o preparo do arquivo de
//                     remessa.
//******************************************************************************
//Rotina.............: spbPrepararEnvioClick
//N. SIG.............: 63651
//Data da Alteração..: 12/11/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão da data de vencimento nos registros das linhas
//                     do arquivo.
//******************************************************************************
//Rotina.............: spbPrepararEnvioClick
//N. SIG.............: 88580
//Data da Alteração..: 11/07/2019
//Alteração Form.....: FRemessaEletronica
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Não permitir o preparo se houver boleto com
//                     valor <> do valor da AP.
//******************************************************************************
//Rotina.............: btnAltTitClick
//N. SIG.............: 88585
//Data da Alteração..: 09/07/2019
//Alteração Form.....: FRemessaEletronica
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Não permitir alterar o valor de pagamento de boleto.
//******************************************************************************
//Rotina.............: spbImportarMovListaClick
//N. SIG.............: 81872
//Data da Alteração..: 14/03/2019
//Alteração Form.....: FRemessaEletronica
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na forma de leitura do arquivo de favorecidos.
//******************************************************************************
//Rotina             : .dfm (qryMovArqGeradoDet, rptMovArqGerado)
//N. SIG..........   : SIG TIBERO
//Data da Alteração: : 24/10/2018
//Responsável:       : Everson Luiz Pereira da Cunha
//Descrição.......   : Melhoria no relatório de Remessa Eletrônica
//                     Incluir C.R. e Histórico
//******************************************************************************
//Rotina             : spbGerarArqClick, spbRegerarArqClick
//N. SIG..........   : 75603
//Data da Alteração: : 20/09/2018
//Responsável:       : Cássio Florencio Rovaroto
//Descrição.......   : Correção na montagem do arquivo de remessa.
//******************************************************************************
//Rotina             : _ProcessarBaixa, spbBaixarMovArqGeradoPendClick,
//                     spbBaixarMovArqGeradoClick
//                     spbBaixarMovRetornoClick
//N. SIG..........   : 75325
//Data da Alteração: : 17/09/2018
//Responsável:       : Edilaine
//Descrição.......   : Alteração na forma de utilização do NSA na operação
//                     de gerar arquivos remessa.
//******************************************************************************
//Rotina             : spbGerarArqClick
//N. SIG..........   : 75187
//Data da Alteração: : 12/09/2018
//Alteração Form:    : fRemessaEletornica
//Responsável:       : Cássio Florencio Rovaroto
//Descrição.......   : Alteração na forma de utilização do NSA na operação de
//                     gerar arquivos remessa.
//******************************************************************************
//Rotina             : spbPrepararEnvioClick, spbBaixarMovArqGeradoClick,
//                     spbBaixarMovArqGeradoPendClick
//N. SIG..........   : 74164
//Data da Alteração: : 06/09/2018
//Alteração Form:    : fRemessaEletornica
//Responsável:       : Cássio Florencio Rovaroto
//Descrição.......   : Alteração na atribuição de identificação de documentos,
//                     código de barras ou favorecidos nos arquivos de remessa.
//******************************************************************************
//Rotina             : spbGerarArqClick, spbCancelarMovArqGeradoClick,
//                     spbLocalizaArqRetClick,
//                     spbRegerarArqClick
//N. SIG..........   : 73883
//Data da Alteração  : 20/08/2018
//Alteração Form     : FrmRemessaEletronica
//Responsável        : Cássio Florencio Rovaroto
//Descrição          : Alteração atribuição do nome do arquivo de remessa,
//                     colocando o NSA no lugar do identificador do envio.
//                     Inclusão de rotina gravação de arquivo no servidor.
//******************************************************************************
//Rotina             : Diversas
//N. SOL..........   : 212845
//N. PPM..........   : 1129416
//Data da Alteração  : 01/03/2016
//Alteração Form     : FrmRemessaEletronica
//Responsável        : Paulo Nobre
//Descrição          : Desenv. de nova funcionalidade - Remessa Eletrônica
//******************************************************************************}


Unit FRemessaEletronica;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, ExtCtrls, wwdbdatetimepicker, uCmMath,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBClient, uCMClientDataSet, FileCtrl, TEdNum,
  ComCtrls, MontaSelect, DBTables, DBCtrls, uCmSqlParams,
  QExport3Dialog, Grids, Wwdbigrd, Wwdbgrid, Wwintl, ImgList, wwDialog,
  Wwlocate, wwSpeedButton, wwDBNavigator, Mask, uDiasUteis,
  wwdbedit, ppBands, ppPrnabl, ppClass, ppCtrls, ppDB, ppDBPipe, ppDBBDE,
  ppParameter, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  CMProcura, TREdit, jpeg, ppVar, Wwquery, QExport3,
  TXComp, TXRB, Wwfltdlg, wwidlg, Menus, wwclearpanel, Wwdatsrc, Wwdbdlg,
  Gauges, TB97Ctls, CMProcuraSubTipo, CmParamReport,
  uCtrlParamIntegra, uCtrlRemessaEletronica, uFuncoesUteisIR, uCtrlPadroes,
  uCtrlBaixaDocumentos, ppModule, raCodMod, uCtrlDocumento, uCtrlFinanc,
  uCtrlFuncoesCapCar, wwriched, DBGrids, ppStrtch, ppRichTx, ppMemo, Wwdotdot,
  Wwdbcomb, daDataModule,
  uCtrlPessoa;    // Paulo Nobre - WO33342;

Const CorDaZebra = clBtnFace; // $00FDD2D0
Const iClientHeight = 728; // Altura padrão do Form
Const iClientWidth = 1166; // Largura padrão do Form

  // Mensagens Gerais
Const MSG001 = 'Obrigatório preencher o Convênio. Verifique !';
Const MSG002 = 'Obrigatório preencher a Data Inicial. Verifique !';
Const MSG003 = 'Obrigatório preencher a Data Final. Verifique !';
Const MSG004 = 'Data Inicial não pode ser superior a Data Final. Verifique !';
Const MSG005 = 'Confirma Exclusão dos Lançamentos Importados ?';
Const MSG006 = 'Favorecido não Informado. Verifique !';
Const MSG007 = 'Dados Bancários não Informados. Verifique !';
Const MSG008 = 'Valor do Pagamento não Informado. Verifique !';
Const MSG010 = 'Valor do Lançamento MAIOR que o Saldo do Documento. Verifique !';
Const MSG011 = 'Valor Total da Lista MAIOR que o Saldo do Documento. Verifique !';
Const MSG012 = 'Não há Lançamento(s) Marcado(s). Verifique !';
Const MSG013 = 'Tipo "Ficha de Compensação" com tamanho inválido. Verifique !';
Const MSG014 = 'Tipo "Arrecadação" com tamanho inválido. Verifique !';
Const MSG015 = 'Código de Barras ou Linha Digitável Inválido. Verifique !';
Const MSG016 = 'Data de Pagamento não Informada. Verifique !';
Const MSG017 = 'Não há Saldo Disponível para esta Operação. Verifique !';
Const MSG018 = 'Código de Barras/Linha Digitável não Informado. Verifique !';
Const MSG019 = 'Não há Movimento Disponível. Verifique !';
Const MSG020 = 'Não localizado Movimento para os critérios Selecionados. Verifique !';
Const MSG021 = 'Sem Lançamento para esta Operação. Verifique !';
Const MSG022 = 'O Convênio selecionado não possui diretório de destino Informado. Verifique !';
Const MSG023 = 'Problemas no Processamento do Arquivo !';
Const MSG024 = 'Não existe Movimento Importado para ser Excluído. Verifique !';
Const MSG025 = 'Movimento Importado Excluído com Sucesso !';
Const MSG026 = 'Não há Lançamento(s) ''Baixado(s)'' para Desfazer Baixa. Verifique !';
Const MSG027 = 'Esta Forma de Pagamento não permite a inclusão de Favorecidos. Verifique !';
Const MSG028 = 'Esta Forma de Pagamento não permite a inclusão de Títulos. Verifique !';
Const MSG029 = 'CPF/CNPJ Inválido. Verifique !';
Const MSG030 = 'Este Boleto não pode ser pago pela CAIXA. Verifique !';
Const MSG031 = 'Problemas no Processamento do Arquivo de Retorno. Verifique !';
Const MSG032 = 'Obrigatório preencher a Forma de Pagamento. Verifique !';
Const MSG033 = 'CPF/CNPJ do Favorecido não Informado. Verifique !';
Const MSG034 = 'Tipo da Conta não definida no Cadastro deste Favorecido. Verifique !';
Const MSG035 = 'Valor do Código de Barras Diferente do Valor do Documento. Verifique !'; //SIG88580
Const MSG036 = 'O código de barras informado já está em uso. Verifique !'; //Everson Cunha - SIG88640
//Everson Cunha - SIG84050 - Início
Const MSG037 = 'Favor preencher o campo Competência';
Const MSG038 = 'Favor preencher o campo Identificador';
Const MSG039 = 'Favor preencher o campo Valor do INSS';
Const MSG040 = 'Favor preencher o campo Valor Total da GPS';

Const MSG041 = 'Favor preencher o campo Período de Apuração';
Const MSG042 = 'Favor preencher o campo CPF ou CNPJ';
Const MSG043 = 'Favor preencher o campo Código da Receita';
Const MSG044 = 'Favor preencher o campo Data Vencimento';
Const MSG045 = 'Favor preencher o campo Valor Principal';
Const MSG046 = 'Favor preencher o campo Valor Total do DARF';

Const MSG047 = 'Valor Total não confere com o Valor Total do Documento';
Const MSG048 = 'A soma dos Valores não conferem com o Valor Total';
//Everson Cunha - SIG84050 - Fim

  // Mensagens de inconsistências da Análise do Movimento
Const AnMSG01 = 'Forma Pagto exige Lista de Favorecidos / ';
Const AnMSG02 = 'Valor Total da Lista de Favorecido tem que ser Igual ao da AP / ';
Const AnMSG03 = 'Forma Pagto exige Banco igual a CAIXA na Lista de Favorecidos / ';
Const AnMSG04 = 'Forma Pagto exige CPF/CNPJ na Lista de Favorecidos / ';
Const AnMSG05 = 'Forma Pagto exige Banco igual a CAIXA na aba Geral / ';
Const AnMSG06 = 'Forma Pagto exige CPF/CNPJ na AP / ';
Const AnMSG07 = 'Forma Pagto exige Banco diferente de CAIXA na aba Geral / ';
Const AnMSG08 = 'Forma Pagto exige Banco diferente de CAIXA na Lista de Favorecidos / ';
Const AnMSG09 = 'Forma Pagto exige Código de Barras na aba Geral / ';
Const AnMSG10 = 'Valor Total da Lista de Títulos tem que ser Igual ao da AP / ';
Const AnMSG11 = 'Tipo da Conta do Favorecido não definida no Cadastro / ';
Const AnMSG12 = 'Código de Barras, informado na aba Geral, não pode ser pago pela CAIXA / ';
Const AnMSG13 = 'Dados Bancários não Informados na aba Geral / ';
Const AnMSG14 = 'Código de Barras Inválido na aba Geral / ';
Const AnMSG15 = 'Código de Barras Inválido na Lista de Títulos / ';
Const AnMSG16 = 'Forma de Pagamento não parameterizada para remessa / ';
Const AnMSG17 = 'Número da AP não Informado no Documento / ';
//Everson Cunha - SIG84050 - Início
Const AnMSG18 = 'Código de Pagamento não Informado na aba Geral / ';
Const AnMSG19 = 'Competência da GPS não Informada na aba Geral / ';
Const AnMSG20 = 'Identificador da GPS não Informado na aba Geral / ';
Const AnMSG21 = 'Valor do INSS não Informado na aba Geral / ';
Const AnMSG22 = 'Valor Total da GPS não Informado na aba Geral / ';

Const AnMSG23 = 'Período Apuração do DARF não Informado na aba Geral / ';
Const AnMSG24 = 'CPF ou CNPJ do DARF não Informado na aba Geral / ';
Const AnMSG25 = 'Código da Receita do DARF não Informado na aba Geral / ';
Const AnMSG26 = 'Data Vencimento do DARF não Informado na aba Geral / ';
Const AnMSG27 = 'Valor Principal do DARF não Informado na aba Geral / ';
Const AnMSG28 = 'Valor Total do DARF não Informado na aba Geral / ';
//Everson Cunha - SIG84050 - Fim
//Cássio Rovaroto - SIG 100343 - Início
const AnMSG29 = 'Valor Total da GPS - INSS não confere com o Valor do Documento';
const AnMSG30 = 'Valor Total do DARF não confere com o Valor do Documento';
//Cássio Rovaroto - SIG 100343 - Fim
Const AnMSG31 = 'Tipo da Conta do Favorecido não pode ser uma conta salário / '; //Cássio Rovaroto - SIG nº 64071
Const AnMSG32 = 'Análise não implementada para esta forma de pagamento em AP Agrupada / '; //Everson Cunha - SIG117206

//Cássio Rovaroto - SIG nº 64071 - Início
type rgRetorno = record
    IdArquivoPagto: Integer;
    NomeArq: string;
    NSA: integer;
end;
//Cássio Rovaroto - SIG nº 64071 - Fim

type  TFrmRemessaEletronica = Class(TfrmSairAjuda)
    pcGeralRemessa: TPageControl;
    tbsAnalise: TTabSheet;
    tbsGeraArquivo: TTabSheet;
    ListaDeImagens: TImageList;
    DevRptCM: TExtraOptions;
    rptMovArqGerado: TppReport;
    ppParameterList1: TppParameterList;
    ppEmpresa: TppBDEPipeline;
    FMovRemessa: TwwFilterDialog;
    LMovRemessa: TwwLocateDialog;
    cdsConvenio: TCMClientDataSet;
    dsConvenio: TDataSource;
    SQLConvenio: TCMSqlParams;
    qeMovRemessa: TQExport3Dialog;
    SQLMovRemessa: TCMSqlParams;
    cdsMovRemessa: TCMClientDataSet;
    dsMovRemessa: TwwDataSource;
    dsTipoPagto: TwwDataSource;
    qryAux: TwwQuery;
    cdsTipoPagto: TCMClientDataSet;
    SQLTipoPagto: TCMSqlParams;
    imgBotoesManut: TImageList;
    Panel1: TPanel;
    pcAnaliseRemessa: TPageControl;
    tbsAnaliseMovimento: TTabSheet;
    Panel5: TPanel;
    spbExpBenefSel: TSpeedButton;
    spbMarcaTodos: TSpeedButton;
    spbInverterSel: TSpeedButton;
    stQtd1: TStaticText;
    wwDBNavigator4: TwwDBNavigator;
    wwNavButton6: TwwNavButton;
    wwNavButton7: TwwNavButton;
    wwNavButton8: TwwNavButton;
    wwNavButton9: TwwNavButton;
    btnavLocalizarBenef: TwwNavButton;
    btnavFiltrarSelecao: TwwNavButton;
    tbsAnaliseManutencoes: TTabSheet;
    pcDetalManut: TPageControl;
    tbsAnManTitulos: TTabSheet;
    Panel7: TPanel;
    pnlGridMovTitulo: TPanel;
    dbgMovTitulos: TwwDBGrid;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    btnIncTit: TToolbarButton97;
    btnAltTit: TToolbarButton97;
    btnExcTit: TToolbarButton97;
    tbsAnManGeral: TTabSheet;
    tbsAnManListaFavorec: TTabSheet;
    pnlInfMan: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Panel8: TPanel;
    cdsConvenioCODPORTFORMA: TFloatField;
    cdsConvenioDESCRICAO: TStringField;
    cdsTipoPagtoCODFORMA: TFloatField;
    cdsTipoPagtoDESCRICAO: TStringField;
    cdsMovRemessaNUM_AP: TFloatField;
    cdsMovRemessaNUM_DOC: TFloatField;
    cdsMovRemessaRAZAOSOCIAL: TStringField;
    cdsMovRemessaVALOR: TFloatField;
    cdsMovRemessaDATAPROGRAMADA: TDateTimeField;
    cdsMovRemessaFORMA_PAGTO: TStringField;
    cdsMovRemessaMARCADO: TStringField;
    cdsMovRemessaCODDOCUMENTO: TFloatField;
    cdsMovRemessaNUMDOCUMENTO: TStringField;
    dsMovListaFavorecidos: TwwDataSource;
    MSFavorec: TMontaSelect;
    LMovLista: TwwLocateDialog;
    dlgAbreArquivo: TOpenDialog;
    wwDBNavigator3: TwwDBNavigator;
    wwNavButton14: TwwNavButton;
    wwNavButton15: TwwNavButton;
    wwNavButton16: TwwNavButton;
    wwNavButton17: TwwNavButton;
    qryMovListaFavorecidos: TwwQuery;
    qryMovListaFavorecidosCODDOCUMENTO: TFloatField;
    qryMovListaFavorecidosIDDOCUMENTOXPESSOAS: TFloatField;
    qryMovListaFavorecidosIDFORCLI: TFloatField;
    qryMovListaFavorecidosRAZAOSOCIAL: TStringField;
    qryMovListaFavorecidosNUMDOCUMENTO: TStringField;
    qryMovListaFavorecidosIDCBANCARIA: TFloatField;
    qryMovListaFavorecidosNUMBANCO: TStringField;
    qryMovListaFavorecidosNUMAGENCIA: TStringField;
    qryMovListaFavorecidosNUMOPERACAO: TStringField;
    qryMovListaFavorecidosNUMCONTA: TStringField;
    qryMovListaFavorecidosVALOR: TFloatField;
    qryMovListaFavorecidosFLGIMPORTADO: TStringField;
    updMovListaFavorecidos: TUpdateSQL;
    Panel9: TPanel;
    qryContaBancaria: TwwQuery;
    qryContaBancariaNUMBANCO: TStringField;
    qryContaBancariaNUMAGENCIA: TStringField;
    qryContaBancariaNUMCONTA: TStringField;
    qryContaBancariaIDPESSOA: TFloatField;
    qryContaBancariaIDCBANCARIA: TFloatField;
    pcGeraArquivoOper: TPageControl;
    tbsGAGerados: TTabSheet;
    Panel14: TPanel;
    Panel16: TPanel;
    dbgMovRemessa: TwwDBGrid;
    Panel18: TPanel;
    Panel19: TPanel;
    pnlGridMovLista: TPanel;
    dbgMovListaFav: TwwDBGrid;
    Dock974: TDock97;
    spbImportarMovLista: TSpeedButton;
    spbLimparMovLista: TSpeedButton;
    Toolbar974: TToolbar97;
    btnInc1: TToolbarButton97;
    btnAlt1: TToolbarButton97;
    btnExc1: TToolbarButton97;
    dbNavListFavorec: TwwDBNavigator;
    wwNavButton5: TwwNavButton;
    wwNavButton10: TwwNavButton;
    wwNavButton11: TwwNavButton;
    wwNavButton12: TwwNavButton;
    wwNavButton13: TwwNavButton;
    pnlDadosMovLista: TPanel;
    Label7: TLabel;
    GpConta: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    spbBuscaContaCor: TSpeedButton;
    DbeConta: TwwDBEdit;
    dbeBanco: TwwDBEdit;
    DbeAgencia: TwwDBEdit;
    dbeValorPagtoLista: TDBRealEdit;
    GroupBox1: TGroupBox;
    spbLocalizaFavorec: TSpeedButton;
    dbeNomeFavorec: TwwDBEdit;
    tbsGAPendentes: TTabSheet;
    Panel40: TPanel;
    Dock976: TDock97;
    Toolbar973: TToolbar97;
    btnAltGeral: TToolbarButton97;
    pnlDadosMovGeral: TPanel;
    dsMovArqPendente: TwwDataSource;
    dsMovArqPendDet: TwwDataSource;
    qryAux2: TwwQuery;
    qryMovArqPendDet: TwwQuery;
    cdsMovRemessaCODFORMA: TFloatField;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    SpeedButton5: TSpeedButton;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    cdsTipoPagtoGeral: TCMClientDataSet;
    StringField1: TStringField;
    FloatField1: TFloatField;
    dsTipoPagtoGeral: TwwDataSource;
    GroupBox2: TGroupBox;
    DblCodForma: TwwDBLookupCombo;
    SqlTipoPagtoGeral: TCMSqlParams;
    qryDocumento: TwwQuery;
    dsDocumento: TwwDataSource;
    updDocumento: TUpdateSQL;
    qryDocumentoCODDOCUMENTO: TFloatField;
    qryDocumentoCODFORMA: TFloatField;
    qryDocumentoCODPORTFORMA: TFloatField;
    qryDocumentoIDCBANCARIA: TFloatField;
    qryDocumentoIDFORCLI: TFloatField;
    qryDocumentoNUMLEITCODBARRAS: TStringField;
    dsContaBancaria: TwwDataSource;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    DbeCodigoBarrasGeral: TwwDBEdit;
    rdgTipoTituloGeral: TRadioGroup;
    DBEdit4: TDBEdit;
    dbrValorDocGeral: TDBRealEdit;
    qryMovTitulos: TwwQuery;
    dsMovTitulos: TwwDataSource;
    updMovTitulos: TUpdateSQL;
    qryMovTitulosCODDOCUMENTO: TFloatField;
    qryMovTitulosIDDOCUMENTOXCODBARRAS: TFloatField;
    qryMovTitulosNUMCODBARRAS: TStringField;
    qryMovTitulosVLRPAGTO: TFloatField;
    qryMovTitulosDTPAGTO: TDateTimeField;
    qryMovTitulosFLGTIPOCODBARRAS: TStringField;
    qryMovTitulosTIPOCODBARRA: TStringField;
    qryCtaBancariaGeral: TwwQuery;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    dsCtaBancariaGeral: TwwDataSource;
    spbLimpaCampo1: TSpeedButton;
    DBEdit5: TDBEdit;
    Panel6: TPanel;
    edSaldoListaFav: TRealEdit;
    Image1: TImage;
    Label5: TLabel;
    Panel10: TPanel;
    Image2: TImage;
    Label10: TLabel;
    edSaldoTitulo: TRealEdit;
    Panel11: TPanel;
    Panel21: TPanel;
    Panel27: TPanel;
    Panel31: TPanel;
    dbgMovArqGerado: TwwDBGrid;
    Panel35: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    dsMovArqGerado: TwwDataSource;
    qryMovArqGeradoDet: TwwQuery;
    dsMovArqGeradoDet: TwwDataSource;
    cdsMovArqPendente: TCMClientDataSet;
    SqlMovArqPendente: TCMSqlParams;
    cdsMovArqPendenteIDARQUIVOPAGTO: TFloatField;
    cdsMovArqPendenteCODPORTFORMA: TFloatField;
    cdsMovArqPendenteUSU_PREPARO: TStringField;
    cdsMovArqPendenteDT_PREPARO: TDateTimeField;
    cdsMovArqPendenteVLRTOTAL: TFloatField;
    cdsMovArqPendenteDTGERACAOARQTXT: TDateTimeField;
    cdsMovArqPendenteUSUGERACAOARQTXT: TStringField;
    cdsMovArqPendenteNOMEARQTXT: TStringField;
    cdsMovArqPendenteDTCANCELAARQTXT: TDateTimeField;
    cdsMovArqPendenteUSUCANCELAARQTXT: TStringField;
    cdsMovArqPendenteFLGENVIADO: TStringField;
    cdsMovArqGerado: TCMClientDataSet;
    SqlMovArqGerado: TCMSqlParams;
    tbsGACancelados: TTabSheet;
    cdsMovArqCancelado: TCMClientDataSet;
    dsMovArqCancelado: TwwDataSource;
    SqlMovArqCancelado: TCMSqlParams;
    cdsConvenioPATHARQUIVOREM: TStringField;
    cdsConvenioNUMEMPRESABANCO: TStringField;
    wwIntl_Port: TwwIntl;
    qryEmpresa: TwwQuery;
    qryEmpresaIDPESSOA: TFloatField;
    qryEmpresaNOMEEMPRESA: TStringField;
    qryEmpresaRAZAOSOCIAL: TStringField;
    qryEmpresaIDENDERECO: TFloatField;
    qryEmpresaCEP: TStringField;
    qryEmpresaIMAGEM: TBlobField;
    dsEmpresa: TwwDataSource;
    Dock973: TDock97;
    tb97Detalhe: TToolbar97;
    btnCon1: TBitBtn;
    btnCan1: TBitBtn;
    Dock977: TDock97;
    Toolbar975: TToolbar97;
    btnConGeral: TBitBtn;
    btnCanGeral: TBitBtn;
    cdsMovArqPendentePATHARQUIVOREM: TStringField;
    SpeedButton3: TSpeedButton;
    cdsMovRemessaCPF_CNPJ_MASC: TStringField;
    qryMovListaFavorecidosCPF_CNPJ_MASC: TStringField;
    Panel15: TPanel;
    wwDBNavigator1: TwwDBNavigator;
    wwNavButton1: TwwNavButton;
    wwNavButton2: TwwNavButton;
    wwNavButton3: TwwNavButton;
    wwNavButton4: TwwNavButton;
    wwNavButton18: TwwNavButton;
    wwNavButton19: TwwNavButton;
    SpeedButton12: TSpeedButton;
    wwDBNavigator2: TwwDBNavigator;
    wwNavButton20: TwwNavButton;
    wwNavButton21: TwwNavButton;
    wwNavButton22: TwwNavButton;
    wwNavButton23: TwwNavButton;
    wwNavButton24: TwwNavButton;
    wwNavButton25: TwwNavButton;
    SpeedButton13: TSpeedButton;
    FMovArqGerado: TwwFilterDialog;
    LMovArqGerado: TwwLocateDialog;
    LMovCancelado: TwwLocateDialog;
    qeMovArqGerado: TQExport3Dialog;
    FMovCancelado: TwwFilterDialog;
    qeMovCancelado: TQExport3Dialog;
    Panel33: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    dsMovArqCancelDet: TwwDataSource;
    cdsMovArqPendentePATHARQUIVOSEGURANCA: TStringField;
    Panel46: TPanel;
    pnlCritSel: TPanel;
    grpDataProc: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    lblDataInicial: TLabel;
    Label8: TLabel;
    spbSelRemessa: TSpeedButton;
    dblkpConvenio: TwwDBLookupCombo;
    dblkpFormaPagto: TwwDBLookupCombo;
    dbDataProgIni: TCMDateTimePicker;
    dbDataProgFim: TCMDateTimePicker;
    Panel45: TPanel;
    LMovArqGeradoPend: TwwLocateDialog;
    FMovArqGeradoPend: TwwFilterDialog;
    MSMovArqGeradoPend: TMontaSelect;
    cdsMovRemessaNOME_CONVENIO: TStringField;
    cdsMovArqPendenteNOME_CONVENIO: TStringField;
    Panel50: TPanel;
    GroupBox6: TGroupBox;
    Label17: TLabel;
    dblkpConvenio2: TwwDBLookupCombo;
    dbNomeConvenioSel: TDBEdit;
    dbeCaminhoArq: TDBEdit;
    qryAux1: TwwQuery;
    qryMovTitulosCOD_BARRAS_MASC: TStringField;
    qryDocumentoCOD_BARRAS_MASC: TStringField;
    CmpDadosParaBaixaCAP: TCmParamReport;
    cdsMovBaixa: TCMClientDataSet;
    SqlMovBaixa: TCMSqlParams;
    cdsMovBaixaIDARQUIVOPAGTO: TFloatField;
    cdsMovBaixaDSC_CONVENIO: TStringField;
    cdsMovBaixaVALOR: TFloatField;
    cdsMovBaixaCODDOCUMENTO: TFloatField;
    cdsMovBaixaCODTIPDOC: TFloatField;
    cdsMovBaixaDATAPROGRAMADA: TDateTimeField;
    cdsMovBaixaIDMODULO: TFloatField;
    cdsMovBaixaOPERACAO: TStringField;
    cdsMovBaixaIDFORCLI: TFloatField;
    cdsMovBaixaNUMLANCTO: TFloatField;
    cdsMovBaixaDEBCRE: TStringField;
    cdsMovArqPendenteSTATUS: TStringField;
    cdsMovArqPendentePATHARQUIVOBACKUP: TStringField;
    SpeedButton4: TSpeedButton;
    cdsMovBaixaNUMARQUIVO: TFloatField;
    cdsMovBaixaNODOCUMENTO: TFloatField;
    cdsMovBaixaCOMPLDOCUMENTO: TStringField;
    cdsMovBaixaNOME: TStringField;
    cdsMovRemessaCODPORTFORMA: TFloatField;
    spbCancelarMovArqGerado: TSpeedButton;
    spbBaixarMovArqGerado: TSpeedButton;
    spbDesfazerBaixa2: TSpeedButton;
    spbDesfazerPrep: TSpeedButton;
    spbBaixarMovArqGeradoPend: TSpeedButton;
    spbDesfazerBaixa: TSpeedButton;
    spbImpMovArqGerado: TSpeedButton;
    spbAnalisar: TSpeedButton;
    spbPrepararEnvio: TSpeedButton;
    Label6: TLabel;
    Label19: TLabel;
    edDtVenctoGeral: TEdit;
    edValorGeral: TRealEdit;
    qryBancoFUNCEF: TwwQuery;
    dsBancoFUNCEF: TwwDataSource;
    qryBancoFUNCEFNUMBANCO: TStringField;
    qryBancoFUNCEFNUMAGENCIA: TStringField;
    qryBancoFUNCEFCONTACORRENTE: TStringField;
    qryBancoFUNCEFNOME_BANCO: TStringField;
    qryBancoFUNCEFNOME_AGENCIA: TStringField;
    ppBancoFUNCEF: TppBDEPipeline;
    spbGerarArq: TSpeedButton;
    Panel3: TPanel;
    Panel12: TPanel;
    qryMovArqCancelDet: TwwQuery;
    tbsGAFinalizados: TTabSheet;
    Panel23: TPanel;
    wwDBNavigator6: TwwDBNavigator;
    wwNavButton26: TwwNavButton;
    wwNavButton27: TwwNavButton;
    wwNavButton28: TwwNavButton;
    wwNavButton29: TwwNavButton;
    wwNavButton32: TwwNavButton;
    wwNavButton33: TwwNavButton;
    dbgMovArqFinalizado: TwwDBGrid;
    Panel26: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    cdsMovArqFinalizado: TCMClientDataSet;
    dsMovArqFinalizado: TwwDataSource;
    SqlMovArqFinalizado: TCMSqlParams;
    qryMovArqFinalDet: TwwQuery;
    dsMovArqFinalDet: TwwDataSource;
    cdsMovRemessaMSGERRO: TStringField;
    cdsMovRemessaFLGPERMITELISTAFAVORECIDO: TStringField;
    cdsMovRemessaFLGPERMITETITULOSPAGTO: TStringField;
    qryMovTitulosNUMDOCUMENTO: TStringField;
    qryMovTitulosCPF_CNPJ_MASC: TStringField;
    Panel55: TPanel;
    pnlDadosMovTitulo: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    dbeCodigoBarrasTitulos: TwwDBEdit;
    dbDataVenctoBoleto: TCMDateTimePicker;
    rdgTipoTitulo: TRadioGroup;
    dbCPFCNPJ: TwwDBEdit;
    dbeValorPagto: TDBRealEdit;
    Dock975: TDock97;
    Toolbar972: TToolbar97;
    btnConTit: TBitBtn;
    btnCanTit: TBitBtn;
    SpeedButton1: TSpeedButton;
    qeMovFinalizado: TQExport3Dialog;
    cdsTipoPagtoORDEM: TFloatField;
    qryContaBancariaTIPOCONTA: TStringField;
    qryCtaBancariaGeralTIPOCONTA: TStringField;
    qryMovListaFavorecidosTIPOCONTA: TStringField;
    FMovFinalizado: TwwFilterDialog;
    LMovFinalizado: TwwLocateDialog;
    spbCalc: TSpeedButton;
    tbsArqRetorno: TTabSheet;
    Panel54: TPanel;
    GroupBox7: TGroupBox;
    Panel94: TPanel;
    Panel95: TPanel;
    dlgLocArqRetorno: TOpenDialog;
    qryMovRetorno: TwwQuery;
    dsMovRetorno: TwwDataSource;
    spbLocalizaArqRet: TSpeedButton;
    Panel20: TPanel;
    spbBaixarMovRetorno: TSpeedButton;
    spbDesfazerBaixa3: TSpeedButton;
    spbImpMovArqRetorno: TSpeedButton;
    pnlCabRetMom: TPanel;
    SpeedButton9: TSpeedButton;
    wwDBNavigator8: TwwDBNavigator;
    wwNavButton36: TwwNavButton;
    wwNavButton37: TwwNavButton;
    wwNavButton38: TwwNavButton;
    wwNavButton39: TwwNavButton;
    wwNavButton40: TwwNavButton;
    wwNavButton41: TwwNavButton;
    dbgMovRetorno: TwwDBGrid;
    Panel13: TPanel;
    Panel17: TPanel;
    Panel22: TPanel;
    Panel24: TPanel;
    SpeedButton2: TSpeedButton;
    wwDBNavigator5: TwwDBNavigator;
    wwNavButton30: TwwNavButton;
    wwNavButton31: TwwNavButton;
    wwNavButton34: TwwNavButton;
    wwNavButton35: TwwNavButton;
    wwNavButton42: TwwNavButton;
    wwNavButton43: TwwNavButton;
    dbgMovArqGeradoPend: TwwDBGrid;
    Panel25: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    wwDBGrid6: TwwDBGrid;
    Panel30: TPanel;
    qeMovArqPend: TQExport3Dialog;
    qeMovArqRet: TQExport3Dialog;
    cdsMovArqPendenteNSA: TStringField;
    cdsMovArqPendenteDTFINALIZAARQTXT: TDateTimeField;
    cdsMovArqPendenteUSUFINALIZAARQTXT: TStringField;
    cdsMovArqPendentePATHARQUIVORET: TStringField;
    qryMovArqPendDetNUM_AP: TFloatField;
    qryMovArqPendDetNODOCUMENTO: TFloatField;
    qryMovArqPendDetDATAPROGRAMADA: TDateTimeField;
    qryMovArqPendDetVALOR: TFloatField;
    qryMovArqPendDetCPF_CNPJ_MASC: TStringField;
    qryMovArqPendDetRAZAOSOCIAL: TStringField;
    qryMovArqPendDetNUM_BANCO: TStringField;
    qryMovArqPendDetNUM_AGENCIA: TStringField;
    qryMovArqPendDetNUM_CONTA: TStringField;
    qryMovArqPendDetCOD_BARRAS_MASC: TStringField;
    qryMovArqPendDetFORMA_PAGTO: TStringField;
    qryMovArqPendDetSTATUS: TStringField;
    qryMovArqPendDetCODFORMA: TFloatField;
    cdsMovArqGeradoIDARQUIVOPAGTO: TFloatField;
    cdsMovArqGeradoCODPORTFORMA: TFloatField;
    cdsMovArqGeradoNSA: TStringField;
    cdsMovArqGeradoVLRTOTAL: TFloatField;
    cdsMovArqGeradoDT_PREPARO: TDateTimeField;
    cdsMovArqGeradoUSU_PREPARO: TStringField;
    cdsMovArqGeradoDTGERACAOARQTXT: TDateTimeField;
    cdsMovArqGeradoUSUGERACAOARQTXT: TStringField;
    cdsMovArqGeradoNOMEARQTXT: TStringField;
    cdsMovArqGeradoDTFINALIZAARQTXT: TDateTimeField;
    cdsMovArqGeradoUSUFINALIZAARQTXT: TStringField;
    cdsMovArqGeradoDTCANCELAARQTXT: TDateTimeField;
    cdsMovArqGeradoUSUCANCELAARQTXT: TStringField;
    cdsMovArqGeradoNOME_CONVENIO: TStringField;
    cdsMovArqGeradoFLGENVIADO: TStringField;
    cdsMovArqGeradoPATHARQUIVOREM: TStringField;
    cdsMovArqGeradoPATHARQUIVORET: TStringField;
    cdsMovArqGeradoPATHARQUIVOSEGURANCA: TStringField;
    cdsMovArqGeradoPATHARQUIVOBACKUP: TStringField;
    cdsMovArqGeradoSTATUS: TStringField;
    cdsMovArqCanceladoIDARQUIVOPAGTO: TFloatField;
    cdsMovArqCanceladoCODPORTFORMA: TFloatField;
    cdsMovArqCanceladoNSA: TStringField;
    cdsMovArqCanceladoVLRTOTAL: TFloatField;
    cdsMovArqCanceladoDT_PREPARO: TDateTimeField;
    cdsMovArqCanceladoUSU_PREPARO: TStringField;
    cdsMovArqCanceladoDTGERACAOARQTXT: TDateTimeField;
    cdsMovArqCanceladoUSUGERACAOARQTXT: TStringField;
    cdsMovArqCanceladoNOMEARQTXT: TStringField;
    cdsMovArqCanceladoDTFINALIZAARQTXT: TDateTimeField;
    cdsMovArqCanceladoUSUFINALIZAARQTXT: TStringField;
    cdsMovArqCanceladoDTCANCELAARQTXT: TDateTimeField;
    cdsMovArqCanceladoUSUCANCELAARQTXT: TStringField;
    cdsMovArqCanceladoNOME_CONVENIO: TStringField;
    cdsMovArqCanceladoFLGENVIADO: TStringField;
    cdsMovArqCanceladoPATHARQUIVOREM: TStringField;
    cdsMovArqCanceladoPATHARQUIVORET: TStringField;
    cdsMovArqCanceladoPATHARQUIVOSEGURANCA: TStringField;
    cdsMovArqCanceladoPATHARQUIVOBACKUP: TStringField;
    cdsMovArqCanceladoSTATUS: TStringField;
    cdsMovArqFinalizadoIDARQUIVOPAGTO: TFloatField;
    cdsMovArqFinalizadoCODPORTFORMA: TFloatField;
    cdsMovArqFinalizadoNSA: TStringField;
    cdsMovArqFinalizadoVLRTOTAL: TFloatField;
    cdsMovArqFinalizadoDT_PREPARO: TDateTimeField;
    cdsMovArqFinalizadoUSU_PREPARO: TStringField;
    cdsMovArqFinalizadoDTGERACAOARQTXT: TDateTimeField;
    cdsMovArqFinalizadoUSUGERACAOARQTXT: TStringField;
    cdsMovArqFinalizadoNOMEARQTXT: TStringField;
    cdsMovArqFinalizadoDTFINALIZAARQTXT: TDateTimeField;
    cdsMovArqFinalizadoUSUFINALIZAARQTXT: TStringField;
    cdsMovArqFinalizadoDTCANCELAARQTXT: TDateTimeField;
    cdsMovArqFinalizadoUSUCANCELAARQTXT: TStringField;
    cdsMovArqFinalizadoNOME_CONVENIO: TStringField;
    cdsMovArqFinalizadoFLGENVIADO: TStringField;
    cdsMovArqFinalizadoPATHARQUIVOREM: TStringField;
    cdsMovArqFinalizadoPATHARQUIVORET: TStringField;
    cdsMovArqFinalizadoPATHARQUIVOSEGURANCA: TStringField;
    cdsMovArqFinalizadoPATHARQUIVOBACKUP: TStringField;
    cdsMovArqFinalizadoSTATUS: TStringField;
    qryMovArqGeradoDetNUM_AP: TFloatField;
    qryMovArqGeradoDetNODOCUMENTO: TFloatField;
    qryMovArqGeradoDetDATAPROGRAMADA: TDateTimeField;
    qryMovArqGeradoDetVALOR: TFloatField;
    qryMovArqGeradoDetRAZAOSOCIAL: TStringField;
    qryMovArqGeradoDetNUM_BANCO: TStringField;
    qryMovArqGeradoDetNUM_AGENCIA: TStringField;
    qryMovArqGeradoDetNUM_CONTA: TStringField;
    qryMovArqGeradoDetFORMA_PAGTO: TStringField;
    qryMovArqGeradoDetSTATUS: TStringField;
    qryMovArqCancelDetNUM_AP: TFloatField;
    qryMovArqCancelDetNODOCUMENTO: TFloatField;
    qryMovArqCancelDetDATAPROGRAMADA: TDateTimeField;
    qryMovArqCancelDetVALOR: TFloatField;
    qryMovArqCancelDetRAZAOSOCIAL: TStringField;
    qryMovArqCancelDetNUM_BANCO: TStringField;
    qryMovArqCancelDetNUM_AGENCIA: TStringField;
    qryMovArqCancelDetNUM_CONTA: TStringField;
    qryMovArqCancelDetFORMA_PAGTO: TStringField;
    qryMovArqCancelDetSTATUS: TStringField;
    qryMovArqFinalDetNUM_AP: TFloatField;
    qryMovArqFinalDetNODOCUMENTO: TFloatField;
    qryMovArqFinalDetDATAPROGRAMADA: TDateTimeField;
    qryMovArqFinalDetVALOR: TFloatField;
    qryMovArqFinalDetRAZAOSOCIAL: TStringField;
    qryMovArqFinalDetNUM_BANCO: TStringField;
    qryMovArqFinalDetNUM_AGENCIA: TStringField;
    qryMovArqFinalDetNUM_CONTA: TStringField;
    qryMovArqFinalDetFORMA_PAGTO: TStringField;
    qryMovArqFinalDetSTATUS: TStringField;
    wwDBGrid2: TwwDBGrid;
    wwDBGrid5: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;
    dbgMovArqCancelado: TwwDBGrid;
    qryMovRetornoIDARQUIVOPAGTO: TFloatField;
    qryMovRetornoCODPORTFORMA: TFloatField;
    qryMovRetornoNSA: TStringField;
    qryMovRetornoNUM_AP: TFloatField;
    qryMovRetornoNODOCUMENTO: TFloatField;
    qryMovRetornoDATAPROGRAMADA: TDateTimeField;
    qryMovRetornoVALOR: TFloatField;
    qryMovRetornoRAZAOSOCIAL: TStringField;
    qryMovRetornoFORMA_PAGTO: TStringField;
    qryMovRetornoDATA_EFETIVACAO: TDateTimeField;
    qryMovRetornoVALOR_EFETIVADO: TFloatField;
    qryMovRetornoOCORRENCIA_RET: TStringField;
    qryMovRetornoAUTENTICACAO: TStringField;
    qryMovRetornoSTATUS: TStringField;
    qryMovRetornoNOME_CONVENIO: TStringField;
    qryMovRetornoCPF_CNPJ_MASC: TStringField;
    FMovArqRet: TwwFilterDialog;
    LMovArqRet: TwwLocateDialog;
    rptMovArqRetorno: TppReport;
    ppParameterList2: TppParameterList;
    ppMovArqRetorno: TppBDEPipeline;
    qryMovArqGeradoDetCPF_CNPJ_MASC: TStringField;
    qryMovArqGeradoDetCOD_BARRAS_MASC: TStringField;
    qryMovArqGeradoDetCODFORMA: TFloatField;
    qryMovArqFinalDetCPF_CNPJ_MASC: TStringField;
    qryMovArqFinalDetCOD_BARRAS_MASC: TStringField;
    qryMovArqFinalDetCODFORMA: TFloatField;
    qryMovArqCancelDetCPF_CNPJ_MASC: TStringField;
    qryMovArqCancelDetCOD_BARRAS_MASC: TStringField;
    qryMovArqCancelDetCODFORMA: TFloatField;
    Panel32: TPanel;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    Label21: TLabel;
    DBRealEdit3: TDBRealEdit;
    qryTotaisRetorno: TwwQuery;
    dsTotaisRetorno: TwwDataSource;
    qryTotaisRetornoVLR_PREVISTO: TFloatField;
    qryTotaisRetornoVLR_EFETIVADO: TFloatField;
    qryTotaisRetornoVLR_NAO_EFETIVADO: TFloatField;
    Label22: TLabel;
    Label23: TLabel;
    qryMovArqGeradoDetNSA: TStringField;
    qryMovArqGeradoDetIDARQUIVOPAGTO: TFloatField;
    Image3: TImage;
    Label24: TLabel;
    qryMovRetornoDESC_OCORRENCIA: TStringField;
    qryMovRetornoTEVE_OCORRENCIA: TStringField;
    ppHeaderBand2: TppHeaderBand;
    ppShape8: TppShape;
    ppDBImage2: TppDBImage;
    ppLabel28: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel43: TppLabel;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppLabel44: TppLabel;
    ppDBText22: TppDBText;
    ppLabel45: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand2: TppFooterBand;
    ppShape11: TppShape;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc3: TppDBCalc;
    ppLabel50: TppLabel;
    ppLabel52: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    pplblSit: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc5: TppDBCalc;
    ppLabel51: TppLabel;
    raCodeModule2: TraCodeModule;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppShape12: TppShape;
    spbExportaLista: TSpeedButton;
    wwDBNavigator7: TwwDBNavigator;
    wwNavButton44: TwwNavButton;
    wwNavButton45: TwwNavButton;
    wwNavButton46: TwwNavButton;
    wwNavButton47: TwwNavButton;
    wwNavButton48: TwwNavButton;
    qeListaFavorecidos: TQExport3Dialog;
    LListaTitulos: TwwLocateDialog;
    spbRegerarArq: TSpeedButton;
    CmpDadosParaImpRetorno: TCmParamReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape4: TppShape;
    ppDBImage1: TppDBImage;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppShape2: TppShape;
    ppShape6: TppShape;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel26: TppLabel;
    ppDBText15: TppDBText;
    ppLabel27: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppShape7: TppShape;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    ppShape1: TppShape;
    ppLabel19: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppShape3: TppShape;
    ppLabel20: TppLabel;
    ppShape5: TppShape;
    ppLabel21: TppLabel;
    ppDBCalc6: TppDBCalc;
    plblautoriza: TppLabel;
    ppLabel15: TppLabel;
    ppDBText9: TppDBText;
    ppPageStyle1: TppPageStyle;
    raCodeModule1: TraCodeModule;
    ppLabel16: TppLabel;
    ppShape13: TppShape;
    ppDBText29: TppDBText;
    ppLabel17: TppLabel;
    qryMovArqGeradoDetHIST: TStringField;
    lblConvenioRet: TLabel;
    dbLkpConvenioRet: TwwDBLookupCombo;
    qryAux3: TwwQuery;
    CMClientDataSet1: TCMClientDataSet;
    edtCodReceita: TEdit;
    strngfldTipoPagtoGeralCODFORMABANCO: TStringField;
    grpGPS_INSS: TGroupBox;
    mkeMesAnoComp: TMaskEdit;
    dbeVLROUTRAS_ENTIDADES: TwwDBEdit;
    dbeVLRINSS: TwwDBEdit;
    dbeVLRMULTA: TwwDBEdit;
    lblCompetencia: TLabel;
    lblVlrINSS: TLabel;
    lblVlrOutrasEntidades: TLabel;
    lblMultaJuros: TLabel;
    btnLimparINSS: TSpeedButton;
    dsINSS: TwwDataSource;
    qryINSS: TwwQuery;
    updINSS: TUpdateSQL;
    cdsMovRemessaIDFORCLI: TFloatField;
    cdsMovRemessaDATAVENCTO: TDateTimeField;
    qryINSSCODDOCINSS: TFloatField;
    qryINSSCODIGOPGTO: TStringField;
    qryINSSCOMPETENCIA: TStringField;
    qryINSSFLGIMPRESSO: TStringField;
    qryINSSIDDOCINSS: TFloatField;
    qryINSSDATAVENCTO: TDateTimeField;
    qryINSSIDBENEFINSS: TFloatField;
    grpDARF: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    btnLimparDARF: TSpeedButton;
    dbeVLRIRRF: TwwDBEdit;
    dbeNUMDOCUMENTO: TwwDBEdit;
    dtApuracao_DARF: TCMDateTimePicker;
    dbeCODNATUREZA: TwwDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    dbeVLRMULTA_DARF: TwwDBEdit;
    Label31: TLabel;
    dtDATAVENCDARF: TCMDateTimePicker;
    Label32: TLabel;
    Label33: TLabel;
    dbeVLRJUROS: TwwDBEdit;
    Label34: TLabel;
    dbeVLRTOTAL: TwwDBEdit;
    Label35: TLabel;
    dsDARF: TwwDataSource;
    qryDARF: TwwQuery;
    cdsMovRemessaIDMODULO: TFloatField;
    updDARF: TUpdateSQL;
    qryDARFIDDARF: TFloatField;
    qryDARFIDPESSOA: TFloatField;
    qryDARFCODDOCUMENTO: TFloatField;
    qryDARFCODNATUREZA: TStringField;
    qryDARFNUMDOCUMENTO: TStringField;
    qryDARFDATAFINALAPURACAO: TDateTimeField;
    qryDARFDATAVENCDARF: TDateTimeField;
    qryDARFFLGIMPRESSO: TStringField;
    lblCodReceita_pagto: TLabel;
    btnLimparRazaoSocialGPS: TSpeedButton;
    dbeVLRTOTAL_INSS: TwwDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    btnRazaoSocialGPS: TSpeedButton;
    edtRazaoSocialGPS: TEdit;
    edtNumDocumentoGPS: TEdit;
    qryINSSRAZAOSOCIAL: TStringField;
    qryINSSNUMDOCUMENTO: TStringField;
    qryDARFVLRIRRF: TFloatField;
    qryDARFVLRMULTA: TFloatField;
    qryDARFVLRJUROS: TFloatField;
    qryDARFVLRTOTAL: TFloatField;
    qryINSSVLRDESCONTO: TFloatField;
    qryINSSVLRMULTA: TFloatField;
    qryINSSVLRJUROS: TFloatField;
    qryINSSVLRTOTAL: TFloatField;
    qryINSSVLRINSS: TFloatField;
    qryINSSVLROUTRAS_ENTIDADES: TFloatField;
    qryINSSFLGPAGTOAUTONOMO: TStringField;
    stCaminhoRet: TStaticText;
    tbsAnManAp_Agrupada: TTabSheet;
    Dock978: TDock97;
    Toolbar976: TToolbar97;
    btnAltAp_Agrupada: TToolbarButton97;
    pnlAp_Agrupada: TPanel;
    Dock979: TDock97;
    Toolbar977: TToolbar97;
    btnOkAp_Agrupada: TBitBtn;
    btnCancAp_Agrupada: TBitBtn;
    GroupBox3: TGroupBox;
    Label39: TLabel;
    dblkpFormaPagtoAp_Agrupada: TwwDBLookupCombo;
    edtCodPagtoAp_Agrupada: TEdit;
    GroupBox8: TGroupBox;
    Label40: TLabel;
    SpeedButton6: TSpeedButton;
    Label41: TLabel;
    Label42: TLabel;
    dbeCodBarrasAp_Agrupada: TwwDBEdit;
    rdgTipoBoletoAp_Agrupada: TRadioGroup;
    edtDtVenctoBoletoApAgrupada: TEdit;
    edtValorBoletoAp_Agrupada: TRealEdit;
    qryAp_Agrupada: TwwQuery;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    dsAp_Agrupada: TwwDataSource;
    updAp_Agrupada: TUpdateSQL;
    cdsMovRemessaCODGRUPOCNAB: TFloatField;
    qryAp_AgrupadaCODGRUPOCNAB: TFloatField;
    GroupBox9: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    dbedtNumContaAp_Agrupada: TwwDBEdit;
    dbedtNumBancoAp_Agrupada: TwwDBEdit;
    dbedtNumAgenciaAp_Agrupada: TwwDBEdit;
    qryCtaBancariaAp_Agrupada: TwwQuery;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField10: TStringField;
    dsCtaBancariaAp_Agrupada: TwwDataSource;
    qryAp_AgrupadaIDFORCLI: TFloatField;
    qryAp_AgrupadaIDCBANCARIA: TFloatField;
    rptMovPendentesCOFIN: TppReport;
    ppParameterList3: TppParameterList;
    ppImpMovPendentesCOFIN: TppBDEPipeline;
    ppHeaderBand3: TppHeaderBand;
    ppDBImage3: TppDBImage;
    ppLabel42: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLabel65: TppLabel;
    ppDBText36: TppDBText;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText44: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppShape17: TppShape;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc7: TppDBCalc;
    ppLabel73: TppLabel;
    ppShape18: TppShape;
    ppLabel74: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppDBText45: TppDBText;
    ppPageStyle2: TppPageStyle;
    daDataModule1: TdaDataModule;
    qryMovArqPendDetNSA: TStringField;
    qryMovArqPendDetIDARQUIVOPAGTO: TFloatField;
    qryMovArqPendDetHIST: TStringField;
    qryMovArqPendDetUSUGERACAOARQTXT: TStringField;
    ppLabel68: TppLabel;
    ppDBText47: TppDBText;
    qryMovArqPendDetCONVENIO: TStringField;
    CampoNumAgOpConta_Formapagto: TppLabel;
    ppLabel75: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    qryMovArqPendDetCENT_RESPON: TStringField;
    ppDBText41: TppDBText;
    plblUsuGeracao: TppLabel;
    spbImportarMovTitulo: TSpeedButton;
    spbLimparMovTitulo: TSpeedButton;
    qryMovTitulosFLGIMPORTADO: TStringField;
    rptMovGeradosCOFIN: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDBImage4: TppDBImage;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel76: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppShape14: TppShape;
    ppShape19: TppShape;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText46: TppDBText;
    ppDBText48: TppDBText;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppLabel89: TppLabel;
    ppDBText51: TppDBText;
    ppLabel90: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppLabel91: TppLabel;
    ppDBText52: TppDBText;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppDetailBandGerados3: TppDetailBand;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    CampoNumAgOpConta_FormapagtoGerados: TppLabel;
    ppDBText58: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppShape20: TppShape;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSummaryBand4Gerados: TppSummaryBand;
    ppDBCalc9: TppDBCalc;
    ppLabel97: TppLabel;
    ppShape21: TppShape;
    ppLabel98: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppDBText59: TppDBText;
    plblUsuGeracaoGerados: TppLabel;
    ppPageStyle3: TppPageStyle;
    daDataModule2: TdaDataModule;
    ppParameterList4: TppParameterList;
    ppImpMovGeradosCOFIN: TppBDEPipeline;
    qryMovArqGeradoDetUSUGERACAOARQTXT: TStringField;
    qryMovArqGeradoDetCONVENIO: TStringField;
    qryMovArqGeradoDetCENT_RESPON: TStringField;
    Procedure FormShow(Sender: TObject);
    Procedure spbAnalisarClick(Sender: TObject);
    Procedure PageControl1Change(Sender: TObject);
    Procedure spbSelRemessaClick(Sender: TObject);
    Procedure spbCalcClick(Sender: TObject);
    Procedure cdsMovRemessaAfterScroll(DataSet: TDataSet);
    Procedure dbgMovRemessaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    Procedure dbgMovRemessaDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbInverterSelClick(Sender: TObject);
    Procedure spbMarcaTodosClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure spbExpBenefSelClick(Sender: TObject);
    Procedure spbBuscaContaCorClick(Sender: TObject);
    Procedure btnInc1Click(Sender: TObject);
    Procedure btnAlt1Click(Sender: TObject);
    Procedure btnExc1Click(Sender: TObject);
    Procedure btnCon1Click(Sender: TObject);
    Procedure btnCan1Click(Sender: TObject);
    Procedure spbImportarMovListaClick(Sender: TObject);
    Procedure spbLocalizaFavorecClick(Sender: TObject);
    Procedure pcAnaliseRemessaChanging(Sender: TObject; Var AllowChange: Boolean);
    Procedure pcDetalManutChanging(Sender: TObject; Var AllowChange: Boolean);
    Procedure pcGeralRemessaChanging(Sender: TObject; Var AllowChange: Boolean);
    Procedure spbLimparMovListaClick(Sender: TObject);
    Procedure dbgMovListaFavDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbPrepararEnvioClick(Sender: TObject);
    Procedure spbDesfazerPrepClick(Sender: TObject);
    Procedure dbgMovRemessaFieldChanged(Sender: TObject; Field: TField);
    Procedure SpeedButton5Click(Sender: TObject);
    Procedure btnAltGeralClick(Sender: TObject);
    Procedure btnConGeralClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure rdgTipoTituloGeralClick(Sender: TObject);
    Procedure qryDocumentoAfterScroll(DataSet: TDataSet);
    Procedure btnCanGeralClick(Sender: TObject);
    Procedure btnIncTitClick(Sender: TObject);
    Procedure btnAltTitClick(Sender: TObject);
    Procedure btnExcTitClick(Sender: TObject);
    Procedure btnConTitClick(Sender: TObject);
    Procedure btnCanTitClick(Sender: TObject);
    Procedure dbeCodigoBarrasTitulosExit(Sender: TObject);
    Procedure spbLimpaCampo1Click(Sender: TObject);
    Procedure spbGerarArqClick(Sender: TObject);
    Procedure spbCancelarMovArqGeradoClick(Sender: TObject);
    Procedure spbImpMovArqGeradoClick(Sender: TObject);
    Procedure SpeedButton3Click(Sender: TObject);
    Procedure SpeedButton12Click(Sender: TObject);
    Procedure SpeedButton13Click(Sender: TObject);
    Procedure dblkpConvenio2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    Procedure pcGeraArquivoOperChange(Sender: TObject);
    Procedure dblkpConvenioEnter(Sender: TObject);
    Procedure rdgTipoTituloClick(Sender: TObject);
    Procedure dblkpConvenio2Click(Sender: TObject);
    Procedure dblkpConvenioClick(Sender: TObject);
    Procedure dblkpFormaPagtoClick(Sender: TObject);
    Procedure spbBaixarMovArqGeradoPendClick(Sender: TObject);
    Procedure dbgMovArqGeradoPendDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbBaixarMovArqGeradoClick(Sender: TObject);
    Procedure dbgMovArqGeradoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure dbgMovTitulosRowChanged(Sender: TObject);
    Procedure spbDesfazerBaixaClick(Sender: TObject);
    Procedure spbDesfazerBaixa2Click(Sender: TObject);
    Procedure DbeCodigoBarrasGeralExit(Sender: TObject);
    Procedure dbeValorPagtoExit(Sender: TObject);
    Procedure dbgMovRemessaTitleButtonClick(Sender: TObject; AFieldName: String);
    Procedure dbgMovRemessaCalcTitleImage(Sender: TObject; Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
    Procedure SpeedButton1Click(Sender: TObject);
    Procedure spbLocalizaArqRetClick(Sender: TObject);
    Procedure dbgMovRetornoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbBaixarMovRetornoClick(Sender: TObject);
    Procedure spbDesfazerBaixa3Click(Sender: TObject);
    Procedure SpeedButton2Click(Sender: TObject);
    Procedure SpeedButton9Click(Sender: TObject);
    Procedure dbgMovArqFinalizadoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure dbgMovArqCanceladoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbImpMovArqRetornoClick(Sender: TObject);
    Procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
    Procedure spbExportaListaClick(Sender: TObject);
    Procedure spbRegerarArqClick(Sender: TObject);
    Procedure DblCodFormaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    Procedure DblCodFormaEnter(Sender: TObject);
    procedure DblCodFormaExit(Sender: TObject);
    procedure DblCodFormaChange(Sender: TObject);
    procedure btnLimparINSSClick(Sender: TObject);
    procedure btnLimparDARFClick(Sender: TObject);
    procedure btnRazaoSocialGPSClick(Sender: TObject);
    procedure btnLimparRazaoSocialGPSClick(Sender: TObject);
    procedure dbeVLRINSSExit(Sender: TObject);
    procedure dbeVLRMULTAExit(Sender: TObject);
    procedure dbeVLROUTRAS_ENTIDADESExit(Sender: TObject);
    procedure dbeVLRIRRFExit(Sender: TObject);
    procedure dbeVLRMULTA_DARFExit(Sender: TObject);
    procedure dbeVLRJUROSExit(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dbLkpConvenioRetClick(Sender: TObject);
    procedure dbeValorPagtoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAltAp_AgrupadaClick(Sender: TObject);
    procedure btnCancAp_AgrupadaClick(Sender: TObject);
    procedure btnOkAp_AgrupadaClick(Sender: TObject);
    procedure qryAp_AgrupadaAfterScroll(DataSet: TDataSet);
    procedure rdgTipoBoletoAp_AgrupadaClick(Sender: TObject);
    procedure dblkpFormaPagtoAp_AgrupadaChange(Sender: TObject);
    procedure dblkpFormaPagtoAp_AgrupadaExit(Sender: TObject);
    procedure dbeCodBarrasAp_AgrupadaExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure dblkpFormaPagtoAp_AgrupadaCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkpFormaPagtoAp_AgrupadaEnter(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppSummaryBand3BeforePrint(Sender: TObject);
    procedure spbImportarMovTituloClick(Sender: TObject);
    procedure spbLimparMovTituloClick(Sender: TObject);
    procedure ppDetailBandGerados3BeforePrint(Sender: TObject);
    procedure ppSummaryBand4GeradosBeforePrint(Sender: TObject);
  Private
    { Private declarations }
    oCtrlBaixaDocumentos: TCtrlBaixaDocumentos;
    oCtrlFinanc: TCtrlFinanc;
    //Cássio Rovaroto -  SIG nº 74164 - Início
    //oCtrlFuncoesRH: TCtrlFuncoesRH;
    oCtrlFuncoesCapCar: TCtrlFuncoesCapCar;
    //Cássio Rovaroto -  SIG nº 74164 - Fim.
    oRemessaEletronica: TCtrlRemessaEletronica;

    oPessoa: TCtrlPessoa;

    tsListaDeDocumentos: TStringList;
    tsListaDeCodGrupoCNAB: TStringList; //Everson Cunha - SIG117206

     //Cássio Rovaroto - SIG nº 60540 - Início
    iIdModuloAcesso: integer;
    iIdPlanoPrevAnt: Integer;
    sCaminhoRetorno: string;
    ret: array of rgRetorno;
    iInd: integer; //Índice do vetor rgRetorno
    //Cássio Rovaroto - SIG nº 60540 - Fim

    //Cássio Rovaroto - SIG nº 100343 - Início
    dValorINSS: Double;
    dValorATM: Double;
    dValorEntidadesINSS: Double;
    dValorTotalINSS: Double;
    dValorDARF: Double;
    dValorMultaDARF: Double;
    dValorJurosDARF: Double;
    dValorTotalDARF: Double;
    //Cássio Rovaroto - SIG nº 100343 - Fim

    Function _TotalizaColunaGridMovRemessa(pCampo: String): Double;
    Function _TotalizaColunaGridMovListaFavorecidos(pCampo: String; pDecimal: Integer): String;
    Function _TotalizaColunaGridMovTitulos(pCampo: String; pDecimal: Integer): String;
    Function _TemSaldoDisponivel(pSaldo: double): Boolean;
    Function _ProcessarBaixa(pTipoBaixa, pNomeConvenio, pIdArquivoPagto, sNSA: String;   //edilaine - SI75325
                             pCodPortForma: Integer; pValor: Double): Boolean;
    Function _AnaliseDoMovimento(pCodForma: Integer; pTipoForma: Integer; pListaFavorecidos, pListaTitulos: string): String;
    Function _ChamaFormDesfazerBaixa(pTipo: String): String;
    Function _AnaliseVerificaValorCampo(pQuery: TwwQuery; pCampo, pValorCampo, pTpSinal: String): Boolean;

    procedure _RegistraTarifaBancaria(pIdArquivoPagto: integer);
    procedure _SetTarifaBancaria(pIdArquivoPagto, pCodDocumento: Integer);
    procedure HabilitaDesabilitaCampos; //Everson Cunha - SIG84050
    procedure AtualizaValorTotal_DARF_INSS(pTipo: integer);

    procedure _InsereDocumentoXPessoa(pNome, pDocumento, pBanco, pAgencia, pConta, pTipoConta, pOperacao: string; pValor: double; pCodDocumento: Integer; pIdForCli: Integer; pIdCBancaria: Integer);
    procedure _GetFavorecidosAutomatico(pIdModuloAcesso: Integer; pConvenio, pFormaPagto: String; pDataIni, pDataFim: TDateTime; pCodDocumento, pIdhstFolhaBenef: Integer);
    // Paulo Nobre - WO32452 - Inicio
//    function _GetMovListaFavoritoFP: string;
//    function _GetMovListaFavoritoCP: string;
    // Paulo Nobre - WO32452 - Fim
    procedure ExibeCampos(iIdModulo: integer);
    //procedure ExlcuiFavorecidosNaoGerados;                        //Everson Cunha - SIG117008
    procedure ExcluiFavorecidosNaoGerados(pCodDocumentos : string); //Everson Cunha - SIG117008
    function _GetValorPlano(pIdPlanoPrev: Integer): Double;
    procedure _getRazaoSocialGPSAutonomo;

  Public
    { Public declarations }
  End;

Var
  FrmRemessaEletronica: TFrmRemessaEletronica;
  sPathArquivosLog, sMSGErroAnalise, sDescRetMomento, sFormaPagtoAnt, sFormaPagtoApAgrupadaAnt: String;
  iContador: Integer;
  bAnaliseFeita, bAltFormPagto, bAltFormPagtoApAgrupada: Boolean;
  dValorTotalMovLista, dValorAntCampo, dValorTotalTitulos, dVlrObrigaNumDocTit: Double;

Implementation

Uses DBaseDados, USistema, UDatabase, uFormManager, FAguarde, FProgresso, FPreview,
  UMensErro, DDadosBancarios, uModulo, FExcluiEstornaBaixaLoteMT;


{$R *.DFM}

Procedure TFrmRemessaEletronica.FormCreate(Sender: TObject);
Begin
  Inherited;
  tsListaDeDocumentos := tStringList.create;
  tsListaDeCodGrupoCNAB := TStringList.Create; //Everson Cunha - SIG117206

  oCtrlBaixaDocumentos := TCtrlBaixaDocumentos.Create;
  oCtrlBaixaDocumentos.InitiAlizeAs(Padroes);

  oCtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, True);
  oCtrlFInanc.InitiAlizeAs(Padroes);

  oRemessaEletronica := TCtrlRemessaEletronica.Create;
  oRemessaEletronica.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  oPessoa := TCtrlPessoa.Create;
  oPessoa.InitiAlizeAs(Padroes);

  sPathArquivosLog := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LogRemessaEletro';

  If Not DirectoryExists(sPathArquivosLog) Then
    ForceDirectories(sPathArquivosLog);

  // Ajustando a tela para o tamanho padrão definido nas constantes
  ClientHeight := iClientHeight;
  ClientWidth := iClientWidth;

  //Cássio Rovaroto - SIG nº 60540 - Início
  iIdModuloAcesso := Sistema.IdModulo;
  iInd := 0;
  //Cássio Rovaroto - SIG nº 60540 - Fim
End;

Procedure TFrmRemessaEletronica.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Inherited;
  FreeAndNil(tsListaDeDocumentos);
  FreeAndNil(tsListaDeCodGrupoCNAB); //Everson Cunha - SIG117206
  FreeAndNil(oCtrlBaixaDocumentos);
  FreeAndNil(oCtrlFinanc);
  FreeAndNil(oRemessaEletronica);

  FreeAndNil(oPessoa);
End;

Procedure TFrmRemessaEletronica.FormShow(Sender: TObject);
Begin
  Inherited;

  // Inicializando defaults dos componentes
  dbDataProgIni.Date := date;
  dbDataProgFim.Date := date;
  pcGeralRemessa.ActivePage := tbsAnalise;
  pcGeraArquivoOper.ActivePage := tbsGAPendentes;
  pcAnaliseRemessa.ActivePage := tbsAnaliseMovimento;
  pcDetalManut.ActivePage := tbsAnManGeral;

  // Abrindo os datasets
  Screen.Cursor := crSQLWait;
  cdsConvenio.data := oRemessaEletronica._ListaConvenios;
  cdsTipoPagto.data := oRemessaEletronica._ListaFormaPagamentos;
  cdsTipoPagtoGeral.data := oRemessaEletronica._ListaFormaPagamentosGeral;
  dblkpFormaPagto.LookupValue := '-1'; // Todas as formas de pagamento como default

  SQLMovRemessa.Open;
  qryDocumento.Close;
  qryDocumento.Open;
  qryMovListaFavorecidos.Close;
  qryMovListaFavorecidos.Open;
  qryContaBancaria.Close;
  qryContaBancaria.Open;
  qryMovTitulos.Close;
  qryMovTitulos.Open;
  qryContaBancaria.Close;
  qryContaBancaria.Open;
  qryCtaBancariaGeral.Close;
  qryCtaBancariaGeral.Open;

  SqlMovArqPendente.Open;
  qryMovArqPendDet.Close;
  qryMovArqPendDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe;
  qryMovArqPendDet.SQL.SaveToFile(sPathArquivosLog + '\SQL_MovArqDetalhado.txt');
  qryMovArqPendDet.Open;

  SqlMovArqGerado.Open;
  qryMovArqGeradoDet.Close;
  qryMovArqGeradoDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe;
  qryMovArqGeradoDet.Open;

  SqlMovArqCancelado.Open;
  qryMovArqCancelDet.Close;
  qryMovArqCancelDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe;
  qryMovArqCancelDet.Open;

  SqlMovArqFinalizado.Open;
  qryMovArqFinalDet.Close;
  qryMovArqFinalDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe;
  qryMovArqFinalDet.Open;

  qryMovRetorno.Close;
  qryMovRetorno.Open;

  Screen.Cursor := crDefault;
  //
  spbAnalisar.Enabled := ((Not cdsMovRemessa.isempty) And (pcGeralRemessa.activepage = tbsAnaliseMovimento));
  spbPrepararEnvio.Enabled := ((Not cdsMovRemessa.isempty) And (pcGeralRemessa.activepage = tbsAnaliseMovimento));

  dbgMovRemessa.ColumnByName('VALOR').FooterValue := '0,00';
  dbgMovListaFav.ColumnByName('VALOR').FooterValue := '0,00';
  dbgMovTitulos.ColumnByName('VLRPAGTO').FooterValue := '0,00';
  cdsMovRemessaAfterScroll(cdsMovRemessa);

  // Aba Geral
  pnlDadosMovGeral.enabled := False;
  btnAltGeral.enabled := True;
  btnConGeral.Enabled := False;
  btnCanGeral.Enabled := False;
  DbeCodigoBarrasGeral.Enabled := False;
  //Everson Cunha - SIG84050 - Início
  qryINSS.Close;
  qryINSS.Open;
  qryDARF.Close;
  qryDARF.Open;

  HabilitaDesabilitaCampos;
  //Everson Cunha - SIG84050 - Fim

  // Aba Listas de Favorecidos
  pnlGridMovLista.enabled := True;
  pnlDadosMovLista.enabled := False;
  btnInc1.enabled := True;
  btnAlt1.enabled := True;
  btnExc1.enabled := True;
  spbImportarMovLista.enabled := True;
  spbLimparMovLista.enabled := True;
  dbNavListFavorec.enabled := True;
  btnCon1.Enabled := False;
  btnCan1.Enabled := False;

  // Aba Listas de Titulos
  pnlGridMovTitulo.enabled := True;
  pnlDadosMovTitulo.enabled := False;
  btnIncTit.enabled := True;
  btnAltTit.enabled := True;
  btnExcTit.enabled := True;
  btnConTit.Enabled := False;
  btnCanTit.Enabled := False;

  //Aba AP Agrupada
  //Everson Cunha - SIG117206 - Ini
  pnlAp_Agrupada.enabled := False;
  btnAltAp_Agrupada.enabled := not qryAp_Agrupada.IsEmpty;
  btnOkAp_Agrupada.Enabled := False;
  btnCancAp_Agrupada.Enabled := False;
  dbeCodBarrasAp_Agrupada.Enabled := False;

  qryAp_Agrupada.Close;
  qryAp_Agrupada.Open;

  qryCtaBancariaAp_Agrupada.Close;
  qryCtaBancariaAp_Agrupada.Open;
  //Everson Cunha - SIG117206 - Fim

  If tbsAnalise.Enabled Then
    dblkpConvenio.Setfocus;

  //Cássio Rovaroto - SIG nº 64071 - Início
  if iIdModuloAcesso =  18 then
  begin
    dbgMovRemessa.Selected.Clear;
    dbgMovRemessa.Selected.add('MARCADO'#9'3'#9'S/N'#9'F');
    dbgMovRemessa.Selected.add('NUM_AP'#9'8'#9'Nº AP'#9'F');
    dbgMovRemessa.Selected.add('CODDOCUMENTO'#9'14'#9'Nº Documento'#9'F');
    dbgMovRemessa.Selected.add('VERSAO_FOLHA'#9'26'#9'Versão da Folha'#9'F');
    dbgMovRemessa.Selected.add('RAZAOSOCIAL'#9'36'#9'Nome do Favorecido'#9'F');
    dbgMovRemessa.Selected.add('FORMA_PAGTO'#9'20'#9'Forma de Pagamento'#9'F');
    dbgMovRemessa.Selected.add('DATAPROGRAMADA'#9'12'#9'Dt. Programada'#9'F');
    dbgMovRemessa.Selected.add('VALOR'#9'16'#9'Valor Documento'#9'F');
    dbgMovRemessa.Selected.add('MSGERRO'#9'250'#9'Resultado da Análise'#9'F');
    dbgMovRemessa.RedrawGrid;
  end;

  spbLocalizaArqRet.Caption := '&Carregar';
  stCaminhoRet.Caption := EmptyStr;

  if iIdModuloAcesso <> 3 then
  begin
    spbPrepararEnvio.Left := 68;
    spbAnalisar.Visible := False;
  end
  else
  begin
    spbPrepararEnvio.Left := 278;
    spbAnalisar.Visible := True;
  end;

  //Cássio Rovaroto - SIG nº 64071 - Fim

  ExibeCampos(iIdModuloAcesso); //Cássio Rovaroto - SIG nº 64071
End;

Function TFrmRemessaEletronica._TemSaldoDisponivel(pSaldo: double): Boolean;
Begin
  Result := True;
  If pSaldo = 0 Then
    Begin
      Application.MessageBox(MSG017, 'Atenção !', Mb_IconExclamation);
      Result := False;
    End;
End;

Function TFrmRemessaEletronica._TotalizaColunaGridMovRemessa(pCampo: String): Double;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  Screen.Cursor := crSQLWait;
  cdsMovRemessa.AfterScroll := Nil;
  cdsMovRemessa.DisableControls;
  cdsMovRemessa.First;
  While Not cdsMovRemessa.EOF Do
    Begin
      If cdsMovRemessa.fieldByname('MARCADO').asString = 'S' Then // Sim
        If Not cdsMovRemessa.Fieldbyname(pCampo).isNull Then
          dTotalFiltro := dTotalFiltro + cdsMovRemessa.Fieldbyname(pCampo).asFloat;

      cdsMovRemessa.Next;
    End;
  cdsMovRemessa.AfterScroll := cdsMovRemessaAfterScroll;
  cdsMovRemessa.enableControls;
  Screen.Cursor := crDefault;
  Result := dTotalFiltro;
End;

Function TFrmRemessaEletronica._TotalizaColunaGridMovListaFavorecidos(pCampo: String; pDecimal: Integer): String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  Screen.Cursor := crSQLWait;
  qryMovListaFavorecidos.DisableControls;
  qryMovListaFavorecidos.First;
  While Not qryMovListaFavorecidos.EOF Do
    Begin
      If Not qryMovListaFavorecidos.Fieldbyname(pCampo).isNull Then
        dTotalFiltro := dTotalFiltro + qryMovListaFavorecidos.Fieldbyname(pCampo).asFloat;

      qryMovListaFavorecidos.Next;
    End;
  qryMovListaFavorecidos.First;
  qryMovListaFavorecidos.EnableControls;
  dValorTotalMovLista := dTotalFiltro;
  Screen.Cursor := crDefault;
  Result := floattostrf(dTotalFiltro, ffnumber, 12, 2);
End;

Function TFrmRemessaEletronica._TotalizaColunaGridMovTitulos(pCampo: String; pDecimal: Integer): String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  Screen.Cursor := crSQLWait;
  qryMovTitulos.DisableControls;
  qryMovTitulos.First;
  While Not qryMovTitulos.EOF Do
    Begin
      If Not qryMovTitulos.Fieldbyname(pCampo).isNull Then
        dTotalFiltro := dTotalFiltro + qryMovTitulos.Fieldbyname(pCampo).asFloat;

      qryMovTitulos.Next;
    End;
  qryMovTitulos.First;
  qryMovTitulos.EnableControls;
  dValorTotalTitulos := dTotalFiltro;
  Screen.Cursor := crDefault;
  Result := floattostrf(dTotalFiltro, ffnumber, 12, 2);
End;

Function TFrmRemessaEletronica._AnaliseVerificaValorCampo(pQuery: TwwQuery; pCampo, pValorCampo, pTpSinal: String): Boolean;
Begin
  Result := False;
  Screen.Cursor := crSQLWait;
  pQuery.First;
  While Not pQuery.EOF Do
    Begin
      If pTpSinal = '<>' Then // Diferente
        Result := (pQuery.Fieldbyname(pCampo).asString <> pValorCampo)
      Else // Igual
        Result := (pQuery.Fieldbyname(pCampo).asString = pValorCampo);

      If Result = False Then
        Break;

      pQuery.Next;
    End;
  pQuery.First;
  Screen.Cursor := crDefault;
End;

// Rotina para realizar uma análise do movimento antes da geração do arquivo
// Ela não será obrigatória.

Function TFrmRemessaEletronica._AnaliseDoMovimento(pCodForma: Integer; pTipoForma: Integer;
                              pListaFavorecidos, pListaTitulos: string): String;
Begin
  Inherited;
  Result := EmptyStr;
  //Cássio Rovaroto - SIG nº 102967 - Início
  Inherited;
  Result := EmptyStr;

  // Num da AP não informada no Documento
  If (CdsMovRemessa.fieldbyname('NUM_AP').isNull) Then
    Result := Result + AnMSG17;

  //Everson Cunha - SIG117206 - Ini
  if cdsMovRemessa.FieldByName('coddocumento').AsInteger = -1 then //AP Agrupada
  begin
    //Crédito em C/C na CAIXA
    if pCodForma = 10 then
    begin
      //Obriga Cadastro Geral ter Dados Bancários preenchidos
      if (qryCtaBancariaAp_Agrupada.fieldbyname('NUMBANCO').isNull) or
        (qryCtaBancariaAp_Agrupada.fieldbyname('NUMAGENCIA').isNull) or
        (qryCtaBancariaAp_Agrupada.fieldbyname('NUMCONTA').isNull) then
        Result := Result + AnMSG13;

      //Obriga Cadastro Geral ter o Banco igual a CAIXA (104)
      if (not qryCtaBancariaAp_Agrupada.fieldbyname('NUMBANCO').isNull) and (qryCtaBancariaAp_Agrupada.fieldbyname('NUMBANCO').asString <> '104') then
        Result := Result + AnMSG05;

      //Obriga Cadastro Geral ter o CPF/CNPJ Preenchido
      if CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull then
        Result := Result + AnMSG06;

      //Obriga favorecido ter um tipo de conta = 1 ou 3 (Corrente ou Poupança)
      if (qryCtaBancariaAp_Agrupada.fieldbyname('TIPOCONTA').asString = '0') then
        Result := Result + AnMSG11;

      if (qryCtaBancariaAp_Agrupada.fieldbyname('TIPOCONTA').asString = '2') then
        Result := Result + AnMSG31;
    end
    else
    //DOC outros Bancos ou TED-Transf. Elet. Disponivel
    if pCodForma In [20, 81] then
    begin
      //Obriga Cadastro Geral ter Dados Bancários preenchidos
      if (qryCtaBancariaAp_Agrupada.fieldbyname('NUMBANCO').isNull) or
        (qryCtaBancariaAp_Agrupada.fieldbyname('NUMAGENCIA').isNull) or
        (qryCtaBancariaAp_Agrupada.fieldbyname('NUMCONTA').isNull) then
        Result := Result + AnMSG13;

      //Obriga Cadastro Geral ter o Banco diferente de CAIXA (104)
      if (not qryCtaBancariaAp_Agrupada.fieldbyname('NUMBANCO').isNull) and (qryCtaBancariaAp_Agrupada.fieldbyname('NUMBANCO').asString = '104') then
        Result := Result + AnMSG07;

      //Obriga Cadastro Geral ter o CPF/CNPJ Preenchido
      if CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull then
        Result := Result + AnMSG06;

      //Obriga favorecido ter um tipo de conta = 1 ou 3 (Corrente ou Poupança)
      if (qryCtaBancariaAp_Agrupada.fieldbyname('TIPOCONTA').asString = '0') then
        Result := Result + AnMSG11;

      if (qryCtaBancariaAp_Agrupada.fieldbyname('TIPOCONTA').asString = '2') then
        Result := Result + AnMSG31;
    end
    else
    //Ficha de Compensacao ou D.A.R ou G.E.F.I.P ou G.R.C.S ou Guia de Depósito Jud. ou Guia de Rec.do FGTS - GRFC ou Guia de Recolhimento de FGTS
    //DARF COD 2090 - COD DE BARRAS ou DARF DCTFWEB - INSS ou DARF COD 2073 - COD DE BARRAS
    if pCodForma in [11, 27, 32, 36, 47, 66, 117, 140, 154, 158] then
    begin
      //Obriga CPF/CNPJ quando o valor do documento for MAIOR que o valor
      //parametrizado no campo PORTFORMAXPARAMARQREM.VLR_OBRIGA_CPF_CNPJ
      if (RoundCM(dbrValorDocGeral.value, 2) >= dVlrObrigaNumDocTit) and // >= 250000
      (CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull) then
        Result := Result + AnMSG06;

      //Obriga Cadastro Geral ter o Código de Barras Preenchido
      if (qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').isNull) then
        Result := Result + AnMSG09
      else
      begin
        if (Length(qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').asString) = 48) and // Títulos Arrecadação
           ((copy(qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').asString, 2, 1) = '9') and // Segmento - Exclusivo do Banco
            (copy(qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').asString, 17, 4) <> '0104')) then // <> de Banco Caixa
          Result := Result + AnMSG12;

        //Código de Barras ou Linha Digitável Inválidos
        if (not Length(qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').asString) In [47, 48]) then
          Result := Result + AnMSG14;
      end;
    end
    else
    //D.A.R.F. ou D.A.R.F. 1708 ou D.A.R.F. 0561 ou D.A.R.F. 0588 ou D.A.R.F. 3223 ou D.A.R.F. 5952 ou D.A.R.F. 5987 ou D.A.R.F. 3579
    //D.A.R.F.5960 ou D.A.R.F. 5979 ou D.A.R.F. 0473 ou D.A.R.F. 5565 ou D.A.R.F. 1889 ou D.A.R.F. 3540 ou D.A.R.F. 3556 ou D.A.R.F. 3533
    //DAR COD 8045 ou D.A.R.F 5565
    if pCodForma In [26, 60, 61, 62, 64, 77, 78, 79, 80, 82, 83, 100, 103, 104, 105, 112, 131, 133, 134, 135, 138, 139, 156, 163] Then
    begin
      Result := Result + AnMSG32;
    end
    else
    //G.P.S. ou GPS COD 2631 ou GPS COD 2100
    if pCodForma in [28, 129, 130] then
    Begin
      if cdsTipoPagtoGeral.fieldbyname('CODFORMABANCO').AsString = '' then
        Result := Result + AnMSG18;
    end
    else //Else utilizado para informar que não foi definida uma análise para a forma de pagamento em AP AGRUPADA
      Result := Result + AnMSG32;
  end
  else
  //Everson Cunha - SIG117206 - Fim

  If pCodForma = 42 Then // Credito Diversas C/C na CAIXA
    Begin
      // Obriga Lista de Favorecido
      If qryMovListaFavorecidos.isEmpty Then
        Result := Result + AnMSG01;

      // Obriga Lista de Favorecido ter o valor igual ao do Documento
      If (Not qryMovListaFavorecidos.isEmpty) And (RoundCM(edSaldoListaFav.Value, 2) <> 0.00) Then
        Result := Result + AnMSG02;

      // Obriga Lista de Favorecido ter todos os Bancos iguais a CAIXA (104)
      If (Not qryMovListaFavorecidos.isEmpty) And (Not _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMBANCO', '104', '=')) Then
        Result := Result + AnMSG03;

      // Obriga Lista de Favorecido ter o CPF/CNPJ Preenchido
      If (Not qryMovListaFavorecidos.isEmpty) And (_AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=')) Then
        Result := Result + AnMSG04;
    End
  Else If pCodForma = 10 Then // Crédito em C/C na CAIXA
    Begin
      If qryMovListaFavorecidos.isEmpty Then
        Begin
          // Obriga Cadastro Geral ter Dados Bancários preenchidos
          If (qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) Or
            (qryCtaBancariaGeral.fieldbyname('NUMAGENCIA').isNull) Or
            (qryCtaBancariaGeral.fieldbyname('NUMCONTA').isNull) Then
            Result := Result + AnMSG13;

          // Obriga Cadastro Geral ter o Banco igual a CAIXA (104)
          If (Not qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) And (qryCtaBancariaGeral.fieldbyname('NUMBANCO').asString <> '104') Then
            Result := Result + AnMSG05;

          // Obriga Cadastro Geral ter o CPF/CNPJ Preenchido
          If CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull Then
            Result := Result + AnMSG06;

          // Obriga favorecido ter um tipo de conta = 1 ou 3 (Corrente ou Poupança)
          If (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '0') Then
            Result := Result + AnMSG11;
        End
      Else
        Begin
          // Obriga Lista de Favorecido ter o valor igual ao do Documento
          If (RoundCM(edSaldoListaFav.Value, 2) <> 0.00) Then
            Result := Result + AnMSG02;

          // Obriga Lista de Favorecido ter todos os Bancos iguais a CAIXA (104)
          If (Not _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMBANCO', '104', '=')) Then
            Result := Result + AnMSG03;

          // Obriga Lista de Favorecido ter todos os CPF/CNPJ´s
          If (_AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=')) Then
            Result := Result + AnMSG04;
        End;
    End
  Else If pCodForma in [113, 114] Then // Créditos Caixa e Docs Diversos ou Crédito CAIXA, DOC e TED
    Begin
      // Obriga Lista de Favorecido
      If qryMovListaFavorecidos.isEmpty Then
        Result := Result + AnMSG01;

      // Obriga Lista de Favorecido ter o valor igual ao do Documento
      If (Not qryMovListaFavorecidos.isEmpty) And (RoundCM(edSaldoListaFav.Value, 2) <> 0.00) Then
        Result := Result + AnMSG02;

      // Obriga Lista de Favorecido ter CPF/CNPJ Preenchido
      If (Not qryMovListaFavorecidos.isEmpty) And (_AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=')) Then
        Result := Result + AnMSG04;
    End
  Else If pCodForma In [20, 81] Then // DOC outros Bancos ou TED-Transf. Elet. Disponivel
    Begin
      If qryMovListaFavorecidos.isEmpty Then
        Begin
          // Obriga Cadastro Geral ter Dados Bancários preenchidos
          If (qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) Or
            (qryCtaBancariaGeral.fieldbyname('NUMAGENCIA').isNull) Or
            (qryCtaBancariaGeral.fieldbyname('NUMCONTA').isNull) Then
            Result := Result + AnMSG13;

          // Obriga Cadastro Geral ter o Banco diferente de CAIXA (104)
          If (Not qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) And (qryCtaBancariaGeral.fieldbyname('NUMBANCO').asString = '104') Then
            Result := Result + AnMSG07;

          // Obriga Cadastro Geral ter o CPF/CNPJ Preenchido
          If CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull Then
            Result := Result + AnMSG06;

          // Obriga favorecido ter um tipo de conta = 1 ou 3 (Corrente ou Poupança)
          If (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '0') Then
            Result := Result + AnMSG11;

          if (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '2') then
            Result := Result + AnMSG31;
        End
      Else
        Begin
          // Obriga Lista de Favorecido ter o valor igual ao do Documento
          If RoundCM(edSaldoListaFav.Value, 2) <> 0.00 Then
            Result := Result + AnMSG02;

          // Obriga Lista de Favorecido ter todos os Bancos diferente de CAIXA (104)
          If Not _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMBANCO', '104', '<>') Then
            Result := Result + AnMSG08;

          // Obriga Lista de Favorecido ter todos os CPF/CNPJ´s
          If _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=') Then
            Result := Result + AnMSG04;
        End;
    End
      // Ficha de Compensacao ou D.A.R ou G.E.F.I.P ou G.R.C.S ou Guia de Depósito Jud. ou Guia de Rec.do FGTS - GRFC ou Guia de Recolhimento de FGTS
      //DARF COD 2090 - COD DE BARRAS ou DARF - CODIGO DE BARRAS ou DARF COD 2073 - COD DE BARRAS ou DARF COD 5565 - COD DE BARRAS
  //Else If pCodForma In [11, 27, 32, 36, 47, 66] Then    //Everson Cunha - SIG84050
  //Else If pCodForma In [11, 27, 32, 36, 47, 66, 117] Then //Everson Cunha - SIG84050 //Everson Cunha - SIG126651
  Else If pCodForma In [11, 27, 32, 36, 47, 66, 117, 131, 133, 140, 155, 158, 163] Then //Everson Cunha - SIG126651
    Begin
      If qryMovTitulos.isEmpty Then
        Begin
          // Obriga CPF/CNPJ quando o valor do documento for MAIOR que o valor
          // parametrizado no campo PORTFORMAXPARAMARQREM.VLR_OBRIGA_CPF_CNPJ
          If (RoundCM(dbrValorDocGeral.value, 2) >= dVlrObrigaNumDocTit) And // >= 250000
          (CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull) Then
            Result := Result + AnMSG06;

          // Obriga Cadastro Geral ter o Código de Barras Preenchido
          If (qryDocumento.fieldbyname('NUMLEITCODBARRAS').isNull) Then
            Result := Result + AnMSG09
          Else
            Begin
              If (Length(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString) = 48) And // Títulos Arrecadação
              ((copy(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString, 2, 1) = '9') And // Segmento - Exclusivo do Banco
                (copy(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString, 17, 4) <> '0104')) Then // <> de Banco Caixa
                Result := Result + AnMSG12;

              // Código de Barras ou Linha Digitável Inválidos
              If (Not Length(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString) In [47, 48]) Then
                Result := Result + AnMSG14;
            End;
        End
      Else
        Begin
          // Obriga Lista de Titulos ter o valor igual ao do Documento
          If RoundCM(edSaldoTitulo.Value, 2) <> 0.00 Then
            Result := Result + AnMSG10;

          // Código de Barras ou Linha Digitável Inválidos
          If (Not Length(qryMovTitulos.fieldbyname('NUMCODBARRAS').asString) In [47, 48]) Then
            Result := Result + AnMSG15;
        End
    End
    // D.A.R.F. ou D.A.R.F. 1708 ou D.A.R.F. 0561 ou D.A.R.F. 0588 ou D.A.R.F. 3223 ou D.A.R.F. 5952 ou D.A.R.F. 5987 ou D.A.R.F. 3579
    // D.A.R.F.5960 ou D.A.R.F. 5979 ou D.A.R.F. 0473 ou D.A.R.F. 5565 ou D.A.R.F. 1889 ou D.A.R.F. 3540 ou D.A.R.F. 3556 ou D.A.R.F. 3533
    // DAR COD 8045
  //Cássio Rovaroto - SIG nº 99887 - Início
  //Else If pCodForma In [26, 60, 61, 62, 64, 77, 78, 79, 80, 82, 83, 100, 103, 104, 105, 112] Then
  //Else If pCodForma In [26, 60, 61, 62, 64, 77, 78, 79, 80, 82, 83, 100, 103, 104, 105, 112, 131, 133, 134, 135, 138, 139, 140, 155] Then //Everson Cunha - SIG126651
  Else If pCodForma In [26, 60, 61, 62, 64, 77, 78, 79, 80, 82, 83, 100, 103, 104, 105, 112, 131, 133, 134, 135, 138, 139, 156, 163] Then //Everson Cunha - SIG126651
  //Cássio Rovaroto - SIG nº 99887 - Fim
    Begin
      if qryDARF.FieldByName('DATAFINALAPURACAO').AsDateTime = 0 then
        Result := Result + AnMSG23;

      if qryDARF.FieldByName('NUMDOCUMENTO').AsString = '' then
        Result := Result + AnMSG24;

      if qryDARF.FieldByName('CODNATUREZA').AsString = '' then
        Result := Result + AnMSG25;

      if qryDARF.FieldByName('DATAVENCDARF').AsDateTime = 0 then
        Result := Result + AnMSG26;

      if qryDARF.FieldByName('VLRIRRF').AsString = '' then
        Result := Result + AnMSG27;

      if qryDARF.FieldByName('VLRTOTAL').AsString = '' then
        Result := Result + AnMSG28;

      if (qryDARF.FieldByName('VLRTOTAL').AsFloat <> cdsMovRemessa.FieldByName('VALOR').AsFloat) then
        Result := Result + AnMSG30;
    end
  //Cássio Rovaroto - SIG nº 99438 - Início
    //G.P.S.
  //Else If pCodForma In [28] Then
  //G.P.S., GPS COD 2631, GPS COD 2100
    else if pCodForma in [28, 129, 130, 154] then
  //Cássio Rovaroto - SIG nº 99438 - Fim
    Begin
      if (cdsTipoPagtoGeral.fieldbyname('CODFORMABANCO').AsString = '') and (pCodForma <> 154) then
        Result := Result + AnMSG18;

      //if (qryDocumento.fieldbyname('NUMLEITCODBARRAS').isNull) and (pCodForma <> 154) Then
      //      Result := Result + AnMSG09;

      if qryINSS.fieldbyname('COMPETENCIA').AsString = '' then
        Result := Result + AnMSG19;

      if qryINSS.fieldbyname('NUMDOCUMENTO').AsString = '' then
        Result := Result + AnMSG20;

      if qryINSS.fieldbyname('VLRINSS').AsString = '' then
        Result := Result + AnMSG21;

      if qryINSS.fieldbyname('VLRTOTAL').AsString = '' then
        Result := Result + AnMSG22;

      if (qryINSS.FieldByName('VLRTOTAL').AsFloat <> cdsMovRemessa.FieldByName('VALOR').AsFloat) then
        Result := Result + AnMSG29;
    end
  Else
    Result := Result + AnMSG16
  {
  // Num da AP não informada no Documento
  if (CdsMovRemessa.fieldbyname('NUM_AP').isNull) then
    Result := Result + AnMSG17;

  if (pTipoForma in [1,4]) then
  begin
    // Obriga Lista de Favorecido
    if (pListaFavorecidos = 'S') then // Credito Diversas C/C na CAIXA
    begin
      if (qryMovListaFavorecidos.isEmpty) then  // Credito Diversas C/C na CAIXA
        Result := Result + AnMSG01;

      // Obriga Lista de Favorecido ter o valor igual ao do Documento
      if (not qryMovListaFavorecidos.isEmpty) and (RoundCM(edSaldoListaFav.Value, 2) <> 0.00) then
        Result := Result + AnMSG02;

      // Obriga Lista de Favorecido ter todos os Bancos iguais a CAIXA (104)
      if (not qryMovListaFavorecidos.isEmpty) and (not _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMBANCO', '104', '=')) then
        Result := Result + AnMSG03;

      // Obriga Lista de Favorecido ter o CPF/CNPJ Preenchido
      if (not qryMovListaFavorecidos.isEmpty) and (_AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=')) then
      Result := Result + AnMSG04;
    end
    else // Crédito em C/C na CAIXA
    begin
      if qryMovListaFavorecidos.isEmpty then
      begin
        // Obriga Cadastro Geral ter Dados Bancários preenchidos
        if (qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) or
           (qryCtaBancariaGeral.fieldbyname('NUMAGENCIA').isNull) or
            (qryCtaBancariaGeral.fieldbyname('NUMCONTA').isNull) then
          Result := Result + AnMSG13;

        //Obriga Cadastro Geral ter o Banco igual a CAIXA (104)
        if (not qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) and (qryCtaBancariaGeral.fieldbyname('NUMBANCO').asString <> '104') then
            Result := Result + AnMSG05;

          // Obriga Cadastro Geral ter o CPF/CNPJ Preenchido
          If CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull Then
            Result := Result + AnMSG06;

          // Obriga favorecido ter um tipo de conta = 1 ou 3 (Corrente ou Poupança)
          If (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '0') Then
            Result := Result + AnMSG11;
      end;
    end;
  end
  else if (pTipoForma = 3) then // Créditos Caixa e Docs Diversos
  begin
      // Obriga Lista de Favorecido
      if (pListaFavorecidos = 'S') and (qryMovListaFavorecidos.isEmpty) then
        Result := Result + AnMSG01;

      // Obriga Lista de Favorecido ter o valor igual ao do Documento
      if (not qryMovListaFavorecidos.isEmpty) and (RoundCM(edSaldoListaFav.Value, 2) <> 0.00) then
        Result := Result + AnMSG02;

      // Obriga Lista de Favorecido ter CPF/CNPJ Preenchido
      if (not qryMovListaFavorecidos.isEmpty) and (_AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=')) then
        Result := Result + AnMSG04;
  end
  else if pTipoForma in [9, 10] then // TED-Transf. Elet. Disponivel
  begin
    if pListaFavorecidos = 'N' Then
    begin
      // Obriga Cadastro Geral ter Dados Bancários preenchidos
      if (qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) or
         (qryCtaBancariaGeral.fieldbyname('NUMAGENCIA').isNull) or
         (qryCtaBancariaGeral.fieldbyname('NUMCONTA').isNull) then
        Result := Result + AnMSG13;

      // Obriga Cadastro Geral ter o Banco diferente de CAIXA (104)
      if (not qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) and (qryCtaBancariaGeral.fieldbyname('NUMBANCO').asString = '104') then
        Result := Result + AnMSG07;

      // Obriga Cadastro Geral ter o CPF/CNPJ Preenchido
      if CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull then
        Result := Result + AnMSG06;

      // Obriga favorecido ter um tipo de conta = 1 ou 3 (Corrente ou Poupança)
      if (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '0') then
        Result := Result + AnMSG11;

      if (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '2') then
        Result := Result + AnMSG31;
    end
    else
    begin
      if (qryMovListaFavorecidos.isEmpty) then
        Result := Result + AnMSG01;

      // Obriga Lista de Favorecido ter o valor igual ao do Documento
      if RoundCM(edSaldoListaFav.Value, 2) <> 0.00 then
        Result := Result + AnMSG02;

      // Obriga Lista de Favorecido ter todos os Bancos diferente de CAIXA (104)
      if not _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMBANCO', '104', '<>') then
        Result := Result + AnMSG08;

      // Obriga Lista de Favorecido ter todos os CPF/CNPJ´s
      if _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=') then
        Result := Result + AnMSG04;
    end;
  end
  // Ficha de Compensacao ou D.A.R ou G.E.F.I.P ou G.R.C.S ou Guia de Depósito Jud. ou Guia de Rec.do FGTS - GRFC ou Guia de Recolhimento de FGTS
  else if pTipoForma in [6, 7, 8, 12] then
  begin
    if (pListaTitulos = 'N') then
    begin
      // Obriga CPF/CNPJ quando o valor do documento for MAIOR que o valor
      // parametrizado no campo PORTFORMAXPARAMARQREM.VLR_OBRIGA_CPF_CNPJ
      if (RoundCM(dbrValorDocGeral.value, 2) >= dVlrObrigaNumDocTit) and // >= 250000
          (CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull) then
        Result := Result + AnMSG06;

      // Obriga Cadastro Geral ter o Código de Barras Preenchido
      if (qryDocumento.fieldbyname('NUMLEITCODBARRAS').isNull) then
        Result := Result + AnMSG09
      else
      begin
        if (Length(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString) = 48) and // Títulos Arrecadação
           ((copy(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString, 2, 1) = '9') and // Segmento - Exclusivo do Banco
            (copy(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString, 17, 4) <> '0104')) then // <> de Banco Caixa
          Result := Result + AnMSG12;

        // Código de Barras ou Linha Digitável Inválidos
        if (not Length(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString) In [47, 48]) then
          Result := Result + AnMSG14;
      end;
    end
    else
    begin
      // Obriga Lista de Titulos ter o valor igual ao do Documento
      if RoundCM(edSaldoTitulo.Value, 2) <> 0.00 then
        Result := Result + AnMSG10;

      // Código de Barras ou Linha Digitável Inválidos
      if (not Length(qryMovTitulos.fieldbyname('NUMCODBARRAS').asString) In [47, 48]) then
        Result := Result + AnMSG15;
    end
  end
  // D.A.R.F. ou D.A.R.F. 1708 ou D.A.R.F. 0561 ou D.A.R.F. 0588 ou D.A.R.F. 3223 ou D.A.R.F. 5952 ou D.A.R.F. 5987 ou D.A.R.F. 3579
  // D.A.R.F.5960 ou D.A.R.F. 5979 ou D.A.R.F. 0473 ou D.A.R.F. 5565 ou D.A.R.F. 1889 ou D.A.R.F. 3540 ou D.A.R.F. 3556 ou D.A.R.F. 3533
  else if pTipoForma = 13 then
  begin
    if qryDARF.FieldByName('DATAFINALAPURACAO').AsDateTime = 0 then
      Result := Result + AnMSG23;

    if qryDARF.FieldByName('NUMDOCUMENTO').AsString = '' then
      Result := Result + AnMSG24;

    if qryDARF.FieldByName('CODNATUREZA').AsString = '' then
      Result := Result + AnMSG25;

    if qryDARF.FieldByName('DATAVENCDARF').AsDateTime = 0 then
      Result := Result + AnMSG26;

    if qryDARF.FieldByName('VLRIRRF').AsString = '' then
      Result := Result + AnMSG27;

    if qryDARF.FieldByName('VLRTOTAL').AsString = '' then
      Result := Result + AnMSG28;

    if (qryDARF.FieldByName('VLRTOTAL').AsFloat <> cdsMovRemessa.FieldByName('VALOR').AsFloat) then
      Result := Result + AnMSG30;
  end
  //G.P.S.
  else if pTipoForma = 14 then
  begin
    if cdsTipoPagtoGeral.fieldbyname('CODFORMABANCO').AsString = '' then
      Result := Result + AnMSG18;

    if qryINSS.fieldbyname('COMPETENCIA').AsString = '' then
      Result := Result + AnMSG19;

    if qryINSS.fieldbyname('NUMDOCUMENTO').AsString = '' then
      Result := Result + AnMSG20;

    if qryINSS.fieldbyname('VLRINSS').AsString = '' then
      Result := Result + AnMSG21;

    if qryINSS.fieldbyname('VLRTOTAL').AsString = '' then
      Result := Result + AnMSG22;

    if (qryINSS.FieldByName('VLRTOTAL').AsFloat <> cdsMovRemessa.FieldByName('VALOR').AsFloat) then
      Result := Result + AnMSG29;
  end
  else
    Result := Result + AnMSG16 }
  //Cássio Rovaroto - SIG nº 102967 - Fim    
End;

Function TFrmRemessaEletronica._ProcessarBaixa(pTipoBaixa, pNomeConvenio, pIdArquivoPagto, sNSA: String;   //edilaine - SI75325
                                               pCodPortForma: Integer; pValor: Double): Boolean;     
Var dDataDisp: TDateTime;
Begin
  result := False;
  CmpDadosParaBaixaCAP.ParamValues[0].TextDefault := DateToStr(Date);
  //edilaine - SI75325 - inicio
  //CmpDadosParaBaixaCAP.ParamValues[1].TextDefault := pNomeConvenio + ' - Arq. n ' + pIdArquivoPagto;
  CmpDadosParaBaixaCAP.ParamValues[1].TextDefault := pNomeConvenio + ' - Arq. n ' + sNSA;
  //edilaine - SI75325 - fim
  CmpDadosParaBaixaCAP.ParamValues[2].TextDefault := floattostrf(pValor, ffnumber, 12, 2);

  If CmpDadosParaBaixaCAP.Execute Then
    Begin
      Screen.Cursor := crSQLWait;
      cdsMovBaixa.data := oRemessaEletronica._SelecionaMovBaixa(pIdArquivoPagto, pTipoBaixa);

      If Not oCtrlFinanc.TestaDispFinanc(
        Sistema.IdEmpresa,
        Sistema.IdUsuario,
        CmpDadosParaBaixaCAP.ParamValues[0].AsDateTime) Then
        Begin
          MsgDlg(oCtrlFinanc.MessageInfo, Caption, mtWarning, [mbOk], 0);
          Screen.Cursor := crDefault;
          Exit;
        End;

      If oCtrlFinanc.IntegraDispFinanc Then
        dDataDisp := CmpDadosParaBaixaCAP.ParamValues[0].AsDateTime;

      // Função de baixa global
      Result := oCtrlBaixaDocumentos.ProcessaBaixaManual(
        False, // Controla Emissao de Cheque
        pCodPortForma, // ID do Portador Forma
        strtoint(pIdArquivoPagto), // Num cheque bordero
        cdsMovBaixa.Data, // CDS com o Movimento
        dDataDisp, // Data do Lançamento
        dDataDisp, // Data da Baixa
        TSistemaLancto(Sistema.IdModulo - 3), // Módulo
        False, // Lanca Baixa Float
        Sistema.IdUsuario,
        Sistema.IdEmpresa,
        Sistema.IdEspAcesso,
        ParamIntegra.Plano, // iPLanoContabil
        Sistema.UsaPlanoPatro,
        ParamIntegra.IntegraContab,
        ParamIntegra.PartidaDobrada,
        True, // Calcula Imposto
        0, // iNumBaixaRecXPagto
        0, // iPlnCodigo
        -1, // iCodLancFinanc
        True, // bLancaFinancBaixa
        0, // Data Diferido
        0, // CODLANCFINANCnIdent
        dDataDisp, // data da Disponibilidade
        false, // Estorno
        false, // bUsaPortFormaRetorno
        false, // bLancHistContabLoteOrig
        CmpDadosParaBaixaCAP.ParamValues[1].AsString);

      Screen.Cursor := crDefault;

      If Result Then
        //edilaine - SI75325 - inicio
        //Application.MessageBox(pchar('Arquivo Nº ' + pIdArquivoPagto + ' Baixado com Sucesso !'), 'Atenção !', Mb_IconExclamation)
        Application.MessageBox(pchar('Arquivo Nº ' + sNSA + ' Baixado com Sucesso !'), 'Atenção !', Mb_IconExclamation)
        //edilaine - SI75325 - fim
      Else
        MsgDlg(oCtrlBaixaDocumentos.MessageInfo, 'Atenção', mtError, [mbOk], 0);
    End;
End;

Procedure TFrmRemessaEletronica.spbSelRemessaClick(Sender: TObject);
var
  sListaDeDocumentos : String; //Everson Cunha - SIG117008
  sMsgErro: string;
Begin
  Inherited;
  bAltFormPagto := False;
  bAltFormPagtoApAgrupada := False;
  bAnaliseFeita := False;
  sFormaPagtoAnt := EmptyStr;
  sFormaPagtoApAgrupadaAnt := EmptyStr;
  cdsMovRemessa.IndexName := EmptyStr;

  If dblkpConvenio.LookupValue = EmptyStr Then
    Begin
      MsgDlg(MSG001, 'Atenção', mtWarning, [mbOK], 0);
      dblkpConvenio.SetFocus;
      Exit;
    End;

  If dblkpFormaPagto.LookupValue = EmptyStr Then
    Begin
      MsgDlg(MSG032, 'Atenção', mtWarning, [mbOK], 0);
      dblkpFormaPagto.LookupValue := '-1'; // Todas as Forma de Pagamento como default
      dblkpFormaPagto.SetFocus;
      Exit;
    End;

  If dbDataProgIni.Text = EmptyStr Then
    Begin
      MsgDlg(MSG002, 'Atenção', mtWarning, [mbOK], 0);
      dbDataProgIni.Date := date;
      dbDataProgIni.SetFocus;
      Exit;
    End;

  If dbDataProgFim.Text = EmptyStr Then
    Begin
      MsgDlg(MSG003, 'Atenção', mtWarning, [mbOK], 0);
      dbDataProgFim.Date := date;
      dbDataProgFim.SetFocus;
      Exit;
    End;

  If dbDataProgIni.Date > dbDataProgFim.Date Then
    Begin
      MsgDlg(MSG004, 'Atenção', mtWarning, [mbOK], 0);
      dbDataProgIni.Date := date;
      dbDataProgFim.Date := date;
      dbDataProgIni.SetFocus;
      Exit;
    End;

  // Verificando se há parametrização específica do Convênio em questão
  If oRemessaEletronica._CarregaParamConvenio(dblkpConvenio.LookupValue, sMsgErro) Then
    Begin
      dVlrObrigaNumDocTit := oRemessaEletronica.rDadosParamConv.dVlrObrigaCpfCnpj;

      cdsMovRemessa.DisableControls;

      frmAguarde.pbAguarde.Visible := false;
      frmAguarde.Mostra('Selecionando Movimento...');

      Screen.Cursor := crSQLWait;

      cdsMovRemessa.data := oRemessaEletronica._SelecionaMovimentoRemessa(
        dblkpConvenio.LookupValue,
        dblkpFormaPagto.LookupValue,
        dbDataProgIni.Date,
        dbDataProgFim.Date,
        iIdModuloAcesso);

      Screen.Cursor := crDefault;

      frmAguarde.pbAguarde.Visible := True;
      frmAguarde.Apaga;

      cdsMovRemessa.EnableControls;

      If cdsMovRemessa.isEmpty Then
        Application.MessageBox(MSG020, 'Atenção !', Mb_IconExclamation);

      dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);

      //Cássio Rovaroto - SIG nº 60540 - Início
      //Se o módulo não for Contas a Pagar, gerar a lista de favorecidos automaticamente
      if (iIdModuloAcesso <> 3) and not(cdsMovRemessa.IsEmpty)  then
      begin
        frmAguarde.pbAguarde.Visible := false;
        frmAguarde.Mostra('Selecionando favorecidos...');

        //Everson Cunha - SIG117008 - Ini
        tsListaDeDocumentos.Clear;

        cdsMovRemessa.First;

        while not cdsMovRemessa.Eof do
        begin
          tsListaDeDocumentos.Add(cdsMovRemessa.FieldByName('CODDOCUMENTO').asString);
          cdsMovRemessa.Next;
        end;

        sListaDeDocumentos := oRemessaEletronica._ConverteListas(tsListaDeDocumentos);

        //Exclui os registros de favorecidos que não foram para arquivos gerados....
        //ExlcuiFavorecidosNaoGerados;
        ExcluiFavorecidosNaoGerados(sListaDeDocumentos);

        //Everson Cunha - SIG117008 - Fim

        cdsMovRemessa.First;
        while not cdsMovRemessa.Eof do
        begin
          _GetFavorecidosAutomatico(iIdModuloAcesso,dblkpConvenio.LookupValue, dblkpFormaPagto.LookupValue, dbDataProgIni.Date, dbDataProgFim.Date,
                                    cdsMovRemessa.FieldByName('CODDOCUMENTO').asInteger, cdsMovRemessa.FieldByName('IDHSTFOLHABENEF').asInteger);
          cdsMovRemessa.Next;
        end;

        frmAguarde.pbAguarde.Visible := True;
        frmAguarde.Apaga;
      end;
      //Cássio Rovaroto - SIG nº 60540 - Fim

      spbAnalisar.Enabled := (Not cdsMovRemessa.isempty);
      spbPrepararEnvio.Enabled := (Not cdsMovRemessa.isempty);

      cdsMovRemessaAfterScroll(cdsMovRemessa);
      cdsMovRemessa.First;
    End
  Else
    Application.MessageBox(pchar('Convênio -> ' + dblkpConvenio.Text + ' - ' + sMsgErro), 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.spbAnalisarClick(Sender: TObject);
Var sMSGErroAnalise: String;
Begin
  Inherited;
  If Not cdsMovRemessa.isEmpty Then
    Begin
      cdsMovRemessa.first;
      If cdsMovRemessa.Locate('MARCADO', 'S', []) Then // Sim
        Begin
          bAnaliseFeita := True;
          iContador := 0;
          frmProgresso.MostraFormProgresso('Aguarde ! Analisando o Movimento...', True, False, True, 0, cdsMovRemessa.RecordCount);

          Screen.Cursor := crSQLWait;
          cdsMovRemessa.first;
          While Not cdsMovRemessa.Eof Do
            Begin
              If cdsMovRemessa.FieldByName('MARCADO').AsString = 'S' Then // Sim
                Begin
                  sMSGErroAnalise := _AnaliseDoMovimento(cdsMovRemessa.FieldByName('CODFORMA').AsInteger,
                                                         cdsMovRemessa.FieldByName('TIPOFORMA').AsInteger,
                                                         cdsMovRemessa.FieldByName('FLGPERMITELISTAFAVORECIDO').AsString,
                                                         cdsMovRemessa.FieldByName('FLGPERMITETITULOSPAGTO').AsString);
                  cdsMovRemessa.Edit;
                  //cdsMovRemessa.FieldByName('MSGERRO').AsString := sMSGErroAnalise;             //Everson Cunha - SIG84050
                  cdsMovRemessa.FieldByName('MSGERRO').AsString := copy(sMSGErroAnalise, 0, 250); //Everson Cunha - SIG84050
                End;

              cdsMovRemessa.Next;
              oRemessaEletronica._AtualizaFrmProgresso(iContador);
            End;

          cdsMovRemessa.first;
          Screen.Cursor := crDefault;
          frmProgresso.EscondeFormProgresso;
        End
      Else
        Application.MessageBox(MSG012, 'Atenção !', Mb_IconExclamation);
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.PageControl1Change(Sender: TObject);
Begin
  Inherited;
  spbAnalisar.Enabled := (pcGeralRemessa.activepage = tbsAnalise);
  spbPrepararEnvio.Enabled := (pcGeralRemessa.activepage = tbsAnalise);
End;

Procedure TFrmRemessaEletronica.spbCalcClick(Sender: TObject);
Begin
  Inherited;
  WinExec('Calc.Exe', SW_Show);
End;

Procedure TFrmRemessaEletronica.cdsMovRemessaAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  stQtd1.Caption := Format('%.2d / %.2d', [cdsMovRemessa.RecNo, cdsMovRemessa.RecordCount]);
  dValorTotalMovLista := 0.00;
  dValorTotalTitulos := 0.00;
  If Not cdsMovRemessa.isEmpty Then
    Begin
      dbgMovListaFav.ColumnByName('VALOR').FooterValue := _TotalizaColunaGridMovListaFavorecidos('VALOR', 2);
      dbgMovTitulos.ColumnByName('VLRPAGTO').FooterValue := _TotalizaColunaGridMovTitulos('VLRPAGTO', 2);
      edSaldoListaFav.Value := RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat - dValorTotalMovLista, 2);
      edSaldoTitulo.Value := RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat - dValorTotalTitulos, 2);
      tbsAnaliseManutencoes.Highlighted := ((Not cdsMovRemessa.IsEmpty) And ((Not qryMovListaFavorecidos.IsEmpty) Or (Not qryMovTitulos.IsEmpty)));

      //Everson Cunha - SIG84050 - Início
      mkeMesAnoComp.Text := qryINSS.fieldbyname('COMPETENCIA').AsString;
      edtRazaoSocialGPS.Text := qryINSS.fieldbyname('RAZAOSOCIAL').AsString;
      edtNumDocumentoGPS.Text := qryINSS.fieldbyname('NUMDOCUMENTO').AsString;
      HabilitaDesabilitaCampos;
      //Everson Cunha - SIG84050 - Fim

      //Everson Cunha - SIG117206 - Ini
      tbsAnManGeral.TabVisible := (not cdsMovRemessa.IsEmpty) and (cdsMovRemessa.FieldByName('coddocumento').AsInteger <> -1);
      tbsAnManListaFavorec.TabVisible := (not cdsMovRemessa.IsEmpty) and (cdsMovRemessa.FieldByName('coddocumento').AsInteger <> -1);
      tbsAnManTitulos.TabVisible := (not cdsMovRemessa.IsEmpty) and (cdsMovRemessa.FieldByName('coddocumento').AsInteger <> -1);
      tbsAnManAp_Agrupada.TabVisible := (not cdsMovRemessa.IsEmpty) and (cdsMovRemessa.FieldByName('coddocumento').AsInteger = -1);

      if (not cdsMovRemessa.IsEmpty) and (cdsMovRemessa.FieldByName('coddocumento').AsInteger = -1) then
        pcDetalManut.ActivePage := tbsAnManAp_Agrupada
      else
        pcDetalManut.ActivePage := tbsAnManGeral;
      //Everson Cunha - SIG117206 - Fim
    End;
End;

Procedure TFrmRemessaEletronica.dbgMovRemessaCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
  Inherited;
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        // linhas ímpares = Cinza, linhas pares = branco
        If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
          ABrush.Color := CorDaZebra
        Else
          ABrush.Color := clWhite;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TFrmRemessaEletronica.dbgMovRemessaDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If (Not cdsMovRemessa.isEmpty) Then
    Begin
      If field.FieldName = 'MSGERRO' Then
        If trim(cdsMovRemessa.fieldbyname('MSGERRO').asString) <> EmptyStr Then
          dbgMovRemessa.Canvas.Font.Color := clRed;

      dbgMovRemessa.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronica.spbInverterSelClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If Not cdsMovRemessa.isEmpty Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando/desmar. todos os Lançamentos...', True, False, True, 0, cdsMovRemessa.RecordCount);
      cdsMovRemessa.DisableControls;
      cdsMovRemessa.AfterScroll := Nil;
      cdsMovRemessa.First;
      While Not cdsMovRemessa.Eof Do
        Begin
          cdsMovRemessa.Edit;
          If cdsMovRemessa.FieldByName('MARCADO').AsString = 'S' Then // Sim
            cdsMovRemessa.FieldByName('MARCADO').AsString := 'N' // Não
          Else
            cdsMovRemessa.FieldByName('MARCADO').AsString := 'S'; // Sim

          cdsMovRemessa.Next;
          oRemessaEletronica._AtualizaFrmProgresso(iContador);
        End;
      dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
      cdsMovRemessa.First;
      cdsMovRemessa.AfterScroll := cdsMovRemessaAfterScroll;
      cdsMovRemessa.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TFrmRemessaEletronica.spbMarcaTodosClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If (Not cdsMovRemessa.isEmpty) Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando todos os Lançamentos...', True, False, True, 0, cdsMovRemessa.RecordCount);
      cdsMovRemessa.DisableControls;
      cdsMovRemessa.AfterScroll := Nil;
      cdsMovRemessa.First;
      While Not cdsMovRemessa.Eof Do
        Begin
          cdsMovRemessa.Edit;
          cdsMovRemessa.FieldByName('MARCADO').AsString := 'S'; // Sim

          cdsMovRemessa.Next;
          oRemessaEletronica._AtualizaFrmProgresso(iContador);
        End;
      dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
      cdsMovRemessa.First;
      cdsMovRemessa.AfterScroll := cdsMovRemessaAfterScroll;
      cdsMovRemessa.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TFrmRemessaEletronica.spbExpBenefSelClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovRemessa.isEmpty Then
    Begin
      qeMovRemessa.FileName := sPathArquivosLog + '\REMESSA_MOVIMENTO.XLS';
      qeMovRemessa.Execute;
      cdsMovRemessa.First;
    End;
End;

// **************** INICIO ROTINAS DO MOVIMENTO DAS LISTAS DE FAVORECIDOS

Procedure TFrmRemessaEletronica.btnInc1Click(Sender: TObject);
Begin
  Inherited;
  btnInc1.down := True;
  If qryMovListaFavorecidos.State <> dsInsert Then
    Begin
      Try
        If cdsMovRemessa.FieldByName('FLGPERMITELISTAFAVORECIDO').AsString = 'S' Then
          Begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlGridMovLista.enabled := False;
            pnlDadosMovLista.enabled := True;
            pnlCritSel.Enabled := False;
            pnlInfMan.Enabled := False;

            btnAlt1.enabled := False;
            btnExc1.enabled := False;
            spbImportarMovLista.enabled := False;
            spbLimparMovLista.enabled := False;
            dbNavListFavorec.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            dValorAntCampo := 0.00;
            If _TemSaldoDisponivel(edSaldoListaFav.Value) Then
              Begin
                qryMovListaFavorecidos.Insert;
                qryMovListaFavorecidos.FieldByName('FLGIMPORTADO').AsString := 'N'; // Não
                qryMovListaFavorecidos.FieldByName('VALOR').AsFloat := RoundCM(edSaldoListaFav.Value, 2);

                dbeValorPagtoLista.Setfocus;
              End
            Else
              btnCan1Click(Self);
          End
        Else
          Begin
            Application.MessageBox(MSG027, 'Atenção !', Mb_IconExclamation);
            btnInc1.down := False;
          End;
      Except
        btnCan1Click(Self);
        Raise;
      End;
    End
  Else
    btnInc1.Down := False;
End;

Procedure TFrmRemessaEletronica.btnAlt1Click(Sender: TObject);
Begin
  Inherited;

  If Not qryMovListaFavorecidos.isEmpty Then
    Begin
      dValorAntCampo := 0.00;
      btnAlt1.down := True;
      If qryMovListaFavorecidos.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlGridMovLista.enabled := False;
            pnlDadosMovLista.enabled := True;
            pnlCritSel.Enabled := False;
            pnlInfMan.Enabled := False;

            btnInc1.enabled := False;
            btnExc1.enabled := False;
            spbImportarMovLista.enabled := False;
            spbLimparMovLista.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            dValorAntCampo := qryMovListaFavorecidos.FieldByName('VALOR').AsFloat;

            qryMovListaFavorecidos.Edit;
            dbeValorPagtoLista.setfocus;
          Except
            btnCan1Click(Self);
            Raise;
          End;
        End
      Else
        btnAlt1.Down := False;
    End
  Else
    Begin
      btnAlt1.Down := False;
      Application.MessageBox(MSG021, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TFrmRemessaEletronica.btnExc1Click(Sender: TObject);
Begin
  Inherited;
  If Not qryMovListaFavorecidos.isEmpty Then
    Begin
      If MsgDlg('Confirma Exclusão deste Favorecido ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryMovListaFavorecidos.Delete;
            qryMovListaFavorecidos.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            qryMovListaFavorecidos.Close;
            qryMovListaFavorecidos.Open;

            cdsMovRemessaAfterScroll(cdsMovRemessa);

            Screen.Cursor := crDefault;
          Except
            Raise;
          End;
          btnExc1.Down := False;
        End
      Else
        btnExc1.Down := False;
    End
  Else
    Begin
      btnExc1.Down := False;
      Application.MessageBox(MSG021, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TFrmRemessaEletronica.btnCon1Click(Sender: TObject);
Begin
  Inherited;

  If dbeNomeFavorec.Text = EmptyStr Then
    Begin
      Application.MessageBox(MSG006, 'Atenção !', Mb_IconExclamation);
      dbeValorPagtoLista.setfocus;
      Exit;
    End;

  // CPF/CNPJ
  If MSFavorec.ValoresChave[1] = EmptyStr Then
    Begin
      Application.MessageBox(MSG033, 'Atenção !', Mb_IconExclamation);
      Exit;
    End;

  If dbeBanco.Text = EmptyStr Then
    Begin
      Application.MessageBox(MSG007, 'Atenção !', Mb_IconExclamation);
      dbeValorPagtoLista.setfocus;
      Exit;
    End;

  If dbeAgencia.Text = EmptyStr Then
    Begin
      Application.MessageBox(MSG007, 'Atenção !', Mb_IconExclamation);
      dbeAgencia.setfocus;
      Exit;
    End;

  If dbeConta.Text = EmptyStr Then
    Begin
      Application.MessageBox(MSG007, 'Atenção !', Mb_IconExclamation);
      dbeConta.setfocus;
      Exit;
    End;

  If dbeValorPagtoLista.Value = 0 Then
    Begin
      Application.MessageBox(MSG008, 'Atenção !', Mb_IconExclamation);
      qryMovListaFavorecidos.FieldByName('VALOR').AsFloat := RoundCM(edSaldoListaFav.Value + dValorAntCampo, 2);
      dbeValorPagtoLista.setfocus;
      Exit;
    End;

  If ROUNDCM(dbeValorPagtoLista.Value, 2) > ROUNDCM((dValorAntCampo + edSaldoListaFav.Value), 2) Then
    Begin
      Application.MessageBox(MSG010, 'Atenção !', Mb_IconExclamation);
      qryMovListaFavorecidos.FieldByName('VALOR').AsFloat := RoundCM(edSaldoListaFav.Value + dValorAntCampo, 2);
      dbeValorPagtoLista.setfocus;
      Exit;
    End;

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryMovListaFavorecidos.State In [dsInsert, dsEdit] Then
          Begin
            Screen.Cursor := crSQLWait;
            If qryMovListaFavorecidos.State = dsInsert Then
              Begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('SELECT SEQDOCXPESSOAS.NEXTVAL SEQ FROM DUAL    ');
                qryAux.Open;

                qryMovListaFavorecidos.fieldByname('CODDOCUMENTO').asInteger := cdsMovRemessa.fieldByname('CODDOCUMENTO').asInteger;
                qryMovListaFavorecidos.fieldByname('IDDOCUMENTOXPESSOAS').asInteger := qryAux.fieldByname('SEQ').asInteger;
                qryAux.Close;
              End;

            qryMovListaFavorecidos.Post;
            qryMovListaFavorecidos.ApplyUpdates;

            dtmBaseDados.dbBaseDados.Commit;

            qryMovListaFavorecidos.Close;
            qryMovListaFavorecidos.Open;

            dbgMovListaFav.ColumnByName('VALOR').FooterValue := _TotalizaColunaGridMovListaFavorecidos('VALOR', 2);
            edSaldoListaFav.Value := RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat - dValorTotalMovLista, 2);

            Screen.Cursor := crDefault;

            If (btnInc1.down) And (RoundCM(edSaldoListaFav.Value, 2) <> 0.00) Then
              btnInc1Click(Self)
            Else
              btnCan1Click(Self);
          End;
      End;
  Except
    btnCan1Click(Self);
    Raise;
  End;
End;

Procedure TFrmRemessaEletronica.btnCan1Click(Sender: TObject);
Begin
  Inherited;
  If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryMovListaFavorecidos.state In [dsEdit, dsInsert] Then
        qryMovListaFavorecidos.CancelUpdates;

      dtmBaseDados.dbBaseDados.RollBack;
    End;

  pnlGridMovLista.enabled := True;
  pnlDadosMovLista.enabled := False;
  pnlCritSel.Enabled := True;
  pnlInfMan.Enabled := True;

  btnInc1.enabled := True;
  btnAlt1.enabled := True;
  btnExc1.enabled := True;
  spbImportarMovLista.enabled := True;
  spbLimparMovLista.enabled := True;
  dbNavListFavorec.enabled := True;
  btnCon1.Enabled := False;
  btnCan1.Enabled := False;

  btnInc1.Down := False;
  btnAlt1.Down := False;
End;

Procedure TFrmRemessaEletronica.spbBuscaContaCorClick(Sender: TObject);
Begin
  Inherited;
  With DtmDadosBancarios Do
    Begin
      SetaFiltroMs(qryMovListaFavorecidos.FieldByName('IDFORCLI').AsFloat);
      If MsContaCor.Executar = MrOk Then
        Begin
          If MsContaCor.ValoresChave[0] <> EmptyStr Then
            Begin
              If MsContaCor.ValoresChave[4] <> '0' Then // Se for Conta Corrente ou Poupança (1 ou 3)
                Begin
                  qryMovListaFavorecidos.FieldByName('IDCBANCARIA').AsFloat := StrToFloat(MsContaCor.ValoresChave[0]);
                  qryMovListaFavorecidos.FieldByName('NUMBANCO').AsString := MsContaCor.ValoresChave[2];
                  qryMovListaFavorecidos.FieldByName('NUMAGENCIA').AsString := MsContaCor.ValoresChave[3];
                  qryMovListaFavorecidos.FieldByName('NUMCONTA').AsString := MsContaCor.ValoresChave[1];
                  qryMovListaFavorecidos.FieldByName('TIPOCONTA').AsString := MsContaCor.ValoresChave[4];
                End
              Else
                Application.MessageBox(MSG034, 'Atenção !', Mb_IconExclamation);
            End;

          dbeValorPagtoLista.setfocus;
        End;
    End;
End;

Procedure TFrmRemessaEletronica.spbImportarMovListaClick(Sender: TObject);
Var tArquivo: TextFile;
  sLinha, sBanco, sAgencia, sOperacao, sConta, sTipoConta, sDocumento, sNome: String;
  sValorCampo: TStringlist;
  dValor, dTotalLista: Double;
Begin
  Inherited;
  If cdsMovRemessa.FieldByName('FLGPERMITELISTAFAVORECIDO').AsString = 'S' Then
    Begin
      If Application.MessageBox(pchar('O Arquivo (.csv ou .txt) deve conter colunas separadas por " ; " : ' + #13 + #13 +
        '[CPF/CNPJ] - (Como texto e sem máscara)' + #13 +
        '[Razão Social] - (Como texto)' + #13 +
        '[Nº Banco] ' + #13 +
        '[Nº Agência] - (Caso haja digito, separá-lo com um hífen)' + #13 +
        '[Operação] - (Caso não tenha, colocar um ZERO)' + #13 +
        '[Nº Conta] - (Caso haja digito, separá-lo com um hífen)' + #13 +
        '[Tipo Conta] - (1 - Corrente / 3 - Poupança)' + #13 +
        '[Valor] - (Ex.: 100,48)' + #13 + #13 +
        'Exemplo: 03447883189;JOSE DA SILVA;104;2458;013;6510-7;1;100,48' + #13 + #13 +
        'Confirma Importação ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          If dlgAbreArquivo.Execute Then
            If uppercase(dlgAbreArquivo.FileName) <> EmptyStr Then
              Begin
                Try
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                    dtmBaseDados.dbBaseDados.StartTransaction;

                  Cursor := crSQLWait;
                  qryMovListaFavorecidos.DisableControls;

                  dTotalLista := 0.00;
                  sValorCampo := TStringList.Create;
                  // Lendo o arquivo
                  AssignFile(tArquivo, dlgAbreArquivo.FileName);
                  Reset(tArquivo);
                  While Not EOF(tArquivo) Do
                    Begin
                      sValorCampo.clear;
                      // Lendo linha dos dados
                      Readln(tArquivo, sLinha);
                      // Extraindo o valor de cada campo e guardando numa stringlist
                    //Cássio Rovaroto - SIG nº 81872 - Início
                    //  ExtractStrings([';'], [' '], pchar(oRemessaEletronica._tiramascara(sLinha)), sValorCampo);
                      ExtractStrings([';'], [' '], PChar(sLinha), sValorCampo);
                    //  sDocumento := TRIM(sValorCampo[0]); // CPF ou CNPJ
                      sDocumento:= oRemessaEletronica._TiraMascara(Trim(sValorCampo[0])); // CPF ou CNPJ
                    //  sNome := ConverteCar(UPPERCASE(TRIM(sValorCampo[1]))); // RAZAOSOCIAL
                      sNome := ConverteCar(oRemessaEletronica._TiraMascara(Trim(sValorCampo[1])));// RAZAOSOCIAL

                    //  sBanco := TRIM(sValorCampo[2]); // NUMBANCO
                      sBanco := oRemessaEletronica._TiraMascara(Trim(sValorCampo[2]));// NUMBANCO
                      sAgencia := TRIM(sValorCampo[3]); // NUMAGENCIA
                    //  sOperacao := TRIM(sValorCampo[4]); // NUMOPERACAO
                      sOperacao := oRemessaEletronica._TiraMascara(Trim(sValorCampo[4])); //NUMOPERACAO
                    //Cássio Rovaroto - SIG nº 81872 - Fim
                      If sOperacao = '0' Then
                        sOperacao := EmptyStr;

                      sConta := TRIM(sValorCampo[5]); // NUMCONTA
                      sTipoConta := TRIM(sValorCampo[6]); // TIPOCONTA
                      dValor := StringToFloat(sValorCampo[7]); // VALOR

                      If Not length(sDocumento) In [11, 14] Then
                        Begin
                          Application.MessageBox(pchar('CPF/CNPJ do ' + sNome + ' com tamanho inválido. Verifique !'), 'Atenção !', Mb_IconExclamation);
                          qryMovListaFavorecidos.EnableControls;
                          break;
                        End;

                      If (sTipoConta <> '1') And (sTipoConta <> '3') Then // (1 - Corrente / 3 - Poupança)
                        Begin
                          Application.MessageBox(pchar('Tipo da Conta do ' + sNome + ' deve ser 1 ou 3. Verifique !'), 'Atenção !', Mb_IconExclamation);
                          qryMovListaFavorecidos.EnableControls;
                          break;
                        End;

                      If (sNome <> EmptyStr) And
                        (sDocumento <> EmptyStr) And
                        (sBanco <> EmptyStr) And
                        (sAgencia <> EmptyStr) And
                        (sConta <> EmptyStr) And
                        (sTipoConta <> EmptyStr) And
                        (dValor <> 0.00) Then
                        Begin
                          qryAux.Close;
                          qryAux.SQL.Clear;
                          qryAux.SQL.add('SELECT SEQDOCXPESSOAS.NEXTVAL SEQ FROM DUAL    ');
                          qryAux.Open;

                          qryMovListaFavorecidos.Insert;
                          qryMovListaFavorecidos.fieldByname('CODDOCUMENTO').asInteger := cdsMovRemessa.fieldByname('CODDOCUMENTO').asInteger;
                          qryMovListaFavorecidos.fieldByname('IDDOCUMENTOXPESSOAS').asInteger := qryAux.fieldByname('SEQ').asInteger;
                          qryMovListaFavorecidos.FieldByName('IDFORCLI').AsString := EmptyStr;
                          qryMovListaFavorecidos.FieldByName('RAZAOSOCIAL').AsString := sNome;
                          qryMovListaFavorecidos.FieldByName('NUMDOCUMENTO').AsString := sDocumento;
                          qryMovListaFavorecidos.FieldByName('IDCBANCARIA').AsString := EmptyStr;
                          qryMovListaFavorecidos.FieldByName('NUMBANCO').AsString := sBanco;
                          qryMovListaFavorecidos.FieldByName('NUMAGENCIA').AsString := sAgencia;
                          qryMovListaFavorecidos.FieldByName('NUMOPERACAO').AsString := sOperacao;
                          qryMovListaFavorecidos.FieldByName('NUMCONTA').AsString := sConta;
                          qryMovListaFavorecidos.FieldByName('TIPOCONTA').AsString := sTipoConta;
                          qryMovListaFavorecidos.FieldByName('VALOR').AsFloat := dValor;
                          qryMovListaFavorecidos.FieldByName('FLGIMPORTADO').AsString := 'S'; // Sim
                          qryMovListaFavorecidos.Post;

                          dTotalLista := dTotalLista + dValor;
                        End;
                    End;

                  If RoundCM(dTotalLista, 2) <> 0.00 Then
                    Begin
                      If RoundCM(dTotalLista, 2) <= RoundCM(edSaldoListaFav.Value, 2) Then
                        Begin
                          qryMovListaFavorecidos.ApplyUpdates;

                          If dtmBaseDados.dbBaseDados.InTransaction Then
                            dtmBaseDados.dbBaseDados.Commit;
                        End
                      Else
                        Application.MessageBox(MSG011, 'Atenção !', Mb_IconExclamation);
                    End;
                Except
                  Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
                End;
              End;

          CloseFile(tArquivo);
          qryAux.Close;

          qryMovListaFavorecidos.Close;
          qryMovListaFavorecidos.Open;
          qryMovListaFavorecidos.EnableControls;

          cdsMovRemessaAfterScroll(cdsMovRemessa);

          Screen.Cursor := crDefault;

          freeandnil(sValorCampo);
        End
    End
  Else
    Application.MessageBox(MSG027, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.spbLocalizaFavorecClick(Sender: TObject);
Begin
  Inherited;
  If MSFavorec.Executar = MrOk Then
    If MSFavorec.ValoresChave[0] <> EmptyStr Then
      Begin
        qryMovListaFavorecidos.fieldByname('IDFORCLI').asString := MSFavorec.ValoresChave[0]; // IDPESSOA
        qryMovListaFavorecidos.fieldByname('NUMDOCUMENTO').asString := MSFavorec.ValoresChave[1]; // NUMDOCUMENTO
        qryMovListaFavorecidos.fieldByname('RAZAOSOCIAL').asString := MSFavorec.ValoresChave[2]; // RAZAOSOCIAL

        Cursor := crSQLWait;
        // Localizando os Dados Bancários
        qryContaBancaria.Close;
        qryContaBancaria.Prepare;
        qryContaBancaria.ParamByName('IDPESSOA').asString := MSFavorec.ValoresChave[0]; // IDPESSOA
        qryContaBancaria.Open;
        If Not qryContaBancaria.isEmpty Then
          Begin
            qryMovListaFavorecidos.FieldByName('IDCBANCARIA').asInteger := qryContaBancaria.fieldByname('IDCBANCARIA').asInteger;
            qryMovListaFavorecidos.FieldByName('NUMBANCO').AsString := qryContaBancaria.fieldByname('NUMBANCO').AsString;
            qryMovListaFavorecidos.FieldByName('NUMAGENCIA').AsString := qryContaBancaria.fieldByname('NUMAGENCIA').AsString;
            qryMovListaFavorecidos.FieldByName('NUMCONTA').AsString := qryContaBancaria.fieldByname('NUMCONTA').AsString;
            qryMovListaFavorecidos.FieldByName('TIPOCONTA').AsString := qryContaBancaria.fieldByname('TIPOCONTA').AsString;
          End
        Else
          Begin
            qryMovListaFavorecidos.FieldByName('IDCBANCARIA').Clear;
            qryMovListaFavorecidos.FieldByName('NUMBANCO').Clear;
            qryMovListaFavorecidos.FieldByName('NUMAGENCIA').Clear;
            qryMovListaFavorecidos.FieldByName('NUMCONTA').Clear;
            qryMovListaFavorecidos.FieldByName('TIPOCONTA').Clear;
          End;
        qryContaBancaria.Close;
        Screen.Cursor := crDefault;

        dbeValorPagtoLista.setfocus;
      End;
End;

Procedure TFrmRemessaEletronica.spbLimparMovListaClick(Sender: TObject);
Begin
  Inherited;
  If qryMovListaFavorecidos.Locate('FLGIMPORTADO', 'S', []) Then
    Begin
      If Application.MessageBox(MSG005, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            Cursor := crSQLWait;
            qryMovListaFavorecidos.DisableControls;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.add('DELETE FROM DOCUMENTOXPESSOAS    ');
            qryAux.SQL.add('WHERE CODDOCUMENTO = ' + cdsMovRemessa.fieldByname('CODDOCUMENTO').asString);
            qryAux.SQL.add('      AND FLGIMPORTADO = ''S''   ');
            qryAux.ExecSQL;

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            qryMovListaFavorecidos.Close;
            qryMovListaFavorecidos.Open;
            qryMovListaFavorecidos.EnableControls;
            cdsMovRemessaAfterScroll(cdsMovRemessa);
            Cursor := crDefault;

            Application.MessageBox(MSG025, 'Atenção !', Mb_IconExclamation);
          Except
            Raise
          End;
        End;
    End
  Else
    Application.MessageBox(MSG024, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.dbgMovListaFavDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If Not qryMovListaFavorecidos.isEmpty Then
    Begin
      If qryMovListaFavorecidos.fieldbyname('FLGIMPORTADO').asString = 'S' Then
        dbgMovListaFav.Canvas.Font.Color := clBlue;

      dbgMovListaFav.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

// **************** FIM ROTINAS DO MOVIMENTO DAS LISTAS DE FAVORECIDOS

Procedure TFrmRemessaEletronica.pcAnaliseRemessaChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
  Inherited;
  AllowChange := (Not cdsMovRemessa.isEmpty) And
    (qryDocumento.State = dsBrowse) And
    (qryMovListaFavorecidos.State = dsBrowse) And
    (qryMovTitulos.State = dsBrowse);
End;

Procedure TFrmRemessaEletronica.pcDetalManutChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
  Inherited;
  AllowChange := ((qryDocumento.State = dsBrowse) And
    (qryMovListaFavorecidos.State = dsBrowse) And
    (qryMovTitulos.State = dsBrowse));
End;

Procedure TFrmRemessaEletronica.pcGeralRemessaChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
  Inherited;
  AllowChange := (qryDocumento.State = dsBrowse) And
    (qryMovListaFavorecidos.State = dsBrowse) And
    (qryMovTitulos.State = dsBrowse);
End;

Procedure TFrmRemessaEletronica.spbPrepararEnvioClick(Sender: TObject);
var sMsg, sListaDeDocumentos, sListaDeCodGrupoCNAB: String;
    iNSA: Integer;
begin
  Inherited;
  sMsg := EmptyStr;
  iNSA := -1; //Cássio Rovaroto - SIG nº 75187
  if cdsMovRemessa.Locate('MARCADO', 'S', []) then // Sim
  begin
   // Filtrando a Grid para verificar a existência de lançamentos com mensagem de erro
   Screen.Cursor := crSQLWait;
   cdsMovRemessa.Filtered := False;
   cdsMovRemessa.Filter := 'MARCADO = ''S'' AND TRIM(MSGERRO) <> '''' ';
   cdsMovRemessa.Filtered := True;
   Screen.Cursor := crDefault;
   if cdsMovRemessa.isEmpty then
   begin
    cdsMovRemessa.Filtered := False;
    // Filtro para caso haja pelo um 'N', então filtra, caso contrário todos estão marcados
    if cdsMovRemessa.Locate('MARCADO', 'N', []) then // Não
    begin
      // Filtrando a Grid somente para mostrar e processar os marcados
      Screen.Cursor := crSQLWait;
      cdsMovRemessa.Filtered := False;
      cdsMovRemessa.Filter := 'MARCADO = ''S'' '; // Sim
      cdsMovRemessa.Filtered := True;
      _TotalizaColunaGridMovRemessa('VALOR');
      cdsMovRemessa.First;
      Screen.Cursor := crDefault;
    end;

    sMsg := 'Confirma Preparo do Envio ?';
    if (bAnaliseFeita = False) and (iIdModuloAcesso = 3) then
      sMsg := 'Não foi realizado o Processo de Análise do Movimento. ' + #13 + #13 +
              'Confirma Preparo do Envio assim mesmo ?';

    if Application.MessageBox(pchar(sMsg), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      try
        Screen.Cursor := crSQLWait;
        if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

        cdsMovRemessa.DisableControls;
        cdsMovRemessa.First;
        frmProgresso.MostraFormProgresso('Aguarde ! Gerando Movimento de Envio.', True, False, True, 0, cdsMovRemessa.RecordCount);

        // Preparando uma lista contendo todos os CODDOCUMENTOS, que será
        // usada na cláusula IN do SELECT do INSERT principal abaixo
        iContador := 0;
        tsListaDeDocumentos.Clear;

        cdsMovRemessa.First;
        while not cdsMovRemessa.Eof do
        begin
          if cdsMovRemessa.FieldByName('CODDOCUMENTO').AsInteger <> -1 then //Everson Cunha - SIG117206
            tsListaDeDocumentos.Add(cdsMovRemessa.FieldByName('CODDOCUMENTO').asString);

          cdsMovRemessa.Next;
          oRemessaEletronica._AtualizaFrmProgresso(iContador);
        end;
        cdsMovRemessa.First;
        sListaDeDocumentos := oRemessaEletronica._ConverteListas(tsListaDeDocumentos);

        //Everson Cunha - SIG117206 - Ini
        // Preparando uma lista contendo todos os CODGRUPOCNAB, que será
        // usada na cláusula IN do SELECT do INSERT principal abaixo
        iContador := 0;
        tsListaDeCodGrupoCNAB.Clear;

        while not cdsMovRemessa.Eof do
        begin
          if cdsMovRemessa.FieldByName('CODDOCUMENTO').AsInteger = -1 then
            tsListaDeCodGrupoCNAB.Add(cdsMovRemessa.FieldByName('CODGRUPOCNAB').asString);

          cdsMovRemessa.Next;
          oRemessaEletronica._AtualizaFrmProgresso(iContador);
        end;

        cdsMovRemessa.First;
        sListaDeCodGrupoCNAB := oRemessaEletronica._ConverteListas(tsListaDeCodGrupoCNAB);

        if trim(sListaDeDocumentos) = '' then
          sListaDeDocumentos := '-1';

        if trim(sListaDeCodGrupoCNAB) = '' then
          sListaDeCodGrupoCNAB := '-1';
        //Everson Cunha - SIG117206 - Fim

        //Cássio Rovaroto SIG nº 75187 - Início
        // Obtendo o NSA - Número Sequencial do Arquivo
        qryAux.Close;
        qryAux.SQL.Clear;
        //qryAux.SQL.add('SELECT SEQNSAARQPAG.NEXTVAL SEQ FROM DUAL    ');
        qryAux.SQL.add('SELECT SEQ_NSA_SIACC_' + cdsConvenio.FieldByName('NUMEMPRESABANCO').asString + '.NEXTVAL SEQ FROM DUAL    ');
        qryAux.Open;
        //Cássio Rovaroto - SIG nº 73883 - Fim
        iNSA := qryAux.FieldByName('SEQ').AsInteger;
        
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.add('SELECT SEQARQUIVOPAGTO.NEXTVAL SEQ FROM DUAL                                    ');
        qryAux.Open;

        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.add('INSERT INTO ARQUIVOPAGTO (IDARQUIVOPAGTO, VLRTOTAL, FLGENVIADO, CODPORTFORMA, NSA) ');
        qryAux2.SQL.add('VALUES (:p1, :p2, :p3, :p4, :p5)                                               ');//Cássio Rovaroto - SIG nº 75187
        qryAux2.ParamByName('p1').asInteger := qryAux.fieldByname('SEQ').asInteger;
        qryAux2.ParamByName('p2').asFloat := _TotalizaColunaGridMovRemessa('VALOR');
        qryAux2.ParamByName('p3').asString := 'N'; // FLGENVIADO = Não
        qryAux2.ParamByName('p4').asString := cdsMovRemessa.fieldByname('CODPORTFORMA').asString;
        qryAux2.ParamByName('p5').AsInteger := iNSA; //Cássio Rovaroto - SIG nº 75187
        qryAux2.ExecSQL;

        qryAux2.Close;
        qryAux2.SQL.Clear;
        //Cássio Rovaroto - SIG 63651 - Início
        //qryAux2.SQL.add('INSERT INTO ARQUIVOXDOCUM (IDARQUIVOPAGTO, CODDOCARQ, ID_DOC_CODBARRAS_PESSOAS, CODFORMA, VALOR, TIPO) ');
        qryAux2.SQL.add('INSERT INTO ARQUIVOXDOCUM (IDARQUIVOPAGTO, CODDOCARQ, ID_DOC_CODBARRAS_PESSOAS, CODFORMA, VALOR, TIPO, DATAVENCTO) ');
        //Cássio Rovaroto - SIG 63651 - Fim
        qryAux2.SQL.add('SELECT :pIDARQUIVOPAGTO,                                                                                  ');
        //Cássio Rovaroto - SIG nº 74164 - Início
        //qryAux2.SQL.add('       SEQCODDOCARQ.NEXTVAL,                                                                              ');
        qryAux2.SQL.add('       ROWNUM,                                                                                            ');
        //Cássio Rovaroto - SIG nº 74164 - Fim
        qryAux2.SQL.add('       ID,                                                                                                ');
        qryAux2.SQL.add('       CODFORMA,                                                                                          ');
        qryAux2.SQL.add('       VALOR,                                                                                             ');
        qryAux2.SQL.add('       TIPO                                                                                               ');
        qryAux2.SQL.add('       , DATAVENCTO                                                                                       '); //Cássio Rovaroto - SIG nº 63651
        qryAux2.SQL.add('FROM(                                                                                                     ');
        qryAux2.SQL.add('/* SEM LISTA DE PESSOAS E SEM LISTA DE TÍTULOS E SEM AP AGRUPADA */                                                         ');
        qryAux2.SQL.add('SELECT D.CODDOCUMENTO ID,                                                                                 ');
        qryAux2.SQL.add('       D.CODFORMA,                                                                                        ');
        qryAux2.SQL.add('       (SELECT SUM(DECODE(LANC.DEBCRE, ''D'',                                                             ');
        qryAux2.SQL.add('               DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1),                                    ');
        qryAux2.SQL.add('               DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR                          ');
        qryAux2.SQL.add('        FROM LANCTODOCUM LANC                                                                             ');
        qryAux2.SQL.add('        JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO                                        ');
        qryAux2.SQL.add('        WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO) VALOR,                                                  ');
        qryAux2.SQL.add('       1 TIPO,                                                                                            ');
        qryAux2.SQL.add('       D.CODDOCUMENTO                                                                                     ');
        qryAux2.SQL.add('       , D.DATAVENCTO                                                                                     '); //Cássio Rovaroto - SIG nº 63651
        qryAux2.SQL.add('FROM DOCUMENTO D                                                                                          ');
        qryAux2.SQL.add('WHERE NOT EXISTS(SELECT 1 FROM DOCUMENTOXCODBARRAS DX WHERE DX.CODDOCUMENTO = D.CODDOCUMENTO)             ');
        qryAux2.SQL.add('  AND NOT EXISTS(SELECT 1 FROM DOCUMENTOXPESSOAS DP WHERE DP.CODDOCUMENTO = D.CODDOCUMENTO)               ');
        qryAux2.SQL.Add('  AND ' + oCtrlFuncoesCapCar.QuebrarListaFiltro(1, '(D.CODDOCUMENTO  ', sListaDeDocumentos, 500));   //Everson Cunha - SIG117206
        qryAux2.SQL.add('UNION ALL                                                                                                 ');
        qryAux2.SQL.add('/* LISTA DE PESSOAS */                                                                                    ');
        qryAux2.SQL.add('SELECT DP.IDDOCUMENTOXPESSOAS ID,                                                                         ');
        qryAux2.SQL.add('       D.CODFORMA,                                                                                        ');
        qryAux2.SQL.add('       DP.VALOR,                                                                                          ');
        qryAux2.SQL.add('       2 TIPO,                                                                                            ');
        qryAux2.SQL.add('       D.CODDOCUMENTO                                                                                     ');
        qryAux2.SQL.add('       , D.DATAVENCTO                                                                                     '); //Cássio Rovaroto - SIG nº 63651
        qryAux2.SQL.add('FROM DOCUMENTOXPESSOAS DP                                                                                 ');
        qryAux2.SQL.add('JOIN DOCUMENTO D ON D.CODDOCUMENTO = DP.CODDOCUMENTO                                                      ');
        //Cássio Rovaroto - SIG nº 60540 - Início
        qryAux2.SQL.add('WHERE NOT EXISTS (SELECT 1                                                                                ');
        qryAux2.SQL.add('                    FROM ARQUIVOPAGTO AP                                                                  ');
        qryAux2.SQL.add('                    JOIN ARQUIVOXDOCUM AD ON AD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO AND AD.TIPO = ''2''    '); //Cássio Rovaroto - SIG nº 131339
        qryAux2.SQL.add('                   WHERE AP.FLGENVIADO IN (''C'', ''F'', ''E'')                                           ');
        qryAux2.SQL.add('                     AND AD.ID_DOC_CODBARRAS_PESSOAS = DP.IDDOCUMENTOXPESSOAS)                            ');
        qryAux2.SQL.Add('  AND ' + oCtrlFuncoesCapCar.QuebrarListaFiltro(1, '(D.CODDOCUMENTO  ', sListaDeDocumentos, 500));   //Everson Cunha - SIG117206
        //Cássio Rovaroto - SIG nº 60540 - Fim
        qryAux2.SQL.add('UNION ALL                                                                                                 ');
        qryAux2.SQL.add('/* LISTA DE TÍTULOS */                                                                                    ');
        qryAux2.SQL.add('SELECT DC.IDDOCUMENTOXCODBARRAS ID,                                                                       ');
        qryAux2.SQL.add('       D.CODFORMA,                                                                                        ');
        qryAux2.SQL.add('       DC.VLRPAGTO,                                                                                       ');
        qryAux2.SQL.add('       3 TIPO,                                                                                            ');
        qryAux2.SQL.add('       D.CODDOCUMENTO                                                                                     ');
        qryAux2.SQL.add('       , D.DATAVENCTO                                                                                     '); //Cássio Rovaroto - SIG nº 63651
        qryAux2.SQL.add('FROM DOCUMENTOXCODBARRAS DC                                                                               ');
        qryAux2.SQL.add('JOIN DOCUMENTO D ON D.CODDOCUMENTO = DC.CODDOCUMENTO                                                      ');
        //Cássio Rovaroto - SIG nº 60540 - Início
        qryAux2.SQL.add('WHERE NOT EXISTS (SELECT 1                                                                                ');
        qryAux2.SQL.add('                    FROM ARQUIVOPAGTO AP                                                                  ');
        qryAux2.SQL.add('                    JOIN ARQUIVOXDOCUM AD ON AD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO AND AD.TIPO = ''3''    '); //Cássio Rovaroto - SIG nº 131339
        qryAux2.SQL.add('                   WHERE AP.FLGENVIADO IN (''C'', ''F'', ''E'')                                           ');
        qryAux2.SQL.add('                     AND AD.ID_DOC_CODBARRAS_PESSOAS = DC.IDDOCUMENTOXCODBARRAS)                          ');
        qryAux2.SQL.Add('  AND ' + oCtrlFuncoesCapCar.QuebrarListaFiltro(1, '(D.CODDOCUMENTO  ', sListaDeDocumentos, 500));   //Everson Cunha - SIG117206
        //Cássio Rovaroto - SIG nº 60540 - Fim
        //Everson Cunha - SIG117206 - Ini
        qryAux2.SQL.add('UNION ALL');
        qryAux2.SQL.add('/* AP AGRUPADA */ ');
        qryAux2.SQL.add('SELECT D.CODGRUPOCNAB ID, ');
        qryAux2.SQL.add('       D.CODFORMA, ');
        qryAux2.SQL.add('       SUM((SELECT SUM(DECODE(LANC.DEBCRE, ''D'', ');
        qryAux2.SQL.add('                   DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1), ');
        qryAux2.SQL.add('                   DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR ');
        qryAux2.SQL.add('              FROM LANCTODOCUM LANC ');
        qryAux2.SQL.add('              JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ');
        qryAux2.SQL.add('             WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO)) VALOR, ');
        qryAux2.SQL.add('       4 TIPO, ');
        qryAux2.SQL.add('       -1 CODDOCUMENTO, ');
        qryAux2.SQL.add('       D.DATAVENCTO ');
        qryAux2.SQL.add('  FROM DOCUMENTO D ');
        qryAux2.SQL.add(' WHERE NOT EXISTS(SELECT 1 FROM DOCUMENTOXCODBARRAS DX WHERE DX.CODDOCUMENTO = D.CODDOCUMENTO) ');
        qryAux2.SQL.add('   AND NOT EXISTS(SELECT 1 FROM DOCUMENTOXPESSOAS DP WHERE DP.CODDOCUMENTO = D.CODDOCUMENTO) ');
        qryAux2.SQL.Add('   AND ' + oCtrlFuncoesCapCar.QuebrarListaFiltro(1, '(D.CODGRUPOCNAB  ', sListaDeCodGrupoCNAB, 500));   //Everson Cunha - SIG117206
        qryAux2.SQL.add(' GROUP BY D.CODGRUPOCNAB, D.CODFORMA, D.DATAVENCTO ');
        //Everson Cunha - SIG117206 - Fim

        qryAux2.SQL.add('ORDER BY TIPO, CODDOCUMENTO, VALOR)                                                                       ');
        //Cássio Rovaroto -  SIG nº 74164 - Início
        //qryAux2.SQL.add('WHERE ' + oCtrlFuncoesRH.QuebrarListaFiltro(1, '(CODDOCUMENTO  ', sListaDeDocumentos, 500));
        //qryAux2.SQL.Add('WHERE ' + oCtrlFuncoesCapCar.QuebrarListaFiltro(1, '(CODDOCUMENTO  ', sListaDeDocumentos, 500)); //Everson Cunha - SIG117206
        //Cássio Rovaroto -  SIG nº 74164 - Fim
        qryAux2.ParamByName('pIDARQUIVOPAGTO').asInteger := qryAux.fieldByname('SEQ').asInteger; // IDARQUIVOPAGTO
        qryAux2.SQL.SaveToFile(sPathArquivosLog + '\SQL_InseriNoArquivoXDocum.txt');
        qryAux2.ExecSQL;

        //Cássio Rovaroto - SIG nº 74061 - Início
        if iIdModuloAcesso = 3 then
        begin
          if (trim(sListaDeDocumentos) <> '-1') and (trim(sListaDeDocumentos) <> '') then
          begin
            qryAux1.Close;
            qryAux1.SQL.Clear;
            qryAux1.SQL.add('UPDATE DOCUMENTO     ');
            qryAux1.SQL.add('SET STATUS = ''1''   '); // Documento não pode ser alterado
            //Cássio Rovaroto -  SIG nº 74164 - Início
            //qryAux1.SQL.add('WHERE ' + oCtrlFuncoesRH.QuebrarListaFiltro(1, '(CODDOCUMENTO  ', sListaDeDocumentos, 500));
            qryAux1.SQL.Add('WHERE ' + oCtrlFuncoesCapCar.QuebrarListaFiltro(1, '(CODDOCUMENTO  ', sListaDeDocumentos, 500));
            //Cássio Rovaroto -  SIG nº 74164 - Fim
            qryAux1.ExecSQL;
          end;

          //Everson Cunha - SIG117206 - Ini
          if (trim(sListaDeCodGrupoCNAB) <> '-1') and (trim(sListaDeCodGrupoCNAB) <> '') then
          begin
            qryAux1.Close;
            qryAux1.SQL.Clear;
            qryAux1.SQL.add('UPDATE DOCUMENTO     ');
            qryAux1.SQL.add('SET STATUS = ''1''   '); // Documento não pode ser alterado
            qryAux1.SQL.Add('WHERE ' + oCtrlFuncoesCapCar.QuebrarListaFiltro(1, '(CODGRUPOCNAB  ', sListaDeCodGrupoCNAB, 500));
            qryAux1.ExecSQL;
          end;
          //Everson Cunha - SIG117206 - Fim
        end;

        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

        //Cássio Rovaroto - SIG nº 64071
        //Registro da tarifas bancárias para o arquivo
        frmProgresso.EscondeFormProgresso;

        Application.MessageBox(pchar('Preparo do Arquivo Nº ' + qryAux.fieldByname('SEQ').asString + ' realizado com sucesso !'), 'Atenção !', Mb_IconExclamation);
        cdsMovRemessa.Filtered := False;

        cdsMovRemessa.data := oRemessaEletronica._SelecionaMovimentoRemessa(dblkpConvenio.LookupValue,
                                                                            dblkpFormaPagto.LookupValue,
                                                                            dbDataProgIni.Date,
                                                                            dbDataProgFim.Date,
                                                                            iIdModuloAcesso);

        dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
        cdsMovRemessa.AfterScroll := cdsMovRemessaAfterScroll;
        cdsMovRemessaAfterScroll(cdsMovRemessa);
        qryAux.Close;
        cdsMovRemessa.EnableControls;
        Screen.Cursor := crDefault;
        tbsAnaliseManutencoes.Highlighted := ((Not cdsMovRemessa.IsEmpty) And ((Not qryMovListaFavorecidos.IsEmpty) Or (Not qryMovTitulos.IsEmpty)));

      except
        on e: Exception do
        begin
          if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.RollBack;

            cdsMovRemessa.Filtered := False;
            frmProgresso.EscondeFormProgresso;
            dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
            Screen.Cursor := crDefault;
            Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
        end;
      end;
    end
    else
    begin
      cdsMovRemessa.Filtered := False;
      dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
      cdsMovRemessa.First;
    end;
   end
   else
   begin
    Application.MessageBox('Existem Lançamentos Analisados que não foram Tratados. Verifique !', 'Atenção !', Mb_IconExclamation);
    cdsMovRemessa.Filtered := False;
   end;
  end
  else
  begin
    Application.MessageBox(MSG012, 'Atenção !', Mb_IconExclamation);
    cdsMovRemessa.first;
  end;
end;

Procedure TFrmRemessaEletronica.spbDesfazerPrepClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqPendente.isEmpty Then
    Begin
      If cdsMovArqPendente.fieldbyname('STATUS').asString <> 'Baixado' Then
        Begin
          If Application.MessageBox(pchar('Desfazer Preparo do Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
            Begin
              Try
                If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                Cursor := crSQLWait;
                cdsMovArqPendente.DisableControls;

                if iIdModuloAcesso = 3 then
                begin
                  qryAux1.Close;
                  qryAux1.SQL.Clear;
                  qryAux1.SQL.add('UPDATE DOCUMENTO      ');
                  qryAux1.SQL.add('SET STATUS = ''0''    '); // Documento pode ser alterado
                  qryAux1.SQL.add('WHERE STATUS <> ''2'' '); // Documento não Baixado
                  qryAux1.SQL.add('      AND CODDOCUMENTO IN (SELECT DISTINCT DECODE(AX.TIPO, 1, AX.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DX.CODDOCUMENTO) CODDOCUMENTO  ');
                  qryAux1.SQL.add('                           FROM ARQUIVOXDOCUM  AX                                                                                                ');
                  qryAux1.SQL.add('                           LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2                ');
                  qryAux1.SQL.add('                           LEFT JOIN DOCUMENTOXCODBARRAS DX ON DX.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3            ');
                  qryAux1.SQL.add('                           WHERE AX.IDARQUIVOPAGTO = ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ')');
                  qryAux1.ExecSQL;

                  //Everson Cunha - SIG117206 - Ini
                  qryAux1.Close;
                  qryAux1.SQL.Clear;
                  qryAux1.SQL.add('UPDATE DOCUMENTO      ');
                  qryAux1.SQL.add('   SET STATUS = ''0''    '); // Documento pode ser alterado
                  qryAux1.SQL.add(' WHERE STATUS <> ''2'' ');   // Documento não Baixado
                  qryAux1.SQL.add('   AND CODGRUPOCNAB IN (SELECT AX.ID_DOC_CODBARRAS_PESSOAS CODGRUPOCNAB ');
                  qryAux1.SQL.add('                          FROM ARQUIVOXDOCUM  AX ');
                  qryAux1.SQL.add('                         WHERE AX.TIPO = 4 '); //CODGRUPOCNAB
                  qryAux1.SQL.add('                           AND AX.IDARQUIVOPAGTO = ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ')');
                  qryAux1.ExecSQL;
                  //Everson Cunha - SIG117206 - Fim
                end;

                //Cássio Rovaroto - SIG nº 101753 - Início
                //Cássio Rovaroto - SIG nº 64071
                //Excluir registros na tabela DOCUMENTOXPESSOAS associados ao arquivo
                //qryAux2.Close;
                //qryAux2.SQL.Clear;
                //qryAux2.SQL.Add('DELETE FROM DOCUMENTOXPESSOAS ');
                //qryAux2.SQL.Add(' WHERE IDDOCUMENTOXPESSOAS IN (SELECT ID_DOC_CODBARRAS_PESSOAS');
                //qryAux2.SQL.Add('                                 FROM ARQUIVOXDOCUM AD');
                //qryAux2.SQL.Add('                                WHERE AD.IDARQUIVOPAGTO = ' + cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').asString + ')');
                //qryAux2.ExecSQL;

                //Cássio Rovaroto - SIG nº 64071
                //Exclui registros das tarifas bancárias associadas.
                //qryAux3.Close;
                //qryAux3.SQL.Clear;
                //qryAux3.SQL.Add('DELETE FROM TARIFAARQPAGTO ' );
                //qryAux3.SQL.Add(' WHERE IDARQUIVOPAGTO = ' + cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').AsString);
                //qryAux3.ExecSQL;
                //Cássio Rovaroto - SIG nº 101753 - Fim
                
                // Neste ponto haverá a exclusão dos registros filhos da ARQUIVOXDOCUM,
                // através da cláusula ON DELETE CASCADE da tabela Pai (ARQUIVOPAGTO).
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('DELETE FROM ARQUIVOPAGTO    ');
                qryAux.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString);
                qryAux.SQL.add('      AND FLGENVIADO = ''N'' ');
                qryAux.ExecSQL;

                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                Application.MessageBox(pchar('Preparo do Arquivo Nº ' + cdsMovArqPendente.fieldbyname('IDARQUIVOPAGTO').asString + ' desfeito com Sucesso !'), 'Atenção !', Mb_IconExclamation);

                cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'N');

                qryMovArqPendDet.Close;
                qryMovArqPendDet.Open;
                cdsMovArqPendente.EnableControls;
                Cursor := crDefault;
              Except
                Raise
              End;
            End
        End
      Else
        Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.dbgMovRemessaFieldChanged(Sender: TObject; Field: TField);
Var RegAtual1: TBookMark;
Begin
  Inherited;
  RegAtual1 := cdsMovRemessa.GetBookmark; // Salvando o ponteiro do Registro atual
  dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
  If RegAtual1 <> Nil Then
    cdsMovRemessa.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
End;

Procedure TFrmRemessaEletronica.qryDocumentoAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  If Not qryDocumento.isEmpty Then
    Begin
      If Length(Trim(qryDocumentoNUMLEITCODBARRAS.asString)) = 47 Then
        Begin
          qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; ';
          rdgTipoTituloGeral.ItemIndex := 0; // Ficha de Compensação
          edDtVenctoGeral.Text := datetostr(oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(qryDocumentoNUMLEITCODBARRAS.asString));
          edValorGeral.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(qryDocumentoNUMLEITCODBARRAS.asString);
          //edilaine SIG112509 : inicio
          if edValorGeral.value = 0 then
             edValorGeral.value := cdsMovRemessa.fieldbyname('VALOR').asFloat;
          //edilaine SIG112509 : fim
        End
      Else If Length(Trim(qryDocumentoNUMLEITCODBARRAS.asString)) = 48 Then
        Begin
          qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; '; // Tamanho 48
          rdgTipoTituloGeral.ItemIndex := 1; // Arrecadação
          edDtVenctoGeral.Text := cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asString;
          edValorGeral.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(qryDocumentoNUMLEITCODBARRAS.asString);
        End
      Else
        Begin
          qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := EmptyStr;
          rdgTipoTituloGeral.ItemIndex := -1;
          edDtVenctoGeral.Text := EmptyStr;
          edValorGeral.value := 0.00;
        End;

      //Everson Cunha - SIG84050 - Início
      mkeMesAnoComp.Text := qryINSS.fieldbyname('COMPETENCIA').AsString;
      edtRazaoSocialGPS.Text := qryINSS.fieldbyname('RAZAOSOCIAL').AsString;
      edtNumDocumentoGPS.Text := qryINSS.fieldbyname('NUMDOCUMENTO').AsString;
      HabilitaDesabilitaCampos;
      //Everson Cunha - SIG84050 - Fim
    End;
End;

Procedure TFrmRemessaEletronica.SpeedButton5Click(Sender: TObject);
Begin
  Inherited;
  With DtmDadosBancarios Do
    Begin
      SetaFiltroMs(qryDocumento.FieldByName('IDFORCLI').AsFloat);
      If MsContaCor.Executar = MrOk Then
        Begin
          If MsContaCor.ValoresChave[0] <> EmptyStr Then
            Begin
              If MsContaCor.ValoresChave[4] <> '0' Then // Se for Conta Corrente, salário ou Poupança (1 ou 2 ou 3)
                Begin
                  qryDocumento.FieldByName('IDCBANCARIA').AsFloat := StrToFloat(MsContaCor.ValoresChave[0]);
                  qryCtaBancariaGeral.Close;
                  qryCtaBancariaGeral.Open
                End
              Else
                Application.MessageBox(pchar('Tipo da Conta não definida no Cadastro deste Favorecido. Verifique !'), 'Atenção !', Mb_IconExclamation);
            End;
        End;
    End;
End;

Procedure TFrmRemessaEletronica.btnAltGeralClick(Sender: TObject);
Begin
  Inherited;
  If Not qryDocumento.isEmpty Then
    Begin
      btnAltGeral.down := True;
      pnlInfMan.Enabled := False;
      pnlCritSel.Enabled := False;
      If qryDocumento.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosMovGeral.enabled := True;
            btnConGeral.Enabled := True;
            btnCanGeral.Enabled := True;

            DbeCodigoBarrasGeral.enabled := (rdgTipoTituloGeral.itemindex > -1);

            qryDocumento.Edit;

            //Cássio Rovaroto - SIG nº 100343 - Início
            //Everson Cunha - SIG84050 - Início
            //if cdsMovRemessa.FieldByName('IDMODULO').AsInteger <> 24 then
            //begin

            //Cássio Rovaroto - SIG nº 100662 - Início
            if (cdsMovRemessa.FieldByName('CODFORMA').AsInteger in [28, 129, 130]) then
            //  and (cdsMovRemessa.FieldByName('FLGPAGTOAUTONOMO').AsInteger <> 1) then
            //Cássio Rovaroto - SIG nº 100970 - Início
            if (qryINSS.IsEmpty)  then
            begin
              qryINSS.Insert;
              if (cdsMovRemessa.FieldByName('FLGPAGTOAUTONOMO').AsInteger = 1) then
                  _getRazaoSocialGPSAutonomo;  // Insere RAZAOSOCIAL e NUMDOCUMENTO
              qryINSS.FieldByName('VLRINSS').AsFloat := 0;
              qryINSS.FieldByName('VLRMULTA').AsFloat := 0;
              qryINSS.FieldByName('VLROUTRAS_ENTIDADES').AsFloat := 0;
              qryINSS.FieldByName('VLRTOTAL').AsFloat := 0;
            end
            else //Cássio Rovaroto - SIG nº 100970 - Fim
             qryINSS.Edit;
            //Cássio Rovaroto - SIG nº 100662 - Fim

            if cdsMovRemessa.FieldByName('CODFORMA').AsInteger in [26, 60, 61, 62, 64, 77, 78, 79, 80, 82, 83, 100, 103, 104, 105, 112, 131, 133] then
              qryDARF.Edit;
            //end;
            dValorINSS := qryINSS.FieldByName('VLRINSS').AsFloat;
            dValorATM := qryINSS.FieldByName('VLRMULTA').AsFloat;
            dValorEntidadesINSS := qryINSS.FieldByName('VLROUTRAS_ENTIDADES').AsFloat;
            dValorTotalINSS := (dValorINSS + dValorATM + dValorEntidadesINSS);

            dValorDARF := qryDARF.FieldByName('VLRIRRF').AsFloat;
            dValorMultaDARF := qryDARF.FieldByName('VLRMULTA').AsFloat;
            dValorJurosDARF := qryDARF.FieldByName('VLRJUROS').AsFloat;
            dValorTotalDARF := (dValorDARF + dValorMultaDARF + dValorJurosDARF);
            //Cássio Rovaroto - SIG nº 100343 - Fim
            HabilitaDesabilitaCampos;
            //Everson Cunha - SIG84050 - Fim

            DbeCodigoBarrasGeral.enabled := (rdgTipoTituloGeral.itemindex > -1) and (not edValorGeral.readOnly);  //edilaine SIG112509

            DblCodForma.setfocus;
          Except
            btnCanGeralClick(Self);
            Raise;
          End;
        End
      Else
        Begin
          btnAltGeral.Down := False;
          pnlInfMan.Enabled := True;
          pnlCritSel.Enabled := True;
        End;
    End;
End;

Procedure TFrmRemessaEletronica.btnConGeralClick(Sender: TObject);
Var sCodDocum: String;
var fTotalGPS, fTotalDARF: Double;
Begin
  Inherited;
  If Trim(DbeCodigoBarrasGeral.Text) <> EmptyStr Then
  Begin

    //Everson Cunha - SIG88640 - Início
    //if oRemessaEletronica._ExisteCodBarras(trim(DbeCodigoBarrasGeral.Text)) then //Everson Cunha - SIG99642
    if oRemessaEletronica._ExisteCodBarras(cdsMovRemessa.fieldByname('CODDOCUMENTO').AsString, trim(DbeCodigoBarrasGeral.Text)) then //Everson Cunha - SIG99642
    begin
      Application.MessageBox(MSG036, 'Atenção !', Mb_IconExclamation);

      if DbeCodigoBarrasGeral.CanFocus then
      begin
        DbeCodigoBarrasGeral.SetFocus;
        DbeCodigoBarrasGeral.SelectAll;
      end;

      Exit;
    end;
    //Everson Cunha - SIG88640 - Fim

    If rdgTipoTituloGeral.Itemindex = 0 Then // Ficha de Compensação
    Begin
      If Length(DbeCodigoBarrasGeral.Text) <> 47 Then
      Begin
        Application.MessageBox(MSG013, 'Atenção !', Mb_IconExclamation);
        DbeCodigoBarrasGeral.setfocus;
        DbeCodigoBarrasGeral.SelectAll;
        Exit;
      End;

      If Not oRemessaEletronica._ValidaCodBarrasFichaComp(DbeCodigoBarrasGeral.Text, 10) Then
      Begin
        Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
        DbeCodigoBarrasGeral.setfocus;
        DbeCodigoBarrasGeral.SelectAll;
        Exit;
      End;
      //SIG88580 - início
      //If RoundCM(edValorGeral.Value,2) <> RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat,2) Then    // Paulo Nobre - WO28166
      If (floattostr(edValorGeral.value) <> cdsMovRemessa.fieldbyname('VALOR').asString) then  // Paulo Nobre - WO32908
      Begin
        Application.MessageBox(MSG035, 'Atenção !', Mb_IconExclamation);
        DbeCodigoBarrasGeral.setfocus;
        DbeCodigoBarrasGeral.SelectAll;
        Exit;
      End;
      //SIG88580 - fim
    End
    Else // Arrecadação
    Begin
      If (copy(DbeCodigoBarrasGeral.Text, 2, 1) = '9') And // Segmento - Exclusivo do Banco
      (copy(DbeCodigoBarrasGeral.Text, 17, 4) <> '0104') Then // <> do Banco Caixa
      Begin
        Application.MessageBox(MSG030, 'Atenção !', Mb_IconExclamation);
        DbeCodigoBarrasGeral.setfocus;
        DbeCodigoBarrasGeral.SelectAll;
        Exit;
      End;

      If Length(DbeCodigoBarrasGeral.Text) <> 48 Then
      Begin
        Application.MessageBox(MSG014, 'Atenção !', Mb_IconExclamation);
        DbeCodigoBarrasGeral.setfocus;
        DbeCodigoBarrasGeral.SelectAll;
        Exit;
      End;

      If Not oRemessaEletronica._ValidaCodBarrasArrecadacao(DbeCodigoBarrasGeral.Text) Then
      Begin
        Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
        DbeCodigoBarrasGeral.setfocus;
        DbeCodigoBarrasGeral.SelectAll;
        Exit;
      End;

      //SIG88580 - início
      //If RoundCM(edValorGeral.Value,2) <> RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat,2) Then    // Paulo Nobre - WO28166
      If (floattostr(edValorGeral.value) <> cdsMovRemessa.fieldbyname('VALOR').asString) then  // Paulo Nobre - WO32908
      Begin
        Application.MessageBox(MSG035, 'Atenção !', Mb_IconExclamation);
        DbeCodigoBarrasGeral.setfocus;
        DbeCodigoBarrasGeral.SelectAll;
        Exit;
      End;
      //SIG88580 - fim
    End;

    If edDtVenctoGeral.Text <> cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asString Then
      Application.MessageBox('Data do Código de Barras Diferente da Data Programada do Documento.', 'Atenção !', Mb_IconExclamation);

    //If edValorGeral.Value <> cdsMovRemessa.fieldbyname('VALOR').asFloat Then //SIG88580
      //  Application.MessageBox('Valor do Código de Barras Diferente do Valor do Documento.', 'Atenção !', Mb_IconExclamation); //SIG88580
  End;

  //Everson Cunha - SIG84050 - Início
  // GPS - INSS
  if (mkeMesAnoComp.Text <> '') or (qryINSS.fieldByname('IDBENEFINSS').AsString <> '') or (dbeVLRINSS.Text <> '') or
     (dbeVLROUTRAS_ENTIDADES.Text <> '') or (dbeVLRMULTA.Text <> '') or (dbeVLRTOTAL_INSS.Text <> '') then
  begin
    if mkeMesAnoComp.Text = '' then
    begin
      Application.MessageBox(MSG037, 'Atenção !', Mb_IconExclamation);

      if mkeMesAnoComp.CanFocus then
        mkeMesAnoComp.SetFocus;

      Exit;
    end;

    if qryINSS.fieldByname('IDBENEFINSS').AsString = '' then
    begin
      Application.MessageBox(MSG038, 'Atenção !', Mb_IconExclamation);
      Exit;
    end;

    if dbeVLRINSS.Text = '' then
    begin
      Application.MessageBox(MSG039, 'Atenção !', Mb_IconExclamation);

      if dbeVLRINSS.CanFocus then
        dbeVLRINSS.SetFocus;

      Exit;
    end;

    if dbeVLRTOTAL_INSS.Text = '' then
    begin
      Application.MessageBox(MSG040, 'Atenção !', Mb_IconExclamation);

      if dbeVLRTOTAL_INSS.CanFocus then
        dbeVLRTOTAL_INSS.SetFocus;

      Exit;
    end;

    if RoundCM(qryINSS.FieldByName('VLRTOTAL').AsFloat, 2) <> RoundCM(cdsMovRemessa.FieldByName('VALOR').AsFloat,2) then
    begin
      Application.MessageBox(MSG047, 'Atenção !', Mb_IconExclamation);

      if dbeVLRTOTAL_INSS.CanFocus then
        dbeVLRTOTAL_INSS.SetFocus;

      Exit;
    end;

    if RoundCM((qryINSS.FieldByName('VLRINSS').AsFloat + qryINSS.FieldByName('VLROUTRAS_ENTIDADES').AsFloat + qryINSS.FieldByName('VLRMULTA').AsFloat), 2) <> RoundCM(qryINSS.FieldByName('VLRTOTAL').AsFloat, 2) then
    begin
      Application.MessageBox(MSG048, 'Atenção !', Mb_IconExclamation);

      if dbeVLRINSS.CanFocus then
        dbeVLRINSS.SetFocus;

      Exit;
    end;
  end;
  //
  // DARF
  if ((dtApuracao_DARF.Text <> '') or (dbeNUMDOCUMENTO.Text <> '') or (dbeCODNATUREZA.Text <> '') or (dtDATAVENCDARF.Text <> '') or
     (dbeVLRIRRF.Text <> '') or (dbeVLRMULTA_DARF.Text <> '') or (dbeVLRJUROS.Text <> '') or (dbeVLRTOTAL.Text <> '')) and (qryDARF.State in [dsInsert, dsEdit]) then
  begin

    if dtApuracao_DARF.Text = '' then
    begin
      Application.MessageBox(MSG041, 'Atenção !', Mb_IconExclamation);

      if dtApuracao_DARF.CanFocus then
        dtApuracao_DARF.SetFocus;

      Exit;
    end
    else
    if dbeNUMDOCUMENTO.Text = '' then
    begin
      Application.MessageBox(MSG042, 'Atenção !', Mb_IconExclamation);

      if dbeNUMDOCUMENTO.CanFocus then
        dbeNUMDOCUMENTO.SetFocus;

      Exit;
    end
    else
    if dbeCODNATUREZA.Text = '' then
    begin
      Application.MessageBox(MSG043, 'Atenção !', Mb_IconExclamation);

      if dbeCODNATUREZA.CanFocus then
        dbeCODNATUREZA.SetFocus;

      Exit;
    end
    else
    if dtDATAVENCDARF.Text = '' then
    begin
      Application.MessageBox(MSG044, 'Atenção !', Mb_IconExclamation);

      if dtDATAVENCDARF.CanFocus then
        dtDATAVENCDARF.SetFocus;

      Exit;
    end
    else
    if dbeVLRIRRF.Text = '' then
    begin
      Application.MessageBox(MSG045, 'Atenção !', Mb_IconExclamation);

      if dbeVLRIRRF.CanFocus then
        dbeVLRIRRF.SetFocus;

      Exit;
    end
    else
    if dbeVLRTOTAL.Text = '' then
    begin
      Application.MessageBox(MSG046, 'Atenção !', Mb_IconExclamation);

      if dbeVLRTOTAL.CanFocus then
        dbeVLRTOTAL.SetFocus;

      Exit;
    end
    else
    if qryDARF.FieldByName('VLRTOTAL').AsFloat <> cdsMovRemessa.FieldByName('VALOR').AsFloat then
    begin
      Application.MessageBox(MSG047, 'Atenção !', Mb_IconExclamation);

      if dbeVLRTOTAL.CanFocus then
        dbeVLRTOTAL.SetFocus;

      Exit;
    end
    else
    if RoundCM((qryDARF.FieldByName('VLRIRRF').AsFloat + qryDARF.FieldByName('VLRMULTA').AsFloat + qryDARF.FieldByName('VLRJUROS').AsFloat), 2) <> RoundCM(qryDARF.FieldByName('VLRTOTAL').AsFloat, 2) then
    begin
      Application.MessageBox(MSG048, 'Atenção !', Mb_IconExclamation);

      if dbeVLRIRRF.CanFocus then
        dbeVLRIRRF.SetFocus;

      Exit;
    end;
  end;
  //Everson Cunha - SIG84050 - Fim

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryDocumento.State = dsEdit Then
          Begin
            Screen.Cursor := crSQLWait;

            // GPS - INSS
            //Everson Cunha - SIG84050 - Início
            if ((mkeMesAnoComp.Text <> '') or (qryINSS.fieldByname('IDBENEFINSS').AsString <> '') or (dbeVLRINSS.Text <> '') or
               (dbeVLROUTRAS_ENTIDADES.Text <> '') or (dbeVLRMULTA.Text <> '') or (dbeVLRTOTAL_INSS.Text <> '')) and (qryINSS.State in [dsInsert, dsEdit]) then
            begin

              qryINSS.fieldByname('CODIGOPGTO').AsString := '1';
              qryINSS.fieldByname('COMPETENCIA').AsString := copy(mkeMesAnoComp.Text, 0, 2) + '/' + copy(mkeMesAnoComp.Text, 3, 4);
              qryINSS.fieldByname('FLGIMPRESSO').AsString := 'N';
              qryINSS.fieldByname('DATAVENCTO').AsDateTime := cdsMovRemessa.fieldByname('DATAVENCTO').AsDateTime;
              qryINSS.fieldByname('VLRDESCONTO').AsFloat := 0;
              qryINSS.fieldByname('VLRJUROS').AsFloat := 0;

              If qryINSS.State = dsInsert Then
              begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('SELECT SEQDOCINSS.NEXTVAL SEQ FROM DUAL ');
                qryAux.Open;

                qryINSS.fieldByname('CODDOCINSS').asInteger := cdsMovRemessa.fieldByname('CODDOCUMENTO').asInteger;
                qryINSS.fieldByname('IDDOCINSS').asInteger := qryAux.fieldByname('SEQ').asInteger;

                qryAux.Close;
              end;

              qryINSS.ApplyUpdates;
            end;

            if ((mkeMesAnoComp.Text = '') and (qryINSS.fieldByname('IDBENEFINSS').AsString = '') and (dbeVLRINSS.Text = '') and
               (dbeVLROUTRAS_ENTIDADES.Text = '') and (dbeVLRMULTA.Text = '') and (dbeVLRTOTAL_INSS.Text = '')) and (qryINSS.State = dsEdit) then
            begin
              qryINSS.Delete;
              qryINSS.ApplyUpdates;
            end;   
            //

            // DARF
            if ((dtApuracao_DARF.Text <> '') or (dbeNUMDOCUMENTO.Text <> '') or (dbeCODNATUREZA.Text <> '') or (dtDATAVENCDARF.Text <> '') or
               (dbeVLRIRRF.Text <> '') or (dbeVLRMULTA_DARF.Text <> '') or (dbeVLRJUROS.Text <> '') or (dbeVLRTOTAL.Text <> '')) and (qryDARF.State in [dsInsert, dsEdit]) then
            begin

              //Cássio Rovaroto - SIG nº 100343 - Início
              //qryDARF.fieldByname('IDPESSOA').AsInteger := 1;
              //qryDARF.fieldByname('FLGIMPRESSO').AsString := 'N';
              //Cássio Rovaroto - SIG nº 100343 - Fim

              If qryDARF.State = dsInsert Then
              begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('SELECT SEQDARF.NEXTVAL SEQ FROM DUAL ');
                qryAux.Open;

                qryDARF.fieldByname('CODDOCUMENTO').asInteger := cdsMovRemessa.fieldByname('CODDOCUMENTO').asInteger;
                qryDARF.fieldByname('IDDARF').asInteger := qryAux.fieldByname('SEQ').asInteger;
                //Cássio Rovaroto - SIG nº 100343 - Início
                qryDARF.fieldByname('IDPESSOA').AsInteger := 1;
                qryDARF.fieldByname('FLGIMPRESSO').AsString := 'N';
                //Cássio Rovaroto - SIG nº 100343 - Fim

                qryAux.Close;
              end;

              qryDARF.ApplyUpdates;
            end;

            if ((dtApuracao_DARF.Text = '') and (dbeNUMDOCUMENTO.Text = '') and (dbeCODNATUREZA.Text = '') and (dtDATAVENCDARF.Text = '') and
                (dbeVLRIRRF.Text = '') and (dbeVLRMULTA_DARF.Text = '') and (dbeVLRJUROS.Text = '') and (dbeVLRTOTAL.Text = '')) and (qryDARF.State = dsEdit) and
                (cdsMovRemessa.FieldByName('IDMODULO').AsInteger <> 24) then
            begin
              qryDARF.Delete;
              qryDARF.ApplyUpdates;
            end;
            //
            //Everson Cunha - SIG84050 - Fim

            sCodDocum := qryDocumento.fieldbyname('CODDOCUMENTO').asString;

            qryDocumento.ApplyUpdates;

            dtmBaseDados.dbBaseDados.Commit;
            qryDocumento.Close;
            qryDocumento.Open;

            //Everson Cunha - SIG84050 - Início
            qryINSS.Close;
            qryINSS.Open;

            qryDARF.Close;
            qryDARF.Open;

            HabilitaDesabilitaCampos;
            //Everson Cunha - SIG84050 - Fim

            If bAltFormPagto Then
              Begin
                cdsMovRemessa.DisableControls;
                frmAguarde.pbAguarde.Visible := false;
                frmAguarde.Mostra('Selecionando Movimento...');
                cdsMovRemessa.data := oRemessaEletronica._SelecionaMovimentoRemessa(
                  dblkpConvenio.LookupValue,
                  dblkpFormaPagto.LookupValue,
                  dbDataProgIni.Date,
                  dbDataProgFim.Date, iIdModuloAcesso);
                frmAguarde.pbAguarde.Visible := True;
                frmAguarde.Apaga;
                cdsMovRemessa.EnableControls;

                cdsMovRemessa.Locate('CODDOCUMENTO', sCodDocum, []);

                bAltFormPagto := False;
                sFormaPagtoAnt := EmptyStr;
              End;

            Screen.Cursor := crDefault;

            btnCanGeralClick(Self);
          End;
      End;
  Except
    btnCanGeralClick(Self);
    Raise;
  End;
End;

Procedure TFrmRemessaEletronica.rdgTipoTituloGeralClick(Sender: TObject);
Begin
  Inherited;
  If qryDocumento.state <> dsBrowse Then
    Begin
      DbeCodigoBarrasGeral.Enabled := True;
      If rdgTipoTituloGeral.itemindex = 0 Then // Ficha de Compensação
        qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; '
      Else // Arrecadação
        qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';

      DbeCodigoBarrasGeral.Setfocus;
      DbeCodigoBarrasGeral.SelectAll;
    End;
End;

Procedure TFrmRemessaEletronica.btnCanGeralClick(Sender: TObject);
Begin
  Inherited;
  If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryDocumento.state = dsEdit Then
        qryDocumento.CancelUpdates;

      //Everson Cunha - SIG84050 - Início
      If qryINSS.state in [dsInsert, dsEdit] Then
        qryINSS.CancelUpdates;

      If qryDARF.state in [dsInsert, dsEdit] Then
        qryDARF.CancelUpdates;
      //Everson Cunha - SIG84050 - Fim

      dtmBaseDados.dbBaseDados.RollBack;
    End;

  HabilitaDesabilitaCampos; //Everson Cunha - SIG84050

  qryDocumentoAfterScroll(qryDocumento);

  pnlDadosMovGeral.enabled := False;
  pnlInfMan.Enabled := True;
  pnlCritSel.Enabled := True;
  btnConGeral.Enabled := False;
  btnCanGeral.Enabled := False;
  btnAltGeral.Down := False;
End;

// **************** INICIO ROTINAS DO MOVIMENTO DOS TITULOS **************************

Procedure TFrmRemessaEletronica.btnIncTitClick(Sender: TObject);
Begin
  Inherited;
  btnIncTit.down := True;
  If qryMovTitulos.State <> dsInsert Then
    Begin
      Try
        If cdsMovRemessa.FieldByName('FLGPERMITETITULOSPAGTO').AsString = 'S' Then
          Begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlGridMovTitulo.enabled := False;
            pnlDadosMovTitulo.enabled := True;
            pnlCritSel.Enabled := False;
            pnlInfMan.Enabled := False;

            btnAltTit.enabled := False;
            btnExcTit.enabled := False;
            btnConTit.Enabled := True;
            btnCanTit.Enabled := True;
            dbeValorPagto.Enabled := False; //SIG88585

            dValorAntCampo := 0.00;
            If _TemSaldoDisponivel(edSaldoTitulo.Value) Then
              Begin
                qryMovTitulos.Insert;
                rdgTipoTitulo.Itemindex := 0; // Ficha de Compensação
                dbeCodigoBarrasTitulos.setfocus;
                dbeCodigoBarrasTitulos.SelectAll;
              End
            Else
              btnCanTitClick(Self);
          End
        Else
          Begin
            Application.MessageBox(MSG028, 'Atenção !', Mb_IconExclamation);
            btnIncTit.down := False;
          End;
      Except
        btnCanTitClick(Self);
        Raise;
      End;
    End
  Else
    btnIncTit.Down := False;
End;

Procedure TFrmRemessaEletronica.btnAltTitClick(Sender: TObject);
Begin
  Inherited;
  If Not qryMovTitulos.isEmpty Then
    Begin
      dValorAntCampo := 0.00;
      btnAltTit.down := True;
      If qryMovTitulos.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlGridMovTitulo.enabled := False;
            pnlDadosMovTitulo.enabled := True;
            pnlCritSel.Enabled := False;
            pnlInfMan.Enabled := False;

            btnIncTit.enabled := False;
            btnExcTit.enabled := False;
            btnConTit.Enabled := True;
            btnCanTit.Enabled := True;
            dbeValorPagto.Enabled := False; //SIG88585
            dbeCodigoBarrasTitulos.Enabled := False; //SIG88585

            dValorAntCampo := qryMovTitulos.FieldByName('VLRPAGTO').AsFloat;

            qryMovTitulos.Edit;
            //dbeCodigoBarrasTitulos.setfocus; //SIG88585
            dbDataVenctoBoleto.setfocus; //SIG88585
          Except
            btnCanTitClick(Self);
            Raise;
          End;
        End
      Else
        btnAltTit.Down := False;
    End
  Else
    Begin
      btnAltTit.Down := False;
      Application.MessageBox(MSG021, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TFrmRemessaEletronica.btnExcTitClick(Sender: TObject);
Begin
  Inherited;
  If Not qryMovTitulos.isEmpty Then
    Begin
      If MsgDlg('Confirma Exclusão deste Título ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryMovTitulos.Delete;
            qryMovTitulos.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            qryMovTitulos.Close;
            qryMovTitulos.Open;

            cdsMovRemessaAfterScroll(cdsMovRemessa);

            Screen.Cursor := crDefault;
          Except
            Raise;
          End;
          btnExcTit.Down := False;
        End
      Else
        btnExcTit.Down := False;
    End
  Else
    Begin
      btnExcTit.Down := False;
      Application.MessageBox(MSG021, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TFrmRemessaEletronica.btnConTitClick(Sender: TObject);
Var bMsgCPFCNPJ: Boolean;
var _existeCodBarras : Boolean; //Everson Cunha - SIG99642
Begin
  Inherited;
  If (dbeCodigoBarrasTitulos.Text = EmptyStr) Then
  Begin
    Application.MessageBox(MSG018, 'Atenção !', Mb_IconExclamation);
    dbeCodigoBarrasTitulos.setfocus;
    Exit;
  End;

  If (dbDataVenctoBoleto.Text = EmptyStr) Then
  Begin
    Application.MessageBox(MSG016, 'Atenção !', Mb_IconExclamation);
    dbDataVenctoBoleto.setfocus;
    Exit;
  End;

  If dbeValorPagto.Value = 0 Then
  Begin
    Application.MessageBox(MSG008, 'Atenção !', Mb_IconExclamation);
    qryMovTitulos.FieldByName('VLRPAGTO').AsFloat := RoundCM(edSaldoTitulo.Value + dValorAntCampo, 2);
    dbeValorPagto.setfocus;
    Exit;
  End;

  If Trim(dbeCodigoBarrasTitulos.Text) <> EmptyStr Then
  Begin

    //Everson Cunha - SIG88640 - Início
    //Everson Cunha - SIG99642 - Início
    //if oRemessaEletronica._ExisteCodBarras(trim(dbeCodigoBarrasTitulos.Text)) then
    If qryMovTitulos.State = dsEdit then
      _existeCodBarras := oRemessaEletronica._ExisteCodBarras(cdsMovRemessa.fieldByname('CODDOCUMENTO').AsString,
                          trim(dbeCodigoBarrasTitulos.Text),
                          qryMovTitulos.fieldByname('IDDOCUMENTOXCODBARRAS').asString)
    else
      _existeCodBarras := oRemessaEletronica._ExisteCodBarras(cdsMovRemessa.fieldByname('CODDOCUMENTO').AsString,
                          trim(dbeCodigoBarrasTitulos.Text));

    if _existeCodBarras then
    //Everson Cunha - SIG99642 - Fim
    begin
      Application.MessageBox(MSG036, 'Atenção !', Mb_IconExclamation);

      if dbeCodigoBarrasTitulos.CanFocus then
      begin
        dbeCodigoBarrasTitulos.SetFocus;
        dbeCodigoBarrasTitulos.SelectAll;
      end;

      exit;
    end;
    //Everson Cunha - SIG88640 - Fim

    If rdgTipoTitulo.Itemindex = 0 Then // Ficha de Compensação
    Begin
      If Length(dbeCodigoBarrasTitulos.Text) <> 47 Then
      Begin
        Application.MessageBox(MSG013, 'Atenção !', Mb_IconExclamation);
        //edilaine SIG112509 : inicio
        if dbeCodigoBarrasTitulos.CanFocus then
        begin
          dbeCodigoBarrasTitulos.setfocus;
          dbeCodigoBarrasTitulos.SelectAll;
        end;
        //edilaine SIG112509 : fim
        Exit;
      End;

      If Not oRemessaEletronica._ValidaCodBarrasFichaComp(dbeCodigoBarrasTitulos.Text, 10) Then // Cálculo do digito na base 11
      Begin
        Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
        //edilaine SIG112509 : inicio
        if dbeCodigoBarrasTitulos.CanFocus then
        begin
          dbeCodigoBarrasTitulos.setfocus;
          dbeCodigoBarrasTitulos.SelectAll;
        end;
        //edilaine SIG112509 : fim
        Exit;
      End;
    End
    Else // Arrecadação
    Begin
      If (copy(dbeCodigoBarrasTitulos.Text, 2, 1) = '9') And // Segmento - Exclusivo do Banco
         (copy(dbeCodigoBarrasTitulos.Text, 17, 4) <> '0104') Then // <> do Banco CAIXA
      Begin
        Application.MessageBox(MSG030, 'Atenção !', Mb_IconExclamation);
        //edilaine SIG112509 : inicio
        if dbeCodigoBarrasTitulos.CanFocus then
        begin
          dbeCodigoBarrasTitulos.setfocus;
          dbeCodigoBarrasTitulos.SelectAll;
        end;
        //edilaine SIG112509 : fim
        Exit;
      End;

      If Length(dbeCodigoBarrasTitulos.Text) <> 48 Then
      Begin
        Application.MessageBox(MSG014, 'Atenção !', Mb_IconExclamation);
        //edilaine SIG112509 : inicio
        if dbeCodigoBarrasTitulos.CanFocus then
        begin
          dbeCodigoBarrasTitulos.setfocus;
          dbeCodigoBarrasTitulos.SelectAll;
        end;
        //edilaine SIG112509 : fim
        Exit;
      End;

      If Not oRemessaEletronica._ValidaCodBarrasArrecadacao(dbeCodigoBarrasTitulos.Text) Then
      Begin
        Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
        //edilaine SIG112509 : inicio
        if dbeCodigoBarrasTitulos.CanFocus then
        begin
          dbeCodigoBarrasTitulos.setfocus;
          dbeCodigoBarrasTitulos.SelectAll;
        end;
        //edilaine SIG112509 : fim
        Exit;
      End;
    End;
  End;

  If RoundCM(dbeValorPagto.Value, 2) > RoundCM((dValorAntCampo + edSaldoTitulo.Value), 2) Then
  Begin
    Application.MessageBox(MSG010, 'Atenção !', Mb_IconExclamation);
    qryMovTitulos.FieldByName('VLRPAGTO').AsFloat := RoundCM(edSaldoTitulo.Value + dValorAntCampo, 2);

    if dbeValorPagto.CanFocus then //Everson Cunha - SIG99642
      dbeValorPagto.setfocus;

    Exit;
  End;
//Ferrari retirar validação SIG 121770
//Inicio
{
  If (qryMovTitulos.FieldByName('VLRPAGTO').AsFloat >= dVlrObrigaNumDocTit) And
     (trim(qryMovTitulos.FieldByName('NUMDOCUMENTO').AsString) = EmptyStr) And
     (trim(dbCPFCNPJ.text) = EmptyStr) Then
  Begin
    Application.MessageBox(pchar('Campo CPF/CNPJ obrigatório para Valor Maior ou Igual a ' + #13 + #13 +
    floattostrf(dVlrObrigaNumDocTit, ffCurrency, 14, 2) + '. Verifique !'), 'Atenção !', Mb_IconExclamation);
    dbCPFCNPJ.setfocus;
    dbCPFCNPJ.SelectAll;
    Exit;
  End;
}
// Fim
  If trim(dbCPFCNPJ.text) <> EmptyStr Then
  Begin
    bMsgCPFCNPJ := False;

    If length(trim(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString)) = 11 Then
      bMsgCPFCNPJ := oRemessaEletronica._ValidaCPF(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString)
    Else
    If length(trim(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString)) = 14 Then
    Begin
      // Paulo Nobre - WO33342 - Inicio
//       bMsgCPFCNPJ := oRemessaEletronica._ValidaCNPJ(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString)

      oPessoa.IdEmpresa := Sistema.IdEmpresa;
      oPessoa.EJuridica := True; 
      oPessoa.HabilitaPessoa;
      bMsgCPFCNPJ := oPessoa.DocumentoValido(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString)
    // Paulo Nobre - WO33342 - Fim
    end
    Else
      bMsgCPFCNPJ := False;

    If Not bMsgCPFCNPJ Then
    Begin
      Application.MessageBox(MSG029, 'Atenção !', Mb_IconExclamation);
      dbCPFCNPJ.Setfocus;
      dbCPFCNPJ.SelectAll;
      Exit;
    End;
  End;

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryMovTitulos.State In [dsInsert, dsEdit] Then
      Begin
        Screen.Cursor := crSQLWait;

        If qryMovTitulos.State = dsInsert Then
        Begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.add('SELECT SEQDOCXCODBARRAS.NEXTVAL SEQ FROM DUAL ');
          qryAux.Open;
          qryMovTitulos.fieldByname('CODDOCUMENTO').asInteger := cdsMovRemessa.fieldByname('CODDOCUMENTO').asInteger;
          qryMovTitulos.fieldByname('IDDOCUMENTOXCODBARRAS').asInteger := qryAux.fieldByname('SEQ').asInteger;

          If rdgTipoTitulo.itemindex = 0 Then
            qryMovTitulos.fieldByname('FLGTIPOCODBARRAS').asString := 'F' // Ficha de Compensão
          Else
            qryMovTitulos.fieldByname('FLGTIPOCODBARRAS').asString := 'A'; // Arrecadação

          qryMovTitulos.FieldByName('FLGIMPORTADO').AsString := 'N'; //LEANDRO WO3978

          qryAux.Close;
        End;

        qryMovTitulos.Post;
        qryMovTitulos.ApplyUpdates;

        If RoundCM(edSaldoTitulo.Value, 2) < 0.00 Then
        Begin
          Application.MessageBox(MSG010, 'Atenção !', Mb_IconExclamation);
          dbeValorPagto.Setfocus;
          Exit;
        End;

        dtmBaseDados.dbBaseDados.Commit;

        qryMovTitulos.Close;
        qryMovTitulos.Open;

        dbgMovTitulos.ColumnByName('VLRPAGTO').FooterValue := _TotalizaColunaGridMovTitulos('VLRPAGTO', 2);
        edSaldoTitulo.Value := RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat - dValorTotalTitulos, 2);

        Screen.Cursor := crDefault;

        If (btnIncTit.down) And (RoundCM(edSaldoTitulo.Value, 2) <> 0.00) Then
          btnIncTitClick(Self)
        Else
          btnCanTitClick(Self);
      End;
    End;
  Except
    btnCanTitClick(Self);
    Raise;
  End;
End;

Procedure TFrmRemessaEletronica.btnCanTitClick(Sender: TObject);
Begin
  Inherited;
  If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryMovTitulos.state In [dsEdit, dsInsert] Then
        qryMovTitulos.CancelUpdates;

      dtmBaseDados.dbBaseDados.RollBack;

      dbgMovTitulosRowChanged(self);
    End;

  pnlGridMovTitulo.enabled := True;
  pnlDadosMovTitulo.enabled := False;
  pnlCritSel.Enabled := True;
  pnlInfMan.Enabled := True;

  btnIncTit.enabled := True;
  btnAltTit.enabled := True;
  btnExcTit.enabled := True;
  btnConTit.Enabled := False;
  btnCanTit.Enabled := False;
  dbeValorPagto.Enabled := True; //SIG88585
  dbeCodigoBarrasTitulos.Enabled := True; //SIG88585

  btnIncTit.Down := False;
  btnAltTit.Down := False;
End;

Procedure TFrmRemessaEletronica.dbeCodigoBarrasTitulosExit(Sender: TObject);
Begin
  Inherited;
  If (dbeCodigoBarrasTitulos.text <> EmptyStr) And (length(trim(dbeCodigoBarrasTitulos.text)) >= 47) Then
  Begin
    If rdgTipoTitulo.Itemindex = 0 Then // Ficha de Compensação
    Begin
      If copy(dbeCodigoBarrasTitulos.text, 34, 1) <> '0' Then
        qryMovTitulos.fieldbyname('DTPAGTO').asDateTime := oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(dbeCodigoBarrasTitulos.text)
      Else
        qryMovTitulos.fieldbyname('DTPAGTO').asDateTime := cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime;
    End
    Else // Arrecadação
      qryMovTitulos.fieldbyname('DTPAGTO').asDateTime := cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime;

    //edilaine SIG112509 : inicio
    if (not dbeValorPagto.Enabled) then
       qryMovTitulos.fieldbyname('VLRPAGTO').asFloat := oRemessaEletronica._ExtrairValorCodigoDeBarra(dbeCodigoBarrasTitulos.text);
    //edilaine SIG112509 : fim

    qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := EmptyStr;
    qryMovTitulos.fieldbyname('NUMDOCUMENTO').Clear;

    If qryMovTitulos.FieldByName('VLRPAGTO').AsFloat >= dVlrObrigaNumDocTit Then
    Begin
      qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString := cdsMovRemessa.fieldbyname('NUMDOCUMENTO').asString;

      If length(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString) = 11 Then
        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := '999.999.999\-99;0;_'
      Else If length(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString) = 14 Then
//        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := '99.999.999\/9999\-99;0;_';
        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := 'AA.AAA.AAA\/AAAA\-99;0;_';    // Paulo Nobre - WO33342
    End;

    //edilaine SIG112509 : inicio
    if (rdgTipoTitulo.Itemindex = 0) and (not dbeValorPagto.Enabled) then
    begin
      dbeValorPagto.Enabled := (rdgTipoTitulo.Itemindex = 0) and
                               (qryMovTitulos.fieldbyname('VLRPAGTO').asFloat = 0);

      dbeCodigoBarrasTitulos.enabled := (not dbeValorPagto.Enabled);
    end;
    //edilaine SIG112509 : fim

  End;
End;

Procedure TFrmRemessaEletronica.spbLimpaCampo1Click(Sender: TObject);
Begin
  Inherited;
  qryDocumento.fieldbyname('NUMLEITCODBARRAS').Clear;
  DbeCodigoBarrasGeral.Text := EmptyStr;
  edDtVenctoGeral.Text := EmptyStr;
  edValorGeral.value := 0.00;
  DbeCodigoBarrasGeral.Setfocus;
  DbeCodigoBarrasGeral.SelectAll;
End;

// **************** FIM DAS ROTINAS DO MOVIMENTO DOS TITULOS **************************

Procedure TFrmRemessaEletronica.spbGerarArqClick(Sender: TObject);
Var sNomeArquivoGerado, sNomeCompletoArquivoRemessa, sNomeCompletoBackup, sTipCompromisso, sFinalidadeDOC: String;
    sNSA: String;
    sNomeCompletoArquivoRemessaServidor: string;// Cássio Rovaroto - SIG nº 101591
    sMsgErro: string; //Cássio Rovaroto -  SIG nº 114764
Begin
  inherited;
  if (Not cdsMovArqPendente.isEmpty) And (Not qryMovArqPendDet.isEmpty) then
    begin
      // Verificando se há parametrização específica do Convênio em questão
      if oRemessaEletronica._CarregaParamConvenio(dblkpConvenio2.LookupValue, sMsgErro) then
      begin
        if Not cdsMovArqPendente.fieldbyname('PATHARQUIVOREM').isnull then
        begin
          if Application.MessageBox(pchar('Gerar Arquivo de Envio Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES then
          begin
            //Everson Cunha - SIG84050 - Início
            if Copy(UpperCase(Sistema.AliasServidor),1,8) <> 'PRODUCAO' then   //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
              Application.MessageBox(pchar('Em bases de testes, os arquivos são gravados em C:\Planus\Temp\RemessaEletronica\Remessa\ '), 'Atenção !', MB_ICONEXCLAMATION + MB_OK);
            //Everson Cunha - SIG84050 - Fim

            sNSA := cdsMovArqPendente.fieldByname('NSA').asString; // Cássio Rovaroto - SIG nº 75603
            // Montando o nome do Arquivo
            Screen.Cursor := crSQLWait;
            //Cássio Rovaroto - SIG nº 75187 - Início
            //Número NSA gerado a partir da criação do lote, e não mais na geração do arquivo.
            //Cássio Rovaroto - SIG nº 73883 - Início
            // Obtendo o NSA - Número Sequencial do Arquivo
            //qryAux.Close;
            //qryAux.SQL.Clear;
            //qryAux.SQL.add('SELECT SEQNSAARQPAG.NEXTVAL SEQ FROM DUAL    ');
            //qryAux.Open;
            //Cássio Rovaroto - SIG nº 73883 - Fim
            //Cássio Rovaroto - SIG nº 75187 - Fim

            qryAux1.Close;
            qryAux1.SQL.Clear;
            qryAux1.SQL.add('SELECT ''ACC.'' || TO_CHAR(SYSDATE, ''DDMMYYYY.'') || TRIM(CONV.NUMEMPRESABANCO) || ''.'' || LPAD(:pIDARQUIVOPAGTO, 6, ''0'') || ''.rem'' AS NOME_ARQ_REM ');
            qryAux1.SQL.add('FROM PORTADORFORMA PO   ');
            qryAux1.SQL.add('LEFT JOIN SEQREMESSA CONV ON PO.NUMEMPRESABANCO = CONV.NUMEMPRESABANCO ');
            qryAux1.SQL.add('WHERE PO.CODPORTFORMA =:pCODPORTFORMA ');
            //Cássio Rovaroto - SIG nº 75187 - Início
            //Cássio Rovaroto - SIG nº 73883 - Início
            //qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString;
            //qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := qryAux.fieldByname('SEQ').asString;
            //Cássio Rovaroto - SIG nº 73883 - Fim
            qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := sNSA; //Cássio Rovaroto - SIG nº 75603
            //Cássio Rovaroto - SIG nº 75187 - Fim
            qryAux1.ParamByName('pCODPORTFORMA').AsString := cdsMovArqPendente.fieldByname('CODPORTFORMA').asString;
            qryAux1.Open;
            Screen.Cursor := crDefault;

            sNomeArquivoGerado := qryAux1.fieldByname('NOME_ARQ_REM').asString;

            //Caminho de gravação dos arquivos

            //Everson Cunha - SIG84050 - Início
            //sNomeCompletoArquivoRemessa := cdsMovArqPendente.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;
            //sNomeCompletoBackup := cdsMovArqPendente.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
            sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado;
            if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then  //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
            begin
              sNomeCompletoArquivoRemessaServidor := cdsMovArqPendente.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;  //Cássio Rovaroto - SIG nº 101591
              sNomeCompletoBackup := cdsMovArqPendente.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
            end
            else
            begin
              //sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado; //Cássio Rovaroto - SIG nº 101591
              sNomeCompletoBackup := 'C:\Planus\Temp\RemessaEletronica\Backup\' + sNomeArquivoGerado;
            end;
            //Everson Cunha = SIG84050 - Fim

            //Cássio Rovaroto - SIG nº 73883 - Início
            if oRemessaEletronica.Impersonate then
            begin
              //Cássio Rovaroto - SIG nº 101591 - Início
              if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessa)) then
                ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessa));
              //Cássio Rovaroto - SIG nº 101591 - Fim

              if FileExists(sNomeCompletoArquivoRemessa) then
                DeleteFile(sNomeCompletoArquivoRemessa);
              RevertToSelf;
            end;
            //Cássio Rovaroto - SIG nº 73883 - Fim

            // ROTINAS PARA GERAR O ARQUIVO (_GerarArquivo)
            if oRemessaEletronica._CriaArquivo(sNomeCompletoArquivoRemessa) then
            begin
              try
                if Not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                Screen.Cursor := crSQLWait;
                cdsMovArqPendente.DisableControls;

                //Cássio Rovaroto - SIG nº 73883 - Início
                {// Obtendo o NSA - Número Sequencial do Arquivo
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('SELECT SEQNSAARQPAG.NEXTVAL SEQ FROM DUAL    ');
                qryAux.Open;}
                //Cássio Rovaroto - SIG nº 73883 - Fim

                //
                // Gerando e Gravando os dados no Arquivo de Remessa
                //
                oRemessaEletronica._GeraArquivoDeRemessa(sNomeCompletoArquivoRemessa,
                                                         cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString,
                                                         cdsMovArqPendente.fieldByname('CODPORTFORMA').asString,
                                                         sNSA); // Número Sequencial do Arquivo

                // Atualizando o Movimento
                qryAux2.Close;
                qryAux2.SQL.Clear;
                qryAux2.SQL.add('UPDATE ARQUIVOPAGTO     ');
                qryAux2.SQL.add('SET NSA = ' + sNSA); //Cássio Rovaroto - SIG nº 75603
                qryAux2.SQL.add(', DTGERACAOARQTXT = SYSDATE ');
                qryAux2.SQL.add(', USUGERACAOARQTXT = ' + quotedstr(Sistema.NomeUsuario));
                qryAux2.SQL.add(', NOMEARQTXT = ' + quotedstr(sNomeArquivoGerado));
                qryAux2.SQL.add(', FLGENVIADO = ''S''  ');
                qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString);
                qryAux2.ExecSQL;

                //Gerando registros de tarifa bancária
                //_RegistraTarifaBancaria(cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').asInteger);

                if dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Commit;

                //Cássio Rovaroto - SIG nº 73883 - Início
                if oRemessaEletronica.Impersonate then
                begin
                  //Everson Cunha - SIG84050 - Início
                  if not DirectoryExists(ExtractFileDir(sNomeCompletoBackup)) then
                    ForceDirectories(ExtractFileDir(sNomeCompletoBackup));
                  //Everson Cunha - SIG84050 - Fim

                  // Copiando o arquivo do diretório de remessa para o de backup
                  CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoBackup), False);

                  //Cássio Rovaroto - SIG Nº 101591 - Início
                  if (Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO') then  //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
                  begin
                    if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessaServidor)) then
                      ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessaServidor));

                    // Copiando o arquivo do diretório de remessa para PRODUCAO
                    CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoArquivoRemessaServidor), False);

                    if FileExists(sNomeCompletoArquivoRemessa) Then
                      DeleteFile(pChar(sNomeCompletoArquivoRemessa));
                  end;
                  //Cássio Rovaroto - SIG Nº 101591 - Fim
                  RevertToSelf;
                end;
                //Cássio Rovaroto - SIG nº 73883 - Fim

                Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' -> ' + sNomeArquivoGerado + ' <- Gerado com Sucesso !'), 'Atenção !', Mb_IconExclamation);

                //Everson Cunha - WO1822 - Ini
                //Imprime relatório "Relação de Pagamentos via Remessa Eletrônica - Modelo COFIN"
                qryEmpresa.Close;
                qryEmpresa.Open;
                qryBancoFUNCEF.Close;
                qryBancoFUNCEF.ParamByName('codportforma').AsInteger := cdsMovArqPendente.fieldbyname('codportforma').AsInteger;
                qryBancoFUNCEF.Open;
                TfrmPreview.CreateModalPreview(Application, rptMovPendentesCOFIN, rptMovPendentesCOFIN.PrinterSetup.DocumentName);
                qryEmpresa.Close;
                qryBancoFUNCEF.Close;
                //Everson Cunha - WO1822 - Fim

                cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'N');
                //cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'S');

                qryMovArqPendDet.Close;
                qryMovArqPendDet.Open;
                qryMovArqGeradoDet.Close;
                qryMovArqGeradoDet.Open;
                qryAux.Close;
                qryAux1.Close;
                qryAux2.Close;
                Screen.Cursor := crDefault;
                cdsMovArqPendente.EnableControls;
              except
                on E: Exception do
                begin
                  if dtmBaseDados.dbBaseDados.InTransaction then
                    dtmBaseDados.dbBaseDados.RollBack;

                  Screen.Cursor := crDefault;
                  cdsMovArqPendente.EnableControls;
                  Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                end;
              end
            end
            else
              Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' Não Gerado. Verifique !'), 'Atenção !', Mb_IconExclamation);
          end
        end
        else
          Application.MessageBox(MSG022, 'Atenção !', Mb_IconExclamation);
      end
      else
        Application.MessageBox(pchar('Convênio -> ' + dblkpConvenio2.Text + ' não possui Parametrização definida. Verifique !'), 'Atenção !', Mb_IconExclamation)
    end
  else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
end;

procedure TFrmRemessaEletronica.spbCancelarMovArqGeradoClick(Sender: TObject);
var sNomeCompletoArquivoRemessa, sNomeCompletoArquivoSeguranca: String;
  bAtualiza, bRemove: Boolean;
begin
  inherited;
  if Not cdsMovArqGerado.isEmpty then
  begin
    if cdsMovArqGerado.fieldbyname('STATUS').asString <> 'Baixado' then
    begin
      if Application.MessageBox(pchar('Cancelar Geração do Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES then
      begin
        bAtualiza := False;
        bRemove := False;
        //
        // Excluindo o arquivo do diretório do Servidor
        //
        //Everson Cunha - SIG84050 - Início
        //sNomeCompletoArquivoRemessa := cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
        //sNomeCompletoArquivoSeguranca := cdsMovArqGerado.fieldbyname('PATHARQUIVOSEGURANCA').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
        if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
        begin
          sNomeCompletoArquivoRemessa := cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
          sNomeCompletoArquivoSeguranca := cdsMovArqGerado.fieldbyname('PATHARQUIVOSEGURANCA').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
        end
        else
        begin
          sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
          sNomeCompletoArquivoSeguranca := '';
        end;
        //Everson Cunha = SIG84050 - Fim

        //Cássio Rovaroto - SIG nº 73883 - Início
        if oRemessaEletronica.Impersonate then
        begin
          if FileExists(sNomeCompletoArquivoRemessa) then
          begin
            if DeleteFile(sNomeCompletoArquivoRemessa) then
            begin
              bAtualiza := True;
              bRemove := True;
            end
            else
              Application.MessageBox(pchar('Problemas ao Remover o Arquivo -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- Tente Novamente'), 'Atenção !', Mb_IconExclamation);
          end
          else
          begin
            // Se existir no diretório de segurança, é porque já foi enviado à CEF
            if FileExists(sNomeCompletoArquivoSeguranca) then
            begin
              if Application.MessageBox(pchar('Arquivo -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- Não Removido do Servidor, pois já foi encaminhado para a CAIXA.' + #13 + #13 +
                                              'Cancela a Geração do Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' assim mesmo ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES then
                bAtualiza := True;
            end
            else // Se não existir, é porque não foi gerado e enviado
            begin
              if Application.MessageBox(pChar('Arquivo -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- Não Encontrado no Servidor para ser Cancelado !' + #13 + #13 +
                                              'Cancela a Geração do Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' assim mesmo ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES then
                bAtualiza := True;
            end;
          end;
            RevertToSelf;
        end;
        //Cássio Rovaroto - SIG nº 73883 - Fim

        if bAtualiza then
        begin
          try
            if Not dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.StartTransaction;

            Screen.Cursor := crSQLWait;
            cdsMovArqGerado.DisableControls;
            if iIdModuloAcesso = 3 then
            begin
              qryAux1.Close;
              qryAux1.SQL.Clear;
              qryAux1.SQL.add('UPDATE DOCUMENTO      ');
              qryAux1.SQL.add('SET STATUS = ''0''    '); // Documento pode ser alterado
              qryAux1.SQL.add('WHERE STATUS <> ''2'' '); // Documento não Baixado
              qryAux1.SQL.add('      AND CODDOCUMENTO IN (SELECT DISTINCT DECODE(AX.TIPO, 1, AX.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DX.CODDOCUMENTO) CODDOCUMENTO  ');
              qryAux1.SQL.add('                           FROM ARQUIVOXDOCUM  AX                                                                                                ');
              qryAux1.SQL.add('                           LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2                ');
              qryAux1.SQL.add('                           LEFT JOIN DOCUMENTOXCODBARRAS DX ON DX.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3            ');
              qryAux1.SQL.add('                           WHERE AX.IDARQUIVOPAGTO = ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ')');
              qryAux1.ExecSQL;

              //Everson Cunha - SIG117206 - Ini
              qryAux1.Close;
              qryAux1.SQL.Clear;
              qryAux1.SQL.add('UPDATE DOCUMENTO      ');
              qryAux1.SQL.add('   SET STATUS = ''0''    '); // Documento pode ser alterado
              qryAux1.SQL.add(' WHERE STATUS <> ''2'' ');   // Documento não Baixado
              qryAux1.SQL.add('   AND CODGRUPOCNAB IN (SELECT AX.ID_DOC_CODBARRAS_PESSOAS CODGRUPOCNAB ');
              qryAux1.SQL.add('                          FROM ARQUIVOXDOCUM  AX ');
              qryAux1.SQL.add('                         WHERE AX.TIPO = 4 '); //CODGRUPOCNAB
              qryAux1.SQL.add('                           AND AX.IDARQUIVOPAGTO = ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ')');
              qryAux1.ExecSQL;
              //Everson Cunha - SIG117206 - Fim
            end;
            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.add('UPDATE ARQUIVOPAGTO           ');
            qryAux2.SQL.add('SET DTCANCELAARQTXT = SYSDATE ');
            qryAux2.SQL.add(', USUCANCELAARQTXT = ' + quotedstr(Sistema.NomeUsuario));
            qryAux2.SQL.add(', FLGENVIADO = ''C''          '); // Cancelado
            qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString);
            qryAux2.ExecSQL;

            //Cássio Rovaroto - SIG nº 114764 - Início
            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.Add('DELETE FROM CM.DOCUMENTOXCODBARRAS ');
            qryAux2.SQL.Add(' WHERE IDDOCUMENTOXCODBARRAS IN (SELECT AD.ID_DOC_CODBARRAS_PESSOAS ');
            qryAux2.SQL.Add('    							   FROM CM.ARQUIVOXDOCUM AD');
            qryAux2.SQL.Add('    							   JOIN CM.ARQUIVOPAGTO A ON A.IDARQUIVOPAGTO = AD.IDARQUIVOPAGTO AND A.IDARQUIVOPAGTO = ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ')');
            qryAux2.ExecSQL;
            //Cássio Rovaroto - SIG nº 114764 - Fim

            qryAux3.Close;
            qryAux3.SQL.Clear;
            qryAux3.SQL.Add('DELETE FROM TARIFAARQPAGTO ' );
            qryAux3.SQL.Add(' WHERE IDARQUIVOPAGTO = ' + cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').AsString);
            qryAux3.ExecSQL;

            if dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Commit;

            if bRemove then
              Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- Cancelado com Sucesso !'), 'Atenção !', Mb_IconExclamation)
            else
              Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' Cancelado com Sucesso !'), 'Atenção !', Mb_IconExclamation);

            cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'S');

            qryMovArqGeradoDet.Close;
            qryMovArqGeradoDet.Open;

            SqlMovArqCancelado.Open;
            qryMovArqCancelDet.Close;
            qryMovArqCancelDet.Open;
            cdsMovArqGerado.EnableControls;
            Screen.Cursor := crDefault;
          except
            on E: Exception do
            begin
              if dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.RollBack;

              Screen.Cursor := crDefault;
              Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
            end;
          end;
        end;
      end
    end
    else
      Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
  end
  else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
end;

Procedure TFrmRemessaEletronica.spbImpMovArqGeradoClick(Sender: TObject);
Begin
  Inherited;
  If (Not cdsMovArqGerado.isEmpty) And (Not qryMovArqGeradoDet.isEmpty) Then
    Begin
      Screen.Cursor := crSQLWait;
      qryEmpresa.Close;
      qryEmpresa.Open;
      qryBancoFUNCEF.Close;
      qryBancoFUNCEF.ParamByName('codportforma').AsInteger := cdsMovArqGerado.fieldbyname('codportforma').AsInteger;
      qryBancoFUNCEF.Open;
      TfrmPreview.CreateModalPreview(Application, rptMovArqGerado, rptMovArqGerado.PrinterSetup.DocumentName);
      qryEmpresa.Close;
      qryBancoFUNCEF.Close;
      Screen.Cursor := crDefault;
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.SpeedButton3Click(Sender: TObject);
Begin
  Inherited;
  qryDocumento.fieldbyname('IDCBANCARIA').Clear;
  qryCtaBancariaGeral.Close;
  qryCtaBancariaGeral.Open;
End;

Procedure TFrmRemessaEletronica.SpeedButton12Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqGerado.isEmpty Then
    Begin
      qeMovArqGerado.FileName := sPathArquivosLog + '\ARQGERADOS_MOVIMENTO.XLS';
      qeMovArqGerado.Execute;
      cdsMovArqGerado.First;
    End;
End;

Procedure TFrmRemessaEletronica.SpeedButton13Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqCancelado.isEmpty Then
    Begin
      qeMovCancelado.FileName := sPathArquivosLog + '\ARQCANCELADOS_MOVIMENTO.XLS';
      qeMovCancelado.Execute;
      cdsMovArqCancelado.First;
    End;
End;

Procedure TFrmRemessaEletronica.dblkpConvenio2CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  If pcGeraArquivoOper.ActivePage = tbsGAPendentes Then
    Begin
      // Paulo Nobre - WO33342 - Inicio
      cdsMovArqPendente.DisableControls;
      dbNomeConvenioSel.DataSource := dsMovArqPendente;
      dbeCaminhoArq.DataSource := dsMovArqPendente;
      cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'N');
      cdsMovArqPendente.EnableControls;
      // Paulo Nobre - WO33342 - Fim
    End;

  If pcGeraArquivoOper.ActivePage = tbsGAGerados Then
    Begin
      // Paulo Nobre - WO33342 - Inicio
      cdsMovArqGerado.DisableControls;
      dbNomeConvenioSel.DataSource := dsMovArqGerado;
      dbeCaminhoArq.DataSource := dsMovArqGerado;
      cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'S');
      cdsMovArqGerado.EnableControls;
      // Paulo Nobre - WO33342 - Fim      
    End;

  If pcGeraArquivoOper.ActivePage = tbsGACancelados Then
    Begin
      dbNomeConvenioSel.DataSource := dsMovArqCancelado;
      cdsMovArqCancelado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'C');
    End;

  If pcGeraArquivoOper.ActivePage = tbsGAFinalizados Then
    Begin
      dbNomeConvenioSel.DataSource := dsMovArqFinalizado;
      cdsMovArqFinalizado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'F');
    End;
End;

Procedure TFrmRemessaEletronica.pcGeraArquivoOperChange(Sender: TObject);
Begin
  Inherited;
  dblkpConvenio2.Clear;
  dblkpConvenio2.Text := EmptyStr;

  dbeCaminhoArq.DataSource := Nil;

  If pcGeraArquivoOper.ActivePage = tbsGAPendentes Then
    Begin
      dbNomeConvenioSel.DataSource := dsMovArqPendente;
      dbeCaminhoArq.DataSource := dsMovArqPendente;
    End;

  If pcGeraArquivoOper.ActivePage = tbsGAGerados Then
    Begin
      dbNomeConvenioSel.DataSource := dsMovArqGerado;
      dbeCaminhoArq.DataSource := dsMovArqGerado;
    End;

  If pcGeraArquivoOper.ActivePage = tbsGACancelados Then
    dbNomeConvenioSel.DataSource := dsMovArqCancelado;
End;

Procedure TFrmRemessaEletronica.dblkpConvenioEnter(Sender: TObject);
Begin
  Inherited;
  dblkpConvenio.Selected;
End;

Procedure TFrmRemessaEletronica.rdgTipoTituloClick(Sender: TObject);
Begin
  Inherited;
  If rdgTipoTitulo.itemindex = 0 Then // Ficha de Compensação
    qryMovTitulosNUMCODBARRAS.EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; '
  Else // Arrecadação
    qryMovTitulosNUMCODBARRAS.EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';

  If qryMovTitulos.state <> dsBrowse Then
    Begin
      dbeCodigoBarrasTitulos.Setfocus;
      dbeCodigoBarrasTitulos.SelectAll;
    End;
End;

Procedure TFrmRemessaEletronica.dblkpConvenio2Click(Sender: TObject);
Begin
  Inherited;
  dblkpConvenio2.DropDown;
End;

Procedure TFrmRemessaEletronica.dblkpConvenioClick(Sender: TObject);
Begin
  Inherited;
  dblkpConvenio.DropDown;
End;

Procedure TFrmRemessaEletronica.dblkpFormaPagtoClick(Sender: TObject);
Begin
  Inherited;
  dblkpFormaPagto.DropDown;
End;

Procedure TFrmRemessaEletronica.spbBaixarMovArqGeradoPendClick(Sender: TObject);
Begin
  Inherited;
  If (Not cdsMovArqPendente.isEmpty) And (Not qryMovArqPendDet.isEmpty) Then
    Begin
      If cdsMovArqPendente.fieldbyname('STATUS').asString <> 'Baixado' Then
        Begin
          //Cássio Rovaroto - SIG nº 74164 - Início
          If Application.MessageBox(pchar('Confirma Baixa do Arquivo Nº ' + cdsMovArqPendente.fieldByname('NSA').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
          //If Application.MessageBox(pchar('Confirma Baixa do Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
          //Cássio Rovaroto - SIG nº 74164 - Fim
            Begin
              // Processar a Baixa dos Documentos Pendentes
              If _ProcessarBaixa('0',
                cdsMovArqPendente.fieldbyname('NOME_CONVENIO').asString,
                //Cássio Rovaroto - SIG nº 74164 - Início
                cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString,     //edilaine - SIG75325
                cdsMovArqPendente.FieldByName('NSA').asString,
                //Cássio Rovaroto - SIG nº 74164 - Fim
                cdsMovArqPendente.fieldbyname('CODPORTFORMA').asInteger,
                cdsMovArqPendente.fieldbyname('VLRTOTAL').asFloat
                ) Then
                Begin
                  cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivo(cdsMovArqPendente.fieldbyname('CODPORTFORMA').asString, 'N');
                  qryMovArqPendDet.Close;
                  qryMovArqPendDet.Open;
                End;
            End
        End
      Else
        //Cássio Rovaroto - SIG nº 74164 - Início
        //Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
        Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqPendente.fieldByname('NSA').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
        //Cássio Rovaroto - SIG nº 74164 - Fim
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.dbgMovArqGeradoPendDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If (Not cdsMovArqPendente.isEmpty) Then
    Begin
      If field.FieldName = 'STATUS' Then
        If cdsMovArqPendente.fieldbyname('STATUS').asString = 'Baixado' Then
          dbgMovArqGeradoPend.Canvas.Font.Color := clRed;

      dbgMovArqGeradoPend.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronica.spbBaixarMovArqGeradoClick(Sender: TObject);
Begin
  Inherited;
  If (Not cdsMovArqGerado.isEmpty) And (Not qryMovArqGeradoDet.isEmpty) Then
    Begin
      If cdsMovArqGerado.fieldbyname('STATUS').asString <> 'Baixado' Then
        Begin
          //Cássio Rovaroto - SIG nº 74164 - Início
          //If Application.MessageBox(pchar('Confirma Baixa do Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
          If Application.MessageBox(pchar('Confirma Baixa do Arquivo Nº ' + cdsMovArqGerado.fieldByname('NSA').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
          //Cássio Rovaroto - SIG nº 74164 - Fim
            Begin
              // Processar a Baixa dos Documentos Gerados
              If _ProcessarBaixa('0',
                cdsMovArqGerado.fieldbyname('NOME_CONVENIO').asString,
                //Cássio Rovaroto - SIG nº 74164 - Início
                cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString,     //edilaine - SIG75325
                cdsMovArqGerado.fieldByname('NSA').asString,
                //Cássio Rovaroto - SIG nº 74164 - Fim
                cdsMovArqGerado.fieldbyname('CODPORTFORMA').asInteger,
                cdsMovArqGerado.fieldbyname('VLRTOTAL').asFloat
                ) Then
                Begin
                  cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(cdsMovArqGerado.fieldbyname('CODPORTFORMA').asString, 'S');
                  qryMovArqGeradoDet.Close;
                  qryMovArqGeradoDet.Open;
                End;
            End
        End
      Else
        //Cássio Rovaroto - SIG nº 74164 - Início
        //Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
        Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('NSA').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
        //Cássio Rovaroto - SIG nº 74164 - Fim
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.dbgMovArqGeradoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If (Not cdsMovArqGerado.isEmpty) Then
    Begin
      If field.FieldName = 'STATUS' Then
        If cdsMovArqGerado.fieldbyname('STATUS').asString = 'Baixado' Then
          dbgMovArqGerado.Canvas.Font.Color := clRed;

      dbgMovArqGerado.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronica.dbgMovTitulosRowChanged(Sender: TObject);
Begin
  Inherited;
  If qryMovTitulos.State = dsBrowse Then
    Begin
      If qryMovTitulosFLGTIPOCODBARRAS.asString = 'F' Then // Ficha de Compensação
        rdgTipoTitulo.itemindex := 0
      Else If qryMovTitulosFLGTIPOCODBARRAS.asString = 'A' Then // Arrecadação
        rdgTipoTitulo.itemindex := 1;
    End;
End;

Procedure TFrmRemessaEletronica.spbDesfazerBaixaClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqPendente.isEmpty Then
    Begin
      If cdsMovArqPendente.Locate('STATUS', 'Baixado', []) Then
        _ChamaFormDesfazerBaixa('P') // Pendente
      Else
        Application.MessageBox(MSG026, 'Atenção !', Mb_IconExclamation);
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.spbDesfazerBaixa2Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqGerado.isEmpty Then
    Begin
      If cdsMovArqGerado.Locate('STATUS', 'Baixado', []) Then
        _ChamaFormDesfazerBaixa('G') // Gerado
      Else
        Application.MessageBox(MSG026, 'Atenção !', Mb_IconExclamation);
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Function TFrmRemessaEletronica._ChamaFormDesfazerBaixa(pTipo: String): String;
Begin
  AbrirFormModal(FrmAlteraExcluiPagto, TFrmAlteraExcluiPagto);

  Screen.Cursor := crSQLWait;
  If pTipo = 'P' Then // Pendente
    Begin
      cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivo(cdsMovArqPendente.fieldbyname('CODPORTFORMA').asString, 'N'); // Não
      qryMovArqPendDet.Close;
      qryMovArqPendDet.Open;
    End
  Else If pTipo = 'G' Then // Gerado
    Begin
      cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(cdsMovArqGerado.fieldbyname('CODPORTFORMA').asString, 'S'); // Sim
      qryMovArqGeradoDet.Close;
      qryMovArqGeradoDet.Open;
    End
  Else If pTipo = 'R' Then // Retorno
    Begin
      qryMovRetorno.Close;
      qryMovRetorno.Open;
    End;
  Screen.Cursor := crDefault;
End;

Procedure TFrmRemessaEletronica.DbeCodigoBarrasGeralExit(Sender: TObject);
Begin
  Inherited;

  If (DbeCodigoBarrasGeral.text <> EmptyStr) And (length(trim(DbeCodigoBarrasGeral.text)) >= 47) Then
  Begin
    If rdgTipoTituloGeral.Itemindex = 0 Then // Ficha de Compensação
    Begin
      If copy(DbeCodigoBarrasGeral.text, 34, 1) <> '0' Then
        edDtVenctoGeral.Text := datetostr(oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(DbeCodigoBarrasGeral.text))
      Else
        edDtVenctoGeral.Text := datetostr(cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime);
    End
    Else // Arrecadação
      edDtVenctoGeral.Text := datetostr(cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime);

    //edilaine SIG112509 : inicio
    edValorGeral.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(DbeCodigoBarrasGeral.text);
    if edValorGeral.value = 0 then
       edValorGeral.value := cdsMovRemessa.fieldbyname('VALOR').asFloat;
    //edilaine SIG112509 : fim

  End;
End;

Procedure TFrmRemessaEletronica.dbeValorPagtoExit(Sender: TObject);
Begin
  Inherited;
  qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := EmptyStr;
  qryMovTitulos.fieldbyname('NUMDOCUMENTO').Clear;
  If qryMovTitulos.FieldByName('VLRPAGTO').AsFloat >= dVlrObrigaNumDocTit Then
    Begin
      qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString := cdsMovRemessa.fieldbyname('NUMDOCUMENTO').asString;
      If length(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString) = 11 Then
        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := '999.999.999\-99;0;_'
      Else If length(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString) = 14 Then
//        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := '99.999.999\/9999\-99;0;_'
        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := 'AA.AAA.AAA\/AAAA\-99;0;_'    // Paulo Nobre - WO33342
      Else
        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := EmptyStr;
    End;
End;

Procedure TFrmRemessaEletronica.dbgMovRemessaTitleButtonClick(Sender: TObject; AFieldName: String);
Begin
  Inherited;
  Try
    If (Not cdsMovRemessa.Active) Or (cdsMovRemessa.IsEmpty) Or
      ((AFieldName <> 'NUM_AP') And
      (AFieldName <> 'NUMDOCUMENTO') And
      (AFieldName <> 'RAZAOSOCIAL') And
      (AFieldName <> 'FORMA_PAGTO')) Then
      Exit;

    If (Trim(cdsMovRemessa.IndexName) = Trim('asc' + AFieldName)) Then
      cdsMovRemessa.IndexName := 'desc' + AFieldName
    Else
      cdsMovRemessa.IndexName := 'asc' + AFieldName;
  Finally
    cdsMovRemessa.First;
  End;
End;

Procedure TFrmRemessaEletronica.dbgMovRemessaCalcTitleImage(Sender: TObject; Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
Begin
  Inherited;
  If (Field.FieldName = 'NUM_AP') Or
    (Field.FieldName = 'NUMDOCUMENTO') Or
    (Field.FieldName = 'RAZAOSOCIAL') Or
    (Field.FieldName = 'FORMA_PAGTO') Then
    Begin
      TitleImageAttributes.Alignment := taLeftJustify;
      TitleImageAttributes.ImageIndex := 19;
      If cdsMovRemessa.IndexName = Trim('asc' + Field.FieldName) Then
        TitleImageAttributes.ImageIndex := 20;
    End;
End;

Procedure TFrmRemessaEletronica.SpeedButton1Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqFinalizado.isEmpty Then
    Begin
      qeMovFinalizado.FileName := sPathArquivosLog + '\ARQFINALIZADO_MOVIMENTO.XLS';
      qeMovFinalizado.Execute;
      cdsMovArqFinalizado.First;
    End;
End;

Procedure TFrmRemessaEletronica.spbLocalizaArqRetClick(Sender: TObject);
var tArquivo: TextFile;
  iIniCampo, iTamCampo: Array[0..6] Of Integer;
  sLinha, sNSA, sDescMomento, sSegmento, sCodReg, sNumAutenticacao, sCodDocArq, sDataEfet, sValorEfet, sOcorrencias: String;
  dValor, dTotalLista: Double;
  iCodArqPagto: Integer;
begin
  Inherited;

  {If dlgLocArqRetorno.Execute Then
    If uppercase(dlgLocArqRetorno.FileName) <> EmptyStr Then
      Begin
        stCaminhoRet.Caption := dlgLocArqRetorno.FileName;
        Try
          If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

          iIniCampo[0] := 8; iTamCampo[0] := 1; // Código do Registro
          iIniCampo[1] := 14; iTamCampo[1] := 1; // Código do Segmento
          iIniCampo[5] := 231; iTamCampo[5] := 10; // Ocorrências do Retorno

          dTotalLista := 0.00;
          iCodArqPagto := 0;
          sNSA := EmptyStr;
          sCodDocArq := EmptyStr;

          Cursor := crSQLWait;
          //Cássio Rovaroto - SIG nº 73883 - Início
          if oRemessaEletronica.Impersonate then
          begin
            // Processando o arquivo
            AssignFile(tArquivo, dlgLocArqRetorno.FileName);
            RevertToSelf;
          end;

          Reset(tArquivo);
          While Not EOF(tArquivo) Do
          Begin
            sDataEfet := EmptyStr;
            sValorEfet := '0.00';
            sOcorrencias := EmptyStr;
            sNumAutenticacao := EmptyStr;

            // Lendo linha dos dados
            Readln(tArquivo, sLinha);

            // Código do Registro
            sCodReg := Copy(sLinha, iIniCampo[0], iTamCampo[0]);
            // Código do Segmento (tipos de layouts)
            sSegmento := Copy(sLinha, iIniCampo[1], iTamCampo[1]);

            // Se for o Cabeçalho do Arquivo, então pega o NSA
            If sCodReg = '0' Then
              Begin
                sNSA := inttostr(strtoint(Copy(sLinha, 158, 6))); // NSA
                // Pegando o IDARQUIVOPAGTO para atualizar a Grid dos Retornos
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('SELECT IDARQUIVOPAGTO           ');
                qryAux.SQL.add('FROM ARQUIVOPAGTO               ');
                qryAux.SQL.add('WHERE NSA = ' + sNSA);    // Número Sequencial do Arquivo
                qryAux.Open;
                iCodArqPagto := qryAux.fieldByname('IDARQUIVOPAGTO').asInteger;
              End;

            // Só processa se forem linhas de Movimento, tipo = '3' and <> de 'J52'
            If (sCodReg = '3') And ((sSegmento + Copy(sLinha, 18, 2)) <> 'J52') Then
              Begin
                If (sSegmento = 'A') Or (sSegmento = 'J') Or (sSegmento = 'K') Or (sSegmento = 'Z') Then
                  Begin
                    If sSegmento = 'J' Then
                      Begin
                        iIniCampo[2] := 183; iTamCampo[2] := 6; // Número do Documento da Empresa
                        iIniCampo[3] := 145; iTamCampo[3] := 8; // Data da Efetivação
                        iIniCampo[4] := 153; iTamCampo[4] := 15; // Valor Real Efetivado
                      End
                    Else If (sSegmento = 'A') Or (sSegmento = 'K') Then
                      Begin
                        iIniCampo[2] := 74; iTamCampo[2] := 6; // Número do Documento da Empresa
                        iIniCampo[3] := 155; iTamCampo[3] := 8; // Data da Efetivação
                        iIniCampo[4] := 163; iTamCampo[4] := 15; // Valor Real Efetivado
                      End
                    Else // Segmento = 'Z'
                      iIniCampo[6] := 79; iTamCampo[6] := 25; // Número da Autenticação

                    // Segmento que contem o Número da Autenticação
                    If (sSegmento = 'Z') Then
                      Begin
                        sNumAutenticacao := quotedstr(trim(Copy(sLinha, iIniCampo[6], iTamCampo[6])));

                        qryAux2.Close;
                        qryAux2.SQL.Clear;
                        qryAux2.SQL.add('UPDATE ARQUIVOXDOCUM               ');
                        qryAux2.SQL.add('SET AUTENTICACAO = ' + sNumAutenticacao);
                        qryAux2.SQL.add('WHERE CODDOCARQ = ' + sCodDocArq);
                        qryAux2.ExecSQL;

                        sCodDocArq := EmptyStr;
                      End
                    Else
                      Begin
                        // Número do Documento da Empresa (CODDOCARQ)
                        sCodDocArq := trim(inttostr(strtoint(Copy(sLinha, iIniCampo[2], iTamCampo[2]))));
                        // Data da Efetivação
                        If strtoint(Copy(sLinha, iIniCampo[3], iTamCampo[3])) <> 0 Then
                          sDataEfet := quotedstr(ColocaBarra(Copy(sLinha, iIniCampo[3], iTamCampo[3])));
                        // Valor Real Efetivado
                        If strtoint(Copy(sLinha, iIniCampo[4], iTamCampo[4])) <> 0 Then
                          sValorEfet := TrocaCaracter(floattostr((strtoint(Copy(sLinha, iIniCampo[4], iTamCampo[4]))) / 100), ',', '.');
                        // Ocorrências do Retorno
                        sOcorrencias := quotedstr(trim(Copy(sLinha, iIniCampo[5], iTamCampo[5])));

                        If (sCodDocArq <> EmptyStr) Then // Número do Documento da Empresa
                          Begin
                            // Atualizar a tabela com os dados do retorno
                            qryAux2.Close;
                            qryAux2.SQL.Clear;
                            qryAux2.SQL.add('UPDATE ARQUIVOXDOCUM            ');
                            qryAux2.SQL.add('SET                             ');
                            If (sDataEfet <> EmptyStr) Then // Data da Efetivação
                              qryAux2.SQL.add('DATA_EFETIVACAO = ' + sDataEfet)
                            Else
                              qryAux2.SQL.add('DATA_EFETIVACAO = NULL        ');

                            If (sValorEfet <> EmptyStr) Then // Valor Real Efetivado
                              qryAux2.SQL.add(', VALOR_EFETIVADO = ' + sValorEfet)
                            Else
                              qryAux2.SQL.add(', VALOR_EFETIVADO = 0.00      ');

                            qryAux2.SQL.add(', OCORRENCIA_RET = ' + sOcorrencias);
                            qryAux2.SQL.add('WHERE CODDOCARQ = ' + sCodDocArq);
                            qryAux2.ExecSQL;
                            //
                          End;
                      End;
                  End;
              End;
          End;
          // Finalizando o Lançamento
          qryAux2.Close;
          qryAux2.SQL.Clear;
          qryAux2.SQL.add('UPDATE ARQUIVOPAGTO            ');
          qryAux2.SQL.add('SET DTFINALIZAARQTXT = SYSDATE ');
          qryAux2.SQL.add(', USUFINALIZAARQTXT = ' + quotedstr(Sistema.NomeUsuario));
          qryAux2.SQL.add(', FLGENVIADO = ''F''           '); // Finalizado
          qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + inttostr(iCodArqPagto));
          qryAux2.ExecSQL;

          If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Commit;

          qryMovRetorno.DisableControls;
          qryMovRetorno.Close;
          qryMovRetorno.ParamByName('IDARQUIVOPAGTO').asInteger := iCodArqPagto;
          qryMovRetorno.SQL.SaveToFile(sPathArquivosLog + '\SQL_SelMovRetorno.txt');
          qryMovRetorno.Open;
          If Not qryMovRetorno.IsEmpty Then
            Begin
              qryTotaisRetorno.Close;
              qryTotaisRetorno.ParamByName('IDARQUIVOPAGTO').asInteger := iCodArqPagto;
              qryTotaisRetorno.Open;
            End
          Else
            Application.MessageBox(MSG031, 'Atenção !', Mb_IconExclamation);

          qryMovRetorno.EnableControls;
          qryAux1.Close;
          qryAux2.Close;
          Cursor := crDefault;
          CloseFile(tArquivo);
        Except
          Begin
            CloseFile(tArquivo);
            Cursor := crDefault;
            Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
            Raise;
          End;
        End;
      End;}
   {if UpperCase(ret[cmbArqRetorno.ItemIndex].NomeArq) <> EmptyStr then
  begin
    iCodArqPagto := ret[cmbArqRetorno.ItemIndex].IdArquivoPagto;

    try
      if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

      iIniCampo[0] := 1; iTamCampo[0] := 1; // Código do Registro
      iIniCampo[5] := 68; iTamCampo[5] := 2; // Ocorrências do Retorno

      dTotalLista := 0.00;
      sNSA := EmptyStr;
      sCodDocArq := EmptyStr;
      Cursor := crSQLWait;

      if oRemessaEletronica.Impersonate then
      begin
        // Processando o arquivo
        AssignFile(tArquivo, ret[cmbArqRetorno.ItemIndex].NomeArq);
        Reset(tArquivo);

        while not EOF(tArquivo) do
        begin
          sDataEfet := EmptyStr;
          sValorEfet := '0.00';
          sOcorrencias := EmptyStr;
          sNumAutenticacao := EmptyStr;

          // Lendo linha dos dados
          Readln(tArquivo, sLinha);

          // Código do Registro
          sCodReg := Copy(sLinha, iIniCampo[0], iTamCampo[0]);

          // Se for o Cabeçalho do Arquivo, então pega o NSA
          if sCodReg = 'A' then
          begin
            //O NSA recuperado será inserido na tabela ARQUIVOPAGTO, para identicar o NSA do retorno.
            sNSA := inttostr(strtoint(Copy(sLinha, 74, 6))); // NSA

            // Pegando o IDARQUIVOPAGTO para atualizar a Grid dos Retornos
          end;

          // Só processa se forem linhas de Movimento tipo = '3'
          if (sCodReg = 'F') Then
          begin
            iIniCampo[2] := 2; iTamCampo[2] := 25; // Número do Documento da Empresa
            iIniCampo[3] := 45; iTamCampo[3] := 8; // Data da Efetivação
            iIniCampo[4] := 53; iTamCampo[4] := 15; // Valor Real Efetivado

            // Número do Documento da Empresa (CODDOCARQ)
            sCodDocArq := trim(inttostr(strtoint(trim(Copy(sLinha, iIniCampo[2], iTamCampo[2])))));

            // Data da Efetivação
            if strtoint(Copy(sLinha, iIniCampo[3], iTamCampo[3])) <> 0 then
              sDataEfet := quotedstr(ColocaBarra(Copy(sLinha, iIniCampo[3], iTamCampo[3])));

            // Valor Real Efetivado
            if strtoint(Copy(sLinha, iIniCampo[4], iTamCampo[4])) <> 0 then
              sValorEfet := TrocaCaracter(floattostr((strtoint(Copy(sLinha, iIniCampo[4], iTamCampo[4]))) / 100), ',', '.');

            // Ocorrências do Retorno
            sOcorrencias := quotedstr(trim(Copy(sLinha, iIniCampo[5], iTamCampo[5])));

            if (sCodDocArq <> EmptyStr) then // Número do Documento da Empresa
            begin
              // Atualizar a tabela com os dados do retorno
              qryAux2.Close;
              qryAux2.SQL.Clear;
              qryAux2.SQL.add('UPDATE ARQUIVOXDOCUM            ');
              qryAux2.SQL.add('SET                             ');

              if (sDataEfet <> EmptyStr) then // Data da Efetivação
                qryAux2.SQL.add('DATA_EFETIVACAO = ' + sDataEfet)
              else
                qryAux2.SQL.add('DATA_EFETIVACAO = NULL        ');

              if (sValorEfet <> EmptyStr) then // Valor Real Efetivado
                qryAux2.SQL.add(', VALOR_EFETIVADO = ' + sValorEfet)
              else
                qryAux2.SQL.add(', VALOR_EFETIVADO = 0.00      ');

              qryAux2.SQL.add(', OCORRENCIA_RET = ' + sOcorrencias);
              qryAux2.SQL.add('WHERE CODDOCARQ = ' + sCodDocArq);
              qryAux2.ExecSQL;
              //
            end;
          end;

        end;
      end;
      RevertToSelf;

      // Finalizando o Lançamento
      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.add('UPDATE ARQUIVOPAGTO            ');
      qryAux2.SQL.add('SET DTFINALIZAARQTXT = SYSDATE ');
      qryAux2.SQL.add(', USUFINALIZAARQTXT = ' + quotedstr(Sistema.NomeUsuario));
      qryAux2.SQL.add(', FLGENVIADO = ''F''           '); // Finalizado
      //Gravando o NSA do retorno....
      qryAux2.SQL.Add(', NSARET = ' + sNSA);
      qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + inttostr(iCodArqPagto));
      qryAux2.ExecSQL;

      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

      qryAux1.Close;
      qryAux2.Close;
      Cursor := crDefault;
      CloseFile(tArquivo);
    except
      begin
        CloseFile(tArquivo);
        Cursor := crDefault;
        Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
        Raise;
      end;
    end;

    qryMovRetorno.DisableControls;
    qryMovRetorno.Close;
    qryMovRetorno.ParamByName('IDARQUIVOPAGTO').asInteger := iCodArqPagto;
    qryMovRetorno.SQL.SaveToFile(sPathArquivosLog + '\SQL_SelMovRetorno.txt');
    qryMovRetorno.Open;

    if not qryMovRetorno.IsEmpty then
    begin
      qryTotaisRetorno.Close;
      qryTotaisRetorno.ParamByName('IDARQUIVOPAGTO').asInteger := iCodArqPagto;
      qryTotaisRetorno.Open;
    end
    else
      Application.MessageBox(MSG031, 'Atenção !', Mb_IconExclamation);

    qryMovRetorno.EnableControls;
  end;  }
  
  if dlgLocArqRetorno.Execute then
  begin
    if uppercase(dlgLocArqRetorno.FileName) <> EmptyStr then
    begin
      stCaminhoRet.Caption := dlgLocArqRetorno.FileName;
      try
        if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

        iIniCampo[0] := 8; iTamCampo[0] := 1; // Código do Registro
        iIniCampo[1] := 14; iTamCampo[1] := 1; // Código do Segmento
        iIniCampo[5] := 231; iTamCampo[5] := 10; // Ocorrências do Retorno

        dTotalLista := 0.00;
        iCodArqPagto := 0;
        sNSA := EmptyStr;
        sCodDocArq := EmptyStr;

        Cursor := crSQLWait;
        //Cássio Rovaroto - SIG nº 73883 - Início
        if oRemessaEletronica.Impersonate then
        begin
          // Processando o arquivo
          AssignFile(tArquivo, dlgLocArqRetorno.FileName);
          RevertToSelf;
        end;

        Reset(tArquivo);
        while not Eof(tArquivo) do
        begin
          sDataEfet:= EmptyStr;
          sValorEfet := '0.00';
          sOcorrencias := EmptyStr;
          sNumAutenticacao := EmptyStr;

          //Lendo as linhas dos dados
          Readln(tArquivo, slinha);

          //Codigo do Registro
          sCodReg := Copy(sLinha, iIniCampo[0], iTamCampo[0]);
          // Código do Segmento (tipos de layouts)
          sSegmento := Copy(sLinha, iIniCampo[1], iTamCampo[1]);

          // Se for o Cabeçalho do Arquivo, então pega o NSA
          if sCodReg = '0' then
          begin
            sNSA := inttostr(strtoint(Copy(sLinha, 192, 6))); // NSA
            // Pegando o IDARQUIVOPAGTO para atualizar a Grid dos Retornos
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.add('SELECT IDARQUIVOPAGTO           ');
            qryAux.SQL.add('FROM ARQUIVOPAGTO               ');
            qryAux.SQL.add('WHERE NSA = ' + sNSA);    // Número Sequencial do Arquivo
            qryAux.Open;
            iCodArqPagto := qryAux.fieldByname('IDARQUIVOPAGTO').asInteger;
          end;
          // Só processa se forem linhas de Movimento, tipo = '3' and <> de 'J52'
          if (sCodReg = '3') And ((sSegmento + Copy(sLinha, 18, 2)) <> 'J52') then
          begin
            if (sSegmento = 'A') Or (sSegmento = 'J') Or (sSegmento = 'K') Or (sSegmento = 'Z') or (sSegmento = 'N') or
               (sSegmento = 'W') then
            begin
              if sSegmento = 'J' then
              begin
                iIniCampo[2] := 183; iTamCampo[2] := 6; // Número do Documento da Empresa
                iIniCampo[3] := 145; iTamCampo[3] := 8; // Data da Efetivação
                iIniCampo[4] := 153; iTamCampo[4] := 15; // Valor Real Efetivado
              end
              else if (sSegmento = 'A') Or (sSegmento = 'K') then
              begin
                iIniCampo[2] := 74; iTamCampo[2] := 6; // Número do Documento da Empresa
                iIniCampo[3] := 155; iTamCampo[3] := 8; // Data da Efetivação
                iIniCampo[4] := 163; iTamCampo[4] := 15; // Valor Real Efetivado
              end
              else // Segmento = 'Z'
                iIniCampo[6] := 79; iTamCampo[6] := 25; // Número da Autenticação

              // Segmento que contem o Número da Autenticação
              if (sSegmento = 'Z') then
              begin
               sNumAutenticacao := quotedstr(trim(Copy(sLinha, iIniCampo[6], iTamCampo[6])));

               qryAux2.Close;
               qryAux2.SQL.Clear;
               qryAux2.SQL.add('UPDATE ARQUIVOXDOCUM               ');
               qryAux2.SQL.add('SET AUTENTICACAO = ' + sNumAutenticacao);
               qryAux2.SQL.add('WHERE CODDOCARQ = ' + sCodDocArq);
               qryAux2.ExecSQL;

               sCodDocArq := EmptyStr;
              end
              else
              begin
                // Número do Documento da Empresa (CODDOCARQ)
                sCodDocArq := trim(inttostr(strtoint(Copy(sLinha, iIniCampo[2], iTamCampo[2]))));
                // Data da Efetivação
                if strtoint(Copy(sLinha, iIniCampo[3], iTamCampo[3])) <> 0 then
                  sDataEfet := quotedstr(ColocaBarra(Copy(sLinha, iIniCampo[3], iTamCampo[3])));

                // Valor Real Efetivado
                if strtoint(Copy(sLinha, iIniCampo[4], iTamCampo[4])) <> 0 Then
                  sValorEfet := TrocaCaracter(floattostr((strtoint(Copy(sLinha, iIniCampo[4], iTamCampo[4]))) / 100), ',', '.');

                // Ocorrências do Retorno
                sOcorrencias := quotedstr(trim(Copy(sLinha, iIniCampo[5], iTamCampo[5])));

                if (sCodDocArq <> EmptyStr) Then // Número do Documento da Empresa
                begin
                  // Atualizar a tabela com os dados do retorno
                  qryAux2.Close;
                  qryAux2.SQL.Clear;
                  qryAux2.SQL.add('UPDATE ARQUIVOXDOCUM            ');
                  qryAux2.SQL.add('SET                             ');

                  if (sDataEfet <> EmptyStr) then // Data da Efetivação
                    qryAux2.SQL.add('DATA_EFETIVACAO = ' + sDataEfet)
                  else
                    qryAux2.SQL.add('DATA_EFETIVACAO = NULL        ');

                  if (sValorEfet <> EmptyStr) then // Valor Real Efetivado
                    qryAux2.SQL.add(', VALOR_EFETIVADO = ' + sValorEfet)
                  else
                    qryAux2.SQL.add(', VALOR_EFETIVADO = 0.00      ');

                  qryAux2.SQL.add(', OCORRENCIA_RET = ' + sOcorrencias);
                  qryAux2.SQL.add('WHERE CODDOCARQ = ' + sCodDocArq);
                  qryAux2.ExecSQL;
                  //
                end;
              end;
            end;
          end;
        end;
        // Finalizando o Lançamento
        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.add('UPDATE ARQUIVOPAGTO            ');
        qryAux2.SQL.add('SET DTFINALIZAARQTXT = SYSDATE ');
        qryAux2.SQL.add(', USUFINALIZAARQTXT = ' + quotedstr(Sistema.NomeUsuario));
        qryAux2.SQL.add(', FLGENVIADO = ''F''           '); // Finalizado
        qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + inttostr(iCodArqPagto));
        qryAux2.ExecSQL;

        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

        qryMovRetorno.DisableControls;
        qryMovRetorno.Close;
        qryMovRetorno.ParamByName('IDARQUIVOPAGTO').asInteger := iCodArqPagto;
        qryMovRetorno.SQL.SaveToFile(sPathArquivosLog + '\SQL_SelMovRetorno.txt');
        qryMovRetorno.Open;

        if not qryMovRetorno.IsEmpty then
        begin
          qryTotaisRetorno.Close;
          qryTotaisRetorno.ParamByName('IDARQUIVOPAGTO').asInteger := iCodArqPagto;
          qryTotaisRetorno.Open;
        end
        else
          Application.MessageBox(MSG031, 'Atenção !', Mb_IconExclamation);

        qryMovRetorno.EnableControls;
        qryAux1.Close;
        qryAux2.Close;
        Cursor := crDefault;
        CloseFile(tArquivo);
      except
        begin
          CloseFile(tArquivo);
          Cursor := crDefault;
          Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
          Raise;
        end;
      end;
    end;
  end;
  
  qryMovRetorno.EnableControls;
end;

Procedure TFrmRemessaEletronica.dbgMovRetornoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If (Not qryMovRetorno.isEmpty) Then
    Begin
      If (field.FieldName = 'DESC_OCORRENCIA') Then
        If trim(qryMovRetorno.fieldbyname('TEVE_OCORRENCIA').asString) = 'SIM' Then
          dbgMovRetorno.Canvas.Font.Color := clRed;

      If field.FieldName = 'STATUS' Then
        If qryMovRetorno.fieldbyname('STATUS').asString = 'Baixado' Then
          dbgMovRetorno.Canvas.Font.Color := clRed;

      dbgMovRetorno.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronica.spbBaixarMovRetornoClick(Sender: TObject);
Begin
  Inherited;
  If Not qryMovRetorno.isEmpty Then
    Begin
      qryMovRetorno.DisableControls;
      If Not qryMovRetorno.Locate('STATUS', 'Baixado', []) Then
        Begin
          //edilaine - SIG75325 - inicio
          //If Application.MessageBox(pchar('Confirma Baixa do Arquivo Nº ' + qryMovRetorno.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
          If Application.MessageBox(pchar('Confirma Baixa do Arquivo Nº ' + qryMovRetorno.fieldByname('NSA').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
            Begin
              // Processar a Baixa dos Documentos de Retorno
              If _ProcessarBaixa('1',
                qryMovRetorno.fieldbyname('NOME_CONVENIO').asString,
                qryMovRetorno.fieldByname('IDARQUIVOPAGTO').asString,
                qryMovRetorno.fieldByname('NSA').asString,                 //edilaine - SIG75325
                qryMovRetorno.fieldbyname('CODPORTFORMA').asInteger,
                qryTotaisRetorno.fieldbyname('VLR_EFETIVADO').asFloat
                ) Then
                Begin
                  qryMovRetorno.Close;
                  qryMovRetorno.Open;
                End;
            End
        End
      Else
        //edilaine - SIG75325 - inicio
        //Application.MessageBox(pchar('Arquivo Nº ' + qryMovRetorno.fieldByname('IDARQUIVOPAGTO').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
        Application.MessageBox(pchar('Arquivo Nº ' + qryMovRetorno.fieldByname('NSA').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
        //edilaine - SIG75325 - fim

      qryMovRetorno.First;
      qryMovRetorno.EnableControls;
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.spbDesfazerBaixa3Click(Sender: TObject);
Begin
  Inherited;
  If Not qryMovRetorno.isEmpty Then
    Begin
      If qryMovRetorno.Locate('STATUS', 'Baixado', []) Then
        _ChamaFormDesfazerBaixa('R') // Retorno
      Else
        Application.MessageBox(MSG026, 'Atenção !', Mb_IconExclamation);
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.SpeedButton2Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqPendente.isEmpty Then
    Begin
      qeMovArqPend.FileName := sPathArquivosLog + '\ARQPENDENTE_MOVIMENTO.XLS';
      qeMovArqPend.Execute;
      cdsMovArqPendente.First;
    End;
End;

Procedure TFrmRemessaEletronica.SpeedButton9Click(Sender: TObject);
Begin
  Inherited;
  If Not qryMovRetorno.isEmpty Then
    Begin
      qeMovArqRet.FileName := sPathArquivosLog + '\ARQRETORNO_MOVIMENTO.XLS';
      qeMovArqRet.Execute;
      qryMovRetorno.First;
    End;
End;

Procedure TFrmRemessaEletronica.dbgMovArqFinalizadoDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If (Not cdsMovArqFinalizado.isEmpty) Then
    Begin
      If field.FieldName = 'STATUS' Then
        If cdsMovArqFinalizado.fieldbyname('STATUS').asString = 'Baixado' Then
          dbgMovArqFinalizado.Canvas.Font.Color := clRed;

      dbgMovArqFinalizado.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronica.dbgMovArqCanceladoDrawDataCell(
  Sender: TObject; Const Rect: TRect; Field: TField;
  State: TGridDrawState);
Begin
  Inherited;
  If (Not cdsMovArqCancelado.isEmpty) Then
    Begin
      If field.FieldName = 'STATUS' Then
        If cdsMovArqCancelado.fieldbyname('STATUS').asString = 'Baixado' Then
          dbgMovArqCancelado.Canvas.Font.Color := clRed;

      dbgMovArqCancelado.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronica.spbImpMovArqRetornoClick(Sender: TObject);
Begin
  Inherited;
  If (Not qryMovRetorno.isEmpty) Then
    Begin
      If CmpDadosParaImpRetorno.Execute Then
        Begin
          Screen.Cursor := crSQLWait;
          qryEmpresa.Close;
          qryEmpresa.Open;
          qryBancoFUNCEF.Close;
          qryBancoFUNCEF.ParamByName('codportforma').AsInteger := qryMovRetorno.fieldbyname('codportforma').AsInteger;
          qryBancoFUNCEF.Open;

          If CmpDadosParaImpRetorno.ParamValues[0].AsInteger <> 0 Then // Com ou Sem Ocorrências
            Begin
              qryMovRetorno.Filtered := False;
              If CmpDadosParaImpRetorno.ParamValues[0].AsInteger = 1 Then // Com Ocorrências
                qryMovRetorno.Filter := 'TEVE_OCORRENCIA = ''SIM'' '
              Else // Sem Ocorrências
                qryMovRetorno.Filter := 'TEVE_OCORRENCIA = ''NÃO'' ';
              qryMovRetorno.Filtered := True;
            End;

          TfrmPreview.CreateModalPreview(Application, rptMovArqRetorno, rptMovArqRetorno.PrinterSetup.DocumentName);
          qryMovRetorno.Filtered := False;
          qryMovRetorno.First;
          qryEmpresa.Close;
          qryBancoFUNCEF.Close;
          Screen.Cursor := crDefault;
        End;
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.ppGroupHeaderBand2BeforePrint(Sender: TObject);
Begin
  Inherited;
  If trim(qryMovRetorno.fieldbyname('TEVE_OCORRENCIA').asString) = 'SIM' Then
    pplblSit.Caption := 'Lançamentos COM Ocorrência(s):'
  Else
    pplblSit.Caption := 'Lançamentos SEM Ocorrência(s):';
End;

Procedure TFrmRemessaEletronica.spbExportaListaClick(Sender: TObject);
Begin
  Inherited;
  If Not qryMovListaFavorecidos.isEmpty Then
    Begin
      qeListaFavorecidos.FileName := sPathArquivosLog + '\REMESSA_LISTAFAVOREC.CSV';
      qeListaFavorecidos.Execute;
      qryMovListaFavorecidos.First;
    End;
End;

Procedure TFrmRemessaEletronica.spbRegerarArqClick(Sender: TObject);
Var sNomeArquivoGerado, sNomeCompletoArquivoRemessa, sNomeCompletoBackup, sTipCompromisso, sFinalidadeDOC: String;
    sNSA: String; //Cássio Rovaroto - SIG nº 75603
    sNomeCompletoArquivoRemessaServidor: string; //Cássio Rovaroto - SIG nº 101591
    sMsgErro: string; //Cássio Rovaroto - SIG nº 114764
Begin
  Inherited;
  If (Not cdsMovArqGerado.isEmpty) And (Not qryMovArqGeradoDet.isEmpty) Then
    Begin
      // Verificando se há parametrização específica do Convênio em questão
      If oRemessaEletronica._CarregaParamConvenio(dblkpConvenio2.LookupValue, sMsgErro) Then
        Begin
          If Not cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').isnull Then
            Begin
              If Application.MessageBox(pchar('Regerar Arquivo de Envio Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
              Begin
                //Everson Cunha - SIG84050 - Início
                if Copy(UpperCase(Sistema.AliasServidor),1,8) <> 'PRODUCAO' then  //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
                  Application.MessageBox(pchar('Em bases de testes, os arquivos são gravados em C:\Planus\Temp\RemessaEletronica\Remessa\ '), 'Atenção !', MB_ICONEXCLAMATION + MB_OK);
                //Everson Cunha - SIG84050 - Fim

                sNSA := cdsMovArqGerado.fieldByname('NSA').asString; //Cássio Rovaroto - SIG nº 75603
                // Montando o nome do Arquivo
                Screen.Cursor := crSQLWait;
                qryAux1.Close;
                qryAux1.SQL.Clear;
                qryAux1.SQL.add('SELECT ''ACC.'' || TO_CHAR(SYSDATE, ''DDMMYYYY.'') || TRIM(CONV.NUMEMPRESABANCO) || ''.'' || LPAD(:pIDARQUIVOPAGTO, 6, ''0'') || ''.rem'' AS NOME_ARQ_REM ');
                qryAux1.SQL.add('FROM PORTADORFORMA PO   ');
                qryAux1.SQL.add('LEFT JOIN SEQREMESSA CONV ON PO.NUMEMPRESABANCO = CONV.NUMEMPRESABANCO ');
                qryAux1.SQL.add('WHERE PO.CODPORTFORMA =:pCODPORTFORMA ');
                //Cássio Rovaroto - SIG nº 73883 - Início
                //qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString;
                qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := sNSA; //Cássio Rovaroto - SIG nº 75603
                //Cássio Rovaroto - SIG nº 73883 - Fim
                qryAux1.ParamByName('pCODPORTFORMA').AsString := cdsMovArqGerado.fieldByname('CODPORTFORMA').asString;
                qryAux1.Open;
                Screen.Cursor := crDefault;

                sNomeArquivoGerado := qryAux1.fieldByname('NOME_ARQ_REM').asString;

                //Caminho de gravação dos arquivos

                //Everson Cunha - SIG84050 - Início
                //sNomeCompletoArquivoRemessa := cdsMovArqPendente.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;
                //sNomeCompletoBackup := cdsMovArqPendente.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
                sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado; //Cássio Rovaroto - SIG nº 101591
                if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
                begin
                  sNomeCompletoArquivoRemessaServidor := cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado; //Cássio Rovaroto - SIG nº 101591
                  sNomeCompletoBackup := cdsMovArqPendente.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
                end
                else
                begin
                  //sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado; //Cássio Rovaroto - SIG nº 101591
                  sNomeCompletoBackup := 'C:\Planus\Temp\RemessaEletronica\Backup\' + sNomeArquivoGerado;
                end;
                //Everson Cunha = SIG84050 - Fim

                //Cássio Rovaroto - SIG nº 73883 - Início
                if oRemessaEletronica.Impersonate then
                begin
                  //Cássio Rovaroto - SIG nº 101591 - Início
                  if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessa)) then
                    ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessa));
                  //Cássio Rovaroto - SIG nº 101591 - Fim

                  If FileExists(sNomeCompletoArquivoRemessa) Then
                    DeleteFile(sNomeCompletoArquivoRemessa);
                  RevertToSelf;
                end;
                //Cássio Rovaroto - SIG nº 73883 - Fim

                // ROTINAS PARA GERAR O ARQUIVO (_GerarArquivo)
                If oRemessaEletronica._CriaArquivo(sNomeCompletoArquivoRemessa) Then
                Begin
                  Try
                    If Not dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.StartTransaction;

                    Screen.Cursor := crSQLWait;
                    cdsMovArqGerado.DisableControls;

                    oRemessaEletronica._GeraArquivoDeRemessa(sNomeCompletoArquivoRemessa,
                                                             cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString,
                                                             cdsMovArqGerado.fieldByname('CODPORTFORMA').asString,
                                                             cdsMovArqGerado.fieldByname('NSA').asString); // Número Sequencial do Arquivo

                    // Atualizando o Movimento
                    qryAux2.Close;
                    qryAux2.SQL.Clear;
                    qryAux2.SQL.add('UPDATE ARQUIVOPAGTO                                         ');
                    qryAux2.SQL.add('SET DTGERACAOARQTXT = SYSDATE                               ');
                    qryAux2.SQL.add(', USUGERACAOARQTXT = ' + quotedstr(Sistema.NomeUsuario)     );
                    qryAux2.SQL.add(', NOMEARQTXT = ' + quotedstr(sNomeArquivoGerado)            );
                    qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString);
                    qryAux2.ExecSQL;

                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.Commit;

                    //Cássio Rovaroto - SIG nº 73883 - Início
                    if oRemessaEletronica.Impersonate then
                    begin
                      //Everson Cunha - SIG84050 - Início
                      if not DirectoryExists(ExtractFileDir(sNomeCompletoBackup)) then
                        ForceDirectories(ExtractFileDir(sNomeCompletoBackup));
                      //Everson Cunha - SIG84050 - Fim

                      // Copiando o arquivo do diretório de remessa para o de backup
                      CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoBackup), False);

                      //Cássio Rovaroto - SIG nº 101591 - Início
                      if (Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO') then   //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
                      begin
                        if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessaServidor)) then
                          ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessaServidor));

                        // Copiando o arquivo do diretório de remessa para PRODUCAO
                        CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoArquivoRemessaServidor), False);

                        if FileExists(sNomeCompletoArquivoRemessa) Then
                          DeleteFile(pChar(sNomeCompletoArquivoRemessa));
                      end;
                      //Cássio Rovaroto - SIG nº 101591 - Fim    
                      RevertToSelf;
                    end;
                    //Cássio Rovaroto - SIG nº 73883 - Fim

                    Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' -> ' + sNomeArquivoGerado + ' <- Gerado com Sucesso !'), 'Atenção !', Mb_IconExclamation);

                    //Everson Cunha - WO1822 - Ini
                    //Imprime relatório "Relação de Pagamentos via Remessa Eletrônica - Modelo COFIN"
                    qryEmpresa.Close;
                    qryEmpresa.Open;
                    qryBancoFUNCEF.Close;
                    qryBancoFUNCEF.ParamByName('codportforma').AsInteger := cdsMovArqGerado.fieldbyname('codportforma').AsInteger;
                    qryBancoFUNCEF.Open;
                    TfrmPreview.CreateModalPreview(Application, rptMovGeradosCOFIN, rptMovGeradosCOFIN.PrinterSetup.DocumentName);
                    qryEmpresa.Close;
                    qryBancoFUNCEF.Close;
                    //Everson Cunha - WO1822 - Fim

                    cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'S');

                    qryMovArqGeradoDet.Close;
                    qryMovArqGeradoDet.Open;
                    qryAux.Close;
                    qryAux1.Close;
                    qryAux2.Close;
                    Screen.Cursor := crDefault;
                    cdsMovArqGerado.EnableControls;
                  Except
                    On E: Exception Do
                    Begin
                      if dtmBaseDados.dbBaseDados.InTransaction Then
                        dtmBaseDados.dbBaseDados.RollBack;

                      Screen.Cursor := crDefault;
                      cdsMovArqGerado.EnableControls;
                      Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                    End;
                  End
                End
                Else
                  Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' Não Gerado. Verifique !'), 'Atenção !', Mb_IconExclamation);
              End
            End
          Else
            Application.MessageBox(MSG022, 'Atenção !', Mb_IconExclamation);
        End
      Else
        Application.MessageBox(pchar('Convênio -> ' + dblkpConvenio2.Text + ' não possui Parametrização definida. Verifique !'), 'Atenção !', Mb_IconExclamation)
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.DblCodFormaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  If sFormaPagtoAnt <> DblCodForma.LookupValue Then
    bAltFormPagto := True;
End;

Procedure TFrmRemessaEletronica.DblCodFormaEnter(Sender: TObject);
Begin
  Inherited;
  sFormaPagtoAnt := DblCodForma.LookupValue;
End;

procedure TFrmRemessaEletronica._InsereDocumentoXPessoa(pNome, pDocumento, pBanco, pAgencia, pConta, pTipoConta, pOperacao: string;
    pValor: double; pCodDocumento: Integer; pIdForCli: Integer; pIdCBancaria: Integer);
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.add('SELECT SEQDOCXPESSOAS.NEXTVAL SEQ FROM DUAL    ');
  qryAux.Open;

  qryMovListaFavorecidos.Insert;
  if pCodDocumento <> -1 then
    qryMovListaFavorecidos.FieldByName('CODDOCUMENTO').AsInteger := pCodDocumento;
  qryMovListaFavorecidos.FieldByName('IDDOCUMENTOXPESSOAS').asInteger := qryAux.fieldByname('SEQ').asInteger;

  if pIdForCli <> -1 then
    qryMovListaFavorecidos.FieldByName('IDFORCLI').AsInteger := pIdForCli
  else
    qryMovListaFavorecidos.FieldByName('IDFORCLI').AsString := EmptyStr;

  qryMovListaFavorecidos.FieldByName('RAZAOSOCIAL').AsString := pNome;
  qryMovListaFavorecidos.FieldByName('NUMDOCUMENTO').AsString := pDocumento;
  qryMovListaFavorecidos.FieldByName('IDCBANCARIA').AsInteger := pIdCBancaria;
  qryMovListaFavorecidos.FieldByName('NUMBANCO').AsString := pBanco;
  qryMovListaFavorecidos.FieldByName('NUMAGENCIA').AsString := pAgencia;
  qryMovListaFavorecidos.FieldByName('NUMOPERACAO').AsString := pOperacao;
  qryMovListaFavorecidos.FieldByName('NUMCONTA').AsString := pConta;
  qryMovListaFavorecidos.FieldByName('TIPOCONTA').AsString := pTipoConta;
  qryMovListaFavorecidos.FieldByName('VALOR').AsFloat := pValor;
  qryMovListaFavorecidos.FieldByName('FLGIMPORTADO').AsString := 'S'; // Sim
 qryMovListaFavorecidos.Post;
end;

procedure TFrmRemessaEletronica._GetFavorecidosAutomatico(pIdModuloAcesso: Integer; pConvenio, pFormaPagto: String;
    pDataIni, pDataFim: TDateTime; pCodDocumento, pIdhstFolhaBenef: Integer);
var
  cdsAux: TCMClientDataSet;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  try
    case pIdModuloAcesso of
      15: cdsAux.Data := oRemessaEletronica._GetFavorecidosEmp(pConvenio, pDataIni, pDataFim, pCodDocumento);
      18: cdsAux.Data := oRemessaEletronica._GetFavorecidosFB(pConvenio, pDataIni, pDataFim, pCodDocumento);
      21: cdsAux.Data := oRemessaEletronica._GetFavorecidosFP(pConvenio, pFormaPagto, pDataIni, pDataFim);
    end;

    if not cdsAux.IsEmpty then
    begin
      try
        if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

        cdsAux.First;
        while not cdsAux.Eof do
        begin
          _InsereDocumentoXPessoa(cdsAux.FieldByName('NOME').asString,
                                  cdsAux.FieldByname('CPF').asString,
                                  cdsAux.FieldByName('NUMBANCO').AsString,
                                  cdsAux.FieldByName('CODAGENCIA').AsString,
                                  cdsAux.FieldByName('CONTA').AsString,
                                  cdsAux.FieldByName('TIPOCONTA').asString,
                                  cdsAux.FieldByName('NUMOPERACAO').asString,
                                  cdsAux.FieldByName('LIQUIDO').asFloat,
                                  cdsAux.FieldByName('CODDOCUMENTO').asInteger,
                                  cdsAux.FieldByName('IDPESSOA').AsInteger,
                                  cdsAux.FieldByName('IDCBANCARIA').AsInteger);

          cdsAux.Next;
        end;
        qryMovListaFavorecidos.ApplyUpdates;

        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

        qryMovListaFavorecidos.Close;
        qryMovListaFavorecidos.Open;
        qryMovListaFavorecidos.EnableControls;
        cdsMovRemessaAfterScroll(cdsMovRemessa);
      except
        Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
      end;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;

// Paulo Nobre - WO32452 - Inicio
{function TFrmRemessaEletronica._GetMovListaFavoritoFP: string;
begin
  Result := 'SELECT DX.CODDOCUMENTO,  ' + #13#10 +
            '       DX.IDDOCUMENTOXPESSOAS,  ' + #13#10 +
            '       DX.IDFORCLI,  ' + #13#10 +
            '       DX.RAZAOSOCIAL,  ' + #13#10 +
            '       DX.NUMDOCUMENTO,  ' + #13#10 +
            '       CAST(CASE  ' + #13#10 +
            '       WHEN LENGTH (TRIM(DX.NUMDOCUMENTO)) = 11 THEN  ' + #13#10 +

            '       WHEN LENGTH (TRIM(DX.NUMDOCUMENTO)) = 14 THEN  ' + #13#10 +

            '       WHEN DX.NUMDOCUMENTO IS NULL THEN  ' + #13#10 +
            '         NULL  ' + #13#10 +
            '       END AS VARCHAR2(18)) CPF_CNPJ_MASC,  ' + #13#10 +
            '       DX.IDCBANCARIA,  ' + #13#10 +
            '       DX.NUMBANCO,  ' + #13#10 +
            '       DX.NUMAGENCIA,  ' + #13#10 +
            '       NVL(DX.NUMOPERACAO, 0) NUMOPERACAO,  ' + #13#10 +
            '       DX.NUMCONTA,  ' + #13#10 +
            '       DX.TIPOCONTA,  ' + #13#10 +
            '       DX.VALOR,  ' + #13#10 +
            '       DX.FLGIMPORTADO,  ' + #13#10 +
            '       DX.CODFORMA,  ' + #13#10 +
            '       DX.CODPORTFORMA,  ' + #13#10 +
            '       DX.IDMOTIVO,  ' + #13#10 +
            '       DX.DATAPROGRAMADA  ' + #13#10 +
            '  FROM DOCUMENTOXPESSOAS DX  ' + #13#10 +
            ' WHERE DX.CODFORMA = :CODPORTFORMA'  + #13#10 +
            '   AND DX.CODPORTFORMA = :CODPORTFORMA'  + #13#10 +
            '   AND DX.IDMOTIVO = :IDMOTIVO'  + #13#10 +
            '   AND DX.DATAPROGRAMADA = :DATAPROGRAMADA'  + #13#10 +
            ' ORDER BY DX.FLGIMPORTADO, DX.RAZAOSOCIAL, DX.VALOR';
end;

function TFrmRemessaEletronica._GetMovListaFavoritoCP: string;
begin
  Result := 'SELECT DX.CODDOCUMENTO,  ' + #13#10 +
            '       DX.IDDOCUMENTOXPESSOAS,  ' + #13#10 +
            '       DX.IDFORCLI,  ' + #13#10 +
            '       DX.RAZAOSOCIAL,  ' + #13#10 +
            '       DX.NUMDOCUMENTO,  ' + #13#10 +
            '       CAST(CASE  ' + #13#10 +
            '       WHEN LENGTH (TRIM(DX.NUMDOCUMENTO)) = 11 THEN  ' + #13#10 +

            '       WHEN LENGTH (TRIM(DX.NUMDOCUMENTO)) = 14 THEN  ' + #13#10 +

            '       WHEN DX.NUMDOCUMENTO IS NULL THEN  ' + #13#10 +
            '         NULL  ' + #13#10 +
            '       END AS VARCHAR2(18)) CPF_CNPJ_MASC,  ' + #13#10 +
            '       DX.IDCBANCARIA,  ' + #13#10 +
            '       DX.NUMBANCO,  ' + #13#10 +
            '       DX.NUMAGENCIA,  ' + #13#10 +
            '       NVL(DX.NUMOPERACAO, 0) NUMOPERACAO,  ' + #13#10 +
            '       DX.NUMCONTA,  ' + #13#10 +
            '       DX.TIPOCONTA,  ' + #13#10 +
            '       DX.VALOR,  ' + #13#10 +
            '       DX.FLGIMPORTADO,  ' + #13#10 +
            '       DX.CODFORMA,  ' + #13#10 +
            '       DX.CODPORTFORMA,  ' + #13#10 +
            '       DX.IDMOTIVO,  ' + #13#10 +
            '       DX.DATAPROGRAMADA  ' + #13#10 +
            '  FROM DOCUMENTOXPESSOAS DX  ' + #13#10 +
            ' WHERE DX.CODDOCUMENTO = :CODDOCUMENTO' + #13#10 +
            ' ORDER BY DX.FLGIMPORTADO, DX.RAZAOSOCIAL, DX.VALOR';
end;
}

procedure TFrmRemessaEletronica._RegistraTarifaBancaria(
  pIdArquivoPagto: integer);
var
  sSQL: string;
begin
  sSQL := ' SELECT AD.IDARQUIVOPAGTO, NVL(DP.CODDOCUMENTO, AD.ID_DOC_CODBARRAS_PESSOAS) AS CODLINHA   ' +#13#10+
          '   FROM ARQUIVOXDOCUM AD                                                                   ' +#13#10+
          '   LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AD.ID_DOC_CODBARRAS_PESSOAS  ' +#13#10+
          '  WHERE AD.IDARQUIVOPAGTO = ' + IntToStr(pIdArquivoPagto)                                    +#13#10+
          '  GROUP BY AD.IDARQUIVOPAGTO, NVL(DP.CODDOCUMENTO, AD.ID_DOC_CODBARRAS_PESSOAS)            ';

  qryAux1.Close;
  qryAux1.SQL.Clear;
  qryAux1.SQL.Add(sSQL);
  qryAux1.Open;

  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    qryAux1.First;
    iContador := 0;
    frmProgresso.MostraFormProgresso('Aguarde, gerando os valores das tarifas bancárias...', True, False, True, 0, qryAux1.RecordCount);
    while not qryAux1.Eof do
    begin
        _SetTarifaBancaria(pIdArquivoPagto, qryAux1.FieldByName('CODLINHA').asInteger);
        qryAux1.Next;
        oRemessaEletronica._AtualizaFrmProgresso(iContador);
    end;

  except
    on e: Exception do
    begin
      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

      Application.MessageBox(pChar(e.Message), 'Atenção!', MB_ICONEXCLAMATION);
    end;
  end;
  frmProgresso.EscondeFormProgresso;
end;

procedure TFrmRemessaEletronica._SetTarifaBancaria(pIdArquivoPagto,
  pCodDocumento: Integer);
var
  sSQL : string;
begin
  sSQL := 'INSERT INTO TARIFAARQPAGTO(IDTARIFAARQPAGTO, IDARQUIVOPAGTO, CODDOCARQ, IDPLANOPREV, IDPATRO, PERCENTUAL) ' +#13#10+
          '       SELECT SEQTARIFAARQPAGTO.NEXTVAL,                                                                  ' +#13#10+
          '              AD.IDARQUIVOPAGTO,                                                                          ' +#13#10+
          '              AD.CODDOCARQ,                                                                               ' +#13#10+
          '              AR.IDPLANOPREV,                                                                             ' +#13#10+
          '              AR.IDPATRO,                                                                                 ' +#13#10+
          '              AR.VALOR                                                                                    ' +#13#10+
          '         FROM ARQUIVOXDOCUM AD                                                                            ' +#13#10+
          '         LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AD.ID_DOC_CODBARRAS_PESSOAS           ' +#13#10+
          '         JOIN (SELECT R.CODDOCUMENTO, (SUM(R.VALOR) / RT.VALOR) AS VALOR, R.IDPLANOPREV, R.IDPATRO        ' +#13#10+
          '                 FROM RATEIODOCUM R                                                                       ' +#13#10+
          '                 JOIN (SELECT CODDOCUMENTO, SUM(VALOR) AS VALOR                                           ' +#13#10+
          '                         FROM RATEIODOCUM                                                                 ' +#13#10+
          '                        GROUP BY CODDOCUMENTO) RT                                                         ' +#13#10+
          '                   ON RT.CODDOCUMENTO = R.CODDOCUMENTO                                                    ' +#13#10+
          '                 WHERE R.CODDOCUMENTO = ' + IntToStr(pCodDocumento)                                         +#13#10+
          '                 GROUP BY R.CODDOCUMENTO, R.IDPLANOPREV, R.IDPATRO, RT.VALOR) AR                          ' +#13#10+
          '           ON (AR.CODDOCUMENTO = AD.ID_DOC_CODBARRAS_PESSOAS) OR (AR.CODDOCUMENTO = DP.CODDOCUMENTO)      ' +#13#10+
          '        WHERE AD.IDARQUIVOPAGTO = ' + IntToStr(pIdArquivoPagto);

  qryAux3.Close;
  qryAux3.SQL.Clear;
  qryAux3.SQL.Add(sSQL);
  qryAux3.SQL.SaveToFile(sPathArquivosLog + '\SQL_InsereTarifaBancoCap.txt');
  qryAux3.ExecSQL;
end;

procedure TFrmRemessaEletronica.DblCodFormaExit(Sender: TObject);
begin
  inherited;
  if DblCodForma.Value <> '' then
    edtCodReceita.Text := cdsTipoPagtoGeral.fieldbyname('CODFORMABANCO').AsString
  else
    edtCodReceita.Text := '';
end;

procedure TFrmRemessaEletronica.DblCodFormaChange(Sender: TObject);
begin
  inherited;
  if DblCodForma.Value <> '' then
    edtCodReceita.Text := cdsTipoPagtoGeral.fieldbyname('CODFORMABANCO').AsString
  else
    edtCodReceita.Text := '';
end;

//Everson Cunha - SIG84050 - Início
procedure TFrmRemessaEletronica.btnLimparINSSClick(Sender: TObject);
begin
  inherited;

  If qryINSS.state in [dsInsert, dsEdit] Then
  begin
    qryINSS.fieldByname('COMPETENCIA').AsString := EmptyStr;
    qryINSS.fieldByname('IDBENEFINSS').AsString := EmptyStr;
    qryINSS.fieldByname('RAZAOSOCIAL').AsString := EmptyStr;
    qryINSS.fieldByname('NUMDOCUMENTO').AsString := EmptyStr;
    qryINSS.fieldByname('VLRINSS').AsString := EmptyStr;
    qryINSS.fieldByname('VLROUTRAS_ENTIDADES').AsString := EmptyStr;
    qryINSS.fieldByname('VLRMULTA').AsString := EmptyStr;
    qryINSS.fieldByname('VLRTOTAL').AsString := EmptyStr;
  end;

  mkeMesAnoComp.Text := '';
  edtRazaoSocialGPS.Text := '';
  edtNumDocumentoGPS.Text := '';
  dbeVLRINSS.Text := '';
  dbeVLROUTRAS_ENTIDADES.Text := '';
  dbeVLRMULTA.Text := '';
  dbeVLRTOTAL_INSS.Text := '';
end;
//Everson Cunha - SIG84050 - Fim

// Everson Cunha - SIG84050 - Início
procedure TFrmRemessaEletronica.HabilitaDesabilitaCampos;
begin
  //Cássio Rovaroto - SIG nº 100343 - Início
  //if (cdsMovRemessa.FieldByName('IDMODULO').AsInteger <> 24) then
  //begin
    //GPS
    mkeMesAnoComp.Enabled := qryINSS.State <> dsBrowse;

    //Cássio Rovaroto - SIG nº 100662 - Início
    btnRazaoSocialGPS.Enabled := qryINSS.State <> dsBrowse;
    btnLimparRazaoSocialGPS.Enabled := qryINSS.State <> dsBrowse;
    dbeVLRINSS.Enabled := qryINSS.State <> dsBrowse;
    dbeVLROUTRAS_ENTIDADES.Enabled := qryINSS.State <> dsBrowse;
    dbeVLRMULTA.Enabled := qryINSS.State <> dsBrowse;
    dbeVLRTOTAL_INSS.Enabled := qryINSS.State <> dsBrowse;

    btnLimparINSS.Enabled := qryINSS.State <> dsBrowse;

    //DARF
    dtApuracao_DARF.Enabled := qryDARF.State <> dsBrowse;
    dbeNUMDOCUMENTO.Enabled := qryDARF.State <> dsBrowse;
    dbeCODNATUREZA.Enabled := qryDARF.State <> dsBrowse;
    dtDATAVENCDARF.Enabled := qryDARF.State <> dsBrowse;
    dbeVLRIRRF.Enabled := qryDARF.State <> dsBrowse;
    dbeVLRMULTA_DARF.Enabled := qryDARF.State <> dsBrowse;
    dbeVLRJUROS.Enabled := qryDARF.State <> dsBrowse;
    //dbeVLRTOTAL.Enabled := qryDARF.State <> dsBrowse;
    dbeVLRTOTAL.Enabled := False;

    btnLimparDARF.Enabled := qryDARF.State <> dsBrowse;
  //end
  //else
  //begin
    //GPS
  //  mkeMesAnoComp.Enabled := False;
  //  btnRazaoSocialGPS.Enabled := False;
  //  btnLimparRazaoSocialGPS.Enabled := False;
  //  dbeVLRINSS.Enabled := False;
  //  dbeVLROUTRAS_ENTIDADES.Enabled := False;
  //  dbeVLRMULTA.Enabled := False;
  //  dbeVLRTOTAL_INSS.Enabled := False;

  //  btnLimparINSS.Enabled := False;

    //DARF
  //  dtApuracao_DARF.Enabled := False;
  //  dbeNUMDOCUMENTO.Enabled := False;
  //  dbeCODNATUREZA.Enabled := False;
  //  dtDATAVENCDARF.Enabled := False;
  //  dbeVLRIRRF.Enabled := False;
  //  dbeVLRMULTA_DARF.Enabled := False;
  //  dbeVLRJUROS.Enabled := False;
  //  dbeVLRTOTAL.Enabled := False;

  //  btnLimparDARF.Enabled := False;
  //end;
  //Cássio Rovaroto - SIG nº 100343 - Fim

  //AP Agrupada
  btnAltAp_Agrupada.Enabled := not qryAp_Agrupada.isEmpty; //Everson Cunha - SIG117206
end;
// Everson Cunha - SIG84050 - Fim

// Everson Cunha - SIG84050 - Início
procedure TFrmRemessaEletronica.btnLimparDARFClick(Sender: TObject);
begin
  inherited;

  If qryDARF.state in [dsInsert, dsEdit] Then
  begin
    qryDARF.fieldByname('DATAFINALAPURACAO').AsString := EmptyStr;
    qryDARF.fieldByname('NUMDOCUMENTO').AsString := EmptyStr;
    qryDARF.fieldByname('CODNATUREZA').AsString := EmptyStr;
    qryDARF.fieldByname('DATAVENCDARF').AsString := EmptyStr;
    qryDARF.fieldByname('VLRIRRF').AsString := EmptyStr;
    qryDARF.fieldByname('VLRMULTA').AsString := EmptyStr;
    qryDARF.fieldByname('VLRJUROS').AsString := EmptyStr;
    qryDARF.fieldByname('VLRTOTAL').AsString := EmptyStr;
  end;

  dtApuracao_DARF.Text := '';
  dbeNUMDOCUMENTO.Text := '';
  dbeCODNATUREZA.Text := '';
  dtDATAVENCDARF.Text := '';
  dbeVLRIRRF.Text := '';
  dbeVLRMULTA_DARF.Text := '';
  dbeVLRJUROS.Text := '';
  dbeVLRTOTAL.Text := '';
end;
// Everson Cunha - SIG84050 - Fim

// Everson Cunha - SIG84050 - Início
procedure TFrmRemessaEletronica.btnRazaoSocialGPSClick(Sender: TObject);
begin
  inherited;

  If MSFavorec.Executar = MrOk Then
  If MSFavorec.ValoresChave[0] <> EmptyStr Then
  Begin
    edtRazaoSocialGPS.Text := MSFavorec.ValoresChave[2]; // RAZAOSOCIAL
    edtNumDocumentoGPS.Text := MSFavorec.ValoresChave[1]; // NUMDOCUMENTO
    qryINSS.fieldByname('IDBENEFINSS').asString := MSFavorec.ValoresChave[0]; // IDPESSOA
  End;
end;
// Everson Cunha - SIG84050 - Fim

// Everson Cunha - SIG84050 - Início
procedure TFrmRemessaEletronica.btnLimparRazaoSocialGPSClick(Sender: TObject);
begin
  inherited;

  If qryINSS.state in [dsInsert, dsEdit] Then
  begin
    qryINSS.fieldByname('IDBENEFINSS').AsString := EmptyStr;
    qryINSS.fieldByname('RAZAOSOCIAL').AsString := EmptyStr;
    qryINSS.fieldByname('NUMDOCUMENTO').AsString := EmptyStr;
  end;

  edtRazaoSocialGPS.Text := '';
  edtNumDocumentoGPS.Text := '';
end;
// Everson Cunha - SIG84050 - Fim

procedure TFrmRemessaEletronica.AtualizaValorTotal_DARF_INSS(
  pTipo: integer);
begin
  if pTipo = 1 then // INSS
  begin
    qryINSS.FieldByName('VLRTOTAL').AsFloat := (dValorINSS + dValorATM + dValorEntidadesINSS);
    dValorTotalINSS := qryINSS.FieldByName('VLRTOTAL').AsFloat;
  end
  else // DARF
  begin
    qryDARF.FieldByName('VLRTOTAL').AsFloat := (dValorDARF + dValorMultaDARF + dValorJurosDARF);
    dValorTotalDARF := qryDARF.FieldByName('VLRTOTAL').AsFloat;
  end;
end;

procedure TFrmRemessaEletronica.dbeVLRINSSExit(Sender: TObject);
begin
  inherited;
  dValorINSS := qryINSS.FieldByName('VLRINSS').AsFloat;
  AtualizaValorTotal_DARF_INSS(1);
end;

procedure TFrmRemessaEletronica.dbeVLRMULTAExit(Sender: TObject);
begin
  inherited;
  dValorATM := qryINSS.FieldByName('VLRMULTA').AsFloat;
  AtualizaValorTotal_DARF_INSS(1);
end;

procedure TFrmRemessaEletronica.dbeVLROUTRAS_ENTIDADESExit(
  Sender: TObject);
begin
  inherited;
  dValorEntidadesINSS := qryINSS.FieldByName('VLROUTRAS_ENTIDADES').AsFloat;
  AtualizaValorTotal_DARF_INSS(1);
end;

procedure TFrmRemessaEletronica.dbeVLRIRRFExit(Sender: TObject);
begin
  inherited;
  dValorDARF := qryDARF.FieldByName('VLRIRRF').AsFloat;
  AtualizaValorTotal_DARF_INSS(2);
end;

procedure TFrmRemessaEletronica.dbeVLRMULTA_DARFExit(Sender: TObject);
begin
  inherited;
  dValorMultaDARF := qryDARF.FieldByName('VLRMULTA').AsFloat;
  AtualizaValorTotal_DARF_INSS(2);
end;

procedure TFrmRemessaEletronica.dbeVLRJUROSExit(Sender: TObject);
begin
  inherited;
  dValorJurosDARF := qryDARF.FieldByName('VLRJUROS').AsFloat;
  AtualizaValorTotal_DARF_INSS(2);
end;

function TFrmRemessaEletronica._GetValorPlano(
  pIdPlanoPrev: Integer): Double;
var
  dValorPlano: Double;
begin
  dValorPlano := 0.00;

  qryMovListaFavorecidos.Filtered := False;
  qryMovListaFavorecidos.Filter := 'IDPLANOPREV = ' + IntToStr(pIdPlanoPrev);
  qryMovListaFavorecidos.Filtered := True;

  qryMovListaFavorecidos.First;
  while not qryMovListaFavorecidos.Eof do
  begin
    if not qryMovListaFavorecidos.FieldByName('VALOR').IsNull then
     dValorPlano := dValorPlano + qryMovListaFavorecidos.FieldByName('VALOR').AsFloat;
    qryMovListaFavorecidos.Next;
  end;
  qryMovListaFavorecidos.Filtered := False;
  qryMovListaFavorecidos.First;

  Result := dValorPlano;
end;

procedure TFrmRemessaEletronica.ExibeCampos(iIdModulo: integer);
begin
  if iIdModulo <> 3 then
  begin
    tbsAnManGeral.Enabled := False;
    btnAltGeral.Enabled := False;
    Dock977.Enabled := False;
    DblCodForma.Enabled := False;
    SpeedButton5.Enabled := False;
    SpeedButton3.Enabled := False;
    rdgTipoTituloGeral.Enabled := False;
    DbeCodigoBarrasGeral.Enabled := False;
    btnInc1.Enabled := False;
    btnAlt1.Enabled := False;
    btnExc1.Enabled := False;
    spbImportarMovLista.Enabled := False;
    spbLimparMovLista.Enabled := False;
    Label5.Visible := False;
    Image1.Visible := False;
    edSaldoListaFav.Visible := False;
    Dock973.Enabled := False;
    spbLocalizaFavorec.Enabled := False;
    spbBuscaContaCor.Enabled := False;
    dbeValorPagtoLista.Enabled := False;
    tbsAnManTitulos.Enabled := False;
    btnIncTit.Enabled := False;
    btnAltTit.Enabled := False;
    btnExcTit.Enabled := False;
    Label10.Visible := False;
    Image2.Visible := False;
    edSaldoTitulo.Visible := False;
    rdgTipoTitulo.Enabled := False;
    dbeCodigoBarrasTitulos.Enabled := False;
    dbDataVenctoBoleto.Enabled := False;
    dbeValorPagto.Enabled := False;
    dbCPFCNPJ.Enabled := False;
    Dock975.Enabled := False;
    spbBaixarMovArqGeradoPend.Visible := False;
    spbGerarArq.Left := spbBaixarMovArqGeradoPend.Left;
    spbDesfazerBaixa.Visible := False;
    spbBaixarMovArqGerado.Visible := False;
    spbImpMovArqGerado.Left := (spbRegerarArq.Left + 75);
    spbRegerarArq.Left := spbBaixarMovArqGerado.Left;
    spbDesfazerBaixa2.Visible := False;
    spbBaixarMovRetorno.Visible:= False;
    spbImpMovArqRetorno.Left := spbBaixarMovRetorno.Left;
    spbDesfazerBaixa3.Visible := False;
  end
  else
  begin
    tbsAnManGeral.Visible := True;
    btnAltGeral.Visible := True;
    Dock977.Visible := True;
    DblCodForma.Enabled := True;
    SpeedButton5.Enabled := True;
    SpeedButton3.Enabled := True;
    rdgTipoTituloGeral.Enabled := True;
    DbeCodigoBarrasGeral.Enabled := True;
    btnInc1.Enabled := True;
    btnAlt1.Enabled := True;
    btnExc1.Enabled := True;
    spbImportarMovLista.Enabled := True;
    spbLimparMovLista.Enabled := True;
    Label5.Visible := True;
    Image1.Visible := True;
    edSaldoListaFav.Visible := True;
    tbsAnManTitulos.Enabled := True;
    btnIncTit.Enabled := True;
    btnAltTit.Enabled := True;
    btnExcTit.Enabled := True;
    Label10.Visible := True;
    Image2.Visible := True;
    edSaldoTitulo.Visible := True;
    rdgTipoTitulo.Enabled := True;
    dbeCodigoBarrasTitulos.Enabled := True;
    dbDataVenctoBoleto.Enabled := True;
    dbeValorPagto.Enabled := True;
    dbCPFCNPJ.Enabled := True;
    Dock975.Enabled := True;
    spbBaixarMovArqGeradoPend.Visible := True;
    spbDesfazerBaixa.Visible := True;
    spbBaixarMovArqGerado.Visible := True;
    spbDesfazerBaixa2.Visible := True;
    spbBaixarMovRetorno.Visible:= True;
    spbDesfazerBaixa3.Visible := True;
  end;
end;

//procedure TFrmRemessaEletronica.ExlcuiFavorecidosNaoGerados;                        //Everson Cunha - SIG117008
procedure TFrmRemessaEletronica.ExcluiFavorecidosNaoGerados(pCodDocumentos : string); //Everson Cunha - SIG117008
var
  sSQL: string;
begin
  sSQL :=  'DELETE FROM DOCUMENTOXPESSOAS DX WHERE NOT EXISTS(SELECT 1 FROM ARQUIVOXDOCUM AD WHERE AD.ID_DOC_CODBARRAS_PESSOAS = DX.IDDOCUMENTOXPESSOAS)' +
           ' AND DX.CODDOCUMENTO IN (' + pCodDocumentos + ') AND DX.FLGIMPORTADO = ''S'' '; //Everson Cunha - SIG117008
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    qryAux.Close;
    qryAux.SQL.Text:= sSQL;
    qryAux.ExecSQL;

    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
  except
    begin
      Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
      raise;
    end;
  end;
end;

procedure TFrmRemessaEletronica.bbtnSairClick(Sender: TObject);
begin

  //if iIdModuloAcesso <> 3 then //Cássio Rovaroto - SIG nº 101677 //Everson Cunha - SIG117008
  //  ExlcuiFavorecidosNaoGerados; //Everson Cunha - SIG117008
    
  inherited;
end;


procedure TFrmRemessaEletronica.dbLkpConvenioRetClick(Sender: TObject);
begin
  inherited;
  dbLkpConvenioRet.DropDown;
end;

procedure TFrmRemessaEletronica._getRazaoSocialGPSAutonomo;
var
 cdsAux: TCMClientDataSet;
begin
  try
    cdsAux := TCMClientDataSet.Create(nil);
    cdsAux.Data := oRemessaEletronica.GetDadosGPSAutonomo;
    edtRazaoSocialGPS.Text := cdsAux.FieldByName('RAZAOSOCIAL').AsString; // RAZAOSOCIAL
    edtNumDocumentoGPS.Text := cdsAux.FieldByName('NUMDOCUMENTO').AsString; // NUMDOCUMENTO
    qryINSS.fieldByname('IDBENEFINSS').asString := cdsAux.FieldByName('IDPESSOA').AsString; // IDPESSOA

  finally
    FreeAndNil(cdsAux);
  end;
end;

//edilaine SIG112509 : inicio
procedure TFrmRemessaEletronica.dbeValorPagtoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sBoleto : string;
begin
  inherited;

  qryMovTitulos.fieldbyname('VLRPAGTO').asFloat  := dbeValorPagto.value;

end;
//edilaine SIG112509 : fim


procedure TFrmRemessaEletronica.btnAltAp_AgrupadaClick(Sender: TObject);
begin
  inherited;

  if not qryAp_Agrupada.isEmpty then
  begin
    btnAltAp_Agrupada.down := True;
    pnlInfMan.Enabled := False;
    pnlCritSel.Enabled := False;

    if qryAp_Agrupada.State <> dsEdit then
    begin
      try
        if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

        pnlAp_Agrupada.enabled := True;
        btnOkAp_Agrupada.Enabled := True;
        btnCancAp_Agrupada.Enabled := True;

        dbeCodBarrasAp_Agrupada.enabled := (rdgTipoBoletoAp_Agrupada.itemindex > -1);

        qryAp_Agrupada.Edit;
      except
        btnCancAp_AgrupadaClick(Self);
        raise;
      end;
    end
    else
    begin
      btnAltAp_Agrupada.Down := False;
      pnlInfMan.Enabled := True;
      pnlCritSel.Enabled := True;
    end;
  end;
end;

procedure TFrmRemessaEletronica.btnCancAp_AgrupadaClick(Sender: TObject);
begin
  inherited;

  if dtmBaseDados.dbBaseDados.InTransaction then
  begin
    If qryAp_Agrupada.state = dsEdit Then
      qryAp_Agrupada.CancelUpdates;

    dtmBaseDados.dbBaseDados.RollBack;
  End;

  qryAp_AgrupadaAfterScroll(qryAp_Agrupada);

  pnlAp_Agrupada.enabled := False;
  pnlInfMan.Enabled := True;
  pnlCritSel.Enabled := True;
  btnOkAp_Agrupada.Enabled := False;
  btnCancAp_Agrupada.Enabled := False;
  btnAltAp_Agrupada.Down := False;
end;

procedure TFrmRemessaEletronica.btnOkAp_AgrupadaClick(Sender: TObject);
var sCodGrupoCNAB: String;
begin
  inherited;

  if trim(dbeCodBarrasAp_Agrupada.Text) <> EmptyStr then
  begin
    if rdgTipoBoletoAp_Agrupada.Itemindex = 0 then // Ficha de Compensação
    begin
      if length(dbeCodBarrasAp_Agrupada.Text) <> 47 then
      begin
        Application.MessageBox(MSG013, 'Atenção !', Mb_IconExclamation);
        dbeCodBarrasAp_Agrupada.setfocus;
        dbeCodBarrasAp_Agrupada.SelectAll;

        Exit;
      end;

      if not oRemessaEletronica._ValidaCodBarrasFichaComp(dbeCodBarrasAp_Agrupada.Text, 10) then
      begin
        Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
        dbeCodBarrasAp_Agrupada.setfocus;
        dbeCodBarrasAp_Agrupada.SelectAll;

        exit;
      end;
      //if RoundCM(edtValorBoletoAp_Agrupada.Value,2) <> cdsMovRemessa.fieldbyname('VALOR').asFloat then  // Paulo Nobre - WO28166
      If (floattostr(edtValorBoletoAp_Agrupada.value) <> cdsMovRemessa.fieldbyname('VALOR').asString) then  // Paulo Nobre - WO32908
      begin
        Application.MessageBox(MSG035, 'Atenção !', Mb_IconExclamation);
        dbeCodBarrasAp_Agrupada.setfocus;
        dbeCodBarrasAp_Agrupada.SelectAll;
        Exit;
      end;
    end
    else // Arrecadação
    begin
      if (copy(dbeCodBarrasAp_Agrupada.Text, 2, 1) = '9') and // Segmento - Exclusivo do Banco
      (copy(dbeCodBarrasAp_Agrupada.Text, 17, 4) <> '0104') then // <> do Banco Caixa
      begin
        Application.MessageBox(MSG030, 'Atenção !', Mb_IconExclamation);
        dbeCodBarrasAp_Agrupada.setfocus;
        dbeCodBarrasAp_Agrupada.SelectAll;

        exit;
      end;

      if length(dbeCodBarrasAp_Agrupada.Text) <> 48 then
      begin
        Application.MessageBox(MSG014, 'Atenção !', Mb_IconExclamation);
        dbeCodBarrasAp_Agrupada.setfocus;
        dbeCodBarrasAp_Agrupada.SelectAll;

        exit;
      end;

      if not oRemessaEletronica._ValidaCodBarrasArrecadacao(dbeCodBarrasAp_Agrupada.Text) then
      begin
        Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
        dbeCodBarrasAp_Agrupada.setfocus;
        dbeCodBarrasAp_Agrupada.SelectAll;

        exit;
      end;

      //if RoundCM(edtValorBoletoAp_Agrupada.Value,2) <> cdsMovRemessa.fieldbyname('VALOR').asFloat then  // Paulo Nobre - WO28166
      if (floattostr(edtValorBoletoAp_Agrupada.value) <> cdsMovRemessa.fieldbyname('VALOR').asString) then  // Paulo Nobre - WO32908
      begin
        Application.MessageBox(MSG035, 'Atenção !', Mb_IconExclamation);
        dbeCodBarrasAp_Agrupada.setfocus;
        dbeCodBarrasAp_Agrupada.SelectAll;
        exit;
      end;

    end;

    if edtDtVenctoBoletoApAgrupada.text <> cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asString then
      Application.MessageBox('Data do Código de Barras Diferente da Data Programada do Documento.', 'Atenção !', Mb_IconExclamation);
  end;

  try
    if dtmBaseDados.dbBaseDados.InTransaction then
    begin
      if qryAp_Agrupada.State = dsEdit Then
      begin
        Screen.Cursor := crSQLWait;

        //Não foi utilizado o componete TUpdateSQL pois nele só é possível
        //alterar 1 registro e no agrupamento terão no mínimo dois documentos
        qryAux.Close;
        qryAux.SQL.Clear;

        qryAux.SQL.add(' UPDATE CM.DOCUMENTO ');
        qryAux.SQL.add('    SET CODFORMA = :p1, ');
        qryAux.SQL.add('        NUMLEITCODBARRAS = :p2, ');
        qryAux.SQL.add('        IDCBANCARIA = :p3 ');
        qryAux.SQL.add('  WHERE CODGRUPOCNAB = :p4 ');

        qryAux.ParamByName('p1').AsString  := qryAp_Agrupada.fieldByname('CODFORMA').AsString;
        qryAux.ParamByName('p2').AsString := qryAp_Agrupada.fieldByname('NUMLEITCODBARRAS').AsString;
        qryAux.ParamByName('p3').AsString := qryAp_Agrupada.fieldByname('IDCBANCARIA').AsString;
        qryAux.ParamByName('p4').AsFloat  := qryAp_Agrupada.fieldByname('CODGRUPOCNAB').AsFloat;

        qryAux.ExecSQL;

        dtmBaseDados.dbBaseDados.Commit;

        qryAp_Agrupada.Close;
        qryAp_Agrupada.Open;

        if bAltFormPagtoApAgrupada then
        begin
          sCodGrupoCNAB := qryAp_Agrupada.fieldbyname('codgrupocnab').asString;

          cdsMovRemessa.DisableControls;
          frmAguarde.pbAguarde.Visible := false;
          frmAguarde.Mostra('Selecionando Movimento...');
          cdsMovRemessa.data := oRemessaEletronica._SelecionaMovimentoRemessa(
            dblkpConvenio.LookupValue,
            dblkpFormaPagto.LookupValue,
            dbDataProgIni.Date,
            dbDataProgFim.Date, iIdModuloAcesso);
          frmAguarde.pbAguarde.Visible := True;
          frmAguarde.Apaga;
          cdsMovRemessa.EnableControls;

          cdsMovRemessa.Locate('CODGRUPOCNAB', sCodGrupoCNAB, []);

          bAltFormPagtoApAgrupada := False;
          sFormaPagtoApAgrupadaAnt := EmptyStr;
        end;

        Screen.Cursor := crDefault;

        btnCancAp_AgrupadaClick(Self);
      end;
    end;
  except
    btnCancAp_AgrupadaClick(Self);
    raise;
  End;
end;

procedure TFrmRemessaEletronica.qryAp_AgrupadaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  if not qryAp_Agrupada.isEmpty then
  begin
    if length(trim(qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').asString)) = 47 Then
    begin
      qryAp_Agrupada.FieldByName('NUMLEITCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; ';
      rdgTipoBoletoAp_Agrupada.ItemIndex := 0; // Ficha de Compensação
      edtDtVenctoBoletoApAgrupada.Text := datetostr(oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').asString));
      edtValorBoletoAp_Agrupada.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').asString);

      if edtValorBoletoAp_Agrupada.value = 0 then
         edtValorBoletoAp_Agrupada.value := cdsMovRemessa.fieldbyname('VALOR').asFloat;
    end
    else
    if length(trim(qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').asString)) = 48 Then
    begin
      qryAp_Agrupada.FieldByName('NUMLEITCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; '; // Tamanho 48
      rdgTipoBoletoAp_Agrupada.ItemIndex := 1; // Arrecadação
      edtDtVenctoBoletoApAgrupada.Text := cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asString;
      edtValorBoletoAp_Agrupada.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').asString);
    end
    else
    begin
      qryAp_Agrupada.FieldByName('NUMLEITCODBARRAS').EditMask := EmptyStr;
      rdgTipoBoletoAp_Agrupada.ItemIndex := -1;
      edtDtVenctoBoletoApAgrupada.Text := EmptyStr;
      edtValorBoletoAp_Agrupada.value := 0.00;
    end;
  end;
end;

procedure TFrmRemessaEletronica.rdgTipoBoletoAp_AgrupadaClick(
  Sender: TObject);
begin
  inherited;

  if qryAp_Agrupada.state <> dsBrowse then
  begin
    dbeCodBarrasAp_Agrupada.enabled := true;

    if rdgTipoBoletoAp_Agrupada.itemindex = 0 then // Ficha de Compensação
      qryAp_Agrupada.FieldByName('NUMLEITCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; '
    else // Arrecadação
      qryAp_Agrupada.FieldByName('NUMLEITCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';

    dbeCodBarrasAp_Agrupada.Setfocus;
    dbeCodBarrasAp_Agrupada.SelectAll;
  end;
end;

procedure TFrmRemessaEletronica.dblkpFormaPagtoAp_AgrupadaChange(
  Sender: TObject);
begin
  inherited;

  if dblkpFormaPagtoAp_Agrupada.Value <> '' then
    edtCodPagtoAp_Agrupada.Text := cdsTipoPagtoGeral.fieldbyname('CODFORMABANCO').AsString
  else
    edtCodPagtoAp_Agrupada.Text := '';
end;

procedure TFrmRemessaEletronica.dblkpFormaPagtoAp_AgrupadaExit(
  Sender: TObject);
begin
  inherited;
  
  if dblkpFormaPagtoAp_Agrupada.Value <> '' then
    edtCodPagtoAp_Agrupada.Text := cdsTipoPagtoGeral.fieldbyname('CODFORMABANCO').AsString
  else
    edtCodPagtoAp_Agrupada.Text := '';
end;

procedure TFrmRemessaEletronica.dbeCodBarrasAp_AgrupadaExit(
  Sender: TObject);
begin
  inherited;

  if (dbeCodBarrasAp_Agrupada.text <> EmptyStr) and (length(trim(dbeCodBarrasAp_Agrupada.text)) >= 47) then
  begin
    if rdgTipoBoletoAp_Agrupada.Itemindex = 0 then // Ficha de Compensação
    begin
      if copy(dbeCodBarrasAp_Agrupada.text, 34, 1) <> '0' then
        edtDtVenctoBoletoApAgrupada.Text := datetostr(oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(dbeCodBarrasAp_Agrupada.text))
      else
        edtDtVenctoBoletoApAgrupada.Text := datetostr(cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime);
    end
    else // Arrecadação
      edtDtVenctoBoletoApAgrupada.Text := datetostr(cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime);

    edtValorBoletoAp_Agrupada.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(dbeCodBarrasAp_Agrupada.text);
    if edtValorBoletoAp_Agrupada.value = 0 then
       edtValorBoletoAp_Agrupada.value := cdsMovRemessa.fieldbyname('VALOR').asFloat;
  End;
end;

procedure TFrmRemessaEletronica.SpeedButton6Click(Sender: TObject);
begin
  inherited;

  qryAp_Agrupada.fieldbyname('NUMLEITCODBARRAS').Clear;
  dbeCodBarrasAp_Agrupada.Text := EmptyStr;
  edtDtVenctoBoletoApAgrupada.Text := EmptyStr;
  edtValorBoletoAp_Agrupada.value := 0.00;
  dbeCodBarrasAp_Agrupada.Setfocus;
  dbeCodBarrasAp_Agrupada.SelectAll;
end;

procedure TFrmRemessaEletronica.dblkpFormaPagtoAp_AgrupadaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if sFormaPagtoApAgrupadaAnt <> dblkpFormaPagtoAp_Agrupada.LookupValue then
    bAltFormPagtoApAgrupada := True;
end;

procedure TFrmRemessaEletronica.dblkpFormaPagtoAp_AgrupadaEnter(
  Sender: TObject);
begin
  inherited;

  sFormaPagtoApAgrupadaAnt := dblkpFormaPagtoAp_Agrupada.LookupValue;
end;

procedure TFrmRemessaEletronica.SpeedButton7Click(Sender: TObject);
begin
  inherited;

  with DtmDadosBancarios do
  begin
    SetaFiltroMs(qryAp_Agrupada.FieldByName('IDFORCLI').AsFloat);

    if MsContaCor.Executar = MrOk then
    begin
      if MsContaCor.ValoresChave[0] <> EmptyStr then
      begin
        if MsContaCor.ValoresChave[4] <> '0' then // Se for Conta Corrente, salário ou Poupança (1 ou 2 ou 3)
        begin
          qryAp_Agrupada.FieldByName('IDCBANCARIA').AsFloat := StrToFloat(MsContaCor.ValoresChave[0]);
          qryCtaBancariaAp_Agrupada.Close;
          qryCtaBancariaAp_Agrupada.Open
        end
        else
          Application.MessageBox(pchar('Tipo da Conta não definida no Cadastro deste Favorecido. Verifique !'), 'Atenção !', Mb_IconExclamation);
      end;
    end;
  end;
end;

procedure TFrmRemessaEletronica.SpeedButton8Click(Sender: TObject);
begin
  inherited;

  qryAp_Agrupada.fieldbyname('IDCBANCARIA').Clear;
  qryCtaBancariaAp_Agrupada.Close;
  qryCtaBancariaAp_Agrupada.Open;
end;

procedure TFrmRemessaEletronica.ppDetailBand2BeforePrint(Sender: TObject);
begin
  inherited;

  if trim(qryMovArqPendDet.FieldByName('NUM_AGENCIA').AsString) = '-' then
    CampoNumAgOpConta_Formapagto.Caption := qryMovArqPendDet.FieldByName('FORMA_PAGTO').AsString
  else
    CampoNumAgOpConta_Formapagto.Caption := qryMovArqPendDet.FieldByName('NUM_BANCO').AsString + ' ' +
                                            qryMovArqPendDet.FieldByName('NUM_AGENCIA').AsString + ' ' +
                                            qryMovArqPendDet.FieldByName('NUM_CONTA').AsString;
end;

procedure TFrmRemessaEletronica.ppSummaryBand3BeforePrint(Sender: TObject);
begin
  inherited;

  plblUsuGeracao.Caption := Sistema.NomeUsuario;
end;

procedure TFrmRemessaEletronica.ppDetailBandGerados3BeforePrint(
  Sender: TObject);
begin
  inherited;

  if trim(qryMovArqGeradoDet.FieldByName('NUM_AGENCIA').AsString) = '-' then
    CampoNumAgOpConta_FormapagtoGerados.Caption := qryMovArqGeradoDet.FieldByName('FORMA_PAGTO').AsString
  else
    CampoNumAgOpConta_FormapagtoGerados.Caption := qryMovArqGeradoDet.FieldByName('NUM_BANCO').AsString + ' ' +
                                            qryMovArqGeradoDet.FieldByName('NUM_AGENCIA').AsString + ' ' +
                                            qryMovArqGeradoDet.FieldByName('NUM_CONTA').AsString;
end;

procedure TFrmRemessaEletronica.ppSummaryBand4GeradosBeforePrint(Sender: TObject);
begin
  inherited;

  plblUsuGeracaoGerados.Caption := Sistema.NomeUsuario;
end;

procedure TFrmRemessaEletronica.spbImportarMovTituloClick(Sender: TObject);
Var
  tArquivo: TextFile;
  sLinha, sTipoTitulo, sCodBarras, sDtPagto,  sDocumento: String;
  sValorCampo: TStringlist;
  dValor, dTotalLista: Double;
  _existeCodBarras : Boolean;
Begin
  Inherited;
  //Leandro wo3978 - inicio
  If cdsMovRemessa.FieldByName('FLGPERMITETITULOSPAGTO').AsString = 'S' Then
    Begin
      If Application.MessageBox(pchar('O Arquivo (.csv ou .txt) deve conter colunas separadas por " ; " : ' + #13 + #13 +
        '[Tipo Título] - (F - Ficha de Compensação / A - Arrecadação)' + #13 +
        '[Código de Barras]' + #13 +
        '[Data de Pagamento] - (Ex.: 10/10/2023)' + #13 +
        '[Valor] - (Ex.: 100,48)' + #13 +
        '[CPF/CNPJ] - (Numérico e sem máscara)' + #13 +  #13 +
        'Exemplo: F;846700000017094203132595463884402660409863002005;10/10/2023;100,48;03447883189' + #13 + #13 +
        'Confirma Importação ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          If dlgAbreArquivo.Execute Then
            If uppercase(dlgAbreArquivo.FileName) <> EmptyStr Then
              Begin
                Try
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                    dtmBaseDados.dbBaseDados.StartTransaction;

                  Cursor := crSQLWait;
                  qryMovTitulos.DisableControls;

                  dTotalLista := 0.00;
                  sValorCampo := TStringList.Create;
                  // Lendo o arquivo
                  AssignFile(tArquivo, dlgAbreArquivo.FileName);
                  Reset(tArquivo);
                  While Not EOF(tArquivo) Do
                    Begin
                      sValorCampo.clear;

                      sTipoTitulo := '';
                      sCodBarras := '';
                      sDtPagto := '';
                      dValor := 0;
                      sDocumento := '';

                      // Lendo linha dos dados
                      Readln(tArquivo, sLinha);
                      // Extraindo o valor de cada campo e guardando numa stringlist
                      ExtractStrings([';'], [' '], PChar(sLinha), sValorCampo);

                      sTipoTitulo := Trim(sValorCampo[0]); //TIPOTITULO
                      sCodBarras  := Trim(sValorCampo[1]); //CODIGOBARRAS
                      sDtPagto    := Trim(sValorCampo[2]); //DATAPAGAMENTO
                      dValor      := StringToFloat(sValorCampo[3]); // VALOR

                      if sValorCampo.Count > 4 then //CPF/CNPJ não tem preenchimento obrigatório
                        sDocumento  := oRemessaEletronica._TiraMascara(Trim(sValorCampo[4])); // CPF ou CNPJ

                      If (sTipoTitulo <> 'F') And (sTipoTitulo <> 'A') Then // (F - Ficha de Compensação / A - Arrecadação)
                        Begin
                          Application.MessageBox(pchar('Tipo de título deve ser A ou F. Verifique !'), 'Atenção !', Mb_IconExclamation);
                          qryMovTitulos.EnableControls;
                          break;
                        End;

                      if trim(sCodBarras) = EmptyStr then
                      begin
                        Application.MessageBox(pchar('Código de barras não informado. Verifique !'), 'Atenção !', Mb_IconExclamation);
                        qryMovTitulos.EnableControls;
                        break;
                      end;

                      If Trim(sCodBarras) <> EmptyStr Then
                      Begin
                        _existeCodBarras := oRemessaEletronica._ExisteCodBarras(cdsMovRemessa.fieldByname('CODDOCUMENTO').AsString,trim(sCodBarras));

                        if _existeCodBarras then
                        begin
                          Application.MessageBox(MSG036, 'Atenção !', Mb_IconExclamation);
                          qryMovTitulos.EnableControls;
                          break;
                        end;

                        If (sTipoTitulo = 'F') Then // Ficha de Compensação
                        Begin
                          If Length(sCodBarras) <> 47 Then
                          Begin
                            Application.MessageBox(MSG013, 'Atenção !', Mb_IconExclamation);
                            qryMovTitulos.EnableControls;
                            break;
                          End;

                          If Not oRemessaEletronica._ValidaCodBarrasFichaComp(sCodBarras, 10) Then // Cálculo do digito na base 11
                          Begin
                            Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
                            qryMovTitulos.EnableControls;
                            break;
                          End;
                        End
                        Else // Arrecadação
                        Begin
                          If (copy(sCodBarras, 2, 1) = '9') And // Segmento - Exclusivo do Banco
                          (copy(sCodBarras, 17, 4) <> '0104') Then // <> do Banco CAIXA
                          Begin
                            Application.MessageBox(MSG030, 'Atenção !', Mb_IconExclamation);
                            qryMovTitulos.EnableControls;
                            break;
                          End;

                          If Length(sCodBarras) <> 48 Then
                          Begin
                            Application.MessageBox(MSG014, 'Atenção !', Mb_IconExclamation);
                            qryMovTitulos.EnableControls;
                            break;
                          End;

                          If Not oRemessaEletronica._ValidaCodBarrasArrecadacao(sCodBarras) Then
                          Begin
                            Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
                            qryMovTitulos.EnableControls;
                            break;
                          End;
                        End;
                      End;

                      If dValor = 0 Then
                      Begin
                        Application.MessageBox(pchar('Valor não informado ou igual a zero. Verifique !'), 'Atenção !', Mb_IconExclamation);
                        qryMovTitulos.EnableControls;
                        break;
                      End;

                      If (sTipoTitulo = 'F') and (trim(sDocumento) = EmptyStr) Then
                      Begin
                        Application.MessageBox(pchar('CPF/CNPJ não informado. Verifique !'), 'Atenção !', Mb_IconExclamation);
                        qryMovTitulos.EnableControls;
                        break;
                      End;

                      If trim(sDocumento) <> EmptyStr Then
                      Begin
                        If Not (length(Trim(sDocumento)) In [11, 14]) Then
                        Begin
                          Application.MessageBox(pchar('CPF/CNPJ com tamanho inválido. Verifique !'), 'Atenção !', Mb_IconExclamation);
                          qryMovTitulos.EnableControls;
                          break;
                        End;
                      End;

                      If (sTipoTitulo <> EmptyStr) And
                         (sCodBarras <> EmptyStr) And
                         (sDtPagto <> EmptyStr) And
                         (dValor <> 0.00) Then
                      Begin
                          qryAux.Close;
                          qryAux.SQL.Clear;
                          qryAux.SQL.add('SELECT SEQDOCXCODBARRAS.NEXTVAL SEQ FROM DUAL ');
                          qryAux.Open;

                          qryMovTitulos.Insert;
                          qryMovTitulos.fieldByname('CODDOCUMENTO').asInteger := cdsMovRemessa.fieldByname('CODDOCUMENTO').asInteger;
                          qryMovTitulos.fieldByname('IDDOCUMENTOXCODBARRAS').asInteger := qryAux.fieldByname('SEQ').asInteger;
                          qryMovTitulos.FieldByName('NUMCODBARRAS').AsString := sCodBarras;
                          qryMovTitulos.FieldByName('VLRPAGTO').AsFloat := dValor;
                          qryMovTitulos.FieldByName('DTPAGTO').AsDateTime := StrToDate(sDtPagto);
                          qryMovTitulos.FieldByName('NUMDOCUMENTO').AsString := trim(sDocumento);
                          qryMovTitulos.FieldByName('FLGTIPOCODBARRAS').AsString := sTipoTitulo;
                          qryMovTitulos.FieldByName('FLGIMPORTADO').AsString := 'S';
                          qryMovTitulos.Post;

                          dTotalLista := dTotalLista + dValor;
                      End;
                    End;

                  If RoundCM(dTotalLista, 2) <> 0.00 Then
                    Begin
                      If RoundCM(dTotalLista, 2) <= RoundCM(edSaldoTitulo.Value, 2) Then
                        Begin
                          qryMovTitulos.ApplyUpdates;

                          If dtmBaseDados.dbBaseDados.InTransaction Then
                            dtmBaseDados.dbBaseDados.Commit;
                        End
                      Else
                      begin
                        qryMovTitulos.CancelUpdates;
                        
                        If dtmBaseDados.dbBaseDados.InTransaction Then
                          dtmBaseDados.dbBaseDados.Rollback;

                        Application.MessageBox(MSG011, 'Atenção !', Mb_IconExclamation);
                      end;
                    End;
                Except
                  If dtmBaseDados.dbBaseDados.InTransaction Then
                    dtmBaseDados.dbBaseDados.Rollback;

                  Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
                End;
              End;

          CloseFile(tArquivo);
          qryAux.Close;

          qryMovTitulos.Close;
          qryMovTitulos.Open;
          qryMovTitulos.EnableControls;

          cdsMovRemessaAfterScroll(cdsMovRemessa);

          Screen.Cursor := crDefault;

          freeandnil(sValorCampo);
        End
    End
  Else
    Application.MessageBox(MSG028, 'Atenção !', Mb_IconExclamation);
  //Leandro wo3978 - fim
end;

procedure TFrmRemessaEletronica.spbLimparMovTituloClick(Sender: TObject);
begin
  inherited;
  //leandro wo3978 - inicio
  If qryMovTitulos.Locate('FLGIMPORTADO', 'S', []) Then
    Begin
      If Application.MessageBox(MSG005, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            Cursor := crSQLWait;
            qryMovTitulos.DisableControls;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.add('DELETE FROM DOCUMENTOXCODBARRAS    ');
            qryAux.SQL.add('WHERE CODDOCUMENTO = ' + cdsMovRemessa.fieldByname('CODDOCUMENTO').asString);
            qryAux.SQL.add('      AND FLGIMPORTADO = ''S''   ');
            qryAux.ExecSQL;

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            qryMovTitulos.Close;
            qryMovTitulos.Open;
            qryMovTitulos.EnableControls;
            cdsMovRemessaAfterScroll(cdsMovRemessa);
            Cursor := crDefault;

            Application.MessageBox(MSG025, 'Atenção !', Mb_IconExclamation);
          Except
            Raise
          End;
        End;
    End
  Else
    Application.MessageBox(MSG024, 'Atenção !', Mb_IconExclamation);
  //leandro wo3978 - fim
end;

End.
