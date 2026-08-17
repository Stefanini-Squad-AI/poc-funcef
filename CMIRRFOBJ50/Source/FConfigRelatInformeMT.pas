Unit FConfigRelatInformeMT;  
// Alterações:
//---------------------------------------------------------------------------------------------------
// N. Chamado....: WO34233
// Dt Alteração..: 18/03/2026
// Responsável...: Paulo Nobre
// Descrição.....: PROJETO CNPJ ALFANUMÉRICO
//                 .(.dfm) - Ajustando o padrão da mascara atual do CNPJ para a
//                  alfanumérica: 'AA.AAA.AAA/AAAA-99'.
//--------------------------------------------------------------------------------------------------
//N.Chamado.....: WO31759
//Dt.Alteração..: 11/02/2026
//Responsável...: Paulo Nobre
//Descrição.....: Aumento do tamanho da combo: Descrição do Modelo  (.dfm)
//--------------------------------------------------------------------------------------------------
//*****************************************************************************************************
//Rotina.............: AtribuiCampos
//N. WO..............: 18939           
//Data da Alteração..: 13/02/2025
//Responsável........: Edilaine
//Descrição..........: Ajuste na consulta para Informe Pensao 2019
//*****************************************************************************************************
//Rotina.............: RptModeloMemo1Print
//N. SIG.............: 132465 
//Data da Alteração..: 09/02/2023
//Responsável........: Leandro Pocebon
//Descrição..........: Campo 7- Informações Complementares, muda tamanho fonte para caber todas informações.
//*****************************************************************************************************
//Rotina.............: bbtnGeraTxtClick e BtnImprimeClick
//N. SIG.............: 129805
//Data da Alteração..: 11/10/2022
//Responsável........: Edilaine
//Descrição..........: Ajuste 2a via do informe de rendimentos para layout de 2012
//*****************************************************************************************************
//Rotina.............: bbtnGeraTxtClick e BtnImprimeClick
//N. SIG.............: 122151
//Data da Alteração..: 25/01/2022
//Responsável........: Andre Imakawa
//Descrição..........: Ajuste para novo layout do comprovante 2021
//*****************************************************************************************************
//Rotina.............: bbtnGeraTxtClick, MontaLinhaRegistroTipoSeis, GeraArquivoDirf
//N. SIG.............: 85183.92415
//Data da Alteração..: 23/10/2019
//Responsável........: Taffarel/Darivaldo
//Descrição..........: Ajuste para a geração do Informe de Rendimentos no layout 2019
//*****************************************************************************************************
//Rotina.............: MontaLinhaRegistroTipoSeis
//N. SIG.............: 82520
//Data da Alteração..: 21/02/2019
//Responsável........: Darivaldo Alencar
//Descrição..........: Máscara sem contemplar valores terminados em 0
//*****************************************************************************************************
//Rotina.............: BuscaDepJudicial 
//N. SIG.............: 81993
//Data da Alteração..: 07/02/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na forma definição de valores de processos de equcionamento no campo 7.
//*****************************************************************************************************
//Rotina.............: MontaLinhaRegistroTipoSeis, BtnImprimeClick
//N. SIG.............: 74355
//Data da Alteração..: 15/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de tratamento para inclusão de processos judiciais, no campo 7, para
//                     novo leiaute do Informe de Rendimentos.
//*****************************************************************************************************
//Rotina.............: RptModeloMemo1Print, MontaLinhaRegistroTipoSeis
//N. SIG.............: 73545
//Data da Alteração..: 15/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação denovo leiaute para Residentes no Exterior
//*****************************************************************************************************
//Rotina             : MontaLinhaRegistroTipoSeis
//N. SIG..........   : 47630
//Data da Alteração: : 05/06/2017
//Responsável:       : Andre Imakawa
//Descrição          : Informações complementares, quando existir devolução do RRA, deve ser abatido.
//*****************************************************************************************************
//Rotina             : GeraInformeFuncef
//N. SIG..........   : 41085
//Data da Alteração: : 24/02/2017
//Responsável:       : Andre Imakawa
//Descrição          : Não preencher o quadro 7 com determinada informação quando origem for folha de
//                     pagamento.
//*****************************************************************************************************
//Rotina             : MontaLinhaRegistroTipoSeis
//N. SIG..........   : 37283
//Data da Alteração: : 27/01/2017
//Responsável:       : William Santana
//Descrição          : Criação de novo Layout com inclusão de informações de RRA
//*****************************************************************************************************
//Rotina             : bbtnGeraTxtClick
//N. SIG..........   : 24448
//Data da Alteração: : 20/07/2016
//Responsável:       : Andre Imakawa
//Descrição          : Informo que gerei duas vezes o TXT dos comprovantes de rendimentos e não está
//                     gerando o arquivo completo. 
//*****************************************************************************************************
//Rotina             : bbtnGeraTxtClick, MontaSqlDados
//N. SIG..........   : 19602
//Data da Alteração: : 05/05/2016
//Responsável:       : Edilaine
//Descrição          : quando não há valores para o beneficiário (soma dos totais for zero) os dados
//                     estão sendo incluidos no TXT
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral, AjustaEndereco()
//N. SIG..........   : 19537
//Data da Alteração: : 02/05/2016
//Alteração Form:    :
//Responsável:       : Darivaldo Alencar
//Descrição          : Alteração de query gerar txt pensao alimenticia, folha de
//                     beneficio, acrescentando nome do alimentante 
//*******************************************************************************
//Rotina             : BuscaInformeGeral, AjustaEndereco()
//N. SOL..........   : 269789
//N. PPM..........   : 1312365
//Data da Alteração: : 06/04/2016
//Alteração Form:    : alteração do totalizador do arquivo e da tela
//Responsável:       : William Santana
//Descrição          : Correção do totalizador
//*******************************************************************************
//Rotina             : Componente na Interface
//N. SOL..........   : 269300
//N. PPM..........   : 1293033
//Data da Alteração: : 15/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Retirada a marcação default do checkbox "Separar Pensão Alimentícia"
{*******************************************************************************
//Rotina             : bbtnGeraTxtClick
//N. SOL..........   : 268555
//N. PPM..........   : 1262100
//Data da Alteração: : 25/01/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Comentado os campos: IDPESSOA do cdsDados, sendo substituido
//                     pelo CPF para impedir a duplicação de dados no arquivo gerado
//***************************************************************************
//Rotina             : AtribuiCampos
//N. SOL..........   : 268134
//N. PPM..........   : 1250381
//Data da Alteração: : 21/01/2016
//Responsável:       : Fernando Xavier
//Descrição          : Solicitamos verificar erro na geração do informe de rendimentos
//                     do módulo impostos. Ocorreu um erro no sistema que pode
//                     deixá-lo operacionalmente instável.
//***************************************************************************
//Rotina             : MontaLinhaRegistroTipoCinco, MontaLinhaRegistroTipoQuatro
//N. SOL..........   : 268002
//N. PPM..........   : 1245182
//Data da Alteração: : 19/01/2016
//Alteração Form:    :
//Responsável:       : Fernando Xavier
//Descrição          : Inclusão de novos campos 4082, 5032, TOT408, TOT503
//Observação         : Foi incluido apenas o campo no arquivo não sendo passado os
//                     respectivos valores, pois os campos ainda não existem em produçao.
//***************************************************************************
//Rotina             : AtribuiCampos, MontaLinhaRegistroTipoTres, MontaLinhaRegistroTipoQuatro
//N. SOL..........   : 257831/18009
//N. PPM..........   : 1207646
//Data da Alteração: : 28/12/2015
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Inclusão de novos campos 4081, 5031, TOT408, TOT503
//***************************************************************************
{
Analista.: Wylliam Leite da Silva SOL 248939 PPM 997373 // Fernando Xavier
Data.....: 29/07/2015
Sol......: 248939
PPM......: 997373
Descrição: Estava acontecendo um problema de duplicidade quebrando o agrupamento
           da query que gera o txt, o problema acontecia porque está fixo o
           código de natureza mas a sua descrição não.... para contornar esse
           problema foi preciso "chumbar" a descrição correspondente ao codigo
           de natureza chumbado.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 247443 PPM 669193
Data.....: 03/02/2015
Sol......: 247443
PPM......: 669193
Descrição: Ajuste no layout de folha de pagamento para passar o parametro
corretamente.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 247706 PPM 656875
Data.....: 03/02/2015
Sol......: 247706
PPM......: 656875
Descrição: Ajuste efetuado para atendimento da impressão do arquivo txt com o
CmbModelo.layout = 150 e rgsitema.itemindex = 5
-------------------------------------------------------------------------------
Analista.: Felipe A. Santos
Data.....: 26/01/2015
Sol......: 246306/16909
PPM......: 645896
Rotina...: GeraInformeFuncef
Descrição: Retirado a condição que verificava o saldo da contribuição no ano base
           correspondente ao parametrizado na tela, para apresentar o valor na linha
           7ª informações complementares, referente o saldo de contribuição, para
           todos os participantes que tenham saldo.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 246969 PPM 647930
Data.....: 15/01/2015
Sol......: 246969
PPM......: 647930
Descrição: adicionado no informe de rendimentos a linha 5.2 referente ao IRRF do 13º
           Salário do funcionário para folha de pagamento.
-------------------------------------------------------------------------------
Analista.: Felipe A. Santos
Data.....: 15/01/2015
Sol......: 245841
PPM......: 629389
Rotina...: BuscaInformeGeral, AtribuiCampos
Descrição: adicionado no informe de rendimentos a linha 5.2 referente ao IRRF do 13º
           Salário do funcionário para folha de pagamento.
-------------------------------------------------------------------------------
Analista.: Felipe A. Santos
Data.....: 06/01/2015
Sol......: 244545/16839
PPM..: 624515
Rotina...: MontaLinhaRegistroTipoCinco, GeraInformeFuncef
Descrição: Inclusão da informação 02 no item 5 do informe, e no arquivo texto
           referente ao IR do 13º salário
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 225870 Kintana 2059482
Data.....: 18/02/2014
Sol......: 225870
Kintana..: 2059482
Rotina...: bbtnGeraTxtClick , GeraInformeFuncef
Descrição: Adição da descrição dos informes de rendimentos
********************************************************************************
Analista.: William Santana
Data.....: 12/02/2014
Sol......: 226121.15758
Kintana..: 2060120
Rotina...: bbtnGeraTxtClick , GeraInformeFuncef
Descrição: Adição da descrição dos informes de rendimentos
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 217765 KINTANA 2059157
Data.....: 28/01/2014
Sol......: 217765
Kintana..: 2059157
Rotina...: BuscaInformeGeral
Descrição: Ajuste no layout do txt conforme necessidade
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 225143 KINTANA 2058992
Data.....: 28/01/2014
Sol......: 225143
Kintana..: 2058992
Rotina...: BuscaInformeGeral
Descrição: Adicionado os seguintes códigos naturezas (3556, 3579 )amarrados aos
(3223, 5565) respectivamentes
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
Data.....: 28/01/2014
Sol......: 223465
Kintana..: 2058652
Rotina...: BuscaInformeGeral
Descrição: Adicionado os seguintes códigos naturezas (3556, 3579 )amarrados aos
(3223, 5565) respectivamentes
-------------------------------------------------------------------------------
Analista.: William Moreira da Silva
Data.....: 13/01/2014
Sol......: 223696
Kintana..: 2057501
Rotina...: BuscaInformeGeral
Descrição: Ajustar a consulta responsavel pela gerações do arquivo
-------------------------------------------------------------------------------
Analista.: William Santana
Data.....: 03/12/2013
Sol......: 219338.15472
Kintana..: 2054550
Rotina...: bbtnGeraTxtClick , GeraInformeFuncef
Descrição: Adição da descrição dos informes de rendimentos
-------------------------------------------------------------------------------
Analista.: Thiago Melo
SOL......: 219848
Kintana..: 2052442
Data.....: 08/11/2013
Rotina...: MontaSqlDados
Descrição: Agrupar geração de relatórios quando possui duas matriculas do layout
           "Aposentados e Pensionistas a partir de 2013"
-------------------------------------------------------------------------------
Analista.: William Moreira da Silva
SOL......: 210579
Kintana..: 2037426
Data.....: 24/07/2013
Rotina...: bbtnGeraTxtClick
Descrição: A rotina de geração do comprovante não esta gerando o arquivo TXT.
-------------------------------------------------------------------------------
Analista.: Otacilio Aquino
SOL......: 203766
Kintana..: 1968942
Data.....: 26/03/2013
Rotina...: MontaLinhaRegistroTipoCincoTribRegressiva
Descrição: A rotina de geração do comprovante não esta gerando o arquivo TXT.
{------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 201709 Kintana 1954579
SOL......: 201709
Kintana..: 1954579
Data.....: 12/03/2013
Rotina...: GeraInformeFuncef, RPTModeloMemo1, RPTModeloMemo2
Descrição: Procurar o IDPessoa pelo cpf montando um array.
{------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 197664
Kintana..: 1894007
Data.....: 21/12/2012
Rotina...: bbtnGeraTxtClick, GeraInformeFuncef
Descrição: Melhora na performance da geração do informe
{------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 200285
Kintana..: 1932879
Data.....: 08/02/2013
Rotina...: MontaLinhaRegistroTipoTres, GeraInformeFuncef
Descrição: erro I/0-103 ao gerar txt para pensão alimentícia
{-------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 198403
Kintana..: 1910513
Data.....: 14/01/2012
Rotina...: *.dfm, RptModeloBeforePrint
Descrição: alteração do label80 que no template corresponde ao ano do informe lado direito
{-------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 180189
Kintana..: 1761859
Data.....: 03/09/2012
Rotina...: GeraInformeFuncef  (reArquivo)
Descrição: ajustes para melhorar performance,
--------------------------------------------------------------------------------------------------
Analista.: Vander Campos
SOL......: 190550
Kintana..: 1802481
Data.....: 25/09/2012
Descrição: Ajuste na consulta responsavel pela geração do informe de rendimentos
--------------------------------------------------------------------------------------------------
Analista.: Otacilio Aquino
SOL......: 189126
Kintana..: 1786515
Data.....: 04/09/2012
Rotina...: MontaSqlDados
Descrição: Ajuste quando for buscar pensão alimenticia.
--------------------------------------------------------------------------------------------------
Analista.: MARCIO SANCHES SPINOSA
SOL......: 188606
Kintana..: 1777834
Data.....: 24/08/2012
Rotina...: BuscaInformeGeral
Descrição: AJUSTE no sql, para Pensionistas antes de 2011
----------------------------------------------------------------------------------------------------
Rotina      : MontaLinhaRegistroTipoQuatro
Data        : 07/03/2012
Autor       : Vinicius Eduardo N. Maciel
SOL_Kintana : 175889 - KTN 1602395
Descrição   : Ajustado o arquivo para ser retirado um campo de 12 x 0, equivalente
              ao CODINFORME 4041.
----------------------------------------------------------------------------------------------------
Rotina      : MontaLinhaRegistroRRA e  MontaLinhaRegistroTipoSeis
Data        : 09/02/2012
Autor       : Vinicius Eduardo N. Maciel
SOL_Kintana : SOL 174070 - KTN 1570242
Descrição   : A rotina de geração do arquivo .txt foi ajustada para incluir os
              campos de RRA e a antiga linha nº6 passou para nº7.
----------------------------------------------------------------------------------------------------
Rotina      : TELA
Data        : 15/09/2011
Autor       : Otacilio Aquino
SOL_Kintana : 140042.6361_1410792
Descrição   : Validar o campo Exclusão de CPF com aspa.
----------------------------------------------------------------------------------------------------
Rotina      : TELA
Data        : 23/02/2010
Autor       : Bruno Bastos
SOL_Kintana : 131338_746878
Descrição   : Inclusão do item CEP no componente cbxClassifica.
----------------------------------------------------------------------------------------------------
Rotina      : MontaLinhaRegistroTipoDois
Data        : 02/02/2010
Autor       : Bruno Bastos
SOL_Kintana : 130390_731570
Descrição   : Alteração para executar a query que busca a matricula do participante.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina      : MontaLinhaRegistroTipoSeis
Data        : 29/07/2009
Autor       : Bruno Bastos
SOL_Kintana : 119417_571974
Descrição   : Condicionar a mensagem da solicitação 108632 em dados complementares ao ano do informe.
----------------------------------------------------------------------------------------------------
}
//Rotina.............: GeraInformeFuncef
//N. Sol.............: 108581
//N. Kintana.........: 492183
//Data...............: 16/03/2009
//Responsável........: Ricardo Alves
//Descrição..........: Excluidas querys desnecessárias
//--------------------------------------------------------------------------------------------------

{ --------------------------------------------------------------------------------------------------
Rotina      : MontaLinhaRegistroTipoSeis
Data        : 25/03/2009
Autor       : Bruno Bastos
SOL_Kintana : 112398_520072
Descrição   : Alteração na descrição conforme solicitou o cliente.
----------------------------------------------------------------------------------------------------
}
{ --------------------------------------------------------------------------------------------------
Rotina      : Várias
Data        : 13/02/2009
Autor       : Bruno Bastos
SOL_Kintana : 109019_494611
Descrição   : Implementação de novo layout para tributação regressiva.
----------------------------------------------------------------------------------------------------
}
{ --------------------------------------------------------------------------------------------------
Rotina      : MontaLinhaRegistroTipoSeis
Data        : 12/02/2009
Autor       : Ádler Teodoro de Souza
SOL_Kintana : 108632_492608
Descrição   : Inclusão do texto solicitado pelo cliente.
----------------------------------------------------------------------------------------------------
}
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : 27/01/2009
Autor     : Bruno Bastos
Kintana   : 463663
SOL       : 103796
Descrição : Implementação da funcionalidade do informe de rendimento em frente e verso.
----------------------------------------------------------------------------------------------------
}
{ --------------------------------------------------------------------------------------------------
Rotina    : GeraSegundaViaInformeFuncef
Data      : 13/02/2008
Autor     : Bruno Bastos
Pendencia : 27331
Descrição : Ajuste na geração do arquivo TXT de folha de pagamento do informe da FUNCEF.
----------------------------------------------------------------------------------------------------
}
{ --------------------------------------------------------------------------------------------------
Rotina    : GeraSegundaViaInformeFuncef
Data      : 13/02/2008
Autor     : Bruno Bastos
Pendencia : 27407
Descrição : Implementação no layout do arquivo txt da CBS para gravar informação de ação judicial e de ir compensado.
----------------------------------------------------------------------------------------------------
}
{ --------------------------------------------------------------------------------------------------
Rotina    : GeraSegundaViaInformeFuncef, GeraInformeFuncef
Data      : 31/01/2008
Autor     : Claudio Faria
Pendencia : 27341
Descrição : Ajuste na geração do arquivo TXT do informe da FUNCEF
----------------------------------------------------------------------------------------------------
Rotina    : GeraInformeCBS
Data      : 31/01/2008
Autor     : Claudio Faria
Pendencia : 27340
Descrição : Alteração do layout do informe da CBS
----------------------------------------------------------------------------------------------------
Rotina    : bbtnGeraTxtClick
Data      : 25/01/2008
Autor     : Claudio Faria
Pendencia : 27303
Descrição : Verificar se será utilizada a lista ou não na geração do infomre.
---------------------------------------------------------------------------------------------------
Rotina    : - (rgSistema)
Data      : 08/10/2007
Autor     : André Pontes
Pendencia : 26341
Descrição : Separação dos informes de rendimentos sujeitos a tributação regressiva (naturezas 3223 e 5565)
---------------------------------------------------------------------------------------------------}

// Hugo Luna
// Pendencia: 25212
// Data: 11/10/2007
// Coloquei mais dois campos na c´ritica de endereço da geração do text do Informe de Rendimentos. CPF e Motivo.

// Bruno Bastos
// Pendencia: 26486
// Data: 25/07/2007
// Passei os parâmetros do nome do responsável e a data informada na tela para o método BuscaInformeGeral.

// Bruno Bastos
// Pendencia 25858
// 25/07/2007
// Comentei a linha If bImprime = False Then Break; para poder gerar arquivo de informe de folha de pagamento.

// Bruno Bastos
// Pendência 20091
// Rotinas: Rotinas referentes a ação judicial
// 23/07/2007
// Identação do código inteiro e ajuste na query que busca valores da procjud

// Claudio Faria
// Pendencia 24601
// 28/02/2007
// Ajuste para mostrar dados complementares de deposito judicial na geração dq arquivo do INFOMRE

// Claudio Faria
// Pendencia 24562
// 22/02/2007
// Alteração no layout da linha um do arquivo TXT do Informe

// Claudio Faria
// Pendencia 23917 (Reabertura)
// 21/02/2007
// cds não estavam sendo populados corretamente pelas ctrls
// GeraInformeFuncef (cdsJud13, cdsJudRend13, cdsRendJud)

// Claudio Faria
// Pendencia 24546
// 16/02/2007
// Endereço retornado estava errado

// Claudio Faria
// Pendencia 24543
// 16/02/2007
// Todas as pessoas geradas pelo arquivo TXT estavam com o codigo natuerza 0561,
// quando algumas eram 0588

// Claudio Faria
// Pendencia 20757
// 31/01/2007
// Alteração no layout de 2ºVia da Funcef

// Claudio Faria
// Pendencia 23062
// 01/02/2006
// Melhorar a performance da geração do arquivo TXT do informe

// Bruno Bastos
// Pendencia 23917 (Reabertura)
// 06/12/2006
// cds não estavam sendo populados corretamente pelas ctrls
// GeraInformeFuncef (cdsJud13, cdsJudRend13, cdsRendJud)

// Bruno Bastos
// Pendencia 23917
// 05/12/2006
// cds não estavam sendo populados corretamente pelas ctrls
// GeraInformeFuncef ( cdsPensionista13)

// Bruno Bastos
// Pendencia 21429
// 01/02/2006
// Passar para a rotina que busca o valor pago ao pensionista no 13º o valor do
// idpessoa corretamente.

// Bruno Bastos
// Pendencia 20708
// 02/01/2006
// Gerar arquivo de crítica de endereço.

// Bruno Bastos
// Pendencia 19963 e 20108
// 29/12/2005
// Gerar informe utilizando a lista de recebedores.

// Bruno Bastos
// Pendencia 19371
// 02/06/2005
// Geração de arquivo texto para a BrtPrev, pois não gerava o endereço da pessoa.

// Marchetti
// Pendencia 16028
// 13/10/2004
// Geraçào de arquivo texto (segunda via)

// Marchetti
// Pendencia 16300
// 15/07/2004
// Permitir a seleçào de mais de uma matricula

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 04/09/2003
// Alteração   : Alterada a query para considerar flgdesconto
// Pendência   : 12642
//
//    Fdias - 02.10.2003 acrescentado iddirf=13 na query de busca
//
//    Acerto da linha de observação pois sumiu o valor dos rendimentos com
//    exigibilidade suspensa - FDias - 06.10.2003
//
//    Fernando - 11 a 12 de novembrbo / 2003 P. 15596
//    Fernando - 12 /11/03 - p.15613 (alterei o sql do SQLDADOSTXT )
//    FDias    - 20.02.2004 - acerto na sqlljud para considerar coddirf=9 além do 14
//------------------------------------------------------------------------------

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorioMT, ppDB, ppDBPipe, ppDBBDE, ppCache, ppClass, ppBands,
  ppRelatv, ppProd, ppReport, ppComm, ppEndUsr, Menus, uCmSqlParams,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, StdCtrls, Buttons, Mask,
  wwdbedit, wwdblook, CMDBLookupCombo, ExtCtrls, ppPrnabl, ppCtrls,
  ppStrtch, ppMemo, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlInformeRendimentos, uCtrlGeral, uFuncoesUteis_irrf, IvDictio, IvMulti,
  IvEMulti, ppModule, raCodMod, DBTables, fProgresso, fFrameLista, JclStrings,
  TB97Tlwn, ExtDlgs, IniFiles, Wwquery, uCMFileUtils;

Type
  rPensionista = Record
    Nome: String;
    CPF: String;
    ValorPensao: String;
    Valor13: String;
  End;
  TTipoGeracao = (tgImprimeInforme, tgGeraTXT);     // edilaine - SIG 19602

Type Funcionario = Record
    CPF: String;
    Nome: String;
    TotalRendimentos: String;
    Contribuicao: String;
    Contribuicao1: String;
    PensaoAlimenticia: String;
    ImpostoRenda: String;
    ParcelaIsentaProventos: String;
    DiariasAjudas: String;
    PensaoProventos: String;
    LucroDividendo: String;
    ValoresPagos: String;
    Indenizacoes: String;
    Outros: String;
    DecimoTerceiro: String;
    Outros2: String;
    Matricula: String;
    UnidadeLocacao: String;
    Pams: String;
    DevolucaoPams: String;
    Endereco: String;
    Bairro: String;
    Municipio: String;
    UF: String;
    Cep: String;
    DesCodNatureza: String;
    IrFeriasExigibilidade: String;
    AbonoTribExigibilidade: String;
    CompIrDecJudcial: String;
    Pensionista1: rPensionista;
    Pensionista2: rPensionista;
    Pensionista3: rPensionista;
    Pensionista4: rPensionista;
  End;

Type
  TFrmConfigRelatInformeMT = Class(TFrmConfigRelatorioMT)
    cdsInforme: TCMClientDataSet;
    cdsCompIRRF: TCMClientDataSet;
    cdsMatLocFunc: TCMClientDataSet;
    cdsDadosTxt: TCMClientDataSet;
    cdsPensionista: TCMClientDataSet;
    cdsInforme1: TCMClientDataSet;
    cdsMatric: TCMClientDataSet;
    cdsFunc: TCMClientDataSet;
    RptModeloLabel42: TppLabel;
    RptModeloLabel40: TppLabel;
    RptModeloLabel41: TppLabel;
    cdsEmpresaProp: TCMClientDataSet;
    SaveDialog1: TSaveDialog;
    RptModeloMemo1: TppMemo;
    rgSistema: TRadioGroup;
    cdsAux2: TCMClientDataSet;
    prgBarAtuFluxo: TProgressBar;
    bbtnGeraTxt: TBitBtn;
    cdsPensionista13: TCMClientDataSet;
    cdsEnd: TCMClientDataSet;
    cdsJudRend13: TCMClientDataSet;
    cdsJud: TCMClientDataSet;
    CMClientDataSet1: TCMClientDataSet;
    cdsJud13: TCMClientDataSet;
    cdsRendJud: TCMClientDataSet;
    chkSegundaVia: TCheckBox;
    cdsOutros6: TCMClientDataSet;
    popMnuListaMatricula: TPopupMenu;
    mnuImportaMatricula: TMenuItem;
    OpenDialog: TOpenDialog;
    chkPensaoAlimenticia: TCheckBox;
    sqlAlimentante: TCMSqlParams;
    cdsAlimentante: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    Label3: TLabel;
    edtData: TEdit;
    UpDown1: TUpDown;
    LblRubrica: TLabel;
    edtRubrica: TEdit;
    Bevel2: TBevel;
    chkInformeSeparado: TCheckBox;
    pnlFrameLista: TPanel;
    FrameBenef: TfrmFrameListaBenef;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    meCPF: TMaskEdit;
    gbObservacao: TGroupBox;
    Label7: TLabel;
    edtObservacao: TEdit;
    Panel3: TPanel;
    chkUsaLista: TCheckBox;
    pnlResponsavel: TPanel;
    grpbxResponsavel: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtNome: TEdit;
    dtdtData: TCMDateTimePicker;
    lblQuantidade: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtQuantidade: TEdit;
    lblQtdGerado: TLabel;
    lblInicioProc: TLabel;
    lblfimproc: TLabel;
    cdsIDPessjur: TCMClientDataSet;
    ppImage1: TppImage;
    townEscolheFiguras: TToolWindow97;
    btnFecharSelFiguras: TBitBtn;
    gbxFiguras: TGroupBox;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edFigura1: TEdit;
    bbtnFigura1: TBitBtn;
    edFigura2: TEdit;
    bbtnFigura2: TBitBtn;
    edFigura3: TEdit;
    bbtnFigura3: TBitBtn;
    opdImagem: TOpenPictureDialog;
    btnCadFiguras: TBitBtn;
    cbxClassifica: TComboBox;
    lblClassifica: TLabel;
    ppImage2: TppImage;
    ppImage3: TppImage;
    ppImage1_2: TppImage;
    cdsAux: TCMClientDataSet;
    RptModeloMemo2: TppMemo;
    ppImage2_2: TppImage;
    ppImage3_2: TppImage;
    RptModeloLabel401: TppLabel;
    RptDataInf: TppLabel;
    Label13: TLabel;
    edtExcluiCPF: TEdit;
    ppLabel80: TppLabel; // Edilaine - SOL 198403 / KTN 1910513
    CdsInformeSaldo: TCMClientDataSet;
    CdsRRA: TCMClientDataSet;
    CdsRRA_Aux: TCMClientDataSet;
    cdsResidExterior: TCMClientDataSet;
    Procedure RptModeloBeforePrint(Sender: TObject);
    Procedure RptModeloMemo1Print(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure bbtnGeraTxtClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure rgInformeClick(Sender: TObject);
    Procedure edtRubricaKeyPress(Sender: TObject; Var Key: Char);
    Procedure rgSistemaClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure mnuImportaMatriculaClick(Sender: TObject);
    Procedure chkUsaListaClick(Sender: TObject);
    Procedure BtnImprimeClick(Sender: TObject);
    Procedure bbtnFigura1Click(Sender: TObject);
    Procedure bbtnFigura2Click(Sender: TObject);
    Procedure bbtnFigura3Click(Sender: TObject);
    Procedure btnCadFigurasClick(Sender: TObject);
    Procedure btnFecharSelFigurasClick(Sender: TObject);
    Procedure RptModeloMemo2Print(Sender: TObject);
    Procedure FrameBenefbbtnIncluiBenefClick(Sender: TObject);
  Private
    bUsaTextFile: boolean; // Edilaine - SOL 180189 / KTN 1761859
    ArquivoTexto, ArqCriticaEndereco: TextFile;
    CtrlInformeRendimentos: TCtrlInformeRendimentos;
    Func, Func1: Funcionario; // funcionarios por página

    ArqConfig: TIniFile; //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 26/01/2009
    iTotalLinhas: Integer;
    iTotalBenef: Integer;
    pIsPensionistasAntigos: Boolean; //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834

    TipoGeracao : TTipoGeracao;       // edilaine - SIG 19602

    Procedure MontaSqlDados;
    Procedure GeraInformeFuncef;
    Procedure GeraInformeCBS;
    Procedure LimpaReg(Var Func: Funcionario);

    Procedure GeraSegundaViaInformeFuncef;
    Function MontaLinhaRegistroTipoZERO: String;
    Function MontaLinhaRegistroTipoUm: String;
    Function MontaLinhaRegistroTipoDois: String;
    Function MontaLinhaRegistroTipoTres: String;
    Function MontaLinhaRegistroTipoQuatro: String;
    Function MontaLinhaRegistroTipoCinco: String;
    Function MontaLinhaRegistroTipoCincoTribRegressiva: String; // Otacilio SOL 203766 KTN 1968942
    Function MontaLinhaRegistroTipoSeis: String;
    Function MontaLinhaRegistroRRA: String;
    Function MontaLinhaRegistroTipoNove: String;
    Function MontaLinhaRegistroTipoSete: String; //William Santana SOL 219338.15472 KIN 2054550

    Procedure LeAlteracoes;
    Procedure GravaAlteracoes;
    Procedure GeraArquivoDirf;
    Procedure MontaPaginas;
    Procedure AtribuiCampos(Const piPagina: Integer);
    function IIF(bValida: Boolean; sValorV, sValorF:String):String; //SIG82520
  Public
    bEntrouSeldados: boolean;
    iNumExec: integer; //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 26/01/2009
    iNumIN:   String; //SIG85183.92415
  Protected
    Procedure SelDados; Override;
  End;

Var
  FrmConfigRelatInformeMT: TFrmConfigRelatInformeMT;
  reArquivo: TRichEdit; // Edilaine - SOL 180189 / KTN 1761859

Implementation

{$R *.DFM}

Uses uSistema, uDataBase, uMensErro, DBaseDados, uFuncaoGeral;

Procedure TFrmConfigRelatInformeMT.RptModeloBeforePrint(Sender: TObject);
Begin
  Inherited;

  If RptModeloLabel40 <> Nil Then
    RptModeloLabel40.Caption := cdsDados.fieldByName('NomeResp').asString;

  If RptModeloLabel41 <> Nil Then
    RptModeloLabel41.Caption := cdsDados.fieldByName('DataInf').asString;

  If RptModeloLabel42 <> Nil Then
    RptModeloLabel42.Caption := edtData.text;

  //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 15/01/2009 - Início
  If ppImage1 <> Nil Then
    ppImage1.Picture.LoadFromFile(edFigura1.Text);

  If ppImage2 <> Nil Then
    ppImage2.Picture.LoadFromFile(edFigura2.Text);

  If ppImage3 <> Nil Then
    ppImage3.Picture.LoadFromFile(edFigura3.Text);

  If ppImage1_2 <> Nil Then
    ppImage1_2.Picture.LoadFromFile(edFigura1.Text);

  If ppImage2_2 <> Nil Then
    ppImage2_2.Picture.LoadFromFile(edFigura2.Text);

  If ppImage3_2 <> Nil Then
    ppImage3_2.Picture.LoadFromFile(edFigura3.Text);

  If RptModeloLabel401 <> Nil Then
    RptModeloLabel401.Caption := cdsDados.fieldByName('NomeResp').asString;

  If RptDataInf <> Nil Then
    RptDataInf.Caption := cdsDados.fieldByName('DataInf').asString;

  // Edilaine - SOL 198403 / KTN 1910513
  If ppLabel80 <> Nil Then
    ppLabel80.Caption := edtData.text;
  // Edilaine - SOL 198403 / KTN 1910513

  If rgSistema.ItemIndex = 0 Then
    Begin
      inc(iNumExec);
      If iNumExec <= 1 Then
        Begin
          cdsAux.Data := cdsDados.Data;
          cdsDados.Data := CtrlInformeRendimentos.AbreCdsVirtual;
          MontaPaginas;
        End;
    End;
  //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 15/01/2009 - Fim

End;

Procedure TFrmConfigRelatInformeMT.RptModeloMemo1Print(Sender: TObject);
Var
  sDadosComp: String;
  sAno: String;

Begin
  Inherited;

  sDadosComp := '';

  If Trim(edtData.text) <> '0' Then
    sAno := edtData.text
  Else
    sAno := intTostr(ExtraiAno(date));

  If (cdsDados.fieldByName('CODNATUREZA').AsString = '0561') Or
    (cdsDados.fieldByName('CODNATUREZA').AsString = '3223') Or
    (cdsDados.fieldByName('CODNATUREZA').AsString = '5565') Or
    (cdsDados.fieldByName('CODNATUREZA').AsString = '0588') Or
   //Cássio Rovaroto - SIG nº 73545 - Início
   (cdsDados.fieldByName('CODNATUREZA').AsString = '9466') Or
   //Cássio Rovaroto - SIG nº 73545 - Fim
    //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652 - Inicio
  (cdsDados.fieldByName('CODNATUREZA').AsString = '3556') Or
    (cdsDados.fieldByName('CODNATUREZA').AsString = '3579') Then
    //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652 - Fim
    Begin
      sDadosComp := CtrlInformeRendimentos.BuscaDadosCompl(-1,
        //        cdsDados.fieldByName('IDPESSOA').AsInteger,
        StrToInt(sAno),
        rgSistema.ItemIndex,
        edtRubrica.text,
        chkPensaoAlimenticia.Checked,
        cdsDados.FieldByName('CPF').AsString); //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
    End;

  RptModeloMemo1.Caption := '';
  RptModeloMemo1.Lines.Clear;
  RptModeloMemo1.Lines.Add(sDadosComp);
  if (CtrlInformeRendimentos.pLayout2021) and (StrToInt(edtData.text) > 2021) then //Leandro Pocebon - SIG132465
    RptModeloMemo1.Font.Size := 6;       //Leandro Pocebon - SIG132465

End;

Procedure TFrmConfigRelatInformeMT.FormCreate(Sender: TObject);
Begin
  {Atribuir o Flag equivalente ao modelo do relatório caso a a tabela de persistência seja a CARTACOBRANCA  }
  cFlag := 'F';
  pIsPensionistasAntigos := False;
  CtrlInformeRendimentos := TCtrlInformeRendimentos.create;
  CtrlInformeRendimentos.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  // Edilaine - SOL 180189 / KTN 1761859
  reArquivo := TRichEdit.Create(Self);
  reArquivo.Parent := pnlFundo;
  reArquivo.PlainText := true;
  reArquivo.Height := 0;
  reArquivo.Width := 0;
  // Edilaine - SOL 180189 / KTN 1761859 - fim

  SaveDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  Inherited;
End;

Procedure TFrmConfigRelatInformeMT.SelDados;
Begin
  Inherited;
  {
    Sobrescrever a procedure SelDados para abrir o SQLDADOS que é a fonte
    de dados para o relatório.
    Em tempo de desenho clicar acessar a opção OPEN do meno do SQLDADOS para
    abrir o CDSDADOS para habilitar o acesso aos campos da consulta para o
    desenho do relatório.
  }

  If bEntrouSeldados Then MontaSqlDados;

  bEntrouSeldados := True;
End;

Procedure TFrmConfigRelatInformeMT.MontaSqlDados;
Var
  iIdPessoa: Double;
  iContador: Integer;
  sAno, cLinha13, cLinhaContrib, sMatriculas: String;
  bAgrupaCPF: Boolean;
  // SOL 189126 KTN 1786515 Otacilio
  bPensaoAlimenticia: Boolean;

  Pessoas: TPessoa_InformeRendimentos;
  iModelo: integer;
Begin
  bPensaoAlimenticia := False;
  If Trim(edtData.text) <> '0' Then
    sAno := edtData.text
  Else
    sAno := intTostr(ExtraiAno(date));

  sMatriculas := '';
  iIdPessoa := -1999;
  cdsEmpresaProp.data := ctrlInformeRendimentos.BuscaEmpresaProp(Sistema.IdEmpresa);

  Pessoas := TPessoa_InformeRendimentos.Create; //Inclusão do TRY-Finally - Vander - SOL: 190550 - Kintana: 1802481
  Try
    If trim(meCPF.Text) <> '' Then
      Begin
        // SOL 189126 KTN 1786515 Otacilio ** Inicio **
        If (CmbModelo.LookupValue = '35') And (chkPensaoAlimenticia.Checked) Then
          bPensaoAlimenticia := True;

        //Marcos Luiz  SOL: 135079 - Kintana: 813939 - 27/05/2010
        iIdPessoa := ctrlInformeRendimentos.BuscaPeloCpfAno(trim(meCPF.Text), sAno, bPensaoAlimenticia, Pessoas);
        // SOL 189126 KTN 1786515 Otacilio ** Fim **

      End;

    // Criado por Arnaldo V. Scarin em 30/09/2010
    // Essa linha é responsavel por identificar se deverá ser feita a rotina
    // de Agrupamento de CPF´s, em decorrencia do SOL 133233.
    // O Codigo 33 é o Código do "Layout de Aposentados e Pensionistas"
    // na base de producao, tst e homologação.
    bAgrupaCpf := (CmbModelo.LookupValue = '33') And
      (rgSistema.ItemIndex = 1);

    bAgrupaCPF := bAgrupaCPF Or (chkPensaoAlimenticia.Checked And (rgSistema.ItemIndex = 1));

    //Vander - SOL: 190550 - Kintana: 1802481
    bAgrupaCpf := bAgrupaCPF Or ((CmbModelo.LookupValue = '142') And
      (rgSistema.ItemIndex = 1));
    // Thiago Melo SOL 219848 Kintana 2052442
    bAgrupaCpf := bAgrupaCPF Or ((CmbModelo.LookupValue = '148') And
      (rgSistema.ItemIndex = 1));
    // Marcio Sanches Spinosa SOL 246969 PPM 647930 - Inicio
    bAgrupaCpf := bAgrupaCPF Or ((CmbModelo.LookupValue = '153') And
      (rgSistema.ItemIndex = 1));
    // Marcio Sanches Spinosa SOL 246969 PPM 647930 - Fim

    If (CmbModelo.LookupValue <> '') Then
      iModelo := StrToInt(CmbModelo.LookupValue)
    Else
      iModelo := -1;

    //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Início
    cdsDados.Data := ctrlInformeRendimentos.BuscaInformeGeral(iIdPessoa,
      sAno,
      rgSistema.ItemIndex,
      Sistema.IdEmpresa,
      frameBenef.ListaUsuario,
      chkPensaoAlimenticia.Checked,
      chkInformeSeparado.Checked,
      edtNome.Text,
      dtdtData.Date,
      chkUsaLista.Checked,
      cbxClassifica.ItemIndex,
      bAgrupaCPF,
      edtExcluiCPF.Text,
      Pessoas
      //,StrToInt(CmbModelo.LookupValue)   // SOL 248939 PPM 997373
      , iModelo
      , (TipoGeracao = tgGeraTXT)          // edilaine - SIG 19602
      );

    //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Fim
  Finally
    FreeAndNil(Pessoas);
  End;

End;

Procedure TFrmConfigRelatInformeMT.CmeCadastroInsert(Sender: TObject);
Begin
  Inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
End;

Procedure TFrmConfigRelatInformeMT.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
End;

Procedure TFrmConfigRelatInformeMT.GeraSegundaViaInformeFuncef;
Var
  rIdPessoa: real;

  sVal301, //Total de redimentos
  sVal302, //contribuição previdenciária oficial
  sVal303, //Contribuição à previdência privada
  sVal304, //pensão alimentícia
  sVal305, //Imposto retido na fonte
  sVal401,
    sVal402, //Salário família
  sVal403, //Parcela isenta dos proventos de aposentadoria
  sVal404, //Diárias e ajudas de custo
  sVal405, //Pensão, proventos de aposentadoria
  sVal406, //Lucro e dividendo apurado
  sVal407, //Outros. Demais rendimentos isentos
  sVal501, // Décimo Terceiro salário
  sVal502, //Outros(Valor liquido dos demais Rendimentos sujeitos à tributação exclusiva)
  sVal601, //valor do Pams - não me pergunte o que que é isso...
  sVal602, //Valor de devolução do Pams
  sVal603,
    sVal604,
    sVal605: String;

  sCodNatureza, CPF, NomeBene: String;

  Pensionista: Array[0..3] Of rPensionista;
  ContFunc, i, iModulo: integer;
  sENDEREO, sBAIRRO, sNOME, sUF, sCEP, sDesCodNatureza: String;
  bImprime: Boolean;

Begin
  cdsEmpresaProp.data := ctrlInformeRendimentos.BuscaEmpresaProp(Sistema.IdEmpresa);
  cdsInforme1.data := CtrlInformeRendimentos.BuscaInforme1;

  //Abre a mesma qry do relatório.
  MontaSqlDados;
  prgBarAtuFluxo.Visible := True;
  prgBarAtuFluxo.Max := cdsDados.RecordCount;
  lblQuantidade.visible := true;
  edtQuantidade.visible := true;
  edtquantidade.text := Inttostr(cdsDados.RecordCount);
  prgBarAtuFluxo.Position := 0;
  cdsdados.First;

  If Not cdsdados.IsEmpty Then
    Begin
      //Gera registro Tipo 3
      {estou usando um while dentro do outro com a mesma tabela sem usar gotobookmark, pois
       eu preciso varrer a qrydados para pegar todos os valores de informes para um determinado
       idpessoa, quando eu já tiver obtido todos os informes eu gero o registro e passo para o próximo
       funcionário.}

      prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
      prgBarAtuFluxo.Update;
      ContFunc := 0;
      cdsdados.first;

      While Not cdsdados.eof Do
        Begin
          rIdPessoa := -1; //cdsdados.FieldByName('IDPESSOA').AsFloat;
          sCodNatureza := cdsdados.FieldByName('CODNATUREZA').AsString;

          //CPrev - 27341 - Inicio
          If (cdsDados.FieldByName('IDENDERECO').AsString = '') Or
            (cdsDados.FieldByName('ENDEREO').AsString = '') Or
            (cdsDados.FieldByName('CEP').AsString = '') Then
            Begin
              // Paulo Nobre SOL 268555 PPM 1262100
              cdsIDPessjur.Data := CtrlInformeRendimentos.BuscaIDPessJur(-1, cdsdados.FieldByName('CPF').AsString); // cdsdados.FieldByName('IDPESSOA').AsInteger};
            End;
          //CPrev - 27341 - Fim

          sENDEREO := cdsdados.fieldByname('ENDEREO').asstring;
          sBAIRRO := cdsdados.fieldByname('BAIRRO').asstring;
          sNOME := cdsdados.fieldByname('NOME').asstring;
          sUF := cdsdados.fieldByname('UF').asstring;
          sCEP := cdsdados.fieldByname('CEP').asstring;

          //CPrev - 20757 - 07/02/2007ContFunc     := ContFunc + 1;

          // Paulo Nobre SOL 268555 PPM 1262100
          cdsIDPessjur.Data := CtrlInformeRendimentos.BuscaIDPessJur(-1, cdsdados.FieldByName('CPF').AsString);

          If (cdsDados.FieldByName('IDENDERECO').AsString = '') Then
            Begin
              // Paulo Nobre SOL 268555 PPM 1262100
              cdsMatric.Data := CtrlInformeRendimentos.BuscaMatricula(
                -1,
                //cdsDados.FieldByName('IDPESSOA').AsFloat,
                  //cdsDados.FieldByName('IDPESSJUR').AsFloat );     //CPrev - 27341
                cdsIDPessjur.FieldByName('IDPESSJUR').AsFloat,
                cdsdados.FieldByName('CPF').AsString); //CPrev - 27341

              write(ArqCriticaEndereco, 'Matrícula: ' + cdsMatric.FieldByName('MATRICULA').AsString +
                '   Nome: ' + cdsDados.FieldByName('NOMEBENEF').AsString +
                '    CPF: ' + cdsDados.FieldByName('CPF').AsString +
                '   Motivo: Não existe registro ');
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
              prgBarAtuFluxo.Update;
              cdsDados.Next;
              Continue;
            End;

          If (cdsDados.FieldByName('ENDEREO').AsString = '') And (cdsDados.FieldByName('IDENDERECO').AsString <> '') Then
            Begin
              // Paulo Nobre SOL 268555 PPM 1262100
              cdsMatric.Data := CtrlInformeRendimentos.BuscaMatricula(
                -1,
                //                cdsDados.FieldByName('IDPESSOA').AsFloat,
                                //cdsDados.FieldByName('IDPESSJUR').AsFloat );      //CPrev - 27341
                cdsIDPessjur.FieldByName('IDPESSJUR').AsFloat,
                cdsdados.FieldByName('CPF').AsString); //CPrev - 27341

              write(ArqCriticaEndereco, 'Matrícula: ' + cdsMatric.FieldByName('MATRICULA').AsString +
                '   Nome: ' + cdsDados.FieldByName('NOMEBENEF').AsString +
                '    CPF: ' + cdsDados.FieldByName('CPF').AsString +
                '   Motivo: Logradouro não preenchido ');
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
              prgBarAtuFluxo.Update;
              cdsDados.Next;
              Continue;
            End;

          If (cdsDados.FieldByName('CEP').AsString = '') And (cdsDados.FieldByName('IDENDERECO').AsString <> '') Then
            Begin
              // Paulo Nobre SOL 268555 PPM 1262100
              cdsMatric.Data := CtrlInformeRendimentos.BuscaMatricula(
                -1,
                //              cdsDados.FieldByName('IDPESSOA').AsFloat,
                                //cdsDados.FieldByName('IDPESSJUR').AsFloat );     //CPrev - 27341
                cdsIDPessjur.FieldByName('IDPESSJUR').AsFloat,
                cdsdados.FieldByName('CPF').AsString); //CPrev - 27341

              write(ArqCriticaEndereco, 'Matrícula: ' + cdsMatric.FieldByName('MATRICULA').AsString +
                '   Nome: ' + cdsDados.FieldByName('NOMEBENEF').AsString +
                '    CPF: ' + cdsDados.FieldByName('CPF').AsString +
                '   Motivo: CEP não preenchido ');
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
              prgBarAtuFluxo.Update;
              cdsDados.Next;
              Continue;
            End;

          ContFunc := ContFunc + 1; //CPrev - 20757 - 07/02/2007

          {Valores Mensal}
          cdsPensionista.Data := ctrlInformeRendimentos.BuscaCampo6sqlPensionistas(
            -1,
            //          rIdPessoa,
            strToInt(edtData.Text),
            rgSistema.ItemIndex,
            cdsdados.FieldByName('CPF').AsString);

          {Valores de 13º}
          cdsPensionista13.data := ctrlInformeRendimentos.BuscaCampo6sqlPensionistas13(
            -1,
            //          rIdPessoa,
            strToInt(edtdata.text),
            edtRubrica.text,
            rgSistema.ItemIndex,
            cdsdados.FieldByName('CPF').AsString);

          CPF := cdsdados.fieldByname('CPF').Asstring;
          NomeBene := cdsdados.fieldByname('NOMEBENEF').Asstring;

          cdsMatLocFunc.Data := CtrlInformeRendimentos.BuscaMatLocFunc(-1, CPF); //rIdPessoa);

          sVal301 := '0,00';
          sVal302 := sVal301;
          sVal303 := sVal301;
          sVal304 := sVal301;
          sVal305 := sVal301;
          sVal401 := sVal301;
          sVal402 := sVal301;
          sVal403 := sVal301;
          sVal404 := sVal301;
          sVal405 := sVal301;
          sVal406 := sVal301;
          sVal407 := sVal301;
          sVal501 := sVal301;
          sVal502 := sVal301;
          sVal601 := sVal301;
          sVal602 := sVal301;
          sVal603 := sVal301;
          sVal604 := sVal301;
          sVal605 := sVal301;

          Case rgSistema.ItemIndex Of
            0: iModulo := 21;
            1: iModulo := 18;
            3: iModulo := 10;
          End;

          // Paulo Nobre SOL 268555 PPM 1262100
          If Not CtrlInformeRendimentos.AtualizaLancIRRF(-1,
            //cdsdados.fieldByname('IDPESSOA').AsInteger,
            iModulo,
            cdsdados.fieldByname('CODNATUREZA').AsString,
            cdsdados.FieldByName('CPF').AsString) Then
            Begin
              MsgDlg('Erro ao atualizar dados.', 'Erro', mtWarning, [mbOK], 0);
              exit;
            End;

          bImprime := True;

          //Varre a qrydados enquanto houver informes para o funcionário corrente
          While (Not cdsdados.EOF) And
            // Paulo Nobre SOL 268555 PPM 1262100
          (rIdPessoa = -1) Do //cdsdados.FieldByName('IDPESSOA').AsFloat) Do
            Begin
              If cdsdados.fieldByname('CODNATUREZA').AsString = '0588' Then
                sDesCodNatureza := 'TRABALHO SEM VINCULO EMPREGATICIO'
              Else
                sDesCodNatureza := 'ASSALARIADO';

              Try
                If (cdsdados.fieldByname('VLR301').AsFloat > 0) And (StrToFloat(sVal301) <= 0) Then
                  sVal301 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR301').AsFloat);
              Except
                sVal301 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR302').AsFloat > 0) And (StrToFloat(sVal302) <= 0) Then
                  sVal302 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR302').AsFloat);
              Except
                sVal302 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR303').AsFloat > 0) And (StrToFloat(sVal303) <= 0) Then
                  sVal303 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR303').AsFloat);
              Except
                sVal303 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR304').AsFloat > 0) And (StrToFloat(sVal304) <= 0) Then
                  sVal304 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR304').AsFloat);
              Except
                sVal304 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR305').AsFloat > 0) And (StrToFloat(sVal305) <= 0) Then
                  sVal305 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR305').AsFloat);
              Except
                sVal305 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR401').AsFloat > 0) And (StrToFloat(sVal401) <= 0) Then
                  sVal401 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR401').AsFloat);
              Except
                sVal401 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR402').AsFloat > 0) And (StrToFloat(sVal402) <= 0) Then
                  sVal402 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR402').AsFloat);
              Except
                sVal402 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR403').AsFloat > 0) And (StrToFloat(sVal403) <= 0) Then
                  sVal403 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR403').AsFloat);
              Except
                sVal403 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR404').AsFloat > 0) And (StrToFloat(sVal404) <= 0) Then
                  sVal404 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR404').AsFloat);
              Except
                sVal404 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR405').AsFloat > 0) And (StrToFloat(sVal405) <= 0) Then
                  sVal405 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR405').AsFloat);
              Except
                sVal405 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR406').AsFloat > 0) And (StrToFloat(sVal406) <= 0) Then
                  sVal406 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR406').AsFloat);
              Except
                sVal406 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR407').AsFloat > 0) And (StrToFloat(sVal407) <= 0) Then
                  sVal407 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR407').AsFloat);
              Except
                sVal407 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR501').AsFloat > 0) And (StrToFloat(sVal501) <= 0) Then
                  sVal501 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR501').AsFloat);
              Except
                sVal501 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR502').AsFloat > 0) And (StrToFloat(sVal502) <= 0) Then
                  sVal502 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR502').AsFloat);
              Except
                sVal502 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR601').AsFloat > 0) And (StrToFloat(sVal601) <= 0) Then
                  sVal601 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR601').AsFloat);
              Except
                sVal601 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR602').AsFloat > 0) And (StrToFloat(sVal602) <= 0) Then
                  sVal602 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR602').AsFloat);
              Except
                sVal602 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR603').AsFloat > 0) And (StrToFloat(sVal603) <= 0) Then
                  sVal603 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR603').AsFloat);
              Except
                sVal603 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR604').AsFloat > 0) And (StrToFloat(sVal604) <= 0) Then
                  sVal604 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR604').AsFloat);
              Except
                sVal604 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR605').AsFloat > 0) And (StrToFloat(sVal605) <= 0) Then
                  sVal605 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR605').AsFloat);
              Except
                sVal605 := '0,00';
              End;

              Case ContFunc Of
                1: Begin
                    //limpar o record
                    Func.CPF := CtrlInformeRendimentos.FormataCPF(CPF);
                    Func.Nome := NomeBene;
                    Func.TotalRendimentos := sVal301;
                    Func.Contribuicao := sVal302;
                    Func.Contribuicao1 := sVal303;
                    Func.PensaoAlimenticia := sVal304;
                    Func.ImpostoRenda := sVal305;
                    Func.ParcelaIsentaProventos := sVal401;
                    Func.DiariasAjudas := sVal402;
                    Func.PensaoProventos := sVal403;
                    Func.LucroDividendo := sVal404;
                    Func.ValoresPagos := sVal405;
                    Func.Indenizacoes := sVal406;
                    Func.Outros := sVal407;
                    Func.DecimoTerceiro := sVal501;
                    Func.Outros2 := sVal502;
                    Func.Matricula := cdsMatLocFunc.fieldByname('MATRICULA').Asstring;
                    Func.UnidadeLocacao := cdsMatLocFunc.fieldByname('NOME').Asstring;
                    Func.Endereco := sENDEREO;
                    Func.Bairro := sBAIRRO;
                    Func.Municipio := sNOME;
                    Func.UF := sUF;
                    Func.Cep := sCEP;
                    Func.Pams := sVal601;
                    Func.DevolucaoPams := sVal602;
                    Func.IrFeriasExigibilidade := sVal605;
                    Func.AbonoTribExigibilidade := sVal604;
                    Func.CompIrDecJudcial := sVal603;
                    Func.Pensionista1.Nome := Pensionista[0].Nome;
                    Func.Pensionista1.CPF := Pensionista[0].CPF;
                    Func.Pensionista1.ValorPensao := Pensionista[0].ValorPensao;
                    Func.Pensionista1.Valor13 := Pensionista[0].Valor13;
                    Func.Pensionista2.Nome := Pensionista[1].Nome;
                    Func.Pensionista2.CPF := Pensionista[1].CPF;
                    Func.Pensionista2.ValorPensao := Pensionista[1].ValorPensao;
                    Func.Pensionista2.Valor13 := Pensionista[1].Valor13;
                    Func.Pensionista3.Nome := Pensionista[2].Nome;
                    Func.Pensionista3.CPF := Pensionista[2].CPF;
                    Func.Pensionista3.ValorPensao := Pensionista[2].ValorPensao;
                    Func.Pensionista3.Valor13 := Pensionista[2].Valor13;
                    Func.Pensionista4.Nome := Pensionista[3].Nome;
                    Func.Pensionista4.CPF := Pensionista[3].CPF;
                    Func.Pensionista4.ValorPensao := Pensionista[3].ValorPensao;
                    Func.Pensionista4.Valor13 := Pensionista[3].Valor13;
                    Func.DesCodNatureza := sDesCodNatureza;
                    Pensionista[0].Nome := '';
                    Pensionista[0].CPF := '';
                    Pensionista[0].ValorPensao := '';
                    Pensionista[0].Valor13 := '';
                    Pensionista[1].Nome := '';
                    Pensionista[1].CPF := '';
                    Pensionista[1].ValorPensao := '';
                    Pensionista[1].Valor13 := '';
                    Pensionista[2].Nome := '';
                    Pensionista[2].CPF := '';
                    Pensionista[2].ValorPensao := '';
                    Pensionista[2].Valor13 := '';
                    Pensionista[3].Nome := '';
                    Pensionista[3].CPF := '';
                    Pensionista[3].ValorPensao := '';
                    Pensionista[3].Valor13 := '';
                  End;
                2: Begin
                    Func1.CPF := CtrlInformeRendimentos.FormataCPF(CPF);
                    Func1.Nome := NomeBene;
                    Func1.TotalRendimentos := sVal301;
                    Func1.Contribuicao := sVal302;
                    Func1.Contribuicao1 := sVal303;
                    Func1.PensaoAlimenticia := sVal304;
                    Func1.ImpostoRenda := sVal305;
                    Func1.ParcelaIsentaProventos := sVal401;
                    Func1.DiariasAjudas := sVal402;
                    Func1.PensaoProventos := sVal403;
                    Func1.LucroDividendo := sVal404;
                    Func1.ValoresPagos := sVal405;
                    Func1.Indenizacoes := sVal406;
                    Func1.Outros := sVal407;
                    Func1.DecimoTerceiro := sVal501;
                    Func1.Outros2 := sVal502;
                    Func1.Matricula := cdsMatLocFunc.fieldByname('MATRICULA').Asstring;
                    Func1.UnidadeLocacao := cdsMatLocFunc.fieldByname('NOME').Asstring;
                    Func1.Endereco := sENDEREO;
                    Func1.Bairro := sBAIRRO;
                    Func1.Municipio := sNOME;
                    Func1.UF := sUF;
                    Func1.Cep := sCEP;
                    Func1.IrFeriasExigibilidade := sVal605;
                    Func1.AbonoTribExigibilidade := sVal604;
                    Func1.CompIrDecJudcial := sVal603;
                    Func1.Pams := sVal601;
                    Func1.DevolucaoPams := sVal602;
                    Func1.DesCodNatureza := sDesCodNatureza;
                    Func1.Pensionista1.Nome := Pensionista[0].Nome;
                    Func1.Pensionista1.CPF := Pensionista[0].CPF;
                    Func1.Pensionista1.ValorPensao := Pensionista[0].ValorPensao;
                    Func1.Pensionista1.Valor13 := Pensionista[0].Valor13;
                    Func1.Pensionista2.Nome := Pensionista[1].Nome;
                    Func1.Pensionista2.CPF := Pensionista[1].CPF;
                    Func1.Pensionista2.ValorPensao := Pensionista[1].ValorPensao;
                    Func1.Pensionista2.Valor13 := Pensionista[1].Valor13;
                    Func1.Pensionista3.Nome := Pensionista[2].Nome;
                    Func1.Pensionista3.CPF := Pensionista[2].CPF;
                    Func1.Pensionista3.ValorPensao := Pensionista[2].ValorPensao;
                    Func1.Pensionista3.Valor13 := Pensionista[2].Valor13;
                    Func1.Pensionista4.Nome := Pensionista[3].Nome;
                    Func1.Pensionista4.CPF := Pensionista[3].CPF;
                    Func1.Pensionista4.ValorPensao := Pensionista[3].ValorPensao;
                    Func1.Pensionista4.Valor13 := Pensionista[3].Valor13;
                    Pensionista[0].Nome := '';
                    Pensionista[0].CPF := '';
                    Pensionista[0].ValorPensao := '';
                    Pensionista[0].Valor13 := '';
                    Pensionista[1].Nome := '';
                    Pensionista[1].CPF := '';
                    Pensionista[1].ValorPensao := '';
                    Pensionista[1].Valor13 := '';
                    Pensionista[2].Nome := '';
                    Pensionista[2].CPF := '';
                    Pensionista[2].ValorPensao := '';
                    Pensionista[2].Valor13 := '';
                    Pensionista[3].Nome := '';
                    Pensionista[3].CPF := '';
                    Pensionista[3].ValorPensao := '';
                    Pensionista[3].Valor13 := '';
                  End;
              End;

              If (ContFunc = 2) Or (cdsDados.eof) Then
                Begin
                  //Layout do informe - Cabeçalho  - impressora xerox
                  writeln(ArquivoTexto, '%!PS');
                  writeln(ArquivoTexto, '%XRXrequirements:duplex');
                  writeln(ArquivoTexto, '/cm {72 mul 2.545 div} def');
                  writeln(ArquivoTexto, '(/var/spool/Comprovante.prn_dir/Comprovante.prn.p00000001.tif) GetTiff');
                  writeln(ArquivoTexto, '/Courier 7 selectfont');
                  writeln(ArquivoTexto, '595 0 translate');
                  writeln(ArquivoTexto, '90 rotate');
                  writeln(ArquivoTexto, '2.6 cm 17.0 cm moveto');
                  writeln(ArquivoTexto, '(FUNDACAO DOS ECONOMIARIOS FEDERAIS) show');
                  writeln(ArquivoTexto, '10.6 cm 17.0 cm moveto');
                  writeln(ArquivoTexto, '(00.436.923/0001-90) show');
                  writeln(ArquivoTexto, '17.6 cm 17.0 cm moveto');
                  writeln(ArquivoTexto, '(FUNDACAO DOS ECONOMIARIOS FEDERAIS) show');
                  writeln(ArquivoTexto, '25.3 cm 17.0 cm moveto');
                  writeln(ArquivoTexto, '(00.436.923/0001-90) show');
                  writeln(ArquivoTexto, '2.6 cm 16.5 cm moveto');
                  writeln(ArquivoTexto, '(ASA NORTE) show');
                  writeln(ArquivoTexto, '17.6 cm 16.5 cm moveto');
                  writeln(ArquivoTexto, '(ASA NORTE) show');
                  writeln(ArquivoTexto, '2.6 cm 16.0 cm moveto');
                  writeln(ArquivoTexto, '(BRASILIA) show');
                  writeln(ArquivoTexto, '9.1 cm 16.0 cm moveto');
                  writeln(ArquivoTexto, '(DF) show');
                  writeln(ArquivoTexto, '10.6 cm 16.0 cm moveto');
                  writeln(ArquivoTexto, '(( XX61 ) 329-1700) show');
                  writeln(ArquivoTexto, '17.6 cm 16.0 cm moveto');
                  writeln(ArquivoTexto, '(BRASILIA) show');
                  writeln(ArquivoTexto, '24.0 cm 16.0 cm moveto');
                  writeln(ArquivoTexto, '(DF) show');
                  writeln(ArquivoTexto, '25.4 cm 16.0 cm moveto');
                  writeln(ArquivoTexto, '(( XX61 ) 329-1700) show');
                  //Layout do informe - impressora Xerox
                  ContFunc := 0; //zera o contador de funcionários
                  writeln(ArquivoTexto, '2.0 cm 14.85 cm moveto');
                  writeln(ArquivoTexto, '(' + Func.CPF + ') show'); //CPF do empregado
                  writeln(ArquivoTexto, '5.6 cm 14.85 cm moveto');
                  writeln(ArquivoTexto, '(' + Func.Nome + ') show'); //Nome do empregado
                  writeln(ArquivoTexto, '16.8 cm 14.85 cm moveto');
                  writeln(ArquivoTexto, '(' + Func1.CPF + ') show'); //CPF do empregado
                  writeln(ArquivoTexto, '20.4 cm 14.85 cm moveto');
                  writeln(ArquivoTexto, '(' + Func1.Nome + ') show'); //Nome do empregado
                  writeln(ArquivoTexto, '2.6 cm 14.3 cm moveto');
                  writeln(arquivoTexto, '(' + Func.DesCodNatureza + ') show'); //natureza do rendimento
                  writeln(ArquivoTexto, '17.6 cm 14.3 cm moveto');
                  writeln(arquivoTexto, '(' + Func1.DesCodNatureza + ') show'); //natureza do rendimento
                  writeln(ArquivoTexto, '11.7 cm 13.3 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.TotalRendimentos) + ') show'); //total dos rendimentos(Inclusive férias)
                  writeln(ArquivoTexto, '26.6 cm 13.3 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.TotalRendimentos) + ') show'); //total dos rendimentos(Inclusive férias)
                  writeln(ArquivoTexto, '11.7 cm 12.8 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Contribuicao) + ') show'); //contribuição  previdenciaria
                  writeln(ArquivoTexto, '26.6 cm 12.8 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Contribuicao) + ') show'); //contribuição  previdenciaria
                  writeln(ArquivoTexto, '11.7 cm 12.3 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Contribuicao1) + ') show'); //contribuição a previdêcia privada
                  writeln(ArquivoTexto, '26.6 cm 12.3 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Contribuicao1) + ') show'); //contribuição a previdêcia privada
                  writeln(ArquivoTexto, '11.7 cm 11.8 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.PensaoAlimenticia) + ') show'); //pensão alimentícia
                  writeln(ArquivoTexto, '26.6 cm 11.8 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.PensaoAlimenticia) + ') show'); //pensão alimentícia
                  writeln(ArquivoTexto, '11.7 cm 11.3 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.ImpostoRenda) + ') show'); //imposto retido na fonte
                  writeln(ArquivoTexto, '26.6 cm 11.3 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.ImpostoRenda) + ') show'); //imposto retido na fonte
                  writeln(ArquivoTexto, '11.7 cm 10.15 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.ParcelaIsentaProventos) + ') show'); //parcela isenta dos proventos
                  writeln(ArquivoTexto, '26.6 cm 10.15 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.ParcelaIsentaProventos) + ') show'); //parcela isenta dos proventos
                  writeln(Arquivotexto, '11.7 cm 9.6 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.DiariasAjudas) + ') show'); //diarias e ajudas
                  writeln(ArquivoTexto, '26.6 cm 9.6 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.DiariasAjudas) + ') show'); //diarias e ajudas
                  writeln(ArquivoTexto, '11.7 cm 9.2 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.PensaoProventos) + ') show'); //pensão e proventos
                  writeln(ArquivoTexto, '26.6 cm 9.2 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.PensaoProventos) + ') show'); //pensão e proventos
                  writeln(ArquivoTexto, '11.7 cm 8.6 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.LucroDividendo) + ') show'); //lucro e dividendo
                  writeln(ArquivoTexto, '26.6 cm 8.6 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.LucroDividendo) + ') show'); //lucro e dividendo
                  writeln(ArquivoTexto, '11.7 cm 8.05 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.ValoresPagos) + ') show'); //Valores pagos
                  writeln(ArquivoTexto, '26.6 cm 8.05 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.ValoresPagos) + ') show'); //Valores pagos
                  writeln(ArquivoTexto, '11.7 cm 7.4 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Indenizacoes) + ') show'); //indenizações
                  writeln(ArquivoTexto, '26.6 cm 7.4 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Indenizacoes) + ') show'); //indenizações
                  writeln(ArquivoTexto, '11.7 cm 7.0 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Outros) + ') show'); //outros
                  writeln(ArquivoTexto, '26.6 cm 7.0 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Outros) + ') show'); //outros
                  writeln(ArquivoTexto, '11.7 cm 5.95 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.DecimoTerceiro) + ') show'); //décimo terceiro salário
                  writeln(ArquivoTexto, '26.6 cm 5.95 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.DecimoTerceiro) + ') show'); //décimo terceiro salário
                  writeln(ArquivoTexto, '11.7 cm 5.5 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Outros2) + ') show'); //outros
                  writeln(ArquivoTexto, '26.6 cm 5.5 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Outros2) + ') show'); //outros
                  writeln(ArquivoTexto, '1.5 cm 4.3 cm moveto');

                  If Trim(Func.Pensionista1.Nome) <> '' Then
                    writeln(ArquivoTexto, '(' + Func.Pensionista1.Nome + ' ' + Func.Pensionista1.CPF + ' Total Ren.: ' + Func.Pensionista1.ValorPensao + ' 13. ' + Func.Pensionista1.Valor13 + ') show') //informações complementares (6) beneficiário1
                  Else
                    writeln(ArquivoTexto, '(' + Func.Pensionista1.Nome + ' ' + Func.Pensionista1.CPF + ' ' + Func.Pensionista1.ValorPensao + ' ' + Func.Pensionista1.Valor13 + ') show'); //informações complementares (6) beneficiário1

                  writeln(ArquivoTexto, '11.7 cm 4.3 cm moveto');
                  writeln(ArquivoTexto, '() show'); // informações complementares (6) beneficiário2
                  writeln(ArquivoTexto, '16.8 cm 4.3 cm moveto');

                  If Trim(Func1.Pensionista1.Nome) <> '' Then
                    writeln(ArquivoTexto, '(' + Func1.Pensionista1.Nome + ' ' + Func1.Pensionista1.CPF + ' Total Ren.: ' + Func1.Pensionista1.ValorPensao + ' 13. ' + Func1.Pensionista1.Valor13 + ') show') //informações complementares (6) beneficiário1
                  Else
                    writeln(ArquivoTexto, '(' + Func1.Pensionista1.Nome + ' ' + Func1.Pensionista1.CPF + ' ' + Func1.Pensionista1.ValorPensao + ' ' + Func1.Pensionista1.Valor13 + ') show'); //informações complementares (6) beneficiário1

                  writeln(ArquivoTexto, '26.6 cm 4.3 cm moveto');
                  writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                  writeln(ArquivoTexto, '1.5 cm 4 cm moveto');

                  If Trim(Func.Pensionista2.Nome) <> '' Then
                    writeln(ArquivoTexto, '(' + Func.Pensionista2.Nome + ' ' + Func.Pensionista2.CPF + ' Total Ren.: ' + Func.Pensionista2.ValorPensao + ' 13.  ' + Func.Pensionista2.Valor13 + ') show') //informações complementares (6) beneficiário1
                  Else
                    writeln(ArquivoTexto, '(' + Func.Pensionista2.Nome + ' ' + Func.Pensionista2.CPF + ' ' + Func.Pensionista2.ValorPensao + ' ' + Func.Pensionista2.Valor13 + ') show'); //informações complementares (6) beneficiário1

                  writeln(ArquivoTexto, '11.7 cm 4 cm moveto');
                  writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                  writeln(ArquivoTexto, '16.8 cm 4 cm moveto');

                  If Trim(Func1.Pensionista2.Nome) <> '' Then
                    writeln(ArquivoTexto, '(' + Func1.Pensionista2.Nome + ' ' + Func1.Pensionista2.CPF + ' Total Ren.: ' + Func1.Pensionista2.ValorPensao + ' 13. ' + Func1.Pensionista2.Valor13 + ') show') //informações complementares (6) beneficiário1
                  Else
                    writeln(ArquivoTexto, '(' + Func1.Pensionista2.Nome + ' ' + Func1.Pensionista2.CPF + ' ' + Func1.Pensionista2.ValorPensao + ' ' + Func1.Pensionista2.Valor13 + ') show'); //informações complementares (6) beneficiário1

                  writeln(ArquivoTexto, '26.2 cm 4 cm moveto');
                  writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                  writeln(ArquivoTexto, '1.5 cm 3.7 cm moveto');

                  If Trim(Func.Pensionista3.Nome) <> '' Then
                    writeln(ArquivoTexto, '(' + Func.Pensionista3.Nome + ' ' + Func.Pensionista3.CPF + ' Total Ren.: ' + Func.Pensionista3.ValorPensao + ' 13. ' + Func.Pensionista3.Valor13 + ') show') //informações complementares (6) beneficiário1
                  Else
                    writeln(ArquivoTexto, '(' + Func.Pensionista3.Nome + ' ' + Func.Pensionista3.CPF + ' ' + Func.Pensionista3.ValorPensao + ' ' + Func.Pensionista3.Valor13 + ') show'); //informações complementares (6) beneficiário1

                  writeln(ArquivoTexto, '11.3 cm 3.7 cm moveto');
                  writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                  writeln(ArquivoTexto, '16.55 cm 3.7 cm moveto');

                  If Trim(Func1.Pensionista3.Nome) <> '' Then
                    writeln(ArquivoTexto, '(' + Func1.Pensionista3.Nome + ' ' + Func1.Pensionista3.CPF + ' Total Ren.: ' + Func1.Pensionista3.ValorPensao + ' 13. ' + Func1.Pensionista3.Valor13 + ') show') //informações complementares (6) beneficiário1
                  Else
                    writeln(ArquivoTexto, '(' + Func1.Pensionista3.Nome + ' ' + Func1.Pensionista3.CPF + ' ' + Func1.Pensionista3.ValorPensao + ' ' + Func1.Pensionista3.Valor13 + ') show'); //informações complementares (6) beneficiário1

                  writeln(ArquivoTexto, '26.2 cm 3.7 cm moveto');
                  writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                  writeln(ArquivoTexto, '1.5 cm 3.4 cm moveto');

                  If Trim(Func.Pensionista4.Nome) <> '' Then
                    writeln(ArquivoTexto, '(' + Func.Pensionista4.Nome + ' ' + Func.Pensionista4.CPF + ' Total Ren.: ' + Func.Pensionista4.ValorPensao + ' 13. ' + Func.Pensionista4.Valor13 + ') show') //informações complementares (6) beneficiário1
                  Else
                    writeln(ArquivoTexto, '(' + Func.Pensionista4.Nome + ' ' + Func.Pensionista4.CPF + ' ' + Func.Pensionista4.ValorPensao + ' ' + Func.Pensionista4.Valor13 + ') show'); //informações complementares (6) beneficiário1

                  writeln(ArquivoTexto, '11.3 cm 3.4 cm moveto');
                  writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                  writeln(ArquivoTexto, '16.55 cm 3.4 cm moveto');

                  If Trim(Func1.Pensionista4.Nome) <> '' Then
                    writeln(ArquivoTexto, '(' + Func1.Pensionista4.Nome + ' ' + Func1.Pensionista4.CPF + ' Total Ren.: ' + Func1.Pensionista4.ValorPensao + ' 13. ' + Func1.Pensionista4.Valor13 + ') show') //informações complementares (6) beneficiário1
                  Else
                    writeln(ArquivoTexto, '(' + Func1.Pensionista4.Nome + ' ' + Func1.Pensionista4.CPF + ' ' + Func1.Pensionista4.ValorPensao + ' ' + Func1.Pensionista4.Valor13 + ') show'); //informações complementares (6) beneficiário1

                  writeln(ArquivoTexto, '26.2 cm 3.4 cm moveto');
                  writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2

                  //CPrev - Pend. 27331 - 12/02/2008 - Início
                  writeln(ArquivoTexto, '11.7 cm 3.5 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.AbonoTribExigibilidade) + ') show');
                  writeln(ArquivoTexto, '26.6 cm 3.5 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.AbonoTribExigibilidade) + ') show');
                  //CPrev - Pend. 27331 - 12/02/2008 - Fim

                  writeln(ArquivoTexto, '11.7 cm 3.2 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.CompIrDecJudcial) + ') show');
                  writeln(ArquivoTexto, '26.6 cm 3.2 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.CompIrDecJudcial) + ') show');
                  writeln(ArquivoTexto, '11.7 cm 2.9 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Pams) + ') show');
                  writeln(ArquivoTexto, '26.6 cm 2.9 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Pams) + ') show');
                  writeln(ArquivoTexto, '11.7 cm 2.6 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.DevolucaoPams) + ') show');
                  writeln(ArquivoTexto, '26.6 cm 2.6 cm moveto');
                  writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.DevolucaoPams) + ') show');
                  writeln(ArquivoTexto, '2.6 cm 1.5 cm moveto');
                  writeln(ArquivoTexto, '(' + edtNome.text + ') show'); //nome do responsável
                  writeln(ArquivoTexto, '11.7 cm 1.5 cm moveto');
                  writeln(ArquivoTexto, '(' + dtdtdata.text + ') show'); //data de geração
                  writeln(ArquivoTexto, '17.6 cm 1.5 cm moveto');
                  writeln(ArquivoTexto, '(' + edtNome.text + ') show'); //nome do responsável
                  writeln(ArquivoTexto, '26.6 cm 1.5 cm moveto');
                  writeln(ArquivoTexto, '(' + dtdtdata.text + ') show'); //data de geração
                  writeln(ArquivoTexto, 'showpage');
                  writeln(ArquivoTexto, '(/var/spool/Comprovante.prn_dir/Comprovante.prn.p00000002.tif) GetTiff');
                  writeln(ArquivoTexto, '/Courier 7 selectfont');
                  writeln(ArquivoTexto, '595 0 translate');
                  writeln(ArquivoTexto, '90 rotate');
                  writeln(ArquivoTexto, '10.9 cm 11.55 cm moveto');
                  writeln(ArquivoTexto, '(' + edtData.text + ') show');
                  writeln(ArquivoTexto, '25.8 cm 11.55 cm moveto');
                  writeln(ArquivoTexto, '(' + edtData.text + ') show');
                  writeln(ArquivoTexto, '1.6 cm 7.95 cm moveto');
                  writeln(ArquivoTexto, '(' + Func.Nome + ') show'); //Nome do empregado
                  writeln(ArquivoTexto, '10.8 cm 7.95 cm moveto');
                  writeln(ArquivoTexto, '(' + Func.Matricula + ') show'); //matricula do empregado
                  writeln(ArquivoTexto, '16.5 cm 7.95 cm moveto');
                  writeln(ArquivoTexto, '(' + Func1.Nome + ') show'); //Nome do empregado
                  writeln(ArquivoTexto, '25.8 cm 7.95 cm moveto');
                  writeln(ArquivoTexto, '(' + Func1.Matricula + ') show'); //matricula do empregado
                  writeln(ArquivoTexto, '1.6 cm 7.3 cm moveto');
                  writeln(ArquivoTexto, '(' + Func.UnidadeLocacao + ') show'); //unidade de alocaçào
                  writeln(ArquivoTexto, '10.8 cm 7.3 cm moveto');
                  writeln(ArquivoTexto, '() show'); //código de alocação
                  writeln(ArquivoTexto, '16.5 cm 7.3 cm moveto');
                  writeln(ArquivoTexto, '(' + Func1.UnidadeLocacao + ') show'); //unidade de alocaçào
                  writeln(ArquivoTexto, '25.8 cm 7.3 cm moveto');
                  writeln(ArquivoTexto, '() show'); //código de alocação
                  writeln(ArquivoTexto, '1.6 cm 6.65 cm moveto');
                  writeln(ArquivoTexto, '(' + Func.Endereco + ') show'); //endereço
                  writeln(ArquivoTexto, '9.9 cm 6.65 cm moveto');
                  writeln(ArquivoTexto, '(' + Func.Bairro + ') show'); // Bairro
                  writeln(ArquivoTexto, '16.5 cm 6.65 cm moveto');
                  writeln(ArquivoTexto, '(' + Func1.Endereco + ') show'); //endereço
                  writeln(ArquivoTexto, '24.9 cm 6.65 cm moveto');
                  writeln(ArquivoTexto, '(' + Func1.Bairro + ') show'); // Bairro
                  writeln(ArquivoTexto, '1.6 cm 5.95 cm moveto');
                  writeln(ArquivoTexto, '(' + Func.Municipio + ') show'); //munícipio
                  writeln(ArquivoTexto, '9.0 cm 5.95 cm moveto');
                  writeln(ArquivoTexto, '(' + Func.UF + ') show'); //Uf
                  writeln(ArquivoTexto, '9.9 cm 5.95 cm moveto');
                  writeln(ArquivoTexto, '(' + copy(Func.Cep, 1, 5) + '-' + copy(Func.Cep, 6, 3) + ') show'); // cep
                  writeln(ArquivoTexto, '16.5 cm 5.95 cm moveto');
                  writeln(ArquivoTexto, '(' + Func1.Municipio + ') show'); //munícipio
                  writeln(ArquivoTexto, '24.0 cm 5.95 cm moveto');
                  writeln(ArquivoTexto, '(' + Func1.UF + ') show'); //Uf
                  writeln(ArquivoTexto, '24.9 cm 5.95 cm moveto');
                  writeln(ArquivoTexto, '(' + copy(Func1.Cep, 1, 5) + '-' + copy(Func1.Cep, 6, 3) + ') show'); // cep
                  writeln(ArquivoTexto, 'showpage');
                  LimpaReg(Func);
                  LimpaReg(Func1);
                End;

              ContFunc := ContFunc + 1;

              cdsdados.Next;

              If cdsDados.EOF Then bImprime := False;

              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
              prgBarAtuFluxo.Update;

            End; //whlie qrydados interno

          cdsPensionista.First;

          For i := 0 To 3 Do
            Begin
              If Not cdsPensionista.eof Then
                Begin
                  Pensionista[i].Nome := cdsPensionista.fieldByname('NOME').AsString;
                  Pensionista[i].CPF := Trim(cdsPensionista.fieldByname('NUMDOCUMENTO').AsString);
                  Pensionista[i].ValorPensao := FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR').AsFloat);
                  cdsPensionista13.first;

                  If Not cdsPensionista13.fieldByname('IDFAVORECIDO').isnull Then
                    If cdsPensionista13.Locate('IDFAVORECIDO', VarArrayOf([cdsPensionista.fieldByname('IDFAVORECIDO').Asstring]), [loPartialKey]) Then
                      Pensionista[i].Valor13 := FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista13.fieldByname('VALOR').AsFloat)
                    Else
                      Pensionista[i].Valor13 := FormatFloat('#,##0.00;(#,##0.00)', 0);

                  cdsPensionista.Next;
                End;
            End;

          //pega os dados de até 4 pensionistas

          //CPrev - 27341 - Inicio
          // Paulo Nobre SOL 268555 PPM 1262100
          If (rIdPessoa <> -1) Then //cdsdados.FieldByName('IDPESSOA').AsFloat) Then
            ContFunc := ContFunc - 1
          Else
            If cds.EOF Then ContFunc := 0;
          //CPrev - 27341 - Fim

          //2º passagem
          Case ContFunc Of
            1: Begin
                //limpar o record
                Func.CPF := CtrlInformeRendimentos.FormataCPF(CPF);
                Func.Nome := NomeBene;
                Func.TotalRendimentos := sVal301;
                Func.Contribuicao := sVal302;
                Func.Contribuicao1 := sVal303;
                Func.PensaoAlimenticia := sVal304;
                Func.ImpostoRenda := sVal305;
                Func.ParcelaIsentaProventos := sVal401;
                Func.DiariasAjudas := sVal402;
                Func.PensaoProventos := sVal403;
                Func.LucroDividendo := sVal404;
                Func.ValoresPagos := sVal405;
                Func.Indenizacoes := sVal406;
                Func.Outros := sVal407;
                Func.DecimoTerceiro := sVal501;
                Func.Outros2 := sVal502;
                Func.Matricula := cdsMatLocFunc.fieldByname('MATRICULA').Asstring;
                Func.UnidadeLocacao := cdsMatLocFunc.fieldByname('NOME').Asstring;
                Func.Endereco := sENDEREO;
                Func.Bairro := sBAIRRO;
                Func.Municipio := sNOME;
                Func.UF := sUF;
                Func.Cep := sCEP;
                Func.Pams := sVal601;
                Func.DevolucaoPams := sVal602;
                Func.IrFeriasExigibilidade := sVal605;
                Func.AbonoTribExigibilidade := sVal604;
                Func.CompIrDecJudcial := sVal603;
                Func.Pensionista1.Nome := Pensionista[0].Nome;
                Func.Pensionista1.CPF := Pensionista[0].CPF;
                Func.Pensionista1.ValorPensao := Pensionista[0].ValorPensao;
                Func.Pensionista1.Valor13 := Pensionista[0].Valor13;
                Func.Pensionista2.Nome := Pensionista[1].Nome;
                Func.Pensionista2.CPF := Pensionista[1].CPF;
                Func.Pensionista2.ValorPensao := Pensionista[1].ValorPensao;
                Func.Pensionista2.Valor13 := Pensionista[1].Valor13;
                Func.Pensionista3.Nome := Pensionista[2].Nome;
                Func.Pensionista3.CPF := Pensionista[2].CPF;
                Func.Pensionista3.ValorPensao := Pensionista[2].ValorPensao;
                Func.Pensionista3.Valor13 := Pensionista[2].Valor13;
                Func.Pensionista4.Nome := Pensionista[3].Nome;
                Func.Pensionista4.CPF := Pensionista[3].CPF;
                Func.Pensionista4.ValorPensao := Pensionista[3].ValorPensao;
                Func.Pensionista4.Valor13 := Pensionista[3].Valor13;
                Func.DesCodNatureza := sDesCodNatureza;
                Pensionista[0].Nome := '';
                Pensionista[0].CPF := '';
                Pensionista[0].ValorPensao := '';
                Pensionista[0].Valor13 := '';
                Pensionista[1].Nome := '';
                Pensionista[1].CPF := '';
                Pensionista[1].ValorPensao := '';
                Pensionista[1].Valor13 := '';
                Pensionista[2].Nome := '';
                Pensionista[2].CPF := '';
                Pensionista[2].ValorPensao := '';
                Pensionista[2].Valor13 := '';
                Pensionista[3].Nome := '';
                Pensionista[3].CPF := '';
                Pensionista[3].ValorPensao := '';
                Pensionista[3].Valor13 := '';
              End;
            2: Begin
                Func1.CPF := CtrlInformeRendimentos.FormataCPF(CPF);
                Func1.Nome := NomeBene;
                Func1.TotalRendimentos := sVal301;
                Func1.Contribuicao := sVal302;
                Func1.Contribuicao1 := sVal303;
                Func1.PensaoAlimenticia := sVal304;
                Func1.ImpostoRenda := sVal305;
                Func1.ParcelaIsentaProventos := sVal401;
                Func1.DiariasAjudas := sVal402;
                Func1.PensaoProventos := sVal403;
                Func1.LucroDividendo := sVal404;
                Func1.ValoresPagos := sVal405;
                Func1.Indenizacoes := sVal406;
                Func1.Outros := sVal407;
                Func1.DecimoTerceiro := sVal501;
                Func1.Outros2 := sVal502;
                Func1.Matricula := cdsMatLocFunc.fieldByname('MATRICULA').Asstring;
                Func1.UnidadeLocacao := cdsMatLocFunc.fieldByname('NOME').Asstring;
                Func1.Endereco := sENDEREO;
                Func1.Bairro := sBAIRRO;
                Func1.Municipio := sNOME;
                Func1.UF := sUF;
                Func1.Cep := sCEP;
                Func1.IrFeriasExigibilidade := sVal605;
                Func1.AbonoTribExigibilidade := sVal604;
                Func1.CompIrDecJudcial := sVal603;
                Func1.Pams := sVal601;
                Func1.DevolucaoPams := sVal602;
                Func1.DesCodNatureza := sDesCodNatureza;
                Func1.Pensionista1.Nome := Pensionista[0].Nome;
                Func1.Pensionista1.CPF := Pensionista[0].CPF;
                Func1.Pensionista1.ValorPensao := Pensionista[0].ValorPensao;
                Func1.Pensionista1.Valor13 := Pensionista[0].Valor13;
                Func1.Pensionista2.Nome := Pensionista[1].Nome;
                Func1.Pensionista2.CPF := Pensionista[1].CPF;
                Func1.Pensionista2.ValorPensao := Pensionista[1].ValorPensao;
                Func1.Pensionista2.Valor13 := Pensionista[1].Valor13;
                Func1.Pensionista3.Nome := Pensionista[2].Nome;
                Func1.Pensionista3.CPF := Pensionista[2].CPF;
                Func1.Pensionista3.ValorPensao := Pensionista[2].ValorPensao;
                Func1.Pensionista3.Valor13 := Pensionista[2].Valor13;
                Func1.Pensionista4.Nome := Pensionista[3].Nome;
                Func1.Pensionista4.CPF := Pensionista[3].CPF;
                Func1.Pensionista4.ValorPensao := Pensionista[3].ValorPensao;
                Func1.Pensionista4.Valor13 := Pensionista[3].Valor13;
                Pensionista[0].Nome := '';
                Pensionista[0].CPF := '';
                Pensionista[0].ValorPensao := '';
                Pensionista[0].Valor13 := '';
                Pensionista[1].Nome := '';
                Pensionista[1].CPF := '';
                Pensionista[1].ValorPensao := '';
                Pensionista[1].Valor13 := '';
                Pensionista[2].Nome := '';
                Pensionista[2].CPF := '';
                Pensionista[2].ValorPensao := '';
                Pensionista[2].Valor13 := '';
                Pensionista[3].Nome := '';
                Pensionista[3].CPF := '';
                Pensionista[3].ValorPensao := '';
                Pensionista[3].Valor13 := '';
              End;
          End;

          If (ContFunc = 2) Or (cdsDados.eof) Then
            Begin
              //Layout do informe - Cabeçalho  - impressora xerox
              writeln(ArquivoTexto, '%!PS');
              writeln(ArquivoTexto, '%XRXrequirements:duplex');
              writeln(ArquivoTexto, '/cm {72 mul 2.545 div} def');
              writeln(ArquivoTexto, '(/var/spool/Comprovante.prn_dir/Comprovante.prn.p00000001.tif) GetTiff');
              writeln(ArquivoTexto, '/Courier 7 selectfont');
              writeln(ArquivoTexto, '595 0 translate');
              writeln(ArquivoTexto, '90 rotate');
              writeln(ArquivoTexto, '2.6 cm 17.0 cm moveto');
              writeln(ArquivoTexto, '(FUNDACAO DOS ECONOMIARIOS FEDERAIS) show');
              writeln(ArquivoTexto, '10.6 cm 17.0 cm moveto');
              writeln(ArquivoTexto, '(00.436.923/0001-90) show');
              writeln(ArquivoTexto, '17.6 cm 17.0 cm moveto');
              writeln(ArquivoTexto, '(FUNDACAO DOS ECONOMIARIOS FEDERAIS) show');
              writeln(ArquivoTexto, '25.3 cm 17.0 cm moveto');
              writeln(ArquivoTexto, '(00.436.923/0001-90) show');
              writeln(ArquivoTexto, '2.6 cm 16.5 cm moveto');
              writeln(ArquivoTexto, '(ASA NORTE) show');
              writeln(ArquivoTexto, '17.6 cm 16.5 cm moveto');
              writeln(ArquivoTexto, '(ASA NORTE) show');
              writeln(ArquivoTexto, '2.6 cm 16.0 cm moveto');
              writeln(ArquivoTexto, '(BRASILIA) show');
              writeln(ArquivoTexto, '9.1 cm 16.0 cm moveto');
              writeln(ArquivoTexto, '(DF) show');
              writeln(ArquivoTexto, '10.6 cm 16.0 cm moveto');
              writeln(ArquivoTexto, '(( XX61 ) 329-1700) show');
              writeln(ArquivoTexto, '17.6 cm 16.0 cm moveto');
              writeln(ArquivoTexto, '(BRASILIA) show');
              writeln(ArquivoTexto, '24.0 cm 16.0 cm moveto');
              writeln(ArquivoTexto, '(DF) show');
              writeln(ArquivoTexto, '25.4 cm 16.0 cm moveto');
              writeln(ArquivoTexto, '(( XX61 ) 329-1700) show');
              //Layout do informe - impressora Xerox
              ContFunc := 0; //zera o contador de funcionários
              writeln(ArquivoTexto, '2.0 cm 14.85 cm moveto');
              writeln(ArquivoTexto, '(' + Func.CPF + ') show'); //CPF do empregado
              writeln(ArquivoTexto, '5.6 cm 14.85 cm moveto');
              writeln(ArquivoTexto, '(' + Func.Nome + ') show'); //Nome do empregado
              writeln(ArquivoTexto, '16.8 cm 14.85 cm moveto');
              writeln(ArquivoTexto, '(' + Func1.CPF + ') show'); //CPF do empregado
              writeln(ArquivoTexto, '20.4 cm 14.85 cm moveto');
              writeln(ArquivoTexto, '(' + Func1.Nome + ') show'); //Nome do empregado
              writeln(ArquivoTexto, '2.6 cm 14.3 cm moveto');
              writeln(arquivoTexto, '(' + Func.DesCodNatureza + ') show'); //natureza do rendimento
              writeln(ArquivoTexto, '17.6 cm 14.3 cm moveto');
              writeln(arquivoTexto, '(' + Func1.DesCodNatureza + ') show'); //natureza do rendimento
              writeln(ArquivoTexto, '11.7 cm 13.3 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.TotalRendimentos) + ') show'); //total dos rendimentos(Inclusive férias)
              writeln(ArquivoTexto, '26.6 cm 13.3 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.TotalRendimentos) + ') show'); //total dos rendimentos(Inclusive férias)
              writeln(ArquivoTexto, '11.7 cm 12.8 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Contribuicao) + ') show'); //contribuição  previdenciaria
              writeln(ArquivoTexto, '26.6 cm 12.8 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Contribuicao) + ') show'); //contribuição  previdenciaria
              writeln(ArquivoTexto, '11.7 cm 12.3 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Contribuicao1) + ') show'); //contribuição a previdêcia privada
              writeln(ArquivoTexto, '26.6 cm 12.3 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Contribuicao1) + ') show'); //contribuição a previdêcia privada
              writeln(ArquivoTexto, '11.7 cm 11.8 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.PensaoAlimenticia) + ') show'); //pensão alimentícia
              writeln(ArquivoTexto, '26.6 cm 11.8 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.PensaoAlimenticia) + ') show'); //pensão alimentícia
              writeln(ArquivoTexto, '11.7 cm 11.3 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.ImpostoRenda) + ') show'); //imposto retido na fonte
              writeln(ArquivoTexto, '26.6 cm 11.3 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.ImpostoRenda) + ') show'); //imposto retido na fonte
              writeln(ArquivoTexto, '11.7 cm 10.15 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.ParcelaIsentaProventos) + ') show'); //parcela isenta dos proventos
              writeln(ArquivoTexto, '26.6 cm 10.15 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.ParcelaIsentaProventos) + ') show'); //parcela isenta dos proventos
              writeln(Arquivotexto, '11.7 cm 9.6 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.DiariasAjudas) + ') show'); //diarias e ajudas
              writeln(ArquivoTexto, '26.6 cm 9.6 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.DiariasAjudas) + ') show'); //diarias e ajudas
              writeln(ArquivoTexto, '11.7 cm 9.2 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.PensaoProventos) + ') show'); //pensão e proventos
              writeln(ArquivoTexto, '26.6 cm 9.2 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.PensaoProventos) + ') show'); //pensão e proventos
              writeln(ArquivoTexto, '11.7 cm 8.6 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.LucroDividendo) + ') show'); //lucro e dividendo
              writeln(ArquivoTexto, '26.6 cm 8.6 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.LucroDividendo) + ') show'); //lucro e dividendo
              writeln(ArquivoTexto, '11.7 cm 8.05 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.ValoresPagos) + ') show'); //Valores pagos
              writeln(ArquivoTexto, '26.6 cm 8.05 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.ValoresPagos) + ') show'); //Valores pagos
              writeln(ArquivoTexto, '11.7 cm 7.4 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Indenizacoes) + ') show'); //indenizações
              writeln(ArquivoTexto, '26.6 cm 7.4 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Indenizacoes) + ') show'); //indenizações
              writeln(ArquivoTexto, '11.7 cm 7.0 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Outros) + ') show'); //outros
              writeln(ArquivoTexto, '26.6 cm 7.0 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Outros) + ') show'); //outros
              writeln(ArquivoTexto, '11.7 cm 5.95 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.DecimoTerceiro) + ') show'); //décimo terceiro salário
              writeln(ArquivoTexto, '26.6 cm 5.95 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.DecimoTerceiro) + ') show'); //décimo terceiro salário
              writeln(ArquivoTexto, '11.7 cm 5.5 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Outros2) + ') show'); //outros
              writeln(ArquivoTexto, '26.6 cm 5.5 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Outros2) + ') show'); //outros
              writeln(ArquivoTexto, '1.5 cm 4.3 cm moveto');

              If Trim(Func.Pensionista1.Nome) <> '' Then
                writeln(ArquivoTexto, '(' + Func.Pensionista1.Nome + ' ' + Func.Pensionista1.CPF + ' Total Ren.: ' + Func.Pensionista1.ValorPensao + ' 13. ' + Func.Pensionista1.Valor13 + ') show') //informações complementares (6) beneficiário1
              Else
                writeln(ArquivoTexto, '(' + Func.Pensionista1.Nome + ' ' + Func.Pensionista1.CPF + ' ' + Func.Pensionista1.ValorPensao + ' ' + Func.Pensionista1.Valor13 + ') show'); //informações complementares (6) beneficiário1

              writeln(ArquivoTexto, '11.7 cm 4.3 cm moveto');
              writeln(ArquivoTexto, '() show'); // informações complementares (6) beneficiário2
              writeln(ArquivoTexto, '16.8 cm 4.3 cm moveto');

              If Trim(Func1.Pensionista1.Nome) <> '' Then
                writeln(ArquivoTexto, '(' + Func1.Pensionista1.Nome + ' ' + Func1.Pensionista1.CPF + ' Total Ren.: ' + Func1.Pensionista1.ValorPensao + ' 13. ' + Func1.Pensionista1.Valor13 + ') show') //informações complementares (6) beneficiário1
              Else
                writeln(ArquivoTexto, '(' + Func1.Pensionista1.Nome + ' ' + Func1.Pensionista1.CPF + ' ' + Func1.Pensionista1.ValorPensao + ' ' + Func1.Pensionista1.Valor13 + ') show'); //informações complementares (6) beneficiário1

              writeln(ArquivoTexto, '26.6 cm 4.3 cm moveto');
              writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
              writeln(ArquivoTexto, '1.5 cm 4 cm moveto'); //

              If Trim(Func.Pensionista2.Nome) <> '' Then
                writeln(ArquivoTexto, '(' + Func.Pensionista2.Nome + ' ' + Func.Pensionista2.CPF + ' Total Ren.: ' + Func.Pensionista2.ValorPensao + ' 13.  ' + Func.Pensionista2.Valor13 + ') show') //informações complementares (6) beneficiário1
              Else
                writeln(ArquivoTexto, '(' + Func.Pensionista2.Nome + ' ' + Func.Pensionista2.CPF + ' ' + Func.Pensionista2.ValorPensao + ' ' + Func.Pensionista2.Valor13 + ') show'); //informações complementares (6) beneficiário1

              writeln(ArquivoTexto, '11.7 cm 4 cm moveto');
              writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
              writeln(ArquivoTexto, '16.8 cm 4 cm moveto');

              If Trim(Func1.Pensionista2.Nome) <> '' Then
                writeln(ArquivoTexto, '(' + Func1.Pensionista2.Nome + ' ' + Func1.Pensionista2.CPF + ' Total Ren.: ' + Func1.Pensionista2.ValorPensao + ' 13. ' + Func1.Pensionista2.Valor13 + ') show') //informações complementares (6) beneficiário1
              Else
                writeln(ArquivoTexto, '(' + Func1.Pensionista2.Nome + ' ' + Func1.Pensionista2.CPF + ' ' + Func1.Pensionista2.ValorPensao + ' ' + Func1.Pensionista2.Valor13 + ') show'); //informações complementares (6) beneficiário1

              writeln(ArquivoTexto, '26.2 cm 4 cm moveto');
              writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
              writeln(ArquivoTexto, '1.5 cm 3.7 cm moveto');

              If Trim(Func.Pensionista3.Nome) <> '' Then
                writeln(ArquivoTexto, '(' + Func.Pensionista3.Nome + ' ' + Func.Pensionista3.CPF + ' Total Ren.: ' + Func.Pensionista3.ValorPensao + ' 13. ' + Func.Pensionista3.Valor13 + ') show') //informações complementares (6) beneficiário1
              Else
                writeln(ArquivoTexto, '(' + Func.Pensionista3.Nome + ' ' + Func.Pensionista3.CPF + ' ' + Func.Pensionista3.ValorPensao + ' ' + Func.Pensionista3.Valor13 + ') show'); //informações complementares (6) beneficiário1

              writeln(ArquivoTexto, '11.3 cm 3.7 cm moveto');
              writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
              writeln(ArquivoTexto, '16.55 cm 3.7 cm moveto');

              If Trim(Func1.Pensionista3.Nome) <> '' Then
                writeln(ArquivoTexto, '(' + Func1.Pensionista3.Nome + ' ' + Func1.Pensionista3.CPF + ' Total Ren.: ' + Func1.Pensionista3.ValorPensao + ' 13. ' + Func1.Pensionista3.Valor13 + ') show') //informações complementares (6) beneficiário1
              Else
                writeln(ArquivoTexto, '(' + Func1.Pensionista3.Nome + ' ' + Func1.Pensionista3.CPF + ' ' + Func1.Pensionista3.ValorPensao + ' ' + Func1.Pensionista3.Valor13 + ') show'); //informações complementares (6) beneficiário1

              writeln(ArquivoTexto, '26.2 cm 3.7 cm moveto');
              writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
              writeln(ArquivoTexto, '1.5 cm 3.4 cm moveto');

              If Trim(Func.Pensionista4.Nome) <> '' Then
                writeln(ArquivoTexto, '(' + Func.Pensionista4.Nome + ' ' + Func.Pensionista4.CPF + ' Total Ren.: ' + Func.Pensionista4.ValorPensao + ' 13. ' + Func.Pensionista4.Valor13 + ') show') //informações complementares (6) beneficiário1
              Else
                writeln(ArquivoTexto, '(' + Func.Pensionista4.Nome + ' ' + Func.Pensionista4.CPF + ' ' + Func.Pensionista4.ValorPensao + ' ' + Func.Pensionista4.Valor13 + ') show'); //informações complementares (6) beneficiário1

              writeln(ArquivoTexto, '11.3 cm 3.4 cm moveto');
              writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
              writeln(ArquivoTexto, '16.55 cm 3.4 cm moveto');

              If Trim(Func1.Pensionista4.Nome) <> '' Then
                writeln(ArquivoTexto, '(' + Func1.Pensionista4.Nome + ' ' + Func1.Pensionista4.CPF + ' Total Ren.: ' + Func1.Pensionista4.ValorPensao + ' 13. ' + Func1.Pensionista4.Valor13 + ') show') //informações complementares (6) beneficiário1
              Else
                writeln(ArquivoTexto, '(' + Func1.Pensionista4.Nome + ' ' + Func1.Pensionista4.CPF + ' ' + Func1.Pensionista4.ValorPensao + ' ' + Func1.Pensionista4.Valor13 + ') show'); //informações complementares (6) beneficiário1

              writeln(ArquivoTexto, '26.2 cm 3.4 cm moveto');
              writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2

              //CPrev - Pend. 27331 - 12/02/2008 - Início
              writeln(ArquivoTexto, '11.7 cm 3.5 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.AbonoTribExigibilidade) + ') show');
              writeln(ArquivoTexto, '26.6 cm 3.5 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.AbonoTribExigibilidade) + ') show');
              //CPrev - Pend. 27331 - 12/02/2008 - Fim

              writeln(ArquivoTexto, '11.7 cm 3.2 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.CompIrDecJudcial) + ') show');
              writeln(ArquivoTexto, '26.6 cm 3.2 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.CompIrDecJudcial) + ') show');
              writeln(ArquivoTexto, '11.7 cm 2.9 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.Pams) + ') show');
              writeln(ArquivoTexto, '26.6 cm 2.9 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.Pams) + ') show');
              writeln(ArquivoTexto, '11.7 cm 2.6 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func.DevolucaoPams) + ') show');
              writeln(ArquivoTexto, '26.6 cm 2.6 cm moveto');
              writeln(ArquivoTexto, '(' + CtrlInformeRendimentos.strEspacoEsquerda(10, Func1.DevolucaoPams) + ') show');
              writeln(ArquivoTexto, '2.6 cm 1.5 cm moveto');
              writeln(ArquivoTexto, '(' + edtNome.text + ') show'); //nome do responsável
              writeln(ArquivoTexto, '11.7 cm 1.5 cm moveto');
              writeln(ArquivoTexto, '(' + dtdtdata.text + ') show'); //data de geração
              writeln(ArquivoTexto, '17.6 cm 1.5 cm moveto');
              writeln(ArquivoTexto, '(' + edtNome.text + ') show'); //nome do responsável
              writeln(ArquivoTexto, '26.6 cm 1.5 cm moveto');
              writeln(ArquivoTexto, '(' + dtdtdata.text + ') show'); //data de geração
              writeln(ArquivoTexto, 'showpage');
              writeln(ArquivoTexto, '(/var/spool/Comprovante.prn_dir/Comprovante.prn.p00000002.tif) GetTiff');
              writeln(ArquivoTexto, '/Courier 7 selectfont');
              writeln(ArquivoTexto, '595 0 translate');
              writeln(ArquivoTexto, '90 rotate');
              writeln(ArquivoTexto, '10.9 cm 11.55 cm moveto');
              writeln(ArquivoTexto, '(' + edtData.text + ') show');
              writeln(ArquivoTexto, '25.8 cm 11.55 cm moveto');
              writeln(ArquivoTexto, '(' + edtData.text + ') show');
              writeln(ArquivoTexto, '1.6 cm 7.95 cm moveto');
              writeln(ArquivoTexto, '(' + Func.Nome + ') show'); //Nome do empregado
              writeln(ArquivoTexto, '10.8 cm 7.95 cm moveto');
              writeln(ArquivoTexto, '(' + Func.Matricula + ') show'); //matricula do empregado
              writeln(ArquivoTexto, '16.5 cm 7.95 cm moveto');
              writeln(ArquivoTexto, '(' + Func1.Nome + ') show'); //Nome do empregado
              writeln(ArquivoTexto, '25.8 cm 7.95 cm moveto');
              writeln(ArquivoTexto, '(' + Func1.Matricula + ') show'); //matricula do empregado
              writeln(ArquivoTexto, '1.6 cm 7.3 cm moveto');
              writeln(ArquivoTexto, '(' + Func.UnidadeLocacao + ') show'); //unidade de alocaçào
              writeln(ArquivoTexto, '10.8 cm 7.3 cm moveto');
              writeln(ArquivoTexto, '() show'); //código de alocação
              writeln(ArquivoTexto, '16.5 cm 7.3 cm moveto');
              writeln(ArquivoTexto, '(' + Func1.UnidadeLocacao + ') show'); //unidade de alocaçào
              writeln(ArquivoTexto, '25.8 cm 7.3 cm moveto');
              writeln(ArquivoTexto, '() show'); //código de alocação
              writeln(ArquivoTexto, '1.6 cm 6.65 cm moveto');
              writeln(ArquivoTexto, '(' + Func.Endereco + ') show'); //endereço
              writeln(ArquivoTexto, '9.9 cm 6.65 cm moveto');
              writeln(ArquivoTexto, '(' + Func.Bairro + ') show'); // Bairro
              writeln(ArquivoTexto, '16.5 cm 6.65 cm moveto');
              writeln(ArquivoTexto, '(' + Func1.Endereco + ') show'); //endereço
              writeln(ArquivoTexto, '24.9 cm 6.65 cm moveto');
              writeln(ArquivoTexto, '(' + Func1.Bairro + ') show'); // Bairro
              writeln(ArquivoTexto, '1.6 cm 5.95 cm moveto');
              writeln(ArquivoTexto, '(' + Func.Municipio + ') show'); //munícipio
              writeln(ArquivoTexto, '9.0 cm 5.95 cm moveto');
              writeln(ArquivoTexto, '(' + Func.UF + ') show'); //Uf
              writeln(ArquivoTexto, '9.9 cm 5.95 cm moveto');
              writeln(ArquivoTexto, '(' + copy(Func.Cep, 1, 5) + '-' + copy(Func.Cep, 6, 3) + ') show'); // cep
              writeln(ArquivoTexto, '16.5 cm 5.95 cm moveto');
              writeln(ArquivoTexto, '(' + Func1.Municipio + ') show'); //munícipio
              writeln(ArquivoTexto, '24.0 cm 5.95 cm moveto');
              writeln(ArquivoTexto, '(' + Func1.UF + ') show'); //Uf
              writeln(ArquivoTexto, '24.9 cm 5.95 cm moveto');
              writeln(ArquivoTexto, '(' + copy(Func1.Cep, 1, 5) + '-' + copy(Func1.Cep, 6, 3) + ') show'); // cep
              writeln(ArquivoTexto, 'showpage');
              LimpaReg(Func);
              LimpaReg(Func1);
            End;
        End; //while
    End
  Else
    Begin
      MsgDlg('Não há dados a serem gerados.', 'Aviso', mtWarning, [mbOK], 0);
      exit;
    End;

  MsgDlg('Arquivo Gerado com Sucesso', 'Aviso', mtWarning, [mbOK], 0);
End;

Procedure TFrmConfigRelatInformeMT.LimpaReg(Var Func: Funcionario);
Begin
  With Func Do
    Begin
      CPF := '';
      Nome := '';
      TotalRendimentos := '';
      Contribuicao := '';
      Contribuicao1 := '';
      PensaoAlimenticia := '';
      ImpostoRenda := '';
      ParcelaIsentaProventos := '';
      DiariasAjudas := '';
      PensaoProventos := '';
      LucroDividendo := '';
      ValoresPagos := '';
      Indenizacoes := '';
      Outros := '';
      DecimoTerceiro := '';
      Outros2 := '';
      Matricula := '';
      UnidadeLocacao := '';
      Endereco := '';
      Bairro := '';
      Municipio := '';
      UF := '';
      Cep := '';
      Pams := '';
      DevolucaoPams := '';
      Pensionista1.Nome := '';
      Pensionista1.CPF := '';
      Pensionista2.Nome := '';
      Pensionista2.CPF := '';
      Pensionista3.Nome := '';
      Pensionista3.CPF := '';
      Pensionista4.Nome := '';
      Pensionista4.CPF := '';

      AbonoTribExigibilidade := ''; //CPrev - Pend. 27331 - 26/02/2008
    End;
End;

Procedure TFrmConfigRelatInformeMT.bbtnGeraTxtClick(Sender: TObject);
Var
  sCodNatureza,
    sNomeArquivo,
    sLinha,
    sAno,
    sMatricula: String;

  rIdPessoa,
    rValorJud,
    rValorJud13,
    rValLinha,
    rValorJudRend13,
    rValorJudRend: Double;

  iCodAnt,
    iCount: LongInt;

  iModulo,
    k,
    iNumDig,
    i,
    x,
    iIdPessoa,
    iidEmpresaProp: Integer;

  Rec: TSearchRec; // Edilaine - SOL 197664 / KTN 1894007

  bDecJudicial,
    iJud13: Boolean;

  sCPF: String;
  J, F: Integer;
Begin
  TipoGeracao := tgGeraTXT;       // edilaine - SIG 19602
  CtrlInformeRendimentos.pLayout2018 := (CmbModelo.LookupValue = '156'); //Cássio Rovaroto - SIG nº 81993
  CtrlInformeRendimentos.pLayout2019 := (CmbModelo.LookupValue = '171'); //SIG 85183.92415
  CtrlInformeRendimentos.pLayout2019Pensao := (CmbModelo.LookupValue = '172'); //SIG 85183.92415
  CtrlInformeRendimentos.pLayout2021 := (CmbModelo.LookupValue = '173'); // Andre Imakawa - SIG 122151

  CtrlInformeRendimentos.pLayoutResgate := (CmbModelo.LookupValue = '152'); //edilaine SIG129805


  sCPF := Trim(edtExcluiCPF.Text);
  If Trim(sCPF) <> '' Then
    Begin
      F := 0;
      For J := 0 To Length(sCPF) Do
        Begin
          If sCPF[J] = Char(39) Then // O char(39) é Aspas simples
            Inc(F);
        End;

      If F < 2 Then
        Begin
          MessageBox(Handle, 'O CPF do campo exclusão deve estar entre aspas simples.', 'Atenção', MB_OK + MB_ICONWARNING);
          Exit;
        End;
    End;

  Inherited;

  If Trim(edtNome.Text) = '' Then
    Begin
      MsgDlg('É obrigatório selecionar o nome do responsável.', 'Informação', mtInformation, [mbOk], 0);
      exit;
    End;

  If dtdtData.Text = '' Then
    Begin
      MsgDlg('É obrigatório selecionar a data.', 'Informação', mtInformation, [mbOk], 0);
      exit;
    End;

  lblQtdGerado.Visible := True;
  iIdPessoa := -1999;
  bUsaTextFile := true; // Edilaine - SOL 180189 / KTN 1761859

  If trim(meCPF.Text) <> '' Then
    iIdPessoa := ctrlInformeRendimentos.BuscaPeloCpf(trim(meCPF.Text));

  If SaveDialog1.execute Then
    Begin
      sNomeArquivo := savedialog1.filename;
      sAno := edtData.text;

      //AssignFile(ArquivoTexto, sNomeArquivo);  // Edilaine - SOL 180189 / KTN 1761859 - comentado
      //ReWrite(Arquivotexto);                   // Edilaine - SOL 180189 / KTN 1761859 - comentado

      cdsInforme1.data := CtrlInformeRendimentos.BuscaInforme1;
      iidEmpresaProp := CtrlInformeRendimentos.BuscaCodEmProp;

      // Edilaine - SOL 180189 / KTN 1761859
      If (iidEmpresaProp = 1) And (Not chkSegundaVia.Checked) Then
        Begin
          reArquivo.Lines.Clear;
          //reArquivo.Lines.add( sNomeArquivo );//William Moreira da Silva
          bUsaTextFile := false;
        End
      Else
        Begin
          AssignFile(ArquivoTexto, sNomeArquivo);
          ReWrite(Arquivotexto);
        End;
      // Edilaine - SOL 180189 / KTN 1761859 - fim

      If (FrameBenef.qryLista.Eof) Or
        (Not chkUsaLista.Checked) Then //CPrev - 27303
        FrameBenef.ListaUsuario := 0;

      lblInicioProc.caption := TimeToStr(Time);

      Case iidEmpresaProp Of
        0: Begin
            //REFER
            bDecJudicial := False;
            frmConfigRelatInformeMT.repaint;
            cdsDadosTxt.Data := CtrlInformeRendimentos.BuscaInformeGeral(-1, //iIdPessoa,            // Paulo Nobre SOL 268555 PPM 1262100
              edtData.text,
              rgSistema.ItemIndex,
              Sistema.idEmpresa,
              FrameBenef.ListaUsuario,
              chkPensaoAlimenticia.Checked,
              chkInformeSeparado.Checked,
              edtNome.Text,
              dtdtData.Date,
              chkUsaLista.Checked,
              cbxClassifica.ItemIndex);
            prgBarAtuFluxo.Visible := True;
            prgBarAtuFluxo.Max := cdsDadosTXT.RecordCount;
            lblQuantidade.visible := true;
            edtQuantidade.visible := true;
            edtquantidade.text := Inttostr(cdsDadosTXT.RecordCount);
            prgBarAtuFluxo.Position := 0;
          End;

        1: Begin
            //geração do informe para a Funcef.
            AssignFile(ArqCriticaEndereco, Copy(sNomeArquivo, 1, Length(sNomeArquivo) - 4) + ' Critica Endereço.txt');
            ReWrite(ArqCriticaEndereco);

            If chkSegundaVia.Checked Then
              GeraSegundaViaInformeFuncef
            Else
              Begin
                // Edilaine - SOL 197664 / KTN 1894007
                // apagando arquivos
                If FindFirst('c:\planus\temp\InformeTXT_*.*', faAnyFile - faDirectory, Rec) = 0 Then
                  Begin
                    Try
                      Repeat
                        DeleteFile('c:\planus\temp\' + Rec.Name);
                      Until FindNext(Rec) <> 0;
                    Finally
                      FindClose(Rec);
                    End;
                  End;
                // Edilaine - SOL 197664 / KTN 1894007 - fim

                GeraInformeFuncef;

              End;

            // Edilaine - SOL 180189 / KTN 1761859
            //DeleteFile('C:\planus\temp\ArquivoGeral.txt');//William Moreira da Silva - SOL 210579 KINTANA 2037426
            If Not bUsaTextFile Then
              Begin
                // edilaine - SIG 19602
                // validação colocada para caso não ter trazido dados nenhum para gerar o InformeTXT_geral, evitando um loop
                //if FileExists('c:\planus\temp\InformeTXT_001.txt') then // Andre Imakawa - SIG24448
                if FileExists('c:\planus\temp\InformeTXT_001') then  // Andre Imakawa - SIG24448
                begin
                  // Edilaine - SOL 197664 / KTN 1894007
                  //William Moreira da Silva - SOL 210579 KINTANA 2037426
                  WinExec(PChar('cmd /c COPY /B C:\planus\temp\InformeTXT_*.* c:\planus\temp\InformeTXT_geral.txt'), sw_hide);
                  While Not FileExists('c:\planus\temp\InformeTXT_geral.txt') Do
                    Sleep(1);
                  //MoveFile(Pchar('c:\planus\temp\InformeTXT_geral.txt'), Pchar(sNomeArquivo)); // Andre Imakawa - SIG24448
                  CopyFile(Pchar('c:\planus\temp\InformeTXT_geral.txt'), Pchar(sNomeArquivo),false); // Andre Imakawa - SIG24448
                  //William Moreira da Silva - SOL 210579 KINTANA 2037426
                  //WinExec(PChar('cmd /c COPY /B C:\planus\temp\InformeTXT_*.* '+sNomeArquivo), sw_hide);
                end;
                // edilaine - SIG 19602
              End
            Else
              CloseFile(ArquivoTexto);
            // Edilaine - SOL 180189 / KTN 1761859 - fim

            CloseFile(ArqCriticaEndereco);
            lblfimProc.caption := TimeToStr(Time);
            exit;
          End;

        2: Begin
            //geração do informe para a CBS
            GeraInformeCBS;
            CloseFile(ArquivoTexto);
            lblQtdGerado.Visible := False;
            lblfimProc.caption := TimeToStr(Time);
            exit;
          End;

        3: Begin
            //BrtPrev
            bDecJudicial := False;
            frmConfigRelatInformeMT.repaint;
            cdsDadosTxt.Data := CtrlInformeRendimentos.BuscaInformeGeral(-1, // iIdPessoa,          // Paulo Nobre SOL 268555 PPM 1262100
              edtData.text,
              rgSistema.ItemIndex,
              Sistema.idEmpresa,
              FrameBenef.ListaUsuario,
              chkPensaoAlimenticia.Checked,
              chkInformeSeparado.Checked,
              edtNome.Text,
              dtdtData.Date,
              chkUsaLista.Checked,
              cbxClassifica.ItemIndex);
            prgBarAtuFluxo.Visible := True;
            prgBarAtuFluxo.Max := cdsDadosTXT.RecordCount;
            lblQuantidade.visible := true;
            edtQuantidade.visible := true;
            edtquantidade.text := Inttostr(cdsDadosTXT.RecordCount);
            prgBarAtuFluxo.Position := 0;
          End;
      End; //fim do case

      // Se passou por aqui é porque é REFER ou FCRT
      iCount := 0;

      //Gera o Cabeçalho do arquivo texto Refer
      If (rgSistema.ItemIndex = 1) Or (rgSistema.ItemIndex = 3) Then
        sLinha := '+ DJDE JDE=JOB6,JDL=REFPDL,;'
      Else
        sLinha := '+ DJDE JDE=JOB6A,JDL=REFPDL,END;';

      iNumDig := Length(sLinha);
      sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
      WriteLn(ArquivoTexto, sLinha);
      cdsDadosTXT.First;
      While Not cdsDadosTXT.EOF Do
        Begin
          // Paulo Nobre SOL 268555 PPM 1262100
          If (rIdPessoa = -1) And //cdsDadosTXT.FieldByName('IDPESSOA').AsFloat) And
          (sCodNatureza = cdsDadosTXT.FieldByName('CODNATUREZA').AsString) Then
            Begin
              cdsDadosTXT.Next;
              Continue;
            End;

          rIdPessoa := 0;
          rIdPessoa := cdsDadosTXT.FieldByName('IDPESSOA').AsFloat;
          sCodNatureza := cdsDadosTXT.FieldByName('CODNATUREZA').AsString;
          Inc(iCount);
          lblQtdGerado.Caption := InttoStr(iCount);
          lblQtdGerado.Update;

          Case rgSistema.ItemIndex Of
            0: iModulo := 21;
            1: iModulo := 18;
            3: iModulo := 10;
          End;

          If (rgSistema.ItemIndex = 1) Or (rgSistema.ItemIndex = 3) Then
            Begin
              //Grava Início do Texto da Pessoa
              sLinha := '+ DJDE FORMAT=REFERV,END;';
              iNumDig := Length(sLinha);
              sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
              WriteLn(ArquivoTexto, sLinha);
            End;

          cdsPensionista.Data := ctrlInformeRendimentos.BuscaCampo6sqlPensionistas(
            -1,
            //          cdsDadosTXT.FieldByName('IDPESSOA').AsFloat,
            strToInt(edtData.Text),
            rgSistema.ItemIndex,
            cdsdados.FieldByName('CPF').AsString);

          If Not cdsPensionista.EOF Then
            cdsPensionista13.data := ctrlInformeRendimentos.BuscaCampo6sqlPensionistas13(
              -1,
              //            cdsDadosTXT.FieldByName('IDPESSOA').AsFloat,
              strToInt(edtData.text),
              edtRubrica.Text,
              rgSistema.ItemIndex,
              cdsdados.FieldByName('CPF').AsString);

          //VERIFICA SE EXISTE DECISÃO JUDICIAL PARA ESSE BENEFICIÁRIO
          //Verifica se existem dados no campo 6
          If iidEmpresaProp = 3 Then // FCRT
            cdsOutros6.Data := CtrlInformeRendimentos.BuscaCampo6Outros(
              -1,
              //            cdsDadostxt.FieldByName('IDPESSOA').Asinteger,
              strToInt(edtData.text),
              cdsdados.FieldByName('CPF').AsString);

          cdsAux2.Close;
          cdsJud.Close;
          //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Inicio
          pIsPensionistasAntigos := (CmbModelo.LookupValue = '33');
          CtrlInformeRendimentos.pTipoAposentadoPensionistas := pIsPensionistasAntigos;

          // Paulo Nobre SOL 268555 PPM 1262100
          cdsJud.Data := CtrlInformeRendimentos.BuscaDepJudicial(
            cdsDados.fieldByname('CPF').AsString,
            -1
            //          cdsDadostxt.FieldByName('IDPESSOA').Asinteger,
            strToInt(edtData.text), pIsPensionistasAntigos);
          //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Fim

          cdsJud.First;
          If cdsJud.IsEmpty Then
            bDecJudicial := False
          Else
            Begin
              bDecJudicial := True;
            End;

          //Quando clicar no checkbox de pensão alimentícia não efetuar
          // busca e processamento dos dados de pensionista.
          cdsPensionista.First;
          While Not cdsPensionista.EOF Do
            Begin
              cdsPensionista13.first;
              If Not cdsPensionista13.fieldByname('IDFAVORECIDO').isnull Then
                Begin
                  If cdsPensionista13.Locate('IDFAVORECIDO', VarArrayOf([cdsPensionista.fieldByname('IDFAVORECIDO').Asstring]), [loPartialKey]) Then
                    Begin
                      cdsPensionista.edit;
                      cdsPensionista.FieldByName('VALOR13').AsFloat := cdsPensionista13.FieldByName('VALOR').AsFloat;
                      cdsPensionista.post;
                      cdsPensionista13.delete;
                    End;
                End;
              cdsPensionista.next;
            End;

          If Not cdsPensionista.EOF Then
            Begin
              cdsPensionista13.first;
              While Not cdsPensionista13.eof Do
                Begin
                  cdsPensionista.Insert;
                  cdsPensionista.FieldByName('IDFAVORECIDO').Asinteger := cdsPensionista13.FieldByName('IDFAVORECIDO').Asinteger;
                  cdsPensionista.FieldByName('NUMDOCUMENTO').Asstring := cdsPensionista13.FieldByName('NUMDOCUMENTO').Asstring;
                  cdsPensionista.FieldByName('NOME').Asstring := cdsPensionista13.FieldByName('NOME').Asstring;
                  cdsPensionista.FieldByName('VALOR').AsFloat := 0;
                  cdsPensionista.FieldByName('VALOR13').AsFloat := cdsPensionista13.fieldByname('VALOR').AsFloat;
                  cdsPensionista.post;
                  cdsPensionista13.next;
                End;
            End;

          For k := 1 To 2 Do
            Begin
              sLinha := '11';
              iNumDig := Length(sLinha);
              sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
              WriteLn(ArquivoTexto, sLinha);

              sLinha := '21' + CtrlInformeRendimentos.Completa('', 6) + Copy(cdsDadosTxt.fieldByname('CPF').AsString, 1, 3) + '.' + Copy(cdsDadosTxt.fieldByname('CPF').AsString, 4, 3) + '.' + Copy(cdsDadosTxt.fieldByname('CPF').AsString, 7, 3) + '-' + Copy(cdsDadosTxt.fieldByname('CPF').AsString, 10, 2) + CtrlInformeRendimentos.Completa('', 3) + CtrlInformeRendimentos.Completa(Copy(cdsDadosTxt.fieldByname('NOMEBENEF').AsString, 1, 36), 36);
              iNumDig := Length(sLinha);
              sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
              WriteLn(ArquivoTexto, sLinha);

              If (rgSistema.ItemIndex = 1) Or (rgSistema.ItemIndex = 3) Then
                sLinha := '-1' + 'BENEFICIOS RECEBIDOS DE ENTIDADE DE PREVIDENCIA PRIVADA'
              Else
                sLinha := '-1' + cdsDadosTxt.fieldByname('DESCRICAO').AsString;

              iNumDig := Length(sLinha);
              sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
              WriteLn(ArquivoTexto, sLinha);
              iCodAnt := 0;

              If k = 1 Then
                prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;

              prgBarAtuFluxo.Update;
              cdsinforme1.First;
              sMatricula := cdsDadosTXT.FieldByName('MATRICULA').AsString;
              While Not cdsinforme1.EOF Do
                Begin
                  If cdsinforme1.fieldByname('CODINFORME').AsInteger = 301 Then
                    Begin
                      sLinha := '32';
                      rValLinha := cdsDadosTXT.fieldByname('VLR301').AsFloat;
                    End
                  Else
                    Begin
                      If cdsinforme1.fieldByname('CODINFORME').AsInteger = 401 Then
                        Begin
                          sLinha := '42';
                          rValLinha := cdsDadosTXT.fieldByname('VLR401').AsFloat;
                        End
                      Else
                        Begin
                          If cdsinforme1.fieldByname('CODINFORME').AsInteger = 501 Then
                            Begin
                              sLinha := '52';
                              rValLinha := cdsDadosTXT.fieldByname('VLR501').AsFloat;
                            End
                          Else
                            Begin
                              If (cdsinforme1.fieldByname('CODINFORME').AsInteger = 405) Then
                                Begin
                                  sLinha := '02';
                                  rValLinha := cdsDadosTXT.fieldByname('VLR405').AsFloat;
                                End
                              Else
                                Begin
                                  If (cdsinforme1.fieldByname('CODINFORME').AsInteger = 406) Then
                                    Begin
                                      sLinha := '02';
                                      rValLinha := cdsDadosTXT.fieldByname('VLR406').AsFloat;
                                    End
                                  Else
                                    Begin
                                      sLinha := ' 2';
                                    End;
                                End;
                            End;
                        End;
                    End;

                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 59);

                  If cdsinforme1.fieldByname('CODINFORME').AsInteger = 302 Then
                    rValLinha := cdsDadosTXT.fieldByname('VLR302').AsFloat
                  Else
                    Begin
                      If cdsinforme1.fieldByname('CODINFORME').AsInteger = 303 Then
                        rValLinha := cdsDadosTXT.fieldByname('VLR303').AsFloat
                      Else
                        If cdsinforme1.fieldByname('CODINFORME').AsInteger = 304 Then
                          rValLinha := cdsDadosTXT.fieldByname('VLR304').AsFloat
                        Else
                          If cdsinforme1.fieldByname('CODINFORME').AsInteger = 305 Then
                            rValLinha := cdsDadosTXT.fieldByname('VLR305').AsFloat
                          Else
                            If cdsinforme1.fieldByname('CODINFORME').AsInteger = 402 Then
                              rValLinha := cdsDadosTXT.fieldByname('VLR402').AsFloat
                            Else
                              If cdsinforme1.fieldByname('CODINFORME').AsInteger = 403 Then
                                rValLinha := cdsDadosTXT.fieldByname('VLR403').AsFloat
                              Else
                                If cdsinforme1.fieldByname('CODINFORME').AsInteger = 404 Then
                                  rValLinha := cdsDadosTXT.fieldByname('VLR404').AsFloat
                                Else
                                  If cdsinforme1.fieldByname('CODINFORME').AsInteger = 407 Then
                                    rValLinha := cdsDadosTXT.fieldByname('VLR407').AsFloat
                                  Else
                                    If cdsinforme1.fieldByname('CODINFORME').AsInteger = 502 Then
                                      rValLinha := cdsDadosTXT.fieldByname('VLR502').AsFloat;
                    End;

                  sLinha := sLinha + FuncaoGeral.AD(FormatFloat('#,##0.00;(#,##0.00)', rValLinha), 14);
                  iNumDig := Length(sLinha);
                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                  WriteLn(ArquivoTexto, sLinha);
                  cdsinforme1.Next;
                End;
              iCodAnt := cdsinforme1.fieldByname('CODINFORME').AsInteger;
              //Quando clicar no checkbox de pensão alimentícia não efetuar
              // busca e processamento dos dados de pensionista.
              cdsPensionista.First;

              If Not cdsPensionista.IsEmpty Then
                Begin
                  i := 7;
                  i := i - ((cdsPensionista.RecordCount) * 2);

                  If (bDecJudicial) Then
                    Begin
                      If cdsJud.recordCount > 0 Then
                        i := i - ((cdsJud.recordCount) * 2);
                    End;

                  If i < 0 Then i := 0;

                  cdsPensionista.First;
                  sLinha := '62';
                  While (Not cdsPensionista.EOF) And (cdsPensionista.RecordCount <= 7) Do
                    Begin
                      cdsPensionista13.data := ctrlInformeRendimentos.BuscaCampo6sqlPensionistas13(
                        -1,
                        //                      rIdPessoa,
                        strToInt(edtdata.text),
                        edtRubrica.text,
                        rgSistema.ItemIndex,
                        cdsdados.FieldByName('CPF').AsString);

                      sLinha := sLinha + cdsPensionista.fieldByname('NUMDOCUMENTO').AsString + ' ' + cdsPensionista.fieldByname('NOME').AsString;
                      iNumDig := Length(sLinha);
                      sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                      WriteLn(ArquivoTexto, sLinha);

                      sLinha := ' 2';
                      sLinha := sLinha + 'Rend.: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR').AsFloat) + ' - ' +
                        '13º : ' + FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR13').AsFloat);
                      iNumDig := Length(sLinha);

                      If cdsPensionista.RecordCount = 7 Then
                        Begin
                          sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig - 16);
                          sLinha := sLinha + CtrlInformeRendimentos.Completa(sMatricula, 16);
                        End
                      Else
                        Begin
                          sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                        End;

                      WriteLn(ArquivoTexto, sLinha);
                      cdsPensionista.Next;
                      sLinha := ' 2';
                    End;
                End
              Else
                Begin
                  If (bDecJudicial) And (Not cdsJud.IsEmpty) Then
                    i := 5
                  Else
                    i := 6;

                  sLinha := '62';
                  iNumDig := Length(sLinha);
                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                  WriteLn(ArquivoTexto, sLinha);
                End;

              If (bDecJudicial) And
                (Not cdsJud.IsEmpty) And
                (cdspensionista.recordcount = 1) Then
                i := i + 1;

              For x := 1 To i Do
                Begin
                  If (x = i) And
                    ((rgSistema.ItemIndex = 1) Or (rgSistema.ItemIndex = 3)) Then
                    Begin
                      sLinha := ' 2';
                      iNumDig := Length(sLinha);
                      sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig - 16);
                      sLinha := sLinha + CtrlInformeRendimentos.Completa(sMatricula, 16);
                      WriteLn(ArquivoTexto, sLinha);
                    End
                  Else
                    Begin
                      If (x = 1) And
                        (bDecJudicial) And
                        (((Not cdsJud.IsEmpty) And (cdsJud.fieldByname('VALORIRJUD').AsFloat > 0)) Or
                        ((Not cdsJud.IsEmpty) And (cdsJud.fieldByname('VALORRENDJUD').AsFloat > 0))) Then
                        Begin
                          rValorJud := 0;
                          rValorJud13 := 0;
                          rValorJudRend13 := 0;
                          rValorJudRend := 0;

                          If Not cdsJud.EOF Then
                            Begin
                              If cdsJud.fieldByname('VALORIRJUD').AsFloat > 0 Then
                                rValorJud := cdsJud.fieldByname('VALORIRJUD').AsFloat;

                              If cdsJud.fieldByname('VALORIRJUD13').AsFloat > 0 Then
                                rValorJud13 := cdsJud.fieldByname('VALORIRJUD13').AsFloat;
                            End;

                          If (cdsJud.fieldByname('VALORRENDJUD13').AsFloat > 0) Then
                            rValorJudRend13 := cdsJud.fieldByname('VALORRENDJUD13').AsFloat;

                          If cdsJud.fieldByname('VALORRENDJUD').AsFloat > 0 Then
                            rValorJudRend := cdsJud.fieldByname('VALORRENDJUD').AsFloat;

                          If Not ((rValorJud13 <= 0) And (rValorJudRend <= 0) And
                            (rValorJudRend13 <= 0) And (rValorJud <= 0)) Then
                            Begin
                              sLinha := ' 2';

                              SLinha := sLinha + 'Proc.Jud. ' + cdsJud.fieldByname('NUMEROPROCESSO').AsString + ' - ' +
                                cdsJud.fieldByname('DATAINICIO').AsString + '   -   ' +
                                cdsJud.fieldByname('CODVARA').Asstring + '- ' +
                                cdsJud.fieldByname('NOMEVARA').asstring;

                              iNumDig := Length(sLinha);
                              sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                              WriteLn(ArquivoTexto, sLinha);
                              sLinha := ' 2';

                              sLinha := sLinha + 'Rend.: ' + FormatFloat('#,##0.00;(#,##0.00)', rValorJudRend) + ' - ' +
                                'IRRF : ' + FormatFloat('#,##0.00;(#,##0.00)', rValorJud) + ' - ' +
                                'Rend 13º ' + FormatFloat('#,##0.00;(#,##0.00)', rValorJudRend13) + ' - ' +
                                'IRRF 13º ' + FormatFloat('#,##0.00;(#,##0.00)', rValorJud13);

                              iNumDig := Length(sLinha);
                              sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                              WriteLn(ArquivoTexto, sLinha);
                            End;
                        End
                      Else
                        Begin
                          sLinha := ' 2';
                          iNumDig := Length(sLinha);
                          sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                          WriteLn(ArquivoTexto, sLinha);
                        End;
                    End;
                End;

              If iidEmpresaProp = 3 Then // FCRT
                Begin
                  cdsOutros6.First;
                  If Not cdsOutros6.eof Then
                    Begin
                      sLinha := ' 2';
                      iNumDig := Length(sLinha);
                      sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig - 16);
                      sLinha := sLinha + '  01. UNIMED LTDA.            CNPJ: 87.096.616/0001-96 ' +
                        FormatFloat('#,##0.00;(#,##0.00)', cdsOutros6.fieldByname('VALOR').AsFloat);
                      WriteLn(ArquivoTexto, sLinha);
                    End;

                  cdsOutros6.Next;
                  If Not cdsOutros6.eof Then
                    Begin
                      sLinha := ' 2';
                      iNumDig := Length(sLinha);
                      sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig - 16);
                      sLinha := sLinha + '  01. BRADESCO SAUDE          CNPJ: 92.693.118/0001-60 ' +
                        FormatFloat('#,##0.00;(#,##0.00)', cdsOutros6.fieldByname('VALOR').AsFloat);
                      WriteLn(ArquivoTexto, sLinha);
                    End;

                  cdsOutros6.Next;
                  If Not cdsOutros6.eof Then
                    Begin
                      sLinha := ' 2';
                      iNumDig := Length(sLinha);
                      sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig - 16);
                      sLinha := sLinha + '  01. DESPESAS MEDICAS SINTEL CNPJ: 89.623.375/0001-12 ' +
                        FormatFloat('#,##0.00;(#,##0.00)', cdsOutros6.fieldByname('VALOR').AsFloat);

                      WriteLn(ArquivoTexto, sLinha);
                    End;

                End;

              sLinha := '+1';
              iNumDig := Length(sLinha);
              sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
              WriteLn(ArquivoTexto, sLinha);
              If (k = 2) Or ((K = 1) And (iIdEmpresaProp = 3)) Then // gravar o endereço
                Begin
                  sLinha := '+ DJDE FORMAT=REFERF,END;';
                  iNumDig := Length(sLinha);
                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                  WriteLn(ArquivoTexto, sLinha);
                  //
                  sLinha := '81';
                  iNumDig := Length(sLinha);
                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                  WriteLn(ArquivoTexto, sLinha);
                  //
                  sLinha := '92      ' + cdsDadosTXT.fieldByname('NOMEBENEF').AsString;
                  iNumDig := Length(sLinha);
                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                  WriteLn(ArquivoTexto, sLinha);
                  //
                  sLinha := ' 2      ' + cdsDadosTXT.fieldByname('ENDEREO').AsString + ' ' +
                    cdsDadosTXT.fieldByname('NUMERO').AsString + ' ' + cdsDadosTXT.fieldByname('COMPLEMENTO').AsString + ' - ' +
                    cdsDadosTXT.fieldByname('BAIRRO').AsString;
                  iNumDig := Length(sLinha);
                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                  WriteLn(ArquivoTexto, sLinha);
                  //
                  sLinha := ' 2      ' + cdsDadosTXT.fieldByname('NOME').AsString + ' ' + cdsDadosTXT.fieldByname('CEP').AsString + ' ' +
                    cdsDadosTXT.fieldByname('UF').AsString;
                  iNumDig := Length(sLinha);
                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                  WriteLn(ArquivoTexto, sLinha);
                  //
                  sLinha := ' 2';
                  iNumDig := Length(sLinha);
                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                  WriteLn(ArquivoTexto, sLinha);
                  //
                  sLinha := ' 2';
                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 57);
                  sLinha := sLinha + CtrlInformeRendimentos.CompletaZero(trim(IntToStr(iCount)), 5);
                  iNumDig := Length(sLinha);
                  sLinha := sLinha + CtrlInformeRendimentos.Completa('', 80 - iNumDig);
                  WriteLn(ArquivoTexto, sLinha);

                End;

              If iidEmpresaProp = 3 Then
                Break;

            End;
          bDecJudicial := False;
          cdsDadosTXT.Next;
        End;
      CloseFile(ArquivoTexto);
      screen.cursor := crDefault;
      lblfimProc.caption := TimeToStr(Time);
      frmConfigRelatInformeMT.repaint;
      MsgDlg('Arquivo Gerado com Sucesso', 'Aviso', mtWarning, [mbOK], 0);
    End;
