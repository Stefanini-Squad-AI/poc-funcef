//*********************************************************************************
//N. SIG..........   : 117206
//Data da Alteração  : 23/12/2021
//Responsável        : Everson Cunha
//Descrição          : Incluido o FAgrupaDocumento.pas
//*********************************************************************************
//N. SIG..........   : 90246
//Data da Alteração  : 27/08/2019
//Responsável        : Fabio Sampaio
//Descrição          : Incluido o UFuncoesUteisIR.pas para sanar a dependencia de
//                     compilação do módulo Impostos
//*********************************************************************************
//Rotina             : Diversas
//N. SOL..........   : 212845
//N. PPM..........   : 1129416
//Data da Alteração  : 01/03/2016
//Alteração Form     : FrmRemessaEletronica
//Responsável        : Paulo Nobre
//Descrição          : adicionando fontes novos
//*********************************************************************************

program ContasaPagar;

{%ToDo 'ContasaPagar.todo'}

uses
  Forms,
  uSistema,
  fCmEntrada,
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {FrmOkCancelar},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  fMensVersoCheque in 'fMensVersoCheque.pas' {frmMensVersoCheque},
  Fselversoch in 'Fselversoch.pas' {Frmselversoch},
  fSelTipoImpressaoCPMF in 'fSelTipoImpressaoCPMF.pas' {FrmSelTipoImpressaoCPMF},
  FProgressCpmf in 'FProgressCpmf.pas' {FrmProgressCpmf},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadTalaoChequeMT in 'FCadTalaoChequeMT.pas' {FrmCadTalaoChequeMT},
  FConfigCheqMT in 'FConfigCheqMT.pas' {FrmConfigCheqMT},
  FCadRamoxDesembMT in 'FCadRamoxDesembMT.pas' {FrmCadRamoxDesembMT},
  uCtrlRptCAP in '..\Reports\Source\uCtrlRptCAP.pas',
  rDocPagoxLotes in '..\Reports\Source\rDocPagoxLotes.pas',
  rPagCentRespon in '..\Reports\Source\rPagCentRespon.pas',
  FConfigRelatorioMT in '..\..\Cm\Forms\SourceMT\FConfigRelatorioMT.pas' {FrmConfigRelatorioMT},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  rCRxDesemb in '..\Reports\Source\rCRxDesemb.pas' {RptCRxDesemb},
  rPosiForn in '..\Reports\Source\rPosiForn.pas' {RptPosiForn},
  rPosiFornxRespon in '..\Reports\Source\rPosiFornxRespon.pas' {RptPosiFornxRespon},
  rEmissBDebito in '..\Reports\Source\rEmissBDebito.pas' {RptEmissBDebito},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FAcertaBaixaMT in 'FAcertaBaixaMT.pas' {frmAcertaBaixaMT},
  uCtrlAcertaBaixa in '..\CtrlObjects\uCtrlAcertaBaixa.pas',
  FBaixaAutomaticaMT in 'FBaixaAutomaticaMT.pas' {FrmBaixaAutomaticaMT},
  FEmissChequeMT in 'FEmissChequeMT.pas' {FrmEmissChequeMT},
  uCtrlEmissCheque in '..\CtrlObjects\uCtrlEmissCheque.pas',
  FAlteraLoteMT in 'FAlteraLoteMT.pas' {FrmAlteraLoteMT},
  uCtrlPagEletronico in '..\CtrlObjects\uCtrlPagEletronico.pas',
  uCtrlAlteraLote in '..\CtrlObjects\uCtrlAlteraLote.pas',
  uCtrlCancelaLote in '..\CtrlObjects\uCtrlCancelaLote.pas',
  rOrdemPgtoNova in '..\Reports\Source\rOrdemPgtoNova.pas' {rptOrdemPgtoNova},
  rEmissBDebitoMod2 in '..\Reports\Source\rEmissBDebitoMod2.pas' {RptEmissBDebitoMod2},
  FConsLoteMT in 'FConsLoteMT.pas' {frmConsLoteMT},
  FConsOrdemPagoMT in 'FConsOrdemPagoMT.pas' {FrmConsOrdemPagoMT},
  FConsDoctosCpmfMT in 'FConsDoctosCpmfMT.pas' {FrmConsDoctosCpmfMT},
  DConciliaCPMFMT in 'DConciliaCPMFMT.pas' {DtmConciliaCPMFMT: TDataModule},
  FBaixaCPMFMT in 'FBaixaCPMFMT.pas' {FrmBaixaCPMFMT},
  FConciliaCPMFMT in 'FConciliaCPMFMT.pas' {FrmConciliaCPMFMT},
  uCtrlConciliaCPMF in '..\CtrlObjects\uCtrlConciliaCPMF.pas',
  FPagEletronicoMT in 'FPagEletronicoMT.pas' {FrmPagEletronicoMT},
  FCancelaLoteMT in 'FCancelaLoteMT.pas' {FrmCancelaLoteMT},
  FGeraLotePgtoMT in 'FGeraLotePgtoMT.pas' {frmGeraLotePgtoMT},
  uDtmPagEletronico in '..\CtrlObjects\uDtmPagEletronico.pas' {DTmPagEletronico: TDataModule},
  uCtrlGeraLotePgto in '..\CtrlObjects\uCtrlGeraLotePgto.pas',
  uDtmGeraLotePgto in '..\CtrlObjects\uDtmGeraLotePgto.pas' {DtmGeraLotePgto: TDataModule},
  uDbLotePagto in '..\DbObjects\uDbLotePagto.pas',
  FCadModeloHistoricoMT in '..\..\Cm\Forms\SourceMT\FCadModeloHistoricoMT.pas' {FrmCadModeloHistoricoMT},
  uCtrlINTBANCOXPORTFORM in '..\..\CMIntBancoMT50\CtrlObjects\uCtrlINTBANCOXPORTFORM.pas',
  FCadGrupoRateioDocMT in 'FCadGrupoRateioDocMT.pas' {frmCadGrupoRateioDocMT},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  fLancamentoDocCPMFTransf in 'fLancamentoDocCPMFTransf.pas' {frmLancamentoDocCPMFTransf},
  cRelCPFMPlanoxPatro in '..\Reports\Source\cRelCPFMPlanoxPatro.pas' {cfgRelCPMFPlanoxPatro},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  dRelCPMFPlanoxPatro in '..\Reports\Source\dRelCPMFPlanoxPatro.pas' {dtmRelCPMFPlanoxPatro},
  rConciliaCPMF in '..\Reports\Source\rConciliaCPMF.pas' {RptConciliaCPMF},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  FProgressoDuplo in '..\..\Cm\Forms\Source\FProgressoDuplo.pas' {frmProgressoDuplo},
  fPropAprovaRAD in 'fPropAprovaRAD.pas' {frmPropAprovaRAD},
  FRemessaEletronica in 'FRemessaEletronica.pas' {FrmRemessaEletronica},
  UFuncoesUteisIR in '..\..\IRRF\Fontes\UFuncoesUteisIR.pas',
  FAgrupaDocumento in 'FAgrupaDocumento.pas' {FrmAgrupaDocumento};

// Alterado por FHBS - 27/08/2019 - SIG90246

{$R *.RES}
{$R CONTASAPAGAR_RES.RES}
begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Contas a Pagar';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmProgressoDuplo, frmProgressoDuplo);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;

  Application.Run;


end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Contas a Pagar
================================================================================
CM$VER      3.04.19h    31/03/2008
--------------------------------------------------------------------------------
Pendência : 18332 e 23815
Descrição : Foi retirada a chamada para o Relatório de Envio de Documentos para a Contabilidade.
================================================================================
CM$VER      3.04.19g    20/03/2008
--------------------------------------------------------------------------------
Pendência: 27613
Tela : Contas a Pagar\Lote\Altera Lote
Descrição: Erro de transação ao fazer alteração de lote no Contas a Pagar.
================================================================================
CM$VER      3.04.19f    16/01/2008
--------------------------------------------------------------------------------
Pendência : 18332 e 23815
Descrição : Foram criadas as chamadas para o Relatório de Envio de Documentos para a Contabilidade.
================================================================================
CM$VER      3.04.19e    18/12/2007
--------------------------------------------------------------------------------
Pendência: 27070
Relatório: Consultas/relatorios/Demonstrativo Atos de Gestao por AP
Descrição: O relatório não está listando o referente ao centro de responsabilidade do novo plano de centro de responsabilidade. 
Histórico de alterações efetuadas no módulo CMCapCarUtilObj50
================================================================================
CM$VER      3.04.19d    06/12/2007
--------------------------------------------------------------------------------
Pendência: 26667 (*** ajuste ***)
Tela: Tesouraria\Conciliação de CPMF
Descrição: Quando um documento possui rateios exatamente iguais, para o cálculo de CPMF
, o valor cálculo não fica correto, pois não calcula a CPMF para esses rateios. Existe um 'distinct' que exclui os rateios iguais e não os traz para o relatório de CPMF.
================================================================================
CM$VER      3.04.19c    03/12/2007
--------------------------------------------------------------------------------
Pendência: 26936
Tela: Tesouraria\Conciliação CPMF
Descrição do problema: data de retenção dos lançamentos de CPMF não está podendo ser alterada,
gerando a mensagem 'Lançamentos contábeis segregados na origem não podem ser alterados!
Exclua todos os lançamentos com o Contr. Segregação = '' e inclua o lançamento novamente!
================================================================================
CM$VER      3.04.19b    27/11/2007
--------------------------------------------------------------------------------
Pendência 26667 (ajuste)
Tela: Tesouraria\Conciliação de CPMF
Descrição: Quando um documento possui rateios exatamente iguais, os mesmos 
não são todos exibidos no relatório de conciliação, causando assim, divergências de valores.
================================================================================
CM$VER      3.04.19a    20/11/2007
--------------------------------------------------------------------------------
Pendência: 26773
Tela: Tesouraria\Lote\Altera Lote 
Descrição do problema: ao alterar um lote , associando mais documentos dentro do mesmo, 
o valor no RAD(ao autorizar o rad) não está acatando a alteração do lote.
================================================================================
CM$VER      3.04.19     19/11/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.18
Pendencia : 24927
Tela      : Consultas \ Lotes
Descrição : Incluído uma coluna para exibir o status do documento e corrigido o cálculo do valor do lote.
Pendencia : 24669
Tela      : Tesouraria \ Emissões de documentos \ Remessa Eletrônica
Descrição : O preenchimento do Modelo de Arquivo de Remessa foi alterada pra
            trazer somente os modelos CNABS que estão cadastrados no portadorforma.
Pendência: 26434
Tela: Lançamentos\Documentos\Registra
Descrição: Se o parâmetro "No Rateio do Documento, Obrigar o Mesmo Plano Previdenciário
Somente para Desembolsos/Recebimentos Positivos" estiver ligado, pode-se lançar documentos
rateados por planos diferentes desde que esses planos estejam contidos no relacionamento do
portadorconta utilizado no lançamento.
Pendência: 26515
Tela: Lançamentos\Documentos\Registra
Descrição: Retirar a trava que o sistema esta fazendo para selecao do centro de custo. Ao selecionar o tipo de desembolso, somente estao vindo os centros de custo que tem algum relacionamento com o tipo de desembolso na parametrizacao contabil predominante.
Pendência: 25218
Tela: Tesouraria\Conciliação de CPMF
Descrição: a tela cancelará mesmo o arredondamento, como já está fazendo, porem permitirá voltar na tela de baixa da CPMF para que seja conformada a baixa somente da CPMF e caso necessário, voltar a tela de arredondamento.
Pendência: 22823
Tela: Tesouraria\Emissão de documentos\Remessa eletrônica
Descrição: "Lotes Diversos" para Remessa PAG-FOR quando da geração de um arquivo remessa com mais de um lote.
================================================================================
CM$VER      3.04.18b    31/10/2007
--------------------------------------------------------------------------------
Pendência 26667
Tela: Tesouraria\Conciliação de CPMF
Descrição: Quando um documento possui rateios exatamente iguais, os mesmos
não são todos exibidos no relatório de conciliação, causando assim, divergências de valores.
================================================================================
CM$VER      3.04.18a    03/10/2007
--------------------------------------------------------------------------------
Pendência : 26344
Tela     : Tesouraria \ Emissão de Documentos \ Cheque
Descrição : Corrigido a opção "Considera a data da emissão do Lote".
================================================================================
CM$VER      3.04.18     31/07/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.17
Pendencia : 24864
Tela      : Tesouraria \ Lote de Documentos para Pagamento \ Cancela Lote
Descrição : Criado um mensagem informativa com o novo número do lote
            quando o mesmo é regerado.
================================================================================
CM$VER      3.04.17c    14/08/2007
--------------------------------------------------------------------------------
Pendência : 26020
Tela     : Tesouraria \ Pagamento \ Automatico
Descrição : Criado uma crítica, na baixa automatica para o portador conta inativo. 
================================================================================
CM$VER      3.04.17b    01/08/2007
--------------------------------------------------------------------------------
Pendência: 24978 - reajuste no padrão 16.
Descrição: Corrige o agrupamento dos registros de CC/DOC e TED
================================================================================
CM$VER      3.04.17a    31/07/2007
--------------------------------------------------------------------------------
Pendência: 24978 - reajuste no padrão 16.
Descrição: Corrige o problema encontrado na tentativa de enviar a remessa eletrônica.
================================================================================
CM$VER      3.04.17     14/08/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.16
Pendência 25115 - Lançamento/Documento/Registra
- Retirado teste de relacionamento Usuario x Tpdocto na geração de RAD.
Pendência 25128 - Relatório de CPMF conciliado
- Corrigido o problema de AP's englobadas não aparecerem no relatório de CPMF.
Pendencia : 25777
Tela      : Consultas \ Relatórios \ Operacionais \ Documentos por Data Programada
Descrição : Corrigido o relatório que duplicava o documento, quando este encontrava-se num lote e em seguida
            estornava o documento e o lançava-o num novo lote, o mesmo documento apareceria duplicado.
Pendencia : 25234(Ajuste)
Tela      : Lançamento \ Documento \ Registra
Descrição : Se o usuário escolher um tipo de documento que não imprime AP, o relatório de AP não será exibido.
Pendencia : 25693
Tela      : Relatorios \ Operacionais \ Documento por Data Programada
Descrição : O relatório do documento por data programada estava vindo quebrado por tipo de recebimento/desembolso.
Pendência : 24573(Ajuste)
Tela      : Cadastro \Impostos com Tabela de Retenção
Descrição : Obrigar prenchimento correto no parâmetro do sistema "Tipo de documento para CPMF" quando o imposto manipulado for 20 - CPMF.
            Na tela Cadastros \ Fornecedores \ Dados do Fornecedor - Impostos Agregados - não permitir vincular impostos
Pendência : 25623
Tela      : Relatório de Valores por Centro de Custo
Descrição : Corrigido problema na filtragem e acrescentada coluna de valor do rateio.
Pendência : 25669
Tela      : Estorno de documento
Descrição : Solucionado problema de documento aparecendo duplicado na consulta e na seleção.
Pendência : 25226(Ajuste)
Tela      : Cadastro \ Contas / Caixa x Forma de Pagamento
Descrição : Corrigido o erro no cadastro do portador forma.
pendência : 24978
layout    : Banco Besc (Banco Estadual de Santa Catarina)
descrição : Correção do arquivo de remessa de pagamento.
================================================================================
CM$VER      3.04.16m    22/06/2007
--------------------------------------------------------------------------------
Pendência : 25644
Tela         : Tesouraria \ Lote de Documento por Pagamento \ Cria Lote
Descrição : Corrigido a quantidade dos totais de documentos pendentes e o valor total da seleção.
================================================================================
CM$VER      3.04.16l    21/06/2007
--------------------------------------------------------------------------------
Pendência : 25399   
Tela         : Tesouraria \ Lote de Documento por Pagamento \ Cria Lote
Descrição : Corrigido a emissão de documentos para pagamento que não estavam sendo mostrados na tela Disponibilidade Financeira.
================================================================================
CM$VER      3.04.16k    19/06/2007
--------------------------------------------------------------------------------
Pendência 25128 - Relatório de CPMF conciliado
- Corrigido o problema de AP's englobadas não aparecerem no relatório de CPMF.
Pendência 25542 - Consultas/Relatórios/Emissões diversas/Autorização de Pagamento - Modelo 04
- Corrigido o relatório de AP, fazendo com que os documentos englobados tragam a contabilização, Rateio e Alterador nos documentos de origem. 
================================================================================
CM$VER      3.04.16j    11/06/2007
--------------------------------------------------------------------------------
Pendência : 25540   Sistema/Utilitários/Altera dados bancários
Descrição : Impedir que os dados sejam alterados caso a disponibilidade financeira
esteja bloqueada.
================================================================================
CM$VER      3.04.16i    08/06/2007
--------------------------------------------------------------------------------
Pendencia : 25184
Tela      : Lançamentos \ Documentos \ Agrupa/Parcela
Descrição : Na contabilização da baixa, operação 5. O relatório passa a visualizar apenas
            a contabilização do próprio documento, e não a contabilização do lote. Isto se dá apenas
            para o lançamento à crédito. O banco permanece inalterado, ou seja, totalizando o valor
            do lote.
================================================================================
CM$VER      3.04.16h    06/06/2007
--------------------------------------------------------------------------------
Pendencia : 25196
Tela      : Tesouraria \ Pagamentos \ Pagamento x Recebimento
Descrição : Corrigido o erro ao selecionar o documento pendentes a pagar, que não estava sendo selecionado
Pendencia : 25510
Tela      : Relatorios \ Operacionais \ Documento por Data Programada
Descrição : O documento após posto em lote, pago e depois estornado não estava aparecendo no relatório.
Pendencia : 25234
Tela      : Lançamento \ Documento \ Registra
Descrição : Se o usuário escolher um tipo de documento que não imprime AP, o relatório de AP não será exibido.
Pendencia : 25530
Tela      : Consultas \ Relatórios \ Emissões Diversas \ Borderô - Débito em Conta Modelo 2
Descrição : Corrigido o somatório do valor por lote.
Pendencia : 25399
Tela      : Tesouraria \ Emissão de Documento \ Cheque
Descrição : O Pagamento do Lote estava gerando uma data inválida que afetava o Controle Financeiro.
================================================================================
CM$VER      3.04.16g    30/05/2007
--------------------------------------------------------------------------------
pendência: 25466
Tela     : Consultas \ Relatórios \ Emissões Diversas \Autorização de Pagamento Modelo 4
Descrição: Corrigido a opção "Considerar a data programada - n dias úteis" passando "0" como parâmetro para "n",
             o relatório está trazendo somente os registros com data de aprovação igual à data programada.
================================================================================
CM$VER      3.04.16f    21/05/2007
--------------------------------------------------------------------------------
pendência: 25418
tela: Tesouraria/Emissão de Documentos/Remessa Eletrônica
descrição: O sistema não está gerando arquivo bancário para as opções:
Modelo de Arquivo de Remessa: BANCO BANRISUL - PAGAMENTO DE FORNECEDORES
Portador Forma: BANRISUL S/A - 06.079678.0.1 - BRR TIT.OUTROS BCO
Forma de pagamento: LIQUIDAÇÃO DE TITULOS DE OUTROS BANCOS
================================================================================
CM$VER      3.04.16e    18/05/2007
--------------------------------------------------------------------------------
Pendência: 24143 Consultas/Relatórios/Gerenciais/Valores por Centro de Custo
Descrição: Implementado relatório em que exibe os documentos em aberto/baixados
por Centro de Custo.
================================================================================
CM$VER      3.04.16d    17/05/2007
--------------------------------------------------------------------------------
pendência: 25388
Tela     : Tesouraria \ Emissão de Documentos \ Remessa Eletrônica
Descrição: Ao gerar o arquivo para pagamento, o sistema obriga data de disponibilidade, mesmo que não esteja integrando com a disponibilidade financeira.
pendência: 25359
Tela     : Consultas \ Relatórios \ Emissões Diversas \Autorização de Pagamento Modelo 4
Descrição: O Campo conta bancária do relatorio que estava pegando a conta preferêncial
           do fornecedor, mesmo se o documento tivesse sido lançado para a conta secundaria.
           Corrigido, o relatorio passa a buscar o campo IDCBANCARIA da tabela documento.
pendência: 25335
Tela     : Consultas \ Relatórios \ Emissões Diversas \Autorização de Pagamento Modelo 4 e
             Consultas \ Relatórios \ Operacionais \ Documentos por Data Programada
Descrição: Corrigido o erro de duplicação de documento quando havia um estorno
               e o mesmo documento encontrava-se em um novo lote.
================================================================================
CM$VER      3.04.16c    11/05/2007
--------------------------------------------------------------------------------
Pendência: 25233
Tela: Consultas \ Relatórios \ Gerenciais \ CPMF por Plano x Patrocinadora.
Descrição: Corrigido o erro que "não estava trazendo apenas os documentos
               dentro do período selecionado."
Pendência: 25238
Tela: Consultas \ Relatórios \ Operacionais \ Documento por Data Programada
Descrição: Corrigido o erro do sequencial da primeira coluna (Quant.)
================================================================================
CM$VER      3.04.16b    08/05/2007
--------------------------------------------------------------------------------
pendência: 25202
Tela     : Tesouraria \ Emissão de Documentos \ Cheque
Descrição: Corrigido o erro ao digitar o início da conta antes de abrir o combo
           "Contas Caixas X Forma de Pagamento"
================================================================================
CM$VER      3.04.16a    07/05/2007
--------------------------------------------------------------------------------
pendência: 25094
Tela     : Tesouraria \ Emissão de Documentos \ Remessa Eletrônica
Descrição: Corrigido o erro no lançamento do Controle Financeiro onde a data de
           disponibilidade inválida(29/12/1899) era gravada.
================================================================================
CM$VER      3.04.16     03/04/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.15
Pendência : 24704
Tela      : Consultas/Documentos
Descrição : Unificação da tela de consulta documentos.
Pendência : 24309
Tela: Tesouraria \ Pagamento Baixa Manual e Automática
Descrição : Criado o campo observação para poder compor o histórico contabil dos documentos
Pendência : 24780
Tela: Tesouraria \ Conciliação de CPMF
Descrição : Alterado o Label do Favorecido para Banco Favorecido.
Pendência 24748
Tela: Tesouraria \ Conciliação de CPMF
Descrição: Quando se altera a data de retenção ou a data programada de uma documento de CPMF na tela de conciliação de CPMF ou na de arredondamento, o sistema não consegue fazer a baixa do mesmo.
Pendência  24738 (CmCapCarObj50)
Tela: Tesouraria\Baixa Manual
Descrição: Não está sendo possível fazer a baixa de qualquer documento no Contas a Pagar no padrão 14, 
pois apresenta o erro: "field idprograma not found".
Pendência: 24668
Tela: Cadastro\Contas Caixa X forma de pagamento 
Descrição: Implementar no cadastro do portador forma uma parametrização que permita calcular a data programada do pagamento com o Float.
pendência: 24916
Telas : Tesouraria\Emissão de Documentos\Cheques 
Descrição: Implementação da Impressora de cheques IMPRECHEQ ELGIN / SCHALTER 2.18
================================================================================
CM$VER      3.04.15e    19/03/2007
--------------------------------------------------------------------------------
Pendência: 24776
Tela: Cadastro\Imposto com tabela de retenção
Descrição: A Parametrização contábil, feita na tela de impostos com tabela de retenção, no Contas a Pagar, não esta liberada.
Pendência: 24769 Documento\Registra
Descrição: Corrigido o erro em que para os compromissos especiais gerados, o sistema
sempre gerava a crítica de "O valor informado é maior que o valor do compromisso"
================================================================================
CM$VER      3.04.15d    16/03/2007
--------------------------------------------------------------------------------
Pendência: 24713 (retrabalho)
Tela: Tesouraria\Conciliação de CPMF\
Descrição: Não estava sendo possível conciliar e baixar as cpmf de transferências entre contas que foram 
lançadas na forma antiga. 
Pendência: 24625
Tela: Exclui\Estorna\Lote
Descrição: Quando excluímos a baixa da CPMF, o sistema não está excluindo o arredondamento e está ficando com saldo anterior na Disponibilidade Financeira.
================================================================================
CM$VER      3.04.15c    13/03/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.14
Pendência: 24671  Tesouraria/Lote de documento para pagamento/Altera lote
Descrição: Corrigido o erro em que se estava duplicando o múmero do lote para
aqueles com mais de um documento.
================================================================================
CM$VER      3.04.15b    12/03/2007
--------------------------------------------------------------------------------
Pendência: 24697
Tela: Tesouraria\Conciliação de CPMF\Arredondamento de CPMF
Descrição: AO USAR UM TIPO DE DESEMBOLSO QUE OBRIGA CENTRO DE CUSTO O SISTEMA
DEVE DISPARAR UMA MENSAGEM INFORMANDO SE O FORNECEDOR ESTÁ SEM O CENTRO
DE CUSTO PREENCHIDO.
OBS. Importante: A partir desta versão o sistema não mais buscará o centro de custo no cadastro do fornecedor,
passará a ser também o centro de custo selecionado no rateio do documento.
Pendência: 24661
Tela: Tesouraria\Conciliação de CPMF\Arredondamento de CPMF
Descrição: Ao efetuar um arredondamento, e alterar a descrição do campo 'Histórico do Lançamento',
o sistema não grava a alteração efetuada e nem lança o que já está escrito, está inserindo nos documentos o historico
' ARREDONDAMENTO DE CPMF'.
================================================================================
CM$VER      3.04.15a    02/03/2007
--------------------------------------------------------------------------------
Pendência: 24620
Tela: Tesouraria\Conciliação de cpmf\Arredondamento
Descrição: o lança e baixa simultanea para o arredondamento, porém o arredondamento não está sensibilizando no extrato de contas por não estar sendo lançado no CFINAN.
================================================================================
CM$VER      3.04.15     28/02/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.14
Pendência: 24573 - Cadastro \Impostos com Tabela de Retenção - Obrigar prenchimento correto
no parâmetro do sistema "Tipo de documento para CPMF" quando o imposto manipulado for 20 - CPMF.
Na tela Cadastros \ Fornecedores \ Dados do Fornecedor - Impostos Agregados - não permitir vincular impostos
do tipo CPMF neste relacionamento.
Pendência: 24564
Tela: Cadastros \ Tipos de desembolsos \ Impostos Agregados 
Descrição: Trazer apenas os centro de custo analíticos.
Pendência: 24249
Tela: Consultas \ Relatórios \ Emissões Diversas \ Cópia de Cheque
Descrição: Incluído os campos no relatório Agência, Conta, CPF/CNPJ, Banco e Conta Corrente 
                 e poupança do fornecedor.
Pendência : 24363 / Tesouraria / Lotes de documento para pagamentos / Cria Lote
Descrição : Removido o Owner CM.
Descrição: Removida a tela que Altera o Centro de Responsabilidade.
Pendência: 24267 Sistema / Utilitário / Altera Centro de Responsabilidade.
Descrição: Corrigido o erro em que as alterações efetuadas no relatório de
           Autorização de Pagamento - 04 não estavam sendo visualizadas.
Pendência: 24266 Consultas/Relatórios/Emissões Diversas/Relação dos lotes emitidos
Descrição: Corrigido a crítica de obrigatoriedade da data final dos lotes emitidos
Pendência: 24249 Consultas /Relatórios/Emissões Diversas / Cópia de cheque e Borderô.
Descrição: incluído os campos: AP, Agencia, Conta bancária, Plano e data de pagamento.
Pendência 24064 - CAP e CFINAN
Descrição: Remodelar o processo de CPMF (lançamento do documento/contabilização) conforme especificação em anexo
Pendência: 24423
Tela: Consulta\Relatórios\Operacionais\Documentos Por Data Programada
Descrição: Incluir o campo Número do Lote no relatório.
Pendência: 24422
Tela: Tesouraria\Pagamentos\Automático
Descrição: Na tela de lotes pendentes para pagamento, após filtrar os documentos para baixa, selecionei apenas um documento para baixar, uma vez que os demais tinham datas diferentes de baixa. Após baixar o unico documento, os demais documentos filtrados anteriormente desaparecem.
================================================================================
CM$VER      3.04.14m    15/02/2007
--------------------------------------------------------------------------------
Pendência: 24417
Tela: Tesouraria\Cociliação de CPMF
Descrição: AO DAR BAIXA DE CPMF E LANCAR UM ARREDONDAMENTO, O DOCUMENTO DE ARREDONDAMENTO ESTÁ VINDO ABERTO. ESTE DOCUMENTO DEVE SER DO TIPO "LANÇA E BAIXA SIMULTANEAMENTE"
================================================================================
CM$VER      3.04.14l    14/02/2007
--------------------------------------------------------------------------------
Pendência: 24417
Tela: Tesouraria\Cociliação de CPMF
Descrição: AO DAR BAIXA DE CPMF E LANCAR UM ARREDONDAMENTO, O DOCUMENTO DE ARREDONDAMENTO ESTÁ VINDO ABERTO. ESTE DOCUMENTO DEVE SER DO TIPO "LANÇA E BAIXA SIMULTANEAMENTE"
================================================================================
CM$VER      3.04.14k    09/02/2007
--------------------------------------------------------------------------------
pendência 24462
AO EMITIR O BOLETO, O "NOSSO NUMERO" ESTÁ SENDO ZERADO, NÃO SEGUINDO O CRITERIO DE CONCATENAÇÃO DO NUMERO. 
================================================================================
CM$VER      3.04.14j    08/02/2007
--------------------------------------------------------------------------------
Pendência: 24244 Consultas/Relatórios/Emissões Diversas/Autorização de Pagamento - 04
Descrição: Corrigido o erro em que os lançamentos de baixas estavam sensibilizando
o saldo do documento
================================================================================
CM$VER      3.04.14i    02/02/2007
--------------------------------------------------------------------------------
Pendência: 24373
Tela : Lançamentos\Dopcumentos\Registra
Descrição: Ao gerar um boleto, o sistema trava. O usuário identificou que, se houver outro usuário com a tela de geração de boleto aberta, nenhum outro consegue gerar o boleto, apresentando o travamento conforme a tela em anexo. Após o primeiro usuário imprimir o boleto, a tela é liberada para o segundo usuário, criando uma "fila".
================================================================================
CM$VER      3.04.14h    01/02/2007
--------------------------------------------------------------------------------
Pendência: 24363
Tela : Consultas \ Relatórios \ Emissões Diversas \ Emissão de Slip
Descrição: Removido o owner da CM.
================================================================================
CM$VER      3.04.14g    31/01/2007
--------------------------------------------------------------------------------
Pendência: 24357
Tela: Tesouraria\Lotes\Altera lote
Descrição: Existe uma restrição quanto ao plano do documento que está sendo inserida, que não está sendo imposta nesta tela. 
================================================================================
CM$VER      3.04.14f    26/01/2007
--------------------------------------------------------------------------------
pendência 24294
tela tesouraria\Cociliação de cpmf
Não está sendo possível baixar documentos de CPMF de transferência entre contas e pagamento manual no mesmo lote.
Para que as baixas sejam feitas, se fa necessário a baixa em dois lotes.
Na hora da baixa realmente não se pode baixar os documentos de transferencia junto com os outrso lançamento.
Apos baixar os outros lançamentos, sistema não está baixando os documentos de tranferencia entre contas.
================================================================================
CM$VER      3.04.14e    26/01/2007
--------------------------------------------------------------------------------
pendência nº 24321
Histórico: Ao executar uma criação de lotes, no fim da operação, aparece uma mensagem para selecionar um portador forma, e o mesmo já estava selecionado antes na tela de filtro.
================================================================================
CM$VER      3.04.14d    18/01/2007
--------------------------------------------------------------------------------
Pendência: 24229
Telas: Geraçao e alteração de lotes
Descrição: Erro ao Gerar Lotes
O campo LOTEPAGTO.NUMLOTE não informado
Outro problema: Não está sendo possível alterar um lote que não tenha um processo RAD vinculado.
================================================================================
CM$VER      3.04.14c    11/01/2007
--------------------------------------------------------------------------------
Pendência: 24172
Telas de ocorrência: Tesouraria/Pagamento/Manual
Descrição do usuário: Ao tentar efetuar uma baixa manual, está aparecendo a seguinte mensagem: "Erro ao gerar Parametro não implementado". Esta mesma mensagem esta aparecendo na tela de criação de lote.
Pendência 24167
Telas de ocorrência: Tesouraria/ Conciliação de CPMF
Descrição do usuário: A CPMF gerada na transferencia entre contas não esta registrando a data de geração da mesma na tela de conciliação de CPMF.
================================================================================
CM$VER      3.04.14b    09/01/2007
--------------------------------------------------------------------------------
PENDENCIA 24071 (ajuste)
1- Na busca dos cpmf para conciliação não está respeitando o filtro data programada quando usado em conjunto com o filtro conta bancária
. Exemplo se a conta for santander vila olimpia e a data for 02/01/2007  busca o lote 58787, se a data for 03/02/2007 o mesmo lote aparece.
2 - Não busca as cpmf de transferência bancária se selecionar uma conta bancária no filtro.
Obs.: Na análise observei que o campo impostoretido.codportador não estva sendo gravado para  as CPMF geradas no momento da transferência bancária.
================================================================================
CM$VER      3.04.14a    03/01/2007
--------------------------------------------------------------------------------
Pendência: 24108 Consultas/Relatórios/Emissões diversas/Recolhimento de encargos por plano x patrocinadora
Descrição: Corrigido o erro em que não estava retornando dados no relatório
Pendencia: 24035 Cadastros/Tipos Desembolsos / Impostos Agregados
Descrição: Não permitir o relacionamento de 2 impostos com o mesmo código de imposto
================================================================================
CM$VER      3.04.14     11/12/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.13
Pendência: 23084 Consultas/Relatórios/Emissões Diversas/Autorização de Pagamento - 04
Descrição: Implementado filtros para consulta de AP's em atraso
Pendência: 23831 Consultas/Relatórios/Emissões Diversas/Autorização de Pagamento - 04
Descrição: Corrigido o erro de filtragem de registro
Pendência: 23834 Consultas/Relatórios/Emissões Diversas/Autorização de Pagamento - 04
Descrição: Corrigido o erro gerado ao tentar selecionar mais de um documento no filtro
Pendência: 23831 Consultas/Relatórios/Emissões Diversas/Autorização de Pagamento - 04
Descrição: Corrigido o erro de filtragem de registro
Pendência: 23832 Sistema/Configuração/Parâmetros do sistema
Descrição: Corrido o erro gerado ao tentar selecionar o relatório de impressão de espelho
Pendência: 21604
Processo: Contabilização de Lotes de Documento
Descrição: Solicitação para que os lançamentos na conta contábil Banco sejam agrupadas 
por sub-plano dentro do lote, e não por documento como é hoje. A razão pela qual é desejada tal 
contabilização é para facilitar a conciliação da conta contábil banco.
Pendência: 23683
Tela: Lançamentos\Documentos\Registra
Descrição: O histórico contábil cadastrado manualmente pelo usuário não está funcionando no lançamento de documentos.
Pendência : 23658
Tela: Tesouraria\Lote\Cria Lote
Descrição : adaptação para filtar os documento de conta corrente do mesmo banco do portador forma,
bem como a exibição dos dados das contas corrente dos mesmos.
pendência: 23740
1) Pagamento Manual. Os documentos de CPMF passaram a aparecer para pagamento
2) Criação do Lote. Os valores estão sem máscara
3) Pagamento Manual. Ao se baixar um documento a grade para seleção está sendo fechada, necessitando nova consulta
4) Criação do Lote. O sistema está obrigando o preenchimento do Favorecido
Pendência: 23734
Tela: Tesouraria\Lote\Altera Lote
Descrição: Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
Pendência: 22486
Telas : Tesouraria\Pagamentos\Pagamentos X Recebimentos e todas as telas de Baixa de documentos do Cap e Car
Descrição: Utilizar somente portadores-forma específicos para encontro de contas (flag PORTADORFORMA.FLGENCCONTAS = 'S') para
fazer o encontro de contas. Nas Telas de Baixa, utilizar os demais portadores-forma.
================================================================================
CM$VER      3.04.13j    18/12/2006
--------------------------------------------------------------------------------
Pendência: 23195 (ajuste)
Tela: Recebimento automático (retorno)
Descrição do problema: Na baixa automatica, para os casos de liquidação em cheque, 
a rotina não está considerando o float do pagamento, conforme informado no campo 218 do arquivo.
================================================================================
CM$VER      3.04.13i    11/12/2006
--------------------------------------------------------------------------------
Pendência: 23195
Tela: Recebimento automático (retorno)
Descrição do problema: Na baixa automatica, para os casos de liquidação em cheque,
a rotina não está considerando o float do pagamento, conforme informado no campo 218 do arquivo.
================================================================================
CM$VER      3.04.13h    04/12/2006
--------------------------------------------------------------------------------
Pendência: 23827
Descrição: Qdo efeturarmos uma transferência entre contas qdo é gerado CPMF o documento 
esta sendo visualizado no CAP na tela Lançamento / Documentos / Registro, porém na tela de Conciliação de CPMF o 
registro não aparece. Ao excluirmos a transferência entre contas no Cfinan, o registro de CPMF não esta sendo excluido.
================================================================================
CM$VER      3.04.13g    01/12/2006
--------------------------------------------------------------------------------
Pendência: 23874  Tesouraria/Pagamento/Extorna\Exclui Lote\Documento
Descrição: Corrigido o erro em que ao extornar um documento/lote o valor não
estava sendo sensibilizado na disponibilidade financeira
================================================================================
CM$VER      3.04.13f    29/11/2006
--------------------------------------------------------------------------------
Pendência: 23735  Tesouraria/Pagamento/Manual
Descrição: Corrigido o erro encontrado no filtro "Lista documentos de cpmf", no qual
não estava sendo sensibilizado.
Pendência: 23814  Cadastros/Tipo de Desembolso/Parametrização contabil predominante
Descrição: Corrigido o erro em que não estava selecionando corretamente os registros
ao procurar.
================================================================================
CM$VER      3.04.13e    21/11/2006
--------------------------------------------------------------------------------
Pendência: 23435   lançamento /documento /registra
Descrição:  Caso o documento possua uma etapa aprovada pelo rad, solicitar uma confirmação
            para a Exclusão/Alteração.  No caso de alterar o documento será excluído o Rad
            e criado um Rad novo sem nenhuma etapa aprovada.
