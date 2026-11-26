// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//  Autor     : Taffarel Sevaybriker
//  Pendencia : SIG102312
//  Descrição : Habilitar os campos edtotdividapatro, edtotdividapart e rSalBase.
//              Desabilitar o campo redPercSeguro.
//  Data      : 12/10/2020
//------------------------------------------------------------------------------
//  Alteração : CalculaTpCarencia, CalculaTotalCarencia, CalculaCarenciaPart, CalculaCarenciaPatro
//  Autor     : Edilaine
//  Pendencia : SIG 82048/83201
//  Descrição : Calcular o tempo de carência das contribuições faltantes condierando
//              a data de desligamento do participante em vez da data atual
//  Data      : 12/03/2019
//------------------------------------------------------------------------------
//  Autor     : Taffarel Sevaybriker
//  Pendencia : SIG 73701
//  Descrição : Correção nos parâmetros de execução das regras de carência.
//  Data      : 20/08/2018
//------------------------------------------------------------------------------
//  Autor     : Taffarel Sevaybriker
//  Pendencia : SOL 67010.68619
//  Descrição : Alteração na ordem de execução das regras
//  Data      : 15/05/2018
//------------------------------------------------------------------------------
// Nº SIG.....: SIG TIBERO
// Data.......: 05/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
//  Autor     : Otacilio Aquino
//  Pendencia : SOL 176028/14148 KINTANA 1961222
//  Descrição : Correção na query de entrada
//  Data      : 20/03/2013
//------------------------------------------------------------------------------
//  Autor     : BRUNO AZEVEDO
//  Pendencia : SOL 147807 KINTANA 1027715
//  Descrição : Correção na query de entrada
//  Data      : 18/11/2010
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 08/10/2010
// Pendência   :  SOL 133883 KINTANA 783839
// Alteração   : Descrição: Alterado os botões e as funções dos mesmos da tela de   compra de
//                 tempo de serviço
// -----------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 29/03/2010
// Pendência   : SOL 132620 Kintana 769854
// Alteração   : Ao entrar a funcionalidade pelo menu "Compra de Carência de Tempo"
// o sistema não deixava alterar as informações da tela.
// -----------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 03/11/2009
// Pendência   : SOL 126352 Kintana 659918
// Alteração   : Foi filtrada uma passagem da função VoltaNumParcelasAPagar para
// somente ser acessada por esta tela.
// -----------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 02/10/2009
// Pendência   : SOL 125202 Kintana 642874
// Alteração   : Estava ocorrendo um erro de BPL pois a funcionalidade "Envio de
// contribuiçoes para folha" estava chamando a função VoltaNumParcelasAPagar e
// a variavel nao estava sendo utilizada naquele ponto.
// -----------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 03/08/2009
// Pendência   : SOL 40370 Kintana 525322
// Alteração   : O sistema estava contando errado o número de parcelas geradas
//               e pagas.
// -----------------------------------------------------------------------------
// Autor(a)    : Henrique Massão
// Rotina      : rTotDividaBtnClick
// Data        : 20/04/2009
// Pendência   : SOL 113400 KINTANA 527632
// Alteração   : Está somando corretamente o campo Saldo devedor para os partici
//               pantes que querem calcular mais de duas contribuições.
// -----------------------------------------------------------------------------
// Autor(a)    : Henrique Massão
// Rotina      : rTotDividaBtnClick
// Data        : 20/02/2009
// Pendência   : SOL 107699 KINTANA 497032
// Alteração   : Foi corrigido a forma da geração dos valores no campo Saldo
//               devedor.
// -----------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : CalculaDivida
// Data        : 27/08/2007
// Pendência   : 28256
// Alteração   : Incluir decode na query.
// -----------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : VoltaNumParcelasAPagar
//  Data       : 12/05/2006
//  Pendencia  : 21946
//  Alteração  : Ajuste de contagem de parcela gerada/paga no parcelamento de divida previdenciaria
//               para que nao considere devolucoes.
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : pmmVisualisaDivergTratadasClick
//  Data       : 08/05/2006
//  Pendencia  : 22142
//  Alteração  : Correção para retirar implementação das rotinas qryParcelamentoAfterOpen e BtnCancelaClick.
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : pmmVisualisaDivergTratadasClick, qryParcelamentoAfterOpen e BtnCancelaClick
//  Data       : 04/05/2006
//  Pendencia  : 22142
//  Alteração  : Implementação de filtro para não visualizar contribuições divergentes já tratadas
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : modificação de query
//  Data       : 04/05/2006
//  Pendencia  : 22153
//  Alteração  : Mudança de label de "Atrasada e não paga" para "Atrasada e já tratada".
// -------------------------------------------------------------------------------------------------
// Rotina      : [geral]
// Autor(a)    : Leo
// Data        : 11/10/2005 - 17/10/2005
// Pendência   : 20431
// Descricao   : 1.Alteração geral para visualização de parcelamento anteriores e criação de novos parcelamentos.
//               Caso o participante já tivesse contratado um parcelamento, a tela não permitia a entrada de outro.
//               2.Alteração de toda a parte de refinanciamento para não só permitir o parcelamento de contribuições de outro parcelamento, e sim,
//               contribuições normais atrasadas ou adicinais, contribuições de outros parcelamento e o saldo devedor atual.
//------------------------------------------------------------------------------
// Rotina      : VoltaNumParcelasAPagar
// Autor(a)    : Leo
// Data        : 06/07/2005
// Pendência   : 19642
// Descricao   : acertei apuração de parcelas a pagar. Caso não existisse histórico,
//               ao invés de voltar o número total de parcelas, retornava zero.
//------------------------------------------------------------------------------
// Rotina      : TrazDadosParcela
// Autor(a)    : Leo
// Data        : 03/06/2005
// Pendência   : 19395
// Descricao   : não voltar a variável IDPARCELAMNENTO como '0' e sim '', para não dar problema de constraint
//------------------------------------------------------------------------------
// Rotina      : TrazDadosParcela
// Autor(a)    : Leo
// Data        : 13/05/2005
// Pendência   : 19180
// Descricao   : novo parâmetro para voltar número de parcelas a vencer
//------------------------------------------------------------------------------
// Rotina      : VoltaNumParcelasAPagar
// Autor(a)    : Leo
// Data        : 13/05/2005
// Pendência   : 19180
// Descricao   : acerto da contagem de cobranças realizadas
//------------------------------------------------------------------------------
// Rotina      : CalculaSdoDevedor
// Autor(a)    : Leo
// Data        : 13/05/2005
// Pendência   : 19180
// Descricao   : passagem novo parâmetro para o cálculo do saldo devedor, número de parcelas a vencer
//------------------------------------------------------------------------------
// Rotina      : TrazDadosParcela
// Autor(a)    : Leo
// Data        : 12/05/2005
// Descricao   : alteração da função para recalcular salário e saldo devedor
//------------------------------------------------------------------------------
// Rotina      : Varias
// Autor(a)    : Augusto
// Data        : 29/11/2004 - 30/11/2004
// Descricao   : Varias alterações para viabilizar s utilização do parcelamento
//               dentro de eventos.
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 21.10.2004
// Descricao   : melhoramento para voltar maracações feitas antes do cálculo do valor da dívida
//------------------------------------------------------------------------------
// Rotina      : Greal
// Autor(a)    : Leo
// Data        : 21.10.2004
// Descricao   : possibilitar o cálculo ou não de alteradores por contribuição para
//               casos de cálculo atuiarial
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------
// Rotina      : Desfazer
// Autor(a)    : Leo
// Data        : 24/09/2004
// Alteração   : troca dos parâmetros da função voltasitrecebimento
//------------------------------------------------------------------------------
// Rotina      : btncalclaprestacaoClick
// Autor(a)    : Leo
// Data        : 17/09/2004
// Alteração   : passar o valor da dívida também como o campo SDODEVEDOR para o primeiro cálculo
//------------------------------------------------------------------------------
// Rotina      : SetIdParcelamento
// Autor(a)    : Leo
// Data        : 17/09/2004
// Alteração   : inclusão o percentual de seguro
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/04/2004
// Alteração   : CalculaOpcoes - Novo campo para Regra
// Data        : 06/04/2004
// Alteração   : btncalclaprestacaoClick - Novo campo para Regra
//------------------------------------------------------------------------------
// Autor(a)    : LeoFuncef
// Data        : 09.02.2004
// Rotina      : TrazDadosParcela
// Alteração   : tratamento do PERCENTUAL com oranumero
//------------------------------------------------------------------------------
// Autor(a)    : LeoFuncef
// Data        : 05.02.2004
// Rotina      : TrazDadosParcela
// Alteração   : tratamento dos valores com oranumero
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.01.2004
// Rotina      :
// Pendencia   : --- ( Funcef )
// Alteração   : Acrescimo dos campos percentual do seguro e do salario no grid
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.01.2004
// Rotina      :
// Pendencia   : --- ( Funcef )
// Alteração   : Acerto no teste do motivo de amortização
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.01.2004
// Rotina      : qryHstParcelamento
// Pendencia   : --- ( Funcef )
// Alteração   : Ordenar por mesreferencia e acrescentar percseguro
//------------------------------------------------------------------------------
unit FParcelamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, TB97Ctls, ComCtrls,  Spin,
  wwdblook, Menus, DBCtrls, Mask, wwdbedit, wwdbdatetimepicker,
  CMDateTimePicker, TEdNum, DBGrids, MskEdDlg, TREdit, TB97Tlwn,
  wwSpeedButton, wwDBNavigator, wwclearpanel;

type
  tOpProc = ( oInicial,  oParcela, oQuitacao, oAmortiza , oRefinanc );

  TfrmParcelamento = class(TfrmOkCancelar)
    pmlParticipante: TPanel;
    stxtProcesso: TStaticText;
    MontaSelectPart: TMontaSelect;
    pnlContribuicoes: TPanel;
    Panel2: TPanel;
    sbtnTitular: TSpeedButton;
    sbtnSalarios: TSpeedButton;
    memTitular: TMemo;
    sbtnProcParticip: TSpeedButton;
    qryTitular: TwwQuery;
    qryContaBancaria: TwwQuery;
    qryAux: TwwQuery;
    qrySalarios: TwwQuery;
    dsSalAux: TwwDataSource;
    dbgrdSalarios: TwwDBGrid;
    qryContribuicao: TwwQuery;
    dsContribuicao: TwwDataSource;
    stxttitulo: TStaticText;
    updContribuicao: TUpdateSQL;
    qryDocumentos: TwwQuery;
    qryDocumentosCODDOCUMENTO: TFloatField;
    qryDocumentosPLANO: TFloatField;
    qryDocumentosPLACONTA: TStringField;
    qryDocumentosPLNCODIGO: TFloatField;
    qryDocumentosNUMLANCTO: TFloatField;
    qryDocumentosUNIDNEGOC: TFloatField;
    qryDocumentosCODCENTRORESPON: TStringField;
    qryDocumentosCODTIPRECDES: TStringField;
    qryDocumentosVALOR: TFloatField;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TStringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TStringField;
    qryContabilNOME: TStringField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
    qryContabilLACTIPCONVOFICIAL: TStringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TStringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TStringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TStringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TStringField;
    qryContabilLACORIGEMAPLIC: TStringField;
    qryContabilTIPCODIGO: TStringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TStringField;
    qryContabilPLNDATDIA: TDateTimeField;
    updDocumentos: TUpdateSQL;
    updContabil: TUpdateSQL;
    Splitter1: TSplitter;
    qryAux2: TwwQuery;
    qryDocumentosIDPESSJUR: TFloatField;
    qryDocumentosIDPLANOPREV: TFloatField;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    qryContribuicaoFLGSELECIONADO: TFloatField;
    qryContribuicaoNODOCUMENTO: TFloatField;
    qryContribuicaoNOSSONUMERO: TStringField;
    qryContribuicaoNOMERESUM: TStringField;
    qryContribuicaoNOME: TStringField;
    qryContribuicaoMESREFERENCIA: TStringField;
    qryContribuicaoMESCOBRANCA: TStringField;
    qryContribuicaoDATAPREVISAORECE: TDateTimeField;
    qryContribuicaoVALORESPERADO: TFloatField;
    qryContribuicaoVALORRECEBIDO: TFloatField;
    qryContribuicaoSITRECEBIMENTO: TStringField;
    qryContribuicaoIDLOTE: TFloatField;
    qryContribuicaoNUMRECEBIMENTO: TFloatField;
    qryContribuicaoIDMOTIVO: TFloatField;
    qryContribuicaoDATARECEBIMENTO: TDateTimeField;
    qryContribuicaoCODPORTFORMA: TFloatField;
    qryContribuicaoVALOROP1: TFloatField;
    qryContribuicaoVALOROP2: TFloatField;
    qryContribuicaoVALOROP3: TFloatField;
    qryContribuicaoCODDOCUMENTOPREV: TFloatField;
    qryContribuicaoVALORCALCULADO: TFloatField;
    qryContribuicaoFLGDESCFOLHA: TFloatField;
    qryContribuicaoIDCONTRIBUICAO: TFloatField;
    qryContribuicaoIDPESSJUR: TFloatField;
    qryContribuicaoIDPLANOPREV: TFloatField;
    qryContribuicaoIDPESSOA: TFloatField;
    qryContribuicaoSEQPROPOSTA: TFloatField;
    qryContribuicaoDATAINICIO: TDateTimeField;
    qryContribuicaoDATAFINAL: TDateTimeField;
    qryContribuicaoFLGSITFUNDACAO: TStringField;
    qryContribuicaoFLGEVENTO: TFloatField;
    qryContribuicaoDATACANCELAMENTO: TDateTimeField;
    qryContribuicaoDATAEMISSCOB: TDateTimeField;
    qryContribuicaoFLGCALCRESERVA: TFloatField;
    qryContribuicaoMATRICULA: TStringField;
    qryContribuicaoFLGPAGADOR: TStringField;
    qryContribuicaoINSCRICAONUMERO: TFloatField;
    qryContribuicaoFLGDESCFOLHA_1: TFloatField;
    qryContribuicaoDIAVENCIMENTO: TFloatField;
    qryContribuicaoPLANO: TFloatField;
    qryContribuicaoPLACONTAC: TStringField;
    qryContribuicaoPLACONTAD: TStringField;
    qryContribuicaoNOMECONTRIB: TStringField;
    qryContribuicaoSALMANTIDO: TFloatField;
    qryContribuicaoFLGDEVOLUCAO: TFloatField;
    qryContribuicaoDATAINICIO_1: TDateTimeField;
    qryContribuicaoIDEMPRESA: TFloatField;
    qryContribuicaoPLANO_1: TFloatField;
    qryContribuicaoTIPCODIGO: TStringField;
    qryContribuicaoCODTIPDOC: TFloatField;
    qryContribuicaoPLANO13: TFloatField;
    qryContribuicaoPLACONTAC13: TStringField;
    qryContribuicaoPLACONTAD13: TStringField;
    qryContribuicaoCODCENTROCUSTOC13: TStringField;
    qryContribuicaoIDEMPRESA13: TFloatField;
    qryContribuicaoCODCENTROCUSTOD13: TStringField;
    qryContribuicaoUNIDNEGOC13: TFloatField;
    qryContribuicaoIDEMPRESAPROP13: TFloatField;
    qryContribuicaoCODCENTRORESPON13: TStringField;
    qryContribuicaoCODSUBCONTA13: TFloatField;
    qryContribuicaoRECPAG13: TStringField;
    qryContribuicaoCODTIPRECDES13: TStringField;
    qryContribuicaoTIPCODIGO13: TStringField;
    qryContribuicaoCODTIPDOC13: TFloatField;
    qryContribuicaoCODPORTFORMA13: TFloatField;
    qryContribuicaoIDPLANPREVCONTAB: TFloatField;
    qryContribuicaoPLACONTADBANCO: TStringField;
    qryContribuicaoPLACONTADBANCO13: TStringField;
    qryContribuicaoSALMANTIDO_1: TFloatField;
    qryContribuicaoFLGDEVOLUCAO_1: TFloatField;
    qryContribuicaoDATAINICIO_2: TDateTimeField;
    qryContribuicaoNOMESITUACAO: TStringField;
    qryContribuicaoIDREGRACALCULO: TFloatField;
    qryContribuicaoFLGINTERNO: TStringField;
    qryContribuicaoCODCENTROCUSTOC: TStringField;
    qryContribuicaoCODCENTROCUSTOD: TStringField;
    qryContribuicaoCODSUBCONTA: TFloatField;
    qryContribuicaoCODTIPRECDES: TStringField;
    qryContribuicaoCODCENTRORESPON: TStringField;
    qryContribuicaoUNIDNEGOC: TFloatField;
    qrySalAux: TwwQuery;
    qrySalariosMES: TStringField;
    qrySalariosMESCOBRANCA: TStringField;
    qrySalariosVALORPROVENTO: TFloatField;
    qrySalAuxMES: TStringField;
    qrySalAuxMESCOBRANCA: TStringField;
    qrySalAuxVALORPROVENTO: TStringField;
    qryContribuicaoTipoPgmto: TStringField;
    qryContribuicaoCODTIPDESEMBDEVOL: TStringField;
    qryContribuicaoCODCCUSTODEVOL: TStringField;
    qryContribuicaoPLACONTADEVOL: TStringField;
    qryDocumentosFLGDEVOLUCAO: TFloatField;
    qryParcelamento: TwwQuery;
    qryHstParcelamento: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField3: TStringField;
    FloatField4: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    StringField7: TStringField;
    FloatField5: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    StringField14: TStringField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    StringField17: TStringField;
    StringField18: TStringField;
    FloatField27: TFloatField;
    DateTimeField7: TDateTimeField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    StringField19: TStringField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    FloatField32: TFloatField;
    StringField23: TStringField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    StringField24: TStringField;
    FloatField35: TFloatField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    StringField28: TStringField;
    StringField29: TStringField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    DateTimeField8: TDateTimeField;
    FloatField41: TFloatField;
    StringField30: TStringField;
    StringField31: TStringField;
    FloatField42: TFloatField;
    StringField32: TStringField;
    FloatField43: TFloatField;
    StringField33: TStringField;
    dsHstParcelamento: TwwDataSource;
    qryContribuicaoFLGPARCELAMENTO: TFloatField;
    qryopcoes: TwwQuery;
    qryopcoesFLGSELECIONADO: TFloatField;
    qryopcoesVALOR: TStringField;
    qryopcoesNMESES: TStringField;
    qryopcoesPERCENTUAL: TStringField;
    dsOpcoes: TwwDataSource;
    pgctrlCobrancas: TPageControl;
    tbsGrid: TTabSheet;
    pnlcalculos: TPanel;
    Label8: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    rgrpFormaCob: TRadioGroup;
    rSalBase: TcmMaskEditDlg;
    edtotdividapart: TEdit;
    edtotdividapatro: TEdit;
    BtnProximo: TBitBtn;
    BtnCancela: TBitBtn;
    rTotDivida: TcmMaskEditDlg;
    tbOpcoes: TTabSheet;
    grdOpcoes: TwwDBGrid;
    Panel3: TPanel;
    btncancelaopcao: TBitBtn;
    btncalclaprestacao: TBitBtn;
    Panel4: TPanel;
    btncartaopcoes: TBitBtn;
    tbDemons: TTabSheet;
    Panel1: TPanel;
    bbtnSalvar: TBitBtn;
    BitBtn1: TBitBtn;
    Panel6: TPanel;
    btncancelardemons: TBitBtn;
    btnAntDemons: TBitBtn;
    BtnEncerra: TBitBtn;
    tbFinanc: TTabSheet;
    pnlcancelamento: TPanel;
    Label16: TLabel;
    Label9: TLabel;
    edmotivocancel: TEdit;
    BitBtn9: TBitBtn;
    btnCancelarCancel: TBitBtn;
    cmbSitParcelamento: TComboBox;
    pnlAmortizacao: TPanel;
    Label15: TLabel;
    Label5: TLabel;
    btnAmortiza: TBitBtn;
    btnCancelaAmortiza: TBitBtn;
    spnumpacelas: TSpinEdit;
    pnlhistorico: TPanel;
    dbcrghstparcelamento: TwwDBGrid;
    Panel7: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    stxtfinanc: TStaticText;
    pnlOperacoes: TPanel;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    btnDesfazer: TToolbarButton97;
    ToolbarSep978: TToolbarSep97;
    btnRefinanciar: TToolbarButton97;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    btnCancelar: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    btnQuitar: TToolbarButton97;
    ToolbarSep975: TToolbarSep97;
    btnAnterioropcao: TBitBtn;
    btnAmortizar: TToolbarButton97;
    ToolbarSep976: TToolbarSep97;
    tbParam: TToolWindow97;
    pnlTextoFluxOper: TPanel;
    Bevel1: TBevel;
    pnlparam: TPanel;
    GroupBox1: TGroupBox;
    btnSairParam: TBitBtn;
    memmostracontrib: TMemo;
    qryPortForma: TwwQuery;
    dbSdoDevedor: TDBRealEdit;
    DBRealEdit4: TDBRealEdit;
    DBRealEdit5: TDBRealEdit;
    rdbNumarcelas: TDBRealEdit;
    dsparcelamento: TwwDataSource;
    rSdoDevedorAtual: TRealEdit;
    rParcelasaPagar: TRealEdit;
    rSalAtual: TRealEdit;
    GroupBox2: TGroupBox;
    dtVencBoleta: TCMDateTimePicker;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    SaveDlg: TSaveDialog;
    printdlg: TPrintDialog;
    BitBtn2: TBitBtn;
    memResult: TRichEdit;
    qryHstParcelamentoPARCELA: TFloatField;
    Label11: TLabel;
    edsitparcelamento: TEdit;
    pnlQuitacao: TPanel;
    Label17: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    eSdoDevedorQuitar: TRealEdit;
    GroupBox3: TGroupBox;
    cmbMeQuitacao: TComboBox;
    spAnoQuitacao: TSpinEdit;
    rValorAmortiza: TRealEdit;
    qryContribRefinanc: TwwQuery;
    qrycontribrefinancFLGSELECIONADO: TFloatField;
    StringField34: TStringField;
    StringField35: TStringField;
    FloatField45: TFloatField;
    FloatField46: TFloatField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    DateTimeField9: TDateTimeField;
    StringField39: TStringField;
    FloatField47: TFloatField;
    DateTimeField10: TDateTimeField;
    DateTimeField11: TDateTimeField;
    FloatField48: TFloatField;
    StringField40: TStringField;
    DateTimeField12: TDateTimeField;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    StringField45: TStringField;
    StringField46: TStringField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    FloatField58: TFloatField;
    FloatField59: TFloatField;
    FloatField60: TFloatField;
    FloatField61: TFloatField;
    FloatField62: TFloatField;
    FloatField63: TFloatField;
    DateTimeField13: TDateTimeField;
    DateTimeField14: TDateTimeField;
    StringField47: TStringField;
    FloatField64: TFloatField;
    FloatField65: TFloatField;
    StringField48: TStringField;
    StringField49: TStringField;
    FloatField66: TFloatField;
    FloatField67: TFloatField;
    FloatField68: TFloatField;
    FloatField69: TFloatField;
    StringField50: TStringField;
    StringField51: TStringField;
    FloatField70: TFloatField;
    DateTimeField15: TDateTimeField;
    FloatField71: TFloatField;
    FloatField72: TFloatField;
    StringField52: TStringField;
    FloatField73: TFloatField;
    FloatField74: TFloatField;
    StringField53: TStringField;
    StringField54: TStringField;
    StringField55: TStringField;
    FloatField75: TFloatField;
    StringField56: TStringField;
    FloatField76: TFloatField;
    FloatField77: TFloatField;
    StringField57: TStringField;
    FloatField78: TFloatField;
    StringField58: TStringField;
    StringField59: TStringField;
    StringField60: TStringField;
    FloatField79: TFloatField;
    FloatField80: TFloatField;
    FloatField81: TFloatField;
    StringField61: TStringField;
    StringField62: TStringField;
    FloatField82: TFloatField;
    FloatField83: TFloatField;
    DateTimeField16: TDateTimeField;
    FloatField84: TFloatField;
    StringField63: TStringField;
    StringField64: TStringField;
    FloatField85: TFloatField;
    StringField65: TStringField;
    FloatField86: TFloatField;
    StringField66: TStringField;
    FloatField87: TFloatField;
    pnlgrids: TPanel;
    dbgrdContribuicao: TwwDBGrid;
    dbgrdContribRefinanc: TwwDBGrid;
    UpdOpcoes: TUpdateSQL;
    Label18: TLabel;
    DBRealEdit1: TDBRealEdit;
    qryContribuicaoJUROS: TFloatField;
    qryContribuicaoMULTA: TFloatField;
    qryContribuicaoCORRECAO: TFloatField;
    tbCpCarencia: TTabSheet;
    Panel5: TPanel;
    Label19: TLabel;
    Label22: TLabel;
    redSalAtual: TDBRealEdit;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Label20: TLabel;
    spCarencia: TSpinEdit;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    GroupBox4: TGroupBox;
    cmbMesCobCarencia: TComboBox;
    spedAnoCobCarencia: TSpinEdit;
    dsopcoescontrib: TwwDataSource;
    qryopcoescontrib: TwwQuery;
    dstitular: TwwDataSource;
    edCarenciaMeses: TEdit;
    edTotalCarencia: TRealEdit;
    edParticipante: TRealEdit;
    edPatrocinadora: TRealEdit;
    qrycontribuicaocarencia: TwwQuery;
    qrycontribuicaocarenciaFLGSELECIONADO: TFloatField;
    qrycontribuicaocarenciaNODOCUMENTO: TFloatField;
    qrycontribuicaocarenciaNOSSONUMERO: TStringField;
    qrycontribuicaocarenciaNOMERESUM: TStringField;
    qrycontribuicaocarenciaNOME: TStringField;
    qrycontribuicaocarenciaMESREFERENCIA: TStringField;
    qrycontribuicaocarenciaMESCOBRANCA: TStringField;
    qrycontribuicaocarenciaDATAPREVISAORECE: TDateTimeField;
    qrycontribuicaocarenciaVALORESPERADO: TFloatField;
    qrycontribuicaocarenciaVALORRECEBIDO: TFloatField;
    qrycontribuicaocarenciaSITRECEBIMENTO: TStringField;
    qrycontribuicaocarenciaIDLOTE: TFloatField;
    qrycontribuicaocarenciaNUMRECEBIMENTO: TFloatField;
    qrycontribuicaocarenciaFLGDEVOLUCAO: TFloatField;
    qrycontribuicaocarenciaIDMOTIVO: TFloatField;
    qrycontribuicaocarenciaDATARECEBIMENTO: TDateTimeField;
    qrycontribuicaocarenciaVALOROP1: TFloatField;
    qrycontribuicaocarenciaVALOROP2: TFloatField;
    qrycontribuicaocarenciaVALOROP3: TFloatField;
    qrycontribuicaocarenciaCODDOCUMENTOPREV: TFloatField;
    qrycontribuicaocarenciaVALORCALCULADO: TFloatField;
    qrycontribuicaocarenciaFLGDESCFOLHA: TFloatField;
    qrycontribuicaocarenciaIDCONTRIBUICAO: TFloatField;
    qrycontribuicaocarenciaIDPESSJUR: TFloatField;
    qrycontribuicaocarenciaIDPLANOPREV: TFloatField;
    qrycontribuicaocarenciaIDPESSOA: TFloatField;
    qrycontribuicaocarenciaSEQPROPOSTA: TFloatField;
    qrycontribuicaocarenciaDATAINICIO: TDateTimeField;
    qrycontribuicaocarenciaDATAFINAL: TDateTimeField;
    qrycontribuicaocarenciaFLGSITFUNDACAO: TStringField;
    qrycontribuicaocarenciaFLGEVENTO: TFloatField;
    qrycontribuicaocarenciaDATACANCELAMENTO: TDateTimeField;
    qrycontribuicaocarenciaDATAEMISSCOB: TDateTimeField;
    qrycontribuicaocarenciaFLGCALCRESERVA: TFloatField;
    qrycontribuicaocarenciaMATRICULA: TStringField;
    qrycontribuicaocarenciaFLGPAGADOR: TStringField;
    qrycontribuicaocarenciaCODCENTROCUSTOC: TStringField;
    qrycontribuicaocarenciaCODCENTROCUSTOD: TStringField;
    qrycontribuicaocarenciaINSCRICAONUMERO: TFloatField;
    qrycontribuicaocarenciaFLGDESCFOLHA_1: TFloatField;
    qrycontribuicaocarenciaDIAVENCIMENTO: TFloatField;
    qrycontribuicaocarenciaCODTIPRECDES: TStringField;
    qrycontribuicaocarenciaPLANO: TFloatField;
    qrycontribuicaocarenciaPLACONTAC: TStringField;
    qrycontribuicaocarenciaPLACONTAD: TStringField;
    qrycontribuicaocarenciaNOMECONTRIB: TStringField;
    qrycontribuicaocarenciaCODSUBCONTA: TFloatField;
    qrycontribuicaocarenciaCODCENTRORESPON: TStringField;
    qrycontribuicaocarenciaSALMANTIDO: TFloatField;
    qrycontribuicaocarenciaUNIDNEGOC: TFloatField;
    qrycontribuicaocarenciaIDEMPRESA: TFloatField;
    qrycontribuicaocarenciaPLANO_1: TFloatField;
    qrycontribuicaocarenciaDATAINICIO_1: TDateTimeField;
    qrycontribuicaocarenciaTIPCODIGO: TStringField;
    qrycontribuicaocarenciaCODTIPDOC: TFloatField;
    qrycontribuicaocarenciaCODPORTFORMA: TFloatField;
    qrycontribuicaocarenciaPLANO13: TFloatField;
    qrycontribuicaocarenciaPLACONTAC13: TStringField;
    qrycontribuicaocarenciaPLACONTAD13: TStringField;
    qrycontribuicaocarenciaCODCENTROCUSTOC13: TStringField;
    qrycontribuicaocarenciaIDEMPRESA13: TFloatField;
    qrycontribuicaocarenciaCODCENTROCUSTOD13: TStringField;
    qrycontribuicaocarenciaUNIDNEGOC13: TFloatField;
    qrycontribuicaocarenciaIDEMPRESAPROP13: TFloatField;
    qrycontribuicaocarenciaCODCENTRORESPON13: TStringField;
    qrycontribuicaocarenciaCODSUBCONTA13: TFloatField;
    qrycontribuicaocarenciaRECPAG13: TStringField;
    qrycontribuicaocarenciaCODTIPRECDES13: TStringField;
    qrycontribuicaocarenciaTIPCODIGO13: TStringField;
    qrycontribuicaocarenciaCODTIPDOC13: TFloatField;
    qrycontribuicaocarenciaCODPORTFORMA13: TFloatField;
    qrycontribuicaocarenciaIDPLANPREVCONTAB: TFloatField;
    qrycontribuicaocarenciaPLACONTADBANCO: TStringField;
    qrycontribuicaocarenciaPLACONTADBANCO13: TStringField;
    qrycontribuicaocarenciaCODTIPDESEMBDEVOL: TStringField;
    qrycontribuicaocarenciaCODCCUSTODEVOL: TStringField;
    qrycontribuicaocarenciaPLACONTADEVOL: TStringField;
    qrycontribuicaocarenciaSALMANTIDO_1: TFloatField;
    qrycontribuicaocarenciaFLGDEVOLUCAO_1: TFloatField;
    qrycontribuicaocarenciaDATAINICIO_2: TDateTimeField;
    qrycontribuicaocarenciaNOMESITUACAO: TStringField;
    qrycontribuicaocarenciaIDREGRACALCULO: TFloatField;
    qrycontribuicaocarenciaFLGINTERNO: TStringField;
    qrycontribuicaocarenciaFLGPARCELAMENTO: TFloatField;
    Label26: TLabel;
    qrycontribuicaocarenciaCORRECAO: TCurrencyField;
    qrycontribuicaocarenciaJUROS: TCurrencyField;
    qrycontribuicaocarenciaMULTA: TCurrencyField;
    qrycontribuicaocarenciaTIPOPGMTO: TStringField;
    updContribuicaoCarencia: TUpdateSQL;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox6: TGroupBox;
    redIntervalo: TRealEdit;
    qryopcoesSEGURO: TStringField;
    redPercSeguro: TRealEdit;
    Label27: TLabel;
    Label28: TLabel;
    redPremio: TRealEdit;
    Label29: TLabel;
    redpercentseguro: TDBRealEdit;
    Label30: TLabel;
    Label31: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    grdOpContrib: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;    
    Label32: TLabel;
    DBRealEdit2: TDBRealEdit;
    qryHstParcelamentoPERCSEGURO: TFloatField;
    qryHstParcelamentoPERCENTUAL: TFloatField;
    qrycontribuicaocarenciaCOBRAALTERADORES: TFloatField;
    qryContribuicaoCOBRAALTERADORES: TFloatField;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1PriorPage: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1NextPage: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    qryContribRefinancCOBRAALTERADORES: TFloatField;
    qryContribRefinancCORRECAO: TFloatField;
    qryContribRefinancJUROS: TFloatField;
    qryContribRefinancMULTA: TFloatField;
    updContribRefinanc: TUpdateSQL;
    pmnuFiltro: TPopupMenu;
    pmmVisualisaDivergTratadas: TMenuItem;
    btnAltera: TBitBtn;
    updParcelamento: TUpdateSQL;
    btnConfirma: TSpeedButton;
    QryAtualiza: TwwQuery;
    dsCpCarencia: TwwDataSource;
    qryCpCarencia: TwwQuery;
    qryCpCarenciaTRGDTINCLUSAO: TDateTimeField;
    qryCpCarenciaNUMPARCELAS: TFloatField;
    qryCpCarenciaPARCPAGAS: TFloatField;
    qryCpCarenciaPARCGERADAS: TFloatField;
    qryCpCarenciaVLRPRIMPRESTACAO: TFloatField;
    qryCpCarenciaPERCENTUAL: TFloatField;
    qryCpCarenciaVLRSALBASE: TFloatField;
    qryCpCarenciaSITPARCELAMENTO: TFloatField;
    qryCpCarenciaDATAINICIO: TDateTimeField;
    qryCpCarenciaDATACANCELAMENTO: TDateTimeField;
    qryCpCarenciaMOTIVOCANCEL: TStringField;
    qryCpCarenciaVLRDIVIDAPART: TFloatField;
    qryCpCarenciaVLRDIVIDAPATRO: TFloatField;
    qryCpCarenciaTPCOMPRACARENCIA: TFloatField;
    qryCpCarenciaPERCSEGURO: TFloatField;
    qryCpCarenciaFLG: TStringField;
    UpdCpCarencia: TUpdateSQL;
    qryCpCarenciaIDPARCELAMENTO: TFloatField;
    qryCpCarenciaSOMA_DIVIDAPATROXPART: TFloatField;
    procedure sbtnProcParticipClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnSalariosClick(Sender: TObject);
    procedure sbtnTitularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure qryContribuicaoCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelaClick(Sender: TObject);
    procedure qryParcelamentoAfterScroll(DataSet: TDataSet);
    procedure rSalBaseBtnClick(Sender: TObject);
    procedure rTotDividaBtnClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure btnAnterioropcaoClick(Sender: TObject);
    procedure btncancelaopcaoClick(Sender: TObject);
    procedure btncalclaprestacaoClick(Sender: TObject);
    procedure qryContribuicaoAfterScroll(DataSet: TDataSet);
    procedure qryopcoesAfterScroll(DataSet: TDataSet);
    procedure btncartaopcoesClick(Sender: TObject);
    procedure btncancelardemonsClick(Sender: TObject);
    procedure btnAntDemonsClick(Sender: TObject);
    procedure pgctrlCobrancasChange(Sender: TObject);
    procedure dbgrdContribuicaoEnter(Sender: TObject);
    procedure btnSairParamExit(Sender: TObject);
    procedure qryParcelamentoAfterOpen(DataSet: TDataSet);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAmortizarClick(Sender: TObject);
    procedure BtnEncerraClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure btnCancelarCancelClick(Sender: TObject);
    procedure cmbSitParcelamentoChange(Sender: TObject);
    procedure btnQuitarClick(Sender: TObject);
    procedure btnRefinanciarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnAmortizaClick(Sender: TObject);
    procedure btnCancelaAmortizaClick(Sender: TObject);
    procedure qryContribRefinancCalcFields(DataSet: TDataSet);
    procedure spnumpacelasChange(Sender: TObject);
    procedure spnumpacelasClick(Sender: TObject);
    procedure spCarenciaChange(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure qrycontribuicaocarenciaAfterScroll(DataSet: TDataSet);
    procedure qrycontribuicaocarenciaCalcFields(DataSet: TDataSet);
    procedure SpeedBtton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure pmmVisualisaDivergTratadasClick(Sender: TObject);
    procedure btnSairParamClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure DBRealEdit1Exit(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure edtotdividapartExit(Sender: TObject);
    procedure edtotdividapatroExit(Sender: TObject);
    procedure rSalBaseExit(Sender: TObject);



  private
    { Private declarations }
    sTipOperEnvio : String;

    sFlgDescFolha, sNumParcelas, sSeguro,
    sVlrPrimPrestacao, sPercentual,
    sVlrBase,  sVlrDiviaPart, sVlrDividaPatro,
    sSdoDevedor, sNumRecebimento, sNumRecebAlter : String;
    sIdparcelas   : string;
    iCalculoRegra : longint;

    iIdParcelamento : longint;

    procedure LimpaTela;
    function  CalculaSalario( qryAux : TwwQuery;
                              sIdRegra : String;
                              piIdPessJur,   piIdPlanoPrev,
                              piIdPessoa ,   piSeqProposta : longint ) : double;

    function  CalculaDivida( qryAux : TwwQuery;
                             sIdRegra, sNumRecebimento : String;
                             piIdPessJur,   piIdPlanoPrev,
                             piIdPessoa ,   piSeqProposta : longint;
                             var dTotPart, dTotPatro : Double;
                             var iIdCalculo : LongInt ) : double;

    function  CalculaOpcoes( qryAux : TwwQuery;
                             sIdRegra  : String;
                             piIdPessJur,   piIdPlanoPrev,
                             piIdPessoa ,   piSeqProposta : longint ) : longint;

    function  AssociarContribuicoes(qryaux : twwquery) : Boolean;

    function  AssociarContribuicoesCarencia(qryaux : twwquery) : Boolean;

    function  DesfazassociacaoContribCarencia(qryaux : twwquery) : Boolean; // XAVIER

    procedure MostraDemonstrativo;

    function  SetIdParcelamento : Boolean;

    function  DesfazSetIdParcelCarencia(qryaux : twwquery) : Boolean; // XAVIER

    function  Desfazhistoricocontrib(qryaux : twwquery) : Boolean; // XAVIER

    function  CalculaSdoDevedor( qryAux : TwwQuery;
                                 sIdRegra, sSalario, sPercentual : String;
                                 piIdPessJur,   piIdPlanoPrev,
                                 piIdPessoa ,   piSeqProposta : longint ;
                                 sParcelasaPagar : String  ) : double;

    function VoltaNumParcelasAPagar( qryAux : TwwQuery;
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint ;
                                sIdParcelamento : String ;
                                iNumParcelas : Integer ) : String;


    function VoltaNumParcelasEnviadas( qryAux : TwwQuery;
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint   ) : integer;

    function Desfazer( qryAux : TwwQuery;
                       piIdParcelamento,
                       piIdPessJur,   piIdPlanoPrev,
                       piIdPessoa ,   piSeqProposta : longint;
                       var sMsgErro : String   ) : Boolean;

    function Cancelar( qryAux : TwwQuery;
                       piIdParcelamento,
                       piIdPessJur,   piIdPlanoPrev,
                       piIdPessoa ,   piSeqProposta : longint;
                       sMotivo : String;
                       var sMsgErro : String   ) : Boolean;


    function AtualizaSitRecebimento( qryAux : TwwQuery;
                                     piIdPessJur,   piIdPlanoPrev,
                                     piIdPessoa ,   piSeqProposta : longint;
                                     sNumReceb : String   ) : Boolean;

    procedure HabilitaBotoes(bHabilita : Boolean);


    function AtualizaDadosQuitaRefinancAmort( qryAux : TwwQuery;
                            piIdParcelamento,
                            piIdPessJur,   piIdPlanoPrev,
                            piIdPessoa ,   piSeqProposta : longint;
                            var sMsgErro : String   ) : Boolean;

    function CalculaValorAmortiza( qryAux : TwwQuery;
                                   sIdRegra, sNumParcelaAmortiza : String;
                                   piIdPessJur,   piIdPlanoPrev,
                                   piIdPessoa ,   piSeqProposta : longint ) : double;


    function AtualizaIdParcelamento( qryAux : TwwQuery;
                                     piIdPessJur,   piIdPlanoPrev,
                                     piIdPessoa ,   piSeqProposta : longint   ) : Boolean;

    function VoltaSitRecebimento( qryAux : TwwQuery;
                                  piIdPessJur,   piIdPlanoPrev,
                                  piIdPessoa ,   piSeqProposta,
                                  piIdParcelamento : longint   ) : Boolean;

    function CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;


    function CalculaTpCarencia( qryAux : TwwQuery;
                                sIdRegra: String;
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint) : double;


    function CalculaCarenciaPatro( qryAux : TwwQuery;
                                sIdRegra: String;
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint;
                                sValorbase1Part,sValorbase2Part, sValorbase3Part,
                                sValorbase1Patro, sValorbase2Patro, sValorbase3Patro : String) : double;


    function CalculaCarenciaPart( qryAux : TwwQuery;
                                sIdRegra: String;
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint;
                                sValorbase1Part,sValorbase2Part, sValorbase3Part,
                                sValorbase1Patro, sValorbase2Patro, sValorbase3Patro : String) : double;


    function CalculaTotalCarencia( qryAux : TwwQuery;
                                sIdRegra: String;
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint) : double;

    function CalcContribuicoesCarencia(qryaux : twwquery) : Boolean;


    function SetIdParcelamentoCarencia : Boolean;



  public
    sValorReserva : String;
    OpcaoCorrente : tOpProc;
    iIdCalculoDivida : LongInt;
    iNumParcelasGeradas : Integer;// Renato Visoni SOL 40370 Kintana 525322


    Procedure PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt; bLimpaTela : Boolean = true);

    function TrazDadosParcela( qryaux          : Twwquery;
                               sIdPessjur      : string;
                               sIdPlanoPrev    : string;
                               sIdPessoa       : string;
                           var sIdParcelamento : string;
                           var sPercentual     : string;
                           var sVlrDividaPart  : string;
                           var sVlrDividaPatro : string;
                           var sVlrPrestacao   : string;
                           var sVlrSdoDevedor  : string;
                           var sSalBaseAtual  : string;
                           var iNumProxParc : Integer) : boolean;
   { Public declarations }
  end;

var
  bCompraCarencia, bParcelaCarencia : Boolean;
  bVeioDeEvento  : Boolean = False;
  frmParcelamento: TfrmParcelamento;


  function AtualizaRecebeParcela(qryaux : Twwquery;
                                 sMescob, sIdPessjur , sIdPlanoPrev  : String ) : Boolean;

implementation

uses FAguarde, UParticipante, FTelaAut, UMensErro,
     DBaseDados, UContribuicaoPrev, UAdmPrev, DAPrev,
     UMovReserva, USistema, UFuncoesUteis, DRelatorios,
     FCadContribParticipante, uDataBase  ;

{$R *.DFM}
procedure TfrmParcelamento.LimpaTela;
begin
   if bCompraCarencia then
   pgctrlCobrancas.ActivePage := tbcpcarencia
   else pgctrlCobrancas.ActivePage := tbsGrid;

   memTitular.Lines.Clear;
end; // LimpaTela

procedure TfrmParcelamento.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt; bLimpaTela : Boolean = true);
var sMsgErro  : string;
    bOk       : boolean;