End;

Procedure TFrmConfigRelatInformeMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
    Begin
      sql.prepare;
      sql.ParamByName('IDCARTACOBRANCA').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
      sql.Open;
    End;
End;

Procedure TFrmConfigRelatInformeMT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Inherited;
  CtrlInformeRendimentos.free;
  FreeandNil(reArquivo); // Edilaine - SOL 180189 / KTN 1761859
End;

Procedure TFrmConfigRelatInformeMT.GeraInformeCBS;
Var
  sVal31, //Total de redimentos
  sVal32, //contribuição previdenciária oficial
  sVal33, //Contribuição à previdência privada
  sVal34, //pensão alimentícia
  sVal35, //Imposto retido na fonte
  sVal41, //Pensão Alimentícia
  sVal42, //Salário família
  sVal43, //Parcela isenta dos proventos de aposentadoria
  sVal44, //Diárias e ajudas de custo
  sVal45, //Pensão, proventos de aposentadoria
  sVal46, //Lucro e dividendo apurado
  sVal47, //Outros. Demais rendimentos isentos
  sVal51, // Décimo Terceiro salário
  sVal52, //Outros(Valor liquido dos demais Rendimentos sujeitos à tributação exclusiva)
  sVal61, //valor do Pams - não me pergunte o que que é isso...
  sVal62, //Valor de devolução do Pams
  sVal63,
    sVal64,
    sVal65,
    CPF,
    NomeBene,
    CodNatureza,
    participendereo,
    participnumero,
    participcomplemento,
    participbairro,
    participnome,
    participuf,
    participcep,
    participNUMSEED: String;

  rIdPessoa: Real;
  i: integer;
  Pensionista: Array[0..3] Of rPensionista;

  //CPrev - Pend. 27407 - Início
  sDadosAcao,
    sDadosCompensa: String;

  cdsExisteJud: TcmClientDataSet;
  //CPrev - Pend. 27407 - Fim