================================================================================
CM$VER      3.04.13d    14/11/2006
--------------------------------------------------------------------------------
pendência: 23740
Descrição:
1) Pagamento Manual. Os documentos de CPMF passaram a aparecer para pagamento
2) Criação do Lote. Os valores estão sem máscara
3) Pagamento Manual. Ao se baixar um documento a grade para seleção está sendo fechada, necessitando nova consulta
4) Criação do Lote. O sistema está obrigando o preenchimento do Favorecido
================================================================================
CM$VER      3.04.13c    25/10/2006
--------------------------------------------------------------------------------
Pendência:23440 (**Ajuste***)
Tela: tesouraria\Concilação de CPMF
Descrição:  A rotina de CPMF esta considerando a regra anterior nos casos de pagamentos manuais e o rateio sem relacionamentos. Ou seja, Um pagamento manual efetuado dia 22/09/2006, deveria aparecer amarelo no dia 03/10/2006, porém está aparecendo amarelo no dia 29/09/2006.
O rateio deste documento não tinha relacionamentos.
================================================================================
CM$VER      3.04.13b    18/10/2006
--------------------------------------------------------------------------------
Pendência:23440
Tela: tesouraria\Concilação de CPMF
Descrição:  A rotina de CPMF esta considerando a regra anterior nos casos de pagamentos manuais e o rateio sem relacionamentos. Ou seja, Um pagamento manual efetuado dia 22/09/2006, deveria aparecer amarelo no dia 03/10/2006, porém está aparecendo amarelo no dia 29/09/2006.
O rateio deste documento não tinha relacionamentos.
================================================================================
CM$VER      3.04.13a    10/10/2006
--------------------------------------------------------------------------------
Tela     : Sistema\Configurações\Relatórios\Emissões diversas\Borderô - débito em conta.
Descrição: Incluido campo de número sequencial para os lançamentos
================================================================================
CM$VER      3.04.13     06/10/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.12
Pendência: 23337
Tela : Consulta/Relatórios/Emissões diversas/Ficha Financeira
Descrição :Alteração para que a aba de contabilização e alteradores sejam
impressas sem que hajam lançamentos . Mesmo que a query esteja vazia , o
cabecalho da aba será impresso.
Pendência: 21432
Tela : Consulta/Relatórios/Operacionais/Alteradores Lançamento
Descrição :Implementação do módulo que lançou o documento, usuario que lançou
           documento   e  histórico complementar do documento.
Pendência: 23463    Cadastros / Tipo de Recebimento / Parametrização Contabil Predominante
descrição: Implementado o Filtro de patrocinadora no monta select.
Registro de Eventos
Pend 22213 - Implementação da tela "Cadastro - Tipos de Eventos" permitindo o cadastramento de tipos de eventos
para registro no histórico nos documentos
- Implementação de tela "Lançamentos- Documentos - Eventos" permitindo o  registro de eventos histórico
  gerais por documento. Serão registrados: Data do evento, tipo de evento, usuário de inclusão e observações
  gerais  do usuário.
- Inclusão da consulta dos registros de eventos em "Consulta - Documentos"
Pendência : 22005
Tela: Lançamento\ Documento \ Registra x RAD
Descrição: Implementação da alteração do valor para autorização no documento.
Pendência : 21175
Tela: Arquivo PAGFOR Banespa - PAGFOR
Descrição: Implementação da alteração do valor para autorização no documento.
Pendência : 22716
Tela: Tesouraria \ Pagamento \ Manual
Descrição: Implementação do Cálculo da CPMF do Santander
Pendência :22714
Tela:      Lancamento \ Documento \ Registra
Descrição: Correção do acúmulo dos valores lançados no documento  por módulos
           diversos para o mesmo mes
Pendência :22528
Tela:      Baixa Eletrônica
Descrição: Alteração do nro gerado no ato da baixa pelo nro do lote em que o doc.
          está vinculado .( Contábil Razão)
Pendência :23081
Tela:      Baixa Automática
Descrição: Alteração do portador forma do lote .
Pendência :22472
Tela:      Cria Lote \ Pagamento Manual
Descrição: Inserção do Plano Previdenciário na grid de pesquisa dos documentos
Pendência :22591
Tela:      Cadastro Tipo recebimento \ Desembolso
Descrição: Inserção  de flag para qde de cotas de Recebimento /Desembolso
           (CAP e CAR)
Pendência :23115
Tela:      Alteração de dados Bancários
Descrição: Implementação da crítica de lote gerado , na tela de alteração de
           dados bancários
Pendência :21603
Tela:      Tipo Desembolso
Descrição: Implementação do Parâmetro de dias de vencimento
Pendência :21703
Tela:      Baixa Doc (CAP e CAR)
Descrição: Implementação da conta corrente na tela de pagamento de documento e
           geração de lotes.
Pendência :22893
Tela:      Cadastro \ Portador Forma
Descrição: Acerto da query de iserção de um no portador forma.
Pendência :22086
Tela:      Relatórios \ Recolhimento de Encargos
Descrição: Implementação do filtro "quebra por plano patro" e botão para selecionar todos.
Pendência :22021
Tela:      Bloqueio Usuários
Descrição: Substituição do campo data pelo campo datahora em que foi feito o bloqueio.
Pendência :23154
Tela:      Ficha Financeira
Descrição: Acerto das abas de contabilização e alteradoes para que sejam impressas
           mesmo que não hajam lançamentos no detalhe.
Pendência :23197
Tela:      Lançamento \ Documento \ Registra
Descrição: Acerto do histórico na AP GERAL.
Pendência :23204
Tela:      Alteração documento alterador
Descrição: Acerto da visualização do doc mesmo qdeo o RAD está ligado.
Pendência :23025
Tela:      Alteração de documento
Descrição: Acerto do extorno de doc do lote.
Pendência : 20284
Tela : Consultas\Relatórios\Contas a Pagar\Operacional\Posição dos Lote
Implementar o relatório Posição dos Lotes - Segregado por Plano
Pendência : 22278
tela :\sistema\Configuração\Parâmetros
processo: Lançamento de documentos.
Descrição : Não permitir lançamentos de documentos de contas a pagar para planos diferentes. Para se determinar o mesmo plano do documento:
            Subplanos do mesmo plano possuim o campo PLANPREVCONTABIL.IDPLANOPREVPREV igual, ou
            o campo PLANPREVCONTABIL.CODSPC igual. Caso esteja parametrizado.
pendência: 21601
descrição: Implementar a baixa carimbada por plano de benefícios.
pendência: 21703
Tela     : Lançamentos/Documentos/Registra
descrição: Verifica se a forma de pagamento possui vínculo bancário. Havendo,
           torna obrigatório o preenchimento dos dados bancários
pendência: 21704
Tela     : Lançamentos/Documentos/Registra
descrição: Verifica a duplicidade do documento. Avisa ao usuário e espera a ação do
           mesmo.
Pendência : 23041
Tela: Cap\Tesouraria\Pagamento Automático
Descrição : Caso haja documentos no lote com parametrização contábil errada (exemplo),
informar seus números na mensagem de erro.
================================================================================
CM$VER      3.04.12c    06/10/2006
--------------------------------------------------------------------------------
Tela      : Sistema\Configurações\Relatórios\Emissões diversas\Borderô - débito em conta.
Descrição : Reajuste nos campos de banco,agencia e conta bancaria do favorecido
================================================================================
CM$VER      3.04.12b    05/10/2006
--------------------------------------------------------------------------------
Tela      : Sistema \ Configurações \ Relatórios \ Emissões diversas \ Broderô - débito em conta.
Descrição : Corrigido o erro em que os campos do relatório não estavam aparecendo.
================================================================================
CM$VER      3.04.12a    21/08/2006
--------------------------------------------------------------------------------
Pendência : 22528
Descrição : Deve constar no histórico contábil o Nº do lote do documento se o mesmo se encontar em um lote
(isso só ocorre se o documento for CAP).
Pendência: 23081
Autor    : Andre Tavares
Descrição: Fazer a baixa dos documentos com o portadorforma original dos documentos na Baixa automática.
================================================================================
CM$VER      3.04.12     19/08/2006
--------------------------------------------------------------------------------
liberação para o padrão 5.10.11
================================================================================
CM$VER      3.04.11     13/07/2006
--------------------------------------------------------------------------------
Liberação do Padrão  5.10.10
Pendência 18951
Tela: Lançamento Documento Registra
Descrição : Implementação do parâmetro que obriga o preenchimento do campo
            PROGRAMA , na tela  de lançamento de documento.
Pendência 22654
Tela: Impostos com tabela de Retenção
Descrição : Implementação do campo Código de Imposto, que será obrigátorio.
Pendência 21698
Tela: Principal - Novos Atalhos
Descrição : Adição de botão de atalho para a tela de lançamento de documento.
Pendência 22463
Tela: Cadastros\Tipos Desembolsos
Descrição : Este campo indica o número de dias úteis para vencimento do documento,
            caso não seja preenchido, vale o parâmetro do sistema.
Pendência 22469
Tela: Cadastros\Contas Bancárias\Caixa
Descrição : Utilize este cadastro para marcar contas correntes por plano de benefícios.
            Caso não possua nenhum registro a conta permanece inalterada, ou seja, não
            ocorrerá qualquer tipo de crítica. Para contas que possuam este parâmetro o
            contas a pagar não poderá liquidar documentos de planos diferentes nestas
            contas.
Pendência 22434
Tela: Cadastros\Contas Caixa x Tipo Cobrança
Descrição : Este campo será utilizado na tela de lançamentos de
            documentos. Quando selecionado um tipo de documento com um portador forma
            associado, este obrigatoriamente será selecionado na tela.
            
Pendência 22515
Tela: Sistema \Configuração \Parâmetros do Sistema
        Lançamento\Documentos\Registra
Descrição: 
 -Criado o conceito de Parametrização Contábil Predominante
 -Reestruturada a arvore de menu do cadastro 
 - Verificar documentação em anexo
================================================================================
CM$VER      3.04.10     10/05/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.09
Pendência: 21659 (CAP) - Recebimento Automático do Banco Banespa Cnab 240
 - Pagto de Fornecedores
layout: Banespa Cnab 240 - Pagto de Fornecedores
Histórico de alterações efetuadas no módulo Contas a Pagar
Pendência: 22197
Tela: Tesouraria/Conciliação de CPMF
Descrição do erro: Ao conciliar uma CPMF de pagamento em lote, que o documento tenha 
alterador, na tela de conciliação, os campos: Base de Cálculo e CPMF Calculada estão saindo 
com os valores brutos.
Pendência : 22037
Descrição : verificar se o documento foi estornado, caso positivo
            pode-se permitir sua alteração mesmo que conste em um lote.
================================================================================
CM$VER      3.04.09j    12/04/2006
--------------------------------------------------------------------------------
pendência 21940
Tela: CONSULTA\RELATÓRIOS\GERENCIAIS\VALORES PAGOS X CENTRO DE RESPONSABILIDADE
Descrição:  Acerto no relatório VALORES PAGOS x CENTRO DE RESPONSABILIDADE
pendência: 21669
Descrição: O sistema está permitindo alterações e exclusões de lançamentos quando a disponibilidade financeira está bloqueada. No padrão 7 o erro também ocorre.
Fazer também no CAR.
pendencia: 21775
Descrição: Ao reprogramar um valor de CPMF, a rotina não está considerando a regra do decendio, e está enviando os valores para a sexta-feira seguinte.
pendencia: 21647
Descrição: O sistema deve permitir o lançamento de alteradores mesmo após a baixa do documento.
pendencia: 21735
Descrição: Quando o imposto for pela  data de lançamento, não pode haver a mensagem " O documento não pode ser excluido/ estornado. Já foi gerado um DARF para pagamento."
================================================================================
CM$VER      3.04.09i    11/04/2006
--------------------------------------------------------------------------------
pendência 21744
Tela: Relatório posição por Fornecedor
Descrição: Acerto para contas de múltiplas baixas
================================================================================
CM$VER      3.04.09h    24/03/2006
--------------------------------------------------------------------------------
pendência 21889
Tela: Sistema \Utilitários \Importação de Lançamentos
Descrição: Corrido erro na execução do processo
================================================================================
CM$VER      3.04.09g    23/03/2006
--------------------------------------------------------------------------------
pendência 21873
Tela: Tesouraria\Emissão de documentos\Remessa Eletrônica
Descrição: Ocorre um erro com mensagem em branco e não gera o arquivo bancário.
================================================================================
CM$VER      3.04.09f    29/03/200
--------------------------------------------------------------------------------
Pendência: 21744(CAP) -  Conforme analises realizadas, no relatório de posições
de fornecedores, não está saindo alguns documentos. (múltiplas baixas)
================================================================================
CM$VER      3.04.09e    17/03/2006
--------------------------------------------------------------------------------
Pendencia: 21667
Tela     : Tesouraria\Emissão de Documentos\Remessa Eletrônica
Descricao: Corrigido o erro em que ao gerar uma remessa eletrônica com mais de
           um lote, o histórico no financeiro relatava apenas o registro de um
           lote.
================================================================================
CM$VER      3.04.09d    14/03/2006
--------------------------------------------------------------------------------
Pendencia: 21715 (CAP)
Tela     : Tesouraria\conciliação de CPMF
Descricao:  Na tela de conciliação de CPMF, os lotes baixados ou pagamentos manuais, não estão gravando a base de cálculo, nem a cpmf Calculada.
Pendencia: 21669 (CAP)
Tela     : Lançamento/Documento/Registra
           Não permitir inclusão, alteração e exclusão de documentos que estejam com a dis-
           ponibilidade financeira bloqueada.
Pendência: 21647 (CAR)
Tela     : Recebimento Automático
Descrição: Nao está Baixando os documentos agrupados cujo valor total contante no arquivo
           de retorno estão divergentes dos valores da base.
================================================================================
CM$VER      3.04.09c    03/03/2006
--------------------------------------------------------------------------------
Pendencia 29219
Descrição: Implementação da programação dos lançamentos de CPMF segundo as regras
publicadas no dia´rio oficial.
Pendência 21634
Tela : Tesouraria\Emissão de Documentos\remessa Eletrônica
Descrição : Acerto da geração de remessa em lotes
================================================================================
CM$VER      3.04.09b    24/02/2006
--------------------------------------------------------------------------------
Pendência 21219
Tela: Tesouraria\Conciliação de CPMF
Descrição: Ajuste na tela de conciliação do cpmf.
================================================================================
CM$VER      3.04.09a    27/02/2006
--------------------------------------------------------------------------------
Pendência : 21510
Tela: Tesouraria\Conciliação de CPMF
Descrição: Na baixa de CPMF apresenta a mensagem de erro "field not found 'IDMODULO' " 
================================================================================
CM$VER      3.04.09     23/01/2006
--------------------------------------------------------------------------------
Pendências liberadas no padrão 5.10.08
Pendência 19335
Relatório: \Operacionais\Documentos Pagos X Lotes
Descrição: Disponibilizar o campo data de lançamento na query do relatório.
================================================================================
CM$VER      3.04.08b    01/02/2006
--------------------------------------------------------------------------------
Pendência: 21352
Tela: Tesouraria\Remessa Eletrônica e Telas de Baixa de Documentos
Descrição: Não estava respeitando o Float ao lançar no Financeiro.
================================================================================
CM$VER      3.04.08a    01/11/2005
--------------------------------------------------------------------------------
Pendência : 20640 Tesouraria\Conciliação de CPMF
Descrição : Corrigido o erro gerado pela pendência 19331 em que os registros
            referente a CPMF não estavam aparecendo na tela de conciliação de
            CPMF, mesmo não estando baixados
================================================================================
CM$VER      3.04.08     16/08/2005
--------------------------------------------------------------------------------
Pendências liberadas no padrão 5.10.07
Pendência : 19331 Consultas\Relatórios\Gerenciais\CPMF - Conciliação
Descrição : Implementado o relatório de conciliação de CPMF
Pendência : 18588 \ Lançamentos\Documentos\Registra
Descrição : Não permitir que documentos com adiantamentos já regularizados
            sejam alterados sem antes excluir a regularização do mesmo
================================================================================
CM$VER      3.04.07     16/06/2005
--------------------------------------------------------------------------------
Pendência : 19296
Descrição : Corrigido o erro de que quando o parâmetro segregação virtual estava
ligado o sistema gerava erro no momento de se inserir um rateio
Pendência 19281
Tela: Lançãmentos\Documentos\Registra
Descrição do erro: ao selecionar um documento para alteração, a contabilização não está ficando completa.
Pendência 17317
Tela: Sistema\Configuração\Históricos Contábeis
Descrição: Gravar o histórico contábil configurável.
Pendência 18771
Tela: Lançamentos\Documentos\Agrupa Parcelas
Descrição: Fazer Agrupamentos/Parcelamentos de documentos com múltiplas contas de baixa.
Pendência : 19097
Descrição : retirar os parâmetros FLGEXCLUIPLANIL e FLGEXCLUICONTAB
Pendência 18693
Descrição: Ajuste do método AjustaDataFloat, o cálculo da data com float será igual em todos os sistemas.
Pendência : 18937
Tela: Operações\Lançamentos\Documentos
Descrição : Desabilitar os botoes de inserir excluir e alterar da aba de contabilização
e deletar a contabilizacao ao sair da aba.
Pendência: 19024 (CMintBancoMT50)
Layout: Recebimento do arquivo de retorno do Banco Real CNAB 240
Descrição do erro: Não está facendo o recebimento automático com este layout.
Pendência 19042
Layout: Bradesco Pagamento de Fornecedores CNAB 500 (CMintBancoMT50)
Descrição do erro: ocorre erro de cálculo do dígito verificador no recebimento pelo banco quando a forma de pagamento é uma ficha de compensação.
Pendência: 18008
- Implementação do Filtro "Tipo de Desembolso" na tela do relatório
  "Demonstrativo de Atos de Gestão por AP"
Pendência: 19012
- Acerto na tela de Transferência entre Contas Bancárias no cálculo da CPMF
  negativa.
Pendência: 18926
- Validar a Regra de Feriado de acordo com o Estado/Cidade do Portador-Conta
  na CPMF.
Pendência: 19025
- Foi colocado o campo Tipo de Desembolso na tela do tipo de alterador.
================================================================================
CM$VER      3.04.06u    06/05/2005
--------------------------------------------------------------------------------
Pendência: 19024 (CMintBancoMT50)  *** ajuste ***
Layout: Recebimento do arquivo de retorno do Banco Real CNAB 240
Descrição do erro: Não está facendo o recebimento automático com este layout.
================================================================================
CM$VER      3.04.06t    22/04/2005
--------------------------------------------------------------------------------
Pendência : 18937
Tela: Operações\Lançamentos\Documentos
Descrição : Desabilitar os botoes de inserir excluir e alterar da aba de contabilização
e deletar a contabilizacao ao sair da aba.
Pendência: 19024 (CMintBancoMT50)
Layout: Recebimento do arquivo de retorno do Banco Real CNAB 240
Descrição do erro: Não está facendo o recebimento automático com este layout.
Pendência 19042
Layout: Bradesco Pagamento de Fornecedores CNAB 500 (CMintBancoMT50)
Descrição do erro: ocorre erro de cálculo do dígito verificador no recebimento pelo banco quando a forma de pagamento é uma ficha de compensação.
================================================================================
CM$VER      3.04.06s    31/03/2005
--------------------------------------------------------------------------------
Pendência : 18368
Tela      : Tesouraria\Conciliação de CPMF
Descrição : Não permitir que seja possível alterar a DATAPROGRAMADA
            para um período bloqueado da Contabilidade.
================================================================================
CM$VER      3.04.06r    22/04/2005
--------------------------------------------------------------------------------
Pendência: 17828
Tela: Consulta / Relatórios / Operacionais / Posição por fornecedores
Descrição: Colocar o campo correspondente a conta baixa no relatório .Tabela ccbaixaxdocum.
- Pendência 17379
Tela: Lançamento/Documentos/Registra
Descrição: Solucionado o problema que ocorria quando ao alterar ou excluir
           um compromisso no rateio do documento. O compromisso antigo
           continuava como efetivado, impossibilitando o cancelamento do mesmo
           no sistema de Orçamento.
Pendência  : 18368
Descrição  : Não permitir que seja possível alterar a DATAPROGRAMADA
             para um período bloqueado da Contabilidade
================================================================================
CM$VER      3.04.06q    25/02/2005
--------------------------------------------------------------------------------
Pendência 18359 - Conciliação de CPMF
Utilizando parametrização do CFINAN para gerar documentos de CPMF para
transferências bancárias.
Pendência 18641 - Tesouraria \ Pagamento \ Pagamentos x Recebimentos
Liberada a regularização de lançamentos com data posterior a de hoje
================================================================================
CM$VER      3.04.06p    24/02/2005
--------------------------------------------------------------------------------
Pendência 18508
Tela:Consultas\Relatórios\Emissões diversas\Recolhimento de Encargos (cap)
Descrição do erro: - Os impostos dos documentos estornados do módulo Contratos não estão vindo no relatório com os valores zerados.
                   - Implementação feita na pendência 18584
================================================================================
CM$VER      3.04.06o    22/02/2005
--------------------------------------------------------------------------------
- Pendência 17379
Tela: Lançamento/Documentos/Registra
Descrição: Solucionado o problema que ocorria quando ao alterar ou excluir
           um compromisso no rateio do documento. O compromisso antigo
           continuava como efetivado, impossibilitando o cancelamento do mesmo
           no sistema de Orçamento.
================================================================================
CM$VER      3.04.06n    18/02/2005
--------------------------------------------------------------------------------
Pendência : 18696
Descrição : Ao fazer o recebimento manual o sistema não estava considerando, o parametro considera FLOATS
            para fins de semana, qdo tem feriado subsequente ao fim de semana.
Pendência : 18544
Descrição : Ordenar o relatório pelo campo data da geração
Pendência : 18538
Descrição : Incluir o filtro para impressão por patrocinadora
Pendência : 18539
Descrição : Incluir o filtro para impressão por patrocinadora
================================================================================
CM$VER      3.04.06m    15/02/2005
--------------------------------------------------------------------------------
Pendência : 17979
Descrição : Permitir alteração do campo histório do lançamento, preenchido na tela
            de lançamento documento registra.
Pendência : 18595
Descrição : Corrigido o erro que após a importação de lançamentos no CAR não aparecia
            nos documentos lançados a informação de Contas/Caixas x Tipo Cobrança na
            guia Dados para o Lançamento e na guia Geral o campo Tipos de Cobrança.
================================================================================
CM$VER      3.04.06l    02/02/2005
--------------------------------------------------------------------------------
Pendência : 18498
Descrição : Correção na tela de Parâmetros do Sistema, na aba Baixas, no campo Momento de lançamento no Financeiro,
            o sistema não estava considerando a parametrização de 'Exclusivamente no pagamento do documento.' .
Pendência : 18549
Descrição : Correção no sistema que não estava respeitando o parâmetro  'Lança no Controle Financeiro',
            na tela Contas / Caixa x Forma de Pagamento.
================================================================================
CM$VER      3.04.06k    27/01/2005
--------------------------------------------------------------------------------
Pendência: 18546
Tela: Sistema\Utilitários\Imortação de Lançamentos
Descrição do ERRO: Não está funcionando a importação de lançamentos.
================================================================================
CM$VER      3.04.06j    27/01/2005
--------------------------------------------------------------------------------
- Pendência 18492: - Implementação de crítica no TIPO DE DESEMBOLSO, anterior
  a seleção do COMPROMISSO ORÇAMENTÁRIO. Revisto/alterado os procedimentos de
  crítica após ser DIGITADO o número do Compromisso Orçamentário sem utilizar
  o botão que chama um MONTA SELECT.
================================================================================
CM$VER      3.04.06i    25/01/2005
--------------------------------------------------------------------------------
Pendência 17666 - Gravação da Data de Disponibilidade na  tabela Documento
quando da baixa dos documento vindo do sistema de Investimentos
================================================================================
CM$VER      3.04.06h    20/01/2005
--------------------------------------------------------------------------------
Pendência: 18546
Tela: Sistema\Utilitários\Imortação de Lançamentos
Descrição do ERRO: Não está funcionando a importação de lançamentos.
- Pendência 18492: Implementação de crítica no TIPO DE DESEMBOLSO, anterior
  a seleção do COMPROMISSO ORÇAMENTÁRIO. Revisto/alterado os procedimentos de
  crítica após ser DIGITADO o número do Compromisso Orçamentário sem utilizar
  o botão que chama um MONTA SELECT.
Pendência: 18494
Layout: Todos que utilizam o número sequencial de emissão de arquivos bancários
Descrição: gerar a seqüência de emissão de arquivos bancários por convênio bancário.
Pendencia: 18245
Tela: Cobrança\Cobrança Bancária\Mensagens x Documentos
Descrição: Permite que sej gravado mensagem para um grupo de
documentos quando o documento selecionado está agrupado.
Pendencia: 18246
Tela: Cobrança/Cobrança Bancária/Emissão/Ficha de Compensação/Impressão
Descrição: está imprimindo separadamente os documento com data de emissao
diferentes mesmo quando o documento está agrupado.
================================================================================
CM$VER      3.04.06g    20/01/2005
--------------------------------------------------------------------------------
- Pendencia: 18392
  Descrição: Desmarcar o flg OK e marcar o fgl Recalcula dos registros pintados de rosa.
================================================================================
CM$VER      3.04.06f    14/01/2005
--------------------------------------------------------------------------------
- Pendencia: 18324
           Não permitir que documentos importados pelo CAP/CAR
           não sejam alterados.
================================================================================
CM$VER      3.04.06e    13/01/2005
--------------------------------------------------------------------------------
- Pendência 18323 - Transferência de Classificação
  Gerando apenas uma planilha de transferência
  Obrigando a transferência contábil
  Corrigindo a transferência quando for um documento com múltiplas contas de baixa
  Corrigindo o parâmetro sincroniza
  Criando o parâmetro "Tipo de Operação"
- Pendência 18300 - Implementado o relatório de CPMF por Plano x Patro
- Pendência 18475
  Após a criação do lote e emissão da forma de pagamento (bordero/cheque/arquivo),
  se este mesmo lote é cancelado, a CPMF gerada não está sendo excluída da tela de Conciliação
================================================================================
CM$VER      3.04.06d    07/01/2005
--------------------------------------------------------------------------------
- Pendencia 18421 - Acerto na visualização dos registros de CPMF quando efetua baixa automática.
  O sistema não estava calculando novamente a CPMF, apenas estava mostrando registros
  de forma indevida
