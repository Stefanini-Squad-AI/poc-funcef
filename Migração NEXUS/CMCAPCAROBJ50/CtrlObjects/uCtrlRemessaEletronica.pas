{-------------------------------------------------------------------------------
------------------------------- ALTERA«’ES -------------------------------------
--------------------------------------------------------------------------------
N. Chamado....: WO33342
Dt AlteraÁ„o..: 27/02/2026
Respons·vel...: Paulo Nobre
DescriÁ„o.....: PROJETO CNPJ ALFANUM…RICO
                .Refeito o SQL da funÁ„o _SelecionaMovArquivo para aprimoramento
                 de performance.
                .CriaÁ„o de 2 funÁıes: FN_LIMPACARACTERES e FN_FORMATACPFCNPJ
                 para substituir o uso do REGEX na formataÁ„o da coluna
                 NUMDOCUMENTO quando da inclus„o das m·scaras em diversas
                 funÁıes. Ex: GetMovimentoRemessaCap, _SelecionaMovArqDetalhe..
--------------------------------------------------------------------------------
Rotina........: _SqlSelecionaMovArqDetalheFB, _SelecionaMovArqDetalheFB
N. Chamado....: 38027
Dt AlteraÁıes.: 08/05/2026
Respons·vel...: Edilaine
DescriÁ„o.....: Alterar a impress„o para usar o componente ADO
                separado os metodos para gerar o SQL da execuÁ„o da SQL
--------------------------------------------------------------------------------
N. Chamado....: WO29249
Dt AlteraÁıes.: 24/12/2025
Respons·vel...: Paulo Nobre
DescriÁ„o.....: Inclus„o na funÁ„o: GetMovimentoRemessaCap do agrupamento dos
                lanÁamentos que ficou de fora da otimizaÁ„o realizada pelos
                DBAs.
--------------------------------------------------------------------------------
N. Chamado....: WO28854
Dt AlteraÁıes.: 12/12/2025
Respons·vel...: Edilaine
DescriÁ„o.....: est· considerando o valor bruto do documento e n„o o liquido
--------------------------------------------------------------------------------
N. Chamado....: WO28070
Dt AlteraÁıes.: 08/12/2025
Respons·vel...: Paulo Nobre
DescriÁ„o.....: Reescrito todo SQL da funÁ„o: GetMovimentoRemessaCap, que foi
                analisado e "tunado" pelo DBA Ronaldo.
--------------------------------------------------------------------------------
N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000007069)
Dt AlteraÁıes.: 13/11/2025
Respons·vel...: Paulo Nobre
DescriÁ„o.....: Ajuste na funÁ„o: _GetConvenioFolha para remover o ";" no final
                do SQL, pois o oracle n„o reconheceu isso no D5.
--------------------------------------------------------------------------------
Atender   : WO24848
Data      : 02/09/2025
Autor     : Paulo Nobre
DescriÁ„o : CorreÁ„o na funÁ„o _SelecionaMovArqDetalhe, para evitar que quando
            a operaÁ„o da conta corrente aparecer com apenas um ZERO, n„o deixar
            concatenar com a Conta Corrente. Apenas o Banco do Brasil tem essa
            operaÁ„o e sempre s„o 3 digitos. Ex.: 001 0012345-9.
--------------------------------------------------------------------------------
Atender   : WO18638
Data      : 17/02/2025
Autor     : Paulo Nobre
DescriÁ„o : CorreÁ„o do FatorVencimento, que a partir de 22/02/2025 dever· ser
            abatido em 1000 dias por conta do Codigo n„o exceder 9999.
--------------------------------------------------------------------------------
N. Chamado....: MIGRACAO-ORACLE
Dt AlteraÁ„o..: 09/10/2025
Respons·vel...: LEANDRO
DescriÁ„o.....: colocado CAST nas consultas para defdinir o tamanho do campo NSA
--------------------------------------------------------------------------------
Atender   : WO16145
Data      : 19/12/2024
Autor     : Arnaldo V. Scarin
DescriÁ„o : CorreÁ„o do FatorVencimento, que a partir de 22/02/2025 ser· reiniciado
            em 1000, por conta do Codigo exceder 9999
--------------------------------------------------------------------------------
 N. Chamado....: WO15743
 Dt AlteraÁıes.: 17/10/2024
 Respons·vel...: Paulo Nobre
 DescriÁ„o.....: .Quando selecionado a origem do pagamento = "Entidades", a tabela
                  de associaÁ„o tem que ser a PROCCONVENIODOC.
                   . _SelecionaMovArquivoFB
                   . _SelecionaMovArqDetalheFB;
                 .Refazendo a funÁ„o _ListaConveniosFolha para melhorar
                  performance.  
--------------------------------------------------------------------------------
 N. Chamado....: WO6194
 Dt AlteraÁıes.: 10/07/2024
 Respons·vel...: Paulo Nobre
 DescriÁ„o.....: .Ajuste em v·rias rotinas para melhorar a performance geral
                 .DefiniÁ„o de novas funÁıes de seleÁ„o exclusivas:
                   . _SelecionaMovArquivoFB
                   . _SelecionaMovArqDetalheFB;
--------------------------------------------------------------------------------
 N. Chamado....: WO13745
 Dt AlteraÁ„o..: 16/08/2024
 Respons·vel...: Edilaine
 DescriÁ„o.....: Remover atualizaÁ„o WO9474_9284 - WO11547
--------------------------------------------------------------------------------
 N. Chamado....: WO13109
 Dt AlteraÁıes.: 30/07/2024
 Respons·vel...: Paulo Nobre
 DescriÁ„o.....: FunÁ„o GetMovimentoRemessaCap, correÁ„o do alias dos textos
                 "AND AP.CODPORTFORMA" para "AND D.CODPORTFORMA"
                 "AND FO.CODFORMA" para "AND D.CODFORMA"
--------------------------------------------------------------------------------
// N. Chamado....: WO13032
// Dt AlteraÁ„o..: 30/07/2024
// Respons·vel...: Edilaine
// DescriÁ„o.....: Remover atualizaÁ„o WO9474_9284 - WO11547
--------------------------------------------------------------------------------
 N. Chamado....: WO9474_9284
 Dt AlteraÁ„o..: 15/04/2024  03/07/2024
 Respons·vel...: Paulo Nobre
 DescriÁ„o.....: Ajustes na funÁ„o GetMovimentoRemessaCap para:
                  .Incluir novo campo FLGPAGTOPIX da tabela FORMARECPAG;
                  .Ordenar a seleÁ„o por CODFORMA.
                 MudanÁa de assinatura e ajustes na _SelecionaMovArqDetalhe;
                 Inclus„o do novo campo FLGPAGTOPIX em diversos SQL¥s
                 Ajustes diversos para o tratamento do pagamento via PIX.
                 Ajuste em v·rias rotinas para melhorar performance geral:
                  . Inclus„o de novas clausulas nos WHERE
                  . DefiniÁ„o de Ìndices
--------------------------------------------------------------------------------
 N. Chamado....: WO6243
 Dt AlteraÁ„o..: 31/01/2024
 Respons·vel...: Everson Cunha
 DescriÁ„o.....: OrdenaÁ„o da query _SelecionaMovArqDetalhe
--------------------------------------------------------------------------------
 N. Chamado....: WO1822
 Dt AlteraÁ„o..: 18/09/2023
 Respons·vel...: Everson Cunha
 DescriÁ„o.....: Imprimir relatÛrio "RelaÁ„o de Pagamentos via Remessa
                 EletrÙnica - Modelo COFIN" apÛs a geraÁ„o do Arquivo
--------------------------------------------------------------------------------
 N. SIG........: 130589
 Dt AlteraÁ„o..: 29/11/2022
 Respons·vel...: Everson Cunha
 DescriÁ„o.....: Melhoria na verificaÁ„o de documento agrupado
--------------------------------------------------------------------------------
 N. SIG........: 125919
 Dt AlteraÁ„o..: 04/08/2022
 Respons·vel...: Everson Cunha
 DescriÁ„o.....: Melhoria na rotina _ExisteCodBarras para verificar apenas docu-
                 mentos em aberto, cm.documento.status <> 2
--------------------------------------------------------------------------------
 N. SIG........: 117206
 Dt AlteraÁ„o..: 23/12/2021
 Respons·vel...: Everson Cunha
 DescriÁ„o.....: DCTFWeb
--------------------------------------------------------------------------------
//Rotina...........: _GeraArquivoDeRemessa, _SelMovPeloTipoDaFormaPagamento_LO
//N. SIG...........: 121375
//Data da AlteraÁ„o: 07/12/2021
//Respons·vel......: C·ssio Florencio Rovaroto
//DescriÁ„o........: Retirada da montagem do segmento W, para pagamento de FGTS.
//******************************************************************************
//Rotina.............:  _SelMovPeloTipoDaFormaPagamento_LO
//N. SIG.............: 121221
//Data da AlteraÁ„o..: 29/11/2021
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: CorreÁ„o na forma de gerar o segmento W, considerado a
//                     condiÁ„o 9, para Tipo de InformaÁ„o.
//******************************************************************************
//Rotina.............: _GeraArquivoDeRemessa, _SelMovPeloTipoDaFormaPagamento_LO
//N. SIG.............: 120990
//Data da AlteraÁ„o..: 19/11/2021
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: CorreÁ„o na forma de gerar o segmento W, quando
//                     do pagamento de FGTS. 
//******************************************************************************
//Rotina.............: _GeraArquivoDeRemessa
//N. SIG.............: 120661
//Data da AlteraÁ„o..: 09/11/2021
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: CorreÁ„o no ordenamento de linhas na dentro do lote de pagamento. 
//******************************************************************************
//Rotina.............: _GeraArquivoDeRemessa
//N. SIG.............: 120604
//Data da AlteraÁ„o..: 04/11/2021
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: CorreÁ„o na geraÁ„o de arquivo de remessa que com pagamento
//                     de guias FGTS
//******************************************************************************
//Rotina.............: _SelMovPeloTipoDaFormaPagamento_LO, _SelMovPeloTipoDaFormaPagamento_LN,
//                     _SelMovPeloTipoDaFormaPagamento_LA_Linha_A 
//N. SIG.............: 117759
//Data da AlteraÁ„o..:
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: AdequaÁ„o na geraÁ„o dos arquivos de remessa, incluindo o
//                     identificador
//******************************************************************************
//Rotina.............: _ListaConvenios
//N. SIG.............: 115359
//Data da AlteraÁ„o..: 30/04/2021
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: AdequaÁ„o para tratamento de documentos de arrecaÁ„o pagos
//                     via BANCO DO BRASIL
//******************************************************************************
//Rotina.............: _SelecionaDadosCabecArq, _SelecionaDadosCabecLote,
//                     _CarregaParamConvenio, _GravaLinha, _SelMovPeloTipoDaFormaPagamento_LO,
//                     _SelMovPeloTipoDaFormaPagamento_LJ, _SelMovPeloTipoDaFormaPagamento_LN
//N. SIG.............: 114764
//Data da AlteraÁ„o..: 06/04/2021
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: AdequaÁ„o da montagem de arquivos de remessa para o BANCO DO BRASIL.
//******************************************************************************
//N. SIG.............: 114142
//Data da AlteraÁ„o..: 05/03/2021
//Respons·vel........: Ewerton Beltramini
//DescriÁ„o..........: AlteraÁ„o de digito verificador da agencia na montagem do arquivo.
//******************************************************************************
//N. SIG.............: 111288
//Data da AlteraÁ„o..: 24/11/2020
//Respons·vel........: AndrÈ Imakawa
//DescriÁ„o..........: AlteraÁ„o na forma de buscar a lista de convenios para
//                     entidades.
//******************************************************************************
//N. SIG.............: 102967
//Data da AlteraÁ„o..: 08/10/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: AlteraÁ„o na forma de an·lise de documentos para remessa,
//                     voltando a vers„o anterior.
//******************************************************************************
//Rotina.............: GetMovimentoRemessaCap
//N. SIG.............: 102320
//Data da AlteraÁ„o..: 30/09/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: AlteraÁ„o na forma de an·lise de documentos para remessa.
//******************************************************************************
//Rotina.............: AbreContratosAEnviar, MontaSQLEnvio
//N. SIG.............: 101924
//Data da AlteraÁ„o..: 03/09/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: AlteraÁ„o no procedimento de envio para consideraÁ„o de
//                     devoluÁ„o de parcelas para pagamento via arquivo SIACC 240
//******************************************************************************
//Rotina.............: _GetFavorecidosEmp
//N. SIG.............: 101870
//Data da AlteraÁ„o..: 27/08/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: CorreÁ„o na recuperÁ„o de pagamento de devoluÁ„o de
//                     parcelas de emprÈstimos.
//******************************************************************************
//Rotina.............: _SelMovPeloTipoDaFormaPagamento_LA_Linha_B
//N. SIG.............: 101677
//Data da AlteraÁ„o..: 18/08/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: CorreÁ„o no retorno de informaÁıes para a linha B.
//******************************************************************************
//Rotina.............: _SelecionaMovArqDetalhe
//N. SIG.............: 101647
//Data da AlteraÁ„o..: 11/08/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: CorreÁ„o no retorno de informaÁıes de detalhamento dos arquivos.
//******************************************************************************
//Rotina.............: _SelDistinctMovArqGeradoPendDet, _GravaLinha, _CriaArquivo
//N. SIG.............: 101591
//Data da AlteraÁ„o..: 14/08/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: CorreÁ„o no formato geraÁ„o do arquivo.
//******************************************************************************
//Rotina             : GetDadosGPSAutonomo, GetMovimentoRemessaFB, GetMovimentoRemessaCap
//                     GetMovimentoRemessaEmp
//N. SIG..........   : 100970
//Data da AlteraÁ„o: : 14/08/2020
//Respons·vel:       : C·ssio FlorÍncio Rovaroto
//DescriÁ„o.......   : CorreÁ„o no tratamento de detalhamento de pagamentos de tributos.
//******************************************************************************
//Rotina.............: _SelMovPeloTipoDaFormaPagamento_LA_Linha_A
//N. SIG.............: 101541
//Data da AlteraÁ„o..: 11/08/2020
//Respons·vel........: AndrÈ Imakawa / C·ssio Florencio Rovaroto
//DescriÁ„o..........: CorreÁ„o na busca de Agencia e Conta corrente para modulo = 18.
//******************************************************************************
//Rotina             : FormCreate, GetMovimentoRemessaCap, GetMovimentoRemessaFP,
//                     GetMovimentoRemessaFB, _SelecionaMovimentoRemessa,
//                     _GetFavorecidosFP, _GetFavorecidosFB,
//                     _GetArquivoRetorno,
//                     _SelMovPeloTipoDaFormaPagamento_LA_Linha_A,
//                     _SelMovPeloTipoDaFormaPagamento_LA_Linha_B, MontaLinhaA,
//                     MontaLinhaB, _SelMovPeloTipoDaFormaPagamento_LJ_Linha_J,
//                     _SelMovPeloTipoDaFormaPagamento_LJ_Linha_J52, MontaLinhaJ,
//                     MontaLinhaJ52
//N. SIG..........   : 60540
//Data da AlteraÁ„o: :
//AlteraÁ„o Form:    : uCtrlRemessaEletronica
//Respons·vel:       : C·ssio FlorÍncio Rovaroto
//DescriÁ„o.......   : AdequaÁ„o da funcionalidade para utilizaÁ„o, tambÈm, no
//                     mÛdulo Folha de BenefÌcio.
//***************************************************************************************
//Rotina             : _SelMovPeloTipoDaFormaPagamento_LJ, _GeraArquivoDeRemessa
//N. SIG..........   : 101461
//Data da AlteraÁ„o: : 07/08/2020
//Respons·vel:       : C·ssio FlorÍncio Rovaroto
//DescriÁ„o.......   : AletraÁ„o na forma de geraÁ„o da linha do tipo J
//*********************************************************************************
//Rotina             : _SelMovPeloTipoDaFormaPagamento_LN,
//                     _SelMovPeloTipoDaFormaPagamento_LO,
//                     _SelMovPeloTipoDaFormaPagamento_LA_Linha_A,
//                     _SelMovPeloTipoDaFormaPagamento_LJ_Linha_J
//N. SIG..........   : 101422
//Data da AlteraÁ„o: : 06/08/2020
//Respons·vel:       : C·ssio FlorÍncio Rovaroto
//DescriÁ„o.......   : CorreÁ„o na geraÁ„o dos arquivos de pagamento.
//*********************************************************************************
//Rotina             : GetMovimentoRemessaEmp, _GetFavorecidosEmp,
//                     _SelMovPeloTipoDaFormaPagamento_LA_Linha_A,
//                     _SelMovPeloTipoDaFormaPagamento_LA_Linha_B,
//                     _SelMovPeloTipoDaFormaPagamento_LJ_Linha_J,
//                     _SelMovPeloTipoDaFormaPagamento_LJ_Linha_J52,
//                     MontaLinhaJ, MontaLinhaJ52
//N. SIG.............: 64071
//Data da AlteraÁ„o  : 05/08/2020
//AlteraÁ„o Form     : uCtrlRemessaEletronica
//Respons·vel        : C·ssio FlorÍncio Rovaroto
//DescriÁ„o..........: AdequaÁ„o da funcionalidade para utilizaÁ„o no mÛdulo EmprÈstimo.
//***************************************************************************************
//Rotina.............: _GeraArquivoDeRemessa
//N. SIG.............: 100510
//Data da AlteraÁ„o..: 18/06/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: AlteraÁ„o na forma de tratamento das informaÁıes que v„o no
//                     arquivo.
//******************************************************************************
//Rotina.............: _GPSPagto_PF_PJ, _SelMovPeloTipoDaFormaPagamento_LN
//N. SIG.............: 100343
//Data da AlteraÁ„o..: 12/06/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: AlteraÁ„o no formato de geraÁ„o de linhas N, para
//    				   identificaÁ„o de pagamento de GPS de autÙnomos
//******************************************************************************
//Rotina.............: _SelecionaMovArqDetalhe
//N. SIG.............: 100336
//Data da AlteraÁ„o..: 05/06/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: Retirada das informaÁıes de Centro de Responsabilidade da
//                     funcionalidade.
//******************************************************************************
//N. SIG.............: 99642
//Data da AlteraÁ„o..: 29/04/2020
//Respons·vel........: Everson Cunha
//DescriÁ„o..........: CorreÁ„o na rotina que verifica gravaÁ„o de cÛdigos de
//                     barras duplicado. _ExisteCodBarras
//******************************************************************************
//Rotina             : _GeraArquivoDeRemessa, _SelMovPeloTipoDaFormaPagamento_LJ,
//                     _SelMovPeloTipoDaFormaPagamento_LO, _SelMovPeloTipoDaFormaPagamento_LK,
//                     _SelecionaMovArqDetalhe 
//N. SIG..........   : 99579
//Data da AlteraÁ„o: : 20/04/2020
//Respons·vel:       : C·ssio Florencio Rovaroto
//DescriÁ„o.......   : DefiniÁıes para definiÁ„o da data de pagamento para remessa
//                     com boletos.
//******************************************************************************
//Rotina             : _GeraArquivoDeRemessa
//N. SIG..........   : 99500
//Data da AlteraÁ„o: : 20/04/2020
//Respons·vel:       : C·ssio Florencio Rovaroto
//DescriÁ„o.......   : CorreÁ„o aplicada na montagem de lotes de Pagamento a
//                     Fornecedor.
//******************************************************************************
//N. SIG.............: 99381
//Data da AlteraÁ„o..: 09/04/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: CorreÁ„o na forma de validaÁ„o de DV de boletos de
//                     arrecadaÁ„o.
//******************************************************************************
//N. SIG.............: 99349
//Data da AlteraÁ„o..: 02/04/2020
//Respons·vel........: C·ssio Florencio Rovaroto
//DescriÁ„o..........: AlteraÁ„o na regra de validaÁ„o de boletos de arrecadaÁ„o
//					           para pagamentos a concession·rias.
//******************************************************************************
//N. SIG.............: 84050
//Data da AlteraÁ„o..: 18/02/2020
//Respons·vel........: Everson Cunha
//DescriÁ„o..........: Solicito a criaÁ„o de ferramenta na Remessa EletrÙnica
//                     para liquidaÁıes de Tributos (GPS, DARFs, FGTS, DAR),
//                     conforme layout encaminhado pelo Fernando (NEXXERA).
//******************************************************************************
//N. SIG.............: 88640
//Data da AlteraÁ„o..: 12/12/2019
//Respons·vel........: Everson Cunha
//DescriÁ„o..........: N„o permitir a gravaÁ„o de cÛdigos de barras duplicado
//******************************************************************************
//Rotina             : _SelecionaMovArqDetalhe
//N. SIG..........   : SIG TIBERO
//Data da AlteraÁ„o: : 24/10/2018
//Respons·vel:       : Everson Luiz Pereira da Cunha
//DescriÁ„o.......   : Melhoria no relatÛrio de Remessa EletrÙnica
//                     Incluir C.R. e HistÛrico
//******************************************************************************
//Rotina             : _SelecionaMovArqDetalhe
//N. SIG..........   : SIG TIBERO
//Data da AlteraÁ„o: : 16/10/2018
//AlteraÁ„o Form:    : uCtrlRemessaEletronica
//Respons·vel:       : Everson Luiz Pereira da Cunha
//DescriÁ„o          : Melhoria em adequaÁ„o ao TIBERO
//******************************************************************************
//Rotina             : _SelecionaMovimentoRemessa
//N. SIG..........   : 75187
//Data da AlteraÁ„o: : 12/09/2018
//AlteraÁ„o Form:    : uCtrlRemessaEletronica
//Respons·vel:       : C·ssio Rovaroto
//DescriÁ„o          : CorreÁ„o na rotina de recuperaÁ„o de movimentos para
//                     remessa, recuperando somente documentos "abertos".
//******************************************************************************
//Rotina             : _SelecionaMovBaixa
//N. SIG..........   : 73920
//Data da AlteraÁ„o: : 03/09/2018
//AlteraÁ„o Form:    : uCtrlRemessaEletronica
//Respons·vel:       : Denis Horongoso
//DescriÁ„o          : IncluÌdo o campo FLGBAIXATOTAL na consulta para efetuar
//                     corretamente o rateio de valor do documento baixado na
//                     tabela RATEIOFINANC
//******************************************************************************
//Rotina             :  _SelecionaDadosCabecArq
//N. SIG..........   : 74164   
//Data da AlteraÁ„o: : 06/09/2018
//AlteraÁ„o Form:    : uCtrlRemessaEletronica
//Respons·vel:       : C·ssio Florencio Rovaroto
//DescriÁ„o.......   : Inclus„o do par‚metro IdArqPagto na funÁ„o para
//                     considerar o id do arquivo no arquivo de remessa,
//                     a fim de identific·-lo na remessa.
//******************************************************************************
//Rotina             : _CriaArquivo, _GravaLinha, _SelecionaMovArqDetalhe,
//                     _SelMovPeloTipoDaFormaPagamento_LA, Impersonate
//N. SIG..........   : 73883
//Data da AlteraÁ„o: : 21/08/2018
//AlteraÁ„o Form:    : uCtrlRemessaEletronica
//Respons·vel:       : C·ssio FlorÍncio Rovaroto
//DescriÁ„o          : AlteraÁ„o atribuiÁ„o do nome do arquivo de remessa,
//                     colocando o NSA no lugar do identificador do envio.
//                     Inclus„o de rotina gravaÁ„o de arquivo no servidor.
//                     Inclus„o de adaptaÁ„o para conta corrente do banco HSBC
//******************************************************************************
//Rotina             : RemoveCaracterEspecial,
//                     _SelMovPeloTipoDaFormaPagamento_LA,
//                     _SelMovPeloTipoDaFormaPagamento_LJ
//N. SIG..........   : 67165
//Data da AlteraÁ„o: : 24/04/2018
//AlteraÁ„o Form:    : uCtrlRemessaEletronica
//Respons·vel:       : C·ssio FlorÍncio Rovaroto
//DescriÁ„o.......   : AlteraÁıes nas informaÁıes que v„o para o arquivo
//                     remessa, impedindo a inclus„o de caracteres especiais
//                     e acentuados.
//******************************************************************************
//Rotina             : _SelecionaDadosCabecArq, _SelecionaDadosCabecLote
//N. SIG..........   : 64891
//Data da AlteraÁ„o: : 15/03/2018
//AlteraÁ„o Form:    : uCtrlRemessaEletronica
//Respons·vel:       : C·ssio FlorÍncio Rovaroto
//DescriÁ„o.......   : AlteraÁ„o da forma de tratamento para inclus„o do dÌgito
//                     verificador para o banco CAIXA
//******************************************************************************
//Rotina             : Diversas
//N. SOL..........   : 212845
//N. PPM..........   : 1129416
//Data da AlteraÁ„o  : 01/03/2016
//AlteraÁ„o Form     :
//Respons·vel        : Paulo Nobre
//DescriÁ„o          : Biblioteca de funÁıes exclusivas da funcionalidade de
//                     Remessa EletrÙnica
--------------------------------------------------------------------------------}


Unit uCtrlRemessaEletronica;

interface

uses Classes, Db, DbClient, SysUtils, contnrs, controls, adodb,
  UDiasUteis, umenserro, uSistema, uCmControlObject, uCmMath,
  uCmDbObject, uDataBase, uCMTypes, DBaseDados, Dialogs, Forms,
  comCtrls, dbTables, Wwquery, uCmSqlParams, math, CMwwQuery, FProgresso,
  FProgressoDuplo, Gauges, Shellapi, filectrl, ucmFileUtils, uFuncoesUteisIR,
  Windows, UCripto, JclStrings, uCMClientDataSet,
  FAguarde;                                                // Paulo Nobre - WO6194

// Chaves de encriptaÁ„o
const StKey = 7848567;
const MtKey = 1741378;
const AdKey = 6574985;

const fUser = '±'#5'≠ç'#$D'TZ!,|'#$1F'jº'#$15'rÙVÅ‡9'; //Login de acesso ao servidor, criptografado.
const fPw   = '„që∫%⁄ØÙ'; //Senha do login de acesso ao servidor, criptografado.

type

  // Objeto tipo Record contendo dados de parametrizaÁ„o do ConvÍnio
  TDadosParamConv = Record
    sNumBanco: String;
    sNomeBanco: String;
    dVlrObrigaCpfCnpj: Double;
    sParamTrans: String;
    sAmbiente: String;
    sVerLeiauteArq: String;
    sVerLeiauteLote: String;
    sDensidade: String;
    sTipoOper: String;
    sCodCompromisso: String;
    sTipoServico: String;
    sTipoServicoK: String;
    sTipoCompromisso: String;
    sTipoCompromissoK: String;
    sFinalidadeDOC: String;
  end;

  TCtrlRemessaEletronica = class(tCmControlObject)
  private
    iAno, iMes, iDia: Word;

    iEmpresa: Integer;
    sPathArquivo: String;

    CdsAux1: TCMClientDataSet;
    cdsGeraCabecRodapeArq: TCMClientDataSet;
    cdsGeraCabecRodapeLote: TCMClientDataSet;
    cdsGeraMovLote: TCMClientDataSet;
    cdsConvenioParam: TCMClientDataSet;
    //C·ssio Rovaroto - SIG n∫ 60540 - InÌcio
    cdsGeraMovLoteDet: TCMClientDataSet;
    //C·ssio Rovaroto - SIG n∫ 60540 - Fim

    qryAux1: TwwQuery;
    sqlText: TStringList;
    ArquivoEnvioCEF: TextFile;
    //C·ssio Rovaroto - SIG n∫ 67165
    function RemoveCaracterEspecial(pTexto: String; pRemoveExtra: boolean): String;
    function _GPSPagto_PF_PJ(pFormaRecPag: integer): integer;
    //C·ssio Rovaroto - SIG n∫ 60540 - InÌcio
    function GetMovimentoRemessaCap(pConvenio, pFormaPagto: String; pDataIni, pDataFim: TDateTime): string;
    function GetMovimentoRemessaFP(pConvenio, pFormaPagto: String; pDataIni, pDataFim: TDateTime): string;
    function GetMovimentoRemessaFB(pConvenio, pFormaPagto: String; pDataIni, pDataFim: TDateTime): string;
    //C·ssio Rovaroto - SIG n∫ 60540 - Fim
    //C·ssio Rovaroto - SIG n∫ 64071 - InÌcio
    function GetMovimentoRemessaEmp(pConvenio, pFormaPagto: String; pDataIni, pDataFim: TDateTime): string;
    //C·ssio Rovaroto - SIG n∫ 64071 - Fim
  Public
    // Objeto tipo Record contendo dados de parametrizaÁ„o do ConvÍnio
    rDadosParamConv: TDadosParamConv;

    constructor Create; Override;
    destructor Destroy; override;

    // FunÁıes B·sicas de Apoio
    Procedure _AtualizaFrmProgresso(Var iContador: integer);
    Function _PrepararFloat(sString: String): String;
    Function _ConverteListas(Const pListaPessoas: TStringList): String;
    Function _TiraMascara(wTexto: String): String;
    Function _TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
    Function _ExtrairDataVencimentoCodigoDeBarra(Const sCodigoBarras: String): TDateTime;
    Function _ExtrairValorCodigoDeBarra(Const sCodigoBarras: String): Currency;
    Function _ValidaCodBarrasFichaComp(sCodBarras: String; idv: Integer): Boolean;
    Function _ValidaCodBarrasArrecadacao(sCodBarras: String): Boolean;
    Function _CompletaEspacoDir(sNome: String; iTam: integer): String;
    Function _CompletaZeroEsq(sNome: String; iTam: integer): String;
    function _ValidaCPF(sDocum: String): Boolean;
    function _ValidaCNPJ(sDocum: String): Boolean;
    function _SomaDig(sDocum: String; iTotDig, iPot: integer): integer;
    function _EncryptSTR(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
    function _DecryptSTR(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
    function _CriptoDecripto(sAcao, sString: String): String;
    //function _ExisteCodBarras(codbarras : string) : Boolean; //Everson Cunha - SIG88640 //Everson Cunha - SIG99642
    function _ExisteCodBarras(codDocumento, codbarras : string; idCodxBarras : string = '0') : Boolean; //Everson Cunha - SIG99642
    //
    function _ListaConvenios: OleVariant;
    function _ListaConveniosFolha(pPeriodo: string): OleVariant;
    function _ListaFormaPagamentos: OleVariant;
    function _ListaFormaPagamentosGeral: OleVariant;
    //C·ssio Rovaroto - SIG n∫ 60540 - InÌcio
    function _SelecionaMovimentoRemessa(pConvenio, pFormaPagto: String; pDataIni, pDataFim: TDateTime; pIdModulo: Integer): OleVariant;
    function _GetFavorecidosFP(pConvenio, pFormaPagto: String;pDataIni, pDataFim: TDateTime; pGerarPrevia: integer = -1): OleVariant;
    function _GetFavorecidosFB(pConvenio: string; pDataIni, pDataFim: TDateTime; pCodDocumento: Integer): OleVariant;
    function _GetArquivoRetorno(pCodPortForma: string; sNomeArquivo: string = ''): OleVariant;
    //C·ssio Rovaroto - SIG n∫ 60540 - Fim
    //C·ssio Rovaroto - SIG n∫ 64071 - InÌcio
    function _GetFavorecidosEmp(pConvenio: string; pDataIni, pDataFim: TDateTime; pCodDocumento: Integer): OleVariant;
    function _GetVersaoFolha(pAnoMes: string): OleVariant;
    function _GetConvenioFolha(pIdHstFolhaBenef: Integer):OleVariant;
    //C·ssio Rovaroto - SIG n∫ 64071 - Fim
    function _SelecionaMovArquivo(pConvenio, pFlgEnviado: String; pPagtoExcepcional: Integer = 0): OleVariant;
    function _SelecionaMovArqDetalhe: String;
    function _SelecionaMovBaixa(pIdArqPgto, pTipoBaixa: String): OleVariant;
    function GetDadosGPSAutonomo: OleVariant; //C·sio Rovaroto - SIG n∫ 100970
    //
    // Rotinas para GeraÁ„o do Arquivo de Remessa
    //
    procedure _GravaLinha(sArquivo, sLinha: String; pNumLote: string = '');
    procedure _GeraArquivoDeRemessa(pNomeCompletoArquivoRemessa, pIdArqPagto, pCodPortForma, pNSA: String);
    function _CriaArquivo(sArquivo: String): Boolean;
    function _CarregaParamConvenio(pCodPortForma: String; var sMsgErro: string): Boolean;
    function _SelecionaDadosCabecArq(pCodPortForma, pNSA, pIdArqPagto: String): Olevariant;
    function _SelecionaDadosRodapeArq(pQtdLotesArq, pQtdRegsArq: String): Olevariant;
    function _SelecionaDadosCabecLote(pCodPortForma, pSeqLote, pFormaLanc, pTipCompromisso, pTipoServico: String): Olevariant;
    function _SelecionaDadosRodapeLote(pSeqLote, pQtdRegsLote, pVlrTotalLote: String): Olevariant;
    function _SelDistinctMovArqGeradoPendDet(pIdArqPagto: String): Olevariant;
    function _SelMovPeloTipoDaFormaPagamento_LA(pIdArqPagto, pTipFormaRecPag, pFormaLanc, pFinalidadeDOC, pSeqLote: String): Olevariant;
    function _SelMovPeloTipoDaFormaPagamento_LJ(pIdArqPagto, pTipFormaRecPag, pFormaLanc, pSeqLote: String): Olevariant;
    function _SelMovPeloTipoDaFormaPagamento_LK(pIdArqPagto, pTipFormaRecPag, pSeqLote: String): Olevariant;
    function _SelMovPeloTipoDaFormaPagamento_LO(pIdArqPagto, pTipFormaRecPag, pFormaLanc, pSeqLote: String): Olevariant; //Everson Cunha - SIG84050
    function _SelMovPeloTipoDaFormaPagamento_LN(pIdArqPagto, pTipFormaRecPag, pFormaLanc, pSeqLote: String): Olevariant; //Everson Cunha - SIG84050
    //

    //C·ssio Rovaroto - SIG n∫ 60540 - InÌcio
    //Leiaute A
    function _SelMovPeloTipoDaFormaPagamento_LA_Linha_A(pIdArqPagto, pTipFormaRecPag, pFormaLanc, pFinalidadeDOC: string): OleVariant;
    function _SelMovPeloTipoDaFormaPagamento_LA_Linha_B(pIdArqPagto, pTipFormaRecPag, pFormaLanc: String): OleVariant;
    function MontaLinhaA(pSeqLote, pSeqNSR: String): string;
    function MontaLinhaB(pSeqLote, pSeqNSR: String): string;
    //------------

    //Leiaute J
    function _SelMovPeloTipoDaFormaPagamento_LJ_Linha_J(pIdArqPagto, pTipFormaRecPag, pFormaLanc, pFinalidadeDOC: String): OleVariant;
    function _SelMovPeloTipoDaFormaPagamento_LJ_Linha_J52(pIdArqPagto, pTipFormaRecPag, pFormaLanc: String): OleVariant;
    function MontaLinhaJ(pSeqLote, pSeqNSR: String): string;
    function MontaLinhaJ52(pSeqLote, pSeqNSR: String): string;
    //------------
    //C·ssio Rovaroto - SIG n∫ 64071 - Fim
    //C·ssio Rovaroto - SIG n∫ 73883
    function Impersonate: boolean;
    function RecuperaValorSIACC: real;

    //=======================================================================================
    // SeleÁıes de Movimento do Arquivo Gerado da Folha de BenefÌcios -- Paulo Nobre - WO6194
    //=======================================================================================
    function _SelecionaMovArquivoFB(pOrigemPagto : Integer; pAnoMesPagto, pIdFolha, pConvenio, pFlgEnviado : string): OleVariant;
    //function _SelecionaMovArqDetalheFB(pOrigemPagto : Integer; pAnoMesPagto, pIdFolha, pConvenio, pFlgEnviado : string): OleVariant;                         //edilaine WO38027
    function _SelecionaMovArqDetalheFB(pOrigemPagto : Integer; pAnoMesPagto, pIdFolha, pConvenio, pFlgEnviado : string): OleVariant;    //edilaine WO38027
    function _SqlSelecionaMovArqDetalheFB(pOrigemPagto : Integer; pAnoMesPagto, pIdFolha, pConvenio, pFlgEnviado : string): string;     //edilaine WO38027
    //=======================================================================================

  protected
    procedure DoChangeDataBase; Override;
  end;

implementation

{ TCtrlRemessaEletronica }

Procedure TCtrlRemessaEletronica.DoChangeDataBase;
Begin
  Inherited;
End;

constructor TCtrlRemessaEletronica.Create;
begin
  Inherited;
  CdsAux1 := TCMClientDataSet.Create(nil);
  cdsGeraCabecRodapeArq := TCMClientDataSet.Create(nil);
  cdsGeraCabecRodapeLote := TCMClientDataSet.Create(nil);
  cdsGeraMovLote := TCMClientDataSet.Create(nil);
  cdsConvenioParam := TCMClientDataSet.Create(nil);
  cdsGeraMovLoteDet := TCMClientDataSet.Create(nil); //C·ssio Rovaroto - SIG n∫ 60540

  Application.CreateForm(TfrmProgressoDuplo,      frmProgressoDuplo);
  Application.CreateForm(TfrmAguarde, frmAguarde);         // Paulo Nobre - WO6194

  qryAux1 := TwwQuery.Create(Nil);
  qryAux1.DatabaseName := 'BaseDados';

  sqlText := TStringList.create;

  iEmpresa := Sistema.IdEmpresa;
  sPathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LogRemessaEletro';
end;

destructor TCtrlRemessaEletronica.Destroy;
begin
  Inherited;
  CdsAux1.Close;
  qryAux1.Close;

  FreeAndNil(CdsAux1);
  FreeAndNil(cdsGeraCabecRodapeArq);
  FreeAndNil(cdsGeraCabecRodapeLote);
  FreeAndNil(cdsGeraMovLote);
  FreeAndNil(cdsConvenioParam);
  FreeAndNil(qryAux1);
  FreeAndNil(sqlText);
  FreeAndNil(cdsGeraMovLoteDet); //C·ssio Rovaroto - SIG n∫ 60540
  FreeAndNil(frmProgressoDuplo)
End;

//////////////////////////////// INÕCIO FUN«’ES B¡SICAS /////////////////////////////////

function TCtrlRemessaEletronica._ValidaCPF(sDocum: String): boolean;
var idvo1, idvo2, idv1, idv2, iSoma, iResto: integer;
begin
  If length(sDocum) <> 11 Then
    Result := false
  Else
    Begin
      If strtoFloat(sDocum) = 0 Then
        Result := false
      Else
        Begin
          idvo1 := StrToInt(sDocum[10]);
          idvo2 := StrToInt(sDocum[11]);

          //Calcula o digito verificador 1
          iSoma := _SomaDig(sDocum, 9, 10);
          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv1 := 0
          Else
            idv1 := 11 - iResto;

          //Calcula o digito verificador 2
          iSoma := _SomaDig(sDocum, 9, 11);
          iSoma := iSoma + (idv1 * 2);

          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv2 := 0
          Else
            idv2 := 11 - iResto;

          Result := ((idv1 = idvo1) And (idv2 = idvo2));
        End;
    End;
End;

Function TCtrlRemessaEletronica._ValidaCNPJ(sDocum: String): boolean;
Var iSoma, idvo1, idvo2, idv1, idv2, iResto: integer;
Begin
  If length(sDocum) <> 14 Then
    Result := false
  Else
    Begin
      If strtoFloat(sDocum) = 0 Then
        Result := false
      Else
        Begin
          idvo1 := StrToInt(sDocum[13]);
          idvo2 := StrToInt(sDocum[14]);

          //Calcula o digito verificador 1
          iSoma := _SomaDig(sDocum, 12, 5);
          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv1 := 0
          Else
            idv1 := 11 - iResto;

          // Calcula o digito verificador 2
          iSoma := _SomaDig(sDocum, 12, 6);
          iSoma := iSoma + (idv1 * 2);

          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv2 := 0
          Else
            idv2 := 11 - iResto;

          Result := ((idv1 = idvo1) And (idv2 = idvo2));
        End;
    End;
End;

Function TCtrlRemessaEletronica._SomaDig(sDocum: String; iTotDig, iPot: integer): integer;
Var i: integer;
Begin
  Result := 0;
  For i := 1 To iTotDig Do
    Begin
      Result := Result + (StrToInt(sDocum[i]) * iPot);
      Dec(iPot);
      If iPot = 1 Then
        iPot := 9;
    End;
End;

Function TCtrlRemessaEletronica._PrepararFloat(sString: String): String;
Begin
  Result := sString;
  Result := _TrocaTexto(Result, '.', DecimalSeparator);
  Result := _TrocaTexto(Result, ',', DecimalSeparator);
End;

Function TCtrlRemessaEletronica._ConverteListas(Const pListaPessoas: TStringList): String;
Var I: Integer;
Begin
  For i := 0 To pListaPessoas.Count - 1 Do
    result := result + quotedstr(pListaPessoas[i]) + ',';

  Result := Copy(Result, 1, Length(Result) - 1);
End;

Function TCtrlRemessaEletronica._TiraMascara(wTexto: String): String;
Var wCon, wCC: Integer;
  wRet, wParte: String;
Begin
  wRet := '';
  wCC := Length(wTexto);
  For wCon := 1 To wCC Do
    Begin
      wParte := copy(wTexto, wCon, 1);
      If (wParte <> '-') And
        (wParte <> '/') And
        (wParte <> '.') And
        (wParte <> '"') And
        (wParte <> '*') Then
        wRet := wRet + wParte;
    End;
  _TiraMascara := wRet;
End;

Function TCtrlRemessaEletronica._TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
Var
  iPosition: integer;
  sTemp: String;
Begin
  iPosition := 1;
  sTemp := '';
  While (iPosition > 0) Do
    Begin
      If bInsensitive Then
        iPosition := AnsiPos(UpperCase(sOld), UpperCase(sString))
      Else
        iPosition := AnsiPos(sOld, sString);
      If (iPosition > 0) Then
        Begin
          sTemp := sTemp + copy(sString, 1, iPosition - 1) + sNew;
          sString := copy(sString, iPosition + Length(sOld), Length(sString));
        End;
    End;
  sTemp := sTemp + sString;
  Result := (sTemp);
End;

Procedure TCtrlRemessaEletronica._AtualizaFrmProgresso(Var iContador: Integer);
Begin
  inc(iContador);
  frmProgresso.AndaFormProgresso(iContador);
  Application.ProcessMessages;
End;

Function TCtrlRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(Const sCodigoBarras: String): TDateTime;
var FatorVencimento : integer;
    sDataInicioFatorVencimento : String;
Begin
  If length(sCodigoBarras) = 47 Then // Boletos de TÌtulos comuns
  begin
    // '07/10/1997' - Data padr„o de inicio da contagem do vencimento definida pela FEBRABAN
    // Result := StrToDate('07/10/1997') + StrToInt(Copy(sCodigoBarras, 34, 4));

    // WO16145 - Inicio
    // Alterado por Arnaldo V. Scarin em 19/12/2024
    // A partir de 22/02/2025, o FatorVencimento do CÛdigo de Barras dever· ser abatido
    // em 1000 dias, pois esse valor n„o poder· passar de 9999.
    // Por conta disso, a rotina abaixo verifica se o FatorVencimento È menor que
    // 8852 (Data: 31/12/2022), e se for, ao invÈs de utilizar a data inicial do
    // FatorVencimento, que È 07/10/1997, passar· a utilizar a data de 22/05/2025,
    // fazendo com que a data de vencimento seja recuperada corretamente do
    // cÛdigo de barras.

    FatorVencimento := StrToInt(Copy(sCodigoBarras, 34, 4));
    sDataInicioFatorVencimento := '07/10/1997';

    If FatorVencimento < 8852 then // 8852 + '07/10/1997' -> 31/12/2022
    begin
      sDataInicioFatorVencimento := '22/02/2025';
      FatorVencimento := FatorVencimento - 1000;    // Paulo Nobre - WO18638
    end;

    Result := StrToDate(sDataInicioFatorVencimento) + FatorVencimento;
    // WO16145 - Fim
  end;
End;

Function TCtrlRemessaEletronica._ExtrairValorCodigoDeBarra(Const sCodigoBarras: String): Currency;
Begin
  If length(sCodigoBarras) = 47 Then // Boletos de TÌtulos comuns
    Result := StrToCurr(Copy(sCodigoBarras, 38, 10)) / 100
  Else If length(sCodigoBarras) = 48 Then // Boletos de Tributos e ArrecadaÁıes
    Result := StrToCurr(Copy(sCodigoBarras, 5, 7) + Copy(sCodigoBarras, 13, 4)) / 100
End;

Function TCtrlRemessaEletronica._ValidaCodBarrasFichaComp(sCodBarras: String; idv: Integer): Boolean;
Var sTipoCodigo, sAuxCodBarras, sProd: String;
  X, iBase, iDividendo, iDigito, I, Z, isprod: Integer;
  iCdigito: Array[0..3] Of Integer;
Begin
  Result := False;
  sTipoCodigo := '';
  Case idv Of
    10: //ComposiÁ„o da represantaÁ„o numÈrica do cÛdigo de barras - parte superior da ficha de compensaÁ„o
      Begin
        sTipoCodigo := 'Superior';
        //C·lculo do DV MÛdulo 10 base 2
        If Length(sCodBarras) >= 33 Then
          Begin
            //C·lculo do DV do Campo 1
            iBase := 2;
            iDividendo := 0;
            I := 9;
            sAuxCodBarras := Copy(sCodBarras, 1, 9);
            For X := 1 To 9 Do
              Begin
                isprod := 0;

                sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                For Z := 1 To Length(sProd) Do
                  isprod := isprod + StrToInt(sProd[Z]);

                iDividendo := iDividendo + isprod;
                If iBase = 2 Then
                  iBase := 1
                Else
                  Inc(iBase);
                dec(I)
              End;
            iCdigito[0] := 10 - (iDividendo Mod 10);

            //C·lculo do DV do Campo 2
            iBase := 2;
            iDividendo := 0;
            I := 10;
            sAuxCodBarras := Copy(sCodBarras, 11, 10);
            For X := 1 To 10 Do
              Begin
                isprod := 0;

                sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                For Z := 1 To Length(sProd) Do
                  isprod := isprod + StrToInt(sProd[Z]);

                iDividendo := iDividendo + isprod;
                If iBase = 2 Then
                  iBase := 1
                Else
                  Inc(iBase);
                dec(I)
              End;
            iCdigito[1] := 10 - (iDividendo Mod 10);

            //C·lculo do DV do Campo 3
            iBase := 2;
            iDividendo := 0;
            I := 10;
            sAuxCodBarras := Copy(sCodBarras, 22, 10);
            For X := 1 To 10 Do
              Begin
                isprod := 0;

                sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                For Z := 1 To Length(sProd) Do
                  isprod := isprod + StrToInt(sProd[Z]);

                iDividendo := iDividendo + isprod;
                If iBase = 2 Then
                  iBase := 1
                Else
                  Inc(iBase);
                dec(I)
              End;
            iCdigito[2] := 10 - (iDividendo Mod 10);

            //-------------------------------------------------------

            For X := 0 To 2 Do
              If iCdigito[X] = 10 Then
                iCdigito[X] := 0;

            Result := ((iCdigito[0] = StrToInt(sCodBarras[10])) And
              (iCdigito[1] = StrToInt(sCodBarras[21])) And
              (iCdigito[2] = StrToInt(sCodBarras[32])));
          End;
      End;

    11: //ComposiÁ„o do cÛdigo de barras - parte inferior da ficha de compensaÁ„o
      Begin
        sTipoCodigo := 'Inferior';
        //C·lculo do DV MÛdulo 11 base 9
        If Length(sCodBarras) >= 40 Then
          Begin
            iBase := 2;
            iDividendo := 0;
            sAuxCodBarras := Copy(sCodBarras, 1, 4) + Copy(sCodBarras, 6, 39);
            For X := 1 To 43 Do
              Begin
                iDividendo := iDividendo + (StrToInt(sAuxCodBarras[44 - X]) * iBase);
                If iBase = 9 Then
                  iBase := 2
                Else
                  Inc(iBase);
              End;
            iDigito := 11 - (iDividendo Mod 11);

            If iDigito In [10, 11] Then
              iDigito := 1;

            Result := (iDigito = StrToInt(sCodBarras[5]));
          End;
      End;
  End;
End;

Function TCtrlRemessaEletronica._ValidaCodBarrasArrecadacao(sCodBarras: String): Boolean;
Var iBlocoDigitos: Array[1..48] Of integer;
  iSomatorio: Array[1..48] Of integer;
  i, p, peso, resto: integer;
  dv1, dv2, dv3, dv4: integer;
const sPesosDV1 = '432987654320432987654320432987654320432987654320';  //Everson Cunha - SIG84050
Begin
  resto := 0;
  dv1 := 0;
  dv2 := 0;
  dv3 := 0;
  dv4 := 0;
  result := false;

  For i := 1 To 48 Do
    iSomatorio[i] := 0;

  For i := 1 To 48 Do
    iBlocoDigitos[i] := 0;

  // varre a string e pega cada dÌgito do cÛdigo de barras
  p := 1;
  For i := 1 To length(sCodBarras) Do
    Begin
      If (sCodBarras[i] >= '0') And (sCodBarras[i] <= '9') Then
        Begin
          iBlocoDigitos[p] := strToInt(sCodBarras[i]);
          p := p + 1;
        End
    End;

  //if not iBlocoDigitos[3] in [8, 9, 6] then  //Everson Cunha - SIG84050
  if (iBlocoDigitos[3] <> 8) and (iBlocoDigitos[3] <> 9) then //C·ssio Rovaroto - SIG n∫ 99349
  begin
    peso := 2;

    For i := 1 To 48 Do
    Begin
      If Not (i In [12, 24, 36, 48]) Then // posiÁıes dos dÌgitos no array
      Begin
        iSomatorio[i] := (iBlocoDigitos[i] * peso);

        If iSomatorio[i] > 9 Then
          iSomatorio[i] := iSomatorio[i] - 9;

        If peso = 2 Then
          peso := 1
        Else
          peso := 2;
      End
      Else
        peso := 2;
    End;

    // c·lculo do dv1
    resto := 0;
    For i := 1 To 11 Do
      dv1 := dv1 + iSomatorio[i];

    If dv1 > 10 Then
      resto := dv1 Mod 10
    Else
      resto := dv1;

    If resto = 0 Then
      dv1 := 0
    Else
      dv1 := 10 - resto;

    // c·lculo do dv2
    resto := 0;
    For i := 13 To 23 Do
      dv2 := dv2 + iSomatorio[i];

    If dv2 > 10 Then
      resto := dv2 Mod 10
    Else
      resto := dv2;

    If resto = 0 Then
      dv2 := 0
    Else
      dv2 := 10 - resto;

    // c·lculo do dv3
    resto := 0;
    For i := 25 To 35 Do
      dv3 := dv3 + iSomatorio[i];

    If dv3 > 10 Then
      resto := dv3 Mod 10
    Else
      resto := dv3;

    If resto = 0 Then
      dv3 := 0
    Else
      dv3 := 10 - resto;

    // c·lculo do dv4
    resto := 0;
    For i := 37 To 47 Do
      dv4 := dv4 + iSomatorio[i];

    If dv4 > 10 Then
      resto := dv4 Mod 10
    Else
      resto := dv4;

    If resto = 0 Then
      dv4 := 0
    Else
      dv4 := 10 - resto;

    result := (dv1 = iBlocoDigitos[12]) And (dv2 = iBlocoDigitos[24]) And
              (dv3 = iBlocoDigitos[36]) And (dv4 = iBlocoDigitos[48]);
  end
  else
  begin
  //Everson Cunha - SIG84050 - InÌcio

    //c·lculo do primeiro dv
    dv1 := 0;
    for i := 1 to 11 do
      dv1 := dv1 + iBlocoDigitos[i] * strToInt(sPesosDV1[i]);

    dv1 := dv1 mod 11;

    //C·ssio Rovaroto - SIG n∫ 99381 - InÌcio
    if (dv1 = 0) or (dv1 = 1) then
      dv1 := 0
    else
      if (dv1 = 10) then
        dv1 := 1
      else
      begin
        dv1 := 11 - dv1;

        if dv1 = 1 then
          dv1 := 0;

        if dv1 = 10 then
          dv1 := 1;
      end;
    //C·ssio Rovaroto - SIG n∫ 99381 - Fim

    //c·lculo do segundo dv
    dv2 := 0;
    for i := 13 to 23 do
      dv2 := dv2 + iBlocoDigitos[i] * strToInt(sPesosDV1[i]);

    dv2 := dv2 mod 11;

    //C·ssio Rovaroto - SIG n∫ 99381 - InÌcio
    if (dv2 = 0) or (dv2 = 1) then
      dv2 := 0
    else
      if (dv2 = 10) then
        dv2 := 1
      else
      begin
        dv2 := 11 - dv2;

        if dv2 = 1 then
          dv2 := 0;

        if dv2 = 10 then
          dv2 := 1;
      end;
    //C·ssio Rovaroto - SIG n∫ 99381 - Fim
    //c·lculo do terceiro dv
    dv3 := 0;
    for i := 25 to 35 do
      dv3 := dv3 + iBlocoDigitos[i] * strToInt(sPesosDV1[i]);

    dv3 := dv3 mod 11;
    //C·ssio Rovaroto - SIG n∫ 99381 - InÌcio
    if (dv3 = 0) or (dv3 = 1) then
      dv3 := 0
    else
      if (dv3 = 10) then
        dv3 := 1
      else
      begin
        dv3 := 11 - dv3;

        if dv3 = 1 then
          dv3 := 0;

        if dv3 = 10 then
          dv3 := 1;
      end;
      //C·ssio Rovaroto - SIG n∫ 99381 - Fim
    //c·lculo do quarto dv
    dv4 := 0;
    for i := 37 to 47 do
      dv4 := dv4 + iBlocoDigitos[i] * strToInt(sPesosDV1[i]);

    dv4 := dv4 mod 11;
    //C·ssio Rovaroto - SIG n∫ 99381 - InÌcio
    if (dv4 = 0) or (dv4 = 1) then
      dv4 := 0
    else
      if (dv4 = 10) then
        dv4 := 1
      else
      begin
        dv4 := 11 - dv4;

        if dv4 = 1 then
          dv4 := 0;

        if dv4 = 10 then
          dv4 := 1;
      end;
    //C·ssio Rovaroto - SIG n∫ 99381 - Fim

    result := (dv1 = iBlocoDigitos[12]) And (dv2 = iBlocoDigitos[24]) And
              (dv3 = iBlocoDigitos[36]) And (dv4 = iBlocoDigitos[48]);

  //Everson Cunha - SIG84050 - Fim
  end;
End;

Function TCtrlRemessaEletronica._CriaArquivo(sArquivo: String): Boolean;
Begin
  //C·ssio Rovaroto - SIG n∫ 101591 - InÌcio
  //Result := False;
  Try
    //C·ssio Rovaroto - SIG n∫ 73883 - InÌcio
    //if (Sistema.IdModulo <> 18) then
    //begin
    //  if Impersonate then
    //begin
      //Everson Cunha - SIG84050 - InÌcio
    //  if not DirectoryExists(ExtractFileDir(sArquivo)) then
    //     ForceDirectories(ExtractFileDir(sArquivo));
      //Everson Cunha - SIG84050 - Fim

    //  AssignFile(ArquivoEnvioCEF, sArquivo);
    //  Rewrite(ArquivoEnvioCEF);
    //  CloseFile(ArquivoEnvioCEF);
    //  Result := True;
    //  RevertToSelf;
    //end;
    //end
    //else
    //begin
      AssignFile(ArquivoEnvioCEF, sArquivo);
      Rewrite(ArquivoEnvioCEF);
      CloseFile(ArquivoEnvioCEF);
      Result := True;
    //end;

    //C·ssio Rovaroto - SIG n∫ 73883 - Fim
  Except
    Result := False;
  End;
End;

Procedure TCtrlRemessaEletronica._GravaLinha(sArquivo, sLinha: String; pNumLote: string = '');
var
    sLinhaLote: string;
Begin
  If sLinha <> '' Then
    Begin
      //C·ssio Rovaroto - SIG n∫ 114764 - InÌcio
      if (pNumLote = EmptyStr) then
        sLinhaLote := sLinha
      else
      begin
        sLinhaLote := Copy(sLinha, 0, 3) + pNumLote  + Copy(sLinha, 8, Length(sLinha)- 7);
      end;
      //C·ssio Rovaroto - SIG n∫ 114764 - Fim
      //C·ssio Rovaroto - SIG n∫ 101591 - InÌcio
      //if (Sistema.IdModulo <> 18) then
      //begin
      //  if Impersonate then
      //  begin
      //    AssignFile(ArquivoEnvioCEF, sArquivo);
      //    Append(ArquivoEnvioCEF);
      //    Write(ArquivoEnvioCEF, sLinha);
      //    WriteLn(ArquivoEnvioCEF);
      //    CloseFile(ArquivoEnvioCEF);
      //    RevertToSelf;
      //  end;
      //end
      //else
      //begin
        AssignFile(ArquivoEnvioCEF, sArquivo);
        Append(ArquivoEnvioCEF);
        Write(ArquivoEnvioCEF, sLinhaLote); //C·ssio Rovaroto - SIG n∫ 114764
        WriteLn(ArquivoEnvioCEF);
        CloseFile(ArquivoEnvioCEF);
      //end;
      //C·ssio Rovaroto - SIG n∫ 73883 - Fim
    End;
End;

Function TCtrlRemessaEletronica._CompletaEspacoDir(sNome: String; iTam: integer): String;
Var i, k: integer;
  Espacos: String;
Begin
  If Length(sNome) > iTam Then
    sNome := Copy(sNome, 1, iTam);

  sNome := trim(sNome);
  i := length(sNome);
  Espacos := '';
  For k := 1 To (iTam - i) Do
    Espacos := Espacos + ' ';

  Result := sNome + Espacos;
End;

Function TCtrlRemessaEletronica._CompletaZeroEsq(sNome: String; iTam: integer): String;
Var i, k: integer;
Begin
  If Length(sNome) > iTam Then
    sNome := Copy(sNome, 1, iTam);

  sNome := trim(sNome);
  i := length(sNome);
  Result := '';
  For k := 1 To (iTam - i) Do
    Result := Result + '0';
  Result := Result + sNome;
End;

// ************************ Funcıes EncriptaÁ„o/DesencriptaÁ„o **********************
// PARA ENCRIPTAR
//
{$R-}{$Q-}
// Habilita/Desabilita a geraÁ„o de checagem de cÛdigo de Faixa e
// de checagem de cÛdigo exceÁ„o de overflow
//

Function TCtrlRemessaEletronica._EncryptSTR(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
Var I: Byte;
Begin
  Result := '';
  For I := 1 To Length(InString) Do
    Begin
      Result := Result + Char(Byte(InString[I]) Xor (StartKey Shr 8));
      StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
    End;
End;

// PARA DESENCRIPTAR
//

Function TCtrlRemessaEletronica._DecryptSTR(Const InString: String; StartKey, MultKey, AddKey: Integer): String;
Var I: Byte;
Begin
  Result := '';
  For I := 1 To Length(InString) Do
    Begin
      Result := Result + Char(Byte(InString[I]) Xor (StartKey Shr 8));
      StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
    End;
End;
{$R+}{$Q+}
// ************************ Funcıes EncriptaÁ„o/DesencriptaÁ„o **********************

Function TCtrlRemessaEletronica._CriptoDecripto(sAcao, sString: String): String;
Label Fim;
Var KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key: String;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
Begin
  If (sString = '') Then
    Result := ''
  Else
    Begin
      Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
      Dest := '';
      KeyLen := Length(Key);
      KeyPos := 0;
      SrcPos := 0;
      SrcAsc := 0;
      Range := 256;
      If (sAcao = UpperCase('C')) Then // Criptografa
        Begin
          Randomize;
          OffSet := Random(Range);
          Dest := Format('%1.2x', [OffSet]);
          For SrcPos := 1 To Length(sString) Do
            Begin
              Application.ProcessMessages;
              SrcAsc := (Ord(sString[SrcPos]) + OffSet) Mod 255;
              If KeyPos < KeyLen Then
                KeyPos := KeyPos + 1
              Else
                KeyPos := 1;
              SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
              Dest := Dest + Format('%1.2x', [SrcAsc]);
              OffSet := SrcAsc;
            End;
        End
      Else If (sAcao = UpperCase('D')) Then // Descriptografa
        Begin
          OffSet := StrToInt('$' + copy(sString, 1, 2));
          SrcPos := 3;
          Repeat
            SrcAsc := StrToInt('$' + copy(sString, SrcPos, 2));
            If (KeyPos < KeyLen) Then
              KeyPos := KeyPos + 1
            Else
              KeyPos := 1;
            TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
            If TmpSrcAsc <= OffSet Then
              TmpSrcAsc := 255 + TmpSrcAsc - OffSet
            Else
              TmpSrcAsc := TmpSrcAsc - OffSet;
            Dest := Dest + Chr(TmpSrcAsc);
            OffSet := SrcAsc;
            SrcPos := SrcPos + 2;
          Until (SrcPos >= Length(sString));
        End;
      Result := Dest;
    End;
End;

//////////////////////////////// FIM FUN«’ES B¡SICAS /////////////////////////////////

Function TCtrlRemessaEletronica._ListaConvenios: OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT PF.CODPORTFORMA, PF.DESCRICAO, PF.PATHARQUIVOREM, PF.NUMEMPRESABANCO ' +
    ', BA.NUMBANCO ' +     //C·ssio Rovaroto - SIG n∫ 115359
    'FROM PORTADORFORMA PF                       ' +
    //C·ssio Rovaroto - SIG n∫ 115359 - InÌcio
    'JOIN CM.PORTADORCONTA PC ON PC.CODPORTADOR = PF.CODPORTADOR ' +
    'JOIN CM.BANCO BA ON BA.IDPESSOA = PC.IDBANCO ' +
    //C·ssio Rovaroto - SIG n∫ 115359 - Fim
    'WHERE PF.RECPAG = ''P''                     ' +
    '      AND PF.FLGARQUIVO = ''S''             ' ;

    if (Sistema.IdModulo <> 3) then
    sSql := sSql + 'AND EXISTS( SELECT *          ' +
                   '       FROM   PORTFORMAXMODULO ' +
                   '       WHERE  IDMODULO = ' + inttostr(Sistema.IdModulo) +
                   '       AND    CODPORTFORMA = PF.CODPORTFORMA ) ';
  sSql := sSql + 'ORDER BY PF.DESCRICAO';

  Result := GetDataPacket(sSql);
End;

Function TCtrlRemessaEletronica._ListaFormaPagamentos: OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT 0 ORDEM, ''Todas as Formas de Pagamento'' AS DESCRICAO, -1 AS CODFORMA ' +
    'FROM DUAL                        ' +
    'UNION ALL                        ' +
    'SELECT 1 ORDEM, FO.DESCRICAO, FO.CODFORMA  ' +
    'FROM FORMARECPAG FO              ' +
    'WHERE FO.RECPAG = ''P''          ' +
    '      AND FO.FLGARQUIVO = ''S''  ' +
    'ORDER BY ORDEM, DESCRICAO        ';

  Result := GetDataPacket(sSql);
End;

Function TCtrlRemessaEletronica._ListaFormaPagamentosGeral: OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT FO.DESCRICAO, FO.CODFORMA ' +
          '       , FO.CODFORMABANCO        ' + //Everson Cunha - SIG84050
    'FROM FORMARECPAG FO                    ' +
    'WHERE FO.RECPAG = ''P''                ' +
    '      AND FO.FLGARQUIVO = ''S''        ' +
    'ORDER BY FO.DESCRICAO                  ';

  Result := GetDataPacket(sSql);
End;

Procedure TCtrlRemessaEletronica._GeraArquivoDeRemessa(pNomeCompletoArquivoRemessa, pIdArqPagto, pCodPortForma, pNSA: String);
Var sLinha, sTipFormaRecPag, sFormaLanc, sVlrTotalLote, sTipoServico, sTipoCompromisso, sFinalidadeDOC, sTemSegmentoW1, sID_FGTS: String;
  iQtdLotesArq, iQtdRegsArq, iSeqLote, iQtdRegsLote, iContador1, iContador2: Integer;
  dVlrTotalLote: Double;

  iQtdArquivosConvenio, i, iCountLinha: Integer;
  iQtdLinhasLote, iQtdRegistrosLote: Integer;
  iTotalBarra, iProcesso: Integer;
  //Everson Cunha - SIG84050 - InÌcio
  //Calcula ID_FGTS
  function DVfgts(valor: string): string;
  const sPesosDV1 = '76543298765432';
  const sPesosDV2 = '876543298765432';
  var Dv1, Dv2, i: integer;
  begin
    if (trim(valor) <> '') and (length(valor) < 14) then
      valor := stringOfChar('0', 14 - length(valor)) + valor;

    result := valor;

    //c·lculo do primeiro dv
    Dv1 := 0;
    for i := 1 to 14 do
      Dv1 := Dv1 + strToInt(valor[i]) * strToInt(sPesosDV1[i]);

    Dv1 := Dv1 mod 11;

    //C·ssio Rovaroto - SIG n∫ 120990
    if Dv1 in [0,1] then
      Dv1 := 0
    else
      Dv1 := 11 - Dv1;

    //o valor È acrescido do primeiro dv
    result := result + intToStr(Dv1);

    //c·lculo do segundo dv
    Dv2 := 0;
    for i := 1 to 15 do
      Dv2 := Dv2 + strToInt(result[i]) * strToInt(sPesosDV2[i]);

    Dv2 := Dv2 mod 11;

    if Dv2 in [0, 1] then
      Dv2 := 0
    //C·ssio Rovaroto - SIG n∫ 120990
    else
      Dv2 := 11 - Dv2;

    result := result + intToStr(Dv2);
  end;
  //Everson Cunha - SIG84050 - Fim

Begin
  iQtdLotesArq := 0;
  iQtdRegsArq := 0;
  iSeqLote := 0;
  iQtdRegsLote := 0;
  iContador1 := 0;
  iContador2 := 0;
  sVlrTotalLote := EmptyStr;
  sTipoServico := EmptyStr;
  sTipoCompromisso := EmptyStr;
  sFinalidadeDOC := EmptyStr;
  //
  // 1.0.Gerando Linha do CabeÁalho do Arquivo
  //
  cdsGeraCabecRodapeArq.data := _SelecionaDadosCabecArq(pCodPortForma, pNSA, pIdArqPagto);
  sLinha := cdsGeraCabecRodapeArq.fieldbyname('LINHACABECARQ').asString;
  _GravaLinha(pNomeCompletoArquivoRemessa, sLinha);
  //--------------------------------------------------------------------------

  // 2.0.Gerando Linhas do Movimento do Lote
  //
  // Selecionado o movimento pendente detalhado com distinct que vai gerar um lote
  cdsAux1.Data := _SelDistinctMovArqGeradoPendDet(pIdArqPagto);
  cdsAux1.First;
  while not cdsAux1.EOF do
  begin
    inc(iContador1);

    // Selecionando os lanÁamentos do Movimento de acordo com o elemento agrupador IDTIPOFORMARECPAG
    //inc(iSeqLote);
    sFormaLanc := cdsAux1.fieldbyname('FORMALANC').asString;
    sTipFormaRecPag := cdsAux1.fieldbyname('IDTIPOFORMARECPAG').asString;
    sFinalidadeDOC := rDadosParamConv.sFinalidadeDOC;

    // Tipos de Layout padr„o FEBRABAN
    if cdsAux1.fieldbyname('DS_ABREV').asString = 'A' then
    begin
      // Tipos de Layout padr„o FEBRABAN
      //cdsGeraMovLote.data := _SelMovPeloTipoDaFormaPagamento_LA(
      //        pIdArqPagto,
      //        sTipFormaRecPag,
      //        sFormaLanc,
      //        sFinalidadeDOC,
      //        IntToStr(iSeqLote))
      cdsGeraMovLote.Data := _SelMovPeloTipoDaFormaPagamento_LA_Linha_A (pIdArqPagto,
                                                                         sTipFormaRecPag,
                                                                         sFormaLanc,
                                                                         sFinalidadeDOC);
      if not cdsGeraMovLote.isempty then
        cdsGeraMovLoteDet.Data := _SelMovPeloTipoDaFormaPagamento_LA_Linha_B(pIdArqPagto,
                                                                             sTipFormaRecPag,
                                                                             sFormaLanc);
      sTipoServico := rDadosParamConv.sTipoServico;
      sTipoCompromisso := rDadosParamConv.sTipoCompromisso;
    end
    else
    begin
      if cdsAux1.fieldbyname('DS_ABREV').asString = 'J' Then
      begin
        //C·ssio Rovaroto - SIG n∫ 101461 - InÌcio
        cdsGeraMovLote.data := _SelMovPeloTipoDaFormaPagamento_LJ(pIdArqPagto,
                                                                  sTipFormaRecPag,
                                                                  sFormaLanc,
                                                                  IntToStr(iSeqLote));
        //cdsGeraMovLote.Data := _SelMovPeloTipoDaFormaPagamento_LJ_Linha_J(pIdArqPagto,
        //                                                                  sTipFormaRecPag,
        //                                                                  sFormaLanc,
        //                                                                  sFinalidadeDOC);

        //cdsGeraMovLoteDet.Data := _SelMovPeloTipoDaFormaPagamento_LJ_Linha_J52(pIdArqPagto,
        //                                                                     sTipFormaRecPag,
        //                                                                     sFormaLanc);
        //C·ssio Rovaroto - SIG n∫ 64071 - Fim
        //C·ssio Rovaroto - SIG n∫ 101461 - Fim
        sTipoServico := rDadosParamConv.sTipoServico;
        sTipoCompromisso := rDadosParamConv.sTipoCompromisso;
      end
      //Everson Cunha - SIG84050 - InÌcio
      //Segmento "K" foi substituÌdo pelo segmento "O"
      {
      Else
      If cdsAux1.fieldbyname('DS_ABREV').asString = 'K' Then
      Begin
        cdsGeraMovLote.data := _SelMovPeloTipoDaFormaPagamento_LK(
          pIdArqPagto,
          sTipFormaRecPag,
          inttostr(iSeqLote));
        sTipoServico := rDadosParamConv.sTipoServicoK;
        sTipoCompromisso := rDadosParamConv.sTipoCompromissoK;
      End }
      else
      if cdsAux1.fieldbyname('DS_ABREV').asString = 'O' then
      begin
        cdsGeraMovLote.data := _SelMovPeloTipoDaFormaPagamento_LO(pIdArqPagto,
                                                                  sTipFormaRecPag,
                                                                  sFormaLanc,
                                                                  IntToStr(iSeqLote));
        //C·ssio Rovaroto - SIG n∫ 99500 - InÌcio
        //sTipoServico := rDadosParamConv.sTipoServico;
        sTipoServico := rDadosParamConv.sTipoServicoK;
        //sTipoCompromisso := rDadosParamConv.sTipoCompromisso;
        sTipoCompromisso := rDadosParamConv.sTipoCompromissoK;
        //C·ssio Rovaroto - SIG n∫ 99500 - Fim

        //C·ssio Rovaroto - SIG n∫ 121375 - InÌcio
        {
        // Inclus„o do ID_FGTS para o Segmento "W1 - FGTS"
        if not cdsGeraMovLote.IsEmpty then
        begin
          cdsGeraMovLote.First;
          while not cdsGeraMovLote.Eof Do
          begin
            // Verificar se est· na linha W1
            sTemSegmentoW1 := '';
            sTemSegmentoW1 := Copy(cdsGeraMovLote.fieldbyname('LINHAMOVLOTE').asString, 14, 2);

            if sTemSegmentoW1 = 'W1' then
            begin
              sID_FGTS := Copy(cdsGeraMovLote.fieldbyname('LINHAMOVLOTE').asString, 0, 200);
              //C·ssio Rovaroto -  SIG n∫ 120604 - InÌcio
              //sID_FGTS := sID_FGTS + DVfgts(StringReplace(cdsGeraMovLote.fieldbyname('VALOR').asString, ',', '', [rfreplaceall]));
              sID_FGTS := sID_FGTS + DVfgts(StringReplace(cdsGeraMovLote.fieldbyname('VALOR_LANC').asString, ',', '', [rfreplaceall]));
              //C·ssio Rovaroto -  SIG n∫ 120604 - Fim
              sID_FGTS := sID_FGTS + Copy(cdsGeraMovLote.fieldbyname('LINHAMOVLOTE').asString, 217, 24);

              cdsGeraMovLote.edit;
              cdsGeraMovLote.fieldbyname('LINHAMOVLOTE').asString := sID_FGTS;
              //Zerar o valor da linha W1 para n„o duplicar o valor do LOTE (dVlrTotalLote)
              //C·ssio Rovaroto -  SIG n∫ 120604 - InÌcio
              //cdsGeraMovLote.fieldbyname('VALOR').asString := '0,00';
              cdsGeraMovLote.fieldbyname('VALOR_LANC').asString := '0,00';
              //C·ssio Rovaroto -  SIG n∫ 120604 - Fim
              cdsGeraMovLote.Post;
            end;

            cdsGeraMovLote.Next;
          end;
        end;  }
      end
      else
      if cdsAux1.fieldbyname('DS_ABREV').asString = 'N' then
      begin
        cdsGeraMovLote.data := _SelMovPeloTipoDaFormaPagamento_LN(
          pIdArqPagto,
          sTipFormaRecPag,
          sFormaLanc,
          inttostr(iSeqLote));

        //C·ssio Rovaroto - SIG n∫ 99579 - InÌcio
        //sTipoServico := rDadosParamConv.sTipoServico;
        sTipoServico := rDadosParamConv.sTipoServicoK;
        //sTipoCompromisso := rDadosParamConv.sTipoCompromisso;
        sTipoCompromisso := rDadosParamConv.sTipoCompromissoK;
        //C·ssio Rovaroto - SIG n∫ 99579 - Fim
      end;
      //Everson Cunha - SIG84050 - Fim
    end;

    if not cdsGeraMovLote.isEmpty then
    begin
      cdsGeraMovLote.IndexFieldNames :=  'LINHA'; //C·ssio Rovaroto - SIG n∫ 120661
      // 2.1.Gerando Linha do CabeÁalho do Lote
      dVlrTotalLote := 0.00;
      iCountLinha := 1;
      iQtdRegistrosLote := cdsGeraMovLote.RecordCount;
      iQtdLinhasLote:= CdsAux1.FieldByName('QTDLINHASLOTE').AsInteger;
      iQtdArquivosConvenio := Trunc(iQtdRegistrosLote / iQtdLinhasLote);

      if not cdsGeraMovLoteDet.IsEmpty then
          cdsGeraMovLoteDet.First;

      if (iQtdRegistrosLote mod iQtdLinhasLote) <> 0 then
         iQtdArquivosConvenio := iQtdArquivosConvenio + 1;

      iTotalBarra := cdsGeraMovLote.RecordCount;
      iProcesso := 0;
      for i := 1 to iQtdArquivosConvenio do
      begin
        cdsGeraMovLote.Filtered:= False;
        cdsGeraMovLote.Filter := 'LINHA >= ' + IntToStr(iCountLinha) + ' AND LINHA <=  ' + (IntToStr(iQtdLinhasLote * i) );
        cdsGeraMovLote.Filtered := True;

        iCountLinha := iCountLinha + (iQtdLinhasLote);

        Inc(iSeqLote);
        cdsGeraCabecRodapeLote.data := _SelecionaDadosCabecLote(pCodPortForma, IntToStr(iSeqLote), sFormaLanc, sTipoCompromisso, sTipoServico);
        sLinha := cdsGeraCabecRodapeLote.fieldbyname('LINHACABECLOTE').asString;
        _GravaLinha(pNomeCompletoArquivoRemessa, sLinha);

        frmProgressoDuplo.Caption := 'Processando a GeraÁ„o do Arquivo de Remessa';
        frmProgressoDuplo.MostraFormProgressoDuplo(pchar('Processando Lote : ' + cdsAux1.fieldbyname('DESCRICAO').asString), 'Gravando Linhas do Lote', 0, 0, cdsAux1.RecordCount, iTotalBarra, False, True);

        Screen.Cursor := crSQLWait;
        cdsGeraMovLote.First;

        iContador2:= 0;
        dVlrTotalLote:= 0;

        while not cdsGeraMovLote.EOF do
        begin
          // 2.2.Gravando a linha do lanÁamento
          if cdsAux1.FieldByName('DS_ABREV').asString = 'A' then
          begin
            Inc(iContador2);
            Inc(iProcesso);
            sLinha:= MontaLinhaA(IntToStr(iSeqLote), IntToStr(iContador2));
            sLinha:= StrPadRight(sLinha, 240, ' ');
            sLinha:= RemoveCaracterEspecial(sLinha, True);
            _GravaLinha(pNomeCompletoArquivoRemessa, sLinha);

            Inc(iContador2);
            sLinha:= MontaLinhaB(IntToStr(iSeqLote), IntToStr(iContador2));
            sLinha:= StrPadRight(sLinha, 240, ' ');
            sLinha:= RemoveCaracterEspecial(sLinha, True);
            _GravaLinha(pNomeCompletoArquivoRemessa, sLinha);
          end
          else
            //C·ssio Rovaroto - SIG n∫ 101461 - InÌcio
            //if cdsAux1.FieldByName('DS_ABREV').asString = 'J' then
            //begin
            //  Inc(iContador2);
            //  sLinha := MontaLinhaJ(IntToStr(iSeqLote), IntToStr(iContador2));
            //  sLinha := StrPadRight(sLinha, 240, ' ');
            //  sLinha := RemoveCaracterEspecial(sLinha, True);
            //  _GravaLinha(pNomeCompletoArquivoRemessa, sLinha);

            //  Inc(iContador2);
            //  sLinha := MontaLinhaJ52(IntToStr(iSeqLote), IntToStr(iContador2));
            //  sLinha := StrPadRight(sLinha, 240, ' ');
            //  sLinha := RemoveCaracterEspecial(sLinha, True);
            //  _GravaLinha(pNomeCompletoArquivoRemessa, sLinha);

             // Inc(iContador3);
            //end
            //else
            //C·ssio Rovaroto - SIG n∫ 101461 - Fim
            begin
              Inc(iContador2);
              sLinha := StrPadRight(cdsGeraMovLote.FieldByName('LINHAMOVLOTE').asString, 240, ' ');
              sLinha := RemoveCaracterEspecial(sLinha, True);
              _GravaLinha(pNomeCompletoArquivoRemessa, sLinha, _CompletaZeroEsq(IntToStr(iSeqLote), 4));
            end;

            //C·ssio Rovaroto - SIG n∫ 100510 - InÌcio
            //_GravaLinha(pNomeCompletoArquivoRemessa, RemoveCaracterEspecial(sLinha, True));
            //sLinha := RemoveCaracterEspecial(sLinha, True);
            //_GravaLinha(pNomeCompletoArquivoRemessa, sLinha);
            //C·ssio Rovaroto - SIG n∫ 100510 - Fim
            dVlrTotalLote := dVlrTotalLote + cdsGeraMovLote.fieldbyname('VALOR_LANC').asFloat;

            cdsGeraMovLote.Next;

            if not cdsGeraMovLoteDet.IsEmpty then
              cdsGeraMovLoteDet.Next;
            //C·ssio Rovaroto - SIG n∫ 64071 - Fim

          frmProgressoDuplo.AndaFormProgressoDuplo(iContador1, iProcesso);
        end;
        //
        // 2.3.Gerando Linha do RodapÈ do Lote
        //
        sVlrTotalLote := FormataValor(2, floattostr(dVlrTotalLote));
        iQtdRegsLote := (iContador2 + 2); // + 2 = Incluindo HEADER e TRAILLER do LOTE
        iQtdRegsArq := iQtdRegsArq + iQtdRegsLote;

        cdsGeraCabecRodapeLote.data := _SelecionaDadosRodapeLote(IntToStr(iSeqLote), IntToStr(iQtdRegsLote), sVlrTotalLote);
        sLinha := cdsGeraCabecRodapeLote.FieldByName('LINHARODAPELOTE').asString;
        _GravaLinha(pNomeCompletoArquivoRemessa, sLinha);
      end;
      cdsGeraMovLote.Filtered := false;
      cdsGeraMovLote.Filter:= '';


      Screen.Cursor := crDefault;
    end;
    //else
    //  dec(iSeqLote);

    cdsAux1.Next;
    // Limpando o CDS para receber novos dados, se for o caso
    cdsGeraMovLote.EmptyDataSet;

    if not cdsGeraMovLoteDet.IsEmpty then
      cdsGeraMovLoteDet.EmptyDataSet;
  end;
  frmProgressoDuplo.EscondeFormProgressoDuplo;

  //
  // 3.0.Gerando Linha do RodapÈ do Arquivo
  //
  iQtdLotesArq := iSeqLote;
  iQtdRegsArq := iQtdRegsArq + 2;
  cdsGeraCabecRodapeArq.data := _SelecionaDadosRodapeArq(IntToStr(iQtdLotesArq), IntToStr(iQtdRegsArq));
  sLinha := cdsGeraCabecRodapeArq.FieldByName('LINHARODAPEARQ').asString;
  _GravaLinha(pNomeCompletoArquivoRemessa, sLinha);
end;

// Todos os SQL¥s abaixo foram elaborados pelo Analista da FUNCEF/GETIF - Everson Cunha

Function TCtrlRemessaEletronica._CarregaParamConvenio(pCodPortForma: String; var sMsgErro: string): Boolean;
var sSql: String;
begin
  Result := True; //C·ssio Rovaroto  - SIG n∫ 114764
  sSql := 'SELECT P.CODPORTFORMA,                                            ' + #13#10 +
    '             B.NUMBANCO,                                                ' + #13#10 +
    '             NVL(PE.NOME, PE.RAZAOSOCIAL) NOME_BANCO,                   ' + #13#10 +
    '             NVL(P.VLR_OBRIGA_CPF_CNPJ, 0) VLR_OBRIGA_CPF_CNPJ,         ' + #13#10 +
    '             P.PARAM_TRANSMISSAO,                                       ' + #13#10 +
    '             P.AMBIENTE,                                                ' + #13#10 +
    '             P.VERSAO_LEIAUTE_ARQ,                                      ' + #13#10 +
    '             P.VERSAO_LEIAUTE_LOTE,                                     ' + #13#10 +
    '             P.DENSIDADE,                                               ' + #13#10 +
    '             P.TIPO_OPERACAO,                                           ' + #13#10 +
    '             P.COD_COMPROMISSO,                                         ' + #13#10 +
    '             P.TIPO_SERVICO,                                            ' + #13#10 +
    '             P.TIPO_SERVICO_K,                                          ' + #13#10 +
    '             P.TIPO_COMPROMISSO,                                        ' + #13#10 +
    '             P.TIPO_COMPROMISSO_K,                                      ' + #13#10 +
    '             P.FINALIDADE_DOC                                           ' + #13#10 +
    'FROM PORTFORMAXPARAMARQREM P                                            ' + #13#10 +
    'JOIN BANCO B ON B.IDPESSOA = P.IDBANCO_PAGADOR                          ' + #13#10 +
    'JOIN PESSOA PE ON PE.IDPESSOA = B.IDPESSOA                              ' + #13#10 +
    'WHERE P.CODPORTFORMA = ' + pCodPortForma;

  cdsConvenioParam.data := GetDataPacket(sSql);
  Result := (Not cdsConvenioParam.isEmpty);
  if Result then
  begin
    rDadosParamConv.sNumBanco := cdsConvenioParam.fieldbyname('NUMBANCO').asstring;
    rDadosParamConv.sNomeBanco := cdsConvenioParam.fieldbyname('NOME_BANCO').asstring;
    rDadosParamConv.dVlrObrigaCpfCnpj := cdsConvenioParam.fieldbyname('VLR_OBRIGA_CPF_CNPJ').asFloat;
    rDadosParamConv.sParamTrans := cdsConvenioParam.fieldbyname('PARAM_TRANSMISSAO').asstring;
    rDadosParamConv.sAmbiente := cdsConvenioParam.fieldbyname('AMBIENTE').asstring;
    rDadosParamConv.sVerLeiauteArq := cdsConvenioParam.fieldbyname('VERSAO_LEIAUTE_ARQ').asstring;
    rDadosParamConv.sVerLeiauteLote := cdsConvenioParam.fieldbyname('VERSAO_LEIAUTE_LOTE').asstring;
    rDadosParamConv.sDensidade := cdsConvenioParam.fieldbyname('DENSIDADE').asstring;
    rDadosParamConv.sTipoOper := cdsConvenioParam.fieldbyname('TIPO_OPERACAO').asstring;
    rDadosParamConv.sCodCompromisso := cdsConvenioParam.fieldbyname('COD_COMPROMISSO').asstring;
    rDadosParamConv.sTipoServico := cdsConvenioParam.fieldbyname('TIPO_SERVICO').asstring;
    rDadosParamConv.sTipoServicoK := cdsConvenioParam.fieldbyname('TIPO_SERVICO_K').asstring;
    rDadosParamConv.sTipoCompromisso := cdsConvenioParam.fieldbyname('TIPO_COMPROMISSO').asstring;
    rDadosParamConv.sTipoCompromissoK := cdsConvenioParam.fieldbyname('TIPO_COMPROMISSO_K').asstring;
    rDadosParamConv.sFinalidadeDOC := cdsConvenioParam.fieldbyname('FINALIDADE_DOC').asstring;

    //C·ssio Rovaroto - SIG n∫ 114764 - InÌcio
    if (rDadosParamConv.sNumBanco = EmptyStr) then
    begin
      sMsgErro := 'N„o foi definido o n˙mero do banco.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.sNomeBanco = EmptyStr)then
    begin
      sMsgErro := 'Nome do banco n„o foi definido.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.dVlrObrigaCpfCnpj = 0.00)then
    begin
      sMsgErro := 'N„o foi definido o valor de obrigatoriedade de CPF/CNPJ.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.sDensidade = EmptyStr)then
    begin
      sMsgErro := 'N„o foi definida a densidade de arquivo.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.sVerLeiauteArq = EmptyStr) then
    begin
      sMsgErro := 'N„o foi definido vers„o do leiaute do arquivo.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.sVerLeiauteLote = EmptyStr) then
    begin
      sMsgErro := 'N„o foi definido vers„o do leiaute do lote.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.sTipoOper = EmptyStr) then
    begin
      sMsgErro := 'N„o foi definido o tipo de operaÁ„o.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.sCodCompromisso = EmptyStr) then
    begin
      sMsgErro := 'N„o foi definido cÛdigo do compromisso.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.sTipoServico = EmptyStr) then
    begin
      sMsgErro := 'N„o foi definido o tipo do serviÁo.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.sTipoServicoK = EmptyStr) then
    begin
      sMsgErro := 'N„o foi definido o tipo de serviÁo para tributos.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.sFinalidadeDOC = EmptyStr)then
    begin
      sMsgErro := 'N„o foi definida a finalidade para DOC.';
      Result := False;
      Exit;
    end;

    if (rDadosParamConv.sNumBanco <> '001') then
    begin
      if (rDadosParamConv.sParamTrans = EmptyStr) then
      begin
        sMsgErro := 'N„o foi definido o par‚metro de transmiss„o.';
        Result := False;
        Exit;
      end;

      if (rDadosParamConv.sAmbiente = EmptyStr) then
      begin
        sMsgErro := 'N„o foi definido o tipo de ambeinte de transmiss„o.';
        Result := False;
        Exit;
      end;

      if (rDadosParamConv.sTipoCompromisso = EmptyStr) then
      begin
        sMsgErro := 'N„o foi definido tipo de compromisso.';
        Result := False;
        Exit;
      end;

      if (rDadosParamConv.sTipoCompromissoK = EmptyStr) then
      begin
        sMsgErro := 'N„o foi definido tipo de compromisso  para tributos.';
        Result := False;
        Exit;
      end;
    end;
  end
  else
  begin
    sMsgErro := 'N„o h· parametrizaÁ„o definida.';
    Result := False;
    Exit;
  end;
  {  Result := ((rDadosParamConv.sNumBanco <> EmptyStr) And
               (rDadosParamConv.sNomeBanco <> EmptyStr) And
               (rDadosParamConv.dVlrObrigaCpfCnpj <> 0.00) And
               (rDadosParamConv.sParamTrans <> EmptyStr) And
               (rDadosParamConv.sAmbiente <> EmptyStr) And
               (rDadosParamConv.sVerLeiauteArq <> EmptyStr) And
               (rDadosParamConv.sVerLeiauteLote <> EmptyStr) And
               (rDadosParamConv.sDensidade <> EmptyStr) And
               (rDadosParamConv.sTipoOper <> EmptyStr) And
               (rDadosParamConv.sCodCompromisso <> EmptyStr) And
               (rDadosParamConv.sTipoServico <> EmptyStr) And
               (rDadosParamConv.sTipoServicoK <> EmptyStr) And
               (rDadosParamConv.sTipoCompromisso <> EmptyStr) And
               (rDadosParamConv.sTipoCompromissoK <> EmptyStr) And
               (rDadosParamConv.sFinalidadeDOC <> EmptyStr));
  end;}
  //C·ssio Rovaroto - SIG n∫ 114764 - Fim
End;

Function TCtrlRemessaEletronica._SelecionaMovimentoRemessa(
  pConvenio,
  pFormaPagto: String;
  pDataIni,
  pDataFim: TDateTime;
  pIdModulo: Integer): OleVariant;
Var sSql: String;
    sTabelaRubrica: string;
Begin
  case pIdModulo of
    3: sSql := GetMovimentoRemessaCap(pConvenio, pFormaPagto, pDataIni, pDataFim); //C·ssio Rovaroto - SIG n∫ 60540
   18: sSql := GetMovimentoRemessaFB(pConvenio, pFormaPagto, pDataIni, pDataFim); //C·ssio Rovaroto - SIG n∫ 60540
   15: sSql := GetMovimentoRemessaEmp(pConvenio, pFormaPagto, pDataIni, pDataFim); //C·ssio Rovaroto - SIG n∫ 64071
   //21: sSql := GetMovimentoRemessaFP(pConvenio, pFormaPagto, pDataIni, pDataFim);
  end;
  //C·ssio Rovaroto - SIG n∫ 60540 - InÌcio
  (*sSql := 'SELECT ''S'' MARCADO, ' + #13#10 +
    '       D.CODDOCUMENTO,                                                                        ' + #13#10 +
    '       D.IDMODULO,                                                                            ' + #13#10 + //Everson Cunha - SIG84050
    '       D.CODFORMA,                                                                            ' + #13#10 +
    '       D.CODPORTFORMA,                                                                        ' + #13#10 +
    '       D.NUMAPGR NUM_AP,                                                                      ' + #13#10 +
    '       D.NODOCUMENTO NUM_DOC,                                                                 ' + #13#10 +
    '       P.IDPESSOA IDFORCLI,                                                                   ' + #13#10 + //Everson Cunha - SIG84050
//    '       REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'') NUMDOCUMENTO,                                   ' + #13#10 + //Everson Luiz - SIG TIBERO
    '       trim(P.NUMDOCUMENTO) NUMDOCUMENTO,                                   ' + #13#10 +                     //Everson Luiz - SIG TIBERO
    '       CAST(                                                                                  ' + #13#10 +
    '       CASE LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''))                                    ' + #13#10 +
    '           WHEN 11 THEN                                                                       ' + #13#10 +
    '             regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'')  ' + #13#10 +
    '           WHEN 14 THEN                                                                       ' + #13#10 +
    '             regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'')  ' + #13#10 +
    '           ELSE                                                                               ' + #13#10 +
    '             REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')                                           ' + #13#10 +
    '       END AS VARCHAR2(20)) CPF_CNPJ_MASC,                                                    ' + #13#10 +
    '       TRIM(P.RAZAOSOCIAL) RAZAOSOCIAL,                                                       ' + #13#10 +
    '       (SELECT SUM(DECODE(LANC.DEBCRE, ''D'',                                                 ' + #13#10 +
    '               DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1),                        ' + #13#10 +
    '               DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR              ' + #13#10 +
    '        FROM LANCTODOCUM LANC                                                                 ' + #13#10 +
    '        JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO                            ' + #13#10 +
    '        WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO) VALOR,                                      ' + #13#10 +
    '       PO.DESCRICAO AS NOME_CONVENIO,                                                         ' + #13#10 +
    '       D.DATAPROGRAMADA,                                                                      ' + #13#10 +
    '       D.DATAVENCTO,                                                                          ' + #13#10 +  //Everson Cunha - SIG84050    
    '       HFB.IDHSTFOLHABENEF,                                                                   ' + #13#10 +
    '       HFB.HISTORICO AS VERSAO_FOLHA,                                                         ' + #13#10 +
    '       FO.DESCRICAO FORMA_PAGTO,                                                              ' + #13#10 +
    '       FO.FLGPERMITELISTAFAVORECIDO,                                                          ' + #13#10 +
    '       FO.FLGPERMITETITULOSPAGTO,                                                             ' + #13#10 +
    '       CAST(RPAD('' '', 250, '' '') AS VARCHAR2(250)) AS MSGERRO                              ' + #13#10 +
    'FROM DOCUMENTO D                                                                              ' + #13#10 +
    'JOIN PESSOA P ON P.IDPESSOA = D.IDFORCLI                                                      ' + #13#10 +
    'JOIN LANCTODOCUM L ON L.CODDOCUMENTO = D.CODDOCUMENTO AND L.OPERACAO = 2                      ' + #13#10 +
    'LEFT JOIN FORMARECPAG FO ON FO.CODFORMA = D.CODFORMA AND FO.FLGARQUIVO = ''S''                ' + #13#10 + // 'S' = Formas que geram arquivo de remessa
    'JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA                                       ' + #13#10 +
    'JOIN HSTFOLHABENEFCAP HFC ON HFC.CODDOCUMENTO = D.CODDOCUMENTO                                ' + #13#10 +
    'JOIN HSTFOLHABENEF HFB ON HFB.IDHSTFOLHABENEF = HFC.IDHSTFOLHABENEF                           ' + #13#10 +
    'WHERE D.RECPAG = ''P''                                                                        ' + #13#10 +
    'AND D.STATUS NOT IN (1, 2)                                                              ' + #13#10 +
    'AND NOT EXISTS (SELECT 1                                                                ' + #13#10 +
    '                  FROM ARQUIVOPAGTO AP                                                    ' + #13#10 +
    '                  JOIN ARQUIVOXDOCUM AXD ON AXD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO        ' + #13#10 +
    '                  LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 2      ' + #13#10 +
    '                  LEFT JOIN DOCUMENTOXCODBARRAS DC ON DC.IDDOCUMENTOXCODBARRAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 3  ' + #13#10 +
    '                 WHERE AP.FLGENVIADO <> ''C''                                            ' + #13#10 + // Cancelado
    '                   AND DECODE(AXD.TIPO, 1, AXD.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DC.CODDOCUMENTO) = D.CODDOCUMENTO)  ' + #13#10;

  If pConvenio <> '' Then
    sSql := sSql + '      AND D.CODPORTFORMA = ' + quotedstr(pConvenio) + #13#10;

  If pFormaPagto <> '-1' Then
    sSql := sSql + '   AND D.CODFORMA = ' + quotedstr(pFormaPagto) + #13#10;

  sSql := sSql + '   AND ((D.DATAPROGRAMADA >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''))   ' + #13#10 +
    '   AND (D.DATAPROGRAMADA <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY'')))                ' + #13#10;

  sSql := sSql + 'ORDER BY D.DATAPROGRAMADA, FO.DESCRICAO, P.RAZAOSOCIAL, D.NODOCUMENTO     '; *)

  Result := GetDataPacket(sSql);
  //sqlText.Clear;
  //sqlText.add(sSql);
  //sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovRemessa.txt');
  //Result := GetDataPacket(sSql);
  //C·ssio Rovaroto - SIG n∫ 60540 - Fim
End;

Function TCtrlRemessaEletronica._SelDistinctMovArqGeradoPendDet(pIdArqPagto: String): Olevariant;
Var sSql: String;
Begin
  //C·ssio Rovaroto - SIG n∫ 101591 - InÌcio
  //sSql := 'SELECT DISTINCT FXF.IDTIPOFORMARECPAG, T.DESCRICAO, LE.DS_ABREV, T.FORMALANC, AR.TIPO          ' + #13#10 +
  //  ', AR.TIPO, PF.QTDLINHASLOTE                                                                          ' + #13#10 +
  sSql := 'SELECT DISTINCT FXF.IDTIPOFORMARECPAG, T.DESCRICAO, LE.DS_ABREV, T.FORMALANC, PF.QTDLINHASLOTE ' + #13#10 +
  //C·ssio Rovaroto - SIG n∫ 101591 - Fim
    'FROM ARQUIVOXDOCUM AR                                                                                ' + #13#10 +
    'JOIN FORMARECPAGXTIPOFORMARECPAG FXF ON FXF.CODFORMA = AR.CODFORMA                                   ' + #13#10 +
    'JOIN TIPOFORMARECPAG T ON T.IDTIPOFORMARECPAG = FXF.IDTIPOFORMARECPAG AND T.FLGATIVO = ''S''         ' + #13#10 +
    'JOIN LEIAUTE_ARQXTIPOFORMARECPAG LXT ON LXT.IDTIPOFORMARECPAG = FXF.IDTIPOFORMARECPAG                ' + #13#10 +
    'JOIN LEIAUTE_ARQ LE ON LE.IDLEIAUTE = LXT.IDLEIAUTE AND LE.FLGTIPO = ''O'' AND LE.FLGATIVO = ''S''   ' + #13#10 +
    'JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AR.IDARQUIVOPAGTO                                        ' + #13#10 +
    'JOIN PORTADORFORMA PF ON PF.CODPORTFORMA = AP.CODPORTFORMA                                           ' + #13#10 +
    'WHERE AR.IDARQUIVOPAGTO = ' + pIdArqPagto                                                              + #13#10 +
    'ORDER BY LE.DS_ABREV, T.FORMALANC                                                                    ';
  Result := GetDataPacket(sSql);
End;

// Paulo Nobre - WO33342 - Inicio
{
Function TCtrlRemessaEletronica._SelecionaMovArquivo(pConvenio, pFlgEnviado: String; pPagtoExcepcional: Integer): OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT AP.IDARQUIVOPAGTO,                                                                                       ' + #13#10 +
    '       AP.CODPORTFORMA,                                                                                               ' + #13#10 +
    '       CAST(LPAD(AP.NSA, 6, ''0'')  AS VARCHAR2(6))  AS NSA,                                                          ' + #13#10 + //MIGRACAO-ORACLE LEANDRO
    '       AP.VLRTOTAL,                                                                                                   ' + #13#10 +
    '       AP.TRGDTINCLUSAO DT_PREPARO,                                                                                   ' + #13#10 +
    '       DECODE(TRIM(U.NOMEUSUARIO), ''CM'', AP.TRGUSERINCLUSAO, U.NOMEUSUARIO) USU_PREPARO,                            ' + #13#10 +
    '       AP.DTGERACAOARQTXT,                                                                                            ' + #13#10 +
    '       AP.USUGERACAOARQTXT,                                                                                           ' + #13#10 +
    '       AP.NOMEARQTXT,                                                                                                 ' + #13#10 +
    '       AP.DTFINALIZAARQTXT,                                                                                           ' + #13#10 +
    '       AP.USUFINALIZAARQTXT,                                                                                          ' + #13#10 +
    '       AP.DTCANCELAARQTXT,                                                                                            ' + #13#10 +
    '       AP.USUCANCELAARQTXT,                                                                                           ' + #13#10 +
    '       P.DESCRICAO AS NOME_CONVENIO,                                                                                  ' + #13#10 +
    '       AP.FLGENVIADO,                                                                                                 ' + #13#10 +
    '       P.PATHARQUIVOREM,                                                                                              ' + #13#10 +
    '       P.PATHARQUIVORET,                                                                                              ' + #13#10 +
    '       P.PATHARQUIVOSEGURANCA,                                                                                        ' + #13#10 +
    '       P.PATHARQUIVOBACKUP,                                                                                           ' + #13#10 +
    '       DECODE((SELECT DISTINCT DECODE(AR.TIPO, 1, D1.STATUS, 2, D2.STATUS, 3, D3.STATUS, 4, D4.STATUS) STATUS         ' + #13#10 +
    '               FROM ARQUIVOXDOCUM AR                                                                                  ' + #13#10 +
    '               LEFT JOIN (SELECT DI1.CODDOCUMENTO, DI1.STATUS                                                         ' + #13#10 +
    '                          FROM DOCUMENTO DI1) D1 ON D1.CODDOCUMENTO = AR.ID_DOC_CODBARRAS_PESSOAS AND AR.TIPO = 1     ' + #13#10 +
    '               LEFT JOIN (SELECT DP.IDDOCUMENTOXPESSOAS, DI2.STATUS                                                   ' + #13#10 +
    '                          FROM DOCUMENTO DI2                                                                          ' + #13#10 +
    '                          JOIN DOCUMENTOXPESSOAS DP ON DP.CODDOCUMENTO = DI2.CODDOCUMENTO                             ' + #13#10 +
    '                          ) D2 ON D2.IDDOCUMENTOXPESSOAS = AR.ID_DOC_CODBARRAS_PESSOAS AND AR.TIPO = 2                ' + #13#10 +
    '               LEFT JOIN (SELECT DC.IDDOCUMENTOXCODBARRAS, DI3.STATUS, DC.CODDOCUMENTO                                ' + #13#10 +
    '                          FROM DOCUMENTO DI3                                                                          ' + #13#10 +
    '                          JOIN DOCUMENTOXCODBARRAS DC ON DC.CODDOCUMENTO = DI3.CODDOCUMENTO                           ' + #13#10 +
    '                          ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AR.ID_DOC_CODBARRAS_PESSOAS AND AR.TIPO = 3              ' + #13#10 +
    '               LEFT JOIN (SELECT DI4.CODGRUPOCNAB, DI4.STATUS                                                         ' + #13#10 +
    '                            FROM DOCUMENTO DI4                                                                        ' + #13#10 +
    '                        GROUP BY DI4.CODGRUPOCNAB, DI4.STATUS) D4 ON D4.CODGRUPOCNAB = AR.ID_DOC_CODBARRAS_PESSOAS AND AR.TIPO = 4 ' + #13#10 +
    '               WHERE DECODE(AR.TIPO, 1, D1.STATUS, 2, D2.STATUS, 3, D3.STATUS, 4, D4.STATUS) = 2                      ' + #13#10 +
    '                     AND AR.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO), 2, ''Baixado'', ''Aberto'') STATUS                   ' + #13#10 +
    'FROM ARQUIVOPAGTO AP                                                                                                  ' + #13#10 +
    'JOIN USUARIOSISTEMA U ON U.IDUSUARIO = NVL(REGEXP_REPLACE(AP.TRGUSERINCLUSAO, ''\D''), 2)                             ' + #13#10 +
    'JOIN PORTADORFORMA P ON P.CODPORTFORMA = AP.CODPORTFORMA                                                              ' + #13#10 +
    'WHERE AP.FLGENVIADO = ' + quotedstr(pFlgEnviado) + #13#10 +
    '      AND AP.CODPORTFORMA = ' + quotedstr(pConvenio) + #13#10 ;
    if (Sistema.IdModulo = 18) and (pPagtoExcepcional <> 0) then
      sSql := sSql + '  AND EXISTS (SELECT 1                                                                               ' + #13#10 +
                     '                    FROM CM.DOCUMENTOXPESSOAS DP                                                     ' + #13#10 +
                     '                    JOIN CM.PROCCONVENIODOC PD                                                       ' + #13#10 +
                     '                      ON PD.CODDOCUMENTO = DP.CODDOCUMENTO                                           ' + #13#10 +
                     '                    JOIN CM.ARQUIVOXDOCUM AD                                                         ' + #13#10 +
                     '                      ON AD.ID_DOC_CODBARRAS_PESSOAS = DP.IDDOCUMENTOXPESSOAS                        ' + #13#10 +
                     '                     AND AD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO)                                      ' + #13#10 ;
    sSql := sSql +
    'ORDER BY AP.IDARQUIVOPAGTO DESC                                                                                       ' + #13#10;

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovArquivo_' + pFlgEnviado + '.txt');
End;    }

Function TCtrlRemessaEletronica._SelecionaMovArquivo(pConvenio, pFlgEnviado: String; pPagtoExcepcional: Integer): OleVariant;
Var sSql: String;
Begin
   sSql := 'WITH APF AS (                                                                               ' + #13#10 +
   'SELECT /*+ MATERIALIZE */                                                                           ' + #13#10 +
   '       AP.IDARQUIVOPAGTO,                                                                           ' + #13#10 +
   '       AP.CODPORTFORMA,                                                                             ' + #13#10 +
   '       AP.NSA,                                                                                      ' + #13#10 +
   '       AP.VLRTOTAL,                                                                                 ' + #13#10 +
   '       AP.TRGDTINCLUSAO,                                                                            ' + #13#10 +
   '       AP.TRGUSERINCLUSAO,                                                                          ' + #13#10 +
   '       AP.DTGERACAOARQTXT,                                                                          ' + #13#10 +
   '       AP.USUGERACAOARQTXT,                                                                         ' + #13#10 +
   '       AP.NOMEARQTXT,                                                                               ' + #13#10 +
   '       AP.DTFINALIZAARQTXT,                                                                         ' + #13#10 +
   '       AP.USUFINALIZAARQTXT,                                                                        ' + #13#10 +
   '       AP.DTCANCELAARQTXT,                                                                          ' + #13#10 +
   '       AP.USUCANCELAARQTXT,                                                                         ' + #13#10 +
   '       AP.FLGENVIADO                                                                                ' + #13#10 +
   'FROM ARQUIVOPAGTO AP                                                                                ' + #13#10 +
   'WHERE AP.FLGENVIADO = ' + quotedstr(pFlgEnviado)                                                      + #13#10 +
   '      AND AP.CODPORTFORMA = ' + quotedstr(pConvenio)                                                  + #13#10 ;
   if (Sistema.IdModulo = 18) and (pPagtoExcepcional <> 0) then
     sSql := sSql + '      AND EXISTS (SELECT 1                                                                         ' + #13#10 +
                    '                  FROM CM.DOCUMENTOXPESSOAS DP                                                     ' + #13#10 +
                    '                  JOIN CM.PROCCONVENIODOC PD ON PD.CODDOCUMENTO = DP.CODDOCUMENTO                  ' + #13#10 +
                    '                  JOIN CM.ARQUIVOXDOCUM AD ON AD.ID_DOC_CODBARRAS_PESSOAS = DP.IDDOCUMENTOXPESSOAS ' + #13#10 +
                    '                                             AND AD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO)            ' + #13#10;
   sSql := sSql + '),                                                                                                   ' + #13#10 +

   'AP_USER AS (                                                                                          ' + #13#10 +
   '  SELECT /*+ MATERIALIZE */                                                                           ' + #13#10 +
   '         A.*,                                                                                         ' + #13#10 +
   '         REGEXP_REPLACE(A.TRGUSERINCLUSAO, ''\D'', '''') AS USER_ID_CLEAN                             ' + #13#10 +
   '  FROM APF A                                                                                          ' + #13#10 +
   '),                                                                                                    ' + #13#10 +

   'BAIXADO AS (                                                                                          ' + #13#10 +
   '  -- TIPO = 1: via DOCUMENTO                                                                          ' + #13#10 +
   '  SELECT /*+ MATERIALIZE */ DISTINCT AR.IDARQUIVOPAGTO                                                ' + #13#10 +
   '  FROM ARQUIVOXDOCUM AR                                                                               ' + #13#10 +
   '  JOIN DOCUMENTO D1 ON AR.TIPO = 1 AND D1.CODDOCUMENTO = AR.ID_DOC_CODBARRAS_PESSOAS AND D1.STATUS = 2  ' + #13#10 +

   '  UNION                                                                                               ' + #13#10 +
   '  -- TIPO = 2: via DOCUMENTOXPESSOAS -> DOCUMENTO                                                     ' + #13#10 +
   '  SELECT DISTINCT AR.IDARQUIVOPAGTO                                                                   ' + #13#10 +
   '  FROM ARQUIVOXDOCUM AR                                                                               ' + #13#10 +
   '  JOIN DOCUMENTOXPESSOAS DP ON AR.TIPO = 2 AND DP.IDDOCUMENTOXPESSOAS = AR.ID_DOC_CODBARRAS_PESSOAS   ' + #13#10 +
   '  JOIN DOCUMENTO D2 ON D2.CODDOCUMENTO = DP.CODDOCUMENTO AND D2.STATUS = 2                            ' + #13#10 +

   '  UNION                                                                                               ' + #13#10 +
   '  -- TIPO = 3: via DOCUMENTOXCODBARRAS -> DOCUMENTO                                                   ' + #13#10 +
   '  SELECT DISTINCT AR.IDARQUIVOPAGTO                                                                   ' + #13#10 +
   '  FROM ARQUIVOXDOCUM AR                                                                               ' + #13#10 +
   '  JOIN DOCUMENTOXCODBARRAS DC ON AR.TIPO = 3 AND DC.IDDOCUMENTOXCODBARRAS = AR.ID_DOC_CODBARRAS_PESSOAS  ' + #13#10 +
   '  JOIN DOCUMENTO D3 ON D3.CODDOCUMENTO = DC.CODDOCUMENTO AND D3.STATUS = 2                            ' + #13#10 +

   '  UNION                                                                                               ' + #13#10 +
   '  -- TIPO = 4: via grupo CNAB (DOCUMENTO.CODGRUPOCNAB)                                                ' + #13#10 +
   '  SELECT DISTINCT AR.IDARQUIVOPAGTO                                                                   ' + #13#10 +
   '  FROM ARQUIVOXDOCUM AR                                                                               ' + #13#10 +
   '  JOIN DOCUMENTO D4 ON AR.TIPO = 4 AND D4.CODGRUPOCNAB = AR.ID_DOC_CODBARRAS_PESSOAS AND D4.STATUS = 2  ' + #13#10 +
   ')                                                                                                     ' + #13#10 +

   'SELECT                                                                                                ' + #13#10 +
   '       AP.IDARQUIVOPAGTO,                                                                             ' + #13#10 +
   '       AP.CODPORTFORMA,                                                                               ' + #13#10 +
   '       CAST(LPAD(AP.NSA, 6, ''0'') AS VARCHAR2(6)) AS NSA,                                            ' + #13#10 +
   '       AP.VLRTOTAL,                                                                                   ' + #13#10 +
   '       AP.TRGDTINCLUSAO AS DT_PREPARO,                                                                ' + #13#10 +
   '       CASE WHEN TRIM(U.NOMEUSUARIO) = ''CM'' THEN AP.TRGUSERINCLUSAO ELSE U.NOMEUSUARIO END AS USU_PREPARO,  ' + #13#10 +
   '       AP.DTGERACAOARQTXT,                                                                            ' + #13#10 +
   '       AP.USUGERACAOARQTXT,                                                                           ' + #13#10 +
   '       AP.NOMEARQTXT,                                                                                 ' + #13#10 +
   '       AP.DTFINALIZAARQTXT,                                                                           ' + #13#10 +
   '       AP.USUFINALIZAARQTXT,                                                                          ' + #13#10 +
   '       AP.DTCANCELAARQTXT,                                                                            ' + #13#10 +
   '       AP.USUCANCELAARQTXT,                                                                           ' + #13#10 +
   '       P.DESCRICAO AS NOME_CONVENIO,                                                                  ' + #13#10 +
   '       AP.FLGENVIADO,                                                                                 ' + #13#10 +
   '       P.PATHARQUIVOREM,                                                                              ' + #13#10 +
   '       P.PATHARQUIVORET,                                                                              ' + #13#10 +
   '       P.PATHARQUIVOSEGURANCA,                                                                        ' + #13#10 +
   '       P.PATHARQUIVOBACKUP,                                                                           ' + #13#10 +
   '       CASE WHEN B.IDARQUIVOPAGTO IS NOT NULL THEN ''Baixado'' ELSE ''Aberto'' END AS STATUS          ' + #13#10 +
   'FROM AP_USER AP                                                                                       ' + #13#10 +
   'JOIN PORTADORFORMA P ON P.CODPORTFORMA = AP.CODPORTFORMA                                              ' + #13#10 +
   'JOIN USUARIOSISTEMA U ON U.IDUSUARIO = TO_NUMBER(NVL(NULLIF(AP.USER_ID_CLEAN, ''''), ''2''))          ' + #13#10 +
   'LEFT JOIN BAIXADO B ON B.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                                           ' + #13#10 +
   'ORDER BY AP.IDARQUIVOPAGTO DESC                                                                       ' + #13#10;

   Result := GetDataPacket(sSql);
   sqlText.Clear;
   sqlText.add(sSql);
   sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovArquivo_' + pFlgEnviado + '.txt');
End;
// Paulo Nobre - WO33342 - Fim   

Function TCtrlRemessaEletronica._SelecionaMovArqDetalhe: String;
Begin
  //Everson Cunha - SIG117206 - Ini
  //Comentei o select pra poder incluir o tipo 4 em todas as linhas
  (*Result := 'SELECT DECODE(AX.TIPO, 1, D1.NUMAPGR, 2, D2.NUMAPGR, 3, D3.NUMAPGR) NUM_AP,                                     ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.NODOCUMENTO, 2, D2.NODOCUMENTO, 3, D3.NODOCUMENTO) NODOCUMENTO,                            ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 99579 - InÌcio
    //'       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 2, D2.DATAPROGRAMADA, 3, D3.DTPAGTO) DATAPROGRAMADA,                       ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 2, D2.DATAPROGRAMADA, 3, D3.DATAPROGRAMADA) DATAPROGRAMADA,                       ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 99579 - Fim
    '       AX.VALOR,                                                                                                        ' + #13#10 +
    '       CAST(                                                                                                            ' + #13#10 +
    '       CASE LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO), ''\D'')) ' + #13#10 +
    '         WHEN 11 THEN ' + #13#10 +
    '           regexp_replace(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO), ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'') ' + #13#10 +
    '         WHEN 14 THEN ' + #13#10 +
    '           regexp_replace(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO), ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'') ' + #13#10 +
    '         ELSE' + #13#10 +
    '           REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO), ''\D'')' + #13#10 +
    '       END AS VARCHAR(18)) CPF_CNPJ_MASC, ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 2, D2.RAZAOSOCIAL, 3, D3.RAZAOSOCIAL) RAZAOSOCIAL, ' + #13#10 +
    '       DECODE(' + #13#10 +
    '       DECODE(AX.TIPO, ''1'', D1.FLGPERMITETITULOSPAGTO, ''2'', D2.FLGPERMITETITULOSPAGTO, ''3'', D3.FLGPERMITETITULOSPAGTO), ''S'', '' - '',' + #13#10 +
    '       REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO), ''\D'')) NUM_BANCO, ' + #13#10 + //Everson TIBERO
//    '       trim(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO))) NUM_BANCO, ' + #13#10 +                     //Everson TIBERO
    '       DECODE(' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.FLGPERMITETITULOSPAGTO, 2, D2.FLGPERMITETITULOSPAGTO, 3, D3.FLGPERMITETITULOSPAGTO), ''S'', '' - '',' + #13#10 +
    '       CASE AX.TIPO ' + #13#10 +
    '         WHEN ''1'' THEN ' + #13#10 +
    '           CASE ' + #13#10 +
    '             WHEN INSTR(D1.MASCARAAGENCIA, ''-'') = 0 THEN ' + #13#10 +
    '               REGEXP_REPLACE(D1.NUMAGENCIA, ''\W'') ' + #13#10 +   //Everson TIBERO
//    '               trim(D1.NUMAGENCIA) ' + #13#10 +                       //Everson TIBERO
    '             ELSE ' + #13#10 +
        //Everson TIBERO - InÌcio
    '               SUBSTR(REGEXP_REPLACE(D1.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(D1.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' + #13#10 +
    '               SUBSTR(REGEXP_REPLACE(D1.NUMAGENCIA, ''\W''), INSTR(TRIM(D1.MASCARAAGENCIA), ''-''), 1) ' + #13#10 +
//    '               SUBSTR(trim(D1.NUMAGENCIA), 0, INSTR(TRIM(D1.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' + #13#10 +
//    '               SUBSTR(trim(D1.NUMAGENCIA), INSTR(TRIM(D1.MASCARAAGENCIA), ''-''), 1) ' + #13#10 +
       //Everson TIBERO - Fim
    '           END ' + #13#10 +
    '         WHEN ''2'' THEN ' + #13#10 +
    '           CASE D2.FLGIMPORTADO ' + #13#10 +
    '             WHEN ''N'' THEN ' + #13#10 +
    '               CASE ' + #13#10 +
    '                 WHEN INSTR(D2.MASCARAAGENCIA, ''-'') = 0 THEN ' + #13#10 +
    '                   REGEXP_REPLACE(D2.NUMAGENCIA, ''\W'') ' + #13#10 +     //Everson TIBERO
//    '                   trim(D2.NUMAGENCIA) ' + #13#10 +                         //Everson TIBERO
    '                 ELSE ' + #13#10 +
        //Everson TIBERO - InÌcio
    '                   SUBSTR(REGEXP_REPLACE(D2.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(D2.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' + #13#10 +
    '                   SUBSTR(REGEXP_REPLACE(D2.NUMAGENCIA, ''\W''), INSTR(TRIM(D2.MASCARAAGENCIA), ''-''), 1) ' + #13#10 +
//    '                   SUBSTR(trim(D2.NUMAGENCIA), 0, INSTR(TRIM(D2.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' + #13#10 +
//    '                   SUBSTR(trim(D2.NUMAGENCIA), INSTR(TRIM(D2.MASCARAAGENCIA), ''-''), 1) ' + #13#10 +
        //Everson TIBERO - Fim
    '               END ' + #13#10 +
    '             WHEN ''S'' THEN ' + #13#10 +
    '               REGEXP_REPLACE(D2.NUMAGENCIA, ''\s'')' + #13#10 +   //Everson TIBERO
//    '               trim(D2.NUMAGENCIA)' + #13#10 +                       //Everson TIBERO
    '           END ' + #13#10 +
    '       END) NUM_AGENCIA, ' + #13#10 +
    '       DECODE(' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.FLGPERMITETITULOSPAGTO, 2, D2.FLGPERMITETITULOSPAGTO, 3, D3.FLGPERMITETITULOSPAGTO), ''S'', '' - '',' + #13#10 +
    '       CASE AX.TIPO ' + #13#10 +
    '         WHEN ''1'' THEN ' + #13#10 +
    '           CASE ' + #13#10 +
    '             WHEN INSTR(D1.MASCARACC, ''-'') = 0 THEN ' + #13#10 +
    '               REGEXP_REPLACE(D1.CONTACORRENTE, ''\W'') ' + #13#10 +   //Everson TIBERO
//    '               trim(D1.CONTACORRENTE) ' + #13#10 +                       //Everson TIBERO
    '             ELSE ' + #13#10 +
        //Everson TIBERO - InÌcio
    '               SUBSTR(REGEXP_REPLACE(D1.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(D1.MASCARACC), ''-'')-1) ||''-''|| ' + #13#10 +
    '               SUBSTR(REGEXP_REPLACE(D1.CONTACORRENTE, ''\W''), INSTR(TRIM(D1.MASCARACC), ''-''), 1) ' + #13#10 +
//    '               SUBSTR(trim(D1.CONTACORRENTE), 0, INSTR(TRIM(D1.MASCARACC), ''-'')-1) ||''-''|| ' + #13#10 +
//    '               SUBSTR(trim(D1.CONTACORRENTE), INSTR(TRIM(D1.MASCARACC), ''-''), 1) ' + #13#10 +
        //Everson TIBERO - Fim
    '           END ' + #13#10 +
    '         WHEN ''2'' THEN ' + #13#10 +
    '           CASE D2.FLGIMPORTADO ' + #13#10 +
    '             WHEN ''N'' THEN ' + #13#10 +
    '               CASE ' + #13#10 +
    '                 WHEN INSTR(D2.MASCARACC, ''-'') = 0 THEN ' + #13#10 +
    '                   REGEXP_REPLACE(D2.CONTACORRENTE, ''\W'')' + #13#10 +   //Everson TIBERO
//    '                   trim(D2.CONTACORRENTE)' + #13#10 +                       //Everson TIBERO
    '                 ELSE ' + #13#10 +
    '                   SUBSTR(REGEXP_REPLACE(D2.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(D2.MASCARACC), ''-'')-1) ||''-''|| ' + #13#10 +  //Everson TIBERO
//    '                   SUBSTR(trim(D2.CONTACORRENTE), 0, INSTR(TRIM(D2.MASCARACC), ''-'')-1) ||''-''|| ' + #13#10 +                      //Everson TIBERO
    //C·ssio Rovaroto - SIG n∫ 73883 - InÌcio
    //Tratamento para contas do HSBC
    //'                   SUBSTR(REGEXP_REPLACE(D2.CONTACORRENTE, ''\W''), INSTR(TRIM(D2.MASCARACC), ''-''), 1) ' + #13#10 +
    '                   SUBSTR(REGEXP_REPLACE(D2.CONTACORRENTE, ''\W''), INSTR(TRIM(D2.MASCARACC), ''-'')) ' + #13#10 +     //Everson TIBERO
//    '                   SUBSTR(trim(D2.CONTACORRENTE), INSTR(TRIM(D2.MASCARACC), ''-'')) ' + #13#10 +                         //Everson TIBERO
    //C·ssio Rovaroto - SIG n∫ 73883 - Fim
    '               END ' + #13#10 +
    '             WHEN ''S'' THEN' + #13#10 +
    '               REGEXP_REPLACE(D2.CONTACORRENTE, ''\s'')' + #13#10 +   //Everson TIBERO
//    '               trim(D2.CONTACORRENTE)' + #13#10 +                       //Everson TIBERO
    '           END ' + #13#10 +
    '       END) NUM_CONTA,' + #13#10 +
    '       DECODE(' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.FLGPERMITETITULOSPAGTO, 2, D2.FLGPERMITETITULOSPAGTO, 3, D3.FLGPERMITETITULOSPAGTO), ''N'', '' - '',' + #13#10 +
    '       CAST( ' + #13#10 +
    '       CASE AX.TIPO ' + #13#10 +
    '         WHEN ''1'' THEN ' + #13#10 +
    '           CASE LENGTH(REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D'')) ' + #13#10 +
    '             WHEN 47 THEN ' + #13#10 +
    '               REGEXP_REPLACE(REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D''), ''([0-9]{5})([0-9]{5})([0-9]{5})([0-9]{6})([0-9]{5})([0-9]{6})([0-9]{1})([0-9]{14})'', ''\1.\2 \3.\4 \5.\6 \7 \8'') ' + #13#10 +
    '             WHEN 48 THEN ' + #13#10 +
    '               REGEXP_REPLACE(REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D''), ''([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})'', ''\1-\2 \3-\4 \5-\6 \7-\8'') ' + #13#10 +
    '             ELSE ' + #13#10 +
    '               REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D'')' + #13#10 +
    '           END' + #13#10 +
    '         WHEN ''3'' THEN ' + #13#10 +
    '           CASE LENGTH(REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D''))                                              ' + #13#10 +
    '             WHEN 47 THEN ' + #13#10 +
    '               REGEXP_REPLACE(REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D''), ''([0-9]{5})([0-9]{5})([0-9]{5})([0-9]{6})([0-9]{5})([0-9]{6})([0-9]{1})([0-9]{14})'', ''\1.\2 \3.\4 \5.\6 \7 \8'') ' + #13#10 +
    '             WHEN 48 THEN ' + #13#10 +
    '               REGEXP_REPLACE(REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D''), ''([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})'', ''\1-\2 \3-\4 \5-\6 \7-\8'') ' + #13#10 +
    '             ELSE ' + #13#10 +
    '               REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D'')' + #13#10 +
    '           END ' + #13#10 +
    '       END AS VARCHAR2(100))) COD_BARRAS_MASC, ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.FORMA_PAGTO, 2, D2.FORMA_PAGTO, 3, D3.FORMA_PAGTO) FORMA_PAGTO, ' + #13#10 +
    '       DECODE(DECODE(AX.TIPO, 1, D1.STATUS, 2, D2.STATUS, 3, D3.STATUS), 2, ''Baixado'', ''Aberto'') STATUS, ' + #13#10 +
    '       AX.CODFORMA,              ' + #13#10 +
    '       LPAD(AP.NSA, 6, ''0'') NSA,         ' + #13#10 +
    '       AX.IDARQUIVOPAGTO,                 ' + #13#10 +

    //C·ssio Rovaroto - SIG n∫ 100336 - InÌcio
    //Everson Luiz - SIG TIBERO - InÌcio
    //'(SELECT DISTINCT CRI.NOME                                                            ' + #13#10 +
    //'        FROM RATEIODOCUM RI                                                          ' + #13#10 +
    //'        JOIN CENTRESPON CRI ON RI.CODCENTRORESPON = CRI.CODCENTRORESPON              ' + #13#10 +
    //'   WHERE ((RI.CODDOCUMENTO = D1.CODDOCUMENTO and ax.tipo = 1)  or                    ' + #13#10 +
    //'               (RI.CODDOCUMENTO = D2.CODDOCUMENTO and ax.tipo = 2) or                ' + #13#10 +
    //'               (RI.CODDOCUMENTO = D3.CODDOCUMENTO and ax.tipo = 3))) CENT_RESPON,    ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 100336 - Fim

    '     (SELECT DISTINCT L2.HISTORICOCOMPL HISTORICO                                    ' + #13#10 +
    '         FROM LANCTODOCUM L2                                                         ' + #13#10 +
    '       WHERE L2.OPERACAO = 2                                                         ' + #13#10 +
    '             AND ((L2.CODDOCUMENTO = D1.CODDOCUMENTO and ax.tipo = 1)  or            ' + #13#10 +
    '                    (L2.CODDOCUMENTO = D2.CODDOCUMENTO and ax.tipo = 2) or           ' + #13#10 +
    '                    (L2.CODDOCUMENTO = D3.CODDOCUMENTO and ax.tipo = 3))) HIST       ' + #13#10 +
    //Everson Luiz - SIG TIBERO - Fim
    *)

Result := 'SELECT DECODE(AX.TIPO, 1, D1.NUMAPGR, 2, D2.NUMAPGR, 3, D3.NUMAPGR, 4, D4.NUMAPGR) NUM_AP, ' + #13#10 +
          '       DECODE(AX.TIPO, 1, D1.NODOCUMENTO, 2, D2.NODOCUMENTO, 3, D3.NODOCUMENTO, 4, D4.NODOCUMENTO) NODOCUMENTO, ' + #13#10 +
          '       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 2, D2.DATAPROGRAMADA, 3, D3.DATAPROGRAMADA, 4, D4.DATAPROGRAMADA) DATAPROGRAMADA, ' + #13#10 +
          '       AX.VALOR, ' + #13#10 +
          // Paulo Nobre - WO33342 - Inicio
          '       CAST(CM.FN_FORMATACPFCNPJ(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO, 4, D4.NUMDOCUMENTO)) AS VARCHAR2(18)) AS CPF_CNPJ_MASC, ' + #13#10 +
          //'       CAST( ' + #13#10 +
          //'       CASE LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO, 4, D4.NUMDOCUMENTO), ''\D'')) ' + #13#10 +
          //'         WHEN 11 THEN ' + #13#10 +
          //'           regexp_replace(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO, 4, D4.NUMDOCUMENTO), ''\D''), ''([0-9]{3}//)([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'') ' + #13#10 +
          //'         WHEN 14 THEN ' + #13#10 +
          //'           regexp_replace(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO, 4, D4.NUMDOCUMENTO), ''\D''), ''([0-9]{2}//)([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'') ' + #13#10 +
          //'         ELSE ' + #13#10 +
          //'           REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO, 4, D4.NUMDOCUMENTO), ''\D'') ' + #13#10 +
          //'       END AS VARCHAR(18)) CPF_CNPJ_MASC, ' + #13#10 +
          // Paulo Nobre - WO33342 - Fim
          '       DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 2, D2.RAZAOSOCIAL, 3, D3.RAZAOSOCIAL, 4, D4.RAZAOSOCIAL) RAZAOSOCIAL, ' + #13#10 +
          '       DECODE( ' + #13#10 +
          '       DECODE(AX.TIPO, ''1'', D1.FLGPERMITETITULOSPAGTO, ''2'', D2.FLGPERMITETITULOSPAGTO, ''3'', D3.FLGPERMITETITULOSPAGTO, ''4'', D4.FLGPERMITETITULOSPAGTO), ''S'', '' - '', ' + #13#10 +
          '       REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO, 4, D4.NUMBANCO), ''\D'')) NUM_BANCO, ' + #13#10 +
          '       DECODE( ' + #13#10 +
          '       DECODE(AX.TIPO, 1, D1.FLGPERMITETITULOSPAGTO, 2, D2.FLGPERMITETITULOSPAGTO, 3, D3.FLGPERMITETITULOSPAGTO, 4, D4.FLGPERMITETITULOSPAGTO), ''S'', '' - '', ' + #13#10 +
          '       CASE AX.TIPO ' + #13#10 +
          '         WHEN ''1'' THEN ' + #13#10 +
          '           CASE ' + #13#10 +
          '             WHEN INSTR(D1.MASCARAAGENCIA, ''-'') = 0 THEN ' + #13#10 +
          '               REGEXP_REPLACE(D1.NUMAGENCIA, ''\W'') ' + #13#10 +
          '             ELSE ' + #13#10 +
          '               SUBSTR(REGEXP_REPLACE(D1.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(D1.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' + #13#10 +
          '               SUBSTR(REGEXP_REPLACE(D1.NUMAGENCIA, ''\W''), INSTR(TRIM(D1.MASCARAAGENCIA), ''-''), 1) ' + #13#10 +
          '           END ' + #13#10 +
          '         WHEN ''2'' THEN ' + #13#10 +
          '           CASE D2.FLGIMPORTADO ' + #13#10 +
          '             WHEN ''N'' THEN ' + #13#10 +
          '               CASE ' + #13#10 +
          '                 WHEN INSTR(D2.MASCARAAGENCIA, ''-'') = 0 THEN ' + #13#10 +
          '                   REGEXP_REPLACE(D2.NUMAGENCIA, ''\W'') ' + #13#10 +
          '                 ELSE ' + #13#10 +
          '                   SUBSTR(REGEXP_REPLACE(D2.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(D2.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' + #13#10 +
          '                   SUBSTR(REGEXP_REPLACE(D2.NUMAGENCIA, ''\W''), INSTR(TRIM(D2.MASCARAAGENCIA), ''-''), 1) ' + #13#10 +
          '               END ' + #13#10 +
          '             WHEN ''S'' THEN ' + #13#10 +
          '               REGEXP_REPLACE(D2.NUMAGENCIA, ''\s'') ' + #13#10 +
          '           END ' + #13#10 +
          '         WHEN ''4'' THEN ' + #13#10 +
          '          CASE ' + #13#10 +
          '            WHEN INSTR(D4.MASCARAAGENCIA, ''-'') = 0 THEN ' + #13#10 +
          '              REGEXP_REPLACE(D4.NUMAGENCIA, ''\W'') ' + #13#10 +
          '            ELSE ' + #13#10 +
          '              SUBSTR(REGEXP_REPLACE(D4.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(D4.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' + #13#10 +
          '              SUBSTR(REGEXP_REPLACE(D4.NUMAGENCIA, ''\W''), INSTR(TRIM(D4.MASCARAAGENCIA), ''-''), 1) ' + #13#10 +
          '          END ' + #13#10 +
          '       END) NUM_AGENCIA, ' + #13#10 +
          '       DECODE( ' + #13#10 +
          '       DECODE(AX.TIPO, 1, D1.FLGPERMITETITULOSPAGTO, 2, D2.FLGPERMITETITULOSPAGTO, 3, D3.FLGPERMITETITULOSPAGTO, 4, D4.FLGPERMITETITULOSPAGTO), ''S'', '' - '', ' + #13#10 +
          '       CASE AX.TIPO ' + #13#10 +
          '         WHEN ''1'' THEN ' + #13#10 +
          '           CASE ' + #13#10 +
          '             WHEN INSTR(D1.MASCARACC, ''-'') = 0 THEN ' + #13#10 +
          '               REGEXP_REPLACE(D1.CONTACORRENTE, ''\W'') ' + #13#10 +
          '             ELSE ' + #13#10 +
          '               SUBSTR(REGEXP_REPLACE(D1.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(D1.MASCARACC), ''-'')-1) ||''-''|| ' + #13#10 +
          '               SUBSTR(REGEXP_REPLACE(D1.CONTACORRENTE, ''\W''), INSTR(TRIM(D1.MASCARACC), ''-''), 1) ' + #13#10 +
          '           END ' + #13#10 +
          '         WHEN ''2'' THEN ' + #13#10 +
          '           CASE D2.FLGIMPORTADO ' + #13#10 +
          '             WHEN ''N'' THEN ' + #13#10 +
          '               CASE ' + #13#10 +
          '                 WHEN INSTR(D2.MASCARACC, ''-'') = 0 THEN ' + #13#10 +
          '                   REGEXP_REPLACE(D2.CONTACORRENTE, ''\W'') ' + #13#10 +
          '                 ELSE ' + #13#10 +
          '                   SUBSTR(REGEXP_REPLACE(D2.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(D2.MASCARACC), ''-'')-1) ||''-''|| ' + #13#10 +
          '                   SUBSTR(REGEXP_REPLACE(D2.CONTACORRENTE, ''\W''), INSTR(TRIM(D2.MASCARACC), ''-'')) ' + #13#10 +
          '               END ' + #13#10 +
          '             WHEN ''S'' THEN ' + #13#10 +
          '               REGEXP_REPLACE(D2.CONTACORRENTE, ''\s'') ' + #13#10 +
          '           END ' + #13#10 +
          '         WHEN ''4'' THEN ' + #13#10 +
          '          CASE ' + #13#10 +
          '            WHEN INSTR(D4.MASCARACC, ''-'') = 0 THEN ' + #13#10 +
          '              REGEXP_REPLACE(D4.CONTACORRENTE, ''\W'') ' + #13#10 +
          '            ELSE ' + #13#10 +
          '              SUBSTR(REGEXP_REPLACE(D4.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(D4.MASCARACC), ''-'')-1) ||''-''|| ' + #13#10 +
          '              SUBSTR(REGEXP_REPLACE(D4.CONTACORRENTE, ''\W''), INSTR(TRIM(D4.MASCARACC), ''-''), 1) ' + #13#10 +
          '          END ' + #13#10 +
          '       END) NUM_CONTA, ' + #13#10 +
          '       DECODE( ' + #13#10 +
          '       DECODE(AX.TIPO, 1, D1.FLGPERMITETITULOSPAGTO, 2, D2.FLGPERMITETITULOSPAGTO, 3, D3.FLGPERMITETITULOSPAGTO, 4, D4.FLGPERMITETITULOSPAGTO), ''N'', '' - '', ' + #13#10 +
          '       CAST( ' + #13#10 +
          '       CASE AX.TIPO ' + #13#10 +
          '         WHEN ''1'' THEN ' + #13#10 +
          '           CASE LENGTH(REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D'')) ' + #13#10 +
          '             WHEN 47 THEN ' + #13#10 +
          '               REGEXP_REPLACE(REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D''), ''([0-9]{5})([0-9]{5})([0-9]{5})([0-9]{6})([0-9]{5})([0-9]{6})([0-9]{1})([0-9]{14})'', ''\1.\2 \3.\4 \5.\6 \7 \8'') ' + #13#10 +
          '             WHEN 48 THEN ' + #13#10 +
          '               REGEXP_REPLACE(REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D''), ''([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})'', ''\1-\2 \3-\4 \5-\6 \7-\8'') ' + #13#10 +
          '             ELSE ' + #13#10 +
          '               REGEXP_REPLACE(D1.NUMLEITCODBARRAS, ''\D'') ' + #13#10 +
          '           END ' + #13#10 +
          '         WHEN ''3'' THEN ' + #13#10 +
          '           CASE LENGTH(REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D'')) ' + #13#10 +
          '             WHEN 47 THEN ' + #13#10 +
          '               REGEXP_REPLACE(REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D''), ''([0-9]{5})([0-9]{5})([0-9]{5})([0-9]{6})([0-9]{5})([0-9]{6})([0-9]{1})([0-9]{14})'', ''\1.\2 \3.\4 \5.\6 \7 \8'') ' + #13#10 +
          '             WHEN 48 THEN ' + #13#10 +
          '               REGEXP_REPLACE(REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D''), ''([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})'', ''\1-\2 \3-\4 \5-\6 \7-\8'') ' + #13#10 +
          '             ELSE ' + #13#10 +
          '               REGEXP_REPLACE(D3.NUMCODBARRAS, ''\D'') ' + #13#10 +
          '           END ' + #13#10 +
          '         WHEN ''4'' THEN ' + #13#10 +
          '          CASE LENGTH(REGEXP_REPLACE(D4.NUMLEITCODBARRAS, ''\D'')) ' + #13#10 +
          '            WHEN 47 THEN ' + #13#10 +
          '              REGEXP_REPLACE(REGEXP_REPLACE(D4.NUMLEITCODBARRAS, ''\D''), ''([0-9]{5})([0-9]{5})([0-9]{5})([0-9]{6})([0-9]{5})([0-9]{6})([0-9]{1})([0-9]{14})'', ''\1.\2 \3.\4 \5.\6 \7 \8'') ' + #13#10 +
          '            WHEN 48 THEN ' + #13#10 +
          '              REGEXP_REPLACE(REGEXP_REPLACE(D4.NUMLEITCODBARRAS, ''\D''), ''([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})([0-9]{11})([0-9]{1})'', ''\1-\2 \3-\4 \5-\6 \7-\8'') ' + #13#10 +
          '            ELSE ' + #13#10 +
          '              REGEXP_REPLACE(D4.NUMLEITCODBARRAS, ''\D'') ' + #13#10 +
          '          END ' + #13#10 +
          '       END AS VARCHAR2(100))) COD_BARRAS_MASC, ' + #13#10 +
          '       DECODE(AX.TIPO, 1, D1.FORMA_PAGTO, 2, D2.FORMA_PAGTO, 3, D3.FORMA_PAGTO, 4, D4.FORMA_PAGTO) FORMA_PAGTO, ' + #13#10 +
          '       DECODE(DECODE(AX.TIPO, 1, D1.STATUS, 2, D2.STATUS, 3, D3.STATUS, 4, D4.STATUS), 2, ''Baixado'', ''Aberto'') STATUS, ' + #13#10 +
          '       AX.CODFORMA, ' + #13#10 +
          '       CAST(LPAD(AP.NSA, 6, ''0'') AS VARCHAR2(6)) NSA, ' + #13#10 + //MIGRACAO-ORACLE LEANDRO
          '       AX.IDARQUIVOPAGTO, ' + #13#10 +
          '       decode(ax.tipo, 4, ''AP Agrupada'', ' + #13#10 +
          '       (SELECT DISTINCT L2.HISTORICOCOMPL HISTORICO ' + #13#10 +
          '          FROM LANCTODOCUM L2 ' + #13#10 +
          '         WHERE L2.OPERACAO = 2 ' + #13#10 +
          '           AND ((L2.CODDOCUMENTO = D1.CODDOCUMENTO and ax.tipo = 1) or ' + #13#10 +
          '                (L2.CODDOCUMENTO = D2.CODDOCUMENTO and ax.tipo = 2) or ' + #13#10 +
          '                (L2.CODDOCUMENTO = D3.CODDOCUMENTO and ax.tipo = 3))) ) HIST  ' + #13#10 +
          //Everson Cunha - SIG117206 - Fim
          
          //Everson Cunha - WO1822 - Ini
          '       , PO.DESCRICAO CONVENIO ' + #13#10 +
          '       , AP.USUGERACAOARQTXT ' + #13#10 +
          '       , CASE WHEN ax.tipo = 4 THEN ''COFIN'' ' + #13#10 +
          '           ELSE (select distinct cri.nome ' + #13#10 +
          '                   from rateiodocum ri ' + #13#10 +
          '                   join centrespon cri on ri.codcentrorespon = cri.codcentrorespon ' + #13#10 +
          '                  where ((ri.coddocumento = d1.coddocumento and ax.tipo = 1) or ' + #13#10 +
          '                         (ri.coddocumento = d2.coddocumento and ax.tipo = 2) or ' + #13#10 +
          '                 (ri.coddocumento = d3.coddocumento and ax.tipo = 3))) ' + #13#10 +
          '         END AS CENT_RESPON ' + #13#10 +
          //Everson Cunha - WO1822 - Fim

    '  FROM ARQUIVOXDOCUM AX                  ' + #13#10 +
    '  JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AX.IDARQUIVOPAGTO     ' + #13#10 +
    '  JOIN CM.PORTADORFORMA PO ON PO.CODPORTFORMA = AP.CODPORTFORMA ' + #13#10 + //Everson Cunha - WO1822
    '  LEFT JOIN ( ' + #13#10 +
    'SELECT DI1.CODDOCUMENTO, DI1.NUMAPGR, DI1.NODOCUMENTO, DI1.DATAPROGRAMADA, DI1.STATUS, P.NUMDOCUMENTO, P.RAZAOSOCIAL, ' + #13#10 +
    '       CONTA.MASCARAAGENCIA, CONTA.MASCARACC, CONTA.NUMBANCO, CONTA.NUMAGENCIA, CONTA.CONTACORRENTE, ' + #13#10 +
    '       FO.DESCRICAO FORMA_PAGTO, NVL(FO.FLGPERMITETITULOSPAGTO, ''N'') FLGPERMITETITULOSPAGTO, DI1.NUMLEITCODBARRAS ' + #13#10 +
    '  FROM DOCUMENTO DI1 ' + #13#10 +
    '  JOIN FORMARECPAG FO ON FO.CODFORMA = DI1.CODFORMA ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI ' + #13#10 +
    '  LEFT JOIN (' + #13#10 +
    'SELECT C.IDCBANCARIA, B.MASCARAAGENCIA, B.MASCARACC, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE' + #13#10 +
    '  FROM CONTABANCARIA C ' + #13#10 +
    '  JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA ' + #13#10 +
    '  JOIN BANCO B ON B.IDPESSOA = A.IDBANCO) CONTA ON CONTA.IDCBANCARIA = DI1.IDCBANCARIA' + #13#10 +
    '            ) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1 ' + #13#10 +
    '  LEFT JOIN ( ' + #13#10 +
//    'SELECT DP.IDDOCUMENTOXPESSOAS, DI2.NUMAPGR, DI2.NODOCUMENTO, DI2.DATAPROGRAMADA, DI2.STATUS, DP.NUMDOCUMENTO, DP.RAZAOSOCIAL, ' + #13#10 +   //Everson Luiz - SIG TIBERO
    'SELECT DI2.CODDOCUMENTO, DP.IDDOCUMENTOXPESSOAS, DI2.NUMAPGR, DI2.NODOCUMENTO, DI2.DATAPROGRAMADA, DI2.STATUS, NVL(DP.NUMDOCUMENTO, TRIM(PE.NUMDOCUMENTO)) AS NUMDOCUMENTO, DP.RAZAOSOCIAL,' + #13#10 + //Everson Luiz - SIG TIBERO

    // Paulo Nobre - WO24848 - Inicio
    '       MANUAL.MASCARAAGENCIA, MANUAL.MASCARACC, DP.NUMBANCO, DP.NUMAGENCIA,      ' + #13#10 +
    '       CASE                                                                      ' + #13#10 +
    '          WHEN LENGTH(DP.NUMOPERACAO) >= 3 THEN (DP.NUMOPERACAO || DP.NUMCONTA)  ' + #13#10 +
    '        	ELSE DP.NUMCONTA                                                       ' + #13#10 +
    '       END CONTACORRENTE,                                                        ' + #13#10 +
    // Paulo Nobre - WO24848 - Fim

    '       FO.DESCRICAO FORMA_PAGTO, NVL(FO.FLGPERMITETITULOSPAGTO, ''N'') FLGPERMITETITULOSPAGTO, DP.FLGIMPORTADO ' + #13#10 +
    '  FROM DOCUMENTO DI2 ' + #13#10 +
    '  JOIN FORMARECPAG FO ON FO.CODFORMA = DI2.CODFORMA ' + #13#10 +
    '  JOIN DOCUMENTOXPESSOAS DP ON DI2.CODDOCUMENTO = DP.CODDOCUMENTO ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 101647 - InÌcio
    //'  JOIN PESSOA PE ON PE.IDPESSOA = DP.IDFORCLI ' +#13#10 +
    '  LEFT JOIN PESSOA PE ON PE.IDPESSOA = DP.IDFORCLI ' +#13#10 +
    //C·ssio Rovaroto - SIG n∫ 101647 - Fim
    '  LEFT JOIN (SELECT B.MASCARACC, ' + #13#10 +
    '                    B.MASCARAAGENCIA, ' + #13#10 +
    '                    C.IDCBANCARIA ' + #13#10 +
    '               FROM CONTABANCARIA C ' + #13#10 +
    '               JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA ' + #13#10 +
    '               JOIN BANCO B ON B.IDPESSOA = A.IDBANCO) MANUAL ON MANUAL.IDCBANCARIA = DP.IDCBANCARIA ' + #13#10 +
    '            ) D2 ON D2.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2 ' + #13#10 +
    '  LEFT JOIN ( ' + #13#10 +
//    'SELECT DC.IDDOCUMENTOXCODBARRAS, DI3.NUMAPGR, DI3.NODOCUMENTO, DC.DTPAGTO, DI3.STATUS, ' + #13#10 +   //Everson Luiz - SIG TIBERO
    //C·ssio Rovaroto - SIG n∫ 99579 - InÌcio
    //'SELECT DI3.CODDOCUMENTO, DC.IDDOCUMENTOXCODBARRAS, DI3.NUMAPGR, DI3.NODOCUMENTO, DC.DTPAGTO, DI3.STATUS, ' + #13#10 +   //Everson Luiz - SIG TIBERO
    'SELECT DI3.CODDOCUMENTO, DC.IDDOCUMENTOXCODBARRAS, DI3.NUMAPGR, DI3.NODOCUMENTO, DI3.DATAPROGRAMADA, DC.DTPAGTO, DI3.STATUS, ' + #13#10 +   //Everson Luiz - SIG TIBERO
    //C·ssio Rovaroto - SIG n∫ 99579 - Fim
    '       NVL(DC.NUMDOCUMENTO, P3.NUMDOCUMENTO) NUMDOCUMENTO, P3.RAZAOSOCIAL, ' + #13#10 +
    '       DC.NUMCODBARRAS, FO.DESCRICAO FORMA_PAGTO, NVL(FO.FLGPERMITETITULOSPAGTO, ''N'') FLGPERMITETITULOSPAGTO' + #13#10 +
    '  FROM DOCUMENTO DI3 ' + #13#10 +
    '  JOIN FORMARECPAG FO ON FO.CODFORMA = DI3.CODFORMA ' + #13#10 +
    '  JOIN DOCUMENTOXCODBARRAS DC ON DI3.CODDOCUMENTO = DC.CODDOCUMENTO ' + #13#10 +
    '  JOIN PESSOA P3 ON P3.IDPESSOA = DI3.IDFORCLI ' + #13#10 +
    '            ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3 ' + #13#10 +

    //Everson Cunha - SIG117206 - Ini
    '  LEFT JOIN ( ' + #13#10 +
    'SELECT DI4.CODGRUPOCNAB, DI4.NUMAPGR, DI4.NODOCUMENTO, DI4.DATAPROGRAMADA, ' + #13#10 +
    '       DI4.STATUS, P.NUMDOCUMENTO, P.RAZAOSOCIAL, CONTA.MASCARAAGENCIA, ' + #13#10 +
    '       CONTA.MASCARACC, CONTA.NUMBANCO, CONTA.NUMAGENCIA, ' + #13#10 +
    '       CONTA.CONTACORRENTE, FO.DESCRICAO FORMA_PAGTO, ' + #13#10 +
    '       NVL(FO.FLGPERMITETITULOSPAGTO, ''N'') FLGPERMITETITULOSPAGTO, ' + #13#10 +
    '       DI4.NUMLEITCODBARRAS ' + #13#10 +
    '  FROM DOCUMENTO DI4 ' + #13#10 +
    '  JOIN FORMARECPAG FO ON FO.CODFORMA = DI4.CODFORMA ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI4.IDFORCLI ' + #13#10 +
    '  LEFT JOIN ( SELECT C.IDCBANCARIA, B.MASCARAAGENCIA, B.MASCARACC, ' + #13#10 +
    '                     B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE ' + #13#10 +
    '                FROM CONTABANCARIA C ' + #13#10 +
    '                JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA ' + #13#10 +
    '                JOIN BANCO B ON B.IDPESSOA = A.IDBANCO ) CONTA ON CONTA.IDCBANCARIA = DI4.IDCBANCARIA ' + #13#10 +
    ' GROUP BY DI4.CODGRUPOCNAB, DI4.NUMAPGR, DI4.NODOCUMENTO, DI4.DATAPROGRAMADA, ' + #13#10 +
    '          DI4.STATUS, P.NUMDOCUMENTO, P.RAZAOSOCIAL, CONTA.MASCARAAGENCIA, ' + #13#10 +
    '          CONTA.MASCARACC, CONTA.NUMBANCO, CONTA.NUMAGENCIA, ' + #13#10 +
    '          CONTA.CONTACORRENTE, FO.DESCRICAO, ' + #13#10 +
    '          NVL(FO.FLGPERMITETITULOSPAGTO, ''N''), DI4.NUMLEITCODBARRAS ' + #13#10 +
    '             ) D4 ON D4.CODGRUPOCNAB = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 4 ' + #13#10 +
    //Everson Cunha - SIG117206 - Fim
    ' WHERE AX.IDARQUIVOPAGTO = :IDARQUIVOPAGTO ' + #13#10 +
    //' ORDER BY DATAPROGRAMADA, FORMA_PAGTO, RAZAOSOCIAL, VALOR '; //Everson Cunha - WO6243
    ' ORDER BY DATAPROGRAMADA, RAZAOSOCIAL, VALOR, FORMA_PAGTO ';   //Everson Cunha - WO6243
End;

Function TCtrlRemessaEletronica._SelecionaMovBaixa(pIdArqPgto, pTipoBaixa: String): OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT AR.IDARQUIVOPAGTO,                                                                                                  ' + #13#10 +
    '       AR.IDARQUIVOPAGTO NUMARQUIVO,                                                                                             ' + #13#10 +
    '       PO.DESCRICAO AS DSC_CONVENIO,                                                                                             ' + #13#10 +
    '       D.CODDOCUMENTO,                                                                                                           ' + #13#10 +
    '       D.IDFORCLI,                                                                                                               ' + #13#10 +
    '       D.CODTIPDOC,                                                                                                              ' + #13#10 +
    '       D.DATAPROGRAMADA,                                                                                                         ' + #13#10 +
    '       D.IDMODULO,                                                                                                               ' + #13#10 +
    '       D.OPERACAO,                                                                                                               ' + #13#10 +
    //Everson Cunha - SIG117206 - Ini
    //'       AR.VALOR_POR_DOCUMENTO VALOR,                                                                                             ' + #13#10 +
    //'       AR.VALOR_POR_DOCUMENTO VLRLIQUIDO,                                                                                        ' + #13#10 +
    '       (SELECT SUM(DECODE(LANC.DEBCRE, ''D'', ' + #13#10 +
    '                  DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1), ' + #13#10 +
    '                  DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR ' + #13#10 +
    '             FROM LANCTODOCUM LANC ' + #13#10 +
    '             JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ' + #13#10 +
    '            WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO) VALOR, ' + #13#10 +

    '          (SELECT SUM(DECODE(LANC.DEBCRE, ''D'', ' + #13#10 +
    '                  DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1), ' + #13#10 +
    '                  DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR ' + #13#10 +
    '             FROM LANCTODOCUM LANC ' + #13#10 +
    '             JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ' + #13#10 +
    '            WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO) VLRLIQUIDO, ' + #13#10 +
    //Everson Cunha - SIG117206 - Fim
    '       L.NUMLANCTO,                                                                                                              ' + #13#10 +
    '       ''D'' DEBCRE,                                                                                                             ' + #13#10 +
    '       D.NODOCUMENTO,                                                                                                            ' + #13#10 +
    '       D.COMPLDOCUMENTO,                                                                                                         ' + #13#10 +
    '       NVL(P.RAZAOSOCIAL, P.NOME) NOME,                                                                                          ' + #13#10 +
    '       ''S'' FLGBAIXATOTAL                                                                                                       ' + #13#10 + //Denis Horongoso - SIG 73920
    '  FROM ARQUIVOPAGTO AP                                                                                                           ' + #13#10 +
    '  JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = AP.CODPORTFORMA                                                                     ' + #13#10 +
    //'  JOIN (SELECT DISTINCT DECODE(AX.TIPO, 1, AX.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DX.CODDOCUMENTO) CODDOCUMENTO,    ' + #13#10 +                 //Everson Cunha - SIG117206
    '  JOIN (SELECT DISTINCT DECODE(AX.TIPO, 1, AX.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DX.CODDOCUMENTO, 4, DAG.CODDOCUMENTO) CODDOCUMENTO, ' + #13#10 + //Everson Cunha - SIG117206
    '               AX.IDARQUIVOPAGTO,                                                                                                ' + #13#10 +
    '               SUM(AX.VALOR) VALOR_POR_DOCUMENTO                                                                                 ' + #13#10 +
    '        FROM ARQUIVOXDOCUM  AX                                                                                                   ' + #13#10 +
    '        LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2                   ' + #13#10 +
    '        LEFT JOIN DOCUMENTOXCODBARRAS DX ON DX.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3               ' + #13#10 +
    '        LEFT JOIN DOCUMENTO DAG ON DAG.CODGRUPOCNAB = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 4 ' + #13#10; //Everson Cunha - SIG117206

  If pTipoBaixa = '1' Then // Baixa no Retorno
    sSql := sSql + '        WHERE (NVL(AX.OCORRENCIA_RET, ''00'') = ''00'' OR AX.OCORRENCIA_RET = ''BD'')                             ' + #13#10;

  //sSql := sSql + '        GROUP BY DECODE(AX.TIPO, 1, AX.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DX.CODDOCUMENTO), AX.IDARQUIVOPAGTO   ' + #13#10 +                  //Everson Cunha - SIG117206
  sSql := sSql + '       GROUP BY DECODE(AX.TIPO, 1, AX.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DX.CODDOCUMENTO, 4, DAG.CODDOCUMENTO), AX.IDARQUIVOPAGTO  ' + #13#10 + //Everson Cunha - SIG117206
    '       ) AR ON AR.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                                                                             ' + #13#10 +
    '  JOIN DOCUMENTO D ON D.CODDOCUMENTO = AR.CODDOCUMENTO                                                                           ' + #13#10 +
    '  JOIN LANCTODOCUM L ON L.CODDOCUMENTO = D.CODDOCUMENTO AND L.OPERACAO = 2                                                       ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = D.IDFORCLI                                                                                       ' + #13#10 +
    'WHERE D.STATUS <> 2                                                                                                              ' + #13#10 +
    '      AND AR.IDARQUIVOPAGTO = ' + pIdArqPgto;

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovBaixa_' + pTipoBaixa + '.txt');
End;

function TCtrlRemessaEletronica._SelecionaDadosCabecArq(pCodPortForma, pNSA, pIdArqPagto: String): Olevariant;
Var sSql: String;
Begin
  sSql :=
    'SELECT ' + Quotedstr(rDadosParamConv.sNumBanco) + '||--BANCO,                                             ' + #13#10 +
    '       LPAD(''0'', 4, ''0'') ||--COD_LOTE,                                                                ' + #13#10 +
    '       ''0'' ||--REG,                                                                                     ' + #13#10 +
    '       RPAD('' '', 9) ||--FILLER,                                                                         ' + #13#10 +
    // Paulo Nobre - WO33342 - Inicio
    '       DECODE(LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') ||--TIP_INSC,  ' + #13#10 +
    '       LPAD(REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]''), 14, ''0'') ||--NUM_INSC,                              ' + #13#10;  
    // Paulo Nobre - WO33342 - Fim 
    //C·ssio Rovaroto - SIG n∫ 114764 - InÌcio
    if rDadosParamConv.sNumBanco =  '001' then
    begin
      sSql := sSql + '       LPAD(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), 9, ''0'') ||--COD_CONV,          ' + #13#10;
      sSql := sSql + '       ''0126'' ||                                                                       ' + #13#10;
      sSql := sSql + '       RPAD('' '', 5) ||                                                                 ' + #13#10;

    if Copy(UpperCase(Sistema.AliasServidor), 1, 8) = 'PRODUCAO' then
      sSql := sSql + '     RPAD('' '', 2) ||                                                                   ' + #13#10
    else
      sSql := sSql + '     ''TS'' ||                                                                           ' + #13#10;
    end
    else
    begin
      sSql := sSql +  '       LPAD(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), 6, ''0'') ||--COD_CONV,         ' + #13#10+
                     Quotedstr(_CompletaEspacoDir(rDadosParamConv.sParamTrans, 2)) + '||                       ' + #13#10;
      //C·ssio Rovaroto - SIG n∫ 64891 - InÌcio
      if Copy(UpperCase(Sistema.AliasServidor), 1, 8) = 'PRODUCAO' then
        sSql := sSql + Quotedstr(rDadosParamConv.sAmbiente) + '|| --AMB_CLI                                    ' + #13#10
      else
        sSql := sSql + '''T'' || --AMB_CLI                                                                     ' + #13#10;
      //C·ssio Rovaroto - SIG n∫ 64891 - Fim
      sSql := sSql + '       '' '' ||--AMB_CAIXA,                                                              ' + #13#10 +
      '       RPAD('' '', 3) ||--ORIG_APLIC,                                                                   ' + #13#10 +
      '       LPAD(''0'', 4, ''0'') ||--NUM_VERSAO,                                                            ' + #13#10 +
      '       RPAD('' '', 3) ||--FILLER,                                                                       ' + #13#10 ;
    end;
    //C·ssio Rovaroto -  SIG n∫ 114764 - Fim
    sSql := sSql + '       CASE                                                                                ' + #13#10 +
    '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                    ' + #13#10 +
    '           LPAD(NVL(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), ''0''), 5, ''0'')                              ' + #13#10 +
    '         ELSE                                                                                             ' + #13#10 +
    '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(BA.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')  ' + #13#10 +
    '       END ||--AGENCIA_CLI,                                                                               ' + #13#10 +

//Ewerton Beltramini - 05/03/2021 - SIG 114142 - Inicio.............................................................................
    '       CASE WHEN (AG.NUMAGENCIA <> 24585) THEN                                                         ' + #13#10 +
    '            	(CASE WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN ''0''                                    ' + #13#10 +
    '              ELSE NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), INSTR(TRIM(BA.MASCARAAGENCIA), ''-''), 1), ''0'')	END)   ' + #13#10 +
    '       ELSE ''9'' END ||--DV_AG,                                                                              ' + #13#10 +    
(*
    '       /*CASE                                                                                             ' + #13#10 +
    '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                    ' + #13#10 +
    '           ''0''                                                                                          ' + #13#10 +
    '         ELSE                                                                                             ' + #13#10 +
    '           NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), INSTR(TRIM(BA.MASCARAAGENCIA), ''-''), 1), ''0'')  ' + #13#10 +
    '       END ||DV_AG, */                                                                                    ' + #13#10 +
//C·ssio Rovaroto - SIG n∫ 64891 - InÌcio
//    '       '' '' ||--DV_AG,                                                                                   ' + #13#10 +
    '       ''9'' ||--DV_AG,                                                                                 ' + #13#10 +
//C·ssio Rovaroto - SIG n∫ 64891 - InÌcio
*)
//Ewerton Beltramini - 05/03/2021 - SIG 114142 - Fim................................................................................

    '       CASE                                                                                               ' + #13#10 +
    '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                         ' + #13#10 +
    '           LPAD(NVL(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), ''0''), 12, ''0'')                          ' + #13#10 +
    '         ELSE                                                                                             ' + #13#10 +
    '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(BA.MASCARACC), ''-'')-1), ''0''), 12, ''0'')  ' + #13#10 +
    '       END ||--CONTA_CLI,                                                                                 ' + #13#10 +
    '       CASE                                                                                               ' + #13#10 +
    '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                         ' + #13#10 +
    '           '' ''                                                                                          ' + #13#10 +
    '         ELSE                                                                                             ' + #13#10 +
    '           NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), INSTR(TRIM(BA.MASCARACC), ''-''), 1), '' '')  ' + #13#10 +
    '       END ||--DV_CC,                                                                                     ' + #13#10 ;
    //C·ssio Rovaroto  - SIG n∫ 114764 - InÌcio
    if (rDadosParamConv.sNumBanco =  '001') then
      sSql := sSql + '       ''0'' ||--DV_AG_CC,                                                               ' + #13#10
    else
      sSql := sSql + '       '' '' ||--DV_AG_CC,                                                                                ' + #13#10 ;
  sSql := sSql +  '       RPAD(UPPER(TRANSLATE(TRIM(P.NOME) ||'' - ''|| TRIM(P.RAZAOSOCIAL), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')), 30) ||--NOME_EMPRESA,  ' + #13#10;
    //C·ssio Rovaroto  - SIG n∫ 114764 - Fim
  sSql := sSql + Quotedstr(_CompletaEspacoDir(rDadosParamConv.sNomeBanco, 30)) + '||' + #13#10 +
    '       RPAD('' '', 10) ||--FILLER,                                                                        ' + #13#10 +
    '       ''1'' ||--REM_RET,                                                                                 ' + #13#10 +
    '       TO_CHAR(SYSDATE, ''DDMMYYYYHH24MISS'') ||--DT_HORA_ARQ, --CAMPOS 0.23 e 0.24                       ' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pNSA, 6)) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(rDadosParamConv.sVerLeiauteArq, 3)) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(rDadosParamConv.sDensidade, 5)) + '||' + #13#10 +
    '       RPAD('' '', 20) ||--RESERVADO_BANCO,                                                               ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 74164 - InÌcio
    //'       RPAD('' '', 20) ||--RESERVADO_EMPRESA,                                                             ' + #13#10 +
    '       ''H'' || RPAD(' + pIdArqPagto + ', 19, '' '') ||--RESERVADO_EMPRESA,                               ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 74164 - Fim
    '       RPAD('' '', 11) ||--USO_FEBRA,                                                                     ' + #13#10 +
    '       RPAD('' '', 3) ||--ID_COBRANCA,                                                                    ' + #13#10 +
    '       LPAD(''0'', 3, ''0'') ||--VANS,                                                                    ' + #13#10 ;
    //C·ssio Rovaroto - SIG n∫ 114764 - InÌcio
    if (rDadosParamConv.sNumBanco = '001') then
    begin
      sSql := sSql + '       ''00'' ||--TIP_SERVICO,                                                          ' + #13#10 +
      '       ''0000000000'' --SEM_PAPEL                                                                      ' + #13#10 ;
    end
    else
    begin
      sSql := sSql + '       RPAD('' '', 2) ||--TIP_SERVICO,                                                   ' + #13#10 +
      '       RPAD('' '', 10) --SEM_PAPEL                                                                      ' + #13#10 ;
    end;
    sSql := sSql +'        AS LINHACABECARQ                                                                    ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 114764 - Fim
    ' FROM PESSOA P                                                                                            ' + #13#10 +
    ' JOIN PORTADORFORMA PO ON PO.IDPESSOA = P.IDPESSOA                                                        ' + #13#10 +
    ' JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                 ' + #13#10 +
    ' JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                    ' + #13#10 +
    ' JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                ' + #13#10 +
    ' JOIN CONTABANCARIA CO ON CO.IDAGENCIA = AG.IDPESSOA AND CO.IDPESSOA = P.IDPESSOA                         ' + #13#10 +
    'WHERE PO.CODPORTFORMA = ' + pCodPortForma + #13#10 +
    '      AND PO.RECPAG = ''P''                                                                                   ';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosCabecArq.txt');
End;

Function TCtrlRemessaEletronica._SelecionaDadosRodapeArq(pQtdLotesArq, pQtdRegsArq: String): Olevariant;
Var sSql: String;
Begin
  sSql := 'SELECT ' + Quotedstr(rDadosParamConv.sNumBanco) + '|| /*BANCO,*/                                       ' + #13#10 +
    '       LPAD(''9'', 4, ''9'') ||/*LOTE,*/                                                                     ' + #13#10 +
    '       ''9'' ||/*REG,*/                                                                                      ' + #13#10 +
    '       RPAD('' '', 9) ||/*USO_FEBRA,*/                                                                       ' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pQtdLotesArq, 6)) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pQtdRegsArq, 6)) + '||' + #13#10 +
    '       LPAD(''0'', 6, ''0'') || /*QTD_CONTAS_CONCILIACAO,*/                                                  ' + #13#10 +
    '       RPAD('' '', 205) /*USO_FEBRA2*/ AS LINHARODAPEARQ                                                     ' + #13#10 +
    'FROM DUAL ';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosRodapeArq.txt');
End;

Function TCtrlRemessaEletronica._SelecionaDadosCabecLote(pCodPortForma, pSeqLote, pFormaLanc, pTipCompromisso, pTipoServico: String): Olevariant;
Var sSql: String;
Begin
  {
  NOTA 2: TIPO DE SERVI«O
  '00' = Optantes                                    '60' = Pagamento Despesas Viajante em Tr‚nsito
  '05' = DÈbitos/Recebimentos                        '70' = Pagamento Autorizado
  '10' = Pagamento de Dividendos                     '75' = Pagamento Credenciados
  '20' = Pagamento Fornecedor                        '80' = Pagamento Representantes/Vendedores Autorizados
  '30' = Pagamento Sal·rios                          '90' = Pagamento BenefÌcios
  '50' = Pagamento Sinistros Segurados               '98' = Pagamento Diversos

  NOTA 3: FORMA DE LAN«AMENTO
  '01' = CrÈdito em C/C CAIXA                        '02' = Cheque pagamento/administrativo
  '03' = DOC                                         '05' = CrÈdito em Conta PoupanÁa
  '10' = OP a disposiÁ„o                             '11' = Pagamento de contas e tributos com cÛdigo de barras
  '16' = Pagamento de DARF Sem Barras (Segmento ìNî) '17' = Pagamento de GPS Sem Barras (Segmento ìNî)
  '30' = LiquidaÁ„o de tÌtulos do prÛprio banco      '31' = Pagamento de TÌtulos de outros Bancos
  '41' = TED                                         '43' = TED mesma titularidade
  '50' = DÈbito em conta corrente - recebimento      '99' = Pagamento de Concession·rias (Segmento "K")

  NOTA 4: TIPO DE COMPROMISSO
  '01' = Pagamento ‡ Fornecedor                      '06' = Sal·rio AmpliaÁ„o de Base
  '02' = Pagamento de Sal·rios                       '11' = DÈbito em Conta
  '03' = Autopagamento
  }

  sSql := 'SELECT ' + Quotedstr(rDadosParamConv.sNumBanco) + ' || --BANCO,                                               ' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pSeqLote, 4)) + '||' + #13#10 +
    '       ''1'' ||--REG,                                                                                               ' + #13#10;
  sSql := sSql + Quotedstr(rDadosParamConv.sTipoOper) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pTipoServico, 2)) + '||' + #13#10; // NOTA 2
  sSql := sSql + Quotedstr(_CompletaEspacoDir(pFormaLanc, 2)) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(rDadosParamConv.sVerLeiauteLote, 3)) + '||' + #13#10 +
    '       '' '' ||--FILLER,                                                                                            ' + #13#10 +
    '       DECODE(LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') ||--TIP_INSC,  ' + #13#10 + // Paulo Nobre - WO33342
  //C·ssio Rovaroto -  SIG n∫ 114764 - InÌcio
    '       LPAD(REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]''), 14, ''0'') ||--NUM_INSC,                              ' + #13#10;  // Paulo Nobre - WO33342
  if (rDadosParamConv.sNumBanco = '001') then
  begin
    sSql := sSql + '       LPAD(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), 9, ''0'') ||--COD_CONV,                    ' + #13#10;
    sSql := sSql + '       ''0126'' ||                                                                                 ' + #13#10;
    sSql := sSql + '       RPAD('' '', 5) ||                                                                           ' + #13#10;

    if Copy(UpperCase(Sistema.AliasServidor), 1, 8) = 'PRODUCAO' then
      sSql := sSql + '     RPAD('' '', 2) ||                                                                             ' + #13#10
    else
      sSql := sSql + '     ''TS'' ||                                                                                     ' + #13#10;
  end
  else
  begin
    sSql := sSql + '       LPAD(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), 6, ''0'') ||--COD_CONV,                      ' + #13#10 +
    Quotedstr(_CompletaZeroEsq(pTipCompromisso, 2)) + '||                                                                ' + #13#10 + // NOTA 4
    Quotedstr(_CompletaZeroEsq(rDadosParamConv.sCodCompromisso, 4)) + '||                                                ' + #13#10 +
    Quotedstr(_CompletaEspacoDir(rDadosParamConv.sParamTrans, 2)) + '||                                                  ' + #13#10 +
    '       RPAD('' '', 6) ||--FILLER,                                                                                   ' + #13#10;
  end;
  //C·ssio Rovaroto - SIG n∫ 114764 - Fim
    sSql := sSql +  '       CASE                                                                                                         ' + #13#10 +
    '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                              ' + #13#10 +
    '           LPAD(NVL(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), ''0''), 5, ''0'')                                        ' + #13#10 +
    '         ELSE                                                                                                       ' + #13#10 +
    '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(BA.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')  ' + #13#10 +
    '       END ||--AGENCIA,                                                                                             ' + #13#10 +

//Ewerton Beltramini - 05/03/2021 - SIG 114142 - Inicio.............................................................................
    '       CASE WHEN (AG.NUMAGENCIA <> 24585) THEN                                                         ' + #13#10 +
    '            	(CASE WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN ''0''                                    ' + #13#10 +
    '              ELSE NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), INSTR(TRIM(BA.MASCARAAGENCIA), ''-''), 1), ''0'')	END)   ' + #13#10 +
    '       ELSE ''9'' END ||--DV_AG,                                                                              ' + #13#10 +    
(*
    '       /*CASE                                                                                                       ' + #13#10 +
    '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                              ' + #13#10 +
    '           '' ''                                                                                                    ' + #13#10 +
    '         ELSE                                                                                                       ' + #13#10 +
    '           NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), INSTR(TRIM(BA.MASCARAAGENCIA), ''-''), 1), '' '')      ' + #13#10 +
    '       END ||DV_AG,*/                                                                                               ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 64891 - InÌcio
    //'       '' '' ||--DV_AG,                                                                                             ' + #13#10 +
    '       ''9'' ||--DV_AG,                                                                                             ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 64891 - Fim
*)
//Ewerton Beltramini - 05/03/2021 - SIG 114142 - Fim................................................................................  

    '       CASE                                                                                                         ' + #13#10 +
    '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                                   ' + #13#10 +
    '           LPAD(NVL(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), ''0''), 12, ''0'')                                    ' + #13#10 +
    '         ELSE                                                                                                       ' + #13#10 +
    '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(BA.MASCARACC), ''-'')-1), ''0''), 12, ''0'')  ' + #13#10 +
    '       END ||--CONTA,                                                                                               ' + #13#10 +
    '       CASE                                                                                                         ' + #13#10 +
    '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                                   ' + #13#10 +
    '           '' ''                                                                                                    ' + #13#10 +
    '         ELSE                                                                                                       ' + #13#10 +
    '           NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), INSTR(TRIM(BA.MASCARACC), ''-''), 1), '' '')        ' + #13#10 +
    '       END ||--DV_CC,                                                                                               ' + #13#10 ;
    //C·ssio Rovaroto - SIG n∫ 114764 - InÌcio
    if (rDadosParamConv.sNumBanco =  '001') then
      sSql := sSql + '       ''0'' ||--DV_AG_CC,                                                                         ' + #13#10
    else
      sSql := sSql + '       '' '' ||--DV_AG_CC,                                                                         ' + #13#10 ;
    sSql := sSql + '       RPAD(UPPER(TRANSLATE(TRIM(P.NOME) ||'' - ''|| TRIM(P.RAZAOSOCIAL), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')), 30) ||--NOME_EMPRESA,  ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 114764 - Fim
    '       RPAD('' '', 40) ||--MSG_AVISO1,                                                                              ' + #13#10 +
    '       RPAD(NVL(TRIM(ED.LOGRADOURO), '' ''), 30) ||--LOGRADOURO,                                                    ' + #13#10 +
    '       LPAD(NVL(TRIM(ED.NUMERO), ''0''), 5, ''0'') ||--NUM_LOCAL,                                                   ' + #13#10 +
    '       RPAD(NVL(TRIM(ED.COMPLEMENTO), '' ''), 15) ||--COMPL_LOGRADOURO,                                             ' + #13#10 +
    '       RPAD(NVL(TRIM(C.NOME), '' ''), 20) ||--CIDADE,                                                               ' + #13#10 +
    '       LPAD(NVL(TRIM(ED.CEP), ''0''), 5, ''0'') ||--CEP,                                                            ' + #13#10 +
    '       RPAD(NVL(SUBSTR(TRIM(ED.CEP), 6, 3), '' ''), 3) ||--COMPL_CEP,                                               ' + #13#10 +
    '       RPAD(NVL(TRIM(C.UF), '' ''), 2) ||--UF,                                                                      ' + #13#10 +
    '       RPAD('' '', 8) ||--USO_FEBRA,                                                                                ' + #13#10 ;
    //C·ssio Rovaroto - SIG n∫ 114764 - InÌcio
    if (rDadosParamConv.sNumBanco =  '001') then
      sSql := sSql + '       ''0000000000'' /*OCORRENCIAS*/ AS LINHACABECLOTE                                            ' + #13#10
    else
      sSql := sSql + '       RPAD('' '', 10) /*OCORRENCIAS*/ AS LINHACABECLOTE                                           ' + #13#10;
    sSql := sSql + '  FROM PESSOA P                                                                                      ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 114764 - Fim
    '  JOIN PORTADORFORMA PO ON PO.IDPESSOA = P.IDPESSOA                                                                 ' + #13#10 +
    '  JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                          ' + #13#10 +
    '  JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                             ' + #13#10 +
    '  JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                         ' + #13#10 +
    '  JOIN CONTABANCARIA CO ON CO.IDAGENCIA = AG.IDPESSOA AND CO.IDPESSOA = P.IDPESSOA                                  ' + #13#10 +
    '  LEFT JOIN (SELECT MAX(E.IDENDERECO) MAX_ID,                                                                       ' + #13#10 +
    '                    E.IDPESSOA                                                                                      ' + #13#10 +
    '             FROM ENDPESS E                                                                                         ' + #13#10 +
    '             GROUP BY E.IDPESSOA) MAX_END ON P.IDPESSOA = MAX_END.IDPESSOA                                          ' + #13#10 +
    '  LEFT JOIN ENDPESS ED ON ED.IDENDERECO = MAX_END.MAX_ID                                                            ' + #13#10 +
    '  LEFT JOIN CIDADES C ON C.IDCIDADES = ED.IDCIDADES                                                                 ' + #13#10 +
    ' WHERE PO.CODPORTFORMA = ' + pCodPortForma                                                                            + #13#10 +
    '   AND PO.RECPAG = ''P''                                                                                            ';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosCabecLote.txt');
End;

Function TCtrlRemessaEletronica._SelecionaDadosRodapeLote(pSeqLote, pQtdRegsLote, pVlrTotalLote: String): Olevariant;
Var sSql: String;
Begin
  sSql := 'SELECT ' + Quotedstr(rDadosParamConv.sNumBanco) + '|| /*BANCO,*/                                          ' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pSeqLote, 4)) + '||' + #13#10 +
    '       ''5'' ||/*REG,*/                                                                                         ' + #13#10 +
    '       RPAD('' '', 9) ||/*USO_FEBRA,*/                                                                          ' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pQtdRegsLote, 6)) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pVlrTotalLote, 18)) + '||' + #13#10 +
    '       LPAD(''0'', 18, ''0'') ||/*SUM_QTD_MOEDA,*/                                                              ' + #13#10 +
    '       LPAD(''0'', 6, ''0'') ||/*N_AVISO_DEBITO,*/                                                              ' + #13#10 +
    '       RPAD('' '', 165) ||/*USO_FEBRA2,*/                                                                       ' + #13#10 ;
  //C·ssio Rovaroto - SIG n∫ 114764 - InÌcio
  if (rDadosParamConv.sNumBanco = '001') then
    sSql := sSql + '       ''0000000000'' /*OCORRENCIAS*/ AS LINHARODAPELOTE                                         ' + #13#10
  else
    sSql := sSql + '       RPAD('' '', 10) /*OCORRENCIAS*/ AS LINHARODAPELOTE                                        ' + #13#10 ;
  sSql := sSql + '  FROM DUAL ';
  //C·ssio Rovaroto - SIG n∫ 114764 - Fim
  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosRodapeLote.txt');
End;

Function TCtrlRemessaEletronica._SelMovPeloTipoDaFormaPagamento_LA(pIdArqPagto, pTipFormaRecPag, pFormaLanc, pFinalidadeDOC, pSeqLote: String): Olevariant;
Var sSql: String;
Begin
  sSql := 'SELECT REG || LPAD(ROWNUM, 5, ''0'')  || DETALHE_A AS LINHAMOVLOTE, VALOR                             ' + #13#10 +
    '  FROM (                                                                                                    ' + #13#10 +
    'SELECT ''3'' ORDEM,                                                                                         ' + #13#10 +
    '       DET_A.CODDOCARQ "ORDEM1",                                                                            ' + #13#10 +
    '       ''A'' "ORDEM2",                                                                                      ' + #13#10;
  sSql := sSql + Quotedstr(rDadosParamConv.sNumBanco) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pSeqLote, 4)) + '||' + #13#10 +
    '       ''3'' REG,                                                                                           ' + #13#10 +
    '       NULL NSR, --DEVER¡ SER GERAL DO LOTE, Reiniciando a cada lote gerado                                 ' + #13#10 +
    '       ''A'' ||--SEG,                                                                                       ' + #13#10 +
    '       ''0'' ||--TIPO_MOV, --0 = Inclus„o, 9 = Exclus„o.                                                    ' + #13#10 +
    '       LPAD(''0'', 2, ''0'') ||--COD_INST,                                                                  ' + #13#10 +
    '       DECODE(' + quotedstr(pFormaLanc) + ', ''41'', ''018'', ''700'') ||--CAMARA_COMP, -- ''018'' = TED, ''700'' = DOC (C. Corrente e C. PoupanÁa Caixa, conforme Nexxera)   ' + #13#10 +
    '       LPAD(DET_A.NUMBANCO, 3, ''0'') ||--BANCO_CLI,                                                        ' + #13#10 +
    '       CASE                                                                                                 ' + #13#10 +
    '         WHEN DET_A.MASCARAAGENCIA IS NULL THEN                                                             ' + #13#10 +
    '           CASE                                                                                             ' + #13#10 +
    '             WHEN INSTR(DET_A.NUMAGENCIA, ''-'') = 0 THEN                                                   ' + #13#10 +
    '               LPAD(NVL(DET_A.NUMAGENCIA, 0), 5, ''0'')                                                     ' + #13#10 +
    '             ELSE                                                                                           ' + #13#10 +
    '               LPAD(NVL(SUBSTR(DET_A.NUMAGENCIA, 0, INSTR(DET_A.NUMAGENCIA, ''-'')-1), 0), 5, ''0'')        ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '         WHEN INSTR(DET_A.MASCARAAGENCIA, ''-'') = 0 THEN                                                   ' + #13#10 +
    '           LPAD(NVL(DET_A.NUMAGENCIA, 0), 5, ''0'')                                                         ' + #13#10 +
    '         ELSE                                                                                               ' + #13#10 +
    '           LPAD(NVL(SUBSTR(DET_A.NUMAGENCIA, 0, INSTR(TRIM(DET_A.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')  ' + #13#10 +
    '       END ||--AGENCIA_CLI,                                                                                 ' + #13#10 +
    '       CASE                                                                                                 ' + #13#10 +
    '         WHEN DET_A.MASCARAAGENCIA IS NULL THEN                                                             ' + #13#10 +
    '           CASE                                                                                             ' + #13#10 +
    '             WHEN INSTR(DET_A.NUMAGENCIA, ''-'') = 0 THEN                                                   ' + #13#10 +
    '               '' ''                                                                                        ' + #13#10 +
    '             ELSE                                                                                           ' + #13#10 +
    '               NVL(SUBSTR(DET_A.NUMAGENCIA, INSTR(DET_A.NUMAGENCIA, ''-'')+1, 1), '' '')                    ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '         WHEN INSTR(DET_A.MASCARAAGENCIA, ''-'') = 0 THEN                                                   ' + #13#10 +
    '           '' ''                                                                                            ' + #13#10 +
    '         ELSE                                                                                               ' + #13#10 +
    '           NVL(SUBSTR(DET_A.NUMAGENCIA, INSTR(TRIM(DET_A.MASCARAAGENCIA), ''-''), 1), '' '')                ' + #13#10 +
    '         END ||--DV_AG,                                                                                     ' + #13#10 +
    '       CASE                                                                                                 ' + #13#10 +
    '         WHEN DET_A.MASCARACC IS NULL THEN                                                                  ' + #13#10 +
    '           CASE                                                                                             ' + #13#10 +
    '             WHEN INSTR(DET_A.CONTACORRENTE, ''-'') = 0 THEN                                                ' + #13#10 +
    '               LPAD(NVL(DET_A.CONTACORRENTE, 0), 12, ''0'')                                                 ' + #13#10 +
    '             ELSE                                                                                           ' + #13#10 +
    '               LPAD(NVL(SUBSTR(DET_A.CONTACORRENTE, 0, INSTR(DET_A.CONTACORRENTE, ''-'')-1), 0), 12, ''0'') ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '         WHEN INSTR(DET_A.MASCARACC, ''-'') = 0 THEN                                                        ' + #13#10 +
    '           LPAD(NVL(DET_A.CONTACORRENTE, 0), 12, ''0'')                                                     ' + #13#10 +
    '         ELSE                                                                                               ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 73883 - InÌcio
    //Tratamento de formataÁ„o para contas do HSBC
    //'           LPAD(NVL(SUBSTR(DET_A.CONTACORRENTE, 0, INSTR(TRIM(DET_A.MASCARACC), ''-'')-1), 0), 12, ''0'')   ' + #13#10 +
    '           CASE                                                                                               ' + #13#10 +
    '             WHEN LPAD(DET_A.NUMBANCO, 3, ''0'') = ''399'' THEN                                               ' + #13#10 +
    '               LPAD(NVL(SUBSTR(DET_A.CONTACORRENTE, 0, INSTR(TRIM(DET_A.MASCARACC), ''-'')), 0), 12, ''0'')   ' + #13#10 +
    '             ELSE                                                                                             ' + #13#10 +
    '               LPAD(NVL(SUBSTR(DET_A.CONTACORRENTE, 0, INSTR(TRIM(DET_A.MASCARACC), ''-'')-1), 0), 12, ''0'') ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '         END ||--CONTA_CLI,                                                                                 ' + #13#10 +
    '       CASE                                                                                                 ' + #13#10 +
    '         WHEN DET_A.MASCARACC IS NULL THEN                                                                  ' + #13#10 +
    '           CASE                                                                                             ' + #13#10 +
    '             WHEN INSTR(DET_A.CONTACORRENTE, ''-'') = 0 THEN                                                ' + #13#10 +
    '               '' ''                                                                                        ' + #13#10 +
    '             ELSE                                                                                           ' + #13#10 +
    '               NVL(SUBSTR(DET_A.CONTACORRENTE, INSTR(DET_A.CONTACORRENTE, ''-'')+1, 1), '' '')              ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '         WHEN INSTR(DET_A.MASCARACC, ''-'') = 0 THEN                                                        ' + #13#10 +
    '           '' ''                                                                                            ' + #13#10 +
    '         ELSE                                                                                               ' + #13#10 +
    //Tratamento de formataÁ„o para de DV de contas do HSBC
    //'           NVL(SUBSTR(DET_A.CONTACORRENTE, INSTR(TRIM(DET_A.MASCARACC), ''-''), 1), '' '')                  ' + #13#10 +
    '           CASE                                                                                             ' + #13#10 +
    '             WHEN LPAD(DET_A.NUMBANCO, 3, ''0'') = ''399'' THEN                                             ' + #13#10 +
    '               NVL(SUBSTR(DET_A.CONTACORRENTE, INSTR(TRIM(DET_A.MASCARACC), ''-'')+1, 1), '' '')            ' + #13#10 +
    '             ELSE                                                                                           ' + #13#10 +
    '               NVL(SUBSTR(DET_A.CONTACORRENTE, INSTR(TRIM(DET_A.MASCARACC), ''-''), 1), '' '')              ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '       END ||--DV_CC,                                                                                       ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 73883 - Fim
    '       '' '' ||--DV_AG_CC,                                                                                  ' + #13#10 +
    '       RPAD(DET_A.RAZAOSOCIAL, 30) ||--NOME_TERC,                                                           ' + #13#10 +
    '       LPAD(DET_A.CODDOCARQ, 6, ''0'') ||--NUM_DOC,                                                         ' + #13#10 +
    '       RPAD('' '', 13) ||--FILLER,                                                                          ' + #13#10 +
    '       DECODE(DET_A.TIPOCONTA, 1, 1, 3, 2, 0) ||--TIP_CC, /*NOTA 5*/                                        ' + #13#10 +
    '       TO_CHAR(DET_A.DATAPROGRAMADA, ''DDMMYYYY'') ||--DT_VCTO,                                             ' + #13#10 +
    '       ''BRL'' ||--TIP_MOEDA, /*NOTA 6*/                                                                    ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--QTD_MOEDA,                                                                ' + #13#10 +
    '       LPAD(LTRIM(REPLACE(TO_CHAR(DET_A.VALOR, ''999999999999D99''), '','', '''')), 15, ''0'') ||--VALOR,   ' + #13#10 +
    '       LPAD(''0'', 9, ''0'') ||--NUM_DOC_BANCO,                                                             ' + #13#10 +
    '       RPAD('' '', 3) ||--FILLER,                                                                           ' + #13#10 +
    '       ''01'' ||--QTD_PARC,                                                                                 ' + #13#10 +
    '       ''N'' ||--BLOQ_DMAISPARC,                                                                            ' + #13#10 +
    '       ''1'' ||--FORMA_PARC, /*NOTA 7*/   /*Conforme Nexxera*/                                              ' + #13#10 +
    '       TO_CHAR(DET_A.DATAPROGRAMADA, ''DD'') ||--PERIODO_DIA_VCTO, /*NOTA 8*/ /*Conforme Nexxera*/          ' + #13#10 +
    '       LPAD(''0'', 2, ''0'') ||--NUM_PARC,                                                                  ' + #13#10 +
    '       LPAD(''0'', 8, ''0'') ||--DT_EFET,                                                                   ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--VLR_EFET,                                                                 ' + #13#10 +
    '       RPAD('' '', 40) ||--INFO2,                                                                           ' + #13#10 +
    '       DECODE(' + quotedstr(pFormaLanc) + ', ''03'', ' + quotedstr(rDadosParamConv.sFinalidadeDOC) + ', ''00'') ||--FINALIDADE_DOC, /*NOTA 9*/    ' + #13#10 +
    '       RPAD('' '', 10) ||--USO_FEBRA,                                                                       ' + #13#10 +
    '       ''0'' ||--EMITE_AVISO,                                                                               ' + #13#10 +
    '       RPAD('' '', 10) DETALHE_A,--OCORRENCIAS                                                              ' + #13#10 +
    '       DET_A.VALOR                                                                                          ' + #13#10 +
    '  FROM (                                                                                                    ' + #13#10 +
    'SELECT AX.CODDOCARQ,                                                                                        ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 2, D2.DATAPROGRAMADA) DATAPROGRAMADA,                          ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.MASCARACC, 2, D2.MASCARACC) MASCARACC,                                         ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.MASCARAAGENCIA, 2, D2.MASCARAAGENCIA) MASCARAAGENCIA,                          ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.TIPOCONTA, 2, D2.TIPOCONTA) TIPOCONTA,                                         ' + #13#10 +
    '       UPPER(TRANSLATE(TRIM(DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 2, D2.RAZAOSOCIAL)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL,   ' + #13#10 +
    '       AX.VALOR,                                                                                             ' + #13#10 +
    '       REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO), ''\D'') NUMBANCO,                    ' + #13#10 +
    '       CASE AX.TIPO                                                                                         ' + #13#10 +
    '         WHEN ''1'' THEN                                                                                    ' + #13#10 +
    '           REGEXP_REPLACE(D1.NUMAGENCIA, ''\W'')                                                            ' + #13#10 +
    '         WHEN ''2'' THEN                                                                                    ' + #13#10 +
    '           DECODE(D2.FLGIMPORTADO, ''N'', REGEXP_REPLACE(D2.NUMAGENCIA, ''\W''), REGEXP_REPLACE(D2.NUMAGENCIA, ''\s''))  ' + #13#10 +
    '       END NUMAGENCIA,                                                                                      ' + #13#10 +
    '       CASE AX.TIPO                                                                                         ' + #13#10 +
    '         WHEN ''1'' THEN                                                                                    ' + #13#10 +
    '           REGEXP_REPLACE(D1.CONTACORRENTE, ''\D'')                                                         ' + #13#10 +
    '         WHEN ''2'' THEN                                                                                    ' + #13#10 +
    '           DECODE(D2.FLGIMPORTADO, ''N'', REGEXP_REPLACE(D2.CONTACORRENTE, ''\D''), REGEXP_REPLACE(D2.CONTACORRENTE, ''\s''))  ' + #13#10 +
    '       END CONTACORRENTE                                                                                    ' + #13#10 +
    '  FROM ARQUIVOXDOCUM AX                                                                                     ' + #13#10 +
    '  LEFT JOIN (                                                                                               ' + #13#10 +
    'SELECT DI1.CODDOCUMENTO, DI1.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL,                        ' + #13#10 +
    '       B.MASCARAAGENCIA, B.MASCARACC, C.TIPOCONTA, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE--, FO.DESCRICAO FORMA_PAGTO  ' + #13#10 +
    '  FROM DOCUMENTO DI1                                                                                        ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI                                                                ' + #13#10 +
    '  JOIN CONTABANCARIA C ON C.IDCBANCARIA = DI1.IDCBANCARIA                                                   ' + #13#10 +
    '  JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA                                                        ' + #13#10 +
    '  JOIN BANCO B ON B.IDPESSOA = A.IDBANCO                                                                    ' + #13#10 +
    '            ) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1                           ' + #13#10 +
    '  LEFT JOIN (                                                                                               ' + #13#10 +
    'SELECT DP.IDDOCUMENTOXPESSOAS, DI2.DATAPROGRAMADA, DP.RAZAOSOCIAL,                                          ' + #13#10 +

    // Paulo Nobre - WO24848 - Inicio
    '       MANUAL.MASCARAAGENCIA, MANUAL.MASCARACC, DP.TIPOCONTA, DP.NUMBANCO, DP.NUMAGENCIA,                   ' + #13#10 +
//    '       DP.NUMOPERACAO || DP.NUMCONTA CONTACORRENTE,                                                         ' + #13#10 +
    '       CASE                                                                      ' + #13#10 +
    '          WHEN LENGTH(DP.NUMOPERACAO) >= 3 THEN (DP.NUMOPERACAO || DP.NUMCONTA)  ' + #13#10 +
    '        	ELSE DP.NUMCONTA                                                       ' + #13#10 +
    '       END CONTACORRENTE,                                                        ' + #13#10 +
    // Paulo Nobre - WO24848 - Fim

    '       DP.FLGIMPORTADO                                                                                      ' + #13#10 +
    '       , DP.VALOR, DP.IDPLANOPREV                                                                           ' + #13#10 +
    '  FROM DOCUMENTO DI2                                                                                        ' + #13#10 +
    '  JOIN DOCUMENTOXPESSOAS DP ON DI2.CODDOCUMENTO = DP.CODDOCUMENTO                                           ' + #13#10 +
    '  LEFT JOIN (SELECT B.MASCARACC,                                                                            ' + #13#10 +
    '                    B.MASCARAAGENCIA,                                                                       ' + #13#10 +
    '                    C.IDCBANCARIA                                                                           ' + #13#10 +
    '             FROM CONTABANCARIA C                                                                           ' + #13#10 +
    '             JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA                                             ' + #13#10 +
    '             JOIN BANCO B ON B.IDPESSOA = A.IDBANCO) MANUAL ON MANUAL.IDCBANCARIA = DP.IDCBANCARIA          ' + #13#10 +
    '            ) D2 ON D2.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2                    ' + #13#10 +
    ' WHERE AX.TIPO IN (1, 2) /*1=DOCUMENTO, 2=LISTA DE PESSOAS*/                                                ' + #13#10;

  If (pFormaLanc = '03') Or (pFormaLanc = '41') Then // '03' - DOC, '41' - TED
    sSql := sSql + '  AND REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO), ''\D'') <> ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10
  Else
    Begin
      sSql := sSql + '  AND REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO), ''\D'') = ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10;
      If (pFormaLanc = '01') Then // Conta Corrente
        sSql := sSql + '  AND DECODE(AX.TIPO, 1, D1.TIPOCONTA, 2, D2.TIPOCONTA) = ''1'' ' + #13#10
      Else If (pFormaLanc = '05') Then // PoupanÁa
        sSql := sSql + '  AND DECODE(AX.TIPO, 1, D1.TIPOCONTA, 2, D2.TIPOCONTA) = ''3'' ' + #13#10;
    End;

  sSql := sSql + ' AND EXISTS (SELECT 1                                                                          ' + #13#10 +
    '                          FROM FORMARECPAGXTIPOFORMARECPAG FXF                                              ' + #13#10 +
    '                          WHERE FXF.CODFORMA = AX.CODFORMA                                                  ' + #13#10 +
    '                                AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')                        ' + #13#10 +
    '   AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') DET_A                                                       ' + #13#10 +
    ' UNION ALL                                                                                                  ' + #13#10 +
    '--DETALHE B                                                                                                 ' + #13#10 +
    'SELECT ''3'' ORDEM,                                                                                         ' + #13#10 +
    '       MESMAQRY_A.CODDOCARQ "ORDEM1",                                                                       ' + #13#10 +
    '       ''B'' "ORDEM2",                                                                                      ' + #13#10;
  sSql := sSql + Quotedstr(rDadosParamConv.sNumBanco) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pSeqLote, 4)) + '||' + #13#10 +
    '       ''3'' REG,                                                                                           ' + #13#10 +
    '       NULL NSR, -- DEVER¡ SER GERAL DO LOTE                                                                ' + #13#10 +
    '       ''B'' ||--SEG,                                                                                       ' + #13#10 +
    '       RPAD('' '', 3) ||--USO_FEBRA,                                                                        ' + #13#10 +
    '       MESMAQRY_A.TIPO ||--TIP_INSC,                                                                        ' + #13#10 +
    '       LPAD(MESMAQRY_A.NUMDOCUMENTO, 14, ''0'') ||--NUM_INSC,                                               ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 67165 - AlteraÁ„o do formato dos campos a apresentar
    '       RPAD(NVL(UPPER(TRIM(REGEXP_REPLACE(ED.LOGRADOURO, ''( *[[:punct:]])'', '' ''))), '' ''), 30) ||--LOGRADOURO, ' + #13#10 +
    '       LPAD(NVL(TRIM(REGEXP_REPLACE(ED.NUMERO, ''( *[[:punct:] [:alpha:] [:space:]])'', '' '')     ), 0), 5, ''0'') ||--NUM_LOCAL, ' + #13#10 +
    '       RPAD(NVL(UPPER(TRIM(REGEXP_REPLACE(ED.COMPLEMENTO, ''( *[[:punct:]])'', '' ''))), '' ''), 15) ||--COMPL, ' + #13#10 +
    '       RPAD(NVL(UPPER(TRIM(REGEXP_REPLACE(ED.BAIRRO, ''( *[[:punct:]])'', '' ''))), '' ''), 15) ||--BAIRRO, ' + #13#10 +
    '       RPAD(NVL(UPPER(TRIM(REGEXP_REPLACE(C.NOME, ''( *[[:punct:]])'', '' ''))), '' ''), 20) ||--CIDADE,    ' + #13#10 +
    '       LPAD(NVL(TRIM(ED.CEP), 0), 5, ''0'') ||--CEP,                                                        ' + #13#10 +
    '       RPAD(NVL(SUBSTR(TRIM(ED.CEP), 6, 3), '' ''), 3) ||--COMPL_CEP,                                       ' + #13#10 +
    '       RPAD(NVL(TRIM(C.UF), '' ''), 2) ||--UF,                                                              ' + #13#10 +
    '       TO_CHAR(MESMAQRY_A.DATAPROGRAMADA, ''DDMMYYYY'') ||--DT_VCTO,                                        ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--VLR_DOC,                                                                  ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--VLR_ABAT,                                                                 ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--VLR_DESC,                                                                 ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--VLR_MORA,                                                                 ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--VLR_MULTA,                                                                ' + #13#10 +
    '       RPAD('' '', 15) ||--COD_DOC,                                                                         ' + #13#10 +
    '       RPAD('' '', 15) DETALHE_B, --USO_FEBRA                                                               ' + #13#10 +
    '       0.00 VALOR                                                                                           ' + #13#10 +
    '  FROM (                                                                                                    ' + #13#10 +
    'SELECT AX.CODDOCARQ,                                                                                        ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.IDFORCLI, 2, D2.IDFORCLI) IDFORCLI,                                            ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 2, D2.DATAPROGRAMADA) DATAPROGRAMADA,                          ' + #13#10 +
    '       REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO), ''[^A-Za-z0-9]'') NUMDOCUMENTO, ' + #13#10 +   // Paulo Nobre - WO33342
    '       DECODE(LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO), ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') TIPO  ' + #13#10 + // Paulo Nobre - WO33342
    '  FROM ARQUIVOXDOCUM AX                                                                                     ' + #13#10 +
    '  LEFT JOIN (                                                                                               ' + #13#10 +
    'SELECT DI1.CODDOCUMENTO, DI1.IDFORCLI, DI1.DATAPROGRAMADA, P.NUMDOCUMENTO,                                  ' + #13#10 +
    '       B.NUMBANCO, C.TIPOCONTA                                                                              ' + #13#10 +
    '  FROM DOCUMENTO DI1                                                                                        ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI                                                                ' + #13#10 +
    '  JOIN CONTABANCARIA C ON C.IDCBANCARIA = DI1.IDCBANCARIA                                                   ' + #13#10 +
    '  JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA                                                        ' + #13#10 +
    '  JOIN BANCO B ON B.IDPESSOA = A.IDBANCO                                                                    ' + #13#10 +
    '            ) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1                           ' + #13#10 +
    '  LEFT JOIN (                                                                                               ' + #13#10 +
    'SELECT DP.IDDOCUMENTOXPESSOAS, DP.IDFORCLI, DI2.DATAPROGRAMADA, DP.NUMDOCUMENTO,                            ' + #13#10 +
    '       DP.NUMBANCO, DP.TIPOCONTA                                                                            ' + #13#10 +
    '  FROM DOCUMENTO DI2                                                                                        ' + #13#10 +
    '  JOIN DOCUMENTOXPESSOAS DP ON DI2.CODDOCUMENTO = DP.CODDOCUMENTO                                           ' + #13#10 +
    '            ) D2 ON D2.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2                    ' + #13#10 +
    ' WHERE AX.TIPO IN (1, 2) /*1=DOCUMENTO, 2=LISTA DE PESSOAS*/                                                ' + #13#10;

  If (pFormaLanc = '03') Or (pFormaLanc = '41') Then // '03' - DOC, '41' - TED
    sSql := sSql + '  AND REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO), ''\D'') <> ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10
  Else
    Begin
      sSql := sSql + '  AND REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO), ''\D'') = ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10;
      If (pFormaLanc = '01') Then // Conta Corrente
        sSql := sSql + '  AND DECODE(AX.TIPO, 1, D1.TIPOCONTA, 2, D2.TIPOCONTA) = ''1'' ' + #13#10
      Else If (pFormaLanc = '05') Then // PoupanÁa
        sSql := sSql + '  AND DECODE(AX.TIPO, 1, D1.TIPOCONTA, 2, D2.TIPOCONTA) = ''3'' ' + #13#10;
    End;

  sSql := sSql +
    '   AND EXISTS (SELECT 1                                                                                     ' + #13#10 +
    '                 FROM FORMARECPAGXTIPOFORMARECPAG FXF                                                       ' + #13#10 +
    '                WHERE FXF.CODFORMA = AX.CODFORMA                                                            ' + #13#10 +
    '                  AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')                                      ' + #13#10 +
    '   AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') MESMAQRY_A                                                  ' + #13#10 +
    '  LEFT JOIN (SELECT MAX(E.IDENDERECO) MAX_ID,                                                               ' + #13#10 +
    '                    E.IDPESSOA                                                                              ' + #13#10 +
    '               FROM ENDPESS E                                                                               ' + #13#10 +
    '              GROUP BY E.IDPESSOA) MAX_END ON MAX_END.IDPESSOA = MESMAQRY_A.IDFORCLI                        ' + #13#10 +
    '  LEFT JOIN ENDPESS ED ON ED.IDENDERECO = MAX_END.MAX_ID                                                    ' + #13#10 +
    '  LEFT JOIN CIDADES C ON C.IDCIDADES = ED.IDCIDADES                                                         ' + #13#10 +
    ' ORDER BY ORDEM, "ORDEM1", "ORDEM2", IDPLANOPREV)                                                           ';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  //sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LA.txt');                 //Everson Cunha - SIG84050
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LA' + pFormaLanc + '.txt'); //Everson Cunha - SIG84050
End;

Function TCtrlRemessaEletronica._SelMovPeloTipoDaFormaPagamento_LJ(pIdArqPagto, pTipFormaRecPag, pFormaLanc, pSeqLote: String): Olevariant;
Var sSql: String;
Begin
  sSql := 'SELECT ROWNUM AS LINHA, LINHAMOVLOTE, VALOR AS VALOR_LANC                                                    ' + #13#10 +
          'FROM (                                                                                                       ' + #13#10 +
    'SELECT REG || LPAD(ROWNUM, 5, ''0'')  || DETALHE_J AS LINHAMOVLOTE, VALOR                                          ' + #13#10 +
    '  FROM (                                                                                                           ' + #13#10 +
    '--DETALHE J                                                                                                        ' + #13#10 +
    'SELECT ''3'' ORDEM,                                                                                                ' + #13#10 +
    '       DET_J.CODDOCARQ "ORDEM1",                                                                                   ' + #13#10 +
    '       ''J'' "ORDEM2",                                                                                             ' + #13#10;
  sSql := sSql + Quotedstr(rDadosParamConv.sNumBanco) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pSeqLote, 4)) + '||' + #13#10 +
    '       ''3'' REG,                                                                                                  ' + #13#10 +
    '       NULL NSR,                                                                                                   ' + #13#10 +
    '       ''J'' ||--SEG,                                                                                              ' + #13#10 +
    '       ''0'' ||--TIPO_MOV, -- 0 = Inclus„o, 9 = Exclus„o.                                                          ' + #13#10 +
    '       LPAD(''0'', 2, ''0'') ||--COD_INST, -- Nota 11                                                              ' + #13#10 +
    '       SUBSTR(DET_J.NUMLEITCODBARRAS, 0, 3) ||--BANCO,                                                             ' + #13#10 +
    '       SUBSTR(DET_J.NUMLEITCODBARRAS, 4, 1) ||--COD_MOEDA,                                                         ' + #13#10 +
    '       SUBSTR(DET_J.NUMLEITCODBARRAS, 33, 1) ||--DV,                                                               ' + #13#10 +
    '       SUBSTR(DET_J.NUMLEITCODBARRAS, 34, 4) ||--FATOR_VENCTO,                                                     ' + #13#10 +
    '       SUBSTR(DET_J.NUMLEITCODBARRAS, 38, 10) ||--VALOR,                                                           ' + #13#10 +
    '       SUBSTR(DET_J.NUMLEITCODBARRAS, 5, 5) ||                                                                     ' + #13#10 +
    '       SUBSTR(DET_J.NUMLEITCODBARRAS, 11, 10) ||                                                                   ' + #13#10 +
    '       SUBSTR(DET_J.NUMLEITCODBARRAS, 22, 10) ||--CAMPO_LIVRE,                                                     ' + #13#10 +
    '       RPAD(DET_J.RAZAOSOCIAL, 30) ||--CEDENTE,                                                                    ' + #13#10 +
    '       TO_CHAR(DET_J.DATAPROGRAMADA, ''DDMMYYYY'') ||--DT_VCTO,                                                    ' + #13#10 +
    '       LPAD(LTRIM(REPLACE(TO_CHAR((DET_J.VALOR), ''999999999999D99''), '','', '''')), 15, ''0'') ||--VALOR,        ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--VLR_DESCS,                                                                       ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--VLR_MULTA,                                                                       ' + #13#10 +
    '       TO_CHAR(DET_J.DATAPROGRAMADA, ''DDMMYYYY'') ||--DT_PAGTO,                                                   ' + #13#10 +
    '       LPAD(LTRIM(REPLACE(TO_CHAR((DET_J.VALOR), ''999999999999D99''), '','', '''')), 15, ''0'') ||--VLR_PAGTO,    ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--QTD_MOEDAS,                                                                      ' + #13#10 +
    '       LPAD(DET_J.CODDOCARQ, 6, ''0'') ||--NUM_DOC,                                                                ' + #13#10 +
    '       RPAD('' '', 14) ||--FILLER,                                                                                 ' + #13#10 +
    '       LPAD(''0'', 9, ''0'') ||--NUM_ATR_BANCO,                                                                    ' + #13#10 +
    '       RPAD('' '', 11) ||--FILLER,                                                                                 ' + #13#10 +
    '       ''09'' ||--COD_MOEDA,                                                                                       ' + #13#10 +
    '       RPAD('' '', 6) ||--USO_FEBRA,                                                                               ' + #13#10 ;
    //C·ssio Rovaroto - SIG n 114764 - InÌcio
    if (rDadosParamConv.sNumBanco = '001') then
      sSql := sSql +  '       ''0000000000'' DETALHE_J,--OCORRENCIAS,                                                   ' + #13#10
    else
      sSql := sSql +  '       RPAD('' '', 10) DETALHE_J,--OCORRENCIAS,                                                  ' + #13#10 ;
    sSql := sSql + '       DET_J.VALOR                                                                                                 ' + #13#10 +
    //C·ssio Rovaroto - SIG n 114764 - Fim
    '  FROM (                                                                                                           ' + #13#10 +
    'SELECT AX.CODDOCARQ,                                                                                               ' + #13#10 +
    '       REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS, 4, D4.NUMLEITCODBARRAS), ''\D'') NUMLEITCODBARRAS,   ' + #13#10 +
    '       UPPER(TRANSLATE(TRIM(DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 3, D3.RAZAOSOCIAL, 4, D4.RAZAOSOCIAL)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL, ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 3, D3.DATAPROGRAMADA, 4, D4.DATAPROGRAMADA) DATAPROGRAMADA,                                 ' + #13#10 +
    '       AX.VALOR                                                                                                    ' + #13#10 +
    '  FROM ARQUIVOXDOCUM AX                                                                                            ' + #13#10 +
    '  LEFT JOIN (                                                                                                      ' + #13#10 +
    'SELECT DI1.CODDOCUMENTO, DI1.NUMLEITCODBARRAS, DI1.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL          ' + #13#10 +
    '  FROM DOCUMENTO DI1                                                                                               ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1  ' + #13#10 +
    '  LEFT JOIN (                                                                                                      ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 99579 - InÌcio
    //'SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS, DC.DTPAGTO DATAPROGRAMADA,                      ' + #13#10 +
    'SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS, DI3.DATAPROGRAMADA DATAPROGRAMADA,              ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 99579 - Fim
    '       NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL                                                                      ' + #13#10 +
//    '       , DC.VALOR,  DC.IDPLANOPREV                                                                                 ' + #13#10 +
    '  FROM DOCUMENTO DI3                                                                                               ' + #13#10 +
    '  JOIN DOCUMENTOXCODBARRAS DC ON DI3.CODDOCUMENTO = DC.CODDOCUMENTO                                                ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI3.IDFORCLI                                                                       ' + #13#10 +
    '            ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3                         ' + #13#10 +

    //Everson Cunha - SIG117206 - Ini
    '  LEFT JOIN ( ' + #13#10 +
    'SELECT DI4.CODGRUPOCNAB, DI4.NUMLEITCODBARRAS, DI4.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL ' + #13#10 +
    '  FROM DOCUMENTO DI4 ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI4.IDFORCLI ' + #13#10 +
    ' GROUP BY DI4.CODGRUPOCNAB, DI4.NUMLEITCODBARRAS, DI4.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME)) D4 ON D4.CODGRUPOCNAB = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 4 ' + #13#10 +
    //Everson Cunha - SIG117206 - Fim

    ' WHERE AX.TIPO IN (1, 3, 4) /*1=DOCUMENTO, 3=LISTA DE TITULOS, 4=AP AGRUPADA*/                                                       ' + #13#10 +
    '   AND LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS, 4, D4.NUMLEITCODBARRAS), ''\D'')) = 47 /*47 - Ficha de CompensaÁ„o - Detalhe "J", 48 - ArrecadaÁ„o - Detalhe "K"*/ ' + #13#10;

  If (pFormaLanc = '31') Then // 31 = Pagamento de TÌtulos de outros Bancos (numbanco <> 104)
    sSql := sSql + '   AND SUBSTR(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS, 4, D4.NUMLEITCODBARRAS), ''\D''), 0, 3) <> ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10
  Else If (pFormaLanc = '30') Then // 30 = LiquidaÁ„o prÛprio Banco (numbanco = 104)
    sSql := sSql + '   AND SUBSTR(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS, 4, D4.NUMLEITCODBARRAS), ''\D''), 0, 3) = ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10;

  sSql := sSql + '   AND EXISTS (SELECT 1                                                                               ' + #13#10 +
    '                 FROM FORMARECPAGXTIPOFORMARECPAG FXF                                                              ' + #13#10 +
    '                WHERE FXF.CODFORMA = AX.CODFORMA                                                                   ' + #13#10 +
    '                  AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')                                             ' + #13#10 +
    '   AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') DET_J                                                              ' + #13#10 +
    'UNION ALL                                                                                                          ' + #13#10 +
    '-- DETALHE J52 - ObrigatÛrio para tÌtulos com valores acima do definido na estrutura CM.PORTFORMAXPARAMARQREM.VLR_OBRIGA_CPF_CNPJ    ' + #13#10 +
    'SELECT ''3'' ORDEM,                                                                                                ' + #13#10 +
    '       MESMAQRY_J.CODDOCARQ "ORDEM1",                                                                              ' + #13#10 +
    '       ''J52'' "ORDEM2",                                                                                           ' + #13#10;
  sSql := sSql + Quotedstr(rDadosParamConv.sNumBanco) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pSeqLote, 4)) + '||' + #13#10 +
    '       ''3'' REG,                                                                                                  ' + #13#10 +
    '       NULL NSR,                                                                                                   ' + #13#10 +
    '       ''J'' ||--SEG,                                                                                              ' + #13#10 +
    '       '' '' ||--USO_FEBRA,                                                                                        ' + #13#10 +
    '       RPAD('' '', 2) ||--COD_MOV,                                                                                 ' + #13#10 +
    '       ''52'' ||--ID_REG, -- No manual pede "J52". Foi informado pela Nexxera que deve inserir "52"                ' + #13#10 +
    '       MESMAQRY_J.TIPO_PAG ||--TIPO_INSC_PAG,                                                                      ' + #13#10 +
    '       LPAD(MESMAQRY_J.NUMDOCUMENTO_PAG, 15, ''0'') ||--NUM_INSC_PAG, -- TAMANHO ERRADO NO MANUAL                  ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 67165
    //'       RPAD(MESMAQRY_J.RAZAOSOCIAL_PAG, 40) ||--RAZAOSOCIAL_PAG,                                                   ' + #13#10 +
    '       RPAD(TRANSLATE(TRIM(MESMAQRY_J.RAZAOSOCIAL_PAG),''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu''), 40) || --RAZAOSOCIAL_PAG, ' + #13#10 +
    '       MESMAQRY_J.TIPO_BENEF ||--TIPO_INSC_BENEF,                                                                  ' + #13#10 +
    '       LPAD(MESMAQRY_J.NUMDOCUMENTO_BENEF, 15, ''0'') ||--NUM_INSC_BENEF, -- TAMANHO ERRADO NO MANUAL              ' + #13#10 +
    //'       RPAD(MESMAQRY_J.RAZAOSOCIAL_BENEF, 40) ||--RAZAOSOCIAL_BENEF,                                               ' + #13#10 +
    '       RPAD(TRANSLATE(TRIM(MESMAQRY_J.RAZAOSOCIAL_BENEF),''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu''), 40) || --RAZAOSOCIAL_BENEF, ' + #13#10 +
    '       MESMAQRY_J.TIPO_BENEF ||--TIPO_INSC_SACADOR,                                                                ' + #13#10 +
    '       LPAD(MESMAQRY_J.NUMDOCUMENTO_BENEF, 15, ''0'') ||--NUM_INSC_SACADOR, -- TAMANHO ERRADO NO MANUAL            ' + #13#10 +
    '       RPAD(MESMAQRY_J.RAZAOSOCIAL_BENEF, 40) ||--RAZAOSOCIAL_SACADOR,                                             ' + #13#10 +
    '       RPAD('' '', 53) DETALHE_J52, --USO_FEBRA,                                                                   ' + #13#10 +
    '       0.00 VALOR                                                                                                  ' + #13#10 +
    '  FROM (                                                                                                           ' + #13#10 +
    'SELECT AX.CODDOCARQ,                                                                                               ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.TIPO, 3, D3.TIPO, 4, D4.TIPO) TIPO_BENEF,                                                         ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO, 4, D4.NUMDOCUMENTO) NUMDOCUMENTO_BENEF,                                 ' + #13#10 +
    '       UPPER(TRANSLATE(TRIM(DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 3, D3.RAZAOSOCIAL, 4, D4.RAZAOSOCIAL)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL_BENEF,  ' + #13#10 +
    '       DECODE(LENGTH(REGEXP_REPLACE(PAGADOR.NUMDOCUMENTO, ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') TIPO_PAG,         ' + #13#10 +  // Paulo Nobre - WO33342
    '       REGEXP_REPLACE(PAGADOR.NUMDOCUMENTO, ''[^A-Za-z0-9]'') NUMDOCUMENTO_PAG,                                              ' + #13#10 +  // Paulo Nobre - WO33324
    '       UPPER(TRANSLATE(TRIM(NVL(PAGADOR.RAZAOSOCIAL, PAGADOR.NOME)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL_PAG  ' + #13#10 +
    '  FROM ARQUIVOXDOCUM AX                                                                                            ' + #13#10 +
    '  JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AX.IDARQUIVOPAGTO                                                    ' + #13#10 +
    '  LEFT JOIN (                                                                                                      ' + #13#10 +
    'SELECT DI1.CODDOCUMENTO, DI1.NUMLEITCODBARRAS, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL,                             ' + #13#10 +
    '       DECODE(LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') TIPO,                   ' + #13#10 +   // Paulo Nobre - WO33342
    '       REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]'') NUMDOCUMENTO                                                         ' + #13#10 +   // Paulo Nobre - WO33342
    '  FROM DOCUMENTO DI1                                                                                               ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1  ' + #13#10 +
    '  LEFT JOIN (                                                                                                      ' + #13#10 +
    'SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS,                                                 ' + #13#10 +
    '       NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL, DECODE(LENGTH(REGEXP_REPLACE(NVL(DC.NUMDOCUMENTO, P.NUMDOCUMENTO), ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') TIPO,   ' + #13#10 + // Paulo Nobre - WO33342
    '       REGEXP_REPLACE(NVL(DC.NUMDOCUMENTO, P.NUMDOCUMENTO), ''[^A-Za-z0-9]'') NUMDOCUMENTO                                   ' + #13#10 +  // Paulo Nobre - WO33342
    '  FROM DOCUMENTO DI3                                                                                               ' + #13#10 +
    '  JOIN DOCUMENTOXCODBARRAS DC ON DI3.CODDOCUMENTO = DC.CODDOCUMENTO                                                ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI3.IDFORCLI                                                                       ' + #13#10 +
    '            ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3                         ' + #13#10 +

    //Everson Cunha - SIG117206 - Ini
    '  LEFT JOIN ( ' + #13#10 +
    'SELECT DI4.CODGRUPOCNAB, DI4.NUMLEITCODBARRAS, ' + #13#10 +
    '       NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL, DECODE(LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') TIPO, ' + #13#10 +  // Paulo Nobre - WO33342
    '       REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]'') NUMDOCUMENTO ' + #13#10 +  // Paulo Nobre - WO33342
    '  FROM DOCUMENTO DI4 ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI4.IDFORCLI ' + #13#10 +
    ' GROUP BY DI4.CODGRUPOCNAB, DI4.NUMLEITCODBARRAS, ' + #13#10 +
    '       NVL(P.RAZAOSOCIAL, P.NOME), DECODE(LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0''), ' + #13#10 +  // Paulo Nobre - WO33342
    '       REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]'') ) D4 ON D4.CODGRUPOCNAB = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 4 ' + #13#10 +   // Paulo Nobre - WO33342
    //Everson Cunha - SIG117206 - Fim

    '     , PESSOA PAGADOR                                                                                              ' + #13#10 +
    ' WHERE AX.TIPO IN (1, 3, 4) /*1=DOCUMENTO, 3=LISTA DE TITULOS, 4=AP AGRUPADA*/                                     ' + #13#10 +
    '   AND PAGADOR.IDPESSOA = 1 /*FUNCEF*/                                                                             ' + #13#10 +
    '   AND LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS, 4, D4.NUMLEITCODBARRAS), ''\D'')) = 47 /*47 - Ficha de CompensaÁ„o - Detalhe "J", 48 - ArrecadaÁ„o - Detalhe "K"*/ ' + #13#10 +
    '   AND AX.VALOR >= (SELECT PAR.VLR_OBRIGA_CPF_CNPJ FROM PORTFORMAXPARAMARQREM PAR WHERE PAR.CODPORTFORMA = AP.CODPORTFORMA)                                                             ' + #13#10;

  If (pFormaLanc = '31') Then // 31 = Pagamento de TÌtulos de outros Bancos (numbanco <> 104)
    sSql := sSql + '   AND SUBSTR(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS, 4, D4.NUMLEITCODBARRAS), ''\D''), 0, 3) <> ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10
  Else If (pFormaLanc = '30') Then // 30 = LiquidaÁ„o prÛprio Banco (numbanco = 104)
    sSql := sSql + '   AND SUBSTR(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS, 4, D4.NUMLEITCODBARRAS), ''\D''), 0, 3) = ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10;

  sSql := sSql + '   AND EXISTS (SELECT 1                                                                               ' + #13#10 +
    '                 FROM FORMARECPAGXTIPOFORMARECPAG FXF                                                              ' + #13#10 +
    '                WHERE FXF.CODFORMA = AX.CODFORMA                                                                   ' + #13#10 +
    '                  AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')                                             ' + #13#10 +
    '   AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') MESMAQRY_J                                                         ' + #13#10 +
//    ' ORDER BY ORDEM, "ORDEM1", "ORDEM2", IDPLANOPREV)';
    ' ORDER BY ORDEM, "ORDEM1", "ORDEM2"))';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  //sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LJ.txt');                 //Everson Cunha - SIG84050
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LJ' + pFormaLanc + '.txt'); //Everson Cunha - SIG84050
End;

Function TCtrlRemessaEletronica._SelMovPeloTipoDaFormaPagamento_LK(pIdArqPagto, pTipFormaRecPag, pSeqLote: String): Olevariant;
Var sSql: String;
Begin
  sSql :=
    'SELECT REG || LPAD(ROWNUM, 5, ''0'')  || DETALHE_K AS LINHAMOVLOTE, VALOR                               ' + #13#10 +
    '  FROM (                                                                                                ' + #13#10 +
    '--DETALHE K                                                                                             ' + #13#10 +
    'SELECT ''3'' ORDEM,                                                                                     ' + #13#10 +
    '       DET_K.CODDOCARQ "ORDEM1",                                                                        ' + #13#10 +
    '       ''K'' "ORDEM2",                                                                                  ' + #13#10;
  sSql := sSql + Quotedstr(rDadosParamConv.sNumBanco) + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pSeqLote, 4)) + '||' + #13#10 +
    '       ''3'' REG,                                                                                       ' + #13#10 +
    '       NULL NSR,                                                                                        ' + #13#10 +
    '       ''K'' ||--SEG,                                                                                   ' + #13#10 +
    '       ''0'' ||--TIPO_MOV, -- 0 = Inclus„o, 9 = Exclus„o.                                               ' + #13#10 +
    '       LPAD(''0'', 2, ''0'') ||--COD_INST, -- Nota 11                                                   ' + #13#10 +
    '       SUBSTR(DET_K.NUMLEITCODBARRAS, 0, 11)  ||--PRIMEIRO_BLOCO,                                       ' + #13#10 +
    '       SUBSTR(DET_K.NUMLEITCODBARRAS, 13, 11) ||--SEGUNDO_BLOCO,                                        ' + #13#10 +
    '       SUBSTR(DET_K.NUMLEITCODBARRAS, 25, 11) ||--TERCEIRO_BLOCO,                                       ' + #13#10 +
    '       SUBSTR(DET_K.NUMLEITCODBARRAS, 37, 11) ||--QUARTO_BLOCO,                                         ' + #13#10 +
    '       RPAD('' '', 12) ||--FILLER,                                                                      ' + #13#10 +
    '       LPAD(DET_K.CODDOCARQ, 6, ''0'') ||--NUM_DOC,                                                     ' + #13#10 +
    '       RPAD('' '', 14) ||--FILLER,                                                                      ' + #13#10 +
    '       TO_CHAR(DET_K.DATAPROGRAMADA, ''DDMMYYYY'') ||--DT_LANC,                                         ' + #13#10 +
    '       ''BRL'' ||--TIPO_MOEDA, -- Nota 14                                                               ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--QTD_MOEDAS,                                                           ' + #13#10 +
    '       LPAD(LTRIM(REPLACE(TO_CHAR(DET_K.VALOR, ''999999999999D99''), '','', '''')), 15, ''0'') ||--VLR, ' + #13#10 +
    '       LPAD(''0'', 9, ''0'') ||--NUM_DOC_BANCO,                                                         ' + #13#10 +
    '       RPAD('' '', 11) ||--FILLER,                                                                      ' + #13#10 +
    '       LPAD(''0'', 8, ''0'') ||--DT_EFETIVACAO,                                                         ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') ||--VLR_EFETIVACAO,                                                       ' + #13#10 +
    '       RPAD('' '', 40) ||--OUTRAS_INFO,                                                                 ' + #13#10 +
    '       RPAD('' '', 12) ||--USO_FEBRA,                                                                   ' + #13#10 +
    '       ''0'' ||--AVISO_FAVOREC, -- Nota 10                                                              ' + #13#10 +
    '       RPAD('' '', 10) DETALHE_K, --OCORRENCIAS                                                         ' + #13#10 +
    '       DET_K.VALOR                                                                                      ' + #13#10 +
    '  FROM (                                                                                                ' + #13#10 +
    'SELECT AX.CODDOCARQ,                                                                                    ' + #13#10 +
    '       REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D'') NUMLEITCODBARRAS, ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 3, D3.DATAPROGRAMADA) DATAPROGRAMADA,                      ' + #13#10 +
    '       AX.VALOR                                                                                         ' + #13#10 +
    '  FROM ARQUIVOXDOCUM AX                                                                                 ' + #13#10 +
    '  LEFT JOIN DOCUMENTO D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1               ' + #13#10 +
    '  LEFT JOIN (                                                                                           ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 99579 - InÌcio
    //'SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS, DC.DTPAGTO DATAPROGRAMADA            ' + #13#10 +
    'SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS, DI3.DATAPROGRAMADA DATAPROGRAMADA    ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 99579 - Fim
    '  FROM DOCUMENTO DI3                                                                                    ' + #13#10 +
    '  JOIN DOCUMENTOXCODBARRAS DC ON DI3.CODDOCUMENTO = DC.CODDOCUMENTO                                     ' + #13#10 +
    '           ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3               ' + #13#10 +
    ' WHERE AX.TIPO IN (1, 3) /*1=DOCUMENTO, 3=LISTA DE TITULOS*/                                            ' + #13#10 +
    '   AND LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D'')) = 48 /*47 - Ficha de CompensaÁ„o - Detalhe "J", 48 - ArrecadaÁ„o - Detalhe "K"*/  ' + #13#10 +
    '   AND EXISTS(SELECT 1                                                                                  ' + #13#10 +
    '                FROM FORMARECPAGXTIPOFORMARECPAG FXF                                                    ' + #13#10 +
    '               WHERE FXF.CODFORMA = AX.CODFORMA                                                         ' + #13#10 +
    '                 AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')                                   ' + #13#10 +
    '   AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') DET_K                                                   ' + #13#10 +
    ' ORDER BY ORDEM, "ORDEM1", "ORDEM2")                                                                    ';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LK.txt');
End;

//Everson Cunha - SIG84050 - InÌcio
function TCtrlRemessaEletronica._SelMovPeloTipoDaFormaPagamento_LO(pIdArqPagto, pTipFormaRecPag, pFormaLanc, pSeqLote: String): Olevariant;
Var sSql: String;
begin
  sSql :=
  'SELECT ROWNUM AS LINHA, LINHAMOVLOTE, VALOR_LANC                                  ' + #13#10 +  //C·ssio Rovaroto - SIG n∫ 101422
  '  FROM (                                                                          ' + #13#10 +
  'SELECT REG || LPAD(ROWNUM, 5, ''0'')  || DETALHE_O AS LINHAMOVLOTE, VALOR_LANC    ' + #13#10 +
  '      FROM (                                                                      ' + #13#10 +
  '    --DETALHE O                                                                   ' + #13#10 +
  '    SELECT ''3'' ORDEM,                                                           ' + #13#10 +
  '           DET_O.CODDOCARQ "ORDEM1",                                              ' + #13#10 +
  '           ''O'' "ORDEM2",                                                        ' + #13#10;
  sSql := sSql + Quotedstr(rDadosParamConv.sNumBanco)     + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pSeqLote, 4)) + '||' + #13#10 +
  '           ''3'' REG,                                                        ' + #13#10 +
  '           NULL NSR,                                                         ' + #13#10 +
  '           ''O'' ||--SEG,                                                    ' + #13#10 +
  '           ''0'' ||--TIPO_MOV, -- 0 = Inclus„o, 9 = Exclus„o.                ' + #13#10 +
  '           LPAD(''0'', 2, ''0'') ||--COD_INST, -- ''00'' = Inclus„o de Registro Detalhe Liberado                       ' + #13#10 +
  '           SUBSTR(DET_O.NUMLEITCODBARRAS, 0, 11)  ||--PRIMEIRO_BLOCO,        ' + #13#10 +
  '           SUBSTR(DET_O.NUMLEITCODBARRAS, 13, 11) ||--SEGUNDO_BLOCO,         ' + #13#10 +
  '           SUBSTR(DET_O.NUMLEITCODBARRAS, 25, 11) ||--TERCEIRO_BLOCO,        ' + #13#10 +
  '           SUBSTR(DET_O.NUMLEITCODBARRAS, 37, 11) ||--QUARTO_BLOCO,          ' + #13#10 +
  '           RPAD(DET_O.RAZAOSOCIAL, 30) ||--CEDENTE,                          ' + #13#10 +
  '           TO_CHAR(DET_O.DATAPROGRAMADA, ''DDMMYYYY'') ||--DT_VENCTO,        ' + #13#10 +
  '           TO_CHAR(DET_O.DATAPROGRAMADA, ''DDMMYYYY'') ||--DT_PAGTO,         ' + #13#10 +
  '           LPAD(LTRIM(REPLACE(REPLACE(TO_CHAR(DET_O.VALOR, ''999999999999D99''), ''.'', ''''), '','', '''')), 15, ''0'') ||--VLR, ' + #13#10 +
  //C·ssio Rovaroto - SIG n∫ 117759 - InÌcio
  //'           RPAD(DET_O.CODDOCARQ, 20, '' '') || --NUM_DOC                   ' + #13#10 +
  '           RPAD(DET_O.CODDOCARQ, 6, '' '') ||                                ' + #13#10 +
  '           RPAD(' + QuotedStr(pIdArqPagto) + ' , 14, '' '') ||--NUM_DOC, ' + #13#10 +
  //C·ssio Rovaroto - SIG n∫ 117759 - Fim
  '           RPAD('' '', 20) ||--NUM_DOC_BANCO,                                ' + #13#10 +
  '           RPAD('' '', 68) ||--USO_FEBRA,                                    ' + #13#10 ;
  //C·ssio Rovaroto - SIG n∫ 114764 - InÌcio
  if (rDadosParamConv.sNumBanco = '001') then
    sSql := sSql +  '       ''0000000000'' DETALHE_O,--OCORRENCIAS              ' + #13#10
  else
    sSql := sSql +  '           RPAD('' '', 10) DETALHE_O, --OCORRENCIAS        ' + #13#10 ;
  sSql := sSql + '           DET_O.VALOR AS VALOR_LANC                          ' + #13#10 +
  //C·ssio Rovaroto - SIG n∫ 114764 - Fim
  '      FROM (                                                                 ' + #13#10 +
  '    SELECT AX.CODDOCARQ,                                                     ' + #13#10 +
  //Everson Cunha - SIG117206 - Ini
  //'           REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D'') NUMLEITCODBARRAS,   ' + #13#10 +
  //'           UPPER(TRANSLATE(TRIM(DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 3, D3.RAZAOSOCIAL)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL,  ' + #13#10 +
  //'           DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 3, D3.DATAPROGRAMADA) DATAPROGRAMADA,                                 ' + #13#10 +
  '           REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS, 4, D4.NUMLEITCODBARRAS), ''\D'') NUMLEITCODBARRAS,   ' + #13#10 +
  '           UPPER(TRANSLATE(TRIM(DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 3, D3.RAZAOSOCIAL, 4, D4.RAZAOSOCIAL)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL,  ' + #13#10 +
  '           DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 3, D3.DATAPROGRAMADA, 4, D4.DATAPROGRAMADA) DATAPROGRAMADA,                                 ' + #13#10 +
  //Everson Cunha - SIG117206 - Fim
  '           AX.VALOR                                                          ' + #13#10 +
  '      FROM ARQUIVOXDOCUM AX                                                  ' + #13#10 +
  '      LEFT JOIN (                                                            ' + #13#10 +
  '    SELECT DI1.CODDOCUMENTO, DI1.NUMLEITCODBARRAS, DI1.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL          ' + #13#10 +
  '      FROM DOCUMENTO DI1                                                     ' + #13#10 +
  '      JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1  ' + #13#10 +
  '      LEFT JOIN (                                                            ' + #13#10 +
  //C·ssio Rovaroto - SIG n∫ 99579 - InÌcio
  //'    SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS, DC.DTPAGTO DATAPROGRAMADA,                      ' + #13#10 +
  '    SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS, DI3.DATAPROGRAMADA DATAPROGRAMADA,              ' + #13#10 +
  //C·ssio Rovaroto - SIG n∫ 99579 - Fim
  '         NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL                              ' + #13#10 +
  '      FROM DOCUMENTO DI3                                                     ' + #13#10 +
  '      JOIN DOCUMENTOXCODBARRAS DC ON DI3.CODDOCUMENTO = DC.CODDOCUMENTO      ' + #13#10 +
  '      JOIN PESSOA P ON P.IDPESSOA = DI3.IDFORCLI                             ' + #13#10 +
  '               ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3                          ' + #13#10 +

  //Everson Cunha - SIG117206 - Ini
  '      LEFT JOIN ( ' + #13#10 +
	'      SELECT DI4.CODGRUPOCNAB, DI4.NUMLEITCODBARRAS, DI4.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL ' + #13#10 +
	'        FROM DOCUMENTO DI4 ' + #13#10 +
	'        JOIN PESSOA P ON P.IDPESSOA = DI4.IDFORCLI ' + #13#10 +
	'       GROUP BY DI4.CODGRUPOCNAB, DI4.NUMLEITCODBARRAS, DI4.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME)) D4 ON D4.CODGRUPOCNAB = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 4 ' + #13#10 +

  //'     WHERE AX.TIPO IN (1, 3) /*1=DOCUMENTO, 3=LISTA DE TITULOS*/             ' + #13#10 +
  //'       AND LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D'')) = 48 /*47 - Ficha de CompensaÁ„o - Detalhe "J", 48 - Detalhe "O"*/  ' + #13#10 +
  '     WHERE AX.TIPO IN (1, 3, 4) /*1=DOCUMENTO, 3=LISTA DE TITULOS, 4=AP AGRUPADA*/             ' + #13#10 +
  '       AND LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS, 4, D4.NUMLEITCODBARRAS), ''\D'')) = 48 /*47 - Ficha de CompensaÁ„o - Detalhe "J", 48 - Detalhe "O"*/  ' + #13#10 +
  //Everson Cunha - SIG117206 - Fim

  '       AND EXISTS(SELECT 1                                                   ' + #13#10 +
  '                    FROM FORMARECPAGXTIPOFORMARECPAG FXF                     ' + #13#10 +
  '                   WHERE FXF.CODFORMA = AX.CODFORMA                          ' + #13#10 +
  '                     AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')    ' + #13#10 +
  '       AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') DET_O                    ' + #13#10 +
  {'-- DETALHE W - ObrigatÛrio e Exclusivo para FGTS                             ' + #13#10 +
  'UNION ALL                                                                    ' + #13#10 +
  '    SELECT ''3'' ORDEM,                                                      ' + #13#10 +
  '           MESMAQRY_O.CODDOCARQ "ORDEM1",                                    ' + #13#10 +
  '           ''W'' "ORDEM2",                                                   ' + #13#10;
  sSql := sSql + Quotedstr(rDadosParamConv.sNumBanco)     + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pSeqLote, 4)) + '||' + #13#10 +
  '           ''3'' REG,                                                        ' + #13#10 +
  '           NULL NSR,                                                         ' + #13#10 +
  '           ''W'' ||--SEG,                                                    ' + #13#10 +
  '           ''1'' ||--NSR_COMPL,                                              ' + #13#10 +
  '           ''9'' ||--TIPO_INFO, -- ''1'' = Para uso da empresa (o banco n„o ir· validar e nem tratar estes dados)      ' + #13#10 +
  '                                -- ''2'' = Para emiss„o na guia do tributo (estes dados ser„o impressos no documento na mesma ordem informada, sendo cada campo de informaÁ„o uma linha de detalhe) ' + #13#10 +
  '                                -- ''9'' = Para uso da InformaÁ„o Complementar de Tributo                              ' + #13#10 +
  '           RPAD('' '', 80) ||--INFO_COMPL,                                   ' + #13#10 +
  '           RPAD('' '', 80) ||--INFO_COMPL2,                                  ' + #13#10 +
  '           ''01'' ||--IDENT_TRIBUTO, -- ''01'' = FGTS                        ' + #13#10 +

  '           -- DETALHE W1 - INÕCIO                                            ' + #13#10 +
  '           RPAD('' '', 6) ||--COD_RECEITA_TRIB,                              ' + #13#10 +
  '           RPAD(MESMAQRY_O.TIPO, 2, '' '') ||--TIP_INSC,                     ' + #13#10 +
  '           LPAD(NVL(MESMAQRY_O.NUMDOCUMENTOPF, '' ''), 14, '' '') ||--NUM_INSC,' + #13#10 +
  '           RPAD('' '', 16) ||--ID_FGTS,                                      ' + #13#10 +
  '           RPAD('' '', 9) ||--LACRE_CONECTIVIDADE_SOCIAL,                    ' + #13#10 +
  '           RPAD('' '', 2) ||--DV_LACRE_CONECTIVIDADE_SOCIAL,                 ' + #13#10 +
  '           RPAD('' '', 1) ||--USO_FEBRA,                                     ' + #13#10 +
  '           -- DETALHE W1 - FIM                                               ' + #13#10 +

  '           RPAD('' '', 02) ||--USO_FEBRA,                                    ' + #13#10 +
  '           RPAD('' '', 10) DETALHE_W, --OCORRENCIAS                          ' + #13#10 +
  //Deixar o campo VALOR preenchido para calcular o ID_FGTS
  //Depois de calcular o ID_FGTS, colocar 0,00 neste campo para n„o duplicar o valor total do LOTE (dVlrTotalLote)
  '           MESMAQRY_O.VALOR VALOR                                            ' + #13#10 +
  '      FROM (                                                                 ' + #13#10 +
  '    SELECT AX.CODDOCARQ,                                                     ' + #13#10 +
  '           REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D'') NUMLEITCODBARRAS,                           ' + #13#10 +
  '           REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO), ''\D'') NUMDOCUMENTO,                                       ' + #13#10 +
  '           DECODE(LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO), ''\D'')), 11, ''2'', 14, ''1'', '' '') TIPO,  ' + #13#10 +
  '           UPPER(TRANSLATE(TRIM(DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 3, D3.RAZAOSOCIAL)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL,' + #13#10 +
  '           DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 3, D3.DATAPROGRAMADA) DATAPROGRAMADA,                                                         ' + #13#10 +
  '           DECODE(AX.TIPO, 1, D1.NUMDOCUMENTOPF, 3, D3.NUMDOCUMENTOPF) NUMDOCUMENTOPF,                                                         ' + #13#10 +
  '           AX.VALOR                                                          ' + #13#10 +
  '      FROM ARQUIVOXDOCUM AX                                                  ' + #13#10 +
  '      LEFT JOIN (                                                            ' + #13#10 +
  '    SELECT DI1.CODDOCUMENTO, DI1.NUMLEITCODBARRAS, DI1.DATAPROGRAMADA, P.NUMDOCUMENTO, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL, PF.NUMDOCUMENTO AS NUMDOCUMENTOPF ' + #13#10 +
  '      FROM DOCUMENTO DI1                                                     ' + #13#10 +
  '      JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI                                                                                                ' + #13#10 +
  '      JOIN PESSOA PF ON PF.IDPESSOA = DI1.IDPESSOA) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1                         ' + #13#10 +
  '      LEFT JOIN (                                                            ' + #13#10 +
  //C·ssio Rovaroto - SIG n∫ 99579 - InÌcio
  //'    SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS, DC.DTPAGTO DATAPROGRAMADA,                                              ' + #13#10 +
  '    SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS, DI3.DATAPROGRAMADA DATAPROGRAMADA,                                              ' + #13#10 +
  //C·ssio Rovaroto - SIG n∫ 99579 - Fim
  '         P.NUMDOCUMENTO, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL, PF.NUMDOCUMENTO AS NUMDOCUMENTOPF              ' + #13#10 +
  '      FROM DOCUMENTO DI3                                                     ' + #13#10 +
  '      JOIN DOCUMENTOXCODBARRAS DC ON DI3.CODDOCUMENTO = DC.CODDOCUMENTO      ' + #13#10 +
  '      JOIN PESSOA P ON P.IDPESSOA = DI3.IDFORCLI                             ' + #13#10 +
  '      JOIN PESSOA PF ON PF.IDPESSOA = DI3.IDPESSOA                           ' + #13#10 +
  '               ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3                                                  ' + #13#10 +
  '     WHERE AX.TIPO IN (1, 3) /*1=DOCUMENTO, 3=LISTA DE TITULOS*/             ' + #13#10 +
  '       AND LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D'')) = 48 /*47 - Ficha de CompensaÁ„o - Detalhe "J", 48 - Detalhe "O"*/  ' + #13#10 +
  '       AND AX.CODFORMA IN (66, 117)                                          ' + #13#10 +
  '       AND EXISTS(SELECT 1' + #13#10 +
  '                    FROM FORMARECPAGXTIPOFORMARECPAG FXF                     ' + #13#10 +
  '                   WHERE FXF.CODFORMA = AX.CODFORMA                          ' + #13#10 +
  '                     AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')    ' + #13#10 +
  '       AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') MESMAQRY_O               ' + #13#10 +
  '     ORDER BY ORDEM, "ORDEM1", "ORDEM2"))                                    ';}
  '     ORDER BY ORDEM, "ORDEM1"))                                              ';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LO' + pFormaLanc + '.txt');
end;
//Everson Cunha - SIG84050 - Fim

//Everson Cunha - SIG84050 - InÌcio
function TCtrlRemessaEletronica._SelMovPeloTipoDaFormaPagamento_LN(pIdArqPagto, pTipFormaRecPag, pFormaLanc, pSeqLote: String): Olevariant;
Var sSql: String;
    iTipoGPS: Integer;
begin
  sSql :=
  'SELECT ROWNUM AS LINHA, LINHAMOVLOTE, VALOR_LANC                                  ' + #13#10 + //C·ssio Rovaroto - SIG n∫ 101422
  '  FROM (                                                                          ' + #13#10 +
  'SELECT REG || LPAD(ROWNUM, 5, ''0'')  || DETALHE_N AS LINHAMOVLOTE, VALOR_LANC    ' + #13#10 +
  '      FROM (                                                                      ' + #13#10 +
  '    --DETALHE N                                                                   ' + #13#10 +
  '    SELECT ''3'' ORDEM,                                                           ' + #13#10 +
  '           DET_N.CODDOCARQ "ORDEM1",                                              ' + #13#10 +
  '           ''N'' "ORDEM2",                                                        ' + #13#10;
  sSql := sSql + Quotedstr(rDadosParamConv.sNumBanco)     + '||' + #13#10;
  sSql := sSql + Quotedstr(_CompletaZeroEsq(pSeqLote, 4)) + '||' + #13#10 +
  '           ''3'' REG,                                                        ' + #13#10 +
  '           NULL NSR,                                                         ' + #13#10 +
  '           ''N'' ||--SEG,                                                    ' + #13#10 +
  '           ''0'' ||--TIPO_MOV, -- 0 = Inclus„o, 9 = Exclus„o.                ' + #13#10 +

  '           LPAD(''0'', 2, ''0'') ||--COD_INST, -- ''00'' = Inclus„o de Registro Detalhe Liberado                                               ' + #13#10 +
  //C·ssio Rovaroto - SIG n∫ 117759 - InÌcio
  //'           RPAD(DET_N.CODDOCARQ, 20, '' '') ||--NUM_DOC,                     ' + #13#10 +
  '           RPAD(DET_N.CODDOCARQ, 6, '' '') ||                               ' + #13#10 +
  '           RPAD(' + QuotedStr(pIdArqPagto) + ', 14, '' '') ||--NUM_DOC, ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 117759 - Fim
  '           RPAD('' '', 20) ||--NUM_DOC_BANCO,                                ' + #13#10 +
  '           RPAD(NVL(DET_N.RAZAOSOCIAL, '' ''), 30, '' '') ||--NOME_CONTRIB,  ' + #13#10 +
  '           TO_CHAR(DET_N.DATAPROGRAMADA, ''DDMMYYYY'') ||--DT_PAGTO,         ' + #13#10 +
  '           LPAD(LTRIM(REPLACE(REPLACE(TO_CHAR(DET_N.VALOR, ''999999999999D99''), ''.'', ''''), '','', '''')), 15, ''0'') ||--VLR,              ' + #13#10;

  // InformaÁıes complementares GPS / DARF - InÌcio
  If (pFormaLanc = '17') Then //GPS
  begin
    sSql := sSql +
    '         LPAD(DET_N.CODFORMABANCO, 6) ||--COD_RECEITA_TRIB,                ' + #13#10 +
    '         LPAD(DECODE(LENGTH(DET_N.NUMDOCUMENTO), 11, ''2'', 14, ''1'', ''0''), 2, ''0'') ||--TP_CONTRIB,                                     ' + #13#10 +
    '         LPAD(DET_N.NUMDOCUMENTO, 14, ''0'') ||--IDENT_CONTRIB,            ' + #13#10;
    sSql := sSql +
    '         RPAD(' + Quotedstr(pFormaLanc) + ', 2) ||--COD_IDENT_TRIB,        ' + #13#10 +
    '         LPAD(DET_N.COMPETENCIA, 6, ''0'') ||--MES_ANO_COMP,               ' + #13#10 +
    '         LPAD(LTRIM(REPLACE(REPLACE(TO_CHAR(DET_N.VLRINSS, ''999999999999D99''), ''.'', ''''), '','', '''')), 15, ''0'') ||--VLR_INSS,       ' + #13#10 +
    '         LPAD(LTRIM(REPLACE(REPLACE(TO_CHAR(DET_N.VLROUTRAS_ENTIDADES, ''999999999999D99''), ''.'', ''''), '','', '''')), 15, ''0'') ||--VLR_OUTRAS,  ' + #13#10 +
    '         LPAD(LTRIM(REPLACE(REPLACE(TO_CHAR(DET_N.VLRMULTA, ''999999999999D99''), ''.'', ''''), '','', '''')), 15, ''0'') ||--VLR_ATUALIZACAO_MONET,  ' + #13#10 +
    '         RPAD('' '', 45) ||--USO_FEBRA,                                    ' + #13#10;
  end
  Else
  If (pFormaLanc = '16') Then //DARF
  begin
    sSql := sSql +
    '         LPAD(DET_N.CODNATUREZA, 6) ||--COD_RECEITA_TRIB,                  ' + #13#10 +
    '         LPAD(DECODE(LENGTH(DET_N.NUMDOCUMENTO), 11, ''2'', 14, ''1'', ''0''), 2, ''0'') ||--TP_CONTRIB,                                     ' + #13#10 +
    '         LPAD(DET_N.NUMDOCUMENTO, 14, ''0'') ||--IDENT_CONTRIB,            ' + #13#10;
    sSql := sSql +
    '         RPAD(' + Quotedstr(pFormaLanc) + ', 2) ||--COD_IDENT_TRIB,        ' + #13#10 +
    '         LPAD(DET_N.DATAFINALAPURACAO, 8, ''0'') ||--PER_APUR,             ' + #13#10 +
    '         LPAD(''0'', 17, ''0'') ||--NUM_REF,                               ' + #13#10 +
    '         LPAD(LTRIM(REPLACE(REPLACE(TO_CHAR(DET_N.VLRIRRF, ''999999999999D99''), ''.'', ''''), '','', '''')), 15, ''0'') ||--VLR_PRINCIPAL,        ' + #13#10 +
    '         LPAD(LTRIM(REPLACE(REPLACE(TO_CHAR(DET_N.VLRMULTA, ''999999999999D99''), ''.'', ''''), '','', '''')), 15, ''0'') ||--VLR_MULTA,           ' + #13#10 +
    '         LPAD(LTRIM(REPLACE(REPLACE(TO_CHAR(DET_N.VLRJUROS, ''999999999999D99''), ''.'', ''''), '','', '''')), 15, ''0'') ||--VLR_JUROS_ENCARGOS,  ' + #13#10 +
    '         LPAD(DET_N.DATAVENCDARF, 8, ''0'') ||--DT_VENCTO,                 ' + #13#10 +
    '         RPAD('' '', 18) ||--USO_FEBRA,                                    ' + #13#10;
  end;
  // InformaÁıes complementares GPS / DARF - Fim
  //C·ssio Rovaroto - SIG n∫ 114764 - InÌcio
  if (rDadosParamConv.sNumBanco = '001') then
    sSql := sSql +
    '           ''0000000000'' DETALHE_N, --OCORRENCIAS                         ' + #13#10 +
    '           DET_N.VALOR AS VALOR_LANC                                       ' + #13#10
  else
    sSql := sSql +
    '           RPAD('' '', 10) DETALHE_N, --OCORRENCIAS                        ' + #13#10 +
    '           DET_N.VALOR AS VALOR_LANC                                       ' + #13#10 ;

  sSql := sSql + '      FROM (                                                  ' + #13#10 +
 //C·ssio Rovaroto - SIG n∫ 114764 - Fim
  '    SELECT AX.CODDOCARQ,                                                     ' + #13#10 +
  '           UPPER(TRANSLATE(TRIM(P.RAZAOSOCIAL), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL,  ' + #13#10 +
  '           D1.DATAPROGRAMADA,                                                ' + #13#10 +
  '           AX.VALOR                                                          ' + #13#10;

  // InformaÁıes complementares GPS / DARF - InÌcio
  If (pFormaLanc = '17') Then //GPS
  begin
    sSql := sSql +
    '           , NVL(FO.CODFORMABANCO, '' '') CODFORMABANCO                    ' + #13#10 +
    '           , REGEXP_REPLACE(GPS.COMPETENCIA, ''\D'') COMPETENCIA           ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 100343 - InÌcio
    //'           , NVL(REGEXP_REPLACE(P_ID.NUMDOCUMENTO, ''\D''), ''0'') NUMDOCUMENTO ' + #13#10 +
    '           , NVL(REGEXP_REPLACE(DECODE(NVL(FR.FLGPAGTOAUTONOMO, 0), 0,     ' +
    '             P_ID.NUMDOCUMENTO, PJ.NUMDOCUMENTO), ''[^A-Za-z0-9]''), ''0'') ' +    // Paulo Nobre - WO33342
    '             NUMDOCUMENTO                                                  ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 100343 - Fim
    '           , NVL(GPS.VLRINSS, ''0'') VLRINSS                               ' + #13#10 +
    '           , NVL(GPS.VLROUTRAS_ENTIDADES, ''0'') VLROUTRAS_ENTIDADES       ' + #13#10 +
    '           , NVL(GPS.VLRMULTA, ''0'') VLRMULTA                             ' + #13#10 +
    '           , NVL(GPS.VLRTOTAL, ''0'') VLRTOTAL                             ' + #13#10;
  end
  Else
  If (pFormaLanc = '16') Then //DARF
  begin
    sSql := sSql +
    '       , TO_CHAR(DARF.DATAFINALAPURACAO, ''DDMMYYYY'') DATAFINALAPURACAO   ' + #13#10 +
    '       , NVL(REGEXP_REPLACE(DARF.NUMDOCUMENTO, ''[^A-Za-z0-9]''), ''0'') NUMDOCUMENTO' + #13#10 +   // Paulo Nobre - WO33342
    '       , REGEXP_REPLACE(DARF.CODNATUREZA, ''\D'') CODNATUREZA              ' + #13#10 +
    '       , TO_CHAR(DARF.DATAVENCDARF, ''DDMMYYYY'') DATAVENCDARF             ' + #13#10 +
    '       , NVL(DARF.VLRIRRF, ''0'') VLRIRRF                                  ' + #13#10 +
    '       , NVL(DARF.VLRMULTA, ''0'') VLRMULTA                                ' + #13#10 +
    '       , NVL(DARF.VLRJUROS, ''0'') VLRJUROS                                ' + #13#10 +
    '       , NVL(DARF.VLRTOTAL, ''0'') VLRTOTAL                                ' + #13#10;
  end;
  // InformaÁıes complementares GPS / DARF - Fim

  sSql := sSql +
  '      FROM ARQUIVOXDOCUM AX                                                  ' + #13#10;

  // InformaÁıes complementares GPS / DARF - InÌcio
  If (pFormaLanc = '17') Then //GPS
  begin
    sSql := sSql +
    '      JOIN CM.DOCINSS GPS ON GPS.CODDOCINSS = AX.ID_DOC_CODBARRAS_PESSOAS  ' + #13#10 +
    '      LEFT JOIN CM.PESSOA P_ID ON P_ID.IDPESSOA = GPS.IDBENEFINSS          ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 100343 - InÌcio
    '      JOIN CM.DOCUMENTO DO ON DO.CODDOCUMENTO  = GPS.CODDOCINSS            ' + #13#10 +
    '      JOIN CM.FORMARECPAG FR ON FR.CODFORMA = DO.CODFORMA                  ' + #13#10 +
    '      JOIN CM.PESSOA PJ ON PJ.IDPESSOA  = DO.IDEMPRESA                     ' + #13#10 ;
    //C·ssio Rovaroto - SIG n∫ 100343 - Fim
  end
  Else
  If (pFormaLanc = '16') Then //DARF
  begin
    sSql := sSql +
    '      JOIN CM.DARF ON DARF.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS      ' + #13#10;
  end;
  // InformaÁıes complementares GPS / DARF - Fim

  sSql := sSql +
  '      JOIN DOCUMENTO D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1   ' + #13#10 +
  '      JOIN PESSOA P ON P.IDPESSOA = D1.IDFORCLI                              ' + #13#10 +
  '      JOIN CM.FORMARECPAG FO ON FO.CODFORMA = D1.CODFORMA AND FO.RECPAG = ''P''            ' + #13#10 +

  '     WHERE AX.TIPO IN (1) /*1=DOCUMENTO*/                                    ' + #13#10 +
  '       AND D1.NUMLEITCODBARRAS IS NULL                                       ' + #13#10 +
  '       AND EXISTS(SELECT 1                                                   ' + #13#10 +
  '                    FROM FORMARECPAGXTIPOFORMARECPAG FXF                     ' + #13#10 +
  '                   WHERE FXF.CODFORMA = AX.CODFORMA                          ' + #13#10 +
  '                     AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')    ' + #13#10 +
  '       AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') DET_N)                   ' + #13#10 +
  '     ORDER BY ORDEM, "ORDEM1", "ORDEM2")                                      ';

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LN' + pFormaLanc + '.txt');
end;

// Paulo Nobre - WO28070 - Inicio

function TCtrlRemessaEletronica.GetMovimentoRemessaCap(pConvenio, pFormaPagto: String; pDataIni, pDataFim: TDateTime): string;
var sSql: string;
begin
  sSql := 'WITH AGRUPADO AS (                                                                                            ' + #13#10 +
          '                  SELECT COUNT(*) QTD, D.CODPORTFORMA, D.IDFORCLI, D.DATAPROGRAMADA, D.NODOCUMENTO, D.NUMAPGR ' + #13#10 +
          '                  FROM CM.DOCUMENTO D                                                                         ' + #13#10 +
          '                  WHERE ((D.DATAPROGRAMADA >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''))        ' + #13#10 +
          '                        AND (D.DATAPROGRAMADA <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY'')))    ' + #13#10;

  If pConvenio <> '' Then
    sSql := sSql + '                        AND D.CODPORTFORMA = ' + quotedstr(pConvenio) + #13#10;

  If pFormaPagto <> '-1' Then
    sSql := sSql + '                        AND D.CODFORMA = ' + quotedstr(pFormaPagto) + #13#10;

  sSql := sSql + '                  GROUP BY D.CODPORTFORMA, D.IDFORCLI, D.DATAPROGRAMADA, D.NODOCUMENTO, D.NUMAPGR             ' + #13#10 +
         '                  ),                                                                                                  ' + #13#10;
  sSql := sSql + '    SOMA_LANCAMENTOS AS (                                                                                     ' + #13#10 +
         '    -- Pre-calcula a soma para evitar execucao linha a linha                                                          ' + #13#10 +
         '                                 SELECT LANC.CODDOCUMENTO,                                                            ' + #13#10 +
         '                                        SUM(DECODE(LANC.DEBCRE, ''D'',                                                ' + #13#10 +
         '                                        DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1),                       ' + #13#10 +
         '                                        DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR_CALCULADO   ' + #13#10 +
         '                                 FROM CM.LANCTODOCUM LANC                                                             ' + #13#10 +
         '                                 JOIN CM.DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO                        ' + #13#10 +
         //'                                 WHERE LANC.OPERACAO = 2                                                              ' + #13#10 +  //edilaine WO28854
         '    -- Dica: Se possivel, restrinja datas aqui tambem para limitar o universo de busca                                ' + #13#10 +
         '                                 GROUP BY LANC.CODDOCUMENTO                                                           ' + #13#10 +
         '                               )                                                                                      ' + #13#10;

  // Paulo Nobre - WO29249 - Inicio
  sSql := sSql + 'SELECT MARCADO,                                                                                               ' + #13#10 +
                 '       NUM_AP,                                                                                               ' + #13#10 +
                 '       NUM_DOC,                                                                                              ' + #13#10 +
                 '       CPF_CNPJ_MASC,                                                                                        ' + #13#10 +
                 '       RAZAOSOCIAL,                                                                                          ' + #13#10 +
                 '       FORMA_PAGTO,                                                                                          ' + #13#10 +
                 '       DATAPROGRAMADA,                                                                                       ' + #13#10 +
                 '       SUM(VALOR) AS VALOR,                                                                                  ' + #13#10 +
                 '       MSGERRO,                                                                                              ' + #13#10 +
                 '       NUMDOCUMENTO,                                                                                         ' + #13#10 +
                 '       CODDOCUMENTO,                                                                                         ' + #13#10 +
                 '       CODFORMA,                                                                                             ' + #13#10 +
                 '       NOME_CONVENIO,                                                                                        ' + #13#10 +
                 '       CODPORTFORMA,                                                                                         ' + #13#10 +
                 '       FLGPERMITELISTAFAVORECIDO,                                                                            ' + #13#10 +
                 '       FLGPERMITETITULOSPAGTO,                                                                               ' + #13#10 +
                 '       IDHSTFOLHABENEF,                                                                                      ' + #13#10 +
                 '       IDFORCLI,                                                                                             ' + #13#10 +
                 '       DATAVENCTO,                                                                                           ' + #13#10 +
                 '       IDMODULO,                                                                                             ' + #13#10 +
                 '       FLGPAGTOAUTONOMO,                                                                                     ' + #13#10 +
                 '       TIPOFORMA,                                                                                            ' + #13#10 +
                 '       CODGRUPOCNAB                                                                                          ' + #13#10 +
         'FROM (                                                                                                                ' + #13#10 +
         'SELECT ''S'' MARCADO,                                                                                                  ' + #13#10 +
         '       DECODE(AG.QTD, 1, D.CODDOCUMENTO, -1) CODDOCUMENTO,                                                             ' + #13#10 +
         '       D.CODGRUPOCNAB,                                                                                                 ' + #13#10 +
         '       DECODE(AG.QTD, 1, D.IDMODULO, -1) IDMODULO,                                                                     ' + #13#10 +
         '       DECODE(AG.QTD, 1, 1, 4) TIPO,     /*1 - CODDOCUMENTO, 4 - AGRUPADO*/                                            ' + #13#10 +
         '       D.CODFORMA,                                                                                                     ' + #13#10 +
         '       D.CODPORTFORMA,                                                                                                 ' + #13#10 +
         '       D.NUMAPGR NUM_AP,                                                                                               ' + #13#10 +
         '       D.NODOCUMENTO NUM_DOC,                                                                                          ' + #13#10 +
         '       P.IDPESSOA IDFORCLI,                                                                                            ' + #13#10 +
         '       TRIM(P.NUMDOCUMENTO) NUMDOCUMENTO,                                                                              ' + #13#10 +
         // Paulo Nobre - WO33342 - Inicio
         '       CAST(CM.FN_FORMATACPFCNPJ(P.NUMDOCUMENTO) AS VARCHAR2(18)) AS CPF_CNPJ_MASC,                                    ' + #13#10 +
{
         '       CAST(                                                                                                           ' + #13#10 +
         '           CASE LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''))                                                         ' + #13#10 +
         '               WHEN 11 THEN                                                                                            ' + #13#10 +
         '                   SUBSTR(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 1, 3) || ''.'' ||                                    ' + #13#10 +
         '                   SUBSTR(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 4, 3) || ''.'' ||                                    ' + #13#10 +
         '                   SUBSTR(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 7, 3) || ''-'' ||                                    ' + #13#10 +
         '                   SUBSTR(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 10, 2)                                               ' + #13#10 +
         '               WHEN 14 THEN                                                                                            ' + #13#10 +
         '                   SUBSTR(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 1, 2) || ''.'' ||                                    ' + #13#10 +
         '                   SUBSTR(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 3, 3) || ''.'' ||                                    ' + #13#10 +
         '                   SUBSTR(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 6, 3) || ''/'' ||                                    ' + #13#10 +
         '                   SUBSTR(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 9, 4) || ''-'' ||                                    ' + #13#10 +
         '                   SUBSTR(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 13, 2)                                               ' + #13#10 +
         '               ELSE                                                                                                    ' + #13#10 +
         '                   REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')                                                              ' + #13#10 +
         '           END AS VARCHAR2(20)                                                                                         ' + #13#10 +
         '      ) CPF_CNPJ_MASC,
}
         // Paulo Nobre - WO33342 - Fim
         '       TRIM(P.RAZAOSOCIAL) RAZAOSOCIAL,                                                                                ' + #13#10 +
         '       -- Valor trazido pelo JOIN do CTE, muito mais performatico                                                      ' + #13#10 +
         '       NVL(SL.VALOR_CALCULADO, 0) AS VALOR,                                                                            ' + #13#10 +
         '       PO.DESCRICAO AS NOME_CONVENIO,                                                                                  ' + #13#10 +
         '       D.DATAPROGRAMADA,                                                                                               ' + #13#10 +
         '       D.DATAVENCTO,                                                                                                   ' + #13#10 +
         '       '''' AS VERSAO_FOLHA,                                                                                           ' + #13#10 +
         '       -1 AS IDHSTFOLHABENEF,                                                                                          ' + #13#10 +
         '       FO.DESCRICAO FORMA_PAGTO,                                                                                       ' + #13#10 +
         '       CAST(RPAD('' '', 250, '' '') AS VARCHAR2(250)) AS MSGERRO,                                                      ' + #13#10 +
         '       NVL(FO.FLGPAGTOAUTONOMO, 0) AS FLGPAGTOAUTONOMO,                                                                ' + #13#10 +
         '       NVL(FO.TIPOFORMA, -1) AS TIPOFORMA,                                                                             ' + #13#10 +
         '       NVL(FO.FLGPERMITELISTAFAVORECIDO, ''N'') AS FLGPERMITELISTAFAVORECIDO,                                          ' + #13#10 +
         '       NVL(FO.FLGPERMITETITULOSPAGTO, ''N'') AS FLGPERMITETITULOSPAGTO                                                 ' + #13#10 +
         'FROM CM.DOCUMENTO D                                                                                                    ' + #13#10 +
         'JOIN CM.PESSOA P ON P.IDPESSOA = D.IDFORCLI                                                                            ' + #13#10 +
         '-- Join otimizado com a soma pre-calculada                                                                             ' + #13#10 +
         'LEFT JOIN SOMA_LANCAMENTOS SL ON SL.CODDOCUMENTO = D.CODDOCUMENTO                                                      ' + #13#10 +
         'LEFT JOIN CM.FORMARECPAG FO ON FO.CODFORMA = D.CODFORMA AND FO.FLGARQUIVO = ''S''                                      ' + #13#10 +
         'JOIN CM.PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA                                                           ' + #13#10 +
         'JOIN AGRUPADO AG ON AG.CODPORTFORMA = D.CODPORTFORMA                                                                   ' + #13#10 +
         '               AND AG.IDFORCLI = D.IDFORCLI                                                                            ' + #13#10 +
         '               AND AG.DATAPROGRAMADA = D.DATAPROGRAMADA                                                                ' + #13#10 +
         '               AND AG.NODOCUMENTO = D.NODOCUMENTO                                                                      ' + #13#10 +
         '               AND AG.NUMAPGR = D.NUMAPGR                                                                              ' + #13#10 +
         'WHERE D.RECPAG = ''P''                                                                                                 ' + #13#10 +
         '      AND D.STATUS NOT IN (''1'', ''2'')                                                                               ' + #13#10 +
         '      AND ((D.DATAPROGRAMADA >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''))                               ' + #13#10 +
         '      AND (D.DATAPROGRAMADA <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY'')))                               ' + #13#10;

  If pConvenio <> '' Then
    sSql := sSql + '      AND D.CODPORTFORMA = ' + quotedstr(pConvenio) + #13#10;

  If pFormaPagto <> '-1' Then
    sSql := sSql + '      AND D.CODFORMA = ' + quotedstr(pFormaPagto) + #13#10;

  sSql := sSql + '      ----------------------------------------------------------                         ' + #13#10 +
      '      -- BLOCO OTIMIZADO DE NOT EXISTS (DIVIDIR PARA CONQUISTAR)                                    ' + #13#10 +
      '      ----------------------------------------------------------                                    ' + #13#10 +
      '      -- 1. Verifica TIPO 1 (Direto)                                                                ' + #13#10 +
      '      AND NOT EXISTS (                                                                              ' + #13#10 +
      '      SELECT 1                                                                                      ' + #13#10 +
      '      FROM CM.ARQUIVOPAGTO AP                                                                       ' + #13#10 +
      '      JOIN CM.ARQUIVOXDOCUM AXD ON AXD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                           ' + #13#10 +
      '      WHERE AP.FLGENVIADO <> ''C''                                                                  ' + #13#10 +
      '            AND AXD.TIPO = 1                                                                        ' + #13#10 +
      '            AND AXD.ID_DOC_CODBARRAS_PESSOAS = D.CODDOCUMENTO                                       ' + #13#10 +
      '                     )                                                                              ' + #13#10 +
      '      -- 2. Verifica TIPO 2 (Via DocumentoXPessoas)                                                 ' + #13#10 +
      '      AND NOT EXISTS (                                                                              ' + #13#10 +
      '      SELECT 1                                                                                      ' + #13#10 +
      '      FROM CM.ARQUIVOPAGTO AP                                                                       ' + #13#10 +
      '      JOIN CM.ARQUIVOXDOCUM AXD ON AXD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                           ' + #13#10 +
      '      JOIN CM.DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AXD.ID_DOC_CODBARRAS_PESSOAS         ' + #13#10 +
      '      WHERE AP.FLGENVIADO <> ''C''                                                                  ' + #13#10 +
      '            AND AXD.TIPO = 2                                                                        ' + #13#10 +
      '            AND DP.CODDOCUMENTO = D.CODDOCUMENTO                                                    ' + #13#10 +
      '                     )                                                                              ' + #13#10 +
      '      -- 3. Verifica TIPO 3 (Via DocumentoXCodBarras)                                               ' + #13#10 +
      '      AND NOT EXISTS (                                                                              ' + #13#10 +
      '      SELECT 1                                                                                      ' + #13#10 +
      '      FROM CM.ARQUIVOPAGTO AP                                                                       ' + #13#10 +
      '      JOIN CM.ARQUIVOXDOCUM AXD ON AXD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                           ' + #13#10 +
      '      JOIN CM.DOCUMENTOXCODBARRAS DC ON DC.IDDOCUMENTOXCODBARRAS = AXD.ID_DOC_CODBARRAS_PESSOAS     ' + #13#10 +
      '      WHERE AP.FLGENVIADO <> ''C''                                                                  ' + #13#10 +
      '            AND AXD.TIPO = 3                                                                        ' + #13#10 +
      '            AND DC.CODDOCUMENTO = D.CODDOCUMENTO                                                    ' + #13#10 +
      '                     )                                                                              ' + #13#10 +
      '      -- 4. Verifica TIPO 4 (Via Grupo CNAB)                                                        ' + #13#10 +
      '      AND NOT EXISTS (                                                                             ' + #13#10 +
      '      SELECT 1                                                                                     ' + #13#10 +
      '      FROM CM.ARQUIVOPAGTO AP                                                                      ' + #13#10 +
      '      JOIN CM.ARQUIVOXDOCUM AXD ON AXD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                          ' + #13#10 +
      '      JOIN CM.DOCUMENTO DAG ON DAG.CODGRUPOCNAB = AXD.ID_DOC_CODBARRAS_PESSOAS                     ' + #13#10 +
      '      WHERE AP.FLGENVIADO <> ''C''                                                                 ' + #13#10 +
      '            AND AXD.TIPO = 4                                                                       ' + #13#10 +
      '            AND DAG.CODDOCUMENTO = D.CODDOCUMENTO                                                  ' + #13#10 +
      '                     )                                                                             ' + #13#10 +
      '     )                                                                                             ' + #13#10;
  sSql := sSql + 'GROUP BY MARCADO,                                                                                             ' + #13#10 +
                 '         NUM_AP,                                                                                               ' + #13#10 +
                 '         NUM_DOC,                                                                                              ' + #13#10 +
                 '         CPF_CNPJ_MASC,                                                                                        ' + #13#10 +
                 '         RAZAOSOCIAL,                                                                                          ' + #13#10 +
                 '         FORMA_PAGTO,                                                                                          ' + #13#10 +
                 '         DATAPROGRAMADA,                                                                                       ' + #13#10 +
                 '         MSGERRO,                                                                                              ' + #13#10 +
                 '         NUMDOCUMENTO,                                                                                         ' + #13#10 +
                 '         CODDOCUMENTO,                                                                                         ' + #13#10 +
                 '         CODFORMA,                                                                                             ' + #13#10 +
                 '         NOME_CONVENIO,                                                                                        ' + #13#10 +
                 '         CODPORTFORMA,                                                                                         ' + #13#10 +
                 '         FLGPERMITELISTAFAVORECIDO,                                                                            ' + #13#10 +
                 '         FLGPERMITETITULOSPAGTO,                                                                               ' + #13#10 +
                 '         IDHSTFOLHABENEF,                                                                                      ' + #13#10 +
                 '         IDFORCLI,                                                                                             ' + #13#10 +
                 '         DATAVENCTO,                                                                                           ' + #13#10 +
                 '         IDMODULO,                                                                                             ' + #13#10 +
                 '         FLGPAGTOAUTONOMO,                                                                                     ' + #13#10 +
                 '         TIPOFORMA,                                                                                            ' + #13#10 +
                 '         CODGRUPOCNAB                                                                                          ' + #13#10 +
  // Paulo Nobre - WO29249 - Fim

      'ORDER BY DATAPROGRAMADA, FORMA_PAGTO, RAZAOSOCIAL, NUM_AP                                            ' + #13#10;
  Result := sSql;
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovRemessaCap.txt');
end;

{function TCtrlRemessaEletronica.GetMovimentoRemessaCap(pConvenio,
  pFormaPagto: String; pDataIni, pDataFim: TDateTime): string;
var
  sSql: string;
begin
  //Everson Cunha - SIG130589 - Ini
  sSql := 'SELECT ''S'' MARCADO, ' + #13#10 +
          //Everson Cunha - SIG117206 - Ini
          //'       D.CODDOCUMENTO,                                                                        ' + #13#10 +
          //'       D.IDMODULO,                                                                            ' + #13#10 + //Everson Cunha - SIG84050
          '       NVL2(D.CODGRUPOCNAB, -1, D.CODDOCUMENTO) CODDOCUMENTO,                                 ' + #13#10 +
          '       D.CODGRUPOCNAB,                                                                        ' + #13#10 +
          '       NVL2(D.CODGRUPOCNAB, -1, D.IDMODULO) IDMODULO,                                         ' + #13#10 +
          '       NVL2(D.CODGRUPOCNAB, 4, 1) TIPO, /*1 - CODDOCUMENTO, 4 - AGRUPADO*/                    ' + #13#10 +
          //Everson Cunha - SIG117206 - Fim  }

{  sSql := '  WITH AGRUPADO AS ( ' + #13#10 +
          'SELECT COUNT(*) QTD, ' + #13#10 +
          '	      D.CODPORTFORMA, D.IDFORCLI, D.DATAPROGRAMADA, D.NODOCUMENTO, D.NUMAPGR ' + #13#10 +
          '  FROM CM.DOCUMENTO D ' + #13#10 +
          ' GROUP BY D.CODPORTFORMA, D.IDFORCLI, D.DATAPROGRAMADA, D.NODOCUMENTO, D.NUMAPGR) ' + #13#10 +

          'SELECT ''S'' MARCADO, ' + #13#10 +
          '       DECODE(AG.QTD, 1, D.CODDOCUMENTO, -1) CODDOCUMENTO,                                    ' + #13#10 +
          '       D.CODGRUPOCNAB,                                                                        ' + #13#10 +
          '       DECODE(AG.QTD, 1, D.IDMODULO, -1) IDMODULO,                                            ' + #13#10 +
          '       DECODE(AG.QTD, 1, 1, 4) TIPO, /*1 - CODDOCUMENTO, 4 - AGRUPADO*/                       ' + #13#10 +
  //Everson Cunha - SIG130589 - Fim

          '       D.CODFORMA,                                                                            ' + #13#10 +
          '       D.CODPORTFORMA,                                                                        ' + #13#10 +
          '       D.NUMAPGR NUM_AP,                                                                      ' + #13#10 +
          '       D.NODOCUMENTO NUM_DOC,                                                                 ' + #13#10 +
          '       P.IDPESSOA IDFORCLI,                                                                   ' + #13#10 + //Everson Cunha - SIG84050
          '       trim(P.NUMDOCUMENTO) NUMDOCUMENTO,                                                     ' + #13#10 + //Everson Luiz - SIG TIBERO
          '       CAST(                                                                                  ' + #13#10 +
          '       CASE LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''))                                    ' + #13#10 +
          '           WHEN 11 THEN                                                                       ' + #13#10 +
//       '             regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{3} //)([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'')  ' + #13#10 +
//        '           WHEN 14 THEN                                                                       ' + #13#10 +
//        '             regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'')  ' + #13#10 +
//        '           ELSE                                                                               ' + #13#10 +
{         '             REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')                                           ' + #13#10 +
          '       END AS VARCHAR2(20)) CPF_CNPJ_MASC,                                                    ' + #13#10 +
          '       TRIM(P.RAZAOSOCIAL) RAZAOSOCIAL,                                                       ' + #13#10 +
          '       SUM(                                                                                   ' + #13#10 + //Everson Cunha - SIG117206
          '       (SELECT SUM(DECODE(LANC.DEBCRE, ''D'',                                                 ' + #13#10 +
          '               DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1),                        ' + #13#10 +
          '               DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR              ' + #13#10 +
          '        FROM LANCTODOCUM LANC                                                                 ' + #13#10 +
          '        JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO                            ' + #13#10 +
          '        WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO)                                             ' + #13#10 +
          '        ) VALOR,                                                                              ' + #13#10 + //Everson Cunha - SIG117206
          '       PO.DESCRICAO AS NOME_CONVENIO,                                                         ' + #13#10 +
          '       D.DATAPROGRAMADA,                                                                      ' + #13#10 +
          '       D.DATAVENCTO,                                                                          ' + #13#10 +  //Everson Cunha - SIG84050
          '       '''' AS VERSAO_FOLHA,                                                                  ' + #13#10 +
          '       -1 AS IDHSTFOLHABENEF,                                                                 ' + #13#10 +
          '       FO.DESCRICAO FORMA_PAGTO,                                                              ' + #13#10 +
          '       FO.FLGPERMITELISTAFAVORECIDO,                                                          ' + #13#10 +
          '       FO.FLGPERMITETITULOSPAGTO,                                                             ' + #13#10 +
          '       CAST(RPAD('' '', 250, '' '') AS VARCHAR2(250)) AS MSGERRO                              ' + #13#10 +
          '       , NVL(FO.FLGPAGTOAUTONOMO, 0) AS FLGPAGTOAUTONOMO                                      ' + #13#10 +
          '       , NVL(FO.TIPOFORMA, -1) AS TIPOFORMA                                                   ' + #13#10 +
          '       , NVL(FO.FLGPERMITELISTAFAVORECIDO, ''N'') AS FLGPERMITELISTAFAVORECIDO                  ' + #13#10 +
          '       , NVL(FO.FLGPERMITETITULOSPAGTO, ''N'') AS FLGPERMITETITULOSPAGTO                        ' + #13#10 +
          '  FROM DOCUMENTO D                                                                            ' + #13#10 +
          '  JOIN PESSOA P ON P.IDPESSOA = D.IDFORCLI                                                    ' + #13#10 +
          '  JOIN LANCTODOCUM L ON L.CODDOCUMENTO = D.CODDOCUMENTO AND L.OPERACAO = 2                    ' + #13#10 +
          '  LEFT JOIN FORMARECPAG FO ON FO.CODFORMA = D.CODFORMA AND FO.FLGARQUIVO = ''S''              ' + #13#10 + // 'S' = Formas que geram arquivo de remessa
          '  JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA                                   ' + #13#10 +

          //Everson Cunha - SIG130589 - Ini
          '  JOIN AGRUPADO AG ON AG.CODPORTFORMA = D.CODPORTFORMA AND AG.IDFORCLI = D.IDFORCLI AND AG.DATAPROGRAMADA = D.DATAPROGRAMADA AND AG.NODOCUMENTO = D.NODOCUMENTO AND AG.NUMAPGR = D.NUMAPGR ' + #13#10 +
          //Everson Cunha - SIG130589 - Fim

          ' WHERE D.RECPAG = ''P''                                                                       ' + #13#10 +
          '   AND D.STATUS NOT IN (1, 2)                                                                 ' + #13#10 +
          '   AND NOT EXISTS (SELECT 1                                                                   ' + #13#10 +
          '                     FROM ARQUIVOPAGTO AP                                                     ' + #13#10 +
          '                     JOIN ARQUIVOXDOCUM AXD ON AXD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO         ' + #13#10 +
          '                     LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 2      ' + #13#10 +
          '                     LEFT JOIN DOCUMENTOXCODBARRAS DC ON DC.IDDOCUMENTOXCODBARRAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 3  ' + #13#10 +
          '                     LEFT JOIN DOCUMENTO DAG ON DAG.CODGRUPOCNAB = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 4                   ' + #13#10 + //Everson Cunha - SIG117206
          '                    WHERE AP.FLGENVIADO <> ''C''                                              ' + #13#10 + // Cancelado
          '                      AND DECODE(AXD.TIPO, 1, AXD.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DC.CODDOCUMENTO, 4, DAG.CODDOCUMENTO) = D.CODDOCUMENTO)  ' + #13#10;

  If pConvenio <> '' Then
    sSql := sSql + '      AND D.CODPORTFORMA = ' + quotedstr(pConvenio) + #13#10;

  If pFormaPagto <> '-1' Then
    sSql := sSql + '   AND D.CODFORMA = ' + quotedstr(pFormaPagto) + #13#10;

  sSql := sSql + '   AND ((D.DATAPROGRAMADA >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''))   ' + #13#10 +
    '   AND (D.DATAPROGRAMADA <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY'')))                ' + #13#10;

  //Everson Cunha - SIG130589 - Ini
  //Everson Cunha - SIG117206 - Ini
  {sSql := sSql + '   GROUP BY NVL2(D.CODGRUPOCNAB, -1, D.CODDOCUMENTO),                                   ' + #13#10 +
                 '            D.CODGRUPOCNAB, NVL2(D.CODGRUPOCNAB, -1, D.IDMODULO),                       ' + #13#10 +
                 '            NVL2(D.CODGRUPOCNAB, 4, 1), D.CODFORMA, D.CODPORTFORMA,                     ' + #13#10 +}
//sSql := sSql + '   GROUP BY DECODE(AG.QTD, 1, D.CODDOCUMENTO, -1),                                      ' + #13#10 +
//               '            D.CODGRUPOCNAB, DECODE(AG.QTD, 1, D.IDMODULO, -1),                          ' + #13#10 +
//               '            DECODE(AG.QTD, 1, 1, 4), D.CODFORMA, D.CODPORTFORMA,                        ' + #13#10 +
  //Everson Cunha - SIG130589 - Fim

{                '            D.NUMAPGR, D.NODOCUMENTO, P.IDPESSOA, trim(P.NUMDOCUMENTO),                 ' + #13#10 +
                 '            CAST(                                                                       ' + #13#10 +
                 '            CASE LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''))                         ' + #13#10 +
                 '              WHEN 11 THEN                                                              ' + #13#10 +  }
//               '                regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'')              ' + #13#10 +
//              '              WHEN 14 THEN                                                              ' + #13#10 +
//               '                regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'') ' + #13#10 +
{                '              ELSE                                                                      ' + #13#10 +
                 '                REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')                                  ' + #13#10 +
                 '            END AS VARCHAR2(20)),                                                       ' + #13#10 +
                 '            TRIM(P.RAZAOSOCIAL), PO.DESCRICAO, D.DATAPROGRAMADA,                        ' + #13#10 +
                 '            D.DATAVENCTO, FO.DESCRICAO, FO.FLGPERMITELISTAFAVORECIDO,                   ' + #13#10 +
                 '            FO.FLGPERMITETITULOSPAGTO, NVL(FO.FLGPAGTOAUTONOMO, 0),                     ' + #13#10 +
                 '            NVL(FO.TIPOFORMA, -1), NVL(FO.FLGPERMITELISTAFAVORECIDO, ''N''),            ' + #13#10 +
                 '            NVL(FO.FLGPERMITETITULOSPAGTO, ''N'')                                       ' + #13#10;
  //Everson Cunha - SIG117206 - Fim

  sSql := sSql + 'ORDER BY D.DATAPROGRAMADA, FO.DESCRICAO, TRIM(P.RAZAOSOCIAL), D.NODOCUMENTO     ';

  Result := sSql;
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovRemessaCap.txt');
end;  }

// Paulo Nobre - WO28070 - Fim

function TCtrlRemessaEletronica.GetMovimentoRemessaFB(pConvenio,
  pFormaPagto: String; pDataIni, pDataFim: TDateTime): string;
var
  sSql: string;
begin
  sSql := 'SELECT ''S'' MARCADO,                                                                                        ' + #13#10 +
          '       D.CODDOCUMENTO,                                                                                       ' + #13#10 +
          '       D.CODFORMA,                                                                                           ' + #13#10 +
          '       D.CODPORTFORMA,                                                                                       ' + #13#10 +
          '       D.NUMAPGR NUM_AP,                                                                                     ' + #13#10 +
          '       D.NODOCUMENTO NUM_DOC,                                                                                ' + #13#10 +
      //    '       REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'') NUMDOCUMENTO,                                   ' + #13#10 + //Everson Luiz - SIG TIBERO
          '       trim(P.NUMDOCUMENTO) NUMDOCUMENTO,                                   ' + #13#10 +                     //Everson Luiz - SIG TIBERO
          // Paulo Nobre - WO33342 - Inicio
          '       CAST(CM.FN_FORMATACPFCNPJ(P.NUMDOCUMENTO) AS VARCHAR2(18)) AS CPF_CNPJ_MASC,                          ' + #13#10 +
          //'       CAST(                                                                                                 ' + #13#10 +
          //'            CASE LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''))                                              ' + #13#10 +
          //'            WHEN 11 THEN regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'') ' + #13#10 +
          //'            WHEN 14 THEN regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'') ' + #13#10 +
          //'            ELSE REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')                                                      ' + #13#10 +
          //'            END AS VARCHAR2(20)) CPF_CNPJ_MASC,                                                              ' + #13#10 +
          // Paulo Nobre - WO33342 - Fim
          '       P.RAZAOSOCIAL,                                                                                        ' + #13#10 +
          '       (SELECT SUM(DECODE(LANC.DEBCRE, ''D'',                                                                ' + #13#10 +
          '               DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1),                                       ' + #13#10 +
          '                      DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR                      ' + #13#10 +
          '          FROM LANCTODOCUM LANC                                                                              ' + #13#10 +
          '          JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO                                         ' + #13#10 +
          '         WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO AND lanc.operacao <> 5) VALOR,                             ' + #13#10 +
          '       PO.DESCRICAO AS NOME_CONVENIO,                                                                        ' + #13#10 +
          '       D.DATAPROGRAMADA,                                                                                     ' + #13#10 +
          '       HFB.HISTORICO,                                                                                        ' + #13#10 +
          '       FO.DESCRICAO FORMA_PAGTO,                                                                             ' + #13#10 +
          '       HFB.IDHSTFOLHABENEF,                                                                                  ' + #13#10 +
          '       HFB.HISTORICO AS VERSAO_FOLHA,                                                                        ' + #13#10 +
          '       FO.FLGPERMITELISTAFAVORECIDO,                                                                         ' + #13#10 +
          '       FO.FLGPERMITETITULOSPAGTO,                                                                            ' + #13#10 +
          '       CAST(RPAD('' '', 250, '' '') AS VARCHAR2(250)) AS MSGERRO                                             ' + #13#10 +
          '       , 0 AS FLGPAGTOAUTONOMO                                                                               ' + #13#10 +
          '  FROM DOCUMENTO D                                                                                           ' + #13#10 +
          '  JOIN PESSOA P ON P.IDPESSOA = D.IDFORCLI                                                                   ' + #13#10 +
          '  JOIN LANCTODOCUM L ON L.CODDOCUMENTO = D.CODDOCUMENTO AND L.OPERACAO = 2                                   ' + #13#10 +
          '  LEFT JOIN FORMARECPAG FO ON FO.CODFORMA = D.CODFORMA AND FO.FLGARQUIVO = ''S''                             ' + #13#10 +
          '  JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA                                                  ' + #13#10 +
          '  JOIN HSTFOLHABENEFCAP HFC ON HFC.CODDOCUMENTO = D.CODDOCUMENTO                                             ' + #13#10 +
          '  JOIN HSTFOLHABENEF HFB ON HFB.IDHSTFOLHABENEF = HFC.IDHSTFOLHABENEF                                        ' + #13#10 +
          ' WHERE D.RECPAG = ''P''                                                                                      ' + #13#10 +
          '   AND D.STATUS NOT IN (1, 2)                                                                                ' + #13#10 +
          '   AND NOT EXISTS (SELECT 1                                                                                  ' + #13#10 +
          '                     FROM ARQUIVOPAGTO AP                                                                    ' + #13#10 +
          '                     JOIN ARQUIVOXDOCUM AXD ON AXD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                        ' + #13#10 +
          '                     LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 2 ' + #13#10 +
          '                     LEFT JOIN DOCUMENTOXCODBARRAS DC ON DC.IDDOCUMENTOXCODBARRAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 3   ' + #13#10 +
          '                    WHERE AP.FLGENVIADO <> ''C''                                                              ' + #13#10 +
          '                      AND DECODE(AXD.TIPO, 1, AXD.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DC.CODDOCUMENTO) = D.CODDOCUMENTO)  ' + #13#10 +
          '   AND D.CODPORTFORMA = ' + pConvenio                                                                          + #13#10 +
          '   AND (D.DATAPROGRAMADA >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''))                         ' + #13#10 +
          '   AND (D.DATAPROGRAMADA <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY''))                         ' + #13#10 +
          ' ORDER BY D.DATAPROGRAMADA, FO.DESCRICAO, P.RAZAOSOCIAL, D.NODOCUMENTO                                       ';
  Result := sSql;
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovRemessaFb.txt');
end;

function TCtrlRemessaEletronica.GetMovimentoRemessaFP(pConvenio,
  pFormaPagto: String; pDataIni, pDataFim: TDateTime): string;
var
  sSql: string;
begin
  sSql := 'SELECT ''S'' AS MARCADO,                                                                                     ' + #13#10 +
          '       0 AS NUM_AP,                                                                                          ' + #13#10 +
          '       0 AS NUM_DOC,                                                                                         ' + #13#10 +
          '       ''0'' AS NUMDOCUMENTO,                                                                                ' + #13#10 +
          '       -1 AS CODDOCUMENTO,                                                                                   ' + #13#10 +
          '       IDMOTIVO,                                                                                             ' + #13#10 +
          '       MOTIVO,                                                                                               ' + #13#10 +
          '       CODFORMA,                                                                                             ' + #13#10 +
          '       CODPORTFORMA,                                                                                         ' + #13#10 +
          // Paulo Nobre - WO33342 - Inicio
          '       CAST(CM.FN_FORMATACPFCNPJ(CGCCPF) AS VARCHAR2(18)) AS CPF_CNPJ_MASC,                                  ' + #13#10 +
          //'       CAST(                                                                                                 ' + #13#10 +
          //'       CASE LENGTH(REGEXP_REPLACE(CGCCPF, ''\D''))                                                           ' + #13#10 +
          //'           WHEN 11 THEN                                                                                      ' + #13#10 +
          //'             regexp_replace(REGEXP_REPLACE(CGCCPF, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'')  ' + #13#10 +
          //'           WHEN 14 THEN                                                                                      ' + #13#10 +
          //'             regexp_replace(REGEXP_REPLACE(CGCCPF, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'')  ' + #13#10 +
          //'           ELSE                                                                                              ' + #13#10 +
          //'             REGEXP_REPLACE(CGCCPF, ''\D'')                                                                  ' + #13#10 +
          //'       END AS VARCHAR2(20)) CPF_CNPJ_MASC,                                                                   ' + #13#10 +
          // Paulo Nobre - WO33342 - Fim
          '       EMPRESA AS RAZAOSOCIAL,                                                                               ' + #13#10 +
          '       SUM(LIQUIDO) AS VALOR,                                                                                ' + #13#10 +
          '       NOME_CONVENIO,                                                                                        ' + #13#10 +
          '       DATAPROGRAMADA,                                                                                       ' + #13#10 +
          '       FORMA_PAGTO,                                                                                          ' + #13#10 +
          '       FLGPERMITELISTAFAVORECIDO,                                                                            ' + #13#10 +
          '       FLGPERMITETITULOSPAGTO,                                                                               ' + #13#10 +
          '       CAST(RPAD('' '', 250, '' '') AS VARCHAR2(250)) AS MSGERRO                                             ' + #13#10 +
          '  FROM (SELECT PJ.RAZAOSOCIAL AS EMPRESA,                                                                    ' + #13#10 +
          '               CGC.NUM AS CGCCPF,                                                                            ' + #13#10 +
          '               DECODE(RUBRICA.VALOR,NULL,(PROVENTOS.VALOR-DESCONTOS.VALOR),RUBRICA.VALOR) AS LIQUIDO,        ' + #13#10 +
          '               DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.IDMOTIVO, PROVENTOS.IDMOTIVO), RUBRICA.IDMOTIVO) AS IDMOTIVO, ' + #13#10 +
          '               DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.MOTIVO, PROVENTOS.MOTIVO), RUBRICA.MOTIVO) AS MOTIVO, ' + #13#10 +
          '               DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.IDPLANOPREV, PROVENTOS.IDPLANOPREV), RUBRICA.IDPLANOPREV) AS IDPLANOPREV, ' + #13#10 +
          '               DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.PLANOPREV, PROVENTOS.PLANOPREV), RUBRICA.PLANOPREV) AS PLANOPREV, ' + #13#10 +
          '               DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.DATAPAGAMENTO, PROVENTOS.DATAPAGAMENTO), RUBRICA.DATAPAGAMENTO) AS DATAPROGRAMADA, ' + #13#10 +
          '               MAX(DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.DATAEMISSAO, PROVENTOS.DATAEMISSAO), RUBRICA.DATAEMISSAO)) AS DATAEMISSAO, ' + #13#10 +
          '               PTF.CODPORTFORMA,                                                                             ' + #13#10 +
          '               PTF.NOME_CONVENIO,                                                                            ' + #13#10 +
          '               PTF.FORMA_PAGTO,                                                                              ' + #13#10 +
          '               PTF.CODFORMA,                                                                                 ' + #13#10 +
          '               PTF.CODFORMAPAGTO,                                                                            ' + #13#10 +
          '               PTF.FLGPERMITELISTAFAVORECIDO,                                                                ' + #13#10 +
          '               PTF.FLGPERMITETITULOSPAGTO                                                                    ' + #13#10 +
          '          FROM PESSOA PJ, PESSOA PF, FUNCIONARIO F,                                                          ' + #13#10 +
          '               (SELECT FP.IDFILIALPESSOA AS IDPESSOA,                                                        ' + #13#10 +
          '                       RTRIM(DO.NUMDOCUMENTO) AS NUM                                                         ' + #13#10 +
          '                  FROM DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO                                     ' + #13#10 +
          '                 WHERE ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR                                                  ' + #13#10 +
          '                        (TDO.SIGLADOCUMENTO = ''CGC:'')) AND                                                 ' + #13#10 +
          '                       (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND                                            ' + #13#10 +
          '                       (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CGC,                                             ' + #13#10 +
          '                       (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR, H.IDMOTIVO, M.DESCRICAO AS MOTIVO, PP.IDPLANOPREV, ' + #13#10 +
          '                               PP.NOME AS PLANOPREV, H.DATAPAGAMENTO, TO_DATE(H.TRGDTINCLUSAO, ''DD/MM/RRRR'') AS DATAEMISSAO ' + #13#10 +
          '                          FROM HISTRUBSAL H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP, MOTIVO M,           ' + #13#10 +
          '                               (SELECT IDPLANOPREV, NOME                                                     ' + #13#10 +
          '                                  FROM PLANPREVCONTABIL                                                      ' + #13#10 +
          '                                 WHERE IDPLANOPREV =  (SELECT NVL(IDPLANOPREVADM,IDPLANOPREV) AS IDPLANOPREV FROM PARAMGLOBAL)) PP  ' + #13#10 +
          '                         WHERE (FP.IDFILIALPESSOA = 94099) AND                                               ' + #13#10 +
          '                               (P.FLGDESCONTO     = 0) AND                                                   ' + #13#10 +
          '                               (H.IDPESSJUR       = 1) AND                                                   ' + #13#10 +
          '                               (H.MES             = TO_CHAR(TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''), ''YYYY/MM'')) AND  ' + #13#10 +
          '                               (FP.IDFILIALPESSOA = F.IDESTAB) AND                                           ' + #13#10 +
          '                               (F.IDPESSOA        = H.IDPESSOA) AND                                          ' + #13#10 +
          '                               (H.DATAPAGAMENTO IS NULL OR (H.DATAPAGAMENTO >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY'') AND  ' + #13#10 +
          '                                H.DATAPAGAMENTO <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY''))) AND ' + #13#10 +
          '                               (H.IDRUBRICA       = P.IDPROVENTO) AND                                        ' + #13#10 +
          '                               (H.IDMOTIVO = M.IDMOTIVO)                                                     ' + #13#10 +
          '                         GROUP BY H.IDPESSOA, H.IDMOTIVO, M.DESCRICAO, PP.IDPLANOPREV, PP.NOME, H.DATAPAGAMENTO, ' + #13#10 +
          '                                  TO_DATE(H.TRGDTINCLUSAO, ''DD/MM/RRRR'')) PROVENTOS,                         ' + #13#10 +
          '                       (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR, H.IDMOTIVO, M.DESCRICAO AS MOTIVO, PP.IDPLANOPREV, ' + #13#10 +
          '                               PP.NOME AS PLANOPREV, H.DATAPAGAMENTO, TO_DATE(H.TRGDTINCLUSAO, ''DD/MM/RRRR'') AS DATAEMISSAO  ' + #13#10 +
          '                          FROM HISTRUBSAL H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP, MOTIVO M,           ' + #13#10 +
          '                               (SELECT IDPLANOPREV, NOME                                                     ' + #13#10 +
          '                                  FROM PLANPREVCONTABIL                                                      ' + #13#10 +
          '                                 WHERE IDPLANOPREV =  (SELECT NVL(IDPLANOPREVADM,IDPLANOPREV) AS IDPLANOPREV FROM PARAMGLOBAL)) PP ' + #13#10 +
          '                         WHERE (FP.IDFILIALPESSOA = 94099) AND                                               ' + #13#10 +
          '                               (P.FLGDESCONTO     = 1) AND                                                   ' + #13#10 +
          '                               (H.IDPESSJUR       = 1) AND                                                   ' + #13#10 +
          '                               (H.MES             = TO_CHAR(TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''), ''YYYY/MM'')) AND  ' + #13#10 +
          '                               (FP.IDFILIALPESSOA = F.IDESTAB) AND                                           ' + #13#10 +
          '                               (F.IDPESSOA        = H.IDPESSOA) AND                                          ' + #13#10 +
          '                               (H.DATAPAGAMENTO IS NULL OR (H.DATAPAGAMENTO >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY'') AND  ' + #13#10 +
          '                                                            H.DATAPAGAMENTO <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY''))) AND ' + #13#10 +
          '                               (H.IDRUBRICA       = P.IDPROVENTO) AND                                        ' + #13#10 +
          '                               (H.IDMOTIVO = M.IDMOTIVO)                                                     ' + #13#10 +
          '                         GROUP BY H.IDPESSOA, H.IDMOTIVO, M.DESCRICAO, PP.IDPLANOPREV, PP.NOME, H.DATAPAGAMENTO, ' + #13#10 +
          '                                  TO_DATE(H.TRGDTINCLUSAO, ''DD/MM/RRRR'')) DESCONTOS,                         ' + #13#10 +
          '                       (SELECT H.IDPESSOA, H.VALORPROVENTO AS VALOR, H.IDMOTIVO, M.DESCRICAO AS MOTIVO, PP.IDPLANOPREV,  ' + #13#10 +
          '                               PP.NOME AS PLANOPREV, H.DATAPAGAMENTO, TO_DATE(H.TRGDTINCLUSAO, ''DD/MM/RRRR'') AS DATAEMISSAO ' + #13#10 +
          '                          FROM HISTRUBSAL H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP, MOTIVO M,           ' + #13#10 +
          '                               (SELECT IDPLANOPREV, NOME                                                     ' + #13#10 +
          '                                 FROM PLANPREVCONTABIL                                                       ' + #13#10 +
          '                                WHERE IDPLANOPREV =  (SELECT NVL(IDPLANOPREVADM,IDPLANOPREV) AS IDPLANOPREV FROM PARAMGLOBAL)) PP ' + #13#10 +
          '                         WHERE (FP.IDFILIALPESSOA = 94099) AND                                               ' + #13#10 +
          '                               (P.CODRUBCLT       = ''40999'') AND                                             ' + #13#10 +
          '                               (H.IDPESSJUR       = 1) AND                                                   ' + #13#10 +
          '                               (H.MES             = TO_CHAR(TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''), ''YYYY/MM'')) AND  ' + #13#10 +
          '                               (FP.IDFILIALPESSOA = F.IDESTAB) AND                                           ' + #13#10 +
          '                               (F.IDPESSOA        = H.IDPESSOA) AND                                          ' + #13#10 +
          '                               (H.DATAPAGAMENTO IS NULL OR (H.DATAPAGAMENTO >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY'') AND  ' + #13#10 +
          '                                                            H.DATAPAGAMENTO <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY''))) AND  ' + #13#10 +
          '                               (P.IDPROVENTO      = H.IDRUBRICA) AND                                         ' + #13#10 +
          '                               (H.IDMOTIVO = M.IDMOTIVO)) RUBRICA,                                           ' + #13#10 +
          '                       (SELECT POR.IDPESSOA, PFR.CODPORTFORMA, PFR.DESCRICAO AS NOME_CONVENIO,               ' + #13#10 +
          '                               FRP.DESCRICAO AS FORMA_PAGTO, FRP.CODFORMA, PFR.CODFORMAPAGTO,                ' + #13#10 +
          '                               FRP.FLGPERMITELISTAFAVORECIDO, FRP.FLGPERMITETITULOSPAGTO                     ' + #13#10 +
          '                          FROM PORTADORFORMA PFR,                                                            ' + #13#10 +
          '                               FORMARECPAG FRP,                                                              ' + #13#10 +
          '                               (SELECT F.IDPESSOA, NVL(BPF.CODPORTFORMA, PFP.CODPORTFORMA) AS CODPORTFORMA   ' + #13#10 +
          '                                  FROM FUNCIONARIO F,                                                        ' + #13#10 +
          '                                       AGENCIABANCARIA AGB,                                                  ' + #13#10 +
          '                                       BANCOPORTFOLHA BPF,                                                   ' + #13#10 +
          '                                       (SELECT NVL(CODPORTFORMA, -1) AS CODPORTFORMA                         ' + #13#10 +
          '                                          FROM BANCOPORTFOLHA                                                ' + #13#10 +
          '                                         WHERE (IDBANCO IS NULL)) PFP                                        ' + #13#10 +
          '                                 WHERE (F.IDAGENCIASALARIO = AGB.IDPESSOA) AND                               ' + #13#10 +
          '                                       (AGB.IDBANCO        = BPF.IDBANCO(+))) POR                            ' + #13#10 +
          '                         WHERE (PFR.CODPORTFORMA = POR.CODPORTFORMA) AND                                     ' + #13#10 +
          '                               (FRP.CODFORMA = PFR.CODFORMA)) PTF                                            ' + #13#10 +
          '         WHERE (PJ.IDPESSOA        = 94099) AND                                                              ' + #13#10 +
          '               (PJ.IDPESSOA        = CGC.IDPESSOA) AND                                                       ' + #13#10 +
          '               (PJ.IDPESSOA        = F.IDESTAB) AND                                                          ' + #13#10 +
          '               (F.IDPESSOA         = PF.IDPESSOA) AND                                                        ' + #13#10 +
          '               ((PROVENTOS.VALOR  IS NOT NULL) OR                                                            ' + #13#10 +
          '                (DESCONTOS.VALOR  IS NOT NULL) OR                                                            ' + #13#10 +
          '                (RUBRICA.VALOR    IS NOT NULL)) AND                                                          ' + #13#10 +
          '               (PF.IDPESSOA        = RUBRICA.IDPESSOA(+)) AND                                                ' + #13#10 +
          '               (PF.IDPESSOA        = DESCONTOS.IDPESSOA(+)) AND                                              ' + #13#10 +
          '               (PF.IDPESSOA        = PROVENTOS.IDPESSOA(+)) AND                                              ' + #13#10 +
          '               (PF.IDPESSOA        = PTF.IDPESSOA)                                                           ' + #13#10 +
          '         GROUP BY PJ.RAZAOSOCIAL, PF.NOME, PF.NUMDOCUMENTO, CGC.NUM,                                         ' + #13#10 +
          '                  DECODE(RUBRICA.VALOR,NULL,(PROVENTOS.VALOR-DESCONTOS.VALOR),RUBRICA.VALOR),                ' + #13#10 +
          '                  DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.IDMOTIVO, PROVENTOS.IDMOTIVO), RUBRICA.IDMOTIVO), ' + #13#10 +
          '                  DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.MOTIVO, PROVENTOS.MOTIVO), RUBRICA.MOTIVO), ' + #13#10 +
          '                  DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.IDPLANOPREV, PROVENTOS.IDPLANOPREV), RUBRICA.IDPLANOPREV),  ' + #13#10 +
          '                  DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.PLANOPREV, PROVENTOS.PLANOPREV), RUBRICA.PLANOPREV), ' + #13#10 +
          '                  DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.DATAPAGAMENTO, PROVENTOS.DATAPAGAMENTO), RUBRICA.DATAPAGAMENTO),  ' + #13#10 +
          '                  PTF.CODPORTFORMA, PTF.NOME_CONVENIO, PTF.FORMA_PAGTO, PTF.CODFORMA, PTF.CODFORMAPAGTO, PTF.FLGPERMITELISTAFAVORECIDO, PTF.FLGPERMITETITULOSPAGTO) ' + #13#10 +
          ' WHERE NVL(LIQUIDO, 0) <> 0                                                                                  ';
  if pConvenio <> '' then
    sSql := sSql + '      AND CODPORTFORMA = ' + QuotedStr(pConvenio) + #13#10;

  if pFormaPagto <> '-1' then
    sSql := sSql + '   AND D.CODFORMA = ' + QuotedStr(pFormaPagto) + #13#10;

  sSql := sSql +
          ' GROUP BY IDMOTIVO,                                                                                          ' + #13#10 +
          '          MOTIVO,                                                                                            ' + #13#10 +
          '          CODFORMA,                                                                                          ' + #13#10 +
          '          CODPORTFORMA,                                                                                      ' + #13#10 +
          // Paulo Nobre - WO33342 - Inicio
          '          CAST(CM.FN_FORMATACPFCNPJ(CGCCPF) AS VARCHAR2(18)),                                                ' + #13#10 +
          //'          CAST(                                                                                              ' + #13#10 +
          //'               CASE LENGTH(REGEXP_REPLACE(CGCCPF, ''\D''))                                                   ' + #13#10 +
          //'               WHEN 11 THEN                                                                                  ' + #13#10 +
          //'                 regexp_replace(REGEXP_REPLACE(CGCCPF, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'') ' + #13#10 +
          //'               WHEN 14 THEN                                                                                  ' + #13#10 +
          //'                 regexp_replace(REGEXP_REPLACE(CGCCPF, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'') ' + #13#10 +
          //'               ELSE                                                                                          ' + #13#10 +
          //'               REGEXP_REPLACE(CGCCPF, ''\D'')                                                                ' + #13#10 +
          //'          END AS VARCHAR2(20)),                                                                              ' + #13#10 +
          // Paulo Nobre - WO33342 - Fim
          '          EMPRESA,                                                                                           ' + #13#10 +
          '          NOME_CONVENIO,                                                                                     ' + #13#10 +
          '          DATAPROGRAMADA,                                                                                    ' + #13#10 +
          '          FORMA_PAGTO,                                                                                       ' + #13#10 +
          '          FLGPERMITELISTAFAVORECIDO,                                                                         ' + #13#10 +
          '          FLGPERMITETITULOSPAGTO                                                                             ' + #13#10 +
          ' ORDER BY DATAPROGRAMADA, MOTIVO';
  Result := sSql;
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovRemessaFp.txt');
end;

function TCtrlRemessaEletronica._GetFavorecidosFB(pConvenio: string; pDataIni, pDataFim: TDateTime; pCodDocumento: Integer): OleVariant;
var
  sSql: string;
begin
  sSql := 'SELECT CODDOCUMENTO, IDPESSJUR, IDRESPONSAVEL AS IDPESSOA,                                                               ' + #13#10 +
          '       LTRIM(NOME) AS NOME, CPF, NUMBANCO, CODAGENCIA, 1 AS TIPOCONTA,                                                   ' + #13#10 +
          '       CONTA, NUMOPERACAO, SUM(LIQUIDO) AS LIQUIDO                                                                       ' + #13#10 +
          '  FROM (SELECT G.CODDOCUMENTO, G.IDPESSJUR, G.IDTITULAR AS IDPESSOA, G.IDRESPONSAVEL,                                    ' + #13#10 +
          '               G.NOME, G.NUMDOCUMENTO AS CPF, G.NUMBANCO, G.NUMAGENCIA AS CODAGENCIA,                                    ' + #13#10 +
          '               G.CONTACORRENTE AS CONTA, SUBSTR(G.CONTACORRENTE, 0, 3) AS NUMOPERACAO,                                   ' + #13#10 +
          '               G.VALORPROVENTO AS LIQUIDO, G.MATRICULA, G.IDPLANOPREV, NVL(LEAD(G.IDPLANOPREV) OVER(ORDER BY G.IDPESSJUR, G.VALORPROVENTO), 0) AS IDPLANOPREV_L ' + #13#10 +
          '          FROM (SELECT HS.IDPESSJUR, HS.IDTITULAR, HS.CODDOCUMENTO,                                                      ' + #13#10 +
          '                       HS.IDRESPONSAVEL, P.NOME, P.NUMDOCUMENTO,                                                         ' + #13#10 +
          '                       HS.NUMBANCO, HS.NUMAGENCIA, HS.CONTACORRENTE, D.MATRICULA, HS.IDCBANCARIA,                        ' + #13#10 +
          '                       SUM(DECODE(PR.FLGDESCONTO,0,                                                                      ' + #13#10 +
          '                                  DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO,0),                                           ' + #13#10 +
          '                                         DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO*-1,0))) VALORPROVENTO,                 ' + #13#10 +
          '                       PF.IDPLANOPREV AS IDPLANOPREV                                                                     ' + #13#10 +
          '                  FROM HISTRUBSAL HS                                                                                     ' + #13#10 +
          '          JOIN PROVDESC PR ON PR.IDPROVENTO = HS.IDRUBRICA                                                               ' + #13#10 +
          '          JOIN PESSOA P ON HS.IDRESPONSAVEL = P.IDPESSOA                                                                 ' + #13#10 +
          '          LEFT JOIN DEPENTIT D ON HS.IDTITULAR = D.IDTITULAR AND HS.IDRESPONSAVEL = D.IDPESSOA                           ' + #13#10 +
          '          JOIN PERFILINVEST PF ON PF.IDPERFILINVEST = HS.IDPERFILINVEST                                                  ' + #13#10 +
          '          JOIN DOCUMENTO DO ON DO.CODDOCUMENTO = HS.CODDOCUMENTO AND DO.CODPORTFORMA = ' + pConvenio                       + #13#10 +
          '           AND DO.DATAPROGRAMADA >= TO_DATE(' + QuotedStr(DateTimeToStr(pDataIni)) +', ''DD/MM/YYYY'')                   ' + #13#10 +
          '           AND DO.DATAPROGRAMADA <= TO_DATE(' + QuotedStr(DateTimeToStr(pDataFim)) +', ''DD/MM/YYYY'')                   ' + #13#10 +
          '           AND DO.CODDOCUMENTO = ' + IntToStr(pCodDocumento)                                                               + #13#10 +
          '         WHERE (NVL(HS.FLGESTORNO,0) = 0)                                                                                ' + #13#10 +
          '           AND HS.CODDOCUMENTO = ' + IntToStr(pCodDocumento)                                                               + #13#10 +
          '           AND (PR.FLGESPECIAL = 0)                                                                                      ' + #13#10 +
          '         GROUP BY HS.IDPESSJUR, HS.IDTITULAR, P.NOME, HS.CODDOCUMENTO,                                                   ' + #13#10 +
          '               D.MATRICULA, HS.IDRESPONSAVEL, HS.NUMBANCO, HS.NUMAGENCIA, HS.CONTACORRENTE,                              ' + #13#10 +
          '               P.NUMDOCUMENTO, PF.IDPLANOPREV) G                                                                         ' + #13#10 +
          ' WHERE G.VALORPROVENTO >= 0.01)                                                                                          ' + #13#10 +
          ' GROUP BY CODDOCUMENTO, IDPESSJUR, IDRESPONSAVEL,                                                                        ' + #13#10 +
          '          NOME, CPF, NUMBANCO, CODAGENCIA, CONTA, NUMOPERACAO, HS.IDCBANCARIA                                            ' + #13#10 +
          ' ORDER BY 14, 5, 2, 3, 4                                                                                                 ';
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_ListaFavorecidosFB.txt');
  Result := GetDataPacket(sSql);                                   
end;

function TCtrlRemessaEletronica._GetFavorecidosFP(pConvenio,
  pFormaPagto: String; pDataIni, pDataFim: TDateTime;
  pGerarPrevia: integer): OleVariant;
var
  sSql, sTabelaRubrica: string;
begin
  if pGerarPrevia <> -1 then
  begin
    if pGerarPrevia = 0 then
      sTabelaRubrica := 'PREVIFOLPAG'
    else
      sTabelaRubrica := 'HISTRUBSAL';
  end
  else
    sTabelaRubrica := '';

  sSql := 'SELECT -1 AS CODDOCUMENTO, ' +#13#10 +
          '       CODFORMA, ' +#13#10 +
          '       CODPORTFORMA, ' +#13#10 +
          '       IDMOTIVO, ' +#13#10 +
          '       DATAPROGRAMADA, ' +#13#10 +
          '       IDPESSOA, ' +#13#10 +
          '       NOME, ' +#13#10 +
          '       CPF, ' +#13#10 +
          '       NUMBANCO, ' +#13#10 +
          '       CODAGENCIA, ' +#13#10 +
          '       TRIM(SUBSTR(CONTA, 1, 3)) AS NUMOPERACAO, ' +#13#10 +
          '       TRIM(SUBSTR(CONTA, 4, LENGTH(CONTA) -2)) AS CONTA, ' +#13#10 +
          '       1 AS TIPOCONTA, ' +#13#10 +
          '       SUM(LIQUIDO) AS LIQUIDO  ' +#13#10 +
          '  FROM (SELECT PF.IDPESSOA, ' +#13#10 +
          '               PF.NOME AS NOME, ' +#13#10 +
          '               PF.NUMDOCUMENTO AS CPF, ' +#13#10 +
          '               DECODE(B.NUMBANCO, ''104'', SUBSTR(AG.NUMAGENCIA, 1, 4), AG.NUMAGENCIA) AS CODAGENCIA, ' +#13#10 +
          '               F.NUMCONTASALARIO AS CONTA, ' +#13#10 +
          '               B.NUMBANCO, ' +#13#10 +
          '               DECODE(RUBRICA.VALOR,NULL,(PROVENTOS.VALOR-DESCONTOS.VALOR),RUBRICA.VALOR) AS LIQUIDO, ' +#13#10 +
          '               DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.IDMOTIVO, PROVENTOS.IDMOTIVO), RUBRICA.IDMOTIVO) AS IDMOTIVO, ' +#13#10 +
          '               DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.DATAPAGAMENTO, PROVENTOS.DATAPAGAMENTO), RUBRICA.DATAPAGAMENTO) AS DATAPROGRAMADA, ' +#13#10 +
          '               PTF.CODPORTFORMA, ' +#13#10 +
          '               PTF.IDBANCO, ' +#13#10 +
          '               PTF.CODFORMA ' +#13#10 +
          '          FROM PESSOA PJ, PESSOA PF, PESSOA PB, PESSOA PA, FUNCIONARIO F, BANCO B, AGENCIABANCARIA AG, SITFUNC ST, ' +#13#10 +
          '               (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR, H.IDMOTIVO, M.DESCRICAO AS MOTIVO, H.DATAPAGAMENTO ' +#13#10 +
          '                  FROM ' + sTabelaRubrica + ' H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP, MOTIVO M ' +#13#10 +
          '                 WHERE (FP.IDFILIALPESSOA = 94099) AND ' +#13#10 +
          '                       (P.FLGDESCONTO     = 0) AND ' +#13#10 +
          '                       (H.IDPESSJUR       = 1) AND ' +#13#10 +
          '                       (H.MES             = TO_CHAR(TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''), ''YYYY/MM'')) AND ' +#13#10 +
          '                       (FP.IDFILIALPESSOA = F.IDESTAB) AND ' +#13#10 +
          '                       (F.IDPESSOA        = H.IDPESSOA) AND ' +#13#10 +
          '                       (H.DATAPAGAMENTO IS NULL OR (H.DATAPAGAMENTO >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY'') AND ' +#13#10 +
          '                                                    H.DATAPAGAMENTO <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY''))) AND ' +#13#10 +
          '                       (H.IDRUBRICA       = P.IDPROVENTO) AND ' +#13#10 +
          '                       (H.IDMOTIVO = M.IDMOTIVO) ' +#13#10 +
          '                 GROUP BY H.IDPESSOA, H.IDMOTIVO, M.DESCRICAO, H.DATAPAGAMENTO) PROVENTOS, ' +#13#10 +
          '               (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR, H.IDMOTIVO, M.DESCRICAO AS MOTIVO,  H.DATAPAGAMENTO ' +#13#10 +
          '                  FROM ' + sTabelaRubrica + ' H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP, MOTIVO M ' +#13#10 +
          '                 WHERE (FP.IDFILIALPESSOA = 94099) AND ' +#13#10 +
          '                       (P.FLGDESCONTO     = 1) AND ' +#13#10 +
          '                       (H.IDPESSJUR       = 1) AND ' +#13#10 +
          '                       (H.MES             = TO_CHAR(TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''), ''YYYY/MM'')) AND ' +#13#10 +
          '                       (FP.IDFILIALPESSOA = F.IDESTAB) AND ' +#13#10 +
          '                       (F.IDPESSOA        = H.IDPESSOA) AND ' +#13#10 +
          '                       (H.DATAPAGAMENTO IS NULL OR (H.DATAPAGAMENTO >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY'') AND ' +#13#10 +
          '                                                    H.DATAPAGAMENTO <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY''))) AND ' +#13#10 +
          '                       (H.IDRUBRICA       = P.IDPROVENTO) AND ' +#13#10 +
          '                       (H.IDMOTIVO = M.IDMOTIVO) ' +#13#10 +
          '                 GROUP BY H.IDPESSOA, H.IDMOTIVO, M.DESCRICAO, H.DATAPAGAMENTO) DESCONTOS, ' +#13#10 +
          '               (SELECT H.IDPESSOA, H.VALORPROVENTO AS VALOR, H.IDMOTIVO, M.DESCRICAO AS MOTIVO, H.DATAPAGAMENTO ' +#13#10 +
          '                  FROM ' + sTabelaRubrica + ' H, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP, MOTIVO M, ' +#13#10 +
          '                 WHERE (FP.IDFILIALPESSOA = 94099) AND ' +#13#10 +
          '                       (P.CODRUBCLT       = ''40999'') AND ' +#13#10 +
          '                       (H.IDPESSJUR       = 1) AND ' +#13#10 +
          '                       (H.MES             = TO_CHAR(TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''), ''YYYY/MM'')) AND ' +#13#10 +
          '                       (FP.IDFILIALPESSOA = F.IDESTAB) AND ' +#13#10 +
          '                       (F.IDPESSOA        = H.IDPESSOA) AND ' +#13#10 +
          '                       (H.DATAPAGAMENTO IS NULL OR (H.DATAPAGAMENTO >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY'') AND ' +#13#10 +
          '                                                    H.DATAPAGAMENTO <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY''))) AND ' +#13#10 +
          '                       (P.IDPROVENTO      = H.IDRUBRICA) AND ' +#13#10 +
          '                       (H.IDMOTIVO = M.IDMOTIVO)) RUBRICA, ' +#13#10 +
          '               (SELECT POR.IDPESSOA, PFR.CODPORTFORMA, PFR.CODPORTADOR, PCT.IDBANCO, FRP.CODFORMA ' +#13#10 +
          '                  FROM PORTADORFORMA PFR, PORTADORCONTA PCT, FORMARECPAG FRP, ' +#13#10 +
          '                       (SELECT F.IDPESSOA, NVL(BPF.CODPORTFORMA, PFP.CODPORTFORMA) AS CODPORTFORMA ' +#13#10 +
          '                          FROM FUNCIONARIO F,AGENCIABANCARIA AGB,BANCOPORTFOLHA BPF, ' +#13#10 +
          '                               (SELECT NVL(CODPORTFORMA, -1) AS CODPORTFORMA ' +#13#10 +
          '                                  FROM BANCOPORTFOLHA ' +#13#10 +
          '                                 WHERE (IDBANCO IS NULL)) PFP ' +#13#10 +
          '                         WHERE (F.IDAGENCIASALARIO = AGB.IDPESSOA) AND ' +#13#10 +
          '                               (AGB.IDBANCO        = BPF.IDBANCO(+))) POR ' +#13#10 +
          '                 WHERE (PCT.CODPORTADOR = PFR.CODPORTADOR) AND ' +#13#10 +
          '                       (PFR.CODPORTFORMA = POR.CODPORTFORMA) AND ' +#13#10 +
          '                       (FRP.CODFORMA = PFR.CODFORMA)) PTF ' +#13#10 +
          '         WHERE (PJ.IDPESSOA        = 94099) AND ' +#13#10 +
          '               (PJ.IDPESSOA        = F.IDESTAB) AND ' +#13#10 +
          '               (F.IDPESSOA         = PF.IDPESSOA) AND ' +#13#10 +
          '               (F.IDAGENCIASALARIO = AG.IDPESSOA) AND ' +#13#10 +
          '               (AG.IDBANCO         = B.IDPESSOA) AND ' +#13#10 +
          '               (AG.IDPESSOA        = PA.IDPESSOA) AND ' +#13#10 +
          '               (B.IDPESSOA         = PB.IDPESSOA) AND ' +#13#10 +
          '               ((PROVENTOS.VALOR  IS NOT NULL) OR ' +#13#10 +
          '                (DESCONTOS.VALOR  IS NOT NULL) OR ' +#13#10 +
          '                (RUBRICA.VALOR    IS NOT NULL)) AND ' +#13#10 +
          '               (PF.IDPESSOA        = RUBRICA.IDPESSOA(+)) AND ' +#13#10 +
          '               (PF.IDPESSOA        = DESCONTOS.IDPESSOA(+)) AND ' +#13#10 +
          '               (PF.IDPESSOA        = PROVENTOS.IDPESSOA(+)) AND ' +#13#10 +
          '               (PF.IDPESSOA        = PTF.IDPESSOA) ' +#13#10 +
          '         GROUP BY PF.IDPESSOA, PF.NOME, PF.NUMDOCUMENTO, AG.NUMAGENCIA, F.NUMCONTASALARIO, B.NUMBANCO, ' +#13#10 +
          '              DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.IDMOTIVO, PROVENTOS.IDMOTIVO), RUBRICA.IDMOTIVO), ' +#13#10 +
          '              DECODE(RUBRICA.VALOR, NULL,(PROVENTOS.VALOR-DESCONTOS.VALOR),RUBRICA.VALOR), ' +#13#10 +
          '              DECODE(RUBRICA.VALOR, NULL, DECODE(NVL(PROVENTOS.VALOR,0), 0, DESCONTOS.DATAPAGAMENTO, PROVENTOS.DATAPAGAMENTO), RUBRICA.DATAPAGAMENTO), ' +#13#10 +
          '              PTF.CODPORTFORMA, PTF.IDBANCO, PTF.CODFORMA) ' +#13#10 +
          ' WHERE NVL(LIQUIDO, 0) <> 0 ' +#13#10;
  if pConvenio <> '' then
    sSql := sSql + '      AND CODPORTFORMA = ' + QuotedStr(pConvenio) + #13#10;

  if pFormaPagto <> '-1' then
    sSql := sSql + '   AND D.CODFORMA = ' + QuotedStr(pFormaPagto) + #13#10;

  sSql := sSql + ' GROUP BY CODFORMA, CODPORTFORMA, IDMOTIVO, DATAPROGRAMADA, IDPESSOA, NOME, CPF, NUMBANCO, CODAGENCIA, TRIM(SUBSTR(CONTA, 1, 3)), ' +#13#10 +
          '          SUBSTR(CONTA, 4, LENGTH(CONTA) -2) ' +#13#10 +
          ' ORDER BY NOME ';
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_ListaFavorecidosFP.txt');
  Result := GetDataPacket(sSql);                                   
end;

function TCtrlRemessaEletronica._GetFavorecidosEmp(pConvenio: string;
  pDataIni, pDataFim: TDateTime; pCodDocumento: Integer): OleVariant;
var
    sSQL: String;
begin
  //C·ssio Rovaroto - SIG n∫ 101870 - InÌcio
  sSQL := 'SELECT CODDOCUMENTO,                                                                                                        ' +#13#10+
          '	   CODPORTFORMA,                                                                                                           ' +#13#10+
          '	   CODFORMA,                                                                                                               ' +#13#10+
          '	   DATAPROGRAMADA,                                                                                                         ' +#13#10+
          '	   IDCONTRATOEMPTMO,                                                                                                       ' +#13#10+
          '	   IDPESSOA,                                                                                                               ' +#13#10+
          '	   NOME,                                                                                                                   ' +#13#10+
          '	   CPF,                                                                                                                    ' +#13#10+
          '	   NUMBANCO,                                                                                                               ' +#13#10+
          '	   CONTA,                                                                                                                  ' +#13#10+
          '	   CODAGENCIA,                                                                                                             ' +#13#10+
          '	   NUMOPERACAO,                                                                                                            ' +#13#10+
          '	   IDCBANCARIA,                                                                                                            ' +#13#10+
          '	   TIPOCONTA,                                                                                                              ' +#13#10+
          //C·ssio Rovaroto - SIG n∫ 101924 - InÌcio
          //'	   ABS(SUM(LIQUIDO)) AS LIQUIDO                                                                                            ' +#13#10+
          '	   SUM(ABS(LIQUIDO)) AS LIQUIDO                                                                                            ' +#13#10+
          //C·ssio Rovaroto - SIG n∫ 101924 - InÌcio
          'FROM (SELECT DO.CODDOCUMENTO,                                                                                               ' +#13#10+
  //C·ssio Rovaroto - SIG n∫ 101870 - Fim
          '       DO.CODPORTFORMA,                                                                                                     ' +#13#10+
          '       DO.CODFORMA,                                                                                                         ' +#13#10+
          '       DO.DATAPROGRAMADA,                                                                                                   ' +#13#10+
          '       CE.IDCONTRATOEMPTMO,                                                                                                 ' +#13#10+
          '       PE.IDPESSOA,                                                                                                         ' +#13#10+
          '       PE.NOME,                                                                                                             ' +#13#10+
          '       PE.NUMDOCUMENTO AS CPF,                                                                                              ' +#13#10+
          '       CASE WHEN HA.TIPOMOV = 0 THEN CB1.NUMBANCO                                                                           ' +#13#10+
          '            ELSE CB2.NUMBANCO                                                                                               ' +#13#10+
          '        END NUMBANCO,                                                                                                       ' +#13#10+
          '       CASE WHEN HA.TIPOMOV = 0 THEN                                                                                        ' +#13#10+
          '            CASE WHEN INSTR(CB1.MASCARACC, ''-'') = 0 THEN SUBSTR(REGEXP_REPLACE(CB1.CONTACORRENTE, ''\W''), 4, LENGTH (REGEXP_REPLACE(CB2.CONTACORRENTE, ''\W''))) ' +#13#10+
          '            ELSE SUBSTR(REGEXP_REPLACE(CB1.CONTACORRENTE, ''\W''), 4, INSTR(TRIM(CB1.MASCARACC), ''-'')-1) ||''-''||        ' +#13#10+
          '                 SUBSTR(REGEXP_REPLACE(CB1.CONTACORRENTE, ''\W''), INSTR(TRIM(CB1.MASCARACC), ''-''), 1)                    ' +#13#10+
          '             END                                                                                                            ' +#13#10+
          '       ELSE                                                                                                                 ' +#13#10+
          '            CASE WHEN INSTR(CB2.MASCARACC, ''-'') = 0 THEN SUBSTR(REGEXP_REPLACE(CB2.CONTACORRENTE, ''\W''), 4, LENGTH (REGEXP_REPLACE(CB2.CONTACORRENTE, ''\W''))) ' +#13#10+
          '            ELSE SUBSTR(REGEXP_REPLACE(CB2.CONTACORRENTE, ''\W''), 4, INSTR(TRIM(CB2.MASCARACC), ''-'')-1) ||''-''||        ' +#13#10+
          '                 SUBSTR(REGEXP_REPLACE(CB2.CONTACORRENTE, ''\W''), INSTR(TRIM(CB2.MASCARACC), ''-''), 1)                    ' +#13#10+
          '             END                                                                                                            ' +#13#10+
          '        END AS CONTA,                                                                                                       ' +#13#10+
          '       CASE WHEN HA.TIPOMOV = 0 THEN                                                                                        ' +#13#10+
          '            CASE WHEN INSTR(CB1.MASCARAAGENCIA, ''-'') = 0 THEN REGEXP_REPLACE(CB1.NUMAGENCIA, ''\W'')                      ' +#13#10+
          '                 ELSE SUBSTR(REGEXP_REPLACE(CB1.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(CB1.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' +#13#10+
          '                      SUBSTR(REGEXP_REPLACE(CB1.NUMAGENCIA, ''\W''), INSTR(TRIM(CB1.MASCARAAGENCIA), ''-''), 1)             ' +#13#10+
          '             END                                                                                                            ' +#13#10+
          '       ELSE CASE WHEN INSTR(CB2.MASCARAAGENCIA, ''-'') = 0 THEN REGEXP_REPLACE(CB2.CONTACORRENTE, ''\W'')                   ' +#13#10+
          '                 ELSE SUBSTR(REGEXP_REPLACE(CB2.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(CB2.MASCARAAGENCIA), ''-'')-1) ||''-''|| ' +#13#10+
          '                      SUBSTR(REGEXP_REPLACE(CB2.NUMAGENCIA, ''\W''), INSTR(TRIM(CB2.MASCARAAGENCIA), ''-''), 1)             ' +#13#10+
          '             END                                                                                                            ' +#13#10+
          '        END AS CODAGENCIA,                                                                                                  ' +#13#10+
          '       CASE WHEN HA.TIPOMOV = 0 THEN TRIM(SUBSTR(CB1.CONTACORRENTE, 1, 3))                                                  ' +#13#10+
          '            ELSE TRIM(SUBSTR(CB2.CONTACORRENTE, 1, 3))                                                                      ' +#13#10+
          '        END AS NUMOPERACAO,                                                                                                 ' +#13#10+
          '       CASE WHEN HA.TIPOMOV = 0 THEN CB1.IDCBANCARIA                                                                        ' +#13#10+
          '            ELSE CB2.IDCBANCARIA                                                                                            ' +#13#10+
          '        END AS IDCBANCARIA,                                                                                                 ' +#13#10+
          '       1 AS TIPOCONTA,                                                                                                      ' +#13#10+
          '       HA.VLRPREVISTO AS LIQUIDO                                                                                            ' +#13#10+
          '  FROM HMEALL HA                                                                                                            ' +#13#10+
          '  JOIN HMEENVIO HE ON HE.IDHISTMOVEMPTMO = HA.IDHISTMOVEMPTMO                                                               ' +#13#10+
          '  JOIN CONTRATOEMPTMO CE ON CE.IDCONTRATOEMPTMO = HA.IDCONTRATOEMPTMO                                                       ' +#13#10+
          '  JOIN DOCUMENTO DO ON DO.CODDOCUMENTO = HE.CODDOCUMENTO AND DO.CODPORTFORMA = ' + pConvenio                                  +#13#10+
          '   AND DO.CODDOCUMENTO = ' + IntToStr(pCodDocumento)                                                                          +#13#10+
          '   AND DO.DATAPROGRAMADA >= TO_DATE('+ QuotedStr(DateTimeToStr(pDataIni)) + ', ''DD/MM/YYYY'')                              ' +#13#10+
          '   AND DO.DATAPROGRAMADA <= TO_DATE('+ QuotedStr(DateTimeToStr(pDataFim)) + ', ''DD/MM/YYYY'')                              ' +#13#10+
          '  JOIN PESSOA PE ON PE.IDPESSOA = CE.IDBENEF                                                                                ' +#13#10+
          '  LEFT JOIN (SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, AB.NUMAGENCIA, BA.NUMBANCO, BA.MASCARACC, BA.MASCARAAGENCIA           ' +#13#10+
          '               FROM CONTABANCARIA CB                                                                                        ' +#13#10+
          '               JOIN AGENCIABANCARIA AB ON AB.IDPESSOA = CB.IDAGENCIA                                                        ' +#13#10+
          '               JOIN BANCO BA ON BA.IDPESSOA = AB.IDBANCO) CB1 ON CB1.IDCBANCARIA = CE.IDCBANCARIA                           ' +#13#10+
          '  LEFT JOIN (SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, AB.NUMAGENCIA, BA.NUMBANCO, BA.MASCARACC, BA.MASCARAAGENCIA           ' +#13#10+
          '               FROM CONTABANCARIA CB                                                                                        ' +#13#10+
          '               JOIN AGENCIABANCARIA AB ON AB.IDPESSOA = CB.IDAGENCIA                                                        ' +#13#10+
          '               JOIN BANCO BA ON BA.IDPESSOA = AB.IDBANCO) CB2 ON CB2.IDCBANCARIA = CE.IDCBANCARIADEB                        ' +#13#10+
   //C·ssio Rovaroto - SIG n∫ 101870 - InÌcio
//          ' WHERE HA.VLRPREVISTO > 0                                                                                                   ' +#13#10+
          ' WHERE HA.VLRPREVISTO <> 0)                                                                                                 ' +#13#10+
          'GROUP BY CODDOCUMENTO,                                                                                                      ' +#13#10+
          '	   CODPORTFORMA,                                                                                                           ' +#13#10+
          '	   CODFORMA,                                                                                                               ' +#13#10+
          '	   DATAPROGRAMADA,                                                                                                         ' +#13#10+
          '	   IDCONTRATOEMPTMO,                                                                                                       ' +#13#10+
          '	   IDPESSOA,                                                                                                               ' +#13#10+
          '	   NOME,                                                                                                                   ' +#13#10+
          '	   CPF,                                                                                                                    ' +#13#10+
          '	   NUMBANCO,                                                                                                               ' +#13#10+
          '	   CONTA,                                                                                                                  ' +#13#10+
          '	   CODAGENCIA,                                                                                                             ' +#13#10+
          '	   NUMOPERACAO,                                                                                                            ' +#13#10+
          '	   IDCBANCARIA,                                                                                                            ' +#13#10+
          '	   TIPOCONTA                                                                                                               ' +#13#10+
   //C·ssio Rovaroto - SIG n∫ 101870 - Fim                                                                                                                       ' +#13#10+
          ' ORDER BY 15, 6                                                                                                             ';
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_ListaFavorecidosEmp.txt');
  Result := GetDataPacket(sSql);


end;

function TCtrlRemessaEletronica.GetMovimentoRemessaEmp(pConvenio,
  pFormaPagto: String; pDataIni, pDataFim: TDateTime): string;
var
  sSql: string;
begin
  sSql := 'SELECT ''S'' MARCADO,                                                                                        ' + #13#10 +
          '       D.CODDOCUMENTO,                                                                                       ' + #13#10 +
          '       D.CODFORMA,                                                                                           ' + #13#10 +
          '       D.CODPORTFORMA,                                                                                       ' + #13#10 +
          '       D.DATAVENCTO,                                                                                         ' + #13#10 +
          '       D.NUMAPGR NUM_AP,                                                                                     ' + #13#10 +
          '       D.NODOCUMENTO NUM_DOC,                                                                                ' + #13#10 +
          '       trim(P.NUMDOCUMENTO) NUMDOCUMENTO,                                   ' + #13#10 +                     //Everson Luiz - SIG TIBERO
          // Paulo Nobre - WO33342 - Inicio
          '       CAST(CM.FN_FORMATACPFCNPJ(P.NUMDOCUMENTO) AS VARCHAR2(18)) AS CPF_CNPJ_MASC,                          ' + #13#10 +
          //'       CAST(                                                                                                 ' + #13#10 +
          //'            CASE LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''))                                              ' + #13#10 +
          //'            WHEN 11 THEN regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'') ' + #13#10 +
          //'            WHEN 14 THEN regexp_replace(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'') ' + #13#10 +
          //'            ELSE REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')                                                      ' + #13#10 +
          //'            END AS VARCHAR2(20)) CPF_CNPJ_MASC,                                                              ' + #13#10 +
          // Paulo Nobre - WO33342 - Fim
          '       P.RAZAOSOCIAL,                                                                                        ' + #13#10 +
          '       (SELECT SUM(DECODE(LANC.DEBCRE, ''D'',                                                                ' + #13#10 +
          '               DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1),                                       ' + #13#10 +
          '                      DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR                      ' + #13#10 +
          '          FROM LANCTODOCUM LANC                                                                              ' + #13#10 +
          '          JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO                                         ' + #13#10 +
          '         WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO AND lanc.operacao <> 5) VALOR,                             ' + #13#10 +
          '       PO.DESCRICAO AS NOME_CONVENIO,                                                                        ' + #13#10 +
          '       D.DATAPROGRAMADA,                                                                                     ' + #13#10 +
          '       FO.DESCRICAO FORMA_PAGTO,                                                                             ' + #13#10 +
          '       '' '' AS VERSAO_FOLHA,                                                                                ' + #13#10 +
          '       -1 AS IDHSTFOLHABENEF,                                                                                ' + #13#10 +
          '       FO.FLGPERMITELISTAFAVORECIDO,                                                                         ' + #13#10 +
          '       FO.FLGPERMITETITULOSPAGTO,                                                                            ' + #13#10 +
          '       D.IDFORCLI,                                                                                           ' + #13#10 +
          '       D.IDMODULO,                                                                                           ' + #13#10 +          
          '       CAST(RPAD('' '', 250, '' '') AS VARCHAR2(250)) AS MSGERRO                                             ' + #13#10 +
          '       , 0 AS FLGPAGTOAUTONOMO                                                                               ' + #13#10 +
          '  FROM DOCUMENTO D                                                                                           ' + #13#10 +
          '  JOIN PESSOA P ON P.IDPESSOA = D.IDFORCLI                                                                   ' + #13#10 +
          '  JOIN LANCTODOCUM L ON L.CODDOCUMENTO = D.CODDOCUMENTO AND L.OPERACAO = 2                                   ' + #13#10 +
          '  LEFT JOIN FORMARECPAG FO ON FO.CODFORMA = D.CODFORMA AND FO.FLGARQUIVO = ''S''                             ' + #13#10 +
          '  JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA                                                  ' + #13#10 +
          ' WHERE D.RECPAG = ''P''                                                                                      ' + #13#10 +
          '   AND D.STATUS NOT IN (1, 2)                                                                                ' + #13#10 +
          '   AND NOT EXISTS (SELECT 1                                                                                  ' + #13#10 +
          '                     FROM ARQUIVOPAGTO AP                                                                    ' + #13#10 +
          '                     JOIN ARQUIVOXDOCUM AXD ON AXD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                        ' + #13#10 +
          '                     LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 2 ' + #13#10 +
          '                     LEFT JOIN DOCUMENTOXCODBARRAS DC ON DC.IDDOCUMENTOXCODBARRAS = AXD.ID_DOC_CODBARRAS_PESSOAS AND AXD.TIPO = 3   ' + #13#10 +
          '                    WHERE AP.FLGENVIADO <> ''C''                                                              ' + #13#10 +
          '                      AND DECODE(AXD.TIPO, 1, AXD.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DC.CODDOCUMENTO) = D.CODDOCUMENTO)  ' + #13#10 +
          '   AND D.CODPORTFORMA = ' + pConvenio                                                                          + #13#10 +
          '   AND (D.DATAPROGRAMADA >= TO_DATE(''' + DateToStr(pDataIni) + ''',''DD/MM/YYYY''))                         ' + #13#10 +
          '   AND (D.DATAPROGRAMADA <= TO_DATE(''' + DateToStr(pDataFim) + ''',''DD/MM/YYYY''))                         ' + #13#10 +
          ' ORDER BY D.DATAPROGRAMADA, FO.DESCRICAO, P.RAZAOSOCIAL, D.NODOCUMENTO                                       ';
  Result := sSql;
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovRemessaEmp.txt');
end;

function TCtrlRemessaEletronica._SelMovPeloTipoDaFormaPagamento_LA_Linha_A(
  pIdArqPagto, pTipFormaRecPag, pFormaLanc,
  pFinalidadeDOC: String): OleVariant;
var
  sSql: string;
begin
sSql :=
    'SELECT ROWNUM AS LINHA,                                                                                     ' + #13#10 + //C·ssio Rovaroto - SIG n∫ 101422
    '       ORDEM, ORDEM1, ORDEM2, NUM_BANCO, REG, NSR, SEG, TIPO_MOV, COD_INST, CAMARA_COMP,                               ' + #13#10 +
    '       BANCO_CLI, AGENCIA_CLI, DV_AG, CONTA_CLI, DV_CC, NOME_TERC, NUM_DOC,                                 ' + #13#10 +
    '       FILLER, TIP_CC, DT_VCTO, TIP_MOEDA, QTD_MOEDA, VALOR, NUM_DOC_BANCO,                                 ' + #13#10 +
    '       FILLER2, QTD_PARC, BLOQ_DMAISPARC, FORMA_PARC, PERIODO_DIA_VCTO,                                     ' + #13#10 +
    '       NUM_PARC, DT_EFET, VLR_EFET, INFO2, FINALIDADE_DOC, USO_FEBRA,                                       ' + #13#10 +
    '       EMITE_AVISO, OCORRENCIAS, VALOR_LANC                                                                 ' + #13#10 +
    '  FROM (                                                                                                    ' + #13#10 +
    'SELECT ''3'' ORDEM,                                                                                         ' + #13#10 +
    '       DET_A.CODDOCARQ "ORDEM1",                                                                            ' + #13#10 +
    '       ''A'' "ORDEM2",                                                                                      ' + #13#10 +
            Quotedstr(rDadosParamConv.sNumBanco) + 'NUM_BANCO,                                                   ' + #13#10 +
    '       ''3'' REG,                                                                                           ' + #13#10 +
    '       NULL NSR, --DEVER¡ SER GERAL DO LOTE, Reiniciando a cada lote gerado                                 ' + #13#10 +
    '       ''A'' SEG,                                                                                           ' + #13#10 +
    '       ''0'' TIPO_MOV, --0 = Inclus„o, 9 = Exclus„o.                                                        ' + #13#10 +
    '       LPAD(''0'', 2, ''0'') COD_INST,                                                                      ' + #13#10 +
    '       DECODE(' + quotedstr(pFormaLanc) + ', ''41'', ''018'', ''000'') CAMARA_COMP, -- ''018'' = TED, ''000'' = C. Corrente e C. PoupanÁa Caixa' + #13#10 +
    '       LPAD(DET_A.NUMBANCO, 3, ''0'') BANCO_CLI,                                                            ' + #13#10 ;

    // Andre Imakawa - SIG 101541 - Inicio
    if (Sistema.idmodulo = 18) then
      sSql := sSql +
    '       LPAD(REGEXP_REPLACE(SUBSTR(DET_A.NUMAGENCIA,1, LENGTH(DET_A.NUMAGENCIA) -1), ''[^[:digit:]]''), 5, ''0'') AGENCIA_CLI,      ' + #13#10 +
    '       RPAD(SUBSTR(DET_A.NUMAGENCIA,LENGTH(DET_A.NUMAGENCIA), 1), 1, '' '') DV_AG,                                                 ' + #13#10 +
    '       LPAD(REGEXP_REPLACE(SUBSTR(DET_A.CONTACORRENTE,1, LENGTH(DET_A.CONTACORRENTE) -1), ''[^[:digit:]]''), 12, ''0'') CONTA_CLI, ' + #13#10 +
    '       RPAD(SUBSTR(DET_A.CONTACORRENTE,LENGTH(DET_A.CONTACORRENTE), 1), 1, '' '') DV_CC,                                           ' + #13#10;
    // Andre Imakawa - SIG 101541 - Fim

    if (Sistema.idmodulo <> 18) then
      sSql := sSql +
    '       CASE                                                                                                 ' + #13#10 +
    '         WHEN DET_A.MASCARAAGENCIA IS NULL THEN                                                             ' + #13#10 +
    '           CASE                                                                                             ' + #13#10 +
    '             WHEN INSTR(DET_A.NUMAGENCIA, ''-'') = 0 THEN                                                   ' + #13#10 +
    '               LPAD(NVL(DET_A.NUMAGENCIA, 0), 5, ''0'')                                                     ' + #13#10 +
    '             ELSE                                                                                           ' + #13#10 +
    '               LPAD(NVL(SUBSTR(DET_A.NUMAGENCIA, 0, INSTR(DET_A.NUMAGENCIA, ''-'')-1), 0), 5, ''0'')        ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '         WHEN INSTR(DET_A.MASCARAAGENCIA, ''-'') = 0 THEN                                                   ' + #13#10 +
    '           LPAD(NVL(DET_A.NUMAGENCIA, 0), 5, ''0'')                                                         ' + #13#10 +
    '         ELSE                                                                                               ' + #13#10 +
    '           LPAD(NVL(SUBSTR(DET_A.NUMAGENCIA, 0, INSTR(TRIM(DET_A.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')  ' + #13#10 +
    '       END AGENCIA_CLI,                                                                                     ' + #13#10 +

    '       CASE                                                                                                 ' + #13#10 +
    '         WHEN DET_A.MASCARAAGENCIA IS NULL THEN                                                             ' + #13#10 +
    '           CASE                                                                                             ' + #13#10 +
    '             WHEN INSTR(DET_A.NUMAGENCIA, ''-'') = 0 THEN                                                   ' + #13#10 +
    '               '' ''                                                                                        ' + #13#10 +
    '             ELSE                                                                                           ' + #13#10 +
    '               NVL(SUBSTR(DET_A.NUMAGENCIA, INSTR(DET_A.NUMAGENCIA, ''-'')+1, 1), '' '')                    ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '         WHEN INSTR(DET_A.MASCARAAGENCIA, ''-'') = 0 THEN                                                   ' + #13#10 +
    '           '' ''                                                                                            ' + #13#10 +
    '         ELSE                                                                                               ' + #13#10 +
    '           NVL(SUBSTR(DET_A.NUMAGENCIA, INSTR(TRIM(DET_A.MASCARAAGENCIA), ''-'')+1, 1), '' '')              ' + #13#10 +
    '         END DV_AG,                                                                                         ' + #13#10 +
    '       CASE                                                                                                 ' + #13#10 +
    '         WHEN DET_A.MASCARACC IS NULL THEN                                                                  ' + #13#10 +
    '           CASE                                                                                             ' + #13#10 +
    '             WHEN INSTR(DET_A.CONTACORRENTE, ''-'') = 0 THEN                                                ' + #13#10 +
    '               LPAD(NVL(DET_A.CONTACORRENTE, 0), 12, ''0'')                                                 ' + #13#10 +
    '             ELSE                                                                                           ' + #13#10 +
    '               LPAD(NVL(SUBSTR(DET_A.CONTACORRENTE, 0, INSTR(DET_A.CONTACORRENTE, ''-'')-1), 0), 12, ''0'') ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '         WHEN INSTR(DET_A.MASCARACC, ''-'') = 0 THEN                                                        ' + #13#10 +
    '           LPAD(NVL(DET_A.CONTACORRENTE, 0), 12, ''0'')                                                     ' + #13#10 +
    '         ELSE                                                                                               ' + #13#10 +
    '           CASE                                                                                               ' + #13#10 +
    '             WHEN LPAD(DET_A.NUMBANCO, 3, ''0'') = ''399'' THEN                                               ' + #13#10 +
    '               LPAD(NVL(SUBSTR(DET_A.CONTACORRENTE, 0, INSTR(TRIM(DET_A.MASCARACC), ''-'')), 0), 12, ''0'')   ' + #13#10 +
    '             ELSE                                                                                             ' + #13#10 +
    '               LPAD(NVL(SUBSTR(DET_A.CONTACORRENTE, 0, INSTR(TRIM(DET_A.MASCARACC), ''-'')-1), 0), 12, ''0'') ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '         END CONTA_CLI,                                                                                     ' + #13#10 +
    '       CASE                                                                                                 ' + #13#10 +
    '         WHEN DET_A.MASCARACC IS NULL THEN                                                                  ' + #13#10 +
    '           CASE                                                                                             ' + #13#10 +
    '             WHEN INSTR(DET_A.CONTACORRENTE, ''-'') = 0 THEN                                                ' + #13#10 +
    '               '' ''                                                                                        ' + #13#10 +
    '             ELSE                                                                                           ' + #13#10 +
    '               NVL(SUBSTR(DET_A.CONTACORRENTE, INSTR(DET_A.CONTACORRENTE, ''-'')+1, 1), '' '')              ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '         WHEN INSTR(DET_A.MASCARACC, ''-'') = 0 THEN                                                        ' + #13#10 +
    '           '' ''                                                                                            ' + #13#10 +
    '         ELSE                                                                                               ' + #13#10 +
    '           CASE                                                                                             ' + #13#10 +
    '             WHEN LPAD(DET_A.NUMBANCO, 3, ''0'') = ''399'' THEN                                             ' + #13#10 +
    '               NVL(SUBSTR(DET_A.CONTACORRENTE, INSTR(TRIM(DET_A.MASCARACC), ''-'')+1, 1), '' '')            ' + #13#10 +
    '             ELSE                                                                                           ' + #13#10 +
    '               NVL(SUBSTR(DET_A.CONTACORRENTE, INSTR(TRIM(DET_A.MASCARACC), ''-''), 1), '' '')              ' + #13#10 +
    '             END                                                                                            ' + #13#10 +
    '       END DV_CC,                                                                                           ' + #13#10;

    sSql := sSql + 
    '       RPAD(REGEXP_REPLACE(DET_A.RAZAOSOCIAL, ''( *[[:punct:]])'', '' ''), 30) NOME_TERC,                   ' + #13#10 +
    '       LPAD(DET_A.CODDOCARQ, 6, ''0'') NUM_DOC,                                                             ' + #13#10 ;

    if (Sistema.idmodulo <> 18) then
      //C·ssio Rovaroto - SIG n∫ 117759 - InÌcio
      //sSql := sSql + '       RPAD('' '', 13) FILLER,                                                             ' + #13#10
      sSql := sSql + '       '' '' || RPAD(' + QuotedStr(pIdArqPagto) + ', 12, '' '') FILLER,                             ' + #13#10
      //C·ssio Rovaroto - SIG n∫ 117759 - Fim
    else
      sSql := sSql + '       ''E'' || RPAD(' + QuotedStr(pIdArqPagto) + ', 12, '' '') FILLER,                    ' + #13#10 ;

    sSql := sSql +
    '       DECODE(DET_A.TIPOCONTA, 1, 1, 3, 2, 0) TIP_CC, /*NOTA 5*/                                            ' + #13#10 +
    '       TO_CHAR(DET_A.DATAPROGRAMADA, ''DDMMYYYY'') DT_VCTO,                                                 ' + #13#10 +
    '       ''BRL'' TIP_MOEDA, /*NOTA 6*/                                                                        ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') QTD_MOEDA,                                                                    ' + #13#10 +
    '       LPAD(LTRIM(REPLACE(TO_CHAR(DET_A.VALOR, ''999999999999D99''), '','', '''')), 15, ''0'') VALOR,       ' + #13#10 +
    '       LPAD(''0'', 9, ''0'') NUM_DOC_BANCO,                                                                 ' + #13#10 +
    '       RPAD('' '', 3) FILLER2,                                                                              ' + #13#10 +
    '       ''01'' QTD_PARC,                                                                                     ' + #13#10 +
    '       ''N'' BLOQ_DMAISPARC,                                                                                ' + #13#10 +
    '       ''1'' FORMA_PARC, /*NOTA 7*/   /*Conforme Nexxera*/                                                  ' + #13#10 +
    '       TO_CHAR(DET_A.DATAPROGRAMADA, ''DD'') PERIODO_DIA_VCTO, /*NOTA 8*/ /*Conforme Nexxera*/              ' + #13#10 +
    '       LPAD(''0'', 2, ''0'') NUM_PARC,                                                                      ' + #13#10 +
    '       LPAD(''0'', 8, ''0'') DT_EFET,                                                                       ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') VLR_EFET,                                                                     ' + #13#10 +
    '       RPAD('' '', 40) INFO2,                                                                               ' + #13#10 +
    '       DECODE(' + quotedstr(pFormaLanc) + ', ''03'', ' + quotedstr(rDadosParamConv.sFinalidadeDOC) + ', ''00'') FINALIDADE_DOC, /*NOTA 9*/    ' + #13#10 +
    '       RPAD('' '', 10) USO_FEBRA,                                                                           ' + #13#10 +
    '       ''0'' EMITE_AVISO,                                                                                   ' + #13#10 +
    '       RPAD('' '', 10) OCORRENCIAS,                                                                         ' + #13#10 +
    '       DET_A.VALOR AS VALOR_LANC                                                                            ' + #13#10 +
    '  FROM (                                                                                                    ' + #13#10 +
    'SELECT AX.CODDOCARQ,                                                                                        ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 2, D2.DATAPROGRAMADA, 4, D4.DATAPROGRAMADA) DATAPROGRAMADA,    ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.MASCARACC, 2, D2.MASCARACC, 4, D4.MASCARACC) MASCARACC,                        ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.MASCARAAGENCIA, 2, D2.MASCARAAGENCIA, 4, D4.MASCARAAGENCIA) MASCARAAGENCIA,    ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.TIPOCONTA, 2, D2.TIPOCONTA, 4, D4.TIPOCONTA) TIPOCONTA,                        ' + #13#10 +
    '       UPPER(TRANSLATE(TRIM(DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 2, D2.RAZAOSOCIAL, 4, D4.RAZAOSOCIAL)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL,   ' + #13#10 +
    '       AX.VALOR,                                                                                            ' + #13#10 +
    '       REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO, 4, D4.NUMBANCO), ''\D'') NUMBANCO,    ' + #13#10 +
    '       CASE AX.TIPO                                                                                         ' + #13#10 +
    '         WHEN ''1'' THEN                                                                                    ' + #13#10 +
    '           REGEXP_REPLACE(D1.NUMAGENCIA, ''\W'')                                                            ' + #13#10 +
    '         WHEN ''2'' THEN                                                                                    ' + #13#10 +
    '           DECODE(D2.FLGIMPORTADO, ''N'', REGEXP_REPLACE(D2.NUMAGENCIA, ''\W''), REGEXP_REPLACE(D2.NUMAGENCIA, ''\s''))  ' + #13#10 +
    '         WHEN ''4'' THEN                                                                                    ' + #13#10 +
    '           REGEXP_REPLACE(D4.NUMAGENCIA, ''\W'')                                                            ' + #13#10 +
    '       END NUMAGENCIA,                                                                                      ' + #13#10 +
    '       CASE AX.TIPO                                                                                         ' + #13#10 +
    '         WHEN ''1'' THEN                                                                                    ' + #13#10 +
    '           REGEXP_REPLACE(D1.CONTACORRENTE, ''\D'')                                                         ' + #13#10 +
    '         WHEN ''2'' THEN                                                                                    ' + #13#10 +
    '           DECODE(D2.FLGIMPORTADO, ''N'', REGEXP_REPLACE(D2.CONTACORRENTE, ''\D''), REGEXP_REPLACE(D2.CONTACORRENTE, ''\s''))  ' + #13#10 +
    '         WHEN ''4'' THEN                                                                                    ' + #13#10 +
    '            REGEXP_REPLACE(D4.CONTACORRENTE, ''\D'')                                                        ' + #13#10 +
    '       END CONTACORRENTE                                                                                    ' + #13#10 +
    '  FROM ARQUIVOXDOCUM AX                                                                                     ' + #13#10 +
    '  LEFT JOIN (                                                                                               ' + #13#10 +
    'SELECT DI1.CODDOCUMENTO, DI1.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL,                        ' + #13#10 +
    '       B.MASCARAAGENCIA, B.MASCARACC, C.TIPOCONTA, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE --, FO.DESCRICAO FORMA_PAGTO  ' + #13#10 +
    '  FROM DOCUMENTO DI1                                                                                        ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI                                                                ' + #13#10 +
    '  JOIN CONTABANCARIA C ON C.IDCBANCARIA = DI1.IDCBANCARIA                                                   ' + #13#10 +
    '  JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA                                                        ' + #13#10 +
    '  JOIN BANCO B ON B.IDPESSOA = A.IDBANCO                                                                    ' + #13#10 ;
    if (Sistema.idmodulo = 18) then
      sSql := sSql + ' WHERE DI1.IDMODULO = ' + inttostr(Sistema.idmodulo)  + #13#10 ;

    sSql := sSql +
    ' ) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1 ' + #13#10 +


    '  LEFT JOIN (                                                                                               ' + #13#10 +
    'SELECT DP.IDDOCUMENTOXPESSOAS, DI2.DATAPROGRAMADA, DP.RAZAOSOCIAL,                                          ' + #13#10 +
    '       MANUAL.MASCARAAGENCIA, MANUAL.MASCARACC, DP.TIPOCONTA, DP.NUMBANCO, DP.NUMAGENCIA,                   ' + #13#10;

    // Andre Imakawa - SIG 101541 - Inicio
    if (Sistema.idmodulo = 18) then
      sSql := sSql + '       DP.NUMCONTA CONTACORRENTE,                                                         ' + #13#10
    else
    begin
      // Paulo Nobre - WO24848 - Inicio
//      sSql := sSql + '       DP.NUMOPERACAO || DP.NUMCONTA CONTACORRENTE,                                                         ' + #13#10;
      sSql := sSql + '     CASE                                                                      ' + #13#10 +
                     '       WHEN LENGTH(DP.NUMOPERACAO) >= 3 THEN (DP.NUMOPERACAO || DP.NUMCONTA)   ' + #13#10 +
                     '       ELSE DP.NUMCONTA                                                        ' + #13#10 +
                     '     END CONTACORRENTE,                                                        ' + #13#10;
      // Paulo Nobre - WO24848 - Fim
    end;
    // Andre Imakawa - SIG 101541 - Fim

    sSql := sSql +
    '       DP.FLGIMPORTADO, DP.IDFORCLI                                                                         ' + #13#10 +
    '  FROM DOCUMENTO DI2                                                                                        ' + #13#10 +
    '  JOIN DOCUMENTOXPESSOAS DP ON DI2.CODDOCUMENTO = DP.CODDOCUMENTO                                           ' + #13#10 ;

    // Andre Imakawa - SIG 101541 - Inicio
    if (Sistema.idmodulo = 18) then
    begin
      sSql := sSql +
      '  LEFT JOIN (SELECT B.MASCARACC,                                                                            ' + #13#10 +
      '                    B.MASCARAAGENCIA,                                                                       ' + #13#10 +
      '                    TRIM(B.NUMBANCO) AS NUMBANCO                                                             ' + #13#10 +
      '             FROM BANCO B) MANUAL ON MANUAL.NUMBANCO = DP.NUMBANCO                                          ' + #13#10 ;
    end
    else
    begin
      sSql := sSql +
      '  LEFT JOIN (SELECT B.MASCARACC,                                                                            ' + #13#10 +
      '                    B.MASCARAAGENCIA,                                                                       ' + #13#10 +
      '                    C.IDCBANCARIA                                                                           ' + #13#10 +
      '             FROM CONTABANCARIA C                                                                           ' + #13#10 +
      '             JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA                                             ' + #13#10 +
      '             JOIN BANCO B ON B.IDPESSOA = A.IDBANCO) MANUAL ON MANUAL.IDCBANCARIA = DP.IDCBANCARIA          ' + #13#10 ;
    end;
    // Andre Imakawa - SIG 101541 - Fim

    if (Sistema.idmodulo = 18) then
      sSql := sSql + ' WHERE DI2.IDMODULO = ' + inttostr(Sistema.idmodulo)  + #13#10 ;

    sSql := sSql + '            ) D2 ON D2.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2       ' + #13#10 +

    //Everson Cunha - SIG117206 - Ini
    '  LEFT JOIN ( ' + #13#10 +
    'SELECT DI4.CODGRUPOCNAB, DI4.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL, ' + #13#10 +
    '       B.MASCARAAGENCIA, B.MASCARACC, C.TIPOCONTA, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE ' + #13#10 +
    '  FROM DOCUMENTO DI4 ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI4.IDFORCLI ' + #13#10 +
    '  JOIN CONTABANCARIA C ON C.IDCBANCARIA = DI4.IDCBANCARIA ' + #13#10 +
    '  JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA ' + #13#10 +
    '  JOIN BANCO B ON B.IDPESSOA = A.IDBANCO ' + #13#10;

    if (Sistema.idmodulo = 18) then
      sSql := sSql + ' WHERE DI4.IDMODULO = ' + inttostr(Sistema.idmodulo)  + #13#10 ;

    sSql := sSql + ' GROUP BY DI4.CODGRUPOCNAB, DI4.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME), ' + #13#10 +
    '       B.MASCARAAGENCIA, B.MASCARACC, C.TIPOCONTA, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE) D4 ON D4.CODGRUPOCNAB = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 4 ' + #13#10 +
    //Everson Cunha - SIG117206 - Fim

    ' WHERE AX.TIPO IN (1, 2, 4) /*1=DOCUMENTO, 2=LISTA DE PESSOAS, 4=AP AGRUPADA*/             ' + #13#10;

  If (pFormaLanc = '03') Or (pFormaLanc = '41') Then // '03' - DOC, '41' - TED
    sSql := sSql + '  AND REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO, 4, D4.NUMBANCO), ''\D'') <> ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10
  Else
    Begin
      sSql := sSql + '  AND REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO, 4, D4.NUMBANCO), ''\D'') = ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10;
      If (pFormaLanc = '01') Then // Conta Corrente
        sSql := sSql + '  AND DECODE(AX.TIPO, 1, D1.TIPOCONTA, 2, D2.TIPOCONTA, 4, D4.TIPOCONTA) = ''1'' ' + #13#10
      Else If (pFormaLanc = '05') Then // PoupanÁa
        sSql := sSql + '  AND DECODE(AX.TIPO, 1, D1.TIPOCONTA, 2, D2.TIPOCONTA, 4, D4.TIPOCONTA) = ''3'' ' + #13#10;
    End;
  sSql := sSql + ' AND EXISTS (SELECT 1                                                                          ' + #13#10 +
    '                          FROM FORMARECPAGXTIPOFORMARECPAG FXF                                              ' + #13#10 +
    '                          WHERE FXF.CODFORMA = AX.CODFORMA                                                  ' + #13#10 +
    '                                AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')                        ' + #13#10 +
    '   AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') DET_A                                                       ' + #13#10 +
    ' ORDER BY ORDEM, "ORDEM1")                                                                                  ' ;


  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LA_A.txt');
end;

function TCtrlRemessaEletronica._SelMovPeloTipoDaFormaPagamento_LA_Linha_B(
  pIdArqPagto, pTipFormaRecPag, pFormaLanc: String): OleVariant;
var
  sSql: string;
begin
  sSql := 'SELECT ''3'' ORDEM,                                                                                   ' + #13#10 +
    '       MESMAQRY_A.CODDOCARQ "ORDEM1",                                                                       ' + #13#10 +
            Quotedstr(rDadosParamConv.sNumBanco) + 'NUM_BANCO,                                                   ' + #13#10 +
    '       ''3'' REG,                                                                                           ' + #13#10 +
    '       NULL NSR, -- DEVER¡ SER GERAL DO LOTE                                                                ' + #13#10 +
    '       ''B'' SEG,                                                                                           ' + #13#10 +
    '       RPAD('' '', 3) USO_FEBRA,                                                                            ' + #13#10 +
    '       MESMAQRY_A.TIPO TIP_INSC,                                                                            ' + #13#10 +
    '       LPAD(MESMAQRY_A.NUMDOCUMENTO, 14, ''0'') NUM_INSC,                                                   ' + #13#10 +
    '       RPAD(NVL(UPPER(TRIM(REGEXP_REPLACE(ED.LOGRADOURO, ''( *[[:punct:]])'', '' ''))), '' ''), 30) LOGRADOURO,    ' + #13#10 +
    '       LPAD(NVL(TRIM(REGEXP_REPLACE(ED.NUMERO, ''( *[[:punct:] [:alpha:] [:space:]])'', '' '')     ), 0), 5, ''0'') NUM_LOCAL,    ' + #13#10 +
    '       RPAD(NVL(UPPER(TRIM(REGEXP_REPLACE(ED.COMPLEMENTO, ''( *[[:punct:]])'', '' ''))), '' ''), 15) COMPL,        ' + #13#10 +
    '       RPAD(NVL(UPPER(TRIM(REGEXP_REPLACE(ED.BAIRRO, ''( *[[:punct:]])'', '' ''))), '' ''), 15) BAIRRO,            ' + #13#10 +
    '       RPAD(NVL(UPPER(TRIM(REGEXP_REPLACE(C.NOME, ''( *[[:punct:]])'', '' ''))), '' ''), 20) CIDADE,               ' + #13#10 +
    '       LPAD(NVL(TRIM(ED.CEP), 0), 5, ''0'') CEP,                                                            ' + #13#10 +
    '       RPAD(NVL(SUBSTR(TRIM(ED.CEP), 6, 3), '' ''), 3) COMPL_CEP,                                           ' + #13#10 +
    '       RPAD(NVL(TRIM(C.UF), '' ''), 2) UF,                                                                  ' + #13#10 +
    '       TO_CHAR(MESMAQRY_A.DATAPROGRAMADA, ''DDMMYYYY'') DT_VCTO,                                            ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') VLR_DOC,                                                                      ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') VLR_ABAT,                                                                     ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') VLR_DESC,                                                                     ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') VLR_MORA,                                                                     ' + #13#10 +
    '       LPAD(''0'', 15, ''0'') VLR_MULTA,                                                                    ' + #13#10 +
    '       RPAD('' '', 15) COD_DOC,                                                                             ' + #13#10 +
    '       RPAD('' '', 15) USO_FEBRA2,                                                                          ' + #13#10 +
    '       0.00 VALOR                                                                                           ' + #13#10 +
    '  FROM (                                                                                                    ' + #13#10 +
    'SELECT AX.CODDOCARQ,                                                                                        ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.IDFORCLI, 2, D2.IDFORCLI, 4, D4.IDFORCLI) IDFORCLI,                            ' + #13#10 +
    '       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 2, D2.DATAPROGRAMADA, 4, D4.DATAPROGRAMADA) DATAPROGRAMADA,    ' + #13#10 +
    '       REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 4, D4.NUMDOCUMENTO), ''[^A-Za-z0-9]'') NUMDOCUMENTO, ' + #13#10 +  // Paulo Nobre - WO33342
    '       DECODE(LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 2, D2.NUMDOCUMENTO, 4, D4.NUMDOCUMENTO), ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') TIPO ' + #13#10 + // Paulo Nobre - WO33342
    '  FROM ARQUIVOXDOCUM AX                                                                                     ' + #13#10 +
    '  LEFT JOIN (                                                                                               ' + #13#10 +
    'SELECT DI1.CODDOCUMENTO, DI1.IDFORCLI, DI1.DATAPROGRAMADA,                                                  ' + #13#10 +
    '       CASE WHEN P.NUMDOCUMENTO IS NOT NULL THEN TRIM(P.NUMDOCUMENTO)                                       ' + #13#10 +
    '        ELSE CASE WHEN P.TIPO = ''F'' THEN ''00000000000''                                                  ' + #13#10 +
    '                  WHEN P.TIPO = ''J'' THEN ''00000000000000''                                               ' + #13#10 +
    '                  ELSE ''00000000000''                                                                      ' + #13#10 +
    '              END                                                                                           ' + #13#10 +
    '    END NUMDOCUMENTO,                                                                                       ' + #13#10 +
    '       B.NUMBANCO, C.TIPOCONTA                                                                              ' + #13#10 +
    '  FROM DOCUMENTO DI1                                                                                        ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI                                                                ' + #13#10 +
    '  JOIN CONTABANCARIA C ON C.IDCBANCARIA = DI1.IDCBANCARIA                                                   ' + #13#10 +
    '  JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA                                                        ' + #13#10 +
    '  JOIN BANCO B ON B.IDPESSOA = A.IDBANCO                                                                    ' + #13#10 ;

    if (Sistema.idmodulo = 18) then
      sSql := sSql + ' WHERE DI1.IDMODULO = ' + inttostr(Sistema.idmodulo)  + #13#10 ;

    sSql := sSql +
    '        ) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1                               ' + #13#10 +
    '  LEFT JOIN (                                                                                               ' + #13#10 +
    'SELECT DP.IDDOCUMENTOXPESSOAS, DP.IDFORCLI, DI2.DATAPROGRAMADA,                                             ' + #13#10 +
    '       CASE WHEN DP.NUMDOCUMENTO IS NOT NULL THEN DP.NUMDOCUMENTO                                           ' + #13#10 +
	  '            ELSE CASE WHEN PE2.NUMDOCUMENTO IS NOT NULL THEN TRIM(PE2.NUMDOCUMENTO)                         ' + #13#10 +
	  '                       ELSE CASE WHEN PE2.TIPO = ''F'' THEN ''00000000000''                                 ' + #13#10 +
    '                  			      WHEN PE2.TIPO = ''J'' THEN ''00000000000000''                                  ' + #13#10 +
    '                  		          ELSE ''00000000000''                                                         ' + #13#10 +
    '                  		      END                                                                              ' + #13#10 +
    '                  END                                                                                       ' + #13#10 +
	  '        END NUMDOCUMENTO,                                                                                   ' + #13#10 +
    '       DP.NUMBANCO, DP.TIPOCONTA                                                                            ' + #13#10 +
    '  FROM DOCUMENTO DI2                                                                                        ' + #13#10 +
    '  JOIN DOCUMENTOXPESSOAS DP ON DI2.CODDOCUMENTO = DP.CODDOCUMENTO                                           ' + #13#10 +
    //C·ssio Rovaroto - SIG n∫ 101677 - InÌcio
    //'  JOIN PESSOA PE2 ON PE2.IDPESSOA = DP.IDFORCLI                                                             ' + #13#10 ;
    '  LEFT JOIN PESSOA PE2 ON PE2.IDPESSOA = DP.IDFORCLI                                                             ' + #13#10 ;
    //C·ssio Rovaroto - SIG n∫ 101677 - Fim
    if (Sistema.idmodulo = 18) then
      sSql := sSql + ' WHERE DI2.IDMODULO = ' + inttostr(Sistema.idmodulo)  + #13#10 ;

    sSql := sSql + '            ) D2 ON D2.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2       ' + #13#10 +

    //Everson Cunha - SIG117206 - Ini
    '  LEFT JOIN ( ' + #13#10 +
    'SELECT DI4.CODGRUPOCNAB, DI4.IDFORCLI, DI4.DATAPROGRAMADA, ' + #13#10 +
    '       CASE WHEN P.NUMDOCUMENTO IS NOT NULL THEN TRIM(P.NUMDOCUMENTO) ' + #13#10 +
    '         ELSE CASE WHEN P.TIPO = ''F'' THEN ''00000000000'' ' + #13#10 +
    '                 WHEN P.TIPO = ''J'' THEN ''00000000000000'' ' + #13#10 +
    '                  ELSE ''00000000000'' ' + #13#10 +
    '              END ' + #13#10 +
    '       END NUMDOCUMENTO, B.NUMBANCO, C.TIPOCONTA ' + #13#10 +
    '  FROM DOCUMENTO DI4 ' + #13#10 +
    '  JOIN PESSOA P ON P.IDPESSOA = DI4.IDFORCLI ' + #13#10 +
    '  JOIN CONTABANCARIA C ON C.IDCBANCARIA = DI4.IDCBANCARIA ' + #13#10 +
    '  JOIN AGENCIABANCARIA A ON C.IDAGENCIA = A.IDPESSOA ' + #13#10 +
    '  JOIN BANCO B ON B.IDPESSOA = A.IDBANCO ' + #13#10;

    if (Sistema.idmodulo = 18) then
      sSql := sSql + ' WHERE DI4.IDMODULO = ' + inttostr(Sistema.idmodulo)  + #13#10 ;

    sSql := sSql + ' GROUP BY DI4.CODGRUPOCNAB, DI4.IDFORCLI, DI4.DATAPROGRAMADA, ' + #13#10 +
    '       CASE WHEN P.NUMDOCUMENTO IS NOT NULL THEN TRIM(P.NUMDOCUMENTO) ' + #13#10 +
    '        ELSE CASE WHEN P.TIPO = ''F'' THEN ''00000000000'' ' + #13#10 +
    '                  WHEN P.TIPO = ''J'' THEN ''00000000000000'' ' + #13#10 +
    '                  ELSE ''00000000000'' ' + #13#10 +
    '              END ' + #13#10 +
    '    END, B.NUMBANCO, C.TIPOCONTA ' + #13#10 +
    '        ) D4 ON D4.CODGRUPOCNAB = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 4 ' + #13#10 +
    //Everson Cunha - SIG117206 - Fim

    ' WHERE AX.TIPO IN (1, 2, 4) /*1=DOCUMENTO, 2=LISTA DE PESSOAS, 4=AP AGRUPADA*/                                           ' + #13#10;

  If (pFormaLanc = '03') Or (pFormaLanc = '41') Then // '03' - DOC, '41' - TED
    sSql := sSql + '  AND REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO, 4, D4.NUMBANCO), ''\D'') <> ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10
  Else
    Begin
      sSql := sSql + '  AND REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMBANCO, 2, D2.NUMBANCO, 4, D4.NUMBANCO), ''\D'') = ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10;
      If (pFormaLanc = '01') Then // Conta Corrente
        sSql := sSql + '  AND DECODE(AX.TIPO, 1, D1.TIPOCONTA, 2, D2.TIPOCONTA, 4, D4.TIPOCONTA) = ''1'' ' + #13#10
      Else If (pFormaLanc = '05') Then // PoupanÁa
        sSql := sSql + '  AND DECODE(AX.TIPO, 1, D1.TIPOCONTA, 2, D2.TIPOCONTA, 4, D4.TIPOCONTA) = ''3'' ' + #13#10;
    End;

  sSql := sSql +
    '   AND EXISTS (SELECT 1                                                                                     ' + #13#10 +
    '                 FROM FORMARECPAGXTIPOFORMARECPAG FXF                                                       ' + #13#10 +
    '                WHERE FXF.CODFORMA = AX.CODFORMA                                                            ' + #13#10 +
    '                  AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')                                      ' + #13#10 +
    '   AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') MESMAQRY_A                                                  ' + #13#10 +
    '  LEFT JOIN (SELECT MAX(E.IDENDERECO) MAX_ID,                                                               ' + #13#10 +
    '                    E.IDPESSOA                                                                              ' + #13#10 +
    '               FROM ENDPESS E                                                                               ' + #13#10 +
    '              GROUP BY E.IDPESSOA) MAX_END ON MAX_END.IDPESSOA = MESMAQRY_A.IDFORCLI                        ' + #13#10 +
    '  LEFT JOIN ENDPESS ED ON ED.IDENDERECO = MAX_END.MAX_ID                                                    ' + #13#10 +
    '  LEFT JOIN CIDADES C ON C.IDCIDADES = ED.IDCIDADES                                                         ' + #13#10 +
    ' ORDER BY ORDEM, "ORDEM1"                                                                                   ' ;

  Result := GetDataPacket(sSql);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LA_B.txt');
end;

function TCtrlRemessaEletronica.MontaLinhaA(pSeqLote, pSeqNSR: string): string;
begin
  Result := cdsGeraMovLote.FieldByName('NUM_BANCO').AsString +
            _CompletaZeroEsq(pSeqLote, 4) +
            cdsGeraMovLote.FieldByName('REG').AsString +
            _CompletaZeroEsq(pSeqNSR, 5) +
            cdsGeraMovLote.FieldByName('SEG').AsString +
            cdsGeraMovLote.FieldByName('TIPO_MOV').AsString +
            cdsGeraMovLote.FieldByName('COD_INST').AsString +
            cdsGeraMovLote.FieldByName('CAMARA_COMP').AsString +
            cdsGeraMovLote.FieldByName('BANCO_CLI').AsString +
            cdsGeraMovLote.FieldByName('AGENCIA_CLI').AsString +
            cdsGeraMovLote.FieldByName('DV_AG').AsString +
            cdsGeraMovLote.FieldByName('CONTA_CLI').AsString +
            cdsGeraMovLote.FieldByName('DV_CC').AsString +
            ' ' +
            RemoveCaracterEspecial(cdsGeraMovLote.FieldByName('NOME_TERC').AsString, True) +
            cdsGeraMovLote.FieldByName('NUM_DOC').AsString +
            cdsGeraMovLote.FieldByName('FILLER').AsString +
            cdsGeraMovLote.FieldByName('TIP_CC').AsString +
            cdsGeraMovLote.FieldByName('DT_VCTO').AsString +
            cdsGeraMovLote.FieldByName('TIP_MOEDA').AsString +
            cdsGeraMovLote.FieldByName('QTD_MOEDA').AsString +
            cdsGeraMovLote.FieldByName('VALOR').AsString +
            cdsGeraMovLote.FieldByName('NUM_DOC_BANCO').AsString +
            '   ' +
            cdsGeraMovLote.FieldByName('QTD_PARC').AsString +
            cdsGeraMovLote.FieldByName('BLOQ_DMAISPARC').AsString +
            cdsGeraMovLote.FieldByName('FORMA_PARC').AsString +
            cdsGeraMovLote.FieldByName('PERIODO_DIA_VCTO').AsString +
            cdsGeraMovLote.FieldByName('NUM_PARC').AsString +
            cdsGeraMovLote.FieldByName('DT_EFET').AsString +
            cdsGeraMovLote.FieldByName('VLR_EFET').AsString +
            cdsGeraMovLote.FieldByName('INFO2').AsString +
            cdsGeraMovLote.FieldByName('FINALIDADE_DOC').AsString +
            cdsGeraMovLote.FieldByName('USO_FEBRA').AsString +
            cdsGeraMovLote.FieldByName('EMITE_AVISO').AsString +
            cdsGeraMovLote.FieldByName('OCORRENCIAS').AsString;
end;

function TCtrlRemessaEletronica.MontaLinhaB(pSeqLote, pSeqNSR: String): string;
begin
  Result:=  cdsGeraMovLoteDet.FieldByName('NUM_BANCO').AsString +
            _CompletaZeroEsq(pSeqLote, 4) +
            cdsGeraMovLoteDet.FieldByName('REG').AsString +
            _CompletaZeroEsq(pSeqNSR, 5) +
            cdsGeraMovLoteDet.FieldByName('SEG').AsString +
            cdsGeraMovLoteDet.FieldByName('USO_FEBRA').AsString +
            cdsGeraMovLoteDet.FieldByName('TIP_INSC').AsString +
            cdsGeraMovLoteDet.FieldByName('NUM_INSC').AsString +
            RemoveCaracterEspecial(cdsGeraMovLoteDet.FieldByName('LOGRADOURO').AsString, True) +
            RemoveCaracterEspecial(cdsGeraMovLoteDet.FieldByName('NUM_LOCAL').AsString, True) +
            RemoveCaracterEspecial(cdsGeraMovLoteDet.FieldByName('COMPL').AsString, True) +
            RemoveCaracterEspecial(cdsGeraMovLoteDet.FieldByName('BAIRRO').AsString, True) +
            RemoveCaracterEspecial(cdsGeraMovLoteDet.FieldByName('CIDADE').AsString, True) +
            cdsGeraMovLoteDet.FieldByName('CEP').AsString +
            cdsGeraMovLoteDet.FieldByName('COMPL_CEP').AsString +
            cdsGeraMovLoteDet.FieldByName('UF').AsString +
            cdsGeraMovLoteDet.FieldByName('DT_VCTO').AsString +
            cdsGeraMovLoteDet.FieldByName('VLR_DOC').AsString +
            cdsGeraMovLoteDet.FieldByName('VLR_ABAT').AsString +
            cdsGeraMovLoteDet.FieldByName('VLR_DESC').AsString +
            cdsGeraMovLoteDet.FieldByName('VLR_MORA').AsString +
            cdsGeraMovLoteDet.FieldByName('VLR_MULTA').AsString +
            cdsGeraMovLoteDet.FieldByName('COD_DOC').AsString +
            cdsGeraMovLoteDet.FieldByName('USO_FEBRA2').AsString;
end;

function TCtrlRemessaEletronica.RemoveCaracterEspecial(pTexto: String;
  pRemoveExtra: boolean): String;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('·', '‡', '„', '‚', '‰','¡', '¿', '√', '¬', 'ƒ',
                                     'È', 'Ë','…', '»','Ì', 'Ï','Õ', 'Ã',
                                     'Û', 'Ú', 'ˆ','ı', 'Ù','”', '“', '÷', '’', '‘',
                                     '˙', '˘', '¸','⁄','Ÿ', '‹','Á','«','Ò','—');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','®','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','¥','`',
                                     '®','Ê','∆','¯','£','ÿ','É','™','∫','ø',
                                     'Æ','Ω','º','ﬂ','µ','˛','˝','›');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := pTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o par‚metro aLimExt, elimina caracteres extras.  
   if (pRemoveExtra) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], ' ', [rfreplaceall]);   
   Result := xTexto;
end;

function TCtrlRemessaEletronica._SelMovPeloTipoDaFormaPagamento_LJ_Linha_J(
  pIdArqPagto, pTipFormaRecPag, pFormaLanc,
  pFinalidadeDOC: String): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT ROWNUM AS LINHA, ORDEM, ORDEM1, ORDEM2, NUM_BANCO, REG, SEG,                                            ' + #13#10 + //C·ssio Rovaroto - SIG n∫ 101422
          '       TIPO_MOV, COD_INST, BANCO, COD_MOEDA1, DV, FATOR_VENCTO,                                                 ' + #13#10 +
          '       VALOR1, CAMPO_LIVRE, CEDENTE, DT_VENCTO, VALOR2, VLR_DESCS,                                             ' + #13#10 +
          '       VLR_MULTA, DT_PAGTO, VLR_PAGTO, QTD_MOEDAS, NUM_DOC, FILLER,                                            ' + #13#10 +
          '       NUM_ATR_BANCO, FILLER2, COD_MOEDA2, USO_FEBRA, OCORRENCIAS, VALOR_LANC                                   ' + #13#10 +
          'FROM (                                                                                                         ' + #13#10 +
          'SELECT ''3'' ORDEM,                                                                                            ' + #13#10 +
          '       DET_J.CODDOCARQ "ORDEM1",                                                                               ' + #13#10 +
          '       ''J'' "ORDEM2",                                                                                         ' + #13#10 +
          Quotedstr(rDadosParamConv.sNumBanco) + ' NUM_BANCO,                                                             ' + #13#10 +
          '       ''3'' REG,                                                                                              ' + #13#10 +
          '       ''J'' SEG,                                                                                              ' + #13#10 +
          '       ''0'' TIPO_MOV, -- 0 = Inclus„o, 9 = Exclus„o.                                                          ' + #13#10 +
          '       LPAD(''0'', 2, ''0'') COD_INST, -- Nota 11                                                              ' + #13#10 +
          '       SUBSTR(DET_J.NUMLEITCODBARRAS, 0, 3) BANCO,                                                             ' + #13#10 +
          '       SUBSTR(DET_J.NUMLEITCODBARRAS, 4, 1) COD_MOEDA1,                                                         ' + #13#10 +
          '       SUBSTR(DET_J.NUMLEITCODBARRAS, 33, 1)DV,                                                                ' + #13#10 +
          '       SUBSTR(DET_J.NUMLEITCODBARRAS, 34, 4) FATOR_VENCTO,                                                     ' + #13#10 +
          '       SUBSTR(DET_J.NUMLEITCODBARRAS, 38, 10) VALOR1,                                                           ' + #13#10 +
          '       SUBSTR(DET_J.NUMLEITCODBARRAS, 5, 5) ||                                                                 ' + #13#10 +
          '       SUBSTR(DET_J.NUMLEITCODBARRAS, 11, 10) ||                                                               ' + #13#10 +
          '       SUBSTR(DET_J.NUMLEITCODBARRAS, 22, 10) CAMPO_LIVRE,                                                     ' + #13#10 +
          '       RPAD(DET_J.RAZAOSOCIAL, 30) CEDENTE,                                                                    ' + #13#10 +
          '       TO_CHAR(DET_J.DATAPROGRAMADA, ''DDMMYYYY'') DT_VENCTO,                                                  ' + #13#10 +
          '       LPAD(LTRIM(REPLACE(TO_CHAR((DET_J.VALOR), ''999999999999D99''), '','', '''')), 15, ''0'') VALOR2,        ' + #13#10 +
          '       LPAD(''0'', 15, ''0'') VLR_DESCS,                                                                       ' + #13#10 +
          '       LPAD(''0'', 15, ''0'') VLR_MULTA,                                                                       ' + #13#10 +
          '       TO_CHAR(DET_J.DATAPROGRAMADA, ''DDMMYYYY'') DT_PAGTO,                                                   ' + #13#10 +
          '       LPAD(LTRIM(REPLACE(TO_CHAR((DET_J.VALOR), ''999999999999D99''), '','', '''')), 15, ''0'') VLR_PAGTO,    ' + #13#10 +
          '       LPAD(''0'', 15, ''0'') QTD_MOEDAS,                                                                      ' + #13#10 +
          '       LPAD(DET_J.CODDOCARQ, 6, ''0'') NUM_DOC,                                                                ' + #13#10 +
          '       RPAD('' '', 14) FILLER,                                                                                 ' + #13#10 +
          '       LPAD(''0'', 9, ''0'') NUM_ATR_BANCO,                                                                    ' + #13#10 +
          '       RPAD('' '', 11) FILLER2,                                                                                ' + #13#10 +
          '       ''09'' COD_MOEDA2,                                                                                       ' + #13#10 +
          '       RPAD('' '', 6) USO_FEBRA,                                                                               ' + #13#10 +
          '       RPAD('' '', 10) OCORRENCIAS,                                                                            ' + #13#10 +
          '       DET_J.VALOR AS VALOR_LANC                                                                               ' + #13#10 +
          '  FROM (                                                                                                       ' + #13#10 +
          'SELECT AX.CODDOCARQ,                                                                                             ' + #13#10 +
          '       REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D'') NUMLEITCODBARRAS, ' + #13#10 +
          '       UPPER(TRANSLATE(TRIM(DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 3, D3.RAZAOSOCIAL)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL, ' + #13#10 +
          '       DECODE(AX.TIPO, 1, D1.DATAPROGRAMADA, 3, D3.DATAPROGRAMADA) DATAPROGRAMADA, AX.VALOR                    ' + #13#10 +
          '  FROM ARQUIVOXDOCUM AX                                                                                        ' + #13#10 +
          '  LEFT JOIN (                                                                                                  ' + #13#10 +
          'SELECT DI1.CODDOCUMENTO, DI1.NUMLEITCODBARRAS, DI1.DATAPROGRAMADA, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL,     ' + #13#10 +
          '       P.IDPESSOA                                                                                              ' + #13#10 +
          '  FROM DOCUMENTO DI1                                                                                           ' + #13#10 +
          '  JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1  ' + #13#10 +
          '  LEFT JOIN (                                                                                                  ' + #13#10 +
          //C·ssio Rovaroto - SIG n∫ 99579 - InÌcio
          //'SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS, DC.DTPAGTO DATAPROGRAMADA,                      ' + #13#10 +
          'SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS, DI3.DATAPROGRAMADA DATAPROGRAMADA,              ' + #13#10 +
          //C·ssio Rovaroto - SIG n∫ 99579 - Fim
          //'       NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL, P.IDPESSOA,                                                      ' + #13#10 +
          '       NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL                                                                  ' + #13#10 +
          '  FROM DOCUMENTO DI3                                                                                           ' + #13#10 +
          '  JOIN DOCUMENTOXCODBARRAS DC ON DI3.CODDOCUMENTO = DC.CODDOCUMENTO                                            ' + #13#10 +
          '  JOIN PESSOA P ON P.IDPESSOA = DI3.IDFORCLI                                                                   ' + #13#10 +
          '            ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3                     ' + #13#10 +
          ' WHERE AX.TIPO IN (1, 3) /*1=DOCUMENTO, 3=LISTA DE TITULOS*/                                                   ' + #13#10 +
          '   AND LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D'')) = 47 /*47 - Ficha de CompensaÁ„o - Detalhe "J", 48 - ArrecadaÁ„o - Detalhe "K"*/ ' + #13#10;

  if (pFormaLanc = '31') Then // 31 = Pagamento de TÌtulos de outros Bancos (numbanco <> 104)
    sSQL := sSQL + '   AND SUBSTR(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D''), 0, 3) <> ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10
  else
    if (pFormaLanc = '30') Then // 30 = LiquidaÁ„o prÛprio Banco (numbanco = 104)
      sSQL := sSQL + '   AND SUBSTR(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D''), 0, 3) = ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10;

  sSQL := sSQL + '   AND EXISTS (SELECT 1                                                                                 ' + #13#10 +
          '                 FROM FORMARECPAGXTIPOFORMARECPAG FXF                                                          ' + #13#10 +
          '                WHERE FXF.CODFORMA = AX.CODFORMA                                                               ' + #13#10 +
          '                  AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')                                         ' + #13#10 +
          '   AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') DET_J                                                          ' + #13#10 +
          ' ORDER BY ORDEM, "ORDEM1")                                                                                     ';

  Result := GetDataPacket(sSQL);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LJ_J.txt');
end;

function TCtrlRemessaEletronica._SelMovPeloTipoDaFormaPagamento_LJ_Linha_J52(
  pIdArqPagto, pTipFormaRecPag, pFormaLanc: String): OleVariant;
var
  sSQL: string;
begin
  sSQL := '-- DETALHE J52 - ObrigatÛrio para tÌtulos com valores acima do definido na estrutura CM.PORTFORMAXPARAMARQREM.VLR_OBRIGA_CPF_CNPJ    ' + #13#10 +
          'SELECT ''3'' ORDEM,                                                                                                ' + #13#10 +
          '       MESMAQRY_J.CODDOCARQ "ORDEM1",                                                                              ' + #13#10 +
          '       ''J52'' "ORDEM2",                                                                                           ' + #13#10 +
          Quotedstr(rDadosParamConv.sNumBanco) + ' NUM_BANCO,                                                                  ' + #13#10 +
          '       ''3'' REG,                                                                                                  ' + #13#10 +
          '       ''J'' SEG,                                                                                                  ' + #13#10 +
          '       '' '' USO_FEBRA,                                                                                            ' + #13#10 +
          '       RPAD('' '', 2) COD_MOV,                                                                                     ' + #13#10 +
          '       ''52'' ID_REG, -- No manual pede "J52". Foi informado pela Nexxera que deve inserir "52"                    ' + #13#10 +
          '       MESMAQRY_J.TIPO_PAG TIPO_INSC_PAG,                                                                          ' + #13#10 +
          '       LPAD(MESMAQRY_J.NUMDOCUMENTO_PAG, 15, ''0'') NUM_INSC_PAG, -- TAMANHO ERRADO NO MANUAL                      ' + #13#10 +
          '       RPAD(MESMAQRY_J.RAZAOSOCIAL_PAG, 40) RAZAOSOCIAL_PAG,                                                       ' + #13#10 +
          '       MESMAQRY_J.TIPO_BENEF TIPO_INSC_BENEF,                                                                      ' + #13#10 +
          '       LPAD(MESMAQRY_J.NUMDOCUMENTO_BENEF, 15, ''0'') NUM_INSC_BENEF, -- TAMANHO ERRADO NO MANUAL                  ' + #13#10 +
          '       RPAD(MESMAQRY_J.RAZAOSOCIAL_BENEF, 40) RAZAOSOCIAL_BENEF,                                                   ' + #13#10 +
          '       MESMAQRY_J.TIPO_BENEF TIPO_INSC_SACADOR,                                                                    ' + #13#10 +
          '       LPAD(MESMAQRY_J.NUMDOCUMENTO_BENEF, 15, ''0'') NUM_INSC_SACADOR, -- TAMANHO ERRADO NO MANUAL                ' + #13#10 +
          '       RPAD(MESMAQRY_J.RAZAOSOCIAL_BENEF, 40) RAZAOSOCIAL_SACADOR,                                                 ' + #13#10 +
          '       RPAD('' '', 53) USO_FEBRA,                                                                                  ' + #13#10 +
          '       0.00 VALOR                                                                                                  ' + #13#10 +
          '  FROM (                                                                                                           ' + #13#10 +
          'SELECT AX.CODDOCARQ,                                                                                               ' + #13#10 +
          '       DECODE(AX.TIPO, 1, D1.TIPO, 3, D3.TIPO) TIPO_BENEF,                                                         ' + #13#10 +
          '       DECODE(AX.TIPO, 1, D1.NUMDOCUMENTO, 3, D3.NUMDOCUMENTO) NUMDOCUMENTO_BENEF,                                 ' + #13#10 +
          '       UPPER(TRANSLATE(TRIM(DECODE(AX.TIPO, 1, D1.RAZAOSOCIAL, 3, D3.RAZAOSOCIAL)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL_BENEF,  ' + #13#10 +
          '       DECODE(LENGTH(REGEXP_REPLACE(PAGADOR.NUMDOCUMENTO, ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') TIPO_PAG,         ' + #13#10 + // Paulo Nobre - WO33342
          '       REGEXP_REPLACE(PAGADOR.NUMDOCUMENTO, ''[^A-Za-z0-9]'') NUMDOCUMENTO_PAG,                                              ' + #13#10 +  // Paulo Nobre - WO33342
          '       UPPER(TRANSLATE(TRIM(NVL(PAGADOR.RAZAOSOCIAL, PAGADOR.NOME)), ''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) RAZAOSOCIAL_PAG  ' + #13#10 +
          '  FROM ARQUIVOXDOCUM AX                                                                                            ' + #13#10 +
          '  JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AX.IDARQUIVOPAGTO                                                    ' + #13#10 +
          '  LEFT JOIN (                                                                                                      ' + #13#10 +
          'SELECT DI1.CODDOCUMENTO, DI1.NUMLEITCODBARRAS, NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL,                             ' + #13#10 +
          '       DECODE(LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') TIPO,                   ' + #13#10 + // Paulo Nobre - WO33342
          '       REGEXP_REPLACE(P.NUMDOCUMENTO, ''[^A-Za-z0-9]'') NUMDOCUMENTO                                                         ' + #13#10 + // Paulo Nobre - WO33342
          '       , P.IDPESSOA                                                                                                ' + #13#10 +
          '  FROM DOCUMENTO DI1                                                                                               ' + #13#10 +
          '  JOIN PESSOA P ON P.IDPESSOA = DI1.IDFORCLI) D1 ON D1.CODDOCUMENTO = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 1  ' + #13#10 +
          '  LEFT JOIN (                                                                                                      ' + #13#10 +
          'SELECT DC.IDDOCUMENTOXCODBARRAS, DC.NUMCODBARRAS NUMLEITCODBARRAS,                                                 ' + #13#10 +
          '       NVL(P.RAZAOSOCIAL, P.NOME) RAZAOSOCIAL, DECODE(LENGTH(REGEXP_REPLACE(NVL(DC.NUMDOCUMENTO, P.NUMDOCUMENTO), ''[^A-Za-z0-9]'')), 11, ''1'', 14, ''2'', ''0'') TIPO,   ' + #13#10 + // Paulo Nobre - WO33342
          '       REGEXP_REPLACE(NVL(DC.NUMDOCUMENTO, P.NUMDOCUMENTO), ''[^A-Za-z0-9]'') NUMDOCUMENTO                         ' + #13#10 + // Paulo Nobre - WO33342
          '  FROM DOCUMENTO DI3                                                                                               ' + #13#10 +
          '  JOIN DOCUMENTOXCODBARRAS DC ON DI3.CODDOCUMENTO = DC.CODDOCUMENTO                                                ' + #13#10 +
          '  JOIN PESSOA P ON P.IDPESSOA = DI3.IDFORCLI                                                                       ' + #13#10 +
          '            ) D3 ON D3.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3                         ' + #13#10 +
          ' CROSS JOIN PESSOA PAGADOR                                                                                         ' + #13#10 +
          ' WHERE AX.TIPO IN (1, 3) /*1=DOCUMENTO, 3=LISTA DE TITULOS*/                                                       ' + #13#10 +
          '   AND PAGADOR.IDPESSOA = 1 /*FUNCEF*/                                                                             ' + #13#10 +
          '   AND LENGTH(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D'')) = 47 /*47 - Ficha de CompensaÁ„o - Detalhe "J", 48 - ArrecadaÁ„o - Detalhe "K"*/ ' + #13#10 +
          '   AND AX.VALOR >= (SELECT PAR.VLR_OBRIGA_CPF_CNPJ FROM PORTFORMAXPARAMARQREM PAR WHERE PAR.CODPORTFORMA = AP.CODPORTFORMA)                                                             ' + #13#10;

  if (pFormaLanc = '31') then // 31 = Pagamento de TÌtulos de outros Bancos (numbanco <> 104)
    sSQL := sSQL + '   AND SUBSTR(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D''), 0, 3) <> ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10
  else
    if (pFormaLanc = '30') Then // 30 = LiquidaÁ„o prÛprio Banco (numbanco = 104)
      sSQL := sSQL + '   AND SUBSTR(REGEXP_REPLACE(DECODE(AX.TIPO, 1, D1.NUMLEITCODBARRAS, 3, D3.NUMLEITCODBARRAS), ''\D''), 0, 3) = ' + Quotedstr(rDadosParamConv.sNumBanco) + #13#10;

  sSQL := sSQL + '   AND EXISTS (SELECT 1                                                                                     ' + #13#10 +
          '                 FROM FORMARECPAGXTIPOFORMARECPAG FXF                                                              ' + #13#10 +
          '                WHERE FXF.CODFORMA = AX.CODFORMA                                                                   ' + #13#10 +
          '                  AND FXF.IDTIPOFORMARECPAG = ' + pTipFormaRecPag + ')                                             ' + #13#10 +
          '   AND AX.IDARQUIVOPAGTO = ' + pIdArqPagto + ') MESMAQRY_J                                                         ' + #13#10 +
          ' ORDER BY ORDEM, "ORDEM1"                                                                                      ';

  Result := GetDataPacket(sSQL);
  sqlText.Clear;
  sqlText.add(sSql);
  sqlText.SaveToFile(sPathArquivo + '\SQL_SelecionaDadosLancArq_LJ_J52.txt');
end;

function TCtrlRemessaEletronica.MontaLinhaJ(pSeqLote,
  pSeqNSR: String): string;
begin
  Result := cdsGeraMovLote.FieldByName('NUM_BANCO').AsString +
            _CompletaZeroEsq(pSeqLote, 4) +
            cdsGeraMovLote.FieldByName('REG').AsString +
            _CompletaZeroEsq(pSeqNSR, 5) +
            cdsGeraMovLote.FieldByName('SEG').AsString +
            cdsGeraMovLote.FieldByName('TIPO_MOV').AsString +
            cdsGeraMovLote.FieldByName('COD_INST').AsString +
            cdsGeraMovLote.FieldByName('BANCO').AsString +
            cdsGeraMovLote.FieldByName('COD_MOEDA1').AsString +
            cdsGeraMovLote.FieldByName('DV').AsString +
            cdsGeraMovLote.FieldByName('FATOR_VENCTO').AsString +
            cdsGeraMovLote.FieldByName('VALOR1').AsString +
            cdsGeraMovLote.FieldByName('CAMPO_LIVRE').AsString +
            cdsGeraMovLote.FieldByName('CEDENTE').AsString +
            cdsGeraMovLote.FieldByName('DT_VENCTO').AsString +
            cdsGeraMovLote.FieldByName('VALOR2').AsString +
            cdsGeraMovLote.FieldByName('VLR_DESCS').AsString +
            cdsGeraMovLote.FieldByName('VLR_MULTA').AsString +
            cdsGeraMovLote.FieldByName('DT_PAGTO').AsString +
            cdsGeraMovLote.FieldByName('VLR_PAGTO').AsString +
            cdsGeraMovLote.FieldByName('QTD_MOEDAS').AsString +
            cdsGeraMovLote.FieldByName('NUM_DOC').AsString +
            cdsGeraMovLote.FieldByName('FILLER').AsString +
            cdsGeraMovLote.FieldByName('NUM_ATR_BANCO').AsString +
            cdsGeraMovLote.FieldByName('FILLER2').AsString +
            cdsGeraMovLote.FieldByName('COD_MOEDA2').AsString +
            cdsGeraMovLote.FieldByName('USO_FEBRA').AsString +
            cdsGeraMovLote.FieldByName('OCORRENCIAS').AsString;
end;

function TCtrlRemessaEletronica.MontaLinhaJ52(pSeqLote,
  pSeqNSR: String): string;
begin
  Result := cdsGeraMovLoteDet.FieldByName('NUM_BANCO').AsString +
            _CompletaZeroEsq(pSeqLote, 4) +
            cdsGeraMovLoteDet.FieldByName('REG').AsString +
            _CompletaZeroEsq(pSeqNSR, 5) +
            cdsGeraMovLoteDet.FieldByName('SEG').AsString +
            cdsGeraMovLoteDet.FieldByName('USO_FEBRA').AsString +
            cdsGeraMovLoteDet.FieldByName('COD_MOV').AsString +
            cdsGeraMovLoteDet.FieldByName('ID_REG').AsString +
            cdsGeraMovLoteDet.FieldByName('TIPO_INSC_PAG').AsString +
            cdsGeraMovLoteDet.FieldByName('NUM_INSC_PAG').AsString +
            cdsGeraMovLoteDet.FieldByName('RAZAOSOCIAL_PAG').AsString +
            cdsGeraMovLoteDet.FieldByName('TIPO_INSC_BENEF').AsString +
            cdsGeraMovLoteDet.FieldByName('NUM_INSC_BENEF').AsString +
            cdsGeraMovLoteDet.FieldByName('RAZAOSOCIAL_BENEF').AsString +
            cdsGeraMovLoteDet.FieldByName('TIPO_INSC_SACADOR').AsString +
            cdsGeraMovLoteDet.FieldByName('NUM_INSC_SACADOR').AsString +
            cdsGeraMovLoteDet.FieldByName('RAZAOSOCIAL_SACADOR').AsString +
            cdsGeraMovLoteDet.FieldByName('USO_FEBRA').AsString;
end;

function TCtrlRemessaEletronica._GetArquivoRetorno(
  pCodPortForma: string; sNomeArquivo: string): OleVariant;
var
  sSQL: string;
begin
  sSQL :=  'SELECT A.IDARQUIVOPAGTO,  '+ #13#10 +
           '       P.PATHARQUIVORET AS CAMINHOARQ, ' +#13#10+
           '       SUBSTR(A.NOMEARQTXT, 1, LENGTH(A.NOMEARQTXT)-3) || ''ret'' AS ARQUIVO,' +#13#10+
           '       LPAD(A.NSA, 6, ''0'') AS NSA' +#13#10+
           '  FROM ARQUIVOPAGTO A' +#13#10+
           '  JOIN PORTADORFORMA P ON P.CODPORTFORMA = A.CODPORTFORMA' +#13#10+
           ' WHERE A.CODPORTFORMA = ' + pCodPortForma +#13#10;
  if sNomeArquivo = EmptyStr then
    sSQL := sSQL +  '   AND A.FLGENVIADO = ''S'' '
  else
    sSQL := sSQL + '   AND SUBSTR(A.NOMEARQTXT, 1, LENGTH(A.NOMEARQTXT)-4) = ' + QuotedStr(sNomeArquivo) +#13#10+
                   '   AND A.FLGENVIADO = ''S'' ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlRemessaEletronica.Impersonate: boolean;
var
  LogonType: Integer;
  LogonProvider: Integer;
  TokenHandle: THandle;
begin
  LogonType := LOGON32_LOGON_INTERACTIVE;
  LogonProvider := LOGON32_PROVIDER_DEFAULT;

  Result := LogonUser(PChar(_DecryptSTR(fUser, StKey, MtKey, AdKey)), nil, PChar(_DecryptSTR(fPw, StKey, MtKey, AdKey)),
                      LogonType, LogonProvider, TokenHandle);

  if Result then
    Result := ImpersonateLoggedOnUser(TokenHandle);
end;

function TCtrlRemessaEletronica._GetVersaoFolha(pAnoMes: string): OleVariant;
var
  sSQL: string;
begin
  // Paulo Nobre - WO6194 - Inicio
  // Trazer somente as Folhas que tenham convenio para gerar arquivo
 { sSQL := 'SELECT H.IDHSTFOLHABENEF, H.IDHSTFOLHABENEF || '' - '' || H.HISTORICO AS DESCRICAO ' + #13#10 +
          '  FROM HSTFOLHABENEF H                                                             ' + #13#10 +
          ' WHERE EXISTS (SELECT 1                                                            ' + #13#10 +
          '                FROM HSTFOLHABENEFCAP HBC                                          ' + #13#10 +
          '               WHERE (HBC.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF))                    ' + #13#10 +
          '  AND  TO_CHAR(H.DATAPREVPAGTO,''YYYY/MM'') = ' + QuotedStr(pAnoMes) +
          'ORDER BY H.IDHSTFOLHABENEF DESC'; }

  sSQL := 'SELECT H.IDHSTFOLHABENEF, H.IDHSTFOLHABENEF || '' - '' || H.HISTORICO AS DESCRICAO ' + #13#10 +
      'FROM HSTFOLHABENEF H                                                              ' + #13#10 +
      'WHERE EXISTS (SELECT 1                                                            ' + #13#10 +
      '              FROM HSTFOLHABENEFCAP HBC                                           ' + #13#10 +
      '              WHERE HBC.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF                       ' + #13#10 +
      '                    AND HBC.CODPORTFORMA IN (SELECT P.CODPORTFORMA                ' + #13#10 +
      '                                             FROM PORTADORFORMA P                 ' + #13#10 +
      '                                             WHERE P.RECPAG = ''P''               ' + #13#10 +
      '                                                   AND P.FLGARQUIVO = ''S''))     ' + #13#10 +
      '      AND  TO_CHAR(H.DATAPREVPAGTO,''YYYY/MM'') = ' + QuotedStr(pAnoMes) +
      'ORDER BY H.IDHSTFOLHABENEF DESC';
  Result := GetDataPacket(sSQL);
  // Paulo Nobre - WO6194 - Fim
end;

// Paulo Nobre - MIGRACAO-ORACLE-2025 (TAS000000007069) - Inicio
function TCtrlRemessaEletronica._GetConvenioFolha(pIdHstFolhaBenef: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT DISTINCT P.CODPORTFORMA, P.DESCRICAO AS DESCRICAO, P.PATHARQUIVOREM ' +#13#10+
          ' FROM PORTADORFORMA  P                                                     ' +#13#10+
          'INNER JOIN HSTFOLHABENEFCAP H ON (H.CODPORTFORMA = P.CODPORTFORMA)         ' +#13#10+
          'WHERE H.IDHSTFOLHABENEF = ' + IntToStr(pIdHstFolhaBenef) +
          '  AND P.RECPAG = ''P''                                                     ' +#13#10+
          '  AND P.FLGARQUIVO = ''S''                                                 ' +#13#10+
          'ORDER BY DESCRICAO                                                         ';

  Result := GetDataPacket(sSQL);
end;
// Paulo Nobre - MIGRACAO-ORACLE-2025 (TAS000000007069) - Fim

function TCtrlRemessaEletronica.RecuperaValorSIACC: real;
var
  rValor: real;
begin
  rValor := 0;
  cdsGeraMovLote.First;
    while not cdsGeraMovLote.Eof do
    begin
      rValor  := rValor + cdsGeraMovLote.fieldbyname('VALOR_LINHA').AsFloat;
      cdsGeraMovLote.next;
    end;
  Result := rValor;
end;
//Everson Cunha - SIG88640 - InÌcio
function TCtrlRemessaEletronica._ExisteCodBarras(codDocumento, codbarras, idCodxBarras: string): Boolean;
var
  _cds : TClientDataSet;
begin
  Result := False;

  _cds := TClientDataSet.Create(Nil);

  //Everson Cunha - SIG99642 - InÌcio
  //_cds.Data := GetDataPacket('SELECT 1 FROM CM.DOCUMENTOXCODBARRAS WHERE NUMCODBARRAS = ' + codbarras );
  if idCodxBarras = '0' then
    _cds.Data := GetDataPacket('SELECT 1 FROM CM.DOCUMENTOXCODBARRAS DXC ' +
                               '         JOIN CM.DOCUMENTO D ON D.CODDOCUMENTO = DXC.CODDOCUMENTO ' + // Everson Cunha - SIG125919
                               ' WHERE DXC.NUMCODBARRAS = ' + QuotedStr(codbarras) +
                               '   AND D.STATUS <> 2 ' ) // Everson Cunha - SIG125919
  else
    _cds.Data := GetDataPacket('SELECT 1 FROM CM.DOCUMENTOXCODBARRAS DXC ' +
                               '         JOIN CM.DOCUMENTO D ON D.CODDOCUMENTO = DXC.CODDOCUMENTO ' + // Everson Cunha - SIG125919
                               ' WHERE DXC.NUMCODBARRAS = ' + QuotedStr(codbarras) +
                               '   AND D.STATUS <> 2 ' + // Everson Cunha - SIG125919
                               '   AND DXC.IDDOCUMENTOXCODBARRAS <> ' + idCodxBarras );
  //Everson Cunha - SIG99642 - Fim

  if _cds.IsEmpty then
  begin
    _cds.Data := GetDataPacket('SELECT 1                                 ' +
                               '   FROM CM.DOCUMENTO D                   ' +
                               '  WHERE D.RECPAG = ''P''                 ' +
                               '    AND D.NUMLEITCODBARRAS IS NOT NULL   ' +
                               '    AND D.STATUS <> 2                    ' + // Everson Cunha - SIG125919
                               //'    AND D.NUMLEITCODBARRAS = ' + codbarras +          //Everson Cunha - SIG99642
                               '    AND D.NUMLEITCODBARRAS = ' + QuotedStr(codbarras) + //Everson Cunha - SIG99642
                               '    AND D.CODDOCUMENTO <> ' + codDocumento +    //Everson Cunha - SIG99642
                               '    AND D.DATAPROGRAMADA >= ''01/01/2020'' ');  //Everson Cunha - SIG99642

    if not _cds.IsEmpty then
      Result := True;
  end
  else
    Result := True;

  _cds.Free;
end;
//Everson Cunha - SIG88640 - Fim

function TCtrlRemessaEletronica._GPSPagto_PF_PJ(
  pFormaRecPag: integer): integer;
var
  cdsAux: TCMClientDataSet;
  SQL: string;
begin
  try
    cdsAux := TCMClientDataSet.Create(nil);

    SQL := 'SELECT NVL(FLGPAGTOAUTONOMO, 0) AS FLGPAGTOAUTONOMO ' + #13#10 +
           '  FROM CM.FORMARECPAG                               ' + #13#10 +
           ' WHERE CODFORMA =  '  +   IntToStr(pFormaRecPag)    ;

    cdsAux.Data := GetDataPacket(SQL);

    Result := cdsAux.FieldByName('FLGPAGTOAUTONOMO').AsInteger;

  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlRemessaEletronica._ListaConveniosFolha(pPeriodo: string): OleVariant;
var
    sSQL: string;
begin
  //  Paulo Nobre - WO15743- Inicio
  // Andre Imakawa - SIG 111288 - Inicio
{  sSQL := 'SELECT DISTINCT P.CODPORTFORMA, P.DESCRICAO AS DESCRICAO, P.PATHARQUIVOREM                 ' + #13#10+
          '  FROM PROCCONVENIODOC PC                                                                  ' + #13#10+
          '  JOIN DOCUMENTOXPESSOAS DP                                                                ' + #13#10+
          '    ON DP.CODDOCUMENTO = PC.CODDOCUMENTO                                                   ' + #13#10+
          '  JOIN DOCUMENTO D                                                                         ' + #13#10+
          '    ON D.RECPAG = ''P''                                                                    ' + #13#10+
          '   AND D.IDMODULO = ' + IntToStr(Sistema.IdModulo)                                           + #13#10+
          '   AND D.CODDOCUMENTO = PC.CODDOCUMENTO                                                    ' + #13#10+
          '  JOIN ARQUIVOXDOCUM A                                                                     ' + #13#10+
          '    ON DP.IDDOCUMENTOXPESSOAS = A.ID_DOC_CODBARRAS_PESSOAS                                 ' + #13#10+
          '   JOIN ARQUIVOPAGTO AP                                                                    ' + #13#10+
          '   ON AP.IDARQUIVOPAGTO = A.IDARQUIVOPAGTO                                                 ' + #13#10+
          '  JOIN PORTADORFORMA  P                                                                    ' + #13#10+
          '    ON P.CODPORTFORMA = AP.CODPORTFORMA                                                    ' + #13#10+
          ' WHERE TO_CHAR(D.DATAPROGRAMADA, ''MM/YYYY'') =  '  + QuotedStr(pPeriodo)                    + #13#10+
          '   AND P.RECPAG = ''P''                                                                    ' + #13#10+
          '   AND P.FLGARQUIVO = ''S''                                                                ' + #13#10+
          '   AND NOT EXISTS (SELECT 1 FROM HSTFOLHABENEFCAP H WHERE H.CODDOCUMENTO = D.CODDOCUMENTO) ' + #13#10+
          ' ORDER BY DESCRICAO                                                                        ';
  // Andre Imakawa - SIG 111288 - Fim

}
  sSQL := 'SELECT DISTINCT P.CODPORTFORMA,                                                              ' + #13#10+
          '       P.DESCRICAO AS DESCRICAO,                                                             ' + #13#10+
          '       P.PATHARQUIVOREM                                                                      ' + #13#10+
          'FROM PROCCONVENIODOC PC                                                                      ' + #13#10+
          'JOIN DOCUMENTOXPESSOAS DP ON DP.CODDOCUMENTO = PC.CODDOCUMENTO                               ' + #13#10+
          'JOIN DOCUMENTO D ON D.RECPAG = ''P''                                                         ' + #13#10+
          '	        		  AND D.IDMODULO = ' + IntToStr(Sistema.IdModulo)                                 + #13#10+
          '               AND D.CODDOCUMENTO = DP.CODDOCUMENTO                                          ' + #13#10+
          'JOIN ARQUIVOXDOCUM A ON A.ID_DOC_CODBARRAS_PESSOAS = DP.IDDOCUMENTOXPESSOAS                  ' + #13#10+
          'JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = A.IDARQUIVOPAGTO                                 ' + #13#10+
          'JOIN PORTADORFORMA P ON P.CODPORTFORMA = AP.CODPORTFORMA                                     ' + #13#10+
          'WHERE TO_CHAR(D.DATAPROGRAMADA,''MM/YYYY'') = '  + QuotedStr(pPeriodo)                         + #13#10+
          '      AND P.RECPAG = ''P''                                                                   ' + #13#10+
          '      AND P.FLGARQUIVO = ''S''                                                               ' + #13#10+
          '      AND NOT EXISTS (SELECT 1                                                               ' + #13#10+
          '                      FROM HSTFOLHABENEFCAP H                                                ' + #13#10+
          '                      WHERE H.CODDOCUMENTO = D.CODDOCUMENTO)                                 ' + #13#10+
          'ORDER BY DESCRICAO                                                                           ';

  Result := GetDataPacket(sSql);
//  Paulo Nobre - WO15743- Inicio

end;

function TCtrlRemessaEletronica.GetDadosGPSAutonomo: OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDPESSOA, RAZAOSOCIAL,             ' +#13#10 +
          '       TRIM(NUMDOCUMENTO) AS NUMDOCUMENTO ' +#13#10 +
          '  FROM PESSOA                             ' +#13#10 +
          ' WHERE IDPESSOA = 1                       ' ;

  Result := GetDataPacket(sSQL);
end;

// Paulo Nobre - WO15743 - Inicio
// Paulo Nobre - WO6194 - Inicio
function TCtrlRemessaEletronica._SelecionaMovArquivoFB(pOrigemPagto : Integer; pAnoMesPagto, pIdFolha, pConvenio, pFlgEnviado : string): OleVariant;
var sSql: string;
Begin
   sSql := 'SELECT DISTINCT                                                                                ' + #13#10 +
      '       AP.IDARQUIVOPAGTO,                                                                           ' + #13#10;

      if (pOrigemPagto = 0) then      // Folha
        sSql := sSql + '       TB.IDHSTFOLHABENEF,                                                         ' + #13#10
      else                            // Entidades
        sSql := sSql + '       0 AS IDHSTFOLHABENEF,                                                       ' + #13#10;

      sSql := sSql + '       AP.CODPORTFORMA,                                                              ' + #13#10 +
      '       CAST(LPAD(AP.NSA, 6, ''0'')  AS VARCHAR2(6)) AS NSA,                                         ' + #13#10 + //MIGRACAO-ORACLE LEANDRO
      '       AP.VLRTOTAL,                                                                                 ' + #13#10 +
      '       AP.TRGDTINCLUSAO DT_PREPARO,                                                                 ' + #13#10 +
      '       DECODE(TRIM(U.NOMEUSUARIO), ''CM'', AP.TRGUSERINCLUSAO, U.NOMEUSUARIO) AS USU_PREPARO,       ' + #13#10 +
      '       AP.DTGERACAOARQTXT,                                                                          ' + #13#10 +
      '       AP.USUGERACAOARQTXT,                                                                         ' + #13#10 +
      '       AP.NOMEARQTXT,                                                                               ' + #13#10 +
      '       AP.DTFINALIZAARQTXT,                                                                         ' + #13#10 +
      '       AP.USUFINALIZAARQTXT,                                                                        ' + #13#10 +
      '       AP.DTCANCELAARQTXT,                                                                          ' + #13#10 +
      '       AP.USUCANCELAARQTXT,                                                                         ' + #13#10 +
      '       P.DESCRICAO AS NOME_CONVENIO,                                                                ' + #13#10 +
      '       AP.FLGENVIADO,                                                                               ' + #13#10 +
      '       P.PATHARQUIVOREM,                                                                            ' + #13#10 +
      '       P.PATHARQUIVORET,                                                                            ' + #13#10 +
      '       P.PATHARQUIVOSEGURANCA,                                                                      ' + #13#10 +
      '       P.PATHARQUIVOBACKUP,                                                                         ' + #13#10 +
      '       DECODE(DC.STATUS, 2, ''Baixado'', ''Aberto'') AS STATUS,                                     ' + #13#10 +
      '       P.DESCRICAO AS CONVENIO                                                                      ' + #13#10 +
      'FROM CM.ARQUIVOPAGTO AP                                                                             ' + #13#10 +
      'JOIN CM.ARQUIVOXDOCUM AX ON AX.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                                   ' + #13#10 +
      'JOIN CM.DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS                ' + #13#10;

      if (pOrigemPagto = 0) then  // Folha
        sSql := sSql + 'JOIN CM.HSTFOLHABENEFCAP TB ON TB.CODDOCUMENTO = DP.CODDOCUMENTO                   ' + #13#10
      else                        // Entidades
        sSql := sSql + 'JOIN CM.PROCCONVENIODOC TB ON TB.CODDOCUMENTO = DP.CODDOCUMENTO                    ' + #13#10;

      sSql := sSql + 'JOIN CM.DOCUMENTO DC ON DC.CODDOCUMENTO = TB.CODDOCUMENTO                            ' + #13#10 +
      'JOIN CM.PORTADORFORMA P ON P.CODPORTFORMA = AP.CODPORTFORMA                                         ' + #13#10 +
      'JOIN CM.USUARIOSISTEMA U ON U.IDUSUARIO = NVL(REGEXP_REPLACE(AP.TRGUSERINCLUSAO, ''\D''), 2)        ' + #13#10 +
      'WHERE AP.FLGENVIADO = ' + quotedstr(pFlgEnviado)                                                      + #13#10;

   if (pAnoMesPagto <> EmptyStr) AND (pIdFolha = EmptyStr) then
       sSql := sSql + '      AND TO_CHAR(DC.DATAPROGRAMADA, ''YYYYMM'') = ' + quotedstr(pAnoMesPagto) + #13#10;

{   if (pOrigemPagto <> 0) then
     sSql := sSql + '  AND EXISTS (SELECT 1                                                                ' + #13#10 +
                    '                    FROM CM.DOCUMENTOXPESSOAS DP                                      ' + #13#10 +
                    '                    JOIN CM.PROCCONVENIODOC PD ON PD.CODDOCUMENTO = DP.CODDOCUMENTO   ' + #13#10 +
                    '                    JOIN CM.ARQUIVOXDOCUM AD ON AD.ID_DOC_CODBARRAS_PESSOAS = DP.IDDOCUMENTOXPESSOAS ' + #13#10 +
                    '                                                AND AD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO)           ' + #13#10;
 }
   if (pIdFolha <> EmptyStr) Then
      sSql := sSql + '      AND TB.IDHSTFOLHABENEF = ' + quotedstr(pIdFolha) + #13#10;

   If (pConvenio <> EmptyStr) Then
      sSql := sSql + '      AND AP.CODPORTFORMA = ' + quotedstr(pConvenio) + #13#10;      

   sSql := sSql + 'ORDER BY AP.IDARQUIVOPAGTO DESC                                                         ' + #13#10;

   Result := GetDataPacket(sSql);
   sqlText.Clear;
   sqlText.add(sSql);
   sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovArquivoFB_' + pFlgEnviado + '.txt');
End;

//edilaine WO38027 : inicio
//function TCtrlRemessaEletronica._SelecionaMovArqDetalheFB(pOrigemPagto : Integer; pAnoMesPagto, pIdFolha, pConvenio, pFlgEnviado : string): OleVariant;
function TCtrlRemessaEletronica._SqlSelecionaMovArqDetalheFB(pOrigemPagto : Integer; pAnoMesPagto, pIdFolha, pConvenio, pFlgEnviado : string): string;
var sSql: string;
Begin
   sSql := 'SELECT D.NUMAPGR AS NUM_AP,                                                                          ' + #13#10 +
      '       D.NODOCUMENTO,                                                                                     ' + #13#10 +
      '       D.DATAPROGRAMADA,                                                                                  ' + #13#10 +
      '       AX.VALOR,                                                                                          ' + #13#10 +
      // Paulo Nobre - WO33342 - Inicio
      '       CAST(CM.FN_FORMATACPFCNPJ(DP.NUMDOCUMENTO) AS VARCHAR2(18)) AS CPF_CNPJ_MASC,                      ' + #13#10 +
      //'       CAST(                                                                                              ' + #13#10 +
      //'         CASE LENGTH(REGEXP_REPLACE(DP.NUMDOCUMENTO, ''\D''))                                             ' + #13#10 +
      //'           WHEN 11 THEN                                                                                   ' + #13#10 +
      //'             REGEXP_REPLACE(REGEXP_REPLACE(DP.NUMDOCUMENTO, ''\D''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'')  ' + #13#10 +
      //'           WHEN 14 THEN                                                                              ' + #13#10 +
      //'             REGEXP_REPLACE(REGEXP_REPLACE(DP.NUMDOCUMENTO, ''\D''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'')  ' + #13#10 +
      //'           ELSE                                                                                           ' + #13#10 +
      //'             REGEXP_REPLACE(DP.NUMDOCUMENTO, ''\D'')                                                      ' + #13#10 +
      //'      END AS VARCHAR(18)) AS CPF_CNPJ_MASC,                                                               ' + #13#10 +
      // Paulo Nobre - WO33342 - Fim
      '      DP.RAZAOSOCIAL,                                                                                     ' + #13#10 +
      '      REGEXP_REPLACE(DP.NUMBANCO, ''\D'') AS NUM_BANCO,                                                   ' + #13#10 +
      '      REGEXP_REPLACE(DP.NUMAGENCIA, ''\W'') AS NUM_AGENCIA,                                               ' + #13#10 +
      '      REGEXP_REPLACE(DP.NUMCONTA, ''\W'')  AS NUM_CONTA,                                                  ' + #13#10 +
      '      SUBSTR(D.NUMLEITCODBARRAS,1,79) AS COD_BARRAS_MASC,                                                 ' + #13#10 +
      '      DECODE(D.STATUS, 2, ''Baixado'', ''Aberto'') AS STATUS,                                             ' + #13#10 +
      '      AX.CODFORMA,                                                                                        ' + #13#10 +
      '      CAST(LPAD(AP.NSA, 6, ''0'')  AS VARCHAR2(6)) AS NSA,                                                ' + #13#10 + //MIGRACAO-ORACLE LEANDRO
      '      AX.IDARQUIVOPAGTO,                                                                                  ' + #13#10 +
      '      (SELECT DISTINCT L2.HISTORICOCOMPL HISTORICO                                                        ' + #13#10 +
      '       FROM LANCTODOCUM L2                                                                                ' + #13#10 +
      '       WHERE L2.OPERACAO = 2                                                                              ' + #13#10 +
      '             AND L2.CODDOCUMENTO = D.CODDOCUMENTO ) AS HIST,                                              ' + #13#10 +
      '      AP.USUGERACAOARQTXT,                                                                                ' + #13#10 +
      '      (SELECT DISTINCT CR.NOME                                                                            ' + #13#10 +
      '       FROM CM.RATEIODOCUM RD                                                                             ' + #13#10 +
      '       JOIN CM.CENTRESPON CR ON CR.CODCENTRORESPON = RD.CODCENTRORESPON                                   ' + #13#10 +
      '       WHERE RD.CODDOCUMENTO = D.CODDOCUMENTO ) AS CENT_RESPON,                                           ' + #13#10 +
      '      D.CODPORTFORMA,                                                                                     ' + #13#10 +
      '      AP.FLGENVIADO,                                                                                      ' + #13#10 +
      '      AP.TRGDTINCLUSAO,                                                                                   ' + #13#10 +
      '      AP.FLGPAGTOPIX,                                                                                     ' + #13#10 +
      '      AX.DATAVENCTO,                                                                                      ' + #13#10;

      if (pOrigemPagto = 0) then      // Folha
        sSql := sSql + '       TB.IDHSTFOLHABENEF,                                                               ' + #13#10
      else                            // Entidades
        sSql := sSql + '       0 AS IDHSTFOLHABENEF,                                                             ' + #13#10;

      sSql := sSql + '      P.DESCRICAO AS CONVENIO                                                              ' + #13#10 +
      'FROM CM.ARQUIVOPAGTO AP                                                                                   ' + #13#10 +
      'JOIN CM.ARQUIVOXDOCUM AX ON AX.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                                         ' + #13#10 +
      'JOIN CM.DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS                      ' + #13#10;

      if (pOrigemPagto = 0) then  // Folha
        sSql := sSql + 'JOIN CM.HSTFOLHABENEFCAP TB ON TB.CODDOCUMENTO = DP.CODDOCUMENTO                         ' + #13#10
      else                        // Entidades
        sSql := sSql + 'JOIN CM.PROCCONVENIODOC TB ON TB.CODDOCUMENTO = DP.CODDOCUMENTO                          ' + #13#10; 

      sSql := sSql + 'JOIN CM.DOCUMENTO D ON D.CODDOCUMENTO = TB.CODDOCUMENTO                                    ' + #13#10 +
      'JOIN CM.PORTADORFORMA P ON P.CODPORTFORMA = AP.CODPORTFORMA                                               ' + #13#10 +
      'WHERE AP.FLGENVIADO = ' + quotedstr(pFlgEnviado)                                                          + #13#10;

   if (pAnoMesPagto <> EmptyStr) AND (pIdFolha = EmptyStr) then
       sSql := sSql + '      AND TO_CHAR(D.DATAPROGRAMADA, ''YYYYMM'') = ' + quotedstr(pAnoMesPagto) + #13#10;

{   if (pOrigemPagto <> 0) then
     sSql := sSql + '  AND EXISTS (SELECT 1                                                                ' + #13#10 +
                    '                    FROM CM.DOCUMENTOXPESSOAS DP                                      ' + #13#10 +
                    '                    JOIN CM.PROCCONVENIODOC PD ON PD.CODDOCUMENTO = DP.CODDOCUMENTO   ' + #13#10 +
                    '                    JOIN CM.ARQUIVOXDOCUM AD ON AD.ID_DOC_CODBARRAS_PESSOAS = DP.IDDOCUMENTOXPESSOAS ' + #13#10 +
                    '                                                AND AD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO)           ' + #13#10;
}
   if (pIdFolha <> EmptyStr) Then
      sSql := sSql + '      AND TB.IDHSTFOLHABENEF = ' + quotedstr(pIdFolha) + #13#10;

   If (pConvenio <> EmptyStr) Then
      sSql := sSql + '      AND AP.CODPORTFORMA = ' + quotedstr(pConvenio) + #13#10;         

   sSql := sSql + 'ORDER BY DP.RAZAOSOCIAL ASC                                                                   ' + #13#10;

   Result := sSql;
End;
// Paulo Nobre - WO6194 - Fim
// Paulo Nobre - WO15743 - Fim


function TCtrlRemessaEletronica._SelecionaMovArqDetalheFB(pOrigemPagto : Integer; pAnoMesPagto, pIdFolha, pConvenio, pFlgEnviado : string): OleVariant;
var sSql: string;
begin
   sSQL := _SqlSelecionaMovArqDetalheFB(pOrigemPagto, pAnoMesPagto, pIdFolha, pConvenio, pFlgEnviado);

   Result := GetDataPacket(sSql);
   sqlText.Clear;
   sqlText.add(sSql);
   sqlText.SaveToFile(sPathArquivo + '\SQL_MovArqDetalhadoFB_' + pFlgEnviado + '.txt');
End;
//edilaine WO38027 : fim


End.