Begin
  //CPrev - Pend. 27407 - 11/02/2008 - Início
  cdsExisteJud := TcmClientDataSet.Create(Nil);
  //CPrev - Pend. 27407 - 11/02/2008 - Fim

  MontaSqlDados;
  prgBarAtuFluxo.Visible := True;
  prgBarAtuFluxo.Max := cdsDados.RecordCount;
  lblQuantidade.visible := true;
  edtQuantidade.visible := true;
  edtquantidade.text := Inttostr(cdsDados.RecordCount);
  prgBarAtuFluxo.Position := 0;
  cdsdados.First;
  If Not cdsdados.IsEmpty Then
    Begin
      prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
      prgBarAtuFluxo.Update;
      //Cabeçalho do Arquivo
      writeln(Arquivotexto, '%!');
      writeln(Arquivotexto, '(;) SETDBSEP');
      writeln(Arquivotexto, '1200 SETBUFSIZE');
      writeln(Arquivotexto, '(cedulac.dbm) STARTDBM');
      write(ArquivoTexto, 'SEED;NOMECONTRIB;LOGRADOURO;NUMERO;COMPLEMENTO;BAIRRO;CIDADE;CODESTADO;CEP;CGCCBS;TELCBS;NOMECBS;ENDERECOCBS;ANOCALEND;CPFCONTRIB;NOMECCONTRIB;NATUREND;MATRICULA;VAL31;VAL32;VAL33;VAL34;VAL35;VAL41;VAL42;VAL43;VAL44;VAL45;VAL46;VAL47;VAL51;VAL52;VAL61;');
      writeln(ArquivoTexto, 'VAL62;VAL63;VAL64;VAL65;VAL66;VAL67;VAL68;EMPRESA;DATA;OBSERVACAO');
      cdsdados.first;
      //While principal
      While Not cdsdados.eof Do
        Begin
          //CPrev - Pend. 27407 - 11/02/2008 - Início
          sDadosAcao := '';
          sDadosCompensa := '';
          //CPrev - Pend. 27407 - 11/02/2008 - Fim

          sVal31 := '0,00';
          sVal32 := '0,00';
          sVal33 := '0,00';
          sVal34 := '0,00';
          sVal35 := '0,00';
          sVal41 := '0,00';
          sVal42 := '0,00';
          sVal43 := '0,00';
          sVal44 := '0,00';
          sVal45 := '0,00';
          sVal46 := '0,00';
          sVal47 := '0,00';
          sVal51 := '0,00';
          sVal52 := '0,00';
          sVal61 := '0,00';
          sVal62 := '0,00';
          sVal63 := '0,00';
          sVal64 := '0,00';
          sVal65 := '0,00';
          rIdPessoa := -1; // cdsdados.FieldByName('IDPESSOA').AsFloat;           // Paulo Nobre SOL 268555 PPM 1262100
          CPF := cdsdados.fieldByname('CPF').Asstring;
          NomeBene := cdsdados.fieldByname('NOMEBENEF').Asstring;
          CodNatureza := {cdsdados.fieldByname('CODNATUREZA').Asstring + ' - '+ } cdsdados.fieldByname('DESCRICAO').Asstring; ////Marcio Sanches Spinosa SOL 225143 KINTANA 2058992

          cdsMatLocFunc.Data := CtrlInformeRendimentos.BuscaMatLocFunc(-1, cdsdados.fieldByname('CPF').Asstring); //rIdPessoa);

          //Valores de rendimentos
          cdsPensionista.Data := ctrlInformeRendimentos.BuscaCampo6sqlPensionistas(
            -1,
            //          rIdPessoa,
            strToInt(edtData.Text),
            rgSistema.ItemIndex,
            cdsdados.FieldByName('CPF').AsString);

          //Valores de 13º
          cdsPensionista13.data := ctrlInformeRendimentos.BuscaCampo6sqlPensionistas13(
            -1,
            //cdsDados.FieldByName('IDPESSOA').AsFloat,
            strToInt(edtdata.text),
            edtRubrica.text,
            rgSistema.ItemIndex,
            cdsdados.FieldByName('CPF').AsString);

          cdsPensionista.First;
          For i := 0 To 3 Do
            Begin
              Pensionista[i].Nome := '';
              Pensionista[i].CPF := '';
              Pensionista[i].ValorPensao := '';
              Pensionista[i].Valor13 := '';
            End;

          For i := 0 To 3 Do
            Begin
              If Not cdsPensionista.eof Then
                Begin
                  Pensionista[i].Nome := cdsPensionista.fieldByname('NOME').AsString;
                  Pensionista[i].CPF := CtrlInformeRendimentos.FormataCPF(Trim(cdsPensionista.fieldByname('NUMDOCUMENTO').AsString));
                  Pensionista[i].ValorPensao := FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR').AsFloat);
                  cdsPensionista13.first;

                  If Not cdsPensionista13.fieldByname('IDFAVORECIDO').isnull Then
                    Begin
                      If cdsPensionista13.Locate('IDFAVORECIDO', VarArrayOf([cdsPensionista.fieldByname('IDFAVORECIDO').Asstring]), [loPartialKey]) Then
                        Pensionista[i].Valor13 := FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista13.fieldByname('VALOR').AsFloat)
                      Else
                        Pensionista[i].Valor13 := FormatFloat('#,##0.00;(#,##0.00)', 0);
                    End;
                  cdsPensionista.Next;
                End;
            End;

          //este while serve para pegar todos os valores de rendimentos do funcionário
          //pois na query vem 1 valor por linha separado por código
          While (Not cdsdados.EOF) And
            (rIdPessoa = -1) Do // cdsdados.FieldByName('IDPESSOA').AsFloat) Do            // Paulo Nobre SOL 268555 PPM 1262100
            Begin
              Try
                If (cdsdados.fieldByname('VLR1').AsFloat > 0) And (StrToFloat(sVal31) <= 0) Then
                  sVal31 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR1').AsFloat);
              Except
                sVal31 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR2').AsFloat > 0) And (StrToFloat(sVal32) <= 0) Then
                  sVal32 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR2').AsFloat);
              Except
                sVal32 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR3').AsFloat > 0) And (StrToFloat(sVal33) <= 0) Then
                  sVal33 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR3').AsFloat);
              Except
                sVal33 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR4').AsFloat > 0) And (StrToFloat(sVal34) <= 0) Then
                  sVal34 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR4').AsFloat);
              Except
                sVal34 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR5').AsFloat > 0) And (StrToFloat(sVal35) <= 0) Then
                  sVal35 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR5').AsFloat);
              Except
                sVal35 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR41').AsFloat > 0) And (StrToFloat(sVal41) <= 0) Then
                  sVal41 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR41').AsFloat);
              Except
                sVal41 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR42').AsFloat > 0) And (StrToFloat(sVal42) <= 0) Then
                  sVal42 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR42').AsFloat);
              Except
                sVal42 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR43').AsFloat > 0) And (StrToFloat(sVal43) <= 0) Then
                  sVal43 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR43').AsFloat);
              Except
                sVal43 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR44').AsFloat > 0) And (StrToFloat(sVal44) <= 0) Then
                  sVal44 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR44').AsFloat);
              Except
                sVal44 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR45').AsFloat > 0) And (StrToFloat(sVal45) <= 0) Then
                  sVal45 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR45').AsFloat);
              Except
                sVal45 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR46').AsFloat > 0) And (StrToFloat(sVal46) <= 0) Then
                  sVal46 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR46').AsFloat);
              Except
                sVal46 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR47').AsFloat > 0) And (StrToFloat(sVal47) <= 0) Then
                  sVal47 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR47').AsFloat);
              Except
                sVal47 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR51').AsFloat > 0) And (StrToFloat(sVal51) <= 0) Then
                  sVal51 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR51').AsFloat);
              Except
                sVal51 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR52').AsFloat > 0) And (StrToFloat(sVal52) <= 0) Then
                  sVal52 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR52').AsFloat);
              Except
                sVal52 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR61').AsFloat > 0) And (StrToFloat(sVal61) <= 0) Then
                  sVal61 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR61').AsFloat);
              Except
                sVal61 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR62').AsFloat > 0) And (StrToFloat(sVal62) <= 0) Then
                  sVal62 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR62').AsFloat);
              Except
                sVal62 := '0,00';
              End;

              Try
                If (cdsdados.fieldByname('VLR63').AsFloat > 0) And (StrToFloat(sVal62) <= 0) Then
                  sVal63 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR63').AsFloat);
              Except
                sVal63 := '0,00';
              End;

              participendereo := '';
              participnumero := '';
              participcomplemento := '';
              participbairro := '';
              participnome := '';
              participuf := '';
              participcep := '';
              participNUMSEED := '';

              participendereo := cdsdados.fieldByname('ENDEREO').asstring;
              participnumero := cdsdados.fieldByname('NUMERO').asstring;
              participcomplemento := cdsdados.fieldByname('COMPLEMENTO').asstring;
              participbairro := cdsdados.fieldByname('BAIRRO').asstring;
              participnome := cdsdados.fieldByname('NOME').asstring;
              participuf := cdsdados.fieldByname('UF').asstring;
              participcep := cdsdados.fieldByname('CEP').asstring;
              participNUMSEED := cdsdados.fieldByname('NUMSEED').asstring;

              cdsdados.Next;
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
              prgBarAtuFluxo.Update;
            End;

          //Corpo do Txt
          write(Arquivotexto, Trim(participNUMSEED) + ';');
          write(ArquivoTexto, Trim(NomeBene) + ';');
          write(ArquivoTexto, Trim(participendereo) + ';');
          write(ArquivoTexto, Trim(participnumero) + ';');
          write(ArquivoTexto, Trim(participcomplemento) + ';');
          write(ArquivoTexto, Trim(participbairro) + ';');
          write(ArquivoTexto, Trim(participnome) + ';');
          write(ArquivoTexto, Trim(participuf) + ';');
          write(ArquivoTexto, Trim(participcep) + ';');
          write(ArquivoTexto, 'CNPJ: ' + Copy(cdsEmpresaProp.fieldByname('NUMDOCUMENTO').asstring, 1, 2) + '.' +
            Copy(cdsEmpresaProp.fieldByname('NUMDOCUMENTO').asstring, 3, 3) + '.' +
            Copy(cdsEmpresaProp.fieldByname('NUMDOCUMENTO').asstring, 6, 3) + '/' +
            Copy(cdsEmpresaProp.fieldByname('NUMDOCUMENTO').asstring, 9, 4) + '-' +
            Copy(cdsEmpresaProp.fieldByname('NUMDOCUMENTO').asstring, 13, 2) + ';');
          write(ArquivoTexto, Trim('Telefone: ' + cdsEmpresaProp.fieldByname('TELEFONEFORMATADO').asstring) + ';');
          write(ArquivoTexto, Trim(cdsEmpresaProp.fieldByname('RAZAOSOCIAL').asstring) + ';');
          write(ArquivoTexto, Trim(cdsEmpresaProp.fieldByname('ENDEREO').asstring) + ', ' +
            Trim(cdsEmpresaProp.fieldByname('NUMERO').asstring) + ', ' +
            Trim(cdsEmpresaProp.fieldByname('COMPLEMENTO').asstring) + ' - ' +
            Trim(cdsEmpresaProp.fieldByname('BAIRRO').asstring) + ' - CEP.: ' +
            Trim(cdsEmpresaProp.fieldByname('CEP').asstring) + ' - ' +
            Trim(cdsEmpresaProp.fieldByname('CIDADE').asstring) + ' - ' +
            Trim(cdsEmpresaProp.fieldByname('UF').asstring) + ';');
          write(ArquivoTexto, edtData.text + ';');
          write(ArquivoTexto, Trim(CPF) + ';');
          write(ArquivoTexto, Trim(NomeBene) + ';');
          write(ArquivoTexto, Trim(CodNatureza) + ';');
          write(ArquivoTexto, Trim(cdsMatLocFunc.fieldByname('MATRICULA').Asstring) + ';');
          write(ArquivoTexto, sVal31 + ';');
          write(ArquivoTexto, sVal32 + ';');
          write(ArquivoTexto, sVal33 + ';');
          write(ArquivoTexto, sVal34 + ';');
          write(ArquivoTexto, sVal35 + ';');
          write(ArquivoTexto, sVal41 + ';');
          write(ArquivoTexto, sVal42 + ';');
          write(ArquivoTexto, sVal43 + ';');
          write(ArquivoTexto, sVal44 + ';');
          write(ArquivoTexto, sVal45 + ';');
          write(ArquivoTexto, sVal46 + ';');
          write(ArquivoTexto, sVal47 + ';');
          write(ArquivoTexto, sVal51 + ';');
          write(ArquivoTexto, sVal52 + ';');
          //CPrev - 27340 - write(ArquivoTexto, 'AAP/VR - UNIMED  '+ sVal61 +';');
          write(ArquivoTexto, 'UNIMED  ' + sVal61 + ';'); //CPrev - 27340
          write(ArquivoTexto, 'Plano Saúde CSN-Fator Moderador  ' + sVal62 + ';');
          write(ArquivoTexto, 'Bradesco Seguros-CSN  ' + sVal63 + ';');

          If Trim(Pensionista[0].Nome) <> '' Then
            write(ArquivoTexto, Trim(Pensionista[0].Nome + ' - ' + Pensionista[0].CPF + ' : ' + Pensionista[0].ValorPensao + ' : ' + Pensionista[0].Valor13) + ';') //VLR64
          Else
            write(ArquivoTexto, Trim(Pensionista[0].Nome + ' ' + Pensionista[0].CPF + ' ' + Pensionista[0].ValorPensao + ' ' + Pensionista[0].Valor13) + ';'); //VLR64

          If Trim(Pensionista[1].Nome) <> '' Then
            write(ArquivoTexto, Trim(Pensionista[1].Nome + ' - ' + Pensionista[1].CPF + ' : ' + Pensionista[1].ValorPensao + ' : ' + Pensionista[1].Valor13) + ';') //VLR65
          Else
            write(ArquivoTexto, Trim(Pensionista[1].Nome + ' ' + Pensionista[1].CPF + ' ' + Pensionista[1].ValorPensao + ' ' + Pensionista[1].Valor13) + ';'); //VLR65

          If Trim(Pensionista[2].Nome) <> '' Then
            write(ArquivoTexto, Trim(Pensionista[2].Nome + ' - ' + Pensionista[2].CPF + ' : ' + Pensionista[2].ValorPensao + ' : ' + Pensionista[2].Valor13) + ';') //VLR66
          Else
            write(ArquivoTexto, Trim(Pensionista[2].Nome + ' ' + Pensionista[2].CPF + ' ' + Pensionista[2].ValorPensao + ' ' + Pensionista[2].Valor13) + ';'); //VLR66

          If Trim(Pensionista[3].Nome) <> '' Then
            write(ArquivoTexto, Trim(Pensionista[3].Nome + ' - ' + Pensionista[3].CPF + ' : ' + Pensionista[3].ValorPensao + ' : ' + Pensionista[3].Valor13) + ';') //VLR67
          Else
            write(ArquivoTexto, Trim(Pensionista[3].Nome + ' ' + Pensionista[3].CPF + ' ' + Pensionista[3].ValorPensao + ' ' + Pensionista[3].Valor13) + ';'); //VLR67

          write(ArquivoTexto, ';'); //VLR68

          //CPrev - Pend. 27407 - 11/02/2008 - Início
          //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Inicio
          pIsPensionistasAntigos := (CmbModelo.LookupValue = '33');
          CtrlInformeRendimentos.pTipoAposentadoPensionistas := pIsPensionistasAntigos;

          // Paulo Nobre SOL 268555 PPM 1262100
          cdsExisteJud.Data := CtrlInformerendimentos.BuscaDepJudicial(
            cdsdados.fieldByname('ENDEREO').asstring,
            -1,
            //          Trunc(rIdPessoa),
            StrToInt(edtdata.text),
            pIsPensionistasAntigos);
          //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Fim
          If Not cdsExisteJud.eof Then
            Begin
              sDadosAcao := ' Proc.Jud. ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString +
                ' - ' + cdsExisteJud.fieldByname('DATAINICIO').AsString + '   -   ' +
                cdsExisteJud.fieldByname('CODVARA').Asstring + '-' + cdsExisteJud.fieldByname('NOMEVARA').asstring +
                ' - Rend.: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORRENDJUD').AsFloat) +
                ' - IRRF : ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUD').AsFloat) +
                ' - Rend 13º ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORRENDJUD13').AsFloat) +
                ' - IRRF 13º ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUD13').AsFloat) + #13;
            End;

          // Paulo Nobre SOL 268555 PPM 1262100
          cdsCompIRRF.Data := CtrlInformerendimentos.BuscaCompensaIR(
            -1,
            //          Trunc(rIdPessoa),
            strToInt(edtdata.text),
            Pensionista[0].CPF);

          If Not cdsCompIRRF.eof Then
            Begin
              sDadosCompensa := ' Num. Proc. ' + cdsCompIRRF.fieldByname('NUMEROPROCESSO').AsString +
                ' - ' + cdsCompIRRF.fieldByname('ANOMESINICIO').AsString + '   -   ' +
                cdsCompIRRF.fieldByname('CODVARA').Asstring + '-' + cdsCompIRRF.fieldByname('NOMEVARA').asstring +
                ' - IR. Compensado: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsCompIRRF.fieldByname('VALORIRJUD').AsFloat) + #13;
            End;

          cdsExisteJud.Free;

          If sDadosAcao <> '' Then
            write(Arquivotexto, sDadosAcao + ';');

          If sDadosCompensa <> '' Then
            write(Arquivotexto, sDadosCompensa + ';');
          //CPrev - Pend. 27407 - 11/02/2008 - Fim

          write(ArquivoTexto, Trim(cdsEmpresaProp.fieldByname('RAZAOSOCIAL').asstring) + ';');
          write(ArquivoTexto, dtdtdata.text + ';');
          writeln(ArquivoTexto, Trim(edtObservacao.text));
        End; //while principal
    End
  Else
    Begin
      MsgDlg('Não há dados a serem gerados.', 'Aviso', mtWarning, [mbOK], 0);
      exit;
    End;
  prgBarAtuFluxo.Position := 0;
  MsgDlg('Arquivo Gerado com Sucesso', 'Aviso', mtWarning, [mbOK], 0);