================================================================================
CM$VER      3.04.06c    06/01/2005
--------------------------------------------------------------------------------
* acerto na transferencia de classificação
Pendências: 17669, 18143, 18157, 18241, 18349, 18362, 18363
- Reformulação da tela de conciliação de CPMF
================================================================================
CM$VER      3.04.06b    21/12/2004
--------------------------------------------------------------------------------
Pendência: 17884
Layout: Todos.
Descrição: nas telas de emissão de arquivos intbando das Folhas de Benefício e de pagamento não exibir o arquivo gerado.
================================================================================
CM$VER      3.04.06a    17/12/2004
--------------------------------------------------------------------------------
Pendência: 18107 - Lançamento de Documentos (Segregação Virtual Ativa)
Implementada a crítica de Programa x Plano Previdenciário
================================================================================
CM$VER      3.04.06     14/12/2004
--------------------------------------------------------------------------------
Correção de problema na aprovação de RAD por documentos.
Pendência: 17102  (CAP CAR)
Tela: Consultas\Relatórios\emissoes diversas\recolhimento de encargos
Descrição: Ao estornar um documento os alteradores estornados devem apracer com os valores zerados no relatório .
Pendência: 18178 (CAP CAR)
Tela: Lançamento\Documento\Registra
Descrição: não permitir que se altere ou exclua um documento se o mesmo contar num arquivo emitido ao banco ou se hover um boleto emitido para o mesmo.
Pendência: 18013 (CAR)
Tela: Cobrança\Recebimento\Automático (retorno)
Descrição: Executar o commit da tranzação a cada documento baixado com sucesso, os documentos não baixados com sucesso serão listados no arquivo de log de erro
Pendência: 17696
Tela: Consulta\Relatórios\Contábis\Cap x Contabilidade
Descrição: Disponibilizar para o relatório 2 colunas: uma com a diferença entre Créditos contábeis e Créditos Cap e outra
com a diferença entre os Débitos contábeis e e Débitos Cap.
Pendência: 15382
Tela: Cadastros\Alterador x Centro de Custo x Conta Contábil
Descrição: Exibir sempre o código externo do centro de custo e filtar pelo campo idplancentcust.
Pendência: 17587
Tela: Lançamento \Documentos \Registra
Tela: Cadastros \Parões de Rateio para Lançamento
Elimiar Plano Previdenciários Contábeis inativos da visualiação.
Pendência: 17193 - Lançamento \Documentos \Registra
Ajustes no sistema para permitir Plano Administrativo
Pendência: 17992 - Lançamento \Alterar Data Programada
Não permitir a alteração da data programada de um documento que esteja em lote
Pendencia 18043 - Acerto na gravação da Patrocinadora na contabilização da Transferência de Classificação
Pendencia 16583 - Acerto na habilitação dos botões na tela de Documentos
================================================================================
CM$VER      3.04.05a    19/11/200
--------------------------------------------------------------------------------
Pendência: 18122 (CAR)
Tela: Cobrança/ Emissão/ Ficha de Compensação/ Imprimir
Descrição: As mensagens dos boletos estão saindo desenquadradas.
Pendência: 18126
Tela: Lançamento / Documento / Adiantamento
Descrição: Corrigir a procura do documento de adiantamento quando mesmo estiver baixado.
================================================================================
CM$VER      3.04.05     08/11/2004
--------------------------------------------------------------------------------
Pendência: 16929
Tela: Consulta\Relatórios\Emissões Diversas\Guia de Recebimento
Descrição: Foi colocado a opção para apresentar ou não Lançamentos de Provisionamento Contábil
================================================================================
CM$VER      3.04.04z    09/11/2004
--------------------------------------------------------------------------------
- Pendência 17465 - Gravar corretamente o histórico da conciliação da CPMF.
- Pendência 17669 - Alteração na geração de documento para não gravar mais o campo unidnegoc na tabela documento.
================================================================================
CM$VER      3.04.04y    08/11/2004
--------------------------------------------------------------------------------
- Pendencia 17726 - Mostrar múltiplas contas de baixa na Ficha de Pagamento
================================================================================
CM$VER      3.04.04x    25/10/2004
--------------------------------------------------------------------------------
Pendência: 17541 (Reabertura)
Tela: Alteração de Dados Bancários do Documento
Descrição: Permitir a alteração da observação e da referência (número processo) de um documento gerado por um outro módulo.
- Acerto na tela de Conciliação e Baixa de CPMF e os relatórios, quando da transferência entre contas
================================================================================
CM$VER      3.04.04v    13/10/2004
--------------------------------------------------------------------------------
- Acerto na busca de dados para baixa de CPMF na tela de Conciliação de CPMF
================================================================================
CM$VER      3.04.04u    08/10/2004
--------------------------------------------------------------------------------
- Na tela de conciliação de CPMF, mostrar individualmente os registros de transferência entre contas e o Valor do Lote sendo o valor da transferência
- Pendencia 17875: Na tela de criação de lote, inserida a coluna saldo, na parte de documentos pendentes para pagamento. Essa coluna já existia antes.
================================================================================
CM$VER      3.04.04t    05/10/2004
--------------------------------------------------------------------------------
- Implementação do CPMF sobre transferência entre contas de investimento
================================================================================
CM$VER      3.04.04s    18/10/2004
--------------------------------------------------------------------------------
Pendência: 16971
Tela: Sistema\configuração\Parâmetros do sistema
Descrição: Implementação do parâmetro do Cap e do Car para Integração com o orçamento,
para o cap e o car esse parâmetro agora será gravado na tabela ParamCap.
================================================================================
CM$VER      3.04.04r    29/09/2004
--------------------------------------------------------------------------------
Pendência: 17785
Tela: Consultas\Relatórios\Recolhimento de Encargos
Descrição: O relatório não estava trazendo os encargos de INSS de Autônomos.
================================================================================
CM$VER      3.04.04q    22/09/2004
--------------------------------------------------------------------------------
Pendência: 17753
Tela: Tesouraria\Conciliação de CPMF
Descrição: Acerto na apresentação dos valores que estavam duplicados.
================================================================================
CM$VER      3.04.04p    15/09/2004
--------------------------------------------------------------------------------
Pendência: 16954
Tela: Baixas dde documentos(car) 
Descrição: criação de ium parâmetro que possibilita fazer os floats do CAR considerarem somente dias úteis.
Pendência: 17687
Tela: Cosultas\relatórios\Contabeis\Cap x Contabilidade
Descrição: o usuário não consegue alterar os campos do relatório, pois os mesmos não aparecem na edição do mesmo.
Pendência: 17619
Tela: Sistema\Utilitários\Parâmetros de Trnaferência de Classificação
Descrição: Remoção deste item de menu.
Pendência: 17684
Tela: Lançamentos\Documentos\Registra
Descrição: Caso o usuário escreva como histórico do lançamento do CAP/CAR a palavar "estorno", o montaselect não traz o documento na consulta.
================================================================================
CM$VER      3.04.04o    13/09/2004
--------------------------------------------------------------------------------
Pendência: 17080
Tela: Consultas\Relatórios\Emissões diversas\Demonstrativo de Atos de gestão por AP
Descrição: criação do filtro que possibilita que o usuário escolha se exibe ou não os 
documentos com saldo zerado.
================================================================================
CM$VER      3.04.04n    30/08/2004
--------------------------------------------------------------------------------
Pendência : 17315 
Tela: Consultas\Relatórios\Emissões Diversas\Requisição de Pagamentos.
Descrição :  criado o checkBox para filtrar os ususários desabilitados.
================================================================================
CM$VER      3.04.04m    27/08/2004
--------------------------------------------------------------------------------
Pendência : 17279
Tela: Lançamentos\Documentos\Registra
Descrição : trazer os campos preenchidos do na inserção rateio como default e
não permitir inserir registros repetidos de rateio.
================================================================================
CM$VER      3.04.04l    26/08/2004
--------------------------------------------------------------------------------
- Pendencia 17419 - Tela Tesouraria/Conciliação de CPMF: Implementado o relatório "Faltam Relacionamentos"
================================================================================
CM$VER      3.04.04k    17/08/2004
--------------------------------------------------------------------------------
Pendência: 17128
Tela: Consultas\Relatórios\Emissões Diversas\Ficha Financeira de Pagamento e Recebimento
Descrição: O Relatório não está exibindo o Plano Previdenciário correto da contabilização.
================================================================================
CM$VER      3.04.04j    12/08/2004
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 17344
  Tela\Opçao No Sistema: Sistema | Utilitários | Importação de Lançamentos Padrão
  Alteração na consulta que verifica se já existe rateio identico ao fornecido acrescentando 
os campos IDPATRO, IDPLANOPREV  e  IDPROGRAMA à consulta.
  Alteração para que caso o documento (NODOCUMENTO) já exista na tabela Documento
para o mesmo fornecedor/cliente, gere uma mensagem de erro.
================================================================================
CM$VER      3.04.04i    05/08/2004
--------------------------------------------------------------------------------
Pendência: 17290
Tela: Lancamentos\documentos\Registra\contabilizacao
Descricao: Erro no combo de centro de custo ao clicar no botão de OK do detalhe.
Pendência: 17291
Tela: Consultas\Relatórios\Emissoes diversas\ Autorizacao de Pagamentos
================================================================================
CM$VER      3.04.04h    02/08/2004
--------------------------------------------------------------------------------
Pendência: 17102
Tela: Consultas\Relatórios\Emissões Diversas\Recolhimento de Encargos
Descrição: Os alteradores de um documento que foi estornado devem aparecer com o valor = 0, pois os mesmos foram estornados também.
================================================================================
CM$VER      3.04.04g    19/07/2004
--------------------------------------------------------------------------------
- Pendencias 15365,15366,15369,15379,15380,15381,15378,15373: Acerto nas telas que usam Centro de Custo e Centro de Responsabilidade para que somente utilizem registros Ativos e do Plano parametrizado no Global
================================================================================
CM$VER      3.04.04f    13/07/2004
--------------------------------------------------------------------------------
- Corrigido o arredondamento da CPMF na tela de conciliação de CMPF.
================================================================================
CM$VER      3.04.04e    05/07/2004
--------------------------------------------------------------------------------
Pendência: 17114
Tela: Importação de lançamentos
Descrição: ao importar lançamentos, os documentos deverão ser contabilizado por plano e patro comforme o arquivo.
================================================================================
CM$VER      3.04.04d    29/06/2004
--------------------------------------------------------------------------------
Pendência: 17050
Tela: Cadastros\Padrões para Rateio
Descrição: Atualizar o campo com o total percentual do rateio aoclicar no botao de OK do detalhe
================================================================================
CM$VER      3.04.04c    28/06/2004
--------------------------------------------------------------------------------
- Pendencia 16967 - Acerto na tela de Transferencia de Classificação
================================================================================
CM$VER      3.04.04b    24/06/2004
--------------------------------------------------------------------------------
Pendência : 16855
Tela: Tesouraria\Pagamentos\Automático
Descrição : Verifica se o lote já foi baixado antes de processar a baixa.
Isso evita que usuários concorrentes que tenham selecionado o mesmo lote processem a mesma baixa.
================================================================================
CM$VER      3.04.04a    18/06/2004
--------------------------------------------------------------------------------
Pendência: 16992
Tela: Lançamento\Documentos\Registra
Descrição: no lançamento de documentos com rateio pré-definido, não está lançando os
percentuais de crédito(passivo)  e também não esta gravando os campos CodCentrocusto 
e nome do centro de custo.
================================================================================
CM$VER      3.04.04     17/06/2004
--------------------------------------------------------------------------------
Pendência 14646 - Contas a Pagar
- Criação de processos RAD para lançamentos de documentos.
================================================================================
CM$VER      3.04.03u    04/08/2004
--------------------------------------------------------------------------------
Tela Conciliação de CPMF, O foco da CPMF passa a ser a CPMF calculada e não mais
a prevista.
================================================================================
CM$VER      3.04.03i    03/06/2004
--------------------------------------------------------------------------------
Pendência: 15365
Tela: Utilitários\Altera Centro de Responsabilidade
Descrição: substituir a exibição do código de centro de responsabilidade pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON.
Pendência: 15366
Tela: Utilitários\Exportação de Lançamentos
Descrição: substituir a exibição do código de centro de responsabilidade pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON.
Pendência: 15367
Tela: Lançamentos\Documento\Registra
Descrição: substituir a exibição do código de centro de responsabilidade e de centro de custo pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON e IDPLANCENTCUSTO.
Pendência: 15368
Tela: Lançamentos\Documento\Registra\Contabilização
Descrição: substituir a exibição do código de centro de responsabilidade e de centro de custo pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON e IDPLANCENTCUSTO.
Pendência: 15369
Tela: Lançamentos\Documento\Alteradores
Descrição: substituir a exibição do código de centro de responsabilidade e de centro de custo pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON e IDPLANCENTCUSTO.
Pendência: 15370
Tela: Lançamentos\Contratos\Previsoes\Registra   -  centro de responsabilidade
Descrição: substituir a exibição do código de centro de responsabilidade pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON .
Pendência: 15371
Tela: Lançamentos\Contratos\Previsoes\Registra - centro de custo
Descrição: substituir a exibição do código  de centro de custo pelo código 
externo e filtrar a seleção peli campo IDPLANCENTCUSTO.
Pendência: 15372
Tela: Lançamento de Adiantamento\Rateio - centro de custo e centro de responsabilidade
Descrição: substituir a exibição do código de centro de responsabilidade e de centro de custo pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON e IDPLANCENTCUSTO.
Pendência: 15373
Tela: Tesouraria\Conciliação de CPMF/auditoria/centro de custo 
Descrição: substituir a exibição do código de centro de responsabilidade e de centro de custo pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON e IDPLANCENTCUSTO.
Pendência: 15374
Tela: Tesouraria\Conciliação de CPMF/relatórios analíticos com rateio e analítico inconsistente com raeio/Centro de custo- centro de custo e centro de responsabilidade
Descrição: substituir a exibição do código de centro de responsabilidade e de centro de custo pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON e IDPLANCENTCUSTO.
Pendência: 15375
Tela: Cadastros\Contas bancárias\centro de custo
Descrição: substituir a exibição do código de centro de responsabilidade e de centro de custo pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON e IDPLANCENTCUSTO.
Pendência: 15376
Tela: Cadastros\Contas Caixa x Forma de Pagamento
Descrição: substituir a exibição do código  de centro de custo pelo código 
externo e filtrar a seleção peli campo IDPLANCENTCUSTO.
Pendência: 15377
Tela: Cadastros\ Tipos de Alteradores
Descrição: substituir a exibição do código  de centro de custo pelo código 
externo e filtrar a seleção peli campo IDPLANCENTCUSTO.
Pendência: 15378
Tela: Cadastros\ Impostos Com Tabela de Retenção
Descrição: substituir a exibição do código de centro de responsabilidade pelo código 
externo e filtrar a seleção peli campo IDPLANCENTRESPON .
================================================================================
CM$VER      3.04.03h    19/05/2004
--------------------------------------------------------------------------------
Pendência: 16798
Tela: Consulta Relatórios\Emissões Diversas\Autorização de Pagamento AP.
Descrição: Corrigir o Relatório para que o mesmo repeite a estrutura de múltiplas contas de baixa.
================================================================================
CM$VER      3.04.03g    17/05/2004
--------------------------------------------------------------------------------
Pendência: 16708
Tela: Sistema\Utilitários\Importação de Lançamentos.
Descrição: O campo Histórico de lançamentos não está sendo importado corretamente.
================================================================================
CM$VER      3.04.03f    10/05/2004
--------------------------------------------------------------------------------
Pendência 16650
Tela: Cadastro\Contas Caixa X tipos de Cobrança
Descrição: o campo CONTROLEREMESSA a ser atualizado tem que ser o 
da tabela modeloscnab para que diferentes módulos não enviem arquivos de remessa 
com o mesmo número sequencial.
================================================================================
CM$VER      3.04.03e    04/05/2004
--------------------------------------------------------------------------------
Pendência 16330
Tela Relatório\ Emissões diversas\  Autorização de pagamento Modelo 2
Descrição: criar o campo flgImprimeap na tabela tipodocrecpag (tela cadastros\Tipos de documentos)
este campo deverá ser utilizado nas queriesde emissão de APs para filtrar aqueles tipos de documento que
tem o campo flgimprimeap = 'N'.
================================================================================
CM$VER      3.04.03d    30/04/2004
--------------------------------------------------------------------------------
Pendência 16342
tela : Tesouraria\Emissão de Documento\Remessa Eletrônica do CAP
Descrição: validar a digitação do código de barras de Arrecadações pra que seja possível
fazer remessa bancária de arrecadações.
Pendência 16220
tela: Lançamento \Documento \Registra
Descrição: Implementado o cálculo da CPMF para documentos com Lança e Baixa 
Simultânea
================================================================================
CM$VER      3.04.03c    27/04/2004
--------------------------------------------------------------------------------
- Pendencia 16592 - Alteração no Relatório de Recolhimento de Encargos, permitindo 
  selecionar mais de um tipo de encargo. O relatório agora está agrupado por Tipo de 
  Encargo e totalizando o valor a recolher por grupo
================================================================================
CM$VER      3.04.03b    20/04/2004
--------------------------------------------------------------------------------
Pendência 15618 - Emissão de cheques
- Impedir seleção concomitante do campo "Destina-se" e outros para impressão no verso do cheque.
================================================================================
CM$VER      3.04.03a    19/04/2004
--------------------------------------------------------------------------------
Pendência: 15886
Tela: Lancamento\Documento\Registra
Descrição: Inserir na orelha rateio (no Grid) o campo Comp. Orçamen para que seja 
possível visualizar o número do compromisso orçamento após a inserção do detalhe rateio.
================================================================================
CM$VER      3.04.03     16/04/2004
--------------------------------------------------------------------------------
Pendencia 15733 : Validação de Plano / Patro no lançamento de documento conforme cadastro no Global
Pendência 15681 - Relatório de Tipos de Desembolso
- Filtragem e visualização do campo ATIVO.
Reformulação do cadastro: Tipos de Desembolso x Impostos Agregados
================================================================================
CM$VER      3.04.02c    30/03/2004
--------------------------------------------------------------------------------
Pendência 16244
Tela : Cadastros\Contas Caixa X Forma de Pagamento
Descrição: Criação do checkBox "Utiliza Alteradores no envio" para indicar se o portadorfoma permite o lançamento de 
alteradores no momento do lancamento do documento e  possibilitando implementação da pendência 16244.
================================================================================
CM$VER      3.04.02b    17/03/2004
--------------------------------------------------------------------------------
Pendência 16135 - Estorno de Documento
- Permitir alteração de documentos estornados.
Pendência 16143 - Ficha Financeira
- Resolução de problema na impressão do cabeçalho de contabilizações cujo campo "PLNCODIGO" estava vazio
Pendência 16077 - Ficha Financeira
- Incluídos na query os campos PATROCINADORA e PLANO.
Pendência 16183 - Autorização de Pagamento - AP
- Alterada a condição da query para trazer documentos parcialmente pagos.
================================================================================
CM$VER      3.04.01b    03/03/2004
--------------------------------------------------------------------------------
Pendência: 14177
Tela: Estorno de documento
Descrição: Ao estornar um documento, nos históricos contábeis e financeiros não vem a 
palavra estorno para identificação do lançamento.
================================================================================
CM$VER      3.04.00a    20/02/2004
--------------------------------------------------------------------------------
Pendência 14836
Tela : Principal
Descrição: retirar o ítem de menu Cosultas\Saldo que não tem funcionalidade.
================================================================================
CM$VER      3.04.00     20/02/2004
--------------------------------------------------------------------------------
Pendência: 5342 - Múltiplas Contas de Baixa. Modificações condicionadas a ativação do
   parâmetro global "Segregação Virtual"
Pendência: 14451 - Nova Segregação de Recursos
**Menu: \Lançamento \Documento
Adequação da tela a nova estrutura de Segregação de Recursos
Inserida a guia "Contas Baixa" para documentos com múltiplas contas de baixa.
Na guia "Alteradores": retirada a possibilidade da informação da Atividade/Projeto.
Se Lança e Baixa simultânea. Não é possivel lançar em um Plano de Benefícios 
<> "Comum" nem numa patrocinadora <> "Comum"
**Menu: \Lançamento \Adiantamentos
Adequação da tela a nova estrutura de Segregação de Recursos
Travando Múltiplos Rateios, quando a segregação estiver ligada.
**Menu: Tesouraria \Pagamento
Modificada a contabilização pela baixa de documentos com Fluxo Primário, este tipo de 
lançamento passa a ser segregado na origem.
Registrando o lançamento contábil da baixa com o Critério para Segregação determinado
pela origem do lançamento.
Pendência : 14393
Tela      : Lançamento de documentos
Descrição : Implementação de retenção de INSS para autônomos.
Pendência : 15975 - Lançamento de documentos
No momento da retenção de IRRF, deduzir do valor do documento os impostos em 
que o imposto de renda incide.
Pendência : 15854 - Lançamento de documentos
Descrição : Correção de diferença de centavos no total dos rateios.
================================================================================
CM$VER      3.03.00h    06/02/2004
--------------------------------------------------------------------------------
Pendência 15846
Tela: Consultas\relatorios\emissões diversas\Ficha Financeira
Descrição: disponibilizar para o relatório os campos Plano e Patrocinadora para que o 
usuário possa colocá-lo no subrelatório de rateios. 
================================================================================
CM$VER      3.03.00g    02/02/2004
--------------------------------------------------------------------------------
Pendência 15996
Tela : Utilitários\Importação de Lançamentos
Descrição: Permitir a Leitura das colunas que contém informações de Plano, 
Patrocinadora e Programa para rateio do documento.
Pendência 16032
Tela : Utilitários\Importação de Lançamentos
Descrição: 
-Observar o parâmetro usaplanopatro que obrigra o preenchimento dos 
campos Plano e Patrocinadora e obrigar o preenchimento dos mesmos se o parâmetro obrigar.
-Criação da coluna idsegregacriter para que o sistema preencha este campo na insersão de um documento.
-Criação de um arquivo de exceções onde são listados os registros que o sistema não conseguiu importar.
================================================================================
CM$VER      3.03.00f    28/01/2004
--------------------------------------------------------------------------------
Pendência 15182
tela: sistema\utilitários\Alterar Dados Bancários
Descrição: critica se os dados bancários do documento podem ser alterados.
Pendência 15994
tela: Cadastros\Tipos de Alteradores
Descrição: Permite a limpeza e gravação do campo Conta Contábil vazio.
================================================================================
CM$VER      3.03.00e    22/01/2004
--------------------------------------------------------------------------------
Pendência 15965
Tela: Lançamento \ Documento
Descrição: Ajuste na contabilização do imposto com informação de Plano e Patro
*********************************************
- CForms\FBaixaManualMT - bbtnConfirmarClick :Corrigida passagem do Parâmetro da data
  de Disponibilidade quando CAP
- ProcessaBaixaAutomatica
Descrição : Passagem do parametro de Data de Disponibilidade para a função BaixaDocumento da funcao
ProcessaBaixaAutomatica
================================================================================
CM$VER      3.03.00d    14/01/2004
--------------------------------------------------------------------------------
Pendência 15740 
Tela: \Pagamento \Tesouraria \Exclui / Estorna \Lote
Mostrar as mensagens de erro pela não exclusão de uma baixa manual
================================================================================
CM$VER      3.03.00c    30/12/2003
--------------------------------------------------------------------------------
Pendência: 15792  - \Lançamento \Documentos \Alteradores
Retirar a possibilidade de se lançar uma Atividade/Projeto para o alterador. 
A mesma será rateada.
================================================================================
CM$VER      3.03.00b    22/12/2003
--------------------------------------------------------------------------------
Pendência: 15832  - \Lançamento \Documentos \Registra
Após buscar um documento para alterar, colocando como tela principal a guia rateio, 
ao clicar no Alterar principal e depois no alterar do rateio, dava erro de VCL50.
================================================================================
CM$VER      3.03.00a    18/12/2003
--------------------------------------------------------------------------------
Pendência: 15656 - 18.12.2003
FLancDocCapCarMT.pas - SetaCentResponDesemb: Filtragem da query de centro de responsabilidade alterada.
================================================================================
CM$VER      3.03.00     10/12/2003
--------------------------------------------------------------------------------
- Pendência Nº 14392 - Tela\Opçao No Sistema: Retenção de INSS
  O alterador de decrescimo de INSS,  deve ser deduzido da base do IRRF
  Alterações no Banco:
  Criado o campo TipoAlterador.FlgIncideIRRF na tabela 
- Pendência Nº 14399 - Tela\Opçao No Sistema: Lançamento de Documento
  Criar funcionalidade p/ que o usuário tenha acesso só a movimentações registradas 
  pelos integrantes do Centro de Responsabilidade ao qual ele faz parte.
  Alterações no Banco:
  Criado o campo FlgRestrAcessLancDoc na tabela ParamCap
- Resolução da pendência 14458
  Filtragem dos tipos de desembolso pelo campo ATIVO em:
  \Lançamentos \Documentos \Registra
  \Tesouraria \ Concilia CPMF
  \Cadastros \Impostors com Tabela de Retenção
  \Cadastros \Ramo do Fornecedor x Tipos de Desembolso
  \Cadastros \Padrões de Rateio de Lançamento
================================================================================
CM$VER      3.02.06     09/12/2003
--------------------------------------------------------------------------------
- Pendência 14837 - Consultas \ Movimento:
  Item de menu retirado;
- Pendência 14838 - Consulta \ Relatórios \ Orden de Pago - Argentina
  Retirado relatório (é necessário rodar o TransfRelatorio para retirada);
- Pendência 14843 - Consulta \ Relatórios \ Lançamentos Contábeis:
  Onde havia "Unidade de Negócio" passou a haver "Atividade/Projeto".
================================================================================
CM$VER      3.02.05     04/12/2003
--------------------------------------------------------------------------------
Não houve alterações desde a versão 3.02.04m. 
Versão apenas para congelamento do padrão 5.10.01.
================================================================================
CM$VER      3.02.04m    01/12/2003
--------------------------------------------------------------------------------
>> Ajustes na Resolução da pendência 15675.
================================================================================
CM$VER      3.02.04l    25/11/2003
--------------------------------------------------------------------------------
Pendência 15678 - Tesouraria \ Pagamento \ Manual
Corrigida a contabilização na baixa manual envolvendo mais de um documento, simultaneamente.
================================================================================
CM$VER      3.02.04k    14/11/2003
--------------------------------------------------------------------------------
Pendência 15642 - Exclusão de Lote.
Corrigido o processo quando havia imposto retido.
================================================================================
CM$VER      3.02.04j    14/11/2003
--------------------------------------------------------------------------------
Correção na geração do documento no Controle Financeiro, quando o Contas a Pagar
possuia mais de um rateio por plano x patrocinadora - pendência 15631
================================================================================
CM$VER      3.02.04i    30/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15099
  > Tela\Opçao No Sistema: Parametrização contas/caixa X tipos de cobrança / Parâmetros da Cobrança Bancária
  Após digitar todas as informações da tela, e salvar, o campo da mensagens continua em branco.
 
================================================================================
CM$VER      3.02.04g    15/09/2003
--------------------------------------------------------------------------------
> Reposição do itens de menu Utilitários\Transferência de Classificação Automática e Utilitários\Transferência de Classificação
>Resolução da pendência 15017 - Na tela de Cadastro do PortadorForma, a forma de pagamento alternativo, não está ficando vazia está sendo preenchida automaticamente.
================================================================================
CM$VER      3.02.04e    21/08/2003
--------------------------------------------------------------------------------
- Pendência 14889: correção do estorno do documento quando já há lançamentos estornados;
================================================================================
CM$VER      3.02.04d    20/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14888
  > Tela\Opçao No Sistema: Autorização de Pagamento - AP
  Colocado o campo Fornecedor em ordem alfabética, assim como é no Borderô para Débito em Conta Corrente - Modelo 2.
================================================================================
CM$VER      3.02.04c    18/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14365
  > Tela\Opçao No Sistema: Cadastros/Impostos com Tabela de Retenção
  Habilitar a aba de Dados de Lançamento de Documento somente na inserção ou edição de dados.
================================================================================
CM$VER      3.02.04b    11/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14775
  > Tela\Opçao No Sistema: Consultas/Relatórios/Emissões Diversas/Autorização de Pagamento - AP
  Correção na impressão de AP quando o lançamento do documento quando estiver marcado para não
integrar com a contabilidade.
================================================================================
CM$VER      3.02.04a    06/08/2003
--------------------------------------------------------------------------------
Pendência 14555 - Relatório Posição de Fornecedores. Criado filtro por usuário que lancou o pagamento.
 
================================================================================
CM$VER      3.02.04     22/07/2003
--------------------------------------------------------------------------------
- Correção na rotina de criação do fornecedor, se este não existisse;
- Pendencia 14177 - Gravação dos históricos de lançamentos de estorno (contábil e financeiro) gravados com a palavra "estorno" no início;
- Pendencia 14321 - Exibição de label com a mensagem "não há lançamentos em aberto..." quando não houver documentos em aberto no período selecionado;
- Pendencia 14015 - Corrigida exibição dos documentos após digitação;
- Pendencia 14414 - Correção do erro de exclusão de lote;
================================================================================
CM$VER      3.02.03     17/07/2003
--------------------------------------------------------------------------------
> Rewsolução da pendência 14332.
================================================================================
CM$VER      3.02.00a    30/05/2003
--------------------------------------------------------------------------------
- Baixa de Recebimentos vs. Pagamentos: correção do erro de transação;
================================================================================
CM$VER      3.02.00     29/05/2003
--------------------------------------------------------------------------------
- Emissão de Cheque: correção da passagem de plano e patrocinadora na emissão de cheque contabilizado;
- Estorno de Documento: correção no estorno de documento (estava estornando o lote);
- Autorização de Pagamento: correção da impressão de páginas em branca;
- Ficha de Compensação: correção da alteração do cabeçalho do relatório;
- Cancelamento de Lote: correção do cancelamento quando há cheque contabilizado;
- Rateio Financeiro: correção do lançamento do rateio (estava gravando a movimentação mas não o rateio);
================================================================================
CM$VER      3.01.90     05/05/2003
--------------------------------------------------------------------------------
Acerto na baixa eletronica.
================================================================================
CM$VER      3.01.88     16/04/2003
--------------------------------------------------------------------------------
- Alterações na tela de lançamento do documento para contemplar a estrutura
  da disponibilidade
================================================================================
CM$VER      3.01.83     26/05/2003
--------------------------------------------------------------------------------
- pendência 13782 - criação de parâmetro em \Sistemas\Configuração\Parâmetros para controlar a geração de processo RAD pelo total do lote ou por documento individual constante do mesmo;
- Rel. AP modelo 3 - correção da impressão da AP quando não há Portador Forma indicado ainda;
- Rel. Atos de Gestão: Acerto no caption do Relatório para imprimir o Plano Previdenciário;
- Novo Cadastro de Grupos de Rateio pré-definidos;
- Lançamento de Documentos: preenchimento do Rateio usando grupos de rateio pré-definidos;
================================================================================
CM$VER      3.01.81     24/03/2003
--------------------------------------------------------------------------------
Alteração nome do form para autorizacao do boton estornar na tela excluir pagamento lote 
Acerto da tela baixa automatica 
Acerto tela Exclui Baixa Documento 
Correções no Relatorio de posicao forn/cli
================================================================================
CM$VER      3.01.80     17/03/2003
--------------------------------------------------------------------------------
- Remessa Eletrônica de Arquivo Int Banco
  Correção na seleção dos dados bancários para montagem dos arquivos Int Banco
================================================================================
CM$VER      3.01.79     06/03/2003
--------------------------------------------------------------------------------
- Cadastro de Códigos Bancários Para Cobrança
  Inclusão de campo para indicação de "Baixa Por Alterador" para o tipo de documento 
  indicado.
- Baixa Eletrônica de Títulos
  Implementação da Baixa "Baixa Por Alterador"
- Cadastro de Impostos\Agregados
  Implementação de parâmetros para a contabilização de impostos do tipo somente calcula valor.
================================================================================
CM$VER      3.01.78     27/02/2003
--------------------------------------------------------------------------------
- uImpostoRetido
  > Correção na verificação do lançamento do imposto associado a tipo de desembolso
    sem a indicação do centro de custo - P.6432  > 
- Lançamento de Alteradores
  > Implementação de parâmetro para permitir a contabilização dos alteradores na baixa do
    documento
  > Implementação de parâmetro para permitir a contabilização dos alteradores de acordo com
    centro de custo do rateio do documento
- Lançamento de Agrupa Parcela
  > Correção na alteração para permitir a exclusão de documentos englobados\parcelados
- Lançamento de Documentos
  > Correção na exclusão de documento lançados com compromisso orçamentário
  > Correção na alteração de impostos calculados no momento do lançamento do documento
================================================================================
CM$VER      3.01.77     24/02/2003
--------------------------------------------------------------------------------
- uImpostoRetido
  > Correção na verificação do lançamento do imposto associado a tipo de desembolso
    sem a indicação do centro de custo - P.6432  > 
- Lançamento de Alteradores
  > Implementação de parâmetro para permitir a contabilização dos alteradores na baixa do
    documento
  > Implementação de parâmetro para permitir a contabilização dos alteradores de acordo com
    centro de custo do rateio do documento
- Lançamento de Agrupa Parcela
  > Correção na alteração para permitir a exclusão de documentos englobados\parcelados
- Lançamento de Documentos
  > Correção na exclusão de documento lançados com compromisso orçamentário
================================================================================
CM$VER      3.01.76     11/02/2003
--------------------------------------------------------------------------------
- Lançamento de Alteradores
  Correção no erro de contabilização do alterador ao ratear por atividade projeto de
  acordo com lançamento de origem
- Alteração de Lançamento Englobado\Parcelado
  Correção na alteração de englobados quando um ou mais documentos de origem eram
  excluídos do procedimento.
  Alteração do valor da primeira parcela de acordo com a diferença entre o total dos
  documentos de origem e as parcelas já cadastradas na inclusão.
- Alteração e Exclusão de documentos
  Implementação da verficação da existência do documento a ser alterado\excluído
  num lote.
- Lançamento de Documentos
  Correção na contabilização de um adiantamento lançado com a opção de lança e baixa
  simultânea
- Configuração de Bloqueto
  Alteração na grade de configuração para inibir a inclusão e alteração de registros
- Correção automática de Documentos
  Correção na verificação da data da última correção. Estave retornando sempre uma
  data maior que a data informada para correção do documento, não efetuando desta
  forma a correção do mesmo.
- Estorno de Adiantamento
  Correção na contabilização pois esta lançando o estorno com duplicidade na contabilidade
- Cadastro de Impostos com Tabela de Retenção
  Alteração dos "labels" de Fornecedor e Tipo de Desenbolso de acordo com o sistema
  logado para CLiente e Tipo de Recebimento;
Histórico de alterações efetuadas no módulo Contas a Pagar
================================================================================
CM$VER      3.01.74     23/01/2003
--------------------------------------------------------------------------------
- Conciliação de CPMF
  * Correção na retenção de impostos para verificação do Flag que indica se os dados
     referentes a pensão alimentícia e inss associados ao fornecedore serão abatidos
     do valor bruto do imposto;
  * Correção na impressão do relatório de valores sintéticos
  
================================================================================
CM$VER      3.01.73     17/01/2003
--------------------------------------------------------------------------------
- Conciliação de CPMF
  Customizações no processamento para conversão em 3 Camadas