begin
  qryTitular.Close;
  qryTitular.ParamByName('IdPessoa').Value   := piIdTitular;
  qryTitular.ParamByName('IdPessJur').Value   := piIdPessJur;
  qryTitular.ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
  qryTitular.ParamByName('SeqProposta').Value := piSeqProposta;
  qryTitular.Open;

  with qryContaBancaria do
  begin
     Close;
     ParamByName('IdPessoa').Value := piIdTitular;
     Open;
  end;

  memTitular.Lines.Clear;
  if qryTitular.IsEmpty
  then begin
     memTitular.Lines.Add(' Dados do Participante não encontrados. ');
     Exit;
  end;

  sValorReserva := CalcReservaPart( piIdPessJur, piIdPlanoPrev, piIdTitular, -1,
                                    
                                    piSeqProposta ,                                     
                                    FormatDateTime('dd/mm/yyyy', Date),
                                    FormatDateTime('dd/mm/yyyy', Date),
                                    '','',
                                    '-1' , qryAux);

  // Dados Pessoais
  memTitular.Lines.Add('Participante : '+qryTitular.FieldByName('Nome').AsString);
  memTitular.Lines.Add('------------------------------------------------------------');
  memTitular.Lines.Add('Data de Nascimento : '+qryTitular.FieldByName('DataNasc').AsString);
  memTitular.Lines.Add('Data do Falecimento : '+qryTitular.FieldByName('DataMorte').AsString);

  // Conta Bancaria
  memTitular.Lines.Add('Conta Bancária Preferencial : ');
  memTitular.Lines.Add('------------------------------------------------------------');
  if not qryContaBancaria.IsEmpty
  then begin
     memTitular.Lines.Add('Banco    : '+qryContaBancaria.FieldByName('Banco').AsString);
     memTitular.Lines.Add('Agência  : '+qryContaBancaria.FieldByName('Agencia').AsString);
     memTitular.Lines.Add('Conta Nº : '+qryContaBancaria.FieldByName('ContaCorrente').AsString);
  end
  else begin
     memTitular.Lines.Add(' < não cadastrada até o momento > ');
  end;

  // Dados na Patrocinadora
  memTitular.Lines.Add('  ');
  memTitular.Lines.Add('Patrocinadora  : '  +qryTitular.FieldByName('NomePatro').AsString);
  memTitular.Lines.Add('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString);
  memTitular.Lines.Add('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString);
  memTitular.Lines.Add('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString);

  memTitular.Lines.Add('Tempo de Serviço Total Informado : '+OraNumero(qryTitular.FieldByName('TempoServTotal').AsString)+' anos '+
                                                             OraNumero(qryTitular.FieldByName('TempoServTotMes').AsString)+' meses '+
                                                             OraNumero(qryTitular.FieldByName('TempoServTotDia').AsString)+' dias ' );

  memTitular.Lines.Add('Tempo de Serviço Anterior à Admissão : '+FormatFloat('#0.00',qryTitular.FieldByName('TempoServAnterior').AsFloat));
  memTitular.Lines.Add('Tempo de Serviço Não Creditado : '      +FormatFloat('#0.00',qryTitular.FieldByName('TempoNaoCreditado').AsFloat));
  memTitular.Lines.Add('Tempo em Situação Especial (risco) : ' +FormatFloat('#0.00',qryTitular.FieldByName('TempoSitEspecial').AsFloat));
  memTitular.Lines.Add('Nível Salarial : '+qryTitular.FieldByName('Nivel').AsString);
  memTitular.Lines.Add('Salário de Participação : '+qryTitular.FieldByName('SALPARTICIPACAO').AsString);


  // Dados no Plano
  memTitular.Lines.Add('  ');
  memTitular.Lines.Add('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString);
  memTitular.Lines.Add('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString);
  memTitular.Lines.Add('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString);

  // Valor da Reserva
  memTitular.Lines.Add('Reserva Total (R$)   : '+sValorReserva);

  // Situacoes
  memTitular.Lines.Add('Situação na Patrocinadora  : '+qryTitular.FieldByName('NomeSitFunc').AsString);
  memTitular.Lines.Add('Situaçao na Fundação       : '+qryTitular.FieldByName('NomeSitPart').AsString);
  memTitular.Lines.Add('Situação no Plano          : '+qryTitular.FieldByName('NomeSitPlano').AsString);

  // Dividas
  if qryTitular.FieldByName('FLGDEVEPREVIDENC').AsInteger = 1
  then memTitular.Lines.Add('Possui dívida Previdenciária  : Sim ')
  else memTitular.Lines.Add('Possui dívida Previdenciária  : Não ');

  if qryTitular.FieldByName('FLGDEVEASSISTENC').AsInteger = 1
  then memTitular.Lines.Add('Possui dívida Assistencial  : Sim ')
  else memTitular.Lines.Add('Possui dívida Assistencial  : Não ');

  if qryTitular.FieldByName('FlgDeveEmprestimo').AsInteger = 1
  then memTitular.Lines.Add('Possui dívida de Empréstimo  : Sim ')
  else memTitular.Lines.Add('Possui dívida de Empréstimo  : Não ');


  if bCompraCarencia then
  begin

     //spCarencia.enabled := false; // Renato Visoni SOL 132620 Kintana 769854
     spCarencia.enabled := True;  // Renato Visoni SOL 132620 Kintana 769854

     tbsGrid.TabVisible := false;
     tbsGrid.enabled := false;
     tbcpcarencia.TabVisible := true;
     tbcpcarencia.enabled := True;
     pgctrlCobrancas.ActivePage := tbcpcarencia;


//     lblminimo.caption := 'Mínimo: '+floattostr(prmPercMinDesc);
//     lblmaximo.caption := 'Máximo: '+floattostr(prmPercMaxDesc);


     qryopcoescontrib.Close;
     qryopcoescontrib.ParamByName('IdPessoa').Value   := piIdTitular;
     qryopcoescontrib.ParamByName('IdPessJur').Value   := piIdPessJur;
     qryopcoescontrib.ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
     qryopcoescontrib.ParamByName('SeqProposta').Value := piSeqProposta;
     qryopcoescontrib.Open;

     if trim(qrytitular.fieldbyname('IDREGRACARENCIA').AsString) = '' then
     begin
        MsgDlg('Regra de cálculo de tempo de carência não associada. Verificar cadastro.','Erro',mtError,[mbOk],0);
        qryTitular.close;
        memtitular.lines.clear;
        qryopcoescontrib.close;
        sbtnProcParticipClick(self);
        exit;
     end
     else    edCarenciaMeses.Text :=  FloatToStr(CalculaTpCarencia( qryAux,
                              qrytitular.fieldbyname('IDREGRACARENCIA').AsString,
                              qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                              qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                              qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                              qrytitular.fieldbyname('SEQPROPOSTA').AsInteger));


     qryparcelamento.close;
     qryParcelamento.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
     qryParcelamento.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
     qryParcelamento.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
     qryparcelamento.open;


     qryCpCarencia.close;
     qryCpCarencia.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
     qryCpCarencia.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
     qryCpCarencia.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
     qryCpCarencia.open;

     // Renato Visoni SOL 132620 Kintana 769854
     try
       if trunc(strTofloat(edCarenciaMeses.Text)) <= 0 then begin
          MsgDlg('Não existe carência restante para este participante.','Aviso',mtWarning,[mbOk],0);
          qryTitular.close;
          memtitular.lines.clear;
          qryopcoescontrib.close;
          sbtnProcParticipClick(self);
          exit;
       end;
     except
        exit;
     end;
     // Renato Visoni SOL 132620 Kintana 769854

     spCarencia.enabled := true;
     spCarencia.MinValue := 0;
     spCarencia.MaxValue := trunc(strTofloat(edCarenciaMeses.Text));// Renato Visoni SOL 132620 Kintana 769854
     spCarencia.Value    :=  trunc(strTofloat(edCarenciaMeses.Text));// Renato Visoni SOL 132620 Kintana 769854

  end
  else
  begin
     tbcpcarencia.TabVisible := false;
     tbcpcarencia.enabled := false;
     tbsGrid.TabVisible := true;
     tbsGrid.enabled := True;
     pgctrlCobrancas.ActivePage := tbsGrid;

     frmAguarde.Mostra('Atualizando contribuições ...');

     dsContribuicao.DataSet := qrycontribuicao;
     qryContribuicao.Close;
     qryContribuicao.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
     qryContribuicao.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
     qryContribuicao.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
     qryContribuicao.Open;
     qryContribuicao.EnableControls;

     if qrycontribuicao.isempty then
       qryContribuicao.DisableControls;

     qryContribuicaoFLGSELECIONADO.visible := True;

     if qryContribuicao.isempty then
       BtnProximo.Enabled := false;

     frmAguarde.Apaga;

     qryParcelamento.Close;
     qryParcelamento.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
     qryParcelamento.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
     qryParcelamento.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
     qryParcelamento.Open;

     if not qryParcelamento.isempty then
     begin
        tbFinanc.TabVisible := true;
        pgctrlCobrancas.ActivePage := tbFinanc;
     end;
  end;


  if bLimpaTela then begin //Renato Visoni SOL 40370 Kintana 525322
    tbDemons.TabVisible := false;
    tbFinanc.TabVisible := false;
    tbOpcoes.TabVisible := false;
  end;


end; //PreencheDadosTitular

procedure TfrmParcelamento.sbtnProcParticipClick(Sender: TObject);
var lIdPessoa, lIdPessJur, lIdPlanoPrev, liSeqProposta : longint;
    bExisteParcAtivo : Boolean;
begin
  inherited;
  iIdCalculoDivida := 0;

  { Somente se não vier de Evento }
  If bVeioDeEvento = False Then Begin
    if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.Rollback;
  End;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     lIdPessoa    := StrToInt(MontaSelectPart.ValoresChave[0]);
     lIdPessJur   := StrToInt(MontaSelectPart.ValoresChave[1]);
     lIdPlanoPrev := StrToInt(MontaSelectPart.ValoresChave[2]);
     liSeqProposta := StrToInt(MontaSelectPart.ValoresChave[16]);
     PreencheDadosTitular(lIdPessoa, lIdPessJur, lIdPlanoPrev, liSeqProposta);
     tbcpcarencia.enabled := true;
     tbsGrid.enabled := true;

  end
  else begin
     lIdPessoa := -1;
     lIdPessJur := -1;
     lIdPlanoPrev := -1;
     liSeqProposta := -2;
     LimpaTela;
     tbcpcarencia.enabled := false;
     tbsGrid.enabled := false;
     exit;
     close;
  end;

  if bCompraCarencia then
  begin
     tbcpcarencia.TabVisible := True;
     tbsGrid.TabVisible := false;
     pgctrlCobrancas.ActivePage := tbcpcarencia;
  end
  else
  begin
     if qryparcelamento.isempty then
     begin
        tbsGrid.TabVisible := true;
        tbsGrid.Enabled := true;
        pgctrlCobrancas.ActivePage := tbsGrid;
        tbcpcarencia.TabVisible := false;
        tbcpcarencia.enabled := true;
        rTotDivida.enabled := true;
        rSalBase.enabled := true;
        redPercSeguro.enabled := true;
     end
     else
     begin

        //verficar se existe parcelamento ativo
        bExisteParcAtivo := false;
        while not qryparcelamento.eof do
        begin
           if (qryparcelamento.fieldbyname('SITPARCELAMENTO').AsInteger = 1) then
           begin
              bExisteParcAtivo := true;
           end;
           qryparcelamento.next;
        end;
        qryparcelamento.first;


        tbFinanc.TabVisible := true;
        tbsGrid.TabVisible := false;
        pgctrlCobrancas.ActivePage := tbFinanc;


        if not bExisteParcAtivo then
        begin
           if MsgDlg('Não existem parcelamentos ativos para este participante. Deseja iniciar um novo parcelamento? '+
                     '(Caso a opção NÃO seja escolhida, a consulta de parcelamentos inativos será disponibilizada.)',
                     'Aviso',mtInformation,[mbYes, mbNo],0) = mrYes then
           begin
              tbFinanc.TabVisible := false;           
              tbsGrid.TabVisible := true;
              tbsGrid.Enabled := true;
              pgctrlCobrancas.ActivePage := tbsGrid;
              tbcpcarencia.TabVisible := false;
              tbcpcarencia.enabled := true;
              rTotDivida.enabled := true;
              rSalBase.enabled := true;
              redPercSeguro.enabled := true;
           end;
        end;

     end;
  end;


  if not bCompraCarencia then
  begin
     qryaux.close;
     qryaux.sql.text := ' SELECT 1 FROM HSTCONTRIBPREV HST, CONTRIBPREVPARTP CPP '+
                        ' WHERE HST.IDPESSOA =  '+qrytitular.fieldbyname('IDPESSOA').AsString+' '+
                        ' AND HST.IDPESSJUR = '+qrytitular.fieldbyname('IDPESSJUR').AsString+' '+
                        ' AND HST.IDPLANOPREV = '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' '+
                        ' AND HST.SITRECEBIMENTO <> 7 '+ //não está parcelado
                        ' AND NVL(HST.VALORRECEBIDO,0) = 0 '+
                        ' AND EXISTS (SELECT 1 FROM CONTPREV CT  '+
                        '             WHERE CT.IDPLANOPREV = HST.IDPLANOPREV AND '+
                        '             CT.IDCONTRIBUICAO = HST.IDCONTRIBUICAO AND '+
                        '             FLGCARENCIA = 1 ) '+
                        ' AND CPP.IDPESSJUR = HST.IDPESSJUR '+
                        ' AND CPP.IDPESSOA = HST.IDPESSOA '+
                        ' AND CPP.IDPLANOPREV = HST.IDPLANOPREV '+
                        ' AND CPP.SEQPROPOSTA = HST.SEQPROPOSTA '+
                        ' AND CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO ';
     qryaux.open;


     if not qryaux.isempty then
     begin
        if MsgDlg('Existe uma compra de carência não parcelada. Deseja faze-lo agora?',
                  'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
        then
        begin
           qryaux.close;
           qryaux.sql.text := ' SELECT IDPARCELAMENTO,  VLRDIVIDAPART ,   VLRDIVIDAPATRO , '+
                              ' SDODEVEDOR, TPCOMPRACARENCIA '+
                              ' FROM PARCELAMENTO '+
                              ' WHERE IDPESSOA =  '+qrytitular.fieldbyname('IDPESSOA').AsString+' '+
                              ' AND IDPESSJUR = '+qrytitular.fieldbyname('IDPESSJUR').AsString+' '+
                              ' AND IDPLANOPREV = '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' '+
                              ' AND DATAINICIO IS NULL '+
                              ' AND TPCOMPRACARENCIA IS NOT NULL ';
           qryaux.open;


           bParcelaCarencia := true;

           dsContribuicao.DataSet := qrycontribuicaocarencia;
           qrycontribuicaocarencia.Close;
           qrycontribuicaocarencia.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
           qrycontribuicaocarencia.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
           qrycontribuicaocarencia.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
           qrycontribuicaocarencia.Open;
           qrycontribuicaocarencia.EnableControls;
           if qrycontribuicaocarencia.isempty then qrycontribuicaocarencia.DisableControls;
           qryContribuicaocarenciaFLGSELECIONADO.visible := True;

           if qrycontribuicaocarencia.isempty then
           BtnProximo.Enabled := false;

           tbsGrid.TabVisible := true;
           tbsGrid.enabled := true;
           tbcpcarencia.TabVisible := false;
           tbcpcarencia.enabled := false;
           pgctrlCobrancas.ActivePage := tbsGrid;
           stxttitulo.caption := 'Financiamento do Participante';

           edtotdividapart.text :=  qryaux.fieldByName('VLRDIVIDAPART').AsString;
           edtotdividapatro.text := qryaux.fieldByName('VLRDIVIDAPATRO').AsString;

        end
        else
        begin
           tbsGrid.TabVisible := true;
           tbsGrid.enabled := true;
           tbcpcarencia.TabVisible := false;
           tbcpcarencia.enabled := false;
           pgctrlCobrancas.ActivePage := tbsGrid;
           stxttitulo.caption := 'Financiamento do Participante';
        end;

     end;
  end;


end;

procedure TfrmParcelamento.FormCreate(Sender: TObject);
var sAnoMes : String;
begin
  inherited;
 //Henrique Massão
  saveDlg.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  if bCompraCarencia then
  begin
     stxttitulo.caption := 'Compra de Carência';
     pgctrlCobrancas.ActivePage := tbCpCarencia;
     tbDemons.TabVisible := false;
     tbFinanc.TabVisible := false;
     tbOpcoes.TabVisible := false;
     tbsGrid.TabVisible := false;
     tbsGrid.enabled := false;
     tbCpCarencia.TabVisible := True;
     tbCpCarencia.enabled := true;
     HelpContext := 160064;
  end
  else
  begin
     stxttitulo.caption := 'Financiamento do Participante';
     pgctrlCobrancas.ActivePage := tbsGrid;
     tbDemons.TabVisible := false;
     tbFinanc.TabVisible := false;
     tbOpcoes.TabVisible := false;
     tbsGrid.TabVisible := True;
     tbsGrid.enabled := true;
     tbCpCarencia.TabVisible := false;
     tbCpCarencia.enabled := false;
     HelpContext := 160063;
  end;

  sAnoMes:= Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +
            Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);               

  if StrToInt(Copy(sAnoMes,6,2)) = 12 then
  begin
     cmbMesCob.ItemIndex := 0;
     cmbMesCobCarencia.ItemIndex := 0;
  end
  else
  begin
     cmbMesCob.ItemIndex := StrToInt(Copy(sAnoMes,6,2)) ;
     cmbMesCobCarencia.ItemIndex := StrToInt(Copy(sAnoMes,6,2)) ;
  end;

  cmbMesCob.Text      := cmbMesCob.Items[cmbMesCob.ItemIndex];
  cmbMesCobCarencia.Text      := cmbMesCob.Items[cmbMesCob.ItemIndex];


  if StrToInt(Copy(sAnoMes,6,2)) = 12 then
  begin
     spedAnoCob.Text     := Copy(ProximoAnoMes(StrToInt(copy(sAnoMes,6,2)),StrToInt(copy(sAnoMes,1,4))),1,4);
     spedAnoCobCarencia.Text     := Copy(ProximoAnoMes(StrToInt(copy(sAnoMes,6,2)),StrToInt(copy(sAnoMes,1,4))),1,4);
  end
  else
  begin
     spedAnoCob.Text  := copy(sAnoMes,1,4);
     spedAnoCobCarencia.Text  := copy(sAnoMes,1,4);
  end;

  dbcrghstparcelamento.Align := alclient;

  OpcaoCorrente := oInicial;

  dbgrdContribuicao.BringToFront;
  dbgrdContribRefinanc.SendToBack;

  { Passado para o SHOW }
  If bVeioDeEvento = False Then Begin
    sbtnProcParticipClick(self);
  End;

end;

procedure TfrmParcelamento.sbtnSalariosClick(Sender: TObject);
Var
  I : Integer;
  SalString:String;
  Salario : Double;
begin
  inherited;
  if (not qryTitular.Active) or (qryTitular.IsEmpty)
  then begin
     MsgDlg('Selecione o Participante. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  frmAguarde.Mostra('Verificando salários ... ');

  qrySalarios.Close;
  qrySalarios.ParamByName('IdPessoa').Value  := qryTitular.FieldbyName('IdPessoa').AsInteger;
  qrySalarios.ParamByName('IdPessJur').Value := qryTitular.FieldbyName('IdPessJur').AsInteger;

  if qryTitular.FieldByName('FlgInterno').AsString = 'MA' then
    qrySalarios.ParamByName('IdRubrica').Value := qryTitular.FieldbyName('IdRubSalManut').AsInteger
  else
    if qryTitular.FieldByName('FlgInterno').AsString = 'MP' then
      qrySalarios.ParamByName('IdRubrica').Value := qryTitular.FieldbyName('IdRubSalManutParc').AsInteger
    else
      qrySalarios.ParamByName('IdRubrica').Value := qryTitular.FieldbyName('IdRubSalParticip').AsInteger;

  memTitular.Visible    := False;
  dbgrdSalarios.Visible := True;
  
  frmAguarde.Apaga;

 { Retirada da QrySalario a condição ROWNUM <= 48 para DB2 e criada qrySalAux
   para exibir os últimos 48 Proventos do Participante a partir da QrySal.}
  With qrySalarios  Do
   Begin
    Open;
    First;
    qrySalAux.Open;
    For i := 1 to 48 Do
    begin
      qrySalAux.Insert;
      qrySalAux.Fields[0].AsString  := FieldByName('MES').AsString;
      qrySalAux.Fields[1].AsString  := FieldByName('MESCOBRANCA').AsString;
      Salario := FieldByName('VALORPROVENTO').AsFloat;
      SalString := FormatFloat('###########,##0.00',Salario);
      qrySalAux.Fields[2].AsString   :=  SalString; { Salario}
      qrySalAux.Post;
      Next;
      If Eof Then Break;
    end;
  end; 
end;

procedure TfrmParcelamento.sbtnTitularClick(Sender: TObject);
begin
  inherited;
  memTitular.Visible         := True;
  dbgrdSalarios.Visible      := False;
end;

procedure TfrmParcelamento.FormShow(Sender: TObject);
begin
  inherited;
  If bVeioDeEvento = False Then
    WindowState := wsMaximized;

  //LimpaTela;
end;


procedure TfrmParcelamento.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  pgctrlCobrancas.ActivePage := tbsGrid;

end;

procedure TfrmParcelamento.qryContribuicaoCalcFields(
  DataSet: TDataSet);
var iposbarra : Integer;
begin
  inherited;

  if qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 1
  then qryContribuicao.FieldByName('TipoPgmto').AsString := 'Folha'
  else qryContribuicao.FieldByName('TipoPgmto').AsString := 'Banco';


  if (iIdCalculoDivida > 0) and ( not qryaux.isempty) then
  begin
     qryaux.first;
     while not qryaux.eof do
     begin
        iposbarra := pos('/',qryaux.fieldbyname('VALOR').AsString);

        if qrycontribuicao.fieldbyname('NUMRECEBIMENTO').AsInteger =
           StrToInt(copy(qryaux.fieldbyname('VALOR').AsString,1,iposbarra -1)) then
        begin
           if uppercase(copy(qryaux.fieldbyname('DESCRICAO').AsString,1,1)) = 'J' then
              qrycontribuicao.fieldbyname('JUROS').AsFloat := StrToFloat(clientenumero(copy(qryaux.fieldbyname('VALOR').AsString,iposbarra +1,
                                                              length(qryaux.fieldbyname('VALOR').AsString) - iposbarra)))
           else if uppercase(copy(qryaux.fieldbyname('DESCRICAO').AsString,1,1)) = 'M' then
              qrycontribuicao.fieldbyname('MULTA').AsFloat := StrToFloat(clientenumero(copy(qryaux.fieldbyname('VALOR').AsString,iposbarra +1,
                                                              length(qryaux.fieldbyname('VALOR').AsString) - iposbarra)))
           else if uppercase(copy(qryaux.fieldbyname('DESCRICAO').AsString,1,1)) = 'C' then
              qrycontribuicao.fieldbyname('CORRECAO').AsFloat := StrToFloat(clientenumero(copy(qryaux.fieldbyname('VALOR').AsString,iposbarra +1,
                                                              length(qryaux.fieldbyname('VALOR').AsString) - iposbarra)));
        end;

        qryaux.next;
     end;//while

  end;

end;




procedure TfrmParcelamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  { Somente se não vier de Evento }
  If bVeioDeEvento = False Then Begin
    if dtmBaseDados.dbBaseDados.InTransaction then
    begin
       if MsgDlg('Algumas operações não foram completadas. Deseja realmente sair?',
                 'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo  then exit;
       dtmBaseDados.dbBaseDados.Rollback;
    end;
  End;
  bVeioDeEvento := False;
  Action := caFree;
  //inherited;
end;

procedure TfrmParcelamento.BtnCancelaClick(Sender: TObject);
begin
  inherited;

   //caso venha de uma compra de carência
   if dsContribuicao.DataSet = qrycontribuicaocarencia then exit;

   if (OpcaoCorrente = oRefinanc) and
      (qryparcelamento.fieldbyname('SITPARCELAMENTO').AsInteger = 1) then
   begin
      tbFinanc.TabVisible := true;
      pgctrlCobrancas.ActivePage := tbFinanc;
      tbDemons.TabVisible := false;
      tbsGrid.TabVisible := false;
      tbOpcoes.TabVisible := false;
      exit;
   end;

   { Somente se não vier de Evento }
   If bVeioDeEvento = False Then Begin
    if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.Rollback;
   End;

   if OpcaoCorrente = oRefinanc then
   dsContribuicao.DataSet := qryContribRefinanc
   else  dsContribuicao.DataSet := qrycontribuicao;


   dsContribuicao.DataSet .close;
   dsContribuicao.DataSet .open;
   dsContribuicao.DataSet .EnableControls;
   if dsContribuicao.DataSet .isempty then qryContribuicao.DisableControls;

   if OpcaoCorrente = oRefinanc then
   qrycontribrefinancFLGSELECIONADO.visible := true
   else  qryContribuicaoFLGSELECIONADO.visible := true;

   rtotDivida.text := '';
   edtotdividapart.text := '';
   edtotdividapatro.text := '';
   rSalBase.text := '';
   redPercSeguro.text := '';   
   qryopcoes.close;
   memResult.Clear;
   tbDemons.TabVisible := false;
   tbOpcoes.TabVisible := false;
   tbsGrid.TabVisible := true;
   OpcaoCorrente := oInicial;
end;


procedure TfrmParcelamento.qryParcelamentoAfterScroll(DataSet: TDataSet);
begin
  inherited;

   if qryparcelamento.isempty then exit;

   iIdParcelamento := qryparcelamento.fieldbyname('IDPARCELAMENTO').AsInteger;

   if qryparcelamento.fieldbyname('SITPARCELAMENTO').AsInteger = 1 then
   begin
      edsitparcelamento.text := 'Normal';

      btnCancelar.enabled := true;
      btnQuitar.enabled := true;
      btnAmortizar.enabled := true;
      btnRefinanciar.enabled := true;


      tbsGrid.TabVisible := false;

   end
   else
   begin
      case qryparcelamento.fieldbyname('SITPARCELAMENTO').AsInteger  of
         2: edsitparcelamento.text := 'Quitado';
         3: edsitparcelamento.text := 'Quitado por morte';
         4: edsitparcelamento.text := 'Quitado por invalidez';
         5: edsitparcelamento.text := 'Cancelado';
         6: edsitparcelamento.text := 'Refinanciado';
      end;



      btnCancelar.enabled := false;
      btnQuitar.enabled := false;
      btnAmortizar.enabled := false;
      btnRefinanciar.enabled := false;


      tbsGrid.TabVisible := True;
      OpcaoCorrente := oRefinanc;

      dsContribuicao.DataSet := qrycontribrefinanc;
      qrycontribrefinanc.Close;
      qrycontribrefinanc.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
      qrycontribrefinanc.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
      qrycontribrefinanc.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
      qrycontribrefinanc.Open;
      qrycontribrefinancFLGSELECIONADO.visible :=  True;

      if qrycontribrefinanc.isempty then   BtnProximo.Enabled := false;

      dbgrdContribuicao.SendToBack;
      dbgrdContribRefinanc.BringToFront;

   end;


   if VoltaNumParcelasEnviadas( qryAux,
                                qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                                qrytitular.fieldbyname('SEQPROPOSTA').AsInteger ) > 0
   then    btnDesfazer.enabled := false
   else    btnDesfazer.enabled := True;

   qryParcelamentoAfterOpen(qryparcelamento);

end;


function TfrmParcelamento.CalculaSalario( qryAux : TwwQuery;
                                       sIdRegra : String;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint ) : double;
var rValorRegra : double;
    sValorRegra, sSQL   : string;
    bErro               : boolean;
begin
   Result := 0;



   sSQL := ' SELECT DISTINCT PP.IDPESSOA,                         '+
           '                 PP.IDPESSJUR,                        '+
           '                 PP.IDPLANOPREV,                      '+
           '                 PP.INSCRICAODATA,                    '+
           '                 PP.INSCRICAOTIPO,                    '+
           '                 EL.IDSITFUNC,                        '+
           '                 PP.IDSITPLANOPREV,                   '+
           '                 PP.IDSITPART,                        '+
           '                 PF.DATANASC,                         '+
           '                 PF.SEXO,                             '+
           '                 PF.DATAMORTE,                        '+
           '                 SP.FLGINTERNO,                       '+
           '                 EL.SALTOTAL,                         '+
           '                 EL.DATAADMISSAO,                     '+
           '                 EL.TEMPOSERVANTERIOR,                '+
           '                 EL.TEMPONAOCREDITADO,                '+
           '                 EL.TEMPOSERVTOTAL,                   '+
           '                 EL.DATADEMISSAO,                     '+
           '                 EL.TEMPOSERVTOTMES,                  '+
           '                 EL.TEMPOSERVTOTDIA,                  '+
           '                 EL.FLGDIRETOR,                       '+
           '''' + FormatDateTime('dd/mm/yyyy', Date)+''' AS DATAREF ,'+ 
           ' ROWNUM NUMLINHA     '+
           ' FROM  PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP '+
           ' WHERE PP.IDPESSJUR      = '+IntToStr(piIdPessJur)+
           ' AND   PP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
           ' AND   PP.IDPESSOA       = '+IntToStr(piIdPessoa)+
           ' AND   PP.SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
           ' AND   EL.IDPESSJUR      = PP.IDPESSJUR     '+
           ' AND   EL.IDPESSOA       = PP.IDPESSOA      '+
           ' AND   PF.IDPESSOA       = EL.IDPESSOA      '+
           ' AND   SP.IDSITPART      = PP.IDSITPART     ';

   try
      sValorRegra := RegraNumerica(sIdRegra,sSQL, bErro, iIdCalculoGeral);

      rValorRegra := StrToFloat(ClienteNumero(sValorRegra));
   except
      MsgDlg('Erro ao executar regra de cálculo do Salário base No. '+sIdRegra,'Erro',mtError,[mbOk],0);
      Exit;
   end;

   Result := rValorRegra;
end;

procedure TfrmParcelamento.rSalBaseBtnClick(Sender: TObject);
begin
  inherited;

  if qrytitular.fieldbyname('IDREGRASALPARCELA').AsString = ''
  then begin
     MsgDlg('A regra de cálculo do salário não foi cadastrada. Verificar parâmetros do sistema?',
            'Regra faltando',mtInformation,[mbOk],0);
     exit;
  end;

  if qryopcoes.Active then
  begin
    if MsgDlg('O cálculo das opções já foi efetuado. Deseja realmente refazer o cálculo do salário?',
              'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo  then exit;
    btncancelaopcaoClick(self);
  end;

  rSalBase.Text :=  FormatFloat('#0.00',
                    CalculaSalario( qryAux, qrytitular.fieldbyname('IDREGRASALPARCELA').AsString,
                                     qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                     qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                     qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                                     qrytitular.fieldbyname('SEQPROPOSTA').AsInteger )) ;
end;

procedure TfrmParcelamento.rTotDividaBtnClick(Sender: TObject);
var dTotPart, dTotPatro : Double;
begin
  inherited;


   if qrytitular.fieldbyname('IDREGRAVLRDIVIDA').AsString = ''
   then begin
      MsgDlg('A regra de cálculo do valor da dívida não foi cadastrada. Verificar parâmetros do sistema?',
             'Regra faltando',mtInformation,[mbOk],0);
      exit;
   end;

   if qryopcoes.Active then
   begin
     if MsgDlg('O cálculo das opções já foi efetuado. Deseja realmente refazer o cálculo da dívida?',
               'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo  then exit;
     btncancelaopcaoClick(self);
   end;


   {passar apenas registros marcados para a regra}
   dscontribuicao.dataset.first;
   sNumRecebimento := '';
   sNumRecebAlter  := '';
   while not dscontribuicao.dataset.eof do
   begin
      if dscontribuicao.dataset.FieldByName('FlgSelecionado').AsInteger = 1 then
      begin
         if sNumRecebimento = '' then
            sNumRecebimento := dscontribuicao.dataset.FieldByName('NUMRECEBIMENTO').AsString
         else
            sNumRecebimento := sNumRecebimento+','+dscontribuicao.dataset.FieldByName('NUMRECEBIMENTO').AsString;
      end;


      //caso o usuário marque que os alteradores não deve ser calculados para det. contribuição,
      //zerar valores
      if (dscontribuicao.dataset.fieldbyname('COBRAALTERADORES').AsInteger = 1) then
      begin

         if sNumRecebAlter = '' then
            sNumRecebAlter := dscontribuicao.dataset.FieldByName('NUMRECEBIMENTO').AsString
         else
            sNumRecebAlter := sNumRecebAlter+','+dscontribuicao.dataset.FieldByName('NUMRECEBIMENTO').AsString;
      end;

      dscontribuicao.dataset.next;
   end;


   if (sNumRecebimento = '')
   then
   begin
      MsgDlg('É preciso selecionar alguma contribuição em atraso.','Erro',mtError,[mbOk],0);
      exit;
   end;


   rTotDivida.Text :=  FormatFloat('#0.00',
                       CalculaDivida( qryAux, qrytitular.fieldbyname('IDREGRAVLRDIVIDA').AsString,
                                    sNumRecebimento,
                                    qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                    qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                    qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                                    qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                                    dTotPart, dTotPatro, iIdCalculoDivida )) ;

   // Sol 107699 - Henrique Massão 20/02/2009

   if (OpcaoCorrente = oRefinanc) then
   begin
   rTotDivida.Text := FormatFloat('#0.00', strtofloat(rTotDivida.text));
   // + rSdoDevedorAtual.value );
   end;

   //Henrique Massão

   edtotdividapart.text := FormatFloat('#0.00', dTotPart);
   edtotdividapatro.text := FormatFloat('#0.00', dTotPatro);



   if iIdCalculoDivida > 0 then
   begin

     qryaux.close;
     qryaux.sql.text := ' SELECT DESCRICAO, VALOR '+
                        ' FROM  DETCALCULO '+
                        ' WHERE IDCALCULO = '+IntToStr(iIdCalculoDivida)+' '+
                        ' ORDER BY IDDETCALCULO ';
     qryaux.open;




     if dsContribuicao.DataSet = qrycontribuicao then
     begin
        qrycontribuicao.close;
        qrycontribuicao.open;
     end
     else
     begin
        qrycontribuicaocarencia.close;
        qrycontribuicaocarencia.open;
     end;


     dscontribuicao.dataset.first;
     while not dscontribuicao.dataset.eof do
     begin
        dscontribuicao.dataset.Edit;

        if pos(dscontribuicao.dataset.FieldByName('NUMRECEBIMENTO').AsString, sNumRecebimento) <= 0 then
        dscontribuicao.dataset.FieldByName('FlgSelecionado').AsInteger  := 0;


        //retira o cálculo dos alteradores segundo marcação do usuário
        if pos(dscontribuicao.dataset.FieldByName('NUMRECEBIMENTO').AsString, sNumRecebAlter) > 0 then
        begin
           rTotDivida.Text :=FormatFloat('#0.00',
           strtofloat(clientenumero(rTotDivida.text)) - ( dscontribuicao.dataset.fieldbyname('JUROS').AsFloat +
           dscontribuicao.dataset.fieldbyname('MULTA').AsFloat+
           dscontribuicao.dataset.fieldbyname('CORRECAO').AsFloat));

           if qryContribuicao.fieldbyname('FLGPAGADOR').AsString =  'C' then
              edtotdividapart.Text :=FormatFloat('#0.00',
              strtofloat(clientenumero(edtotdividapart.text)) - ( dscontribuicao.dataset.fieldbyname('JUROS').AsFloat +
              dscontribuicao.dataset.fieldbyname('MULTA').AsFloat+
              dscontribuicao.dataset.fieldbyname('CORRECAO').AsFloat))
           else
              edtotdividapatro.Text :=FormatFloat('#0.00',
              strtofloat(clientenumero(edtotdividapatro.text)) - ( dscontribuicao.dataset.fieldbyname('JUROS').AsFloat +
              dscontribuicao.dataset.fieldbyname('MULTA').AsFloat+
              dscontribuicao.dataset.fieldbyname('CORRECAO').AsFloat));

           dscontribuicao.dataset.fieldbyname('JUROS').AsFloat := 0;
           dscontribuicao.dataset.fieldbyname('MULTA').AsFloat := 0;
           dscontribuicao.dataset.fieldbyname('CORRECAO').AsFloat := 0;

           dscontribuicao.dataset.fieldbyname('COBRAALTERADORES').AsInteger := 1;
        end;


        dscontribuicao.dataset.Post;

        dscontribuicao.dataset.next;
     end;
     dscontribuicao.dataset.first;
   end;

end;


function TfrmParcelamento.CalculaDivida( qryAux : TwwQuery;
                                       sIdRegra, sNumRecebimento : String;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint;
                                       var dTotPart, dTotPatro : Double;
                                       var iIdCalculo : longint ) : double;
var sSql : String;
    rValorRegra : double;
    sValorRegra, sSitRecebimento   : string;
    bErro               : boolean;
begin
   result :=0;
   dTotPart := 0;
   dTotPatro := 0;
   iIdCalculo := 0;

   sSitRecebimento := 'SITRECEBIMENTO';

   sSQL := 'SELECT HST.IDPESSJUR, HST.IDPLANOPREV, HST.IDPESSOA, HST.SEQPROPOSTA, '                                                      + #13 +
           '       HST.MESREFERENCIA , HST.MESCOBRANCA, HST.NUMRECEBIMENTO, '                                                            + #13 +
           '       HST.VALORESPERADO, HST.VALORRECEBIDO, '                                                                               + #13 +
            //Everson TIBERO - Início
           {'       DECODE(SITRECEBIMENTO,7,1,0) FLGDIVIDA, '                                                                             + #13 +
           '       DECODE(FLGDEVOLUCAO, 0, NVL(HST.VALORESPERADO, 0), NVL(HST.VALORESPERADO, 0) * (-1)) - '                              + #13 + //CPrev - 28256
	   '       DECODE(FLGDEVOLUCAO, 0, NVL(HST.VALORRECEBIDO, 0), NVL(HST.VALORRECEBIDO, 0) * (-1)) VALOR, '                               + #13 + //CPrev - 28256 }

           '       DECODE(HST.SITRECEBIMENTO,7,1,0) FLGDIVIDA, '                                                                         + #13 +
           '       DECODE(HST.FLGDEVOLUCAO, 0, NVL(HST.VALORESPERADO, 0), NVL(HST.VALORESPERADO, 0) * (-1)) - '                          + #13 + //CPrev - 28256
           '       DECODE(HST.FLGDEVOLUCAO, 0, NVL(HST.VALORRECEBIDO, 0), NVL(HST.VALORRECEBIDO, 0) * (-1)) VALOR, '                     + #13 + //CPrev - 28256
            //Everson TIBERO - Fim

           '       S1.VALORPART , '                                                                                                      + #13 +
           '	   S2.VALORPATRO, '                                                                                                        + #13 +
           '	   NVL(S1.VALORPART,0) + NVL(S2.VALORPATRO,0) VALORDIVIDA , '                                                              + #13 +
           '       ROWNUM NUMLINHA '                                                                                                     + #13 +
           'FROM (SELECT SUM(NVL(DECODE(HST.FLGDEVOLUCAO,  0, HST.VALORESPERADO, HST.VALORESPERADO * (-1)), 0)) - '                      + #13 + //CPrev - 28256
           '             SUM(NVL(DECODE(HST.FLGDEVOLUCAO,  0, HST.VALORRECEBIDO, HST.VALORRECEBIDO * (-1)), 0)) VALORPART '              + #13 + //CPrev - 28256
           '      FROM HSTCONTRIBPREV HST, '                                                                                             + #13 +
           '           CONTPREV CT '                                                                                                     + #13 +
           '      WHERE HST.IDPESSJUR       = ' + IntToStr(piIdPessJur)                                                                  + #13 +
           '        AND HST.IDPLANOPREV     = ' + IntToStr(piIdPlanoPrev)                                                                + #13 +
           '        AND HST.IDPESSOA        = ' + IntToStr(piIdPessoa)                                                                   + #13 +
           '        AND HST.NUMRECEBIMENTO IN ('+ sNumRecebimento + ') '                                                                + #13 +
           '        AND HST.SITRECEBIMENTO  = ' + sSitRecebimento                                                                        + #13 +
           '        AND CT.IDPLANOPREV      = HST.IDPLANOPREV '                                                                          + #13 +
           '        AND CT.IDCONTRIBUICAO   = HST.IDCONTRIBUICAO '                                                                       + #13 +
           '        AND CT.FLGPAGADOR       = ''C'') S1, '                                                                               + #13 +
           '	 (SELECT  SUM(NVL(DECODE(HST.FLGDEVOLUCAO,  0, HST.VALORESPERADO, HST.VALORESPERADO * (-1)), 0)) - '                       + #13 + //CPrev - 28256
           '              SUM(NVL(DECODE(HST.FLGDEVOLUCAO,  0, HST.VALORRECEBIDO, HST.VALORRECEBIDO * (-1)), 0))  VALORPATRO '           + #13 + //CPrev - 28256
           '      FROM  HSTCONTRIBPREV HST, '                                                                                            + #13 +
           '            CONTPREV CT '                                                                                                    + #13 +
           '       WHERE HST.IDPESSJUR       = ' + IntToStr(piIdPessJur)                                                                 + #13 +
           '         AND HST.IDPLANOPREV     = ' + IntToStr(piIdPlanoPrev)                                                               + #13 +
           '         AND HST.IDPESSOA        = ' + IntToStr(piIdPessoa)                                                                  + #13 +
           '         AND HST.NUMRECEBIMENTO IN (' + sNumRecebimento + ') '                                                               + #13 +
           '         AND HST.SITRECEBIMENTO  = ' + sSitRecebimento                                                                       + #13 +
           '         AND CT.IDPLANOPREV      = HST.IDPLANOPREV '                                                                         + #13 +
           '         AND CT.IDCONTRIBUICAO   = HST.IDCONTRIBUICAO '                                                                      + #13 +
           '         AND CT.FLGPAGADOR       = ''P'') S2, '                                                                              + #13 +
           '     HSTCONTRIBPREV HST '                                                                                                    + #13 +
           'WHERE HST.IDPESSJUR      = ' + IntToStr(piIdPessJur)                                                                         + #13 +
           '  AND HST.IDPLANOPREV    = ' + IntToStr(piIdPlanoPrev)                                                                       + #13 +
           '  AND HST.IDPESSOA       = ' + IntToStr(piIdPessoa)                                                                          + #13 +
           '  AND HST.NUMRECEBIMENTO IN (' + sNumRecebimento + ') '                                                                      + #13;

   try
      sValorRegra := RegraNumerica(sIdRegra,sSQL, bErro, iIdCalculoGeral);

      iIdCalculo := iIdCalculoGeral;

      rValorRegra := StrToFloat(ClienteNumero(sValorRegra));
   except
      MsgDlg('Erro ao executar regra de cálculo do valor da dívida, No. '+sIdRegra,'Erro',mtError,[mbOk],0);
      Exit;
   end;

   qryaux.close;
   qryaux.sql.text := sSql;
   qryaux.open;

   if qryaux.fieldbyname('VALORPART').AsFloat <= 0 then
   dTotPart := 0
   else
     dTotPart := (qryaux.fieldbyname('VALORPART').AsFloat *  rValorRegra) / qryaux.fieldbyname('VALORDIVIDA').AsFloat;

   if qryaux.fieldbyname('VALORPATRO').AsFloat <= 0 then
   dTotPatro := 0
   else
     dTotPatro := (qryaux.fieldbyname('VALORPATRO').AsFloat *  rValorRegra) / qryaux.fieldbyname('VALORDIVIDA').AsFloat;

   Result := rValorRegra;
end;

procedure TfrmParcelamento.BtnProximoClick(Sender: TObject);
begin
  inherited;

   if qrytitular.fieldbyname('IDREGRAOPPARCELAS').AsString = ''
   then begin
      MsgDlg('A regra de cálculo das opções não foi cadastrada. Verificar parâmetros do sistema?',
             'Regra faltando',mtInformation,[mbOk],0);
      exit;
   end;

   if rTotDivida.text = '' then
   begin
      MsgDlg('É necessário o cálculo da dívida.','Erro',mtError,[mbOk,mbHelp],0);
      rTotDivida.SetFocus;
      Exit;
   end;

   if rSalBase.text = '' then
   begin
      MsgDlg('É necessário o cálculo do salário base.','Erro',mtError,[mbOk,mbHelp],0);
      rSalBase.SetFocus;
      Exit;
   end;


   if trim(redPercSeguro.text) = '' then
   begin
      MsgDlg('É necessário preencher o percentual do seguro.','Erro',mtError,[mbOk,mbHelp],0);
      redPercSeguro.SetFocus;
      Exit;
   end;


   if redPercSeguro.value = 0  then
   begin
      if MsgDlg('O percentual de seguro está zerado. Deseja continuar?','Erro',mtError,[mbYes, mbNo,mbHelp],0) = mrNo
      then
      begin
         redPercSeguro.SetFocus;
         Exit;
      end;
   end;

   iCalculoRegra := 0;
   iCalculoRegra := CalculaOpcoes( qryAux, qrytitular.fieldbyname('IDREGRAOPPARCELAS').AsString,
                                   qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                   qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                   qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                                   qrytitular.fieldbyname('SEQPROPOSTA').AsInteger ) ;


   tbDemons.TabVisible := false;
   tbFinanc.TabVisible := false;
   tbOpcoes.TabVisible := True;
   tbsGrid.TabVisible := true;
   tbsGrid.Enabled := true;

   pgctrlCobrancas.ActivePage := tbOpcoes;


   if (OpcaoCorrente = oInicial) or
      (qryparcelamento.isempty ) then
   OpcaoCorrente := oParcela;


   qryopcoes.close;
   qryopcoes.ParamByName('IDCALCULO').AsInteger := iCalculoRegra;
   qryopcoes.open;
   qryopcoes.EnableControls;

end;


function TfrmParcelamento.CalculaOpcoes( qryAux : TwwQuery;
                                       sIdRegra  : String;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint ) : longint;
var sSql : String;
    rValorRegra : double;
    sDataNasc, sValorRegra   : string;
    bErro               : boolean;
    cAux : Char;
begin
   result :=0;

   sSQL := 'SELECT DATANASC FROM PESSOAFISICA WHERE IDPESSOA = '+IntToStr(piIdPessoa);
   FazQuery(QryAux,sSQL);
   sDataNasc := QryAux.FieldByName('DATANASC').AsString;

   sSQL := ' SELECT '+IntToStr(piIdPessJur)+' IDPESSJUR, '+IntToStr(piIdPlanoPrev)+' IDPLANOPREV, '+
           ' '+IntToStr(piIdPessoa)+' IDPESSOA, 1 SEQPROPOSTA, '+
           ' '+oranumero(rTotDivida.text)+' VALORDIVIDA, '+oranumero(rSalBase.text)+' SALBASE ,'+
           ' '+oranumero(redPercSeguro.text)+' PERCSEGURO, '+
           ' TO_DATE('+QuotedStr(sDataNasc)+',''DD/MM/YYYY'') AS DATANASC, '+ 
           ' ROWNUM NUMLINHA     '+
           ' FROM DUAL ';

   try

      with dtmAPrev do
      begin
         regraAPrev.RuleName := sIdRegra;
         qryRegra.Close;
         qryRegra.SQL.Clear;
         qryRegra.SQl.Add(sSQL);
         qryRegra.Open;


         cAux                 := DecimalSeparator;
         regraAPrev.QueryIn   := dtmAPrev.qryRegra;
         regraAPrev.IdCalculo := 0;
         try
            regraAPrev.Execute;
         finally
            DecimalSeparator := cAux;
            iIdCalculoGeral := 0;
         end;

         if not regraAPrev.Error
         then begin
            iIdCalculoGeral := regraAPrev.IdCalculo;
         end // if not regra.error
         else begin
            iIdCalculoGeral := -1;
         end;

         qryRegra.Close;
      end;

   except
      MsgDlg('Erro ao executar regra de cálculo das opções, No. '+sIdRegra,'Erro',mtError,[mbOk],0);
      qryaux.close;
      Exit;
   end;


   Result := iIdCalculoGeral;

end;


procedure TfrmParcelamento.btnAnterioropcaoClick(Sender: TObject);
begin
  inherited;
  pgctrlCobrancas.ActivePage := tbsGrid

end;

procedure TfrmParcelamento.btncancelaopcaoClick(Sender: TObject);
begin
  inherited;


   sNumParcelas := '';
   sVlrPrimPrestacao := '';
   sSeguro := '';
   sPercentual := '';


   { Somente se não vier de Evento }
   If bVeioDeEvento = False Then Begin
     if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.Rollback;
   End;
   tbFinanc.TabVisible := False;
   tbsGrid.TabVisible := true;
   tbsGrid.Enabled := true;
      
   pgctrlCobrancas.ActivePage := tbsGrid;
   tbDemons.TabVisible := false;
   tbFinanc.TabVisible := false;
   tbOpcoes.TabVisible := false;

   qryopcoes.close;
   if not (OpcaoCorrente = oRefinanc) then OpcaoCorrente := oInicial; 

   qryaux.close;
end;

procedure TfrmParcelamento.btncalclaprestacaoClick(Sender: TObject);
var nOpcoes, iIdLote : Integer;
    sSql , sSqlRegra , sSqlWhereRegra,
    sAnoMesInicio,  sDescPreparo, sMsgErro :  String;
    // SOL 176028/14148 KTN 1961222
    sNumParcVencer: string;


begin
  inherited;

   iIdLote := -1;
   // SOL 176028/14148 KTN 1961222
   sNumParcVencer := '0';

   if prmIdmotivoParcela <= 0
   then begin
      MsgDlg('O motivo para registros de parcelamento não foi cadastrado. Verificar parâmetros do sistema?',
             'Motivo faltando',mtInformation,[mbOk],0);
      exit;
   end;



   if trim(memResult.Lines.Text) <> '' then
   begin
     if MsgDlg('O cálculo das prestações já foi efetuado. Deseja realmente refazer?',
               'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo  then exit;
     btncancelardemonsClick(self);
     OpcaoCorrente := oParcela;
   end;


   qryopcoes.first;

   nOpcoes := 0;
   while not qryopcoes.eof do
   begin
      if qryopcoes.FieldByName('FlgSelecionado').AsInteger = 1 then    inc(nopcoes);

      qryopcoes.next;
   end;

   if nOpcoes = 0 then
   begin
      MsgDlg('É preciso selecionar uma das opções.','Erro de operação',mtInformation,[mbOk],0);
      Exit;
   end
   else if nOpcoes > 1 then
   begin
      MsgDlg('Apenas uma das opções pode ser selecionada.','Erro de operação',mtInformation,[mbOk],0);
      Exit;
   end;


   qryopcoes.first;
   while not qryopcoes.eof do
   begin
      if qryopcoes.FieldByName('FlgSelecionado').AsInteger = 1 then  break;

      qryopcoes.next;
   end;

   sNumParcelas := qryopcoes.fieldbyname('NMESES').AsString;
   sVlrPrimPrestacao := qryopcoes.fieldbyname('VALOR').AsString;
   sSeguro := qryopcoes.fieldbyname('SEGURO').AsString;
   sPercentual := qryopcoes.fieldbyname('PERCENTUAL').AsString;
   sVlrBase :=   rSalBase.text;
   sVlrDiviaPart := edtotdividapart.text;
   sVlrDividaPatro := edtotdividapatro.text;
   sSdoDevedor := rTotDivida.text;

   // SOL 176028/14148 KTN 1961222 ** INICIO **
   qryaux.close;
   qryAux.SQL.Clear;
   qryaux.sql.text := ' SELECT NVL(NUMPARCELAS, 0) - NVL(PARCPAGAS, 0) TOTALPARCAVENCER FROM PARCELAMENTO ' +
                      ' WHERE IDPESSJUR = ' + qrytitular.fieldbyname('IDPESSJUR').AsString   +
                      ' AND IDPLANOPREV = ' + qrytitular.fieldbyname('IDPLANOPREV').AsString +
                      ' AND IDPESSOA    = ' + qrytitular.fieldbyname('IDPESSOA').AsString    +
                      ' AND DATAINICIO IS NOT NULL ';
   qryAux.Open;
   // SOL 176028/14148 KTN 1961222 ** FIM **

   if not qryAux.IsEmpty then
     sNumParcVencer := qryAux.FieldByName('TOTALPARCAVENCER').AsString;


   qryaux.close;
   qryaux.sql.text := ' SELECT C.NOME FROM CONTPREV CT , CONTRIBUICAO C  '+
                      ' WHERE CT.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' '+
                      ' AND C.IDCONTRIBUICAO = CT.IDCONTRIBUICAO '+
                      ' AND CT.FLGPARCELAMENTO = 1 ';
   qryaux.open;

   if qryaux.isempty then
   begin
      MsgDlg('Nenhuma contribuição foi cadastrada como forma de parcelamento. Verificar cadastro de contribuições por plano.','Cadastro incompleto',mtInformation,[mbOk],0);
      Exit;
   end
   else
   begin
      memmostracontrib.Clear;
   end;




   if rgrpFormaCob.itemindex = 0 then
   sFlgDescFolha := '1'
   else  sFlgDescFolha := '0';



   { Somente se não vier de Evento }
   If bVeioDeEvento = False Then Begin
     if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.Rollback;
     dtmBaseDados.dbBaseDados.StartTransaction;
   End;

   //atualiza financiamento atual
   if OpcaoCorrente = oRefinanc then
   begin
      if not AtualizaDadosQuitaRefinancAmort(qryAux, qryparcelamento.fieldbyname('IDPARCELAMENTO').AsInteger,
                      qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                      qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                      qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                      qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                      sMsgErro )
      then
      begin
         MsgDlg('Ocorreu um erro na atualização do parcelamento atual: '+sMsgErro,'Erro',mtError,[mbOk],0);
         Exit;
      end;
   end;



   if not SetIdParcelamento
   then begin
      MsgDlg('Erro ao gerar registro de parcelamento.','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;


   if not AtualizaSitRecebimento(qryaux,
                                 dscontribuicao.dataset.fieldbyname('IDPESSJUR').AsInteger,
                                 dscontribuicao.dataset.fieldbyname('IDPLANOPREV').AsInteger,
                                 dscontribuicao.dataset.fieldbyname('IDPESSOA').AsInteger ,
                                 dscontribuicao.dataset.fieldbyname('SEQPROPOSTA').AsInteger,
                                 sNumRecebimento) then
   begin
      MsgDlg('Ocorreu um erro na atualização das contribuições parceladas.','Erro',mtError,[mbOk],0);
      Exit;
   end;


   if not AssociarContribuicoes(qryaux) then
   begin
      MsgDlg('Ocorreu um erro na associação de contribuições.','Erro',mtError,[mbOk],0);
      Exit;
   end;


   // Chamar cadastro de contribuicao do participante
   frmCadContribParticipante := TfrmCadContribParticipante.Create(Application);
   frmCadContribParticipante.sbtnProcurar.visible := false;
   frmCadContribParticipante.AssociaContrib(qrytitular.fieldbyname('NOME').AsString,
                                            qrytitular.fieldbyname('NOMEPATRO').AsString,
                                            qrytitular.fieldbyname('NOMEPLANO').AsString,
                                            FormatDateTime('dd/mm/yyyy', Date), 
                                            qrytitular.fieldbyname('IDPESSOA').AsInteger,
                                            qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                            qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                            qrytitular.fieldbyname('SEQPROPOSTA').AsInteger, False);
   frmCadContribParticipante.Free;

   if MsgDlg(' Deseja confirmar Opções das Contribuições e a Associação de Contribuições ao Participante ? ',
             'Confirmação', mtconfirmation, [mbYes,mbNo],0) = mrNo
   then begin
      Exit;
   end;


   sAnoMesInicio := Trim(spedAnoCob.Text);
   if cmbMesCob.ItemIndex <= 8
   then sAnoMesInicio  := sAnoMesInicio+'/'+'0'+IntToStr(cmbMesCob.ItemIndex+1)
   else sAnoMesInicio  := sAnoMesInicio+'/'+    IntToStr(cmbMesCob.ItemIndex+1);

   sSql := ' SELECT CPP.IDPESSJUR , CPP.IDPLANOPREV, CPP.IDPESSOA, CPP.IDCONTRIBUICAO, '+
           ' CPP.DATAINICIO, CPP.DATAFINAL, CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
           ' CPP.FLGDESCFOLHA, CPP.CODPORTFORMA, CPP.SEQPROPOSTA, '+
           ' TO_DATE('''+qryTitular.FieldByName('DATANASC').AsString+''',''DD/MM/YYYY'') DATANASC, '+
           ' '''+qryTitular.FieldByName('INSCRICAODATA').AsString+''' INSCRICAODATA  '+
           ' FROM CONTRIBPREVPARTP CPP '+
           ' WHERE CPP.IDPESSJUR = '+qryTitular.FieldByName('IdPessjur').AsString+' AND '+
           ' CPP.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' AND '+
           ' CPP.IDPESSOA = '+qryTitular.FieldByName('IdPessoa').AsString+' AND '+
           ' EXISTS (SELECT 1 FROM CONTPREV WHERE '+
           '         IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
           '         AND IDPLANOPREV = CPP.IDPLANOPREV AND FLGPARCELAMENTO = 1 )';

   sSqlRegra := ' SELECT CPP.IDPESSJUR , CPP.IDPLANOPREV, CPP.IDPESSOA, CPP.IDCONTRIBUICAO, '+

           ''''+ PreparaStrRegra(FormatDateTime('dd/mm/yyyy', Date))           +''' AS DATAREF, '+  

           ' CPP.DATAINICIO, CPP.DATAFINAL, CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
           ' CPP.FLGDESCFOLHA, CPP.CODPORTFORMA, CPP.SEQPROPOSTA, '+
           ' TO_DATE('''+qryTitular.FieldByName('DATANASC').AsString+''',''DD/MM/YYYY'') DATANASC, '+
           ' '''+qryTitular.FieldByName('INSCRICAODATA').AsString+''' INSCRICAODATA , '+
           ' '+oranumero(rTotDivida.text)+' VALORDIVIDA, '+oranumero(rSalBase.text)+' SALBASE, '+
           ' '+oranumero(sVlrPrimPrestacao)+' VALORPRESTACAO ,  '+
           ' '+sNumParcelas+' NMESES, '+
           ' '+oranumero(sPercentual)+' PERCENTUAL, '+
           ' '+oranumero(redPercSeguro.text)+' PERCSEGURO , '+oranumero(sSeguro)+' SEGURO ,  '+
           ' 0 FLGQUITACAO, '+oranumero(rTotDivida.text)+' SDODEVEDOR, '+  
           ' 0 FLGAMORTIZA, 0 VLRAMORTIZA, '+
           // SOL 176028/14148 KTN 1961222
           ' ' + sNumParcVencer + ' NUMPARCAVENCER  '+
           // SOL 176028/14148 KTN 1961222
           ' FROM CONTRIBPREVPARTP CPP ';
   sSqlWhereRegra :=  ' EXISTS (SELECT 1 FROM CONTPREV WHERE '+
                      ' IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
                      ' AND IDPLANOPREV = CPP.IDPLANOPREV AND FLGPARCELAMENTO = 1 )';



   sDescPreparo       := 'Cobrança de financiamento.';
   if PreparaContribuicao( qryTitular.FieldByName('IdPessjur').AsInteger,
                           qryTitular.FieldByName('IdPlanoPrev').AsInteger,
                           prmIdMotivoParcela,
                           0,
                           qryaux,
                           qryAux2,
                           sSQL,
                           sSqlRegra,  
                           sSqlWhereRegra, 
                           'CPP', 
                           qryTitular.FieldByName('FlgInterno').AsString,
                           '01/'+Copy(sAnoMesInicio,6,2)+'/'+Copy(sAnoMesInicio,1,4),
                           '',
                           sDescPreparo,
                           'N' ,
                           '0',
                           False, 
                           False,
                           sMsgErro,
                           iIdLote,
                           rSalBase.text,
                           qryTitular.FieldByName('IdSitpart').AsString,
                           '',
                           True,
                           True,
                           sAnoMesInicio, 
                           False,
                           0,
                           '',
                           '',
                           0,0)  
   then begin
      MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   if not AtualizaIdParcelamento(qryaux,
                                 dscontribuicao.dataset.fieldbyname('IDPESSJUR').AsInteger,
                                 dscontribuicao.dataset.fieldbyname('IDPLANOPREV').AsInteger,
                                 dscontribuicao.dataset.fieldbyname('IDPESSOA').AsInteger ,
                                 dscontribuicao.dataset.fieldbyname('SEQPROPOSTA').AsInteger) then
   begin
      MsgDlg('Ocorreu um erro na atualização das parcelas.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   MostraDemonstrativo;


   tbDemons.TabVisible := true;
   tbFinanc.TabVisible := false;
   tbOpcoes.TabVisible := true;
   tbsGrid.TabVisible := true;
   tbsGrid.Enabled := true;
   tbCpCarencia.tabvisible := false;
      
   pgctrlCobrancas.ActivePage := tbDemons;
   btnAntDemons.visible := true;   

end;

procedure TfrmParcelamento.qryContribuicaoAfterScroll(DataSet: TDataSet);
begin
  inherited;

  rTotDivida.enabled := not qrycontribuicao.IsEmpty;
  rSalBase.enabled := not qrycontribuicao.IsEmpty;
  redPercSeguro.enabled := not qrycontribuicao.IsEmpty;
  BtnCancela.enabled := not qrycontribuicao.IsEmpty;
  BtnProximo.enabled := not qrycontribuicao.IsEmpty;


end;

procedure TfrmParcelamento.qryopcoesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  btncalclaprestacao.enabled := not qryopcoes.IsEmpty;
  btncartaopcoes.enabled := not qryopcoes.IsEmpty;

end;

procedure TfrmParcelamento.btncartaopcoesClick(Sender: TObject);
var nOpcoes : Integer;
    sDescOpcoes : TStringList;
begin
  inherited;
   qryopcoes.first;

   sDescOpcoes := TStringList.Create;

   nOpcoes := 0;

   sDescOpcoes.Add('N. de meses     Perc. Salário      Vlr. Prim. Prestação     Seguro');

   sDescOpcoes.Add('__________________________________________________________________');


   while not qryopcoes.eof do
   begin
      if qryopcoes.FieldByName('FlgSelecionado').AsInteger = 1 then
      begin
         inc(nopcoes);
         sDescOpcoes.Add(CompletaString(qryopcoes.FieldByName('NMESES').AsString,' ',11,False)+
                         CompletaString(qryopcoes.FieldByName('PERCENTUAL').AsString,' ',18,False)+
                         CompletaString(FormatFloat('#0.00',strtofloat(clientenumero(qryopcoes.FieldByName('VALOR').AsString))),' ',26,False)+''+
                         CompletaString(FormatFloat('#0.00',strtofloat(clientenumero(qryopcoes.FieldByName('SEGURO').AsString))),' ',10,False));
      end;

      qryopcoes.next;
   end;

   if nOpcoes = 0 then
   begin
      MsgDlg('É preciso selecionar pelo menos uma das opções.','Erro de operação',mtInformation,[mbOk],0);
      Exit;
   end;


   dtmRelatorios.qryFundacao.Close;
   dtmRelatorios.qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
   dtmRelatorios.qryFundacao.Open;


   dtmRelatorios.QryParcelamento.close;
   dtmRelatorios.QryParcelamento.ParamByName('IdPessoa').Value := qryTitular.ParamByName('IdPessoa').Value ;
   dtmRelatorios.QryParcelamento.ParamByName('IdPessJur').Value := qryTitular.ParamByName('IdPessJur').Value;
   dtmRelatorios.QryParcelamento.ParamByName('IdPlanoPrev').Value := qryTitular.ParamByName('IdPlanoPrev').Value ;
   dtmRelatorios.QryParcelamento.ParamByName('SeqProposta').Value := qryTitular.ParamByName('SeqProposta').Value;
   dtmRelatorios.QryParcelamento.ParamByName('ValorDivida').Value := strtofloat(clientenumero(rTotDivida.Text));
   dtmRelatorios.QryParcelamento.Open;

   dtmRelatorios.sOpcoes := TStringList.Create;
   dtmRelatorios.sOpcoes.Text := sDescOpcoes.Text  ;

   dtmRelatorios.rpParcelamento.Print;


   sDescOpcoes.free;

end;

procedure TfrmParcelamento.btncancelardemonsClick(Sender: TObject);
begin
  inherited;

  { Somente se não vier de Evento }
  If bVeioDeEvento = False Then Begin
    if dtmBaseDados.dbBaseDados.InTransaction
    then  dtmBaseDados.dbBaseDados.Rollback;
  End;

  if bCompraCarencia then
  begin
     tbcpcarencia.TabVisible := true;
     tbcpcarencia.enabled := True;
     pgctrlCobrancas.ActivePage := tbcpcarencia;
     tbDemons.TabVisible := false;
  end
  else
  begin
     pgctrlCobrancas.ActivePage := tbOpcoes;
     tbDemons.TabVisible := false;
     tbFinanc.TabVisible := false;
     tbOpcoes.TabVisible := true;
     tbsGrid.TabVisible := true;
     tbsGrid.Enabled := true;


  end;

  memResult.Clear;

  if not (OpcaoCorrente = oRefinanc) then OpcaoCorrente := oInicial; 
  Habilitabotoes(true);
end;

procedure TfrmParcelamento.btnAntDemonsClick(Sender: TObject);
begin
  inherited;
  pgctrlCobrancas.ActivePage := tbOpcoes;
  tbFinanc.TabVisible := false;
  tbOpcoes.tabvisible := true;
end;

procedure TfrmParcelamento.pgctrlCobrancasChange(Sender: TObject);
begin
  inherited;
  if pgctrlCobrancas.ActivePage = tbCpCarencia then
     stxttitulo.Caption := 'Compra de Carência'
  else if pgctrlCobrancas.ActivePage = tbsGrid then
     stxttitulo.Caption := 'Parcelamento de dívidas'
  else if pgctrlCobrancas.ActivePage = tbOpcoes then
     stxttitulo.Caption := 'Opções de Parcelamento'
  else if pgctrlCobrancas.ActivePage = tbDemons then
     stxttitulo.Caption := 'Demonstrativo de cálculos'
  else if pgctrlCobrancas.ActivePage = tbFinanc then
     stxttitulo.Caption := 'Financiamento do Participante';
end;


procedure TfrmParcelamento.dbgrdContribuicaoEnter(Sender: TObject);
begin
  inherited;
  if qryopcoes.Active then
  begin
    if MsgDlg('O cálculo do valor da dívida já foi efetuado. Deseja realmente refazer o cálculo da dívida?',
              'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo  then exit;
    btncancelaopcaoClick(self);
  end;
end;

procedure TfrmParcelamento.btnSairParamExit(Sender: TObject);
begin
  inherited;

  btnSairParamClick(self);
end;

function TfrmParcelamento.AssociarContribuicoes(qryaux : twwquery) : Boolean;
begin
   result := false;


   qryaux.close;
   qryaux.sql.text := ' INSERT INTO CONTRIBPREVPARTP(IDPESSOA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                      '             CODPORTFORMA,DIAVENCIMENTO,FLGDESCFOLHA, FLGCOBRA, VALORBASE1,VALORBASE2,VALORBASE3, '+
                      '             QTDEPARCELAS, FLGRETROATIVO,FLGRECALCULA,DATAINICIO,DATAFINAL,IDTPPERIODICIDADE) '+
                      ' SELECT '+qrytitular.fieldbyname('IDPESSOA').AsString+' IDPESSOA, '+
                      ' '+qrytitular.fieldbyname('IDPESSJUR').AsString+' IDPESSJUR, '+
                      ' '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' IDPLANOPREV, '+
                      ' C.IDCONTRIBUICAO, NULL ,0,'''+sFlgDescFolha+''', '+
                      ' 1, NULL,NULL,NULL, NULL, 0, 0,TRUNC(SYSDATE),NULL,C.IDTPPERIODICIDADE '+
                      ' FROM CONTPREV CT , CONTRIBUICAO C  '+
                      ' WHERE CT.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' '+
                      ' AND C.IDCONTRIBUICAO = CT.IDCONTRIBUICAO '+
                      ' AND CT.FLGPARCELAMENTO = 1 '+
                      ' AND NOT EXISTS (SELECT 1 FROM CONTRIBPREVPARTP '+
                      '                 WHERE IDPESSJUR = '+qrytitular.fieldbyname('IDPESSJUR').AsString+' '+
                      '                 AND IDPLANOPREV = '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' '+
                      '                 AND IDPESSOA = '+qrytitular.fieldbyname('IDPESSOA').AsString+' '+
                      '                 AND IDCONTRIBUICAO = C.IDCONTRIBUICAO) ';
   try
      qryaux.execsql;
   except
      exit;
   end;


   {caso o participante já tenha estas contribuições associadas}
   qryaux.close;
   qryaux.sql.text := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1,  FLGDESCFOLHA = '''+sFlgDescFolha+''' '+
                      ' WHERE IDPESSOA =  '+qrytitular.fieldbyname('IDPESSOA').AsString+' '+
                      ' AND IDPESSJUR = '+qrytitular.fieldbyname('IDPESSJUR').AsString+' '+
                      ' AND IDPLANOPREV = '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' '+
                      ' AND EXISTS (SELECT 1 FROM CONTPREV CT '+
                      '             WHERE CT.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' '+
                      '             AND CT.IDCONTRIBUICAO = CONTRIBPREVPARTP.IDCONTRIBUICAO '+
                      '             AND CT.FLGPARCELAMENTO = 1) ';
   try
      qryaux.execsql;
   except
      exit;
   end;

   result := true;
end;

procedure TfrmParcelamento.qryParcelamentoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  iNumParcelasGeradas := 0;   //Fim Renato Visoni SOL 40370 Kintana 525322
  if qryparcelamento.isempty then exit;

  pnlhistorico.BringToFront;
  stxtfinanc.Caption := 'Histórico de Parcelas';
  pnlAmortizacao.SendToBack;
  pnlcancelamento.SendToBack;
  pnlQuitacao.SendToBack;

  if qrytitular.fieldbyname('IDREGRASALPARCELA').AsString <> '' then
  rSalAtual.text := FormatFloat('#0.00',
                    CalculaSalario( qryAux, qrytitular.fieldbyname('IDREGRASALPARCELA').AsString,
                                    qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                    qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                    qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                                    qrytitular.fieldbyname('SEQPROPOSTA').AsInteger )) ;



  iNumParcelasGeradas := qryparcelamento.fieldbyname('PARCGERADAS').AsInteger; //Renato Visoni SOL 40370 Kintana 525322

  rParcelasaPagar.text := VoltaNumParcelasAPagar( qryAux,
                                      qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                      qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                      qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                                      qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                                      qryParcelamento.fieldbyname('IDPARCELAMENTO').AsString,
                                      qryparcelamento.fieldbyname('NUMPARCELAS').AsInteger );


  //Renato Visoni SOL 40370 Kintana 525322

  QryAtualiza.CLose;
  QryAtualiza.SQL.Clear;
  QryAtualiza.SQL.ADD(' UPDATE PARCELAMENTO SET PARCPAGAS ='+ rParcelasaPagar.text );
  QryAtualiza.SQL.ADD(' WHERE IDPESSJUR = '+qrytitular.fieldbyname('IDPESSJUR').AsString);
  QryAtualiza.SQL.ADD(' AND IDPLANOPREV = '+qrytitular.fieldbyname('IDPLANOPREV').asString);
  QryAtualiza.SQL.ADD(' AND IDPESSOA =    '+qrytitular.fieldbyname('IDPESSOA').asString);
  QryAtualiza.SQL.ADD(' AND IDPARCELAMENTO = '+qryParcelamento.fieldbyname('IDPARCELAMENTO').AsString);
  QryAtualiza.SQL.ADD(' AND DATAINICIO IS NOT NULL           ');
  QryAtualiza.ExecSQL;

  if  dtmBaseDados.dbBaseDados.InTransaction
    then dtmBaseDados.dbBaseDados.Commit;

  //Renato Visoni SOL 40370 Kintana 525322



  if qrytitular.fieldbyname('IDREGRASDODEVEDOR').AsString <> '' then
  rSdoDevedorAtual.text := FormatFloat('#0.00',
                      CalculaSdoDevedor( qryAux, qrytitular.fieldbyname('IDREGRASDODEVEDOR').AsString,
                                     rSalAtual.text, qryparcelamento.fieldbyname('PERCENTUAL').AsString,
                                     qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                     qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                     qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                                     qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                                     rParcelasaPagar.text  )) ;

  redPremio.value :=   rSdoDevedorAtual.value * qryparcelamento.fieldbyname('PERCSEGURO').AsFloat;


  qryHstParcelamento.close;
  qryHstParcelamento.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
  qryHstParcelamento.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
  qryHstParcelamento.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
  qryHstParcelamento.ParamByName('IdParcelamento').AsInteger := qryparcelamento.FieldByName('IdParcelamento').AsInteger;
  qryHstParcelamento.open;

end;

procedure TfrmParcelamento.btnDesfazerClick(Sender: TObject);
var sMsgErro : String;
begin
  inherited;


  OpcaoCorrente := oInicial;

  if MsgDlg('Deseja realmente desfazer o parcelamento?',
            'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo  then exit;



  HabilitaBotoes(false);



  if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.Rollback;
  dtmBaseDados.dbBaseDados.StartTransaction;

  if not Desfazer(qryAux, qryparcelamento.fieldbyname('IDPARCELAMENTO').AsInteger,
                  qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                  qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                  qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                  qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                  sMsgErro )
  then
  begin
     MsgDlg('Ocorreu um erro no desfazer: '+sMsgErro,'Erro',mtError,[mbOk],0);
     dtmBaseDados.dbBaseDados.Rollback;
     Exit;
  end;



  if MsgDlg('Desfazer efetuado com sucesso. Deseja efetivar?','Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrNo then
  begin
     if dtmBaseDados.dbBaseDados.InTransaction
     then  dtmBaseDados.dbBaseDados.Rollback;

     HabilitaBotoes(true);

     exit;
  end
  else
  begin
     if dtmBaseDados.dbBaseDados.InTransaction
     then  dtmBaseDados.dbBaseDados.Commit;
  end;


  dsContribuicao.DataSet := qrycontribuicao;
  qryContribuicao.Close;
  qryContribuicao.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
  qryContribuicao.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
  qryContribuicao.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
  qryContribuicao.Open;
  qryContribuicao.EnableControls;
  if qrycontribuicao.isempty then qryContribuicao.DisableControls;
  qryContribuicaoFLGSELECIONADO.visible := True;

  if qryContribuicao.isempty then
  BtnProximo.Enabled := false;



  qryParcelamento.Close;
  qryParcelamento.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
  qryParcelamento.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
  qryParcelamento.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
  qryParcelamento.Open;


  tbsGrid.TabVisible := true;
  tbDemons.TabVisible := false;
  tbFinanc.TabVisible := false;
  tbOpcoes.TabVisible := false;
  BtnCancelaClick(self);
  pgctrlCobrancas.ActivePage := tbsGrid;
  HabilitaBotoes(false);

end;

procedure TfrmParcelamento.btnCancelarClick(Sender: TObject);
var sMsgErro : String;
begin
  inherited;
  HabilitaBotoes(false);

  pnlhistorico.SendToBack;
  pnlAmortizacao.SendToBack;
  pnlQuitacao.SendToBack;
  pnlcancelamento.BringToFront ;
  edmotivocancel.text := '';
  stxtfinanc.Caption := 'Cancelamento de financiamento';
  cmbSitParcelamento.itemindex :=0;
  edmotivocancel.SetFocus;






end;

procedure TfrmParcelamento.btnAmortizarClick(Sender: TObject);
begin
  inherited;

   if qryparcelamento.fieldbyname('NUMPARCELAS').AsInteger =
      qryparcelamento.fieldbyname('PARCGERADAS').AsInteger
   then begin
      MsgDlg('Todas as parcelas já foram geradas. A amortização não é possível?',
             'Erro de operação',mtInformation,[mbOk],0);
      exit;
   end;

   if prmIdMotivoAmortiza <= 0 
   then begin
      MsgDlg('O motivo para registros de amortização não foi cadastrado. Verificar parâmetros do sistema?',
             'Motivo faltando',mtInformation,[mbOk],0);
      exit;
   end;

   if qrytitular.fieldbyname('IDREGRAAMORTIZA').AsString = ''
   then begin
      MsgDlg('A regra de cálculo do valor a amortizar não foi cadastrada. Verificar parâmetros do sistema?',
             'Regra faltando',mtInformation,[mbOk],0);
      exit;
   end;

   HabilitaBotoes(false);

   pnlhistorico.SendToBack;
   pnlcancelamento.SendToBack;
   pnlQuitacao.SendToBack;
   pnlAmortizacao.BringToFront;
   stxtfinanc.Caption := 'Amortização';

   spnumpacelas.MinValue :=  1;
   spnumpacelas.Text := '1';
   spnumpacelas.MaxValue :=  strtoint(rParcelasaPagar.text) - 1;

   rValorAmortiza.Text :=  FormatFloat('#0.00',
                           CalculaValorAmortiza( qryAux, qrytitular.fieldbyname('IDREGRAAMORTIZA').AsString,
                                    spnumpacelas.Text,
                                    qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                    qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                    qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                                    qrytitular.fieldbyname('SEQPROPOSTA').AsInteger)) ;

   OpcaoCorrente := oAmortiza;




end;



procedure TfrmParcelamento.MostraDemonstrativo;
var sMes, sLinha : String;
begin

   memResult.Lines.Clear;

   if bCompraCarencia then
   begin
      memResult.Lines.Add('Demonstrativo de Compra de Carência');
      OpcaoCorrente := oInicial;
   end
   else
   begin
      if OpcaoCorrente = oParcela then
         memResult.Lines.Add('Demonstrativo de Parcelamento')
      else if OpcaoCorrente = oQuitacao then
         memResult.Lines.Add('Demonstrativo de Quitação')
      else if OpcaoCorrente = oAmortiza then
         memResult.Lines.Add('Demonstrativo de Amortização');
   end;

   memResult.Lines.Add('------------------------------------------------------------');

   // Dados Pessoais
   memResult.Lines.Add('Participante : '+qryTitular.FieldByName('Nome').AsString);
   memResult.Lines.Add('------------------------------------------------------------');
   memResult.Lines.Add('Data de Nascimento : '+qryTitular.FieldByName('DataNasc').AsString);
   memResult.Lines.Add('Data do Falecimento : '+qryTitular.FieldByName('DataMorte').AsString);

   // Conta Bancaria
   memResult.Lines.Add('Conta Bancária Preferencial : ');
   memResult.Lines.Add('------------------------------------------------------------');
   if not qryContaBancaria.IsEmpty
   then begin
      memResult.Lines.Add('Banco    : '+qryContaBancaria.FieldByName('Banco').AsString);
      memResult.Lines.Add('Agência  : '+qryContaBancaria.FieldByName('Agencia').AsString);
      memResult.Lines.Add('Conta Nº : '+qryContaBancaria.FieldByName('ContaCorrente').AsString);
   end
   else begin
      memResult.Lines.Add(' < não cadastrada até o momento > ');
   end;

   // Dados na Patrocinadora
   memResult.Lines.Add('  ');
   memResult.Lines.Add('Patrocinadora  : '  +qryTitular.FieldByName('NomePatro').AsString);
   memResult.Lines.Add('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString);
   memResult.Lines.Add('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString);
   memResult.Lines.Add('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString);
   memResult.Lines.Add('  ');
   memResult.Lines.Add('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString);
   memResult.Lines.Add('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString);
   memResult.Lines.Add('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString);

   // Valor da Reserva
   memResult.Lines.Add('Reserva Total (R$)   : '+sValorReserva);

   // Situacoes
   memResult.Lines.Add('Situação na Patrocinadora  : '+qryTitular.FieldByName('NomeSitFunc').AsString);
   memResult.Lines.Add('Situaçao na Fundação       : '+qryTitular.FieldByName('NomeSitPart').AsString);
   memResult.Lines.Add('Situação no Plano          : '+qryTitular.FieldByName('NomeSitPlano').AsString);

   memResult.Lines.Add('  ');
   memResult.Lines.Add('  ');
   memResult.Lines.Add('Tempo de Serviço Total Informado : '+OraNumero(qryTitular.FieldByName('TempoServTotal').AsString)+' anos '+
                                                              OraNumero(qryTitular.FieldByName('TempoServTotMes').AsString)+' meses '+
                                                              OraNumero(qryTitular.FieldByName('TempoServTotDia').AsString)+' dias ' );

   memResult.Lines.Add('Tempo de Serviço Anterior à Admissão : '+FormatFloat('#0.00',qryTitular.FieldByName('TempoServAnterior').AsFloat));
   memResult.Lines.Add('Tempo de Serviço Não Creditado : '      +FormatFloat('#0.00',qryTitular.FieldByName('TempoNaoCreditado').AsFloat));
   memResult.Lines.Add('Tempo em Situação Especial (risco) : ' +FormatFloat('#0.00',qryTitular.FieldByName('TempoSitEspecial').AsFloat));
   memResult.Lines.Add('Nível Salarial : '                      +qryTitular.FieldByName('Nivel').AsString);

   if OpcaoCorrente = oParcela then
      memResult.Lines.Add('Salário Base (R$) : '                +clientenumero(rSalBase.Text))
   else  if OpcaoCorrente = oQuitacao then
      memResult.Lines.Add('Salário Base (R$) : '                +clientenumero(rSalAtual.Text));


   memResult.Lines.Add('  ');
   memResult.Lines.Add('  ');


   if OpcaoCorrente = oParcela then
   begin
      memResult.Lines.Add('Número de parcelas:'+sNumParcelas);
      memResult.Lines.Add('Percentual sobre o salário:'+sPercentual);
      memResult.Lines.Add('Valor da primeira prestação:'+FormatFloat('#0.00',strtofloat(clientenumero(sVlrPrimPrestacao))));
      memResult.Lines.Add('Valor do seguro:'+sSeguro);
   end
   else  if OpcaoCorrente = oQuitacao then
   begin
      memResult.Lines.Add('Número de parcelas:'+qryparcelamento.fieldbyname('NUMPARCELAS').AsString);
      memResult.Lines.Add('Percentual sobre o salário:'+qryparcelamento.fieldbyname('PERCENTUAL').AsString);
      memResult.Lines.Add('Valor da primeira prestação:'+FormatFloat('#0.00',qryparcelamento.fieldbyname('VLRPRIMPRESTACAO').AsFloat));
   end;


   if bCompraCarencia then
   begin

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT C.IDCONTRIBUICAO,C.NOME, H.MESREFERENCIA, H.VALORESPERADO  '+
                     ' FROM   CONTRIBUICAO C,  HSTCONTRIBPREV H  '+
                     ' WHERE  (H.IDPESSOA    = '+qryTitular.FieldByName('IDPESSOA').AsString+')'+
                     ' AND    (H.IDPESSJUR   = '+qryTitular.FieldByName('IDPESSJUR').AsString+')'+
                     ' AND    (H.IDPLANOPREV = '+qryTitular.FieldByName('IDPLANOPREV').AsString+')'+
                     ' AND    (H.SEQPROPOSTA = '+qryTitular.FieldByName('SEQPROPOSTA').AsString+')');

                     qryAux.SQL.Add(' AND    (H.IDMOTIVO = '+inttostr(prmIdMotivoCarencia)+') ');

      qryAux.SQL.Add(' AND    (H.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
                     ' ORDER BY H.MESREFERENCIA, C.IDCONTRIBUICAO DESC ');
      qryAux.Open;

   end
   else
   begin

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT C.IDCONTRIBUICAO,C.NOME, H.MESREFERENCIA, H.VALORESPERADO  '+
                     ' FROM   CONTRIBUICAO C,  HSTCONTRIBPREV H  '+
                     ' WHERE  (H.IDPESSOA    = '+qryTitular.FieldByName('IDPESSOA').AsString+')'+
                     ' AND    (H.IDPESSJUR   = '+qryTitular.FieldByName('IDPESSJUR').AsString+')'+
                     ' AND    (H.IDPLANOPREV = '+qryTitular.FieldByName('IDPLANOPREV').AsString+')'+
                     ' AND    (H.SEQPROPOSTA = '+qryTitular.FieldByName('SEQPROPOSTA').AsString+')'+
                     ' AND    (H.IDPARCELAMENTO = '+inttostr(iIdParcelamento)+') ');

                     if OpcaoCorrente = oParcela then
                        qryAux.SQL.Add(' AND    (H.IDMOTIVO = '+inttostr(prmIdMotivoParcela)+') ')
                     else if OpcaoCorrente = oQuitacao then
                        qryAux.SQL.Add(' AND    (H.IDMOTIVO = '+inttostr(prmIdMotivoQuitacao)+') ')
                     else if OpcaoCorrente = oAmortiza then
                        qryAux.SQL.Add(' AND    (H.IDMOTIVO = '+inttostr(prmIdMotivoAmortiza)+') ');

      qryAux.SQL.Add(' AND    (H.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
                     ' ORDER BY H.MESREFERENCIA, C.IDCONTRIBUICAO DESC ');
      qryAux.Open;
   end;

   if not qryAux.IsEmpty
   then begin

      memResult.Lines.Add('  ');
      memResult.Lines.Add('  ');
      memResult.Lines.Add('------------------------------------------------------------');
      memResult.Lines.Add(' CONTRIBUIÇÕES A COBRAR DO PARTICIPANTE : ');
      memResult.Lines.Add('------------------------------------------------------------');


      memResult.Lines.Add('   ');
      memResult.Lines.Add('MÊS          DESCONTAR   DESCRICAO DO ITEM                  ');
      memResult.Lines.Add('------------------------------------------------------------');

      while not qryAux.Eof do
      begin
         sLinha := '';

         memResult.Lines.Add('   ');
         sMes := qryAux.FieldByName('MesReferencia').AsString;


         sLinha := sMes+Replicate(' ',3)+
                   AlinhaDireita(FormatFloat('#0.00', StrToFloat(ClienteNumero(qryAux.FieldByName('ValorEsperado').AsString))),12)+
                   Replicate(' ',3)+
                   qryaux.fieldbyname('NOME').AsString;

         memResult.Lines.Add(sLinha);

         qryAux.next;
      end;
   end;



end;



procedure TfrmParcelamento.BtnEncerraClick(Sender: TObject);
begin
  inherited;

   if bCompraCarencia then
   begin
      if bParcelaCarencia then
      begin
         if MsgDlg('Compra de carência efetuada com sucesso. Deseja efetivar e iniciar parcelamento?','Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrNo then
         begin
            if dtmBaseDados.dbBaseDados.InTransaction
            then  dtmBaseDados.dbBaseDados.Rollback;

            btncancelardemonsClick(self);
            exit;
         end;


         dsContribuicao.DataSet := qrycontribuicaocarencia;
         qrycontribuicaocarencia.Close;
         qrycontribuicaocarencia.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
         qrycontribuicaocarencia.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
         qrycontribuicaocarencia.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
         qrycontribuicaocarencia.Open;
         qrycontribuicaocarencia.EnableControls;
         if qrycontribuicaocarencia.isempty then qrycontribuicaocarencia.DisableControls;
         qryContribuicaocarenciaFLGSELECIONADO.visible := True;

         if qrycontribuicaocarencia.isempty then
         BtnProximo.Enabled := false;

         tbsGrid.TabVisible := true;
         tbsGrid.enabled := true;
         tbDemons.tabvisible := false;
         memResult.clear;
         tbcpcarencia.TabVisible := false;
         tbcpcarencia.enabled := false;
         pgctrlCobrancas.ActivePage := tbsGrid;
         stxttitulo.caption := 'Financiamento do Participante';

         edtotdividapart.text :=  edParticipante.text;
         edtotdividapatro.text := edPatrocinadora.text

      end
      else
      begin
         if MsgDlg('Compra de carência efetuada com sucesso. Deseja efetivar?','Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrNo then
         begin
            if dtmBaseDados.dbBaseDados.InTransaction
            then  dtmBaseDados.dbBaseDados.Rollback;

            btncancelardemonsClick(self);
            exit;
         end;

         //spCarencia.enabled := false; // Renato Visoni SOL 132620 Kintana 769854
         spCarencia.enabled := True; // Renato Visoni SOL 132620 Kintana 769854

         tbsGrid.TabVisible := false;
         tbsGrid.enabled := false;
         tbcpcarencia.TabVisible := true;
         tbcpcarencia.enabled := True;
         pgctrlCobrancas.ActivePage := tbcpcarencia;


         if trim(qrytitular.fieldbyname('IDREGRACARENCIA').AsString) = '' then
         begin
            MsgDlg('Regra de cálculo de tempo de carência não associada. Verificar cadastro.','Erro',mtError,[mbOk],0);
            Exit;
         end
         else    edCarenciaMeses.Text :=  FloatToStr(CalculaTpCarencia( qryAux,
                                  qrytitular.fieldbyname('IDREGRACARENCIA').AsString,
                                  qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                  qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                  qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                                  qrytitular.fieldbyname('SEQPROPOSTA').AsInteger));

         // Renato Visoni SOL 132620 Kintana 769854
         try
           if trunc(strTofloat(edCarenciaMeses.Text)) <= 0 then begin

           if dtmBaseDados.dbBaseDados.InTransaction //Taffarel - SIG67010.68619
              then  dtmBaseDados.dbBaseDados.commit; //Taffarel - SIG67010.68619

              exit;
           end;
         except
            exit;
         end;
         // Renato Visoni SOL 132620 Kintana 769854


         spCarencia.enabled := true;
         spCarencia.MinValue := 0;
         spCarencia.MaxValue := trunc(strtofloat(edCarenciaMeses.Text));// Renato Visoni SOL 132620 Kintana 769854
         spCarencia.Value := trunc(strtofloat(edCarenciaMeses.Text));// Renato Visoni SOL 132620 Kintana 769854

         qryCpCarencia.close;
         qryCpCarencia.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
         qryCpCarencia.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
         qryCpCarencia.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
         qryCpCarencia.open;
      end;



      if dtmBaseDados.dbBaseDados.InTransaction
      then  dtmBaseDados.dbBaseDados.commit;

     // bCompraCarencia := false;         // Xavier
     // bParcelaCarencia := false;        // Xavier

   end
   else
   begin
      if OpcaoCorrente = oParcela then
      begin

        If bVeioDeEvento = False Then Begin { Somente se não vier de Evento }
          if MsgDlg('Parcelamento efetuado com sucesso. Deseja efetivar?','Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrNo then
          begin
             if dtmBaseDados.dbBaseDados.InTransaction
             then  dtmBaseDados.dbBaseDados.Rollback;

             btncancelardemonsClick(self);
          end;
        End;
      end
      else if OpcaoCorrente = oQuitacao then
      begin
         if MsgDlg('Quitação efetuada com sucesso. Deseja efetivar?','Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrNo then
         begin
            if dtmBaseDados.dbBaseDados.InTransaction
            then  dtmBaseDados.dbBaseDados.Rollback;

            btncancelardemonsClick(self);
         end
      end
      else if OpcaoCorrente = oAmortiza then
      begin
         if MsgDlg('Amortização efetuada com sucesso. Deseja efetivar?','Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrNo then
         begin
            if dtmBaseDados.dbBaseDados.InTransaction
            then  dtmBaseDados.dbBaseDados.Rollback;

            btncancelardemonsClick(self);
         end
      end;

      qryaux.Close; 
      if qryContribuicao.updatespending then qryContribuicao.CancelUpdates;
      if qryopcoes.updatespending then qryopcoes.CancelUpdates;

      { Somente se não vier de Evento }
      If bVeioDeEvento = False Then Begin
        if dtmBaseDados.dbBaseDados.InTransaction
        then  dtmBaseDados.dbBaseDados.commit;
      End Else Begin
        Close;
      End;


      qryParcelamento.Close;
      qryParcelamento.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
      qryParcelamento.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
      qryParcelamento.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
      qryParcelamento.Open;

      tbDemons.TabVisible := false;
      tbFinanc.TabVisible := false;
      tbOpcoes.TabVisible := false;
      tbsGrid.visible := true;
      tbsGrid.enabled := True;
      pgctrlCobrancas.ActivePage := tbsGrid;

      if not qryParcelamento.isempty then
      begin
         tbFinanc.TabVisible := true;
         tbsGrid.TabVisible := false;
         pgctrlCobrancas.ActivePage := tbFinanc;
      end;
   end;
   iIdCalculoDivida := 0;
end;

procedure TfrmParcelamento.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute
  then memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmParcelamento.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if printdlg.Execute
  then memResult.Print(' ');
end;

function TfrmParcelamento.SetIdParcelamento : Boolean;
begin
   result := false;


   //caso seja um parcelamento de carência, este já foi inserido anteriormente, tend apenas
   //que ser atualizado com o resto dos dados gerados pelo parcelamento
   if dsContribuicao.DataSet = qrycontribuicaocarencia then
   begin
      qryaux.close;
      qryaux.sql.text := ' SELECT IDPARCELAMENTO ID FROM PARCELAMENTO '+
                         ' WHERE IDPESSOA =  '+qrytitular.fieldbyname('IDPESSOA').AsString+' '+
                         ' AND IDPESSJUR = '+qrytitular.fieldbyname('IDPESSJUR').AsString+' '+
                         ' AND IDPLANOPREV = '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' '+
                         ' AND DATAINICIO IS NULL '+
                         ' AND TPCOMPRACARENCIA IS NOT NULL ';
      try
         qryaux.open;
         iIdParcelamento := qryaux.fieldbyname('ID').AsInteger;
      except
         exit;
      end;

      qryaux.close;
      qryaux.sql.text := ' UPDATE PARCELAMENTO SET  '+
                         ' FLGDESCFOLHA = '''+sFlgDescFolha+'''	,   '+
                         ' NUMPARCELAS = '+sNumParcelas+'	,   '+
                         ' PARCPAGAS = 0 ,   '+
                         ' PARCGERADAS = 1 ,   '+
                         ' VLRPRIMPRESTACAO = '+oranumero(sVlrPrimPrestacao)+', '+
                         ' PERCENTUAL = '+sPercentual+',   '+
                         ' VLRSALBASE = '+oranumero(sVlrBase)+' ,   '+
                         ' SITPARCELAMENTO = 1 ,   '+
                         ' DATAINICIO = TRUNC(SYSDATE),   '+
                         ' DATACANCELAMENTO = NULL, '+
                         ' MOTIVOCANCEL = NULL ,   '+
                         ' IDCALCULOREGRA = '+IntToStr(iCalculoRegra)+'  ,  '+
                         ' VLRDIVIDAPART =  '+oranumero(sVlrDiviaPart)+' ,   '+
                         ' VLRDIVIDAPATRO = '+oranumero(sVlrDividaPatro)+' , '+
                         ' SDODEVEDOR = '+oranumero(sSdoDevedor)+'	'+
                         ' WHERE IDPARCELAMENTO = '+inttostr(iIdParcelamento)+' ';


      try
         qryaux.execsql;
      except
         exit;
      end;

   end
   else
   begin
      qryaux.close;
      qryaux.sql.text := ' SELECT NVL(MAX(IDPARCELAMENTO) + 1,1) ID FROM PARCELAMENTO ';
      try
         qryaux.open;
         iIdParcelamento := qryaux.fieldbyname('ID').AsInteger;
      except
         exit;
      end;


      qryaux.close;
      qryaux.sql.text := ' INSERT INTO PARCELAMENTO(IDPARCELAMENTO,   IDPESSJUR	,   IDPLANOPREV	,   IDPESSOA, '+
                         ' FLGDESCFOLHA	,   NUMPARCELAS	,   PARCPAGAS,   PARCGERADAS,   VLRPRIMPRESTACAO, '+
                         ' PERCENTUAL,   VLRSALBASE ,   SITPARCELAMENTO,    DATAINICIO,   DATACANCELAMENTO, '+
                         ' MOTIVOCANCEL,   IDCALCULOREGRA ,   VLRDIVIDAPART ,   VLRDIVIDAPATRO , '+
                         ' SDODEVEDOR , PERCSEGURO)   	'+  
                         ' SELECT '+inttostr(iIdParcelamento)+',   '+qryTitular.FieldByName('IDPESSJUR').AsString+' ,  '+
                         ' '+qryTitular.FieldByName('IDPLANOPREV').AsString+',   '+
                         ' '+qryTitular.FieldByName('IDPESSOA').AsString+' , '+
                         ' '''+sFlgDescFolha+''' , '+sNumParcelas+', 0,  1,   '+oranumero(sVlrPrimPrestacao)+', '+
                         ' '+sPercentual+',   '+oranumero(sVlrBase)+' , 1,  TRUNC(SYSDATE), NULL, '+
                         ' NULL,   '+IntToStr(iCalculoRegra)+' ,   '+oranumero(sVlrDiviaPart)+' ,   '+
                         ' '+oranumero(sVlrDividaPatro)+' ,  '+oranumero(sSdoDevedor)+'  , '+oranumero(redPercSeguro.text)+' '+ 
                         ' FROM  DUAL ';
      try
         qryaux.execsql;
      except
         exit;
      end;
   end;


   result := true;
end;


function TfrmParcelamento.CalculaSdoDevedor( qryAux : TwwQuery;
                                       sIdRegra, sSalario, sPercentual : String;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint ;
                                       sParcelasaPagar : String ) : double;
var sSql : String;
    rValorRegra : double;
    sValorRegra   : string;
    bErro               : boolean;
begin
   result :=0;

   //BRUNO AZEVEDO SOL 147807 KINTANA 1027715
   sSQL := ' SELECT DISTINCT '+oranumero(sSalario)+' SALBASE, '+oranumero(sPercentual)+' PERCEN, '+
           '                 '+sParcelasaPagar+' NUMPARCAVENCER ,  '+
           '                 PP.IDPESSOA,                         '+
           '                 PP.IDPESSJUR,                        '+
           '                 PP.IDPLANOPREV,                      '+
           '                 PP.INSCRICAODATA,                    '+
           '                 PP.INSCRICAOTIPO,                    '+
           '                 EL.IDSITFUNC,                        '+
           '                 PP.IDSITPLANOPREV,                   '+
           '                 PP.IDSITPART,                        '+
           '                 PF.DATANASC,                         '+
           '                 PF.SEXO,                             '+
           '                 PF.DATAMORTE,                        '+
           '                 SP.FLGINTERNO,                       '+
           '                 EL.SALTOTAL,                         '+
           '                 EL.DATAADMISSAO,                     '+
           '                 EL.TEMPOSERVANTERIOR,                '+
           '                 EL.TEMPONAOCREDITADO,                '+
           '                 EL.TEMPOSERVTOTAL,                   '+
           '                 EL.DATADEMISSAO,                     '+
           '                 EL.TEMPOSERVTOTMES,                  '+
           '                 EL.TEMPOSERVTOTDIA,                  '+
           '                 EL.FLGDIRETOR,                       '+
           ''''+FormatDateTime('dd/mm/yyyy', Date)+'''            AS DATAREF  ,'+
           ' ROWNUM NUMLINHA     '+
           ' FROM  PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP '+
           ' WHERE PP.IDPESSJUR      = '+IntToStr(piIdPessJur)+
           ' AND   PP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
           ' AND   PP.IDPESSOA       = '+IntToStr(piIdPessoa)+
           ' AND   PP.SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
           ' AND   EL.IDPESSJUR      = PP.IDPESSJUR     '+
           ' AND   EL.IDPESSOA       = PP.IDPESSOA      '+
           ' AND   PF.IDPESSOA       = EL.IDPESSOA      '+
           ' AND   SP.IDSITPART      = PP.IDSITPART     ';

   try
      sValorRegra := RegraNumerica(sIdRegra,sSQL, bErro, iIdCalculoGeral);
      
      rValorRegra := StrToFloat(ClienteNumero(sValorRegra));
   except
      MsgDlg('Erro ao executar regra de cálculo do Saldo Devedor atual, No. '+sIdRegra,'Erro',mtError,[mbOk],0);
      Exit;
   end;


   Result := rValorRegra;

end;


function TfrmParcelamento.VoltaNumParcelasAPagar( qryAux : TwwQuery;
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint;
                                sIdParcelamento : String;
                                iNumParcelas : Integer ) : String;
var Num : integer;
begin

   Num    := 0; //Renato Visoni SOL 40370 Kintana 525322
   result := '0';

   qryaux.close;
   qryaux.sql.Text := ' SELECT COUNT(1) NUM, IDCONTRIBUICAO '+
                      ' FROM HSTCONTRIBPREV '+
                      ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJur)+
                      ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                      ' AND   IDPESSOA       = '+IntToStr(piIdPessoa)+
                      ' AND   SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                      ' AND   IDPARCELAMENTO = '+sIdParcelamento+' '+
                      ' AND   SITRECEBIMENTO <> ''7'' '+
                      ' AND   NVL(VALORRECEBIDO,0) > 0  '+
                      ' AND   NVL(FLGDEVOLUCAO,0) = 0 ' +
                      ' GROUP BY IDCONTRIBUICAO '+
                      ' ORDER BY NUM DESC ';
   qryaux.open;

   //SOL126352 - Ádler Souza
   If bVeioDeEvento = False Then
   begin
     //Renato Visoni SOL 125202 Kintana 642874
     if iNumParcelasGeradas <> qryaux.fieldbyname('NUM').AsInteger then
       Num := iNumParcelasGeradas
     else
       Num := qryaux.fieldbyname('NUM').AsInteger;
     //Renato Visoni SOL 125202 Kintana 642874
   end
   else
     Num := qryaux.fieldbyname('NUM').AsInteger;
   //Fim - SOL126352 - Ádler Souza

   if not qryaux.isempty then result := inttostr(iNumParcelas - Num)//Renato Visoni SOL 40370 Kintana 525322
   else result := inttostr(iNumParcelas) ;

end;


function TfrmParcelamento.VoltaNumParcelasEnviadas( qryAux : TwwQuery;
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint   ) : integer;
begin
   result := 0;

   qryaux.close;
   qryaux.sql.Text := ' SELECT COUNT(1) NUM FROM HSTCONTRIBPREV '+
                      ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJur)+
                      ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                      ' AND   IDPESSOA       = '+IntToStr(piIdPessoa)+
                      ' AND   SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                      ' AND   IDPARCELAMENTO = '+qryParcelamento.fieldbyname('IDPARCELAMENTO').AsString+' '+
                      ' AND   SITRECEBIMENTO >=1   '+
                      ' AND   SITRECEBIMENTO <> 7 ';
   qryaux.open;

   if not qryaux.isempty then result := qryaux.fieldbyname('NUM').AsInteger;

end;


function TfrmParcelamento.Desfazer( qryAux : TwwQuery;
                                piIdParcelamento,
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint;
                                var sMsgErro : String   ) : Boolean;
begin
   result := false;

   qryaux.close;
   qryaux.sql.text := ' DELETE HSTCONTRIBPREV  '+
                      ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJur)+
                      ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                      ' AND   IDPESSOA       = '+IntToStr(piIdPessoa)+
                      ' AND   SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                      ' AND   IDPARCELAMENTO = '+qryParcelamento.fieldbyname('IDPARCELAMENTO').AsString+' '+
                      ' AND   SITRECEBIMENTO <> ''7'' ';
   try
      qryaux.execsql;
   except
      sMsgErro := 'Exclusão das parcelas.';
      exit;
   end;


   qryaux.close;
   qryaux.sql.text := ' DELETE CONTRIBPREVPARTP '+
                      ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJur)+
                      ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                      ' AND   IDPESSOA       = '+IntToStr(piIdPessoa)+
                      ' AND   SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                      ' AND   EXISTS (SELECT 1 FROM CONTPREV WHERE '+
                      '         IDCONTRIBUICAO = CONTRIBPREVPARTP.IDCONTRIBUICAO '+
                      '         AND IDPLANOPREV = CONTRIBPREVPARTP.IDPLANOPREV AND FLGPARCELAMENTO = 1 ) ';
   try
      qryaux.execsql;
   except
      sMsgErro := 'Exclusão das associações de contribuições.';
      exit;
   end;

   
   if not VoltaSitRecebimento(qryaux,
                              piIdPessJur,
                              piIdPlanoPrev,
                              piIdPessoa,
                              piSeqProposta,
                              qryParcelamento.fieldbyname('IDPARCELAMENTO').AsInteger) then
   begin
      sMsgErro := 'Retorno da situação dos registros da dívida.';
      exit;
   end;



   if trim(qryparcelamento.fieldbyname('TPCOMPRACARENCIA').AsString) <> '' then
   begin
      qryaux.close;
      qryaux.sql.text := ' UPDATE PARCELAMENTO  SET '+
                         ' NUMPARCELAS = NULL ,   '+
                         ' PARCPAGAS = 0 ,   '+
                         ' PARCGERADAS = 0 ,   '+
                         ' VLRPRIMPRESTACAO = NULL , '+
                         ' PERCENTUAL = NULL ,   '+
                         ' VLRSALBASE = NULL  ,   '+
                         ' PERCSEGURO = NULL , '+
                         ' SITPARCELAMENTO = 0 ,   '+
                         ' DATAINICIO = NULL ,   '+
                         ' DATACANCELAMENTO = NULL, '+
                         ' MOTIVOCANCEL = NULL ,   '+
                         ' IDCALCULOREGRA = NULL   '+
                         ' WHERE IDPARCELAMENTO = '+qryParcelamento.fieldbyname('IDPARCELAMENTO').AsString+' ';
      try
         qryaux.execsql;
      except
         sMsgErro := 'Exclusão do registro de parcelamento.';
         exit;
      end;
   end
   else
   begin
      qryaux.close;
      qryaux.sql.text := ' DELETE PARCELAMENTO  '+
                         ' WHERE IDPARCELAMENTO = '+qryParcelamento.fieldbyname('IDPARCELAMENTO').AsString+' ';
      try
         qryaux.execsql;
      except
         sMsgErro := 'Exclusão do registro de parcelamento.';
         exit;
      end;
   end;


   result := true;
end;


function TfrmParcelamento.Cancelar( qryAux : TwwQuery;
                                piIdParcelamento,
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint;
                                sMotivo : String;
                                var sMsgErro : String   ) : Boolean;
var sSit : String;
begin
   result := false;

   qryaux.close;
   qryaux.sql.text := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0 , DATAFINAL = TRUNC(SYSDATE) '+
                      ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJur)+
                      ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                      ' AND   IDPESSOA       = '+IntToStr(piIdPessoa)+
                      ' AND   SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                      ' AND   EXISTS (SELECT 1 FROM CONTPREV WHERE '+
                      '       IDCONTRIBUICAO = CONTRIBPREVPARTP.IDCONTRIBUICAO '+
                      '       AND IDPLANOPREV = CONTRIBPREVPARTP.IDPLANOPREV AND FLGPARCELAMENTO = 1 ) ';
   try
      qryaux.execsql;
   except
      sMsgErro := 'Atualização de contribuições associadas.';
      exit;
   end;



   case cmbSitParcelamento.itemindex of
      0: sSit := '5';
      1: sSit := '3';
      2: sSit := '4';
   end;

   qryaux.close;
   qryaux.sql.text := ' UPDATE PARCELAMENTO SET SITPARCELAMENTO = '+sSit+', DATACANCELAMENTO = TRUNC(SYSDATE), MOTIVOCANCEL = '''+sMotivo+'''  '+
                      ' WHERE IDPARCELAMENTO = '''+qryParcelamento.fieldbyname('IDPARCELAMENTO').AsString+''' ';
   try
      qryaux.execsql;
   except
      sMsgErro := 'Atualização do registro de parcelamento.';
      exit;
   end;


   result := true;
end;


procedure TfrmParcelamento.BitBtn9Click(Sender: TObject);
var sMsgErro : String;
begin
  inherited;
   if trim(cmbSitParcelamento.text) = '' then
   begin
      MsgDlg('Selecione o tipo de cancelamento.','Erro de operação',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   if trim(edmotivocancel.text) = '' then
   begin
      MsgDlg('Preencha o motivo de cancelamento. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.Rollback;
   dtmBaseDados.dbBaseDados.StartTransaction;

   if not Cancelar(qryAux, qryparcelamento.fieldbyname('IDPARCELAMENTO').AsInteger,
                   qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                   qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                   qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                   qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                   edmotivocancel.text,
                   sMsgErro )
   then
   begin
      MsgDlg('Ocorreu um erro no Cancelamento: '+sMsgErro,'Erro',mtError,[mbOk],0);
      dtmBaseDados.dbBaseDados.Rollback;
      Exit;
   end;



   if MsgDlg('Cancelar efetuado com sucesso. Deseja efetivar?','Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrNo then
   begin
      if dtmBaseDados.dbBaseDados.InTransaction
      then  dtmBaseDados.dbBaseDados.Rollback;
      btnCancelarCancelClick(self);
      exit;
   end
   else
   begin
      if dtmBaseDados.dbBaseDados.InTransaction
      then  dtmBaseDados.dbBaseDados.Commit;
   end;


   dsContribuicao.DataSet := qrycontribuicao;
   qryContribuicao.Close;
   qryContribuicao.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
   qryContribuicao.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
   qryContribuicao.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
   qryContribuicao.Open;
   qryContribuicao.EnableControls;
   if qrycontribuicao.isempty then qryContribuicao.DisableControls;
   qryContribuicaoFLGSELECIONADO.visible := True;

   if qryContribuicao.isempty then
   BtnProximo.Enabled := false;


   qryParcelamento.Close;
   qryParcelamento.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
   qryParcelamento.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
   qryParcelamento.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
   qryParcelamento.Open;


   tbDemons.TabVisible := false;
   tbFinanc.TabVisible := True;
   tbOpcoes.TabVisible := false;
   tbsGrid.TabVisible := false;
   pgctrlCobrancas.ActivePage := tbFinanc;
   pnlhistorico.BringToFront;
   pnlAmortizacao.SendToBack;
   pnlcancelamento.SendToBack ;
   pnlQuitacao.SendToBack;
   stxtfinanc.Caption := 'Histórico de Parcelas';


end;

procedure TfrmParcelamento.btnCancelarCancelClick(Sender: TObject);
begin
  inherited;

  if dtmBaseDados.dbBaseDados.InTransaction
  then  dtmBaseDados.dbBaseDados.Rollback;

  tbDemons.TabVisible := false;
  tbFinanc.TabVisible := True;
  tbOpcoes.TabVisible := false;
  tbsGrid.TabVisible := false;
  pgctrlCobrancas.ActivePage := tbFinanc;
  pnlhistorico.BringToFront;
  pnlAmortizacao.SendToBack;
  pnlcancelamento.SendToBack ;
  pnlQuitacao.SendToBack;  
  stxtfinanc.Caption := 'Histórico de Parcelas';
  HabilitaBotoes(true);

end;

procedure TfrmParcelamento.cmbSitParcelamentoChange(Sender: TObject);
begin
  inherited;
   case cmbSitParcelamento.itemindex of
      1: edmotivocancel.text := 'Cancelamento por falecimento.';
      2: edmotivocancel.text := 'Cancelamento por invalidez.';
   end;
end;



function TfrmParcelamento.AtualizaSitRecebimento( qryAux : TwwQuery;
                                                  piIdPessJur,   piIdPlanoPrev,
                                                  piIdPessoa ,   piSeqProposta : longint;
                                                  sNumReceb : String   ) : Boolean;
begin
   result := false;

   qryaux.close;
   qryaux.sql.text := ' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = ''7'', IDPARCELAMENTO = '+inttostr(iIdParcelamento)+' '+
                      ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJur)+
                      ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                      ' AND   IDPESSOA       = '+IntToStr(piIdPessoa)+
                      ' AND   SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                      ' AND   NUMRECEBIMENTO IN ('+sNumReceb+') ';
   try
      qryaux.execsql;
   except
      exit;
   end;


   result := true;
end;



procedure TfrmParcelamento.btnQuitarClick(Sender: TObject);
var sAnoMes : String;
begin
  inherited;

   if qryparcelamento.fieldbyname('NUMPARCELAS').AsInteger <=
      qryparcelamento.fieldbyname('PARCGERADAS').AsInteger
   then begin
      MsgDlg('Todas as parcelas já foram geradas. A quitação não é possível?',
             'Erro de operação',mtInformation,[mbOk],0);
      exit;
   end;


   if prmIdmotivoQuitacao <= 0
   then begin
      MsgDlg('O motivo para registros de quitação não foi cadastrado. Verificar parâmetros do sistema?',
             'Motivo faltando',mtInformation,[mbOk],0);
      exit;
   end;

  HabilitaBotoes(false);

  sAnoMes:= Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +
            Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);               

  cmbMeQuitacao.ItemIndex := StrToInt(Copy(sAnoMes,6,2)) ;
  cmbMeQuitacao.Text      := cmbMeQuitacao.Items[cmbMeQuitacao.ItemIndex];
  spAnoQuitacao.Text     := Copy(sAnoMes,1,4);


  eSdoDevedorQuitar.text := rSdoDevedorAtual.text;

  pnlhistorico.SendToBack;
  pnlAmortizacao.SendToBack;
  pnlcancelamento.SendToBack;
  pnlQuitacao.BringToFront;
  stxtfinanc.Caption := 'Quitação do financiamento';

  OpcaoCorrente := oQuitacao;

  memResult.Lines.clear;

end;

procedure TfrmParcelamento.btnRefinanciarClick(Sender: TObject);
begin
  inherited;

   if qryparcelamento.fieldbyname('NUMPARCELAS').AsInteger =
      qryparcelamento.fieldbyname('PARCGERADAS').AsInteger
   then begin
      MsgDlg('Todas as parcelas já foram geradas. O refinanciamento não é possível?',
             'Erro de operação',mtInformation,[mbOk],0);
      exit;
   end;


   OpcaoCorrente := oRefinanc;


   if MsgDlg('O refinanciamento irá abrir um novo financiamento para o saldo devedor.Deseja realmente refinanciar?',
             'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo  then
   begin
      OpcaoCorrente := oInicial;
      exit;
   end;

   HabilitaBotoes(false);



   tbsGrid.TabVisible := true;
   tbsGrid.enabled := true;
   pgctrlCobrancas.ActivePage := tbsGrid;
   tbDemons.TabVisible := false;
   tbFinanc.TabVisible := false;
   tbOpcoes.TabVisible := false;


   dsContribuicao.DataSet := qrycontribrefinanc;
   qrycontribrefinanc.Close;
   qrycontribrefinanc.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
   qrycontribrefinanc.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
   qrycontribrefinanc.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
   qrycontribrefinanc.Open;
   qrycontribrefinancFLGSELECIONADO.visible := True;

   if qrycontribrefinanc.isempty then   BtnProximo.Enabled := false;

   dbgrdContribuicao.SendToBack;
   dbgrdContribRefinanc.BringToFront;



   HabilitaBotoes(true);
end;

procedure TfrmParcelamento.BitBtn2Click(Sender: TObject);
begin
  inherited;
   {FALTA RELATÓRIO}
end;


procedure TfrmParcelamento.HabilitaBotoes(bHabilita : Boolean);
begin

   btnDesfazer.enabled := bHabilita;
   btnCancelar.Enabled := bHabilita;
   btnQuitar.Enabled := bHabilita;
   btnAmortizar.Enabled := bHabilita;
   btnRefinanciar.Enabled := bHabilita;



end;



procedure TfrmParcelamento.BitBtn3Click(Sender: TObject);
var nOpcoes, iIdLote : Integer;
    sSql , sSqlRegra , sSqlWhereRegra,
    sAnoMesInicio, sDescPreparo, sMsgErro :  String;

begin
  inherited;
   iIdLote := -1;


   if strtofloat(clientenumero(eSdoDevedorQuitar.Text))  <= 0 then
   begin
      MsgDlg('Saldo devedor incorreto. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   if trim(cmbMeQuitacao.text) = '' then
   begin
      MsgDlg('Preencha o mês de cobrança. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   if MsgDlg('Deseja realmente quitar saldo de '+Clientenumero(rSdoDevedorAtual.Text)+'?',
             'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo  then exit;


   if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.Rollback;
   dtmBaseDados.dbBaseDados.StartTransaction;

   sAnoMesInicio := Trim(spedAnoCob.Text);
   if cmbMesCob.ItemIndex <= 8
   then sAnoMesInicio  := sAnoMesInicio+'/'+'0'+IntToStr(cmbMesCob.ItemIndex+1)
   else sAnoMesInicio  := sAnoMesInicio+'/'+    IntToStr(cmbMesCob.ItemIndex+1);

   sSql := ' SELECT CPP.IDPESSJUR , CPP.IDPLANOPREV, CPP.IDPESSOA, CPP.IDCONTRIBUICAO, '+
           ' CPP.DATAINICIO, CPP.DATAFINAL, CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
           ' CPP.FLGDESCFOLHA, CPP.CODPORTFORMA, CPP.SEQPROPOSTA, '+
           ' TO_DATE('''+qryTitular.FieldByName('DATANASC').AsString+''',''DD/MM/YYYY'') DATANASC, '+
           ' '''+qryTitular.FieldByName('INSCRICAODATA').AsString+''' INSCRICAODATA  '+
           ' FROM CONTRIBPREVPARTP CPP '+
           ' WHERE CPP.IDPESSJUR = '+qryTitular.FieldByName('IdPessjur').AsString+' AND '+
           ' CPP.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' AND '+
           ' CPP.IDPESSOA = '+qryTitular.FieldByName('IdPessoa').AsString+' AND '+
           ' EXISTS (SELECT 1 FROM CONTPREV WHERE '+
           '         IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
           '         AND IDPLANOPREV = CPP.IDPLANOPREV AND FLGPARCELAMENTO = 1 )';

   sSqlRegra := ' SELECT CPP.IDPESSJUR , CPP.IDPLANOPREV, CPP.IDPESSOA, CPP.IDCONTRIBUICAO, '+
           ' CPP.DATAINICIO, CPP.DATAFINAL, CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
           ' CPP.FLGDESCFOLHA, CPP.CODPORTFORMA, CPP.SEQPROPOSTA, '+
           ' TO_DATE('''+qryTitular.FieldByName('DATANASC').AsString+''',''DD/MM/YYYY'') DATANASC, '+
           ' '''+qryTitular.FieldByName('INSCRICAODATA').AsString+''' INSCRICAODATA , '+
           ' '+oranumero(qryparcelamento.fieldbyname('SDODEVEDOR').AsString)+' VALORDIVIDA, '+
           ' '+oranumero(qryparcelamento.fieldbyname('VLRSALBASE').AsString)+' SALBASE, '+
           ' '+oranumero(qryparcelamento.fieldbyname('VLRPRIMPRESTACAO').AsString)+' VALORPRESTACAO ,  '+
           ' '+oranumero(qryparcelamento.fieldbyname('NUMPARCELAS').AsString)+' NMESES, '+
           ' '+oranumero(qryparcelamento.fieldbyname('PERCENTUAL').AsString)+' PERCENTUAL, '+
           ' 1 FLGQUITACAO, '+oranumero(eSdoDevedorQuitar.text)+' SDODEVEDOR, '+
           ' 0 FLGAMORTIZA, 0 VLRAMORTIZA ,'+
           ' '+oranumero(qryparcelamento.fieldbyname('PERCSEGURO').AsString)+' PERCSEGURO '+
           ' FROM CONTRIBPREVPARTP CPP ';
   sSqlWhereRegra :=  ' EXISTS (SELECT 1 FROM CONTPREV WHERE '+
                      ' IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
                      ' AND IDPLANOPREV = CPP.IDPLANOPREV AND FLGPARCELAMENTO = 1 )';



   sDescPreparo       := 'Quitação de financiamento.';
   if PreparaContribuicao( qryTitular.FieldByName('IdPessjur').AsInteger,
                           qryTitular.FieldByName('IdPlanoPrev').AsInteger,
                           prmIdMotivoQuitacao,
                           0,
                           qryaux,
                           qryAux2,
                           sSQL,
                           sSqlRegra,  
                           sSqlWhereRegra, 
                           'CPP', 
                           qryTitular.FieldByName('FlgInterno').AsString,
                           '01/'+Copy(sAnoMesInicio,6,2)+'/'+Copy(sAnoMesInicio,1,4),
                           '',
                           sDescPreparo,
                           'N' ,
                           '0',
                           False, 
                           False,
                           sMsgErro,
                           iIdLote,
                           rSalBase.text,
                           qryTitular.FieldByName('IdSitpart').AsString,
                           '',
                           True,
                           True,
                           sAnoMesInicio, 
                           False,
                           0,
                           '',
                           '',
                           0,0)  
   then begin
      MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;


   if not AtualizaDadosQuitaRefinancAmort(qryAux, qryparcelamento.fieldbyname('IDPARCELAMENTO').AsInteger,
                   qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                   qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                   qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                   qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                   sMsgErro )
   then
   begin
      MsgDlg('Ocorreu um erro na Quitação: '+sMsgErro,'Erro',mtError,[mbOk],0);
      dtmBaseDados.dbBaseDados.Rollback;
      Exit;
   end;


   if not AtualizaIdParcelamento(qryaux,
                                 dscontribuicao.dataset.fieldbyname('IDPESSJUR').AsInteger,
                                 dscontribuicao.dataset.fieldbyname('IDPLANOPREV').AsInteger,
                                 dscontribuicao.dataset.fieldbyname('IDPESSOA').AsInteger ,
                                 dscontribuicao.dataset.fieldbyname('SEQPROPOSTA').AsInteger) then
   begin
      MsgDlg('Ocorreu um erro na atualização das parcelas.','Erro',mtError,[mbOk],0);
      Exit;
   end;



   MostraDemonstrativo;


   tbDemons.TabVisible := true;
   tbFinanc.TabVisible := true;
   tbOpcoes.TabVisible := false;
   tbsGrid.TabVisible := false;
   pgctrlCobrancas.ActivePage := tbDemons;
   btnAntDemons.visible := false;




end;

procedure TfrmParcelamento.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction
  then  dtmBaseDados.dbBaseDados.Rollback;

  tbDemons.TabVisible := false;
  tbFinanc.TabVisible := True;
  tbOpcoes.TabVisible := false;
  tbsGrid.TabVisible := false;
  pgctrlCobrancas.ActivePage := tbFinanc;
  pnlhistorico.BringToFront;
  pnlAmortizacao.SendToBack;
  pnlcancelamento.SendToBack ;
  pnlQuitacao.SendToBack;
  stxtfinanc.Caption := 'Histórico de Parcelas';
  HabilitaBotoes(True);
end;





procedure TfrmParcelamento.btnAmortizaClick(Sender: TObject);
var nOpcoes, iIdLote : Integer;
    sSql , sSqlRegra , sSqlWhereRegra,
    sAnoMesInicio, sDescPreparo, sMsgErro :  String;

begin
  inherited;

   iIdLote := -1;


   if spnumpacelas.Value  <= 0 then
   begin
      MsgDlg('O número de parcelas deve ser selecionado. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   if strtofloat(clientenumero(rValorAmortiza.text)) <= 0 then
   begin
      MsgDlg('Valor de amortização inválido. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;


   if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.Rollback;
   dtmBaseDados.dbBaseDados.StartTransaction;

   sAnoMesInicio := Trim(spedAnoCob.Text);
   if cmbMesCob.ItemIndex <= 8
   then sAnoMesInicio  := sAnoMesInicio+'/'+'0'+IntToStr(cmbMesCob.ItemIndex+1)
   else sAnoMesInicio  := sAnoMesInicio+'/'+    IntToStr(cmbMesCob.ItemIndex+1);

   sSql := ' SELECT CPP.IDPESSJUR , CPP.IDPLANOPREV, CPP.IDPESSOA, CPP.IDCONTRIBUICAO, '+
           ' CPP.DATAINICIO, CPP.DATAFINAL, CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
           ' CPP.FLGDESCFOLHA, CPP.CODPORTFORMA, CPP.SEQPROPOSTA, '+
           ' TO_DATE('''+qryTitular.FieldByName('DATANASC').AsString+''',''DD/MM/YYYY'') DATANASC, '+
           ' '''+qryTitular.FieldByName('INSCRICAODATA').AsString+''' INSCRICAODATA  '+
           ' FROM CONTRIBPREVPARTP CPP '+
           ' WHERE CPP.IDPESSJUR = '+qryTitular.FieldByName('IdPessjur').AsString+' AND '+
           ' CPP.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' AND '+
           ' CPP.IDPESSOA = '+qryTitular.FieldByName('IdPessoa').AsString+' AND '+
           ' EXISTS (SELECT 1 FROM CONTPREV WHERE '+
           '         IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
           '         AND IDPLANOPREV = CPP.IDPLANOPREV AND FLGPARCELAMENTO = 1 )';

   sSqlRegra := ' SELECT CPP.IDPESSJUR , CPP.IDPLANOPREV, CPP.IDPESSOA, CPP.IDCONTRIBUICAO, '+
           ' CPP.DATAINICIO, CPP.DATAFINAL, CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
           ' CPP.FLGDESCFOLHA, CPP.CODPORTFORMA, CPP.SEQPROPOSTA, '+
           ' TO_DATE('''+qryTitular.FieldByName('DATANASC').AsString+''',''DD/MM/YYYY'') DATANASC, '+
           ' '''+qryTitular.FieldByName('INSCRICAODATA').AsString+''' INSCRICAODATA , '+
           ' '+oranumero(qryparcelamento.fieldbyname('SDODEVEDOR').AsString)+' VALORDIVIDA, '+
           ' '+oranumero(qryparcelamento.fieldbyname('VLRSALBASE').AsString)+' SALBASE, '+
           ' '+oranumero(qryparcelamento.fieldbyname('VLRPRIMPRESTACAO').AsString)+' VALORPRESTACAO ,  '+
           ' '+oranumero(qryparcelamento.fieldbyname('NUMPARCELAS').AsString)+' NMESES, '+
           ' '+oranumero(qryparcelamento.fieldbyname('PERCENTUAL').AsString)+' PERCENTUAL, '+
           ' 0 FLGQUITACAO, 0 SDODEVEDOR, '+
           ' 1 FLGAMORTIZA, '+oranumero(rValorAmortiza.text)+' VLRAMORTIZA, '+
           ' '+oranumero(qryparcelamento.fieldbyname('PERCSEGURO').AsString)+' PERCSEGURO '+
           ' FROM CONTRIBPREVPARTP CPP ';
   sSqlWhereRegra :=  ' EXISTS (SELECT 1 FROM CONTPREV WHERE '+
                      ' IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
                      ' AND IDPLANOPREV = CPP.IDPLANOPREV AND FLGPARCELAMENTO = 1 )';



   sDescPreparo       := 'Amortização de financiamento.';
   if PreparaContribuicao( qryTitular.FieldByName('IdPessjur').AsInteger,
                           qryTitular.FieldByName('IdPlanoPrev').AsInteger,
                           prmIdMotivoAmortiza,
                           0,
                           qryaux,
                           qryAux2,
                           sSQL,
                           sSqlRegra,  
                           sSqlWhereRegra, 
                           'CPP', 
                           qryTitular.FieldByName('FlgInterno').AsString,
                           '01/'+Copy(sAnoMesInicio,6,2)+'/'+Copy(sAnoMesInicio,1,4),
                           '',
                           sDescPreparo,
                           'N' ,
                           '0',
                           False, 
                           False,
                           sMsgErro,
                           iIdLote,
                           rSalBase.text,
                           qryTitular.FieldByName('IdSitpart').AsString,
                           '',
                           True,
                           True,
                           sAnoMesInicio, 
                           False,
                           0,
                           '',
                           '',
                           0,0)  
   then begin
      MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;


   if not AtualizaDadosQuitaRefinancAmort(qryAux, qryparcelamento.fieldbyname('IDPARCELAMENTO').AsInteger,
                   qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                   qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                   qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                   qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                   sMsgErro )
   then
   begin
      MsgDlg('Ocorreu um erro na Quitação: '+sMsgErro,'Erro',mtError,[mbOk],0);
      dtmBaseDados.dbBaseDados.Rollback;
      Exit;
   end;


   if not AtualizaIdParcelamento(qryaux,
                                 dscontribuicao.dataset.fieldbyname('IDPESSJUR').AsInteger,
                                 dscontribuicao.dataset.fieldbyname('IDPLANOPREV').AsInteger,
                                 dscontribuicao.dataset.fieldbyname('IDPESSOA').AsInteger ,
                                 dscontribuicao.dataset.fieldbyname('SEQPROPOSTA').AsInteger) then
   begin
      MsgDlg('Ocorreu um erro na atualização das parcelas.','Erro',mtError,[mbOk],0);
      Exit;
   end;



   MostraDemonstrativo;


   tbDemons.TabVisible := true;
   tbFinanc.TabVisible := true;
   tbOpcoes.TabVisible := false;
   tbsGrid.TabVisible := false;
   pgctrlCobrancas.ActivePage := tbDemons;
   btnAntDemons.visible := false;



end;



procedure TfrmParcelamento.btnCancelaAmortizaClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction
  then  dtmBaseDados.dbBaseDados.Rollback;

  tbDemons.TabVisible := false;
  tbFinanc.TabVisible := True;
  tbOpcoes.TabVisible := false;
  tbsGrid.TabVisible := false;
  pgctrlCobrancas.ActivePage := tbFinanc;
  pnlhistorico.BringToFront;
  pnlAmortizacao.SendToBack;
  pnlcancelamento.SendToBack ;
  pnlQuitacao.SendToBack;
  stxtfinanc.Caption := 'Histórico de Parcelas';
  HabilitaBotoes(true);
end;


function TfrmParcelamento.AtualizaDadosQuitaRefinancAmort( qryAux : TwwQuery;
                                piIdParcelamento,
                                piIdPessJur,   piIdPlanoPrev,
                                piIdPessoa ,   piSeqProposta : longint;
                                var sMsgErro : String   ) : Boolean;
var sSit, sParcGeradas : String;
begin
   result := false;

   if OpcaoCorrente =  oQuitacao then
   begin
      qryaux.close;
      qryaux.sql.text := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0 , DATAFINAL = TRUNC(SYSDATE) '+
                         ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJur)+
                         ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                         ' AND   IDPESSOA       = '+IntToStr(piIdPessoa)+
                         ' AND   SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                         ' AND   EXISTS (SELECT 1 FROM CONTPREV WHERE '+
                         '       IDCONTRIBUICAO = CONTRIBPREVPARTP.IDCONTRIBUICAO '+
                         '       AND IDPLANOPREV = CONTRIBPREVPARTP.IDPLANOPREV AND FLGPARCELAMENTO = 1 ) ';
      try
         qryaux.execsql;
      except
         sMsgErro := 'Atualização de contribuições associadas.';
         exit;
      end;
   end;


   case OpcaoCorrente of
      oQuitacao :
      begin
         sSit := '2';
         sParcGeradas := 'PARCGERADAS';
      end;
      oAmortiza :
      begin
         sSit := '0';
         sParcGeradas := ' PARCGERADAS + '+inttostr(spnumpacelas.value)+' ';
      end;
      oRefinanc :
      begin
         sSit := '6';
         sParcGeradas := 'PARCGERADAS';
      end;
   end;

   qryaux.close;
   qryaux.sql.text := ' UPDATE PARCELAMENTO SET SITPARCELAMENTO = '+sSit+', PARCGERADAS = '+sParcGeradas+' '+
                      ' WHERE IDPARCELAMENTO = '+qryParcelamento.fieldbyname('IDPARCELAMENTO').AsString+' ';
   try
      qryaux.execsql;
   except
      sMsgErro := 'Atualização do registro de parcelamento.';
      exit;
   end;

   result := true;
end;



procedure TfrmParcelamento.qryContribRefinancCalcFields(DataSet: TDataSet);
var iposbarra : Integer;
begin
  inherited;
  if qryContribRefinanc.FieldByName('FlgDescFolha').AsInteger = 1
  then qryContribRefinanc.FieldByName('TipoPgmto').AsString := 'Folha'
  else qryContribRefinanc.FieldByName('TipoPgmto').AsString := 'Banco';


  if (iIdCalculoDivida > 0) and ( not qryaux.isempty) then
  begin
     qryaux.first;
     while not qryaux.eof do
     begin
       iposbarra := pos('/',qryaux.fieldbyname('VALOR').AsString);
       if iposbarra > 0 then begin //Henrique Massão
         if qryContribRefinanc.fieldbyname('NUMRECEBIMENTO').AsInteger =
             StrToInt(copy(qryaux.fieldbyname('VALOR').AsString,1,iposbarra -1)) then begin
               if uppercase(copy(qryaux.fieldbyname('DESCRICAO').AsString,1,1)) = 'J' then
                  qryContribRefinanc.fieldbyname('JUROS').AsFloat := StrToFloat(clientenumero(copy(qryaux.fieldbyname('VALOR').AsString,iposbarra +1,
                                                                  length(qryaux.fieldbyname('VALOR').AsString) - iposbarra)))
               else if uppercase(copy(qryaux.fieldbyname('DESCRICAO').AsString,1,1)) = 'M' then
                  qryContribRefinanc.fieldbyname('MULTA').AsFloat := StrToFloat(clientenumero(copy(qryaux.fieldbyname('VALOR').AsString,iposbarra +1,
                                                                  length(qryaux.fieldbyname('VALOR').AsString) - iposbarra)))
               else if uppercase(copy(qryaux.fieldbyname('DESCRICAO').AsString,1,1)) = 'C' then
                  qryContribRefinanc.fieldbyname('CORRECAO').AsFloat := StrToFloat(clientenumero(copy(qryaux.fieldbyname('VALOR').AsString,iposbarra +1,
                                                                 length(qryaux.fieldbyname('VALOR').AsString) - iposbarra)));
         end;
       end;
       qryaux.next;
     end;//while

  end;
  
end;

procedure TfrmParcelamento.spnumpacelasChange(Sender: TObject);
begin
  inherited;

  if spnumpacelas.Value <= 0 then
  begin
      MsgDlg('O número de parcelas não pode ser menor que 1(um).','Erro de operação',mtError,[mbOk],0);
      rValorAmortiza.text := '0,00';
      Exit;
  end;

  if  spnumpacelas.Value >  strtoint(rParcelasaPagar.text) - 1 then
  begin
      MsgDlg('O número de parcelas não pode ser maior que '+inttostr(strtoint(rParcelasaPagar.text) - 1)+'.','Erro de operação',mtError,[mbOk],0);
      rValorAmortiza.text := '0,00';      
      Exit;
  end;

  rValorAmortiza.Text :=  FormatFloat('#0.00',
                          CalculaValorAmortiza( qryAux, qrytitular.fieldbyname('IDREGRAAMORTIZA').AsString,
                                   trim(spnumpacelas.Text),
                                   qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                   qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                   qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                                   qrytitular.fieldbyname('SEQPROPOSTA').AsInteger)) ;


end;

function TfrmParcelamento.CalculaValorAmortiza( qryAux : TwwQuery;
                                       sIdRegra, sNumParcelaAmortiza : String;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint ) : double;
var sSql : String;
    rValorRegra : double;
    sValorRegra   : string;
    bErro               : boolean;
begin
   result :=0;


   sSQL := ' SELECT '+IntToStr(piIdPessJur)+' IDPESSJUR, '+IntToStr(piIdPlanoPrev)+' IDPLANOPREV, '+
           ' '+IntToStr(piIdPessoa)+' IDPESSOA, 1 SEQPROPOSTA, '+
           ' '+oranumero(rSdoDevedorAtual.text)+' SDODEVEDOR, '+oranumero(rSalAtual.text)+' SALBASE, '+
           ' '+sNumParcelaAmortiza+' NUMPARCELASAMORTIZA, '+rParcelasaPagar.text+' NUMPARCAVENCER  ,'+
           ' ROWNUM NUMLINHA     '+
           ' FROM DUAL ';


   try
      sValorRegra := RegraNumerica(sIdRegra,sSQL, bErro, iIdCalculoGeral);

      rValorRegra := StrToFloat(ClienteNumero(sValorRegra));
   except
      MsgDlg('Erro ao executar regra de cálculo do Valor da amortização, No. '+sIdRegra,'Erro',mtError,[mbOk],0);
      Exit;
   end;


   qryaux.close;
   qryaux.sql.text := sSql;
   qryaux.open;


   Result := rValorRegra;

end;


function TfrmParcelamento.AtualizaIdParcelamento( qryAux : TwwQuery;
                                                  piIdPessJur,   piIdPlanoPrev,
                                                  piIdPessoa ,   piSeqProposta : longint ) : Boolean;
begin
   result := false;


   qryaux.close;
   qryaux.sql.text := ' UPDATE HSTCONTRIBPREV SET  IDPARCELAMENTO = '+inttostr(iIdParcelamento)+', PARCELA = 1 '+
                      ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJur)+
                      ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                      ' AND   IDPESSOA       = '+IntToStr(piIdPessoa)+
                      ' AND   SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                      ' AND EXISTS (SELECT 1 FROM CONTPREV WHERE '+
                      '         IDCONTRIBUICAO = HSTCONTRIBPREV.IDCONTRIBUICAO '+
                      '         AND IDPLANOPREV = HSTCONTRIBPREV.IDPLANOPREV '+
                      '         AND FLGPARCELAMENTO = 1 ) ';
   try
      qryaux.execsql;
   except
      exit;
   end;


   result := true;
end;


function TfrmParcelamento.VoltaSitRecebimento( qryAux : TwwQuery;
                                               piIdPessJur,   piIdPlanoPrev,
                                               piIdPessoa ,   piSeqProposta,
                                               piIdParcelamento : longint   ) : Boolean;
begin
   result := false;

   qryaux.close;
   qryaux.sql.text := ' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = ''3'', IDPARCELAMENTO = NULL '+
                      ' WHERE IDPESSJUR      = '+IntToStr(piIdPessJur)+
                      ' AND   IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                      ' AND   IDPESSOA       = '+IntToStr(piIdPessoa)+
                      ' AND   SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                      ' AND   SITRECEBIMENTO = ''7'' '+
                      ' AND   IDPARCELAMENTO = '+inttostr(piIdParcelamento)+'' ;

   try
      qryaux.execsql;
   except
      exit;
   end;


   result := true;
end;


procedure TfrmParcelamento.spnumpacelasClick(Sender: TObject);
begin
  inherited;
  if strtoint(spnumpacelas.text) <= spnumpacelas.MinValue then
  spnumpacelas.text := inttostr(spnumpacelas.MinValue);

  if strtoint(spnumpacelas.text) >= spnumpacelas.MaxValue then
  spnumpacelas.text := inttostr(spnumpacelas.MaxValue);
end;


function TfrmParcelamento.CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
var sResult : String;
    i ,iDif : Integer;
begin

   if  Length(trim(sEnt)) > nTam then
       sResult := copy(trim(sEnt),1,nTam)
   else
   begin
       iDif := abs(Length(trim(sEnt)) - nTam);
       sResult := trim(sEnt);

       if bDireita   then
       begin
          for i := 1 to iDif do
          sResult := sResult + sComp;
       end
       else
       begin
          for i := 1 to iDif do
          sResult := sComp + sResult;
       end;
   end;

   Result := sResult;

end;




function AtualizaRecebeParcela(qryaux : Twwquery;
                               sMescob, sIdPessjur , sIdPlanoPrev  : String ) : Boolean;
var qryloop : Twwquery;
begin

   try
      result := false;

      qryloop :=  twwquery.create(application);
      qryloop.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;

      //verifica registros não recebidos
      //para voltar número de parcelas geradas
      //no parcelamento
      //apenas os que não estão na tmpdesc, pois caso estivessem
      //foram tratados anteriormente
      qryloop.close;
      qryloop.sql.text := ' SELECT HST.IDPARCELAMENTO, HST.NUMRECEBIMENTO '+
                         '  FROM HSTCONTRIBPREV HST, PARCELAMENTO P '+
                         '  WHERE '+
                         '  HST.MESCOBRANCA = '''+sMescob+''' AND '+
                         '  HST.IDPESSJUR = '+sIdPessjur+' AND '+
                         '  HST.IDPLANOPREV = '+sIdPlanoPrev+' AND '+
                         '  P.SITPARCELAMENTO = 1 AND '+
                         '  NVL(HST.VALORRECEBIDO,0) <= 0 AND '+
                         '  NVL(HST.VALORESPERADO,0) > 0  AND '+
                         '  NOT EXISTS (SELECT 1 FROM TMPDESC WHERE '+
                         '              IDPESSJUR = HST.IDPESSJUR AND '+
                         '              IDPLANOPREV = HST.IDPLANOPREV AND '+
                         '              IDPESSOA = HST.IDPESSOA AND '+
                         '              IDDESCONTO = HST.IDCONTRIBUICAO AND '+
                         '              MESCOBRANCA = HST.MESCOBRANCA AND '+
                         '              MESREFERENCIA = HST.MESREFERENCIA ) ';
      try
         qryloop.open;
      except
         Exit;
      end;


      while not qryloop.eof do
      begin
         qryaux.close;
         qryaux.sql.text := ' UPDATE PARCELAMENTO SET PARCGERADAS = PARCGERADAS - 1 '+
                            ' WHERE IDPARCELAMENTO = '+qryaux.fieldbyname('IDPARCELAMENTO').AsString+' ';
         try
            qryaux.execsql;
         except
            exit;
         end;


         qryaux.close;
         qryaux.sql.text := 'DELETE HSTCONTRIBPREV '+
                         '  WHERE NUMRECEBIMENTO = '+qryaux.fieldbyname('NUMRECEBIMENTO').AsString+' AND '+
                         '  MESCOBRANCA = '''+sMescob+''' AND '+
                         '  IDPESSJUR = '+sIdPessjur+' AND '+
                         '  IDPLANOPREV = '+sIdPlanoPrev+' AND '+
                         '  IDPARCELAMENTO = '+qryaux.fieldbyname('IDPARCELAMENTO').AsString+' ';
         try
            qryaux.execsql;
         except
            exit;
         end;

         qryloop.next;
      end;

      Result := true;
   finally
      qryloop.free;
   end;

end;


function TfrmParcelamento.TrazDadosParcela( qryaux          : Twwquery;
                                            sIdPessjur      : string;
                                            sIdPlanoPrev    : string;
                                            sIdPessoa       : string;
                                        var sIdParcelamento : string;
                                        var sPercentual     : string;
                                        var sVlrDividaPart  : string;
                                        var sVlrDividaPatro : string;
                                        var sVlrPrestacao   : string;
                                        var sVlrSdoDevedor  : string;
                                        var sSalBaseAtual  : string;
                                        var iNumProxParc : Integer) : boolean;
var iNumParcelas : Integer;                                        
begin
   Result := false;
   qryaux.close;
   qryaux.sql.text := '  SELECT P.IDPARCELAMENTO,   P.NUMPARCELAS,  P.PARCPAGAS,   P.PARCGERADAS,   '+
                      '         P.VLRPRIMPRESTACAO, P.PERCENTUAL,   P.VLRSALBASE , P.VLRDIVIDAPART, '+
                      '         P.VLRDIVIDAPATRO,   P.SDODEVEDOR,   P.PERCSEGURO ,            '+
                      '         P.IDPESSOA, P.IDPESSJUR, P.IDPLANOPREV , P.SEQPROPOSTA, '+
                      '         PL.IDREGRASDODEVEDOR, PL.IDREGRASALPARCELA                    '+
                      '  FROM   PARCELAMENTO P, PLANPREV PL                                   '+
                      '  WHERE  P.IDPESSJUR       = '+sIdPessjur                               +
                      '  AND    P.IDPLANOPREV     = '+sIdPlanoPrev                             +
                      '  AND    P.IDPESSOA        = '+sIdPessoa                                +
                      '  AND    P.SITPARCELAMENTO = 1                                         '+
                      '  AND    PL.IDPLANOPREV = P.IDPLANOPREV                                '+
                      '  ORDER BY P.DATAINICIO DESC                                           ';
   try
      qryaux.open;
   except
      Exit;
   end;
   if not qryAux.IsEmpty
   then begin
      sIdParcelamento := qryAux.FieldByName('IDPARCELAMENTO').AsString;
      sPercentual     := oranumero(qryAux.FieldByName('PERCENTUAL').AsString);
      sVlrDividaPart  := oranumero(qryAux.FieldByName('VLRDIVIDAPART').AsString);
      sVlrDividaPatro := oranumero(qryAux.FieldByName('VLRDIVIDAPATRO').AsString);
      sVlrPrestacao   := oranumero(qryAux.FieldByName('VLRPRIMPRESTACAO').AsString);
      sVlrSdoDevedor  := oranumero(qryAux.FieldByName('SDODEVEDOR').AsString);
      iNumParcelas    := qryAux.FieldByName('NUMPARCELAS').AsInteger;


      sSalBaseAtual := oranumero(floattostr(frmparcelamento.CalculaSalario( qryAux,
                                     qryAux.fieldbyname('IDREGRASALPARCELA').AsString,
                                     qryAux.fieldbyname('IDPESSJUR').AsInteger,
                                     qryAux.fieldbyname('IDPLANOPREV').AsInteger,
                                     qryAux.fieldbyname('IDPESSOA').AsInteger ,
                                     qryAux.fieldbyname('SEQPROPOSTA').AsInteger ))) ;

      sVlrSdoDevedor := oranumero(floattostr(frmparcelamento.CalculaSdoDevedor( qryAux,
                                     qryAux.fieldbyname('IDREGRASDODEVEDOR').AsString,
                                     sSalBaseAtual , sPercentual,
                                     qryAux.fieldbyname('IDPESSJUR').AsInteger,
                                     qryAux.fieldbyname('IDPLANOPREV').AsInteger,
                                     qryAux.fieldbyname('IDPESSOA').AsInteger ,
                                     qryAux.fieldbyname('SEQPROPOSTA').AsInteger,
                                     inttostr(qryAux.fieldbyname('NUMPARCELAS').AsInteger - qryAux.fieldbyname('PARCPAGAS').AsInteger )))) ;


      iNumProxParc := strtoint(VoltaNumParcelasAPagar( qryAux,
                              qryAux.fieldbyname('IDPESSJUR').AsInteger,
                              qryAux.fieldbyname('IDPLANOPREV').AsInteger,
                              qryAux.fieldbyname('IDPESSOA').AsInteger ,
                              qryAux.fieldbyname('SEQPROPOSTA').AsInteger, sIdParcelamento,
                              iNumParcelas ));


   end
   else begin

      sIdParcelamento := ''; 

      sPercentual     := '0';
      sVlrDividaPart  := '0';
      sVlrDividaPatro := '0';
      sVlrPrestacao   := '0';
      sVlrSdoDevedor  := '0';
      sSalBaseAtual   := '0';
   end;




   Result := not qryAux.IsEmpty;
end;


function TfrmParcelamento.CalculaTpCarencia( qryAux : TwwQuery;
                                       sIdRegra: String;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint) : double;
var sSql, sValorRegra : String;
    bErro               : boolean;
    rValorRegra   : Double;
    sDataRef : string;           //edilaine - SIG83201
begin
   result :=0;

   qryaux.close;
   qryaux.sql.text := ' SELECT NVL(SUM(TPCOMPRACARENCIA),0) SOMA '+
                      ' FROM PARCELAMENTO '+
                      ' WHERE IDPESSJUR = '+IntToStr(piIdPessJur)+' '+
                      ' AND IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' '+
                      ' AND IDPESSOA = '+IntToStr(piIdPessoa)+' '+
                      ' AND TPCOMPRACARENCIA IS NOT NULL '+
                      ' AND SITPARCELAMENTO <> 5 ';
   qryaux.open;

   //edilaine - SIG83201 - inicio
   sDataRef := FormatDateTime('dd/mm/yyyy', Date);
   if (bCompraCarencia) and (qryTitular.FieldByName('DataDemissao').AsString <> '') then
      sDataRef := qryTitular.FieldByName('DataDemissao').AsString;
   //edilaine - SIG83201 - fim

   sSQL := ' SELECT  '+IntToStr(piIdPessJur)+' IDPESSJUR, '+IntToStr(piIdPlanoPrev)+' IDPLANOPREV, '+
           ' '+IntToStr(piIdPessoa)+' IDPESSOA ,  '+
           //''''+FormatDateTime('dd/mm/yyyy', Date)+''' AS DATAREF  ,'+       //edilaine - SIG83201
           Quotedstr(sDataRef)+'  AS DATAREF, '+                               //edilaine - SIG83201
           ' '+qryaux.fieldbyname('SOMA').AsString+' MESESCOMPRADOS   '+
           ' FROM  DUAL ';

   try
      sValorRegra := RegraNumerica(sIdRegra,sSQL, bErro, iIdCalculoGeral);

      rValorRegra := StrToFloat(ClienteNumero(sValorRegra));
   except
      MsgDlg('Erro ao executar regra de cálculo tempo de carência, No. '+sIdRegra,'Erro',mtError,[mbOk],0);
      Exit;
   end;


   Result := rValorRegra;

end;


procedure TfrmParcelamento.spCarenciaChange(Sender: TObject);
var sValorbase1Part,sValorbase2Part, sValorbase3Part,
    sValorbase1Patro, sValorbase2Patro, sValorbase3Patro : String;
begin
  inherited;
  if spCarencia.value > spCarencia.maxvalue then
     spCarencia.value := spCarencia.maxvalue;

  if spCarencia.value < spCarencia.minvalue then
     spCarencia.value := spCarencia.minvalue;

  //cálculo dos valores do total de caência e das partes
  //patrocinadora e participante
  sValorBase1Patro := '0';
  sValorBase2Patro := '0';
  sValorBase3Patro := '0';
  sValorBase1Part := '0';
  sValorBase2Part := '0';
  sValorBase3Part := '0';

  qryopcoescontrib.first;
  while not qryopcoescontrib.eof do
  begin
     if qryopcoescontrib.fieldbyname('FLGPAGADOR').AsString = 'P' then
     begin
        sValorBase1Patro := qryopcoescontrib.fieldbyname('VALORBASE1').AsString;
        sValorBase2Patro := qryopcoescontrib.fieldbyname('VALORBASE2').AsString;
        sValorBase3Patro := qryopcoescontrib.fieldbyname('VALORBASE3').AsString;
     end
     else
     begin
        sValorBase1Part := qryopcoescontrib.fieldbyname('VALORBASE1').AsString;
        sValorBase2Part := qryopcoescontrib.fieldbyname('VALORBASE2').AsString;
        sValorBase3Part := qryopcoescontrib.fieldbyname('VALORBASE3').AsString;
     end;


     qryopcoescontrib.next;
  end;
  qryopcoescontrib.first;

  //Taffarel - SIG67010.68619 - início
  if trim(qrytitular.fieldbyname('IDRGCARENCIAPART').AsString) = '' then
  begin
     MsgDlg('Regra de cálculo da carência parte participante não associada. Verificar cadastro.','Erro',mtError,[mbOk],0);
     Exit;
  end
  else  edParticipante.text := FloatToStr(CalculaCarenciaPart( qryAux,
                              qrytitular.fieldbyname('IDRGCARENCIAPART').AsString,
                              qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                              qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                              qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                              qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                              sValorbase1Part,sValorbase2Part, sValorbase3Part,
                              sValorbase1Patro, sValorbase2Patro, sValorbase3Patro ));
   //Taffarel - SIG67010.68619 - fim

  if trim(qrytitular.fieldbyname('IDRGTOTCARENCIA').AsString) = '' then
  begin
     MsgDlg('Regra de cálculo da carência parte patrocinadora não associada. Verificar cadastro.','Erro',mtError,[mbOk],0);
     Exit;
  end
  else  edPatrocinadora.text := FloatToStr(CalculaCarenciaPatro( qryAux,
                              qrytitular.fieldbyname('IDRGCARENCIAPATRO').AsString,
                              qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                              qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                              qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                              qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                              sValorbase1Part,sValorbase2Part, sValorbase3Part,
                              sValorbase1Patro, sValorbase2Patro, sValorbase3Patro ));

   //Taffarel - SIG67010.68619 - início
  {if trim(qrytitular.fieldbyname('IDRGCARENCIAPART').AsString) = '' then
  begin
     MsgDlg('Regra de cálculo da carência parte participante não associada. Verificar cadastro.','Erro',mtError,[mbOk],0);
     Exit;
  end
  else  edParticipante.text := FloatToStr(CalculaCarenciaPart( qryAux,
                              qrytitular.fieldbyname('IDRGCARENCIAPART').AsString,
                              qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                              qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                              qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                              qrytitular.fieldbyname('SEQPROPOSTA').AsInteger,
                              sValorbase1Part,sValorbase2Part, sValorbase3Part,
                              sValorbase1Patro, sValorbase2Patro, sValorbase3Patro ));}
   //Taffarel - SIG67010.68619 - fim

  if trim(qrytitular.fieldbyname('IDRGCARENCIAPART').AsString) = '' then
  begin
     MsgDlg('Regra de cálculo do total da carência não associada. Verificar cadastro.','Erro',mtError,[mbOk],0);
     Exit;
  end
  else
  edTotalCarencia.text := FloatToStr(CalculaTotalCarencia( qryAux,
                              qrytitular.fieldbyname('IDRGTOTCARENCIA').AsString,
                              qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                              qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                              qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                              qrytitular.fieldbyname('SEQPROPOSTA').AsInteger ));


  if ((strtofloat(clientenumero(edTotalCarencia.text))*100/strtofloat(clientenumero(redSalAtual.text))) > prmPercMaxDesc) or
     ((strtofloat(clientenumero(edTotalCarencia.text))*100/strtofloat(clientenumero(redSalAtual.text))) < prmPercMinDesc) then
  begin
  //   chkFlgDecsFolhaCarencia.enabled :=false;
  //   chkFlgDecsFolhaCarencia.ItemIndex := 1;
  end
  else
  begin
  //   chkFlgDecsFolhaCarencia.enabled := true;
  //   chkFlgDecsFolhaCarencia.ItemIndex := 0;
  end;



end;


function TfrmParcelamento.CalculaTotalCarencia( qryAux : TwwQuery;
                                       sIdRegra: String;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint) : double;
var sSql, sValorRegra : String;
    bErro               : boolean;
    rValorRegra   : Double;
    sDataRef      : string;                //edilaine - SIG83201
begin
   result :=0;

   //edilaine - SIG83201 - inicio
   sDataRef := FormatDateTime('dd/mm/yyyy', Date);
   if (bCompraCarencia) and (qryTitular.FieldByName('DataDemissao').AsString <> '') then
      sDataRef := qryTitular.FieldByName('DataDemissao').AsString;
   //edilaine - SIG83201 - fim

   sSQL := ' SELECT  '+IntToStr(piIdPessJur)+' IDPESSJUR, '+IntToStr(piIdPlanoPrev)+' IDPLANOPREV, '+
           ' '+IntToStr(piIdPessoa)+' IDPESSOA , '+IntToStr(piSeqProposta)+' SEQPROPOSTA , '+
           ' '+oranumero(edParticipante.text)+' VALORPART,  '+oranumero(edPatrocinadora.text)+' VALORPATRO,  '+
           ' '+IntToStr(spCarencia.value)+' NMESES,   '+oranumero(redSalAtual.text)+' SALATUAL, '+
           //' ''' + FormatDateTime('dd/mm/yyyy', Date) + ''' AS DATAREF '+  //edilaine - SIG83201
           Quotedstr(sDataRef)+' AS DATAREF '+                               //edilaine - SIG83201
           ' FROM  DUAL ';

   try
      sValorRegra := RegraNumerica(sIdRegra,sSQL, bErro, iIdCalculoGeral);

      rValorRegra := StrToFloat(ClienteNumero(sValorRegra));
   except
      MsgDlg('Erro ao executar regra de cálculo do total da carência, No. '+sIdRegra,'Erro',mtError,[mbOk],0);
      Exit;
   end;


   Result := rValorRegra;

end;


function TfrmParcelamento.CalculaCarenciaPart( qryAux : TwwQuery;
                                       sIdRegra: String;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint;
                                       sValorbase1Part,sValorbase2Part, sValorbase3Part,
                                       sValorbase1Patro, sValorbase2Patro, sValorbase3Patro : String) : double;
var sSql, sValorRegra : String;
    bErro               : boolean;
    rValorRegra   : Double;
    sDataRef      : string;                //edilaine - SIG83201
begin
   result :=0;

   //edilaine - SIG83201 - inicio
   sDataRef := FormatDateTime('dd/mm/yyyy', Date);
   if (bCompraCarencia) and (qryTitular.FieldByName('DataDemissao').AsString <> '') then
      sDataRef := qryTitular.FieldByName('DataDemissao').AsString;
   //edilaine - SIG83201 - fim

   sSQL := ' SELECT  '+IntToStr(piIdPessJur)+' IDPESSJUR, '+IntToStr(piIdPlanoPrev)+' IDPLANOPREV, '+
           ' '+IntToStr(piIdPessoa)+' IDPESSOA , '+IntToStr(piSeqProposta)+' SEQPROPOSTA , '+
           ' '+IntToStr(spCarencia.value)+' NMESES,   '+oranumero(redSalAtual.text)+' SALATUAL, '+
           ' NVL('+oranumero(sValorbase1Part)+',0) VALORBASE1PART, '+
           ' NVL('+oranumero(sValorbase2Part)+',0) VALORBASE2PART, '+
           ' NVL('+oranumero(sValorbase3Part)+',0) VALORBASE3PART,  '+
           ' NVL('+oranumero(sValorbase1Patro)+',0) VALORBASE1PATRO,  '+
           ' NVL('+oranumero(sValorbase2Patro)+',0) VALORBASE2PATRO,  '+
           ' NVL('+oranumero(sValorbase3Patro)+',0) VALORBASE3PATRO,  '+
           //'''' + FormatDateTime('dd/mm/yyyy', Date)+''' AS DATAREF '+     //edilaine - SIG83201
           Quotedstr(sDataRef)+' AS DATAREF '+                               //edilaine - SIG83201
           ' FROM  DUAL ';

   try
      sValorRegra := RegraNumerica(sIdRegra,sSQL, bErro, iIdCalculoGeral);

      rValorRegra := StrToFloat(ClienteNumero(sValorRegra));
   except
      MsgDlg('Erro ao executar regra de cálculo da parte participante, No. '+sIdRegra,'Erro',mtError,[mbOk],0);
      Exit;
   end;


   Result := rValorRegra;

end;


function TfrmParcelamento.CalculaCarenciaPatro( qryAux : TwwQuery;
                                       sIdRegra: String;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint;
                                       sValorbase1Part,sValorbase2Part, sValorbase3Part,
                                       sValorbase1Patro, sValorbase2Patro, sValorbase3Patro : String) : double;
var sSql, sValorRegra : String;
    bErro               : boolean;
    rValorRegra   : Double;
    sDataRef      : string;                //edilaine - SIG83201
begin
   result :=0;

   //edilaine - SIG83201 - inicio
   sDataRef := FormatDateTime('dd/mm/yyyy', Date);
   if (bCompraCarencia) and (qryTitular.FieldByName('DataDemissao').AsString <> '') then
      sDataRef := qryTitular.FieldByName('DataDemissao').AsString;
   //edilaine - SIG83201 - fim


   sSQL := ' SELECT  '+IntToStr(piIdPessJur)+' IDPESSJUR, '+IntToStr(piIdPlanoPrev)+' IDPLANOPREV, '+
           ' '+IntToStr(piIdPessoa)+' IDPESSOA , '+IntToStr(piSeqProposta)+' SEQPROPOSTA , '+
           ' '+IntToStr(spCarencia.value)+' NMESES,   '+oranumero(redSalAtual.text)+' SALATUAL, '+
           ' NVL('+oranumero(sValorbase1Part)+',0) VALORBASE1PART, '+
           ' NVL('+oranumero(sValorbase2Part)+',0) VALORBASE2PART, '+
           ' NVL('+oranumero(sValorbase3Part)+',0) VALORBASE3PART,  '+
           ' NVL('+oranumero(sValorbase1Patro)+',0) VALORBASE1PATRO,  '+
           ' NVL('+oranumero(sValorbase2Patro)+',0) VALORBASE2PATRO,  '+
           ' NVL('+oranumero(sValorbase3Patro)+',0) VALORBASE3PATRO,  '+
           //edilaine - SIG83201 - inicio
           //'''' + FormatDateTime('dd/mm/yyyy', Date)+''' AS DATAREF '+     //edilaine - SIG83201
           Quotedstr(sDataRef)+' AS DATAREF '+                               //edilaine - SIG83201
           ' FROM  DUAL ';

   try
      sValorRegra := RegraNumerica(sIdRegra,sSQL, bErro, iIdCalculoGeral);

      rValorRegra := StrToFloat(ClienteNumero(sValorRegra));
   except
      MsgDlg('Erro ao executar regra de cálculo da parte patrocinadora, No. '+sIdRegra,'Erro',mtError,[mbOk],0);
      Exit;
   end;


   Result := rValorRegra;

end;

procedure TfrmParcelamento.BitBtn8Click(Sender: TObject);
begin
  inherited;
  bParcelaCarencia := False;

  if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.Rollback;
  dtmBaseDados.dbBaseDados.StartTransaction;

  if (strtofloat(clientenumero(edCarenciaMeses.text)) <=0) or
     (strtofloat(clientenumero(spCarencia.text)) <=0) or
     (strtofloat(clientenumero(edTotalCarencia.text)) <=0)  then
  begin
     MsgDlg('Informações incoerentes, como: número de parcelas, total de carência. Verificar.','Erro',mtError,[mbOk],0);
     Exit;
  end;


  //verifica se a contribuição para compra de carência foi cadastrada
  qryaux.close;
  qryaux.sql.text := ' SELECT 1 '+
                     ' FROM CONTPREV CT '+
                     ' WHERE CT.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' '+
                     ' AND CT.FLGCARENCIA = 1 ';
  qryaux.open;

  if qryaux.isempty then
  begin
     MsgDlg('A contribuição para compra de carência não foi encontrada no sistema. Verificar cadastro.','Erro',mtError,[mbOk],0);
     Exit;
  end;


  //if chkFlgDecsFolhaCarencia.itemindex = 0 then
  //sFlgDescFolha := '1'
  //else  sFlgDescFolha := '0';

  if not AssociarContribuicoesCarencia(qryaux) then
  begin
     MsgDlg('Ocorreu um erro na associação de contribuições.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  if not CalcContribuicoesCarencia(qryaux) then
  begin
     MsgDlg('Ocorreu um erro no cálculo de contribuições.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  if not SetIdParcelamentoCarencia then
  begin
     MsgDlg('Ocorreu um erro na inserção do parcelamento.','Erro',mtError,[mbOk],0);
     Exit;
  end;


end;

function TfrmParcelamento.AssociarContribuicoesCarencia(qryaux : twwquery) : Boolean;
begin
   result := false;


   qryaux.close;
   qryaux.sql.text := ' INSERT INTO CONTRIBPREVPARTP(IDPESSOA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                      '             CODPORTFORMA,DIAVENCIMENTO,FLGDESCFOLHA, FLGCOBRA, VALORBASE1,VALORBASE2,VALORBASE3, '+
                      '             QTDEPARCELAS, FLGRETROATIVO,FLGRECALCULA,DATAINICIO,DATAFINAL,IDTPPERIODICIDADE) '+
                      ' SELECT '+qrytitular.fieldbyname('IDPESSOA').AsString+' IDPESSOA, '+
                      ' '+qrytitular.fieldbyname('IDPESSJUR').AsString+' IDPESSJUR, '+
                      ' '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' IDPLANOPREV, '+
                      ' C.IDCONTRIBUICAO, NULL ,0,'''+sFlgDescFolha+''', '+
                      ' 1, NULL,NULL,NULL, NULL, 0, 0,TRUNC(SYSDATE),NULL,C.IDTPPERIODICIDADE '+
                      ' FROM CONTPREV CT , CONTRIBUICAO C  '+
                      ' WHERE CT.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' '+
                      ' AND C.IDCONTRIBUICAO = CT.IDCONTRIBUICAO '+
                      ' AND CT.FLGCARENCIA = 1 '+
                      ' AND NOT EXISTS (SELECT 1 FROM CONTRIBPREVPARTP '+
                      '                 WHERE IDPESSJUR = '+qrytitular.fieldbyname('IDPESSJUR').AsString+' '+
                      '                 AND IDPLANOPREV = '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' '+
                      '                 AND IDPESSOA = '+qrytitular.fieldbyname('IDPESSOA').AsString+' '+
                      '                 AND IDCONTRIBUICAO = C.IDCONTRIBUICAO) ';
   try
      qryaux.execsql;
   except
      exit;
   end;



   {caso o participante já tenha estas contribuições associadas}
   qryaux.close;
   qryaux.sql.text := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1,  FLGDESCFOLHA = '''+sFlgDescFolha+''' '+
                      ' WHERE IDPESSOA =  '+qrytitular.fieldbyname('IDPESSOA').AsString+' '+
                      ' AND IDPESSJUR = '+qrytitular.fieldbyname('IDPESSJUR').AsString+' '+
                      ' AND IDPLANOPREV = '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' '+
                      ' AND EXISTS (SELECT 1 FROM CONTPREV CT '+
                      '             WHERE CT.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' '+
                      '             AND CT.IDCONTRIBUICAO = CONTRIBPREVPARTP.IDCONTRIBUICAO '+
                      '             AND CT.FLGCARENCIA = 1) ';
   try
      qryaux.execsql;
   except
      exit;
   end;


   // Chamar cadastro de contribuicao do participante
   frmCadContribParticipante := TfrmCadContribParticipante.Create(Application);
   frmCadContribParticipante.sbtnProcurar.visible := false;
   frmCadContribParticipante.AssociaContrib(qrytitular.fieldbyname('NOME').AsString,
                                            qrytitular.fieldbyname('NOMEPATRO').AsString,
                                            qrytitular.fieldbyname('NOMEPLANO').AsString,
                                            FormatDateTime('dd/mm/yyyy', Date),
                                            qrytitular.fieldbyname('IDPESSOA').AsInteger,
                                            qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                            qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                            qrytitular.fieldbyname('SEQPROPOSTA').AsInteger, False);
   frmCadContribParticipante.Free;

   if MsgDlg(' Deseja confirmar Opções das Contribuições e a Associação de Contribuições ao Participante ? ',
             'Confirmação', mtconfirmation, [mbYes,mbNo],0) = mrNo
   then begin
      Exit;
   end;


   result := true;
end;


// XAVIER
function TfrmParcelamento.DesfazassociacaoContribCarencia(qryaux : twwquery) : Boolean;
begin
   result := false;

   qryaux.close;
   qryaux.sql.text := ' DELETE FROM CONTRIBPREVPARTP'+
                      ' WHERE  EXISTS  (SELECT 1 '+
                                      ' FROM CONTPREV CT , CONTRIBUICAO C '+
                                      ' WHERE CT.IDPLANOPREV   = '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' '+
                                      ' AND   C.IDCONTRIBUICAO = CT.IDCONTRIBUICAO '+
                                      ' AND   CT.FLGCARENCIA   = 1 '+
                                      ' AND   EXISTS   (SELECT 1 FROM CONTRIBPREVPARTP '+
                                      '                 WHERE IDPESSJUR = '+qrytitular.fieldbyname('IDPESSJUR').AsString+' '+
                                      '                 AND IDPLANOPREV = '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' '+
                                      '                 AND IDPESSOA    = '+qrytitular.fieldbyname('IDPESSOA').AsString+' '+
                                      '                 AND IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
                      ' AND    IDPESSJUR   = '+qrytitular.fieldbyname('IDPESSJUR').AsString+' '+
                      ' AND    IDPLANOPREV = '+qrytitular.fieldbyname('IDPLANOPREV').AsString+' '+
                      ' AND    IDPESSOA    = '+qrytitular.fieldbyname('IDPESSOA').AsString+ ' )';

   try
      qryaux.execsql;
   except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
   end;
   // Chamar cadastro de contribuicao do participante e desfazer     - caso continue daando manutenção no cadastro verificar o que passar nos parametros
  { frmCadContribParticipante := TfrmCadContribParticipante.Create(Application);
   frmCadContribParticipante.sbtnProcurar.visible := false;
   frmCadContribParticipante.AssociaContrib(qrytitular.fieldbyname('NOME').AsString,
                                            qrytitular.fieldbyname('NOMEPATRO').AsString,
                                            qrytitular.fieldbyname('NOMEPLANO').AsString,
                                            FormatDateTime('dd/mm/yyyy', Date),
                                            qrytitular.fieldbyname('IDPESSOA').AsInteger,
                                            qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                                            qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                                            qrytitular.fieldbyname('SEQPROPOSTA').AsInteger, False);
   frmCadContribParticipante.Free;}

   // deve se fazer a pergunta ?
   if MsgDlg(' Deseja Desfazer as Opções das Contribuições e a Associação de Contribuições ao Participante ? ',
             'Confirmação', mtconfirmation, [mbYes,mbNo],0) = mrNo
   then begin
      Exit;
   end;


   result := true;
end;

// XAVIER

procedure TfrmParcelamento.BitBtn7Click(Sender: TObject);
begin
  inherited;
  bParcelaCarencia := True;

  if (strtofloat(clientenumero(edCarenciaMeses.text)) <=0) or
     (strtofloat(clientenumero(spCarencia.text)) <=0) or
     (strtofloat(clientenumero(edTotalCarencia.text)) <=0)  then
  begin
     MsgDlg('Informações incoerentes, como: número de parcelas, total de carência. Verificar.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  //if chkFlgDecsFolhaCarencia.itemindex = 0 then
  //sFlgDescFolha := '1'
  //else  sFlgDescFolha := '0';

  if not AssociarContribuicoesCarencia(qryaux) then
  begin
     MsgDlg('Ocorreu um erro na associação de contribuições.','Erro',mtError,[mbOk],0);
     Exit;
  end;


  if not CalcContribuicoesCarencia(qryaux) then
  begin
     MsgDlg('Ocorreu um erro no cálculo de contribuições.','Erro',mtError,[mbOk],0);
     Exit;
  end;


  if not SetIdParcelamentoCarencia then
  begin
     MsgDlg('Ocorreu um erro na inserção do parcelamento.','Erro',mtError,[mbOk],0);
     Exit;
  end;


end;

function TfrmParcelamento.CalcContribuicoesCarencia(qryaux : twwquery) : Boolean;
var    sAnoMesInicio,  sDescPreparo, sMsgErro, sSql, sSqlRegra, sSqlWhereRegra :  String;
       iIdLote : Integer;
begin
   result := false;
   iIdLote := -1;


   sAnoMesInicio := Trim(spedAnoCobCarencia.Text);
   if cmbMesCobCarencia.ItemIndex <= 8
   then sAnoMesInicio  := sAnoMesInicio+'/'+'0'+IntToStr(cmbMesCobCarencia.ItemIndex+1)
   else sAnoMesInicio  := sAnoMesInicio+'/'+    IntToStr(cmbMesCobCarencia.ItemIndex+1);

   sSql := ' SELECT CPP.IDPESSJUR , CPP.IDPLANOPREV, CPP.IDPESSOA, CPP.IDCONTRIBUICAO, '+
           ' CPP.DATAINICIO, CPP.DATAFINAL, CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
           ' CPP.FLGDESCFOLHA, CPP.CODPORTFORMA, CPP.SEQPROPOSTA, '+
           ' TO_DATE('''+qryTitular.FieldByName('DATANASC').AsString+''',''DD/MM/YYYY'') DATANASC, '+
           ' '''+qryTitular.FieldByName('INSCRICAODATA').AsString+''' INSCRICAODATA  '+
           ' FROM CONTRIBPREVPARTP CPP '+
           ' WHERE CPP.IDPESSJUR = '+qryTitular.FieldByName('IdPessjur').AsString+' AND '+
           ' CPP.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' AND '+
           ' CPP.IDPESSOA = '+qryTitular.FieldByName('IdPessoa').AsString+' AND '+
           ' EXISTS (SELECT 1 FROM CONTPREV WHERE '+
           '         IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
           '         AND IDPLANOPREV = CPP.IDPLANOPREV AND FLGCARENCIA = 1 )';

   sSqlRegra := ' SELECT CPP.IDPESSJUR , CPP.IDPLANOPREV, CPP.IDPESSOA, CPP.IDCONTRIBUICAO, '+
           ' CPP.DATAINICIO, CPP.DATAFINAL, CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
           ' CPP.FLGDESCFOLHA, CPP.CODPORTFORMA, CPP.SEQPROPOSTA, '+
           ' TO_DATE('''+qryTitular.FieldByName('DATANASC').AsString+''',''DD/MM/YYYY'') DATANASC, '+
           ' '''+qryTitular.FieldByName('INSCRICAODATA').AsString+''' INSCRICAODATA , '+
           ' '+oranumero(edTotalCarencia.text)+' VALORCARENCIA, '+oranumero(redSalAtual.text)+' SALBASE, '+
           ' '+oranumero(spCarencia.text)+' NMESES, '+
           '''' + FormatDateTime('dd/mm/yyyy', Date) + ''' AS DATAREF '+
           ' ,CPP.VALORBASE1 AS VALORBASE1PART, CPP.VALORBASE2 AS VALORBASE2PART, CPP.VALORBASE3 AS VALORBASE3PART ' + //Taffarel - SIG73701
           ' FROM CONTRIBPREVPARTP CPP ';

   sSqlWhereRegra :=  ' EXISTS (SELECT 1 FROM CONTPREV WHERE '+
                      ' IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
                      ' AND IDPLANOPREV = CPP.IDPLANOPREV AND FLGCARENCIA = 1 )';



   sDescPreparo       := 'Cobrança de cp. de carência.';
   if PreparaContribuicao( qryTitular.FieldByName('IdPessjur').AsInteger,
                           qryTitular.FieldByName('IdPlanoPrev').AsInteger,
                           prmIdMotivoCarencia,
                           0,
                           qryaux,
                           qryAux2,
                           sSQL,
                           sSqlRegra,  
                           sSqlWhereRegra, 
                           'CPP', 
                           qryTitular.FieldByName('FlgInterno').AsString,
                           '01/'+Copy(sAnoMesInicio,6,2)+'/'+Copy(sAnoMesInicio,1,4),
                           '',
                           sDescPreparo,
                           'N' ,
                           '0',
                           False, 
                           False,
                           sMsgErro,
                           iIdLote,
                           rSalBase.text,
                           qryTitular.FieldByName('IdSitpart').AsString,
                           '',
                           True,
                           True,
                           sAnoMesInicio, 
                           False,
                           0,
                           '',
                           '',
                           0,0)  
   then begin
      MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;


   MostraDemonstrativo;


   tbDemons.TabVisible := true;
   tbFinanc.TabVisible := false;
   tbOpcoes.TabVisible := false;
   tbsGrid.TabVisible := false;
   pgctrlCobrancas.ActivePage := tbDemons;
   btnAntDemons.visible := false;
   tbCpCarencia.TabVisible := true;
   tbcpcarencia.enabled := true;   

   result := true;
end;


function TfrmParcelamento.SetIdParcelamentoCarencia : Boolean;
var sFlgDescFolha : String;
begin
   result := false;


   //if chkFlgDecsFolhaCarencia.itemindex = 0 then
   //sFlgDescFolha := '1'
   //else  sFlgDescFolha := '0';

   qryaux.close;
   qryaux.sql.text := ' SELECT NVL(MAX(IDPARCELAMENTO) + 1,1) ID FROM PARCELAMENTO ';
   try
      qryaux.open;
      iIdParcelamento := qryaux.fieldbyname('ID').AsInteger;
   except
      exit;
   end;


   qryaux.close;
   qryaux.sql.text := ' INSERT INTO PARCELAMENTO(IDPARCELAMENTO,   IDPESSJUR	,   IDPLANOPREV	,   IDPESSOA, '+
                      ' FLGDESCFOLHA	,   NUMPARCELAS	,   PARCPAGAS,   PARCGERADAS,   VLRPRIMPRESTACAO, '+
                      ' PERCENTUAL,   VLRSALBASE ,   SITPARCELAMENTO,    DATAINICIO,   DATACANCELAMENTO, '+
                      ' MOTIVOCANCEL,   IDCALCULOREGRA ,   VLRDIVIDAPART ,   VLRDIVIDAPATRO , '+
                      ' SDODEVEDOR, TPCOMPRACARENCIA ) '+
                      ' SELECT '+inttostr(iIdParcelamento)+',   '+qryTitular.FieldByName('IDPESSJUR').AsString+' ,  '+
                      ' '+qryTitular.FieldByName('IDPLANOPREV').AsString+',   '+
                      ' '+qryTitular.FieldByName('IDPESSOA').AsString+' , '+
                      ' '''+sFlgDescFolha+''' , NULL , 0,  1,  NULL, '+
                      ' NULL, NULL, 1, NULL, NULL, '+
                      ' NULL,  NULL,  '+oranumero(edParticipante.text)+' ,   '+
                      ' '+oranumero(edPatrocinadora.text)+' ,  '+oranumero(edTotalCarencia.text)+',   '+
                      ' '+oranumero(spCarencia.text)+' '+ 
                      ' FROM  DUAL ';
   try
      qryaux.execsql;
   except
      exit;
   end;


   result := true;
end;

// XAVIER
function TfrmParcelamento.Desfazhistoricocontrib(qryaux : twwquery) : Boolean;
begin
   result := false;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM CM.HSTATRASOCONTRIB T '+
                 ' WHERE EXISTS  ( SELECT 1 FROM HSTCONTRIBPREV ' +
                 '                 WHERE  MESCOBRANCA    = T.MESCOBRANCA AND  '+
                 '                 MESREFERENCIA         = T.MESREFERENCIA AND '+
                 '                 IDMOTIVO              = T.IDMOTIVO  AND '+
                 '                 NUMRECEBIMENTO        = T.NUMRECEBIMENTO AND '+
                 '                 IDPESSJUR             = '+qrytitular.fieldbyname('IDPESSJUR').Asstring+' AND  '+
                 '                 IDPLANOPREV           = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' AND '+
                 '                 IDPESSOA              = '+qrytitular.fieldbyname('IDPESSOA').Asstring+' AND       '+
                 '                 SEQPROPOSTA           = '+qrytitular.fieldbyname('SEQPROPOSTA').Asstring+' AND   '+
                 '                 SITRECEBIMENTO        = ''0'' )');
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;//try


  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM HSTCONTRIBPREV '+
                 ' WHERE  IDPESSJUR =  '+qrytitular.fieldbyname('IDPESSJUR').Asstring+' AND  '+
                 '        IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' AND '+
                 '        IDPESSOA = '+qrytitular.fieldbyname('IDPESSOA').Asstring+' AND       '+
                 '        SEQPROPOSTA = '+qrytitular.fieldbyname('SEQPROPOSTA').Asstring+' AND   '+
                 '        SITRECEBIMENTO = ''0'' ');
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;//try


   result := true;
end;

// XAVIER
function TfrmParcelamento.DesfazSetIdParcelCarencia(qryaux : twwquery) : Boolean;
begin
   result := false;

   qryaux.close;
   qryaux.sql.text := ' DELETE FROM PARCELAMENTO '+
                      ' WHERE  IDPESSJUR    = '+qryTitular.FieldByName('IDPESSJUR').AsString+' '+
                      ' AND    IDPLANOPREV  = '+qryTitular.FieldByName('IDPLANOPREV').AsString+' '+
                      ' AND    IDPESSOA     = '+qryTitular.FieldByName('IDPESSOA').AsString+' ' +
                      ' AND    IDPARCELAMENTO IN ( '+ sIdparcelas +' ) ';
   try
      qryaux.execsql;
   except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
   end;//try
   result := true;
end;
// XAVIER

// XAVIER


procedure TfrmParcelamento.BitBtn6Click(Sender: TObject);
begin
  inherited;
   if dtmBaseDados.dbBaseDados.InTransaction
   then  dtmBaseDados.dbBaseDados.Rollback;

   spCarencia.enabled := false;

   tbsGrid.TabVisible := false;
   tbsGrid.enabled := false;
   tbcpcarencia.TabVisible := true;
   tbcpcarencia.enabled := True;
   pgctrlCobrancas.ActivePage := tbcpcarencia;


   //lblminimo.caption := 'Mínimo: '+floattostr(prmPercMinDesc);
   //lblmaximo.caption := 'Máximo: '+floattostr(prmPercMaxDesc);


   qryopcoescontrib.Close;
   qryopcoescontrib.Open;

   if trim(qrytitular.fieldbyname('IDREGRACARENCIA').AsString) = '' then
   begin
      MsgDlg('Regra de cálculo de tempo de carência não associada. Verificar cadastro.','Erro',mtError,[mbOk],0);
      qryTitular.close;
      memtitular.lines.clear;
      qryopcoescontrib.close;
      sbtnProcParticipClick(self);
      exit;
   end
   else    edCarenciaMeses.Text :=  FloatToStr(CalculaTpCarencia( qryAux,
                            qrytitular.fieldbyname('IDREGRACARENCIA').AsString,
                            qrytitular.fieldbyname('IDPESSJUR').AsInteger,
                            qrytitular.fieldbyname('IDPLANOPREV').AsInteger,
                            qrytitular.fieldbyname('IDPESSOA').AsInteger ,
                            qrytitular.fieldbyname('SEQPROPOSTA').AsInteger));




   try // Renato Visoni SOL 132620 Kintana 769854
   if trunc(strTofloat(edCarenciaMeses.Text)) <= 0 then begin
      MsgDlg('Não existe carência restante para este participante.','Aviso',mtWarning,[mbOk],0);
      qryTitular.close;
      memtitular.lines.clear;
      qryopcoescontrib.close;
      sbtnProcParticipClick(self);
      exit;
   end;
   except
      exit;
   end;


   spCarencia.enabled := true;
   spCarencia.MinValue := 0;
   spCarencia.MaxValue := trunc(strTofloat(edCarenciaMeses.Text));// Renato Visoni SOL 132620 Kintana 769854
   spCarencia.Value := trunc(strTofloat(edCarenciaMeses.Text));// Renato Visoni SOL 132620 Kintana 769854

   qryCpCarencia.close;
   qryCpCarencia.ParamByName('IdPessoa').AsInteger    := qryTitular.FieldByName('IdPessoa').AsInteger;
   qryCpCarencia.ParamByName('IdPessJur').AsInteger   := qryTitular.FieldByName('IdPessJur').AsInteger;
   qryCpCarencia.ParamByName('IdPlanoPrev').AsInteger := qryTitular.FieldByName('IdPlanoPrev').AsInteger;
   qryCpCarencia.open;

end;

procedure TfrmParcelamento.qrycontribuicaocarenciaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  rTotDivida.enabled := not qrycontribuicaocarencia.IsEmpty;
  rSalBase.enabled := not qrycontribuicaocarencia.IsEmpty;
  redPercSeguro.enabled := not qrycontribuicaocarencia.IsEmpty;
  BtnCancela.enabled := not qrycontribuicaocarencia.IsEmpty;
  BtnProximo.enabled := not qrycontribuicaocarencia.IsEmpty;
end;

procedure TfrmParcelamento.qrycontribuicaocarenciaCalcFields(
  DataSet: TDataSet);
var iposbarra : Integer;
begin
  inherited;
  if qrycontribuicaocarencia.FieldByName('FlgDescFolha').AsInteger = 1
  then qrycontribuicaocarencia.FieldByName('TipoPgmto').AsString := 'Folha'
  else qrycontribuicaocarencia.FieldByName('TipoPgmto').AsString := 'Banco';


  if (iIdCalculoDivida > 0)  and ( not qryaux.isempty) then
  begin
     qryaux.first;
     while not qryaux.eof do
     begin
        iposbarra := pos('/',qryaux.fieldbyname('VALOR').AsString);

        if qrycontribuicaocarencia.fieldbyname('NUMRECEBIMENTO').AsInteger =
           StrToInt(copy(qryaux.fieldbyname('VALOR').AsString,1,iposbarra -1)) then
        begin
           if uppercase(copy(qryaux.fieldbyname('DESCRICAO').AsString,1,1)) = 'J' then
              qrycontribuicaocarencia.fieldbyname('JUROS').AsFloat := StrToFloat(clientenumero(copy(qryaux.fieldbyname('VALOR').AsString,iposbarra +1,
                                                              length(qryaux.fieldbyname('VALOR').AsString) - iposbarra)))
           else if uppercase(copy(qryaux.fieldbyname('DESCRICAO').AsString,1,1)) = 'M' then
              qrycontribuicaocarencia.fieldbyname('MULTA').AsFloat := StrToFloat(clientenumero(copy(qryaux.fieldbyname('VALOR').AsString,iposbarra +1,
                                                              length(qryaux.fieldbyname('VALOR').AsString) - iposbarra)))
           else if uppercase(copy(qryaux.fieldbyname('DESCRICAO').AsString,1,1)) = 'C' then
              qrycontribuicaocarencia.fieldbyname('CORRECAO').AsFloat := StrToFloat(clientenumero(copy(qryaux.fieldbyname('VALOR').AsString,iposbarra +1,
                                                              length(qryaux.fieldbyname('VALOR').AsString) - iposbarra)));
        end;


        qryaux.next;
     end;//while



  end;


end;

procedure TfrmParcelamento.SpeedBtton1Click(Sender: TObject);
var i: Integer;
    bMarca, bPrimeiro : Boolean;
begin
  inherited;

  i := 0;
  bMarca := false;
  bPrimeiro := false;


  if redIntervalo.Value > 0 then
  begin

     while not qryopcoes.eof do
     begin


        if bMarca then
        begin
           inc(i);
           bPrimeiro := false;
        end;

        if (qryopcoes.fieldbyname('FlgSelecionado').AsInteger = 1) and (i =0)
        then
        begin
           bPrimeiro := true;
           bMarca := true;
        end;


        if  redIntervalo.Value = i then
        begin
           qryopcoes.edit;
           qryopcoes.fieldbyname('FlgSelecionado').AsInteger := 1;
           qryopcoes.post;

           i :=0;
        end
        else if not bPrimeiro then
        begin
           qryopcoes.edit;
           qryopcoes.fieldbyname('FlgSelecionado').AsInteger := 0;
           qryopcoes.post;
        end;

        qryopcoes.next;
     end;

     if not bMarca then
     begin
        qryopcoes.first;
        qryopcoes.edit;
        qryopcoes.fieldbyname('FlgSelecionado').AsInteger := 1;
        qryopcoes.post;
        SpeedBtton1Click(self);
     end;
  end
  else
  begin
     qryopcoes.first;
     while not qryopcoes.eof do
     begin
        qryopcoes.edit;
        qryopcoes.fieldbyname('FlgSelecionado').AsInteger := 1;
        qryopcoes.post;
        qryopcoes.next;
     end;
  end;

  qryopcoes.first;
end;

procedure TfrmParcelamento.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  qryopcoes.first;
  while not qryopcoes.eof do
  begin
     qryopcoes.edit;
     qryopcoes.fieldbyname('FlgSelecionado').AsInteger := 0;
     qryopcoes.post;     
     qryopcoes.next;
  end;

  qryopcoes.first;
end;

procedure TfrmParcelamento.pmmVisualisaDivergTratadasClick(
  Sender: TObject);
begin
  inherited;
  pmmVisualisaDivergTratadas.Checked := (Not pmmVisualisaDivergTratadas.Checked);

  If pgctrlCobrancas.ActivePage = tbFinanc
   Then Begin
     qryHstParcelamento.Filter := 'SITRECEBIMENTO <> 4';

     qryHstParcelamento.Filtered := pmmVisualisaDivergTratadas.Checked;

     qryHstParcelamento.Prior;
     qryHstParcelamento.Next;
   End
   Else Begin
     dsContribuicao.DataSet.Filter   := 'SITRECEBIMENTO <> 4';

     dsContribuicao.DataSet.Filtered := pmmVisualisaDivergTratadas.Checked;

     dsContribuicao.DataSet.Prior;
     dsContribuicao.DataSet.Next;
   End;
end;


procedure TfrmParcelamento.btnSairParamClick(Sender: TObject);
begin
  inherited;
{}
end;

procedure TfrmParcelamento.btnAlteraClick(Sender: TObject);
begin
  inherited;

  //Renato Visoni SOL 40370 Kintana 525322
  if qryParcelamento.Active then begin
    qryParcelamento.Edit;
    DBRealEdit1.Enabled := true;
    DBRealEdit1.SetFocus;
  end;

  btnConfirma.Visible := True;
  btnAltera.Visible   := False;

  //Fim Renato Visoni SOL 40370 Kintana 525322

end;

procedure TfrmParcelamento.DBRealEdit1Exit(Sender: TObject);
begin
  inherited;

  //Renato Visoni SOL 40370 Kintana 525322 

  if DBRealEdit1.Value > rdbNumarcelas.Value then begin
    if DBRealEdit1.CanFocus then DBRealEdit1.SetFocus;
    Exit;
  end;

  rParcelasaPagar.Value := (rdbNumarcelas.Value - DBRealEdit1.Value);

  //Renato Visoni SOL 40370 Kintana 525322

end;

procedure TfrmParcelamento.btnConfirmaClick(Sender: TObject);
begin
  inherited;

  //Renato Visoni SOL 40370 Kintana 525322
  DBRealEdit1.Enabled   := False;
  
  qryParcelamento.post;

  AplicaAlteracoes([qryParcelamento]);

  btnConfirma.Visible := False;
  btnAltera.Visible   := True;


  pgctrlCobrancas.Visible := False;
  PreencheDadosTitular(StrToInt(MontaSelectPart.ValoresChave[0]), StrToInt(MontaSelectPart.ValoresChave[1]), StrToInt(MontaSelectPart.ValoresChave[2]), StrToInt(MontaSelectPart.ValoresChave[16]),false);
  pgctrlCobrancas.Visible := True;

  if not qryParcelamento.isempty then
  begin
    tbFinanc.TabVisible := true;
    pgctrlCobrancas.ActivePage := tbFinanc;
  end;



end;

//SIG102312 - Taffarel - início
procedure TfrmParcelamento.edtotdividapartExit(Sender: TObject);
begin
  inherited;
  if edtotdividapart.text = '' then edtotdividapart.text := '0';
  rTotDivida.text := FormatFloat('#0.00', strtofloat(edtotdividapart.text) + strtofloat(edtotdividapatro.text));
  edtotdividapart.text := FormatFloat('#0.00', strtofloat(edtotdividapart.text));
end;

procedure TfrmParcelamento.edtotdividapatroExit(Sender: TObject);
begin
  inherited;
  if edtotdividapatro.text = '' then edtotdividapatro.text := '0';
  rTotDivida.text := FormatFloat('#0.00', strtofloat(edtotdividapart.text) + strtofloat(edtotdividapatro.text));
  edtotdividapatro.text := FormatFloat('#0.00', strtofloat(edtotdividapatro.text));
end;

procedure TfrmParcelamento.rSalBaseExit(Sender: TObject);
begin
  inherited;
  rSalBase.text := FormatFloat('#0.00', strtofloat(rSalBase.text));
end;
//SIG102312 - Taffarel - fim

end.