End;

Procedure TFrmConfigRelatInformeMT.rgInformeClick(Sender: TObject);
Begin
  Inherited;
  If CtrlInformeRendimentos.BuscaCodEmProp = 2 Then
    gbObservacao.Visible := True
  Else
    gbObservacao.Visible := False;
End;

Procedure TFrmConfigRelatInformeMT.edtRubricaKeyPress(Sender: TObject;
  Var Key: Char);
Begin
  Inherited;
  If Not ((key In ['0'..'9']) Or (key In [#9, #16, #27, #8])) Then
    Begin
      key := #0;
    End;
End;

Procedure TFrmConfigRelatInformeMT.rgSistemaClick(Sender: TObject);
Begin
  Inherited;
  LblRubrica.Visible := False;
  edtRubrica.Visible := False;
End;

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroTipoZERO: String;
Var
  sLinha: String;

Begin
  //Bruno Bastos - SOL 109019 - if (rgSistema.ItemIndex = 3) then
  If (rgSistema.ItemIndex = 3) Or (rgSistema.ItemIndex = 5) Then //Bruno Bastos - SOL 109019
    Begin
      sLinha := '0FUNCEF      ' +
        FormatDateTime('ddmmyyyy', dtdtData.Date) +
        UpperCase(Trim(edtNome.Text)) + CtrlInformeRendimentos.Completa(' ', 40 - Length(Trim(edtNome.Text))) +
        CtrlInformeRendimentos.Completa(' ', 204);
    End
  Else
    Begin
      If Not chkPensaoAlimenticia.checked Then
        Begin
          sLinha := '0FUNCEF      ' +
            FormatDateTime('ddmmyyyy', dtdtData.Date) +
            UpperCase(Trim(edtNome.Text)) + CtrlInformeRendimentos.Completa(' ', 40 - Length(Trim(edtNome.Text))) +
            CtrlInformeRendimentos.Completa(' ', 204);
        End
      Else
        Begin
          sLinha := '0FUNCEFIRFPA ' +
            FormatDateTime('ddmmyyyy', dtdtData.Date) +
            UpperCase(Trim(edtNome.Text)) + CtrlInformeRendimentos.Completa(' ', 40 - Length(Trim(edtNome.Text))) +
            CtrlInformeRendimentos.Completa(' ', 145);
        End;
    End;
  Result := sLinha;
End;

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroTipoUm: String;
Var
  sLinha,
    sSQL: String;
  iPessoa: Integer;

Begin

  //Bruno Bastos - SOL 109019 - If rgSistema.ItemIndex = 3 then
  If (rgSistema.ItemIndex = 3) Or (rgSistema.ItemIndex = 5) Then //Bruno Bastos - SOL 109019
    Begin

      sLinha := '10043692300019008007069000FUNDACAO DOS ECONOMIARIOS FEDERAIS FUNCEF        SCN Q.02, BLOCO A-ED. CORPORATE FINANCIAL CENTER 12o ANDAR BRASILIA                                BRASILIA  DISTRITO FEDERAL' +
        CtrlInformeRendimentos.Completa(' ', 65);

    End
  Else
    Begin
      If Not chkPensaoAlimenticia.checked Then
        Begin

          sLinha := '10043692300019008007069000FUNDACAO DOS ECONOMIARIOS FEDERAIS FUNCEF        SCN Q.02, BLOCO A-ED. CORPORATE FINANCIAL CENTER 12o ANDAR BRASILIA                                BRASILIA  DISTRITO FEDERAL' +
            CtrlInformeRendimentos.Completa(' ', 65);

        End
      Else
        Begin
          cdsAlimentante.Close;
          sSQL :=
            // Paulo Nobre SOL 268555 PPM 1262100
  //            'SELECT DISTINCT IDPESSOA FROM RUBRICAINDIV WHERE IDFAVORECIDO = ' + cdsdados.fieldByname('IDPESSOA').AsString;

        // Darivaldo Alencar SIG.19537 -- inicio
        //  'SELECT DISTINCT IDPESSOA FROM RUBRICAINDIV WHERE IDFAVORECIDO IN          ' +
        //    '    (SELECT IDPESSOA       ' +
        //    '       FROM PESSOA         ' +
        //    '      WHERE NUMDOCUMENTO = ' + QuotedStr(cdsdados.fieldByname('CPF').AsString) + ')';

         ' SELECT DISTINCT R.IDPESSOA FROM RUBRICAINDIV R, PESSOA P WHERE IDFAVORECIDO IN '+
         ' (SELECT IDPESSOA FROM PESSOA  WHERE NUMDOCUMENTO = '+ QuotedStr(cdsdados.fieldByname('CPF').AsString) + ')'+
         ' AND  R.IDPESSOA = P.IDPESSOA '+
         ' AND P.NOME = '+QuotedStr(cdsdados.fieldByname('NOMEALIMENTANTE').AsString);
         //Darivaldo Alencar SIG.19537 -- fim

          sqlAlimentante.SQL.Text := sSQL;
          sqlAlimentante.Open;
          iPessoa := cdsAlimentante.FieldByName('IDPESSOA').AsInteger;

          cdsAlimentante.Close;
          sSQL :=

          'SELECT  /*+ LEADING(PES) INDEX(PES XPKPESSOA) */ ' + #13 +
            '    PES.NUMDOCUMENTO AS CPF, ' + #13 +
            '    TEL.NUMERO, ' + #13 +
            '    PES.NOME, ' + #13 +
            '    TRIM(END.LOGRADOURO) || TRIM(END.NUMERO) AS ENDERECO , ' + #13 +
            '    TRIM(END.NUMERO) AS NUMRESID, ' + #13 +
            '    TRIM(END.COMPLEMENTO) AS COMPLEMENTO, ' + #13 +
            '    TRIM(END.BAIRRO) AS BAIRRO, ' + #13 +

          '    TRIM(CID.NOME) AS CIDADE, ' + #13 +
            '    TRIM(CID.UF) AS UF' + #13 +

          'FROM ' + #13 +
            '    PESSOA PES, ' + #13 +
            '    ENDPESS END, ' + #13 +
            '    TELENDPESS TEL, ' + #13 +
            '    RUBRICAINDIV RUB ' + #13 +
            '    ,CIDADES CID ' + #13 +
            'WHERE ' + #13 +
            ' RUB.IDFAVORECIDO IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(cdsdados.fieldByname('CPF').AsString) + ')' + #13 +

          //            '    RUB.IDFAVORECIDO     = ' + cdsdados.fieldByname('IDPESSOA').AsString + ' ' + #13 +

          'AND PES.IDPESSOA         = ' + IntToStr(iPessoa) + ' ' + #13 +
            'AND NVL(PES.IDENDCORRESP, PES.IDENDRESIDENCIAL) = END.IDENDERECO(+) ' + #13 +
            'AND PES.IDENDRESIDENCIAL = TEL.IDENDERECO(+) ' + #13 +
            'AND END.IDCIDADES      = CID.IDCIDADES(+) ';
          sqlAlimentante.SQL.Text := sSQL;
          sqlAlimentante.Open;

          sLinha := '1' +
            StrPadLeft(Copy(cdsAlimentante.fieldByname('CPF').Asstring, 1, 11), 11, '0') +
            StrPadLeft(Copy(cdsAlimentante.fieldByname('NUMERO').Asstring, 1, 12), 12, '0') +
            StrPadRight(Copy(cdsAlimentante.fieldByname('NOME').Asstring, 1, 60), 60, ' ') +
            StrPadRight(Copy(cdsAlimentante.fieldByname('ENDERECO').Asstring, 1, 50), 50, ' ') +
            StrPadRight(Copy(cdsAlimentante.fieldByname('NUMRESID').Asstring, 1, 8), 8, ' ') +
            StrPadRight(Copy(cdsAlimentante.fieldByname('COMPLEMENTO').Asstring, 1, 20), 20, ' ') +
            StrPadRight(Copy(cdsAlimentante.fieldByname('BAIRRO').Asstring, 1, 20), 20, ' ') +
            StrPadRight(Copy(cdsAlimentante.fieldByname('CIDADE').Asstring, 1, 20), 20, ' ') +
            StrPadRight(Copy(cdsAlimentante.fieldByname('UF').Asstring, 1, 2), 2, ' ') +
            ' ' +
            '0';
        End;
    End;

  Result := sLinha;
End;

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroTipoDois: String;
Var
  sLinha,
    sNatureza: String;
Begin
  sNatureza := {cdsdados.FieldByName('CODNATUREZA').AsString + ' - ' + } Trim(cdsdados.fieldByname('DESCRICAO').Asstring); //Marcio Sanches Spinosa SOL 225143 KINTANA 2058992

  //Bruno Bastos - SOL 109019 - if rgSistema.ItemIndex = 3 then
  If (rgSistema.ItemIndex = 3) Or (rgSistema.ItemIndex = 5) Then //Bruno Bastos - SOL 109019
    Begin
      sLinha := '2' + edtData.Text + cdsdados.fieldByname('CPF').Asstring +
        Trim(copy(cdsdados.fieldByname('NOMEBENEF').Asstring, 1, 40)) + CtrlInformeRendimentos.Completa(' ', 40 - Length(Trim(cdsdados.fieldByname('NOMEBENEF').Asstring))) +
        UpperCase(copy(sNatureza, 1, 63) + CtrlInformeRendimentos.Completa(' ', 63 - Length(sNatureza))) +
        '1' +
        copy(cdsMatLocFunc.fieldByname('MATRICULA').Asstring, 1, 7) + CtrlInformeRendimentos.Completa(' ', 7 - Length(cdsMatLocFunc.fieldByname('MATRICULA').Asstring)) +
        Copy(cdsdados.fieldByname('ENDEREO').asstring, 1, 60) + CtrlInformeRendimentos.Completa(' ', 60 - Length(cdsdados.fieldByname('ENDEREO').asstring)) +

      Copy(cdsdados.fieldByname('NUMERO').asstring, 1, 8) + CtrlInformeRendimentos.Completa(' ', 8 - Length(cdsdados.fieldByname('NUMERO').asstring)) +
        Copy(cdsdados.fieldByname('COMPLEMENTO').asstring, 1, 20) + CtrlInformeRendimentos.Completa(' ', 20 - Length(cdsdados.fieldByname('COMPLEMENTO').asstring)) +
        Copy(cdsdados.fieldByname('BAIRRO').asstring, 1, 20) + CtrlInformeRendimentos.Completa(' ', 20 - Length(cdsdados.fieldByname('BAIRRO').asstring)) +
        Copy(cdsdados.fieldByname('NOME').asstring, 1, 20) + CtrlInformeRendimentos.Completa(' ', 20 - Length(cdsdados.fieldByname('NOME').asstring)) +
        Trim(copy(cdsdados.fieldByname('UF').asstring, 1, 2)) + CtrlInformeRendimentos.Completa(' ', 2 - Length(Trim(cdsdados.fieldByname('UF').asstring))) +
        cdsdados.fieldByname('CEP').asstring + CtrlInformeRendimentos.Completa(' ', 8 - Length(Trim(cdsdados.fieldByname('CEP').asstring)));
    End
  Else
    Begin
      If Not chkPensaoAlimenticia.checked Then
        Begin
          sLinha := '2' +
            StrPadRight(Copy(edtData.Text, 1, 4), 4, ' ') +
            StrPadLeft(Copy(cdsdados.fieldByname('CPF').Asstring, 1, 11), 11, '0') +
            StrPadRight(Copy(cdsdados.fieldByname('NOMEBENEF').Asstring, 1, 60), 60, ' ') +
            StrPadRight(Copy(sNatureza, 1, 40), 40, ' ') +
            '1' +
            StrPadLeft(Copy(cdsMatLocFunc.fieldByname('MATRICULA').Asstring, 1, 7), 7, ' ') +
            StrPadRight(Copy(cdsdados.fieldByname('ENDEREO').Asstring, 1, 60), 60, ' ') +
            StrPadRight(Copy(cdsdados.fieldByname('NUMERO').Asstring, 1, 8), 8, ' ') +
            StrPadRight(Copy(cdsdados.fieldByname('COMPLEMENTO').Asstring, 1, 20), 20, ' ') +
            StrPadRight(Copy(cdsdados.fieldByname('BAIRRO').Asstring, 1, 20), 20, ' ') +
            StrPadRight(Copy(cdsdados.fieldByname('NOME').Asstring, 1, 20), 20, ' ') +
            StrPadRight(Copy(cdsdados.fieldByname('UF').Asstring, 1, 2), 2, ' ') +
            StrPadLeft(Copy(cdsdados.fieldByname('CEP').Asstring, 1, 8), 8, '0') +
            '   ';
        End
      Else
        sLinha := '2' + Copy(edtData.Text, 1, 4) +
          StrPadLeft(Copy(cdsdados.fieldByname('CPF').Asstring, 1, 11), 11, '0') +
          StrPadRight(Copy(cdsdados.fieldByname('NOMEBENEF').Asstring, 1, 51), 51, ' ') +
          StrPadRight(Copy(cdsdados.fieldByname('ENDEREO').asstring, 1, 60), 60, ' ') +
          StrPadRight(Copy(cdsdados.fieldByname('NUMERO').asstring, 1, 8), 8, ' ') +
          StrPadRight(Copy(cdsdados.fieldByname('COMPLEMENTO').asstring, 1, 20), 20, ' ') +
          StrPadRight(Copy(cdsdados.fieldByname('BAIRRO').asstring, 1, 20), 20, ' ') +
          StrPadRight(Copy(cdsdados.fieldByname('NOME').asstring, 1, 20), 20, ' ') +
          StrPadRight(copy(cdsdados.fieldByname('UF').asstring, 1, 2), 2, ' ') +
          ' ' +
          StrPadRight(Copy(cdsdados.fieldByname('CEP').asstring, 1, 8), 8, ' ');

    End;
  Result := sLinha;
End;

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroTipoTres: String;
Var
  sLinha,
    sTotalRend,
    sPensao,
    sImposto,
    sRendFUNCEF,
    sRendINSS,
    sContribFUNCEF,
    sPensaoFUNCEF,
    sPensaoINSS,
    sImpostoFUNCEF,
    sImpostoINSS: String;

Begin
  //Bruno Bastos - SOL 109019 - if rgSistema.ItemIndex = 3 then
  If (rgSistema.ItemIndex = 3) Or (rgSistema.ItemIndex = 5) Then //Bruno Bastos - SOL 109019
    Begin
      If (CmbModelo.LookupValue <> '150') Then //Marcio Sanches Spinosa SOL 247706 PPM 656875
        Begin
          sRendFUNCEF := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3011').AsFloat)), '.', '', [rfReplaceAll]);
          sImpostoFUNCEF := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3021').AsFloat)), '.', '', [rfReplaceAll]);
        End
          //Marcio Sanches Spinosa SOL 247706 PPM 656875 - Inicio
      Else
        Begin
          sRendFUNCEF := StringReplace(OraNumero(FormatFloat('######0.00', 0)), '.', '', [rfReplaceAll]);
          sImpostoFUNCEF := StringReplace(OraNumero(FormatFloat('######0.00', 0)), '.', '', [rfReplaceAll]);
        End;
      //      sImpostoFUNCEF := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3021').AsFloat)), '.', '', [rfReplaceAll]);
           //Marcio Sanches Spinosa SOL 247706 PPM 656875 - Fim
      sLinha := '3' +
        CtrlInformeRendimentos.CompletaZero(sRendFUNCEF, 12) +
        CtrlInformeRendimentos.CompletaZero(sRendFUNCEF, 12) +
        CtrlInformeRendimentos.CompletaZero(sImpostoFUNCEF, 12) +
        CtrlInformeRendimentos.CompletaZero(sImpostoFUNCEF, 12) +
        CtrlInformeRendimentos.Completa(' ', 204);
      Result := sLinha;
    End
  Else
    Begin
      sRendFUNCEF := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3011').AsFloat)), '.', '', [rfReplaceAll]);
      sRendINSS := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3012').AsFloat)), '.', '', [rfReplaceAll]);
      sTotalRend := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3011').AsFloat + cdsDados.FieldByName('VLR3012').AsFloat)), '.', '', [rfReplaceAll]);

      sContribFUNCEF := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3021').AsFloat)), '.', '', [rfReplaceAll]);

      sPensaoFUNCEF := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3031').AsFloat)), '.', '', [rfReplaceAll]);
      sPensaoINSS := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3032').AsFloat)), '.', '', [rfReplaceAll]);
      sPensao := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3031').AsFloat + cdsDados.FieldByName('VLR3032').AsFloat)), '.', '', [rfReplaceAll]);

      sImpostoFUNCEF := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3041').AsFloat)), '.', '', [rfReplaceAll]);
      sImpostoINSS := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3042').AsFloat)), '.', '', [rfReplaceAll]);
      sImposto := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3041').AsFloat + cdsDados.FieldByName('VLR3042').AsFloat)), '.', '', [rfReplaceAll]);

      If Not chkPensaoAlimenticia.checked Then
        Begin
          sLinha := '3' +
            CtrlInformeRendimentos.CompletaZero(sRendFUNCEF, 12) +
            CtrlInformeRendimentos.CompletaZero(sRendINSS, 12) +
            CtrlInformeRendimentos.CompletaZero(sTotalRend, 12) +
            CtrlInformeRendimentos.CompletaZero(sContribFUNCEF, 12) +
            '000000000000' +
            CtrlInformeRendimentos.CompletaZero(sContribFUNCEF, 12) +
            CtrlInformeRendimentos.CompletaZero(sPensaoFUNCEF, 12) +
            CtrlInformeRendimentos.CompletaZero(sPensaoINSS, 12) +
            CtrlInformeRendimentos.CompletaZero(sPensao, 12) +
            CtrlInformeRendimentos.CompletaZero(sImpostoFUNCEF, 12) +
            CtrlInformeRendimentos.CompletaZero(sImpostoINSS, 12) +
            CtrlInformeRendimentos.CompletaZero(sImposto, 12) +
            CtrlInformeRendimentos.Completa(' ', 120);
          //Result := sLinha;   // Edilaine - SOL 200285 / KTN 1932879 - comentado
        End
      Else
        Begin
          inc(iTotalLinhas);
          sLinha := '3' +
            'Total dos Rendimentos Tributáveis                                                                   ' +
            CtrlInformeRendimentos.CompletaZero(sRendFUNCEF, 12) +
            CtrlInformeRendimentos.Completa(' ', 93);

          //WriteLn( ArquivoTexto, sLinha );   // Edilaine - SOL 200285 / KTN 1932879 - comentado
          inc(iTotalLinhas);
        End;
      Result := sLinha; // Edilaine - SOL 200285 / KTN 1932879
    End;
End;

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroTipoQuatro: String;
Var
  sLinha: String;

  fTotalFuncef,
    fTotalInss,
    fTotal,
    fTotal41,
    fTotal42,
    fTotal43,
    fTotal44,
    fTotal45,
    fTotal46,
    fTotal47,
    fTotal48 // Paulo Nobre - SOL257831/18009 PPM 1207646 - início
  : Extended;

Begin

  //Bruno Bastos - SOL 109019 - if rgSistema.ItemIndex = 3 then
  If (rgSistema.ItemIndex = 3) Or (rgSistema.ItemIndex = 5) Then //Bruno Bastos - SOL 109019
    Begin
      sLinha := '4' +
        CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4011').AsFloat + cdsDados.FieldByName('VLR4021').AsFloat)), '.', '', [rfReplaceAll]), 12) +
        CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4011').AsFloat + cdsDados.FieldByName('VLR4021').AsFloat)), '.', '', [rfReplaceAll]), 12) +
        CtrlInformeRendimentos.Completa(' ', 240);
    End
  Else
    Begin
      If Not chkPensaoAlimenticia.Checked Then
        Begin

          fTotal41 := cdsDados.FieldByName('VLR4011').AsFloat + cdsDados.FieldByName('VLR4012').AsFloat;
          fTotal42 := cdsDados.FieldByName('VLR4021').AsFloat + cdsDados.FieldByName('VLR4022').AsFloat;
          fTotal43 := cdsDados.FieldByName('VLR4031').AsFloat + cdsDados.FieldByName('VLR4032').AsFloat;
          //      fTotal44     := cdsDados.FieldByName('VLR4042').AsFloat;
          fTotal44 := cdsDados.FieldByName('VLR4041').AsFloat; //Marcio Sanches Spinosa SOL 225143 KINTANA 2058992
          fTotal45 := cdsDados.FieldByName('VLR4051').AsFloat;
          fTotal46 := cdsDados.FieldByName('VLR4061').AsFloat;
          fTotal47 := cdsDados.FieldByName('VLR4071').AsFloat + cdsDados.FieldByName('VLR4072').AsFloat;
          fTotalFuncef := cdsDados.FieldByName('VLR4011').AsFloat +
            cdsDados.FieldByName('VLR4021').AsFloat +
            cdsDados.FieldByName('VLR4031').AsFloat +
            cdsDados.FieldByName('VLR4051').AsFloat +
            cdsDados.FieldByName('VLR4061').AsFloat +
            cdsDados.FieldByName('VLR4071').AsFloat;

          fTotalInss := cdsDados.FieldByName('VLR4012').AsFloat +
            cdsDados.FieldByName('VLR4022').AsFloat +
            cdsDados.FieldByName('VLR4032').AsFloat +
            // cdsDados.FieldByName('VLR4042').AsFloat +
          cdsDados.FieldByName('VLR4072').AsFloat;

          fTotal := fTotalFuncef + fTotalINSS;
          fTotal48 := cdsDados.FieldByName('VLR4081').AsFloat; // Paulo Nobre - SOL257831/18009 PPM 1207646 - início
          //fTotal48 := (cdsDados.FieldByName('VLR4081').AsFloat + cdsDados.FieldByName('VLR4082').AsFloat); // Paulo Nobre - SOL257831/18009 PPM 1207646 - início // SOL 268002 PPM 1245182

          sLinha := '4' +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4011').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4012').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', fTotal41)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4021').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4022').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', fTotal42)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4031').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4032').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', fTotal43)), '.', '', [rfReplaceAll]), 12) +
            // '000000000000'                          +  //Vinicius Maciel - SOL 175889 - KINTANA 1602395