- Baixa Contas a Receber X Contas a Pagar
  Conversão da tela para o modelo 3 Camadas e Otimização no processamento
================================================================================
CM$VER      3.01.68     13/12/2002
--------------------------------------------------------------------------------
- Baixa Manual de Documentos
  Implementação da tela de alteração de retenção na baixa para o modelo 3 camadas
  Correção na gravação do histórico contábil na baixa de documentos
  
================================================================================
CM$VER      3.01.66     09/12/2002
--------------------------------------------------------------------------------
- Relatório Orden de Pago 
  Implementação do Relatório
- Parâmetro do Relatório de AP
  Erro na pesquisa de documento
- Relatório de Emissão de Cheque
  Erro na filtragem de relatório pelo tipo de departamento 
  pois estava usando o tipo inteiro e o mesmo era definido 
  como string
- Consulta de Lançamento 
  Conversão para 3 camadas
================================================================================
CM$VER      3.01.65     04/12/2002
--------------------------------------------------------------------------------
- Consulta de Documentos
  Implementação da Tela no modelo 3 Camadas
- Impressão do Espelho de Documento 
  Implementação da impressão do  relatorio AP modelo 3
- Relatório de AP Modelo 1
  Correção do erro "List index out of Bound[6]" 
  na tela de parametros do relatorio.
- Implementação da Chamada da Imposto Retido Nova na tela de 
  Criação de Lote Antiga para contabilização correta da 
  partida dobrada da CPMF na criação do lote
- Correção no Cálculo da verificação do dígito da 
  conta no bradesco para conta do tipo poupança.
================================================================================
CM$VER      3.01.64     02/12/2002
--------------------------------------------------------------------------------
- Correção na contabilização da baixa do documento para gravação de plano e patrocinadora
================================================================================
CM$VER      3.01.63     28/11/2002
--------------------------------------------------------------------------------
- Relatório de AP modelo 2
  Correção na seleção dos dados bancários no momento da impressão da AP
================================================================================
CM$VER      3.01.62     26/11/2002
--------------------------------------------------------------------------------
- Liberação das Telas No Modelo 3 Camadas
  > Lançamento de Documentos
  > Lançamento de Adiantamentos
  > Lançamento de Contrato\Previsão
  > Lançamento de Alteradores
  > Lançamento, Alteração e Exclusão de Agrupa\Parcela Documentos
  > Regularização de Adiantamentos
  > Cancelamento da Regularização de Adiantamentos
  > Baixa Manual
  > Baixa Automática
  > Estorno de Documentos
  > Estorno de Adiantamentos
================================================================================
CM$VER      3.01.61     21/11/2002
--------------------------------------------------------------------------------
 - Corrigido do erro na emissão do Cheque. O sistema não estava gravando os campos
IDPATRO e IDPLANOPREV na contabilização da emissão do Cheque.
================================================================================
CM$VER      3.01.60     18/11/2002
--------------------------------------------------------------------------------
- Correção no cadastro e impressão Certificado de Retenção;
- Correção na tela Alteração de imposto baixa manual;
- Correção gravação valor liquido na tela lança documento;
- Correção exclusão de imposto na tela de cancelamento de baixas de lote.
================================================================================
CM$VER      3.01.59     08/11/2002
--------------------------------------------------------------------------------
 - Correção na inicialização dos parâtros do sistema.
================================================================================
CM$VER      3.01.58     06/11/2002
--------------------------------------------------------------------------------
 - Correção do erro "List index out of bounds" na tela 
Tesouraria/Pagamentos/Exclui-Estorna/Lote.
================================================================================
CM$VER      3.01.57     05/11/2002
--------------------------------------------------------------------------------
 - Correção do Erro "Número de Lote Zerado" na tela de Exclui/Estorna Pagamentos.
 - Correção do Erro "Restrição de Integridade" na tela de Exclui/Estorna Pagamentos.
================================================================================
CM$VER      3.01.56     31/10/2002
--------------------------------------------------------------------------------
- Correção no relatório de Autorização de Pagamentos
================================================================================
CM$VER      3.01.55     30/10/2002
--------------------------------------------------------------------------------
 - Correção do erro 'Lookup is not active' na tela de Cadastro de Impostos com Tabela
de Retenção.
 - Correção do erro 'Master has detail records. Cannot delete or modify' na exclusão
de Adiantamentos.
================================================================================
CM$VER      3.01.54     25/10/2002
--------------------------------------------------------------------------------
 - Implementações de relatórios no modelo 3 camadas.
================================================================================
CM$VER      3.01.53     23/10/2002
--------------------------------------------------------------------------------
- Liberação das telas alteradas para o modelo 3 camadas:
  > Lançamento de Documento
  > Agrupa\Parcela Documento
  > Lançamento de Alteradores
  > Lançamento de Contrato\Previsão
  > Agrupa\Parcela de Contrato\Previsão
  > Lançamento de Adiantamento
  > Regualrização de Adiantamento
  > Regualrização de Adiantamento\Contrato\Previsão
  > Estorno de Documentos
  > Estorno de Alteradores
  > Exclusão\Estorno de Regularização Adiantamento
  > Alteração de Saldo de Documentos
- Parâmetros do Sistema
  Implementação do parâmetro para autorizar a manutenção de alteradores para
  documento já baixados. O valor default é permitir a manutenção dos alteradores.
- Lançamento de Alteradores
  Verificação do parâmetro para autorizar a manutenção de alteradores para
  documento já baixados.
================================================================================
CM$VER      3.01.52     18/10/2002
--------------------------------------------------------------------------------
 - Implementação de Relatórios no modelo 3 camadas.
================================================================================
CM$VER      3.01.51     03/10/2002
--------------------------------------------------------------------------------
 - Implementação de uma opção para alteração do Banco, Agência e Conta na opção
de Altera Dados Bancários no menu Utilitários.
 - Correção do erro "Invalid Data Packet"  na tela de impressão de 
Fatura e Nota de Débito no menu Tesouraria.
================================================================================
CM$VER      3.01.50     02/10/2002
--------------------------------------------------------------------------------
- Customizações gerais de relatórios para o modelo 3 camadas
================================================================================
CM$VER      3.01.49     30/09/2002
--------------------------------------------------------------------------------
 - Correção da Incompatibilidade com a BPL CMBACK50.
================================================================================
CM$VER      3.01.47     10/09/2002
--------------------------------------------------------------------------------
- Pagamento Manual - Parcial criticar valor Absoluto;
================================================================================
CM$VER      3.01.46     05/09/2002
--------------------------------------------------------------------------------
- Implementação de Relatórios 3 Camadas
================================================================================
CM$VER      3.01.45     04/09/2002
--------------------------------------------------------------------------------
 - Customizações no arredondamento da baixa da CPMF.
 - Customizações nas rotinas de geração de arquivo eletrônico para o banco Banrisul.
================================================================================
CM$VER      3.01.44     16/08/2002
--------------------------------------------------------------------------------
- Exclui\Estorna Pagamento de Lotes
  Exclusão de pagamento de CPMF, excluir documento de arredondamento.
- Pagamento Automático
  Otimização da filtragem de datas na tela de pagamento automático
- Lançamento de Documentos
- Agrupa\Parcela
- Altera Agrupa\Parcela
  Quando no lançamento de documento o box "englobar/parcelar" for marcado, a
seleção de conta bancária fica inibida.
  Somente será selecionada na tela de criação de engloba/parcela, que irá
refletir nos documentos de origem
  (como acontece com o número de AP).
- Consulta de Documentos
  Alteração na visualização da Razão Social e não nome fantasia.
- Lançamento de Documentos
  Quando o mesmo for a origem de um englobado/parcelado não vir escrito
"Documento Baixado" e sim "Documento   Parcelado/Englobado".
================================================================================
CM$VER      3.01.43     12/08/2002
--------------------------------------------------------------------------------
 - Conversão de telas para o modelo 3 camadas.
================================================================================
CM$VER      3.01.42     10/07/2002
--------------------------------------------------------------------------------
 - Implementação dos TIPOS DE DOCUMENTO para o pagamento eletrônico de 
fornecedores do BANCO REAL. Esta implementação se deve a mudança de 
tratamento de DOC eletrônico que, agora, pode ser feito através de DOC COMP 
ou TED;
 - Correção da rotina de retorno para remessa de pagamentos do Banco BBV.
================================================================================
CM$VER      3.01.41     03/07/2002
--------------------------------------------------------------------------------
CANCELAMENTO DE BAIXA POR LOTE
Customização na exclusão de lotes com CPMF calculada;
LANÇAMENTO DE DOCUMENTOS
Customização na exclusão do documento para exclusão automática de lançamentos
contábeis e alteradores;
CANCELAMENTO DE LOTE
Customização na exclusão dos documentos gerados pelo calculo de CPMF;
HELP AUTOMÁTICO
Implementação dos textos de help em telas e botões de ajuda.
================================================================================
CM$VER      3.01.40     26/06/2002
--------------------------------------------------------------------------------
 - Atualizado o Layout do Arquivo para pagamento eletrônico do Unibanco(320 posições);
 - Implementação do Centro de Custo e seus respectivos valores no relatório de 
Aprovação de Documentos;
 - Implementação do nome da Conta Contábil e do telefone comercial do fornecedor 
no relatório de Emissão de SLIP; 
 - Correção no módulo de Lançamento de Documentos. O sistema permitia o lançamento de um
documento sem o PLANO e a Patrocinadora informado mesmo com o parâmetro 
obrigando estas informações; 
 - Correção no relatório de Documentos Pagos X Lotes. Os documentos estavam 
sendo duplicados;
 - Correção do campo VALOR BRUTO do relatório de Valores Pagos. Este campo 
aparecia zerado em algumas situações;
 - Implementada uma opção para se ordenar o Relatório de Lançamento de 
Documentos pelo Número do Documento.
================================================================================
CM$VER      3.01.38     17/06/2002
--------------------------------------------------------------------------------
 - Implementação do Layout de Pagamento de Salários(240 posições) para o Banco
Santander;
 - Implementação do Layout de Pagamento de Fornecedores(400 posições) para o 
Banco Santander;
================================================================================
CM$VER      3.01.34     15/05/2002
--------------------------------------------------------------------------------
- Relatorio por Data programada que foi incluido a previsao de adiantamento
================================================================================
CM$VER      3.01.33     13/05/2002
--------------------------------------------------------------------------------
 - Correção no relatório por Data Programada. Não estava listando os documentos
parcelados, quando se utilizava o filtro Tipo de Documento.
================================================================================
CM$VER      3.01.31     29/04/2002
--------------------------------------------------------------------------------
 - Implementação para a utilização do padrão 5.06.00 e posteriores;
 - Alteração, em todo o sistema, do número do Banco Real de 275 para 356;
 - Implementação do campo OBS no relatório de Documentos Lançados;
 - Implementação do layout de Débito Automático para o Banco Banrisul.
================================================================================
CM$VER      3.01.30     16/04/2002
--------------------------------------------------------------------------------
RETORNO DE ARQUIVOS
- Corrigido o problema do modelo de pagamento do HSBC - 240 posições. Quando o 
boleto do fornecedor não continha o valor a pagar, o sistema estava colocando o valor do 
documento no CODIGO DE BARRAS.
CONSULTA DE DOCUMENTOS
- Implementação de opção de busca por SALDO de documento.
RELATÓRIO POR DATA PROGRAMADA
- Implementação de Filtro por Cliente.
================================================================================
CM$VER      3.01.29     10/04/2002
--------------------------------------------------------------------------------
IMPOSTOS COM TABELA DE RETENÇÃO
- Correção. O sistema não estava buscando o plano de conta informado na contabilidade.
PARÂMETROS DO SISTEMA
- Implementação de campo para que o usuário informe a conta padrão para a emissão
de cheques. Na emissão do mesmo, o sistema já traz o número do próximo cheque 
automaticamente.
================================================================================
CM$VER      3.01.28     01/03/2002
--------------------------------------------------------------------------------
 - Otimização do relatório de Valores Pagos.
 - Correção no módulo de Transferência de Classificação. Não estava respeitando o 
parâmetro de integração com a Contabilidade.
================================================================================
CM$VER      3.01.27     25/02/2002
--------------------------------------------------------------------------------
HSBC BAMERINDUS
- Atualização no layout do arquivo eletrônico e inclusão da opção para pagamento 
através do layout CARTÃO SALÁRIO.
================================================================================
CM$VER      3.01.26     15/02/2002
--------------------------------------------------------------------------------
IMPRESSÃO DE ETIQUETAS
 - Correção do módulo de Impressão de Etiquetas.
ARQUIVOS INTBANCO
PAGAMENTO DE FORNECEDORES - BRADESCO
 - Correção no módulo de geração do arquivo de remessa.
 - Implementação da rotina de leitura do arquivo de retorno.
PAGAMENTO DE FORNECEDORES - BANCO DO BRASIL
 - Correção do erro no HEADER do arquivo na geração do arquivo de remessa.
================================================================================
CM$VER      3.01.25     30/01/2002
--------------------------------------------------------------------------------
- Impressão de Relatórios de Conciciação de CPMF
  Correção na seleção do relatório "Analítico Por Data" para impressão.
================================================================================
CM$VER      3.01.24     24/01/2002
--------------------------------------------------------------------------------
- Relatório de Ordem de Pagamento
  Correção no layout para impressão dos dados bancários no final do relatório
- Baixa Automática de Arquivos IntBanco
  Implementação da visualização automática do tratamento do arquivo a ser baixado
  pelo sistema
================================================================================
CM$VER      3.01.23     17/01/2002
--------------------------------------------------------------------------------
- Conciliação de CPMF
  Correção no arredondamento de valores no lançamento financeiro e contábil da baixa
  da CPMF
- Relatório de Autorização de Pagamento Modelo 3
  Correção na tela de filtro e layout do relatório
================================================================================
CM$VER      3.01.22     11/01/2002
--------------------------------------------------------------------------------
LANÇAMENTO DE DOCUMENTOS
 - Correção.
   No lançamento de documentos, o Tipo de Desembolso era exibido de acordo com o 
relacionamento com o Fornecedor ou com o Centro de Responsabilidade. O Tipo de 
Desembolso só era habilitado quando o usuário selecionava um Centro de 
Responsabilidade, porém, existe a possibilidade de o usuário não utilizar esta opção. 
Neste caso ele não conseguia exibir os Tipos de Desembolso.
================================================================================
CM$VER      3.01.21     09/01/2002
--------------------------------------------------------------------------------
- Conciliação de CPMF;
  Correçõe nos relatórios de Auditoria da CPMF para batimento de totais
entre eles;
  Correção nos arredondamentos de valores da CPMF em tela e em relatório;
  Implementação do relatório de CPMF Analítica por Data Programada;
  Customizações gerais no processo de auditoria;
================================================================================
CM$VER      3.01.20     03/01/2002
--------------------------------------------------------------------------------
Implementação dos seguintes modelos de remessa eletrônica:
 - BANCO BOSTON - PAYMENTS SEM PRÉ-CADASTRAMENTO DE FORNECEDOR
 - BANCO BANRISUL - PAGAMENTO DE FORNECEDORES
 - BANCO BANRISUL - LANÇAMENTOS EM CONTA CORRENTE
================================================================================
CM$VER      3.01.19     27/11/2001
--------------------------------------------------------------------------------
- Incluída a possibilidade de autorização para geração do lote para quem possui o sistema
  RAD.
================================================================================
CM$VER      3.01.18     30/10/2001
--------------------------------------------------------------------------------
 - Correção na alteração de lançamento de alteradores.
================================================================================
CM$VER      3.01.17     25/10/2001
--------------------------------------------------------------------------------
 - Correção na importação de lançamentos.
================================================================================
CM$VER      3.01.16     15/10/2001
--------------------------------------------------------------------------------
 - Otimização do Relatório Ficha Financeira.
================================================================================
CM$VER      3.01.15     04/10/2001
--------------------------------------------------------------------------------
- Conciliação de CPMF
  Crreção na reprogramação da CPMF para data de lançamento em feriados
================================================================================
CM$VER      3.01.14     02/10/2001
--------------------------------------------------------------------------------
 - Foi implementado o campo FATOR DE VENCIMENTO  no Modelo de remessa para
Pagamento de Fornecedores do Banco Bradesco. 
================================================================================
CM$VER      3.01.13     02/10/2001
--------------------------------------------------------------------------------
   PAGAMENTO MANUAL
  Este módulo não permitia que o usuário informa-se valores negativos para o 
  pagamento.
================================================================================
CM$VER      3.01.12     28/09/2001
--------------------------------------------------------------------------------
 - Implementação do parâmetro "Considerar somente os alteradores do período"
 no Relatório de Documentos Lançados;
 - Correção na tela de lançamentos de alteradores. Este módulo estava aceitando que 
a data de lançamento do alterador fosse anterior a data de lançamento do Documento.
 - Implementação do número da conta corrente no relatório de Cópia de Cheque.
 - Correção na exclusão no cadastro de Tipo de Desembolso.
================================================================================
CM$VER      3.01.10     06/09/2001
--------------------------------------------------------------------------------
 - Pagamento Manual
   Inclusão de CheckBox Para Listar CPMF´s
 - Borderô de Pagamento
   Inclusão da Máscara da Conta e Agência
 - CPMF
   Acerto no arredondamento do valor Calculado
 - Relatório de Ficha Financeira
   Correção na exibição dos dados de contabilização e 
optimização do mesmo
 - Parcelamento de Documentos
   Este módulo estava informando que o número de um determinado
documento já estava lançado, porém, o documento estava lançado
no CONTAS A RECEBER.
   
    
================================================================================
CM$VER      3.01.09     28/08/2001
--------------------------------------------------------------------------------
- Correção na tela de Pagamento automático.
================================================================================
CM$VER      3.01.08     28/08/2001
--------------------------------------------------------------------------------
- Correção na tela de Pagamento automático.
================================================================================
CM$VER      3.01.05     09/08/2001
--------------------------------------------------------------------------------
- Implementação de Plano e Patrocinadora na tela de RecebimentoXPagamento 
simultâneo.
================================================================================
CM$VER      3.01.04     03/08/2001
--------------------------------------------------------------------------------
PAGAMENTO PARCIAL DE DOCUMENTOS
 - No momento do pagamento o sistema não estava considerando os centavos.
================================================================================
CM$VER      3.01.02     17/07/2001
--------------------------------------------------------------------------------
- Implementação da Tela de lançamento de arredondamento de CPMF
================================================================================
CM$VER      3.01.01     16/07/2001
--------------------------------------------------------------------------------
- Demonstrativo Sintético de Gestão
  Alteração da coluna de valor para impressão do valor bruto.
- Lançamento de Documentos
  Correção no teste do Status do Fornecedor para a manutenção dos lançamentos
================================================================================
CM$VER      3.00.12     02/07/2001
--------------------------------------------------------------------------------
- Correção no Relatório de Posição de Saldo por Fornecedor.
================================================================================
CM$VER      3.00.11     26/06/2001
--------------------------------------------------------------------------------
- Customizações para compatibilização dos Sistemas para acesso ao DB2
================================================================================
CM$VER      3.00.10     25/06/2001
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção da verificação das autorizações por usuário para o centro de custo do rateio
================================================================================
CM$VER      3.00.09     19/06/2001
--------------------------------------------------------------------------------
- Tela Principal
  Alteração do nome de cadastro de : "Códigos Bancários para Pagamento"
  para "Código para Pagamento Eletrônico" 
- Lançamento de Documento
  Implementação de consulta por Número da Conta, Nome da Conta e 
  Observação no Compromisso Orçamentário.
- Conciliação de CPMF
  Otimização da tela de conciliação;
  Implementação da alteração da alíquota;
  Otimização do relatório de auditoria de CPMF;
  Implementação da opção para baixa de CPMF pelo valor total lançado;  
- Correção no relatório de Conta Corrente por Cliente/Fornecedor
================================================================================
CM$VER      3.00.08     18/05/2001
--------------------------------------------------------------------------------
- Verificação de numero da fatura em branco durante o concelamento de lotes.
================================================================================
CM$VER      3.00.07     16/05/2001
--------------------------------------------------------------------------------
- Formatação do CNPJ no Bordero - Carta
================================================================================
CM$VER      3.00.06     15/05/2001
--------------------------------------------------------------------------------
- Baixa Automática de Arquivos
  Correção na seleção de arquivos para baixa: Inclusão do filtro por empresa;
================================================================================
CM$VER      3.00.05     10/05/2001
--------------------------------------------------------------------------------
- Alteracoes na contabilização de operaçcoes de baixa para uma origem especifica.
================================================================================
CM$VER      3.00.04     25/04/2001
--------------------------------------------------------------------------------
- Conciliação de CPMF
  Correção no relatório de Listagem de CPMF;
  Correção na reprogramação da CPMF de lote manual;
- Impressão de AP
  Correção na Impressão do relatório 'Aprovação de Documentos Modelo 2' a partir
  da tela do visualizador.
================================================================================
CM$VER      3.00.03     19/04/2001
--------------------------------------------------------------------------------
- Lançamento de Documentos
- Agrupamento de Documentos
- Alteração de Agrupa Parcela Documentos
  Correção na seleção de Fornecedores\Clientes para considerar somente se os
  registros estiverem ativos;
================================================================================
CM$VER      3.00.02     17/04/2001
--------------------------------------------------------------------------------
- Correção do erro ('' is not a valid integer value) na emissão de boletos.
- Consistencia de titulo entre o item de menu e o form 
  Tipos de Recebimento X Impostos Agregados.
- Correção no relarório de Conta Corrente de Clientes. Lançamento correto da
  contrapartida do parcelamento no relatório.