//                CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',cdsDados.FieldByName('VLR4042').AsFloat)),'.','',[rfReplaceAll]),12)                          +
//Marcio Sanches Spinosa SOL 217765 KINTANA 2059157 - Inicio
          CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', fTotal44)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4042').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            //                Marcio Sanches Spinosa SOL 217765 KINTANA 2059157 - Fim
          CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', fTotal44)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4051').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            '000000000000' +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', fTotal45)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4061').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            '000000000000' +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', fTotal46)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4071').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4072').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', fTotal47)), '.', '', [rfReplaceAll]), 12) +
            // Paulo Nobre - SOL257831/18009 PPM 1207646 - início
          CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4081').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            //CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4082').AsFloat)), '.', '', [rfReplaceAll]), 12) + //// SOL 268002 PPM 1245182
          CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', 0)), '.', '', [rfReplaceAll]), 12) + //// SOL 268002 PPM 1245182
          CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', fTotal48)), '.', '', [rfReplaceAll]), 12) +
            // Paulo Nobre - SOL257831/18009 PPM 1207646 - Fim

//Vinicius Maciel - SOL 175889 - KINTANA 1602395
          CtrlInformeRendimentos.Completa(' ', 12);
          //                CtrlInformeRendimentos.Completa(' ',48);
                          //Vinicius Maciel - SOL 175889 - KINTANA 1602395 - FIM
        End
      Else
        Begin
          sLinha := '4' +
            'Décimo Terceiro Salário                                                                             ' +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4011').AsFloat)), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.Completa(' ', 93);
        End;
    End;
  Result := sLinha;
End;

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroTipoCinco: String;
Var sLinha, sValor: String;
  f13Funcef, f13INSS: Extended;
Begin
  f13Funcef := cdsDados.FieldByName('VLR5011').AsFloat;
  f13INSS := cdsDados.FieldByName('VLR5012').AsFloat;
  sValor := StringReplace(OraNumero(FormatFloat('######0.00', f13Funcef + f13INSS)), '.', '', [rfReplaceAll]);

  sLinha := '5' +
    CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR5011').AsFloat)), '.', '', [rfReplaceAll]), 12) +
    CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR5012').AsFloat)), '.', '', [rfReplaceAll]), 12) +
    CtrlInformeRendimentos.CompletaZero(sValor, 12);

  // Felipe A. Santos - SOL 244545.16839 PPM 624515
  // Incluir no Bloco 5 os valores do RF sobre o 13º salário
  sLinha := sLinha +
    CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR5021').AsFloat)), '.', '', [rfReplaceAll]), 12) +
    CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR5022').AsFloat)), '.', '', [rfReplaceAll]), 12) +
    CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('TOT502').AsFloat)), '.', '', [rfReplaceAll]), 12) +
    // Paulo Nobre - SOL257831/18009 PPM 1207646 - início
  CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR5031').AsFloat)), '.', '', [rfReplaceAll]), 12) +
    //CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR5032').AsFloat)), '.', '', [rfReplaceAll]), 12) + // SOL 268002 PPM 1245182
  CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', 0)), '.', '', [rfReplaceAll]), 12) + // SOL 268002 PPM 1245182
  CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('TOT503').AsFloat)), '.', '', [rfReplaceAll]), 12) +
    // Paulo Nobre - SOL257831/18009 PPM 1207646 - fim

  CtrlInformeRendimentos.Completa(' ', 228);
  ////////////////////////////////////////////////////////////////////////////

  Result := sLinha;
End;

// Otacilio SOL 203766 KTN 1968942 ** Inicio **

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroTipoCincoTribRegressiva: String;
Var
  sLinha,
    sValor: String;
  f13Funcef: Extended;
Begin
  f13Funcef := cdsDados.FieldByName('VLR5011').AsFloat;
  sValor := StringReplace(OraNumero(FormatFloat('######0.00', f13Funcef)), '.', '', [rfReplaceAll]);

  sLinha := '5' +
    CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR5011').AsFloat)), '.', '', [rfReplaceAll]), 12) +
    CtrlInformeRendimentos.CompletaZero(sValor, 12) +
    CtrlInformeRendimentos.Completa(' ', 228);
  Result := sLinha;
End;
// Otacilio SOL 203766 KTN 1968942 ** Fim **

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroTipoSeis: String;
Var
  sLinha,
    sDescricao,
    sValor,
    sNumProcesso: String;
  sCodigoLinha: String;
  sFiltro: String;
  rValor: Real;
  bCabecalhoProcJud: Boolean; //Cássio Rovaroto - SIG nº 74355

Begin
  //Vinicius Maciel SOL 174070 - KTN 1570242
  If (StrtoInt(edtdata.text) >= 2011) And (rgSistema.ItemIndex = 1) Then
    sCodigoLinha := '7'
  Else
    sCodigoLinha := '6';
  //Vinicius Maciel SOL 174070 - KTN 1570242 - FIM
  
  If cdsPensionista.active Then
    Begin
      cdsPensionista.First;

      If Not cdsPensionista.IsEmpty Then
        // Paulo Nobre SOL 268555 PPM 1262100
        cdsPensionista13.data := ctrlInformeRendimentos.BuscaCampo6sqlPensionistas13(
          -1,
          //cdsdados.FieldByName('IDPESSOA').AsInteger,
          strToInt(edtdata.text), edtRubrica.text,
          rgSistema.ItemIndex
          cdsdados.FieldByName('CPF').AsString);

      While Not cdsPensionista.eof Do
        Begin
          sDescricao := Trim(cdsPensionista.fieldByname('NOME').AsString) + ' CPF: ' + Trim(cdsPensionista.fieldByname('NUMDOCUMENTO').AsString) + ' Rend';

          If Length(sDescricao) < 100 Then
            sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

          //SIG85183.92415 - início
          if(CtrlInformeRendimentos.pLayout2019) or (CtrlInformeRendimentos.pLayout2021) then // Andre Imakawa - SIG 122151
            sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsPensionista.fieldByname('VALOR').AsFloat + ctrlInformeRendimentos.BuscaTotalPA(cdsPensionista.FieldByName('IDFAVORECIDO').AsString, edtdata.text, '161')))
          else
            sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsPensionista.fieldByname('VALOR').AsFloat));
          //SIG85183.92415 - fim

          inc(iTotalLinhas);

          // Alterado por Arnaldo V. Scarin em 08/02/2012
          // Essa alteração foi feita em decorrencia da mudança do Layout, incluindo o
          // Quadro 6 - RRA e movendo o Antigo quadro 6 (Info.Compl.) para o Quadro 7
          // Como esse arquivo é impresso e enviado para a CTIS, com as especificações
          // definidas para GEPAB (Mariangela), as alterações aqui feitas serão
          // Mapeadas no arquivo de instruções que serão enviados a essa PrintHouse.

          // sLinha := '6' +
          sLinha := sCodigoLinha +
            sDescricao +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.Completa(' ', 152);

          // Edilaine - SOL 180189 / KTN 1761859
          If bUsaTextFile Then
            WriteLn(ArquivoTexto, sLinha)
          Else begin
            reArquivo.Lines.Add(sLinha);
          end;
          // Edilaine - SOL 180189 / KTN 1761859 - fim

          cdsPensionista13.first;

          If Not cdsPensionista13.fieldByname('IDFAVORECIDO').isnull Then
            Begin
              sDescricao := Trim(cdsPensionista.fieldByname('NOME').AsString) + ' CPF: ' + Trim(cdsPensionista.fieldByname('NUMDOCUMENTO').AsString) + ' 13o.';

              If Length(sDescricao) < 100 Then
                sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

              If cdsPensionista13.Locate('IDFAVORECIDO', VarArrayOf([cdsPensionista.fieldByname('IDFAVORECIDO').Asstring]), [loPartialKey]) Then
              begin
                //SIG85183.92415 - início
                if(CtrlInformeRendimentos.pLayout2019) or (CtrlInformeRendimentos.pLayout2021) then // Andre Imakawa - SIG 122151
                  sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsPensionista13.fieldByname('VALOR').AsFloat + ctrlInformeRendimentos.BuscaTotalPA(cdsPensionista.FieldByName('IDFAVORECIDO').AsString, edtdata.text, '162')))
                else
                  sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsPensionista13.fieldByname('VALOR').AsFloat));
                //SIG85183.92415 - fim
              end
              Else
                sValor := FormatFloat('#,##0.00;(#,##0.00)', 0);

              inc(iTotalLinhas);
              // sLinha := '6' +
              sLinha := sCodigoLinha +
                sDescricao +
                CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
                CtrlInformeRendimentos.Completa(' ', 152);

              // Edilaine - SOL 180189 / KTN 1761859
              If bUsaTextFile Then
                WriteLn(ArquivoTexto, sLinha)
              Else
                reArquivo.Lines.Add(sLinha);
              // Edilaine - SOL 180189 / KTN 1761859 - fim
            End;

          cdsPensionista.Next;
        End;
    End;

  If cdsJud.active Then
    Begin
      bCabecalhoProcJud := False;
      cdsJud.First;
      while not cdsJud.Eof do
      begin
        //SIG85183.92415 - início
        if(ctrlInformeRendimentos.VerificarBitributacao(cdsJud.FieldByName('IDBENEFIRRF').AsString, cdsJud.FieldByName('NUMEROPROCESSO').AsString)) AND ((CtrlInformeRendimentos.pLayout2019) or(CtrlInformeRendimentos.pLayout2021)) then // Andre Imakawa - SIG 122151
            iNumIN := '1215'
        else
            iNumIN := '890';
        //SIG85183.92415 - fim

        If (cdsJud.FieldByName('VALORRENDJUD').AsFloat <> 0) Or
           (cdsJud.FieldByName('VALORIRJUD').AsFloat <> 0) Or
           (cdsJud.FieldByName('VALORRENDJUD13').AsFloat <> 0) Or
           (cdsJud.FieldByName('VALORIRJUD13').AsFloat <> 0) Then
        Begin
          If Trim(cdsJud.fieldByname('NUMEROPROCESSO').AsString) <> '' Then
            sNumProcesso := cdsJud.fieldByname('NUMEROPROCESSO').AsString
          Else
            sNumProcesso := '';

          //Ádler Teodoro de Souza SOL 108632 KINTANA  492608 - Início
          {Bruno Bastos - SOL: 112398 - Kintana: 520072
          sLinha := '6 Os rendimentos e os impostos depositados judicialmente, se for o caso, a seguir '+
                    'discriminados não foram adicionados às linhas 01 e 04 do Quadro 3, e linha 01 do '+
                    'Quadro 5, em razão de estarem com exigibilidade suspensa por determinação judicial. ';
          }

          //Bruno Bastos - SOL: 112398 - Kintana: 520072 - Início
          //Bruno Bastos - SOL: 119417 - Kintana: 571974 - Início
          If StrToInt(edtData.Text) >= 2008 Then
            Begin
              // sLinha := '6 Conforme determinação da RFB (IN nº 890, inciso III), os rendimentos e os impostos '+
              if not bCabecalhoProcJud then
              begin
                sLinha := sCodigoLinha +
                  ' Conforme determinação da RFB (IN nº ' + iNumIN + ', inciso III), os rendimentos e os impostos ' + //SIG85183.92415 
                  'depositados judicialmente a seguir discriminados, não foram adicionados às linhas 01 ' +
                  'e 04 do Quadro 3, e linha 01 do Quadro 5, em razão de estarem com exigibilidade suspensa ' +
                  'por determinação judicial.';
                //Para evitar geração de uma vez do cabeçalho para Processos Judiciais
                bCabecalhoProcJud := True;//Cássio Rovaroto - SIG nº 74355

                {
              else
                sLinha := '6 Os rendimentos e os impostos depositados judicialmente, se for o caso, a seguir '+
                          'discriminados não foram adicionados às linhas 01 e 04 do Quadro 3, e linha 01 do '+
                          'Quadro 5, em razão de estarem com exigibilidade suspensa por determinação judicial. ';
              }
              //Bruno Bastos - SOL: 119417 - Kintana: 571974 - FIm
              //Bruno Bastos - SOL: 112398 - Kintana: 520072 - Fim

              sLinha := sLinha + CtrlInformeRendimentos.Completa(' ', 265 - Length(sLinha));

              // Edilaine - SOL 180189 / KTN 1761859
              If bUsaTextFile Then
                WriteLn(ArquivoTexto, sLinha)
              Else
                reArquivo.Lines.Add(sLinha);
              // Edilaine - SOL 180189 / KTN 1761859 - fim
              inc(iTotalLinhas);
              end;

            End;
          //Ádler Teodoro de Souza SOL 108632 KINTANA  492608 - Fim

          {Grava linha de rendimento mensal da ação judicial}
          sDescricao := ' Proc.Jud. ' + sNumProcesso + ' Rend.: ';

          If Length(sDescricao) < 100 Then
            sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

          sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsJud.fieldByname('VALORRENDJUD').AsFloat));
          inc(iTotalLinhas);

          //      sLinha := '6' +
          sLinha := sCodigoLinha +
            sDescricao +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.Completa(' ', 152);

          // Edilaine - SOL 180189 / KTN 1761859
          If bUsaTextFile Then
            WriteLn(ArquivoTexto, sLinha)
          Else
            reArquivo.Lines.Add(sLinha);
          // Edilaine - SOL 180189 / KTN 1761859 - fim

          {Grava linha do imposto de renda mensal da ação judicial}
          sDescricao := ' Proc.Jud. ' + sNumProcesso + ' IRRF.: ';
          If Length(sDescricao) < 100 Then
            sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

          sValor := FormatFloat('#,##0.00;(#,##0.00)', abs(cdsJud.fieldByname('VALORIRJUD').AsFloat));

          inc(iTotalLinhas);
          //      sLinha := '6' +
          sLinha := sCodigoLinha +
            sDescricao +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.Completa(' ', 152);

          // Edilaine - SOL 180189 / KTN 1761859
          If bUsaTextFile Then
            WriteLn(ArquivoTexto, sLinha)
          Else
            reArquivo.Lines.Add(sLinha);
          // Edilaine - SOL 180189 / KTN 1761859 - fim

          {Grava linha de rendimento de 13º da ação judicial}
          sDescricao := ' Proc.Jud. ' + sNumProcesso + ' Rend. 13o.: ';
          If Length(sDescricao) < 100 Then
            sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

          sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsJud.fieldByname('VALORRENDJUD13').AsFloat));

          inc(iTotalLinhas);
          //      sLinha := '6' +
          sLinha := sCodigoLinha +
            sDescricao +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.Completa(' ', 152);
          // Edilaine - SOL 180189 / KTN 1761859
          If bUsaTextFile Then
            WriteLn(ArquivoTexto, sLinha)
          Else
            reArquivo.Lines.Add(sLinha);
          // Edilaine - SOL 180189 / KTN 1761859 - fim

          {Grava linha do imposto de renda de 13º da ação judicial}
          sDescricao := ' Proc.Jud. ' + sNumProcesso + ' IRRF. 13o.: ';
          If Length(sDescricao) < 100 Then
            sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

          sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsJud.fieldByname('VALORIRJUD13').AsFloat));

          inc(iTotalLinhas);
          //      sLinha := '6' +
          sLinha := sCodigoLinha +
            sDescricao +
            CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
            CtrlInformeRendimentos.Completa(' ', 152);
          // Edilaine - SOL 180189 / KTN 1761859
          If bUsaTextFile Then
            WriteLn(ArquivoTexto, sLinha)
          Else
            reArquivo.Lines.Add(sLinha);
          // Edilaine - SOL 180189 / KTN 1761859 - fim

          //cdsJud.Next; //Cássio Rovaroto - SIG nº74355
        End;

        if (StrToInt(edtData.Text) >= 2018)and (rgSistema.ItemIndex = 1) then
          if (cdsJud.FieldByName('VALORJUDCONTEQ').AsFloat <> 0) Or
             (cdsJud.FieldByName('VALORJUDCONTEQ13').AsFloat <> 0) Or
             (cdsJud.FieldByName('VALORIRJUDEQ').AsFloat <> 0) Or
             (cdsJud.FieldByName('VALORIRJUDCONTEQ13').AsFloat <> 0) then
          begin
            If Trim(cdsJud.fieldByname('NUMEROPROCESSO').AsString) <> '' Then
              sNumProcesso := cdsJud.fieldByname('NUMEROPROCESSO').AsString
            Else
              sNumProcesso := '';

            if not bCabecalhoProcJud then
            begin
              sLinha := sCodigoLinha +
                ' Conforme determinação da RFB (IN nº ' + iNumIN + ', inciso III), os rendimentos e os impostos ' + //SIG85183.92415
                'depositados judicialmente a seguir discriminados, não foram adicionados às linhas 01 ' +
                'e 04 do Quadro 3, e linha 01 do Quadro 5, em razão de estarem com exigibilidade suspensa ' +
                'por determinação judicial.';

              sLinha := sLinha + CtrlInformeRendimentos.Completa(' ', 265 - Length(sLinha));

              If bUsaTextFile Then
                WriteLn(ArquivoTexto, sLinha)
              Else
                reArquivo.Lines.Add(sLinha);

              Inc(iTotalLinhas);
              bCabecalhoProcJud := True;
            end;

            sDescricao := ' Proc.Jud. ' + sNumProcesso + '  Contr. Extr.: ';

            if Length(sDescricao) < 100 then
              sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

            sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsJud.fieldByname('VALORJUDCONTEQ').AsFloat));
            Inc(iTotalLinhas);


            sLinha := sCodigoLinha +
                      sDescricao +
                      CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
                      CtrlInformeRendimentos.Completa(' ', 152);

            if bUsaTextFile Then
              WriteLn(ArquivoTexto, sLinha)
            else
              reArquivo.Lines.Add(sLinha);

            sDescricao := ' Proc.Jud. ' + sNumProcesso + ' IRRF.: ';
            if Length(sDescricao) < 100 then
              sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

            sValor := FormatFloat('#,##0.00;(#,##0.00)', abs(cdsJud.fieldByname('VALORIRJUDEQ').AsFloat));
            Inc(iTotalLinhas);

            sLinha := sCodigoLinha +
                      sDescricao +
                      CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
                      CtrlInformeRendimentos.Completa(' ', 152);


            if bUsaTextFile then
              WriteLn(ArquivoTexto, sLinha)
            else
              reArquivo.Lines.Add(sLinha);


            sDescricao := ' Proc.Jud. ' + sNumProcesso + ' Contr. Extr. 13o.: ';
            if Length(sDescricao) < 100 Then
              sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

            sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsJud.fieldByname('VALORJUDCONTEQ13').AsFloat));
            Inc(iTotalLinhas);

            sLinha := sCodigoLinha +
                      sDescricao +
                      CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
                      CtrlInformeRendimentos.Completa(' ', 152);

            if bUsaTextFile then
              WriteLn(ArquivoTexto, sLinha)
            else
              reArquivo.Lines.Add(sLinha);


            sDescricao := ' Proc.Jud. ' + sNumProcesso + ' IRRF. 13o.: ';
            if Length(sDescricao) < 100 Then
              sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

            sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsJud.fieldByname('VALORIRJUDCONTEQ13').AsFloat));

            Inc(iTotalLinhas);

            sLinha := sCodigoLinha +
                      sDescricao +
                      CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
                      CtrlInformeRendimentos.Completa(' ', 152);

            if bUsaTextFile then
              WriteLn(ArquivoTexto, sLinha)
            else
              reArquivo.Lines.Add(sLinha);

          end;
          cdsJud.Next;
      end;
        //Cássio Rovaroto - SIG nº 74355 - Fim
    End;

  //CPREV - 22/01/2008 - Início
  // Paulo Nobre SOL 268555 PPM 1262100
  cdsCompIRRF.Data := CtrlInformeRendimentos.BuscaCompensaIR(
    -1,
    //  cdsdados.FieldByName('IDPESSOA').AsInteger,
    StrToInt(edtData.Text),
    cdsdados.FieldByName('CPF').AsString);

  If Not cdsCompIRRF.IsEmpty Then
    Begin
      //Darivaldo Alencar SIG82520 -Inicio
      //sDescricao := ' Num. Proc. ' + cdsCompIRRF.fieldByname('NUMEROPROCESSO').AsString + cdsCompIRRF.fieldByname('CODVARA').Asstring
      sDescricao := ' Num. Proc. ' + cdsCompIRRF.fieldByname('NUMEROPROCESSO').AsString +      
      ' - ' + cdsCompIRRF.fieldByname('ANOMESINICIO').AsString +
      '   -   ' +cdsCompIRRF.fieldByname('CODVARA').Asstring +
      '-'   + cdsCompIRRF.fieldByname('NOMEVARA').asstring +
      ' - IR. Compensado: ';
      //Darivaldo Alencar SIG82520 -FIm

      If Length(sDescricao) < 100 Then
        sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

      inc(iTotalLinhas);

      //    sLinha := '6' +
      sLinha := sCodigoLinha +
        sDescricao +
        //Darivaldo Alencar SIG82520 -Inicio
        //CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(cdsCompIRRF.fieldByname('VALORIRJUD').AsString), '.', '', [rfReplaceAll]), 12) +
        CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('#,##0.00;(#,##0.00)',cdsCompIRRF.fieldByname('VALORIRJUD').AsFloat)), '.', '', [rfReplaceAll]), 12) +
        //Darivaldo Alencar SIG82520 -Fim


        CtrlInformeRendimentos.Completa(' ', 152);
      // Edilaine - SOL 180189 / KTN 1761859
      If bUsaTextFile Then
        WriteLn(ArquivoTexto, sLinha)
      Else
        reArquivo.Lines.Add(sLinha);
      // Edilaine - SOL 180189 / KTN 1761859 - fim
    End;
  //CPREV - 22/01/2008 - Fim
                                           
  //Início  - William Santana - SIG 37283
  If (StrtoInt(edtdata.text) >= 2011) And (rgSistema.ItemIndex = 1) Then
  begin
    CdsRRA.Data := CtrlInformeRendimentos.VerificaRRA(cdsdados.FieldByName('CPF').AsString,StrtoInt(edtdata.text));

    // Andre Imakawa - SIG 47630 - Inicio
    CdsRRA_Aux.Data := CtrlInformeRendimentos.VerificaRRA(cdsdados.FieldByName('CPF').AsString,StrtoInt(edtdata.text), '<');

    if not(CdsRRA.IsEmpty) then
      if not(CdsRRA_Aux.IsEmpty) then
      begin

        while not CdsRRA_Aux.Eof do
        begin
          sFiltro := ' MESCOBRANCA <= ' + QuotedStr(CdsRRA_Aux.FieldByName('MESCOBRANCA').AsString);
          rValor  := CdsRRA_Aux.fieldByname('VALOR').AsFloat;
          CdsRRA.Filtered := false;
          CdsRRA.Filter := sFiltro;
          CdsRRA.Filtered := true;
          CdsRRA.First;

          while not (CdsRRA.Eof) and (Abs(rValor) > 0 ) do
          begin
            CdsRRA.Edit;
            if CdsRRA.fieldByname('VALOR').AsFloat > Abs(rValor) then
            begin
               CdsRRA.fieldByname('VALOR').AsFloat := CdsRRA.fieldByname('VALOR').AsFloat - Abs(rValor);
               rValor := 0;
               CdsRRA.Post;
            end
            else
            begin
              rValor := rValor + CdsRRA.fieldByname('VALOR').AsFloat;
              CdsRRA.Delete;
            end;

            CdsRRA.next;
          end;

          CdsRRA.Filtered := false;
          CdsRRA.Filter := '';
          CdsRRA_Aux.next;
        end;
      end;
    // Andre Imakawa - SIG 47630 - Fim

    if not(CdsRRA.IsEmpty) then
    begin
       sLinha := sCodigoLinha + 'RRA:';
       while not CdsRRA.Eof do
       begin
        sLinha := sLinha + CdsRRA.FieldByName('MESCOBRANCA').AsString +' - R$'+ FormatFloat('#,##0.00;(#,##0.00)', CdsRRA.fieldByname('VALOR').AsFloat);
        CdsRRA.next;
        if not CdsRRA.Eof then
          sLinha := sLinha + ';';
       end;
       CtrlInformeRendimentos.Completa(' ', 152);

       If bUsaTextFile Then
          WriteLn(ArquivoTexto, sLinha)
       Else
          reArquivo.Lines.Add(sLinha);

    end;
  end;
  //Término - William Santana - SIG 37283

  //Cássio Rovaroto - SIG nº 73545 - Início
  if (StrtoInt(edtdata.text) >= 2018) And (rgSistema.ItemIndex = 1) then
  begin
    cdsResidExterior.Data := CtrlInformeRendimentos.BuscaLancResidExterior(CdsDados.FieldByName('CPF').AsString, StrToInt(edtData.Text));
    if not cdsResidExterior.IsEmpty then
    begin
      //Cabeçalho
      sLinha := sCodigoLinha + ' Rendimentos Recebidos por Não Residente: ';
      sLinha := sLinha + CtrlInformeRendimentos.Completa(' ', 265 - Length(sLinha));

      if bUsaTextFile Then
        WriteLn(ArquivoTexto, sLinha)
      else
        reArquivo.Lines.Add(sLinha);
      Inc(iTotalLinhas);

      //0473
      sDescricao :=  ' ' + cdsResidExterior.FieldByName('NATUREZA_0473').AsString +  ' (INSS): R$ ';
      sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsResidExterior.fieldByname('VLR_0473').AsFloat));

      if Length(sDescricao) < 100 Then
        sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

      sLinha := sCodigoLinha + sDescricao +
                CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
                CtrlInformeRendimentos.Completa(' ', 152);

      if bUsaTextFile Then
        WriteLn(ArquivoTexto, sLinha)
      else
        reArquivo.Lines.Add(sLinha);
      Inc(iTotalLinhas);

      //9466
      sDescricao :=  ' ' + cdsResidExterior.FieldByName('NATUREZA_9466').AsString +  ' (FUNCEF): R$ ';
      sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsResidExterior.fieldByname('VLR_9466').AsFloat));

      if Length(sDescricao) < 100 Then
        sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

      sLinha := sCodigoLinha + sDescricao +
                CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
                CtrlInformeRendimentos.Completa(' ', 152);

      if bUsaTextFile Then
        WriteLn(ArquivoTexto, sLinha)
      else
        reArquivo.Lines.Add(sLinha);
      Inc(iTotalLinhas);

      //Total de IR
      sDescricao := ' Total de Imposto de Renda: R$ ';
      sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsResidExterior.fieldByname('VLRTOTAL').AsFloat));

      if Length(sDescricao) < 100 Then
        sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 100 - Length(sDescricao));

      sLinha := sCodigoLinha + sDescricao +
                CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12) +
                CtrlInformeRendimentos.Completa(' ', 152);

      if bUsaTextFile Then
        WriteLn(ArquivoTexto, sLinha)
      else
        reArquivo.Lines.Add(sLinha);
      Inc(iTotalLinhas);
    end;
  end;
  //Cássio Rovaroto - SIG nº 73545 - Fim