================================================================================
CM$VER      3.00.01     10/04/2001
--------------------------------------------------------------------------------
- Correção de erro nos combobox do form de agrupamento de documentos.
================================================================================
CM$VER      3.00.00     04/04/2001
--------------------------------------------------------------------------------
- Versão Delphi 5.
================================================================================
CM$VER      2.33.02     13/03/2001
--------------------------------------------------------------------------------
- Alteração numa query do form de parametros do relatorio de adiantamentos (inclusão
  de VALALT e HISTORICOCOMPL no group by.
- Alteração no form de parametros do relatorio de documentos por data programada 
  (ativação da query de lookup do tipo de documento).
================================================================================
CM$VER      2.33.01     08/03/2001
--------------------------------------------------------------------------------
- Conciliação de CPMF
  Correção do relatório analitico por documentos: Erro na coluna Valor Efetivo;
- Cencelamento de Lote
  Correção na exclusão do imposto gerado no momento da criação do lote;
================================================================================
CM$VER      2.32.12     05/03/2001
--------------------------------------------------------------------------------
- Pendencias Diversas
================================================================================
CM$VER      2.32.11     19/02/2001
--------------------------------------------------------------------------------
- Inclusão do teste do campo chave para os arquivos de retorno no Banco do Brasil,
Banco Real e Caixa Econômica do tipo Débito Automático.
================================================================================
CM$VER      2.32.09     12/02/2001
--------------------------------------------------------------------------------
- Atualização do relatório demonstrativo de atos de gestão por AP.
- Alteração do relatório de emissão de APs para mostrar o centro de responsabilidade  no
  lugar do centro de custo quando este estiver em branco.
================================================================================
CM$VER      2.32.08     12/02/2001
--------------------------------------------------------------------------------
- Formatação do CPF/CNPJ na AP.
================================================================================
CM$VER      2.32.07     09/02/2001
--------------------------------------------------------------------------------
- Relatório de Atos de Gestão Por AP
  Otimização das Consultas do Relatório
================================================================================
CM$VER      2.32.05     07/02/2001
--------------------------------------------------------------------------------
- Inclusão do NumImovel no GROUP BY do rateio da AP.
================================================================================
CM$VER      2.32.04     06/02/2001
--------------------------------------------------------------------------------
- Relatório de Demonstrativo de Atos de Gestão
  Implementação do Relatório
================================================================================
CM$VER      2.32.03     06/02/2001
--------------------------------------------------------------------------------
- Correção da gravação do número do lote de baixa para pagamento/recebimento manual.
- Filtro por módulo, formatação do NoDocumento  e dos campos data no montaselect 
  de AP.
- Formatação do NoDocumento na AP.
================================================================================
CM$VER      2.32.02     06/02/2001
--------------------------------------------------------------------------------
- Correção no rateio das AP. A query agora traz a soma correta dos rateios tanto 
  nos lancamentos parcelados quanto nos não parcelados.
- Adequação ao padrão de 05/02/2001.
================================================================================
CM$VER      2.32.01     02/02/2001
--------------------------------------------------------------------------------
- Correcao no relatorio de Posição por Fornecedores
- Adequacao ao padrao.
================================================================================
CM$VER      2.32.00     01/02/2001
--------------------------------------------------------------------------------
- Conta Auxiliar a Conta Contabil e a Conta no cadastro do tipo de Embolso/Desembolso.
- Relatorio com os Lotes emitidos por Banco
================================================================================
CM$VER      2.31.02     17/01/2001
--------------------------------------------------------------------------------
- Relatório Demonstrativo de Atos de Gestão
  Alteração no Lay-Out do Relatório;
  Alteração da tela de filtro do relatório;
  Correção na seleção dos documentos referentes a documento englobados;
- Relatório Demonstrativo Sintético De Gestão
  Alteração da tela de filtro do relatório;
- Inclusão\Alteração de Engloba\Parcela
  Correção na gravação do Número da AP no documento de
  Origem para documentos Parcelados;
================================================================================
CM$VER      2.31.00     08/01/2001
--------------------------------------------------------------------------------
Usuarios somente podem lancar APs de seus respectivos centros de responsabilidade.
Referencias a PLANPREV substituidas por PLANPREVCONTABIL.
================================================================================
CM$VER      2.30.11     21/12/2000
--------------------------------------------------------------------------------
- Conciliação de CPMF
  Correção na conciliação de CPMF's lançadas irregularmente;
  Implementação da Auditoria de Rateios não Associados para lançamento de CPMF;
  Implementação de Relatório Analítico de documentos lançado por lote;
  Visualização de Lotes gerados sem lançamento algum de CPMF permitindo que a mesma
  seja recalculada;
- Arquivos IntBanco
  Correção nas telas de parâmetros permitindo o cancelamento da operação;
- Criação de Lote
  Inclusão do filtro para exclusão dos documentos do tipo CPMF
================================================================================
CM$VER      2.30.10     30/11/2000
--------------------------------------------------------------------------------
Acerto no Relatorio Posiçao por fornecedores
Acerto na Alteração de Centro de Responsabilidade
Acerto no Relatório Ordem de Pago
================================================================================
CM$VER      2.30.09     17/11/2000
--------------------------------------------------------------------------------
Implementação de flag para emissão cde doctos tipo cpmf. no relatório demostrativo de gestão de pagamento
Implementação de flag para emissão cde doctos tipo cpmf. no relatório demostrativo Sintético
 
================================================================================
CM$VER      2.30.08     17/11/2000
--------------------------------------------------------------------------------
- Implementação de mensagem para geração da Autorização de Pagamento
  e do Comprovante de Baixa.
- Separação da numeração do Comprovante de Baixa e da Autorização de Pagamento
- Foram retiradas as linhas em branco entre fornecedores na emissão de cheques
- Implementação na tela de Lançamento para mostrar somente os centros
  de responsabilidades ativos na tela de lançamentos.
- Implementação para não permitir estornar o pagto de um lote que tenha um de seus pagto estornados
- implementação na tela de consulta de doctos para mostrar dados dos lote  antes de sua emissao
- Implementação do Relatório de Relação de todos os lotes
- Acerto na emissão de bordero para que não o duplique
================================================================================
CM$VER      2.30.07     08/11/2000
--------------------------------------------------------------------------------
Implementação da Consulta de Plano de Previdencia
Implementação do Relatório Plano de Previdencia
Acerto no Relatório Valores pagos x Centro de Responsabilidade.
================================================================================
CM$VER      2.30.06     01/11/2000
--------------------------------------------------------------------------------
- Alteracao na tela de lançamento de documentos para pesquisar doctos com valor decimal.
- Correção do relatório posiçao por fornecedor .
-Alteração no relatório  Autorização de Pagamento Modelo 2 para mostrar valor liq. pago
-Alteração na tela de exportacao de lancamento de Autorização de Pagamento para mostrar valor liq pg
-Otimização da tela de pagamento eletronico
-Otimização da tela  de lançamento de documentos.
- Implementação dos doctos parcelados na tela de alteração de centro de responsabilidade
- Otimização do Relatório de Emissão de Slip
- Formatação do valor na tela de Regulariza Adiantamento
================================================================================
CM$VER      2.30.05     17/10/2000
--------------------------------------------------------------------------------
- Pagamento Manual
  Correção na retenção de impostos do tipo 'Sempre Calcula' no momento da baixa manual;
- Otimização no relatório de previsao de pagamentos x centro responsabilidade
- Inclusao do sisatema e empresa no rel valores pagos e recebidos
================================================================================
CM$VER      2.30.04     13/10/2000
--------------------------------------------------------------------------------
- Criação de Lote
  Correção no cálculo e lançamento de impostos retidos na baixa
- Otimização da tela de emissão de bordero.
- Acerto na tela de Cancelamento de lote
- Alteração na tela de exportação de lançamentos de AP para mostrar
   o valor liquido para doctos baixados
- Alteração no Bordero modelo 2 para reimprimir os doctos baixados
- Alteração na Autorização de Pagamentos modelo 2 para reimprimir os
  doctos baixados
- Lançamento de documento guando for parcela/engloba não deixa gerar ap
- Acerto na Autorização de Pagamento modelo2 para mostrar os alteradores de doctos parcelados e englobados
================================================================================
CM$VER      2.30.03     10/10/2000
--------------------------------------------------------------------------------
- Cadastro de Impostos\Agregados
  Correções na gravação do alterador associado ao imposto;
  Implementação do Flag "Sempre Calcula Valor" para impostos que não sigam a   parametrização de "Documento Fiscal" e "Tipo de Desembolso";
- Criação de Lote
  Correção na retenção de Impostos\Agregados. Passou a ser calculada somente na       
  efetivação do lote. Não é mais exibido o valor do cálculo do imposto por ser       
  inconsistente para impostos do tipo "acumula mês" uma vez que o valor base para    
  referência do "acumula mês" não pode ser calculado;
  Otimização do Código;
================================================================================
CM$VER      2.30.01     04/10/2000
--------------------------------------------------------------------------------
- Otimizacao do relatorio emissao de slip
- Acerto na tela de impressao de ficha de compensacao para cancelar as
  fichas imprimidas com erro
- Alteracao na tela de liberacao de bloquetos para liberar
   tambem as fichas de compensacao.
- Implementacao do numero da ap para documentos agrupados
================================================================================
CM$VER      2.30.00     21/09/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Alteração/Estorno do compromisso orçamentário no momento da exclusão/estorno de
  documentos;
  Implementação da efetivação de compromisso para documentos regularizados com
  adiantamentos associados a compromissos orçamentários levando em conta o 
  valor do compromisso já ultilizado no adiantamento, ou seja: Caso o valor do adiantamento
  seja menor que o valor do documento e este for associado a uma reseva orçamentária,
  a efetivação do compromisso se dá pela diferença do valor ultilizado para o adiantamento e
  o valor do rateio do documento novo. Caso contrário, se o valor do adiantamento é maior
  que o valor do documento é efetivada uma devolução do valor ultilizado para a respectiva
  reserva.
- Relatório de Aprovação de Documentos
  correção na consulta do documento a imprimir não permitindo a impressão dos documento
  a parcelar/englobar;
- Acerto na conta bancaria do arquivo santander.
- Implementação na impressão de verso de cheque para gravar na tabela paramcap os campos selecionados.
- Consulta de documentos acerto na pesquisa de valores.
================================================================================
CM$VER      2.29.07     19/09/2000
--------------------------------------------------------------------------------
- Ordenação por bordero na tela de estorna baixas
- Acerto no valor do imposto de renda no relatório demostrativo de  pagamento.
- Lançamento de Documentos
  Correção na exibição do plano\patrocinadora default no lançamento do rateio
  Correção na validação do registro repetido na linha do rateio do documento
================================================================================
CM$VER      2.29.06     15/09/2000
--------------------------------------------------------------------------------
- Acerto no relatório conta corrente
- Coloquei na emissão de cheque e bordero para não emitir para lotes cancelados.
- Acerto na tela de pagamento x recebimentos
- Implementacao do histórico no relatório de adiantamentos regularizados
- Resolução da Pendência Nº 1846
  > Tela\Opçao No Sistema: Emissão de Cheque
  Ver a possibilidade de emissão de verso de cheque.
- Resolução da Pendência Nº 1899
  > Tela\Opçao No Sistema: Criação de Lote
  Incluir Visualização dos Impostos no momento da inserção do documento no lote
- Resolução da Pendência Nº 2031
  > Tela\Opçao No Sistema: 
  - Impressão de cheques, a impressão das informações não sai correta, pois come letras ou números as vezes, foi testado em 3 modelos e impressoras diferentes e isto sempre acontece.
- Resolução da Pendência Nº 2075
  > Tela\Opçao No Sistema: Impressão de cheques
  A impressão dos cheques não sai corretamente
ou sejaome letras (no extenso) as vezes também número no campo de valor.
- Resolução da Pendência Nº 2440
  > Tela\Opçao No Sistema: TESOURARIA \ PAGAMENTO \ AUTOMÁTICO
  Lotes criados mas que não foram emitidos os cheques ou borderôs, estão aparecendo para pagamento, quando não deveria, uma vez que o sistema exige que para cada lote criado seja emitido um cheque ou borderô para que o mesmo seja pago.  
- Resolução da Pendência Nº 2595
  > Tela\Opçao No Sistema: Relatório
  Relatório "Valores Pagos" está saindo sem o nome da empresa no cabeçalho - aparece lblempresa
- Resolução da Pendência Nº 2639
  > Tela\Opçao No Sistema: 
  Erro na versão 2.27.05 da dpl 4.37.13.
Ao lançar um documento e um alterador a descontar. Quando cria um lote e imprime o cheque ocorre erro no extenso. 
- Resolução da Pendência Nº 2642
  > Tela\Opçao No Sistema: Relatório Ficha Financeira p/ Pagamento
  Nome da empresa no relatorio nao sai a empresa correspondente. Sai CM Solucoes Informatica.
- Resolução da Pendência Nº 2643
  > Tela\Opçao No Sistema: Tela Única
  Visualização de relatorios em Tela Unica nao funciona.
- Resolução da Pendência Nº 2646
  > Tela\Opçao No Sistema: Filtro para o relatório "Ficha Financeira para Pagamento"
  Depois de clicar no botão "seleciona" (na tela de filtro) aparece a mesma data varias vezes.
================================================================================
CM$VER      2.29.03     13/09/2000
--------------------------------------------------------------------------------
- Criação de Lote
  Correção no cálculo dos impostos retidos no momento da criação do lote;
================================================================================
CM$VER      2.29.02     12/09/2000
--------------------------------------------------------------------------------
- Relatório de Demonstrativo de Atos de Gestão
  Correção na impressão do campo histórico;
- Relatório de Demonstrativo Sintético de Gestão
  Otimização da consulta qdo filtrada por centro de responsabilidade
- Relatório de Lançamento de Documentos Modelo 2
  Inclusão do filtro por Favorecido
- Cadastro de Tipo de Desembolso X Centro de Custo X Programa X Conta
  Correçõa na replicação do cadastro: "Field is not of expected type"
- Exportação de Ap
  Correção na gravação dos valores dos alteradores e impostos
- Lançamento de Documentos
  Correção na gravação do Plano e Patrocinadoras Default do Global
  Correção na seleção da conta a crédito qdo não existe o relacionamento na tabela aranha;
 
 
================================================================================
CM$VER      2.29.01     12/09/2000
--------------------------------------------------------------------------------
Implementação da seleção dos campos a serem impressos no verso do cheque.
Inclusão do filtro tipo de desembolso no relatório documentos por data programada.
================================================================================
CM$VER      2.29.00     06/09/2000
--------------------------------------------------------------------------------
- Cadastro de Alteradores
  Exclusão do teste da obrigatoriedade da indicação da subconta se a conta contábil
  do alterador obrigar a mesma.
  Caso obrigue e e subconta não estiver indicado no alterado é selecionada a 
  subconta grava no documento ( No caso a do favorecido ou a indicada na Pasta 'Geral'
  da tela de lançamento de documentos;
- Lançamento de Alteradores
  Inclusào da indicação da Atividade/Projeto no momento do lançamento do alterador.
  Caso esta seja indicada não é efeuado o rateio contábil do lançamento do alterador;
- Lançamento de Documentos
  * Pasta Alteradores:
     Otimização do Cadastro;
     Inclusào da indicação da Atividade/Projeto no momento do lançamento do alterador.
     Caso esta seja indicada não é efeuado o rateio contábil do lançamento do alterador;
  * Pasta Contabilização
     Correçao na seleção da conta a crédito caso não exista o relacionamento do rateio na
     tabela TIPORDXCCXCONTA
  * Pasta Rateio
     Correção da gravação do Plano/Patrocinadora Defaults no momento da inclusão do rateio
- Relatório de Ficha Financeira
  Correção na ordenação da Árvore dos Documentos Filtrados: Não ordenava corretamente
  pela data
- Relatório de Alteradores Lançados
  Correção no filtro dos lançamento por empresa proprietária
- Emissão de Cheques
  Garavaçao no número do cheque no histórico da contabilidade para documentos emitidos
  como Lança e Baixa de acordo como o parâmetro do sistema "Emite cheque para lança e baixa"
- Relatório de Documentos por Data Programada
  Inclusão de documentos emitidos como Lança e Baixa de acordo como o parâmetro do sistema "Emite cheque para lança e baixa"
================================================================================
CM$VER      2.28.05     06/09/2000
--------------------------------------------------------------------------------
- Cadastro de Alteradores
  Exclusão do teste da obrigatoriedade da indicação da subconta se a conta contábil
  do alterador obrigar a mesma.
  Caso obrigue e e subconta não estiver indicado no alterado é selecionada a 
  subconta grava no documento ( No caso a do favorecido ou a indicada na Pasta 'Geral'
  da tela de lançamento de documentos;
- Lançamento de Alteradores
  Inclusào da indicação da Atividade/Projeto no momento do lançamento do alterador.
  Caso esta seja indicada não é efeuado o rateio contábil do lançamento do alterador;
- Lançamento de Documentos
  * Pasta Alteradores:
     Otimização do Cadastro;
     Inclusào da indicação da Atividade/Projeto no momento do lançamento do alterador.
     Caso esta seja indicada não é efeuado o rateio contábil do lançamento do alterador;
  * Pasta Contabilização
     Correçao na seleção da conta a crédito caso não exista o relacionamento do rateio na
     tabela TIPORDXCCXCONTA
  * Pasta Rateio
     Correção da gravação do Plano/Patrocinadora Defaults no momento da inclusão do rateio
- Relatório de Ficha Financeira
  Correção na ordenação da Árvore dos Documentos Filtrados: Não ordenava corretamente
  pela data
- Relatório de Alteradores Lançados
  Correção no filtro dos lançamento por empresa proprietária
- Emissão de Cheques
  Garavaçao no número do cheque no histórico da contabilidade para documentos emitidos
  como Lança e Baixa de acordo como o parâmetro do sistema "Emite cheque para lança e baixa"
- Relatório de Documentos por Data Programada
  Inclusão de documentos emitidos como Lança e Baixa de acordo como o parâmetro do sistema "Emite cheque para lança e baixa"
================================================================================
CM$VER      2.28.04     04/09/2000
--------------------------------------------------------------------------------
  * Relatório de AP  
    Inclusao da opreracao 10 (Lança e baixa simultânea).
  * Relatório de Lançamento de Documentos
    Correção no cálculo do saldo do documento de acordo com a natureza do lançamento (D/C);
  * Relatório de Valores Pagos/Recebidos
    Otimização da Consulta
  * Relatório de Demosntrativo de gestão
  * Relatório de Demosntrativo Sintético de gestão
  * Relatório de Lançamentos de Documentos Modelo 2
    Implementação da seleção de mais de um centro de responsabilidade para filtro;
    Implementação da seleção documentos pelo status: Em aberto, Baixados, Todos;
    Implementação da seleção do tipo de ordenação do relatório; 
  * Consulta de Documentos
    Correção na seleção dos dados bancários referentes ao favorecido do documento:
    Passou a verificar a existência da conta bancária informado no lançamento do documento,
    caso não exista exibe a conta preferencial do favorecido;
    Alteração no layout da tela;
    Otimização das Consultas; 
    Correção na visualização das parcelas de origem dos documentos parcelados/englobados e
    visualizações dos documentos resultantes a partir de um original
  * Cadastro de Tipo de Recebimento/Desembolso X Centro de Custo X Conta X Programa
    Correção do "Invalid Handle Buffer" na replicação do relacionamento;
  
  * Parâmetros do Relatório Autorização de Pagamento (AP)
  * Relatório Autorização de Pagamento
  * Relatório Documentos Lançados Modelo 2
  * Relatório Demonstrativo de Gestão
  * Relatório Borderô Ordem de Pagamento
  * Relatório Borderô Débito em Conta Modelo 2
  * Pagamento Eletrônico - Arquivos INTBANCO
    Correção na seleção dos dados bancários referentes ao favorecido do documento:
    Passou a verificar a existência da conta bancária informado no lançamento do documento,
    caso não exista exibe a conta preferencial do favorecido;
    Otimização das Consultas
    Correção na impressão das contas de acordo com o tipo de documento: Só imprime se o mesmo
    obrigar dados bancários;
  * Exportação de Lançamentos
    Correção na seleção dos dados bancários referentes ao favorecido do documento:
    Passou a verificar a existência da conta bancária informado no lançamento do documento,
    caso não exista exibe a conta preferencial do favorecido;
    Otimização das Consultas;
    Correção na ordenação dos registros na geração do arquivo;  
  * Cadastro de Tipo de Recebimento/Desembolso X Impostos/Agregados
    Inclusão do PROGRAMA no relacionamento;
    Correção da seleção dos relacionamentos associados com Centro de Custo;
  * Cadastro de Fornecedor
    Implementação da pasta 'Dados Bancários' no detalhe do cadastro onde é possível 
    informar mais de uma conta bancária para o favorecido;
  
  * Cadastro de Programa
    Inclusão do cadastro na CmBack disponibilizando a tela para qq sistema que usa o padrão.
  
  * Lançamento de Documentos
    Implementação da seleção e gravação da Conta Bancária do fornecedor para o documento lançado;
    Inclusão da seleção do programa na Pasta Geral após a seleção do centro de custo;
    Implementação da Indicação do Programa associado ao Centro de Custo  nos itens do rateio;
    Inclusão do IDPROGRAMA na Qry de Centro de Custo Geral
    Inclusão do Distinct na consulta do Centro de Custo (Trazia vários centros de custo devido ao relacionamento
    com a tabela TIPORDXCCXCONTA;
    Inclusão dos Filtros por centros de custo inativos; 
  * Agrupa/Parcela Inclui/Altera
    Implementação da seleção e gravação da Conta Bancária do fornecedor para o documento lançado;
  * Estonro de Lote
    Correção do Erro "IInvalid Value For Field Documento";
  * Estorno de Documento 
    Correção do erro "'S' is not a valid integer value";
  * Relatório de Lançamentos Contábeis 
    Erro na consulta ao passar os filtros por Data;
  * Cadastros de Códigos Bancários para cobrança 
    Correção na consulta dp Procura;  
================================================================================
CM$VER      2.27.05     18/08/2000
--------------------------------------------------------------------------------
- Emissão de Cheques
  Alteração na data, histórico, nº do cheque no lançamento no financeiro,
  data, exercício e planilha no lançamento contábil e data do lançamento do
  documento para lançamentos do tipo 'Lança e Baixa' com a opção de 
  emissão de cheques para tal lançamento ( parâmetros do sistema ).
- Resolução da Pendência Nº 1975
  > Tela\Opçao No Sistema: REGISTRO
  Permitir registrar um documento associando a um compromisso pelo saldo do documento e não pelo valor bruto do documento
- Resolução da Pendência Nº 1995
  > Tela\Opçao No Sistema: LANCAMENTO / DOCUMENTO / REGISTRA
  Está dando o seguinte erro na associação do documento com o compromisso: "o valor é maior que o compromisso".
- Resolução da Pendência Nº 2517
  > Tela\Opçao No Sistema: 
  Pagamento a vista (pagamento sem provisão) - a alteração deveria ser efetuada na opção de lança e baixa com a contabilização da baixa na data do pagamento e com a utilização da conta do tipo de desembolso. Observar que este pagamento terá que sair na previsão  do CAP e permitir a emissão do cheque. RESUMINDO: É um lançamento como outro qualquer  com a única diferença que não gerará  provisão para a contabilidade e a conta a ser utilizada no pagamento é a do tipo de desembolso.
- Resolução da Pendência Nº 2520
  > Tela\Opçao No Sistema: 
  GERAL:  Possibilitar salvar relatórios arquivo texto - Resolução da Pendência Nº 2558
  > Tela\Opçao No Sistema: Lançamento de documentos
  Ao fazermos um lançamento no CAP, clicando na Guia de Contabilização, visualizamos que contas contábeis estarão envolvidas no processo. Porém o sistema não está deixando trocar a conta contábil - através da busca (que fica vazia - como se não tivéssemos contas cadastradas).
================================================================================
CM$VER      2.27.04     16/08/2000
--------------------------------------------------------------------------------
- Relatório de Borderô - Débito em Conta Modelo 2
  Implementação do Relatório
- Lançamento de Documentos
  Correção na validação do número do documento para número do documento com máscara
================================================================================
CM$VER      2.27.03     14/08/2000
--------------------------------------------------------------------------------
- Estorno de Documentos, Alteradores, Baixas
  Correção no estorno de lançamentos: Considerava os lançamentos 
  já estornados individualmente no momento de estornar o documento;
  Correção na exclusão de Impostos/Agregados com lançamentos de 
  alteradores para lançamentos já estornados
================================================================================
CM$VER      2.27.02     11/08/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na regularização de adiantamentos na tela de lançamento de documentos
- Relatório de Documentos Por Data Programada
  Correção na impressão do valor do saldo, valor do pagamento, do documento para adiantamentos e documentos
  lançados como 'Lança e Baixa';
  Inclusão da coluna para impressão do valor regularizado para o documento;
  
================================================================================
CM$VER      2.27.01     10/08/2000
--------------------------------------------------------------------------------
- Relatório de Posição por saldos
  Correção no cálculo dos saldos para relatórios com data diferente da data do dia;
- Emissão de Arquivos IntBanco
  Correção dos processos de transacação na gravação da emissão da remessa;
- Cadastro de Contas Caixas X Formas de Pagto
  Correção dos processos de transacação na gravação dos parâmetros de remessa;
  
================================================================================
CM$VER      2.27.00     07/08/2000
--------------------------------------------------------------------------------
- implementaçao da conta contabil automática na escolha
  do tipo de desembolso na tela de tranf contab.
- Acerto no estorno de lote.
- Implementação de ordenacao na grid do relatório emissão de slip.
- Implementacao da transferencia automatica de reclassificaçaõ contábil
- Implementação do histórico padrão no tipo de desembolso/recebimento.
- Implementaçao de verso de cheque.
- implementação do historico complementar do documento na importação de lançamentos
- Acerto no calculo da linha digitavel do bloqueto do banco real.
- 01/08 Otimização do relatório aprovacão de documentos
- 03/08 implementacao do arquivo de remessa/retorno santander
- Correção no agrupamento\parcelamento de documento e criação de lotes no momento
  do lançamento de Impostos\agregados;
================================================================================
CM$VER      2.26.00     14/07/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Ao lançar um documento - Correção no teste da verifiação da conta contábil dos tipos de desembolso
  Inclusão do filtro TipoDocumento.RecPag na consulta de documentos
  Gravação de Plano, Patrocinadora, Programa, NumImovel no Rateio do Documento;
  Correção na replicação dos dados do rateios: não efetuar a operação no momento
  da inserção de um novo documento;
  Inclusão da coluna Analítico/Sintético para o centro de custo do reteio;
  Ordenação das consultas de centro de custo pelo Código e Pelo Status (A/S);
  Implementação da restrição para lançamentos em centros de custo analíticos;
  Correção na validação do Registro do Rateio: Inclusão das colunas Programa,
  Plano, Patrocinadore e Número do Imóvel no teste.
  Alteração no tipo de dado da coluna Número do Imóvel no Rateio: Passou de
  Number para Varchar2(60);
  Gravação do histórico padrão indicado no tipo de recebimento/desembolso na contabilização do lançamento;
  Correção da Ordem de Tabulação dos controles do Rateio;
  Correção do bloqueio dos controles do rateio no momento da edição dos registros;
- Pagamentos X Recebimentos  
  Inclusão de documentos operação 1 não englobados/parcelado (status <> ´2´) na baixa manual
- Tipos de Desembolso X Centro de Custo X Conta Contábil X Programa
  Cancelamento da seleção dos registros marcados caso sejam sintéticos;
  Inclusão do Programa no relacionamento;
- Imposto Retido (Funções de Retenção de Impostos/Agregados)
  Implementação do Lançamento acumulado de Impostos que geram um único documento.
  O Rateio do documento gerado é proporcional ao rateio dos documento que compõe o lote gerado.
  Criada a coluna NUMLOTE na tabela imposto retido para identificar a origem da retenção quando vinda de um
  Lote.
  Criação da propriedade NumLote para indicar os lançamentos de retenção que devem ser agrupados para o       
  Tratamento Fiscal 'Lança Imposto Como Novo Documento';
  Criação do método 'EfetivaNovoDocumento' para efetivar os valores calculados para impostos do tipo citado        
  acima.
  Inclusão do teste pelo centro de custo ao buscar rateio do imposto: Somente para impostos atrelados ao Tipo       
  De Recebimento/Desembolso.
  Alterações para implementação de Lançamento de Documento Associado a Imposto: Agrupamento de Documento, 
  Tratamento do histórico do documento, tratamento de data de lançamento de       acordo com parâmetros         
  informados no portador forma e no cadastro de  feriados.  
- Cancelamento de Lote
  Implementação do cacenlamento retenção do Imposto associado ao lote, caso exista
- Cadastros de Tipos de Desembolso
  Inclusão do "Código Correspondente" no cadastro de tipo de Desembolso/Recebimento
- Tipos de Desembolso X Centro de Custo X Conta Contábil X Programa
  Cancelamento da seleção dos registros marcados caso sejam sintéticos Inclusão do Programa no relacionamento
- Contas Caixas X Formas de Pagamento
  Inclusão das colunas DIASEMANALANCTO e DIASUTEISLANCTO para lançamento de documento associado ao imposto
- Criação de Lotes
  Inclusão do teste da obrigatoriedade de indicação do favorecido de um lote ao criar o mesmo para o Contas     
  Caixas x Forma de Pagamento Selecionado  de acordo com o parêmetro indicado no mesmo;
- Consulta a Fornecedores
  Alteração nos títulos das opçoes do graáfico: Mostrava 'Pagamentos' no contas a receber;
- Lançamento de Alteradores
  Alteração na seleção de documentos para lançamento de alteradores: inclusa a
  restrição para lançamento de alteradores para documentos englobados ou
  parcelas de documentos;
- Tipo de Desembolso X Centro de Custo X Conta Contábil X Programa
  Correção no filtro dos impostos associados ao tipo de desembolso com o centro de custo;
  Correção no filtro dos impostos associados ao tipo de desembolso sem o centro de custo;
  Montagem de consulta para gerar arquivo de exportação dos registros cadastrados.
  Inclusão e exportação da consulta no Gerador de Relatórios;
- Cadastro de Contas Caixas X Formas de Pagamento
  Inclusão de parâmetro para identificação da obrigatoriedade de indicação do favorecido de um lote ao criar o     
  mesmo para o Contas Caixas x Forma de Pagamento Selecionada
- Exportação de Lançamentos
  Correção na gravação da obs no arquivo de saída: Exclusão de quebras de linha do campo OBS
- Conciliação de CPMF
  Implemtação da tela de Conciliação de CPMF chamda a partir do menu tesouraria da tela principal
- Imposto Retido
  Alteração no lançamento de documento associado a imposto (CPMF) para marcar o
  documento como 'Autorizado para emissão': FLGCONFIRMARECPAG = 'S'
- Parâmetros do Sistema
  Inclusão dos parâmetros CODTIPDOCCPMF (Tipo de Documento Identificador para Lançamento de CPMF) e     
  FLGVALIDACCBAIXA  (Verifica Conta Contábil de Baixa No momento de Lançamento do Documento)
- Criação de Lote
  Inclusão do filtro por tipo de documento;
  Inclusão da indicação do Quantidade e valor todal de Documentos Pendentes;
- Lançamento de Alteradores
  Correção da inclusão/alteração de alteradores laçados para documentos sem integração com a contabilidade.
- Tipos de Desembolso X Impostos Agregados
  Correção na seleção dos impostos não associados qdo se seleciona um  centro de custo
- Relatório de AP
  Impressão das colunas Plano, Patrocinadora, Programa e número do imóvel e Nome do Usuário que efetuou o     
  lançamento;
- Relatório de Lançamento de Documentos – Modelo 2
  Inclusão das datas de emissão e programada no relatório de lançamento de documentos;
  Inclusão da contabilização do documento lançado;
  Inclusão das colunas Plano, Patrocinadora, Programa e número do imóvel no rateio 
  Inclusão da descrição da Conta Contábil, Número do Lançamento e Histórico nos dados  da contabilização;
  Implementação da seleção pelas datas de 'Inclusão', 'Emissão' e 'Programada' ;
  Implementação da impressão das datas de 'Inclusão', 'Emissão' e 'Programada' ;
- Lançamento de Alteradores
  Inclusão do 'Título' das janelas de consulta para a seleção de documentos e consulta
  de alteradores;
  Inclusão da Restrição de lançamento para documentos Englobados\Parcelas de Documento;
- Relatório de Ficha Financeira
  Acerto na masc. do valor liq
- Transferência de Classificação
  Alteração do nome de vincula tipo de desembolso origem com contas contabeis para realiza transferencia   
  contabil.
================================================================================
CM$VER      2.24.08     30/06/2000
--------------------------------------------------------------------------------
-  lançamento de documentos Inclusão da validação das contas de baixa .
-  lançamento de documentos para que no estorno use o plano 
   Contábil o qual o documento foi incluido
-  Alteracao da tela estorno de adiantamento para usar o plano do adiantamento 
   na inclusão.
- Acerto na tela de geração de lote quando ocorre um erro recarregar o
    campo numlote.
- Acerto na tela de lancamento de alteradores no montaselect  (status is null).
- Otimização do relatório Ficha Financeira.
================================================================================
CM$VER      2.24.07     26/06/2000
--------------------------------------------------------------------------------
- Inclusão de validação de tipos de desembolso  na tela de lançamento para que só 
  aceite tipos de desembolso que apontem para a mesma conta contábil de baixa.
================================================================================
CM$VER      2.24.06     21/06/2000
--------------------------------------------------------------------------------
- Acerto no relatório Posição do Fornecedor para não mostrar documentos estornados.
- Acerto no relatório Posição do Fornecedor por Centro de Responsabilidade para não mostrar documentos estornados.
- Acerto Na Ficha Financeira Para Recebimento Mostrar Cliente em vez de Favorecido.
- Alteração na Tela de Relatório Ficha Financeira Para mostrar a data programada em vez da data de lancamento 
  no resultado da seleção.
- Implementação do CPF/CNPJ  No relatório de Ficha Financeira .
- Acerto no Relatório de Previsão de Pagamento por Centro de Responsabilidade.
- Acerto no cadastro de Retenção de Impostos para limpar o campo alterador.   
- Inclusão do Nosso Número na Consulta de Documento.
- Acerto da Tela de Parâmetro do Sistema.
- Acerto no Relatório Pagamentos X Tipo de Desembolso
- Inclusão de mensagens de erro na tela Cancelamento de Lote.
================================================================================
CM$VER      2.24.05     16/06/2000
--------------------------------------------------------------------------------
- Relatório Pagamento por tipo de desembolso
  O campo total estava   truncado.
- Adiantamento/Previsão 
  Não mostrava as previsões do ramo do fornedor ou do tipo de Cliente .
- Parâmetro de Emissão de Etiquetas
  Permitir seleção pelo nº do lotes.
- Consulta de documentos 
  Correção no Status dos documentos parcelados e baixados.
  Identificação dos documentos previstos.
- Carta de Cobrança
  Inclusão do valor Principal na consulta
- Relatório de Borderô
  Inclusão do Campo CPF/CNPJ
- Certificado de Retenção
  Correção na impressão dos números das faturas envolvidas na retenção
- Resolução da Pendência Nº 2057
  > Tela\Opçao No Sistema: 
  Inclusão do campo CPF/CNPJ no Borderô para pagamento.
- Resolução da Pendência Nº 2058
  > Tela\Opçao No Sistema: 
  Na consulta de qualquer parcela já baixada de   
  um documento  parcelado, aparece no campo situação do documento "Em aberto". O sistema baixa corretamente o documento, porém na tela, apresenta "Em aberto".
================================================================================
CM$VER      2.24.04     15/06/2000
--------------------------------------------------------------------------------
- Certificados de Retenção
  Alterações no Layout
================================================================================
CM$VER      2.24.03     14/06/2000
--------------------------------------------------------------------------------
- Contas a Pagar
  Implementação da tela recebimentos X Pagamentos
- Relatório Pagamentos em Aberto
  Inclusao do filtro tipo de documento no 
- Lançamento de Documentos
  Inclusao do usuário que inclui o documento
- Relatório conta corrente do fornecedor
  Inclusão do filtro por Ramo do Fornecedor
- Parâmetros do Relatório de Ordem de Pagamento
  Inclusão da indicação do alterador equivalente a retenção
- Resolução da Pendência Nº 1393
  > Tela\Opçao No Sistema: Relatório de Conta Corrente
  Relatorio conta corrente fornecedor saindo por fornecedor de materiais e de servicos separados. - Inclusão de Filtro Por ramo de Fornecedor
================================================================================
CM$VER      2.24.02     09/06/2000
--------------------------------------------------------------------------------
- Pagamento Manual 
  Implementação no tratamento de erro ao Buscar Dados Para Contabilização da Baixa;
- Exclusão de Baixas (Documentos)
  Otimização na consulta de seleção de documentos baixados
- Exclusão de Baixas (Lote)
  Otimização na consulta de seleção de documentos baixados
- Impressão do Certificado de Retenção
  Correção na seleção de retenções para impressão geradas pela tela de pagamento manual
- Impressão de Ordem de Pagamento
  Correção no cálculo do valor real pago pelo documetno (Valor Lote + Impostos Do Certificado de Retenção)
- Lançamento de Documentos
  Correção na Descrição do Status para documento Cancelado
- Consulta de Documento
  Correção na seleção dos documento: Documentos estornados apareciam Duplicados
- Relatório Previsão de Pagamentos Por Centro de Responsabilidade
  Não filtrava a Empresa Proprietária do Centro de Responsabilidade;
- Relatório Correção na consulta do relatório 
  Não filtrava a Empresa Proprietária do Centro de Responsabilidade;
- Arquivo de Cobrança - SISPAG
  Correção na formatação e gravação do número da conta\agência da empresa proprietária e favorecidos dos pagamentos
- Cadastro de Contas Bancárias
  Ordenação da consulta de Bancos e Agências
  Correção na validadação das contas bancárias.
================================================================================
CM$VER      2.24.01     05/06/2000
--------------------------------------------------------------------------------
- Relatório de Ordem de Pagamento
  Correção do Extenso na Ordem de Pago
  Indicação de Cancelado na Ordem de Pago;
- Certificado de Retenção
  Correção na impressão dos números das fatura envolvidas no lote
- Lançamento de Adiantamentos
  Implementação da opção de Lança e baixa simultânea
- Configuração e emissão de Fatura
  Indicar alterador para Imposto/Agregado e incluir no layout o VALORRATEIOIMP
- Lançamento de Documento  
  Erro na gravação da Atividade/Projeto no rateio do Documento;
- Pagamento Manual
  Cancelamento do cálculo da retenção ao ocorrer erro no momento da baixa do documento;
  Correção na posição da pasta de seleção no momento da abertura da tela;
- Relatório TRIAL BALANCE
  Correção do erro "Cannot modify a read-only dataset"
- Relatório DEMONSTRATIVO SINTETICO DE GESTAO
  Correção do erro "No SQL statment available"
- Relatório de SALDOS DOS CLIENTES POR TIPO
  Correção do erro "Divisor is equal to zero"
- Relatório de Carta de Cobrança
  Correção na Duplicidade dos lançamentos
- Parâmetros para emissão da carta de cobrança
  Correção na seleção de Layouts configurados - Passou a listar apenas Layout de Carta de Cobrança, antes listava layout de Recibos;
- Configuração de Carta de Cobrança
  Correção na seleção de Layouts para alteração - Passou a listar apenas Layout de Carta de Cobrança, antes listava layout de Recibos;
================================================================================
CM$VER      2.23.05     02/06/2000
--------------------------------------------------------------------------------
- Lançamentos de Adiantamentos
  Implementação da opção de Lança e Baixa Simultânea
================================================================================
CM$VER      2.23.04     01/06/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na gravação do centro de resposabilidade padrão para o rateio de documentos;
- Emissão do Certificado de Retenção
  Correção do cálculo dos valores do certificado para valores que não tiveran retenção e para vários documentos
  no mesmo lote;
- Relatório de Ordem de Pagamento
  Indicação de cancelamento da Ordem de Pagamento no momento da reimpressão da mesma;
  Possibilidade de reimpressão de Ordem de Pagamento Canceladas ou reimpressas;
  Correção na consulta para obtenção do valor da retenção qdo o mesmo é nulo;
================================================================================
CM$VER      2.23.03     30/05/2000
--------------------------------------------------------------------------------
- Alteração na Retenção de Impostos
  Gravação do Tipo de Documento e Do Numfatura para integração com livro fiscal;
- Importação de Lançamentos
  Correção da gravação da unidnegoc ao importar lançamentos;
================================================================================
CM$VER      2.23.02     30/05/2000
--------------------------------------------------------------------------------
*****************************
15/05/2000 - Alterações Funcef
*****************************
- Relatório de Autorização de Pagamentos
  Altreração na chamda da tela de parâmetros do relatório de "Autorização de Pagamentos - Modelos 2"
  para contemplar a implementação do Parâmetro do Sistema "Relatório para Espelho de Documento";
- Tela de Parâmetros do Relatório de Autorização de Pagamentos
  Altreração na passagem de parâmetros do relatório de "Autorização de Pagamentos - Modelos 2"
  para contemplar a implementação do Parâmetro do Sistema "Relatório para Espelho de Documento";
- Parâmetros do Sistema
  implementação do Parâmetro do Sistema "Relatório para Espelho de Documento";
- Tipo de Desembolso X Centro de Custo X Conta Contábil
  Inclusão da coluna de Analítico/Sintético na procura de Tipo de Desembolso/Recebimento e
  Centro de custo;
- Modulo
  Criação das propriedades...
  IdReports           :Integer
  OrigemCm            :Integer
  NomeReport          :String
  FormEventos         :String
  FormParam           :String
  PpReports           :String
  CodDocumento        :LongInt
  ...para contemplar a implementação do Parâmetro do Sistema "Relatório para Espelho de Documento";
- Exportação de Lançamentos
  ALteração na gravação do arquivo de saída: Exclusão de quebras de linha do campo observação;
- Lançamento de Documentos
  Implemetação da impressão do espelho do documento de acordo com o parâmetro configurado no
  sistema;
  Correção na seleção dos centros de custo de acordo com a conta contábil;
  Implementação da visualização do saldo do documento durante a inclusão do mesmo;
*****************************
16/05/2000 - Alterações Funcef
*****************************
- Relatório de Autorização de Pagamentos - Modelo 2
  Correção do erro "Field 'TRGDTINCLUSAO' not found" ao exibir relatório;
  Alterções no layout;
  Inclusão do Logo da empresa;
- Relatório de Lançamento de Documentos - Modelo 2 
  Implementação do Relatório;
- Lançamento de Documentos
  Implementação da restrição de impressão o "Espelho do Documento": Imprime somente para lançamentos efetivos;
  Correção da gravação do centro de custo indicado no rateio na contabilização do lançamento;
  Inclusão do Código do Centro de Custo na Pasta de contabilização;
- Agrupa Parcela
  Implemetação da impressão do espelho do documento de acordo com o parâmetro configurado no
  sistema;
- Altera Agrupa Parcela
  Implemetação da impressão do espelho do documento de acordo com o parâmetro configurado no
  sistema;
*****************************
17/05/2000 - Alterações Funcef
*****************************
- Lançamento de Documentos
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil;
  Listagem de Todos os Centros de Custo no Rateio quando a opção de não integrar com a 
  contabilidade estiver selecionado;
  Exibir o nome do centro de custo no Grid do Rateio do Documento;
- Contas Bancárias/Caixas x Formas de Pagamento
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil;- Parâmetros do Relatório Posição por Cliente
- Cadastro de Alteradores
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil;- Impostos com Tabela de Retenção
- Transferência de Classificação de Documentos em Atraso
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil;- Relatório de Lançamentos Contábeis
- Tipo de Desembolso X Centro de Custo X Conta Contábil
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil;
- Parâmetros do Sistema
  Iclusão dos parâmetros associados ao cadastro do tipo de Desembolso\Cobrança
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Conta Contábil (FLGTRDXCCXCONTA)
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Impostos Agregados (FLGTRDXIMPOSTOS)
  > Vincula a Inclusão ao Relacionamento com Ramo de Fornecedor (FLGRAMOTIPOFORCLI)
- Cadastro de Tipo de Desembolso\Cobrança
  Altereções para respeitar os novos parâmetros do sistema:
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Conta Contábil (FLGTRDXCCXCONTA)
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Impostos Agregados (FLGTRDXIMPOSTOS)
  > Vincula a Inclusão ao Relacionamento com Ramo de Fornecedor (FLGRAMOTIPOFORCLI)
- Cadastro de Tipo de Desembolso\Cobrança X Centro de Custo X Conta Contábil
  Altereções para respeitar os novos parâmetros do sistema:
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Conta Contábil (FLGTRDXCCXCONTA)
- Cadastro de Tipo de Desembolso\Cobrança X Centro de Custo X Impostos Agregados
  Altereções para respeitar os novos parâmetros do sistema:
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Impostos Agregados (FLGTRDXIMPOSTOS)
- Cadastro de Tipo de Desembolso\Cobrança Ramo de Fornecedor
  Altereções para respeitar os novos parâmetros do sistema:
  > Vincula a Inclusão ao Relacionamento com Ramo de Fornecedor (FLGRAMOTIPOFORCLI)
- Relatórios de Lançamento de Documento Modelo 2
  Ordenação do Relatório por Data de Vencimento e Número da Ap
******************************
18/05/2000 - Alterações Funcef
******************************
- Implementação do Módulo o CMPerfil.
- Criação de Lote
  Inclusão da opção de filtro por documento marcado.
- Tipo de Desembolso X Centro de Custo X Conta Contábil
  Implementação da possibilidade de replicar o relacionamento para vário centros de custo;
- Lançamento de Documentos
  Correção do Erro 'Data Set Not In Edit Or Insert Mode' ao alterar documento
- Lançamento de Documentos Modelo 2
  Correção nos totalizadores do relatório;
- Relatório de Demonstrativo de Gestão de Pagamento:  
  Corrigir o relatório quando existe um rateio no documento.
  Colocar ordenação no relatório
  Colocar totalizador no relatório
  Colocar filtro de ordenar por número da A.P. ou Dt. Vencimento
  Colocar filtro por data de lançamento (Triger)
- Alterações Centrao de Atendimento ( Antídia )
******************************
19/05/2000 - Alterações Funcef
******************************
- Alterações Centrao de Atendimento ( Antídia )
- Arquivo de Exportação de Lançamentos
  Correção na formatação de Texto no arquivo de saída
- Relatório Demonstrativo Gestão de Pagamentos
  Correção no totalizador dos valores do relatório
  Alterações no Layout
- Cadastro de Tipos de Desembolso X Centro de Custo X Conta Contábil
  Correção na associação de vário centros de custo ao Tipo de Desembolso X Conta Contábil
******************************
Alterações Conceição
******************************
- Valor Pagos Por Centro de Responsabilidade e Previsão de Pagamentos Por Centro de Responsabilidade
  Correções na consulta da tela de parâmetros
- Consulta de Ordem de Pagamento
  Implementação da Consulta
- Criação de Lote
  Inclusão do filtro por sistema de origem
- Cancelamento de Lote
  Implementação do cancelamento do NumSlip ao cancelar o lote de um documento
- Emissão de Ordem de Pago
  Alterado a qryordempago no drelatoriscapcar2.pas e no dfm.
  Alterado alterei a QryContabLancLote ,QryContab3Lote, QryContabBaixaLote, QryContaFornCli e o RptContaFornCli no drelatoriscapcar2
- Relatório de AP/GR
  Alterado QrytotApGr do dtmrelatoriocapcar para nao inverter o valor se for lança baixa simultanea.
- Lançamento de Documentos
  Inclusão da Descrição da Conta-Contábil no momento do lançamento.
******************************
Alterações São Paulo
******************************
- Certificado de Retenção
  Implementação da emissão do certificado para várias fatura;
  Implementação da máscara para formatação do número do certificado;
  Correção na consulta de impressão do certificado;
- Emissão de Ordem de Pago
  Correção na Rotina de extenso do valor da OP;
- Resolução da Pendência Nº 1969
  > Tela\Opçao No Sistema: Emissão de Certificado de Retenção
  * Pode Conter Várias Faturas No Mesmo   Certificado > Ex. Toda a retenção do mesmo   tem que estar no certificado e o número das   respectivas faturas;
* Numeração automática dos certificados de     retenção
================================================================================
CM$VER      2.20.08     12/05/2000
--------------------------------------------------------------------------------
- Relatório de Bloquetos Emtidos
  Alteração na frase 'Bloquetos Emetidos'
- Relatório de Conta Corrente de Fornecedor
  Inclusão da coluna Tipo de Documento;
- Resolução da Pendência Nº 1215
  > Tela\Opçao No Sistema: Relatório de Documentos Lançados
  Ao lançar um doc, marcando p/ parcelar, quando consultamos o relat. de docs lançados o sistema mostra o doc e suas parcelas, totalizando errado.
================================================================================
CM$VER      2.20.07     10/05/2000
--------------------------------------------------------------------------------
- Relatório de Documentos em Aberto
  Implementação da tela de parâmetros com filtro por Data, PortadorForma;
- Estorno de Baixa
  Implementação da opção de marcar todos e inverter seleção para estorno;
- Parâmetros do Relatório Aprovação de Documentos Modelo 2
  Inclusão dos dados do documento selecionado para impressão de documento único;
  Correção da exibição dos dados da forma de pagamento quando selecionado um documento único;
- Relatório Aprovação de Documentos Modelo 2
  Alteração no layout da AP Modelo 2
- Lançamento de Documentos
  Alteração na seleção de centro de custo no rateio do documento de acordo com
  a associação de Tipo de Desembolso/Recebimento X Centro de Custo X Conta Contábil
  para Tipos de Desembols/Recebimento sem conta contábil;
  Repetição do centro de responsabilidade anterior na inclusão de novos registros de rateio
- Pagamento Manual
  Correção na visualização dos dados para baixa ao selecionar o(s) documento(s) para baixa;
- Relatório de Aprovação de Documentos\Guia de Recebimento
  Implementação do testa para Guia de Devolução quando o somatório dos saldo dos documentos listados
  no relatório for negativo
- Resolução da Pendência Nº 1971
  > Tela\Opçao No Sistema: Alteração da Retenção da Baixa
  * Solicitar o número do Certificado de retenção
* Possibilitar o cancelamento da retenção
- Resolução da Pendência Nº 1977
  > Tela\Opçao No Sistema: Lançamento de Documentos
  Teste da Pendência 1952:
Ao indicar uma data de emissão repetir a mesma da data de lançamento e ao indicar a data de vencimento repetir a mesma na programada
- Resolução da Pendência Nº 1978
  > Tela\Opçao No Sistema: Lançamento de Documentos
  Teste da Pendência 1953:
Repetir a atividade projeto, centro de custo, tipo de desemboslo do rateio num próximo intem cadastrado
- Resolução da Pendência Nº 1979
  > Tela\Opçao No Sistema: Lançamento de Documentos
  Teste da Pendência 1954:
Verificar a situação de 'Parcelado/Englobado' ao alterar um documento
- Resolução da Pendência Nº 1980
  > Tela\Opçao No Sistema: Consulta/Forncedores
  Teste da Pendência 1955:
Verificar o status dos documento de originaram agrupa/parcela pois estão aparecendo como dois documentos distintos
- Resolução da Pendência Nº 1981
  > Tela\Opçao No Sistema: Agrupa/Parcela
  Teste da Pendência 1956:
Em todas as rotinas que aparecem mensagens de parcelamento alterar para parcelamento/agrupamento
- Resolução da Pendência Nº 1996
  > Tela\Opçao No Sistema: LANCAMENTO / REGISTRA / DOCUMENTO
  Registro de prestação de contas com devolução de adiantamento (ou seja, documento fica com saldo), gerar lançamento no Contas a Receber para emissão de GR ou então criar relatório no contas a pagar tipo GR. 
================================================================================
CM$VER      2.20.06     09/05/2000
--------------------------------------------------------------------------------
- Relatório de Conta Corrente de Fornecedores
   Alterações para respeitar parâmetros de 'Agrega valor do alterador ao saldo do documento' e 'Agrega valor do alterador na baixa do documento' 
- Lançamento de Documentos\Adiantamento\Previsão
   Correção na seleção das opções de Agrupa Parcela, Contabiliza e Lança e Baixa: Não permitia a seleção das mesmas;
- Resolução da Pendência Nº 1901
  > Tela\Opçao No Sistema: Retenção de Impostos
  Inclusão do Teste do Centro de Custo Associado Ao Tipo de Desembolso no Momento da retenção dos impostos.
================================================================================
CM$VER      2.20.05     08/05/2000
--------------------------------------------------------------------------------
- Pagamento Manual
  Correção do erro 'Cannot focus a disble or invisible window';
- Emissão da cópia de cheque
  Correção do erro 'Acces Violation'
================================================================================
CM$VER      2.20.04     05/05/2000
--------------------------------------------------------------------------------
- Agrupamento\Parcelamento de Documento Inclusão\Alteração
  Implemetação da retenção de impostos para documento agregados\parcelados;
- Resolução da Pendência Nº 1536
 * Tela\Opçao No Sistema: Cadastros/Fornecedor
 * Inclusão da coluna IDPESSOA no montaselect  da consulta.  Tal solicitação deve-se ao fato de eles precisarem deste número para fazer a associação com o outro sistema deles quando da inclusão de um fornecedor.
- Resolução da Pendência Nº 1787
 * Tela\Opçao No Sistema: 
 * Disponibilizar nos componentes de seleção de clientes e fornecedores a opção de procura por endereço
- Resolução da Pendência Nº 1905
 * Tela\Opçao No Sistema: Criação de Lote
 * Verificar Query não permitindo a inclusão de documentos estornados 'LANCTODCUM.ESTORNO IS NULL'.
- Resolução da Pendência Nº 1917
 * Tela\Opçao No Sistema: Cadastro de Impostos Agregados
 * Verificar a exibição do Alterardor associado ao imposto no cadastro ao consultar o registro.
Quando o Imposto não possui alterador assiciado ele exibe o alterador anterior
- Resolução da Pendência Nº 1920
 * Tela\Opçao No Sistema: Cadastro de Impostos
 * Otimizar a montagem da Qry de tipo de desembolso quando o fornecedor não for informado
- Resolução da Pendência Nº 1921
 * Tela\Opçao No Sistema: Cadastro de Impostos Agregados
 * Verificar o teste de Analítico/Sintético para o centro de responsabilidade e o teste da obrigatoriedade do mesmo
- Resolução da Pendência Nº 1922
 * Tela\Opçao No Sistema: Cadastro de Impostos Agregados
 * Verificar o teste da obrigatoriedade do centro de custo ao confirmar o cadastro
- Resolução da Pendência Nº 1923
 * Tela\Opçao No Sistema: Cadastro de Impostos\Agreados
 * Verificar a Pasta ativa ao pesquisar/confirmar um registro
- Resolução da Pendência Nº 1924
 * Tela\Opçao No Sistema: Impostos Retidos
 * Correção do label 'Efetudos' para 'Efetuados'
- Resolução da Pendência Nº 1925
 * Tela\Opçao No Sistema: Agrupa Parcela
 * Alterar label 'Forncedor' para 'Fornecedor'
- Resolução da Pendência Nº 1926
 * Tela\Opçao No Sistema: Cadastro de Impostos\Agregados
 * Alterar o combo do Tipo de Desembolso para exibir Desecrição ao invés do código do mesmos
- Resolução da Pendência Nº 1957
 * Tela\Opçao No Sistema: Lançamento de Documentos
 * Alterar o tamanho do histórico complementar
- Resolução da Pendência Nº 1958
 * Tela\Opçao No Sistema: Agrupamento/Parcelamento de Lançamento de Documentos
 * Incluir campo para indicação do número do processo
- Resolução da Pendência Nº 1959
 * Tela\Opçao No Sistema: Relatórios Novos
 * Montar query para relatórios enviados por fax
- Resolução da Pendência Nº 1960
 * Tela\Opçao No Sistema: Exportação de Dados
 * Implemetar geração de arquivo de exportação de lançamentos.
Implementar 'De-Para' com as associações de Tipo De Desemboslo, Centro de Responsabilidade e Centro de Custo.
- Resolução da Pendência Nº 1961
 * Tela\Opçao No Sistema: Relatórios de Demonstrativo e Gestão
 * Implementar relatórios Conforme Modelo enviado por fax
- Resolução da Pendência Nº 1962
 * Tela\Opçao No Sistema: Baixa de Documentos CAP X CAR
 * Implementar Baixa Por Conta a Receber e Vice_Versa
- Resolução da Pendência Nº 1966
 * Tela\Opçao No Sistema: Lançamento de Documentos
 * Permitir que seja colocado o histórico padrão da contabilidade no histórico complementar do documento e na contabilização do mesmo
- Resolução da Pendência Nº 1970
 * Tela\Opçao No Sistema: Relatório de Conta Corrente
 * Juntar a retenção de IVA ao saldo do documento. Não exibindo como outro registro: Marcar o alterador como 'Agrega ao Valor lançado'
- Resolução da Pendência Nº 1973
 * Tela\Opçao No Sistema: Lançamento de Documento
 * Verificar se ao escolher o tipo de desembolso está sendo habilitado o combo do centro de custo
- Resolução da Pendência Nº 1974
 * Tela\Opçao No Sistema: Estorno de Documento
 * Verificar o Valor no RateioFinanc e EntradaSaida = 'S' no estorno de documentos no CAP
- Resolução da Pendência Nº 2009
 * Tela\Opçao No Sistema: Emissão de Ordem de Pago
 * Verificar o Nº de controle da Ordem de Pago >
Está sendo incrementado a cada impressão;
Marcar a ordem de pago do lote como emitida verificando pelo Nº de controle;
================================================================================
CM$VER      2.20.01     20/04/2000
--------------------------------------------------------------------------------
- Correções Gerais no Raltório de demostrativo de gestão analitico;
- Correções Gerais no Raltório de demostrativo de gestão sintético;
- Correções Gerais no Raltório de Autorização de Pagamentos Modelo II;
================================================================================
CM$VER      2.20.00     18/04/2000
--------------------------------------------------------------------------------
- Implementação do Relatório Demonstrativo Sintético de Gestão
- Tipo de Documento
  Inclusão da indicação 'Consiste em Documento Bancário' para o tipo de documento
- Cadastro de Fornecedor, Cliente, Banco, Agência
  Otimização nas consultar do procurar, banco e agência
- Implementação dos Relatórios
  Demonstrativo de Gestão
  Autorização de Pagamento modelo 2
- Correção na Consulta de Documento
- Contas Caixas x Tipos de Cobrança
  Correção na constraint com empresaforn ao confirmar a inclusão/alteração sem
  a indicação do Cliente/Fornecedor para lançamento de Documento associado a Imposto;
- Forma de Pagamento/Tipo de Recebimento
  Inclusão da indicação de associação do tipo/forma a Documentos Bancários
- uDocumento
  * Inclusão da propriedade na Classe TDocumento:
    Property NumApg            :LongInt         read fNumAp             Write fNumAp; 
  * Inclusão do Método ValidaNumApGr
- Exprotação de Lançamentos
  Implementação da Tela
- Agrupamento de Documentos
  Implementação da indicação do Número da AP\GR
- Altera Agrupamento\Parcelamento
  Implementação da indicação do Número da AP\GR
- Lançamento de Documentos
  Implementação da indicação do Número da AP\GR
================================================================================
CM$VER      2.19.03     13/04/2000
--------------------------------------------------------------------------------
- Configuração/Emissão de Certificados de retenção
  Correção no tamanho do campo 'DESCCUSTAGREG';
================================================================================
CM$VER      2.19.02     12/04/2000
--------------------------------------------------------------------------------
- Pagamento Manual
  Correção da mensagem 'Abstract error' ao selecionar documento para baixa;
================================================================================
CM$VER      2.19.01     11/04/2000
--------------------------------------------------------------------------------
- Configuração de Relatórios
  Correção da Impressão dos Relatórios Configurados: Não estavam sendo carregados
  no login do sistema;
- Estorno de Baixas
  Correção do estorno do financeiro: Correção na gravação da Entrada/Saída de
  acordo com o D/C do documento e o 'sinal' do valor baixado
- Pagamento Manual
  Correção no lançamento de baixa no financeiro: Estava gravando entrada como saída
  e vice versa
- Alteração de Centro de Respomsabilidade
  Correção na rotina de Alteração de Centro de Responsabilidade para os documentos
  baixados num lote.
================================================================================
CM$VER      2.19.00     07/04/2000
--------------------------------------------------------------------------------
- Cadastro de Impostos\Agregados
  Otimizada a abertura do Combo de Tipo de Desembolso;
  Correção do Teste de Analítico\Sintético para o centro de responsabilidade;
  Correção do Teste de obrigatoriedade de preenchimento para o centro de responsabilidade;
  Correção do Teste de obrigatoriedade de preenchimento para o centro de custo;
  Correção da exibição da pasta dos detalhes ao alterar\confirmar registros;
- Lançamento de Documento
  Inclusão das colunas Referência e Observação na pasta Geral dos lançamentos;
- Agrupa\Parcela Documentos
  Inclusão das colunas Referência e Observação na pasta Geral dos lançamentos;
- Alteração Agrupa\Parcela Documentos
  Inclusão das colunas Referência e Observação na pasta Geral dos lançamentos;
================================================================================
CM$VER      2.18.06     06/04/2000
--------------------------------------------------------------------------------
- Altera Centro de Responsabilidade
  Implementação da tela de alteração de centro de reponsabilidade para
  documentos já baixados
- Lançamento de Documento
  Inclusão dos Campos Observação e Referência na pasta Geral;
-Relatório de Posição por Cliente e Saldos dos Clientes por Tipo
 Correção de Divisão por Zeros
- Altera Operação de Parcela\Engloba 
  Correção na atualização da operação
- Lançamentos de Documentos
  implementação para repetir a Atividade de projeto ,Centro de Custo ,
  Tipo de desembolso do Rateio.
  Correção da situação 'Parcelado/Englobado' ao Alterar um Documento.
- Consulta de Fornacedores
  Correção estava duplicando documentos.
- Agrupa/Parcela
  Implementação do Agrupamento nas mensagens
================================================================================
CM$VER      2.18.05     05/04/2000
--------------------------------------------------------------------------------
- Pagamento Manual
  Acerto do erro para aceita o preenchimento do Grupo Cnab
-Relatório de Posiçao de Saldos e Trial Balance
 Correção de Divisão por Zeros
- Altera Operação de Parcela\Engloba 
  Implementei mensagem para confirmação da operação.
- Criação de Lote 
  Implementei filtro por forma de pagamento.
- Lançamentos de Documentos
  Na inclusão esta repetindo a data de emissão para a data de lançamento
  Na inclusão esta repetindo a data de vencimento para a data programada
  
================================================================================
CM$VER      2.18.03     29/03/2000
--------------------------------------------------------------------------------
- Consulta Documentos
  Correção da seleção de documentos para filtrar por empresa proprietária;
- Cadastro de Impostos\Agregados
  Correção no erro de constraint ao Inserir Imposto Sem Indicar o Fornecedor/Cliente;
  Correção na consulta da contabilização após inserir um Imposto/Agregado;
  Correção no tamanho da tela;
  Correção na montagem da consulta do Centro De Custo e Habilitação do Combo para a
  indicação do mesmo de acordo com a Conta Contábil Escolhida;
  Correção na montagem da consulta do Tipo de Desembolso e Habilitação do Combo para a
  indicação do mesmo de acordo com a indicação do fornecedor ou não;
  Filtrar Atividade/Projeto, Centro de Custo e Centro de Responsabilidade Por Empresa Proprietária;
- Relatório Ordem De Pagamento
  Correção na Impressão do Valor Por Extenso;
  Inclusão de Filtro Por Alterador e totalizador de Lançamento do Mesmo;
  Alteração Na Ordenação do Relatório;
================================================================================
CM$VER      2.18.02     27/03/2000
--------------------------------------------------------------------------------
- Regularização de Adiantamento - Estorna/Exclui;
  Implementação da tela para Estorno\Exclusão da regularização de adiantamento;
- Lançamento de Alteradores
  Correção do Estorno de Alteradores;
- Criação de Lotes
  Gravação do codportforma da emissão do lote no documento contido no mesmo;
- Relatorio de Valores Pagos Por Lote
  Implementação do Sinal no valor do documento considerando os lançamentos a Débito e a Crédito;
- Relatório de Ordem de Pagamento
  Implementação do Número de Controle da Odem de Pagamento;
  Implementação do Campo para Observação na emissão do Relatório;
  Implementação do Filtro Por Número da Ordem de Pagamento;
  
================================================================================
CM$VER      2.18.01     24/03/2000
--------------------------------------------------------------------------------
- Cadastro de Tipo de Recebimento/Desembolso X  Centro de Custo X Conta Contábil  
  Implementação do Cadastro
- Lancamento de Documentos
   Implementação do teste do relacionamento de Tipo de Recebimento/Desembolso X
   Centro de Custo X Conta Contábil no momento da contabilização de acordo com
   o rateio
================================================================================
CM$VER      2.18.00     23/03/2000
--------------------------------------------------------------------------------
- Alteração na Estrutura de Impostos
  * Inclusão do Tratamento Fiscal 'Lança Imposto Como Novo Documento' ;
  * Inclusão do Parâmentro 'Altera Inposto Na Baixa' na tela de lançamento de
     Impostos;
  * Implementação da Retenção somente para Documentos Fiscais ( Ver Cadastro  
    de tipo de documento );
  * Inclusão dos Dados Para Lançamento de Documento na tela de Lançamento de
    Impostos;
  * Alteração na estrutura de impostos para respeitar o relacionamento de:
    > Impostos X Fornecedores;
    > Impostos X Classificação Fiscal X Tipo Desembolso
    > Impostos X Tipo de Desembolso
  * Correção no cáculo do imposto na baixa e no lançamento do lote e implementação
     da verificação da 'alteração da retenção no momento da baixa' ( Vide Cadastro de Impostos Agregados );
- Implementação da tela de Alteração de dados Bancários do Documentos
   Altera a Forma de Pagamento/Recebimento
  Altera Dados da Ficha de Compensação 
  Altera Contas/Caixas x Forma de Pag
- Erros do Arquivo de Remessa do Banco do Brasil Pagamento
- Implementação do Arquivo De Retorno do Banco do Brasil Pagamento
================================================================================
CM$VER      2.17.17     14/03/2000
--------------------------------------------------------------------------------
- Contas Caixas x Forma de Pagamento
   Correção da mensagem 'Data Set is not in Edit ou Insert Mode' ao excluir documentos;
================================================================================
CM$VER      2.17.16     13/03/2000
--------------------------------------------------------------------------------
- Correção no cáuculo do Float na Baixa de Documentos;
- Implementação do Relatório de lançamentos contábeis;
- Correção do teste de integração com a contabilidade no Cadastro de Fornecedor;
================================================================================
CM$VER      2.17.15     10/03/2000
--------------------------------------------------------------------------------
- Pagamento Manual
  Correção na seleção de Documento - Erro 'List Index Out Of Bound'
- Relatório de Ordem De Pagamento
  Implementação do Relatório;
  Listagem de lotes emitidos ou não com os documentos contidos, contabilização dos mesmo,
  alteradores lançados e rateios;
================================================================================
CM$VER      2.17.14     09/03/2000
--------------------------------------------------------------------------------
- Emissão de Faturas e Notas de Débito
  Correção da Mensagem Invalid Field Name 'IDFORCLI' ao Imprimir Faturas;
================================================================================
CM$VER      2.17.13     03/03/2000
--------------------------------------------------------------------------------
- Tipo de Desembolso x Impostos Agregados
  Implementação da tela
- Classificação Fiscal X Impostos Agregados
  Implementação da tela
- Importação de lançamentos
  Correção na gravação do número de lançamento de origem na inclusão do Imposto
================================================================================
CM$VER      2.17.12     02/03/2000
--------------------------------------------------------------------------------
- Correção dos Relatórios:
  Autorização de Pagamento - A AP era criada mas não era impressa;
 Borderô - Problema na Reimpressão;
 Valores Pagos - Correções gerais na consulta
 Posição dos Saldos Por Tipo de Cliente - Estava somando os Estornos;
  
================================================================================
CM$VER      2.17.11     01/03/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na alteração do rateio: Não exibia o centro de custo associado;
- Importação de Lançamentos
  Correção na função ValidaNumDoc (i): Erro 'Field ''CODDOCUMENTO'' not found';
- Emissão de Cheques
  Correção na impressão via máquina de cheques;
================================================================================
CM$VER      2.17.10     29/02/2000
--------------------------------------------------------------------------------
- Integração com Orçamento
  Correção na comparação com o valor do compromisso: Acerto nas casas decimais;
- Integração com Sistema Financeiro
  Correção no dia do lançamento caso caia em Final de Semana. Para o Contas a Receber
  Lança na 'Segunda', no Contas a Pagar lança na 'Sexta'; 
- Emissão de Borderô
  Correção na data de lançamento no financeiro: Não considerava o 'float' do portadorforma
- Lançamento de Documentos
  Correção na função de verificação dos lançamentos efetuados para o documento 
- Alteração da Operação de Englobado\Parcelado
  Implementação do formulário
================================================================================
CM$VER      2.17.09     24/02/2000
--------------------------------------------------------------------------------
- Estorno\Exclusão  de Baixa de Lote
  Correção na exclusão da baixa do lote > Não marcava como 'emitido e não baixado'
  para poder liberar o cancelamento do mesmo ou o novo pagamento
- Emissão de Cheque
  Correção na data do lançamento no financeiro : Não considerava o float do PortadorForma;
================================================================================
CM$VER      2.17.08     16/02/2000
--------------------------------------------------------------------------------
- Relatório de Retenção de Impostos
  Correção na consulta;
- Relatório Ficha Financeira Para Pagamento
  Correção na consulta de contabilização da baixa;
- Pagamento Manual
  Correção na retenção de impostos agregados no momento da baixa possibilitando o cancelamento de uma retenção
- Lançamento de Documento
  Correção da atribuição do número do documento para lançamentos com tipo de documento marcado para gerar a numeração indicada;
================================================================================
CM$VER      2.17.07     15/02/2000
--------------------------------------------------------------------------------
- Cadastro da Classificação Fiscal
  Implementação do Teste do preenchimento do código reduzido da classificação fiscal;
- Impressão do Certificado de Retenção
  Implementação do teste da exiostência do nº do certificado de retenção no
  momento da reimpressão não permitindo a alteração do mesmo;
- Lançamento de Documentos
  Implementação do teste da associação da classificação fiscal ao fornecedor
  qdo o sistema obriga a associação da classificação fiscal ao complemento do
  documento;
  Implementação da autorização do Lança e baixa Simultânea e Do Não Contabilizar;
- Emissão de Bloquetos
  Correção na seleção da data de emissão dos Bloquetos  
- Transferência de Classificação
  Correção da consutla de transferência contábil   
- Emissão de Cheque
  Correção do lançamento no financeiro para cheques com documentos do tipo lança e baixa
- Ficha Financeira Para Pagamento/Recebimento
  Inclusão da seleção por lote e possibilidade de imprimir a Ficha Para todos
  os documento do lote selecionado;
  Gravação de um número sequencial para as fichas geradas;
  Inclusão de texto para autenticação do formulário. Impresso por default no
  rodapé do relatório;
================================================================================
CM$VER      2.17.06     14/02/2000
--------------------------------------------------------------------------------
- Estorno de Baixas
  Correção do estorno do financeiro;
- Transferência de Classificação
  Otimização do Formulário;
  Correção na transferência contábil;
================================================================================
CM$VER      2.17.05     10/02/2000
--------------------------------------------------------------------------------
- Alteração/Exclusão de Pagamentos
  Implementação da exclusão dos impostos/agregados retidos na baixa do documento
- Cancelamento do Lote
  Implementação da exclusão dos impostos/agregados retidos na baixa do documento
- Estorno de Baixas
  Implementação da exclusão dos impostos/agregados retidos na baixa do documento
- Criação de Lote
  Implementação da retenção dos impostos/agregados no momento da criação do lote
- Parâmetro do Relatóro de Recolhimento de Encargos
  Inclusão dos Agregados e dos Impostos do Tipo Somente Calcula valor no relatório
- Pagamento Manual
  Implementação da retenção dos impostos/agregados na baixa do documento
- Retenção de Impostos/Agregados
  Implementação do cálculo da retenção de impostos/agregados de acordo com o 
  parâmetro de baixa do documento
================================================================================
CM$VER      2.17.04     07/02/2000
--------------------------------------------------------------------------------
- Relatorio Valores Pagos/Recebidos
  Otimização da consulta do relatório
- Extenso
  Correção do extenso em Espanhol
- Emissão e Configuração do Certificado de Retenção
  Alteração da Coluna Logradouro da tabela de endereço para o novo padrão
  
================================================================================
CM$VER      2.17.03     04/02/2000
--------------------------------------------------------------------------------
- Configuração de Relatórios
  Implementação da opção de configuração dos relatórios do sistema através
  da opção do menu Consulta/Configura;
================================================================================
CM$VER      2.17.02     03/02/2000
--------------------------------------------------------------------------------
- Emissão/Configuração de Cheque
  Correção no extenso do cheque para valores do tipo 800 e 900;
  Correção na descrição da moeda impressa no extenso do cheque;  
================================================================================
CM$VER      2.17.01     02/02/2000
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Correção da confirmação de alteração no cadastro
================================================================================
CM$VER      2.17.00     31/01/2000
--------------------------------------------------------------------------------
- Geral
  Atualização de todas as consultas que acessam os dados do Endereço e Telefone;
- Contas Caixas x Formas de Pagamento
  Implementação da conta contábil para indicação da contabilização da emissão do
  cheque associado ao portador forma;
- Emissão e Configuração de Cheques
  Correção na tradução do mês do cheque;
- pagamento Eletrônico
  Correção da validação da autorização do processo RAD associado ao LOTE
- Emissão de Borderô
  Correção do erro 'List index out off bounds' ao executar o relatório
================================================================================
CM$VER      2.16.05     28/01/2000
--------------------------------------------------------------------------------
- Emissão de Cheque
  Implementação da tradução do extenso de acordo com o idioma do sistema
- Configuração de Cheque
  Implementação da tradução do extenso de acordo com o idioma do sistema
- Relatório de aprovação de documentos
  Implementação da tradução do extenso de acordo com o idioma do sistema
- Configuração e Impressão de Recibo
  Implementação da tradução do
================================================================================
CM$VER      2.16.04     25/01/2000
--------------------------------------------------------------------------------
- Cadastro de Fornecedor
  Inclusão da opção de busca da agência através de consulta
- Cadastro de Alteradores
  Inclusão do teste da associação do alterador a um imposto. Em caso de já
  estar associado a um imposto não pode ser efetuado o calculo de imposto
  sobre o lançamento para tal alterador 
- Cadastro de Impostos e Agregados
  Inclusão da Indicação de cálculo pelo valor bruto ou líquido do lançamento.
  Ultilizado para retenções de impostos no almoxarifado.
- Importação de Documentos
  Alteração no lançamento de impostos com tabela de retenção. Correção do erro
  de constraint com a tabela lanctodocum
- Lançamento de Documentos
  * Alteração na retenção de impostos através da Indicação de Débito/Crédito 
    para acerto no cáculo de devolução de imposto;
  * Implementação da Geração Automática do Número do Documento de acordo com o
    indicado no Tipo de Documento Associado
  * Alteração no lançamento de impostos com tabela de retenção:
    Passou a ser informado se o lançamento é de acréscimo ou de decrescimo para
    possível devolução de uma retenção.
    Passou a ser verificado se para cada tipo de recebimento/desembolso é obrigatório
    o cáculo e lançamento de Imposto fazendo com que somente seja calculado o
    imposto para os valores lançados para os tipos de recebimento/desembolso
    associados;  
- Lançamento de Alteradores
  Alteração na retenção de impostos através da Indicação de Débito/Crédito 
  para acerto no cáculo de devolução de imposto
================================================================================
CM$VER      2.16.03     24/01/2000
--------------------------------------------------------------------------------
- Cadastro de Fornecedor
  Ordenação do Grid de Impostos e Agregados;
  Correção na alteração de registro sem indicação do tipo da conta bancária;
- Cancelamento de Lotes
  Implementação do cancelamento do procesos no RAD no momento do cancelamento
  do lote 
- Lançamento de Documento
  Inclusão do saldo do documento juntamente com a indicação do status
- Relatórios
  * Alteração no relatório de AP e GR na listagem de documentos como lança e baixa.
    Coorreção na impressão do histório de baixas;
  * Relatório de Documentos Lançados
    Correção na impressão da Razão Social com Número do cumento e valor com o histórico
================================================================================
CM$VER      2.16.02     19/01/2000
--------------------------------------------------------------------------------
 - Configuração de Recibo 
 Implementação da Configuração e Impressão de recibo
 - Relatorio de Fichas Financeiras
 Gravação da emissão das Fichas Financeiras possibilitando a seleção das fichas pendentes de impressão
 - Altera Exclui Pagamento
 Alteração na exclusão da baixa: a exclusão da baixa cancelava o lote sem
 excluir do financeiro.
 - Cancelamento de Lote
 Alterações no Layout e Segurança de transação de dados;
 - Cadastro de Impostos Retidos
 Correção no cálculo do impostos qdo setado para acumula valor e o valor retido era menor que zero,
 nesta situação não acumulava valor;
 - Cadastro de Fornecedor
 Implementação do inclusão automática da agência bancária caso não exista
 - Relatório Borderô
 Exclusão da indicação de preparado por
 - Exclusão de Agrupa/Parcelas 
 Não Excluía os lançamentos referents ao documento parcelado/englobado (Operação 3 ou 13) 
================================================================================
CM$VER      2.16.01     17/01/2000
--------------------------------------------------------------------------------
- Configuração de Cheques
  Inclusão dos campos para a indicação de Nºde Cheques para o salto de linha e
  Salto de linhas entre cheques.
- Cadastro de Fornecedores
  Alteração na gravação da conta bancária do fornecedor: O Número da agência
  tem de ser digitado, a partir daí o sistema verifica a existência da agência e inclui
  altomaticamente caso a mesma não exista no cadastro.
================================================================================
CM$VER      2.16.00     12/01/2000
--------------------------------------------------------------------------------
 - Relatório de Posição dos Saldos 
   Correção na consulta no tratamento dos estornos
 - Relatório de Posição Por Forncedores/Clientes
   Correção na consulta no tratamento dos estornos
 - Lançamento de Alterador
   Alteração na retenção de impostos para verificar se são calculado os impostos
   sobte o lançamento do alterador
 - Alteração de Saldos
   Alteração na retenção de impostos para verificar se são calculado os impostos
   sobte o lançamento do alterador
 - Cadastro de Alterador
   Inclusão da indicação da retenção de impostos agregados ao fornecedor no 
   momento do lançamento do mesmo
================================================================================
CM$VER      2.15.01     12/01/2000
--------------------------------------------------------------------------------
- Certificados de Retenção
   Implementação do cadastro.
   Configuração e impressão dos Certificados de Retenção de imposto
- Relatório 'Borderô Tipo Ordem de Pagamento'
  Alteração no Número da agência
  de Débito etava sendo exibido no lugar do nome da agência
- Exclusão\Estoro de lote
  Verificação da existência de uma regularização para o documento a ser excluído
  ou se o documento equivale a um adiantamento já regularizado, não permitindo
  assim a exclusão/estorno do mesmo
- Estorno de Documentos
  Verificação da existência de uma regularização para o documento a ser excluído
  ou se o documento equivale a um adiantamento já regularizado, não permitindo
  assim a exclusão/estorno do mesmo
- Pagamento Eletrônico IntBanco
  Implementação do processo do RAD de controle de pagamentos
- Pagamento Manual
  Inclusão da coluna código do documento na opção de procura documento/complemento
- uModulo (i)
   Implementação do método ExisteRegularizacao onde é verificado se ocorreu a
   regularização de um adiandamento ou se um documento possui regularização
   através do parâmetro código do documento;
- Relatório de Documentos Por Data Programada
  Inclusão do filtro por tipo de documento;
  Otimização da Query do relatório (i)
================================================================================
CM$VER      2.15.00b    03/01/2000
--------------------------------------------------------------------------------
- Correção nas telas de Cadastro de Tipo de Documentos e fornecedor
================================================================================
CM$VER      2.15.00a    03/01/2000
--------------------------------------------------------------------------------
- Correção nas telas de Cadastro de Tipo de Fatura e Parâmetros do Sistema 
  Compatibilizando o tipo dos campos no 'Fields Editor' com os da base
================================================================================
CM$VER      2.15.00     30/12/1999
--------------------------------------------------------------------------------
- Cadastro de Tipos de Documentos
  Inclusão da classifiacação do documento como documento fiscal;
  Indicação do tipo do documento com relação ao engloba/parcela: O Tipo do
  Documento pode caracaterizar sempre um engloba/parcela, pode não caracterizar
  um engloba/parcela ou pode ser definido pelo usuário no momento do lançamento
  do mesmo;
- Impressão de Bloqueto
  Inclusão da opção de ultilização de fonte condensada na impressão do bloqueto;
- Geração de Lote
  Implementação do teste do Contas Caixas x Formas de Pagamento em relação ao
  cheque diferido. Caso seja positivo, é solicitada a data do diferido no momento
  da criação do lote e gravado no lote gerado;
- Contas Caixas x Formas de Pagamento
  Inclusão de parâmetro para indicação da emissão de cheque diferido;
- Parâmetros do CapCar
  Inclusão do Parâmetro para indicação da máscara do numero do documento e da
  associação do código reduzido da fatura ao complemento do documento;
- Lançamento de Documentos
  Implementação da máscara do documento e associação do código reduzido do tipo
  de fatura ao complemento do documento de acordo com os parâmetro do sistema;
  Gravação do Tipo de Documento, Código Formatado do documento e tipo de fatura no
  lançamento do documento;
  Verificação do tipo do documento com relação a agrupa/parcela;
- Emissão de Cheques
  Inclusão da verificação do contas caixas formas de pagamento com relação ao
  cheque diferido e dos lançamento no financeiro com a data do mesmo;
- Configuração de Cheques
  Implementação da configuração para cheques diferidos;
  Criação do parâmetro para impressão com fontes condensadas;
- Agrupamento de Documentos Inclusão/Alteração
  Implementação da máscara do documento e associação do código reduzido do tipo
  de fatura ao complemento do documento de acordo com os parâmetro do sistema;
  Gravação do Tipo de Documento, Código Formatado do documento e tipo de fatura no
  lançamento do documento;
  Verificação do tipo do documento com relação a agrupa/parcela;
- Tipos de Fatura
  Implementação do cadastro;
  Cadastro de Tipos e layout de faturas a associar a classifiação fiscal do
  cliente/fornecedor;
- Classificação Fiscal do Cliente/Fornecedor
  Implementação do cadastro;
  Cadastro da classifiação fiscal do cliente/fornecedor a associação dos
  Tipos faturas e layouts a serem impressoras para os documentos associados ;
- Cadastro de Fornecedor
  Implementação da associação da Classifiação fiscal ao Fornecedor
================================================================================
CM$VER      2.14.17     23/12/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
   Correção da alteração de documentos lançados como lança e baixa no tocante a
   exclusão do lançamento no financeiro;
- Relatórios
  Alteração na contabilização dos Adiantamentos no relatório Ficha Financeira Para
  Pagamento, Aprovação de Documentos e Guia de Recebimentos
- Módulo (i)
  Inclusao da propriedade IdTipoProcRad que indentifica a existencia de um
  processo de controle de pagamentos
- Criação de Lotes e Emissão de Cheques
  Implementação do processo do RAD de controle de pagamentos
================================================================================
CM$VER      2.14.16     20/12/1999
--------------------------------------------------------------------------------
- Alterada a impressao do AP para aparecer os documentos de adiantamento.
- Acertado o procurar do Contas/Caixa x Forma de Pagamento
================================================================================
CM$VER      2.14.15     10/12/1999
--------------------------------------------------------------------------------
Lançamento de Documentos
  - Correção do teste da indicação dos dados bancários do fornecedor de acordo com
    o Contas Caixas X Formas de Pagamentos.
  - Inclusão do teste da data de quebra do contrato/previsão em ralação a data do
    documento lançado
Relatórios
  - Alteração no título do relatório qdo impressa uma GR
    Implementação da impressão de GR ou AP contendo apenas documentos cancelados
    Inclusão da indicação do estorno no relatório de valores pagos/recebidos
    Inclusão de grupo e totalização por número do cheque\borderô na Ap\Gr e
    totalização no final da ap
  - Alteração no Borderô Tipo ordem de pagamento na descrição dos dados
    bancários para pagamento do borderô
  - Alteração no Layout do Relatório 'Emissão de SLIP'
  - Valores Pagos e Recebidos
    Inclusão da descrição de documentos cancelados\estornados e não considerar o
    valor nos paramentos do dia
  - Autorização de Pagamentos\Recebimentos
    Alteração no título do relatório qdo impressa uma GR
    Implementação da impressão de GR ou AP contendo apenas documentos cancelados
  - Relatório de Controle de Valores Pagos em cima de um valor mínimo para pessoas
    físicas e pessoas jurídicas em um determinado período
Emissão de Cheques
  - Correção da mensagem 'A Impressão foi cancelada' ao término da impressão de
    cheques
Consulta de Documentos
  - Correção na descrição da situação de documentos cancelados\estornados     
================================================================================
CM$VER      2.14.14     06/12/1999
--------------------------------------------------------------------------------
- Relatório Autorização de Pagamentos
  Inclusão dos documentos Inclusos como lança e baixa simultânea;
================================================================================
CM$VER      2.14.13     12/11/1999
--------------------------------------------------------------------------------
- Parcelamento de Documentos
  Correção na gravação do DebCre na tabela lanctodocum no lançamento de
  um parcelamento e na alteração do mesmo
- Baixa Automática
  Correção da baixa automática de documento no retorno do sispag
================================================================================
CM$VER      2.14.12     12/11/1999
--------------------------------------------------------------------------------
- Lançamento de documentos
  Correção na exclusão do lançamento contábil para documentos lançados como
  integrados com a contabilidade e alterados para não integrados;
- Lançamento de Alteradores
  Correção na alteração do lançamento contabil no momento da alteração dos
  alteradores
================================================================================
CM$VER      2.14.11     05/11/1999
--------------------------------------------------------------------------------
- Baixa Automática
  Implementação da busca do número do lote de origem do envio e do portador
  forma origem do envio para a baixa 
- Gera Lote
   Correção na indicação do favorecido ao gerar o lote: O processo continua após
   a indicação do mesmo
- Pagamento Manual
  Inclusão da coluna nossonúmero no grid de baixa do contas a receber
  Inclusão do filtro por Forma de Pagamento/Tipo de Recebimento e Sistema de
  Origem do lançamento
- Ficha Financeira Para Pagamento/Recebimento
  Implementaçã do agrupamento dos items do rateio com o somatório do valor na
  consulta do rateio do paracelado;
  Inclusão do filtro por sistema de origem do lançamento;
- Estorno de Baixas
  Implementação do teste da indicação de documentos para estorno
================================================================================
CM$VER      2.14.10     01/11/1999
--------------------------------------------------------------------------------
- Alteração de Lote
    Possibilitar a alteração do lote qdo o lançamento no financeiro for exclusivamente
    na baixa do documento e o cheque não for contabilizado no momento da emissão
- Pagamento Eletrônico
    Implementação da baixa eletrônica dos lotes no contas a pagar
  
================================================================================
CM$VER      2.14.09     29/10/1999
--------------------------------------------------------------------------------
- Ficha Financeira para pagamento
    Alterações no layout do relatório: Inclusão do código do documento como
    identificador da ficha, conta contábil de baixa, acerto do histórioco
    qdo o valor é zerado, acerto na função de cálculo do saldo do documento.
- Arquivo para esportação de baixas
    Inclusão das seguintes colunas no layout do arquivo
       CODDOCUMENTO                                   - N(10)
       NOSSONUMERO                                    - A(15)
- Lançamento de documentos 
    Correção da exclusão da planilha no momento da alteração do documento
- Gera Lote Para Pagamento
  Alteração na gravação dos campos de código de barras ao gerar o lote
- Pagamento Manual
  Inclusão da subconta do lançamento não identificado a ser ultuilizada no momento
  da baixa qdo for regularizado um não identificado no financeiro
================================================================================
CM$VER      2.14.08     28/10/1999
--------------------------------------------------------------------------------
> Correção na contabilização do parcelado no relatório Aprovação de documentos
   Borderô para débito em conta;
> Alteração da consulta do borerô para débito em conta;
> Inclusão do parâmeto para indicação da exclusão da planilha contábil no momento
   da alteração do documento 
================================================================================
CM$VER      2.14.07     26/10/1999
--------------------------------------------------------------------------------
- Importação de documentos
  Inclusão da coluna para indicação do centro de custo para lançamento da baixa
  Posição de 173 a 182, numérico alinhado a direita. Esta coluna é opcional;
  Correção do rateio e da verificação do total do rateio na impotação;
================================================================================
CM$VER      2.14.06     25/10/1999
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Gravação do tipo de operação na contabilização do lançamento importado
- Lançamento de documento
  Correção do teste da exclusão da contabilização no momento da alteração do
  documento
================================================================================
CM$VER      2.14.05     21/10/1999
--------------------------------------------------------------------------------
-  Gera Arquivo de Transferência de baixas
     Gera arquivo contendo as baixas dos documentos de acordordo com os
     parâmetros passados: Tipo de Documento ou data da baixa.
     O arquivo mostra o rateio da baixa em função do rateio do lançamento do
     documento e possui o seguinte layout:
       IDFORCLI (Identificador do cliente/fornecedor) - N(8)
       NUMERO DO DOCUMENTO                            - N(15)
       COMPLEMENTO DO DOCUMENTO                       - A(3)
       TIPO DE DESEMBOLSO/RECEBIMENTO                 - N(15)
       ATIVIDADE/PROJETO                              - N(15)
       VALOR DO RATEIO                                - N(12,2)
       DATA DE EMISSÃO                                - N(8)
       DATA DE PAGAMENTO                              - N(8)
       DATA DE LANCAMENTO                             - N(8)
       HISTORICO DA BAIXA                             - A(60)
     Os campos numéricos são alinhados a direita com zeros a esquerda, os campos
     caracter são alinhados a direita e os campos data possum o formato DDMMYYYY
- Acertado a importacao do arquivo texto que nao estava dando erro no primeiro
  e no ultimo registro
================================================================================
CM$VER      2.14.04     19/10/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  > Pasta Alteradores
     Inclusão da opção de contabilizar ou não o lançamento do alterador independente
     da contabilização do documento;
     Ordernação do combo box do tipo do alterador
- Pagamento Automático
  Alteração do nome do combo box da forma de pagamento para Contas Caixas X Formas de 
  Pagamento
- Transferência de Classificação
  Implementação do sincronismo entre tipo de desembolso e contacontábil no momento
  da transferência, ou seja: transfere lançamentos contábeis com a conta do tipo de desembolso;
- Relatório de Ficha Financeira
  Alteração na consulta do rateio dos documentos parcelados/englobados
  Alteração na consulta da contabilização dos documentos origem de parcelas
  
================================================================================
CM$VER      2.14.03     15/10/1999
--------------------------------------------------------------------------------
- Emissão de Cheques
  - alterações na impressão do verso do cheque:
    Margem esquerda aumentada;
    Passou a considerar as linhas em branco;
    Correção da mensagem de erro: 'A impressão foi cancelada';
- Transferência de Classificação
  Inclusão da indicação da data a ser ultilizada para a seleção dos lançamentos: Data de
  vencimento ou data programada;
- Geração de remessa eletrônica
  Correção da gravação da data para lançamento no financeiro
================================================================================
CM$VER      2.14.02     15/10/1999
--------------------------------------------------------------------------------
- Emissão de Cheques
  Alteração na seleção dos lotes a serem emitidos
================================================================================
CM$VER      2.14.01     14/10/1999
--------------------------------------------------------------------------------
- Relatório Ficha Financeira Para Pagamento\Recebimento
  Correção da simulação da contabilização dos documentos agrupados/parcelados;
  Correção no rateio dos lançamentos parcelados/englobados;
- Altera Agrupa\Parcela Documento 
  Correção do erro "" is not a valid integer value no momento da alteração
  das parcelas
- Altera\Exclui Pagamento
  Implementação da não efetivação do lançamento não identificado no financeiro
  efetivado no momento da baixa no Contas a Receber
- Consulta de Fornecedores
  Alteração do texto do botão seleciona documentos 
- Consulta Documentos
  Correção da simulação da contabilização dos documentos agrupados/parcelados ;
  Inclusão de Previsões nas consultas.
- Lançamento de Alteradores
  Correção dos valores passados para a alteração do lançamento de alterador. 
- Estorno de Pagamento de um lote
  Implementação da não efetivação do lançamento não identificado no financeiro
  efetivado no momento da baixa no Contas a Receber;
- Consulta cliente\fornecedore
  Alteração do texto do botão seleciona documentos ;
- Relatório de valores pagos\recebidos
  Correção do erro 'Comando SQL não finalizado corretamente' na confirmação dos
  parâmetros;
================================================================================
CM$VER      2.14.00     14/10/1999
--------------------------------------------------------------------------------
- Pagamento Manual
  Implementação da regularização de lançamentos não identificados no financeiro
  no momento da baixa do documento no contas a receber;
  - Regulariza Lancamento no financeiro
    Implementação da tela para regularização de lançamentos não identificados no
    financeiro no momento da baixa manual de documentos no contas a receber;
- Modulo
  Impementação da propriedade ContaNaoIdentificado que inicializada pelo método
  BuscaParamCap com a conta contábil dos lançamentos não identificados definida
  no ParamFinanc;
================================================================================
CM$VER      2.13.15     08/10/1999
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Inclusão da verificação do valor do rateio e da duplicidade do documento no
  mesmo arquivo de importação;
- Relatórios Tipo Borderô
  Correção na consulta do Borderô pois não exibia documentos lançados para
  fornecedores novos
================================================================================
CM$VER      2.13.14     07/10/1999
--------------------------------------------------------------------------------
- Pagamento Eletronico
  Inclusão do campo tipoconta para validação da conta bancária de acordo com o tipo:
  poupança, contaü:
rente e pagamento;
  Inclusão da indicação da data para o lançamento no financeiro;
- Relatório de Valores Pagos
  Inclusão da opção de exibir os valores recebidos no relatório (pagamentos negativos)
- Parâmetros do Sistema
  Alteração do layout da tela;
  Inclusão do parâmetro para o controle de talão de cheques e numeração automática
  de cheques;
  Considera o FLOAT para lançamento de baixas na contabilidade: Soma a data de
  laçamento o FLOAT indicado no portadorforma;
  Contabiliza a Emissão de Cheques: Indica se o cheque será contabilizado para
  uma conta transitória no nomento da emissão.
  Conta Contábil  Para a Emissão de Cheques: Conta transitória ultilizada na
  contabilização de cheques no momento da emissão de acordo com o parâmetro
  anterior 
- Agrupamentos\Parcelamento de documentos
  Exclusão da obrigatoriedade da indicação do portador forma;
  Gravação da forma de pagamento;
- Altera Agrupamentos\Parcelamento de documentos
  Exclusão da obrigatoriedade da indicação do portador forma;
  Gravação da forma de pagamento;
- Parâmetros deo Relatório Ficha Financeira
  Inclusão do filtro por data programada;
  Filtro por data de lançamento passou a ser opcional;
- Pagamento Manual
  Inclusão da opção de considerar o float para a data do lançamento contábil de
  acordo com o parâmetro do sistema para a contabilização da baixa
- Lançamento de Documentos
  Inclusão do teste para documentos lançados com o valor '0' (zero), pedindo a
  confirmação para o lançamento do documento;
- Pagamento Automático
  Inclusão da opção de considerar o float para a data do lançamento contábil de
  acordo com o parâmetro do sistema para a contabilização da baixa
- Relatório Ficha Financeira Para Pagamento
  Alteração no desenho do relatório
- Importação de documento
  formatação do número do documento nos históricos e lançamentos da importação
================================================================================
CM$VER      2.13.13     30/09/1999
--------------------------------------------------------------------------------
- Emissão de Cheque
  Alteração na atualização dos cheques - Ordenação pelo número do lote para a impressão
  e para a atualização, correção na atualização pois não considerava cheques cancelados,
  pulando a numeração dos impressos;
  Inclusão do controle do talão de cheques e da numeração automática de cheques de acordo
  com o parâmetro do sistema;
  Inclusão da impressão de verso do cheque para impressora Check Pronto;
- Parâmetros do Sistema
  Alteração do layout da tela;
  Inclusão do parâmetro para o controle de talão de cheques e numeração automática
  de cheques;
- Controle de Talão de Cheques
  Implementação do cadastro
  
================================================================================
CM$VER      2.13.12     28/09/1999
--------------------------------------------------------------------------------
- Ficha Financeira para pagamento
  Alteração na ordenação da consulta pois gerava os rateios do mesmo documento
  em fichas diferentes
- Importação de Documentos
  Correção do Acces Violation na importação de documentos
================================================================================
CM$VER      2.13.11     24/09/1999
--------------------------------------------------------------------------------
 Relatório de Documentos Por Data Programada 
 - Inclusão no relatório dos documentos lançados como lança e baixa e não emitidos,
   de acordo com o parâmetro do sistema.
 Relatório de Posição de Fornecedores Por Centro de Responsabilidade 
 - Inclusão no relatório dos documentos lançados como lança e baixa e não emitidos,
   de acordo com o parâmetro do sistema.
================================================================================
CM$VER      2.13.10     23/09/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Alteração no teste de previsões/adiantamento para regularização pois algumas
  previsões não eram exibidas;
  Inclusão do filtro pelo de Ramo de Fornecedor para adiantamento indicado em
  parâmetros do sistema no CAP;
- Pagamento automático de Documentos
  Alateração no valor da baixa para doc's com saldo negativo: o valor gravado
  passou a ser sempre o absoluto;
- Baixa Eletrônica de Documentos ( Arquivo IntBanco )
  Alateração no valor da baixa para doc's com saldo negativo: o valor gravado
  passou a ser sempre o absoluto;
- Regularização de Adiantamento
  Inclusão do filtro pelo de Ramo de Fornecedor para adiantamento indicado em
  parâmetros do sistema no CAP;
- Pagamento Manual
  Alateração no valor da baixa para doc's com saldo negativo: o valor gravado
  passou a ser sempre o absoluto;
- Parâmetros do sistema
  Inclusão do parâmentro para indicação do Ramo de Fornecedor para adiantamento
================================================================================
CM$VER      2.13.09     21/09/1999
--------------------------------------------------------------------------------
- Arquivo IntBanco Real
  Correção da validação dos dados bancários e logradouro;
- Ficha Financeira Para Pagamento
  Diferenciar tipos de lançamentos: Efetivo, Previsão e Adiantamento;
  Lançamentos com status null não estavam sendo listados no relatório;
  Acerto na consulta do rateio do documento;
- Lançamento de Documentos
  Correção do Erro DataSet is Not in edit or insert mode na alteração do dodumento;
  Exclusão da subconta na alteração da contabilidade;
================================================================================
CM$VER      2.13.08     15/09/1999
--------------------------------------------------------------------------------
- Relatório de Documentos em Aberto
  Inclusão da coluna Forma de Pagamento / Tipo de cobrança 
- Documentos Lançados
  Correção na listagem de documentos parcelados, pois apereciam os documentos de
  origem;
  Correção na listagem dos documentos estornados, pois estavam somando ao valor
  lançado;  
- Posição dos Saldos
  Correção do relatório pois não respeitava o filtro por cliente\fornecedor com
  relação aos saldos anteriores;
================================================================================
CM$VER      2.13.07     14/09/1999
--------------------------------------------------------------------------------
- Relatório de Documentos em aberto
  Alteração na consulta;  
- Transferência de Classificação
  Inclusão da Razão social no histórico contábil
- Ficha Financeira para para pagamento
  Alteração no modo de exibição do Banco - Agência - Conta;
  Inclusão de várias linhas para o histórico do lançamento;
  Alteração da data de emissão;
- Parâmetro do Relatório ficha financeira para pagamento
   Inclusão do filtro pela data de inclusão do documento
- Correção Automática de documentos
   correção do erro 'missing right cote' ao corrigir os documentos
================================================================================
CM$VER      2.13.06     14/09/1999
--------------------------------------------------------------------------------
- Transferência de classificação
   Alterações na largura dos combos de Tipos de Recebimento\Desembolso e Contas
   Contábeis;
- Relatório Ficha financeira para Pagamentos
  Alterações Gerais
     Listagem dos rateios, algumas vezes não eram impressos;
     Inclusão de filtro pelo usuário que preparou o documento;
     Alteração na largura de alguns campos;
     Ajustes finais na estética do documento;
- Relatório de cópia de cheque
   Os adiantamentos não estavam sendo impressos na copia de cheque
================================================================================
CM$VER      2.13.05     09/09/1999
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Inclusão de parâmetro para indicação de exclusão de lançamentos
  contábeis na alteração do documento; `
- Estorna de Documento
  Correção no histórico do estorno no financeiro e na contabilidade
  LIberação do Documento para geração de lote no caso de um estorno parcial;
- Lançamento de Doumento
  Correção do erro: 'DataSet is not in Edit Insert Mode' na alteração do rateio;
- Importação de lançamentos
  Alteração do lançamento automático de impostos na importação
- Correção de Documentos
  Implementação da correção automática de documentos
================================================================================
CM$VER      2.13.04     08/09/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na seleção do centro de custo para o rateio;
- Transferência de Contas
   Indicação automática da conta a crédito associada ao tipo  de desembolso
- Estorno de Documento
   Permitir indicar o valor a ser estornado
================================================================================
CM$VER      2.13.03     03/09/1999
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Correção do Access Violation ao Abrir a Tela
- Lançamento de Documentos
  Alteração da ordem de indicação do centro de custo para o rateio e seleção dos
  Centros de Custo associados a conta contábil indicada no tipo de desembolso escolhido;
================================================================================
CM$VER      2.13.02     01/09/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Inclusão do centro de custo na tela do rateio;
  Correção do teste de não obrigar a Atividade Projeto e Centro de Responsabilidade;
  Otimização da Alteração de Documentos;
- Relatório de Ficha Financeira para pagamento
  Inclusão do extenso do saldo;
  Inclusão do número da ficha de compensação\conta bancária;
- Estorno de Pagamento de um Documentos
  Alteração nos histíoricos contábeis e financeiro;
- Consulta Documentos
  Inclusão do PLNPLANIL na grade de contabiliazações;
- Cadastro de Alteradores
  Correção no Teste da Obrigatoriedade do centro de Custo;
- Alteração nas consultas que envolvem endereço para compatibilização com a nova
  estrutura. As telas envolvidas foram:
   - Carta de Cobrança
   - Cadastro de Carta de Cobrança
   - Emissão de etiquetas
   - Pagamento Eletrônico
   - Altera dados remessa
   - Remessa eletrônica
================================================================================
CM$VER      2.13.01     31/08/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos, Previsão, Adiantamentos
  Correção do erro 'nome de coluna inválido' após a seleção de um fornecedor;
- Lançamento de Alteradores
  Alteração na funcionalidade do cadastro, não exibe a nova seleção de documento
  após a inclusão
- Relatório de  PREVISÃO DE PAGAMENTOS X CENTRO DE RESPONSABILIDADE.
  Inclusão dos Adiantamentos no relatório
- Relatório de Posição de Fornecedores
  Inclusão da Listagem do saldo anterior e e saldo atual com totalização dos mesmo;
  Inclusão da listagem dos fornecedores que não tiveram movimento no período mas que possuem saldo;
================================================================================
CM$VER      2.13.00     27/08/1999
--------------------------------------------------------------------------------
- Cadastro de Alteradores
  Inclusão da indicação da subconta para os alteradores
- Parâmetros do Sistema
  Criação de parâmetro para indicar da obrigatoriedade da Forma de Pagamento
  no momento do lançamento do mesmo.
- Contas Caixas X Formas de Pagamento
  Inclusão da indicação da subconta, atividade e projeto
- Contas Bancárias x Caixas
  Inclusão da indicação da subconta, atividade e projeto
- Relatório 'Ficha para pagamento'  
  > valor lancto OM exibido pois exibia o valor do lançamento;
  > valor exibido para o histórico do lançamento contábil;
  > satatus do lançamento com a contabilidade;
  > exibir na contabilização o plnplanil( nº da planilha );
  > Exibir o valor líquido do documento no fim da contabilização;
  > Exibir a forma de pagamento ou tipo de cobrança associada no lcto do doc
- Alteração de Vencimento
  Alteração na mensagem de confirmação da operação
- Cadastro de Impostos Com Tabela de Retenção
  Inclusão dos campos: Percentual da Base na tabela de retenção e momento de lançamento
  do imposto;
  Inclusão dos campos valor a abater por dependente
  Alteração do default do campo Percentual da Base para 100%
- Importação de Lançamentos
  Alteração no sistema de origem dos lançamentos importados
- Lançamento de Documento
  Verificação da origatoriedade do cálculo do imposto para o tipo de desembolso
  associado no rateio
  Verificação da obrigatoriedade da indicação da forma de pagamento
  de acordo com parâmetro setado na tela do sistema
- Relatório de Maiores Fornecedores
  Só listava o ralátório no contas a receber se o fornecedor fosse também um
  cliente
- Pagamento Manual
  Alteração na mensagem de alerta para a indicação de forma do
  contas caixas x formas de pagamento ou
  cotas caixas x tipo de cobrança
- Relatório de Recolhimento de Encargos
  Implementação do relatório;
================================================================================
CM$VER      2.12.05     17/08/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
   Correcão Na alteração de um documento para englobado/parcelado na gravação da
   OPERACAO;
- Regularização de Adiantamentos\Previsão
   Correção do valor da PREVISÃO na tela de regularização pois estava aparecendo
   com sinal ao contrário;
- Alteração de Agrupa\Parcela
  Correção Na gravação da operação para parcela de PREVISÃO
  Correção na gravação da data de vencimento, data programada e de lançamento;
- Lançamento de Agrupa\Parcela
  Correção Na gravação da operação para parcela de PREVISÃO
  Correção na gravação da data de vencimento, data programada e de lançamento;
================================================================================
CM$VER      2.12.04     11/08/1999
--------------------------------------------------------------------------------
- Relatório de Documentos Por Data Programamada (i)
  Alteração na consulta pois exibia documentos com saldo zero;
- Lançamento de documentos (i)
  Exclusão do rateio administrativo;
- Consulta de Documentos
  Inclusão do Nº da Planilha na Grade de Contabilizações;
  Alteração na consulta de contabilizações pois não exibia a contabilização dos
  Documentos a parcelar;
  Alteração no seleciona documentos pois trazia documentos duplicados;
- Lançamentos de Alteradores
  Correção na exclusão de alteradores lançados com opção de não contabilizar;
================================================================================
CM$VER      2.12.03     10/08/1999
--------------------------------------------------------------------------------
- Alterações Gerais nas funções de lançamentos contábeis (I)
================================================================================
CM$VER      2.12.02     06/08/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na gravação dos dados contábeis para a baixa de documentos qdo os mesmo
  for alterado
-  Implementação da pesquisa do documento a ser baixado, possibilitando a seleção
    por Número do Documento, Complemento, Data Programada, Datavencimento, Valor e Razao Social
-  Correção na seleção dos lotes a serem pagos garantindo a listagem apenas de
   lotes relacionados com cheques;
================================================================================
CM$VER      2.12.01     05/08/1999
--------------------------------------------------------------------------------
- Regularização de Adiantamento \ Previsão
  Alteração no cálculo do saldo do documento para previsões e adiantamentos;
- Consulta Documento
  > Não exibir previsões para consulta;
  > Alteração na descrição da Situação dos Documentos Consultados
- Consulta Fornecedores
  Alteração na descrição da Situação dos Documentos Consultados
- Lançamento de Adiantamentos
  Não calcular impostos retidos para adiantamentos
================================================================================
CM$VER      2.12.00     04/08/1999
--------------------------------------------------------------------------------
- Contas Caixas x Formas de Pagamento
  Inclusão de campo para indicação da descrição do lançamento no financeiro;
- Relatório Ficha Financeira Para Pagamento
  Alteração na listagem da contabilização das baixas
================================================================================
CM$VER      2.11.04     04/08/1999
--------------------------------------------------------------------------------
- Contas Caixas x Formas de Pagamento
  Inclusão de campo para indicação da descrição do lançamento no financeiro;
- Relatório Ficha Financeira Para Pagamento
  Implementação
- Consulta de Documentos
  Alteração na seleção de documentos separando documentos a pagar a a receber;
  Alteração na contabilização da baixa e dos documentos parcelados;
- Lançamento de Alteradores
  Correção na Exclusão de alterador lançados junto com documentos com a opção de
  não integrar com a contabilidade
- Lançamento de Documentos
  Inclusão da data do vencimento no histórico do lançamento contábil;
  Teste do relacionamento do Centro de Custo com a Conta Contábil para os lançamentos
  contábeis;
- Parâmetro do Relatório Ficha Financeira Para Pagamento
  Implementação da tela
================================================================================
CM$VER      2.11.03     02/08/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na contabilização do crédito pois sempre pegava a conta do fornecedor caso
  a conta contábil do tipo de desembolso estivesse vazia;
================================================================================
CM$VER      2.11.02     02/08/1999
--------------------------------------------------------------------------------
- Cadastro de Impostos com tabelas de retenção
  Implementação do Cadastro de Impostos agregados com tabela de retenção para o contas a pagar e
  receber;
- Emissão de Cheques
  Alteração na ordenação do combo forma de pagamento
- Lançamento de Alteradores
  Alteração na alteração e exclusão de alteradores para efetuar alteração e exclusão
  nos impostos retidos
- Lançamento de Documentos
  * Alteração na inclusão, alteração e exclusão de documentos para efetuar inclusão,
     alteração e exclusão de impostos retidos associados ao fornecedor\cliente
  * Controle da opção de estorno somente qdo há documentos selecionados
  * Alteração no conferência do Dv da linha digitável do nº da ficha de compensação
  * Repetição da data programada na data do vencimento qdo a anterior for alterada
- Emissão de Borderô
 * Oredenação do Combo Box da forma de pagamento
 * Alteração no Layout dos Relatórios informando a data da emissão juntamente com
   o título do relatório, correção no alinhamento do valor a pagar e dos dados
   bancários
- Pagamento Manual
  Alteração na ordenação do combo forma de pagamento
================================================================================
CM$VER      2.11.01     27/07/1999
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Correção na seleção da conta contábil para a baixa do documento pois
  sempre buscava a conta do fornecedor/cliente, qdo deveria dar prioridade
  a conta do Tipo de Desembolso/recebimento
- Relatório de Lotes Emitidos
  Correção no filtro de emissão do lote pos se um lote emitido era cancelado e
  regerado, o mesmo estava saindo no relatório mesmo sem ter sido emitido novamente;
  Inclusão da coluna indicando o Contas Caixas X Forma de Pagamento ao invés do nome do banco;
  Inclusão do filtro por data programada;
================================================================================
CM$VER      2.11.00     22/07/1999
--------------------------------------------------------------------------------
- Ramo de Fornecedor x Tipos De Desembolso
  Implementação da tela onde são relacionados os ramos de fornecedor X
  Tipos de desembolso;
- Lançamento de Documentos
  Implementação da seleção dos tipos de desembolso associados ao ramo de
  fornecedor, caso o mesmo não tenha nenhum tipo de desembolso associado
  no cadastro
- Autorização de Pagamentos
  Implementação do estorno de documentos para listagem dos doc's cancelados
  em uma ap emitida.
  A opção de estorno foi liberado no lançamento de documentos e na Exclusão da Baixa
================================================================================
CM$VER      2.10.15     20/07/1999
--------------------------------------------------------------------------------
- Relatórios
  > Grupo Gerenciais - Posição de Fornecedores X Centro de Responsabilidade
     Lista os documentos baixados em determinado período e os documentos em 
     aberto a partir da data inicial agrupado por Fornecedor e fornecendo uma 
     posição analítica por Centro de Responsabilidade;
  > Grupo Gerenciais - Baixas X Centro de Responsabilidade X Tipo de Desembolso
     Lista as baixas  para documentos em determinado período, agrupando por Centro 
     de responsabilidade, Tipo de desembolso.
     Permitindo grupo por razão social e listagem analítica dos documentos relacionados
     ao movimento solicitado.
================================================================================
CM$VER      2.10.14     16/07/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Alteração no teste de Obrigatoriedade da Subconta pois exibia mesnagem mesmo
  se a conta não obrigrasse.
- Parâmetros do Sistema
  Implementação de parâmetro para indicação da emissão de cheque para documentos lançados como
  Lança e Baixa simultânea;
- Lançamento de Documentos, Geração de Lotes, Cancelamento de Lote,
  Pagamento Automático, Emissão de Borderô, Emissão de Cheque, Pagamento Eletrônico
  Alterações diversas para emissão, baixa e cancelamento de cheque\borderôs para pagamento de
  Lança e baixa simultânea;
- Lançamento de Documentos
  Indicação da subconta na orelha 'Geral' em Subconta do Fornecedor caso o Fornecedor
  tenha subconta cadastrada;
  
================================================================================
CM$VER      2.10.13     15/07/1999
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Inclusão de parâmetro para indicar a operação com o lançamento financeiro
  no momento do cancelamento do cheque: Indica se o lançamento será estornado
  ou excluído do financeiro.
- Lançamento de Documentos\Alteradores
  A contabilização dos lançamentos da alteração de documentos\alteradores 
  passaram a constar na  mesma planilha gerada na inclusão dos documentos\alteradores
================================================================================
CM$VER      2.10.12     14/07/1999
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Alteração na visualização do modelo de impressora selecionada: Passou a exibir o
  Nome da Impressora + O Nº de colunas;
- Borderô Débito em Conta e Ordem de Pagamento
  Alteração no cálculo dos acréscimos\decréscimos do documento e no tratamento de
  adiantamentos pois duplicava a informação para adiantamentos ja baixados;
- Lançamento de documentos
  > Bloqueio do lançamento em Atividade\Projeto e Centro de Responsabilidade Sintéticos;
  > Teste de indicação na orelha 'Geral' da subconta para para o lançamento caso a conta do
     Fornecedor obrigue a mesma;
- Lançamento de Alteradores
  > Bloqueio do lançamento em Atividade\Projeto e Centro de Responsabilidade Sintéticos;
  > Teste de indicação na orelha 'Geral' da subconta para para o lançamento caso a conta do
     Fornecedor obrigue a mesma;
 
================================================================================
CM$VER      2.10.11     13/07/1999
--------------------------------------------------------------------------------
- Pagamento Automático
  Alteração na busca do diretório para o arquivo de remessa qdo mais de um
  lote é enviado para o mesmo modelo de arquivo.
- Lançamento de Documentos
  Alteração no arredondamento do cálculo do rateio administrativo
================================================================================
CM$VER      2.10.10     13/07/1999
--------------------------------------------------------------------------------
- Contabilização de Baixas
  Correção na montagem do histórico da Baixa pois não estava montando o número
  do Cheque\Borderô no lançamento contábil;
================================================================================
CM$VER      2.10.09     12/07/1999
--------------------------------------------------------------------------------
- Importação de lançamentos
  Alteração no histórico do lançamento contábil que passou a incluir, além do nº do
  documento e do nome do fornecedore o histórico complementar;
- Lançamento de Documentos
  Inclusão dos dados da conta bancária do Fornecedor na orelha geral;
    
================================================================================
CM$VER      2.10.08     09/07/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  > Implementação de Rateio Automático por atividade\projeto.
     Este rateio é cadastrado na contabilidade e para ser ultilizado deve estar amarrado
     a uma conta contábil.
  > Proibido o lançamento em atividade\projeto e centro de responsabilidade sintético. 
 
================================================================================
CM$VER      2.10.07     08/07/1999
--------------------------------------------------------------------------------
- Etiquetas: Configuração e Impressão
   Implementação da opção Relatórios\Etiquetas\Configuração e  Relatórios\Etiquetas\Impressão onde é
   possível configurar qualquer modelo de etiqueta tanto para impressão matricial qdo para impressão
   com Jato de Tinta e Lazer, além de possibilitar a impressão de etiquetas para qualquer tipo de Pessoa.
  
================================================================================
CM$VER      2.10.06     06/07/1999
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Correção no Rateio Contábil do Crédito no lançamento dos documentos da importação;
  Criação de campo para definição de histórico para o lançamento contábil.
- Pagamento Eletrônico
  Correção na selecão dos lotes para pagamento eletrônico;
================================================================================
CM$VER      2.10.05     05/07/1999
--------------------------------------------------------------------------------
- Relatório de Autorização de Pagamentos
  Correção na impressão da contabilização do lançamento dos documentos impressos
  pois só imprimia a contabilizaçào do lançamento de documentos parcelados
- Alteração na exclusão dos pagamentos pois não desvinculava o documento da Guia de Recebimento;
- Alteração na emissão de arquivo eletrônio no teste dos dados bancários;
================================================================================
CM$VER      2.10.04     01/07/1999
--------------------------------------------------------------------------------
- Parâmetros do Sistema de Contas a Pagar e Receber
  Inclusão de Parâmetro para indicação da Marca e do Modelo da Impressora
  ultilizada para Cheques;
- Criação de Lote:
  * Alteração no processo de criação de lotes pois ao gerar um lote forçava uma nova
  seleção de documentos.
  * Alteração na Largura do Combo Box Contas Caixas X Formas de Pagamento;
  * Inclusão da opção de Seleção de Documento por Contas Caixas X Formas de Pagamento;
- Lançamento de Documentos
  Alteração na Largura do Combo Box Contas Caixas X Formas de Pagamento;
- Correção na paginação e configuração da Impressão de Cheques;
================================================================================
CM$VER      2.10.03     25/06/1999
--------------------------------------------------------------------------------
- Pendência #1364
  Permitir no parcelamento de documentos a alteração manual das datas e só recalcular quando solicitado;
- Pendência #1365
   Informar a data da baixa do documento na consulta de documentos;
- Pendência #1367
  Correção dos relatórios que exibem valores pagos, pois uma lançamento de documento com a
  Opção lança e baixa não era exibido corretamente;
- Pendência #1369
  Qdo um cheque for cancelado no contas a pagar, o mesmo passou a ser extornado do financeiro,
  antes era excluído.
- Importação de Lançentos
  Implementação da Indicação do Status da Importação de Lançamentos, indicando também
  o total de registros a serem importados e o registro corrente da importação;
- Parâmetros do Sistema
   Inclusão de Parâmetro para indicação do Número de Dias Para Vencimento de Documento, 
  usado para autorizar a data de Vencimento dos documentos lançados;
- Lançamento de Documento
  > Correção da alteração do rateio pois indicava um valor que não correspondia ao valor
     exibo na Grade qdo solicitado para alteração.
  > Alterações na validação da Dotação Orçamentária associada ao rateio do documento;
  > Posicionamento do Cursor no Campo para indicação do fornecedore no momento da Inserção.
  > Ordenação do combo box PORTADORFORMA;
  > Não permitir inclusão de documentos com número 0;
  > Correção da inclusão de registro em branco na Grade do Rateio.
- Relatórios
  > Conta Corrente de Fornecedor: Não exibia corretamente os valores de Débito e Crédito referentes
   a um lançamento do tipo 'lança e Baixa simultânea'
  > Diário Auxiliar: Não exibia corretamente os valores de Débito e Crédito referentes
   a um lançamento do tipo 'lança e Baixa simultânea'
- Agrupamento de Documetos
  Caso seja alterada a data de vencimento, a data programada passa a receber o mesmo valor;
- Relatórios de Autorização de Pagamentos
  Inclusão do campo "Data para Pagamento" 
================================================================================
CM$VER      2.10.02     22/06/1999
--------------------------------------------------------------------------------
- Criação de coluna no arquivo de importação na posição 165 com 8 posições
  onde é indicado o código da forma de pagamento para o lançamento do documento
   O Arquivo Ficou 172 Colunas.
================================================================================
CM$VER      2.10.01     21/06/1999
--------------------------------------------------------------------------------
- Pendência #1120
  Lançamento de Documentos - Registra
  Permitir Indicação da Forma de Pagamento no Momento do Lançamento Do Documento
  Gera Lote Para Pagamento
  Permitir Filtrar Documentos Lançados com a Forma de Pagamento associada no
  Contas Caixas X Formas de Pagamento selecionado para a criação do Lote
- Pendência #1275
  Lançamento de Documentos - Registra
  Permitir Indicação do Número da Ficha de Compensação no momento do Lançamento do Documento
- Pendência #1309
  Alteração do Relatório Lotes Emitidos Incluindo a Coluna Data Programada
- Pendência #22
  Criação do Campo Para Indicação da Dotação Orçamentária no momento do Lançamento do Documento
================================================================================
CM$VER      2.10.00     18/06/1999
--------------------------------------------------------------------------------
- Regularição de Adiantamentos
  Permitir Regularizar Valores Maiores que o saldo do documento, caracterizando uma Devolução
- Baixa Manual
  Implementação da Sugestão automática do nº do cheque bordero/Loterecebimento
- Relatório de Lotes Emitidos
  Inclusão da Coluna Indicando a Data Programada
- Relatório de Cópia de Cheque
  Inclusão de 4 Assinaturas no rodapé das página
- Parâmetos do Sistema
  Inclusão da Configuração das Assinaturas do Relatório de Cópia de Cheque
- Relatório de Aprovação de Documentos
  Alteração na tela de parâmetros, implemtando reimpressão das Ap's Já emitidas podendo
  ser procuradas por Data de Recebimento, Nº da Ap, Nº do Lote, Nº do Documento 
  Contido na AP.
================================================================================
CM$VER      2.09.04     16/06/1999
--------------------------------------------------------------------------------
- Pendência #22 
  Incluso no Lançamento de Documentos o Campo Para Indicação de Dotação Orçamentária no Rateio do Documento
- Lançamento de Documentos
  Alteração na Contabilização de Alteradores Para Documentos Lançados com  a opção de não contabilizar;
================================================================================
CM$VER      2.09.03     15/06/1999
--------------------------------------------------------------------------------
- Correção no Alterar do Lançamento de Documentos Pois não Habilitava o Combo Box de
  Tipo de Desembolso\Recebimento
- Alteração na Gravação das Assinaturas dos Relatórios na Tela de Parâmetros do Sistema.
================================================================================
CM$VER      2.09.02     15/06/1999
--------------------------------------------------------------------------------
- Alterações Diversas na Rotina de Importação de Lançamentos
================================================================================
CM$VER      2.09.01     14/06/1999
--------------------------------------------------------------------------------
- Pendência 1338 - Alterações no Relatório Autorização de Pagamentos:
  Correção na Contabilização do Parcelado
================================================================================
CM$VER      2.09.00     10/06/1999
--------------------------------------------------------------------------------
- Alteração na Tela de Parâmetros Do Contas a Pagar e Receber 
- Implementação da Configuração de Assinaturas e Vistos de Relatórios no Contas a Pagar e Receber;
- Implementação de Assinaturas\Vistos Para os Seguintes Relatórios 
  > Borderô Tipo Ordem de Pagamento;
  > Borderô Tipo Débito Em Conta;
  > SLIP;
  > Aprovação de Documentos;
  > Autorização de Pagamentos;
- Correção do Parcelamento De Documentos após o lançamento do Mesmo,
  pois não achava o Fornecedor Indicado no Documento
- Pendência 1338 - Alterações no Relatório Guia de Recebimento:
  Inclusão da Agência Bancária e Nº da Conta Corrente de Débito;
  Lista Apenas Documentos Baixados;
  Personalização de Assinaturas;
================================================================================
CM$VER      2.08.16     10/06/1999
--------------------------------------------------------------------------------
- Correção do erro 'Invalid Field Name' no Lançamento de Documentos
================================================================================
CM$VER      2.08.15     09/06/1999
--------------------------------------------------------------------------------
- Pendência Nº 1348
  Criado opção na Altorização para impedir o lançamento de documentos com a data de
  lançamento igual a data progranada;
- Pendência Nº 1350
  Inclusão na Consulta  Fornecedores dos Documentos Recebidos No Período;
================================================================================
CM$VER      2.08.14     08/06/1999
--------------------------------------------------------------------------------
- Correção do 'Acces Violation' ao entrar pela segunda vez no Lançamento de Documentos;
- Correção do Posicionamento do Cursor ao entrar pela segunda vez na Inclusão do Lançamento de Documentos;
- Ordenação do Ramo de Fornecedor no Cadastro de Fornecedor;
- Correção do 'Falta Expressão' ao Incluir Fornecedor;
================================================================================
CM$VER      2.08.13     07/06/1999
--------------------------------------------------------------------------------
- Alguns forms não estavam chamando corretamente o evento OnActivate
================================================================================
CM$VER      2.08.12     04/06/1999
--------------------------------------------------------------------------------
- Implementação da Impressão de Cheque usando máquina de cheque Chronos ACC 300 e ACC 100
- Lançamento de Documentos Alteração no Sistema de Origem pois não limpava o último exibido
- Cadastro de Fornecedores Na Caixa de Edição do Nome do Banco pois não limpava o último exibido
- Alterção nos Indicadores das contas do cadastro de tipo de desembolso
================================================================================
CM$VER      2.08.11     02/06/1999
--------------------------------------------------------------------------------
* Cadastro de Contas Caixas X Tipos de Desembolso\Recebimento
  Correção da mensagems '' Is Not a valid Integer Value;
*  Criação de coluna no Layout do Arquivo de Importação de Lançamentos na posição 164 
    onde é indicado a será  feito ou não o lançamento na contabilidade.
* Otimização das Telas com a alteração na Procura de Cliente\Fornecedor
   Agrupa Documento;
   Altera Agrupa Documento;
   Parâmetros do Relatório Posição Por Fornecedores/Clientes;
   Parâmetros do Relatório Valores Pagos/Recebidos;
   Parâmetros do Relatório Alteradores Lançados;
   Parâmetros do Relatório Lançamento de Documentos;
   Parâmetros do Relatório Carta de Cobrança;
   Parâmetros do Relatório Emissão de Etiquetas;
   Parâmetros do Relatório Conta Corrente de Fornecedore/Cliente;
   Parâmetros do Relatório Lançamento de Adiantamentos;
   Pagamento Manual;
   Consulta de Fornecedores;
   Lançamento de Documentos;
================================================================================
CM$VER      2.08.10     02/06/1999
--------------------------------------------------------------------------------
* Lançamento de Documentos\Registra
  > Correção do erro de constraint ao lançar o documento como agrupa parcela;
  > Correção da alteração de documento pois não permitia realizar a operação qdo o documento possuía outros lançamentos;
* Cadastro de Tipos de Desembolso\Recebimento
  > Não atualizava os indicadores de Analítico\Sintético ao movimentar pela árvore do cadastro.
================================================================================
CM$VER      2.08.09     28/05/1999
--------------------------------------------------------------------------------
* Correção na exclusão dos Documentos \ Alteradores pois não excluía corretamente da
   contabilidade, só estornava;
* Verificação da existencia de lançamentos para validar e alteração ou exclusão
================================================================================
CM$VER      2.08.08     28/05/1999
--------------------------------------------------------------------------------
* Implementação da Identificação do Tipo da Conta Bancária do Fornecedor no Cadastro de Fornecedores
* Alteração do Comprimento da Descrição no cadastro de contas caixas x tipos de desembolso\recebimento
* Correção da Alteração de Saldo Na Baixa Manual;
* Correção do Lançamento de Alteradores pois não cancelava a transação aberta;
* Correção do Relatório Posição Por Fornecedores pois duplicava o último registro na última folha;
* Correção do Valor Da Orelha da Contabilização no lançamento de Documentos Pois trazia o valor do lançamento anterior;
* Correção na Comparação do Saldo Do Documento Com o valor da regularização do Adiantamento\Previsão
================================================================================
CM$VER      2.08.07     25/05/1999
--------------------------------------------------------------------------------
* Ordenação dos Tipos de Desembolso no Cadastro de Fornecedores
* Lançamento de Documentos: Correção da Contabilização Do Lança e Baixa
================================================================================
CM$VER      2.08.06     24/05/1999
--------------------------------------------------------------------------------
* Cadastro de Agência
   > Correção do Procurar, mensagem: 'Nome de Colunaz Inválido';
   > Correção da Mensagem Cannot Focus a Disable or Invisible Window ao confirmar a operação.
* Cadastro de Contas
   >Implementação da Validação do Número da Conta Corrente para os bancos
    Real;
    Brasil;
    Banespa;
    Bradesco;
    Meridional;
    Caixa Econômica;
    Itaú;
    Bamerindus;
    Unibanco;
* Cadastro de Fornecedor
   > Implementação da Validação do Número da Conta Corrente para os bancos
    Real;
    Brasil;
    Banespa;
    Bradesco;
    Meridional;
    Caixa Econômica;
    Itaú;
    Bamerindus;
    Unibanco;
  >Estava obrigando o cadastro das contas contábeis de adiantamento e Débito; 
  > Correção do 'Access Violation' ao acionar o botão sair;
* Remessa Eletrônica
   > Implementação da Validação do Número da Conta Corrente para os bancos
      em Modelos que obrigam dados bancários
    Real;
    Brasil;
    Banespa;
    Bradesco;
    Meridional;
    Caixa Econômica;
    Itaú;
    Bamerindus;
    Unibanco;
* Correção do Erro Ao Excluir Tipo de Desembolso\Recebimento:  'Can not perform this operation on a closed dataset';
* Correção do Erro ao excluir Fornecedores: 'Update Fail'
================================================================================
CM$VER      2.08.05     19/05/1999
--------------------------------------------------------------------------------
* Cadastro de Tipo de Desembolso\Recebimento
   Alteração dos Captions e Mensagens das Contas Contábeis.
* Portador Forma
   Estava testando indevidamento o número da empresa no banco para o contas a pagar 
* Cadastro de Cliente\Fornecedor
  A Orelha Geral Não estava sendo habilitada para inclusões contínuas;
  O Tipo de Cliente estava exibindo o nome;
* Cadastro de Contas
  Correção do falta expressão no retorno da consulta
* Relatório Posição Por Clientes\Fornecedore
  Não estavam sendo impressos o Número/Complemento do Documento no relatório
* Carta de Cobrança
  Acerto da Duplicidade dos registros da carta de cobrança para os Clientes que
  possuem mais de um endereço
* Ãcerto Na Alteração do Lançamento quando trocava de parcelado para não parcelado e
  vice-versa
* Acerto da Contabilização da Baixa;
================================================================================
CM$VER      2.08.04     17/05/1999
--------------------------------------------------------------------------------
* Pendência 1123
   Foi alterada a contabilização dos lançamentos e baixas no contas a pagar, passando a ser
   efetuado o rateio contábil pela unidade de custeio, ou seja, em função do rateio do documento.
   Foram alteradas as seguintes telas:
   > Pagamento Manual;
   > Lançamento de Documento;
   > Baixa Eletrônica;
   > Altera Saldo em Pagamento Manual;
   > Lançamento de Alteradores;
   > Agrupa Documento;
   > Agrupa Parcela Documento;
   > Pagamento Automático;
* Foram Otimizadas todas as Telas que usam o plano de contas. A arvore com o plano de contas
   foi substituída por um controle que possibilita pesquisa por diversos campos das contas contábeis
   além de digitação direta da conta.
   Foram Alteradas as Seguintes telas:
   > Cadastro de Contas;
   > Cadastro de Alteradores;
   > Cadastro de Tipo de Desembolso;
   > Cadastro de Contas Caixas X Formas de Pagamento;
   > Cadastro de Fornecedores;
   > Lançamento de Documentos;
* Pendência 890 
  Documentos X Mensagens para remessa eletronica - Erros de Português
* Pendência 870
  Incluir no combo do tipo de desembolso/recebimento a descrição do tipo sintético também. Sugestão 43 da marquise. 
* Pendência 1131
  Fazer com que nos combos referentes a atividade/projeto, centro de responsabilidade, tipo de desembolso e tipo de recebimento apareçam as descrições em ordem alfabéticas, porém, mostrando após as analíticas, todas as sintéticas correspondentes.
* Pendência 1215
   Ao lançar um doc, marcando p/ parcelar, quando consultamos o relat. de docs lançados o sistema mostra o doc e suas parcelas, totalizando errado.
* Cadastro Conta Bancária / Caixa, ao Procurar, mensagem: "Falta Expressão".
* Dentro de Utilitários, as opções: Simulação de cálculos, Cálculo de variação monetária e Exclusão de Movimentos não funcionam... Favor desabilitá-las.
================================================================================
CM$VER      2.08.02     07/05/1999
--------------------------------------------------------------------------------
* Implementação da Impressão para teste da Configuração do Cheque
* Alterações Gerais em todas as Telas do Menu Cadastro e Lançamentos para copatibilizar com o DB2.
* Alterações Gerais na Telas de Regularização de Adiantamento para copatibilizar com o DB2.
================================================================================
CM$VER      2.08.01     03/05/1999
--------------------------------------------------------------------------------
* Otimização da Tela Contas Caixas X Formas de Pagamento
* Alteração Gerais na Tela de Configuração de Cheque
* Correção no Procurar e Otimização da Tela de Cadastro de Contas Caixas
================================================================================
CM$VER      2.08.00     30/04/1999
--------------------------------------------------------------------------------
* Alterações no Banco de Dados nas tabelas de controle dos Arquivos de Integração Bancária
* Correção do 'Can not focus a disable or invisible window' no Cadstro de Fornecedores;
* Preenchimento das Tabelas com Modelos de Arquivos Int. Banco Disponíveis Para o Sistema e
   Dos Códigos de Retorno dos Respectivos Modelos.
* Correção de Campos para Integração Com a Contabilidade
* Correção do Falta expressão na abertura do form de Cancelamento de Lote
* Alteração na tela de Pagamento manual pois não permitia colocar o número do cheque\borderô
* Correção na alteração do Documento em Lançamento de Documento\Alteradores\Previsões pois mudava
  a operação do lançamemto do documento
================================================================================
CM$VER      2.07.04     29/04/1999
--------------------------------------------------------------------------------
* Lançamento de Documentos, Previsão e Adiantamentos;
   - Alterção na Seleção de Centro de Custro, passando exibir somente os centros de custo da empresa logada.
   - Correção do 'Acces Violation' na Alteração do Lançamento
================================================================================
CM$VER      2.07.03     22/04/1999
--------------------------------------------------------------------------------
Exclui Pagamentos \ Recebimentos
Alteração na seleção dos documentos pagos para filtrar pela data do
pagamento/recebimento, antes filtrava pela data do lancamento do documento.
Relatório de Cópia de Cheque
Implementação de tela para permitir seleção dos cheque para emissão da cópia de cheque
Correção na impressão de cheques com documentos com saldo alterado: duplicava o relatório.
Relatório de Borderô
Ordenação dos Borderôs por RAZÃO SOCIAL,DATA VENCIMENTO, NÚMERO DO DOCUMENTO,
COMPLEMENTO DO DOCUMENTO e Inclusão de Campos para visto no rodapé de cada
página impressa.
Lançamento de Documentos
Alteração no procurar  pois se um documento era estornado ele exibia dois registros  iguais: um do lançamento e outro do estorno.
Emissão de Borderô
Permitir Reimpressão de Borderôs através da alteração do 'Status Emissão';
Alteração no Desenho do Relatório pois sobrescrevia a Razão Social Com o Número
do Documento
================================================================================
CM$VER      2.07.02     12/04/1999
--------------------------------------------------------------------------------
Relatório de Emissão de Borderô
 Mesmo confirmada a emissão e efetuados o lançamento no financeiro, ele lançava novamente
 se fosse reimprimido, passando a ser lançado só qdo confirmada a primeira impressão.
Relatório de Emissão de Cópia de Cheque
 Implementação da tela para permitir seleção dos cheque para emissão da cópia de cheque
Exclusão de Pagamentos
 Alteração na seleção dos documentos pagos para filtrar pela data do pagamento/recebimento,
 antes filtrava pela data do lancamento do documento.
Lançamento de Documentos
   Alteração no procurar  pois se um documento era estornado ele exibia dois registros
   iguais: um do lançamento e outro do estorno.
Baixa Automática de Títulos
 Correção na no lançamento do Financeiro na Baixa dos Título para lançar sempre
 como entrada no contas a receber e saída no contas a pagar;
Lançamento de Alteradores, Correção de Saldo
  Verificação automática e baixa caso o documento tenha o saldo zerado com o lançamento de um alterador.
Relatório Aprovação de Documentos
  O Valor Total do Lote Passou a ser impresso no canto direito da linha.
Regulariza Adiantamentos
  Não estava permitindo Alterar o Valor a regularizar, não podendo fazer a regularização para mais de uma nota.
================================================================================
CM$VER      2.07.01     06/04/1999
--------------------------------------------------------------------------------
 Relatório de Aprovação de Documentos passou a:
           Listar apenas os Cheques Emitidos;
           Listar os Cheques individualmente;
           Listar os documentos agrupados por número do cheque, exibindo a conta  e o número do banco;
           Exibir dados Oredenados pela Data de Emissão, Nº do Cheque,  Razão Social e  Nº Documento;
           Exibir o Cabeçalho com os dados do fornecedor e do documento no cabeçalho do lote;
           Exibir o valor total dos Documento contidos no Lote ;
Agrupa Parcela e Altera Agrupa Parcela:
           As parcelas estavão sendo lançadas com a contabilização errada, contabilizando o
           debito/credito na conta de Despesa/Receita, passando a contabilizar na conta do Fornecedor/Cliente
Lançamento de Documentos:
           Alteração na comparação das datas de vencimento,emissão,Programada e Lançamento pois comparava Data/Hora,
           e as vezes a comparação era falsa
Relatório de Documentos por data programada:
          Inclusão dos adiantamentos no relatório.
          Alteração no nome do fornecedor - Passou a exibir a razão social.
Relatório de Lançamento de documentos:
          Correção na coluna de alteradores com relação ao cálculo do valor do alterador
          verificando se é um acréscimo ou decréscimo no valor do documento.
Relatório de Valores Pagos\Recebidos:
          Inclusão dos adiantamentos no relatório.
Regularização de Adiantamentos
          Implementação de Tela para Regularização de Adiantamentos fora do lançamento do
          Documento. Ultilizada principalmente para regularizar adiantamentos vindo de outros
          sistermas. Opção Tesouraria\Regularização de Adiantamentos
================================================================================
CM$VER      2.07.00     30/03/1999
--------------------------------------------------------------------------------
LANCAMENTO DE DOCUMENTO\ ADIANTAMENTO\ PREVISÃO
  Otimização das consultas do Lançamento de Documento
LANCAMENTO DE ADIANTAMENTO
  Possibilitar lança e baixa simultânea para adianamentos
REGULARIZAÇÃO DE ADIANTAMENTO PREVISAO
  Reagularização de adiantamentos/previsão formatar a apresentação do valor,
impedir
  inclusão no grid e possibilitar a marcação do documento com duplo click;
CADASTRO DE CLIENTE\FORNECEDOR
    Verificação da obrigatoriedade e inclusão da SubConta para a conta contábil
do Cliente\Fornecedir
LANÇAMENTO DE DOCUMENTOS
    Gravação da Subconta, caso exista para a conta contábil do cliente,
    no Lançamento\Alteração do Documento
================================================================================
CM$VER      2.06.02     23/03/1999
--------------------------------------------------------------------------------
CADASTRO DE CÓDIGOS BANCÁRIOS PARA COBRANÇA
   Correção do ERRO NA ATUALIZAÇÃO DE DADOS para a alteração e exclusão;
   Alteração dos nomes das colunas na Tabela da Tela;
================================================================================
CM$VER      2.06.01     23/03/1999
--------------------------------------------------------------------------------
RELATÓRIOS
    Implementação dos relatórios Aprovação de Documentos, Guia de Recebimentos;
LANÇAMENTO DE DOCUMENTOS
    Desabilitar e limpar o Nº do Cheque Borderô ao desmarcar a opção de Lança e
    Baixa simultânea;
    Possibilidade de parcelar o documento após a inclusão do mesmo;
RELATÓRIOS
   Alteração no Layout do SLIP Incluindo campos para Autorizações;
   Alteração na Aprovação de documentos para pegar o Portador Forma do Lote e
   Não do Documento
================================================================================
CM$VER      2.06.00     18/03/1999
--------------------------------------------------------------------------------
PAGAMENTO MANUAL
 Alteração do arredondamento do total dos documentos pagos;
 Limpar o total dos documentos pagos ao fim da operação;
CADASTRO DE TIPO DE DESEMBOLSO
 Otmização da procura de contas contábeis
CÓPIA DE CHEQUE
   Correção do Erro Com relação ao campo Favorecido;
CADASTRO DE FORNECEDOR\CLIENTE
   Correção da Ordem de tabulação da Orelha Geral Para as Contas Contábeis
CONSULTA DOCUMENTOS
   Correção do Erro Com relação ao campo Favorecido;
EMISSÃO DE BORDERO
    Habilitar a data para alteração;
GERA LOTE PAGTO
    Mostrar a Forma de Pagamento mesmo para aquelas não associadas a contas
    bancárias;
    Melhoria da performance na procura dos documentos;
================================================================================
CM$VER      2.05.10     16/03/1999
--------------------------------------------------------------------------------
RELATÓRIO POSIÇÃO DOS SALDOS
 Alteraçãs no Posição dos Saldos Pois mesmo informando a data limite sempre
 considerava para cálculo a data do dia;
CONSULTA DOCUMENTO
 Alterações no Seleciona Documento;
 Alterações no Layout;
 Implementação das Opções de 'Emissões' e 'Parcelas';
RELATÓRIO PAGAMENTOS EFETUADOS POR TIPO DE DESEMBOLSO
 Alteração na performance do relatório, acréscimo de totalizador dos recebimento
RELATÓRIO MAIORES FORNECEDORES\CLIENTES
 Implementação da Tela permitindo filtrar por data de lançamento do documento e
 qtde de fornecedores para análise
================================================================================
CM$VER      2.05.09     15/03/1999
--------------------------------------------------------------------------------
CRIA AGRUPA\PARCELA
 Alteração da Consulta dos Números dos Documentos Pois Duplicava os Documentos
 Parcelados e não realizava as alterações nos dados dos documentos, só das
 parcelas, pasando a Gravar Automaticamente os dados pendentes antes de
 recalcular;
 Melhoria da performance da tela;
ALTERA AGRUPA\PARCELA
  Alteração da Consulta dos Números dos Documentos Pois Duplicava os Documentos
  Parcelados e não realizava as alterações nos dados dos documentos, só das
  parcelas,pasando a Gravar Automaticamente os dados pendentes antes de
  recalcular;
  Melhoria da performance da tela;
  Caso o parcela venha de um Contrato/Previsão não estava disponibilizando para
  alteração, foi alterada a operação do documento de origem;
ALTERA VENCIMENTO
 Limpar a tela após a confirmação da operação e Mostrar mensgens de erro e
 finalização.
LANÇAMENTO DE ALTERADORES
 Esta lançando os Alteradores de acordo com o tipo do primeiro alterador
 selecionado:
 Se era a Débito Lançava todos a débito, se era a crédito, lançava todos a
 crédito;
 Estabelecimento da ordem de tabulação dos campos na tela;
 Exclusão de Documentos já parcelados/englobados da inclusão de alteradores;
LANÇAMENTO DE DOCUMENTO
   Correção do Layout da 'Orelha' alteradores;
   Gravação da alteração do engloba parcela e não permitir alteração caso o
   mesmo já tendo sido parcelado;
CRIAÇÃO DE LOTES
 Reordenar a Tabela de Documentos pendentes caso seja excluídos um ou mais
 documentos selecionados;
================================================================================
CM$VER      2.05.08     12/03/1999
--------------------------------------------------------------------------------
Relatório de Aprovação de Documentos
      Acrescentado no final de Cada Documento 'Visto do Controler', 'Aprovação
      GG', 'Recebido Por';
      Impressão do Nome do Banco em todos os Documentos ao Invés do Código;
Alteração de Lote
      Alteração no Grid dos Documentos Pendentes e do Lote para exibir em
      vermelho os Documentos Atrasados;
      Exibição dos Complementos Documentos do Clientes;
      Verificação do Cálculos dos Saldos, excluindo os Saldos Zerados
Lanc Alteradores
         Não permitir Lançar alterdores para documentos já pagos.
Exclusão de Pagamentos
         Exibir Razão Social ao Invés de Fornecedor/Cliente no título da coluna
         na tabela
Param CapCar
         Exibir o Histórico padrão para o lançamento no financeiro mesmo no
         contas a receber;
Portador Forma
         Exibir na Tabela o Modelo de Cheque/Bloqueto ou o Modelo de Remessa
         eletrônica do registro.
================================================================================
CM$ALT}




























































































































































































































































































































































































































































































































































































































































































































































































































































































































