End;

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroTipoNove: String;
Var
  sLinha: String;

Begin
  If rgSistema.ItemIndex = 3 Then
    Begin
      sLinha := '9' +
        CtrlInformeRendimentos.CompletaZero(IntToStr(iTotalLinhas), 12) +
        CtrlInformeRendimentos.CompletaZero(IntToStr(iTotalBenef), 12) +
        CtrlInformeRendimentos.Completa(' ', 240);
    End
  Else
    Begin
      If Not chkPensaoAlimenticia.Checked Then
        Begin
          sLinha := '9' +
            CtrlInformeRendimentos.CompletaZero(IntToStr(iTotalLinhas), 12) +
            CtrlInformeRendimentos.CompletaZero(IntToStr(iTotalBenef), 12) +
            CtrlInformeRendimentos.Completa(' ', 240);
        End
      Else
        Begin
          sLinha := '9' +
            CtrlInformeRendimentos.CompletaZero(IntToStr(iTotalLinhas), 12) +
            CtrlInformeRendimentos.CompletaZero(IntToStr(iTotalBenef), 12) +
            CtrlInformeRendimentos.Completa(' ', 181);
        End;
    End;
  Result := sLinha;
End;

Procedure TFrmConfigRelatInformeMT.FormShow(Sender: TObject);
Var
  wAno,
    wMes,
    wDia: word;

Begin
  Inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  edtData.Text := IntToStr(wAno - 1);
  chkUsaListaClick(Self);

  chkSegundaVia.Visible := CtrlInformeRendimentos.BuscaCodEmProp = 1;
  frameBenef.DefineLista(0);
End;

Procedure TFrmConfigRelatInformeMT.GeraInformeFuncef;
Var
  rIdPessoa: real;
  Pensionista: Array[0..4] Of rPensionista;
  ContFunc, i, iModulo, iContador: Integer;
  sCodNatureza, CPF, NomeBene: String;
  bArquivoDirf: Boolean;

Begin
  bArquivoDirf := False;

  If MsgDlg('Arquivo será importado no programa da DIRF?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    bArquivoDirf := True;

  iTotalLinhas := 0;
  iTotalBenef := 0;
  iContador := 0;
  Repaint;
  Application.ProcessMessages;

  cdsEmpresaProp.data := ctrlInformeRendimentos.BuscaEmpresaProp(Sistema.IdEmpresa);
  cdsInforme1.data := CtrlInformeRendimentos.BuscaInforme1;

  MontaSqlDados;
  prgBarAtuFluxo.Visible := True;
  prgBarAtuFluxo.Max := cdsDados.RecordCount;
  lblQuantidade.visible := true;
  edtQuantidade.visible := true;
  edtquantidade.text := Inttostr(cdsDados.RecordCount);
  prgBarAtuFluxo.Position := 0;
  cdsdados.First;
  iContador := 0;
  frmProgresso.MostraFormProgresso('Processando', True, False, True, 0, cdsDados.RecordCount);

  If Not cdsdados.IsEmpty Then
    Begin
      prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
      prgBarAtuFluxo.Update;
      ContFunc := 0;

      i := 0; // Edilaine - SOL 197664 / KTN 1894007

      cdsdados.first;
      While Not cdsdados.eof Do
        Begin

          Inc(iContador);
          frmProgresso.AndaFormProgresso(iContador);
          Application.ProcessMessages;
          Repaint;

          If (cdsdados.FieldByName('CPF').IsNull) Or
            (cdsdados.FieldByName('CPF').AsString = '00000000000') Then
            Begin
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
              prgBarAtuFluxo.Update;
              cdsdados.Next;
              Continue;
            End;

          //inc(iTotalBenef);  //William Santana - SOL 269789 PPM 1312365

          cdsIDPessjur.Data := CtrlInformeRendimentos.BuscaIDPessJur(-1, cdsdados.FieldByName('CPF').AsString); // cdsdados.FieldByName('IDPESSOA').AsInteger};

          If (cdsDados.FieldByName('IDENDERECO').AsString = '') Then
            Begin
              // Ricardo A. SOL: 108581 KTN: 492183
              // cdsMatric.Data := CtrlInformeRendimentos.BuscaMatricula( cdsDados.FieldByName('IDPESSOA').AsFloat,
              //                     cdsDados.FieldByName('IDPESSJUR').AsFloat );     //CPrev - 27341
              //                     cdsIDPessjur.FieldByName('IDPESSJUR').AsFloat ); //CPrev - 27341
              // write(ArqCriticaEndereco, 'Matrícula: '+cdsMatric.FieldByName('MATRICULA').AsString+

              // Paulo Nobre SOL 268555 PPM 1262100
              write(ArqCriticaEndereco, 'Matrícula: ' + '' + //cdsDados.FieldByName('MATRICULA').AsString + // Teste Bruno Bastos - 11/02/2009
                '   Nome: ' + cdsDados.FieldByName('NOMEBENEF').AsString +
                '    CPF: ' + cdsDados.FieldByName('CPF').AsString +
                '   Motivo: Não existe registro ');
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
              prgBarAtuFluxo.Update;
              cdsDados.Next;
              Continue;
            End;

          If (cdsDados.FieldByName('ENDEREO').AsString = '') And (cdsDados.FieldByName('IDENDERECO').AsString <> '') Then
            Begin
              // Ricardo A. SOL: 108581 KTN: 492183
             // cdsMatric.Data := CtrlInformeRendimentos.BuscaMatricula( cdsDados.FieldByName('IDPESSOA').AsFloat,
             //                     cdsDados.FieldByName('IDPESSJUR').AsFloat );    //CPrev - 27341
             //                     cdsIDPessjur.FieldByName('IDPESSJUR').AsFloat ); //CPrev - 27341
             // write(ArqCriticaEndereco, 'Matrícula: '+cdsMatric.FieldByName('MATRICULA').AsString+

              // Paulo Nobre SOL 268555 PPM 1262100
              write(ArqCriticaEndereco, 'Matrícula: ' + '' + //cdsDados.FieldByName('MATRICULA').AsString + // Teste Bruno Bastos - 11/02/2009
                '   Nome: ' + cdsDados.FieldByName('NOMEBENEF').AsString +
                '    CPF: ' + cdsDados.FieldByName('CPF').AsString +
                '   Motivo: Logradouro não preenchido ');
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
              prgBarAtuFluxo.Update;
              cdsDados.Next;
              Continue;
            End;

          If (cdsDados.FieldByName('CEP').AsString = '') And (cdsDados.FieldByName('IDENDERECO').AsString <> '') Then
            Begin
              // Ricardo A. SOL: 108581 KTN: 492183
              // cdsMatric.Data := CtrlInformeRendimentos.BuscaMatricula( cdsDados.FieldByName('IDPESSOA').AsFloat,
              //                     cdsDados.FieldByName('IDPESSJUR').AsFloat );    //CPrev - 27341
              //                     cdsIDPessjur.FieldByName('IDPESSJUR').AsFloat ); //CPrev - 27341
              // write(ArqCriticaEndereco, 'Matrícula: '+cdsMatric.FieldByName('MATRICULA').AsString+

              // Paulo Nobre SOL 268555 PPM 1262100
              write(ArqCriticaEndereco, 'Matrícula: ' + '' + //cdsDados.FieldByName('MATRICULA').AsString + // Teste Bruno Bastos - 11/02/2009
                '   Nome: ' + cdsDados.FieldByName('NOMEBENEF').AsString +
                '    CPF: ' + cdsDados.FieldByName('CPF').AsString +
                '   Motivo: CEP não preenchido ');
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
              prgBarAtuFluxo.Update;
              cdsDados.Next;
              Continue;
            End;

          inc(iTotalBenef);  //William Santana - SOL 269789 PPM 1312365

          rIdPessoa := -1; // cdsdados.FieldByName('IDPESSOA').AsFloat;
          sCodNatureza := cdsdados.FieldByName('CODNATUREZA').AsString;

          If (rgSistema.ItemIndex = 1) Or (rgSistema.ItemIndex = 3)
            Or (rgSistema.ItemIndex = 5) Then //Bruno Bastos - Sol: 130390 - Kintana: 731570

            // Paulo Nobre SOL 268555 PPM 1262100
            cdsMatLocFunc.Data := CtrlInformeRendimentos.BuscaMatricula(-1,
              //            cdsDados.FieldByName('IDPESSOA').AsFloat,
                            //cdsDados.FieldByName('IDPESSJUR').AsFloat );     //CPrev - 27341
              cdsIDPessjur.FieldByName('IDPESSJUR').AsFloat,
              cdsdados.FieldByName('CPF').AsString) //CPrev - 27341
          Else
            //if (not rgSistema.ItemIndex in [1, 3])  then
            If Not (rgSistema.ItemIndex In [1, 3]) Then //William Moreira da Silva - Sol 223696 - Kintana 2057501
              // Paulo Nobre SOL 268555 PPM 1262100
              cdsMatLocFunc.Data := CtrlInformeRendimentos.BuscaMatLocFunc(-1, cdsdados.fieldByname('CPF').Asstring); //rIdPessoa);

          If cdsdados.FieldByName('PENSIONISTA').AsString = 'TRUE' Then
            // Paulo Nobre SOL 268555 PPM 1262100
            cdsPensionista.Data := ctrlInformeRendimentos.BuscaCampo6sqlPensionistas(
              -1,
              //cdsdados.FieldByName('IDPESSOA').AsInteger,
              strToInt(edtData.Text),
              rgSistema.ItemIndex,
              cdsdados.FieldByName('CPF').AsString);

          If cdsdados.FieldByName('PROCESSO').AsString = 'TRUE' Then
            Begin
              //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Inicio
              pIsPensionistasAntigos := (CmbModelo.LookupValue = '33');
              CtrlInformeRendimentos.pTipoAposentadoPensionistas := pIsPensionistasAntigos;

              // Paulo Nobre SOL 268555 PPM 1262100
              cdsJud.Data := ctrlInformeRendimentos.BuscaDepJudicial(
                cdsDados.fieldByname('CPF').AsString,
                -1,
                //                cdsdados.FieldByName('IDPESSOA').AsInteger,
                StrToInt(edtData.Text),
                pIsPensionistasAntigos);
              //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Fim
            End;

          // Paulo Nobre SOL 268555 PPM 1262100
          cdsPensionista13.data := ctrlInformeRendimentos.BuscaCampo6sqlPensionistas13(
            -1,
            //cdsdados.FieldByName('IDPESSOA').AsInteger,
            strToInt(edtdata.text),
            edtRubrica.text,
            rgSistema.ItemIndex,
            cdsdados.FieldByName('CPF').AsString);

          CPF := cdsdados.fieldByname('CPF').Asstring;
          NomeBene := cdsdados.fieldByname('NOMEBENEF').Asstring;

          Case rgSistema.ItemIndex Of
            0: iModulo := 21;
            1: iModulo := 18;
            3: iModulo := 10;
          End;

          If Not bArquivoDirf Then
            Begin
              inc(iTotalLinhas);
              reArquivo.Lines.add(MontaLinhaRegistroTipoZERO); // Edilaine - SOL 180189 / KTN 1761859
              //WriteLn(ArquivoTexto, MontaLinhaRegistroTipoZERO);  // Edilaine - SOL 180189 / KTN 1761859

              inc(iTotalLinhas);
              reArquivo.Lines.Add(MontaLinhaRegistroTipoUm); // Edilaine - SOL 180189 / KTN 1761859
              //WriteLn(ArquivoTexto, MontaLinhaRegistroTipoUm);    // Edilaine - SOL 180189 / KTN 1761859

              inc(iTotalLinhas);
              reArquivo.Lines.Add(MontaLinhaRegistroTipoDois); // Edilaine - SOL 180189 / KTN 1761859
              //WriteLn(ArquivoTexto, MontaLinhaRegistroTipoDois);  // Edilaine - SOL 180189 / KTN 1761859

              If Not chkPensaoAlimenticia.Checked Then
                Begin
                  inc(iTotalLinhas);
                  reArquivo.Lines.Add(MontaLinhaRegistroTipoTres); // Edilaine - SOL 180189 / KTN 1761859
                  //WriteLn(ArquivoTexto, MontaLinhaRegistroTipoTres);  // Edilaine - SOL 180189 / KTN 1761859
                End
              Else
                reArquivo.Lines.Add(MontaLinhaRegistroTipoTres); // Edilaine - SOL 200285 / KTN 1932879

              inc(iTotalLinhas);
              reArquivo.Lines.Add(MontaLinhaRegistroTipoQuatro); // Edilaine - SOL 180189 / KTN 1761859
              //WriteLn(ArquivoTexto, MontaLinhaRegistroTipoQuatro);   // Edilaine - SOL 180189 / KTN 1761859

              If Not chkPensaoAlimenticia.Checked Then
                Begin
                  //Bruno Bastos - SOL 109019 - if rgSistema.ItemIndex <> 3 then
                  If (rgSistema.ItemIndex <> 3) And (rgSistema.ItemIndex <> 5) Then //Bruno Bastos - SOL 109019
                    Begin
                      inc(iTotalLinhas);
                      reArquivo.Lines.Add(MontaLinhaRegistroTipoCinco); // Edilaine - SOL 180189 / KTN 1761859
                      //WriteLn(ArquivoTexto, MontaLinhaRegistroTipoCinco);  // Edilaine - SOL 180189 / KTN 1761859

                      //Vinicius Maciel SOL 174070 - KTN 1570242
                      // Alterado por Arnaldo V. Scarin em 08/02/2012
                      // essa rotina foi adicionada para contemplar os valores do RRA que devem
                      // ser impressos no formulario novo da Receita Federal para o Informe de Rendimentos
                      If rgSistema.ItemIndex = 1 Then
                        inc(iTotalLinhas);
                      reArquivo.Lines.Add(MontaLinhaRegistroRRA); // Edilaine - SOL 180189 / KTN 1761859
                      //WriteLn(ArquivoTexto, MontaLinhaRegistroRRA);        // Edilaine - SOL 180189 / KTN 1761859
                      //Vinicius Maciel SOL 174070 - KTN 1570242 - FIM

                      If rgSistema.ItemIndex = 1 Then
                        MontaLinhaRegistroTipoSeis;
                    End
                      // Otacilio SOL 203766 KTN 1968942 ** Inicio **
                  Else If (rgSistema.ItemIndex = 5) Then
                    Begin
                      inc(iTotalLinhas);
                      reArquivo.Lines.Add(MontaLinhaRegistroTipoCincoTribRegressiva); // ota
                    End;
                  // Otacilio SOL 203766 KTN 1968942 ** Fim **

                  //William Santana SOL 219338.15472 KIN 2054550

                  // Felipe A. Santos SOL 246306/16909 PPM 645896  - início comentário - RE02
                  {
                  cdsInformeSaldo.data := ctrlInformeRendimentos.VerificaSaldoAnoBase(cdsdados.FieldByName('IDPESSOA').AsFloat, strtoint(edtData.text));
                  If Not (cdsInformeSaldo.isempty) Then
                    Begin }
                  // Felipe A. Santos SOL 246306/16909 PPM 645896  - fim comentário - RE02

                  // Paulo Nobre SOL 268555 PPM 1262100
                  cdsInformeSaldo.data := ctrlInformeRendimentos.BuscaInformesSaldo(
                    -1,
                    //                  cdsdados.FieldByName('IDPESSOA').AsFloat,
                    strtoint(edtData.text),
                    cdsdados.fieldByname('CPF').Asstring); // William Santana SOL 226121.15758 KIN 2060120 - adicionado , strtoint(edtData.text)

                  If Not (cdsInformeSaldo.isempty)
                    And (rgSistema.ItemIndex <> 5)
                    And (rgSistema.ItemIndex <> 0) // Andre Imakawa - SIG 41085
                    And (rgSistema.ItemIndex <> 3) Then //Marcio Sanches Spinosa SOL 217765 KINTANA 2059157
                    Begin
                      reArquivo.Lines.Add('7 O total informado na linha 04 do quadro 04 já inclui o valor abatido de imposto de ' +
                        'renda relativo às contribuições efetuadas a título de previdência complementar no ' +
                        'período compreendido entre 1º de janeiro de 1989 a 31 de dezembro de 1995, ' +
                        'correspondente a R$');
                      reArquivo.Lines.Add(MontaLinhaRegistroTipoSete);
                    End;
                  // End;  // Felipe A. Santos SOL 246306/16909 PPM 645896  -  comentado - RE02
                //END - William Santana SOL 219338.15472 KIN 2054550

                End;
            End
          Else
            Begin

              GeraArquivoDirf;

            End;

          // Edilaine - SOL 197664 / KTN 1894007
          If (Not bArquivoDirf) And ((iTotalBenef Mod 2000) = 0) Then
            Begin
              inc(i);
              reArquivo.Lines.SaveToFile('c:\planus\temp\InformeTXT_' + ColocaZeros(intToStr(i), 3));
              reArquivo.Lines.clear;
            End;
          // Edilaine - SOL 197664 / KTN 1894007 - fim

          prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
          prgBarAtuFluxo.Update;
          cdsPensionista.Close;
          cdsJud.Close;
          cdsPensionista13.Close;
          cdsDados.Next;
        End; //while

      If Not bArquivoDirf Then
        Begin
          inc(iTotalLinhas);
          reArquivo.Lines.Add(MontaLinhaRegistroTipoNove); // Edilaine - SOL 180189 / KTN 1761859
          //WriteLn(ArquivoTexto, MontaLinhaRegistroTipoNove);   // Edilaine - SOL 180189 / KTN 1761859

          // Edilaine - SOL 197664 / KTN 1894007
          inc(i);
          reArquivo.Lines.SaveToFile('c:\planus\temp\InformeTXT_' + ColocaZeros(intToStr(i), 3));
          reArquivo.Lines.clear;
          // Edilaine - SOL 197664 / KTN 1894007 - fim

        End;
    End
  Else
    Begin
      MsgDlg('Não há dados a serem gerados.', 'Aviso', mtWarning, [mbOK], 0);
      frmProgresso.EscondeFormProgresso;
      exit;
    End;
  frmProgresso.EscondeFormProgresso;
  Repaint;
  Application.ProcessMessages;
  MsgDlg('Arquivo Gerado com Sucesso', 'Aviso', mtWarning, [mbOK], 0);

  edtquantidade.text := Inttostr(iTotalBenef); //William Santana - SOL 269789 PPM 1312365
End;

Procedure TFrmConfigRelatInformeMT.mnuImportaMatriculaClick(Sender: TObject);
Var
  Arquivo: TextFile;
  sLinha: String;
  iTotalLinhas: Integer;

Begin
  Inherited;
  If OpenDialog.Execute Then
    Begin
      AssignFile(Arquivo, OpenDialog.FileName);
      Reset(Arquivo);

      iTotalLinhas := 0;
      While Not eof(Arquivo) Do
        Begin
          ReadLn(Arquivo, sLinha);
          Inc(iTotalLinhas);
        End;

      CloseFile(Arquivo);
      If iTotalLinhas > 1000 Then
        Begin
          MsgDlg('Arquivo contém mais de 1000 registros.', 'Aviso', mtWarning, [mbOK], 0);
          exit;
        End;

      AssignFile(Arquivo, OpenDialog.FileName);
      Reset(Arquivo);
      While Not eof(Arquivo) Do
        Begin
          ReadLn(Arquivo, sLinha);
        End;

      CloseFile(Arquivo);
    End;
End;

Procedure TFrmConfigRelatInformeMT.GeraArquivoDirf;
Var
  sCPF, sPrevOficial, sPrevPrivada, sPensao,
    sAposentado, sDiarias, sInvalidez, sLucro,
    sMicro, sIndenizacao, sDescOutroRend, sOutroRend,
    sInfCompl, sDescricao, sValor, sLinha: String;

Begin
  sInfCompl := '';
  sCPF := Trim(cdsdados.fieldByname('CPF').AsString);
  sPrevOficial := '000000000000000';
  sPrevPrivada := CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3021').AsFloat)), '.', '', [rfReplaceAll]), 15);
  sPensao := CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR3031').AsFloat +
    cdsDados.FieldByName('VLR3032').AsFloat)), '.', '', [rfReplaceAll]), 15);

  sAposentado := CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4011').AsFloat + cdsDados.FieldByName('VLR4012').AsFloat)), '.', '', [rfReplaceAll]), 15);
  sDiarias := '000000000000000';
  sInvalidez := CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR4021').AsFloat + cdsDados.FieldByName('VLR4022').AsFloat)), '.', '', [rfReplaceAll]), 15);
  sLucro := '000000000000000';
  sMicro := '000000000000000';
  sIndenizacao := '000000000000000';
  sDescOutroRend := CtrlInformeRendimentos.Completa(' ', 60);
  sOutroRend := '000000000000000';

  cdsPensionista.First;
  While Not cdsPensionista.eof Do
    Begin
      sDescricao := Trim(cdsPensionista.fieldByname('NOME').AsString) + ' CPF: ' + Trim(cdsPensionista.fieldByname('NUMDOCUMENTO').AsString) + ' Rend';

      //SIG85183.92415 - início
      if(CtrlInformeRendimentos.pLayout2019) or (CtrlInformeRendimentos.pLayout2021) then // Andre Imakawa - SIG 122151
        sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsPensionista.fieldByname('VALOR').AsFloat + ctrlInformeRendimentos.BuscaTotalPA(cdsPensionista.FieldByName('IDFAVORECIDO').AsString, edtdata.text, '161')))
      else
        sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsPensionista.fieldByname('VALOR').AsFloat));
     //SIG85183.92415 - fim

      sInfCompl := sInfCompl + sDescricao + ' ' + sValor;

      cdsPensionista13.first;
      If Not cdsPensionista13.fieldByname('IDFAVORECIDO').isnull Then
        Begin
          sDescricao := Trim(cdsPensionista.fieldByname('NOME').AsString) + ' CPF: ' + Trim(cdsPensionista.fieldByname('NUMDOCUMENTO').AsString) + ' 13o.';

          If cdsPensionista13.Locate('IDFAVORECIDO', VarArrayOf([cdsPensionista.fieldByname('IDFAVORECIDO').Asstring]), [loPartialKey]) Then
            begin
              //SIG85183.92415 - início
              if(CtrlInformeRendimentos.pLayout2019) or (CtrlInformeRendimentos.pLayout2021) then // Andre Imakawa - SIG 122151
                sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsPensionista13.fieldByname('VALOR').AsFloat + ctrlInformeRendimentos.BuscaTotalPA(cdsPensionista.FieldByName('IDFAVORECIDO').AsString, edtdata.text, '162')))
              else
                sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsPensionista13.fieldByname('VALOR').AsFloat));
              //SIG85183.92415 - início
            end
          Else
            sValor := FormatFloat('#,##0.00;(#,##0.00)', 0);

          sInfCompl := sInfCompl + sDescricao + ' ' + sValor;
        End;
      cdsPensionista.Next;
    End;

  cdsJud.First;
  If Not cdsJud.EOF Then
    Begin
      While Not cdsJud.EOF Do
        Begin
          sDescricao := ' Proc.Jud. ' + cdsJud.fieldByname('NUMEROPROCESSO').AsString + ' Rend.: ';

          sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsJud.fieldByname('VALORRENDJUD').AsFloat));

          sInfCompl := sInfCompl + sDescricao + ' ' + sValor;
          sDescricao := ' Proc.Jud. ' + cdsJud.fieldByname('NUMEROPROCESSO').AsString + ' IRRF.: ';

          sValor := FormatFloat('#,##0.00;(#,##0.00)', abs(cdsJud.fieldByname('VALORIRJUD').AsFloat));

          sInfCompl := sInfCompl + sDescricao + ' ' + sValor;
          sDescricao := ' Proc.Jud. ' + cdsJud.fieldByname('NUMEROPROCESSO').AsString + ' Rend. 13o.: ';

          sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsJud.fieldByname('VALORRENDJUD13').AsFloat));

          sInfCompl := sInfCompl + sDescricao + ' ' + sValor;
          sDescricao := ' Proc.Jud. ' + cdsJud.fieldByname('NUMEROPROCESSO').AsString + ' IRRF. 13o.: ';

          sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsJud.fieldByname('VALORIRJUD13').AsFloat));

          sInfCompl := sInfCompl + sDescricao + ' ' + sValor;
          cdsJud.Next;
        End;
    End
  Else
    Begin
      If Not cdsRendJud.EOF Then
        Begin
          While Not cdsRendJud.EOF Do
            Begin
              sDescricao := ' Proc.Jud. ' + cdsJud.fieldByname('NUMEROPROCESSO').AsString + ' Rend.: ';
              sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsRendJud.fieldByname('VALOR').AsFloat));
              sInfCompl := sInfCompl + sDescricao + ' ' + sValor;
              sDescricao := ' Proc.Jud. ' + cdsJud.fieldByname('NUMEROPROCESSO').AsString + ' IRRF.: ';
              sValor := '0';
              sInfCompl := sInfCompl + sDescricao + ' ' + sValor;
              sDescricao := ' Proc.Jud. ' + cdsJud.fieldByname('NUMEROPROCESSO').AsString + ' Rend. 13o.: ';
              sValor := FormatFloat('#,##0.00;(#,##0.00)', Abs(cdsJudRend13.fieldByname('VALOR').AsFloat));
              sInfCompl := sInfCompl + sDescricao + ' ' + sValor;
              sDescricao := ' Proc.Jud. ' + cdsJud.fieldByname('NUMEROPROCESSO').AsString + ' IRRF. 13o.: ';
              sValor := '0';
              sInfCompl := sInfCompl + sDescricao + ' ' + sValor;
              cdsRendJud.Next;
            End;
        End;
    End;

  If Length(sInfCompl) <= 200 Then
    sInfCompl := sInfCompl + CtrlInformeRendimentos.Completa(' ', 200 - Length(sInfCompl))
  Else
    Copy(sInfCompl, 1, 200);

  sLinha := sCPF +
    sPrevOficial +
    sPrevPrivada +
    sPensao +
    sAposentado +
    sDiarias +
    sInvalidez +
    sLucro +
    sMicro +
    sIndenizacao +
    sDescOutroRend +
    sOutroRend +
    sInfCompl;

  WriteLn(ArquivoTexto, sLinha);
End;

Procedure TFrmConfigRelatInformeMT.chkUsaListaClick(Sender: TObject);
Begin
  Inherited;
  If chkUsaLista.Checked Then
    Begin
      pnlFrameLista.Visible := True;
      pnlFrameLista.Align := alTop;
    End
  Else
    Begin
      pnlFrameLista.Visible := False;
      pnlFrameLista.Align := alNone;
    End;
End;

Procedure TFrmConfigRelatInformeMT.BtnImprimeClick(Sender: TObject);
Var sCPF: String;
  J, F: Integer;
Begin
  TipoGeracao := tgImprimeInforme;       // edilaine - SIG 19602

  sCPF := Trim(edtExcluiCPF.Text);
  If Trim(sCPF) <> '' Then
    Begin
      F := 0;
      For J := 0 To Length(sCPF) Do
        Begin
          If sCPF[J] = Char(39) Then
            Inc(F);
        End;

      If F < 2 Then
        Begin
          MessageBox(Handle, 'O CPF do campo exclusão deve estar entre aspas simples.', 'Atenção', MB_OK + MB_ICONWARNING);
          Exit;
        End;
    End;

  //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Inicio
  pIsPensionistasAntigos := (CmbModelo.LookupValue = '33');
  CtrlInformeRendimentos.pTipoAposentadoPensionistas := pIsPensionistasAntigos;
  //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Fim

  CtrlInformeRendimentos.pLayout2016 := (CmbModelo.LookupValue = '155'); //William Santana - SIG 37283
  CtrlInformeRendimentos.pLayout2018 := (CmbModelo.LookupValue = '156'); //Cássio Rovaroto - SIG nº 74355
  CtrlInformeRendimentos.pLayout2019 := (CmbModelo.LookupValue = '171'); //SIG 85183.92415
  CtrlInformeRendimentos.pLayout2019Pensao := (CmbModelo.LookupValue = '172'); //SIG 85183.92415

  CtrlInformeRendimentos.pLayoutResgate := (CmbModelo.LookupValue = '152'); //edilaine SIG129805

  // Andre Imakawa - SIG 122151 - Inicio
  CtrlInformeRendimentos.pLayout2021 := (CmbModelo.LookupValue = '173');

  if (CtrlInformeRendimentos.pLayout2021) and (StrToInt(edtData.text) < 2021) then
  begin
    MsgDlg('Para o modelo selecionado o ano deve ser superior à 2020.', 'Aviso', mtWarning, [mbOK], 0);
    exit;
  end;
  // Andre Imakawa - SIG 122151 - Fim

  //CPrev - 24/01/2008 - Início
  FrameBenef.qryLista.First;
  If FrameBenef.qryLista.Eof Then
    FrameBenef.ListaUsuario := 0;
  //CPrev - 24/01/2008 - Fim

  If Trim(edtNome.Text) = '' Then
    Begin
      MsgDlg('É obrigatório selecionar o nome do responsável.', 'Informação', mtInformation, [mbOk], 0);
      exit;
    End;

  If dtdtData.Text = '' Then
    Begin
      MsgDlg('É obrigatório selecionar a data.', 'Informação', mtInformation, [mbOk], 0);
      exit;
    End;

  iNumExec := 0; //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 23/01/2009
  Inherited;
End;

Procedure TFrmConfigRelatInformeMT.bbtnFigura1Click(Sender: TObject);
Begin
  Inherited;
  If (opdImagem.Execute) Then
    edFigura1.Text := opdImagem.FileName
  Else
    edFigura1.Text := '';
End;

Procedure TFrmConfigRelatInformeMT.bbtnFigura2Click(Sender: TObject);
Begin
  Inherited;
  If (opdImagem.Execute) Then
    edFigura2.Text := opdImagem.FileName
  Else
    edFigura2.Text := '';
End;

Procedure TFrmConfigRelatInformeMT.bbtnFigura3Click(Sender: TObject);
Begin
  Inherited;
  If (opdImagem.Execute) Then
    edFigura3.Text := opdImagem.FileName
  Else
    edFigura3.Text := '';
End;

Procedure TFrmConfigRelatInformeMT.btnCadFigurasClick(Sender: TObject);
Begin
  Inherited;
  townEscolheFiguras.Top := 200;
  townEscolheFiguras.BringToFront;
  townEscolheFiguras.Visible := True;
  Self.Enabled := False;
  LeAlteracoes;
End;

Procedure TFrmConfigRelatInformeMT.btnFecharSelFigurasClick(
  Sender: TObject);
Begin
  Inherited;
  Self.Enabled := True;
  townEscolheFiguras.Visible := False;
  GravaAlteracoes;
End;

Procedure TFrmConfigRelatInformeMT.MontaPaginas;
Var
  iPagina: integer;

Begin
  iPagina := 1;
  cdsAux.First;
  While Not cdsaux.eof Do
    Begin
      AtribuiCampos(iPagina);
      //Marcio Sanches Spinosa SOL 225870 Kintana 2059482 - Inicio
   //    if ( cdsaux.RecNo mod 2 ) = 0 then
   //    begin
      Inc(ipagina);
      //    end;
         //Marcio Sanches Spinosa SOL 225870 Kintana 2059482 - Fim
      cdsAux.Next;
    End;
End;

Procedure TFrmConfigRelatInformeMT.AtribuiCampos(Const piPagina: Integer);
Var
  sDadosComp, sAno: String;

Begin
  sDadosComp := '';

  If Trim(edtData.text) <> '0' Then
    sAno := edtData.text
  Else
    sAno := intTostr(ExtraiAno(date));

  If (cdsAux.fieldByName('CODNATUREZA').AsString = '0561') Or
    (cdsAux.fieldByName('CODNATUREZA').AsString = '3223') Or
    (cdsAux.fieldByName('CODNATUREZA').AsString = '5565') Or
    (cdsAux.fieldByName('CODNATUREZA').AsString = '0588') Or
    //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652 - Inicio
  (cdsAux.fieldByName('CODNATUREZA').AsString = '3556') Or
    (cdsAux.fieldByName('CODNATUREZA').AsString = '3579') Then
    //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652 - Fim

    Begin
      sDadosComp := CtrlInformeRendimentos.BuscaDadosCompl(-1, //cdsAux.fieldByName('IDPESSOA').AsInteger,
        StrToInt(sAno),
        rgSistema.ItemIndex,
        edtRubrica.text,
        chkPensaoAlimenticia.Checked,
        cdsAux.FieldByName('CPF').AsString); //Marcio Sanches Spinosa SOL 247443 PPM 669193
    End;

  If ((cdsAux.RecNo Mod 2) = 0) And
    (rgSistema.ItemIndex <> 0) Then //Marcio Sanches Spinosa SOL 225870 Kintana 2059482
    Begin
      cdsDados.Edit;
      cdsDados.FieldByName('NOMERESP').AsString := cdsAux.FieldByName('NOMERESP').AsString;
      cdsDados.FieldByName('NOMEALIMENTANTE_2').AsString := cdsAux.FieldByName('NOMEALIMENTANTE').AsString;
      cdsDados.FieldByName('CPFALIMENTANTE_2').AsString := cdsAux.FieldByName('CPFALIMENTANTE').AsString;
      cdsDados.FieldByName('TELALIMENTANTE_2').AsString := cdsAux.FieldByName('TELALIMENTANTE').AsString;
      cdsDados.FieldByName('LOGRADOUROALIM_2').AsString := cdsAux.FieldByName('LOGRADOUROALIM').AsString;
      cdsDados.FieldByName('NUMEROALIM_2').AsString := cdsAux.FieldByName('NUMEROALIM').AsString;
      cdsDados.FieldByName('COMPLEMENALIM_2').AsString := cdsAux.FieldByName('COMPLEMENALIM').AsString;
      cdsDados.FieldByName('BAIRROALIM_2').AsString := cdsAux.FieldByName('BAIRROALIM').AsString;
      cdsDados.FieldByName('CIDADEALIM_2').AsString := cdsAux.FieldByName('CIDADEALIM').AsString;
      cdsDados.FieldByName('CEPALIM_2').AsString := cdsAux.FieldByName('CEPALIM').AsString;
      cdsDados.FieldByName('ESTADOALIM_2').AsString := cdsAux.FieldByName('ESTADOALIM').AsString;
      cdsDados.FieldByName('DATAINF_2').AsString := cdsAux.FieldByName('DATAINF').AsString;
      cdsDados.FieldByName('ANO_2').AsString := cdsAux.FieldByName('ANO').AsString;
      cdsDados.FieldByName('DATA_2').AsString := cdsAux.FieldByName('DATA').AsString;
      cdsDados.FieldByName('ANOATUAL_2').AsString := cdsAux.FieldByName('ANOATUAL').AsString;
      cdsDados.FieldByName('DADOSCOMP_2').AsString := sDadosComp;
      cdsDados.FieldByName('IDPESSOA_2').AsString := cdsAux.FieldByName('IDPESSOA').AsString;
      cdsDados.FieldByName('TIPO_2').AsString := cdsAux.FieldByName('TIPO').AsString;
      cdsDados.FieldByName('NOMEBENEF_2').AsString := cdsAux.FieldByName('NOMEBENEF').AsString;
      cdsDados.FieldByName('MATRICULA_2').AsString := cdsAux.FieldByName('MATRICULA').AsString;
      cdsDados.FieldByName('CPF_2').AsString := cdsAux.FieldByName('CPF').AsString;
      cdsDados.FieldByName('CGC_2').AsString := cdsAux.FieldByName('CGC').AsString;
      cdsDados.FieldByName('FONTE_2').AsString := cdsAux.FieldByName('FONTE').AsString;
      cdsDados.FieldByName('CODNATUREZA_2').AsString := cdsAux.FieldByName('CODNATUREZA').AsString;
      cdsDados.FieldByName('IDENDERECO_2').AsString := cdsAux.FieldByName('IDENDERECO').AsString;
      cdsDados.FieldByName('DESCRICAO_2').AsString := cdsAux.FieldByName('DESCRICAO').AsString;
      cdsDados.FieldByName('RAZAOSOCIAL_2').AsString := cdsAux.FieldByName('RAZAOSOCIAL').AsString;
      cdsDados.FieldByName('ENDEREO_2').AsString := cdsAux.FieldByName('ENDEREO').AsString;
      cdsDados.FieldByName('NUMERO_2').AsString := cdsAux.FieldByName('NUMERO').AsString;
      cdsDados.FieldByName('COMPLEMENTO_2').AsString := cdsAux.FieldByName('COMPLEMENTO').AsString;
      cdsDados.FieldByName('BAIRRO_2').AsString := cdsAux.FieldByName('BAIRRO').AsString;
      cdsDados.FieldByName('NOME_2').AsString := cdsAux.FieldByName('NOME').AsString;
      cdsDados.FieldByName('CEP_2').AsString := cdsAux.FieldByName('CEP').AsString;
      cdsDados.FieldByName('UF_2').AsString := cdsAux.FieldByName('UF').AsString;
      cdsDados.FieldByName('NUMSEED_2').AsString := cdsAux.FieldByName('NUMSEED').AsString;
      //edilaine WO18939 : inicio
      if cdsAux.FindField('FLGPENSAOALIM')<> nil then
         cdsDados.FieldByName('FLGPENSAOALIM_2').AsString := cdsAux.FieldByName('FLGPENSAOALIM').AsString
      else
         cdsDados.FieldByName('FLGPENSAOALIM_2').AsString := cdsAux.FieldByName('FLGPENSAOALIM_2').AsString;
      //edilaine WO18939 : fim
      cdsDados.FieldByName('VLR301_2').AsFloat := cdsAux.FieldByName('VLR301').AsFloat;
      cdsDados.FieldByName('VLR302_2').AsFloat := cdsAux.FieldByName('VLR302').AsFloat;
      cdsDados.FieldByName('VLR303_2').AsFloat := cdsAux.FieldByName('VLR303').AsFloat;
      cdsDados.FieldByName('VLR304_2').AsFloat := cdsAux.FieldByName('VLR304').AsFloat;
      cdsDados.FieldByName('VLR305_2').AsFloat := cdsAux.FieldByName('VLR305').AsFloat;
      cdsDados.FieldByName('VLR401_2').AsFloat := cdsAux.FieldByName('VLR401').AsFloat;
      cdsDados.FieldByName('VLR402_2').AsFloat := cdsAux.FieldByName('VLR402').AsFloat;
      cdsDados.FieldByName('VLR403_2').AsFloat := cdsAux.FieldByName('VLR403').AsFloat;
      cdsDados.FieldByName('VLR404_2').AsFloat := cdsAux.FieldByName('VLR404').AsFloat;
      cdsDados.FieldByName('VLR405_2').AsFloat := cdsAux.FieldByName('VLR405').AsFloat;
      cdsDados.FieldByName('VLR406_2').AsFloat := cdsAux.FieldByName('VLR406').AsFloat;
      cdsDados.FieldByName('VLR407_2').AsFloat := cdsAux.FieldByName('VLR407').AsFloat;
      cdsDados.FieldByName('VLR408_2').AsFloat := cdsAux.FieldByName('VLR408').AsFloat;
      cdsDados.FieldByName('VLR501_2').AsFloat := cdsAux.FieldByName('VLR501').AsFloat;
      cdsDados.FieldByName('VLR502_2').AsFloat := cdsAux.FieldByName('VLR502').AsFloat;
      cdsDados.FieldByName('VLR503_2').AsFloat := cdsAux.FieldByName('VLR503').AsFloat; // Felipe A. Santos SOL 245841 PPM 629389
      cdsDados.FieldByName('VLR601_2').AsFloat := cdsAux.FieldByName('VLR601').AsFloat;
      cdsDados.FieldByName('VLR602_2').AsFloat := cdsAux.FieldByName('VLR602').AsFloat;
      cdsDados.FieldByName('VLR603_2').AsFloat := cdsAux.FieldByName('VLR603').AsFloat;
      cdsDados.FieldByName('VLR604_2').AsFloat := cdsAux.FieldByName('VLR604').AsFloat;
      cdsDados.FieldByName('VLR605_2').AsFloat := cdsAux.FieldByName('VLR605').AsFloat;
      cdsDados.FieldByName('VLR606_2').AsFloat := cdsAux.FieldByName('VLR606').AsFloat;
      cdsDados.FieldByName('VLR607_2').AsFloat := cdsAux.FieldByName('VLR607').AsFloat;
      cdsDados.FieldByName('VLR608_2').AsFloat := cdsAux.FieldByName('VLR608').AsFloat; //Bruno Bastos - 18/02/2011

      cdsDados.FieldByName('PROCESSO_2').AsString := cdsAux.FieldByName('PROCESSO').AsString;
      cdsDados.FieldByName('PENSIONISTA_2').AsString := cdsAux.FieldByName('PENSIONISTA').AsString;

      cdsDados.FieldByName('ENDERECO_FUND_2').AsString := cdsAux.FieldByName('ENDERECO_FUND').AsString;
      cdsDados.FieldByName('NUMERO_FUND_2').AsString := cdsAux.FieldByName('NUMERO_FUND').AsString;
      cdsDados.FieldByName('COMPLEMENTO_FUND_2').AsString := cdsAux.FieldByName('COMPLEMENTO_FUND').AsString;
      cdsDados.FieldByName('BAIRRO_FUND_2').AsString := cdsAux.FieldByName('BAIRRO_FUND').AsString;
      cdsDados.FieldByName('CIDADE_FUND_2').AsString := cdsAux.FieldByName('CIDADE_FUND').AsString;
      cdsDados.FieldByName('CEP_FUND_2').AsString := cdsAux.FieldByName('CEP_FUND').AsString;
      cdsDados.FieldByName('UF_FUND_2').AsString := cdsAux.FieldByName('UF_FUND').AsString;
      cdsDados.FieldByName('NUMSEED_FUND_2').AsString := cdsAux.FieldByName('NUMSEED_FUND').AsString;
      cdsDados.FieldByName('LOTACAO_2').AsString := cdsAux.FieldByName('LOTACAO').AsString;
      cdsDados.FieldByName('TELEFONE_FUND_2').AsString := cdsAux.FieldByName('TELEFONE_FUND').AsString;
    End
  Else
    Begin
      CdsDados.Append;
      cdsDados.FieldByName('NOMERESP').AsString := cdsAux.FieldByName('NOMERESP').AsString;
      cdsDados.FieldByName('NOMEALIMENTANTE').AsString := cdsAux.FieldByName('NOMEALIMENTANTE').AsString;
      cdsDados.FieldByName('CPFALIMENTANTE').AsString := cdsAux.FieldByName('CPFALIMENTANTE').AsString;
      cdsDados.FieldByName('TELALIMENTANTE').AsString := cdsAux.FieldByName('TELALIMENTANTE').AsString;
      cdsDados.FieldByName('LOGRADOUROALIM').AsString := cdsAux.FieldByName('LOGRADOUROALIM').AsString;
      cdsDados.FieldByName('NUMEROALIM').AsString := cdsAux.FieldByName('NUMEROALIM').AsString;
      cdsDados.FieldByName('COMPLEMENALIM').AsString := cdsAux.FieldByName('COMPLEMENALIM').AsString;
      cdsDados.FieldByName('BAIRROALIM').AsString := cdsAux.FieldByName('BAIRROALIM').AsString;
      cdsDados.FieldByName('CIDADEALIM').AsString := cdsAux.FieldByName('CIDADEALIM').AsString;
      cdsDados.FieldByName('CEPALIM').AsString := cdsAux.FieldByName('CEPALIM').AsString;
      cdsDados.FieldByName('ESTADOALIM').AsString := cdsAux.FieldByName('ESTADOALIM').AsString;
      cdsDados.FieldByName('DATAINF').AsString := cdsAux.FieldByName('DATAINF').AsString;
      cdsDados.FieldByName('ANO').AsString := cdsAux.FieldByName('ANO').AsString;
      cdsDados.FieldByName('DATA').AsString := cdsAux.FieldByName('DATA').AsString;
      cdsDados.FieldByName('ANOATUAL').AsString := cdsAux.FieldByName('ANOATUAL').AsString;
      cdsDados.FieldByName('DADOSCOMP').asString := sDadosComp;
      //      cdsDados.FieldByName('IDPESSOA').AsString := cdsAux.FieldByName('IDPESSOA').AsString;
      cdsDados.FieldByName('TIPO').AsString := cdsAux.FieldByName('TIPO').AsString;
      cdsDados.FieldByName('NOMEBENEF').AsString := cdsAux.FieldByName('NOMEBENEF').AsString;
      //      cdsDados.FieldByName('MATRICULA').AsString := cdsAux.FieldByName('MATRICULA').AsString;
      cdsDados.FieldByName('CPF').AsString := cdsAux.FieldByName('CPF').AsString;
      cdsDados.FieldByName('CGC').AsString := cdsAux.FieldByName('CGC').AsString;
      cdsDados.FieldByName('FONTE').AsString := cdsAux.FieldByName('FONTE').AsString;
      cdsDados.FieldByName('CODNATUREZA').AsString := cdsAux.FieldByName('CODNATUREZA').AsString;
      cdsDados.FieldByName('IDENDERECO').AsString := cdsAux.FieldByName('IDENDERECO').AsString;
      cdsDados.FieldByName('DESCRICAO').AsString := cdsAux.FieldByName('DESCRICAO').AsString;
      cdsDados.FieldByName('RAZAOSOCIAL').AsString := cdsAux.FieldByName('RAZAOSOCIAL').AsString;
      cdsDados.FieldByName('ENDEREO').AsString := cdsAux.FieldByName('ENDEREO').AsString;
      cdsDados.FieldByName('NUMERO').AsString := cdsAux.FieldByName('NUMERO').AsString;
      cdsDados.FieldByName('COMPLEMENTO').AsString := cdsAux.FieldByName('COMPLEMENTO').AsString;
      cdsDados.FieldByName('BAIRRO').AsString := cdsAux.FieldByName('BAIRRO').AsString;
      cdsDados.FieldByName('NOME').AsString := cdsAux.FieldByName('NOME').AsString;
      cdsDados.FieldByName('CEP').AsString := cdsAux.FieldByName('CEP').AsString;
      cdsDados.FieldByName('UF').AsString := cdsAux.FieldByName('UF').AsString;
      cdsDados.FieldByName('NUMSEED').AsString := cdsAux.FieldByName('NUMSEED').AsString;
      //edilaine WO18939 : inicio
      if cdsAux.FindField('FLGPENSAOALIM')<> nil then
         cdsDados.FieldByName('FLGPENSAOALIM').AsString := cdsAux.FieldByName('FLGPENSAOALIM').AsString
      else
         cdsDados.FieldByName('FLGPENSAOALIM').AsString := cdsAux.FieldByName('FLGPENSAOALIM_2').AsString;
      //edilaine WO18939 : fim
      cdsDados.FieldByName('VLR301').AsFloat := cdsAux.FieldByName('VLR301').AsFloat;
      cdsDados.FieldByName('VLR302').AsFloat := cdsAux.FieldByName('VLR302').AsFloat;
      cdsDados.FieldByName('VLR303').AsFloat := cdsAux.FieldByName('VLR303').AsFloat;
      cdsDados.FieldByName('VLR304').AsFloat := cdsAux.FieldByName('VLR304').AsFloat;
      cdsDados.FieldByName('VLR305').AsFloat := cdsAux.FieldByName('VLR305').AsFloat;
      cdsDados.FieldByName('VLR401').AsFloat := cdsAux.FieldByName('VLR401').AsFloat;
      cdsDados.FieldByName('VLR402').AsFloat := cdsAux.FieldByName('VLR402').AsFloat;
      cdsDados.FieldByName('VLR403').AsFloat := cdsAux.FieldByName('VLR403').AsFloat;
      cdsDados.FieldByName('VLR404').AsFloat := cdsAux.FieldByName('VLR404').AsFloat;
      cdsDados.FieldByName('VLR405').AsFloat := cdsAux.FieldByName('VLR405').AsFloat;
      cdsDados.FieldByName('VLR406').AsFloat := cdsAux.FieldByName('VLR406').AsFloat;
      cdsDados.FieldByName('VLR407').AsFloat := cdsAux.FieldByName('VLR407').AsFloat;
      If (rgSistema.ItemIndex = 1) Then // SOL 268134 PPM 1250381
        cdsDados.FieldByName('VLR408').AsFloat := cdsAux.FieldByName('VLR408').AsFloat; // Paulo Nobre  - SOL 257831/18009 PPM 1207646
      cdsDados.FieldByName('VLR501').AsFloat := cdsAux.FieldByName('VLR501').AsFloat;
      cdsDados.FieldByName('VLR502').AsFloat := cdsAux.FieldByName('VLR502').AsFloat;
      cdsDados.FieldByName('VLR503').AsFloat := cdsAux.FieldByName('VLR503').AsFloat; // Felipe A. Santos SOL 245841 PPM 629389
      cdsDados.FieldByName('VLR601').AsFloat := cdsAux.FieldByName('VLR601').AsFloat;
      cdsDados.FieldByName('VLR602').AsFloat := cdsAux.FieldByName('VLR602').AsFloat;
      cdsDados.FieldByName('VLR603').AsFloat := cdsAux.FieldByName('VLR603').AsFloat;
      cdsDados.FieldByName('VLR604').AsFloat := cdsAux.FieldByName('VLR604').AsFloat;
      cdsDados.FieldByName('VLR605').AsFloat := cdsAux.FieldByName('VLR605').AsFloat;
      cdsDados.FieldByName('VLR606').AsFloat := cdsAux.FieldByName('VLR606').AsFloat;
      cdsDados.FieldByName('VLR607').AsFloat := cdsAux.FieldByName('VLR607').AsFloat;
      cdsDados.FieldByName('VLR608').AsFloat := cdsAux.FieldByName('VLR608').AsFloat; //Bruno Bastos - 18/02/2011

      cdsDados.FieldByName('PROCESSO').AsString := cdsAux.FieldByName('PROCESSO').AsString;
      cdsDados.FieldByName('PENSIONISTA').AsString := cdsAux.FieldByName('PENSIONISTA').AsString;
      cdsDados.FieldByName('ENDERECO_FUND').AsString := cdsAux.FieldByName('ENDERECO_FUND').AsString;
      cdsDados.FieldByName('NUMERO_FUND').AsString := cdsAux.FieldByName('NUMERO_FUND').AsString;
      cdsDados.FieldByName('COMPLEMENTO_FUND').AsString := cdsAux.FieldByName('COMPLEMENTO_FUND').AsString;
      cdsDados.FieldByName('BAIRRO_FUND').AsString := cdsAux.FieldByName('BAIRRO_FUND').AsString;
      cdsDados.FieldByName('CIDADE_FUND').AsString := cdsAux.FieldByName('CIDADE_FUND').AsString;
      cdsDados.FieldByName('CEP_FUND').AsString := cdsAux.FieldByName('CEP_FUND').AsString;
      cdsDados.FieldByName('UF_FUND').AsString := cdsAux.FieldByName('UF_FUND').AsString;
      cdsDados.FieldByName('NUMSEED_FUND').AsString := cdsAux.FieldByName('NUMSEED_FUND').AsString;
      cdsDados.FieldByName('LOTACAO').AsString := cdsAux.FieldByName('LOTACAO').AsString;
      cdsDados.FieldByName('TELEFONE_FUND').AsString := cdsAux.FieldByName('TELEFONE_FUND').AsString;
    End;
  cdsDados.FieldByName('PAGINA').AsInteger := piPagina;
  CdsDados.Post;
End;

//Bruno Bastos - SOL: 103796 - Kintana: 463663 - 21/01/2009 - Início

Procedure TFrmConfigRelatInformeMT.RptModeloMemo2Print(Sender: TObject);
Var
  sDadosComp: String;
  sAno: String;

Begin
  Inherited;

  sDadosComp := '';

  If Trim(edtData.text) <> '0' Then
    sAno := edtData.text
  Else
    sAno := intTostr(ExtraiAno(date));

  If (cdsDados.fieldByName('CODNATUREZA_2').AsString = '0561') Or
    (cdsDados.fieldByName('CODNATUREZA_2').AsString = '3223') Or
    (cdsDados.fieldByName('CODNATUREZA_2').AsString = '5565') Or
    (cdsDados.fieldByName('CODNATUREZA_2').AsString = '0588') Or
    //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652 - inicio
  (cdsDados.fieldByName('CODNATUREZA_2').AsString = '3556') Or
    (cdsDados.fieldByName('CODNATUREZA_2').AsString = '3579') Then
    //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652 - Fim
    Begin
      sDadosComp := CtrlInformeRendimentos.BuscaDadosCompl(-1, //cdsDados.fieldByName('IDPESSOA').AsInteger,
        StrToInt(sAno),
        rgSistema.ItemIndex,
        edtRubrica.text,
        chkPensaoAlimenticia.Checked,
        CdsDados.FieldByName('CPF').AsString); //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
    End;

  RptModeloMemo2.Caption := '';
  RptModeloMemo2.Lines.Clear;
  RptModeloMemo2.Lines.Add(sDadosComp);
End;

Procedure TFrmConfigRelatInformeMT.LeAlteracoes;
Begin
  ArqConfig := TIniFile.Create('C:\INFORME_REND.INI');
  edFigura1.Text := ArqConfig.ReadString('INF_REND_FOLHA_PAGTO', 'Figura1', '');
  edFigura2.Text := ArqConfig.ReadString('INF_REND_FOLHA_PAGTO', 'Figura2', '');
  edFigura3.Text := ArqConfig.ReadString('INF_REND_FOLHA_PAGTO', 'Figura3', '');
End;

Procedure TFrmConfigRelatInformeMT.GravaAlteracoes;
Begin
  ArqConfig.WriteString('INF_REND_FOLHA_PAGTO', 'Figura1', edFigura1.Text);
  ArqConfig.WriteString('INF_REND_FOLHA_PAGTO', 'Figura2', edFigura2.Text);
  ArqConfig.WriteString('INF_REND_FOLHA_PAGTO', 'Figura3', edFigura3.Text);
End;
//Bruno Bastos - SOL: 103796 - Kintana: 463663 - 21/01/2009 - Fim

Procedure TFrmConfigRelatInformeMT.FrameBenefbbtnIncluiBenefClick(
  Sender: TObject);
Begin
  Inherited;
  FrameBenef.bbtnIncluiBenefClick(Sender);

End;

//Vinicius Maciel SOL SOL 174070 - KTN 1570242

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroRRA: String;
Var
  sLinha,
    sRendRRA, sPensaoRRA, sImpostoRetido, sRendIssento, sValorTotal, sNatuRend, sNumeroProcesso, sQtdMeses: String;
Begin
  sNumeroProcesso := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  sNatuRend := '1889 – RENDIMENTOS ACUMULADOS           ';
  sQtdMeses := cdsDados.FieldByName('QTDMESES').asString;
  sRendRRA := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR6012').asFloat)), '.', '', [rfReplaceAll]);
  sPensaoRRA := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR6022').asFloat)), '.', '', [rfReplaceAll]);
  sImpostoRetido := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR6032').asFloat)), '.', '', [rfReplaceAll]);
  sRendIssento := StringReplace(OraNumero(FormatFloat('######0.00', cdsDados.FieldByName('VLR6042').asFloat)), '.', '', [rfReplaceAll]);
  sLinha := '6' + sNumeroProcesso + sNatuRend + CtrlInformeRendimentos.CompletaZero(sQtdMeses, 4) +
    CtrlInformeRendimentos.CompletaZero(sRendRRA, 12) +
    CtrlInformeRendimentos.CompletaZero(sPensaoRRA, 12) +
    CtrlInformeRendimentos.CompletaZero(sImpostoRetido, 12) +
    CtrlInformeRendimentos.CompletaZero(sRendIssento, 12) +
    CtrlInformeRendimentos.Completa(' ', 72);
  Result := sLinha;
End;
//Vinicius Maciel SOL 174070 - KTN 1570242 - FIM

//William Santana SOL 219338.15472 KIN 2054550

Function TFrmConfigRelatInformeMT.MontaLinhaRegistroTipoSete(): String;
Var
  sDescricao, sValor: String;
Begin

  sValor := FormatFloat('#,##0.00;(#,##0.00)', cdsinformesaldo.FieldByName('VALOR').AsFloat);
  sDescricao := '7';
  sDescricao := sDescricao + CtrlInformeRendimentos.Completa(' ', 101 - Length(sDescricao));

  sDescricao := sDescricao + CtrlInformeRendimentos.CompletaZero(StringReplace(OraNumero(sValor), '.', '', [rfReplaceAll]), 12)
    + CtrlInformeRendimentos.Completa(' ', 152);

  result := sDescricao;

End;
//END - William Santana SOL 219338.15472 KIN 2054550

//SIG82520 -Inicio
function TFrmConfigRelatInformeMT.IIF(bValida: Boolean; sValorV,  sValorF: String): String;
begin
  if (bValida) then
     result:=  sValorV
  else
     result:=  sValorF;
end;
//SIG82520 -Fim

End.

